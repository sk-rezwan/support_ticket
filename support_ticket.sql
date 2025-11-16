-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 16, 2025 at 05:13 PM
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Software Support', NULL, NULL),
(2, 'Hardware Support', NULL, NULL),
(3, 'Email or Outlook Support', NULL, NULL),
(4, 'General Inquiry', NULL, NULL);

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
(2, 1, 'Updates/Patches', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(3, 1, 'Licensing Issues', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(4, 1, 'App Errors/Crashes', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(5, 1, 'Performance Issues', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
(6, 1, 'Compatibility Problems', '2025-11-16 16:13:00', '2025-11-16 16:13:00'),
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
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `subject`, `description`, `status`, `priority_id`, `category_id`, `sub_category_id`, `assigned_to`, `solved_by`, `contact_person`, `attachment`, `created_at`, `updated_at`) VALUES
(33, 2, 'test select cat', 'test select cat', 0, 2, 4, NULL, NULL, NULL, NULL, NULL, '2025-11-03 12:56:27', '2025-11-03 12:56:27'),
(34, 1, 'text direct cat', 'text direct cat', 2, 3, 4, NULL, NULL, '4', NULL, NULL, '2025-11-03 12:56:54', '2025-11-08 06:27:15'),
(35, 4, 'HRM Bill  back', 'bill option back', 0, 2, 1, NULL, NULL, NULL, 'Employee (HR)', NULL, '2025-11-03 13:04:29', '2025-11-09 12:28:17'),
(29, 3, 'Test Chargas', 'Test Chargas', 1, 2, 1, NULL, NULL, '4', NULL, NULL, '2025-11-02 11:53:05', '2025-11-02 11:53:15'),
(30, 4, 'Test HO', 'Test HO', 2, 4, 4, NULL, NULL, '11', 'Nafis FM', NULL, '2025-11-02 11:53:47', '2025-11-09 12:28:31'),
(31, 1, 'PC Issue', 'Motherboard problem', 1, 3, 2, NULL, 10, NULL, 'arun 0131301111', NULL, '2025-11-02 11:58:18', '2025-11-10 12:47:41'),
(32, 3, 'CDIP EYE Day end problem', 'need day back', 2, 3, 3, NULL, 11, '11', 'BAC 01671137783', 'tickets/i4BCWPfBgESdYH6Mz4s7Uxq9yRcAExPVhngfqzG2.png', '2025-11-03 12:42:48', '2025-11-10 12:43:43'),
(28, 2, 'test Dharkhar', 'test Dharkhar', 0, 2, 2, NULL, NULL, NULL, NULL, NULL, '2025-11-02 11:52:36', '2025-11-02 11:52:36'),
(36, 2, 'test assign issue', 'assign test', 2, 3, 1, 1, 12, '12', 'bm 013130111022', NULL, '2025-11-10 12:55:07', '2025-11-15 16:49:48'),
(37, 1, 'app not loggin in', 'shows network error alert', 0, 4, 1, 3, NULL, NULL, 'Nafiz 453', NULL, '2025-11-15 11:04:05', '2025-11-15 11:04:05'),
(38, 1, 'authe app issue', 'need to install auth app', 1, 4, 3, 16, 12, NULL, 'akash 981', 'tickets/8j0Us1agf2oGkBE9mC7uX7z9DFwmDlWauCozaE7E.jpg', '2025-11-16 11:01:47', '2025-11-16 11:04:38');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
CREATE TABLE IF NOT EXISTS `ticket_replies` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_replies_ticket_id_foreign` (`ticket_id`),
  KEY `ticket_replies_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_replies`
--

INSERT INTO `ticket_replies` (`id`, `ticket_id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 35, 4, 'Your request for bill back option is proceed. Thanks !', '2025-11-08 06:08:20', '2025-11-08 06:08:20'),
(2, 31, 4, 'test reply 1: Is Cooling fan working?', '2025-11-08 06:12:05', '2025-11-08 06:12:05'),
(3, 31, 7, 'No sir, fan is not working.', '2025-11-08 06:16:31', '2025-11-08 06:16:31'),
(4, 31, 4, 'test role 1,2', '2025-11-09 11:53:21', '2025-11-09 11:53:21'),
(5, 30, 11, 'test reply to HO', '2025-11-09 12:23:40', '2025-11-09 12:23:40'),
(6, 32, 11, 'ok got it', '2025-11-10 12:26:51', '2025-11-10 12:26:51'),
(7, 36, 4, 'ok', '2025-11-10 12:55:24', '2025-11-10 12:55:24'),
(8, 36, 12, 'working on it', '2025-11-10 12:56:28', '2025-11-10 12:56:28'),
(9, 38, 4, 'working on this on anydesk', '2025-11-16 11:03:52', '2025-11-16 11:03:52');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_status_logs`
--

INSERT INTO `ticket_status_logs` (`id`, `ticket_id`, `status`, `changed_by`, `created_at`) VALUES
(1, 38, 1, 4, '2025-11-16 11:04:38');

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `role_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'F M Nafis', 'admin@example.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, NULL, 4, '2025-06-13 02:28:57', '2025-11-02 17:19:46'),
(10, 'Polash', 'polash@cdipbd.org', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 2, NULL, 4, '2025-06-13 02:28:57', '2025-11-08 11:20:14'),
(9, 'Dharkhar', 'dharkha4@cdipbd.org', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 3, NULL, 2, '2025-06-13 02:28:57', '2025-11-02 17:38:46'),
(4, 'Rezwan', 'rezwanul@cdipbd.org', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, NULL, 4, '2025-06-13 02:28:57', '2025-11-02 17:19:50'),
(6, 'Dibya', 'admin@mail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, NULL, 4, '2025-06-13 02:28:57', '2025-11-08 11:19:12'),
(7, 'Kuti', 'kuti001@cdipbd.org', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 3, NULL, 1, '2025-06-13 02:28:57', '2025-11-02 17:18:53'),
(8, 'Chargas', 'chargas003@cdipbd.org', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 3, NULL, 3, '2025-06-13 02:28:57', '2025-11-02 17:54:45'),
(11, 'Pronab Mondal', 'pronab@cdipbd.org', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 2, NULL, 4, '2025-06-13 02:28:57', '2025-11-08 11:20:14'),
(12, 'Bulon', 'bulon@cdipbd.org', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 2, NULL, 4, '2025-06-13 02:28:57', '2025-11-08 11:20:14');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
