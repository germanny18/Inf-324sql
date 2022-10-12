-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-10-2022 a las 04:34:41
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdronald`
--
CREATE DATABASE IF NOT EXISTS `bdronald` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bdronald`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--
-- Creación: 08-10-2022 a las 14:33:33
--

CREATE TABLE `acceso` (
  `id` int(11) NOT NULL,
  `ci` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `acceso`
--

INSERT INTO `acceso` (`id`, `ci`, `usuario`, `password`, `rol_id`) VALUES
(1, 1, 'roman', '123', 1),
(2, 1342323, 'carlos', '123', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--
-- Creación: 08-10-2022 a las 15:14:34
--

CREATE TABLE `inscripcion` (
  `id` int(11) NOT NULL,
  `ciEst` int(11) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `nota1` int(11) NOT NULL,
  `nota2` int(11) NOT NULL,
  `nota3` int(11) NOT NULL,
  `notaFinal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`id`, `ciEst`, `sigla`, `nota1`, `nota2`, `nota3`, `notaFinal`) VALUES
(1, 8290011, 'Inf-111', 20, 30, 25, 75),
(2, 8290011, 'Inf-112', 10, 30, 30, 70),
(3, 9020239, 'Inf-111', 20, 20, 20, 60),
(4, 9020239, 'Inf-112', 30, 30, 20, 80),
(5, 8342300, 'Inf-111', 20, 18, 30, 68);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--
-- Creación: 06-10-2022 a las 14:32:41
-- Última actualización: 11-10-2022 a las 23:48:25
--

CREATE TABLE `persona` (
  `ci` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `fecnac` varchar(20) NOT NULL,
  `departamento` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`ci`, `nombre`, `fecnac`, `departamento`) VALUES
(1, 'Roman', '20/10/1990', '02'),
(1342323, 'Carlos', '20/03/1994', 'SC'),
(8290011, 'Diego', '10/11/1997', '02'),
(8342300, 'Jhoselin', '27/02/1998', '02'),
(9020239, 'Ana', '20/3/1998', '07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--
-- Creación: 08-10-2022 a las 05:17:03
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `rol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol`) VALUES
(1, 'admin'),
(2, 'Director');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ci` (`ci`),
  ADD KEY `acceso-roles` (`rol_id`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ciEst` (`ciEst`) USING BTREE;

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`ci`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD CONSTRAINT `acceso-persona` FOREIGN KEY (`ci`) REFERENCES `persona` (`ci`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `acceso-roles` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `inscripcion-persona` FOREIGN KEY (`ciEst`) REFERENCES `persona` (`ci`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
