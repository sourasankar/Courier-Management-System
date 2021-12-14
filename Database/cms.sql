-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2021 at 08:20 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch_details`
--

CREATE TABLE `branch_details` (
  `branch_id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `state` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch_details`
--

INSERT INTO `branch_details` (`branch_id`, `name`, `username`, `password`, `type`, `address`, `state`, `district`, `pincode`, `phone`, `email`) VALUES
('orkhordhain', 'Khordha SHO', 'khordha ', '123456789', 'sho', 'Unit 3, Kharabela Nagar, Bhubaneswar', 'odisha', 'khordha', '751001', '9876543210', 'khordha.or@cms.com'),
('orpuriin', 'Puri DHO', 'puri', '123456789', 'dho', 'Temple Rd, xyz', 'odisha', 'puri', '752001', '9876543210', 'puri.or@cms.com'),
('orsundergarhin', 'Sundergarh DHO', 'sundergarh', '123456789', 'dho', '755,xyz,Sundergarh', 'odisha', 'sundergarh', '770001', '9876543210', 'sundergarh.or@cms.com'),
('wbhooghlyin', 'Hooghly DHO', 'hooghly', '123456789', 'dho', 'Chinsurah', 'west bengal', 'hooghly', '712101', '9876543210', 'hooghly.wb@cms.com'),
('wbkolkatain', 'Kolkata SHO', 'kolkata', '123456789', 'sho', 'Netaji Subhas Rd, Fairley Place, B.B.D. Bagh', 'west bengal', 'kolkata', '700001', '9876543210', 'kolkata.wb@cms.com'),
('wbnadiain', 'Nadia DHO', 'nadia', '123456789', 'dho', 'B13, Central Prak, Kalyani', 'west bengal', 'nadia', '741235', '9876543210', 'nadia.wb@cms.com');

-- --------------------------------------------------------

--
-- Table structure for table `consignment_delivery`
--

CREATE TABLE `consignment_delivery` (
  `id` int(11) NOT NULL,
  `consignment_id` varchar(50) NOT NULL,
  `employee_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `consignment_delivery`
--

INSERT INTO `consignment_delivery` (`id`, `consignment_id`, `employee_id`) VALUES
(6, 'PKG12866603IN', 'EMP115828');

-- --------------------------------------------------------

--
-- Table structure for table `consignment_details`
--

CREATE TABLE `consignment_details` (
  `consignment_id` varchar(50) NOT NULL,
  `book_on` date NOT NULL,
  `booked_at` time NOT NULL,
  `branch_id` varchar(50) NOT NULL,
  `length` varchar(50) NOT NULL,
  `width` varchar(50) NOT NULL,
  `height` varchar(50) NOT NULL,
  `weight` varchar(50) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `to_name` varchar(100) NOT NULL,
  `to_phone` varchar(50) NOT NULL,
  `to_address1` varchar(100) NOT NULL,
  `to_address2` varchar(100) NOT NULL,
  `to_state` varchar(50) NOT NULL,
  `to_district` varchar(50) NOT NULL,
  `to_pincode` varchar(50) NOT NULL,
  `from_name` varchar(100) NOT NULL,
  `from_phone` varchar(50) NOT NULL,
  `from_address1` varchar(100) NOT NULL,
  `from_address2` varchar(100) NOT NULL,
  `from_state` varchar(50) NOT NULL,
  `from_district` varchar(50) NOT NULL,
  `from_pincode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `consignment_details`
--

INSERT INTO `consignment_details` (`consignment_id`, `book_on`, `booked_at`, `branch_id`, `length`, `width`, `height`, `weight`, `amount`, `to_name`, `to_phone`, `to_address1`, `to_address2`, `to_state`, `to_district`, `to_pincode`, `from_name`, `from_phone`, `from_address1`, `from_address2`, `from_state`, `from_district`, `from_pincode`) VALUES
('PKG12380691IN', '2021-12-13', '18:25:20', 'wbhooghlyin', '4', '65', '64', '54', '546', 'srebvse servser', '9876543210', 'gzstbhdrzb drtzb rav', 'arewnzh', 'West Bengal', 'Hooghly', '789456', 'kjfdsijnf sndfsdf', '9876543210', 'dsgn rdaynh adryna', 'rya ndy bad brd', 'West Bengal', 'Hooghly', '789456'),
('PKG12866603IN', '2021-12-10', '12:09:46', 'wbhooghlyin', '10', '12', '7', '200', '240', 'Soura Sankar Mondal', '9876543210', 'Bali Kali Tala', 'P.O & Dist- Hooghly', 'West Bengal', 'Hooghly', '712103', 'Uday Sankar Mondal', '9876543210', 'xyz xyz', '', 'West Bengal', 'Hooghly', '789465'),
('PKG29487079IN', '2021-12-10', '12:15:07', 'wbhooghlyin', '12', '12', '12', '123', '564', 'dsads sDg', '9876543210', 'hgdff dfh ', 'gdsztg', 'Odisha', 'Puri', '987654', 'xgh dfhgdfg', '9876543210', 'vsdg asg', '', 'Odisha', 'Khordha', '987635'),
('PKG42801253IN', '2021-12-11', '11:50:30', 'wbkolkatain', '21', '21', '212', '21', '21', 'hgf', '9876543210', 'vgjvghj', 'jvhgjvghj', 'West Bengal', 'Kolkata', '987654', 'jcvfgh', '9876543210', 'g', 'gcjg', 'Odisha', 'Khordha', '987654'),
('PKG79830938IN', '2021-12-10', '12:04:49', 'wbhooghlyin', '12', '12', '7', '120', '1550', 'soura sankar mondal', '9876543210', 'bali kali tala', 'p.o & dist- hooghly', 'West Bengal', 'Hooghly', '712103', 'uday sankar mondal', '9876543210', 'xyz xyz', '', 'West Bengal', 'Hooghly', '712101'),
('PKG80144801IN', '2021-12-11', '11:48:07', 'wbhooghlyin', '12', '1', '21', '45', '6540', 'xyz', '7894561230', 'lkmfds', 'dfasfd', 'West Bengal', 'Kolkata', '789456', 'gfdg', '7894561230', 'gsg', 'rgrg', 'West Bengal', 'Kolkata', '789456'),
('PKG83954611IN', '2021-12-11', '11:59:23', 'wbkolkatain', '4', '4', '4', '44', '120', 'gasgdrfarg artgrg', '7894561230', 'fdsfsfa', '', 'Odisha', 'Sundergarh', '789456', 'fdsaf', '7894561230', 'fdsfsf', '', 'West Bengal', 'Kolkata', '789456'),
('PKG87942798IN', '2021-12-10', '12:11:11', 'wbhooghlyin', '14', '14', '1', '21', '150', 'kdsakndsan dsnaklnd', '9876543210', 'dsadsadsa d safgds', 'dsasd ', 'Odisha', 'Puri', '789456', ' afh sdfgjh dsfg', '9876543210', 'dsfh sdh dfg', '', 'West Bengal', 'Hooghly', '789456'),
('PKG96680280IN', '2021-12-11', '11:52:34', 'wbkolkatain', '4', '4', '4', '4', '40', 'fdsdfsz', '9876543210', 'SDg asdfg ba', 'sadbasetb', 'West Bengal', 'Hooghly', '987654', 'xhjfggh', '9876543210', 'xhgxcfh', 'fdghfhg', 'Odisha', 'Khordha', '987654');

-- --------------------------------------------------------

--
-- Table structure for table `consignment_inventory`
--

CREATE TABLE `consignment_inventory` (
  `id` int(11) NOT NULL,
  `consignment_id` varchar(50) NOT NULL,
  `branch_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `consignment_inventory`
--

INSERT INTO `consignment_inventory` (`id`, `consignment_id`, `branch_id`) VALUES
(4, 'PKG29487079IN', 'wbhooghlyin'),
(5, 'PKG80144801IN', 'wbhooghlyin'),
(6, 'PKG42801253IN', 'wbkolkatain'),
(7, 'PKG96680280IN', 'wbkolkatain'),
(8, 'PKG83954611IN', 'wbkolkatain'),
(9, 'PKG12380691IN', 'wbhooghlyin');

-- --------------------------------------------------------

--
-- Table structure for table `consignment_tracker`
--

CREATE TABLE `consignment_tracker` (
  `id` int(11) NOT NULL,
  `consignment_id` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `to_location` varchar(50) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `remarks` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `consignment_tracker`
--

INSERT INTO `consignment_tracker` (`id`, `consignment_id`, `date`, `time`, `to_location`, `status`, `remarks`) VALUES
(1, 'PKG79830938IN', '2021-12-10', '12:04:49', NULL, 'Booked', 'at Hooghly DHO'),
(2, 'PKG12866603IN', '2021-12-10', '12:09:46', NULL, 'Booked', 'at Hooghly DHO'),
(3, 'PKG87942798IN', '2021-12-10', '12:11:11', NULL, 'Booked', 'at Hooghly DHO'),
(4, 'PKG29487079IN', '2021-12-10', '12:15:07', NULL, 'Booked', 'at Hooghly DHO'),
(7, 'PKG80144801IN', '2021-12-11', '11:48:07', NULL, 'Booked', 'at Hooghly DHO'),
(8, 'PKG42801253IN', '2021-12-11', '11:50:30', NULL, 'Booked', 'at Kolkata SHO'),
(9, 'PKG96680280IN', '2021-12-11', '11:52:34', NULL, 'Booked', 'at Kolkata SHO'),
(10, 'PKG83954611IN', '2021-12-11', '11:59:23', NULL, 'Booked', 'at Kolkata SHO'),
(15, 'PKG12866603IN', '2021-12-13', '17:57:47', NULL, 'Out For Delivery', 'Soura Sankar Mondal (9876543210)'),
(16, 'PKG79830938IN', '2021-12-13', '18:02:28', NULL, 'Out For Delivery', 'Soura Sankar Mondal (9876543210)'),
(20, 'PKG79830938IN', '2021-12-13', '18:24:17', NULL, 'Delivered', 'at Home'),
(21, 'PKG12380691IN', '2021-12-13', '18:25:20', NULL, 'Booked', 'at Hooghly DHO'),
(22, 'PKG87942798IN', '2021-12-14', '12:31:39', 'wbkolkatain', 'In Transit', 'to Kolkata SHO'),
(23, 'PKG87942798IN', '2021-12-14', '12:41:45', NULL, 'Received', 'at Kolkata SHO'),
(24, 'PKG87942798IN', '2021-12-14', '12:42:38', 'orkhordhain', 'In Transit', 'to Khordha SHO'),
(25, 'PKG87942798IN', '2021-12-14', '12:43:37', NULL, 'Received', 'at Khordha SHO'),
(26, 'PKG87942798IN', '2021-12-14', '12:43:59', 'orpuriin', 'In Transit', 'to Puri DHO'),
(27, 'PKG87942798IN', '2021-12-14', '12:44:27', NULL, 'Received', 'at Puri DHO'),
(28, 'PKG87942798IN', '2021-12-14', '12:45:05', NULL, 'Out For Delivery', 'Soura Sankar (6543210789)'),
(29, 'PKG87942798IN', '2021-12-14', '12:45:49', NULL, 'Delivered', 'done');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `state` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `state`, `district`) VALUES
(1, 'Andaman Nicobar', 'Nicobar'),
(2, 'Andaman Nicobar', 'North Middle Andaman'),
(3, 'Andaman Nicobar', 'South Andaman'),
(4, 'Andhra Pradesh', 'Anantapur'),
(5, 'Andhra Pradesh', 'Chittoor'),
(6, 'Andhra Pradesh', 'East Godavari'),
(7, 'Andhra Pradesh', 'Guntur'),
(8, 'Andhra Pradesh', 'Kadapa'),
(9, 'Andhra Pradesh', 'Krishna'),
(10, 'Andhra Pradesh', 'Kurnool'),
(11, 'Andhra Pradesh', 'Nellore'),
(12, 'Andhra Pradesh', 'Prakasam'),
(13, 'Andhra Pradesh', 'Srikakulam'),
(14, 'Andhra Pradesh', 'Visakhapatnam'),
(15, 'Andhra Pradesh', 'Vizianagaram'),
(16, 'Andhra Pradesh', 'West Godavari'),
(17, 'Arunachal Pradesh', 'Anjaw'),
(18, 'Arunachal Pradesh', 'Siang'),
(19, 'Arunachal Pradesh', 'Changlang'),
(20, 'Arunachal Pradesh', 'Dibang Valley'),
(21, 'Arunachal Pradesh', 'East Kameng'),
(22, 'Arunachal Pradesh', 'East Siang'),
(23, 'Arunachal Pradesh', 'Kamle'),
(24, 'Arunachal Pradesh', 'Kra Daadi'),
(25, 'Arunachal Pradesh', 'Kurung Kumey'),
(26, 'Arunachal Pradesh', 'Lepa Rada'),
(27, 'Arunachal Pradesh', 'Lohit'),
(28, 'Arunachal Pradesh', 'Longding'),
(29, 'Arunachal Pradesh', 'Lower Dibang Valley'),
(30, 'Arunachal Pradesh', 'Lower Siang'),
(31, 'Arunachal Pradesh', 'Lower Subansiri'),
(32, 'Arunachal Pradesh', 'Namsai'),
(33, 'Arunachal Pradesh', 'Pakke Kessang'),
(34, 'Arunachal Pradesh', 'Papum Pare'),
(35, 'Arunachal Pradesh', 'Shi Yomi'),
(36, 'Arunachal Pradesh', 'Tawang'),
(37, 'Arunachal Pradesh', 'Tirap'),
(38, 'Arunachal Pradesh', 'Upper Siang'),
(39, 'Arunachal Pradesh', 'Upper Subansiri'),
(40, 'Arunachal Pradesh', 'West Kameng'),
(41, 'Arunachal Pradesh', 'West Siang'),
(42, 'Assam', 'Bajali'),
(43, 'Assam', 'Baksa'),
(44, 'Assam', 'Barpeta'),
(45, 'Assam', 'Biswanath'),
(46, 'Assam', 'Bongaigaon'),
(47, 'Assam', 'Cachar'),
(48, 'Assam', 'Charaideo'),
(49, 'Assam', 'Chirang'),
(50, 'Assam', 'Darrang'),
(51, 'Assam', 'Dhemaji'),
(52, 'Assam', 'Dhubri'),
(53, 'Assam', 'Dibrugarh'),
(54, 'Assam', 'Dima Hasao'),
(55, 'Assam', 'Goalpara'),
(56, 'Assam', 'Golaghat'),
(57, 'Assam', 'Hailakandi'),
(58, 'Assam', 'Hojai'),
(59, 'Assam', 'Jorhat'),
(60, 'Assam', 'Kamrup'),
(61, 'Assam', 'Kamrup Metropolitan'),
(62, 'Assam', 'Karbi Anglong'),
(63, 'Assam', 'Karimganj'),
(64, 'Assam', 'Kokrajhar'),
(65, 'Assam', 'Lakhimpur'),
(66, 'Assam', 'Majuli'),
(67, 'Assam', 'Morigaon'),
(68, 'Assam', 'Nagaon'),
(69, 'Assam', 'Nalbari'),
(70, 'Assam', 'Sivasagar'),
(71, 'Assam', 'Sonitpur'),
(72, 'Assam', 'South Salmara-Mankachar'),
(73, 'Assam', 'Tinsukia'),
(74, 'Assam', 'Udalguri'),
(75, 'Assam', 'West Karbi Anglong'),
(76, 'Bihar', 'Araria'),
(77, 'Bihar', 'Arwal'),
(78, 'Bihar', 'Aurangabad'),
(79, 'Bihar', 'Banka'),
(80, 'Bihar', 'Begusarai'),
(81, 'Bihar', 'Bhagalpur'),
(82, 'Bihar', 'Bhojpur'),
(83, 'Bihar', 'Buxar'),
(84, 'Bihar', 'Darbhanga'),
(85, 'Bihar', 'East Champaran'),
(86, 'Bihar', 'Gaya'),
(87, 'Bihar', 'Gopalganj'),
(88, 'Bihar', 'Jamui'),
(89, 'Bihar', 'Jehanabad'),
(90, 'Bihar', 'Kaimur'),
(91, 'Bihar', 'Katihar'),
(92, 'Bihar', 'Khagaria'),
(93, 'Bihar', 'Kishanganj'),
(94, 'Bihar', 'Lakhisarai'),
(95, 'Bihar', 'Madhepura'),
(96, 'Bihar', 'Madhubani'),
(97, 'Bihar', 'Munger'),
(98, 'Bihar', 'Muzaffarpur'),
(99, 'Bihar', 'Nalanda'),
(100, 'Bihar', 'Nawada'),
(101, 'Bihar', 'Patna'),
(102, 'Bihar', 'Purnia'),
(103, 'Bihar', 'Rohtas'),
(104, 'Bihar', 'Saharsa'),
(105, 'Bihar', 'Samastipur'),
(106, 'Bihar', 'Saran'),
(107, 'Bihar', 'Sheikhpura'),
(108, 'Bihar', 'Sheohar'),
(109, 'Bihar', 'Sitamarhi'),
(110, 'Bihar', 'Siwan'),
(111, 'Bihar', 'Supaul'),
(112, 'Bihar', 'Vaishali'),
(113, 'Bihar', 'West Champaran'),
(114, 'Chandigarh', 'Chandigarh'),
(115, 'Chhattisgarh', 'Balod'),
(116, 'Chhattisgarh', 'Baloda Bazar'),
(117, 'Chhattisgarh', 'Balrampur'),
(118, 'Chhattisgarh', 'Bastar'),
(119, 'Chhattisgarh', 'Bemetara'),
(120, 'Chhattisgarh', 'Bijapur'),
(121, 'Chhattisgarh', 'Bilaspur'),
(122, 'Chhattisgarh', 'Dantewada'),
(123, 'Chhattisgarh', 'Dhamtari'),
(124, 'Chhattisgarh', 'Durg'),
(125, 'Chhattisgarh', 'Gariaband'),
(126, 'Chhattisgarh', 'Gaurela Pendra Marwahi'),
(127, 'Chhattisgarh', 'Janjgir Champa'),
(128, 'Chhattisgarh', 'Jashpur'),
(129, 'Chhattisgarh', 'Kabirdham'),
(130, 'Chhattisgarh', 'Kanker'),
(131, 'Chhattisgarh', 'Kondagaon'),
(132, 'Chhattisgarh', 'Korba'),
(133, 'Chhattisgarh', 'Koriya'),
(134, 'Chhattisgarh', 'Mahasamund'),
(135, 'Chhattisgarh', 'Mungeli'),
(136, 'Chhattisgarh', 'Narayanpur'),
(137, 'Chhattisgarh', 'Raigarh'),
(138, 'Chhattisgarh', 'Raipur'),
(139, 'Chhattisgarh', 'Rajnandgaon'),
(140, 'Chhattisgarh', 'Sukma'),
(141, 'Chhattisgarh', 'Surajpur'),
(142, 'Chhattisgarh', 'Surguja'),
(143, 'Dadra Nagar Haveli and Daman and Diu', 'Dadra and Nagar Haveli'),
(144, 'Dadra Nagar Haveli and Daman and Diu', 'Daman'),
(145, 'Dadra Nagar Haveli and Daman and Diu', 'Diu'),
(146, 'Delhi', 'Central Delhi'),
(147, 'Delhi', 'East Delhi'),
(148, 'Delhi', 'New Delhi'),
(149, 'Delhi', 'North Delhi'),
(150, 'Delhi', 'North East Delhi'),
(151, 'Delhi', 'North West Delhi'),
(152, 'Delhi', 'Shahdara'),
(153, 'Delhi', 'South Delhi'),
(154, 'Delhi', 'South East Delhi'),
(155, 'Delhi', 'South West Delhi'),
(156, 'Delhi', 'West Delhi'),
(157, 'Goa', 'North Goa'),
(158, 'Goa', 'South Goa'),
(159, 'Gujarat', 'Ahmedabad'),
(160, 'Gujarat', 'Amreli'),
(161, 'Gujarat', 'Anand'),
(162, 'Gujarat', 'Aravalli'),
(163, 'Gujarat', 'Banaskantha'),
(164, 'Gujarat', 'Bharuch'),
(165, 'Gujarat', 'Bhavnagar'),
(166, 'Gujarat', 'Botad'),
(167, 'Gujarat', 'Chhota Udaipur'),
(168, 'Gujarat', 'Dahod'),
(169, 'Gujarat', 'Dang'),
(170, 'Gujarat', 'Devbhoomi Dwarka'),
(171, 'Gujarat', 'Gandhinagar'),
(172, 'Gujarat', 'Gir Somnath'),
(173, 'Gujarat', 'Jamnagar'),
(174, 'Gujarat', 'Junagadh'),
(175, 'Gujarat', 'Kheda'),
(176, 'Gujarat', 'Kutch'),
(177, 'Gujarat', 'Mahisagar'),
(178, 'Gujarat', 'Mehsana'),
(179, 'Gujarat', 'Morbi'),
(180, 'Gujarat', 'Narmada'),
(181, 'Gujarat', 'Navsari'),
(182, 'Gujarat', 'Panchmahal'),
(183, 'Gujarat', 'Patan'),
(184, 'Gujarat', 'Porbandar'),
(185, 'Gujarat', 'Rajkot'),
(186, 'Gujarat', 'Sabarkantha'),
(187, 'Gujarat', 'Surat'),
(188, 'Gujarat', 'Surendranagar'),
(189, 'Gujarat', 'Tapi'),
(190, 'Gujarat', 'Vadodara'),
(191, 'Gujarat', 'Valsad'),
(192, 'Haryana', 'Ambala'),
(193, 'Haryana', 'Bhiwani'),
(194, 'Haryana', 'Charkhi Dadri'),
(195, 'Haryana', 'Faridabad'),
(196, 'Haryana', 'Fatehabad'),
(197, 'Haryana', 'Gurugram'),
(198, 'Haryana', 'Hisar'),
(199, 'Haryana', 'Jhajjar'),
(200, 'Haryana', 'Jind'),
(201, 'Haryana', 'Kaithal'),
(202, 'Haryana', 'Karnal'),
(203, 'Haryana', 'Kurukshetra'),
(204, 'Haryana', 'Mahendragarh'),
(205, 'Haryana', 'Mewat'),
(206, 'Haryana', 'Palwal'),
(207, 'Haryana', 'Panchkula'),
(208, 'Haryana', 'Panipat'),
(209, 'Haryana', 'Rewari'),
(210, 'Haryana', 'Rohtak'),
(211, 'Haryana', 'Sirsa'),
(212, 'Haryana', 'Sonipat'),
(213, 'Haryana', 'Yamunanagar'),
(214, 'Himachal Pradesh', 'Bilaspur'),
(215, 'Himachal Pradesh', 'Chamba'),
(216, 'Himachal Pradesh', 'Hamirpur'),
(217, 'Himachal Pradesh', 'Kangra'),
(218, 'Himachal Pradesh', 'Kinnaur'),
(219, 'Himachal Pradesh', 'Kullu'),
(220, 'Himachal Pradesh', 'Lahaul Spiti'),
(221, 'Himachal Pradesh', 'Mandi'),
(222, 'Himachal Pradesh', 'Shimla'),
(223, 'Himachal Pradesh', 'Sirmaur'),
(224, 'Himachal Pradesh', 'Solan'),
(225, 'Himachal Pradesh', 'Una'),
(226, 'Jammu Kashmir', 'Anantnag'),
(227, 'Jammu Kashmir', 'Bandipora'),
(228, 'Jammu Kashmir', 'Baramulla'),
(229, 'Jammu Kashmir', 'Budgam'),
(230, 'Jammu Kashmir', 'Doda'),
(231, 'Jammu Kashmir', 'Ganderbal'),
(232, 'Jammu Kashmir', 'Jammu'),
(233, 'Jammu Kashmir', 'Kathua'),
(234, 'Jammu Kashmir', 'Kishtwar'),
(235, 'Jammu Kashmir', 'Kulgam'),
(236, 'Jammu Kashmir', 'Kupwara'),
(237, 'Jammu Kashmir', 'Poonch'),
(238, 'Jammu Kashmir', 'Pulwama'),
(239, 'Jammu Kashmir', 'Rajouri'),
(240, 'Jammu Kashmir', 'Ramban'),
(241, 'Jammu Kashmir', 'Reasi'),
(242, 'Jammu Kashmir', 'Samba'),
(243, 'Jammu Kashmir', 'Shopian'),
(244, 'Jammu Kashmir', 'Srinagar'),
(245, 'Jammu Kashmir', 'Udhampur'),
(246, 'Jharkhand', 'Bokaro'),
(247, 'Jharkhand', 'Chatra'),
(248, 'Jharkhand', 'Deoghar'),
(249, 'Jharkhand', 'Dhanbad'),
(250, 'Jharkhand', 'Dumka'),
(251, 'Jharkhand', 'East Singhbhum'),
(252, 'Jharkhand', 'Garhwa'),
(253, 'Jharkhand', 'Giridih'),
(254, 'Jharkhand', 'Godda'),
(255, 'Jharkhand', 'Gumla'),
(256, 'Jharkhand', 'Hazaribagh'),
(257, 'Jharkhand', 'Jamtara'),
(258, 'Jharkhand', 'Khunti'),
(259, 'Jharkhand', 'Koderma'),
(260, 'Jharkhand', 'Latehar'),
(261, 'Jharkhand', 'Lohardaga'),
(262, 'Jharkhand', 'Pakur'),
(263, 'Jharkhand', 'Palamu'),
(264, 'Jharkhand', 'Ramgarh'),
(265, 'Jharkhand', 'Ranchi'),
(266, 'Jharkhand', 'Sahebganj'),
(267, 'Jharkhand', 'Seraikela Kharsawan'),
(268, 'Jharkhand', 'Simdega'),
(269, 'Jharkhand', 'West Singhbhum'),
(270, 'Karnataka', 'Bagalkot'),
(271, 'Karnataka', 'Bangalore Rural'),
(272, 'Karnataka', 'Bangalore Urban'),
(273, 'Karnataka', 'Belgaum'),
(274, 'Karnataka', 'Bellary'),
(275, 'Karnataka', 'Bidar'),
(276, 'Karnataka', 'Chamarajanagar'),
(277, 'Karnataka', 'Chikkaballapur'),
(278, 'Karnataka', 'Chikkamagaluru'),
(279, 'Karnataka', 'Chitradurga'),
(280, 'Karnataka', 'Dakshina Kannada'),
(281, 'Karnataka', 'Davanagere'),
(282, 'Karnataka', 'Dharwad'),
(283, 'Karnataka', 'Gadag'),
(284, 'Karnataka', 'Gulbarga'),
(285, 'Karnataka', 'Hassan'),
(286, 'Karnataka', 'Haveri'),
(287, 'Karnataka', 'Kodagu'),
(288, 'Karnataka', 'Kolar'),
(289, 'Karnataka', 'Koppal'),
(290, 'Karnataka', 'Mandya'),
(291, 'Karnataka', 'Mysore'),
(292, 'Karnataka', 'Raichur'),
(293, 'Karnataka', 'Ramanagara'),
(294, 'Karnataka', 'Shimoga'),
(295, 'Karnataka', 'Tumkur'),
(296, 'Karnataka', 'Udupi'),
(297, 'Karnataka', 'Uttara Kannada'),
(298, 'Karnataka', 'Vijayanagara'),
(299, 'Karnataka', 'Vijayapura'),
(300, 'Karnataka', 'Yadgir'),
(301, 'Kerala', 'Alappuzha'),
(302, 'Kerala', 'Ernakulam'),
(303, 'Kerala', 'Idukki'),
(304, 'Kerala', 'Kannur'),
(305, 'Kerala', 'Kasaragod'),
(306, 'Kerala', 'Kollam'),
(307, 'Kerala', 'Kottayam'),
(308, 'Kerala', 'Kozhikode'),
(309, 'Kerala', 'Malappuram'),
(310, 'Kerala', 'Palakkad'),
(311, 'Kerala', 'Pathanamthitta'),
(312, 'Kerala', 'Thiruvananthapuram'),
(313, 'Kerala', 'Thrissur'),
(314, 'Kerala', 'Wayanad'),
(315, 'Lakshadweep', 'Lakshadweep'),
(316, 'Ladakh', 'Kargil'),
(317, 'Ladakh', 'Leh'),
(318, 'Madhya Pradesh', 'Agar Malwa'),
(319, 'Madhya Pradesh', 'Alirajpur'),
(320, 'Madhya Pradesh', 'Anuppur'),
(321, 'Madhya Pradesh', 'Ashoknagar'),
(322, 'Madhya Pradesh', 'Balaghat'),
(323, 'Madhya Pradesh', 'Barwani'),
(324, 'Madhya Pradesh', 'Betul'),
(325, 'Madhya Pradesh', 'Bhind'),
(326, 'Madhya Pradesh', 'Bhopal'),
(327, 'Madhya Pradesh', 'Burhanpur'),
(328, 'Madhya Pradesh', 'Chachaura'),
(329, 'Madhya Pradesh', 'Chhatarpur'),
(330, 'Madhya Pradesh', 'Chhindwara'),
(331, 'Madhya Pradesh', 'Damoh'),
(332, 'Madhya Pradesh', 'Datia'),
(333, 'Madhya Pradesh', 'Dewas'),
(334, 'Madhya Pradesh', 'Dhar'),
(335, 'Madhya Pradesh', 'Dindori'),
(336, 'Madhya Pradesh', 'Guna'),
(337, 'Madhya Pradesh', 'Gwalior'),
(338, 'Madhya Pradesh', 'Harda'),
(339, 'Madhya Pradesh', 'Hoshangabad'),
(340, 'Madhya Pradesh', 'Indore'),
(341, 'Madhya Pradesh', 'Jabalpur'),
(342, 'Madhya Pradesh', 'Jhabua'),
(343, 'Madhya Pradesh', 'Katni'),
(344, 'Madhya Pradesh', 'Khandwa'),
(345, 'Madhya Pradesh', 'Khargone'),
(346, 'Madhya Pradesh', 'Maihar'),
(347, 'Madhya Pradesh', 'Mandla'),
(348, 'Madhya Pradesh', 'Mandsaur'),
(349, 'Madhya Pradesh', 'Morena'),
(350, 'Madhya Pradesh', 'Narsinghpur'),
(351, 'Madhya Pradesh', 'Nagda'),
(352, 'Madhya Pradesh', 'Neemuch'),
(353, 'Madhya Pradesh', 'Niwari'),
(354, 'Madhya Pradesh', 'Panna'),
(355, 'Madhya Pradesh', 'Raisen'),
(356, 'Madhya Pradesh', 'Rajgarh'),
(357, 'Madhya Pradesh', 'Ratlam'),
(358, 'Madhya Pradesh', 'Rewa'),
(359, 'Madhya Pradesh', 'Sagar'),
(360, 'Madhya Pradesh', 'Satna'),
(361, 'Madhya Pradesh', 'Sehore'),
(362, 'Madhya Pradesh', 'Seoni'),
(363, 'Madhya Pradesh', 'Shahdol'),
(364, 'Madhya Pradesh', 'Shajapur'),
(365, 'Madhya Pradesh', 'Sheopur'),
(366, 'Madhya Pradesh', 'Shivpuri'),
(367, 'Madhya Pradesh', 'Sidhi'),
(368, 'Madhya Pradesh', 'Singrauli'),
(369, 'Madhya Pradesh', 'Tikamgarh'),
(370, 'Madhya Pradesh', 'Ujjain'),
(371, 'Madhya Pradesh', 'Umaria'),
(372, 'Madhya Pradesh', 'Vidisha'),
(373, 'Maharashtra', 'Ahmednagar'),
(374, 'Maharashtra', 'Akola'),
(375, 'Maharashtra', 'Amravati'),
(376, 'Maharashtra', 'Aurangabad'),
(377, 'Maharashtra', 'Beed'),
(378, 'Maharashtra', 'Bhandara'),
(379, 'Maharashtra', 'Buldhana'),
(380, 'Maharashtra', 'Chandrapur'),
(381, 'Maharashtra', 'Dhule'),
(382, 'Maharashtra', 'Gadchiroli'),
(383, 'Maharashtra', 'Gondia'),
(384, 'Maharashtra', 'Hingoli'),
(385, 'Maharashtra', 'Jalgaon'),
(386, 'Maharashtra', 'Jalna'),
(387, 'Maharashtra', 'Kolhapur'),
(388, 'Maharashtra', 'Latur'),
(389, 'Maharashtra', 'Mumbai City'),
(390, 'Maharashtra', 'Mumbai Suburban'),
(391, 'Maharashtra', 'Nagpur'),
(392, 'Maharashtra', 'Nanded'),
(393, 'Maharashtra', 'Nandurbar'),
(394, 'Maharashtra', 'Nashik'),
(395, 'Maharashtra', 'Osmanabad'),
(396, 'Maharashtra', 'Palghar'),
(397, 'Maharashtra', 'Parbhani'),
(398, 'Maharashtra', 'Pune'),
(399, 'Maharashtra', 'Raigad'),
(400, 'Maharashtra', 'Ratnagiri'),
(401, 'Maharashtra', 'Sangli'),
(402, 'Maharashtra', 'Satara'),
(403, 'Maharashtra', 'Sindhudurg'),
(404, 'Maharashtra', 'Solapur'),
(405, 'Maharashtra', 'Thane'),
(406, 'Maharashtra', 'Wardha'),
(407, 'Maharashtra', 'Washim'),
(408, 'Maharashtra', 'Yavatmal'),
(409, 'Manipur', 'Bishnupur'),
(410, 'Manipur', 'Chandel'),
(411, 'Manipur', 'Churachandpur'),
(412, 'Manipur', 'Imphal East'),
(413, 'Manipur', 'Imphal West'),
(414, 'Manipur', 'Jiribam'),
(415, 'Manipur', 'Kakching'),
(416, 'Manipur', 'Kamjong'),
(417, 'Manipur', 'Kangpokpi'),
(418, 'Manipur', 'Noney'),
(419, 'Manipur', 'Pherzawl'),
(420, 'Manipur', 'Senapati'),
(421, 'Manipur', 'Tamenglong'),
(422, 'Manipur', 'Tengnoupal'),
(423, 'Manipur', 'Thoubal'),
(424, 'Manipur', 'Ukhrul'),
(425, 'Meghalaya', 'East Garo Hills'),
(426, 'Meghalaya', 'East Jaintia Hills'),
(427, 'Meghalaya', 'East Khasi Hills'),
(428, 'Meghalaya', 'North Garo Hills'),
(429, 'Meghalaya', 'Ri Bhoi'),
(430, 'Meghalaya', 'South Garo Hills'),
(431, 'Meghalaya', 'South West Garo Hills'),
(432, 'Meghalaya', 'South West Khasi Hills'),
(433, 'Meghalaya', 'West Garo Hills'),
(434, 'Meghalaya', 'West Jaintia Hills'),
(435, 'Meghalaya', 'West Khasi Hills'),
(436, 'Mizoram', 'Aizawl'),
(437, 'Mizoram', 'Champhai'),
(438, 'Mizoram', 'Hnahthial'),
(439, 'Mizoram', 'Kolasib'),
(440, 'Mizoram', 'Khawzawl'),
(441, 'Mizoram', 'Lawngtlai'),
(442, 'Mizoram', 'Lunglei'),
(443, 'Mizoram', 'Mamit'),
(444, 'Mizoram', 'Saiha'),
(445, 'Mizoram', 'Serchhip'),
(446, 'Mizoram', 'Saitual'),
(447, 'Nagaland', 'Mon'),
(448, 'Nagaland', 'Dimapur'),
(449, 'Nagaland', 'Kiphire'),
(450, 'Nagaland', 'Kohima'),
(451, 'Nagaland', 'Longleng'),
(452, 'Nagaland', 'Mokokchung'),
(453, 'Nagaland', 'Noklak'),
(454, 'Nagaland', 'Peren'),
(455, 'Nagaland', 'Phek'),
(456, 'Nagaland', 'Tuensang'),
(457, 'Nagaland', 'Wokha'),
(458, 'Nagaland', 'Zunheboto'),
(459, 'Odisha', 'Angul'),
(460, 'Odisha', 'Balangir'),
(461, 'Odisha', 'Balasore'),
(462, 'Odisha', 'Bargarh'),
(463, 'Odisha', 'Bhadrak'),
(464, 'Odisha', 'Boudh'),
(465, 'Odisha', 'Cuttack'),
(466, 'Odisha', 'Debagarh'),
(467, 'Odisha', 'Dhenkanal'),
(468, 'Odisha', 'Gajapati'),
(469, 'Odisha', 'Ganjam'),
(470, 'Odisha', 'Jagatsinghpur'),
(471, 'Odisha', 'Jajpur'),
(472, 'Odisha', 'Jharsuguda'),
(473, 'Odisha', 'Kalahandi'),
(474, 'Odisha', 'Kandhamal'),
(475, 'Odisha', 'Kendrapara'),
(476, 'Odisha', 'Kendujhar'),
(477, 'Odisha', 'Khordha'),
(478, 'Odisha', 'Koraput'),
(479, 'Odisha', 'Malkangiri'),
(480, 'Odisha', 'Mayurbhanj'),
(481, 'Odisha', 'Nabarangpur'),
(482, 'Odisha', 'Nayagarh'),
(483, 'Odisha', 'Nuapada'),
(484, 'Odisha', 'Puri'),
(485, 'Odisha', 'Rayagada'),
(486, 'Odisha', 'Sambalpur'),
(487, 'Odisha', 'Subarnapur'),
(488, 'Odisha', 'Sundergarh'),
(489, 'Puducherry', 'Karaikal'),
(490, 'Puducherry', 'Mahe'),
(491, 'Puducherry', 'Puducherry'),
(492, 'Puducherry', 'Yanam'),
(493, 'Punjab', 'Amritsar'),
(494, 'Punjab', 'Barnala'),
(495, 'Punjab', 'Bathinda'),
(496, 'Punjab', 'Faridkot'),
(497, 'Punjab', 'Fatehgarh Sahib'),
(498, 'Punjab', 'Fazilka'),
(499, 'Punjab', 'Firozpur'),
(500, 'Punjab', 'Gurdaspur'),
(501, 'Punjab', 'Hoshiarpur'),
(502, 'Punjab', 'Jalandhar'),
(503, 'Punjab', 'Kapurthala'),
(504, 'Punjab', 'Ludhiana'),
(505, 'Punjab', 'Malerkotla'),
(506, 'Punjab', 'Mansa'),
(507, 'Punjab', 'Moga'),
(508, 'Punjab', 'Mohali'),
(509, 'Punjab', 'Muktsar'),
(510, 'Punjab', 'Pathankot'),
(511, 'Punjab', 'Patiala'),
(512, 'Punjab', 'Rupnagar'),
(513, 'Punjab', 'Sangrur'),
(514, 'Punjab', 'Shaheed Bhagat Singh Nagar'),
(515, 'Punjab', 'Tarn Taran'),
(516, 'Rajasthan', 'Ajmer'),
(517, 'Rajasthan', 'Alwar'),
(518, 'Rajasthan', 'Banswara'),
(519, 'Rajasthan', 'Baran'),
(520, 'Rajasthan', 'Barmer'),
(521, 'Rajasthan', 'Bharatpur'),
(522, 'Rajasthan', 'Bhilwara'),
(523, 'Rajasthan', 'Bikaner'),
(524, 'Rajasthan', 'Bundi'),
(525, 'Rajasthan', 'Chittorgarh'),
(526, 'Rajasthan', 'Churu'),
(527, 'Rajasthan', 'Dausa'),
(528, 'Rajasthan', 'Dholpur'),
(529, 'Rajasthan', 'Dungarpur'),
(530, 'Rajasthan', 'Hanumangarh'),
(531, 'Rajasthan', 'Jaipur'),
(532, 'Rajasthan', 'Jaisalmer'),
(533, 'Rajasthan', 'Jalore'),
(534, 'Rajasthan', 'Jhalawar'),
(535, 'Rajasthan', 'Jhunjhunu'),
(536, 'Rajasthan', 'Jodhpur'),
(537, 'Rajasthan', 'Karauli'),
(538, 'Rajasthan', 'Kota'),
(539, 'Rajasthan', 'Nagaur'),
(540, 'Rajasthan', 'Pali'),
(541, 'Rajasthan', 'Pratapgarh'),
(542, 'Rajasthan', 'Rajsamand'),
(543, 'Rajasthan', 'Sawai Madhopur'),
(544, 'Rajasthan', 'Sikar'),
(545, 'Rajasthan', 'Sirohi'),
(546, 'Rajasthan', 'Sri Ganganagar'),
(547, 'Rajasthan', 'Tonk'),
(548, 'Rajasthan', 'Udaipur'),
(549, 'Sikkim', 'East Sikkim'),
(550, 'Sikkim', 'North Sikkim'),
(551, 'Sikkim', 'South Sikkim'),
(552, 'Sikkim', 'West Sikkim'),
(553, 'Tamil Nadu', 'Ariyalur'),
(554, 'Tamil Nadu', 'Chengalpattu'),
(555, 'Tamil Nadu', 'Chennai'),
(556, 'Tamil Nadu', 'Coimbatore'),
(557, 'Tamil Nadu', 'Cuddalore'),
(558, 'Tamil Nadu', 'Dharmapuri'),
(559, 'Tamil Nadu', 'Dindigul'),
(560, 'Tamil Nadu', 'Erode'),
(561, 'Tamil Nadu', 'Kallakurichi'),
(562, 'Tamil Nadu', 'Kanchipuram'),
(563, 'Tamil Nadu', 'Kanyakumari'),
(564, 'Tamil Nadu', 'Karur'),
(565, 'Tamil Nadu', 'Krishnagiri'),
(566, 'Tamil Nadu', 'Madurai'),
(567, 'Tamil Nadu', 'Mayiladuthurai'),
(568, 'Tamil Nadu', 'Nagapattinam'),
(569, 'Tamil Nadu', 'Namakkal'),
(570, 'Tamil Nadu', 'Nilgiris'),
(571, 'Tamil Nadu', 'Perambalur'),
(572, 'Tamil Nadu', 'Pudukkottai'),
(573, 'Tamil Nadu', 'Ramanathapuram'),
(574, 'Tamil Nadu', 'Ranipet'),
(575, 'Tamil Nadu', 'Salem'),
(576, 'Tamil Nadu', 'Sivaganga'),
(577, 'Tamil Nadu', 'Tenkasi'),
(578, 'Tamil Nadu', 'Thanjavur'),
(579, 'Tamil Nadu', 'Theni'),
(580, 'Tamil Nadu', 'Thoothukudi'),
(581, 'Tamil Nadu', 'Tiruchirappalli'),
(582, 'Tamil Nadu', 'Tirunelveli'),
(583, 'Tamil Nadu', 'Tirupattur'),
(584, 'Tamil Nadu', 'Tiruppur'),
(585, 'Tamil Nadu', 'Tiruvallur'),
(586, 'Tamil Nadu', 'Tiruvannamalai'),
(587, 'Tamil Nadu', 'Tiruvarur'),
(588, 'Tamil Nadu', 'Vellore'),
(589, 'Tamil Nadu', 'Viluppuram'),
(590, 'Tamil Nadu', 'Virudhunagar'),
(591, 'Telangana', 'Adilabad'),
(592, 'Telangana', 'Bhadradri Kothagudem'),
(593, 'Telangana', 'Hyderabad'),
(594, 'Telangana', 'Jagtial'),
(595, 'Telangana', 'Jangaon'),
(596, 'Telangana', 'Jayashankar'),
(597, 'Telangana', 'Jogulamba'),
(598, 'Telangana', 'Kamareddy'),
(599, 'Telangana', 'Karimnagar'),
(600, 'Telangana', 'Khammam'),
(601, 'Telangana', 'Komaram Bheem'),
(602, 'Telangana', 'Mahabubabad'),
(603, 'Telangana', 'Mahbubnagar'),
(604, 'Telangana', 'Mancherial'),
(605, 'Telangana', 'Medak'),
(606, 'Telangana', 'Medchal'),
(607, 'Telangana', 'Mulugu'),
(608, 'Telangana', 'Nagarkurnool'),
(609, 'Telangana', 'Nalgonda'),
(610, 'Telangana', 'Narayanpet'),
(611, 'Telangana', 'Nirmal'),
(612, 'Telangana', 'Nizamabad'),
(613, 'Telangana', 'Peddapalli'),
(614, 'Telangana', 'Rajanna Sircilla'),
(615, 'Telangana', 'Ranga Reddy'),
(616, 'Telangana', 'Sangareddy'),
(617, 'Telangana', 'Siddipet'),
(618, 'Telangana', 'Suryapet'),
(619, 'Telangana', 'Vikarabad'),
(620, 'Telangana', 'Wanaparthy'),
(621, 'Telangana', 'Warangal'),
(622, 'Telangana', 'Hanamkonda'),
(623, 'Telangana', 'Yadadri Bhuvanagiri'),
(624, 'Tripura', 'Dhalai'),
(625, 'Tripura', 'Gomati'),
(626, 'Tripura', 'Khowai'),
(627, 'Tripura', 'North Tripura'),
(628, 'Tripura', 'Sepahijala'),
(629, 'Tripura', 'South Tripura'),
(630, 'Tripura', 'Unakoti'),
(631, 'Tripura', 'West Tripura'),
(632, 'Uttar Pradesh', 'Agra'),
(633, 'Uttar Pradesh', 'Aligarh'),
(634, 'Uttar Pradesh', 'Ambedkar Nagar'),
(635, 'Uttar Pradesh', 'Amethi'),
(636, 'Uttar Pradesh', 'Amroha'),
(637, 'Uttar Pradesh', 'Auraiya'),
(638, 'Uttar Pradesh', 'Ayodhya'),
(639, 'Uttar Pradesh', 'Azamgarh'),
(640, 'Uttar Pradesh', 'Baghpat'),
(641, 'Uttar Pradesh', 'Bahraich'),
(642, 'Uttar Pradesh', 'Ballia'),
(643, 'Uttar Pradesh', 'Balrampur'),
(644, 'Uttar Pradesh', 'Banda'),
(645, 'Uttar Pradesh', 'Barabanki'),
(646, 'Uttar Pradesh', 'Bareilly'),
(647, 'Uttar Pradesh', 'Basti'),
(648, 'Uttar Pradesh', 'Bhadohi'),
(649, 'Uttar Pradesh', 'Bijnor'),
(650, 'Uttar Pradesh', 'Budaun'),
(651, 'Uttar Pradesh', 'Bulandshahr'),
(652, 'Uttar Pradesh', 'Chandauli'),
(653, 'Uttar Pradesh', 'Chitrakoot'),
(654, 'Uttar Pradesh', 'Deoria'),
(655, 'Uttar Pradesh', 'Etah'),
(656, 'Uttar Pradesh', 'Etawah'),
(657, 'Uttar Pradesh', 'Farrukhabad'),
(658, 'Uttar Pradesh', 'Fatehpur'),
(659, 'Uttar Pradesh', 'Firozabad'),
(660, 'Uttar Pradesh', 'Gautam Buddha Nagar'),
(661, 'Uttar Pradesh', 'Ghaziabad'),
(662, 'Uttar Pradesh', 'Ghazipur'),
(663, 'Uttar Pradesh', 'Gonda'),
(664, 'Uttar Pradesh', 'Gorakhpur'),
(665, 'Uttar Pradesh', 'Hamirpur'),
(666, 'Uttar Pradesh', 'Hapur'),
(667, 'Uttar Pradesh', 'Hardoi'),
(668, 'Uttar Pradesh', 'Hathras'),
(669, 'Uttar Pradesh', 'Jalaun'),
(670, 'Uttar Pradesh', 'Jaunpur'),
(671, 'Uttar Pradesh', 'Jhansi'),
(672, 'Uttar Pradesh', 'Kannauj'),
(673, 'Uttar Pradesh', 'Kanpur Dehat'),
(674, 'Uttar Pradesh', 'Kanpur Nagar'),
(675, 'Uttar Pradesh', 'Kasganj'),
(676, 'Uttar Pradesh', 'Kaushambi'),
(677, 'Uttar Pradesh', 'Kheri'),
(678, 'Uttar Pradesh', 'Kushinagar'),
(679, 'Uttar Pradesh', 'Lalitpur'),
(680, 'Uttar Pradesh', 'Lucknow'),
(681, 'Uttar Pradesh', 'Maharajganj'),
(682, 'Uttar Pradesh', 'Mahoba'),
(683, 'Uttar Pradesh', 'Mainpuri'),
(684, 'Uttar Pradesh', 'Mathura'),
(685, 'Uttar Pradesh', 'Mau'),
(686, 'Uttar Pradesh', 'Meerut'),
(687, 'Uttar Pradesh', 'Mirzapur'),
(688, 'Uttar Pradesh', 'Moradabad'),
(689, 'Uttar Pradesh', 'Muzaffarnagar'),
(690, 'Uttar Pradesh', 'Pilibhit'),
(691, 'Uttar Pradesh', 'Pratapgarh'),
(692, 'Uttar Pradesh', 'Prayagraj'),
(693, 'Uttar Pradesh', 'Raebareli'),
(694, 'Uttar Pradesh', 'Rampur'),
(695, 'Uttar Pradesh', 'Saharanpur'),
(696, 'Uttar Pradesh', 'Sambhal'),
(697, 'Uttar Pradesh', 'Sant Kabir Nagar'),
(698, 'Uttar Pradesh', 'Shahjahanpur'),
(699, 'Uttar Pradesh', 'Shamli'),
(700, 'Uttar Pradesh', 'Shravasti'),
(701, 'Uttar Pradesh', 'Siddharthnagar'),
(702, 'Uttar Pradesh', 'Sitapur'),
(703, 'Uttar Pradesh', 'Sonbhadra'),
(704, 'Uttar Pradesh', 'Sultanpur'),
(705, 'Uttar Pradesh', 'Unnao'),
(706, 'Uttar Pradesh', 'Varanasi'),
(707, 'Uttarakhand', 'Almora'),
(708, 'Uttarakhand', 'Bageshwar'),
(709, 'Uttarakhand', 'Chamoli'),
(710, 'Uttarakhand', 'Champawat'),
(711, 'Uttarakhand', 'Dehradun'),
(712, 'Uttarakhand', 'Haridwar'),
(713, 'Uttarakhand', 'Nainital'),
(714, 'Uttarakhand', 'Pauri'),
(715, 'Uttarakhand', 'Pithoragarh'),
(716, 'Uttarakhand', 'Rudraprayag'),
(717, 'Uttarakhand', 'Tehri'),
(718, 'Uttarakhand', 'Udham Singh Nagar'),
(719, 'Uttarakhand', 'Uttarkashi'),
(720, 'West Bengal', 'Alipurduar'),
(721, 'West Bengal', 'Bankura'),
(722, 'West Bengal', 'Birbhum'),
(723, 'West Bengal', 'Cooch Behar'),
(724, 'West Bengal', 'Dakshin Dinajpur'),
(725, 'West Bengal', 'Darjeeling'),
(726, 'West Bengal', 'Hooghly'),
(727, 'West Bengal', 'Howrah'),
(728, 'West Bengal', 'Jalpaiguri'),
(729, 'West Bengal', 'Jhargram'),
(730, 'West Bengal', 'Kalimpong'),
(731, 'West Bengal', 'Kolkata'),
(732, 'West Bengal', 'Malda'),
(733, 'West Bengal', 'Murshidabad'),
(734, 'West Bengal', 'Nadia'),
(735, 'West Bengal', 'North 24 Parganas'),
(736, 'West Bengal', 'Paschim Bardhaman'),
(737, 'West Bengal', 'Paschim Medinipur'),
(738, 'West Bengal', 'Purba Bardhaman'),
(739, 'West Bengal', 'Purba Medinipur'),
(740, 'West Bengal', 'Purulia'),
(741, 'West Bengal', 'South 24 Parganas'),
(742, 'West Bengal', 'Uttar Dinajpur');

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `employee_id` varchar(50) NOT NULL,
  `branch_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`employee_id`, `branch_id`, `name`, `phone`, `dob`, `password`) VALUES
('EMP115828', 'WBHOOGHLYIN', 'Soura Sankar Mondal', '9876543210', '2000-06-08', '123456789'),
('EMP499863', 'orpuriin', 'Soura Sankar', '6543210789', '2013-05-01', '123456789'),
('EMP732110', 'WBHOOGHLYIN', 'uday sankar mondal', '4108756045', '2021-12-14', '123456789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch_details`
--
ALTER TABLE `branch_details`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `consignment_delivery`
--
ALTER TABLE `consignment_delivery`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `consignment_id` (`consignment_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `consignment_details`
--
ALTER TABLE `consignment_details`
  ADD PRIMARY KEY (`consignment_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `consignment_inventory`
--
ALTER TABLE `consignment_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `consignment_id` (`consignment_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `consignment_tracker`
--
ALTER TABLE `consignment_tracker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consignment_id` (`consignment_id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consignment_delivery`
--
ALTER TABLE `consignment_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `consignment_inventory`
--
ALTER TABLE `consignment_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `consignment_tracker`
--
ALTER TABLE `consignment_tracker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=743;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consignment_delivery`
--
ALTER TABLE `consignment_delivery`
  ADD CONSTRAINT `consignment_delivery_ibfk_1` FOREIGN KEY (`consignment_id`) REFERENCES `consignment_details` (`consignment_id`),
  ADD CONSTRAINT `consignment_delivery_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee_details` (`employee_id`);

--
-- Constraints for table `consignment_details`
--
ALTER TABLE `consignment_details`
  ADD CONSTRAINT `consignment_details_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch_details` (`branch_id`);

--
-- Constraints for table `consignment_inventory`
--
ALTER TABLE `consignment_inventory`
  ADD CONSTRAINT `consignment_inventory_ibfk_1` FOREIGN KEY (`consignment_id`) REFERENCES `consignment_details` (`consignment_id`),
  ADD CONSTRAINT `consignment_inventory_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch_details` (`branch_id`);

--
-- Constraints for table `consignment_tracker`
--
ALTER TABLE `consignment_tracker`
  ADD CONSTRAINT `consignment_tracker_ibfk_1` FOREIGN KEY (`consignment_id`) REFERENCES `consignment_details` (`consignment_id`);

--
-- Constraints for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD CONSTRAINT `employee_details_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch_details` (`branch_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
