-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2017 at 11:29 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `faculty_schedule`
--

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `seq` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `seq` int(11) NOT NULL,
  `course_seq` int(11) NOT NULL,
  `label` varchar(2) NOT NULL,
  `student_total` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `seq` int(11) NOT NULL,
  `major_seq` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `sks` int(11) NOT NULL,
  `semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `day`
--

CREATE TABLE `day` (
  `seq` int(11) NOT NULL,
  `name` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `day_hour`
--

CREATE TABLE `day_hour` (
  `seq` int(11) NOT NULL,
  `day_seq` int(11) NOT NULL,
  `hour_seq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `seq` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `building_seq` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hour`
--

CREATE TABLE `hour` (
  `seq` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_hour` char(11) NOT NULL,
  `start_min` char(11) NOT NULL,
  `end_hour` char(11) NOT NULL,
  `end_min` char(11) NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE `major` (
  `seq` int(11) NOT NULL,
  `faculty_seq` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `seq` int(11) NOT NULL,
  `building_seq` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `seq` int(11) NOT NULL,
  `generate_key` text NOT NULL,
  `class_seq` int(11) NOT NULL,
  `day_hour_seq` int(11) NOT NULL,
  `room_seq` int(11) NOT NULL,
  `update_at` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_log`
--

CREATE TABLE `schedule_log` (
  `seq` int(11) NOT NULL,
  `major_seq` int(11) NOT NULL,
  `generate_key` text NOT NULL,
  `status` enum('P','D') NOT NULL,
  `methode` enum('M','A') NOT NULL,
  `update_at` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_tmp`
--

CREATE TABLE `schedule_tmp` (
  `seq` int(11) NOT NULL,
  `generate_key` varchar(10) NOT NULL,
  `class_seq` int(11) NOT NULL,
  `day_hour_seq` int(11) NOT NULL,
  `room_seq` int(11) NOT NULL,
  `approved` enum('A','N','U') NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `seq` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `seq` int(11) NOT NULL,
  `nidn` varchar(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `education_degree` varchar(100) NOT NULL,
  `degree` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_classes`
--

CREATE TABLE `teacher_classes` (
  `seq` int(11) NOT NULL,
  `teacher_seq` int(11) NOT NULL,
  `class_seq` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `seq` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`seq`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`seq`),
  ADD KEY `course_seq` (`course_seq`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`seq`),
  ADD KEY `major_seq` (`major_seq`);

--
-- Indexes for table `day`
--
ALTER TABLE `day`
  ADD PRIMARY KEY (`seq`);

--
-- Indexes for table `day_hour`
--
ALTER TABLE `day_hour`
  ADD PRIMARY KEY (`seq`),
  ADD KEY `day_seq` (`day_seq`),
  ADD KEY `hour_seq` (`hour_seq`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`seq`),
  ADD KEY `building_seq` (`building_seq`);

--
-- Indexes for table `hour`
--
ALTER TABLE `hour`
  ADD PRIMARY KEY (`seq`);

--
-- Indexes for table `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`seq`),
  ADD KEY `faculty_seq` (`faculty_seq`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`seq`),
  ADD KEY `building_seq` (`building_seq`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`seq`),
  ADD KEY `class_seq` (`class_seq`),
  ADD KEY `day_hour_seq` (`day_hour_seq`),
  ADD KEY `room_seq` (`room_seq`);

--
-- Indexes for table `schedule_log`
--
ALTER TABLE `schedule_log`
  ADD PRIMARY KEY (`seq`),
  ADD KEY `major_seq` (`major_seq`);

--
-- Indexes for table `schedule_tmp`
--
ALTER TABLE `schedule_tmp`
  ADD PRIMARY KEY (`seq`),
  ADD KEY `class_seq` (`class_seq`),
  ADD KEY `day_hour_seq` (`day_hour_seq`),
  ADD KEY `room_seq` (`room_seq`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`seq`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`seq`);

--
-- Indexes for table `teacher_classes`
--
ALTER TABLE `teacher_classes`
  ADD PRIMARY KEY (`seq`),
  ADD KEY `teacher_seq` (`teacher_seq`),
  ADD KEY `class_seq` (`class_seq`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`seq`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `building`
--
ALTER TABLE `building`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;
--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
--
-- AUTO_INCREMENT for table `day`
--
ALTER TABLE `day`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `day_hour`
--
ALTER TABLE `day_hour`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `hour`
--
ALTER TABLE `hour`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `major`
--
ALTER TABLE `major`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;
--
-- AUTO_INCREMENT for table `schedule_log`
--
ALTER TABLE `schedule_log`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `schedule_tmp`
--
ALTER TABLE `schedule_tmp`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=355;
--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `teacher_classes`
--
ALTER TABLE `teacher_classes`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`course_seq`) REFERENCES `course` (`seq`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`major_seq`) REFERENCES `major` (`seq`);

--
-- Constraints for table `day_hour`
--
ALTER TABLE `day_hour`
  ADD CONSTRAINT `day_hour_ibfk_1` FOREIGN KEY (`day_seq`) REFERENCES `day` (`seq`),
  ADD CONSTRAINT `day_hour_ibfk_2` FOREIGN KEY (`hour_seq`) REFERENCES `hour` (`seq`);

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`building_seq`) REFERENCES `building` (`seq`);

--
-- Constraints for table `major`
--
ALTER TABLE `major`
  ADD CONSTRAINT `major_ibfk_1` FOREIGN KEY (`faculty_seq`) REFERENCES `faculty` (`seq`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`building_seq`) REFERENCES `building` (`seq`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`class_seq`) REFERENCES `class` (`seq`),
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`day_hour_seq`) REFERENCES `day_hour` (`seq`),
  ADD CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`room_seq`) REFERENCES `room` (`seq`);

--
-- Constraints for table `schedule_log`
--
ALTER TABLE `schedule_log`
  ADD CONSTRAINT `schedule_log_ibfk_1` FOREIGN KEY (`major_seq`) REFERENCES `major` (`seq`);

--
-- Constraints for table `schedule_tmp`
--
ALTER TABLE `schedule_tmp`
  ADD CONSTRAINT `schedule_tmp_ibfk_1` FOREIGN KEY (`class_seq`) REFERENCES `class` (`seq`),
  ADD CONSTRAINT `schedule_tmp_ibfk_2` FOREIGN KEY (`day_hour_seq`) REFERENCES `day_hour` (`seq`),
  ADD CONSTRAINT `schedule_tmp_ibfk_3` FOREIGN KEY (`room_seq`) REFERENCES `room` (`seq`);

--
-- Constraints for table `teacher_classes`
--
ALTER TABLE `teacher_classes`
  ADD CONSTRAINT `teacher_classes_ibfk_1` FOREIGN KEY (`teacher_seq`) REFERENCES `teacher` (`seq`),
  ADD CONSTRAINT `teacher_classes_ibfk_2` FOREIGN KEY (`class_seq`) REFERENCES `class` (`seq`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
