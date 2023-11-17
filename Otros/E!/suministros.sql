-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 16, 2023 at 05:45 PM
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
-- Table structure for table `suministros`
--

CREATE TABLE `suministros` (
  `s` int(11) NOT NULL,
  `p` int(11) NOT NULL,
  `j` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `suministros`
--

INSERT INTO `suministros` (`s`, `p`, `j`, `cantidad`) VALUES
(1, 2, 1, 42),
(3, 1, 9, 40),
(3, 5, 6, 75),
(4, 7, 5, 54),
(5, 3, 4, 68),
(5, 5, 6, 43),
(5, 7, 10, 69),
(7, 6, 9, 83),
(8, 1, 6, 10),
(8, 4, 3, 44),
(9, 4, 1, 38),
(9, 6, 3, 26),
(9, 8, 6, 69),
(10, 4, 1, 85),
(10, 6, 4, 74),
(11, 9, 8, 31),
(11, 9, 9, 78),
(12, 7, 2, 52),
(14, 8, 7, 8),
(16, 1, 3, 12),
(17, 4, 2, 29),
(17, 7, 9, 94),
(20, 6, 7, 31),
(21, 3, 10, 86),
(22, 3, 9, 33),
(25, 4, 7, 74),
(26, 7, 6, 15),
(27, 7, 8, 44),
(28, 2, 5, 60),
(30, 7, 7, 46),
(32, 8, 9, 77),
(33, 3, 6, 93),
(33, 5, 3, 75),
(34, 7, 4, 44),
(35, 2, 9, 40),
(39, 1, 1, 23),
(39, 1, 2, 50),
(39, 1, 3, 16),
(39, 1, 4, 8),
(39, 1, 5, 50),
(39, 1, 6, 35),
(39, 1, 7, 75),
(39, 1, 8, 85),
(39, 1, 9, 4),
(39, 1, 10, 18),
(40, 5, 8, 1),
(42, 3, 1, 53),
(43, 7, 7, 88),
(44, 9, 2, 64),
(45, 3, 7, 93),
(49, 4, 3, 80),
(50, 2, 9, 7),
(52, 5, 10, 47),
(54, 3, 2, 19),
(54, 6, 8, 20),
(55, 3, 7, 31),
(55, 7, 8, 77),
(57, 3, 2, 3),
(58, 5, 3, 36),
(62, 7, 9, 1),
(63, 2, 10, 34),
(63, 8, 6, 43),
(64, 5, 3, 13),
(64, 9, 5, 79),
(67, 2, 3, 81),
(67, 3, 8, 52),
(69, 3, 2, 93),
(69, 6, 10, 4),
(69, 8, 10, 69),
(70, 7, 4, 85),
(72, 6, 7, 53),
(74, 7, 2, 62),
(74, 7, 9, 33),
(75, 3, 8, 55),
(77, 3, 3, 99),
(77, 4, 6, 11),
(77, 7, 7, 72),
(78, 10, 2, 36),
(79, 8, 8, 100),
(80, 3, 6, 56),
(80, 7, 9, 17),
(80, 9, 6, 71),
(83, 4, 1, 66),
(83, 7, 4, 17),
(84, 3, 7, 2),
(86, 9, 10, 18),
(87, 1, 3, 90),
(88, 6, 3, 84),
(91, 7, 7, 6),
(92, 6, 4, 40),
(93, 2, 3, 37),
(93, 6, 1, 1),
(93, 7, 7, 95),
(93, 8, 1, 65),
(93, 8, 5, 78),
(93, 9, 7, 57),
(97, 5, 3, 30),
(99, 2, 7, 18),
(99, 9, 5, 51),
(99, 9, 7, 72);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `suministros`
--
ALTER TABLE `suministros`
  ADD PRIMARY KEY (`s`,`p`,`j`),
  ADD KEY `p` (`p`),
  ADD KEY `j` (`j`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
