-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 22 jan. 2023 à 17:23
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `distance_learning`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `chapters`
--

CREATE TABLE `chapters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `document` varchar(255) NOT NULL,
  `td` varchar(255) DEFAULT NULL,
  `tp` varchar(255) DEFAULT NULL,
  `ue_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `chapters`
--

INSERT INTO `chapters` (`id`, `name`, `document`, `td`, `tp`, `ue_id`, `created_at`, `updated_at`) VALUES
(2, 'hacking 2', 'd5a11eca-4e85-46c0-9bc3-380a6ed3062f.pdf', 'de4b231f-6320-4b1d-98a5-3b0c3fb2adb9.pdf', 'ff7a59c6-7fa5-4c4c-97f0-ed4afc079d72.pdf', 2, '2023-01-12 07:43:33', '2023-01-12 07:43:33'),
(3, 'apprendre le hack', '3b9d5015-400c-4588-a6e9-a2cba451e453.pdf', NULL, NULL, 6, '2023-01-12 09:39:38', '2023-01-12 09:39:38'),
(4, 'chapitre 2', 'a227fcd9-e4e5-406b-afcf-fc5ecb2b4be9.pdf', NULL, NULL, 6, '2023-01-12 10:40:43', '2023-01-12 10:40:43');

-- --------------------------------------------------------

--
-- Structure de la table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `uuid` char(36) NOT NULL,
  `photo` varchar(255) NOT NULL DEFAULT 'course-4.jpg',
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
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
-- Structure de la table `fields`
--

CREATE TABLE `fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL DEFAULT 'co-5.jpg',
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fields`
--

INSERT INTO `fields` (`id`, `name`, `slug`, `photo`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ICT4D', 'ict4d', 'co-5.jpg', 'Description de ICT4D ici ....', '2022-07-06 10:36:14', '2022-07-06 10:36:14'),
(2, 'Physics', 'physics', 'co-5.jpg', 'Description de Physics ici ....', '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(3, 'Computer Sciences', 'info', 'co-5.jpg', 'Description de Computer Sciences ici ....', '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(4, 'Mathematics', 'maths', 'co-5.jpg', 'Description de Mathematics ici ....', '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(5, 'Chemistry', 'chemistry', 'co-5.jpg', 'Description de Chemistry ici ....', '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(6, 'geographi', 'geographi', 'co-5.jpg', 'sdfsdfsdf', '2022-12-18 17:24:27', '2022-12-18 17:24:27'),
(9, 'Programmation', 'programmation', 'co-5.jpg', 'cour de programmation sur different langage', '2023-01-12 08:34:04', '2023-01-12 08:34:04');

-- --------------------------------------------------------

--
-- Structure de la table `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `pension` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `levels`
--

INSERT INTO `levels` (`id`, `name`, `slug`, `description`, `pension`, `field_id`, `created_at`, `updated_at`) VALUES
(1, 'Level 1', 'level-1', NULL, 300000, 1, '2022-07-06 10:36:14', '2022-07-06 09:36:58'),
(2, 'Level 2', 'level-2', NULL, 300000, 1, '2022-07-06 10:36:15', '2022-07-06 09:36:51'),
(3, 'Level 3', 'level-3', NULL, 300000, 1, '2022-07-06 10:36:15', '2022-07-06 09:36:36'),
(4, 'Level 1', 'l1', 'Level 1 of Physics', 50000, 2, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(5, 'Level 2', 'l2', 'Level 2 of Physics', 50000, 2, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(6, 'Level 3', 'l3', 'Level 3 of Physics', 50000, 2, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(7, 'Level 1', 'l1', 'Level 1 of Computer Sciences', 50000, 3, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(8, 'Level 2', 'l2', 'Level 2 of Computer Sciences', 50000, 3, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(9, 'Level 3', 'l3', 'Level 3 of Computer Sciences', 50000, 3, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(10, 'Level 1', 'l1', 'Level 1 of Mathematics', 50000, 4, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(11, 'Level 2', 'l2', 'Level 2 of Mathematics', 50000, 4, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(12, 'Level 3', 'l3', 'Level 3 of Mathematics', 50000, 4, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(13, 'Level 1', 'l1', 'Level 1 of Chemistry', 50000, 5, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(14, 'Level 2', 'l2', 'Level 2 of Chemistry', 50000, 5, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(15, 'Level 3', 'l3', 'Level 3 of Chemistry', 50000, 5, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(16, 'Level 1', 'L1', 'Level 1 of geographi', 50000, 6, '2022-12-18 17:24:27', '2022-12-18 17:24:27'),
(17, 'Level 2', 'L2', 'Level 2 of geographi', 50000, 6, '2022-12-18 17:24:27', '2022-12-18 17:24:27'),
(18, 'Level 3', 'L3', 'Level 3 of geographi', 50000, 6, '2022-12-18 17:24:27', '2022-12-18 17:24:27'),
(19, 'Master Degree 1', 'M1', 'Masters Degree 1 of geographi', 50000, 6, '2022-12-18 17:24:27', '2022-12-18 17:24:27'),
(20, 'Master Degree 2', 'M1', 'Masters Degree 2 of geographi', 50000, 6, '2022-12-18 17:24:27', '2022-12-18 17:24:27'),
(38, 'niveau debutant', 'niveau-debutant', 'premier niveau', 0, 9, '2023-01-12 08:36:38', '2023-01-12 08:36:38'),
(39, 'niveau avancer', 'niveau-avancer', 'niveau avancer', 0, 9, '2023-01-12 08:37:16', '2023-01-12 08:37:16');

-- --------------------------------------------------------

--
-- Structure de la table `level_user`
--

CREATE TABLE `level_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `level_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `registration_date` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `level_user`
--

INSERT INTO `level_user` (`id`, `level_id`, `user_id`, `registration_date`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2002', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `lives`
--

CREATE TABLE `lives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `stream_code` varchar(255) DEFAULT NULL,
  `titre` varchar(255) NOT NULL,
  `date_debut` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ue_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lives`
--

INSERT INTO `lives` (`id`, `uuid`, `stream_code`, `titre`, `date_debut`, `user_id`, `ue_id`, `created_at`, `updated_at`) VALUES
(6, '943a244b-23ac-4e2e-a177-a1a4dc6693fe', NULL, 'stream', '1674406380', 4, 6, '2023-01-22 14:52:11', '2023-01-22 14:52:11');

-- --------------------------------------------------------

--
-- Structure de la table `live_user`
--

CREATE TABLE `live_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `live_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_adhésion` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `live_user`
--

INSERT INTO `live_user` (`id`, `live_id`, `user_id`, `date_adhésion`, `created_at`, `updated_at`) VALUES
(3, 1, 1, '1673624760', NULL, NULL),
(4, 2, 1, '1674200726', NULL, NULL),
(5, 2, 4, '1674200986', NULL, NULL),
(6, 3, 4, '1674208473', NULL, NULL),
(7, 3, 1, '1674208480', NULL, NULL),
(8, 4, 1, '1674243090', NULL, NULL),
(9, 5, 1, '1674295229', NULL, NULL),
(10, 5, 4, '1674295237', NULL, NULL),
(11, 6, 1, '1674402755', NULL, NULL),
(12, 6, 4, '1674402760', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_01_24_212415_create_categories_table', 1),
(6, '2022_01_24_215638_create_courses_table', 1),
(7, '2022_02_20_195617_create_modules_table', 1),
(8, '2022_02_20_200028_create_sections_table', 1),
(9, '2022_03_29_201847_create_course_user_table', 1),
(10, '2022_05_17_135540_create_lives_table', 1),
(11, '2022_05_17_140636_create_live_user_table', 1),
(12, '2022_05_25_112516_create_fields_table', 1),
(13, '2022_05_25_114723_create_levels_table', 1),
(14, '2022_05_25_115439_create_semesters_table', 1),
(15, '2022_05_25_115629_create_ues_table', 1),
(16, '2022_05_25_130254_create_teachers_table', 1),
(17, '2022_06_07_160441_create_teacher_ue_table', 1),
(18, '2022_06_15_164626_create_level_user_table', 1),
(19, '2022_06_15_213428_create_chapters_table', 1),
(20, '2022_07_14_060249_create_ue_user_table', 1),
(21, '2022_07_17_191944_create_transactions_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `intro` varchar(255) NOT NULL,
  `td` varchar(255) NOT NULL,
  `tp` varchar(255) NOT NULL,
  `uuid` char(36) NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `uuid` char(36) NOT NULL,
  `module_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `semesters`
--

CREATE TABLE `semesters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `level_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `semesters`
--

INSERT INTO `semesters` (`id`, `name`, `slug`, `level_id`, `created_at`, `updated_at`) VALUES
(1, 'Semester 1', 'semester-1', 1, '2022-07-06 10:36:14', '2022-07-06 10:36:14'),
(2, 'Semester 2', 'semester-2', 1, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(3, 'Semester 1', 'semester-1', 2, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(4, 'Semester 2', 'semester-2', 2, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(5, 'Semester 1', 'semester-1', 3, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(6, 'Semester 2', 'semester-2', 3, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(7, 'Semester 1', 'semester-1', 4, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(8, 'Semester 2', 'semester-2', 4, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(9, 'Semester 1', 'semester-1', 5, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(10, 'Semester 2', 'semester-2', 5, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(11, 'Semester 1', 'semester-1', 6, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(12, 'Semester 2', 'semester-2', 6, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(13, 'Semester 1', 'semester-1', 7, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(14, 'Semester 2', 'semester-2', 7, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(15, 'Semester 1', 'semester-1', 8, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(16, 'Semester 2', 'semester-2', 8, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(17, 'Semester 1', 'semester-1', 9, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(18, 'Semester 2', 'semester-2', 9, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(19, 'Semester 1', 'semester-1', 10, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(20, 'Semester 2', 'semester-2', 10, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(21, 'Semester 1', 'semester-1', 11, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(22, 'Semester 2', 'semester-2', 11, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(23, 'Semester 1', 'semester-1', 12, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(24, 'Semester 2', 'semester-2', 12, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(25, 'Semester 1', 'semester-1', 13, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(26, 'Semester 2', 'semester-2', 13, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(27, 'Semester 1', 'semester-1', 14, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(28, 'Semester 2', 'semester-2', 14, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(29, 'Semester 1', 'semester-1', 15, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(30, 'Semester 2', 'semester-2', 15, '2022-07-06 10:36:15', '2022-07-06 10:36:15'),
(31, 'Semester 1', 'semester-1', 16, '2022-12-18 17:24:27', '2022-12-18 17:24:27'),
(32, 'Semester 2', 'semester-2', 16, '2022-12-18 17:24:27', '2022-12-18 17:24:27'),
(33, 'Semester 1', 'semester-1', 17, '2022-12-18 17:24:27', '2022-12-18 17:24:27'),
(34, 'Semester 2', 'semester-2', 17, '2022-12-18 17:24:27', '2022-12-18 17:24:27'),
(35, 'Semester 1', 'semester-1', 18, '2022-12-18 17:24:27', '2022-12-18 17:24:27'),
(36, 'Semester 2', 'semester-2', 18, '2022-12-18 17:24:27', '2022-12-18 17:24:27'),
(37, 'Semester 1', 'semester-1', 19, '2022-12-18 17:24:27', '2022-12-18 17:24:27'),
(38, 'Semester 2', 'semester-2', 19, '2022-12-18 17:24:27', '2022-12-18 17:24:27'),
(39, 'Semester 1', 'semester-1', 20, '2022-12-18 17:24:28', '2022-12-18 17:24:28'),
(40, 'Semester 2', 'semester-2', 20, '2022-12-18 17:24:28', '2022-12-18 17:24:28'),
(41, 'Semester 1', 'semester-1', 21, '2023-01-12 07:53:11', '2023-01-12 07:53:11'),
(42, 'Semester 2', 'semester-2', 21, '2023-01-12 07:53:11', '2023-01-12 07:53:11'),
(43, 'Semester 1', 'semester-1', 22, '2023-01-12 07:53:11', '2023-01-12 07:53:11'),
(44, 'Semester 2', 'semester-2', 22, '2023-01-12 07:53:11', '2023-01-12 07:53:11'),
(45, 'Semester 1', 'semester-1', 23, '2023-01-12 07:53:11', '2023-01-12 07:53:11'),
(46, 'Semester 2', 'semester-2', 23, '2023-01-12 07:53:11', '2023-01-12 07:53:11'),
(47, 'Semester 1', 'semester-1', 24, '2023-01-12 07:53:11', '2023-01-12 07:53:11'),
(48, 'Semester 2', 'semester-2', 24, '2023-01-12 07:53:11', '2023-01-12 07:53:11'),
(49, 'Semester 1', 'semester-1', 25, '2023-01-12 07:53:11', '2023-01-12 07:53:11'),
(50, 'Semester 2', 'semester-2', 25, '2023-01-12 07:53:11', '2023-01-12 07:53:11'),
(51, 'Semester 1', 'semester-1', 26, '2023-01-12 07:55:35', '2023-01-12 07:55:35'),
(52, 'Semester 2', 'semester-2', 26, '2023-01-12 07:55:35', '2023-01-12 07:55:35'),
(53, 'Semester 1', 'semester-1', 27, '2023-01-12 07:56:35', '2023-01-12 07:56:35'),
(54, 'Semester 2', 'semester-2', 27, '2023-01-12 07:56:35', '2023-01-12 07:56:35'),
(55, 'Semester 1', 'semester-1', 28, '2023-01-12 08:12:51', '2023-01-12 08:12:51'),
(56, 'Semester 2', 'semester-2', 28, '2023-01-12 08:12:51', '2023-01-12 08:12:51'),
(57, 'Semester 1', 'semester-1', 29, '2023-01-12 08:12:51', '2023-01-12 08:12:51'),
(58, 'Semester 2', 'semester-2', 29, '2023-01-12 08:12:51', '2023-01-12 08:12:51'),
(59, 'Semester 1', 'semester-1', 30, '2023-01-12 08:12:51', '2023-01-12 08:12:51'),
(60, 'Semester 2', 'semester-2', 30, '2023-01-12 08:12:51', '2023-01-12 08:12:51'),
(61, 'Semester 1', 'semester-1', 31, '2023-01-12 08:12:51', '2023-01-12 08:12:51'),
(62, 'Semester 2', 'semester-2', 31, '2023-01-12 08:12:52', '2023-01-12 08:12:52'),
(63, 'Semester 1', 'semester-1', 32, '2023-01-12 08:12:52', '2023-01-12 08:12:52'),
(64, 'Semester 2', 'semester-2', 32, '2023-01-12 08:12:52', '2023-01-12 08:12:52'),
(65, 'Semester 1', 'semester-1', 33, '2023-01-12 08:34:04', '2023-01-12 08:34:04'),
(66, 'Semester 2', 'semester-2', 33, '2023-01-12 08:34:04', '2023-01-12 08:34:04'),
(67, 'Semester 1', 'semester-1', 34, '2023-01-12 08:34:04', '2023-01-12 08:34:04'),
(68, 'Semester 2', 'semester-2', 34, '2023-01-12 08:34:04', '2023-01-12 08:34:04'),
(69, 'Semester 1', 'semester-1', 35, '2023-01-12 08:34:05', '2023-01-12 08:34:05'),
(70, 'Semester 2', 'semester-2', 35, '2023-01-12 08:34:05', '2023-01-12 08:34:05'),
(71, 'Semester 1', 'semester-1', 36, '2023-01-12 08:34:05', '2023-01-12 08:34:05'),
(72, 'Semester 2', 'semester-2', 36, '2023-01-12 08:34:05', '2023-01-12 08:34:05'),
(73, 'Semester 1', 'semester-1', 37, '2023-01-12 08:34:05', '2023-01-12 08:34:05'),
(74, 'Semester 2', 'semester-2', 37, '2023-01-12 08:34:05', '2023-01-12 08:34:05'),
(75, 'Semester 1', 'semester-1', 38, '2023-01-12 08:36:38', '2023-01-12 08:36:38'),
(76, 'Semester 2', 'semester-2', 38, '2023-01-12 08:36:39', '2023-01-12 08:36:39'),
(77, 'Semester 1', 'semester-1', 39, '2023-01-12 08:37:16', '2023-01-12 08:37:16'),
(78, 'Semester 2', 'semester-2', 39, '2023-01-12 08:37:16', '2023-01-12 08:37:16');

-- --------------------------------------------------------

--
-- Structure de la table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `poste` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `teachers`
--

INSERT INTO `teachers` (`id`, `title`, `name`, `poste`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Ing', 'Leonel MOYOU', 'Teacher', 4, '2022-07-13 19:09:50', '2022-07-13 19:09:50'),
(3, 'Ing', 'Corneille TCHIO', 'Teacher', 6, '2022-07-13 19:09:50', '2022-07-13 19:09:50'),
(4, 'Dr', 'Thomas MESSI', 'Teacher', 7, '2022-07-13 19:09:50', '2022-07-13 19:09:50'),
(5, 'Dr', 'Mike TAPAMO', 'Teacher', 8, '2022-07-13 19:09:50', '2022-07-13 19:09:50'),
(7, 'Dr', 'Valéry Monthe', 'Lecturer', 10, '2022-07-13 19:17:38', '2022-07-13 19:17:38'),
(8, 'Ing', 'Njine Chuangueu', 'Lecturer', 11, '2022-07-13 19:19:41', '2022-07-13 19:19:41'),
(9, 'Dr', 'Marie Aicha', 'Teacher', 5, '2023-01-12 07:14:17', '2023-01-12 07:14:17');

-- --------------------------------------------------------

--
-- Structure de la table `teacher_ue`
--

CREATE TABLE `teacher_ue` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `ue_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `teacher_ue`
--

INSERT INTO `teacher_ue` (`id`, `teacher_id`, `ue_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 3, 3, NULL, NULL),
(4, 5, 4, NULL, NULL),
(5, 6, 5, NULL, NULL),
(6, 1, 6, NULL, NULL),
(7, 7, 7, NULL, NULL),
(8, 2, 8, NULL, NULL),
(9, 8, 9, NULL, NULL),
(13, 9, 12, NULL, NULL),
(14, 9, 13, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_ref` char(36) NOT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `level_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ues`
--

CREATE TABLE `ues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL DEFAULT 'co-1.jpg',
  `description` text DEFAULT NULL,
  `requirements` text DEFAULT NULL,
  `syllabus` text DEFAULT NULL,
  `semester_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ues`
--

INSERT INTO `ues` (`id`, `name`, `code`, `slug`, `photo`, `description`, `requirements`, `syllabus`, `semester_id`, `created_at`, `updated_at`) VALUES
(1, 'Digital communication', 'ict316', 'digital-communication', 'co-1.jpg', NULL, NULL, NULL, 6, '2022-07-13 19:13:03', '2022-07-13 19:13:03'),
(2, 'Computer Forensics and Incident Response', 'ict314', 'computer-forensics-and-incident-response', 'co-1.jpg', NULL, NULL, NULL, 6, '2022-07-13 19:13:23', '2022-07-13 19:13:23'),
(3, 'Software Development in Java II', 'ict308', 'software-development-in-java-ii', 'co-1.jpg', NULL, NULL, NULL, 6, '2022-07-13 19:13:54', '2022-07-13 19:13:54'),
(4, 'Business Intelligence', 'ict306', 'business-intelligence', 'co-1.jpg', NULL, NULL, NULL, 6, '2022-07-13 19:14:17', '2022-07-13 19:14:17'),
(5, 'Software Testing and Deployment', 'ict304', 'software-testing-and-deployment', 'co-1.jpg', NULL, NULL, NULL, 6, '2022-07-13 19:15:43', '2022-07-13 19:15:43'),
(6, 'Cyber and Internet Security', 'ict313', 'cyber-and-internet-security', 'co-1.jpg', NULL, NULL, NULL, 5, '2022-07-13 19:16:36', '2022-07-13 19:16:36'),
(7, 'Software Architectures and Design', 'ict301', 'software-architectures-and-design', 'co-1.jpg', NULL, NULL, NULL, 5, '2022-07-13 19:18:08', '2022-07-13 19:18:08'),
(8, 'Data Communication and Security', 'ict303', 'data-communication-and-security', 'co-1.jpg', NULL, NULL, NULL, 5, '2022-07-13 19:18:33', '2022-07-13 19:18:33'),
(9, 'Web Application Development', 'ict305', 'web-application-development', 'co-1.jpg', NULL, NULL, NULL, 5, '2022-07-13 19:20:26', '2022-07-13 19:20:26'),
(12, 'Programmation python', 'pr101', 'programmation-python', '61d42d538aec6733243470a7_Python-logo.png', 'programmation python', NULL, NULL, 75, '2023-01-12 08:52:24', '2023-01-12 10:18:05'),
(13, 'Programmation java', 'pr102', 'programmation-java', 'logo_java.jpg', 'programmation java', NULL, NULL, 75, '2023-01-12 08:54:56', '2023-01-12 10:18:30');

-- --------------------------------------------------------

--
-- Structure de la table `ue_user`
--

CREATE TABLE `ue_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ue_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `date_naissance` varchar(255) DEFAULT NULL,
  `lieu_naissance` varchar(255) DEFAULT NULL,
  `priority` enum('0','2','4','5') NOT NULL DEFAULT '0',
  `photo` varchar(255) NOT NULL DEFAULT 'avatar.png',
  `teacher_id` int(11) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `email_verified_at`, `password`, `date_naissance`, `lieu_naissance`, `priority`, `photo`, `teacher_id`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'goube', 'jack', 'goubexlv@gmail.com', '2022-07-13 19:09:49', '$2y$10$IrHJejLRFfoLrYdvRGCz2ujnzZsuyLK4P5BcxQdO701s7jxUJTQY.', '2000-01-20', 'yaounde', '0', 'avatar.png', NULL, NULL, NULL, '2022-12-12 18:53:54', '2022-12-12 18:53:54'),
(2, 'Admin', 'Account', 'admin@domain.com', '2022-07-13 19:09:49', '$2y$10$IrHJejLRFfoLrYdvRGCz2ujnzZsuyLK4P5BcxQdO701s7jxUJTQY.', '1995-06-25', 'HomeCity', '5', 'avatar.png', NULL, NULL, NULL, '2022-07-13 19:09:50', '2022-07-13 19:09:50'),
(3, 'goube', 'jack', 'goube@gmail.com', '2022-07-13 19:09:49', '$2y$10$IrHJejLRFfoLrYdvRGCz2ujnzZsuyLK4P5BcxQdO701s7jxUJTQY.', '1995-06-25', 'Yaounde', '5', 'avatar.png', NULL, NULL, NULL, '2022-07-13 19:09:50', '2022-07-13 19:09:50'),
(4, 'Leonel', 'MOYOU', 'moyouleonel@gmail.com', '2022-07-13 19:09:49', '$2y$10$IrHJejLRFfoLrYdvRGCz2ujnzZsuyLK4P5BcxQdO701s7jxUJTQY.', '1995-06-25', 'HomeCity', '2', 'avatar.png', NULL, NULL, NULL, '2022-07-13 19:09:50', '2022-07-13 19:09:50'),
(5, 'marie', 'aicha', 'marie@gmail.com', NULL, '$2y$10$s3s5fr8XFa/qT1SFqQOUuOy3./r158rz0zPSCBR1DFNd4IKtP/Ut2', NULL, NULL, '2', 'avatar.png', NULL, NULL, NULL, '2023-01-12 07:14:17', '2023-01-12 07:14:17'),
(6, 'test', 'test1', 'test@gmail.com', NULL, '$2y$10$HY/2pV3wB3bCG0FO9H/ZzeDJCXXXKWZ4bbBhOwcHptL9vYQnGAGx2', '1996-01-12', 'yaounde', '0', 'avatar.png', NULL, NULL, NULL, '2023-01-12 09:09:26', '2023-01-12 09:09:26');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `level_user`
--
ALTER TABLE `level_user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lives`
--
ALTER TABLE `lives`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `live_user`
--
ALTER TABLE `live_user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `teacher_ue`
--
ALTER TABLE `teacher_ue`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ues`
--
ALTER TABLE `ues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ues_code_unique` (`code`);

--
-- Index pour la table `ue_user`
--
ALTER TABLE `ue_user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `level_user`
--
ALTER TABLE `level_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `lives`
--
ALTER TABLE `lives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `live_user`
--
ALTER TABLE `live_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT pour la table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `teacher_ue`
--
ALTER TABLE `teacher_ue`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ues`
--
ALTER TABLE `ues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `ue_user`
--
ALTER TABLE `ue_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
