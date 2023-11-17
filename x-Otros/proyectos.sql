-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2023 a las 09:10:32
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectos`
--
CREATE DATABASE IF NOT EXISTS `proyectos` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `proyectos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `cod_ciudad` tinyint(4) NOT NULL,
  `ciudad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`cod_ciudad`, `ciudad`) VALUES
(1, 'Castellon De La Plana/Castello De La Pla'),
(2, 'Pontevedra'),
(3, 'Santa Cruz De Tenerife'),
(4, 'Lleida'),
(5, 'Valencia'),
(6, 'Granada'),
(7, 'Girona'),
(8, 'Zaragoza'),
(9, 'Donostia-San Sebastian'),
(10, 'Toledo'),
(11, 'Valladolid'),
(12, 'Sant Cugat Del Valles'),
(13, 'Palmas De Gran Canaria, Las'),
(14, 'Vigo'),
(15, 'Pamplona/Iruña'),
(16, 'Santiago De Compostela'),
(17, 'Almeria'),
(18, 'Ceuta'),
(19, 'Vitoria-Gasteiz'),
(20, 'Zamora'),
(21, 'Sevilla'),
(22, 'Badajoz'),
(23, 'Alicante/Alacant'),
(24, 'Leon'),
(25, 'Cadiz'),
(26, 'Madrid'),
(27, 'Ourense'),
(28, 'Elx/Elche'),
(29, 'Malaga'),
(30, 'Palencia'),
(31, 'Palma De Mallorca'),
(32, 'Sabadell');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desarrolla`
--

CREATE TABLE `desarrolla` (
  `cod_pro` tinyint(4) NOT NULL,
  `dni` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `desarrolla`
--

INSERT INTO `desarrolla` (`cod_pro`, `dni`) VALUES
(1, '21746795'),
(1, '33912646'),
(1, '64409551'),
(2, '29174552'),
(2, '30070445'),
(3, '16665910'),
(3, '41939965'),
(3, '57020285'),
(4, '17224186'),
(4, '22289378'),
(5, '31849420'),
(5, '67209201');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `categoria` tinyint(4) NOT NULL,
  `titulación` varchar(12) NOT NULL,
  `Ciudad` tinyint(4) NOT NULL,
  `Salario` float NOT NULL,
  `cod_suc` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`dni`, `nombre`, `categoria`, `titulación`, `Ciudad`, `Salario`, `cod_suc`) VALUES
('10156300', 'María', 2, 'auxiliar', 11, 1200, 13),
('10719039', 'Mario', 3, 'auxiliar', 16, 1000, 18),
('11293833', 'Alma', 2, 'secretario', 9, 1300, 19),
('11455202', 'Emma', 4, 'secretario', 20, 1100, 24),
('11747286', 'Lucía', 3, 'secretario', 19, 1200, 46),
('12730678', 'Lara', 2, 'secretario', 16, 1300, 18),
('13385982', 'Carmen', 4, 'auxiliar', 23, 900, 27),
('13689990', 'Lucas', 3, 'auxiliar', 26, 1000, 38),
('14033233', 'Mario', 1, 'Arquitecto', 13, 2200, 41),
('14579392', 'Bruno', 3, 'secretario', 30, 1200, 44),
('15161258', 'Bruno', 1, 'Delineante', 2, 1800, 8),
('15669832', 'Oliver', 3, 'secretario', 21, 1200, 25),
('15917075', 'David', 4, 'auxiliar', 22, 900, 26),
('16341184', 'Alma', 1, 'auxiliar', 22, 1400, 26),
('16657760', 'Julia', 1, 'Aparejador', 9, 1700, 30),
('16665910', 'Sofía', 4, 'secretario', 13, 1100, 41),
('17224186', 'Lucas', 1, 'secretario', 13, 1500, 15),
('17450608', 'Vega', 1, 'auxiliar', 11, 1400, 13),
('17975440', 'Mario', 4, 'auxiliar', 19, 900, 46),
('18682519', 'Álvaro', 1, 'secretario', 4, 1500, 7),
('18850243', 'María', 3, 'secretario', 31, 1200, 47),
('18893607', 'Mario', 4, 'secretario', 6, 1100, 31),
('18908423', 'Oliver', 2, 'auxiliar', 2, 1200, 8),
('19186828', 'Alejandro', 4, 'auxiliar', 15, 900, 42),
('19278350', 'David', 3, 'auxiliar', 9, 1000, 11),
('19297161', 'Sofía', 1, 'Aparejador', 3, 1700, 3),
('20186981', 'Julia', 3, 'auxiliar', 30, 1000, 44),
('20332623', 'Daniela', 3, 'auxiliar', 4, 1000, 7),
('20404501', 'Alejandro', 1, 'auxiliar', 4, 1400, 4),
('20805183', 'Sofía', 1, 'auxiliar', 2, 1400, 8),
('21746795', 'Bruno', 2, 'secretario', 13, 1300, 34),
('21902666', 'Adrián', 1, 'Ingeniero', 4, 2400, 45),
('22289378', 'Alma', 3, 'auxiliar', 3, 1000, 3),
('22660869', 'Alejandro', 1, 'Aparejador', 6, 1700, 6),
('22886399', 'Lucía', 4, 'secretario', 11, 1100, 50),
('23203184', 'Diego', 1, 'auxiliar', 17, 1400, 20),
('23298609', 'Thiago', 1, 'Aparejador', 16, 1700, 18),
('23454003', 'Noa', 1, 'auxiliar', 8, 1400, 28),
('23694163', 'Bruno', 4, 'auxiliar', 19, 900, 23),
('24135677', 'Martín', 2, 'secretario', 18, 1300, 37),
('24299115', 'Mario', 4, 'auxiliar', 9, 900, 11),
('25002697', 'María', 3, 'auxiliar', 11, 1000, 50),
('25224783', 'Oliver', 4, 'secretario', 14, 1100, 16),
('25519306', 'Oliver', 1, 'secretario', 27, 1500, 39),
('25678062', 'Daniela', 4, 'secretario', 18, 1100, 22),
('26080311', 'Álvaro', 4, 'auxiliar', 10, 900, 12),
('27409121', 'Carmen', 2, 'auxiliar', 14, 1200, 16),
('27554557', 'Vega', 1, 'Delineante', 24, 1800, 32),
('28463896', 'Lucía', 1, 'Ingeniero', 19, 2400, 35),
('28901199', 'Lucía', 4, 'auxiliar', 20, 900, 24),
('29174552', 'María', 1, 'auxiliar', 3, 1400, 3),
('29275645', 'Vega', 3, 'auxiliar', 15, 1000, 42),
('29346542', 'Lucía', 3, 'secretario', 19, 1200, 29),
('29541520', 'Adrián', 1, 'secretario', 1, 1500, 1),
('29896623', 'Sofía', 4, 'auxiliar', 8, 900, 28),
('30070445', 'Lara', 4, 'secretario', 13, 1100, 41),
('30379529', 'Pablo', 4, 'secretario', 14, 1100, 16),
('30408941', 'Noa', 3, 'secretario', 15, 1200, 17),
('30423258', 'Daniel', 3, 'secretario', 27, 1200, 39),
('31281998', 'Lucía', 3, 'auxiliar', 4, 1000, 45),
('31737886', 'Pablo', 3, 'secretario', 27, 1200, 39),
('31769062', 'Alejandro', 3, 'secretario', 16, 1200, 18),
('31849420', 'Diego', 2, 'secretario', 13, 1300, 34),
('32020886', 'Julia', 3, 'secretario', 31, 1200, 47),
('32361455', 'David', 3, 'secretario', 28, 1200, 40),
('32456879', 'Emma', 1, 'secretario', 26, 1500, 38),
('33228539', 'Álvaro', 4, 'auxiliar', 22, 900, 26),
('33551898', 'Adrián', 3, 'secretario', 12, 1200, 14),
('33912646', 'Emma', 1, 'auxiliar', 13, 1400, 15),
('34376032', 'Noa', 3, 'auxiliar', 24, 1000, 32),
('34948410', 'Alejandro', 2, 'auxiliar', 6, 1200, 31),
('35082665', 'Carla', 1, 'Ingeniero', 13, 2400, 15),
('35163350', 'Lucas', 3, 'secretario', 18, 1200, 22),
('35436791', 'Lucía', 3, 'secretario', 16, 1200, 49),
('35452287', 'Vega', 3, 'auxiliar', 10, 1000, 12),
('36134940', 'Sofía', 2, 'secretario', 6, 1300, 6),
('36586456', 'Alma', 1, 'secretario', 7, 1500, 9),
('36793176', 'Alejandro', 1, 'Arquitecto', 7, 2200, 9),
('36892537', 'Álvaro', 4, 'secretario', 16, 1100, 49),
('37171338', 'Adrián', 3, 'secretario', 4, 1200, 4),
('37315279', 'Pablo', 4, 'secretario', 9, 1100, 11),
('39399352', 'María', 2, 'auxiliar', 21, 1200, 25),
('39685220', 'Mario', 1, 'Delineante', 4, 1800, 4),
('39699659', 'Sofía', 1, 'Aparejador', 6, 1700, 31),
('40035963', 'David', 1, 'Aparejador', 26, 1700, 38),
('40475637', 'Noa', 1, 'auxiliar', 11, 1400, 50),
('40566425', 'Julia', 4, 'secretario', 9, 1100, 30),
('40820878', 'Pablo', 1, 'secretario', 19, 1500, 46),
('41939965', 'David', 2, 'secretario', 13, 1300, 15),
('41960210', 'Bruno', 2, 'auxiliar', 5, 1200, 5),
('42196030', 'Vega', 1, 'secretario', 19, 1500, 35),
('42530264', 'Lucía', 4, 'secretario', 23, 1100, 27),
('43236263', 'Alma', 3, 'secretario', 5, 1200, 5),
('43383800', 'Alejandro', 4, 'auxiliar', 23, 900, 27),
('44082126', 'David', 1, 'Delineante', 22, 1800, 26),
('44106560', 'Alba', 1, 'auxiliar', 18, 1400, 22),
('45810222', 'Adrián', 3, 'auxiliar', 19, 1000, 29),
('45938422', 'Thiago', 3, 'auxiliar', 25, 1000, 33),
('45976630', 'Lucía', 1, 'Arquitecto', 26, 2200, 36),
('46852146', 'Martín', 1, 'Ingeniero', 19, 2400, 29),
('46981037', 'Lucía', 2, 'auxiliar', 10, 1200, 12),
('47463533', 'David', 1, 'Ingeniero', 15, 2400, 17),
('47870608', 'Bruno', 1, 'secretario', 8, 1500, 10),
('49064647', 'Julia', 3, 'auxiliar', 9, 1000, 19),
('49215268', 'Carla', 4, 'auxiliar', 8, 900, 10),
('49600523', 'Daniela', 3, 'secretario', 24, 1200, 32),
('49681560', 'Mario', 1, 'secretario', 26, 1500, 36),
('49726458', 'Carmen', 1, 'Arquitecto', 27, 2200, 39),
('49864526', 'David', 2, 'secretario', 15, 1300, 17),
('50035163', 'María', 1, 'secretario', 19, 1500, 23),
('50449835', 'Emma', 4, 'auxiliar', 4, 900, 7),
('50503192', 'David', 4, 'secretario', 24, 1100, 32),
('50764588', 'Álvaro', 1, 'secretario', 8, 1500, 10),
('52468634', 'Vega', 3, 'auxiliar', 17, 1000, 20),
('52889855', 'Alma', 2, 'secretario', 18, 1300, 37),
('53860388', 'María', 1, 'Ingeniero', 18, 2400, 37),
('54097781', 'Thiago', 1, 'secretario', 9, 1500, 19),
('54254043', 'Bruno', 1, 'Arquitecto', 17, 2200, 20),
('54670211', 'Adrián', 3, 'auxiliar', 7, 1000, 9),
('55028815', 'Mario', 3, 'secretario', 25, 1200, 33),
('55074296', 'Álvaro', 1, 'Ingeniero', 1, 2400, 1),
('55138737', 'Bruno', 4, 'secretario', 9, 1100, 30),
('55323638', 'Pablo', 1, 'Ingeniero', 9, 2400, 19),
('55826880', 'Alma', 2, 'auxiliar', 4, 1200, 4),
('56656086', 'Alba', 4, 'secretario', 2, 1100, 8),
('57020285', 'Bruno', 1, 'secretario', 13, 1500, 34),
('57496613', 'Álvaro', 2, 'auxiliar', 26, 1200, 38),
('58043905', 'Daniela', 2, 'auxiliar', 6, 1200, 31),
('58103106', 'Sofía', 4, 'secretario', 19, 1100, 29),
('58776837', 'Pablo', 1, 'Ingeniero', 21, 2400, 25),
('60104384', 'Carla', 1, 'auxiliar', 30, 1400, 44),
('60414144', 'Julia', 1, 'Arquitecto', 13, 2200, 34),
('60632122', 'Alejandro', 3, 'secretario', 5, 1200, 5),
('60667940', 'Lucas', 4, 'secretario', 29, 1100, 43),
('60748094', 'Daniela', 4, 'auxiliar', 15, 900, 42),
('61886860', 'Emma', 1, 'Arquitecto', 19, 2200, 46),
('62024691', 'Sara', 2, 'secretario', 9, 1300, 30),
('62294248', 'Sofía', 4, 'secretario', 4, 1100, 45),
('62945238', 'Adrián', 1, 'Arquitecto', 8, 2200, 10),
('63025329', 'Noa', 1, 'Delineante', 9, 1800, 11),
('64094964', 'Lucía', 4, 'secretario', 11, 1100, 13),
('64373380', 'Alma', 1, 'Aparejador', 32, 1700, 48),
('64374358', 'Alejandro', 1, 'Delineante', 16, 1800, 49),
('64403425', 'Oliver', 2, 'auxiliar', 4, 1200, 21),
('64409551', 'Mario', 3, 'secretario', 3, 1200, 3),
('65709640', 'Julia', 1, 'auxiliar', 32, 1400, 48),
('65898711', 'Lucas', 3, 'auxiliar', 7, 1000, 9),
('66151122', 'Julia', 3, 'auxiliar', 19, 1000, 23),
('67209201', 'Alejandro', 1, 'secretario', 13, 1500, 41),
('67967327', 'Lucas', 3, 'secretario', 1, 1200, 1),
('68183088', 'Sofía', 3, 'auxiliar', 6, 1000, 6),
('68555628', 'María', 4, 'auxiliar', 26, 900, 36),
('68690663', 'Daniel', 1, 'Arquitecto', 5, 2200, 5),
('68722285', 'Daniel', 3, 'auxiliar', 4, 1000, 21),
('69003797', 'Lucas', 4, 'auxiliar', 4, 900, 21),
('69099725', 'Alma', 4, 'auxiliar', 31, 900, 47),
('69699175', 'Daniela', 3, 'auxiliar', 29, 1000, 43),
('69838092', 'Alejandro', 3, 'auxiliar', 6, 1000, 6),
('69996709', 'Vega', 3, 'secretario', 26, 1200, 36),
('70006764', 'María', 4, 'auxiliar', 12, 900, 14),
('70670951', 'Noa', 4, 'auxiliar', 4, 900, 45),
('70862713', 'Daniela', 1, 'Ingeniero', 11, 2400, 50),
('71284900', 'Martín', 4, 'auxiliar', 12, 900, 14),
('71879586', 'Sara', 1, 'Arquitecto', 10, 2200, 12),
('71890057', 'Alba', 2, 'secretario', 19, 1300, 35),
('72316183', 'Alma', 1, 'secretario', 15, 1500, 17),
('72356354', 'Diego', 4, 'secretario', 2, 1100, 2),
('72460657', 'Bruno', 2, 'secretario', 2, 1300, 2),
('72478587', 'Lucía', 1, 'Ingeniero', 14, 2400, 16),
('73018698', 'Mario', 1, 'secretario', 1, 1500, 1),
('73123212', 'Alma', 1, 'secretario', 21, 1500, 25),
('73215829', 'Sara', 3, 'auxiliar', 32, 1000, 48),
('73325402', 'Diego', 1, 'Ingeniero', 15, 2400, 42),
('73743523', 'Daniela', 1, 'Arquitecto', 25, 2200, 33),
('74113558', 'Sofía', 3, 'secretario', 19, 1200, 35),
('74854508', 'Daniela', 3, 'auxiliar', 17, 1000, 20),
('75149104', 'David', 1, 'Ingeniero', 12, 2400, 14),
('75729742', 'Carmen', 4, 'auxiliar', 16, 900, 49),
('75816929', 'Adrián', 1, 'secretario', 29, 1500, 43),
('75896940', 'Lucas', 4, 'auxiliar', 25, 900, 33),
('76420878', 'Emma', 4, 'secretario', 2, 1100, 2),
('76697455', 'Mario', 4, 'secretario', 20, 1100, 24),
('77194964', 'David', 1, 'auxiliar', 32, 1400, 48),
('77326640', 'Lucía', 4, 'auxiliar', 8, 900, 28),
('78123959', 'Alma', 3, 'auxiliar', 28, 1000, 40),
('78445812', 'María', 1, 'Ingeniero', 30, 2400, 44),
('79330964', 'Adrián', 3, 'secretario', 18, 1200, 37),
('79336125', 'Alejandro', 4, 'secretario', 28, 1100, 40),
('79556964', 'Carla', 1, 'Delineante', 8, 1800, 28),
('79741222', 'Oliver', 1, 'Delineante', 31, 1800, 47),
('80638066', 'Lucas', 1, 'Arquitecto', 2, 2200, 2),
('81206124', 'Noa', 1, 'Aparejador', 28, 1700, 40),
('82120699', 'Alma', 1, 'Aparejador', 4, 1700, 7),
('83047360', 'Álvaro', 1, 'Ingeniero', 4, 2400, 21),
('88033643', 'Alba', 1, 'Ingeniero', 29, 2400, 43),
('92453272', 'Vega', 1, 'Delineante', 19, 1800, 23),
('92929841', 'Vega', 1, 'Aparejador', 18, 1700, 22),
('93992073', 'Lucas', 1, 'Ingeniero', 20, 2400, 24),
('94402542', 'Lara', 1, 'Arquitecto', 23, 2200, 27),
('94966230', 'Álvaro', 1, 'Delineante', 11, 1800, 13);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `gastos_personal`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `gastos_personal` (
`cod_pro` tinyint(4)
,`nombre` varchar(25)
,`gastos_personal` double
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `cod_pro` tinyint(4) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `descripcion` varchar(12) DEFAULT NULL,
  `dni_resp` varchar(9) DEFAULT NULL,
  `Meses` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`cod_pro`, `nombre`, `descripcion`, `dni_resp`, `Meses`) VALUES
(1, 'Hotel Atila', 'Remodelación', '19297161', 8),
(2, 'Hotel Esperanza', 'Ampliación', '35082665', 20),
(3, 'Hotel Flamenco', 'Nuevo', '60414144', 24),
(4, 'Hotel Aguere', 'Remodelación', '14033233', 6),
(5, 'Hotel Nivaria', 'Ampliación', '60414144', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `cod_suc` tinyint(4) NOT NULL,
  `ciudad` tinyint(4) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `dni_dir` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`cod_suc`, `ciudad`, `nombre`, `telefono`, `dni_dir`) VALUES
(1, 1, 'Quaxo', '913-355-0543', '55074296'),
(2, 2, 'Zoomdog', '552-332-9607', '80638066'),
(3, 3, 'Aimbo', '693-256-3945', '19297161'),
(4, 4, 'Eamia', '821-364-2370', '39685220'),
(5, 5, 'Divape', '324-875-8111', '68690663'),
(6, 6, 'Wikivu', '187-570-4894', '22660869'),
(7, 4, 'Skyba', '589-392-7528', '82120699'),
(8, 2, 'Dynava', '265-912-6772', '15161258'),
(9, 7, 'Jaxbean', '293-282-3547', '36793176'),
(10, 8, 'Browsebug', '386-382-1861', '62945238'),
(11, 9, 'Trunyx', '219-692-6942', '63025329'),
(12, 10, 'Browsezoom', '620-646-7493', '71879586'),
(13, 11, 'Eadel', '525-302-7116', '94966230'),
(14, 12, 'Mynte', '442-505-6636', '75149104'),
(15, 13, 'Thoughtbeat', '215-904-6293', '35082665'),
(16, 14, 'Meevee', '112-180-6173', '72478587'),
(17, 15, 'Mita', '687-814-2762', '47463533'),
(18, 16, 'Browsecat', '253-176-8244', '23298609'),
(19, 9, 'Devcast', '802-587-1798', '55323638'),
(20, 17, 'Riffwire', '996-639-4653', '54254043'),
(21, 4, 'Rhycero', '228-754-3254', '83047360'),
(22, 18, 'Oyope', '884-361-0037', '92929841'),
(23, 19, 'Dabfeed', '334-112-2876', '92453272'),
(24, 20, 'Realcube', '937-823-0698', '93992073'),
(25, 21, 'Voonyx', '799-191-6468', '58776837'),
(26, 22, 'Ooba', '678-672-4764', '44082126'),
(27, 23, 'Photofeed', '820-113-4790', '94402542'),
(28, 8, 'Dabvine', '316-839-2126', '79556964'),
(29, 19, 'Fivespan', '291-917-4588', '46852146'),
(30, 9, 'Mydo', '360-985-0328', '16657760'),
(31, 6, 'Kwideo', '647-101-3603', '39699659'),
(32, 24, 'Dablist', '779-651-0594', '27554557'),
(33, 25, 'Quimm', '132-316-1357', '73743523'),
(34, 13, 'Buzzbean', '831-160-7172', '60414144'),
(35, 19, 'Devshare', '825-355-2134', '28463896'),
(36, 26, 'Jabbersphere', '784-262-5729', '45976630'),
(37, 18, 'Skyba', '596-349-0629', '53860388'),
(38, 26, 'Tanoodle', '732-859-8884', '40035963'),
(39, 27, 'Centidel', '332-889-0564', '49726458'),
(40, 28, 'Meedoo', '337-779-0406', '81206124'),
(41, 13, 'Fatz', '135-689-9956', '14033233'),
(42, 15, 'Jaxnation', '254-590-3458', '73325402'),
(43, 29, 'Zoombox', '449-402-6150', '88033643'),
(44, 30, 'Agimba', '187-760-9525', '78445812'),
(45, 4, 'Divanoodle', '558-773-5351', '21902666'),
(46, 19, 'Edgepulse', '813-674-0116', '61886860'),
(47, 31, 'Demimbu', '717-219-9025', '79741222'),
(48, 32, 'Zoomcast', '821-656-1952', '64373380'),
(49, 16, 'Thoughtbridge', '958-317-2240', '64374358'),
(50, 11, 'Trupe', '603-155-2287', '70862713');

-- --------------------------------------------------------

--
-- Estructura para la vista `gastos_personal`
--
DROP TABLE IF EXISTS `gastos_personal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gastos_personal`  AS SELECT `gastos`.`cod_pro` AS `cod_pro`, `gastos`.`nombre` AS `nombre`, sum(`gastos`.`total`) AS `gastos_personal` FROM (select `proyecto`.`cod_pro` AS `cod_pro`,`proyecto`.`nombre` AS `nombre`,`proyecto`.`Meses` * `empleado`.`Salario` AS `total` from (`empleado` join `proyecto` on(`empleado`.`dni` = `proyecto`.`dni_resp`)) union all select `proyecto`.`cod_pro` AS `cod_pro`,`proyecto`.`nombre` AS `nombre`,sum(`proyecto`.`Meses` * `empleado`.`Salario`) AS `total` from ((`proyecto` join `desarrolla` on(`proyecto`.`cod_pro` = `desarrolla`.`cod_pro`)) join `empleado` on(`desarrolla`.`dni` = `empleado`.`dni`)) group by `proyecto`.`cod_pro`) AS `gastos` GROUP BY `gastos`.`cod_pro` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`cod_ciudad`);

--
-- Indices de la tabla `desarrolla`
--
ALTER TABLE `desarrolla`
  ADD PRIMARY KEY (`cod_pro`,`dni`),
  ADD KEY `dni` (`dni`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `cod_suc` (`cod_suc`),
  ADD KEY `categoria` (`categoria`),
  ADD KEY `titulación` (`titulación`),
  ADD KEY `Ciudad` (`Ciudad`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`cod_pro`),
  ADD KEY `dni_resp` (`dni_resp`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`cod_suc`),
  ADD KEY `dni-dir` (`dni_dir`),
  ADD KEY `ciudad` (`ciudad`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `desarrolla`
--
ALTER TABLE `desarrolla`
  ADD CONSTRAINT `desarrolla_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `empleado` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `desarrolla_ibfk_2` FOREIGN KEY (`cod_pro`) REFERENCES `proyecto` (`cod_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`dni_resp`) REFERENCES `empleado` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `sucursal_ibfk_1` FOREIGN KEY (`ciudad`) REFERENCES `ciudades` (`cod_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sucursal_ibfk_2` FOREIGN KEY (`dni_dir`) REFERENCES `empleado` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
