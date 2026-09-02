# Enablink — Sistem Pendampingan Mahasiswa Difabel UB

Backup aplikasi **Enablink** (CodeIgniter 3) dari produksi `enbalink.ub.ac.id`, dengan perencanaan migrasi bertahap ke **Laravel 11** menggunakan strategi strangler fig.

**Unit:** Satuan Layanan Disabilitas dan Pendampingan Inklusi (SLDPI) — Universitas Brawijaya  
**Repo:** [`mahallism/enablink`](https://github.com/mahallism/enablink)

---

## Tentang proyek

Enablink mengelola jadwal pendampingan volunteer untuk mahasiswa difabel UB: matching jadwal kuliah/ujian, izin, pergantian volunteer, laporan kehadiran, dan API mobile.

Stack saat ini (backup April 2022):

| Komponen | Teknologi |
|----------|-----------|
| Backend | CodeIgniter 3.1.8 + HMVC (Aplego) |
| Database | MySQL/MariaDB `db_enablink` |
| Hosting | Plesk shared hosting UB (~2 GB) |
| Mobile API | `contents/modules/api/` (REST) |

Target migrasi: **Laravel 11**, notifikasi terpusat, aplikasi **Flutter** Android/iOS.

---

## Dokumentasi

### Perencanaan migrasi

| Dokumen | Deskripsi |
|---------|-----------|
| [docs/ROADMAP-MIGRASI.md](docs/ROADMAP-MIGRASI.md) | Roadmap 9 bulan CI→Laravel, fase 0–6, strangler fig, tanpa downtime |
| [docs/AUDIT-CODEIGNITER.md](docs/AUDIT-CODEIGNITER.md) | Audit struktur CI: modul, database, temuan keamanan |
| [docs/PRIORITAS-PERBAIKAN.md](docs/PRIORITAS-PERBAIKAN.md) | Backlog P0–P5 dengan mapping ke fase roadmap |

### Operasional & fitur

| Dokumen | Deskripsi |
|---------|-----------|
| [docs/DEPLOY-PLESK-UB.md](docs/DEPLOY-PLESK-UB.md) | Deploy Laravel di Plesk UB: PHP 8.2, cron, `.env`, tiket TIK |
| [docs/NOTIFIKASI.md](docs/NOTIFIKASI.md) | Email, WhatsApp (Fonnte/Wablas), FCM — fase 3a/3b |
| [docs/MOBILE-APPS.md](docs/MOBILE-APPS.md) | Flutter Android/iOS, Sanctum API, fase 5a–5e, WCAG |

### Skrip deploy

| Skrip | Fungsi |
|-------|--------|
| [scripts/deploy-plesk.sh](scripts/deploy-plesk.sh) | Deploy otomatis Laravel di Plesk |
| [scripts/post-deploy.sh](scripts/post-deploy.sh) | Health check pasca deploy |

### Environment development

| File | Fungsi |
|------|--------|
| [.cursor/environment.json](.cursor/environment.json) | Cloud Agent: PHP 8.2, Laravel 11 di `laravel/` |

---

## Struktur repo (backup CI)

```
├── index.php              # Front controller CI
├── application/           # Core CI, REST libs
├── contents/              # Modul bisnis (Aplego HMVC)
├── system/                # CodeIgniter 3.1.8
├── assets/                # Static files
├── automation/            # Cron standalone (legacy)
├── docs/                  # Dokumentasi migrasi
├── scripts/               # Deploy & health check
└── enablink_struktur_prod.sql  # Canonical schema DB
```

---

## Status Fase 0 (persiapan)

| Tugas | Status |
|-------|--------|
| 0.1 Push backup CI ke GitHub | ✅ Selesai |
| 0.2 Audit kode CI | ✅ [AUDIT-CODEIGNITER.md](docs/AUDIT-CODEIGNITER.md) |
| 0.3 Ekspor database produksi | ⏳ Dari phpMyAdmin/SSH |
| 0.4 Dokumentasi ERD | ✅ `enablink_struktur_prod.sql` |
| 0.5 Konfirmasi TIK (PHP 8.2+) | ⏳ Template di DEPLOY-PLESK-UB |
| 0.6 Setup repo Laravel | ⏳ Fase 1 |
| 0.7 Environment development | ⏳ `.cursor/environment.json` |

---

## Langkah berikutnya

1. **Keamanan P0** — Rotasi kredensial di `automation/accompaniment_check.php`; perbaiki error reporting di `index.php`
2. **Ekspor DB** — Schema + data dev dari produksi; simpan di luar repo
3. **Tiket TIK** — Ajukan PHP 8.2 + cron (template: [DEPLOY-PLESK-UB.md](docs/DEPLOY-PLESK-UB.md))
4. **Stabilisasi CI** — Hapus duplikasi `admin-old/`, `modules2/`; perbaiki matching volunteer
5. **Fase 1 Laravel** — Inisialisasi di `laravel/` atau staging subdomain; deploy dengan `scripts/deploy-plesk.sh`

Detail prioritas: [PRIORITAS-PERBAIKAN.md](docs/PRIORITAS-PERBAIKAN.md)

---

## Lisensi & kontak

Aplikasi internal SLDPI Universitas Brawijaya.  
Kontak: psldbrawijaya@ub.ac.id
