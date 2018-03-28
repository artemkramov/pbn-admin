--
-- Dumping data for table `menu-type`
--

INSERT INTO `menu-type` (`id`, `alias`, `name`, `isDeleted`, `websiteID`) VALUES
(1, 'header', 'Header menu', 0, 1),
(2, 'footer', 'Footer menu', 0, 1);

-- --------------------------------------------------------

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `image1`, `image2`, `image3`, `datePublished`, `dateCreated`, `dateModified`, `sort`, `authorID`, `seoPriority`, `pageTypeID`, `ratingValue`, `ratingCount`, `isPaginationOn`, `paginationID`, `paginationPerPage`, `templateCarcassID`, `templateInnerID`, `isVisibleSitemapXml`, `isVisibleSitemapHtml`, `isMainPage`, `isEnabled`, `isDeleted`, `websiteID`) VALUES
(1, NULL, NULL, NULL, '2018-03-15', '0000-00-00 00:00:00', '2018-03-14 22:00:00', 0, NULL, '1.0000', 2, NULL, NULL, 1, 2, 1, 1, 2, 1, 1, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Dumping data for table `page-language`
--

INSERT INTO `page-language` (`id`, `pageID`, `language`, `title`, `description`, `descriptionShort`, `seoTitle`, `seoDescription`, `seoKeywords`) VALUES
(1, 1, 'en', 'Home', NULL, NULL, 'Main page', 'Main page', 'Main page');

-- --------------------------------------------------------

--
-- Dumping data for table `page-type`
--

INSERT INTO `page-type` (`id`, `name`, `alias`, `routeID`, `isDeleted`, `websiteID`) VALUES
(1, 'Page', 'page', NULL, 0, 1),
(2, 'Post', 'post', NULL, 0, 1),
(3, 'Author', 'author', NULL, 0, 1),
(6, 'Category', 'category', NULL, 0, 1);

-- --------------------------------------------------------


--
-- Dumping data for table `route`
--

INSERT INTO `route` (`id`, `name`, `link`, `priority`, `isDeleted`, `websiteID`) VALUES
(1, 'Content test', 'content/<:alias>', 1, 0, 1),
(3, 'Common', '<:alias>', 5, 0, 1);

-- --------------------------------------------------------

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`id`, `name`, `alias`, `type`, `isDeleted`, `websiteID`) VALUES
(1, 'General', 'general-carcass', 'carcass', 0, 1),
(2, 'Main page', 'main-page', 'inner', 0, 1),
(5, 'Post', 'post', 'inner', 0, 1);


