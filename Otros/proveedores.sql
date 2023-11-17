-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 16, 2023 at 05:44 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `empresa`
--

-- --------------------------------------------------------

--
-- Table structure for table `proveedores`
--

CREATE TABLE `proveedores` (
  `s` int(11) NOT NULL,
  `nombre_s` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `ciudad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `proveedores`
--

INSERT INTO `proveedores` (`s`, `nombre_s`, `status`, `ciudad`) VALUES
(1, 'Eadel', 1, 'Granada'),
(2, 'Yodoo', 1, 'Des Moines'),
(3, 'Divape', 2, 'Londres'),
(4, 'Twinte', 1, 'Nantang'),
(5, 'Yakitri', 1, 'Zhangdun'),
(6, 'Shufflester', 2, 'Şuraabad'),
(7, 'Pixonyx', 2, 'Shuangfeng'),
(8, 'Trunyx', 2, 'Londres'),
(9, 'Browsedrive', 1, 'Granada'),
(10, 'Leexo', 3, 'Xiaoshan'),
(11, 'Dynabox', 1, 'Lomba'),
(12, 'Cogilith', 2, 'Musan-ŭp'),
(13, 'Dablist', 2, 'Salinggara'),
(14, 'Meeveo', 1, 'Atlanta'),
(15, 'Gabtype', 2, 'Tegalagung'),
(16, 'Dynava', 1, 'Molde'),
(17, 'Feedbug', 2, 'Mudian'),
(18, 'Linkbridge', 2, 'Londres'),
(19, 'Dabvine', 2, 'Al Jahrā’'),
(20, 'Zoomlounge', 2, 'Brisbane'),
(21, 'Wikibox', 3, 'Granada'),
(22, 'Flashdog', 2, 'Kleszczów'),
(23, 'Yombu', 2, 'Heishan'),
(24, 'Voonix', 2, 'Sv. Trojica v Slov. Goricah'),
(25, 'Edgepulse', 3, 'Laimuda'),
(26, 'Photobean', 2, 'Villa Lugano'),
(27, 'Divavu', 1, 'Miura'),
(28, 'Teklist', 2, 'Mayuge'),
(29, 'Mybuzz', 1, 'Gandu'),
(30, 'Jamia', 2, 'Rumboci'),
(31, 'Brainsphere', 2, 'Mutum Biyu'),
(32, 'Trunyx', 1, 'Buenaventura'),
(33, 'Skinte', 2, 'Savigny-le-Temple'),
(34, 'Linktype', 1, 'Strömsund'),
(35, 'Mydeo', 1, 'Oxelösund'),
(36, 'Tazz', 1, 'Balazar'),
(37, 'Yambee', 2, 'Tabuating'),
(38, 'Divanoodle', 2, 'Minneapolis'),
(39, 'Devshare', 2, 'Pattani'),
(40, 'Avamm', 2, 'Fayzabad'),
(41, 'Avamba', 1, 'Jiukeng'),
(42, 'Blogtag', 2, 'Gaotian'),
(43, 'Podcat', 1, 'Benito Juarez'),
(44, 'Agivu', 1, 'Szynwałd'),
(45, 'Zoombox', 2, 'Heishui'),
(46, 'Skajo', 2, 'Doljevac'),
(47, 'Zoomdog', 1, 'Nangaroro'),
(48, 'Voonix', 2, 'Jabinyānah'),
(49, 'Centidel', 2, 'Tianchi'),
(50, 'Vitz', 2, 'Diekirch'),
(51, 'Gevee', 2, 'Xinfeng'),
(52, 'Browsebug', 2, 'Sosnovo-Ozerskoye'),
(53, 'Twimm', 2, 'Sosnovka'),
(54, 'Skiba', 1, 'Birni N Konni'),
(55, 'Meemm', 1, 'Rychvald'),
(56, 'Jatri', 2, 'Xinying'),
(57, 'Buzzshare', 1, 'Fengyang Fuchengzhen'),
(58, 'Jaxspan', 1, 'Hrochův Týnec'),
(59, 'Gigashots', 2, 'Zwolle'),
(60, 'Edgewire', 2, 'Ping’an'),
(61, 'Brightbean', 1, 'Figueiró dos Vinhos'),
(62, 'Divavu', 1, 'Estoril'),
(63, 'Izio', 1, 'Sabana Grande de Palenque'),
(64, 'Plajo', 2, 'Fornos'),
(65, 'Npath', 2, 'El Aïoun'),
(66, 'Flashpoint', 1, 'Poá'),
(67, 'Livepath', 2, 'Lebane'),
(68, 'Muxo', 2, 'Gading'),
(69, 'Yotz', 1, 'Bayt ‘Awwā'),
(70, 'Vipe', 1, 'Sierpc'),
(71, 'LiveZ', 2, 'Karbunara e Vogël'),
(72, 'Shuffledrive', 2, 'Longtang'),
(73, 'Gigashots', 1, 'Naberezhnyye Chelny'),
(74, 'Yata', 2, 'Kisoro'),
(75, 'Zoombox', 2, 'Henggang'),
(76, 'Brightbean', 2, 'Margahayu'),
(77, 'Pixope', 2, 'Stupino'),
(78, 'Quatz', 2, 'Yingzhou'),
(79, 'Topdrive', 1, 'Boleiros'),
(80, 'Linkbuzz', 2, 'Jangdam'),
(81, 'Devify', 2, 'Bulualto'),
(82, 'Jetpulse', 1, 'Tangjiapo'),
(83, 'Zooveo', 2, 'Néa Manolás'),
(84, 'Edgewire', 2, 'Tōno'),
(85, 'Mycat', 1, 'Gómez'),
(86, 'Brainsphere', 1, 'Zelenchukskaya'),
(87, 'Dazzlesphere', 1, 'Bansko'),
(88, 'Blogtag', 1, 'Venta'),
(89, 'Babbleopia', 2, 'Chełmża'),
(90, 'Cogilith', 1, 'Langádhia'),
(91, 'Skyble', 1, 'Librazhd'),
(92, 'Youfeed', 1, 'Aydūn'),
(93, 'Skaboo', 1, 'Shaba'),
(94, 'Riffpath', 2, 'Garden Grove'),
(95, 'Gigaclub', 1, 'Chiba'),
(96, 'Linktype', 2, 'Brdów'),
(97, 'Voolia', 1, 'Boissy-Saint-Léger'),
(98, 'Divape', 1, 'Camaligan'),
(99, 'Wordpedia', 1, 'Boise');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`s`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
