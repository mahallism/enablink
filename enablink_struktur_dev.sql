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

 Date: 14/06/2022 06:18:26
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
) ENGINE = InnoDB AUTO_INCREMENT = 600 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of aplego_user
-- ----------------------------
INSERT INTO `aplego_user` VALUES (1, 'admin', '$P$BkmpeWALLxoaHM.n1dTegaaTtlGf8o1', 'PSLD Universitas Brawijaya', 'psldbrawijaya@ub.ac.id', 'active', 'admin', '2022-06-14 05:12:37', 270, '2019-03-30 14:55:58', '2022-06-14 05:12:37');
INSERT INTO `aplego_user` VALUES (27, 'sulis', '$P$BCiW0O7cMV9N1KHdbOmGoESgAPUlSq1', 'Sulistyowatik', 'sulistyowatikk@gmail.com', 'active', 'admin', '2021-04-26 16:48:54', 351, '2019-06-30 21:33:26', '2021-04-26 16:48:54');
INSERT INTO `aplego_user` VALUES (110, 'nastain', '$P$Bo3MchlFpmCFB/TKL4k0b3Z9ra012W.', 'Khairun Nasta\'in', 'khairunnastain@gmail.com', 'active', 'admin', '2022-04-14 13:40:45', 172, '2019-12-12 18:57:19', '2022-04-14 13:40:45');
INSERT INTO `aplego_user` VALUES (111, 'mahalli', '$P$Bg7nNjgOILK.Ul4pXoWVrJqXYoy/7n/', 'Mahalli', 'mahalli.ra@gmail.com', 'active', 'admin', '2020-01-20 09:46:46', 6, '2019-12-12 18:58:13', '2020-01-20 09:46:46');
INSERT INTO `aplego_user` VALUES (138, 'rachma', '$P$BS.ulRhEO6r9zVdaeEdPI/MrhPcrbt.', 'Rachmawati Ayu Kuswoyo', 'rachmawatiayu94@gmail.com', 'active', 'staf', '0000-00-00 00:00:00', 0, '2019-12-23 08:09:02', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (139, 'lintang', '$P$B2zUm3zYrmiqR1r.01EG1uSeAsQL4M.', 'Alies Poetri Lintangsari', 'alieslintang@ub.ac.id', 'active', 'admin', '0000-00-00 00:00:00', 0, '2019-12-23 08:09:59', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (140, 'ditta', '$P$BHrt/1P6MfuYeIZb9066ThDg9A75Yb1', 'Ditta Dwi Maharani', 'ditta@ub.ac.id', 'inactive', 'admin', '2020-01-02 15:50:00', 2, '2019-12-23 08:12:29', '2021-02-05 10:42:37');
INSERT INTO `aplego_user` VALUES (148, 'gentech', '$P$BqWN4axJWigKQsmU3ekaTSebgby8cX1', 'PT Karya Generus Bangsa', 'info@gentech.id', 'active', 'admin', '2020-01-06 14:21:46', 1, '2020-01-06 14:21:04', '2020-01-07 08:59:28');
INSERT INTO `aplego_user` VALUES (340, '185120600111042 ', '$P$BJt/jQm2re8hxgFq/333s7uNPpttHO.', 'Aulia Thoriqotus Salsabila', 'salsabilaaulia903@gmail.com', 'active', 'volunteer', '2022-05-28 18:33:59', 107, '2020-09-18 09:49:36', '2022-05-28 18:33:59');
INSERT INTO `aplego_user` VALUES (341, '195120101111029', '$P$BjILc7uyqDVfCJnPecfmmAu7i.nise.', 'Devina Cantika Putri', 'devinacantika84@gmail.com', 'active', 'volunteer', '2021-04-30 10:34:17', 138, '2020-09-18 09:53:46', '2021-04-30 10:34:17');
INSERT INTO `aplego_user` VALUES (343, '195020519111001', '$P$BVbnRWfiFvEtA/R.NOX9toYqkWCL2n0', 'Dicky Irawan Prabowo', 'dickyirawan345@gmail.com', 'active', 'difabel', '2022-02-08 06:15:54', 112, '2020-09-18 10:09:40', '2022-02-08 06:15:54');
INSERT INTO `aplego_user` VALUES (344, '165030700111002', '$P$BhEW.cQfTt947.XbSM1qXKa3Svz0et/', 'Diah Lutfiani', 'diahlutfiani@student.ub.ac.id', 'active', 'volunteer', '2021-11-03 21:13:35', 154, '2020-09-18 10:15:19', '2021-11-03 21:14:26');
INSERT INTO `aplego_user` VALUES (345, '193140214111070', '$P$Bkp.SezMLb7WOvXt.dgI67WyOr3Ur6.', 'Monica Jovanca G', 'momicah10@gmail.com', 'active', 'volunteer', '2021-05-02 17:25:39', 130, '2020-09-18 10:27:44', '2021-05-02 17:25:39');
INSERT INTO `aplego_user` VALUES (350, '185040201111075', '$P$BX4d7iou0aeo.zuVmXAa16UhTVfvEd/', 'Ela Novdianda Natasya', 'elatasya07@gmail.com', 'active', 'volunteer', '2020-12-29 19:50:27', 27, '2020-09-18 12:09:26', '2020-12-29 19:50:27');
INSERT INTO `aplego_user` VALUES (351, '193140919111001', '$P$BqL.9SdPWnQ5C2Ioz208G6rmmfkCau1', 'Fasya Hariyuda Pratama', 'fasyapratama887@gmail.com', 'active', 'difabel', '2021-05-02 21:58:05', 156, '2020-09-18 12:51:54', '2021-05-02 21:58:05');
INSERT INTO `aplego_user` VALUES (353, '185020219111001', '$P$BhHTPScJ1GpG29uM73Oy2wx9Io.C8K1', 'Adhi Darmawan', 'adhidarmawan80@gmail.com', 'active', 'difabel', '2021-03-04 15:18:11', 31, '2020-09-18 13:30:11', '2021-03-04 15:18:11');
INSERT INTO `aplego_user` VALUES (354, '175040219111002', '$P$BxD/T8TXxcUAdha1YYjtcesNakGSqb0', 'Krishna Sekar Larasati', 'rishnalarasati@gmail.com', 'active', 'difabel', '2021-05-03 07:15:23', 73, '2020-09-18 14:01:47', '2021-05-03 07:15:23');
INSERT INTO `aplego_user` VALUES (357, '165090801111003', '$P$B5Te7c5z9bODBaQWk7fCdefMIckeNF/', 'Dina Aulia', 'dinaaulia@student.ub.ac.id', 'active', 'volunteer', '2020-11-04 09:14:31', 39, '2020-09-18 14:27:53', '2020-11-04 09:14:31');
INSERT INTO `aplego_user` VALUES (358, '175150200111052', '$P$BxZDTtNEO4emhcFiKOvaSd01Wrc/zS1', 'Wilis Biro Syamhuri', 'wilis.biro@student.ub.ac.id', 'inactive', 'volunteer', '2021-04-13 23:06:34', 68, '2020-09-18 14:35:58', '2021-04-14 04:55:29');
INSERT INTO `aplego_user` VALUES (359, '155030200111069', '$P$BLIRGHf1Brk0H9Q8pCLAUsR9IpV.1B0', 'RIMA LAILATUL FARIDA', 'rimalailatulfarida158@gmail.com', 'active', 'volunteer', '2021-05-03 09:51:17', 142, '2020-09-18 14:55:09', '2021-05-03 09:51:17');
INSERT INTO `aplego_user` VALUES (361, '185040201111156', '$P$B75xE3RSDAmTBoJK9tKyegtSlUijtG1', 'Azizah Carones', 'azizah.carones@gmail.com', 'active', 'volunteer', '2021-04-29 12:36:46', 125, '2020-09-18 15:39:47', '2021-04-29 12:36:46');
INSERT INTO `aplego_user` VALUES (362, '185120219111001', '$P$BBvVI8h8aNqxje.nn84bZ6a7ak9SQ71', 'Gerry Akbar Kisyono', 'gkisyono@gmail.com', 'active', 'difabel', '2020-11-17 10:37:15', 21, '2020-09-18 16:12:02', '2020-11-17 10:37:15');
INSERT INTO `aplego_user` VALUES (364, '155050101111044', '$P$BpAOPZVvlJfNAckKTcPBpZtMvmpHXE/', 'Fuadilah Khumairo', 'fuadilah_fk@student.ub.ac.id', 'active', 'volunteer', '2022-05-28 18:38:02', 232, '2020-09-18 17:19:23', '2022-05-28 18:38:02');
INSERT INTO `aplego_user` VALUES (365, '165030700111006', '$P$BrsqSayl6SbP8DqeqUHTL8yGvhEthA.', 'Alfa Nurlaila Auliya R.', 'alfanurlaila@student.ub.ac.id', 'active', 'volunteer', '2021-10-28 13:01:06', 210, '2020-09-18 18:32:57', '2021-10-28 13:01:06');
INSERT INTO `aplego_user` VALUES (367, '194140219111002', '$P$BbuDEODX61FupXX2YzgQA5ruPBzMTS.', 'Fathurrahman Rijal', 'fathurrjl@gmail.com', 'active', 'difabel', '2021-11-01 19:30:43', 119, '2020-09-19 00:05:19', '2021-11-01 19:30:43');
INSERT INTO `aplego_user` VALUES (368, '195110719111001', '$P$BIidsH5XZJO.ICqMX17Z/qz4ULQj7i0', 'Rizky Ramadhani', 'rizky_ramadhani@student.ub.ac.id', 'active', 'difabel', '2022-03-07 04:09:41', 39, '2020-09-19 01:09:48', '2022-03-07 04:09:41');
INSERT INTO `aplego_user` VALUES (369, '165120100111026', '$P$B8STu8SYlRwUoLLTQaqmSKfWdIHb7w1', 'Nona Aldilah Winditamara', 'nonaaldilah@student.ub.ac.id', 'active', 'volunteer', '2021-05-03 10:59:08', 205, '2020-09-19 05:55:56', '2021-05-03 10:59:08');
INSERT INTO `aplego_user` VALUES (371, '175060619111001', '$P$B2MqQr2r71WL8YBrfVWxMMG31aCjQV/', 'Bilkish Fitria Febryani', 'bfebriyani02@gmail.com', 'active', 'difabel', '2021-04-29 19:34:07', 28, '2020-09-19 06:18:13', '2021-04-29 19:34:07');
INSERT INTO `aplego_user` VALUES (372, '193140719111001', '$P$BfMI.fgo4chmNV1cjktnVBv0cbuUQ91', 'Togar Yonathan Napitupulu', 'togar9712@gmail.com', 'active', 'difabel', '2022-06-10 19:13:51', 208, '2020-09-19 06:20:53', '2022-06-10 19:13:51');
INSERT INTO `aplego_user` VALUES (373, '185120401111004', '$P$BmRHAsmuwsS6B/sjohViQMvpol2s3z0', 'Vina Idamatusilmi', 'silmivina91@gmail.com', 'active', 'volunteer', '2022-03-13 19:46:55', 105, '2020-09-19 06:53:45', '2022-03-13 19:46:55');
INSERT INTO `aplego_user` VALUES (374, '175150219111001', '$P$BnevYbHIGqc1KtgkGbYJfMHZ5o8NAC0', 'Giffaro Nandra Ridhoaldi', 'giffaro97.ridho@student.ub.ac.id', 'active', 'difabel', '2021-02-19 23:33:23', 33, '2020-09-19 07:04:03', '2021-02-19 23:33:23');
INSERT INTO `aplego_user` VALUES (375, '175060500111033', '$P$BxfzBHbaBZCIHEDhCL//v/5oNHinqU1', 'Achmad Fathi Khalidi', 'fathikhalidi1@gmail.com', 'active', 'difabel', '2021-04-23 04:55:11', 34, '2020-09-19 07:08:09', '2021-04-23 04:55:11');
INSERT INTO `aplego_user` VALUES (376, '175060500111044', '$P$BrfVfNJzY01mvxOv7U857hYnW9FCK/0', 'Rahima Dheta Yaistrina', 'rahimady@student.ub.ac.id', 'active', 'volunteer', '2020-12-16 22:09:36', 49, '2020-09-19 07:21:23', '2020-12-16 22:09:36');
INSERT INTO `aplego_user` VALUES (377, '185120300111049', '$P$BrCoW7q/IXXoJ33jfmq.d5IySHY9kG1', 'Wafa Qa', 'wafa.qa76@gmail.com', 'active', 'volunteer', '2022-03-22 03:30:03', 140, '2020-09-19 07:25:17', '2022-03-22 03:30:03');
INSERT INTO `aplego_user` VALUES (378, '155120100111005', '$P$BXTdw1zQ.sLfaZL1QB.A261J82BFC41', 'Ana Setiyani', 'anasetiyani210796@gmail.com', 'active', 'volunteer', '2021-04-24 14:54:57', 130, '2020-09-19 07:34:28', '2021-04-24 14:54:57');
INSERT INTO `aplego_user` VALUES (380, '175010119111001', '$P$BavfqFsxrjz9.EEc6cugu81YBeGHhG/', 'Bagus Bharata tjitrosoemarto', 'bharatabagus78@gmail.com', 'active', 'difabel', '2020-12-21 12:12:20', 61, '2020-09-19 08:03:20', '2020-12-21 12:12:20');
INSERT INTO `aplego_user` VALUES (384, '185090307111001', '$P$Br16zRLTnijjdgfYzTTWOmPVrYOchi.', 'Rosa Desinta', 'rosadesinta@rocketmail.com', 'active', 'volunteer', '2021-05-02 22:32:25', 83, '2020-09-19 10:31:52', '2021-05-02 22:32:25');
INSERT INTO `aplego_user` VALUES (385, '193141619111001', '$P$BY8jUzAEp2sXsZavHGNMI63gaoZEiq/', 'Arkan Nur Faisal', 'arkanfaisal156@gmail.com', 'active', 'difabel', '2021-02-16 02:07:17', 83, '2020-09-19 11:14:43', '2021-02-16 02:07:17');
INSERT INTO `aplego_user` VALUES (386, '185120600111059', '$P$BhCcX6f4UsGqrVmgVYXGCfj70qDNdw/', 'MUHAMMAD ZACKY RANGGA SAPUTRA', 'zackyrangga07@gmail.com', 'active', 'volunteer', '2020-12-27 22:53:34', 102, '2020-09-19 11:26:31', '2020-12-27 22:53:34');
INSERT INTO `aplego_user` VALUES (387, '175120219111001', '$P$BcKbS0tS83n3rotZAySUXCFL6WFj7F1', 'Hervita el fatich', 'hervitaelfa08@gmail.com', 'active', 'difabel', '2020-12-17 10:06:16', 22, '2020-09-19 11:41:04', '2020-12-17 10:06:16');
INSERT INTO `aplego_user` VALUES (389, '195120500111060', '$P$BF1D3g/OUXPX/T69ATnjM6ub2.GEKc/', 'Raihania Rahma Hilmita', 'nia.hilmita@gmail.com', 'active', 'volunteer', '2021-02-16 13:29:48', 64, '2020-09-19 12:14:58', '2021-02-16 13:29:48');
INSERT INTO `aplego_user` VALUES (390, '185090300111018', '$P$BAVpNWcqucw1sv2zuYUEzfukCE8vJr1', 'Islamuddin Alimurrijal', 'i_alimurrijal@student.ub.ac.id', 'active', 'volunteer', '2021-10-28 09:47:32', 89, '2020-09-19 12:35:55', '2021-10-28 09:47:32');
INSERT INTO `aplego_user` VALUES (391, '193140814111058', '$P$BmXu34Qy4xuZG9auiQ8UDSsoBUJNmc0', 'Aghna Dewi P. Ivanto', 'aghnadewi18@gmail.com', 'active', 'volunteer', '2020-09-19 14:33:14', 1, '2020-09-19 14:33:14', '2020-09-19 14:33:14');
INSERT INTO `aplego_user` VALUES (392, '185010107111027', '$P$BOkc/ssN3EF3hfWuv9CECGQxMY1j/d/', 'Lintang Rachmi Andrianti', 'lintangrachmi21@gmail.com', 'active', 'volunteer', '2022-05-27 21:44:39', 134, '2020-09-19 14:58:05', '2022-05-27 21:44:39');
INSERT INTO `aplego_user` VALUES (395, '165090501111028', '$P$BdkfiK.8sz2AjZ93c7FJd2KEVs4QUH1', 'Nastiti Mufida', 'nastitim63@gmail.com', 'active', 'volunteer', '2021-05-03 08:50:57', 184, '2020-09-19 15:43:45', '2021-05-03 08:50:57');
INSERT INTO `aplego_user` VALUES (396, '175110707111012', '$P$BAAdzjP5S6tncd2dftVDneAqTbq.5d.', 'Agung Pamuji', 'agung.ykab@gmail.com', 'active', 'difabel', '2020-10-21 17:06:03', 11, '2020-09-19 15:49:23', '2020-10-21 17:06:03');
INSERT INTO `aplego_user` VALUES (397, '175120100111023', '$P$Blrd9VEZwpER24FPWWmAMmBoaJgnZu0', 'Livia Yustantinah', 'liviay@student.ub.ac.id', 'active', 'volunteer', '2022-06-10 10:29:57', 283, '2020-09-19 16:06:48', '2022-06-10 10:29:57');
INSERT INTO `aplego_user` VALUES (398, '195120220111001', '$P$B7DQwD3bweOzLbIKQQ375PPRUVXzCA.', 'Sulis Tiani Ningsih Bte Berry', 'sulistianiningsih01@gmail.com', 'active', 'volunteer', '2020-12-23 23:34:22', 45, '2020-09-19 16:38:50', '2020-12-23 23:34:22');
INSERT INTO `aplego_user` VALUES (399, '175120107111012', '$P$BU2MJCbvoNEYqBudax3mMAr8UaBuOa1', 'Afifah Nurul Isya', 'afifahnurulisya@student.ub.ac.id', 'active', 'volunteer', '2022-06-10 19:01:33', 237, '2020-09-19 16:44:07', '2022-06-10 19:01:33');
INSERT INTO `aplego_user` VALUES (400, '175120401111022', '$P$BvyiRhjGlLZg8IGNDm8AJjdJ6/GmdH1', 'Andi Zulfajrin Syam', 'fajrin.syam@student.ub.ac.id', 'active', 'difabel', '2020-09-20 19:07:01', 2, '2020-09-19 16:53:46', '2020-09-19 16:53:46');
INSERT INTO `aplego_user` VALUES (401, '185110507111002', '$P$Bikd6PmQN.Ayq05UnQ8NiQ3HbDQ8S10', 'Pudya Mastuti Hayuningtyas', 'pudyahayuningtyas@gmail.com', 'active', 'volunteer', '2022-02-07 19:13:18', 155, '2020-09-19 16:54:25', '2022-02-07 19:13:18');
INSERT INTO `aplego_user` VALUES (403, '175050107111123 ', '$P$BZWgU3kyHtQyJ91x5Zc0E/gKm/zsUj0', 'Salsabila Firdausi', 'salsabilafirdausi71@gmail.com', 'active', 'volunteer', '2021-03-07 14:54:20', 113, '2020-09-19 17:20:52', '2021-03-07 14:54:20');
INSERT INTO `aplego_user` VALUES (404, '195120319111001', '$P$BXYP3UQSui6sThriRjOu2Yuml.BH4J0', 'Afif Husain Rasyidi', 'afifhusain2@gmail.com', 'active', 'difabel', '2022-05-31 08:56:48', 46, '2020-09-19 17:26:31', '2022-05-31 08:56:48');
INSERT INTO `aplego_user` VALUES (405, '185090307111011', '$P$B5pfYfDMQrrNw6lr12nQ2FqMoHSJFC/', 'Fajar Hastuti Ernawati', 'ernafh@student.ub.ac.id', 'active', 'volunteer', '2021-05-02 22:48:12', 113, '2020-09-19 17:35:03', '2021-05-02 22:48:12');
INSERT INTO `aplego_user` VALUES (406, '175120100111030', '$P$B/VEp3kiTRhiFmLAzJ878ImTlNkPc30', 'Soraya Lathifah Nur Azizah', 'soraya.lathifah@gmail.com', 'active', 'volunteer', '2021-04-28 15:18:40', 168, '2020-09-19 18:03:45', '2021-04-28 15:18:40');
INSERT INTO `aplego_user` VALUES (407, '193141619111002', '$P$BwXCPp2135DkSV3C1MyaJaZu57VC0f0', 'Reza wibawa putra', 'reza.wibowoap3@gmail.com', 'active', 'difabel', '2020-11-25 09:25:13', 8, '2020-09-19 18:13:14', '2020-11-25 09:25:13');
INSERT INTO `aplego_user` VALUES (408, '175030201111017', '$P$BDn1V3KF9s2cZtPvs41GfcwoEbffWv.', 'Danial Noer Zakiyuddin', 'danialzakiyuddin@gmail.com', 'active', 'volunteer', '2022-05-28 18:33:00', 175, '2020-09-19 18:33:07', '2022-05-28 18:33:00');
INSERT INTO `aplego_user` VALUES (411, '205120319111001', '$P$BAmE8MIEoCUa/Zsj8X9wSYKcPX7L4x/', 'Riki adi putra', 'rikiadiputra8888@gmail.com', 'active', 'difabel', '2022-02-26 11:25:56', 59, '2020-09-19 19:18:30', '2022-02-26 11:25:56');
INSERT INTO `aplego_user` VALUES (413, '205020919111001', '$P$BdprNurIKjNiftYR7WXNzXX13ZmyUT.', 'Slamet', 'navilaps@student.ub.ac.id', 'active', 'difabel', '2020-09-19 19:33:05', 2, '2020-09-19 19:29:07', '2020-09-19 19:33:05');
INSERT INTO `aplego_user` VALUES (414, '175020301111054', '$P$B.m7M26n4ALBqoz6a0m6RJlpyOyv241', 'Ervina Rahadia Rizki', 'ervinarizki47@gmail.com', 'active', 'volunteer', '2020-12-03 10:03:33', 16, '2020-09-19 19:34:13', '2020-12-03 10:03:33');
INSERT INTO `aplego_user` VALUES (415, '203140719111001', '$P$BsMBaO2b6Kr9MzVbumNFqBAHnyRz.W.', 'Ghanny Fathullah Ashari', 'ghanipolinema@gmail.com', 'active', 'difabel', '2022-02-21 19:53:02', 176, '2020-09-19 19:47:09', '2022-02-21 19:53:02');
INSERT INTO `aplego_user` VALUES (417, '205120400111019', '$P$B2CBaBnbzsQLjvTHpo1DQKvJWa91Ie0', 'Muhammad Hirza Barizi', 'hirza.barizi@student.ub.ac.id', 'active', 'difabel', '2022-02-08 06:59:45', 20, '2020-09-19 20:25:34', '2022-02-08 06:59:45');
INSERT INTO `aplego_user` VALUES (418, '185040201111176', '$P$BnVkKnpS.bTQEFHVZ1T6.8C6Ssj9wD0', 'Nabila Safira', 'nblsfr@student.ub.ac.id', 'active', 'volunteer', '2020-12-14 10:18:50', 61, '2020-09-19 20:49:27', '2020-12-14 10:18:50');
INSERT INTO `aplego_user` VALUES (419, '203140919111001', '$P$BXpXJA6vulJbXk5bz/GfM1RMlx9SFN/', 'Endjie Apta Martiazharine', 'attasmkn2malang@gmail.com', 'active', 'difabel', '2022-03-29 10:30:41', 153, '2020-09-19 21:16:57', '2022-03-29 10:30:41');
INSERT INTO `aplego_user` VALUES (421, '205100319111001', '$P$B/lIqvAeKHj1AzgaYDbjojMbv2lKWx.', 'INDAH SUKMA KARTIKA SARI', 'indahsukma214@gmail.com', 'active', 'difabel', '2022-04-13 23:50:19', 14, '2020-09-20 00:55:31', '2022-04-13 23:50:19');
INSERT INTO `aplego_user` VALUES (423, '203140714111031', '$P$BH78HFLYKnkyexap3lWkyd5TIl7pZN.', 'Hafiza Kartikasari', 'hafizaka@student.ub.ac.id', 'active', 'difabel', '2022-02-15 06:53:12', 91, '2020-09-20 10:35:37', '2022-02-15 06:53:12');
INSERT INTO `aplego_user` VALUES (425, '195070207111001', '$P$B53OmcoMvItOVPfSYaLjAExNb45Km/0', 'Shafa Ainan', 'ainanshafa@gmail.com', 'active', 'volunteer', '2022-02-06 13:41:27', 17, '2020-09-20 11:45:07', '2022-02-06 13:41:27');
INSERT INTO `aplego_user` VALUES (426, '203140719111002', '$P$BNnFa7xUfuAYzeQUfQEmqt/MI5W/.b1', 'Hafiz Ilmi', 'hafizilmi@student.ub.ac.id', 'active', 'difabel', '2022-02-23 14:43:59', 110, '2020-09-20 13:20:48', '2022-02-23 14:43:59');
INSERT INTO `aplego_user` VALUES (427, '185090301111024', '$P$ByLN.eNBP49bFSlYpURivAA/CCwVxW.', 'Jamilatun Faidah', 'jamilatunfaidah@student.ub.ac.id', 'active', 'volunteer', '2022-03-06 19:28:13', 77, '2020-09-20 13:40:53', '2022-03-06 19:28:13');
INSERT INTO `aplego_user` VALUES (428, '175120201111004', '$P$BARKbY8hgw0BMFGHKOUrF5kcW4P59u1', 'Aisyah Sekar Ayu Maharani', 'aisyah23sekar@gmail.com', 'active', 'volunteer', '2020-12-22 08:11:02', 32, '2020-09-20 13:43:13', '2020-12-22 08:11:02');
INSERT INTO `aplego_user` VALUES (429, '195150219111003', '$P$BThteJso3zdNJ.67PBnWQ5jwoGFD71/', 'mahqomam mahmuda', 'mahqomamm3@gmail.com', 'active', 'difabel', '2021-02-18 14:38:11', 2, '2020-09-20 13:46:10', '2020-09-20 13:46:10');
INSERT INTO `aplego_user` VALUES (430, '185100600111006', '$P$BlhBP1clcxkfwVh3Nw0pYGA1srGIHU.', 'Surya Huda', 'suryahuda09@student.ub.ac.id', 'active', 'volunteer', '2021-05-03 04:08:38', 209, '2020-09-20 18:14:06', '2021-05-03 04:08:38');
INSERT INTO `aplego_user` VALUES (431, '175120301111028', '$P$BMLWCV/PhEQ3ltLpk9ul7DF/vKAWx/0', 'Daniel vici christofel siregar', 'rotororo51@student.ub.ac.id', 'active', 'volunteer', '2020-12-22 21:57:45', 23, '2020-09-20 20:17:00', '2020-12-22 21:57:45');
INSERT INTO `aplego_user` VALUES (432, '175040107111034', '$P$BiF48O7Sojq5odO49MeYcuJHtZoMhu/', 'Nadia Atika N', 'nadia.atika78@gmail.com', 'active', 'volunteer', '2022-02-07 20:17:11', 216, '2020-09-21 10:33:30', '2022-02-07 20:17:11');
INSERT INTO `aplego_user` VALUES (433, '206080101111001', '$P$BsCmxGnKF8UZqoxADd1XXGx/F4BJ1..', 'Shofiatul Kholishoh', 'shofia.kh10@gmail.com', 'active', 'volunteer', '2020-12-12 16:06:25', 16, '2020-09-21 17:01:13', '2020-12-12 16:06:25');
INSERT INTO `aplego_user` VALUES (434, '185090501111013', '$P$BWVaoYf.g7h3rK.nSigjkJi/bLdgX80', 'Ifa Choirun Nisa\'', 'ifachoirunnisa04@gmail.com', 'active', 'volunteer', '2021-04-06 09:33:59', 74, '2020-09-21 17:16:49', '2021-04-06 09:33:59');
INSERT INTO `aplego_user` VALUES (437, '205030919111001', '$P$BLArDT3oDHuR7w85DlCvcboTSi5XZ30', 'Jauharah haniyah', 'haniyah13@student.ub.ac.id', 'active', 'difabel', '2022-03-06 18:59:54', 153, '2020-09-24 05:36:14', '2022-03-06 18:59:54');
INSERT INTO `aplego_user` VALUES (438, '175110919111001', '$P$B3Xp/2/VOa2ejW8gnnfN3mnvHAgTho.', 'Ahmad Samsul Sholihin', 'samsulsholihin@gmail.com', 'active', 'difabel', '2020-12-02 12:47:00', 7, '2020-09-25 10:02:46', '2020-12-02 12:47:00');
INSERT INTO `aplego_user` VALUES (440, '205020319111001', '$P$BqOqvpFWJQcJV7BhMvhsJg6iQQj.lH/', 'Sania Khoridatur Rohmi', 'saniarohmi7890@student.ub.ac.id', 'active', 'difabel', '2022-02-15 08:55:06', 159, '2020-09-28 10:29:24', '2022-02-15 08:55:06');
INSERT INTO `aplego_user` VALUES (441, '203140819111001', '$P$BszllfAai2XJiZxnTp76CKRIFCPuyh0', 'Rizkya Adin Ardiansyah', 'rizkyaadin27@gmail.com', 'active', 'difabel', '2022-03-01 10:42:56', 143, '2020-09-28 11:28:46', '2022-03-01 10:42:56');
INSERT INTO `aplego_user` VALUES (443, '205110919111001', '$P$BQ/DbRcEhNdWM4fsxMQgaR2Wmfv0I9.', 'Zulfiana Rofi\'atul Asiyah', 'opiasiyah@gmail.com', 'active', 'difabel', '2022-03-04 07:34:20', 75, '2020-09-29 12:29:38', '2022-03-04 07:34:20');
INSERT INTO `aplego_user` VALUES (444, '175150201111081 ', '$P$BMRrIunrLARnN.AxjCbU8b.CDVp8mL0', 'Na\'imatul Afifah', 'afifahnaimatul@student.ub.ac.id', 'active', 'volunteer', '2020-12-28 12:59:32', 122, '2020-09-29 14:51:50', '2020-12-28 12:59:32');
INSERT INTO `aplego_user` VALUES (446, '185090307111010', '$P$BYfQSFDCEUWGQJR0e.J39SsY.FP7Lu.', 'Imro\'atul Hakimah', 'imaaimroatul@gmail.com', 'active', 'volunteer', '2021-05-02 21:23:07', 140, '2020-10-04 11:33:33', '2021-05-02 21:23:07');
INSERT INTO `aplego_user` VALUES (447, '155090507111019', '$P$BP6NgRos09XjAKCZtn0ACWkTJghzvg1', 'Akmarina Khairunnisa', 'akmarinak@gmail.com', 'active', 'volunteer', '2020-12-13 20:46:44', 2, '2020-10-19 12:00:41', '2020-12-13 20:46:44');
INSERT INTO `aplego_user` VALUES (448, '185040201111085', '$P$BAQm45kLMY7ho9LSjQGa4aAbIbcnBk.', 'Mei Irawan', 'meiirawan56@gmail.com', 'active', 'volunteer', '2020-12-17 20:33:35', 39, '2020-10-19 22:18:58', '2020-12-17 20:33:35');
INSERT INTO `aplego_user` VALUES (449, '175110500111003', '$P$BkqQIV5cBb0SyogqvXC/L3cs/iHaa20', 'shinta octaviana banuarti', 'shintabanuarti@gmail.com', 'active', 'volunteer', '2022-02-17 18:27:10', 102, '2020-11-04 14:34:46', '2022-02-17 18:27:10');
INSERT INTO `aplego_user` VALUES (450, '197905242003122002', '$P$BxlxBjb1ml0XZaJYXob4ElZTos7DK70', 'Zubaidah', 'zubaidah@ub.ac.id', 'active', 'volunteer', '2020-11-07 13:21:10', 1, '2020-11-07 13:21:10', '2020-11-07 13:21:10');
INSERT INTO `aplego_user` VALUES (451, '205120619111001', '$P$BeuEoA.77uuI3efRJYpo8.IdqDaOa/.', 'Muhammad Tegar Widiatmoko', 'muh.tgrw@gmail.com', 'active', 'difabel', '2020-11-07 13:24:08', 2, '2020-11-07 13:23:19', '2020-11-07 13:23:19');
INSERT INTO `aplego_user` VALUES (452, '195060719111001', '$P$BOPxbzNQZgupNRcWYnSiCB0K5n.SmV.', 'Pramesti Earli Asyanti', 'astrierliasya2015@gmail.com', 'active', 'difabel', '2022-06-10 10:19:03', 197, '2020-11-07 20:48:16', '2022-06-10 10:19:03');
INSERT INTO `aplego_user` VALUES (453, '195010101111067', '$P$B/shorEoA3zFWMvL9vV2IY5I7UlXPt/', 'Muhammad', 'broagiss2@gmail.com', 'active', 'volunteer', '2022-02-06 16:47:16', 136, '2020-11-15 20:22:40', '2021-05-03 07:09:24');
INSERT INTO `aplego_user` VALUES (454, '175050100111132', '$P$BpYr8MC3p1GFpLbCx4E325h6MxorTK0', 'Eunike Yanti Jesika Lumbantobing', 'jesikatobing59@gmail.com', 'active', 'volunteer', '2021-02-17 17:33:38', 46, '2020-11-17 23:17:04', '2021-02-17 17:33:38');
INSERT INTO `aplego_user` VALUES (455, '175100901111024', '$P$BiQMPK9Me422/qdf3kxS4ghszaYFdk/', 'Yuni Lestari', 'yunilestari100698@gmail.com', 'active', 'volunteer', '2021-05-02 12:23:59', 12, '2020-11-18 16:51:57', '2021-05-02 12:23:59');
INSERT INTO `aplego_user` VALUES (456, '185090701111002', '$P$BKtGSTL7L.iZyXZcwebx5cNYm.ATQt/', 'Intan', 'intansyarifah828@gmail.com', 'active', 'volunteer', '2021-04-30 06:08:01', 72, '2020-11-24 12:21:25', '2021-04-30 06:08:01');
INSERT INTO `aplego_user` VALUES (457, '2010067407191001', '$P$B6ckdaNa4P0T3FOkBUk.FfHbzjC2tx.', 'Ismiarta Aknuranda', 'i.aknuranda@ub.ac.id', 'active', 'volunteer', '2021-04-16 16:58:21', 3, '2020-11-25 13:57:19', '2021-04-16 16:58:21');
INSERT INTO `aplego_user` VALUES (458, '2010067407191002', '$P$BrvS/RL6wE6fSQ95L91n1kUrrbYbey0', 'Abdullah Sampel', 'i.aknuranda@ub.ac.id', 'active', 'difabel', '2021-04-16 16:59:01', 2, '2020-11-25 13:59:43', '2021-04-16 16:59:01');
INSERT INTO `aplego_user` VALUES (461, '185090700111028', '$P$BsfRicF8ba4uCggwjVqbpByE8uK9W5/', 'Alifan Zen Nuranto', 'alifanzennuranto@gmail.com', 'active', 'volunteer', '2020-12-20 21:40:08', 22, '2020-12-01 09:17:52', '2020-12-20 21:40:08');
INSERT INTO `aplego_user` VALUES (462, 'Ismiarta', '$P$BXLZiATj2/3PGUXH5JmZT6bgKBACgB1', 'Ismiarta', 'contoh@gmail.com', 'active', 'admin', '2021-04-16 17:13:59', 6, '2020-12-02 13:56:59', '2021-04-16 17:13:59');
INSERT INTO `aplego_user` VALUES (463, 'aditya', '$P$By1oL58FWo.lgLWMOkj7b71rAs25hj.', 'aditya', 'contoh@gmail.com', 'active', 'admin', '2022-02-15 17:08:50', 59, '2020-12-02 13:58:41', '2022-02-15 17:08:50');
INSERT INTO `aplego_user` VALUES (464, '195150200111051', '$P$BV2eJysCqnAkVf6IT1GxQ9P3SIg/r51', 'shabira widyadhari', 'cantik5ekali@student.ub.ac.id', 'active', 'volunteer', '2021-05-03 11:01:11', 56, '2020-12-13 09:20:12', '2021-05-03 11:01:11');
INSERT INTO `aplego_user` VALUES (465, '175150219111003', '$P$BN.xgV3zkFLxpAl8pllvH/0Pudtf58.', 'Tuahta Ramadhani', 'tuahtaramadhani@gmail.com', 'active', 'difabel', '2020-12-18 06:05:35', 7, '2020-12-14 11:01:56', '2020-12-18 06:05:35');
INSERT INTO `aplego_user` VALUES (466, '205150719111001', '$P$Boz8Z/PN03pOVCTdtk8aNdgjshDcY/.', 'Aldo Agustio', 'aldo.agustio17@student.ub.ac.id', 'active', 'difabel', '2021-05-03 10:06:59', 73, '2020-12-19 08:42:23', '2021-05-03 10:06:59');
INSERT INTO `aplego_user` VALUES (467, '1451502009999', '$P$Bh7Q2C6DbSbWkBe/DkvO1rX8Fa1.nn0', 'Abdul Kadir', 'ahhay@gmail.com', 'active', 'volunteer', '2020-12-30 11:54:16', 2, '2020-12-30 11:51:35', '2020-12-30 11:51:35');
INSERT INTO `aplego_user` VALUES (468, '174140314111034', '$P$By0zhOHdQP.l6uyvnMMA98r9/.pA6H.', 'Noer Afina Maulidia', 'maulidiaafina.am@gmail.com', 'inactive', 'volunteer', '2021-03-04 19:18:26', 21, '2021-01-16 14:46:49', '2021-03-05 09:04:46');
INSERT INTO `aplego_user` VALUES (469, '123456789', '$P$B12k6XsOnMzuVgvMrkLQNx3kdLybNR.', 'Contoh Mahasiswa Difabel', 'khairunnastain@gmail.com', 'active', 'difabel', '2021-02-03 10:11:41', 2, '2021-02-03 10:08:18', '2021-02-03 10:10:03');
INSERT INTO `aplego_user` VALUES (470, 'Riza', '$P$BIhsM6sbvcoJeQQw0saEwakhvV39xP/', 'Riza Aditya', 'riza.aditya@ub.ac.id', 'active', 'admin', '2022-04-18 08:43:44', 122, '2021-02-05 10:41:26', '2022-04-18 08:43:44');
INSERT INTO `aplego_user` VALUES (471, '165120307111053', '$P$Bnrm8g1/wOBnUEIFfsuXxX1caPNu/Y/', 'Ni Ketut Desi Ariani', 'desi.ariani97@gmail.com', 'active', 'volunteer', '2021-04-26 19:45:32', 46, '2021-02-10 09:43:30', '2021-04-26 19:45:32');
INSERT INTO `aplego_user` VALUES (472, '165100100111050', '$P$BCGoVBgdzBRlX8ZfDM/R.0tBesHXFc1', 'Syarifatul Izza', 'azzi.lutafirays@gmail.com', 'active', 'volunteer', '2022-02-07 09:09:35', 35, '2021-02-10 10:28:01', '2022-02-07 09:09:35');
INSERT INTO `aplego_user` VALUES (473, '206000201111003', '$P$Bt4ZYFzhqWLMfYEDLAKwxhCvgt3jmp1', 'Ida Bagus Surya Manuaba', 'surya_manuaba@student.ub.ac.id', 'active', 'difabel', '2021-05-03 09:14:19', 48, '2021-02-11 13:34:51', '2021-05-03 09:14:19');
INSERT INTO `aplego_user` VALUES (474, '2050801111059', '$P$BhVusNrvCWRkB9LkbPIoTCqGZyrZVS.', 'Setya', 'setya@gmail.com', 'active', 'difabel', '2021-02-11 21:26:41', 1, '2021-02-11 21:26:41', '2021-02-11 21:26:41');
INSERT INTO `aplego_user` VALUES (477, '195040107111034', '$P$ByGiIOnPm/wGmgWWs7oWOfCD7opB8M1', 'Irdham Reihansyah F', 'irdhamreihansyah@gmail.com', 'active', 'difabel', '2021-05-03 04:33:26', 53, '2021-02-14 20:12:10', '2021-05-03 04:33:26');
INSERT INTO `aplego_user` VALUES (478, '195120219111001', '$P$B6kvI.nOy0iCqxh3zpbDfTShmiteQR1', 'Dewa Bagaskara', 'dewa_2001@student.ub.ac.id', 'active', 'difabel', '2022-02-23 23:16:30', 81, '2021-02-15 10:50:12', '2022-02-23 23:16:30');
INSERT INTO `aplego_user` VALUES (479, '193140714111079', '$P$BwhdpL3WtnHUeBNRHwCM8tw.AoBP2V.', 'Julian', 'julianchris93@gmail.com', 'active', 'difabel', '2021-03-29 12:59:08', 12, '2021-02-15 15:24:24', '2021-03-29 12:59:08');
INSERT INTO `aplego_user` VALUES (480, '175030819111001', '$P$BRDxuoRdBkWBbKVToohsPA2KVfO3az0', 'M. Irfan Ramadhan', 'mirfanramadhan9@student.ub.ac.id', 'active', 'difabel', '2021-02-16 11:09:54', 3, '2021-02-16 11:07:21', '2021-02-16 11:09:54');
INSERT INTO `aplego_user` VALUES (481, '185061100111003', '$P$BYzQOCtSyTHBbd3bN0SpBX.jQlXh3i.', 'Geofani Wibiansa P', 'gwibiansa@gmail.com', 'active', 'difabel', '2021-04-02 09:39:30', 8, '2021-02-16 13:27:22', '2021-04-02 09:39:30');
INSERT INTO `aplego_user` VALUES (482, '185010119111001', '$P$BKj7R/2DtbPS4nagPM/dItQHDCci7f.', 'Alfa Rizky Dekan Vantana Zulkarnain', 'alfarizky3199@gmail.com', 'active', 'difabel', '2021-04-14 10:38:45', 16, '2021-02-18 11:26:53', '2021-04-14 10:38:45');
INSERT INTO `aplego_user` VALUES (484, '205120301111064', '$P$BwE718zal9CsEx9HZy7xKnjeBhc5en1', 'Widyanti', 'widyanti0494@gmail.com', 'active', 'volunteer', '2022-03-27 18:56:04', 20, '2021-03-27 10:22:37', '2022-03-27 18:56:04');
INSERT INTO `aplego_user` VALUES (485, '195150601111003', '$P$BpkUb8HaIozfqqIbfBvUXNjHKEgWSp0', 'Elsa Auliya Rahma', 'elsaauliya@student.ub.ac.id', 'active', 'volunteer', '2022-02-13 18:20:13', 22, '2021-03-29 15:12:17', '2022-02-13 18:20:13');
INSERT INTO `aplego_user` VALUES (493, '175150400111017', '$P$BWitD3nA2eQR.gDOLnGtcHT3zcI3L1.', 'Aditya madif (Test)', 'aditkw43@gmail.com', 'active', 'difabel', '2021-04-22 18:27:31', 6, '2021-04-13 22:39:53', '2021-04-22 12:21:48');
INSERT INTO `aplego_user` VALUES (495, '195120301111001', '$P$BFgWXXz00lg3ZwJUFrAaBpxkt0aLmV1', 'Krismaya Nikita Oktavia', 'krismayanikita@student.ub.ac.id', 'active', 'volunteer', '2021-05-03 08:48:58', 8, '2021-04-30 12:44:24', '2021-05-03 08:48:58');
INSERT INTO `aplego_user` VALUES (496, '205050107111034', '$P$B5.MUcvJTgfvxWVlA7WglOg4.ptxgW1', 'Alfina Rodiah', 'alfinaro05@student.ub.ac.id', 'active', 'volunteer', '2022-02-20 18:00:11', 23, '2021-04-30 12:44:55', '2022-02-20 18:00:11');
INSERT INTO `aplego_user` VALUES (497, '195030207111132', '$P$BUixXznwBfx3.Z1VVsmeIFQvhZECxE1', 'Aditya Willian Yudhistira', 'adityawilian1@student.ub.ac.id', 'active', 'volunteer', '2021-05-03 10:18:23', 11, '2021-04-30 12:45:14', '2021-05-03 10:18:23');
INSERT INTO `aplego_user` VALUES (498, '185120400111034', '$P$B4Mtn51dz4OmRNgDWu0Zt1Hj1hCvnk/', 'Dian Indra Zahra Mardlatilla', 'dianindrazahra@gmail.com', 'active', 'volunteer', '2021-04-30 12:46:22', 1, '2021-04-30 12:46:22', '2021-04-30 12:46:22');
INSERT INTO `aplego_user` VALUES (499, '185110901111009', '$P$BRbn7uT5cHdbS3IUfq/3/EQnQFJr7q1', 'Da\'iul Umam Karim', 'umamkar@student.ub.ac.id', 'active', 'volunteer', '2021-05-03 08:47:59', 5, '2021-04-30 18:12:54', '2021-05-03 08:06:10');
INSERT INTO `aplego_user` VALUES (500, '205110100111010', '$P$Bab4JXQVBJBt75HAqWqUq0orwIg0P2.', 'Aindra Aprilia', 'aindraaprilia314@gmail.com', 'active', 'volunteer', '2021-05-03 09:40:23', 13, '2021-04-30 20:19:20', '2021-05-03 09:40:23');
INSERT INTO `aplego_user` VALUES (501, '195120300111041', '$P$BKPzBqjN41Xc3G64wFS81ww7.EX4sc1', 'Nabila Yunita Wulandari', 'nabilawuu@gmail.com', 'active', 'volunteer', '2021-10-30 11:05:37', 5, '2021-04-30 20:28:19', '2021-10-30 11:05:37');
INSERT INTO `aplego_user` VALUES (502, '205110100111015', '$P$BTnarUFicpcr7sqvg2Qt/v9NcI.Iw/0', 'Sahara Ramanda', 'sahara.ramandha@gmail.com', 'active', 'volunteer', '2022-02-09 07:16:09', 20, '2021-04-30 20:59:01', '2022-02-09 07:16:09');
INSERT INTO `aplego_user` VALUES (503, '195020200111051', '$P$BJg8tEs5vwfNsfKNt2syF3qov/iSHm/', 'Muchammad Novalino Al Faraby', 'farabyal33@student.ub.ac.id', 'active', 'volunteer', '2021-05-03 08:56:24', 3, '2021-04-30 21:29:45', '2021-05-03 08:56:24');
INSERT INTO `aplego_user` VALUES (504, '195020300111057', '$P$BBOXAHQbwhcqjH4cxLXaIJ5qyFsf3a/', 'Maria Inggried Soinia Lase', 'inggriedlasee@student.ub.ac.id', 'active', 'volunteer', '2021-05-03 09:02:13', 2, '2021-04-30 22:02:33', '2021-05-03 09:02:13');
INSERT INTO `aplego_user` VALUES (505, '175010107111183', '$P$BEwdJwwK8fVZ6ayZD10sPpmfcPVE1X.', 'Lia Rizka Pratiwi', 'liarizkapratiwi@gmail.com', 'active', 'volunteer', '2021-05-03 08:54:07', 7, '2021-04-30 23:01:08', '2021-05-03 08:54:07');
INSERT INTO `aplego_user` VALUES (506, '195060100111054', '$P$ByNNwoKBguILm5gwCHKbr4GOtJVl6./', 'Ardia Cahya Noviantari', 'ardiacahya.n@gmail.com', 'active', 'volunteer', '2022-03-21 19:37:52', 24, '2021-05-01 00:08:46', '2022-03-21 19:37:52');
INSERT INTO `aplego_user` VALUES (507, '185090301111023', '$P$BJ9R7CkYG2lUm7a0mN5SJKgbjNMnFk0', 'Rima Suryani', 'rimasuryani@student.ub.ac.id', 'active', 'volunteer', '2021-05-03 04:24:37', 6, '2021-05-01 13:35:31', '2021-05-03 04:24:37');
INSERT INTO `aplego_user` VALUES (508, '205100507111017', '$P$BTgMY/.WjxFYkodUzqXm0WQe9sidFu/', 'Deyinta Apenabel Surya', 'deyinta.surya@student.ub.ac.id', 'active', 'volunteer', '2022-04-04 22:22:04', 18, '2021-05-01 14:20:10', '2022-04-04 22:22:04');
INSERT INTO `aplego_user` VALUES (509, '195100500111012', '$P$BiNJPD1outPfI3MMJX2V1VKx8x6h1A.', 'Nurul Wafa\'', 'nurulwafa@student.ub.ac.id', 'active', 'volunteer', '2022-06-01 11:09:07', 11, '2021-05-01 15:32:43', '2022-06-01 11:09:07');
INSERT INTO `aplego_user` VALUES (510, '205110100111008', '$P$B17e5AFyegPJn6fAiAvKoivf/O9nAj1', 'Hanif Zulfa Fauziyah', 'hanifzulfafauziyah28@gmail.com', 'active', 'volunteer', '2021-11-01 06:44:21', 10, '2021-05-01 18:38:17', '2021-11-01 06:44:21');
INSERT INTO `aplego_user` VALUES (511, '185040200111219', '$P$B/Au/QljUjHr7JuKwRtBaAmgNmKW6L.', 'Rafika Andini Alvin Putri', 'rafika@student.ub.ac.id', 'active', 'volunteer', '2021-05-03 09:10:34', 4, '2021-05-01 20:18:01', '2021-05-03 09:10:34');
INSERT INTO `aplego_user` VALUES (512, '205110300111024', '$P$BbGf5FoZ8xrcnTftf0OVepbopwQEWG.', 'Theola Flowrencia', 'theolaflwrn@student.ub.ac.id', 'active', 'volunteer', '2022-05-28 21:53:21', 10, '2021-05-01 23:37:58', '2022-05-28 21:53:21');
INSERT INTO `aplego_user` VALUES (513, '195020300111066', '$P$BMuRpQTfLI9/7vWpvot9SFUUkEUz.h0', 'Umi Ariskaningtias', 'umiariskaningtias15@gmail.com', 'active', 'volunteer', '2022-05-28 17:49:01', 25, '2021-05-02 10:41:21', '2022-05-28 17:49:01');
INSERT INTO `aplego_user` VALUES (514, '205061100111024', '$P$BFRkaSUpwSNEJfOKVSfDWBj5f9r7Rz0', 'Kinanti Amartia Permadi', 'amartiakinanti@gmail.com', 'active', 'volunteer', '2021-05-03 09:04:57', 2, '2021-05-02 10:44:37', '2021-05-03 09:04:57');
INSERT INTO `aplego_user` VALUES (515, '195060100111027', '$P$BxCGcZ/QACTLV5CpPd3aMxzWXhRqWH.', 'ANNISA TRI KURNIA AGUNG', 'annisatrika12@gmail.com', 'active', 'volunteer', '2021-05-03 09:24:13', 6, '2021-05-02 10:51:00', '2021-05-03 09:24:13');
INSERT INTO `aplego_user` VALUES (516, '205120301111031', '$P$B8f4.clAbOq/e0qfs9XGs9chHWZfsR.', 'Andini Laily Putri', 'andini_laily@student.ub.ac.id', 'active', 'volunteer', '2022-05-30 20:42:44', 13, '2021-05-02 10:57:24', '2022-05-30 20:42:44');
INSERT INTO `aplego_user` VALUES (517, '185090301111033', '$P$BFqYOo0BQ0VNCWu0P1R/1XMNfu0y9Q0', 'Lolita Aurensia Franelsa', 'Lolita_af@student.ub.ac.id', 'active', 'volunteer', '2022-02-09 13:29:46', 10, '2021-05-02 12:29:17', '2022-02-09 13:29:46');
INSERT INTO `aplego_user` VALUES (518, '195010101111154', '$P$B5dSuAIz6/fldjCosjkkePJk7Kb4zi1', 'Nyemas Putri Gemilang', 'nyemasputri0201@gmail.com', 'active', 'volunteer', '2021-05-03 08:58:39', 1, '2021-05-03 08:58:39', '2021-05-03 08:58:39');
INSERT INTO `aplego_user` VALUES (519, '165150201111037', '$P$BkbAAou3K7GSSIR0AycrPwoy3CRkuT1', 'Harun', 'testeeer@mail.com', 'active', 'volunteer', '2021-10-07 20:14:50', 50, '2021-09-06 19:10:52', '2021-09-24 20:05:18');
INSERT INTO `aplego_user` VALUES (520, '165150201111038', '$P$BmRXljyTk46cyWijSey9YQqIMri2pA1', 'Test', 'testest@mail.com', 'active', 'volunteer', '2021-09-06 19:56:31', 2, '2021-09-06 19:27:40', '2021-09-06 19:56:31');
INSERT INTO `aplego_user` VALUES (521, '123123123', '$P$BKbYsur6Q8DcLFbtKzNfPIxvl08IxX0', 'test', 'test@etst.com', 'active', 'volunteer', '2021-09-06 19:37:08', 2, '2021-09-06 19:34:51', '2021-09-06 19:37:08');
INSERT INTO `aplego_user` VALUES (522, '123212', '$P$B/wX5/3gIRGeSPEnGr.tdY4Dhpyxt7.', 'test', 'testttt@test.com', 'active', 'volunteer', '2021-09-06 19:42:19', 1, '2021-09-06 19:42:18', '2021-09-06 19:42:19');
INSERT INTO `aplego_user` VALUES (523, '198981212129', '$P$Bu2c7R7nvu5Ww0YvhlkjkUgPB6itvt0', 'test', 'testtttt@tttatata.com', 'active', 'volunteer', '2021-09-06 19:59:12', 1, '2021-09-06 19:59:12', '2021-09-06 20:02:52');
INSERT INTO `aplego_user` VALUES (524, '189876764545', '$P$BTupQpcPRVHEInFuKLGUI4VzlLZYIe0', 'test', 'tesb@mail.com', 'active', 'volunteer', '2021-09-06 20:05:44', 1, '2021-09-06 20:05:44', '2021-09-06 20:15:55');
INSERT INTO `aplego_user` VALUES (525, '12124343444', '$P$BHnohZqiTZJXqsn0am7CdZECHhUqXG.', 'test222', 'test111111111@mail.com', 'active', 'volunteer', '0000-00-00 00:00:00', 0, '2021-09-06 20:43:07', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (526, '178727276166', '$P$Bykdo5OJvTCVJPeN8Khmu6ZkkL48EW0', 'tester harun', 'agenthrn@gmail.com', 'active', 'volunteer', '2021-09-06 21:14:42', 4, '2021-09-06 20:53:07', '2021-10-14 21:01:12');
INSERT INTO `aplego_user` VALUES (527, 'harun', '$P$Bty3rBWR7MFmhGt4jbw9tg8olKUNJr1', 'Harun Hasibuan', 'harunhasibuan5@gmail.com', 'active', 'staf', '2021-09-10 19:39:47', 1, '2021-09-10 19:39:38', '2021-09-10 19:39:47');
INSERT INTO `aplego_user` VALUES (528, '167676767', '$P$BX4FKkUMnx0bZj1.hxP4nL5o6xPMoo1', 'test', 'testerrr@mail.com', 'active', 'volunteer', '0000-00-00 00:00:00', 0, '2021-09-11 11:37:23', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (529, '167676111', '$P$BXX5Mr9/rqclANtxeHF05pd7m/IakV.', 'test', 'tesssss@mail.com', 'active', 'volunteer', '0000-00-00 00:00:00', 0, '2021-09-11 12:59:40', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (530, '165150201111989', '$P$BWy7EupLrfHspKZwARkEX0TAZNJu6a0', 'test', 'test2@mail.com', 'active', 'volunteer', '2021-09-11 13:01:40', 1, '2021-09-11 13:01:38', '2021-09-11 15:34:28');
INSERT INTO `aplego_user` VALUES (531, '45456767', '$P$BV38Gy0iPKOwOIf8sf8oQmhmhLHF0z.', 'test222', 'test11122111111@mail.com', 'active', 'volunteer', '0000-00-00 00:00:00', 0, '2021-09-11 16:56:08', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (532, 'Test mhs', '$P$Bm5O9VX3PFAl3FHybcUKLJwg791D8k1', 'test mhs', 'mhs@mhs.com', 'active', 'volunteer', '0000-00-00 00:00:00', 0, '2021-09-13 12:23:44', '2021-09-13 14:39:40');
INSERT INTO `aplego_user` VALUES (533, 'volunteer1', '$P$BsV9sOEcbHvGTKC61L8L2ORCXVs50Y/', 'Harun', 'agenthrn22221@mail.com', 'active', 'difabel', '2021-10-29 15:24:01', 36, '2021-09-14 21:15:45', '2021-10-27 14:16:39');
INSERT INTO `aplego_user` VALUES (534, '1651502011110371', '$P$BEXEkpGTUA5.0xmuSdi4KsHA.15kSD/', 'Madif1', 'harunhasibuan5@gmail.com', 'active', 'difabel', '2021-10-01 06:12:46', 6, '2021-09-24 19:18:48', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (535, '145150200111160', '$P$B75LGEhtLll6I58l9xnaDjeZ5KYAZ70', 'Ibrahim Fiqhan', 'ibrahim@mail.com', 'active', 'volunteer', '0000-00-00 00:00:00', 0, '2021-09-24 19:31:04', '2021-09-27 20:37:43');
INSERT INTO `aplego_user` VALUES (536, '145150200111160', '$P$B75LGEhtLll6I58l9xnaDjeZ5KYAZ70', 'Ibrahim Fiqhan', 'ibrahim@mail.com', 'active', 'volunteer', '0000-00-00 00:00:00', 0, '2021-09-24 19:32:02', '2021-09-27 20:37:43');
INSERT INTO `aplego_user` VALUES (537, '145150200111160', '$P$B75LGEhtLll6I58l9xnaDjeZ5KYAZ70', 'Ibrahim Fiqhan', 'ibrahim@mail.com', 'active', 'volunteer', '0000-00-00 00:00:00', 0, '2021-09-24 19:33:24', '2021-09-27 20:37:43');
INSERT INTO `aplego_user` VALUES (538, 'test1', '$P$B8fl1fALvKf95pkfgsDmyoZunE2ujs0', 'test1', 'test1@mail.com', 'active', 'difabel', '2021-09-27 20:36:23', 1, '2021-09-27 20:35:59', '2021-10-01 14:11:51');
INSERT INTO `aplego_user` VALUES (539, '145150200111160', '$P$BnRdvWu.bDjkV64s3eI4F1Xs5SzK5R1', 'Ibrahim Fiqhan', 'ibrahim@mail.com', 'active', 'volunteer', '0000-00-00 00:00:00', 0, '2021-09-27 20:46:10', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (540, '145150200111160', '$P$BIjmHgat5vJ2ymRecN1MoW3y99XZiQ0', 'Ibrahim Fiqhan', 'ibrahim@mail.com', 'active', 'volunteer', '0000-00-00 00:00:00', 0, '2021-09-27 20:46:15', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (541, '145150200111160', '$P$BgxwzZEdW8liz/DjB4cTfriaDu6X8L1', 'Ibrahim Fiqhan', 'ibrahim@mail.com', 'active', 'volunteer', '0000-00-00 00:00:00', 0, '2021-09-27 20:46:17', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (542, '145150200111160', '$P$Bg.dUZMtJi3IgsJ829zJr4ZfP2zwgX0', 'Ibrahim Fiqhan', 'ibrahim@mail.com', 'active', 'volunteer', '0000-00-00 00:00:00', 0, '2021-09-27 20:46:19', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (543, 'difabel12', '$P$BJCsxw5Afn/pxuTr3ixRRiXXqZTgk4/', 'test222', 'madiff@mail.com', 'active', 'difabel', '2021-10-01 13:51:40', 2, '2021-10-01 13:41:36', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (544, 'difabel123', '$P$BEWRq0v/LNySewTBf1ARBzR3vydk411', 'test222', 'madifff@mail.com', 'active', 'difabel', '2021-10-01 13:53:04', 1, '2021-10-01 13:52:55', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (545, 'difabel1234', '$P$BD2e87iI5N87nCESspXTLUUyJ1qhub1', 'test222', 'madiffff@mail.com', 'active', 'difabel', '0000-00-00 00:00:00', 0, '2021-10-01 13:55:41', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (546, 'difabel12345', '$P$BhWnjBGNAVhKWPkbODKdy2/3ApbUIQ0', 'test222', 'madifffff@mail.com', 'active', 'difabel', '2021-10-01 13:58:37', 1, '2021-10-01 13:58:17', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (547, 'difabel123456', '$P$BbZ0FclPaOYtCaGpr06WyVi75uVB8G/', 'test222', 'madiffffff@mail.com', 'active', 'difabel', '2021-10-01 14:00:23', 1, '2021-10-01 14:00:12', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (548, 'difabel1234567', '$P$BEJ04WjSg2g5MjbgXPF4eI85ELbeT4/', 'test222', 'madifffffff@mail.com', 'active', 'difabel', '0000-00-00 00:00:00', 0, '2021-10-01 14:01:11', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (549, 'testlagi', '$P$BW4ds3yWqbzol/HbEKQtD8L3/ICqJD/', 'testlagi', 'testlagi@mail.com', 'active', 'difabel', '0000-00-00 00:00:00', 0, '2021-10-01 14:16:20', '2021-10-01 14:17:15');
INSERT INTO `aplego_user` VALUES (550, '123333123', '$P$B2wXFhAFlh8WFgpbE3PABBq14zMf.P.', 'test222', 'test11212212@mail.com', 'active', 'volunteer', '0000-00-00 00:00:00', 0, '2021-10-02 10:33:14', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (551, '1233331231', '$P$B6gWgN7GDNkBlf607C/cDGQL5fh.Sd1', 'test222', 'test112122212@mail.com', 'active', 'volunteer', '0000-00-00 00:00:00', 0, '2021-10-02 10:45:39', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (552, 'testmadif1', '$P$BznCq55WIvDrprocvvMmDXBTy/U96U0', 'Mahasiswa Difabel 1', 'testmadif1@gmail.com', 'active', 'difabel', '2022-04-16 11:06:22', 160, '2021-10-02 20:46:05', '2021-10-12 13:29:24');
INSERT INTO `aplego_user` VALUES (553, 'testmadif2', '$P$B87kNiPLShjF7WQn4L9/wGa14Ut3vd.', 'testmadif2', 'testmadif2@gmail.com', 'active', 'difabel', '0000-00-00 00:00:00', 0, '2021-10-02 20:47:22', '2021-10-02 21:24:48');
INSERT INTO `aplego_user` VALUES (554, 'testvolunteer1', '$P$B/XZt/bwFRH2kDJKJTaYUWsbJqq9A91', 'Volunteer Satu', 'testvolunteer1@gmail.com', 'active', 'volunteer', '2021-11-06 07:37:11', 100, '2021-10-02 20:48:45', '2021-10-14 22:13:05');
INSERT INTO `aplego_user` VALUES (555, 'testvolunteer2', '$P$B3TcQ0U1BBfO7ih642A3PVD0.58lnO.', 'testvolunteer2', 'testvolunteer2@gmail.com', 'active', 'volunteer', '2021-11-06 07:34:20', 5, '2021-10-02 20:50:47', '2021-10-02 22:36:11');
INSERT INTO `aplego_user` VALUES (556, '145150200111160mm', '$P$BLKN.C0HGvxLOIq/J5Vs79BxM2jitt.', 'Ibrahim Fiqhan', 'ibrahimmm@mail.com', 'active', 'volunteer', '0000-00-00 00:00:00', 0, '2021-10-07 20:17:03', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (557, '14515020011160', '$P$BmIPxEmZlojZmYd.G3Eq7snRcksWhR0', 'Ibrahim Fiqhan', 'fiqhan@mail.com', 'active', 'volunteer', '0000-00-00 00:00:00', 0, '2021-10-14 20:21:37', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (558, '145150200111161', '$P$BkB8Gu7zrSLBK6rLrQ8JxePRc15B1I/', 'Ibrahim', 'ibrahimqq@mail.com', 'active', 'volunteer', '2021-10-17 19:23:10', 4, '2021-10-14 20:25:32', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (559, '145150200111163', '$P$BhIkK.wwP0A/Miov6G.Qjh2/wgmVd6.', 'Yunus', 'yunus@mail.com', 'active', 'mahasiswa', '0000-00-00 00:00:00', 0, '2021-10-17 11:33:37', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (560, '145150200111165', '$P$Bt/2NCKe3Ow6/A0QZK7GT0b/eDWwuP.', 'Muhammad', 'muh@mail.com', 'active', 'volunteer', '2021-10-17 21:24:11', 2, '2021-10-17 19:17:35', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (561, '145150200111166', '$P$BSvfenWy4m7QSLGM3Hvtn2OIzMAiWb0', 'Udin', 'udin@mail.com', 'active', 'volunteer', '2021-10-17 21:24:25', 3, '2021-10-17 19:38:26', '2021-10-17 19:43:02');
INSERT INTO `aplego_user` VALUES (562, 'volunteer2', '$P$BeDPjSnBk4rheWnH05ShtNHTSPsPbs1', 'volunteer2', 'volunteer2@mail.com', 'active', 'volunteer', '2021-10-29 16:02:04', 13, '2021-10-17 19:47:06', '2021-10-29 14:34:21');
INSERT INTO `aplego_user` VALUES (563, 'volunteer3', '$P$B6KdAEahwKFdWOVqS9WsImkRBIG5zp1', 'volunteer3', 'volunteer3@mail.com', 'active', 'volunteer', '2021-10-19 19:43:22', 1, '2021-10-19 19:43:22', '2021-10-19 19:43:56');
INSERT INTO `aplego_user` VALUES (564, '145150200111169', '$P$BV9E0FCuUrEOZoyy57gvNYOLALrc6Z0', 'Enam Sembilan', 'enamsembilan@mail.com', 'active', 'volunteer', '2021-10-27 19:43:24', 8, '2021-10-23 21:43:05', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (565, '145150200111170', '$P$B4ewhZEj0CLpKY76Xld0Rx0HDKNoaR0', 'Tuju Puluh', 'tuju@mail.com', 'active', 'volunteer', '2021-10-27 19:47:52', 1, '2021-10-27 19:47:35', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (566, '215010119111002', '$P$BqeOpADe4CusRht/Uc.LBp0LoZ5cSs1', 'Sultan Ariyan Rizaldi', 'sultanari@student.ub.ac.id', 'active', 'difabel', '2022-02-19 07:42:03', 19, '2021-10-28 14:06:30', '2022-02-19 07:42:03');
INSERT INTO `aplego_user` VALUES (567, '215120219111003', '$P$BOHW.OfqBSFDGAK3ZsErlFbGR709x2.', 'Callan Rahmadyvi Triyunanto', 'callan@student.ub.ac.id', 'active', 'difabel', '2022-03-08 10:02:08', 20, '2021-11-03 06:37:29', '2022-03-08 10:02:08');
INSERT INTO `aplego_user` VALUES (568, '205010100111157', '$P$B186rwaTwkaeBMwZYevpc5JKLEmI3p/', 'Heru Andana', 'Heruandana2002@student.ub.ac.id', 'active', 'difabel', '2021-11-05 09:50:53', 1, '2021-11-05 09:50:53', '2021-11-05 09:50:53');
INSERT INTO `aplego_user` VALUES (569, '215120219111002', '$P$Bp.TnXSrMM25KoL0IWyN1yHfVSdbYW/', 'Muhammad Arsa Alamsyah', 'm.arsa.alamsyah@student.ub.ac.id', 'active', 'difabel', '2022-02-07 16:17:50', 5, '2021-11-10 12:57:46', '2022-02-07 16:17:50');
INSERT INTO `aplego_user` VALUES (570, ' 214140219111002', '$P$B81G4Oo7NRFjhGyWUjnYDAKaauoShX1', 'Nur Aziziyah Insyirah', 'nuraziziyahi@gmail.com', 'active', 'difabel', '2022-02-08 14:07:56', 7, '2021-11-10 15:42:23', '2022-02-08 14:07:56');
INSERT INTO `aplego_user` VALUES (571, '2017018709102001', '$P$ByudPr3R2RIRxAQPUdNBz/h9oicjH1/', 'Alies Poetri Lintangsari', 'alieslintang@ub.ac.id', 'active', 'volunteer', '2022-01-07 09:46:17', 1, '2022-01-07 09:46:17', '2022-01-07 09:46:17');
INSERT INTO `aplego_user` VALUES (572, '175110407111017', '$P$BzFQLFkVfhhYi/LbJ1YEobViEy31/l0', 'FIKRI AZIZ', 'fikriaz1997@gmail.com', 'active', 'volunteer', '2022-02-08 11:59:48', 4, '2022-01-10 11:31:29', '2022-02-08 07:33:44');
INSERT INTO `aplego_user` VALUES (573, '217090401111001', '$P$BO.dU0PPou3Myi23DjAtmvGeGUkipJ0', 'Layta Dinira', 'laytadinira@gmail.com', 'active', 'volunteer', '2022-04-18 08:50:08', 7, '2022-01-11 12:38:36', '2022-04-18 08:50:08');
INSERT INTO `aplego_user` VALUES (574, 'ganyot', '$P$BeQ3Kq31uH1cViIhZ.yioSKIGt07/d0', 'Khairun Nasta\'in', 'khairunnastain@gmail.com', 'active', 'difabel', '2022-02-04 16:25:22', 5, '2022-01-11 12:59:32', '2022-02-04 16:25:22');
INSERT INTO `aplego_user` VALUES (575, 'nasta', '$P$BieeFeDdOnmHOa5V05rVhqgerSmrDw0', 'nastain', 'nastain@ub.ac.id', 'active', 'volunteer', '2022-01-27 11:45:11', 1, '2022-01-27 11:45:11', '2022-01-27 11:45:11');
INSERT INTO `aplego_user` VALUES (576, '195090201111022', '$P$BTFeXHDQDI8XjqyoVD3YYoReCPfFLt0', 'Halifah', 'halifah1903@student.ub.ac.id', 'active', 'volunteer', '2022-01-27 23:54:34', 3, '2022-01-27 20:02:02', '2022-01-27 23:54:34');
INSERT INTO `aplego_user` VALUES (577, '195090207111006', '$P$Bg2B1QlpAVTnf8BQU2DGJWRoF.RXNF1', 'Devike Fera Ayuningrum', 'devikeferaa@student.ub.ac.id', 'active', 'difabel', '2022-01-31 00:32:30', 1, '2022-01-31 00:32:30', '2022-01-31 00:32:30');
INSERT INTO `aplego_user` VALUES (578, '12345', '$P$BV1Q/SY/QK.mRnuLWHZnJW4NZ/NUsM1', 'Khairun Nasta\'in', 'nastain@ub.ac.id', 'active', 'volunteer', '2022-02-17 15:55:25', 3, '2022-02-03 10:18:44', '2022-02-17 16:07:06');
INSERT INTO `aplego_user` VALUES (579, '215110600111028', '$P$BxgFsMfSV6IcYoAFAw3R87pQOQ/iXL/', 'IRKHAM NUR RIZKI', 'irkhamnurrizki@student.ub.ac.id', 'active', 'volunteer', '2022-02-03 13:04:02', 1, '2022-02-03 13:04:02', '2022-02-03 13:04:02');
INSERT INTO `aplego_user` VALUES (580, '215030401111048', '$P$BbwaUGqIarUkRfa2PzuvT/GeMREFb/.', 'Tabina Jasmine Anindhita', 'tabinajn@gmail.com', 'active', 'volunteer', '2022-02-19 21:13:45', 5, '2022-02-04 09:15:39', '2022-02-19 21:13:45');
INSERT INTO `aplego_user` VALUES (581, '215120319111001', '$P$BBVbdZ0fbI9GUbkiW8AVXkLeBDGpvC0', 'Annisa Kusuma Wardhani', 'annisaakusuma@student.ub.ac.id', 'active', 'difabel', '2022-02-20 15:39:39', 11, '2022-02-04 12:01:18', '2022-02-20 15:39:39');
INSERT INTO `aplego_user` VALUES (582, '215150419111002', '$P$B8mePMBuZ6vkUPTt76117jntxwjWah/', 'Muhammad Alwi Hakim', 'alwihakim@student.ub.ac.id', 'active', 'mahasiswa', '0000-00-00 00:00:00', 0, '2022-02-04 13:11:47', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (583, '205120101111041', '$P$B/cgnL2jtj7F9/Ftju6Mgt/Z2iRpgc.', 'Fajar', 'fajar2209@student.ub.ac.id', 'active', 'volunteer', '2022-02-04 13:37:00', 1, '2022-02-04 13:36:50', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (584, '195090201111025', '$P$BKfxg2HO15KFdHTTLBedOzdxOO1z2Y1', 'Nabila Almayda', 'nabilaal@student.ub.ac.id', 'active', 'volunteer', '2022-02-13 13:00:09', 9, '2022-02-04 15:19:34', '2022-02-13 13:00:09');
INSERT INTO `aplego_user` VALUES (585, '215110219111001', '$P$Bq8jlImSYU4ZRYkJb4HgfgoRN04YJ/1', 'Rumaisho Az-Zahro', 'rumaishoya@student.ub.com', 'active', 'difabel', '2022-02-17 18:08:32', 11, '2022-02-05 07:34:51', '2022-02-17 18:08:32');
INSERT INTO `aplego_user` VALUES (586, '214140219111001', '$P$BiuiONI.BLh4msQ0XcIsU0AZ2O3pfD.', 'Abdul Jabbar Fitrah', 'ajfitrah25@student.ub.ac.id', 'active', 'difabel', '2022-02-15 10:04:26', 11, '2022-02-05 16:25:27', '2022-02-15 10:04:26');
INSERT INTO `aplego_user` VALUES (587, '195030400111030', '$P$BTiL3eFKqg3h0sPFYBGUztQCiY/sJf0', 'Ryan Nugraha', 'rynngrha@student.ub.ac.id', 'active', 'volunteer', '2022-02-07 21:24:38', 5, '2022-02-05 20:18:44', '2022-02-07 21:24:38');
INSERT INTO `aplego_user` VALUES (588, '185120300111034', '$P$BIRSjYyNgMbT.0LKRgA0zy0o/qIWt.1', 'Dinda Naovalia Pramesty', 'dindanaovalia05@student.ub.ac.id', 'active', 'volunteer', '2022-02-22 21:58:10', 12, '2022-02-06 18:31:18', '2022-02-22 21:58:10');
INSERT INTO `aplego_user` VALUES (589, '215030119111001', '$P$BzWx0EBuggfECaN48yRd9crfZY/K20.', 'Dani Ihwan Rizqi', 'dani1700020@student.ub.ac.id', 'active', 'difabel', '2022-02-15 19:39:51', 10, '2022-02-06 18:44:24', '2022-02-15 19:39:51');
INSERT INTO `aplego_user` VALUES (590, '215120319111002', '$P$BPM.T2qSIMuiVcjhPXBWKfmvNsYS1m.', 'Ayu Meilindatul Hikmah', 'meilindatul20@student.ub.ac.id', 'active', 'difabel', '2022-02-20 14:55:24', 7, '2022-02-06 19:14:11', '2022-02-20 14:55:24');
INSERT INTO `aplego_user` VALUES (591, '185010100111051', '$P$Bbd09dapE8QB4aMMIWeEErA62roW5P1', 'Teresa Florence Vina Sihombing', 'teresaflorence@student.ub.ac.id', 'active', 'volunteer', '2022-02-18 11:23:01', 2, '2022-02-07 17:36:51', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (592, '215150419111001', '$P$BYRGArAgstLC.TqSWaz249KdN.kfTV.', 'Dandy Budhi Prasetyo', 'dandybudhi@student.ub.ac.id', 'active', 'difabel', '2022-02-21 01:20:05', 8, '2022-02-07 23:34:48', '2022-02-21 01:20:05');
INSERT INTO `aplego_user` VALUES (593, '215150200111017', '$P$B/hCotSQbikKMkVWxV2U4btHEGjnW//', 'Muhammad Fadhly Robbani', 'fadhlyrobbani1986@gmail.com', 'active', 'mahasiswa', '0000-00-00 00:00:00', 0, '2022-02-08 06:49:56', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (594, '215020200111092', '$P$BW0nVI.ke3KBbwWMNl05gJ/tbXIW7f0', 'Andreanno Septian Eka Wijaya', 'andrewijaya777@student.ub.ac.id', 'active', 'volunteer', '2022-02-12 17:40:12', 1, '2022-02-12 17:40:01', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (595, '215080200111010', '$P$BEAj2TV2L4P/3QKq8rpLz3fkPRMZkb/', 'Atika Habibatul Fitriya', 'Atika.habibatulf@gmail.com', 'active', 'volunteer', '2022-02-24 06:52:35', 2, '2022-02-16 10:14:52', '0000-00-00 00:00:00');
INSERT INTO `aplego_user` VALUES (596, '215120219111001', '$P$BsMlxK1DPPVILLTCkXfGvmalHla.V60', 'Muhammad Aiman Muafa', 'm.aiman.muafa@student.ub.ac.id', 'active', 'difabel', '2022-02-20 19:07:49', 2, '2022-02-17 16:36:40', '2022-02-20 19:07:49');
INSERT INTO `aplego_user` VALUES (597, '205150700111050', '$P$Bgtw.MMzkMvNz3dRoDmKW4UJb75ZBT/', 'Octavia Lintang Pramesti', 'lintangpramesti77@gmail.com', 'active', 'volunteer', '2022-02-25 15:14:25', 2, '2022-02-17 20:00:26', '2022-02-25 15:14:25');
INSERT INTO `aplego_user` VALUES (598, '195061101111018', '$P$BvBzgIlwbISoHwibxbgD3Oe6gIAP890', 'Mia Rokhimatul Handayani', 'miarhn@student.ub.ac.id', 'active', 'volunteer', '2022-02-17 20:31:25', 1, '2022-02-17 20:31:25', '2022-02-17 20:31:25');
INSERT INTO `aplego_user` VALUES (599, '205120301111036', '$P$BP6o9JZ8Y3NI09xvjFsj3v4//G2VYW.', 'Jihan Nur Annissa', 'jihanurisa@student.ub.ac.id', 'active', 'volunteer', '2022-03-24 13:16:11', 1, '2022-03-24 13:16:11', '2022-03-24 13:16:11');

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
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `aplego_user_meta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `aplego_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 871 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of aplego_user_meta
-- ----------------------------
INSERT INTO `aplego_user_meta` VALUES (394, 340, 'token', '1d58bdbc4b6fdeec5868028fb241b64066d508e7');
INSERT INTO `aplego_user_meta` VALUES (395, 343, 'jenis_difabel', 'ADHD');
INSERT INTO `aplego_user_meta` VALUES (396, 343, 'token', 'd304faf485817725c5a97d8d184879fcdec503af');
INSERT INTO `aplego_user_meta` VALUES (397, 344, 'token', 'e007647d5dff3d07e1c1a1b0448743a21a3124f3');
INSERT INTO `aplego_user_meta` VALUES (399, 345, 'token', '709cf47222655eb77f7e97b381ebb0fa2dd066f2');
INSERT INTO `aplego_user_meta` VALUES (401, 351, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (402, 353, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (403, 351, 'token', '909a8a560f602f2751bc63ec19ccb60ba481de78');
INSERT INTO `aplego_user_meta` VALUES (404, 354, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (409, 362, 'jenis_difabel', 'Low Vision');
INSERT INTO `aplego_user_meta` VALUES (410, 362, 'token', '66aa8550b36410ba889775586624ad20d9a1a3ee');
INSERT INTO `aplego_user_meta` VALUES (411, 364, 'token', 'f2476131266e0c4593a652e4107d142327936f61');
INSERT INTO `aplego_user_meta` VALUES (414, 365, 'token', '1b181e373727f970f7fc27c5182383192ff13609');
INSERT INTO `aplego_user_meta` VALUES (415, 357, 'token', '6a2dee6d9e2d70aa851557f96f554ef0cc53ae26');
INSERT INTO `aplego_user_meta` VALUES (416, 367, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (417, 367, 'token', '34cfe3271392464e4946cae4ac597d52f42b89fd');
INSERT INTO `aplego_user_meta` VALUES (418, 368, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (421, 371, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (422, 372, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (423, 372, 'token', '3d3dcfdd0314ae7190f7bd7c21885f62d19c0e6d');
INSERT INTO `aplego_user_meta` VALUES (424, 374, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (425, 375, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (426, 380, 'jenis_difabel', 'Cerebral Palsy');
INSERT INTO `aplego_user_meta` VALUES (428, 380, 'token', '7a9d14a120633f12e942a6d8bf200e793d47fb37');
INSERT INTO `aplego_user_meta` VALUES (429, 374, 'token', '9c60f44670cdd9cfa7513438e54a530b32ba6e01');
INSERT INTO `aplego_user_meta` VALUES (433, 385, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (434, 386, 'token', 'eabbb34951945fcf84904701e26976abd80bbc00');
INSERT INTO `aplego_user_meta` VALUES (435, 387, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (436, 341, 'token', '4b3ed52f07d66643a925be4c1733065cf9428b66');
INSERT INTO `aplego_user_meta` VALUES (437, 361, 'token', '2aae991e0b2a54beb8a6ea71acc64c18da374312');
INSERT INTO `aplego_user_meta` VALUES (438, 384, 'token', 'dc4c30904211197fc62da4f40d1b6347d41b3314');
INSERT INTO `aplego_user_meta` VALUES (439, 390, 'token', 'b00bb4d89ba565d960e3bf76d555ae2580e6f420');
INSERT INTO `aplego_user_meta` VALUES (440, 359, 'token', 'c6a6925de6f71305b8397df1768eb565909f718c');
INSERT INTO `aplego_user_meta` VALUES (441, 385, 'token', 'ce228b52fda9c04ef157a2b11fe341ed1727e783');
INSERT INTO `aplego_user_meta` VALUES (442, 373, 'token', '3686a6026eaacbd4bd9e1a792f068c387d1e81f0');
INSERT INTO `aplego_user_meta` VALUES (444, 396, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (446, 354, 'token', 'af35c509a6c2a07536b70a4f7a2fc07c7886a014');
INSERT INTO `aplego_user_meta` VALUES (447, 395, 'token', 'be799b1691598c61a252ee70e9398bdc2b5ad07d');
INSERT INTO `aplego_user_meta` VALUES (448, 400, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (451, 403, 'token', 'df64005f6ead625f1ce2fd1e30aef21866c240bb');
INSERT INTO `aplego_user_meta` VALUES (452, 404, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (453, 371, 'token', 'e185ef3cc660001a8c6ed280f40d61e80ace8ef8');
INSERT INTO `aplego_user_meta` VALUES (455, 405, 'token', '8d90c3bed84727c572ffc4647bdec7187d16fb05');
INSERT INTO `aplego_user_meta` VALUES (456, 407, 'jenis_difabel', 'Slow Learner');
INSERT INTO `aplego_user_meta` VALUES (457, 407, 'token', '36972f8045e7ff09aec6b192979211a070752380');
INSERT INTO `aplego_user_meta` VALUES (460, 411, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (461, 411, 'token', '6ea22f831abb4a70c4730646d0b4872379cfd6a8');
INSERT INTO `aplego_user_meta` VALUES (464, 413, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (465, 415, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (467, 415, 'token', '9e78a23b8ae38eaf746b7826e3baac3f0c2c869f');
INSERT INTO `aplego_user_meta` VALUES (469, 417, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (470, 419, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (471, 415, 'nick_name', 'Ghani');
INSERT INTO `aplego_user_meta` VALUES (472, 415, 'majors_id', '98');
INSERT INTO `aplego_user_meta` VALUES (473, 415, 'class_of_college', '2020');
INSERT INTO `aplego_user_meta` VALUES (474, 415, 'no_hp', '+6285872617725');
INSERT INTO `aplego_user_meta` VALUES (476, 421, 'jenis_difabel', 'Tuna Daksa');
INSERT INTO `aplego_user_meta` VALUES (478, 396, 'token', '8de3cf18060af06e7449d267ec1b08debe40e1f9');
INSERT INTO `aplego_user_meta` VALUES (479, 423, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (482, 401, 'token', '988652aa43ef9f22747f647f6d1224398ed7d6a0');
INSERT INTO `aplego_user_meta` VALUES (483, 426, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (484, 426, 'token', '26f10c9ae1966e5bfe77db96316a884f340798b8');
INSERT INTO `aplego_user_meta` VALUES (485, 426, 'nick_name', 'Hafiz');
INSERT INTO `aplego_user_meta` VALUES (486, 426, 'majors_id', '98');
INSERT INTO `aplego_user_meta` VALUES (487, 426, 'class_of_college', '2020');
INSERT INTO `aplego_user_meta` VALUES (488, 426, 'no_hp', '082286165392');
INSERT INTO `aplego_user_meta` VALUES (491, 429, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (492, 428, 'token', 'fe8c1057c9acb365ab7c502a12603b5ebe835161');
INSERT INTO `aplego_user_meta` VALUES (493, 350, 'token', '3fd5b3f4aacb8e7a1711df8ac0a0bc114086412e');
INSERT INTO `aplego_user_meta` VALUES (494, 399, 'token', '9f311b173ae5ba12a2f4e29aca084b1a16a28db6');
INSERT INTO `aplego_user_meta` VALUES (495, 376, 'token', 'caf7a48accf78828df98c8d1e715397e89fb9f2c');
INSERT INTO `aplego_user_meta` VALUES (496, 418, 'token', '76b81325c5f2e1b891d0cfa4b6fa6fbb264bc7b1');
INSERT INTO `aplego_user_meta` VALUES (497, 408, 'token', '5cf850c6636ebf70d38dcb59257395a13efd3e21');
INSERT INTO `aplego_user_meta` VALUES (498, 369, 'token', '73accb01e26b639e541b38a3bf6cb6dd1c49519d');
INSERT INTO `aplego_user_meta` VALUES (500, 377, 'token', '33fd735ac2544286097c4f3e2ac44cc78956c335');
INSERT INTO `aplego_user_meta` VALUES (501, 406, 'token', '1268a0c768b0060156fcb52fa3c00404457009d7');
INSERT INTO `aplego_user_meta` VALUES (502, 397, 'token', 'f4e7dfbf2063753bfb5f040e409301690e877b1a');
INSERT INTO `aplego_user_meta` VALUES (503, 425, 'token', '45626437abc4b896df1941d0bed0568803486020');
INSERT INTO `aplego_user_meta` VALUES (504, 378, 'token', '5b5f4e4ae96244e99ac8e8311f37b01f7b62e46f');
INSERT INTO `aplego_user_meta` VALUES (505, 392, 'token', '60f5fa530bceae9498f4cfc35fc35918c527e510');
INSERT INTO `aplego_user_meta` VALUES (506, 389, 'token', 'e2d60296ecc5cd8dfa8071af632ccc962ccb893f');
INSERT INTO `aplego_user_meta` VALUES (508, 368, 'token', '4bf59ec30b294b3c35ad3a1684bbd954527709d6');
INSERT INTO `aplego_user_meta` VALUES (509, 400, 'token', 'e81053943d785900483909c1011d4d5eb453fb03');
INSERT INTO `aplego_user_meta` VALUES (515, 433, 'token', 'c75ca64aae89d0f6402830b2de0fdd01cc8b57ab');
INSERT INTO `aplego_user_meta` VALUES (516, 430, 'token', 'b2454684617f125533659455a34ad12ee88d395f');
INSERT INTO `aplego_user_meta` VALUES (517, 398, 'token', '94353edc78490165734deaa96d0f10a6e481e3ba');
INSERT INTO `aplego_user_meta` VALUES (520, 434, 'token', '22ced530cac11fed1a6df98ec7dd963daf7901e0');
INSERT INTO `aplego_user_meta` VALUES (522, 437, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (523, 437, 'token', 'ac92d6c18f7c7f258743cb59a4b8095dc8758868');
INSERT INTO `aplego_user_meta` VALUES (524, 438, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (528, 440, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (529, 441, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (531, 443, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (532, 444, 'token', '973f784027053bebc2b983b23aab4b395369bc8f');
INSERT INTO `aplego_user_meta` VALUES (537, 441, 'token', '59711b3471776680b41f36962a33cf4fcb161c46');
INSERT INTO `aplego_user_meta` VALUES (538, 446, 'token', 'c044b12bc42f9a4a5688299ca451015ff6aaf9d7');
INSERT INTO `aplego_user_meta` VALUES (539, 448, 'token', 'af776bdddcbeafe530cf5f97cca353923e0439d6');
INSERT INTO `aplego_user_meta` VALUES (540, 419, 'token', 'ed9bb3959c9e91b40e9e671be055e5c42179f8bf');
INSERT INTO `aplego_user_meta` VALUES (541, 451, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (542, 451, 'token', '5835df8078163819ac136fc7172a34e3037a40ae');
INSERT INTO `aplego_user_meta` VALUES (543, 452, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (544, 452, 'token', '604299ad1ee94ca22912aeec9e67c7f1038dce0a');
INSERT INTO `aplego_user_meta` VALUES (545, 432, 'token', '8c4a175ed5cc9473aac25e00e52c5a301b51c58f');
INSERT INTO `aplego_user_meta` VALUES (546, 458, 'jenis_difabel', 'Tuna Daksa');
INSERT INTO `aplego_user_meta` VALUES (549, 465, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (550, 375, 'token', 'e7550728cf530c311d785329e8a24e17fe1de31e');
INSERT INTO `aplego_user_meta` VALUES (551, 466, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (553, 467, 'token', '046ab1063e8469d3eaf6bd38fe6fb23f9684da37');
INSERT INTO `aplego_user_meta` VALUES (554, 469, 'jenis_difabel', 'Tuna Daksa');
INSERT INTO `aplego_user_meta` VALUES (555, 469, 'token', '42b9fc7e67f2e24ae98546c908c5f5a79db8818e');
INSERT INTO `aplego_user_meta` VALUES (556, 358, 'token', 'e0ffb4a0fae23f1552e15b0dbbec02ec04e8a1b4');
INSERT INTO `aplego_user_meta` VALUES (557, 417, 'token', '748df2ec4d522bdc161852118b6834576e089194');
INSERT INTO `aplego_user_meta` VALUES (558, 473, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (559, 473, 'token', '7c7aa2bad4a621b7909adae3fa25fc0e9b1a2a91');
INSERT INTO `aplego_user_meta` VALUES (560, 474, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (561, 471, 'token', '24d2d1eb175fd6fcb9b91e0acb150eb9fa9f3790');
INSERT INTO `aplego_user_meta` VALUES (564, 472, 'token', '1322a9005994c56096b16dabec5ab025f7014ff8');
INSERT INTO `aplego_user_meta` VALUES (565, 477, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (566, 477, 'token', '05b9b429b33705ded3925a6908491bab2c0a24ba');
INSERT INTO `aplego_user_meta` VALUES (567, 404, 'token', 'c53735bf1b0a2b4c983043dfb23051015584a4e2');
INSERT INTO `aplego_user_meta` VALUES (568, 478, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (569, 479, 'jenis_difabel', 'Autis Ringan');
INSERT INTO `aplego_user_meta` VALUES (570, 480, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (571, 481, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (572, 481, 'token', '493fee752095e7cd712db53cb3ea44af3a210220');
INSERT INTO `aplego_user_meta` VALUES (573, 482, 'jenis_difabel', 'Tuna Daksa');
INSERT INTO `aplego_user_meta` VALUES (574, 429, 'token', 'fdb4d8c7aeaaeb221ad15eed3e335bda12092b49');
INSERT INTO `aplego_user_meta` VALUES (575, 427, 'token', 'cada772a359b653065e2222a0af4f33bbb3478cb');
INSERT INTO `aplego_user_meta` VALUES (576, 479, 'token', 'e2bcdbe23cdc3d5095bf8bef022be75983310429');
INSERT INTO `aplego_user_meta` VALUES (577, 440, 'token', 'b2818a1340afecb6d7a11434cf20dccba9f1bd86');
INSERT INTO `aplego_user_meta` VALUES (579, 478, 'token', '8f37dff0de8cef81bb183c4b1a662143478cde3b');
INSERT INTO `aplego_user_meta` VALUES (580, 484, 'token', '6bc343cf301e40b0212008daa23f3a554c790b21');
INSERT INTO `aplego_user_meta` VALUES (586, 493, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (587, 493, 'token', 'bbd453d73d6becbf240ece8b4b5aa7ce1788aa31');
INSERT INTO `aplego_user_meta` VALUES (589, 497, 'token', '3323349ed6e776627f45b8aa86e1493d6e8d5e9e');
INSERT INTO `aplego_user_meta` VALUES (590, 496, 'token', '636f66081498354542f2bf896ff2d8ca043ae228');
INSERT INTO `aplego_user_meta` VALUES (591, 500, 'token', '37067c3b6cacf55aba635264cc91d8ba64b0617b');
INSERT INTO `aplego_user_meta` VALUES (592, 485, 'token', '3b523a3438801facb6c0a458ed06eb324c8f3429');
INSERT INTO `aplego_user_meta` VALUES (593, 507, 'token', '9b950b1c6809f28ad69fb8f8efb5697e57cf190b');
INSERT INTO `aplego_user_meta` VALUES (594, 501, 'token', 'a7459d2db5be8c3362f4dd49faedd7546e352195');
INSERT INTO `aplego_user_meta` VALUES (595, 455, 'token', '4e2f4fa0b3368cd3f3a3b166502ee29bc1e5836d');
INSERT INTO `aplego_user_meta` VALUES (596, 512, 'token', '0dbb311c9545cd1780ab93a2ffe60a21dc2534f6');
INSERT INTO `aplego_user_meta` VALUES (597, 495, 'token', '556733a5c431430886cb45d80ec9016a261110e7');
INSERT INTO `aplego_user_meta` VALUES (598, 511, 'token', '85f560de10b11f3f71f6c86cde6599bada743652');
INSERT INTO `aplego_user_meta` VALUES (599, 516, 'token', 'e0c2c475bc3fe0f9e0430be73f6dd1ac6b065bcf');
INSERT INTO `aplego_user_meta` VALUES (600, 499, 'token', '4d50baf5d76b3b118d5378bb9d0e9ce979e67839');
INSERT INTO `aplego_user_meta` VALUES (601, 517, 'token', 'ac1c4fd56b9cd7162807a3387d5fcfd0b6204dfe');
INSERT INTO `aplego_user_meta` VALUES (602, 508, 'token', '9819ce02a0ababffdddb5c5dc28c8c6db3f1e637');
INSERT INTO `aplego_user_meta` VALUES (603, 519, 'token', 'e5d29de376d924a81b08ea03a41fa958dc02f7be');
INSERT INTO `aplego_user_meta` VALUES (604, 519, 'device_id', '3446c911685c9ea0');
INSERT INTO `aplego_user_meta` VALUES (607, 530, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (608, 530, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (613, 531, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (614, 531, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (625, 532, 'jenis_difabel', 'ADHD');
INSERT INTO `aplego_user_meta` VALUES (628, 532, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (629, 532, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (645, 534, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (647, 519, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (648, 519, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (649, 537, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (652, 538, 'token', 'fd8144a5315b0a8ac6acb84c066b1c6f44d1e4ca');
INSERT INTO `aplego_user_meta` VALUES (653, 539, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (654, 540, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (655, 541, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (656, 542, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (658, 534, 'token', '07c568113084f9bc6e1bce4112e79f525db8df5e');
INSERT INTO `aplego_user_meta` VALUES (659, 543, 'jenis_difabel', 'ADHD');
INSERT INTO `aplego_user_meta` VALUES (660, 543, 'token', '7610641d350ca2c9cee806e8a8b8a9ce12df48c4');
INSERT INTO `aplego_user_meta` VALUES (661, 544, 'jenis_difabel', 'ADHD');
INSERT INTO `aplego_user_meta` VALUES (662, 544, 'token', '088c1a4aaa6878064a6fa488d81b143cb115fd80');
INSERT INTO `aplego_user_meta` VALUES (663, 546, 'jenis_difabel', 'ADHD');
INSERT INTO `aplego_user_meta` VALUES (664, 546, 'token', '3c78d5bbe9fbc01ee198074a37ea7f56ec7ffb74');
INSERT INTO `aplego_user_meta` VALUES (665, 547, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (666, 547, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (667, 547, 'jenis_difabel', 'ADHD');
INSERT INTO `aplego_user_meta` VALUES (668, 547, 'token', '52c6b85f5871da2bbfc0f2174c1039c063cd3707');
INSERT INTO `aplego_user_meta` VALUES (671, 538, 'jenis_difabel', 'Cerebral Palsy');
INSERT INTO `aplego_user_meta` VALUES (672, 538, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (673, 538, 'jenis_preferensi', 'Braille 2');
INSERT INTO `aplego_user_meta` VALUES (679, 549, 'jenis_difabel', 'Slow Learner');
INSERT INTO `aplego_user_meta` VALUES (680, 549, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (681, 549, 'jenis_preferensi', 'Braille 2');
INSERT INTO `aplego_user_meta` VALUES (682, 550, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (683, 550, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (684, 551, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (685, 551, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (686, 533, 'token', 'bdcf6c30c2e6539f444c9ed2751ea8ca14d3c9bd');
INSERT INTO `aplego_user_meta` VALUES (699, 552, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (700, 552, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (701, 553, 'jenis_difabel', 'Cerebral Palsy');
INSERT INTO `aplego_user_meta` VALUES (702, 553, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (705, 555, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (706, 555, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (707, 554, 'token', '231da486c948336439d0ecb8259380bf9a788888');
INSERT INTO `aplego_user_meta` VALUES (708, 556, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (709, 552, 'token', '446fe58b87516469c54c84edb0ec964aefb1996b');
INSERT INTO `aplego_user_meta` VALUES (710, 555, 'token', '3b681d243b10f86d3e20b9968e5382e183e9cba2');
INSERT INTO `aplego_user_meta` VALUES (711, 557, 'jenis_preferensi', 'Braile');
INSERT INTO `aplego_user_meta` VALUES (712, 558, 'jenis_preferensi', 'Braile');
INSERT INTO `aplego_user_meta` VALUES (713, 558, 'token', 'd8eb8b47c01ca5d7145533f233d9e6c776eb3440');
INSERT INTO `aplego_user_meta` VALUES (714, 559, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (715, 559, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (716, 560, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (717, 560, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (718, 560, 'token', '23c030761bdf009bc5a3619d33cc80619ab18406');
INSERT INTO `aplego_user_meta` VALUES (719, 561, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (720, 561, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (721, 561, 'jenis_preferensi', 'Braille 2');
INSERT INTO `aplego_user_meta` VALUES (722, 561, 'token', '6c7a280d2fd43f74ea0ee73dab24832648e4fa68');
INSERT INTO `aplego_user_meta` VALUES (743, 563, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (744, 563, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (745, 562, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (746, 562, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (747, 564, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (748, 564, 'jenis_preferensi', 'Braille 2');
INSERT INTO `aplego_user_meta` VALUES (749, 564, 'token', 'fc0ea45d53fc213ae94b378a81ad565464195454');
INSERT INTO `aplego_user_meta` VALUES (750, 552, 'nick_name', 'testmadif1');
INSERT INTO `aplego_user_meta` VALUES (751, 552, 'majors_id', '108');
INSERT INTO `aplego_user_meta` VALUES (752, 552, 'class_of_college', '2016');
INSERT INTO `aplego_user_meta` VALUES (753, 552, 'no_hp', '089812129292');
INSERT INTO `aplego_user_meta` VALUES (754, 552, 'birth_date', '1997-10-03');
INSERT INTO `aplego_user_meta` VALUES (757, 533, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (760, 533, 'nick_name', 'volunteer1');
INSERT INTO `aplego_user_meta` VALUES (761, 533, 'majors_id', '21');
INSERT INTO `aplego_user_meta` VALUES (762, 533, 'class_of_college', '2016');
INSERT INTO `aplego_user_meta` VALUES (763, 533, 'no_hp', '08564644666765');
INSERT INTO `aplego_user_meta` VALUES (764, 533, 'birth_date', '2021-09-13');
INSERT INTO `aplego_user_meta` VALUES (772, 554, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (773, 554, 'jenis_preferensi', 'Braille 2');
INSERT INTO `aplego_user_meta` VALUES (774, 565, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (775, 565, 'token', '2670bdfe7ed9a0cc5a311f59c58b9b4f9a5a7ecd');
INSERT INTO `aplego_user_meta` VALUES (778, 533, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (779, 566, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (780, 566, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (781, 562, 'token', 'f45c755c23080a65286cfcaed372059fcb1ac000');
INSERT INTO `aplego_user_meta` VALUES (785, 516, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (786, 567, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (787, 567, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (788, 344, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (789, 568, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (790, 568, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (791, 569, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (792, 569, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (793, 570, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (794, 570, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (795, 571, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (796, 572, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (800, 573, 'token', '884351f843bdefa2f7cf56b24da944d2eab0b377');
INSERT INTO `aplego_user_meta` VALUES (803, 573, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (804, 573, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (805, 573, 'jenis_preferensi', 'Braille 2');
INSERT INTO `aplego_user_meta` VALUES (806, 574, 'jenis_difabel', 'Autism');
INSERT INTO `aplego_user_meta` VALUES (807, 574, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (808, 574, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (809, 574, 'token', '599356d73985dd1a0019df88742a63b180a7de41');
INSERT INTO `aplego_user_meta` VALUES (810, 575, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (811, 576, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (812, 577, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (813, 577, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (815, 579, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (816, 580, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (817, 581, 'jenis_difabel', 'Tuna Daksa');
INSERT INTO `aplego_user_meta` VALUES (818, 581, 'jenis_difabel', 'Tuna Daksa');
INSERT INTO `aplego_user_meta` VALUES (819, 582, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (820, 583, 'jenis_preferensi', 'Bahasa Isyarat');
INSERT INTO `aplego_user_meta` VALUES (821, 583, 'token', '8b06706a316162a7395b4cc3cdc45136194a749e');
INSERT INTO `aplego_user_meta` VALUES (822, 584, 'jenis_preferensi', 'Lain-lain');
INSERT INTO `aplego_user_meta` VALUES (823, 585, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (824, 585, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (825, 586, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (826, 586, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (827, 587, 'jenis_preferensi', 'Bahasa Isyarat Bisindo');
INSERT INTO `aplego_user_meta` VALUES (828, 443, 'token', '6d4692509d1c25f15a8591c08e300bcd770d5e9e');
INSERT INTO `aplego_user_meta` VALUES (829, 453, 'token', 'a527c91d29fde0e318650ff22e44313c7ec5c239');
INSERT INTO `aplego_user_meta` VALUES (830, 588, 'jenis_preferensi', 'Lain-lain');
INSERT INTO `aplego_user_meta` VALUES (831, 588, 'jenis_preferensi', 'Typist / Juru Ketik');
INSERT INTO `aplego_user_meta` VALUES (832, 589, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (833, 589, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (834, 590, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (835, 590, 'jenis_difabel', 'Tunanetra');
INSERT INTO `aplego_user_meta` VALUES (838, 591, 'token', 'bc4fb16bd91e694e3addab2bfb74afae3cb981f9');
INSERT INTO `aplego_user_meta` VALUES (839, 591, 'jenis_preferensi', 'Lain-lain');
INSERT INTO `aplego_user_meta` VALUES (840, 591, 'jenis_preferensi', 'Typist / Juru Ketik');
INSERT INTO `aplego_user_meta` VALUES (841, 592, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (842, 592, 'jenis_difabel', 'Tunarungu');
INSERT INTO `aplego_user_meta` VALUES (843, 593, 'jenis_preferensi', 'Typist / Juru Ketik');
INSERT INTO `aplego_user_meta` VALUES (844, 593, 'jenis_preferensi', 'Lain-lain');
INSERT INTO `aplego_user_meta` VALUES (845, 572, 'token', '2175cda74b357155082c353a371a1791092e8748');
INSERT INTO `aplego_user_meta` VALUES (850, 594, 'token', '5ebe1d76b4057017a91a6cdd750044ee42bca446');
INSERT INTO `aplego_user_meta` VALUES (851, 595, 'jenis_preferensi', 'Lain-lain');
INSERT INTO `aplego_user_meta` VALUES (852, 595, 'token', '1a233c7386594597eda73d057e24808e25bf707f');
INSERT INTO `aplego_user_meta` VALUES (853, 594, 'jenis_preferensi', 'Lain-lain');
INSERT INTO `aplego_user_meta` VALUES (858, 578, 'jenis_preferensi', 'Bahasa Isyarat Sibi');
INSERT INTO `aplego_user_meta` VALUES (859, 578, 'jenis_preferensi', 'Braille');
INSERT INTO `aplego_user_meta` VALUES (860, 578, 'jenis_preferensi', 'Braille 2');
INSERT INTO `aplego_user_meta` VALUES (861, 578, 'jenis_preferensi', 'Bahasa Isyarat Bisindo');
INSERT INTO `aplego_user_meta` VALUES (862, 578, 'jenis_preferensi', 'Lain-lain');
INSERT INTO `aplego_user_meta` VALUES (863, 578, 'jenis_preferensi', 'Typist / Juru Ketik');
INSERT INTO `aplego_user_meta` VALUES (864, 596, 'jenis_difabel', 'Slow Learner');
INSERT INTO `aplego_user_meta` VALUES (865, 596, 'jenis_difabel', 'Slow Learner');
INSERT INTO `aplego_user_meta` VALUES (866, 597, 'jenis_preferensi', 'Lain-lain');
INSERT INTO `aplego_user_meta` VALUES (867, 597, 'jenis_preferensi', 'Typist / Juru Ketik');
INSERT INTO `aplego_user_meta` VALUES (868, 598, 'jenis_preferensi', 'Lain-lain');
INSERT INTO `aplego_user_meta` VALUES (869, 599, 'jenis_preferensi', 'Lain-lain');
INSERT INTO `aplego_user_meta` VALUES (870, 599, 'jenis_preferensi', 'Typist / Juru Ketik');

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
  INDEX `schedule_student_id`(`schedule_student_id`) USING BTREE,
  INDEX `volunteer_id`(`volunteer_id`) USING BTREE,
  INDEX `semester_id`(`semester_id`) USING BTREE,
  CONSTRAINT `app_accompaniment_ibfk_1` FOREIGN KEY (`schedule_student_id`) REFERENCES `app_schedule_student` (`schedule_student_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `app_accompaniment_ibfk_2` FOREIGN KEY (`volunteer_id`) REFERENCES `app_students` (`student_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `app_accompaniment_ibfk_3` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13280 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_accompaniment
-- ----------------------------
INSERT INTO `app_accompaniment` VALUES (13278, 27, 1694, 397, '2022-06-06', 'terjadwal', 'terjadwal', NULL, NULL, '2022-06-10 10:54:43', '2022-06-10 10:54:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `app_accompaniment` VALUES (13279, 27, 1695, 395, '2022-06-06', 'terjadwal', 'terjadwal', NULL, NULL, '2022-06-10 10:54:43', '2022-06-10 10:54:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for app_faculties
-- ----------------------------
DROP TABLE IF EXISTS `app_faculties`;
CREATE TABLE `app_faculties`  (
  `faculty_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `faculty_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`faculty_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_faculties
-- ----------------------------
INSERT INTO `app_faculties` VALUES (9, 'Fakultas Hukum');
INSERT INTO `app_faculties` VALUES (10, 'Fakultas Ekonomi dan Bisnis');
INSERT INTO `app_faculties` VALUES (11, 'Fakultas Ilmu Administrasi');
INSERT INTO `app_faculties` VALUES (12, 'Fakultas Pertanian');
INSERT INTO `app_faculties` VALUES (13, 'Fakultas Peternakan');
INSERT INTO `app_faculties` VALUES (14, 'Fakultas Teknik');
INSERT INTO `app_faculties` VALUES (15, 'Fakultas Kedokteran');
INSERT INTO `app_faculties` VALUES (16, 'Fakultas Perikanan dan Ilmu Kelautan');
INSERT INTO `app_faculties` VALUES (17, 'Fakultas MIPA');
INSERT INTO `app_faculties` VALUES (18, 'Fakultas Teknologi Pertanian');
INSERT INTO `app_faculties` VALUES (19, 'Fakultas Ilmu Sosial dan Ilmu Politik');
INSERT INTO `app_faculties` VALUES (20, 'Fakultas Ilmu Budaya');
INSERT INTO `app_faculties` VALUES (21, 'Fakultas Kedokteran Hewan');
INSERT INTO `app_faculties` VALUES (22, 'Fakultas Ilmu Komputer');
INSERT INTO `app_faculties` VALUES (23, 'Program Vokasi');
INSERT INTO `app_faculties` VALUES (24, 'Magister - Program Studi Pascasarjana');
INSERT INTO `app_faculties` VALUES (25, 'Doktor');

-- ----------------------------
-- Table structure for app_majors
-- ----------------------------
DROP TABLE IF EXISTS `app_majors`;
CREATE TABLE `app_majors`  (
  `majors_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `faculty_id` int UNSIGNED NOT NULL,
  `majors_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `majors_focus` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`majors_id`) USING BTREE,
  INDEX `faculty_id`(`faculty_id`) USING BTREE,
  CONSTRAINT `app_majors_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `app_faculties` (`faculty_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_majors
-- ----------------------------
INSERT INTO `app_majors` VALUES (17, 9, 'Ilmu Hukum', NULL);
INSERT INTO `app_majors` VALUES (18, 10, 'Ekonomi Pembangunan', NULL);
INSERT INTO `app_majors` VALUES (19, 10, 'Ekonomi Islam', NULL);
INSERT INTO `app_majors` VALUES (20, 10, 'Manajemen', NULL);
INSERT INTO `app_majors` VALUES (21, 10, 'Akuntansi', NULL);
INSERT INTO `app_majors` VALUES (22, 10, 'Kewirausahaan', NULL);
INSERT INTO `app_majors` VALUES (23, 10, 'Ekonomi, Keuangan, dan Perbankan', NULL);
INSERT INTO `app_majors` VALUES (24, 11, 'Ilmu Administrasi Publik', NULL);
INSERT INTO `app_majors` VALUES (25, 11, 'Ilmu Administrasi Bisnis', NULL);
INSERT INTO `app_majors` VALUES (26, 11, 'Administrasi Perpajakan', NULL);
INSERT INTO `app_majors` VALUES (27, 11, 'Ilmu Perpustakaan', NULL);
INSERT INTO `app_majors` VALUES (28, 11, 'Pariwisata', NULL);
INSERT INTO `app_majors` VALUES (29, 11, 'Administrasi Pendidikan', NULL);
INSERT INTO `app_majors` VALUES (30, 12, 'Agroekoteknologi', NULL);
INSERT INTO `app_majors` VALUES (31, 12, 'Agribisnis', NULL);
INSERT INTO `app_majors` VALUES (32, 13, 'Peternakan', NULL);
INSERT INTO `app_majors` VALUES (33, 14, 'Teknik Sipil', NULL);
INSERT INTO `app_majors` VALUES (34, 14, 'Teknik Industri', NULL);
INSERT INTO `app_majors` VALUES (35, 14, 'Teknik Elektro', NULL);
INSERT INTO `app_majors` VALUES (36, 14, 'Arsitektur', NULL);
INSERT INTO `app_majors` VALUES (37, 14, 'Teknik Pengairan', NULL);
INSERT INTO `app_majors` VALUES (38, 14, 'Perencanaan Wilayah dan Kota', NULL);
INSERT INTO `app_majors` VALUES (39, 14, 'Teknik Mesin', NULL);
INSERT INTO `app_majors` VALUES (40, 14, 'Teknik Kimia', NULL);
INSERT INTO `app_majors` VALUES (41, 15, 'Pendidikan Dokter', NULL);
INSERT INTO `app_majors` VALUES (42, 15, 'Pendidikan Dokter Gigi', NULL);
INSERT INTO `app_majors` VALUES (43, 15, 'Ilmu Keperawatan', NULL);
INSERT INTO `app_majors` VALUES (44, 15, 'Gizi Kesehatan/Ilmu Gizi', NULL);
INSERT INTO `app_majors` VALUES (45, 15, 'Kebidanan', NULL);
INSERT INTO `app_majors` VALUES (46, 15, 'Farmasi', NULL);
INSERT INTO `app_majors` VALUES (47, 16, 'Manajemen Sumberdaya Perairan', NULL);
INSERT INTO `app_majors` VALUES (48, 16, 'Budidaya Perairan', NULL);
INSERT INTO `app_majors` VALUES (49, 16, 'Teknologi Hasil Perikanan', NULL);
INSERT INTO `app_majors` VALUES (50, 16, 'Pemanfaatan Sumberdaya Perikanan', NULL);
INSERT INTO `app_majors` VALUES (51, 16, 'Ilmu Kelautan', NULL);
INSERT INTO `app_majors` VALUES (52, 16, 'Agrobisnis Perikanan', NULL);
INSERT INTO `app_majors` VALUES (53, 17, 'Biologi', NULL);
INSERT INTO `app_majors` VALUES (54, 17, 'Fisika', NULL);
INSERT INTO `app_majors` VALUES (55, 17, 'Kimia', NULL);
INSERT INTO `app_majors` VALUES (56, 17, 'Matematika', NULL);
INSERT INTO `app_majors` VALUES (57, 17, 'Statistika', NULL);
INSERT INTO `app_majors` VALUES (58, 17, 'Teknik Geofisika', NULL);
INSERT INTO `app_majors` VALUES (59, 17, 'Instrumentasi', NULL);
INSERT INTO `app_majors` VALUES (60, 18, 'Ilmu dan Teknologi Pangan', NULL);
INSERT INTO `app_majors` VALUES (61, 18, 'Keteknikan Pertanian', NULL);
INSERT INTO `app_majors` VALUES (62, 18, 'Teknologi Industri Pertanian', NULL);
INSERT INTO `app_majors` VALUES (63, 18, 'Bioteknologi', NULL);
INSERT INTO `app_majors` VALUES (64, 18, 'Teknik Lingkungan', NULL);
INSERT INTO `app_majors` VALUES (65, 18, 'Teknologi Bioproses', NULL);
INSERT INTO `app_majors` VALUES (66, 19, 'Sosiologi', NULL);
INSERT INTO `app_majors` VALUES (67, 19, 'Ilmu Komunikasi', NULL);
INSERT INTO `app_majors` VALUES (68, 19, 'Psikologi', NULL);
INSERT INTO `app_majors` VALUES (69, 19, 'Hubungan Internasional2', NULL);
INSERT INTO `app_majors` VALUES (70, 19, 'Ilmu Politik', NULL);
INSERT INTO `app_majors` VALUES (71, 19, 'Ilmu Pemerintahan', NULL);
INSERT INTO `app_majors` VALUES (72, 20, 'Sastra Inggris', NULL);
INSERT INTO `app_majors` VALUES (73, 20, 'Sastra Jepang', NULL);
INSERT INTO `app_majors` VALUES (74, 20, 'Bahasa dan Sastra Perancis', NULL);
INSERT INTO `app_majors` VALUES (75, 20, 'Sastra Cina', NULL);
INSERT INTO `app_majors` VALUES (76, 20, 'Pendidikan Bahasa & Sastra Indonesia', NULL);
INSERT INTO `app_majors` VALUES (77, 20, 'Pendidikan Bahasa Inggris', NULL);
INSERT INTO `app_majors` VALUES (78, 20, 'Pendidikan Bahasa Jepang', NULL);
INSERT INTO `app_majors` VALUES (79, 20, 'Seni Rupa Murni', NULL);
INSERT INTO `app_majors` VALUES (80, 20, 'Antropologi', NULL);
INSERT INTO `app_majors` VALUES (81, 21, 'Pendidikan Dokter Hewan', NULL);
INSERT INTO `app_majors` VALUES (82, 22, 'Teknik Informatika', NULL);
INSERT INTO `app_majors` VALUES (83, 22, 'Sistem Informasi', NULL);
INSERT INTO `app_majors` VALUES (84, 22, 'Pendidikan Teknologi Informasi', NULL);
INSERT INTO `app_majors` VALUES (85, 22, 'Teknologi Informasi', NULL);
INSERT INTO `app_majors` VALUES (86, 22, 'Teknik Komputer', NULL);
INSERT INTO `app_majors` VALUES (87, 23, 'D4 - Manajemen Perhotelan', NULL);
INSERT INTO `app_majors` VALUES (88, 23, 'D4 - Desain Grafis', NULL);
INSERT INTO `app_majors` VALUES (89, 23, 'Bidang Keahlian Sekretaris', NULL);
INSERT INTO `app_majors` VALUES (90, 23, 'Bidang Keahlian Public Relation', NULL);
INSERT INTO `app_majors` VALUES (91, 23, 'Bidang Keahlian Bahasa Inggris', NULL);
INSERT INTO `app_majors` VALUES (92, 23, 'Bidang Keahlian Perpustakaan dan Arsip', NULL);
INSERT INTO `app_majors` VALUES (93, 23, 'Bidang Keahlian Perancangan Peraturan dan Kontrak Bisnis', NULL);
INSERT INTO `app_majors` VALUES (94, 23, 'Bidang Keahlian Perbankan', NULL);
INSERT INTO `app_majors` VALUES (95, 23, 'Bidang Keahlian Akutansi Terapan', NULL);
INSERT INTO `app_majors` VALUES (96, 23, 'Bidang Keahlian Manajemen Informatika', NULL);
INSERT INTO `app_majors` VALUES (97, 23, 'Bidang Keahlian Manajemen Informatika Bisnis & Multimedia', NULL);
INSERT INTO `app_majors` VALUES (98, 23, 'Bidang Keahlian Teknologi Informasi dan Komputer', NULL);
INSERT INTO `app_majors` VALUES (99, 23, 'Bidang Keahlian Desain Komunikasi Visual', NULL);
INSERT INTO `app_majors` VALUES (100, 23, 'Bidang Keahlian Film dan Televisi', NULL);
INSERT INTO `app_majors` VALUES (101, 23, 'Bidang Keahlian Desain Interior', NULL);
INSERT INTO `app_majors` VALUES (102, 23, 'Bidang Keahlian Pariwisata', NULL);
INSERT INTO `app_majors` VALUES (103, 23, 'Bidang Keahlian Perhotelan', NULL);
INSERT INTO `app_majors` VALUES (104, 23, 'Bidang Keahlian Perpajakan', NULL);
INSERT INTO `app_majors` VALUES (105, 24, 'S2 - Ilmu Lingkungan', NULL);
INSERT INTO `app_majors` VALUES (106, 24, 'S2 - Studi Pertanahan', NULL);
INSERT INTO `app_majors` VALUES (107, 24, 'S2 - Kajian Gender', NULL);
INSERT INTO `app_majors` VALUES (108, 25, 'S3 - Ilmu Lingkungan', NULL);
INSERT INTO `app_majors` VALUES (109, 25, 'S3 - Studi Pertanahan', NULL);
INSERT INTO `app_majors` VALUES (110, 24, 'S2 - Budidaya Perairan', NULL);
INSERT INTO `app_majors` VALUES (111, 25, 'contoh', 'SAINTEK');

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
  INDEX `payout_id`(`payout_id`) USING BTREE,
  INDEX `volunteer_id`(`volunteer_id`) USING BTREE,
  INDEX `paid_confirm_id`(`paid_confirm_id`) USING BTREE,
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
  INDEX `user_id`(`user_id`) USING BTREE,
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
  INDEX `accompaniment_id`(`accompaniment_id`) USING BTREE,
  INDEX `semester_id`(`semester_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  CONSTRAINT `app_permit_ibfk_1` FOREIGN KEY (`accompaniment_id`) REFERENCES `app_accompaniment` (`accompaniment_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `app_permit_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `app_permit_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 287 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

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
  INDEX `student_id`(`student_id`) USING BTREE,
  INDEX `semester_id`(`semester_id`) USING BTREE,
  CONSTRAINT `app_schedule_student_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_schedule_student_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1698 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_schedule_student
-- ----------------------------
INSERT INTO `app_schedule_student` VALUES (1690, 370, 27, NULL, '08:00:00', '12:00:00', 1, NULL, 'Gd E Filkom', 'Sistem Informasi', 4, 'kuliah', 'false');
INSERT INTO `app_schedule_student` VALUES (1691, 370, 27, NULL, '09:00:00', '13:00:00', 2, NULL, 'Gd B', 'filkom', 3, 'kuliah', 'false');
INSERT INTO `app_schedule_student` VALUES (1692, 370, 27, NULL, '09:00:00', '12:00:00', NULL, '2022-06-13', 'filkom b', 'mk', 3, 'uas', 'false');
INSERT INTO `app_schedule_student` VALUES (1693, 370, 27, NULL, '09:00:00', '12:00:00', NULL, '2022-06-14', '-', '-', 3, 'uas', 'false');
INSERT INTO `app_schedule_student` VALUES (1694, 450, 27, NULL, '06:00:00', '09:00:00', 1, NULL, 'Ruanga', 'MK 1', 3, 'kuliah', 'false');
INSERT INTO `app_schedule_student` VALUES (1695, 450, 27, NULL, '10:00:00', '12:00:00', 1, NULL, 'ruangan', 'MK2', 3, 'kuliah', 'false');
INSERT INTO `app_schedule_student` VALUES (1696, 450, 27, NULL, '09:00:00', '12:00:00', NULL, '2022-06-14', 'Lala', 'MK', 3, 'uas', 'false');
INSERT INTO `app_schedule_student` VALUES (1697, 450, 27, NULL, '09:00:00', '12:00:00', NULL, '2022-06-13', 'ruangan', 'mk 2', 3, 'uas', 'false');

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
  INDEX `student_id`(`student_id`) USING BTREE,
  INDEX `semester_id`(`semester_id`) USING BTREE,
  CONSTRAINT `app_schedule_student_rev_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_schedule_student_rev_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1700 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_schedule_student_rev
-- ----------------------------
INSERT INTO `app_schedule_student_rev` VALUES (1699, 370, 27, 1, '10:00:00', '13:00:00', 1, 'ruangan', 'mk 1', 3, 'kuliah', 'false');

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
  INDEX `student_id`(`student_id`) USING BTREE,
  INDEX `semester_id`(`semester_id`) USING BTREE,
  CONSTRAINT `app_schedule_volunteer_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_schedule_volunteer_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4069 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_schedule_volunteer
-- ----------------------------
INSERT INTO `app_schedule_volunteer` VALUES (4063, 397, 27, '14:00:00', '16:00:00', 1, NULL, 'Kuliah', 'kuliah', '-', 'false');
INSERT INTO `app_schedule_volunteer` VALUES (4064, 397, 27, '10:00:00', '14:00:00', 2, NULL, 'Kuliah', 'kuliah', '-', 'false');
INSERT INTO `app_schedule_volunteer` VALUES (4065, 397, 27, '09:00:00', '12:00:00', NULL, '2022-06-13', 'ujian uas', 'uas', 'lala', 'false');
INSERT INTO `app_schedule_volunteer` VALUES (4066, 397, 27, '14:00:00', '16:00:00', NULL, '2022-06-14', 'ujian', 'uas', '-', 'false');
INSERT INTO `app_schedule_volunteer` VALUES (4067, 395, 27, '06:00:00', '09:00:00', 2, NULL, 'mk 1', 'kuliah', 'ruangan', 'false');
INSERT INTO `app_schedule_volunteer` VALUES (4068, 395, 27, '10:00:00', '12:00:00', 2, NULL, 'mk 2', 'kuliah', 'ruangan', 'false');

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
  `date` date NULL DEFAULT NULL,
  `clarification` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `schedule_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'kuliah',
  `room` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'kosong',
  `deleted` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'false',
  PRIMARY KEY (`schedule_volunteer_rev_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  INDEX `semester_id`(`semester_id`) USING BTREE,
  CONSTRAINT `app_schedule_volunteer_rev_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_schedule_volunteer_rev_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_schedule_volunteer_rev
-- ----------------------------
INSERT INTO `app_schedule_volunteer_rev` VALUES (2, 397, 27, 1, '10:00:00', '13:00:00', 1, NULL, 'lalal', 'kuliah', 'lalaal', 'false');

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
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_semester
-- ----------------------------
INSERT INTO `app_semester` VALUES (27, 'Semester Genap 2021/2022', '2022-02-07', '2022-07-22', '2022-05-23', '2022-06-03', '2022-07-08', '2022-07-22');

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
  INDEX `student_id`(`student_id`) USING BTREE,
  INDEX `semester_id`(`semester_id`) USING BTREE,
  INDEX `approver_id`(`approver_id`) USING BTREE,
  CONSTRAINT `app_student_active_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_student_active_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_student_active_ibfk_3` FOREIGN KEY (`approver_id`) REFERENCES `aplego_user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 641 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_student_active
-- ----------------------------
INSERT INTO `app_student_active` VALUES (637, 370, 27, NULL, '2022-06-03 10:53:34', NULL, NULL, 0, '2022-06-10 19:00:45');
INSERT INTO `app_student_active` VALUES (638, 397, 27, 1, '2022-06-03 10:54:54', NULL, NULL, 0, NULL);
INSERT INTO `app_student_active` VALUES (639, 450, 27, 1, '2022-06-10 10:22:00', NULL, NULL, 0, NULL);
INSERT INTO `app_student_active` VALUES (640, 395, 27, 1, '2022-06-10 10:34:59', NULL, NULL, 0, NULL);

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
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `majors_id`(`majors_id`) USING BTREE,
  CONSTRAINT `app_students_ibfk_2` FOREIGN KEY (`majors_id`) REFERENCES `app_majors` (`majors_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 594 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_students
-- ----------------------------
INSERT INTO `app_students` VALUES (16, 11, 21, 'febrina3', 2016, '08564643334', 'uploads/1567215735503.png', NULL, NULL);
INSERT INTO `app_students` VALUES (17, 12, 65, 'Ghani', 2015, '0121', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (18, 13, 64, 'farhan', 2015, '0121', 'uploads/1567216198263.png', NULL, NULL);
INSERT INTO `app_students` VALUES (19, 14, 63, 'Nama Panggilan', 2017, '085 201', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (20, 15, 21, 'Ilhamm', 2016, '0856464', 'uploads/1567215798634.png', NULL, NULL);
INSERT INTO `app_students` VALUES (21, 16, 19, 'Sekar', 2015, '09876', 'uploads/1567216010617.png', NULL, NULL);
INSERT INTO `app_students` VALUES (22, 17, 18, 'difa', 2017, '087', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (23, 18, 21, 'vovo', 2017, '098123123', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (27, 22, 18, 'Difabel', 2017, '098', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (29, 24, 19, 'vovo', 2018, '839', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (31, 26, 18, 'Difabel', 2017, '098', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (32, 28, 82, 'Mahasiswa', 2013, '08123456789', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (33, 29, 21, 'test', 2016, '0856464', 'uploads/logo22.png', NULL, NULL);
INSERT INTO `app_students` VALUES (34, 30, 82, 'Farhan', 2016, '08454512323', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (35, 31, 21, 'test', 2016, '656598980000', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (36, 32, 19, 'satu', 2014, '081228534015', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (37, 33, 54, 'Erna', 2018, '089643526178', 'uploads/Erna.png', NULL, NULL);
INSERT INTO `app_students` VALUES (38, 34, 32, 'Desy', 2015, '081330145131', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (39, 35, 54, 'Ocha', 2018, '085357649087', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (40, 36, 68, 'Fahri', 2015, '087887017043', 'uploads/Fahri.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (41, 37, 33, 'Mila', 2017, '082332626753', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (42, 38, 19, 'Atiqa', 2017, '087712673432', 'uploads/1580139936096.png', NULL, NULL);
INSERT INTO `app_students` VALUES (43, 39, 81, 'Kiki', 2015, '081216801631', 'uploads/Kiki.JPG', NULL, NULL);
INSERT INTO `app_students` VALUES (44, 40, 52, 'Farah', 2015, '085336386232', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (45, 41, 60, 'Izza', 2016, '+6282333151142', 'uploads/1580340982431.png', NULL, NULL);
INSERT INTO `app_students` VALUES (46, 42, 30, 'Nabila', 2018, '0822619912121', 'uploads/1582084410960.png', NULL, NULL);
INSERT INTO `app_students` VALUES (47, 43, 66, 'Livia', 2017, '081906061739 ', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (48, 44, 47, 'Mitha', 2016, '089677463443', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (49, 45, 18, 'Ruli', 2015, '081252689393', 'uploads/Ruli.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (50, 46, 23, 'Tira', 2019, '085263360390', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (51, 47, 66, 'Afifah', 2017, '081235203591', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (52, 48, 73, 'TARIS', 2015, '081334952865', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (53, 49, 27, 'Alfa', 2016, '082330281455', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (54, 50, 65, 'Wafa', 2018, '085797115080', 'uploads/Wafa.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (55, 51, 32, 'Salsa', 2017, '081249036244', 'uploads/1582732192977.png', NULL, NULL);
INSERT INTO `app_students` VALUES (56, 52, 77, 'Galuh', 2016, '088227050817', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (57, 53, 87, 'Fina', 2017, '082338944421', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (58, 54, 25, 'Nabilla', 2018, '081315173919', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (59, 55, 25, 'Dani', 2017, '082231858681', 'uploads/1580046141045.png', NULL, NULL);
INSERT INTO `app_students` VALUES (60, 56, 38, 'Bilkish', 2017, '081632235114', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (61, 57, 34, 'Astri', 2019, '087880774782', 'uploads/Astri1.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (62, 58, 57, 'Titi', 2016, '08972123223', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (63, 59, 27, 'Rizky', 2019, '08980484335', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (64, 60, 17, 'Ata /bharata', 2017, '085813898354', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (65, 61, 67, 'GERRY', 2018, '081296382664', 'uploads/GERRY1.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (66, 62, 82, 'Harun', 2016, '081335055105', 'uploads/1567235580972.png', NULL, NULL);
INSERT INTO `app_students` VALUES (67, 63, 30, 'Nanda', 2014, '089698014434', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (68, 64, 19, 'Dicky', 2019, '085933130594', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (69, 65, 77, 'Fajar', 2018, '081336005447', 'uploads/Fajar1.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (70, 66, 27, 'Pungky', 2016, '082330071135', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (71, 67, 24, 'Shinta ', 2018, '082335674768 ', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (72, 68, 69, 'Fajrin syam', 2017, '081341503023', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (73, 69, 84, 'Kharis', 2016, '083848032312', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (74, 70, 66, 'Raya', 2017, '085801608985', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (75, 71, 82, 'Harun', 2016, '081336055105', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (76, 72, 17, 'Stannis ', 2016, '081123456789', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (77, 73, 19, 'Kiki', 2017, '085855570531', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (78, 74, 19, 'Cindy', 2017, '082333435757', 'uploads/1583397744021.png', NULL, NULL);
INSERT INTO `app_students` VALUES (79, 75, 98, 'Rina', 2017, '085880451954', 'uploads/Rina1.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (80, 76, 82, 'Harun', 2016, '081336055105', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (81, 77, 68, 'Hafidh', 2018, '087823813250', 'uploads/1568141681041.png', NULL, NULL);
INSERT INTO `app_students` VALUES (82, 78, 48, 'Ika', 2017, '087859110767', 'uploads/1580178564743.png', NULL, NULL);
INSERT INTO `app_students` VALUES (83, 79, 26, 'Wahyu', 2016, '085793006781 ', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (84, 80, 69, 'Vina I', 2018, '088228730291', 'uploads/1576153496859.png', NULL, NULL);
INSERT INTO `app_students` VALUES (85, 81, 47, 'Wahyu', 2013, '083831239109', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (86, 82, 20, 'Adhi', 2018, '081344669728', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (87, 83, 30, 'Ghani', 2013, '083856980803', 'uploads/1580035797043.png', NULL, NULL);
INSERT INTO `app_students` VALUES (88, 84, 68, 'Vici', 2017, '081311185140', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (89, 85, 68, 'Nao', 2018, '081338990605', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (90, 86, 61, 'Redit', 2016, '081358450963', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (91, 87, 21, 'Raka', 2018, '081316991190', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (92, 88, 57, 'Rin', 2015, '081233642827', 'uploads/1580952799637.png', NULL, NULL);
INSERT INTO `app_students` VALUES (93, 89, 17, 'Dilla', 2017, '085604129358', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (94, 90, 58, 'INTAN', 2018, '085648464149', 'uploads/1568180283204.png', NULL, NULL);
INSERT INTO `app_students` VALUES (95, 91, 66, 'Farah', 2016, '087783006828', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (96, 92, 68, 'Mutya', 2015, '085755590672', 'uploads/1581080334247.png', NULL, NULL);
INSERT INTO `app_students` VALUES (97, 93, 28, 'Irfan ', 2017, '081334712019', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (98, 94, 84, 'RTS', 2016, '08125604687 ', 'uploads/1582482462255.png', NULL, NULL);
INSERT INTO `app_students` VALUES (99, 95, 77, 'Amy ', 2016, '085646364307', 'uploads/1580037627091.png', NULL, NULL);
INSERT INTO `app_students` VALUES (100, 96, 59, 'Dina', 2016, '081249597608', 'uploads/1580995375334.png', NULL, NULL);
INSERT INTO `app_students` VALUES (101, 97, 71, 'Abi', 2017, '085814623350', 'uploads/1580043124166.png', NULL, NULL);
INSERT INTO `app_students` VALUES (102, 98, 76, 'Dhani', 2019, '089654997258', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (103, 99, 76, 'Agung', 2017, '085730881986', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (104, 100, 31, 'Irdham', 2019, 'Irdham Reihansy', 'uploads/1580036161484.png', NULL, NULL);
INSERT INTO `app_students` VALUES (105, 101, 92, 'Reza', 2019, '085788749497', 'uploads/1580070662565.png', NULL, NULL);
INSERT INTO `app_students` VALUES (106, 102, 36, 'Almer', 2018, '081259672571', 'uploads/1581673427833.png', NULL, NULL);
INSERT INTO `app_students` VALUES (107, 103, 17, 'AL', 2018, '08970989896', 'uploads/1580260264468.png', NULL, NULL);
INSERT INTO `app_students` VALUES (108, 104, 82, 'Fayo', 2017, '081617061510', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (109, 105, 82, 'Adhi', 2017, '082331821877', 'uploads/Adhi.JPG', NULL, NULL);
INSERT INTO `app_students` VALUES (110, 106, 95, 'agni', 2016, '12345', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (111, 107, 17, 'Wahyu', 2016, '082141556605', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (112, 108, 77, 'Zizi', 2016, 'Luthfi Nur Aziz', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (113, 109, 66, 'Mahalli', 2010, '082330725359', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (114, 112, 65, 'Surya', 2018, '085720494272', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (115, 113, 68, 'Desi', 2016, '089628022968', 'uploads/1592991417710.png', NULL, NULL);
INSERT INTO `app_students` VALUES (116, 114, 75, 'Aziz', 2017, '083861770751', 'uploads/1580104095710.png', NULL, NULL);
INSERT INTO `app_students` VALUES (117, 115, 88, 'Elo', 2019, '082147370980', 'uploads/1576153685963.png', NULL, NULL);
INSERT INTO `app_students` VALUES (118, 116, 26, 'Fairus', 2016, '085815866032', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (119, 117, 30, 'Tasya', 2018, '083182646760', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (120, 118, 82, 'Wilis', 2017, '082257850437', 'uploads/1579239133246.png', NULL, NULL);
INSERT INTO `app_students` VALUES (121, 119, 17, 'Lintang', 2018, '081231908188', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (122, 120, 27, 'Diah', 2016, '089659291519', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (123, 121, 21, 'Vina', 2017, '081237273592', 'uploads/Vina.jpeg', NULL, NULL);
INSERT INTO `app_students` VALUES (124, 122, 50, 'Ika Pebina', 2016, '082211734398', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (125, 123, 76, 'Ilma', 2017, '081216449924', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (126, 124, 67, 'Hervita/ Vita', 2017, '+6281236436187', 'uploads/Hervita_Vita.jpeg', NULL, NULL);
INSERT INTO `app_students` VALUES (127, 125, 21, 'Yara', 2016, '089635228705', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (128, 126, 30, 'Asdot', 2016, '081213842811', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (129, 127, 82, 'Tata', 2017, '082298935855', 'uploads/1582757920559.png', NULL, NULL);
INSERT INTO `app_students` VALUES (130, 128, 98, 'Juluan', 2019, '082199233448', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (131, 129, 67, 'Dewa', 2019, '6282140774412', 'uploads/1579228950157.png', NULL, NULL);
INSERT INTO `app_students` VALUES (132, 130, 99, 'Fathur', 2019, '08971433183', 'uploads/1580886249771.png', NULL, NULL);
INSERT INTO `app_students` VALUES (133, 131, 31, 'Yanda', 2013, '081377161465', 'uploads/Yanda.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (134, 132, 82, 'Duwik', 2019, '082257802234', 'uploads/1579859238091.png', NULL, NULL);
INSERT INTO `app_students` VALUES (135, 133, 68, 'Afif ', 2019, '082330375399', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (136, 134, 17, 'Diffa\'', 2019, '085607505095', 'uploads/1580208985157.png', NULL, NULL);
INSERT INTO `app_students` VALUES (137, 135, 32, 'Dila', 2015, '081649521828', 'uploads/1580279644923.png', NULL, NULL);
INSERT INTO `app_students` VALUES (138, 136, 67, 'Aisyah', 2017, '082139806594', 'uploads/Aisyah.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (139, 137, 23, 'Eva', 2017, '085708450959', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (140, 141, 96, 'Faiz', 2019, '081210845080', 'uploads/1580718374239.png', NULL, NULL);
INSERT INTO `app_students` VALUES (141, 142, 32, 'Azizah', 2018, '085329933957', 'uploads/1579232719404.png', NULL, NULL);
INSERT INTO `app_students` VALUES (142, 143, 82, 'Ilham', 2019, '081277877855', 'uploads/1580219946789.png', NULL, NULL);
INSERT INTO `app_students` VALUES (143, 144, 50, 'Shofia', 2015, '6281216200604', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (144, 145, 66, 'Reni', 2017, '082257287184', 'uploads/1580104045765.png', NULL, NULL);
INSERT INTO `app_students` VALUES (145, 146, 57, 'Adit', 2016, '085235348592', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (146, 147, 88, 'Yosua', 2017, '081331470638', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (147, 149, 21, 'contoh', 2002, '085000000001', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (148, 150, 22, 'Manusia', 2004, '081111111110', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (149, 151, 68, 'Markus', 2017, '081358357402', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (150, 152, 98, 'Hany (TULI)', 2018, '081364282532', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (151, 153, 36, 'Fathi', 2017, '081234266269', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (152, 154, 30, 'Nana', 2017, '089664589801', 'uploads/1580714739261.png', NULL, NULL);
INSERT INTO `app_students` VALUES (153, 155, 82, 'Fayo Bukan Tuna Netra', 2017, '081617061510', 'uploads/1580263456397.png', NULL, NULL);
INSERT INTO `app_students` VALUES (154, 156, 27, 'Diah', 2016, 'Diah Lutfiani', 'uploads/1579739955857.png', NULL, NULL);
INSERT INTO `app_students` VALUES (155, 157, 67, 'Afi', 2018, '082335990566', 'uploads/1579509311116.png', NULL, NULL);
INSERT INTO `app_students` VALUES (156, 158, 69, 'Fajrin', 2017, '081341503022', 'uploads/1581992255998.png', NULL, NULL);
INSERT INTO `app_students` VALUES (157, 159, 97, 'Hendra', 2018, '082111241961', 'uploads/1580037826854.png', NULL, NULL);
INSERT INTO `app_students` VALUES (158, 160, 79, 'Ainur', 2017, '088217167905', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (159, 161, 71, 'Ririn', 2016, '085711727325', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (160, 162, 47, 'azna', 2016, '0895335335744 ', 'uploads/1580209262270.png', NULL, NULL);
INSERT INTO `app_students` VALUES (161, 163, 60, 'Shelby', 2016, '082216181413', 'uploads/Shelby.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (162, 164, 66, 'Lenny', 2015, '085645129930', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (163, 165, 82, 'Ben', 2016, '085788387939', 'uploads/1586195290939.png', NULL, NULL);
INSERT INTO `app_students` VALUES (164, 166, 92, 'Arukan | Arkan', 2019, '088211356910', 'uploads/1582585681574.png', NULL, NULL);
INSERT INTO `app_students` VALUES (165, 167, 31, 'Nadia', 2017, '087754198238', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (166, 168, 98, 'Togar', 2019, '081371854723', 'uploads/Togar.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (167, 169, 76, 'Weni', 2016, '085607425465', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (168, 170, 98, 'Julian', 2019, '082199233448', 'uploads/1579863601398.png', NULL, NULL);
INSERT INTO `app_students` VALUES (169, 171, 76, 'Ikfi', 2016, '081233470236', 'uploads/1580044534836.png', NULL, NULL);
INSERT INTO `app_students` VALUES (170, 172, 76, 'Linda', 2016, '085735652450', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (171, 173, 68, 'Febrina', 2018, '089666297091', 'uploads/1581249060258.png', NULL, NULL);
INSERT INTO `app_students` VALUES (172, 174, 79, 'Novan', 2016, '081331703209', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (173, 175, 79, 'Sul', 2017, '089610461513', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (174, 176, 98, 'Bob', 2018, '083111962567', 'uploads/1587345471485.png', NULL, NULL);
INSERT INTO `app_students` VALUES (175, 177, 79, 'Triadi', 2016, '081265433150', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (176, 178, 54, 'Idah', 2018, '085850604706', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (177, 179, 99, 'Faiq', 2017, '08885262784', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (178, 180, 70, 'hani', 2019, '081259514375', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (179, 181, 82, 'Elsa / Echa', 2019, '08119005470', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (180, 182, 82, 'Alin', 2019, '085646822064', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (181, 183, 82, 'Sela', 2019, '081246912477', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (182, 184, 71, 'JAKI', 2018, '082136000422', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (183, 185, 68, 'Alvia', 2019, '0816878020', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (184, 186, 30, 'Irawan', 2018, '089502207090', 'uploads/1583944195069.png', NULL, NULL);
INSERT INTO `app_students` VALUES (185, 187, 82, 'Afifah ', 2017, '085752298700', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (186, 188, 82, 'Tomi', 2017, '082231551009', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (187, 189, 26, 'Ryan', 2019, '082161318181', 'uploads/1584350099514.png', NULL, NULL);
INSERT INTO `app_students` VALUES (188, 190, 27, 'Gadis', 2016, '082232032701', 'uploads/Gadis.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (189, 191, 17, 'Inas', 2019, '081358234649', 'uploads/1584177088124.png', NULL, NULL);
INSERT INTO `app_students` VALUES (190, 192, 77, 'Discha', 2018, '083112277887', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (191, 193, 82, 'Shabira', 2019, '085338667243', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (192, 194, 55, 'Aldo', 2017, '081908972311', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (193, 195, 25, 'RIMA', 2015, '085857355562', 'uploads/1583915648616.png', NULL, NULL);
INSERT INTO `app_students` VALUES (194, 196, 66, 'Ani', 2015, '085604775418', 'uploads/1584235553366.png', NULL, NULL);
INSERT INTO `app_students` VALUES (195, 197, 67, 'Sulis', 2019, '089688387537', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (196, 198, 57, 'Ifa ', 2018, '087859280805', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (197, 199, 30, 'Hana', 2016, '081717376602', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (198, 200, 67, 'INDAH', 2018, '085645840959', 'uploads/INDAH.jpeg', NULL, NULL);
INSERT INTO `app_students` VALUES (199, 201, 68, 'Novela', 2018, '08553010580', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (200, 202, 66, 'Nona', 2016, '085645079706', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (201, 203, 66, 'Sinta', 2017, '081269641923', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (202, 204, 97, 'Aghna', 2019, '085747191546', 'uploads/1584385935346.png', NULL, NULL);
INSERT INTO `app_students` VALUES (203, 205, 54, 'Nuha', 2018, '083807300340 ', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (204, 206, 54, 'Ima', 2018, '082336591946', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (205, 207, 32, 'Ike', 2017, '081292370204', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (206, 208, 30, 'Wahyu/ Indri', 2017, '085731743715', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (207, 209, 17, 'Agia', 2019, '085361423738', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (208, 210, 20, 'Aufa', 2019, '085104552058', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (209, 211, 66, 'Devina', 2019, '083854945065', 'uploads/1584399797655.png', NULL, NULL);
INSERT INTO `app_students` VALUES (210, 212, 55, 'Nanda', 2018, '087841691726', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (211, 213, 90, 'Nau', 2019, '082167038049', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (212, 214, 100, 'Iffa', 2019, '082231178728', 'uploads/1584267385830.png', NULL, NULL);
INSERT INTO `app_students` VALUES (213, 215, 100, 'Momo', 2019, '087804487892', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (214, 216, 54, 'Elsa', 2018, '082236610107', 'uploads/1584354170579.png', NULL, NULL);
INSERT INTO `app_students` VALUES (215, 217, 54, 'Adh', 2018, '0895803848923', 'uploads/Adh.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (216, 218, 30, 'Qowim', 2018, '089635543628', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (217, 219, 30, 'Handy', 2018, '089654451467', 'uploads/1585490163003.png', NULL, NULL);
INSERT INTO `app_students` VALUES (218, 220, 30, 'Azizah', 2018, '089635392118', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (219, 221, 67, 'Maesti', 2019, '082147569782', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (220, 222, 68, 'Ratih', 2019, '081903991005', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (221, 223, 77, 'Yaya', 2018, '085749100128', 'uploads/Yaya.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (222, 224, 77, 'SHINTA', 2017, '08989550215', 'uploads/SHINTA.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (223, 225, 58, 'Zen', 2018, '085741760322', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (224, 226, 68, 'Novi', 2015, '082113082196', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (225, 227, 43, 'Shafa', 2019, '082126633624', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (226, 228, 68, 'Wafa qa', 2018, '089693411817', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (227, 229, 66, 'Zaki', 2017, '081289071935', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (228, 230, 36, 'Tya', 2017, '081808171270', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (229, 231, 36, 'Hima', 2017, '085748420874', 'uploads/Hima1.jpeg', NULL, NULL);
INSERT INTO `app_students` VALUES (230, 232, 77, 'Tika / Ruby', 2016, '085655271979', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (231, 233, 55, 'Ellysia', 2017, '08563220078', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (232, 234, 55, 'Antika', 2017, '0852-3627-0414', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (233, 235, 108, 'contoh', 2015, '08111111111', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (234, 236, 108, 'Dhani', 2019, '089654997258', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (235, 237, 58, 'Intan', 2018, '085648464149', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (236, 238, 76, 'Agung', 2017, '085730881986', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (237, 239, 76, 'Ilma', 2017, '081216449924', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (238, 240, 25, 'Dani', 2017, '082231858681', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (239, 241, 30, 'Ghani', 2013, '083856980803', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (240, 242, 31, 'Nadia', 2017, '087754198238', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (241, 243, 55, 'Nanda', 2018, '087841691726', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (242, 244, 54, 'Ocha', 2018, '085358649087', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (243, 245, 32, 'Salsa', 2017, '081249036244', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (244, 246, 54, 'Erna', 2018, '089643526178', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (245, 247, 82, 'duwik', 2019, '082257802234', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (246, 248, 77, 'Fajar', 2018, '081336005447', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (247, 249, 31, 'Irdham', 2019, 'Irdham Reihansy', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (248, 250, 77, 'Amy', 2016, '085646364307', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (249, 251, 47, 'Wahyu', 2013, '083831239109', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (250, 252, 82, 'Ilham', 2019, '081277877855', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (251, 253, 30, 'Tasya', 2018, '083182646760', 'uploads/1584242199421.png', NULL, NULL);
INSERT INTO `app_students` VALUES (252, 254, 25, 'Dani', 2017, '082231858681', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (253, 255, 65, 'Wafa', 2018, '085797115080', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (254, 256, 98, 'Hany', 2018, '081364282532', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (255, 257, 65, 'Surya', 2018, '085720494272', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (256, 258, 30, 'Nabila', 2018, '082261991212', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (257, 259, 28, 'Irfan ', 2017, '081334712019', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (258, 260, 75, 'Fikri', 2017, '083861770751', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (259, 261, 21, 'Anisa', 2019, '081217566281', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (260, 262, 54, 'Elsa', 2018, '089505558983', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (261, 263, 98, 'Julian', 2019, '082199233448', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (262, 264, 77, 'Discha', 2018, '083112277887', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (263, 265, 26, 'Ryan', 2019, '082161318181', 'uploads/1586843339625.png', NULL, NULL);
INSERT INTO `app_students` VALUES (264, 266, 67, 'Sulis', 2019, '089688387537', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (265, 267, 76, 'Agung', 2017, '085730881986', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (266, 268, 43, 'shafa', 2019, '082126633624', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (267, 269, 96, 'Faiz', 2019, '081210845080', 'uploads/1585577299614.png', NULL, NULL);
INSERT INTO `app_students` VALUES (268, 270, 28, 'Irfan ', 2017, '081334712019', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (269, 271, 30, 'Irawan', 2018, '089502207090', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (270, 272, 71, 'JAKI', 2018, '082136000422', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (271, 273, 58, 'Zen', 2018, '085741760322', 'uploads/1585728065090.png', NULL, NULL);
INSERT INTO `app_students` VALUES (272, 274, 77, 'Shinta', 2017, '08989550215', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (273, 275, 82, 'Shabira', 2019, '085338667243', 'uploads/1587382060283.png', NULL, NULL);
INSERT INTO `app_students` VALUES (274, 276, 30, 'Tasya', 2018, '083182646760', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (275, 277, 31, 'Irdham', 2019, '081398365737', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (276, 278, 76, 'Ilma', 2017, '081216449924', 'uploads/1586860691946.png', NULL, NULL);
INSERT INTO `app_students` VALUES (277, 279, 57, 'Ifa ', 2018, '087859280806', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (278, 280, 97, 'Aghna', 2019, '085747191546', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (279, 281, 66, 'Ani', 2015, '085604775418', 'uploads/Ani.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (280, 282, 68, 'Febrina ', 2018, '089666297091', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (281, 283, 30, 'Handy', 2018, '089654451467', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (282, 284, 30, 'Wahyu', 2017, '085731743715', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (283, 285, 55, 'Nanda', 2018, '087841691726', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (284, 286, 54, 'idah', 2018, '085850604706', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (285, 287, 82, 'Afifah', 2017, '085752298700', 'uploads/1586834015567.png', NULL, NULL);
INSERT INTO `app_students` VALUES (286, 288, 77, 'Yaya', 2018, '085749100128', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (287, 289, 47, 'Wahyu', 2013, '083831239109', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (288, 290, 32, 'Ike', 2015, '081292370204', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (289, 291, 54, 'Adh', 2018, '0895803848923', 'uploads/Adh1.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (290, 292, 31, 'Nadia', 2017, '087754198238', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (291, 293, 76, 'Dhani', 2019, '089654997258', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (292, 294, 17, 'Agis', 2019, '085361423738', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (293, 295, 30, 'Hana', 2016, '081332285701', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (294, 296, 17, 'Lintang', 2018, '081231908188', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (295, 297, 66, 'Afifah', 2017, '081235203591', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (296, 298, 30, 'Ghani', 2013, '083856980803', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (297, 299, 25, 'RIMA', 2015, '085857355562', 'uploads/1585708133085.png', NULL, NULL);
INSERT INTO `app_students` VALUES (298, 300, 30, 'Nabila', 2018, '082261991212', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (299, 301, 54, 'Ocha', 2018, '085357649087', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (300, 302, 90, 'Nau', 2019, '082167038049', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (301, 303, 54, 'Erna', 2018, '089643526178', 'uploads/Erna1.png', NULL, NULL);
INSERT INTO `app_students` VALUES (302, 304, 17, 'Inas', 2019, '081358234649', 'uploads/1586255739585.png', NULL, NULL);
INSERT INTO `app_students` VALUES (303, 305, 87, 'Fina', 2017, '+6282338944421', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (304, 306, 32, 'Salsa', 2017, '081249036244', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (305, 307, 60, 'Izza', 2016, '082333151142', 'uploads/1588300871654.png', NULL, NULL);
INSERT INTO `app_students` VALUES (306, 308, 54, 'Ima', 2018, '082336591946', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (307, 309, 25, 'Danial', 2017, '082231858681', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (308, 310, 97, 'Aghna', 2019, '085747191546', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (309, 311, 75, 'Almira', 2018, '082323611456', 'uploads/1587873714807.png', NULL, NULL);
INSERT INTO `app_students` VALUES (310, 312, 75, 'Almira', 2018, '082323611456', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (311, 313, 71, 'Petei', 2017, '082214209703', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (312, 314, 25, 'Rio', 2012, '083830104655', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (313, 315, 17, 'Arsa', 2016, '085311713241', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (314, 316, 68, 'Nadiah', 2019, '087873871560', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (315, 317, 69, 'Zahra', 2018, '081907770847', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (316, 318, 68, 'Nikita', 2019, '083832384903', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (317, 319, 64, 'Yuni', 2017, '08990242866', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (318, 320, 90, 'Nicky ', 2019, '087863100960', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (319, 321, 54, 'Marizky', 2018, '082331201885', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (320, 322, 77, 'Oni', 2017, '081259831625', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (321, 323, 76, 'Alifa', 2017, '082227227608', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (322, 324, 65, 'Febi', 2018, '089680661436', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (323, 325, 68, 'Edniz', 2019, '081295848993', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (324, 326, 36, 'DHILA', 2017, '082149032570', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (325, 327, 69, 'Cynara', 2019, '082117502859', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (326, 328, 95, 'Dini', 2019, '081236925772', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (327, 329, 79, 'Karim', 2018, '0817136530', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (328, 330, 68, 'Lala', 2019, '089512797727', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (329, 331, 45, 'Inmas', 2019, '082137965201', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (330, 332, 54, 'Winda', 2018, '083122750818', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (331, 333, 30, 'Sandya', 2019, '081241139013', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (332, 334, 68, 'Salsa', 2019, '081243443876', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (333, 335, 68, 'Andin', 2019, '085881586088', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (334, 336, 17, 'Nuri', 2019, '085704923297', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (335, 337, 30, 'Alif ', 2018, '085711399313 ', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (336, 338, 63, 'Yeni', 2018, '085735771349', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (337, 339, 17, 'Rasya', 2018, '082142601099', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (338, 340, 71, 'Aulia', 2018, '081357629203 ', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (339, 341, 66, 'Devina', 2019, '083114273816', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (340, 342, 77, 'shinta', 2017, '08989550215', 'uploads/shinta.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (341, 343, 19, 'Dicky', 2019, '081336790418', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (342, 344, 27, 'Diah', 2016, '089659291519', 'uploads/165030700111002.jpg', 'uploads/ktm165030700111002.jpg', '1998-10-10');
INSERT INTO `app_students` VALUES (343, 345, 100, 'Momo', 2019, '087804487892', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (344, 346, 98, 'Julian', 2019, '082199233448', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (345, 347, 34, 'Astri ', 2019, '087880774782', 'uploads/1600511820069.png', NULL, NULL);
INSERT INTO `app_students` VALUES (346, 348, 43, 'Ainan', 2019, '082126633624', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (347, 349, 30, 'Ghani', 2013, '083856980803', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (348, 350, 30, 'Tasya', 2018, '083182646760', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (349, 351, 96, 'Faiz', 2019, '081210845080', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (350, 352, 82, 'shabira', 2019, '085338667243', 'uploads/1600428344466.png', NULL, NULL);
INSERT INTO `app_students` VALUES (351, 353, 20, 'Adhi', 2018, '081344669728', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (352, 354, 30, 'Nana', 2017, '089664589801', 'uploads/1600507608896.png', NULL, NULL);
INSERT INTO `app_students` VALUES (353, 355, 67, 'Dewa', 2019, '082140774412', 'uploads/1600413312616.png', NULL, NULL);
INSERT INTO `app_students` VALUES (354, 356, 26, 'Ryan', 2019, '082161318181', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (355, 357, 59, 'Dina', 2016, '081249597608', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (356, 358, 82, 'Wilis', 2017, '0859175466131', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (357, 359, 25, 'RIMA', 2015, '085857355562', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (358, 360, 68, 'Desi', 2016, '089628022968', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (359, 361, 30, 'Azizah', 2018, '089635392118', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (360, 362, 67, 'Gerry', 2018, '081296382664', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (361, 363, 60, 'Izza', 2016, '082333151142', 'uploads/1600469718802.png', NULL, NULL);
INSERT INTO `app_students` VALUES (362, 364, 32, 'Dila', 2015, '081649521828', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (363, 365, 27, 'Alfa', 2016, '082330281455', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (364, 366, 17, 'Agis', 2019, '085361423738', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (365, 367, 88, 'fatur', 2019, '08971433183', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (366, 368, 76, 'Dhani', 2019, '089654997258', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (367, 369, 66, 'Nona', 2016, '085645079706', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (368, 370, 70, 'Hani', 2019, '081259514375', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (369, 371, 38, 'Bilkish', 2017, '081632235114', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (370, 372, 98, 'Togar', 2019, '081371854723', 'uploads/Togar2.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (371, 373, 69, 'Vina3', 2018, '088228730291', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (372, 374, 82, 'Fayo', 2017, '081617061510', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (373, 375, 36, 'Fathi', 2017, '175060500111033', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (374, 376, 36, 'Hima', 2017, '085748420874', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (375, 377, 68, 'Wafa', 2018, '089693411817', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (376, 378, 66, 'Ani', 2015, '085604775418', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (377, 379, 58, 'INTAN', 2018, '085648464149', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (378, 380, 17, 'Ata ', 2017, '085813898354', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (379, 381, 32, 'Ike', 2017, '081292370204', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (380, 382, 57, 'Rin', 2015, '085895061205', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (381, 383, 82, 'Tata', 2017, '082298935855', 'uploads/1600487574065.png', NULL, NULL);
INSERT INTO `app_students` VALUES (382, 384, 54, 'Ocha', 2018, '085357649087', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (383, 385, 27, 'Arkan', 2019, '088211356910', 'uploads/1600594736533.png', NULL, NULL);
INSERT INTO `app_students` VALUES (384, 386, 71, 'Jaki', 2018, '082136000422', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (385, 387, 67, 'Vita', 2017, '081236436187', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (386, 388, 32, 'Ike', 2017, '081292370204', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (387, 389, 70, 'Hani', 2019, '081259514375', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (388, 390, 54, 'Adh', 2018, '0895803848923', 'uploads/Adh2.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (389, 391, 97, 'Aghna', 2019, '085747191546', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (390, 392, 17, 'Lintang', 2018, '081231908188', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (391, 393, 30, 'Mei/Irwan', 2018, '089502207090', 'uploads/MeiIrwan.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (392, 394, 31, 'Irdham/Reihan', 2019, '081398365737', 'uploads/1613288016099.png', NULL, NULL);
INSERT INTO `app_students` VALUES (393, 395, 57, 'Titi', 2016, '08972123223', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (394, 396, 76, 'Agung', 2017, '085730881986', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (395, 397, 66, 'Livia', 2017, '081906061739', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (396, 398, 67, 'Lilis', 2019, '089688387537', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (397, 399, 66, 'Afifah ', 2017, '081235203591', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (398, 400, 69, 'Fajrin', 2017, '081341503022', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (399, 401, 77, 'Yaya', 2018, '085749100128', 'uploads/Yaya1.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (400, 402, 54, 'Ima', 2018, '085156159285', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (401, 403, 32, 'Salsa', 2017, '082335413117', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (402, 404, 68, 'Afif', 2019, '082330375399', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (403, 405, 54, 'Erna', 2018, '089643526178', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (404, 406, 66, 'Raya', 2017, '085801608985', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (405, 407, 92, 'Reza', 2019, '085788749497', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (406, 408, 25, 'Dani', 2017, '082231858681', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (407, 409, 58, 'Zen', 2018, '085741760322', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (408, 410, 79, 'Opi', 2020, '085692883620', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (409, 411, 68, 'Riki', 2058, '085377125918', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (410, 412, 21, 'Sania', 2058, '085256027491', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (411, 413, 22, 'Slamet', 2020, '089524746995', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (412, 414, 21, 'Vina', 2017, '081237273592', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (413, 415, 98, 'Ghani', 2020, '+6289638346755', 'uploads/1600527395349.png', NULL, '1998-10-26');
INSERT INTO `app_students` VALUES (414, 416, 29, 'Hani', 2020, '085710375270', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (415, 417, 69, 'Hirza', 2058, '081271655972', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (416, 418, 30, 'Nabila', 2018, '082261991212', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (417, 419, 96, 'Atta', 2020, '085334787247', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (418, 420, 85, 'aldo', 2020, '081275792533', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (419, 421, 31, 'INDAH', 2020, '087840193673', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (420, 422, 96, 'Rizky', 2020, '082128425604', 'uploads/Rizky.jpeg', NULL, NULL);
INSERT INTO `app_students` VALUES (421, 423, 98, 'Hafiza', 2020, '082140577577', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (422, 424, 97, 'Adin', 2020, '085855962508', 'uploads/1600575315393.png', NULL, NULL);
INSERT INTO `app_students` VALUES (423, 425, 43, 'Shafa', 2019, '082126633624', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (424, 426, 98, 'Hafiz', 2020, '082286165392', 'uploads/1612759500482.png', NULL, NULL);
INSERT INTO `app_students` VALUES (425, 427, 54, 'idah', 2018, '085850604706', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (426, 428, 67, 'Aisyah / Sekar', 2017, '082139806594', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (427, 429, 82, 'Ilham', 2019, '0812778777855', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (428, 430, 65, 'Surya', 2018, '085720494272', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (429, 431, 68, 'Vici', 2017, '081311185140', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (430, 432, 31, 'Nadia', 2017, '087754198238', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (431, 433, 110, 'Shofi', 2020, '6281216200604', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (432, 434, 57, 'Ifa ', 2018, '087859280806', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (433, 435, 64, 'Yuni', 2017, '08990242866', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (434, 436, 79, 'Opi', 2020, '085692883620', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (435, 437, 24, 'Hani', 2020, '085710375270', 'uploads/205030919111001.jpg', 'uploads/ktm205030919111001.JPG', '2002-03-13');
INSERT INTO `app_students` VALUES (436, 438, 79, 'Sul', 2017, '089610461513', 'uploads/Sul.jpeg', NULL, NULL);
INSERT INTO `app_students` VALUES (437, 439, 34, 'Astri ', 2019, '087880774782', 'uploads/1601202058648.png', NULL, NULL);
INSERT INTO `app_students` VALUES (438, 440, 21, 'Sania', 2020, '085256027491', 'uploads/205020319111001.jpg', NULL, '2001-07-21');
INSERT INTO `app_students` VALUES (439, 441, 97, 'Adin', 2020, '085855962508', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (440, 442, 57, 'Rin', 2015, '085895061205', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (441, 443, 79, 'Opi', 2020, '205110919111001', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (442, 444, 82, 'Afifah', 2017, '085752298700', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (443, 445, 17, 'Rizky', 2018, '08970989896', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (444, 446, 54, 'Ima', 2018, '085156159285', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (445, 447, 57, 'Rin', 2015, '085895061205', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (446, 448, 30, 'Irawan', 2018, '089502207090', 'uploads/Irawan.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (447, 449, 77, 'shinta', 2017, '08989550215', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (448, 450, 55, 'Ningsih', 1997, '081252029433', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (449, 451, 71, 'Tegar', 2020, '082264401242', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (450, 452, 34, 'Astri ', 2019, '087880774782', 'uploads/1604796423350.png', NULL, NULL);
INSERT INTO `app_students` VALUES (451, 453, 17, 'Reza Magistra', 2019, '095361423738', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (452, 454, 32, 'Ike', 2009, '081292370204', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (453, 455, 64, 'Yuni', 2017, '08990242866', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (454, 456, 58, 'Syarifah', 2018, '085648464149', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (455, 457, 83, 'Tatang', 2017, '085755676620', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (456, 458, 83, 'Abdul', 2017, '085755676620', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (457, 459, 83, 'adit', 2017, '085000000002', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (458, 460, 83, 'kahfi', 2017, '082000000002', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (459, 461, 58, 'Zen', 2018, '085741760322', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (460, 464, 82, 'shabira', 2019, '085338667243', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (461, 465, 82, 'Tata ', 2017, '082298935855', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (462, 466, 85, 'Aldo', 2020, '082123590080', 'uploads/Aldo.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (463, 467, 109, 'Hasyim', 2026, '0811111111', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (464, 468, 87, 'Fina', 2017, '+6282143315125', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (465, 469, 17, 'Contoh', 2020, '082363383707', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (466, 471, 68, 'Desi', 2016, '089628022968', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (467, 472, 60, 'Izza', 2016, '082333151142', 'uploads/1613307695213.png', NULL, NULL);
INSERT INTO `app_students` VALUES (468, 473, 107, 'Gusde', 2020, '082340633911', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (469, 474, 51, 'Ning', 2020, '082330009066', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (470, 475, 31, 'Irdham/ Reihan', 2019, '081398365737', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (471, 476, 31, 'Irdham/ Reihan', 2019, '195040107111034', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (472, 477, 31, 'Irdham/ Reihan', 2019, '081398365737', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (473, 478, 67, 'Dewa', 2019, '082140774412', 'uploads/195120219111001.jpg', NULL, '0001-01-01');
INSERT INTO `app_students` VALUES (474, 479, 98, 'Hatane', 2019, '082199233448', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (475, 480, 28, 'Irfan ', 2017, '081334712019', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (476, 481, 30, 'Geo', 2018, '081293985920', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (477, 482, 17, 'AL', 2018, '8970989896', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (478, 483, 83, 'kahfi', 2017, '082000000002', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (479, 484, 68, 'Widy', 2020, '08816392894', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (480, 485, 84, 'Elsa', 2019, '082233795486 ', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (481, 486, 83, 'Adit', 2017, '085885683928', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (482, 487, 83, 'Adit', 2017, '085885683928', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (483, 488, 83, 'Adit', 2017, '085885683928', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (484, 489, 83, 'Adit', 2017, '085885683928', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (485, 490, 26, 'Adit', 2017, '085885684938', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (486, 491, 83, 'Adit', 2017, '085885683928', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (487, 492, 83, 'Adit', 2017, '085885683928', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (488, 493, 24, 'Adit', 2017, '085885683928', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (489, 494, 29, 'Adit', 2017, '085885684938', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (490, 495, 68, 'Nikita', 2019, '083832384903', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (491, 496, 32, 'Fina', 2020, '085715041541', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (492, 497, 25, 'Willy', 2019, '085856645179', 'uploads/1619868128069.png', NULL, NULL);
INSERT INTO `app_students` VALUES (493, 498, 69, 'Zahra', 2018, '081907770847', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (494, 499, 79, 'Karim', 2018, '08817136530', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (495, 500, 72, 'Aindra', 2020, '088996935853', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (496, 501, 68, 'Lala', 2019, '089512797727', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (497, 502, 72, 'Sahara', 2020, '081249624790', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (498, 503, 20, 'Novalino', 2019, '0895612473078', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (499, 504, 21, 'Inggried', 2019, '087705502075', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (500, 505, 17, 'Lili', 2017, '081334323805', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (501, 506, 33, 'Ardia', 2019, '081232239595', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (502, 507, 54, 'Rima', 2018, '082382228744', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (503, 508, 63, 'Deyin', 2020, '(+62) 858-0299-', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (504, 509, 63, 'Wafa\'', 2019, '081359146233', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (505, 510, 72, 'Zulfa', 2020, '085856544876', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (506, 511, 30, 'Rafika', 2018, '0895396148871', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (507, 512, 74, 'Ola', 2020, '087784426403', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (508, 513, 21, 'Umi', 2019, '085856795324', 'uploads/Umi.jpg', NULL, NULL);
INSERT INTO `app_students` VALUES (509, 514, 40, 'Kinan', 2020, '089506515660', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (510, 515, 33, 'ANNISA', 2019, '081535325421', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (511, 516, 68, 'Andini', 2020, '08998931955', 'uploads/2051203011110311.jpg', 'uploads/ktm2051203011110311.jpg', '2003-04-14');
INSERT INTO `app_students` VALUES (512, 517, 54, 'Elsa', 2018, '089505558983', 'uploads/Elsa.png', NULL, NULL);
INSERT INTO `app_students` VALUES (513, 518, 17, 'Putri', 2019, '089516606485', NULL, NULL, NULL);
INSERT INTO `app_students` VALUES (514, 519, 21, 'hrn', 2016, '08564644666765', 'uploads/diskominfo.jpeg', NULL, '2021-09-13');
INSERT INTO `app_students` VALUES (515, 520, 108, 'test', 2019, '089898981122', 'uploads/test.jpeg', NULL, NULL);
INSERT INTO `app_students` VALUES (516, 521, 108, 'test', 2009, '08989812121', 'uploads/aov.jpg', 'aov.jpg', '2021-09-06');
INSERT INTO `app_students` VALUES (517, 522, 21, 'test', 2019, '089898989898', 'apex.jpeg', 'aov.jpg', '2021-09-06');
INSERT INTO `app_students` VALUES (518, 523, 108, 'test', 2019, '089881828282', 'uploads/test.jpg', 'aov.jpg', '2021-09-06');
INSERT INTO `app_students` VALUES (519, 524, 108, 'test', 2019, '08812128282', 'uploads/189876764545.jpeg', 'uploads/ktm189876764545.jpeg', '2021-09-06');
INSERT INTO `app_students` VALUES (520, 525, 54, 'tester', 2017, '0898111764633', 'uploads/12124343444.png', 'uploads/ktm12124343444.png', '2015-04-02');
INSERT INTO `app_students` VALUES (521, 526, 108, 'harun tester', 2016, '08981212827', 'uploads/178727276166.jpeg', 'uploads/ktm178727276166.jpg', '2021-09-06');
INSERT INTO `app_students` VALUES (522, 528, 108, 'test', 2019, '089898989833', 'uploads/167676767.png', 'uploads/ktm167676767.png', '2021-09-06');
INSERT INTO `app_students` VALUES (523, 529, 108, 'test', 2029, '08981212827', 'uploads/167676111.png', 'uploads/ktm167676111.png', '2021-09-09');
INSERT INTO `app_students` VALUES (524, 530, 108, 'test', 2018, '089835647312', 'uploads/165150201111989.png', 'uploads/ktm165150201111989.png', '2021-09-13');
INSERT INTO `app_students` VALUES (525, 531, 54, 'tester', 2017, '0898111764633', 'uploads/45456767.png', 'uploads/ktm45456767.png', '2015-04-02');
INSERT INTO `app_students` VALUES (526, 532, 108, 'mhs', 2017, '081234576767', 'uploads/Test_mhs.jpeg', 'uploads/ktmTest_mhs3.png', '2000-02-14');
INSERT INTO `app_students` VALUES (527, 533, 21, 'volunteer1', 2016, '08564644666765', 'uploads/Screenshot_(1).png', NULL, '2021-09-13');
INSERT INTO `app_students` VALUES (528, 534, 108, 'Test', 2017, '08989898237', 'uploads/1651502011110371.png', 'uploads/ktm1651502011110371.png', '2001-05-14');
INSERT INTO `app_students` VALUES (529, 535, 54, 'Fiqhan', 2014, '085776665577', NULL, NULL, '1996-01-28');
INSERT INTO `app_students` VALUES (530, 536, 54, 'Fiqhan', 2014, '085776665577', NULL, NULL, '1996-01-28');
INSERT INTO `app_students` VALUES (531, 537, 54, 'Fiqhan', 2014, '085776665577', NULL, NULL, '1996-01-28');
INSERT INTO `app_students` VALUES (532, 538, 108, 'test', 2017, '089835353616', NULL, NULL, '1997-09-27');
INSERT INTO `app_students` VALUES (533, 539, 54, 'Fiqhan', 2014, '085776665577', NULL, NULL, '1996-01-28');
INSERT INTO `app_students` VALUES (534, 540, 54, 'Fiqhan', 2014, '085776665577', NULL, NULL, '1996-01-28');
INSERT INTO `app_students` VALUES (535, 541, 54, 'Fiqhan', 2014, '085776665577', NULL, NULL, '1996-01-28');
INSERT INTO `app_students` VALUES (536, 542, 54, 'Fiqhan', 2014, '085776665577', NULL, NULL, '1996-01-28');
INSERT INTO `app_students` VALUES (537, 543, 54, 'tester', 2017, '0898111764633', NULL, NULL, '2015-04-02');
INSERT INTO `app_students` VALUES (538, 544, 54, 'tester', 2017, '0898111764633', NULL, NULL, '2015-04-02');
INSERT INTO `app_students` VALUES (539, 545, 54, 'tester', 2017, '0898111764633', NULL, NULL, '2015-04-02');
INSERT INTO `app_students` VALUES (540, 546, 54, 'tester', 2017, '0898111764633', NULL, NULL, '2015-04-02');
INSERT INTO `app_students` VALUES (541, 547, 54, 'tester', 2017, '0898111764633', NULL, NULL, '2015-04-02');
INSERT INTO `app_students` VALUES (542, 548, 54, 'tester', 2017, '0898111764633', NULL, NULL, '2015-04-02');
INSERT INTO `app_students` VALUES (543, 549, 108, 'testlagi', 2016, '089836367464', 'uploads/testlagi.png', 'uploads/ktmtestlagi.png', '1998-01-06');
INSERT INTO `app_students` VALUES (544, 550, 54, 'tester', 2017, '0898111764633', NULL, NULL, '2015-04-02');
INSERT INTO `app_students` VALUES (545, 551, 54, 'tester', 2017, '0898111764633', NULL, NULL, '2015-04-02');
INSERT INTO `app_students` VALUES (546, 552, 108, 'testmadif1', 2016, '089812129292', 'uploads/image_picker_D1BA3D70-D21B-4FC7-A85B-7F7316E5D89B-19397-00000A83725D0A05_out.jpg', 'uploads/ktmtestmadif1.png', '1997-10-03');
INSERT INTO `app_students` VALUES (547, 553, 27, 'testmadif2', 2018, '089833335363', 'uploads/testmadif2.png', 'uploads/ktmtestmadif2.png', '1996-09-10');
INSERT INTO `app_students` VALUES (548, 554, 27, 'Satu', 2018, '089835719836', 'uploads/testvolunteer1.png', 'uploads/ktmtestvolunteer1.png', '2004-02-26');
INSERT INTO `app_students` VALUES (549, 555, 90, 'testvolunteer2', 2016, '089465781726', 'uploads/testvolunteer2.png', 'uploads/ktmtestvolunteer2.png', '2001-09-26');
INSERT INTO `app_students` VALUES (550, 556, 54, 'Fiqhan', 2014, '085776665577', NULL, NULL, '1996-01-28');
INSERT INTO `app_students` VALUES (551, 557, 22, 'Fiqhan', 2014, '085786665508', NULL, NULL, '2021-10-14');
INSERT INTO `app_students` VALUES (552, 558, 22, 'Ibrahim', 2014, '085785557788', NULL, NULL, '2021-10-14');
INSERT INTO `app_students` VALUES (553, 559, 17, 'Yunus', 2014, '085782225596', NULL, NULL, '2021-10-17');
INSERT INTO `app_students` VALUES (554, 560, 17, 'Muhammad', 2014, '087888889900', NULL, NULL, '2021-10-17');
INSERT INTO `app_students` VALUES (555, 561, 22, 'Udin', 2014, '085786667709', NULL, NULL, '2021-10-17');
INSERT INTO `app_students` VALUES (556, 562, 80, 'volunteer2', 2017, '089891762716', 'uploads/volunteer2.png', 'uploads/ktmvolunteer2.jpg', '2001-01-17');
INSERT INTO `app_students` VALUES (557, 563, 24, 'volunteer3', 2018, '0898121287178', 'uploads/volunteer3.png', 'uploads/ktmvolunteer3.png', '1999-06-07');
INSERT INTO `app_students` VALUES (558, 564, 17, 'Enam', 2014, '0857855507', 'uploads/145150200111169.jpg', 'uploads/ktm145150200111169.jpg', '2021-10-23');
INSERT INTO `app_students` VALUES (559, 565, 21, 'Tuju', 2014, '085785553366', 'uploads/145150200111170.jpg', 'uploads/ktm145150200111170.jpg', '2021-10-27');
INSERT INTO `app_students` VALUES (560, 566, 17, 'Sultan', 2021, '082198449506', 'uploads/2150101191110021.jpeg', 'uploads/ktm215010119111002.png', '1996-09-15');
INSERT INTO `app_students` VALUES (561, 567, 67, 'Callan', 2021, '0817814814', 'uploads/215120219111003.jpeg', 'uploads/ktm215120219111003.png', '2001-05-18');
INSERT INTO `app_students` VALUES (562, 568, 17, 'Heru', 2020, '082264411575', 'uploads/205010100111157.jpg', 'uploads/ktm205010100111157.jpg', '2002-01-14');
INSERT INTO `app_students` VALUES (563, 569, 67, 'Arsa', 2021, '087808657479', 'uploads/215120219111002.jpg', 'uploads/ktm215120219111002.jpg', '2003-06-12');
INSERT INTO `app_students` VALUES (564, 570, 88, 'Ziyah', 2021, '0895326442342', 'uploads/214140219111002.jpg', 'uploads/ktm214140219111002.png', '2002-02-25');
INSERT INTO `app_students` VALUES (565, 571, 77, 'Lintang', 2001, '081805103887', 'uploads/2017018709102001.jpeg', 'uploads/ktm2017018709102001.jpeg', '1987-09-10');
INSERT INTO `app_students` VALUES (566, 572, 75, 'AZIZ', 2017, '083861770751', 'uploads/175110407111017.jpg', 'uploads/ktm175110407111017.jpeg', '1997-07-07');
INSERT INTO `app_students` VALUES (567, 573, 77, 'Layta ', 2021, '083834849875', 'uploads/217090401111001.jpg', 'uploads/ktm217090401111001.jpg', '1990-11-15');
INSERT INTO `app_students` VALUES (568, 574, 77, 'Nasta', 2020, '082363383707', 'uploads/ganyot.png', 'uploads/ktmganyot.png', '1994-06-18');
INSERT INTO `app_students` VALUES (569, 575, 108, 'nasta', 2019, '0823639227323', 'uploads/nasta.png', 'uploads/ktmnasta.png', '1994-12-06');
INSERT INTO `app_students` VALUES (570, 576, 55, 'Halfah', 2019, '081231854706', 'uploads/195090201111022.jpeg', 'uploads/ktm195090201111022.JPG', '2001-03-19');
INSERT INTO `app_students` VALUES (571, 577, 55, 'Vike', 2019, '085607232812', NULL, NULL, '2000-09-04');
INSERT INTO `app_students` VALUES (572, 578, 68, 'Nasta', 2020, '0823639227323', 'uploads/12345.png', 'uploads/ktm12345.png', '2022-02-03');
INSERT INTO `app_students` VALUES (573, 579, 78, 'IRKHAM', 2021, '083863733500s', 'uploads/215110600111028.jpg', 'uploads/ktm215110600111028.jpg', '2002-03-18');
INSERT INTO `app_students` VALUES (574, 580, 26, 'Tabina', 2021, '081290588710', 'uploads/215030401111048.jpg', 'uploads/ktm215030401111048.jpg', '2003-03-10');
INSERT INTO `app_students` VALUES (575, 581, 68, 'Annisa', 2021, '082284243611', 'uploads/215120319111001.jpg', 'uploads/ktm215120319111001.jpg', '2002-10-20');
INSERT INTO `app_students` VALUES (576, 582, 83, 'Alwi', 2021, '085888256659', 'uploads/215150419111002.jpg', 'uploads/ktm215150419111002.jpg', '2000-01-01');
INSERT INTO `app_students` VALUES (577, 583, 66, 'Fajar', 2020, '085156029647', 'uploads/205120101111041.jpg', 'uploads/ktm205120101111041.jpg', '2001-09-22');
INSERT INTO `app_students` VALUES (578, 584, 55, 'Nabila', 2019, '082331937346', 'uploads/195090201111025.jpg', 'uploads/ktm195090201111025.jpg', '2001-05-05');
INSERT INTO `app_students` VALUES (579, 585, 73, 'Oza/Rum', 2021, '082138726400', 'uploads/215110219111001.jpg', 'uploads/ktm215110219111001.JPG', '2002-03-20');
INSERT INTO `app_students` VALUES (580, 586, 88, 'Fitrah', 2021, '088286407868', 'uploads/214140219111001.jpg', 'uploads/ktm214140219111001.jpg', '2001-01-25');
INSERT INTO `app_students` VALUES (581, 587, 26, 'Rayaaa', 2019, '085751531580', 'uploads/195030400111030.jpeg', 'uploads/ktm195030400111030.jpeg', '2000-07-02');
INSERT INTO `app_students` VALUES (582, 588, 68, 'Nao', 2019, '081338990605', 'uploads/185120300111034.jpeg', 'uploads/ktm185120300111034.jpg', '2000-11-05');
INSERT INTO `app_students` VALUES (583, 589, 24, 'Dani', 2021, '08979181766', 'uploads/215030119111001.JPG', 'uploads/ktm215030119111001.jpg', '2000-01-11');
INSERT INTO `app_students` VALUES (584, 590, 68, 'Ayu', 2021, '081903406929', 'uploads/215120319111002.jpg', 'uploads/ktm215120319111002.jpg', '2000-05-20');
INSERT INTO `app_students` VALUES (585, 591, 17, 'Florence', 2018, '081277066140', 'uploads/185010100111051.jpg', 'uploads/ktm185010100111051.jpg', '2000-10-04');
INSERT INTO `app_students` VALUES (586, 592, 83, 'Dandy', 2021, '082232822744', 'uploads/215150419111001.jpeg', 'uploads/ktm215150419111001.png', '2002-03-09');
INSERT INTO `app_students` VALUES (587, 593, 82, 'Fadhly', 2021, '085921722974', 'uploads/215150200111017.jpg', 'uploads/ktm215150200111017.jpg', '2003-01-02');
INSERT INTO `app_students` VALUES (588, 594, 20, 'Andre', 2021, '082132685190', 'uploads/215020200111092.jpg', 'uploads/ktm215020200111092.jpg', '2001-09-23');
INSERT INTO `app_students` VALUES (589, 595, 50, 'atika ', 2021, '085736277282', 'uploads/215080200111010.jpg', 'uploads/ktm215080200111010.jpg', '2002-07-16');
INSERT INTO `app_students` VALUES (590, 596, 67, 'Aiman', 2021, '082112791299', 'uploads/215120219111001.jpeg', 'uploads/ktm215120219111001.jpg', '2002-10-24');
INSERT INTO `app_students` VALUES (591, 597, 85, 'lintang', 2020, '089635217189', 'uploads/205150700111050.jpg', 'uploads/ktm205150700111050.jpg', '2001-10-10');
INSERT INTO `app_students` VALUES (592, 598, 40, 'Mia', 2019, '085820178030', 'uploads/195061101111018.jpeg', 'uploads/ktm195061101111018.jpeg', '2001-06-28');
INSERT INTO `app_students` VALUES (593, 599, 68, 'Jihan', 2020, '082234544690', 'uploads/205120301111036.jpg', 'uploads/ktm205120301111036.jpg', '2002-01-07');

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
  INDEX `ci_sessions_timestamp`(`timestamp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ci_sessions
-- ----------------------------
INSERT INTO `ci_sessions` VALUES ('0fkqv6clro1ist4pcht2gu6d2hbsufcb', '::1', 1654175665, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343137353636353B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('0uco02va17jugsuqeuh61c28cq68mhql', '::1', 1654242662, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343234323636323B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('141outvip12vad3ltj3kmogpvv1j1ct2', '::1', 1654308239, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343330383233393B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('14grvvf31fuvmr1hsve798un5k9f7aje', '::1', 1653976528, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333937363532383B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('1ao32abv5lsrpd83ha5jhi7minhgvsoh', '::1', 1654865178, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343836353137383B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('1bd6ea6645ereoto297rg85nied1r0u2', '::1', 1653922785, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333932323738353B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('1fp9lgupvhqsthmhmq4pu7fj8bqm6m6v', '::1', 1653963334, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333936333333343B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('1hbj60qa2pm88a7g2gokbagjgc31se3b', '::1', 1653926130, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333932363032383B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('26v9j02r46mqeu36hned7ohv5a4kg5o9', '::1', 1654228255, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343232383235353B);
INSERT INTO `ci_sessions` VALUES ('2781k97jie82odhmi5ob89ma9ockd05r', '::1', 1654862060, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343836323036303B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22333732223B733A383A22757365726E616D65223B733A31353A22313933313430373139313131303031223B733A343A226E616D65223B733A32353A22546F67617220596F6E617468616E204E617069747570756C75223B733A353A22656D61696C223B733A31393A22746F6761723937313240676D61696C2E636F6D223B733A31303A226361706162696C697479223B733A373A226469666162656C223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392030363A32303A3533223B733A31303A2273747564656E745F6964223B733A333A22333730223B733A393A226D616A6F72735F6964223B733A323A223938223B733A393A226E69636B5F6E616D65223B733A353A22546F676172223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303831333731383534373233223B733A353A2270686F746F223B733A31383A2275706C6F6164732F546F676172322E6A7067223B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A31333A226A656E69735F6469666162656C223B733A393A2254756E6172756E6775223B733A353A22746F6B656E223B733A34303A2233643364636664643033313461653731393066376264376332313838356636326431396330653664223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('2a3bg4iglasl348k1deo5o68fiq263i1', '::1', 1654831143, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343833313134333B);
INSERT INTO `ci_sessions` VALUES ('2iqm5okf00earsei91tp2k67bl8p8i7q', '::1', 1654832482, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343833323438323B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('2rqq07atk9hpgi8dfv4bols9hus907i3', '::1', 1654831512, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343833313531323B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22343532223B733A383A22757365726E616D65223B733A31353A22313935303630373139313131303031223B733A343A226E616D65223B733A32323A225072616D65737469204561726C6920417379616E7469223B733A353A22656D61696C223B733A32373A22617374726965726C69617379613230313540676D61696C2E636F6D223B733A31303A226361706162696C697479223B733A373A226469666162656C223B733A31303A22637265617465645F6174223B733A31393A22323032302D31312D30372032303A34383A3136223B733A31303A2273747564656E745F6964223B733A333A22343530223B733A393A226D616A6F72735F6964223B733A323A223334223B733A393A226E69636B5F6E616D65223B733A363A22417374726920223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303837383830373734373832223B733A353A2270686F746F223B733A32353A2275706C6F6164732F313630343739363432333335302E706E67223B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A31333A226A656E69735F6469666162656C223B733A393A2254756E6172756E6775223B733A353A22746F6B656E223B733A34303A2236303432393961643165653934636132323931326165656339653637633766313033386463653061223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('2v07a18en3qq3o4bte99pi6g8i4cv6m0', '::1', 1653971590, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333937313539303B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('35abtkhmbpl5cjrjcncelo3svaf0ur1s', '::1', 1655161636, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635353136313633363B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('3fihp2e9dvgsjk92e3rg5ueff1evff8i', '::1', 1653969486, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333936393438363B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('3llp8et9jmjhuq05jqnr6984p9tg9r83', '::1', 1654179759, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343137393735393B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('3oevks7c3t6usd7cub2i5aced45oj282', '::1', 1654533089, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343533333038393B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('3urujabbfuomte5jvh5vebulq1pu4evc', '::1', 1653920427, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333932303432373B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22353136223B733A383A22757365726E616D65223B733A31353A22323035313230333031313131303331223B733A343A226E616D65223B733A31383A22416E64696E69204C61696C79205075747269223B733A353A22656D61696C223B733A32393A22616E64696E695F6C61696C794073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032312D30352D30322031303A35373A3234223B733A31303A2273747564656E745F6964223B733A333A22353131223B733A393A226D616A6F72735F6964223B733A323A223638223B733A393A226E69636B5F6E616D65223B733A363A22416E64696E69223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303230223B733A353A226E6F5F6870223B733A31313A223038393938393331393535223B733A353A2270686F746F223B733A32383A2275706C6F6164732F323035313230333031313131303331312E6A7067223B733A333A226B746D223B733A33313A2275706C6F6164732F6B746D323035313230333031313131303331312E6A7067223B733A31303A2262697274685F64617465223B733A31303A22323030332D30342D3134223B733A353A22746F6B656E223B733A34303A2265306332633437356263336665306639653034333062653733663664643161633662303635626366223B733A31363A226A656E69735F707265666572656E7369223B733A31343A224261686173612049737961726174223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('46u98h8kir5jl9at03tegiadsq7a4m7n', '::1', 1654866336, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343836363333363B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('4l4kjforgq5d3hu3pc2u7eso4lq8a646', '::1', 1655127223, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635353132373232333B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('4osst5e5c9ccl26hgmc0l632o4fo7lun', '::1', 1653968952, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333936383935323B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('4q76op19luijfj38ck827o4igde8fc0a', '::1', 1654051561, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343035313536313B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31343A7B733A373A22757365725F6964223B733A333A22353039223B733A383A22757365726E616D65223B733A31353A22313935313030353030313131303132223B733A343A226E616D65223B733A31313A224E7572756C205761666127223B733A353A22656D61696C223B733A32363A226E7572756C776166614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032312D30352D30312031353A33323A3433223B733A31303A2273747564656E745F6964223B733A333A22353034223B733A393A226D616A6F72735F6964223B733A323A223633223B733A393A226E69636B5F6E616D65223B733A353A225761666127223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303831333539313436323333223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('4u7b9shssfb75kjm71v0l2t0mrui94lg', '::1', 1654246979, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343234363937393B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('4uo1v7qofa6m5892bskvshkg8rkpu6oc', '::1', 1654247111, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343234363937393B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('58ri8lb1k4sll7k1tae0jarglp1418sb', '::1', 1654309783, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343330393630393B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22333732223B733A383A22757365726E616D65223B733A31353A22313933313430373139313131303031223B733A343A226E616D65223B733A32353A22546F67617220596F6E617468616E204E617069747570756C75223B733A353A22656D61696C223B733A31393A22746F6761723937313240676D61696C2E636F6D223B733A31303A226361706162696C697479223B733A373A226469666162656C223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392030363A32303A3533223B733A31303A2273747564656E745F6964223B733A333A22333730223B733A393A226D616A6F72735F6964223B733A323A223938223B733A393A226E69636B5F6E616D65223B733A353A22546F676172223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303831333731383534373233223B733A353A2270686F746F223B733A31383A2275706C6F6164732F546F676172322E6A7067223B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A31333A226A656E69735F6469666162656C223B733A393A2254756E6172756E6775223B733A353A22746F6B656E223B733A34303A2233643364636664643033313461653731393066376264376332313838356636326431396330653664223B7D);
INSERT INTO `ci_sessions` VALUES ('5esb6ugm4nsirk8qt3aqhkis8cfi0r84', '::1', 1654243223, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343234333232333B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('5f99lmgqc80gm3qf492r9b87hbpepirh', '::1', 1654309609, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343330393630393B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22333732223B733A383A22757365726E616D65223B733A31353A22313933313430373139313131303031223B733A343A226E616D65223B733A32353A22546F67617220596F6E617468616E204E617069747570756C75223B733A353A22656D61696C223B733A31393A22746F6761723937313240676D61696C2E636F6D223B733A31303A226361706162696C697479223B733A373A226469666162656C223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392030363A32303A3533223B733A31303A2273747564656E745F6964223B733A333A22333730223B733A393A226D616A6F72735F6964223B733A323A223938223B733A393A226E69636B5F6E616D65223B733A353A22546F676172223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303831333731383534373233223B733A353A2270686F746F223B733A31383A2275706C6F6164732F546F676172322E6A7067223B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A31333A226A656E69735F6469666162656C223B733A393A2254756E6172756E6775223B733A353A22746F6B656E223B733A34303A2233643364636664643033313461653731393066376264376332313838356636326431396330653664223B7D);
INSERT INTO `ci_sessions` VALUES ('5n7hlfo8a0g8mpj1lnca9q0jk0usa9jg', '::1', 1654240374, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343234303337343B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('5ulsbks9fjlrg40cjhtm99tjvpbur2ab', '::1', 1654240032, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343234303033323B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22333732223B733A383A22757365726E616D65223B733A31353A22313933313430373139313131303031223B733A343A226E616D65223B733A32353A22546F67617220596F6E617468616E204E617069747570756C75223B733A353A22656D61696C223B733A31393A22746F6761723937313240676D61696C2E636F6D223B733A31303A226361706162696C697479223B733A373A226469666162656C223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392030363A32303A3533223B733A31303A2273747564656E745F6964223B733A333A22333730223B733A393A226D616A6F72735F6964223B733A323A223938223B733A393A226E69636B5F6E616D65223B733A353A22546F676172223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303831333731383534373233223B733A353A2270686F746F223B733A31383A2275706C6F6164732F546F676172322E6A7067223B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A31333A226A656E69735F6469666162656C223B733A393A2254756E6172756E6775223B733A353A22746F6B656E223B733A34303A2233643364636664643033313461653731393066376264376332313838356636326431396330653664223B7D);
INSERT INTO `ci_sessions` VALUES ('6mkctg8ilk4vfg115ca2peavpc4fmdm6', '::1', 1654832105, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343833323130353B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('74oc0dsumiqq91qee0osrcu3ehv8p5bg', '::1', 1653963018, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333936333031383B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('768m3htsnsmr4n7518kvu13q519vefte', '::1', 1653918486, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333931383438363B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22353136223B733A383A22757365726E616D65223B733A31353A22323035313230333031313131303331223B733A343A226E616D65223B733A31383A22416E64696E69204C61696C79205075747269223B733A353A22656D61696C223B733A32393A22616E64696E695F6C61696C794073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032312D30352D30322031303A35373A3234223B733A31303A2273747564656E745F6964223B733A333A22353131223B733A393A226D616A6F72735F6964223B733A323A223638223B733A393A226E69636B5F6E616D65223B733A363A22416E64696E69223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303230223B733A353A226E6F5F6870223B733A31313A223038393938393331393535223B733A353A2270686F746F223B733A32383A2275706C6F6164732F323035313230333031313131303331312E6A7067223B733A333A226B746D223B733A33313A2275706C6F6164732F6B746D323035313230333031313131303331312E6A7067223B733A31303A2262697274685F64617465223B733A31303A22323030332D30342D3134223B733A353A22746F6B656E223B733A34303A2265306332633437356263336665306639653034333062653733663664643161633662303635626366223B733A31363A226A656E69735F707265666572656E7369223B733A31343A224261686173612049737961726174223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('7hf3qeqpf5o2vgb4re591olkv8u4lg1n', '::1', 1655127571, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635353132373537313B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('7i26usmshtvj93hge7voh82m6jm73f84', '::1', 1653922302, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333932323330323B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('846k41ffn25mtd8svpuhc7bho8n2a66f', '::1', 1654834037, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343833343033373B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('8b08ttfal3kbei50tesrpc5sogg3t368', '::1', 1654522850, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343532323835303B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('8fqmfu6nucdlailfftip92ssol3kaah9', '::1', 1654309299, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343330393239393B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22333732223B733A383A22757365726E616D65223B733A31353A22313933313430373139313131303031223B733A343A226E616D65223B733A32353A22546F67617220596F6E617468616E204E617069747570756C75223B733A353A22656D61696C223B733A31393A22746F6761723937313240676D61696C2E636F6D223B733A31303A226361706162696C697479223B733A373A226469666162656C223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392030363A32303A3533223B733A31303A2273747564656E745F6964223B733A333A22333730223B733A393A226D616A6F72735F6964223B733A323A223938223B733A393A226E69636B5F6E616D65223B733A353A22546F676172223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303831333731383534373233223B733A353A2270686F746F223B733A31383A2275706C6F6164732F546F676172322E6A7067223B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A31333A226A656E69735F6469666162656C223B733A393A2254756E6172756E6775223B733A353A22746F6B656E223B733A34303A2233643364636664643033313461653731393066376264376332313838356636326431396330653664223B7D);
INSERT INTO `ci_sessions` VALUES ('8jifl7gg41m9klj34ebolulup3jt9dkj', '::1', 1654834684, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343833343637373B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('8m9shtoigel2e11j8e3t0ccjnt52krhu', '::1', 1654185319, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343138353331393B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('952ccrg21vf4qqikcr8ksin0q7p1qtjb', '::1', 1655158763, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635353135383736333B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('9l7hemsid2hpo5fo6qnsk765feco6bi5', '::1', 1655162021, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635353136323032313B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('9p5bh2fjhub3rf2eetpluddp3jepgb0b', '::1', 1654832207, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343833323230373B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333937223B733A383A22757365726E616D65223B733A31353A22313735313230313030313131303233223B733A343A226E616D65223B733A31373A224C697669612059757374616E74696E6168223B733A353A22656D61696C223B733A32333A226C69766961794073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A30363A3438223B733A31303A2273747564656E745F6964223B733A333A22333935223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A353A224C69766961223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831393036303631373339223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2266346537646662663230363337353362666235663034306534303933303136393065383737623161223B7D);
INSERT INTO `ci_sessions` VALUES ('a63dil4q623o6lpf6fc89mrvdhcfaild', '::1', 1653918818, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333931383831383B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22353136223B733A383A22757365726E616D65223B733A31353A22323035313230333031313131303331223B733A343A226E616D65223B733A31383A22416E64696E69204C61696C79205075747269223B733A353A22656D61696C223B733A32393A22616E64696E695F6C61696C794073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032312D30352D30322031303A35373A3234223B733A31303A2273747564656E745F6964223B733A333A22353131223B733A393A226D616A6F72735F6964223B733A323A223638223B733A393A226E69636B5F6E616D65223B733A363A22416E64696E69223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303230223B733A353A226E6F5F6870223B733A31313A223038393938393331393535223B733A353A2270686F746F223B733A32383A2275706C6F6164732F323035313230333031313131303331312E6A7067223B733A333A226B746D223B733A33313A2275706C6F6164732F6B746D323035313230333031313131303331312E6A7067223B733A31303A2262697274685F64617465223B733A31303A22323030332D30342D3134223B733A353A22746F6B656E223B733A34303A2265306332633437356263336665306639653034333062653733663664643161633662303635626366223B733A31363A226A656E69735F707265666572656E7369223B733A31343A224261686173612049737961726174223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('b055qrhkcg793aln43q0hkonqtmks2sb', '::1', 1654862555, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343836323535353B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('bmb66tfjrbfv5mo60glot3iamu6rdnbc', '::1', 1654834677, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343833343637373B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('crvpu9vjglubku2r0ba7gh3hanaiklfp', '::1', 1654831856, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343833313835363B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333937223B733A383A22757365726E616D65223B733A31353A22313735313230313030313131303233223B733A343A226E616D65223B733A31373A224C697669612059757374616E74696E6168223B733A353A22656D61696C223B733A32333A226C69766961794073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A30363A3438223B733A31303A2273747564656E745F6964223B733A333A22333935223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A353A224C69766961223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831393036303631373339223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2266346537646662663230363337353362666235663034306534303933303136393065383737623161223B7D);
INSERT INTO `ci_sessions` VALUES ('d8defk4ms3ad738lgu8cr8s3nrk2nkp3', '::1', 1654244556, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343234343535363B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('dafg2rfu2ltv76r0ggqqt2k4inqapvdf', '::1', 1654307023, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343330373032333B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('de3l93kau44o5mrgf9baiajhft99pnmc', '::1', 1654183615, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343138333631353B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('djb652e64pk9r1kktn13kpnm9ukgbr50', '::1', 1654833263, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343833333236333B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('dvoeo38mtgihspek25ngipj4g9cknend', '::1', 1653924390, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333932343339303B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('e49qphit8dq56her0enhr4i8pteciogv', '::1', 1654243862, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343234333836323B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('e8hbb8o2i9nf9vf1eptpj94dasdk5b4p', '::1', 1654241438, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343234313433383B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('eih7h3fict6f8442scfc37j9uc7ngon5', '::1', 1653919488, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333931393438383B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22353136223B733A383A22757365726E616D65223B733A31353A22323035313230333031313131303331223B733A343A226E616D65223B733A31383A22416E64696E69204C61696C79205075747269223B733A353A22656D61696C223B733A32393A22616E64696E695F6C61696C794073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032312D30352D30322031303A35373A3234223B733A31303A2273747564656E745F6964223B733A333A22353131223B733A393A226D616A6F72735F6964223B733A323A223638223B733A393A226E69636B5F6E616D65223B733A363A22416E64696E69223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303230223B733A353A226E6F5F6870223B733A31313A223038393938393331393535223B733A353A2270686F746F223B733A32383A2275706C6F6164732F323035313230333031313131303331312E6A7067223B733A333A226B746D223B733A33313A2275706C6F6164732F6B746D323035313230333031313131303331312E6A7067223B733A31303A2262697274685F64617465223B733A31303A22323030332D30342D3134223B733A353A22746F6B656E223B733A34303A2265306332633437356263336665306639653034333062653733663664643161633662303635626366223B733A31363A226A656E69735F707265666572656E7369223B733A31343A224261686173612049737961726174223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('eo0kk4ffio34a520ldgjt0h8nlkn9s1m', '::1', 1654056023, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343035363032333B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31343A7B733A373A22757365725F6964223B733A333A22353039223B733A383A22757365726E616D65223B733A31353A22313935313030353030313131303132223B733A343A226E616D65223B733A31313A224E7572756C205761666127223B733A353A22656D61696C223B733A32363A226E7572756C776166614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032312D30352D30312031353A33323A3433223B733A31303A2273747564656E745F6964223B733A333A22353034223B733A393A226D616A6F72735F6964223B733A323A223633223B733A393A226E69636B5F6E616D65223B733A353A225761666127223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303831333539313436323333223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('f5svtn7ocjd9hnfgddnte9ok2vojama8', '::1', 1654169803, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343136393830333B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('flv8p0gekm3i4eke674ntgp8b30tn573', '::1', 1655127949, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635353132373930363B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('fqka40f9uns63rfockkkrv89e3vchi5l', '::1', 1654533115, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343533333038393B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('fsgjpbnoirbqf4at1eotgm1s0rjsuak5', '::1', 1653976560, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333937363532383B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('g10arqsfdngkbumuj89nl7aqtv9lfan9', '::1', 1654865607, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343836353630373B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('g1cic2tg62ce1v70e1jqpq38qbr3hu8j', '::1', 1654228942, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343232383934323B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('g1mj9860q764a7uhdff5fk865268fiuc', '::1', 1654529588, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343532393538383B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('gc9nov95ru730bdad87tr36s2vts95g0', '::1', 1654241081, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343234313038313B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('gn0es1ajkuoqn8a22e23015pt4t59g7o', '::1', 1655160609, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635353136303630393B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('gqt78t8mj63eetavido5m4uh1jp07h10', '::1', 1654056348, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343035363334383B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('h2h4h67icijktsrlq0011672b5e0vm5b', '::1', 1654183920, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343138333932303B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('hdumt128moh5imdko45oisrfugf47jk0', '::1', 1654866457, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343836363333363B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('hfsp8po2219eem7mv818p17hl9e33hpc', '::1', 1654178099, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343137383039393B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('hlod3c06taveqelqm0gj2kbnc5lk3b0m', '::1', 1653925631, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333932353633313B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('ib6gorn69vfnogf5sccskminh42s511p', '::1', 1654308570, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343330383537303B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('icop5dckchs73dhs6hmfdv1ife6s6qgu', '::1', 1654178504, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343137383530343B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('j5ab4lkf53tjcu2r6on9ia7uaplflnrn', '::1', 1654050604, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343035303630343B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31343A7B733A373A22757365725F6964223B733A333A22353039223B733A383A22757365726E616D65223B733A31353A22313935313030353030313131303132223B733A343A226E616D65223B733A31313A224E7572756C205761666127223B733A353A22656D61696C223B733A32363A226E7572756C776166614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032312D30352D30312031353A33323A3433223B733A31303A2273747564656E745F6964223B733A333A22353034223B733A393A226D616A6F72735F6964223B733A323A223633223B733A393A226E69636B5F6E616D65223B733A353A225761666127223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303831333539313436323333223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('jemdhbene84143uvint24603jutn986u', '::1', 1654862445, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343836323434353B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22333732223B733A383A22757365726E616D65223B733A31353A22313933313430373139313131303031223B733A343A226E616D65223B733A32353A22546F67617220596F6E617468616E204E617069747570756C75223B733A353A22656D61696C223B733A31393A22746F6761723937313240676D61696C2E636F6D223B733A31303A226361706162696C697479223B733A373A226469666162656C223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392030363A32303A3533223B733A31303A2273747564656E745F6964223B733A333A22333730223B733A393A226D616A6F72735F6964223B733A323A223938223B733A393A226E69636B5F6E616D65223B733A353A22546F676172223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303831333731383534373233223B733A353A2270686F746F223B733A31383A2275706C6F6164732F546F676172322E6A7067223B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A31333A226A656E69735F6469666162656C223B733A393A2254756E6172756E6775223B733A353A22746F6B656E223B733A34303A2233643364636664643033313461653731393066376264376332313838356636326431396330653664223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('k5gh3gobfikf3jqve34e0lggq5sn3q75', '::1', 1654185631, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343138353633313B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('k66vtkfdc50k4esscs7kphed1v4lkc37', '::1', 1654246340, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343234363334303B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('k79rfod803r5fv4umu6vq289alfv4bma', '::1', 1654524878, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343532343837383B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('k88pquef4c8u41fo6bq0pr0g7l633aee', '::1', 1654184342, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343138343334323B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('kbv3k10cpkpa89i5p11mlf7r9tdi6kt0', '::1', 1654833988, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343833333938383B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333937223B733A383A22757365726E616D65223B733A31353A22313735313230313030313131303233223B733A343A226E616D65223B733A31373A224C697669612059757374616E74696E6168223B733A353A22656D61696C223B733A32333A226C69766961794073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A30363A3438223B733A31303A2273747564656E745F6964223B733A333A22333935223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A353A224C69766961223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831393036303631373339223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2266346537646662663230363337353362666235663034306534303933303136393065383737623161223B7D);
INSERT INTO `ci_sessions` VALUES ('kfoho1u3rmt5nslf5b3cphpnvkf8iibn', '::1', 1654529909, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343532393930393B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('kinkpmst3gng3o2tk612iousgfamopgv', '::1', 1654240726, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343234303732363B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('kuf35reeshh0udmd74b37cpd9nnqqg5t', '::1', 1654230348, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343233303131323B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22333732223B733A383A22757365726E616D65223B733A31353A22313933313430373139313131303031223B733A343A226E616D65223B733A32353A22546F67617220596F6E617468616E204E617069747570756C75223B733A353A22656D61696C223B733A31393A22746F6761723937313240676D61696C2E636F6D223B733A31303A226361706162696C697479223B733A373A226469666162656C223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392030363A32303A3533223B733A31303A2273747564656E745F6964223B733A333A22333730223B733A393A226D616A6F72735F6964223B733A323A223938223B733A393A226E69636B5F6E616D65223B733A353A22546F676172223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303831333731383534373233223B733A353A2270686F746F223B733A31383A2275706C6F6164732F546F676172322E6A7067223B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A31333A226A656E69735F6469666162656C223B733A393A2254756E6172756E6775223B733A353A22746F6B656E223B733A34303A2233643364636664643033313461653731393066376264376332313838356636326431396330653664223B7D);
INSERT INTO `ci_sessions` VALUES ('l7vskh3rpjn8aopn4in7l8cbhhoila2v', '::1', 1653921994, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333932313939343B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('la3181qgoetljtae0v1tra2u561bvn08', '::1', 1654184679, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343138343637393B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('leeeb242f64hobi52np0dp1pphjn9lnd', '::1', 1654524530, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343532343533303B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('lve14tfir4qarqegoq6sdvppri9q23sd', '::1', 1654050961, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343035303936313B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31343A7B733A373A22757365725F6964223B733A333A22353039223B733A383A22757365726E616D65223B733A31353A22313935313030353030313131303132223B733A343A226E616D65223B733A31313A224E7572756C205761666127223B733A353A22656D61696C223B733A32363A226E7572756C776166614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032312D30352D30312031353A33323A3433223B733A31303A2273747564656E745F6964223B733A333A22353034223B733A393A226D616A6F72735F6964223B733A323A223633223B733A393A226E69636B5F6E616D65223B733A353A225761666127223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303831333539313436323333223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('m6dutpqt94iuhpjl24q0gi40eus78kea', '::1', 1655127906, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635353132373930363B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('m8k1op2oourdak47t0l9mg2j9lte1u7u', '::1', 1654864601, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343836343630313B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('n15r3040fen7vel1t83f6nh40ckshr3o', '::1', 1653926028, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333932363032383B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('nkt6aps3ua5qnmahq81ffrjma96unabb', '::1', 1654178884, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343137383838343B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('o9tin4u0l4luh1bi510hqjuk7oqe1905', '::1', 1654523230, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343532333233303B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('ohu0gc8rbuf8k4heh3fd5s3j1nb5vffg', '::1', 1654523604, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343532333630343B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('oq864luhe4i4k3vr7ruidddp097t9cho', '::1', 1654524220, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343532343232303B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('p8onoommii74fnivsf4833um93fjkvu1', '::1', 1654244213, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343234343231333B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('pailvn47k5nm7id0okj7t6nbam481hup', '::1', 1654175989, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343137353938393B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('pbrnlkk44hpps9vepd5k2jk2l98dkegh', '::1', 1654176305, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343137363330353B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('plpmfk3q2p2effqmjdg3ubr1hel3tnva', '::1', 1654242138, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343234323133383B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('pnem78o5hfega41huqn2uo2qb1h53r9n', '::1', 1654185865, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343138353633313B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22343532223B733A383A22757365726E616D65223B733A31353A22313935303630373139313131303031223B733A343A226E616D65223B733A32323A225072616D65737469204561726C6920417379616E7469223B733A353A22656D61696C223B733A32373A22617374726965726C69617379613230313540676D61696C2E636F6D223B733A31303A226361706162696C697479223B733A373A226469666162656C223B733A31303A22637265617465645F6174223B733A31393A22323032302D31312D30372032303A34383A3136223B733A31303A2273747564656E745F6964223B733A333A22343530223B733A393A226D616A6F72735F6964223B733A323A223334223B733A393A226E69636B5F6E616D65223B733A363A22417374726920223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303837383830373734373832223B733A353A2270686F746F223B733A32353A2275706C6F6164732F313630343739363432333335302E706E67223B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A31333A226A656E69735F6469666162656C223B733A393A2254756E6172756E6775223B733A353A22746F6B656E223B733A34303A2236303432393961643165653934636132323931326165656339653637633766313033386463653061223B7D);
INSERT INTO `ci_sessions` VALUES ('psk7j8js2udsa0rlm1eufsofl6q0j0da', '::1', 1654241808, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343234313830383B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('q22lsmvnppq0q0o3004809hmse739f24', '::1', 1654861728, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343836313732383B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22333732223B733A383A22757365726E616D65223B733A31353A22313933313430373139313131303031223B733A343A226E616D65223B733A32353A22546F67617220596F6E617468616E204E617069747570756C75223B733A353A22656D61696C223B733A31393A22746F6761723937313240676D61696C2E636F6D223B733A31303A226361706162696C697479223B733A373A226469666162656C223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392030363A32303A3533223B733A31303A2273747564656E745F6964223B733A333A22333730223B733A393A226D616A6F72735F6964223B733A323A223938223B733A393A226E69636B5F6E616D65223B733A353A22546F676172223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303831333731383534373233223B733A353A2270686F746F223B733A31383A2275706C6F6164732F546F676172322E6A7067223B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A31333A226A656E69735F6469666162656C223B733A393A2254756E6172756E6775223B733A353A22746F6B656E223B733A34303A2233643364636664643033313461653731393066376264376332313838356636326431396330653664223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('q5n2vs1ua6eom7bhrtrt57vv9ril6v3p', '::1', 1653966914, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333936363931343B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('qd02v03v48nbp3ralpbmn2rg5ule45c0', '::1', 1654307415, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343330373431353B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('r0bupu9sleb8e10r1dt5r622j7sdats9', '::1', 1654833993, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343833333938383B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333937223B733A383A22757365726E616D65223B733A31353A22313735313230313030313131303233223B733A343A226E616D65223B733A31373A224C697669612059757374616E74696E6168223B733A353A22656D61696C223B733A32333A226C69766961794073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A30363A3438223B733A31303A2273747564656E745F6964223B733A333A22333935223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A353A224C69766961223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831393036303631373339223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2266346537646662663230363337353362666235663034306534303933303136393065383737623161223B7D);
INSERT INTO `ci_sessions` VALUES ('r174nsumvo4h3eoaq3nhjentgk4shrfp', '::1', 1653975890, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333937353839303B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('rogv8r4jbvjapt3gtke88stcig4h7ha6', '::1', 1654184987, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343138343938373B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('s24c5qlsc44r2bac644qto6b0aub6kar', '::1', 1655162149, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635353136323032313B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('sc36a7kf6obo4tfkoredfgp1j1ku3af3', '::1', 1654229253, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343232393235333B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22333732223B733A383A22757365726E616D65223B733A31353A22313933313430373139313131303031223B733A343A226E616D65223B733A32353A22546F67617220596F6E617468616E204E617069747570756C75223B733A353A22656D61696C223B733A31393A22746F6761723937313240676D61696C2E636F6D223B733A31303A226361706162696C697479223B733A373A226469666162656C223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392030363A32303A3533223B733A31303A2273747564656E745F6964223B733A333A22333730223B733A393A226D616A6F72735F6964223B733A323A223938223B733A393A226E69636B5F6E616D65223B733A353A22546F676172223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303831333731383534373233223B733A353A2270686F746F223B733A31383A2275706C6F6164732F546F676172322E6A7067223B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A31333A226A656E69735F6469666162656C223B733A393A2254756E6172756E6775223B733A353A22746F6B656E223B733A34303A2233643364636664643033313461653731393066376264376332313838356636326431396330653664223B7D);
INSERT INTO `ci_sessions` VALUES ('stq51qsnoqprsdm4hf88v8asm0s9jhdo', '::1', 1654863183, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343836333138333B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('t6di7q36lb8prd4asll55nv23aibnu9u', '::1', 1654863399, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343836333138333B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22333732223B733A383A22757365726E616D65223B733A31353A22313933313430373139313131303031223B733A343A226E616D65223B733A32353A22546F67617220596F6E617468616E204E617069747570756C75223B733A353A22656D61696C223B733A31393A22746F6761723937313240676D61696C2E636F6D223B733A31303A226361706162696C697479223B733A373A226469666162656C223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392030363A32303A3533223B733A31303A2273747564656E745F6964223B733A333A22333730223B733A393A226D616A6F72735F6964223B733A323A223938223B733A393A226E69636B5F6E616D65223B733A353A22546F676172223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303831333731383534373233223B733A353A2270686F746F223B733A31383A2275706C6F6164732F546F676172322E6A7067223B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A31333A226A656E69735F6469666162656C223B733A393A2254756E6172756E6775223B733A353A22746F6B656E223B733A34303A2233643364636664643033313461653731393066376264376332313838356636326431396330653664223B7D);
INSERT INTO `ci_sessions` VALUES ('t7q9br8o4qn8nrbullra62ipdrvr8jne', '::1', 1653975334, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333937353333343B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('taefuteijbin56m53qge9uh1s08ttalc', '::1', 1654861405, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343836313430353B);
INSERT INTO `ci_sessions` VALUES ('tt7o0qjdnq9mq01f40b0tmm08qc7dp3c', '::1', 1654180865, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343138303836353B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('u9hb31kmo2lj0lb9g6urfpjprtek7j5q', '::1', 1653925083, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333932353038333B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);
INSERT INTO `ci_sessions` VALUES ('uc2cb9a4f1rrqt2i9j1gglg7go1ok406', '::1', 1654056578, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343035363334383B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31343A7B733A373A22757365725F6964223B733A333A22353039223B733A383A22757365726E616D65223B733A31353A22313935313030353030313131303132223B733A343A226E616D65223B733A31313A224E7572756C205761666127223B733A353A22656D61696C223B733A32363A226E7572756C776166614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032312D30352D30312031353A33323A3433223B733A31303A2273747564656E745F6964223B733A333A22353034223B733A393A226D616A6F72735F6964223B733A323A223633223B733A393A226E69636B5F6E616D65223B733A353A225761666127223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303831333539313436323333223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B7D);
INSERT INTO `ci_sessions` VALUES ('un4r65p4jh0ccu9v4n8f0m2lpfghpbb5', '::1', 1654832783, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343833323738333B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('uusntdvpm27f2dcog2a76da916ullb6u', '::1', 1654050286, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343035303238363B);
INSERT INTO `ci_sessions` VALUES ('v09fbtsfa6upjp0cjsdgu1rnqlhg6q80', '::1', 1654523912, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343532333931323B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('v7hjacjo1ph4uoakfr7jqe1d3tbl77gk', '::1', 1654862794, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343836323739343B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31353A7B733A373A22757365725F6964223B733A333A22333939223B733A383A22757365726E616D65223B733A31353A22313735313230313037313131303132223B733A343A226E616D65223B733A31373A22416669666168204E7572756C2049737961223B733A353A22656D61696C223B733A33323A226166696661686E7572756C697379614073747564656E742E75622E61632E6964223B733A31303A226361706162696C697479223B733A393A22766F6C756E74656572223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392031363A34343A3037223B733A31303A2273747564656E745F6964223B733A333A22333937223B733A393A226D616A6F72735F6964223B733A323A223636223B733A393A226E69636B5F6E616D65223B733A373A2241666966616820223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303137223B733A353A226E6F5F6870223B733A31323A22303831323335323033353931223B733A353A2270686F746F223B4E3B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A353A22746F6B656E223B733A34303A2239663331316231373361653562613132613266346532396163613038346231613136613238646236223B7D);
INSERT INTO `ci_sessions` VALUES ('v9mm7lmhsh134rgcnobm74arn5nr68k4', '::1', 1654230112, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343233303131323B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A31363A7B733A373A22757365725F6964223B733A333A22333732223B733A383A22757365726E616D65223B733A31353A22313933313430373139313131303031223B733A343A226E616D65223B733A32353A22546F67617220596F6E617468616E204E617069747570756C75223B733A353A22656D61696C223B733A31393A22746F6761723937313240676D61696C2E636F6D223B733A31303A226361706162696C697479223B733A373A226469666162656C223B733A31303A22637265617465645F6174223B733A31393A22323032302D30392D31392030363A32303A3533223B733A31303A2273747564656E745F6964223B733A333A22333730223B733A393A226D616A6F72735F6964223B733A323A223938223B733A393A226E69636B5F6E616D65223B733A353A22546F676172223B733A31363A22636C6173735F6F665F636F6C6C656765223B733A343A2232303139223B733A353A226E6F5F6870223B733A31323A22303831333731383534373233223B733A353A2270686F746F223B733A31383A2275706C6F6164732F546F676172322E6A7067223B733A333A226B746D223B4E3B733A31303A2262697274685F64617465223B4E3B733A31333A226A656E69735F6469666162656C223B733A393A2254756E6172756E6775223B733A353A22746F6B656E223B733A34303A2233643364636664643033313461653731393066376264376332313838356636326431396330653664223B7D);
INSERT INTO `ci_sessions` VALUES ('vbic67s0c20ahql0o1ts5ttdih7femp2', '::1', 1654833624, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343833333632343B766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('vfb7p327ldfknnqgb9ossf0ml157q5ik', '::1', 1653920731, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333932303733313B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('vhrs0gru2olusv1dcptc49b91mdufb95', '::1', 1654228577, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635343232383537373B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D766F6C756E746565725F6170705F68346B336834697533726834697572683334695F73657373696F6E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A343A226E616D65223B733A32363A2250534C4420556E6976657273697461732042726177696A617961223B733A353A22656D61696C223B733A32323A2270736C6462726177696A6179614075622E61632E6964223B733A31303A226361706162696C697479223B733A353A2261646D696E223B733A31303A22637265617465645F6174223B733A31393A22323031392D30332D33302031343A35353A3538223B7D);

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
	`app_majors`.`majors_focus` AS `majors_focus`
FROM
	(
		`app_faculties`
		LEFT JOIN `app_majors` ON ((
			`app_majors`.`faculty_id` = `app_faculties`.`faculty_id` 
	))) ;

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
	`app_student_active`.`register_id` AS `register_id`,
	`app_student_active`.`approver_id` AS `approver_id`,
	`app_student_active`.`created_at` AS `created_at`,
	`app_accompaniment`.`accompaniment_id`,
	`app_accompaniment`.`student_status`,
	`app_accompaniment`.`volunteer_status`
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
			AND ( `app_schedule_student`.`student_id` = `app_student_active`.`student_id` )))) 
			LEFT JOIN  app_accompaniment ON app_accompaniment.schedule_student_id = app_schedule_student.schedule_student_id
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

SET FOREIGN_KEY_CHECKS = 1;
