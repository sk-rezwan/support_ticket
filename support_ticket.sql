-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 12, 2025 at 08:49 PM
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `branch_code`, `created_at`, `updated_at`) VALUES
(1, 'Kuti', 1, NULL, NULL),
(2, 'Dharkhar', 2, NULL, NULL),
(3, 'Chargas', 3, NULL, NULL),
(4, 'Head Office', 9999, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `assign_role_ids` varchar(99) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `assign_role_ids`, `created_at`, `updated_at`) VALUES
(1, 'Software Support', '1', NULL, NULL),
(2, 'Hardware Support', '2', NULL, NULL),
(3, 'Email or Outlook Support', '3', NULL, NULL),
(4, 'General Inquiry', '4', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

DROP TABLE IF EXISTS `priorities`;
CREATE TABLE IF NOT EXISTS `priorities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `priorities_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Low', NULL, NULL),
(2, 'Medium', NULL, NULL),
(3, 'High', NULL, NULL),
(4, 'Urgent', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'Engineer', NULL, NULL),
(3, 'Branch', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE IF NOT EXISTS `sub_categories` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_categories_category_id_index` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Installation/Setup', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(2, 1, 'Mobile Apps Related Problem', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(3, 1, 'CDIP EYE Issues', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(4, 1, 'Smart Move Issues', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(5, 1, 'Planning Software Issues', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(6, 1, 'HRM Leave/ Visit Issues', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(7, 2, 'Laptop/Desktop Issues', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(8, 2, 'Printer Problems', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(9, 2, 'Network Device Issues', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(10, 2, 'Peripheral Issues', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(11, 2, 'Hardware Replacement', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(12, 2, 'Power/Battery Issues', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(13, 3, 'Login Issues', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(14, 3, 'Send/Receive Errors', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(15, 3, 'Mailbox Full', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(16, 3, 'Outlook Setup', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(17, 3, 'Sync Problems', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(18, 3, 'Rules/Filters Issues', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(19, 4, 'Access Requests', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(20, 4, 'Password Reset Guidance', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(21, 4, 'Network Connectivity Questions', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(22, 4, 'VPN/Remote Access Questions', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(23, 4, 'System/Service Availability', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(24, 4, 'IT Policy/Security Questions', '2025-11-16 16:13:00', '2025-11-16 16:13:00');

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
  `priority_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `sub_category_id` int DEFAULT NULL,
  `assigned_to` int DEFAULT NULL,
  `solved_by` varchar(333) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_person` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `subject`, `description`, `status`, `priority_id`, `category_id`, `sub_category_id`, `assigned_to`, `solved_by`, `contact_person`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 1, 'test subj 1', 'test desc 1', 0, 2, 2, 7, 11, NULL, 'test contact 207', NULL, '2025-11-21 13:24:36', '2025-11-22 11:37:34'),
(2, 1, 'test subj 2', 'test desc 2', 0, 1, 1, 1, NULL, NULL, 'test contact 453', NULL, '2025-11-21 13:24:36', '2025-11-21 13:24:36'),
(3, 1, 'not printing', 'page stuck', 0, NULL, 2, 8, NULL, NULL, '461', NULL, '2025-11-28 12:50:10', '2025-11-28 12:50:10'),
(4, 1, 'achv issues', 'issues new entry', 0, NULL, 1, 5, 15, NULL, 'p mondal 455', NULL, '2025-12-12 06:31:44', '2025-12-12 14:42:02'),
(5, 1, 'test role', 'test role id', 0, NULL, 1, 3, 14, NULL, '1111', NULL, '2025-12-12 07:30:26', '2025-12-12 14:41:00'),
(6, 1, 'test hrd assign to', 'test hrd assign totest hrd assign to', 0, NULL, 2, 11, 15, NULL, NULL, NULL, '2025-12-12 07:34:13', '2025-12-12 07:34:13'),
(7, 1, 'app related issue', 'software issue', 0, NULL, 1, 2, 12, NULL, '1111', NULL, '2025-12-12 07:34:45', '2025-12-12 14:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_engineer`
--

DROP TABLE IF EXISTS `ticket_engineer`;
CREATE TABLE IF NOT EXISTS `ticket_engineer` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_engineer`
--

INSERT INTO `ticket_engineer` (`id`, `ticket_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 6, 15, '2025-12-12 07:34:13', '2025-12-12 07:34:13'),
(2, 7, 4, '2025-12-12 07:34:13', '2025-12-12 07:34:13'),
(3, 7, 6, '2025-12-12 07:34:13', '2025-12-12 07:34:13');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
CREATE TABLE IF NOT EXISTS `ticket_replies` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_replies_ticket_id_foreign` (`ticket_id`),
  KEY `ticket_replies_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_replies`
--

INSERT INTO `ticket_replies` (`id`, `ticket_id`, `user_id`, `message`, `note`, `created_at`, `updated_at`) VALUES
(1, 5, 4, NULL, 'test', '2025-12-12 14:41:00', '2025-12-12 14:41:00'),
(2, 7, 4, NULL, 't', '2025-12-12 14:41:25', '2025-12-12 14:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_status_logs`
--

DROP TABLE IF EXISTS `ticket_status_logs`;
CREATE TABLE IF NOT EXISTS `ticket_status_logs` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` int UNSIGNED NOT NULL,
  `status` tinyint NOT NULL,
  `changed_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_status_logs`
--

INSERT INTO `ticket_status_logs` (`id`, `ticket_id`, `status`, `changed_by`, `created_at`) VALUES
(1, 38, 1, 4, '2025-11-16 11:04:38'),
(2, 39, 1, 4, '2025-11-19 11:42:36'),
(3, 42, 1, 4, '2025-11-19 11:44:14'),
(4, 43, 2, 4, '2025-11-19 11:44:40');

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
  `role` int NOT NULL,
  `role_id` int DEFAULT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `role_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'F M Nafis', '3628', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, NULL, 4, '2025-06-13 02:28:57', '2025-11-18 16:56:20'),
(10, 'Polash', '2397', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 2, NULL, 4, '2025-06-13 02:28:57', '2025-11-18 16:56:11'),
(9, 'Dharkhar', 'bm0004', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 3, NULL, 2, '2025-06-13 02:28:57', '2025-11-18 16:56:04'),
(4, 'Rezwan', '4360', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, 1, 4, '2025-06-13 02:28:57', '2025-12-12 13:04:03'),
(6, 'Dibya', '5750', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, 1, 4, '2025-06-13 02:28:57', '2025-12-12 13:04:08'),
(7, 'Kuti', 'bm0001', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 3, NULL, 1, '2025-06-13 02:28:57', '2025-11-18 16:54:40'),
(8, 'Chargas', 'bm0003', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 3, NULL, 3, '2025-06-13 02:28:57', '2025-11-18 16:56:45'),
(14, 'Joyanta Kumer', '6246', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 2, NULL, 4, '2025-06-13 02:28:57', '2025-11-18 16:57:46'),
(11, 'Pronab Mondal', '2692', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 2, NULL, 4, '2025-06-13 02:28:57', '2025-11-18 16:56:30'),
(12, 'Bulon', '5696', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 2, NULL, 4, '2025-06-13 02:28:57', '2025-11-18 16:57:46'),
(15, 'Maznu', '1802', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 2, 2, 4, '2025-06-13 02:28:57', '2025-12-02 17:32:58');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
