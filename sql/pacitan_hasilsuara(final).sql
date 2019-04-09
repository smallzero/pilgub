-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2019 at 01:50 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pacitan`
--

-- --------------------------------------------------------

--
-- Table structure for table `hasilsuara`
--

CREATE TABLE `hasilsuara` (
  `id` int(3) NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `desa` varchar(50) NOT NULL,
  `tps` int(3) NOT NULL,
  `kofifah_emil` int(6) NOT NULL,
  `saiful_puti` int(6) NOT NULL,
  `tidaksah` int(6) NOT NULL,
  `total` int(7) NOT NULL,
  `tidakhadir` int(11) NOT NULL,
  `dptb` int(11) NOT NULL,
  `suratrusak` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hasilsuara`
--

INSERT INTO `hasilsuara` (`id`, `nohp`, `kecamatan`, `desa`, `tps`, `kofifah_emil`, `saiful_puti`, `tidaksah`, `total`, `tidakhadir`, `dptb`, `suratrusak`) VALUES
(10, '+6282233106261', 'DOKO', 'SELOROK', 1, 100, 125, 5, 230, 3, 2, 17),
(9, '+6282233106261', 'DOKO', 'SURU', 107, 100, 200, 50, 350, 7, 4, 13),
(11, '+6282233106261', 'DOKO', 'GENENGAN', 2, 274, 126, 5, 405, 30, 20, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hasilsuara`
--
ALTER TABLE `hasilsuara`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hasilsuara`
--
ALTER TABLE `hasilsuara`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
