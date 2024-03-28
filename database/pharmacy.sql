-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2024 at 09:24 AM
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
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(3, 'Administation'),
(5, 'RND'),
(6, 'Web Development'),
(7, 'Software Development'),
(8, 'Research'),
(12, 'Stuff'),
(13, 'Store Executive');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `name`) VALUES
(5, 'Head'),
(8, 'Team Member'),
(9, 'Team Leader'),
(10, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(100) NOT NULL COMMENT 'ID',
  `name` varchar(100) NOT NULL COMMENT 'Name',
  `department_id` int(100) NOT NULL,
  `designation_id` int(100) NOT NULL,
  `number` int(100) NOT NULL COMMENT 'Number',
  `email` varchar(100) NOT NULL COMMENT 'Email',
  `password` varchar(100) NOT NULL,
  `role` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `department_id`, `designation_id`, `number`, `email`, `password`, `role`) VALUES
(1, 'Shaifuddin', 3, 5, 1635485720, 'shaifuddin70@gmail.com', '$2y$10$H/kT9mE.DPWuMGhWuYcTZ.PVEJsvhCsSiFBRaxaZ4KDJwyW5EK0pa', 1),
(32, 'Rohim', 13, 10, 2147483647, 'rohim@gmail.com', '$2y$10$lIEh34scWukFnZUJvuNO6eOTBC2M3DZIY1oE87SUo8wdNx8XF7BeS', 2),
(34, 'Karim', 7, 8, 13654855, 'karim@gmail.com', '$2y$10$SzwaUDkCpdYybzuIQrg6/.3wrFG/SltqMBtZPMEbz3mlFuFklSDB2', 3);

-- --------------------------------------------------------

--
-- Table structure for table `issue`
--

CREATE TABLE `issue` (
  `id` int(10) NOT NULL,
  `item` int(100) NOT NULL,
  `employee_id` int(100) NOT NULL,
  `issue_date` date NOT NULL DEFAULT current_timestamp(),
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `issue`
--

INSERT INTO `issue` (`id`, `item`, `employee_id`, `issue_date`, `quantity`) VALUES
(153, 21, 1, '2022-12-23', 1),
(154, 18, 1, '2022-12-23', 1),
(156, 21, 32, '2022-12-23', 2),
(157, 18, 32, '2022-12-23', 1),
(160, 18, 32, '2022-12-24', 2),
(161, 17, 34, '2022-12-24', 2),
(162, 21, 1, '2022-12-24', 45),
(164, 21, 34, '2022-12-24', 1),
(165, 21, 34, '2022-12-24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(10) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `catagory_id` int(10) NOT NULL,
  `reusable` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `catagory_id`, `reusable`) VALUES
(17, 'Fan', 110, 'YES'),
(18, 'Laptop', 110, 'YES'),
(19, 'Light', 110, 'YES'),
(20, 'Pencil', 114, 'NO'),
(21, 'Table', 112, 'YES'),
(22, 'Chair', 112, 'YES'),
(24, 'Printer', 110, 'YES'),
(25, 'Pen', 114, 'NO'),
(28, 'Punch Machine', 113, 'YES'),
(29, 'Strapler', 113, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `item_catagory`
--

CREATE TABLE `item_catagory` (
  `catagory_id` int(100) NOT NULL,
  `catagory` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_catagory`
--

INSERT INTO `item_catagory` (`catagory_id`, `catagory`) VALUES
(110, 'Electric'),
(112, 'Furniture'),
(113, 'Utility'),
(114, 'Stationary'),
(116, 'catagory'),
(118, 'Paracetamol');

-- --------------------------------------------------------

--
-- Table structure for table `item_request`
--

CREATE TABLE `item_request` (
  `id` int(100) NOT NULL,
  `employee_id` int(100) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(100) NOT NULL,
  `request_date` date NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT NULL,
  `nstatus` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_request`
--

INSERT INTO `item_request` (`id`, `employee_id`, `item_id`, `quantity`, `request_date`, `status`, `nstatus`) VALUES
(82, 1, 18, 1, '2022-12-23', 1, 1),
(83, 1, 18, 1, '2022-12-23', 0, 1),
(84, 1, 21, 1, '2022-12-23', 1, 1),
(86, 1, 18, 1, '2022-12-23', 1, 1),
(87, 1, 18, 1, '2022-12-23', 1, 1),
(88, 32, 21, 2, '2022-12-23', 1, 0),
(89, 32, 18, 1, '2022-12-23', 1, 0),
(92, 1, 18, 65, '2022-12-24', 1, 1),
(93, 32, 18, 2, '2022-12-24', 1, 0),
(94, 34, 17, 2, '2022-12-24', 1, 0),
(95, 34, 21, 1, '2022-12-24', 1, 0),
(96, 1, 21, 45, '2022-12-24', 1, 1),
(97, 34, 18, 1, '2022-12-24', NULL, NULL),
(98, 32, 18, 66, '2022-12-24', 1, 1),
(99, 34, 18, 2, '2022-12-24', NULL, NULL),
(100, 34, 21, 1, '2022-12-24', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicine_id` int(11) NOT NULL,
  `catagory_id` int(11) NOT NULL,
  `medicine_name` varchar(100) NOT NULL,
  `brand_id` int(100) NOT NULL,
  `generic_id` int(100) NOT NULL,
  `unit_price` int(100) NOT NULL,
  `expiry_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicine_id`, `catagory_id`, `medicine_name`, `brand_id`, `generic_id`, `unit_price`, `expiry_date`, `date`) VALUES
(1, 1, 'Napa', 1, 1, 12, '2024-03-27 13:33:26', '2024-03-25 09:04:39'),
(4, 1, 'Napa', 1, 1, 50, '2024-03-27 13:33:30', '2024-03-25 09:04:49'),
(5, 1, 'Sergel', 1, 2, 12, '2024-03-27 13:33:33', '2024-03-25 09:21:18'),
(6, 2, 'Neuro B', 2, 6, 360, '2024-03-29 18:00:00', '2024-03-25 09:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_brand`
--

CREATE TABLE `medicine_brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine_brand`
--

INSERT INTO `medicine_brand` (`brand_id`, `brand_name`, `date`) VALUES
(1, 'Incepta', '2024-03-25 08:11:22'),
(2, 'Abdolax', '2024-03-25 08:12:17');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_catagory`
--

CREATE TABLE `medicine_catagory` (
  `catagory_id` int(11) NOT NULL,
  `catagory_name` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine_catagory`
--

INSERT INTO `medicine_catagory` (`catagory_id`, `catagory_name`, `date`) VALUES
(1, 'Tablet', '2024-03-27 09:44:37'),
(2, 'Capsule', '2024-03-27 09:45:11'),
(3, 'Syrup', '2024-03-27 09:45:18'),
(4, 'Injection', '2024-03-27 09:45:26');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_generic`
--

CREATE TABLE `medicine_generic` (
  `generic_id` int(11) NOT NULL,
  `generic_name` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine_generic`
--

INSERT INTO `medicine_generic` (`generic_id`, `generic_name`, `date`) VALUES
(1, 'Paracetamol', '2024-03-25 07:39:00'),
(2, 'esomeprazol', '2024-03-25 07:39:20'),
(6, 'Thiamine Mononitrate', '2024-03-25 08:00:36');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_stock`
--

CREATE TABLE `medicine_stock` (
  `stock_id` int(11) NOT NULL,
  `medicine_id` int(10) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `Generic_id` int(10) NOT NULL,
  `unit` int(10) NOT NULL,
  `expiry_date` date NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `shelf_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine_stock`
--

INSERT INTO `medicine_stock` (`stock_id`, `medicine_id`, `brand_id`, `Generic_id`, `unit`, `expiry_date`, `date`, `shelf_id`) VALUES
(1, 1, 1, 1, 10, '2024-03-31', '2024-03-25 13:15:32', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `order_id` int(100) NOT NULL,
  `brand_id` int(10) NOT NULL,
  `generic_id` int(10) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `unit` int(100) NOT NULL,
  `pprice` int(11) DEFAULT NULL,
  `sprice` int(11) DEFAULT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_table`
--

INSERT INTO `order_table` (`order_id`, `brand_id`, `generic_id`, `medicine_id`, `unit`, `pprice`, `sprice`, `date`, `status`) VALUES
(37, 110, 18, 0, 50, NULL, NULL, '2022-12-23', 1),
(38, 112, 21, 0, 50, NULL, NULL, '2022-12-23', 1),
(40, 114, 25, 0, 100, NULL, NULL, '2022-12-23', 1),
(41, 114, 20, 0, 100, NULL, NULL, '2022-12-23', 1),
(42, 110, 24, 0, 100, NULL, NULL, '2022-12-23', 1),
(43, 110, 19, 0, 50, NULL, NULL, '2022-12-23', 1),
(44, 110, 18, 0, 20, NULL, NULL, '2022-12-23', 1),
(45, 110, 17, 0, 100, NULL, NULL, '2022-12-24', 1),
(47, 113, 28, 0, 20, NULL, NULL, '2022-12-24', 1),
(48, 112, 21, 0, 50, NULL, NULL, '2022-12-24', 1),
(52, 1, 1, 3, 10, NULL, NULL, '2024-03-25', NULL),
(53, 2, 2, 5, 10, NULL, NULL, '2024-03-25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_table`
--

CREATE TABLE `purchase_table` (
  `id` int(100) NOT NULL,
  `brand_id` int(10) NOT NULL,
  `generic_id` int(10) NOT NULL,
  `medicine_id` int(100) NOT NULL,
  `unit` int(11) NOT NULL,
  `pprice` int(11) NOT NULL,
  `sprice` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_table`
--

CREATE TABLE `return_table` (
  `id` int(10) NOT NULL,
  `employee_id` int(100) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `return_table`
--

INSERT INTO `return_table` (`id`, `employee_id`, `item_id`, `quantity`, `date`) VALUES
(19, 32, 18, 2, '2022-12-23'),
(20, 32, 21, 2, '2022-12-23'),
(21, 32, 24, 2, '2022-12-23'),
(23, 32, 18, 2, '2022-12-23'),
(24, 1, 24, 50, '2022-12-23'),
(25, 1, 18, 1, '2022-12-23'),
(26, 1, 18, 1, '2022-12-23'),
(27, 1, 18, 1, '2022-12-23'),
(28, 1, 18, 1, '2022-12-23'),
(29, 1, 18, 1, '2022-12-23'),
(30, 1, 18, 1, '2022-12-24'),
(31, 1, 18, 65, '2022-12-24'),
(34, 32, 18, 66, '2022-12-24');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'stuff'),
(3, 'employee');

-- --------------------------------------------------------

--
-- Table structure for table `shelf`
--

CREATE TABLE `shelf` (
  `shelf_id` int(100) NOT NULL,
  `shelf_number` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shelf`
--

INSERT INTO `shelf` (`shelf_id`, `shelf_number`) VALUES
(1, 101),
(6, 102),
(7, 103),
(8, 104);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(100) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `p_number` int(100) NOT NULL,
  `nid` int(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `vkey` varchar(1000) NOT NULL,
  `verified` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `p_number`, `nid`, `pass`, `vkey`, `verified`) VALUES
(9, 'Shaifuddin', 'shaifuddin70@gmail.com', 2147483647, 2147483647, '$2y$10$h9UZjbwhRw//8tMoJ7uVNOKx9ND7/hZWfGOYI3MvBriJzZfmhvNCa', '4064b2e3017ef08b49bd17a5d10a94b2', 1),
(10, 'test1', 'dardentimothy3@gmail.com', 2147483647, 2147483647, '$2y$10$9RatwZxgrphyf5R12TXP..Ty9HPaNCzsvMHFgkxBgOimKdHT4ePr6', 'abde4751fafd112bb0272eae685cb8e8', 0),
(12, 'shifu', 'shifu@gmail.com', 45272, 5287, '$2y$10$dVHtJ9XFzBnhBZdXT8WwuuJZkXV5k5ynCmsww.b.fXNwj/mZr.QSO', '2626969577d10fa57058139f5098a460', 1),
(13, 'mahi', 'mahi@gmail.com', 456465164, 848448448, '$2y$10$YnWboQlT4UNCWSz8LDI.4Os9RpfnK115gOUqtzx3Q5M6XH.kgJmnW', 'awdhguawiudhua', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `designation_id` (`designation_id`);

--
-- Indexes for table `issue`
--
ALTER TABLE `issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `item_id` (`item`,`employee_id`),
  ADD KEY `item` (`item`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `catagory_id` (`catagory_id`);

--
-- Indexes for table `item_catagory`
--
ALTER TABLE `item_catagory`
  ADD PRIMARY KEY (`catagory_id`);

--
-- Indexes for table `item_request`
--
ALTER TABLE `item_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `status_id` (`status`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicine_id`);

--
-- Indexes for table `medicine_brand`
--
ALTER TABLE `medicine_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `medicine_catagory`
--
ALTER TABLE `medicine_catagory`
  ADD PRIMARY KEY (`catagory_id`);

--
-- Indexes for table `medicine_generic`
--
ALTER TABLE `medicine_generic`
  ADD PRIMARY KEY (`generic_id`);

--
-- Indexes for table `medicine_stock`
--
ALTER TABLE `medicine_stock`
  ADD PRIMARY KEY (`stock_id`),
  ADD KEY `item_id` (`brand_id`),
  ADD KEY `catagory_id` (`medicine_id`),
  ADD KEY `order_id` (`date`),
  ADD KEY `item_id_2` (`brand_id`),
  ADD KEY `catagory_id_2` (`medicine_id`),
  ADD KEY `rack_id` (`shelf_id`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `name` (`generic_id`),
  ADD KEY `catagory` (`brand_id`);

--
-- Indexes for table `purchase_table`
--
ALTER TABLE `purchase_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catagory` (`brand_id`),
  ADD KEY `name` (`generic_id`);

--
-- Indexes for table `return_table`
--
ALTER TABLE `return_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`item_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shelf`
--
ALTER TABLE `shelf`
  ADD PRIMARY KEY (`shelf_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `issue`
--
ALTER TABLE `issue`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `item_catagory`
--
ALTER TABLE `item_catagory`
  MODIFY `catagory_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `item_request`
--
ALTER TABLE `item_request`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `medicine_brand`
--
ALTER TABLE `medicine_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medicine_catagory`
--
ALTER TABLE `medicine_catagory`
  MODIFY `catagory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `medicine_generic`
--
ALTER TABLE `medicine_generic`
  MODIFY `generic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `medicine_stock`
--
ALTER TABLE `medicine_stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `order_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `purchase_table`
--
ALTER TABLE `purchase_table`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `return_table`
--
ALTER TABLE `return_table`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shelf`
--
ALTER TABLE `shelf`
  MODIFY `shelf_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `dep` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `des` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`);

--
-- Constraints for table `issue`
--
ALTER TABLE `issue`
  ADD CONSTRAINT `emp` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `item` FOREIGN KEY (`item`) REFERENCES `item` (`item_id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`catagory_id`) REFERENCES `item_catagory` (`catagory_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_request`
--
ALTER TABLE `item_request`
  ADD CONSTRAINT `item_request_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_table`
--
ALTER TABLE `purchase_table`
  ADD CONSTRAINT `purchase_table_ibfk_1` FOREIGN KEY (`generic_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_table_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `item_catagory` (`catagory_id`);

--
-- Constraints for table `return_table`
--
ALTER TABLE `return_table`
  ADD CONSTRAINT `return_table_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `return_table_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
