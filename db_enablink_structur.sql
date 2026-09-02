/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100418
 Source Host           : localhost:3306
 Source Schema         : db_enablink

 Target Server Type    : MySQL
 Target Server Version : 100418
 File Encoding         : 65001

 Date: 13/08/2022 14:45:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aplego_options
-- ----------------------------
DROP TABLE IF EXISTS `aplego_options`;
CREATE TABLE `aplego_options`  (
  `option_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_key` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `option_value` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`option_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of aplego_options
-- ----------------------------
INSERT INTO `aplego_options` VALUES (1, 'site_name', 'Enablink');
INSERT INTO `aplego_options` VALUES (2, 'site_tagline', 'Enable Disability');
INSERT INTO `aplego_options` VALUES (3, 'site_description', '');
INSERT INTO `aplego_options` VALUES (8, 'difabel', 'Tunanetra');
INSERT INTO `aplego_options` VALUES (9, 'difabel', 'Tunarungu');
INSERT INTO `aplego_options` VALUES (10, 'difabel', 'Cerebral Palsy');
INSERT INTO `aplego_options` VALUES (11, 'difabel', 'Tuna Daksa');
INSERT INTO `aplego_options` VALUES (12, 'difabel', 'Low Vision');
INSERT INTO `aplego_options` VALUES (13, 'current_semester', '27');
INSERT INTO `aplego_options` VALUES (14, 'max_volunteer', '14');
INSERT INTO `aplego_options` VALUES (15, 'copyright', 'Enablink');
INSERT INTO `aplego_options` VALUES (16, 'copyright_link', 'https://enablink.ub.ac.id/');
INSERT INTO `aplego_options` VALUES (17, 'difabel', 'ADHD');
INSERT INTO `aplego_options` VALUES (18, 'difabel', 'Autism');
INSERT INTO `aplego_options` VALUES (19, 'difabel', 'Slow Learner');
INSERT INTO `aplego_options` VALUES (20, 'difabel', 'Down Syndrome');
INSERT INTO `aplego_options` VALUES (21, 'difabel', 'Autis Ringan');
INSERT INTO `aplego_options` VALUES (22, 'difabel', 'Gangguan Syaraf');
INSERT INTO `aplego_options` VALUES (23, 'wa_number', '08113030626');
INSERT INTO `aplego_options` VALUES (24, 'term_condition', '<h1>Syarat Ketentuan Enablink</h1>\r\n<p><br><strong>Ketentuan Penggunaan</strong></p>\r\n<p>Selamat Datang di Enablink! <br><br>Ketentuan Penggunaan ini mengatur penggunaan Enablink dan menyediakan informasi tentang Layanan Enablink yang diuraikan di bawah ini. Saat Anda membuat akun Enablink atau menggunakan Enablink, Anda menyetujui ketentuan ini. </p>\r\n<p><strong>Layanan Enablink</strong></p>\r\n<p>Kami setuju untuk menyediakan Layanan Enablink kepada Anda. Layanan ini meliputi semua produk, fitur, aplikasi, layanan, teknologi, dan perangkat lunak Enablink yang kami sediakan untuk melaksanakan misi Enablink: Menghubungkan anda dengan orang-orang tertentu. Layanan ini terdiri dari sejumlah aspek berikut (Layanan):</p>\r\n<ul>\r\n<li><strong>Mempertemukan satu orang dengan orang yang lain.</strong><br>Setiap orang berbeda antara satu dengan yang lain. Kami ingin mempererat hubungan yang Anda miliki melalui berbagi pengalaman yang berarti bagi Anda. Oleh karena itu, kami membangun sistem yang mencoba untuk memahami orang-orang dan hal-hal yang penting bagi Anda dan orang lain, dan menggunakan informasi itu untuk membantu Anda membuat, menemukan, berpartisipasi, dan membagikan pengalaman-pengalaman yang berarti bagi Anda. Bagian dari upaya tersebut adalah dengan menyorot jadwal baik itu dari volunteer atau mahasiswa disabilitas.</li>\r\n<li><strong>Mendorong terciptanya lingkungan yang bersifat positif, inklusif, dan aman.</strong><br>Kami mengembangkan dan menggunakan alat dan menawarkan sumber daya kepada para anggota komunitas kami yang dapat membantu membuat pengalaman mereka menjadi positif dan terbuka bagi semuanya, termasuk saat kami merasa bahwa mereka mungkin memerlukan bantuan. Kami juga memiliki tim dan sistem yang berfungsi untuk menangkal penyalahgunaan dan pelanggaran Ketentuan dan kebijakan kami, dan menangkal perilaku yang merugikan dan menyesatkan. Kami menggunakan semua informasi yang kami miliki, termasuk informasi Anda, demi menjaga agar platform kami tetap aman. Kami juga dapat membagikan informasi mengenai penyalahgunaan konten atau konten yang merugikan dengan Perusahaan-Perusahaan Pusat Studi dan Layanan DIsabilitas.</li>\r\n<li><strong>Mengembangkan dan menggunakan teknologi yang membantu kami dalam melayani komunitas kami secara konsisten.</strong><br>Mengelola dan menganalisis informasi untuk komunitas kami yang berkembang merupakan sesuatu yang mendasar bagi Layanan kami. Bagian besar dari Layanan kami adalah membuat dan menggunakan teknologi termutakhir yang dapat membantu kami dalam mempersonalisasikan, melindungi, dan meningkatkan Layanan kami dalam skala yang luar biasa besar untuk komunitas</li>\r\n</ul>\r\n<p><strong>Kebijakan Data</strong></p>\r\n<p>Penyediaan Layanan kami memerlukan pengumpulan dan penggunaan informasi Anda. <a href=\"http://help.instagram.com/519522125107875?helpref=page_content\">Kebijakan Data</a> menjelaskan bagaimana kami mengumpulkan, menggunakan, dan membagikan informasi. Kebijakan Data tersebut juga menjelaskan beragam cara yang dapat Anda lakukan untuk mengontrol informasi Anda. Anda harus menyetujui Kebijakan Data untuk menggunakan Enablink</p>\r\n<p><strong>Komitmen Anda</strong></p>\r\n<p>Sebagai balasan atas komitmen kami untuk menyediakan Layanan, kami mewajibkan Anda untuk membuat komitmen di bawah ini dengan kami.</p>\r\n<p><strong>Orang-orang Yang Dapat Menggunakan Enablink.</strong> Kami menghendaki Layanan kami untuk terbuka dan dapat dimanfaatkan oleh siapa saja, namun kami juga menghendaki Layanan kami selamat, aman, dan sesuai dengan peraturan hukum yang ada. Oleh karena itu, kami meminta Anda untuk mematuhi sejumlah batasan agar Anda dapat menjadi bagian dari komunitas Enablink. </p>\r\n<ul>\r\n<li>Untuk dapat menggunakan Enablink, Anda setidaknya harus terdaftar oleh PSLD di setiap kampus anda.</li>\r\n<li>Anda tidak dilarang untuk menerima segala aspek dari Layanan kami berdasarkan hukum yang berlaku atau memanfaatkan Layanan.</li>\r\n<li>Kami sebelumnya tidak pernah menonaktifkan akun Anda yang diakibatkan oleh adanya pelanggaran hukum atau pelanggaran kebijakan kami.</li>\r\n<li>Anda bukan merupakan seorang terpidana pelaku kejahatan seksual.</li>\r\n</ul>\r\n<p><strong>Cara yang Tidak Diperbolehkan Dalam Menggunakan Enablink.</strong> Menyediakan Layanan yang aman dan terbuka bagi siapa pun untuk komunitas yang luas mengharuskan partisipasi dari kita semua.</p>\r\n<ul>\r\n<li><strong>Anda tidak boleh menyamar sebagai orang lain atau memberikan informasi yang tidak akurat.</strong><br>Anda tidak diharuskan untuk mengungkapkan identitas Anda di Enablink, namun Anda harus memberikan informasi yang akurat dan terbaru kepada kami (termasuk informasi pendaftaran). Selain itu, Anda tidak boleh menyamar sebagai orang lain, dan Anda tidak boleh membuat akun untuk orang lain, kecuali Anda telah memperoleh izin yang tegas dari orang tersebut.</li>\r\n<li><strong>Anda tidak boleh melakukan pelanggaran hukum, perbuatan yang menyesatkan, menipu, maupun perbuatan untuk tujuan ilegal atau dilarang.</strong></li>\r\n<li><strong>Anda tidak boleh melanggar (atau membantu maupun mendorong orang lain untuk melanggar) Ketentuan ini atau kebijakan kami.</strong></li>\r\n<li><strong>Anda tidak boleh melakukan apa pun untuk mengganggu atau merusak operasi Layanan sebagaimana mestinya.</strong></li>\r\n<li><strong>Anda tidak boleh mencoba untuk membuat akun atau mengakses maupun mengumpulkan informasi secara tidak sah.</strong><br>Ini meliputi pembuatan akun atau pengumpulan informasi melalui cara otomatis tanpa izin tertulis dari kami.</li>\r\n<li><strong>Anda tidak boleh mencoba untuk membeli, menjual, atau mentransfer aspek mana pun dari akun Anda (termasuk nama pengguna Anda) atau meminta, mengumpulkan, atau menggunakan informasi masuk atau lencana milik pengguna lain.</strong></li>\r\n<li><strong>Anda tidak boleh memposting informasi pribadi, informasi rahasia, atau melakukan apa pun yang melanggar hak milik orang lain, termasuk hak kekayaan intelektual.</strong></li>\r\n<li><strong>Anda tidak boleh menggunakan nama domain atau URL di dalam nama pengguna Anda tanpa persetujuan tertulis dari kami.</strong></li>\r\n</ul>\r\n<p><strong>Izin yang Anda Berikan kepada Kami.</strong> Sebagai bagian dari perjanjian kita, Anda juga memberi kami izin yang kami perlukan untuk menyediakan Layanan. </p>\r\n<ul>\r\n<li><strong>Kami tidak mengklaim hak milik atas konten Anda, namun Anda memberi lisensi kepada kami untuk menggunakannya.</strong><br>Tidak ada yang berubah pada hak Anda atas konten Anda. Kami tidak mengklaim hak milik atas konten Anda yang dikirim di atau melalui Layanan. Sebagai gantinya, saat Anda membagikan, membuat postingan, atau mengunggah konten yang berada dalam cakupan hak kekayaan intelektual (seperti foto atau video) di dalam maupun yang berkaitan dengan Layanan kami, Anda memberi lisensi kepada kami yang bersifat non-eksklusif, bebas royalti, dapat dipindahkan, dapat disublisensikan, dan berlaku di seluruh dunia untuk menghosting, menggunakan, mendistribusikan, mengubah, menjalankan, menyalin, menayangkan secara publik, menerjemahkan, dan membuat karya turunan dari konten Anda</li>\r\n<li><strong>Izin untuk menggunakan nama pengguna Anda, foto profil Anda, dan informasi mengenai hubungan dan tindakan Anda dengan akun, iklan, dan konten bersponsor.</strong><br>Anda memberi izin kepada kami untuk menampilkan nama pengguna Anda, foto profil Anda, dan informasi mengenai tindakan Anda (seperti suka) atau hubungan (seperti mengikuti) di sekitar atau berkaitan dengan akun, iklan, promo, dan konten bersponsor lainnya yang Anda ikuti atau libatkan dalam interaksi Anda yang ditampilkan di Produk Facebook, tanpa adanya imbalan kepada Anda. Misalnya, kami dapat menunjukkan bahwa Anda menyukai postingan bersponsor yang dibuat oleh sebuah merek yang telah membayar kami untuk menampilkan iklannya di Enablink. Sebagaimana tindakan pada konten lainnya dan mengikuti akun lainnya, tindakan pada konten bersponsor dan mengikuti akun bersponsor hanya dapat dilihat oleh orang-orang yang memiliki izin untuk melihat konten tersebut atau mengikuti. Kami juga akan menghormati pengaturan iklan Anda.</li>\r\n<li><strong>Anda menyetujui bahwa kami dapat mengunduh dan memasang pembaruan pada Layanan di perangkat Anda.</strong></li>\r\n</ul>\r\n<p><strong>Hak-hak Tambahan yang Kami Miliki</strong></p>\r\n<ul>\r\n<li>Jika Anda memilih nama pengguna atau pengidentifikasi serupa untuk akun Anda, kami dapat mengubahnya jika menurut kami perubahan tersebut pantas dan perlu (misalnya, jika nama pengguna atau pengidentifikasi yang dimaksud melanggar hak kekayaan intelektual milik seseorang atau menyamar sebagai pengguna lain).</li>\r\n<li>Jika Anda menggunakan konten yang berada dalam cakupan hak kekayaan intelektual yang kami miliki dan sediakan di Layanan kami (seperti misalnya gambar, desain, video, atau suara yang kami sediakan yang Anda tambahkan ke konten yang Anda buat maupun bagikan), maka kami tetap memiliki semua hak atas konten kami (namun bukan konten Anda).</li>\r\n<li>Anda hanya dapat menggunakan kekayaan intelektual dan merek dagang kami maupun tanda-tanda serupa lainnya melalui cara yang diperbolehkan oleh <a href=\"https://www.instagram-brand.com/\">Panduan Merek</a>atau dengan izin tertulis dari kami.</li>\r\n</ul>\r\n<p><strong>Penghapusan Konten dan Penonaktifan atau Penghapusan Akun Anda</strong></p>\r\n<ul>\r\n<li>Kami dapat menghapus konten atau informasi apa pun yang Anda bagikan di Layanan jika kami meyakini bahwa konten atau informasi tersebut melanggar Ketentuan Penggunaan ini, kebijakan kami (termasuk <a href=\"http://help.instagram.com/477434105621119\">Panduan Komunitas PSLD</a>kami), atau kami diperbolehkan atau diwajibkan untuk melakukannya oleh hukum. Kami dapat menolak untuk menyediakan atau berhenti menyediakan semua atau sebagian dari Layanan kepada Anda (termasuk menghapus atau menonaktifkan akun Anda) secepatnya demi melindungi komunitas atau layanan kami, atau jika Anda membuat sesuatu yang menjadi ancaman atau risiko hukum bagi kami, melanggar Ketentuan Penggunaan ini atau kebijakan kami (termasuk <a href=\"http://help.instagram.com/477434105621119\">Panduan Komunitas PSLD</a> kami), jika Anda berulang kali melanggar hak kekayaan intelektual milik orang lain, atau ketika kami diperbolehkan atau diwajibkan untuk melakukannya oleh hukum. Jika kami mengambil tindakan untuk menonaktifkan atau menghapus akun Anda, maka kami akan memberi tahu Anda bila diperlukan. Jika Anda yakin bahwa penghapusan akun Anda merupakan suatu kesalahan, atau Anda ingin menonaktifkan atau menghapus akun Anda secara permanen, harap menghubungi kami.</li>\r\n</ul>\r\n<p><strong>Perjanjian Kita dan Hal yang Terjadi jika Kita Tidak Sepakat</strong></p>\r\n<p><strong>Perjanjian Kita.</strong></p>\r\n<ul>\r\n<li>Jika ada aspek tertentu dari perjanjian ini yang tidak dapat ditegakkan, maka aspek lain akan tetap berlaku.</li>\r\n<li>Perubahan atas atau pelepasan dari perjanjian kita harus dibuat secara tertulis dan ditandatangani oleh kami. Jika kami gagal untuk menegakkan aspek yang ada di perjanjian ini, maka hal tersebut tidak akan dianggap sebagai pelepasan.</li>\r\n<li>Kami memiliki semua hak yang tidak secara tersurat diberikan kepada Anda.</li>\r\n</ul>\r\n<p><strong>Pihak-pihak yang Berhak di Perjanjian ini.</strong></p>\r\n<ul>\r\n<li>Perjanjian ini tidak memberi hak apa pun kepada pihak ketiga.</li>\r\n<li>Anda tidak dapat memindahtangankan hak atau kewajiban Anda dalam perjanjian ini tanpa persetujuan dari kami.</li>\r\n<li>Hak dan kewajiban kami dapat dialihkan ke pihak lain. Seperti misalnya, pengalihan hak dan kewajiban tersebut dapat terjadi jika ada perubahan dalam kepemilikan kami (dalam merger, akuisisi, atau penjualan aset) atau menurut hukum.</li>\r\n</ul>\r\n<p><strong>Pihak yang Bertanggung Jawab Jika Terjadi Sesuatu.</strong></p>\r\n<ul>\r\n<li>Layanan kami disediakan \"sebagaimana adanya,\" dan kami tidak dapat menjamin bahwa Layanan tersebut akan senantiasa aman dan berfungsi dengan sempurna. SEJAUH YANG DIIZINKAN OLEH HUKUM, KAMI JUGA MELEPASKAN SEMUA JAMINAN, BAIK TERSIRAT MAUPUN TERSURAT, TERMASUK JAMINAN TERSIRAT PERIHAL KELAYAKAN SEBAGAI BARANG DAGANGAN, KESESUAIAN UNTUK TUJUAN TERTENTU, KEPEMILIKAN, DAN KETIADAAN PELANGGARAN.</li>\r\n<li>Kami juga tidak dapat mengontrol apa yang orang dan pihak lain lakukan atau katakan, dan kami tidak bertanggung jawab atas tindakan atau perilaku mereka (atau Anda) atau konten mereka (atau Anda) (baik online maupun offline) (termasuk konten yang melanggar hukum atau menimbulkan keberatan). Kami juga tidak bertanggung jawab atas layanan dan fitur yang ditawarkan oleh orang lain atau perusahaan lain, meskipun Anda mengaksesnya melalui Layanan kami.</li>\r\n<li>Tanggung jawab kami untuk apa pun yang terjadi di Layanan tersebut (yang disebut juga dengan \"pertanggungjawaban\") dibatasi sejauh dimungkinkan oleh hukum. Jika terdapat masalah dengan Layanan kami, kami tidak dapat mengetahui semua kemungkinan dampak yang dapat diakibatkan oleh masalah tersebut. Anda menyetujui bahwa kami tidak bertanggung jawab atas hilangnya keuntungan, pendapatan, informasi, atau data, atau kerugian yang bersifat konsekuensial, khusus, tidak langsung, luar biasa, punitif, atau insidental yang muncul dari atau berkaitan dengan Ketentuan ini, sekalipun kami tahu akan kemungkinan adanya kerugian tersebut. Ini meliputi saat kami menghapus konten, informasi, atau akun Anda.</li>\r\n</ul>\r\n<p><strong>Memperbarui Ketentuan Ini</strong></p>\r\n<p>Kami dapat mengubah Layanan dan kebijakan kami, dan kami mungkin perlu untuk membuat perubahan pada Ketentuan ini demi mencerminkan Layanan dan kebijakan kami secara akurat. Kecuali jika diwajibkan secara hukum, kami akan memberi tahu Anda (seperti misalnya, melalui Layanan kami) sebelum kami membuat perubahan pada Ketentuan ini dan memberi waktu kepada Anda untuk meninjau Ketentuan tersebut sebelum diberlakukan. Kemudian, jika Anda terus menggunakan Layanan, maka berarti Anda akan terikat dengan Ketentuan yang telah diperbarui tersebut. </p>');
INSERT INTO `aplego_options` VALUES (25, 'preferensi', 'Bahasa Isyarat Sibi');
INSERT INTO `aplego_options` VALUES (26, 'preferensi', 'Braille');
INSERT INTO `aplego_options` VALUES (28, 'preferensi', 'Braille 2');
INSERT INTO `aplego_options` VALUES (29, 'preferensi', 'Bahasa Isyarat Bisindo');
INSERT INTO `aplego_options` VALUES (30, 'preferensi', 'Lain-lain');
INSERT INTO `aplego_options` VALUES (31, 'preferensi', 'Typist / Juru Ketik');
INSERT INTO `aplego_options` VALUES (32, 'max_frequensi_accompaniment', '4');

-- ----------------------------
-- Table structure for aplego_user
-- ----------------------------
DROP TABLE IF EXISTS `aplego_user`;
CREATE TABLE `aplego_user`  (
  `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(34) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `active` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `capability` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_login` datetime NOT NULL,
  `login_count` int UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 601 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of aplego_user
-- ----------------------------
INSERT INTO `aplego_user` VALUES (1, 'admin', '$P$BkmpeWALLxoaHM.n1dTegaaTtlGf8o1', 'PSLD Universitas Brawijaya', 'psldbrawijaya@ub.ac.id', 'active', 'admin', '2022-08-13 11:41:57', 288, '2019-03-30 14:55:58', '2022-08-13 11:41:57');
INSERT INTO `aplego_user` VALUES (27, 'sulis', '$P$BCiW0O7cMV9N1KHdbOmGoESgAPUlSq1', 'Sulistyowatik', 'sulistyowatikk@gmail.com', 'active', 'admin', '2021-04-26 16:48:54', 351, '2019-06-30 21:33:26', '2021-04-26 16:48:54');
INSERT INTO `aplego_user` VALUES (110, 'nastain', '$P$Bo3MchlFpmCFB/TKL4k0b3Z9ra012W.', 'Khairun Nasta\'in', 'khairunnastain@gmail.com', 'active', 'admin', '2022-04-14 13:40:45', 172, '2019-12-12 18:57:19', '2022-04-14 13:40:45');
INSERT INTO `aplego_user` VALUES (111, 'mahalli', '$P$Bg7nNjgOILK.Ul4pXoWVrJqXYoy/7n/', 'Mahalli', 'mahalli.ra@gmail.com', 'active', 'admin', '2020-01-20 09:46:46', 6, '2019-12-12 18:58:13', '2020-01-20 09:46:46');
INSERT INTO `aplego_user` VALUES (139, 'lintang', '$P$B2zUm3zYrmiqR1r.01EG1uSeAsQL4M.', 'Alies Poetri Lintangsari', 'alieslintang@ub.ac.id', 'active', 'admin', '0000-00-00 00:00:00', 0, '2019-12-23 08:09:59', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (462, 'Ismiarta', '$P$BnKvQsIWFvjsrhkTepcNpNyxC/wWh10', 'Ismiarta', 'contoh@gmail.com', 'active', 'admin', '2022-07-26 21:43:50', 9, '2020-12-02 13:56:59', '2022-07-26 21:43:50');
INSERT INTO `aplego_user` VALUES (470, 'Riza', '$P$BIhsM6sbvcoJeQQw0saEwakhvV39xP/', 'Riza Aditya', 'riza.aditya@ub.ac.id', 'active', 'admin', '2022-04-18 08:43:44', 122, '2021-02-05 10:41:26', '2022-04-18 08:43:44');

-- ----------------------------
-- Table structure for aplego_user_meta
-- ----------------------------
DROP TABLE IF EXISTS `aplego_user_meta`;
CREATE TABLE `aplego_user_meta`  (
  `meta_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `meta_key` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `meta_value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`meta_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `aplego_user_meta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `aplego_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 876 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of aplego_user_meta
-- ----------------------------

-- ----------------------------
-- Table structure for app_accompaniment
-- ----------------------------
DROP TABLE IF EXISTS `app_accompaniment`;
CREATE TABLE `app_accompaniment`  (
  `accompaniment_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `semester_id` int UNSIGNED NULL DEFAULT NULL,
  `schedule_student_id` int UNSIGNED NULL DEFAULT NULL,
  `volunteer_id` int UNSIGNED NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `student_status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'terjadwal',
  `volunteer_status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'terjadwal',
  `review` int NULL DEFAULT NULL,
  `review_note` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `new_room` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `new_day` int NULL DEFAULT NULL,
  `new_start_at` time NULL DEFAULT NULL,
  `new_end_at` time NULL DEFAULT NULL,
  `new_volunteer_id` int NULL DEFAULT NULL,
  `volunteer_change_status` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `accompaniment_note` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`accompaniment_id`) USING BTREE,
  INDEX `schedule_student_id`(`schedule_student_id` ASC) USING BTREE,
  INDEX `volunteer_id`(`volunteer_id` ASC) USING BTREE,
  INDEX `semester_id`(`semester_id` ASC) USING BTREE,
  CONSTRAINT `app_accompaniment_ibfk_1` FOREIGN KEY (`schedule_student_id`) REFERENCES `app_schedule_student` (`schedule_student_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `app_accompaniment_ibfk_2` FOREIGN KEY (`volunteer_id`) REFERENCES `app_students` (`student_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `app_accompaniment_ibfk_3` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 14472 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_accompaniment
-- ----------------------------

-- ----------------------------
-- Table structure for app_faculties
-- ----------------------------
DROP TABLE IF EXISTS `app_faculties`;
CREATE TABLE `app_faculties`  (
  `faculty_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `faculty_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_active` int NULL DEFAULT 1,
  PRIMARY KEY (`faculty_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_faculties
-- ----------------------------
INSERT INTO `app_faculties` VALUES (9, 'Fakultas Hukum', 0);
INSERT INTO `app_faculties` VALUES (10, 'Fakultas Ekonomi dan Bisnis', 0);
INSERT INTO `app_faculties` VALUES (11, 'Fakultas Ilmu Administrasi', 0);
INSERT INTO `app_faculties` VALUES (12, 'Fakultas Pertanian', 0);
INSERT INTO `app_faculties` VALUES (13, 'Fakultas Peternakan', 0);
INSERT INTO `app_faculties` VALUES (14, 'Fakultas Teknik', 0);
INSERT INTO `app_faculties` VALUES (15, 'Fakultas Kedokteran', 0);
INSERT INTO `app_faculties` VALUES (16, 'Fakultas Perikanan dan Ilmu Kelautan', 0);
INSERT INTO `app_faculties` VALUES (17, 'Fakultas Matematika & IPA', 0);
INSERT INTO `app_faculties` VALUES (18, 'Fakultas Teknologi Pertanian', 0);
INSERT INTO `app_faculties` VALUES (19, 'Fakultas Ilmu Sosial dan Ilmu Politik', 0);
INSERT INTO `app_faculties` VALUES (20, 'Fakultas Ilmu Budaya', 0);
INSERT INTO `app_faculties` VALUES (21, 'Fakultas Kedokteran Hewan', 0);
INSERT INTO `app_faculties` VALUES (22, 'Fakultas Ilmu Komputer', 0);
INSERT INTO `app_faculties` VALUES (23, 'Fakultas Vokasi', 0);
INSERT INTO `app_faculties` VALUES (24, 'Magister - Program Studi Pascasarjana', 0);
INSERT INTO `app_faculties` VALUES (25, 'Doktor', 0);
INSERT INTO `app_faculties` VALUES (26, 'Fakultas Pascasarjana', 0);
INSERT INTO `app_faculties` VALUES (27, 'Fakultas Kedokteran Gigi', 0);
INSERT INTO `app_faculties` VALUES (28, 'Fakultas Ilmu Kesehatan', 0);
INSERT INTO `app_faculties` VALUES (29, 'Fakultas Hukum', 1);
INSERT INTO `app_faculties` VALUES (30, 'Fakultas Ekonomi dan Bisnis', 1);
INSERT INTO `app_faculties` VALUES (31, 'Fakultas Ilmu Administrasi', 1);
INSERT INTO `app_faculties` VALUES (32, 'Fakultas Pertanian', 1);
INSERT INTO `app_faculties` VALUES (33, 'Fakultas Peternakan', 1);
INSERT INTO `app_faculties` VALUES (34, 'Fakultas Teknik', 1);
INSERT INTO `app_faculties` VALUES (35, 'Fakultas Kedokteran', 1);
INSERT INTO `app_faculties` VALUES (36, 'Fakultas Perikanan dan Ilmu Kelautan', 1);
INSERT INTO `app_faculties` VALUES (37, 'Fakultas Matematika & IPA', 1);
INSERT INTO `app_faculties` VALUES (38, 'Fakultas Teknologi Pertanian', 1);
INSERT INTO `app_faculties` VALUES (39, 'Fakultas Ilmu Budaya', 1);
INSERT INTO `app_faculties` VALUES (40, 'Fakultas Ilmu Sosial dan Ilmu Politik', 1);
INSERT INTO `app_faculties` VALUES (41, 'Fakultas Kedokteran Hewan', 1);
INSERT INTO `app_faculties` VALUES (42, 'Fakultas Ilmu Komputer', 1);
INSERT INTO `app_faculties` VALUES (43, 'Fakultas Kedokteran Gigi', 1);
INSERT INTO `app_faculties` VALUES (44, 'Fakultas Vokasi', 1);
INSERT INTO `app_faculties` VALUES (45, 'Fakultas Pascasarjana', 1);
INSERT INTO `app_faculties` VALUES (46, 'Fakultas Ilmu Kesehatan', 1);

-- ----------------------------
-- Table structure for app_majors
-- ----------------------------
DROP TABLE IF EXISTS `app_majors`;
CREATE TABLE `app_majors`  (
  `majors_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `faculty_id` int UNSIGNED NOT NULL,
  `majors_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `majors_focus` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `level` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`majors_id`) USING BTREE,
  INDEX `faculty_id`(`faculty_id` ASC) USING BTREE,
  CONSTRAINT `app_majors_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `app_faculties` (`faculty_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 532 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_majors
-- ----------------------------
INSERT INTO `app_majors` VALUES (17, 9, 'Ilmu Hukum', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (18, 10, 'Ekonomi Pembangunan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (19, 10, 'Ekonomi Islam', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (20, 10, 'Manajemen', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (21, 10, 'Akuntansi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (22, 10, 'Kewirausahaan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (23, 10, 'Keuangan dan Perbankan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (24, 11, 'Administrasi Publik', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (25, 11, 'Administrasi Bisnis', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (26, 11, 'Perpajakan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (27, 11, 'Ilmu Perpustakaan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (28, 11, 'Pariwisata', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (29, 11, 'Administrasi Pendidikan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (30, 12, 'Agroekoteknologi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (31, 12, 'Agribisnis', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (32, 13, 'Peternakan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (33, 14, 'Teknik Sipil', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (34, 14, 'Teknik Industri', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (35, 14, 'Teknik Elektro', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (36, 14, 'Arsitektur', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (37, 14, 'Teknik Pengairan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (38, 14, 'Perencanaan Wilayah & Kota', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (39, 14, 'Teknik Mesin', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (40, 14, 'Teknik Kimia', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (41, 15, 'Pendidikan Dokter', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (42, 15, 'Pendidikan Dokter Gigi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (43, 15, 'Ilmu Keperawatan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (44, 15, 'Gizi Kesehatan/Ilmu Gizi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (45, 15, 'Kebidanan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (46, 15, 'Farmasi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (47, 16, 'Manajemen Sumberdaya Perairan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (48, 16, 'Budidaya Perairan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (49, 16, 'Teknologi Hasil Perikanan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (50, 16, 'Pemanfaatan Sumberdaya Perikanan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (51, 16, 'Ilmu Kelautan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (52, 16, 'Agrobisnis Perikanan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (53, 17, 'Biologi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (54, 17, 'Fisika', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (55, 17, 'Kimia', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (56, 17, 'Matematika', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (57, 17, 'Statistika', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (58, 17, 'Teknik Geofisika', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (59, 17, 'Instrumentasi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (60, 18, 'Teknologi Pangan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (61, 18, 'Teknik Pertanian dan Biosistem', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (62, 18, 'Teknologi Industri Pertanian', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (63, 18, 'Bioteknologi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (64, 18, 'Teknik Lingkungan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (65, 18, 'Teknologi Bioproses', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (66, 19, 'Sosiologi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (67, 19, 'Ilmu Komunikasi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (68, 19, 'Psikologi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (69, 19, 'Hubungan Internasional', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (70, 19, 'Ilmu Politik', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (71, 19, 'Ilmu Pemerintahan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (72, 20, 'Sastra Inggris', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (73, 20, 'Sastra Jepang', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (74, 20, 'Bahasa Dan Sastra Prancis', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (75, 20, 'Sastra Cina', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (76, 20, 'Pendidikan Bhs & Sastra Indonesia', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (77, 20, 'Pendidikan Bahasa Inggris', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (78, 20, 'Pendidikan Bahasa Jepang', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (79, 20, 'Seni Rupa Murni', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (80, 20, 'Antropologi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (81, 21, 'Pendidikan Dokter Hewan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (82, 22, 'Teknik Informatika', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (83, 22, 'Sistem Informasi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (84, 22, 'Pendidikan Teknologi Informasi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (85, 22, 'Teknologi Informasi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (86, 22, 'Teknik Komputer', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (87, 23, 'Manajemen Perhotelan', NULL, 'D4', 0);
INSERT INTO `app_majors` VALUES (88, 23, 'Desain Grafis', NULL, 'D4', 0);
INSERT INTO `app_majors` VALUES (89, 23, 'Bidang Keahlian Sekretaris', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (90, 23, 'Kesekretariatan BK. Public Relations', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (91, 23, 'Bidang Keahlian Bahasa Inggris', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (92, 23, 'Kesekretariatan BK. Perpustakaan dan Arsip', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (93, 23, 'Bidang Keahlian Perancangan Peraturan dan Kontrak Bisnis', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (94, 23, 'Bidang Keahlian Perbankan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (95, 23, 'Keuangan dan Perbankan BK. Akuntansi Terapan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (96, 23, 'Teknik Komputer BK. Teknologi Informasi dan Komputer', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (97, 23, 'Teknik Komputer BK. Business Digital dan E-Commerce', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (98, 23, 'Teknik Komputer BK. Sistem Informasi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (99, 23, 'Desain Grafis BK. Desain Komunikasi Visual', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (100, 23, 'Teknik Komputer BK. Film dan Televisi', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (101, 23, 'Desain Grafis BK. Desain Interior', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (102, 23, 'Bidang Keahlian Pariwisata', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (103, 23, 'Bidang Keahlian Perhotelan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (104, 23, 'Bidang Keahlian Perpajakan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (105, 24, 'S2 - Ilmu Lingkungan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (106, 24, 'S2 - Studi Pertanahan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (107, 24, 'S2 - Kajian Gender', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (108, 25, 'S3 - Ilmu Lingkungan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (109, 25, 'S3 - Studi Pertanahan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (110, 24, 'S2 - Budidaya Perairan', NULL, NULL, 0);
INSERT INTO `app_majors` VALUES (367, 29, 'Ilmu Hukum', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (368, 29, 'Ilmu Hukum', 'SOSHUM', 'S2', 1);
INSERT INTO `app_majors` VALUES (369, 29, 'Kenotariatan', 'SOSHUM', 'S2', 1);
INSERT INTO `app_majors` VALUES (370, 29, 'Ilmu Hukum', 'SOSHUM', 'S3', 1);
INSERT INTO `app_majors` VALUES (371, 29, 'Ilmu Hukum Kampus Jakarta', 'SOSHUM', 'S3', 1);
INSERT INTO `app_majors` VALUES (372, 30, 'Kewirausahaan', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (373, 30, 'Manajemen', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (374, 30, 'Manajemen', NULL, 'S2', 1);
INSERT INTO `app_majors` VALUES (375, 30, 'Ilmu Manajemen', NULL, 'S3', 1);
INSERT INTO `app_majors` VALUES (376, 30, 'Manajemen Kampus Jakarta', NULL, 'S3', 1);
INSERT INTO `app_majors` VALUES (377, 30, 'Akuntansi', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (378, 30, 'Akuntansi', NULL, 'S2', 1);
INSERT INTO `app_majors` VALUES (379, 30, 'Ilmu Akuntansi', NULL, 'S3', 1);
INSERT INTO `app_majors` VALUES (380, 30, 'Ekonomi Pembangunan', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (381, 30, 'Ekonomi Islam', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (382, 30, 'Ekonomi, Keuangan Dan Perbankan', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (383, 30, 'Ilmu Ekonomi', NULL, 'S2', 1);
INSERT INTO `app_majors` VALUES (384, 30, 'Ilmu Ekonomi', NULL, 'S3', 1);
INSERT INTO `app_majors` VALUES (385, 31, 'Administrasi Bisnis', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (386, 31, 'Perpajakan', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (387, 31, 'Pariwisata', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (388, 31, 'Administrasi Kampus Jakarta', 'SOSHUM', 'S3', 1);
INSERT INTO `app_majors` VALUES (389, 31, 'Administrasi Bisnis', 'SOSHUM', 'S2', 1);
INSERT INTO `app_majors` VALUES (390, 31, 'Administrasi Publik', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (391, 31, 'Ilmu Perpustakaan', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (392, 31, 'Administrasi Pendidikan', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (393, 31, 'Manajemen Pendidikan Tinggi', 'SOSHUM', 'S2', 1);
INSERT INTO `app_majors` VALUES (394, 31, 'Ilmu Administrasi Publik', NULL, 'S2', 1);
INSERT INTO `app_majors` VALUES (395, 31, 'Ilmu Administrasi', 'SOSHUM', 'S3', 1);
INSERT INTO `app_majors` VALUES (396, 32, 'Agroekoteknologi', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (397, 32, 'Agroekoteknologi (PSDKU Kediri)', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (398, 32, 'Agronomi', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (399, 32, 'Agribisnis', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (400, 32, 'Agribisnis (PSDKU Kediri)', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (401, 32, 'Ekonomi Pertanian', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (402, 32, 'Sosiologi', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (403, 32, 'Agribisnis', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (404, 32, 'Pengelolaan Tanah dan Air', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (405, 32, 'Kehutanan', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (406, 32, 'Patologi Tumbuhan', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (407, 32, 'Entomologi Tanaman', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (408, 32, 'Ilmu Pertanian', 'SAINTEK', 'S3', 1);
INSERT INTO `app_majors` VALUES (409, 33, 'Peternakan', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (410, 33, 'Peternakan (PSDKU Kediri)', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (411, 33, 'Ilmu Ternak', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (412, 33, 'Ilmu Ternak', 'SAINTEK', 'S3', 1);
INSERT INTO `app_majors` VALUES (413, 34, 'Teknik Mesin', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (414, 34, 'Teknik Mesin', NULL, 'S2', 1);
INSERT INTO `app_majors` VALUES (415, 34, 'Ilmu Teknik Mesin', NULL, 'S3', 1);
INSERT INTO `app_majors` VALUES (416, 34, 'Teknik Elektro', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (417, 34, 'Teknik Elektro', NULL, 'S2', 1);
INSERT INTO `app_majors` VALUES (418, 34, 'Arsitektur', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (419, 34, 'Arsitektur Lingkungan Binaan', NULL, 'S2', 1);
INSERT INTO `app_majors` VALUES (420, 34, 'Teknik Pengairan', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (421, 34, 'Teknik Pengairan', NULL, 'S2', 1);
INSERT INTO `app_majors` VALUES (422, 34, 'Teknik Sumber Daya Air', NULL, 'S3', 1);
INSERT INTO `app_majors` VALUES (423, 34, 'Perencanaan Wilayah & Kota', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (424, 34, 'Perencanaan Wilayah Dan Kota', NULL, 'S2', 1);
INSERT INTO `app_majors` VALUES (425, 34, 'Teknik Industri', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (426, 34, 'Teknik Kimia', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (427, 34, 'Teknik Sipil', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (428, 34, 'Teknik Sipil', NULL, 'S2', 1);
INSERT INTO `app_majors` VALUES (429, 34, 'Ilmu Teknik Sipil', NULL, 'S3', 1);
INSERT INTO `app_majors` VALUES (430, 35, 'Kedokteran', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (431, 35, 'Ilmu Biomedik', NULL, 'S2', 1);
INSERT INTO `app_majors` VALUES (432, 35, 'Ilmu Kedokteran', NULL, 'S3', 1);
INSERT INTO `app_majors` VALUES (433, 35, 'Manajemen Rumah Sakit', NULL, 'S2', 1);
INSERT INTO `app_majors` VALUES (434, 35, 'Keperawatan', NULL, 'S2', 1);
INSERT INTO `app_majors` VALUES (435, 35, 'Ilmu Keperawatan', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (436, 35, 'Ilmu Gizi', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (437, 35, 'Kebidanan', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (438, 35, 'Kebidanan', NULL, 'S2', 1);
INSERT INTO `app_majors` VALUES (439, 35, 'Farmasi', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (440, 36, 'Pemanfaatan Sumberdaya Perikanan', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (441, 36, 'Ilmu Kelautan', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (442, 36, 'Agrobisnis Perikanan', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (443, 36, 'Sosial Ekonomi Perikanan (PSDKU Kediri)', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (444, 36, 'Teknologi Hasil Perikanan', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (445, 36, 'Manajemen Sumberdaya Perairan', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (446, 36, 'Budidaya Perairan', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (447, 36, 'Akuakultur (PSDKU Kediri)', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (448, 36, 'Ilmu Perikanan dan Kelautan', 'SAINTEK', 'S3', 1);
INSERT INTO `app_majors` VALUES (449, 36, 'Budidaya Perairan', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (450, 37, 'Biologi', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (451, 37, 'Biologi', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (452, 37, 'Biologi', 'SAINTEK', 'S3', 1);
INSERT INTO `app_majors` VALUES (453, 37, 'Instrumentasi', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (454, 37, 'Teknik Geofisika', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (455, 37, 'Fisika', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (456, 37, 'Fisika', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (457, 37, 'Fisika', 'SAINTEK', 'S3', 1);
INSERT INTO `app_majors` VALUES (458, 37, 'Kimia', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (459, 37, 'Kimia', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (460, 37, 'Kimia', 'SAINTEK', 'S3', 1);
INSERT INTO `app_majors` VALUES (461, 37, 'Matematika', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (462, 37, 'Matematika', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (463, 37, 'Matematika', 'SAINTEK', 'S3', 1);
INSERT INTO `app_majors` VALUES (464, 37, 'Ilmu Aktuaria', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (465, 37, 'Statistika', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (466, 37, 'Statistika', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (467, 38, 'Bioteknologi', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (468, 38, 'Teknologi Pangan', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (469, 38, 'Teknologi Hasil Pertanian', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (470, 38, 'Ilmu Pangan', 'SAINTEK', 'S3', 1);
INSERT INTO `app_majors` VALUES (471, 38, 'Teknologi Bioproses', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (472, 38, 'Teknik Lingkungan', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (473, 38, 'Teknik Pertanian dan Biosistem', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (474, 38, 'Teknik Pertanian dan Biosistem', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (475, 38, 'Teknik Industri Pertanian', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (476, 38, 'Teknologi Industri Pertanian', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (477, 38, 'Teknologi Industri Pertanian', 'SAINTEK', 'S3', 1);
INSERT INTO `app_majors` VALUES (478, 39, 'Sastra Cina', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (479, 39, 'Sastra Inggris', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (480, 39, 'Sastra Jepang', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (481, 39, 'Bahasa Dan Sastra Prancis', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (482, 39, 'Ilmu Linguistik', 'SOSHUM', 'S2', 1);
INSERT INTO `app_majors` VALUES (483, 39, 'Pendidikan Bahasa Inggris', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (484, 39, 'Pendidikan Bahasa Jepang', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (485, 39, 'Pendidikan Bhs & Sastra Indonesia', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (486, 39, 'Seni Rupa Murni', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (487, 39, 'Antropologi', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (488, 40, 'Sosiologi', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (489, 40, 'Ilmu Sosial', 'SOSHUM', 'S2', 1);
INSERT INTO `app_majors` VALUES (490, 40, 'Ilmu Sosiologi', 'SOSHUM', 'S3', 1);
INSERT INTO `app_majors` VALUES (491, 40, 'Ilmu Komunikasi', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (492, 40, 'Ilmu Komunikasi', 'SOSHUM', 'S2', 1);
INSERT INTO `app_majors` VALUES (493, 40, 'Psikologi', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (494, 40, 'Hubungan Internasional', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (495, 40, 'Ilmu Politik', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (496, 40, 'Ilmu Pemerintahan', 'SOSHUM', 'S1', 1);
INSERT INTO `app_majors` VALUES (497, 41, 'Pendidikan Dokter Hewan', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (498, 42, 'Teknik Informatika', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (499, 42, 'Teknik Komputer', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (500, 42, 'Ilmu Komputer', 'SAINTEK', 'S2', 1);
INSERT INTO `app_majors` VALUES (501, 42, 'Pendidikan Teknologi Informasi', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (502, 42, 'Teknologi Informasi', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (503, 42, 'Sistem Informasi', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (504, 43, 'Pendidikan Dokter Gigi', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (505, 44, 'Kesekretariatan BK. Business English', NULL, 'D3', 1);
INSERT INTO `app_majors` VALUES (506, 44, 'Teknik Komputer BK. Film dan Televisi', NULL, 'D3', 1);
INSERT INTO `app_majors` VALUES (507, 44, 'Desain Grafis BK. Desain Komunikasi Visual', NULL, 'D4', 1);
INSERT INTO `app_majors` VALUES (508, 44, 'Manajemen Perhotelan', 'SOSHUM', 'D4', 1);
INSERT INTO `app_majors` VALUES (509, 44, 'Kesekretariatan BK. Public Relations', NULL, 'D3', 1);
INSERT INTO `app_majors` VALUES (510, 44, 'Kesekretariatan BK. Administrasi Perkantoran dan Sekretaris', NULL, 'D3', 1);
INSERT INTO `app_majors` VALUES (511, 44, 'Teknik Komputer BK. Teknologi Informasi dan Komputer', NULL, 'D3', 1);
INSERT INTO `app_majors` VALUES (512, 44, 'Teknik Komputer BK. Business Digital dan E-Commerce', NULL, 'D3', 1);
INSERT INTO `app_majors` VALUES (513, 44, 'Teknik Komputer BK. Sistem Informasi', NULL, 'D3', 1);
INSERT INTO `app_majors` VALUES (514, 44, 'Kesekretariatan BK. Administrasi Hukum', NULL, 'D3', 1);
INSERT INTO `app_majors` VALUES (515, 44, 'Keuangan dan Perbankan BK. Perpajakan', NULL, 'D3', 1);
INSERT INTO `app_majors` VALUES (516, 44, 'Keuangan dan Perbankan BK. Perbankan', NULL, 'D3', 1);
INSERT INTO `app_majors` VALUES (517, 44, 'Kesekretariatan BK. Perpustakaan dan Arsip', NULL, 'D3', 1);
INSERT INTO `app_majors` VALUES (518, 44, 'Desain Grafis BK. Desain Interior', NULL, 'D4', 1);
INSERT INTO `app_majors` VALUES (519, 44, 'Keuangan dan Perbankan BK. Akuntansi Terapan', NULL, 'D3', 1);
INSERT INTO `app_majors` VALUES (520, 44, 'Desain Grafis', 'SAINTEK', 'D4', 1);
INSERT INTO `app_majors` VALUES (521, 44, 'Administrasi Bisnis', 'SOSHUM', 'D3', 1);
INSERT INTO `app_majors` VALUES (522, 44, 'Keuangan dan Perbankan', 'SOSHUM', 'D3', 1);
INSERT INTO `app_majors` VALUES (523, 44, 'Teknologi Informasi', 'SAINTEK', 'D3', 1);
INSERT INTO `app_majors` VALUES (524, 45, 'Kajian Wawasan Nusantara & Ketahanan Nasional', 'SOSHUM', 'S2', 1);
INSERT INTO `app_majors` VALUES (525, 45, 'Pengelolaan Sumberdaya Lingkungan dan Pembangunan', 'SOSHUM', 'S2', 1);
INSERT INTO `app_majors` VALUES (526, 45, 'Kajian Wanita', 'SOSHUM', 'S2', 1);
INSERT INTO `app_majors` VALUES (527, 45, 'Ilmu Lingkungan', 'SOSHUM', 'S3', 1);
INSERT INTO `app_majors` VALUES (528, 45, 'Ilmu Hukum Minat Studi Ketahanan', 'SOSHUM', 'S3', 1);
INSERT INTO `app_majors` VALUES (529, 46, 'Ilmu Keperawatan', 'SAINTEK', 'S1', 1);
INSERT INTO `app_majors` VALUES (530, 46, 'Keperawatan', NULL, 'S2', 1);
INSERT INTO `app_majors` VALUES (531, 46, 'Ilmu Gizi', 'SAINTEK', 'S1', 1);

-- ----------------------------
-- Table structure for app_notifications
-- ----------------------------
DROP TABLE IF EXISTS `app_notifications`;
CREATE TABLE `app_notifications`  (
  `notif_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `notif_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notif_type_id` int NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`notif_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_notifications
-- ----------------------------

-- ----------------------------
-- Table structure for app_payout_items
-- ----------------------------
DROP TABLE IF EXISTS `app_payout_items`;
CREATE TABLE `app_payout_items`  (
  `item_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `payout_id` int UNSIGNED NULL DEFAULT NULL,
  `volunteer_id` int UNSIGNED NULL DEFAULT NULL,
  `payout_value` int UNSIGNED NULL DEFAULT NULL,
  `pertemuan` int UNSIGNED NULL DEFAULT NULL,
  `paid_confirm_id` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`item_id`) USING BTREE,
  INDEX `payout_id`(`payout_id` ASC) USING BTREE,
  INDEX `volunteer_id`(`volunteer_id` ASC) USING BTREE,
  INDEX `paid_confirm_id`(`paid_confirm_id` ASC) USING BTREE,
  CONSTRAINT `app_payout_items_ibfk_1` FOREIGN KEY (`payout_id`) REFERENCES `app_payouts` (`payout_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `app_payout_items_ibfk_2` FOREIGN KEY (`volunteer_id`) REFERENCES `app_students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `app_payout_items_ibfk_3` FOREIGN KEY (`paid_confirm_id`) REFERENCES `aplego_user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_payout_items
-- ----------------------------

-- ----------------------------
-- Table structure for app_payouts
-- ----------------------------
DROP TABLE IF EXISTS `app_payouts`;
CREATE TABLE `app_payouts`  (
  `payout_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NULL DEFAULT NULL,
  `payout_label` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `payout_max_date` date NULL DEFAULT NULL,
  `payout_keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`payout_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `app_payouts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `aplego_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_payouts
-- ----------------------------

-- ----------------------------
-- Table structure for app_permit
-- ----------------------------
DROP TABLE IF EXISTS `app_permit`;
CREATE TABLE `app_permit`  (
  `permit_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `accompaniment_id` int UNSIGNED NULL DEFAULT NULL,
  `semester_id` int UNSIGNED NULL DEFAULT NULL,
  `student_id` int UNSIGNED NULL DEFAULT NULL,
  `student` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `clarification` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `new_volunteer_id` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'menunggu konfirmasi',
  PRIMARY KEY (`permit_id`) USING BTREE,
  INDEX `accompaniment_id`(`accompaniment_id` ASC) USING BTREE,
  INDEX `semester_id`(`semester_id` ASC) USING BTREE,
  INDEX `student_id`(`student_id` ASC) USING BTREE,
  CONSTRAINT `app_permit_ibfk_1` FOREIGN KEY (`accompaniment_id`) REFERENCES `app_accompaniment` (`accompaniment_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `app_permit_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `app_permit_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_permit
-- ----------------------------

-- ----------------------------
-- Table structure for app_schedule_student
-- ----------------------------
DROP TABLE IF EXISTS `app_schedule_student`;
CREATE TABLE `app_schedule_student`  (
  `schedule_student_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int UNSIGNED NOT NULL,
  `semester_id` int UNSIGNED NULL DEFAULT NULL,
  `volunteer_id` int NULL DEFAULT NULL,
  `start_at` time NULL DEFAULT NULL,
  `end_at` time NULL DEFAULT NULL,
  `day` int NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `room` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `courses` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sks` int NULL DEFAULT NULL,
  `schedule_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'kuliah',
  `deleted` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'false',
  PRIMARY KEY (`schedule_student_id`) USING BTREE,
  INDEX `student_id`(`student_id` ASC) USING BTREE,
  INDEX `semester_id`(`semester_id` ASC) USING BTREE,
  CONSTRAINT `app_schedule_student_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_schedule_student_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1716 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_schedule_student
-- ----------------------------

-- ----------------------------
-- Table structure for app_schedule_student_rev
-- ----------------------------
DROP TABLE IF EXISTS `app_schedule_student_rev`;
CREATE TABLE `app_schedule_student_rev`  (
  `schedule_student_rev_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int UNSIGNED NOT NULL,
  `semester_id` int UNSIGNED NULL DEFAULT NULL,
  `rev` int NULL DEFAULT 1,
  `start_at` time NULL DEFAULT NULL,
  `end_at` time NULL DEFAULT NULL,
  `day` int NULL DEFAULT NULL,
  `room` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `courses` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sks` int NULL DEFAULT NULL,
  `schedule_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'kuliah',
  `deleted` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'false',
  PRIMARY KEY (`schedule_student_rev_id`) USING BTREE,
  INDEX `student_id`(`student_id` ASC) USING BTREE,
  INDEX `semester_id`(`semester_id` ASC) USING BTREE,
  CONSTRAINT `app_schedule_student_rev_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_schedule_student_rev_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1751 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_schedule_student_rev
-- ----------------------------

-- ----------------------------
-- Table structure for app_schedule_volunteer
-- ----------------------------
DROP TABLE IF EXISTS `app_schedule_volunteer`;
CREATE TABLE `app_schedule_volunteer`  (
  `schedule_volunteer_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int UNSIGNED NOT NULL,
  `semester_id` int UNSIGNED NULL DEFAULT NULL,
  `start_at` time NULL DEFAULT NULL,
  `end_at` time NULL DEFAULT NULL,
  `day` int NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `clarification` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `schedule_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'kuliah',
  `room` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'kosong',
  `deleted` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'false',
  PRIMARY KEY (`schedule_volunteer_id`) USING BTREE,
  INDEX `student_id`(`student_id` ASC) USING BTREE,
  INDEX `semester_id`(`semester_id` ASC) USING BTREE,
  CONSTRAINT `app_schedule_volunteer_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_schedule_volunteer_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4075 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_schedule_volunteer
-- ----------------------------

-- ----------------------------
-- Table structure for app_schedule_volunteer_rev
-- ----------------------------
DROP TABLE IF EXISTS `app_schedule_volunteer_rev`;
CREATE TABLE `app_schedule_volunteer_rev`  (
  `schedule_volunteer_rev_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int UNSIGNED NOT NULL,
  `semester_id` int UNSIGNED NULL DEFAULT NULL,
  `rev` int NULL DEFAULT NULL,
  `start_at` time NULL DEFAULT NULL,
  `end_at` time NULL DEFAULT NULL,
  `day` int NULL DEFAULT NULL,
  `clarification` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `schedule_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'kuliah',
  `room` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'kosong',
  `deleted` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'false',
  PRIMARY KEY (`schedule_volunteer_rev_id`) USING BTREE,
  INDEX `student_id`(`student_id` ASC) USING BTREE,
  INDEX `semester_id`(`semester_id` ASC) USING BTREE,
  CONSTRAINT `app_schedule_volunteer_rev_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_schedule_volunteer_rev_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_schedule_volunteer_rev
-- ----------------------------

-- ----------------------------
-- Table structure for app_semester
-- ----------------------------
DROP TABLE IF EXISTS `app_semester`;
CREATE TABLE `app_semester`  (
  `semester_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `semester_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_at` date NULL DEFAULT NULL,
  `end_at` date NULL DEFAULT NULL,
  `uts_start_at` date NULL DEFAULT NULL,
  `uts_end_at` date NULL DEFAULT NULL,
  `uas_start_at` date NULL DEFAULT NULL,
  `uas_end_at` date NULL DEFAULT NULL,
  PRIMARY KEY (`semester_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_semester
-- ----------------------------
INSERT INTO `app_semester` VALUES (27, 'Semester Genap 2022/2023', '2022-02-07', '2022-08-26', '2022-08-15', '2022-08-19', '2022-08-22', '2022-08-26');

-- ----------------------------
-- Table structure for app_student_active
-- ----------------------------
DROP TABLE IF EXISTS `app_student_active`;
CREATE TABLE `app_student_active`  (
  `register_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int UNSIGNED NULL DEFAULT NULL,
  `semester_id` int UNSIGNED NULL DEFAULT NULL,
  `approver_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `last_approve_at` datetime NULL DEFAULT NULL,
  `last_rev_at` datetime NULL DEFAULT NULL,
  `rev` int NULL DEFAULT 0,
  `rev_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`register_id`) USING BTREE,
  INDEX `student_id`(`student_id` ASC) USING BTREE,
  INDEX `semester_id`(`semester_id` ASC) USING BTREE,
  INDEX `approver_id`(`approver_id` ASC) USING BTREE,
  CONSTRAINT `app_student_active_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_student_active_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_student_active_ibfk_3` FOREIGN KEY (`approver_id`) REFERENCES `aplego_user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 644 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_student_active
-- ----------------------------

-- ----------------------------
-- Table structure for app_students
-- ----------------------------
DROP TABLE IF EXISTS `app_students`;
CREATE TABLE `app_students`  (
  `student_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `majors_id` int UNSIGNED NOT NULL,
  `nick_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `class_of_college` year NULL DEFAULT NULL,
  `no_hp` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ktm` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `birth_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `majors_id`(`majors_id` ASC) USING BTREE,
  CONSTRAINT `app_students_ibfk_1` FOREIGN KEY (`majors_id`) REFERENCES `app_majors` (`majors_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 595 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_students
-- ----------------------------

-- ----------------------------
-- Table structure for ci_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions`  (
  `id` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `timestamp` int UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ci_sessions_timestamp`(`timestamp` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ci_sessions
-- ----------------------------

-- ----------------------------
-- View structure for app_accompaniment_base_view
-- ----------------------------
DROP VIEW IF EXISTS `app_accompaniment_base_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_accompaniment_base_view` AS select `app_accompaniment`.`accompaniment_id` AS `accompaniment_id`,`app_accompaniment`.`semester_id` AS `semester_id`,`app_accompaniment`.`schedule_student_id` AS `schedule_student_id`,(case when ((coalesce(`app_accompaniment`.`volunteer_change_status`,'') = '') or (`app_accompaniment`.`volunteer_change_status` = 'rejected') or (`app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation')) then `app_accompaniment`.`volunteer_id` else `app_accompaniment`.`new_volunteer_id` end) AS `volunteer_id`,`app_accompaniment`.`volunteer_change_status` AS `volunteer_change_status`,`app_accompaniment`.`new_volunteer_id` AS `new_volunteer_id`,`app_accompaniment`.`new_start_at` AS `start_at`,`app_accompaniment`.`new_end_at` AS `end_at`,`app_accompaniment`.`new_day` AS `new_day`,`volunteer`.`nick_name` AS `nick_name`,`app_accompaniment`.`date` AS `date`,`app_accompaniment`.`student_status` AS `student_status`,`app_accompaniment`.`volunteer_status` AS `volunteer_status`,`app_accompaniment`.`accompaniment_note` AS `accompaniment_note`,`app_accompaniment`.`review_note` AS `review_note`,`app_accompaniment`.`review` AS `review`,`app_accompaniment`.`created_at` AS `created_at`,`app_accompaniment`.`updated_at` AS `updated_at` from (`app_accompaniment` join `app_students` `volunteer` on((`volunteer`.`student_id` = (case when ((coalesce(`app_accompaniment`.`volunteer_change_status`,'') = '') or (`app_accompaniment`.`volunteer_change_status` = 'rejected') or (`app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation')) then `app_accompaniment`.`volunteer_id` else `app_accompaniment`.`new_volunteer_id` end)))) ;

-- ----------------------------
-- View structure for app_accompaniment_schedule_volunteer_view
-- ----------------------------
DROP VIEW IF EXISTS `app_accompaniment_schedule_volunteer_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_accompaniment_schedule_volunteer_view` AS select `app_accompaniment`.`accompaniment_id` AS `accompaniment_id`,`app_schedule_student`.`student_id` AS `student_id`,`app_schedule_student`.`schedule_type` AS `schedule_type`,`app_accompaniment`.`semester_id` AS `semester_id`,`app_accompaniment`.`schedule_student_id` AS `schedule_student_id`,`app_accompaniment`.`accompaniment_note` AS `accompaniment_note`,`app_accompaniment`.`review_note` AS `review_note`,`app_accompaniment`.`review` AS `review`,(case when ((coalesce(`app_accompaniment`.`volunteer_change_status`,'') = '') or (`app_accompaniment`.`volunteer_change_status` = 'rejected') or (`app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation')) then `app_accompaniment`.`volunteer_id` else `app_accompaniment`.`new_volunteer_id` end) AS `volunteer_id`,`app_accompaniment`.`volunteer_change_status` AS `volunteer_change_status`,`app_accompaniment`.`new_volunteer_id` AS `new_volunteer_id`,(case when (coalesce(`app_accompaniment`.`new_start_at`,'') = '') then `app_schedule_student`.`start_at` else `app_accompaniment`.`new_start_at` end) AS `start_at`,(case when (coalesce(`app_accompaniment`.`new_end_at`,'') = '') then `app_schedule_student`.`end_at` else `app_accompaniment`.`new_end_at` end) AS `end_at`,`app_accompaniment`.`new_day` AS `new_day`,(case when (coalesce(`app_accompaniment`.`new_day`,'') = '') then `app_schedule_student`.`day` else `app_accompaniment`.`new_day` end) AS `day`,`app_accompaniment`.`date` AS `date` from (`app_accompaniment` join `app_schedule_student` on(((`app_accompaniment`.`schedule_student_id` = `app_schedule_student`.`schedule_student_id`) and (`app_accompaniment`.`semester_id` = `app_schedule_student`.`semester_id`)))) ;

-- ----------------------------
-- View structure for app_accompaniment_view
-- ----------------------------
DROP VIEW IF EXISTS `app_accompaniment_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_accompaniment_view` AS SELECT
	`app_accompaniment`.`accompaniment_id` AS `accompaniment_id`,
	`app_students`.`user_id` AS `user_id`,
	`user_difabel`.`username` AS `username`,
	`user_difabel`.`name` AS `name`,
	`app_schedule_student`.`student_id` AS `student_id`,
	`app_students`.`majors_id` AS `majors_id`,
	`major`.`majors_name` AS `majors_name`,
	`major`.`majors_focus` AS `majors_focus`,
	`major`.`faculty_id` AS `faculty_id`,
	`faculty`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp`,
	`app_students`.`photo` AS `photo`,
	`app_accompaniment`.`semester_id` AS `semester_id`,
	`app_accompaniment`.`schedule_student_id` AS `schedule_student_id`,(
	CASE
			
			WHEN ( COALESCE ( `app_accompaniment`.`new_start_at`, '' ) = '' ) THEN
			`app_schedule_student`.`start_at` ELSE `app_accompaniment`.`new_start_at` 
		END 
			) AS `start_at`,(
		CASE
				
				WHEN ( COALESCE ( `app_accompaniment`.`new_end_at`, '' ) = '' ) THEN
				`app_schedule_student`.`end_at` ELSE `app_accompaniment`.`new_end_at` 
			END 
				) AS `end_at`,(
			CASE
					
					WHEN ( COALESCE ( `app_accompaniment`.`new_day`, '' ) = '' ) THEN
					`app_schedule_student`.`day` ELSE `app_accompaniment`.`new_day` 
				END 
					) AS `day`,(
				CASE
						
						WHEN ( COALESCE ( `app_accompaniment`.`new_room`, '' ) = '' ) THEN
						`app_schedule_student`.`room` ELSE `app_accompaniment`.`new_room` 
					END 
					) AS `room`,
					`app_accompaniment`.`date` AS `date`,
					`app_schedule_student`.`courses` AS `courses`,
					`app_schedule_student`.`sks` AS `sks`,
					`app_schedule_student`.`schedule_type` AS `schedule_type`,
					`app_accompaniment`.`new_volunteer_id` AS `new_volunteer_id`,
					`app_accompaniment`.`new_day` AS `new_day`,(
					CASE
							
							WHEN ((
									COALESCE ( `app_accompaniment`.`volunteer_change_status`, '' ) = '' 
									) 
								OR ( `app_accompaniment`.`volunteer_change_status` = 'rejected' ) 
								OR ( `app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation' )) THEN
								`app_accompaniment`.`volunteer_id` ELSE `app_accompaniment`.`new_volunteer_id` 
							END 
							) AS `volunteer_id`,
							`app_accompaniment`.`volunteer_change_status` AS `volunteer_change_status`,
							`student_volunteer`.`majors_id` AS `volunteer_majors_id`,
							`major_volunteer`.`majors_name` AS `volunteer_majors_name`,
							`major_volunteer`.`majors_focus` AS `volunteer_majors_focus`,
							`major_volunteer`.`faculty_id` AS `volunteer_faculty_id`,
							`faculty_volunteer`.`faculty_name` AS `volunteer_faculty_name`,
							`student_volunteer`.`nick_name` AS `volunteer_nick_name`,
							`student_volunteer`.`class_of_college` AS `volunteer_class_of_college`,
							`student_volunteer`.`no_hp` AS `volunteer_no_hp`,
							`student_volunteer`.`photo` AS `volunteer_photo`,
							`user_volunteer`.`user_id` AS `volunteer_user_id`,
							`user_volunteer`.`username` AS `volunteer_username`,
							`user_volunteer`.`name` AS `volunteer_name`,
							`app_accompaniment`.`student_status` AS `student_status`,
							`app_accompaniment`.`volunteer_status` AS `volunteer_status`,
							`app_accompaniment`.`accompaniment_note` AS `accompaniment_note`,
							`app_accompaniment`.`review_note` AS `review_note`,
							`app_accompaniment`.`review` AS `review`,
							`app_accompaniment`.`created_at` AS `created_at`,
							`app_accompaniment`.`updated_at` AS `updated_at` 
						FROM
							(((((((((
																`app_accompaniment`
																JOIN `app_schedule_student` ON (((
																			`app_accompaniment`.`schedule_student_id` = `app_schedule_student`.`schedule_student_id` 
																			) 
																	AND ( `app_accompaniment`.`semester_id` = `app_schedule_student`.`semester_id` ))))
															JOIN `app_students` ON ((
																	`app_students`.`student_id` = `app_schedule_student`.`student_id` 
																)))
														JOIN `app_majors` `major` ON ((
																`major`.`majors_id` = `app_students`.`majors_id` 
															)))
													JOIN `app_faculties` `faculty` ON ((
															`faculty`.`faculty_id` = `major`.`faculty_id` 
														)))
												JOIN `aplego_user` `user_difabel` ON ((
														`user_difabel`.`user_id` = `app_students`.`user_id` 
													)))
											JOIN `app_students` `student_volunteer` ON ((
													`student_volunteer`.`student_id` = (
													CASE
															
															WHEN ((
																	COALESCE ( `app_accompaniment`.`volunteer_change_status`, '' ) = '' 
																	) 
																OR ( `app_accompaniment`.`volunteer_change_status` = 'rejected' ) 
																OR ( `app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation' )) THEN
																`app_accompaniment`.`volunteer_id` ELSE `app_accompaniment`.`new_volunteer_id` 
															END 
															))))
												JOIN `aplego_user` `user_volunteer` ON ((
														`user_volunteer`.`user_id` = `student_volunteer`.`user_id` 
													)))
											JOIN `app_majors` `major_volunteer` ON ((
													`major_volunteer`.`majors_id` = `student_volunteer`.`majors_id` 
												)))
										JOIN `app_faculties` `faculty_volunteer` ON ((
												`faculty_volunteer`.`faculty_id` = `major_volunteer`.`faculty_id` 
											))) 
								ORDER BY
								`app_accompaniment`.`date`,
	`app_schedule_student`.`start_at` ;

-- ----------------------------
-- View structure for app_accompaniment_view_update
-- ----------------------------
DROP VIEW IF EXISTS `app_accompaniment_view_update`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_accompaniment_view_update` AS select `app_accompaniment`.`accompaniment_id` AS `accompaniment_id`,`app_students`.`user_id` AS `user_id`,`user_difabel`.`username` AS `username`,`user_difabel`.`name` AS `name`,`aplego_user_meta`.`meta_value` AS `jenis_disabilitas`,`app_schedule_student`.`student_id` AS `student_id`,`app_students`.`majors_id` AS `majors_id`,`major`.`majors_name` AS `majors_name`,`major`.`faculty_id` AS `faculty_id`,`faculty`.`faculty_name` AS `faculty_name`,`app_students`.`nick_name` AS `nick_name`,`app_students`.`class_of_college` AS `class_of_college`,`app_students`.`no_hp` AS `no_hp`,`app_students`.`photo` AS `photo`,`app_accompaniment`.`semester_id` AS `semester_id`,`app_accompaniment`.`schedule_student_id` AS `schedule_student_id`,`app_schedule_student`.`start_at` AS `start_at`,`app_schedule_student`.`end_at` AS `end_at`,`app_schedule_student`.`day` AS `day`,`app_schedule_student`.`room` AS `room`,`app_schedule_student`.`courses` AS `courses`,`app_schedule_student`.`sks` AS `sks`,`app_accompaniment`.`volunteer_id` AS `volunteer_id`,`student_volunteer`.`majors_id` AS `volunteer_majors_id`,`major_volunteer`.`majors_name` AS `volunteer_majors_name`,`major_volunteer`.`faculty_id` AS `volunteer_faculty_id`,`faculty_volunteer`.`faculty_name` AS `volunteer_faculty_name`,`student_volunteer`.`nick_name` AS `volunteer_nick_name`,`student_volunteer`.`class_of_college` AS `volunteer_class_of_college`,`student_volunteer`.`no_hp` AS `volunteer_no_hp`,`student_volunteer`.`photo` AS `volunteer_photo`,`user_volunteer`.`user_id` AS `volunteer_user_id`,`user_volunteer`.`username` AS `volunteer_username`,`user_volunteer`.`name` AS `volunteer_name`,`app_accompaniment`.`date` AS `date`,`app_accompaniment`.`student_status` AS `student_status`,`app_accompaniment`.`volunteer_status` AS `volunteer_status`,`app_accompaniment`.`review` AS `review`,`app_accompaniment`.`created_at` AS `created_at`,`app_accompaniment`.`updated_at` AS `updated_at` from (((((((((((`app_accompaniment` join `app_schedule_student` on(((`app_accompaniment`.`schedule_student_id` = `app_schedule_student`.`schedule_student_id`) and (`app_accompaniment`.`semester_id` = `app_schedule_student`.`semester_id`)))) join `app_students` on((`app_students`.`student_id` = `app_schedule_student`.`student_id`))) join `app_majors` `major` on((`major`.`majors_id` = `app_students`.`majors_id`))) join `app_faculties` `faculty` on((`faculty`.`faculty_id` = `major`.`faculty_id`))) join `aplego_user` `user_difabel` on((`user_difabel`.`user_id` = `app_students`.`user_id`))) join `app_students` `student_volunteer` on((`student_volunteer`.`student_id` = `app_accompaniment`.`volunteer_id`))) join `aplego_user` `user_volunteer` on((`user_volunteer`.`user_id` = `student_volunteer`.`user_id`))) join `app_students` `data_difabel` on((`data_difabel`.`student_id` = `app_accompaniment`.`schedule_student_id`))) join `aplego_user_meta` on((`aplego_user_meta`.`user_id` = `data_difabel`.`user_id`))) join `app_majors` `major_volunteer` on((`major_volunteer`.`majors_id` = `student_volunteer`.`majors_id`))) join `app_faculties` `faculty_volunteer` on((`faculty_volunteer`.`faculty_id` = `major_volunteer`.`faculty_id`))) order by `app_accompaniment`.`date`,`app_schedule_student`.`start_at` ;

-- ----------------------------
-- View structure for app_chart_accompainiment_pendampingan_view
-- ----------------------------
DROP VIEW IF EXISTS `app_chart_accompainiment_pendampingan_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_chart_accompainiment_pendampingan_view` AS SELECT
	`app_accompaniment`.`semester_id` AS `semester_id`,
	`app_schedule_student`.`student_id` AS `student_id`,
	date_format( `app_accompaniment`.`date`, '%Y-%m' ) AS `date`,
	sum(
	IF
	(( isnull( `app_accompaniment`.`student_status` ) OR ( `app_accompaniment`.`student_status` = 'terjadwal' )), 1, 0 )) AS `terjadwal`,
	sum(
	IF
	(( isnull( `app_accompaniment`.`student_status` ) OR ( `app_accompaniment`.`student_status` = 'Dilihat' )), 1, 0 )) AS `belum_datang`,
	sum(
	IF
	(( `app_accompaniment`.`student_status` = 'Selesai' ), 1, 0 )) AS `selesai`,
	sum(
	IF
	(( `app_accompaniment`.`student_status` = 'Izin' ), 1, 0 )) AS `izin`,
	sum(
	IF
	(( `app_accompaniment`.`student_status` = 'Tidak Didampingi' ), 1, 0 )) AS `tidak_datang` 
FROM
	(
		`app_accompaniment`
		JOIN `app_schedule_student` ON ((
				`app_accompaniment`.`schedule_student_id` = `app_schedule_student`.`schedule_student_id` 
			))) 
GROUP BY
	`app_accompaniment`.`semester_id`,
	`app_schedule_student`.`student_id`,
	date_format( `app_accompaniment`.`date`, '%Y-%m' ) ;

-- ----------------------------
-- View structure for app_chart_accompainiment_view
-- ----------------------------
DROP VIEW IF EXISTS `app_chart_accompainiment_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_chart_accompainiment_view` AS SELECT
	`app_accompaniment`.`semester_id` AS `semester_id`,
	date_format( `app_accompaniment`.`date`, '%Y-%m' ) AS `date`,
	sum(
	IF
	(( isnull( `app_accompaniment`.`volunteer_status` ) OR ( `app_accompaniment`.`volunteer_status` = 'terjadwal' )), 1, 0 )) AS `terjadwal`,
	sum(
	IF
	(( isnull( `app_accompaniment`.`volunteer_status` ) OR ( `app_accompaniment`.`volunteer_status` = 'Dilihat' )), 1, 0 )) AS `belum_datang`,
	sum(
	IF
	(( `app_accompaniment`.`volunteer_status` = 'Selesai' ), 1, 0 )) AS `selesai`,
	sum(
	IF
	(( `app_accompaniment`.`volunteer_status` = 'Izin' ), 1, 0 )) AS `izin`,
	sum(
	IF
	(( `app_accompaniment`.`volunteer_status` = 'Tidak Hadir' ), 1, 0 )) AS `tidak_datang` 
FROM
	`app_accompaniment` 
GROUP BY
	`app_accompaniment`.`semester_id`,
	date_format( `app_accompaniment`.`date`, '%Y-%m' ) ;

-- ----------------------------
-- View structure for app_chart_accompainiment_volunteer_view
-- ----------------------------
DROP VIEW IF EXISTS `app_chart_accompainiment_volunteer_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_chart_accompainiment_volunteer_view` AS SELECT
	`app_accompaniment`.`semester_id` AS `semester_id`,(
	CASE
			
			WHEN ((
					COALESCE ( `app_accompaniment`.`volunteer_change_status`, '' ) = '' 
					) 
				OR ( `app_accompaniment`.`volunteer_change_status` = 'rejected' ) 
				OR ( `app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation' )) THEN
				`app_accompaniment`.`volunteer_id` ELSE `app_accompaniment`.`new_volunteer_id` 
			END 
			) AS `volunteer_id`,
			date_format( `app_accompaniment`.`date`, '%Y-%m' ) AS `date`,
			sum(
			IF
			(( isnull( `app_accompaniment`.`volunteer_status` ) OR ( `app_accompaniment`.`volunteer_status` = 'terjadwal' )), 1, 0 )) AS `terjadwal`,
			sum(
			IF
			(( isnull( `app_accompaniment`.`volunteer_status` ) OR ( `app_accompaniment`.`volunteer_status` = 'Dilihat' )), 1, 0 )) AS `belum_datang`,
			sum(
			IF
			(( `app_accompaniment`.`volunteer_status` = 'Selesai' ), 1, 0 )) AS `selesai`,
			sum(
			IF
			(( `app_accompaniment`.`volunteer_status` = 'Izin' ), 1, 0 )) AS `izin`,
			sum(
			IF
			(( `app_accompaniment`.`volunteer_status` = 'Tidak Mendampingi' ), 1, 0 )) AS `tidak_datang` 
		FROM
			`app_accompaniment` 
		GROUP BY
			`app_accompaniment`.`semester_id`,(
			CASE
					
					WHEN ((
							COALESCE ( `app_accompaniment`.`volunteer_change_status`, '' ) = '' 
							) 
						OR ( `app_accompaniment`.`volunteer_change_status` = 'rejected' ) 
						OR ( `app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation' )) THEN
						`app_accompaniment`.`volunteer_id` ELSE `app_accompaniment`.`new_volunteer_id` 
					END 
					),
	date_format( `app_accompaniment`.`date`, '%Y-%m' ) ;

-- ----------------------------
-- View structure for app_faculty_view
-- ----------------------------
DROP VIEW IF EXISTS `app_faculty_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_faculty_view` AS SELECT
	`app_faculties`.`faculty_id` AS `faculty_id`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_majors`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`majors_focus` AS `majors_focus`,
	`app_majors`.`level` AS `level`
FROM
	(
		`app_faculties`
		LEFT JOIN `app_majors` ON ((
			`app_majors`.`faculty_id` = `app_faculties`.`faculty_id` AND app_majors.is_active = 1
	))) 
	WHERE app_faculties.is_active = 1 ;

	-- ----------------------------
-- Function structure for get_json_jadwal_volunteer_day
-- ----------------------------
DROP FUNCTION IF EXISTS `get_json_jadwal_volunteer_day`;
delimiter ;;
CREATE FUNCTION `get_json_jadwal_volunteer_day`(`semester_id` INT, `student_id` INT, `day_int` INTEGER(1))
 RETURNS longtext CHARSET latin1
BEGIN
	set @result_data := '';
	SELECT
		IFNULL(CONCAT( '[', GROUP_CONCAT( concat( '["', `app_schedule_volunteer`.`start_at`, '","', `app_schedule_volunteer`.`end_at`, '","', `app_schedule_volunteer`.`schedule_type`, '","', `app_schedule_volunteer`.`room`, '"]' ) ), ']' ),'[]') INTO @result_data 
	FROM
		app_schedule_volunteer 
	WHERE
		app_schedule_volunteer.student_id = student_id 
		AND app_schedule_volunteer.semester_id = semester_id 
		AND app_schedule_volunteer.deleted = 'false' 
		AND app_schedule_volunteer.DAY = day_int;
	RETURN(@result_data);
END
;;
delimiter ;

-- ----------------------------
-- View structure for app_group_schedule_volunteer_view
-- ----------------------------
DROP VIEW IF EXISTS `app_group_schedule_volunteer_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_group_schedule_volunteer_view` AS select `app_students`.`student_id` AS `student_id`,`app_students`.`user_id` AS `user_id`,`aplego_user`.`name` AS `name`,`app_students`.`nick_name` AS `nick_name`,`app_students`.`majors_id` AS `majors_id`,`app_student_active`.`semester_id` AS `semester_id`,`major`.`majors_name` AS `majors_name`,`major`.`faculty_id` AS `faculty_id`,`faculty`.`faculty_name` AS `faculty_name`,`app_students`.`class_of_college` AS `class_of_college`,`app_students`.`no_hp` AS `no_hp`,`app_students`.`photo` AS `photo`,`get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,1) AS `day1`,`get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,2) AS `day2`,`get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,3) AS `day3`,`get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,4) AS `day4`,`get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,5) AS `day5`,`get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,6) AS `day6`,(select count(0) from `app_accompaniment` where (((case when ((coalesce(`app_accompaniment`.`volunteer_change_status`,'') = '') or (`app_accompaniment`.`volunteer_change_status` = 'rejected') or (`app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation')) then `app_accompaniment`.`volunteer_id` else `app_accompaniment`.`new_volunteer_id` end) = `app_students`.`student_id`) and (`app_accompaniment`.`semester_id` = `app_student_active`.`semester_id`))) AS `amount`,0 AS `frequency` from ((((`app_students` join `app_student_active` on(((`app_student_active`.`student_id` = `app_students`.`student_id`) and (`app_student_active`.`approver_id` is not null)))) join `aplego_user` on((`aplego_user`.`user_id` = `app_students`.`user_id`))) join `app_majors` `major` on((`major`.`majors_id` = `app_students`.`majors_id`))) join `app_faculties` `faculty` on((`faculty`.`faculty_id` = `major`.`faculty_id`))) where (`aplego_user`.`capability` = 'volunteer') ;

-- ----------------------------
-- View structure for app_permit_view
-- ----------------------------
DROP VIEW IF EXISTS `app_permit_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_permit_view` AS select `app_permit`.`permit_id` AS `permit_id`,`app_permit`.`accompaniment_id` AS `accompaniment_id`,`app_permit`.`semester_id` AS `semester_id`,`app_accompaniment`.`schedule_student_id` AS `schedule_student_id`,`app_accompaniment`.`volunteer_id` AS `volunteer_id`,`app_accompaniment`.`date` AS `date`,`app_accompaniment`.`student_status` AS `student_status`,`app_accompaniment`.`volunteer_status` AS `volunteer_status`,`app_accompaniment`.`review` AS `review`,`app_schedule_student`.`start_at` AS `start_at`,`app_schedule_student`.`end_at` AS `end_at`,`app_schedule_student`.`day` AS `day`,`app_schedule_student`.`room` AS `room`,`app_schedule_student`.`courses` AS `courses`,`app_schedule_student`.`sks` AS `sks`,`app_permit`.`student_id` AS `student_id`,`volunteer`.`nick_name` AS `volunteer_nick_name`,`app_students`.`user_id` AS `user_id`,`aplego_user`.`name` AS `name`,`aplego_user`.`username` AS `username`,`app_students`.`majors_id` AS `majors_id`,`app_students`.`nick_name` AS `nick_name`,`app_students`.`class_of_college` AS `class_of_college`,`app_students`.`no_hp` AS `no_hp`,`app_permit`.`student` AS `student`,`app_permit`.`clarification` AS `clarification`,`app_permit`.`new_volunteer_id` AS `new_volunteer_id`,`app_permit`.`status` AS `status`,`app_permit`.`created_at` AS `created_at` from (((((`app_permit` join `app_accompaniment` on(((`app_accompaniment`.`accompaniment_id` = `app_permit`.`accompaniment_id`) and (`app_accompaniment`.`semester_id` = `app_permit`.`semester_id`)))) join `app_schedule_student` on(((`app_accompaniment`.`schedule_student_id` = `app_schedule_student`.`schedule_student_id`) and (`app_accompaniment`.`semester_id` = `app_schedule_student`.`semester_id`)))) join `app_students` on((`app_students`.`student_id` = `app_permit`.`student_id`))) join `aplego_user` on((`aplego_user`.`user_id` = `app_students`.`user_id`))) left join `app_students` `volunteer` on((`app_permit`.`new_volunteer_id` = `volunteer`.`student_id`))) ;

-- ----------------------------
-- View structure for app_prepar_schedule_student_view
-- ----------------------------
DROP VIEW IF EXISTS `app_prepar_schedule_student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_prepar_schedule_student_view` AS select `app_schedule_student`.`schedule_student_id` AS `schedule_student_id`,`app_schedule_student`.`student_id` AS `student_id`,`app_schedule_student`.`semester_id` AS `semester_id`,`app_schedule_student`.`start_at` AS `start_at`,`app_schedule_student`.`end_at` AS `end_at`,`app_schedule_student`.`day` AS `day`,`app_schedule_student`.`room` AS `room`,`app_schedule_student`.`courses` AS `courses`,`app_schedule_student`.`sks` AS `sks` from `app_schedule_student` where (`app_schedule_student`.`deleted` = 'false') ;

-- ----------------------------
-- View structure for app_prepar_schedule_volunteer_view
-- ----------------------------
DROP VIEW IF EXISTS `app_prepar_schedule_volunteer_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_prepar_schedule_volunteer_view` AS select `app_schedule_volunteer`.`schedule_volunteer_id` AS `schedule_volunteer_id`,`app_schedule_volunteer`.`student_id` AS `student_id`,`app_students`.`user_id` AS `user_id`,`app_students`.`nick_name` AS `nick_name`,`app_schedule_volunteer`.`semester_id` AS `semester_id`,`app_schedule_volunteer`.`start_at` AS `start_at`,`app_schedule_volunteer`.`end_at` AS `end_at`,`app_schedule_volunteer`.`day` AS `day` from ((`app_schedule_volunteer` join `app_student_active` on(((`app_student_active`.`student_id` = `app_schedule_volunteer`.`student_id`) and (`app_student_active`.`semester_id` = `app_schedule_volunteer`.`semester_id`) and (`app_student_active`.`approver_id` is not null) and (`app_schedule_volunteer`.`deleted` = 'false')))) join `app_students` on((`app_students`.`student_id` = `app_schedule_volunteer`.`student_id`))) ;

-- ----------------------------
-- View structure for app_report_volunteer_view
-- ----------------------------
DROP VIEW IF EXISTS `app_report_volunteer_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_report_volunteer_view` AS select `app_accompaniment`.`volunteer_id` AS `volunteer_id`,`app_accompaniment`.`semester_id` AS `semester_id`,`app_students`.`nick_name` AS `nick_name`,`app_students`.`user_id` AS `user_id`,`app_students`.`student_id` AS `student_id`,`aplego_user`.`username` AS `username`,`aplego_user`.`name` AS `name`,sum(if((isnull(`app_accompaniment`.`volunteer_status`) or (`app_accompaniment`.`volunteer_status` = 'Dilihat') or (`app_accompaniment`.`volunteer_status` = 'Dikonfirmasi')),1,0)) AS `count_belum_datang`,sum(if((`app_accompaniment`.`volunteer_status` = 'Selesai'),1,0)) AS `count_selesai`,sum(if((`app_accompaniment`.`volunteer_status` = 'Izin'),1,0)) AS `count_izin`,sum(if((`app_accompaniment`.`volunteer_status` = 'Tidak Hadir'),1,0)) AS `count_tidak_datang`,max(`app_accompaniment`.`review`) AS `max_review`,min(`app_accompaniment`.`review`) AS `min_review`,avg(`app_accompaniment`.`review`) AS `avg_review` from ((`app_accompaniment` join `app_students` on((`app_students`.`student_id` = `app_accompaniment`.`volunteer_id`))) join `aplego_user` on((`aplego_user`.`user_id` = `app_students`.`user_id`))) group by `app_accompaniment`.`semester_id`,`app_accompaniment`.`volunteer_id` ;

-- ----------------------------
-- View structure for app_schedule_exam_student_view
-- ----------------------------
DROP VIEW IF EXISTS `app_schedule_exam_student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_schedule_exam_student_view` AS SELECT
	`aplego_user`.`user_id` AS `user_id`,
	`aplego_user`.`username` AS `username`,
	`aplego_user`.`name` AS `name`,
	`aplego_user`.`email` AS `email`,
	`app_students`.`student_id` AS `student_id`,
	`app_students`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`majors_focus` AS `majors_focus`,
	`app_majors`.`faculty_id` AS `faculty_id`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp`,
	`app_schedule_student`.`schedule_student_id` AS `schedule_student_id`,
	`app_schedule_student`.`semester_id` AS `semester_id`,
	`app_schedule_student`.`start_at` AS `start_at`,
	`app_schedule_student`.`end_at` AS `end_at`,
	`app_schedule_student`.`date` AS `date`,
	`app_schedule_student`.`room` AS `room`,
	`app_schedule_student`.`courses` AS `courses`,
	`app_schedule_student`.`schedule_type` AS `schedule_type`,
	`app_schedule_student`.`sks` AS `sks` 
FROM
	((((
					`aplego_user`
					JOIN `app_students` ON ((
							`app_students`.`user_id` = `aplego_user`.`user_id` 
						)))
				JOIN `app_majors` ON ((
						`app_majors`.`majors_id` = `app_students`.`majors_id` 
					)))
			JOIN `app_faculties` ON ((
					`app_faculties`.`faculty_id` = `app_majors`.`faculty_id` 
				)))
		LEFT JOIN `app_schedule_student` ON (((
					`app_schedule_student`.`student_id` = `app_students`.`student_id` 
					)
		  AND  (`app_schedule_student`.`date` IS NOT NULL)
			AND ( `app_schedule_student`.`deleted` = 'false' )))) 
WHERE
	( `aplego_user`.`capability` = 'difabel' ) 
ORDER BY
	`aplego_user`.`name`,
	`app_schedule_student`.`day`,
	`app_schedule_student`.`start_at` ;

-- ----------------------------
-- View structure for app_schedule_exam_volunteer_view
-- ----------------------------
DROP VIEW IF EXISTS `app_schedule_exam_volunteer_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_schedule_exam_volunteer_view` AS SELECT
	`aplego_user`.`user_id` AS `user_id`,
	`aplego_user`.`username` AS `username`,
	`aplego_user`.`name` AS `name`,
	`aplego_user`.`email` AS `email`,
	`app_students`.`student_id` AS `student_id`,
	`app_students`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`faculty_id` AS `faculty_id`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp`,
	`app_schedule_volunteer`.`schedule_volunteer_id` AS `schedule_volunteer_id`,
	`app_schedule_volunteer`.`semester_id` AS `semester_id`,
	`app_schedule_volunteer`.`start_at` AS `start_at`,
	`app_schedule_volunteer`.`end_at` AS `end_at`,
	`app_schedule_volunteer`.`date` AS `date`,
	`app_schedule_volunteer`.`room` AS `room`,
	`app_schedule_volunteer`.`clarification` AS `clarification`,
	`app_schedule_volunteer`.`schedule_type` AS `schedule_type` 
FROM
	((((
					`aplego_user`
					JOIN `app_students` ON ((
							`app_students`.`user_id` = `aplego_user`.`user_id` 
						)))
				JOIN `app_majors` ON ((
						`app_majors`.`majors_id` = `app_students`.`majors_id` 
					)))
			JOIN `app_faculties` ON ((
					`app_faculties`.`faculty_id` = `app_majors`.`faculty_id` 
				)))
		LEFT JOIN `app_schedule_volunteer` ON (((
					`app_schedule_volunteer`.`student_id` = `app_students`.`student_id` 
					)
			AND ( `app_schedule_volunteer`.`date` IS NOT NULL) 
			AND ( `app_schedule_volunteer`.`deleted` = 'false' )))) 
WHERE
	( `aplego_user`.`capability` = 'volunteer' )
ORDER BY
	`aplego_user`.`name`,
	`app_schedule_volunteer`.`day`,
	`app_schedule_volunteer`.`start_at` ;

-- ----------------------------
-- View structure for app_schedule_student_active_view
-- ----------------------------
DROP VIEW IF EXISTS `app_schedule_student_active_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_schedule_student_active_view` AS SELECT
	`app_schedule_student`.`schedule_student_id` AS `schedule_student_id`,
	`aplego_user`.`user_id` AS `user_id`,
	`aplego_user`.`username` AS `username`,
	`aplego_user`.`name` AS `name`,
	`aplego_user`.`email` AS `email`,
	`app_students`.`student_id` AS `student_id`,
	`app_students`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`faculty_id` AS `faculty_id`,
	`app_majors`.`majors_focus` AS `majors_focus`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp`,
	`app_schedule_student`.`semester_id` AS `semester_id`,
	`app_schedule_student`.`start_at` AS `start_at`,
	`app_schedule_student`.`end_at` AS `end_at`,
	`app_schedule_student`.`day` AS `day`,
	`app_schedule_student`.`date` AS `date`,
	`app_schedule_student`.`room` AS `room`,
	`app_schedule_student`.`courses` AS `courses`,
	`app_schedule_student`.`sks` AS `sks`,
	`app_schedule_student`.`schedule_type` AS `schedule_type`,
	`app_schedule_student`.volunteer_id AS `volunteer_id_prior`,
	`app_student_active`.`register_id` AS `register_id`,
	`app_student_active`.`approver_id` AS `approver_id`,
	`app_student_active`.`created_at` AS `created_at`,
	app_accompaniment.accompaniment_id
FROM
	(((((
						`aplego_user`
						JOIN `app_students` ON ((
								`app_students`.`user_id` = `aplego_user`.`user_id` 
							)))
					JOIN `app_majors` ON ((
							`app_majors`.`majors_id` = `app_students`.`majors_id` 
						)))
				JOIN `app_faculties` ON ((
						`app_faculties`.`faculty_id` = `app_majors`.`faculty_id` 
					)))
			JOIN `app_schedule_student` ON ((
					`app_schedule_student`.`student_id` = `app_students`.`student_id` 
				)))
		JOIN `app_student_active` ON (((
					`app_schedule_student`.`semester_id` = `app_student_active`.`semester_id` 
					) 
				AND ( `app_schedule_student`.`deleted` = 'false' ) 
			AND ( `app_schedule_student`.`student_id` = `app_student_active`.`student_id` )))
			LEFT JOIN app_accompaniment ON app_accompaniment.schedule_student_id = app_schedule_student.schedule_student_id
			) 
WHERE
	((
			`aplego_user`.`capability` = 'difabel' 
			) 
	AND ( `app_student_active`.`approver_id` IS NOT NULL )) 
ORDER BY
	`aplego_user`.`name`,
	`app_schedule_student`.`day`,
	`app_schedule_student`.`date`,
	`app_schedule_student`.`start_at` ;

-- ----------------------------
-- View structure for app_schedule_student_rev_view
-- ----------------------------
DROP VIEW IF EXISTS `app_schedule_student_rev_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_schedule_student_rev_view` AS SELECT
	`aplego_user`.`user_id` AS `user_id`,
	`aplego_user`.`username` AS `username`,
	`aplego_user`.`name` AS `name`,
	`aplego_user`.`email` AS `email`,
	`app_students`.`student_id` AS `student_id`,
	`app_students`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`majors_focus` AS `majors_focus`,
	`app_majors`.`faculty_id` AS `faculty_id`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp`,
	`app_schedule_student_rev`.`schedule_student_rev_id` AS `schedule_student_rev_id`,
	`app_schedule_student_rev`.`semester_id` AS `semester_id`,
	`app_schedule_student_rev`.`start_at` AS `start_at`,
	`app_schedule_student_rev`.`end_at` AS `end_at`,
	`app_schedule_student_rev`.`day` AS `day`,
	`app_schedule_student_rev`.`room` AS `room`,
	`app_schedule_student_rev`.`courses` AS `courses`,
	`app_schedule_student_rev`.`sks` AS `sks`,
	`app_schedule_student_rev`.`rev` AS `rev` 
FROM
	((((
					`aplego_user`
					JOIN `app_students` ON ((
							`app_students`.`user_id` = `aplego_user`.`user_id` 
						)))
				JOIN `app_majors` ON ((
						`app_majors`.`majors_id` = `app_students`.`majors_id` 
					)))
			JOIN `app_faculties` ON ((
					`app_faculties`.`faculty_id` = `app_majors`.`faculty_id` 
				)))
		JOIN `app_student_active` ON app_student_active.student_id = app_students.student_id
		LEFT JOIN `app_schedule_student_rev` ON (((
					`app_schedule_student_rev`.`student_id` = `app_students`.`student_id` 
					) 
				AND ( `app_schedule_student_rev`.`deleted` = 'false' ) 
				AND `app_student_active`.`semester_id` = `app_schedule_student_rev`.`semester_id` 
			AND `app_schedule_student_rev`.`rev` = ( `app_student_active`.`rev` + 1 )))) 
WHERE
	( `aplego_user`.`capability` = 'difabel' ) 
ORDER BY
	`aplego_user`.`name`,
	`app_schedule_student_rev`.`day`,
	`app_schedule_student_rev`.`start_at` ;

-- ----------------------------
-- View structure for app_schedule_student_view
-- ----------------------------
DROP VIEW IF EXISTS `app_schedule_student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_schedule_student_view` AS SELECT
	`aplego_user`.`user_id` AS `user_id`,
	`aplego_user`.`username` AS `username`,
	`aplego_user`.`name` AS `name`,
	`aplego_user`.`email` AS `email`,
	`app_students`.`student_id` AS `student_id`,
	`app_students`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`majors_focus` AS `majors_focus`,
	`app_majors`.`faculty_id` AS `faculty_id`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp`,
	`app_schedule_student`.`schedule_student_id` AS `schedule_student_id`,
	`app_schedule_student`.`semester_id` AS `semester_id`,
	`app_schedule_student`.`start_at` AS `start_at`,
	`app_schedule_student`.`end_at` AS `end_at`,
	`app_schedule_student`.`day` AS `day`,
	`app_schedule_student`.`room` AS `room`,
	`app_schedule_student`.`courses` AS `courses`,
	`app_schedule_student`.`sks` AS `sks`,
	`app_schedule_student`.`volunteer_id` AS `volunteer_id`,
	`volunteer`.`nick_name` AS `volunteer_nick_name`,
	`volunteer_majors`.`majors_id` AS `volunteer_majors_id`,
	`volunteer_majors`.`majors_name` AS `volunteer_majors_name`,
	`volunteer_majors`.`majors_focus` AS `volunteer_majors_focus`,
	`volunteer_majors`.`faculty_id` AS `volunteer_faculty_id`,
	`volunteer_faculty`.`faculty_name` AS `volunteer_faculty_name`
FROM
	((((
					`aplego_user`
					JOIN `app_students` ON ((
							`app_students`.`user_id` = `aplego_user`.`user_id` 
						)))
				JOIN `app_majors` ON ((
						`app_majors`.`majors_id` = `app_students`.`majors_id` 
					)))
			JOIN `app_faculties` ON ((
					`app_faculties`.`faculty_id` = `app_majors`.`faculty_id` 
				)))
		LEFT JOIN `app_schedule_student` ON (((
					`app_schedule_student`.`student_id` = `app_students`.`student_id` 
					) 
			AND ( `app_schedule_student`.`deleted` = 'false' )))
		LEFT JOIN `app_students` as volunteer ON (`volunteer`.`student_id` = `app_schedule_student`.`volunteer_id`)
		LEFT JOIN `app_majors` as volunteer_majors ON (`volunteer_majors`.`majors_id` = `volunteer`.`majors_id`)
		LEFT JOIN `app_faculties` as volunteer_faculty ON (`volunteer_faculty`.`faculty_id` = `volunteer_majors`.`faculty_id`)) 
WHERE
	( `aplego_user`.`capability` = 'difabel' ) 
ORDER BY
	`aplego_user`.`name`,
	`app_schedule_student`.`day`,
	`app_schedule_student`.`start_at` ;

-- ----------------------------
-- View structure for app_schedule_volunteer_rev_view
-- ----------------------------
DROP VIEW IF EXISTS `app_schedule_volunteer_rev_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_schedule_volunteer_rev_view` AS SELECT
	`aplego_user`.`user_id` AS `user_id`,
	`aplego_user`.`username` AS `username`,
	`aplego_user`.`name` AS `name`,
	`aplego_user`.`email` AS `email`,
	`app_students`.`student_id` AS `student_id`,
	`app_students`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`faculty_id` AS `faculty_id`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp`,
	`app_schedule_volunteer_rev`.`schedule_volunteer_rev_id` AS `schedule_volunteer_rev_id`,
	`app_schedule_volunteer_rev`.`semester_id` AS `semester_id`,
	`app_schedule_volunteer_rev`.`start_at` AS `start_at`,
	`app_schedule_volunteer_rev`.`end_at` AS `end_at`,
	`app_schedule_volunteer_rev`.`day` AS `day`,
	`app_schedule_volunteer_rev`.`room` AS `room`,
	`app_schedule_volunteer_rev`.`clarification` AS `clarification`,
	`app_schedule_volunteer_rev`.`rev`
FROM
	((((
					`aplego_user`
					JOIN `app_students` ON ((
							`app_students`.`user_id` = `aplego_user`.`user_id` 
						)))
				JOIN `app_majors` ON ((
						`app_majors`.`majors_id` = `app_students`.`majors_id` 
					)))
			JOIN `app_faculties` ON ((
					`app_faculties`.`faculty_id` = `app_majors`.`faculty_id` 
				)))
		JOIN `app_student_active` ON app_student_active.student_id = app_students.student_id
		LEFT JOIN `app_schedule_volunteer_rev` ON ((
					`app_schedule_volunteer_rev`.`student_id` = `app_students`.`student_id` 
					 
			AND  `app_schedule_volunteer_rev`.`deleted` = 'false')
		
		AND `app_student_active`.`semester_id` = `app_schedule_volunteer_rev`.`semester_id` 
		AND `app_schedule_volunteer_rev`.`rev` = (
		`app_student_active`.`rev` + 1)
			)) 
WHERE
	( `aplego_user`.`capability` = 'volunteer' ) 
ORDER BY
	`aplego_user`.`name`,
	`app_schedule_volunteer_rev`.`day`,
	`app_schedule_volunteer_rev`.`start_at` ;

-- ----------------------------
-- View structure for app_schedule_volunteer_view
-- ----------------------------
DROP VIEW IF EXISTS `app_schedule_volunteer_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_schedule_volunteer_view` AS SELECT
	`aplego_user`.`user_id` AS `user_id`,
	`aplego_user`.`username` AS `username`,
	`aplego_user`.`name` AS `name`,
	`aplego_user`.`email` AS `email`,
	`app_students`.`student_id` AS `student_id`,
	`app_students`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`faculty_id` AS `faculty_id`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp`,
	`app_schedule_volunteer`.`schedule_volunteer_id` AS `schedule_volunteer_id`,
	`app_schedule_volunteer`.`semester_id` AS `semester_id`,
	`app_schedule_volunteer`.`start_at` AS `start_at`,
	`app_schedule_volunteer`.`end_at` AS `end_at`,
	`app_schedule_volunteer`.`day` AS `day`,
	`app_schedule_volunteer`.`room` AS `room`,
	`app_schedule_volunteer`.`clarification` AS `clarification` 
FROM
	((((
					`aplego_user`
					JOIN `app_students` ON ((
							`app_students`.`user_id` = `aplego_user`.`user_id` 
						)))
				JOIN `app_majors` ON ((
						`app_majors`.`majors_id` = `app_students`.`majors_id` 
					)))
			JOIN `app_faculties` ON ((
					`app_faculties`.`faculty_id` = `app_majors`.`faculty_id` 
				)))
		LEFT JOIN `app_schedule_volunteer` ON (((
					`app_schedule_volunteer`.`student_id` = `app_students`.`student_id` 
					) 
			AND ( `app_schedule_volunteer`.`deleted` = 'false' )))) 
WHERE
	( `aplego_user`.`capability` = 'volunteer' ) 
ORDER BY
	`aplego_user`.`name`,
	`app_schedule_volunteer`.`day`,
	`app_schedule_volunteer`.`start_at` ;

-- ----------------------------
-- View structure for app_students_view
-- ----------------------------
DROP VIEW IF EXISTS `app_students_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_students_view` AS select `aplego_user`.`user_id` AS `user_id`,`aplego_user`.`username` AS `username`,`aplego_user`.`name` AS `name`,`aplego_user`.`email` AS `email`,`aplego_user`.`active` AS `active`,`aplego_user`.`capability` AS `capability`,`aplego_user`.`last_login` AS `last_login`,`aplego_user`.`login_count` AS `login_count`,`aplego_user`.`created_at` AS `created_at`,`aplego_user`.`updated_at` AS `updated_at`,`app_students`.`student_id` AS `student_id`,`app_students`.`majors_id` AS `majors_id`,`app_majors`.`majors_name` AS `majors_name`,`app_majors`.`faculty_id` AS `faculty_id`,`app_faculties`.`faculty_name` AS `faculty_name`,`app_students`.`nick_name` AS `nick_name`,`app_students`.`class_of_college` AS `class_of_college`,`app_students`.`no_hp` AS `no_hp`,`app_students`.`photo` AS `photo` from (((`aplego_user` join `app_students` on((`app_students`.`user_id` = `aplego_user`.`user_id`))) join `app_majors` on((`app_majors`.`majors_id` = `app_students`.`majors_id`))) join `app_faculties` on((`app_faculties`.`faculty_id` = `app_majors`.`faculty_id`))) ;

-- ----------------------------
-- View structure for app_student_active_view
-- ----------------------------
DROP VIEW IF EXISTS `app_student_active_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_student_active_view` AS SELECT
	`app_student_active`.`register_id` AS `register_id`,
	`app_student_active`.`student_id` AS `student_id`,
	`app_student_active`.`semester_id` AS `semester_id`,
	`app_student_active`.`approver_id` AS `approver_id`,
	`app_student_active`.`rev` AS `rev`,
	`app_student_active`.`rev_at` AS `rev_at`,
	`approver`.`name` AS `approver_name`,
	`app_student_active`.`created_at` AS `created_at`,
	`app_students`.`user_id` AS `user_id`,
	`aplego_user`.`username` AS `username`,
	`aplego_user`.`capability` AS `capability`,
	`aplego_user`.`name` AS `name`,
	`aplego_user`.`email` AS `email`,
	`app_students`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`faculty_id` AS `faculty_id`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp` 
FROM
	(((((
						`app_student_active`
						JOIN `app_students` ON ((
								`app_students`.`student_id` = `app_student_active`.`student_id` 
							)))
					JOIN `app_majors` ON ((
							`app_majors`.`majors_id` = `app_students`.`majors_id` 
						)))
				JOIN `app_faculties` ON ((
						`app_faculties`.`faculty_id` = `app_majors`.`faculty_id` 
					)))
			JOIN `aplego_user` ON ((
					`app_students`.`user_id` = `aplego_user`.`user_id` 
				)))
		LEFT JOIN `aplego_user` `approver` ON ((
			`app_student_active`.`approver_id` = `approver`.`user_id` 
	))) ;

-- ----------------------------
-- View structure for app_student_not_active_view
-- ----------------------------
DROP VIEW IF EXISTS `app_student_not_active_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_student_not_active_view` AS select `app_student_active`.`register_id` AS `register_id`,`app_students`.`student_id` AS `student_id`,`app_student_active`.`semester_id` AS `semester_id`,`app_student_active`.`approver_id` AS `approver_id`,`approver`.`name` AS `approver_name`,`app_student_active`.`created_at` AS `created_at`,`app_students`.`user_id` AS `user_id`,`aplego_user`.`username` AS `username`,`aplego_user`.`capability` AS `capability`,`aplego_user`.`name` AS `name`,`aplego_user`.`email` AS `email`,`app_students`.`majors_id` AS `majors_id`,`app_majors`.`majors_name` AS `majors_name`,`app_majors`.`faculty_id` AS `faculty_id`,`app_faculties`.`faculty_name` AS `faculty_name`,`app_students`.`nick_name` AS `nick_name`,`app_students`.`class_of_college` AS `class_of_college`,`app_students`.`no_hp` AS `no_hp` from (((((`app_students` left join `app_student_active` on((`app_students`.`student_id` = `app_student_active`.`student_id`))) join `app_majors` on((`app_majors`.`majors_id` = `app_students`.`majors_id`))) join `app_faculties` on((`app_faculties`.`faculty_id` = `app_majors`.`faculty_id`))) join `aplego_user` on((`app_students`.`user_id` = `aplego_user`.`user_id`))) left join `aplego_user` `approver` on((`app_student_active`.`approver_id` = `approver`.`user_id`))) where isnull(`app_student_active`.`approver_id`) ;



SET FOREIGN_KEY_CHECKS = 1;
