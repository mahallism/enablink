# Roadmap Migrasi Enablink: CodeIgniter 3 → Laravel 11

Dokumen perencanaan migrasi aplikasi **Enablink** (SLDPI Universitas Brawijaya) dari backup CodeIgniter 3 di repo [`mahallism/enablink`](https://github.com/mahallism/enablink) ke Laravel 11, dengan strategi **strangler fig** dan **tanpa downtime** di produksi.

**Durasi rencana:** 9 bulan (36 minggu)  
**Domain produksi:** `enbalink.ub.ac.id`  
**Hosting:** Plesk shared hosting UB (quota ~2 GB)

---

## Prinsip migrasi

1. **Strangler fig** — Laravel hidup berdampingan dengan CI; modul dipindah satu per satu; reverse proxy / subpath mengarahkan traffic.
2. **Tanpa downtime** — CI tetap melayani `/` sampai cutover Fase 6; Laravel mulai di `/v2` atau subdomain staging.
3. **Schema existing** — Tabel MySQL `db_enablink` tidak di-rename; Eloquent memetakan ke struktur yang ada (lihat `enablink_struktur_prod.sql`).
4. **Rollback siap** — Setiap fase punya checkpoint: tag Git, backup DB, dan switch DNS/path kembali ke CI jika gagal.
5. **Prioritas bisnis** — Notifikasi, matching volunteer, dan mobile mengikuti urgensi lapangan (lihat [PRIORITAS-PERBAIKAN.md](./PRIORITAS-PERBAIKAN.md)).

---

## Diagram arsitektur (strangler fig)

```
                    ┌─────────────────────────────────────┐
                    │     enbalink.ub.ac.id (Plesk)       │
                    └─────────────────┬───────────────────┘
                                      │
                    ┌─────────────────▼───────────────────┐
                    │   Reverse proxy / .htaccess rules   │
                    └─────────┬───────────────┬───────────┘
                              │               │
              Fase 1–5        │               │  Fase 6 (cutover)
                              ▼               ▼
                    ┌─────────────┐   ┌─────────────┐
                    │  CI 3 (/)   │   │ Laravel 11  │
                    │  contents/  │   │  / atau /v2 │
                    └──────┬──────┘   └──────┬──────┘
                           │                 │
                           └────────┬────────┘
                                    ▼
                           ┌─────────────────┐
                           │  MySQL/MariaDB  │
                           │   db_enablink   │
                           └─────────────────┘
```

---

## Timeline 9 bulan

| Bulan | Fase | Fokus |
|-------|------|-------|
| 1 | 0–1 | Persiapan, audit, Laravel skeleton, staging |
| 2–3 | 2 | Modul inti: auth, dashboard, jadwal, pendampingan |
| 4 | 3 | Notifikasi email + in-app (3a), WA + FCM (3b) |
| 5 | 4 | API REST Sanctum, dokumentasi |
| 6–8 | 5 | Aplikasi mobile Flutter (5a–5e) |
| 9 | 6 | Cutover, pensiun CI, monitoring |

---

## Fase 0 — Persiapan & baseline (minggu 1–4)

**Tujuan:** Repo aman, schema terdokumentasi, prasyarat hosting jelas.

| # | Tugas | Status | Catatan |
|---|-------|--------|---------|
| 0.1 | Push backup CI ke GitHub | ✅ **DONE** | Repo `mahallism/enablink`, branch `main` |
| 0.2 | Audit kode CI | ✅ **DONE** | Lihat [AUDIT-CODEIGNITER.md](./AUDIT-CODEIGNITER.md) |
| 0.3 | Ekspor database produksi | ⏳ | Schema + data dev dari phpMyAdmin/SSH; **jangan** commit ke repo |
| 0.4 | Dokumentasi ERD / canonical schema | ✅ | `enablink_struktur_prod.sql` sebagai sumber kebenaran |
| 0.5 | Konfirmasi TIK/BITS (PHP 8.2+) | ⏳ | Template tiket: [DEPLOY-PLESK-UB.md](./DEPLOY-PLESK-UB.md) |
| 0.6 | Setup repo Laravel (branch/monorepo) | ⏳ | Mulai Fase 1; direktori `laravel/` atau repo terpisah |
| 0.7 | Environment development | ⏳ | Cloud Agent: [.cursor/environment.json](../.cursor/environment.json) |

### Deliverable Fase 0

- [x] Audit terdokumentasi
- [ ] `.env.example` tanpa kredensial asli
- [ ] Rotasi kredensial yang terbuka di `automation/accompaniment_check.php`
- [ ] Backup DB produksi tersimpan di lokasi aman (di luar Git)
- [ ] Tiket TIK terkirim untuk PHP 8.2, cron, SSL

### Risiko & mitigasi

| Risiko | Mitigasi |
|--------|----------|
| Secret bocor di repo | Rotasi DB; `.gitignore` diperbarui; audit secret |
| Schema drift (8+ file SQL) | Hanya `enablink_struktur_prod.sql` yang canonical |
| PHP versi lama di Plesk | Tiket TIK sebelum deploy Laravel |

---

## Fase 1 — Laravel foundation & staging (minggu 5–8)

**Tujuan:** Laravel 11 berjalan di staging tanpa mengganggu CI produksi.

### Tugas

1. **Inisialisasi Laravel 11** — PHP 8.2+, Composer, struktur standar.
2. **Koneksi DB** — `.env` mengarah ke `db_enablink`; `config/database.php` MySQL/MariaDB.
3. **Eloquent models** — Map ke tabel existing: `aplego_user`, `app_students`, `app_accompaniment`, dll. (prefix/timestamp sesuai schema CI).
4. **Auth multi-role** — Role: `admin`, `staf`, `volunteer`, `difabel` (Spatie Permission atau gate custom).
5. **Password migration** — phpass → bcrypt on login (rehash transisi).
6. **Deploy staging** — Subdomain `staging.enbalink.ub.ac.id` atau path `/v2`; lihat [DEPLOY-PLESK-UB.md](./DEPLOY-PLESK-UB.md) dan `scripts/deploy-plesk.sh`.
7. **Scheduler** — `* * * * * php artisan schedule:run` menggantikan cron standalone `automation/`.
8. **Health check** — `scripts/post-deploy.sh` setelah setiap deploy.

### Kriteria selesai

- Login admin & member di staging berhasil dengan user produksi (read-only test atau clone DB dev).
- Halaman health `/up` atau route khusus merespons 200.
- CI produksi `/` tidak berubah.

---

## Fase 2 — Modul bisnis inti (minggu 9–16)

**Tujuan:** Fitur operasional utama dipindah ke Laravel; traffic modul tertentu diarahkan ke Laravel.

### Urutan migrasi modul (strangler)

| Urutan | Modul CI | Modul Laravel | Prioritas |
|--------|----------|---------------|-----------|
| 1 | `user` (login/register) | `Auth`, profil | P0 |
| 2 | `dashboard` | Dashboard member/admin | P1 |
| 3 | `jadwal` | Jadwal kuliah & ujian | P1 |
| 4 | `admin/pendampingan` | Generate & kelola pendampingan | P1 |
| 5 | `izin` | Izin pendampingan & cuti | P2 |
| 6 | `pergantian` | Pergantian volunteer (Gale–Shapely) | P1 |
| 7 | `admin/report` | Laporan kehadiran | P2 |
| 8 | Master data | Fakultas, semester, difabel, preferensi | P2 |

### Refactor khusus

- **`Pendampingan.php` (>1100 baris)** → Service layer: `AccompanimentGenerator`, `VolunteerMatcher`, `ScheduleResolver`.
- **Matching volunteer (Dieng)** — Longgarkan filter fakultas/prodi jika aturan bisnis mengizinkan; uji dengan data semester aktif.
- **Jadwal kuliah vs ujian** — Pertahankan `schedule_type`; controller terpisah di Laravel.
- **Hapus duplikasi** — `contents/modules/admin-old/`, `contents/modules2/` tidak di-port; arsip di branch `legacy/codeigniter`.

### Routing strangler (contoh `.htaccess`)

```apache
# Modul yang sudah dimigrasi → Laravel
RewriteRule ^dashboard(.*)$ /v2/dashboard$1 [P,L]
RewriteRule ^jadwal(.*)$ /v2/jadwal$1 [P,L]
# Sisanya tetap CI
RewriteCond %{REQUEST_URI} !^/v2
RewriteRule ^ index.php [L]
```

*(Sesuaikan dengan konfigurasi Plesk aktual.)*

### Kriteria selesai

- Admin dapat generate jadwal pendampingan di Laravel staging.
- Volunteer/difabel melihat jadwal & mengajukan pergantian.
- Regression checklist modul lulus; rollback path teruji.

---

## Fase 3 — Notifikasi (minggu 17–20)

**Tujuan:** Mengganti koordinasi manual (termasuk WA informal) dengan sistem terpusat.

Detail lengkap: [NOTIFIKASI.md](./NOTIFIKASI.md)

| Sub-fase | Isi | Minggu |
|----------|-----|--------|
| **3a** | Email SMTP UB, in-app (`app_notifications` → Laravel Notifications), audit log | 17–18 |
| **3b** | WhatsApp (Fonnte/Wablas), reminder H-1 cron, preferensi channel, FCM push | 19–20 |

### Event notifikasi prioritas

- Pengajuan pergantian volunteer → calon pengganti
- Persetujuan/penolakan pergantian → pemohon & difabel
- Reminder H-1 jadwal pendampingan
- Izin pendampingan disetujui/ditolak
- Jadwal baru di-generate admin

---

## Fase 4 — API REST untuk mobile & integrasi (minggu 21–24)

**Tujuan:** API `/api/v1` stabil menggantikan/melengkapi `contents/modules/api/`.

### Scope

- **Laravel Sanctum** — Token auth; ganti mekanisme token CI.
- **Endpoint parity** — Auth, Jadwal, Izin, Pendampingan, Profile, Master (mapping dari controller CI).
- **Versioning** — Header `Accept: application/vnd.enablink.v1+json` atau prefix URL.
- **Dokumentasi** — Scribe atau koleksi Postman; rate limiting.
- **CORS** — Hanya domain/app mobile resmi.

### Kriteria selesai

- Semua endpoint MVP mobile ter-cover.
- Contract test atau Postman collection hijau.
- CI API legacy dapat di-deprecate bertahap (header `Sunset`).

---

## Fase 5 — Aplikasi mobile Flutter (minggu 25–32)

Detail lengkap: [MOBILE-APPS.md](./MOBILE-APPS.md)

| Sub-fase | Isi |
|----------|-----|
| **5a** | MVP volunteer: login, daftar jadwal |
| **5b** | FCM push notification |
| **5c** | Pengajuan ganti jadwal dari mobile |
| **5d** | Fitur difabel (jadwal, notifikasi, aksesibilitas) |
| **5e** | Release Play Store + TestFlight, WCAG audit |

---

## Fase 6 — Cutover & pensiun CI (minggu 33–36)

**Tujuan:** Laravel menjadi aplikasi utama di `/`; CI diarsipkan.

### Checklist cutover

1. **Pre-cutover (H-7)**
   - [ ] Backup penuh DB + file upload
   - [ ] Load test staging
   - [ ] Semua modul P0–P2 lulus UAT admin SLDPI
   - [ ] Mobile app pointing ke API produksi

2. **Cutover (maintenance window opsional, target zero-downtime)**
   - [ ] Deploy Laravel ke document root
   - [ ] Update `.htaccess` / Plesk docroot
   - [ ] Alihkan cron ke `artisan schedule:run`
   - [ ] Smoke test: login, jadwal, notifikasi test

3. **Post-cutover (H+1 s/d H+7)**
   - [ ] Monitor error log Laravel + Plesk
   - [ ] Jalankan `post-deploy.sh` setiap deploy hotfix
   - [ ] Channel komunikasi darurat (admin WA group)

4. **Pensiun CI**
   - [ ] Tag `legacy/codeigniter-final`
   - [ ] Read-only archive; hapus dari docroot produksi
   - [ ] Redirect URL lama jika ada perubahan path

### Rollback

Jika cutover gagal kritis (< 30 menit):

1. Kembalikan docroot ke CI (`index.php` + `contents/`)
2. Restore `.htaccess` backup
3. Pastikan cron CI/automation aktif kembali
4. Post-mortem & perbaiki sebelum retry

---

## Metrik keberhasilan

| Metrik | Target |
|--------|--------|
| Uptime produksi | ≥ 99.5% selama migrasi |
| Waktu rollback | < 30 menit |
| Coverage modul P0 | 100% sebelum cutover |
| Notifikasi otomatis | Menggantikan ≥ 80% koordinasi manual |
| Mobile adoption | ≥ 50% volunteer aktif dalam 3 bulan pasca-release |

---

## Dokumen terkait

| Dokumen | Isi |
|---------|-----|
| [AUDIT-CODEIGNITER.md](./AUDIT-CODEIGNITER.md) | Temuan audit CI, peta modul & DB |
| [PRIORITAS-PERBAIKAN.md](./PRIORITAS-PERBAIKAN.md) | Backlog P0–P5 dengan mapping fase |
| [DEPLOY-PLESK-UB.md](./DEPLOY-PLESK-UB.md) | Deploy Laravel di Plesk UB |
| [NOTIFIKASI.md](./NOTIFIKASI.md) | Email, WA, FCM |
| [MOBILE-APPS.md](./MOBILE-APPS.md) | Flutter Android/iOS |
| [../scripts/deploy-plesk.sh](../scripts/deploy-plesk.sh) | Skrip deploy otomatis |
| [../scripts/post-deploy.sh](../scripts/post-deploy.sh) | Health check pasca-deploy |
| [../.cursor/environment.json](../.cursor/environment.json) | Dev environment Cloud Agent |

---

## Langkah berikutnya (immediate)

1. Selesaikan **0.3** — ekspor DB produksi ke storage aman
2. Kirim **0.5** — tiket TIK (template di DEPLOY-PLESK-UB)
3. Perbaiki **P0** di CI (kredensial, error reporting, cron) sambil menunggu approval PHP 8.2
4. Mulai **Fase 1** — `composer create-project laravel/laravel` di branch `feature/laravel-v2`

*Terakhir diperbarui: September 2026 — selaras dengan audit CI April 2022 snapshot.*
