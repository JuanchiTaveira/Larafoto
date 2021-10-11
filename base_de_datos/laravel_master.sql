-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2021 a las 12:32:46
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laravel_master`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `image_id` int(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `image_id`, `content`, `created_at`, `updated_at`) VALUES
(5, 11, 16, 'Buena foto pa', '2021-09-08 11:30:58', '2021-09-08 11:30:58'),
(6, 10, 16, 'Buen paisaje!', '2021-09-09 13:07:51', '2021-09-09 13:07:51'),
(7, 10, 15, 'Muy linda foto', '2021-09-09 13:13:41', '2021-09-09 13:13:41'),
(8, 10, 17, 'jeje', '2021-09-26 12:15:49', '2021-09-26 12:15:49'),
(9, 10, 8, 'putoo', '2021-09-27 17:37:31', '2021-09-27 17:37:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`id`, `user_id`, `image_path`, `description`, `created_at`, `updated_at`) VALUES
(8, 11, '1628945713paisaje1.jpg', 'Lindo paisaje', '2021-08-14 12:55:13', '2021-08-14 12:55:13'),
(9, 10, '1628945761paisaje2.jpg', 'Descripción de prueba', '2021-08-14 12:56:01', '2021-08-14 12:56:01'),
(10, 12, '1629047412paisaje3.jpg', 'jejeje', '2021-08-15 17:10:12', '2021-08-15 17:10:12'),
(14, 11, '1629050294paisaje7.jpg', 'Paisaje 7.', '2021-08-15 17:58:14', '2021-08-15 17:58:14'),
(15, 11, '1629050306paisaje8.jpg', 'Paisaje 8.', '2021-08-15 17:58:26', '2021-08-15 17:58:26'),
(16, 10, '1632510242imagen1.jpg', 'Nueva descripcion.', '2021-08-21 12:06:51', '2021-09-24 19:04:02'),
(17, 10, '1632658529paisaje7.jpg', 'Nueva fotooo', '2021-09-26 12:15:29', '2021-09-26 12:15:29'),
(18, 10, '1632764327paisaje8.jpg', 'CACA', '2021-09-27 17:38:47', '2021-09-27 17:38:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE `likes` (
  `id` int(255) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `image_id` int(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `image_id`, `created_at`, `updated_at`) VALUES
(16, 12, 8, NULL, NULL),
(20, 12, 16, NULL, NULL),
(21, 12, 8, '2021-09-10 00:08:17', '2021-09-10 00:08:19'),
(22, 10, 9, '2021-09-12 19:57:02', '2021-09-12 19:57:02'),
(25, 10, 16, '2021-09-12 21:16:54', '2021-09-12 21:16:54'),
(29, 10, 17, '2021-09-26 12:15:35', '2021-09-26 12:15:35'),
(30, 10, 15, '2021-09-27 17:37:11', '2021-09-27 17:37:11'),
(31, 10, 14, '2021-09-27 17:37:23', '2021-09-27 17:37:23'),
(32, 10, 8, '2021-09-27 17:37:41', '2021-09-27 17:37:41'),
(33, 10, 18, '2021-09-27 17:38:52', '2021-09-27 17:38:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `surname` varchar(200) DEFAULT NULL,
  `nick` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `surname`, `nick`, `email`, `password`, `image`, `created_at`, `updated_at`, `remember_token`) VALUES
(7, NULL, 'Felipe', 'Taveira', 'FTQ484', 'feli@feli.com', '$2y$10$iqslSYLMGjPcCaoY4OVIbeIdPj61QJeaemLqldhO4Xzare6redgrm', NULL, '2021-06-25 16:51:27', '2021-06-25 16:51:27', NULL),
(8, 'user', 'Paco', 'Sanchez', 'PacoS', 'paco@paco.com', '$2y$10$bqY4GJ7m/UG.EE2edeN9R.EZnZ1BrBL/VbLILaYmm1JWvA9WbhAcG', NULL, '2021-06-25 16:53:24', '2021-06-25 16:53:24', NULL),
(10, 'user', 'Juan', 'Taveira', 'JuanchiTaveira', 'juan@juan.com', '$2y$10$tDu0dP2EVT5jec1Xzg02.OcYkXKZnPlhxm7Zhxziv4PC3.C0WALLm', '1628945562avatar1.jpg', '2021-08-14 12:52:28', '2021-08-14 12:52:42', NULL),
(11, 'user', 'Leo', 'Messi', 'LeoMessi', 'leo@leo.com', '$2y$10$2tqSdsLIRT.it3jcfAX8UOtNPzmiJowL0IsRYifnfDT0NWi46SYrq', '1628945625avatar2.jpg', '2021-08-14 12:53:37', '2021-08-14 12:53:45', NULL),
(12, 'user', 'Admin', 'Admin', 'Admin', 'admin@admin.com', '$2y$10$lnmhmWtS0cKpyE9zcyj2beTb3WPqdq.Z8iuSLXgM3Z3c1r.WSuQCi', '1632599726istockphoto-1301425794-170667a.jpg', '2021-08-14 13:14:35', '2021-09-25 19:55:26', 'uJaB7YjNMaVjExxs8K2TyFvJXu6qKWt6DN8LQ1AHR7xXXB70CdYveGGyBgvM'),
(13, 'user', 'Felipe', 'Taveira Quercia', 'FeliT', 'feli2@feli.com', '$2y$10$PeTBC4Im1h9S5rlDLrTmcejyzi33J07sBpDIJIjSiIfUCR3aP3g8u', '1632766570istockphoto-1301425794-170667a.jpg', '2021-09-27 17:35:14', '2021-09-27 18:16:10', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comments_users` (`user_id`),
  ADD KEY `fk_comments_images` (`image_id`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_images_users` (`user_id`);

--
-- Indices de la tabla `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_likes_users` (`user_id`),
  ADD KEY `fk_likes_images` (`image_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nick` (`nick`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_images` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `fk_comments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_images_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_likes_images` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `fk_likes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
