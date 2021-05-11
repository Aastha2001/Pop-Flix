-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2021 at 04:50 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `popflix`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `flixSearch` (`theatreName` VARCHAR(30), `region` VARCHAR(30))  BEGIN
SELECT * FROM theater AS t WHERE t.name LIKE CONCAT('%', theatreName, '%') AND t.location LIKE region GROUP BY t.location ORDER BY t.rating;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `movieSearch` (`movieName` VARCHAR(30), `language` VARCHAR(2), `genre` VARCHAR(10))  BEGIN
SELECT * FROM movies AS m WHERE m.name LIKE CONCAT('%', movieName, '%') AND m.language LIKE language AND m.m_id IN(SELECT m_id from genre where genre LIKE genre);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `acted_in`
--

CREATE TABLE `acted_in` (
  `p_id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acted_in`
--

INSERT INTO `acted_in` (`p_id`, `m_id`) VALUES
(3, 51),
(4, 51);

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `p_id` int(11) NOT NULL,
  `rating` float DEFAULT NULL CHECK (`rating` between 0 and 10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`p_id`, `rating`) VALUES
(3, NULL),
(4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `payment` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`payment`, `seat_id`) VALUES
(1, 93),
(2, 251),
(3, 251),
(4, 36),
(5, 85),
(5, 86),
(5, 87);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `p_id` int(11) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `password` varchar(61) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`p_id`, `Email`, `Phone`, `password`) VALUES
(1, 'tarun@gmail.com', '9898979562', '$2a$15$ddkUKeGkVRCABZXxgFE/GOADEIOplE6xP8a2XdqgGVUjW1jkCzmAe'),
(2, 'admin', '9998926793', '$2a$15$ddkUKeGkVRCABZXxgFE/GOADEIOplE6xP8a2XdqgGVUjW1jkCzmAe'),
(5, 'hp@gmail.com', '9789569523', '$2a$15$4j7Gm1DDlJ8cQ0NJT6KGyexA3Q6G6PWoCy0qA/kBkFeX.Z1yoVg3S'),
(6, 'bvr@gmail.com', '9876976985', '$2a$15$msbELvLlWFdRanRNjEKhV.a6iHKTULbxBl/CDqecRfAWJudWCk10e'),
(8, 'karan@gmail.com', '9897693476', '$2a$15$td0cgUQfkPkxadsOh8CIwO5o6ucjOOXmkkf3jvJn3/WQ72MPTHuWm'),
(9, 'don@gmail.com', '9879897673', '$2a$15$JaOaFoBOW7xfX6Q3JHO6d.HblPb5GUnnGfy/X/RzGEbPoOzo7woaC'),
(10, 'vsharma@gmail.com', '9897978734', '$2a$15$KqRjf3VD53d/eAlOLun5Ju52vB8sa5kgrjBK/adJj5RFZapgEU/MC');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `t_customer` AFTER INSERT ON `customer` FOR EACH ROW insert into z_customer values((select p_id From customer where Email = new.Email), new.Email, new.Phone, new.password)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `m_id` int(11) DEFAULT NULL,
  `Genre` enum('COMEDY','HORROR','ROMANTIC','ADVENTURE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`m_id`, `Genre`) VALUES
(24, 'ADVENTURE'),
(2, 'ROMANTIC'),
(33, 'ADVENTURE'),
(10, 'HORROR'),
(48, 'ADVENTURE'),
(4, 'ADVENTURE'),
(49, 'COMEDY'),
(34, 'ROMANTIC'),
(4, 'HORROR'),
(30, 'ADVENTURE'),
(1, 'ADVENTURE'),
(21, 'ADVENTURE'),
(33, 'ADVENTURE'),
(16, 'HORROR'),
(21, 'ADVENTURE'),
(48, 'ADVENTURE'),
(27, 'ADVENTURE'),
(4, 'ADVENTURE'),
(36, 'COMEDY'),
(31, 'ROMANTIC'),
(18, 'HORROR'),
(45, 'ADVENTURE'),
(25, 'ROMANTIC'),
(6, 'COMEDY'),
(22, 'HORROR'),
(34, 'ROMANTIC'),
(8, 'ADVENTURE'),
(50, 'ADVENTURE'),
(39, 'COMEDY'),
(25, 'ADVENTURE'),
(5, 'ADVENTURE'),
(46, 'ADVENTURE'),
(48, 'ADVENTURE'),
(30, 'ADVENTURE'),
(31, 'ROMANTIC'),
(18, 'ROMANTIC'),
(17, 'COMEDY'),
(19, 'ROMANTIC'),
(29, 'ADVENTURE'),
(44, 'ADVENTURE'),
(40, 'ROMANTIC'),
(20, 'ADVENTURE'),
(34, 'COMEDY'),
(13, 'ADVENTURE'),
(29, 'ROMANTIC'),
(21, 'ROMANTIC'),
(12, 'ROMANTIC'),
(2, 'ADVENTURE'),
(28, 'ROMANTIC'),
(33, 'ADVENTURE'),
(35, 'ROMANTIC'),
(24, 'ROMANTIC'),
(36, 'COMEDY'),
(3, 'ADVENTURE'),
(10, 'ADVENTURE'),
(50, 'ROMANTIC'),
(1, 'ADVENTURE'),
(45, 'ROMANTIC'),
(13, 'ADVENTURE'),
(22, 'ADVENTURE'),
(48, 'COMEDY'),
(30, 'COMEDY'),
(13, 'ADVENTURE'),
(9, 'HORROR'),
(48, 'ADVENTURE'),
(43, 'ROMANTIC'),
(9, 'ROMANTIC'),
(25, 'ADVENTURE'),
(9, 'ROMANTIC'),
(37, 'HORROR'),
(24, 'ADVENTURE'),
(11, 'COMEDY'),
(38, 'ADVENTURE'),
(43, 'ADVENTURE'),
(33, 'ADVENTURE'),
(51, '');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `m_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `release_date` datetime DEFAULT NULL,
  `language` enum('EN','Hi','Ma') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`m_id`, `name`, `release_date`, `language`) VALUES
(1, 'Cheslie Lang', '2020-09-30 09:38:52', 'EN'),
(2, 'Garvey Clunie', '2020-04-28 08:34:00', 'Ma'),
(3, 'Marcelia Ambroise', '2020-07-25 07:54:56', 'Ma'),
(4, 'Bancroft Cuncliffe', '2019-12-17 03:51:46', 'Ma'),
(5, 'Justinian Liebermann', '2020-01-28 10:45:31', 'Ma'),
(6, 'Lewie Beahan', '2019-12-21 21:16:23', 'EN'),
(7, 'Chantal Malmar', '2020-08-28 21:10:14', 'Ma'),
(8, 'Nicola Crosen', '2020-01-22 10:43:40', 'Ma'),
(9, 'Urban Rugg', '2020-04-18 23:42:24', 'Ma'),
(10, 'Wylma Curm', '2020-02-28 21:33:38', 'EN'),
(11, 'Johanna Coucher', '2020-09-08 17:52:44', 'Ma'),
(12, 'Barnabe Harken', '2020-10-03 11:49:15', 'Ma'),
(13, 'Aviva Skrine', '2020-08-31 17:48:52', 'Ma'),
(14, 'Augustina Iacovucci', '2020-01-31 20:28:32', 'EN'),
(15, 'Roth Aspenlon', '2019-11-21 00:44:35', 'Ma'),
(16, 'Jennine Steart', '2020-08-14 20:31:55', 'Ma'),
(17, 'Robinia Partner', '2020-07-17 14:50:36', 'Hi'),
(18, 'Ulises Overpool', '2020-04-13 14:07:28', 'Ma'),
(19, 'Nial Beardwood', '2020-07-11 01:36:15', 'Ma'),
(20, 'Bud Huelin', '2020-03-12 03:43:14', 'Ma'),
(21, 'Cassandre Metterick', '2020-04-05 18:48:09', 'Ma'),
(22, 'Griffie Tinkham', '2020-07-19 23:12:28', 'Hi'),
(23, 'Truda Rouby', '2020-07-21 19:47:53', 'EN'),
(24, 'Nissie Tant', '2019-11-02 19:12:34', 'Ma'),
(25, 'Brietta Bothams', '2020-04-22 16:04:33', 'Ma'),
(26, 'Earlie Askell', '2020-03-09 05:30:22', 'Hi'),
(27, 'Syd Tugman', '2020-05-19 14:56:57', 'Ma'),
(28, 'Hanna Dorning', '2019-11-16 23:44:17', 'Ma'),
(29, 'Archie McLenahan', '2020-02-10 00:19:33', 'Ma'),
(30, 'Irvin McClosh', '2020-07-11 10:11:04', 'Ma'),
(31, 'Halie Kunert', '2020-03-04 04:29:08', 'Hi'),
(32, 'Lottie Allsup', '2020-01-20 13:15:27', 'EN'),
(33, 'Stephie Varian', '2020-02-03 22:00:38', 'Ma'),
(34, 'Bernarr Bollard', '2020-08-22 03:36:24', 'Ma'),
(35, 'Bellina Sappson', '2020-05-29 22:51:08', 'Hi'),
(36, 'Kaylil Bartolomeazzi', '2020-02-14 14:43:28', 'Ma'),
(37, 'Teirtza MacAndie', '2020-02-07 02:46:22', 'Ma'),
(38, 'Kala Mc Gaughey', '2020-10-22 18:31:29', 'Ma'),
(39, 'Darb Game', '2020-02-19 17:34:23', 'Ma'),
(40, 'Lauralee Coggeshall', '2019-10-26 12:37:16', 'Hi'),
(41, 'Lelah Aitkin', '2020-02-29 15:37:43', 'Ma'),
(42, 'Clara Cavolini', '2019-12-10 00:43:55', 'EN'),
(43, 'Willard Grolmann', '2020-10-01 18:30:49', 'Ma'),
(44, 'Seana Weeks', '2020-06-29 05:26:34', 'Ma'),
(45, 'Sindee Tipper', '2020-09-18 13:08:38', 'Hi'),
(46, 'Bernarr Gower', '2020-10-01 03:00:50', 'Ma'),
(47, 'Eartha Preto', '2020-08-17 15:25:10', 'Ma'),
(48, 'Doll Godley', '2019-12-09 19:44:54', 'EN'),
(49, 'Silvester Grennan', '2020-08-23 12:15:12', 'Ma'),
(50, 'Korella Toke', '2020-06-23 02:59:38', 'EN'),
(51, 'KRISHNA KI KAHANI', '2021-04-26 00:00:00', 'Hi');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `timeAndDateOfPurchase` datetime DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `timeAndDateOfPurchase`, `amount`, `c_id`) VALUES
(1, '2021-04-24 23:23:57', 150, 1),
(2, '2021-04-24 23:25:32', 105, 1),
(3, '2021-04-25 15:44:23', 105, 5),
(4, '2021-04-25 16:40:24', 146, 6),
(5, '2021-04-25 18:56:06', 500, 10);

--
-- Triggers `payment`
--
DELIMITER $$
CREATE TRIGGER `t_payment` AFTER INSERT ON `payment` FOR EACH ROW insert into z_payment values((SELECT payment_id FROM payment order by payment_id DESC LIMIT 1), new.timeAndDateOfPurchase, new.amount, new.c_id)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `p_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gender` enum('M','F','O') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`p_id`, `name`, `gender`) VALUES
(1, 'TARUN PATEL', 'M'),
(2, 'ADMIN', 'M'),
(3, 'bond', NULL),
(4, ' sharukh', NULL),
(5, 'Hardik Pandya', 'M'),
(6, 'BHAGYA RANA', 'M'),
(8, 'KARAN ARJUN', 'M'),
(9, 'Don King', 'M'),
(10, 'Varun Sharma', 'M');

--
-- Triggers `person`
--
DELIMITER $$
CREATE TRIGGER `t_person` AFTER INSERT ON `person` FOR EACH ROW insert into z_person values((select p_id From person where Name = new.name AND gender=new.gender ORDER BY p_id DESC LIMIT 1),new.name, new.gender)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `m_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `description` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`m_id`, `p_id`, `description`) VALUES
(46, 6, 'This is Awesome Movie!');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `s_id` int(11) NOT NULL,
  `seat_price` int(11) DEFAULT NULL CHECK (`seat_price` >= 0),
  `theater_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`s_id`, `seat_price`, `theater_id`) VALUES
(1, 0, 1),
(2, 0, 1),
(3, 0, 1),
(4, 50, 1),
(5, 50, 1),
(6, 50, 1),
(7, 50, 1),
(8, 0, 1),
(9, 0, 1),
(10, 50, 1),
(11, 0, 1),
(12, 50, 1),
(13, 0, 1),
(14, 0, 1),
(15, 0, 1),
(16, 0, 1),
(17, 50, 1),
(18, 50, 1),
(19, 50, 1),
(20, 50, 1),
(21, 0, 1),
(22, 50, 1),
(23, 0, 1),
(24, 0, 1),
(25, 0, 1),
(26, 0, 2),
(27, 0, 2),
(28, 50, 2),
(29, 50, 2),
(30, 0, 2),
(31, 0, 2),
(32, 0, 2),
(33, 50, 2),
(34, 0, 2),
(35, 50, 2),
(36, 0, 2),
(37, 50, 2),
(38, 50, 2),
(39, 0, 2),
(40, 50, 2),
(41, 0, 2),
(42, 50, 2),
(43, 0, 2),
(44, 0, 2),
(45, 50, 2),
(46, 0, 2),
(47, 0, 2),
(48, 0, 2),
(49, 0, 2),
(50, 50, 2),
(51, 0, 2),
(52, 0, 2),
(53, 50, 2),
(54, 50, 2),
(55, 0, 2),
(56, 0, 2),
(57, 50, 2),
(58, 0, 2),
(59, 0, 2),
(60, 50, 2),
(61, 0, 2),
(62, 0, 2),
(63, 0, 2),
(64, 0, 2),
(65, 50, 2),
(66, 50, 2),
(67, 0, 2),
(68, 50, 2),
(69, 0, 2),
(70, 50, 2),
(71, 50, 2),
(72, 50, 2),
(73, 0, 2),
(74, 0, 2),
(75, 50, 3),
(76, 0, 3),
(77, 50, 3),
(78, 50, 3),
(79, 50, 3),
(80, 0, 3),
(81, 0, 3),
(82, 0, 3),
(83, 50, 3),
(84, 0, 3),
(85, 50, 3),
(86, 0, 3),
(87, 0, 3),
(88, 0, 3),
(89, 0, 3),
(90, 0, 3),
(91, 50, 3),
(92, 50, 3),
(93, 0, 3),
(94, 0, 3),
(95, 50, 3),
(96, 0, 3),
(97, 50, 3),
(98, 0, 3),
(99, 50, 3),
(100, 0, 3),
(101, 0, 3),
(102, 0, 3),
(103, 50, 3),
(104, 0, 3),
(105, 50, 3),
(106, 0, 3),
(107, 50, 3),
(108, 50, 3),
(109, 0, 3),
(110, 50, 3),
(111, 50, 3),
(112, 0, 3),
(113, 50, 3),
(114, 0, 3),
(115, 0, 3),
(116, 0, 3),
(117, 0, 3),
(118, 50, 3),
(119, 0, 3),
(120, 0, 3),
(121, 50, 3),
(122, 0, 3),
(123, 0, 3),
(124, 50, 4),
(125, 0, 4),
(126, 0, 4),
(127, 50, 4),
(128, 50, 4),
(129, 0, 4),
(130, 50, 4),
(131, 50, 4),
(132, 0, 4),
(133, 0, 4),
(134, 50, 4),
(135, 50, 4),
(136, 0, 4),
(137, 50, 4),
(138, 50, 4),
(139, 50, 4),
(140, 0, 4),
(141, 50, 4),
(142, 0, 4),
(143, 50, 4),
(144, 0, 4),
(145, 50, 4),
(146, 0, 4),
(147, 0, 4),
(148, 0, 4),
(149, 50, 5),
(150, 0, 5),
(151, 0, 5),
(152, 50, 5),
(153, 50, 5),
(154, 50, 5),
(155, 50, 5),
(156, 50, 5),
(157, 50, 5),
(158, 50, 5),
(159, 50, 5),
(160, 0, 5),
(161, 50, 5),
(162, 0, 5),
(163, 0, 5),
(164, 0, 5),
(165, 0, 5),
(166, 0, 5),
(167, 0, 5),
(168, 0, 5),
(169, 0, 5),
(170, 0, 5),
(171, 50, 5),
(172, 50, 5),
(173, 0, 5),
(174, 50, 5),
(175, 50, 5),
(176, 0, 5),
(177, 0, 5),
(178, 0, 5),
(179, 50, 5),
(180, 0, 5),
(181, 0, 5),
(182, 0, 5),
(183, 50, 5),
(184, 0, 5),
(185, 0, 5),
(186, 0, 5),
(187, 0, 5),
(188, 0, 5),
(189, 50, 5),
(190, 0, 5),
(191, 0, 5),
(192, 0, 5),
(193, 0, 5),
(194, 50, 5),
(195, 0, 5),
(196, 0, 5),
(197, 0, 5),
(198, 0, 6),
(199, 50, 6),
(200, 0, 6),
(201, 0, 6),
(202, 50, 6),
(203, 0, 6),
(204, 50, 6),
(205, 0, 6),
(206, 0, 6),
(207, 50, 6),
(208, 50, 6),
(209, 0, 6),
(210, 0, 6),
(211, 0, 6),
(212, 50, 6),
(213, 0, 6),
(214, 50, 6),
(215, 50, 6),
(216, 0, 6),
(217, 0, 6),
(218, 50, 6),
(219, 50, 6),
(220, 0, 6),
(221, 50, 6),
(222, 0, 6),
(223, 0, 7),
(224, 0, 7),
(225, 0, 7),
(226, 50, 7),
(227, 0, 7),
(228, 50, 7),
(229, 50, 7),
(230, 50, 7),
(231, 50, 7),
(232, 0, 7),
(233, 50, 7),
(234, 0, 7),
(235, 0, 7),
(236, 50, 7),
(237, 0, 7),
(238, 0, 7),
(239, 0, 7),
(240, 0, 7),
(241, 0, 7),
(242, 0, 7),
(243, 50, 7),
(244, 50, 7),
(245, 0, 7),
(246, 50, 7),
(247, 50, 7),
(248, 50, 8),
(249, 0, 8),
(250, 50, 8),
(251, 0, 8),
(252, 0, 8),
(253, 50, 8),
(254, 0, 8),
(255, 0, 8),
(256, 0, 8),
(257, 50, 8),
(258, 0, 8),
(259, 0, 8),
(260, 0, 8),
(261, 50, 8),
(262, 50, 8),
(263, 0, 8),
(264, 0, 8),
(265, 50, 8),
(266, 0, 8),
(267, 0, 8),
(268, 0, 8),
(269, 50, 8),
(270, 50, 8),
(271, 50, 8),
(272, 0, 8),
(273, 50, 8),
(274, 50, 8),
(275, 0, 8),
(276, 0, 8),
(277, 50, 8),
(278, 0, 8),
(279, 0, 8),
(280, 0, 8),
(281, 50, 8),
(282, 50, 8),
(283, 0, 8),
(284, 50, 8),
(285, 50, 8),
(286, 0, 8),
(287, 50, 8),
(288, 0, 8),
(289, 50, 8),
(290, 0, 8),
(291, 50, 8),
(292, 50, 8),
(293, 50, 8),
(294, 0, 8),
(295, 50, 8),
(296, 0, 8),
(297, 50, 9),
(298, 50, 9),
(299, 0, 9),
(300, 0, 9),
(301, 50, 9),
(302, 50, 9),
(303, 50, 9),
(304, 50, 9),
(305, 50, 9),
(306, 50, 9),
(307, 50, 9),
(308, 0, 9),
(309, 0, 9),
(310, 0, 9),
(311, 0, 9),
(312, 50, 9),
(313, 50, 9),
(314, 0, 9),
(315, 0, 9),
(316, 0, 9),
(317, 50, 9),
(318, 50, 9),
(319, 0, 9),
(320, 0, 9),
(321, 50, 9),
(322, 0, 9),
(323, 50, 9),
(324, 50, 9),
(325, 0, 9),
(326, 50, 9),
(327, 50, 9),
(328, 0, 9),
(329, 50, 9),
(330, 0, 9),
(331, 0, 9),
(332, 50, 9),
(333, 0, 9),
(334, 50, 9),
(335, 50, 9),
(336, 0, 9),
(337, 0, 9),
(338, 50, 9),
(339, 50, 9),
(340, 0, 9),
(341, 0, 9),
(342, 50, 9),
(343, 0, 9),
(344, 50, 9),
(345, 0, 9),
(346, 50, 10),
(347, 50, 10),
(348, 0, 10),
(349, 50, 10),
(350, 50, 10),
(351, 0, 10),
(352, 50, 10),
(353, 0, 10),
(354, 0, 10),
(355, 50, 10),
(356, 0, 10),
(357, 50, 10),
(358, 50, 10),
(359, 50, 10),
(360, 0, 10),
(361, 0, 10),
(362, 0, 10),
(363, 50, 10),
(364, 0, 10),
(365, 0, 10),
(366, 50, 10),
(367, 50, 10),
(368, 50, 10),
(369, 0, 10),
(370, 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `show_id` int(11) NOT NULL,
  `slot` time DEFAULT NULL,
  `price` int(11) DEFAULT NULL CHECK (`price` > 0),
  `t_id` int(11) DEFAULT NULL,
  `weekend_price` int(11) DEFAULT NULL CHECK (`weekend_price` >= 0),
  `m_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`show_id`, `slot`, `price`, `t_id`, `weekend_price`, `m_id`) VALUES
(1, '21:00:00', 52, 3, 138, 49),
(2, '09:50:00', 189, 7, 128, 49),
(3, '21:00:00', 150, 3, 42, 46),
(4, '18:30:00', 146, 2, 109, 47),
(5, '18:30:00', 151, 8, 37, 49),
(6, '21:00:00', 75, 8, 87, 47),
(7, '10:00:00', 62, 10, 25, 46),
(8, '21:30:00', 190, 1, 76, 50),
(9, '10:00:00', 125, 3, 147, 47),
(10, '16:00:00', 78, 3, 35, 45),
(11, '21:00:00', 80, 5, 48, 48),
(12, '15:00:00', 98, 5, 51, 48),
(13, '14:00:00', 170, 8, 98, 47),
(14, '13:45:00', 199, 1, 145, 50),
(15, '13:00:00', 83, 9, 77, 48),
(16, '20:45:00', 79, 5, 103, 48),
(17, '17:00:00', 125, 2, 109, 50),
(18, '13:30:00', 170, 6, 29, 50),
(19, '17:30:00', 182, 10, 150, 49),
(20, '17:00:00', 188, 5, 67, 49),
(21, '09:00:00', 79, 7, 135, 50),
(22, '16:50:00', 74, 5, 118, 46),
(23, '15:50:00', 105, 8, 58, 45),
(24, '12:50:00', 87, 10, 40, 46),
(25, '19:00:00', 124, 4, 64, 49),
(27, '16:00:00', 155, 11, 645, 49),
(28, '14:00:00', 125, 11, 25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `theater`
--

CREATE TABLE `theater` (
  `t_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `location` varchar(30) NOT NULL,
  `rating` float DEFAULT NULL CHECK (`rating` between 0.0 and 5.0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `theater`
--

INSERT INTO `theater` (`t_id`, `name`, `location`, `rating`) VALUES
(1, 'Munmro', 'Cambridge', 3.41),
(2, 'Alana', 'Londonderry', 2.27),
(3, 'Nelli', 'Cordelia', 1.95),
(4, 'Colby', 'Brickson Park', 3.51),
(5, 'Bryna', 'John Wall', 3.72),
(6, 'Tannie', 'Manitowish', 4.77),
(7, 'Slade', 'Golf Course', 1.87),
(8, 'Kariotta', 'Kinsman', 2.16),
(9, 'Walker', 'Sundown', 2.56),
(10, 'Rice', 'Goodland', 4.41),
(11, 'Bansali Cinemas', 'Surat', 4.7);

-- --------------------------------------------------------

--
-- Table structure for table `theater_user`
--

CREATE TABLE `theater_user` (
  `theater_id` int(11) NOT NULL,
  `password` varchar(61) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `theater_user`
--

INSERT INTO `theater_user` (`theater_id`, `password`) VALUES
(0, '$2a$15$ddkUKeGkVRCABZXxgFE/GOADEIOplE6xP8a2XdqgGVUjW1jkCzmAe'),
(11, '$2a$15$OkhJN9H8w8ReDYh3OhQsgu.x9sDwaLc6AhwLBwcdlxmwZZklTiRDu');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `dt` date DEFAULT NULL,
  `show_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `dt`, `show_id`, `payment_id`, `p_id`) VALUES
(1, '2021-04-25', 3, 1, 1),
(2, '2021-04-26', 23, 2, 1),
(3, '2021-04-25', 23, 3, 5),
(4, '2021-04-26', 4, 4, 6),
(5, '2021-04-26', 3, 5, 10);

--
-- Triggers `ticket`
--
DELIMITER $$
CREATE TRIGGER `t_ticket` AFTER INSERT ON `ticket` FOR EACH ROW insert into z_ticket values((SELECT ticket_id FROM ticket order by ticket_id DESC LIMIT 1), new.dt, new.show_id, new.payment_id,new.p_id)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `z_customer`
--

CREATE TABLE `z_customer` (
  `p_id` int(11) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `password` varchar(61) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `z_customer`
--

INSERT INTO `z_customer` (`p_id`, `Email`, `Phone`, `password`) VALUES
(9, 'don@gmail.com', '9879897673', '$2a$15$JaOaFoBOW7xfX6Q3JHO6d.HblPb5GUnnGfy/X/RzGEbPoOzo7woaC'),
(10, 'vsharma@gmail.com', '9897978734', '$2a$15$KqRjf3VD53d/eAlOLun5Ju52vB8sa5kgrjBK/adJj5RFZapgEU/MC');

-- --------------------------------------------------------

--
-- Table structure for table `z_payment`
--

CREATE TABLE `z_payment` (
  `payment_id` int(11) NOT NULL,
  `timeAndDateOfPurchase` datetime DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `z_payment`
--

INSERT INTO `z_payment` (`payment_id`, `timeAndDateOfPurchase`, `amount`, `c_id`) VALUES
(5, '2021-04-25 18:56:06', 500, 10);

-- --------------------------------------------------------

--
-- Table structure for table `z_person`
--

CREATE TABLE `z_person` (
  `p_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gender` enum('M','F','O') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `z_person`
--

INSERT INTO `z_person` (`p_id`, `name`, `gender`) VALUES
(10, 'Varun Sharma', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `z_ticket`
--

CREATE TABLE `z_ticket` (
  `ticket_id` int(11) NOT NULL,
  `dt` date DEFAULT NULL,
  `show_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `z_ticket`
--

INSERT INTO `z_ticket` (`ticket_id`, `dt`, `show_id`, `payment_id`, `p_id`) VALUES
(5, '2021-04-26', 3, 5, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acted_in`
--
ALTER TABLE `acted_in`
  ADD PRIMARY KEY (`p_id`,`m_id`);

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`payment`,`seat_id`),
  ADD KEY `fk_booking_ticket` (`seat_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`p_id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Phone` (`Phone`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD KEY `fk_mid` (`m_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_c_id_payment` (`c_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`p_id`,`m_id`),
  ADD KEY `fk_mid_review` (`m_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `fk_sid_seats` (`theater_id`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`show_id`),
  ADD KEY `fk_tid_show` (`t_id`),
  ADD KEY `fk_mid_show` (`m_id`);

--
-- Indexes for table `theater`
--
ALTER TABLE `theater`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `fk_shid_ticket` (`show_id`),
  ADD KEY `fk_pay_ticket` (`payment_id`),
  ADD KEY `fk_pid_ticket` (`p_id`);

--
-- Indexes for table `z_customer`
--
ALTER TABLE `z_customer`
  ADD PRIMARY KEY (`p_id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Phone` (`Phone`);

--
-- Indexes for table `z_payment`
--
ALTER TABLE `z_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `z_person`
--
ALTER TABLE `z_person`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `z_ticket`
--
ALTER TABLE `z_ticket`
  ADD PRIMARY KEY (`ticket_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `show_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `theater`
--
ALTER TABLE `theater`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `z_payment`
--
ALTER TABLE `z_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `z_person`
--
ALTER TABLE `z_person`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `z_ticket`
--
ALTER TABLE `z_ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acted_in`
--
ALTER TABLE `acted_in`
  ADD CONSTRAINT `fk_mid_actedin` FOREIGN KEY (`p_id`) REFERENCES `movies` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pid_actedin` FOREIGN KEY (`p_id`) REFERENCES `actor` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `actor`
--
ALTER TABLE `actor`
  ADD CONSTRAINT `fk_pid_actor` FOREIGN KEY (`p_id`) REFERENCES `person` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_booking_payment` FOREIGN KEY (`payment`) REFERENCES `payment` (`payment_id`),
  ADD CONSTRAINT `fk_booking_ticket` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`s_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_pid_customer` FOREIGN KEY (`p_id`) REFERENCES `person` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `genre`
--
ALTER TABLE `genre`
  ADD CONSTRAINT `fk_mid` FOREIGN KEY (`m_id`) REFERENCES `movies` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_c_id_payment` FOREIGN KEY (`c_id`) REFERENCES `customer` (`p_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_mid_review` FOREIGN KEY (`m_id`) REFERENCES `movies` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pid_review` FOREIGN KEY (`p_id`) REFERENCES `person` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `fk_sid_seats` FOREIGN KEY (`theater_id`) REFERENCES `theater` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shows`
--
ALTER TABLE `shows`
  ADD CONSTRAINT `fk_mid_show` FOREIGN KEY (`m_id`) REFERENCES `movies` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tid_show` FOREIGN KEY (`t_id`) REFERENCES `theater` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_pay_ticket` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pid_ticket` FOREIGN KEY (`p_id`) REFERENCES `person` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_shid_ticket` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
