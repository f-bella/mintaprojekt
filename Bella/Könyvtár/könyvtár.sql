-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Már 20. 13:30
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
-- Adatbázis: `zene`
--

DELIMITER $$
--
-- Eljárások
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getWriter` (IN `writer_` TEXT)   BEGIN
select 
title.title,
writer.writer,
genre.genre,
genre2.genre as genre2,
genre3.genre as genre3

from title 
left join writer on writer.id = title.writerId
left join genre on genre.id = title.genreId1
left join genre genre2 on genre2.id = title.genreId2
left join genre genre3 on genre3.id = title.genreId3

where title like concat('%',title_,'%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getWriterCreate` (IN `created_` INT)   BEGIN
select writer, created from title where created = created_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getGenre` (IN `genre_` TEXT)   BEGIN
select 
title.title,
writer.writer,
genre.genre,
genre2.genre as genre2,
genre3.genre as genre3

from title 
left join writer on writer.id = title.writerId
left join genre on genre.id = title.genreId1
left join genre genre2 on genre2.id = title.genreId2
left join genre genre3 on genre3.id = title.genreId3

where title like concat('%',title_,'%');

;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getTitle` (IN `title_` TEXT)   BEGIN
select 
title.title,
writer.writer,
genre.genre,
genre2.genre as genre2,
genre3.genre as genre3

from title 
left join writer on writer.id = title.writerId
left join genre on genre.id = title.genreId1
left join genre genre2 on genre2.id = title.genreId2
left join genre genre3 on genre3.id = title.genreId3

where title like concat('%',title_,'%');
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `artist`
--

CREATE TABLE `writer` (
  `id` int(11) NOT NULL,
  `writer` text NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `artist`
--

INSERT INTO `writer` (`id`, `writer`) VALUES
(1, 'Bulgakov, M.'),
(2, 'Tolsztoj, L.'),
(3, 'King, Stephen'),
(4, 'Lewis, Michael'),
(5, 'Simon, Tamás'),
(6, 'Bálint, Ferenc'),


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `genre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `genre`
--

INSERT INTO `genre` (`id`, `genre`) VALUES
(1, 'regény'),
(2, 'elbeszélések'),
(3, 'Gyermek- és Ifjúsági regények'),
(4, 'Állatregények'),
(5, 'Regénysorozatok'),
(6, 'Horror'),


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `song`
--

CREATE TABLE `song` (
  `id` int(11) NOT NULL,
  `song` text NOT NULL,
  `artistId` int(11) NOT NULL,
  `genreId1` int(11) NOT NULL,
  `genreId2` int(11) NOT NULL,
  `genreId3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `song`
--

INSERT INTO `title` (`id`, `title`, `writertId`, `genreId1`, `genreId2`, `genreId3`,`created` ) VALUES
(2, 'A Mester és Margarita', 1, 1, 0, 0, 1992),
(3, 'Ivan Iljics halála', 2, 2, 0, 0, 1886),
(4, 'Rémálmok Bazára', 3, 2, 6, 0, 2021),
(5, 'Villámfiúk', 4, 1, 0, 0, 2014),
(6, 'Vérmacska', 5, 3, 4, 5, 2012),
(7, 'Felelős Alkoholista', 6, 1, 0, 0, 2020),


--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `artist`
--
ALTER TABLE `writer`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `song`
--
ALTER TABLE `title`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genreId1` (`genreId1`),
  ADD KEY `genreId2` (`genreId2`),
  ADD KEY `genreId3` (`genreId3`),
  ADD KEY `writerId` (`writerId`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `artist`
--
ALTER TABLE `writer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT a táblához `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT a táblához `song`
--
ALTER TABLE `title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `song`
--
ALTER TABLE `title`
  ADD CONSTRAINT `title_ibfk_1` FOREIGN KEY (`writerId`) REFERENCES `writer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
