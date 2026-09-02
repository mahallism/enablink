#!/usr/bin/env bash
# Per-boot initialization (idempotent)
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
LARAVEL_DIR="${ROOT}/laravel"

if [[ -f "${LARAVEL_DIR}/artisan" ]]; then
  cd "${LARAVEL_DIR}"
  php artisan config:clear --quiet 2>/dev/null || true
  echo "Laravel dev ready at ${LARAVEL_DIR}"
else
  echo "Laravel belum di-install — jalankan install phase dulu"
fi

exit 0
