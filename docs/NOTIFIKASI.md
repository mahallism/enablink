# Sistem Notifikasi Enablink

Perencanaan notifikasi terpusat untuk migrasi Laravel: **email**, **in-app**, **WhatsApp** (Fonnte/Wablas), dan **push FCM** — menggantikan koordinasi manual yang saat ini dominan di lapangan.

**Baseline CI:** Tabel `app_notifications` + method `notification()` di `contents/modules/api/controllers/Izin.php` (insert in-app saja, tanpa email/WA otomatis).

---

## Tujuan

1. Setiap event bisnis penting memicu notifikasi ke pihak yang relevan
2. Channel dapat dikonfigurasi per user (email / WA / push / semua)
3. Audit trail: siapa menerima apa, kapan, status delivery
4. Integrasi dengan mobile Flutter (Fase 5b)

---

## Event notifikasi

| Event | Penerima | Channel default | Urgensi | Fase |
|-------|----------|-----------------|---------|------|
| Pengajuan pergantian jadwal | Volunteer calon pengganti | In-app + WA + push | Tinggi | 3a/3b |
| Persetujuan pergantian | Pemohon, difabel, admin | In-app + email | Sedang | 3a |
| Penolakan pergantian | Pemohon | In-app + email | Sedang | 3a |
| Jadwal pendampingan baru (generate admin) | Volunteer & difabel terkait | In-app + email | Sedang | 3a |
| Reminder H-1 jadwal | Volunteer & difabel | WA + push | Tinggi | 3b |
| Reminder H-0 (2 jam sebelum) | Volunteer | Push | Sedang | 3b |
| Izin pendampingan diajukan | Admin/staf | In-app + email | Sedang | 3a |
| Izin disetujui/ditolak | Volunteer/difabel | In-app + WA | Sedang | 3b |
| Status pendampingan «Tidak Didampingi» (auto) | Admin + difabel | Email | Sedang | 3a |
| Registrasi user baru | Admin | Email | Rendah | 3a |
| Reset password | User | Email | Tinggi | 3a |

---

## Arsitektur Laravel (target)

```
┌──────────────┐     ┌─────────────────────┐     ┌──────────────────┐
│ Domain Event │────▶│ Listener / Observer │────▶│ Notification     │
│ (Eloquent)   │     │ (ShouldQueue)       │     │ (multi-channel)  │
└──────────────┘     └─────────────────────┘     └────────┬─────────┘
                                                            │
                    ┌───────────────────────────────────────┼───────────────────────┐
                    ▼                   ▼                   ▼                       ▼
              ┌──────────┐       ┌────────────┐      ┌────────────┐        ┌────────────┐
              │ Database │       │ Mail SMTP  │      │ WhatsApp   │        │ FCM HTTP   │
              │ (in-app) │       │ (UB)       │      │ Fonnte/    │        │ v1 API     │
              │          │       │            │      │ Wablas     │        │            │
              └──────────┘       └────────────┘      └────────────┘        └────────────┘
```

### Komponen utama

| Komponen | Tanggung jawab |
|----------|----------------|
| `app/Events/*` | Event domain: `SubstitutionRequested`, `ScheduleReminderDue`, dll. |
| `app/Listeners/*` | Dispatch notification; queue jika berat |
| `app/Notifications/*` | Kelas notification per event + channel |
| `app/Channels/FonnteChannel.php` | Custom channel WhatsApp |
| `app/Channels/WablasChannel.php` | Alternatif provider |
| `app/Models/NotificationLog.php` | Audit delivery (status, response API) |
| `database/migrations/*_notification_preferences.php` | Preferensi user per channel |

---

## Schema database (perluasan)

### Existing: `app_notifications` (CI)

```sql
notif_id, student_id, notif_type, notif_type_id, message, created_at
```

### Migration Laravel (tambahan)

**`notification_logs`** — audit delivery

```sql
id, notifiable_type, notifiable_id, channel, event_type, payload JSON,
status (pending|sent|failed), provider_response TEXT, created_at
```

**`user_notification_preferences`**

```sql
user_id, channel (email|whatsapp|push|database), enabled BOOLEAN, phone VARCHAR(20)
```

**`device_tokens`** (FCM)

```sql
id, user_id, token, platform (android|ios|web), last_used_at
```

Pertahankan kompatibilitas: tulis juga ke `app_notifications` selama mobile CI legacy masih aktif (dual-write sementara).

---

## Implementasi per channel

### 1. Email (SMTP UB)

**Fase:** 3a  
**Config:** `.env` — lihat [DEPLOY-PLESK-UB.md](./DEPLOY-PLESK-UB.md)

```php
// app/Notifications/SubstitutionRequestedNotification.php
public function via($notifiable): array
{
    return ['mail', 'database'];
}

public function toMail($notifiable): MailMessage
{
    return (new MailMessage)
        ->subject('Permintaan Menggantikan Jadwal Pendampingan')
        ->greeting("Halo {$notifiable->name},")
        ->line('Anda menerima permintaan untuk menggantikan jadwal pendampingan.')
        ->action('Buka Enablink', url('/dashboard/pergantian'))
        ->line('Terima kasih.');
}
```

**Template:** Blade markdown; branding SLDPI; teks plain-language (aksesibilitas).

### 2. In-app (database)

**Fase:** 3a

```php
public function toArray($notifiable): array
{
    return [
        'type' => 'ganti_jadwal',
        'type_id' => $this->substitutionId,
        'message' => $this->message,
        'url' => '/dashboard/pergantian/'.$this->substitutionId,
    ];
}
```

Map ke `app_notifications` via custom channel atau observer jika mobile legacy masih baca tabel lama.

### 3. WhatsApp — Fonnte

**Fase:** 3b  
**Docs:** https://docs.fonnte.com/

```php
// app/Channels/FonnteChannel.php
public function send($notifiable, Notification $notification): void
{
    $message = $notification->toFonnte($notifiable);
    $phone = $notifiable->routeNotificationForWhatsApp();

    Http::withHeaders(['Authorization' => config('services.fonnte.token')])
        ->post('https://api.fonnte.com/send', [
            'target' => $phone,
            'message' => $message,
            'countryCode' => '62',
        ]);
}
```

**Format pesan WA (contoh reminder H-1):**

```
[Enablink] Reminder Pendampingan
Halo {nama},
Besok ({tanggal}) Anda memiliki jadwal pendampingan:
- Mata kuliah: {matkul}
- Waktu: {jam}
- Difabel: {nama_difabel}
Detail: https://enbalink.ub.ac.id/dashboard/jadwal
```

**Rate limit:** Queue + throttle; max 1 WA/user/event/hari untuk reminder.

### 4. WhatsApp — Wablas (alternatif)

**Fase:** 3b (pilih Fonnte **atau** Wablas, jangan keduanya produksi)

```php
Http::withToken(config('services.wablas.token'))
    ->post(config('services.wablas.endpoint').'/send-message', [
        'phone' => $phone,
        'message' => $message,
    ]);
```

Config di `config/services.php`:

```php
'fonnte' => ['token' => env('FONNTE_TOKEN')],
'wablas' => ['token' => env('WABLAS_TOKEN'), 'endpoint' => env('WABLAS_ENDPOINT')],
'whatsapp' => ['driver' => env('WHATSAPP_DRIVER', 'fonnte')],
```

### 5. FCM (Firebase Cloud Messaging)

**Fase:** 3b (backend) + 5b (mobile)  
**Package:** `kreait/laravel-firebase` atau HTTP v1 langsung

```php
// app/Notifications/ScheduleReminderNotification.php
public function via($notifiable): array
{
    $channels = ['database'];
    if ($notifiable->prefersPush()) {
        $channels[] = FcmChannel::class;
    }
    return $channels;
}
```

Simpan device token saat login mobile (Sanctum + endpoint `POST /api/v1/devices`).

---

## Queue & cron

Shared hosting Plesk: **`QUEUE_CONNECTION=database`**

```bash
# Migration
php artisan queue:table
php artisan migrate

# Cron (setiap menit, selain schedule:run)
php artisan queue:work --stop-when-empty --max-time=55
```

### Scheduled jobs (Fase 3b)

| Job | Schedule | Fungsi |
|-----|----------|--------|
| `SendScheduleReminders` | Daily 18:00 WIB | Reminder H-1 |
| `SendSameDayReminders` | Hourly | Reminder H-0 |
| `RetryFailedNotifications` | Every 15 min | Retry WA/FCM gagal |
| `AccompanimentStatusUpdate` | Daily 23:59 | Ganti logic bug `accompaniment_check.php` |

Daftarkan di `routes/console.php` atau `bootstrap/app.php` (Laravel 11).

---

## Fase 3a — Email + in-app (minggu 17–18)

### Deliverable

- [ ] SMTP UB terkonfigurasi & teruji
- [ ] Notification classes untuk event P0 (ganti jadwal, izin, jadwal baru)
- [ ] UI bell icon + daftar notifikasi di dashboard Laravel
- [ ] `notification_logs` untuk audit
- [ ] Preferensi email on/off per user

### Testing

```bash
php artisan tinker
>>> $user = User::find(1);
>>> $user->notify(new \App\Notifications\SubstitutionRequestedNotification(123));
```

---

## Fase 3b — WhatsApp + push + reminder (minggu 19–20)

### Deliverable

- [ ] Akun Fonnte/Wablas + token di `.env`
- [ ] Field `phone` tervalidasi di profil user (format E.164)
- [ ] Custom channel WA + error handling
- [ ] Reminder H-1/H-0 via scheduler
- [ ] FCM backend + endpoint device token
- [ ] Preferensi channel: `email | whatsapp | push | all`

### Keamanan

- Token WA/FCM hanya di `.env`
- Jangan log isi pesan penuh di produksi (GDPR/privasi mahasiswa)
- Rate limiting endpoint notifikasi test

---

## Mapping dari CodeIgniter

| CI | Laravel |
|----|---------|
| `$this->notification($student_id, ...)` manual insert | `$user->notify(new ...Notification())` |
| Email manual / WA informal | Queue + provider API |
| `app_notifications` read API | `/api/v1/notifications` + Laravel database channel |
| Cron `automation/accompaniment_check.php` | `AccompanimentStatusJob` + notifikasi admin |

---

## Monitoring & fallback

| Skenario | Tindakan |
|----------|----------|
| Fonnte down | Retry 3x; fallback email; log `failed` |
| SMTP gagal | Queue retry; alert admin via log |
| User tanpa nomor WA | Skip WA; kirim email/push saja |
| Push token expired | Hapus token; prompt re-login di mobile |

Dashboard admin (opsional Fase 3b): statistik notifikasi terkirim/gagal per hari.

---

## Dokumen terkait

- [ROADMAP-MIGRASI.md](./ROADMAP-MIGRASI.md) — Fase 3
- [MOBILE-APPS.md](./MOBILE-APPS.md) — FCM & device tokens
- [DEPLOY-PLESK-UB.md](./DEPLOY-PLESK-UB.md) — cron & `.env`
- [PRIORITAS-PERBAIKAN.md](./PRIORITAS-PERBAIKAN.md) — P3.x
