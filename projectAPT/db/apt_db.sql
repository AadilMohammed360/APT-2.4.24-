-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 02, 2025 at 06:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

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
(25, 'Can add login', 7, 'add_login'),
(26, 'Can change login', 7, 'change_login'),
(27, 'Can delete login', 7, 'delete_login'),
(28, 'Can view login', 7, 'view_login'),
(29, 'Can add vacancy', 8, 'add_vacancy'),
(30, 'Can change vacancy', 8, 'change_vacancy'),
(31, 'Can delete vacancy', 8, 'delete_vacancy'),
(32, 'Can view vacancy', 8, 'view_vacancy'),
(33, 'Can add applicant', 9, 'add_applicant'),
(34, 'Can change applicant', 9, 'change_applicant'),
(35, 'Can delete applicant', 9, 'delete_applicant'),
(36, 'Can view applicant', 9, 'view_applicant'),
(37, 'Can add staff', 10, 'add_staff'),
(38, 'Can change staff', 10, 'change_staff'),
(39, 'Can delete staff', 10, 'delete_staff'),
(40, 'Can view staff', 10, 'view_staff'),
(41, 'Can add application', 11, 'add_application'),
(42, 'Can change application', 11, 'change_application'),
(43, 'Can delete application', 11, 'delete_application'),
(44, 'Can view application', 11, 'view_application');

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
  `degree` varchar(20) DEFAULT NULL,
  `experience` varchar(20) DEFAULT NULL,
  `cvpath` varchar(100) DEFAULT NULL,
  `log_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baseapp_applicant`
--

INSERT INTO `baseapp_applicant` (`id`, `applicantname`, `email`, `contact`, `address`, `username`, `degree`, `experience`, `cvpath`, `log_id_id`) VALUES
(1, 'anup', 'anup@gmail.com', 9567302940, '101, Hariharanagar Street', 'anup', 'M.Tech', '2', 'cv_base/bn.pdf', 2),
(2, 'apct az', 'apctaz@gmail.com', 9567302940, 'asd', 'apct az', 'M.Tech', '4', 'cv_base/cm.pdf', 3),
(3, 'rizwana', 'rizwan@gmail.com', 9567302940, '101 hariharanagar', 'rizwana', 'BCA,B.Tech', '2', 'cv_base/Data Scientist-MOHAMEDRIZWAN_CV.pdf (1).pdf', 4),
(4, 'apct ab', 'apctab@gmail.com', 9567302940, 'asd', 'apct ab', 'MSc', '2', 'cv_base/cv.pdf', 5),
(5, 'apct ae', 'apctae@gmail.com', 9567302940, 'asd', 'apct ae', 'MCA', NULL, 'cv_base/dc.pdf', 6),
(6, 'apct af', 'apctaf@gmail.com', 9567302940, 'asd', 'apct af', 'MCA', NULL, 'cv_base/df15.pdf', 7),
(7, 'apct ag', 'apctag@gmail.com', 9567302940, 'asd', 'apct ag', 'BCA', NULL, 'cv_base/DrishyaKP(CV).pdf', 8),
(8, 'apct ah', 'apctah@gmail.com', 9567302940, 'asd', 'apct ah', 'BCA', NULL, 'cv_base/drishyakpDataAnalyst.pdf', 9),
(9, 'apct ai', 'apctai@gmail.com', 9567302940, 'asd', 'apct ai', 'MTech', NULL, 'cv_base/ep.pdf', 10),
(10, 'apct aj', 'apctaj@gmail.com', 9567302940, 'asd', 'apct aj', 'B.Tech', NULL, 'cv_base/er.pdf', 11),
(11, 'apct ak', 'apctak@gmail.com', 9567302940, 'asd', 'apct ak', 'M.Tech', NULL, 'cv_base/fv.pdf', 12),
(12, 'apctal', 'apctal@gmail.com', 9567302940, 'asd', 'apctal', 'MSc', NULL, 'cv_base/gh.pdf', 13),
(13, 'apct am', 'apctam@gmail.com', 9567302940, 'asd', 'apct am', 'M.Tech', NULL, 'cv_base/jk.pdf', 14),
(14, 'apct an', 'apctan@gmail.com', 9567302940, 'asd', 'apct an', 'M.Tech', NULL, 'cv_base/jp.pdf', 15),
(15, 'apct ao', 'apctao@gmail.com', 9567302940, 'asd', 'apct ao', 'MCA', NULL, 'cv_base/jw.pdf', 16),
(16, 'apct ap', 'apctap@gmail.com', 9567302940, 'asd', 'apct ap', 'M.Sc', NULL, 'cv_base/pdflist.txt', 17),
(17, 'apct aq', 'apctaq@gmail.com', 9567302940, 'asd', 'apct aq', 'BCA', NULL, 'cv_base/qa.pdf', 18),
(18, 'apct ar', 'apctar@gmail.com', 9567302940, 'asd', 'apct ar', 'M.A', NULL, 'cv_base/qp.pdf', 19),
(19, 'apct as', 'apctas@gmail.com', 9567302940, 'asd', 'apct as', 'B.Tech', NULL, 'cv_base/sw.pdf', 20),
(20, 'apct at', 'apctat@gmail.com', 9567302940, 'asd', 'apct at', 'MCA', NULL, 'cv_base/tg.pdf', 21),
(21, 'apct au', 'apctau@gmail.com', 9567302940, 'asd', 'apct au', 'M.Sc', NULL, 'cv_base/tg16.pdf', 22),
(22, 'apct av', 'apctav@gmail.com', 9567302940, 'asd', 'apct av', 'BSc', NULL, 'cv_base/ui.pdf', 23),
(23, 'apct aw', 'apctaw@gmail.com', 9567302940, 'asd', 'apct aw', 'BSc', NULL, 'cv_base/xc.pdf', 24),
(24, 'apct ax', 'apctax@gmail.com', 9567302940, 'asd', 'apct ax', 'BSc', NULL, 'cv_base/yu.pdf', 25);

-- --------------------------------------------------------

--
-- Table structure for table `baseapp_application`
--

CREATE TABLE `baseapp_application` (
  `id` bigint(20) NOT NULL,
  `applied_date` datetime(6) NOT NULL,
  `status` varchar(30) NOT NULL,
  `status_updated_date` datetime(6) NOT NULL,
  `notes` longtext DEFAULT NULL,
  `ml_score` double DEFAULT NULL,
  `applicant_id` bigint(20) NOT NULL,
  `vacancy_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baseapp_application`
--

INSERT INTO `baseapp_application` (`id`, `applied_date`, `status`, `status_updated_date`, `notes`, `ml_score`, `applicant_id`, `vacancy_id`) VALUES
(1, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 1, 1),
(2, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 2, 1),
(3, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 3, 1),
(4, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 4, 1),
(5, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 5, 1),
(6, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 6, 1),
(7, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 7, 1),
(8, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 8, 1),
(9, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 9, 1),
(10, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 10, 1),
(11, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 11, 1),
(12, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 12, 1),
(13, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 13, 1),
(14, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 14, 1),
(15, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 15, 1),
(16, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 16, 1),
(17, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 17, 1),
(18, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 18, 1),
(19, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 19, 1),
(20, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 20, 1),
(21, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 21, 1),
(22, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 22, 1),
(23, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 23, 1),
(24, '2025-12-02 10:50:45.000000', 'APPLIED', '2025-12-02 10:50:45.000000', NULL, NULL, 24, 1);

-- --------------------------------------------------------

--
-- Table structure for table `baseapp_login`
--

CREATE TABLE `baseapp_login` (
  `id` bigint(20) NOT NULL,
  `role` varchar(15) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baseapp_login`
--

INSERT INTO `baseapp_login` (`id`, `role`, `username`, `email`, `password`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', 'Aa.12345'),
(2, 'applicant', 'anup', 'anup@gmail.com', 'Aa.12345'),
(3, 'applicant', 'apct az', 'apctaz@gmail.com', 'Aa.12345'),
(4, 'applicant', 'rizwana', 'rizwan@gmail.com', 'Aa.12345'),
(5, 'applicant', 'apct ab', 'apctab@gmail.com', 'Aa.12345'),
(6, 'applicant', 'apct ae', 'apctae@gmail.com', 'Aa.12345'),
(7, 'applicant', 'apct af', 'apctaf@gmail.com', 'Aa.12345'),
(8, 'applicant', 'apct ag', 'apctag@gmail.com', 'Aa.12345'),
(9, 'applicant', 'apct ah', 'apctah@gmail.com', 'Aa.12345'),
(10, 'applicant', 'apct ai', 'apctai@gmail.com', 'Aa.12345'),
(11, 'applicant', 'apct aj', 'apctaj@gmail.com', 'Aa.12345'),
(12, 'applicant', 'apct ak', 'apctak@gmail.com', 'Aa.12345'),
(13, 'applicant', 'apct al', 'apctal@gmail.com', 'Aa.12345'),
(14, 'applicant', 'apct am', 'apctam@gmail.com', 'Aa.12345'),
(15, 'applicant', 'apct an', 'apctan@gmail.com', 'Aa.12345'),
(16, 'applicant', 'apct ao', 'apctao@gmail.com', 'Aa.12345'),
(17, 'applicant', 'apct ap', 'apctap@gmail.com', 'Aa.12345'),
(18, 'applicant', 'apct aq', 'apctaq@gmail.com', 'Aa.12345'),
(19, 'applicant', 'apct ar', 'apctar@gmail.com', 'Aa.12345'),
(20, 'applicant', 'apct as', 'apctas@gmail.com', 'Aa.12345'),
(21, 'applicant', 'apct at', 'apctat@gmail.com', 'Aa.12345'),
(22, 'applicant', 'apct au', 'apctau@gmail.com', 'Aa.12345'),
(23, 'applicant', 'apct av', 'apctav@gmail.com', 'Aa.12345'),
(24, 'applicant', 'apct aw', 'apctaw@gmail.com', 'Aa.12345'),
(25, 'applicant', 'apct ax', 'apctax@gmail.com', 'Aa.12345'),
(26, 'staff', 'staff ab', 'staffab@gmail.com', 'Aa.12345');

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
(1, 'staff ab', 'staffab@gmail.com', 9567302940, 'dummy', 'staff ab', 26);

-- --------------------------------------------------------

--
-- Table structure for table `baseapp_vacancy`
--

CREATE TABLE `baseapp_vacancy` (
  `id` bigint(20) NOT NULL,
  `vacancyname` varchar(50) NOT NULL,
  `salary` varchar(30) DEFAULT NULL,
  `company` varchar(30) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `seats` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baseapp_vacancy`
--

INSERT INTO `baseapp_vacancy` (`id`, `vacancyname`, `salary`, `company`, `content`, `seats`) VALUES
(1, 'Software Engineer', '$250k', 'ABC Corporation', '<h2>Job Description</h2>\r\n<p>We are seeking a talented Software Engineer to join our dynamic team. You will be responsible for designing, developing, and maintaining software applications that meet our clients\' needs.</p>\r\n<h2>Qualifications</h2>\r\n<ul>\r\n<li>B.Tech in Computer Science or related field</li>\r\n<li>M.Tech preferred</li>\r\n<li>Strong programming skills in Java, Python, or C++</li>\r\n<li>Experience with Agile development methodologies</li>\r\n</ul>', 3),
(2, 'Data Scientist', '$280k', 'XYZ Technologies', '<h2>Job Description</h2>\r\n<p>Join our data analytics team to transform raw data into actionable insights. You will work with large datasets, build predictive models, and present findings to stakeholders.</p>\r\n<h2>Qualifications</h2>\r\n<ul>\r\n<li>BSc or MSc in Statistics, Mathematics, or Computer Science</li>\r\n<li>MCA degree holders welcome</li>\r\n<li>Proficiency in Python, R, and SQL</li>\r\n<li>Experience with machine learning frameworks</li>\r\n</ul>', 4),
(3, 'Web Developer', '$300k', 'PQR Solutions', '<h2>Job Description</h2>\r\n<p>We need a skilled Web Developer to create responsive and user-friendly websites. You will work on both frontend and backend development, ensuring seamless user experiences.</p>\r\n<h2>Qualifications</h2>\r\n<ul>\r\n<li>BCA, MCA, or B.Tech in Computer Science</li>\r\n<li>Strong knowledge of HTML, CSS, JavaScript</li>\r\n<li>Experience with React, Angular, or Vue.js</li>\r\n<li>Understanding of backend technologies (Node.js, Django, Flask)</li>\r\n</ul>', 8),
(4, 'Database Administrator', '$280k', 'GHI Enterprises', '<h2>Job Description</h2>\r\n<p>Maintain and optimize our database systems to ensure high performance, security, and availability. You will handle database backups, recovery, and performance tuning.</p>\r\n<h2>Qualifications</h2>\r\n<ul>\r\n<li>MCA, BCA, or B.Tech degree</li>\r\n<li>Strong knowledge of MySQL, PostgreSQL, or Oracle</li>\r\n<li>Experience with database optimization techniques</li>\r\n<li>Understanding of database security principles</li>\r\n</ul>', 5),
(5, 'Network Engineer', '$290k', 'JKL Technologies', '<h2>Job Description</h2>\r\n<p>Design, implement, and maintain our network infrastructure. You will troubleshoot network issues, configure routers and switches, and ensure network security.</p>\r\n<h2>Qualifications</h2>\r\n<ul>\r\n<li>B.Tech or M.Sc in Computer Networks or related field</li>\r\n<li>CCNA or CCNP certification preferred</li>\r\n<li>Experience with Cisco, Juniper networking equipment</li>\r\n<li>Knowledge of firewall configuration and VPN setup</li>\r\n</ul>', 9),
(6, 'Research Analyst', '$250k', 'MNO Corporation', '<h2>Job Description</h2>\r\n<p>Conduct research and analysis on market trends, competitor activities, and industry developments. Prepare detailed reports and presentations for management.</p>\r\n<h2>Qualifications</h2>\r\n<ul>\r\n<li>BSc, MSc, or M.A in relevant field</li>\r\n<li>Strong analytical and critical thinking skills</li>\r\n<li>Excellent written and verbal communication</li>\r\n<li>Proficiency in MS Excel and data analysis tools</li>\r\n</ul>', 90),
(7, 'HR Manager', '$220k', 'LMN Solutions', '<h2>Job Description</h2>\r\n<p>Lead our human resources department, managing recruitment, employee relations, performance management, and HR policy implementation.</p>\r\n<h2>Qualifications</h2>\r\n<ul>\r\n<li>MBA or MHRM degree required</li>\r\n<li>5+ years of HR management experience</li>\r\n<li>Strong knowledge of labor laws and HR best practices</li>\r\n<li>Excellent interpersonal and leadership skills</li>\r\n</ul>', 2),
(8, 'QA Tester', '$200k', 'DEF Innovations', '<h2>Job Description</h2>\r\n<p>Ensure software quality through comprehensive testing. You will create test plans, execute test cases, identify bugs, and work with developers to resolve issues.</p>\r\n<h2>Qualifications</h2>\r\n<ul>\r\n<li>BCA or MCA degree</li>\r\n<li>Experience with manual and automated testing</li>\r\n<li>Knowledge of testing tools (Selenium, JUnit, TestNG)</li>\r\n<li>Strong attention to detail and analytical skills</li>\r\n</ul>', 6);

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
(9, 'BaseApp', 'applicant'),
(11, 'BaseApp', 'application'),
(7, 'BaseApp', 'login'),
(10, 'BaseApp', 'staff'),
(8, 'BaseApp', 'vacancy'),
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
(1, 'BaseApp', '0001_initial', '2025-12-02 05:18:52.438073'),
(2, 'BaseApp', '0002_alter_vacancy_desc_alter_vacancy_qualification', '2025-12-02 05:18:52.469341'),
(3, 'BaseApp', '0003_rename_desc_vacancy_content_and_more', '2025-12-02 05:18:52.691015'),
(4, 'contenttypes', '0001_initial', '2025-12-02 05:18:53.050950'),
(5, 'auth', '0001_initial', '2025-12-02 05:19:00.446462'),
(6, 'admin', '0001_initial', '2025-12-02 05:19:02.192061'),
(7, 'admin', '0002_logentry_remove_auto_add', '2025-12-02 05:19:02.224599'),
(8, 'admin', '0003_logentry_add_action_flag_choices', '2025-12-02 05:19:02.260213'),
(9, 'contenttypes', '0002_remove_content_type_name', '2025-12-02 05:19:02.726108'),
(10, 'auth', '0002_alter_permission_name_max_length', '2025-12-02 05:19:03.323671'),
(11, 'auth', '0003_alter_user_email_max_length', '2025-12-02 05:19:03.518814'),
(12, 'auth', '0004_alter_user_username_opts', '2025-12-02 05:19:03.544837'),
(13, 'auth', '0005_alter_user_last_login_null', '2025-12-02 05:19:04.393545'),
(14, 'auth', '0006_require_contenttypes_0002', '2025-12-02 05:19:04.440420'),
(15, 'auth', '0007_alter_validators_add_error_messages', '2025-12-02 05:19:04.483680'),
(16, 'auth', '0008_alter_user_username_max_length', '2025-12-02 05:19:04.584709'),
(17, 'auth', '0009_alter_user_last_name_max_length', '2025-12-02 05:19:04.684998'),
(18, 'auth', '0010_alter_group_name_max_length', '2025-12-02 05:19:04.818899'),
(19, 'auth', '0011_update_proxy_permissions', '2025-12-02 05:19:04.857620'),
(20, 'auth', '0012_alter_user_first_name_max_length', '2025-12-02 05:19:04.935405'),
(21, 'sessions', '0001_initial', '2025-12-02 05:19:05.290537');

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
('iel1v8dp7joj55a3yae34yz5zw56yt31', 'eyJsb2dfaWQiOjI2fQ:1vQIpR:fNTRzPSRJKnOz1X_XgrC_DhGm3cW4drpzrKX5J2z0vE', '2025-12-16 05:21:33.772799');

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
-- Indexes for table `baseapp_application`
--
ALTER TABLE `baseapp_application`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `BaseApp_application_applicant_id_vacancy_id_d1867863_uniq` (`applicant_id`,`vacancy_id`),
  ADD KEY `BaseApp_application_vacancy_id_ac3e7b9d_fk_BaseApp_vacancy_id` (`vacancy_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `baseapp_application`
--
ALTER TABLE `baseapp_application`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `baseapp_login`
--
ALTER TABLE `baseapp_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `baseapp_staff`
--
ALTER TABLE `baseapp_staff`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `baseapp_vacancy`
--
ALTER TABLE `baseapp_vacancy`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
-- Constraints for table `baseapp_application`
--
ALTER TABLE `baseapp_application`
  ADD CONSTRAINT `BaseApp_application_applicant_id_66cea713_fk_BaseApp_a` FOREIGN KEY (`applicant_id`) REFERENCES `baseapp_applicant` (`id`),
  ADD CONSTRAINT `BaseApp_application_vacancy_id_ac3e7b9d_fk_BaseApp_vacancy_id` FOREIGN KEY (`vacancy_id`) REFERENCES `baseapp_vacancy` (`id`);

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
