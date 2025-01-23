-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2025 at 06:34 PM
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
-- Database: `testlink-task`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment_status`
--

CREATE TABLE `assignment_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT 'unknown'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `assignment_status`
--

INSERT INTO `assignment_status` (`id`, `description`) VALUES
(1, 'open'),
(2, 'closed'),
(3, 'completed'),
(4, 'todo_urgent'),
(5, 'todo');

-- --------------------------------------------------------

--
-- Table structure for table `assignment_types`
--

CREATE TABLE `assignment_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `fk_table` varchar(30) DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT 'unknown'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `assignment_types`
--

INSERT INTO `assignment_types` (`id`, `fk_table`, `description`) VALUES
(1, 'testplan_tcversions', 'testcase_execution'),
(2, 'tcversions', 'testcase_review');

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `fk_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fk_table` varchar(250) DEFAULT '',
  `title` varchar(250) DEFAULT '',
  `description` varchar(250) DEFAULT '',
  `file_name` varchar(250) NOT NULL DEFAULT '',
  `file_path` varchar(250) DEFAULT '',
  `file_size` int(11) NOT NULL DEFAULT 0,
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `content` longblob DEFAULT NULL,
  `compression_type` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `baseline_l1l2_context`
--

CREATE TABLE `baseline_l1l2_context` (
  `id` int(10) UNSIGNED NOT NULL,
  `testplan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `platform_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `begin_exec_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_exec_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `baseline_l1l2_details`
--

CREATE TABLE `baseline_l1l2_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `context_id` int(10) UNSIGNED NOT NULL,
  `top_tsuite_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `child_tsuite_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` char(1) DEFAULT NULL,
  `qty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_tc` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `builds`
--

CREATE TABLE `builds` (
  `id` int(10) UNSIGNED NOT NULL,
  `testplan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT 'undefined',
  `notes` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `release_date` date DEFAULT NULL,
  `closed_on_date` date DEFAULT NULL,
  `commit_id` varchar(64) DEFAULT NULL,
  `tag` varchar(64) DEFAULT NULL,
  `branch` varchar(64) DEFAULT NULL,
  `release_candidate` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Available builds';

--
-- Dumping data for table `builds`
--

INSERT INTO `builds` (`id`, `testplan_id`, `name`, `notes`, `active`, `is_open`, `author_id`, `creation_ts`, `release_date`, `closed_on_date`, `commit_id`, `tag`, `branch`, `release_candidate`) VALUES
(1, 9, 'test build', '<p>test build</p>\r\n', 1, 1, NULL, '2025-01-23 17:06:21', '2025-01-23', NULL, '2', '', 'main', '');

-- --------------------------------------------------------

--
-- Table structure for table `cfield_build_design_values`
--

CREATE TABLE `cfield_build_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cfield_design_values`
--

CREATE TABLE `cfield_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cfield_execution_values`
--

CREATE TABLE `cfield_execution_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `execution_id` int(10) NOT NULL DEFAULT 0,
  `testplan_id` int(10) NOT NULL DEFAULT 0,
  `tcversion_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cfield_node_types`
--

CREATE TABLE `cfield_node_types` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_type_id` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cfield_testplan_design_values`
--

CREATE TABLE `cfield_testplan_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `link_id` int(10) NOT NULL DEFAULT 0 COMMENT 'point to testplan_tcversion id',
  `value` varchar(4000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cfield_testprojects`
--

CREATE TABLE `cfield_testprojects` (
  `field_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `testproject_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `display_order` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `location` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `required_on_design` tinyint(1) NOT NULL DEFAULT 0,
  `required_on_execution` tinyint(1) NOT NULL DEFAULT 0,
  `monitorable` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `codetrackers`
--

CREATE TABLE `codetrackers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `label` varchar(64) NOT NULL DEFAULT '' COMMENT 'label to display on user interface',
  `type` smallint(6) NOT NULL DEFAULT 0,
  `possible_values` varchar(4000) NOT NULL DEFAULT '',
  `default_value` varchar(4000) NOT NULL DEFAULT '',
  `valid_regexp` varchar(255) NOT NULL DEFAULT '',
  `length_min` int(10) NOT NULL DEFAULT 0,
  `length_max` int(10) NOT NULL DEFAULT 0,
  `show_on_design` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=> show it during specification design',
  `enable_on_design` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=> user can write/manage it during specification design',
  `show_on_execution` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1=> show it during test case execution',
  `enable_on_execution` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1=> user can write/manage it during test case execution',
  `show_on_testplan_design` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `enable_on_testplan_design` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_version`
--

CREATE TABLE `db_version` (
  `version` varchar(50) NOT NULL DEFAULT 'unknown',
  `upgrade_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `db_version`
--

INSERT INTO `db_version` (`version`, `upgrade_ts`, `notes`) VALUES
('DB 1.9.20', '2025-01-22 20:10:56', 'TestLink 1.9.20 Raijin');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `log_level` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `source` varchar(45) DEFAULT NULL,
  `description` text NOT NULL,
  `fired_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `activity` varchar(45) DEFAULT NULL,
  `object_id` int(10) UNSIGNED DEFAULT NULL,
  `object_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES
(1, 1, 16, 'GUI', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:3:\"::1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737576756, 'LOGIN', 1, 'users'),
(2, 2, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_testproject_created\";s:6:\"params\";a:1:{i:0;s:12:\"Test Project\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737576803, 'CREATE', 1, 'testprojects'),
(3, 2, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737576804, 'PHP', 0, NULL),
(4, 2, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737576804, 'PHP', 0, NULL),
(5, 3, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 0 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737576879, 'PHP', 0, NULL),
(6, 3, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 1 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737576879, 'PHP', 0, NULL),
(7, 3, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 2 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737576879, 'PHP', 0, NULL),
(8, 3, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 3 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737576879, 'PHP', 0, NULL),
(9, 4, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 0 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737576899, 'PHP', 0, NULL),
(10, 4, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 1 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737576899, 'PHP', 0, NULL),
(11, 4, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 2 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737576899, 'PHP', 0, NULL),
(12, 4, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 3 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737576899, 'PHP', 0, NULL),
(13, 5, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 0 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737577126, 'PHP', 0, NULL),
(14, 5, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 1 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737577126, 'PHP', 0, NULL),
(15, 5, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 2 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737577126, 'PHP', 0, NULL),
(16, 5, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 3 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737577126, 'PHP', 0, NULL),
(17, 6, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 0 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737577139, 'PHP', 0, NULL),
(18, 6, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 1 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737577140, 'PHP', 0, NULL),
(19, 6, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 2 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737577140, 'PHP', 0, NULL),
(20, 6, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 3 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737577140, 'PHP', 0, NULL),
(21, 7, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 0 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737577147, 'PHP', 0, NULL),
(22, 7, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 1 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737577147, 'PHP', 0, NULL),
(23, 7, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 2 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737577147, 'PHP', 0, NULL),
(24, 7, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 3 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737577147, 'PHP', 0, NULL),
(25, 8, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 0 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737577154, 'PHP', 0, NULL),
(26, 8, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 1 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737577154, 'PHP', 0, NULL),
(27, 8, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 2 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737577154, 'PHP', 0, NULL),
(28, 8, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 3 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737577154, 'PHP', 0, NULL),
(29, 9, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737579496, 'LOGOUT', 1, 'users'),
(30, 10, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:3:\"::1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737579501, 'LOGIN', 1, 'users'),
(31, 11, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:3:\"::1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737579623, 'LOGIN', 1, 'users'),
(32, 12, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737579696, 'PHP', 0, NULL),
(33, 12, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737579696, 'PHP', 0, NULL),
(34, 12, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 31', 1737579696, 'PHP', 0, NULL),
(35, 12, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 31', 1737579696, 'PHP', 0, NULL),
(36, 12, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 48', 1737579696, 'PHP', 0, NULL),
(37, 12, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 48', 1737579696, 'PHP', 0, NULL),
(38, 12, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 49', 1737579697, 'PHP', 0, NULL),
(39, 12, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 49', 1737579697, 'PHP', 0, NULL),
(40, 12, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 51', 1737579697, 'PHP', 0, NULL),
(41, 12, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 51', 1737579697, 'PHP', 0, NULL),
(42, 13, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737579697, 'PHP', 0, NULL),
(43, 13, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737579697, 'PHP', 0, NULL),
(44, 13, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 31', 1737579697, 'PHP', 0, NULL),
(45, 13, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 31', 1737579697, 'PHP', 0, NULL),
(46, 13, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 48', 1737579697, 'PHP', 0, NULL),
(47, 13, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 48', 1737579697, 'PHP', 0, NULL),
(48, 13, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 49', 1737579697, 'PHP', 0, NULL),
(49, 13, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 49', 1737579697, 'PHP', 0, NULL),
(50, 13, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 51', 1737579697, 'PHP', 0, NULL),
(51, 13, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 51', 1737579698, 'PHP', 0, NULL),
(52, 14, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737579718, 'PHP', 0, NULL),
(53, 14, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737579718, 'PHP', 0, NULL),
(54, 14, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 31', 1737579718, 'PHP', 0, NULL),
(55, 14, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 31', 1737579718, 'PHP', 0, NULL),
(56, 14, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 48', 1737579719, 'PHP', 0, NULL),
(57, 14, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 48', 1737579719, 'PHP', 0, NULL),
(58, 14, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 49', 1737579719, 'PHP', 0, NULL),
(59, 14, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 49', 1737579719, 'PHP', 0, NULL),
(60, 14, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 51', 1737579719, 'PHP', 0, NULL),
(61, 14, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 51', 1737579719, 'PHP', 0, NULL),
(62, 15, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737579720, 'PHP', 0, NULL),
(63, 15, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737579720, 'PHP', 0, NULL),
(64, 15, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 31', 1737579720, 'PHP', 0, NULL),
(65, 15, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 31', 1737579720, 'PHP', 0, NULL),
(66, 15, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 48', 1737579720, 'PHP', 0, NULL),
(67, 15, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 48', 1737579720, 'PHP', 0, NULL),
(68, 15, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 49', 1737579720, 'PHP', 0, NULL),
(69, 15, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 49', 1737579720, 'PHP', 0, NULL),
(70, 15, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 51', 1737579720, 'PHP', 0, NULL),
(71, 15, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\7ab2ac4612be48ca8fac73cf6aeabef82ea8c145_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 51', 1737579721, 'PHP', 0, NULL),
(72, 16, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined property: stdClass::$uploadOp - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\62deba574361063c24e60abeb59cdd3ac9c804f6_0.file.planEdit.tpl.php - Line 130', 1737619481, 'PHP', 0, NULL),
(73, 16, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined property: stdClass::$itemID - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\62deba574361063c24e60abeb59cdd3ac9c804f6_0.file.planEdit.tpl.php - Line 152', 1737619481, 'PHP', 0, NULL),
(74, 17, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_testplan_created\";s:6:\"params\";a:2:{i:0;s:12:\"Test Project\";i:1;s:9:\"test plan\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737619513, 'CREATED', 9, 'testplans'),
(75, 18, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nforeach() argument must be of type array|object, null given - in G:\\xampp\\htdocs\\testlink\\lib\\plan\\buildView.php - Line 90', 1737619539, 'PHP', 0, NULL),
(76, 19, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_build_created\";s:6:\"params\";a:3:{i:0;s:12:\"Test Project\";i:1;s:9:\"test plan\";i:2;s:10:\"test build\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737619581, 'CREATE', 1, 'builds'),
(77, 19, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined property: stdClass::$build - in G:\\xampp\\htdocs\\testlink\\lib\\plan\\buildEdit.php - Line 343', 1737619581, 'PHP', 0, NULL),
(78, 19, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined variable $args - in G:\\xampp\\htdocs\\testlink\\lib\\plan\\buildEdit.php - Line 371', 1737619581, 'PHP', 0, NULL),
(79, 19, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"user\" on null - in G:\\xampp\\htdocs\\testlink\\lib\\plan\\buildEdit.php - Line 371', 1737619581, 'PHP', 0, NULL),
(80, 19, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"locale\" on null - in G:\\xampp\\htdocs\\testlink\\lib\\plan\\buildEdit.php - Line 371', 1737619581, 'PHP', 0, NULL),
(81, 19, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"\" - in G:\\xampp\\htdocs\\testlink\\lib\\plan\\buildEdit.php - Line 371', 1737619581, 'PHP', 0, NULL),
(82, 20, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737619907, 'PHP', 0, NULL),
(83, 20, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737619907, 'PHP', 0, NULL),
(84, 21, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined property: stdClass::$uploadOp - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\62deba574361063c24e60abeb59cdd3ac9c804f6_0.file.planEdit.tpl.php - Line 130', 1737619916, 'PHP', 0, NULL),
(85, 21, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined property: stdClass::$itemID - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\62deba574361063c24e60abeb59cdd3ac9c804f6_0.file.planEdit.tpl.php - Line 152', 1737619916, 'PHP', 0, NULL),
(86, 21, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\62deba574361063c24e60abeb59cdd3ac9c804f6_0.file.planEdit.tpl.php - Line 302', 1737619916, 'PHP', 0, NULL),
(87, 22, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737620109, 'PHP', 0, NULL),
(88, 22, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737620109, 'PHP', 0, NULL),
(89, 23, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737620162, 'PHP', 0, NULL),
(90, 23, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737620162, 'PHP', 0, NULL),
(91, 24, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737620182, 'PHP', 0, NULL),
(92, 24, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737620182, 'PHP', 0, NULL),
(93, 25, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737620302, 'PHP', 0, NULL),
(94, 25, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737620303, 'PHP', 0, NULL),
(95, 26, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737620491, 'PHP', 0, NULL),
(96, 26, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737620491, 'PHP', 0, NULL),
(97, 27, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined property: stdClass::$uploadOp - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\62deba574361063c24e60abeb59cdd3ac9c804f6_0.file.planEdit.tpl.php - Line 130', 1737620835, 'PHP', 0, NULL),
(98, 27, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined property: stdClass::$itemID - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\62deba574361063c24e60abeb59cdd3ac9c804f6_0.file.planEdit.tpl.php - Line 152', 1737620835, 'PHP', 0, NULL),
(99, 28, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_testplan_created\";s:6:\"params\";a:2:{i:0;s:12:\"Test Project\";i:1;s:11:\"test plan 2\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737620860, 'CREATED', 10, 'testplans'),
(100, 28, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:32:\"audit_users_roles_added_testplan\";s:6:\"params\";a:3:{i:0;s:5:\"admin\";i:1;s:11:\"test plan 2\";i:2;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737620860, 'ASSIGN', 10, 'testplans'),
(101, 29, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737620885, 'PHP', 0, NULL),
(102, 29, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737620885, 'PHP', 0, NULL),
(103, 30, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined property: stdClass::$uploadOp - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\62deba574361063c24e60abeb59cdd3ac9c804f6_0.file.planEdit.tpl.php - Line 130', 1737620972, 'PHP', 0, NULL),
(104, 30, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined property: stdClass::$itemID - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\62deba574361063c24e60abeb59cdd3ac9c804f6_0.file.planEdit.tpl.php - Line 152', 1737620972, 'PHP', 0, NULL),
(105, 30, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\62deba574361063c24e60abeb59cdd3ac9c804f6_0.file.planEdit.tpl.php - Line 302', 1737620972, 'PHP', 0, NULL),
(106, 31, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737621112, 'PHP', 0, NULL),
(107, 31, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737621112, 'PHP', 0, NULL),
(108, 32, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737621277, 'PHP', 0, NULL),
(109, 32, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737621277, 'PHP', 0, NULL),
(110, 32, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737621277, 'PHP', 0, NULL),
(111, 32, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737621277, 'PHP', 0, NULL),
(112, 33, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737621280, 'PHP', 0, NULL),
(113, 33, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737621280, 'PHP', 0, NULL),
(114, 33, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737621280, 'PHP', 0, NULL),
(115, 33, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737621280, 'PHP', 0, NULL),
(116, 34, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737621280, 'PHP', 0, NULL),
(117, 34, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737621280, 'PHP', 0, NULL),
(118, 34, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737621280, 'PHP', 0, NULL),
(119, 34, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737621280, 'PHP', 0, NULL),
(120, 35, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737621281, 'PHP', 0, NULL),
(121, 35, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737621281, 'PHP', 0, NULL),
(122, 35, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737621281, 'PHP', 0, NULL),
(123, 35, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737621281, 'PHP', 0, NULL),
(124, 36, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737621281, 'PHP', 0, NULL),
(125, 36, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737621281, 'PHP', 0, NULL),
(126, 36, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737621281, 'PHP', 0, NULL),
(127, 36, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737621281, 'PHP', 0, NULL),
(128, 37, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737621282, 'PHP', 0, NULL),
(129, 37, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737621282, 'PHP', 0, NULL),
(130, 37, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737621282, 'PHP', 0, NULL),
(131, 37, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737621282, 'PHP', 0, NULL),
(132, 38, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737621282, 'PHP', 0, NULL),
(133, 38, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737621282, 'PHP', 0, NULL),
(134, 38, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737621282, 'PHP', 0, NULL),
(135, 38, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737621282, 'PHP', 0, NULL),
(136, 39, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"DataTablesSelector\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737621404, 'PHP', 0, NULL),
(137, 39, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\094f29af95efaafdd96656b174c270aa67768665_0.file.DataTables.inc.tpl.php - Line 35', 1737621404, 'PHP', 0, NULL),
(138, 40, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737621625, 'PHP', 0, NULL),
(139, 40, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737621625, 'PHP', 0, NULL),
(140, 40, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737621625, 'PHP', 0, NULL),
(141, 40, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737621625, 'PHP', 0, NULL),
(142, 41, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737621626, 'PHP', 0, NULL),
(143, 41, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737621626, 'PHP', 0, NULL),
(144, 41, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737621626, 'PHP', 0, NULL),
(145, 41, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737621626, 'PHP', 0, NULL),
(146, 42, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:20:\"test-1 : test case 1\";i:1;s:1:\"1\";i:2;s:9:\"test plan\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737621651, 'ASSIGN', 9, 'testplans'),
(147, 42, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:20:\"test-2 : test case 2\";i:1;s:1:\"1\";i:2;s:9:\"test plan\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737621651, 'ASSIGN', 9, 'testplans'),
(148, 42, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:20:\"test-3 : test case 3\";i:1;s:1:\"1\";i:2;s:9:\"test plan\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737621652, 'ASSIGN', 9, 'testplans'),
(149, 42, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737621652, 'PHP', 0, NULL),
(150, 42, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737621652, 'PHP', 0, NULL),
(151, 42, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737621652, 'PHP', 0, NULL),
(152, 42, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737621652, 'PHP', 0, NULL),
(153, 42, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737621652, 'PHP', 0, NULL),
(154, 42, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737621652, 'PHP', 0, NULL),
(155, 42, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737621652, 'PHP', 0, NULL),
(156, 42, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737621653, 'PHP', 0, NULL),
(157, 42, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737621653, 'PHP', 0, NULL),
(158, 42, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737621653, 'PHP', 0, NULL),
(159, 42, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737621653, 'PHP', 0, NULL),
(160, 42, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737621653, 'PHP', 0, NULL),
(161, 42, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737621653, 'PHP', 0, NULL),
(162, 43, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737621692, 'PHP', 0, NULL),
(163, 44, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737621695, 'PHP', 0, NULL),
(164, 45, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737621696, 'PHP', 0, NULL),
(165, 46, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737621696, 'PHP', 0, NULL),
(166, 47, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737621697, 'PHP', 0, NULL),
(167, 48, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737621698, 'PHP', 0, NULL),
(168, 49, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737621698, 'PHP', 0, NULL),
(169, 50, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737621699, 'PHP', 0, NULL),
(170, 51, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737621699, 'PHP', 0, NULL),
(171, 52, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737621705, 'PHP', 0, NULL),
(172, 53, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737622136, 'PHP', 0, NULL),
(173, 54, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737622139, 'PHP', 0, NULL),
(174, 55, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737622139, 'PHP', 0, NULL),
(175, 56, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737622140, 'PHP', 0, NULL),
(176, 57, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737622140, 'PHP', 0, NULL),
(177, 58, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737622144, 'PHP', 0, NULL),
(178, 59, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737622145, 'PHP', 0, NULL),
(179, 60, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737622146, 'PHP', 0, NULL),
(180, 61, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737622147, 'PHP', 0, NULL),
(181, 62, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737622148, 'PHP', 0, NULL),
(182, 63, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737622152, 'PHP', 0, NULL),
(183, 64, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737622224, 'PHP', 0, NULL),
(184, 65, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737622225, 'PHP', 0, NULL),
(185, 66, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 0 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737622252, 'PHP', 0, NULL),
(186, 66, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 1 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737622252, 'PHP', 0, NULL),
(187, 66, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 2 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737622252, 'PHP', 0, NULL),
(188, 66, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 3 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737622252, 'PHP', 0, NULL),
(189, 67, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 0 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737622879, 'PHP', 0, NULL),
(190, 67, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 1 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737622879, 'PHP', 0, NULL),
(191, 67, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 2 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737622879, 'PHP', 0, NULL),
(192, 67, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key 3 - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testcase.class.php - Line 5568', 1737622879, 'PHP', 0, NULL),
(193, 68, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737623029, 'PHP', 0, NULL),
(194, 68, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737623029, 'PHP', 0, NULL),
(195, 68, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737623029, 'PHP', 0, NULL),
(196, 68, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737623029, 'PHP', 0, NULL),
(197, 68, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623029, 'PHP', 0, NULL),
(198, 68, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623029, 'PHP', 0, NULL),
(199, 68, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623029, 'PHP', 0, NULL),
(200, 68, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623029, 'PHP', 0, NULL),
(201, 68, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623029, 'PHP', 0, NULL),
(202, 68, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623029, 'PHP', 0, NULL),
(203, 68, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623029, 'PHP', 0, NULL),
(204, 68, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623029, 'PHP', 0, NULL),
(205, 68, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623029, 'PHP', 0, NULL),
(206, 68, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623030, 'PHP', 0, NULL),
(207, 68, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623030, 'PHP', 0, NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES
(208, 68, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 498', 1737623030, 'PHP', 0, NULL),
(209, 69, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737623030, 'PHP', 0, NULL),
(210, 69, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737623030, 'PHP', 0, NULL),
(211, 69, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737623030, 'PHP', 0, NULL),
(212, 69, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737623030, 'PHP', 0, NULL),
(213, 69, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623031, 'PHP', 0, NULL),
(214, 69, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623031, 'PHP', 0, NULL),
(215, 69, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623031, 'PHP', 0, NULL),
(216, 69, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623031, 'PHP', 0, NULL),
(217, 69, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623031, 'PHP', 0, NULL),
(218, 69, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623031, 'PHP', 0, NULL),
(219, 69, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623031, 'PHP', 0, NULL),
(220, 69, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623031, 'PHP', 0, NULL),
(221, 69, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623031, 'PHP', 0, NULL),
(222, 69, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623031, 'PHP', 0, NULL),
(223, 69, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623031, 'PHP', 0, NULL),
(224, 69, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 498', 1737623031, 'PHP', 0, NULL),
(225, 70, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737623032, 'PHP', 0, NULL),
(226, 70, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737623032, 'PHP', 0, NULL),
(227, 70, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737623032, 'PHP', 0, NULL),
(228, 70, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737623032, 'PHP', 0, NULL),
(229, 70, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623032, 'PHP', 0, NULL),
(230, 70, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623032, 'PHP', 0, NULL),
(231, 70, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623032, 'PHP', 0, NULL),
(232, 70, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623032, 'PHP', 0, NULL),
(233, 70, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623032, 'PHP', 0, NULL),
(234, 70, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623032, 'PHP', 0, NULL),
(235, 70, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623032, 'PHP', 0, NULL),
(236, 70, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623032, 'PHP', 0, NULL),
(237, 70, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623032, 'PHP', 0, NULL),
(238, 70, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623032, 'PHP', 0, NULL),
(239, 70, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623032, 'PHP', 0, NULL),
(240, 70, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 498', 1737623032, 'PHP', 0, NULL),
(241, 71, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737623033, 'PHP', 0, NULL),
(242, 71, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737623033, 'PHP', 0, NULL),
(243, 71, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737623033, 'PHP', 0, NULL),
(244, 71, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737623033, 'PHP', 0, NULL),
(245, 71, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623033, 'PHP', 0, NULL),
(246, 71, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623033, 'PHP', 0, NULL),
(247, 71, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623033, 'PHP', 0, NULL),
(248, 71, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623034, 'PHP', 0, NULL),
(249, 71, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623034, 'PHP', 0, NULL),
(250, 71, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623034, 'PHP', 0, NULL),
(251, 71, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623034, 'PHP', 0, NULL),
(252, 71, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623034, 'PHP', 0, NULL),
(253, 71, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623034, 'PHP', 0, NULL),
(254, 71, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623034, 'PHP', 0, NULL),
(255, 71, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623034, 'PHP', 0, NULL),
(256, 71, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 498', 1737623034, 'PHP', 0, NULL),
(257, 72, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737623034, 'PHP', 0, NULL),
(258, 72, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737623034, 'PHP', 0, NULL),
(259, 72, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737623034, 'PHP', 0, NULL),
(260, 72, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737623034, 'PHP', 0, NULL),
(261, 72, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623035, 'PHP', 0, NULL),
(262, 72, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623035, 'PHP', 0, NULL),
(263, 72, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623035, 'PHP', 0, NULL),
(264, 72, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623035, 'PHP', 0, NULL),
(265, 72, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623035, 'PHP', 0, NULL),
(266, 72, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623035, 'PHP', 0, NULL),
(267, 72, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623035, 'PHP', 0, NULL),
(268, 72, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623035, 'PHP', 0, NULL),
(269, 72, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623035, 'PHP', 0, NULL),
(270, 72, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623035, 'PHP', 0, NULL),
(271, 72, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623035, 'PHP', 0, NULL),
(272, 72, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 498', 1737623035, 'PHP', 0, NULL),
(273, 73, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737623035, 'PHP', 0, NULL),
(274, 73, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737623036, 'PHP', 0, NULL),
(275, 73, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737623036, 'PHP', 0, NULL),
(276, 73, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737623036, 'PHP', 0, NULL),
(277, 73, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623036, 'PHP', 0, NULL),
(278, 73, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623036, 'PHP', 0, NULL),
(279, 73, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623036, 'PHP', 0, NULL),
(280, 73, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623036, 'PHP', 0, NULL),
(281, 73, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623036, 'PHP', 0, NULL),
(282, 73, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623036, 'PHP', 0, NULL),
(283, 73, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623036, 'PHP', 0, NULL),
(284, 73, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623036, 'PHP', 0, NULL),
(285, 73, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623036, 'PHP', 0, NULL),
(286, 73, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623036, 'PHP', 0, NULL),
(287, 73, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623036, 'PHP', 0, NULL),
(288, 73, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 498', 1737623036, 'PHP', 0, NULL),
(289, 74, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737623037, 'PHP', 0, NULL),
(290, 74, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737623037, 'PHP', 0, NULL),
(291, 74, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737623037, 'PHP', 0, NULL),
(292, 74, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737623037, 'PHP', 0, NULL),
(293, 74, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623037, 'PHP', 0, NULL),
(294, 74, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623037, 'PHP', 0, NULL),
(295, 74, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623037, 'PHP', 0, NULL),
(296, 74, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623037, 'PHP', 0, NULL),
(297, 74, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623037, 'PHP', 0, NULL),
(298, 74, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623037, 'PHP', 0, NULL),
(299, 74, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623038, 'PHP', 0, NULL),
(300, 74, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623038, 'PHP', 0, NULL),
(301, 74, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623038, 'PHP', 0, NULL),
(302, 74, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623038, 'PHP', 0, NULL),
(303, 74, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623038, 'PHP', 0, NULL),
(304, 74, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 498', 1737623038, 'PHP', 0, NULL),
(305, 75, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737623038, 'PHP', 0, NULL),
(306, 75, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737623038, 'PHP', 0, NULL),
(307, 75, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737623039, 'PHP', 0, NULL),
(308, 75, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737623039, 'PHP', 0, NULL),
(309, 75, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623039, 'PHP', 0, NULL),
(310, 75, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623039, 'PHP', 0, NULL),
(311, 75, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623039, 'PHP', 0, NULL),
(312, 75, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623039, 'PHP', 0, NULL),
(313, 75, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623039, 'PHP', 0, NULL),
(314, 75, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623039, 'PHP', 0, NULL),
(315, 75, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623039, 'PHP', 0, NULL),
(316, 75, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623039, 'PHP', 0, NULL),
(317, 75, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623039, 'PHP', 0, NULL),
(318, 75, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623039, 'PHP', 0, NULL),
(319, 75, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623039, 'PHP', 0, NULL),
(320, 75, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 498', 1737623039, 'PHP', 0, NULL),
(321, 76, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737623040, 'PHP', 0, NULL),
(322, 76, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737623040, 'PHP', 0, NULL),
(323, 76, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737623040, 'PHP', 0, NULL),
(324, 76, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737623040, 'PHP', 0, NULL),
(325, 76, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623040, 'PHP', 0, NULL),
(326, 76, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623040, 'PHP', 0, NULL),
(327, 76, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623040, 'PHP', 0, NULL),
(328, 76, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623040, 'PHP', 0, NULL),
(329, 76, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623040, 'PHP', 0, NULL),
(330, 76, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623040, 'PHP', 0, NULL),
(331, 76, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623040, 'PHP', 0, NULL),
(332, 76, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623040, 'PHP', 0, NULL),
(333, 76, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623040, 'PHP', 0, NULL),
(334, 76, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623041, 'PHP', 0, NULL),
(335, 76, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623041, 'PHP', 0, NULL),
(336, 76, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 498', 1737623041, 'PHP', 0, NULL),
(337, 77, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737623041, 'PHP', 0, NULL),
(338, 77, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737623041, 'PHP', 0, NULL),
(339, 77, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737623041, 'PHP', 0, NULL),
(340, 77, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737623041, 'PHP', 0, NULL),
(341, 77, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623041, 'PHP', 0, NULL),
(342, 77, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623041, 'PHP', 0, NULL),
(343, 77, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623041, 'PHP', 0, NULL),
(344, 77, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623042, 'PHP', 0, NULL),
(345, 77, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623042, 'PHP', 0, NULL),
(346, 77, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623042, 'PHP', 0, NULL),
(347, 77, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623042, 'PHP', 0, NULL),
(348, 77, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623042, 'PHP', 0, NULL),
(349, 77, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623042, 'PHP', 0, NULL),
(350, 77, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623042, 'PHP', 0, NULL),
(351, 77, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623042, 'PHP', 0, NULL),
(352, 77, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 498', 1737623042, 'PHP', 0, NULL),
(353, 78, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737623043, 'PHP', 0, NULL),
(354, 78, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737623043, 'PHP', 0, NULL),
(355, 78, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737623043, 'PHP', 0, NULL),
(356, 78, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737623043, 'PHP', 0, NULL),
(357, 78, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623043, 'PHP', 0, NULL),
(358, 78, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623043, 'PHP', 0, NULL),
(359, 78, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623043, 'PHP', 0, NULL),
(360, 78, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623043, 'PHP', 0, NULL),
(361, 78, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623043, 'PHP', 0, NULL),
(362, 78, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623043, 'PHP', 0, NULL),
(363, 78, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623043, 'PHP', 0, NULL),
(364, 78, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623043, 'PHP', 0, NULL),
(365, 78, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623043, 'PHP', 0, NULL),
(366, 78, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623043, 'PHP', 0, NULL),
(367, 78, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623043, 'PHP', 0, NULL),
(368, 78, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 498', 1737623043, 'PHP', 0, NULL),
(369, 79, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737623045, 'PHP', 0, NULL),
(370, 79, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737623045, 'PHP', 0, NULL),
(371, 79, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737623046, 'PHP', 0, NULL),
(372, 79, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737623046, 'PHP', 0, NULL),
(373, 79, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623046, 'PHP', 0, NULL),
(374, 79, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623046, 'PHP', 0, NULL),
(375, 79, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623046, 'PHP', 0, NULL),
(376, 79, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623046, 'PHP', 0, NULL),
(377, 79, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623046, 'PHP', 0, NULL),
(378, 79, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623046, 'PHP', 0, NULL),
(379, 79, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623046, 'PHP', 0, NULL),
(380, 79, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623046, 'PHP', 0, NULL),
(381, 79, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623046, 'PHP', 0, NULL),
(382, 79, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623046, 'PHP', 0, NULL),
(383, 79, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623046, 'PHP', 0, NULL),
(384, 79, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 498', 1737623046, 'PHP', 0, NULL),
(385, 80, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737623047, 'PHP', 0, NULL),
(386, 80, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737623047, 'PHP', 0, NULL),
(387, 80, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737623047, 'PHP', 0, NULL),
(388, 80, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737623047, 'PHP', 0, NULL),
(389, 80, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623047, 'PHP', 0, NULL),
(390, 80, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623047, 'PHP', 0, NULL),
(391, 80, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623047, 'PHP', 0, NULL),
(392, 80, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623047, 'PHP', 0, NULL),
(393, 80, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623047, 'PHP', 0, NULL),
(394, 80, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623047, 'PHP', 0, NULL),
(395, 80, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623047, 'PHP', 0, NULL),
(396, 80, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623047, 'PHP', 0, NULL),
(397, 80, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623047, 'PHP', 0, NULL),
(398, 80, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623047, 'PHP', 0, NULL),
(399, 80, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623047, 'PHP', 0, NULL),
(400, 80, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 498', 1737623047, 'PHP', 0, NULL),
(401, 81, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:20:\"test-4 : test case 4\";i:1;s:1:\"1\";i:2;s:9:\"test plan\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737623057, 'ASSIGN', 9, 'testplans'),
(402, 81, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 706', 1737623058, 'PHP', 0, NULL),
(403, 81, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 711', 1737623058, 'PHP', 0, NULL),
(404, 81, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 748', 1737623058, 'PHP', 0, NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES
(405, 81, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\specview.php - Line 1172', 1737623058, 'PHP', 0, NULL),
(406, 81, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623058, 'PHP', 0, NULL),
(407, 81, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623058, 'PHP', 0, NULL),
(408, 81, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623058, 'PHP', 0, NULL),
(409, 81, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623058, 'PHP', 0, NULL),
(410, 81, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623058, 'PHP', 0, NULL),
(411, 81, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623058, 'PHP', 0, NULL),
(412, 81, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623058, 'PHP', 0, NULL),
(413, 81, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623058, 'PHP', 0, NULL),
(414, 81, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623058, 'PHP', 0, NULL),
(415, 81, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 476', 1737623058, 'PHP', 0, NULL),
(416, 81, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 481', 1737623058, 'PHP', 0, NULL),
(417, 81, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\556086ed908a3b0ecb0a94dc13594f68cfa25ee5_0.file.planAddTC_m1.tpl.php - Line 493', 1737623059, 'PHP', 0, NULL),
(418, 82, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737623283, 'PHP', 0, NULL),
(419, 83, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737623283, 'PHP', 0, NULL),
(420, 84, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737623284, 'PHP', 0, NULL),
(421, 85, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737623284, 'PHP', 0, NULL),
(422, 86, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737623306, 'PHP', 0, NULL),
(423, 87, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737623419, 'PHP', 0, NULL),
(424, 88, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737623425, 'PHP', 0, NULL),
(425, 89, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737623425, 'PHP', 0, NULL),
(426, 90, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_build_saved\";s:6:\"params\";a:3:{i:0;s:12:\"Test Project\";i:1;s:9:\"test plan\";i:2;s:10:\"test build\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737623447, 'SAVE', 1, 'builds'),
(427, 90, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined property: stdClass::$build - in G:\\xampp\\htdocs\\testlink\\lib\\plan\\buildEdit.php - Line 343', 1737623448, 'PHP', 0, NULL),
(428, 90, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined variable $args - in G:\\xampp\\htdocs\\testlink\\lib\\plan\\buildEdit.php - Line 371', 1737623448, 'PHP', 0, NULL),
(429, 90, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"user\" on null - in G:\\xampp\\htdocs\\testlink\\lib\\plan\\buildEdit.php - Line 371', 1737623448, 'PHP', 0, NULL),
(430, 90, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"locale\" on null - in G:\\xampp\\htdocs\\testlink\\lib\\plan\\buildEdit.php - Line 371', 1737623448, 'PHP', 0, NULL),
(431, 90, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"\" - in G:\\xampp\\htdocs\\testlink\\lib\\plan\\buildEdit.php - Line 371', 1737623448, 'PHP', 0, NULL),
(432, 91, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737624231, 'PHP', 0, NULL),
(433, 92, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737624239, 'PHP', 0, NULL),
(434, 93, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737624273, 'PHP', 0, NULL),
(435, 94, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737624275, 'PHP', 0, NULL),
(436, 95, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737624277, 'PHP', 0, NULL),
(437, 96, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:6:\"test-4\";i:1;s:10:\"test build\";i:2;s:9:\"test plan\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737624283, 'CREATE', 1, 'execution'),
(438, 97, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:6:\"test-4\";i:1;s:10:\"test build\";i:2;s:9:\"test plan\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737626215, 'CREATE', 2, 'execution'),
(439, 98, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\57e3463ad095edc62e37492953664bca0383b85a_0.file.inc_exec_show_tc_exec.tpl.php - Line 242', 1737626229, 'PHP', 0, NULL),
(440, 99, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:6:\"test-2\";i:1;s:10:\"test build\";i:2;s:9:\"test plan\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1737626232, 'CREATE', 3, 'execution'),
(441, 100, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined variable $cf - in G:\\xampp\\htdocs\\testlink\\lib\\testcases\\containerEdit.php - Line 214', 1737631447, 'PHP', 0, NULL),
(442, 101, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737631461, 'PHP', 0, NULL),
(443, 101, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737631461, 'PHP', 0, NULL),
(444, 101, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737631461, 'PHP', 0, NULL),
(445, 101, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"object_name\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737631461, 'PHP', 0, NULL),
(446, 101, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737631462, 'PHP', 0, NULL),
(447, 101, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737631462, 'PHP', 0, NULL),
(448, 101, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737631462, 'PHP', 0, NULL),
(449, 101, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737631462, 'PHP', 0, NULL),
(450, 101, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"op_ok\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737631462, 'PHP', 0, NULL),
(451, 101, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737631462, 'PHP', 0, NULL),
(452, 102, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"title\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 26', 1737634555, 'PHP', 0, NULL),
(453, 102, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 26', 1737634555, 'PHP', 0, NULL),
(454, 102, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 28', 1737634555, 'PHP', 0, NULL),
(455, 102, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 28', 1737634555, 'PHP', 0, NULL),
(456, 102, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634555, 'PHP', 0, NULL),
(457, 102, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634555, 'PHP', 0, NULL),
(458, 102, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634555, 'PHP', 0, NULL),
(459, 102, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"object_name\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634555, 'PHP', 0, NULL),
(460, 102, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634555, 'PHP', 0, NULL),
(461, 102, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634555, 'PHP', 0, NULL),
(462, 102, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634555, 'PHP', 0, NULL),
(463, 102, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634556, 'PHP', 0, NULL),
(464, 102, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"op_ok\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634556, 'PHP', 0, NULL),
(465, 102, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634556, 'PHP', 0, NULL),
(466, 103, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"title\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 26', 1737634577, 'PHP', 0, NULL),
(467, 103, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 26', 1737634577, 'PHP', 0, NULL),
(468, 103, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 28', 1737634577, 'PHP', 0, NULL),
(469, 103, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 28', 1737634578, 'PHP', 0, NULL),
(470, 103, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634578, 'PHP', 0, NULL),
(471, 103, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634578, 'PHP', 0, NULL),
(472, 103, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634578, 'PHP', 0, NULL),
(473, 103, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"object_name\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634578, 'PHP', 0, NULL),
(474, 103, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634578, 'PHP', 0, NULL),
(475, 103, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634578, 'PHP', 0, NULL),
(476, 103, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634578, 'PHP', 0, NULL),
(477, 103, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634578, 'PHP', 0, NULL),
(478, 103, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"op_ok\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634578, 'PHP', 0, NULL),
(479, 103, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634578, 'PHP', 0, NULL),
(480, 104, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634611, 'PHP', 0, NULL),
(481, 104, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634612, 'PHP', 0, NULL),
(482, 104, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634612, 'PHP', 0, NULL),
(483, 104, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634612, 'PHP', 0, NULL),
(484, 104, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634612, 'PHP', 0, NULL),
(485, 104, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"object_name\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634612, 'PHP', 0, NULL),
(486, 104, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634612, 'PHP', 0, NULL),
(487, 104, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634612, 'PHP', 0, NULL),
(488, 104, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634612, 'PHP', 0, NULL),
(489, 104, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634612, 'PHP', 0, NULL),
(490, 104, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"op_ok\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634612, 'PHP', 0, NULL),
(491, 104, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634612, 'PHP', 0, NULL),
(492, 105, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634687, 'PHP', 0, NULL),
(493, 105, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634687, 'PHP', 0, NULL),
(494, 106, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634722, 'PHP', 0, NULL),
(495, 106, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634723, 'PHP', 0, NULL),
(496, 107, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634781, 'PHP', 0, NULL),
(497, 107, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634781, 'PHP', 0, NULL),
(498, 108, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634831, 'PHP', 0, NULL),
(499, 108, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634831, 'PHP', 0, NULL),
(500, 108, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634832, 'PHP', 0, NULL),
(501, 108, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634832, 'PHP', 0, NULL),
(502, 108, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634832, 'PHP', 0, NULL),
(503, 108, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634832, 'PHP', 0, NULL),
(504, 108, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634832, 'PHP', 0, NULL),
(505, 108, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"object_name\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634832, 'PHP', 0, NULL),
(506, 108, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634832, 'PHP', 0, NULL),
(507, 108, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634832, 'PHP', 0, NULL),
(508, 108, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634832, 'PHP', 0, NULL),
(509, 108, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634832, 'PHP', 0, NULL),
(510, 108, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"op_ok\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634832, 'PHP', 0, NULL),
(511, 108, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634833, 'PHP', 0, NULL),
(512, 109, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634833, 'PHP', 0, NULL),
(513, 109, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634833, 'PHP', 0, NULL),
(514, 109, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634833, 'PHP', 0, NULL),
(515, 109, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634833, 'PHP', 0, NULL),
(516, 109, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634833, 'PHP', 0, NULL),
(517, 109, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634833, 'PHP', 0, NULL),
(518, 109, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634833, 'PHP', 0, NULL),
(519, 109, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"object_name\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634833, 'PHP', 0, NULL),
(520, 109, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634833, 'PHP', 0, NULL),
(521, 109, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634833, 'PHP', 0, NULL),
(522, 109, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634833, 'PHP', 0, NULL),
(523, 109, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634833, 'PHP', 0, NULL),
(524, 109, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"op_ok\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634833, 'PHP', 0, NULL),
(525, 109, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634834, 'PHP', 0, NULL),
(526, 110, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634834, 'PHP', 0, NULL),
(527, 110, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634834, 'PHP', 0, NULL),
(528, 110, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634834, 'PHP', 0, NULL),
(529, 110, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634834, 'PHP', 0, NULL),
(530, 110, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634834, 'PHP', 0, NULL),
(531, 110, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634834, 'PHP', 0, NULL),
(532, 110, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634834, 'PHP', 0, NULL),
(533, 110, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"object_name\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634835, 'PHP', 0, NULL),
(534, 110, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634835, 'PHP', 0, NULL),
(535, 110, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634835, 'PHP', 0, NULL),
(536, 110, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634835, 'PHP', 0, NULL),
(537, 110, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634835, 'PHP', 0, NULL),
(538, 110, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"op_ok\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634835, 'PHP', 0, NULL),
(539, 110, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634835, 'PHP', 0, NULL),
(540, 111, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634835, 'PHP', 0, NULL),
(541, 111, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634835, 'PHP', 0, NULL),
(542, 111, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634835, 'PHP', 0, NULL),
(543, 111, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634835, 'PHP', 0, NULL),
(544, 111, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634835, 'PHP', 0, NULL),
(545, 111, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634835, 'PHP', 0, NULL),
(546, 111, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634836, 'PHP', 0, NULL),
(547, 111, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"object_name\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634836, 'PHP', 0, NULL),
(548, 111, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634836, 'PHP', 0, NULL),
(549, 111, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634836, 'PHP', 0, NULL),
(550, 111, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634836, 'PHP', 0, NULL),
(551, 111, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634836, 'PHP', 0, NULL),
(552, 111, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"op_ok\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634836, 'PHP', 0, NULL),
(553, 111, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634836, 'PHP', 0, NULL),
(554, 112, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634836, 'PHP', 0, NULL),
(555, 112, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634837, 'PHP', 0, NULL),
(556, 112, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634837, 'PHP', 0, NULL),
(557, 112, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634837, 'PHP', 0, NULL),
(558, 112, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634837, 'PHP', 0, NULL),
(559, 112, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634837, 'PHP', 0, NULL),
(560, 112, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634837, 'PHP', 0, NULL),
(561, 112, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"object_name\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634837, 'PHP', 0, NULL),
(562, 112, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634837, 'PHP', 0, NULL),
(563, 112, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634837, 'PHP', 0, NULL),
(564, 112, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634837, 'PHP', 0, NULL),
(565, 112, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634837, 'PHP', 0, NULL),
(566, 112, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"op_ok\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634837, 'PHP', 0, NULL),
(567, 112, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634837, 'PHP', 0, NULL),
(568, 113, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634837, 'PHP', 0, NULL),
(569, 113, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634838, 'PHP', 0, NULL),
(570, 113, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634838, 'PHP', 0, NULL),
(571, 113, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634838, 'PHP', 0, NULL),
(572, 113, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634838, 'PHP', 0, NULL),
(573, 113, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634838, 'PHP', 0, NULL),
(574, 113, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634838, 'PHP', 0, NULL),
(575, 113, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"object_name\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634838, 'PHP', 0, NULL),
(576, 113, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634838, 'PHP', 0, NULL),
(577, 113, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634838, 'PHP', 0, NULL),
(578, 113, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634838, 'PHP', 0, NULL),
(579, 113, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634838, 'PHP', 0, NULL),
(580, 113, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"op_ok\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634838, 'PHP', 0, NULL),
(581, 113, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634838, 'PHP', 0, NULL),
(582, 114, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634838, 'PHP', 0, NULL),
(583, 114, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634838, 'PHP', 0, NULL),
(584, 114, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634839, 'PHP', 0, NULL),
(585, 114, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634839, 'PHP', 0, NULL),
(586, 114, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634839, 'PHP', 0, NULL),
(587, 114, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634839, 'PHP', 0, NULL),
(588, 114, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634839, 'PHP', 0, NULL),
(589, 114, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"object_name\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634839, 'PHP', 0, NULL),
(590, 114, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634839, 'PHP', 0, NULL),
(591, 114, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634839, 'PHP', 0, NULL),
(592, 114, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634839, 'PHP', 0, NULL),
(593, 114, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634839, 'PHP', 0, NULL),
(594, 114, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"op_ok\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634839, 'PHP', 0, NULL),
(595, 114, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634839, 'PHP', 0, NULL),
(596, 115, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634839, 'PHP', 0, NULL),
(597, 115, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634840, 'PHP', 0, NULL),
(598, 115, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634840, 'PHP', 0, NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES
(599, 115, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634840, 'PHP', 0, NULL),
(600, 115, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634840, 'PHP', 0, NULL),
(601, 115, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634840, 'PHP', 0, NULL),
(602, 115, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634840, 'PHP', 0, NULL),
(603, 115, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"object_name\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634840, 'PHP', 0, NULL),
(604, 115, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634840, 'PHP', 0, NULL),
(605, 115, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634840, 'PHP', 0, NULL),
(606, 115, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634840, 'PHP', 0, NULL),
(607, 115, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634840, 'PHP', 0, NULL),
(608, 115, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"op_ok\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634840, 'PHP', 0, NULL),
(609, 115, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634840, 'PHP', 0, NULL),
(610, 116, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634888, 'PHP', 0, NULL),
(611, 116, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634888, 'PHP', 0, NULL),
(612, 116, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634888, 'PHP', 0, NULL),
(613, 116, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634888, 'PHP', 0, NULL),
(614, 116, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634888, 'PHP', 0, NULL),
(615, 116, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634889, 'PHP', 0, NULL),
(616, 116, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 56', 1737634889, 'PHP', 0, NULL),
(617, 116, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"object_name\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634889, 'PHP', 0, NULL),
(618, 116, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 92', 1737634889, 'PHP', 0, NULL),
(619, 116, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"gui\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634889, 'PHP', 0, NULL),
(620, 116, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634889, 'PHP', 0, NULL),
(621, 116, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"testCasesTableView\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 96', 1737634889, 'PHP', 0, NULL),
(622, 116, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"op_ok\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634889, 'PHP', 0, NULL),
(623, 116, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\77302802c57f9721441a71d9cc624f76debccd59_0.file.containerMoveTC.tpl.php - Line 101', 1737634889, 'PHP', 0, NULL),
(624, 117, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634910, 'PHP', 0, NULL),
(625, 117, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634910, 'PHP', 0, NULL),
(626, 117, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nUndefined array key \"content\" - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634910, 'PHP', 0, NULL),
(627, 117, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nAttempt to read property \"value\" on null - in G:\\xampp\\htdocs\\testlink\\gui\\templates_c\\1c5c686317c03a26aa71b908c42d76f0d89798f5_0.file.tcSort.tpl.php - Line 27', 1737634910, 'PHP', 0, NULL),
(628, 118, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testproject.class.php - Line 402', 1737642450, 'PHP', 0, NULL),
(629, 118, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\testcases\\containerEdit.php - Line 552', 1737642450, 'PHP', 0, NULL),
(630, 119, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testproject.class.php - Line 402', 1737642460, 'PHP', 0, NULL),
(631, 119, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\testcases\\containerEdit.php - Line 552', 1737642460, 'PHP', 0, NULL),
(632, 120, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testproject.class.php - Line 402', 1737642502, 'PHP', 0, NULL),
(633, 120, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\testcases\\containerEdit.php - Line 552', 1737642502, 'PHP', 0, NULL),
(634, 121, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testproject.class.php - Line 402', 1737642543, 'PHP', 0, NULL),
(635, 121, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\testcases\\containerEdit.php - Line 552', 1737642543, 'PHP', 0, NULL),
(636, 122, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testproject.class.php - Line 402', 1737643041, 'PHP', 0, NULL),
(637, 122, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\testcases\\containerEdit.php - Line 552', 1737643041, 'PHP', 0, NULL),
(638, 123, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testproject.class.php - Line 402', 1737643091, 'PHP', 0, NULL),
(639, 123, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\testcases\\containerEdit.php - Line 552', 1737643092, 'PHP', 0, NULL),
(640, 124, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\functions\\testproject.class.php - Line 402', 1737643155, 'PHP', 0, NULL),
(641, 124, 2, 'GUI - Test Project ID : 1', 'E_WARNING\nTrying to access array offset on value of type null - in G:\\xampp\\htdocs\\testlink\\lib\\testcases\\containerEdit.php - Line 552', 1737643155, 'PHP', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `executions`
--

CREATE TABLE `executions` (
  `id` int(10) UNSIGNED NOT NULL,
  `build_id` int(10) NOT NULL DEFAULT 0,
  `tester_id` int(10) UNSIGNED DEFAULT NULL,
  `execution_ts` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `testplan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tcversion_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tcversion_number` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `platform_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated',
  `execution_duration` decimal(6,2) DEFAULT NULL COMMENT 'NULL will be considered as NO DATA Provided by user',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `executions`
--

INSERT INTO `executions` (`id`, `build_id`, `tester_id`, `execution_ts`, `status`, `testplan_id`, `tcversion_id`, `tcversion_number`, `platform_id`, `execution_type`, `execution_duration`, `notes`) VALUES
(1, 1, 1, '2025-01-23 10:24:43', 'p', 9, 12, 1, 0, 1, NULL, ''),
(2, 1, 1, '2025-01-23 10:56:55', 'b', 9, 12, 1, 0, 1, NULL, ''),
(3, 1, 1, '2025-01-23 10:57:12', 'p', 9, 6, 1, 0, 1, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `execution_bugs`
--

CREATE TABLE `execution_bugs` (
  `execution_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bug_id` varchar(64) NOT NULL DEFAULT '0',
  `tcstep_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `execution_tcsteps`
--

CREATE TABLE `execution_tcsteps` (
  `id` int(10) UNSIGNED NOT NULL,
  `execution_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tcstep_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `status` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `execution_tcsteps_wip`
--

CREATE TABLE `execution_tcsteps_wip` (
  `id` int(10) UNSIGNED NOT NULL,
  `tcstep_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `testplan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `platform_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `build_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tester_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL,
  `status` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `exec_by_date_time`
-- (See below for the actual view)
--
CREATE TABLE `exec_by_date_time` (
`testplan_name` varchar(100)
,`yyyy_mm_dd` varchar(10)
,`yyyy_mm` varchar(7)
,`hh` varchar(7)
,`hour` varchar(7)
,`id` int(10) unsigned
,`build_id` int(10)
,`tester_id` int(10) unsigned
,`execution_ts` datetime
,`status` char(1)
,`testplan_id` int(10) unsigned
,`tcversion_id` int(10) unsigned
,`tcversion_number` smallint(5) unsigned
,`platform_id` int(10) unsigned
,`execution_type` tinyint(1)
,`execution_duration` decimal(6,2)
,`notes` text
);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(10) UNSIGNED NOT NULL,
  `testproject_id` int(10) UNSIGNED NOT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `ipaddress` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modification_ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issuetrackers`
--

CREATE TABLE `issuetrackers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `testproject_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_exec_by_context`
-- (See below for the actual view)
--
CREATE TABLE `latest_exec_by_context` (
`tcversion_id` int(10) unsigned
,`testplan_id` int(10) unsigned
,`build_id` int(10)
,`platform_id` int(10) unsigned
,`id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_exec_by_testplan`
-- (See below for the actual view)
--
CREATE TABLE `latest_exec_by_testplan` (
`tcversion_id` int(10) unsigned
,`testplan_id` int(10) unsigned
,`id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_exec_by_testplan_plat`
-- (See below for the actual view)
--
CREATE TABLE `latest_exec_by_testplan_plat` (
`tcversion_id` int(10) unsigned
,`testplan_id` int(10) unsigned
,`platform_id` int(10) unsigned
,`id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_req_version`
-- (See below for the actual view)
--
CREATE TABLE `latest_req_version` (
`req_id` int(10) unsigned
,`version` smallint(5) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_req_version_id`
-- (See below for the actual view)
--
CREATE TABLE `latest_req_version_id` (
`req_id` int(10) unsigned
,`version` smallint(5) unsigned
,`req_version_id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_rspec_revision`
-- (See below for the actual view)
--
CREATE TABLE `latest_rspec_revision` (
`req_spec_id` int(10) unsigned
,`testproject_id` int(10) unsigned
,`revision` smallint(5) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_tcase_version_id`
-- (See below for the actual view)
--
CREATE TABLE `latest_tcase_version_id` (
`testcase_id` int(10) unsigned
,`version` smallint(5) unsigned
,`tcversion_id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_tcase_version_number`
-- (See below for the actual view)
--
CREATE TABLE `latest_tcase_version_number` (
`testcase_id` int(10) unsigned
,`version` smallint(5) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `id` int(10) UNSIGNED NOT NULL,
  `testplan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `target_date` date NOT NULL,
  `start_date` date DEFAULT NULL,
  `a` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `b` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `c` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT 'undefined'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nodes_hierarchy`
--

CREATE TABLE `nodes_hierarchy` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `node_type_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `node_order` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `nodes_hierarchy`
--

INSERT INTO `nodes_hierarchy` (`id`, `name`, `parent_id`, `node_type_id`, `node_order`) VALUES
(1, 'Test Project', NULL, 1, 1),
(2, 'Suite Test', 1, 2, 1),
(3, 'test case 1', 2, 3, 1000),
(4, '', 3, 4, 0),
(5, 'test case 2', 2, 3, 1001),
(6, '', 5, 4, 0),
(7, 'test case 3', 2, 3, 1002),
(8, '', 7, 4, 0),
(9, 'test plan', 1, 5, 0),
(10, 'test plan 2', 1, 5, 0),
(11, 'test case 4', 2, 3, 1003),
(12, '', 11, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_types`
--

CREATE TABLE `node_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT 'testproject'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `node_types`
--

INSERT INTO `node_types` (`id`, `description`) VALUES
(1, 'testproject'),
(2, 'testsuite'),
(3, 'testcase'),
(4, 'testcase_version'),
(5, 'testplan'),
(6, 'requirement_spec'),
(7, 'requirement'),
(8, 'requirement_version'),
(9, 'testcase_step'),
(10, 'requirement_revision'),
(11, 'requirement_spec_revision'),
(12, 'build'),
(13, 'platform'),
(14, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `object_keywords`
--

CREATE TABLE `object_keywords` (
  `id` int(10) UNSIGNED NOT NULL,
  `fk_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fk_table` varchar(30) DEFAULT '',
  `keyword_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `platforms`
--

CREATE TABLE `platforms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `testproject_id` int(10) UNSIGNED NOT NULL,
  `notes` text NOT NULL,
  `enable_on_design` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `enable_on_execution` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `is_open` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `basename` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugins_configuration`
--

CREATE TABLE `plugins_configuration` (
  `id` int(11) NOT NULL,
  `testproject_id` int(11) NOT NULL,
  `config_key` varchar(255) NOT NULL,
  `config_type` int(11) NOT NULL,
  `config_value` varchar(255) NOT NULL,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reqmgrsystems`
--

CREATE TABLE `reqmgrsystems` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requirements`
--

CREATE TABLE `requirements` (
  `id` int(10) UNSIGNED NOT NULL,
  `srs_id` int(10) UNSIGNED NOT NULL,
  `req_doc_id` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `req_coverage`
--

CREATE TABLE `req_coverage` (
  `id` int(10) UNSIGNED NOT NULL,
  `req_id` int(10) NOT NULL,
  `req_version_id` int(10) NOT NULL,
  `testcase_id` int(10) NOT NULL,
  `tcversion_id` int(10) NOT NULL,
  `link_status` int(11) NOT NULL DEFAULT 1,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `review_requester_id` int(10) UNSIGNED DEFAULT NULL,
  `review_request_ts` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='relation test case version ** requirement version';

-- --------------------------------------------------------

--
-- Table structure for table `req_monitor`
--

CREATE TABLE `req_monitor` (
  `req_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `testproject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `req_relations`
--

CREATE TABLE `req_relations` (
  `id` int(10) UNSIGNED NOT NULL,
  `source_id` int(10) UNSIGNED NOT NULL,
  `destination_id` int(10) UNSIGNED NOT NULL,
  `relation_type` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `req_revisions`
--

CREATE TABLE `req_revisions` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `revision` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `req_doc_id` varchar(64) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `scope` text DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'V',
  `type` char(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `expected_coverage` int(10) NOT NULL DEFAULT 1,
  `log_message` text DEFAULT NULL,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) UNSIGNED DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `req_specs`
--

CREATE TABLE `req_specs` (
  `id` int(10) UNSIGNED NOT NULL,
  `testproject_id` int(10) UNSIGNED NOT NULL,
  `doc_id` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Dev. Documents (e.g. System Requirements Specification)';

-- --------------------------------------------------------

--
-- Table structure for table `req_specs_revisions`
--

CREATE TABLE `req_specs_revisions` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `revision` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `doc_id` varchar(64) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `scope` text DEFAULT NULL,
  `total_req` int(10) NOT NULL DEFAULT 0,
  `status` int(10) UNSIGNED DEFAULT 1,
  `type` char(1) DEFAULT NULL,
  `log_message` text DEFAULT NULL,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) UNSIGNED DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `req_versions`
--

CREATE TABLE `req_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `revision` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `scope` text DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'V',
  `type` char(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `expected_coverage` int(10) NOT NULL DEFAULT 1,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) UNSIGNED DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  `log_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rights`
--

CREATE TABLE `rights` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rights`
--

INSERT INTO `rights` (`id`, `description`) VALUES
(53, 'cfield_assignment'),
(18, 'cfield_management'),
(17, 'cfield_view'),
(51, 'codetracker_management'),
(52, 'codetracker_view'),
(56, 'delete_frozen_tcversion'),
(22, 'events_mgt'),
(54, 'exec_assign_testcases'),
(36, 'exec_delete'),
(35, 'exec_edit_notes'),
(49, 'exec_ro_access'),
(41, 'exec_testcases_assigned_to_me'),
(31, 'issuetracker_management'),
(32, 'issuetracker_view'),
(29, 'keyword_assignment'),
(9, 'mgt_modify_key'),
(12, 'mgt_modify_product'),
(11, 'mgt_modify_req'),
(7, 'mgt_modify_tc'),
(48, 'mgt_plugins'),
(16, 'mgt_testplan_create'),
(30, 'mgt_unfreeze_req'),
(13, 'mgt_users'),
(20, 'mgt_view_events'),
(8, 'mgt_view_key'),
(10, 'mgt_view_req'),
(6, 'mgt_view_tc'),
(21, 'mgt_view_usergroups'),
(50, 'monitor_requirement'),
(24, 'platform_management'),
(25, 'platform_view'),
(26, 'project_inventory_management'),
(27, 'project_inventory_view'),
(33, 'reqmgrsystem_management'),
(34, 'reqmgrsystem_view'),
(28, 'req_tcase_link_management'),
(14, 'role_management'),
(19, 'system_configuration'),
(47, 'testcase_freeze'),
(43, 'testplan_add_remove_platforms'),
(2, 'testplan_create_build'),
(1, 'testplan_execute'),
(3, 'testplan_metrics'),
(40, 'testplan_milestone_overview'),
(4, 'testplan_planning'),
(45, 'testplan_set_urgent_testcases'),
(46, 'testplan_show_testcases_newest_versions'),
(37, 'testplan_unlink_executed_testcases'),
(44, 'testplan_update_linked_testcase_versions'),
(5, 'testplan_user_role_assignment'),
(55, 'testproject_add_remove_keywords_executed_tcversions'),
(38, 'testproject_delete_executed_testcases'),
(39, 'testproject_edit_executed_testcases'),
(42, 'testproject_metrics_dashboard'),
(23, 'testproject_user_role_assignment'),
(15, 'user_role_assignment');

-- --------------------------------------------------------

--
-- Table structure for table `risk_assignments`
--

CREATE TABLE `risk_assignments` (
  `id` int(10) UNSIGNED NOT NULL,
  `testplan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `node_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `risk` char(1) NOT NULL DEFAULT '2',
  `importance` char(1) NOT NULL DEFAULT 'M'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `description`, `notes`) VALUES
(1, '<reserved system role 1>', NULL),
(2, '<reserved system role 2>', NULL),
(3, '<no rights>', NULL),
(4, 'test designer', NULL),
(5, 'guest', NULL),
(6, 'senior tester', NULL),
(7, 'tester', NULL),
(8, 'admin', NULL),
(9, 'leader', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_rights`
--

CREATE TABLE `role_rights` (
  `role_id` int(10) NOT NULL DEFAULT 0,
  `right_id` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `role_rights`
--

INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES
(4, 3),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 28),
(4, 29),
(4, 30),
(4, 50),
(5, 3),
(5, 6),
(5, 8),
(6, 1),
(6, 2),
(6, 3),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 11),
(6, 25),
(6, 27),
(6, 28),
(6, 29),
(6, 30),
(6, 50),
(7, 1),
(7, 3),
(7, 6),
(7, 8),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(8, 13),
(8, 14),
(8, 15),
(8, 16),
(8, 17),
(8, 18),
(8, 19),
(8, 20),
(8, 21),
(8, 22),
(8, 23),
(8, 24),
(8, 25),
(8, 26),
(8, 27),
(8, 28),
(8, 29),
(8, 30),
(8, 31),
(8, 32),
(8, 33),
(8, 34),
(8, 35),
(8, 36),
(8, 37),
(8, 38),
(8, 39),
(8, 40),
(8, 41),
(8, 42),
(8, 43),
(8, 44),
(8, 45),
(8, 46),
(8, 47),
(8, 48),
(8, 50),
(8, 51),
(8, 52),
(8, 53),
(8, 54),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(9, 8),
(9, 9),
(9, 10),
(9, 11),
(9, 15),
(9, 16),
(9, 24),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 47),
(9, 50);

-- --------------------------------------------------------

--
-- Table structure for table `tcsteps`
--

CREATE TABLE `tcsteps` (
  `id` int(10) UNSIGNED NOT NULL,
  `step_number` int(11) NOT NULL DEFAULT 1,
  `actions` text DEFAULT NULL,
  `expected_results` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tcversions`
--

CREATE TABLE `tcversions` (
  `id` int(10) UNSIGNED NOT NULL,
  `tc_external_id` int(10) UNSIGNED DEFAULT NULL,
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `layout` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `summary` text DEFAULT NULL,
  `preconditions` text DEFAULT NULL,
  `importance` smallint(5) UNSIGNED NOT NULL DEFAULT 2,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updater_id` int(10) UNSIGNED DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated',
  `estimated_exec_duration` decimal(6,2) DEFAULT NULL COMMENT 'NULL will be considered as NO DATA Provided by user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tcversions`
--

INSERT INTO `tcversions` (`id`, `tc_external_id`, `version`, `layout`, `status`, `summary`, `preconditions`, `importance`, `author_id`, `creation_ts`, `updater_id`, `modification_ts`, `active`, `is_open`, `execution_type`, `estimated_exec_duration`) VALUES
(4, 1, 1, 1, 1, '', '', 3, 1, '2025-01-23 05:15:00', NULL, '2025-01-22 12:15:00', 1, 1, 1, NULL),
(6, 2, 1, 1, 1, '', '', 1, 1, '2025-01-23 05:19:00', NULL, '2025-01-22 12:19:00', 1, 1, 1, NULL),
(8, 3, 1, 1, 1, '', '', 3, 1, '2025-01-23 05:19:14', 1, '2025-01-23 17:29:09', 1, 1, 1, NULL),
(12, 4, 1, 1, 1, '', '<p>test case 4</p>\r\n', 2, 1, '2025-01-23 18:01:19', 1, '2025-01-23 10:01:31', 1, 1, 2, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tcversions_without_keywords`
-- (See below for the actual view)
--
CREATE TABLE `tcversions_without_keywords` (
`testcase_id` int(10) unsigned
,`id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tcversions_without_platforms`
-- (See below for the actual view)
--
CREATE TABLE `tcversions_without_platforms` (
`testcase_id` int(10) unsigned
,`id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `testcase_keywords`
--

CREATE TABLE `testcase_keywords` (
  `id` int(10) UNSIGNED NOT NULL,
  `testcase_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tcversion_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `keyword_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testcase_platforms`
--

CREATE TABLE `testcase_platforms` (
  `id` int(10) UNSIGNED NOT NULL,
  `testcase_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tcversion_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `platform_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testcase_relations`
--

CREATE TABLE `testcase_relations` (
  `id` int(10) UNSIGNED NOT NULL,
  `source_id` int(10) UNSIGNED NOT NULL,
  `destination_id` int(10) UNSIGNED NOT NULL,
  `link_status` tinyint(1) NOT NULL DEFAULT 1,
  `relation_type` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testcase_script_links`
--

CREATE TABLE `testcase_script_links` (
  `tcversion_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `project_key` varchar(64) NOT NULL,
  `repository_name` varchar(64) NOT NULL,
  `code_path` varchar(255) NOT NULL,
  `branch_name` varchar(64) DEFAULT NULL,
  `commit_id` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testplans`
--

CREATE TABLE `testplans` (
  `id` int(10) UNSIGNED NOT NULL,
  `testproject_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `api_key` varchar(64) NOT NULL DEFAULT '829a2ded3ed0829a2dedd8ab81dfa2c77e8235bc3ed0d8ab81dfa2c77e8235bc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `testplans`
--

INSERT INTO `testplans` (`id`, `testproject_id`, `notes`, `active`, `is_open`, `is_public`, `api_key`) VALUES
(9, 1, '<p>test plan</p>', 1, 1, 1, 'fda6975f2c3bd381ace6cd9423813bad7a515899978fb4cfdaa5791d7205a59a'),
(10, 1, '<p>test plan 2</p>', 1, 1, 0, 'b3b00e73558a173a27fb18a56f3bf8db208b03cfcb321b240dab80434038272d');

-- --------------------------------------------------------

--
-- Table structure for table `testplan_platforms`
--

CREATE TABLE `testplan_platforms` (
  `id` int(10) UNSIGNED NOT NULL,
  `testplan_id` int(10) UNSIGNED NOT NULL,
  `platform_id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Connects a testplan with platforms';

-- --------------------------------------------------------

--
-- Table structure for table `testplan_tcversions`
--

CREATE TABLE `testplan_tcversions` (
  `id` int(10) UNSIGNED NOT NULL,
  `testplan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tcversion_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `node_order` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `urgency` smallint(5) NOT NULL DEFAULT 2,
  `platform_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `testplan_tcversions`
--

INSERT INTO `testplan_tcversions` (`id`, `testplan_id`, `tcversion_id`, `node_order`, `urgency`, `platform_id`, `author_id`, `creation_ts`) VALUES
(1, 9, 4, 10000, 2, 0, 1, '2025-01-23 17:40:51'),
(2, 9, 6, 10010, 2, 0, 1, '2025-01-23 17:40:51'),
(3, 9, 8, 10020, 2, 0, 1, '2025-01-23 17:40:51'),
(4, 9, 12, 10030, 2, 0, 1, '2025-01-23 18:04:17');

-- --------------------------------------------------------

--
-- Table structure for table `testprojects`
--

CREATE TABLE `testprojects` (
  `id` int(10) UNSIGNED NOT NULL,
  `notes` text DEFAULT NULL,
  `color` varchar(12) NOT NULL DEFAULT '#9BD',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `option_reqs` tinyint(1) NOT NULL DEFAULT 0,
  `option_priority` tinyint(1) NOT NULL DEFAULT 0,
  `option_automation` tinyint(1) NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL,
  `prefix` varchar(16) NOT NULL,
  `tc_counter` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `issue_tracker_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `code_tracker_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `reqmgr_integration_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `api_key` varchar(64) NOT NULL DEFAULT '0d8ab81dfa2c77e8235bc829a2ded3edfa2c78235bc829a27eded3ed0d8ab81d'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `testprojects`
--

INSERT INTO `testprojects` (`id`, `notes`, `color`, `active`, `option_reqs`, `option_priority`, `option_automation`, `options`, `prefix`, `tc_counter`, `is_public`, `issue_tracker_enabled`, `code_tracker_enabled`, `reqmgr_integration_enabled`, `api_key`) VALUES
(1, '<p>Test Project</p>', '', 1, 0, 0, 0, 'O:8:\"stdClass\":4:{s:19:\"requirementsEnabled\";i:1;s:19:\"testPriorityEnabled\";i:1;s:17:\"automationEnabled\";i:1;s:16:\"inventoryEnabled\";i:1;}', 'test', 4, 1, 0, 0, 0, 'f67918e6908c33ae5c3539f3cc3fda485d50501b16fac43eebda1e90d3bdaf38');

-- --------------------------------------------------------

--
-- Table structure for table `testproject_codetracker`
--

CREATE TABLE `testproject_codetracker` (
  `testproject_id` int(10) UNSIGNED NOT NULL,
  `codetracker_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testproject_issuetracker`
--

CREATE TABLE `testproject_issuetracker` (
  `testproject_id` int(10) UNSIGNED NOT NULL,
  `issuetracker_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testproject_reqmgrsystem`
--

CREATE TABLE `testproject_reqmgrsystem` (
  `testproject_id` int(10) UNSIGNED NOT NULL,
  `reqmgrsystem_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testsuites`
--

CREATE TABLE `testsuites` (
  `id` int(10) UNSIGNED NOT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `testsuites`
--

INSERT INTO `testsuites` (`id`, `details`) VALUES
(2, '');

-- --------------------------------------------------------

--
-- Table structure for table `text_templates`
--

CREATE TABLE `text_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `template_data` text DEFAULT NULL,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_public` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Global Project Templates';

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_point` varchar(45) NOT NULL DEFAULT '',
  `start_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `end_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `session_id` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES
(1, '/testlink/login.php', 1737576756, 1737576756, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(2, '/testlink/lib/project/projectEdit.php', 1737576803, 1737576805, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(3, '/testlink/lib/testcases/tcEdit.php', 1737576879, 1737576880, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(4, '/testlink/lib/testcases/tcEdit.php', 1737576899, 1737576905, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(5, '/testlink/lib/testcases/tcEdit.php', 1737577126, 1737577127, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(6, '/testlink/lib/testcases/tcEdit.php', 1737577139, 1737577140, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(7, '/testlink/lib/testcases/tcEdit.php', 1737577147, 1737577148, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(8, '/testlink/lib/testcases/tcEdit.php', 1737577154, 1737577155, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(9, '/testlink/logout.php', 1737579496, 1737579496, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(10, '/testlink/login.php', 1737579501, 1737579501, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(11, '/testlink/login.php', 1737579623, 1737579623, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(12, '/testlink/lib/usermanagement/usersAssign.php', 1737579696, 1737579697, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(13, '/testlink/lib/usermanagement/usersAssign.php', 1737579697, 1737579698, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(14, '/testlink/lib/usermanagement/usersAssign.php', 1737579718, 1737579719, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(15, '/testlink/lib/usermanagement/usersAssign.php', 1737579720, 1737579721, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(16, '/testlink/lib/plan/planEdit.php', 1737619481, 1737619481, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(17, '/testlink/lib/plan/planEdit.php', 1737619513, 1737619514, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(18, '/testlink/lib/plan/buildView.php', 1737619539, 1737619540, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(19, '/testlink/lib/plan/buildEdit.php', 1737619581, 1737619582, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(20, '/testlink/lib/project/projectView.php', 1737619907, 1737619907, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(21, '/testlink/lib/plan/planEdit.php', 1737619916, 1737619916, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(22, '/testlink/lib/testcases/tcAssign2Tplan.php', 1737620109, 1737620109, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(23, '/testlink/lib/testcases/tcAssign2Tplan.php', 1737620162, 1737620162, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(24, '/testlink/lib/testcases/tcAssign2Tplan.php', 1737620182, 1737620182, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(25, '/testlink/lib/testcases/tcAssign2Tplan.php', 1737620302, 1737620303, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(26, '/testlink/lib/testcases/tcAssign2Tplan.php', 1737620491, 1737620491, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(27, '/testlink/lib/plan/planEdit.php', 1737620835, 1737620835, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(28, '/testlink/lib/plan/planEdit.php', 1737620860, 1737620860, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(29, '/testlink/lib/testcases/tcAssign2Tplan.php', 1737620885, 1737620885, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(30, '/testlink/lib/plan/planEdit.php', 1737620972, 1737620972, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(31, '/testlink/lib/testcases/tcAssign2Tplan.php', 1737621112, 1737621113, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(32, '/testlink/lib/plan/planAddTC.php', 1737621277, 1737621279, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(33, '/testlink/lib/plan/planAddTC.php', 1737621280, 1737621280, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(34, '/testlink/lib/plan/planAddTC.php', 1737621280, 1737621280, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(35, '/testlink/lib/plan/planAddTC.php', 1737621281, 1737621281, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(36, '/testlink/lib/plan/planAddTC.php', 1737621281, 1737621281, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(37, '/testlink/lib/plan/planAddTC.php', 1737621282, 1737621282, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(38, '/testlink/lib/plan/planAddTC.php', 1737621282, 1737621283, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(39, '/testlink/lib/testcases/tcAssign2Tplan.php', 1737621404, 1737621404, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(40, '/testlink/lib/plan/planAddTC.php', 1737621625, 1737621626, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(41, '/testlink/lib/plan/planAddTC.php', 1737621626, 1737621626, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(42, '/testlink/lib/plan/planAddTC.php', 1737621651, 1737621653, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(43, '/testlink/lib/execute/execSetResults.php', 1737621692, 1737621695, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(44, '/testlink/lib/execute/execSetResults.php', 1737621695, 1737621695, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(45, '/testlink/lib/execute/execSetResults.php', 1737621696, 1737621696, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(46, '/testlink/lib/execute/execSetResults.php', 1737621696, 1737621696, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(47, '/testlink/lib/execute/execSetResults.php', 1737621697, 1737621697, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(48, '/testlink/lib/execute/execSetResults.php', 1737621698, 1737621698, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(49, '/testlink/lib/execute/execSetResults.php', 1737621698, 1737621698, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(50, '/testlink/lib/execute/execSetResults.php', 1737621699, 1737621699, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(51, '/testlink/lib/execute/execSetResults.php', 1737621699, 1737621700, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(52, '/testlink/lib/execute/execSetResults.php', 1737621705, 1737621705, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(53, '/testlink/lib/execute/execSetResults.php', 1737622136, 1737622136, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(54, '/testlink/lib/execute/execSetResults.php', 1737622139, 1737622139, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(55, '/testlink/lib/execute/execSetResults.php', 1737622139, 1737622139, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(56, '/testlink/lib/execute/execSetResults.php', 1737622140, 1737622140, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(57, '/testlink/lib/execute/execSetResults.php', 1737622140, 1737622140, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(58, '/testlink/lib/execute/execSetResults.php', 1737622144, 1737622144, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(59, '/testlink/lib/execute/execSetResults.php', 1737622145, 1737622146, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(60, '/testlink/lib/execute/execSetResults.php', 1737622146, 1737622146, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(61, '/testlink/lib/execute/execSetResults.php', 1737622147, 1737622148, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(62, '/testlink/lib/execute/execSetResults.php', 1737622148, 1737622148, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(63, '/testlink/lib/execute/execSetResults.php', 1737622152, 1737622152, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(64, '/testlink/lib/execute/execSetResults.php', 1737622224, 1737622225, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(65, '/testlink/lib/execute/execSetResults.php', 1737622225, 1737622225, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(66, '/testlink/lib/testcases/tcEdit.php', 1737622252, 1737622253, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(67, '/testlink/lib/testcases/tcEdit.php', 1737622879, 1737622880, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(68, '/testlink/lib/plan/planAddTC.php', 1737623029, 1737623030, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(69, '/testlink/lib/plan/planAddTC.php', 1737623030, 1737623031, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(70, '/testlink/lib/plan/planAddTC.php', 1737623032, 1737623032, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(71, '/testlink/lib/plan/planAddTC.php', 1737623033, 1737623034, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(72, '/testlink/lib/plan/planAddTC.php', 1737623034, 1737623035, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(73, '/testlink/lib/plan/planAddTC.php', 1737623035, 1737623037, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(74, '/testlink/lib/plan/planAddTC.php', 1737623037, 1737623038, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(75, '/testlink/lib/plan/planAddTC.php', 1737623038, 1737623039, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(76, '/testlink/lib/plan/planAddTC.php', 1737623040, 1737623041, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(77, '/testlink/lib/plan/planAddTC.php', 1737623041, 1737623042, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(78, '/testlink/lib/plan/planAddTC.php', 1737623043, 1737623043, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(79, '/testlink/lib/plan/planAddTC.php', 1737623045, 1737623046, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(80, '/testlink/lib/plan/planAddTC.php', 1737623047, 1737623047, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(81, '/testlink/lib/plan/planAddTC.php', 1737623057, 1737623059, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(82, '/testlink/lib/execute/execSetResults.php', 1737623283, 1737623283, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(83, '/testlink/lib/execute/execSetResults.php', 1737623283, 1737623283, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(84, '/testlink/lib/execute/execSetResults.php', 1737623284, 1737623284, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(85, '/testlink/lib/execute/execSetResults.php', 1737623284, 1737623284, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(86, '/testlink/lib/execute/execSetResults.php', 1737623306, 1737623306, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(87, '/testlink/lib/execute/execSetResults.php', 1737623419, 1737623419, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(88, '/testlink/lib/execute/execSetResults.php', 1737623425, 1737623425, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(89, '/testlink/lib/execute/execSetResults.php', 1737623425, 1737623425, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(90, '/testlink/lib/plan/buildEdit.php', 1737623447, 1737623448, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(91, '/testlink/lib/execute/execSetResults.php', 1737624231, 1737624231, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(92, '/testlink/lib/execute/execSetResults.php', 1737624239, 1737624239, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(93, '/testlink/lib/execute/execSetResults.php', 1737624273, 1737624273, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(94, '/testlink/lib/execute/execSetResults.php', 1737624275, 1737624276, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(95, '/testlink/lib/execute/execSetResults.php', 1737624277, 1737624277, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(96, '/testlink/lib/execute/execSetResults.php', 1737624283, 1737624284, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(97, '/testlink/lib/execute/execSetResults.php', 1737626215, 1737626216, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(98, '/testlink/lib/execute/execSetResults.php', 1737626229, 1737626229, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(99, '/testlink/lib/execute/execSetResults.php', 1737626232, 1737626232, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(100, '/testlink/lib/testcases/containerEdit.php', 1737631447, 1737631447, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(101, '/testlink/lib/testcases/containerEdit.php', 1737631461, 1737631462, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(102, '/testlink/lib/testcases/containerEdit.php', 1737634555, 1737634556, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(103, '/testlink/lib/testcases/containerEdit.php', 1737634577, 1737634578, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(104, '/testlink/lib/testcases/containerEdit.php', 1737634611, 1737634612, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(105, '/testlink/lib/testcases/containerEdit.php', 1737634687, 1737634688, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(106, '/testlink/lib/testcases/containerEdit.php', 1737634722, 1737634723, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(107, '/testlink/lib/testcases/containerEdit.php', 1737634781, 1737634781, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(108, '/testlink/lib/testcases/containerEdit.php', 1737634831, 1737634833, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(109, '/testlink/lib/testcases/containerEdit.php', 1737634833, 1737634834, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(110, '/testlink/lib/testcases/containerEdit.php', 1737634834, 1737634835, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(111, '/testlink/lib/testcases/containerEdit.php', 1737634835, 1737634836, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(112, '/testlink/lib/testcases/containerEdit.php', 1737634836, 1737634837, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(113, '/testlink/lib/testcases/containerEdit.php', 1737634837, 1737634838, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(114, '/testlink/lib/testcases/containerEdit.php', 1737634838, 1737634839, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(115, '/testlink/lib/testcases/containerEdit.php', 1737634839, 1737634840, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(116, '/testlink/lib/testcases/containerEdit.php', 1737634888, 1737634889, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(117, '/testlink/lib/testcases/containerEdit.php', 1737634910, 1737634910, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(118, '/testlink/lib/testcases/containerEdit.php', 1737642450, 1737642450, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(119, '/testlink/lib/testcases/containerEdit.php', 1737642460, 1737642460, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(120, '/testlink/lib/testcases/containerEdit.php', 1737642502, 1737642502, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(121, '/testlink/lib/testcases/containerEdit.php', 1737642543, 1737642543, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(122, '/testlink/lib/testcases/containerEdit.php', 1737643041, 1737643041, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(123, '/testlink/lib/testcases/containerEdit.php', 1737643091, 1737643092, 1, 'uifqoanont5h4fkq8ksrndorr7'),
(124, '/testlink/lib/testcases/containerEdit.php', 1737643155, 1737643155, 1, 'uifqoanont5h4fkq8ksrndorr7');

-- --------------------------------------------------------

--
-- Stand-in structure for view `tsuites_tree_depth_2`
-- (See below for the actual view)
--
CREATE TABLE `tsuites_tree_depth_2` (
`prefix` varchar(16)
,`testproject_name` varchar(100)
,`level1_name` varchar(100)
,`level2_name` varchar(100)
,`testproject_id` int(10) unsigned
,`level1_id` int(10) unsigned
,`level2_id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(100) NOT NULL DEFAULT '',
  `first` varchar(50) NOT NULL DEFAULT '',
  `last` varchar(50) NOT NULL DEFAULT '',
  `locale` varchar(10) NOT NULL DEFAULT 'en_GB',
  `default_testproject_id` int(10) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `script_key` varchar(32) DEFAULT NULL,
  `cookie_string` varchar(64) NOT NULL DEFAULT '',
  `auth_method` varchar(10) DEFAULT '',
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='User information';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `role_id`, `email`, `first`, `last`, `locale`, `default_testproject_id`, `active`, `script_key`, `cookie_string`, `auth_method`, `creation_ts`, `expiration_date`) VALUES
(1, 'admin', '$2y$10$8WNToUr11PCgH60x1S9QduTmpscNcUtOAUGxzeIDULUI1sy7Qp1h.', 8, '', 'Testlink', 'Administrator', 'en_GB', NULL, 1, 'c8a540fce43725f6ce34f6cc8f991f67', '0af109af46a85d39d81ee2256b172deb98dce22bcfd6e90009fdf7a3b19b54d5', '', '2025-01-22 20:11:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_assignments`
--

CREATE TABLE `user_assignments` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `feature_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED DEFAULT 0,
  `build_id` int(10) UNSIGNED DEFAULT 0,
  `deadline_ts` datetime DEFAULT NULL,
  `assigner_id` int(10) UNSIGNED DEFAULT 0,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(10) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_assignments`
--

INSERT INTO `user_assignments` (`id`, `type`, `feature_id`, `user_id`, `build_id`, `deadline_ts`, `assigner_id`, `creation_ts`, `status`) VALUES
(1, 1, 4, 1, 1, NULL, 1, '2025-01-23 18:24:43', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_group_assign`
--

CREATE TABLE `user_group_assign` (
  `usergroup_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_testplan_roles`
--

CREATE TABLE `user_testplan_roles` (
  `user_id` int(10) NOT NULL DEFAULT 0,
  `testplan_id` int(10) NOT NULL DEFAULT 0,
  `role_id` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_testplan_roles`
--

INSERT INTO `user_testplan_roles` (`user_id`, `testplan_id`, `role_id`) VALUES
(1, 10, 8);

-- --------------------------------------------------------

--
-- Table structure for table `user_testproject_roles`
--

CREATE TABLE `user_testproject_roles` (
  `user_id` int(10) NOT NULL DEFAULT 0,
  `testproject_id` int(10) NOT NULL DEFAULT 0,
  `role_id` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure for view `exec_by_date_time`
--
DROP TABLE IF EXISTS `exec_by_date_time`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exec_by_date_time`  AS   (select `nhtpl`.`name` AS `testplan_name`,date_format(`e`.`execution_ts`,'%Y-%m-%d') AS `yyyy_mm_dd`,date_format(`e`.`execution_ts`,'%Y-%m') AS `yyyy_mm`,date_format(`e`.`execution_ts`,'%H') AS `hh`,date_format(`e`.`execution_ts`,'%k') AS `hour`,`e`.`id` AS `id`,`e`.`build_id` AS `build_id`,`e`.`tester_id` AS `tester_id`,`e`.`execution_ts` AS `execution_ts`,`e`.`status` AS `status`,`e`.`testplan_id` AS `testplan_id`,`e`.`tcversion_id` AS `tcversion_id`,`e`.`tcversion_number` AS `tcversion_number`,`e`.`platform_id` AS `platform_id`,`e`.`execution_type` AS `execution_type`,`e`.`execution_duration` AS `execution_duration`,`e`.`notes` AS `notes` from ((`executions` `e` join `testplans` `tpl` on(`tpl`.`id` = `e`.`testplan_id`)) join `nodes_hierarchy` `nhtpl` on(`nhtpl`.`id` = `tpl`.`id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `latest_exec_by_context`
--
DROP TABLE IF EXISTS `latest_exec_by_context`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `latest_exec_by_context`  AS SELECT `executions`.`tcversion_id` AS `tcversion_id`, `executions`.`testplan_id` AS `testplan_id`, `executions`.`build_id` AS `build_id`, `executions`.`platform_id` AS `platform_id`, max(`executions`.`id`) AS `id` FROM `executions` GROUP BY `executions`.`tcversion_id`, `executions`.`testplan_id`, `executions`.`build_id`, `executions`.`platform_id` ;

-- --------------------------------------------------------

--
-- Structure for view `latest_exec_by_testplan`
--
DROP TABLE IF EXISTS `latest_exec_by_testplan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `latest_exec_by_testplan`  AS SELECT `executions`.`tcversion_id` AS `tcversion_id`, `executions`.`testplan_id` AS `testplan_id`, max(`executions`.`id`) AS `id` FROM `executions` GROUP BY `executions`.`tcversion_id`, `executions`.`testplan_id` ;

-- --------------------------------------------------------

--
-- Structure for view `latest_exec_by_testplan_plat`
--
DROP TABLE IF EXISTS `latest_exec_by_testplan_plat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `latest_exec_by_testplan_plat`  AS SELECT `executions`.`tcversion_id` AS `tcversion_id`, `executions`.`testplan_id` AS `testplan_id`, `executions`.`platform_id` AS `platform_id`, max(`executions`.`id`) AS `id` FROM `executions` GROUP BY `executions`.`tcversion_id`, `executions`.`testplan_id`, `executions`.`platform_id` ;

-- --------------------------------------------------------

--
-- Structure for view `latest_req_version`
--
DROP TABLE IF EXISTS `latest_req_version`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `latest_req_version`  AS SELECT `rq`.`id` AS `req_id`, max(`rqv`.`version`) AS `version` FROM ((`nodes_hierarchy` `nhrqv` join `requirements` `rq` on(`rq`.`id` = `nhrqv`.`parent_id`)) join `req_versions` `rqv` on(`rqv`.`id` = `nhrqv`.`id`)) GROUP BY `rq`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `latest_req_version_id`
--
DROP TABLE IF EXISTS `latest_req_version_id`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `latest_req_version_id`  AS SELECT `lrqvn`.`req_id` AS `req_id`, `lrqvn`.`version` AS `version`, `reqv`.`id` AS `req_version_id` FROM ((`latest_req_version` `lrqvn` join `nodes_hierarchy` `nhrqv` on(`nhrqv`.`parent_id` = `lrqvn`.`req_id`)) join `req_versions` `reqv` on(`reqv`.`id` = `nhrqv`.`id` and `reqv`.`version` = `lrqvn`.`version`)) ;

-- --------------------------------------------------------

--
-- Structure for view `latest_rspec_revision`
--
DROP TABLE IF EXISTS `latest_rspec_revision`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `latest_rspec_revision`  AS SELECT `rsr`.`parent_id` AS `req_spec_id`, `rs`.`testproject_id` AS `testproject_id`, max(`rsr`.`revision`) AS `revision` FROM (`req_specs_revisions` `rsr` join `req_specs` `rs` on(`rs`.`id` = `rsr`.`parent_id`)) GROUP BY `rsr`.`parent_id`, `rs`.`testproject_id` ;

-- --------------------------------------------------------

--
-- Structure for view `latest_tcase_version_id`
--
DROP TABLE IF EXISTS `latest_tcase_version_id`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `latest_tcase_version_id`  AS SELECT `ltcvn`.`testcase_id` AS `testcase_id`, `ltcvn`.`version` AS `version`, `tcv`.`id` AS `tcversion_id` FROM ((`latest_tcase_version_number` `ltcvn` join `nodes_hierarchy` `nhtcv` on(`nhtcv`.`parent_id` = `ltcvn`.`testcase_id`)) join `tcversions` `tcv` on(`tcv`.`id` = `nhtcv`.`id` and `tcv`.`version` = `ltcvn`.`version`)) ;

-- --------------------------------------------------------

--
-- Structure for view `latest_tcase_version_number`
--
DROP TABLE IF EXISTS `latest_tcase_version_number`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `latest_tcase_version_number`  AS SELECT `nh_tc`.`id` AS `testcase_id`, max(`tcv`.`version`) AS `version` FROM ((`nodes_hierarchy` `nh_tc` join `nodes_hierarchy` `nh_tcv` on(`nh_tcv`.`parent_id` = `nh_tc`.`id`)) join `tcversions` `tcv` on(`nh_tcv`.`id` = `tcv`.`id`)) GROUP BY `nh_tc`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `tcversions_without_keywords`
--
DROP TABLE IF EXISTS `tcversions_without_keywords`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tcversions_without_keywords`  AS SELECT `nhtcv`.`parent_id` AS `testcase_id`, `nhtcv`.`id` AS `id` FROM `nodes_hierarchy` AS `nhtcv` WHERE `nhtcv`.`node_type_id` = 4 AND !exists(select 1 from `testcase_keywords` `tck` where `tck`.`tcversion_id` = `nhtcv`.`id` limit 1) ;

-- --------------------------------------------------------

--
-- Structure for view `tcversions_without_platforms`
--
DROP TABLE IF EXISTS `tcversions_without_platforms`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tcversions_without_platforms`  AS SELECT `nhtcv`.`parent_id` AS `testcase_id`, `nhtcv`.`id` AS `id` FROM `nodes_hierarchy` AS `nhtcv` WHERE `nhtcv`.`node_type_id` = 4 AND !exists(select 1 from `testcase_platforms` `tcpl` where `tcpl`.`tcversion_id` = `nhtcv`.`id` limit 1) ;

-- --------------------------------------------------------

--
-- Structure for view `tsuites_tree_depth_2`
--
DROP TABLE IF EXISTS `tsuites_tree_depth_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tsuites_tree_depth_2`  AS SELECT `tprj`.`prefix` AS `prefix`, `nhtprj`.`name` AS `testproject_name`, `nhts_l1`.`name` AS `level1_name`, `nhts_l2`.`name` AS `level2_name`, `nhtprj`.`id` AS `testproject_id`, `nhts_l1`.`id` AS `level1_id`, `nhts_l2`.`id` AS `level2_id` FROM (((`testprojects` `tprj` join `nodes_hierarchy` `nhtprj` on(`tprj`.`id` = `nhtprj`.`id`)) left join `nodes_hierarchy` `nhts_l1` on(`nhts_l1`.`parent_id` = `nhtprj`.`id`)) left join `nodes_hierarchy` `nhts_l2` on(`nhts_l2`.`parent_id` = `nhts_l1`.`id`)) WHERE `nhtprj`.`node_type_id` = 1 AND `nhts_l1`.`node_type_id` = 2 AND `nhts_l2`.`node_type_id` = 2 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment_status`
--
ALTER TABLE `assignment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignment_types`
--
ALTER TABLE `assignment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachments_idx1` (`fk_id`);

--
-- Indexes for table `baseline_l1l2_context`
--
ALTER TABLE `baseline_l1l2_context`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `udx1_context` (`testplan_id`,`platform_id`,`creation_ts`);

--
-- Indexes for table `baseline_l1l2_details`
--
ALTER TABLE `baseline_l1l2_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `udx1_details` (`context_id`,`top_tsuite_id`,`child_tsuite_id`,`status`);

--
-- Indexes for table `builds`
--
ALTER TABLE `builds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`testplan_id`,`name`),
  ADD KEY `testplan_id` (`testplan_id`);

--
-- Indexes for table `cfield_build_design_values`
--
ALTER TABLE `cfield_build_design_values`
  ADD PRIMARY KEY (`field_id`,`node_id`),
  ADD KEY `idx_cfield_build_design_values` (`node_id`);

--
-- Indexes for table `cfield_design_values`
--
ALTER TABLE `cfield_design_values`
  ADD PRIMARY KEY (`field_id`,`node_id`),
  ADD KEY `idx_cfield_design_values` (`node_id`);

--
-- Indexes for table `cfield_execution_values`
--
ALTER TABLE `cfield_execution_values`
  ADD PRIMARY KEY (`field_id`,`execution_id`,`testplan_id`,`tcversion_id`);

--
-- Indexes for table `cfield_node_types`
--
ALTER TABLE `cfield_node_types`
  ADD PRIMARY KEY (`field_id`,`node_type_id`),
  ADD KEY `idx_custom_fields_assign` (`node_type_id`);

--
-- Indexes for table `cfield_testplan_design_values`
--
ALTER TABLE `cfield_testplan_design_values`
  ADD PRIMARY KEY (`field_id`,`link_id`),
  ADD KEY `idx_cfield_tplan_design_val` (`link_id`);

--
-- Indexes for table `cfield_testprojects`
--
ALTER TABLE `cfield_testprojects`
  ADD PRIMARY KEY (`field_id`,`testproject_id`);

--
-- Indexes for table `codetrackers`
--
ALTER TABLE `codetrackers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codetrackers_uidx1` (`name`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_custom_fields_name` (`name`);

--
-- Indexes for table `db_version`
--
ALTER TABLE `db_version`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `fired_at` (`fired_at`);

--
-- Indexes for table `executions`
--
ALTER TABLE `executions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `executions_idx1` (`testplan_id`,`tcversion_id`,`platform_id`,`build_id`),
  ADD KEY `executions_idx2` (`execution_type`),
  ADD KEY `executions_idx3` (`tcversion_id`);

--
-- Indexes for table `execution_bugs`
--
ALTER TABLE `execution_bugs`
  ADD PRIMARY KEY (`execution_id`,`bug_id`,`tcstep_id`);

--
-- Indexes for table `execution_tcsteps`
--
ALTER TABLE `execution_tcsteps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `execution_tcsteps_idx1` (`execution_id`,`tcstep_id`);

--
-- Indexes for table `execution_tcsteps_wip`
--
ALTER TABLE `execution_tcsteps_wip`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `execution_tcsteps_wip_idx1` (`tcstep_id`,`testplan_id`,`platform_id`,`build_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_idx1` (`testproject_id`);

--
-- Indexes for table `issuetrackers`
--
ALTER TABLE `issuetrackers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `issuetrackers_uidx1` (`name`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `keyword_testproject_id` (`keyword`,`testproject_id`),
  ADD KEY `testproject_id` (`testproject_id`),
  ADD KEY `keyword` (`keyword`);

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_testplan_id` (`name`,`testplan_id`),
  ADD KEY `testplan_id` (`testplan_id`);

--
-- Indexes for table `nodes_hierarchy`
--
ALTER TABLE `nodes_hierarchy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid_m_nodeorder` (`parent_id`,`node_order`),
  ADD KEY `nodes_hierarchy_node_type_id` (`node_type_id`);

--
-- Indexes for table `node_types`
--
ALTER TABLE `node_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `object_keywords`
--
ALTER TABLE `object_keywords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `udx01_object_keywords` (`fk_id`,`fk_table`,`keyword_id`);

--
-- Indexes for table `platforms`
--
ALTER TABLE `platforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_platforms` (`testproject_id`,`name`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plugins_configuration`
--
ALTER TABLE `plugins_configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reqmgrsystems`
--
ALTER TABLE `reqmgrsystems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reqmgrsystems_uidx1` (`name`);

--
-- Indexes for table `requirements`
--
ALTER TABLE `requirements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `requirements_req_doc_id` (`srs_id`,`req_doc_id`);

--
-- Indexes for table `req_coverage`
--
ALTER TABLE `req_coverage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `req_coverage_full_link` (`req_id`,`req_version_id`,`testcase_id`,`tcversion_id`);

--
-- Indexes for table `req_monitor`
--
ALTER TABLE `req_monitor`
  ADD PRIMARY KEY (`req_id`,`user_id`,`testproject_id`);

--
-- Indexes for table `req_relations`
--
ALTER TABLE `req_relations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `req_revisions`
--
ALTER TABLE `req_revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `req_revisions_uidx1` (`parent_id`,`revision`);

--
-- Indexes for table `req_specs`
--
ALTER TABLE `req_specs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `req_spec_uk1` (`doc_id`,`testproject_id`),
  ADD KEY `testproject_id` (`testproject_id`);

--
-- Indexes for table `req_specs_revisions`
--
ALTER TABLE `req_specs_revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `req_specs_revisions_uidx1` (`parent_id`,`revision`);

--
-- Indexes for table `req_versions`
--
ALTER TABLE `req_versions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rights`
--
ALTER TABLE `rights`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rights_descr` (`description`);

--
-- Indexes for table `risk_assignments`
--
ALTER TABLE `risk_assignments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `risk_assignments_tplan_node_id` (`testplan_id`,`node_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_rights_roles_descr` (`description`);

--
-- Indexes for table `role_rights`
--
ALTER TABLE `role_rights`
  ADD PRIMARY KEY (`role_id`,`right_id`);

--
-- Indexes for table `tcsteps`
--
ALTER TABLE `tcsteps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tcversions`
--
ALTER TABLE `tcversions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testcase_keywords`
--
ALTER TABLE `testcase_keywords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx01_testcase_keywords` (`testcase_id`,`tcversion_id`,`keyword_id`),
  ADD KEY `idx02_testcase_keywords` (`tcversion_id`);

--
-- Indexes for table `testcase_platforms`
--
ALTER TABLE `testcase_platforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx01_testcase_platform` (`testcase_id`,`tcversion_id`,`platform_id`),
  ADD KEY `idx02_testcase_platform` (`tcversion_id`);

--
-- Indexes for table `testcase_relations`
--
ALTER TABLE `testcase_relations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testcase_script_links`
--
ALTER TABLE `testcase_script_links`
  ADD PRIMARY KEY (`tcversion_id`,`project_key`,`repository_name`,`code_path`);

--
-- Indexes for table `testplans`
--
ALTER TABLE `testplans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `testplans_api_key` (`api_key`),
  ADD KEY `testplans_testproject_id_active` (`testproject_id`,`active`);

--
-- Indexes for table `testplan_platforms`
--
ALTER TABLE `testplan_platforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_testplan_platforms` (`testplan_id`,`platform_id`);

--
-- Indexes for table `testplan_tcversions`
--
ALTER TABLE `testplan_tcversions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `testplan_tcversions_tplan_tcversion` (`testplan_id`,`tcversion_id`,`platform_id`);

--
-- Indexes for table `testprojects`
--
ALTER TABLE `testprojects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `testprojects_prefix` (`prefix`),
  ADD UNIQUE KEY `testprojects_api_key` (`api_key`),
  ADD KEY `testprojects_id_active` (`id`,`active`);

--
-- Indexes for table `testproject_codetracker`
--
ALTER TABLE `testproject_codetracker`
  ADD PRIMARY KEY (`testproject_id`);

--
-- Indexes for table `testproject_issuetracker`
--
ALTER TABLE `testproject_issuetracker`
  ADD PRIMARY KEY (`testproject_id`);

--
-- Indexes for table `testproject_reqmgrsystem`
--
ALTER TABLE `testproject_reqmgrsystem`
  ADD PRIMARY KEY (`testproject_id`);

--
-- Indexes for table `testsuites`
--
ALTER TABLE `testsuites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `text_templates`
--
ALTER TABLE `text_templates`
  ADD UNIQUE KEY `idx_text_templates` (`type`,`title`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_login` (`login`),
  ADD UNIQUE KEY `users_cookie_string` (`cookie_string`);

--
-- Indexes for table `user_assignments`
--
ALTER TABLE `user_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_assignments_feature_id` (`feature_id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_user_group` (`title`);

--
-- Indexes for table `user_group_assign`
--
ALTER TABLE `user_group_assign`
  ADD UNIQUE KEY `idx_user_group_assign` (`usergroup_id`,`user_id`);

--
-- Indexes for table `user_testplan_roles`
--
ALTER TABLE `user_testplan_roles`
  ADD PRIMARY KEY (`user_id`,`testplan_id`);

--
-- Indexes for table `user_testproject_roles`
--
ALTER TABLE `user_testproject_roles`
  ADD PRIMARY KEY (`user_id`,`testproject_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment_status`
--
ALTER TABLE `assignment_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `assignment_types`
--
ALTER TABLE `assignment_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `baseline_l1l2_context`
--
ALTER TABLE `baseline_l1l2_context`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `baseline_l1l2_details`
--
ALTER TABLE `baseline_l1l2_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `builds`
--
ALTER TABLE `builds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `codetrackers`
--
ALTER TABLE `codetrackers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=642;

--
-- AUTO_INCREMENT for table `executions`
--
ALTER TABLE `executions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `execution_tcsteps`
--
ALTER TABLE `execution_tcsteps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `execution_tcsteps_wip`
--
ALTER TABLE `execution_tcsteps_wip`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issuetrackers`
--
ALTER TABLE `issuetrackers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `milestones`
--
ALTER TABLE `milestones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nodes_hierarchy`
--
ALTER TABLE `nodes_hierarchy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `node_types`
--
ALTER TABLE `node_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `object_keywords`
--
ALTER TABLE `object_keywords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `platforms`
--
ALTER TABLE `platforms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plugins_configuration`
--
ALTER TABLE `plugins_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reqmgrsystems`
--
ALTER TABLE `reqmgrsystems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `req_coverage`
--
ALTER TABLE `req_coverage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `req_relations`
--
ALTER TABLE `req_relations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rights`
--
ALTER TABLE `rights`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `risk_assignments`
--
ALTER TABLE `risk_assignments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `testcase_keywords`
--
ALTER TABLE `testcase_keywords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testcase_platforms`
--
ALTER TABLE `testcase_platforms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testcase_relations`
--
ALTER TABLE `testcase_relations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testplan_platforms`
--
ALTER TABLE `testplan_platforms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testplan_tcversions`
--
ALTER TABLE `testplan_tcversions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_assignments`
--
ALTER TABLE `user_assignments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
