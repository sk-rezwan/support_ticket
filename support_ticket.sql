-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 17, 2025 at 06:39 PM
-- Server version: 8.0.31
-- PHP Version: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `support_ticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
CREATE TABLE IF NOT EXISTS `branches` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `branch_code` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `branch_code`, `created_at`, `updated_at`) VALUES
(1, 'Kuti', 1, NULL, NULL),
(2, 'Dharkhar', 2, NULL, NULL),
(3, 'Chargas', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `status` int DEFAULT '0',
  `solved_by` varchar(333) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `subject`, `description`, `status`, `solved_by`, `created_at`, `updated_at`) VALUES
(1, 6, 'test ticket', 'test description test description test description test description test description', 1, NULL, '2025-06-01 02:45:11', '2025-06-21 14:37:03'),
(2, 2, 'Branch test create ticket 1', 'A problem description in IT, also known as a problem statement, clearly defines an issue within an IT system or application. It aims to pinpoint the problem, its impact, and the desired resolution, ensuring everyone involved understands the issue and works towards the same goal.', 1, '6', '2025-06-01 18:00:00', '2025-06-21 14:37:07'),
(3, 3, 'test ticket issue', 'test ticket issuetest ticket issuetest ticket issuetest ticket issuetest ticket issue', 2, '1', '2025-06-03 14:37:40', '2025-06-21 14:37:48'),
(4, 7, 'CDIP EYE Day end problem', 'Day end shows 16 June. Day back needed 15 June.', 0, '4', '2025-06-03 18:00:00', '2025-06-21 14:37:52'),
(5, 8, 'Chargas Ianctive delete', 'Sir, SL. 155003 inactive delete please.', 2, '4', '2025-06-04 18:00:00', '2025-06-21 14:38:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` enum('admin','branch') COLLATE utf8mb4_general_ci DEFAULT 'branch',
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'F M Nafis', 'admin@example.com', NULL, '$2y$10$.mFhM9dA9ByLG4tRqMjs0eLrl5QDvkCdHxbAV355ROvlMzwWSREqS', NULL, 'admin', NULL, '2025-06-13 02:28:57', '2025-06-20 18:28:56'),
(2, 'Branch One', 'branch1@example.com', NULL, '$2y$10$aozX6iRlxCP1.5PznkORXOjNwlwrz1Jn/b8phEsOEk/sEsIKP0es6', NULL, 'branch', 1, '2025-06-13 02:28:57', '2025-06-13 02:28:57'),
(3, 'Branch Two', 'branch2@example.com', NULL, '$2y$10$mh1QWO8kfx6dkG3nWoqM1.w0RDyHz4s/tJYpiZLedWngRJCX83Nw.', NULL, 'branch', 2, '2025-06-13 02:28:57', '2025-06-13 02:28:57'),
(4, 'Rezwan', 'rezwanul@cdipbd.org', NULL, '$2y$10$opdPg8cNFG2WGWtNXKMqW.gmz8IgXQEivRzxMbnIHc/rkK/nvzd3S', NULL, 'admin', NULL, '2025-06-13 02:28:57', '2025-06-20 18:27:07'),
(6, 'Dibya', 'admin@mail.com', NULL, '$2y$10$Z4k9sLDWiTiP77Xuzsdjm.Wi8MwEGj7y1TNlC.JOqYs0HjylT2Qhe', NULL, 'admin', NULL, '2025-06-13 02:28:57', '2025-06-20 18:27:21'),
(7, 'Kuti', 'kuti001@cdipbd.org', NULL, '$2y$10$mh1QWO8kfx6dkG3nWoqM1.w0RDyHz4s/tJYpiZLedWngRJCX83Nw.', NULL, 'branch', 2, '2025-06-13 02:28:57', '2025-06-15 17:04:03'),
(8, 'Chargas BM', 'chargas003@cdipbd.org', NULL, '$2y$10$mh1QWO8kfx6dkG3nWoqM1.w0RDyHz4s/tJYpiZLedWngRJCX83Nw.', NULL, 'branch', 3, '2025-06-13 02:28:57', '2025-06-15 17:04:03');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
