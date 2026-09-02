# Rotasi Kredensial (Wajib)

Kredensial berikut pernah terekspos di riwayat Git repository. **Rotasi segera** di server produksi dan layanan terkait, meskipun `.env` sudah dihapus dari tracking Git.

## Yang perlu dirotasi

| Layanan | Variabel / lokasi | Tindakan |
|---------|-------------------|----------|
| MySQL | `DB_PASSWORD` di `.env` | Ganti password user DB di phpMyAdmin/Plesk |
| MySQL (automation lama) | `automation/accompaniment_check.php` | Password `u363797047_udin` — rotasi jika masih dipakai |
| Gmail SMTP | `MAIL_SMTP_PASS` | Buat App Password baru, nonaktifkan yang lama |
| Firebase | `FIREBASE_SERVER_KEY` | Regenerate di Firebase Console → Cloud Messaging |

## Setelah rotasi

1. Update file `.env` di server produksi (bukan di Git)
2. Salin dari `.env.example` jika setup baru: `cp .env.example .env`
3. Set `ENVIRONMENT=production` di `.env` production
4. Verifikasi aplikasi dan cron automation masih jalan

## Pencegahan

- `.env` sudah di `.gitignore` dan dihapus dari tracking Git
- `application/config/database.php` tidak lagi menyimpan password fallback
- Script `automation/` hanya bisa dijalankan via CLI (bukan browser)
