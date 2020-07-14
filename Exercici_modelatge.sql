-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Temps de generació: 14-07-2020 a les 08:04:30
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
-- Base de dades: `Modelatge_BBDD`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `1_avions`
--

CREATE TABLE `1_avions` (
  `id_avio` int(11) NOT NULL,
  `capacitat` int(11) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `1_seients`
--

CREATE TABLE `1_seients` (
  `id_seient` int(10) UNSIGNED NOT NULL,
  `avio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `2_compradorQuadres`
--

CREATE TABLE `2_compradorQuadres` (
  `dni` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `cognom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `2_quadres`
--

CREATE TABLE `2_quadres` (
  `id_quadre` int(11) NOT NULL,
  `preu_quadre` float DEFAULT NULL,
  `autor_quadre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `2_ventaQuadres`
--

CREATE TABLE `2_ventaQuadres` (
  `num_factura` int(11) NOT NULL,
  `quadre` int(11) NOT NULL,
  `comprador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `3_usuari`
--

CREATE TABLE `3_usuari` (
  `email` varchar(100) NOT NULL,
  `contrasenya` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `3_visualitzacions`
--

CREATE TABLE `3_visualitzacions` (
  `id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `usuari` varchar(100) NOT NULL,
  `video` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `3_vídeos`
--

CREATE TABLE `3_vídeos` (
  `id` varchar(100) NOT NULL,
  `títol` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `descripcio` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `4_autor`
--

CREATE TABLE `4_autor` (
  `nom` varchar(100) NOT NULL,
  `direccio` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `4_cataleg_llibres`
--

CREATE TABLE `4_cataleg_llibres` (
  `llibre` varchar(100) NOT NULL,
  `unitats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `4_factura`
--

CREATE TABLE `4_factura` (
  `id` int(11) NOT NULL,
  `llibre1` varchar(100) NOT NULL,
  `usuari` varchar(100) NOT NULL,
  `llibre2` varchar(100) DEFAULT NULL,
  `llibre3` varchar(100) DEFAULT NULL,
  `llibre4` varchar(100) DEFAULT NULL,
  `llibre5` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `4_llibre`
--

CREATE TABLE `4_llibre` (
  `id` varchar(100) NOT NULL,
  `titol` varchar(100) NOT NULL,
  `preu` float DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `4_llibres_autor`
--

CREATE TABLE `4_llibres_autor` (
  `autor` varchar(100) NOT NULL,
  `llibre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `4_usuari`
--

CREATE TABLE `4_usuari` (
  `email` varchar(100) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `contrasenya` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `5_amistat`
--

CREATE TABLE `5_amistat` (
  `usuari1` varchar(100) NOT NULL,
  `usauri2` varchar(100) NOT NULL,
  `motiu_amistat` varchar(100) DEFAULT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `5_fotos`
--

CREATE TABLE `5_fotos` (
  `codi` varchar(100) NOT NULL,
  `lloc` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `usuari` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `5_usuari`
--

CREATE TABLE `5_usuari` (
  `id` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasenya` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `1_avions`
--
ALTER TABLE `1_avions`
  ADD PRIMARY KEY (`id_avio`);

--
-- Índexs per a la taula `1_seients`
--
ALTER TABLE `1_seients`
  ADD PRIMARY KEY (`id_seient`),
  ADD KEY `avio` (`avio`);

--
-- Índexs per a la taula `2_compradorQuadres`
--
ALTER TABLE `2_compradorQuadres`
  ADD PRIMARY KEY (`dni`);

--
-- Índexs per a la taula `2_quadres`
--
ALTER TABLE `2_quadres`
  ADD PRIMARY KEY (`id_quadre`);

--
-- Índexs per a la taula `2_ventaQuadres`
--
ALTER TABLE `2_ventaQuadres`
  ADD PRIMARY KEY (`num_factura`),
  ADD KEY `taula_ventaQuadres_FK` (`quadre`),
  ADD KEY `taula_ventaQuadres_FK_1` (`comprador`);

--
-- Índexs per a la taula `3_usuari`
--
ALTER TABLE `3_usuari`
  ADD PRIMARY KEY (`email`);

--
-- Índexs per a la taula `3_visualitzacions`
--
ALTER TABLE `3_visualitzacions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taula_visualitzacions_FK` (`usuari`),
  ADD KEY `taula_visualitzacions_FK_1` (`video`);

--
-- Índexs per a la taula `3_vídeos`
--
ALTER TABLE `3_vídeos`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `4_autor`
--
ALTER TABLE `4_autor`
  ADD PRIMARY KEY (`nom`);

--
-- Índexs per a la taula `4_cataleg_llibres`
--
ALTER TABLE `4_cataleg_llibres`
  ADD KEY `4_cataleg_llibres_FK` (`llibre`);

--
-- Índexs per a la taula `4_factura`
--
ALTER TABLE `4_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `4_factura_FK` (`llibre1`),
  ADD KEY `4_factura_FK_1` (`llibre2`),
  ADD KEY `4_factura_FK_2` (`llibre3`),
  ADD KEY `4_factura_FK_3` (`llibre4`),
  ADD KEY `4_factura_FK_4` (`llibre5`),
  ADD KEY `4_factura_FK_5` (`usuari`);

--
-- Índexs per a la taula `4_llibre`
--
ALTER TABLE `4_llibre`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `4_llibres_autor`
--
ALTER TABLE `4_llibres_autor`
  ADD KEY `4_llibres_autor_FK` (`autor`),
  ADD KEY `4_llibres_autor_FK_1` (`llibre`);

--
-- Índexs per a la taula `4_usuari`
--
ALTER TABLE `4_usuari`
  ADD PRIMARY KEY (`email`);

--
-- Índexs per a la taula `5_amistat`
--
ALTER TABLE `5_amistat`
  ADD KEY `5_amistat_FK` (`usuari1`),
  ADD KEY `5_amistat_FK_1` (`usauri2`);

--
-- Índexs per a la taula `5_fotos`
--
ALTER TABLE `5_fotos`
  ADD PRIMARY KEY (`codi`),
  ADD KEY `5_fotos_FK` (`usuari`);

--
-- Índexs per a la taula `5_usuari`
--
ALTER TABLE `5_usuari`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `2_quadres`
--
ALTER TABLE `2_quadres`
  MODIFY `id_quadre` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `1_avions`
--
ALTER TABLE `1_avions`
  ADD CONSTRAINT `1_avions_ibfk_1` FOREIGN KEY (`id_avio`) REFERENCES `1_seients` (`avio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per a la taula `1_seients`
--
ALTER TABLE `1_seients`
  ADD CONSTRAINT `1_seients_ibfk_1` FOREIGN KEY (`avio`) REFERENCES `1_avions` (`id_avio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per a la taula `2_ventaQuadres`
--
ALTER TABLE `2_ventaQuadres`
  ADD CONSTRAINT `taula_ventaQuadres_FK` FOREIGN KEY (`quadre`) REFERENCES `2_quadres` (`id_quadre`),
  ADD CONSTRAINT `taula_ventaQuadres_FK_1` FOREIGN KEY (`comprador`) REFERENCES `2_compradorQuadres` (`dni`);

--
-- Restriccions per a la taula `3_visualitzacions`
--
ALTER TABLE `3_visualitzacions`
  ADD CONSTRAINT `taula_visualitzacions_FK` FOREIGN KEY (`usuari`) REFERENCES `3_usuari` (`email`),
  ADD CONSTRAINT `taula_visualitzacions_FK_1` FOREIGN KEY (`video`) REFERENCES `3_vídeos` (`id`);

--
-- Restriccions per a la taula `4_cataleg_llibres`
--
ALTER TABLE `4_cataleg_llibres`
  ADD CONSTRAINT `4_cataleg_llibres_FK` FOREIGN KEY (`llibre`) REFERENCES `4_llibre` (`id`);

--
-- Restriccions per a la taula `4_factura`
--
ALTER TABLE `4_factura`
  ADD CONSTRAINT `4_factura_FK` FOREIGN KEY (`llibre1`) REFERENCES `4_llibre` (`id`),
  ADD CONSTRAINT `4_factura_FK_1` FOREIGN KEY (`llibre2`) REFERENCES `4_llibre` (`id`),
  ADD CONSTRAINT `4_factura_FK_2` FOREIGN KEY (`llibre3`) REFERENCES `4_llibre` (`id`),
  ADD CONSTRAINT `4_factura_FK_3` FOREIGN KEY (`llibre4`) REFERENCES `4_llibre` (`id`),
  ADD CONSTRAINT `4_factura_FK_4` FOREIGN KEY (`llibre5`) REFERENCES `4_llibre` (`id`),
  ADD CONSTRAINT `4_factura_FK_5` FOREIGN KEY (`usuari`) REFERENCES `4_usuari` (`email`);

--
-- Restriccions per a la taula `4_llibres_autor`
--
ALTER TABLE `4_llibres_autor`
  ADD CONSTRAINT `4_llibres_autor_FK` FOREIGN KEY (`autor`) REFERENCES `4_autor` (`nom`),
  ADD CONSTRAINT `4_llibres_autor_FK_1` FOREIGN KEY (`llibre`) REFERENCES `4_llibre` (`id`);

--
-- Restriccions per a la taula `5_amistat`
--
ALTER TABLE `5_amistat`
  ADD CONSTRAINT `5_amistat_FK` FOREIGN KEY (`usuari1`) REFERENCES `5_usuari` (`id`),
  ADD CONSTRAINT `5_amistat_FK_1` FOREIGN KEY (`usauri2`) REFERENCES `5_usuari` (`id`);

--
-- Restriccions per a la taula `5_fotos`
--
ALTER TABLE `5_fotos`
  ADD CONSTRAINT `5_fotos_FK` FOREIGN KEY (`usuari`) REFERENCES `5_usuari` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
