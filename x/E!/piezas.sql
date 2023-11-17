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
-- Database: `empresa_patron`
--

-- --------------------------------------------------------

--
-- Table structure for table `piezas`
--

CREATE TABLE `piezas` (
  `p` int(11) NOT NULL,
  `nombre_p` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `peso` int(11) DEFAULT NULL,
  `ciudad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `piezas`
--

INSERT INTO `piezas` (`p`, `nombre_p`, `color`, `peso`, `ciudad`) VALUES
(1, 'Glass', 'Roja', 64, 'Hrochův Týnec'),
(2, 'Steel', 'Fuscia', 78, 'Paris'),
(3, 'Wood', 'Teal', 36, 'Jetis'),
(4, 'Steel', 'Pink', 100, 'Piraí do Sul'),
(5, 'Wood', 'Aquamarine', 1, 'Laiya'),
(6, 'Granite', 'Green', 26, 'Paris'),
(7, 'Glass', 'Green', 65, 'Bayaguana'),
(8, 'Wood', 'Fuscia', 41, 'Dongyang'),
(9, 'Granite', 'Purple', 3, 'Mangochi'),
(10, 'Glass', 'Yellow', 70, 'Khal’ch');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `piezas`
--
ALTER TABLE `piezas`
  ADD PRIMARY KEY (`p`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
