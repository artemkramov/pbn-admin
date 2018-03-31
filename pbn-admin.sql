-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2018 at 06:29 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pbn-admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth-assignment`
--

CREATE TABLE `auth-assignment` (
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth-assignment`
--

INSERT INTO `auth-assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1469962054),
('content-manager', '51', 1521310042),
('content-manager', '52', 1522075283);

-- --------------------------------------------------------

--
-- Table structure for table `auth-item`
--

CREATE TABLE `auth-item` (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `parentID` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth-item`
--

INSERT INTO `auth-item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`, `parentID`) VALUES
('admin', 1, 'Administrator', NULL, NULL, 1457028578, 1521371436, NULL),
('content', 2, 'Content management', NULL, NULL, 1469903227, 1469903227, ''),
('content-manager', 1, 'Content manager', NULL, NULL, 1521302256, 1521628785, NULL),
('content/menu-types/index', 2, 'Menu type index', NULL, NULL, 1521627790, 1521627790, 'content'),
('content/menu-types/sort', 2, 'Menu type sort', NULL, NULL, 1521627819, 1521627819, 'content'),
('content/menus', 2, 'Menu management', NULL, NULL, 1521627703, 1521627703, 'content'),
('content/pages', 2, 'Blog management', NULL, NULL, 1521627054, 1521627054, 'content'),
('content/templates', 2, 'Template management', NULL, NULL, 1521371423, 1521371423, 'content'),
('i18n', 2, 'Translation management', NULL, NULL, 1464245784, 1464245784, NULL),
('permit/access', 2, 'Role and permission management', NULL, NULL, 1457031451, 1457031915, NULL),
('settings', 2, 'Settings management', NULL, NULL, 1467648490, 1467819771, ''),
('settings/websites', 2, 'Website management', NULL, NULL, 1521364623, 1521364623, 'settings'),
('supervisor', 1, 'Superviser Publisher', NULL, NULL, 1522494058, 1522494864, NULL),
('users', 2, 'User management', NULL, NULL, 1457028692, 1457031410, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth-item-child`
--

CREATE TABLE `auth-item-child` (
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth-item-child`
--

INSERT INTO `auth-item-child` (`parent`, `child`) VALUES
('admin', 'content'),
('admin', 'content/templates'),
('admin', 'i18n'),
('admin', 'permit/access'),
('admin', 'settings'),
('admin', 'settings/websites'),
('admin', 'users'),
('content-manager', 'content/menu-types/index'),
('content-manager', 'content/menu-types/sort'),
('content-manager', 'content/menus'),
('content-manager', 'content/pages'),
('superviser', 'content/menu-types/index'),
('superviser', 'content/menu-types/sort'),
('superviser', 'content/menus'),
('superviser', 'content/pages'),
('supervisor', 'content/menu-types/index'),
('supervisor', 'content/menu-types/sort'),
('supervisor', 'content/menus'),
('supervisor', 'content/pages');

-- --------------------------------------------------------

--
-- Table structure for table `auth-rule`
--

CREATE TABLE `auth-rule` (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth-rule`
--

INSERT INTO `auth-rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('isAuthor', 'O:19:"app\\rbac\\AuthorRule":3:{s:4:"name";s:8:"isAuthor";s:9:"createdAt";i:1466665166;s:9:"updatedAt";i:1466665166;}', 1466665166, 1466665166),
('isAuthorManyToMany', 'O:29:"app\\rbac\\AuthorManyToManyRule":3:{s:4:"name";s:18:"isAuthorManyToMany";s:9:"createdAt";i:1467467624;s:9:"updatedAt";i:1467467624;}', 1467467624, 1467467624),
('isItself', 'O:19:"app\\rbac\\ItselfRule":3:{s:4:"name";s:8:"isItself";s:9:"createdAt";i:1467465859;s:9:"updatedAt";i:1467465859;}', 1467465859, 1467465859);

-- --------------------------------------------------------

--
-- Table structure for table `lang`
--

CREATE TABLE `lang` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `local` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `default` smallint(6) NOT NULL DEFAULT '0',
  `dateUpdated` int(11) NOT NULL,
  `dateCreated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lang`
--

INSERT INTO `lang` (`id`, `url`, `local`, `name`, `default`, `dateUpdated`, `dateCreated`) VALUES
(1, 'en', 'en_EN', 'English', 1, 1463386881, 1463386881);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sort` int(11) NOT NULL DEFAULT '0',
  `parentID` int(11) DEFAULT NULL,
  `pageID` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `menuTypeID` int(11) NOT NULL,
  `isEnabled` tinyint(1) NOT NULL DEFAULT '1',
  `isDirect` tinyint(1) NOT NULL DEFAULT '0',
  `isNewTab` tinyint(1) NOT NULL DEFAULT '0',
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `websiteID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `dateCreated`, `dateModified`, `sort`, `parentID`, `pageID`, `image`, `url`, `menuTypeID`, `isEnabled`, `isDirect`, `isNewTab`, `isDeleted`, `websiteID`) VALUES
(2, '0000-00-00 00:00:00', '2018-03-19 14:35:24', 0, NULL, 2, NULL, NULL, 2, 1, 0, 0, 0, 1),
(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 3, NULL, NULL, 1, 1, 0, 0, 0, 1),
(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 2, 4, NULL, NULL, 1, 1, 0, 0, 0, 1),
(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 4, 5, NULL, NULL, 1, 1, 0, 0, 0, 1),
(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, 2, NULL, NULL, 2, 1, 0, 0, 0, 1),
(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, NULL, NULL, NULL, '/user', 2, 1, 1, 0, 0, 1),
(9, '2018-03-28 09:00:56', '2018-03-29 07:13:32', 0, NULL, NULL, NULL, '#', 4, 1, 0, 0, 0, 3),
(10, '2018-03-28 09:02:12', '2018-03-29 07:13:32', 1, NULL, 9, NULL, NULL, 4, 1, 0, 0, 0, 3),
(11, '2018-03-28 09:14:52', '2018-03-28 09:55:06', 0, NULL, 8, NULL, NULL, 5, 1, 0, 0, 0, 3),
(12, '2018-03-28 09:15:07', '2018-03-28 09:15:39', 1, NULL, NULL, NULL, NULL, 5, 1, 0, 0, 0, 3),
(13, '2018-03-28 09:15:25', '2018-03-28 09:15:58', 2, NULL, NULL, NULL, NULL, 5, 1, 0, 0, 0, 3),
(14, '2018-03-28 09:16:25', '2018-03-28 09:16:25', 4, NULL, NULL, NULL, NULL, 5, 1, 0, 0, 0, 3),
(15, '2018-03-28 09:27:06', '2018-03-30 10:23:37', 3, NULL, 10, NULL, NULL, 4, 1, 0, 0, 0, 3),
(16, '2018-03-28 09:31:52', '2018-03-30 10:23:37', 2, NULL, 11, NULL, NULL, 4, 1, 0, 0, 0, 3),
(17, '2018-03-28 09:38:49', '2018-03-30 10:23:37', 4, NULL, 12, NULL, NULL, 4, 1, 0, 0, 0, 3),
(18, '2018-03-28 09:46:49', '2018-03-28 09:46:49', 6, NULL, 13, NULL, NULL, 5, 1, 0, 0, 0, 3),
(19, '2018-03-28 09:51:17', '2018-03-28 09:51:17', 6, NULL, 14, NULL, NULL, 5, 1, 0, 0, 0, 3),
(20, '2018-03-31 08:06:34', '2018-03-31 08:06:34', 0, NULL, 17, NULL, NULL, 6, 1, 0, 0, 0, 4),
(21, '2018-03-31 08:08:44', '2018-03-31 08:36:34', 1, NULL, 19, NULL, NULL, 6, 1, 0, 0, 0, 4),
(22, '2018-03-31 08:09:12', '2018-03-31 08:47:53', 3, NULL, 21, NULL, NULL, 6, 1, 0, 0, 0, 4),
(23, '2018-03-31 08:09:35', '2018-03-31 08:46:58', 0, 22, 22, NULL, NULL, 6, 1, 0, 0, 0, 4),
(24, '2018-03-31 08:20:16', '2018-03-31 08:47:13', 4, NULL, 23, NULL, NULL, 6, 1, 0, 0, 0, 4),
(25, '2018-03-31 08:47:31', '2018-03-31 08:47:53', 2, NULL, 20, NULL, NULL, 6, 1, 0, 0, 0, 4),
(26, '2018-03-31 14:25:11', '2018-03-31 14:32:19', 0, NULL, 31, NULL, NULL, 8, 1, 0, 0, 0, 5),
(27, '2018-03-31 14:25:40', '2018-03-31 14:32:19', 0, 26, 32, NULL, NULL, 8, 1, 0, 0, 0, 5),
(28, '2018-03-31 14:26:06', '2018-03-31 14:32:19', 1, 26, 33, NULL, NULL, 8, 1, 0, 0, 0, 5),
(29, '2018-03-31 14:26:34', '2018-03-31 14:32:19', 1, NULL, 34, NULL, NULL, 8, 1, 0, 0, 0, 5),
(30, '2018-03-31 14:26:53', '2018-03-31 14:32:20', 2, NULL, 35, NULL, NULL, 8, 1, 0, 0, 0, 5),
(31, '2018-03-31 14:27:22', '2018-03-31 14:32:20', 3, NULL, 36, NULL, NULL, 8, 1, 0, 0, 0, 5),
(32, '2018-03-31 14:27:46', '2018-03-31 14:32:20', 0, 31, 38, NULL, NULL, 8, 1, 0, 0, 0, 5),
(33, '2018-03-31 14:28:12', '2018-03-31 14:32:20', 0, 32, 39, NULL, NULL, 8, 1, 0, 0, 0, 5),
(34, '2018-03-31 14:28:48', '2018-03-31 14:32:20', 1, 32, 40, NULL, NULL, 8, 1, 0, 0, 0, 5),
(35, '2018-03-31 14:29:08', '2018-03-31 14:32:20', 1, 31, 37, NULL, NULL, 8, 1, 0, 0, 0, 5),
(36, '2018-03-31 14:29:32', '2018-03-31 14:32:20', 4, NULL, 41, NULL, NULL, 8, 1, 0, 0, 0, 5),
(37, '2018-03-31 14:29:50', '2018-03-31 14:32:20', 0, 36, 42, NULL, NULL, 8, 1, 0, 0, 0, 5),
(38, '2018-03-31 14:30:21', '2018-03-31 14:32:20', 5, NULL, 43, NULL, NULL, 8, 1, 0, 0, 0, 5),
(39, '2018-03-31 14:30:39', '2018-03-31 14:32:20', 6, NULL, 44, NULL, NULL, 8, 1, 0, 0, 0, 5),
(40, '2018-03-31 14:30:59', '2018-03-31 14:32:20', 7, NULL, 45, NULL, NULL, 8, 1, 0, 0, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `menu-language`
--

CREATE TABLE `menu-language` (
  `id` int(11) NOT NULL,
  `menuID` int(11) NOT NULL,
  `language` varchar(2) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu-language`
--

INSERT INTO `menu-language` (`id`, `menuID`, `language`, `title`) VALUES
(3, 3, 'en', 'Contact us'),
(4, 4, 'en', 'Submenu'),
(5, 6, 'en', 'Follow us'),
(6, 5, 'en', 'Subsubmenu'),
(7, 7, 'en', 'Login/Register'),
(15, 9, 'en', 'Startseite'),
(16, 10, 'en', 'Nachhilfe-Vermittlung'),
(17, 11, 'en', 'Home'),
(18, 12, 'en', 'Suche'),
(19, 13, 'en', 'News und Infos'),
(20, 14, 'en', 'Nachhilfe-Vermittlung'),
(21, 15, 'en', 'Nachhilfeschulen'),
(22, 16, 'en', 'News und Infos'),
(23, 17, 'en', 'Suche'),
(24, 18, 'en', 'Über uns'),
(25, 19, 'en', 'Kontakt'),
(26, 20, 'en', 'Home'),
(27, 21, 'en', 'About us'),
(28, 22, 'en', 'Careers'),
(29, 23, 'en', 'Apply'),
(30, 24, 'en', 'News and events'),
(31, 25, 'en', 'Our approach'),
(32, 26, 'en', 'About'),
(33, 27, 'en', 'Mission'),
(34, 28, 'en', 'E-Board'),
(35, 29, 'en', 'News'),
(36, 30, 'en', 'Media'),
(37, 31, 'en', 'Intramural League'),
(38, 32, 'en', 'Teams'),
(39, 33, 'en', 'Bolyston Berserkers'),
(40, 34, 'en', 'Jamaica Plain Jaguars'),
(41, 35, 'en', 'Standings'),
(42, 36, 'en', 'World Cup'),
(43, 37, 'en', 'History'),
(44, 38, 'en', 'Store'),
(45, 39, 'en', 'Get involved'),
(46, 40, 'en', 'Contact');

-- --------------------------------------------------------

--
-- Table structure for table `menu-type`
--

CREATE TABLE `menu-type` (
  `id` int(11) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `websiteID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu-type`
--

INSERT INTO `menu-type` (`id`, `alias`, `name`, `isDeleted`, `websiteID`) VALUES
(1, 'header', 'Header menu', 0, 1),
(2, 'footer', 'Footer menu', 0, 1),
(4, 'header', 'Header menu', 0, 3),
(5, 'footer', 'Footer menu', 0, 3),
(6, 'header', 'Header menu', 0, 4),
(7, 'footer', 'Footer menu', 0, 4),
(8, 'header', 'Header menu', 0, 5),
(9, 'footer', 'Footer menu', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(255) NOT NULL DEFAULT '',
  `translation` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `language`, `translation`) VALUES
(537, 'en', ''),
(538, 'en', 'ID'),
(539, 'en', ''),
(540, 'en', ''),
(541, 'en', ''),
(542, 'en', ''),
(543, 'en', ''),
(544, 'en', NULL),
(545, 'en', ''),
(546, 'en', NULL),
(547, 'en', ''),
(548, 'en', ''),
(549, 'en', ''),
(550, 'en', ''),
(551, 'en', ''),
(552, 'en', ''),
(553, 'en', ''),
(554, 'en', ''),
(555, 'en', ''),
(556, 'en', ''),
(557, 'en', ''),
(577, 'en', ''),
(578, 'en', ''),
(579, 'en', ''),
(580, 'en', ''),
(581, 'en', NULL),
(582, 'en', NULL),
(583, 'en', NULL),
(584, 'en', NULL),
(585, 'en', ''),
(586, 'en', ''),
(587, 'en', NULL),
(588, 'en', ''),
(589, 'en', ''),
(590, 'en', ''),
(591, 'en', 'Delete'),
(592, 'en', ''),
(593, 'en', ''),
(594, 'en', ''),
(595, 'en', ''),
(596, 'en', ''),
(597, 'en', ''),
(598, 'en', ''),
(599, 'en', ''),
(600, 'en', ''),
(601, 'en', ''),
(602, 'en', ''),
(603, 'en', ''),
(604, 'en', NULL),
(605, 'en', ''),
(606, 'en', ''),
(607, 'en', ''),
(608, 'en', 'Sign out'),
(609, 'en', 'Enabled'),
(610, 'en', NULL),
(611, 'en', NULL),
(612, 'en', NULL),
(613, 'en', NULL),
(614, 'en', NULL),
(615, 'en', NULL),
(616, 'en', NULL),
(617, 'en', NULL),
(618, 'en', NULL),
(619, 'en', ''),
(620, 'en', ''),
(621, 'en', NULL),
(622, 'en', NULL),
(623, 'en', NULL),
(624, 'en', NULL),
(625, 'en', NULL),
(626, 'en', NULL),
(627, 'en', ''),
(628, 'en', ''),
(629, 'en', NULL),
(630, 'en', NULL),
(631, 'en', NULL),
(632, 'en', NULL),
(633, 'en', ''),
(634, 'en', ''),
(635, 'en', ''),
(636, 'en', ''),
(637, 'en', NULL),
(638, 'en', NULL),
(639, 'en', NULL),
(640, 'en', NULL),
(641, 'en', NULL),
(642, 'en', NULL),
(643, 'en', NULL),
(644, 'en', NULL),
(645, 'en', NULL),
(646, 'en', NULL),
(647, 'en', NULL),
(648, 'en', NULL),
(649, 'en', NULL),
(650, 'en', NULL),
(651, 'en', NULL),
(652, 'en', NULL),
(653, 'en', NULL),
(654, 'en', NULL),
(655, 'en', NULL),
(656, 'en', NULL),
(657, 'en', NULL),
(658, 'en', 'Title'),
(659, 'en', 'Content'),
(660, 'en', 'Sort'),
(661, 'en', ''),
(662, 'en', ''),
(663, 'en', ''),
(664, 'en', ''),
(665, 'en', 'Sort action'),
(666, 'en', ''),
(667, 'en', ''),
(668, 'en', 'Page not found'),
(669, 'en', ''),
(670, 'en', ''),
(671, 'en', ''),
(672, 'en', ''),
(673, 'en', ''),
(674, 'en', ''),
(675, 'en', ''),
(676, 'en', ''),
(677, 'en', ''),
(678, 'en', ''),
(679, 'en', ''),
(680, 'en', ''),
(681, 'en', ''),
(682, 'en', ''),
(683, 'en', ''),
(684, 'en', ''),
(685, 'en', ''),
(686, 'en', ''),
(687, 'en', ''),
(688, 'en', ''),
(689, 'en', ''),
(690, 'en', NULL),
(691, 'en', NULL),
(692, 'en', ''),
(693, 'en', ''),
(694, 'en', ''),
(695, 'en', ''),
(696, 'en', ''),
(697, 'en', ''),
(698, 'en', ''),
(699, 'en', ''),
(700, 'en', ''),
(701, 'en', ''),
(702, 'en', ''),
(703, 'en', ''),
(704, 'en', ''),
(705, 'en', ''),
(706, 'en', ''),
(707, 'en', ''),
(708, 'en', ''),
(709, 'en', ''),
(710, 'en', NULL),
(711, 'en', ''),
(712, 'en', ''),
(713, 'en', ''),
(714, 'en', ''),
(715, 'en', ''),
(716, 'en', ''),
(717, 'en', ''),
(718, 'en', ''),
(719, 'en', ''),
(720, 'en', 'Clear'),
(721, 'en', 'result(s)'),
(722, 'en', ''),
(723, 'en', ''),
(724, 'en', ''),
(725, 'en', ''),
(726, 'en', ''),
(727, 'en', ''),
(728, 'en', ''),
(729, 'en', ''),
(730, 'en', ''),
(731, 'en', ''),
(732, 'en', ''),
(733, 'en', ''),
(734, 'en', ''),
(735, 'en', ''),
(736, 'en', ''),
(737, 'en', ''),
(738, 'en', NULL),
(739, 'en', ''),
(740, 'en', ''),
(741, 'en', ''),
(742, 'en', ''),
(743, 'en', ''),
(744, 'en', ''),
(745, 'en', ''),
(746, 'en', ''),
(747, 'en', ''),
(748, 'en', ''),
(749, 'en', ''),
(750, 'en', ''),
(751, 'en', ''),
(752, 'en', ''),
(753, 'en', ''),
(754, 'en', ''),
(755, 'en', NULL),
(756, 'en', ''),
(757, 'en', ''),
(758, 'en', ''),
(759, 'en', ''),
(760, 'en', 'Price:'),
(761, 'en', ''),
(762, 'en', ''),
(763, 'en', ''),
(764, 'en', ''),
(765, 'en', ''),
(766, 'en', ''),
(767, 'en', NULL),
(768, 'en', ''),
(769, 'en', ''),
(770, 'en', 'Please fill out your email. A link to reset password will be sent there.'),
(771, 'en', ''),
(772, 'en', ''),
(773, 'en', ''),
(774, 'en', ''),
(775, 'en', ''),
(776, 'en', ''),
(777, 'en', ''),
(778, 'en', ''),
(779, 'en', 'Hello, %s. (%s). From your account dashboard you can view your recent orders, manage your shipping and billing addresses and edit your password and account details.'),
(780, 'en', ''),
(781, 'en', ''),
(782, 'en', ''),
(783, 'en', ''),
(784, 'en', ''),
(785, 'en', ''),
(786, 'en', ''),
(787, 'en', ''),
(788, 'en', ''),
(789, 'en', ''),
(790, 'en', ''),
(791, 'en', ''),
(792, 'en', ''),
(793, 'en', ''),
(794, 'en', ''),
(795, 'en', ''),
(796, 'en', ''),
(797, 'en', ''),
(798, 'en', ''),
(799, 'en', ''),
(800, 'en', 'There is no product in your wish list.'),
(801, 'en', ''),
(802, 'en', ''),
(803, 'en', ''),
(804, 'en', ''),
(805, 'en', ''),
(806, 'en', ''),
(807, 'en', ''),
(808, 'en', ''),
(809, 'en', ''),
(810, 'en', ''),
(811, 'en', ''),
(812, 'en', ''),
(813, 'en', ''),
(814, 'en', ''),
(815, 'en', NULL),
(816, 'en', ''),
(817, 'en', ''),
(818, 'en', NULL),
(819, 'en', ''),
(820, 'en', ''),
(821, 'en', 'You have received an order from %s %s. The order is as follows:'),
(822, 'en', ''),
(823, 'en', ''),
(824, 'en', ''),
(825, 'en', ''),
(826, 'en', 'Hi there. Your recent order on Jenadin has been completed. Your order details are shown below for your reference:'),
(827, 'en', ''),
(828, 'en', ''),
(829, 'en', ''),
(830, 'en', ''),
(831, 'en', ''),
(832, 'en', ''),
(833, 'en', ''),
(834, 'en', ''),
(835, 'en', ''),
(836, 'en', ''),
(837, 'en', ''),
(838, 'en', ''),
(839, 'en', NULL),
(840, 'en', NULL),
(841, 'en', ''),
(842, 'en', ''),
(843, 'en', ''),
(844, 'en', ''),
(845, 'en', NULL),
(846, 'en', 'Sale'),
(847, 'en', ''),
(848, 'en', 'Novelties'),
(849, 'en', 'Novelty'),
(850, 'en', ''),
(851, 'en', ''),
(852, 'en', ''),
(853, 'en', ''),
(854, 'en', 'Basket'),
(855, 'en', 'You have added the product to the basket:'),
(856, 'en', ''),
(857, 'en', ''),
(858, 'en', 'Congratulations! You have placed your order. Below is the link to proceed the payment.'),
(859, 'en', ''),
(860, 'en', NULL),
(861, 'en', ''),
(862, 'en', ''),
(863, 'en', ''),
(864, 'en', ''),
(865, 'en', ''),
(866, 'en', NULL),
(867, 'en', ''),
(868, 'en', ''),
(869, 'en', ''),
(870, 'en', 'Nothing was found.'),
(871, 'en', ''),
(872, 'en', NULL),
(873, 'en', NULL),
(874, 'en', NULL),
(875, 'en', NULL),
(876, 'en', NULL),
(877, 'en', NULL),
(878, 'en', 'You have added the product to the basket:'),
(879, 'en', NULL),
(880, 'en', NULL),
(881, 'en', NULL),
(882, 'en', ''),
(883, 'en', ''),
(884, 'en', ''),
(885, 'en', ''),
(886, 'en', ''),
(887, 'en', ''),
(888, 'en', ''),
(889, 'en', ''),
(890, 'en', NULL),
(891, 'en', ''),
(892, 'en', ''),
(893, 'en', NULL),
(894, 'en', ''),
(895, 'en', NULL),
(896, 'en', ''),
(897, 'en', NULL),
(898, 'en', NULL),
(899, 'en', ''),
(900, 'en', NULL),
(901, 'en', NULL),
(902, 'en', ''),
(903, 'en', ''),
(904, 'en', ''),
(905, 'en', ''),
(906, 'en', 'Name'),
(907, 'en', ''),
(908, 'en', 'Novelties'),
(909, 'en', ''),
(910, 'en', ''),
(911, 'en', ''),
(912, 'en', 'Pre-order'),
(913, 'en', 'Your request is accepted. Wait for the notification email when the product will be available.'),
(914, 'en', ''),
(915, 'en', 'The product you have requested is available now!'),
(916, 'en', 'Go to the %s for selling it!'),
(917, 'en', ''),
(918, 'en', ''),
(919, 'en', ''),
(920, 'en', NULL),
(921, 'en', ''),
(922, 'en', NULL),
(923, 'en', ''),
(924, 'en', ''),
(925, 'en', ''),
(926, 'en', ''),
(927, 'en', ''),
(928, 'en', ''),
(929, 'en', ''),
(930, 'en', ''),
(931, 'en', ''),
(932, 'en', ''),
(933, 'en', ''),
(934, 'en', ''),
(935, 'en', ''),
(936, 'en', ''),
(937, 'en', NULL),
(938, 'en', NULL),
(939, 'en', NULL),
(940, 'en', NULL),
(941, 'en', NULL),
(942, 'en', NULL),
(943, 'en', NULL),
(944, 'en', NULL),
(945, 'en', NULL),
(946, 'en', NULL),
(947, 'en', NULL),
(948, 'en', NULL),
(949, 'en', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1522224525),
('m180328_071132_site_common', 1522226260),
('m180331_074043_site_apexmarketingevents', 1522482219),
('m180331_125113_site_emersonquidditch', 1522500741);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `datePublished` date DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sort` int(11) NOT NULL,
  `authorID` int(11) DEFAULT NULL,
  `seoPriority` decimal(10,4) NOT NULL DEFAULT '0.5000',
  `pageTypeID` int(11) DEFAULT NULL,
  `ratingValue` int(11) DEFAULT NULL,
  `ratingCount` int(11) DEFAULT NULL,
  `isPaginationOn` tinyint(1) NOT NULL DEFAULT '0',
  `paginationID` int(11) DEFAULT NULL,
  `paginationPerPage` smallint(6) DEFAULT NULL,
  `showAllPosts` tinyint(1) NOT NULL DEFAULT '0',
  `templateCarcassID` int(11) NOT NULL,
  `templateInnerID` int(11) NOT NULL,
  `isSeoPage` tinyint(1) NOT NULL DEFAULT '0',
  `isVisibleSitemapXml` tinyint(1) NOT NULL DEFAULT '1',
  `isVisibleSitemapHtml` tinyint(1) NOT NULL DEFAULT '1',
  `isMainPage` tinyint(1) NOT NULL DEFAULT '0',
  `isEnabled` tinyint(1) NOT NULL DEFAULT '1',
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `websiteID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `image1`, `image2`, `image3`, `datePublished`, `dateCreated`, `dateModified`, `sort`, `authorID`, `seoPriority`, `pageTypeID`, `ratingValue`, `ratingCount`, `isPaginationOn`, `paginationID`, `paginationPerPage`, `showAllPosts`, `templateCarcassID`, `templateInnerID`, `isSeoPage`, `isVisibleSitemapXml`, `isVisibleSitemapHtml`, `isMainPage`, `isEnabled`, `isDeleted`, `websiteID`) VALUES
(1, NULL, NULL, NULL, '2018-03-15', '0000-00-00 00:00:00', '2018-03-14 22:00:00', 0, NULL, '1.0000', 2, NULL, NULL, 1, 2, 1, 0, 1, 2, 0, 1, 1, 1, 1, 0, 1),
(2, NULL, NULL, NULL, '2018-03-14', '0000-00-00 00:00:00', '2018-03-13 22:00:00', 0, NULL, '0.5000', 2, 4, 5, 1, 1, 1, 0, 1, 3, 0, 1, 1, 0, 1, 0, 1),
(3, NULL, NULL, NULL, '2018-03-15', '0000-00-00 00:00:00', '2018-03-13 22:00:00', 1, NULL, '0.5000', 2, NULL, NULL, 0, NULL, NULL, 0, 1, 3, 0, 1, 1, 0, 1, 0, 1),
(4, NULL, NULL, NULL, '2018-03-15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, '0.5000', 2, NULL, NULL, 0, NULL, NULL, 0, 1, 3, 0, 1, 1, 0, 1, 0, 1),
(5, NULL, NULL, NULL, '2018-03-15', '0000-00-00 00:00:00', '2018-03-13 22:00:00', 3, NULL, '0.5000', 2, NULL, NULL, 0, NULL, NULL, 0, 1, 3, 0, 1, 1, 0, 1, 0, 1),
(6, NULL, NULL, NULL, '2018-03-15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, '0.5000', 2, NULL, NULL, 0, NULL, NULL, 0, 1, 3, 0, 1, 1, 0, 1, 0, 1),
(7, NULL, NULL, NULL, '2018-03-28', '2018-03-28 08:37:40', '2018-03-28 11:20:30', 0, NULL, '0.5000', 11, NULL, NULL, 0, NULL, NULL, 0, 6, 9, 0, 0, 0, 0, 1, 0, 3),
(8, '', '', '', '2018-03-28', '2018-03-28 08:37:40', '2018-03-28 09:07:44', 0, NULL, '0.5000', 8, NULL, NULL, 0, 4, NULL, 0, 10, 9, 0, 0, 0, 1, 1, 0, 3),
(9, '', '', '', '2018-03-28', '2018-03-28 09:17:56', '2018-03-28 09:24:04', 0, 7, '0.5000', 8, NULL, NULL, 0, 4, NULL, 0, 6, 7, 0, 1, 1, 0, 1, 0, 3),
(10, '', '', '', '2018-03-28', '2018-03-28 09:26:39', '2018-03-28 09:26:39', 0, 7, '0.5000', 8, NULL, NULL, 0, 4, NULL, 0, 6, 7, 0, 1, 1, 0, 1, 0, 3),
(11, '', '', '', '2018-03-28', '2018-03-28 09:31:16', '2018-03-28 09:34:10', 0, 7, '0.5000', 8, NULL, NULL, 0, 4, NULL, 0, 11, 12, 0, 1, 1, 0, 1, 0, 3),
(12, '', '', '', '2018-03-28', '2018-03-28 09:37:46', '2018-03-28 09:37:46', 0, 7, '0.5000', 8, NULL, NULL, 0, 4, NULL, 0, 6, 13, 0, 1, 1, 0, 1, 0, 3),
(13, '', '', '', '2018-03-27', '2018-03-28 09:46:13', '2018-03-30 12:35:50', 0, 7, '0.5000', 9, NULL, NULL, 0, 4, NULL, 0, 6, 7, 1, 1, 1, 0, 1, 0, 3),
(14, '', '', '', '2018-03-28', '2018-03-28 09:50:42', '2018-03-28 09:50:42', 0, 7, '0.5000', 8, NULL, NULL, 0, 4, NULL, 0, 14, 7, 0, 1, 1, 0, 1, 0, 3),
(15, '', '', '', '2018-03-29', '2018-03-30 12:37:17', '2018-03-30 12:38:21', 0, 7, '0.5000', 9, NULL, NULL, 0, 4, NULL, 0, 6, 7, 1, 1, 1, 0, 1, 0, 3),
(16, '', '', '', '2018-03-31', '2018-03-31 07:43:38', '2018-03-31 09:39:08', 0, NULL, '0.5000', 15, NULL, NULL, 0, 6, NULL, 0, 15, 18, 0, 0, 0, 0, 1, 0, 4),
(17, '', '', '', '2018-03-31', '2018-03-31 07:43:38', '2018-03-31 08:28:02', 0, NULL, '0.5000', 12, NULL, NULL, 0, 6, NULL, 0, 15, 18, 0, 0, 0, 1, 1, 0, 4),
(18, '', '', '', '2018-03-31', '2018-03-31 08:24:41', '2018-03-31 09:26:27', 0, 16, '0.5000', 13, NULL, NULL, 0, 6, NULL, 0, 15, 17, 0, 1, 1, 0, 1, 0, 4),
(19, '', '', '', '2018-03-31', '2018-03-31 08:36:12', '2018-03-31 08:42:01', 0, 16, '0.5000', 12, NULL, NULL, 0, 6, NULL, 0, 15, 19, 0, 1, 1, 0, 1, 0, 4),
(20, '', '', '', '2018-03-31', '2018-03-31 08:44:19', '2018-03-31 08:44:19', 0, 16, '0.5000', 12, NULL, NULL, 0, 6, NULL, 0, 15, 20, 0, 1, 1, 0, 1, 0, 4),
(21, '', '', '', '2018-03-31', '2018-03-31 08:45:00', '2018-03-31 08:45:00', 0, 16, '0.5000', 12, NULL, NULL, 0, 6, NULL, 0, 15, 21, 0, 1, 1, 0, 1, 0, 4),
(22, '', '', '', '2018-03-31', '2018-03-31 08:45:41', '2018-03-31 08:45:41', 0, 16, '0.5000', 12, NULL, NULL, 0, 6, NULL, 0, 15, 22, 0, 1, 1, 0, 1, 0, 4),
(23, '', '', '', '2018-03-31', '2018-03-31 08:46:17', '2018-03-31 09:04:13', 0, 16, '0.5000', 12, NULL, NULL, 1, 6, NULL, 0, 24, 23, 0, 1, 1, 0, 1, 0, 4),
(24, '', '', '', '2018-03-31', '2018-03-31 09:42:54', '2018-03-31 09:43:15', 0, 16, '0.5000', 13, NULL, NULL, 0, 6, NULL, 0, 15, 17, 0, 1, 1, 0, 1, 0, 4),
(25, '', '', '', '2018-03-31', '2018-03-31 09:56:50', '2018-03-31 11:56:19', 0, 16, '0.5000', 13, NULL, NULL, 0, 6, NULL, 0, 15, 17, 0, 1, 1, 0, 1, 0, 4),
(26, '', '', '', '2018-03-30', '2018-03-31 12:18:50', '2018-03-31 12:31:51', 0, 16, '0.5000', 13, NULL, NULL, 0, 6, NULL, 0, 15, 17, 1, 1, 1, 0, 1, 0, 4),
(27, '', '', '', '2018-03-31', '2018-03-31 12:52:21', '2018-03-31 15:30:27', 0, NULL, '0.5000', 19, NULL, NULL, 1, 8, NULL, 0, 25, 31, 0, 0, 0, 0, 1, 0, 5),
(28, '', '', '', '2018-03-31', '2018-03-31 12:52:21', '2018-03-31 13:25:18', 0, NULL, '0.5000', 16, NULL, NULL, 0, 8, NULL, 0, 29, 28, 0, 0, 0, 1, 1, 0, 5),
(29, '', '', '', '2018-03-31', '2018-03-31 13:33:33', '2018-03-31 13:47:31', 0, 27, '0.5000', 17, NULL, NULL, 0, 8, NULL, 0, 25, 27, 1, 1, 1, 0, 1, 0, 5),
(30, '', '', '', '2018-03-31', '2018-03-31 13:44:10', '2018-03-31 15:11:47', 0, 27, '0.5000', 18, NULL, NULL, 1, 8, NULL, 0, 25, 31, 1, 1, 1, 0, 1, 0, 5),
(31, '', '', '', '2018-03-31', '2018-03-31 13:54:10', '2018-03-31 13:57:10', 0, 27, '0.5000', 16, NULL, NULL, 0, 8, NULL, 0, 29, 26, 1, 1, 1, 0, 1, 0, 5),
(32, '', '', '', '2018-03-31', '2018-03-31 13:58:30', '2018-03-31 14:02:14', 0, 27, '0.5000', 16, NULL, NULL, 0, 8, NULL, 0, 30, 26, 1, 1, 1, 0, 1, 0, 5),
(33, '', '', '', '2018-03-31', '2018-03-31 14:01:00', '2018-03-31 14:01:23', 0, 27, '0.5000', 16, NULL, NULL, 0, 8, NULL, 0, 30, 26, 1, 1, 1, 0, 1, 0, 5),
(34, '', '', '', '2018-03-31', '2018-03-31 14:03:40', '2018-03-31 16:26:43', 0, 27, '0.5000', 16, NULL, NULL, 1, 8, NULL, 1, 25, 31, 1, 1, 1, 0, 1, 0, 5),
(35, '', '', '', '2018-03-31', '2018-03-31 14:04:44', '2018-03-31 14:04:44', 0, 27, '0.5000', 16, NULL, NULL, 0, 8, NULL, 0, 30, 26, 1, 1, 1, 0, 1, 0, 5),
(36, '', '', '', '2018-03-31', '2018-03-31 14:08:20', '2018-03-31 14:08:20', 0, 27, '0.5000', 16, NULL, NULL, 0, 8, NULL, 0, 30, 26, 1, 1, 1, 0, 1, 0, 5),
(37, '', '', '', '2018-03-31', '2018-03-31 14:09:36', '2018-03-31 14:09:36', 0, 27, '0.5000', 16, NULL, NULL, 0, 8, NULL, 0, 30, 26, 1, 1, 1, 0, 1, 0, 5),
(38, '', '', '', '2018-03-31', '2018-03-31 14:11:31', '2018-03-31 14:13:35', 0, 27, '0.5000', 16, NULL, NULL, 0, 8, NULL, 0, 30, 26, 1, 1, 1, 0, 1, 0, 5),
(39, '', '', '', '2018-03-31', '2018-03-31 14:12:59', '2018-03-31 14:13:15', 0, 27, '0.5000', 16, NULL, NULL, 0, 8, NULL, 0, 30, 26, 1, 1, 1, 0, 1, 0, 5),
(40, '', '', '', '2018-03-31', '2018-03-31 14:14:56', '2018-03-31 14:14:56', 0, 27, '0.5000', 16, NULL, NULL, 0, 8, NULL, 0, 30, 26, 1, 1, 1, 0, 1, 0, 5),
(41, '', '', '', '2018-03-31', '2018-03-31 14:18:10', '2018-03-31 14:18:10', 0, 27, '0.5000', 16, NULL, NULL, 0, 8, NULL, 0, 30, 26, 1, 1, 1, 0, 1, 0, 5),
(42, '', '', '', '2018-03-31', '2018-03-31 14:19:03', '2018-03-31 14:20:39', 0, 27, '0.5000', 16, NULL, NULL, 0, 8, NULL, 0, 30, 26, 1, 1, 1, 0, 1, 0, 5),
(43, '', '', '', '2018-03-31', '2018-03-31 14:21:51', '2018-03-31 14:21:51', 0, 27, '0.5000', 16, NULL, NULL, 0, 8, NULL, 0, 30, 26, 1, 1, 1, 0, 1, 0, 5),
(44, '', '', '', '2018-03-31', '2018-03-31 14:23:03', '2018-03-31 14:23:03', 0, 27, '0.5000', 16, NULL, NULL, 0, 8, NULL, 0, 30, 26, 1, 1, 1, 0, 1, 0, 5),
(45, '', '', '', '2018-03-31', '2018-03-31 14:24:35', '2018-03-31 14:24:35', 0, 27, '0.5000', 16, NULL, NULL, 0, 8, NULL, 0, 30, 26, 1, 1, 1, 0, 1, 0, 5),
(46, '', '', '', '2018-02-15', '2018-03-31 14:41:34', '2018-03-31 15:53:10', 0, 27, '0.5000', 17, NULL, NULL, 0, 8, NULL, 0, 25, 27, 1, 1, 1, 0, 1, 0, 5),
(47, '', '', '', '2018-03-31', '2018-03-31 14:48:53', '2018-03-31 14:48:53', 0, 27, '0.5000', 17, NULL, NULL, 0, 8, NULL, 0, 25, 27, 1, 1, 1, 0, 1, 0, 5),
(48, '', '', '', '2018-03-31', '2018-03-31 14:51:07', '2018-03-31 14:51:07', 0, 27, '0.5000', 17, NULL, NULL, 0, 8, NULL, 0, 25, 27, 1, 1, 1, 0, 1, 0, 5),
(49, '', '', '', '2018-03-31', '2018-03-31 14:52:23', '2018-03-31 15:11:22', 0, 27, '0.5000', 18, NULL, NULL, 1, 8, NULL, 0, 25, 31, 1, 1, 1, 0, 1, 0, 5),
(50, '', '', '', '2018-03-31', '2018-03-31 14:53:57', '2018-03-31 14:53:57', 0, 27, '0.5000', 17, NULL, NULL, 0, 8, NULL, 0, 25, 27, 1, 1, 1, 0, 1, 0, 5),
(51, '', '', '', '2018-03-31', '2018-03-31 14:55:56', '2018-03-31 14:55:56', 0, 27, '0.5000', 17, NULL, NULL, 0, 8, NULL, 0, 25, 27, 1, 1, 1, 0, 1, 0, 5),
(52, '', '', '', '2018-03-31', '2018-03-31 14:57:16', '2018-03-31 14:57:16', 0, 27, '0.5000', 17, NULL, NULL, 0, 8, NULL, 0, 25, 27, 1, 1, 1, 0, 1, 0, 5),
(53, '', '', '', '2018-03-31', '2018-03-31 16:02:52', '2018-03-31 16:13:24', 0, 27, '0.5000', 16, NULL, NULL, 1, 9, NULL, 0, 25, 31, 1, 1, 1, 0, 1, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `page-extra-meta`
--

CREATE TABLE `page-extra-meta` (
  `id` int(11) NOT NULL,
  `pageID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page-extra-meta`
--

INSERT INTO `page-extra-meta` (`id`, `pageID`, `name`, `content`) VALUES
(12, 13, 'test', '1112');

-- --------------------------------------------------------

--
-- Table structure for table `page-language`
--

CREATE TABLE `page-language` (
  `id` int(11) NOT NULL,
  `pageID` int(11) NOT NULL,
  `language` varchar(3) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` mediumtext,
  `descriptionShort` text,
  `seoTitle` text,
  `seoDescription` text,
  `seoKeywords` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page-language`
--

INSERT INTO `page-language` (`id`, `pageID`, `language`, `title`, `description`, `descriptionShort`, `seoTitle`, `seoDescription`, `seoKeywords`) VALUES
(1, 1, 'en', 'Home', NULL, NULL, 'Main page', 'Main page', 'Main page'),
(2, 2, 'en', 'Family Banking Tips', '<p>Banking is all about education. This is why people who have banking advice need to really do their research. A family can get the best possible banking advice if they talk to financial organs, go online, and read the newspaper. Personal finance is about understanding what a family has and what a family wants to do with its money. Everyone from adults to university students can save and make money if they are smart. The following are some key pieces of <a href="http://www.pennywatchers.net/">banking advice</a> for families.</p>\n<p><strong>Shop Around for the Best Rates<br></strong>Before investing in any one group, it is wise to do some homework. Different banks and organs have different policies and deals for families looking for savings, chequing, and investment options. There are price comparison websites online that allow families to investigate different loan options and interest rates. Knowledge is power when it comes to a family’s money and interests.</p>\n<p><strong>Investigate a Bank’s Resources<br></strong>It is important to always know what a financial group offers individuals and families. For example, a student loan could come with lower interest rates if the individual’s family has an account with the organ. Additionally, it is wise to see what investment and savings options are offered by a financial group. Some people may get lower rates or fees if they sign up with their family versus independently.</p>\n<p>Banks want business. This is why investing in a group as a family is a smart decision: it can mean lower rates on many different types of services and accounts. It is important that a family is clear about its needs: whether the focus is applying for a vehicle loan or looking for the best savings and investment options. With some research, a family can find a bank that services all of its needs.</p>', '<p>Banking is all about education. This is why people who have banking advice need to really do their research. A family can get the best possible banking advice if they talk to financial organs, go online, and read the newspaper. Personal finance is about understanding what a family has and what a family wants to do with its money. Everyone from adults to university students can save and make money if they are smart. The following are some key pieces of <a href="http://www.pennywatchers.net/">banking advice</a> for families.</p>', 'Family Banking Tips', NULL, NULL),
(3, 3, 'en', 'Providing More Services for my Clients', '<p>Over my last fifteen years as an accountant, I have had the opportunity to interact with many different businesses.&nbsp; Each one of them has presented challenges to me and I have enjoyed the opportunity to work with so many business owners.&nbsp; But due to the economic climate that we are now in, I see that in a couple of years a number of my clients will be gone and I may not be able to maintain the lifestyle that I love.&nbsp; So, I have decided that it is time to provide more services to my clients.</p>\r\n<p>Over my last fifteen years as an accountant, I have had the opportunity to interact with many different businesses.&nbsp; Each one of them has presented challenges to me and I have enjoyed the opportunity to work with so many business owners.&nbsp; But due to the economic climate that we are now in, I see that in a couple of years a number of my clients will be gone and I may not be able to maintain the lifestyle that I love.&nbsp; So, I have decided that it is time to provide more services to my clients.</p>\r\n<p>Over my last fifteen years as an accountant, I have had the opportunity to interact with many different businesses.&nbsp; Each one of them has presented challenges to me and I have enjoyed the opportunity to work with so many business owners.&nbsp; But due to the economic climate that we are now in, I see that in a couple of years a number of my clients will be gone and I may not be able to maintain the lifestyle that I love.&nbsp; So, I have decided that it is time to provide more services to my clients.</p>', NULL, 'Providing More Services for my Clients', NULL, NULL),
(4, 4, 'en', 'Forex Education: Top 5 Currency Trading Essentials that can help you to improve your Trading', 'If you are struggling to earn consistent profit in forex exchange market then try these simple but important currency trading essentials because they are definitely going to get you substantial profit in forex currency trading market:\r\n\r\nUse Longer Time Frames – Part time forex traders generally think that they don’t need to select longer time frames for trade. In order to establish good forex trading strategy, you need to trade with longer time frames. Longer trading time frames means that you have to study forex trading charts for the longer duration of time like for 2 or for 4 hours daily.\r\nGive some time to your Trades to Work – This option can only be used by those traders who have effectively sized their trading positions. In currency trading market, prices of the currencies can fluctuate dramatically. While trading currencies in the market, traders need to be sure that they will get reasonable profit at the end of their trade. For instance, if you are trading in a market with 30pips stop loss then there are more chances for you to kick out of the currency trading market.\r\nDo not depend so much on Technical Indicators – Rather than depending so much on technical trading indicators, you need to follow major trends with the help of hop board and simple moving average. All successful forex traders does not completely rely on technical forex trading indicators because these indicators can not accurately predict the future currency trading market as they are based on past events.\r\nStart Trading with Two Major Forex Currency Pairs – Beginner traders should always start with one or two major forex currency pairs. In order to get maximum profit by trading a forex currency pair in the market, you need to gather some basic data of the specific forex currency pair. Never trade with three or more currency pairs in the market because it will almost impossible for you to get necessary knowledge about each forex currency pair.\r\nStop listening to the Trading Giants – The forex currency trading world is full of forex trading gurus and trading giants. You can find these gurus and trading giants giving their free suggestions to immature traders on every forex trading forum. While, these trading gurus might seem to be quiet knowledge but you should never trust on them. A good trader should always believe in his forex trading education. A quality forex education will not only guide you about your forex trading goals but it can also be your best companion.', NULL, 'Forex Education: Top 5 Currency Trading Essentials...', NULL, NULL),
(5, 5, 'en', 'John Thomas Financial – NY’s Brokerage and Financial Company', 'John Thomas Financial is a company that works on the principles of excellence in service, dedication to client success and full integrity. Basically, this means that the company provides every customer with special, customized solutions meant to meet financial goals. It means being able to bring forth immense expertise, research and overall experience with the intention of providing clients with totally sound investment decisions. It works on delivering excellent client service with total drive, energy, and integrity. Suffice it to say that John Thomas Financial intends to help clients achieve general success, since this also means the success of the company. Indeed, every client, whether it is personal or corporate, brings a set of finance investment goals and objectives to John Thomas Financial Company. For the company to meet distinct demands, its investment professionals work to utilize their experience, expertise, and knowledge on financial investment. The company works with clients who are clear about their expectations. It then works out a strategy meant to achieving such goals. John Thomas Financial works with customers going through life changes in the public policy and economic markets. It also works utilizing the goals of the company in the recreation of finance relationships based on client service excellence.\r\n\r\nJohn Thomas Financial provides comprehensive financial services meant to meet an array of investment goals. Such goals include short-term financial trading, portfolio management, market hedging strategies, liquid and income generation. The independent research and analysis of John Thomas Financial when it comes to the capital markets is meant to provide assistance to clients; helping them become fully armed with the appropriate knowledge and help them to be sufficiently-informed when it comes to investment decisions. In having a good view of the big economic environment together with existing market trends and analyses, John Thomas offers actionable views and insights that support financial investment objectives of its clients. The seasoned analysts of the company track down world markets when it comes to real time. The company offers investment experts and professionals with real time analysis of issuing and investment tools, as well as market movements.\r\n\r\nJohn Thomas Financial has Mike Norman as one of its leaders. It is the chief economist of the company. It does calculations on John Thomas Financial with the day-to-day Fiscal Liquidity Index using data on deposits and withdrawals coming from Treasury Statements. The company’s Liquidity Index is available to all clients, traders, advisors and investors on Bloomberg Professional via Bloomberg Terminal. Mike Norman works on doing reports on Economic Outlook. Most experts consider this to be an essential report on consumer sentiment, market outlook and credit cycles. Needless to say, Mike Norman of John Thomas Financial is one of the most trusted experts in financial matters.', NULL, 'John Thomas Financial – NY’s Brokerage and Financial Company', NULL, NULL),
(6, 6, 'en', 'Privacy', 'fsdf sdfsdfsdgfdg ', NULL, 'Privacy', NULL, NULL),
(7, 7, 'en', 'Author', '', '', 'Author', '', ''),
(8, 8, 'en', 'Home', '', '', 'Home', '', ''),
(9, 9, 'en', 'Nachhilfe-Vermittlung', '<p>Die Vermittlung von kompetenten Nachhilfelehrern kann &uuml;ber viele verschiedene Anbieter in Anspruch genommen werden. Die Vorteile dieser Nachhilfeform liegen darin, dass zuhause im gewohnten Umfeld&nbsp;gelernt&nbsp;werden kann. Somit muss sich der Sch&uuml;ler nicht auf eine neue Umgebung einstellen.&nbsp;Auch bietet sich diese Art der Nachhilfe f&uuml;r alle an, die nicht in gr&ouml;&szlig;eren St&auml;dten wohnen und bei denen somit das Angebot an Nachhilfeschulen vor Ort begrenzt ist. Bei der Nachhilfe-Vermittlung findet der Unterricht, bis auf wenige Ausnahmen, immer als Einzelunterricht statt. Dadurch ist gew&auml;hrleistet, das der Lehrer sich auf die individuellen Bed&uuml;rfnisse des Sch&uuml;lers einstellen kann.&nbsp;Auch entfallen die Zeiten f&uuml;r den Weg zu einer Nachhilfeschule. Entsprechend kann die f&uuml;r die Nachhilfe&nbsp;aufgewendete Zeit&nbsp;komplett zum Lernen genutzt werden.&nbsp;</p>\r\n<h3>Worauf zu achten ist</h3>\r\n<hr />\r\n<p>Wie bei der Nachhilfe in einem Institut, ist auch hier die Lehrer-Sch&uuml;ler-Beziehung der Schl&uuml;ssel zum Erfolg. Daher sollte vor dem Vertragsabschluss immer erst mindestens eine&nbsp;Probestunde genommen werden.&nbsp;Die Vermittlung und Auswahl erfolgt meist zun&auml;chst kostenlos f&uuml;r den Nachhilfesch&uuml;ler, allerdings fallen teilweise auch Vermittlungsgeb&uuml;hren an. Manchmal m&uuml;ssen auch anteilig Anfahrtskosten bezahlt werden, aber zumeist werden ausschlie&szlig;lich die Stunden bezahlt. Die Abrechnung erfolgt in der Regel in bar und direkt bei den Lehrern. Wir zeigen, welche Anbieter hier einen besonders guten Job machen, wer transparent seinen Service anbietet und wer eine besonders gro&szlig;e Auswahl an kompetenten Lehrer anbietet.</p>', '', 'Nachhilfe-Vermittlung', '', ''),
(10, 10, 'en', 'Nachhilfeschulen', '<p>Nachhilfeunterricht in einer Schule kann sehr sinnvoll sein.&nbsp;Gerade wenn f&uuml;r die Zeit der Nachhilfe kein separates, ruhiges Zimmer zur Verf&uuml;gung steht, sollte man eine externe Einrichtung aufsuchen.&nbsp;Nachhilfeinstitute stellen geeignete R&auml;umlichkeiten,&nbsp;bieten h&auml;ufig auch Materialien und gew&auml;hrleisten somit entspanntes Lernen.&nbsp;Auch kann man in Lerngruppen Nachhilfe nehmen, was kosteng&uuml;nstiger und oft trotzdem effektiv ist.&nbsp;Andere Sch&uuml;ler k&ouml;nnen beim Lernen durchaus motivieren und man sieht, dass auch andere Unterst&uuml;tzung f&uuml;r die Schule in Anspruch nehmen. Dadurch f&uuml;hlt man sich nicht so allein mit seinen Schulproblemen. Regelm&auml;&szlig;ige Lernzeiten und&nbsp;R&auml;umlichkeiten, die auf das Lernen abgestimmt sind,&nbsp;bieten eine optimale Atmosph&auml;re zum Lernen.&nbsp;Hier gibt es wenig Ablenkungsfaktoren und das Institut wird von den Sch&uuml;lern als&nbsp;Ort des Lernens akzeptiert.</p>\r\n<h4>Worauf zu achten ist</h4>\r\n<hr />\r\n<p>Generell kann in Einzel- und Gruppenunterricht unterschieden werden. Preislich und inhaltlich gibt es dabei immense Unterschiede.&nbsp;Wenn ein Sch&uuml;ler wirklich gro&szlig;e Defizite hat, kann im Einzelunterricht individuell darauf eingegangen werden. Lernfortschritte k&ouml;nnen so schneller erzielt werden. Gruppenunterricht ist g&uuml;nstiger und dann sinnvoll, wenn die L&uuml;cken nicht zu gro&szlig; sind oder es sich um eine Sch&uuml;lerin oder einer Sch&uuml;ler handelt, die bzw. der sich in einer Gruppe wohl f&uuml;hlt. Wichtig ist es, darauf zu achten, dass dabei die Lerngruppe nicht zu gro&szlig; ist und ausreichend auf einzelne Sch&uuml;ler eingegangen wird. Seri&ouml;se Institute bieten Probestunden an, welche die M&ouml;glichkeit geben, einen ersten Eindruck von dem Unterricht zu bekommen. Bevor ein Vertrag unterschrieben wird, sollte in aller Ruhe noch einmal mit dem Sch&uuml;ler gesprochen werden. Es vor allem wichtig, dass das Sch&uuml;ler-Lehrer-Verh&auml;ltnis stimmt. Dies ist die Basis f&uuml;r den Erfolg!</p>', '', 'Nachhilfeschulen', '', ''),
(11, 11, 'en', 'News und Infos', '<p>Eltern, die eine Nachhilfelehrkraft f&uuml;r ihr Kind suchen, legen gro&szlig;en Wert auf eine professionelle Betreuung. Das Kind sollte angeleitet werden, sich den Stoff eigenst&auml;ndig zu erarbeiten, damit es wieder Erfolgserlebnisse in der Schule hat. Es ist schwierig, an solch eine Lehrkraft zu gelangen. Im Bildungssektor tummeln sich viele schwarze Schafe. Der Begriff "Nachhilfelehrer/in" kann von jedem verwendet werden. Nicht selten bietet jemand, der vielleicht einige Fachzeitschriften gelesen hat oder meint, sich in Mathe ganz gut auszukennen, seine Dienste in der Nachhilfe an.&nbsp;</p>\r\n<div class="text-center"><a href="#">Was macht eine gute Nachhilfelehrkraft aus?</a></div>', '', 'News und Infos', '', ''),
(12, 12, 'en', 'Suche', '', '', 'Suche', '', ''),
(13, 13, 'en', 'Über uns', '<h4>So ist uber education entstanden</h4>\r\n<hr />\r\n<p>Schon w&auml;hrend des Studiums hat Silvia Glodde Nachhilfe gegeben und sp&auml;ter im Management einer Nachhilfeschule gearbeitet. Dabei fiel ihr immer wieder auf, wie intransparent das Angebot der verschiedenen Schulen ist. Preise und Vertragslaufzeiten sind h&auml;ufig nicht offensichtlich und auch &uuml;ber die Qualifikation der Lehrkr&auml;fte wird meistens nicht viel gesagt. Bei einem Gespr&auml;ch mit Lars Smidt entstand die Idee, eine eigene Website zu schaffen, die Benutzer &uuml;ber die verschiedenen Nachhilfeformen informiert und die einen Vergleich der jeweiligen Anbieter erlaubt. So sollen die Nutzer f&uuml;r jeden Bildungsbedarf die am besten passende L&ouml;sung finden k&ouml;nnen.</p>\r\n<h4>Das bieten wir an</h4>\r\n<hr />\r\n<p>Wir informieren auf unserer Seite &uuml;ber die wichtigen Themen aus dem Bildungsbereich. Zum Start vor allem zum Gebiet Nachhilfe, stellen wir die wichtigsten Informationen zur Verf&uuml;gung und helfen Ihnen so dabei, den f&uuml;r Sie passenden Anbieter zu finden. uber education hat die wichtigsten Daten von Nachhilfeanbietern zusammen getragen, damit Sie die Leistungen und Preise vergleichen k&ouml;nnen. So k&ouml;nnen Sie gezielt nach Anbietern, die Sie kennen suchen oder einfach danach, wer in Ihrer N&auml;he oder online, welche Unterst&uuml;tzung beim Lernen anbietet. Neben den Fakten werden Sie auch die subjektiven Bewertungen von anderen Nutzern lesen k&ouml;nnen, die mit den einzelnen Nachhilfeunternehmen schon zu tun hatten und &uuml;ber ihre Erfahrungen berichten. Egal ob diese nun positiv oder negativ sind, die pers&ouml;nlichen Erfahrungen Anderer werden Ihnen sehr dabei helfen, das beste Angebot zu finden. uber education ist ein unabh&auml;ngiges und neutrales, den Nutzern sich verpflichtendes Unternehmen. Wir m&ouml;chten dazu beitragen, dass die guten und engagierten Anbieter mehr Kunden bekommen und wollen, dass alle, die Nachhilfe in Anspruch nehmen, schnell Lernerfolge erzielen.</p>\r\n<h4>So finanzieren wir uns</h4>\r\n<hr />\r\n<p>F&uuml;r die privaten Nutzer ist und bleibt uber education kostenlos. uber education finanziert sich zum einen &uuml;ber bildungsrelevante Werbeanzeigen, zum anderen dadurch, dass Sie als Kunde &uuml;ber uns zu den Anbietern gelangen. Sollten Sie, durch unsere Seite informiert und best&auml;rkt, bei den Unternehmen eine Dienstleistung in Anspruch nehmen, erhalten wir eine Vermittlungsprovision, die aus dem Verdienst des Anbieters gespeist wird. Dieses passiert ganz automatisch, Sie als Nutzer m&uuml;ssen darauf nicht extra hinweisen. Dennoch freuen wir uns nat&uuml;rlich, wenn Sie &uuml;ber uns berichten, sowohl&nbsp;im Freundes- und Bekanntenkreis, als auch im Gespr&auml;ch mit Unternehmen im Bildungsbereich.</p>', '', 'Über uns1', '', ''),
(14, 14, 'en', 'Kontakt', '', '', 'Kontakt', '', ''),
(15, 15, 'en', 'Post', '<p>sdf sdf sdf dfgdsfsdf sdf</p>', '<p>dfsdfsdfsd sdf sdf&nbsp;</p>', 'Post', 'Pos', 'Pos'),
(16, 16, 'en', 'ApexAdmin', '', '', 'Author', '', ''),
(17, 17, 'en', 'Home', '', '', 'Leading On-Site Promotions - APEX Marketing Events', '', ''),
(18, 18, 'en', 'Taking Time to Recognize a Top Performer', '', '', 'Taking Time to Recognize a Top Performer', '', ''),
(19, 19, 'en', 'About us', '', '', 'About Us | Apex Marketing Events, Inc.', '', ''),
(20, 20, 'en', 'Our approach', '', '', 'Our approach', '', ''),
(21, 21, 'en', 'Careers', '', '', 'Careers', '', ''),
(22, 22, 'en', 'Apply', '', '', 'Apply', '', ''),
(23, 23, 'en', 'News and events', '', '', 'News and events', '', ''),
(24, 24, 'en', 'Tips for Business Travelers', '<p>Business travel offers many benefits for professionals and companies. You can&rsquo;t beat face-to-face interactions when it comes to networking and creating new opportunities, so we at Apex Marketing Events venture away from the office on a regular basis. We have picked up some valuable insights through our travel experiences, and we would like to share a few of them with you here.</p>\r\n<p>One thing you should absolutely do if you plan to be on the road a lot is keep the essentials packed. Keep a toiletry bag ready at all times, with phone chargers and grooming necessities always at your disposal. When you don&rsquo;t have to worry about these minor details, you can focus on getting your wardrobe cleaned and properly packed.</p>\r\n<p>We at Apex Marketing Events also believe you should take advantage of the many non-hotel options when you need a place to stay. Airbnb provides some remarkable accommodations that will make your trip more memorable and comfortable.</p>\r\n<p>You must also take full advantage of any downtime you have on the road, because going from one event to another will take a toll on your well-being. Visit museums and natural attractions to take in some culture and recharge your batteries at the same time.</p>\r\n<p>Our team at Apex Marketing Events hopes you will use these strategies to make your next business trip more productive and enjoyable.</p>', '<p>Business travel offers many benefits for professionals and companies. You can&rsquo;t beat face-to-face interactions when it comes to networking and creating new opportunities, so we at Apex Marketing Events venture away from the office on a regular basis. We have picked up some valuable insights through our travel experiences, and we would like to share a few of them with you here.</p>', 'Tips for Business Travelers', '', ''),
(25, 25, 'en', 'Inc. Promotes Singletasking', '<p>What used to be considered a valuable skill is now known to be a harmful habit. Multitasking has been shown to decrease productivity and even negatively impact IQ. Still, it&rsquo;s difficult to avoid in a world full of demands and responsibilities. At Apex Marketing Events, Inc., we want you to resist the temptation to multitask and try singletasking instead.</p>\r\n<p>The crux of the issue is that your brain can&rsquo;t focus on two things at the same time. It&rsquo;s actually switching back and forth between tasks, using valuable energy and getting burned out in the process. Singletasking &ndash; the act of focusing on one effort from start to finish &ndash; is much better for the brain. These are some of the techniques we at Apex Marketing Events, Inc. use to singletask:</p>\r\n<ul>\r\n<li><strong>Put up Walls:</strong> Distractions make singletasking difficult, so we do all we can to block them. Our efforts include closing our office doors, using noise-cancelling headphones, and turning off the notifications on our electronics.</li>\r\n<li><strong>Cluster Tasks:</strong> This strategy requires us to group similar tasks together and accomplish them in one block of time. It is especially useful when it comes to e-mail. Instead of checking our messages the moment we receive them, we set aside two or three times every day that are dedicated to e-mail. We stay away from our inboxes outside of those timeframes.</li>\r\n</ul>\r\n<p>At Apex Marketing Events, Inc., we&rsquo;ve become far more productive since adopting the practice of singletasking.</p>', '<p>What used to be considered a valuable skill is now known to be a harmful habit. Multitasking has been shown to decrease productivity and even negatively impact IQ. Still, it&rsquo;s difficult to avoid in a world full of demands and responsibilities. At Apex Marketing Events, Inc., we want you to resist the temptation to multitask and try singletasking instead.</p>', 'Inc. Promotes Singletasking', '', ''),
(26, 26, 'en', 'sdfsdfsdf', '<p>sdfsdfsdfsdf</p>', '<p>sdfdsfsdf</p>', 'dfgdg', 'sfsdf', ''),
(27, 27, 'en', 'Author', '', '', 'Author', '', ''),
(28, 28, 'en', 'Home', '', '', 'Home', '', ''),
(29, 29, 'en', 'Test', '<p>Interested in running Emerson College Quidditch? Well you&rsquo;re in luck. We are seeking enthusiastic members for our 2015 spring Executive Board! All members of Emerson College Quidditch are eligible to run for a position on our Executive Board.</p>\r\n<p>You can submit your nomination using <a href="https://docs.google.com/forms/d/1dI6j0aNcPCtrDYK8SiZ4_hc7HOlDtQZwU-uXLUOrhig/viewform?edit_requested=true" target="_blank" rel="noopener">this Google Form</a>. You can submit your name for nomination for as many positions as you want, but please submit only one nomination per form. All nominations are due by midnight on Sunday, November 9th. Please note that holding an elected position on our Executive Board requires attendance at weekly meetings.</p>\r\n<p>We are also looking for dedicated members to fill some non-voting positions within the organization. These are unelected positions that current members volunteer for, and these non-voting positions do not require attendance at weekly Executive Board meetings (although attendance is encouraged). The current members in these positions will reach out to those expressing interest.</p>\r\n<p>The descriptions for both elected Executive Board positions and volunteer positions are listed below, taken directly from our Constitution. If you have any questions, please contact Lindsey Simpson at <a href="mailto:vp@emersonquidditch.org">vp@emersonquidditch.org</a>. We look forward to receiving your nominations!</p>\r\n<h3>Elected Positions</h3>\r\n<p><strong>Vice President:</strong><br />The Vice President assists the Commissioner in any and all ways, attending all meetings with the Commissioner. They are responsible for working with other divisions to ensure that teams have practice time and space, as well as time and space for outdoor organization-wide events (such as Intramural League games). This may include obtaining permits for field space near and around Emerson College. It is the Vice President&rsquo;s responsibility to act as the Commissioner during his/her absence, assist in day-to-day logistical workings of the organization, and assist other members of the E-Board with Intramural League management and other projects.</p>\r\n<p><strong>Communications Director:</strong><br />The Communications Director oversees and manages all communication efforts produced by the organization. This may include organizing newsletters and organization-wide emails, helping answer questions from outside press interested in learning about quidditch and ECQ, and assisting other members of the E-Board and organization with Intramural League management and other projects. They are also responsible for maintaining a record of the organization&rsquo;s history. The Communications Director works with the Media Director and Sales/Marketing Director to compile content for newsletters, social media, and the website. The Communications Director is also responsible for putting together a team that writes articles on all Intramural League games, as well as other events.</p>\r\n<p><strong>Media Director:</strong><br />The Media Director oversees and manages all photo and video aspects of the organization. This may include organizing photographers and videographers to document Intramural League gameplay, editing photos and videos, and putting together promotional material. The Media Director works with the Communications Director, the Sales/Marketing Director, the Social Media Manager, and the Webmaster to supply photo and video material when necessary.</p>\r\n<p><strong>Intramural League Captains:</strong><br />The Intramural Captains are the leaders of the individual Intramural League teams which are as follows: Boylston Berserkers, Faneuil Falcons, Jamaica Plains Jaguars, Old North Outlaws, Park Street Pulverizers, and South End Slothbears. Intramural League teams have a near equivalent number of players. For every team there must be two captains, and only one captain may play on the field at a time to ensure objectivity of the game. Intramural Captains will draft their team at the beginning of the season, organize practices, educate player members on the game of quidditch, and lead their teams in sportsmanlike gameplay against other Intramural League teams.</p>\r\n<p>For the 2015 spring semester, we are looking for captains for the following Intramural League teams (number denotes open captain positions): Boylston Berserkers (1), Faneuil Falcons (1), Jamaica Plain Jaguars (1), Old North Outlaws (1), Park Street Pulverizers (1).</p>\r\n<h3>Non-Voting Positions</h3>\r\n<p><strong>Social Media Manager and Webmaster</strong><br />The Social Media Manager and Webmaster are non-voting positions with a standing invitation to attend E-Board meetings. They are responsible for managing all social media (Facebook page, Twitter, and Tumblr) and website, respectively. They are positions that are assigned by the current Commissioner or Media Director for convenience in the same manner as detailed in Article XIII Section 8. Since they are non-voting positions, they may be assigned to either current E-Board members or other League Members of ECQ.</p>', '<p>Interested in running Emerson College Quidditch? Well you&rsquo;re in luck. We are seeking enthusiastic members for our 2015 spring Executive Board! All members of Emerson College Quidditch are eligible to run for a position on our Executive Board.</p>', 'Test', '', ''),
(30, 30, 'en', 'ECQ House League', '', '', 'ECQ House League', '', ''),
(31, 31, 'en', 'About', '<h4><em><strong>&ldquo;We don&rsquo;t fly. We don&rsquo;t THINK we fly. We play</strong><strong> quidditch!&rdquo;</strong></em></h4>\r\n<p>Emerson College Quidditch began with just 14 freshmen who thought it would be a fun idea to try and play as a floor event.</p>\r\n<p>After a successful afternoon of playing quidditch, the idea grew into the actual Emerson College Quidditch League.</p>\r\n<p>ECQ now has six Intramural League teams and an affiliate World Cup tournament team that competes against other teams internationally.</p>\r\n<p>For more information about Emerson College Quidditch, our intramural teams, and the various workings of the organization, take a peek around our updated website! Thanks for stopping by!</p>', '', '', '', ''),
(32, 32, 'en', 'Mission Statement', '<p>The following is an excerpt from the Emerson College Quidditch Constitution, stating our purpose as an organization.</p>\r\n<p><strong>Article II, Sections 1 through 3:</strong></p>\r\n<p>To provide all Emerson College and other college students in the greater Boston area with the opportunity to play quidditch on a team in a well-organized intramural sports league.</p>\r\n<p>To encourage students to assume leadership roles within the organization and to apply skills learned in the classroom.</p>\r\n<p>To teach and enhance players&rsquo; abilities so that they may participate on tournament teams that compete internationally as members of the International Quidditch Association.</p>', '', 'Mission Statement', '', ''),
(33, 33, 'en', '2014-2015 E-Board', '<p>Emerson College Quidditch is led by an executive board of students that are elected by all members in the organization. These students are elected on a yearly basis and are responsible for individual departments within the league.</p>\r\n<p><!-- E-BOARD MEMBER INFO FILLS FROM ABOVE FORMS - DO NOT EDIT CODE --></p>\r\n<div class="eboard-left">\r\n<div class="position-info">\r\n<p>&nbsp;</p>\r\n<p><span class="position-name">Samuel Scarfone</span><br /><span class="position-title">Commissioner</span></p>\r\n<p><a href="mailto:commissioner@emersonquidditch.org">commissioner@emersonquidditch.org</a></p>\r\n</div>\r\n<div class="headshot"><a href="mailto:commissioner@emersonquidditch.org"><img title="Samuel Scarfone - Commissioner" src="../../../wp-content/uploads/2014/06/HeadshotLogoFiller.jpg" alt="Samuel Scarfone - Commissioner" width="170" height="170" /></a></div>\r\n</div>\r\n<div class="eboard-right">\r\n<div class="position-info">\r\n<p>&nbsp;</p>\r\n<p><span class="position-name">Martha Connolly </span><br /><span class="position-title">Vice President</span></p>\r\n<p><a href="mailto:vp@emersonquidditch.org">vp@emersonquidditch.org</a></p>\r\n</div>\r\n<div class="headshot"><a href="mailto:vp@emersonquidditch.org"><img title="Martha Connolly  - Vice President" src="../../../wp-content/uploads/2014/06/HeadshotLogoFiller.jpg" alt="Martha Connolly  - Vice President" width="170" height="170" /></a></div>\r\n</div>\r\n<div class="eboard-left">\r\n<div class="position-info">\r\n<p>&nbsp;</p>\r\n<p><span class="position-name">Lina Benich</span><br /><span class="position-title">Logistics Coordinator</span></p>\r\n<p><a href="mailto:logistics@emersonquidditch.org">logistics@emersonquidditch.org</a></p>\r\n</div>\r\n<div class="headshot"><a href="mailto:logistics@emersonquidditch.org"><img title="Lina Benich - Logistics Coordinator" src="../../../wp-content/uploads/2014/06/HeadshotLogoFiller.jpg" alt="Lina Benich - Logistics Coordinator" width="170" height="170" /></a></div>\r\n</div>\r\n<div class="eboard-right">\r\n<div class="position-info">\r\n<p>&nbsp;</p>\r\n<p><span class="position-name">John Daniel Luna </span><br /><span class="position-title">Treasurer</span></p>\r\n<p><a href="mailto:treasurer@emersonquidditch.org">treasurer@emersonquidditch.org</a></p>\r\n</div>\r\n<div class="headshot"><a href="mailto:treasurer@emersonquidditch.org"><img title="John Daniel Luna  - Treasurer" src="../../../wp-content/uploads/2014/06/HeadshotLogoFiller.jpg" alt="John Daniel Luna  - Treasurer" width="170" height="170" /></a></div>\r\n</div>\r\n<div class="eboard-left">\r\n<div class="position-info">\r\n<p>&nbsp;</p>\r\n<p><span class="position-name">John William General</span><br /><span class="position-title">Gameplay Director</span></p>\r\n<p><a href="mailto:gameplay@emersonquidditch.org">gameplay@emersonquidditch.org</a></p>\r\n</div>\r\n<div class="headshot"><a href="mailto:gameplay@emersonquidditch.org"><img title="John William General - Gameplay Director" src="../../../wp-content/uploads/2014/06/HeadshotLogoFiller.jpg" alt="John William General - Gameplay Director" width="170" height="170" /></a></div>\r\n</div>\r\n<div class="eboard-right">\r\n<div class="position-info">\r\n<p>&nbsp;</p>\r\n<p><span class="position-name">Hannah Gluckman</span><br /><span class="position-title">Communications Director</span></p>\r\n<p><a href="mailto:communications@emersonquidditch.org">communications@emersonquidditch.org</a></p>\r\n</div>\r\n<div class="headshot"><a href="mailto:communications@emersonquidditch.org"><img title="Hannah Gluckman - Communications Director" src="../../../wp-content/uploads/2014/06/HeadshotLogoFiller.jpg" alt="Hannah Gluckman - Communications Director" width="170" height="170" /></a></div>\r\n</div>\r\n<div class="eboard-left">\r\n<div class="position-info">\r\n<p>&nbsp;</p>\r\n<p><span class="position-name">Lily Rugo</span><br /><span class="position-title">Media Director</span></p>\r\n<p><a href="mailto:media@emersonquidditch.org">media@emersonquidditch.org</a></p>\r\n</div>\r\n<div class="headshot"><a href="mailto:media@emersonquidditch.org"><img title="Lily Rugo - Media Director" src="../../../wp-content/uploads/2014/06/HeadshotLogoFiller.jpg" alt="Lily Rugo - Media Director" width="170" height="170" /></a></div>\r\n</div>\r\n<div class="eboard-right">\r\n<div class="position-info">\r\n<p>&nbsp;</p>\r\n<p><span class="position-name">Lucie McCormick</span><br /><span class="position-title">Sales/Marketing Director</span></p>\r\n<p><a href="mailto:sales@emersonquidditch.org">sales@emersonquidditch.org</a></p>\r\n</div>\r\n<div class="headshot"><a href="mailto:sales@emersonquidditch.org"><img title="Lucie McCormick - Sales/Marketing Director" src="../../../wp-content/uploads/2014/06/HeadshotLogoFiller.jpg" alt="Lucie McCormick - Sales/Marketing Director" width="170" height="170" /></a></div>\r\n</div>\r\n<div class="eboard-left">\r\n<div class="position-info">\r\n<p>&nbsp;</p>\r\n<p><span class="position-name">Jason Blanton</span><br /><span class="position-title">Equipment Manager</span></p>\r\n<p><a href="mailto:equipment@emersonquidditch.org">equipment@emersonquidditch.org</a></p>\r\n</div>\r\n<div class="headshot"><a href="mailto:equipment@emersonquidditch.org"><img title="Jason Blanton - Equipment Manager" src="../../../wp-content/uploads/2014/06/HeadshotLogoFiller.jpg" alt="Jason Blanton - Equipment Manager" width="170" height="170" /></a></div>\r\n</div>\r\n<p><!-- END E-BOARD MEMBER CODE --></p>\r\n<div class="eboard-right">\r\n<p>In addition to the 9 E-Board members, there are 12 captains for the <a href="../../../intramural-league/">6 intramural teams</a> in ECQ. These captains are elected by their respective teams.</p>\r\n<p>Other positions within ECQ include a Social Media Manager, <a href="../../../intramural-league/refs-snitches/">a Snitch Coordinator</a>, and a Webmaster. These are unelected positions that current ECQ members volunteer for.</p>\r\n</div>\r\n<p>&nbsp;</p>', '', '2014-2015 E-Board', '', ''),
(34, 34, 'en', 'News', '', '', 'News', '', ''),
(35, 35, 'en', 'Media', '<p>To see all of our photographs, please visit our <a href="https://www.facebook.com/EmersonQuidditch/photos/">Photo Albums on Facebook</a></p>\r\n<p>Facebook API came back with a faulty result. You may be accessing an album you do not have permissions to access. Facebook API came back with a faulty result. You may be accessing an album you do not have permissions to access. Facebook API came back with a faulty result. You may be accessing an album you do not have permissions to access. Facebook API came back with a faulty result. You may be accessing an album you do not have permissions to access. Facebook API came back with a faulty result. You may be accessing an album you do not have permissions to access.</p>\r\n<p>&nbsp;</p>\r\n<div style="text-align: center;"><iframe src="//www.youtube.com/embed/RXH9FlboPho" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe></div>', '', 'Media', '', ''),
(36, 36, 'en', 'Intramural League', '<p>The Emerson College Quidditch Intramural League consists of six teams which compete weekly throughout the fall and spring seasons. The Intramural League strives to provide an intense but friendly atmosphere that is all-inclusive to anyone interested. The season culminates in a championship cup exhibition known as the <a title="Griffith Cup" href="../../../intramural-league/griffith-cup/">Griffith Cup</a>. The teams are the <a title="Boylston Berserkers" href="../../../intramural-league/teams/berserkers/">Boylston Berserkers</a>, the <a title="Faneuil Falcons" href="../../../intramural-league/teams/falcons/">Faneuil Falcons</a>, the <a title="Jamaica Plain Jaguars" href="../../../intramural-league/teams/jaguars/">Jamaica Plain Jaguars</a>, the <a title="Old North Outlaws" href="../../../intramural-league/teams/outlaws/">Old North Outlaws</a>, the <a title="Park Street Pulverizers" href="../../../intramural-league/teams/pulverizers/">Park Street Pulverizers</a>, and the <a title="South End Slothbears" href="../../../intramural-league/teams/slothbears/">South End Slothbears</a>.</p>\r\n<p>For more information about each individual team, please visit their page on this site.</p>', '', 'Intramural League', '', ''),
(37, 37, 'en', 'Standings', '<div id="standings-responsive-div"><iframe src="https://docs.google.com/spreadsheet/pub?key=0Am85mhlk-LVndE1lMm52WElncHV3LTRSbUxFTkFUY1E&amp;single=true&amp;gid=4&amp;range=A1%3AE8&amp;output=html" frameborder="0">&lt;br /&gt;</iframe></div>\r\n<p>If you are having difficulty viewing the standings on this page, please <a href="https://docs.google.com/spreadsheet/pub?key=0Am85mhlk-LVndE1lMm52WElncHV3LTRSbUxFTkFUY1E&amp;single=true&amp;gid=4&amp;range=A1%3AE8" target="_blank" rel="noopener">try this page</a>.</p>', '', 'Standings', '', ''),
(38, 38, 'en', 'Teams', '<p>The Emerson College Quidditch Intramural League consists of six teams which compete weekly throughout the fall and spring seasons. Intramural League strives to provide an intense but friendly atmosphere that is all-inclusive to anyone interested. The season culminates in a championship cup exhibition known as the <a title="Griffith Cup" href="../../../intramural-league/griffith-cup/">Griffith Cup</a>.</p>\r\n<p>For more information about each individual team, please visit their page on this site.</p>\r\n<ul>\r\n<li><a title="Boylston Berserkers" href="../../../intramural-league/teams/berserkers/">Boylston Berserkers</a></li>\r\n<li><a title="Faneuil Falcons" href="../../../intramural-league/teams/falcons/">Faneuil Falcons</a></li>\r\n<li><a title="Jamaica Plain Jaguars" href="../../../intramural-league/teams/jaguars/">Jamaica Plain Jaguars</a></li>\r\n<li><a title="Old North Outlaws" href="../../../intramural-league/teams/outlaws/">Old North Outlaws</a></li>\r\n<li><a title="Park Street Pulverizers" href="../../../intramural-league/teams/pulverizers/">Park Street Pulverizers</a></li>\r\n<li><a title="South End Slothbears" href="../../../intramural-league/teams/slothbears/">South End Slothbears</a></li>\r\n</ul>', '', 'Teams', '', ''),
(39, 39, 'en', 'Boylston Berserkers', '<p><img class="teamlogo" src="../../../wp-content/uploads/2013/09/boylstonberserkerslogo.png" alt="Boylston Berserkers" /></p>\r\n<div class="team-info">\r\n<p><strong>Founded:</strong> 2008<br /><strong>Primary Color:</strong> Red<br /><strong>Secondary Color:</strong> Black<br /><strong>Mascot:</strong> Lion</p>\r\n<p><strong>Griffith Cup Champions:</strong> 2014, 2011, 2010</p>\r\n</div>\r\n<p><!-- CAPTAIN INFO FILLS FROM ABOVE FORMS - DO NOT EDIT CODE --></p>\r\n<div class="captain-left">\r\n<div class="position-info">\r\n<p>&nbsp;</p>\r\n<p><span class="position-name">Yaslynn Rivera</span><br /><span class="position-title">Captain &ndash; Boylston Berserkers</span></p>\r\n<p><a href="mailto:berserkers@emersonquidditch.org">berserkers@emersonquidditch.org</a></p>\r\n</div>\r\n<div class="headshot"><a href="mailto:berserkers@emersonquidditch.org"><img title="Yaslynn Rivera - Boylston Berserkers Captain" src="../../../wp-content/uploads/2014/06/HeadshotKipperman.jpg" alt="Yaslynn Rivera - Boylston Berserkers Captain" width="170" height="170" /></a></div>\r\n</div>\r\n<div class="captain-right">\r\n<div class="position-info">\r\n<p>&nbsp;</p>\r\n<p><span class="position-name">Daniel Marti</span><br /><span class="position-title">Captain &ndash; Boylston Berserkers</span></p>\r\n<p><a href="mailto:berserkers@emersonquidditch.org">berserkers@emersonquidditch.org</a></p>\r\n</div>\r\n<div class="headshot"><a href="mailto:berserkers@emersonquidditch.org"><img title="Daniel Marti - Boylston Berserkers Captain" src="../../../wp-content/uploads/2014/06/HeadshotLogoFiller.jpg" alt="Daniel Marti - Boylston Berserkers Captain" width="170" height="170" /></a></div>\r\n</div>\r\n<p><!-- END CAPTAINS --></p>', '', 'Boylston Berserkers', '', ''),
(40, 40, 'en', 'Jamaica Plain Jaguars', '<p><img class="teamlogo" src="../../../wp-content/uploads/2013/09/jamaicaplainjaguarslogo.png" alt="Jamaica Plain Jaguars" /></p>\r\n<div class="team-info">\r\n<p><strong>Founded:</strong> 2010<br /><strong>Primary Color:</strong> Black<br /><strong>Secondary Color:</strong> Pink<br /><strong>Mascot:</strong> Jaguar</p>\r\n<p><strong>Griffith Cup Champions:</strong> Not yet!</p>\r\n</div>\r\n<p><!-- CAPTAIN INFO FILLS FROM ABOVE FORMS - DO NOT EDIT CODE --></p>\r\n<div class="captain-left">\r\n<div class="position-info">\r\n<p>&nbsp;</p>\r\n<p><span class="position-name">Lucas Dispoto</span><br /><span class="position-title">Captain &ndash; Jamaica Plain Jaguars</span></p>\r\n<p><a href="mailto:jaguars@emersonquidditch.org">jaguars@emersonquidditch.org</a></p>\r\n</div>\r\n<div class="headshot"><a href="mailto:jaguars@emersonquidditch.org"><img title="Lucas Dispoto - Jamaica Plain Jaguars Captain" src="../../../wp-content/uploads/2014/06/HeadshotLogoFiller.jpg" alt="Lucas Dispoto - Jamaica Plain Jaguars Captain" width="170" height="170" /></a></div>\r\n</div>\r\n<div class="captain-right">\r\n<div class="position-info">\r\n<p>&nbsp;</p>\r\n<p><span class="position-name">Rachel Halilej</span><br /><span class="position-title">Captain &ndash; Jamaica Plain Jaguars</span></p>\r\n<p><a href="mailto:jaguars@emersonquidditch.org">jaguars@emersonquidditch.org</a></p>\r\n</div>\r\n<div class="headshot"><a href="mailto:jaguars@emersonquidditch.org"><img title="Rachel Halilej - Jamaica Plain Jaguars Captain" src="../../../wp-content/uploads/2014/06/HeadshotLogoFiller.jpg" alt="Rachel Halilej - Jamaica Plain Jaguars Captain" width="170" height="170" /></a></div>\r\n</div>\r\n<p><!-- END CAPTAINS --></p>', '', 'Jamaica Plain Jaguars', '', ''),
(41, 41, 'en', 'World Cup', '<p>The Emerson College Quidditch World Cup team is composed of twenty-one players drawn from ECQ&rsquo;s Intramural League. Try-outs are held at the beginning of the fall semester and the team roster is created&nbsp;based on players&rsquo; performance.&nbsp;The World Cup team competes in tournaments organized by <a href="http://usquidditch.org" target="_blank" rel="noopener">US Quidditch (USQ)</a> throughout the fall and spring seasons.</p>\r\n<p>The current World Cup team is led under captains Leeanne Dillmann, David Fox and Tyler Trudeau. The team&rsquo;s coach is Rose Pleuler, and the team manager is Paulina Pascual.</p>\r\n<p>For information regarding the World Cup team, email <a href="mailto:ecqcaptains@gmail.com">ecqcaptains@gmail.com</a>.</p>\r\n<p>Recent highlights include:</p>\r\n<ul>\r\n<li>Final Four at World Cup VII (Spring 2014)</li>\r\n<li>2nd place at the Northeast Regional Championships (Fall 2013)</li>\r\n<li>1st place at the Third Annual Turtle Cup Invitational (Fall 2013)</li>\r\n<li>2nd place at the Massachusetts Quidditch Conference and Southern New England Quidditch Conference Invitational (Fall 2013)</li>\r\n<li>2nd place at the Northeast Regional Championships (Fall 2012)</li>\r\n<li>1st place at the Massachusetts Quidditch Conference (Fall 2012)</li>\r\n</ul>\r\n<p>&nbsp;</p>', '', 'World Cup', '', ''),
(42, 42, 'en', 'History', '<p>Recent highlights of the Emerson College Quidditch World Cup team include:</p>\r\n<ul>\r\n<li>Final Four finish at World Cup VII (Spring 2014)</li>\r\n<li>2nd place at the Northeast Regional Championships (Fall 2013)</li>\r\n<li>1st Place at the Third Annual Turtle Cup Invitational (Fall 2013)</li>\r\n<li>2nd place at the Massachusetts Quidditch Conference/Southern New England Quidditch Conference Invitational (Fall 2013)</li>\r\n<li>2nd place at the Northeast Regional Championships (Fall 2012)</li>\r\n<li>1st place at the Massachusetts Quidditch Conference (Fall 2012)</li>\r\n<li>1st place at the Champions Series (Spring 2012)</li>\r\n<li>1st place at the Massachusetts Quidditch Conference (Spring 2012)</li>\r\n<li>5th place at the Stony Brook Classic (Spring 2012)</li>\r\n</ul>\r\n<p>Past achievements of the World Cup team include:</p>\r\n<ul>\r\n<li>Sweet Sixteen finish at World Cup VI (Spring 2013)</li>\r\n<li>11th place at World Cup V (Fall 2011)</li>\r\n<li>5th place at World Cup IV (Fall 2010)</li>\r\n<li>2nd place at World Cup III (Fall 2009)</li>\r\n</ul>', '', 'History', '', '');
INSERT INTO `page-language` (`id`, `pageID`, `language`, `title`, `description`, `descriptionShort`, `seoTitle`, `seoDescription`, `seoKeywords`) VALUES
(43, 43, 'en', 'Store', '<p>All of Emerson College Quidditch&rsquo;s merchandise can be purchased through our <a href="https://squareup.com/market/emerson-college-quidditch-3">online store on Square Market</a>. Please note that you will be taken to an external website to purchase items.</p>\r\n<p>&nbsp;</p>\r\n<div id="store-icons">\r\n<h3>Clothing</h3>\r\n<div class="store-item" style="width: 46%; margin-right: 4%; display: inline-block;">\r\n<div style="box-sizing: border-box; font-size: 14px; font-family: ''Helvetica Neue'', sans-serif; max-height: 631px; min-width: 200px; overflow: hidden;">\r\n<div style="box-sizing: border-box; height: 0px; overflow: hidden; padding-bottom: 100%; padding-top: 88px; position: relative;"><iframe style="height: 100%; position: absolute; top: 0px; left: 0px; width: 100%;" src="https://squareup.com/embeds/merchandiser?merchant_id=emerson-college-quidditch-3&amp;focus_item_id=sweatshirt&amp;square_lead=item_embed" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></div>\r\n</div>\r\n</div>\r\n<div class="store-item" style="width: 46%; display: inline-block;">\r\n<div style="box-sizing: border-box; font-size: 14px; font-family: ''Helvetica Neue'', sans-serif; max-height: 631px; min-width: 200px; overflow: hidden;">\r\n<div style="box-sizing: border-box; height: 0px; overflow: hidden; padding-bottom: 100%; padding-top: 88px; position: relative;"><iframe style="height: 100%; position: absolute; top: 0px; left: 0px; width: 100%;" src="https://squareup.com/embeds/merchandiser?merchant_id=emerson-college-quidditch-3&amp;focus_item_id=ecq-crest-long-sleeve-shirt&amp;square_lead=item_embed" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></div>\r\n</div>\r\n</div>\r\n<div class="store-item" style="width: 46%; margin-right: 4%; display: inline-block;">\r\n<div style="box-sizing: border-box; font-size: 14px; font-family: ''Helvetica Neue'', sans-serif; max-height: 631px; min-width: 200px; overflow: hidden;">\r\n<div style="box-sizing: border-box; height: 0px; overflow: hidden; padding-bottom: 100%; padding-top: 88px; position: relative;"><iframe style="height: 100%; position: absolute; top: 0px; left: 0px; width: 100%;" src="https://squareup.com/embeds/merchandiser?merchant_id=emerson-college-quidditch-3&amp;focus_item_id=sweatpants&amp;square_lead=item_embed" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></div>\r\n</div>\r\n</div>\r\n<div class="store-item" style="width: 46%; display: inline-block;">\r\n<div style="box-sizing: border-box; font-size: 14px; font-family: ''Helvetica Neue'', sans-serif; max-height: 631px; min-width: 200px; overflow: hidden;">\r\n<div style="box-sizing: border-box; height: 0px; overflow: hidden; padding-bottom: 100%; padding-top: 88px; position: relative;"><iframe style="height: 100%; position: absolute; top: 0px; left: 0px; width: 100%;" src="https://squareup.com/embeds/merchandiser?merchant_id=emerson-college-quidditch-3&amp;focus_item_id=t-shirt&amp;square_lead=item_embed" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></div>\r\n</div>\r\n</div>\r\n<div class="store-item" style="width: 46%; margin-right: 4%; display: inline-block;">\r\n<div style="box-sizing: border-box; font-size: 14px; font-family: ''Helvetica Neue'', sans-serif; max-height: 631px; min-width: 200px; overflow: hidden;">\r\n<div style="box-sizing: border-box; height: 0px; overflow: hidden; padding-bottom: 100%; padding-top: 88px; position: relative;"><iframe style="height: 100%; position: absolute; top: 0px; left: 0px; width: 100%;" src="https://squareup.com/embeds/merchandiser?merchant_id=emerson-college-quidditch-3&amp;focus_item_id=snitches-hoes-t-shirt&amp;square_lead=item_embed" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></div>\r\n</div>\r\n</div>\r\n<div class="store-item" style="width: 46%; display: inline-block;">\r\n<div style="box-sizing: border-box; font-size: 14px; font-family: ''Helvetica Neue'', sans-serif; max-height: 631px; min-width: 200px; overflow: hidden;">\r\n<div style="box-sizing: border-box; height: 0px; overflow: hidden; padding-bottom: 100%; padding-top: 88px; position: relative;"><iframe style="height: 100%; position: absolute; top: 0px; left: 0px; width: 100%;" src="https://squareup.com/embeds/merchandiser?merchant_id=emerson-college-quidditch-3&amp;focus_item_id=three-hoops-t-shirt&amp;square_lead=item_embed" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></div>\r\n</div>\r\n</div>\r\n<p>&nbsp;</p>\r\n<h3>Items</h3>\r\n<div class="store-item" style="width: 46%; margin-right: 4%; display: inline-block;">\r\n<div style="box-sizing: border-box; font-size: 14px; font-family: ''Helvetica Neue'', sans-serif; max-height: 631px; min-width: 200px; overflow: hidden;">\r\n<div style="box-sizing: border-box; height: 0px; overflow: hidden; padding-bottom: 100%; padding-top: 88px; position: relative;"><iframe style="height: 100%; position: absolute; top: 0px; left: 0px; width: 100%;" src="https://squareup.com/embeds/merchandiser?merchant_id=emerson-college-quidditch-3&amp;focus_item_id=shot-glass&amp;square_lead=item_embed" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></div>\r\n</div>\r\n</div>\r\n<div class="store-item" style="width: 46%; display: inline-block;">\r\n<div style="box-sizing: border-box; font-size: 14px; font-family: ''Helvetica Neue'', sans-serif; max-height: 631px; min-width: 200px; overflow: hidden;">\r\n<div style="box-sizing: border-box; height: 0px; overflow: hidden; padding-bottom: 100%; padding-top: 88px; position: relative;"><iframe style="height: 100%; position: absolute; top: 0px; left: 0px; width: 100%;" src="https://squareup.com/embeds/merchandiser?merchant_id=emerson-college-quidditch-3&amp;focus_item_id=ecq-poster&amp;square_lead=item_embed" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></div>\r\n</div>\r\n</div>\r\n<div class="store-item" style="width: 46%; display: inline-block;">\r\n<div style="box-sizing: border-box; font-size: 14px; font-family: ''Helvetica Neue'', sans-serif; max-height: 631px; min-width: 200px; overflow: hidden;">\r\n<div style="box-sizing: border-box; height: 0px; overflow: hidden; padding-bottom: 100%; padding-top: 88px; position: relative;"><iframe style="height: 100%; position: absolute; top: 0px; left: 0px; width: 100%;" src="https://squareup.com/embeds/merchandiser?merchant_id=emerson-college-quidditch-3&amp;focus_item_id=bracelet&amp;square_lead=item_embed" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id="store-list">\r\n<h3>Clothing</h3>\r\n<ul>\r\n<li><a href="https://squareup.com/market/emerson-college-quidditch-3/sweatshirt">Bludger On Sweatshirt &ndash; $25.00</a></li>\r\n<li><a href="https://squareup.com/market/emerson-college-quidditch-3/ecq-crest-long-sleeve-shirt">ECQ Crest Long Sleeve Shirt &ndash; $20.00</a></li>\r\n<li><a href="https://squareup.com/market/emerson-college-quidditch-3/sweatpants">ECQ Sweatpants &ndash; $20.00</a></li>\r\n<li><a href="https://squareup.com/market/emerson-college-quidditch-3/t-shirt">Flying Snitch T-Shirt &ndash; $15.00</a></li>\r\n<li><a href="https://squareup.com/market/emerson-college-quidditch-3/snitches-hoes-t-shirt">Snitches &lsquo;n Hoes T-Shirt &ndash; $15.00</a></li>\r\n<li><a href="https://squareup.com/market/emerson-college-quidditch-3/three-hoops-t-shirt">Three Hoops T-Shirt &ndash; $15.00</a></li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<h3>Items</h3>\r\n<ul>\r\n<li><a href="https://squareup.com/market/emerson-college-quidditch-3/shot-glass">ECQ Crest Shot Glass &ndash; $7.00</a></li>\r\n<li><a href="https://squareup.com/market/emerson-college-quidditch-3/ecq-poster">ECQ Poster &ndash; $5.00</a></li>\r\n<li><a href="https://squareup.com/market/emerson-college-quidditch-3/bracelet">ECQ Wristband &ndash; $1.00</a></li>\r\n</ul>\r\n</div>', '', 'Store', '', ''),
(44, 44, 'en', 'Get Involved', '<p>Besides being an intramural sports league, there&rsquo;s much more to Emerson College Quidditch! We have various departments to get involved in, and we&rsquo;re always looking for people interested in contributing to our organization. Here is some information about the various departments that make up ECQ:</p>\r\n<p>&nbsp;</p>\r\n<h4>Gameplay Department</h4>\r\n<p><em>Gameplay Director: <a href="mailto:gameplay@emersonquidditch.org?subject=Gameplay%20Department%20Inquiry">gameplay@emersonquidditch.org</a></em><br />We&rsquo;re always looking for talented referees to regulate our games! The Gameplay department oversees referees, snitches, and more. Skilled referees are very important to a sport as complex as quidditch!</p>\r\n<p>&nbsp;</p>\r\n<h4>Communications Department</h4>\r\n<p><em>Communications Director: <a href="mailto:communications@emersonquidditch.org?subject=Communications%20Department%20Inquiry">communications@emersonquidditch.org</a></em><br />Do you like journalism or writing? The Communications department creates content for our newsletters and website about Intramural League games, profiles, features, and more. All are welcome to write for ECQ, no matter what major you are!</p>\r\n<p>&nbsp;</p>\r\n<h4>Media Department</h4>\r\n<p><em>Media Director: <a href="mailto:media@emersonquidditch.org?subject=Media%20Department%20Inquiry">media@emersonquidditch.org</a></em><br />The Media department organizes photographers and videographers to document our Intramural League games, as well as various creative projects. If you like taking photos, we like you!</p>\r\n<p>&nbsp;</p>\r\n<h4>Sales/Marketing Department</h4>\r\n<p><em>Sales/Marketing Director: <a href="mailto:sales@emersonquidditch.org?subject=Sales%20Department%20Inquiry">sales@emersonquidditch.org</a></em><br />When we&rsquo;re not playing quidditch, we still want to see you! If you want to plan events like movie nights, video game tournaments, and more, then you should join the Sales/Marketing department.</p>', '', 'Get Involved', '', ''),
(45, 45, 'en', 'Contact', '<p>For all inquiries relating to Emerson College Quidditch, please email <a href="mailto:info@emersonquidditch.org">info@emersonquidditch.org</a> with your name, contact information, and what the inquiry is about and we will get back to you. Thank you!</p>', '', 'Contact', '', ''),
(46, 46, 'en', 'Fall 2014 Executive Board Candidates', '<p>The following individuals will be running for the following Executive Board positions: Vice President, Communications Director, Media Director, Intramural League Captains (Berserkers, Falcons, Jaguars, Outlaws, Pulverizers). Please take some time to read their statements regarding their bid for the position. Elections will be held at ECQ&rsquo;s banquet and elections from 5:00pm to 8:00pm in Piano Row L151 on November 21st, 2014. RSVP to the <a href="https://www.facebook.com/events/765625576807096/?ref_dashboard_filter=upcoming&amp;sid_reminder=8463975648023543808" target="_blank" rel="noopener">Facebook event here</a>. Voting will be in-person at the event; no absentee ballots will be permitted. We look forward to seeing you at elections!</p>\r\n<hr />\r\n<h3>Vice President</h3>\r\n<p><strong>Lindsey Simpson</strong><br />I was appointed as VP in the fall and now officially have to run and get voted in. So far I&rsquo;m pretty alright at what I do.</p>\r\n<hr />\r\n<h3>Communications Director</h3>\r\n<p><strong>Cornelia Tzana</strong><br />The communications director needs to know how to (obviously) communicate with people both in and out of the Emerson community. As a tour guide I often have to communicate with prospective students and their families. I have worked in customer service jobs as well, which require fast-paced thinking and good people skills. Being a Marketing major I believe that I also have knowledge that I could use to assist the Sales/Marketing Director with our social media content and the general promotion of ECQ. I really love the Quidditch community and the sport itself and I think it would be great to be part of the Executive Board in order to improve and expand its reach both in House League and the World Cup.</p>\r\n<hr />\r\n<h3>Media Director</h3>\r\n<p><em>There have been no nominations for Media Director.</em></p>\r\n<hr />\r\n<h3>Berserkers Captain</h3>\r\n<p><strong>Daniel Marti</strong><br />Please elect me for poorly thought out jokes, bad movie references, lame parties, a winless season and more awkwardness than you could ever hope for.<br />DO IT. NOW.</p>\r\n<hr />\r\n<h3>Falcons Captain</h3>\r\n<p><strong>David Carliner</strong><br />I want to be America&rsquo;s Next Top Falcons Captain so I can lead the team to victory alongside the love of my life, Lindsay Geller. Together we will bring la junta to new heights, both in terms of attractiveness and Quidditch success. While I&rsquo;m currently working on a video speech that will be a much better pitch, here are three quick reasons why I&rsquo;m the right guy for the job: 1) I will probably cry if I don&rsquo;t get elected, 2) my legs look great from all the walking I&rsquo;ve been doing in Europe, and 3)Lindsay and I would literally be THE cutest as co-captains.</p>\r\n<p><strong>Josh Friedman</strong><br />Although I am just a freshman this year and it is my first year ever playing Quidditch, I feel that I have what it takes to be a captain for the Falcons. Throughout high school I was involved with sports teams every season, as both a player and a captain. I understand what it means to be on a team as well as how to coach/captain a team to play its very best. Even now I am playing on Boston Riot and learning so much more about the sport, faster than I thought possible. With one my teams captains leaving at the end of this semester the Falcons will be losing a beloved leader to teach us how to be the best we can be, and play to the best of our abilities. And with our teams endless potential, losing a great captain to hone our skills is not okay. That is why I believe I should be elected captain of the Faneuil Falcons because although I may not have as much experience as some of the other players on my team, I understand what it means to have fun, play as a team and most importantly look good while doing it. So please elect me, Josh Friedman as captain of the Faneuil Falcons <img class="wp-smiley" src="../../../wp-includes/images/smilies/icon_smile.gif" alt=":)" /></p>\r\n<p><strong>Jeremy Liang</strong><br />I am interested in being the Faneuil Falcons captain because I truly want to make a difference. I love playing Quidditch so much that I want to be in a position that will help make the experience great for everyone.<br />In my time of playing Quidditch, I have learned many things. Of course, I definitely have room for improvement but that&rsquo;s what I look forward to the most. The way I see it, everyone has room for improvement and I want to be able to help everyone as much as I can.<br />I know I would do a good job as a co-captain. I am passionate, friendly, team-spirited, and dedicated. For those of y&rsquo;all who see me at practices and games, I can be seen dancing around, cheering for people, or taking pictures; however, when the situation calls for it, I can be serious. I am also always willing to help whenever and however I can. If you ask the members of the World Cup team, they will tell you that I run around campus delivering dumplings, despite not being on the team. That said, I am also willing to set up fundraisers to get the funds we need to get newer, better, or more much needed equipment.<br />As a freshman, I may not seem like someone who should be a captain or an E-board member, but I will put forth great effort to filling the role. Whether it is attending games, practices, or meetings, you can bet that I will be there giving it my all on and off the field.</p>\r\n<p><strong>Sam Scarfone</strong><br />Hi, I&rsquo;m Sam Scarfone. Falcons Flock together. Play well, look better. I&rsquo;m all about that team bonding. Viva la junta. Quack quack quack. And if you want a bigger stick between your legs then vote for me for the Faneuil Falcons captain! <img class="wp-smiley" src="../../../wp-includes/images/smilies/icon_wink.gif" alt=";)" /> #floasted #zoasted</p>\r\n<p><strong>Brian Tolep</strong><br />Back home at my high school the music wing was my home away from home and the students in it were my family. When I first arrived I was worried I wouldn&rsquo;t find a place like that here. That was before I found the Faneuil Falcons. At a extremely rapid pace I have grown fond of every member on my team, and I&rsquo;m sure they would all agree we are more than a team. To take the opportunity of being the captain of a team as impressive and attractive as ours would be an absolute honor. I may not have been playing for very long, but I have learned a lot in my time on the Falcons. Between what I have learned from my current Falcon captains as well as what I will learn from recently joining Boston Riot, I feel I could be a great asset for Captain. I have been in leadership positions before back in high school. I was Tri-M president as well as Vice President of our Thespian Society. I would, of course, be a fair captain and would make sure everyone gets equal playing time. I also will make sure to have as much time for my team as possible. I view my responsibility as a captain as one thing: to give back as much, if not more, opportunity and spirit as given to me by this team. What this team puts in I will put out tenfold. Falcons vote for me Brian Tolep to help head this flock to victory during the spring semester QUACK QUACK QUACK!</p>\r\n<p><strong>Cornelia Tzana</strong><br />I have been with the Falcons since the very first semester and I am an active member of the team. I think that my experience, my good relations with my teammates and my constant presence are assets that a captain needs. I love this team and I think that being a captain would be a great experience in itself.</p>\r\n<hr />\r\n<h3>Jaguars Captain</h3>\r\n<p><strong>Rachel Halilej</strong><br />Since my first day at Emerson College, I knew I wanted to paly quidditch. I was never a very sporty kid, but I figured, since I loved the books so much I didn&rsquo;t have to be sporty. And I was right. The intramural league is one of the most accepting and open groups of people I have ever had the pleasure of getting to know. I want to be captain so I can encourage people like myself to join this community and play the amazingly hilarious game that is quidditch. I want to be captain because I want to lead the JP Jaguars, an amazing team with committed individuals, to victory while having a fun time. It can be difficult to balance the two. I&rsquo;ve seen my future co-captain Leeanne Dillmann do it for two years now. And I think I would be able to do it as well. I love the Jaguars. And I love Emerson&rsquo;s intramural league. The best way to show that love, I think, is to run for Jaguar captain and help kids like me find a community unlike any they had been a part of before.</p>\r\n<p><strong>Michael Kiaunis</strong><br />&ldquo;Michael Kiaunis.&rdquo; Two words? A name? A state of mind? No. &ldquo;Michael Kiaunis&rdquo; is not any of those things. &ldquo;Michael Kiaunis&rdquo; is a Captain. Your captain. &ldquo;Michael Kiaunis&rdquo; will take the Jaguars, and bring them to the top. And do you know what happens when we get to the top? I sure don&rsquo;t. I am &ldquo;Michael Kiaunis&rdquo; and, with your vote, we can get to the top together, and figure out what the heck we do once we get there. If appointed Captain of our humble Quidditch team, I will bring more pep and spirit to our already fabulous team. Following in the footsteps of the beautiful Jagger Kugler I, Mick Kiaunis, will attend every practice and game throughout the season and make sure everyone has as much fun as possible. Our biggest problem at the moment is representation at games and practices. Without the entire team at all of our games, our chances of winning are significantly lower than if we had a full group. I will push for more players to be at the games, and make sure those who attend them regularly are rewarded. I really don&rsquo;t know what else to write here so I&rsquo;m just gonna post so Ruby Tuesday lyrics to take up as much space as possible: Goodbye, Ruby Tuesday Who could hang a name on you? When you change with every new day. Still I&rsquo;m gonna miss you. Well that took up some good space and I&rsquo;m done now. Leap, Kill, Love &lt;3</p>\r\n<h3>Outlaws Captain</h3>\r\n<p><strong>Rebecca Contreras</strong><br />I&rsquo;ve been on the Outlaws for 4 years now. I love the outlaws with all my heart. This team has been the bright light throughout my Emerson career. I have experience both house league and world cup. I know what it takes to win and more importantly what it takes to be a team. I want the outlaws to be loved again in the league and want every single person on the team to get play time, feel valued and improve. This team has given me so much and I just want to give it back. oh, and I BLEED BLUE</p>\r\n<p><strong>David Fox</strong><br />I was captain of the Outlaws in the 2012-2013 season, when we last won the Griffith Cup(!!!!) and am currently one of the captains of Emerson&rsquo;s world cup team. With my involvement on both sides of quidditch at this school, I think that I have a good grasp of how to balance fun and lightheartedness with a desire to compete. You guys already know what I can do on the field, and I want to use my knowledge and experience with the game to help the Outlaws win the Cup again.</p>\r\n<hr />\r\n<h3>Pulverizers Captain</h3>\r\n<p><strong>Carly Cazer</strong><br />My last two years of school have been hectic to say the least. And what I have missed most of the things I was forced to sacrifice is Quidditch. And more than that, I&rsquo;ve missed my team. As my graduation date approaches, I am ready to get back to my favorite team on the planet and play with them. But more than that, I would like to leave them with something valuable. As captain, I hope to bring them together as a family even closer than they are now with the help of Kieran Collier and welcome all future Pulvies with a smile and instill our team with a sense of positivity and determination. I want nothing more than the Pulvierizers to be a much bigger part of my time and legacy at Emerson.</p>\r\n<p><strong>Michael O&rsquo;Connor</strong><br />I&rsquo;ve really come to love Quidditch starting out freshmen year I was hesitant to join, but spring semester I found just how enjoyable it was and by this semester I really bonded with my team to the point where they are a huge part of my self-identity. I want to keep that going with the Pulverizers, they have been so welcoming and kind to me I just want to keep the tradition going and make sure that future students feel the same way. Also I&rsquo;m competitive with an athletic background and this serves as a great outlet for my own personal health and I think have a lot to offer in the way of staying injury-free and excelling gameplay.</p>\r\n<p><strong>Tyler Osman</strong><br />The reason I am interested in running for team captain of the Park Street Pulverizers is because from this fall season I feel I&rsquo;ve been able to help lead my team into each game by putting us into situations where we could win or be close to. I also feel I was a huge asset to the team both offensively and defensively by, along with my former captain Kieran Collier and former captain Vernon Lickfield, by helping putting in strategy where it was needed and helped keep my team in games that almost appeared to be hopeless for us to win or make it a close game. And I&rsquo;ve also been able to get extra experience and knowledge of the game of quidditch from playing for the Boston Riot which has given me much experience and ideas of strategy to be able to apply to the Pulverizers if I were to be elected captain. And because of these things I&rsquo;ve done, I feel I can be a great leader for the Pulverizers and help them become a great team in house league play. But the biggest reason I want to be captain of the Pulverizers is because I feel they are such a great team full of wonderful and talented individuals and I would love to be able to lead them for many years and season to come.</p>', '<p>The following individuals will be running for the following Executive Board positions: Vice President, Communications Director, Media Director, Intramural League Captains (Berserkers, Falcons, Jaguars, Outlaws, Pulverizers). Please take some time to read their statements regarding their bid for the position. Elections will be held at ECQ&rsquo;s banquet and elections from 5:00pm to 8:00pm in Piano Row L151 on November 21st, 2014. RSVP to the <a href="https://www.facebook.com/events/765625576807096/?ref_dashboard_filter=upcoming&amp;sid_reminder=8463975648023543808" target="_blank" rel="noopener">Facebook event here</a>. Voting will be in-person at the event; no absentee ballots will be permitted. We look forward to seeing you at elections!</p>', 'Fall 2014 Executive Board Candidates', '', ''),
(47, 47, 'en', 'Fall 2014 Executive Board Nominations', '<p>Interested in running Emerson College Quidditch? Well you&rsquo;re in luck. We are seeking enthusiastic members for our 2015 spring Executive Board! All members of Emerson College Quidditch are eligible to run for a position on our Executive Board.</p>\r\n<p>You can submit your nomination using <a href="https://docs.google.com/forms/d/1dI6j0aNcPCtrDYK8SiZ4_hc7HOlDtQZwU-uXLUOrhig/viewform?edit_requested=true" target="_blank" rel="noopener">this Google Form</a>. You can submit your name for nomination for as many positions as you want, but please submit only one nomination per form. All nominations are due by midnight on Sunday, November 9th. Please note that holding an elected position on our Executive Board requires attendance at weekly meetings.</p>\r\n<p>We are also looking for dedicated members to fill some non-voting positions within the organization. These are unelected positions that current members volunteer for, and these non-voting positions do not require attendance at weekly Executive Board meetings (although attendance is encouraged). The current members in these positions will reach out to those expressing interest.</p>\r\n<p>The descriptions for both elected Executive Board positions and volunteer positions are listed below, taken directly from our Constitution. If you have any questions, please contact Lindsey Simpson at <a href="mailto:vp@emersonquidditch.org">vp@emersonquidditch.org</a>. We look forward to receiving your nominations!</p>\r\n<h3>Elected Positions</h3>\r\n<p><strong>Vice President:</strong><br />The Vice President assists the Commissioner in any and all ways, attending all meetings with the Commissioner. They are responsible for working with other divisions to ensure that teams have practice time and space, as well as time and space for outdoor organization-wide events (such as Intramural League games). This may include obtaining permits for field space near and around Emerson College. It is the Vice President&rsquo;s responsibility to act as the Commissioner during his/her absence, assist in day-to-day logistical workings of the organization, and assist other members of the E-Board with Intramural League management and other projects.</p>\r\n<p><strong>Communications Director:</strong><br />The Communications Director oversees and manages all communication efforts produced by the organization. This may include organizing newsletters and organization-wide emails, helping answer questions from outside press interested in learning about quidditch and ECQ, and assisting other members of the E-Board and organization with Intramural League management and other projects. They are also responsible for maintaining a record of the organization&rsquo;s history. The Communications Director works with the Media Director and Sales/Marketing Director to compile content for newsletters, social media, and the website. The Communications Director is also responsible for putting together a team that writes articles on all Intramural League games, as well as other events.</p>\r\n<p><strong>Media Director:</strong><br />The Media Director oversees and manages all photo and video aspects of the organization. This may include organizing photographers and videographers to document Intramural League gameplay, editing photos and videos, and putting together promotional material. The Media Director works with the Communications Director, the Sales/Marketing Director, the Social Media Manager, and the Webmaster to supply photo and video material when necessary.</p>\r\n<p><strong>Intramural League Captains:</strong><br />The Intramural Captains are the leaders of the individual Intramural League teams which are as follows: Boylston Berserkers, Faneuil Falcons, Jamaica Plains Jaguars, Old North Outlaws, Park Street Pulverizers, and South End Slothbears. Intramural League teams have a near equivalent number of players. For every team there must be two captains, and only one captain may play on the field at a time to ensure objectivity of the game. Intramural Captains will draft their team at the beginning of the season, organize practices, educate player members on the game of quidditch, and lead their teams in sportsmanlike gameplay against other Intramural League teams.</p>\r\n<p>For the 2015 spring semester, we are looking for captains for the following Intramural League teams (number denotes open captain positions): Boylston Berserkers (1), Faneuil Falcons (1), Jamaica Plain Jaguars (1), Old North Outlaws (1), Park Street Pulverizers (1).</p>\r\n<h3>Non-Voting Positions</h3>\r\n<p><strong>Social Media Manager and Webmaster</strong><br />The Social Media Manager and Webmaster are non-voting positions with a standing invitation to attend E-Board meetings. They are responsible for managing all social media (Facebook page, Twitter, and Tumblr) and website, respectively. They are positions that are assigned by the current Commissioner or Media Director for convenience in the same manner as detailed in Article XIII Section 8. Since they are non-voting positions, they may be assigned to either current E-Board members or other League Members of ECQ.</p>', '', 'Fall 2014 Executive Board Nominations', '', ''),
(48, 48, 'en', 'Rebirth of Falcon Nation', '<p>In a complete 180&deg; turn of events after last season, the Faneuil Falcons opened strong to beat the Old North Outlaws in three games.</p>\r\n<p>The first game ended on a spectacular snitch grab by Falcons captain Sean Cardwell. With his back to the snitch, and wrapped, Cardwell snaked his arms around himself and the snitch runner and caught the snitch inches from hitting the ground. The Falcons won the first game 90*-70.</p>\r\n<p>The Outlaws roared back to win the second game, 110*-40.</p>\r\n<p>The last game of three was tied 50-50 when Dom Bailey caught the snitch before David Fox, winning the game for the Falcons 80*-50.</p>\r\n<p>Outlaw Captain Matt Williams said &ldquo;The Outlaws want to prove that our undefeated season two years ago wasn&rsquo;t a fluke. Meanwhile the Falcons are being very successful in their rebuilding&hellip;both teams showed they will be a force the be reckoned with this semester. Don&rsquo;t count the Outlaws out yet by any means.&rdquo; About the Outlaws defeat, William said &ldquo;the Falcons brought their A game. It could have gone either way, because we were clearly very evenly matched teams and this time it went in the Falcons favor.&rdquo;</p>\r\n<p>Last year, the Falcons were the butt of jokes for Emerson College Quidditch&rsquo;s intramural league, having only won one game. Cardwell said &ldquo;The Falcons are back, and ECQ knows we are here to stay.&rdquo;</p>\r\n<p>The Falcons previously won the Griffith Cup in 2009.</p>', '<p>In a complete 180&deg; turn of events after last season, the Faneuil Falcons opened strong to beat the Old North Outlaws in three games. The first game ended on a spectacular snitch grab by Falcons captain Sean Cardwell. With his back to the snitch, and wrapped, Cardwell snaked his arms around himself and the snitch runner and caught the snitch inches from hitting the ground. The Falcons won the first game 90*-70.</p>', 'Rebirth of Falcon Nation', '', ''),
(49, 49, 'en', 'ECQ World Cup', '', '', 'ECQ World Cup', '', ''),
(50, 50, 'en', 'New Faces for ECQ World Cup and the Return of the Riot', '<p>Following an impressive turnout for Emerson College Quidditch&rsquo;s 2014 fall combine were tryouts for the league&rsquo;s World Cup team. The team, finding tremendous success its 2013-14 season with a Final Four run at World Cup VII, hoped to find promising talent to add to their 2014-15 roster. However, unlike last year&rsquo;s tryouts, the World Cup team held joint tryouts with the Boston Riot. The Boston Riot, to those who aren&rsquo;t familiar, is a community team* affiliated with Emerson College. They surprised the quidditch community with an underdog inaugural season, qualifying for World Cup VI at the 2012 Northeast Regional Championship. However, last season the team failed to compete in IQA official tournaments due to a lack of clear direction and leadership.</p>\r\n<p>This year&rsquo;s joint tryouts might be what the Riot needs to revitalize. Approximately 40 players participated in the two-day tryout process on September 13th and September 14th. World Cup captains Leeanne Dillmann, David Fox, and Tyler Trudeau watched alongside Riot captains Sean Clampett and Louie Contino as tryouts panned out. The first day of tryouts had players go through position-specific drills, sprints and conditioning, and scrimmages. Day two of tryouts was by invitation of either team; World Cup held their tryouts first, followed by the Riot. After day two, which was different for both teams, captains met separately to carefully craft their rosters for the season.</p>\r\n<p>The complete rosters for both teams are listed at the end of this article, but here&rsquo;s a quick analysis for those who these names mean nothing (&hellip;yet). Following a large loss of players to graduation, the World Cup team is bringing back a fair amount of players including Lyle Thomes, Jake Hines, Maggie Noren, Capri DeBiccari, and Nathaniel Charles. The team also brought back Pablo Calder&oacute;n Santiago, Todd Michell, and Paulina Pascual, who will all be leaving the team at the end of the fall semester due to graduation and external study programs. Familiar faces from the Riot include Tim Lawson, Z Kuester, and Austin Mohn, while Lindsay Geller and Dan Goldberg are familiar from fantasy tournaments this past summer.</p>\r\n<p>Meanwhile, the Boston Riot has built a roster basically from scratch, but there are some notable names on there as well. Besides the team&rsquo;s captains, the only returning players to the Riot are Alex Uriati, who played during the team&rsquo;s inaugural season, and Emily Yumkas, who played with the team last season. And it&rsquo;s important to note the addition of Eli Page and Griffin Conlogue; the former played for ECQ while the latter was on Q.C. Boston: The Massacre. Both can be expected to bring athleticism and experience as the team gets back on its feet. The rest of their roster is filled with familiar faces from ECQ&rsquo;s intramural league, including Becca Chairin, Dan Makie, Daniel Marti, Jamie Ahlborn, Jez Insalaco, Kieran Collier, Lindsey Simpson, Lui Fenty, Rachelle Martin, and Vernon Lickfeld.</p>\r\n<p>Both teams have a handful of new faces to Emerson College Quidditch and quidditch as a whole. While ECQ has their returning players to count on, they also have a variety of talent they&rsquo;ll need to train into the team that always sees repeat success. The Boston Riot may have an easier time with creating a team identity, but it will also take a lot of work if the team is to achieve what its captains have hopes for. Regardless, here&rsquo;s to the new faces of ECQ and the return of the Riot!</p>\r\n<p>&nbsp;</p>\r\n<p><strong>ECQ World Cup</strong><br />Coach &ndash; Rose Pleuler<br />K/C &ndash; David Fox (Captain)<br />K &ndash; Tyler Trudeau (Captain)<br />C/K &ndash; Lyle Thomes<br />C &ndash; Pablo Calder&oacute;n Santiago<br />C/K &ndash; Dom Bailey<br />C &ndash; Lorenzo Rossi<br />C/K &ndash; Paul Grant<br />C/B &ndash; Jake Hines<br />C &ndash; Rui Jiang<br />C &ndash; Tim Lawson<br />C &ndash; Maggie Noren<br />C &ndash; Stephanie Breen<br />C/B &ndash; Siobhan Dolan<br />C/B &ndash; Capri DeBiccari<br />B/C &ndash; Leeanne Dillmann (Captain)<br />B &ndash; Mary Cueva<br />B &ndash; Lindsay Geller<br />B &ndash; Z Kuester<br />B &ndash; Paulina Pascual (Team Manager)<br />B &ndash; Austin Mohn<br />B &ndash; John General<br />B/S &ndash; Jose Canas<br />B &ndash; Todd Mitchell<br />B/K/S &ndash; Dan Goldberg<br />S/C &ndash; Nathaniel Charles</p>\r\n<p><strong>The Boston Riot</strong><br />C &ndash; Becca Chairin<br />C &ndash; Alex Uriati<br />C &ndash; Dan Makie<br />C &ndash; Daniel Marti<br />C &ndash; Eli Page<br />C &ndash; Emily Yumkas<br />C/B &ndash; Griffin Conlogue<br />C &ndash; Jamie Ahlborn<br />B &ndash; Jez Insalaco<br />C &ndash; Josh Friedman<br />C &ndash; Kieran Collier<br />B &ndash; Lindsey Simpson<br />K &ndash; Louie Contino (Captain)<br />K/B &ndash; Sean Clampett (Captain)<br />C &ndash; Lui Fenty<br />C &ndash; Martha Connolly<br />B &ndash; Rachelle Martin<br />C &ndash; Rey Sowan<br />K &ndash; Tyler Osman<br />B &ndash; Vernon Lickfeld<br />C &ndash; Xavier Garcia<br />C &ndash; Yaslynn Rivera</p>\r\n<p><em>Please note that these rosters are fluid and may change as the season progresses. As of the time this article was written, these are the official rosters from both teams&rsquo; captains. Players, positions, and overall rosters may change.</em></p>\r\n<p>*The IQA (now USQ) does not allow more than one team to be affiliated with a college or university. Therefore, the Boston Riot was registered as a community team composed mostly of Emerson students.</p>', '<p>Following an impressive turnout for Emerson College Quidditch&rsquo;s 2014 fall combine were tryouts for the league&rsquo;s World Cup team. The team, finding tremendous success its 2013-14 season with a Final Four run at World Cup VII, hoped to find promising talent to add to their 2014-15 roster. However, unlike last year&rsquo;s tryouts, the World Cup team held joint tryouts with the Boston Riot. The Boston Riot, to those who aren&rsquo;t familiar, is a community team* affiliated with Emerson College. They surprised the quidditch community with an underdog inaugural season, qualifying for World Cup VI at the 2012 Northeast Regional Championship. However, last season the team failed to compete in IQA official tournaments due to a lack of clear direction and leadership.</p>', 'New Faces for ECQ World Cup and the Return of the Riot', '', ''),
(51, 51, 'en', 'Can I Have Your Number?', '<p>&ldquo;Can I have your number&rdquo; was a phrase heard all day at Emerson College Quidditch&rsquo;s intramural combine, as captains scouted players for that night&rsquo;s draft. Each year the combine is the first major opportunity for new players to show their skills and start making a name for themselves in house league.</p>\r\n<p>The first-time players warmed up with some drills and then transitioned to scrimmaging once they were familiar with the game. From the first game this draft class showed a natural feel for teamwork. There were a lot of times when teams would work the quaffle between all four players before getting a good shot at the hoops. Beaters were also playing well that afternoon. They ended a lot of drives with their accurate beats, and battled back and forth with each other for bludger control. Overall, the 2014 draft class was giving the captains a lot to watch out for.</p>\r\n<p>One player who turned heads as soon as his broom left the ground was John &ldquo;The General&rdquo; General. He immediately took command through his beating, showing a natural grasp for field spacing. Later in the day he even went in at keeper and scored a handful of goals using his speed and strength. This was one player whose number was known by all captains before he ever stepped off the field.<br />Captains weren&rsquo;t just looking for the most athletic players though. Many of them often look at other elements to decide who to pick, because they want the new players to fit in with the particular vibe that each team has. The captains also have to consider which positions they need filled the most.</p>\r\n<p>At the end of the combine, the spectators in attendance felt that these new quidditch players had done very well. All of the house league captains were excited at its depth, because that means a wealth of new players for every team. Look for many of these new players to make an impact from their first weekend onward.</p>', '<p>&ldquo;Can I have your number&rdquo; was a phrase heard all day at Emerson College Quidditch&rsquo;s intramural combine, as captains scouted players for that night&rsquo;s draft. Each year the combine is the first major opportunity for new players to show their skills and start making a name for themselves in house league.</p>', 'Can I Have Your Number?', '', ''),
(52, 52, 'en', 'Fall 2014 Draft Results', '<p>Thank you all for an awesome combine and draft for the fall 2014 semester! We had an impressive turnout, and we&rsquo;re excited for the season to start. Here are the official rosters of new players for ECQ!</p>\r\n<p><strong>Boylston Berserkers:</strong><br />Alyssa Ahlert, Brynna Danaher, Egan Davis, Patricia de la Garza, Max Fallows, Xavier Garcia, Harrison Jeffs, Sarah Massoni, Evelyn Oliverio, Yaslynn Rivera, Rachael Samson, and Sami Warkow</p>\r\n<p><strong>Faneuil Falcons:</strong><br />Keley Aijala, Jason Blanton, Drew Bushnell, Lauren Corcuera, Josh Friedman, Maya Gandara, Suzie Hicks, Kelly Hills, Aaron Kenigsberg, Isabella Kestermann, Rui Jiang, Jeremy Liang, Elliot Patrick, Dante Pena, Rose Reses, Sam Scarfone, Jack Schwartz, Brian Tolep, Christine Ulin, and Roberto Williams</p>\r\n<p><strong>Jamaica Plain Jaguars:</strong><br />Apurupa Balasubramanyam, Melissa Close, Martha Connolly, Lucas Dispoto, Siobhan Dolan, Rachel Ferrante, Benjamin Gilbert, Stephanie Gordon, Daniel Johnson-Carter, Michael Kiaunis, Liam O&rsquo;Connor-Genereaux, Lorenzo Rossi, Lily Rugo, Alex Sieklicki, David Stack, and Camila Zagarzazu</p>\r\n<p><strong>Old North Outlaws:</strong><br />Erin Burgess, Katie Conway, J. Grace Dineen, Liz Hamer, Katharine Johnson, Sam Kerman, Mitchell Kouchi, Johnnie Luna, Stefan Ng, Justin Ruiz, Rey Sleiman Sawan, and Danielle Zappi</p>\r\n<p><strong>Park Street Pulverizers:</strong><br />John General, Jack Hobbs, Luke Kao, Amanda Kochey, Lucie McCormick, Tyler Osman, Rose Paleologos, Julia Vacchiano, and Alex Whisenhunt</p>\r\n<p><strong>South End Slothbears</strong><br />Stephanie Breen, Jose Canas, Richard Charity, Paul Grant, and Samantha Lerman</p>', '<p>Thank you all for an awesome combine and draft for the fall 2014 semester! We had an impressive turnout, and we&rsquo;re excited for the season to start. Here are the official rosters of new players for ECQ!</p>', 'Fall 2014 Draft Results', '', ''),
(53, 53, 'en', 'Archive', '', '', 'Archive', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `page-page`
--

CREATE TABLE `page-page` (
  `id` int(11) NOT NULL,
  `pageParentID` int(11) NOT NULL,
  `pageChildID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page-page`
--

INSERT INTO `page-page` (`id`, `pageParentID`, `pageChildID`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 1, 4),
(4, 2, 5),
(5, 23, 18),
(6, 23, 24),
(9, 23, 25),
(11, 23, 26),
(13, 30, 29),
(15, 31, 33),
(16, 31, 32),
(17, 38, 39),
(18, 36, 38),
(19, 38, 40),
(20, 41, 42),
(24, 30, 47),
(26, 30, 48),
(28, 49, 50),
(30, 49, 51),
(32, 49, 52),
(34, 30, 46);

-- --------------------------------------------------------

--
-- Table structure for table `page-route`
--

CREATE TABLE `page-route` (
  `id` int(11) NOT NULL,
  `pageID` int(11) NOT NULL,
  `routeID` int(11) NOT NULL,
  `alias` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page-route`
--

INSERT INTO `page-route` (`id`, `pageID`, `routeID`, `alias`) VALUES
(1, 2, 3, 'family-banking-tips'),
(2, 3, 1, 'providing-more-services-for-my-clients'),
(3, 4, 1, 'forex-education-top-5-currency-trading-essentials-that-can-help-you-to-improve-your-trading'),
(4, 5, 1, 'john-thomas-financial-nys-brokerage-and-financial-company'),
(5, 6, 3, 'privacy'),
(7, 8, 9, 'main'),
(9, 9, 9, 'nachhilfe-vermittlung'),
(10, 10, 9, 'nachhilfeschulen'),
(12, 11, 9, 'news-und-infos'),
(13, 12, 9, 'suche'),
(15, 14, 8, 'kontakt'),
(33, 13, 8, 'uber-uns'),
(36, 15, 8, 'test'),
(39, 17, 11, 'main'),
(41, 19, 11, 'about-us'),
(42, 20, 11, 'our-approach'),
(43, 21, 11, 'careers'),
(44, 22, 11, 'apply'),
(46, 23, 11, 'news-and-events'),
(47, 18, 10, 'taking-time'),
(48, 16, 10, 'apex-admin'),
(50, 24, 10, 'tips'),
(53, 25, 10, 'inc'),
(57, 26, 10, 'post-data-data'),
(59, 28, 13, 'main'),
(64, 29, 12, 'test'),
(66, 31, 13, 'about'),
(69, 33, 15, 'e-board'),
(70, 32, 15, 'mission'),
(72, 35, 13, 'media'),
(73, 36, 13, 'intramural-league'),
(74, 37, 16, 'standings'),
(77, 39, 17, 'berserkers'),
(78, 38, 16, 'teams'),
(79, 40, 17, 'jaguars'),
(80, 41, 13, 'world-cup'),
(82, 42, 18, 'history'),
(83, 43, 13, 'store'),
(84, 44, 13, 'get-involved'),
(85, 45, 13, 'contact'),
(89, 47, 12, 'fall-2014-executive-board-nominations'),
(90, 48, 12, 'rebirth-of-falcon-nation'),
(92, 50, 12, 'new-faces-for-ecq-world-cup-and-the-return-of-the-riot'),
(93, 51, 12, 'can-i-have-your-number'),
(94, 52, 12, 'fall-2014-draft-results'),
(98, 49, 14, 'ecq-world-cup'),
(99, 30, 14, 'ecq-house-league'),
(101, 27, 19, 'lindseysimpson'),
(102, 46, 12, 'fall-2014-executive-board-candidates'),
(105, 53, 13, 'archive'),
(108, 34, 13, 'news');

-- --------------------------------------------------------

--
-- Table structure for table `page-type`
--

CREATE TABLE `page-type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `routeID` int(11) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `websiteID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page-type`
--

INSERT INTO `page-type` (`id`, `name`, `alias`, `routeID`, `isDeleted`, `websiteID`) VALUES
(1, 'Page', 'page', NULL, 0, 1),
(2, 'Post', 'post', NULL, 0, 1),
(3, 'Author', 'author', NULL, 0, 1),
(8, 'Page', 'page', 9, 0, 3),
(9, 'Post', 'post', 8, 0, 3),
(10, 'Category', 'category', NULL, 0, 3),
(11, 'Author', 'author', NULL, 0, 3),
(12, 'Page', 'page', NULL, 0, 4),
(13, 'Post', 'post', NULL, 0, 4),
(14, 'Category', 'category', NULL, 0, 4),
(15, 'Author', 'author', NULL, 0, 4),
(16, 'Page', 'page', NULL, 0, 5),
(17, 'Post', 'post', NULL, 0, 5),
(18, 'Category', 'category', NULL, 0, 5),
(19, 'Author', 'author', NULL, 0, 5),
(20, 'News', 'news', 12, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `pagination`
--

CREATE TABLE `pagination` (
  `id` int(11) NOT NULL,
  `template` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `websiteID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pagination`
--

INSERT INTO `pagination` (`id`, `template`, `isDeleted`, `websiteID`) VALUES
(1, 'page/<:page>', 0, 1),
(2, 'p=<:page>', 0, 1),
(4, 'page/<:page>', 0, 3),
(5, 'p=<:page>', 0, 3),
(6, 'page/<:page>', 0, 4),
(7, 'p=<:page>', 0, 4),
(8, 'page/<:page>', 0, 5),
(9, 'p=<:page>', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `websiteID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`id`, `name`, `link`, `priority`, `isDeleted`, `websiteID`) VALUES
(1, 'Content test', 'content/<:alias>', 1, 0, 1),
(3, 'Common', '<:alias>', 5, 0, 1),
(5, 'Route with GET', 'blog/<:alias>', 3, 0, 1),
(8, 'Post', 'inhalt/<:alias>', 1, 0, 3),
(9, 'Common', '<:alias>', 5, 0, 3),
(10, 'Post', 'content/<:alias>', 1, 0, 4),
(11, 'Common', '<:alias>', 5, 0, 4),
(12, 'Post', '<:year>/<:mm>/<:alias>', 3, 0, 5),
(13, 'Common', '<:alias>', 5, 0, 5),
(14, 'Category', 'category/<:alias>', 2, 0, 5),
(15, 'About section', 'about/<:alias>', 3, 0, 5),
(16, 'Intramural League', 'intramural-league/<:alias>', 3, 0, 5),
(17, 'Intramural League - Teams', 'intramural-league/teams/<:alias>', 2, 0, 5),
(18, 'World cup', 'world-cup/<:alias>', 2, 0, 5),
(19, 'Author', 'author/<:alias>', 2, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `source-message`
--

CREATE TABLE `source-message` (
  `id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `source-message`
--

INSERT INTO `source-message` (`id`, `category`, `message`) VALUES
(252, 'yii', '(not set)'),
(253, 'yii', 'An internal server error occurred.'),
(254, 'yii', 'Are you sure you want to delete this item?'),
(255, 'yii', 'Delete'),
(256, 'yii', 'Error'),
(257, 'yii', 'File upload failed.'),
(258, 'yii', 'Home'),
(259, 'yii', 'Invalid data received for parameter "{param}".'),
(260, 'yii', 'Login Required'),
(261, 'yii', 'Missing required arguments: {params}'),
(262, 'yii', 'Missing required parameters: {params}'),
(263, 'yii', 'No'),
(264, 'yii', 'No results found.'),
(265, 'yii', 'Only files with these MIME types are allowed: {mimeTypes}.'),
(266, 'yii', 'Only files with these extensions are allowed: {extensions}.'),
(267, 'yii', 'Page not found.'),
(268, 'yii', 'Please fix the following errors:'),
(269, 'yii', 'Please upload a file.'),
(270, 'yii', 'Showing <b>{begin, number}-{end, number}</b> of <b>{totalCount, number}</b> {totalCount, plural, one{item} other{items}}.'),
(271, 'yii', 'The file "{file}" is not an image.'),
(272, 'yii', 'The file "{file}" is too big. Its size cannot exceed {formattedLimit}.'),
(273, 'yii', 'The file "{file}" is too small. Its size cannot be smaller than {formattedLimit}.'),
(274, 'yii', 'The format of {attribute} is invalid.'),
(275, 'yii', 'The image "{file}" is too large. The height cannot be larger than {limit, number} {limit, plural, one{pixel} other{pixels}}.'),
(276, 'yii', 'The image "{file}" is too large. The width cannot be larger than {limit, number} {limit, plural, one{pixel} other{pixels}}.'),
(277, 'yii', 'The image "{file}" is too small. The height cannot be smaller than {limit, number} {limit, plural, one{pixel} other{pixels}}.'),
(278, 'yii', 'The image "{file}" is too small. The width cannot be smaller than {limit, number} {limit, plural, one{pixel} other{pixels}}.'),
(279, 'yii', 'The requested view "{name}" was not found.'),
(280, 'yii', 'The verification code is incorrect.'),
(281, 'yii', 'Total <b>{count, number}</b> {count, plural, one{item} other{items}}.'),
(282, 'yii', 'Unable to verify your data submission.'),
(283, 'yii', 'Unknown option: --{name}'),
(284, 'yii', 'Update'),
(285, 'yii', 'View'),
(286, 'yii', 'Yes'),
(287, 'yii', 'You are not allowed to perform this action.'),
(288, 'yii', 'You can upload at most {limit, number} {limit, plural, one{file} other{files}}.'),
(289, 'yii', 'in {delta, plural, =1{a day} other{# days}}'),
(290, 'yii', 'in {delta, plural, =1{a minute} other{# minutes}}'),
(291, 'yii', 'in {delta, plural, =1{a month} other{# months}}'),
(292, 'yii', 'in {delta, plural, =1{a second} other{# seconds}}'),
(293, 'yii', 'in {delta, plural, =1{a year} other{# years}}'),
(294, 'yii', 'in {delta, plural, =1{an hour} other{# hours}}'),
(295, 'yii', 'just now'),
(296, 'yii', 'the input value'),
(297, 'yii', '{attribute} "{value}" has already been taken.'),
(298, 'yii', '{attribute} cannot be blank.'),
(299, 'yii', '{attribute} is invalid.'),
(300, 'yii', '{attribute} is not a valid URL.'),
(301, 'yii', '{attribute} is not a valid email address.'),
(302, 'yii', '{attribute} must be "{requiredValue}".'),
(303, 'yii', '{attribute} must be a number.'),
(304, 'yii', '{attribute} must be a string.'),
(305, 'yii', '{attribute} must be an integer.'),
(306, 'yii', '{attribute} must be either "{true}" or "{false}".'),
(307, 'yii', '{attribute} must be greater than "{compareValue}".'),
(308, 'yii', '{attribute} must be greater than or equal to "{compareValue}".'),
(309, 'yii', '{attribute} must be less than "{compareValue}".'),
(310, 'yii', '{attribute} must be less than or equal to "{compareValue}".'),
(311, 'yii', '{attribute} must be no greater than {max}.'),
(312, 'yii', '{attribute} must be no less than {min}.'),
(313, 'yii', '{attribute} must be repeated exactly.'),
(314, 'yii', '{attribute} must not be equal to "{compareValue}".'),
(315, 'yii', '{attribute} should contain at least {min, number} {min, plural, one{character} other{characters}}.'),
(316, 'yii', '{attribute} should contain at most {max, number} {max, plural, one{character} other{characters}}.'),
(317, 'yii', '{attribute} should contain {length, number} {length, plural, one{character} other{characters}}.'),
(318, 'yii', '{delta, plural, =1{a day} other{# days}} ago'),
(319, 'yii', '{delta, plural, =1{a minute} other{# minutes}} ago'),
(320, 'yii', '{delta, plural, =1{a month} other{# months}} ago'),
(321, 'yii', '{delta, plural, =1{a second} other{# seconds}} ago'),
(322, 'yii', '{delta, plural, =1{a year} other{# years}} ago'),
(323, 'yii', '{delta, plural, =1{an hour} other{# hours}} ago'),
(324, 'yii', '{nFormatted} B'),
(325, 'yii', '{nFormatted} GB'),
(326, 'yii', '{nFormatted} GiB'),
(327, 'yii', '{nFormatted} KB'),
(328, 'yii', '{nFormatted} KiB'),
(329, 'yii', '{nFormatted} MB'),
(330, 'yii', '{nFormatted} MiB'),
(331, 'yii', '{nFormatted} PB'),
(332, 'yii', '{nFormatted} PiB'),
(333, 'yii', '{nFormatted} TB'),
(334, 'yii', '{nFormatted} TiB'),
(335, 'yii', '{nFormatted} {n, plural, =1{byte} other{bytes}}'),
(336, 'yii', '{nFormatted} {n, plural, =1{gibibyte} other{gibibytes}}'),
(337, 'yii', '{nFormatted} {n, plural, =1{gigabyte} other{gigabytes}}'),
(338, 'yii', '{nFormatted} {n, plural, =1{kibibyte} other{kibibytes}}'),
(339, 'yii', '{nFormatted} {n, plural, =1{kilobyte} other{kilobytes}}'),
(340, 'yii', '{nFormatted} {n, plural, =1{mebibyte} other{mebibytes}}'),
(341, 'yii', '{nFormatted} {n, plural, =1{megabyte} other{megabytes}}'),
(342, 'yii', '{nFormatted} {n, plural, =1{pebibyte} other{pebibytes}}'),
(343, 'yii', '{nFormatted} {n, plural, =1{petabyte} other{petabytes}}'),
(344, 'yii', '{nFormatted} {n, plural, =1{tebibyte} other{tebibytes}}'),
(345, 'yii', '{nFormatted} {n, plural, =1{terabyte} other{terabytes}}'),
(537, 'common/modules/i18n', 'Translations'),
(538, 'common/modules/i18n', 'Id'),
(539, 'common/modules/i18n', 'Message'),
(540, 'common/modules/i18n', 'Category'),
(541, 'common/modules/i18n', 'Status'),
(542, 'common/modules/i18n', 'Translated'),
(543, 'common/modules/i18n', 'Not translated'),
(544, 'common/modules/i18n', 'Online'),
(545, 'common/modules/i18n', 'Menu'),
(546, 'common/modules/i18n', 'Dashboard'),
(547, 'common/modules/i18n', 'Profile'),
(548, 'common/modules/i18n', 'Users'),
(549, 'common/modules/i18n', 'Productdetails'),
(550, 'common/modules/i18n', 'Brands'),
(551, 'common/modules/i18n', 'Login'),
(552, 'common/modules/i18n', 'Settings'),
(553, 'common/modules/i18n', 'Templates'),
(554, 'common/modules/i18n', 'Currency'),
(555, 'common/modules/i18n', 'Update'),
(556, 'common/modules/i18n', 'Translation'),
(557, 'common/modules/i18n', 'Back to list'),
(558, 'yii', '{attribute} must be equal to "{compareValueOrAttribute}".'),
(559, 'yii', '{attribute} must be greater than "{compareValueOrAttribute}".'),
(560, 'yii', '{attribute} must be greater than or equal to "{compareValueOrAttribute}".'),
(561, 'yii', '{attribute} must be less than "{compareValueOrAttribute}".'),
(562, 'yii', '{attribute} must be less than or equal to "{compareValueOrAttribute}".'),
(563, 'yii', '{attribute} must not be equal to "{compareValueOrAttribute}".'),
(564, 'yii', '{attribute} contains wrong subnet mask.'),
(565, 'yii', '{attribute} is not in the allowed range.'),
(566, 'yii', '{attribute} must be a valid IP address.'),
(567, 'yii', '{attribute} must be an IP address with specified subnet.'),
(568, 'yii', '{attribute} must not be a subnet.'),
(569, 'yii', '{attribute} must not be an IPv4 address.'),
(570, 'yii', '{attribute} must not be an IPv6 address.'),
(571, 'yii', '{delta, plural, =1{1 day} other{# days}}'),
(572, 'yii', '{delta, plural, =1{1 hour} other{# hours}}'),
(573, 'yii', '{delta, plural, =1{1 minute} other{# minutes}}'),
(574, 'yii', '{delta, plural, =1{1 month} other{# months}}'),
(575, 'yii', '{delta, plural, =1{1 second} other{# seconds}}'),
(576, 'yii', '{delta, plural, =1{1 year} other{# years}}'),
(577, 'common/modules/i18n', 'Updated'),
(578, 'common/modules/i18n', 'Create '),
(579, 'common/modules/i18n', 'User'),
(580, 'common/modules/i18n', 'Username'),
(581, 'common/modules/i18n', 'Email'),
(582, 'common/modules/i18n', 'Authkey'),
(583, 'common/modules/i18n', 'Passwordhash'),
(584, 'common/modules/i18n', 'Passwordresettoken'),
(585, 'common/modules/i18n', 'Createdat'),
(586, 'common/modules/i18n', 'Updatedat'),
(587, 'common/modules/i18n', 'Logo'),
(588, 'common/modules/i18n', 'New Password'),
(589, 'common/modules/i18n', 'New Password Repeat'),
(590, 'common/modules/i18n', 'Role'),
(591, 'common/modules/i18n', 'Delete'),
(592, 'common/modules/i18n', 'Are you sure you want to delete this item?'),
(593, 'common/modules/i18n', 'Roles'),
(594, 'common/modules/i18n', 'Brand'),
(595, 'common/modules/i18n', 'Name'),
(596, 'common/modules/i18n', 'Create'),
(597, 'common/modules/i18n', 'Template'),
(598, 'common/modules/i18n', 'Alias'),
(599, 'common/modules/i18n', 'Text'),
(600, 'common/modules/i18n', 'Currencies'),
(601, 'common/modules/i18n', 'Default'),
(602, 'common/modules/i18n', 'No'),
(603, 'common/modules/i18n', 'Yes'),
(604, 'common/modules/i18n', 'ISO 4217'),
(605, 'common/modules/i18n', 'Sign'),
(606, 'common/modules/i18n', 'Sign in'),
(607, 'common/modules/i18n', 'Sign in to start your session'),
(608, 'common/modules/i18n', 'Sign out'),
(609, 'common/modules/i18n', 'Enabled'),
(610, 'common/modules/i18n', 'Access rules'),
(611, 'common/modules/i18n', 'Add new rule'),
(612, 'common/modules/i18n', 'Rule'),
(613, 'common/modules/i18n', 'Description'),
(614, 'common/modules/i18n', 'Create rule'),
(615, 'common/modules/i18n', 'Edit rule'),
(616, 'common/modules/i18n', 'Text description'),
(617, 'common/modules/i18n', 'Allowed access'),
(618, 'common/modules/i18n', 'Parent permission'),
(619, 'common/modules/i18n', 'Save'),
(620, 'common/modules/i18n', 'Operation is done successfully.'),
(621, 'common/modules/i18n', 'Edit rule: '),
(622, 'common/modules/i18n', 'Role management'),
(623, 'common/modules/i18n', 'Add role'),
(624, 'common/modules/i18n', 'Allowed accesses'),
(625, 'common/modules/i18n', 'Edit role: '),
(626, 'common/modules/i18n', 'Role name'),
(627, 'common/modules/i18n', 'Posts'),
(628, 'common/modules/i18n', 'Post'),
(629, 'common/modules/i18n', 'Customer number'),
(630, 'common/modules/i18n', 'Bankaccountnumber'),
(631, 'common/modules/i18n', 'Bankaccountname'),
(632, 'common/modules/i18n', 'Customer ID'),
(633, 'common/modules/i18n', 'Country'),
(634, 'common/modules/i18n', 'City'),
(635, 'common/modules/i18n', 'Street'),
(636, 'common/modules/i18n', 'Zip'),
(637, 'common/modules/i18n', 'Salutation'),
(638, 'common/modules/i18n', 'Date start'),
(639, 'common/modules/i18n', 'Date end'),
(640, 'common/modules/i18n', 'Invoice number'),
(641, 'common/modules/i18n', 'Invoice subtotal'),
(642, 'common/modules/i18n', 'Invoice VAT'),
(643, 'common/modules/i18n', 'Invoice total'),
(644, 'common/modules/i18n', 'Location'),
(645, 'common/modules/i18n', 'Amount'),
(646, 'common/modules/i18n', 'Pallet'),
(647, 'common/modules/i18n', 'Bar number'),
(648, 'common/modules/i18n', 'Dateregistrated'),
(649, 'common/modules/i18n', 'Storage code'),
(650, 'common/modules/i18n', 'Storage description'),
(651, 'common/modules/i18n', 'Storage basis'),
(652, 'common/modules/i18n', 'Storage amount'),
(653, 'common/modules/i18n', 'Storage date start'),
(654, 'common/modules/i18n', 'Storage date end'),
(655, 'common/modules/i18n', 'Storage percentage'),
(656, 'common/modules/i18n', 'Storage price'),
(657, 'common/modules/i18n', 'Storage date out'),
(658, 'common/modules/i18n', 'Title'),
(659, 'common/modules/i18n', 'Content'),
(660, 'common/modules/i18n', 'Sort'),
(661, 'common/modules/i18n', 'Parent menu'),
(662, 'common/modules/i18n', 'Bean type'),
(663, 'common/modules/i18n', 'Bean'),
(664, 'common/modules/i18n', 'Enter the URL manually:'),
(665, 'common/modules/i18n', 'Sort action'),
(666, 'common/modules/i18n', 'Social networks'),
(667, 'common/modules/i18n', 'Social network'),
(668, 'common/modules/i18n', 'Not Found (#404)'),
(669, 'common/modules/i18n', 'The above error occurred while the Web server was processing your request.'),
(670, 'common/modules/i18n', 'Please contact us if you think this is a server error. Thank you.'),
(671, 'common/modules/i18n', 'Stocks'),
(672, 'common/modules/i18n', 'Stock'),
(673, 'common/modules/i18n', 'Where to buy'),
(674, 'common/modules/i18n', 'Contact us'),
(675, 'common/modules/i18n', 'Your name'),
(676, 'common/modules/i18n', 'Your email'),
(677, 'common/modules/i18n', 'Your message'),
(678, 'common/modules/i18n', 'Send'),
(679, 'common/modules/i18n', 'To'),
(680, 'common/modules/i18n', 'From'),
(681, 'common/modules/i18n', 'Subject'),
(682, 'common/modules/i18n', 'Contact form settings'),
(683, 'common/modules/i18n', 'Contact form'),
(684, 'common/modules/i18n', 'Contact form setting'),
(685, 'common/modules/i18n', 'Your message was sent successfully. Thank you.'),
(686, 'common/modules/i18n', 'Sliders'),
(687, 'common/modules/i18n', 'Slider'),
(688, 'common/modules/i18n', 'Images'),
(689, 'common/modules/i18n', 'Image'),
(690, 'common/modules/i18n', 'Link'),
(691, 'common/modules/i18n', 'Bad Request (#400)'),
(692, 'common/modules/i18n', 'Default page'),
(693, 'common/modules/i18n', 'Parent category'),
(694, 'common/modules/i18n', 'Categories'),
(695, 'common/modules/i18n', 'Shop'),
(696, 'common/modules/i18n', 'Characteristic groups'),
(697, 'common/modules/i18n', 'Characteristic group'),
(698, 'common/modules/i18n', 'Characteristics'),
(699, 'common/modules/i18n', 'Characteristic'),
(700, 'common/modules/i18n', 'Vendor code'),
(701, 'common/modules/i18n', 'Price'),
(702, 'common/modules/i18n', 'In stock'),
(703, 'common/modules/i18n', 'Products'),
(704, 'common/modules/i18n', 'Product'),
(705, 'common/modules/i18n', 'Select'),
(706, 'common/modules/i18n', 'Simple product'),
(707, 'common/modules/i18n', 'Variation'),
(708, 'common/modules/i18n', 'Type'),
(709, 'common/modules/i18n', 'Variations'),
(710, 'common/modules/i18n', 'Размер'),
(711, 'common/modules/i18n', 'Gallery'),
(712, 'common/modules/i18n', 'Product categories '),
(713, 'common/modules/i18n', 'Filter'),
(714, 'common/modules/i18n', 'Product categories'),
(715, 'common/modules/i18n', 'View'),
(716, 'common/modules/i18n', 'Not available'),
(717, 'common/modules/i18n', 'Menu types'),
(718, 'common/modules/i18n', 'Menu type'),
(719, 'common/modules/i18n', 'Useful Information'),
(720, 'common/modules/i18n', 'Clear'),
(721, 'common/modules/i18n', 'Result(s)'),
(722, 'common/modules/i18n', 'Count of products:'),
(723, 'common/modules/i18n', 'Price High to Low'),
(724, 'common/modules/i18n', 'Price Low to High'),
(725, 'common/modules/i18n', 'Sort by'),
(726, 'common/modules/i18n', 'Short description'),
(727, 'common/modules/i18n', 'Show after price'),
(728, 'common/modules/i18n', 'Add to shopping bag'),
(729, 'common/modules/i18n', 'Choose your size'),
(730, 'common/modules/i18n', 'Count'),
(731, 'common/modules/i18n', 'You need to choose a size'),
(732, 'common/modules/i18n', 'You need to enter a count'),
(733, 'common/modules/i18n', 'Add to wish list'),
(734, 'common/modules/i18n', 'Enter to the cabinet'),
(735, 'common/modules/i18n', 'Password'),
(736, 'common/modules/i18n', 'Remember me'),
(737, 'common/modules/i18n', 'Enter'),
(738, 'common/modules/i18n', 'If you forgot your password you can'),
(739, 'common/modules/i18n', 'Forget password?'),
(740, 'common/modules/i18n', 'Incorrect username or password.'),
(741, 'common/modules/i18n', 'Signup'),
(742, 'common/modules/i18n', 'This username has already been taken.'),
(743, 'common/modules/i18n', 'This email address has already been taken.'),
(744, 'common/modules/i18n', 'I would like to receive news from Jenadin'),
(745, 'common/modules/i18n', 'Subscription'),
(746, 'common/modules/i18n', 'Stay in touch'),
(747, 'common/modules/i18n', 'Sign up for news'),
(748, 'common/modules/i18n', 'Novelties'),
(749, 'common/modules/i18n', 'Novelty'),
(750, 'common/modules/i18n', 'Are you sure you want to send novelty?'),
(751, 'common/modules/i18n', 'Video'),
(752, 'common/modules/i18n', 'Remove'),
(753, 'common/modules/i18n', 'Kits'),
(754, 'common/modules/i18n', 'Kit'),
(755, 'common/modules/i18n', 'remove'),
(756, 'common/modules/i18n', 'How to wear it'),
(757, 'common/modules/i18n', 'You may also like it'),
(758, 'common/modules/i18n', 'Basket'),
(759, 'common/modules/i18n', 'Continue shopping'),
(760, 'common/modules/i18n', 'Unit price:'),
(761, 'common/modules/i18n', 'Total:'),
(762, 'common/modules/i18n', 'Basket is updated successfully.'),
(763, 'common/modules/i18n', 'You basket is empty.'),
(764, 'common/modules/i18n', 'Sum in the basket'),
(765, 'common/modules/i18n', 'In total'),
(766, 'common/modules/i18n', 'Proceed checkout'),
(767, 'common/modules/i18n', 'The size is '),
(768, 'common/modules/i18n', 'The size is out of stock.'),
(769, 'common/modules/i18n', 'Request password reset'),
(770, 'common/modules/i18n', 'A link to reset password will be sent there.'),
(771, 'common/modules/i18n', 'Password reset for Jenadin'),
(772, 'common/modules/i18n', 'Hello'),
(773, 'common/modules/i18n', 'Follow the link below to reset your password:'),
(774, 'common/modules/i18n', 'There is no user with such email.'),
(775, 'common/modules/i18n', 'Check your email for further instructions.'),
(776, 'common/modules/i18n', 'Reset password'),
(777, 'common/modules/i18n', 'Please choose your new password:'),
(778, 'common/modules/i18n', 'New password was saved.'),
(779, 'common/modules/i18n', 'Hello, %s%. (%s). In your account you can see your orders.'),
(780, 'common/modules/i18n', 'Exit'),
(781, 'common/modules/i18n', 'Account details'),
(782, 'common/modules/i18n', 'Address book'),
(783, 'common/modules/i18n', 'View or change your sign-in information.'),
(784, 'common/modules/i18n', 'Edit address data.'),
(785, 'common/modules/i18n', 'Wish list'),
(786, 'common/modules/i18n', 'Orders'),
(787, 'common/modules/i18n', 'View your order history.'),
(788, 'common/modules/i18n', 'View your favourite products.'),
(789, 'common/modules/i18n', 'Back to profile view'),
(790, 'common/modules/i18n', 'Profile is updated successfully.'),
(791, 'common/modules/i18n', 'Address'),
(792, 'common/modules/i18n', 'First name'),
(793, 'common/modules/i18n', 'Last name'),
(794, 'common/modules/i18n', 'Phone'),
(795, 'common/modules/i18n', 'Region'),
(796, 'common/modules/i18n', 'Building'),
(797, 'common/modules/i18n', 'Flat'),
(798, 'common/modules/i18n', 'Address is updated successfully.'),
(799, 'common/modules/i18n', 'The product was removed from the wish list'),
(800, 'common/modules/i18n', 'There is no product in your wish list'),
(801, 'common/modules/i18n', 'Notes'),
(802, 'common/modules/i18n', 'Payment type'),
(803, 'common/modules/i18n', 'Order'),
(804, 'common/modules/i18n', 'Checkout'),
(805, 'common/modules/i18n', 'Payment details'),
(806, 'common/modules/i18n', 'Your order'),
(807, 'common/modules/i18n', 'Total price'),
(808, 'common/modules/i18n', 'Payment types'),
(809, 'common/modules/i18n', 'Place order'),
(810, 'common/modules/i18n', 'Receivers'),
(811, 'common/modules/i18n', 'Email subject'),
(812, 'common/modules/i18n', 'Email templates'),
(813, 'common/modules/i18n', 'Email template'),
(814, 'common/modules/i18n', 'Email preview'),
(815, 'common/modules/i18n', 'ID'),
(816, 'common/modules/i18n', 'Subject from'),
(817, 'common/modules/i18n', 'Email from'),
(818, 'common/modules/i18n', 'Footer'),
(819, 'common/modules/i18n', 'Email settings'),
(820, 'common/modules/i18n', 'Email setting'),
(821, 'common/modules/i18n', 'You got order from '),
(822, 'common/modules/i18n', 'Information about the client'),
(823, 'common/modules/i18n', 'Thanks!'),
(824, 'common/modules/i18n', 'Your order is accepted!'),
(825, 'common/modules/i18n', 'Our manager will contact you'),
(826, 'common/modules/i18n', 'Hi there. Your recent order on Jenadin has been completed.'),
(827, 'common/modules/i18n', 'Your order was accepted successfully!'),
(828, 'common/modules/i18n', 'Number'),
(829, 'common/modules/i18n', 'Concept'),
(830, 'common/modules/i18n', 'Paid'),
(831, 'common/modules/i18n', 'Refused'),
(832, 'common/modules/i18n', 'Nothing is selected'),
(833, 'common/modules/i18n', 'Positions'),
(834, 'common/modules/i18n', '	You basket is empty.'),
(835, 'common/modules/i18n', 'Open menu'),
(836, 'common/modules/i18n', 'Search'),
(837, 'common/modules/i18n', 'Back'),
(838, 'common/modules/i18n', 'My account'),
(839, 'common/modules/i18n', 'Created at'),
(840, 'common/modules/i18n', 'Updated at'),
(841, 'common/modules/i18n', 'Percentage'),
(842, 'common/modules/i18n', 'Sales'),
(843, 'common/modules/i18n', 'Sale'),
(844, 'common/modules/i18n', 'Load products from the collection:'),
(845, 'javascript', 'Are you sure you want to add this collection?'),
(846, 'common/modules/i18n', 'Sell-out'),
(847, 'common/modules/i18n', 'Latest'),
(848, 'common/modules/i18n', 'Novelties products'),
(849, 'common/modules/i18n', 'Latest product'),
(850, 'common/modules/i18n', 'Size & fit information'),
(851, 'common/modules/i18n', 'Editor notes'),
(852, 'common/modules/i18n', 'Icon'),
(853, 'common/modules/i18n', 'Table size'),
(854, 'javascript', 'Basket'),
(855, 'javascript', 'You have added to the basket:'),
(856, 'common/modules/i18n', 'Successfully added'),
(857, 'common/modules/i18n', 'Pay waited'),
(858, 'common/modules/i18n', 'Congratulations! You have placed your order.'),
(859, 'common/modules/i18n', 'Search results:'),
(861, 'common/modules/i18n', 'No results matching the query:'),
(862, 'common/modules/i18n', 'Magazines'),
(863, 'common/modules/i18n', 'Magazine'),
(864, 'common/modules/i18n', 'Pages'),
(865, 'common/modules/i18n', 'Order date'),
(866, 'common/modules/i18n', 'User data'),
(867, 'common/modules/i18n', 'Personal data'),
(868, 'common/modules/i18n', 'Order data'),
(869, 'common/modules/i18n', 'Back to order list'),
(870, 'common/modules/i18n', 'Nothing was found'),
(871, 'common/modules/i18n', 'Seo category description'),
(872, 'common/modules/i18n', 'Invalid Configuration'),
(873, 'common/modules/i18n', 'Ошибка (#2)'),
(874, 'common/modules/i18n', 'Error'),
(875, 'common/modules/i18n', 'Error (#8)'),
(876, 'common/modules/i18n', 'Розмір'),
(877, 'common/modules/i18n', 'javascript'),
(878, 'common/modules/i18n', 'You have added to the basket:'),
(879, 'common/modules/i18n', 'Database Exception (#42)'),
(880, 'common/modules/i18n', 'Unknown Property'),
(881, 'common/modules/i18n', 'Invalid Configuration (#101)'),
(882, 'common/modules/i18n', 'Error (#535)'),
(883, 'common/modules/i18n', 'Visit website'),
(884, 'common/modules/i18n', 'View on the site'),
(885, 'common/modules/i18n', 'Preview'),
(886, 'common/modules/i18n', 'Preview mode'),
(887, 'common/modules/i18n', 'Collections'),
(888, 'common/modules/i18n', 'Assortment'),
(889, 'common/modules/i18n', 'Internet-shop'),
(890, 'common/modules/i18n', 'Useful information'),
(891, 'common/modules/i18n', 'Main page'),
(892, 'common/modules/i18n', 'Product catalog'),
(893, 'common/modules/i18n', 'Create role'),
(894, 'common/modules/i18n', 'Direct link'),
(895, 'common/modules/i18n', 'Forbidden (#403)'),
(896, 'common/modules/i18n', 'Main'),
(897, 'common/modules/i18n', 'Ошибка (#1)'),
(898, 'common/modules/i18n', 'Ошибка'),
(899, 'common/modules/i18n', 'Password repeat'),
(900, 'common/modules/i18n', 'Database Exception (#42000)'),
(901, 'common/modules/i18n', 'Error (#-1)'),
(902, 'common/modules/i18n', 'Show in filter'),
(903, 'common/modules/i18n', 'Product delivery description'),
(904, 'common/modules/i18n', 'Delivery'),
(905, 'common/modules/i18n', 'Legacy rules'),
(906, 'common/modules/i18n', 'Designation'),
(907, 'common/modules/i18n', 'Thanks, your password was replaced.'),
(908, 'common/modules/i18n', 'New products'),
(909, 'common/modules/i18n', 'Pre-order'),
(910, 'common/modules/i18n', 'Full name'),
(911, 'common/modules/i18n', 'Size'),
(912, 'javascript', 'Pre-order'),
(913, 'common/modules/i18n', 'Your request is accepted.'),
(914, 'common/modules/i18n', 'Dear'),
(915, 'common/modules/i18n', 'Your product is available now!'),
(916, 'common/modules/i18n', 'Go to the product card for selling it.!'),
(917, 'common/modules/i18n', 'product card'),
(918, 'common/modules/i18n', 'Pre-orders'),
(919, 'common/modules/i18n', 'New tab'),
(920, 'common/modules/i18n', 'Legacy terms'),
(921, 'common/modules/i18n', 'Legacy section'),
(922, 'common/modules/i18n', 'Campaign'),
(923, 'common/modules/i18n', 'More'),
(924, 'common/modules/i18n', 'Blog categories'),
(925, 'common/modules/i18n', 'Blog category'),
(926, 'common/modules/i18n', 'Blog posts'),
(927, 'common/modules/i18n', 'Blog post'),
(928, 'common/modules/i18n', 'Product related'),
(929, 'common/modules/i18n', 'Product relations'),
(930, 'common/modules/i18n', 'Product relation'),
(931, 'common/modules/i18n', 'Such combination of products already exists.'),
(932, 'common/modules/i18n', 'Please choose the different products'),
(933, 'common/modules/i18n', 'Go to the profile'),
(934, 'common/modules/i18n', 'Registration'),
(935, 'common/modules/i18n', 'Delivery types'),
(936, 'common/modules/i18n', 'Delivery type'),
(937, 'common/modules/i18n', 'Shop cities'),
(938, 'common/modules/i18n', 'AuthKey'),
(939, 'common/modules/i18n', 'PasswordHash'),
(940, 'common/modules/i18n', 'PasswordResetToken'),
(941, 'common/modules/i18n', 'DateCreated'),
(942, 'common/modules/i18n', 'DateUpdated'),
(943, 'common/modules/i18n', 'Permissions'),
(944, 'common/modules/i18n', 'Rule with such name already exists: '),
(945, 'common/modules/i18n', 'Websites'),
(946, 'common/modules/i18n', 'Website'),
(947, 'common/modules/i18n', 'Routes'),
(948, 'common/modules/i18n', 'Route'),
(949, 'common/modules/i18n', 'Pagination');

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE `template` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `websiteID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`id`, `name`, `alias`, `type`, `isDeleted`, `websiteID`) VALUES
(1, 'General1', 'general-carcass', 'carcass', 0, 1),
(2, 'Main page', 'main-page', 'inner', 1, 1),
(3, 'Post', 'post', 'inner', 0, 1),
(5, 'Inner template', 'inner', 'inner', 0, 1),
(6, 'General', 'general-carcass', 'carcass', 0, 3),
(7, 'Page', 'page', 'inner', 0, 3),
(8, 'Post', 'post', 'inner', 0, 3),
(9, 'Main page', 'main-page', 'inner', 0, 3),
(10, 'Main page carcass', 'main-page-carcass', 'carcass', 0, 3),
(11, 'News and info carcass', 'news-info-carcass', 'carcass', 0, 3),
(12, 'News and info template', 'news-info', 'inner', 0, 3),
(13, 'Search', 'search', 'inner', 0, 3),
(14, 'Contacts', 'contacts-carcass', 'carcass', 0, 3),
(15, 'General', 'general-carcass', 'carcass', 0, 4),
(16, 'Page', 'page', 'inner', 0, 4),
(17, 'Post', 'post', 'inner', 0, 4),
(18, 'Main page', 'main-page', 'inner', 0, 4),
(19, 'About us', 'about-us', 'inner', 0, 4),
(20, 'Our approach', 'our-approach', 'inner', 0, 4),
(21, 'Careers', 'careers', 'inner', 0, 4),
(22, 'Apply', 'apply', 'inner', 0, 4),
(23, 'News and events', 'news-and-events', 'inner', 0, 4),
(24, 'News list carcass', 'news-list-carcass', 'carcass', 0, 4),
(25, 'General', 'general-carcass', 'carcass', 0, 5),
(26, 'Page', 'page', 'inner', 0, 5),
(27, 'Post', 'post', 'inner', 0, 5),
(28, 'Main page', 'main-page', 'inner', 0, 5),
(29, 'Main page carcass', 'main-page-carcass', 'carcass', 0, 5),
(30, 'Page carcass', 'page-carcass', 'carcass', 0, 5),
(31, 'News', 'news', 'inner', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `authKey` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `passwordHash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `passwordResetToken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `dateCreated` int(11) NOT NULL,
  `dateUpdated` int(11) NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `authKey`, `passwordHash`, `passwordResetToken`, `email`, `status`, `dateCreated`, `dateUpdated`, `logo`) VALUES
(1, 'admin', 'V-Cym0VAr8UvLBmmLSHJID6XlMaqaXyZ', '$2y$13$hg7vKc6Ath.Fk6X8NYVcwuoC2SqUCuCyJnCb2JjGgtoYiXYLoQWRS', 'z9dpcZFxYAMxYAP27d8sn3yPmFmD64zt_1501180297', 'artemkramov@yahoo.com', 10, 1455877362, 1501180297, '/img/logo.jpg'),
(51, 'content-11', '', '$2y$13$aVdzylZ63FyDh25iE/0LZeeV3.qULDofWGX9JjSh5vK6PtMa23uzm', NULL, 'content@gmail.com', 10, 1521308303, 1521310021, NULL),
(52, 'content-12', '', '$2y$13$zVMMgWpmQFKALI54FSmRLeqRFSr8uP30FJiY0YA3MPijGhb.c3MTa', NULL, 'content-12@gmail.com', 10, 1522075282, 1522075282, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `website`
--

CREATE TABLE `website` (
  `id` int(11) NOT NULL,
  `url` text NOT NULL,
  `dsn` text,
  `username` varchar(255) DEFAULT NULL,
  `password` text,
  `isRemoteConnection` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `website`
--

INSERT INTO `website` (`id`, `url`, `dsn`, `username`, `password`, `isRemoteConnection`) VALUES
(1, 'www.encyc-astro.com', 'mysql:host=localhost;dbname=pbn-client', 'root', '', 1),
(3, 'www.uber-education.com', 'mysql:host=localhost;dbname=pbn-admin', 'root', '', 0),
(4, 'apexmarketingevents.com', 'mysql:host=localhost;dbname=pbn-admin', 'root', '', 1),
(5, 'emersonquidditch.org', 'mysql:host=localhost;dbname=pbn-admin', 'root', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth-assignment`
--
ALTER TABLE `auth-assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `auth-item`
--
ALTER TABLE `auth-item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `auth-item-child`
--
ALTER TABLE `auth-item-child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth-rule`
--
ALTER TABLE `auth-rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `lang`
--
ALTER TABLE `lang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentID` (`parentID`),
  ADD KEY `pageID` (`pageID`),
  ADD KEY `menuTypeID` (`menuTypeID`),
  ADD KEY `websiteID` (`websiteID`);

--
-- Indexes for table `menu-language`
--
ALTER TABLE `menu-language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menuID` (`menuID`);

--
-- Indexes for table `menu-type`
--
ALTER TABLE `menu-type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `websiteID` (`websiteID`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`,`language`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paginationID` (`paginationID`),
  ADD KEY `templateCarcassID` (`templateCarcassID`),
  ADD KEY `templateInnerID` (`templateInnerID`),
  ADD KEY `pageTypeID` (`pageTypeID`),
  ADD KEY `authorID` (`authorID`),
  ADD KEY `websiteID` (`websiteID`);

--
-- Indexes for table `page-extra-meta`
--
ALTER TABLE `page-extra-meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pageID` (`pageID`);

--
-- Indexes for table `page-language`
--
ALTER TABLE `page-language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pageID` (`pageID`);

--
-- Indexes for table `page-page`
--
ALTER TABLE `page-page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pageParentID` (`pageParentID`),
  ADD KEY `pageChildID` (`pageChildID`);

--
-- Indexes for table `page-route`
--
ALTER TABLE `page-route`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pageID` (`pageID`),
  ADD KEY `routeID` (`routeID`);

--
-- Indexes for table `page-type`
--
ALTER TABLE `page-type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `websiteID` (`websiteID`),
  ADD KEY `routeID` (`routeID`);

--
-- Indexes for table `pagination`
--
ALTER TABLE `pagination`
  ADD PRIMARY KEY (`id`),
  ADD KEY `websiteID` (`websiteID`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`id`),
  ADD KEY `websiteID` (`websiteID`);

--
-- Indexes for table `source-message`
--
ALTER TABLE `source-message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `websiteID` (`websiteID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`passwordResetToken`);

--
-- Indexes for table `website`
--
ALTER TABLE `website`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lang`
--
ALTER TABLE `lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `menu-language`
--
ALTER TABLE `menu-language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `menu-type`
--
ALTER TABLE `menu-type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `page-extra-meta`
--
ALTER TABLE `page-extra-meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `page-language`
--
ALTER TABLE `page-language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `page-page`
--
ALTER TABLE `page-page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `page-route`
--
ALTER TABLE `page-route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT for table `page-type`
--
ALTER TABLE `page-type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `pagination`
--
ALTER TABLE `pagination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `source-message`
--
ALTER TABLE `source-message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=950;
--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `website`
--
ALTER TABLE `website`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentID`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`pageID`) REFERENCES `page` (`id`),
  ADD CONSTRAINT `menu_ibfk_3` FOREIGN KEY (`menuTypeID`) REFERENCES `menu-type` (`id`),
  ADD CONSTRAINT `menu_ibfk_4` FOREIGN KEY (`websiteID`) REFERENCES `website` (`id`);

--
-- Constraints for table `menu-language`
--
ALTER TABLE `menu-language`
  ADD CONSTRAINT `menu-language_ibfk_1` FOREIGN KEY (`menuID`) REFERENCES `menu` (`id`);

--
-- Constraints for table `menu-type`
--
ALTER TABLE `menu-type`
  ADD CONSTRAINT `menu-type_ibfk_1` FOREIGN KEY (`websiteID`) REFERENCES `website` (`id`);

--
-- Constraints for table `page`
--
ALTER TABLE `page`
  ADD CONSTRAINT `page_ibfk_1` FOREIGN KEY (`authorID`) REFERENCES `page` (`id`),
  ADD CONSTRAINT `page_ibfk_2` FOREIGN KEY (`pageTypeID`) REFERENCES `page-type` (`id`),
  ADD CONSTRAINT `page_ibfk_3` FOREIGN KEY (`paginationID`) REFERENCES `pagination` (`id`),
  ADD CONSTRAINT `page_ibfk_4` FOREIGN KEY (`templateCarcassID`) REFERENCES `template` (`id`),
  ADD CONSTRAINT `page_ibfk_5` FOREIGN KEY (`templateInnerID`) REFERENCES `template` (`id`),
  ADD CONSTRAINT `page_ibfk_6` FOREIGN KEY (`websiteID`) REFERENCES `website` (`id`);

--
-- Constraints for table `page-extra-meta`
--
ALTER TABLE `page-extra-meta`
  ADD CONSTRAINT `page-extra-meta_ibfk_1` FOREIGN KEY (`pageID`) REFERENCES `page` (`id`);

--
-- Constraints for table `page-language`
--
ALTER TABLE `page-language`
  ADD CONSTRAINT `page-language_ibfk_1` FOREIGN KEY (`pageID`) REFERENCES `page` (`id`);

--
-- Constraints for table `page-page`
--
ALTER TABLE `page-page`
  ADD CONSTRAINT `page-page_ibfk_1` FOREIGN KEY (`pageParentID`) REFERENCES `page` (`id`),
  ADD CONSTRAINT `page-page_ibfk_2` FOREIGN KEY (`pageChildID`) REFERENCES `page` (`id`);

--
-- Constraints for table `page-route`
--
ALTER TABLE `page-route`
  ADD CONSTRAINT `page-route_ibfk_1` FOREIGN KEY (`pageID`) REFERENCES `page` (`id`),
  ADD CONSTRAINT `page-route_ibfk_2` FOREIGN KEY (`routeID`) REFERENCES `route` (`id`);

--
-- Constraints for table `page-type`
--
ALTER TABLE `page-type`
  ADD CONSTRAINT `page-type_ibfk_1` FOREIGN KEY (`websiteID`) REFERENCES `website` (`id`),
  ADD CONSTRAINT `page-type_ibfk_2` FOREIGN KEY (`routeID`) REFERENCES `route` (`id`);

--
-- Constraints for table `pagination`
--
ALTER TABLE `pagination`
  ADD CONSTRAINT `pagination_ibfk_1` FOREIGN KEY (`websiteID`) REFERENCES `website` (`id`);

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`websiteID`) REFERENCES `website` (`id`);

--
-- Constraints for table `template`
--
ALTER TABLE `template`
  ADD CONSTRAINT `template_ibfk_1` FOREIGN KEY (`websiteID`) REFERENCES `website` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
