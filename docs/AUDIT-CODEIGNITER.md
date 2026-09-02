# Audit Struktur Aplikasi Enablink (CodeIgniter 3)

Audit terhadap backup kode di repo `mahallism/enablink` (branch `main`), April 2022 snapshot.

---

## Ringkasan Arsitektur

| Item | Nilai |
|------|-------|
| Framework | CodeIgniter **3.1.8** |
| Pola | HMVC (Modular Extensions / MX) + lapisan custom **Aplego** |
| Entry point | `index.php` → `contents/` sebagai aplikasi utama |
| Domain produksi | `enbalink.ub.ac.id` |
| Database | MySQL/MariaDB `db_enablink` |

```
/workspace/
├── index.php                 ← Front controller
├── application/              ← Core CI, REST libs, vendor (dotenv)
├── system/                   ← CodeIgniter 3.1.8
├── contents/                 ← Aplikasi bisnis (Aplego)
│   ├── config/               ← Routing, auth, menu admin/member
│   ├── core/                 ← Base controllers
│   ├── modules/              ← Modul aktif
│   ├── modules2/             ← Salinan parsial (legacy)
│   ├── models/               ← User, Option (shared)
│   └── libraries/            ← Aquery, Validation, Fcontrol
├── assets/                   ← Static (admin, member, front, APK)
├── apiv2/                    ← Stub kosong
└── automation/               ← Cron script standalone
```

---

## Peta Modul

### Member & Publik (`contents/modules/`)

| Modul | Controller | Fungsi |
|-------|-----------|--------|
| `welcome` | Welcome | Landing page |
| `user` | User, Register | Login, register, profil |
| `dashboard` | Dashboard | Dashboard member |
| `jadwal` | Jadwal, Ujian, Revisi, Pendampingan | Jadwal kuliah/ujian |
| `izin` | Izin, Permission | Izin pendampingan & cuti |
| `pergantian` | Pergantian_volunteer | Riwayat pergantian volunteer |
| `syaratketentuan` | Syaratketentuan | Syarat & ketentuan |
| `api` | Auth, Jadwal, Izin, Pendampingan, Profile, Master | REST API mobile |
| `errordocument` | Errordocument | Halaman error |

### Admin (`contents/modules/admin/`)

| Submodul | Fungsi |
|----------|--------|
| `dashboard` | Dashboard admin |
| `active` | Mahasiswa aktif (difabel, volunteer, register) |
| `jadwal` | Jadwal madif & volunteer (kuliah + ujian) |
| `pendampingan` | Generate & kelola jadwal pendampingan |
| `pendampingan_ganti` | Riwayat ganti pendamping |
| `izin` | Izin pendampingan & cuti |
| `report` | Laporan pendampingan & kehadiran volunteer |
| `pergantian` | Riwayat pergantian volunteer |
| `mahasiswa` / `admin` | CRUD mahasiswa & administrator |
| `fakultas`, `semester`, `difabel`, `preferensi` | Master data |
| `setting` | Pengaturan global & app |
| `payout` | Pembayaran volunteer (dinonaktifkan di menu) |

### Duplikasi legacy (hapus)

- `contents/modules/admin-old/` — salinan penuh modul admin
- `contents/modules/modules2/` — salinan parsial

### Role pengguna

`capability`: `volunteer`, `difabel`, `staf`, `admin`

---

## Peta Database

**Canonical schema:** `enablink_struktur_prod.sql` (struktur saja, ~65 KB)

### Tabel inti (18 + sessions)

| Grup | Tabel |
|------|-------|
| Framework | `aplego_options`, `aplego_user`, `aplego_user_meta` |
| Master | `app_faculties`, `app_majors`, `app_semester` |
| Mahasiswa | `app_students`, `app_student_active` |
| Jadwal | `app_schedule_student`, `app_schedule_volunteer`, `*_rev` |
| Operasional | `app_accompaniment`, `app_permit` |
| Lainnya | `app_notifications`, `app_payouts`, `app_payout_items` |
| Sistem | `ci_sessions` |

### View (20+)

`app_accompaniment_view`, `app_schedule_student_view`, `app_permit_view`, `app_report_volunteer_view`, `app_chart_accompainiment_*`, dll.

### Stored function

`get_json_jadwal_volunteer_day(semester_id, student_id, day_int)`

### Alur data inti

```
app_students → app_schedule_student / app_schedule_volunteer
            → app_accompaniment → app_permit
```

---

## Temuan Kritis

### Keamanan (P0)

1. Kredensial DB hardcoded di `automation/accompaniment_check.php`
2. `index.php` baris 124–125 memaksa `error_reporting(E_ALL)` dan `display_errors=1` — menimpa mode production
3. Password hashing phpass (WordPress-style), bukan bcrypt/argon2
4. Query SQL mentah di automation script

### Maintainability (P1–P2)

1. Tiga salinan modul (`modules/`, `modules2/`, `admin-old/`)
2. Controller monolitik: `admin/pendampingan/Pendampingan.php` >1100 baris
3. 8+ file SQL di root tanpa sumber kebenaran tunggal
4. Migration CI dinonaktifkan (`migration_enabled = false`)
5. `apiv2/v2/change_password.php` kosong
6. PHPUnit dikonfigurasi ke `./tests` yang tidak ada

### Fitur tidak maksimal (sesuai lapangan)

| Area | Temuan di kode |
|------|----------------|
| Matching volunteer | Filter fakultas/prodi di logic pendampingan |
| Notifikasi | `app_notifications` ada; koordinasi WA manual |
| Pergantian volunteer | Modul `pergantian` ada; algoritma Gale–Shapely perlu verifikasi di produksi |
| Jadwal ujian vs kuliah | `schedule_type` + controller terpisah (`Difabel_ujian`, `Ujian`) |
| Payout | Modul & tabel ada, menu dikomentari |
| Izin cuti member | Menu dikomentari di `contents/config/member.php` |
| Mobile API | `modules/api/` aktif; `apiv2/` stub |

---

## Status Fase 0 Roadmap

| Tugas | Status |
|-------|--------|
| 0.1 Push backup CI ke GitHub | ✅ Selesai |
| 0.2 Audit kode CI | ✅ Dokumen ini |
| 0.3 Ekspor database produksi | ⏳ Perlu dari server/phpMyAdmin |
| 0.4 Dokumentasi ERD | ✅ Ringkas di atas; detail di `enablink_struktur_prod.sql` |
| 0.5 Konfirmasi TIK/BITS (PHP 8.2+) | ⏳ Belum |
| 0.6 Setup repo Laravel | ⏳ Fase 1 |
| 0.7 Environment development | ⏳ Lihat `.cursor/environment.json` |

---

## Dokumen terkait

- [ROADMAP-MIGRASI.md](./ROADMAP-MIGRASI.md)
- [DEPLOY-PLESK-UB.md](./DEPLOY-PLESK-UB.md)
- [NOTIFIKASI.md](./NOTIFIKASI.md)
- [MOBILE-APPS.md](./MOBILE-APPS.md)
