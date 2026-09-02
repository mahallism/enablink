# Database Enablink

## Sumber kebenaran (canonical)

| File | Penggunaan |
|------|------------|
| `enablink_struktur_prod.sql` | **Baseline schema** production (18 tabel + view) |
| `enablink_struktur_dev.sql` | Schema dev + sample data terbatas |
| `db_enablink_structur.sql` | Struktur ringkas alternatif |

## File arsip (jangan jadikan referensi utama)

File di root repo ini adalah dump lama/backup. Jangan edit langsung:

- `db_enablink.sql` (~8 MB, data penuh)
- `enablink.sql`, `enablink after pergantian.sql`
- `application/db_enablink.sql`

**Jangan commit dump berisi data mahasiswa** ke Git. Simpan di server/backup terpisah.

## Ekspor dari produksi

```bash
# Schema saja
mysqldump -u USER -p --no-data db_enablink > enablink_struktur_prod.sql

# Dev/staging (tanpa data sensitif production)
mysqldump -u USER -p db_enablink > backup_dev.sql
```

## Stored procedures

- `stored procedure get_available.sql` — volunteer tersedia by jadwal
- `stored procedure get_volunteer.sql` — cari volunteer by nama

Pastikan procedure ini ter-deploy di database production jika fitur pergantian/pencarian dipakai.

## Migrasi ke depan

CI Migrations dinonaktifkan (`migration_enabled = false`). Rencana: aktifkan saat migrasi Laravel (Fase 1 roadmap).
