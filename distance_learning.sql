-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 24 juil. 2023 à 16:00
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
(3, 'apprendre le hack', '3b9d5015-400c-4588-a6e9-a2cba451e453.pdf', NULL, NULL, 6, '2023-01-12 09:39:38', '2023-01-12 09:39:38'),
(4, 'chapitre 2', 'a227fcd9-e4e5-406b-afcf-fc5ecb2b4be9.pdf', NULL, NULL, 6, '2023-01-12 10:40:43', '2023-01-12 10:40:43'),
(6, 'cyber', '68a0d624-0fa4-4b45-80a0-4aaf958bf916.pdf', NULL, '9d7c9104-d8b9-41f2-891f-6b1c729c006b.pdf', 2, '2023-04-04 07:12:46', '2023-04-04 07:12:46');

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
-- Structure de la table `forum_categories`
--

CREATE TABLE `forum_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `accepts_threads` tinyint(1) NOT NULL DEFAULT 0,
  `newest_thread_id` int(10) UNSIGNED DEFAULT NULL,
  `latest_active_thread_id` int(10) UNSIGNED DEFAULT NULL,
  `thread_count` int(11) NOT NULL DEFAULT 0,
  `post_count` int(11) NOT NULL DEFAULT 0,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `_lft` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `_rgt` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `forum_categories`
--

INSERT INTO `forum_categories` (`id`, `title`, `description`, `accepts_threads`, `newest_thread_id`, `latest_active_thread_id`, `thread_count`, `post_count`, `is_private`, `created_at`, `updated_at`, `_lft`, `_rgt`, `parent_id`, `color`) VALUES
(1, 'Java', '', 1, NULL, NULL, 0, 0, 0, '2023-07-19 09:29:12', '2023-07-19 09:29:12', 1, 2, NULL, '#4CAF50');

-- --------------------------------------------------------

--
-- Structure de la table `forum_posts`
--

CREATE TABLE `forum_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `post_id` int(10) UNSIGNED DEFAULT NULL,
  `sequence` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `forum_threads`
--

CREATE TABLE `forum_threads` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `pinned` tinyint(1) DEFAULT 0,
  `locked` tinyint(1) DEFAULT 0,
  `first_post_id` int(10) UNSIGNED DEFAULT NULL,
  `last_post_id` int(10) UNSIGNED DEFAULT NULL,
  `reply_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `forum_threads_read`
--

CREATE TABLE `forum_threads_read` (
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 3, 1, '2002', NULL, NULL),
(2, 3, 6, '2002', NULL, NULL),
(3, 3, 7, '2002', NULL, NULL);

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
(28, 'e55f17c9-885f-48d1-a486-4342e00e68bf', NULL, 'cour1', '1686934080', 4, 2, '2023-06-16 12:47:29', '2023-06-16 12:47:29'),
(29, '4e2540e3-6f64-40c3-85fc-da8c7e7afb75', NULL, 'cour', '1689120000', 4, 2, '2023-07-12 08:47:00', '2023-07-12 08:47:00'),
(30, '2cedbd25-2f03-4eac-8024-1b0642d9f29c', NULL, 'cour111', '1689131340', 4, 2, '2023-07-12 09:07:48', '2023-07-12 09:07:48');

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
(10, 5, 4, '1674295237', NULL, NULL);

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
(21, '2022_07_17_191944_create_transactions_table', 1),
(22, '2023_03_09_105021_create_questions_table', 1),
(23, '2023_03_09_110006_create_options_table', 2),
(24, '2023_03_10_081941_create_questions_table', 3),
(25, '2023_03_10_082423_create_questions_table', 4),
(26, '2023_03_10_131536_create_options_table', 5),
(27, '2023_03_10_140930_create_options_table', 6),
(28, '2023_03_10_145532_create_options_table', 7),
(29, '2023_03_10_151643_create_options_table', 8),
(30, '2023_03_10_220857_create_options_table', 9),
(31, '2023_03_11_140910_create_questions_table', 10),
(32, '2023_03_11_141017_create_options_table', 11),
(33, '2023_03_11_162452_create_afficher_table', 12),
(34, '2023_03_11_165528_create__affiche_table', 13),
(35, '2023_03_11_165910_create_post_table', 14),
(36, '2023_03_11_171428_create_posts_table', 15),
(37, '2023_03_11_172350_create_posts_table', 16),
(38, '2023_03_12_191254_create_results_table', 17),
(39, '2023_03_12_191630_create_results_table', 18),
(40, '2023_03_12_192430_create_question_result_table', 19),
(41, '2023_03_12_223652_create_results_table', 20),
(42, '2023_04_04_120336_create_tpexamination_table', 21),
(43, '2023_04_04_121943_create_tpexaminations_table', 22),
(44, '2023_04_04_130509_create_tpexaminations_table', 23),
(45, '2023_04_30_180408_create_online_classes_table', 24),
(46, '2023_04_30_194002_create_online_classes_table', 25),
(47, '2023_04_30_195354_create_online_classes_table', 26),
(48, '2014_05_19_151759_create_forum_table_categories', 27),
(49, '2014_05_19_152425_create_forum_table_threads', 27),
(50, '2014_05_19_152611_create_forum_table_posts', 27),
(51, '2015_04_14_180344_create_forum_table_threads_read', 27),
(52, '2015_07_22_181406_update_forum_table_categories', 27),
(53, '2015_07_22_181409_update_forum_table_threads', 27),
(54, '2015_07_22_181417_update_forum_table_posts', 27),
(55, '2016_05_24_114302_add_defaults_to_forum_table_threads_columns', 27),
(56, '2016_07_09_111441_add_counts_to_categories_table', 27),
(57, '2016_07_09_122706_add_counts_to_threads_table', 27),
(58, '2016_07_10_134700_add_sequence_to_posts_table', 27),
(59, '2018_11_04_211718_update_categories_table', 27),
(60, '2019_09_07_210904_update_forum_category_booleans', 27),
(61, '2019_09_07_230148_add_color_to_categories', 27),
(62, '2020_03_22_050710_add_thread_ids_to_categories', 27),
(63, '2020_03_22_055827_add_post_id_to_threads', 27),
(64, '2020_12_02_233754_add_first_post_id_to_threads', 27),
(65, '2021_07_31_094750_add_fk_indices', 27);

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
-- Structure de la table `online_classes`
--

CREATE TABLE `online_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ue_id` int(11) NOT NULL,
  `meeting_id` varchar(255) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `start_at` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'minutes',
  `password` varchar(255) NOT NULL COMMENT 'meeting password',
  `start_url` text NOT NULL,
  `join_url` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `online_classes`
--

INSERT INTO `online_classes` (`id`, `uuid`, `user_id`, `ue_id`, `meeting_id`, `topic`, `start_at`, `duration`, `password`, `start_url`, `join_url`, `created_at`, `updated_at`) VALUES
(16, '2cedbd25-2f03-4eac-8024-1b0642d9f29c', 4, 2, '82268947993', 'cour111', '1689131340', 60, 'Zcjgc2', 'https://us05web.zoom.us/s/82268947993?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJhdWQiOiJjbGllbnRzbSIsInVpZCI6Ink0djZQcC1BUVZlV24yZmQ3Q09JNWciLCJpc3MiOiJ3ZWIiLCJzayI6IjAiLCJzdHkiOjEsIndjZCI6InVzMDUiLCJjbHQiOjAsIm1udW0iOiI4MjI2ODk0Nzk5MyIsImV4cCI6MTY4OTE2NzI3MiwiaWF0IjoxNjg5MTYwMDcyLCJhaWQiOiJZZFREZ0ZrVVJZZWg3TGpjWlZNNG9RIiwiY2lkIjoiIn0.PCzM9Nd3vxFb4y5SK2tMNbKPwL-Wg1ERAEeGKJkUU7M', 'https://us05web.zoom.us/j/82268947993?pwd=cHhuZDE5aGl3b3hQQUhWZTVjQlJoZz09', '2023-07-12 09:07:51', '2023-07-12 09:07:51');

-- --------------------------------------------------------

--
-- Structure de la table `options`
--

CREATE TABLE `options` (
  `id` int(255) NOT NULL,
  `question_id` int(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `question` varchar(255) NOT NULL,
  `option_text` varchar(255) NOT NULL,
  `points` int(255) NOT NULL,
  `type_exam` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `options`
--

INSERT INTO `options` (`id`, `question_id`, `code`, `question`, `option_text`, `points`, `type_exam`, `created_at`, `updated_at`) VALUES
(1, 1, 'ict313', '1. Le digital forensic peut être défini comme :', 'a) une méthode d’analyse de support numérique', 0, 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(2, 1, 'ict313', '1. Le digital forensic peut être défini comme :', 'b) un domaine permettant de mener des investigations et des analyses sur des supports numériques', 2, 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(3, 1, 'ict313', '1. Le digital forensic peut être défini comme :', 'c) un moyen de comprendre une attaque informatique', 0, 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(4, 2, 'ict313', '2. On m’annonce qu’un ordinateur a été victime d’une attaque informatique. Il est encore allumé et utilisable, mais un malware demande une rançon à l’utilisateur. Que dois-je faire ?', 'a) Éteindre l’ordinateur, le rallumer et consulter l’historique de navigation pour savoir ce qu’il s’est passé', 0, 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(5, 2, 'ict313', '2. On m’annonce qu’un ordinateur a été victime d’une attaque informatique. Il est encore allumé et utilisable, mais un malware demande une rançon à l’utilisateur. Que dois-je faire ?', 'b) Copier le contenu de la RAM avant d’éteindre l’ordinateur afin d’éviter que les données soient perdues', 2, 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(6, 2, 'ict313', '2. On m’annonce qu’un ordinateur a été victime d’une attaque informatique. Il est encore allumé et utilisable, mais un malware demande une rançon à l’utilisateur. Que dois-je faire ?', 'c) Copier le contenu de la RAM et du disque dur afin de mener mon enquête sans perdre aucune donnée', 0, 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(7, 3, 'ict313', '3. Parmi les supports suivants, lesquels correspondent à de la mémoire non volatile ?', 'a) La mémoire RAM', 2, 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(8, 3, 'ict313', '3. Parmi les supports suivants, lesquels correspondent à de la mémoire non volatile ?', 'b) Un disque dur', 0, 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(9, 3, 'ict313', '3. Parmi les supports suivants, lesquels correspondent à de la mémoire non volatile ?', 'c) Une clé USB', 0, 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(10, 3, 'ict313', '3. Parmi les supports suivants, lesquels correspondent à de la mémoire non volatile ?', 'd) Un CD-ROM', 0, 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(11, 4, 'ict313', '3. Dans la sécurité informatique, _______ signifie que les systèmes actifs informatique ne peuvent être modifiés que par les personnes autorisées.', 'a) La confidentialité', 0, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(12, 4, 'ict313', '3. Dans la sécurité informatique, _______ signifie que les systèmes actifs informatique ne peuvent être modifiés que par les personnes autorisées.', 'b) L’intégrité', 2, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(13, 4, 'ict313', '3. Dans la sécurité informatique, _______ signifie que les systèmes actifs informatique ne peuvent être modifiés que par les personnes autorisées.', 'c) La disponibilité', 0, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(14, 4, 'ict313', '3. Dans la sécurité informatique, _______ signifie que les systèmes actifs informatique ne peuvent être modifiés que par les personnes autorisées.', 'd) L’authenticité', 0, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(15, 5, 'ict313', '4. Dans la sécurité informatique, _______ signifie que les informations contenues dans un système informatique ne sont accessibles en lecture que par les personnes autorisées.', 'a) La confidentialité', 2, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(16, 5, 'ict313', '4. Dans la sécurité informatique, _______ signifie que les informations contenues dans un système informatique ne sont accessibles en lecture que par les personnes autorisées.', 'b) L’intégrité', 0, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(17, 5, 'ict313', '4. Dans la sécurité informatique, _______ signifie que les informations contenues dans un système informatique ne sont accessibles en lecture que par les personnes autorisées.', 'c) La disponibilité', 0, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(18, 5, 'ict313', '4. Dans la sécurité informatique, _______ signifie que les informations contenues dans un système informatique ne sont accessibles en lecture que par les personnes autorisées.', 'd) L’authenticité', 0, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(19, 6, 'ict313', '5. Indiquer si l’expression suivant est vrai ou faux :', 'a) Vrai', 2, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(20, 6, 'ict313', '5. Indiquer si l’expression suivant est vrai ou faux :', 'b) Faux', 0, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(21, 7, 'ict313', '6. Lequel des programmes suivants est un programme malveillant indépendant qui ne nécessite aucun d’autre programme?', 'a) Porte à piège', 0, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(22, 7, 'ict313', '6. Lequel des programmes suivants est un programme malveillant indépendant qui ne nécessite aucun d’autre programme?', 'b) Cheval de Troie', 0, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(23, 7, 'ict313', '6. Lequel des programmes suivants est un programme malveillant indépendant qui ne nécessite aucun d’autre programme?', 'c) Virus', 0, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(24, 7, 'ict313', '6. Lequel des programmes suivants est un programme malveillant indépendant qui ne nécessite aucun d’autre programme?', 'd) Ver', 2, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(25, 8, 'ict313', '7. Le _______ est un code qui reconnaît une séquence d’entrée spéciale ou qui est déclenché par une séquence d’événements improbable.', 'a) Porte à piège', 2, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(26, 8, 'ict313', '7. Le _______ est un code qui reconnaît une séquence d’entrée spéciale ou qui est déclenché par une séquence d’événements improbable.', 'b) Cheval de Troie', 0, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(27, 8, 'ict313', '7. Le _______ est un code qui reconnaît une séquence d’entrée spéciale ou qui est déclenché par une séquence d’événements improbable.', 'c) Virus', 0, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(28, 8, 'ict313', '7. Le _______ est un code qui reconnaît une séquence d’entrée spéciale ou qui est déclenché par une séquence d’événements improbable.', 'd) Bombe logique', 0, 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(29, 9, 'ict313', '6. Lequel des programmes suivants est un programme malveillant indépendant qui ne nécessite aucun d’autre programme?', 'a) Porte à piège', 0, 'cc', '2023-07-24 05:09:26', '2023-07-24 05:09:26'),
(30, 9, 'ict313', '6. Lequel des programmes suivants est un programme malveillant indépendant qui ne nécessite aucun d’autre programme?', 'b) Cheval de Troie', 0, 'cc', '2023-07-24 05:09:26', '2023-07-24 05:09:26'),
(31, 9, 'ict313', '6. Lequel des programmes suivants est un programme malveillant indépendant qui ne nécessite aucun d’autre programme?', 'c) Virus', 0, 'cc', '2023-07-24 05:09:26', '2023-07-24 05:09:26'),
(32, 9, 'ict313', '6. Lequel des programmes suivants est un programme malveillant indépendant qui ne nécessite aucun d’autre programme?', 'd) Ver', 2, 'cc', '2023-07-24 05:09:26', '2023-07-24 05:09:26'),
(33, 10, 'ict313', '7. Le _______ est un code qui reconnaît une séquence d’entrée spéciale ou qui est déclenché par une séquence d’événements improbable.', 'a) Porte à piège', 2, 'cc', '2023-07-24 05:09:26', '2023-07-24 05:09:26'),
(34, 10, 'ict313', '7. Le _______ est un code qui reconnaît une séquence d’entrée spéciale ou qui est déclenché par une séquence d’événements improbable.', 'b) Cheval de Troie', 0, 'cc', '2023-07-24 05:09:26', '2023-07-24 05:09:26'),
(35, 10, 'ict313', '7. Le _______ est un code qui reconnaît une séquence d’entrée spéciale ou qui est déclenché par une séquence d’événements improbable.', 'c) Virus', 0, 'cc', '2023-07-24 05:09:26', '2023-07-24 05:09:26'),
(36, 10, 'ict313', '7. Le _______ est un code qui reconnaît une séquence d’entrée spéciale ou qui est déclenché par une séquence d’événements improbable.', 'd) Bombe logique', 0, 'cc', '2023-07-24 05:09:26', '2023-07-24 05:09:26');

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
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `type_exam` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `question_id`, `option_id`, `code`, `type_exam`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'ict313', 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(2, 2, 0, 'ict313', 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(3, 3, 0, 'ict313', 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(4, 4, 0, 'ict313', 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(5, 5, 0, 'ict313', 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(6, 6, 0, 'ict313', 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(7, 7, 0, 'ict313', 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(8, 8, 0, 'ict313', 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(9, 9, 0, 'ict313', 'cc', '2023-07-24 05:09:26', '2023-07-24 05:09:26'),
(10, 10, 0, 'ict313', 'cc', '2023-07-24 05:09:26', '2023-07-24 05:09:26');

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `question_text` varchar(255) NOT NULL,
  `type_exam` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `questions`
--

INSERT INTO `questions` (`id`, `code`, `question_text`, `type_exam`, `created_at`, `updated_at`) VALUES
(1, 'ict313', '1. Le digital forensic peut être défini comme :', 'sn', '2023-07-24 05:07:54', '2023-07-24 05:07:54'),
(2, 'ict313', '2. On m’annonce qu’un ordinateur a été victime d’une attaque informatique. Il est encore allumé et utilisable, mais un malware demande une rançon à l’utilisateur. Que dois-je faire ?', 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(3, 'ict313', '3. Parmi les supports suivants, lesquels correspondent à de la mémoire non volatile ?', 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(4, 'ict313', '3. Dans la sécurité informatique, _______ signifie que les systèmes actifs informatique ne peuvent être modifiés que par les personnes autorisées.', 'sn', '2023-07-24 05:07:55', '2023-07-24 05:07:55'),
(5, 'ict313', '4. Dans la sécurité informatique, _______ signifie que les informations contenues dans un système informatique ne sont accessibles en lecture que par les personnes autorisées.', 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(6, 'ict313', '5. Indiquer si l’expression suivant est vrai ou faux :', 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(7, 'ict313', '6. Lequel des programmes suivants est un programme malveillant indépendant qui ne nécessite aucun d’autre programme?', 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(8, 'ict313', '7. Le _______ est un code qui reconnaît une séquence d’entrée spéciale ou qui est déclenché par une séquence d’événements improbable.', 'sn', '2023-07-24 05:07:56', '2023-07-24 05:07:56'),
(9, 'ict313', '6. Lequel des programmes suivants est un programme malveillant indépendant qui ne nécessite aucun d’autre programme?', 'cc', '2023-07-24 05:09:26', '2023-07-24 05:09:26'),
(10, 'ict313', '7. Le _______ est un code qui reconnaît une séquence d’entrée spéciale ou qui est déclenché par une séquence d’événements improbable.', 'cc', '2023-07-24 05:09:26', '2023-07-24 05:09:26');

-- --------------------------------------------------------

--
-- Structure de la table `question_result`
--

CREATE TABLE `question_result` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `result_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `question_result`
--

INSERT INTO `question_result` (`id`, `result_id`, `question_id`, `option_id`, `points`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 2, NULL, NULL),
(2, 1, 2, 6, 0, NULL, NULL),
(3, 1, 3, 7, 2, NULL, NULL),
(4, 1, 4, 11, 0, NULL, NULL),
(5, 1, 5, 16, 0, NULL, NULL),
(6, 1, 6, 19, 2, NULL, NULL),
(7, 1, 7, 24, 2, NULL, NULL),
(8, 1, 8, 25, 2, NULL, NULL),
(9, 2, 9, 32, 2, NULL, NULL),
(10, 2, 10, 33, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `results`
--

CREATE TABLE `results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `total_points` int(11) DEFAULT NULL,
  `type_exam` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `results`
--

INSERT INTO `results` (`id`, `user_id`, `code`, `total_points`, `type_exam`, `created_at`, `updated_at`) VALUES
(1, 1, 'ict313', 10, 'sn', '2023-07-24 07:17:29', '2023-07-24 07:17:29'),
(2, 1, 'ict313', 4, 'cc', '2023-07-24 07:18:40', '2023-07-24 07:18:40');

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
(8, 'Ing', 'Njine Chuangueu', 'Lecturer', 11, '2022-07-13 19:19:41', '2022-07-13 19:19:41');

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
-- Structure de la table `tpexaminations`
--

CREATE TABLE `tpexaminations` (
  `id` int(255) NOT NULL,
  `document` varchar(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `note_tp` int(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tpexaminations`
--

INSERT INTO `tpexaminations` (`id`, `document`, `user_id`, `code`, `note_tp`, `created_at`, `updated_at`) VALUES
(1, 'tp302.rar', 1, 'ict314', 12, '2023-07-24 02:48:34', '2023-07-24 00:48:34'),
(2, 'tp302.rar', 1, 'ict313', 14, '2023-07-24 09:58:26', '2023-07-24 09:58:26');

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
(6, 'test', 'test1', 'test@gmail.com', NULL, '$2y$10$HY/2pV3wB3bCG0FO9H/ZzeDJCXXXKWZ4bbBhOwcHptL9vYQnGAGx2', '1996-01-12', 'yaounde', '0', 'avatar.png', NULL, NULL, NULL, '2023-01-12 09:09:26', '2023-01-12 09:09:26'),
(7, 'frida', 'test', 'frida@gmail.com', NULL, '$2y$10$0A5LXn7WLYON2gvkHmkCt.5mXuUGShC7wtRr4KSxMPq5d3RJvEk.G', '2023-05-05', 'yaounde', '0', 'avatar.png', NULL, NULL, NULL, '2023-05-05 12:35:41', '2023-05-05 12:35:41');

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
-- Index pour la table `forum_categories`
--
ALTER TABLE `forum_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Index pour la table `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_posts_thread_id_index` (`thread_id`);

--
-- Index pour la table `forum_threads`
--
ALTER TABLE `forum_threads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_threads_category_id_index` (`category_id`);

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
-- Index pour la table `online_classes`
--
ALTER TABLE `online_classes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `options`
--
ALTER TABLE `options`
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
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `question_result`
--
ALTER TABLE `question_result`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

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
-- Index pour la table `tpexaminations`
--
ALTER TABLE `tpexaminations`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- AUTO_INCREMENT pour la table `forum_categories`
--
ALTER TABLE `forum_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `forum_posts`
--
ALTER TABLE `forum_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `forum_threads`
--
ALTER TABLE `forum_threads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `level_user`
--
ALTER TABLE `level_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `lives`
--
ALTER TABLE `lives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `live_user`
--
ALTER TABLE `live_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT pour la table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `online_classes`
--
ALTER TABLE `online_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `question_result`
--
ALTER TABLE `question_result`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `results`
--
ALTER TABLE `results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT pour la table `tpexaminations`
--
ALTER TABLE `tpexaminations`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
