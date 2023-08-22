-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jun 2023 pada 15.14
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `a6a6`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activities`
--

CREATE TABLE `activities` (
  `id` char(36) NOT NULL,
  `topic_id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `activities`
--

INSERT INTO `activities` (`id`, `topic_id`, `name`, `description`, `status`, `type`, `created_at`, `updated_at`, `experience`, `time`) VALUES
('1afd2d4e-a8ee-4304-8710-986fe3b88f4b', '6e312695-0270-3f1b-a362-f975fd9aa811', 'ulangan mingguan', '-', 'PUBLISHED', 'EXAM', '2023-06-22 14:01:31', '2023-06-22 14:08:46', NULL, NULL),
('ba3d73c1-de0f-4f19-a63c-93b6ce3b4800', '385cfaba-1f74-41b9-8af6-869affa83fc3', 'ujian mingguan', '-', 'DRAFT', 'EXAM', '2023-06-23 06:48:25', '2023-06-23 06:48:25', NULL, NULL),
('bbd1010b-8a6c-4261-86e5-a0f2a10a4f16', '1385bbe0-b275-3d52-aca1-b5c504f7d861', 'ujian sastra sunda', '-', 'DRAFT', 'EXAM', '2023-06-22 21:04:05', '2023-06-22 21:04:05', NULL, NULL),
('c08ebb84-d720-4409-811d-bd0a47895141', '6088c48f-2afc-4bf1-aecc-34d2fcf79c07', 'ujian aksara sunda', '-', 'PUBLISHED', 'EXAM', '2023-06-22 20:56:03', '2023-06-22 20:57:16', NULL, NULL),
('d5e9bc62-77e2-4b95-9bfa-d86541b0765b', '6e312695-0270-3f1b-a362-f975fd9aa811', 'latihan mingguna', '-', 'DRAFT', 'EXERCISE', '2023-06-22 14:01:21', '2023-06-22 14:01:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity_results`
--

CREATE TABLE `activity_results` (
  `id` char(36) NOT NULL,
  `activity_id` char(36) NOT NULL,
  `student_id` char(36) NOT NULL,
  `score` int(11) NOT NULL,
  `answers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`answers`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `contents`
--

CREATE TABLE `contents` (
  `id` char(36) NOT NULL,
  `topic_id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `estimation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `contents`
--

INSERT INTO `contents` (`id`, `topic_id`, `name`, `content`, `status`, `created_at`, `updated_at`, `experience`, `estimation`) VALUES
('a45dea26-bb99-4f65-8ae1-fb974ab7cdf2', '6e312695-0270-3f1b-a362-f975fd9aa811', 'pembahasan aa', NULL, 'DRAFT', '2023-06-22 14:09:21', '2023-06-22 14:09:21', 25, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `content_result`
--

CREATE TABLE `content_result` (
  `id` char(36) NOT NULL,
  `content_id` char(36) NOT NULL,
  `student_id` char(36) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `courses`
--

CREATE TABLE `courses` (
  `id` char(36) NOT NULL,
  `description` varchar(255) NOT NULL,
  `subject_id` char(36) NOT NULL,
  `created_by` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `grade` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `courses`
--

INSERT INTO `courses` (`id`, `description`, `subject_id`, `created_by`, `created_at`, `updated_at`, `grade`) VALUES
('00153d03-0571-3aed-a210-8c6ab0aadb51', 'IT', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', '0de19d3a-b271-3305-8e75-c31ab5bc68e8', '2023-06-22 20:40:35', '2023-06-22 20:40:35', 12),
('0162d552-cc48-392e-99b2-0bc0c8218fb8', 'Umum', '2976f6dd-1861-39f0-88e4-9612b65b20ee', '0de19d3a-b271-3305-8e75-c31ab5bc68e8', '2023-06-22 20:40:35', '2023-06-22 20:40:35', 11),
('0887448c-3d80-33ad-abbd-719b8a2bd426', 'Bisnis', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'd5a23f56-6f39-3ba5-b083-dec17ce5e159', '2023-06-22 13:56:44', '2023-06-22 13:56:44', 12),
('0bd0b875-9e44-31d1-b39a-44751b89a047', 'Bisnis', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'c1fb4911-3eeb-3549-a973-ea338138ca7b', '2023-06-22 19:08:49', '2023-06-22 19:08:49', 12),
('181516e2-0292-354a-bd23-512b20390270', 'IT', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'd5a23f56-6f39-3ba5-b083-dec17ce5e159', '2023-06-22 13:56:44', '2023-06-22 13:56:44', 12),
('1a746f65-f8a0-3129-a444-4aaed05269b2', 'Bisnis', '34745c58-1686-3348-96f6-c49b05c4c392', '', '2023-06-22 19:07:26', '2023-06-22 19:07:26', 11),
('29c7939f-8e96-340d-ba91-2e3cd80cfb05', 'IT', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', '', '2023-06-22 19:07:26', '2023-06-22 19:07:26', 12),
('2b9a77dd-df61-36c4-8315-4ac465529c1b', 'Umum', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', '935f3a04-2bb0-30e0-aef5-ace4185fbf5e', '2023-06-22 18:25:14', '2023-06-22 18:25:14', 12),
('2f7d16d6-93a6-3c93-ac2e-a1418eaa8d3d', 'Bisnis', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'e2d8eeae-3a7f-3fc2-8438-c362a7dead03', '2023-06-22 14:26:41', '2023-06-22 14:26:41', 11),
('3001194c-d665-3e70-937b-224484a9e4c5', 'Bisnis', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'd5a23f56-6f39-3ba5-b083-dec17ce5e159', '2023-06-22 13:56:44', '2023-06-22 13:56:44', 11),
('34364da3-83f2-3ee4-a207-7c296aeaec67', 'Umum', '0fc8d020-a840-352f-aace-5b4983de575f', '0de19d3a-b271-3305-8e75-c31ab5bc68e8', '2023-06-22 20:40:35', '2023-06-22 20:40:35', 11),
('36dc1134-3395-3ec9-809c-6a2d36d1fb1c', 'Bisnis', '909d7805-eb8c-333b-bd58-efd9967bf307', '68c3f461-d913-38f9-bd21-6a3ce41926b3', '2023-06-22 20:43:25', '2023-06-22 20:43:25', 11),
('5bb03ed8-00d0-30d6-b726-c69d267feb0b', 'Umum', 'f177c473-4f6a-347b-89a1-182518bceef1', 'c1fb4911-3eeb-3549-a973-ea338138ca7b', '2023-06-22 19:08:49', '2023-06-22 19:08:49', 11),
('5d83fc4f-e1de-3de4-a951-26fd0bb30f7d', 'IT', '277381c6-e45a-332b-b680-432db961876e', 'e2d8eeae-3a7f-3fc2-8438-c362a7dead03', '2023-06-22 14:26:41', '2023-06-22 14:26:41', 12),
('5da1ef8d-4fd1-396c-9f41-6f2ddb0ed4e6', 'IT', '34745c58-1686-3348-96f6-c49b05c4c392', '', '2023-06-22 19:07:26', '2023-06-22 19:07:26', 12),
('6371610f-c154-370d-b867-c418aa087c76', 'IT', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'c1fb4911-3eeb-3549-a973-ea338138ca7b', '2023-06-22 19:08:49', '2023-06-22 19:08:49', 11),
('65bd514e-ad73-3d4d-a67b-d34d7ca1d5ae', 'Umum', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', '935f3a04-2bb0-30e0-aef5-ace4185fbf5e', '2023-06-22 18:25:14', '2023-06-22 18:25:14', 11),
('671f6a60-4860-303f-a489-4f23b850ccef', 'IT', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'c1fb4911-3eeb-3549-a973-ea338138ca7b', '2023-06-22 19:08:49', '2023-06-22 19:08:49', 11),
('6a124efb-6fcd-359a-9ce4-7ad3bccd4b1b', 'Umum', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', '68c3f461-d913-38f9-bd21-6a3ce41926b3', '2023-06-22 20:43:25', '2023-06-22 20:43:25', 11),
('6bc7a4f3-0dfa-3364-8285-8993011acf9d', 'Bisnis', 'e444c454-8759-3168-80d8-094f64b24efa', '54d425e7-0511-3fe6-b10c-398620af67fa', '2023-06-22 13:40:24', '2023-06-22 13:40:24', 12),
('70024b6c-198b-3cc5-90d5-3bb70a3d1662', 'Bisnis', '4a8b7386-1053-3817-85ef-2ef72b0405f7', '935f3a04-2bb0-30e0-aef5-ace4185fbf5e', '2023-06-22 18:25:14', '2023-06-22 18:25:14', 11),
('7780f041-36f9-37c7-ac6d-bd0d56d0ae60', 'IT', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', '0de19d3a-b271-3305-8e75-c31ab5bc68e8', '2023-06-22 20:40:35', '2023-06-22 20:40:35', 11),
('80c7fbd5-c396-38da-af7f-9248b36f96f9', 'Umum', '4a8b7386-1053-3817-85ef-2ef72b0405f7', '935f3a04-2bb0-30e0-aef5-ace4185fbf5e', '2023-06-22 18:25:14', '2023-06-22 18:25:14', 12),
('81632086-6739-38cf-8af8-b436acdcdf78', 'Bisnis', '277381c6-e45a-332b-b680-432db961876e', 'e2d8eeae-3a7f-3fc2-8438-c362a7dead03', '2023-06-22 14:26:41', '2023-06-22 14:26:41', 11),
('924e0c9c-cf55-36bd-85fc-f631112c060a', 'IT', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', '68c3f461-d913-38f9-bd21-6a3ce41926b3', '2023-06-22 20:43:25', '2023-06-22 20:43:25', 12),
('94383d63-959f-3922-9645-e7fb36f3e2d8', 'Umum', 'e444c454-8759-3168-80d8-094f64b24efa', '54d425e7-0511-3fe6-b10c-398620af67fa', '2023-06-22 13:40:24', '2023-06-22 13:40:24', 11),
('94ab2abe-84ca-3c65-a628-7a3ebb2e8613', 'IT', '0efb3e24-701b-35f6-aae8-c926ff532f73', '68c3f461-d913-38f9-bd21-6a3ce41926b3', '2023-06-22 20:43:25', '2023-06-22 20:43:25', 12),
('96e637e5-773b-39f7-bbdc-8721228fe987', 'Bisnis', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'e2d8eeae-3a7f-3fc2-8438-c362a7dead03', '2023-06-22 14:26:41', '2023-06-22 14:26:41', 12),
('9bd97676-2d6e-31c1-95b5-f21a097cc3df', 'IT', '0efb3e24-701b-35f6-aae8-c926ff532f73', '68c3f461-d913-38f9-bd21-6a3ce41926b3', '2023-06-22 20:43:25', '2023-06-22 20:43:25', 11),
('a1259090-9088-3620-9328-19c20f220ab5', 'IT', 'c4b24553-92b8-389e-91c0-7efe80ea3762', '', '2023-06-22 19:07:26', '2023-06-22 19:07:26', 11),
('a12c4c3c-30a3-3644-80e1-445f4dac1f1f', 'Bisnis', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', '54d425e7-0511-3fe6-b10c-398620af67fa', '2023-06-22 13:40:24', '2023-06-22 13:40:24', 12),
('a2238f78-5284-3c51-8ff6-0ddb7ab05f3f', 'IT', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', '935f3a04-2bb0-30e0-aef5-ace4185fbf5e', '2023-06-22 18:25:14', '2023-06-22 18:25:14', 11),
('a46c4225-5fef-32b4-9dfc-35457033d6d4', 'IT', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'd5a23f56-6f39-3ba5-b083-dec17ce5e159', '2023-06-22 13:56:44', '2023-06-22 13:56:44', 11),
('a4810048-be60-31da-89de-78fe741fbdfb', 'Umum', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', '', '2023-06-22 19:07:26', '2023-06-22 19:07:26', 11),
('ac1d534f-0bf5-37ad-b33a-3d4fd370d257', 'Bisnis', 'daf26725-556c-364f-b08a-e36b7dabbd92', '54d425e7-0511-3fe6-b10c-398620af67fa', '2023-06-22 13:40:24', '2023-06-22 13:40:24', 12),
('adb68089-b50d-3f91-ab71-a8d3929cafd4', 'IT', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'c1fb4911-3eeb-3549-a973-ea338138ca7b', '2023-06-22 19:08:49', '2023-06-22 19:08:49', 12),
('b4160579-9eb8-3e15-b5ba-67b0264fe9f1', 'IT', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', '54d425e7-0511-3fe6-b10c-398620af67fa', '2023-06-22 13:40:24', '2023-06-22 13:40:24', 11),
('badc3c32-3a7b-3409-ad5b-d7f9c67b72f6', 'IT', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', '935f3a04-2bb0-30e0-aef5-ace4185fbf5e', '2023-06-22 18:25:14', '2023-06-22 18:25:14', 12),
('d5d0f32a-37e3-39e3-88fd-6f048c693a1b', 'Umum', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'e2d8eeae-3a7f-3fc2-8438-c362a7dead03', '2023-06-22 14:26:41', '2023-06-22 14:26:41', 11),
('da17d3ff-5ba7-3229-88be-ac766491fccf', 'Umum', '909d7805-eb8c-333b-bd58-efd9967bf307', '68c3f461-d913-38f9-bd21-6a3ce41926b3', '2023-06-22 20:43:25', '2023-06-22 20:43:25', 12),
('de86e3c4-8677-42ee-ae00-cf5d75731c3e', 'materi pemahaman bahasa inggris', '890565fb-fd2c-45d3-869e-01521b79cbba', '68c3f461-d913-38f9-bd21-6a3ce41926b3', '2023-06-23 06:46:48', '2023-06-23 06:46:48', 3),
('e061e933-8a8e-36c6-8bc1-1e72d08ea8c9', 'Bisnis', '0fc8d020-a840-352f-aace-5b4983de575f', '0de19d3a-b271-3305-8e75-c31ab5bc68e8', '2023-06-22 20:40:35', '2023-06-22 20:40:35', 12),
('e1228b2f-63d4-3cae-af07-5e4d5a6cab0c', 'IT', 'c4b24553-92b8-389e-91c0-7efe80ea3762', '', '2023-06-22 19:07:26', '2023-06-22 19:07:26', 12),
('e3e3449a-6c9b-3c5e-9c3b-582a26cd3edc', 'Umum', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'd5a23f56-6f39-3ba5-b083-dec17ce5e159', '2023-06-22 13:56:44', '2023-06-22 13:56:44', 11),
('e647cdb0-b15f-3b99-be32-94aaad448636', 'Bisnis', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'e2d8eeae-3a7f-3fc2-8438-c362a7dead03', '2023-06-22 14:26:41', '2023-06-22 14:26:41', 12),
('ebf5a801-74d1-3e0a-a6ee-b9e0078180f7', 'IT', '2976f6dd-1861-39f0-88e4-9612b65b20ee', '0de19d3a-b271-3305-8e75-c31ab5bc68e8', '2023-06-22 20:40:35', '2023-06-22 20:40:35', 12),
('f8ae75e0-e4c9-378a-979f-2c003d4ad2be', 'IT', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'd5a23f56-6f39-3ba5-b083-dec17ce5e159', '2023-06-22 13:56:44', '2023-06-22 13:56:44', 12),
('f8f9374a-1e9d-3c99-80e5-9b66c400a3d4', 'Bisnis', 'daf26725-556c-364f-b08a-e36b7dabbd92', '54d425e7-0511-3fe6-b10c-398620af67fa', '2023-06-22 13:40:24', '2023-06-22 13:40:24', 11),
('fb7b5286-8ba9-3597-9bee-b3d313871e10', 'Umum', 'f177c473-4f6a-347b-89a1-182518bceef1', 'c1fb4911-3eeb-3549-a973-ea338138ca7b', '2023-06-22 19:08:49', '2023-06-22 19:08:49', 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `experiences`
--

CREATE TABLE `experiences` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `experience_point` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `school_id` char(36) NOT NULL,
  `grade` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `experiences`
--

INSERT INTO `experiences` (`id`, `user_id`, `experience_point`, `level`, `created_at`, `updated_at`, `school_id`, `grade`) VALUES
('01014921-5117-4013-be17-68a5cd45c8e1', 'f8f77fd5-b777-3a12-8a89-3258f8ad14b3', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('019051f9-ff85-4bd7-8f1c-17f3a5913a2c', 'ea9f5027-8266-35d9-bf24-16a7acd8cafc', 0, 0, NULL, NULL, '688ca62a-6641-3a48-83c6-3d324ea03358', 12),
('0391df46-5017-48ec-9196-d782554ce5ec', 'c9e77f4c-0b3d-3c01-8b60-5a541c7ba4f4', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('06fc265a-2026-46d1-a3af-cba6d47181b5', '2ddd7d8f-315b-346b-8189-c0b6fa42fac8', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('0edc8908-ee71-4d41-aa65-813009e455dd', '6a9ae9bb-1843-386d-8447-9593f7c3e49b', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('120c9ba9-ebd0-477b-8dee-31481bdd922b', '71350f07-03a6-376d-af85-f7b4a39d85d2', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('1729d9de-e7b4-4c23-9265-b97ffc4bb932', '2d369664-4db2-3df0-b961-1dd4fb464c22', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('4285a6cf-2a9e-4c84-9a37-ab0bf56d21c4', 'eb42b89a-b679-38f6-b650-0c0104c0831d', 0, 0, NULL, NULL, '59abf485-5cd5-3034-b2e2-5530d0d9440f', 12),
('45560082-507f-454d-8bf9-6dad947170f2', 'e5bcebe3-298d-30bc-b97f-037df8a9e99a', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('53536af6-4ee8-4e1e-9ce2-6bd98d97cd3f', '9a17ea84-9ac9-3e08-b779-20f040ca9f11', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('5c8a9196-562b-499d-97ca-ef0cefa72e6e', '7f10b907-ce62-32c7-a204-8c171293fce0', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('6427890b-fe95-4c97-a495-7155c1217c2a', '875a18fb-8353-3b08-9f8c-96bf1f277a8b', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('6df08b75-8696-4354-bec5-3b7e7cc80c31', 'f12e53c5-abac-3583-9b19-d5104ce2bc38', 0, 0, NULL, NULL, '688ca62a-6641-3a48-83c6-3d324ea03358', 12),
('722d7efb-3d07-4c6e-ab93-978022c51324', '23bbe3bc-9f81-3f8b-9784-d6dfe9eb26bb', 0, 0, NULL, NULL, '688ca62a-6641-3a48-83c6-3d324ea03358', 12),
('75cc245f-9deb-438a-a9d2-7dee05e606bf', 'e1b76442-2c84-3d7b-addf-dc9ca71b8fae', 0, 0, NULL, NULL, '688ca62a-6641-3a48-83c6-3d324ea03358', 12),
('781793ec-b8be-450b-844a-73eb3cf7dffc', '7647de6e-9442-3646-971e-c9b28c36192d', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('78f883f1-c30c-4141-b4fe-bcaf1042375b', 'bd16390c-52fe-3fd2-a515-f6ed83260363', 0, 0, NULL, NULL, '688ca62a-6641-3a48-83c6-3d324ea03358', 12),
('8bbc357c-977f-4d6d-8864-12d034bdb7a7', '8ad8970e-e421-3592-805d-a56546e63add', 0, 0, NULL, NULL, '18006a3d-1761-343d-8800-f02e99ec6937', 12),
('8d973688-e291-40bf-9e98-fcef7f722ac1', '74352803-5b1b-358d-b612-dccbf0e31364', 0, 0, NULL, NULL, '688ca62a-6641-3a48-83c6-3d324ea03358', 12),
('93886a15-1572-4233-bc9b-c1701b0be8f7', 'f0a9590e-3ef7-3988-94bd-7ad54aa4f3e6', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('94319f10-95c1-4a91-ad7d-cff9fa49a12c', '63bbc294-26de-3235-b031-1cb400f77843', 0, 0, NULL, NULL, '337796b9-1104-3957-8b0f-0174c8c12141', 12),
('9558ebab-d6af-4143-b986-a1b5b5e3469c', '1ab3c736-6598-331c-b981-442a7a0d6928', 0, 0, NULL, NULL, '688ca62a-6641-3a48-83c6-3d324ea03358', 12),
('96af8d5f-4fe1-43f6-9f13-3d0581cf0da6', 'ee3334cc-b081-3c98-a271-c136c9cdb367', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('976da946-70b7-4a72-bfa1-fa1c2eba3904', '44dc2b4d-1709-3e9d-96e0-de24fbf3054b', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('9e96cdcd-bbb6-42a4-963b-a853170a14ec', '42ad8133-3b89-3fcc-b6d1-d0bd6ac9f2bc', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('9eb4cc1f-b0d9-4ad0-87ce-ff12012f6997', '0d1181cf-6b6b-3eee-b1be-41b199509755', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('a708cf48-e7a0-45f7-80f9-265d9a4c1ec5', '6aa0d0b7-7a7e-365b-8497-f1556bef7eaf', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('aafb5abc-c1a3-4da7-837a-b8d6878893c3', 'a2d5ee79-e7fd-32d7-b620-20d1862999bd', 0, 0, NULL, NULL, 'bd5fcee2-27a0-37d9-b4ae-62c06e5ad4e3', 12),
('b0f497f5-5c7f-40d8-864b-b10d009748cc', 'ab3ee513-0fe5-3bee-b1c9-f1ba1fab87c0', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('b4b85ec1-5506-430c-829e-76f14c0ca43b', 'e38bb5ef-0e5d-37af-9f38-089cda29f72b', 0, 0, NULL, NULL, '688ca62a-6641-3a48-83c6-3d324ea03358', 12),
('b5b8553d-c604-42c0-b266-0d706de6d029', '264fb2fa-0a24-3450-9878-92a684e40ca9', 0, 0, NULL, NULL, 'f8635cda-4071-3d00-aa3b-efd9c31e1220', 12),
('b8327648-dd46-4588-8b93-019a0b303b0e', 'ab63b80f-4d8c-3e28-86b9-c521478801d2', 0, 0, NULL, NULL, '688ca62a-6641-3a48-83c6-3d324ea03358', 12),
('c32100d5-4090-477b-8d62-3dcae91c10e0', 'de773262-f996-3f06-9f96-75502051f3ed', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('c3b24d92-bddd-43da-9bfa-c2fbfbdcf8ed', '6724c74f-d9e5-4150-95ec-47ea26e94bd5', 0, 0, '2023-06-22 14:30:15', '2023-06-22 14:30:15', '337796b9-1104-3957-8b0f-0174c8c12141', 1),
('d1781ee8-a68d-444b-938a-1524e09a210e', 'd61bc198-52b6-3793-a99d-b28bfed369ed', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('d3aa1bf4-2e94-4040-a9c5-1503527e4a38', 'e620e18e-194f-3905-acef-408a952c4d8c', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('dc08a552-8276-44c2-9811-d2d146a34404', '459b90d1-5661-3dd2-8157-cbafa2dcdbcb', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('e8607ae2-075a-4f79-a4cc-14a6a9a1b627', '3a316d78-af64-33ae-b8ad-5084f6da6d10', 0, 0, NULL, NULL, '688ca62a-6641-3a48-83c6-3d324ea03358', 12),
('e8aa9110-37a6-4aa4-9aab-0efcfec7fbd2', 'e90031cd-6d01-3cf2-8373-243b81c735c6', 0, 0, NULL, NULL, 'bf6779e2-14d4-3ee9-9f1c-a6217ec7ad7e', 12),
('ee08ad71-6fdc-4afc-8dff-c49dbd7d2adc', 'f0d5c13d-6fcc-359e-8e2c-a8c1905e5ef7', 0, 0, NULL, NULL, 'ed13ac88-2b38-39c6-9d9e-72c7918a764e', 12),
('fedc8dce-c849-412d-8ad1-db01de09b632', '794cd935-d86a-3175-bd17-fac46f65e66b', 0, 0, NULL, NULL, 'bbb376ea-8481-34b5-b14e-75fdbf805fe1', 12);

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
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2021_11_25_041339_create_schools_table', 1),
(3, '2021_11_25_041419_create_users_table', 1),
(4, '2021_11_25_041430_create_subjects_table', 1),
(5, '2021_11_25_041443_create_subject_teachers_table', 1),
(6, '2021_11_28_115639_create_courses_table', 1),
(7, '2021_11_28_120315_create_topics_table', 1),
(8, '2021_11_28_120559_create_contents_table', 1),
(9, '2021_11_28_120733_create_activities_table', 1),
(10, '2021_11_28_120852_create_questions_table', 1),
(11, '2021_11_29_122433_alter_users_table', 1),
(12, '2021_11_29_122444_alter_courses_table', 1),
(13, '2021_12_03_034446_create_content_result_table', 1),
(14, '2021_12_03_034924_create_activity_results_table', 1),
(15, '2021_12_04_032623_alter_activities_table', 1),
(16, '2021_12_05_022829_create_experiences_table', 1),
(17, '2021_12_05_022928_alter_contents_table', 1),
(18, '2021_12_05_023022_add_xp_to_activities', 1),
(19, '2021_12_05_030327_alter_content_table_make_content_nullable', 1),
(20, '2021_12_08_015846_create_notif_table', 1),
(21, '2021_12_09_122628_add_school_id_to_experiences', 1),
(22, '2021_12_11_042754_add_is_send_to_notif', 1),
(23, '2021_12_11_133705_alter_table_questions', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notif`
--

CREATE TABLE `notif` (
  `student_id` char(36) NOT NULL,
  `teacher_id` char(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_send` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
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
-- Struktur dari tabel `questions`
--

CREATE TABLE `questions` (
  `id` char(36) NOT NULL,
  `activity_id` char(36) NOT NULL,
  `question` longtext NOT NULL,
  `choices` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`choices`)),
  `answer` varchar(255) NOT NULL,
  `explanation` varchar(255) NOT NULL,
  `order` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `questions`
--

INSERT INTO `questions` (`id`, `activity_id`, `question`, `choices`, `answer`, `explanation`, `order`, `created_at`, `updated_at`) VALUES
('088448dc-c9f4-4f94-b88a-e8d068c53468', '1afd2d4e-a8ee-4304-8710-986fe3b88f4b', 'ksjdbg', '{\"A\":\"sdfsdf\",\"B\":\"sdf\",\"C\":\"vg\",\"D\":\"wr\"}', 'B', 'kjsbdf', 1, '2023-06-22 14:08:22', '2023-06-22 14:08:22'),
('53f41280-03f9-4f97-b2fe-5d4bb5ece9d4', 'bbd1010b-8a6c-4261-86e5-a0f2a10a4f16', 'apakah bahasa sunda dari jawa barat?', '{\"A\":\"ya\",\"B\":\"tidak\",\"C\":\"ya\",\"D\":null}', 'A', '---', 1, '2023-06-22 21:05:05', '2023-06-22 21:05:05'),
('648ba95d-82b5-4504-96db-4c279c2fd80b', 'c08ebb84-d720-4409-811d-bd0a47895141', 'nasi goreng dengan bakso apakah enak', '{\"A\":null,\"B\":\"tidak\",\"C\":null,\"D\":null}', 'B', 'karena kuah dan goreng kurang enak', 1, '2023-06-22 20:57:12', '2023-06-22 20:57:12'),
('b54ea323-a345-4c6f-9434-a674e6517b37', 'bbd1010b-8a6c-4261-86e5-a0f2a10a4f16', 'dkjn', '{\"A\":\"kjdb\",\"B\":\"cj,\",\"C\":\"kjdc\",\"D\":\"kjd\"}', 'A', ',jd', 2, '2023-06-23 04:39:45', '2023-06-23 04:39:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `schools`
--

CREATE TABLE `schools` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `schools`
--

INSERT INTO `schools` (`id`, `name`, `address`, `created_at`, `updated_at`) VALUES
('00242ff7-da79-3041-80e5-aab4585a3824', 'Marquardt Ltd', '67760 Osinski Land\nModestaview, AK 87286', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('00c583e4-aba4-32a4-aeef-f9ac77b9120d', 'Durgan, Veum and Batz', '739 Schaden Stream\nLake Imeldamouth, MS 05033-9467', '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('01891bfe-393a-3924-87e4-c16f72c574fb', 'Kuhic, Quitzon and Volkman', '12458 McDermott Place Suite 976\nRociofurt, AR 24420-2908', '2023-06-22 18:31:14', '2023-06-22 18:31:14'),
('03334e0f-63ef-3848-bd19-5a304ecced8f', 'Abshire-Goodwin', '436 Medhurst Manor\nZenashire, VT 52143-7471', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('03aa7172-c8d6-3275-bc82-0bbe2b679a63', 'Adams-Rath', '3251 Johnson Harbors Apt. 035\nHallehaven, DC 08289-9884', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('05099f2d-a520-39b2-8705-2d32db49944e', 'Leuschke, Crona and McLaughlin', '2761 Laisha Road\nSouth Damienton, MD 38178', '2023-06-22 20:43:23', '2023-06-22 20:43:23'),
('076af6ee-a640-30ec-a5bc-db8b182352f6', 'Abshire Inc', '1239 Guy Mission Suite 409\nKubmouth, DE 77167-4092', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('083576a0-85df-34ad-9668-702925476db1', 'Tromp, Bins and Sporer', '1119 Schamberger Viaduct\nEichmannfort, SC 96636', '2023-06-22 19:03:34', '2023-06-22 19:03:34'),
('08764f5f-21dc-382a-aa98-795049155025', 'McClure-Hamill', '338 Paula Plains\nMrazfurt, WY 01538', '2023-06-22 19:03:33', '2023-06-22 19:03:33'),
('0aec8df0-9685-3130-a28c-5dc991f2224b', 'Runolfsdottir-Hauck', '3471 Douglas Spurs Suite 369\nNew Kaelaburgh, NY 74114-6766', '2023-06-22 18:31:15', '2023-06-22 18:31:15'),
('0b1a53df-41a1-3611-8772-8f9dd674e0b8', 'Stroman-Purdy', '23096 Leilani Mount Apt. 512\nEast Cristianfort, WV 90227-7492', '2023-06-22 14:26:40', '2023-06-22 14:26:40'),
('0c0137cf-0f46-3920-91a7-65a2e41c79c0', 'Hills Group', '9550 Waters Centers\nEast Jason, IA 13415', '2023-06-22 19:03:37', '2023-06-22 19:03:37'),
('0d440566-ae24-36b2-a921-f6d8e9d83ed0', 'Sanford-Krajcik', '499 Marlon Island Apt. 770\nLavernborough, ND 99107-6841', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('0e58f67b-5b0a-3583-80a5-072534bae918', 'White-Bayer', '33026 Thelma Villages Apt. 272\nMantetown, DC 78223-0561', '2023-06-22 19:03:36', '2023-06-22 19:03:36'),
('101cc498-3af1-3bce-9309-edbc952ef185', 'SDN Cigadung', '8900 Collins Flats\nLake Emeraldhaven, WA 97025-5147', '2023-06-22 20:39:51', '2023-06-22 20:39:51'),
('123ae850-f9b5-3465-9b8c-0acbc79e7f33', 'Weber-Medhurst', '84181 Gleason Fields Suite 237\nLeuschkeburgh, MA 73228-3597', '2023-06-22 19:03:36', '2023-06-22 19:03:36'),
('13419256-c4b2-387b-a0fe-84a4ae00970d', 'Bergnaum-Price', '808 Favian Crest\nWest Jan, OR 33107-9946', '2023-06-22 19:03:35', '2023-06-22 19:03:35'),
('14017d1f-1aa0-385d-98b2-c5ddb43c3521', 'Conroy-Wilkinson', '94760 Corkery Junction Suite 250\nAuerport, OK 03279', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('1479896a-f2a6-3488-ac91-f50f3494884c', 'Hauck-Cummings', '6118 Guido Shore Suite 244\nDouglaston, UT 63747', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('14960859-4f11-3b25-946c-8cb1599f84f9', 'Williamson, Bailey and Emmerich', '5514 Beahan Turnpike\nNorth Reina, MI 88895', '2023-06-22 19:03:37', '2023-06-22 19:03:37'),
('1581007f-6e88-3619-85aa-7a265d75aa35', 'Beahan Inc', '827 Vance Prairie\nWest Bobbiemouth, NJ 33036-5847', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('159fd818-f7c2-3c77-ac5a-67da717f68ca', 'Murray LLC', '2302 Gerhold Fall Apt. 182\nKraigshire, AK 76569', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('15aee592-e788-3d1e-a0a4-e69b1818afba', 'Bartoletti and Sons', '63773 Breitenberg Springs\nBetsymouth, NV 73756', '2023-06-22 14:26:40', '2023-06-22 14:26:40'),
('178fa8e1-0c76-3cd1-9a3e-e1822d8a4545', 'Mueller PLC', '985 White Field\nCormierstad, NE 11773', '2023-06-22 18:25:13', '2023-06-22 18:25:13'),
('18006a3d-1761-343d-8800-f02e99ec6937', 'SMK Indonesia', '64485 Rodriguez Passage Apt. 170\nPaucekville, AR 88666-6951', '2023-06-22 13:56:43', '2023-06-22 13:56:43'),
('182c3daf-6588-311c-b5b2-ea5f338a46cf', 'Erdman, Daniel and Schuppe', '8579 Delphia Port\nOctaviaborough, VA 67210-0666', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('1863b858-91ad-305f-8975-9c63c58c35de', 'Franecki, Ortiz and Price', '8175 Nienow Islands Apt. 451\nPort Samara, VT 95128-8776', '2023-06-22 19:03:34', '2023-06-22 19:03:34'),
('18bb6f20-0c04-3db5-a4ec-b9c020f95e27', 'Stehr, Kuphal and Grimes', '6325 Lambert Rest\nPort Nicholasberg, WY 10855-2878', '2023-06-22 18:31:15', '2023-06-22 18:31:15'),
('18d69c92-c1dc-3ea7-af1e-40a26a5bac9c', 'Howe PLC', '4903 Dillan Mission Apt. 091\nMadieshire, LA 57290-0187', '2023-06-22 19:03:37', '2023-06-22 19:03:37'),
('1ad50333-3a6d-367e-b0f5-fd9200417be0', 'Tillman, Connelly and Tillman', '13426 Rosanna Dam Suite 973\nFritzfurt, DC 04681-0508', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('1ade44c4-9cc1-380c-b624-d20ab5b1c321', 'Dooley, Witting and Mills', '932 Simonis Roads\nRethahaven, NM 68807', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('1ae31726-1a88-3923-b4fb-2f474ef86d45', 'Feest Inc', '858 Frances Greens Apt. 929\nRandallstad, GA 04208-0156', '2023-06-22 19:03:33', '2023-06-22 19:03:33'),
('1aeaba95-0535-3d6c-89e3-5977d2969fb8', 'Wuckert Group', '3097 Loren Lock Apt. 066\nNew Genoveva, VA 17649', '2023-06-22 19:03:37', '2023-06-22 19:03:37'),
('1b3e0392-de78-3097-85ff-194e1ca4e2e2', 'Aufderhar LLC', '13101 Carroll Forge Suite 652\nVernonchester, OK 83136', '2023-06-22 19:03:35', '2023-06-22 19:03:35'),
('1b4e825b-3d8f-31b1-b935-72d5b88466f2', 'Schinner-Mills', '3942 Abbott Summit Suite 340\nLake Idella, OK 05900-1526', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('1c1aa7ce-dc93-301b-9234-96c482e48e3b', 'Lang-Moen', '26764 Melody Turnpike Suite 298\nNorth Lesley, LA 69275-0602', '2023-06-22 14:24:50', '2023-06-22 14:24:50'),
('1c59175c-b15c-3474-97dc-094a806f25df', 'Fadel-Wintheiser', '4607 Block Pines\nPort Lucashaven, AZ 49426-1278', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('1cc6053e-3ada-374e-a214-5c655313a3d1', 'Larson, Klein and Hessel', '20922 Isai Pine Apt. 868\nPort Richmondville, CA 57022', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('1e7f29d7-f892-3734-817a-7dd8863d84b3', 'Considine-Raynor', '90638 Rollin Landing Apt. 513\nHahnchester, DC 26751-2549', '2023-06-22 13:56:43', '2023-06-22 13:56:43'),
('1f6c1552-a447-31f9-a6c1-e79241b79b4d', 'Lindgren and Sons', '494 Powlowski Isle\nSchoenberg, MD 50292-9699', '2023-06-22 19:03:34', '2023-06-22 19:03:34'),
('213cde02-ddb7-3c06-8eff-6bebbb042de9', 'Sauer, Pouros and Quitzon', '4104 Rolando Courts\nGeoburgh, AR 55040-1430', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('21a2cc09-9a13-3448-a6be-35c01d76d1eb', 'Howe-Nader', '276 Freda Lock Apt. 114\nGrantside, NE 74101-2376', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('21bdfa25-e0e4-33b7-a2d5-8af938f9b247', 'Hand and Sons', '954 Carter Landing Suite 842\nWardbury, VT 47259', '2023-06-22 18:31:16', '2023-06-22 18:31:16'),
('21c1dd2d-8029-3e46-98bc-3cdccbc1fec0', 'Beatty PLC', '366 Casper Grove Apt. 291\nGerholdport, NH 36712-7199', '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('226fd693-578a-3c96-ac2f-a0c154641067', 'Lynch-Marks', '316 Lesch Squares Suite 214\nLake Damion, MO 13346-3601', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('22f2d876-277d-379b-9c8e-fe235c9e2e8d', 'Gorczany Group', '863 Cale Throughway Apt. 452\nHeavenburgh, MT 71704-2199', '2023-06-22 18:31:15', '2023-06-22 18:31:15'),
('24662f0c-a574-3127-a595-7a0f515c73fc', 'Jones-Satterfield', '86600 Barry Well\nAndersonshire, KS 03139-7268', '2023-06-22 19:03:34', '2023-06-22 19:03:34'),
('2576e846-5467-3247-973e-f46e2d8994d5', 'Weimann, Bailey and Roberts', '36431 Romaguera Corners\nBobury, CA 07239-7225', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('2680386a-595f-3eb0-b58c-bec8e1a05a46', 'Strosin PLC', '627 Maybelle Forest Suite 562\nNew Colemouth, CT 12932-8309', '2023-06-22 19:08:48', '2023-06-22 19:08:48'),
('271bf706-c92d-38ce-8200-a87a073c9275', 'Bosco, Rolfson and Bartell', '170 Ashtyn Court\nHegmannview, AZ 92853', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('27a8cc86-2aba-38ce-a83a-103055c57799', 'Nader-Doyle', '6681 Watsica Mission\nLake Celineburgh, LA 79950-5385', '2023-06-22 19:03:35', '2023-06-22 19:03:35'),
('27d3a1dc-fa51-3a30-8a1b-866b94eed295', 'Bartoletti, Gottlieb and Spinka', '1300 Emelie Isle\nSmithland, RI 07532-5944', '2023-06-22 19:03:35', '2023-06-22 19:03:35'),
('283aae40-0bd0-39e7-a7b5-3290fe6c7f92', 'Kertzmann Group', '8374 McLaughlin Station Suite 756\nSybleburgh, MI 61846', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('2bcd7b69-5bd4-34cb-ba63-0ab45c08c532', 'Gerhold-Kerluke', '928 Annetta Terrace\nSouth Barry, AZ 20922', '2023-06-22 18:31:17', '2023-06-22 18:31:17'),
('2c37acc3-b346-348b-88c5-fd63bb7d544c', 'Breitenberg Group', '635 Hirthe Mall\nKaylieberg, WA 51424', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('2c871850-2949-3d82-ba3d-44bfce9557aa', 'Funk, Weber and Hilpert', '447 Wiegand Spur Suite 879\nEast Norwood, SC 85756-1816', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('2ee2be21-a2e2-364c-bd00-29cb9ca85a01', 'Gutkowski Group', '29604 Johan Villages Suite 659\nMcClureburgh, TN 19332-3670', '2023-06-22 19:03:36', '2023-06-22 19:03:36'),
('2f95d24b-1ea8-3b26-8ae1-0f3ce5238a2e', 'Mohr-Volkman', '26240 Alexanne Drives Suite 976\nNew Tyrelport, SC 82366', '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('31528f8b-6ac9-3499-9f74-8c4b65a579d7', 'Gutmann, Rippin and Nitzsche', '53780 Mathew Inlet Apt. 812\nEast Lorine, AK 56828-0831', '2023-06-22 13:56:43', '2023-06-22 13:56:43'),
('337796b9-1104-3957-8b0f-0174c8c12141', 'SMK Indonesia', '90091 Bette Turnpike\nRolfsonstad, CO 54737', '2023-06-22 14:26:40', '2023-06-22 14:26:40'),
('343a65ff-54d6-3237-af4d-b7ee9cc93f0e', 'Littel Inc', '558 McClure Burgs Apt. 702\nTiannachester, UT 76523-5387', '2023-06-22 19:03:37', '2023-06-22 19:03:37'),
('3465aeab-d71b-3b93-8635-fccd21381c33', 'Mills, Hirthe and Mitchell', '6504 Willa Passage Apt. 642\nNorth Cecilebury, MT 60446', '2023-06-22 13:56:43', '2023-06-22 13:56:43'),
('346865ae-5e1d-370c-88b4-a67bc8cf6f23', 'Carroll, Keeling and Schmitt', '31428 Zemlak Landing Apt. 293\nWest Wiley, SC 91574', '2023-06-22 19:03:35', '2023-06-22 19:03:35'),
('35525670-ff18-3994-82d5-3b6b5bdb6818', 'Hagenes-Reichel', '5257 Kub Trace Apt. 357\nWest Sheridan, LA 94556', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('35fbe12a-effb-3e2d-a5c2-98d53ef95486', 'Grimes, Sipes and Schmidt', '7666 Kessler Loaf\nReinabury, FL 75648', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('362d162f-74c1-34c6-9809-43a6111b6f73', 'Schroeder and Sons', '400 Jacobson Extensions Suite 465\nNew Noemy, DE 57941-7561', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('37be8ebf-67e9-31e6-8eaa-3504cd84b3d3', 'Mraz-Emard', '4220 Hyatt Drive Apt. 951\nFeestfurt, AZ 33640-8913', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('38f4f512-01ef-37f0-9936-5470769b4c9b', 'Zemlak-Powlowski', '567 Brakus Hill\nMullerstad, IL 22451', '2023-06-22 20:39:51', '2023-06-22 20:39:51'),
('39a6cf10-2281-3ab0-bd9c-eff25f0a59b4', 'Ritchie-Bechtelar', '4378 Sanford Dam\nLake Malinda, NY 28661', '2023-06-22 19:03:32', '2023-06-22 19:03:32'),
('39c64b12-79fc-3572-918e-b6175c50597c', 'SDN Cigadung', '133 Theodora Stream\nEast Yolanda, MT 33206-1143', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('39c7556d-a7b7-35cc-9051-d85feb1e4a86', 'O\'Kon, Bahringer and Howe', '543 Alan Shore Apt. 915\nMelodyshire, MT 53530-7694', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('3bc1762c-93d1-3804-8be4-77a55ac23d38', 'Blick, Klein and Dare', '68114 Vandervort Camp\nNorth Halieburgh, GA 61959', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('3e717b7d-3c54-3434-8df9-da1228bfc35f', 'Klocko, Bauch and Jakubowski', '29293 Will Radial Apt. 180\nNew Katharinachester, ME 49123', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('3eb22764-f323-3295-b2d6-7fe02d73e532', 'Torphy-Gottlieb', '6376 Stracke Plaza Apt. 172\nVeumburgh, VA 69396', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('4002fdf1-052e-3666-9005-6352935abc32', 'Kunze LLC', '3030 Feest Ridges\nNorth Eleonoreton, NV 23579', '2023-06-22 19:03:33', '2023-06-22 19:03:33'),
('40a19c24-cba1-3bbc-bad5-c0cd90d1b1cc', 'Larkin, Bernhard and Kassulke', '27755 Welch Via\nWalshmouth, NJ 17649', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('410e5932-8075-3bf5-8415-7720adc79872', 'Rolfson Group', '240 Haven Way\nMaurineview, RI 79586', '2023-06-22 19:03:33', '2023-06-22 19:03:33'),
('4310b719-0276-34ad-8bfb-137874c27095', 'Dare-Connelly', '8613 Bins Square\nEricborough, WV 63400-8175', '2023-06-22 13:56:43', '2023-06-22 13:56:43'),
('47adbed0-deda-3416-b607-1a8d289038ce', 'Barrows-Marvin', '7098 Mariam Islands\nO\'Konhaven, RI 13254', '2023-06-22 19:03:33', '2023-06-22 19:03:33'),
('48f4994c-9069-302f-b816-579f852ac054', 'Romaguera Group', '3615 Murray Unions Apt. 715\nArdithborough, KS 32944', '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('495a8a10-9f05-3cb5-a452-c85683b7093c', 'McClure Inc', '308 Kertzmann Ridges\nElishafort, WY 19801', '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('49c64ae7-2f21-36e3-899c-1e0443418f3d', 'Leffler-Abernathy', '8686 Ondricka Camp Apt. 142\nBauchchester, TX 53846', '2023-06-22 19:03:32', '2023-06-22 19:03:32'),
('4a9c0a64-259d-35ef-a2ae-8b6c5a6bc92b', 'Collins-Dare', '79837 Larson Dam\nHarveyside, KS 48081-4360', '2023-06-22 19:03:36', '2023-06-22 19:03:36'),
('4b3b111b-48ef-3f01-bea7-a5dad1e2b063', 'Gulgowski PLC', '472 Lottie Manor Suite 084\nJacobsonville, NM 82260-3672', '2023-06-22 18:31:16', '2023-06-22 18:31:16'),
('4c1df000-eb3c-394c-8164-d1ae9aca5cf0', 'Langosh, Heaney and Jacobs', '8154 Alan Villages Suite 687\nPfannerstillberg, MN 66307', '2023-06-22 19:03:33', '2023-06-22 19:03:33'),
('4ce2d1ee-c51f-344c-919f-0e29f32feb47', 'Pacocha-Raynor', '64839 Sibyl Pike\nSouth Desiree, MO 51395-7795', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('4d200e18-20c9-3c10-968c-2028f7c143ea', 'Dietrich-Littel', '30211 Ressie Valleys Suite 787\nHeathfurt, FL 30036-0331', '2023-06-22 19:03:36', '2023-06-22 19:03:36'),
('4e74f406-c23b-3b74-bf66-6fc0e88fafcd', 'Stiedemann-Mayer', '4344 Herman Pass Apt. 916\nWest Darienhaven, NC 04258', '2023-06-22 14:16:15', '2023-06-22 14:16:15'),
('4f1b8b6d-6ceb-3d8e-92c0-3c193b8a8d55', 'Bechtelar Group', '64154 Marvin Summit Apt. 524\nKatherinechester, AR 06773-4002', '2023-06-22 19:03:32', '2023-06-22 19:03:32'),
('4f815e99-ee23-3104-8129-b9d94b51e9d1', 'SMK Indonesia', '175 Gust Crossroad Suite 248\nBoyerburgh, IA 10309', '2023-06-22 14:20:37', '2023-06-22 14:20:37'),
('525f797f-dc7b-3d9e-9ba7-7e4357b8569f', 'Wolf, Mitchell and Sawayn', '254 Theron Streets Suite 280\nEast Minnieland, UT 50128-5444', '2023-06-22 19:08:48', '2023-06-22 19:08:48'),
('53037ff0-4bb1-33a2-98c7-8a8e63e20e60', 'Monahan, Thiel and Nader', '2180 Olson Cliffs\nNew Zetta, VT 08786-4893', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('5760a4cf-3ecd-3e2f-af77-7648d9031e2d', 'Beahan Group', '470 Arch Drive Suite 960\nEast Alejandra, WY 92809', '2023-06-22 13:56:43', '2023-06-22 13:56:43'),
('58bfd25c-2779-3861-9a68-95059c652737', 'Luettgen and Sons', '680 Jaqueline Station\nPearlineberg, NJ 91240', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('59abf485-5cd5-3034-b2e2-5530d0d9440f', 'SDN Cigadung', '1736 Huel Forge\nNorth Ravenburgh, TX 72293-5257', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('5a69fa76-39e3-312d-9ba9-db0fc29f1fed', 'Wiegand-DuBuque', '8641 Brody Ridges Suite 680\nWest Dock, WA 38319-6782', '2023-06-22 18:31:15', '2023-06-22 18:31:15'),
('5b09740e-19a4-3dd0-8ab6-b3467b32d63e', 'Quigley-Graham', '90580 Kaitlyn Stream Apt. 411\nSengerville, NM 59507', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('5de7231c-c2dd-3e24-b0c9-d6cb87479b94', 'Bosco-Davis', '51791 Orval Loaf\nTillmanland, IA 13711-7262', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('5df779f4-f7b5-3190-9ca6-b207a3103074', 'Lowe, Beer and Stamm', '697 Gerhold Mews\nHillsstad, MD 21146', '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('5e9ecb62-c735-320b-8b7e-b00fbf7fe7e4', 'Funk, Ziemann and Gleichner', '806 Eveline Glens\nEast Jessikatown, WY 51736-8819', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('5f5d0619-2c0f-3249-96c0-aa75db3084b3', 'Hessel-Altenwerth', '2768 Spinka Path\nRueckermouth, MT 98898-2218', '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('5f8a357e-170b-343f-900d-bd4caa32ed05', 'Welch-Grimes', '42666 Howard Station Suite 533\nEast Kenyattabury, NJ 10982', '2023-06-22 18:31:16', '2023-06-22 18:31:16'),
('61b7f3e7-00ca-357d-96a9-e418e2200ddf', 'Rosenbaum-Dickens', '8557 Taya Center\nWest Duanestad, HI 51675-8645', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('6230ffae-a330-35e9-bf5a-81a19606e41c', 'Tillman-Ward', '1923 Gerhold Springs Suite 382\nSouth Ericka, KS 09371', '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('6285691a-2633-3f7e-b053-dae85cdb6cc8', 'SMK Indonesia', '904 Cecile Unions\nEast Florence, NV 44794-6817', '2023-06-22 14:16:10', '2023-06-22 14:16:10'),
('64c4fbb6-b45c-304e-a507-2bbadd8d3853', 'Torp, Borer and Schumm', '369 Stanton Springs Suite 298\nLake Namechester, WV 01346-3006', '2023-06-22 19:03:34', '2023-06-22 19:03:34'),
('67a55403-e61e-35d9-8f3e-99236c8fca8f', 'Paucek, Hodkiewicz and Stiedemann', '4676 Jarvis Ville\nEast Abbie, KS 25972-5777', '2023-06-22 19:03:34', '2023-06-22 19:03:34'),
('688ca62a-6641-3a48-83c6-3d324ea03358', 'SDN Cigadung', '57902 Lolita Passage\nEast Efrenstad, MA 02927', '2023-06-22 18:31:11', '2023-06-22 18:31:11'),
('6bdc8f91-830a-395d-89fa-89b8131865e1', 'Bashirian, Welch and Jenkins', '446 Koch Crossroad\nMaryburgh, NY 51373', '2023-06-22 18:31:17', '2023-06-22 18:31:17'),
('6cdca30c-4b25-344a-b8c2-2ff2285b9ac8', 'Rice Group', '46224 Kelley Drive Suite 168\nPort Veronica, SC 28283-8192', '2023-06-22 19:03:33', '2023-06-22 19:03:33'),
('6dfa6f81-9b39-30ad-92ad-05f6035072c5', 'Bechtelar, Funk and Becker', '26946 Boyer Lights\nLake Cristobalport, NE 32995', '2023-06-22 18:31:14', '2023-06-22 18:31:14'),
('6e7ce5c5-c3a7-3166-b3c9-40e6324de5be', 'Hodkiewicz LLC', '8627 Vito Wells Apt. 625\nPort Kiannamouth, MT 18476-5047', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('6edf22eb-cb54-3095-ab4d-25244bf153c1', 'Kihn-Huel', '450 Renner Islands Suite 514\nWest Natasha, CT 99502-4363', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('6fbf8c39-d8a7-32dc-a743-3f9d4c3f9cf9', 'Bayer-Kuvalis', '63002 Dandre Station\nWest Aaliyahchester, AZ 40033-1523', '2023-06-22 19:03:36', '2023-06-22 19:03:36'),
('709f6129-94d5-35ce-90bd-ce075eba9000', 'Pouros-Farrell', '12042 Okuneva Lane Apt. 000\nAuerfort, NY 73702-8568', '2023-06-22 19:03:37', '2023-06-22 19:03:37'),
('70aee630-ccdd-39a7-886c-bc4ae0d57dc7', 'Dooley PLC', '725 Wisoky Manors Apt. 209\nSouth Sonnyberg, IL 98310', '2023-06-22 19:03:32', '2023-06-22 19:03:32'),
('712f68d2-d3f1-31fb-bbc8-db9b5aa6429d', 'Jacobi-Daugherty', '51210 Roob Lights\nImogeneshire, MI 68827-0283', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('7140b146-9a88-38fd-a4b2-01d671a991c4', 'Bechtelar, Hintz and Nikolaus', '42199 Pierre View Suite 952\nNew Emilia, WI 27098', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('727f2cfc-6063-3257-850a-47384c12bb53', 'Shanahan PLC', '4476 Hahn Wall\nJuddport, NH 74782', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('72a306eb-dc88-3685-8c53-3ea42bbd696c', 'Will, Harris and Hoeger', '345 Eudora Stream Apt. 268\nNorth Hortensebury, GA 10263-5107', '2023-06-22 18:31:17', '2023-06-22 18:31:17'),
('72f176b7-288d-31a4-8a7e-56985a6fca7e', 'Borer Ltd', '22833 Sauer Green Apt. 935\nNorth Glenville, MO 60966', '2023-06-22 18:31:16', '2023-06-22 18:31:16'),
('7340b303-5e96-3c65-b175-6c67c80b0d2e', 'Bailey and Sons', '2426 Clement Plaza\nPort Rylee, MS 65206', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('7456b464-1f8d-3f6e-84f0-c1ab26fa7c35', 'Bashirian, Hodkiewicz and O\'Hara', '511 Victoria Harbors Suite 817\nFredland, IL 80766', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('76151e51-7204-310e-b308-03eba95dab00', 'Kilback and Sons', '37165 Jamarcus Underpass Apt. 887\nCrooksberg, ME 22257', '2023-06-22 18:31:14', '2023-06-22 18:31:14'),
('771de2a4-b3a1-3213-87a2-b5a499d02590', 'Erdman Group', '67091 Schaefer Pine\nJaymeburgh, WI 54599', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('771eff89-dc0f-344a-bf76-1ad45909e4d1', 'Schmitt-Lemke', '4217 Haag Mill Apt. 881\nEast Demarco, VT 70307-9637', '2023-06-22 19:03:35', '2023-06-22 19:03:35'),
('78224c01-e531-3448-ad2c-27d6c8483fd5', 'Daniel PLC', '5034 Blick Row Suite 044\nSouth Marilyneberg, LA 49860', '2023-06-22 19:08:48', '2023-06-22 19:08:48'),
('7a47a947-72ed-3ec5-ac37-7e80dc2732ba', 'Spencer, Labadie and Becker', '427 Marquardt Summit\nHarristown, IL 80826', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('7a9581df-3d36-3eea-80f3-ba3459e75805', 'Murphy Ltd', '831 Gerlach Manors\nEast Anahiborough, NM 03752', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('7b407858-6327-3a19-83ec-43d8f349b786', 'Kuhn-Koelpin', '3876 Kristy Springs Apt. 713\nNorth Rustystad, IL 79598-2763', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('7b8f2b24-07a2-3c12-bd43-979a83d32544', 'Schmeler-Douglas', '903 Janie Greens\nEast Angel, MS 79256-9885', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('7c31022f-7bc5-3f24-884b-5fc66f9af50d', 'Nienow LLC', '9526 Giuseppe Stravenue\nWest Sunnytown, GA 71252', '2023-06-22 18:31:15', '2023-06-22 18:31:15'),
('7c3f775e-8a71-30af-9401-caad53467621', 'Bosco-Huels', '48508 Zetta Shoals\nWintheiserchester, AL 72745-2719', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('7c58a9fe-1d1f-3351-bdfd-eefafe1f1ae6', 'Wilkinson-Shanahan', '612 Alvis Square\nPort Alford, LA 48478-6756', '2023-06-22 18:31:16', '2023-06-22 18:31:16'),
('7cd8b885-4c45-3ded-ae4d-82fc1a5673a1', 'McCullough-Beier', '5103 Dulce Trail\nWest Stan, RI 36536', '2023-06-22 18:31:15', '2023-06-22 18:31:15'),
('7e18729f-7cbf-336a-a123-2deec07cc3e9', 'Ferry-Leffler', '19177 Lloyd Pine\nPort Danika, FL 51064', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('7e87a8fd-b91a-3505-8b72-25702be19314', 'Rowe Ltd', '2887 Ray Island Apt. 277\nLake Cassidy, TX 89883-5062', '2023-06-22 18:31:14', '2023-06-22 18:31:14'),
('7ed1df7e-9636-3a9d-9e37-24685d671e9d', 'White, Bergstrom and West', '29697 Conn Throughway Apt. 559\nEast Rickie, MD 96477', '2023-06-22 19:03:34', '2023-06-22 19:03:34'),
('7ef759ec-e84f-3f07-ad4f-021af6bca1a8', 'Green, Jast and Nader', '3168 Barton Underpass\nLaurineburgh, AL 52363-8652', '2023-06-22 14:26:40', '2023-06-22 14:26:40'),
('81eb0435-63ab-3932-994d-29b020d7c9bf', 'Waters-Bernhard', '5599 Britney Ramp Suite 215\nWest Adahchester, MS 56912-9193', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('8204331d-fc11-39d7-abbb-4d16c7359309', 'Mante, Langosh and Batz', '3118 Kilback Fords Suite 198\nSouth Waltontown, NJ 41481', '2023-06-22 19:03:34', '2023-06-22 19:03:34'),
('830c0e25-30d1-3ede-9040-b518350a3f4b', 'Lemke, Jacobson and Nolan', '39879 Arlie Points Apt. 651\nHeathcotehaven, IL 92578', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('839c3b3d-69fb-3b35-8a73-457e0d03cc52', 'Borer-Bailey', '41554 Fritz Common Apt. 318\nJeromeview, WY 30073-3899', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('84064e33-b40f-3a1c-bd7f-577a3bceebb9', 'Bahringer, Mraz and Lockman', '405 Paris Pines\nWelchmouth, OR 12217', '2023-06-22 19:03:32', '2023-06-22 19:03:32'),
('844d681d-cb6d-3abe-b555-5c50f880bb65', 'Jerde, Gutmann and Gerlach', '7102 Anahi Club Apt. 907\nEast Nels, SD 62013', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('851a6233-35d3-3995-a794-4cad0aa0922a', 'Blanda-Pagac', '7916 Hagenes Keys Suite 949\nLake Marcellusbury, OR 75542-6405', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('85f84c22-fcaa-3c96-b70a-aa734e1118f7', 'Homenick-Kerluke', '2389 Gregoria Parkways\nHeaneyfort, KS 24380', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('87ddeea0-657c-3dc6-a2b7-011b614beb69', 'Zulauf-Leuschke', '93555 Flatley Tunnel\nAlaynaland, NM 31609-4625', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('8805ec7c-4796-3f44-94a5-266e65b5d611', 'SMK Indonesia', '9718 Johnny Run\nSouth Rowena, AR 30400', '2023-06-22 14:16:14', '2023-06-22 14:16:14'),
('88a828c8-d2b9-3c93-8193-42a866b320a4', 'Bahringer and Sons', '76640 Mills Locks\nCollinsbury, UT 96909', '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('8952b9f1-56d1-3358-80a0-557b3c214dee', 'Bode LLC', '28630 Braulio Parkway Apt. 050\nWillisbury, IL 45069', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('8982ad72-969e-33f3-a36a-8112f2c765fc', 'Shields Ltd', '90381 Ebert Mountains Suite 729\nNorth Demond, AL 79764', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('8a791350-d2a9-3dec-af9b-13fa5e76496b', 'Kemmer Inc', '8894 Blick Pass Apt. 878\nJazlynchester, CO 03844-0049', '2023-06-22 19:08:48', '2023-06-22 19:08:48'),
('8be248d2-9bbe-35e4-9a8c-ae47fc41652a', 'Swift, Rowe and Leannon', '8760 Osinski Camp Apt. 983\nRoobview, MI 00790-9699', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('8cd9b2d6-2989-3928-a030-7155d2e5fa91', 'Volkman, Spencer and Schowalter', '750 Roma Lake Suite 522\nNorth Annalisebury, SC 06930-1562', '2023-06-22 19:03:32', '2023-06-22 19:03:32'),
('8ed5b931-4607-3a3d-8c15-5f7cc878b6e8', 'Johnston, Treutel and Rice', '20303 Israel Lake Suite 799\nAltenwerthside, AK 83109-8344', '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('8faf8cee-6300-3a54-97d2-a9251da388cc', 'Kozey, Berge and Lehner', '8023 Pollich Mall\nSawaynside, MI 49453', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('9029d379-ba89-34da-8fd0-77b31bf85e1d', 'Wolff-Eichmann', '95641 Bode Brook\nWest Kipmouth, IA 39907-4756', '2023-06-22 14:16:50', '2023-06-22 14:16:50'),
('90f1c174-7f21-3049-977b-d319ba8af978', 'Hayes and Sons', '65704 Kilback Mountains\nEast Makenziechester, RI 42411', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('931375b5-3f1b-39c9-a988-0a5d791a5517', 'Mosciski, Rutherford and Stroman', '88572 Kihn Stravenue\nLake Newtonland, AR 06474-2304', '2023-06-22 19:03:36', '2023-06-22 19:03:36'),
('932a1ee8-0c26-34c3-99ad-524dcdb47d96', 'Skiles and Sons', '1579 Clovis Lake\nLake Hassanbury, OH 24047', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('93d0ed19-40e7-3372-bbf0-a77792e584f6', 'Langosh, Hill and Robel', '1222 Hintz Stravenue Apt. 306\nLake Heidi, MS 80354', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('964376db-d66c-3743-ae28-dd4943675651', 'Zulauf LLC', '4615 Murazik Common\nRoxanneborough, UT 20758', '2023-06-22 19:03:35', '2023-06-22 19:03:35'),
('96883640-7b4a-3820-bd54-0201a6a8b025', 'Bergnaum and Sons', '31911 Mann Turnpike\nPort Greta, OR 69431', '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('96894799-5875-36a4-85d1-27c09ccdeac9', 'Bahringer PLC', '2443 Anderson Courts\nZulauffurt, NM 22594', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('9788467a-926a-35de-8ba8-1145f63d8da0', 'Tillman LLC', '33468 Grant Crescent\nLake Krystina, MA 19110', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('996a902c-57c2-3b09-8e3f-ff1b2cdf107b', 'Bogisich PLC', '1365 Shaina Shores\nHirthetown, TX 66301-0666', '2023-06-22 19:03:36', '2023-06-22 19:03:36'),
('9a3e003f-666f-3696-9921-07e5eafa6bdb', 'Feeney-Block', '90186 Dallin Corner\nWest Nettieburgh, IN 64211-0460', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('9a649315-e421-38d5-abdd-a4d191c1c407', 'Crooks, Kassulke and Wiegand', '877 Herbert Divide\nStokeschester, WI 86232-6544', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('9aaf387c-6027-3f4f-ab44-b880391d5b37', 'O\'Conner, Denesik and Gerhold', '780 Schumm Ramp Suite 345\nRoobborough, WY 16302', '2023-06-22 19:03:37', '2023-06-22 19:03:37'),
('9aca3be5-e5c8-3dba-9233-3c535da3c4f8', 'Bosco, Kuhlman and Hyatt', '9317 Concepcion Hills\nWest Carli, TN 77070', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('9b61b7e3-b9b1-3c2c-abb3-851cd37bf100', 'DuBuque, Towne and Pfeffer', '38306 Lauryn Circles\nProhaskamouth, IL 68681', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('9c40ff88-f4c4-32e3-9835-0ab48ca6c367', 'Torphy-Streich', '79962 Schmitt Village\nWest Allisonmouth, NV 38192-7294', '2023-06-22 18:31:16', '2023-06-22 18:31:16'),
('9cc39951-d15e-30a9-9540-b273668d942a', 'Nicolas, Cummings and Gutmann', '99196 Shanon Wells\nSouth Rosendoshire, CT 20289', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('9d8cf092-f687-3cc9-882f-c28b98bf1b3f', 'Considine, Schiller and Ebert', '34237 Estevan Villages Suite 138\nHegmannland, ND 45589-6081', '2023-06-22 19:03:35', '2023-06-22 19:03:35'),
('9df3af49-eee1-3e72-b234-ec90a2234fb3', 'Heidenreich-Pagac', '7790 Walter Ridges Apt. 295\nPriceshire, GA 72116-3994', '2023-06-22 19:03:35', '2023-06-22 19:03:35'),
('9e5c372b-3c7a-3f00-beba-44ff68a2ccfe', 'Kertzmann-White', '75694 Gregoria Forks\nLeannonburgh, FL 92294-2943', '2023-06-22 18:25:13', '2023-06-22 18:25:13'),
('9f199271-f195-3e83-89c2-022130a1af6f', 'Kemmer, Pfeffer and Crooks', '35443 Senger Center Apt. 130\nNorth Diegoside, LA 72177-6356', '2023-06-22 18:31:16', '2023-06-22 18:31:16'),
('a00772ec-32fa-3b72-abf6-2ed2c6f303fe', 'Von LLC', '288 Letitia Shoals Apt. 098\nCecilechester, CA 90722', '2023-06-22 18:31:17', '2023-06-22 18:31:17'),
('a0a4c4ab-be11-3857-82e7-11768fda5f5b', 'Howe, Fahey and Macejkovic', '96051 Krajcik Gardens\nHazelfort, SC 38014-1550', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('a1533a2d-01d2-3b44-8312-a99eb1620371', 'Smitham-Hettinger', '6651 Hunter Springs Apt. 568\nJonview, NV 59551', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('a23e1131-1117-3b34-8217-ce0619961090', 'Grady-McCullough', '774 Torey Courts Suite 840\nErnestoton, NV 75731-9492', '2023-06-22 20:43:23', '2023-06-22 20:43:23'),
('a598d6ee-e4fd-3174-9b18-52f0ad235fb1', 'Stiedemann-Haag', '1603 Clementine Crossroad Suite 635\nWest Noefort, ND 33106-9367', '2023-06-22 14:26:40', '2023-06-22 14:26:40'),
('a69a6577-190d-3844-9647-bcaa9f4cabe7', 'Lueilwitz-Davis', '3515 Emma Well Suite 018\nKatherynfort, ND 79135', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('a6c90367-56b8-3ac5-8faa-8d5b6b2bac04', 'Kautzer Ltd', '61603 Cruickshank Drive Apt. 672\nRutherfordshire, MA 41398', '2023-06-22 14:26:40', '2023-06-22 14:26:40'),
('a859d429-307c-303f-8e05-6d38b35fd0c3', 'Gaylord, Kulas and Ward', '701 Armstrong Station Apt. 402\nAshlyberg, NY 44414', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('a9231988-e2be-391b-a425-7f55c278e402', 'Lowe Group', '398 Bode Place\nRoobton, MT 34412', '2023-06-22 19:03:36', '2023-06-22 19:03:36'),
('ae4868b8-e4a5-3e62-9a78-cd9a359576e4', 'Sipes-Hahn', '32197 Brionna Stream\nRaynorborough, WV 34387-2516', '2023-06-22 14:16:10', '2023-06-22 14:16:10'),
('af6ac719-94d8-3f15-b860-1d38eaa93fd8', 'Breitenberg and Sons', '80062 Reichel Brook Apt. 232\nUlicesmouth, WY 30990', '2023-06-22 14:19:31', '2023-06-22 14:19:31'),
('b0bbfaaa-1143-3ac6-af40-a27ce3594366', 'Corkery, Dach and Reichert', '921 Berta Brooks\nWymanton, WI 81612', '2023-06-22 14:26:40', '2023-06-22 14:26:40'),
('b12556e1-43f5-3a4d-bd48-846244e8b7a4', 'Brown, Schimmel and Bayer', '512 Andreanne Square Suite 262\nStromanland, HI 82546-1703', '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('b277694b-3b48-3562-be1e-5f2fd4c59770', 'Dach Ltd', '674 Lakin Harbor\nKertzmannton, RI 73455-0881', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('b3739014-8740-3286-b11a-bb420c177def', 'Zulauf-Davis', '475 Florian Rue\nWest Reina, SD 17533', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('b467efeb-05c7-3486-811d-8d2c37bd6981', 'Ullrich-Murphy', '9061 Rae Rue\nLake Abbyborough, VT 17034-8047', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('b70ee24d-1398-366b-98d6-fe7ff8972b78', 'Cummings, Sauer and Block', '3984 Rodriguez Mission\nRempelfurt, WI 70681-7631', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('b9e94d4d-b467-3c6e-a397-c7c313dbab77', 'Hansen Inc', '389 Gertrude Isle\nNorth Kyleigh, KS 60152', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('baeae225-380e-3c5d-99f9-2e070abe38c6', 'Stehr, Rowe and Harber', '985 Kasandra Path\nLake Mona, NH 63323', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('bbb376ea-8481-34b5-b14e-75fdbf805fe1', 'SMK Indonesia', '172 Claire Drive Suite 958\nNeomaside, CT 94098', '2023-06-22 18:25:13', '2023-06-22 18:25:13'),
('bcb6b406-7736-315c-b22c-19f2a96a70bf', 'SMK Indonesia', '7737 Rippin Turnpike Apt. 995\nWest Isaachaven, DE 15442', '2023-06-22 14:19:30', '2023-06-22 14:19:30'),
('bd155b3a-ab4d-30c4-86c5-ad188717bed0', 'Welch-Spencer', '99960 Penelope Mountains\nNorth Kyra, MT 25354', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('bd5fcee2-27a0-37d9-b4ae-62c06e5ad4e3', 'SMK Indonesia', '5533 Wisoky Brooks\nWadeland, NJ 35474-4708', '2023-06-22 13:40:22', '2023-06-22 13:40:22'),
('bf6779e2-14d4-3ee9-9f1c-a6217ec7ad7e', 'SDN Cigadung', '349 Treutel Shoal\nSouth Burdette, HI 41895', '2023-06-22 20:43:23', '2023-06-22 20:43:23'),
('bfb9fcc9-967d-3c62-b868-495d61c6be10', 'Legros, Little and Homenick', '46027 Lulu Ways\nNorth Nick, GA 23158', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('c0a21c28-4f19-3fc6-a498-df1ec7b1bc3d', 'Roberts, Champlin and Hermann', '21889 Dicki Creek\nEast Leatha, IN 25877', '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('c0bf8bae-912d-3612-8c36-ec12abc3b43d', 'Kutch-O\'Reilly', '1821 Brandyn Lake\nSandraton, DE 45713', '2023-06-22 19:03:35', '2023-06-22 19:03:35'),
('c2328ce0-69e8-3ce4-90f6-758fbe561836', 'Adams LLC', '33807 Kaylee Streets Apt. 346\nJanickport, HI 67002-6641', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('c282ce72-8453-309c-b3be-897357dae8e9', 'Moore-Jaskolski', '585 Renner Corner Apt. 734\nNorth Bobbie, KY 78183', '2023-06-22 18:31:16', '2023-06-22 18:31:16'),
('c371608c-37b2-30ff-9dae-ab919612bc32', 'Effertz-Funk', '7265 Evert Prairie\nPort Earleneberg, GA 24037-4675', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('c495b1fb-5e62-375f-b5ff-f6e26a16680d', 'Haley-Durgan', '6380 Rolfson Circle\nFannieborough, AL 13210-1925', '2023-06-22 19:03:32', '2023-06-22 19:03:32'),
('c6c1ba92-e10e-3616-bed0-3b40252f4a65', 'Considine-Stanton', '9692 O\'Hara Ridges Suite 599\nNew Alexaneville, RI 52325-6820', '2023-06-22 18:25:13', '2023-06-22 18:25:13'),
('c6c226a8-c56b-3f48-a44e-5b3ab3a9900b', 'Erdman, Macejkovic and Torp', '363 Jermaine Shore\nKaciborough, CA 61414-4463', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('c8237fcf-6cb8-38f4-87ba-4f5bc07cb53c', 'Lowe-Dickinson', '967 Braun Wells Suite 415\nPort Francesca, TN 89192', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('c8459778-20c9-35c6-b6a2-385628544d9e', 'Hane-Moore', '597 Kohler Villages\nJoycechester, NM 51593', '2023-06-22 18:31:14', '2023-06-22 18:31:14'),
('c87f1258-af4a-3937-9cb5-5f53badd436d', 'Simonis-Luettgen', '9663 Rachael Hill\nHannabury, SC 94030', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('c8d3261e-1d07-3d54-8351-b88602916740', 'Emmerich, Nitzsche and Medhurst', '8679 Jayson Union\nPort Carmella, VA 31817-2202', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('c91929b6-68bb-3f6a-b92f-5cfa61f43bc5', 'Morissette-Conn', '294 Dianna Hollow Suite 857\nSouth Lucio, RI 19652', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('c9609c81-c43d-36e7-8d7c-269c01c14497', 'Miller-Lesch', '38068 Halvorson Centers\nAllenside, AZ 01359', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('ca19a2aa-1b86-392b-a509-6d48f99c60d4', 'Howe, Kuphal and Heller', '1497 Parisian Pines Suite 121\nMariamton, RI 49789-2189', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('cbb79891-03b7-3b28-aed8-51f5fa1317e2', 'Lind PLC', '43160 Lind Stream Suite 143\nNew Fritzside, IL 82749', '2023-06-22 13:56:43', '2023-06-22 13:56:43'),
('cd090e62-e5e2-338b-987d-007a25d98968', 'Osinski LLC', '321 Hermann Shoal Suite 798\nEast Colemanview, CO 19602-9172', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('cd7a9396-b195-3c8d-8349-fa40cb80d5e9', 'Luettgen LLC', '950 Chesley Avenue\nRocioport, PA 14849', '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('ce5f5c14-9dff-38e0-8a30-345118612d34', 'Barrows PLC', '8798 Dickens Valleys\nSouth Cleora, PA 24757', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('cea43d80-e745-3666-b65f-96294f7cb5a6', 'Weber, White and Blanda', '5718 Kulas Summit Apt. 112\nJessikaside, ND 73495-4203', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('cf2bcc38-6a91-3fc6-9fb1-8aed96dc6f36', 'Williamson-Franecki', '586 Elizabeth Terrace Suite 094\nTremblayville, ID 10181-1191', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('d296449f-bd66-36e7-8136-3fb9c75e3bc2', 'Hauck Inc', '969 Elissa Key\nReichertfort, WY 05111-4741', '2023-06-22 19:03:34', '2023-06-22 19:03:34'),
('d2a2c126-b3ee-31b1-bac4-fdba94ef3edd', 'Gleason and Sons', '4061 Felicita Squares\nAniyahmouth, IN 85154', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('d356c27f-a14c-3eb9-9def-6af34e128307', 'SMK Indonesia', '497 Pfeffer Crest\nOnatown, VT 44524', '2023-06-22 14:24:50', '2023-06-22 14:24:50'),
('d3ed2e30-50ba-3421-9f18-d457fd8a4642', 'Blanda-Quitzon', '4098 Adelbert Canyon\nWest Tyshawnfort, KY 05029', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('d5a3983f-6a55-382a-91be-b0e211d24a45', 'Tromp-Marquardt', '7371 Heidenreich Shoal\nNorth Ellastad, CO 25940', '2023-06-22 13:56:43', '2023-06-22 13:56:43'),
('d6ed8e28-6cdf-3876-ad4d-b67708ac0bcb', 'Heathcote, Berge and Reichel', '59951 Grady Bridge Apt. 688\nHettingerburgh, AR 65457', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('d795b712-b070-373d-b317-4ea658bb34eb', 'Ernser, Mante and Bahringer', '885 Reinger Stravenue Suite 699\nCorrineport, MO 86530', '2023-06-22 18:31:15', '2023-06-22 18:31:15'),
('dc720d84-5504-357e-9cbb-c760a61ac499', 'Bashirian-Jenkins', '788 Bettie Tunnel Apt. 998\nAntonetteside, NE 97834', '2023-06-22 18:31:16', '2023-06-22 18:31:16'),
('e1300bae-6d4b-3bc4-91dd-8f138e05891e', 'Eichmann, Mills and Fritsch', '54813 Alene Via\nAufderharmouth, NM 99999-5893', '2023-06-22 19:03:36', '2023-06-22 19:03:36'),
('e1ec284c-f155-31d6-b8a3-491a29817b82', 'Schowalter-Daniel', '4459 Schulist Lake Apt. 330\nZiemebury, KY 08758-2934', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('e271cb29-26df-3c59-8d46-85a11a5449d2', 'Halvorson, Mueller and Grant', '585 Goyette Lodge\nLake Bobbyhaven, MN 30543-4409', '2023-06-22 19:03:33', '2023-06-22 19:03:33'),
('e36002e1-0133-358a-accf-b4f5ff526db7', 'Runolfsson PLC', '49365 Nettie Hollow\nNew Birdie, HI 68397', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('e37530ee-b9be-3a6d-8639-3a7e254b8448', 'Keeling and Sons', '69397 Toy Islands Suite 983\nNew Kiraburgh, MN 57896', '2023-06-22 14:26:40', '2023-06-22 14:26:40'),
('e410d2bd-2663-3b90-8b40-3a6a83e472a0', 'Emard-Wunsch', '45434 Willow Plaza Suite 374\nStantonfurt, VA 96993-3174', '2023-06-22 19:08:48', '2023-06-22 19:08:48'),
('e4d76e92-bd7a-3f3b-be76-6ad2bdb9fc81', 'Dickens, Corwin and Russel', '73222 Tiana Greens Apt. 035\nRachaelport, NV 23491-8937', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('e62e5da7-9cfb-3be0-b338-d7ce6a826269', 'Padberg-Ruecker', '211 Lexie Curve\nMurphyland, CA 11199-0635', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('e65bd87d-db13-3ba6-9a22-907d858f5649', 'Heaney Ltd', '40693 Medhurst Summit Apt. 953\nWest Zackery, WI 00138', '2023-06-22 19:03:33', '2023-06-22 19:03:33'),
('e6710960-e3cc-3257-9403-f608118ae3fd', 'Walsh-Dietrich', '4685 Hirthe Viaduct Suite 925\nBreanaside, MN 35831-9558', '2023-06-22 14:20:38', '2023-06-22 14:20:38'),
('e6937a1e-72e0-3166-80d8-f2849a9f45c3', 'SMK Indonesia', '9921 Runte Shoal Apt. 798\nWest Jaylonburgh, GA 07180-9156', '2023-06-22 14:16:50', '2023-06-22 14:16:50'),
('e6a8d427-2219-3ab5-8740-c2c1397757f6', 'Wilkinson-Flatley', '111 Hauck Fort Apt. 220\nBoyerside, NJ 48610', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('e7fe3f52-dd2e-3644-9e23-428745df3f42', 'McDermott-Kris', '26710 Kailey Corners Suite 164\nPort Louiemouth, AR 87910-1467', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('e8d29442-b901-38d1-b393-f08f27852e07', 'Von, Hagenes and Rogahn', '72521 Treutel Corner Suite 983\nNorth Katlynn, SC 53419-5375', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('e8fc75f4-6ae1-34fb-8c76-8d095266e2d3', 'Beer, Kassulke and Feeney', '921 Axel Canyon\nWest Thaliatown, SD 73672', '2023-06-22 19:08:48', '2023-06-22 19:08:48'),
('e94efa51-4c2a-3cf0-bc9a-907a248374ee', 'Parisian-Glover', '864 Boyer Drive Apt. 893\nPort Everettehaven, TX 03012', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('ebc7f5c7-552a-3aba-9825-6711c716b23d', 'Rosenbaum and Sons', '24505 Blick Station Apt. 619\nPaucekfurt, OR 13003', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('ec234db1-02dd-3fbe-85a0-2f2472629407', 'Marvin, Hammes and Ryan', '7686 Ratke Spur Apt. 633\nWest Ramon, MT 64802', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('ec7d4f2b-c1f1-325d-9227-0d196a6878be', 'Harris-Pfeffer', '7341 Hermann Haven Suite 539\nDoyleville, NY 13410', '2023-06-22 18:31:15', '2023-06-22 18:31:15'),
('ecbda5e6-1f0f-32b5-b874-f0dcab61e100', 'Mraz Inc', '5764 Legros Drive Apt. 444\nKaelynborough, WV 95949', '2023-06-22 19:03:33', '2023-06-22 19:03:33'),
('ed13ac88-2b38-39c6-9d9e-72c7918a764e', 'SDN Cigadung', '78227 Murazik Crossroad Suite 950\nEast Shania, VA 53561-7634', '2023-06-22 19:03:27', '2023-06-22 19:03:27'),
('ed2711f8-038d-35f7-86f3-cbce4207630f', 'Harber-Padberg', '98177 Corwin Way\nTorpfort, KS 36938', '2023-06-22 19:03:32', '2023-06-22 19:03:32'),
('ef4c95d5-6d43-3f61-b78b-ed9720385612', 'Greenfelder-Lebsack', '60401 Noelia Isle Apt. 542\nLouveniaberg, RI 19343-6816', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('ef78080e-e190-3fb6-b90a-5e484736353e', 'Pouros-Kohler', '7543 Rosenbaum Terrace Suite 997\nVestabury, MS 30028-8756', '2023-06-22 19:03:37', '2023-06-22 19:03:37'),
('f0a31f05-eb9c-380f-8562-169c3a429c9c', 'Russel-Jacobi', '873 Lysanne Motorway\nKundemouth, AZ 38846', '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('f27067b4-3cc6-3b0b-8aca-e011a2a4f371', 'Dietrich-Hansen', '614 Jazmin Flats\nStarkport, NY 20624', '2023-06-22 19:08:48', '2023-06-22 19:08:48'),
('f2bf4f82-1fe0-3364-8827-1f659a4737df', 'Jenkins-Harber', '234 Mohr Plains\nLake Jabariport, PA 54264-8190', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('f3095f73-98c4-37ce-9fe3-9daf9138a241', 'Morar, Donnelly and Fay', '606 Uriah Lights Apt. 026\nLake Bridget, AL 18734-0273', '2023-06-22 19:03:35', '2023-06-22 19:03:35'),
('f445e712-55f9-3d29-888c-1c2b0993db14', 'Bayer-Brown', '19321 Jerad Rapid Apt. 757\nNorth Kipmouth, AL 59366', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('f49080e8-d679-3865-9d6c-02404c516052', 'Ankunding Inc', '635 Jocelyn Shores\nLake Miraclestad, PA 12714-6302', '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('f523c6be-3f20-32b3-bba4-d9e54909727a', 'Legros-Wolff', '89694 Gabrielle Hollow\nBlickmouth, DC 60547-9954', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('f55d709a-0bea-34cd-82f7-4adc1bea8036', 'VonRueden, Johns and Turcotte', '3641 Delores Isle\nLake Misaelbury, VA 49588', '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('f5670f45-7efd-3de8-86a3-6dc0e2b8f93d', 'Stamm, Block and Adams', '51204 Mayert Green\nNew Ellen, IN 82476', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('f58cea90-c591-38c6-96fa-f02f5f900481', 'Weimann, Braun and Rosenbaum', '5658 Lorenz Fall\nPort Kendallchester, IN 46383-9256', '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('f8635cda-4071-3d00-aa3b-efd9c31e1220', 'SDN Cigadung', '5249 Briana Parkway Suite 819\nMelbatown, AZ 87100-8542', '2023-06-22 19:08:48', '2023-06-22 19:08:48'),
('fa480c70-8050-3e49-abb2-1d5ea6c5a55d', 'West-Streich', '62123 Cary Courts\nLake Wilfred, NH 21861-0985', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('fa6c9638-74b1-32fa-8eaf-b5a56366a301', 'Wyman, Zboncak and Mayert', '941 Larson Shore\nLake Caleb, CO 95391', '2023-06-22 19:03:34', '2023-06-22 19:03:34'),
('fb5940fc-11cb-3a15-b576-29efd0ac7bce', 'Morar, Herman and Feeney', '3058 Boyle Road\nRahulmouth, MI 01836', '2023-06-22 18:31:16', '2023-06-22 18:31:16'),
('fc3d53d6-532f-3990-b3c3-fc3f33164249', 'Senger-Bogisich', '59939 Weber Plains Suite 428\nNorth Emmie, MI 13915', '2023-06-22 18:31:15', '2023-06-22 18:31:15'),
('fe9df31b-b891-3561-aa58-0edf5f7bd224', 'Satterfield-Anderson', '7302 Kohler Island\nNew Myahborough, NE 94069', '2023-06-22 18:31:15', '2023-06-22 18:31:15'),
('fefa64cd-8476-3c72-a79a-993b833e7847', 'Green-Bartell', '317 Little Wells Suite 415\nAnaishaven, OR 11184', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('ff3da27a-7623-305d-a689-5feaddf53403', 'Thiel, Gutkowski and Sawayn', '704 Langworth Points Suite 508\nPort Amaramouth, MS 90664-4481', '2023-06-22 14:26:40', '2023-06-22 14:26:40'),
('ffd9cc7f-c294-35e1-8a19-129a8939eb29', 'Waelchi-Kozey', '6643 Jenifer Passage Apt. 452\nRowestad, MT 29875-8722', '2023-06-22 13:56:43', '2023-06-22 13:56:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subjects`
--

CREATE TABLE `subjects` (
  `id` char(36) NOT NULL,
  `school_id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `subjects`
--

INSERT INTO `subjects` (`id`, `school_id`, `name`, `created_at`, `updated_at`) VALUES
('0efb3e24-701b-35f6-aae8-c926ff532f73', 'bf6779e2-14d4-3ee9-9f1c-a6217ec7ad7e', 'Bahasa Indonesia', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('0fc8d020-a840-352f-aace-5b4983de575f', '59abf485-5cd5-3034-b2e2-5530d0d9440f', 'Bahasa Sunda', '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('2047c5c2-5e4d-39e1-bf6b-1bb7818f78b3', '2c37acc3-b346-348b-88c5-fd63bb7d544c', 'IndianRed', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('21341bef-7d17-30ce-80f6-46fcdd3282c6', 'ffd9cc7f-c294-35e1-8a19-129a8939eb29', 'White', '2023-06-22 13:56:43', '2023-06-22 13:56:43'),
('277381c6-e45a-332b-b680-432db961876e', '337796b9-1104-3957-8b0f-0174c8c12141', 'Bahasa Sunda', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('2976f6dd-1861-39f0-88e4-9612b65b20ee', '59abf485-5cd5-3034-b2e2-5530d0d9440f', 'Bahasa Indonesia', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', '18006a3d-1761-343d-8800-f02e99ec6937', 'Matematika', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('2f12286e-7661-364d-b3bf-dce9750dd0fa', '5b09740e-19a4-3dd0-8ab6-b3467b32d63e', 'ForestGreen', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('32d654df-b90d-3280-bfa7-bff171e8e7b2', '839c3b3d-69fb-3b35-8a73-457e0d03cc52', 'LightSlateGray', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('34745c58-1686-3348-96f6-c49b05c4c392', '39c64b12-79fc-3572-918e-b6175c50597c', 'Bahasa Sunda', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('486ff95b-adf1-3da3-b44c-6226fd05fc6f', 'f58cea90-c591-38c6-96fa-f02f5f900481', 'DarkGoldenRod', '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('492dfe13-292c-307c-864a-b4a3cbab5be1', '337796b9-1104-3957-8b0f-0174c8c12141', 'Matematika', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('4a8b7386-1053-3817-85ef-2ef72b0405f7', 'bbb376ea-8481-34b5-b14e-75fdbf805fe1', 'Matematika', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('521aca4d-98d2-3c5d-a19d-e9db04c16261', 'f8635cda-4071-3d00-aa3b-efd9c31e1220', 'Bahasa Sunda', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('545cacc9-6000-32e8-8ef7-15aa2e62788b', '48f4994c-9069-302f-b816-579f852ac054', 'Pink', '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('5a6c8286-7404-363e-bcdb-dbf6d7680fb6', 'ef4c95d5-6d43-3f61-b78b-ed9720385612', 'BlueViolet', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('6bb8d53a-7704-3c3f-afa6-3d67c36f4839', '59abf485-5cd5-3034-b2e2-5530d0d9440f', 'Matematika', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('741e6ed6-b86d-391d-a9e1-e623233ccf89', '337796b9-1104-3957-8b0f-0174c8c12141', 'Bahasa Indonesia', '2023-06-22 14:26:40', '2023-06-22 14:26:40'),
('85ce4544-b9cb-30b9-afdf-0bf4e415fe42', 'e36002e1-0133-358a-accf-b4f5ff526db7', 'MediumVioletRed', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('885b4247-3948-388f-bd6e-14ee4905fc57', 'e62e5da7-9cfb-3be0-b338-d7ce6a826269', 'Purple', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('890565fb-fd2c-45d3-869e-01521b79cbba', 'bf6779e2-14d4-3ee9-9f1c-a6217ec7ad7e', 'sastra inggris', '2023-06-22 20:59:29', '2023-06-22 20:59:29'),
('8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'bf6779e2-14d4-3ee9-9f1c-a6217ec7ad7e', 'Bahasa Sunda', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('8e6840eb-f103-3391-ad1b-62ed6fda2a57', 'a6c90367-56b8-3ac5-8faa-8d5b6b2bac04', 'LightSalmon', '2023-06-22 14:26:40', '2023-06-22 14:26:40'),
('909d7805-eb8c-333b-bd58-efd9967bf307', 'bf6779e2-14d4-3ee9-9f1c-a6217ec7ad7e', 'Matematika', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('9137ed78-a06f-3bf1-8e78-ec1e708a0ab3', 'd6ed8e28-6cdf-3876-ad4d-b67708ac0bcb', 'Beige', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('96daeaf1-6bf1-306c-9d64-3879fcd1cf51', '00242ff7-da79-3041-80e5-aab4585a3824', 'Tan', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('976127fa-21de-31a5-9ec8-689283417916', 'b70ee24d-1398-366b-98d6-fe7ff8972b78', 'DarkGoldenRod', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('a04fb403-5eeb-37f4-8258-6be77bdfb4bc', 'c91929b6-68bb-3f6a-b92f-5cfa61f43bc5', 'YellowGreen', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('a215f746-4260-37bf-b239-77f0bd0df7b2', 'f8635cda-4071-3d00-aa3b-efd9c31e1220', 'Bahasa Indonesia', '2023-06-22 19:08:48', '2023-06-22 19:08:48'),
('a2d8bdab-91e6-30ee-8c24-77e7abedd9c1', 'ce5f5c14-9dff-38e0-8a30-345118612d34', 'Yellow', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('a97c5cf5-a6a9-3de8-8279-47cb48719c9c', '18006a3d-1761-343d-8800-f02e99ec6937', 'Bahasa Indonesia', '2023-06-22 13:56:43', '2023-06-22 13:56:43'),
('ad770b82-723d-3d87-be04-e6e7bb8410fd', 'bd5fcee2-27a0-37d9-b4ae-62c06e5ad4e3', 'Matematika', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('ade59952-8e70-4994-ab1a-39f85ac51929', 'f8635cda-4071-3d00-aa3b-efd9c31e1220', 'ppkn', '2023-06-22 20:00:34', '2023-06-22 20:00:34'),
('ba5f1bcb-daae-3bec-a816-d06dbb57ffd5', '7b407858-6327-3a19-83ec-43d8f349b786', 'MistyRose', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'bbb376ea-8481-34b5-b14e-75fdbf805fe1', 'Bahasa Sunda', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('bfc7fedf-66de-309e-a032-3ba84d090e65', '96894799-5875-36a4-85d1-27c09ccdeac9', 'DarkGoldenRod', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('c4b24553-92b8-389e-91c0-7efe80ea3762', '39c64b12-79fc-3572-918e-b6175c50597c', 'Matematika', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('cb53239a-b823-363d-966f-3cec488f6d4d', '18006a3d-1761-343d-8800-f02e99ec6937', 'Bahasa Sunda', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('d4315e88-bb34-35cc-a597-ae591746d5db', 'a1533a2d-01d2-3b44-8312-a99eb1620371', 'MidnightBlue', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('daf26725-556c-364f-b08a-e36b7dabbd92', 'bd5fcee2-27a0-37d9-b4ae-62c06e5ad4e3', 'Bahasa Indonesia', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('de21a4c4-fa50-3020-b782-b78c4a0e3a59', 'f2bf4f82-1fe0-3364-8827-1f659a4737df', 'LightSalmon', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('e12c5a3f-00c3-3540-861e-b7996d62e34a', 'bbb376ea-8481-34b5-b14e-75fdbf805fe1', 'Bahasa Indonesia', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('e39fb633-d83d-327f-8ff1-1d7382c68aeb', '78224c01-e531-3448-ad2c-27d6c8483fd5', 'HotPink', '2023-06-22 19:08:48', '2023-06-22 19:08:48'),
('e444c454-8759-3168-80d8-094f64b24efa', 'bd5fcee2-27a0-37d9-b4ae-62c06e5ad4e3', 'Bahasa Sunda', '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', '39c64b12-79fc-3572-918e-b6175c50597c', 'Bahasa Indonesia', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('ee77eeef-b07c-36fe-89cd-8b8012f3419b', '2576e846-5467-3247-973e-f46e2d8994d5', 'DarkTurquoise', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('f177c473-4f6a-347b-89a1-182518bceef1', 'f8635cda-4071-3d00-aa3b-efd9c31e1220', 'Matematika', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('f67ecb5e-5b44-3026-aeb8-b2dcf668f9c1', 'cea43d80-e745-3666-b65f-96294f7cb5a6', 'DarkViolet', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('fa4334d0-1b49-3219-95ff-24348451a400', '851a6233-35d3-3995-a794-4cad0aa0922a', 'LightCyan', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('fbe943d5-dfc2-3628-8654-28dc6c9cc893', '226fd693-578a-3c96-ac2f-a0c154641067', 'Sienna', '2023-06-22 20:43:24', '2023-06-22 20:43:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subject_teachers`
--

CREATE TABLE `subject_teachers` (
  `id` char(36) NOT NULL,
  `subject_id` char(36) NOT NULL,
  `teachers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`teachers`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `subject_teachers`
--

INSERT INTO `subject_teachers` (`id`, `subject_id`, `teachers`, `created_at`, `updated_at`) VALUES
('09c89cc0-c3dd-34f5-a49f-74bef9e27983', '909d7805-eb8c-333b-bd58-efd9967bf307', '[\"68c3f461-d913-38f9-bd21-6a3ce41926b3\"]', '2023-06-22 20:43:24', '2023-06-22 20:43:24'),
('108d528b-6cc3-3612-bc30-af6bdeeb39b1', 'c4b24553-92b8-389e-91c0-7efe80ea3762', '[\"\"]', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('1a5e417c-6d6f-3458-aee2-4c62d90474a8', 'a215f746-4260-37bf-b239-77f0bd0df7b2', '[\"c1fb4911-3eeb-3549-a973-ea338138ca7b\"]', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('2dd3fdc7-3abe-3b10-ab68-016c9129fcc0', 'f177c473-4f6a-347b-89a1-182518bceef1', '[\"c1fb4911-3eeb-3549-a973-ea338138ca7b\"]', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('3455810a-7513-3d36-9aa0-91c168a264b9', '34745c58-1686-3348-96f6-c49b05c4c392', '[\"\"]', '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('41c151b5-4ba9-37fe-a16c-4dcad2d75719', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', '[\"935f3a04-2bb0-30e0-aef5-ace4185fbf5e\"]', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('5490a190-e50c-3628-ae8b-011769703d64', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', '[\"0de19d3a-b271-3305-8e75-c31ab5bc68e8\"]', '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('5ee7cb78-ea40-372e-9148-d3e12b8b6697', '492dfe13-292c-307c-864a-b4a3cbab5be1', '[\"e2d8eeae-3a7f-3fc2-8438-c362a7dead03\"]', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('6206d4b7-f837-33dc-a281-90a3042ebf43', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', '[\"68c3f461-d913-38f9-bd21-6a3ce41926b3\"]', '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('71b4b2cc-8e3f-333b-8073-8726e1de4470', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', '[\"d5a23f56-6f39-3ba5-b083-dec17ce5e159\"]', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('72ce3792-fd2a-3920-ac5d-8e927492ccb6', '0fc8d020-a840-352f-aace-5b4983de575f', '[\"0de19d3a-b271-3305-8e75-c31ab5bc68e8\"]', '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('73d4dcb0-984c-4475-8d77-ccb5defd3755', '890565fb-fd2c-45d3-869e-01521b79cbba', '[\"68c3f461-d913-38f9-bd21-6a3ce41926b3\"]', '2023-06-22 20:59:29', '2023-06-23 06:45:37'),
('7fed2655-e759-309a-9220-44d726a7cafa', '521aca4d-98d2-3c5d-a19d-e9db04c16261', '[\"c1fb4911-3eeb-3549-a973-ea338138ca7b\"]', '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('8a5333f8-ee31-3bdf-9cba-db6e5584accf', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', '[\"935f3a04-2bb0-30e0-aef5-ace4185fbf5e\"]', '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('9a598d8c-a97e-3314-b51f-018139e27d31', '2976f6dd-1861-39f0-88e4-9612b65b20ee', '[\"0de19d3a-b271-3305-8e75-c31ab5bc68e8\"]', '2023-06-22 20:40:34', '2023-06-22 20:40:34'),
('ac8181fd-23d9-3beb-bf28-283e8ddfa92f', '277381c6-e45a-332b-b680-432db961876e', '[\"e2d8eeae-3a7f-3fc2-8438-c362a7dead03\"]', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('b15665a9-15f2-31f0-ad45-107704c97ea8', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', '[\"\"]', '2023-06-22 19:07:25', '2023-06-22 19:07:25'),
('bc8b1294-7b68-3426-a900-f800ea95d350', '0efb3e24-701b-35f6-aae8-c926ff532f73', '[\"ca92695b-aab3-4351-9a62-41a37fe34cb6\",\"dc107aeb-f678-4624-b22d-87a06b7b174c\"]', '2023-06-22 20:43:24', '2023-06-23 04:38:26'),
('bd73ee9f-367a-4712-bd6c-17f3ea1e5ec9', 'ade59952-8e70-4994-ab1a-39f85ac51929', '[\"c1fb4911-3eeb-3549-a973-ea338138ca7b\"]', '2023-06-22 20:00:34', '2023-06-22 20:00:44'),
('bd9031ca-5142-3803-828f-8407b2af0055', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', '[\"54d425e7-0511-3fe6-b10c-398620af67fa\"]', '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('ca9d8461-2d56-3b7b-88d8-31c24105af3e', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', '[\"e191a7e5-c9e3-4e8a-9135-b9d8c119b650\"]', '2023-06-22 13:56:44', '2023-06-22 14:00:15'),
('cd632c3c-cc36-31d2-9ed9-2270675fe35b', 'cb53239a-b823-363d-966f-3cec488f6d4d', '[\"d5a23f56-6f39-3ba5-b083-dec17ce5e159\"]', '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('e47dd68c-c897-30e3-8b69-0c7cb22263dc', '741e6ed6-b86d-391d-a9e1-e623233ccf89', '[\"e2d8eeae-3a7f-3fc2-8438-c362a7dead03\"]', '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('f541ea9f-22dc-3121-a4c0-2a80c18c6930', 'e444c454-8759-3168-80d8-094f64b24efa', '[\"54d425e7-0511-3fe6-b10c-398620af67fa\"]', '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('fdd5f7e1-2296-32a5-b361-93e73106d20c', 'daf26725-556c-364f-b08a-e36b7dabbd92', '[\"54d425e7-0511-3fe6-b10c-398620af67fa\"]', '2023-06-22 13:40:23', '2023-06-22 13:40:23'),
('ffed6a17-29a3-3107-a91e-c9ddc2510735', '4a8b7386-1053-3817-85ef-2ef72b0405f7', '[\"935f3a04-2bb0-30e0-aef5-ace4185fbf5e\"]', '2023-06-22 18:25:14', '2023-06-22 18:25:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `topics`
--

CREATE TABLE `topics` (
  `id` char(36) NOT NULL,
  `course_id` char(36) NOT NULL,
  `subject_id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `order` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `topics`
--

INSERT INTO `topics` (`id`, `course_id`, `subject_id`, `name`, `order`, `created_at`, `updated_at`) VALUES
('011ac731-6371-3f2a-a0f2-27d394dfe3b7', 'a4810048-be60-31da-89de-78fe741fbdfb', '34745c58-1686-3348-96f6-c49b05c4c392', 'Angelica Lakin', 10, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('01eaa463-68b8-3ca8-bebe-db3c0bcca49f', 'a2238f78-5284-3c51-8ff6-0ddb7ab05f3f', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Wendell Kunze DDS', 8, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('021e839a-5451-34ef-86e2-19803184aa11', '65bd514e-ad73-3d4d-a67b-d34d7ca1d5ae', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Emmet Kling III', 16, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('0253cc61-9d62-36b7-a116-3db64b24deec', '0bd0b875-9e44-31d1-b39a-44751b89a047', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Mohamed Mertz', 16, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('02f321ec-5521-3187-99da-d8f54588928a', 'a46c4225-5fef-32b4-9dfc-35457033d6d4', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Florine Fritsch', 2, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('02fe4785-c64b-3323-a3ad-49e93ed3e888', '0887448c-3d80-33ad-abbd-719b8a2bd426', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Jaida Weimann', 8, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('03309cad-fe62-3cb2-aca5-1dbe8b2de40f', 'badc3c32-3a7b-3409-ad5b-d7f9c67b72f6', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Ms. Augusta Donnelly III', 15, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('03ccd1d3-1e71-3750-9f56-404581df0d2e', 'a1259090-9088-3620-9328-19c20f220ab5', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Ms. Amelia Kuhic MD', 15, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('0502abd4-ebd5-3c9c-94de-5b52fc869214', '81632086-6739-38cf-8af8-b436acdcdf78', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Vicenta Baumbach', 7, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('05234f31-b911-3331-b8d3-4b8c5c513a31', 'fb7b5286-8ba9-3597-9bee-b3d313871e10', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Letitia Thiel III', 17, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('052fb810-6977-32c1-a3f2-22d5ce6eafab', '29c7939f-8e96-340d-ba91-2e3cd80cfb05', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Duncan Witting', 16, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('07724e88-7b61-3d19-91fa-3eb661311ecf', '2f7d16d6-93a6-3c93-ac2e-a1418eaa8d3d', '277381c6-e45a-332b-b680-432db961876e', 'Lorine Sipes', 13, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('0785d5b7-aa9c-34f9-9cbc-5f1e437de9f6', 'a4810048-be60-31da-89de-78fe741fbdfb', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Bennett Becker', 7, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('0786dac6-c9c9-3ad1-85ee-9b3c3088ff40', 'ebf5a801-74d1-3e0a-a6ee-b9e0078180f7', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Donnie Pollich', 8, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('07ad9666-5743-3d64-8864-a20c12279cd8', '94383d63-959f-3922-9645-e7fb36f3e2d8', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Columbus Stracke', 20, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('095730ad-dfb8-3b2c-9bab-f7ebf722e18d', 'a46c4225-5fef-32b4-9dfc-35457033d6d4', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Prof. Toy Feil', 5, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('09cf3866-d3ab-334c-bb07-3d8e939b96d2', '2b9a77dd-df61-36c4-8315-4ac465529c1b', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Mabelle Fahey', 14, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('0a246379-86ae-3064-a898-fa90a931ca15', 'd5d0f32a-37e3-39e3-88fd-6f048c693a1b', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Mekhi Feil', 18, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('0aed987f-b633-38a6-9c35-88e848123cc7', '94383d63-959f-3922-9645-e7fb36f3e2d8', 'e444c454-8759-3168-80d8-094f64b24efa', 'Vella Towne', 6, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('0ba79a8b-1efb-3433-b823-678cac3441f8', '94383d63-959f-3922-9645-e7fb36f3e2d8', 'e444c454-8759-3168-80d8-094f64b24efa', 'Prof. Davin Boehm III', 16, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('0ba9a756-ff60-3558-a391-a08ae866202a', 'e647cdb0-b15f-3b99-be32-94aaad448636', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Prof. Horace Nikolaus', 11, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('0c2e7437-8367-316c-a3a8-390489dd92dd', '5d83fc4f-e1de-3de4-a951-26fd0bb30f7d', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Miss Lyda Glover III', 10, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('0c9d31e5-afc6-32bf-81e2-5322ca8997eb', 'a4810048-be60-31da-89de-78fe741fbdfb', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Raymond Reichert II', 12, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('0d46d234-68b6-3eab-a649-40d0fe471215', '671f6a60-4860-303f-a489-4f23b850ccef', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Keara Beer', 11, '2023-06-22 19:08:50', '2023-06-22 19:08:50'),
('0d58f14f-f2d6-3a50-81f3-543e1c406d38', '2f7d16d6-93a6-3c93-ac2e-a1418eaa8d3d', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Domenick West', 4, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('0d9b42a1-a6ec-3ec6-82a9-7abaea15d65c', '5bb03ed8-00d0-30d6-b726-c69d267feb0b', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Myles Kozey', 20, '2023-06-22 19:08:50', '2023-06-22 19:08:50'),
('0dd64342-70eb-3184-893d-58e684f263ed', '6371610f-c154-370d-b867-c418aa087c76', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Travis Weber', 16, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('0e295059-25b1-38ac-8482-a400c52227aa', 'e3e3449a-6c9b-3c5e-9c3b-582a26cd3edc', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Benedict Hyatt', 6, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('0e4cd374-d1a7-38d6-9413-d66ec213c023', 'a1259090-9088-3620-9328-19c20f220ab5', '34745c58-1686-3348-96f6-c49b05c4c392', 'Prof. Zakary Rutherford', 3, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('0e909280-a9f2-35c8-b690-619e063046d1', '70024b6c-198b-3cc5-90d5-3bb70a3d1662', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Prof. Alexandria Parisian', 18, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('0f16c274-d7ba-394d-8af9-d7e6873de1ab', '36dc1134-3395-3ec9-809c-6a2d36d1fb1c', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Beth Kiehn II', 6, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('10a34bfd-4fa9-307f-932e-2247dbc094a4', '5da1ef8d-4fd1-396c-9f41-6f2ddb0ed4e6', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Miss Loyce Schaefer Sr.', 8, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('10b24567-98c6-3390-9a9d-8ee74dafce37', 'a2238f78-5284-3c51-8ff6-0ddb7ab05f3f', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Ms. Gertrude Terry', 9, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('10e0d348-8869-34aa-b67a-1ddb04407912', 'ebf5a801-74d1-3e0a-a6ee-b9e0078180f7', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Ignatius Romaguera', 17, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('11430f54-e2e3-3f38-8c8e-c4a1b217144e', '65bd514e-ad73-3d4d-a67b-d34d7ca1d5ae', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Mr. Uriel Cummings', 7, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('11c387ba-d363-3068-a8e6-66d26cdb8b06', 'a12c4c3c-30a3-3644-80e1-445f4dac1f1f', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Tressa Raynor', 17, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('11fbd333-5cd1-3691-bdfa-471065a9a0d2', '7780f041-36f9-37c7-ac6d-bd0d56d0ae60', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Frieda VonRueden', 17, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('12c466dd-59be-30fb-8c04-5d1d43f39705', 'e3e3449a-6c9b-3c5e-9c3b-582a26cd3edc', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Prof. Rowena Wisoky V', 18, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('12c82157-ea5a-3285-97c0-a17bd6b21adf', '9bd97676-2d6e-31c1-95b5-f21a097cc3df', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Hattie Moen', 14, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('1385bbe0-b275-3d52-aca1-b5c504f7d861', '924e0c9c-cf55-36bd-85fc-f631112c060a', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Haylee Price', 16, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('1436b60c-3843-3c23-b067-6dfd9758cbf6', 'f8ae75e0-e4c9-378a-979f-2c003d4ad2be', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Aiyana Emmerich', 14, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('14599766-8807-3cc6-9c6f-5bdc4f446def', '1a746f65-f8a0-3129-a444-4aaed05269b2', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Mr. Vicente Becker', 2, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('153a0262-4145-3f8f-af36-99ce51cc68df', '34364da3-83f2-3ee4-a207-7c296aeaec67', '0fc8d020-a840-352f-aace-5b4983de575f', 'Dayna Sipes', 9, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('153ceba0-a01d-3ce7-91df-29a47a89936a', 'ac1d534f-0bf5-37ad-b33a-3d4fd370d257', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Kayden O\'Keefe', 3, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('1556aa8f-d687-3d1e-9119-e97fc0b8fd18', '7780f041-36f9-37c7-ac6d-bd0d56d0ae60', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Otis Ziemann', 7, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('158701f0-a496-3d8a-a005-f555274e979b', '6bc7a4f3-0dfa-3364-8285-8993011acf9d', 'e444c454-8759-3168-80d8-094f64b24efa', 'Fae Walker', 16, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('167a12ea-c9b5-310c-a5c4-5408ba60ef1c', 'e061e933-8a8e-36c6-8bc1-1e72d08ea8c9', '0fc8d020-a840-352f-aace-5b4983de575f', 'Alphonso Quigley', 13, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('17f7b975-0ce8-362b-a6a4-583c33834c0b', 'e061e933-8a8e-36c6-8bc1-1e72d08ea8c9', '0fc8d020-a840-352f-aace-5b4983de575f', 'Renee Cassin', 15, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('1942f01a-110d-3c16-ae7a-1f5970a2ce4a', '181516e2-0292-354a-bd23-512b20390270', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Orland Heathcote', 4, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('19b047fe-1d50-3132-8ac8-b70dd29c10de', '34364da3-83f2-3ee4-a207-7c296aeaec67', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Zita Rempel', 14, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('19d852ac-7825-3519-8f05-f29149941da9', 'da17d3ff-5ba7-3229-88be-ac766491fccf', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Wanda Stanton', 9, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('1c340cd5-2204-3943-bd00-d6eeb7df1710', 'a4810048-be60-31da-89de-78fe741fbdfb', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Prof. Maybelle Crist', 5, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('1cf9454a-5dcf-357c-8ab9-69331d328029', '80c7fbd5-c396-38da-af7f-9248b36f96f9', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Edison Schimmel', 20, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('1cfbedfb-9ef3-341a-9f75-6886e7b1af79', '0bd0b875-9e44-31d1-b39a-44751b89a047', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Kip DuBuque', 18, '2023-06-22 19:08:50', '2023-06-22 19:08:50'),
('1e4451f5-021b-3237-ab2a-488a4d8d5ce2', '5d83fc4f-e1de-3de4-a951-26fd0bb30f7d', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Gerald King', 14, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('1eb2ed98-b203-3d5c-b2d8-4e8a7bca5884', '9bd97676-2d6e-31c1-95b5-f21a097cc3df', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Dr. Esteban Wuckert', 9, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('1ed1dde9-9b04-301d-aecc-d68c63289084', 'a4810048-be60-31da-89de-78fe741fbdfb', '34745c58-1686-3348-96f6-c49b05c4c392', 'Jaylen Moen DDS', 12, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('1ee99e8b-d6b6-32fa-a6bd-7b785a02b446', '94ab2abe-84ca-3c65-a628-7a3ebb2e8613', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Lilyan Gaylord', 4, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('1f3f0ab7-8f8d-361e-8368-2eca2d91ca38', '9bd97676-2d6e-31c1-95b5-f21a097cc3df', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Maribel Rau', 7, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('1f65bd15-d847-3b64-835e-70829855d128', 'ebf5a801-74d1-3e0a-a6ee-b9e0078180f7', '0fc8d020-a840-352f-aace-5b4983de575f', 'Rebecca Kirlin DDS', 8, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('20b639fb-f795-389c-bc8d-185294633a79', '181516e2-0292-354a-bd23-512b20390270', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Dedrick Langworth', 18, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('216393be-6f40-373f-9c1a-4bd6e96781f2', 'b4160579-9eb8-3e15-b5ba-67b0264fe9f1', 'e444c454-8759-3168-80d8-094f64b24efa', 'Ubaldo Little', 16, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('21ad991d-6030-32cc-90b4-1445600b9d06', '70024b6c-198b-3cc5-90d5-3bb70a3d1662', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Dr. Carissa Boyer V', 6, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('230dfc03-28e7-3057-b611-3f4dc92d32e4', 'f8ae75e0-e4c9-378a-979f-2c003d4ad2be', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Prof. Tyra Walker DVM', 18, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('23c8fd4d-592d-3e4c-ba60-a7d662028b3f', '0162d552-cc48-392e-99b2-0bc0c8218fb8', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Hannah Deckow', 19, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('240782f3-24c9-3337-b3b3-a8af79e1ee7e', '94ab2abe-84ca-3c65-a628-7a3ebb2e8613', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Tito Swift', 11, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('24523b7f-84e5-314f-8be0-a766020994ae', '00153d03-0571-3aed-a210-8c6ab0aadb51', '0fc8d020-a840-352f-aace-5b4983de575f', 'Alessandro Turcotte', 17, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('24548e1b-4631-36c2-bfb5-440042b2a7d1', 'badc3c32-3a7b-3409-ad5b-d7f9c67b72f6', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Prof. Damien Terry IV', 14, '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('24c57735-021b-3c6b-9c77-227915637727', 'a2238f78-5284-3c51-8ff6-0ddb7ab05f3f', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Jordon Lynch', 14, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('256d3e6c-c3a7-3d35-baca-02ce78e4c5e2', 'fb7b5286-8ba9-3597-9bee-b3d313871e10', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Hal Davis', 6, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('25cb9bb8-6a60-3831-b2ff-02eae9c4fb22', 'a12c4c3c-30a3-3644-80e1-445f4dac1f1f', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Dr. Kaylee Mayer', 12, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('2652591b-6dc2-3fb2-82db-80f07125a2c5', '29c7939f-8e96-340d-ba91-2e3cd80cfb05', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Mr. Johnpaul Jerde MD', 2, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('274775ab-d23d-32dc-8753-bbf5612589ce', 'e647cdb0-b15f-3b99-be32-94aaad448636', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Leora Kreiger III', 17, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('27988736-d2ef-3c1e-ac9d-eb6dd5bfb9a1', 'f8ae75e0-e4c9-378a-979f-2c003d4ad2be', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Cole Lehner', 12, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('28069e7d-e9b3-3e0d-a651-9b5a11d2661f', '0887448c-3d80-33ad-abbd-719b8a2bd426', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Mohammed Shields MD', 4, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('28272893-bcd9-3d50-85f1-75de38da3fbc', '29c7939f-8e96-340d-ba91-2e3cd80cfb05', '34745c58-1686-3348-96f6-c49b05c4c392', 'Ms. Megane Ryan V', 1, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('29eeb7d7-f32d-3361-8c45-a994f9e00be6', '0162d552-cc48-392e-99b2-0bc0c8218fb8', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Enola Hermann', 13, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('2a100f03-dac4-38a1-b584-46f76360253c', '9bd97676-2d6e-31c1-95b5-f21a097cc3df', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Mr. Laverna Terry', 2, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('2ab9386c-4e30-3f27-8574-4c4ff61784b0', 'b4160579-9eb8-3e15-b5ba-67b0264fe9f1', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Nathen Ryan', 4, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('2bcd46e8-2814-3500-9e4c-47ea40100fe2', '5bb03ed8-00d0-30d6-b726-c69d267feb0b', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Lilla Kassulke', 6, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('2bcf8f7b-ee23-37e7-a446-cb568ac2da93', '671f6a60-4860-303f-a489-4f23b850ccef', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Rosella Rutherford', 10, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('2c903364-f897-3ed3-9180-b3c917abbf5c', '94383d63-959f-3922-9645-e7fb36f3e2d8', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Dan Orn', 8, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('2dcb9aaf-4abc-3b78-bcce-1f0fe96d1420', '29c7939f-8e96-340d-ba91-2e3cd80cfb05', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Clementine Lakin', 20, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('2e0e872b-b33d-35c7-8bd5-5ce9c3f9a567', 'e3e3449a-6c9b-3c5e-9c3b-582a26cd3edc', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Bria Blanda', 6, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('2e5b17cf-f85d-366c-bd43-0fb834826698', '00153d03-0571-3aed-a210-8c6ab0aadb51', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Hassan Lebsack', 15, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('2e91225e-87c8-3dd6-8da9-870ceb7c4485', '924e0c9c-cf55-36bd-85fc-f631112c060a', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Celestine Hermann', 14, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('2ee0c6e6-5c0e-32e8-9d29-8b467a50f908', 'da17d3ff-5ba7-3229-88be-ac766491fccf', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Nellie Schinner', 16, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('2f1e640a-03a4-3467-aa73-c170cb8b6adc', '5d83fc4f-e1de-3de4-a951-26fd0bb30f7d', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Demario Lind', 20, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('2f593e06-e406-3f80-8e4d-a5d75f86c296', 'a1259090-9088-3620-9328-19c20f220ab5', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Mrs. Alexandria Murazik', 9, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('30b6533e-7656-384d-b7a7-c9f50c8449b2', 'b4160579-9eb8-3e15-b5ba-67b0264fe9f1', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Hilbert Spinka', 19, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('31883708-dfb4-3769-8f59-028f44864898', '7780f041-36f9-37c7-ac6d-bd0d56d0ae60', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Aileen Maggio', 4, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('32fa4030-c694-3166-8bc7-d7a8b8487d11', '7780f041-36f9-37c7-ac6d-bd0d56d0ae60', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Elda Bergstrom DVM', 19, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('3586e14b-06ff-3bdf-8420-86bde9d53645', '671f6a60-4860-303f-a489-4f23b850ccef', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Jovanny Deckow', 11, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('36644ff8-7250-3497-a294-11cf2d153172', '6371610f-c154-370d-b867-c418aa087c76', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Mr. Americo Beatty Jr.', 13, '2023-06-22 19:08:50', '2023-06-22 19:08:50'),
('368baaa4-bd0a-3349-a416-d0761a1e3f34', '5da1ef8d-4fd1-396c-9f41-6f2ddb0ed4e6', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Dejon Hermann', 7, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('36d1b8e4-349e-3852-be16-f1487536b20f', '80c7fbd5-c396-38da-af7f-9248b36f96f9', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Rosalee Gerlach DVM', 19, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('36e7e8bc-7647-391a-aac1-fdc5a7526773', '0bd0b875-9e44-31d1-b39a-44751b89a047', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Alec Harvey', 20, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('36fe57d7-c039-36b5-ba83-aa9e042b485c', '6a124efb-6fcd-359a-9ce4-7ad3bccd4b1b', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Magnolia King', 11, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('370e657a-937c-3dfa-bb5b-4800a12eb880', 'e647cdb0-b15f-3b99-be32-94aaad448636', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Valentin Bogisich', 1, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('372b3de3-f850-38a8-9898-dee7bd176f3f', 'b4160579-9eb8-3e15-b5ba-67b0264fe9f1', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Lauren Parisian', 15, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('385cfaba-1f74-41b9-8af6-869affa83fc3', 'de86e3c4-8677-42ee-ae00-cf5d75731c3e', '890565fb-fd2c-45d3-869e-01521b79cbba', 'bab 3', 22, '2023-06-23 06:47:29', '2023-06-23 06:47:29'),
('38bb4139-ea41-3513-83a6-5e4d2dde9ad3', '2b9a77dd-df61-36c4-8315-4ac465529c1b', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Dr. Grace White', 8, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('39a0ed9a-4973-3d13-888f-c09612e6b4a7', 'a46c4225-5fef-32b4-9dfc-35457033d6d4', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Brown Marvin', 20, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('3a6b9a8c-e576-3f22-9c55-7735b92d8dba', 'da17d3ff-5ba7-3229-88be-ac766491fccf', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Halle Feest', 20, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('3b71bf5a-5466-3cb9-a450-02295be163a6', '65bd514e-ad73-3d4d-a67b-d34d7ca1d5ae', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Una Doyle', 4, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('3cc55526-de7f-3280-840a-651e9a35e492', 'a1259090-9088-3620-9328-19c20f220ab5', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Zetta Powlowski', 1, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('3d33fd4a-356c-3069-9c65-00cb128e9581', '36dc1134-3395-3ec9-809c-6a2d36d1fb1c', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Prof. Raven Ziemann MD', 17, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('3d7334d7-1424-33e4-b3f2-a0a109291a78', 'e1228b2f-63d4-3cae-af07-5e4d5a6cab0c', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Athena Greenholt II', 14, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('3dc30b8d-bcaf-3fe1-a127-6b8c76879448', 'ebf5a801-74d1-3e0a-a6ee-b9e0078180f7', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Ricardo Marvin', 9, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('3e2059f4-1939-3432-980f-063f1aaaf864', 'f8f9374a-1e9d-3c99-80e5-9b66c400a3d4', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Lexi Mann DDS', 11, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('3e47514f-9fab-3e52-9de4-10320fb6cdab', '36dc1134-3395-3ec9-809c-6a2d36d1fb1c', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Lacey Cruickshank', 18, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('3e697946-0854-3125-b094-1a181173becc', '9bd97676-2d6e-31c1-95b5-f21a097cc3df', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Hailey Hansen', 11, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('3f7e8da2-fc8b-3f2e-bc4f-e0420ca9ac47', 'f8ae75e0-e4c9-378a-979f-2c003d4ad2be', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Mr. Alan Morar', 17, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('3fbaa315-31ef-3e3d-91e7-6fefc545d087', 'badc3c32-3a7b-3409-ad5b-d7f9c67b72f6', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Dr. Cory Mann PhD', 15, '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('411ae2d2-af35-3bc7-abd4-f3fc79d5398b', 'e647cdb0-b15f-3b99-be32-94aaad448636', '277381c6-e45a-332b-b680-432db961876e', 'Erich Maggio', 13, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('42038b6b-53f2-3bc6-a2d1-0bec0e32f785', '6a124efb-6fcd-359a-9ce4-7ad3bccd4b1b', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Raoul Farrell', 18, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('4239c7a5-bf07-3895-aa51-41fe5d4c77b9', 'a2238f78-5284-3c51-8ff6-0ddb7ab05f3f', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Sage Schuppe', 16, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('42e0bc15-e6c9-3f14-a28b-9deb49b029e8', '34364da3-83f2-3ee4-a207-7c296aeaec67', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Mr. Justice Bahringer', 18, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('43472347-6c4c-35a8-828b-dd227f2368df', '94383d63-959f-3922-9645-e7fb36f3e2d8', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Raul Jacobi', 11, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('43cc190f-ff17-3b35-827e-f20dd17f68da', 'fb7b5286-8ba9-3597-9bee-b3d313871e10', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Mr. Monserrat Parisian', 1, '2023-06-22 19:08:50', '2023-06-22 19:08:50'),
('44320a60-b508-3d52-9d73-8f0d18e7c127', '6a124efb-6fcd-359a-9ce4-7ad3bccd4b1b', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Mr. Okey Quitzon', 9, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('44a43e4c-54f3-39d5-b534-bac97fdf3f85', '65bd514e-ad73-3d4d-a67b-d34d7ca1d5ae', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Cornelius Luettgen', 17, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('455221ae-156d-36bb-a436-65caec675793', '94ab2abe-84ca-3c65-a628-7a3ebb2e8613', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Dr. Dudley Leffler DDS', 3, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('45fcfca5-3ceb-30a3-8319-44f237593f31', '65bd514e-ad73-3d4d-a67b-d34d7ca1d5ae', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Doug Mann IV', 3, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('48291875-80bc-36ad-8428-de5e1feb2f5e', 'adb68089-b50d-3f91-ab71-a8d3929cafd4', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Alba Graham', 20, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('486e44a6-b34e-3a8e-8012-162be60a6dc0', '5bb03ed8-00d0-30d6-b726-c69d267feb0b', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Okey Schowalter', 17, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('48fd54da-cbac-3b2e-85e5-058615e97022', '5da1ef8d-4fd1-396c-9f41-6f2ddb0ed4e6', '34745c58-1686-3348-96f6-c49b05c4c392', 'Asia Wintheiser', 3, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('4a0c61a8-30a8-3c1b-a936-f55ea119f510', '6371610f-c154-370d-b867-c418aa087c76', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Stephon Lemke V', 12, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('4a2e1e37-9177-39b5-a0ae-17759535fa50', '6371610f-c154-370d-b867-c418aa087c76', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Lorna Collier III', 20, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('4acf14ac-f888-3fb0-ad32-34b691acabaa', 'a12c4c3c-30a3-3644-80e1-445f4dac1f1f', 'e444c454-8759-3168-80d8-094f64b24efa', 'Mr. Godfrey Hansen', 20, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('4b89be60-5d6c-3665-baf5-3b74aaab0e8d', '94ab2abe-84ca-3c65-a628-7a3ebb2e8613', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Bell Littel', 16, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('4be9cbad-4ecd-3e50-84ff-a0081ed3957f', '34364da3-83f2-3ee4-a207-7c296aeaec67', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Frieda Cummings', 12, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('4d3fa989-9af6-3f71-8aff-7b7c6411a6a0', '96e637e5-773b-39f7-bbdc-8721228fe987', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Mellie Greenholt DDS', 6, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('4e7cd13c-48db-3fb9-8993-b290bfa865dd', '6371610f-c154-370d-b867-c418aa087c76', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Alec Larson', 14, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('4ef6af54-db78-35d6-8d8e-98214c81a9c2', 'b4160579-9eb8-3e15-b5ba-67b0264fe9f1', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Fleta Greenfelder', 3, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('4efe0cf5-a042-3790-b692-560dbcfcd4c0', 'badc3c32-3a7b-3409-ad5b-d7f9c67b72f6', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Lazaro Barton', 1, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('4f47f5a1-8519-3891-8c6e-2a983a2e1502', 'a2238f78-5284-3c51-8ff6-0ddb7ab05f3f', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Mrs. Mae Rosenbaum MD', 10, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('4f494571-f64a-3db8-8649-ec39b70b7211', '36dc1134-3395-3ec9-809c-6a2d36d1fb1c', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Walker Carter', 14, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('4f5c1f6b-38e0-3ba1-a593-48f4fab99204', 'e061e933-8a8e-36c6-8bc1-1e72d08ea8c9', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Eldora Bailey', 17, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('4fa3af83-6fda-35be-9c5c-a964d1133546', 'f8ae75e0-e4c9-378a-979f-2c003d4ad2be', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Tracey Torphy', 16, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('4fce9bba-fd2a-3861-a9cd-8adf6b03a785', 'ebf5a801-74d1-3e0a-a6ee-b9e0078180f7', '0fc8d020-a840-352f-aace-5b4983de575f', 'Myrna Pfannerstill', 14, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('4ff67ea9-f782-317c-9127-0addc746bca7', 'ac1d534f-0bf5-37ad-b33a-3d4fd370d257', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Lori Luettgen', 5, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('50abe5ac-2c6e-3964-a216-3ceefc65def9', 'b4160579-9eb8-3e15-b5ba-67b0264fe9f1', 'e444c454-8759-3168-80d8-094f64b24efa', 'Dr. Dudley Mraz', 10, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('50e74d10-09ec-32a3-be69-26e3d7ac73d0', 'd5d0f32a-37e3-39e3-88fd-6f048c693a1b', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Prof. Ara Williamson DVM', 6, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('50ff98e6-d3c0-3d19-a9fd-c37cb90dffa3', '2f7d16d6-93a6-3c93-ac2e-a1418eaa8d3d', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Freda Gorczany', 2, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('51d90e80-9a94-3a18-9ce5-94459ff19317', '924e0c9c-cf55-36bd-85fc-f631112c060a', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Rodrigo Hill', 9, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('52f23415-ba17-3b2f-b350-31f57a575e19', '5bb03ed8-00d0-30d6-b726-c69d267feb0b', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Jayda Heidenreich', 7, '2023-06-22 19:08:50', '2023-06-22 19:08:50'),
('53712e17-e3c3-3cc7-b3d8-2f347b08b6c5', 'e1228b2f-63d4-3cae-af07-5e4d5a6cab0c', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Lorena Fadel', 9, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('54032379-a0e8-39d0-90f2-13b250f96ac3', 'f8ae75e0-e4c9-378a-979f-2c003d4ad2be', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Mr. Cameron Jacobs IV', 6, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('54aa0d3c-e830-363a-a412-635f6441f191', 'a12c4c3c-30a3-3644-80e1-445f4dac1f1f', 'e444c454-8759-3168-80d8-094f64b24efa', 'Deborah Anderson', 3, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('55432841-8419-39a0-8b89-ac9bddcfb085', 'f8f9374a-1e9d-3c99-80e5-9b66c400a3d4', 'e444c454-8759-3168-80d8-094f64b24efa', 'Wade Macejkovic MD', 6, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('5621661d-39a6-3235-8b4a-dcb8937671a2', '81632086-6739-38cf-8af8-b436acdcdf78', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Ms. Kaylin Purdy', 1, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('57046bd9-3b0c-3ebf-9818-6be49d83f589', '96e637e5-773b-39f7-bbdc-8721228fe987', '277381c6-e45a-332b-b680-432db961876e', 'Garnet Larkin', 18, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('5730b566-5592-38d7-8742-ad6455eff28e', '70024b6c-198b-3cc5-90d5-3bb70a3d1662', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Jayden Feest', 14, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('578d1b5a-2de1-3d0c-b1a5-27dd5a1a5343', '96e637e5-773b-39f7-bbdc-8721228fe987', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Prof. Cierra Bergnaum IV', 13, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('584e67bb-c2ce-3bf6-8209-7b160fd782ae', '5d83fc4f-e1de-3de4-a951-26fd0bb30f7d', '277381c6-e45a-332b-b680-432db961876e', 'Dr. Aditya Beer IV', 2, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('58b35ff3-e4f9-3f3c-9749-ad189921241a', '80c7fbd5-c396-38da-af7f-9248b36f96f9', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Archibald Hagenes', 11, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('5981f06d-d856-38e2-a427-3c330826de8d', '00153d03-0571-3aed-a210-8c6ab0aadb51', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Mr. Adrien Marks I', 19, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('598a0ec8-33c5-3b21-b933-08458f276990', '1a746f65-f8a0-3129-a444-4aaed05269b2', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Crawford West', 10, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('5a30eea6-7949-34a9-9cfb-516fcf4234b5', '7780f041-36f9-37c7-ac6d-bd0d56d0ae60', '0fc8d020-a840-352f-aace-5b4983de575f', 'Callie Bartell', 10, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('5a6d11c1-a209-3a8c-a083-9eff79472964', 'da17d3ff-5ba7-3229-88be-ac766491fccf', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Prof. Marcelo Kuhlman', 9, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('5afe9f27-a75a-3971-b204-db4b5997e780', 'e061e933-8a8e-36c6-8bc1-1e72d08ea8c9', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Carmen Romaguera', 13, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('5c3f5dec-f754-3168-9597-ad56d2f35640', '5d83fc4f-e1de-3de4-a951-26fd0bb30f7d', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Nella Wehner V', 4, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('5c4289bb-eac5-3411-b163-beafddedb237', '65bd514e-ad73-3d4d-a67b-d34d7ca1d5ae', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Kadin Mraz', 3, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('5d71e1e5-f21e-32c0-abba-d21a0b131f95', '9bd97676-2d6e-31c1-95b5-f21a097cc3df', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Leopold Rowe I', 16, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('5dbfc147-7d5e-3055-bf71-e709bd3b3f44', '81632086-6739-38cf-8af8-b436acdcdf78', '277381c6-e45a-332b-b680-432db961876e', 'Prof. Jarred Becker', 2, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('5df953a9-7bab-3cf9-9c52-d7ddae4c30a6', '181516e2-0292-354a-bd23-512b20390270', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Devon Gerhold', 5, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('5e876faf-1722-34ea-8a39-07b085f07677', '70024b6c-198b-3cc5-90d5-3bb70a3d1662', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Prof. Herta Jast', 2, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('5eb5f593-20f2-3675-a99e-d43c71ba71ef', 'a4810048-be60-31da-89de-78fe741fbdfb', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Taya Kerluke', 5, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('5f7eff28-4f8a-3289-81cb-d5444781070e', 'adb68089-b50d-3f91-ab71-a8d3929cafd4', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Ethel Hayes', 4, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('5f8c5415-3b09-3813-996c-c988606ccb84', '2f7d16d6-93a6-3c93-ac2e-a1418eaa8d3d', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Mr. Trenton Ward V', 15, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('6088c48f-2afc-4bf1-aecc-34d2fcf79c07', '6a124efb-6fcd-359a-9ce4-7ad3bccd4b1b', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'bab aksara sunda', 21, '2023-06-22 20:55:48', '2023-06-22 20:55:48'),
('60be8d64-c988-3d6e-b6b9-5012adf89933', 'fb7b5286-8ba9-3597-9bee-b3d313871e10', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Dusty Koch', 9, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('60bf8a59-7901-3838-87e3-d1e97cdfbaca', '3001194c-d665-3e70-937b-224484a9e4c5', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Irwin Bashirian', 16, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('610b08ae-f9d2-3a9d-aa6f-f146ef16d69c', '36dc1134-3395-3ec9-809c-6a2d36d1fb1c', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Oda Mertz', 18, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('615f203e-ce8a-3e8c-9045-b2af04814530', '181516e2-0292-354a-bd23-512b20390270', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Tracey Jast', 15, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('61db3c2e-7663-33bf-a773-d9ad6472b251', '36dc1134-3395-3ec9-809c-6a2d36d1fb1c', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Prof. William Sporer', 1, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('637e3a16-78b3-3b52-a020-c2dcd7f91228', '1a746f65-f8a0-3129-a444-4aaed05269b2', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Mrs. Loyce Labadie', 10, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('63a870ad-3800-34fb-8c6d-7ba58843eddc', '81632086-6739-38cf-8af8-b436acdcdf78', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Monica Becker', 14, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('64b37d26-a586-3028-aedb-460f113c7f0a', '7780f041-36f9-37c7-ac6d-bd0d56d0ae60', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Jacey Olson', 16, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('655cb90b-1f5c-3a30-ba61-ed6fc389b99c', 'da17d3ff-5ba7-3229-88be-ac766491fccf', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Bennett Skiles', 9, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('659a659e-51f5-39ec-be9a-77890dd4901e', 'a46c4225-5fef-32b4-9dfc-35457033d6d4', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Rubie Schamberger', 20, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('6634e68c-345c-32b1-8071-3c039fae1b21', '00153d03-0571-3aed-a210-8c6ab0aadb51', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Rasheed Cole', 4, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('663ab5c2-1186-3726-9de8-132051e44f33', '2f7d16d6-93a6-3c93-ac2e-a1418eaa8d3d', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Telly Nienow II', 7, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('686276df-8d37-3bd5-b7a4-981d819e1c79', '0887448c-3d80-33ad-abbd-719b8a2bd426', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Mireille Turcotte', 13, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('69d4a740-e1e9-30df-8abe-83821a4847f2', 'd5d0f32a-37e3-39e3-88fd-6f048c693a1b', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Thaddeus Hudson Sr.', 8, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('6a1b560a-9d83-3f9d-934f-ad2a0defc9b6', 'e647cdb0-b15f-3b99-be32-94aaad448636', '277381c6-e45a-332b-b680-432db961876e', 'Mr. Leon Gulgowski III', 14, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('6bf5747e-542e-3313-8a62-af3b3ffa4908', '0bd0b875-9e44-31d1-b39a-44751b89a047', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Angie Rolfson', 13, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('6c1e2fc8-5f3d-36f0-9123-586956e242c4', '5bb03ed8-00d0-30d6-b726-c69d267feb0b', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Miss Dayna Strosin', 17, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('6d97018f-774b-38a9-869c-8131b0add3cf', '0887448c-3d80-33ad-abbd-719b8a2bd426', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Maida Effertz', 10, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('6e00b353-afd6-3637-a488-8dbba05d97d0', '34364da3-83f2-3ee4-a207-7c296aeaec67', '0fc8d020-a840-352f-aace-5b4983de575f', 'Mr. Braxton Farrell III', 15, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('6e312695-0270-3f1b-a362-f975fd9aa811', '0887448c-3d80-33ad-abbd-719b8a2bd426', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Phoebe Dooley', 1, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('6fb587a3-63db-339b-9ed9-c372cf5f6813', 'a12c4c3c-30a3-3644-80e1-445f4dac1f1f', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Matilde Jacobson', 18, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('6fd2fd45-c2a8-3c5b-b7d8-b6a562a0ac67', '2f7d16d6-93a6-3c93-ac2e-a1418eaa8d3d', '277381c6-e45a-332b-b680-432db961876e', 'Prof. Alexzander Krajcik', 3, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('700e7216-5724-3da6-b719-ed952da97b4f', 'fb7b5286-8ba9-3597-9bee-b3d313871e10', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Dolores Doyle', 20, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('714833ba-0f65-30fe-9554-31c6c5868927', '3001194c-d665-3e70-937b-224484a9e4c5', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Dee Rath PhD', 1, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('718e4445-5e2d-39e2-933c-961a9280b88a', '6a124efb-6fcd-359a-9ce4-7ad3bccd4b1b', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Destiny Lind', 7, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('740420b2-d9b2-3980-8e41-83261c9ea15d', 'a2238f78-5284-3c51-8ff6-0ddb7ab05f3f', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Jon Murazik', 20, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('768650d4-0b01-358b-b48c-eee1a2ea7647', 'f8f9374a-1e9d-3c99-80e5-9b66c400a3d4', 'e444c454-8759-3168-80d8-094f64b24efa', 'Aniya Lehner', 3, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('76ca34e7-3892-3085-8436-36829c2d8380', '0162d552-cc48-392e-99b2-0bc0c8218fb8', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Shad Windler', 9, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('77d2c6a8-edee-31d5-8a5f-9932a59040e7', '70024b6c-198b-3cc5-90d5-3bb70a3d1662', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Chadrick Green', 2, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('7823d82c-6505-3215-adf0-a8bd311183df', '3001194c-d665-3e70-937b-224484a9e4c5', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Jeromy Stamm V', 16, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('786d5fd5-19cf-32b7-b89a-ef825049c1eb', 'a2238f78-5284-3c51-8ff6-0ddb7ab05f3f', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Elissa Cartwright Jr.', 2, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('79516903-b6b6-3c4f-acb5-21aa01e25979', '0162d552-cc48-392e-99b2-0bc0c8218fb8', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Dr. Casandra Lowe', 15, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('79cd1c6d-631e-3383-8e7c-4ae529e37b43', 'a12c4c3c-30a3-3644-80e1-445f4dac1f1f', 'e444c454-8759-3168-80d8-094f64b24efa', 'Karen King', 14, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('7aa01ede-ac7e-38cd-b3a3-f2b88235d8dc', '0887448c-3d80-33ad-abbd-719b8a2bd426', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Bonnie Sanford', 19, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('7b451440-d57d-3a7e-ac81-626ce19a7b68', '5d83fc4f-e1de-3de4-a951-26fd0bb30f7d', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Edgardo Nolan', 17, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('7ba16648-bb7c-3055-bb31-29997532d7fa', '5da1ef8d-4fd1-396c-9f41-6f2ddb0ed4e6', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Ignatius Abernathy', 3, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('7c60de9c-29d8-373c-bbd5-855e076d86c9', '6bc7a4f3-0dfa-3364-8285-8993011acf9d', 'e444c454-8759-3168-80d8-094f64b24efa', 'Dr. Wilton Kunze', 17, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('7d08db86-fd23-3220-afa9-1908497536ad', '2f7d16d6-93a6-3c93-ac2e-a1418eaa8d3d', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Joanne Bergstrom', 11, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('7db61dce-5866-3bad-bd81-154d46f37e8a', 'e1228b2f-63d4-3cae-af07-5e4d5a6cab0c', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Ashleigh Kautzer', 8, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('7dd37e81-314d-3a18-91ea-fe3bb2900c30', '96e637e5-773b-39f7-bbdc-8721228fe987', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Mr. Paxton Hoppe', 5, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('7e462b11-ff3c-3d75-809a-8980de928da7', '924e0c9c-cf55-36bd-85fc-f631112c060a', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Mr. Marley Tremblay', 10, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('7fa936c1-e2f9-308e-acd8-ca98cd309e4a', '5da1ef8d-4fd1-396c-9f41-6f2ddb0ed4e6', '34745c58-1686-3348-96f6-c49b05c4c392', 'Issac Vandervort IV', 2, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('7ff72fdf-cf06-353d-9365-d9113ac12c7a', '6bc7a4f3-0dfa-3364-8285-8993011acf9d', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Mr. Mustafa Greenfelder', 16, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('805d9393-63e3-3c6c-8f5c-f6482032a81b', '1a746f65-f8a0-3129-a444-4aaed05269b2', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Leda Erdman', 15, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('808fb1cd-c5d4-38dd-87ee-eead114d5ec7', 'ebf5a801-74d1-3e0a-a6ee-b9e0078180f7', '0fc8d020-a840-352f-aace-5b4983de575f', 'Genevieve Casper', 19, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('80a015e9-b288-36cf-bee2-548cb4dcc584', '924e0c9c-cf55-36bd-85fc-f631112c060a', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Alayna Stanton', 14, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('8159c4c7-607c-3d8b-9edc-825a8c7667f6', '181516e2-0292-354a-bd23-512b20390270', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Theresa Walsh', 7, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('81785e61-99a6-3f7b-b99c-bee4989c8f15', 'fb7b5286-8ba9-3597-9bee-b3d313871e10', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Madaline Abbott', 17, '2023-06-22 19:08:50', '2023-06-22 19:08:50'),
('81d04eb3-797f-3518-add6-d6b22f1f73e9', 'e061e933-8a8e-36c6-8bc1-1e72d08ea8c9', '0fc8d020-a840-352f-aace-5b4983de575f', 'Raegan Grant', 14, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('82e40d70-ad52-3f3c-9dd4-7c32ba859ee3', 'adb68089-b50d-3f91-ab71-a8d3929cafd4', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Lionel Rosenbaum', 4, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('83594b35-11f0-34ba-82c2-c31ccdb55313', 'ebf5a801-74d1-3e0a-a6ee-b9e0078180f7', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Mr. Dorthy Spencer', 10, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('8453b1b6-6c0e-3ecb-897b-884728c9fcb9', 'a1259090-9088-3620-9328-19c20f220ab5', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Coby Parisian', 11, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('84ee4f2e-b773-3fae-ab8b-9ad099747b17', 'd5d0f32a-37e3-39e3-88fd-6f048c693a1b', '277381c6-e45a-332b-b680-432db961876e', 'Elsie Sporer', 10, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('85125aa0-3b37-3f84-829b-ac04e6f44d15', 'a1259090-9088-3620-9328-19c20f220ab5', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Madyson Conn', 15, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('85dde731-8642-3594-80ba-d9b5caf13f7e', 'ebf5a801-74d1-3e0a-a6ee-b9e0078180f7', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Odie Carroll', 9, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('8617128b-a4e9-3d43-8799-b0fdfc9a8f49', 'e3e3449a-6c9b-3c5e-9c3b-582a26cd3edc', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Prof. Paolo Powlowski IV', 10, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('8632a9dc-0633-36e0-badc-e873e82e5b26', '181516e2-0292-354a-bd23-512b20390270', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Loren Treutel', 9, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('876d90f5-b7a0-381c-bf1a-20120eca2330', 'ac1d534f-0bf5-37ad-b33a-3d4fd370d257', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Kenneth Hudson PhD', 14, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('879be356-462f-3e19-af0a-ccd97248f11f', 'adb68089-b50d-3f91-ab71-a8d3929cafd4', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Jaylen Ratke', 7, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('88512ea1-39d0-3ff4-80ed-014af6fdb6ff', '2f7d16d6-93a6-3c93-ac2e-a1418eaa8d3d', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Reilly Heaney', 11, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('888e9594-13d0-35fd-9910-846fd4b5526a', '34364da3-83f2-3ee4-a207-7c296aeaec67', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Penelope Rolfson', 3, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('88facfcf-4de6-30ff-b770-c5683858dfd4', '80c7fbd5-c396-38da-af7f-9248b36f96f9', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Miss Felipa Mosciski I', 14, '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('89007b31-1c05-3224-9f3a-1121cd32cadb', '5da1ef8d-4fd1-396c-9f41-6f2ddb0ed4e6', '34745c58-1686-3348-96f6-c49b05c4c392', 'Granville Roberts II', 16, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('898eb381-8778-3207-8bca-a84e7559f293', '2b9a77dd-df61-36c4-8315-4ac465529c1b', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Miss Harmony Renner PhD', 11, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('8a46c93c-fb18-3fab-a150-0bf169d45119', '00153d03-0571-3aed-a210-8c6ab0aadb51', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Immanuel Balistreri', 3, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('8a9f880d-4f3c-3950-8acb-9b9070b0e758', 'e3e3449a-6c9b-3c5e-9c3b-582a26cd3edc', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Anissa Marks', 2, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('8abb2f64-0f0d-3afe-9a77-5d232eab272b', 'f8ae75e0-e4c9-378a-979f-2c003d4ad2be', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Ted Walsh', 18, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('8b219699-25bd-39ef-bd5d-5929b64d77db', '81632086-6739-38cf-8af8-b436acdcdf78', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Athena Hackett PhD', 7, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('8b529f32-86df-359a-871b-e76644ff7da8', '671f6a60-4860-303f-a489-4f23b850ccef', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Ms. Annabel Mertz', 8, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('8b621021-4a84-3503-9b0e-9c6f3ab230e0', '6bc7a4f3-0dfa-3364-8285-8993011acf9d', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Gisselle Brakus', 13, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('8c55d90d-9868-3847-8934-87ebf24f1199', 'da17d3ff-5ba7-3229-88be-ac766491fccf', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Dolores Rohan IV', 6, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('8da9fa88-7e9b-3162-8abe-ac9f87136fa2', 'a12c4c3c-30a3-3644-80e1-445f4dac1f1f', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Joelle Swaniawski', 3, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('8ea5987f-b28e-37ba-a31b-18a8fbd91002', '36dc1134-3395-3ec9-809c-6a2d36d1fb1c', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Marilie Kiehn', 16, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('8eb3aac8-ae71-36ba-a1a0-cde4326edef3', '6bc7a4f3-0dfa-3364-8285-8993011acf9d', 'e444c454-8759-3168-80d8-094f64b24efa', 'Kiley Langworth', 7, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('8f968bf8-a360-336d-b67a-310a9a23033a', 'e061e933-8a8e-36c6-8bc1-1e72d08ea8c9', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Dr. Josianne Wiza IV', 15, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('8fecd8c1-8197-3675-a62c-127454ba7d82', '2b9a77dd-df61-36c4-8315-4ac465529c1b', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Monica Buckridge', 9, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('8fed6ba9-abd6-3e38-aa4e-c2f64f7c0a47', 'a46c4225-5fef-32b4-9dfc-35457033d6d4', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Corene Wiza', 14, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('90272747-0520-315d-b541-c0cd594bc2cc', '96e637e5-773b-39f7-bbdc-8721228fe987', '277381c6-e45a-332b-b680-432db961876e', 'Prof. Troy Dicki DDS', 20, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('9121c1a3-1ba9-334e-bde6-070359f96915', '96e637e5-773b-39f7-bbdc-8721228fe987', '277381c6-e45a-332b-b680-432db961876e', 'Electa Olson II', 15, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('91248fec-86e0-3a22-861d-ede254da6e80', '3001194c-d665-3e70-937b-224484a9e4c5', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Margarita Hamill', 17, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('913e17a2-a5cb-33ec-bed5-dab165a726b5', 'f8f9374a-1e9d-3c99-80e5-9b66c400a3d4', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Sibyl Cormier', 4, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('91ae0d4b-a58c-39b0-8844-80d52b843554', '0162d552-cc48-392e-99b2-0bc0c8218fb8', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Grant Klocko', 10, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('9211d05f-6d4e-3251-a043-e21cae0ca1c7', 'f8f9374a-1e9d-3c99-80e5-9b66c400a3d4', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Zola Collier', 14, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('9411a993-269f-37db-a98e-8bb0f25620be', '94383d63-959f-3922-9645-e7fb36f3e2d8', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Federico O\'Conner MD', 9, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('941e6311-aa37-3f46-8eda-675612812049', '7780f041-36f9-37c7-ac6d-bd0d56d0ae60', '0fc8d020-a840-352f-aace-5b4983de575f', 'Dr. Ricky Stehr III', 5, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('9440426f-d5c0-3139-8bc5-a58179f6d0db', '5bb03ed8-00d0-30d6-b726-c69d267feb0b', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Ewell Hackett', 3, '2023-06-22 19:08:50', '2023-06-22 19:08:50'),
('9825a80c-d626-39d9-9f32-8a959b4eaba2', '3001194c-d665-3e70-937b-224484a9e4c5', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Prof. Demarcus Heidenreich Sr.', 6, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('98eaaa3a-4230-3774-874d-4acae1f03da3', '36dc1134-3395-3ec9-809c-6a2d36d1fb1c', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Ethelyn Hettinger IV', 4, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('9c20e1ae-bb5b-32f8-953a-1537d3b0e78e', 'ac1d534f-0bf5-37ad-b33a-3d4fd370d257', 'e444c454-8759-3168-80d8-094f64b24efa', 'Orville Bradtke', 7, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('9c42d99e-1f9d-3874-ab5a-88bdffd8dbfb', 'ebf5a801-74d1-3e0a-a6ee-b9e0078180f7', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Kristopher Hickle', 3, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('9c49b44b-de31-38c1-9c4f-dc172ca458d8', '5bb03ed8-00d0-30d6-b726-c69d267feb0b', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Prof. Alvah Thompson', 16, '2023-06-22 19:08:49', '2023-06-22 19:08:49');
INSERT INTO `topics` (`id`, `course_id`, `subject_id`, `name`, `order`, `created_at`, `updated_at`) VALUES
('9cff5ee8-6af3-30b8-9ad7-8186d4a3aae6', '6371610f-c154-370d-b867-c418aa087c76', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Lucienne Pfannerstill', 1, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('9d255418-04f5-3ead-903c-26c7a6d192f2', '181516e2-0292-354a-bd23-512b20390270', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Trudie Dach', 2, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('9dfc9a8d-d495-3aac-830e-60353e224910', '29c7939f-8e96-340d-ba91-2e3cd80cfb05', '34745c58-1686-3348-96f6-c49b05c4c392', 'Alessia Pfeffer', 16, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('9ef601ce-a750-3b47-8bf7-8d7a942ff7c0', '671f6a60-4860-303f-a489-4f23b850ccef', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Dr. Solon Hauck III', 2, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('a1086403-8351-3f75-ba8a-f0ee31144f3b', '2b9a77dd-df61-36c4-8315-4ac465529c1b', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Art Kling II', 6, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('a187fff5-0d03-37fc-be8f-0f500a17b499', '81632086-6739-38cf-8af8-b436acdcdf78', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Prof. Oswaldo Grant Sr.', 15, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('a282472b-ed3b-3a85-9341-0f17c964c04e', 'e061e933-8a8e-36c6-8bc1-1e72d08ea8c9', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Miss Noemy Lindgren', 7, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('a35cab16-14ba-3e54-8a3b-25b431b6ce01', '70024b6c-198b-3cc5-90d5-3bb70a3d1662', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Maeve Berge', 18, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('a506566a-2442-39f0-9970-cd1cb6deb384', '1a746f65-f8a0-3129-a444-4aaed05269b2', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Colleen Wuckert', 15, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('a52427a7-980c-3e2d-a9ac-925f90363d5b', '9bd97676-2d6e-31c1-95b5-f21a097cc3df', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Austin Lockman', 4, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('a5bb7a43-8da1-3db8-a19c-12724d538177', 'a1259090-9088-3620-9328-19c20f220ab5', '34745c58-1686-3348-96f6-c49b05c4c392', 'Yadira Bradtke', 10, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('a66bf8ad-f53b-3e78-b88c-cb1f8dc8665b', 'b4160579-9eb8-3e15-b5ba-67b0264fe9f1', 'e444c454-8759-3168-80d8-094f64b24efa', 'Miss Makenzie Kohler', 4, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('a67c8b93-640e-3e50-8ad7-6f74a9d58638', '29c7939f-8e96-340d-ba91-2e3cd80cfb05', '34745c58-1686-3348-96f6-c49b05c4c392', 'Mr. Brown Hyatt', 13, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('a76fa01d-e9fb-31ae-aed9-f91f2c3ab32d', '29c7939f-8e96-340d-ba91-2e3cd80cfb05', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Buster Hickle', 16, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('a77300b1-49d7-3cc5-a034-2be0f03fc0d2', 'fb7b5286-8ba9-3597-9bee-b3d313871e10', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Clare Daugherty I', 8, '2023-06-22 19:08:50', '2023-06-22 19:08:50'),
('a7b087e0-8089-307c-be16-6d7b0d3c4ea7', 'a4810048-be60-31da-89de-78fe741fbdfb', '34745c58-1686-3348-96f6-c49b05c4c392', 'Kylee Hodkiewicz', 15, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('a90590ea-a0bc-3337-9c48-a6b81bbb4b21', '70024b6c-198b-3cc5-90d5-3bb70a3d1662', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Mrs. Raquel Herman', 5, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('a90aa364-76ba-3acf-80d5-d2bdc4420a7e', '96e637e5-773b-39f7-bbdc-8721228fe987', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Casimir Daugherty', 1, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('a9996599-e8b9-3b93-9aeb-d93f640cc5f2', '0bd0b875-9e44-31d1-b39a-44751b89a047', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Jarvis Aufderhar IV', 15, '2023-06-22 19:08:50', '2023-06-22 19:08:50'),
('ac670321-d2a0-3925-9613-c3e538430029', 'e1228b2f-63d4-3cae-af07-5e4d5a6cab0c', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Brook Roob', 5, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('ac88d5fd-2e5e-37d8-a784-a711777807c0', 'e1228b2f-63d4-3cae-af07-5e4d5a6cab0c', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Corbin Farrell', 8, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('ad91f736-9fc6-3884-aaa9-b6e3516b79a5', 'e647cdb0-b15f-3b99-be32-94aaad448636', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Lamar Gaylord', 13, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('adde2631-7b79-3bfc-846d-6bf0f7e2282d', '65bd514e-ad73-3d4d-a67b-d34d7ca1d5ae', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Dr. Gilberto Weissnat', 3, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('ae8c504c-d9e0-3885-81c2-86278befb10c', '6bc7a4f3-0dfa-3364-8285-8993011acf9d', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Hudson Bernier III', 15, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('af0db4bb-ae86-3e30-a5b5-bd4ac94720db', '6bc7a4f3-0dfa-3364-8285-8993011acf9d', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Prof. Dale Nikolaus', 6, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('af7f91a4-e299-36ea-bbc5-3c417db5a28a', '5da1ef8d-4fd1-396c-9f41-6f2ddb0ed4e6', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Jillian Gottlieb', 4, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('b018a788-ba85-31f4-b580-c0f456b1624b', '1a746f65-f8a0-3129-a444-4aaed05269b2', '34745c58-1686-3348-96f6-c49b05c4c392', 'Xander Marvin', 9, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('b01f0535-063a-3825-bff7-a0b0fccc5aa0', 'b4160579-9eb8-3e15-b5ba-67b0264fe9f1', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Regan Ward', 3, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('b04b069b-ad14-3147-bb42-7f63c398a66b', 'd5d0f32a-37e3-39e3-88fd-6f048c693a1b', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Jasen Botsford', 8, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('b06cac51-8a5b-30ac-b1e4-3dc0c6150e4a', '00153d03-0571-3aed-a210-8c6ab0aadb51', '0fc8d020-a840-352f-aace-5b4983de575f', 'Karli Boyle', 10, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('b0c38c9f-0340-3b11-89d1-d86187e5e8e8', 'e061e933-8a8e-36c6-8bc1-1e72d08ea8c9', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Ms. Adella Macejkovic', 18, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('b1ab2c73-a67a-369a-a0f5-5d4dc5e052ec', 'e647cdb0-b15f-3b99-be32-94aaad448636', '277381c6-e45a-332b-b680-432db961876e', 'Miss Linnea Kautzer', 19, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('b2ada18b-4563-3d2f-8641-4025c8465add', 'b4160579-9eb8-3e15-b5ba-67b0264fe9f1', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Celia Jaskolski IV', 19, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('b422568f-9144-32f6-afed-5e2308938b7c', '7780f041-36f9-37c7-ac6d-bd0d56d0ae60', '0fc8d020-a840-352f-aace-5b4983de575f', 'Chanel Nikolaus', 5, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('b53fb0bd-2539-386c-977c-fd9af058ffd1', '94ab2abe-84ca-3c65-a628-7a3ebb2e8613', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Prof. Ulices Kerluke DDS', 13, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('b5ed6f0e-24d8-39f9-8702-2a23e57c873e', '2b9a77dd-df61-36c4-8315-4ac465529c1b', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Austen Marvin', 6, '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('b6dac852-0382-3c17-bbb0-66a3fd99d996', '70024b6c-198b-3cc5-90d5-3bb70a3d1662', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Isabelle Jacobi PhD', 12, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('b6e83033-6dbd-3bb7-ac28-763484142680', '0162d552-cc48-392e-99b2-0bc0c8218fb8', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Prof. Andres Brown Sr.', 8, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('b7067c0b-4751-316e-a065-85d629297154', 'ac1d534f-0bf5-37ad-b33a-3d4fd370d257', 'e444c454-8759-3168-80d8-094f64b24efa', 'Mr. Price McDermott MD', 17, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('b74c4331-9dce-39ea-aa8b-7d329e93f35e', '181516e2-0292-354a-bd23-512b20390270', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Camren Schinner', 6, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('b776ad71-dc75-3a66-9902-7f0789042233', '70024b6c-198b-3cc5-90d5-3bb70a3d1662', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Chaya Jakubowski DVM', 11, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('b79c33a6-e830-3850-93ab-38f6d505649b', 'a4810048-be60-31da-89de-78fe741fbdfb', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Joany Tremblay', 3, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('b7ce660d-723a-38be-8e05-47c9c73654ff', '0bd0b875-9e44-31d1-b39a-44751b89a047', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Triston Funk V', 20, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('bb29c3ca-5c75-3f81-ad7a-71d761eb65ac', 'fb7b5286-8ba9-3597-9bee-b3d313871e10', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Adonis Heaney', 9, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('bb6a9480-a001-3cde-aaad-149a4df8db2f', '94383d63-959f-3922-9645-e7fb36f3e2d8', 'e444c454-8759-3168-80d8-094f64b24efa', 'Loyce Wolf', 15, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('bce423f4-df7c-3147-a127-e09edbb6d29b', '94ab2abe-84ca-3c65-a628-7a3ebb2e8613', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Miss Kara Bartoletti', 20, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('bd3e9d90-61b8-36ea-82e2-2f90bc942a8e', '80c7fbd5-c396-38da-af7f-9248b36f96f9', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Neil Dietrich', 18, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('bd788f8a-1031-37f6-b75f-98ee06afb435', '2b9a77dd-df61-36c4-8315-4ac465529c1b', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Prof. Magnus Botsford', 11, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('beae0f2e-4500-3cd1-911b-6afab3d91e53', '00153d03-0571-3aed-a210-8c6ab0aadb51', '0fc8d020-a840-352f-aace-5b4983de575f', 'Kelsi Krajcik', 17, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('bec3a2a5-74ef-3b74-848f-a918d665fe22', '5d83fc4f-e1de-3de4-a951-26fd0bb30f7d', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Dr. Clay Cremin', 11, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('bef953a7-66e2-3f62-af8e-9aa350b1d0c4', '3001194c-d665-3e70-937b-224484a9e4c5', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Erick Schiller', 17, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('bf346ca3-3704-3fb0-ac3d-658071cf0222', 'badc3c32-3a7b-3409-ad5b-d7f9c67b72f6', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Mrs. Earnestine Gutmann V', 3, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('bf54ac53-92cb-3eef-870f-5d353047267a', '94383d63-959f-3922-9645-e7fb36f3e2d8', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Miss Tyra Pouros', 13, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('c0248086-e4ef-3157-8c1b-a311e4c1abb0', '34364da3-83f2-3ee4-a207-7c296aeaec67', '0fc8d020-a840-352f-aace-5b4983de575f', 'Dr. Mitchel Legros Jr.', 18, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('c0471f36-2392-3067-8e0b-ba918adbe451', 'a2238f78-5284-3c51-8ff6-0ddb7ab05f3f', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Prof. Troy Pfeffer I', 6, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('c07861f5-8cf3-3f98-b11c-2a96d74aa86f', '0162d552-cc48-392e-99b2-0bc0c8218fb8', '0fc8d020-a840-352f-aace-5b4983de575f', 'Clara Dach', 17, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('c19b81b7-4504-3283-bc0e-dd077d636342', 'ac1d534f-0bf5-37ad-b33a-3d4fd370d257', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Brittany Flatley DDS', 6, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('c2bf84a7-24db-34ef-afed-c8f30eb1fd28', '1a746f65-f8a0-3129-a444-4aaed05269b2', '34745c58-1686-3348-96f6-c49b05c4c392', 'Lexus Schamberger', 3, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('c303d2a6-5f80-34d3-b250-05075e982480', 'a46c4225-5fef-32b4-9dfc-35457033d6d4', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Elwyn Streich', 14, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('c3734178-39fd-34b8-abf9-4dfd77361028', '671f6a60-4860-303f-a489-4f23b850ccef', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Dr. Taurean Tremblay', 8, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('c3807194-2c72-3bcf-bff7-8fa1a67e1a71', 'd5d0f32a-37e3-39e3-88fd-6f048c693a1b', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Dr. Marlen Ritchie', 20, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('c398cadf-197f-30a0-b6a0-5921a296afab', '924e0c9c-cf55-36bd-85fc-f631112c060a', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Leila Cummerata DDS', 14, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('c4104bae-2535-315e-8df1-7706963cd78f', 'a46c4225-5fef-32b4-9dfc-35457033d6d4', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Georgiana Wintheiser', 20, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('c44c7c5c-7aec-3472-aeaa-149f20604b5d', 'ac1d534f-0bf5-37ad-b33a-3d4fd370d257', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Prof. Eliezer Bruen', 18, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('c50103a4-5dbc-3b55-8966-951902626c60', '6bc7a4f3-0dfa-3364-8285-8993011acf9d', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Tamara Gerlach', 12, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('c5b071f0-c2f2-3335-9521-2ae104042c16', '0bd0b875-9e44-31d1-b39a-44751b89a047', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Jalon Corwin', 17, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('c5b36c41-5f6c-33bf-8dc0-70b087eebc0d', 'badc3c32-3a7b-3409-ad5b-d7f9c67b72f6', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Miss Antonina Spinka', 6, '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('c60f4637-0c83-3a70-9b2a-a55b009467c5', '29c7939f-8e96-340d-ba91-2e3cd80cfb05', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Prof. Stella Metz', 13, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('c6caef2c-3e50-3b39-9e6a-aac0a0c567f1', '5bb03ed8-00d0-30d6-b726-c69d267feb0b', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Caleigh Vandervort DVM', 6, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('c6e1611f-344a-3a0a-b6b8-1c6bf58eaecb', '94ab2abe-84ca-3c65-a628-7a3ebb2e8613', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Arielle Keeling III', 11, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('c7abf4c9-bb56-334e-a576-358420975ef0', '6a124efb-6fcd-359a-9ce4-7ad3bccd4b1b', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Kraig West V', 15, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('c7ed9f8a-1303-383b-9e63-400c7fa9da47', '2b9a77dd-df61-36c4-8315-4ac465529c1b', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Gabe Prohaska III', 8, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('c88be5bb-8d4b-3b19-9b01-02c7185a4e5e', 'e647cdb0-b15f-3b99-be32-94aaad448636', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Tanya Armstrong', 2, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('c8e869dd-9f4e-3e8b-a871-733a1b0f6c1a', 'a1259090-9088-3620-9328-19c20f220ab5', '34745c58-1686-3348-96f6-c49b05c4c392', 'Odie Jenkins DVM', 5, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('c918183d-4866-3155-a5c0-e7dcb125ed2c', '3001194c-d665-3e70-937b-224484a9e4c5', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Mariano Zemlak', 19, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('cae2a413-01ab-34e6-84dc-3c9ec57f061f', '924e0c9c-cf55-36bd-85fc-f631112c060a', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Eldred Bauch Sr.', 8, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('cb10164b-fccb-3fdf-af7e-a062c5f606e8', '5d83fc4f-e1de-3de4-a951-26fd0bb30f7d', '277381c6-e45a-332b-b680-432db961876e', 'Pascale Bauch', 14, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('cb17b13c-5991-36a4-b7d4-b14409f3b2e5', '29c7939f-8e96-340d-ba91-2e3cd80cfb05', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Miss Florine Casper III', 7, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('cc31ee28-1370-37b3-82bd-34ed16e9714b', 'adb68089-b50d-3f91-ab71-a8d3929cafd4', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Dane Bartell', 19, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('cc6db34c-b01b-3a87-a013-04724b2bd45d', 'da17d3ff-5ba7-3229-88be-ac766491fccf', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Emely Gorczany', 19, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('cccbb276-9f93-3d3a-9e20-d6cb8fee06bb', '80c7fbd5-c396-38da-af7f-9248b36f96f9', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Kenya Smith', 19, '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('cd08c063-9e7b-3b3e-8096-779380cc3255', 'f8f9374a-1e9d-3c99-80e5-9b66c400a3d4', 'e444c454-8759-3168-80d8-094f64b24efa', 'Delphia Rice', 4, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('cd475098-2d4d-309e-b0a8-a45d172a87ba', 'a46c4225-5fef-32b4-9dfc-35457033d6d4', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Dr. Enrique Maggio', 6, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('cd915937-45a1-355f-ad3e-b2decf2a4a53', 'a4810048-be60-31da-89de-78fe741fbdfb', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Lydia Kub Sr.', 10, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('cdeab48d-896e-3538-8790-330616b1a9fa', '5da1ef8d-4fd1-396c-9f41-6f2ddb0ed4e6', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Brielle Breitenberg', 9, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('ce2a9633-3d36-3e64-b0c7-3bb88bee6ec3', '0162d552-cc48-392e-99b2-0bc0c8218fb8', '0fc8d020-a840-352f-aace-5b4983de575f', 'Avery Daugherty', 8, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('ce540c6f-b36b-3839-bcec-09c14dd3af22', 'e061e933-8a8e-36c6-8bc1-1e72d08ea8c9', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Alene Buckridge', 7, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('d04c9de9-15db-347e-8f3d-5173579b87c6', 'e3e3449a-6c9b-3c5e-9c3b-582a26cd3edc', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Mr. Jovanny Gutkowski Sr.', 18, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('d109b96e-4ea3-38eb-bda4-d12bbb9d2a2f', 'da17d3ff-5ba7-3229-88be-ac766491fccf', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Janet Grant', 4, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('d2818286-2503-3bf9-9d7d-0f82e8fb4a53', '671f6a60-4860-303f-a489-4f23b850ccef', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Hiram Monahan', 16, '2023-06-22 19:08:50', '2023-06-22 19:08:50'),
('d2b6adc9-a97b-38ec-b3f0-9250a4c35522', 'd5d0f32a-37e3-39e3-88fd-6f048c693a1b', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Dr. Gabriel Considine', 18, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('d2c530be-626f-30a8-9444-d499043f4a6c', '924e0c9c-cf55-36bd-85fc-f631112c060a', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Dr. Rosalinda McLaughlin', 18, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('d30ac374-3623-33b9-acc2-ef90cd52db64', '924e0c9c-cf55-36bd-85fc-f631112c060a', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Braxton Kunde', 15, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('d3bc084f-1bf1-3102-a396-4738afbdf84a', '6371610f-c154-370d-b867-c418aa087c76', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Dr. Rene Langworth DVM', 11, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('d4528d0d-6f4b-3cd5-8b8e-547bbf271faa', '181516e2-0292-354a-bd23-512b20390270', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Prof. Efrain Cruickshank', 9, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('d4de907e-3ec1-379f-97eb-f04914267913', '9bd97676-2d6e-31c1-95b5-f21a097cc3df', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Delta Kutch', 15, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('d51dbadb-3f37-3e69-beaa-d44912068037', 'a12c4c3c-30a3-3644-80e1-445f4dac1f1f', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Rebeca Feest I', 4, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('d5627f73-a47b-3c49-be85-c8ec62e9bd90', '5da1ef8d-4fd1-396c-9f41-6f2ddb0ed4e6', 'ee2a0ae2-1de0-3332-ae67-bf7fe34992f3', 'Dr. Donnie Jenkins MD', 2, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('d5db03da-ed91-36ba-b6df-6a61f5cb1b35', '0887448c-3d80-33ad-abbd-719b8a2bd426', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Lee Jakubowski', 6, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('d6619070-5d1a-32c8-8463-15e74c9cca26', '96e637e5-773b-39f7-bbdc-8721228fe987', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Mark Barrows DDS', 11, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('d67595a4-5539-3e14-b3f5-e2da9f1b7d96', 'adb68089-b50d-3f91-ab71-a8d3929cafd4', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Aryanna Wunsch IV', 2, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('d6f6ba02-7ad8-38c5-b599-993ee8913799', '81632086-6739-38cf-8af8-b436acdcdf78', '277381c6-e45a-332b-b680-432db961876e', 'Evans Stiedemann', 14, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('d74e5618-64ea-3a6e-98e6-eb56666e197b', 'da17d3ff-5ba7-3229-88be-ac766491fccf', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Miss Vernie Padberg DVM', 3, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('d8d7dc9f-1cb3-3d35-862e-fca8860329f9', '00153d03-0571-3aed-a210-8c6ab0aadb51', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Hiram Funk', 16, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('da6788fc-d622-37c3-adba-c816a047428a', '671f6a60-4860-303f-a489-4f23b850ccef', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Shaniya Pollich', 2, '2023-06-22 19:08:50', '2023-06-22 19:08:50'),
('db21c101-8134-3efc-a9e8-1817643240f9', 'badc3c32-3a7b-3409-ad5b-d7f9c67b72f6', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Violette Grady', 2, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('dd48dae5-92b5-332e-9c77-1ebd205fa818', '1a746f65-f8a0-3129-a444-4aaed05269b2', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Dr. Jermey Casper', 12, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('de36979e-9db5-3dea-be4c-8d8f80b39e0f', 'e3e3449a-6c9b-3c5e-9c3b-582a26cd3edc', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Prof. Marcelina Osinski V', 16, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('dea40c26-eaf5-3e74-845a-e5c1af9237ed', '96e637e5-773b-39f7-bbdc-8721228fe987', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Earnest Dietrich DVM', 15, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('dedb9980-e58f-3e40-ae59-064126517f2e', 'e3e3449a-6c9b-3c5e-9c3b-582a26cd3edc', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Lonnie Schroeder DVM', 14, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('def6f3bc-05f4-3d5c-8980-fc296c3d6176', '7780f041-36f9-37c7-ac6d-bd0d56d0ae60', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Abbigail Dare', 9, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('df203dcc-939d-3ae9-80c5-35f921edbf11', '671f6a60-4860-303f-a489-4f23b850ccef', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Mr. Chester Rodriguez DVM', 19, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('e00a647c-4325-3451-8054-2949ccebf102', '94ab2abe-84ca-3c65-a628-7a3ebb2e8613', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Dr. Zachery Jerde', 1, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('e01b8ef0-9618-3368-be2a-3e0110f1cc5e', 'a2238f78-5284-3c51-8ff6-0ddb7ab05f3f', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Dr. Velma Kovacek', 9, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('e01e6eb2-28a9-3a62-b9a1-adb4c2015636', 'f8f9374a-1e9d-3c99-80e5-9b66c400a3d4', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Idella Bruen', 13, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('e1c0dade-2ad8-3580-99e7-2971c8a553af', 'e3e3449a-6c9b-3c5e-9c3b-582a26cd3edc', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Ruben Larkin', 16, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('e1d94b7c-9741-3b00-8a0a-8394048ffec1', '81632086-6739-38cf-8af8-b436acdcdf78', '277381c6-e45a-332b-b680-432db961876e', 'Mr. Skye Lemke MD', 8, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('e2252a74-6571-3350-976f-6a14837ef23f', '81632086-6739-38cf-8af8-b436acdcdf78', '741e6ed6-b86d-391d-a9e1-e623233ccf89', 'Deshaun Bayer IV', 2, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('e231bde7-2ae7-3450-bafb-6252c321acaf', '2b9a77dd-df61-36c4-8315-4ac465529c1b', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Gertrude Dickinson', 9, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('e3109357-4212-394d-91c7-c60867cf07b6', 'adb68089-b50d-3f91-ab71-a8d3929cafd4', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Marietta Barrows', 13, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('e36691ad-7af0-3c6e-a14d-554024407ed6', 'e1228b2f-63d4-3cae-af07-5e4d5a6cab0c', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Gene King', 9, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('e36f537c-05ab-3860-8189-158909402491', '6a124efb-6fcd-359a-9ce4-7ad3bccd4b1b', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Abagail Gusikowski', 9, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('e4fec02d-67bd-3930-9b0d-68aefd035e86', '0bd0b875-9e44-31d1-b39a-44751b89a047', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Carson Harber DVM', 17, '2023-06-22 19:08:50', '2023-06-22 19:08:50'),
('e592c25b-7a82-3189-981c-6152b7ce7271', '6bc7a4f3-0dfa-3364-8285-8993011acf9d', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Jerrold Huels', 4, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('e606d560-e6c8-3ab9-ad96-6e50f061e282', '0887448c-3d80-33ad-abbd-719b8a2bd426', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Mitchel Buckridge IV', 14, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('e61fc977-c140-3f61-973f-b370cec7a484', '6a124efb-6fcd-359a-9ce4-7ad3bccd4b1b', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Hardy Tillman', 17, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('e69ef548-71fb-39d6-92db-046f1a3dccfe', '65bd514e-ad73-3d4d-a67b-d34d7ca1d5ae', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Oswald Dickens', 15, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('e6b1bae0-17db-358d-a634-481df2c645cd', '00153d03-0571-3aed-a210-8c6ab0aadb51', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Dr. Willie Botsford MD', 17, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('e6cc9f2e-3ea9-3140-ba73-a8316329a25d', '0bd0b875-9e44-31d1-b39a-44751b89a047', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Annalise Grimes', 12, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('e7696815-bf56-315a-ba88-1645cf9d8881', '9bd97676-2d6e-31c1-95b5-f21a097cc3df', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Maggie Simonis DVM', 4, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('e8922851-284f-35fa-837e-f13a0ee43b50', 'adb68089-b50d-3f91-ab71-a8d3929cafd4', 'a215f746-4260-37bf-b239-77f0bd0df7b2', 'Juanita Wolf V', 18, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('e8cb7404-fce1-3fb1-977d-9bde8b7f2948', 'f8f9374a-1e9d-3c99-80e5-9b66c400a3d4', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Ms. Camille Runte', 19, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('e8d094ab-0417-3b0d-82dc-7177cb33485d', '80c7fbd5-c396-38da-af7f-9248b36f96f9', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Ms. Piper Waelchi I', 8, '2023-06-22 18:25:14', '2023-06-22 18:25:14'),
('e96c1d24-423f-3bda-93c8-e904826aa119', 'fb7b5286-8ba9-3597-9bee-b3d313871e10', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Josie Fahey', 5, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('e976d716-3bc2-3739-b8da-b9cc9cb6ae7b', 'd5d0f32a-37e3-39e3-88fd-6f048c693a1b', '277381c6-e45a-332b-b680-432db961876e', 'Michael Gusikowski', 14, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('ea552c79-3183-315a-b191-c67337efa757', 'e1228b2f-63d4-3cae-af07-5e4d5a6cab0c', '34745c58-1686-3348-96f6-c49b05c4c392', 'Bryana Wisozk', 14, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('eac245c8-67d1-3c31-b8cf-ea1868e71f7c', 'ac1d534f-0bf5-37ad-b33a-3d4fd370d257', 'e444c454-8759-3168-80d8-094f64b24efa', 'Joelle Reilly', 11, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('eb2b5501-305e-3bac-bb54-05b2884c0393', 'badc3c32-3a7b-3409-ad5b-d7f9c67b72f6', '4a8b7386-1053-3817-85ef-2ef72b0405f7', 'Miss Valerie Greenfelder III', 4, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('eba8bedf-bd70-34b9-af95-330d7fb15c50', '0887448c-3d80-33ad-abbd-719b8a2bd426', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Lonie Bashirian', 7, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('ebe37069-bb89-3a8c-ad66-7b6ae1587292', '80c7fbd5-c396-38da-af7f-9248b36f96f9', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Aaliyah Predovic', 16, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('ed4da616-7f47-3126-bff9-28464cc65ae2', 'd5d0f32a-37e3-39e3-88fd-6f048c693a1b', '277381c6-e45a-332b-b680-432db961876e', 'Carolanne Glover', 15, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('ed7b79d2-6dac-373f-852c-7644bbf37674', 'a12c4c3c-30a3-3644-80e1-445f4dac1f1f', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Alvis Grady', 2, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('ee04e4f0-b024-3b58-a9df-bfa42b299306', 'a1259090-9088-3620-9328-19c20f220ab5', 'c4b24553-92b8-389e-91c0-7efe80ea3762', 'Nelda Crist MD', 5, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('ee71dc2f-678a-362b-938a-b0736daab04a', 'e1228b2f-63d4-3cae-af07-5e4d5a6cab0c', '34745c58-1686-3348-96f6-c49b05c4c392', 'Lazaro Swift', 12, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('eec28efa-826b-37a0-b0dd-e70f57c6c8c5', '2f7d16d6-93a6-3c93-ac2e-a1418eaa8d3d', '277381c6-e45a-332b-b680-432db961876e', 'Janet Schultz', 13, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('ef0b8900-dabe-3a1f-86f9-7d02987dafb6', 'f8ae75e0-e4c9-378a-979f-2c003d4ad2be', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Mr. Burley Heidenreich I', 7, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('f00d0591-2e5b-3939-acea-69f460ca406d', 'e647cdb0-b15f-3b99-be32-94aaad448636', '492dfe13-292c-307c-864a-b4a3cbab5be1', 'Bette Walsh', 8, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('f0108d9f-fa3e-3194-a189-09d88e981b1a', '3001194c-d665-3e70-937b-224484a9e4c5', '2ebf123e-3d7c-3b58-a35b-d60a45e69e1e', 'Federico Jakubowski', 10, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('f0897d3d-992f-3d83-8619-f36f734f1da5', 'badc3c32-3a7b-3409-ad5b-d7f9c67b72f6', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Abraham Cartwright', 18, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('f0be50bd-60d7-3f5d-b54b-19e9d58b55d9', '6a124efb-6fcd-359a-9ce4-7ad3bccd4b1b', '0efb3e24-701b-35f6-aae8-c926ff532f73', 'Houston Reichert', 15, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('f16d57e8-05b0-34d2-9968-cdd7a34ebad1', 'adb68089-b50d-3f91-ab71-a8d3929cafd4', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Madisyn Kuhlman', 7, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('f20006d6-fc3d-304f-89a9-06e993458d46', 'e1228b2f-63d4-3cae-af07-5e4d5a6cab0c', '34745c58-1686-3348-96f6-c49b05c4c392', 'Lorenza Halvorson', 9, '2023-06-22 19:07:26', '2023-06-22 19:07:26'),
('f2045f1d-4a0c-3d12-983f-ad00cabb7fea', 'f8ae75e0-e4c9-378a-979f-2c003d4ad2be', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Wilton Price', 13, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('f2d284b2-8dd2-33f7-acb7-b84dd0542ad2', 'ac1d534f-0bf5-37ad-b33a-3d4fd370d257', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Randall Hahn', 2, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('f3bf111a-f396-3851-bd99-36bb05f828ed', 'a46c4225-5fef-32b4-9dfc-35457033d6d4', 'a97c5cf5-a6a9-3de8-8279-47cb48719c9c', 'Everardo Zemlak', 4, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('f4db251d-939e-35cd-8774-91c9b6482f6a', '65bd514e-ad73-3d4d-a67b-d34d7ca1d5ae', 'e12c5a3f-00c3-3540-861e-b7996d62e34a', 'Louisa Medhurst', 12, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('f51252e5-6273-33d9-a18f-f81fd103c88b', '6371610f-c154-370d-b867-c418aa087c76', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Prof. Zack D\'Amore', 10, '2023-06-22 19:08:50', '2023-06-22 19:08:50'),
('f5e67d41-9509-3c73-abc7-620a8c90bd66', '36dc1134-3395-3ec9-809c-6a2d36d1fb1c', '909d7805-eb8c-333b-bd58-efd9967bf307', 'Dr. Emil Braun IV', 6, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('f7050481-a5fd-3c13-9d03-ab1a04d37adb', '6a124efb-6fcd-359a-9ce4-7ad3bccd4b1b', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Vilma Brakus', 14, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('f78307d5-0bea-33ca-9493-67841d820d5b', '5bb03ed8-00d0-30d6-b726-c69d267feb0b', 'f177c473-4f6a-347b-89a1-182518bceef1', 'Triston Monahan', 9, '2023-06-22 19:08:49', '2023-06-22 19:08:49'),
('f8757ee0-8fd2-311e-9091-bccf8bd83538', '5d83fc4f-e1de-3de4-a951-26fd0bb30f7d', '277381c6-e45a-332b-b680-432db961876e', 'Mrs. Shaina Muller II', 9, '2023-06-22 14:26:41', '2023-06-22 14:26:41'),
('f8919967-205a-3f77-93b2-f5604861d4d7', '34364da3-83f2-3ee4-a207-7c296aeaec67', '6bb8d53a-7704-3c3f-afa6-3d67c36f4839', 'Peyton Walsh', 15, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('f9c1c89b-03ff-32a9-8ed6-9263deccc1dc', 'f8f9374a-1e9d-3c99-80e5-9b66c400a3d4', 'daf26725-556c-364f-b08a-e36b7dabbd92', 'Amie Torp', 8, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('fa43e9d3-c135-3571-834e-4f6b68b63a63', '94383d63-959f-3922-9645-e7fb36f3e2d8', 'ad770b82-723d-3d87-be04-e6e7bb8410fd', 'Ava Runolfsdottir', 7, '2023-06-22 13:40:24', '2023-06-22 13:40:24'),
('fa47e8e5-fe56-3763-b7d6-c9b7f4791b19', '80c7fbd5-c396-38da-af7f-9248b36f96f9', 'bc71d8fa-4d88-3f0a-86b6-57b9d28312fa', 'Everette Boehm', 12, '2023-06-22 18:25:15', '2023-06-22 18:25:15'),
('faa17a0f-b2d0-3514-8f1e-0af441ace1b1', '34364da3-83f2-3ee4-a207-7c296aeaec67', '2976f6dd-1861-39f0-88e4-9612b65b20ee', 'Frida Bayer', 3, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('fc5702c1-de48-3b43-a935-63989233b3e7', '0162d552-cc48-392e-99b2-0bc0c8218fb8', '0fc8d020-a840-352f-aace-5b4983de575f', 'General Schimmel', 8, '2023-06-22 20:40:35', '2023-06-22 20:40:35'),
('fd13c707-14eb-3447-b1e0-021205ed0503', '6371610f-c154-370d-b867-c418aa087c76', '521aca4d-98d2-3c5d-a19d-e9db04c16261', 'Gust Mosciski', 2, '2023-06-22 19:08:50', '2023-06-22 19:08:50'),
('fe2e4a0c-d37e-367d-9168-7b52637f4e4e', '3001194c-d665-3e70-937b-224484a9e4c5', 'cb53239a-b823-363d-966f-3cec488f6d4d', 'Mr. Garret Kilback V', 17, '2023-06-22 13:56:44', '2023-06-22 13:56:44'),
('fe6c8578-8b31-367c-a8ce-eba9414f29f3', '94ab2abe-84ca-3c65-a628-7a3ebb2e8613', '8cf4b7ee-72d2-337b-a8e2-56db7c6facd6', 'Lacey Kertzmann V', 10, '2023-06-22 20:43:25', '2023-06-22 20:43:25'),
('ffb154cf-64d6-3cb4-bf9d-94dfab53cc37', '1a746f65-f8a0-3129-a444-4aaed05269b2', '34745c58-1686-3348-96f6-c49b05c4c392', 'Dr. Alexane Gusikowski', 7, '2023-06-22 19:07:26', '2023-06-22 19:07:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `school_id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nis` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `grade` tinyint(3) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `school_id`, `name`, `username`, `password`, `role`, `status`, `email`, `nis`, `created_at`, `updated_at`, `grade`, `remember_token`) VALUES
('0cd21698-7a25-355a-8049-9a614eea4160', '6e7ce5c5-c3a7-3166-b3c9-40e6324de5be', 'Kaley', 'Kaley056', '$2y$10$EmQm67qeIWiW5GEAqNQnue2Jt1lZkr01mTRjbLGlE2hJHN1pDmSeK', 'ADMIN', 1, 'heller.hattie@yahoo.com', NULL, '2023-06-22 20:43:24', '2023-06-22 20:43:24', 12, NULL),
('2b3c4d38-3f67-31c6-bc63-eadc745dd849', '6e7ce5c5-c3a7-3166-b3c9-40e6324de5be', 'Nia', 'Nia406', '$2y$10$98aodc9KJaW5bKqblWOJKuY5yhbK4mQgm5f/Aa464Nb5rCkmUaZCO', 'TEACHER', 1, 'huel.nicklaus@yahoo.com', NULL, '2023-06-22 20:43:24', '2023-06-22 20:43:24', 12, NULL),
('63120566-5374-320c-ab7a-630d3ed30863', '271bf706-c92d-38ce-8200-a87a073c9275', 'Elwin', 'Elwin158', '$2y$10$MJUvzRvwCngUpAo5Slk8XOiuq91uRbgZFi7uKqyvPaRyKu9j.EBRm', 'STUDENT', 1, 'shuels@hotmail.com', NULL, '2023-06-22 20:43:25', '2023-06-22 20:43:25', 12, NULL),
('68c3f461-d913-38f9-bd21-6a3ce41926b3', 'bf6779e2-14d4-3ee9-9f1c-a6217ec7ad7e', 'teacheruser', 'guru@a.com', '$2y$10$5KSQRdBzsGnCBol6BsYLkuSu5k.oBhpJ2fyZ0FUo985WNjXjj534y', 'TEACHER', 1, 'kasey.russel@hotmail.com', NULL, '2023-06-22 20:43:24', '2023-06-22 20:43:24', 12, NULL),
('6a0b21bd-218b-383e-8467-0128b1abde53', 'bfb9fcc9-967d-3c62-b868-495d61c6be10', 'Ethel', 'Ethel034', '$2y$10$OrmdmJqQGcmIXtIlW.I0l.9FhRGMOCGPdSTGK.q9yuKydmGsUIu3K', 'STUDENT', 1, 'ramon.kuphal@kovacek.net', NULL, '2023-06-22 20:43:24', '2023-06-22 20:43:24', 12, NULL),
('7ce106cb-1b0e-3a1f-8f3d-705396b0ac3e', 'bfb9fcc9-967d-3c62-b868-495d61c6be10', 'Kenny', 'Kenny270', '$2y$10$rX6LXjoAWYESXzNkvm7Tjub5wa0oH6V6jsm33oOJ2LOQcZiPL2Skq', 'STUDENT', 1, 'kuvalis.earline@williamson.info', NULL, '2023-06-22 20:43:24', '2023-06-22 20:43:24', 12, NULL),
('90760f2d-6a51-303e-a8e1-e62807895f92', 'bfb9fcc9-967d-3c62-b868-495d61c6be10', 'Deja', 'Deja838', '$2y$10$1V2bIXTywJ1WItFJbgs0aeffSKop6HJSBVErU2eoZP98U2FJql3n.', 'STUDENT', 1, 'katarina.aufderhar@yahoo.com', NULL, '2023-06-22 20:43:24', '2023-06-22 20:43:24', 12, NULL),
('a46949f2-ab27-332e-9417-93a02f305397', '271bf706-c92d-38ce-8200-a87a073c9275', 'Kristoffer', 'Kristoffer472', '$2y$10$TOdG2CYngPG1l5Mwg5xMyetvQr3y74NnOmcibYKSNRMTR8dBXMJZi', 'ADMIN', 1, 'harvey.anahi@wolff.com', NULL, '2023-06-22 20:43:25', '2023-06-22 20:43:25', 12, NULL),
('b69de4cd-04f7-38a3-8d6a-fa1e69939094', '271bf706-c92d-38ce-8200-a87a073c9275', 'Jesus', 'Jesus730', '$2y$10$29PqxwnLwx1BBpULyebK/OBQagJIeMeGswmdJNR4njE96OLbUoMbC', 'STUDENT', 1, 'krau@spencer.net', NULL, '2023-06-22 20:43:25', '2023-06-22 20:43:25', 12, NULL),
('ca92695b-aab3-4351-9a62-41a37fe34cb6', 'bf6779e2-14d4-3ee9-9f1c-a6217ec7ad7e', 'Ibu Sari', 'ibu2592', '$2y$10$yYwc0c2GqJHM2YB8XcG4PuarVsbi2gvjzoAlrWwZ9dPopH8CNwbSm', 'TEACHER', 1, 'bagus@a.com', NULL, '2023-06-22 21:00:05', '2023-06-22 21:00:05', NULL, NULL),
('dc107aeb-f678-4624-b22d-87a06b7b174c', 'bf6779e2-14d4-3ee9-9f1c-a6217ec7ad7e', 'bagus', 'bagus0124', '$2y$10$X2XC.7yTEPb9br62rM3mXefLPpz7b0mQcGZBCVWHNY1VsTre5O8Bq', 'TEACHER', 1, 'bagus@gmail.com', NULL, '2023-06-22 20:53:51', '2023-06-22 20:53:51', NULL, NULL),
('ddb504a9-d72f-3745-b5c6-ce191fc43821', '6e7ce5c5-c3a7-3166-b3c9-40e6324de5be', 'Jaqueline', 'Jaqueline061', '$2y$10$QaqU7cms7mynt.5s3WyGiuuPWbMrCTS2lxBvtjoDOafsNiYqoh4o6', 'TEACHER', 1, 'drempel@mueller.com', NULL, '2023-06-22 20:43:24', '2023-06-22 20:43:24', 12, NULL),
('e90031cd-6d01-3cf2-8373-243b81c735c6', 'bf6779e2-14d4-3ee9-9f1c-a6217ec7ad7e', 'studentuser', 'siswa@a.com', '$2y$10$5CHm..fUUXwKlWq578DyJOPqNix9425yYRhkMSjxh6UpkJSKES.R2', 'STUDENT', 1, 'ettie.dare@bergstrom.info', NULL, '2023-06-22 20:43:24', '2023-06-22 20:43:24', 12, NULL),
('fcd2b8dc-12a3-3422-a03b-e726665b0df8', 'bf6779e2-14d4-3ee9-9f1c-a6217ec7ad7e', 'adminuser', 'admin@a.com', '$2y$10$k0QyR0Rl4u7UTlQg/Q7xieOs8n31D0jAYf9qUbTToMiQoWT07eeLm', 'ADMIN', 1, 'kihn.mozell@yahoo.com', NULL, '2023-06-22 20:43:23', '2023-06-22 20:43:23', 12, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activities_topic_id_index` (`topic_id`);

--
-- Indeks untuk tabel `activity_results`
--
ALTER TABLE `activity_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_results_activity_id_index` (`activity_id`),
  ADD KEY `activity_results_student_id_index` (`student_id`);

--
-- Indeks untuk tabel `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contents_topic_id_index` (`topic_id`);

--
-- Indeks untuk tabel `content_result`
--
ALTER TABLE `content_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_result_content_id_index` (`content_id`),
  ADD KEY `content_result_student_id_index` (`student_id`);

--
-- Indeks untuk tabel `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_subject_id_index` (`subject_id`);

--
-- Indeks untuk tabel `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `experiences_user_id_index` (`user_id`),
  ADD KEY `experiences_school_id_index` (`school_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_activity_id_index` (`activity_id`);

--
-- Indeks untuk tabel `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_school_id_index` (`school_id`);

--
-- Indeks untuk tabel `subject_teachers`
--
ALTER TABLE `subject_teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_teachers_subject_id_index` (`subject_id`);

--
-- Indeks untuk tabel `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topics_course_id_index` (`course_id`),
  ADD KEY `topics_subject_id_index` (`subject_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_school_id_index` (`school_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
