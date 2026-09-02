#!/usr/bin/env bash
# Idempotent bootstrap untuk Cloud Agent — Laravel + MySQL dev
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "=== Enablink dev environment install ==="

# PHP & Composer (asumsi base image sudah punya PHP 8.2+)
if ! command -v php &>/dev/null; then
  echo "PHP tidak ditemukan — install via apt..."
  sudo apt-get update -qq
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
    php8.2-cli php8.2-mysql php8.2-mbstring php8.2-xml php8.2-curl \
    php8.2-zip php8.2-bcmath php8.2-intl unzip git curl
fi

if ! command -v composer &>/dev/null; then
  echo "Install Composer..."
  curl -sS https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/local/bin/composer
fi

# Laravel app di subdirectory (tidak mengganggu backup CI di root)
LARAVEL_DIR="${ROOT}/laravel"
if [[ ! -f "${LARAVEL_DIR}/artisan" ]]; then
  echo "Create Laravel 11 project di laravel/..."
  composer create-project laravel/laravel "${LARAVEL_DIR}" "^11.0" --no-interaction
fi

cd "${LARAVEL_DIR}"

# .env dev jika belum ada
if [[ ! -f .env ]]; then
  cp .env.example .env
  php artisan key:generate --force
  # SQLite untuk dev cloud agent (tanpa MySQL eksternal)
  sed -i 's/DB_CONNECTION=mysql/DB_CONNECTION=sqlite/' .env
  sed -i 's/# DB_DATABASE=laravel/DB_DATABASE=database\/database.sqlite/' .env
  touch database/database.sqlite
fi

composer install --no-interaction --prefer-dist

php artisan migrate --force --no-interaction 2>/dev/null || true

# Symlink docs ke laravel jika perlu
echo "Install selesai. Laravel dev: ${LARAVEL_DIR}"
