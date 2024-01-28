-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Jan 28. 15:29
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `webshop`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `merchant`
--

CREATE TABLE `merchant` (
  `Id` int(11) NOT NULL,
  `SerialName` varchar(200) NOT NULL,
  `Type` varchar(200) NOT NULL,
  `Price` int(50) NOT NULL,
  `QuantityId` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `merchant`
--

INSERT INTO `merchant` (`Id`, `SerialName`, `Type`, `Price`, `QuantityId`) VALUES
(1, 'Sövényvágó', '', 10000, 1),
(2, 'Fűnyíró', '', 5000, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `order`
--

CREATE TABLE `order` (
  `Id` int(11) NOT NULL,
  `Orders` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `quantity`
--

CREATE TABLE `quantity` (
  `Id` int(100) NOT NULL,
  `quantityPurchased` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `quantity`
--

INSERT INTO `quantity` (`Id`, `quantityPurchased`) VALUES
(1, 5),
(2, 6),
(3, 7);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `storage`
--

CREATE TABLE `storage` (
  `Id` int(11) NOT NULL,
  `Existing` int(20) NOT NULL,
  `Sold` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `PhoneNumber` int(20) NOT NULL,
  `Date` date DEFAULT NULL,
  `MerchantId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`Id`, `Name`, `Password`, `Email`, `PhoneNumber`, `Date`, `MerchantId`) VALUES
(1, 'Bence', 'Példa', 'Példa', 705324152, '2024-01-10', 1),
(2, 'Dávid', 'Példa2', 'Példa2', 123456789, '2024-01-23', 2);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `merchant`
--
ALTER TABLE `merchant`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `QuantityId` (`QuantityId`);

--
-- A tábla indexei `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `quantity`
--
ALTER TABLE `quantity`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `MerchantsId` (`MerchantId`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `merchant`
--
ALTER TABLE `merchant`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `order`
--
ALTER TABLE `order`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `quantity`
--
ALTER TABLE `quantity`
  MODIFY `Id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `storage`
--
ALTER TABLE `storage`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `merchant`
--
ALTER TABLE `merchant`
  ADD CONSTRAINT `merchant_ibfk_2` FOREIGN KEY (`QuantityId`) REFERENCES `quantity` (`Id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`MerchantId`) REFERENCES `merchant` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
