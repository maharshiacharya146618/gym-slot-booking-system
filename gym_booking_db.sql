-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2026 at 08:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gym_booking_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `Booking_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Slot_ID` int(11) NOT NULL,
  `Booking_Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` varchar(20) NOT NULL DEFAULT 'CONFIRMED'
) ;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`Booking_ID`, `User_ID`, `Slot_ID`, `Booking_Date`, `Status`) VALUES
(1, 2, 1, '2026-11-23 14:43:09', 'CONFIRMED'),
(2, 3, 2, '2026-11-23 14:43:09', 'CONFIRMED'),
(4, 4, 6, '2026-11-23 15:20:22', 'CONFIRMED');

-- --------------------------------------------------------

--
-- Table structure for table `gym_slot`
--

CREATE TABLE `gym_slot` (
  `Slot_ID` int(11) NOT NULL,
  `Slot_Date` date NOT NULL,
  `Start_Time` time NOT NULL,
  `End_Time` time NOT NULL,
  `Capacity` int(11) NOT NULL,
  `Available_Slots` int(11) NOT NULL
) ;

--
-- Dumping data for table `gym_slot`
--

INSERT INTO `gym_slot` (`Slot_ID`, `Slot_Date`, `Start_Time`, `End_Time`, `Capacity`, `Available_Slots`) VALUES
(1, '2026-11-23', '06:00:00', '07:00:00', 15, 14),
(2, '2026-11-23', '07:30:00', '08:30:00', 20, 19),
(3, '2026-11-23', '17:00:00', '18:00:00', 20, 20),
(4, '2026-11-23', '18:30:00', '19:30:00', 15, 15),
(5, '2026-11-24', '06:00:00', '07:00:00', 15, 15),
(6, '2026-11-24', '18:00:00', '19:00:00', 20, 19);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(120) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` varchar(20) NOT NULL DEFAULT 'USER'
) ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_ID`, `Name`, `Email`, `Phone`, `Password`, `Role`) VALUES
(1, 'Gym Administrator', 'admin@gym.com', '9876543210', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 'ADMIN'),
(2, 'Rahul Sharma', 'rahul@gmail.com', '9825011223', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER'),
(3, 'Priya Patel', 'priya@gmail.com', '9825044556', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER'),
(4, 'Maharshi Acharya', 'maharshi.acharya121962@marwadiuniversity.ac.in', '9409644743', '165785f1acaa9cbbc8c2d02aab71c8863a868385f92993e415c2ec270a7c96e7', 'USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Booking_ID`),
  ADD KEY `fk_booking_user` (`User_ID`),
  ADD KEY `fk_booking_slot` (`Slot_ID`);

--
-- Indexes for table `gym_slot`
--
ALTER TABLE `gym_slot`
  ADD PRIMARY KEY (`Slot_ID`),
  ADD UNIQUE KEY `uq_slot_schedule` (`Slot_Date`,`Start_Time`,`End_Time`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `Booking_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gym_slot`
--
ALTER TABLE `gym_slot`
  MODIFY `Slot_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_booking_slot` FOREIGN KEY (`Slot_ID`) REFERENCES `gym_slot` (`Slot_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_booking_user` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
