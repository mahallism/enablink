# Panduan Deploy Laravel Enablink di Plesk UB

Panduan praktis deploy aplikasi **Enablink Laravel** di shared hosting **Plesk Universitas Brawijaya**, menggantikan/melengkapi CodeIgniter 3 yang saat ini berjalan di `enbalink.ub.ac.id`.

**Quota hosting:** ~2 GB (termasuk DB, file upload, log)  
**PHP target:** 8.2+  
**Web server:** Apache/Nginx via Plesk

---

## Prasyarat

| Item | Keterangan |
|------|------------|
| Akses Plesk | Akun hosting SLDPI / koordinasi TIK |
| PHP 8.2+ | Ekstensi: `mbstring`, `openssl`, `pdo_mysql`, `tokenizer`, `xml`, `ctype`, `json`, `bcmath`, `fileinfo`, `curl` |
| Composer | Via SSH atau Plesk «Composer» (jika tersedia) |
| MySQL/MariaDB | Database `db_enablink` existing |
| Git | Deploy dari repo `mahallism/enablink` atau fork Laravel |
| SSL | Let's Encrypt via Plesk (wajib untuk Sanctum/cookie) |

---

## Struktur direktori di Plesk

```
/var/www/vhosts/enbalink.ub.ac.id/
├── httpdocs/              ← Document root (public Laravel)
│   ├── index.php
│   ├── .htaccess
│   └── ...
├── laravel/               ← Root aplikasi (di luar httpdocs, lebih aman)
│   ├── app/
│   ├── bootstrap/
│   ├── config/
│   ├── .env               ← TIDAK di Git
│   ├── storage/           ← writable
│   └── vendor/
├── logs/
│   └── deploy-*.log
└── backups/
```

**Alternatif staging:** subdomain `staging.enbalink.ub.ac.id` dengan docroot terpisah.

### Symlink document root

Di Plesk → **Hosting Settings** → Document root: `httpdocs` yang berisi isi folder `public/` Laravel.

Atau via SSH:

```bash
# Contoh: laravel di ../laravel, public di httpdocs
rsync -a --delete laravel/public/ httpdocs/
# Atau symlink (jika Plesk mengizinkan):
# ln -sfn ../laravel/public/* httpdocs/
```

---

## PHP 8.2 di Plesk

1. **Plesk** → Domain → **PHP Settings**
2. Pilih **PHP 8.2.x** (atau 8.3 jika disetujui TIK)
3. Aktifkan:
   - `memory_limit` ≥ 256M
   - `max_execution_time` ≥ 120 (untuk artisan migrate)
   - `upload_max_filesize` ≥ 10M (foto profil/dokumen)
4. Nonaktifkan `display_errors` di produksi
5. Set **`open_basedir`** sesuai kebijakan UB (biasanya sudah default Plesk)

### Verifikasi

```bash
php -v
php -m | grep -E 'pdo_mysql|mbstring|openssl|curl'
```

---

## Template `.env` produksi

Salin dari `.env.example`; **jangan** commit file `.env` ke Git.

```dotenv
APP_NAME=Enablink
APP_ENV=production
APP_KEY=base64:GENERATE_DENGAN_php_artisan_key:generate
APP_DEBUG=false
APP_URL=https://enbalink.ub.ac.id

LOG_CHANNEL=stack
LOG_LEVEL=warning

DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=db_enablink
DB_USERNAME=ISI_DARI_PLESK
DB_PASSWORD=ISI_DARI_PLESK

BROADCAST_DRIVER=log
CACHE_DRIVER=file
FILESYSTEM_DISK=local
QUEUE_CONNECTION=database
SESSION_DRIVER=file
SESSION_LIFETIME=120

MAIL_MAILER=smtp
MAIL_HOST=smtp.ub.ac.id
MAIL_PORT=587
MAIL_USERNAME=psldbrawijaya@ub.ac.id
MAIL_PASSWORD=ISI_DARI_ADMIN
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS=psldbrawijaya@ub.ac.id
MAIL_FROM_NAME="${APP_NAME}"

# WhatsApp (Fase 3b) — pilih satu provider
WHATSAPP_DRIVER=fonnte
FONNTE_TOKEN=ISI_TOKEN
# WABLAS_TOKEN=ISI_TOKEN

# Firebase FCM (Fase 5b)
FCM_SERVER_KEY=ISI_DARI_FIREBASE_CONSOLE

SANCTUM_STATEFUL_DOMAINS=enbalink.ub.ac.id
SESSION_DOMAIN=.enbalink.ub.ac.id
```

Generate key:

```bash
cd /var/www/vhosts/enbalink.ub.ac.id/laravel
php artisan key:generate --force
```

---

## Deploy via Git (Plesk Git extension)

### Setup awal

1. Plesk → **Git** → Add repository
2. URL: `https://github.com/mahallism/enablink.git` (branch `main` atau `production`)
3. Deploy path: `/var/www/vhosts/enbalink.ub.ac.id/laravel`
4. **Deploy actions** (post-receive hook):

```bash
#!/bin/bash
set -euo pipefail
/var/www/vhosts/enbalink.ub.ac.id/laravel/scripts/deploy-plesk.sh
```

5. Centang «Enable additional deploy actions»

### Deploy manual via SSH

```bash
cd /var/www/vhosts/enbalink.ub.ac.id/laravel
git pull origin main
./scripts/deploy-plesk.sh
./scripts/post-deploy.sh
```

Lihat skrip lengkap: [`scripts/deploy-plesk.sh`](../scripts/deploy-plesk.sh)

---

## Cron & Scheduler Laravel

Ganti cron standalone CI (`automation/accompaniment_check.php`) dengan Laravel Scheduler.

**Plesk** → **Scheduled Tasks** → Add task:

| Field | Nilai |
|-------|-------|
| Command | `cd /var/www/vhosts/enbalink.ub.ac.id/laravel && /usr/bin/php artisan schedule:run >> /dev/null 2>&1` |
| Schedule | Every minute (`* * * * *`) |
| Run as | User hosting domain |

### Job penting (daftarkan di `app/Console/Kernel.php`)

- Reminder jadwal H-1
- Update status pendampingan lewat (`AccompanimentStatusJob`) — pengganti logic bug di `accompaniment_check.php`
- Queue worker (jika `QUEUE_CONNECTION=database`):

```bash
# Task terpisah setiap menit atau supervisor jika VPS (shared hosting: cron)
* * * * * cd .../laravel && php artisan queue:work --stop-when-empty --max-time=55
```

---

## Quota 2 GB — manajemen ruang

| Area | Tips |
|------|------|
| **Vendor** | Jangan duplikasi `vendor/` di httpdocs; hanya di `laravel/` |
| **Log** | `LOG_LEVEL=warning`; rotasi via Plesk log rotation |
| **Storage** | Pindahkan upload lama ke `storage/app/public`; symlink `php artisan storage:link` |
| **Cache** | `php artisan config:cache` kecil; hindari cache view berlebihan di dev |
| **Backup SQL** | Simpan di luar hosting (Google Drive UB), bukan di repo |
| **Git** | `.gitignore` mengecualikan `*.sql`, `.env`, log deploy |

Monitor:

```bash
du -sh laravel/storage laravel/vendor httpdocs backups logs
```

Target: sisakan ≥ 300 MB buffer untuk operasi normal.

---

## Template tiket TIK / BITS

Salin dan sesuaikan saat mengajukan ke **TIK Universitas Brawijaya**:

---

**Subject:** Permintaan upgrade PHP 8.2 & konfigurasi cron — enbalink.ub.ac.id

**Unit:** Satuan Layanan Disabilitas dan Pendampingan Inklusi (SLDPI)  
**Domain:** enbalink.ub.ac.id  
**PIC:** [Nama] — [email] — [no HP]

**Latar belakang:**  
Aplikasi Enablink (pendampingan mahasiswa difabel UB) akan dimigrasi dari CodeIgniter 3 ke Laravel 11. CI saat ini berjalan di Plesk shared hosting UB.

**Permintaan:**

1. Upgrade PHP ke **8.2** (minimal) untuk domain `enbalink.ub.ac.id`
2. Aktifkan ekstensi PHP: `pdo_mysql`, `mbstring`, `openssl`, `tokenizer`, `xml`, `ctype`, `json`, `bcmath`, `fileinfo`, `curl`
3. Izinkan **cron setiap menit** untuk Laravel Scheduler:
   ```
   * * * * * cd /var/www/vhosts/enbalink.ub.ac.id/laravel && php artisan schedule:run
   ```
4. Konfirmasi **quota disk 2 GB** — apakah cukup untuk Laravel + DB + upload, atau opsi penambahan
5. Akses **SSH** untuk deploy Git (jika belum ada)
6. (Opsional) Subdomain **staging.enbalink.ub.ac.id** untuk UAT

**Dampak:** Migrasi bertahap; CI tetap aktif sampai cutover; tidak ada downtime direncanakan.

**Lampiran:** [ROADMAP-MIGRASi.md](./ROADMAP-MIGRASI.md) (opsional)

Terima kasih.

---

## Strangler fig — CI + Laravel bersamaan

Selama Fase 1–5, CI dan Laravel coexist:

```apache
# httpdocs/.htaccess (contoh)
RewriteEngine On

# Laravel staging/v2
RewriteRule ^v2/(.*)$ /index.php [L]

# Legacy CI (root selain /v2)
RewriteCond %{REQUEST_URI} !^/v2
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ /legacy/index.php/$1 [L]
```

Sesuaikan path `legacy/` dengan struktur backup CI di server.

---

## Troubleshooting

### 500 Internal Server Error setelah deploy

```bash
# Cek log Laravel
tail -50 laravel/storage/logs/laravel.log

# Cek log Apache Plesk
tail -50 /var/www/vhosts/enbalink.ub.ac.id/logs/error_log

# Permission storage
chmod -R ug+rwx laravel/storage laravel/bootstrap/cache
chown -R [plesk-user]:psacln laravel/storage
```

### `APP_KEY` missing

```bash
php artisan key:generate --force
php artisan config:cache
```

### Database connection refused

- Pastikan `DB_HOST=localhost` (bukan IP eksternal di shared hosting)
- Username/password dari Plesk → Databases
- User DB harus punya privilege ke `db_enablink`

### Composer memory limit

```bash
COMPOSER_MEMORY_LIMIT=-1 php /usr/local/bin/composer install --no-dev --optimize-autoloader
```

### Artisan migrate gagal (quota)

- Hapus backup SQL lama di server
- `composer install --no-dev` saja di produksi

### Cron tidak jalan

- Verifikasi path absolut PHP: `which php`
- Test manual: `php artisan schedule:list`
- Cek timezone: `APP_TIMEZONE=Asia/Jakarta` di `.env`

### SSL / mixed content

- `APP_URL` harus `https://`
- `TrustProxies` middleware jika di belakang load balancer UB

### Quota penuh

```bash
du -ah laravel/storage/logs | sort -rh | head -20
php artisan cache:clear
php artisan view:clear
# Rotasi log manual
```

---

## Checklist deploy produksi

- [ ] `.env` produksi lengkap, `APP_DEBUG=false`
- [ ] `php artisan migrate --force` (hanya migration baru, hati-hati di DB live)
- [ ] `php artisan config:cache && php artisan route:cache && php artisan view:cache`
- [ ] Permission `storage/` dan `bootstrap/cache/`
- [ ] Cron scheduler aktif
- [ ] `./scripts/post-deploy.sh` → semua check hijau
- [ ] Smoke test: login, halaman jadwal, API health
- [ ] Backup DB sebelum deploy major

---

## Dokumen terkait

- [ROADMAP-MIGRASI.md](./ROADMAP-MIGRASI.md) — fase deploy & cutover
- [AUDIT-CODEIGNITER.md](./AUDIT-CODEIGNITER.md) — baseline CI
- [`scripts/deploy-plesk.sh`](../scripts/deploy-plesk.sh)
- [`scripts/post-deploy.sh`](../scripts/post-deploy.sh)
