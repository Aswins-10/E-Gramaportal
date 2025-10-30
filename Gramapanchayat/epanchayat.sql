-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 25, 2024 at 11:16 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `epanchayat`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_group`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_group_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can view log entry', 1, 'view_logentry'),
(20, 'Can view permission', 2, 'view_permission'),
(21, 'Can view group', 3, 'view_group'),
(22, 'Can view user', 4, 'view_user'),
(23, 'Can view content type', 5, 'view_contenttype'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user_groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user_user_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `django_admin_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-02-06 07:21:53'),
(2, 'auth', '0001_initial', '2021-02-06 07:21:54'),
(3, 'admin', '0001_initial', '2021-02-06 07:21:54'),
(4, 'contenttypes', '0002_remove_content_type_name', '2021-02-06 07:21:55'),
(5, 'auth', '0002_alter_permission_name_max_length', '2021-02-06 07:21:55'),
(6, 'auth', '0003_alter_user_email_max_length', '2021-02-06 07:21:55'),
(7, 'auth', '0004_alter_user_username_opts', '2021-02-06 07:21:55'),
(8, 'auth', '0005_alter_user_last_login_null', '2021-02-06 07:21:55'),
(9, 'auth', '0006_require_contenttypes_0002', '2021-02-06 07:21:55'),
(10, 'sessions', '0001_initial', '2021-02-06 07:21:56'),
(11, 'admin', '0002_logentry_remove_auto_add', '2024-01-18 06:43:31'),
(12, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-18 06:43:31'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2024-01-18 06:43:31'),
(14, 'auth', '0008_alter_user_username_max_length', '2024-01-18 06:43:31'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2024-01-18 06:43:31'),
(16, 'auth', '0010_alter_group_name_max_length', '2024-01-18 06:43:32'),
(17, 'auth', '0011_update_proxy_permissions', '2024-01-18 06:43:32'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2024-01-18 06:43:32');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0b4nwox43hremprzipfwbl6x4bdvr9kd', 'YzM4ODQ3NjFjY2YyOGNjN2Q0MWRlMDFiZTZlNzI1NWFlOGJiODU5Nzp7InV0eXBlIjoicGFyZW50IiwidWlkIjo0fQ==', '2022-05-29 10:35:41'),
('2byrq41mzec2b62eg0b04v93gbzadg20', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4ifQ:1q7skW:cuE262E47gLN9yoXg-Ysgkp1QX7BjmG8QRETISwQ2Vs', '2023-06-24 07:11:01'),
('3ww7y9otjbwg7zeq0fsj3gakwuxql3zf', 'eyJ1aWQiOiIxMDAyIiwidXR5cGUiOiJTdGFmZiJ9:1rSxiN:XSTpoY_XCWREAEjy0XWXTfLrgJTqxyVev7p0jr6YgXk', '2024-02-08 11:16:11'),
('6eh69o4kxhb0s86z1m3w4zl657g46tux', 'NmRmZGZkMTJkN2IwMTdhYTVkMzIzMTc3ZDYzMmU4YjQ5NGI1YzdjMzp7InV0eXBlIjoicGFyZW50IiwidWlkIjo1fQ==', '2022-11-08 03:38:44'),
('7xma4vsx6n42v5koawejrtv4zdkhsaem', 'NmRmZGZkMTJkN2IwMTdhYTVkMzIzMTc3ZDYzMmU4YjQ5NGI1YzdjMzp7InV0eXBlIjoicGFyZW50IiwidWlkIjo1fQ==', '2022-10-16 15:49:30'),
('d7ku8x9cz6ynrg4xqc61rsuzuz0yc5pg', 'eyJ1aWQiOjUsInV0eXBlIjoicGFyZW50In0:1q7VOW:Yb-xVRTmLPkuWJgXOOJ7DHS-IPIT-4cpP4Wqve0kQmM', '2023-06-23 06:14:44'),
('dakiqbkxu8sv0bhv10rsbxysbbcugpq9', 'NmRmZGZkMTJkN2IwMTdhYTVkMzIzMTc3ZDYzMmU4YjQ5NGI1YzdjMzp7InV0eXBlIjoicGFyZW50IiwidWlkIjo1fQ==', '2022-11-07 15:48:56'),
('dhvjyorrgrf934j49kyfjou8qnz9eex5', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4ifQ:1qBB4R:FftJpCBLbyDpOfnX1EjgCBGEGtoeSYwcEbUGWNR6S0E', '2023-07-03 09:21:12'),
('f1hbccvkrtl9cxnz7w7qp8vs44ljv28z', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4ifQ:1qImmq:PSbF-iRKWZtyB91HWNMPXum7weiPYqire5qR2G_fDnY', '2023-07-24 09:02:28'),
('gojnmglerwmcdxu5u68c5dr2xzig5h6d', 'NmRmZGZkMTJkN2IwMTdhYTVkMzIzMTc3ZDYzMmU4YjQ5NGI1YzdjMzp7InV0eXBlIjoicGFyZW50IiwidWlkIjo1fQ==', '2022-05-29 19:31:54'),
('n8dq5n4txdmr93lfdpsbfbom4q6p6xp1', 'YzM4ODQ3NjFjY2YyOGNjN2Q0MWRlMDFiZTZlNzI1NWFlOGJiODU5Nzp7InV0eXBlIjoicGFyZW50IiwidWlkIjo0fQ==', '2021-04-22 07:15:55'),
('nk5vkfmppu5er5043wbeil91t8b8u7to', 'ODU0OWE5MzM1MDA0ZDM0MmViNDNlYjg5N2UyZTcyYzBmYzRhZDJkNzp7InV0eXBlIjoicGFyZW50IiwidWlkIjoxfQ==', '2022-11-19 12:39:47'),
('o0s738mgdpqz3ygjm5jln1gavd8k2bds', 'YzM4ODQ3NjFjY2YyOGNjN2Q0MWRlMDFiZTZlNzI1NWFlOGJiODU5Nzp7InV0eXBlIjoicGFyZW50IiwidWlkIjo0fQ==', '2021-02-23 06:38:19'),
('qpldnzai26vxyn4nzaupoxbwoxzvtp2b', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4ifQ:1qBTDr:cP_R5_NTXAVXeqQifvRMJKblpQyt9qRs6lL48fQx-wM', '2023-07-04 04:44:08'),
('r261xymh4aum0i6g3s7o017aozfqm9m9', 'eyJ1aWQiOjAsInV0eXBlIjoiYWRtaW4ifQ:1qLev9:0ctwnKAwIs6CrhVxVgEN1OzQCPs-imZEYL3rc7--sNM', '2023-08-01 07:14:55'),
('swi3l7xvn41tzwbycwti8fjj3yjij6si', 'NTZjZmUzNDk5YjYxMzc2YWJkNjcxMmQ3YjI3YWJiNjExM2I3NGQ0Zjp7InV0eXBlIjoiYWRtaW4iLCJ1aWQiOjB9', '2022-10-15 05:43:22'),
('u044r4riw1w05036j9sxeiacln4gasyz', 'ODU0OWE5MzM1MDA0ZDM0MmViNDNlYjg5N2UyZTcyYzBmYzRhZDJkNzp7InV0eXBlIjoicGFyZW50IiwidWlkIjoxfQ==', '2023-06-13 04:53:17'),
('wu5vc6hu21lq7t42yz1i7b8jo6c0sup9', 'NmRmZGZkMTJkN2IwMTdhYTVkMzIzMTc3ZDYzMmU4YjQ5NGI1YzdjMzp7InV0eXBlIjoicGFyZW50IiwidWlkIjo1fQ==', '2022-10-23 06:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_applications`
--

CREATE TABLE IF NOT EXISTS `tbl_applications` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `sid` varchar(10) NOT NULL,
  `sname` varchar(100) NOT NULL,
  `rid` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `wardno` varchar(10) NOT NULL,
  `aadharno` varchar(50) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `image` varchar(100) NOT NULL,
  `dte` varchar(10) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_applications`
--

INSERT INTO `tbl_applications` (`aid`, `sid`, `sname`, `rid`, `name`, `address`, `contact`, `wardno`, `aadharno`, `gender`, `image`, `dte`, `status`) VALUES
(1, '2', 'EMS Housing Scheme', '1', 'Anjali Ramachandran', 'Jayasree Nivas, Anari', '8111859742', '11', '567678878888', 'Female', 'pictures/2.jpg', '2024-01-25', 'Rejected'),
(2, '2', 'EMS Housing Scheme', '1', 'Anjali Ramachandran', 'Jayasree Nivas, Anari', '8111859742', '11', '567678878888', 'Female', 'pictures/3.jpg', '2024-01-25', 'Approved'),
(3, '2', 'EMS Housing Scheme', '2', 'Madhu', 'ghgh', '4567678787', '12', '986365565566', 'male', 'pictures/13.jpg', '2024-01-26', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assign`
--

CREATE TABLE IF NOT EXISTS `tbl_assign` (
  `asid` int(10) NOT NULL AUTO_INCREMENT,
  `cid` varchar(10) NOT NULL,
  `sid` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dte` varchar(10) NOT NULL,
  PRIMARY KEY (`asid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_assign`
--

INSERT INTO `tbl_assign` (`asid`, `cid`, `sid`, `name`, `dte`) VALUES
(1, '1', '1002', 'Athira', '2024-01-25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE IF NOT EXISTS `tbl_complaint` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `rid` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `wardno` varchar(10) NOT NULL,
  `dte` varchar(10) NOT NULL,
  `hno` varchar(20) NOT NULL,
  `complaint` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_complaint`
--

INSERT INTO `tbl_complaint` (`cid`, `rid`, `name`, `wardno`, `dte`, `hno`, `complaint`, `image`, `status`) VALUES
(1, '1', 'Anjali Ramachandran', '11', '2024-01-25', '45', 'for road re-constructions', 'pictures/about-2.jpg', 'Approved'),
(2, '2', 'Madhu', '12', '2024-01-26', '45', 'for road re-constructions', 'pictures/22.jpg', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE IF NOT EXISTS `tbl_feedback` (
  `fid` int(10) NOT NULL AUTO_INCREMENT,
  `rid` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dte` varchar(10) NOT NULL,
  `details` varchar(100) NOT NULL,
  `fdte` varchar(10) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_feedback`
--

INSERT INTO `tbl_feedback` (`fid`, `rid`, `name`, `dte`, `details`, `fdte`) VALUES
(1, '1', 'Anjali Ramachandran', '2024-01-25', 'its easily used for all users', '2024-01-24'),
(2, '2', 'Madhu', '2024-01-26', 'et5rh', '2024-01-25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE IF NOT EXISTS `tbl_login` (
  `lid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) NOT NULL,
  `uname` varchar(100) NOT NULL,
  `upass` varchar(50) NOT NULL,
  `utype` varchar(50) NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`lid`, `uid`, `uname`, `upass`, `utype`) VALUES
(1, '1', 'anjali@gmail.com', 'Anjali@94', 'User'),
(2, '0', 'admin@gmail.com', 'admin', 'admin'),
(5, '1002', 'athira@gmail.com', 'Athira@123', 'Staff'),
(6, '2', 'madhu@gmail.com', '1234', 'User');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notice`
--

CREATE TABLE IF NOT EXISTS `tbl_notice` (
  `nid` int(10) NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `dte` varchar(10) NOT NULL,
  `details` varchar(500) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_notice`
--

INSERT INTO `tbl_notice` (`nid`, `subject`, `dte`, `details`) VALUES
(1, 'Gramasabha', '2024-01-25', 'ward 11 grama sabha has to be held');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_scheme`
--

CREATE TABLE IF NOT EXISTS `tbl_scheme` (
  `sid` int(10) NOT NULL AUTO_INCREMENT,
  `sname` varchar(50) NOT NULL,
  `category` varchar(100) NOT NULL,
  `dte` varchar(10) NOT NULL,
  `sdetails` varchar(100) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_scheme`
--

INSERT INTO `tbl_scheme` (`sid`, `sname`, `category`, `dte`, `sdetails`) VALUES
(1, 'Re-construction', 'Safety', '2024-01-30', 'tikghkjhkj'),
(2, 'EMS Housing Scheme', 'Housing Scheme', '2024-01-30', 'The main objective of the Scheme is to improve the quality of life of the Senior Citizens by providi');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_solutions`
--

CREATE TABLE IF NOT EXISTS `tbl_solutions` (
  `stid` int(10) NOT NULL AUTO_INCREMENT,
  `sid` varchar(10) NOT NULL,
  `cid` varchar(10) NOT NULL,
  `asid` varchar(10) NOT NULL,
  `solution` varchar(100) NOT NULL,
  `dte` varchar(10) NOT NULL,
  PRIMARY KEY (`stid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_solutions`
--

INSERT INTO `tbl_solutions` (`stid`, `sid`, `cid`, `asid`, `solution`, `dte`) VALUES
(1, '1002', '1', '1', 'complaint has been solved', '2024-01-25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff`
--

CREATE TABLE IF NOT EXISTS `tbl_staff` (
  `sid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `idno` varchar(50) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `designation` varchar(100) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1003 ;

--
-- Dumping data for table `tbl_staff`
--

INSERT INTO `tbl_staff` (`sid`, `name`, `email`, `idno`, `contact`, `designation`) VALUES
(1002, 'Athira', 'athira@gmail.com', '67', '9061722428', 'Clerk');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `rid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `aadhar` varchar(30) NOT NULL,
  `cno` varchar(12) NOT NULL,
  `wardno` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`rid`, `name`, `email`, `aadhar`, `cno`, `wardno`, `address`) VALUES
(1, 'Anjali Ramachandran', 'anjali@gmail.com', '567678878888', '8111859743', '11', 'Jayasree Nivas, Anari'),
(2, 'Madhu', 'madhu@gmail.com', '986365565566', '4567678787', '12', 'ghgh');
