-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2022 at 07:16 AM
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
-- Database: `jaunty coffee co. erd_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `coffee`
--

CREATE TABLE `coffee` (
  `coffee_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `coffee_name` varchar(50) NOT NULL,
  `price_per_pound` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coffee`
--

INSERT INTO `coffee` (`coffee_id`, `shop_id`, `supplier_id`, `coffee_name`, `price_per_pound`) VALUES
(1, 1, 1, 'Arabica', 8),
(2, 1, 2, 'Robusta', 10),
(3, 2, 3, 'Kona', 12);

-- --------------------------------------------------------

--
-- Table structure for table `coffee_shop`
--

CREATE TABLE `coffee_shop` (
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coffee_shop`
--

INSERT INTO `coffee_shop` (`shop_id`, `shop_name`, `city`, `state`) VALUES
(1, 'Jaunty Coffee Co', 'New York', 'NY'),
(2, 'Dapper Coffee Co', 'Chicago', 'IL');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `job_title` varchar(30) DEFAULT NULL,
  `shop_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `hire_date`, `job_title`, `shop_id`) VALUES
(1, 'John', 'Smith', '0000-00-00', 'Manager', 1),
(2, 'Jane', 'Doe', '0000-00-00', 'Barista', 1),
(3, 'Tim', 'Rogers', '0000-00-00', 'Barista', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_full_name`
-- (See below for the actual view)
--
CREATE TABLE `employee_full_name` (
`employee_id` int(11)
,`first_name` varchar(30)
,`last_name` varchar(30)
,`employee_full_name` varchar(61)
,`hire_date` date
,`job_title` varchar(30)
,`shop_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `sales_contact_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `company_name`, `country`, `sales_contact_name`, `email`) VALUES
(1, 'Java Beans', 'Brazil', 'John Smith', 'jsmith@javabeans.com'),
(2, 'Mountain Coffee', 'Peru', 'Jane Doe', 'jdoe@mountaincoffee.com'),
(3, 'Kona Roasters', 'Hawaii', 'Tim Rogers', 'trogers@konaroasters.com');

-- --------------------------------------------------------

--
-- Structure for view `employee_full_name`
--
DROP TABLE IF EXISTS `employee_full_name`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_full_name`  AS SELECT `employee`.`employee_id` AS `employee_id`, `employee`.`first_name` AS `first_name`, `employee`.`last_name` AS `last_name`, concat(`employee`.`first_name`,' ',`employee`.`last_name`) AS `employee_full_name`, `employee`.`hire_date` AS `hire_date`, `employee`.`job_title` AS `job_title`, `employee`.`shop_id` AS `shop_id` FROM `employee` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coffee`
--
ALTER TABLE `coffee`
  ADD PRIMARY KEY (`coffee_id`),
  ADD KEY `coffee_name_idx` (`coffee_name`);

--
-- Indexes for table `coffee_shop`
--
ALTER TABLE `coffee_shop`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
