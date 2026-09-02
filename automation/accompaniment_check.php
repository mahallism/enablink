<?php
/**
 * Cron: tandai pendampingan yang sudah lewat tanggal sebagai tidak didampingi.
 * Jalankan via CLI/cron saja — bukan via browser.
 *
 * Contoh cron (setiap hari 00:05):
 * 5 0 * * * /usr/bin/php /path/to/enablink/automation/accompaniment_check.php
 */

if (php_sapi_name() !== 'cli') {
	http_response_code(403);
	exit('Forbidden');
}

$root = dirname(__DIR__);
$autoload = $root . '/application/vendor/autoload.php';

if (!file_exists($autoload)) {
	fwrite(STDERR, "Vendor autoload tidak ditemukan.\n");
	exit(1);
}

require $autoload;

if (file_exists($root . '/.env')) {
	$dotenv = new Dotenv\Dotenv($root);
	$dotenv->load();
}

$hostname = getenv('DB_HOSTNAME') ?: 'localhost';
$username = getenv('DB_USERNAME');
$password = getenv('DB_PASSWORD');
$database = getenv('DB_DATABASE');

if (!$username || !$database) {
	fwrite(STDERR, "DB_USERNAME dan DB_DATABASE harus diset di .env\n");
	exit(1);
}

$conn = new mysqli($hostname, $username, $password ?: '', $database);
if ($conn->connect_error) {
	fwrite(STDERR, "Koneksi database gagal.\n");
	exit(1);
}

$conn->set_charset('utf8');

$sql = "
	SELECT accompaniment_id
	FROM app_accompaniment
	WHERE date < CURDATE()
	  AND student_status != 'Selesai'
";

$result = $conn->query($sql);
if ($result === false) {
	fwrite(STDERR, "Query gagal.\n");
	$conn->close();
	exit(1);
}

$update = $conn->prepare("
	UPDATE app_accompaniment
	SET student_status = 'Tidak Didampingi',
	    volunteer_status = 'Tidak Mendampingi'
	WHERE accompaniment_id = ?
");

if ($update === false) {
	fwrite(STDERR, "Prepare statement gagal.\n");
	$conn->close();
	exit(1);
}

$updated = 0;
while ($row = $result->fetch_assoc()) {
	$id = (int) $row['accompaniment_id'];
	$update->bind_param('i', $id);
	if ($update->execute()) {
		$updated++;
	}
}

$update->close();
$result->free();
$conn->close();

echo date('Y-m-d H:i:s') . " — {$updated} pendampingan diperbarui.\n";
