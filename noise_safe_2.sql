-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 07, 2026 at 03:43 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `noise_safe_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `password`) VALUES
(1, 'admin', '$2y$10$zptr0BeBQclicdOjUM7k4OA2WtwV7h5gEQY9ofL74a3lQLzUbS1.u');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `name`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$BhuuIBD2KTeXAwL53/7iCeG91fJ6WUM6.h6gEeFfTizyBlxB8WDuq', '2026-03-30 18:29:43', '2026-03-30 18:29:43');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `device_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `owner_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `serial_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `garansi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `registered_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`device_id`, `user_id`, `owner_name`, `serial_number`, `status`, `purchase_date`, `garansi`, `registered_at`) VALUES
(1, 1, 'Awa Device', 'NS-001', 'active', '2026-01-01', '2027-01-01', '2026-04-14 12:27:31'),
(3, 1, 'lexi', 'ABC123', NULL, NULL, NULL, '2026-05-03 14:06:52'),
(6, 6, 'ruby', 'ADD123', 'inactive', NULL, NULL, '2026-05-07 22:32:13');

-- --------------------------------------------------------

--
-- Table structure for table `device_location`
--

CREATE TABLE `device_location` (
  `loc_id` bigint NOT NULL,
  `device_id` bigint DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(10,8) DEFAULT NULL,
  `recorded_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_03_04_044629_create_waiting_list_table', 1),
(5, '2026_03_05_045003_create_admins_table', 1),
(6, '2026_03_05_045004_create_parents_table', 1),
(7, '2026_03_05_045005_create_devices_table', 1),
(8, '2026_03_05_045006_create_device_location_table', 1),
(9, '2026_03_05_045007_create_purchase_table', 1),
(10, '2026_03_05_045008_create_notifications_table', 1),
(11, '2026_03_05_045009_create_noise_logs_table', 1),
(12, '2026_03_05_045010_create_service_log_table', 1),
(13, '2026_03_11_093505_create_personal_access_tokens_table', 1),
(14, '2026_05_03_094706_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `noise_logs`
--

CREATE TABLE `noise_logs` (
  `log_id` bigint NOT NULL,
  `device_id` bigint DEFAULT NULL,
  `decibel_level` float DEFAULT NULL,
  `noise_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `recorded_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `noise_logs`
--

INSERT INTO `noise_logs` (`log_id`, `device_id`, `decibel_level`, `noise_status`, `recorded_at`) VALUES
(1, 1, 2021, 'SEDANG', '2026-04-29 10:29:21'),
(2, 1, 2021, 'SEDANG', '2026-04-29 10:29:24'),
(3, 1, 2435, 'SEDANG', '2026-04-29 10:29:25'),
(4, 1, 2032, 'SEDANG', '2026-04-29 10:29:29'),
(5, 1, 2874, 'BISING', '2026-04-29 10:29:34'),
(6, 1, 2874, 'BISING', '2026-04-29 10:29:37'),
(7, 1, 2090, 'SEDANG', '2026-04-29 10:29:44'),
(8, 1, 2707, 'BISING', '2026-04-29 10:29:48'),
(9, 1, 2707, 'BISING', '2026-04-29 10:29:51'),
(10, 1, 2146, 'SEDANG', '2026-04-29 10:29:52'),
(11, 1, 2554, 'BISING', '2026-04-29 10:29:57'),
(12, 1, 1862, 'SEDANG', '2026-04-29 10:30:01'),
(13, 1, 2878, 'BISING', '2026-04-29 10:30:02'),
(14, 1, 2016, 'SEDANG', '2026-04-29 10:30:05'),
(15, 1, 477, 'SUNYI', '2026-04-29 10:30:11'),
(16, 1, 2359, 'SEDANG', '2026-04-29 10:30:17'),
(17, 1, 1622, 'SEDANG', '2026-04-29 10:30:21'),
(18, 1, 2144, 'SEDANG', '2026-04-29 10:30:23'),
(19, 1, 643, 'SUNYI', '2026-04-29 10:30:31'),
(20, 1, 2110, 'SEDANG', '2026-04-29 10:30:35'),
(21, 1, 2400, 'SEDANG', '2026-04-29 10:30:40'),
(22, 1, 2400, 'SEDANG', '2026-04-29 10:30:43'),
(23, 1, 2015, 'SEDANG', '2026-04-29 10:30:47'),
(24, 1, 2118, 'SEDANG', '2026-04-29 10:30:51'),
(25, 1, 2118, 'SEDANG', '2026-04-29 10:30:55'),
(26, 1, 2460, 'SEDANG', '2026-04-29 10:30:56'),
(27, 1, 2151, 'SEDANG', '2026-04-29 10:31:05'),
(28, 1, 2151, 'SEDANG', '2026-04-29 10:31:08'),
(29, 1, 2251, 'SEDANG', '2026-04-29 10:31:14'),
(30, 1, 1247, 'SUNYI', '2026-04-29 10:31:26'),
(31, 1, 1247, 'SUNYI', '2026-04-29 10:31:31'),
(32, 1, 1167, 'SUNYI', '2026-04-29 10:31:32'),
(33, 1, 2598, 'BISING', '2026-04-29 10:31:38'),
(34, 1, 1440, 'SUNYI', '2026-04-29 10:31:42'),
(35, 1, 2907, 'BISING', '2026-04-29 10:31:44'),
(36, 1, 947, 'SUNYI', '2026-04-29 10:31:52'),
(37, 1, 2001, 'SEDANG', '2026-04-29 10:31:52'),
(38, 1, 2437, 'SEDANG', '2026-04-29 10:31:57'),
(39, 1, 2709, 'BISING', '2026-04-29 10:32:00'),
(40, 1, 2709, 'BISING', '2026-04-29 10:32:03'),
(41, 1, 2019, 'SEDANG', '2026-04-29 10:32:05'),
(42, 1, 2448, 'SEDANG', '2026-04-29 10:32:09'),
(43, 1, 2224, 'SEDANG', '2026-04-29 10:32:20'),
(44, 1, 877, 'SUNYI', '2026-04-29 10:32:28'),
(45, 1, 2128, 'SEDANG', '2026-04-29 10:32:31'),
(46, 1, 1113, 'SUNYI', '2026-04-29 10:32:43'),
(47, 1, 2160, 'SEDANG', '2026-04-29 10:32:44'),
(48, 1, 2177, 'SEDANG', '2026-04-29 10:32:47'),
(49, 1, 2926, 'BISING', '2026-04-29 10:32:52'),
(50, 1, 2926, 'BISING', '2026-04-29 10:32:55'),
(51, 1, 2095, 'SEDANG', '2026-04-29 10:32:56'),
(52, 1, 2006, 'SEDANG', '2026-04-29 10:32:59'),
(53, 1, 2331, 'SEDANG', '2026-04-29 10:33:04'),
(54, 1, 2331, 'SEDANG', '2026-04-29 10:33:08'),
(55, 1, 2512, 'BISING', '2026-04-29 10:33:08'),
(56, 1, 2899, 'BISING', '2026-04-29 10:33:12'),
(57, 1, 2175, 'SEDANG', '2026-04-29 10:33:16'),
(58, 1, 2175, 'SEDANG', '2026-04-29 10:33:19'),
(59, 1, 2544, 'BISING', '2026-04-29 10:33:19'),
(60, 1, 2154, 'SEDANG', '2026-04-29 10:33:25'),
(61, 1, 2154, 'SEDANG', '2026-04-29 10:33:30'),
(62, 1, 2219, 'SEDANG', '2026-04-29 10:33:30'),
(63, 1, 2277, 'SEDANG', '2026-04-29 10:33:34'),
(64, 1, 2256, 'SEDANG', '2026-04-29 10:33:45'),
(65, 1, 2901, 'BISING', '2026-04-29 10:33:47'),
(66, 1, 2289, 'SEDANG', '2026-04-29 10:33:50'),
(67, 1, 2366, 'SEDANG', '2026-04-29 10:33:54'),
(68, 1, 2366, 'SEDANG', '2026-04-29 10:33:58'),
(69, 1, 2001, 'SEDANG', '2026-04-29 10:33:58'),
(70, 1, 2117, 'SEDANG', '2026-04-29 10:34:02'),
(71, 1, 2597, 'BISING', '2026-04-29 10:34:05'),
(72, 1, 2597, 'BISING', '2026-04-29 10:34:08'),
(73, 1, 2916, 'BISING', '2026-04-29 10:34:08'),
(74, 1, 2214, 'SEDANG', '2026-04-29 10:34:13'),
(75, 1, 2125, 'SEDANG', '2026-04-29 10:34:16'),
(76, 1, 2125, 'SEDANG', '2026-04-29 10:34:22'),
(77, 1, 2099, 'SEDANG', '2026-04-29 10:34:38'),
(78, 1, 2900, 'BISING', '2026-04-29 10:34:42'),
(79, 1, 2900, 'BISING', '2026-04-29 10:34:45'),
(80, 1, 2343, 'SEDANG', '2026-04-29 10:34:46'),
(81, 1, 2893, 'BISING', '2026-04-29 10:34:49'),
(82, 1, 2395, 'SEDANG', '2026-04-29 10:34:53'),
(83, 1, 2395, 'SEDANG', '2026-04-29 10:34:56'),
(84, 1, 2464, 'SEDANG', '2026-04-29 10:34:57'),
(85, 1, 2383, 'SEDANG', '2026-04-29 10:35:01'),
(86, 1, 609, 'SUNYI', '2026-04-29 10:35:06'),
(87, 1, 2723, 'BISING', '2026-04-29 10:35:07'),
(88, 1, 2880, 'BISING', '2026-04-29 10:35:11'),
(89, 1, 2128, 'SEDANG', '2026-04-29 10:35:16'),
(90, 1, 2128, 'SEDANG', '2026-04-29 10:35:19'),
(91, 1, 2125, 'SEDANG', '2026-04-29 10:35:21'),
(92, 1, 2441, 'SEDANG', '2026-04-29 10:35:26'),
(93, 1, 2142, 'SEDANG', '2026-04-29 10:35:29'),
(94, 1, 2142, 'SEDANG', '2026-04-29 10:35:33'),
(95, 1, 2081, 'SEDANG', '2026-04-29 10:35:33'),
(96, 1, 2895, 'BISING', '2026-04-29 10:35:36'),
(97, 1, 2892, 'BISING', '2026-04-29 10:35:40'),
(98, 1, 2397, 'SEDANG', '2026-04-29 10:35:43'),
(99, 1, 2397, 'SEDANG', '2026-04-29 10:35:46'),
(100, 1, 2479, 'SEDANG', '2026-04-29 10:35:47'),
(101, 1, 2112, 'SEDANG', '2026-04-29 10:35:50'),
(102, 1, 2925, 'BISING', '2026-04-29 10:35:54'),
(103, 1, 2925, 'BISING', '2026-04-29 10:35:57'),
(104, 1, 2116, 'SEDANG', '2026-04-29 10:35:58'),
(105, 1, 2097, 'SEDANG', '2026-04-29 10:36:02'),
(106, 1, 2090, 'SEDANG', '2026-04-29 10:36:07'),
(107, 1, 2090, 'SEDANG', '2026-04-29 10:36:10'),
(108, 1, 2621, 'BISING', '2026-04-29 10:36:12'),
(109, 1, 2878, 'BISING', '2026-04-29 10:36:15'),
(110, 1, 2879, 'BISING', '2026-04-29 10:36:18'),
(111, 1, 2879, 'BISING', '2026-04-29 10:36:21'),
(112, 1, 2352, 'SEDANG', '2026-04-29 10:36:22'),
(113, 1, 2347, 'SEDANG', '2026-04-29 10:36:25'),
(114, 1, 2003, 'SEDANG', '2026-04-29 10:36:29'),
(115, 1, 2003, 'SEDANG', '2026-04-29 10:36:33'),
(116, 1, 2016, 'SEDANG', '2026-04-29 10:36:35'),
(117, 1, 2471, 'SEDANG', '2026-04-29 10:36:38'),
(118, 1, 1990, 'SEDANG', '2026-04-29 10:36:43'),
(119, 1, 2880, 'BISING', '2026-04-29 10:36:46'),
(120, 1, 2509, 'BISING', '2026-04-29 10:36:49'),
(121, 1, 1216, 'SUNYI', '2026-04-29 10:36:53'),
(122, 1, 2559, 'BISING', '2026-04-29 10:37:00'),
(123, 1, 1284, 'SUNYI', '2026-04-29 10:37:04'),
(124, 1, 2278, 'SEDANG', '2026-04-29 10:37:11'),
(125, 1, 750, 'SUNYI', '2026-04-29 10:37:14'),
(126, 1, 2115, 'SEDANG', '2026-04-29 10:37:17'),
(127, 1, 2147, 'SEDANG', '2026-04-29 10:37:21'),
(128, 1, 894, 'SUNYI', '2026-04-29 10:37:25'),
(129, 1, 2881, 'BISING', '2026-04-29 10:37:28'),
(130, 1, 1573, 'SEDANG', '2026-04-29 10:37:35'),
(131, 1, 2121, 'SEDANG', '2026-04-29 10:37:41'),
(132, 1, 2082, 'SEDANG', '2026-04-29 10:37:45'),
(133, 1, 2082, 'SEDANG', '2026-04-29 10:37:51'),
(134, 1, 2710, 'BISING', '2026-04-29 10:37:55'),
(135, 1, 851, 'SUNYI', '2026-04-29 10:38:01'),
(136, 1, 2494, 'SEDANG', '2026-04-29 10:38:02'),
(137, 1, 2587, 'BISING', '2026-04-29 10:38:08'),
(138, 1, 1472, 'SUNYI', '2026-04-29 10:38:12'),
(139, 1, 2043, 'SEDANG', '2026-04-29 10:38:12'),
(140, 1, 2667, 'BISING', '2026-04-29 10:38:21'),
(141, 1, 2667, 'BISING', '2026-04-29 10:38:24'),
(142, 1, 2206, 'SEDANG', '2026-04-29 10:38:28'),
(143, 1, 2495, 'SEDANG', '2026-04-29 10:38:34'),
(144, 1, 2495, 'SEDANG', '2026-04-29 10:38:37'),
(145, 1, 2393, 'SEDANG', '2026-04-29 10:38:40'),
(146, 1, 2041, 'SEDANG', '2026-04-29 10:38:43'),
(147, 1, 1157, 'SUNYI', '2026-04-29 10:38:47'),
(148, 1, 2193, 'SEDANG', '2026-04-29 10:38:49'),
(149, 1, 1003, 'SUNYI', '2026-04-29 10:38:58'),
(150, 1, 2317, 'SEDANG', '2026-04-29 10:39:02'),
(151, 1, 1150, 'SUNYI', '2026-04-29 10:39:08'),
(152, 1, 2389, 'SEDANG', '2026-04-29 10:39:12'),
(153, 1, 1760, 'SEDANG', '2026-04-29 10:39:18'),
(154, 1, 2192, 'SEDANG', '2026-04-29 10:39:20'),
(155, 1, 2267, 'SEDANG', '2026-04-29 10:39:24'),
(156, 1, 1049, 'SUNYI', '2026-04-29 10:39:28'),
(157, 1, 1180, 'SUNYI', '2026-04-29 10:39:39'),
(158, 1, 2095, 'SEDANG', '2026-04-29 10:39:48'),
(159, 1, 2095, 'SEDANG', '2026-04-29 10:39:51'),
(160, 1, 2105, 'SEDANG', '2026-04-29 10:39:55'),
(161, 1, 779, 'SUNYI', '2026-04-29 10:40:02'),
(162, 1, 2101, 'SEDANG', '2026-04-29 10:40:09'),
(163, 1, 2101, 'SEDANG', '2026-04-29 10:40:12'),
(164, 1, 2055, 'SEDANG', '2026-04-29 10:40:22'),
(165, 1, 2055, 'SEDANG', '2026-04-29 10:40:25'),
(166, 1, 2133, 'SEDANG', '2026-04-29 10:40:33'),
(167, 1, 2133, 'SEDANG', '2026-04-29 10:40:36'),
(168, 1, 2064, 'SEDANG', '2026-04-29 10:40:41'),
(169, 1, 1669, 'SEDANG', '2026-04-29 10:40:47'),
(170, 1, 2047, 'SEDANG', '2026-04-29 10:40:56'),
(171, 1, 2047, 'SEDANG', '2026-04-29 10:41:00'),
(172, 1, 2005, 'SEDANG', '2026-04-29 10:41:02'),
(173, 1, 2858, 'BISING', '2026-04-29 10:41:08'),
(174, 1, 2858, 'BISING', '2026-04-29 10:41:11'),
(175, 1, 2082, 'SEDANG', '2026-04-29 10:41:12'),
(176, 1, 2064, 'SEDANG', '2026-04-29 10:41:18'),
(177, 1, 2176, 'SEDANG', '2026-04-29 10:41:31'),
(178, 1, 2066, 'SEDANG', '2026-04-29 10:41:36'),
(179, 1, 2066, 'SEDANG', '2026-04-29 10:41:39'),
(180, 1, 2898, 'BISING', '2026-04-29 10:41:43'),
(181, 1, 2001, 'SEDANG', '2026-04-29 10:41:49'),
(182, 1, 2001, 'SEDANG', '2026-04-29 10:41:52'),
(183, 1, 2708, 'BISING', '2026-04-29 10:41:53'),
(184, 1, 2249, 'SEDANG', '2026-04-29 10:41:58'),
(185, 1, 1291, 'SUNYI', '2026-04-29 10:42:02'),
(186, 1, 2539, 'BISING', '2026-04-29 10:42:07'),
(187, 1, 2097, 'SEDANG', '2026-04-29 10:42:11'),
(188, 1, 2097, 'SEDANG', '2026-04-29 10:42:14'),
(189, 1, 2160, 'SEDANG', '2026-04-29 10:42:16'),
(190, 1, 2058, 'SEDANG', '2026-04-29 10:42:22'),
(191, 1, 2058, 'SEDANG', '2026-04-29 10:42:25'),
(192, 1, 1514, 'SEDANG', '2026-04-29 10:42:35'),
(193, 1, 2054, 'SEDANG', '2026-04-29 10:42:36'),
(194, 1, 2143, 'SEDANG', '2026-04-29 10:42:41'),
(195, 1, 1354, 'SUNYI', '2026-04-29 10:42:45'),
(196, 1, 2274, 'SEDANG', '2026-04-29 10:42:50'),
(197, 1, 2899, 'BISING', '2026-04-29 10:42:54'),
(198, 1, 2899, 'BISING', '2026-04-29 10:42:57'),
(199, 1, 2494, 'SEDANG', '2026-04-29 10:42:59'),
(200, 1, 1364, 'SUNYI', '2026-04-29 10:43:07'),
(201, 1, 2074, 'SEDANG', '2026-04-29 10:43:17'),
(202, 1, 2074, 'SEDANG', '2026-04-29 10:43:20'),
(203, 1, 2880, 'BISING', '2026-04-29 10:43:25'),
(204, 1, 2416, 'SEDANG', '2026-04-29 10:43:29'),
(205, 1, 2416, 'SEDANG', '2026-04-29 10:43:32'),
(206, 1, 2144, 'SEDANG', '2026-04-29 10:43:33'),
(207, 1, 2192, 'SEDANG', '2026-04-29 10:43:38'),
(208, 1, 1167, 'SUNYI', '2026-04-29 10:43:43'),
(209, 1, 2110, 'SEDANG', '2026-04-29 10:43:44'),
(210, 1, 2032, 'SEDANG', '2026-04-29 10:43:49'),
(211, 1, 2423, 'SEDANG', '2026-04-29 10:43:53'),
(212, 1, 2423, 'SEDANG', '2026-04-29 10:43:56'),
(213, 1, 2096, 'SEDANG', '2026-04-29 10:43:57'),
(214, 1, 2905, 'BISING', '2026-04-29 10:44:04'),
(215, 1, 2905, 'BISING', '2026-04-29 10:44:07'),
(216, 1, 2256, 'SEDANG', '2026-04-29 10:44:07'),
(217, 1, 2837, 'BISING', '2026-04-29 10:44:12'),
(218, 1, 1499, 'SUNYI', '2026-04-29 10:44:17'),
(219, 1, 2356, 'SEDANG', '2026-04-29 10:44:21'),
(220, 1, 1671, 'SEDANG', '2026-04-29 10:44:28'),
(221, 1, 2880, 'BISING', '2026-04-29 10:44:29'),
(222, 1, 2530, 'BISING', '2026-04-29 10:44:33'),
(223, 1, 2901, 'BISING', '2026-04-29 10:44:37'),
(224, 1, 2901, 'BISING', '2026-04-29 10:44:40'),
(225, 1, 2879, 'BISING', '2026-04-29 10:44:44'),
(226, 1, 2747, 'BISING', '2026-04-29 10:44:48'),
(227, 1, 2747, 'BISING', '2026-04-29 10:44:52'),
(228, 1, 2880, 'BISING', '2026-04-29 10:44:52'),
(229, 1, 2045, 'SEDANG', '2026-04-29 10:44:57'),
(230, 1, 2879, 'BISING', '2026-04-29 10:45:02'),
(231, 1, 2879, 'BISING', '2026-04-29 10:45:05'),
(232, 1, 2879, 'BISING', '2026-04-29 10:45:11'),
(233, 1, 1140, 'SUNYI', '2026-04-29 10:45:15'),
(234, 1, 2879, 'BISING', '2026-04-29 10:45:16'),
(235, 1, 2262, 'SEDANG', '2026-04-29 10:45:20'),
(236, 1, 2197, 'SEDANG', '2026-04-29 10:45:24'),
(237, 1, 2197, 'SEDANG', '2026-04-29 10:45:27'),
(238, 1, 2016, 'SEDANG', '2026-04-29 10:45:30'),
(239, 1, 2878, 'BISING', '2026-04-29 10:45:34'),
(240, 1, 1050, 'SUNYI', '2026-04-29 10:45:38'),
(241, 1, 2351, 'SEDANG', '2026-04-29 10:45:39'),
(242, 1, 2909, 'BISING', '2026-04-29 10:45:43'),
(243, 1, 2899, 'BISING', '2026-04-29 10:45:48'),
(244, 1, 2899, 'BISING', '2026-04-29 10:45:51'),
(245, 1, 2894, 'BISING', '2026-04-29 10:45:52'),
(246, 1, 2778, 'BISING', '2026-04-29 10:45:55'),
(247, 1, 2240, 'SEDANG', '2026-04-29 11:19:22'),
(248, 1, 2021, 'SEDANG', '2026-04-29 11:19:27'),
(249, 1, 2021, 'SEDANG', '2026-04-29 11:19:29'),
(250, 1, 0, 'SUNYI', '2026-04-29 11:19:40'),
(251, 1, 0, 'SUNYI', '2026-04-29 11:19:50'),
(252, 1, 1199, 'SUNYI', '2026-04-29 11:20:00'),
(253, 1, 2091, 'SEDANG', '2026-04-29 11:20:05'),
(254, 1, 2405, 'SEDANG', '2026-04-29 11:20:10'),
(255, 1, 2405, 'SEDANG', '2026-04-29 11:20:13'),
(256, 1, 2022, 'SEDANG', '2026-04-29 11:20:17'),
(257, 1, 189, 'SUNYI', '2026-04-29 11:20:20'),
(258, 1, 189, 'SUNYI', '2026-04-29 11:20:25'),
(259, 1, 2023, 'SEDANG', '2026-04-29 11:20:26'),
(260, 1, 2019, 'SEDANG', '2026-04-29 11:20:31'),
(261, 1, 1441, 'SUNYI', '2026-04-29 11:20:36'),
(262, 1, 2695, 'BISING', '2026-04-29 11:20:38'),
(263, 1, 1091, 'SUNYI', '2026-04-29 11:20:46'),
(264, 1, 2807, 'BISING', '2026-04-29 11:20:56'),
(265, 1, 2807, 'BISING', '2026-04-29 11:20:59'),
(266, 1, 2166, 'SEDANG', '2026-04-29 11:21:01'),
(267, 1, 2473, 'SEDANG', '2026-04-29 11:21:05'),
(268, 1, 0, 'SUNYI', '2026-04-29 11:21:09'),
(269, 1, 2881, 'BISING', '2026-04-29 11:21:10'),
(270, 1, 2881, 'BISING', '2026-04-29 11:21:13'),
(271, 1, 1895, 'SEDANG', '2026-04-29 11:21:19'),
(272, 1, 2608, 'BISING', '2026-04-29 11:21:21'),
(273, 1, 2018, 'SEDANG', '2026-04-29 11:21:28'),
(274, 1, 2018, 'SEDANG', '2026-04-29 11:21:31'),
(275, 1, 2905, 'BISING', '2026-04-29 11:21:32'),
(276, 1, 2172, 'SEDANG', '2026-04-29 11:21:38'),
(277, 1, 2172, 'SEDANG', '2026-04-29 11:21:41'),
(278, 1, 2558, 'BISING', '2026-04-29 11:21:43'),
(279, 1, 2559, 'BISING', '2026-04-29 11:21:46'),
(280, 1, 2885, 'BISING', '2026-04-29 11:21:51'),
(281, 1, 2885, 'BISING', '2026-04-29 11:21:54'),
(282, 1, 2172, 'SEDANG', '2026-04-29 11:21:57'),
(283, 1, 2882, 'BISING', '2026-04-29 11:22:00'),
(284, 1, 2043, 'SEDANG', '2026-04-29 11:22:04'),
(285, 1, 2043, 'SEDANG', '2026-04-29 11:22:07'),
(286, 1, 2026, 'SEDANG', '2026-04-29 11:22:08'),
(287, 1, 2184, 'SEDANG', '2026-04-29 11:22:13'),
(288, 1, 2881, 'BISING', '2026-04-29 11:22:17'),
(289, 1, 2881, 'BISING', '2026-04-29 11:22:20'),
(290, 1, 2055, 'SEDANG', '2026-04-29 11:22:23'),
(291, 1, 2455, 'SEDANG', '2026-04-29 11:22:29'),
(292, 1, 2455, 'SEDANG', '2026-04-29 11:22:32'),
(293, 1, 2881, 'BISING', '2026-04-29 11:22:37'),
(294, 1, 2883, 'BISING', '2026-04-29 11:22:42'),
(295, 1, 2883, 'BISING', '2026-04-29 11:22:45'),
(296, 1, 2763, 'BISING', '2026-04-29 11:22:46'),
(297, 1, 2913, 'BISING', '2026-04-29 11:22:50'),
(298, 1, 2210, 'SEDANG', '2026-04-29 11:22:53'),
(299, 1, 2210, 'SEDANG', '2026-04-29 11:22:56'),
(300, 1, 2155, 'SEDANG', '2026-04-29 11:22:56'),
(301, 1, 2045, 'SEDANG', '2026-04-29 11:23:02'),
(302, 1, 2336, 'SEDANG', '2026-04-29 11:23:06'),
(303, 1, 2336, 'SEDANG', '2026-04-29 11:23:09'),
(304, 1, 2469, 'SEDANG', '2026-04-29 11:23:09'),
(305, 1, 1477, 'SUNYI', '2026-04-29 11:23:19'),
(306, 1, 2094, 'SEDANG', '2026-04-29 11:23:20'),
(307, 1, 2262, 'SEDANG', '2026-04-29 11:23:27'),
(308, 1, 2262, 'SEDANG', '2026-04-29 11:23:30'),
(309, 1, 0, 'SUNYI', '2026-04-29 11:23:37'),
(310, 1, 0, 'SUNYI', '2026-04-29 11:23:42'),
(311, 1, 1002, 'SUNYI', '2026-04-29 11:23:43'),
(312, 1, 984, 'SUNYI', '2026-04-29 11:23:53'),
(313, 1, 2084, 'SEDANG', '2026-04-29 11:23:56'),
(314, 1, 2714, 'BISING', '2026-04-29 11:24:00'),
(315, 1, 2714, 'BISING', '2026-04-29 11:24:03'),
(316, 1, 2062, 'SEDANG', '2026-04-29 11:24:04'),
(317, 1, 1259, 'SUNYI', '2026-04-29 11:24:13'),
(318, 1, 2930, 'BISING', '2026-04-29 11:24:16'),
(319, 1, 2722, 'BISING', '2026-04-29 11:24:21'),
(320, 1, 2722, 'BISING', '2026-04-29 11:24:24'),
(321, 1, 2165, 'SEDANG', '2026-04-29 11:24:25'),
(322, 1, 705, 'SUNYI', '2026-04-29 11:24:34'),
(323, 1, 2121, 'SEDANG', '2026-04-29 11:24:35'),
(324, 1, 2527, 'BISING', '2026-04-29 11:24:42'),
(325, 1, 2527, 'BISING', '2026-04-29 11:24:45'),
(326, 1, 2018, 'SEDANG', '2026-04-29 11:24:49'),
(327, 1, 1199, 'SUNYI', '2026-04-29 11:24:56'),
(328, 1, 2039, 'SEDANG', '2026-04-29 11:24:58'),
(329, 1, 2082, 'SEDANG', '2026-04-29 11:25:02'),
(330, 1, 1412, 'SUNYI', '2026-04-29 11:25:06'),
(331, 1, 2037, 'SEDANG', '2026-04-29 11:25:10'),
(332, 1, 1727, 'SEDANG', '2026-04-29 11:25:16'),
(333, 1, 2019, 'SEDANG', '2026-04-29 11:25:24'),
(334, 1, 2019, 'SEDANG', '2026-04-29 11:25:27'),
(335, 1, 2883, 'BISING', '2026-04-29 11:25:29'),
(336, 1, 1988, 'SEDANG', '2026-04-29 11:25:37'),
(337, 1, 2614, 'BISING', '2026-04-29 11:25:39'),
(338, 1, 1857, 'SEDANG', '2026-04-29 11:25:48'),
(339, 1, 2081, 'SEDANG', '2026-04-29 11:25:48'),
(340, 1, 2043, 'SEDANG', '2026-04-29 11:25:52'),
(341, 1, 2511, 'BISING', '2026-04-29 11:25:56'),
(342, 1, 2511, 'BISING', '2026-04-29 11:25:59'),
(343, 1, 2187, 'SEDANG', '2026-04-29 11:26:03'),
(344, 1, 1422, 'SUNYI', '2026-04-29 11:26:10'),
(345, 1, 2047, 'SEDANG', '2026-04-29 11:26:13'),
(346, 1, 2045, 'SEDANG', '2026-04-29 11:26:17'),
(347, 1, 2045, 'SEDANG', '2026-04-29 11:26:21'),
(348, 1, 2115, 'SEDANG', '2026-04-29 11:26:29'),
(349, 1, 2115, 'SEDANG', '2026-04-29 11:26:32'),
(350, 1, 1344, 'SUNYI', '2026-04-29 11:26:42'),
(351, 1, 2335, 'SEDANG', '2026-04-29 11:26:47'),
(352, 1, 1297, 'SUNYI', '2026-04-29 11:26:53'),
(353, 1, 2125, 'SEDANG', '2026-04-29 11:26:53'),
(354, 1, 2163, 'SEDANG', '2026-04-29 11:26:58'),
(355, 1, 570, 'SUNYI', '2026-04-29 11:27:03'),
(356, 1, 2300, 'SEDANG', '2026-04-29 11:27:13'),
(357, 1, 2300, 'SEDANG', '2026-04-29 11:27:16'),
(358, 1, 2479, 'SEDANG', '2026-04-29 11:27:25'),
(359, 1, 2479, 'SEDANG', '2026-04-29 11:27:28'),
(360, 1, 2035, 'SEDANG', '2026-04-29 11:27:28'),
(361, 1, 2255, 'SEDANG', '2026-04-29 11:27:34'),
(362, 1, 2198, 'SEDANG', '2026-04-29 11:27:37'),
(363, 1, 2198, 'SEDANG', '2026-04-29 11:27:41'),
(364, 1, 2119, 'SEDANG', '2026-04-29 11:27:44'),
(365, 1, 1669, 'SEDANG', '2026-04-29 11:27:51'),
(366, 1, 2160, 'SEDANG', '2026-04-29 11:27:52'),
(367, 1, 2215, 'SEDANG', '2026-04-29 11:27:57'),
(368, 1, 721, 'SUNYI', '2026-04-29 11:28:01'),
(369, 1, 2026, 'SEDANG', '2026-04-29 11:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notif_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `device_id` bigint DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notif_id`, `user_id`, `device_id`, `message`, `status`, `created_at`) VALUES
(1, 1, 1, 'Anak anda perlu bantuan, segera datangi ke lokasi', 'unread', '2026-04-29 10:31:26'),
(2, 1, 1, 'Anak anda perlu bantuan, segera datangi ke lokasi', 'unread', '2026-04-29 10:31:32'),
(3, 1, 1, 'Anak anda perlu bantuan, segera datangi ke lokasi', 'unread', '2026-04-29 11:20:20'),
(4, 1, 1, 'Anak anda perlu bantuan, segera datangi ke lokasi', 'unread', '2026-04-29 11:23:37'),
(5, 1, 1, 'Anak anda perlu bantuan, segera datangi ke lokasi', 'unread', '2026-04-29 11:23:43');

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `user_id` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`user_id`, `name`, `email`, `phone`, `password`, `created_at`) VALUES
(1, 'Awa', 'awa@email.com', '081234567890', '123456', '2026-04-14 05:27:31'),
(2, 'Ririn', 'ririn@gmail.com', NULL, '$2y$12$XdB5qCTH.CMhcd82CF0vXue4p7C85aqPIXlbzmqFUF4Ol4eAv5S.e', '2026-05-02 07:50:21'),
(3, 'rubby', 'ririnda209@gmail.com', '083871081421', '$2y$12$BWPCFeEdqZG0/OD6gYtv2OxIWSDbXUXZD9HpUgtkimv9c2ibx/Ize', '2026-05-03 02:22:54'),
(4, 'rubby', 'rubby@test.com', '098373827123', '$2y$12$8O0clq6b2dP9X/uMQThMkOJ8K0HHdNhAp73dJH.ArWEmWctc/5cFm', '2026-05-03 02:37:17'),
(5, 'ririn', 'xxxtimezone@gmail.com', '083871081421', '$2y$12$MhJTlgmmmhMnfTNa3bdMTOA624RD7yyioIWsQT3SFo4SAGL2Bz9/y', '2026-05-05 07:10:31'),
(6, 'ririnda', 'ririnariyanti440@gmail.com', '098976891421', '$2y$12$wVQe5OdmXqrdSk0/Zh4uquS8ldVex.5Yrq3Et48Xq9Wuvs1RvW/am', '2026-05-05 08:07:51');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Parents', 4, 'auth_token', 'ce21d40f94a1ce32683ffa8bcaadbbf078de82bd91aeaffcad6b01b85cf3115d', '[\"*\"]', NULL, NULL, '2026-05-05 07:35:21', '2026-05-05 07:35:21'),
(2, 'App\\Models\\Parents', 5, 'auth_token', '2f6619ffe09fd07e9726ec4261fe2b466c9e0956be4ebc8c08943e9059ea9ded', '[\"*\"]', NULL, NULL, '2026-05-05 07:44:35', '2026-05-05 07:44:35'),
(3, 'App\\Models\\Parents', 5, 'auth_token', 'fc1b0260480990442db18a036f41b9ed93d84d8ba00113f5d0c2df383f6cfec9', '[\"*\"]', NULL, NULL, '2026-05-05 07:58:38', '2026-05-05 07:58:38'),
(4, 'App\\Models\\Parents', 5, 'auth_token', '71efb095726d2f5291e0b6a6c023ad12aa0275ccd691c43d676624af1bedc1d6', '[\"*\"]', NULL, NULL, '2026-05-05 07:58:45', '2026-05-05 07:58:45'),
(5, 'App\\Models\\Parents', 6, 'auth_token', 'c506cee02ddf7cea20608c31284e2c3a7296a2b907a2691e57bee26adf6ba7c5', '[\"*\"]', NULL, NULL, '2026-05-05 08:07:51', '2026-05-05 08:07:51'),
(6, 'App\\Models\\Parents', 6, 'auth_token', 'b8e8c0f7c14f8d85f24f0dcf3b6fad65ec3339be5acb3d45df6ac825c94ca234', '[\"*\"]', NULL, NULL, '2026-05-05 08:08:21', '2026-05-05 08:08:21'),
(7, 'App\\Models\\Parents', 6, 'auth_token', 'd8c0decb136cb11edf581fad3f0fd232db511d2c951a31ec0d896d45613513a5', '[\"*\"]', '2026-05-07 06:15:29', NULL, '2026-05-05 08:38:09', '2026-05-07 06:15:29'),
(8, 'App\\Models\\Parents', 6, 'auth_token', '3918b7a54f5302a6ab24c681b85b189b91f4d2488ac2c6487a2c11024600796c', '[\"*\"]', '2026-05-07 08:05:19', NULL, '2026-05-07 08:03:36', '2026-05-07 08:05:19'),
(9, 'App\\Models\\Parents', 6, 'auth_token', 'e3a20fb337ed0d5d882235e2ff0f54249012bd82e59a52aff258c73f9d22ed45', '[\"*\"]', '2026-05-07 08:36:51', NULL, '2026-05-07 08:36:15', '2026-05-07 08:36:51');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` bigint NOT NULL,
  `device_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_log`
--

CREATE TABLE `service_log` (
  `service_id` bigint NOT NULL,
  `device_id` bigint DEFAULT NULL,
  `admin_id` bigint DEFAULT NULL,
  `is_warranty` tinyint(1) DEFAULT NULL,
  `service_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ioqJF03T9Uiz0gA63K6k8AvWE205vZi6NsiJLZ8h', NULL, '127.0.0.1', 'Thunder Client (https://www.thunderclient.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWJkV1ZiRURmb3dISVdGbUNrdGU3c2R1QlAyUm91ZkhOQk9IRDg4UyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777780339),
('45HwhnaBJ2HqzmKifn7SK2hVy1WVyJv1ickxyEZb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia21KN1pac3FEM2hWUGlDeE1oc1o1UE9UMkEwREo5b2diMXlEbndMSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777779973),
('nmv2tPnCDRqn8rnneEqmCLub9L31sew488bND684', NULL, '127.0.0.1', 'Thunder Client (https://www.thunderclient.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVhncVI2TGl1c0Rkc1A1ZDE1Q3dvVHAzUHlQNHhwMHpDTURHdGdpMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777800620),
('D4pqI46VTTv9XissjFlT4AJDYDIGD1qbvoUQmevL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.118.1 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHY5SWtlR2l3OWlncnR6WjFmQUduRFJhNm42MHpMYURUWTZSRVpvOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777800219),
('KCJZWo98zXJrjp1IThmCXJ3yeg6RBPkPliXuipDY', NULL, '127.0.0.1', 'Thunder Client (https://www.thunderclient.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3ZaMGI1WFkxbVl3cmZNV2hJMG5XSUVvQzExN2ZQZEMzbFZ6YmdzTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777800249),
('wLxJawTR5dHTf8kMerdZdjGdX6umGrZtSUBAhA32', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.118.1 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWNLSXgyNFBRdXpwZG9acERlVVc0am14SnNuMGIxRmJtU0M1d1lTcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777989382),
('ldOOEINzGzRF0avF6C0nS5e0shh990MAPYODqHmR', NULL, '127.0.0.1', 'Thunder Client (https://www.thunderclient.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXd4a0RlZjZrYlRIcGZxdzNJYk9PeWhBR3BkcXA1UjBhU0JtQ1l0NiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1777995168);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2026-03-11 02:41:55', '$2y$12$oDd9NIZJFACSgLPkEeJHsOK/5YbCWGXH5hIimSHqlgodDHItl.vK.', 'swAthzSALr', '2026-03-11 02:41:55', '2026-03-11 02:41:55');

-- --------------------------------------------------------

--
-- Table structure for table `waiting_list`
--

CREATE TABLE `waiting_list` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `package` enum('starter','complete') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'starter',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('waiting','contacted','converted') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`device_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `device_location`
--
ALTER TABLE `device_location`
  ADD PRIMARY KEY (`loc_id`),
  ADD KEY `device_id` (`device_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noise_logs`
--
ALTER TABLE `noise_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `device_id` (`device_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notif_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `device_id` (`device_id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `service_log`
--
ALTER TABLE `service_log`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `device_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `device_location`
--
ALTER TABLE `device_location`
  MODIFY `loc_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `noise_logs`
--
ALTER TABLE `noise_logs`
  MODIFY `log_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=370;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notif_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `user_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchase_id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_log`
--
ALTER TABLE `service_log`
  MODIFY `service_id` bigint NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `devices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `parents` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `device_location`
--
ALTER TABLE `device_location`
  ADD CONSTRAINT `device_location_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`device_id`) ON DELETE CASCADE;

--
-- Constraints for table `noise_logs`
--
ALTER TABLE `noise_logs`
  ADD CONSTRAINT `noise_logs_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`device_id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `parents` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`device_id`) REFERENCES `devices` (`device_id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`device_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `parents` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `service_log`
--
ALTER TABLE `service_log`
  ADD CONSTRAINT `service_log_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`device_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_log_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
