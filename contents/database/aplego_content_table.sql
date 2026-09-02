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

-- --------------------------------------------------------

--
-- Struktur dari tabel `content_categories`
--

DROP TABLE IF EXISTS `content_categories`;
CREATE TABLE IF NOT EXISTS `content_categories` (
  `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `category_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `category_type` varchar(20) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_slug` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `user_id` (`user_id`),
  KEY `category_parent_id` (`category_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `content_media`
--

DROP TABLE IF EXISTS `content_media`;
CREATE TABLE IF NOT EXISTS `content_media` (
  `media_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `media_type` varchar(20) NOT NULL,
  `media_name` varchar(100) NOT NULL,
  `media_slug` varchar(100) NOT NULL,
  `media_folder` varchar(100) NOT NULL,
  `media_ext` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`media_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `content_menu`
--

DROP TABLE IF EXISTS `content_menu`;
CREATE TABLE IF NOT EXISTS `content_menu` (
  `menu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(100) NOT NULL,
  `menu_slug` varchar(100) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `content_menu_item`
--

DROP TABLE IF EXISTS `content_menu_item`;
CREATE TABLE IF NOT EXISTS `content_menu_item` (
  `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `item_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `item_type` varchar(20) NOT NULL,
  `item_label` varchar(100) NOT NULL,
  `item_icon` varchar(100) NOT NULL,
  `item_uri` varchar(100) NOT NULL,
  `item_order` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `menu_id` (`menu_id`),
  KEY `item_parent_id` (`item_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `content_posts`
--

DROP TABLE IF EXISTS `content_posts`;
CREATE TABLE IF NOT EXISTS `content_posts` (
  `post_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `post_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `post_type` varchar(20) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_slug` varchar(255) NOT NULL,
  `post_content` text NOT NULL,
  `post_thumb_id` int(10) UNSIGNED DEFAULT NULL,
  `post_order` int(10) UNSIGNED NOT NULL,
  `publish` varchar(20) NOT NULL,
  `publish_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `post_parent_id` (`post_parent_id`),
  KEY `post_thumb_id` (`post_thumb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `content_post_category`
--

DROP TABLE IF EXISTS `content_post_category`;
CREATE TABLE IF NOT EXISTS `content_post_category` (
  `post_category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`post_category_id`),
  KEY `post_id` (`post_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `content_post_meta`
--

DROP TABLE IF EXISTS `content_post_meta`;
CREATE TABLE IF NOT EXISTS `content_post_meta` (
  `meta_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` int(10) UNSIGNED NOT NULL,
  `meta_key` varchar(100) NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `content_widget`
--

DROP TABLE IF EXISTS `content_widget`;
CREATE TABLE IF NOT EXISTS `content_widget` (
  `widget_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `widget_group` varchar(20) NOT NULL,
  `widget_type` varchar(20) NOT NULL,
  `widget_title` varchar(100) NOT NULL,
  `widget_content` text NOT NULL,
  `widget_order` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `aplego_user_meta`
--
ALTER TABLE `aplego_user_meta`
  ADD CONSTRAINT `aplego_user_meta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `aplego_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `content_categories`
--
ALTER TABLE `content_categories`
  ADD CONSTRAINT `content_categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `aplego_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `content_categories_ibfk_2` FOREIGN KEY (`category_parent_id`) REFERENCES `content_categories` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `content_media`
--
ALTER TABLE `content_media`
  ADD CONSTRAINT `content_media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `aplego_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `content_menu_item`
--
ALTER TABLE `content_menu_item`
  ADD CONSTRAINT `content_menu_item_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `content_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `content_menu_item_ibfk_2` FOREIGN KEY (`item_parent_id`) REFERENCES `content_menu_item` (`item_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `content_posts`
--
ALTER TABLE `content_posts`
  ADD CONSTRAINT `content_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `aplego_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `content_posts_ibfk_2` FOREIGN KEY (`post_parent_id`) REFERENCES `content_posts` (`post_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `content_posts_ibfk_3` FOREIGN KEY (`post_thumb_id`) REFERENCES `content_media` (`media_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `content_post_category`
--
ALTER TABLE `content_post_category`
  ADD CONSTRAINT `content_post_category_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `content_posts` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `content_post_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `content_categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `content_post_meta`
--
ALTER TABLE `content_post_meta`
  ADD CONSTRAINT `content_post_meta_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `content_posts` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
