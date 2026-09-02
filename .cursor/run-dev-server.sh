#!/usr/bin/env bash
# Development server untuk Cloud Agent terminal
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
LARAVEL_DIR="${ROOT}/laravel"

if [[ ! -f "${LARAVEL_DIR}/artisan" ]]; then
  echo "Laravel tidak ditemukan. Tunggu install phase selesai."
  sleep 3600
  exit 0
fi

cd "${LARAVEL_DIR}"
echo "Starting Laravel dev server on http://0.0.0.0:8000 ..."
php artisan serve --host=0.0.0.0 --port=8000
