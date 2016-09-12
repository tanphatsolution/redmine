-- phpMyAdmin SQL Dump
-- version 4.6.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 12, 2016 at 02:19 AM
-- Server version: 5.7.13-log
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `redmine`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(11) NOT NULL,
  `container_id` int(11) DEFAULT NULL,
  `container_type` varchar(30) DEFAULT NULL,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `disk_filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` bigint(20) NOT NULL DEFAULT '0',
  `content_type` varchar(255) DEFAULT '',
  `digest` varchar(40) NOT NULL DEFAULT '',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `disk_directory` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_sources`
--

CREATE TABLE `auth_sources` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `host` varchar(60) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `account_password` varchar(255) DEFAULT '',
  `base_dn` varchar(255) DEFAULT NULL,
  `attr_login` varchar(30) DEFAULT NULL,
  `attr_firstname` varchar(30) DEFAULT NULL,
  `attr_lastname` varchar(30) DEFAULT NULL,
  `attr_mail` varchar(30) DEFAULT NULL,
  `onthefly_register` tinyint(1) NOT NULL DEFAULT '0',
  `tls` tinyint(1) NOT NULL DEFAULT '0',
  `filter` text,
  `timeout` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `topics_count` int(11) NOT NULL DEFAULT '0',
  `messages_count` int(11) NOT NULL DEFAULT '0',
  `last_message_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `changes`
--

CREATE TABLE `changes` (
  `id` int(11) NOT NULL,
  `changeset_id` int(11) NOT NULL,
  `action` varchar(1) NOT NULL DEFAULT '',
  `path` text NOT NULL,
  `from_path` text,
  `from_revision` varchar(255) DEFAULT NULL,
  `revision` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `changesets`
--

CREATE TABLE `changesets` (
  `id` int(11) NOT NULL,
  `repository_id` int(11) NOT NULL,
  `revision` varchar(255) NOT NULL,
  `committer` varchar(255) DEFAULT NULL,
  `committed_on` datetime NOT NULL,
  `comments` longtext,
  `commit_date` date DEFAULT NULL,
  `scmid` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `changesets_issues`
--

CREATE TABLE `changesets_issues` (
  `changeset_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `changeset_parents`
--

CREATE TABLE `changeset_parents` (
  `changeset_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `commented_type` varchar(30) NOT NULL DEFAULT '',
  `commented_id` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `comments` text,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `field_format` varchar(30) NOT NULL DEFAULT '',
  `possible_values` text,
  `regexp` varchar(255) DEFAULT '',
  `min_length` int(11) DEFAULT NULL,
  `max_length` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_for_all` tinyint(1) NOT NULL DEFAULT '0',
  `is_filter` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT '0',
  `default_value` text,
  `editable` tinyint(1) DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `multiple` tinyint(1) DEFAULT '0',
  `format_store` text,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_projects`
--

CREATE TABLE `custom_fields_projects` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_roles`
--

CREATE TABLE `custom_fields_roles` (
  `custom_field_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_trackers`
--

CREATE TABLE `custom_fields_trackers` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_enumerations`
--

CREATE TABLE `custom_field_enumerations` (
  `id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_values`
--

CREATE TABLE `custom_values` (
  `id` int(11) NOT NULL,
  `customized_type` varchar(30) NOT NULL DEFAULT '',
  `customized_id` int(11) NOT NULL DEFAULT '0',
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `created_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_addresses`
--

CREATE TABLE `email_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_addresses`
--

INSERT INTO `email_addresses` (`id`, `user_id`, `address`, `is_default`, `notify`, `created_on`, `updated_on`) VALUES
(1, 1, 'phamkykhoi.info@gmail.com', 1, 1, '2016-09-11 20:28:57', '2016-09-11 20:28:57'),
(2, 5, 'khoilopci@gmail.com', 1, 1, '2016-09-11 21:49:43', '2016-09-11 21:49:43'),
(3, 6, 'quyenna@tanphat.com', 1, 1, '2016-09-11 23:42:21', '2016-09-11 23:42:21'),
(4, 7, 'dungda@tanphat.com', 1, 1, '2016-09-11 23:43:22', '2016-09-11 23:43:22');

-- --------------------------------------------------------

--
-- Table structure for table `enabled_modules`
--

CREATE TABLE `enabled_modules` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enabled_modules`
--

INSERT INTO `enabled_modules` (`id`, `project_id`, `name`) VALUES
(21, 3, 'issue_tracking'),
(22, 3, 'time_tracking'),
(23, 3, 'news'),
(24, 3, 'documents'),
(25, 3, 'files'),
(26, 3, 'wiki'),
(29, 3, 'calendar'),
(30, 3, 'gantt'),
(31, 3, 'boards'),
(32, 3, 'repository');

-- --------------------------------------------------------

--
-- Table structure for table `enumerations`
--

CREATE TABLE `enumerations` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `project_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enumerations`
--

INSERT INTO `enumerations` (`id`, `name`, `position`, `is_default`, `type`, `active`, `project_id`, `parent_id`, `position_name`) VALUES
(1, 'Normal', 1, 1, 'IssuePriority', 1, NULL, NULL, 'default'),
(2, 'Hight', 2, 0, 'IssuePriority', 1, NULL, NULL, 'high3'),
(3, 'Low', 3, 0, 'IssuePriority', 1, NULL, NULL, 'high2'),
(4, 'Urgent', 4, 0, 'IssuePriority', 1, NULL, NULL, 'highest');

-- --------------------------------------------------------

--
-- Table structure for table `groups_users`
--

CREATE TABLE `groups_users` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `settings` text,
  `total_items` int(11) DEFAULT NULL,
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `import_items`
--

CREATE TABLE `import_items` (
  `id` int(11) NOT NULL,
  `import_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int(11) NOT NULL,
  `tracker_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `due_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `priority_id` int(11) NOT NULL,
  `fixed_version_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_ratio` int(11) NOT NULL DEFAULT '0',
  `estimated_hours` float DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `closed_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `tracker_id`, `project_id`, `subject`, `description`, `due_date`, `category_id`, `status_id`, `assigned_to_id`, `priority_id`, `fixed_version_id`, `author_id`, `lock_version`, `created_on`, `updated_on`, `start_date`, `done_ratio`, `estimated_hours`, `parent_id`, `root_id`, `lft`, `rgt`, `is_private`, `closed_on`) VALUES
(1, 5, 3, '[Development] Thay đổi mật khẩu cá nhân', '', '2016-09-11', 1, 2, 5, 1, NULL, 5, 8, '2016-09-11 23:52:21', '2016-09-12 08:45:16', '2016-09-11', 0, 2, NULL, 1, 1, 2, 0, NULL),
(2, 5, 3, '[Development] Thay đổi thông tin profile', '', '2016-09-12', 1, 7, 7, 1, NULL, 5, 3, '2016-09-12 00:01:30', '2016-09-12 08:44:40', '2016-09-12', 0, 3, NULL, 2, 1, 2, 0, NULL),
(3, 5, 3, '[Development] Quản lý người dùng', '', '2016-09-12', NULL, 1, NULL, 1, NULL, 5, 2, '2016-09-12 00:02:21', '2016-09-12 08:41:39', '2016-09-12', 0, NULL, NULL, 3, 1, 10, 0, NULL),
(4, 5, 3, '[Development] Thêm mới người dùng', '', '2016-09-12', NULL, 1, NULL, 1, NULL, 5, 2, '2016-09-12 00:03:23', '2016-09-12 00:05:42', '2016-09-12', 0, 2, 3, 3, 2, 3, 0, NULL),
(5, 5, 3, '[Development] Hiển thị danh sách, tìm kiếm, phân trang, sort người dùng', '', NULL, 1, 1, NULL, 1, NULL, 5, 0, '2016-09-12 00:06:58', '2016-09-12 00:06:58', '2016-09-12', 0, 2, 3, 3, 4, 5, 0, NULL),
(6, 5, 3, '[Development] Sửa thông tin người dùng', '', '2016-09-12', 1, 1, NULL, 1, NULL, 5, 1, '2016-09-12 00:08:09', '2016-09-12 00:08:17', '2016-09-12', 0, 2, 3, 3, 6, 7, 0, NULL),
(7, 5, 3, '[Development] Xóa người dùng', '', '2016-09-12', 1, 1, NULL, 1, NULL, 5, 1, '2016-09-12 00:09:09', '2016-09-12 00:09:20', '2016-09-12', 0, 1, 3, 3, 8, 9, 0, NULL),
(8, 5, 3, '[Development] Quản lý phòng ban', '', NULL, 1, 1, NULL, 1, NULL, 5, 1, '2016-09-12 00:09:56', '2016-09-12 00:10:32', '2016-09-12', 0, NULL, NULL, 8, 1, 4, 0, NULL),
(9, 5, 3, '[Development] Thêm mới phòng ban', '', NULL, 1, 1, NULL, 1, NULL, 5, 1, '2016-09-12 00:11:04', '2016-09-12 00:11:21', '2016-09-12', 0, 2, 8, 8, 2, 3, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `issue_categories`
--

CREATE TABLE `issue_categories` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL DEFAULT '',
  `assigned_to_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issue_categories`
--

INSERT INTO `issue_categories` (`id`, `project_id`, `name`, `assigned_to_id`) VALUES
(1, 3, 'Development', NULL),
(2, 3, 'Design', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `issue_relations`
--

CREATE TABLE `issue_relations` (
  `id` int(11) NOT NULL,
  `issue_from_id` int(11) NOT NULL,
  `issue_to_id` int(11) NOT NULL,
  `relation_type` varchar(255) NOT NULL DEFAULT '',
  `delay` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issue_statuses`
--

CREATE TABLE `issue_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `default_done_ratio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issue_statuses`
--

INSERT INTO `issue_statuses` (`id`, `name`, `is_closed`, `position`, `default_done_ratio`) VALUES
(1, 'New', 0, 1, NULL),
(2, 'Closed', 0, 2, NULL),
(3, 'Feedback', 0, 3, NULL),
(4, 'Resolved', 0, 4, NULL),
(5, 'Bug', 0, 5, NULL),
(6, 'Testing', 0, 6, NULL),
(7, 'In Progress', 0, 7, NULL),
(8, 'Approved', 0, 8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` int(11) NOT NULL,
  `journalized_id` int(11) NOT NULL DEFAULT '0',
  `journalized_type` varchar(30) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `notes` text,
  `created_on` datetime NOT NULL,
  `private_notes` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`id`, `journalized_id`, `journalized_type`, `user_id`, `notes`, `created_on`, `private_notes`) VALUES
(1, 1, 'Issue', 5, '', '2016-09-11 23:53:01', 0),
(2, 2, 'Issue', 5, '', '2016-09-12 00:03:35', 0),
(3, 1, 'Issue', 5, '', '2016-09-12 00:03:49', 0),
(4, 4, 'Issue', 5, '', '2016-09-12 00:04:26', 0),
(5, 4, 'Issue', 5, '', '2016-09-12 00:05:42', 0),
(6, 6, 'Issue', 5, '', '2016-09-12 00:08:17', 0),
(7, 7, 'Issue', 5, '', '2016-09-12 00:09:20', 0),
(8, 8, 'Issue', 5, '', '2016-09-12 00:10:32', 0),
(9, 9, 'Issue', 5, '', '2016-09-12 00:11:21', 0),
(10, 3, 'Issue', 5, '', '2016-09-12 08:41:39', 0),
(11, 1, 'Issue', 5, '', '2016-09-12 08:42:42', 0),
(12, 1, 'Issue', 5, '', '2016-09-12 08:43:20', 0),
(13, 1, 'Issue', 5, '', '2016-09-12 08:43:41', 0),
(14, 1, 'Issue', 5, '', '2016-09-12 08:44:02', 0),
(15, 2, 'Issue', 5, '', '2016-09-12 08:44:23', 0),
(16, 2, 'Issue', 5, '', '2016-09-12 08:44:40', 0),
(17, 1, 'Issue', 5, '', '2016-09-12 08:44:57', 0),
(18, 1, 'Issue', 5, '', '2016-09-12 08:45:16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `journal_details`
--

CREATE TABLE `journal_details` (
  `id` int(11) NOT NULL,
  `journal_id` int(11) NOT NULL DEFAULT '0',
  `property` varchar(30) NOT NULL DEFAULT '',
  `prop_key` varchar(30) NOT NULL DEFAULT '',
  `old_value` text,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `journal_details`
--

INSERT INTO `journal_details` (`id`, `journal_id`, `property`, `prop_key`, `old_value`, `value`) VALUES
(1, 1, 'attr', 'due_date', NULL, '2016-09-11'),
(2, 2, 'attr', 'assigned_to_id', '7', NULL),
(3, 3, 'attr', 'assigned_to_id', '7', NULL),
(4, 4, 'attr', 'estimated_hours', NULL, '3.0'),
(5, 5, 'attr', 'estimated_hours', '3.0', '2.0'),
(6, 6, 'attr', 'parent_id', NULL, '3'),
(7, 7, 'attr', 'parent_id', NULL, '3'),
(8, 8, 'attr', 'subject', '[Development] Thêm mới phòng ban', '[Development] Quản lý phòng ban'),
(9, 9, 'attr', 'estimated_hours', NULL, '2.0'),
(10, 10, 'attr', 'tracker_id', '1', '5'),
(11, 11, 'attr', 'assigned_to_id', NULL, '7'),
(12, 12, 'attr', 'status_id', '1', '7'),
(13, 13, 'attr', 'status_id', '7', '4'),
(14, 13, 'attr', 'assigned_to_id', '7', '6'),
(15, 14, 'attr', 'status_id', '4', '6'),
(16, 15, 'attr', 'status_id', '1', '4'),
(17, 15, 'attr', 'assigned_to_id', NULL, '7'),
(18, 16, 'attr', 'status_id', '4', '7'),
(19, 17, 'attr', 'status_id', '6', '4'),
(20, 17, 'attr', 'assigned_to_id', '6', '5'),
(21, 18, 'attr', 'status_id', '4', '2');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `mail_notification` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `user_id`, `project_id`, `created_on`, `mail_notification`) VALUES
(5, 5, 3, '2016-09-11 22:08:00', 0),
(6, 7, 3, '2016-09-11 23:46:21', 0),
(7, 6, 3, '2016-09-11 23:46:21', 0);

-- --------------------------------------------------------

--
-- Table structure for table `member_roles`
--

CREATE TABLE `member_roles` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `inherited_from` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member_roles`
--

INSERT INTO `member_roles` (`id`, `member_id`, `role_id`, `inherited_from`) VALUES
(5, 5, 3, NULL),
(6, 6, 4, NULL),
(7, 7, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `board_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `author_id` int(11) DEFAULT NULL,
  `replies_count` int(11) NOT NULL DEFAULT '0',
  `last_reply_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `sticky` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(60) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT '',
  `description` text,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `open_id_authentication_associations`
--

CREATE TABLE `open_id_authentication_associations` (
  `id` int(11) NOT NULL,
  `issued` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `assoc_type` varchar(255) DEFAULT NULL,
  `server_url` blob,
  `secret` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `open_id_authentication_nonces`
--

CREATE TABLE `open_id_authentication_nonces` (
  `id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `server_url` varchar(255) DEFAULT NULL,
  `salt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `homepage` varchar(255) DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `inherit_members` tinyint(1) NOT NULL DEFAULT '0',
  `default_version_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `description`, `homepage`, `is_public`, `parent_id`, `created_on`, `updated_on`, `identifier`, `status`, `lft`, `rgt`, `inherit_members`, `default_version_id`) VALUES
(3, 'GSO', '', '', 1, NULL, '2016-09-11 22:07:40', '2016-09-11 22:07:40', 'gso', 1, 1, 2, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects_trackers`
--

CREATE TABLE `projects_trackers` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects_trackers`
--

INSERT INTO `projects_trackers` (`project_id`, `tracker_id`) VALUES
(3, 1),
(3, 3),
(3, 5),
(3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `filters` text,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `column_names` text,
  `sort_criteria` text,
  `group_by` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `visibility` int(11) DEFAULT '0',
  `options` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `queries_roles`
--

CREATE TABLE `queries_roles` (
  `query_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `repositories`
--

CREATE TABLE `repositories` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `login` varchar(60) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `root_url` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT NULL,
  `path_encoding` varchar(64) DEFAULT NULL,
  `log_encoding` varchar(64) DEFAULT NULL,
  `extra_info` text,
  `identifier` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT NULL,
  `assignable` tinyint(1) DEFAULT '1',
  `builtin` int(11) NOT NULL DEFAULT '0',
  `permissions` text,
  `issues_visibility` varchar(30) NOT NULL DEFAULT 'default',
  `users_visibility` varchar(30) NOT NULL DEFAULT 'all',
  `time_entries_visibility` varchar(30) NOT NULL DEFAULT 'all',
  `all_roles_managed` tinyint(1) NOT NULL DEFAULT '1',
  `settings` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `position`, `assignable`, `builtin`, `permissions`, `issues_visibility`, `users_visibility`, `time_entries_visibility`, `all_roles_managed`, `settings`) VALUES
(1, 'Non member', 0, 1, 1, '---\n- :view_issues\n- :add_issues\n- :edit_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :save_queries\n- :view_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n', 'default', 'all', 'all', 1, '--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),
(2, 'Anonymous', 0, 1, 2, '---\n- :view_issues\n', 'default', 'all', 'all', 1, NULL),
(3, 'Manager', 1, 1, 0, '---\n- :add_project\n- :edit_project\n- :close_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :manage_boards\n- :view_calendar\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_files\n- :manage_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :edit_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :manage_public_queries\n- :save_queries\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :manage_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :protect_wiki_pages\n- :manage_wiki\n', 'all', 'all', 'all', 0, '--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),
(4, 'Member', 2, 1, 0, '---\n- :view_files\n- :view_issues\n- :add_issues\n- :edit_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :save_queries\n- :view_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :view_wiki_pages\n', 'default', 'all', 'all', 1, '--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n');

-- --------------------------------------------------------

--
-- Table structure for table `roles_managed_roles`
--

CREATE TABLE `roles_managed_roles` (
  `role_id` int(11) NOT NULL,
  `managed_role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles_managed_roles`
--

INSERT INTO `roles_managed_roles` (`role_id`, `managed_role_id`) VALUES
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('1'),
('10'),
('100'),
('101'),
('102'),
('103'),
('104'),
('105'),
('106'),
('107'),
('108'),
('11'),
('12'),
('13'),
('14'),
('15'),
('16'),
('17'),
('18'),
('19'),
('2'),
('20'),
('20090214190337'),
('20090312172426'),
('20090312194159'),
('20090318181151'),
('20090323224724'),
('20090401221305'),
('20090401231134'),
('20090403001910'),
('20090406161854'),
('20090425161243'),
('20090503121501'),
('20090503121505'),
('20090503121510'),
('20090614091200'),
('20090704172350'),
('20090704172355'),
('20090704172358'),
('20091010093521'),
('20091017212227'),
('20091017212457'),
('20091017212644'),
('20091017212938'),
('20091017213027'),
('20091017213113'),
('20091017213151'),
('20091017213228'),
('20091017213257'),
('20091017213332'),
('20091017213444'),
('20091017213536'),
('20091017213642'),
('20091017213716'),
('20091017213757'),
('20091017213835'),
('20091017213910'),
('20091017214015'),
('20091017214107'),
('20091017214136'),
('20091017214236'),
('20091017214308'),
('20091017214336'),
('20091017214406'),
('20091017214440'),
('20091017214519'),
('20091017214611'),
('20091017214644'),
('20091017214720'),
('20091017214750'),
('20091025163651'),
('20091108092559'),
('20091114105931'),
('20091123212029'),
('20091205124427'),
('20091220183509'),
('20091220183727'),
('20091220184736'),
('20091225164732'),
('20091227112908'),
('20100129193402'),
('20100129193813'),
('20100221100219'),
('20100313132032'),
('20100313171051'),
('20100705164950'),
('20100819172912'),
('20101104182107'),
('20101107130441'),
('20101114115114'),
('20101114115359'),
('20110220160626'),
('20110223180944'),
('20110223180953'),
('20110224000000'),
('20110226120112'),
('20110226120132'),
('20110227125750'),
('20110228000000'),
('20110228000100'),
('20110401192910'),
('20110408103312'),
('20110412065600'),
('20110511000000'),
('20110902000000'),
('20111201201315'),
('20120115143024'),
('20120115143100'),
('20120115143126'),
('20120127174243'),
('20120205111326'),
('20120223110929'),
('20120301153455'),
('20120422150750'),
('20120705074331'),
('20120707064544'),
('20120714122000'),
('20120714122100'),
('20120714122200'),
('20120731164049'),
('20120930112914'),
('20121026002032'),
('20121026003537'),
('20121209123234'),
('20121209123358'),
('20121213084931'),
('20130110122628'),
('20130201184705'),
('20130202090625'),
('20130207175206'),
('20130207181455'),
('20130215073721'),
('20130215111127'),
('20130215111141'),
('20130217094251'),
('20130602092539'),
('20130710182539'),
('20130713104233'),
('20130713111657'),
('20130729070143'),
('20130911193200'),
('20131004113137'),
('20131005100610'),
('20131124175346'),
('20131210180802'),
('20131214094309'),
('20131215104612'),
('20131218183023'),
('20140228130325'),
('20140903143914'),
('20140920094058'),
('20141029181752'),
('20141029181824'),
('20141109112308'),
('20141122124142'),
('20150113194759'),
('20150113211532'),
('20150113213922'),
('20150113213955'),
('20150208105930'),
('20150510083747'),
('20150525103953'),
('20150526183158'),
('20150528084820'),
('20150528092912'),
('20150528093249'),
('20150725112753'),
('20150730122707'),
('20150730122735'),
('20150921204850'),
('20150921210243'),
('20151020182334'),
('20151020182731'),
('20151021184614'),
('20151021185456'),
('20151021190616'),
('20151024082034'),
('20151025072118'),
('20151031095005'),
('20160404080304'),
('20160416072926'),
('20160529063352'),
('21'),
('22'),
('23'),
('24'),
('25'),
('26'),
('27'),
('28'),
('29'),
('3'),
('30'),
('31'),
('32'),
('33'),
('34'),
('35'),
('36'),
('37'),
('38'),
('39'),
('4'),
('40'),
('41'),
('42'),
('43'),
('44'),
('45'),
('46'),
('47'),
('48'),
('49'),
('5'),
('50'),
('51'),
('52'),
('53'),
('54'),
('55'),
('56'),
('57'),
('58'),
('59'),
('6'),
('60'),
('61'),
('62'),
('63'),
('64'),
('65'),
('66'),
('67'),
('68'),
('69'),
('7'),
('70'),
('71'),
('72'),
('73'),
('74'),
('75'),
('76'),
('77'),
('78'),
('79'),
('8'),
('80'),
('81'),
('82'),
('83'),
('84'),
('85'),
('86'),
('87'),
('88'),
('89'),
('9'),
('90'),
('91'),
('92'),
('93'),
('94'),
('95'),
('96'),
('97'),
('98'),
('99');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `updated_on`) VALUES
(1, 'ui_theme', '', '2016-09-11 22:37:52'),
(2, 'default_language', 'en', '2016-09-11 21:22:13'),
(3, 'force_default_language_for_anonymous', '1', '2016-09-11 22:37:52'),
(4, 'force_default_language_for_loggedin', '1', '2016-09-11 22:37:52'),
(5, 'start_of_week', '', '2016-09-11 21:22:13'),
(6, 'date_format', '', '2016-09-11 21:22:13'),
(7, 'time_format', '', '2016-09-11 21:22:13'),
(8, 'user_format', 'firstname_lastname', '2016-09-11 21:22:13'),
(9, 'gravatar_enabled', '0', '2016-09-11 23:59:04'),
(10, 'gravatar_default', '', '2016-09-11 21:22:14'),
(11, 'thumbnails_enabled', '1', '2016-09-11 22:37:52'),
(12, 'thumbnails_size', '100', '2016-09-11 21:22:14'),
(13, 'new_item_menu_tab', '2', '2016-09-11 21:22:14'),
(14, 'app_title', 'Tân Phát', '2016-09-11 22:36:27'),
(15, 'welcome_text', '', '2016-09-11 21:42:33'),
(16, 'per_page_options', '25,50,100', '2016-09-11 21:42:33'),
(17, 'search_results_per_page', '10', '2016-09-11 21:42:33'),
(18, 'activity_days_default', '30', '2016-09-11 21:42:33'),
(19, 'host_name', 'localhost:3000', '2016-09-11 21:42:33'),
(20, 'protocol', 'http', '2016-09-11 21:42:33'),
(21, 'text_formatting', 'markdown', '2016-09-11 21:42:33'),
(22, 'cache_formatted_text', '0', '2016-09-11 21:42:33'),
(23, 'wiki_compression', 'gzip', '2016-09-11 22:35:10'),
(24, 'feeds_limit', '15', '2016-09-11 21:42:33'),
(25, 'cross_project_issue_relations', '0', '2016-09-11 21:43:43'),
(26, 'link_copied_issue', 'no', '2016-09-11 22:34:17'),
(27, 'cross_project_subtasks', 'tree', '2016-09-11 21:43:43'),
(28, 'issue_group_assignment', '0', '2016-09-11 21:43:43'),
(29, 'default_issue_start_date_to_creation_date', '1', '2016-09-11 21:43:44'),
(30, 'display_subprojects_issues', '1', '2016-09-11 21:43:44'),
(31, 'issue_done_ratio', 'issue_field', '2016-09-11 21:43:44'),
(32, 'non_working_week_days', '---\n- \'7\'\n', '2016-09-11 21:43:44'),
(33, 'issues_export_limit', '500', '2016-09-11 21:43:44'),
(34, 'gantt_items_limit', '500', '2016-09-11 21:43:44'),
(35, 'parent_issue_dates', 'derived', '2016-09-11 21:43:44'),
(36, 'parent_issue_priority', 'derived', '2016-09-11 21:43:44'),
(37, 'parent_issue_done_ratio', 'derived', '2016-09-11 21:43:44'),
(38, 'issue_list_default_columns', '---\n- tracker\n- status\n- subject\n- assigned_to\n- start_date\n- due_date\n- estimated_hours\n- author\n', '2016-09-11 23:56:35'),
(39, 'issue_list_default_totals', '---\n- estimated_hours\n', '2016-09-11 22:34:17'),
(40, 'rest_api_enabled', '1', '2016-09-11 22:34:23'),
(41, 'jsonp_enabled', '1', '2016-09-11 22:34:24'),
(42, 'enabled_scm', '---\n- Subversion\n- Darcs\n- Mercurial\n- Cvs\n- Bazaar\n- Git\n- Filesystem\n', '2016-09-11 23:58:58'),
(43, 'autofetch_changesets', '1', '2016-09-11 23:58:58'),
(44, 'sys_api_enabled', '0', '2016-09-11 23:58:58'),
(45, 'repository_log_display_limit', '100', '2016-09-11 23:58:58'),
(46, 'commit_ref_keywords', 'refs,references,IssueID', '2016-09-11 23:58:58'),
(47, 'commit_cross_project_ref', '0', '2016-09-11 23:58:58'),
(48, 'commit_logtime_enabled', '0', '2016-09-11 23:58:58'),
(49, 'commit_update_keywords', '--- []\n', '2016-09-11 23:58:58'),
(50, 'default_projects_public', '1', '2016-09-11 23:59:43'),
(51, 'default_projects_modules', '---\n- issue_tracking\n- time_tracking\n- news\n- documents\n- files\n- wiki\n- repository\n- boards\n- calendar\n- gantt\n', '2016-09-11 23:59:43'),
(52, 'default_projects_tracker_ids', '---\n- \'5\'\n- \'6\'\n- \'1\'\n- \'3\'\n', '2016-09-11 23:59:43'),
(53, 'sequential_project_identifiers', '0', '2016-09-11 23:59:43');

-- --------------------------------------------------------

--
-- Table structure for table `time_entries`
--

CREATE TABLE `time_entries` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `hours` float NOT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  `spent_on` date NOT NULL,
  `tyear` int(11) NOT NULL,
  `tmonth` int(11) NOT NULL,
  `tweek` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `action` varchar(30) NOT NULL DEFAULT '',
  `value` varchar(40) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `action`, `value`, `created_on`, `updated_on`) VALUES
(4, 1, 'feeds', '3bfc51e2674fcdabdcee68693b60bfe1cdc47d94', '2016-09-11 21:20:22', '2016-09-11 21:20:22'),
(7, 5, 'feeds', '3e61462600458e466a909d5148628e6ca428cdec', '2016-09-11 21:50:17', '2016-09-11 21:50:17'),
(12, 1, 'session', '70db51ec5ee52e34a6605389cdbf672266fbb9e2', '2016-09-11 23:14:21', '2016-09-12 00:00:12'),
(14, 7, 'feeds', '3b9ec2fb6249d33e3522600a933b99d53cb6dc3f', '2016-09-11 23:47:40', '2016-09-11 23:47:40'),
(15, 5, 'session', 'e8e434e0ab9ad7bdcc13af8b6847faf15fb8beee', '2016-09-11 23:51:38', '2016-09-12 00:13:58'),
(16, 5, 'session', '41eda5815bd49d76bca38c87f36b7414d858d3bd', '2016-09-12 08:24:26', '2016-09-12 08:52:13');

-- --------------------------------------------------------

--
-- Table structure for table `trackers`
--

CREATE TABLE `trackers` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `is_in_chlog` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `is_in_roadmap` tinyint(1) NOT NULL DEFAULT '1',
  `fields_bits` int(11) DEFAULT '0',
  `default_status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trackers`
--

INSERT INTO `trackers` (`id`, `name`, `is_in_chlog`, `position`, `is_in_roadmap`, `fields_bits`, `default_status_id`) VALUES
(1, 'Feature', 0, 3, 1, 0, 1),
(3, 'Support', 0, 4, 1, 0, 1),
(5, 'Task', 0, 1, 1, 0, 1),
(6, 'Bug', 0, 2, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL DEFAULT '',
  `hashed_password` varchar(40) NOT NULL DEFAULT '',
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `last_login_on` datetime DEFAULT NULL,
  `language` varchar(5) DEFAULT '',
  `auth_source_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `identity_url` varchar(255) DEFAULT NULL,
  `mail_notification` varchar(255) NOT NULL DEFAULT '',
  `salt` varchar(64) DEFAULT NULL,
  `must_change_passwd` tinyint(1) NOT NULL DEFAULT '0',
  `passwd_changed_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `hashed_password`, `firstname`, `lastname`, `admin`, `status`, `last_login_on`, `language`, `auth_source_id`, `created_on`, `updated_on`, `type`, `identity_url`, `mail_notification`, `salt`, `must_change_passwd`, `passwd_changed_on`) VALUES
(1, 'admin', '10c763b323bb91d347810d95e55a0ddc573d1fc3', 'Redmine', 'Admin', 1, 1, '2016-09-11 23:14:21', 'en', NULL, '2016-09-11 20:25:53', '2016-09-11 21:33:24', 'User', NULL, 'all', 'd8108e0c6f9e57c4aa050a9347bd502b', 0, '2016-09-11 21:20:14'),
(2, '', '', '', 'Anonymous users', 0, 1, NULL, '', NULL, '2016-09-11 20:28:51', '2016-09-11 20:28:51', 'GroupAnonymous', NULL, '', NULL, 0, NULL),
(3, '', '', '', 'Non member users', 0, 1, NULL, '', NULL, '2016-09-11 20:28:52', '2016-09-11 20:28:52', 'GroupNonMember', NULL, '', NULL, 0, NULL),
(4, '', '', '', 'Anonymous', 0, 0, NULL, '', NULL, '2016-09-11 21:01:49', '2016-09-11 21:01:49', 'AnonymousUser', NULL, 'only_my_events', NULL, 0, NULL),
(5, 'khoipk', 'ac180fc6f6558a4ae7007f6d9256ad6faf0b0cdc', 'Pham Ky', ' Khoi', 0, 1, '2016-09-12 08:24:24', 'en', NULL, '2016-09-11 21:49:42', '2016-09-11 21:49:42', 'User', NULL, 'only_my_events', '71db2d4ae01020237de9c21bdd48c5fe', 0, '2016-09-11 21:49:42'),
(6, 'quyenna', 'b6d0faa9ee8d1b4685a876e79c641ddaad9b4287', 'Nguyen Thi', 'Ai Quyen', 0, 1, NULL, 'en', NULL, '2016-09-11 23:42:21', '2016-09-11 23:42:21', 'User', NULL, 'only_my_events', '182001cb63a9ed25d2d35f6b53863ac1', 0, '2016-09-11 23:42:21'),
(7, 'dungda', '347e5677802656258a83013a983016359de78517', 'Dao Anh ', 'Dung', 0, 1, '2016-09-11 23:47:39', 'en', NULL, '2016-09-11 23:43:22', '2016-09-11 23:47:24', 'User', NULL, 'only_my_events', 'aada95e4936c693c8689c587fb0b9aab', 0, '2016-09-11 23:43:22');

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `others` text,
  `hide_mail` tinyint(1) DEFAULT '1',
  `time_zone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `user_id`, `others`, `hide_mail`, `time_zone`) VALUES
(1, 1, '---\n:no_self_notified: \'1\'\n:gantt_zoom: 2\n:gantt_months: 6\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n', 1, ''),
(2, 5, '---\n:no_self_notified: \'1\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:gantt_zoom: 2\n:gantt_months: 6\n', 1, ''),
(3, 6, '---\n:no_self_notified: \'1\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n', 1, ''),
(4, 7, '---\n:no_self_notified: \'1\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE `versions` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `wiki_page_title` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'open',
  `sharing` varchar(255) NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `watchers`
--

CREATE TABLE `watchers` (
  `id` int(11) NOT NULL,
  `watchable_type` varchar(255) NOT NULL DEFAULT '',
  `watchable_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `watchers`
--

INSERT INTO `watchers` (`id`, `watchable_type`, `watchable_id`, `user_id`) VALUES
(1, 'WikiPage', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `wikis`
--

CREATE TABLE `wikis` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `start_page` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wikis`
--

INSERT INTO `wikis` (`id`, `project_id`, `start_page`, `status`) VALUES
(3, 3, 'Wiki', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_contents`
--

CREATE TABLE `wiki_contents` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` longtext,
  `comments` varchar(1024) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_contents`
--

INSERT INTO `wiki_contents` (`id`, `page_id`, `author_id`, `text`, `comments`, `updated_on`, `version`) VALUES
(1, 1, 1, '## Wiki', '', '2016-09-11 22:47:06', 2);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_content_versions`
--

CREATE TABLE `wiki_content_versions` (
  `id` int(11) NOT NULL,
  `wiki_content_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `data` longblob,
  `compression` varchar(6) DEFAULT '',
  `comments` varchar(1024) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_content_versions`
--

INSERT INTO `wiki_content_versions` (`id`, `wiki_content_id`, `page_id`, `author_id`, `data`, `compression`, `comments`, `updated_on`, `version`) VALUES
(1, 1, 1, 1, 0x78da535608cfccce0400054e01d8, 'gzip', '', '2016-09-11 22:46:53', 1),
(2, 1, 1, 1, 0x78da53565608cfccce0400064401fb, 'gzip', '', '2016-09-11 22:47:06', 2);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_pages`
--

CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_pages`
--

INSERT INTO `wiki_pages` (`id`, `wiki_id`, `title`, `created_on`, `protected`, `parent_id`) VALUES
(1, 3, 'Wiki', '2016-09-11 22:46:52', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_redirects`
--

CREATE TABLE `wiki_redirects` (
  `id` int(11) NOT NULL,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `redirects_to` varchar(255) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `redirects_to_wiki_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workflows`
--

CREATE TABLE `workflows` (
  `id` int(11) NOT NULL,
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  `old_status_id` int(11) NOT NULL DEFAULT '0',
  `new_status_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `assignee` tinyint(1) NOT NULL DEFAULT '0',
  `author` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(30) DEFAULT NULL,
  `field_name` varchar(30) DEFAULT NULL,
  `rule` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `workflows`
--

INSERT INTO `workflows` (`id`, `tracker_id`, `old_status_id`, `new_status_id`, `role_id`, `assignee`, `author`, `type`, `field_name`, `rule`) VALUES
(1, 1, 0, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(2, 1, 0, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(3, 1, 0, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(4, 1, 0, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(5, 1, 0, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(6, 1, 0, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(7, 1, 0, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(8, 1, 0, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(9, 1, 1, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(10, 1, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(11, 1, 1, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(12, 1, 1, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(13, 1, 1, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(14, 1, 1, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(15, 1, 1, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(16, 1, 1, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(17, 1, 2, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(18, 1, 2, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(19, 1, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(20, 1, 2, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(21, 1, 2, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(22, 1, 2, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(23, 1, 2, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(24, 1, 2, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(25, 1, 3, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(26, 1, 3, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(27, 1, 3, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(28, 1, 3, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(29, 1, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(30, 1, 3, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(31, 1, 3, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(32, 1, 3, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(33, 1, 4, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(34, 1, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(35, 1, 4, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(36, 1, 4, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(37, 1, 4, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(38, 1, 4, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(39, 1, 4, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(40, 1, 4, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(41, 1, 5, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(42, 1, 5, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(43, 1, 5, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(44, 1, 5, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(45, 1, 5, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(46, 1, 5, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(47, 1, 5, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(48, 1, 5, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(49, 1, 6, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(50, 1, 6, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(51, 1, 6, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(52, 1, 6, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(53, 1, 6, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(54, 1, 6, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(55, 1, 6, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(56, 1, 6, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(57, 1, 7, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(58, 1, 7, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(59, 1, 7, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(60, 1, 7, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(61, 1, 7, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(62, 1, 7, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(63, 1, 7, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(64, 1, 7, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(65, 1, 8, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(66, 1, 8, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(67, 1, 8, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(68, 1, 8, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(69, 1, 8, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(70, 1, 8, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(71, 1, 8, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(72, 1, 8, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(73, 3, 0, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(74, 3, 0, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(75, 3, 0, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(76, 3, 0, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(77, 3, 0, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(78, 3, 0, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(79, 3, 0, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(80, 3, 0, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(81, 3, 1, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(82, 3, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(83, 3, 1, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(84, 3, 1, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(85, 3, 1, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(86, 3, 1, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(87, 3, 1, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(88, 3, 1, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(89, 3, 2, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(90, 3, 2, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(91, 3, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(92, 3, 2, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(93, 3, 2, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(94, 3, 2, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(95, 3, 2, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(96, 3, 2, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(97, 3, 3, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(98, 3, 3, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(99, 3, 3, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(100, 3, 3, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(101, 3, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(102, 3, 3, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(103, 3, 3, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(104, 3, 3, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(105, 3, 4, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(106, 3, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(107, 3, 4, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(108, 3, 4, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(109, 3, 4, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(110, 3, 4, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(111, 3, 4, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(112, 3, 4, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(113, 3, 5, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(114, 3, 5, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(115, 3, 5, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(116, 3, 5, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(117, 3, 5, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(118, 3, 5, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(119, 3, 5, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(120, 3, 5, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(121, 3, 6, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(122, 3, 6, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(123, 3, 6, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(124, 3, 6, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(125, 3, 6, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(126, 3, 6, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(127, 3, 6, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(128, 3, 6, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(129, 3, 7, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(130, 3, 7, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(131, 3, 7, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(132, 3, 7, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(133, 3, 7, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(134, 3, 7, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(135, 3, 7, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(136, 3, 7, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(137, 3, 8, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(138, 3, 8, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(139, 3, 8, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(140, 3, 8, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(141, 3, 8, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(142, 3, 8, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(143, 3, 8, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(144, 3, 8, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(145, 5, 0, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(146, 5, 0, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(147, 5, 0, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(148, 5, 0, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(149, 5, 0, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(150, 5, 0, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(151, 5, 0, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(152, 5, 0, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(153, 5, 1, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(154, 5, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(155, 5, 1, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(156, 5, 1, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(157, 5, 1, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(158, 5, 1, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(159, 5, 1, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(160, 5, 1, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(161, 5, 2, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(162, 5, 2, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(163, 5, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(164, 5, 2, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(165, 5, 2, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(166, 5, 2, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(167, 5, 2, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(168, 5, 2, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(169, 5, 3, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(170, 5, 3, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(171, 5, 3, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(172, 5, 3, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(173, 5, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(174, 5, 3, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(175, 5, 3, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(176, 5, 3, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(177, 5, 4, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(178, 5, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(179, 5, 4, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(180, 5, 4, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(181, 5, 4, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(182, 5, 4, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(183, 5, 4, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(184, 5, 4, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(185, 5, 5, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(186, 5, 5, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(187, 5, 5, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(188, 5, 5, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(189, 5, 5, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(190, 5, 5, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(191, 5, 5, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(192, 5, 5, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(193, 5, 6, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(194, 5, 6, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(195, 5, 6, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(196, 5, 6, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(197, 5, 6, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(198, 5, 6, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(199, 5, 6, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(200, 5, 6, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(201, 5, 7, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(202, 5, 7, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(203, 5, 7, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(204, 5, 7, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(205, 5, 7, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(206, 5, 7, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(207, 5, 7, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(208, 5, 7, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(209, 5, 8, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(210, 5, 8, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(211, 5, 8, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(212, 5, 8, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(213, 5, 8, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(214, 5, 8, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(215, 5, 8, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(216, 5, 8, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(217, 6, 0, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(218, 6, 0, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(219, 6, 0, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(220, 6, 0, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(221, 6, 0, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(222, 6, 0, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(223, 6, 0, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(224, 6, 0, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(225, 6, 1, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(226, 6, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(227, 6, 1, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(228, 6, 1, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(229, 6, 1, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(230, 6, 1, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(231, 6, 1, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(232, 6, 1, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(233, 6, 2, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(234, 6, 2, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(235, 6, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(236, 6, 2, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(237, 6, 2, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(238, 6, 2, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(239, 6, 2, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(240, 6, 2, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(241, 6, 3, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(242, 6, 3, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(243, 6, 3, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(244, 6, 3, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(245, 6, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(246, 6, 3, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(247, 6, 3, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(248, 6, 3, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(249, 6, 4, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(250, 6, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(251, 6, 4, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(252, 6, 4, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(253, 6, 4, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(254, 6, 4, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(255, 6, 4, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(256, 6, 4, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(257, 6, 5, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(258, 6, 5, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(259, 6, 5, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(260, 6, 5, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(261, 6, 5, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(262, 6, 5, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(263, 6, 5, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(264, 6, 5, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(265, 6, 6, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(266, 6, 6, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(267, 6, 6, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(268, 6, 6, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(269, 6, 6, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(270, 6, 6, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(271, 6, 6, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(272, 6, 6, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(273, 6, 7, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(274, 6, 7, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(275, 6, 7, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(276, 6, 7, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(277, 6, 7, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(278, 6, 7, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(279, 6, 7, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(280, 6, 7, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(281, 6, 8, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(282, 6, 8, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(283, 6, 8, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(284, 6, 8, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(285, 6, 8, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(286, 6, 8, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(287, 6, 8, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(288, 6, 8, 8, 3, 0, 0, 'WorkflowTransition', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_attachments_on_author_id` (`author_id`),
  ADD KEY `index_attachments_on_created_on` (`created_on`),
  ADD KEY `index_attachments_on_container_id_and_container_type` (`container_id`,`container_type`);

--
-- Indexes for table `auth_sources`
--
ALTER TABLE `auth_sources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_auth_sources_on_id_and_type` (`id`,`type`);

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boards_project_id` (`project_id`),
  ADD KEY `index_boards_on_last_message_id` (`last_message_id`);

--
-- Indexes for table `changes`
--
ALTER TABLE `changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `changesets_changeset_id` (`changeset_id`);

--
-- Indexes for table `changesets`
--
ALTER TABLE `changesets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `changesets_repos_rev` (`repository_id`,`revision`),
  ADD KEY `index_changesets_on_user_id` (`user_id`),
  ADD KEY `index_changesets_on_repository_id` (`repository_id`),
  ADD KEY `index_changesets_on_committed_on` (`committed_on`),
  ADD KEY `changesets_repos_scmid` (`repository_id`,`scmid`);

--
-- Indexes for table `changesets_issues`
--
ALTER TABLE `changesets_issues`
  ADD UNIQUE KEY `changesets_issues_ids` (`changeset_id`,`issue_id`);

--
-- Indexes for table `changeset_parents`
--
ALTER TABLE `changeset_parents`
  ADD KEY `changeset_parents_changeset_ids` (`changeset_id`),
  ADD KEY `changeset_parents_parent_ids` (`parent_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_comments_on_commented_id_and_commented_type` (`commented_id`,`commented_type`),
  ADD KEY `index_comments_on_author_id` (`author_id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_custom_fields_on_id_and_type` (`id`,`type`);

--
-- Indexes for table `custom_fields_projects`
--
ALTER TABLE `custom_fields_projects`
  ADD UNIQUE KEY `index_custom_fields_projects_on_custom_field_id_and_project_id` (`custom_field_id`,`project_id`);

--
-- Indexes for table `custom_fields_roles`
--
ALTER TABLE `custom_fields_roles`
  ADD UNIQUE KEY `custom_fields_roles_ids` (`custom_field_id`,`role_id`);

--
-- Indexes for table `custom_fields_trackers`
--
ALTER TABLE `custom_fields_trackers`
  ADD UNIQUE KEY `index_custom_fields_trackers_on_custom_field_id_and_tracker_id` (`custom_field_id`,`tracker_id`);

--
-- Indexes for table `custom_field_enumerations`
--
ALTER TABLE `custom_field_enumerations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_values`
--
ALTER TABLE `custom_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_values_customized` (`customized_type`,`customized_id`),
  ADD KEY `index_custom_values_on_custom_field_id` (`custom_field_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_project_id` (`project_id`),
  ADD KEY `index_documents_on_category_id` (`category_id`),
  ADD KEY `index_documents_on_created_on` (`created_on`);

--
-- Indexes for table `email_addresses`
--
ALTER TABLE `email_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_email_addresses_on_user_id` (`user_id`);

--
-- Indexes for table `enabled_modules`
--
ALTER TABLE `enabled_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enabled_modules_project_id` (`project_id`);

--
-- Indexes for table `enumerations`
--
ALTER TABLE `enumerations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_enumerations_on_project_id` (`project_id`),
  ADD KEY `index_enumerations_on_id_and_type` (`id`,`type`);

--
-- Indexes for table `groups_users`
--
ALTER TABLE `groups_users`
  ADD UNIQUE KEY `groups_users_ids` (`group_id`,`user_id`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_items`
--
ALTER TABLE `import_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issues_project_id` (`project_id`),
  ADD KEY `index_issues_on_status_id` (`status_id`),
  ADD KEY `index_issues_on_category_id` (`category_id`),
  ADD KEY `index_issues_on_assigned_to_id` (`assigned_to_id`),
  ADD KEY `index_issues_on_fixed_version_id` (`fixed_version_id`),
  ADD KEY `index_issues_on_tracker_id` (`tracker_id`),
  ADD KEY `index_issues_on_priority_id` (`priority_id`),
  ADD KEY `index_issues_on_author_id` (`author_id`),
  ADD KEY `index_issues_on_created_on` (`created_on`),
  ADD KEY `index_issues_on_root_id_and_lft_and_rgt` (`root_id`,`lft`,`rgt`);

--
-- Indexes for table `issue_categories`
--
ALTER TABLE `issue_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issue_categories_project_id` (`project_id`),
  ADD KEY `index_issue_categories_on_assigned_to_id` (`assigned_to_id`);

--
-- Indexes for table `issue_relations`
--
ALTER TABLE `issue_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_issue_relations_on_issue_from_id_and_issue_to_id` (`issue_from_id`,`issue_to_id`),
  ADD KEY `index_issue_relations_on_issue_from_id` (`issue_from_id`),
  ADD KEY `index_issue_relations_on_issue_to_id` (`issue_to_id`);

--
-- Indexes for table `issue_statuses`
--
ALTER TABLE `issue_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_issue_statuses_on_position` (`position`),
  ADD KEY `index_issue_statuses_on_is_closed` (`is_closed`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journals_journalized_id` (`journalized_id`,`journalized_type`),
  ADD KEY `index_journals_on_user_id` (`user_id`),
  ADD KEY `index_journals_on_journalized_id` (`journalized_id`),
  ADD KEY `index_journals_on_created_on` (`created_on`);

--
-- Indexes for table `journal_details`
--
ALTER TABLE `journal_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journal_details_journal_id` (`journal_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_members_on_user_id_and_project_id` (`user_id`,`project_id`),
  ADD KEY `index_members_on_user_id` (`user_id`),
  ADD KEY `index_members_on_project_id` (`project_id`);

--
-- Indexes for table `member_roles`
--
ALTER TABLE `member_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_member_roles_on_member_id` (`member_id`),
  ADD KEY `index_member_roles_on_role_id` (`role_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_board_id` (`board_id`),
  ADD KEY `messages_parent_id` (`parent_id`),
  ADD KEY `index_messages_on_last_reply_id` (`last_reply_id`),
  ADD KEY `index_messages_on_author_id` (`author_id`),
  ADD KEY `index_messages_on_created_on` (`created_on`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_project_id` (`project_id`),
  ADD KEY `index_news_on_author_id` (`author_id`),
  ADD KEY `index_news_on_created_on` (`created_on`);

--
-- Indexes for table `open_id_authentication_associations`
--
ALTER TABLE `open_id_authentication_associations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `open_id_authentication_nonces`
--
ALTER TABLE `open_id_authentication_nonces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_projects_on_lft` (`lft`),
  ADD KEY `index_projects_on_rgt` (`rgt`);

--
-- Indexes for table `projects_trackers`
--
ALTER TABLE `projects_trackers`
  ADD UNIQUE KEY `projects_trackers_unique` (`project_id`,`tracker_id`),
  ADD KEY `projects_trackers_project_id` (`project_id`);

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_queries_on_project_id` (`project_id`),
  ADD KEY `index_queries_on_user_id` (`user_id`);

--
-- Indexes for table `queries_roles`
--
ALTER TABLE `queries_roles`
  ADD UNIQUE KEY `queries_roles_ids` (`query_id`,`role_id`);

--
-- Indexes for table `repositories`
--
ALTER TABLE `repositories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_repositories_on_project_id` (`project_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_managed_roles`
--
ALTER TABLE `roles_managed_roles`
  ADD UNIQUE KEY `index_roles_managed_roles_on_role_id_and_managed_role_id` (`role_id`,`managed_role_id`);

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD UNIQUE KEY `unique_schema_migrations` (`version`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_settings_on_name` (`name`);

--
-- Indexes for table `time_entries`
--
ALTER TABLE `time_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_entries_project_id` (`project_id`),
  ADD KEY `time_entries_issue_id` (`issue_id`),
  ADD KEY `index_time_entries_on_activity_id` (`activity_id`),
  ADD KEY `index_time_entries_on_user_id` (`user_id`),
  ADD KEY `index_time_entries_on_created_on` (`created_on`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_value` (`value`),
  ADD KEY `index_tokens_on_user_id` (`user_id`);

--
-- Indexes for table `trackers`
--
ALTER TABLE `trackers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_users_on_id_and_type` (`id`,`type`),
  ADD KEY `index_users_on_auth_source_id` (`auth_source_id`),
  ADD KEY `index_users_on_type` (`type`);

--
-- Indexes for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_user_preferences_on_user_id` (`user_id`);

--
-- Indexes for table `versions`
--
ALTER TABLE `versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `versions_project_id` (`project_id`),
  ADD KEY `index_versions_on_sharing` (`sharing`);

--
-- Indexes for table `watchers`
--
ALTER TABLE `watchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `watchers_user_id_type` (`user_id`,`watchable_type`),
  ADD KEY `index_watchers_on_user_id` (`user_id`),
  ADD KEY `index_watchers_on_watchable_id_and_watchable_type` (`watchable_id`,`watchable_type`);

--
-- Indexes for table `wikis`
--
ALTER TABLE `wikis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wikis_project_id` (`project_id`);

--
-- Indexes for table `wiki_contents`
--
ALTER TABLE `wiki_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wiki_contents_page_id` (`page_id`),
  ADD KEY `index_wiki_contents_on_author_id` (`author_id`);

--
-- Indexes for table `wiki_content_versions`
--
ALTER TABLE `wiki_content_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wiki_content_versions_wcid` (`wiki_content_id`),
  ADD KEY `index_wiki_content_versions_on_updated_on` (`updated_on`);

--
-- Indexes for table `wiki_pages`
--
ALTER TABLE `wiki_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`),
  ADD KEY `index_wiki_pages_on_wiki_id` (`wiki_id`),
  ADD KEY `index_wiki_pages_on_parent_id` (`parent_id`);

--
-- Indexes for table `wiki_redirects`
--
ALTER TABLE `wiki_redirects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wiki_redirects_wiki_id_title` (`wiki_id`,`title`),
  ADD KEY `index_wiki_redirects_on_wiki_id` (`wiki_id`);

--
-- Indexes for table `workflows`
--
ALTER TABLE `workflows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wkfs_role_tracker_old_status` (`role_id`,`tracker_id`,`old_status_id`),
  ADD KEY `index_workflows_on_old_status_id` (`old_status_id`),
  ADD KEY `index_workflows_on_role_id` (`role_id`),
  ADD KEY `index_workflows_on_new_status_id` (`new_status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_sources`
--
ALTER TABLE `auth_sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `changes`
--
ALTER TABLE `changes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `changesets`
--
ALTER TABLE `changesets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `custom_field_enumerations`
--
ALTER TABLE `custom_field_enumerations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `custom_values`
--
ALTER TABLE `custom_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_addresses`
--
ALTER TABLE `email_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `enabled_modules`
--
ALTER TABLE `enabled_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `enumerations`
--
ALTER TABLE `enumerations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `import_items`
--
ALTER TABLE `import_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `issue_categories`
--
ALTER TABLE `issue_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `issue_relations`
--
ALTER TABLE `issue_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `issue_statuses`
--
ALTER TABLE `issue_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `journal_details`
--
ALTER TABLE `journal_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `member_roles`
--
ALTER TABLE `member_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `open_id_authentication_associations`
--
ALTER TABLE `open_id_authentication_associations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `open_id_authentication_nonces`
--
ALTER TABLE `open_id_authentication_nonces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `repositories`
--
ALTER TABLE `repositories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `time_entries`
--
ALTER TABLE `time_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `trackers`
--
ALTER TABLE `trackers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user_preferences`
--
ALTER TABLE `user_preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `versions`
--
ALTER TABLE `versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `watchers`
--
ALTER TABLE `watchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wikis`
--
ALTER TABLE `wikis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wiki_contents`
--
ALTER TABLE `wiki_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wiki_content_versions`
--
ALTER TABLE `wiki_content_versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wiki_pages`
--
ALTER TABLE `wiki_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wiki_redirects`
--
ALTER TABLE `wiki_redirects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `workflows`
--
ALTER TABLE `workflows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
