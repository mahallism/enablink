-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 10 Jan 2019 pada 15.20
-- Versi server: 5.7.19
-- Versi PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anow_aplego_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `aplego_options`
--

DROP TABLE IF EXISTS `aplego_options`;
CREATE TABLE IF NOT EXISTS `aplego_options` (
  `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_key` varchar(100) NOT NULL,
  `option_value` text NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `aplego_users`
--

DROP TABLE IF EXISTS `aplego_users`;
CREATE TABLE IF NOT EXISTS `aplego_users` (
  `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(34) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `active` varchar(20) NOT NULL,
  `capability` varchar(20) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `login_count` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `aplego_user_meta`
--

DROP TABLE IF EXISTS `aplego_user_meta`;
CREATE TABLE IF NOT EXISTS `aplego_user_meta` (
  `meta_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `meta_key` varchar(100) NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `aplego_user_meta`
--
ALTER TABLE `aplego_user_meta`
  ADD CONSTRAINT `aplego_user_meta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `aplego_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
