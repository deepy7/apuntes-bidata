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
-- Table structure for table `proyectos`
--

CREATE TABLE `proyectos` (
  `j` int(11) NOT NULL,
  `nombre_j` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ciudad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `proyectos`
--

INSERT INTO `proyectos` (`j`, `nombre_j`, `ciudad`) VALUES
(1, 'Chromatochlamys Lichen', 'Seabra'),
(2, 'Dwarf Ceanothus', 'Londres'),
(3, 'Woollypod Milkvetch', 'Qianshan'),
(4, 'Caribbean Spleenwort', 'Dauphin'),
(5, 'Dwarf Dwarf-cudweed', 'Londres'),
(6, 'Eurya', 'Laboulaye'),
(7, 'Prairie Bishop', 'Shishang'),
(8, 'Woolly Prairie Clover', 'Khārān'),
(9, 'Western Silver Aster', 'Belopa'),
(10, 'Finmark\'s Leciophysma Lichen', 'Londres');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`j`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
