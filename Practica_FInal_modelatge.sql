-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Temps de generació: 14-07-2020 a les 08:05:00
-- Versió del servidor: 10.4.13-MariaDB
-- Versió de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `Practica_FInal`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `adreca`
--

CREATE TABLE `adreca` (
  `id` varchar(100) NOT NULL,
  `carrer` varchar(100) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `pis` varchar(100) DEFAULT NULL,
  `porta` varchar(100) DEFAULT NULL,
  `ciutat` varchar(100) DEFAULT NULL,
  `codipostal` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `articles`
--

CREATE TABLE `articles` (
  `codi` varchar(100) NOT NULL,
  `desciripcio` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `articles_venta`
--

CREATE TABLE `articles_venta` (
  `id_factura` varchar(100) NOT NULL,
  `article` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `client`
--

CREATE TABLE `client` (
  `id` varchar(100) NOT NULL,
  `adreca` varchar(100) DEFAULT NULL,
  `telefon` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dataRegistre` date DEFAULT NULL,
  `clientPadri` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `empleat`
--

CREATE TABLE `empleat` (
  `id` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `proveidor`
--

CREATE TABLE `proveidor` (
  `nif` varchar(100) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `adreca` varchar(100) DEFAULT NULL,
  `telefon` varchar(100) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `tipus_montura`
--

CREATE TABLE `tipus_montura` (
  `id` int(11) NOT NULL,
  `tipus` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `ulleres`
--

CREATE TABLE `ulleres` (
  `model` varchar(100) NOT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `preu` float DEFAULT NULL,
  `montura` int(11) DEFAULT NULL,
  `graduacio_esq` float DEFAULT NULL,
  `graduacio_dre` float DEFAULT NULL,
  `color_montura` varchar(100) DEFAULT NULL,
  `color_dre` varchar(100) DEFAULT NULL,
  `color_esq` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `ventes`
--

CREATE TABLE `ventes` (
  `id_factura` varchar(100) NOT NULL,
  `client` varchar(100) NOT NULL,
  `empleat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `adreca`
--
ALTER TABLE `adreca`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`codi`);

--
-- Índexs per a la taula `articles_venta`
--
ALTER TABLE `articles_venta`
  ADD KEY `articles_venta_FK` (`id_factura`),
  ADD KEY `articles_venta_FK_1` (`article`);

--
-- Índexs per a la taula `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_FK` (`clientPadri`),
  ADD KEY `client_FK_1` (`adreca`);

--
-- Índexs per a la taula `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`nif`),
  ADD KEY `proveidor_FK` (`adreca`);

--
-- Índexs per a la taula `tipus_montura`
--
ALTER TABLE `tipus_montura`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`model`),
  ADD KEY `ulleres_FK` (`montura`);

--
-- Índexs per a la taula `ventes`
--
ALTER TABLE `ventes`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `NewTable_FK` (`client`),
  ADD KEY `NewTable_FK_1` (`empleat`);

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `articles_venta`
--
ALTER TABLE `articles_venta`
  ADD CONSTRAINT `articles_venta_FK` FOREIGN KEY (`id_factura`) REFERENCES `ventes` (`id_factura`),
  ADD CONSTRAINT `articles_venta_FK_1` FOREIGN KEY (`article`) REFERENCES `articles` (`codi`);

--
-- Restriccions per a la taula `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_FK` FOREIGN KEY (`clientPadri`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `client_FK_1` FOREIGN KEY (`adreca`) REFERENCES `adreca` (`id`);

--
-- Restriccions per a la taula `proveidor`
--
ALTER TABLE `proveidor`
  ADD CONSTRAINT `proveidor_FK` FOREIGN KEY (`adreca`) REFERENCES `adreca` (`id`);

--
-- Restriccions per a la taula `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_FK` FOREIGN KEY (`montura`) REFERENCES `tipus_montura` (`id`);

--
-- Restriccions per a la taula `ventes`
--
ALTER TABLE `ventes`
  ADD CONSTRAINT `NewTable_FK` FOREIGN KEY (`client`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `NewTable_FK_1` FOREIGN KEY (`empleat`) REFERENCES `empleat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
