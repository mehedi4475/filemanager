-- Adminer 4.7.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8,	'2014_10_12_000000_create_users_table',	1),
(9,	'2014_10_12_100000_create_password_resets_table',	1),
(10,	'2016_06_01_000001_create_oauth_auth_codes_table',	1),
(11,	'2016_06_01_000002_create_oauth_access_tokens_table',	1),
(12,	'2016_06_01_000003_create_oauth_refresh_tokens_table',	1),
(13,	'2016_06_01_000004_create_oauth_clients_table',	1),
(14,	'2016_06_01_000005_create_oauth_personal_access_clients_table',	1);

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('07021d0d7dcc3e680a741cf14cf302bd4d143bc45f33b6219849e5b4ecfecb9a9dede8fbe941369b',	1,	1,	'MyApp',	'[]',	0,	'2020-10-31 22:34:07',	'2020-10-31 22:34:07',	'2021-11-01 04:34:07'),
('0b183a3098d997fb0385ba0d3f5a100386d6cbcf6322cf0caea0f6509204d299577cf49e9e08c422',	1,	1,	'MyApp',	'[]',	0,	'2020-10-31 02:59:58',	'2020-10-31 02:59:58',	'2021-10-31 08:59:58'),
('1c1975703e7ce255875a2e9c0cf75f650d49b783941b60b2df446de5c11bc3054f32550fd6e4264a',	1,	1,	'MyApp',	'[]',	0,	'2020-10-31 03:04:44',	'2020-10-31 03:04:44',	'2021-10-31 09:04:44'),
('21d81d0778114fb05d9f15b5eb29b77f491615ff13f5ab9dc031894e4c698a5fa57f3edd7b9368a1',	1,	1,	'MyApp',	'[]',	0,	'2020-10-31 03:05:19',	'2020-10-31 03:05:19',	'2021-10-31 09:05:19'),
('6c37fac9f32e085fc32f36480b9bb398b03a2391ecd8003f724404f0f64eb4dcd265c153e303c3d4',	6,	1,	'MyApp',	'[]',	0,	'2020-10-31 03:07:37',	'2020-10-31 03:07:37',	'2021-10-31 09:07:37'),
('6ed38a1014587acef4001f5faa118be56089eca27f690af1e50f53d34fbb675682eef507f31e9b84',	1,	1,	'MyApp',	'[]',	0,	'2020-10-31 03:04:42',	'2020-10-31 03:04:42',	'2021-10-31 09:04:42'),
('767be9a8b6535ae020dee8c04e239dc048a234ce10a8b1b6a171471a01ab4e88c28b308a26c031b2',	1,	1,	'MyApp',	'[]',	0,	'2020-10-31 03:04:36',	'2020-10-31 03:04:36',	'2021-10-31 09:04:36'),
('88cb3c7b17220fcecd88e04616e0dacb25c50483ec63252a0f01af9abb873b6a42c411f5c6852267',	1,	1,	'MyApp',	'[]',	0,	'2020-10-31 02:56:59',	'2020-10-31 02:56:59',	'2021-10-31 08:56:59'),
('9193a47a20629075e3762ea4502dc7182b1169195124326c95ab101dd67e0ddc347a511990620b8d',	1,	1,	'MyApp',	'[]',	0,	'2020-10-31 03:06:44',	'2020-10-31 03:06:44',	'2021-10-31 09:06:44'),
('bb15f9a1bfb4da610a1737a11832f9c3d9b96264372014c05e29c88e2a2e482921c45000a9c43d49',	1,	1,	'MyApp',	'[]',	0,	'2020-10-31 22:31:56',	'2020-10-31 22:31:56',	'2021-11-01 04:31:56'),
('c0736cd84564547417745b45afe0f71510dbd87fa3ab539a81f6cb0fae4deebe6d78d80caedfb990',	1,	1,	'MyApp',	'[]',	0,	'2020-10-31 22:49:57',	'2020-10-31 22:49:57',	'2021-11-01 04:49:57'),
('c98405490a294f9d18f322788211ca1395525271bd4803b86f177d640cc991b9698bf7c8363745a7',	1,	1,	'MyApp',	'[]',	0,	'2020-10-31 03:06:47',	'2020-10-31 03:06:47',	'2021-10-31 09:06:47'),
('d48a987da7c572269d759e0005101da475e8190ec059e3a140f57afdf3c600b94d276d5de6f9563e',	5,	1,	'MyApp',	'[]',	0,	'2020-10-31 03:07:27',	'2020-10-31 03:07:27',	'2021-10-31 09:07:27'),
('e3bff1e5a51455aff2cab6e223f84758c6cbcd6dfcc34c652f1d044be3e2706ac73ce5ec35963493',	1,	1,	'MyApp',	'[]',	0,	'2020-10-31 22:32:49',	'2020-10-31 22:32:49',	'2021-11-01 04:32:49'),
('e62bf4ac9c91cd3661d52d283dd634b91b493eb6f5307d9b8ddaf7888602648c07c83655e485c684',	1,	1,	'MyApp',	'[]',	0,	'2020-10-31 03:06:48',	'2020-10-31 03:06:48',	'2021-10-31 09:06:48');

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1,	NULL,	'Laravel Personal Access Client',	'n2dChkPRsMHaDWNtnsVckPfkuPtuTpSHGAxnbutX',	'http://localhost',	1,	0,	0,	'2020-10-31 02:54:52',	'2020-10-31 02:54:52'),
(2,	NULL,	'Laravel Password Grant Client',	'P1vpiuelx3T3wb0drl4uPKtSFkwnIJ1MHemYalyw',	'http://localhost',	0,	1,	0,	'2020-10-31 02:54:52',	'2020-10-31 02:54:52');

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1,	1,	'2020-10-31 02:54:52',	'2020-10-31 02:54:52');

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'Mehedi Hasan',	'mehedi4475@gmail.com',	'$2y$10$SCoHrYHFU6nQUuVKu7HvLupNK96SfNMsjeK./sL32uFHyvdfENCxC',	NULL,	NULL,	'2020-10-31 02:54:39',	'2020-10-31 02:54:39');

-- 2020-11-01 05:42:11
