# Aplikasi Mobile Enablink (Flutter)

Perencanaan aplikasi **Android & iOS** untuk volunteer dan mahasiswa difabel, terintegrasi dengan API Laravel (Sanctum) dan push notification FCM.

**Baseline CI:** REST API di `contents/modules/api/` (Auth, Jadwal, Izin, Pendampingan, Profile, Master) — akan digantikan/dilengkapi oleh `/api/v1` Laravel.

---

## Tujuan produk

| Pengguna | Kebutuhan utama |
|----------|-----------------|
| **Volunteer** | Lihat jadwal, terima/tolak permintaan ganti, reminder, notifikasi push |
| **Difabel** | Lihat jadwal pendampingan, status izin, aksesibilitas penuh |
| **Admin** | (Opsional fase later) Approval mobile — prioritas web dulu |

---

## Stack teknis

| Layer | Pilihan |
|-------|---------|
| Framework | **Flutter** 3.x (Dart) |
| State management | Riverpod atau Bloc (pilih satu; Riverpod disarankan untuk tim kecil) |
| HTTP client | `dio` + interceptor token Sanctum |
| Auth | Laravel Sanctum personal access token |
| Push | Firebase Cloud Messaging (FCM) |
| Local storage | `flutter_secure_storage` (token), `hive`/`shared_preferences` (cache) |
| i18n | `flutter_localizations` — Bahasa Indonesia default |
| Aksesibilitas | Semantics, screen reader, kontras WCAG 2.1 AA |

---

## Arsitektur aplikasi

```
┌─────────────────────────────────────────────────────────┐
│                    Flutter App                          │
├─────────────┬─────────────┬──────────────┬──────────────┤
│ Presentation│   Domain    │     Data     │   Platform   │
│ (Screens)   │ (Use cases) │ (Repositories│ (FCM, secure │
│             │             │  + models)   │  storage)    │
└──────┬──────┴──────┬──────┴──────┬───────┴──────┬───────┘
       │             │             │              │
       └─────────────┴─────────────┴──────────────┘
                              │
                              ▼ HTTPS
                    ┌───────────────────┐
                    │ Laravel API       │
                    │ /api/v1/*         │
                    │ Sanctum Bearer    │
                    └───────────────────┘
```

### Struktur folder (monorepo opsional)

```
mobile/
├── enablink_app/
│   ├── lib/
│   │   ├── main.dart
│   │   ├── app.dart
│   │   ├── core/           # theme, router, dio, constants
│   │   ├── features/
│   │   │   ├── auth/
│   │   │   ├── schedule/
│   │   │   ├── substitution/
│   │   │   └── notifications/
│   │   └── l10n/
│   ├── android/
│   ├── ios/
│   └── pubspec.yaml
└── README.md
```

Repo: bisa submodule di `mahallism/enablink` atau repo terpisah `mahallism/enablink-mobile`.

---

## API Laravel (Sanctum)

### Autentikasi

```http
POST /api/v1/auth/login
Content-Type: application/json

{"username": "...", "password": "..."}

→ 200 {"token": "...", "user": {...}}
```

Header selanjutnya:

```http
Authorization: Bearer {token}
Accept: application/json
```

### Endpoint MVP (parity CI)

| Method | Path | Fungsi CI equivalent |
|--------|------|----------------------|
| POST | `/api/v1/auth/login` | `api/Auth/login` |
| POST | `/api/v1/auth/logout` | `api/Auth/logout` |
| GET | `/api/v1/profile` | `api/Profile` |
| GET | `/api/v1/schedules` | `api/Jadwal` |
| GET | `/api/v1/schedules/{id}` | detail jadwal |
| POST | `/api/v1/substitutions` | pengajuan ganti |
| PUT | `/api/v1/substitutions/{id}/respond` | terima/tolak |
| GET | `/api/v1/notifications` | `api/Profile/notification` |
| DELETE | `/api/v1/notifications/{id}` | delete |
| POST | `/api/v1/devices` | register FCM token |
| GET | `/api/v1/master/faculties` | master data |

### Error format

```json
{
  "message": "Validasi gagal",
  "errors": {"field": ["pesan"]}
}
```

HTTP status: 401 unauthorized, 403 forbidden, 422 validation, 500 server.

---

## FCM (Firebase Cloud Messaging)

### Setup Firebase

1. Buat project Firebase «Enablink UB»
2. Tambah app Android (`com.ub.sldpi.enablink`) & iOS
3. Download `google-services.json` / `GoogleService-Info.plist`
4. Server key / service account untuk Laravel backend

### Flutter integration

```yaml
# pubspec.yaml
dependencies:
  firebase_core: ^3.0.0
  firebase_messaging: ^15.0.0
  flutter_local_notifications: ^17.0.0
```

Flow:

1. App startup → request permission (iOS)
2. Dapatkan FCM token → `POST /api/v1/devices`
3. Background handler untuk notifikasi silent/data
4. Tap notification → deep link ke screen relevan (`/substitution/{id}`)

### Payload contoh (dari Laravel)

```json
{
  "notification": {
    "title": "Permintaan Ganti Jadwal",
    "body": "Anda diminta menggantikan pendampingan besok pukul 08:00"
  },
  "data": {
    "type": "substitution_request",
    "id": "123",
    "route": "/substitution/123"
  }
}
```

---

## Fase implementasi (5a–5e)

### Fase 5a — MVP Volunteer (minggu 25–27)

**Scope:**

- Splash & onboarding singkat
- Login / logout (Sanctum)
- Daftar jadwal minggu ini (list + detail)
- Pull-to-refresh
- Error & loading states
- Build Android APK internal testing

**Kriteria selesai:**

- 5 volunteer UAT dapat login & lihat jadwal staging
- Token disimpan secure; logout hapus token

### Fase 5b — Push notification (minggu 28–29)

**Scope:**

- Integrasi FCM
- Register device token ke API
- Terima notifikasi: ganti jadwal, reminder
- In-app notification list (sync `/api/v1/notifications`)

**Kriteria selesai:**

- Push diterima di Android & iOS (TestFlight/internal)
- Tap navigasi ke screen benar

### Fase 5c — Pengajuan ganti jadwal (minggu 30)

**Scope:**

- Form ajukan ganti (pilih jadwal, alasan, calon pengganti jika ada)
- Terima/tolak permintaan masuk
- Status realtime (poll atau refresh)

**Mapping CI:** `api/Izin`, `api/Pendampingan`, modul `pergantian`

### Fase 5d — Fitur difabel (minggu 31)

**Scope:**

- Layout aksesibel (font scaling, screen reader labels)
- Jadwal difabel (read-focused)
- Notifikasi status pendampingan
- (Opsional) izin cuti — backlog CI menu dikomentari

### Fase 5e — Release & compliance (minggu 32)

**Scope:**

- Play Store listing (SLDPI UB)
- TestFlight → App Store (akun Apple Developer UB)
- Privacy policy URL: `https://enbalink.ub.ac.id/privacy`
- WCAG audit mobile
- Crash reporting (Firebase Crashlytics)

---

## Aksesibilitas (WCAG 2.1 AA)

Enablink melayani pengguna disabilitas — aksesibilitas **wajib**, bukan opsional.

### Checklist Flutter

| Kriteria | Implementasi |
|----------|--------------|
| **1.1.1** Non-text content | `Semantics(label: ...)` pada icon button |
| **1.3.1** Info & relationships | Heading order di screen; list semantics |
| **1.4.3** Contrast | Min 4.5:1 teks normal; tema SLDPI audited |
| **1.4.4** Resize text | Respect system font scale; no fixed px overflow |
| **2.1.1** Keyboard | Focus order logis (TalkBack/VoiceOver) |
| **2.4.4** Link purpose | Tombol «Terima permintaan ganti» bukan «OK» |
| **2.5.5** Target size | Min 44×44 dp touch targets |
| **3.3.2** Labels | Semua field form berlabel |
| **4.1.2** Name, role, value | Test dengan TalkBack (Android) & VoiceOver (iOS) |

### Testing aksesibilitas

```bash
# Flutter integration test + semantics
flutter test integration_test/a11y_schedule_test.dart
```

Manual: uji dengan 2–3 user difabel (SLDPI) sebelum release 5e.

### Web admin (paralel)

WCAG juga berlaku dashboard Laravel (Fase 2+) — kontras, focus ring, aria-label.

---

## Keamanan mobile

- Token Sanctum di `flutter_secure_storage`
- Certificate pinning (opsional fase later)
- Tidak simpan password
- Biometric unlock (opsional)
- Revoke token saat logout: `POST /api/v1/auth/logout`
- Obfuscate release build: `flutter build apk --obfuscate`

---

## Environment & build

```dart
// lib/core/config/env.dart
class Env {
  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://staging.enbalink.ub.ac.id/api/v1',
  );
}
```

Build produksi:

```bash
flutter build apk --release --dart-define=API_BASE_URL=https://enbalink.ub.ac.id/api/v1
flutter build ipa --release --dart-define=API_BASE_URL=https://enbalink.ub.ac.id/api/v1
```

---

## Migrasi dari API CI

| Strategi | Kapan |
|----------|-------|
| Dual API | Mobile 5a pointing staging Laravel; produksi masih CI |
| Feature flag | Header `X-Api-Version: v1` switch backend |
| Sunset CI API | Setelah 5e + 1 bulan stabil; deprecate `contents/modules/api/` |

Breaking changes: dokumentasikan di CHANGELOG mobile + Postman.

---

## Timeline ringkas

```
Minggu 25-27 │ 5a MVP login + jadwal
Minggu 28-29 │ 5b FCM push
Minggu 30    │ 5c Ganti jadwal
Minggu 31    │ 5d Difabel + a11y
Minggu 32    │ 5e Store release
```

Selaras dengan [ROADMAP-MIGRASI.md](./ROADMAP-MIGRASI.md) Fase 5 (bulan 6–8).

---

## Dokumen terkait

- [ROADMAP-MIGRASI.md](./ROADMAP-MIGRASI.md)
- [NOTIFIKASI.md](./NOTIFIKASI.md) — FCM backend
- [DEPLOY-PLESK-UB.md](./DEPLOY-PLESK-UB.md) — API produksi
- [AUDIT-CODEIGNITER.md](./AUDIT-CODEIGNITER.md) — API CI existing
- [PRIORITAS-PERBAIKAN.md](./PRIORITAS-PERBAIKAN.md) — P4.x
