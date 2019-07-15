-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 14, 2019 at 01:38 PM
-- Server version: 5.7.21
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_uas`
--

-- --------------------------------------------------------

--
-- Table structure for table `bukus`
--

DROP TABLE IF EXISTS `bukus`;
CREATE TABLE IF NOT EXISTS `bukus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_buku` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_kategori` int(10) UNSIGNED NOT NULL,
  `pengarang` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penerbit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bukus_id_kategori_foreign` (`id_kategori`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bukus`
--

INSERT INTO `bukus` (`id`, `nama_buku`, `filename`, `id_kategori`, `pengarang`, `penerbit`, `tahun`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'hujan', '1562085301.jpg', 1, 'lulu', 'gramedia', '2011', '0', NULL, NULL, '2019-07-02 09:35:01', '2019-07-08 11:27:18'),
(2, 'koala kumel', '1562610251.jpg', 1, 'mala', 'gramedia', '2012', '1', NULL, NULL, '2019-07-08 11:24:11', '2019-07-08 11:24:11');

-- --------------------------------------------------------

--
-- Table structure for table `kategoris`
--

DROP TABLE IF EXISTS `kategoris`;
CREATE TABLE IF NOT EXISTS `kategoris` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kategori` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategoris`
--

INSERT INTO `kategoris` (`id`, `kategori`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'fiksi', '1', NULL, NULL, '2019-07-02 09:34:23', '2019-07-02 09:34:23'),
(2, 'non fiktif', '0', NULL, NULL, '2019-07-08 11:28:47', '2019-07-08 11:31:37');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_06_29_092113_create_bukus_table', 1),
(4, '2019_06_29_092332_create_peminjamen_table', 1),
(5, '2019_06_29_092746_create_kategoris_table', 1),
(6, '2019_06_29_093205_add_fk_buku', 1),
(7, '2019_06_29_093225_add_fk_peminjamen', 1),
(8, '2019_06_29_112701_add_masa_on_table_peminjaman', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peminjamen`
--

DROP TABLE IF EXISTS `peminjamen`;
CREATE TABLE IF NOT EXISTS `peminjamen` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_buku` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` enum('Laki-Laki','Perempuan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `masa` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `peminjamen_id_buku_foreign` (`id_buku`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `peminjamen`
--

INSERT INTO `peminjamen` (`id`, `id_buku`, `nama`, `jk`, `alamat`, `tgl_pinjam`, `tgl_kembali`, `masa`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'mala', 'Perempuan', 'tegal', '2019-07-03', '2019-07-05', '1', '1', NULL, NULL, '2019-07-02 16:21:31', '2019-07-02 16:21:31'),
(2, 1, 'aldi', 'Laki-Laki', 'balapulang', '2019-07-02', '2019-07-10', '1', '0', NULL, NULL, '2019-07-08 11:33:49', '2019-07-08 11:35:25'),
(3, 2, 'chaula', 'Perempuan', 'tegal', '2019-07-03', '2019-07-10', '1', '1', NULL, NULL, '2019-07-08 11:38:43', '2019-07-08 11:38:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'chaula', 'chaulanoormala@gmail.com', NULL, '$2y$10$8qutxWgYNd3TfKyVaFsqGeu8os0MHLBjT5dxw6GFmukArpwkgvHDq', 'kkhbEbSK02nQ6F2BSP7h5cfriITMsuocZdaIaT9PCrYVsekJ7Ux2464lfLK3', '2019-07-02 09:14:00', '2019-07-02 09:14:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
