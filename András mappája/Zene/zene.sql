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
CREATE DEFINER=`root`@`localhost` PROCEDURE `getArtist` (IN `artist_` TEXT)   BEGIN
select 
song.song,
artist.artist,
genre.genre,
genre2.genre as genre2,
genre3.genre as genre3

from song 
left join artist on artist.id = song.artistId
left join genre on genre.id = song.genreId1
left join genre genre2 on genre2.id = song.genreId2
left join genre genre3 on genre3.id = song.genreId3

where artist.artist like concat('%',artist_,'%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getArtistCreate` (IN `created_` INT)   BEGIN
select artist, created from artist where created = created_;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getGenre` (IN `genre_` TEXT)   BEGIN
select 
song.song,
artist.artist,
genre.genre,
genre2.genre as genre2,
genre3.genre as genre3

from song 
left join artist on artist.id = song.artistId
left join genre on genre.id = song.genreId1
left join genre genre2 on genre2.id = song.genreId2
left join genre genre3 on genre3.id = song.genreId3

where genre.genre = genre_ or
genre2.genre = genre_ or 
genre3.genre = genre_ 

;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getSong` (IN `song_` TEXT)   BEGIN
select 
song.song,
artist.artist,
genre.genre,
genre2.genre as genre2,
genre3.genre as genre3

from song 
left join artist on artist.id = song.artistId
left join genre on genre.id = song.genreId1
left join genre genre2 on genre2.id = song.genreId2
left join genre genre3 on genre3.id = song.genreId3

where song like concat('%',song_,'%');
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `artist`
--

CREATE TABLE `artist` (
  `id` int(11) NOT NULL,
  `artist` text NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `artist`
--

INSERT INTO `artist` (`id`, `artist`, `created`) VALUES
(1, 'Metallica', 1981),
(2, 'Led Zepelin', 1968),
(3, 'Deep Purple', 1969),
(4, 'Motörhead', 1975),
(5, 'Testament', 1983),
(6, 'Nirvana', 1990),
(7, 'Korn', 1993),
(8, 'The Offspring', 1984),
(9, 'Black keys', 2001),
(10, 'Doors', 1965),
(11, 'Lynyrd Skynyrd', 1964),
(12, 'Diamond Head', 1976),
(13, 'Queen', 1971),
(14, 'Evanesence', 1995);

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
(1, 'Metal'),
(2, 'Country'),
(3, 'Soul'),
(4, 'Rock'),
(5, 'Pop'),
(6, 'Alternative'),
(7, 'Progressive Rock'),
(8, 'Hard Rock'),
(9, 'Grunge'),
(10, 'Trash'),
(11, 'Blues'),
(12, 'Psychedelic rock'),
(13, 'Acid rock'),
(14, 'Jazz'),
(15, 'Synth Pop'),
(16, 'Disco'),
(17, 'Fuk Rock');

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

INSERT INTO `song` (`id`, `song`, `artistId`, `genreId1`, `genreId2`, `genreId3`) VALUES
(2, 'Am I evil', 1, 1, 0, 0),
(3, 'Am I evil', 12, 1, 0, 0),
(4, 'Tuesday\'s Gone', 1, 2, 4, 3),
(5, 'Tuesday\'s Gone', 11, 2, 4, 3),
(6, 'Stone Cold Crazy', 1, 1, 4, 5),
(7, 'Stone Cold Crazy', 13, 1, 4, 5),
(8, 'Enter Sandman', 1, 1, 4, 0),
(9, 'Enter Sandman', 4, 1, 4, 0),
(10, 'Seek and Destroy', 1, 1, 0, 0),
(11, 'Seek and Destroy', 5, 1, 0, 0),
(12, 'Stairway to Heaven', 2, 5, 0, 0),
(13, 'That’s the Way', 2, 6, 5, 16),
(14, 'Smoke on the Water', 3, 5, 0, 0),
(15, 'Polly', 6, 6, 0, 0),
(16, 'Heart Shaped Box', 6, 4, 5, 6),
(17, 'Heart Shaped Box', 14, 4, 5, 6),
(18, 'One', 1, 5, 10, 0),
(19, 'One', 7, 5, 10, 0),
(20, 'Follow the Leader', 7, 5, 6, 0),
(21, 'Gotta Get Away', 8, 5, 9, 0),
(22, 'All I Want', 8, 6, 0, 0),
(23, 'Sinister Kid', 9, 6, 4, 0),
(24, 'Light my Fire', 10, 6, 11, 0),
(25, 'Sweet Home Alabama', 11, 4, 2, 0),
(26, 'I Want to Break Free', 13, 4, 5, 15),
(27, 'Another One Bites the Dust', 13, 0, 0, 0),
(28, 'Bring Me To Life', 14, 0, 0, 0);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genreId1` (`genreId1`),
  ADD KEY `genreId2` (`genreId2`),
  ADD KEY `genreId3` (`genreId3`),
  ADD KEY `artistId` (`artistId`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT a táblához `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT a táblához `song`
--
ALTER TABLE `song`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `song`
--
ALTER TABLE `song`
  ADD CONSTRAINT `song_ibfk_1` FOREIGN KEY (`artistId`) REFERENCES `artist` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
