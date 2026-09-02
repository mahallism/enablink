#!/usr/bin/env bash
#
# post-deploy.sh — Health check pasca deploy Laravel Enablink
#
# Usage:
#   ./scripts/post-deploy.sh
#   APP_ROOT=/path/to/laravel ./scripts/post-deploy.sh
#
# Exit code 0 = semua check lulus; non-zero = ada kegagalan kritis

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_ROOT="${APP_ROOT:-$(cd "${SCRIPT_DIR}/.." && pwd)}"
PHP_BIN="${PHP_BIN:-php}"

PASS=0
FAIL=0
WARN=0

check_pass() { echo "  ✓ $*"; PASS=$((PASS + 1)); }
check_fail() { echo "  ✗ $*" >&2; FAIL=$((FAIL + 1)); }
check_warn() { echo "  ⚠ $*"; WARN=$((WARN + 1)); }

echo "=== Post-deploy health check ==="
echo "APP_ROOT=${APP_ROOT}"
echo ""

cd "${APP_ROOT}" 2>/dev/null || { check_fail "Tidak dapat cd ke APP_ROOT"; exit 1; }

# ── 1. File & direktori penting ──────────────────────────────────────────────

echo "[1/7] File & direktori..."

[[ -f "${APP_ROOT}/artisan" ]]        && check_pass "artisan exists"        || check_fail "artisan missing"
[[ -f "${APP_ROOT}/.env" ]]            && check_pass ".env exists"            || check_fail ".env missing"
[[ -d "${APP_ROOT}/vendor" ]]          && check_pass "vendor/ exists"         || check_warn "vendor/ missing (composer install?)"
[[ -d "${APP_ROOT}/storage" ]]         && check_pass "storage/ exists"        || check_fail "storage/ missing"
[[ -w "${APP_ROOT}/storage/logs" ]]    && check_pass "storage/logs writable"  || check_fail "storage/logs NOT writable"
[[ -w "${APP_ROOT}/bootstrap/cache" ]] && check_pass "bootstrap/cache writable" || check_fail "bootstrap/cache NOT writable"

# ── 2. Environment ───────────────────────────────────────────────────────────

echo ""
echo "[2/7] Environment..."

if [[ -f "${APP_ROOT}/.env" ]]; then
  grep -q '^APP_KEY=base64:' "${APP_ROOT}/.env" && check_pass "APP_KEY set" || check_fail "APP_KEY not set"
  grep -q '^APP_DEBUG=false' "${APP_ROOT}/.env" && check_pass "APP_DEBUG=false (production)" || check_warn "APP_DEBUG not false — pastikan staging/dev only"
  grep -q '^DB_DATABASE=' "${APP_ROOT}/.env"   && check_pass "DB_DATABASE configured" || check_fail "DB_DATABASE missing"
else
  check_fail ".env not found"
fi

# ── 3. PHP & extensions ──────────────────────────────────────────────────────

echo ""
echo "[3/7] PHP runtime..."

PHP_VERSION="$("${PHP_BIN}" -r 'echo PHP_VERSION;' 2>/dev/null || echo 'unknown')"
echo "  PHP: ${PHP_VERSION}"

for ext in pdo_mysql mbstring openssl tokenizer xml ctype json fileinfo; do
  if "${PHP_BIN}" -m 2>/dev/null | grep -qi "^${ext}$"; then
    check_pass "ext-${ext}"
  else
    check_fail "ext-${ext} missing"
  fi
done

# ── 4. Artisan commands ──────────────────────────────────────────────────────

echo ""
echo "[4/7] Artisan..."

if "${PHP_BIN}" artisan --version &>/dev/null; then
  ARTISAN_VER="$("${PHP_BIN}" artisan --version 2>/dev/null)"
  check_pass "artisan OK (${ARTISAN_VER})"
else
  check_fail "artisan --version failed"
fi

if "${PHP_BIN}" artisan about --only=environment 2>/dev/null | grep -q 'production\|staging\|local'; then
  check_pass "artisan about OK"
else
  check_warn "artisan about inconclusive"
fi

# ── 5. Database connectivity ─────────────────────────────────────────────────

echo ""
echo "[5/7] Database..."

DB_CHECK="$("${PHP_BIN}" artisan db:show 2>&1 || true)"
if echo "${DB_CHECK}" | grep -qiE 'mysql|mariadb|Connection'; then
  check_pass "database connection OK"
else
  # Fallback: migrate:status
  if "${PHP_BIN}" artisan migrate:status &>/dev/null; then
    check_pass "database connection OK (via migrate:status)"
  else
    check_fail "database connection FAILED"
    echo "    ${DB_CHECK}" | head -3 >&2
  fi
fi

# ── 6. Route & config cache ──────────────────────────────────────────────────

echo ""
echo "[6/7] Cache..."

[[ -f "${APP_ROOT}/bootstrap/cache/config.php" ]] && check_pass "config cached" || check_warn "config not cached (run config:cache)"
[[ -f "${APP_ROOT}/bootstrap/cache/routes-v7.php" ]] && check_pass "routes cached" || check_warn "routes not cached (optional)"

# ── 7. HTTP health (opsional) ────────────────────────────────────────────────

echo ""
echo "[7/7] HTTP health (optional)..."

APP_URL=""
if [[ -f "${APP_ROOT}/.env" ]]; then
  APP_URL="$(grep '^APP_URL=' "${APP_ROOT}/.env" | cut -d= -f2- | tr -d '"' | tr -d "'")"
fi

if [[ -n "${APP_URL}" ]] && command -v curl &>/dev/null; then
  HTTP_CODE="$(curl -s -o /dev/null -w '%{http_code}' --max-time 10 "${APP_URL}/up" 2>/dev/null || echo '000')"
  if [[ "${HTTP_CODE}" == "200" ]]; then
    check_pass "HTTP ${APP_URL}/up → 200"
  else
    # Coba root
    HTTP_CODE_ROOT="$(curl -s -o /dev/null -w '%{http_code}' --max-time 10 "${APP_URL}/" 2>/dev/null || echo '000')"
    if [[ "${HTTP_CODE_ROOT}" =~ ^(200|302|301)$ ]]; then
      check_pass "HTTP ${APP_URL}/ → ${HTTP_CODE_ROOT}"
    else
      check_warn "HTTP health inconclusive (/up=${HTTP_CODE}, /=${HTTP_CODE_ROOT}) — mungkin maintenance mode"
    fi
  fi
else
  check_warn "HTTP check skipped (no APP_URL or curl)"
fi

# ── Ringkasan ────────────────────────────────────────────────────────────────

echo ""
echo "=== Summary ==="
echo "  Passed:   ${PASS}"
echo "  Warnings: ${WARN}"
echo "  Failed:   ${FAIL}"

if [[ "${FAIL}" -gt 0 ]]; then
  echo ""
  echo "POST-DEPLOY FAILED — perbaiki error di atas sebelum membuka traffic."
  exit 1
fi

echo ""
echo "POST-DEPLOY OK"
exit 0
