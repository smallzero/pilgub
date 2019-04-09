-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2019 at 01:44 PM
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
-- Database: `sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE `inbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReceivingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) UNSIGNED NOT NULL,
  `RecipientID` text NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false',
  `id_folder` int(11) NOT NULL DEFAULT '1',
  `readed` enum('false','true') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inbox`
--

INSERT INTO `inbox` (`UpdatedInDB`, `ReceivingDateTime`, `Text`, `SenderNumber`, `Coding`, `UDH`, `SMSCNumber`, `Class`, `TextDecoded`, `ID`, `RecipientID`, `Processed`, `id_folder`, `readed`) VALUES
('2018-06-07 06:02:40', '2015-12-27 07:21:45', '0049004E0046004F0020005400450052004B0049004E0049', '+6282233106261', 'Default_No_Compression', '', '+6281100000', -1, 'DOKO#GENENGAN#02#274#126#5#30#20#7', 952, '', 'true', 1, 'true'),
('2015-12-27 07:21:27', '2015-12-27 07:21:45', '0049004E0046004F0020005400450052004B0049004E0049', '+6282233106261', 'Default_No_Compression', '', '+6281100000', -1, 'INFO TERKINI', 948, '', 'true', 1, 'true'),
('2018-06-07 06:02:40', '2015-12-27 07:21:45', '0049004E0046004F0020005400450052004B0049004E0049', '+6282233106261', 'Default_No_Compression', '', '+6281100000', -1, 'DOKO#SURU#107#100#200#50', 949, '', 'true', 1, 'true'),
('2018-06-07 06:02:40', '2015-12-27 07:21:45', '0049004E0046004F0020005400450052004B0049004E0049', '+6282233106261', 'Default_No_Compression', '', '+6281100000', -1, 'DOKO#SELOROK#01#100#125#5', 950, '', 'true', 1, 'true'),
('2018-06-07 06:02:40', '2015-12-27 07:21:45', '0049004E0046004F0020005400450052004B0049004E0049', '+6282233106261', 'Default_No_Compression', '', '+6281100000', -1, 'DOKO#GENENGAN#02#274#126#5#30#20#10', 951, '', 'true', 1, 'true');

--
-- Table structure for table `pilgub_inbox`
--

CREATE TABLE `pilgub_inbox` (
  `pilgub_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `action` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pilgub_inbox`
--
ALTER TABLE `pilgub_inbox`
  ADD PRIMARY KEY (`pilgub_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pilgub_inbox`
--
ALTER TABLE `pilgub_inbox`
  MODIFY `pilgub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

--
-- Triggers `inbox`
--
DELIMITER $$
CREATE TRIGGER `inbox_pilgub` AFTER INSERT ON `inbox` FOR EACH ROW BEGIN
	INSERT INTO pilgub_inbox (id,action) VALUES (NEW.ID,'INSERT');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `inbox_timestamp` BEFORE INSERT ON `inbox` FOR EACH ROW BEGIN
    IF NEW.ReceivingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.ReceivingDateTime = CURRENT_TIMESTAMP();
    END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inbox`
--
ALTER TABLE `inbox`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inbox`
--
ALTER TABLE `inbox`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=953;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
