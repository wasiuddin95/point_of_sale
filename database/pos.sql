-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2021 at 11:42 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Walton Electronics', 1, 1, 1, '2020-07-26 04:58:40', '2020-07-28 04:37:22'),
(2, 'Electrics', 1, 1, 1, '2020-07-26 04:58:57', '2020-07-26 05:04:28'),
(3, 'Cements', 1, 1, 1, '2020-07-26 04:59:06', '2020-07-26 05:04:34'),
(4, 'Computer & Hardware', 1, 1, 1, '2020-07-26 04:59:16', '2020-07-26 05:04:17'),
(5, 'Beverage', 1, 1, NULL, '2020-07-26 05:05:18', '2020-07-26 05:05:18'),
(7, 'Rod', 1, 1, NULL, '2020-07-27 05:00:54', '2020-07-27 05:00:54'),
(8, 'Clothes', 1, 1, NULL, '2020-07-27 05:01:07', '2020-07-27 05:01:07'),
(9, 'Samsung Electronics', 1, 1, NULL, '2020-07-28 04:37:09', '2020-07-28 04:37:09'),
(10, 'Vivo Electronics', 1, 1, NULL, '2020-07-28 04:38:13', '2020-07-28 04:38:13');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `mobile_no`, `email`, `address`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Ahsan Habib', '01943215665', 'ahsanhabib@gmail.com', 'Modhubagh, Dhaka-1219.', 1, 1, 1, '2020-07-25 11:59:06', '2020-07-25 12:18:50'),
(2, 'Harun Khan', '01711211212', 'hk@gmail.com', 'Malibagh, Dhaka-1217.', 1, 1, 1, '2020-07-25 12:11:59', '2020-07-25 12:12:27'),
(4, 'Abu Fahim', '01676808189', 'fahimabu@gmail.com', '102/a Madhubagh, Dhaka', 1, NULL, 1, '2020-08-05 12:51:38', '2020-08-11 01:23:51'),
(5, 'Masud Ahmed', '01676808199', 'ahmasud@gmail.com', '111/a mugdha dhaka', 1, NULL, 1, '2020-08-10 06:13:53', '2020-08-11 01:24:12'),
(6, 'Abdul Motin', '01676677656', NULL, '110/a Badda,Dhaka', 1, NULL, NULL, '2020-08-10 11:42:22', '2020-08-10 11:42:22');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending,1=Approved',
  `created_by` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_no`, `date`, `description`, `status`, `created_by`, `approved_by`, `created_at`, `updated_at`) VALUES
(1, '1', '2020-08-05', 'This is just demo invoice insert', 1, 1, 1, '2020-08-05 12:51:38', '2020-08-07 10:42:23'),
(2, '2', '2020-08-05', 'Just Demo Insert', 1, 1, 1, '2020-08-05 13:13:05', '2020-08-10 06:02:42'),
(4, '3', '2020-08-06', 'Just Demo Insert', 1, 1, 1, '2020-08-06 06:39:00', '2020-08-10 06:02:37'),
(6, '4', '2020-08-07', 'Demo Description add', 1, 1, 1, '2020-08-07 10:37:03', '2020-08-10 06:02:31'),
(7, '5', '2020-08-10', 'Walton Primo RX7 Smarphone sell.', 1, 1, 1, '2020-08-10 05:31:54', '2020-08-10 05:32:43'),
(8, '6', '2020-08-10', 'Samsung A31 Sell', 1, 1, 1, '2020-08-10 06:01:51', '2020-08-10 06:02:16'),
(9, '7', '2020-08-10', 'Walton Smartphone', 1, 1, 1, '2020-08-10 06:13:53', '2020-08-10 06:14:06'),
(10, '8', '2020-08-10', 'Samsung Smart OLED TV.', 1, 1, 1, '2020-08-10 11:42:22', '2020-08-10 11:42:43');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `invoice_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `selling_qty` double NOT NULL,
  `unit_price` double NOT NULL,
  `selling_price` double NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `date`, `invoice_id`, `category_id`, `product_id`, `selling_qty`, `unit_price`, `selling_price`, `status`, `created_at`, `updated_at`) VALUES
(1, '2020-08-05', 1, 1, 8, 2, 6990, 13980, 1, '2020-08-05 12:51:38', '2020-08-05 12:51:38'),
(2, '2020-08-05', 1, 3, 4, 20, 600, 12000, 1, '2020-08-05 12:51:38', '2020-08-05 12:51:38'),
(3, '2020-08-05', 1, 7, 7, 1, 15000, 15000, 1, '2020-08-05 12:51:38', '2020-08-05 12:51:38'),
(4, '2020-08-05', 2, 10, 3, 1, 17990, 17990, 1, '2020-08-05 13:13:05', '2020-08-05 13:13:05'),
(6, '2020-08-06', 4, 3, 4, 10, 650, 6500, 1, '2020-08-06 06:39:00', '2020-08-06 06:39:00'),
(8, '2020-08-07', 6, 3, 10, 5, 465, 2325, 1, '2020-08-07 10:37:03', '2020-08-07 10:37:03'),
(9, '2020-08-10', 7, 1, 11, 5, 9990, 49950, 1, '2020-08-10 05:31:54', '2020-08-10 05:32:43'),
(10, '2020-08-10', 8, 9, 2, 3, 11100, 33300, 1, '2020-08-10 06:01:51', '2020-08-10 06:02:16'),
(11, '2020-08-10', 9, 1, 11, 5, 8990, 44950, 1, '2020-08-10 06:13:53', '2020-08-10 06:14:06'),
(12, '2020-08-10', 10, 9, 9, 1, 30000, 30000, 1, '2020-08-10 11:42:22', '2020-08-10 11:42:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2014_10_12_000000_create_users_table', 2),
(5, '2020_07_25_114437_create_suppliers_table', 3),
(6, '2020_07_25_174109_create_customers_table', 4),
(7, '2020_07_25_184810_create_units_table', 5),
(8, '2020_07_26_104327_create_categories_table', 6),
(9, '2020_07_26_134334_create_products_table', 7),
(10, '2020_07_27_074608_create_purchases_table', 8),
(11, '2020_07_29_161526_create_invoices_table', 9),
(12, '2020_07_29_161728_create_invoice_details_table', 9),
(13, '2020_07_29_161933_create_payments_table', 9),
(14, '2020_07_29_162016_create_payment_details_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `paid_status` varchar(51) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `due_amount` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `invoice_id`, `customer_id`, `paid_status`, `paid_amount`, `due_amount`, `total_amount`, `discount_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'partial_paid', 34880, 4500, 39380, 1600, '2020-08-05 12:51:38', '2020-08-17 01:32:33'),
(2, 2, 1, 'full_paid', 17000, 0, 17000, 990, '2020-08-05 13:13:05', '2020-08-05 13:13:05'),
(4, 4, 2, 'full_paid', 6400, 0, 6400, 100, '2020-08-06 06:39:00', '2020-08-06 06:39:00'),
(6, 6, 1, 'full_due', 0, 2000, 2000, 325, '2020-08-07 10:37:03', '2020-08-07 10:37:03'),
(7, 7, 1, 'full_paid', 49450, 0, 49450, 500, '2020-08-10 05:31:54', '2020-08-10 05:31:54'),
(8, 8, 2, 'full_paid', 33300, 0, 33300, NULL, '2020-08-10 06:01:51', '2020-08-10 06:01:51'),
(9, 9, 5, 'full_paid', 44950, 0, 44950, 0, '2020-08-10 06:13:53', '2020-08-10 06:13:53'),
(10, 10, 6, 'full_paid', 27500, 0, 27500, 2500, '2020-08-10 11:42:22', '2020-08-10 11:42:22');

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `current_paid_amount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`id`, `invoice_id`, `current_paid_amount`, `date`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 30000, '2020-08-05', NULL, '2020-08-05 12:51:38', '2020-08-05 12:51:38'),
(2, 2, 17000, '2020-08-05', NULL, '2020-08-05 13:13:05', '2020-08-05 13:13:05'),
(4, 4, 6400, '2020-08-06', NULL, '2020-08-06 06:39:00', '2020-08-06 06:39:00'),
(6, 6, 0, '2020-08-07', NULL, '2020-08-07 10:37:03', '2020-08-07 10:37:03'),
(7, 7, 49450, '2020-08-10', NULL, '2020-08-10 05:31:54', '2020-08-10 05:31:54'),
(8, 8, 33300, '2020-08-10', NULL, '2020-08-10 06:01:51', '2020-08-10 06:01:51'),
(9, 9, 44950, '2020-08-10', NULL, '2020-08-10 06:13:53', '2020-08-10 06:13:53'),
(10, 10, 27500, '2020-08-10', NULL, '2020-08-10 11:42:22', '2020-08-10 11:42:22'),
(11, 1, 1500, '2020-08-12', NULL, '2020-08-12 01:43:35', '2020-08-12 01:43:35'),
(12, 1, 3380, '2020-08-17', NULL, '2020-08-17 01:32:33', '2020-08-17 01:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `supplier_id`, `unit_id`, `category_id`, `name`, `quantity`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Walton Primo NX4', 10, 1, 1, NULL, '2020-07-26 08:40:04', '2020-08-10 05:50:58'),
(2, 2, 1, 9, 'Samsung Galaxy A31', 7, 1, 1, 1, '2020-07-26 08:42:00', '2020-08-10 06:10:55'),
(3, 4, 1, 10, 'Vivo V19', 14, 1, 1, 1, '2020-07-26 12:18:47', '2020-08-10 11:57:51'),
(4, 6, 6, 3, 'KSRM Cements', 20, 1, 1, 1, '2020-07-26 12:21:30', '2020-08-10 06:02:37'),
(6, 5, 1, 2, 'Air Conditioner', 5, 1, 1, 1, '2020-07-26 12:45:08', '2020-08-10 12:11:30'),
(7, 6, 2, 7, 'KSRM Rods', 4, 1, 1, 1, '2020-07-26 12:45:48', '2020-08-07 10:42:23'),
(8, 1, 1, 1, 'Walton Primo X', 3, 1, 1, NULL, '2020-07-27 11:07:45', '2020-08-07 10:42:23'),
(9, 2, 1, 9, 'Samsung OLED TV', 10, 1, 1, 1, '2020-07-27 11:12:54', '2020-08-17 02:13:59'),
(10, 7, 6, 3, 'BSRM Cements', 20, 1, 1, 1, '2020-07-28 04:40:06', '2020-08-10 06:02:31'),
(11, 1, 1, 1, 'Walton Primo RX7', 15, 1, 1, NULL, '2020-08-10 05:29:04', '2020-08-10 06:14:06');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buying_qty` double NOT NULL,
  `unit_price` double NOT NULL,
  `buying_price` double NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=Approved',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `supplier_id`, `category_id`, `product_id`, `purchase_no`, `date`, `description`, `buying_qty`, `unit_price`, `buying_price`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 8, 'WU--0001', '2020-07-28', 'Walton Smartphone device.', 5, 11000, 55000, 1, 1, NULL, '2020-07-27 14:49:17', '2020-07-27 14:49:17'),
(2, 2, 1, 2, 'WU--0001', '2020-07-28', 'Samsung Smartphone device.', 10, 11100, 111000, 1, 1, NULL, '2020-07-27 14:49:17', '2020-07-27 14:49:17'),
(3, 6, 3, 4, 'WU--0001', '2020-07-28', 'KSRM Cements are bought 50 bags.', 50, 550, 27500, 1, 1, NULL, '2020-07-27 14:49:17', '2020-07-27 14:49:17'),
(4, 4, 1, 3, 'WU--0002', '2020-07-28', NULL, 2, 14500, 29000, 1, 1, NULL, '2020-07-27 14:53:12', '2020-07-27 14:53:12'),
(5, 2, 1, 9, 'WU--0003', '2020-07-28', 'Samsung OLED Smart TV', 4, 75000, 300000, 1, 1, NULL, '2020-07-27 14:58:01', '2020-07-27 14:58:01'),
(6, 5, 2, 6, 'WU--0003', '2020-07-28', 'Huawei Air conditioner', 1, 120000, 120000, 1, 1, NULL, '2020-07-27 14:58:01', '2020-07-27 14:58:01'),
(7, 7, 3, 10, 'WU--0004', '2020-07-28', NULL, 25, 550, 13750, 1, 1, NULL, '2020-07-28 04:42:23', '2020-07-28 04:42:23'),
(8, 6, 7, 7, 'WU--0004', '2020-07-28', NULL, 5, 60000, 300000, 1, 1, NULL, '2020-07-28 04:42:23', '2020-07-28 04:42:23'),
(10, 1, 1, 11, 'WU--0020', '2020-08-10', 'Walton Smartphone device.', 25, 8990, 224750, 1, 1, NULL, '2020-08-10 05:29:54', '2020-08-10 05:29:54'),
(11, 1, 1, 1, 'WU--0021', '2020-08-10', NULL, 10, 11100, 111000, 1, 1, NULL, '2020-08-10 05:50:41', '2020-08-10 05:50:41'),
(12, 2, 9, 2, 'WU--0022', '2020-08-10', 'Samsung Smartphone', 10, 11100, 111000, 1, 1, NULL, '2020-08-10 06:10:29', '2020-08-10 06:10:29'),
(13, 2, 9, 9, 'WU--0024', '2020-08-10', 'Samsung OLED Smart TV', 10, 25500, 255000, 1, 1, NULL, '2020-08-10 11:39:53', '2020-08-10 11:39:53'),
(14, 4, 10, 3, 'WU--0023', '2020-08-05', 'Vivi Smartphone', 15, 12000, 180000, 1, 1, NULL, '2020-08-10 11:44:15', '2020-08-10 11:44:15'),
(15, 5, 2, 6, 'WU--0026', '2020-08-11', 'Huawei Air Conditioner', 4, 120000, 480000, 1, 1, NULL, '2020-08-10 12:06:40', '2020-08-10 12:06:40'),
(16, 6, 7, 7, 'WU--0027', '2020-08-11', NULL, 10, 45000, 450000, 0, 1, NULL, '2020-08-10 12:29:35', '2020-08-10 12:29:35'),
(17, 5, 2, 6, 'WU--0035', '2020-08-17', 'Good Condition Air Conditioner', 1, 47000, 47000, 0, 1, NULL, '2020-08-17 02:09:15', '2020-08-17 02:09:15'),
(18, 2, 9, 9, 'WU--0035', '2020-08-17', 'Excellent Quality Product', 1, 53000, 53000, 1, 1, NULL, '2020-08-17 02:09:15', '2020-08-17 02:09:15');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `mobile_no`, `email`, `address`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Walton Plaza', '01711193922', 'waltonplaza@gmail.com', 'Malibagh, Dhaka-1217.', 1, 1, 1, '2020-07-25 07:05:58', '2020-07-25 11:27:23'),
(2, 'Samsung Plaza', '0171193991', 'samsung@gmail.com', 'Malibagh, Dhaka-1217.', 1, 1, 1, '2020-07-25 11:17:16', '2020-07-25 11:24:01'),
(4, 'Vivo Company', '01911919191', 'vivo1234@gmail.com', 'Shantinagar, Dhaka-1217.', 1, 1, 1, '2020-07-25 11:21:58', '2020-07-25 11:23:46'),
(5, 'Huawei Bangladesh Ltd.', '01611611611', 'huawei@gmail.com', 'Boshundhara city complex, Dhaka.', 1, 3, 1, '2020-07-25 11:26:11', '2020-07-25 11:27:05'),
(6, 'KSRM LTD.', '01711233332', 'ksrm@gmail.com', 'Gulshan-1, Dhaka', 1, 1, NULL, '2020-07-26 12:20:47', '2020-07-26 12:20:47'),
(7, 'BSRM LTD.', '01912233442', 'bsrm@gmail.com', 'Dhanmondi-1, Dhaka.', 1, 1, NULL, '2020-07-27 05:00:38', '2020-07-27 05:00:38'),
(8, 'Gazi Group', '01711712347', 'gazigroup@gmail.com', 'Gazipur, Dhaka', 1, 1, NULL, '2020-07-28 13:46:58', '2020-07-28 13:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Peice', 1, 1, 1, '2020-07-25 13:14:05', '2020-07-26 12:18:08'),
(2, 'Kilogram', 1, 1, NULL, '2020-07-25 13:19:50', '2020-07-25 13:19:50'),
(3, 'Litre', 1, 1, 1, '2020-07-25 13:19:58', '2020-07-25 13:25:31'),
(5, 'Ton', 1, 1, NULL, '2020-07-26 12:19:07', '2020-07-26 12:19:07'),
(6, 'Packet', 1, 1, NULL, '2020-07-28 11:53:33', '2020-07-28 11:53:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usertype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `usertype`, `name`, `email`, `email_verified_at`, `password`, `mobile`, `address`, `gender`, `image`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Wasi Uddin', 'wuddin73@gmail.com', NULL, '$2y$10$bHzCiBO76qfDAGsHkdurB.vjAkHXy3c.h/VXu6oADCUHUTYmvYqZe', '01643384445', '36/B Malibagh Chowdhury Para, Dhaka.', 'Male', '202007230825wasi.jpg', 1, NULL, '2020-07-21 14:46:44', '2020-07-25 01:25:34'),
(2, 'Admin', 'Hasan Ansary', 'hasanansary@gmail.com', NULL, '$2y$10$i4Fxzow4pkjincPfOpYBp.JI1/lvagj5jBPEBmR4SPUSqaQfzcgim', NULL, NULL, NULL, NULL, 1, NULL, '2020-07-22 06:07:34', '2020-07-22 06:38:18'),
(3, 'User', 'Shah Poran', 'shahporanmiah543@gmail.com', NULL, '$2y$10$FBj5.GjcIQ2mwJxwz.NX4uohzD5F6xZ3X3ZHsHUmQ4V5Zhw2YiK8q', '01736336380', 'Mirjanogor, Kumilla', 'Male', '202007231305P1010872.JPG', 1, NULL, '2020-07-22 02:25:34', '2020-07-23 07:05:20'),
(4, 'User', 'Amanot Shah', 'amanotshah@gmail.com', NULL, '$2y$10$3FzpeIQpztAD8c4dLGL4aebeEzbaFbPWkGba9BFNr401.miOAHbJW', NULL, NULL, NULL, NULL, 1, NULL, '2020-07-22 05:12:55', '2020-07-25 02:17:23'),
(6, 'User', 'Abdul Hamid', 'ahamid@gmail.com', NULL, '$2y$10$B47BlAdQNkda/pxTTnCT4.dRIPe2dsk92BjugpZ5dgHGk9l6oEnR.', '017117117111', '100/a mugdha dhaka', 'Male', '202007231845DSC_0572.JPG', 1, NULL, '2020-07-22 11:58:13', '2020-07-23 12:45:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
