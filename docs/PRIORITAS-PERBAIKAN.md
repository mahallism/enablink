# Daftar Prioritas Perbaikan Enablink

Disusun dari **audit CodeIgniter** (`AUDIT-CODEIGNITER.md`) dan **roadmap migrasi** (`ROADMAP-MIGRASI.md`).

---

## Prinsip urutan

1. **Stabilkan CI yang ada** sebelum migrasi Laravel (jangka pendek)
2. **Migrasi bertahap** (strangler fig), bukan rewrite sekaligus
3. **Fitur bisnis** mengikuti urgensi SLDPI (notifikasi, matching, mobile)

---

## P0 — Kritis (minggu 1–2)

| # | Item | Status |
|---|------|--------|
| P0.1 | Rotasi kredensial & hapus secret dari repo | ✅ Kode diperbaiki — **rotasi di server wajib** (`docs/ROTASI-KREDENSIAL.md`) |
| P0.2 | Perbaiki error reporting production | ✅ |
| P0.3 | Audit & patch SQL injection | ✅ Automation script; model matching masih perlu review |
| P0.4 | Ekspor database produksi | ⏳ Manual di server |
| P0.5 | Tetapkan canonical schema | ✅ `docs/DATABASE.md` |
| P0.6 | Perbaiki cron `accompaniment_check.php` | ✅ |

---

## P1 — Stabilisasi CI (minggu 2–6)

| # | Item | Status |
|---|------|--------|
| P1.1 | Konfirmasi PHP 8.2+ ke TIK/BITS | ⏳ |
| P1.2 | Setup environment lokal / dev | ✅ `.cursor/environment.json` |
| P1.3 | Hapus `admin-old/` dan `modules2/` | ✅ |
| P1.4 | Dokumentasi `.env.example` | ✅ |
| P1.5 | Perbaiki matching volunteer (Dieng) | ✅ `STRICT_VOLUNTEER_MATCHING=false` default |
| P1.6 | Verifikasi modul pergantian | ⏳ Perlu uji di produksi |
| P1.7 | Pisahkan & uji jadwal kuliah vs ujian | ⏳ Controller sudah terpisah |

---

## P2 — Migrasi Laravel (bulan 1–3)

| # | Item | Roadmap | Detail |
|---|------|---------|--------|
| P2.1 | Inisialisasi Laravel 11 di `/v2` atau staging | Fase 1 | CI produksi tidak terganggu |
| P2.2 | Eloquent models map ke tabel existing | Fase 1 | Jangan rename tabel |
| P2.3 | Auth multi-role (admin, volunteer, difabel) | Fase 1 | Spatie Permission atau custom |
| P2.4 | Deploy staging + cron scheduler | Fase 1 | `scripts/deploy-plesk.sh` |
| P2.5 | Migrasi modul: dashboard → jadwal → pendampingan → pergantian | Fase 2 | Strangler fig per modul |
| P2.6 | Refactor logic dari `Pendampingan.php` (>1100 baris) | Fase 2 | Service layer di Laravel |

---

## P3 — Notifikasi (bulan 3–4)

| # | Item | Roadmap | Detail |
|---|------|---------|--------|
| P3.1 | Email otomatis (SMTP UB) | Fase 3a | Ganti koordinasi WA manual |
| P3.2 | In-app notification + audit log | Fase 3a | Tabel `notifications` |
| P3.3 | WhatsApp via Fonnte/Wablas | Fase 3b | Event urgent: pengajuan ganti, reminder |
| P3.4 | Reminder H-1 jadwal (cron) | Fase 3b | Queue database + cron Plesk |
| P3.5 | Preferensi channel per user | Fase 3b | WA / email / semua |

Lihat [NOTIFIKASI.md](./NOTIFIKASI.md).

---

## P4 — API & Mobile (bulan 4–8)

| # | Item | Roadmap | Detail |
|---|------|---------|--------|
| P4.1 | API REST `/api/v1` (Sanctum) | Fase 4 | Ganti/extend `modules/api/` CI |
| P4.2 | Dokumentasi API (Scribe/Postman) | Fase 4 | |
| P4.3 | App Flutter MVP volunteer | Fase 5a | Jadwal + login |
| P4.4 | Push notification FCM | Fase 5b | Firebase |
| P4.5 | Pengajuan ganti dari mobile | Fase 5c | |
| P4.6 | Release Play Store + TestFlight | Fase 5e | |

Lihat [MOBILE-APPS.md](./MOBILE-APPS.md).

---

## P5 — Cutover & Backlog (bulan 8+)

| # | Item | Roadmap | Detail |
|---|------|---------|--------|
| P5.1 | Cutover root `/` ke Laravel | Fase 6 | Rollback plan siap |
| P5.2 | Pensiunkan CodeIgniter | Fase 6 | Arsip branch `legacy/codeigniter` |
| P5.3 | Aktifkan modul Payout | Backlog | Menu & tabel sudah ada |
| P5.4 | Izin cuti member | Backlog | Menu dikomentari |
| P5.5 | Aksesibilitas WCAG web + mobile | Fase 5e | Wajib untuk layanan disabilitas |
| P5.6 | Upgrade password hashing | Fase 2–3 | phpass → bcrypt/argon2 |

---

## Matriks: Masalah lapangan → Prioritas

| Masalah (dari diskusi) | Prioritas | Fase |
|------------------------|-----------|------|
| Banyak fitur tidak maksimal | P1.5–P1.7 | Stabilisasi CI dulu |
| Notifikasi via WhatsApp | P3.3 | Setelah Laravel staging |
| Matching ketat (Dieng) | P1.5 | Bisa diperbaiki di CI atau Laravel |
| Pergantian volunteer manual | P1.6, P4.5 | CI verify → Laravel → mobile |
| Mobile Android/iOS | P4.3–P4.6 | Setelah API stabil |
| Hosting Plesk UB | P2.4 | Shared hosting cukup |

---

## Langkah immediate (minggu ini)

1. ✅ Audit kode — `AUDIT-CODEIGNITER.md`
2. ✅ Perbaikan keamanan P0 — PR #2
3. ✅ Stabilisasi CI (duplikasi, matching) — branch `cursor/ci-stabilization-685c`
4. ⏳ **Rotasi kredensial** di server — `docs/ROTASI-KREDENSIAL.md`
5. ⏳ Ekspor DB dari produksi — `docs/DATABASE.md`
6. ⏳ Kirim tiket TIK — `docs/DEPLOY-PLESK-UB.md`
