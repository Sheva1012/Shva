-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Des 2024 pada 10.45
-- Versi server: 10.4.32-MariaDB-log
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokosembako`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `active`) VALUES
(1, 'Bahan Pokok', '2024-11-25 11:20:36', '2024-12-09 17:12:04', 1),
(2, 'Peralatan Mandi', '2024-11-25 11:20:36', '2024-12-09 17:49:09', 1),
(3, 'Minuman Dingin', '2024-11-25 11:20:36', '2024-12-09 17:33:41', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_18_233219_create_categories_table', 1),
(5, '2024_11_25_114302_add_active_to_categories', 1),
(6, '2024_11_25_131935_create_products_table', 1),
(7, '2024_11_25_184116_create_orders_table', 2),
(8, '2024_11_25_184152_create_order_details_table', 2),
(9, '2024_11_26_012553_add_active_to_order', 3),
(10, '2024_11_26_012800_add_active_to_orders', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer` varchar(255) NOT NULL,
  `payment` double NOT NULL,
  `total` double NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `customer`, `payment`, `total`, `user_id`, `created_at`, `updated_at`) VALUES
(15, 'Yanto', 40000, 20000, 8, '2024-12-09 10:05:28', '2024-12-09 10:05:28'),
(17, 'Sheva', 20000, 15000, 8, '2024-12-09 10:31:14', '2024-12-09 10:31:14'),
(18, 'Aldi', 20000, 15000, 8, '2024-12-09 10:32:17', '2024-12-09 10:32:17'),
(19, 'Ibra', 29000, 20000, 8, '2024-12-09 10:39:02', '2024-12-09 10:39:02'),
(20, 'Cota', 10000, 5000, 8, '2024-12-09 10:39:43', '2024-12-09 10:39:43'),
(21, 'udin', 100000, 90000, 8, '2024-12-09 19:28:19', '2024-12-09 19:28:19'),
(22, 'ngik', 8000, 8000, 8, '2024-12-09 19:29:17', '2024-12-09 19:29:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(21, 15, 4, 1, 20000, '2024-12-09 10:05:28', '2024-12-09 10:05:28'),
(23, 17, 2, 1, 15000, '2024-12-09 10:31:14', '2024-12-09 10:31:14'),
(24, 18, 2, 1, 15000, '2024-12-09 10:32:17', '2024-12-09 10:32:17'),
(25, 19, 4, 1, 20000, '2024-12-09 10:39:02', '2024-12-09 10:39:02'),
(26, 20, 1, 1, 5000, '2024-12-09 10:39:43', '2024-12-09 10:39:43'),
(27, 21, 1, 3, 12000, '2024-12-09 19:28:19', '2024-12-09 19:28:19'),
(28, 21, 5, 2, 27000, '2024-12-09 19:28:19', '2024-12-09 19:28:19'),
(29, 22, 2, 1, 8000, '2024-12-09 19:29:17', '2024-12-09 19:29:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `image`, `price`, `stok`, `created_at`, `updated_at`) VALUES
(1, 1, 'Beras', 'products/CndUSIB1dRFzSQ07oe2qZFgZ61ayVVfvczwmpuHb.jpg', 12000, 6, '2024-11-25 12:26:11', '2024-12-10 05:12:47'),
(2, 1, 'Gula', 'products/5y1zHJDrO6OUfwRiK1jzqLoHudM7xmDlqJ7xTceS.jpg', 8000, 8, '2024-12-01 22:04:27', '2024-12-09 19:29:17'),
(4, 1, 'Garam', 'products/xoddPufpArIc1aivDbI3a2B6EccHG7dG7m0d2OgX.jpg', 5000, 10, '2024-12-01 22:17:48', '2024-12-09 17:34:22'),
(5, 1, 'Telur', 'products/OxC63UQCd95jPQDERn4BGB5yIU0PBtg6MnjqtFZP.jpg', 27000, 8, '2024-12-09 17:16:34', '2024-12-09 19:28:19'),
(6, 1, 'Minyak Goreng', 'products/EvoMYzcSpvEDsSBcPMkvkclkfruiFp5J4lEnNhBr.jpg', 15000, 9, '2024-12-09 17:16:57', '2024-12-09 22:08:32'),
(7, 2, 'Pasta Gigi', 'products/7fKtdZDdKwS9qN4M1GleNZxoundBXNoNWPZgn5Fn.jpg', 5000, 9, '2024-12-09 17:18:03', '2024-12-14 14:27:20'),
(8, 2, 'Shampoo', 'products/iaYb9nwSzmfm9RiiWrRa1pp3DMfZbTQS88KgCOa6.jpg', 3000, 9, '2024-12-09 17:18:46', '2024-12-10 05:23:07'),
(9, 2, 'Sabun Mandi', 'products/IT5T2SdlQB4qxmMsB2lImCUn6LUeCBvSiA1cjNAk.jpg', 3000, 8, '2024-12-09 17:19:04', '2024-12-10 05:22:35'),
(10, 2, 'Sikat Gigi', 'products/OFdQ6DYCDYxEAaK6lEMuA3cJGzhLZPmhOf7wpV7m.jpg', 2000, 10, '2024-12-09 17:19:30', '2024-12-09 17:35:03'),
(11, 3, 'Air Putih', 'products/AoGEKuFhl9fxjZ4RGsPhP0hawL9BWAD2UWK1vvsO.jpg', 3000, 10, '2024-12-09 17:21:49', '2024-12-09 17:35:14'),
(12, 3, 'Teh', 'products/7i6V9BHb2705dzwMXfIcgHd1hwC7iU3D7B7HpMsN.jpg', 3000, 8, '2024-12-09 17:22:15', '2024-12-10 05:22:35'),
(13, 3, 'Kopi', 'products/6qku1vV1LTpbt0BSZqlxVIyKZ4n7aPiAwjLk6QOs.jpg', 5000, 10, '2024-12-09 17:22:46', '2024-12-09 17:35:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('dE5u0P6uP6NJvD1OAqjqkrzsYyHpre7IXpAw6XI1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiTkNuV3N2clFLemhQS0lSd3lBUEFRQnBsdlJzSjN5YWVzMWZESllTZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fX0=', 1734681174),
('K1Opc6fVigXsIeLJYGTTJ1XaFRJYjP7xKw0ZYKmG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiUVpDQWpPNnpvdVJKNnFrYXB5UVZJcnJZalFaMWlYS3BsTjdqZmcxaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fX0=', 1734595351),
('ZygVpOyx0ebQ3F9brZkxcMyqbJNvQDC1GiHD19yt', 8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiUEJDTFRCZGY5dk96a0RDYzJIUWpvcVphUWZaN2hyMjVlakxzQWk4ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9vcmRlcnMiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo4O30=', 1734549570);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `usertype` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `usertype`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'Admin', 'admin', 'admin@example.com', NULL, '$2y$12$59tZ7oH.41UOi97oVITNmuUmNWdtKoBUhWqXG5C/kWl0DBCdwMmUq', NULL, '2024-12-09 09:46:09', '2024-12-09 09:46:09'),
(9, 'Owner', 'owner', 'owner@example.com', NULL, '$2y$12$D3NRyPIHONgsIEgWrEpekOjIPK7HjDTTdISe5Wf7OEyd29WLPOHp6', NULL, '2024-12-09 09:49:12', '2024-12-09 09:49:12'),
(10, 'wahyu', 'owner', 'wahyu@gmail.com', NULL, '$2y$12$0.HfkwTKzKQawPBi25Sqi.1C7aNLB.LhhufPXzUn1DZRyJBBnFrdW', NULL, '2024-12-09 17:52:58', '2024-12-09 17:52:58'),
(11, 'reza', 'admin', 'reza@gmail.com', NULL, '$2y$12$GQlKzDvwFnl7UiekU1HfTuaThgO4QV2jYPf0q7n2SYV7BUJ//Goiq', NULL, '2024-12-09 17:53:52', '2024-12-09 17:57:03');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
