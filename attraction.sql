-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2018 at 03:42 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attraction`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `created_at`, `updated_at`) VALUES
(1, 'Euorpe', '2018-08-15 13:49:31', '2018-08-15 13:49:31'),
(2, 'Asia', '2018-08-15 13:50:30', '2018-08-15 13:50:30'),
(3, 'America', '2018-08-15 13:50:39', '2018-08-15 13:50:39'),
(4, 'Australia', '2018-08-15 13:50:51', '2018-08-15 13:50:51'),
(5, 'Rusia', '2018-08-15 13:50:58', '2018-08-15 13:50:58');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'testing', '2018-08-17 09:32:45', '2018-08-17 09:32:45'),
(2, 1, 2, 'testing', '2018-08-17 09:34:23', '2018-08-17 09:34:23'),
(3, 1, 2, 'testing 3', '2018-08-17 09:35:06', '2018-08-17 09:35:06'),
(4, 1, 1, 'testing 111', '2018-08-17 09:55:08', '2018-08-17 09:55:08');

-- --------------------------------------------------------

--
-- Table structure for table `dislikes`
--

CREATE TABLE `dislikes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dislikes`
--

INSERT INTO `dislikes` (`id`, `user_id`, `post_id`, `email`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'rajahaq2nb@gmail.com', '2018-08-17 09:06:29', '2018-08-17 09:06:29');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`, `email`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'rajahaq2nb@gmail.com', '2018-08-17 08:49:54', '2018-08-17 08:49:54'),
(2, 1, 2, 'rajahaq2nb@gmail.com', '2018-08-17 09:34:16', '2018-08-17 09:34:16');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_08_15_124402_create_posts_table', 2),
(4, '2018_08_15_124531_create_profiles_table', 2),
(5, '2018_08_15_124615_create_categories_table', 2),
(6, '2018_08_15_124641_create_comments_table', 2),
(7, '2018_08_15_124708_create_likes_table', 2),
(8, '2018_08_15_124732_create_dislikes_table', 2),
(9, '2018_08_17_111933_add_type_to_users', 3),
(10, '2018_08_17_112859_add_newtype_to_users', 4);

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
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `post_title`, `post_body`, `post_image`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'England', 'The actual name of the sovereign state we are talking about is The United Kingdom of Great Britain and Northern Ireland (UK)......... The United Kingdom is made up of the countries England, Scotland, Wales, and Northern Ireland.............\r\nIt is considered a global city and has a population larger than other countries in the United Kingdom besides England itself. Other urban areas of considerable size and influence tend to be in northern England or the English Midlands.', 'http://laravel.test/posts/england-stonehenge.jpg', 1, '2018-08-15 22:00:28', '2018-08-17 07:31:11'),
(2, 1, 'Italy', 'Italy, a European country with a long Mediterranean coastline, has left a powerful mark on Western culture and cuisine. Its capital, Rome, is home to the Vatican as well as landmark art and ancient ruins. Other major cities include Florence, with Renaissance masterpieces such as Michelangelo’s \"David\" and Brunelleschi\'s Duomo; Venice, the city of canals; and Milan, Italy’s fashion capital.', 'http://laravel.test/posts/Italy-Country.jpg', 1, '2018-08-16 08:56:20', '2018-08-16 08:56:20');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_pic` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `name`, `designation`, `profile_pic`, `created_at`, `updated_at`) VALUES
(1, 1, 'raja haq', 'developer', 'http://laravel.test/uploads/190112_1762875124275_6522074_n.jpg', '2018-08-15 16:13:34', '2018-08-15 16:13:34'),
(2, 2, 'david', 'web developer', 'http://laravel.test/uploads/166612_1705608852654_155804_n.jpg', '2018-08-15 20:52:24', '2018-08-15 20:52:24'),
(3, 4, 'Admin', 'admin', 'http://laravel.test/uploads/190112_1762875124275_6522074_n.jpg', '2018-08-17 11:18:31', '2018-08-17 11:18:31'),
(4, 4, 'admin2', 'admin', 'http://laravel.test/uploads/190112_1762875124275_6522074_n.jpg', '2018-08-17 11:18:55', '2018-08-17 11:18:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `type`) VALUES
(1, 'raja haq', 'rajahaq2nb@gmail.com', '$2y$10$GN4T2QR7N4ThYLZdx7YgTeQgxO9p1TyC5x8Wwk7d4SXLRa2MyKqru', 'U3KtxbNlwdXeoWJg8kSIquOkSH53UQbxmdDpO11hbKF6XiZi1hP2FKogrQK0', '2018-08-14 16:09:39', '2018-08-14 16:09:39', 0),
(2, 'david', 'david@test.com', '$2y$10$mBCDfXfM2TamOLLunuwtOeQZATLJmY4NFjOuyQVhiaI0r1Ld92u/6', 'J3q9n5jS8qO6tJNrBE4uQbdHuvuGFJB9SMCzvMug30lOTWok2GltYZtnKGlG', '2018-08-14 16:10:21', '2018-08-14 16:10:21', 0),
(4, 'raja haq', 'admin@admin.com', '$2y$10$f0Cr/tXbITQBvGjCA3cfoe522QLRkZVbSGS297VDKA.QSYZaYvCpm', 'G9fh3ILMNGs4lpfLnb1Iy92NpCOrDM5HxXFP08lpVMzxLx27RwGfv5OiSNGI', '2018-08-17 10:49:49', '2018-08-17 10:49:49', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dislikes`
--
ALTER TABLE `dislikes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dislikes`
--
ALTER TABLE `dislikes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
