#!/usr/bin/env bash
#
# deploy-plesk.sh — Deploy Laravel Enablink di Plesk UB
#
# Usage:
#   ./scripts/deploy-plesk.sh [--skip-composer] [--skip-migrate] [--skip-cache]
#
# Environment variables (optional):
#   APP_ROOT     — Path root Laravel (default: auto-detect)
#   PHP_BIN      — Path binary PHP (default: php)
#   DEPLOY_ENV   — production|staging (default: production)
#
# Referensi: docs/DEPLOY-PLESK-UB.md

set -euo pipefail

# ── Konfigurasi ──────────────────────────────────────────────────────────────

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_ROOT="${APP_ROOT:-$(cd "${SCRIPT_DIR}/.." && pwd)}"
PHP_BIN="${PHP_BIN:-php}"
DEPLOY_ENV="${DEPLOY_ENV:-production}"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
LOG_DIR="${APP_ROOT}/../logs"
LOG_FILE="${LOG_DIR}/deploy-${TIMESTAMP}.log"

SKIP_COMPOSER=false
SKIP_MIGRATE=false
SKIP_CACHE=false

# ── Parse arguments ──────────────────────────────────────────────────────────

for arg in "$@"; do
  case "$arg" in
    --skip-composer) SKIP_COMPOSER=true ;;
    --skip-migrate)  SKIP_MIGRATE=true ;;
    --skip-cache)    SKIP_CACHE=true ;;
    -h|--help)
      echo "Usage: $0 [--skip-composer] [--skip-migrate] [--skip-cache]"
      exit 0
      ;;
    *)
      echo "Unknown argument: $arg" >&2
      exit 1
      ;;
  esac
done

# ── Logging ──────────────────────────────────────────────────────────────────

mkdir -p "${LOG_DIR}"

log() {
  local msg="[$(date '+%Y-%m-%d %H:%M:%S')] $*"
  echo "$msg" | tee -a "${LOG_FILE}"
}

die() {
  log "ERROR: $*"
  exit 1
}

# ── Pre-flight checks ────────────────────────────────────────────────────────

log "=== Deploy Enablink Laravel (${DEPLOY_ENV}) ==="
log "APP_ROOT=${APP_ROOT}"

[[ -f "${APP_ROOT}/artisan" ]] || die "artisan tidak ditemukan di ${APP_ROOT}. Pastikan APP_ROOT menunjuk ke root Laravel."

# Mode maintenance
cd "${APP_ROOT}"

# Cek PHP version (minimal 8.2)
PHP_VERSION="$("${PHP_BIN}" -r 'echo PHP_MAJOR_VERSION.".".PHP_MINOR_VERSION;')"
log "PHP version: ${PHP_VERSION}"

PHP_MAJOR="${PHP_VERSION%%.*}"
PHP_MINOR="${PHP_VERSION#*.}"
if [[ "${PHP_MAJOR}" -lt 8 ]] || [[ "${PHP_MAJOR}" -eq 8 && "${PHP_MINOR}" -lt 2 ]]; then
  die "PHP 8.2+ diperlukan. Saat ini: ${PHP_VERSION}. Ajukan upgrade ke TIK (lihat docs/DEPLOY-PLESK-UB.md)."
fi

# Cek .env
[[ -f "${APP_ROOT}/.env" ]] || die ".env tidak ditemukan. Salin dari .env.example dan isi kredensial."

# Cek APP_KEY
if ! grep -q '^APP_KEY=base64:' "${APP_ROOT}/.env" 2>/dev/null; then
  log "APP_KEY belum diset — generate..."
  "${PHP_BIN}" artisan key:generate --force 2>&1 | tee -a "${LOG_FILE}"
fi

# ── Maintenance mode ─────────────────────────────────────────────────────────

log "Enable maintenance mode..."
"${PHP_BIN}" artisan down --retry=60 --secret="enablink-deploy-${TIMESTAMP}" 2>&1 | tee -a "${LOG_FILE}" || true

cleanup() {
  log "Disable maintenance mode..."
  "${PHP_BIN}" artisan up 2>&1 | tee -a "${LOG_FILE}" || true
}
trap cleanup EXIT

# ── Git pull (jika di repo git) ──────────────────────────────────────────────

if [[ -d "${APP_ROOT}/.git" ]]; then
  log "Git fetch & pull..."
  git -C "${APP_ROOT}" fetch --all 2>&1 | tee -a "${LOG_FILE}" || log "WARN: git fetch gagal (lanjut)"
  git -C "${APP_ROOT}" pull --ff-only 2>&1 | tee -a "${LOG_FILE}" || log "WARN: git pull gagal (lanjut)"
fi

# ── Composer install ─────────────────────────────────────────────────────────

if [[ "${SKIP_COMPOSER}" == "false" ]]; then
  log "Composer install (--no-dev --optimize-autoloader)..."
  if command -v composer &>/dev/null; then
    COMPOSER_MEMORY_LIMIT=-1 composer install \
      --no-dev \
      --optimize-autoloader \
      --no-interaction \
      --working-dir="${APP_ROOT}" 2>&1 | tee -a "${LOG_FILE}"
  else
    log "WARN: composer tidak ditemukan di PATH — lewati (install manual via Plesk)"
  fi
else
  log "Skip composer (--skip-composer)"
fi

# ── Storage link ─────────────────────────────────────────────────────────────

if [[ ! -L "${APP_ROOT}/public/storage" ]]; then
  log "Create storage symlink..."
  "${PHP_BIN}" artisan storage:link 2>&1 | tee -a "${LOG_FILE}" || true
fi

# ── Database migration ───────────────────────────────────────────────────────

if [[ "${SKIP_MIGRATE}" == "false" ]]; then
  log "Run migrations..."
  "${PHP_BIN}" artisan migrate --force 2>&1 | tee -a "${LOG_FILE}"
else
  log "Skip migrate (--skip-migrate)"
fi

# ── Clear & rebuild cache ────────────────────────────────────────────────────

if [[ "${SKIP_CACHE}" == "false" ]]; then
  log "Clear old cache..."
  "${PHP_BIN}" artisan config:clear 2>&1 | tee -a "${LOG_FILE}" || true
  "${PHP_BIN}" artisan route:clear 2>&1 | tee -a "${LOG_FILE}" || true
  "${PHP_BIN}" artisan view:clear 2>&1 | tee -a "${LOG_FILE}" || true
  "${PHP_BIN}" artisan cache:clear 2>&1 | tee -a "${LOG_FILE}" || true

  log "Rebuild production cache..."
  "${PHP_BIN}" artisan config:cache 2>&1 | tee -a "${LOG_FILE}"
  "${PHP_BIN}" artisan route:cache 2>&1 | tee -a "${LOG_FILE}"
  "${PHP_BIN}" artisan view:cache 2>&1 | tee -a "${LOG_FILE}"
else
  log "Skip cache (--skip-cache)"
fi

# ── Permissions ──────────────────────────────────────────────────────────────

log "Set permissions storage & bootstrap/cache..."
chmod -R ug+rwx "${APP_ROOT}/storage" "${APP_ROOT}/bootstrap/cache" 2>/dev/null || true

# ── Sync public → httpdocs (opsional) ────────────────────────────────────────

HTTPDOCS="${APP_ROOT}/../httpdocs"
if [[ -d "${HTTPDOCS}" ]] && [[ "${APP_ROOT}/public" != "${HTTPDOCS}" ]]; then
  log "Sync public/ → httpdocs/..."
  rsync -a --delete \
    --exclude='.git*' \
    "${APP_ROOT}/public/" "${HTTPDOCS}/" 2>&1 | tee -a "${LOG_FILE}" || log "WARN: rsync gagal"
fi

# ── Post-deploy health check ─────────────────────────────────────────────────

POST_DEPLOY="${SCRIPT_DIR}/post-deploy.sh"
if [[ -x "${POST_DEPLOY}" ]]; then
  log "Run post-deploy health check..."
  APP_ROOT="${APP_ROOT}" PHP_BIN="${PHP_BIN}" "${POST_DEPLOY}" 2>&1 | tee -a "${LOG_FILE}" || die "Post-deploy check gagal"
elif [[ -f "${POST_DEPLOY}" ]]; then
  log "Run post-deploy (non-executable)..."
  APP_ROOT="${APP_ROOT}" PHP_BIN="${PHP_BIN}" bash "${POST_DEPLOY}" 2>&1 | tee -a "${LOG_FILE}" || die "Post-deploy check gagal"
fi

# ── Selesai ──────────────────────────────────────────────────────────────────

log "=== Deploy selesai ==="
log "Log: ${LOG_FILE}"
log "Maintenance bypass secret: enablink-deploy-${TIMESTAMP}"
log "URL bypass: ?secret=enablink-deploy-${TIMESTAMP}"

exit 0
