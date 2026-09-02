-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2025 at 11:35 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wp_jwbti`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_available` (IN `p_hari` INT, IN `p_start` TIME, IN `p_end` TIME, IN `p_id` INT, IN `p_tanggal` DATE)  BEGIN
    SELECT DISTINCT
        u.name,
        u.email,
        s.nick_name,
        s.no_hp,
        u.user_id,
        f.faculty_name,
        p_id
    FROM aplego_user u 
    JOIN app_students s ON u.user_id = s.user_id
    JOIN app_majors m ON m.majors_id = s.majors_id
    JOIN app_faculties f ON f.faculty_id = m.faculty_id
    
    WHERE 
    u.capability = 'volunteer' and
    
    NOT EXISTS (
        SELECT 1
        FROM app_schedule_volunteer sv1
        WHERE sv1.student_id = s.student_id
          AND sv1.day = p_hari
          AND sv1.start_at < p_end
          AND sv1.end_at > p_start
    )

    
    AND NOT EXISTS (
        SELECT 1
        FROM app_accompaniment_view a
        WHERE a.volunteer_id = s.student_id
          AND a.day = p_hari
          AND a.start_at < p_end
          AND a.end_at > p_start
        AND a.date = p_tanggal
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_volunteer` (IN `p_nama` VARCHAR(200), IN `p_id` INT)  BEGIN
    SELECT DISTINCT
        u.name,
        u.email,
        s.nick_name,
        s.no_hp,
        u.user_id,
        f.faculty_name,
        p_id
    FROM aplego_user u 
    JOIN app_students s ON u.user_id = s.user_id
    JOIN app_majors m ON m.majors_id = s.majors_id
    JOIN app_faculties f ON f.faculty_id = m.faculty_id
    
    WHERE 
    u.capability = 'volunteer' and (
    u.name LIKE CONCAT('%', p_nama, '%')
        OR s.nick_name LIKE CONCAT('%', p_nama, '%'));
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `aplego_options`
--

CREATE TABLE `aplego_options` (
  `option_id` int(10) UNSIGNED NOT NULL,
  `option_key` varchar(100) NOT NULL,
  `option_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `aplego_options`
--

INSERT INTO `aplego_options` (`option_id`, `option_key`, `option_value`) VALUES
(1, 'site_name', 'Enablink'),
(2, 'site_tagline', 'Enable Disability'),
(3, 'site_description', ''),
(8, 'difabel', 'Tunanetra'),
(9, 'difabel', 'Tunarungu'),
(10, 'difabel', 'Cerebral Palsy'),
(11, 'difabel', 'Tuna Daksa'),
(12, 'difabel', 'Low Vision'),
(13, 'current_semester', '31'),
(14, 'max_volunteer', '10'),
(15, 'copyright', 'Enablink'),
(16, 'copyright_link', 'https://enablink.ub.ac.id/'),
(17, 'difabel', 'ADHD'),
(18, 'difabel', 'Autism'),
(19, 'difabel', 'Slow Learner'),
(20, 'difabel', 'Down Syndrome'),
(21, 'difabel', 'Autis Ringan'),
(22, 'difabel', 'Gangguan Syaraf'),
(23, 'wa_number', '08113030626'),
(24, 'term_condition', '<h1>Syarat Ketentuan Enablink</h1>\r\n<p><br><strong>Ketentuan Penggunaan</strong></p>\r\n<p>Selamat Datang di Enablink! <br><br>Ketentuan Penggunaan ini mengatur penggunaan Enablink dan menyediakan informasi tentang Layanan Enablink yang diuraikan di bawah ini. Saat Anda membuat akun Enablink atau menggunakan Enablink, Anda menyetujui ketentuan ini. </p>\r\n<p><strong>Layanan Enablink</strong></p>\r\n<p>Kami setuju untuk menyediakan Layanan Enablink kepada Anda. Layanan ini meliputi semua produk, fitur, aplikasi, layanan, teknologi, dan perangkat lunak Enablink yang kami sediakan untuk melaksanakan misi Enablink: Menghubungkan anda dengan orang-orang tertentu. Layanan ini terdiri dari sejumlah aspek berikut (Layanan):</p>\r\n<ul>\r\n<li><strong>Mempertemukan satu orang dengan orang yang lain.</strong><br>Setiap orang berbeda antara satu dengan yang lain. Kami ingin mempererat hubungan yang Anda miliki melalui berbagi pengalaman yang berarti bagi Anda. Oleh karena itu, kami membangun sistem yang mencoba untuk memahami orang-orang dan hal-hal yang penting bagi Anda dan orang lain, dan menggunakan informasi itu untuk membantu Anda membuat, menemukan, berpartisipasi, dan membagikan pengalaman-pengalaman yang berarti bagi Anda. Bagian dari upaya tersebut adalah dengan menyorot jadwal baik itu dari volunteer atau mahasiswa disabilitas.</li>\r\n<li><strong>Mendorong terciptanya lingkungan yang bersifat positif, inklusif, dan aman.</strong><br>Kami mengembangkan dan menggunakan alat dan menawarkan sumber daya kepada para anggota komunitas kami yang dapat membantu membuat pengalaman mereka menjadi positif dan terbuka bagi semuanya, termasuk saat kami merasa bahwa mereka mungkin memerlukan bantuan. Kami juga memiliki tim dan sistem yang berfungsi untuk menangkal penyalahgunaan dan pelanggaran Ketentuan dan kebijakan kami, dan menangkal perilaku yang merugikan dan menyesatkan. Kami menggunakan semua informasi yang kami miliki, termasuk informasi Anda, demi menjaga agar platform kami tetap aman. Kami juga dapat membagikan informasi mengenai penyalahgunaan konten atau konten yang merugikan dengan Perusahaan-Perusahaan Pusat Studi dan Layanan DIsabilitas.</li>\r\n<li><strong>Mengembangkan dan menggunakan teknologi yang membantu kami dalam melayani komunitas kami secara konsisten.</strong><br>Mengelola dan menganalisis informasi untuk komunitas kami yang berkembang merupakan sesuatu yang mendasar bagi Layanan kami. Bagian besar dari Layanan kami adalah membuat dan menggunakan teknologi termutakhir yang dapat membantu kami dalam mempersonalisasikan, melindungi, dan meningkatkan Layanan kami dalam skala yang luar biasa besar untuk komunitas</li>\r\n</ul>\r\n<p><strong>Kebijakan Data</strong></p>\r\n<p>Penyediaan Layanan kami memerlukan pengumpulan dan penggunaan informasi Anda. <a href=\"http://help.instagram.com/519522125107875?helpref=page_content\">Kebijakan Data</a> menjelaskan bagaimana kami mengumpulkan, menggunakan, dan membagikan informasi. Kebijakan Data tersebut juga menjelaskan beragam cara yang dapat Anda lakukan untuk mengontrol informasi Anda. Anda harus menyetujui Kebijakan Data untuk menggunakan Enablink</p>\r\n<p><strong>Komitmen Anda</strong></p>\r\n<p>Sebagai balasan atas komitmen kami untuk menyediakan Layanan, kami mewajibkan Anda untuk membuat komitmen di bawah ini dengan kami.</p>\r\n<p><strong>Orang-orang Yang Dapat Menggunakan Enablink.</strong> Kami menghendaki Layanan kami untuk terbuka dan dapat dimanfaatkan oleh siapa saja, namun kami juga menghendaki Layanan kami selamat, aman, dan sesuai dengan peraturan hukum yang ada. Oleh karena itu, kami meminta Anda untuk mematuhi sejumlah batasan agar Anda dapat menjadi bagian dari komunitas Enablink. </p>\r\n<ul>\r\n<li>Untuk dapat menggunakan Enablink, Anda setidaknya harus terdaftar oleh PSLD di setiap kampus anda.</li>\r\n<li>Anda tidak dilarang untuk menerima segala aspek dari Layanan kami berdasarkan hukum yang berlaku atau memanfaatkan Layanan.</li>\r\n<li>Kami sebelumnya tidak pernah menonaktifkan akun Anda yang diakibatkan oleh adanya pelanggaran hukum atau pelanggaran kebijakan kami.</li>\r\n<li>Anda bukan merupakan seorang terpidana pelaku kejahatan seksual.</li>\r\n</ul>\r\n<p><strong>Cara yang Tidak Diperbolehkan Dalam Menggunakan Enablink.</strong> Menyediakan Layanan yang aman dan terbuka bagi siapa pun untuk komunitas yang luas mengharuskan partisipasi dari kita semua.</p>\r\n<ul>\r\n<li><strong>Anda tidak boleh menyamar sebagai orang lain atau memberikan informasi yang tidak akurat.</strong><br>Anda tidak diharuskan untuk mengungkapkan identitas Anda di Enablink, namun Anda harus memberikan informasi yang akurat dan terbaru kepada kami (termasuk informasi pendaftaran). Selain itu, Anda tidak boleh menyamar sebagai orang lain, dan Anda tidak boleh membuat akun untuk orang lain, kecuali Anda telah memperoleh izin yang tegas dari orang tersebut.</li>\r\n<li><strong>Anda tidak boleh melakukan pelanggaran hukum, perbuatan yang menyesatkan, menipu, maupun perbuatan untuk tujuan ilegal atau dilarang.</strong></li>\r\n<li><strong>Anda tidak boleh melanggar (atau membantu maupun mendorong orang lain untuk melanggar) Ketentuan ini atau kebijakan kami.</strong></li>\r\n<li><strong>Anda tidak boleh melakukan apa pun untuk mengganggu atau merusak operasi Layanan sebagaimana mestinya.</strong></li>\r\n<li><strong>Anda tidak boleh mencoba untuk membuat akun atau mengakses maupun mengumpulkan informasi secara tidak sah.</strong><br>Ini meliputi pembuatan akun atau pengumpulan informasi melalui cara otomatis tanpa izin tertulis dari kami.</li>\r\n<li><strong>Anda tidak boleh mencoba untuk membeli, menjual, atau mentransfer aspek mana pun dari akun Anda (termasuk nama pengguna Anda) atau meminta, mengumpulkan, atau menggunakan informasi masuk atau lencana milik pengguna lain.</strong></li>\r\n<li><strong>Anda tidak boleh memposting informasi pribadi, informasi rahasia, atau melakukan apa pun yang melanggar hak milik orang lain, termasuk hak kekayaan intelektual.</strong></li>\r\n<li><strong>Anda tidak boleh menggunakan nama domain atau URL di dalam nama pengguna Anda tanpa persetujuan tertulis dari kami.</strong></li>\r\n</ul>\r\n<p><strong>Izin yang Anda Berikan kepada Kami.</strong> Sebagai bagian dari perjanjian kita, Anda juga memberi kami izin yang kami perlukan untuk menyediakan Layanan. </p>\r\n<ul>\r\n<li><strong>Kami tidak mengklaim hak milik atas konten Anda, namun Anda memberi lisensi kepada kami untuk menggunakannya.</strong><br>Tidak ada yang berubah pada hak Anda atas konten Anda. Kami tidak mengklaim hak milik atas konten Anda yang dikirim di atau melalui Layanan. Sebagai gantinya, saat Anda membagikan, membuat postingan, atau mengunggah konten yang berada dalam cakupan hak kekayaan intelektual (seperti foto atau video) di dalam maupun yang berkaitan dengan Layanan kami, Anda memberi lisensi kepada kami yang bersifat non-eksklusif, bebas royalti, dapat dipindahkan, dapat disublisensikan, dan berlaku di seluruh dunia untuk menghosting, menggunakan, mendistribusikan, mengubah, menjalankan, menyalin, menayangkan secara publik, menerjemahkan, dan membuat karya turunan dari konten Anda</li>\r\n<li><strong>Izin untuk menggunakan nama pengguna Anda, foto profil Anda, dan informasi mengenai hubungan dan tindakan Anda dengan akun, iklan, dan konten bersponsor.</strong><br>Anda memberi izin kepada kami untuk menampilkan nama pengguna Anda, foto profil Anda, dan informasi mengenai tindakan Anda (seperti suka) atau hubungan (seperti mengikuti) di sekitar atau berkaitan dengan akun, iklan, promo, dan konten bersponsor lainnya yang Anda ikuti atau libatkan dalam interaksi Anda yang ditampilkan di Produk Facebook, tanpa adanya imbalan kepada Anda. Misalnya, kami dapat menunjukkan bahwa Anda menyukai postingan bersponsor yang dibuat oleh sebuah merek yang telah membayar kami untuk menampilkan iklannya di Enablink. Sebagaimana tindakan pada konten lainnya dan mengikuti akun lainnya, tindakan pada konten bersponsor dan mengikuti akun bersponsor hanya dapat dilihat oleh orang-orang yang memiliki izin untuk melihat konten tersebut atau mengikuti. Kami juga akan menghormati pengaturan iklan Anda.</li>\r\n<li><strong>Anda menyetujui bahwa kami dapat mengunduh dan memasang pembaruan pada Layanan di perangkat Anda.</strong></li>\r\n</ul>\r\n<p><strong>Hak-hak Tambahan yang Kami Miliki</strong></p>\r\n<ul>\r\n<li>Jika Anda memilih nama pengguna atau pengidentifikasi serupa untuk akun Anda, kami dapat mengubahnya jika menurut kami perubahan tersebut pantas dan perlu (misalnya, jika nama pengguna atau pengidentifikasi yang dimaksud melanggar hak kekayaan intelektual milik seseorang atau menyamar sebagai pengguna lain).</li>\r\n<li>Jika Anda menggunakan konten yang berada dalam cakupan hak kekayaan intelektual yang kami miliki dan sediakan di Layanan kami (seperti misalnya gambar, desain, video, atau suara yang kami sediakan yang Anda tambahkan ke konten yang Anda buat maupun bagikan), maka kami tetap memiliki semua hak atas konten kami (namun bukan konten Anda).</li>\r\n<li>Anda hanya dapat menggunakan kekayaan intelektual dan merek dagang kami maupun tanda-tanda serupa lainnya melalui cara yang diperbolehkan oleh <a href=\"https://www.instagram-brand.com/\">Panduan Merek</a>atau dengan izin tertulis dari kami.</li>\r\n</ul>\r\n<p><strong>Penghapusan Konten dan Penonaktifan atau Penghapusan Akun Anda</strong></p>\r\n<ul>\r\n<li>Kami dapat menghapus konten atau informasi apa pun yang Anda bagikan di Layanan jika kami meyakini bahwa konten atau informasi tersebut melanggar Ketentuan Penggunaan ini, kebijakan kami (termasuk <a href=\"http://help.instagram.com/477434105621119\">Panduan Komunitas PSLD</a>kami), atau kami diperbolehkan atau diwajibkan untuk melakukannya oleh hukum. Kami dapat menolak untuk menyediakan atau berhenti menyediakan semua atau sebagian dari Layanan kepada Anda (termasuk menghapus atau menonaktifkan akun Anda) secepatnya demi melindungi komunitas atau layanan kami, atau jika Anda membuat sesuatu yang menjadi ancaman atau risiko hukum bagi kami, melanggar Ketentuan Penggunaan ini atau kebijakan kami (termasuk <a href=\"http://help.instagram.com/477434105621119\">Panduan Komunitas PSLD</a> kami), jika Anda berulang kali melanggar hak kekayaan intelektual milik orang lain, atau ketika kami diperbolehkan atau diwajibkan untuk melakukannya oleh hukum. Jika kami mengambil tindakan untuk menonaktifkan atau menghapus akun Anda, maka kami akan memberi tahu Anda bila diperlukan. Jika Anda yakin bahwa penghapusan akun Anda merupakan suatu kesalahan, atau Anda ingin menonaktifkan atau menghapus akun Anda secara permanen, harap menghubungi kami.</li>\r\n</ul>\r\n<p><strong>Perjanjian Kita dan Hal yang Terjadi jika Kita Tidak Sepakat</strong></p>\r\n<p><strong>Perjanjian Kita.</strong></p>\r\n<ul>\r\n<li>Jika ada aspek tertentu dari perjanjian ini yang tidak dapat ditegakkan, maka aspek lain akan tetap berlaku.</li>\r\n<li>Perubahan atas atau pelepasan dari perjanjian kita harus dibuat secara tertulis dan ditandatangani oleh kami. Jika kami gagal untuk menegakkan aspek yang ada di perjanjian ini, maka hal tersebut tidak akan dianggap sebagai pelepasan.</li>\r\n<li>Kami memiliki semua hak yang tidak secara tersurat diberikan kepada Anda.</li>\r\n</ul>\r\n<p><strong>Pihak-pihak yang Berhak di Perjanjian ini.</strong></p>\r\n<ul>\r\n<li>Perjanjian ini tidak memberi hak apa pun kepada pihak ketiga.</li>\r\n<li>Anda tidak dapat memindahtangankan hak atau kewajiban Anda dalam perjanjian ini tanpa persetujuan dari kami.</li>\r\n<li>Hak dan kewajiban kami dapat dialihkan ke pihak lain. Seperti misalnya, pengalihan hak dan kewajiban tersebut dapat terjadi jika ada perubahan dalam kepemilikan kami (dalam merger, akuisisi, atau penjualan aset) atau menurut hukum.</li>\r\n</ul>\r\n<p><strong>Pihak yang Bertanggung Jawab Jika Terjadi Sesuatu.</strong></p>\r\n<ul>\r\n<li>Layanan kami disediakan \"sebagaimana adanya,\" dan kami tidak dapat menjamin bahwa Layanan tersebut akan senantiasa aman dan berfungsi dengan sempurna. SEJAUH YANG DIIZINKAN OLEH HUKUM, KAMI JUGA MELEPASKAN SEMUA JAMINAN, BAIK TERSIRAT MAUPUN TERSURAT, TERMASUK JAMINAN TERSIRAT PERIHAL KELAYAKAN SEBAGAI BARANG DAGANGAN, KESESUAIAN UNTUK TUJUAN TERTENTU, KEPEMILIKAN, DAN KETIADAAN PELANGGARAN.</li>\r\n<li>Kami juga tidak dapat mengontrol apa yang orang dan pihak lain lakukan atau katakan, dan kami tidak bertanggung jawab atas tindakan atau perilaku mereka (atau Anda) atau konten mereka (atau Anda) (baik online maupun offline) (termasuk konten yang melanggar hukum atau menimbulkan keberatan). Kami juga tidak bertanggung jawab atas layanan dan fitur yang ditawarkan oleh orang lain atau perusahaan lain, meskipun Anda mengaksesnya melalui Layanan kami.</li>\r\n<li>Tanggung jawab kami untuk apa pun yang terjadi di Layanan tersebut (yang disebut juga dengan \"pertanggungjawaban\") dibatasi sejauh dimungkinkan oleh hukum. Jika terdapat masalah dengan Layanan kami, kami tidak dapat mengetahui semua kemungkinan dampak yang dapat diakibatkan oleh masalah tersebut. Anda menyetujui bahwa kami tidak bertanggung jawab atas hilangnya keuntungan, pendapatan, informasi, atau data, atau kerugian yang bersifat konsekuensial, khusus, tidak langsung, luar biasa, punitif, atau insidental yang muncul dari atau berkaitan dengan Ketentuan ini, sekalipun kami tahu akan kemungkinan adanya kerugian tersebut. Ini meliputi saat kami menghapus konten, informasi, atau akun Anda.</li>\r\n</ul>\r\n<p><strong>Memperbarui Ketentuan Ini</strong></p>\r\n<p>Kami dapat mengubah Layanan dan kebijakan kami, dan kami mungkin perlu untuk membuat perubahan pada Ketentuan ini demi mencerminkan Layanan dan kebijakan kami secara akurat. Kecuali jika diwajibkan secara hukum, kami akan memberi tahu Anda (seperti misalnya, melalui Layanan kami) sebelum kami membuat perubahan pada Ketentuan ini dan memberi waktu kepada Anda untuk meninjau Ketentuan tersebut sebelum diberlakukan. Kemudian, jika Anda terus menggunakan Layanan, maka berarti Anda akan terikat dengan Ketentuan yang telah diperbarui tersebut. </p>'),
(25, 'preferensi', 'Bahasa Isyarat Sibi'),
(26, 'preferensi', 'Braille'),
(28, 'preferensi', 'Braille 2'),
(29, 'preferensi', 'Bahasa Isyarat Bisindo'),
(30, 'preferensi', 'Lain-lain'),
(31, 'preferensi', 'Typist / Juru Ketik'),
(32, 'max_frequensi_accompaniment', '4');

-- --------------------------------------------------------

--
-- Table structure for table `aplego_user`
--

CREATE TABLE `aplego_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(34) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `active` varchar(20) NOT NULL,
  `capability` varchar(20) NOT NULL,
  `last_login` datetime NOT NULL,
  `login_count` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `aplego_user`
--

INSERT INTO `aplego_user` (`user_id`, `username`, `password`, `name`, `email`, `active`, `capability`, `last_login`, `login_count`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$P$Bihyr0r3xhP2ywbW.ISEHyNRLzwXDc/', 'PSLD Universitas Brawijaya', 'psldbrawijaya@ub.ac.id', 'active', 'admin', '2023-11-29 18:19:04', 294, '2019-03-30 14:55:58', '2023-11-29 18:19:04'),
(3, 'adminLocal', '$P$Bt/myoP5vne9hoWBSSqLELIXYkN7cY.', 'admin', 'oponnb@gmail.com', 'active', 'admin', '2025-04-20 21:04:19', 3, '2025-04-19 17:47:38', '2025-04-20 21:04:19'),
(27, 'sulis', '$P$BCiW0O7cMV9N1KHdbOmGoESgAPUlSq1', 'Sulistyowatik', 'sulistyowatikk@gmail.com', 'active', 'admin', '2021-04-26 16:48:54', 351, '2019-06-30 21:33:26', '2021-04-26 16:48:54'),
(110, 'nastain', '$P$Bo3MchlFpmCFB/TKL4k0b3Z9ra012W.', 'Khairun Nasta\'in', 'khairunnastain@gmail.com', 'active', 'admin', '2024-03-28 14:02:14', 803, '2019-12-12 18:57:19', '2024-03-28 14:02:14'),
(111, 'mahalli', '$P$Bulhgcy7avFMrRDz1UkmqhBTFJwGlA/', 'Mahalli', 'mahallism@ub.ac.id', 'active', 'admin', '2020-01-20 09:46:46', 6, '2019-12-12 18:58:13', '2022-09-01 11:21:35'),
(139, 'lintang', '$P$B2zUm3zYrmiqR1r.01EG1uSeAsQL4M.', 'Alies Poetri Lintangsari', 'nickname7702@gmail.com', 'active', 'admin', '0000-00-00 00:00:00', 0, '2019-12-23 08:09:59', '0000-00-00 00:00:00'),
(462, 'Ismiarta', '$P$BnKvQsIWFvjsrhkTepcNpNyxC/wWh10', 'Ismiarta', 'contoh@gmail.com', 'active', 'admin', '2023-09-11 20:56:07', 55, '2020-12-02 13:56:59', '2023-09-11 20:56:07'),
(470, 'Riza', '$P$BIhsM6sbvcoJeQQw0saEwakhvV39xP/', 'Riza Aditya', 'riza.aditya@ub.ac.id', 'active', 'admin', '2024-03-01 09:30:50', 451, '2021-02-05 10:41:26', '2024-03-01 09:30:50'),
(1007, 'localAdmin', '$P$BSuoRQHmSOj2QEkuh7DOTv/PTXKt890', 'localAdmin', 'nickname7702@gmail.com', 'active', 'admin', '2025-05-04 21:55:33', 19, '2025-04-20 20:52:31', '2025-05-04 21:55:33'),
(1008, 'volunteer1', '$P$BPIkS.6I7hinZO6wK0h4lBZP2LTPxV/', 'volunteer1', 'bappakau69@gmail.com', 'active', 'volunteer', '2025-05-04 21:43:44', 37, '2025-04-22 10:30:16', '2025-05-04 21:43:44'),
(1009, 'volunteer2', '$P$BQm/6fj.WvaBhlJihtl6ORuHPfa12h/', 'volunteer2', 'bappakau69@gmail.com', 'active', 'volunteer', '2025-05-04 21:28:34', 19, '2025-04-22 10:31:41', '2025-05-04 21:28:34'),
(1010, 'volunteer3', '$P$BZqYleJiRU9hytULatKxb7sIicZxJ60', 'volunteer3', 'bappakau69@gmail.com', 'active', 'volunteer', '2025-05-04 21:42:33', 6, '2025-04-22 10:32:32', '2025-05-04 21:42:33'),
(1011, 'madif1', '$P$BLCP1HVBULvMhD7YMp9Dn88Afa/BMo.', 'madif1', 'pleh1234@gmail.com', 'active', 'difabel', '2025-04-23 18:24:57', 3, '2025-04-22 10:42:41', '2025-04-23 18:24:57'),
(1012, 'madif2', '$P$BclAtpBWoVkSiR8hzs92xjBoeV/zFT0', 'madif2', 'pleh1234@gmail.com', 'active', 'difabel', '2025-04-22 12:43:38', 2, '2025-04-22 10:44:00', '2025-04-22 12:43:38'),
(1013, 'madif3', '$P$BnP.IjAzCoo.pOCherh0F4CKYfa4K70', 'madif3', 'pleh1234@gmail.com', 'active', 'difabel', '2025-05-01 11:56:05', 6, '2025-04-22 10:44:55', '2025-05-01 11:56:05'),
(1014, 'volunteer4', '$P$BkcLwJoLghEGelwkXINDcE5Jy6U87R1', 'volunteer4', 'bappakau69@gmail.com', 'active', 'volunteer', '2025-05-04 16:38:44', 7, '2025-04-25 15:03:07', '2025-05-04 16:38:44');

-- --------------------------------------------------------

--
-- Table structure for table `aplego_user_meta`
--

CREATE TABLE `aplego_user_meta` (
  `meta_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `meta_key` varchar(100) NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `aplego_user_meta`
--

INSERT INTO `aplego_user_meta` (`meta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(2422, 3, 'jenis_difabel', 'Tunanetra'),
(2423, 3, 'jenis_difabel', 'Tunanetra'),
(2424, 1007, 'jenis_preferensi', 'Bahasa Isyarat Sibi'),
(2425, 1008, 'jenis_preferensi', 'Typist / Juru Ketik'),
(2426, 1009, 'jenis_preferensi', 'Typist / Juru Ketik'),
(2427, 1010, 'jenis_preferensi', 'Typist / Juru Ketik'),
(2428, 1011, 'jenis_difabel', 'Tunanetra'),
(2429, 1011, 'jenis_difabel', 'Tunanetra'),
(2430, 1012, 'jenis_difabel', 'Tunarungu'),
(2431, 1012, 'jenis_difabel', 'Tunarungu'),
(2432, 1013, 'jenis_difabel', 'Tunarungu'),
(2433, 1013, 'jenis_difabel', 'Tunarungu'),
(2434, 1014, 'jenis_preferensi', 'Typist / Juru Ketik');

-- --------------------------------------------------------

--
-- Table structure for table `app_accompaniment`
--

CREATE TABLE `app_accompaniment` (
  `accompaniment_id` int(10) UNSIGNED NOT NULL,
  `semester_id` int(10) UNSIGNED DEFAULT NULL,
  `schedule_student_id` int(10) UNSIGNED DEFAULT NULL,
  `volunteer_id` int(10) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `student_status` varchar(20) DEFAULT 'terjadwal',
  `volunteer_status` varchar(20) DEFAULT 'terjadwal',
  `review` int(11) DEFAULT NULL,
  `review_note` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `new_room` varchar(255) DEFAULT NULL,
  `new_day` int(11) DEFAULT NULL,
  `new_start_at` time DEFAULT NULL,
  `new_end_at` time DEFAULT NULL,
  `new_volunteer_id` int(11) DEFAULT NULL,
  `volunteer_change_status` varchar(50) DEFAULT NULL,
  `accompaniment_note` varchar(255) DEFAULT NULL,
  `code_attending` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `app_accompaniment`
--

INSERT INTO `app_accompaniment` (`accompaniment_id`, `semester_id`, `schedule_student_id`, `volunteer_id`, `date`, `student_status`, `volunteer_status`, `review`, `review_note`, `note`, `created_at`, `updated_at`, `new_room`, `new_day`, `new_start_at`, `new_end_at`, `new_volunteer_id`, `volunteer_change_status`, `accompaniment_note`, `code_attending`) VALUES
(1139535, 31, 6285, 1008, '2025-04-28', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '322354'),
(1139536, 31, 6286, 1002, '2025-04-28', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '362690'),
(1139537, 31, 6296, 1002, '2025-04-29', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '158641'),
(1139538, 31, 6291, 1004, '2025-04-29', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '332245'),
(1139539, 31, 6288, 1003, '2025-04-30', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '815212'),
(1139540, 31, 6293, 1008, '2025-04-30', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '664383'),
(1139541, 31, 6294, 1003, '2025-04-30', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '130835'),
(1139542, 31, 6289, 1002, '2025-05-01', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '397496'),
(1139543, 31, 6290, 1004, '2025-05-01', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '727357'),
(1139544, 31, 6295, 1003, '2025-05-02', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '561666'),
(1139545, 31, 6285, 1008, '2025-05-05', 'terjadwal', 'terjadwal', NULL, NULL, 'a', '2025-04-28 14:23:33', '2025-04-28 14:24:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '731655'),
(1139546, 31, 6286, 1002, '2025-05-05', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '253808'),
(1139547, 31, 6296, 1002, '2025-05-06', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '219291'),
(1139548, 31, 6291, 1004, '2025-05-06', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '367612'),
(1139549, 31, 6288, 1008, '2025-05-07', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '263944'),
(1139550, 31, 6293, 1008, '2025-05-07', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '255787'),
(1139551, 31, 6294, 1003, '2025-05-07', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '696816'),
(1139552, 31, 6289, 1002, '2025-05-08', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '233125'),
(1139553, 31, 6290, 1004, '2025-05-08', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '801327'),
(1139554, 31, 6295, 1008, '2025-05-09', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '432499'),
(1139555, 31, 6285, 1008, '2025-05-12', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '405922'),
(1139556, 31, 6286, 1002, '2025-05-12', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '498580'),
(1139557, 31, 6296, 1002, '2025-05-13', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '146630'),
(1139558, 31, 6291, 1004, '2025-05-13', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '370624'),
(1139559, 31, 6288, 1008, '2025-05-14', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '618425'),
(1139560, 31, 6293, 1008, '2025-05-14', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '521630'),
(1139561, 31, 6294, 1002, '2025-05-14', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '546577'),
(1139562, 31, 6289, 1002, '2025-05-15', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '780240'),
(1139563, 31, 6290, 1004, '2025-05-15', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '572316'),
(1139564, 31, 6295, 1008, '2025-05-16', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '437550'),
(1139565, 31, 6285, 1008, '2025-05-19', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '229018'),
(1139566, 31, 6286, 1002, '2025-05-19', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '724996'),
(1139567, 31, 6296, 1002, '2025-05-20', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '288063'),
(1139568, 31, 6291, 1004, '2025-05-20', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '260237'),
(1139569, 31, 6288, 1008, '2025-05-21', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '899059'),
(1139570, 31, 6293, 1008, '2025-05-21', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '486834'),
(1139571, 31, 6294, 1002, '2025-05-21', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '775151'),
(1139572, 31, 6289, 1002, '2025-05-22', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '590523'),
(1139573, 31, 6290, 1004, '2025-05-22', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '522864'),
(1139574, 31, 6295, 1008, '2025-05-23', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '695559'),
(1139575, 31, 6285, 1008, '2025-05-26', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '539809'),
(1139576, 31, 6286, 1002, '2025-05-26', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '543237'),
(1139577, 31, 6296, 1002, '2025-05-27', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '440287'),
(1139578, 31, 6291, 1004, '2025-05-27', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '411731'),
(1139579, 31, 6288, 1003, '2025-05-28', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '526816'),
(1139580, 31, 6293, 1008, '2025-05-28', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '757381'),
(1139581, 31, 6294, 1002, '2025-05-28', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '832798'),
(1139582, 31, 6289, 1002, '2025-05-29', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '294083'),
(1139583, 31, 6290, 1004, '2025-05-29', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '288590'),
(1139584, 31, 6295, 1008, '2025-05-30', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '297108'),
(1139585, 31, 6285, 1008, '2025-06-02', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '769952'),
(1139586, 31, 6286, 1002, '2025-06-02', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '117541'),
(1139587, 31, 6296, 1002, '2025-06-03', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '254285'),
(1139588, 31, 6291, 1004, '2025-06-03', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '122716'),
(1139589, 31, 6288, 1003, '2025-06-04', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '432110'),
(1139590, 31, 6293, 1008, '2025-06-04', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '763917'),
(1139591, 31, 6294, 1002, '2025-06-04', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '669021'),
(1139592, 31, 6289, 1002, '2025-06-05', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '462712'),
(1139593, 31, 6290, 1004, '2025-06-05', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '783877'),
(1139594, 31, 6295, 1008, '2025-06-06', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '730021'),
(1139595, 31, 6285, 1008, '2025-06-09', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '162110'),
(1139596, 31, 6286, 1002, '2025-06-09', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '729413'),
(1139597, 31, 6296, 1002, '2025-06-10', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '530622'),
(1139598, 31, 6291, 1004, '2025-06-10', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '456632'),
(1139599, 31, 6288, 1003, '2025-06-11', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '389726'),
(1139600, 31, 6293, 1008, '2025-06-11', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '129620'),
(1139601, 31, 6294, 1002, '2025-06-11', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '877037'),
(1139602, 31, 6289, 1002, '2025-06-12', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '628724'),
(1139603, 31, 6290, 1004, '2025-06-12', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '399005'),
(1139604, 31, 6295, 1008, '2025-06-13', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '715234'),
(1139605, 31, 6285, 1008, '2025-06-16', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '463445'),
(1139606, 31, 6286, 1002, '2025-06-16', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '774659'),
(1139607, 31, 6296, 1002, '2025-06-17', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '749623'),
(1139608, 31, 6291, 1004, '2025-06-17', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '308951'),
(1139609, 31, 6288, 1003, '2025-06-18', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '619299'),
(1139610, 31, 6293, 1008, '2025-06-18', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '264791'),
(1139611, 31, 6294, 1002, '2025-06-18', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '156754'),
(1139612, 31, 6289, 1002, '2025-06-19', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '170339'),
(1139613, 31, 6290, 1004, '2025-06-19', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '701743'),
(1139614, 31, 6295, 1008, '2025-06-20', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '267979'),
(1139615, 31, 6285, 1008, '2025-06-23', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '195678'),
(1139616, 31, 6286, 1002, '2025-06-23', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '831643'),
(1139617, 31, 6296, 1002, '2025-06-24', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '405734'),
(1139618, 31, 6291, 1004, '2025-06-24', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '386276'),
(1139619, 31, 6288, 1003, '2025-06-25', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '747116'),
(1139620, 31, 6293, 1008, '2025-06-25', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '359315'),
(1139621, 31, 6294, 1002, '2025-06-25', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '559505'),
(1139622, 31, 6289, 1002, '2025-06-26', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '700980'),
(1139623, 31, 6290, 1004, '2025-06-26', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '710474'),
(1139624, 31, 6295, 1008, '2025-06-27', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '118348'),
(1139625, 31, 6285, 1008, '2025-06-30', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '417596'),
(1139626, 31, 6286, 1002, '2025-06-30', 'terjadwal', 'terjadwal', NULL, NULL, NULL, '2025-04-28 14:23:33', '2025-04-28 14:23:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '147861');

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_accompaniment_base_view`
-- (See below for the actual view)
--
CREATE TABLE `app_accompaniment_base_view` (
`accompaniment_id` int(10) unsigned
,`semester_id` int(10) unsigned
,`schedule_student_id` int(10) unsigned
,`volunteer_id` decimal(10,0)
,`volunteer_change_status` varchar(50)
,`new_volunteer_id` int(11)
,`start_at` time
,`end_at` time
,`new_day` int(11)
,`nick_name` varchar(100)
,`date` date
,`student_status` varchar(20)
,`volunteer_status` varchar(20)
,`accompaniment_note` varchar(255)
,`review_note` varchar(255)
,`review` int(11)
,`created_at` datetime
,`updated_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_accompaniment_schedule_volunteer_view`
-- (See below for the actual view)
--
CREATE TABLE `app_accompaniment_schedule_volunteer_view` (
`accompaniment_id` int(10) unsigned
,`student_id` int(10) unsigned
,`schedule_type` varchar(100)
,`semester_id` int(10) unsigned
,`schedule_student_id` int(10) unsigned
,`accompaniment_note` varchar(255)
,`review_note` varchar(255)
,`review` int(11)
,`volunteer_id` decimal(10,0)
,`volunteer_change_status` varchar(50)
,`new_volunteer_id` int(11)
,`start_at` time
,`end_at` time
,`new_day` int(11)
,`day` int(11)
,`date` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_accompaniment_view`
-- (See below for the actual view)
--
CREATE TABLE `app_accompaniment_view` (
`accompaniment_id` int(10) unsigned
,`user_id` int(10) unsigned
,`username` varchar(100)
,`name` varchar(100)
,`student_id` int(10) unsigned
,`majors_id` int(10) unsigned
,`majors_name` varchar(100)
,`majors_focus` varchar(100)
,`faculty_id` int(10) unsigned
,`faculty_name` varchar(100)
,`nick_name` varchar(100)
,`class_of_college` year(4)
,`no_hp` varchar(15)
,`photo` varchar(255)
,`semester_id` int(10) unsigned
,`schedule_student_id` int(10) unsigned
,`start_at` time
,`end_at` time
,`day` int(11)
,`room` varchar(255)
,`date` date
,`courses` varchar(200)
,`sks` int(11)
,`schedule_type` varchar(100)
,`new_volunteer_id` int(11)
,`new_day` int(11)
,`volunteer_id` decimal(10,0)
,`volunteer_change_status` varchar(50)
,`volunteer_majors_id` int(10) unsigned
,`volunteer_majors_name` varchar(100)
,`volunteer_majors_focus` varchar(100)
,`volunteer_faculty_id` int(10) unsigned
,`volunteer_faculty_name` varchar(100)
,`volunteer_nick_name` varchar(100)
,`volunteer_class_of_college` year(4)
,`volunteer_no_hp` varchar(15)
,`volunteer_photo` varchar(255)
,`volunteer_user_id` int(10) unsigned
,`volunteer_username` varchar(100)
,`volunteer_name` varchar(100)
,`note` varchar(255)
,`student_status` varchar(20)
,`volunteer_status` varchar(20)
,`accompaniment_note` varchar(255)
,`review_note` varchar(255)
,`review` int(11)
,`created_at` datetime
,`updated_at` datetime
,`code_attending` varchar(6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_accompaniment_view_update`
-- (See below for the actual view)
--
CREATE TABLE `app_accompaniment_view_update` (
`accompaniment_id` int(10) unsigned
,`user_id` int(10) unsigned
,`username` varchar(100)
,`name` varchar(100)
,`jenis_disabilitas` text
,`student_id` int(10) unsigned
,`majors_id` int(10) unsigned
,`majors_name` varchar(100)
,`faculty_id` int(10) unsigned
,`faculty_name` varchar(100)
,`nick_name` varchar(100)
,`class_of_college` year(4)
,`no_hp` varchar(15)
,`photo` varchar(255)
,`semester_id` int(10) unsigned
,`schedule_student_id` int(10) unsigned
,`start_at` time
,`end_at` time
,`day` int(11)
,`room` varchar(100)
,`courses` varchar(200)
,`sks` int(11)
,`volunteer_id` int(10) unsigned
,`volunteer_majors_id` int(10) unsigned
,`volunteer_majors_name` varchar(100)
,`volunteer_faculty_id` int(10) unsigned
,`volunteer_faculty_name` varchar(100)
,`volunteer_nick_name` varchar(100)
,`volunteer_class_of_college` year(4)
,`volunteer_no_hp` varchar(15)
,`volunteer_photo` varchar(255)
,`volunteer_user_id` int(10) unsigned
,`volunteer_username` varchar(100)
,`volunteer_name` varchar(100)
,`date` date
,`student_status` varchar(20)
,`volunteer_status` varchar(20)
,`review` int(11)
,`created_at` datetime
,`updated_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_chart_accompainiment_pendampingan_view`
-- (See below for the actual view)
--
CREATE TABLE `app_chart_accompainiment_pendampingan_view` (
`semester_id` int(10) unsigned
,`student_id` int(10) unsigned
,`date` varchar(7)
,`terjadwal` decimal(22,0)
,`belum_datang` decimal(22,0)
,`selesai` decimal(22,0)
,`izin` decimal(22,0)
,`tidak_datang` decimal(22,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_chart_accompainiment_view`
-- (See below for the actual view)
--
CREATE TABLE `app_chart_accompainiment_view` (
`semester_id` int(10) unsigned
,`date` varchar(7)
,`terjadwal` decimal(22,0)
,`belum_datang` decimal(22,0)
,`selesai` decimal(22,0)
,`izin` decimal(22,0)
,`tidak_datang` decimal(22,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_chart_accompainiment_volunteer_view`
-- (See below for the actual view)
--
CREATE TABLE `app_chart_accompainiment_volunteer_view` (
`semester_id` int(10) unsigned
,`volunteer_id` decimal(10,0)
,`date` varchar(7)
,`terjadwal` decimal(22,0)
,`belum_datang` decimal(22,0)
,`selesai` decimal(22,0)
,`izin` decimal(22,0)
,`tidak_datang` decimal(22,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `app_faculties`
--

CREATE TABLE `app_faculties` (
  `faculty_id` int(10) UNSIGNED NOT NULL,
  `faculty_name` varchar(100) DEFAULT NULL,
  `is_active` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `app_faculties`
--

INSERT INTO `app_faculties` (`faculty_id`, `faculty_name`, `is_active`) VALUES
(9, 'Fakultas Hukum', 0),
(10, 'Fakultas Ekonomi dan Bisnis', 0),
(11, 'Fakultas Ilmu Administrasi', 0),
(12, 'Fakultas Pertanian', 0),
(13, 'Fakultas Peternakan', 0),
(14, 'Fakultas Teknik', 0),
(15, 'Fakultas Kedokteran', 0),
(16, 'Fakultas Perikanan dan Ilmu Kelautan', 0),
(17, 'Fakultas Matematika & IPA', 0),
(18, 'Fakultas Teknologi Pertanian', 0),
(19, 'Fakultas Ilmu Sosial dan Ilmu Politik', 0),
(20, 'Fakultas Ilmu Budaya', 0),
(21, 'Fakultas Kedokteran Hewan', 0),
(22, 'Fakultas Ilmu Komputer', 0),
(23, 'Fakultas Vokasi', 0),
(24, 'Magister - Program Studi Pascasarjana', 0),
(25, 'Doktor', 0),
(26, 'Fakultas Pascasarjana', 0),
(27, 'Fakultas Kedokteran Gigi', 0),
(28, 'Fakultas Ilmu Kesehatan', 0),
(29, 'Fakultas Hukum', 1),
(30, 'Fakultas Ekonomi dan Bisnis', 1),
(31, 'Fakultas Ilmu Administrasi', 1),
(32, 'Fakultas Pertanian', 1),
(33, 'Fakultas Peternakan', 1),
(34, 'Fakultas Teknik', 1),
(35, 'Fakultas Kedokteran', 1),
(36, 'Fakultas Perikanan dan Ilmu Kelautan', 1),
(37, 'Fakultas Matematika & IPA', 1),
(38, 'Fakultas Teknologi Pertanian', 1),
(39, 'Fakultas Ilmu Budaya', 1),
(40, 'Fakultas Ilmu Sosial dan Ilmu Politik', 1),
(41, 'Fakultas Kedokteran Hewan', 1),
(42, 'Fakultas Ilmu Komputer', 1),
(43, 'Fakultas Kedokteran Gigi', 1),
(44, 'Fakultas Vokasi', 1),
(45, 'Fakultas Pascasarjana', 1),
(46, 'Fakultas Ilmu Kesehatan', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_faculty_view`
-- (See below for the actual view)
--
CREATE TABLE `app_faculty_view` (
`faculty_id` int(10) unsigned
,`faculty_name` varchar(100)
,`majors_id` int(10) unsigned
,`majors_name` varchar(100)
,`majors_focus` varchar(100)
,`level` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_group_schedule_volunteer_view`
-- (See below for the actual view)
--
CREATE TABLE `app_group_schedule_volunteer_view` (
);

-- --------------------------------------------------------

--
-- Table structure for table `app_majors`
--

CREATE TABLE `app_majors` (
  `majors_id` int(10) UNSIGNED NOT NULL,
  `faculty_id` int(10) UNSIGNED NOT NULL,
  `majors_name` varchar(100) DEFAULT NULL,
  `majors_focus` varchar(100) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `app_majors`
--

INSERT INTO `app_majors` (`majors_id`, `faculty_id`, `majors_name`, `majors_focus`, `level`, `is_active`) VALUES
(17, 9, 'Ilmu Hukum', NULL, NULL, 0),
(18, 10, 'Ekonomi Pembangunan', NULL, NULL, 0),
(19, 10, 'Ekonomi Islam', NULL, NULL, 0),
(20, 10, 'Manajemen', NULL, NULL, 0),
(21, 10, 'Akuntansi', NULL, NULL, 0),
(22, 10, 'Kewirausahaan', NULL, NULL, 0),
(23, 10, 'Keuangan dan Perbankan', NULL, NULL, 0),
(24, 11, 'Administrasi Publik', NULL, NULL, 0),
(25, 11, 'Administrasi Bisnis', NULL, NULL, 0),
(26, 11, 'Perpajakan', NULL, NULL, 0),
(27, 11, 'Ilmu Perpustakaan', NULL, NULL, 0),
(28, 11, 'Pariwisata', NULL, NULL, 0),
(29, 11, 'Administrasi Pendidikan', NULL, NULL, 0),
(30, 12, 'Agroekoteknologi', NULL, NULL, 0),
(31, 12, 'Agribisnis', NULL, NULL, 0),
(32, 13, 'Peternakan', NULL, NULL, 0),
(33, 14, 'Teknik Sipil', NULL, NULL, 0),
(34, 14, 'Teknik Industri', NULL, NULL, 0),
(35, 14, 'Teknik Elektro', NULL, NULL, 0),
(36, 14, 'Arsitektur', NULL, NULL, 0),
(37, 14, 'Teknik Pengairan', NULL, NULL, 0),
(38, 14, 'Perencanaan Wilayah & Kota', NULL, NULL, 0),
(39, 14, 'Teknik Mesin', NULL, NULL, 0),
(40, 14, 'Teknik Kimia', NULL, NULL, 0),
(41, 15, 'Pendidikan Dokter', NULL, NULL, 0),
(42, 15, 'Pendidikan Dokter Gigi', NULL, NULL, 0),
(43, 15, 'Ilmu Keperawatan', NULL, NULL, 0),
(44, 15, 'Gizi Kesehatan/Ilmu Gizi', NULL, NULL, 0),
(45, 15, 'Kebidanan', NULL, NULL, 0),
(46, 15, 'Farmasi', NULL, NULL, 0),
(47, 16, 'Manajemen Sumberdaya Perairan', NULL, NULL, 0),
(48, 16, 'Budidaya Perairan', NULL, NULL, 0),
(49, 16, 'Teknologi Hasil Perikanan', NULL, NULL, 0),
(50, 16, 'Pemanfaatan Sumberdaya Perikanan', NULL, NULL, 0),
(51, 16, 'Ilmu Kelautan', NULL, NULL, 0),
(52, 16, 'Agrobisnis Perikanan', NULL, NULL, 0),
(53, 17, 'Biologi', NULL, NULL, 0),
(54, 17, 'Fisika', NULL, NULL, 0),
(55, 17, 'Kimia', NULL, NULL, 0),
(56, 17, 'Matematika', NULL, NULL, 0),
(57, 17, 'Statistika', NULL, NULL, 0),
(58, 17, 'Teknik Geofisika', NULL, NULL, 0),
(59, 17, 'Instrumentasi', NULL, NULL, 0),
(60, 18, 'Teknologi Pangan', NULL, NULL, 0),
(61, 18, 'Teknik Pertanian dan Biosistem', NULL, NULL, 0),
(62, 18, 'Teknologi Industri Pertanian', NULL, NULL, 0),
(63, 18, 'Bioteknologi', NULL, NULL, 0),
(64, 18, 'Teknik Lingkungan', NULL, NULL, 0),
(65, 18, 'Teknologi Bioproses', NULL, NULL, 0),
(66, 19, 'Sosiologi', NULL, NULL, 0),
(67, 19, 'Ilmu Komunikasi', NULL, NULL, 0),
(68, 19, 'Psikologi', NULL, NULL, 0),
(69, 19, 'Hubungan Internasional', NULL, NULL, 0),
(70, 19, 'Ilmu Politik', NULL, NULL, 0),
(71, 19, 'Ilmu Pemerintahan', NULL, NULL, 0),
(72, 20, 'Sastra Inggris', NULL, NULL, 0),
(73, 20, 'Sastra Jepang', NULL, NULL, 0),
(74, 20, 'Bahasa Dan Sastra Prancis', NULL, NULL, 0),
(75, 20, 'Sastra Cina', NULL, NULL, 0),
(76, 20, 'Pendidikan Bhs & Sastra Indonesia', NULL, NULL, 0),
(77, 20, 'Pendidikan Bahasa Inggris', NULL, NULL, 0),
(78, 20, 'Pendidikan Bahasa Jepang', NULL, NULL, 0),
(79, 20, 'Seni Rupa Murni', NULL, NULL, 0),
(80, 20, 'Antropologi', NULL, NULL, 0),
(81, 21, 'Pendidikan Dokter Hewan', NULL, NULL, 0),
(82, 22, 'Teknik Informatika', NULL, NULL, 0),
(83, 22, 'Sistem Informasi', NULL, NULL, 0),
(84, 22, 'Pendidikan Teknologi Informasi', NULL, NULL, 0),
(85, 22, 'Teknologi Informasi', NULL, NULL, 0),
(86, 22, 'Teknik Komputer', NULL, NULL, 0),
(87, 23, 'Manajemen Perhotelan', NULL, 'D4', 0),
(88, 23, 'Desain Grafis', NULL, 'D4', 0),
(89, 23, 'Bidang Keahlian Sekretaris', NULL, NULL, 0),
(90, 23, 'Kesekretariatan BK. Public Relations', NULL, NULL, 0),
(91, 23, 'Bidang Keahlian Bahasa Inggris', NULL, NULL, 0),
(92, 23, 'Kesekretariatan BK. Perpustakaan dan Arsip', NULL, NULL, 0),
(93, 23, 'Bidang Keahlian Perancangan Peraturan dan Kontrak Bisnis', NULL, NULL, 0),
(94, 23, 'Bidang Keahlian Perbankan', NULL, NULL, 0),
(95, 23, 'Keuangan dan Perbankan BK. Akuntansi Terapan', NULL, NULL, 0),
(96, 23, 'Teknik Komputer BK. Teknologi Informasi dan Komputer', NULL, NULL, 0),
(97, 23, 'Teknik Komputer BK. Business Digital dan E-Commerce', NULL, NULL, 0),
(98, 23, 'Teknik Komputer BK. Sistem Informasi', NULL, NULL, 0),
(99, 23, 'Desain Grafis BK. Desain Komunikasi Visual', NULL, NULL, 0),
(100, 23, 'Teknik Komputer BK. Film dan Televisi', NULL, NULL, 0),
(101, 23, 'Desain Grafis BK. Desain Interior', NULL, NULL, 0),
(102, 23, 'Bidang Keahlian Pariwisata', NULL, NULL, 0),
(103, 23, 'Bidang Keahlian Perhotelan', NULL, NULL, 0),
(104, 23, 'Bidang Keahlian Perpajakan', NULL, NULL, 0),
(105, 24, 'S2 - Ilmu Lingkungan', NULL, NULL, 0),
(106, 24, 'S2 - Studi Pertanahan', NULL, NULL, 0),
(107, 24, 'S2 - Kajian Gender', NULL, NULL, 0),
(108, 25, 'S3 - Ilmu Lingkungan', NULL, NULL, 0),
(109, 25, 'S3 - Studi Pertanahan', NULL, NULL, 0),
(110, 24, 'S2 - Budidaya Perairan', NULL, NULL, 0),
(367, 29, 'Ilmu Hukum', 'SOSHUM', 'S1', 1),
(368, 29, 'Ilmu Hukum', 'SOSHUM', 'S2', 1),
(369, 29, 'Kenotariatan', 'SOSHUM', 'S2', 1),
(370, 29, 'Ilmu Hukum', 'SOSHUM', 'S3', 1),
(371, 29, 'Ilmu Hukum Kampus Jakarta', 'SOSHUM', 'S3', 1),
(372, 30, 'Kewirausahaan', 'SOSHUM', 'S1', 1),
(373, 30, 'Manajemen', 'SOSHUM', 'S1', 1),
(374, 30, 'Manajemen', NULL, 'S2', 1),
(375, 30, 'Ilmu Manajemen', NULL, 'S3', 1),
(376, 30, 'Manajemen Kampus Jakarta', NULL, 'S3', 1),
(377, 30, 'Akuntansi', 'SOSHUM', 'S1', 1),
(378, 30, 'Akuntansi', NULL, 'S2', 1),
(379, 30, 'Ilmu Akuntansi', NULL, 'S3', 1),
(380, 30, 'Ekonomi Pembangunan', 'SOSHUM', 'S1', 1),
(381, 30, 'Ekonomi Islam', 'SOSHUM', 'S1', 1),
(382, 30, 'Ekonomi, Keuangan Dan Perbankan', 'SOSHUM', 'S1', 1),
(383, 30, 'Ilmu Ekonomi', NULL, 'S2', 1),
(384, 30, 'Ilmu Ekonomi', NULL, 'S3', 1),
(385, 31, 'Administrasi Bisnis', 'SOSHUM', 'S1', 1),
(386, 31, 'Perpajakan', 'SOSHUM', 'S1', 1),
(387, 31, 'Pariwisata', 'SOSHUM', 'S1', 1),
(388, 31, 'Administrasi Kampus Jakarta', 'SOSHUM', 'S3', 1),
(389, 31, 'Administrasi Bisnis', 'SOSHUM', 'S2', 1),
(390, 31, 'Administrasi Publik', 'SOSHUM', 'S1', 1),
(391, 31, 'Ilmu Perpustakaan', 'SOSHUM', 'S1', 1),
(392, 31, 'Administrasi Pendidikan', 'SOSHUM', 'S1', 1),
(393, 31, 'Manajemen Pendidikan Tinggi', 'SOSHUM', 'S2', 1),
(394, 31, 'Ilmu Administrasi Publik', NULL, 'S2', 1),
(395, 31, 'Ilmu Administrasi', 'SOSHUM', 'S3', 1),
(396, 32, 'Agroekoteknologi', 'SAINTEK', 'S1', 1),
(397, 32, 'Agroekoteknologi (PSDKU Kediri)', 'SAINTEK', 'S1', 1),
(398, 32, 'Agronomi', 'SAINTEK', 'S2', 1),
(399, 32, 'Agribisnis', 'SAINTEK', 'S1', 1),
(400, 32, 'Agribisnis (PSDKU Kediri)', 'SAINTEK', 'S1', 1),
(401, 32, 'Ekonomi Pertanian', 'SAINTEK', 'S2', 1),
(402, 32, 'Sosiologi', 'SAINTEK', 'S2', 1),
(403, 32, 'Agribisnis', 'SAINTEK', 'S2', 1),
(404, 32, 'Pengelolaan Tanah dan Air', 'SAINTEK', 'S2', 1),
(405, 32, 'Kehutanan', 'SAINTEK', 'S1', 1),
(406, 32, 'Patologi Tumbuhan', 'SAINTEK', 'S2', 1),
(407, 32, 'Entomologi Tanaman', 'SAINTEK', 'S2', 1),
(408, 32, 'Ilmu Pertanian', 'SAINTEK', 'S3', 1),
(409, 33, 'Peternakan', 'SAINTEK', 'S1', 1),
(410, 33, 'Peternakan (PSDKU Kediri)', 'SAINTEK', 'S1', 1),
(411, 33, 'Ilmu Ternak', 'SAINTEK', 'S2', 1),
(412, 33, 'Ilmu Ternak', 'SAINTEK', 'S3', 1),
(413, 34, 'Teknik Mesin', 'SAINTEK', 'S1', 1),
(414, 34, 'Teknik Mesin', NULL, 'S2', 1),
(415, 34, 'Ilmu Teknik Mesin', NULL, 'S3', 1),
(416, 34, 'Teknik Elektro', 'SAINTEK', 'S1', 1),
(417, 34, 'Teknik Elektro', NULL, 'S2', 1),
(418, 34, 'Arsitektur', 'SAINTEK', 'S1', 1),
(419, 34, 'Arsitektur Lingkungan Binaan', NULL, 'S2', 1),
(420, 34, 'Teknik Pengairan', 'SAINTEK', 'S1', 1),
(421, 34, 'Teknik Pengairan', NULL, 'S2', 1),
(422, 34, 'Teknik Sumber Daya Air', NULL, 'S3', 1),
(423, 34, 'Perencanaan Wilayah & Kota', 'SAINTEK', 'S1', 1),
(424, 34, 'Perencanaan Wilayah Dan Kota', NULL, 'S2', 1),
(425, 34, 'Teknik Industri', 'SAINTEK', 'S1', 1),
(426, 34, 'Teknik Kimia', 'SAINTEK', 'S1', 1),
(427, 34, 'Teknik Sipil', 'SAINTEK', 'S1', 1),
(428, 34, 'Teknik Sipil', NULL, 'S2', 1),
(429, 34, 'Ilmu Teknik Sipil', NULL, 'S3', 1),
(430, 35, 'Kedokteran', 'SAINTEK', 'S1', 1),
(431, 35, 'Ilmu Biomedik', NULL, 'S2', 1),
(432, 35, 'Ilmu Kedokteran', NULL, 'S3', 1),
(433, 35, 'Manajemen Rumah Sakit', NULL, 'S2', 1),
(434, 35, 'Keperawatan', NULL, 'S2', 1),
(435, 35, 'Ilmu Keperawatan', 'SAINTEK', 'S1', 1),
(436, 35, 'Ilmu Gizi', 'SAINTEK', 'S1', 1),
(437, 35, 'Kebidanan', 'SAINTEK', 'S1', 1),
(438, 35, 'Kebidanan', NULL, 'S2', 1),
(439, 35, 'Farmasi', 'SAINTEK', 'S1', 1),
(440, 36, 'Pemanfaatan Sumberdaya Perikanan', 'SAINTEK', 'S1', 1),
(441, 36, 'Ilmu Kelautan', 'SAINTEK', 'S1', 1),
(442, 36, 'Agrobisnis Perikanan', 'SAINTEK', 'S1', 1),
(443, 36, 'Sosial Ekonomi Perikanan (PSDKU Kediri)', 'SAINTEK', 'S1', 1),
(444, 36, 'Teknologi Hasil Perikanan', 'SAINTEK', 'S1', 1),
(445, 36, 'Manajemen Sumberdaya Perairan', 'SAINTEK', 'S1', 1),
(446, 36, 'Budidaya Perairan', 'SAINTEK', 'S1', 1),
(447, 36, 'Akuakultur (PSDKU Kediri)', 'SAINTEK', 'S1', 1),
(448, 36, 'Ilmu Perikanan dan Kelautan', 'SAINTEK', 'S3', 1),
(449, 36, 'Budidaya Perairan', 'SAINTEK', 'S2', 1),
(450, 37, 'Biologi', 'SAINTEK', 'S1', 1),
(451, 37, 'Biologi', 'SAINTEK', 'S2', 1),
(452, 37, 'Biologi', 'SAINTEK', 'S3', 1),
(453, 37, 'Instrumentasi', 'SAINTEK', 'S1', 1),
(454, 37, 'Teknik Geofisika', 'SAINTEK', 'S1', 1),
(455, 37, 'Fisika', 'SAINTEK', 'S1', 1),
(456, 37, 'Fisika', 'SAINTEK', 'S2', 1),
(457, 37, 'Fisika', 'SAINTEK', 'S3', 1),
(458, 37, 'Kimia', 'SAINTEK', 'S1', 1),
(459, 37, 'Kimia', 'SAINTEK', 'S2', 1),
(460, 37, 'Kimia', 'SAINTEK', 'S3', 1),
(461, 37, 'Matematika', 'SAINTEK', 'S1', 1),
(462, 37, 'Matematika', 'SAINTEK', 'S2', 1),
(463, 37, 'Matematika', 'SAINTEK', 'S3', 1),
(464, 37, 'Ilmu Aktuaria', 'SAINTEK', 'S1', 1),
(465, 37, 'Statistika', 'SAINTEK', 'S1', 1),
(466, 37, 'Statistika', 'SAINTEK', 'S2', 1),
(467, 38, 'Bioteknologi', 'SAINTEK', 'S1', 1),
(468, 38, 'Teknologi Pangan', 'SAINTEK', 'S1', 1),
(469, 38, 'Teknologi Hasil Pertanian', 'SAINTEK', 'S2', 1),
(470, 38, 'Ilmu Pangan', 'SAINTEK', 'S3', 1),
(471, 38, 'Teknologi Bioproses', 'SAINTEK', 'S1', 1),
(472, 38, 'Teknik Lingkungan', 'SAINTEK', 'S1', 1),
(473, 38, 'Teknik Pertanian dan Biosistem', 'SAINTEK', 'S1', 1),
(474, 38, 'Teknik Pertanian dan Biosistem', 'SAINTEK', 'S2', 1),
(475, 38, 'Teknik Industri Pertanian', 'SAINTEK', 'S1', 1),
(476, 38, 'Teknologi Industri Pertanian', 'SAINTEK', 'S2', 1),
(477, 38, 'Teknologi Industri Pertanian', 'SAINTEK', 'S3', 1),
(478, 39, 'Sastra Cina', 'SOSHUM', 'S1', 1),
(479, 39, 'Sastra Inggris', 'SOSHUM', 'S1', 1),
(480, 39, 'Sastra Jepang', 'SOSHUM', 'S1', 1),
(481, 39, 'Bahasa Dan Sastra Prancis', 'SOSHUM', 'S1', 1),
(482, 39, 'Ilmu Linguistik', 'SOSHUM', 'S2', 1),
(483, 39, 'Pendidikan Bahasa Inggris', 'SOSHUM', 'S1', 1),
(484, 39, 'Pendidikan Bahasa Jepang', 'SOSHUM', 'S1', 1),
(485, 39, 'Pendidikan Bhs & Sastra Indonesia', 'SOSHUM', 'S1', 1),
(486, 39, 'Seni Rupa Murni', 'SOSHUM', 'S1', 1),
(487, 39, 'Antropologi', 'SOSHUM', 'S1', 1),
(488, 40, 'Sosiologi', 'SOSHUM', 'S1', 1),
(489, 40, 'Ilmu Sosial', 'SOSHUM', 'S2', 1),
(490, 40, 'Ilmu Sosiologi', 'SOSHUM', 'S3', 1),
(491, 40, 'Ilmu Komunikasi', 'SOSHUM', 'S1', 1),
(492, 40, 'Ilmu Komunikasi', 'SOSHUM', 'S2', 1),
(493, 40, 'Psikologi', 'SOSHUM', 'S1', 1),
(494, 40, 'Hubungan Internasional', 'SOSHUM', 'S1', 1),
(495, 40, 'Ilmu Politik', 'SOSHUM', 'S1', 1),
(496, 40, 'Ilmu Pemerintahan', 'SOSHUM', 'S1', 1),
(497, 41, 'Pendidikan Dokter Hewan', 'SAINTEK', 'S1', 1),
(498, 42, 'Teknik Informatika', 'SAINTEK', 'S1', 1),
(499, 42, 'Teknik Komputer', 'SAINTEK', 'S1', 1),
(500, 42, 'Ilmu Komputer', 'SAINTEK', 'S2', 1),
(501, 42, 'Pendidikan Teknologi Informasi', 'SAINTEK', 'S1', 1),
(502, 42, 'Teknologi Informasi', 'SAINTEK', 'S1', 1),
(503, 42, 'Sistem Informasi', 'SAINTEK', 'S1', 1),
(504, 43, 'Pendidikan Dokter Gigi', 'SAINTEK', 'S1', 1),
(505, 44, 'Kesekretariatan BK. Business English', NULL, 'D3', 1),
(506, 44, 'Teknik Komputer BK. Film dan Televisi', NULL, 'D3', 1),
(507, 44, 'Desain Grafis BK. Desain Komunikasi Visual', NULL, 'D4', 1),
(508, 44, 'Manajemen Perhotelan', 'SOSHUM', 'D4', 1),
(509, 44, 'Kesekretariatan BK. Public Relations', NULL, 'D3', 1),
(510, 44, 'Kesekretariatan BK. Administrasi Perkantoran dan Sekretaris', NULL, 'D3', 1),
(511, 44, 'Teknik Komputer BK. Teknologi Informasi dan Komputer', NULL, 'D3', 1),
(512, 44, 'Teknik Komputer BK. Business Digital dan E-Commerce', NULL, 'D3', 1),
(513, 44, 'Teknik Komputer BK. Sistem Informasi', NULL, 'D3', 1),
(514, 44, 'Kesekretariatan BK. Administrasi Hukum', NULL, 'D3', 1),
(515, 44, 'Keuangan dan Perbankan BK. Perpajakan', NULL, 'D3', 1),
(516, 44, 'Keuangan dan Perbankan BK. Perbankan', NULL, 'D3', 1),
(517, 44, 'Kesekretariatan BK. Perpustakaan dan Arsip', NULL, 'D3', 1),
(518, 44, 'Desain Grafis BK. Desain Interior', NULL, 'D4', 1),
(519, 44, 'Keuangan dan Perbankan BK. Akuntansi Terapan', NULL, 'D3', 1),
(520, 44, 'Desain Grafis', 'SAINTEK', 'D4', 1),
(521, 44, 'Administrasi Bisnis', 'SOSHUM', 'D3', 1),
(522, 44, 'Keuangan dan Perbankan', 'SOSHUM', 'D3', 1),
(523, 44, 'Teknologi Informasi', 'SAINTEK', 'D3', 1),
(524, 45, 'Kajian Wawasan Nusantara & Ketahanan Nasional', 'SOSHUM', 'S2', 1),
(525, 45, 'Pengelolaan Sumberdaya Lingkungan dan Pembangunan', 'SOSHUM', 'S2', 1),
(526, 45, 'Kajian Wanita', 'SOSHUM', 'S2', 1),
(527, 45, 'Ilmu Lingkungan', 'SOSHUM', 'S3', 1),
(528, 45, 'Ilmu Hukum Minat Studi Ketahanan', 'SOSHUM', 'S3', 1),
(529, 46, 'Ilmu Keperawatan', 'SAINTEK', 'S1', 1),
(530, 46, 'Keperawatan', NULL, 'S2', 1),
(531, 46, 'Ilmu Gizi', 'SAINTEK', 'S1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_notifications`
--

CREATE TABLE `app_notifications` (
  `notif_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `notif_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notif_type_id` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `app_payouts`
--

CREATE TABLE `app_payouts` (
  `payout_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `payout_label` varchar(255) DEFAULT NULL,
  `payout_max_date` date DEFAULT NULL,
  `payout_keterangan` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `app_payout_items`
--

CREATE TABLE `app_payout_items` (
  `item_id` int(10) UNSIGNED NOT NULL,
  `payout_id` int(10) UNSIGNED DEFAULT NULL,
  `volunteer_id` int(10) UNSIGNED DEFAULT NULL,
  `payout_value` int(10) UNSIGNED DEFAULT NULL,
  `pertemuan` int(10) UNSIGNED DEFAULT NULL,
  `paid_confirm_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `app_pergantian`
--

CREATE TABLE `app_pergantian` (
  `s_id` int(11) NOT NULL,
  `s_pengaju` int(10) DEFAULT NULL,
  `s_penerima` int(10) DEFAULT NULL,
  `s_jd_id` int(10) DEFAULT NULL,
  `respon` varchar(25) DEFAULT 'Menunggu Respon',
  `waktu_pengajuan` datetime DEFAULT NULL,
  `waktu_respon` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_pergantian`
--

INSERT INTO `app_pergantian` (`s_id`, `s_pengaju`, `s_penerima`, `s_jd_id`, `respon`, `waktu_pengajuan`, `waktu_respon`) VALUES
(9, 1008, 1009, 1139541, 'Diterima', '2025-04-30 13:54:23', '2025-05-01 11:47:32'),
(17, 1009, 1014, 1139559, 'Diterima', '2025-05-01 13:10:37', '2025-05-01 13:10:55'),
(18, 1014, 1009, 1139544, 'Ditolak', '2025-05-01 13:56:44', '2025-05-04 16:36:55'),
(19, 1014, 1009, 1139544, 'Diterima', '2025-05-01 14:01:45', '2025-05-01 17:08:05'),
(20, 1014, 1009, 1139549, 'Ditarik', '2025-05-01 18:02:46', '2025-05-01 19:46:20'),
(21, 1014, 1009, 1139549, 'Ditarik', '2025-05-01 19:46:16', '2025-05-01 19:46:20'),
(23, 1008, 1009, 1139551, 'Ditarik', '2025-05-03 14:02:04', '2025-05-04 16:10:30'),
(24, 1008, 1009, 1139551, 'Ditarik', '2025-05-03 14:05:33', '2025-05-04 16:10:30'),
(25, 1008, 1009, 1139551, 'Ditarik', '2025-05-03 14:06:05', '2025-05-04 16:10:30'),
(26, 1008, 1009, 1139551, 'Ditarik', '2025-05-03 14:08:03', '2025-05-04 16:10:30'),
(27, 1008, 1009, 1139551, 'Ditolak', '2025-05-04 16:36:15', '2025-05-04 16:37:59'),
(28, 1009, 1014, 1139569, 'Diterima', '2025-05-04 16:38:29', '2025-05-04 16:45:13'),
(29, 1008, 1009, 1139551, 'Diterima', '2025-05-04 21:27:44', '2025-05-04 21:28:44'),
(30, 1010, 1008, 1139548, 'Menunggu Respon', '2025-05-04 21:43:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_permission`
--

CREATE TABLE `app_permission` (
  `permission_id` int(11) NOT NULL,
  `semester_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `student` varchar(20) DEFAULT NULL,
  `clarification` text DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_permission_view`
-- (See below for the actual view)
--
CREATE TABLE `app_permission_view` (
`permission_id` int(11)
,`semester_id` int(11)
,`student_id` int(11)
,`user_id` int(10) unsigned
,`name` varchar(100)
,`username` varchar(100)
,`majors_id` int(10) unsigned
,`nick_name` varchar(100)
,`class_of_college` year(4)
,`no_hp` varchar(15)
,`student` varchar(20)
,`clarification` text
,`status` varchar(255)
,`created_at` datetime
,`date_start` date
,`date_end` date
);

-- --------------------------------------------------------

--
-- Table structure for table `app_permit`
--

CREATE TABLE `app_permit` (
  `permit_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `accompaniment_id` int(10) UNSIGNED DEFAULT NULL,
  `semester_id` int(10) UNSIGNED DEFAULT NULL,
  `student_id` int(10) UNSIGNED DEFAULT NULL,
  `student` varchar(20) DEFAULT NULL,
  `clarification` text DEFAULT NULL,
  `new_volunteer_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT 'menunggu konfirmasi'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_permit_view`
-- (See below for the actual view)
--
CREATE TABLE `app_permit_view` (
`permit_id` int(10) unsigned
,`accompaniment_id` int(10) unsigned
,`semester_id` int(10) unsigned
,`schedule_student_id` int(10) unsigned
,`volunteer_id` int(10) unsigned
,`date` date
,`student_status` varchar(20)
,`volunteer_status` varchar(20)
,`review` int(11)
,`start_at` time
,`end_at` time
,`day` int(11)
,`room` varchar(100)
,`courses` varchar(200)
,`sks` int(11)
,`student_id` int(10) unsigned
,`volunteer_nick_name` varchar(100)
,`user_id` int(10) unsigned
,`name` varchar(100)
,`username` varchar(100)
,`majors_id` int(10) unsigned
,`nick_name` varchar(100)
,`class_of_college` year(4)
,`no_hp` varchar(15)
,`student` varchar(20)
,`clarification` text
,`new_volunteer_id` int(11)
,`status` varchar(255)
,`created_at` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_prepar_schedule_student_view`
-- (See below for the actual view)
--
CREATE TABLE `app_prepar_schedule_student_view` (
`schedule_student_id` int(10) unsigned
,`student_id` int(10) unsigned
,`semester_id` int(10) unsigned
,`start_at` time
,`end_at` time
,`day` int(11)
,`room` varchar(100)
,`courses` varchar(200)
,`sks` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_prepar_schedule_volunteer_view`
-- (See below for the actual view)
--
CREATE TABLE `app_prepar_schedule_volunteer_view` (
`schedule_volunteer_id` int(10) unsigned
,`student_id` int(10) unsigned
,`user_id` int(10) unsigned
,`nick_name` varchar(100)
,`semester_id` int(10) unsigned
,`start_at` time
,`end_at` time
,`day` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_report_volunteer_view`
-- (See below for the actual view)
--
CREATE TABLE `app_report_volunteer_view` (
`volunteer_id` int(10) unsigned
,`semester_id` int(10) unsigned
,`nick_name` varchar(100)
,`user_id` int(10) unsigned
,`student_id` int(10) unsigned
,`username` varchar(100)
,`name` varchar(100)
,`count_belum_datang` decimal(22,0)
,`count_selesai` decimal(22,0)
,`count_izin` decimal(22,0)
,`count_tidak_datang` decimal(22,0)
,`max_review` int(11)
,`min_review` int(11)
,`avg_review` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_riwayat_pergantian_view`
-- (See below for the actual view)
--
CREATE TABLE `app_riwayat_pergantian_view` (
`s_id` int(11)
,`s_jd_id` int(10)
,`s_pengaju` int(10)
,`s_penerima` int(10)
,`pengaju` varchar(100)
,`penerima` varchar(100)
,`waktu_pengajuan` datetime
,`waktu_respon` datetime
,`atas_nama` varchar(100)
,`tanggal` date
,`mulai` time
,`selesai` time
,`respon` varchar(25)
,`student_id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_schedule_exam_student_view`
-- (See below for the actual view)
--
CREATE TABLE `app_schedule_exam_student_view` (
`user_id` int(10) unsigned
,`username` varchar(100)
,`name` varchar(100)
,`email` varchar(100)
,`student_id` int(10) unsigned
,`majors_id` int(10) unsigned
,`majors_name` varchar(100)
,`majors_focus` varchar(100)
,`faculty_id` int(10) unsigned
,`faculty_name` varchar(100)
,`nick_name` varchar(100)
,`class_of_college` year(4)
,`no_hp` varchar(15)
,`schedule_student_id` int(10) unsigned
,`semester_id` int(10) unsigned
,`start_at` time
,`end_at` time
,`date` date
,`room` varchar(100)
,`courses` varchar(200)
,`schedule_type` varchar(100)
,`sks` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_schedule_exam_volunteer_view`
-- (See below for the actual view)
--
CREATE TABLE `app_schedule_exam_volunteer_view` (
`user_id` int(10) unsigned
,`username` varchar(100)
,`name` varchar(100)
,`email` varchar(100)
,`student_id` int(10) unsigned
,`majors_id` int(10) unsigned
,`majors_name` varchar(100)
,`faculty_id` int(10) unsigned
,`faculty_name` varchar(100)
,`nick_name` varchar(100)
,`class_of_college` year(4)
,`no_hp` varchar(15)
,`schedule_volunteer_id` int(10) unsigned
,`semester_id` int(10) unsigned
,`start_at` time
,`end_at` time
,`date` date
,`room` varchar(255)
,`clarification` text
,`schedule_type` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `app_schedule_student`
--

CREATE TABLE `app_schedule_student` (
  `schedule_student_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `semester_id` int(10) UNSIGNED DEFAULT NULL,
  `volunteer_id` int(11) DEFAULT NULL,
  `start_at` time DEFAULT NULL,
  `end_at` time DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `room` varchar(100) DEFAULT NULL,
  `courses` varchar(200) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL,
  `schedule_type` varchar(100) NOT NULL DEFAULT 'kuliah',
  `deleted` varchar(50) DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `app_schedule_student`
--

INSERT INTO `app_schedule_student` (`schedule_student_id`, `student_id`, `semester_id`, `volunteer_id`, `start_at`, `end_at`, `day`, `date`, `room`, `courses`, `sks`, `schedule_type`, `deleted`) VALUES
(6285, 1005, 31, 1008, '09:30:00', '11:00:00', 1, NULL, 'Gedung A ruang 3.12', 'mata kuliah', 3, 'kuliah', 'false'),
(6286, 1005, 31, 1002, '12:30:00', '14:00:00', 1, NULL, 'Gedung A ruang 3.12', 'mata kuliah', 2, 'kuliah', 'false'),
(6288, 1005, 31, 1003, '07:30:00', '08:40:00', 3, NULL, 'Gedung A ruang 3.12', 'mata kuliah', 2, 'kuliah', 'false'),
(6289, 1005, 31, 1002, '13:30:00', '15:00:00', 4, NULL, 'Gedung A ruang 3.12', 'mata kuliah', 2, 'kuliah', 'false'),
(6290, 1006, 31, 1004, '14:00:00', '15:30:00', 4, NULL, 'kosong', 'mata kuliah', 2, 'kuliah', 'false'),
(6291, 1006, 31, 1004, '15:00:00', '17:00:00', 2, NULL, 'kosong', 'mata kuliah', 2, 'kuliah', 'false'),
(6292, 1006, 31, NULL, '07:00:00', '09:30:00', 5, NULL, 'kosong', 'mata kuliah', 2, 'kuliah', 'false'),
(6293, 1007, 31, 1008, '09:30:00', '11:00:00', 3, NULL, 'kosong', 'mata kuliah', 2, 'kuliah', 'false'),
(6294, 1007, 31, 1002, '15:30:00', '17:00:00', 3, NULL, 'kosong', 'mata kuliah', 2, 'kuliah', 'false'),
(6295, 1007, 31, 1008, '15:30:00', '17:00:00', 5, NULL, 'kosong', 'mata kuliah', 2, 'kuliah', 'false'),
(6296, 1007, 31, 1002, '12:30:00', '14:00:00', 2, NULL, 'kosong', 'mata kuliah', 2, 'kuliah', 'false');

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_schedule_student_active_view`
-- (See below for the actual view)
--
CREATE TABLE `app_schedule_student_active_view` (
`schedule_student_id` int(10) unsigned
,`user_id` int(10) unsigned
,`username` varchar(100)
,`name` varchar(100)
,`email` varchar(100)
,`student_id` int(10) unsigned
,`majors_id` int(10) unsigned
,`majors_name` varchar(100)
,`faculty_id` int(10) unsigned
,`majors_focus` varchar(100)
,`faculty_name` varchar(100)
,`nick_name` varchar(100)
,`class_of_college` year(4)
,`no_hp` varchar(15)
,`semester_id` int(10) unsigned
,`start_at` time
,`end_at` time
,`day` int(11)
,`date` date
,`accompaniment_date` date
,`room` varchar(100)
,`courses` varchar(200)
,`sks` int(11)
,`schedule_type` varchar(100)
,`volunteer_id_prior` int(11)
,`register_id` int(10) unsigned
,`approver_id` int(10) unsigned
,`created_at` datetime
,`accompaniment_id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `app_schedule_student_rev`
--

CREATE TABLE `app_schedule_student_rev` (
  `schedule_student_rev_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `semester_id` int(10) UNSIGNED DEFAULT NULL,
  `rev` int(11) DEFAULT 1,
  `start_at` time DEFAULT NULL,
  `end_at` time DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `room` varchar(100) DEFAULT NULL,
  `courses` varchar(200) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL,
  `schedule_type` varchar(10) NOT NULL DEFAULT 'kuliah',
  `deleted` varchar(50) DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_schedule_student_rev_view`
-- (See below for the actual view)
--
CREATE TABLE `app_schedule_student_rev_view` (
`user_id` int(10) unsigned
,`username` varchar(100)
,`name` varchar(100)
,`email` varchar(100)
,`student_id` int(10) unsigned
,`majors_id` int(10) unsigned
,`majors_name` varchar(100)
,`majors_focus` varchar(100)
,`faculty_id` int(10) unsigned
,`faculty_name` varchar(100)
,`nick_name` varchar(100)
,`class_of_college` year(4)
,`no_hp` varchar(15)
,`schedule_student_rev_id` int(10) unsigned
,`semester_id` int(10) unsigned
,`start_at` time
,`end_at` time
,`day` int(11)
,`room` varchar(100)
,`courses` varchar(200)
,`sks` int(11)
,`rev` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_schedule_student_view`
-- (See below for the actual view)
--
CREATE TABLE `app_schedule_student_view` (
`user_id` int(10) unsigned
,`username` varchar(100)
,`name` varchar(100)
,`email` varchar(100)
,`student_id` int(10) unsigned
,`majors_id` int(10) unsigned
,`majors_name` varchar(100)
,`majors_focus` varchar(100)
,`faculty_id` int(10) unsigned
,`faculty_name` varchar(100)
,`nick_name` varchar(100)
,`class_of_college` year(4)
,`no_hp` varchar(15)
,`schedule_student_id` int(10) unsigned
,`semester_id` int(10) unsigned
,`start_at` time
,`end_at` time
,`day` int(11)
,`room` varchar(100)
,`courses` varchar(200)
,`sks` int(11)
,`volunteer_id` int(11)
,`schedule_type` varchar(100)
,`date` date
,`volunteer_nick_name` varchar(100)
,`volunteer_majors_id` int(10) unsigned
,`volunteer_majors_name` varchar(100)
,`volunteer_majors_focus` varchar(100)
,`volunteer_faculty_id` int(10) unsigned
,`volunteer_faculty_name` varchar(100)
,`approver_id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `app_schedule_volunteer`
--

CREATE TABLE `app_schedule_volunteer` (
  `schedule_volunteer_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `semester_id` int(10) UNSIGNED DEFAULT NULL,
  `start_at` time DEFAULT NULL,
  `end_at` time DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `clarification` text DEFAULT NULL,
  `schedule_type` varchar(10) NOT NULL DEFAULT 'kuliah',
  `room` varchar(255) DEFAULT 'kosong',
  `deleted` varchar(50) DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `app_schedule_volunteer`
--

INSERT INTO `app_schedule_volunteer` (`schedule_volunteer_id`, `student_id`, `semester_id`, `start_at`, `end_at`, `day`, `date`, `clarification`, `schedule_type`, `room`, `deleted`) VALUES
(4076, 1002, 31, '07:30:00', '09:10:00', 1, NULL, 'Biokimia', 'kuliah', 'D.3.7', 'true'),
(4077, 1004, 31, '07:30:00', '09:10:00', 1, NULL, 'Pemetaan Sumberdaya Hayati Laut', 'kuliah', 'GD. C - C.2.2', 'true'),
(4078, 1003, 31, '07:30:00', '10:00:00', 1, NULL, 'Psikometrika', 'kuliah', 'Gedung 2 FISIP lantai 5', 'true'),
(4079, 1002, 31, '09:20:00', '11:00:00', 1, NULL, 'Biologi perikanan ', 'kuliah', 'D.2.6', 'true'),
(4080, 1004, 31, '07:00:00', '10:25:00', 5, NULL, 'Pengantar Usaha Tani', 'kuliah', 'GB-2.3', 'true'),
(19199, 1002, 31, '07:00:00', '12:00:00', 1, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19200, 1002, 31, '06:00:00', '12:00:00', 2, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19201, 1002, 31, '06:00:00', '12:00:00', 3, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19202, 1002, 31, '06:00:00', '12:00:00', 4, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19203, 1002, 31, '06:00:00', '12:00:00', 5, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19204, 1003, 31, '09:00:00', '15:00:00', 1, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19205, 1003, 31, '09:00:00', '15:00:00', 2, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19206, 1003, 31, '09:00:00', '15:00:00', 3, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19207, 1003, 31, '09:00:00', '15:00:00', 4, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19208, 1003, 31, '09:00:00', '15:00:00', 5, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19209, 1004, 31, '07:02:00', '21:02:00', 1, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19210, 1004, 31, '07:02:00', '09:02:00', 2, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19211, 1004, 31, '12:02:00', '14:02:00', 2, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19212, 1004, 31, '07:00:00', '21:21:00', 3, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19213, 1004, 31, '07:02:00', '12:02:00', 4, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19214, 1004, 31, '16:02:00', '21:02:00', 4, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19215, 1004, 31, '07:02:00', '21:02:00', 5, NULL, 'kuliah', 'kuliah', 'kosong', 'false'),
(19216, 1008, 31, '12:00:00', '21:00:00', 1, NULL, 'Kuliah', 'kuliah', 'kosong', 'false'),
(19217, 1008, 31, '07:00:00', '21:00:00', 2, NULL, 'Kuliah dan istirahat', 'kuliah', 'kosong', 'false'),
(19218, 1008, 31, '13:00:00', '21:00:00', 3, NULL, 'Kuliah dan istirahat', 'kuliah', 'kosong', 'false'),
(19219, 1008, 31, '07:00:00', '14:30:00', 4, NULL, 'Kuliah dan istirahat', 'kuliah', 'kosong', 'false'),
(19220, 1008, 31, '07:00:00', '13:00:00', 5, NULL, 'Kuliah dan istirahat', 'kuliah', 'kosong', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `app_schedule_volunteer_rev`
--

CREATE TABLE `app_schedule_volunteer_rev` (
  `schedule_volunteer_rev_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `semester_id` int(10) UNSIGNED DEFAULT NULL,
  `rev` int(11) DEFAULT NULL,
  `start_at` time DEFAULT NULL,
  `end_at` time DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `clarification` text DEFAULT NULL,
  `schedule_type` varchar(10) NOT NULL DEFAULT 'kuliah',
  `room` varchar(255) DEFAULT 'kosong',
  `deleted` varchar(50) DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_schedule_volunteer_rev_view`
-- (See below for the actual view)
--
CREATE TABLE `app_schedule_volunteer_rev_view` (
`user_id` int(10) unsigned
,`username` varchar(100)
,`name` varchar(100)
,`email` varchar(100)
,`student_id` int(10) unsigned
,`majors_id` int(10) unsigned
,`majors_name` varchar(100)
,`faculty_id` int(10) unsigned
,`faculty_name` varchar(100)
,`nick_name` varchar(100)
,`class_of_college` year(4)
,`no_hp` varchar(15)
,`schedule_volunteer_rev_id` int(10) unsigned
,`semester_id` int(10) unsigned
,`start_at` time
,`end_at` time
,`day` int(11)
,`room` varchar(255)
,`clarification` text
,`rev` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_schedule_volunteer_view`
-- (See below for the actual view)
--
CREATE TABLE `app_schedule_volunteer_view` (
`user_id` int(10) unsigned
,`username` varchar(100)
,`name` varchar(100)
,`email` varchar(100)
,`student_id` int(10) unsigned
,`majors_id` int(10) unsigned
,`majors_name` varchar(100)
,`faculty_id` int(10) unsigned
,`faculty_name` varchar(100)
,`nick_name` varchar(100)
,`class_of_college` year(4)
,`no_hp` varchar(15)
,`schedule_volunteer_id` int(10) unsigned
,`semester_id` int(10) unsigned
,`start_at` time
,`end_at` time
,`day` int(11)
,`room` varchar(255)
,`clarification` text
,`approver_id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `app_semester`
--

CREATE TABLE `app_semester` (
  `semester_id` int(10) UNSIGNED NOT NULL,
  `semester_name` varchar(100) DEFAULT NULL,
  `start_at` date DEFAULT NULL,
  `end_at` date DEFAULT NULL,
  `uts_start_at` date DEFAULT NULL,
  `uts_end_at` date DEFAULT NULL,
  `uas_start_at` date DEFAULT NULL,
  `uas_end_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `app_semester`
--

INSERT INTO `app_semester` (`semester_id`, `semester_name`, `start_at`, `end_at`, `uts_start_at`, `uts_end_at`, `uas_start_at`, `uas_end_at`) VALUES
(27, 'Semester Ganjil 2022/2023', '2022-08-22', '2023-01-13', '2022-10-10', '2022-10-23', '2022-12-12', '2022-12-30'),
(28, 'Semester Genap 2022-2023', '2023-02-13', '2023-08-02', '2023-04-10', '2023-04-21', '2023-06-19', '2023-06-30'),
(29, 'Semester Ganjil 2023-2024', '2023-08-21', '2023-12-23', '2023-10-08', '2023-10-27', '2023-12-11', '2023-12-23'),
(30, 'Semester Genap 2023-2024', '2024-02-12', '2024-04-06', '2024-04-08', '2024-04-19', '2024-06-03', '2024-06-14'),
(31, 'Genap 2024/2025', '2025-02-10', '2025-06-30', '2025-03-10', '2025-03-21', '2025-04-14', '2025-04-30');

-- --------------------------------------------------------

--
-- Table structure for table `app_students`
--

CREATE TABLE `app_students` (
  `student_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `majors_id` int(10) UNSIGNED NOT NULL,
  `nick_name` varchar(100) DEFAULT NULL,
  `class_of_college` year(4) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `ktm` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `app_students`
--

INSERT INTO `app_students` (`student_id`, `user_id`, `majors_id`, `nick_name`, `class_of_college`, `no_hp`, `photo`, `ktm`, `birth_date`) VALUES
(600, 606, 493, 'Pramai', 2020, '087865962482', 'uploads/205120300111053.jpg', 'uploads/ktm205120300111053.jpg', '2002-06-05'),
(607, 613, 396, 'Nathan', 2020, '085156037397', 'uploads/205040207111092.jpg', 'uploads/ktm205040207111092.jpg', '2002-09-19'),
(617, 623, 445, 'Alfina ', 2021, '0895397061336', 'uploads/image_picker8870205271751433936_out.jpg', 'uploads/ktm215080107111018.jpg', '2001-11-21'),
(623, 629, 440, 'Atika', 2021, '085736277282', 'uploads/2150802001110101.jpg', 'uploads/ktm2150802001110101.jpg', '2002-07-16'),
(1001, 1007, 378, 'localAdmin', 2022, '134112', NULL, NULL, '2025-04-20'),
(1002, 1008, 384, 'volunteer1', 2021, '089162547141', NULL, NULL, '2025-04-22'),
(1003, 1009, 498, 'volunteer2', 2021, '0851418471014', NULL, NULL, '2025-04-22'),
(1004, 1010, 377, 'volunteer3', 2021, '0851418471014', NULL, NULL, '2025-04-22'),
(1005, 1011, 379, 'madif1', 2023, '0851418471012', NULL, NULL, '2025-04-22'),
(1006, 1012, 498, 'madif2', 2023, '0851418471011', NULL, NULL, '2025-04-22'),
(1007, 1013, 392, 'madif3', 2023, '0851418471015', NULL, NULL, '2025-04-22'),
(1008, 1014, 367, 'volunteer4', 2022, '2314141', NULL, NULL, '2025-04-25');

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_students_view`
-- (See below for the actual view)
--
CREATE TABLE `app_students_view` (
`user_id` int(10) unsigned
,`username` varchar(100)
,`name` varchar(100)
,`email` varchar(100)
,`active` varchar(20)
,`capability` varchar(20)
,`last_login` datetime
,`login_count` int(10) unsigned
,`created_at` datetime
,`updated_at` datetime
,`student_id` int(10) unsigned
,`majors_id` int(10) unsigned
,`majors_name` varchar(100)
,`faculty_id` int(10) unsigned
,`faculty_name` varchar(100)
,`nick_name` varchar(100)
,`class_of_college` year(4)
,`no_hp` varchar(15)
,`photo` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `app_student_active`
--

CREATE TABLE `app_student_active` (
  `register_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED DEFAULT NULL,
  `semester_id` int(10) UNSIGNED DEFAULT NULL,
  `approver_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_approve_at` datetime DEFAULT NULL,
  `last_rev_at` datetime DEFAULT NULL,
  `rev` int(11) DEFAULT 0,
  `rev_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `app_student_active`
--

INSERT INTO `app_student_active` (`register_id`, `student_id`, `semester_id`, `approver_id`, `created_at`, `last_approve_at`, `last_rev_at`, `rev`, `rev_at`) VALUES
(1274, 1002, 31, 1007, '2025-04-22 11:01:35', '2025-04-22 11:05:39', NULL, 0, NULL),
(1275, 1003, 31, 1007, '2025-04-22 11:02:23', '2025-04-22 11:05:42', NULL, 0, NULL),
(1276, 1004, 31, 1007, '2025-04-22 11:04:29', '2025-04-22 11:05:43', NULL, 0, NULL),
(1277, 1005, 31, 1007, '2025-04-22 12:43:25', '2025-04-22 12:46:52', NULL, 0, NULL),
(1278, 1006, 31, 1007, '2025-04-22 12:44:51', '2025-04-22 12:46:54', NULL, 0, NULL),
(1279, 1007, 31, 1007, '2025-04-22 12:46:12', '2025-04-22 12:46:55', NULL, 0, NULL),
(1280, 1008, 31, 1007, '2025-04-25 15:05:49', '2025-04-25 15:06:13', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_student_active_view`
-- (See below for the actual view)
--
CREATE TABLE `app_student_active_view` (
`register_id` int(10) unsigned
,`student_id` int(10) unsigned
,`semester_id` int(10) unsigned
,`approver_id` int(10) unsigned
,`rev` int(11)
,`rev_at` datetime
,`approver_name` varchar(100)
,`created_at` datetime
,`user_id` int(10) unsigned
,`username` varchar(100)
,`capability` varchar(20)
,`name` varchar(100)
,`email` varchar(100)
,`majors_id` int(10) unsigned
,`majors_name` varchar(100)
,`faculty_id` int(10) unsigned
,`faculty_name` varchar(100)
,`nick_name` varchar(100)
,`class_of_college` year(4)
,`no_hp` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `app_student_not_active_view`
-- (See below for the actual view)
--
CREATE TABLE `app_student_not_active_view` (
`register_id` int(10) unsigned
,`student_id` int(10) unsigned
,`semester_id` int(10) unsigned
,`approver_id` int(10) unsigned
,`approver_name` varchar(100)
,`created_at` datetime
,`user_id` int(10) unsigned
,`username` varchar(100)
,`capability` varchar(20)
,`name` varchar(100)
,`email` varchar(100)
,`majors_id` int(10) unsigned
,`majors_name` varchar(100)
,`faculty_id` int(10) unsigned
,`faculty_name` varchar(100)
,`nick_name` varchar(100)
,`class_of_college` year(4)
,`no_hp` varchar(15)
);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('08f1e507vh8ern1d580p54uvdgq7v451', '::1', 1746069134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363036393133343b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('0lu4f6cnhc1t1s5qmmids2rq5kr8smm4', '::1', 1746097368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363039373336383b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303134223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657234223b733a343a226e616d65223b733a31303a22766f6c756e7465657234223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32352031353a30333a3037223b733a31303a2273747564656e745f6964223b733a343a2231303038223b733a393a226d616a6f72735f6964223b733a333a22333637223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657234223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303232223b733a353a226e6f5f6870223b733a373a2232333134313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3235223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('2au3kfglje32qtf9vreahkba23397t12', '::1', 1746370318, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363337303331383b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303038223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657231223b733a343a226e616d65223b733a31303a22766f6c756e7465657231223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33303a3136223b733a31303a2273747564656e745f6964223b733a343a2231303032223b733a393a226d616a6f72735f6964223b733a333a22333834223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657231223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31323a22303839313632353437313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('2nkp0kivgjqfjed4h24rdj0l0lacqi7e', '::1', 1746075213, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363037343937393b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303038223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657231223b733a343a226e616d65223b733a31303a22766f6c756e7465657231223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33303a3136223b733a31303a2273747564656e745f6964223b733a343a2231303032223b733a393a226d616a6f72735f6964223b733a333a22333834223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657231223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31323a22303839313632353437313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('2ukkko6h97v55otacagpmo0l35ofcs0d', '::1', 1746242067, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363234323036373b),
('35h4jbp6hein6h23lbh1i0fgkcovbc9q', '::1', 1746349796, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363334393739363b),
('3hbqtausjrf9uj4ea4avo6o3at2bre7p', '::1', 1746084230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363038343233303b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('3r9qfrb9td5k6jp8il6sls3endpjcuu0', '::1', 1746078732, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363037383733323b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303134223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657234223b733a343a226e616d65223b733a31303a22766f6c756e7465657234223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32352031353a30333a3037223b733a31303a2273747564656e745f6964223b733a343a2231303038223b733a393a226d616a6f72735f6964223b733a333a22333637223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657234223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303232223b733a353a226e6f5f6870223b733a373a2232333134313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3235223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('4ifettqirjd0u2h27r7elr1f006itoa9', '::1', 1746083616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363038333539383b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('5if4dmhrde4kga28vm28e4pqfktjbcmm', '::1', 1746083689, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363038333638393b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('68eu1l9eriqadni1qbtrsu50d81jfqqa', '::1', 1746082914, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363038323931343b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('6eneljp1csj65c1kfl0jrcq2alaur4hj', '::1', 1746353634, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363335333633343b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('7m40hvaduevatgq1rs5e9fcb3p058arj', '::1', 1746255265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363235343938373b),
('8dto3nabujqden1jg9duq5ns993i57d0', '::1', 1746094088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363039343038383b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('9a476e2qv9s3fp0rbqd3qbqnesm0le2c', '::1', 1746074798, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363037343739383b),
('9lk7j9tplhhjmhcr2kkjo7sdaskm3909', '::1', 1746083598, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363038333539383b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('amcintc6sevmtss7ntsag4qmcqis4139', '::1', 1746074150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363037343135303b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('b0lsudb9mhktkqpub3334d02ggq4r0hd', '::1', 1746353745, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363335333633343b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303130223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657233223b733a343a226e616d65223b733a31303a22766f6c756e7465657233223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33323a3332223b733a31303a2273747564656e745f6964223b733a343a2231303034223b733a393a226d616a6f72735f6964223b733a333a22333737223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657233223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('btt0i3ssqongihptl30kankg7289dj2o', '::1', 1746079658, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363037393635383b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303038223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657231223b733a343a226e616d65223b733a31303a22766f6c756e7465657231223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33303a3136223b733a31303a2273747564656e745f6964223b733a343a2231303032223b733a393a226d616a6f72735f6964223b733a333a22333834223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657231223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31323a22303839313632353437313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('c4gbbqvt5ti8jrf7oiilf3016sb9lpfv', '::1', 1746003548, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363030333534383b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('c75hje9l0i6nmvi4epmj4004o8hl58gf', '::1', 1746082786, ''),
('e43jbrm8ii0st2hkiu9uptni8lahjth9', '::1', 1746103583, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363130333534383b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303134223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657234223b733a343a226e616d65223b733a31303a22766f6c756e7465657234223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32352031353a30333a3037223b733a31303a2273747564656e745f6964223b733a343a2231303038223b733a393a226d616a6f72735f6964223b733a333a22333637223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657234223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303232223b733a353a226e6f5f6870223b733a373a2232333134313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3235223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('e8hncmn17q9cfc5u6l797h5c5f9ptk3r', '::1', 1746095198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363039353139383b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('elklqddnqn3lqsbvo94d6c4qbs238vjm', '::1', 1746082786, ''),
('en26i1n5dvfu3rvfurkbv5qi2fuic45a', '::1', 1746352602, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363335323630323b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303134223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657234223b733a343a226e616d65223b733a31303a22766f6c756e7465657234223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32352031353a30333a3037223b733a31303a2273747564656e745f6964223b733a343a2231303038223b733a393a226d616a6f72735f6964223b733a333a22333637223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657234223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303232223b733a353a226e6f5f6870223b733a373a2232333134313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3235223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('f2cvfg3j3qoviks8bk1sdvhbdm5r4mfu', '::1', 1746005710, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363030353731303b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('gfk1hrg8tuhs07pg2thv6ssn3j12khf5', '::1', 1746093776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363039333737363b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('guhh3u9vursfg4kd9gcmohe9sponjfsb', '::1', 1746078115, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363037383131353b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('hc69na7m859758q1a8qaf4h5d21c9l91', '::1', 1746074649, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363037343634393b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('hdko2qsgvtctk9ubbrnoftr31chuapif', '::1', 1746079162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363037393136323b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303038223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657231223b733a343a226e616d65223b733a31303a22766f6c756e7465657231223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33303a3136223b733a31303a2273747564656e745f6964223b733a343a2231303032223b733a393a226d616a6f72735f6964223b733a333a22333834223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657231223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31323a22303839313632353437313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('hec8rl6e9jie354mi4ur3kgfm9ifju2v', '::1', 1746241556, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363234313535363b),
('iogom7n3up9gsldgfe5bbp4o0hd3ai20', '::1', 1746083589, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363038333534353b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303134223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657234223b733a343a226e616d65223b733a31303a22766f6c756e7465657234223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32352031353a30333a3037223b733a31303a2273747564656e745f6964223b733a343a2231303038223b733a393a226d616a6f72735f6964223b733a333a22333637223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657234223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303232223b733a353a226e6f5f6870223b733a373a2232333134313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3235223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('j0h7i3pb1m07ort31utr2deiaajqel3l', '::1', 1746082581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363038323538313b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303134223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657234223b733a343a226e616d65223b733a31303a22766f6c756e7465657234223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32352031353a30333a3037223b733a31303a2273747564656e745f6964223b733a343a2231303038223b733a393a226d616a6f72735f6964223b733a333a22333637223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657234223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303232223b733a353a226e6f5f6870223b733a373a2232333134313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3235223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('j1on707olvoqccbntrdiiljncelj2ujk', '::1', 1746073122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363037333132323b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('jtn5539u5knj5uhncjhc8ct567e4i6rp', '::1', 1746006463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363030363432353b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('kc1m75q6u7ilm956vvtoscar9aetekph', '::1', 1746351730, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363335313733303b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303134223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657234223b733a343a226e616d65223b733a31303a22766f6c756e7465657234223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32352031353a30333a3037223b733a31303a2273747564656e745f6964223b733a343a2231303038223b733a393a226d616a6f72735f6964223b733a333a22333637223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657234223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303232223b733a353a226e6f5f6870223b733a373a2232333134313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3235223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('krur75ktnb3g4llrgc0qg32ph02enohj', '::1', 1746353138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363335333133383b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303037223b733a383a22757365726e616d65223b733a31303a226c6f63616c41646d696e223b733a343a226e616d65223b733a31303a226c6f63616c41646d696e223b733a353a22656d61696c223b733a32323a226e69636b6e616d653737303240676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a353a2261646d696e223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32302032303a35323a3331223b733a31303a2273747564656e745f6964223b733a343a2231303031223b733a393a226d616a6f72735f6964223b733a333a22333738223b733a393a226e69636b5f6e616d65223b733a31303a226c6f63616c41646d696e223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303232223b733a353a226e6f5f6870223b733a363a22313334313132223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3230223b733a31363a226a656e69735f707265666572656e7369223b733a31393a2242616861736120497379617261742053696269223b7d),
('l5p9pau6e8a6j7kj138p4oivo9nf27m4', '::1', 1746071335, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363037313333353b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('lgsi14qujldda6ujcnk4iipnp1163t5h', '::1', 1746242634, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363234323439343b),
('m1t3ueuspt05c0eodko54712fq7hn2bq', '::1', 1746071670, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363037313637303b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('m5j27kvpioq40j0ge3qu829raj499mvt', '::1', 1746083545, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363038333534353b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303134223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657234223b733a343a226e616d65223b733a31303a22766f6c756e7465657234223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32352031353a30333a3037223b733a31303a2273747564656e745f6964223b733a343a2231303038223b733a393a226d616a6f72735f6964223b733a333a22333637223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657234223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303232223b733a353a226e6f5f6870223b733a373a2232333134313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3235223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('mduq1ncbgfgsgm7clfe9p4pabdugc9s4', '::1', 1746096948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363039363934383b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303134223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657234223b733a343a226e616d65223b733a31303a22766f6c756e7465657234223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32352031353a30333a3037223b733a31303a2273747564656e745f6964223b733a343a2231303038223b733a393a226d616a6f72735f6964223b733a333a22333637223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657234223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303232223b733a353a226e6f5f6870223b733a373a2232333134313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3235223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('mg9pdnu6aqc9ndvrtu9mvu3ir2ck7mbo', '::1', 1746082701, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363038323730313b),
('muorp942alr6829771au98buo47acqrl', '::1', 1746256091, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363235353932323b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303038223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657231223b733a343a226e616d65223b733a31303a22766f6c756e7465657231223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33303a3136223b733a31303a2273747564656e745f6964223b733a343a2231303032223b733a393a226d616a6f72735f6964223b733a333a22333834223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657231223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31323a22303839313632353437313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('n3jumob9ketju2m6u9kv049k2rqhqvs5', '::1', 1746074953, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363037343935333b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('n71cvdri4o5dhm9nll6algknmrd84g2u', '::1', 1746370538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363337303331383b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303037223b733a383a22757365726e616d65223b733a31303a226c6f63616c41646d696e223b733a343a226e616d65223b733a31303a226c6f63616c41646d696e223b733a353a22656d61696c223b733a32323a226e69636b6e616d653737303240676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a353a2261646d696e223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32302032303a35323a3331223b733a31303a2273747564656e745f6964223b733a343a2231303031223b733a393a226d616a6f72735f6964223b733a333a22333738223b733a393a226e69636b5f6e616d65223b733a31303a226c6f63616c41646d696e223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303232223b733a353a226e6f5f6870223b733a363a22313334313132223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3230223b733a31363a226a656e69735f707265666572656e7369223b733a31393a2242616861736120497379617261742053696269223b7d),
('o34ch355lhr5jpm3ucsec7or54upfi9a', '::1', 1746369100, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363336393130303b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303038223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657231223b733a343a226e616d65223b733a31303a22766f6c756e7465657231223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33303a3136223b733a31303a2273747564656e745f6964223b733a343a2231303032223b733a393a226d616a6f72735f6964223b733a333a22333834223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657231223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31323a22303839313632353437313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('o34elakn8ihlj12goebsfa4dug6t5kpv', '::1', 1746103548, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363130333534383b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303134223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657234223b733a343a226e616d65223b733a31303a22766f6c756e7465657234223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32352031353a30333a3037223b733a31303a2273747564656e745f6964223b733a343a2231303038223b733a393a226d616a6f72735f6964223b733a333a22333637223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657234223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303232223b733a353a226e6f5f6870223b733a373a2232333134313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3235223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('o3q35kjkft52kf0693j082i20jocd0po', '::1', 1746350641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363335303634313b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303038223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657231223b733a343a226e616d65223b733a31303a22766f6c756e7465657231223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33303a3136223b733a31303a2273747564656e745f6964223b733a343a2231303032223b733a393a226d616a6f72735f6964223b733a333a22333834223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657231223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31323a22303839313632353437313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('ohdoakmhsltp0klfo5hg0kvvg028rf8p', '::1', 1746369744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363336393734343b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303038223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657231223b733a343a226e616d65223b733a31303a22766f6c756e7465657231223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33303a3136223b733a31303a2273747564656e745f6964223b733a343a2231303032223b733a393a226d616a6f72735f6964223b733a333a22333834223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657231223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31323a22303839313632353437313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d);
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('oroe28587iroee0v0t5r912b56fk0aum', '::1', 1746255922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363235353932323b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303038223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657231223b733a343a226e616d65223b733a31303a22766f6c756e7465657231223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33303a3136223b733a31303a2273747564656e745f6964223b733a343a2231303032223b733a393a226d616a6f72735f6964223b733a333a22333834223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657231223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31323a22303839313632353437313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('p6m355807laamat2ml6up3rq8b8lch3m', '::1', 1746078424, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363037383432343b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303134223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657234223b733a343a226e616d65223b733a31303a22766f6c756e7465657234223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32352031353a30333a3037223b733a31303a2273747564656e745f6964223b733a343a2231303038223b733a393a226d616a6f72735f6964223b733a333a22333637223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657234223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303232223b733a353a226e6f5f6870223b733a373a2232333134313431223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3235223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('q7i4antfeht0j7ti5vnj8diog49atb50', '::1', 1746074852, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363037343739383b),
('q9f4f0v0gq2q1ium6aqhmhmr6ms9fp81', '::1', 1746077507, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363037373530373b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('qeipbd7aps9vpqco8ekleb71pmhb3523', '::1', 1746084401, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363038343233303b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('r3q4gbvu2bp7j1eci6k47sqk1j4g1i5a', '::1', 1746351324, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363335313332343b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303037223b733a383a22757365726e616d65223b733a31303a226c6f63616c41646d696e223b733a343a226e616d65223b733a31303a226c6f63616c41646d696e223b733a353a22656d61696c223b733a32323a226e69636b6e616d653737303240676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a353a2261646d696e223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32302032303a35323a3331223b733a31303a2273747564656e745f6964223b733a343a2231303031223b733a393a226d616a6f72735f6964223b733a333a22333738223b733a393a226e69636b5f6e616d65223b733a31303a226c6f63616c41646d696e223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303232223b733a353a226e6f5f6870223b733a363a22313334313132223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3230223b733a31363a226a656e69735f707265666572656e7369223b733a31393a2242616861736120497379617261742053696269223b7d),
('sum4au82gcctjp3t2r5uc9mmfsfcdqvo', '::1', 1746005406, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363030353430363b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('uc08trsadhnqsmdkq4oh43ldvohh2dv7', '::1', 1746242494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363234323439343b),
('utt2106ibaftjcmk97si1htviq99ej73', '::1', 1746006100, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363030363130303b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('v7v1ad1hjtfmo4hvu5onq2rm37t35dfe', '::1', 1746006425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363030363432353b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303039223b733a383a22757365726e616d65223b733a31303a22766f6c756e7465657232223b733a343a226e616d65223b733a31303a22766f6c756e7465657232223b733a353a22656d61696c223b733a32303a2262617070616b6175363940676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a393a22766f6c756e74656572223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a33313a3431223b733a31303a2273747564656e745f6964223b733a343a2231303033223b733a393a226d616a6f72735f6964223b733a333a22343938223b733a393a226e69636b5f6e616d65223b733a31303a22766f6c756e7465657232223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303231223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303134223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31363a226a656e69735f707265666572656e7369223b733a31393a22547970697374202f204a757275204b6574696b223b7d),
('vgf4n3df16218fnus2hcuupb2du34bn8', '::1', 1746079906, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363037393930363b766f6c756e746565725f6170705f68346b336834697533726834697572683334695f73657373696f6e7c613a31353a7b733a373a22757365725f6964223b733a343a2231303133223b733a383a22757365726e616d65223b733a363a226d6164696633223b733a343a226e616d65223b733a363a226d6164696633223b733a353a22656d61696c223b733a31383a22706c65683132333440676d61696c2e636f6d223b733a31303a226361706162696c697479223b733a373a226469666162656c223b733a31303a22637265617465645f6174223b733a31393a22323032352d30342d32322031303a34343a3535223b733a31303a2273747564656e745f6964223b733a343a2231303037223b733a393a226d616a6f72735f6964223b733a333a22333932223b733a393a226e69636b5f6e616d65223b733a363a226d6164696633223b733a31363a22636c6173735f6f665f636f6c6c656765223b733a343a2232303233223b733a353a226e6f5f6870223b733a31333a2230383531343138343731303135223b733a353a2270686f746f223b4e3b733a333a226b746d223b4e3b733a31303a2262697274685f64617465223b733a31303a22323032352d30342d3232223b733a31333a226a656e69735f6469666162656c223b733a393a2254756e6172756e6775223b7d),
('vu5k3u3530sjmd8rdh89s374d5mqjshr', '::1', 1746082786, '');

-- --------------------------------------------------------

--
-- Structure for view `app_accompaniment_base_view`
--
DROP TABLE IF EXISTS `app_accompaniment_base_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_accompaniment_base_view`  AS SELECT `app_accompaniment`.`accompaniment_id` AS `accompaniment_id`, `app_accompaniment`.`semester_id` AS `semester_id`, `app_accompaniment`.`schedule_student_id` AS `schedule_student_id`, CASE WHEN coalesce(`app_accompaniment`.`volunteer_change_status`,'') = '' OR `app_accompaniment`.`volunteer_change_status` = 'rejected' OR `app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation' THEN `app_accompaniment`.`volunteer_id` ELSE `app_accompaniment`.`new_volunteer_id` END AS `volunteer_id`, `app_accompaniment`.`volunteer_change_status` AS `volunteer_change_status`, `app_accompaniment`.`new_volunteer_id` AS `new_volunteer_id`, `app_accompaniment`.`new_start_at` AS `start_at`, `app_accompaniment`.`new_end_at` AS `end_at`, `app_accompaniment`.`new_day` AS `new_day`, `volunteer`.`nick_name` AS `nick_name`, `app_accompaniment`.`date` AS `date`, `app_accompaniment`.`student_status` AS `student_status`, `app_accompaniment`.`volunteer_status` AS `volunteer_status`, `app_accompaniment`.`accompaniment_note` AS `accompaniment_note`, `app_accompaniment`.`review_note` AS `review_note`, `app_accompaniment`.`review` AS `review`, `app_accompaniment`.`created_at` AS `created_at`, `app_accompaniment`.`updated_at` AS `updated_at` FROM (`app_accompaniment` join `app_students` `volunteer` on(`volunteer`.`student_id` = case when coalesce(`app_accompaniment`.`volunteer_change_status`,'') = '' or `app_accompaniment`.`volunteer_change_status` = 'rejected' or `app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation' then `app_accompaniment`.`volunteer_id` else `app_accompaniment`.`new_volunteer_id` end)) ;

-- --------------------------------------------------------

--
-- Structure for view `app_accompaniment_schedule_volunteer_view`
--
DROP TABLE IF EXISTS `app_accompaniment_schedule_volunteer_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_accompaniment_schedule_volunteer_view`  AS SELECT `app_accompaniment`.`accompaniment_id` AS `accompaniment_id`, `app_schedule_student`.`student_id` AS `student_id`, `app_schedule_student`.`schedule_type` AS `schedule_type`, `app_accompaniment`.`semester_id` AS `semester_id`, `app_accompaniment`.`schedule_student_id` AS `schedule_student_id`, `app_accompaniment`.`accompaniment_note` AS `accompaniment_note`, `app_accompaniment`.`review_note` AS `review_note`, `app_accompaniment`.`review` AS `review`, CASE WHEN coalesce(`app_accompaniment`.`volunteer_change_status`,'') = '' OR `app_accompaniment`.`volunteer_change_status` = 'rejected' OR `app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation' THEN `app_accompaniment`.`volunteer_id` ELSE `app_accompaniment`.`new_volunteer_id` END AS `volunteer_id`, `app_accompaniment`.`volunteer_change_status` AS `volunteer_change_status`, `app_accompaniment`.`new_volunteer_id` AS `new_volunteer_id`, CASE WHEN coalesce(`app_accompaniment`.`new_start_at`,'') = '' THEN `app_schedule_student`.`start_at` ELSE `app_accompaniment`.`new_start_at` END AS `start_at`, CASE WHEN coalesce(`app_accompaniment`.`new_end_at`,'') = '' THEN `app_schedule_student`.`end_at` ELSE `app_accompaniment`.`new_end_at` END AS `end_at`, `app_accompaniment`.`new_day` AS `new_day`, CASE WHEN coalesce(`app_accompaniment`.`new_day`,'') = '' THEN `app_schedule_student`.`day` ELSE `app_accompaniment`.`new_day` END AS `day`, `app_accompaniment`.`date` AS `date` FROM (`app_accompaniment` join `app_schedule_student` on(`app_accompaniment`.`schedule_student_id` = `app_schedule_student`.`schedule_student_id` and `app_accompaniment`.`semester_id` = `app_schedule_student`.`semester_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `app_accompaniment_view`
--
DROP TABLE IF EXISTS `app_accompaniment_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_accompaniment_view`  AS SELECT `app_accompaniment`.`accompaniment_id` AS `accompaniment_id`, `app_students`.`user_id` AS `user_id`, `user_difabel`.`username` AS `username`, `user_difabel`.`name` AS `name`, `app_schedule_student`.`student_id` AS `student_id`, `app_students`.`majors_id` AS `majors_id`, `major`.`majors_name` AS `majors_name`, `major`.`majors_focus` AS `majors_focus`, `major`.`faculty_id` AS `faculty_id`, `faculty`.`faculty_name` AS `faculty_name`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`class_of_college` AS `class_of_college`, `app_students`.`no_hp` AS `no_hp`, `app_students`.`photo` AS `photo`, `app_accompaniment`.`semester_id` AS `semester_id`, `app_accompaniment`.`schedule_student_id` AS `schedule_student_id`, CASE WHEN coalesce(`app_accompaniment`.`new_start_at`,'') = '' THEN `app_schedule_student`.`start_at` ELSE `app_accompaniment`.`new_start_at` END AS `start_at`, CASE WHEN coalesce(`app_accompaniment`.`new_end_at`,'') = '' THEN `app_schedule_student`.`end_at` ELSE `app_accompaniment`.`new_end_at` END AS `end_at`, CASE WHEN coalesce(`app_accompaniment`.`new_day`,'') = '' THEN `app_schedule_student`.`day` ELSE `app_accompaniment`.`new_day` END AS `day`, CASE WHEN coalesce(`app_accompaniment`.`new_room`,'') = '' THEN `app_schedule_student`.`room` ELSE `app_accompaniment`.`new_room` END AS `room`, `app_accompaniment`.`date` AS `date`, `app_schedule_student`.`courses` AS `courses`, `app_schedule_student`.`sks` AS `sks`, `app_schedule_student`.`schedule_type` AS `schedule_type`, `app_accompaniment`.`new_volunteer_id` AS `new_volunteer_id`, `app_accompaniment`.`new_day` AS `new_day`, CASE WHEN coalesce(`app_accompaniment`.`volunteer_change_status`,'') = '' OR `app_accompaniment`.`volunteer_change_status` = 'rejected' OR `app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation' THEN `app_accompaniment`.`volunteer_id` ELSE `app_accompaniment`.`new_volunteer_id` END AS `volunteer_id`, `app_accompaniment`.`volunteer_change_status` AS `volunteer_change_status`, `student_volunteer`.`majors_id` AS `volunteer_majors_id`, `major_volunteer`.`majors_name` AS `volunteer_majors_name`, `major_volunteer`.`majors_focus` AS `volunteer_majors_focus`, `major_volunteer`.`faculty_id` AS `volunteer_faculty_id`, `faculty_volunteer`.`faculty_name` AS `volunteer_faculty_name`, `student_volunteer`.`nick_name` AS `volunteer_nick_name`, `student_volunteer`.`class_of_college` AS `volunteer_class_of_college`, `student_volunteer`.`no_hp` AS `volunteer_no_hp`, `student_volunteer`.`photo` AS `volunteer_photo`, `user_volunteer`.`user_id` AS `volunteer_user_id`, `user_volunteer`.`username` AS `volunteer_username`, `user_volunteer`.`name` AS `volunteer_name`, `app_accompaniment`.`note` AS `note`, `app_accompaniment`.`student_status` AS `student_status`, `app_accompaniment`.`volunteer_status` AS `volunteer_status`, `app_accompaniment`.`accompaniment_note` AS `accompaniment_note`, `app_accompaniment`.`review_note` AS `review_note`, `app_accompaniment`.`review` AS `review`, `app_accompaniment`.`created_at` AS `created_at`, `app_accompaniment`.`updated_at` AS `updated_at`, `app_accompaniment`.`code_attending` AS `code_attending` FROM (((((((((`app_accompaniment` join `app_schedule_student` on(`app_accompaniment`.`schedule_student_id` = `app_schedule_student`.`schedule_student_id` and `app_accompaniment`.`semester_id` = `app_schedule_student`.`semester_id`)) join `app_students` on(`app_students`.`student_id` = `app_schedule_student`.`student_id`)) join `app_majors` `major` on(`major`.`majors_id` = `app_students`.`majors_id`)) join `app_faculties` `faculty` on(`faculty`.`faculty_id` = `major`.`faculty_id`)) join `aplego_user` `user_difabel` on(`user_difabel`.`user_id` = `app_students`.`user_id`)) left join `app_students` `student_volunteer` on(`student_volunteer`.`student_id` = case when coalesce(`app_accompaniment`.`volunteer_change_status`,'') = '' or `app_accompaniment`.`volunteer_change_status` = 'rejected' or `app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation' then `app_accompaniment`.`volunteer_id` else `app_accompaniment`.`new_volunteer_id` end)) left join `aplego_user` `user_volunteer` on(`user_volunteer`.`user_id` = `student_volunteer`.`user_id`)) left join `app_majors` `major_volunteer` on(`major_volunteer`.`majors_id` = `student_volunteer`.`majors_id`)) left join `app_faculties` `faculty_volunteer` on(`faculty_volunteer`.`faculty_id` = `major_volunteer`.`faculty_id`)) WHERE `app_schedule_student`.`deleted` = 'false' OR `app_accompaniment`.`volunteer_status` = 'Hadir' OR `app_accompaniment`.`date` < current_timestamp() ORDER BY `app_accompaniment`.`date` ASC, `app_schedule_student`.`start_at` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `app_accompaniment_view_update`
--
DROP TABLE IF EXISTS `app_accompaniment_view_update`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_accompaniment_view_update`  AS SELECT `app_accompaniment`.`accompaniment_id` AS `accompaniment_id`, `app_students`.`user_id` AS `user_id`, `user_difabel`.`username` AS `username`, `user_difabel`.`name` AS `name`, `aplego_user_meta`.`meta_value` AS `jenis_disabilitas`, `app_schedule_student`.`student_id` AS `student_id`, `app_students`.`majors_id` AS `majors_id`, `major`.`majors_name` AS `majors_name`, `major`.`faculty_id` AS `faculty_id`, `faculty`.`faculty_name` AS `faculty_name`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`class_of_college` AS `class_of_college`, `app_students`.`no_hp` AS `no_hp`, `app_students`.`photo` AS `photo`, `app_accompaniment`.`semester_id` AS `semester_id`, `app_accompaniment`.`schedule_student_id` AS `schedule_student_id`, `app_schedule_student`.`start_at` AS `start_at`, `app_schedule_student`.`end_at` AS `end_at`, `app_schedule_student`.`day` AS `day`, `app_schedule_student`.`room` AS `room`, `app_schedule_student`.`courses` AS `courses`, `app_schedule_student`.`sks` AS `sks`, `app_accompaniment`.`volunteer_id` AS `volunteer_id`, `student_volunteer`.`majors_id` AS `volunteer_majors_id`, `major_volunteer`.`majors_name` AS `volunteer_majors_name`, `major_volunteer`.`faculty_id` AS `volunteer_faculty_id`, `faculty_volunteer`.`faculty_name` AS `volunteer_faculty_name`, `student_volunteer`.`nick_name` AS `volunteer_nick_name`, `student_volunteer`.`class_of_college` AS `volunteer_class_of_college`, `student_volunteer`.`no_hp` AS `volunteer_no_hp`, `student_volunteer`.`photo` AS `volunteer_photo`, `user_volunteer`.`user_id` AS `volunteer_user_id`, `user_volunteer`.`username` AS `volunteer_username`, `user_volunteer`.`name` AS `volunteer_name`, `app_accompaniment`.`date` AS `date`, `app_accompaniment`.`student_status` AS `student_status`, `app_accompaniment`.`volunteer_status` AS `volunteer_status`, `app_accompaniment`.`review` AS `review`, `app_accompaniment`.`created_at` AS `created_at`, `app_accompaniment`.`updated_at` AS `updated_at` FROM (((((((((((`app_accompaniment` join `app_schedule_student` on(`app_accompaniment`.`schedule_student_id` = `app_schedule_student`.`schedule_student_id` and `app_accompaniment`.`semester_id` = `app_schedule_student`.`semester_id`)) join `app_students` on(`app_students`.`student_id` = `app_schedule_student`.`student_id`)) join `app_majors` `major` on(`major`.`majors_id` = `app_students`.`majors_id`)) join `app_faculties` `faculty` on(`faculty`.`faculty_id` = `major`.`faculty_id`)) join `aplego_user` `user_difabel` on(`user_difabel`.`user_id` = `app_students`.`user_id`)) join `app_students` `student_volunteer` on(`student_volunteer`.`student_id` = `app_accompaniment`.`volunteer_id`)) join `aplego_user` `user_volunteer` on(`user_volunteer`.`user_id` = `student_volunteer`.`user_id`)) join `app_students` `data_difabel` on(`data_difabel`.`student_id` = `app_accompaniment`.`schedule_student_id`)) join `aplego_user_meta` on(`aplego_user_meta`.`user_id` = `data_difabel`.`user_id`)) join `app_majors` `major_volunteer` on(`major_volunteer`.`majors_id` = `student_volunteer`.`majors_id`)) join `app_faculties` `faculty_volunteer` on(`faculty_volunteer`.`faculty_id` = `major_volunteer`.`faculty_id`)) ORDER BY `app_accompaniment`.`date` ASC, `app_schedule_student`.`start_at` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `app_chart_accompainiment_pendampingan_view`
--
DROP TABLE IF EXISTS `app_chart_accompainiment_pendampingan_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_chart_accompainiment_pendampingan_view`  AS SELECT `app_accompaniment`.`semester_id` AS `semester_id`, `app_schedule_student`.`student_id` AS `student_id`, date_format(`app_accompaniment`.`date`,'%Y-%m') AS `date`, sum(if(`app_accompaniment`.`student_status` is null or `app_accompaniment`.`student_status` = 'terjadwal',1,0)) AS `terjadwal`, sum(if(`app_accompaniment`.`student_status` is null or `app_accompaniment`.`student_status` = 'Dilihat',1,0)) AS `belum_datang`, sum(if(`app_accompaniment`.`student_status` = 'Hadir',1,0)) AS `selesai`, sum(if(`app_accompaniment`.`student_status` = 'Izin',1,0)) AS `izin`, sum(if(`app_accompaniment`.`student_status` = 'Tidak Didampingi',1,0)) AS `tidak_datang` FROM (`app_accompaniment` join `app_schedule_student` on(`app_accompaniment`.`schedule_student_id` = `app_schedule_student`.`schedule_student_id`)) GROUP BY `app_accompaniment`.`semester_id`, `app_schedule_student`.`student_id`, date_format(`app_accompaniment`.`date`,'%Y-%m') ;

-- --------------------------------------------------------

--
-- Structure for view `app_chart_accompainiment_view`
--
DROP TABLE IF EXISTS `app_chart_accompainiment_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_chart_accompainiment_view`  AS SELECT `app_accompaniment`.`semester_id` AS `semester_id`, date_format(`app_accompaniment`.`date`,'%Y-%m') AS `date`, sum(if(`app_accompaniment`.`volunteer_status` is null or `app_accompaniment`.`volunteer_status` = 'terjadwal',1,0)) AS `terjadwal`, sum(if(`app_accompaniment`.`volunteer_status` is null or `app_accompaniment`.`volunteer_status` = 'Dilihat',1,0)) AS `belum_datang`, sum(if(`app_accompaniment`.`volunteer_status` = 'Selesai',1,0)) AS `selesai`, sum(if(`app_accompaniment`.`volunteer_status` = 'Izin',1,0)) AS `izin`, sum(if(`app_accompaniment`.`volunteer_status` = 'Tidak Hadir',1,0)) AS `tidak_datang` FROM `app_accompaniment` GROUP BY `app_accompaniment`.`semester_id`, date_format(`app_accompaniment`.`date`,'%Y-%m') ;

-- --------------------------------------------------------

--
-- Structure for view `app_chart_accompainiment_volunteer_view`
--
DROP TABLE IF EXISTS `app_chart_accompainiment_volunteer_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_chart_accompainiment_volunteer_view`  AS SELECT `app_accompaniment`.`semester_id` AS `semester_id`, CASE WHEN coalesce(`app_accompaniment`.`volunteer_change_status`,'') = '' OR `app_accompaniment`.`volunteer_change_status` = 'rejected' OR `app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation' THEN `app_accompaniment`.`volunteer_id` ELSE `app_accompaniment`.`new_volunteer_id` END AS `volunteer_id`, date_format(`app_accompaniment`.`date`,'%Y-%m') AS `date`, sum(if(`app_accompaniment`.`volunteer_status` is null or `app_accompaniment`.`volunteer_status` = 'terjadwal',1,0)) AS `terjadwal`, sum(if(`app_accompaniment`.`volunteer_status` is null or `app_accompaniment`.`volunteer_status` = 'Dilihat',1,0)) AS `belum_datang`, sum(if(`app_accompaniment`.`volunteer_status` = 'Hadir',1,0)) AS `selesai`, sum(if(`app_accompaniment`.`volunteer_status` = 'Izin',1,0)) AS `izin`, sum(if(`app_accompaniment`.`volunteer_status` = 'Tidak Mendampingi',1,0)) AS `tidak_datang` FROM `app_accompaniment` GROUP BY `app_accompaniment`.`semester_id`, CASE WHEN coalesce(`app_accompaniment`.`volunteer_change_status`,'') = '' OR `app_accompaniment`.`volunteer_change_status` = 'rejected' OR `app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation' THEN `app_accompaniment`.`volunteer_id` ELSE `app_accompaniment`.`new_volunteer_id` END, date_format(`app_accompaniment`.`date`,'%Y-%m') ;

-- --------------------------------------------------------

--
-- Structure for view `app_faculty_view`
--
DROP TABLE IF EXISTS `app_faculty_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_faculty_view`  AS SELECT `app_faculties`.`faculty_id` AS `faculty_id`, `app_faculties`.`faculty_name` AS `faculty_name`, `app_majors`.`majors_id` AS `majors_id`, `app_majors`.`majors_name` AS `majors_name`, `app_majors`.`majors_focus` AS `majors_focus`, `app_majors`.`level` AS `level` FROM (`app_faculties` left join `app_majors` on(`app_majors`.`faculty_id` = `app_faculties`.`faculty_id` and `app_majors`.`is_active` = 1)) WHERE `app_faculties`.`is_active` = 1 ;

-- --------------------------------------------------------

--
-- Structure for view `app_group_schedule_volunteer_view`
--
DROP TABLE IF EXISTS `app_group_schedule_volunteer_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_group_schedule_volunteer_view`  AS SELECT `app_students`.`student_id` AS `student_id`, `app_students`.`user_id` AS `user_id`, `aplego_user`.`name` AS `name`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`majors_id` AS `majors_id`, `app_student_active`.`semester_id` AS `semester_id`, `major`.`majors_name` AS `majors_name`, `major`.`faculty_id` AS `faculty_id`, `faculty`.`faculty_name` AS `faculty_name`, `app_students`.`class_of_college` AS `class_of_college`, `app_students`.`no_hp` AS `no_hp`, `app_students`.`photo` AS `photo`, `get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,1) AS `day1`, `get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,2) AS `day2`, `get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,3) AS `day3`, `get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,4) AS `day4`, `get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,5) AS `day5`, `get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,6) AS `day6`, (select count(0) from `app_accompaniment` where case when coalesce(`app_accompaniment`.`volunteer_change_status`,'') = '' or `app_accompaniment`.`volunteer_change_status` = 'rejected' or `app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation' then `app_accompaniment`.`volunteer_id` else `app_accompaniment`.`new_volunteer_id` end = `app_students`.`student_id` and `app_accompaniment`.`semester_id` = `app_student_active`.`semester_id`) AS `amount`, 0 AS `frequency` FROM ((((`app_students` join `app_student_active` on(`app_student_active`.`student_id` = `app_students`.`student_id` and `app_student_active`.`approver_id` is not null)) join `aplego_user` on(`aplego_user`.`user_id` = `app_students`.`user_id`)) join `app_majors` `major` on(`major`.`majors_id` = `app_students`.`majors_id`)) join `app_faculties` `faculty` on(`faculty`.`faculty_id` = `major`.`faculty_id`)) WHERE `aplego_user`.`capability` = 'volunteer' ;

-- --------------------------------------------------------

--
-- Structure for view `app_permission_view`
--
DROP TABLE IF EXISTS `app_permission_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_permission_view`  AS SELECT `app_permission`.`permission_id` AS `permission_id`, `app_permission`.`semester_id` AS `semester_id`, `app_permission`.`student_id` AS `student_id`, `app_students`.`user_id` AS `user_id`, `aplego_user`.`name` AS `name`, `aplego_user`.`username` AS `username`, `app_students`.`majors_id` AS `majors_id`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`class_of_college` AS `class_of_college`, `app_students`.`no_hp` AS `no_hp`, `app_permission`.`student` AS `student`, `app_permission`.`clarification` AS `clarification`, `app_permission`.`status` AS `status`, `app_permission`.`created_at` AS `created_at`, `app_permission`.`date_start` AS `date_start`, `app_permission`.`date_end` AS `date_end` FROM ((`app_permission` join `app_students` on(`app_students`.`student_id` = `app_permission`.`student_id`)) join `aplego_user` on(`aplego_user`.`user_id` = `app_students`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `app_permit_view`
--
DROP TABLE IF EXISTS `app_permit_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_permit_view`  AS SELECT `app_permit`.`permit_id` AS `permit_id`, `app_permit`.`accompaniment_id` AS `accompaniment_id`, `app_permit`.`semester_id` AS `semester_id`, `app_accompaniment`.`schedule_student_id` AS `schedule_student_id`, `app_accompaniment`.`volunteer_id` AS `volunteer_id`, `app_accompaniment`.`date` AS `date`, `app_accompaniment`.`student_status` AS `student_status`, `app_accompaniment`.`volunteer_status` AS `volunteer_status`, `app_accompaniment`.`review` AS `review`, `app_schedule_student`.`start_at` AS `start_at`, `app_schedule_student`.`end_at` AS `end_at`, `app_schedule_student`.`day` AS `day`, `app_schedule_student`.`room` AS `room`, `app_schedule_student`.`courses` AS `courses`, `app_schedule_student`.`sks` AS `sks`, `app_permit`.`student_id` AS `student_id`, `volunteer`.`nick_name` AS `volunteer_nick_name`, `app_students`.`user_id` AS `user_id`, `aplego_user`.`name` AS `name`, `aplego_user`.`username` AS `username`, `app_students`.`majors_id` AS `majors_id`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`class_of_college` AS `class_of_college`, `app_students`.`no_hp` AS `no_hp`, `app_permit`.`student` AS `student`, `app_permit`.`clarification` AS `clarification`, `app_permit`.`new_volunteer_id` AS `new_volunteer_id`, `app_permit`.`status` AS `status`, `app_permit`.`created_at` AS `created_at` FROM (((((`app_permit` join `app_accompaniment` on(`app_accompaniment`.`accompaniment_id` = `app_permit`.`accompaniment_id` and `app_accompaniment`.`semester_id` = `app_permit`.`semester_id`)) join `app_schedule_student` on(`app_accompaniment`.`schedule_student_id` = `app_schedule_student`.`schedule_student_id` and `app_accompaniment`.`semester_id` = `app_schedule_student`.`semester_id`)) join `app_students` on(`app_students`.`student_id` = `app_permit`.`student_id`)) join `aplego_user` on(`aplego_user`.`user_id` = `app_students`.`user_id`)) left join `app_students` `volunteer` on(`app_permit`.`new_volunteer_id` = `volunteer`.`student_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `app_prepar_schedule_student_view`
--
DROP TABLE IF EXISTS `app_prepar_schedule_student_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_prepar_schedule_student_view`  AS SELECT `app_schedule_student`.`schedule_student_id` AS `schedule_student_id`, `app_schedule_student`.`student_id` AS `student_id`, `app_schedule_student`.`semester_id` AS `semester_id`, `app_schedule_student`.`start_at` AS `start_at`, `app_schedule_student`.`end_at` AS `end_at`, `app_schedule_student`.`day` AS `day`, `app_schedule_student`.`room` AS `room`, `app_schedule_student`.`courses` AS `courses`, `app_schedule_student`.`sks` AS `sks` FROM `app_schedule_student` WHERE `app_schedule_student`.`deleted` = 'false' ;

-- --------------------------------------------------------

--
-- Structure for view `app_prepar_schedule_volunteer_view`
--
DROP TABLE IF EXISTS `app_prepar_schedule_volunteer_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_prepar_schedule_volunteer_view`  AS SELECT `app_schedule_volunteer`.`schedule_volunteer_id` AS `schedule_volunteer_id`, `app_schedule_volunteer`.`student_id` AS `student_id`, `app_students`.`user_id` AS `user_id`, `app_students`.`nick_name` AS `nick_name`, `app_schedule_volunteer`.`semester_id` AS `semester_id`, `app_schedule_volunteer`.`start_at` AS `start_at`, `app_schedule_volunteer`.`end_at` AS `end_at`, `app_schedule_volunteer`.`day` AS `day` FROM ((`app_schedule_volunteer` join `app_student_active` on(`app_student_active`.`student_id` = `app_schedule_volunteer`.`student_id` and `app_student_active`.`semester_id` = `app_schedule_volunteer`.`semester_id` and `app_student_active`.`approver_id` is not null and `app_schedule_volunteer`.`deleted` = 'false')) join `app_students` on(`app_students`.`student_id` = `app_schedule_volunteer`.`student_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `app_report_volunteer_view`
--
DROP TABLE IF EXISTS `app_report_volunteer_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_report_volunteer_view`  AS SELECT `app_accompaniment`.`volunteer_id` AS `volunteer_id`, `app_accompaniment`.`semester_id` AS `semester_id`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`user_id` AS `user_id`, `app_students`.`student_id` AS `student_id`, `aplego_user`.`username` AS `username`, `aplego_user`.`name` AS `name`, sum(if(`app_accompaniment`.`volunteer_status` is null or `app_accompaniment`.`volunteer_status` = 'Dilihat' or `app_accompaniment`.`volunteer_status` = 'Dikonfirmasi',1,0)) AS `count_belum_datang`, sum(if(`app_accompaniment`.`volunteer_status` = 'Hadir',1,0)) AS `count_selesai`, sum(if(`app_accompaniment`.`volunteer_status` = 'Izin',1,0)) AS `count_izin`, sum(if(`app_accompaniment`.`volunteer_status` = 'Tidak Hadir',1,0)) AS `count_tidak_datang`, max(`app_accompaniment`.`review`) AS `max_review`, min(`app_accompaniment`.`review`) AS `min_review`, avg(`app_accompaniment`.`review`) AS `avg_review` FROM ((`app_accompaniment` join `app_students` on(`app_students`.`student_id` = `app_accompaniment`.`volunteer_id`)) join `aplego_user` on(`aplego_user`.`user_id` = `app_students`.`user_id`)) GROUP BY `app_accompaniment`.`semester_id`, `app_accompaniment`.`volunteer_id` ;

-- --------------------------------------------------------

--
-- Structure for view `app_riwayat_pergantian_view`
--
DROP TABLE IF EXISTS `app_riwayat_pergantian_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_riwayat_pergantian_view`  AS SELECT `p`.`s_id` AS `s_id`, `p`.`s_jd_id` AS `s_jd_id`, `p`.`s_pengaju` AS `s_pengaju`, `p`.`s_penerima` AS `s_penerima`, `u`.`name` AS `pengaju`, `u1`.`name` AS `penerima`, `p`.`waktu_pengajuan` AS `waktu_pengajuan`, `p`.`waktu_respon` AS `waktu_respon`, `a`.`name` AS `atas_nama`, `a`.`date` AS `tanggal`, `a`.`start_at` AS `mulai`, `a`.`end_at` AS `selesai`, `p`.`respon` AS `respon`, `a2`.`student_id` AS `student_id` FROM ((((`app_pergantian` `p` join `aplego_user` `u` on(`p`.`s_pengaju` = `u`.`user_id`)) join `aplego_user` `u1` on(`p`.`s_penerima` = `u1`.`user_id`)) join `app_accompaniment_view` `a` on(`p`.`s_jd_id` = `a`.`accompaniment_id`)) join `app_students` `a2` on(`u1`.`user_id` = `a2`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `app_schedule_exam_student_view`
--
DROP TABLE IF EXISTS `app_schedule_exam_student_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_schedule_exam_student_view`  AS SELECT `aplego_user`.`user_id` AS `user_id`, `aplego_user`.`username` AS `username`, `aplego_user`.`name` AS `name`, `aplego_user`.`email` AS `email`, `app_students`.`student_id` AS `student_id`, `app_students`.`majors_id` AS `majors_id`, `app_majors`.`majors_name` AS `majors_name`, `app_majors`.`majors_focus` AS `majors_focus`, `app_majors`.`faculty_id` AS `faculty_id`, `app_faculties`.`faculty_name` AS `faculty_name`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`class_of_college` AS `class_of_college`, `app_students`.`no_hp` AS `no_hp`, `app_schedule_student`.`schedule_student_id` AS `schedule_student_id`, `app_schedule_student`.`semester_id` AS `semester_id`, `app_schedule_student`.`start_at` AS `start_at`, `app_schedule_student`.`end_at` AS `end_at`, `app_schedule_student`.`date` AS `date`, `app_schedule_student`.`room` AS `room`, `app_schedule_student`.`courses` AS `courses`, `app_schedule_student`.`schedule_type` AS `schedule_type`, `app_schedule_student`.`sks` AS `sks` FROM ((((`aplego_user` join `app_students` on(`app_students`.`user_id` = `aplego_user`.`user_id`)) join `app_majors` on(`app_majors`.`majors_id` = `app_students`.`majors_id`)) join `app_faculties` on(`app_faculties`.`faculty_id` = `app_majors`.`faculty_id`)) left join `app_schedule_student` on(`app_schedule_student`.`student_id` = `app_students`.`student_id` and `app_schedule_student`.`date` is not null and `app_schedule_student`.`deleted` = 'false')) WHERE `aplego_user`.`capability` = 'difabel' ORDER BY `aplego_user`.`name` ASC, `app_schedule_student`.`day` ASC, `app_schedule_student`.`start_at` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `app_schedule_exam_volunteer_view`
--
DROP TABLE IF EXISTS `app_schedule_exam_volunteer_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_schedule_exam_volunteer_view`  AS SELECT `aplego_user`.`user_id` AS `user_id`, `aplego_user`.`username` AS `username`, `aplego_user`.`name` AS `name`, `aplego_user`.`email` AS `email`, `app_students`.`student_id` AS `student_id`, `app_students`.`majors_id` AS `majors_id`, `app_majors`.`majors_name` AS `majors_name`, `app_majors`.`faculty_id` AS `faculty_id`, `app_faculties`.`faculty_name` AS `faculty_name`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`class_of_college` AS `class_of_college`, `app_students`.`no_hp` AS `no_hp`, `app_schedule_volunteer`.`schedule_volunteer_id` AS `schedule_volunteer_id`, `app_schedule_volunteer`.`semester_id` AS `semester_id`, `app_schedule_volunteer`.`start_at` AS `start_at`, `app_schedule_volunteer`.`end_at` AS `end_at`, `app_schedule_volunteer`.`date` AS `date`, `app_schedule_volunteer`.`room` AS `room`, `app_schedule_volunteer`.`clarification` AS `clarification`, `app_schedule_volunteer`.`schedule_type` AS `schedule_type` FROM ((((`aplego_user` join `app_students` on(`app_students`.`user_id` = `aplego_user`.`user_id`)) join `app_majors` on(`app_majors`.`majors_id` = `app_students`.`majors_id`)) join `app_faculties` on(`app_faculties`.`faculty_id` = `app_majors`.`faculty_id`)) left join `app_schedule_volunteer` on(`app_schedule_volunteer`.`student_id` = `app_students`.`student_id` and `app_schedule_volunteer`.`date` is not null and `app_schedule_volunteer`.`deleted` = 'false')) WHERE `aplego_user`.`capability` = 'volunteer' ORDER BY `aplego_user`.`name` ASC, `app_schedule_volunteer`.`day` ASC, `app_schedule_volunteer`.`start_at` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `app_schedule_student_active_view`
--
DROP TABLE IF EXISTS `app_schedule_student_active_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_schedule_student_active_view`  AS SELECT `app_schedule_student`.`schedule_student_id` AS `schedule_student_id`, `aplego_user`.`user_id` AS `user_id`, `aplego_user`.`username` AS `username`, `aplego_user`.`name` AS `name`, `aplego_user`.`email` AS `email`, `app_students`.`student_id` AS `student_id`, `app_students`.`majors_id` AS `majors_id`, `app_majors`.`majors_name` AS `majors_name`, `app_majors`.`faculty_id` AS `faculty_id`, `app_majors`.`majors_focus` AS `majors_focus`, `app_faculties`.`faculty_name` AS `faculty_name`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`class_of_college` AS `class_of_college`, `app_students`.`no_hp` AS `no_hp`, `app_schedule_student`.`semester_id` AS `semester_id`, `app_schedule_student`.`start_at` AS `start_at`, `app_schedule_student`.`end_at` AS `end_at`, `app_schedule_student`.`day` AS `day`, `app_schedule_student`.`date` AS `date`, `app_accompaniment`.`date` AS `accompaniment_date`, `app_schedule_student`.`room` AS `room`, `app_schedule_student`.`courses` AS `courses`, `app_schedule_student`.`sks` AS `sks`, `app_schedule_student`.`schedule_type` AS `schedule_type`, `app_schedule_student`.`volunteer_id` AS `volunteer_id_prior`, `app_student_active`.`register_id` AS `register_id`, `app_student_active`.`approver_id` AS `approver_id`, `app_student_active`.`created_at` AS `created_at`, `app_accompaniment`.`accompaniment_id` AS `accompaniment_id` FROM ((((((`aplego_user` join `app_students` on(`app_students`.`user_id` = `aplego_user`.`user_id`)) join `app_majors` on(`app_majors`.`majors_id` = `app_students`.`majors_id`)) join `app_faculties` on(`app_faculties`.`faculty_id` = `app_majors`.`faculty_id`)) join `app_schedule_student` on(`app_schedule_student`.`student_id` = `app_students`.`student_id`)) join `app_student_active` on(`app_schedule_student`.`semester_id` = `app_student_active`.`semester_id` and `app_schedule_student`.`deleted` = 'false' and `app_schedule_student`.`student_id` = `app_student_active`.`student_id`)) left join `app_accompaniment` on(`app_accompaniment`.`schedule_student_id` = `app_schedule_student`.`schedule_student_id`)) WHERE `aplego_user`.`capability` = 'difabel' AND `app_student_active`.`approver_id` is not null ORDER BY `aplego_user`.`name` ASC, `app_schedule_student`.`day` ASC, `app_schedule_student`.`date` ASC, `app_schedule_student`.`start_at` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `app_schedule_student_rev_view`
--
DROP TABLE IF EXISTS `app_schedule_student_rev_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_schedule_student_rev_view`  AS SELECT `aplego_user`.`user_id` AS `user_id`, `aplego_user`.`username` AS `username`, `aplego_user`.`name` AS `name`, `aplego_user`.`email` AS `email`, `app_students`.`student_id` AS `student_id`, `app_students`.`majors_id` AS `majors_id`, `app_majors`.`majors_name` AS `majors_name`, `app_majors`.`majors_focus` AS `majors_focus`, `app_majors`.`faculty_id` AS `faculty_id`, `app_faculties`.`faculty_name` AS `faculty_name`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`class_of_college` AS `class_of_college`, `app_students`.`no_hp` AS `no_hp`, `app_schedule_student_rev`.`schedule_student_rev_id` AS `schedule_student_rev_id`, `app_schedule_student_rev`.`semester_id` AS `semester_id`, `app_schedule_student_rev`.`start_at` AS `start_at`, `app_schedule_student_rev`.`end_at` AS `end_at`, `app_schedule_student_rev`.`day` AS `day`, `app_schedule_student_rev`.`room` AS `room`, `app_schedule_student_rev`.`courses` AS `courses`, `app_schedule_student_rev`.`sks` AS `sks`, `app_schedule_student_rev`.`rev` AS `rev` FROM (((((`aplego_user` join `app_students` on(`app_students`.`user_id` = `aplego_user`.`user_id`)) join `app_majors` on(`app_majors`.`majors_id` = `app_students`.`majors_id`)) join `app_faculties` on(`app_faculties`.`faculty_id` = `app_majors`.`faculty_id`)) join `app_student_active` on(`app_student_active`.`student_id` = `app_students`.`student_id`)) left join `app_schedule_student_rev` on(`app_schedule_student_rev`.`student_id` = `app_students`.`student_id` and `app_schedule_student_rev`.`deleted` = 'false' and `app_student_active`.`semester_id` = `app_schedule_student_rev`.`semester_id` and `app_schedule_student_rev`.`rev` = `app_student_active`.`rev` + 1)) WHERE `aplego_user`.`capability` = 'difabel' ORDER BY `aplego_user`.`name` ASC, `app_schedule_student_rev`.`day` ASC, `app_schedule_student_rev`.`start_at` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `app_schedule_student_view`
--
DROP TABLE IF EXISTS `app_schedule_student_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_schedule_student_view`  AS SELECT `aplego_user`.`user_id` AS `user_id`, `aplego_user`.`username` AS `username`, `aplego_user`.`name` AS `name`, `aplego_user`.`email` AS `email`, `app_students`.`student_id` AS `student_id`, `app_students`.`majors_id` AS `majors_id`, `app_majors`.`majors_name` AS `majors_name`, `app_majors`.`majors_focus` AS `majors_focus`, `app_majors`.`faculty_id` AS `faculty_id`, `app_faculties`.`faculty_name` AS `faculty_name`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`class_of_college` AS `class_of_college`, `app_students`.`no_hp` AS `no_hp`, `app_schedule_student`.`schedule_student_id` AS `schedule_student_id`, `app_schedule_student`.`semester_id` AS `semester_id`, `app_schedule_student`.`start_at` AS `start_at`, `app_schedule_student`.`end_at` AS `end_at`, `app_schedule_student`.`day` AS `day`, `app_schedule_student`.`room` AS `room`, `app_schedule_student`.`courses` AS `courses`, `app_schedule_student`.`sks` AS `sks`, `app_schedule_student`.`volunteer_id` AS `volunteer_id`, `app_schedule_student`.`schedule_type` AS `schedule_type`, `app_schedule_student`.`date` AS `date`, `volunteer`.`nick_name` AS `volunteer_nick_name`, `volunteer_majors`.`majors_id` AS `volunteer_majors_id`, `volunteer_majors`.`majors_name` AS `volunteer_majors_name`, `volunteer_majors`.`majors_focus` AS `volunteer_majors_focus`, `volunteer_majors`.`faculty_id` AS `volunteer_faculty_id`, `volunteer_faculty`.`faculty_name` AS `volunteer_faculty_name`, `app_student_active`.`approver_id` AS `approver_id` FROM ((((((((`aplego_user` join `app_students` on(`app_students`.`user_id` = `aplego_user`.`user_id`)) join `app_majors` on(`app_majors`.`majors_id` = `app_students`.`majors_id`)) join `app_faculties` on(`app_faculties`.`faculty_id` = `app_majors`.`faculty_id`)) left join `app_schedule_student` on(`app_schedule_student`.`student_id` = `app_students`.`student_id` and `app_schedule_student`.`deleted` = 'false')) left join `app_student_active` on(`app_schedule_student`.`semester_id` = `app_student_active`.`semester_id` and `app_schedule_student`.`deleted` = 'false' and `app_schedule_student`.`student_id` = `app_student_active`.`student_id`)) left join `app_students` `volunteer` on(`volunteer`.`student_id` = `app_schedule_student`.`volunteer_id`)) left join `app_majors` `volunteer_majors` on(`volunteer_majors`.`majors_id` = `volunteer`.`majors_id`)) left join `app_faculties` `volunteer_faculty` on(`volunteer_faculty`.`faculty_id` = `volunteer_majors`.`faculty_id`)) WHERE `aplego_user`.`capability` = 'difabel' ORDER BY `aplego_user`.`name` ASC, `app_schedule_student`.`day` ASC, `app_schedule_student`.`start_at` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `app_schedule_volunteer_rev_view`
--
DROP TABLE IF EXISTS `app_schedule_volunteer_rev_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_schedule_volunteer_rev_view`  AS SELECT `aplego_user`.`user_id` AS `user_id`, `aplego_user`.`username` AS `username`, `aplego_user`.`name` AS `name`, `aplego_user`.`email` AS `email`, `app_students`.`student_id` AS `student_id`, `app_students`.`majors_id` AS `majors_id`, `app_majors`.`majors_name` AS `majors_name`, `app_majors`.`faculty_id` AS `faculty_id`, `app_faculties`.`faculty_name` AS `faculty_name`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`class_of_college` AS `class_of_college`, `app_students`.`no_hp` AS `no_hp`, `app_schedule_volunteer_rev`.`schedule_volunteer_rev_id` AS `schedule_volunteer_rev_id`, `app_schedule_volunteer_rev`.`semester_id` AS `semester_id`, `app_schedule_volunteer_rev`.`start_at` AS `start_at`, `app_schedule_volunteer_rev`.`end_at` AS `end_at`, `app_schedule_volunteer_rev`.`day` AS `day`, `app_schedule_volunteer_rev`.`room` AS `room`, `app_schedule_volunteer_rev`.`clarification` AS `clarification`, `app_schedule_volunteer_rev`.`rev` AS `rev` FROM (((((`aplego_user` join `app_students` on(`app_students`.`user_id` = `aplego_user`.`user_id`)) join `app_majors` on(`app_majors`.`majors_id` = `app_students`.`majors_id`)) join `app_faculties` on(`app_faculties`.`faculty_id` = `app_majors`.`faculty_id`)) join `app_student_active` on(`app_student_active`.`student_id` = `app_students`.`student_id`)) left join `app_schedule_volunteer_rev` on(`app_schedule_volunteer_rev`.`student_id` = `app_students`.`student_id` and `app_schedule_volunteer_rev`.`deleted` = 'false' and `app_student_active`.`semester_id` = `app_schedule_volunteer_rev`.`semester_id` and `app_schedule_volunteer_rev`.`rev` = `app_student_active`.`rev` + 1)) WHERE `aplego_user`.`capability` = 'volunteer' ORDER BY `aplego_user`.`name` ASC, `app_schedule_volunteer_rev`.`day` ASC, `app_schedule_volunteer_rev`.`start_at` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `app_schedule_volunteer_view`
--
DROP TABLE IF EXISTS `app_schedule_volunteer_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_schedule_volunteer_view`  AS SELECT `aplego_user`.`user_id` AS `user_id`, `aplego_user`.`username` AS `username`, `aplego_user`.`name` AS `name`, `aplego_user`.`email` AS `email`, `app_students`.`student_id` AS `student_id`, `app_students`.`majors_id` AS `majors_id`, `app_majors`.`majors_name` AS `majors_name`, `app_majors`.`faculty_id` AS `faculty_id`, `app_faculties`.`faculty_name` AS `faculty_name`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`class_of_college` AS `class_of_college`, `app_students`.`no_hp` AS `no_hp`, `app_schedule_volunteer`.`schedule_volunteer_id` AS `schedule_volunteer_id`, `app_schedule_volunteer`.`semester_id` AS `semester_id`, `app_schedule_volunteer`.`start_at` AS `start_at`, `app_schedule_volunteer`.`end_at` AS `end_at`, `app_schedule_volunteer`.`day` AS `day`, `app_schedule_volunteer`.`room` AS `room`, `app_schedule_volunteer`.`clarification` AS `clarification`, `app_student_active`.`approver_id` AS `approver_id` FROM (((((`aplego_user` join `app_students` on(`app_students`.`user_id` = `aplego_user`.`user_id`)) join `app_majors` on(`app_majors`.`majors_id` = `app_students`.`majors_id`)) join `app_faculties` on(`app_faculties`.`faculty_id` = `app_majors`.`faculty_id`)) left join `app_schedule_volunteer` on(`app_schedule_volunteer`.`student_id` = `app_students`.`student_id` and `app_schedule_volunteer`.`deleted` = 'false')) left join `app_student_active` on(`app_schedule_volunteer`.`semester_id` = `app_student_active`.`semester_id` and `app_schedule_volunteer`.`deleted` = 'false' and `app_schedule_volunteer`.`student_id` = `app_student_active`.`student_id`)) WHERE `aplego_user`.`capability` = 'volunteer' ORDER BY `aplego_user`.`name` ASC, `app_schedule_volunteer`.`day` ASC, `app_schedule_volunteer`.`start_at` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `app_students_view`
--
DROP TABLE IF EXISTS `app_students_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_students_view`  AS SELECT `aplego_user`.`user_id` AS `user_id`, `aplego_user`.`username` AS `username`, `aplego_user`.`name` AS `name`, `aplego_user`.`email` AS `email`, `aplego_user`.`active` AS `active`, `aplego_user`.`capability` AS `capability`, `aplego_user`.`last_login` AS `last_login`, `aplego_user`.`login_count` AS `login_count`, `aplego_user`.`created_at` AS `created_at`, `aplego_user`.`updated_at` AS `updated_at`, `app_students`.`student_id` AS `student_id`, `app_students`.`majors_id` AS `majors_id`, `app_majors`.`majors_name` AS `majors_name`, `app_majors`.`faculty_id` AS `faculty_id`, `app_faculties`.`faculty_name` AS `faculty_name`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`class_of_college` AS `class_of_college`, `app_students`.`no_hp` AS `no_hp`, `app_students`.`photo` AS `photo` FROM (((`aplego_user` join `app_students` on(`app_students`.`user_id` = `aplego_user`.`user_id`)) join `app_majors` on(`app_majors`.`majors_id` = `app_students`.`majors_id`)) join `app_faculties` on(`app_faculties`.`faculty_id` = `app_majors`.`faculty_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `app_student_active_view`
--
DROP TABLE IF EXISTS `app_student_active_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_student_active_view`  AS SELECT `app_student_active`.`register_id` AS `register_id`, `app_student_active`.`student_id` AS `student_id`, `app_student_active`.`semester_id` AS `semester_id`, `app_student_active`.`approver_id` AS `approver_id`, `app_student_active`.`rev` AS `rev`, `app_student_active`.`rev_at` AS `rev_at`, `approver`.`name` AS `approver_name`, `app_student_active`.`created_at` AS `created_at`, `app_students`.`user_id` AS `user_id`, `aplego_user`.`username` AS `username`, `aplego_user`.`capability` AS `capability`, `aplego_user`.`name` AS `name`, `aplego_user`.`email` AS `email`, `app_students`.`majors_id` AS `majors_id`, `app_majors`.`majors_name` AS `majors_name`, `app_majors`.`faculty_id` AS `faculty_id`, `app_faculties`.`faculty_name` AS `faculty_name`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`class_of_college` AS `class_of_college`, `app_students`.`no_hp` AS `no_hp` FROM (((((`app_student_active` join `app_students` on(`app_students`.`student_id` = `app_student_active`.`student_id`)) join `app_majors` on(`app_majors`.`majors_id` = `app_students`.`majors_id`)) join `app_faculties` on(`app_faculties`.`faculty_id` = `app_majors`.`faculty_id`)) join `aplego_user` on(`app_students`.`user_id` = `aplego_user`.`user_id`)) left join `aplego_user` `approver` on(`app_student_active`.`approver_id` = `approver`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `app_student_not_active_view`
--
DROP TABLE IF EXISTS `app_student_not_active_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `app_student_not_active_view`  AS SELECT `app_student_active`.`register_id` AS `register_id`, `app_students`.`student_id` AS `student_id`, `app_student_active`.`semester_id` AS `semester_id`, `app_student_active`.`approver_id` AS `approver_id`, `approver`.`name` AS `approver_name`, `app_student_active`.`created_at` AS `created_at`, `app_students`.`user_id` AS `user_id`, `aplego_user`.`username` AS `username`, `aplego_user`.`capability` AS `capability`, `aplego_user`.`name` AS `name`, `aplego_user`.`email` AS `email`, `app_students`.`majors_id` AS `majors_id`, `app_majors`.`majors_name` AS `majors_name`, `app_majors`.`faculty_id` AS `faculty_id`, `app_faculties`.`faculty_name` AS `faculty_name`, `app_students`.`nick_name` AS `nick_name`, `app_students`.`class_of_college` AS `class_of_college`, `app_students`.`no_hp` AS `no_hp` FROM (((((`app_students` left join `app_student_active` on(`app_students`.`student_id` = `app_student_active`.`student_id`)) join `app_majors` on(`app_majors`.`majors_id` = `app_students`.`majors_id`)) join `app_faculties` on(`app_faculties`.`faculty_id` = `app_majors`.`faculty_id`)) join `aplego_user` on(`app_students`.`user_id` = `aplego_user`.`user_id`)) left join `aplego_user` `approver` on(`app_student_active`.`approver_id` = `approver`.`user_id`)) WHERE `app_student_active`.`approver_id` is null ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aplego_options`
--
ALTER TABLE `aplego_options`
  ADD PRIMARY KEY (`option_id`) USING BTREE;

--
-- Indexes for table `aplego_user`
--
ALTER TABLE `aplego_user`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- Indexes for table `aplego_user_meta`
--
ALTER TABLE `aplego_user_meta`
  ADD PRIMARY KEY (`meta_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `app_accompaniment`
--
ALTER TABLE `app_accompaniment`
  ADD PRIMARY KEY (`accompaniment_id`) USING BTREE,
  ADD KEY `schedule_student_id` (`schedule_student_id`) USING BTREE,
  ADD KEY `volunteer_id` (`volunteer_id`) USING BTREE,
  ADD KEY `semester_id` (`semester_id`) USING BTREE;

--
-- Indexes for table `app_faculties`
--
ALTER TABLE `app_faculties`
  ADD PRIMARY KEY (`faculty_id`) USING BTREE;

--
-- Indexes for table `app_majors`
--
ALTER TABLE `app_majors`
  ADD PRIMARY KEY (`majors_id`) USING BTREE,
  ADD KEY `faculty_id` (`faculty_id`) USING BTREE;

--
-- Indexes for table `app_notifications`
--
ALTER TABLE `app_notifications`
  ADD PRIMARY KEY (`notif_id`) USING BTREE;

--
-- Indexes for table `app_payouts`
--
ALTER TABLE `app_payouts`
  ADD PRIMARY KEY (`payout_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `app_payout_items`
--
ALTER TABLE `app_payout_items`
  ADD PRIMARY KEY (`item_id`) USING BTREE,
  ADD KEY `payout_id` (`payout_id`) USING BTREE,
  ADD KEY `volunteer_id` (`volunteer_id`) USING BTREE,
  ADD KEY `paid_confirm_id` (`paid_confirm_id`) USING BTREE;

--
-- Indexes for table `app_pergantian`
--
ALTER TABLE `app_pergantian`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `app_permission`
--
ALTER TABLE `app_permission`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `app_permit`
--
ALTER TABLE `app_permit`
  ADD PRIMARY KEY (`permit_id`) USING BTREE,
  ADD KEY `accompaniment_id` (`accompaniment_id`) USING BTREE,
  ADD KEY `semester_id` (`semester_id`) USING BTREE,
  ADD KEY `student_id` (`student_id`) USING BTREE,
  ADD KEY `app_permit_ibfk_4` (`permission_id`);

--
-- Indexes for table `app_schedule_student`
--
ALTER TABLE `app_schedule_student`
  ADD PRIMARY KEY (`schedule_student_id`) USING BTREE,
  ADD KEY `student_id` (`student_id`) USING BTREE,
  ADD KEY `semester_id` (`semester_id`) USING BTREE;

--
-- Indexes for table `app_schedule_student_rev`
--
ALTER TABLE `app_schedule_student_rev`
  ADD PRIMARY KEY (`schedule_student_rev_id`) USING BTREE,
  ADD KEY `student_id` (`student_id`) USING BTREE,
  ADD KEY `semester_id` (`semester_id`) USING BTREE;

--
-- Indexes for table `app_schedule_volunteer`
--
ALTER TABLE `app_schedule_volunteer`
  ADD PRIMARY KEY (`schedule_volunteer_id`) USING BTREE,
  ADD KEY `student_id` (`student_id`) USING BTREE,
  ADD KEY `semester_id` (`semester_id`) USING BTREE;

--
-- Indexes for table `app_schedule_volunteer_rev`
--
ALTER TABLE `app_schedule_volunteer_rev`
  ADD PRIMARY KEY (`schedule_volunteer_rev_id`) USING BTREE,
  ADD KEY `student_id` (`student_id`) USING BTREE,
  ADD KEY `semester_id` (`semester_id`) USING BTREE;

--
-- Indexes for table `app_semester`
--
ALTER TABLE `app_semester`
  ADD PRIMARY KEY (`semester_id`) USING BTREE;

--
-- Indexes for table `app_students`
--
ALTER TABLE `app_students`
  ADD PRIMARY KEY (`student_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `majors_id` (`majors_id`) USING BTREE;

--
-- Indexes for table `app_student_active`
--
ALTER TABLE `app_student_active`
  ADD PRIMARY KEY (`register_id`) USING BTREE,
  ADD KEY `student_id` (`student_id`) USING BTREE,
  ADD KEY `semester_id` (`semester_id`) USING BTREE,
  ADD KEY `approver_id` (`approver_id`) USING BTREE;

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ci_sessions_timestamp` (`timestamp`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aplego_options`
--
ALTER TABLE `aplego_options`
  MODIFY `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `aplego_user`
--
ALTER TABLE `aplego_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1015;

--
-- AUTO_INCREMENT for table `aplego_user_meta`
--
ALTER TABLE `aplego_user_meta`
  MODIFY `meta_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2435;

--
-- AUTO_INCREMENT for table `app_accompaniment`
--
ALTER TABLE `app_accompaniment`
  MODIFY `accompaniment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1139627;

--
-- AUTO_INCREMENT for table `app_faculties`
--
ALTER TABLE `app_faculties`
  MODIFY `faculty_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `app_majors`
--
ALTER TABLE `app_majors`
  MODIFY `majors_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=532;

--
-- AUTO_INCREMENT for table `app_notifications`
--
ALTER TABLE `app_notifications`
  MODIFY `notif_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_payouts`
--
ALTER TABLE `app_payouts`
  MODIFY `payout_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_payout_items`
--
ALTER TABLE `app_payout_items`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_pergantian`
--
ALTER TABLE `app_pergantian`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `app_permission`
--
ALTER TABLE `app_permission`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_permit`
--
ALTER TABLE `app_permit`
  MODIFY `permit_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2443;

--
-- AUTO_INCREMENT for table `app_schedule_student`
--
ALTER TABLE `app_schedule_student`
  MODIFY `schedule_student_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6297;

--
-- AUTO_INCREMENT for table `app_schedule_student_rev`
--
ALTER TABLE `app_schedule_student_rev`
  MODIFY `schedule_student_rev_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5773;

--
-- AUTO_INCREMENT for table `app_schedule_volunteer`
--
ALTER TABLE `app_schedule_volunteer`
  MODIFY `schedule_volunteer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19221;

--
-- AUTO_INCREMENT for table `app_schedule_volunteer_rev`
--
ALTER TABLE `app_schedule_volunteer_rev`
  MODIFY `schedule_volunteer_rev_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11945;

--
-- AUTO_INCREMENT for table `app_semester`
--
ALTER TABLE `app_semester`
  MODIFY `semester_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `app_students`
--
ALTER TABLE `app_students`
  MODIFY `student_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;

--
-- AUTO_INCREMENT for table `app_student_active`
--
ALTER TABLE `app_student_active`
  MODIFY `register_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1281;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aplego_user_meta`
--
ALTER TABLE `aplego_user_meta`
  ADD CONSTRAINT `aplego_user_meta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `aplego_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `app_accompaniment`
--
ALTER TABLE `app_accompaniment`
  ADD CONSTRAINT `app_accompaniment_ibfk_1` FOREIGN KEY (`schedule_student_id`) REFERENCES `app_schedule_student` (`schedule_student_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `app_accompaniment_ibfk_2` FOREIGN KEY (`volunteer_id`) REFERENCES `app_students` (`student_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `app_accompaniment_ibfk_3` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `app_majors`
--
ALTER TABLE `app_majors`
  ADD CONSTRAINT `app_majors_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `app_faculties` (`faculty_id`) ON UPDATE CASCADE;

--
-- Constraints for table `app_payouts`
--
ALTER TABLE `app_payouts`
  ADD CONSTRAINT `app_payouts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `aplego_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `app_payout_items`
--
ALTER TABLE `app_payout_items`
  ADD CONSTRAINT `app_payout_items_ibfk_1` FOREIGN KEY (`payout_id`) REFERENCES `app_payouts` (`payout_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `app_payout_items_ibfk_2` FOREIGN KEY (`volunteer_id`) REFERENCES `app_students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `app_payout_items_ibfk_3` FOREIGN KEY (`paid_confirm_id`) REFERENCES `aplego_user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `app_permit`
--
ALTER TABLE `app_permit`
  ADD CONSTRAINT `app_permit_ibfk_1` FOREIGN KEY (`accompaniment_id`) REFERENCES `app_accompaniment` (`accompaniment_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `app_permit_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `app_permit_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `app_permit_ibfk_4` FOREIGN KEY (`permission_id`) REFERENCES `app_permission` (`permission_id`);

--
-- Constraints for table `app_schedule_student`
--
ALTER TABLE `app_schedule_student`
  ADD CONSTRAINT `app_schedule_student_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `app_schedule_student_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON UPDATE CASCADE;

--
-- Constraints for table `app_schedule_student_rev`
--
ALTER TABLE `app_schedule_student_rev`
  ADD CONSTRAINT `app_schedule_student_rev_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `app_schedule_student_rev_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON UPDATE CASCADE;

--
-- Constraints for table `app_schedule_volunteer`
--
ALTER TABLE `app_schedule_volunteer`
  ADD CONSTRAINT `app_schedule_volunteer_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `app_schedule_volunteer_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON UPDATE CASCADE;

--
-- Constraints for table `app_schedule_volunteer_rev`
--
ALTER TABLE `app_schedule_volunteer_rev`
  ADD CONSTRAINT `app_schedule_volunteer_rev_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `app_schedule_volunteer_rev_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON UPDATE CASCADE;

--
-- Constraints for table `app_students`
--
ALTER TABLE `app_students`
  ADD CONSTRAINT `app_students_ibfk_1` FOREIGN KEY (`majors_id`) REFERENCES `app_majors` (`majors_id`) ON UPDATE CASCADE;

--
-- Constraints for table `app_student_active`
--
ALTER TABLE `app_student_active`
  ADD CONSTRAINT `app_student_active_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `app_student_active_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `app_student_active_ibfk_3` FOREIGN KEY (`approver_id`) REFERENCES `aplego_user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
