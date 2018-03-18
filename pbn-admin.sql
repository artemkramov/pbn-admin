-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2018 at 03:39 PM
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
('content-manager', '51', 1521310042);

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
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth-item`
--

INSERT INTO `auth-item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`, `parent_id`) VALUES
('admin', 1, 'Administrator', NULL, NULL, 1457028578, 1521371436, NULL),
('content', 2, 'Content management', NULL, NULL, 1469903227, 1469903227, ''),
('content-manager', 1, 'Content manager', NULL, NULL, 1521302256, 1521302256, NULL),
('content/templates', 2, 'Template management', NULL, NULL, 1521371423, 1521371423, 'content'),
('i18n', 2, 'Translation management', NULL, NULL, 1464245784, 1464245784, NULL),
('permit/access', 2, 'Role and permission management', NULL, NULL, 1457031451, 1457031915, NULL),
('settings', 2, 'Settings management', NULL, NULL, 1467648490, 1467819771, ''),
('settings/websites', 2, 'Website management', NULL, NULL, 1521364623, 1521364623, 'settings'),
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
('content-manager', 'content');

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
(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, 1, NULL, NULL, 1, 1, 0, 0, 0, 1),
(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, NULL, 2, NULL, NULL, 1, 1, 0, 0, 0, 1),
(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, 3, NULL, NULL, 1, 1, 0, 0, 0, 1),
(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 2, 4, NULL, NULL, 1, 1, 0, 0, 0, 1),
(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 4, 5, NULL, NULL, 1, 1, 0, 0, 0, 1),
(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL, 2, NULL, NULL, 2, 1, 0, 0, 0, 1),
(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, NULL, NULL, NULL, '/user', 2, 1, 1, 0, 0, 1);

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
(1, 1, 'en', 'Main page'),
(2, 2, 'en', 'Follow us'),
(3, 3, 'en', 'Contact us'),
(4, 4, 'en', 'Submenu'),
(5, 6, 'en', 'Follow us'),
(6, 5, 'en', 'Subsubmenu'),
(7, 7, 'en', 'Login/Register');

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
(2, 'footer', 'Footer menu', 0, 1);

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
  `templateCarcassID` int(11) NOT NULL,
  `templateInnerID` int(11) NOT NULL,
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

INSERT INTO `page` (`id`, `image1`, `image2`, `image3`, `datePublished`, `dateCreated`, `dateModified`, `sort`, `authorID`, `seoPriority`, `pageTypeID`, `ratingValue`, `ratingCount`, `isPaginationOn`, `paginationID`, `paginationPerPage`, `templateCarcassID`, `templateInnerID`, `isVisibleSitemapXml`, `isVisibleSitemapHtml`, `isMainPage`, `isEnabled`, `isDeleted`, `websiteID`) VALUES
(1, NULL, NULL, NULL, '2018-03-15', '0000-00-00 00:00:00', '2018-03-14 22:00:00', 0, NULL, '1.0000', NULL, NULL, NULL, 1, 2, 1, 1, 2, 1, 1, 1, 1, 0, 1),
(2, NULL, NULL, NULL, '2018-03-14', '0000-00-00 00:00:00', '2018-03-13 22:00:00', 0, NULL, '0.5000', 2, 4, 5, 1, 1, 1, 1, 3, 1, 1, 0, 1, 0, 1),
(3, NULL, NULL, NULL, '2018-03-15', '0000-00-00 00:00:00', '2018-03-13 22:00:00', 1, NULL, '0.5000', 2, NULL, NULL, 0, NULL, NULL, 1, 3, 1, 1, 0, 1, 0, 1),
(4, NULL, NULL, NULL, '2018-03-15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, NULL, '0.5000', 2, NULL, NULL, 0, NULL, NULL, 1, 3, 1, 1, 0, 1, 0, 1),
(5, NULL, NULL, NULL, '2018-03-15', '0000-00-00 00:00:00', '2018-03-13 22:00:00', 3, NULL, '0.5000', 2, NULL, NULL, 0, NULL, NULL, 1, 3, 1, 1, 0, 1, 0, 1),
(6, NULL, NULL, NULL, '2018-03-15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, NULL, '0.5000', 2, NULL, NULL, 0, NULL, NULL, 1, 3, 1, 1, 0, 1, 0, 1);

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
(1, 2, 'robots', 'noindex,nofollow');

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
(6, 6, 'en', 'Privacy', 'fsdf sdfsdfsdgfdg ', NULL, 'Privacy', NULL, NULL);

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
(4, 2, 5);

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
(5, 6, 3, 'privacy');

-- --------------------------------------------------------

--
-- Table structure for table `page-type`
--

CREATE TABLE `page-type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `websiteID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page-type`
--

INSERT INTO `page-type` (`id`, `name`, `alias`, `isDeleted`, `websiteID`) VALUES
(1, 'Page', 'page', 0, 1),
(2, 'Post', 'post', 0, 1),
(3, 'Author', 'author', 0, 1);

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
(3, 'pp/<:page>', 0, 3);

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
(1, 'Content test', 'content/<:alias>', 1, 0, 3),
(3, 'Common', '<:alias>', 5, 0, 1),
(5, 'Route with GET', 'blog/<:alias>', 3, 0, 1),
(6, 'Common route', '<:alias>', 2, 1, 3);

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
(1, 'General1', 'general-carcass', 'carcass', 0, 3),
(2, 'Main page', 'main-page', 'inner', 1, 3),
(3, 'Post', 'post', 'inner', 0, 1),
(5, 'Inner template', 'inner', 'inner', 0, 3);

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
(51, 'content-11', '', '$2y$13$aVdzylZ63FyDh25iE/0LZeeV3.qULDofWGX9JjSh5vK6PtMa23uzm', NULL, 'content@gmail.com', 10, 1521308303, 1521310021, NULL);

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
(3, 'www.uber-education.com', '', '', '', 0);

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
  ADD KEY `websiteID` (`websiteID`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `menu-language`
--
ALTER TABLE `menu-language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `menu-type`
--
ALTER TABLE `menu-type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `page-extra-meta`
--
ALTER TABLE `page-extra-meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `page-language`
--
ALTER TABLE `page-language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `page-page`
--
ALTER TABLE `page-page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `page-route`
--
ALTER TABLE `page-route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `page-type`
--
ALTER TABLE `page-type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pagination`
--
ALTER TABLE `pagination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `source-message`
--
ALTER TABLE `source-message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=950;
--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `website`
--
ALTER TABLE `website`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  ADD CONSTRAINT `page-type_ibfk_1` FOREIGN KEY (`websiteID`) REFERENCES `website` (`id`);

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
