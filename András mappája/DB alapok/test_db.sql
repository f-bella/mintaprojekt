-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Már 07. 15:36
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `test_db`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `roleName` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `roles`
--

INSERT INTO `roles` (`id`, `roleName`, `created`) VALUES
(1, 'Admin', '2025-03-07 13:50:01'),
(2, 'Vendég', '2025-03-07 13:42:22');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `statuslist`
--

CREATE TABLE `statuslist` (
  `id` int(11) NOT NULL,
  `statusName` varchar(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `statuslist`
--

INSERT INTO `statuslist` (`id`, `statusName`, `created`) VALUES
(1, 'Aktív', '2025-03-07 14:11:58'),
(2, 'Leszámolt', '2025-03-07 14:12:03');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `role` int(11) NOT NULL,
  `lastEvent` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `userName`, `role`, `lastEvent`, `active`) VALUES
(1, 'admin', 1, '2025-03-07 13:50:05', 1),
(2, 'vendég 1', 2, '2025-03-07 13:46:34', 1),
(3, 'vendég 2', 2, '2025-03-07 13:34:21', 1),
(4, 'vendég 3', 2, '2025-03-07 14:12:09', 2),
(5, 'Gipsz Jakab', 2, '2025-03-07 14:24:11', 2),
(6, 'vendég 1', 2, '2025-03-07 14:27:16', 1),
(7, 'vendég 2', 2, '2025-03-07 14:27:16', 1),
(8, 'vendég 3', 2, '2025-03-07 14:27:16', 1),
(9, 'vendég 4', 2, '2025-03-07 14:27:16', 1),
(10, 'vendég 1', 2, '2025-03-07 14:27:16', 1),
(11, 'vendég 2', 2, '2025-03-07 14:27:16', 1),
(12, 'vendég 3', 2, '2025-03-07 14:27:16', 1),
(13, 'vendég 4', 2, '2025-03-07 14:27:16', 1),
(14, 'vendég 1', 2, '2025-03-07 14:27:16', 1),
(15, 'vendég 2', 2, '2025-03-07 14:27:16', 1),
(16, 'vendég 3', 2, '2025-03-07 14:27:16', 1),
(17, 'vendég 4', 2, '2025-03-07 14:27:16', 1),
(18, 'vendég 1', 2, '2025-03-07 14:27:16', 1),
(19, 'vendég 2', 2, '2025-03-07 14:27:16', 1),
(20, 'vendég 3', 2, '2025-03-07 14:27:16', 1),
(21, 'vendég 4', 2, '2025-03-07 14:27:16', 1),
(22, 'vendég 1', 2, '2025-03-07 14:27:16', 1),
(23, 'vendég 2', 2, '2025-03-07 14:27:16', 1),
(24, 'vendég 3', 2, '2025-03-07 14:27:16', 1),
(25, 'vendég 4', 2, '2025-03-07 14:27:16', 1),
(26, 'vendég 1', 2, '2025-03-07 14:27:16', 1),
(27, 'vendég 2', 2, '2025-03-07 14:27:16', 1),
(28, 'vendég 3', 2, '2025-03-07 14:27:16', 1),
(29, 'vendég 4', 2, '2025-03-07 14:27:16', 1),
(30, 'vendég 1', 2, '2025-03-07 14:27:16', 1),
(31, 'vendég 2', 2, '2025-03-07 14:27:16', 1),
(32, 'vendég 3', 2, '2025-03-07 14:27:16', 1),
(33, 'vendég 4', 2, '2025-03-07 14:27:16', 1),
(34, 'vendég 1', 2, '2025-03-07 14:27:16', 1),
(35, 'vendég 2', 2, '2025-03-07 14:27:16', 1),
(36, 'vendég 3', 2, '2025-03-07 14:27:16', 1),
(37, 'vendég 4', 2, '2025-03-07 14:27:16', 1);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `statuslist`
--
ALTER TABLE `statuslist`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `statuslist`
--
ALTER TABLE `statuslist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
