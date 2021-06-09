-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 09, 2021 at 06:52 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_ajax`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_models`
--

CREATE TABLE `category_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `location_name`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Dhaka', 0, NULL, NULL),
(2, 'Faridpur', 0, NULL, NULL),
(3, 'Gazipur', 0, NULL, NULL),
(4, 'Gopalganj', 0, NULL, NULL),
(5, 'Jamalpur', 0, NULL, NULL),
(6, 'Kishoreganj', 0, NULL, NULL),
(7, 'Madaripur', 0, NULL, NULL),
(8, 'Manikganj', 0, NULL, NULL),
(9, 'Munshiganj', 0, NULL, NULL),
(10, 'Mymensingh', 0, NULL, NULL),
(11, 'Narayanganj', 0, NULL, NULL),
(12, 'Narsingdi', 0, NULL, NULL),
(13, 'Netrokona', 0, NULL, NULL),
(14, 'Rajbari', 0, NULL, NULL),
(15, 'Shariatpur', 0, NULL, NULL),
(16, 'Sherpur', 0, NULL, NULL),
(17, 'Tangail', 0, NULL, NULL),
(18, 'Bogra', 0, NULL, NULL),
(19, 'Joypurhat', 0, NULL, NULL),
(20, 'Naogaon', 0, NULL, NULL),
(21, 'Natore', 0, NULL, NULL),
(22, 'Nawabganj', 0, NULL, NULL),
(23, 'Pabna', 0, NULL, NULL),
(24, 'Rajshahi', 0, NULL, NULL),
(25, 'Sirajgonj', 0, NULL, NULL),
(26, 'Dinajpur', 0, NULL, NULL),
(27, 'Gaibandha', 0, NULL, NULL),
(28, 'Kurigram', 0, NULL, NULL),
(29, 'Lalmonirhat', 0, NULL, NULL),
(30, 'Nilphamari', 0, NULL, NULL),
(31, 'Panchagarh', 0, NULL, NULL),
(32, 'Rangpur', 0, NULL, NULL),
(33, 'Thakurgaon', 0, NULL, NULL),
(34, 'Barguna', 0, NULL, NULL),
(35, 'Barisal', 0, NULL, NULL),
(36, 'Bhola', 0, NULL, NULL),
(37, 'Jhalokati', 0, NULL, NULL),
(38, 'Patuakhali', 0, NULL, NULL),
(39, 'Pirojpur', 0, NULL, NULL),
(40, 'Bandarban', 0, NULL, NULL),
(41, 'Brahmanbaria', 0, NULL, NULL),
(42, 'Chandpur', 0, NULL, NULL),
(43, 'Chittagong', 0, NULL, NULL),
(44, 'Comilla', 0, NULL, NULL),
(45, 'Cox\'s Bazar', 0, NULL, NULL),
(46, 'Feni', 0, NULL, NULL),
(47, 'Khagrachari', 0, NULL, NULL),
(48, 'Lakshmipur', 0, NULL, NULL),
(49, 'Noakhali', 0, NULL, NULL),
(50, 'Rangamati', 0, NULL, NULL),
(51, 'Habiganj', 0, NULL, NULL),
(52, 'Maulvibazar', 0, NULL, NULL),
(53, 'Sunamganj', 0, NULL, NULL),
(54, 'Sylhet', 0, NULL, NULL),
(55, 'Bagerhat', 0, NULL, NULL),
(56, 'Chuadanga', 0, NULL, NULL),
(57, 'Jessore', 0, NULL, NULL),
(58, 'Jhenaidah', 0, NULL, NULL),
(59, 'Khulna', 0, NULL, NULL),
(60, 'Kushtia', 0, NULL, NULL),
(61, 'Magura', 0, NULL, NULL),
(62, 'Meherpur', 0, NULL, NULL),
(63, 'Narail', 0, NULL, NULL),
(64, 'Satkhira', 0, NULL, NULL),
(65, 'Gulsan 1', 1, NULL, NULL),
(66, 'Dhamrai Upazila', 1, NULL, NULL),
(67, 'Dohar Upazila', 1, NULL, NULL),
(68, 'Keraniganj Upazila', 1, NULL, NULL),
(69, 'Nawabganj Upazila', 1, NULL, NULL),
(70, 'Savar Upazila', 1, NULL, NULL),
(71, 'Charbhadrasan Upazila', 2, NULL, NULL),
(72, 'Sadarpur Upazila', 2, NULL, NULL),
(73, 'Shaltha Upazila', 2, NULL, NULL),
(74, 'Nagarkanda Upazila', 2, NULL, NULL),
(75, 'Bhanga Upazila', 2, NULL, NULL),
(76, 'Madhukhali Upazila', 2, NULL, NULL),
(77, 'Alfadanga Upazila', 2, NULL, NULL),
(78, 'Boalmari Upazila', 2, NULL, NULL),
(79, 'Faridpur Sadar Upazila', 2, NULL, NULL),
(80, 'Tongi', 3, NULL, NULL),
(81, 'Kaliganj', 3, NULL, NULL),
(82, 'Sripur', 3, NULL, NULL),
(83, 'Kapasia', 3, NULL, NULL),
(84, 'Kaliakior', 3, NULL, NULL),
(85, 'Gazipur Sadar-Joydebpur', 3, NULL, NULL),
(86, 'Kotalipara Upazila', 4, NULL, NULL),
(87, 'Tungipara Upazila', 4, NULL, NULL),
(88, 'Muksudpur Upazila', 4, NULL, NULL),
(89, 'Kashiani Upazila', 4, NULL, NULL),
(90, 'Gopalganj Sadar Upazila', 4, NULL, NULL),
(91, 'Sarishabari Upazila', 5, NULL, NULL),
(92, 'Melandaha Upazila', 5, NULL, NULL),
(93, 'Narundi Police I.C', 5, NULL, NULL),
(94, 'Madarganj Upazila', 5, NULL, NULL),
(95, 'Jamalpur Sadar Upazila', 5, NULL, NULL),
(96, 'Islampur Upazila', 5, NULL, NULL),
(97, 'Baksiganj Upazila', 5, NULL, NULL),
(98, 'Dewanganj Upazila', 5, NULL, NULL),
(99, 'Tarail Upazila', 6, NULL, NULL),
(100, 'Pakundia Upazila', 6, NULL, NULL),
(101, 'Nikli Upazila', 6, NULL, NULL),
(102, 'Mithamain Upazila', 6, NULL, NULL),
(103, 'Kuliarchar Upazila', 6, NULL, NULL),
(104, 'Kishoreganj Sadar Upazila', 6, NULL, NULL),
(105, 'Karimganj Upazila', 6, NULL, NULL),
(106, 'Itna Upazila', 6, NULL, NULL),
(107, 'Astagram Upazila', 6, NULL, NULL),
(108, 'Bajitpur Upazila', 6, NULL, NULL),
(109, 'Hossainpur Upazila', 6, NULL, NULL),
(110, 'Bhairab Upazila', 6, NULL, NULL),
(111, 'Katiadi Upazila', 6, NULL, NULL),
(112, 'Kalkini', 7, NULL, NULL),
(113, 'Rajoir', 7, NULL, NULL),
(114, 'Madaripur Sadar', 7, NULL, NULL),
(115, 'Shibchar', 7, NULL, NULL),
(116, 'Harirampur Upazila', 8, NULL, NULL),
(117, 'Manikganj Sadar Upazila', 8, NULL, NULL),
(118, 'Daulatpur Upazila', 8, NULL, NULL),
(119, 'Ghior Upazila', 8, NULL, NULL),
(120, 'Singair Upazila', 8, NULL, NULL),
(121, 'Shibalaya Upazila', 8, NULL, NULL),
(122, 'Saturia Upazila', 8, NULL, NULL),
(123, 'Tongibari Upazila', 9, NULL, NULL),
(124, 'Sirajdikhan Upazila', 9, NULL, NULL),
(125, 'Munshiganj Sadar Upazila', 9, NULL, NULL),
(126, 'Sreenagar Upazila', 9, NULL, NULL),
(127, 'Gazaria Upazila', 9, NULL, NULL),
(128, 'Lohajang Upazila', 9, NULL, NULL),
(129, 'Nandail', 10, NULL, NULL),
(130, 'Phulpur', 10, NULL, NULL),
(131, 'Mymensingh Sadar', 10, NULL, NULL),
(132, 'Ishwarganj', 10, NULL, NULL),
(133, 'Gauripur', 10, NULL, NULL),
(134, 'Gaffargaon', 10, NULL, NULL),
(135, 'Fulbaria', 10, NULL, NULL),
(136, 'Dhobaura', 10, NULL, NULL),
(137, 'Trishal', 10, NULL, NULL),
(138, 'Haluaghat', 10, NULL, NULL),
(139, 'Bhaluka', 10, NULL, NULL),
(140, 'Muktagachha', 10, NULL, NULL),
(141, 'Rupganj Upazila', 11, NULL, NULL),
(142, 'Naryanganj Sadar Upazila', 11, NULL, NULL),
(143, 'Bandar', 11, NULL, NULL),
(144, 'Sonargaon Upazila', 11, NULL, NULL),
(145, 'Araihazar Upazila', 11, NULL, NULL),
(146, 'Siddirgonj Upazila', 11, NULL, NULL),
(147, 'Shibpur Upazila', 12, NULL, NULL),
(148, 'Raipura Upazila, Narsingdi', 12, NULL, NULL),
(149, 'Palash Upazila', 12, NULL, NULL),
(150, 'Narsingdi Sadar Upazila', 12, NULL, NULL),
(151, 'Monohardi Upazila', 12, NULL, NULL),
(152, 'Belabo Upazila', 12, NULL, NULL),
(153, 'Khaliajuri Upazilla', 13, NULL, NULL),
(154, 'Purbadhala Upazilla', 13, NULL, NULL),
(155, 'Netrakona-S Upazilla', 13, NULL, NULL),
(156, 'Mohanganj Upazilla', 13, NULL, NULL),
(157, 'Madan Upazilla', 13, NULL, NULL),
(158, 'Kalmakanda Upazilla', 13, NULL, NULL),
(159, 'Durgapur Upazilla', 13, NULL, NULL),
(160, 'Barhatta Upazilla', 13, NULL, NULL),
(161, 'Atpara Upazilla', 13, NULL, NULL),
(162, 'Kendua Upazilla', 13, NULL, NULL),
(163, 'Rajbari Sadar Upazila', 14, NULL, NULL),
(164, 'Kalukhali Upazila', 14, NULL, NULL),
(165, 'Pangsha Upazila', 14, NULL, NULL),
(166, 'Goalandaghat Upazila', 14, NULL, NULL),
(167, 'Baliakandi Upazila', 14, NULL, NULL),
(168, 'Gosairhat Upazila', 15, NULL, NULL),
(169, 'Bhedarganj Upazila', 15, NULL, NULL),
(170, 'Jajira Upazila', 15, NULL, NULL),
(171, 'Damudya Upazila', 15, NULL, NULL),
(172, 'Shariatpur Sadar -Palong', 15, NULL, NULL),
(173, 'Naria Upazila', 15, NULL, NULL),
(174, 'Sreebardi Upazila', 16, NULL, NULL),
(175, 'Sherpur Sadar Upazila', 16, NULL, NULL),
(176, 'Nalitabari Upazila', 16, NULL, NULL),
(177, 'Nakla Upazila', 16, NULL, NULL),
(178, 'Jhenaigati Upazila', 16, NULL, NULL),
(179, 'Tangail Sadar Upazila', 17, NULL, NULL),
(180, 'Sakhipur Upazila', 17, NULL, NULL),
(181, 'Basail Upazila', 17, NULL, NULL),
(182, 'Madhupur Upazila', 17, NULL, NULL),
(183, 'Ghatail Upazila', 17, NULL, NULL),
(184, 'Kalihati Upazila', 17, NULL, NULL),
(185, 'Dhanbari Upazila', 17, NULL, NULL),
(186, 'Bhuapur Upazila', 17, NULL, NULL),
(187, 'Delduar Upazila', 17, NULL, NULL),
(188, 'Gopalpur Upazila', 17, NULL, NULL),
(189, 'Mirzapur Upazila', 17, NULL, NULL),
(190, 'Nagarpur Upazila', 17, NULL, NULL),
(191, 'Sonatala', 18, NULL, NULL),
(192, 'Shibganj', 18, NULL, NULL),
(193, 'Sariakandi', 18, NULL, NULL),
(194, 'Sahajanpur', 18, NULL, NULL),
(195, 'Nandigram', 18, NULL, NULL),
(196, 'Kahaloo', 18, NULL, NULL),
(197, 'Adamdighi', 18, NULL, NULL),
(198, 'Gabtali', 18, NULL, NULL),
(199, 'Dhupchanchia', 18, NULL, NULL),
(200, 'Dhunat', 18, NULL, NULL),
(201, 'Bogra Sadar', 18, NULL, NULL),
(202, 'Panchbibi', 19, NULL, NULL),
(203, 'Khetlal', 19, NULL, NULL),
(204, 'Kalai', 19, NULL, NULL),
(205, 'Joypurhat S', 19, NULL, NULL),
(206, 'Akkelpur', 19, NULL, NULL),
(207, 'Patnitala Upazila', 20, NULL, NULL),
(208, 'Dhamoirhat Upazila', 20, NULL, NULL),
(209, 'Sapahar Upazila', 20, NULL, NULL),
(210, 'Porsha Upazila', 20, NULL, NULL),
(211, 'Badalgachhi Upazila', 20, NULL, NULL),
(212, 'Atrai Upazila', 20, NULL, NULL),
(213, 'Niamatpur Upazila', 20, NULL, NULL),
(214, 'Raninagar Upazila', 20, NULL, NULL),
(215, 'Manda Upazila', 20, NULL, NULL),
(216, 'Mohadevpur Upazila', 20, NULL, NULL),
(217, 'Naogaon Sadar Upazila', 20, NULL, NULL),
(218, 'Baraigram Upazila', 21, NULL, NULL),
(219, 'Natore Sadar Upazila', 21, NULL, NULL),
(220, 'Lalpur Upazila', 21, NULL, NULL),
(221, 'Bagatipara Upazila', 21, NULL, NULL),
(222, 'Shibganj Upazila', 22, NULL, NULL),
(223, 'Nawabganj Sadar Upazila', 22, NULL, NULL),
(224, 'Nachole Upazila', 22, NULL, NULL),
(225, 'Gomastapur Upazila', 22, NULL, NULL),
(226, 'Bholahat Upazila', 22, NULL, NULL),
(227, 'Sujanagar Upazila', 23, NULL, NULL),
(228, 'Santhia Upazila', 23, NULL, NULL),
(229, 'Pabna Sadar Upazila', 23, NULL, NULL),
(230, 'Ishwardi Upazila', 23, NULL, NULL),
(231, 'Faridpur Upazila', 23, NULL, NULL),
(232, 'Chatmohar Upazila', 23, NULL, NULL),
(233, 'Bhangura Upazila', 23, NULL, NULL),
(234, 'Bera Upazila', 23, NULL, NULL),
(235, 'Atgharia Upazila', 23, NULL, NULL),
(236, 'Godagari', 24, NULL, NULL),
(237, 'Tanore', 24, NULL, NULL),
(238, 'Puthia', 24, NULL, NULL),
(239, 'Paba', 24, NULL, NULL),
(240, 'Mohanpur', 24, NULL, NULL),
(241, 'Durgapur', 24, NULL, NULL),
(242, 'Charghat', 24, NULL, NULL),
(243, 'Bagmara', 24, NULL, NULL),
(244, 'Bagha', 24, NULL, NULL),
(245, 'Chauhali Upazila', 25, NULL, NULL),
(246, 'Ullahpara Upazila', 25, NULL, NULL),
(247, 'Tarash Upazila', 25, NULL, NULL),
(248, 'Shahjadpur Upazila', 25, NULL, NULL),
(249, 'Raiganj Upazila', 25, NULL, NULL),
(250, 'Kazipur Upazila', 25, NULL, NULL),
(251, 'Kamarkhanda Upazila', 25, NULL, NULL),
(252, 'Belkuchi Upazila', 25, NULL, NULL),
(253, 'Sirajganj Sadar Upazila', 25, NULL, NULL),
(254, 'Hakimpur Upazila', 26, NULL, NULL),
(255, 'Kaharole Upazila', 26, NULL, NULL),
(256, 'Khansama Upazila', 26, NULL, NULL),
(257, 'Dinajpur Sadar Upazila', 26, NULL, NULL),
(258, 'Nawabganj', 26, NULL, NULL),
(259, 'Parbatipur Upazila', 26, NULL, NULL),
(260, 'Ghoraghat Upazila', 26, NULL, NULL),
(261, 'Phulbari Upazila', 26, NULL, NULL),
(262, 'Chirirbandar Upazila', 26, NULL, NULL),
(263, 'Bochaganj Upazila', 26, NULL, NULL),
(264, 'Biral Upazila', 26, NULL, NULL),
(265, 'Birganj', 26, NULL, NULL),
(266, 'Birampur Upazila', 26, NULL, NULL),
(267, 'Sadullapur', 27, NULL, NULL),
(268, 'Saghata', 27, NULL, NULL),
(269, 'Sundarganj', 27, NULL, NULL),
(270, 'Palashbari', 27, NULL, NULL),
(271, 'Gaibandha sadar', 27, NULL, NULL),
(272, 'Fulchhari', 27, NULL, NULL),
(273, 'Gobindaganj', 27, NULL, NULL),
(274, 'Char Rajibpur', 28, NULL, NULL),
(275, 'Rowmari', 28, NULL, NULL),
(276, 'Chilmari', 28, NULL, NULL),
(277, 'Ulipur', 28, NULL, NULL),
(278, 'Rajarhat', 28, NULL, NULL),
(279, 'Phulbari', 28, NULL, NULL),
(280, 'Bhurungamari', 28, NULL, NULL),
(281, 'Nageshwari', 28, NULL, NULL),
(282, 'Kurigram Sadar', 28, NULL, NULL),
(283, 'Patgram', 29, NULL, NULL),
(284, 'Hatibandha', 29, NULL, NULL),
(285, 'Kaliganj', 29, NULL, NULL),
(286, 'Aditmari', 29, NULL, NULL),
(287, 'Lalmanirhat Sadar', 29, NULL, NULL),
(288, 'Dimla', 30, NULL, NULL),
(289, 'Domar', 30, NULL, NULL),
(290, 'Kishoreganj', 30, NULL, NULL),
(291, 'Jaldhaka', 30, NULL, NULL),
(292, 'Saidpur', 30, NULL, NULL),
(293, 'Nilphamari Sadar', 30, NULL, NULL),
(294, 'Panchagarh Sadar', 31, NULL, NULL),
(295, 'Debiganj', 31, NULL, NULL),
(296, 'Boda', 31, NULL, NULL),
(297, 'Atwari', 31, NULL, NULL),
(298, 'Tetulia', 31, NULL, NULL),
(299, 'Kaunia', 32, NULL, NULL),
(300, 'Badarganj', 32, NULL, NULL),
(301, 'Mithapukur', 32, NULL, NULL),
(302, 'Gangachara', 32, NULL, NULL),
(303, 'Rangpur Sadar', 32, NULL, NULL),
(304, 'Pirgachha', 32, NULL, NULL),
(305, 'Pirganj', 32, NULL, NULL),
(306, 'Taraganj', 32, NULL, NULL),
(307, 'Baliadangi Upazila', 33, NULL, NULL),
(308, 'Thakurgaon Sadar Upazila', 33, NULL, NULL),
(309, 'Pirganj Upazila', 33, NULL, NULL),
(310, 'Haripur Upazila', 33, NULL, NULL),
(311, 'Ranisankail Upazila', 33, NULL, NULL),
(312, 'Patharghata Upazila', 34, NULL, NULL),
(313, 'Betagi Upazila', 34, NULL, NULL),
(314, 'Barguna Sadar Upazila', 34, NULL, NULL),
(315, 'Bamna Upazila', 34, NULL, NULL),
(316, 'Taltali Upazila', 34, NULL, NULL),
(317, 'Amtali Upazila', 34, NULL, NULL),
(318, 'Gaurnadi Upazila', 35, NULL, NULL),
(319, 'Banaripara Upazila', 35, NULL, NULL),
(320, 'Hizla Upazila', 35, NULL, NULL),
(321, 'Mehendiganj Upazila', 35, NULL, NULL),
(322, 'Wazirpur Upazila', 35, NULL, NULL),
(323, 'Bakerganj Upazila', 35, NULL, NULL),
(324, 'Barisal Sadar Upazila', 35, NULL, NULL),
(325, 'Babuganj Upazila', 35, NULL, NULL),
(326, 'Muladi Upazila', 35, NULL, NULL),
(327, 'Agailjhara Upazila', 35, NULL, NULL),
(328, 'Daulatkhan Upazila', 36, NULL, NULL),
(329, 'Tazumuddin Upazila', 36, NULL, NULL),
(330, 'Manpura Upazila', 36, NULL, NULL),
(331, 'Lalmohan Upazila', 36, NULL, NULL),
(332, 'Char Fasson Upazila', 36, NULL, NULL),
(333, 'Burhanuddin Upazila', 36, NULL, NULL),
(334, 'Bhola Sadar Upazila', 36, NULL, NULL),
(335, 'Nalchity Upazila', 37, NULL, NULL),
(336, 'Rajapur Upazila', 37, NULL, NULL),
(337, 'Jhalokati Sadar Upazila', 37, NULL, NULL),
(338, 'Kathalia Upazila', 37, NULL, NULL),
(339, 'Mirzaganj Upazila', 38, NULL, NULL),
(340, 'Patuakhali Sadar Upazila', 38, NULL, NULL),
(341, 'Rangabali Upazila', 38, NULL, NULL),
(342, 'Dumki Upazila', 38, NULL, NULL),
(343, 'Kalapara Upazila', 38, NULL, NULL),
(344, 'Galachipa Upazila', 38, NULL, NULL),
(345, 'Dashmina Upazila', 38, NULL, NULL),
(346, 'Bauphal Upazila', 38, NULL, NULL),
(347, 'Zianagar', 39, NULL, NULL),
(348, 'Pirojpur Sadar', 39, NULL, NULL),
(349, 'Nazirpur', 39, NULL, NULL),
(350, 'Mathbaria', 39, NULL, NULL),
(351, 'Kaukhali', 39, NULL, NULL),
(352, 'Bhandaria', 39, NULL, NULL),
(353, 'Nesarabad', 39, NULL, NULL),
(354, 'Rowangchhari', 40, NULL, NULL),
(355, 'Ruma', 40, NULL, NULL),
(356, 'Ali kadam', 40, NULL, NULL),
(357, 'Naikhongchhari', 40, NULL, NULL),
(358, 'Lama', 40, NULL, NULL),
(359, 'Thanchi', 40, NULL, NULL),
(360, 'Bandarban Sadar', 40, NULL, NULL),
(361, 'Bancharampur Upazila', 41, NULL, NULL),
(362, 'Bijoynagar Upazila', 41, NULL, NULL),
(363, 'Ashuganj Upazila', 41, NULL, NULL),
(364, 'Akhaura Upazila', 41, NULL, NULL),
(365, 'Kasba Upazila', 41, NULL, NULL),
(366, 'Shahbazpur Town', 41, NULL, NULL),
(367, 'Sarail Upazila', 41, NULL, NULL),
(368, 'Nabinagar Upazila', 41, NULL, NULL),
(369, 'Nasirnagar Upazila', 41, NULL, NULL),
(370, 'Brahmanbaria Sadar Upazila', 41, NULL, NULL),
(371, 'Shahrasti', 42, NULL, NULL),
(372, 'Matlab Dakkhin', 42, NULL, NULL),
(373, 'Matlab Uttar', 42, NULL, NULL),
(374, 'Kachua', 42, NULL, NULL),
(375, 'Haziganj', 42, NULL, NULL),
(376, 'Faridganj', 42, NULL, NULL),
(377, 'Chandpur Sadar', 42, NULL, NULL),
(378, 'Haimchar', 42, NULL, NULL),
(379, 'Patiya Upazila', 43, NULL, NULL),
(380, 'Rangunia Upazila', 43, NULL, NULL),
(381, 'Raozan Upazila', 43, NULL, NULL),
(382, 'Sandwip Upazila', 43, NULL, NULL),
(383, 'Satkania Upazila', 43, NULL, NULL),
(384, 'Sitakunda Upazila', 43, NULL, NULL),
(385, 'Mirsharai Upazila', 43, NULL, NULL),
(386, 'Lohagara Upazila', 43, NULL, NULL),
(387, 'Hathazari Upazila', 43, NULL, NULL),
(388, 'Fatikchhari Upazila', 43, NULL, NULL),
(389, 'Chandanaish Upazila', 43, NULL, NULL),
(390, 'Khulshi', 43, NULL, NULL),
(391, 'Banshkhali Upazila', 43, NULL, NULL),
(392, 'Anwara Upazila', 43, NULL, NULL),
(393, 'Panchlaish', 43, NULL, NULL),
(394, 'Boalkhali Upazila', 43, NULL, NULL),
(395, 'Chittagong Port', 43, NULL, NULL),
(396, 'Chauddagram Upazila', 44, NULL, NULL),
(397, 'Monohorgonj Upazila', 44, NULL, NULL),
(398, 'Laksam Upazila', 44, NULL, NULL),
(399, 'Comilla Sadar Upazila', 44, NULL, NULL),
(400, 'Homna Upazila', 44, NULL, NULL),
(401, 'Debidwar Upazila', 44, NULL, NULL),
(402, 'Daudkandi Upazila', 44, NULL, NULL),
(403, 'Chandina Upazila', 44, NULL, NULL),
(404, 'Burichong Upazila', 44, NULL, NULL),
(405, 'Brahmanpara Upazila', 44, NULL, NULL),
(406, 'Barura Upazila', 44, NULL, NULL),
(407, 'Meghna Upazila', 44, NULL, NULL),
(408, 'Nangalkot Upazila', 44, NULL, NULL),
(409, 'Comilla Sadar South Upazila', 44, NULL, NULL),
(410, 'Titas Upazila', 44, NULL, NULL),
(411, 'Muradnagar Upazila', 44, NULL, NULL),
(412, 'Kutubdia Upazila', 45, NULL, NULL),
(413, 'Pekua Upazila', 45, NULL, NULL),
(414, 'Ukhia Upazila', 45, NULL, NULL),
(415, 'Teknaf Upazila', 45, NULL, NULL),
(416, 'Ramu Upazila', 45, NULL, NULL),
(417, 'Maheshkhali Upazila', 45, NULL, NULL),
(418, 'Cox\'s Bazar Sadar Upazila', 45, NULL, NULL),
(419, 'Chakaria Upazila', 45, NULL, NULL),
(420, 'Sonagazi', 46, NULL, NULL),
(421, 'Fhulgazi', 46, NULL, NULL),
(422, 'Parshuram', 46, NULL, NULL),
(423, 'Chagalnaiya', 46, NULL, NULL),
(424, 'Feni Sadar', 46, NULL, NULL),
(425, 'Daganbhyan', 46, NULL, NULL),
(426, 'Dighinala Upazila', 47, NULL, NULL),
(427, 'Ramgarh Upazila', 47, NULL, NULL),
(428, 'Panchhari Upazila', 47, NULL, NULL),
(429, 'Matiranga Upazila', 47, NULL, NULL),
(430, 'Mahalchhari Upazila', 47, NULL, NULL),
(431, 'Lakshmichhari Upazila', 47, NULL, NULL),
(432, 'Khagrachhari Upazila', 47, NULL, NULL),
(433, 'Manikchhari Upazila', 47, NULL, NULL),
(434, 'Lakshmipur Sadar Upazila', 48, NULL, NULL),
(435, 'Komol Nagar Upazila', 48, NULL, NULL),
(436, 'Ramgati Upazila', 48, NULL, NULL),
(437, 'Raipur Upazila', 48, NULL, NULL),
(438, 'Ramganj Upazila', 48, NULL, NULL),
(439, 'Chatkhil Upazila', 49, NULL, NULL),
(440, 'Begumganj Upazila', 49, NULL, NULL),
(441, 'Noakhali Sadar Upazila', 49, NULL, NULL),
(442, 'Shenbag Upazila', 49, NULL, NULL),
(443, 'Hatia Upazila', 49, NULL, NULL),
(444, 'Kobirhat Upazila', 49, NULL, NULL),
(445, 'Sonaimuri Upazila', 49, NULL, NULL),
(446, 'Suborno Char Upazila', 49, NULL, NULL),
(447, 'Companyganj Upazila', 49, NULL, NULL),
(448, 'Bagaichhari Upazila', 50, NULL, NULL),
(449, 'Kaptai Upazila', 50, NULL, NULL),
(450, 'Langadu Upazila', 50, NULL, NULL),
(451, 'Nannerchar Upazila', 50, NULL, NULL),
(452, 'Kaukhali Upazila', 50, NULL, NULL),
(453, 'Rajasthali Upazila', 50, NULL, NULL),
(454, 'Juraichhari Upazila', 50, NULL, NULL),
(455, 'Barkal Upazila', 50, NULL, NULL),
(456, 'Rangamati Sadar Upazila', 50, NULL, NULL),
(457, 'Belaichhari Upazila', 50, NULL, NULL),
(458, 'Nabiganj', 51, NULL, NULL),
(459, 'Madhabpur', 51, NULL, NULL),
(460, 'Lakhai', 51, NULL, NULL),
(461, 'Habiganj Sadar', 51, NULL, NULL),
(462, 'Chunarughat', 51, NULL, NULL),
(463, 'Shaistagonj Upazila', 51, NULL, NULL),
(464, 'Bahubal', 51, NULL, NULL),
(465, 'Ajmiriganj', 51, NULL, NULL),
(466, 'Baniachang', 51, NULL, NULL),
(467, 'Sreemangal', 52, NULL, NULL),
(468, 'Rajnagar', 52, NULL, NULL),
(469, 'Kulaura', 52, NULL, NULL),
(470, 'Kamalganj', 52, NULL, NULL),
(471, 'Barlekha', 52, NULL, NULL),
(472, 'Moulvibazar Sadar', 52, NULL, NULL),
(473, 'Juri', 52, NULL, NULL),
(474, 'Sulla', 53, NULL, NULL),
(475, 'Jamalganj', 53, NULL, NULL),
(476, 'Tahirpur', 53, NULL, NULL),
(477, 'Jagannathpur', 53, NULL, NULL),
(478, 'Dowarabazar', 53, NULL, NULL),
(479, 'Dharampasha', 53, NULL, NULL),
(480, 'Derai', 53, NULL, NULL),
(481, 'Chhatak', 53, NULL, NULL),
(482, 'Bishwamvarpur', 53, NULL, NULL),
(483, 'Shanthiganj', 53, NULL, NULL),
(484, 'Sunamganj Sadar', 53, NULL, NULL),
(485, 'Sylhet Sadar', 54, NULL, NULL),
(486, 'Beanibazar', 54, NULL, NULL),
(487, 'Bishwanath', 54, NULL, NULL),
(488, 'Balaganj', 54, NULL, NULL),
(489, 'Companiganj', 54, NULL, NULL),
(490, 'Golapganj', 54, NULL, NULL),
(491, 'Gowainghat', 54, NULL, NULL),
(492, 'Jaintiapur', 54, NULL, NULL),
(493, 'Kanaighat', 54, NULL, NULL),
(494, 'Fenchuganj', 54, NULL, NULL),
(495, 'Zakiganj', 54, NULL, NULL),
(496, 'Nobigonj', 54, NULL, NULL),
(497, 'Dakshin Surma Upazila', 54, NULL, NULL),
(498, 'Chitalmari Upazila', 55, NULL, NULL),
(499, 'Bagerhat Sadar Upazila', 55, NULL, NULL),
(500, 'Fakirhat Upazila', 55, NULL, NULL),
(501, 'Kachua Upazila', 55, NULL, NULL),
(502, 'Mollahat Upazila', 55, NULL, NULL),
(503, 'Mongla Upazila', 55, NULL, NULL),
(504, 'Morrelganj Upazila', 55, NULL, NULL),
(505, 'Rampal Upazila', 55, NULL, NULL),
(506, 'Sarankhola Upazila', 55, NULL, NULL),
(507, 'Chuadanga-S Upazila', 56, NULL, NULL),
(508, 'Jibannagar Upazila', 56, NULL, NULL),
(509, 'Alamdanga Upazila', 56, NULL, NULL),
(510, 'Damurhuda Upazila', 56, NULL, NULL),
(511, 'Manirampur Upazila', 57, NULL, NULL),
(512, 'Sharsha Upazila', 57, NULL, NULL),
(513, 'Jhikargachha Upazila', 57, NULL, NULL),
(514, 'Chaugachha Upazila', 57, NULL, NULL),
(515, 'Abhaynagar Upazila', 57, NULL, NULL),
(516, 'Jessore Sadar Upazila', 57, NULL, NULL),
(517, 'Bagherpara Upazila', 57, NULL, NULL),
(518, 'Keshabpur Upazila', 57, NULL, NULL),
(519, 'Harinakunda Upazila', 58, NULL, NULL),
(520, 'Shailkupa Upazila', 58, NULL, NULL),
(521, 'Kotchandpur Upazila', 58, NULL, NULL),
(522, 'Kaliganj Upazila', 58, NULL, NULL),
(523, 'Maheshpur Upazila', 58, NULL, NULL),
(524, 'Jhenaidah Sadar Upazila', 58, NULL, NULL),
(525, 'Batiaghata Upazila', 59, NULL, NULL),
(526, 'Dacope Upazila', 59, NULL, NULL),
(527, 'Dumuria Upazila', 59, NULL, NULL),
(528, 'Dighalia Upazila', 59, NULL, NULL),
(529, 'Koyra Upazila', 59, NULL, NULL),
(530, 'Paikgachha Upazila', 59, NULL, NULL),
(531, 'Rupsa Upazila', 59, NULL, NULL),
(532, 'Phultala Upazila', 59, NULL, NULL),
(533, 'Terokhada Upazila', 59, NULL, NULL),
(534, 'Mirpur', 60, NULL, NULL),
(535, 'Daulatpur', 60, NULL, NULL),
(536, 'Bheramara', 60, NULL, NULL),
(537, 'Khoksa', 60, NULL, NULL),
(538, 'Kumarkhali', 60, NULL, NULL),
(539, 'Kushtia Sadar', 60, NULL, NULL),
(540, 'Sreepur Upazila', 61, NULL, NULL),
(541, 'Magura Sadar Upazila', 61, NULL, NULL),
(542, 'Mohammadpur Upazila', 61, NULL, NULL),
(543, 'Shalikha Upazila', 61, NULL, NULL),
(544, 'Meherpur-S Upazila', 62, NULL, NULL),
(545, 'angni Upazila', 62, NULL, NULL),
(546, 'Mujib Nagar Upazila', 62, NULL, NULL),
(547, 'Kalia Upazilla', 63, NULL, NULL),
(548, 'Narail-S Upazilla', 63, NULL, NULL),
(549, 'Lohagara Upazilla', 63, NULL, NULL),
(550, 'Shyamnagar Upazila', 64, NULL, NULL),
(551, 'Kaliganj Upazila', 64, NULL, NULL),
(552, 'Kalaroa Upazila', 64, NULL, NULL),
(553, 'Tala Upazila', 64, NULL, NULL),
(554, 'Debhata Upazila', 64, NULL, NULL),
(555, 'Satkhira Sadar Upazila', 64, NULL, NULL),
(556, 'Assasuni Upazila', 64, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2021_03_30_163956_create_roles_table', 1),
(4, '2021_03_30_164056_create_locations_table', 1),
(5, '2021_03_30_164058_create_users_table', 1),
(8, '2021_04_18_071558_create_category_models_table', 2),
(9, '2021_04_18_152941_create_post_models_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_models`
--

CREATE TABLE `post_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_models`
--

INSERT INTO `post_models` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'turag', 'hello', NULL, NULL),
(2, 'Title number 1', 'description test', NULL, NULL),
(3, 'hanif', 'test', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'subadmin', NULL, NULL),
(3, 'superadmin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `upazila_id` bigint(20) UNSIGNED NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=inactive 1=active',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `district_id`, `upazila_id`, `postal_code`, `name`, `email`, `mobile`, `address`, `avatar`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(11, 1, 46, 420, '3900', 'Kamal uddin', 'kamal@gmail.com', '1822010286', 'Feni', NULL, '1', NULL, '12345678', NULL, NULL, NULL),
(13, 1, 46, 422, '3900', 'jamal Uddin', 'jamal@gmail.com', '1822010288', 'Feni', NULL, '1', NULL, '12345678', NULL, NULL, NULL),
(14, 3, 46, 423, '3900', 'tanar Uddin', 'tanar@gmail.com', '1822010289', 'Feni', NULL, '1', NULL, '12345678', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_models`
--
ALTER TABLE `category_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `post_models`
--
ALTER TABLE `post_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_role_name_unique` (`role_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_distric_id_foreign` (`district_id`),
  ADD KEY `users_upazila_id_foreign` (`upazila_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_models`
--
ALTER TABLE `category_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=557;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `post_models`
--
ALTER TABLE `post_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_distric_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_upazila_id_foreign` FOREIGN KEY (`upazila_id`) REFERENCES `locations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
