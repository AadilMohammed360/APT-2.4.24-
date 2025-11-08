-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2024 at 12:52 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apt_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add applicant', 7, 'add_applicant'),
(26, 'Can change applicant', 7, 'change_applicant'),
(27, 'Can delete applicant', 7, 'delete_applicant'),
(28, 'Can view applicant', 7, 'view_applicant'),
(29, 'Can add login', 8, 'add_login'),
(30, 'Can change login', 8, 'change_login'),
(31, 'Can delete login', 8, 'delete_login'),
(32, 'Can view login', 8, 'view_login'),
(33, 'Can add staff', 9, 'add_staff'),
(34, 'Can change staff', 9, 'change_staff'),
(35, 'Can delete staff', 9, 'delete_staff'),
(36, 'Can view staff', 9, 'view_staff'),
(37, 'Can add vacancy', 10, 'add_vacancy'),
(38, 'Can change vacancy', 10, 'change_vacancy'),
(39, 'Can delete vacancy', 10, 'delete_vacancy'),
(40, 'Can view vacancy', 10, 'view_vacancy');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `baseapp_applicant`
--

CREATE TABLE `baseapp_applicant` (
  `id` bigint(20) NOT NULL,
  `applicantname` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact` bigint(20) NOT NULL,
  `address` longtext NOT NULL,
  `username` varchar(20) NOT NULL,
  `log_id_id` bigint(20) DEFAULT NULL,
  `cvpath` varchar(100) DEFAULT NULL,
  `degree` varchar(20) DEFAULT NULL,
  `experience` varchar(20) DEFAULT NULL,
  `hirestatus` varchar(20) DEFAULT NULL,
  `appliedpost` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baseapp_applicant`
--

INSERT INTO `baseapp_applicant` (`id`, `applicantname`, `email`, `contact`, `address`, `username`, `log_id_id`, `cvpath`, `degree`, `experience`, `hirestatus`, `appliedpost`) VALUES
(11, 'anup', 'anup@gmail.com', 9567302940, '101, Hariharnagar Street', 'anup', 40, 'cv_base/bn.pdf', 'M.Tech', '2', 'hired', 'Software Engineer'),
(14, 'apct az', 'apctaz@gmail.com', 9567302940, 'asd', 'apct az', 43, 'cv_base/cm.pdf', 'M.Tech', '4', 'hired', 'Software Engineer'),
(15, 'apct ab', 'apctab@gmail.com', 9567302940, 'asd', 'apct ab', 47, 'cv_base/cv.pdf', 'MSc', '2', 'hired', 'Software Engineer'),
(16, 'rizwan', 'rizwan@gmail.com', 9567302940, '101 hariharnagar', 'rizwana', 48, 'cv_base/Data Scientist-MOHAMEDRIZWAN_CV.pdf (1).pdf', 'BCA,B.Tech', '2', 'waiting', 'Web Developer'),
(17, 'apct ad', 'apctad@gmail.com', 9567302940, 'asd', 'apct ad', 49, 'cv_base/dc.pdf', 'M.Tech', NULL, 'waiting', 'Software Engineer'),
(18, 'apct ae', 'apctae@gmail.com', 9567302940, 'asd', 'apct ae', 50, 'cv_base/df.pdf', 'MCA', NULL, 'hired', 'Database Administrator'),
(19, 'apct af', 'apctaf@gmail.com', 9567302940, 'sad', 'apct af', 51, 'cv_base/df15.pdf', 'MCA', NULL, 'waiting', 'Web Developer'),
(20, 'apct ag', 'apctag@gmail.com', 9567302940, 'asd', 'apct ag', 52, 'cv_base/DrishyaKP(CV).pdf', 'BCA', NULL, 'hired', 'Data Analyst'),
(21, 'apct ah', 'apctah@gmail.com', 9567302940, 'asd', 'apct ah', 53, 'cv_base/drishyakpDataAnalyst.pdf', 'BCA', NULL, 'waiting', 'Web Developer'),
(22, 'apct ai', 'apctai@gmail.com', 9567302940, 'asd', 'apct ai', 54, 'cv_base/ep.pdf', 'B.Tech', NULL, 'hired', 'Network Engineer'),
(23, 'apct aj', 'apctaj@gmail.com', 9567302940, 'asd', 'apct aj', 55, 'cv_base/er.pdf', 'MSc', NULL, 'waiting', 'Research Analyst'),
(24, 'apct ak', 'apctak@gmail.com', 9567302940, 'asd', 'apct ak', 56, 'cv_base/fv.pdf', 'M.Tech', NULL, 'waiting', 'Software Engineer'),
(25, 'apct al', 'apctal@gmail.com', 9567302940, 'asd', 'apct al', 57, 'cv_base/gh.pdf', 'M.TEch', NULL, 'waiting', 'Software Engineer'),
(26, 'apct am', 'apctam@gmail.com', 9567302940, 'asd', 'apct am', 58, 'cv_base/jk.pdf', 'MSc', NULL, 'waiting', 'Research Analyst'),
(27, 'apct an', 'apctan@gmail.com', 9567302940, 'asd', 'apct an', 59, 'cv_base/jp.pdf', 'M.A', NULL, 'hired', 'Social Media Manager'),
(28, 'apct ao', 'apctao@gmail.com', 9567302940, 'asd', 'apct ao', 60, 'cv_base/jw.pdf', 'B.A', NULL, 'hired', 'Sales Associate'),
(31, 'apct ar', 'apctar@gmail.com', 9567302940, 'asd', 'apct ar', 63, 'cv_base/qa.pdf', 'MSc', NULL, 'waiting', 'Data Scientist'),
(32, 'apct as', 'apctas@gmail.com', 9567302940, 'asd', 'apct as', 64, 'cv_base/qp.pdf', 'M.A', NULL, 'waiting', 'Content Writer'),
(33, 'apct at', 'apctat@gmail.com', 9567302940, 'asd', 'apct at', 65, 'cv_base/sw.pdf', 'B.Tech', NULL, 'waiting', 'Software Tester'),
(34, 'apct au', 'apctau@gmail.com', 9567302940, 'asd', 'apct au', 66, 'cv_base/tg.pdf', 'MCA', NULL, 'waiting', 'Web Developer'),
(35, 'apct av', 'apctav@gmail.com', 9567302940, 'asd', 'apct av', 67, 'cv_base/tg16.pdf', 'MCA', NULL, 'waiting', 'Web Developer'),
(36, 'apct aw', 'apctaw@gmail.com', 9567302940, 'asd', 'apct aw', 68, 'cv_base/ui.pdf', 'BSc', NULL, 'waiting', 'Technical Support Specialist'),
(37, 'apct ax', 'apctax@gmail.com', 9567302940, 'asd', 'apct ax', 69, 'cv_base/xc.pdf', 'BCA', NULL, 'waiting', 'Research Analyst'),
(38, 'apct ay', 'apctay@gmail.com', 9567302940, 'asd', 'apct ay', 70, 'cv_base/yu.pdf', 'BSc', NULL, 'hired', 'Software Engineer');

-- --------------------------------------------------------

--
-- Table structure for table `baseapp_login`
--

CREATE TABLE `baseapp_login` (
  `id` bigint(20) NOT NULL,
  `role` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `username` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baseapp_login`
--

INSERT INTO `baseapp_login` (`id`, `role`, `email`, `password`, `username`) VALUES
(10, 'admin', 'dummy@gmail.com', 'admin', 'admin'),
(40, 'applicant', 'anup@gmail.com', 'Aa.12345', 'anup'),
(43, 'applicant', 'apctaz@gmail.com', 'Aa.12345', 'apct az'),
(44, 'staff', 'staffab@gmail.com', 'Aa.12345', 'staff ab'),
(47, 'applicant', 'apctab@gmail.com', 'Zz.12345', 'apct ab'),
(48, 'applicant', 'rizwan@gmail.com', 'Zz.12345', 'rizwana'),
(49, 'applicant', 'apctad@gmail.com', 'Aa.12345', 'apct ad'),
(50, 'applicant', 'apctae@gmail.com', 'Aa.12345', 'apct ae'),
(51, 'applicant', 'apctaf@gmail.com', 'Aa.12345', 'apct af'),
(52, 'applicant', 'apctag@gmail.com', 'Aa.12345', 'apct ag'),
(53, 'applicant', 'apctah@gmail.com', 'Aa.12345', 'apct ah'),
(54, 'applicant', 'apctai@gmail.com', 'Aa.12345', 'apct ai'),
(55, 'applicant', 'apctaj@gmail.com', 'Aa.12345', 'apct aj'),
(56, 'applicant', 'apctak@gmail.com', 'Aa.12345', 'apct ak'),
(57, 'applicant', 'apctal@gmail.com', 'Aa.12345', 'apct al'),
(58, 'applicant', 'apctam@gmail.com', 'Aa.12345', 'apct am'),
(59, 'applicant', 'apctan@gmail.com', 'Aa.12345', 'apct an'),
(60, 'applicant', 'apctao@gmail.com', 'Aa.12345', 'apct ao'),
(63, 'applicant', 'apctar@gmail.com', 'Aa.12345', 'apct ar'),
(64, 'applicant', 'apctas@gmail.com', 'Aa.12345', 'apct as'),
(65, 'applicant', 'apctat@gmail.com', 'Aa.12345', 'apct at'),
(66, 'applicant', 'apctau@gmail.com', 'Aa.12345', 'apct au'),
(67, 'applicant', 'apctav@gmail.com', 'Aa.12345', 'apct av'),
(68, 'applicant', 'apctaw@gmail.com', 'Aa.12345', 'apct aw'),
(69, 'applicant', 'apctax@gmail.com', 'Aa.12345', 'apct ax'),
(70, 'applicant', 'apctay@gmail.com', 'Aa.12345', 'apct ay');

-- --------------------------------------------------------

--
-- Table structure for table `baseapp_staff`
--

CREATE TABLE `baseapp_staff` (
  `id` bigint(20) NOT NULL,
  `staffname` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact` bigint(20) NOT NULL,
  `workplace` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `log_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baseapp_staff`
--

INSERT INTO `baseapp_staff` (`id`, `staffname`, `email`, `contact`, `workplace`, `username`, `log_id_id`) VALUES
(10, 'staff ab', 'staffab@gmail.com', 9567302940, 'dummy', 'staff ab', 44);

-- --------------------------------------------------------

--
-- Table structure for table `baseapp_vacancy`
--

CREATE TABLE `baseapp_vacancy` (
  `id` bigint(20) NOT NULL,
  `vacancyname` varchar(50) NOT NULL,
  `seats` bigint(20) NOT NULL,
  `company` varchar(30) DEFAULT NULL,
  `salary` varchar(30) DEFAULT NULL,
  `desc` longtext DEFAULT NULL,
  `qualification` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baseapp_vacancy`
--

INSERT INTO `baseapp_vacancy` (`id`, `vacancyname`, `seats`, `company`, `salary`, `desc`, `qualification`) VALUES
(1, 'Software Engineer', 3, 'ABC Corporation', '250', 'Dolor justo tempor duo ipsum accusam rebum gubergren erat. Elitr stet dolor vero clita labore gubergren. Kasd sed ipsum elitr clita rebum ut sea diam tempor. Sadipscing nonumy vero labore invidunt dolor sed, eirmod dolore amet aliquyam consetetur lorem, amet elitr clita et sed consetetur dolore accusam. Vero kasd nonumy justo rebum stet. Ipsum amet sed lorem sea magna. Rebum vero dolores dolores elitr vero dolores magna, stet sea sadipscing stet et. Est voluptua et sanctus at sanctus erat vero sed sed, amet duo no diam clita rebum duo, accusam tempor takimata clita stet nonumy rebum est invidunt stet, dolor.', '<ul class=\"list-unstyled\">\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Dolor justo tempor duo ipsum accusam</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Elitr stet dolor vero clita labore gubergren</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Rebum vero dolores dolores elitr</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Est voluptua et sanctus at sanctus erat</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Diam diam stet erat no est est</li>\n                            </ul>'),
(2, 'Data Scientist', 4, 'XYZ Technologies', '280', 'Dolor justo tempor duo ipsum accusam rebum gubergren erat. Elitr stet dolor vero clita labore gubergren. Kasd sed ipsum elitr clita rebum ut sea diam tempor. Sadipscing nonumy vero labore invidunt dolor sed, eirmod dolore amet aliquyam consetetur lorem, amet elitr clita et sed consetetur dolore accusam. Vero kasd nonumy justo rebum stet. Ipsum amet sed lorem sea magna. Rebum vero dolores dolores elitr vero dolores magna, stet sea sadipscing stet et. Est voluptua et sanctus at sanctus erat vero sed sed, amet duo no diam clita rebum duo, accusam tempor takimata clita stet nonumy rebum est invidunt stet, dolor.', '<ul class=\"list-unstyled\">\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Dolor justo tempor duo ipsum accusam</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Elitr stet dolor vero clita labore gubergren</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Rebum vero dolores dolores elitr</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Est voluptua et sanctus at sanctus erat</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Diam diam stet erat no est est</li>\n                            </ul>'),
(3, 'Web Developer', 8, 'PQR Solutions', '300', 'Dolor justo tempor duo ipsum accusam rebum gubergren erat. Elitr stet dolor vero clita labore gubergren. Kasd sed ipsum elitr clita rebum ut sea diam tempor. Sadipscing nonumy vero labore invidunt dolor sed, eirmod dolore amet aliquyam consetetur lorem, amet elitr clita et sed consetetur dolore accusam. Vero kasd nonumy justo rebum stet. Ipsum amet sed lorem sea magna. Rebum vero dolores dolores elitr vero dolores magna, stet sea sadipscing stet et. Est voluptua et sanctus at sanctus erat vero sed sed, amet duo no diam clita rebum duo, accusam tempor takimata clita stet nonumy rebum est invidunt stet, dolor.', '<ul class=\"list-unstyled\">\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Dolor justo tempor duo ipsum accusam</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Elitr stet dolor vero clita labore gubergren</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Rebum vero dolores dolores elitr</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Est voluptua et sanctus at sanctus erat</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Diam diam stet erat no est est</li>\n                            </ul>'),
(4, 'Software Engineer', 5, 'DEF Innovations', '220', 'Dolor justo tempor duo ipsum accusam rebum gubergren erat. Elitr stet dolor vero clita labore gubergren. Kasd sed ipsum elitr clita rebum ut sea diam tempor. Sadipscing nonumy vero labore invidunt dolor sed, eirmod dolore amet aliquyam consetetur lorem, amet elitr clita et sed consetetur dolore accusam. Vero kasd nonumy justo rebum stet. Ipsum amet sed lorem sea magna. Rebum vero dolores dolores elitr vero dolores magna, stet sea sadipscing stet et. Est voluptua et sanctus at sanctus erat vero sed sed, amet duo no diam clita rebum duo, accusam tempor takimata clita stet nonumy rebum est invidunt stet, dolor.', '<ul class=\"list-unstyled\">\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Dolor justo tempor duo ipsum accusam</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Elitr stet dolor vero clita labore gubergren</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Rebum vero dolores dolores elitr</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Est voluptua et sanctus at sanctus erat</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Diam diam stet erat no est est</li>\n                            </ul>'),
(5, 'Database Administrater', 7, 'GHI Enterprises', '280', 'Dolor justo tempor duo ipsum accusam rebum gubergren erat. Elitr stet dolor vero clita labore gubergren. Kasd sed ipsum elitr clita rebum ut sea diam tempor. Sadipscing nonumy vero labore invidunt dolor sed, eirmod dolore amet aliquyam consetetur lorem, amet elitr clita et sed consetetur dolore accusam. Vero kasd nonumy justo rebum stet. Ipsum amet sed lorem sea magna. Rebum vero dolores dolores elitr vero dolores magna, stet sea sadipscing stet et. Est voluptua et sanctus at sanctus erat vero sed sed, amet duo no diam clita rebum duo, accusam tempor takimata clita stet nonumy rebum est invidunt stet, dolor.', '<ul class=\"list-unstyled\">\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Dolor justo tempor duo ipsum accusam</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Elitr stet dolor vero clita labore gubergren</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Rebum vero dolores dolores elitr</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Est voluptua et sanctus at sanctus erat</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Diam diam stet erat no est est</li>\n                            </ul>'),
(6, 'Web Developer', 8, 'LMN Solutions', '300', 'Dolor justo tempor duo ipsum accusam rebum gubergren erat. Elitr stet dolor vero clita labore gubergren. Kasd sed ipsum elitr clita rebum ut sea diam tempor. Sadipscing nonumy vero labore invidunt dolor sed, eirmod dolore amet aliquyam consetetur lorem, amet elitr clita et sed consetetur dolore accusam. Vero kasd nonumy justo rebum stet. Ipsum amet sed lorem sea magna. Rebum vero dolores dolores elitr vero dolores magna, stet sea sadipscing stet et. Est voluptua et sanctus at sanctus erat vero sed sed, amet duo no diam clita rebum duo, accusam tempor takimata clita stet nonumy rebum est invidunt stet, dolor.', '<ul class=\"list-unstyled\">\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Dolor justo tempor duo ipsum accusam</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Elitr stet dolor vero clita labore gubergren</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Rebum vero dolores dolores elitr</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Est voluptua et sanctus at sanctus erat</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Diam diam stet erat no est est</li>\n                            </ul>'),
(7, 'Network Engineer', 9, 'JKL Technologies', '290', 'Dolor justo tempor duo ipsum accusam rebum gubergren erat. Elitr stet dolor vero clita labore gubergren. Kasd sed ipsum elitr clita rebum ut sea diam tempor. Sadipscing nonumy vero labore invidunt dolor sed, eirmod dolore amet aliquyam consetetur lorem, amet elitr clita et sed consetetur dolore accusam. Vero kasd nonumy justo rebum stet. Ipsum amet sed lorem sea magna. Rebum vero dolores dolores elitr vero dolores magna, stet sea sadipscing stet et. Est voluptua et sanctus at sanctus erat vero sed sed, amet duo no diam clita rebum duo, accusam tempor takimata clita stet nonumy rebum est invidunt stet, dolor.', '<ul class=\"list-unstyled\">\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Dolor justo tempor duo ipsum accusam</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Elitr stet dolor vero clita labore gubergren</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Rebum vero dolores dolores elitr</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Est voluptua et sanctus at sanctus erat</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Diam diam stet erat no est est</li>\n                            </ul>'),
(8, 'Research Analyst', 90, 'MNO Corporation', '250', 'Dolor justo tempor duo ipsum accusam rebum gubergren erat. Elitr stet dolor vero clita labore gubergren. Kasd sed ipsum elitr clita rebum ut sea diam tempor. Sadipscing nonumy vero labore invidunt dolor sed, eirmod dolore amet aliquyam consetetur lorem, amet elitr clita et sed consetetur dolore accusam. Vero kasd nonumy justo rebum stet. Ipsum amet sed lorem sea magna. Rebum vero dolores dolores elitr vero dolores magna, stet sea sadipscing stet et. Est voluptua et sanctus at sanctus erat vero sed sed, amet duo no diam clita rebum duo, accusam tempor takimata clita stet nonumy rebum est invidunt stet, dolor.', '<ul class=\"list-unstyled\">\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Dolor justo tempor duo ipsum accusam</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Elitr stet dolor vero clita labore gubergren</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Rebum vero dolores dolores elitr</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Est voluptua et sanctus at sanctus erat</li>\n                                <li><i class=\"fa fa-angle-right text-primary me-2\"></i>Diam diam stet erat no est est</li>\n                            </ul>');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'BaseApp', 'applicant'),
(8, 'BaseApp', 'login'),
(9, 'BaseApp', 'staff'),
(10, 'BaseApp', 'vacancy'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'BaseApp', '0001_initial', '2024-03-06 09:39:45.298783'),
(2, 'contenttypes', '0001_initial', '2024-03-06 09:39:45.314406'),
(3, 'auth', '0001_initial', '2024-03-06 09:39:45.548780'),
(4, 'admin', '0001_initial', '2024-03-06 09:39:45.611281'),
(5, 'admin', '0002_logentry_remove_auto_add', '2024-03-06 09:39:45.611281'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-06 09:39:45.626905'),
(7, 'contenttypes', '0002_remove_content_type_name', '2024-03-06 09:39:45.658161'),
(8, 'auth', '0002_alter_permission_name_max_length', '2024-03-06 09:39:45.689413'),
(9, 'auth', '0003_alter_user_email_max_length', '2024-03-06 09:39:45.705030'),
(10, 'auth', '0004_alter_user_username_opts', '2024-03-06 09:39:45.720656'),
(11, 'auth', '0005_alter_user_last_login_null', '2024-03-06 09:39:45.736281'),
(12, 'auth', '0006_require_contenttypes_0002', '2024-03-06 09:39:45.736281'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2024-03-06 09:39:45.736281'),
(14, 'auth', '0008_alter_user_username_max_length', '2024-03-06 09:39:45.751904'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2024-03-06 09:39:45.767532'),
(16, 'auth', '0010_alter_group_name_max_length', '2024-03-06 09:39:45.783151'),
(17, 'auth', '0011_update_proxy_permissions', '2024-03-06 09:39:45.783151'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2024-03-06 09:39:45.798781'),
(19, 'sessions', '0001_initial', '2024-03-06 09:39:45.814395'),
(20, 'BaseApp', '0002_applicant_log_id_alter_applicant_address_and_more', '2024-03-06 10:09:42.523054'),
(21, 'BaseApp', '0003_applicant_cvpath', '2024-03-10 14:29:40.064930'),
(22, 'BaseApp', '0004_alter_applicant_cvpath', '2024-03-10 14:59:35.716600'),
(23, 'BaseApp', '0005_staff', '2024-03-12 06:51:14.626996'),
(24, 'BaseApp', '0006_remove_login_username', '2024-03-12 06:57:54.358957'),
(25, 'BaseApp', '0007_login_username', '2024-03-12 07:55:52.093923'),
(26, 'BaseApp', '0008_remove_applicant_password_remove_applicant_role_and_more', '2024-03-14 07:41:41.688260'),
(27, 'BaseApp', '0009_applicant_degree_applicant_experience', '2024-03-15 07:19:36.410930'),
(28, 'BaseApp', '0010_vacancy', '2024-03-18 07:29:25.288938'),
(29, 'BaseApp', '0011_alter_applicant_cvpath', '2024-03-23 11:30:09.126113'),
(30, 'BaseApp', '0012_alter_applicant_cvpath', '2024-03-25 10:16:34.165876'),
(31, 'BaseApp', '0013_alter_applicant_cvpath', '2024-03-25 10:22:00.388350'),
(32, 'BaseApp', '0014_applicant_hirestatus', '2024-03-28 08:04:56.283458'),
(33, 'BaseApp', '0015_vacancy_company_vacancy_salary', '2024-03-29 06:56:45.894830'),
(34, 'BaseApp', '0016_applicant_appliedpost', '2024-03-29 07:36:26.805399'),
(35, 'BaseApp', '0017_vacancy_desc_vacancy_qualification', '2024-03-29 08:46:04.748067'),
(36, 'BaseApp', '0018_alter_vacancy_desc_alter_vacancy_qualification', '2024-03-29 08:48:31.917773'),
(37, 'BaseApp', '0019_remove_vacancy_log_id', '2024-03-29 13:59:46.602173'),
(38, 'BaseApp', '0020_alter_vacancy_vacancyname', '2024-03-29 16:17:25.414286');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('591723i30q9m99y9lthk5jrgkchp4mnz', 'eyJsb2dfaWQiOjQ3fQ:1rrAcp:958j7fHJDUnLFhb1JvF6FnJ2G65RBMpmZAm8bkqpHBo', '2024-04-15 05:54:31.700752'),
('cgyd2wu23rdgr2zjcbk9puero3fw0x1j', 'eyJsb2dfaWQiOjQ0fQ:1rqRjX:5wjgj8OzLEXvKFD7wl1kI5wCxHFOXMLBlfFmTs3hijQ', '2024-04-13 05:58:27.966442'),
('ildvtfxplfpsassubf1mckaoj7czk1ix', 'eyJsb2dfaWQiOjQ0fQ:1rrEwX:29MTFaVCOV-bwJeZSbLZOXUQ256dUFbECX_WTx_SUbU', '2024-04-15 10:31:09.554254'),
('vg093elo0wtb7t3eh4lyvpivw4l4xeix', 'eyJsb2dfaWQiOjQ0fQ:1rqV1u:a1DpiCC5g5vvFPS5e_Y8wMLbZ60zj3yFV6gLw1GrgU0', '2024-04-13 09:29:38.997711'),
('z1q0cacfrlu6yldi7c5fbz5bzv74xe2a', 'eyJsb2dfaWQiOjQzfQ:1rnzXJ:NNqY71bGLummJdT8KmWdZEVKAPWZmWHGF8pYF_FAfOI', '2024-04-06 11:27:41.968269');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `baseapp_applicant`
--
ALTER TABLE `baseapp_applicant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `BaseApp_applicant_log_id_id_4e9d423e_fk_BaseApp_login_id` (`log_id_id`);

--
-- Indexes for table `baseapp_login`
--
ALTER TABLE `baseapp_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `baseapp_staff`
--
ALTER TABLE `baseapp_staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `BaseApp_staff_log_id_id_48cd4642_fk_BaseApp_login_id` (`log_id_id`);

--
-- Indexes for table `baseapp_vacancy`
--
ALTER TABLE `baseapp_vacancy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `baseapp_applicant`
--
ALTER TABLE `baseapp_applicant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `baseapp_login`
--
ALTER TABLE `baseapp_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `baseapp_staff`
--
ALTER TABLE `baseapp_staff`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `baseapp_vacancy`
--
ALTER TABLE `baseapp_vacancy`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `baseapp_applicant`
--
ALTER TABLE `baseapp_applicant`
  ADD CONSTRAINT `BaseApp_applicant_log_id_id_4e9d423e_fk_BaseApp_login_id` FOREIGN KEY (`log_id_id`) REFERENCES `baseapp_login` (`id`);

--
-- Constraints for table `baseapp_staff`
--
ALTER TABLE `baseapp_staff`
  ADD CONSTRAINT `BaseApp_staff_log_id_id_48cd4642_fk_BaseApp_login_id` FOREIGN KEY (`log_id_id`) REFERENCES `baseapp_login` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
