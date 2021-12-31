-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 06, 2021 at 02:11 PM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

-- --------------------------------------------------------

--
-- Table structure for table `chii_characters`
--

CREATE TABLE IF NOT EXISTS `chii_characters` (
  `crt_id` mediumint(8) unsigned NOT NULL,
  `crt_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `crt_role` tinyint(4) unsigned NOT NULL COMMENT '角色，机体，组织。。',
  `crt_infobox` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `crt_summary` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `crt_img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `crt_comment` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `crt_collects` mediumint(8) unsigned NOT NULL,
  `crt_dateline` int(10) unsigned NOT NULL,
  `crt_lastpost` int(11) unsigned NOT NULL,
  `crt_lock` tinyint(4) NOT NULL DEFAULT '0',
  `crt_img_anidb` varchar(255) CHARACTER SET utf8 NOT NULL,
  `crt_anidb_id` mediumint(8) unsigned NOT NULL,
  `crt_ban` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `crt_redirect` int(10) unsigned NOT NULL DEFAULT '0',
  `crt_nsfw` tinyint(1) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chii_crt_cast_index`
--

CREATE TABLE IF NOT EXISTS `chii_crt_cast_index` (
  `crt_id` mediumint(9) unsigned NOT NULL,
  `prsn_id` mediumint(9) unsigned NOT NULL,
  `subject_id` mediumint(9) unsigned NOT NULL,
  `subject_type_id` tinyint(3) unsigned NOT NULL COMMENT '根据人物归类查询角色，动画，书籍，游戏',
  `summary` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '幼年，男乱马，女乱马，变身形态，少女形态。。'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chii_crt_subject_index`
--

CREATE TABLE IF NOT EXISTS `chii_crt_subject_index` (
  `crt_id` mediumint(9) unsigned NOT NULL,
  `subject_id` mediumint(9) unsigned NOT NULL,
  `subject_type_id` tinyint(4) unsigned NOT NULL,
  `crt_type` tinyint(4) unsigned NOT NULL COMMENT '主角，配角',
  `ctr_appear_eps` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT '可选，角色出场的的章节',
  `crt_order` tinyint(3) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chii_persons`
--

CREATE TABLE IF NOT EXISTS `chii_persons` (
  `prsn_id` mediumint(8) unsigned NOT NULL,
  `prsn_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prsn_type` tinyint(4) unsigned NOT NULL COMMENT '个人，公司，组合',
  `prsn_infobox` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `prsn_producer` tinyint(1) NOT NULL,
  `prsn_mangaka` tinyint(1) NOT NULL,
  `prsn_artist` tinyint(1) NOT NULL,
  `prsn_seiyu` tinyint(1) NOT NULL,
  `prsn_writer` tinyint(4) NOT NULL DEFAULT '0' COMMENT '作家',
  `prsn_illustrator` tinyint(4) NOT NULL DEFAULT '0' COMMENT '绘师',
  `prsn_actor` tinyint(1) NOT NULL COMMENT '演员',
  `prsn_summary` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `prsn_img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prsn_img_anidb` varchar(255) CHARACTER SET utf8 NOT NULL,
  `prsn_comment` mediumint(9) unsigned NOT NULL,
  `prsn_collects` mediumint(8) unsigned NOT NULL,
  `prsn_dateline` int(10) unsigned NOT NULL,
  `prsn_lastpost` int(11) unsigned NOT NULL,
  `prsn_lock` tinyint(4) NOT NULL,
  `prsn_anidb_id` mediumint(8) unsigned NOT NULL,
  `prsn_ban` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prsn_redirect` int(10) unsigned NOT NULL DEFAULT '0',
  `prsn_nsfw` tinyint(1) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='（现实）人物表';

-- --------------------------------------------------------

--
-- Table structure for table `chii_person_alias`
--

CREATE TABLE IF NOT EXISTS `chii_person_alias` (
  `prsn_cat` enum('prsn','crt') COLLATE utf8_unicode_ci NOT NULL,
  `prsn_id` mediumint(9) unsigned NOT NULL,
  `alias_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias_type` tinyint(4) unsigned NOT NULL,
  `alias_key` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chii_person_collects`
--

CREATE TABLE IF NOT EXISTS `chii_person_collects` (
  `prsn_clt_id` mediumint(8) unsigned NOT NULL,
  `prsn_clt_cat` enum('prsn','crt') NOT NULL,
  `prsn_clt_mid` mediumint(8) unsigned NOT NULL,
  `prsn_clt_uid` mediumint(8) unsigned NOT NULL,
  `prsn_clt_dateline` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='人物收藏';

-- --------------------------------------------------------

--
-- Table structure for table `chii_person_cs_index`
--

CREATE TABLE IF NOT EXISTS `chii_person_cs_index` (
  `prsn_type` enum('prsn','crt') COLLATE utf8_unicode_ci NOT NULL,
  `prsn_id` mediumint(9) unsigned NOT NULL,
  `prsn_position` smallint(5) unsigned NOT NULL COMMENT '监督，原案，脚本,..',
  `subject_id` mediumint(9) unsigned NOT NULL,
  `subject_type_id` tinyint(4) unsigned NOT NULL,
  `summary` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `prsn_appear_eps` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT '可选，人物参与的章节'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='subjects'' credits/creator & staff (c&s)index';

-- --------------------------------------------------------

--
-- Table structure for table `chii_person_fields`
--

CREATE TABLE IF NOT EXISTS `chii_person_fields` (
  `prsn_cat` enum('prsn','crt') COLLATE utf8_unicode_ci NOT NULL,
  `prsn_id` int(8) unsigned NOT NULL,
  `gender` tinyint(4) unsigned NOT NULL,
  `bloodtype` tinyint(4) unsigned NOT NULL,
  `birth_year` year(4) NOT NULL,
  `birth_mon` tinyint(2) unsigned NOT NULL,
  `birth_day` tinyint(2) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chii_person_relationship`
--

CREATE TABLE IF NOT EXISTS `chii_person_relationship` (
  `prsn_type` enum('prsn','crt') COLLATE utf8_unicode_ci NOT NULL,
  `prsn_id` mediumint(9) unsigned NOT NULL,
  `relat_prsn_type` enum('prsn','crt') COLLATE utf8_unicode_ci NOT NULL,
  `relat_prsn_id` mediumint(9) unsigned NOT NULL,
  `relat_type` smallint(6) unsigned NOT NULL COMMENT '任职于，从属,聘用,嫁给，'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chii_characters`
--
ALTER TABLE `chii_characters`
  ADD PRIMARY KEY (`crt_id`),
  ADD KEY `crt_role` (`crt_role`),
  ADD KEY `crt_lock` (`crt_lock`),
  ADD KEY `crt_ban` (`crt_ban`);

--
-- Indexes for table `chii_crt_cast_index`
--
ALTER TABLE `chii_crt_cast_index`
  ADD PRIMARY KEY (`crt_id`,`prsn_id`,`subject_id`),
  ADD KEY `prsn_id` (`prsn_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `subject_type_id` (`subject_type_id`);

--
-- Indexes for table `chii_crt_subject_index`
--
ALTER TABLE `chii_crt_subject_index`
  ADD PRIMARY KEY (`crt_id`,`subject_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `crt_type` (`crt_type`),
  ADD KEY `subject_type_id` (`subject_type_id`);

--
-- Indexes for table `chii_persons`
--
ALTER TABLE `chii_persons`
  ADD PRIMARY KEY (`prsn_id`),
  ADD KEY `prsn_type` (`prsn_type`),
  ADD KEY `prsn_producer` (`prsn_producer`),
  ADD KEY `prsn_mangaka` (`prsn_mangaka`),
  ADD KEY `prsn_artist` (`prsn_artist`),
  ADD KEY `prsn_seiyu` (`prsn_seiyu`),
  ADD KEY `prsn_writer` (`prsn_writer`),
  ADD KEY `prsn_illustrator` (`prsn_illustrator`),
  ADD KEY `prsn_lock` (`prsn_lock`),
  ADD KEY `prsn_ban` (`prsn_ban`),
  ADD KEY `prsn_actor` (`prsn_actor`);

--
-- Indexes for table `chii_person_alias`
--
ALTER TABLE `chii_person_alias`
  ADD KEY `prsn_cat` (`prsn_cat`,`prsn_id`),
  ADD KEY `prsn_id` (`prsn_id`);

--
-- Indexes for table `chii_person_collects`
--
ALTER TABLE `chii_person_collects`
  ADD PRIMARY KEY (`prsn_clt_id`),
  ADD KEY `prsn_clt_cat` (`prsn_clt_cat`,`prsn_clt_mid`),
  ADD KEY `prsn_clt_uid` (`prsn_clt_uid`),
  ADD KEY `prsn_clt_mid` (`prsn_clt_mid`);

--
-- Indexes for table `chii_person_cs_index`
--
ALTER TABLE `chii_person_cs_index`
  ADD PRIMARY KEY (`prsn_type`,`prsn_id`,`subject_id`,`prsn_position`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `prsn_position` (`prsn_position`),
  ADD KEY `prsn_id` (`prsn_id`),
  ADD KEY `subject_type_id` (`subject_type_id`);

--
-- Indexes for table `chii_person_fields`
--
ALTER TABLE `chii_person_fields`
  ADD PRIMARY KEY (`prsn_cat`,`prsn_id`),
  ADD KEY `prsn_id` (`prsn_id`);

--
-- Indexes for table `chii_person_relationship`
--
ALTER TABLE `chii_person_relationship`
  ADD KEY `prsn_type` (`prsn_type`,`prsn_id`),
  ADD KEY `relat_prsn_type` (`relat_prsn_type`,`relat_prsn_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chii_characters`
--
ALTER TABLE `chii_characters`
  MODIFY `crt_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chii_persons`
--
ALTER TABLE `chii_persons`
  MODIFY `prsn_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chii_person_collects`
--
ALTER TABLE `chii_person_collects`
  MODIFY `prsn_clt_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 23, 2021 at 09:10 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

-- --------------------------------------------------------

--
-- Table structure for table `chii_usergroup`
--

CREATE TABLE IF NOT EXISTS `chii_usergroup` (
  `usr_grp_id` mediumint(8) unsigned NOT NULL,
  `usr_grp_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `usr_grp_perm` mediumtext CHARACTER SET utf8 NOT NULL,
  `usr_grp_dateline` int(10) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for table `chii_usergroup`
--
ALTER TABLE `chii_usergroup`
  ADD PRIMARY KEY (`usr_grp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chii_usergroup`
--
ALTER TABLE `chii_usergroup`
  MODIFY `usr_grp_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 23, 2021 at 08:54 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

-- --------------------------------------------------------

--
-- Table structure for table `chii_subject_topics`
--

CREATE TABLE IF NOT EXISTS `chii_subject_topics` (
  `sbj_tpc_id` mediumint(8) unsigned NOT NULL,
  `sbj_tpc_subject_id` mediumint(8) unsigned NOT NULL,
  `sbj_tpc_uid` mediumint(8) unsigned NOT NULL,
  `sbj_tpc_title` varchar(80) CHARACTER SET utf8mb4 NOT NULL,
  `sbj_tpc_dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `sbj_tpc_lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `sbj_tpc_replies` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sbj_tpc_state` tinyint(1) unsigned NOT NULL,
  `sbj_tpc_display` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chii_subject_topics`
--
ALTER TABLE `chii_subject_topics`
  ADD PRIMARY KEY (`sbj_tpc_id`),
  ADD KEY `tpc_subject_id` (`sbj_tpc_subject_id`),
  ADD KEY `tpc_display` (`sbj_tpc_display`),
  ADD KEY `sbj_tpc_uid` (`sbj_tpc_uid`),
  ADD KEY `sbj_tpc_lastpost` (`sbj_tpc_lastpost`,`sbj_tpc_subject_id`,`sbj_tpc_display`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chii_subject_topics`
--
ALTER TABLE `chii_subject_topics`
  MODIFY `sbj_tpc_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 23, 2021 at 08:53 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

-- --------------------------------------------------------

--
-- Table structure for table `chii_group_topics`
--

CREATE TABLE IF NOT EXISTS `chii_group_topics` (
  `grp_tpc_id` mediumint(8) unsigned NOT NULL,
  `grp_tpc_gid` mediumint(8) unsigned NOT NULL,
  `grp_tpc_uid` mediumint(8) unsigned NOT NULL,
  `grp_tpc_title` varchar(80) NOT NULL,
  `grp_tpc_dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `grp_tpc_lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `grp_tpc_replies` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `grp_tpc_state` tinyint(1) unsigned NOT NULL,
  `grp_tpc_display` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chii_group_topics`
--
ALTER TABLE `chii_group_topics`
  ADD PRIMARY KEY (`grp_tpc_id`),
  ADD KEY `grp_tpc_gid` (`grp_tpc_gid`),
  ADD KEY `grp_tpc_display` (`grp_tpc_display`),
  ADD KEY `grp_tpc_uid` (`grp_tpc_uid`),
  ADD KEY `grp_tpc_lastpost` (`grp_tpc_lastpost`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chii_group_topics`
--
ALTER TABLE `chii_group_topics`
  MODIFY `grp_tpc_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 23, 2021 at 08:55 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

-- --------------------------------------------------------

--
-- Table structure for table `chii_crt_comments`
--

CREATE TABLE IF NOT EXISTS `chii_crt_comments` (
  `crt_pst_id` mediumint(8) unsigned NOT NULL,
  `crt_pst_mid` mediumint(8) unsigned NOT NULL COMMENT '关联人物ID',
  `crt_pst_uid` mediumint(8) unsigned NOT NULL,
  `crt_pst_related` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `crt_pst_dateline` int(10) unsigned NOT NULL,
  `crt_pst_content` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chii_ep_comments`
--

CREATE TABLE IF NOT EXISTS `chii_ep_comments` (
  `ep_pst_id` mediumint(8) unsigned NOT NULL,
  `ep_pst_mid` mediumint(8) unsigned NOT NULL,
  `ep_pst_uid` mediumint(8) unsigned NOT NULL,
  `ep_pst_related` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ep_pst_dateline` int(10) unsigned NOT NULL,
  `ep_pst_content` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chii_group_posts`
--

CREATE TABLE IF NOT EXISTS `chii_group_posts` (
  `grp_pst_id` mediumint(8) unsigned NOT NULL,
  `grp_pst_mid` mediumint(8) unsigned NOT NULL,
  `grp_pst_uid` mediumint(8) unsigned NOT NULL,
  `grp_pst_related` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '关联回复ID',
  `grp_pst_content` mediumtext NOT NULL,
  `grp_pst_state` tinyint(1) unsigned NOT NULL,
  `grp_pst_dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chii_prsn_comments`
--

CREATE TABLE IF NOT EXISTS `chii_prsn_comments` (
  `prsn_pst_id` mediumint(8) unsigned NOT NULL,
  `prsn_pst_mid` mediumint(8) unsigned NOT NULL COMMENT '关联人物ID',
  `prsn_pst_uid` mediumint(8) unsigned NOT NULL,
  `prsn_pst_related` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `prsn_pst_dateline` int(10) unsigned NOT NULL,
  `prsn_pst_content` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chii_subject_posts`
--

CREATE TABLE IF NOT EXISTS `chii_subject_posts` (
  `sbj_pst_id` mediumint(8) unsigned NOT NULL,
  `sbj_pst_mid` mediumint(8) unsigned NOT NULL,
  `sbj_pst_uid` mediumint(8) unsigned NOT NULL,
  `sbj_pst_related` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sbj_pst_content` mediumtext CHARACTER SET utf8mb4 NOT NULL,
  `sbj_pst_state` tinyint(1) unsigned NOT NULL,
  `sbj_pst_dateline` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chii_crt_comments`
--
ALTER TABLE `chii_crt_comments`
  ADD PRIMARY KEY (`crt_pst_id`),
  ADD KEY `cmt_crt_id` (`crt_pst_mid`),
  ADD KEY `crt_pst_related` (`crt_pst_related`),
  ADD KEY `crt_pst_uid` (`crt_pst_uid`);

--
-- Indexes for table `chii_ep_comments`
--
ALTER TABLE `chii_ep_comments`
  ADD PRIMARY KEY (`ep_pst_id`),
  ADD KEY `ep_cmt_crt_id` (`ep_pst_mid`),
  ADD KEY `ep_pst_related` (`ep_pst_related`),
  ADD KEY `ep_pst_uid` (`ep_pst_uid`);

--
-- Indexes for table `chii_group_posts`
--
ALTER TABLE `chii_group_posts`
  ADD PRIMARY KEY (`grp_pst_id`),
  ADD KEY `pss_topic_id` (`grp_pst_mid`),
  ADD KEY `grp_pst_related` (`grp_pst_related`),
  ADD KEY `grp_pst_uid` (`grp_pst_uid`);

--
-- Indexes for table `chii_prsn_comments`
--
ALTER TABLE `chii_prsn_comments`
  ADD PRIMARY KEY (`prsn_pst_id`),
  ADD KEY `cmt_prsn_id` (`prsn_pst_mid`),
  ADD KEY `prsn_pst_related` (`prsn_pst_related`),
  ADD KEY `prsn_pst_uid` (`prsn_pst_uid`);

--
-- Indexes for table `chii_subject_posts`
--
ALTER TABLE `chii_subject_posts`
  ADD PRIMARY KEY (`sbj_pst_id`),
  ADD KEY `pss_topic_id` (`sbj_pst_mid`),
  ADD KEY `sbj_pst_related` (`sbj_pst_related`),
  ADD KEY `sbj_pst_uid` (`sbj_pst_uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chii_crt_comments`
--
ALTER TABLE `chii_crt_comments`
  MODIFY `crt_pst_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chii_ep_comments`
--
ALTER TABLE `chii_ep_comments`
  MODIFY `ep_pst_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chii_group_posts`
--
ALTER TABLE `chii_group_posts`
  MODIFY `grp_pst_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chii_prsn_comments`
--
ALTER TABLE `chii_prsn_comments`
  MODIFY `prsn_pst_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chii_subject_posts`
--
ALTER TABLE `chii_subject_posts`
  MODIFY `sbj_pst_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE IF NOT EXISTS chii_memberfields
(
    uid       mediumint unsigned       default 0  not null primary key,
    site      varchar(75) charset utf8 default '' not null,
    location  varchar(30) charset utf8 default '' not null,
    bio       text charset utf8                   not null,
    privacy   mediumtext charset utf8             not null,
    blocklist mediumtext charset utf8             not null
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


-- --------------------------------------------------------

--
-- Table structure for table `chii_members`
--

CREATE TABLE IF NOT EXISTS chii_members
(
    uid          mediumint unsigned auto_increment primary key,
    username     char(15) charset utf8 default '' not null,
    nickname     varchar(30)                      not null,
    avatar       varchar(255) charset utf8        not null,
    groupid      smallint(6) unsigned  default 0  not null, # 用户权限组
    regdate      int unsigned          default 0  not null, # 注册日期
    lastvisit    int unsigned          default 0  not null, # 最后访问
    lastactivity int unsigned          default 0  not null, # 最后活动
    lastpost     int unsigned          default 0  not null, # 最后发帖
    dateformat   char(10) charset utf8 default '' not null, # 没用
    timeformat   tinyint(1)            default 0  not null, # 没用
    timeoffset   char(4) charset utf8  default '' not null, # 没用
    newpm        tinyint(1)            default 0  not null,
    new_notify   smallint(6) unsigned  default 0  not null comment '新提醒',
    sign         varchar(255) charset utf8        not null,
    constraint username unique (username)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 19, 2021 at 09:15 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

-- --------------------------------------------------------

--
-- Table structure for table `chii_oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `chii_oauth_access_tokens` (
  `access_token` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chii_oauth_access_tokens`
--
ALTER TABLE `chii_oauth_access_tokens`
  ADD PRIMARY KEY (`access_token`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 17, 2021 at 05:51 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

-- --------------------------------------------------------

--
-- Table structure for table `chii_subject_revisions`
--

CREATE TABLE IF NOT EXISTS `chii_subject_revisions` (
  `rev_id` mediumint(8) unsigned NOT NULL,
  `rev_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '修订类型',
  `rev_subject_id` mediumint(8) unsigned NOT NULL,
  `rev_type_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `rev_creator` mediumint(8) unsigned NOT NULL,
  `rev_dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `rev_name` varchar(80) NOT NULL,
  `rev_name_cn` varchar(80) NOT NULL,
  `rev_field_infobox` mediumtext NOT NULL,
  `rev_field_summary` mediumtext NOT NULL,
  `rev_vote_field` mediumtext NOT NULL,
  `rev_field_eps` mediumint(8) unsigned NOT NULL,
  `rev_edit_summary` varchar(200) NOT NULL,
  `rev_platform` smallint(6) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chii_subject_revisions`
--
ALTER TABLE `chii_subject_revisions`
  ADD PRIMARY KEY (`rev_id`),
  ADD KEY `rev_subject_id` (`rev_subject_id`,`rev_creator`),
  ADD KEY `rev_type` (`rev_type`),
  ADD KEY `rev_dateline` (`rev_dateline`),
  ADD KEY `rev_creator` (`rev_creator`,`rev_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chii_subject_revisions`
--
ALTER TABLE `chii_subject_revisions`
  MODIFY `rev_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 17, 2021 at 05:52 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

-- --------------------------------------------------------

--
-- Table structure for table `chii_rev_history`
--

CREATE TABLE IF NOT EXISTS `chii_rev_history` (
  `rev_id` mediumint(8) unsigned NOT NULL,
  `rev_type` tinyint(3) unsigned NOT NULL COMMENT '条目，角色，人物',
  `rev_mid` mediumint(8) unsigned NOT NULL COMMENT '对应条目，人物的ID',
  `rev_text_id` mediumint(9) unsigned NOT NULL,
  `rev_dateline` int(10) unsigned NOT NULL,
  `rev_creator` mediumint(8) unsigned NOT NULL,
  `rev_edit_summary` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chii_rev_text`
--

CREATE TABLE IF NOT EXISTS `chii_rev_text` (
  `rev_text_id` mediumint(9) unsigned NOT NULL,
  `rev_text` mediumblob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chii_rev_history`
--
ALTER TABLE `chii_rev_history`
  ADD PRIMARY KEY (`rev_id`),
  ADD KEY `rev_crt_id` (`rev_type`,`rev_mid`),
  ADD KEY `rev_crt_creator` (`rev_creator`),
  ADD KEY `rev_id` (`rev_id`,`rev_type`,`rev_creator`);

--
-- Indexes for table `chii_rev_text`
--
ALTER TABLE `chii_rev_text`
  ADD PRIMARY KEY (`rev_text_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chii_rev_history`
--
ALTER TABLE `chii_rev_history`
  MODIFY `rev_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chii_rev_text`
--
ALTER TABLE `chii_rev_text`
  MODIFY `rev_text_id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 17, 2021 at 05:51 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

-- --------------------------------------------------------

--
-- Table structure for table `chii_ep_revisions`
--

CREATE TABLE IF NOT EXISTS `chii_ep_revisions` (
  `ep_rev_id` mediumint(8) unsigned NOT NULL,
  `rev_sid` mediumint(8) unsigned NOT NULL, # subject_id
  `rev_eids` varchar(255) NOT NULL,
  `rev_ep_infobox` mediumtext NOT NULL,
  `rev_creator` mediumint(8) unsigned NOT NULL,
  `rev_version` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rev_dateline` int(10) unsigned NOT NULL,
  `rev_edit_summary` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chii_ep_revisions`
--
ALTER TABLE `chii_ep_revisions`
  ADD PRIMARY KEY (`ep_rev_id`),
  ADD KEY `rev_sid` (`rev_sid`,`rev_creator`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chii_ep_revisions`
--
ALTER TABLE `chii_ep_revisions`
  MODIFY `ep_rev_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 08, 2021 at 06:49 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

-- --------------------------------------------------------

--
-- Table structure for table `chii_subjects`
--

CREATE TABLE IF NOT EXISTS `chii_subjects` (
  `subject_id` mediumint(8) unsigned NOT NULL,
  `subject_type_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `subject_name` varchar(80) NOT NULL,
  `subject_name_cn` varchar(80) NOT NULL,
  `subject_uid` varchar(20) NOT NULL COMMENT 'isbn / imdb',
  `subject_creator` mediumint(8) unsigned NOT NULL,
  `subject_dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `subject_image` varchar(255) NOT NULL,
  `subject_platform` smallint(6) unsigned NOT NULL DEFAULT '0',
  `field_infobox` mediumtext NOT NULL,
  `field_summary` mediumtext NOT NULL COMMENT 'summary',
  `field_5` mediumtext NOT NULL COMMENT 'author summary',
  `field_volumes` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '卷数',
  `field_eps` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject_wish` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject_collect` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject_doing` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject_on_hold` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '搁置人数',
  `subject_dropped` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '抛弃人数',
  `subject_series` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject_series_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject_idx_cn` varchar(1) NOT NULL,
  `subject_airtime` tinyint(1) unsigned NOT NULL,
  `subject_nsfw` tinyint(1) NOT NULL,
  `subject_ban` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chii_subject_alias`
--

CREATE TABLE IF NOT EXISTS `chii_subject_alias` (
  `subject_id` int(10) unsigned NOT NULL,
  `alias_name` varchar(255) NOT NULL,
  `subject_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '所属条目的类型',
  `alias_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是别名还是条目名',
  `alias_key` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chii_subject_fields`
--

CREATE TABLE IF NOT EXISTS `chii_subject_fields` (
  `field_sid` mediumint(8) unsigned NOT NULL,
  `field_tid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `field_tags` mediumtext NOT NULL,
  `field_rate_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_rate_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_rate_3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_rate_4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_rate_5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_rate_6` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_rate_7` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_rate_8` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_rate_9` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_rate_10` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_airtime` tinyint(1) unsigned NOT NULL,
  `field_rank` int(10) unsigned NOT NULL DEFAULT '0',
  `field_year` year(4) NOT NULL COMMENT '放送年份',
  `field_mon` tinyint(2) NOT NULL COMMENT '放送月份',
  `field_week_day` tinyint(1) NOT NULL COMMENT '放送日(星期X)',
  `field_date` date NOT NULL COMMENT '放送日期',
  `field_redirect` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chii_subject_relations`
--

CREATE TABLE IF NOT EXISTS `chii_subject_relations` (
  `rlt_subject_id` mediumint(8) unsigned NOT NULL COMMENT '关联主 ID',
  `rlt_subject_type_id` tinyint(3) unsigned NOT NULL,
  `rlt_relation_type` smallint(5) unsigned NOT NULL COMMENT '关联类型',
  `rlt_related_subject_id` mediumint(8) unsigned NOT NULL COMMENT '关联目标 ID',
  `rlt_related_subject_type_id` tinyint(3) unsigned NOT NULL COMMENT '关联目标类型',
  `rlt_vice_versa` tinyint(1) unsigned NOT NULL,
  `rlt_order` tinyint(3) unsigned NOT NULL COMMENT '关联排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='条目关联表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chii_subjects`
--
ALTER TABLE `chii_subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `subject_name_cn` (`subject_name_cn`),
  ADD KEY `subject_platform` (`subject_platform`),
  ADD KEY `subject_creator` (`subject_creator`),
  ADD KEY `subject_series` (`subject_series`),
  ADD KEY `subject_series_entry` (`subject_series_entry`),
  ADD KEY `subject_airtime` (`subject_airtime`),
  ADD KEY `subject_ban` (`subject_ban`),
  ADD KEY `subject_idx_cn` (`subject_idx_cn`,`subject_type_id`),
  ADD KEY `subject_type_id` (`subject_type_id`),
  ADD KEY `subject_name` (`subject_name`),
  ADD KEY `order_by_name` (`subject_ban`,`subject_type_id`,`subject_series`,`subject_platform`,`subject_name`) USING BTREE,
  ADD KEY `browser` (`subject_ban`,`subject_type_id`,`subject_series`,`subject_platform`) USING BTREE,
  ADD KEY `subject_nsfw` (`subject_nsfw`);

--
-- Indexes for table `chii_subject_alias`
--
ALTER TABLE `chii_subject_alias`
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `chii_subject_fields`
--
ALTER TABLE `chii_subject_fields`
  ADD PRIMARY KEY (`field_sid`),
  ADD KEY `sort_id` (`field_tid`),
  ADD KEY `subject_airtime` (`field_airtime`),
  ADD KEY `field_rank` (`field_rank`),
  ADD KEY `field_date` (`field_date`),
  ADD KEY `field_year_mon` (`field_year`,`field_mon`),
  ADD KEY `field_year` (`field_year`),
  ADD KEY `query_date` (`field_sid`,`field_date`);

--
-- Indexes for table `chii_subject_relations`
--
ALTER TABLE `chii_subject_relations`
  ADD UNIQUE KEY `rlt_subject_id` (`rlt_subject_id`,`rlt_related_subject_id`,`rlt_vice_versa`),
  ADD KEY `rlt_related_subject_type_id` (`rlt_related_subject_type_id`,`rlt_order`),
  ADD KEY `rlt_subject_type_id` (`rlt_subject_type_id`),
  ADD KEY `rlt_relation_type` (`rlt_relation_type`,`rlt_subject_id`,`rlt_related_subject_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chii_subjects`
--
ALTER TABLE `chii_subjects`
  MODIFY `subject_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chii_subject_fields`
--
ALTER TABLE `chii_subject_fields`
  MODIFY `field_sid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 16, 2021 at 04:28 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

-- --------------------------------------------------------

--
-- Table structure for table `chii_episodes`
--

CREATE TABLE IF NOT EXISTS `chii_episodes` (
  `ep_id` mediumint(8) unsigned NOT NULL,
  `ep_subject_id` mediumint(8) unsigned NOT NULL,
  `ep_sort` float unsigned NOT NULL DEFAULT '0',
  `ep_type` tinyint(1) unsigned NOT NULL,
  `ep_disc` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '碟片数',
  `ep_name` varchar(80) NOT NULL,
  `ep_name_cn` varchar(80) NOT NULL,
  `ep_rate` tinyint(3) NOT NULL,
  `ep_duration` varchar(80) NOT NULL,
  `ep_airdate` varchar(80) NOT NULL,
  `ep_online` mediumtext NOT NULL,
  `ep_comment` mediumint(8) unsigned NOT NULL,
  `ep_resources` mediumint(8) unsigned NOT NULL,
  `ep_desc` mediumtext NOT NULL,
  `ep_dateline` int(10) unsigned NOT NULL,
  `ep_lastpost` int(10) unsigned NOT NULL,
  `ep_lock` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ep_ban` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chii_episodes`
--
ALTER TABLE `chii_episodes`
  ADD PRIMARY KEY (`ep_id`),
  ADD KEY `ep_sort` (`ep_sort`),
  ADD KEY `ep_disc` (`ep_disc`),
  ADD KEY `ep_subject_id` (`ep_subject_id`),
  ADD KEY `ep_lastpost` (`ep_lastpost`),
  ADD KEY `ep_ban` (`ep_ban`),
  ADD KEY `ep_subject_id_2` (`ep_subject_id`,`ep_ban`,`ep_sort`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chii_episodes`
--
ALTER TABLE `chii_episodes`
  MODIFY `ep_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 27, 2021 at 03:29 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

-- --------------------------------------------------------

--
-- Table structure for table `chii_subject_interests`
--

CREATE TABLE IF NOT EXISTS `chii_subject_interests` (
  `interest_id` int(10) unsigned NOT NULL,
  `interest_uid` mediumint(8) unsigned NOT NULL,
  `interest_subject_id` mediumint(8) unsigned NOT NULL,
  `interest_subject_type` smallint(6) unsigned NOT NULL DEFAULT '0',
  `interest_rate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `interest_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `interest_has_comment` tinyint(1) unsigned NOT NULL,
  `interest_comment` mediumtext NOT NULL,
  `interest_tag` mediumtext NOT NULL,
  `interest_ep_status` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `interest_vol_status` mediumint(8) unsigned NOT NULL COMMENT '卷数',
  `interest_wish_dateline` int(10) unsigned NOT NULL,
  `interest_doing_dateline` int(10) unsigned NOT NULL,
  `interest_collect_dateline` int(10) unsigned NOT NULL,
  `interest_on_hold_dateline` int(10) unsigned NOT NULL,
  `interest_dropped_dateline` int(10) unsigned NOT NULL,
  `interest_lasttouch` int(10) unsigned NOT NULL DEFAULT '0',
  `interest_private` tinyint(1) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chii_subject_interests`
--
ALTER TABLE `chii_subject_interests`
  ADD PRIMARY KEY (`interest_id`),
  ADD UNIQUE KEY `user_interest` (`interest_uid`,`interest_subject_id`),
  ADD KEY `interest_subject_id` (`interest_subject_id`,`interest_type`),
  ADD KEY `interest_uid` (`interest_uid`),
  ADD KEY `interest_collect_dateline` (`interest_collect_dateline`),
  ADD KEY `interest_private` (`interest_private`),
  ADD KEY `interest_lasttouch` (`interest_lasttouch`),
  ADD KEY `interest_subject_id_2` (`interest_subject_id`),
  ADD KEY `interest_type` (`interest_type`),
  ADD KEY `interest_subject_type` (`interest_subject_type`),
  ADD KEY `interest_rate` (`interest_rate`),
  ADD KEY `tag_subject_id` (`interest_subject_type`,`interest_type`,`interest_uid`) USING BTREE,
  ADD KEY `user_collects` (`interest_subject_type`,`interest_uid`),
  ADD KEY `subject_lasttouch` (`interest_subject_id`,`interest_private`,`interest_lasttouch`),
  ADD KEY `subject_comment` (`interest_subject_id`,`interest_has_comment`,`interest_private`,`interest_lasttouch`) USING BTREE,
  ADD KEY `subject_collect` (`interest_subject_id`,`interest_type`,`interest_private`,`interest_collect_dateline`),
  ADD KEY `user_collect_type` (`interest_subject_type`,`interest_type`,`interest_uid`,`interest_private`,`interest_collect_dateline`),
  ADD KEY `interest_id` (`interest_uid`,`interest_private`) USING BTREE,
  ADD KEY `subject_rate` (`interest_subject_id`,`interest_rate`,`interest_private`),
  ADD KEY `top_subject` (`interest_subject_id`,`interest_subject_type`,`interest_doing_dateline`),
  ADD KEY `user_collect_latest` (`interest_subject_type`,`interest_type`,`interest_uid`,`interest_private`),
  ADD KEY `interest_type_2` (`interest_type`,`interest_uid`),
  ADD KEY `interest_uid_2` (`interest_uid`,`interest_private`,`interest_lasttouch`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chii_subject_interests`
--
ALTER TABLE `chii_subject_interests`
  MODIFY `interest_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 06, 2021 at 02:29 PM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

--
-- Dumping data for table `chii_person_fields`
--

INSERT INTO `chii_person_fields` (`prsn_cat`, `prsn_id`, `gender`, `bloodtype`, `birth_year`, `birth_mon`, `birth_day`) VALUES
('crt', 1, 1, 0, 0000, 12, 5),
('prsn', 1, 2, 0, 1980, 1, 21),
('crt', 2, 1, 0, 2000, 7, 10),
('prsn', 2, 1, 0, 0000, 19, 9),
('crt', 3, 2, 0, 0000, 0, 0),
('prsn', 3, 1, 0, 1962, 5, 5),
('crt', 4, 2, 1, 0000, 12, 24),
('prsn', 4, 1, 0, 0000, 19, 1),
('crt', 5, 2, 1, 0000, 5, 13),
('prsn', 5, 1, 0, 0000, 0, 0),
('crt', 6, 2, 2, 0000, 7, 20),
('prsn', 6, 1, 0, 0000, 0, 0),
('crt', 7, 2, 4, 0000, 9, 9),
('prsn', 7, 1, 0, 0000, 0, 0),
('crt', 8, 2, 4, 0000, 10, 14),
('prsn', 8, 1, 0, 0000, 0, 0),
('crt', 9, 1, 0, 0000, 19, 2),
('prsn', 9, 1, 0, 1962, 3, 2),
('crt', 10, 1, 0, 0000, 0, 0),
('prsn', 10, 1, 0, 0000, 19, 9);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 06, 2021 at 02:19 PM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

--
-- Dumping data for table `chii_characters`
--

INSERT INTO `chii_characters` (`crt_id`, `crt_name`, `crt_role`, `crt_infobox`, `crt_summary`, `crt_img`, `crt_comment`, `crt_collects`, `crt_dateline`, `crt_lastpost`, `crt_lock`, `crt_img_anidb`, `crt_anidb_id`, `crt_ban`, `crt_redirect`, `crt_nsfw`) VALUES
(1, 'ルルーシュ・ランペルージ', 1, '{{Infobox Crt\r\n|简体中文名= 鲁路修·兰佩路基\r\n|别名={\r\n[L.L.]\r\n[勒鲁什]\r\n[鲁鲁修]\r\n[ゼロ]\r\n[Zero]\r\n[英文名|Lelouch Lamperouge]\r\n[第二中文名|鲁路修·冯·布里塔尼亚]\r\n[英文名二|Lelouch Vie Britannia]\r\n[日文名|ルルーシュ・ヴィ・ブリタニア]\r\n[纯假名|]\r\n[罗马字|]\r\n[昵称|]\r\n[其他名义|]\r\n}\r\n|性别= 男\r\n|生日= 12月5日\r\n|血型= A型\r\n|身高= 178cm→181cm\r\n|体重= 54kg\r\n|BWH= \r\n|引用来源= Wikipedia\r\n}}', '鲁路修·兰佩洛基是日本动画《Code Geass 反叛的鲁路修》中的主角。\r\n\r\n一年前的东京攻略战中，黑色骑士团因为首领Zero的离开而最终战败。之后一年间，鲁路修的Geass能力被人封印而平静的生活在阿什弗德学园，在第二季开头，鲁路修重新与C.C相遇之后，Geass封印被解开，鲁路修也恢复了记忆。\r\n一年前最后的神根岛之战，鲁路修被朱雀制服，并被押到其父不列颠皇帝面前，被皇帝施以Geass封印一切记忆。\r\n封印解除之后，Geass能力恢复到封印之前的状态，依然暴走，无法关闭，为了防止尤菲米雅的悲剧再次上演，C.C给了鲁路修特制的隐形眼镜来应对暴走的Geass能力。', '7b/3a/1_crt_8V556.jpg?r=1603459589', 111, 667, 0, 1638705672, 0, '', 0, 0, 0, 0),
(2, '枢木スザク', 1, '{{Infobox Crt\r\n|简体中文名= 枢木朱雀\r\n|别名={\r\n[第二中文名|白色骑士]\r\n[英文名|Knight of Seven]\r\n[日文名|枢木 スザク]\r\n[纯假名|くるるぎ スザク]\r\n[罗马字|Kururugi Suzaku]\r\n[昵称|]\r\n}\r\n|性别= 男\r\n|生日= 皇历2000年7月10日\r\n|血型= O型\r\n|身高= 176cm→179cm\r\n|体重= 58kg\r\n|BWH= \r\n|引用来源={\r\n}\r\n}}', '在第一季的最后，驾驶兰斯洛特向Zero展开了大报复，于战场上活跃，被柯内莉娅晋升为骑士侯。最后在神根岛和鲁路修对决中。从V.V处得知了Geass能力的实质。\r\n第二季中，朱雀进入了皇帝直属的亲卫队“Knight of Rounds”，是排名第七位的骑士。现在作为皇帝的直属骑士，奔走于世界各地。因为年龄相近，和骑士阿妮娅和基诺关系不错，朱雀是第一位出身Number的“Knight of Rounds”骑士。\r\n在一年前的神根岛之战的最后，朱雀制服鲁路修，并把他押送到不列颠皇帝面前，因此功绩主动向皇帝申请加入皇帝亲卫队圆桌骑士团，获准。目前转战于不列颠帝国对EU的欧洲战场前线，在波尔多（Bordeaux）地区大破EU方面的德意志、法国、荷兰、意大利联合部队。\r\n现在，再次以学生身份回到了11区阿什弗德学园，最终目的是为了得到圆桌骑士NO.1位置，得到并建立行政特区“日本”。', '6f/40/2_crt_08diJ.jpg?r=1581939778', 86, 112, 0, 1638458451, 0, '', 0, 0, 0, 0),
(3, 'C.C.', 1, '{{Infobox Crt\r\n|简体中文名= C.C.\r\n|别名={\r\n[第二中文名|夕赐（音译）]\r\n[英文名|]\r\n[日文名|シー・ツー]\r\n[纯假名|]\r\n[罗马字|C.C.]\r\n[昵称|]\r\n}\r\n|性别= 女\r\n|生日= \r\n|血型= \r\n|身高= 168cm\r\n|体重= \r\n|BWH= \r\n|引用来源={\r\n[anidb.net]\r\n}\r\n}}', '在鲁路修面临生死关头时，给予他Geass的力量救了鲁路修一命。目前寄住在鲁路修家中。但是在R2中只出没于黑色骑士团。\r\nC.C.不会容许鲁路修死去，因为她还有“事情”要去完成。\r\nC.C.经常跟著鲁路修行动，目的在于“保护鲁路修”。不过，有一次，C.C.明确地表示自己不是“保护者”。\r\n当鲁路修说她的名字不像“人类”的名字。而C.C. 就反问鲁路修“你知道雪为什么是白色的吗？”，之后她自己就回答“因为忘了自己究竟是甚么颜色”〔ルルーシュ、雪がどうして白いか知っているか？自分がどんな色だったか忘れてしまったからさ。〕，暗示C.C.忘了自己的过去。其本名，到现在为止，未正式出现在观众面前。C.C.表示鲁路修读他名的时候发音错了，表示她其实是知道她自己的本名。而她的“目的”是故事伏线之一。\r\n她本人，是没有Geass的力量，所以她才给鲁路修Geass的力量\r\n在故事开头，曾经有一张C.C.的旧照。而当中C.C.身处战场，而在背景中的战车是在第一次世界大战中的战车。而且剧情表示C.C.是一开始就认识鲁鲁修的，在第一集的背景中（鲁鲁修年幼的时候），就在鲁鲁修身旁。对于鲁鲁修的母亲也应是朋友关系。\r\nC.C.是上一任GEASS教团的当主。', '83/62/3_crt_7Jhis.jpg?r=1573280268', 86, 786, 0, 1637399971, 0, '', 0, 0, 0, 0),
(4, '古河渚', 1, '{{Infobox Crt\r\n|简体中文名= 古河渚\r\n|别名={\r\n[第二中文名|冈崎渚]\r\n[英文名|]\r\n[日文名|]\r\n[纯假名|ふるかわ なぎさ]\r\n[罗马字|Furukawa Nagisa]\r\n[昵称|小渚]\r\n}\r\n|性别= 女\r\n|生日= 12月24日\r\n|血型= A\r\n|身高= 155cm\r\n|体重= 43kg\r\n|BWH= 80/55/81\r\n|引用来源= \r\n|声优= 中原麻衣\r\n}}', '就读某高中的3年B班，比朋也大一岁，因为久病重读一年，对于将面对新的环境而在往校门前的坡道上不敢前行，也因此和朋也相遇并熟识。\r\n家里开面包店，有个直爽的父亲和温柔的母亲。\r\n个性认真温柔，缺乏自信，不过有时却意外的顽固。\r\n十分喜欢演戏，可是却完全没有演戏剧的经验，目标是再建立戏剧社。\r\n对以前流行的“团子大家族”特别喜爱，时常哼著团子大家族的歌，也常抱着团子大家族的布偶入睡。', 'e9/cf/4_crt_f11eW.jpg?r=1560006952', 143, 705, 0, 1632766835, 0, '', 0, 0, 0, 0),
(5, '一ノ瀬ことみ', 1, '{{Infobox Crt\r\n|简体中文名= 一之濑琴美\r\n|别名={\r\n[第二中文名|]\r\n[英文名|]\r\n[日文名|一ノ瀬 ことみ]\r\n[纯假名|いちのせ ことみ]\r\n[罗马字|Ichinose Kotomi]\r\n[昵称|]\r\n}\r\n|性别= 女\r\n|生日= 5月13日\r\n|血型= A\r\n|身高= 160cm\r\n|体重= 48kg\r\n|BWH= 88/58/85\r\n|引用来源= \r\n}}', '总是在图书室读着书，有些奇怪的女孩。虽然头脑非常好，但她那奇特的言行每每让周围的人们感到不安与混乱。她有时候会用剪刀去剪下书页，而在这奇特的行为的背后更隐藏着一个大秘密……', '27/ff/5_crt_MPEQN.jpg', 42, 253, 0, 1632394974, 0, '', 0, 0, 0, 0),
(6, '伊吹風子', 1, '{{Infobox Crt\r\n|简体中文名= 伊吹风子\r\n|别名={\r\n[第二中文名|]\r\n[英文名|]\r\n[日文名|]\r\n[纯假名|いぶきふうこ]\r\n[罗马字|Ibuki Fuuko]\r\n[昵称|]\r\n}\r\n|性别= 女\r\n|生日= 7月20日\r\n|血型= B\r\n|身高= 150cm\r\n|体重= 41kg\r\n|BWH= 78/54/79\r\n|引用来源={\r\n}\r\n|声优= 野中藍\r\n}}', '独自在旧校舍的空教室里不断地雕刻着木片做的海星的古怪的女孩。性情虽然十分孩子气，但却好像一直认为自己具备了“成人的风格”。她有一个比她年长不少的姐姐，在那木片之中，饱含了风子对她姐姐的深情。', '0b/8f/6_crt_FsUsI.jpg', 46, 270, 0, 1626779307, 0, '', 0, 1, 0, 0),
(7, '藤林杏', 1, '{{Infobox Crt\r\n|简体中文名= 藤林杏\r\n|别名={\r\n[第二中文名|]\r\n[英文名|]\r\n[日文名|]\r\n[纯假名|ふじばやし きょう]\r\n[罗马字|Fujibayashi Kyou]\r\n[昵称|]\r\n}\r\n|性别= 女\r\n|生日= 9月9日\r\n|血型= O\r\n|身高= 160 cm\r\n|体重= 46 kg\r\n|BWH= 82/56/82\r\n|引用来源= \r\n|声优= \r\n|马尾力= \r\n}}', '主人公と同じ学校の３年生。口が悪くおおざっぱな性格をしているけど、面倒見のいい女の子。隣のクラスで委員長をしている。２年の時は、主人公と同じクラスだった。内緒で校則違反となるバイク通学中。おとなしい妹の椋とはちがい、活発なキャラクター。', 'c1/93/7_crt_k8abL.jpg', 51, 418, 0, 1638704997, 0, '', 0, 0, 0, 0),
(8, '坂上智代', 1, '{{Infobox Crt\r\n|简体中文名= 坂上智代\r\n|别名={\r\n[第二中文名|]\r\n[英文名|]\r\n[日文名|]\r\n[纯假名|さかがみともよ]\r\n[罗马字|Sakagami Tomoyo]\r\n[昵称|]\r\n}\r\n|性别= 女\r\n|生日= 10月14日\r\n|血型= O\r\n|身高= 161cm\r\n|体重= 47kg\r\n|BWH= 86/57/82\r\n|引用来源={\r\n}\r\n|声优= \r\n}}', '朋也的后辈……虽说应当是如此，说起话来的口气却像是个前辈一样。她待人很好，又有领导才能，因此在她的身边很自然地就聚集起了许多人。她的目标是成为学生会的会长，但这却成为了她与朋也之间的鸿沟……', '92/96/8_crt_1L1cI.jpg', 58, 510, 0, 1637911469, 0, '', 0, 0, 0, 0),
(9, 'Solid Snake', 1, '{{Infobox Crt\r\n|简体中文名= 固蛇\r\n|别名={\r\n[Old Snake]\r\n[第二中文名|大卫]\r\n[英文名|David]\r\n[日文名|ソリッド・スネーク]\r\n[纯假名|]\r\n[罗马字|]\r\n[昵称|]\r\n}\r\n|性别= 男\r\n|生日= 1972年\r\n|血型= \r\n|身高= \r\n|体重= \r\n|BWH= \r\n|引用来源={\r\n}\r\n}}', '潜龙谍影大部分作品中的主角。据考证是以John Carpenter的漫画Snake Plissken Chronicles 的主角Snake Plissken（该漫画曾改编成两部电影，逃出纽约及逃出洛杉矶），以及《第一滴血》的主角约翰·兰博为原型（三代中的主角Snake也就是Big Boss也参考此二人）。\r\n\r\n本名David，是Big Boss的克隆人，因此身体细胞急速老化。前Foxhound成员，IQ达180，能操流利六国语言。曾参与并解决“Outer Heaven危机”及“Zanziba Land事件”，在两次事变中摧毁了Metal Gear及Big Boss的野心而拯救世界，得到“传说中的佣兵”这称号。退伍后在阿拉斯加隠居，之后因“Shadow Moses事件”而被迫再次参与任务。事件后，加入了反Metal Gear组织“Philanthropy”，在世界各地参与反Metal Gear运动。\r\n\r\n无数次把世界从两足可行走核武战车METALGEAR的威胁中拯救出来的潜入任务专家。SNAKE是用BIGBOSS体内提取的细胞所创造出来的克隆体。从美国特种部队FOXHOUND退役之后他便隐居在阿拉斯加并随后成立了国际反METAL GEAR组织“慈善组织”，BIGSHELL事件后本已失踪的他现在却应ROY CAMPELL的请求回来消灭LIQUID。尽管他只有四十多岁，但是身体却由于某种不明原因迅速老化。', '32/41/9_crt_Pni9s.jpg?r=1367822383', 4, 28, 0, 1617831481, 1, '', 0, 0, 0, 0),
(10, 'Heavy', 1, '{{Infobox Crt\r\n|简体中文名= 重装兵\r\n|别名={\r\n[第二中文名|]\r\n[英文名|Heavy]\r\n[日文名|]\r\n[纯假名|]\r\n[罗马字|]\r\n[昵称|]\r\n}\r\n|性别= 男\r\n|生日= \r\n|血型= \r\n|身高= \r\n|体重= \r\n|BWH= \r\n|引用来源={\r\n[http://wiki.teamfortress.com/wiki/Heavy/zh-hans]\r\n}\r\n|座右铭= 射击真棒\r\n|CV= 盖瑞·舒瓦茨\r\n|出身地= 苏联、朱格朱尔山脉、哈巴罗夫斯克\r\n}}', '就像一只正在冬眠的熊，重装兵看起来是个温和的大家伙。当然他的外表也像只熊，他总是会很迷煳，昏昏欲睡、或做出温柔的动作，但请注意，尽管他举止温柔，但他轻而易举便能将你大卸八块。他尽量节省自己的体力，但他却还是很爱睡觉。重装兵不是笨蛋，他也不是你的大朋友，他通常会希望你在他得亲自动手前自己赶快闭上嘴。', '10/fb/10_crt_1f1Hz.jpg', 1, 4, 0, 1469128722, 0, '', 0, 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 06, 2021 at 02:20 PM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

--
-- Dumping data for table `chii_crt_subject_index`
--

INSERT INTO `chii_crt_subject_index` (`crt_id`, `subject_id`, `subject_type_id`, `crt_type`, `ctr_appear_eps`, `crt_order`) VALUES
(1, 8, 2, 1, '', 1),
(1, 793, 2, 1, '', 1),
(1, 32214, 3, 1, '', 0),
(1, 35866, 2, 1, '', 0),
(1, 63130, 2, 3, '', 0),
(1, 86773, 2, 3, '', 0),
(1, 118727, 3, 1, '', 0),
(1, 118735, 3, 1, '', 0),
(1, 199228, 2, 1, '', 0),
(1, 199229, 2, 1, '', 0),
(1, 199230, 2, 1, '', 0),
(1, 199231, 2, 2, '', 0),
(1, 237827, 3, 1, '', 0),
(2, 8, 2, 1, '', 2),
(2, 793, 2, 1, '', 2),
(2, 63130, 2, 3, '', 0),
(2, 86773, 2, 3, '', 0),
(2, 185359, 4, 3, '', 0),
(2, 199228, 2, 2, '', 0),
(2, 199229, 2, 1, '', 0),
(2, 209563, 4, 3, '', 30),
(3, 8, 2, 1, '', 3),
(3, 793, 2, 1, '', 3),
(3, 32214, 3, 2, '', 0),
(3, 33389, 4, 2, '', 0),
(3, 35866, 2, 2, '', 0),
(3, 58255, 3, 1, '', 0),
(3, 73715, 1, 2, '', 0),
(3, 86773, 2, 3, '', 0),
(3, 118733, 3, 1, '', 0),
(3, 185359, 4, 3, '', 0),
(3, 199228, 2, 1, '', 0),
(3, 199229, 2, 1, '', 0),
(3, 209563, 4, 3, '', 32),
(3, 237827, 3, 1, '', 0),
(4, 13, 4, 1, '', 0),
(4, 51, 2, 1, '', 2),
(4, 876, 2, 1, '', 2),
(4, 3686, 2, 1, '', 0),
(4, 37874, 2, 3, '', 0),
(4, 311725, 4, 3, '', 0),
(4, 333598, 2, 1, '', 102),
(5, 13, 4, 1, '', 7),
(5, 51, 2, 1, '', 4),
(5, 876, 2, 2, '', 12),
(5, 3686, 2, 3, '', 0),
(5, 333598, 2, 1, '', 107),
(6, 13, 4, 1, '', 6),
(6, 51, 2, 1, '', 3),
(6, 876, 2, 2, '', 17),
(6, 37874, 2, 3, '', 0),
(6, 333598, 2, 1, '', 106),
(7, 13, 4, 1, '', 3),
(7, 51, 2, 1, '', 4),
(7, 876, 2, 2, '', 9),
(7, 3686, 2, 2, '', 0),
(7, 37874, 2, 1, '', 0),
(7, 333598, 2, 1, '', 103),
(8, 13, 4, 1, '', 5),
(8, 51, 2, 1, '', 4),
(8, 876, 2, 2, '', 11),
(8, 3660, 4, 1, '', 1),
(8, 3686, 2, 2, '', 0),
(8, 37873, 2, 1, '', 0),
(8, 333598, 2, 1, '', 105),
(9, 14, 4, 1, '', 0),
(9, 1500, 4, 1, '', 0),
(9, 1501, 4, 1, '', 0),
(9, 18766, 4, 1, '', 0),
(9, 98518, 4, 1, '', 0),
(9, 98520, 4, 1, '', 0),
(9, 154958, 1, 1, '', 0),
(9, 249470, 4, 1, '', 31),
(10, 6, 4, 1, '', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 06, 2021 at 02:22 PM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

--
-- Dumping data for table `chii_person_cs_index`
--

INSERT INTO `chii_person_cs_index` (`prsn_type`, `prsn_id`, `prsn_position`, `subject_id`, `subject_type_id`, `summary`, `prsn_appear_eps`) VALUES
('prsn', 1, 1001, 4, 4, '', ''),
('prsn', 1, 1002, 500, 4, '', ''),
('prsn', 1, 1003, 6, 4, '', ''),
('prsn', 1, 34, 19, 2, '', ''),
('prsn', 1, 33, 220187, 2, '', ''),
('prsn', 1, 3001, 12105, 3, '', ''),
('prsn', 1, 33, 68284, 2, '', ''),
('prsn', 1, 3001, 11011, 3, '', ''),
('prsn', 1, 3001, 6392, 3, '', ''),
('prsn', 1, 3001, 11013, 3, '', ''),
('prsn', 1, 3001, 11012, 3, '', ''),
('prsn', 1, 3001, 11008, 3, '', ''),
('prsn', 1, 3001, 6626, 3, '', ''),
('prsn', 1, 3001, 6627, 3, '', ''),
('prsn', 1, 3001, 9993, 3, '', ''),
('prsn', 1, 3001, 12560, 3, '', ''),
('prsn', 1, 3001, 13298, 3, '', ''),
('prsn', 1, 33, 4221, 2, '', ''),
('prsn', 1, 3003, 15352, 3, '', ''),
('prsn', 1, 3001, 15352, 3, '', ''),
('prsn', 1, 3001, 19476, 3, '', ''),
('prsn', 1, 3001, 9867, 3, '', ''),
('prsn', 1, 3001, 25082, 3, '', ''),
('prsn', 1, 3001, 27158, 3, '', ''),
('prsn', 1, 34, 993, 2, '', ''),
('prsn', 1, 3001, 31519, 3, '', ''),
('prsn', 1, 1011, 1735, 4, '', ''),
('prsn', 1, 3001, 9866, 3, '', ''),
('prsn', 1, 33, 54942, 2, '', ''),
('prsn', 1, 3001, 27585, 3, '', ''),
('prsn', 1, 3001, 34902, 3, '', ''),
('prsn', 1, 33, 23681, 2, '', ''),
('prsn', 1, 3001, 37824, 3, '', ''),
('prsn', 1, 3006, 4338, 3, '', ''),
('prsn', 1, 3001, 38221, 3, '', ''),
('prsn', 1, 33, 74906, 2, '', ''),
('prsn', 1, 3001, 38035, 3, '', ''),
('prsn', 1, 3006, 4172, 3, '', ''),
('prsn', 1, 3006, 1338, 3, '', ''),
('prsn', 1, 3006, 27061, 3, '', ''),
('prsn', 1, 3001, 48724, 3, '', ''),
('prsn', 1, 3006, 11006, 3, '', ''),
('prsn', 1, 3001, 52096, 3, '', ''),
('prsn', 1, 3001, 52762, 3, '', ''),
('prsn', 1, 1010, 51730, 4, '', ''),
('prsn', 1, 1011, 51730, 4, '', ''),
('prsn', 1, 1011, 43578, 4, '', ''),
('prsn', 1, 3001, 61250, 3, '', ''),
('prsn', 1, 33, 54552, 2, '', ''),
('prsn', 1, 3001, 65791, 3, '', ''),
('prsn', 1, 33, 14427, 2, '', ''),
('prsn', 1, 33, 56951, 2, '', ''),
('prsn', 1, 33, 3485, 2, '', ''),
('prsn', 1, 33, 993, 2, '', ''),
('prsn', 1, 3006, 42244, 3, '', ''),
('prsn', 1, 3001, 68799, 3, '', ''),
('prsn', 1, 3001, 72164, 3, '', ''),
('prsn', 1, 3001, 4939, 3, '', ''),
('prsn', 1, 33, 10278, 2, '', ''),
('prsn', 1, 3001, 74907, 3, '', ''),
('prsn', 1, 3001, 74908, 3, '', ''),
('prsn', 1, 33, 23626, 2, '', ''),
('prsn', 1, 3001, 7182, 3, '', ''),
('prsn', 1, 33, 25834, 2, '', ''),
('prsn', 1, 3006, 76834, 3, '', ''),
('prsn', 1, 3001, 76856, 3, '', ''),
('prsn', 1, 3001, 3858, 3, '', ''),
('prsn', 1, 3001, 18630, 3, '', ''),
('prsn', 1, 3001, 78167, 3, '', ''),
('prsn', 1, 3001, 78228, 3, '', ''),
('prsn', 1, 3001, 78230, 3, '', ''),
('prsn', 1, 3001, 78231, 3, '', ''),
('prsn', 1, 3001, 78233, 3, '', ''),
('prsn', 1, 3001, 31594, 3, '', ''),
('prsn', 1, 3001, 78238, 3, '', ''),
('prsn', 1, 3001, 78249, 3, '', ''),
('prsn', 1, 3001, 78271, 3, '', ''),
('prsn', 1, 3001, 78272, 3, '', ''),
('prsn', 1, 3001, 78273, 3, '', ''),
('prsn', 1, 3001, 78370, 3, '', ''),
('prsn', 1, 3001, 69637, 3, '', ''),
('prsn', 1, 3001, 78721, 3, '', ''),
('prsn', 1, 3001, 76834, 3, '', ''),
('prsn', 1, 3001, 42244, 3, '', ''),
('prsn', 1, 3001, 81549, 3, '', ''),
('prsn', 1, 3001, 30214, 3, '', ''),
('prsn', 1, 33, 109948, 2, '', ''),
('prsn', 1, 3001, 11006, 3, '', ''),
('prsn', 1, 1011, 29048, 4, '', ''),
('prsn', 1, 3001, 84533, 3, '', ''),
('prsn', 1, 33, 1262, 2, '', ''),
('prsn', 1, 3006, 4941, 3, '', ''),
('prsn', 1, 3001, 4941, 3, '', ''),
('prsn', 1, 3001, 86394, 3, '', ''),
('prsn', 1, 3001, 152197, 3, '', ''),
('prsn', 1, 3001, 86648, 3, '', ''),
('prsn', 1, 3001, 86650, 3, '', ''),
('prsn', 1, 3001, 86656, 3, '', ''),
('prsn', 1, 3001, 86657, 3, '', ''),
('prsn', 1, 3001, 88854, 3, '', ''),
('prsn', 1, 1011, 1734, 4, '', ''),
('prsn', 1, 1012, 52492, 4, '', ''),
('prsn', 1, 3001, 11553, 3, '', ''),
('prsn', 1, 3001, 96888, 3, '', ''),
('prsn', 1, 3001, 97360, 3, '', ''),
('prsn', 1, 3001, 97364, 3, '', ''),
('prsn', 1, 3001, 97473, 3, '', ''),
('prsn', 1, 3006, 11010, 3, '', ''),
('prsn', 1, 3001, 11010, 3, '', ''),
('prsn', 1, 3006, 4673, 3, '', ''),
('prsn', 1, 3001, 4338, 3, '', ''),
('prsn', 1, 3001, 27061, 3, '', ''),
('prsn', 1, 3006, 100038, 3, '', ''),
('prsn', 1, 3003, 100038, 3, '', ''),
('prsn', 1, 3001, 100038, 3, '', ''),
('prsn', 1, 3006, 12950, 3, '', ''),
('prsn', 1, 3001, 12950, 3, '', ''),
('prsn', 1, 3001, 4172, 3, '', ''),
('prsn', 1, 3001, 71362, 3, '', ''),
('prsn', 1, 3001, 101214, 3, '', ''),
('prsn', 1, 1011, 101374, 4, '', ''),
('prsn', 1, 3001, 4673, 3, '', ''),
('prsn', 1, 3006, 62020, 3, '', ''),
('prsn', 1, 3003, 62020, 3, '', ''),
('prsn', 1, 3001, 62020, 3, '', ''),
('prsn', 1, 3001, 1338, 3, '', ''),
('prsn', 1, 3001, 3296, 3, '', ''),
('prsn', 1, 3006, 3296, 3, '', ''),
('prsn', 1, 3006, 19723, 3, '', ''),
('prsn', 1, 3001, 19723, 3, '', ''),
('prsn', 1, 3006, 128992, 3, '', ''),
('prsn', 1, 3001, 49097, 3, '', ''),
('prsn', 1, 3006, 184868, 3, '', ''),
('prsn', 1, 3006, 107956, 3, '', ''),
('prsn', 1, 3001, 17346, 3, '', ''),
('prsn', 1, 3001, 110523, 3, '', ''),
('prsn', 1, 3001, 32223, 3, '', ''),
('prsn', 1, 33, 2475, 2, '', ''),
('prsn', 1, 3006, 112897, 3, '', ''),
('prsn', 1, 3001, 112897, 3, '', ''),
('prsn', 1, 3006, 46643, 3, '', ''),
('prsn', 1, 3001, 46643, 3, '', ''),
('prsn', 1, 3001, 118319, 3, '', ''),
('prsn', 1, 3001, 118480, 3, '', ''),
('prsn', 1, 3006, 120050, 3, '', ''),
('prsn', 1, 3001, 120050, 3, '', ''),
('prsn', 1, 3001, 118823, 3, '', ''),
('prsn', 1, 3001, 122018, 3, '', ''),
('prsn', 1, 3001, 34905, 3, '', ''),
('prsn', 1, 3001, 34908, 3, '', ''),
('prsn', 1, 3001, 34904, 3, '', ''),
('prsn', 1, 33, 3014, 2, '', ''),
('prsn', 1, 3001, 128992, 3, '', ''),
('prsn', 1, 33, 2474, 2, '', ''),
('prsn', 1, 3001, 117324, 3, '', ''),
('prsn', 1, 33, 1264, 2, '', ''),
('prsn', 1, 33, 110867, 2, '', ''),
('prsn', 1, 32, 110867, 2, '', ''),
('prsn', 1, 3001, 7491, 3, '', ''),
('prsn', 1, 3001, 133075, 3, '', ''),
('prsn', 1, 3001, 133101, 3, '', ''),
('prsn', 1, 33, 70131, 2, '', ''),
('prsn', 1, 3001, 135518, 3, '', ''),
('prsn', 1, 3001, 137668, 3, '', ''),
('prsn', 1, 3001, 137671, 3, '', ''),
('prsn', 1, 3006, 138073, 3, '', ''),
('prsn', 1, 3001, 138073, 3, '', ''),
('prsn', 1, 3001, 86649, 3, '', ''),
('prsn', 1, 3001, 136986, 3, '', ''),
('prsn', 1, 3001, 60298, 3, '', ''),
('prsn', 1, 3001, 41459, 3, '', ''),
('prsn', 1, 3001, 140324, 3, '', ''),
('prsn', 1, 3001, 140526, 3, '', ''),
('prsn', 1, 34, 90512, 2, '', ''),
('prsn', 1, 33, 90512, 2, '', ''),
('prsn', 1, 32, 90512, 2, '', ''),
('prsn', 1, 3001, 145383, 3, '', ''),
('prsn', 1, 3001, 147939, 3, '', ''),
('prsn', 1, 3001, 149324, 3, '', ''),
('prsn', 1, 3006, 148714, 3, '', ''),
('prsn', 1, 3003, 148714, 3, '', ''),
('prsn', 1, 33, 4480, 2, '', ''),
('prsn', 1, 3001, 163898, 3, '', ''),
('prsn', 1, 34, 150746, 2, '', ''),
('prsn', 1, 33, 150746, 2, '', ''),
('prsn', 1, 1011, 20187, 4, '', ''),
('prsn', 1, 3001, 94735, 3, '', ''),
('prsn', 1, 2001, 170413, 1, '', ''),
('prsn', 1, 32, 150746, 2, '', ''),
('prsn', 1, 3001, 184868, 3, '', ''),
('prsn', 1, 3001, 148714, 3, '', ''),
('prsn', 1, 3001, 29862, 3, '', ''),
('prsn', 1, 3001, 86969, 3, '', ''),
('prsn', 1, 3006, 40283, 3, '', ''),
('prsn', 1, 3001, 40283, 3, '', ''),
('prsn', 1, 3001, 120896, 3, '', ''),
('prsn', 1, 3001, 136261, 3, '', ''),
('prsn', 1, 3001, 199694, 3, '', ''),
('prsn', 1, 3001, 195597, 3, '', ''),
('prsn', 1, 3006, 203341, 3, '', ''),
('prsn', 1, 3003, 203341, 3, '', ''),
('prsn', 1, 3001, 203341, 3, '', ''),
('prsn', 1, 32, 10278, 2, '', ''),
('prsn', 1, 32, 25834, 2, '', ''),
('prsn', 1, 3001, 205295, 3, '', ''),
('prsn', 1, 3001, 198689, 3, '', ''),
('prsn', 1, 34, 50811, 2, '', ''),
('prsn', 1, 3001, 210327, 3, '', ''),
('prsn', 1, 34, 163711, 2, '', ''),
('prsn', 1, 34, 220403, 2, '', ''),
('prsn', 1, 4015, 29903, 6, '', ''),
('prsn', 1, 3001, 218605, 3, '', ''),
('prsn', 1, 3006, 217397, 3, '', ''),
('prsn', 1, 3001, 217397, 3, '', ''),
('prsn', 1, 3006, 217398, 3, '', ''),
('prsn', 1, 3001, 217398, 3, '', ''),
('prsn', 1, 4017, 213243, 6, '', ''),
('prsn', 1, 33, 163711, 2, '', ''),
('prsn', 1, 33, 220403, 2, '', ''),
('prsn', 1, 32, 220403, 2, '', ''),
('prsn', 1, 3001, 220791, 3, '', ''),
('prsn', 1, 3001, 220801, 3, '', ''),
('prsn', 1, 3001, 4942, 3, '', ''),
('prsn', 1, 32, 68284, 2, '', ''),
('prsn', 1, 3006, 229986, 3, '', ''),
('prsn', 1, 3001, 229986, 3, '', ''),
('prsn', 1, 3001, 231254, 3, '', ''),
('prsn', 1, 3001, 231259, 3, '', ''),
('prsn', 1, 3001, 231260, 3, '', ''),
('prsn', 1, 3006, 245171, 3, '', ''),
('prsn', 1, 3001, 254813, 3, '', ''),
('prsn', 1, 1011, 223892, 4, '', ''),
('prsn', 1, 3001, 258192, 3, '', ''),
('prsn', 1, 3001, 256431, 3, '', ''),
('prsn', 1, 3001, 256891, 3, '', ''),
('prsn', 1, 3006, 256891, 3, '', ''),
('prsn', 1, 3001, 261787, 3, '', ''),
('prsn', 1, 3001, 270063, 3, '', ''),
('prsn', 1, 3006, 270698, 3, '', ''),
('prsn', 1, 3001, 270069, 3, '', ''),
('prsn', 1, 3001, 177979, 3, '', ''),
('prsn', 1, 3001, 276174, 3, '', ''),
('prsn', 1, 3001, 188212, 3, '', ''),
('prsn', 1, 3001, 188214, 3, '', ''),
('prsn', 1, 3001, 188213, 3, '', ''),
('prsn', 1, 3001, 3713, 3, '', ''),
('prsn', 1, 3006, 283497, 3, '', ''),
('prsn', 1, 3001, 283497, 3, '', ''),
('prsn', 1, 3006, 283498, 3, '', ''),
('prsn', 1, 3001, 283498, 3, '', ''),
('prsn', 1, 3006, 283880, 3, '', ''),
('prsn', 1, 1011, 8374, 4, '', ''),
('prsn', 1, 34, 68284, 2, '', ''),
('prsn', 1, 3001, 283880, 3, '', ''),
('prsn', 1, 34, 170689, 2, '', ''),
('prsn', 1, 33, 170689, 2, '', ''),
('prsn', 1, 3001, 287154, 3, '', ''),
('prsn', 1, 33, 50811, 2, '', ''),
('prsn', 1, 3001, 3835, 3, '', ''),
('prsn', 1, 3001, 291304, 3, '', ''),
('prsn', 1, 33, 260772, 2, '', ''),
('prsn', 1, 3001, 292508, 3, '', ''),
('prsn', 1, 3006, 292796, 3, '', ''),
('prsn', 1, 3003, 292796, 3, '', ''),
('prsn', 1, 3001, 297283, 3, '', ''),
('prsn', 1, 3001, 296155, 3, '', ''),
('prsn', 1, 3001, 298390, 3, '', ''),
('prsn', 1, 3001, 298402, 3, '', ''),
('prsn', 1, 32, 50811, 2, '', ''),
('prsn', 1, 3001, 299961, 3, '', ''),
('prsn', 1, 33, 290630, 2, '', ''),
('prsn', 1, 3001, 302744, 3, '', ''),
('prsn', 1, 3001, 302746, 3, '', ''),
('prsn', 1, 33, 2586, 2, '', ''),
('prsn', 1, 3001, 309214, 3, '', ''),
('prsn', 1, 3001, 309215, 3, '', ''),
('prsn', 1, 33, 301477, 2, '', ''),
('prsn', 1, 3006, 315186, 3, '', ''),
('prsn', 1, 3001, 315186, 3, '', ''),
('prsn', 1, 33, 299372, 2, '', ''),
('prsn', 1, 3001, 317310, 3, '', ''),
('prsn', 1, 3001, 176095, 3, '', ''),
('prsn', 1, 3001, 176096, 3, '', ''),
('prsn', 1, 3001, 49279, 3, '', ''),
('prsn', 1, 3001, 62155, 3, '', ''),
('prsn', 1, 3001, 11007, 3, '', ''),
('prsn', 1, 3001, 324921, 3, '', ''),
('prsn', 1, 33, 325836, 2, '', ''),
('prsn', 1, 3001, 323043, 3, '', ''),
('prsn', 1, 3001, 332689, 3, '', ''),
('prsn', 1, 3001, 333650, 3, '', ''),
('prsn', 1, 3001, 292796, 3, '', ''),
('prsn', 1, 33, 2128, 2, '', ''),
('prsn', 1, 3001, 336829, 3, '', ''),
('prsn', 1, 3001, 336836, 3, '', ''),
('prsn', 1, 1011, 34292, 4, '', ''),
('prsn', 1, 33, 308558, 2, '', ''),
('prsn', 1, 3001, 350276, 3, '', ''),
('prsn', 1, 3001, 351818, 3, '', ''),
('prsn', 1, 3001, 345939, 3, '', ''),
('prsn', 1, 3006, 345939, 3, '', ''),
('prsn', 1, 3001, 353887, 3, '', ''),
('prsn', 1, 3001, 354496, 3, '', ''),
('prsn', 1, 3001, 357975, 3, '', ''),
('prsn', 2, 3, 8379, 2, '', ''),
('prsn', 2, 3, 10407, 2, '', ''),
('prsn', 2, 2001, 25259, 1, '', ''),
('prsn', 2, 3, 4, 2, '', ''),
('prsn', 2, 3, 5, 2, '', ''),
('prsn', 2, 3, 98936, 2, '', ''),
('prsn', 2, 3, 53927, 2, '', ''),
('prsn', 2, 3, 37291, 2, '', ''),
('prsn', 2, 10, 2733, 2, '', ''),
('prsn', 2, 3, 53937, 2, '', ''),
('prsn', 2, 3, 37389, 2, '', ''),
('prsn', 2, 3, 81580, 2, '', ''),
('prsn', 2, 3, 24158, 2, '', ''),
('prsn', 2, 3, 53940, 2, '', ''),
('prsn', 2, 3, 10391, 2, '', ''),
('prsn', 2, 3, 53196, 2, '', ''),
('prsn', 2, 3, 24058, 2, '', ''),
('prsn', 2, 3, 18508, 2, '', ''),
('prsn', 2, 3, 73436, 2, '', ''),
('prsn', 2, 3, 36588, 2, '', ''),
('prsn', 2, 3, 3421, 2, '', ''),
('prsn', 2, 3, 9588, 2, '', ''),
('prsn', 2, 3006, 82575, 3, '', ''),
('prsn', 2, 3, 81201, 2, '', ''),
('prsn', 2, 3, 804, 2, '', ''),
('prsn', 2, 3, 8356, 2, '', ''),
('prsn', 2, 3, 25399, 2, '', ''),
('prsn', 2, 3, 28632, 2, '', ''),
('prsn', 2, 10, 28632, 2, '', ''),
('prsn', 2, 10, 2732, 2, '', ''),
('prsn', 2, 3, 26463, 2, '', ''),
('prsn', 2, 3, 2733, 2, '', ''),
('prsn', 2, 3, 195909, 2, '', ''),
('prsn', 2, 3, 4213, 2, '', ''),
('prsn', 2, 3, 5430, 2, '', ''),
('prsn', 2, 3, 53925, 2, '', ''),
('prsn', 2, 3, 4653, 2, '', ''),
('prsn', 2, 3, 2907, 2, '', ''),
('prsn', 2, 3, 4634, 2, '', ''),
('prsn', 2, 3, 1860, 2, '', ''),
('prsn', 2, 3, 30491, 2, '', ''),
('prsn', 2, 3, 2784, 2, '', ''),
('prsn', 2, 3, 37390, 2, '', ''),
('prsn', 2, 3, 9622, 2, '', ''),
('prsn', 3, 6, 10934, 2, '', ''),
('prsn', 3, 3008, 11910, 3, '', ''),
('prsn', 3, 3003, 17310, 3, '', ''),
('prsn', 3, 3008, 193507, 3, '', ''),
('prsn', 3, 6, 10411, 2, '', ''),
('prsn', 3, 3001, 85231, 3, '', ''),
('prsn', 3, 3003, 85230, 3, '', ''),
('prsn', 3, 3003, 85229, 3, '', ''),
('prsn', 3, 3003, 85228, 3, '', ''),
('prsn', 3, 6, 28238, 2, '', ''),
('prsn', 3, 3008, 54742, 3, '', ''),
('prsn', 3, 3008, 56333, 3, '', ''),
('prsn', 3, 3003, 56333, 3, '', ''),
('prsn', 3, 3003, 40654, 3, '', ''),
('prsn', 3, 3003, 40658, 3, '', ''),
('prsn', 3, 3003, 40656, 3, '', ''),
('prsn', 3, 6, 37273, 2, '', ''),
('prsn', 3, 3003, 39226, 3, '', ''),
('prsn', 3, 3003, 39227, 3, '', ''),
('prsn', 3, 6, 37274, 2, '', ''),
('prsn', 3, 3003, 63340, 3, '', ''),
('prsn', 3, 6, 65554, 2, '', ''),
('prsn', 3, 6, 68607, 2, '', ''),
('prsn', 3, 3001, 134529, 3, '', ''),
('prsn', 3, 6, 18617, 2, '', ''),
('prsn', 3, 3008, 73943, 3, '', ''),
('prsn', 3, 3003, 73944, 3, '', ''),
('prsn', 3, 3003, 73943, 3, '', ''),
('prsn', 3, 6, 5694, 2, '', ''),
('prsn', 3, 6, 20431, 2, '', ''),
('prsn', 3, 6, 74662, 2, '', ''),
('prsn', 3, 3003, 76219, 3, '', ''),
('prsn', 3, 3003, 54742, 3, '', ''),
('prsn', 3, 3008, 54743, 3, '', ''),
('prsn', 3, 3003, 54743, 3, '', ''),
('prsn', 3, 3003, 54745, 3, '', ''),
('prsn', 3, 3008, 54745, 3, '', ''),
('prsn', 3, 3003, 78257, 3, '', ''),
('prsn', 3, 3008, 78257, 3, '', ''),
('prsn', 3, 6, 81201, 2, '', ''),
('prsn', 3, 6, 18615, 2, '', ''),
('prsn', 3, 6, 1753, 2, '', ''),
('prsn', 3, 3003, 92737, 3, '', ''),
('prsn', 3, 6, 9588, 2, '', ''),
('prsn', 3, 6, 18616, 2, '', ''),
('prsn', 3, 6, 41879, 2, '', ''),
('prsn', 3, 3003, 107893, 3, '', ''),
('prsn', 3, 3008, 107893, 3, '', ''),
('prsn', 3, 6, 8356, 2, '', ''),
('prsn', 3, 6, 8357, 2, '', ''),
('prsn', 3, 6, 73756, 2, '', ''),
('prsn', 3, 6, 25399, 2, '', ''),
('prsn', 3, 6, 55020, 2, '', ''),
('prsn', 3, 6, 47374, 2, '', ''),
('prsn', 3, 6, 96861, 2, '', ''),
('prsn', 3, 6, 113899, 2, '', ''),
('prsn', 3, 6, 53741, 2, '', ''),
('prsn', 3, 6, 3893, 2, '', ''),
('prsn', 3, 3001, 39228, 3, '', ''),
('prsn', 3, 3001, 26255, 3, '', ''),
('prsn', 3, 3001, 26254, 3, '', ''),
('prsn', 3, 3001, 26253, 3, '', ''),
('prsn', 3, 6, 139478, 2, '', ''),
('prsn', 3, 6, 2169, 2, '', ''),
('prsn', 3, 6, 19393, 2, '', ''),
('prsn', 3, 6, 161675, 2, '', ''),
('prsn', 3, 6, 19392, 2, '', ''),
('prsn', 3, 6, 118236, 2, '', ''),
('prsn', 3, 6, 488, 2, '', ''),
('prsn', 3, 6, 2784, 2, '', ''),
('prsn', 3, 6, 2785, 2, '', ''),
('prsn', 3, 6, 41876, 2, '', ''),
('prsn', 3, 3003, 188775, 3, '', ''),
('prsn', 3, 6, 146737, 2, '', ''),
('prsn', 3, 3003, 193635, 3, '', ''),
('prsn', 3, 3008, 193635, 3, '', ''),
('prsn', 3, 6, 161793, 2, '', ''),
('prsn', 3, 3001, 17124, 3, '', ''),
('prsn', 3, 3003, 17124, 3, '', ''),
('prsn', 3, 6, 8296, 2, '', ''),
('prsn', 3, 3003, 206137, 3, '', ''),
('prsn', 3, 3008, 206137, 3, '', ''),
('prsn', 3, 6, 4016, 2, '', ''),
('prsn', 3, 6, 207961, 2, '', ''),
('prsn', 3, 6, 13971, 2, '', ''),
('prsn', 3, 3003, 211057, 3, '', ''),
('prsn', 3, 3008, 211057, 3, '', ''),
('prsn', 3, 6, 93046, 2, '', ''),
('prsn', 3, 6, 2481, 2, '', ''),
('prsn', 3, 3008, 60049, 3, '', ''),
('prsn', 3, 3008, 41576, 3, '', ''),
('prsn', 3, 6, 8582, 2, '', ''),
('prsn', 3, 6, 49423, 2, '', ''),
('prsn', 3, 3008, 60051, 3, '', ''),
('prsn', 3, 3008, 257947, 3, '', ''),
('prsn', 3, 3008, 257949, 3, '', ''),
('prsn', 3, 3008, 199372, 3, '', ''),
('prsn', 3, 6, 165758, 2, '', ''),
('prsn', 3, 3008, 257942, 3, '', ''),
('prsn', 3, 3003, 267790, 3, '', ''),
('prsn', 3, 3008, 267790, 3, '', ''),
('prsn', 3, 1006, 119463, 4, '', ''),
('prsn', 3, 3003, 269181, 3, '', ''),
('prsn', 3, 3008, 60048, 3, '', ''),
('prsn', 3, 3008, 49164, 3, '', ''),
('prsn', 3, 3008, 257943, 3, '', ''),
('prsn', 3, 3008, 257944, 3, '', ''),
('prsn', 3, 3008, 49163, 3, '', ''),
('prsn', 3, 3008, 278242, 3, '', ''),
('prsn', 3, 3003, 280704, 3, '', ''),
('prsn', 3, 3008, 281113, 3, '', ''),
('prsn', 3, 6, 99245, 2, '', ''),
('prsn', 3, 6, 240499, 2, '', ''),
('prsn', 3, 6, 294286, 2, '', ''),
('prsn', 3, 3003, 295205, 3, '', ''),
('prsn', 3, 3003, 292773, 3, '', ''),
('prsn', 3, 3008, 292773, 3, '', ''),
('prsn', 3, 6, 317746, 2, '', ''),
('prsn', 3, 3008, 75764, 3, '', ''),
('prsn', 3, 3003, 75764, 3, '', ''),
('prsn', 3, 3003, 324754, 3, '', ''),
('prsn', 3, 6, 306193, 2, '', ''),
('prsn', 3, 6, 37300, 2, '', ''),
('prsn', 3, 6, 340164, 2, '', ''),
('prsn', 3, 6, 331164, 2, '', ''),
('prsn', 3, 3003, 352775, 3, '', ''),
('prsn', 3, 6, 332467, 2, '', ''),
('prsn', 4, 20, 2582, 2, '', ''),
('prsn', 4, 15, 4192, 2, '', ''),
('prsn', 4, 20, 271098, 2, '', ''),
('prsn', 4, 20, 7619, 2, '', ''),
('prsn', 4, 20, 56301, 2, '', ''),
('prsn', 4, 20, 3627, 2, '', ''),
('prsn', 4, 20, 24075, 2, '', ''),
('prsn', 4, 20, 3168, 2, '', ''),
('prsn', 4, 20, 9001, 2, '', ''),
('prsn', 4, 20, 369, 2, '', ''),
('prsn', 4, 20, 37184, 2, '', ''),
('prsn', 4, 20, 839, 2, '', ''),
('prsn', 4, 20, 1991, 2, '', ''),
('prsn', 4, 20, 36262, 2, '', ''),
('prsn', 4, 20, 840, 2, '', ''),
('prsn', 4, 15, 49570, 2, '', ''),
('prsn', 4, 15, 74913, 2, '', ''),
('prsn', 4, 8, 74913, 2, '', ''),
('prsn', 4, 15, 2909, 2, '', ''),
('prsn', 4, 20, 38256, 2, '', ''),
('prsn', 4, 20, 1938, 2, '', ''),
('prsn', 4, 20, 63333, 2, '', ''),
('prsn', 4, 20, 3133, 2, '', ''),
('prsn', 4, 15, 4237, 2, '', ''),
('prsn', 4, 20, 29326, 2, '', ''),
('prsn', 4, 20, 2710, 2, '', ''),
('prsn', 4, 20, 82780, 2, '', ''),
('prsn', 4, 20, 237, 2, '', ''),
('prsn', 4, 20, 12189, 2, '', ''),
('prsn', 4, 20, 66449, 2, '', ''),
('prsn', 4, 20, 82490, 2, '', ''),
('prsn', 4, 20, 1933, 2, '', ''),
('prsn', 4, 20, 1905, 2, '', ''),
('prsn', 4, 20, 7345, 2, '', ''),
('prsn', 4, 20, 83295, 2, '', ''),
('prsn', 4, 20, 1625, 2, '', ''),
('prsn', 4, 20, 41876, 2, '', ''),
('prsn', 4, 14, 107543, 2, '', ''),
('prsn', 4, 20, 33068, 2, '', ''),
('prsn', 4, 20, 37386, 2, '', ''),
('prsn', 4, 15, 8356, 2, '', ''),
('prsn', 4, 15, 1933, 2, '', ''),
('prsn', 4, 20, 26800, 2, '', ''),
('prsn', 4, 20, 238, 2, '', ''),
('prsn', 4, 20, 116370, 2, '', ''),
('prsn', 4, 20, 8582, 2, '', ''),
('prsn', 4, 20, 10782, 2, '', ''),
('prsn', 4, 20, 860, 2, '', ''),
('prsn', 4, 20, 4014, 2, '', ''),
('prsn', 4, 8, 1933, 2, '', ''),
('prsn', 4, 20, 822, 2, '', ''),
('prsn', 4, 8, 107543, 2, '', ''),
('prsn', 4, 20, 110658, 2, '', ''),
('prsn', 4, 20, 120191, 2, '', ''),
('prsn', 4, 8, 130058, 2, '', ''),
('prsn', 4, 20, 112770, 2, '', ''),
('prsn', 4, 19, 112770, 2, '', ''),
('prsn', 4, 15, 112770, 2, '', ''),
('prsn', 4, 9, 369, 2, '', ''),
('prsn', 4, 15, 109053, 2, '', ''),
('prsn', 4, 20, 5435, 2, '', ''),
('prsn', 4, 15, 794, 2, '', ''),
('prsn', 4, 20, 168466, 2, '', ''),
('prsn', 4, 20, 5118, 2, '', ''),
('prsn', 4, 20, 511, 2, '', ''),
('prsn', 4, 15, 84801, 2, '', ''),
('prsn', 4, 20, 7206, 2, '', ''),
('prsn', 4, 1013, 1551, 4, '', ''),
('prsn', 4, 1013, 1557, 4, '', ''),
('prsn', 4, 1013, 88868, 4, '', ''),
('prsn', 4, 20, 148036, 2, '', ''),
('prsn', 4, 20, 31428, 2, '', ''),
('prsn', 4, 20, 32492, 2, '', ''),
('prsn', 4, 20, 32493, 2, '', ''),
('prsn', 4, 20, 10412, 2, '', ''),
('prsn', 4, 20, 225801, 2, '', ''),
('prsn', 4, 4, 109053, 2, '', ''),
('prsn', 4, 20, 109053, 2, '', ''),
('prsn', 4, 20, 200704, 2, '', ''),
('prsn', 4, 15, 63750, 2, '', ''),
('prsn', 4, 8, 234028, 2, '', ''),
('prsn', 4, 15, 179798, 2, '', ''),
('prsn', 4, 20, 112497, 2, '', ''),
('prsn', 4, 15, 271098, 2, '', ''),
('prsn', 4, 20, 3135, 2, '', ''),
('prsn', 4, 20, 273485, 2, '', ''),
('prsn', 4, 20, 3134, 2, '', ''),
('prsn', 4, 20, 29883, 2, '', ''),
('prsn', 4, 15, 29883, 2, '', ''),
('prsn', 4, 20, 27206, 2, '', ''),
('prsn', 4, 1031, 88868, 4, '', ''),
('prsn', 5, 17, 74417, 2, '', ''),
('prsn', 5, 17, 8356, 2, '', ''),
('prsn', 5, 17, 2121, 2, '', ''),
('prsn', 5, 17, 317797, 2, '', ''),
('prsn', 6, 5, 5428, 2, '', ''),
('prsn', 6, 5, 90874, 2, '', ''),
('prsn', 6, 5, 10408, 2, '', ''),
('prsn', 6, 4, 43523, 2, '', ''),
('prsn', 6, 4, 5428, 2, '', ''),
('prsn', 6, 5, 26463, 2, '', ''),
('prsn', 6, 5, 47243, 2, '', ''),
('prsn', 6, 5, 9588, 2, '', ''),
('prsn', 6, 4, 119687, 2, '', ''),
('prsn', 6, 4, 165046, 2, '', ''),
('prsn', 6, 4, 8357, 2, '', ''),
('prsn', 6, 4, 82714, 2, '', ''),
('prsn', 6, 4, 10408, 2, '', ''),
('prsn', 6, 4, 154112, 2, '', ''),
('prsn', 6, 4, 44636, 2, '', ''),
('prsn', 6, 3, 8357, 2, '', ''),
('prsn', 6, 2, 8357, 2, '', ''),
('prsn', 6, 2, 91628, 2, '', ''),
('prsn', 6, 4, 2784, 2, '', ''),
('prsn', 6, 2, 82721, 2, '', ''),
('prsn', 6, 2, 72217, 2, '', ''),
('prsn', 6, 5, 9005, 2, '', ''),
('prsn', 6, 4, 9005, 2, '', ''),
('prsn', 6, 4, 10394, 2, '', ''),
('prsn', 6, 2, 44938, 2, '', ''),
('prsn', 6, 4, 10566, 2, '', ''),
('prsn', 6, 5, 1608, 2, '', ''),
('prsn', 6, 2, 8356, 2, '', ''),
('prsn', 6, 2, 1990, 2, '', ''),
('prsn', 6, 5, 9565, 2, '', ''),
('prsn', 6, 4, 9565, 2, '', ''),
('prsn', 6, 5, 1510, 2, '', ''),
('prsn', 6, 4, 221126, 2, '', ''),
('prsn', 6, 4, 227390, 2, '', ''),
('prsn', 6, 4, 185562, 2, '', ''),
('prsn', 6, 4, 125917, 2, '', ''),
('prsn', 6, 4, 1453, 2, '', ''),
('prsn', 6, 2, 294292, 2, '', ''),
('prsn', 6, 4, 262943, 2, '', ''),
('prsn', 6, 4, 227980, 2, '', ''),
('prsn', 6, 5, 10412, 2, '', ''),
('prsn', 6, 4, 10412, 2, '', ''),
('prsn', 6, 4, 1510, 2, '', ''),
('prsn', 6, 4, 147686, 2, '', ''),
('prsn', 6, 4, 260619, 2, '', ''),
('prsn', 6, 4, 174998, 2, '', ''),
('prsn', 6, 4, 297225, 2, '', ''),
('prsn', 6, 4, 312723, 2, '', ''),
('prsn', 6, 4, 323840, 2, '', ''),
('prsn', 6, 4, 260736, 2, '', ''),
('prsn', 6, 4, 320851, 2, '', ''),
('prsn', 6, 4, 85338, 2, '', ''),
('prsn', 6, 4, 202261, 2, '', ''),
('prsn', 7, 20, 843, 2, '', ''),
('prsn', 7, 20, 4163, 2, '', ''),
('prsn', 7, 20, 45213, 2, '', ''),
('prsn', 7, 15, 8357, 2, '', ''),
('prsn', 7, 20, 7206, 2, '', ''),
('prsn', 7, 15, 16841, 2, '', ''),
('prsn', 7, 20, 840, 2, '', ''),
('prsn', 7, 8, 8357, 2, '', ''),
('prsn', 7, 8, 100517, 2, '', ''),
('prsn', 7, 15, 120070, 2, '', ''),
('prsn', 7, 20, 109869, 2, '', ''),
('prsn', 7, 15, 10782, 2, '', ''),
('prsn', 7, 15, 1926, 2, '', ''),
('prsn', 7, 8, 16841, 2, '', ''),
('prsn', 7, 20, 18605, 2, '', ''),
('prsn', 7, 15, 1976, 2, '', ''),
('prsn', 7, 20, 127573, 2, '', ''),
('prsn', 7, 14, 1269, 2, '', ''),
('prsn', 7, 20, 842, 2, '', ''),
('prsn', 7, 20, 844, 2, '', ''),
('prsn', 7, 15, 1314, 2, '', ''),
('prsn', 7, 8, 1314, 2, '', ''),
('prsn', 7, 14, 1314, 2, '', ''),
('prsn', 7, 15, 143558, 2, '', ''),
('prsn', 7, 20, 255547, 2, '', ''),
('prsn', 7, 14, 4020, 2, '', ''),
('prsn', 7, 8, 4020, 2, '', ''),
('prsn', 7, 8, 222810, 2, '', ''),
('prsn', 8, 17, 73439, 2, '', ''),
('prsn', 8, 17, 8357, 2, '', ''),
('prsn', 8, 17, 89723, 2, '', ''),
('prsn', 8, 17, 56726, 2, '', ''),
('prsn', 8, 17, 18048, 2, '', ''),
('prsn', 8, 17, 114807, 2, '', ''),
('prsn', 8, 17, 769, 2, '', ''),
('prsn', 8, 17, 6254, 2, '', ''),
('prsn', 8, 17, 1704, 2, '', ''),
('prsn', 8, 17, 105440, 2, '', ''),
('prsn', 8, 17, 164674, 2, '', ''),
('prsn', 8, 17, 62900, 2, '', ''),
('prsn', 8, 17, 62257, 2, '', ''),
('prsn', 8, 17, 61504, 2, '', ''),
('prsn', 9, 2001, 22273, 1, '', ''),
('prsn', 9, 2001, 22267, 1, '', ''),
('prsn', 9, 2001, 22277, 1, '', ''),
('prsn', 9, 1, 34515, 2, '', ''),
('prsn', 9, 1, 4301, 2, '', ''),
('prsn', 9, 1, 9617, 2, '', ''),
('prsn', 9, 1, 9618, 2, '', ''),
('prsn', 9, 1, 9619, 2, '', ''),
('prsn', 9, 2007, 145991, 1, '', ''),
('prsn', 10, 20, 75623, 2, '', ''),
('prsn', 10, 1008, 1075, 4, '', ''),
('prsn', 10, 20, 9619, 2, '', ''),
('prsn', 10, 20, 31258, 2, '', ''),
('prsn', 10, 20, 36360, 2, '', ''),
('prsn', 10, 20, 4301, 2, '', ''),
('prsn', 10, 20, 37167, 2, '', ''),
('prsn', 10, 20, 37295, 2, '', ''),
('prsn', 10, 15, 67766, 2, '', ''),
('prsn', 10, 20, 19613, 2, '', ''),
('prsn', 10, 20, 32213, 2, '', ''),
('prsn', 10, 20, 3425, 2, '', ''),
('prsn', 10, 15, 37295, 2, '', ''),
('prsn', 10, 15, 78054, 2, '', ''),
('prsn', 10, 20, 73432, 2, '', ''),
('prsn', 10, 8, 78054, 2, '', ''),
('prsn', 10, 20, 74913, 2, '', ''),
('prsn', 10, 8, 37961, 2, '', ''),
('prsn', 10, 18, 34515, 2, '', ''),
('prsn', 10, 15, 67767, 2, '', ''),
('prsn', 10, 8, 67767, 2, '', ''),
('prsn', 10, 4, 81581, 2, '', ''),
('prsn', 10, 5, 81581, 2, '', ''),
('prsn', 10, 15, 81581, 2, '', ''),
('prsn', 10, 20, 67765, 2, '', ''),
('prsn', 10, 20, 37265, 2, '', ''),
('prsn', 10, 2, 56726, 2, '', ''),
('prsn', 10, 4, 10417, 2, '', ''),
('prsn', 10, 4, 10420, 2, '', ''),
('prsn', 10, 4, 56726, 2, '', ''),
('prsn', 10, 5, 56726, 2, '', ''),
('prsn', 10, 15, 53954, 2, '', ''),
('prsn', 10, 15, 67765, 2, '', ''),
('prsn', 10, 5, 31258, 2, '', ''),
('prsn', 10, 2, 79964, 2, '', ''),
('prsn', 10, 4, 78088, 2, '', ''),
('prsn', 10, 2, 78088, 2, '', ''),
('prsn', 10, 20, 29426, 2, '', ''),
('prsn', 10, 20, 3283, 2, '', ''),
('prsn', 10, 5, 37260, 2, '', ''),
('prsn', 10, 10, 14650, 2, '', ''),
('prsn', 10, 4, 37260, 2, '', ''),
('prsn', 10, 20, 67758, 2, '', ''),
('prsn', 10, 5, 21929, 2, '', ''),
('prsn', 10, 4, 14650, 2, '', ''),
('prsn', 10, 3, 14650, 2, '', ''),
('prsn', 10, 4, 8400, 2, '', ''),
('prsn', 10, 20, 79964, 2, '', ''),
('prsn', 10, 4, 21929, 2, '', ''),
('prsn', 10, 2, 14650, 2, '', ''),
('prsn', 10, 1, 14650, 2, '', ''),
('prsn', 10, 5, 4301, 2, '', ''),
('prsn', 10, 4, 4301, 2, '', ''),
('prsn', 10, 2, 4301, 2, '', ''),
('prsn', 10, 5, 9617, 2, '', ''),
('prsn', 10, 4, 9617, 2, '', ''),
('prsn', 10, 2, 9617, 2, '', ''),
('prsn', 10, 5, 9618, 2, '', ''),
('prsn', 10, 4, 9618, 2, '', ''),
('prsn', 10, 2, 9618, 2, '', ''),
('prsn', 10, 20, 9618, 2, '', ''),
('prsn', 10, 5, 9619, 2, '', ''),
('prsn', 10, 4, 9619, 2, '', ''),
('prsn', 10, 2, 9619, 2, '', ''),
('prsn', 10, 74, 14650, 2, '', ''),
('prsn', 10, 4, 191523, 2, '', ''),
('prsn', 10, 4, 31258, 2, '', ''),
('prsn', 10, 3, 31258, 2, '', ''),
('prsn', 10, 3, 21929, 2, '', ''),
('prsn', 10, 2, 21929, 2, '', ''),
('prsn', 10, 2, 31258, 2, '', ''),
('prsn', 10, 5, 19613, 2, '', ''),
('prsn', 10, 15, 202268, 2, '', ''),
('prsn', 10, 20, 298454, 2, '', ''),
('prsn', 10, 20, 210992, 2, '', ''),
('prsn', 10, 1013, 1075, 4, '', ''),
('prsn', 10, 7, 62246, 2, '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 06, 2021 at 02:21 PM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

--
-- Dumping data for table `chii_persons`
--

INSERT INTO `chii_persons` (`prsn_id`, `prsn_name`, `prsn_type`, `prsn_infobox`, `prsn_producer`, `prsn_mangaka`, `prsn_artist`, `prsn_seiyu`, `prsn_writer`, `prsn_illustrator`, `prsn_actor`, `prsn_summary`, `prsn_img`, `prsn_img_anidb`, `prsn_comment`, `prsn_collects`, `prsn_dateline`, `prsn_lastpost`, `prsn_lock`, `prsn_anidb_id`, `prsn_ban`, `prsn_redirect`, `prsn_nsfw`) VALUES
(1, '水樹奈々', 1, '{{Infobox Crt\r\n|简体中文名= 水树奈奈\r\n|别名={\r\n[第二中文名|]\r\n[英文名|]\r\n[日文名|近藤奈々 (こんどう なな)]\r\n[纯假名|みずき なな]\r\n[罗马字|Mizuki Nana]\r\n[昵称|奈々ちゃん、奈々さん、奈々様、お奈々、ヘッド]\r\n[其他名义|]\r\n}\r\n|性别= 女\r\n|生日= 1980年1月21日\r\n|血型= O型\r\n|身高= 153cm\r\n|体重= \r\n|BWH= \r\n|引用来源= zh.moegirl.org.cn\r\n|星座= 水瓶座\r\n|出身地区= 爱媛县 新居滨市\r\n|所属公司= StarCrew(事务所) / KING AMUSEMENT CREATIVE(唱片公司)\r\n|个人状态= 已婚\r\n|官网= https://www.mizukinana.jp\r\n|FanClub= https://fanclub.mizukinana.jp\r\n|Twitter= https://twitter.com/NM_NANAPARTY\r\n}}', 0, 0, 1, 1, 0, 0, 0, '原名 近藤 奈々（こんどう なな），日本女性声优兼歌手。有个妹妹名字是近藤美香，为Daisy×Daisy主唱。\r\n\r\n简介\r\n自小受业余经营歌谣教室的父母影响，希望成为演歌歌手，从5岁起学习唱歌。小学和初中时经常在四国地区的各种歌唱比赛获奖，中一时以本名名义灌录单曲《杜樱》（つがざくら），中三时获“濑户内卡拉OK歌谣赛十周年记念全国大赛”总冠军，获其中一名评判赏识，邀请她初中毕业后往东京发展。高二（1997年）时入读代代木动画学院声优科，一边上学一边接受声优训练，不久她所属的事务所倒闭，几个月后加入由她的歌唱老师所成立的“产光音乐”事务所。其后参演PlayStation游戏NOёL ~La neige~，正式出道。因本名的日语读音跟另一位歌手近藤名奈完全一样，出道时以水树奈奈作为艺名。\r\n高中就读堀越高等学校，跟堂本刚、友坂理惠以及山口纱弥加等同班。毕业后获颁了“堀越赏”，至今只有她和草彅刚以艺能科毕业而获得该奖赏。\r\n水树奈奈原以演歌歌手为目标，自小受父亲训练演歌，高中时就读堀越高等学校中容许较低出席率的艺能科，尽管有所属的经纪公司，却迟迟未有歌手出道机会。\r\n高中1年级时，事务所向水树奈奈提出进行配音工作的建议，于是，接受该建议的水树奈奈在高中二年级开始入读了代代木动画学院声优科，在此接受配音演员的训练。在1997年高三时，终于获得出道机会，获选PS游戏软件‘NOeL 〜La neige〜’的门仓千纱都一角，以艺名水树奈奈完成声优出道。高中毕业后，在吉祥寺的美体沙龙做着一份时薪850日元的兼职工作。\r\n20岁时加盟King Records，2000年12月6日以单曲“想い”歌手出道，至今共推出34张单曲、12张大碟和3张精选集，歌手出道时的销情惨淡，但是之后就稳步上扬，销量不俗，惟近年因为实体唱片市场衰落以及日本个人女歌手热潮退却而出现下跌趋势。直到现时为止，音乐作品总销量约350万，声优唱片总销量排第三。演唱会场场爆满，音乐活动之外，也常接旁白以及配音的工作。\r\n2000年开始每年冬季举行演唱会，至2003年增至每年夏、冬各一次日本巡回演出。2005、06年两度在日本武道馆举行演唱会，是继椎名碧流后第二位踏足这舞台的声优；2007、08年更先后成为首位在横滨体育馆、埼玉超级体育馆及国立代代木竞技场举行个人演唱会的声优。\r\n2004年因配音人气动漫魔法少女奈叶中菲特·泰斯塔罗沙一角并演唱其中多首主题曲而走红，水树奈奈曾于出席发表会时透露配音过最喜欢的动漫角色为菲特·泰斯塔罗沙。\r\n2009年7月5日在西武巨蛋举办了个人（也是声优界）最大场的演唱会，全长4小时半，曲目29首，不但刷新个人纪录，也刷新了声优界的纪录。\r\n2009年12月31日获选第60回NHK红白歌合战，成为NHK红白歌合战史上第一位登上舞台的声优，被称“动画歌曲的女王”。\r\n因唱功获赞赏和唱片销量成绩不俗，2010－14年均被邀请参加第61回－第65回NHK红白歌合战（第61回兼任红白应援队队员）。\r\n2011年12月3日及4日首次登上东京巨蛋，是史上第八位以个人名义登上东京巨蛋、第四位连续两天开唱的日本女性歌手，而且是第一位声优能在东京巨蛋举行演唱会，再次破声优纪录。\r\n2013年7月14日在日本巡回演唱会“NANA MIZUKI LIVE CIRCUS 2013”大阪城音乐厅场次中，宣布将于台湾举办首次海外演唱会。\r\n2013年11月23日及24日，在台湾台北市华山1914创意文化园区台北音乐传记（Legacy Taipei）举办首次海外演唱会“NANA MIZUKI LIVE CIRCUS 2013+”。2013年11月24日，在“NANA MIZUKI LIVE CIRCUS 2013+”宣布，将于2014年再次于台湾举办海外演唱会。\r\n2014年6月，NANA MIZUKI LIVE CIRCUS×CIRCUS＋×WINTER FESTA BD作品首周以1.8万张销售额获得公信榜音乐部门第一名，综合部门第二名且打破纪录以连续9张BD作品蝉联音乐部门榜上第一名。第二名为安室奈美惠（5张）。\r\n2016年4月9、10日第二次在东京巨蛋举行演唱会，成为在东京巨蛋开唱过最多次的日本个人女歌手之一，并且宣布于2016年9月22日于阪神甲子园球场举办个人演唱会。\r\n\r\n演艺经历\r\n1998年在Pioneer LDC（现已改名为日本Geneon环球娱乐）旗下推出一张CD。\r\n1999年10月在网络电台JAM STATION主持自己的节目《NANA CHANNEL》。\r\n2000年1月23日于电台节目制作团队的协助下，举行第一场个人演唱会，被King Records制作人三嶋章夫所赏识，其后正式成为King Records（但不是King Records旗下制作动画、声优音乐为主的STARCHILD）的歌手。\r\n2001年9月受现在经纪人建议，离开她在东京寄宿的歌唱老师住所与其经纪公司，转往Sigma Seven事务所。\r\n2001年曾因《妹妹公主》而与桑谷夏子、小林由美子、望月久代组成声优组合“Prits”，并发行过3张单曲和1张大碟。\r\n同年（2001年）再因动画《七小花》（七人のナナ）而与秋田まどか、浅木舞、中原麻衣、名冢佳织、福井裕佳梨、桃森すもも组成“nana×nana”主唱该动画的主题曲。\r\n2003年7月7日成立官方俱乐部S.C. NANA NET。\r\n2005年1月2日于日本武道馆举行演唱会，是继椎名碧流后的第二位以个人名义在武道馆开演唱会的声优。\r\n2006年1月21日再次踏足日本武道馆，自2000年和2001年以来再次举行生日演唱会，演唱会当天更自弹自唱“宝物”。\r\n2006年10月29日日本电视台TBS Channel播放特别制作的水树奈奈特集，片长约90分钟，节目中有独家访问、2006年夏季演唱会精选片段和本人亲自下厨等珍贵镜头。\r\n2007年2月12日在横滨体育馆举行个人史上最长最大的演唱会，成为首位以个人名义使用这场地的声优。\r\n2007年3月3日第一届“声优Awards”获歌唱赏。\r\n2009年2月5日首度亮相全国广播的NHK电视音乐节目MUSIC JAPAN，并于同年4月开始担任节目旁白。\r\n2009年7月5日举办个人首场巨蛋演唱会，现场人数涌进3万人，为2009年唯一使用巨蛋级场地举办演唱会的女性歌手。\r\n2009年12月31日初次参与NHK红白歌合战。\r\n2010年3月6日第四届“声优Awards”获富山敬赏。\r\n2010年12月31日第二次参与NHK红白歌合战。\r\n2011年2月6日荣获“Billboard JAPAN MUSIC AWARDS 2010年年度优秀歌手赏”。\r\n2011年3月27日参与niconico为2011年日本本州岛海域地震举行的赈灾款募金义演，总金额达315万1800円。\r\n2011年12月3日及4日举办个人首场东京巨蛋演唱会，为史上第八位日本女歌手以个人名义登上东京巨蛋，累计现场人数为8万人。这场演唱会还创下“东京巨蛋史上的第一场全天域星象投影表演”的纪录。\r\n2011年12月31日第三次参与NHK红白歌合战。\r\n2012年3月3日荣获“Billboard JAPAN MUSIC AWARDS”年度最佳动画歌手。并在2012年度蝉联该奖项。\r\n2012年12月31日连续第四年参与NHK红白歌合战。\r\n2013年5月15日发表第一首合唱单曲“Preserved Roses”（合唱者为T.M.Revolution）。\r\n2013年11月10日参与于新加坡举行的Anime Festival Asia 2013: Valvrave Night演出，乃首个于国外进行的公开活动。\r\n2013年11月23日及24日举行第一场海外演唱会“NANA MIZUKI LIVE CIRCUS 2013+”，地点为台湾Legacy Taipei，其中24日场次于日本、台湾、新加坡、香港、泰国、印尼等65间戏院进行直播。\r\n2013年12月31日连续第五年参与NHK红白歌合战。\r\n2014年3月13日于文部科学省文化厅举办的“2013年度（第64届）艺术选奖”中获得大众艺能部门的新人赏。\r\n2014年6月1日 在演唱会上宣布追加海外公演，在新加坡及台湾举行，新加坡场于9月27日在“RESORTS WORLD THEATRE”演出，台湾场则于10月4、5两日在台北市立大学天母校区体育馆举行。\r\n2014年12月31日连续第六年参与NHK红白歌合战。\r\n2015年7月24日首度在MUSIC STATION中演出，是继椎名碧流后的第二位在该节目中演出的声优。\r\n2016年4月9日及10日再度于东京巨蛋举行演唱会，成为东京巨蛋中演唱会举行次数最多的日本个人女性歌手之一（另一个为安室奈美惠）。\r\n2016年9月22日首度于阪神甲子园球场举行演唱会，成为首位在阪神甲子园球场举行演唱会的个人歌手。\r\n2017年7、8月于帝国剧场参与以卡洛尔·金为题材的音乐剧，并与平原绫香担任双主演。\r\n\r\n个人生活\r\n水树奈奈的父亲为近藤信光，母亲为近藤训子 。名字的由来是因为父亲是演员冈田奈奈的粉丝，因为避免本名“近藤奈奈”与歌手近藤名奈出现混淆，所以决定使用“水树奈奈”作为艺名。\r\n她的妹妹近藤美香为Daisy×Daisy主唱，艺名为Mika。\r\n家庭环境并不富裕，所以学生时代是学校里少数几乎全勤的学生，并为领奖学金以贴补家用而十分用功，经常学年第一。2008年10月29日，水树奈奈的父亲去世 。\r\n持有书友会毛笔部七段、珠算三级、心算二级、自动档汽车驾驶执照等资格。\r\n与同事务所所属，在电台节目“スマイルギャング”中共演的声优福圆美里交情深厚，每年在彼此生日临近的时候都会互相交换生日礼物。因演出“放浪男孩”而与同事务所所属声优濑户麻沙美关系亲密，经常一起吃饭，将瀬戸视作自己妹妹般。2004年于因为演出魔法少女奈叶而和声优田村由香里关系亲密。与能登麻美子和泽城美雪一起去旅行后，交情加深。\r\n2020年7月6日，与作为音乐界从业者的丈夫登记结婚。11月6号，通过官网宣布怀孕，目前已经进入安定期，将暂时工作一段时间。\r\n水树的父亲持有硬式棒球的裁判执照，水树则是个颇热情的阪神虎爱好者。最初比较喜欢高校棒球，受喜欢读卖巨人的父亲影响而成为了巨人的球迷。1996年，当清原和博（已在2008年球季结束后退休）由Free Agent转至巨人时，开始觉得巨人不好，而转而喜欢阪神虎直至现在。特别尊敬星野仙一。\r\n水树为第11张专辑SMASHING ANTHEMS拍专辑照时，到过阪神虎的主场阪神甲子园球场取景。在阪神甲子园球场举行演唱会为水树的其中一个梦想，场方则以保护天然草皮为理由，每年只批准一组歌唱单位举行演唱会。每年在甲子园球场举行演唱会的TUBE宣布2016年不会在此场举行演唱会，结果水树得到这个机会。\r\n\r\n其他\r\n2006年，井上喜久子曾经希望水树能够加入17岁教。\r\n2008年6月19日，21岁的送报员堀大树用手机在2ch的声优板块预告中模仿加藤智大，发出拟于7月5日-6日在代代木体育馆举行的LIVE FIGHTER 2008 BLUE SIDE/RED SIDE中，杀害水树奈奈的犯罪预告，后嫌疑人被警方监控、逮捕。\r\n2008年10月29日晚间8时40分，水树之父近藤信光因多器官衰竭去世，卒年75岁。\r\n2009年11月21日于东京国际展示场举行的俱乐部活动中挑战吉尼斯世界纪录，原本要挑战三个项目，有两个项目挑战成功，分别是7014人全场手牵手形成最长人浪，以及动员6961人创下最多人于同一时间一起吹party blowers，其后由吉尼斯世界纪录职员即场颁发证书。\r\n至于无法挑战成功的项目，就是于室内发出最大音量的人声，现时纪录由香港饶舌团体农夫举行的演唱会保持。\r\n2009年12月13日，终于与一直想见面的同乡（爱媛县出身）・演员真锅香织在剧场版动画“雷顿教授与永远的歌姬”的首映会上见面。\r\n2010年2月20日，被任命为新居浜观光大使。\r\n2010年10月，台湾金牌大风取得代理并发售IMPACT EXCITER台压盘，是水树的第一张海外盘。\r\n2011年1月21日，于生日当天发售个人第一本自传“深爱”。\r\n2012年2月，中国大陆星外星唱片取得代理并发售IMPACT EXCITER引进版，是水树正式在大陆发行的首张个人专辑。\r\n2012年5月，台湾金牌大风取得代理并发售NANA MIZUKI LIVE CASTLE×JOURNEY台压盘，是第一张水树的演唱会海外盘。\r\n2012年4月17日，再次被任命为伊予观光大使。\r\n2012年6月10日播出的新堂本兄弟中与高中同学堂本刚实现了久隔14年见面的会谈，称水树为近藤さん，并在业界传开来。\r\n2012年12月5日，在富士电视台的FNS歌谣祭中水树与堂本刚所在的团队KinKi Kids坐在同一个圆桌时，并从刚君处听说他在他的演唱会上提到了水树。\r\n2014年1月16日，发售文库版本之自传。\r\n2014年6月10日，25岁男子福元一辉为了抽奖在演唱会与水树见面而购买1000包卡乐B薯片，将每包薯片上的抽奖券取去后丢弃在树林中，因违反《废弃物处理法》而被警方逮捕。\r\n2014年6月22日，由于水树的声带发炎导致失声，为日后着想需要休息一段时间，原定于当日以及6月28日和29日举行的巡回公演被迫取消。\r\n\r\nYouTube频道：\r\nhttps://www.youtube.com/user/mizukinanaKING', 'a6/e8/1_prsn_ZdFfp.jpg?r=1597241889', '', 110, 841, 0, 1615897947, 0, 0, 0, 0, 0),
(2, '遠藤明範', 1, '{{Infobox Crt\r\n|简体中文名= 远藤明范\r\n|别名={\r\n[遠藤明吾]\r\n[第二中文名|远藤明吾]\r\n[英文名|]\r\n[日文名|遠藤明範]\r\n[纯假名|えんどう あきのり]\r\n[罗马字|Endou Akinori]\r\n[昵称|]\r\n}\r\n|性别= 男\r\n|生日= 1959年\r\n|血型= \r\n|身高= \r\n|体重= \r\n|BWH= \r\n|引用来源={\r\n}\r\n}}', 1, 0, 0, 0, 0, 0, 0, '日本の脚本家、作家。神奈川県出身。同志社大学文学部心理学科卒業。旧ペンネームは遠藤明吾。\r\n『機動戦士Ζガンダム』や『ミスター味っ子』のTVシリーズや、『銀河英雄伝説』や『創竜伝』のOVA作品、『ファイブスター物語』や『はじまりの冒険者たち レジェンド・オブ・クリスタニア』等の劇場版アニメといったアニメーション作品の脚本や原案を手がける。また『3×3 EYES』や『電脳都市OEDO808』、『攻殻機動隊』のノベライズや『成層圏ファイター』シリーズや『シャドーハンター』シリーズといったオリジナル作品も執筆している。近年は漫画原作も手がけている。', '', '', 3, 5, 0, 1598682100, 0, 656, 0, 0, 0),
(3, '和田薫', 1, '{{Infobox Crt\r\n|简体中文名= 和田薰\r\n|别名={\r\n[第二中文名|]\r\n[英文名|]\r\n[日文名|和田薫]\r\n[纯假名|わだ かおる]\r\n[罗马字|Wada Kaoru]\r\n[昵称|]\r\n}\r\n|性别= 男\r\n|生日= 1962-05-05\r\n|血型= \r\n|身高= \r\n|体重= \r\n|BWH= \r\n|引用来源={\r\n}\r\n}}', 1, 0, 1, 0, 0, 0, 0, '日本作曲家。于1962年5月5日出生于山口县下关市。17岁开始自己独自学习作曲技法与和声学。1981年，于山口县立豊浦高中毕业以后，进入东京音乐大学作曲系学习，并师从伊福部昭、池野成、有马礼子等作曲家，同时师从汐泽安彦学习指挥。在学期间即获得海上自卫队东京音乐队创立30周年、日本交响乐振兴财团作曲赏入选。1985年取得学士学位以后，于同一所大学攻读研究生学位。1986年，他旅居欧洲，并通过当地的许多现代音乐发表自己的作品，还以此结识了许多作曲家和演奏家。同年，他的作品《三断章，为管弦乐团而作》由北荷兰爱乐乐团首演，获得了极大的成功。\r\n1988年回到日本后开始担当各种动画、电影、舞台剧及广播剧音乐的作曲工作。同时，他也相继发表了许多严肃音乐与日本民族音乐作品，并与许多日本的名演奏家合作。他曾受太鼓演奏家林英哲的委托写过太鼓协奏曲，也曾受津轻三味线演奏家木乃下真市的委托写过三味线协奏曲，还为日本音乐集团写过日本民族乐团的作品。除此之外，在2007年3月4日举办的伊福部昭纪念音乐会中，和田薰担任了实行委员会的实行委员。\r\n除了音乐之外，他也担任了几个与自己的故乡山口县相关的职位：他于2009年担当了山口县观光大使的职位，并于2012年担当了为庆祝宫本武藏与佐佐木小次郎开战四百周年所设的岩流岛观光大使的职位。\r\n他的作品在华人圈内亦很有名。他所担当配乐的多部动画都在中国大陆、香港、澳门与台湾有着很大的名气。2004年，他还与台湾朱宗庆打击乐团合作，演出《五鼓声响》。2006年再度与朱宗庆打击乐团合作，重新编写《犬夜叉》电影配乐，由朱宗庆打击乐团于冬季巡演时演奏。\r\n和田薰的妻子为声优中川亚纪子。\r\n\r\n因为和田薰对日本传统音乐喜爱的缘故，他的作品中随处可见日本传统音乐的特征。他的管弦乐大多数拥有极为重厚的织体，并且规模庞大，节奏色彩强，并善于运用大量的打击乐器，这点在他的早期管弦乐作品诸如《民舞组曲》中便早已显露了出来。他还擅长运用各种西洋乐器来模仿日本传统乐器的音响。他还喜欢在他的剧伴音乐中使用日本乐器，例如在他担当的鬼太郎与学校的怪谈的配乐，他利用日本传统乐器来模仿妖怪的世界。', 'ec/cb/3_prsn_anidb.jpg', 'http://img7.anidb.net/pics/anime/22678.jpg', 7, 68, 0, 1617160576, 0, 2703, 0, 0, 0),
(4, '新井浩一', 1, '{{Infobox Crt\r\n|简体中文名= 新井浩一\r\n|别名={\r\n[第二中文名|]\r\n[英文名|]\r\n[日文名|]\r\n[纯假名|あらい こういち]\r\n[罗马字|Arai Kouichi]\r\n[昵称|]\r\n}\r\n|性别= 男\r\n|生日= 1961年\r\n|血型= \r\n|身高= \r\n|体重= \r\n|BWH= \r\n|引用来源={\r\n}\r\n}}', 1, 0, 0, 0, 0, 0, 0, '東映動画出身。現在はフリー。\r\nキネマシトラスを小笠原宗紀氏、松家雄一郎氏、橘正紀氏と共に設立。\r\n\r\n作画監督を務めた『Cryingフリーマン2』では、当時ステレオタイプに表現されがちであった人体をリアルにとらえ直し、\r\nシーンごとに影を演出レベルで操作する等各表現に新たな可能性を開いた。\r\n\r\nキャラクターデザインに対する問題意識の表れなのか、OVA初作画監督作品（おそらく）である『XANADUドラゴンスレイヤー伝説』においても、\r\nそのキャラクターデザインは原作と大変かけ離れたものになっている。\r\n『フリーマン』や『青の6号』等ではオリジナルキャラクターに随分合わせてデザインを起こしているようだが、\r\n業界内で大変高い評価を得た『3×3EYES』シリーズのキャラクターデザインは、原作からかけ離れたデザインであったため\r\n原作ファンから酷評を受ける事となった。\r\n\r\n背景設定オブジェクト等を自ら3Dにてモデリングし、セルシェードにてレンダリングした物をレイアウト用紙にプリントする事によってレイアウトを作成したり、\r\n作画用件（主にメカ関係？）を3Dにて作成、原画作業時のガイドとして使用するなどデジタルや3Dにも関心が高いようである。\r\n（『青の6号』や『FREEDOM』等の作品参加はその表れか？）\r\n元々、一部で鉄筋系などと揶揄（？）される位、立体を強く意識した作画をしていたため、3Dに関心を持ったのは自然な流れなのかも知れない。\r\nちなみに漫画家・志村貴子のファンらしく、一時期使用していたペンネームも志村作品の登場キャラ名と同一である。\r\n志村作品には放浪息子の原画で参加を果たした。\r\n\r\n三原三千夫曰く、影を立体的につける先駆けになった人。\r\n3K打ちでパカスカ動かすのが特徴。\r\n過去には平野俊弘作品に数多く参加していた。\r\n絵コンテのアングルを無理矢理変えて女性キャラクターの尻を描くという一面も。', '', '', 2, 52, 0, 1588363436, 0, 5437, 0, 0, 0),
(5, '広川二三男', 1, '{{Infobox Crt\r\n|简体中文名= 广川二三男\r\n|别名={\r\n[第二中文名|]\r\n[英文名|]\r\n[日文名|広川二三男]\r\n[纯假名|]\r\n[罗马字|Hirokawa Fumio]\r\n[昵称|]\r\n}\r\n|性别= 男\r\n|生日= \r\n|血型= \r\n|身高= \r\n|体重= \r\n|BWH= \r\n|引用来源={\r\n}\r\n}}', 1, 0, 0, 0, 0, 0, 0, '', '', '', 0, 2, 0, 0, 0, 6521, 0, 0, 0),
(6, '竹之内和久', 1, '{{Infobox Crt\r\n|简体中文名= 竹之内和久\r\n|别名={\r\n[竹ノ内和久 ]\r\n[竹之内和之]\r\n[第二中文名|]\r\n[英文名|]\r\n[日文名|]\r\n[纯假名|たけのうち　かずひさ]\r\n[罗马字|Takenouchi Kazuhisa]\r\n[昵称|]\r\n}\r\n|性别= 男\r\n|生日= \r\n|血型= \r\n|身高= \r\n|体重= \r\n|BWH= \r\n|引用来源={\r\n}\r\n}}', 1, 0, 0, 0, 0, 0, 0, '', '', '', 1, 2, 0, 1580983803, 0, 6049, 1, 0, 0),
(7, '熊谷哲矢', 1, '{{Infobox Crt\r\n|简体中文名= 熊谷哲矢\r\n|别名={\r\n[第二中文名|熊谷哲也]\r\n[英文名|]\r\n[日文名|熊谷哲矢]\r\n[纯假名|]\r\n[罗马字|Kumagai Tetsuya]\r\n[昵称|]\r\n}\r\n|性别= 男\r\n|生日= \r\n|血型= \r\n|身高= \r\n|体重= \r\n|BWH= \r\n|引用来源={\r\n}\r\n|妻= 佐山聖子\r\n}}', 1, 0, 0, 0, 0, 0, 0, '岩手県出身、妻は演出家の佐山聖子。\r\nスタジオジュニオ、ハルフィルムメーカーを経て現在はフリー。\r\n「熊谷哲也」名義は、近年の作品のものは別人の名前の誤植による可能性もあるので編集の際は注意。', '', '', 1, 4, 0, 1595403223, 0, 4536, 0, 0, 0),
(8, '渡辺英俊', 1, '{{Infobox Crt\r\n|简体中文名= 渡边英俊\r\n|别名={\r\n[渡邊英俊]\r\n[第二中文名|]\r\n[英文名|]\r\n[日文名|渡辺英俊]\r\n[纯假名|]\r\n[罗马字|Watanabe Hidetoshi]\r\n[昵称|]\r\n}\r\n|性别= 男\r\n|生日= \r\n|血型= \r\n|身高= \r\n|体重= \r\n|BWH= \r\n|引用来源={\r\n}\r\n}}', 1, 0, 0, 0, 0, 0, 0, '', '', '', 1, 2, 0, 1599235600, 0, 6731, 0, 0, 0),
(9, '森岡浩之', 1, '{{Infobox Crt\r\n|简体中文名= 森冈浩之\r\n|别名={\r\n[第二中文名|]\r\n[英文名|]\r\n[日文名|]\r\n[纯假名|もりおか ひろゆき]\r\n[罗马字|Morioka Hiroyuki]\r\n[昵称|]\r\n}\r\n|性别= 男\r\n|生日= 1962-03-02\r\n|血型= \r\n|身高= \r\n|体重= \r\n|BWH= \r\n|引用来源={\r\n}\r\n}}', 1, 0, 0, 0, 1, 0, 0, '日本科幻小说作家。出生于兵库县。毕业于京都府立大学文学部。\r\n在渡过一段上班族生活后，森冈浩之于1992年发表首篇作品《触及梦中树》（暂译）。1996年发表《星界的纹章》，并于1997年以本作获得星云奖；本篇《星界的纹章》、续篇《星界的战旗》及外传《星界的断章》均已改编成动画。\r\n本尊出演过电影《立食师列传》。2011年因心肌梗塞入院，2013年发布《星界战旗》第5卷，再次开始作家生活。从2014年起，担当日本SF作家俱乐部事务局长。\r\n\r\n早期作品以所谓的硬科幻HSF居多，之后以《星界》系列为代表的硬派SF中加入了大量轻小说元素。值得一提的是其人对语言有强烈的个性追求。大学时专业是国语语法，毕业论文是《不断发展的语法・日语语态的几何学角度解释初论》。出道作品《若能触及梦中树》中创造了只存在名词的人造语言，在《ZOOK》中描写过只有一个普通名词的语言，在《星界》系列中完成了有完整体系的人造语言亚维语（Baronh）。', '45/c4/9_prsn_anidb.jpg?r=1583123180', 'http://img7.anidb.net/pics/anime/38946.jpg', 3, 10, 0, 1393721766, 1, 4495, 0, 0, 0),
(10, '長岡康史', 1, '{{Infobox Crt\r\n|简体中文名= 长冈康史\r\n|别名={\r\n[第二中文名|]\r\n[英文名|]\r\n[日文名|長岡康史]\r\n[纯假名|ながおか やすちか]\r\n[罗马字|Nagaoka Yasuchika]\r\n[昵称|]\r\n}\r\n|性别= 男\r\n|生日= 1959年\r\n|血型= \r\n|身高= \r\n|体重= \r\n|BWH= \r\n|引用来源={\r\n}\r\n}}', 1, 0, 0, 0, 0, 0, 0, '日本のアニメーター、アニメ演出家、監督。元・スタジオエックス所属。北海道出身。\r\n\r\n『ドラえもん』（大山のぶ代時代初期）で動画デビュー。その後は原画、作画監督、キャラクターデザイン、演出、監督と様々な役職を経て、2011年現在は演出が主となっている。', 'd3/d9/10_prsn_anidb.jpg', 'http://img7.anidb.net/pics/anime/26474.jpg', 1, 35, 0, 1424944831, 0, 4234, 0, 2, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 192.168.201.71    Database: bangumi
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.16.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `chii_persons`
--
-- WHERE:  prsn_ban != 0 ORDER BY prsn_id LIMIT 3

LOCK TABLES `chii_persons` WRITE;
/*!40000 ALTER TABLE `chii_persons` DISABLE KEYS */;
REPLACE INTO `chii_persons` VALUES (153,'葉月九ロウ',1,'{{Infobox Crt\n|性别= 男\n|别名={\n[纯假名|はづき きゅうろう]\n[罗马字|Hazuki Kyuurou]\n[日文名|葉月九ロウ]\n}\n}}',1,0,0,0,0,0,0,'','b3/e3/153_prsn_anidb.jpg','http://img7.anidb.net/pics/anime/18265.jpg',0,0,0,0,0,7507,1,529,0),(330,'桜庭統',1,'{{Infobox Crt\n|生日= 1965-08-05\n|性别= 男\n|别名={\n[罗马字|Sakuraba Motoi]\n[日文名|桜庭統]\n}\n}}',1,0,0,0,0,0,0,'','fe/73/330_prsn_anidb.jpg','http://img7.anidb.net/pics/anime/31244.jpg',0,0,0,0,0,6647,1,6989,0),(341,'SPE・ビジュアルワークス',2,'{{Infobox Crt\n|别名={\n[日文名|SPE・ビジュアルワークス]\n[罗马字|SPE Visual Works]\n}\n}}',1,0,0,0,0,0,0,'','','',1,1,0,1582048896,0,842,1,645,0);
/*!40000 ALTER TABLE `chii_persons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-16  9:19:20
-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 192.168.201.71    Database: bangumi
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.16.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Dumping data for table `chii_characters`
--
-- WHERE:  crt_ban != 0 ORDER BY crt_id LIMIT 3

LOCK TABLES `chii_characters` WRITE;
/*!40000 ALTER TABLE `chii_characters`
    DISABLE KEYS */;
REPLACE INTO `chii_characters`
VALUES (55, '国崎往人', 1, '{{Infobox Crt\n|简体中文名=国崎往人\n|声优=\n|性别=男\n|生日=\n|血型=\n|身高=\n|体重=\n|BWH=\n}}',
        'くにさき ゆきと：\r\n男主角（游戏中可以更改名字），背负著传承了近1000年的使命：寻找并解救“天空中的女孩”。他从母亲身上学到操纵玩偶的特殊能力，以表演玩偶为生，四处旅行。在一个海边小镇上认识了神尾观铃并且暂时寄宿在她家。喜欢吃的食物是拉面套餐。最终献出自身以完成拯救神奈灵魂的使命。',
        'bd/ba/55_crt_8e8o4.jpg', 0, 1, 0, 0, 0, '', 0, 1, 52, 0),
       (82, 'つんく♂，', 1, '{{Infobox Crt\n|简体中文名=淳君\n|声优=\n|性别=男\n|生日=\n|血型=\n|身高=\n|体重=\n|BWH=\n}}',
        'Hello! Project的全权制作人。本名寺田光男 (てらだみつお)。原本是80年代末90年代初著名摇滚乐队シャ乱Q的主唱，中文翻译作射乱Q。在乐队解散后，淳君退居幕后，发掘培养了早安美少女这个如日中天的组合，此后还有松浦亚弥等也都是他一手栽培的。以此为中心，建立了专门培养女性偶像的团体Hello! Projec，隶属在大型演艺经纪公司UP-FRONT AGENCY(UFA)旗下。Hello! Projec几乎的歌曲都由淳君担任制作人，并且作词作曲。通常他在个人活动和担任制作人时使用艺名つんく♂，作词作曲时使用つんく。《节奏天国》两作游戏，也都是他担任制作人的。',
        '97/78/82_5d219c5080b9a6a17bef029331c_2r4GW.jpg', 0, 1, 0, 0, 0, '', 0, 1, 30114, 0),
       (202, '本田 透（ほんだ とおる）', 1, '{{Infobox Crt\n|简体中文名=本田　透\n|声优=\n|性别=女\n|生日=\n|血型=\n|身高=\n|体重=\n|BWH=\n}}',
        '16岁，故事的主要人物，妈妈去世后便成了孤儿，很想让自己属不是十二生肖中的猫，和草摩家的草摩紫吴、草摩由希、草摩夹住在一起，负责他们的家务。小透性格开朗，不知不觉中影响了大家的性格。',
        '85/4d/202_fae5ee42911677c739ee1734486_7jQ9E.jpg', 0, 6, 0, 0, 0, '', 0, 1, 276, 0);
/*!40000 ALTER TABLE `chii_characters`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;
-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 192.168.201.71    Database: bangumi
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.16.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Dumping data for table `chii_crt_cast_index`
--
-- WHERE:  prsn_id <= 10 OR subject_id <= 20 OR crt_id <= 10

LOCK TABLES `chii_crt_cast_index` WRITE;
/*!40000 ALTER TABLE `chii_crt_cast_index`
    DISABLE KEYS */;
REPLACE INTO `chii_crt_cast_index`
VALUES (32, 3862, 12, 2, ''),
       (46, 3863, 12, 2, ''),
       (6540, 1, 61743, 4, ''),
       (3, 3824, 86773, 2, ''),
       (20101, 1, 1263, 2, ''),
       (8, 3867, 13, 4, ''),
       (20206, 1, 171136, 4, ''),
       (2792, 1, 82041, 4, ''),
       (15155, 1, 10550, 4, ''),
       (13589, 1, 11083, 4, ''),
       (11337, 1, 2543, 4, ''),
       (10310, 1, 68807, 2, ''),
       (14536, 1, 19561, 2, ''),
       (1, 3818, 86773, 2, ''),
       (14536, 1, 19618, 2, ''),
       (8727, 1, 53952, 2, ''),
       (8, 3867, 51, 2, ''),
       (2, 4015, 86773, 2, ''),
       (8727, 1, 53951, 2, ''),
       (8727, 1, 53950, 2, ''),
       (3456, 4578, 8, 2, ''),
       (8239, 3896, 8, 2, ''),
       (39613, 3884, 8, 2, ''),
       (7, 4165, 876, 2, ''),
       (2, 4015, 63130, 2, ''),
       (3445, 4952, 8, 2, ''),
       (3448, 4344, 8, 2, ''),
       (3116, 4260, 8, 2, ''),
       (3447, 3890, 8, 2, ''),
       (8727, 1, 14653, 2, ''),
       (7, 4165, 51, 2, ''),
       (8, 3867, 876, 2, ''),
       (37, 3867, 12, 2, ''),
       (3272, 3922, 8, 2, ''),
       (32033, 3956, 14, 4, ''),
       (3, 3824, 35866, 2, ''),
       (35854, 3945, 8, 2, ''),
       (25182, 1, 19426, 2, ''),
       (11337, 1, 3114, 4, ''),
       (24321, 1, 42741, 2, ''),
       (17666, 1, 42786, 2, ''),
       (23209, 1, 54942, 2, ''),
       (23209, 1, 10278, 2, ''),
       (2, 4015, 209563, 4, ''),
       (6192, 1, 1120, 2, ''),
       (6192, 1, 1260, 2, ''),
       (19728, 1, 70131, 2, ''),
       (6192, 1, 210231, 2, ''),
       (3966, 1, 47685, 2, ''),
       (19728, 1, 56951, 2, ''),
       (6540, 1, 16608, 2, ''),
       (6540, 1, 16605, 2, ''),
       (6540, 1, 109053, 2, ''),
       (41, 4657, 12, 2, ''),
       (42, 3862, 12, 2, ''),
       (45, 4127, 12, 2, ''),
       (1, 3818, 199231, 2, ''),
       (3966, 1, 890, 2, ''),
       (3966, 1, 3016, 2, ''),
       (3966, 1, 47684, 2, ''),
       (17781, 1, 61534, 2, ''),
       (1063, 4113, 13, 4, ''),
       (16284, 1, 10566, 2, ''),
       (15851, 1, 982, 2, ''),
       (15622, 1, 1772, 2, ''),
       (5146, 1, 3755, 2, ''),
       (14606, 1, 10335, 2, ''),
       (11337, 1, 11894, 4, ''),
       (11337, 1, 967, 4, ''),
       (3966, 1, 80205, 2, ''),
       (1014, 4231, 13, 4, ''),
       (3966, 1, 889, 2, ''),
       (12961, 1, 54942, 2, ''),
       (20206, 1, 8374, 4, ''),
       (1, 3890, 8, 2, ''),
       (1807, 1, 3183, 2, ''),
       (12278, 1, 3287, 2, ''),
       (4795, 1, 3018, 2, ''),
       (4795, 1, 2427, 2, ''),
       (4795, 1, 2425, 2, ''),
       (3966, 1, 283, 2, ''),
       (39, 3866, 12, 2, ''),
       (10567, 1, 8474, 2, ''),
       (40, 4007, 12, 2, ''),
       (10685, 1, 1428, 2, ''),
       (14395, 1, 34902, 3, ''),
       (14395, 1, 78370, 3, ''),
       (11466, 1, 2476, 2, ''),
       (2792, 1, 8374, 4, ''),
       (15155, 1, 30220, 4, ''),
       (12967, 1, 1735, 4, ''),
       (7, 4165, 3686, 2, ''),
       (12961, 1, 10278, 2, ''),
       (36, 4042, 12, 2, ''),
       (16711, 1, 26449, 2, ''),
       (17666, 1, 77646, 2, ''),
       (43, 3864, 12, 2, ''),
       (13097, 1, 6392, 3, ''),
       (18468, 1, 39794, 2, ''),
       (26280, 1, 109948, 2, ''),
       (1059, 4730, 13, 4, ''),
       (26257, 1, 1748, 2, ''),
       (25938, 1, 103671, 2, ''),
       (6538, 1, 4252, 2, ''),
       (10334, 1, 4252, 2, ''),
       (5, 3827, 333598, 2, ''),
       (24368, 1, 4221, 2, ''),
       (23055, 1, 74906, 2, ''),
       (44, 3824, 12, 2, ''),
       (5961, 1, 7620, 2, ''),
       (22236, 1, 7618, 2, ''),
       (14395, 1, 50811, 2, ''),
       (15870, 1, 2225, 2, ''),
       (3517, 1, 892, 2, ''),
       (948, 1, 2293, 2, ''),
       (14395, 1, 170689, 2, ''),
       (12973, 1, 14427, 2, ''),
       (19034, 3961, 14, 4, ''),
       (12973, 1, 23626, 2, ''),
       (10495, 1, 11267, 4, ''),
       (11337, 1, 1557, 4, ''),
       (2186, 1, 3916, 2, ''),
       (12632, 1, 15353, 2, ''),
       (329, 1, 993, 2, ''),
       (3, 3824, 209563, 4, ''),
       (1243, 1, 2474, 2, ''),
       (20984, 6789, 2, 6, ''),
       (2792, 1, 3485, 2, ''),
       (2792, 1, 1264, 2, ''),
       (23641, 1, 20187, 4, ''),
       (2792, 1, 35679, 2, ''),
       (5098, 1, 528, 2, ''),
       (28445, 1, 41579, 4, ''),
       (11337, 1, 4480, 2, ''),
       (11337, 1, 12697, 2, ''),
       (11337, 1, 3014, 2, ''),
       (23105, 15626, 14, 4, ''),
       (10865, 1, 13498, 2, ''),
       (19876, 4204, 14, 4, ''),
       (12967, 1, 226660, 4, ''),
       (15166, 1, 30220, 4, ''),
       (4, 4145, 13, 4, ''),
       (1015, 4013, 13, 4, ''),
       (1016, 3821, 13, 4, ''),
       (1023, 4268, 13, 4, ''),
       (23763, 3867, 14, 4, ''),
       (23764, 4140, 14, 4, ''),
       (23783, 4289, 14, 4, ''),
       (23106, 4140, 14, 4, ''),
       (10848, 1, 49119, 2, ''),
       (2792, 1, 1262, 2, ''),
       (296, 1, 292, 2, ''),
       (24805, 4767, 8, 2, ''),
       (1243, 1, 2475, 2, ''),
       (329, 1, 2586, 2, ''),
       (1807, 1, 6814, 2, ''),
       (10645, 1, 2089, 2, ''),
       (11504, 1, 2128, 2, ''),
       (15166, 1, 7941, 2, ''),
       (2792, 1, 1263, 2, ''),
       (7, 4165, 13, 4, ''),
       (4, 4145, 876, 2, ''),
       (17834, 1, 5694, 2, ''),
       (26085, 1, 34292, 4, ''),
       (6540, 1, 120191, 2, ''),
       (26257, 1, 9737, 2, ''),
       (20101, 1, 3485, 2, ''),
       (5119, 1, 8008, 2, ''),
       (329, 1, 20957, 4, ''),
       (2792, 1, 68284, 2, ''),
       (8632, 3920, 8, 2, ''),
       (8, 3867, 3686, 2, ''),
       (22862, 4224, 8, 2, ''),
       (3454, 4625, 8, 2, ''),
       (3462, 4806, 8, 2, ''),
       (4661, 1, 1442, 2, ''),
       (4661, 1, 19136, 2, ''),
       (5136, 1, 25369, 2, ''),
       (34, 4056, 12, 2, ''),
       (36146, 1, 160271, 2, ''),
       (35, 3868, 12, 2, ''),
       (8874, 1, 56626, 2, ''),
       (4, 4145, 333598, 2, ''),
       (28445, 1, 41578, 4, ''),
       (8431, 1, 3422, 2, ''),
       (12961, 1, 23681, 2, ''),
       (23209, 1, 23681, 2, ''),
       (30090, 1, 192978, 2, ''),
       (31644, 1, 199392, 2, ''),
       (32035, 4712, 14, 4, ''),
       (32036, 1057, 14, 4, ''),
       (32037, 4268, 14, 4, ''),
       (32139, 1, 119677, 2, ''),
       (32227, 3945, 14, 4, ''),
       (32232, 3818, 14, 4, ''),
       (32414, 1, 75135, 4, ''),
       (32554, 1, 843, 2, ''),
       (1, 3890, 793, 2, ''),
       (33255, 1, 1753, 2, ''),
       (33255, 1, 12558, 2, ''),
       (14395, 1, 90512, 2, ''),
       (3461, 4032, 8, 2, ''),
       (34015, 1, 109541, 2, ''),
       (2, 4015, 199228, 2, ''),
       (14395, 1, 30214, 3, ''),
       (14395, 1, 76856, 3, ''),
       (14395, 1, 136986, 3, ''),
       (14395, 1, 140324, 3, ''),
       (17495, 1, 121003, 2, ''),
       (3, 3824, 199229, 2, ''),
       (3444, 3967, 8, 2, ''),
       (35019, 1, 2882, 2, ''),
       (35247, 4140, 14, 4, ''),
       (3, 3824, 8, 2, ''),
       (35290, 4289, 14, 4, ''),
       (35290, 4954, 14, 4, ''),
       (23786, 4289, 14, 4, ''),
       (35289, 4068, 14, 4, ''),
       (35291, 4289, 14, 4, ''),
       (35289, 4289, 14, 4, ''),
       (1021, 3967, 13, 4, ''),
       (35403, 1, 15292, 4, ''),
       (1, 3818, 199230, 2, ''),
       (35592, 1, 278949, 4, ''),
       (36079, 1, 143740, 2, ''),
       (1, 3818, 8, 2, ''),
       (1, 3818, 35866, 2, ''),
       (1, 3818, 199228, 2, ''),
       (10543, 1, 149324, 3, ''),
       (10543, 1, 149323, 3, ''),
       (10543, 1, 149322, 3, ''),
       (10543, 1, 149321, 3, ''),
       (10543, 1, 83311, 3, ''),
       (10543, 1, 149320, 3, ''),
       (1020, 3945, 13, 4, ''),
       (1, 3818, 199229, 2, ''),
       (6, 4371, 333598, 2, ''),
       (6540, 1, 3425, 2, ''),
       (6540, 1, 140526, 3, ''),
       (6540, 1, 120896, 3, ''),
       (6540, 1, 234552, 2, ''),
       (39343, 1, 145407, 2, ''),
       (3, 3824, 199228, 2, ''),
       (36493, 1, 150746, 2, ''),
       (39562, 1, 145354, 2, ''),
       (3441, 3957, 8, 2, ''),
       (39611, 4313, 8, 2, ''),
       (39612, 3966, 8, 2, ''),
       (39615, 5648, 8, 2, ''),
       (1019, 3976, 13, 4, ''),
       (39918, 1, 144234, 4, ''),
       (39918, 1, 24813, 4, ''),
       (40009, 1, 176599, 2, ''),
       (36079, 1, 124185, 2, ''),
       (1022, 4362, 13, 4, ''),
       (5, 3827, 13, 4, ''),
       (36146, 1, 139022, 2, ''),
       (41805, 1, 110906, 4, ''),
       (41985, 5580, 13, 4, ''),
       (10865, 1, 4124, 2, ''),
       (42738, 1, 144653, 4, ''),
       (1013, 4278, 13, 4, ''),
       (6944, 1, 2474, 2, ''),
       (35592, 1, 262382, 2, ''),
       (43738, 1, 165553, 2, ''),
       (32139, 1, 119812, 4, ''),
       (43896, 1, 146754, 2, ''),
       (44201, 1, 186553, 2, ''),
       (4, 4145, 51, 2, ''),
       (7, 4165, 333598, 2, ''),
       (45388, 1, 3011, 2, ''),
       (8, 4832, 3660, 4, ''),
       (46426, 1, 3240, 4, ''),
       (2792, 1, 220403, 2, ''),
       (32484, 1, 187935, 2, ''),
       (50555, 1, 192010, 4, ''),
       (2, 4015, 793, 2, ''),
       (19038, 3945, 14, 4, ''),
       (12967, 1, 1733, 4, ''),
       (12967, 1, 55680, 2, ''),
       (12967, 1, 23155, 2, ''),
       (12967, 1, 23156, 2, ''),
       (3264, 1, 1986, 2, ''),
       (38, 3945, 12, 2, ''),
       (10310, 1, 2129, 2, ''),
       (6540, 1, 2782, 2, ''),
       (1024, 3998, 13, 4, ''),
       (52572, 1, 211247, 2, ''),
       (53433, 1, 213350, 4, ''),
       (14395, 1, 25834, 2, ''),
       (55670, 1, 192010, 4, ''),
       (56752, 1, 202880, 2, ''),
       (6192, 1, 1261, 2, ''),
       (57871, 1, 1980, 2, ''),
       (62466, 1, 317642, 2, ''),
       (31644, 1, 105075, 2, ''),
       (35592, 1, 147067, 2, ''),
       (12967, 1, 2330, 4, ''),
       (8, 3867, 333598, 2, ''),
       (59918, 1, 1935, 2, ''),
       (59918, 1, 315, 2, ''),
       (30090, 1, 101820, 2, ''),
       (28253, 1, 4211, 4, ''),
       (28253, 1, 56706, 4, ''),
       (28253, 1, 96750, 4, ''),
       (6, 4371, 13, 4, ''),
       (2243, 4474, 8, 2, ''),
       (3437, 4042, 8, 2, ''),
       (5, 3827, 51, 2, ''),
       (62498, 1, 242483, 2, ''),
       (20206, 1, 220403, 2, ''),
       (6540, 1, 202661, 2, ''),
       (9, 3832, 18766, 4, ''),
       (35592, 1, 244918, 4, ''),
       (33, 4513, 12, 2, ''),
       (1007, 4724, 13, 4, ''),
       (6, 4371, 51, 2, ''),
       (1940, 1, 3407, 2, ''),
       (65753, 1, 235130, 2, ''),
       (2792, 1, 110867, 2, ''),
       (20206, 1, 68284, 2, ''),
       (55396, 1, 154771, 2, ''),
       (14918, 1, 233243, 4, ''),
       (67271, 1, 1415, 2, ''),
       (67289, 1, 305578, 2, ''),
       (67467, 1, 262688, 2, ''),
       (2, 4015, 8, 2, ''),
       (10987, 1, 3843, 2, ''),
       (9, 3832, 249470, 4, ''),
       (35592, 1, 221062, 2, ''),
       (68291, 4042, 8, 2, ''),
       (2, 4015, 199229, 2, ''),
       (20101, 1, 35679, 2, ''),
       (10865, 1, 159824, 2, ''),
       (65175, 1, 270060, 2, ''),
       (56822, 1, 212279, 2, ''),
       (62498, 1, 239839, 2, ''),
       (1, 3818, 793, 2, ''),
       (67289, 1, 282692, 2, ''),
       (9, 3832, 1501, 4, ''),
       (2792, 1, 33706, 4, ''),
       (10848, 1, 3690, 2, ''),
       (70851, 1, 109378, 4, ''),
       (14395, 1, 91175, 4, ''),
       (14395, 1, 163711, 2, ''),
       (70931, 1, 260770, 2, ''),
       (3, 3824, 33389, 4, ''),
       (14395, 1, 218220, 4, ''),
       (71260, 1, 14153, 2, ''),
       (71837, 1, 185181, 4, ''),
       (9, 3832, 14, 4, ''),
       (13349, 6821, 8, 2, ''),
       (71829, 1, 279346, 4, ''),
       (65175, 1, 254788, 2, ''),
       (72153, 4324, 8, 2, ''),
       (3464, 3897, 8, 2, ''),
       (9, 3832, 1500, 4, ''),
       (72261, 4822, 8, 2, ''),
       (72262, 3971, 8, 2, ''),
       (35592, 1, 88868, 4, ''),
       (71315, 1, 292832, 2, ''),
       (33549, 4317, 8, 2, ''),
       (2, 4032, 793, 2, ''),
       (2, 4032, 8, 2, ''),
       (73233, 1, 225878, 4, ''),
       (67289, 1, 262889, 2, ''),
       (35592, 1, 103372, 4, ''),
       (24806, 4514, 8, 2, ''),
       (39610, 4129, 8, 2, ''),
       (3438, 3890, 8, 2, ''),
       (67289, 1, 294820, 2, ''),
       (47299, 1, 176599, 2, ''),
       (74758, 1, 298390, 3, ''),
       (3, 3824, 793, 2, ''),
       (75416, 1, 24815, 2, ''),
       (76094, 1, 249619, 2, ''),
       (15870, 1, 97473, 3, ''),
       (2792, 1, 29048, 4, ''),
       (2792, 1, 110906, 4, ''),
       (2792, 1, 218220, 4, ''),
       (20206, 1, 29048, 4, ''),
       (2792, 1, 171136, 4, ''),
       (2792, 1, 207453, 4, ''),
       (2792, 1, 208779, 4, ''),
       (77601, 1, 288746, 2, ''),
       (77601, 1, 56626, 2, ''),
       (78976, 1, 42690, 2, ''),
       (78976, 1, 13015, 2, ''),
       (81026, 1, 172168, 4, ''),
       (81026, 1, 310687, 2, ''),
       (81026, 1, 283642, 2, ''),
       (85933, 1, 312979, 2, ''),
       (1, 3818, 63130, 2, ''),
       (70931, 1, 260772, 2, ''),
       (88272, 1, 4164, 2, ''),
       (88537, 1, 7995, 2, ''),
       (88856, 1, 1308, 2, ''),
       (35592, 1, 221305, 4, ''),
       (91686, 1, 975, 2, ''),
       (17031, 1, 3990, 4, ''),
       (93918, 1, 4190, 2, ''),
       (93922, 1, 4190, 2, ''),
       (96954, 1, 309753, 2, ''),
       (96099, 1, 336526, 4, ''),
       (11466, 1, 7882, 2, ''),
       (93922, 1, 308558, 2, ''),
       (4, 4145, 3686, 2, ''),
       (7, 4165, 37874, 2, ''),
       (8, 3867, 37873, 2, ''),
       (6, 4371, 876, 2, ''),
       (5, 3827, 876, 2, ''),
       (102810, 1, 340822, 2, ''),
       (35592, 1, 281281, 4, ''),
       (10956, 1, 220187, 2, '');
/*!40000 ALTER TABLE `chii_crt_cast_index`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2021-12-16 11:19:53
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 08, 2021 at 06:55 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

--
-- Dumping data for table `chii_subject_fields`
--

INSERT INTO `chii_subject_fields` (`field_sid`, `field_tid`, `field_tags`, `field_rate_1`, `field_rate_2`, `field_rate_3`, `field_rate_4`, `field_rate_5`, `field_rate_6`, `field_rate_7`, `field_rate_8`, `field_rate_9`, `field_rate_10`, `field_airtime`, `field_rank`, `field_year`, `field_mon`, `field_week_day`, `field_date`, `field_redirect`) VALUES
(1, 1, 'a:18:{i:0;a:2:{s:8:"tag_name";s:9:"痞子蔡";s:6:"result";s:2:"23";}i:1;a:2:{s:8:"tag_name";s:9:"蔡智恒";s:6:"result";s:2:"11";}i:2;a:2:{s:8:"tag_name";s:6:"爱情";s:6:"result";s:2:"10";}i:3;a:2:{s:8:"tag_name";s:12:"轻舞飞扬";s:6:"result";s:2:"10";}i:4;a:2:{s:8:"tag_name";s:6:"小说";s:6:"result";s:1:"9";}i:5;a:2:{s:8:"tag_name";s:6:"台湾";s:6:"result";s:1:"8";}i:6;a:2:{s:8:"tag_name";s:9:"三次元";s:6:"result";s:1:"5";}i:7;a:2:{s:8:"tag_name";s:6:"经典";s:6:"result";s:1:"5";}i:8;a:2:{s:8:"tag_name";s:6:"国产";s:6:"result";s:1:"4";}i:9;a:2:{s:8:"tag_name";s:6:"网络";s:6:"result";s:1:"2";}i:10;a:2:{s:8:"tag_name";s:12:"网络小说";s:6:"result";s:1:"2";}i:11;a:2:{s:8:"tag_name";s:4:"1999";s:6:"result";s:1:"2";}i:12;a:2:{s:8:"tag_name";s:3:"国";s:6:"result";s:1:"1";}i:13;a:2:{s:8:"tag_name";s:2:"NN";s:6:"result";s:1:"1";}i:14;a:2:{s:8:"tag_name";s:6:"网文";s:6:"result";s:1:"1";}i:15;a:2:{s:8:"tag_name";s:9:"少女系";s:6:"result";s:1:"1";}i:16;a:2:{s:8:"tag_name";s:6:"书籍";s:6:"result";s:1:"1";}i:17;a:2:{s:8:"tag_name";s:6:"小説";s:6:"result";s:1:"1";}}', 0, 0, 1, 0, 0, 9, 16, 31, 8, 4, 0, 1573, 1998, 9, 5, '1998-09-25', 0),
(2, 3, 'a:10:{i:0;a:2:{s:8:"tag_name";s:9:"陈绮贞";s:6:"result";s:1:"9";}i:1;a:2:{s:8:"tag_name";s:6:"中配";s:6:"result";s:1:"1";}i:2;a:2:{s:8:"tag_name";s:12:"银魂中配";s:6:"result";s:1:"1";}i:3;a:2:{s:8:"tag_name";s:9:"神还原";s:6:"result";s:1:"1";}i:4;a:2:{s:8:"tag_name";s:12:"冷泉夜月";s:6:"result";s:1:"1";}i:5;a:2:{s:8:"tag_name";s:9:"银他妈";s:6:"result";s:1:"1";}i:6;a:2:{s:8:"tag_name";s:9:"陈老师";s:6:"result";s:1:"1";}i:7;a:2:{s:8:"tag_name";s:6:"银魂";s:6:"result";s:1:"1";}i:8;a:2:{s:8:"tag_name";s:9:"治愈系";s:6:"result";s:1:"1";}i:9;a:2:{s:8:"tag_name";s:6:"恶搞";s:6:"result";s:1:"1";}}', 3, 2, 2, 6, 3, 35, 81, 112, 78, 93, 0, 0, 0000, 0, 2, '0000-00-00', 0),
(3, 2, 'a:2:{i:0;a:2:{s:8:"tag_name";s:9:"押井守";s:6:"result";s:1:"8";}i:1;a:2:{s:8:"tag_name";s:12:"空中杀手";s:6:"result";s:1:"4";}}', 0, 0, 0, 0, 1, 2, 3, 4, 2, 0, 0, 0, 2008, 9, 7, '2008-09-03', 1836),
(4, 4, 'a:20:{i:0;a:2:{s:8:"tag_name";s:3:"NDS";s:6:"result";s:2:"52";}i:1;a:2:{s:8:"tag_name";s:12:"合金弹头";s:6:"result";s:2:"31";}i:2;a:2:{s:8:"tag_name";s:3:"ACT";s:6:"result";s:2:"15";}i:3;a:2:{s:8:"tag_name";s:3:"SNK";s:6:"result";s:2:"15";}i:4;a:2:{s:8:"tag_name";s:12:"Metal_Slug_7";s:6:"result";s:1:"6";}i:5;a:2:{s:8:"tag_name";s:3:"STG";s:6:"result";s:1:"4";}i:6;a:2:{s:8:"tag_name";s:6:"移植";s:6:"result";s:1:"2";}i:7;a:2:{s:8:"tag_name";s:12:"诚意不足";s:6:"result";s:1:"2";}i:8;a:2:{s:8:"tag_name";s:3:"RNG";s:6:"result";s:1:"2";}i:9;a:2:{s:8:"tag_name";s:4:"2008";s:6:"result";s:1:"2";}i:10;a:2:{s:8:"tag_name";s:12:"普通游戏";s:6:"result";s:1:"1";}i:11;a:2:{s:8:"tag_name";s:2:"PC";s:6:"result";s:1:"1";}i:12;a:2:{s:8:"tag_name";s:9:"未评分";s:6:"result";s:1:"1";}i:13;a:2:{s:8:"tag_name";s:6:"中型";s:6:"result";s:1:"1";}i:14;a:2:{s:8:"tag_name";s:6:"六星";s:6:"result";s:1:"1";}i:15;a:2:{s:8:"tag_name";s:6:"动作";s:6:"result";s:1:"1";}i:16;a:2:{s:8:"tag_name";s:6:"童年";s:6:"result";s:1:"1";}i:17;a:2:{s:8:"tag_name";s:6:"汉化";s:6:"result";s:1:"1";}i:18;a:2:{s:8:"tag_name";s:12:"横版射击";s:6:"result";s:1:"1";}i:19;a:2:{s:8:"tag_name";s:6:"暴力";s:6:"result";s:1:"1";}}', 0, 0, 0, 1, 8, 47, 43, 39, 3, 2, 0, 3560, 2008, 7, 4, '2008-07-17', 0),
(5, 4, 'a:6:{i:0;a:2:{s:8:"tag_name";s:4:"COD4";s:6:"result";s:2:"16";}i:1;a:2:{s:8:"tag_name";s:3:"COD";s:6:"result";s:1:"9";}i:2;a:2:{s:8:"tag_name";s:3:"FPS";s:6:"result";s:1:"6";}i:3;a:2:{s:8:"tag_name";s:6:"刺激";s:6:"result";s:1:"2";}i:4;a:2:{s:8:"tag_name";s:7:"XBOX360";s:6:"result";s:1:"2";}i:5;a:2:{s:8:"tag_name";s:2:"AB";s:6:"result";s:1:"2";}}', 0, 0, 0, 0, 0, 1, 2, 11, 13, 3, 0, 0, 0000, 0, 0, '0000-00-00', 1900),
(6, 4, 'a:20:{i:0;a:2:{s:8:"tag_name";s:5:"Valve";s:6:"result";s:2:"52";}i:1;a:2:{s:8:"tag_name";s:3:"FPS";s:6:"result";s:2:"47";}i:2;a:2:{s:8:"tag_name";s:5:"STEAM";s:6:"result";s:2:"38";}i:3;a:2:{s:8:"tag_name";s:13:"军团要塞2";s:6:"result";s:2:"33";}i:4;a:2:{s:8:"tag_name";s:2:"PC";s:6:"result";s:2:"23";}i:5;a:2:{s:8:"tag_name";s:3:"TF2";s:6:"result";s:2:"19";}i:6;a:2:{s:8:"tag_name";s:6:"帽子";s:6:"result";s:2:"10";}i:7;a:2:{s:8:"tag_name";s:6:"经典";s:6:"result";s:1:"8";}i:8;a:2:{s:8:"tag_name";s:12:"军团要塞";s:6:"result";s:1:"7";}i:9;a:2:{s:8:"tag_name";s:10:"半条命2";s:6:"result";s:1:"5";}i:10;a:2:{s:8:"tag_name";s:9:"枪枪枪";s:6:"result";s:1:"4";}i:11;a:2:{s:8:"tag_name";s:12:"团队要塞";s:6:"result";s:1:"3";}i:12;a:2:{s:8:"tag_name";s:36:"抓好社会主义精神文明建设";s:6:"result";s:1:"3";}i:13;a:2:{s:8:"tag_name";s:4:"2007";s:6:"result";s:1:"2";}i:14;a:2:{s:8:"tag_name";s:6:"Online";s:6:"result";s:1:"2";}i:15;a:2:{s:8:"tag_name";s:6:"金锅";s:6:"result";s:1:"1";}i:16;a:2:{s:8:"tag_name";s:12:"普通游戏";s:6:"result";s:1:"1";}i:17;a:2:{s:8:"tag_name";s:3:"PVP";s:6:"result";s:1:"1";}i:18;a:2:{s:8:"tag_name";s:2:"tf";s:6:"result";s:1:"1";}i:19;a:2:{s:8:"tag_name";s:9:"出门杀";s:6:"result";s:1:"1";}}', 0, 0, 0, 1, 3, 21, 60, 53, 23, 11, 0, 1360, 2007, 10, 3, '2007-10-10', 0),
(7, 4, 'a:10:{i:0;a:2:{s:8:"tag_name";s:3:"UT3";s:6:"result";s:1:"9";}i:1;a:2:{s:8:"tag_name";s:2:"PC";s:6:"result";s:1:"7";}i:2;a:2:{s:8:"tag_name";s:3:"FPS";s:6:"result";s:1:"7";}i:3;a:2:{s:8:"tag_name";s:2:"UT";s:6:"result";s:1:"5";}i:4;a:2:{s:8:"tag_name";s:15:"虚幻竞技场";s:6:"result";s:1:"5";}i:5;a:2:{s:8:"tag_name";s:9:"枪枪枪";s:6:"result";s:1:"2";}i:6;a:2:{s:8:"tag_name";s:12:"本地多人";s:6:"result";s:1:"1";}i:7;a:2:{s:8:"tag_name";s:6:"欧美";s:6:"result";s:1:"1";}i:8;a:2:{s:8:"tag_name";s:7:"XBOX360";s:6:"result";s:1:"1";}i:9;a:2:{s:8:"tag_name";s:4:"X360";s:6:"result";s:1:"1";}}', 0, 0, 0, 1, 2, 8, 15, 15, 4, 0, 0, 2528, 2007, 11, 1, '2007-11-19', 0),
(8, 2, 'a:30:{i:0;a:2:{s:8:"tag_name";s:18:"叛逆的鲁鲁修";s:6:"result";s:4:"1645";}i:1;a:2:{s:8:"tag_name";s:7:"SUNRISE";s:6:"result";s:4:"1229";}i:2;a:2:{s:8:"tag_name";s:24:"反逆のルルーシュ";s:6:"result";s:3:"936";}i:3;a:2:{s:8:"tag_name";s:15:"还是死妹控";s:6:"result";s:3:"721";}i:4;a:2:{s:8:"tag_name";s:2:"TV";s:6:"result";s:3:"664";}i:5;a:2:{s:8:"tag_name";s:6:"妹控";s:6:"result";s:3:"603";}i:6;a:2:{s:8:"tag_name";s:9:"codegeass";s:6:"result";s:3:"569";}i:7;a:2:{s:8:"tag_name";s:12:"谷口悟朗";s:6:"result";s:3:"523";}i:8;a:2:{s:8:"tag_name";s:9:"鲁路修";s:6:"result";s:3:"453";}i:9;a:2:{s:8:"tag_name";s:2:"R2";s:6:"result";s:3:"427";}i:10;a:2:{s:8:"tag_name";s:4:"2008";s:6:"result";s:3:"409";}i:11;a:2:{s:8:"tag_name";s:6:"原创";s:6:"result";s:3:"385";}i:12;a:2:{s:8:"tag_name";s:11:"2008年4月";s:6:"result";s:3:"357";}i:13;a:2:{s:8:"tag_name";s:15:"大河内一楼";s:6:"result";s:3:"174";}i:14;a:2:{s:8:"tag_name";s:6:"日升";s:6:"result";s:3:"151";}i:15;a:2:{s:8:"tag_name";s:6:"萝卜";s:6:"result";s:3:"120";}i:16;a:2:{s:8:"tag_name";s:6:"机战";s:6:"result";s:3:"111";}i:17;a:2:{s:8:"tag_name";s:15:"狗得鸡鸭死";s:6:"result";s:3:"104";}i:18;a:2:{s:8:"tag_name";s:9:"福山润";s:6:"result";s:2:"94";}i:19;a:2:{s:8:"tag_name";s:9:"露露胸";s:6:"result";s:2:"84";}i:20;a:2:{s:8:"tag_name";s:5:"CLAMP";s:6:"result";s:2:"69";}i:21;a:2:{s:8:"tag_name";s:6:"科幻";s:6:"result";s:2:"67";}i:22;a:2:{s:8:"tag_name";s:9:"鲁鲁修";s:6:"result";s:2:"62";}i:23;a:2:{s:8:"tag_name";s:5:"GEASS";s:6:"result";s:2:"57";}i:24;a:2:{s:8:"tag_name";s:6:"神作";s:6:"result";s:2:"54";}i:25;a:2:{s:8:"tag_name";s:6:"战斗";s:6:"result";s:2:"49";}i:26;a:2:{s:8:"tag_name";s:6:"战争";s:6:"result";s:2:"41";}i:27;a:2:{s:8:"tag_name";s:25:"裸露修的跌二次KUSO";s:6:"result";s:2:"40";}i:28;a:2:{s:8:"tag_name";s:6:"中二";s:6:"result";s:2:"37";}i:29;a:2:{s:8:"tag_name";s:12:"樱井孝宏";s:6:"result";s:2:"34";}}', 44, 15, 32, 66, 145, 457, 1472, 3190, 2640, 1377, 7, 121, 2008, 4, 7, '2008-04-06', 0),
(9, 4, 'a:25:{i:0;a:2:{s:8:"tag_name";s:3:"NDS";s:6:"result";s:2:"84";}i:1;a:2:{s:8:"tag_name";s:12:"节奏天国";s:6:"result";s:2:"66";}i:2;a:2:{s:8:"tag_name";s:9:"任天堂";s:6:"result";s:2:"59";}i:3;a:2:{s:8:"tag_name";s:6:"神作";s:6:"result";s:2:"31";}i:4;a:2:{s:8:"tag_name";s:6:"节奏";s:6:"result";s:2:"28";}i:5;a:2:{s:8:"tag_name";s:3:"MUG";s:6:"result";s:2:"24";}i:6;a:2:{s:8:"tag_name";s:12:"音乐游戏";s:6:"result";s:2:"19";}i:7;a:2:{s:8:"tag_name";s:9:"毁屏幕";s:6:"result";s:2:"13";}i:8;a:2:{s:8:"tag_name";s:6:"手残";s:6:"result";s:2:"11";}i:9;a:2:{s:8:"tag_name";s:12:"屏幕杀手";s:6:"result";s:2:"10";}i:10;a:2:{s:8:"tag_name";s:6:"好贱";s:6:"result";s:1:"5";}i:11;a:2:{s:8:"tag_name";s:8:"nintendo";s:6:"result";s:1:"5";}i:12;a:2:{s:8:"tag_name";s:6:"春菜";s:6:"result";s:1:"3";}i:13;a:2:{s:8:"tag_name";s:2:"DS";s:6:"result";s:1:"2";}i:14;a:2:{s:8:"tag_name";s:6:"音游";s:6:"result";s:1:"2";}i:15;a:2:{s:8:"tag_name";s:27:"哔叽哔叽哔叽待斯嘎";s:6:"result";s:1:"1";}i:16;a:2:{s:8:"tag_name";s:7:"MUG-ACT";s:6:"result";s:1:"1";}i:17;a:2:{s:8:"tag_name";s:7:"Nitendo";s:6:"result";s:1:"1";}i:18;a:2:{s:8:"tag_name";s:5:"Gēmu";s:6:"result";s:1:"1";}i:19;a:2:{s:8:"tag_name";s:15:"謎の中毒性";s:6:"result";s:1:"1";}i:20;a:2:{s:8:"tag_name";s:3:"PUZ";s:6:"result";s:1:"1";}i:21;a:2:{s:8:"tag_name";s:6:"游戏";s:6:"result";s:1:"1";}i:22;a:2:{s:8:"tag_name";s:6:"汉化";s:6:"result";s:1:"1";}i:23;a:2:{s:8:"tag_name";s:6:"通关";s:6:"result";s:1:"1";}i:24;a:2:{s:8:"tag_name";s:6:"八星";s:6:"result";s:1:"1";}}', 0, 0, 0, 1, 3, 12, 38, 105, 110, 36, 0, 211, 2008, 7, 4, '2008-07-31', 0),
(10, 1, 'a:8:{i:0;a:2:{s:8:"tag_name";s:6:"画集";s:6:"result";s:2:"22";}i:1;a:2:{s:8:"tag_name";s:5:"CLAMP";s:6:"result";s:2:"18";}i:2;a:2:{s:8:"tag_name";s:7:"chobits";s:6:"result";s:1:"8";}i:3;a:2:{s:8:"tag_name";s:9:"讲谈社";s:6:"result";s:1:"3";}i:4;a:2:{s:8:"tag_name";s:12:"晒命资本";s:6:"result";s:1:"3";}i:5;a:2:{s:8:"tag_name";s:9:"少女系";s:6:"result";s:1:"2";}i:6;a:2:{s:8:"tag_name";s:5:"CLMAP";s:6:"result";s:1:"2";}i:7;a:2:{s:8:"tag_name";s:3:"叽";s:6:"result";s:1:"2";}}', 0, 1, 0, 0, 0, 0, 7, 10, 7, 3, 0, 1127, 2003, 1, 2, '0000-00-00', 0),
(11, 1, 'a:7:{i:0;a:2:{s:8:"tag_name";s:5:"CLAMP";s:6:"result";s:1:"9";}i:1;a:2:{s:8:"tag_name";s:7:"chobits";s:6:"result";s:1:"8";}i:2;a:2:{s:8:"tag_name";s:6:"画集";s:6:"result";s:1:"6";}i:3;a:2:{s:8:"tag_name";s:6:"科幻";s:6:"result";s:1:"2";}i:4;a:2:{s:8:"tag_name";s:9:"设定集";s:6:"result";s:1:"1";}i:5;a:2:{s:8:"tag_name";s:3:"叽";s:6:"result";s:1:"1";}i:6;a:2:{s:8:"tag_name";s:9:"讲谈社";s:6:"result";s:1:"1";}}', 0, 0, 0, 0, 0, 1, 3, 6, 1, 2, 0, 0, 2003, 3, 5, '0000-00-00', 0),
(12, 2, 'a:30:{i:0;a:2:{s:8:"tag_name";s:5:"CLAMP";s:6:"result";s:3:"932";}i:1;a:2:{s:8:"tag_name";s:21:"人形电脑天使心";s:6:"result";s:3:"718";}i:2;a:2:{s:8:"tag_name";s:3:"叽";s:6:"result";s:3:"397";}i:3;a:2:{s:8:"tag_name";s:7:"chobits";s:6:"result";s:3:"373";}i:4;a:2:{s:8:"tag_name";s:8:"MADHouse";s:6:"result";s:3:"333";}i:5;a:2:{s:8:"tag_name";s:2:"TV";s:6:"result";s:3:"287";}i:6;a:2:{s:8:"tag_name";s:12:"田中理惠";s:6:"result";s:3:"274";}i:7;a:2:{s:8:"tag_name";s:4:"2002";s:6:"result";s:3:"261";}i:8;a:2:{s:8:"tag_name";s:6:"小叽";s:6:"result";s:3:"227";}i:9;a:2:{s:8:"tag_name";s:6:"治愈";s:6:"result";s:3:"186";}i:10;a:2:{s:8:"tag_name";s:21:"Chobits~初次感动~";s:6:"result";s:3:"165";}i:11;a:2:{s:8:"tag_name";s:9:"启动键";s:6:"result";s:3:"137";}i:12;a:2:{s:8:"tag_name";s:9:"漫画改";s:6:"result";s:3:"121";}i:13;a:2:{s:8:"tag_name";s:6:"萝莉";s:6:"result";s:3:"107";}i:14;a:2:{s:8:"tag_name";s:6:"恋爱";s:6:"result";s:2:"57";}i:15;a:2:{s:8:"tag_name";s:12:"浅香守生";s:6:"result";s:2:"55";}i:16;a:2:{s:8:"tag_name";s:11:"2002年4月";s:6:"result";s:2:"53";}i:17;a:2:{s:8:"tag_name";s:6:"漫改";s:6:"result";s:2:"51";}i:18;a:2:{s:8:"tag_name";s:6:"ちぃ";s:6:"result";s:2:"40";}i:19;a:2:{s:8:"tag_name";s:6:"科幻";s:6:"result";s:2:"35";}i:20;a:2:{s:8:"tag_name";s:12:"杉田智和";s:6:"result";s:2:"32";}i:21;a:2:{s:8:"tag_name";s:4:"S田";s:6:"result";s:2:"19";}i:22;a:2:{s:8:"tag_name";s:7:"2002年";s:6:"result";s:2:"18";}i:23;a:2:{s:8:"tag_name";s:6:"搞笑";s:6:"result";s:2:"13";}i:24;a:2:{s:8:"tag_name";s:11:"clamp抢钱";s:6:"result";s:2:"13";}i:25;a:2:{s:8:"tag_name";s:6:"动画";s:6:"result";s:2:"12";}i:26;a:2:{s:8:"tag_name";s:6:"童年";s:6:"result";s:2:"12";}i:27;a:2:{s:8:"tag_name";s:9:"半年番";s:6:"result";s:2:"11";}i:28;a:2:{s:8:"tag_name";s:3:"萌";s:6:"result";s:2:"10";}i:29;a:2:{s:8:"tag_name";s:6:"哥特";s:6:"result";s:1:"9";}}', 4, 4, 5, 13, 60, 395, 987, 1226, 369, 168, 0, 731, 2002, 4, 2, '2002-04-02', 0),
(13, 4, 'a:30:{i:0;a:2:{s:8:"tag_name";s:3:"key";s:6:"result";s:4:"1508";}i:1;a:2:{s:8:"tag_name";s:7:"CLANNAD";s:6:"result";s:4:"1290";}i:2;a:2:{s:8:"tag_name";s:9:"麻枝准";s:6:"result";s:4:"1006";}i:3;a:2:{s:8:"tag_name";s:7:"galgame";s:6:"result";s:3:"939";}i:4;a:2:{s:8:"tag_name";s:9:"催泪弹";s:6:"result";s:3:"568";}i:5;a:2:{s:8:"tag_name";s:6:"家族";s:6:"result";s:3:"490";}i:6;a:2:{s:8:"tag_name";s:6:"人生";s:6:"result";s:3:"461";}i:7;a:2:{s:8:"tag_name";s:6:"亲情";s:6:"result";s:3:"440";}i:8;a:2:{s:8:"tag_name";s:12:"泣きゲー";s:6:"result";s:3:"333";}i:9;a:2:{s:8:"tag_name";s:6:"爱情";s:6:"result";s:3:"182";}i:10;a:2:{s:8:"tag_name";s:2:"PC";s:6:"result";s:3:"171";}i:11;a:2:{s:8:"tag_name";s:3:"GAL";s:6:"result";s:3:"142";}i:12;a:2:{s:8:"tag_name";s:6:"生活";s:6:"result";s:2:"83";}i:13;a:2:{s:8:"tag_name";s:9:"大饼脸";s:6:"result";s:2:"55";}i:14;a:2:{s:8:"tag_name";s:6:"游戏";s:6:"result";s:2:"49";}i:15;a:2:{s:8:"tag_name";s:6:"催泪";s:6:"result";s:2:"38";}i:16;a:2:{s:8:"tag_name";s:3:"AVG";s:6:"result";s:2:"36";}i:17;a:2:{s:8:"tag_name";s:4:"2004";s:6:"result";s:2:"31";}i:18;a:2:{s:8:"tag_name";s:6:"神作";s:6:"result";s:2:"30";}i:19;a:2:{s:8:"tag_name";s:3:"ADV";s:6:"result";s:2:"19";}i:20;a:2:{s:8:"tag_name";s:12:"クラナド";s:6:"result";s:2:"19";}i:21;a:2:{s:8:"tag_name";s:9:"全年龄";s:6:"result";s:2:"18";}i:22;a:2:{s:8:"tag_name";s:6:"汉化";s:6:"result";s:2:"18";}i:23;a:2:{s:8:"tag_name";s:3:"PSP";s:6:"result";s:2:"16";}i:24;a:2:{s:8:"tag_name";s:6:"动漫";s:6:"result";s:2:"16";}i:25;a:2:{s:8:"tag_name";s:12:"涼元悠一";s:6:"result";s:2:"13";}i:26;a:2:{s:8:"tag_name";s:6:"治愈";s:6:"result";s:2:"12";}i:27;a:2:{s:8:"tag_name";s:15:"樋上いたる";s:6:"result";s:2:"11";}i:28;a:2:{s:8:"tag_name";s:6:"校园";s:6:"result";s:2:"10";}i:29;a:2:{s:8:"tag_name";s:3:"魁";s:6:"result";s:1:"9";}}', 27, 1, 4, 20, 35, 69, 214, 598, 1142, 1431, 0, 8, 2004, 4, 3, '2004-04-28', 0),
(14, 4, 'a:30:{i:0;a:2:{s:8:"tag_name";s:3:"PS3";s:6:"result";s:2:"89";}i:1;a:2:{s:8:"tag_name";s:6:"Konami";s:6:"result";s:2:"62";}i:2;a:2:{s:8:"tag_name";s:12:"小島秀夫";s:6:"result";s:2:"52";}i:3;a:2:{s:8:"tag_name";s:3:"MGS";s:6:"result";s:2:"39";}i:4;a:2:{s:8:"tag_name";s:11:"再见Snake";s:6:"result";s:2:"26";}i:5;a:2:{s:8:"tag_name";s:21:"蛇叔的最后一站";s:6:"result";s:2:"25";}i:6;a:2:{s:8:"tag_name";s:5:"Snake";s:6:"result";s:2:"24";}i:7;a:2:{s:8:"tag_name";s:12:"我爱小岛";s:6:"result";s:2:"17";}i:8;a:2:{s:8:"tag_name";s:3:"ACT";s:6:"result";s:2:"16";}i:9;a:2:{s:8:"tag_name";s:12:"小岛秀夫";s:6:"result";s:2:"15";}i:10;a:2:{s:8:"tag_name";s:6:"蛇叔";s:6:"result";s:2:"10";}i:11;a:2:{s:8:"tag_name";s:18:"最想玩的游戏";s:6:"result";s:1:"9";}i:12;a:2:{s:8:"tag_name";s:12:"合金装备";s:6:"result";s:1:"4";}i:13;a:2:{s:8:"tag_name";s:12:"潜龙谍影";s:6:"result";s:1:"2";}i:14;a:2:{s:8:"tag_name";s:9:"三次元";s:6:"result";s:1:"2";}i:15;a:2:{s:8:"tag_name";s:6:"KOJIMA";s:6:"result";s:1:"2";}i:16;a:2:{s:8:"tag_name";s:6:"潜行";s:6:"result";s:1:"2";}i:17;a:2:{s:8:"tag_name";s:4:"2008";s:6:"result";s:1:"2";}i:18;a:2:{s:8:"tag_name";s:6:"日本";s:6:"result";s:1:"2";}i:19;a:2:{s:8:"tag_name";s:6:"boring";s:6:"result";s:1:"2";}i:20;a:2:{s:8:"tag_name";s:6:"神作";s:6:"result";s:1:"1";}i:21;a:2:{s:8:"tag_name";s:3:"AVG";s:6:"result";s:1:"1";}i:22;a:2:{s:8:"tag_name";s:12:"视频通关";s:6:"result";s:1:"1";}i:23;a:2:{s:8:"tag_name";s:6:"日系";s:6:"result";s:1:"1";}i:24;a:2:{s:8:"tag_name";s:3:"101";s:6:"result";s:1:"1";}i:25;a:2:{s:8:"tag_name";s:9:"没中文";s:6:"result";s:1:"1";}i:26;a:2:{s:8:"tag_name";s:3:"1-5";s:6:"result";s:1:"1";}i:27;a:2:{s:8:"tag_name";s:4:"GOD!";s:6:"result";s:1:"1";}i:28;a:2:{s:8:"tag_name";s:15:"电影化叙事";s:6:"result";s:1:"1";}i:29;a:2:{s:8:"tag_name";s:6:"视频";s:6:"result";s:1:"1";}}', 0, 0, 0, 3, 2, 7, 16, 58, 79, 69, 0, 59, 2008, 6, 4, '2008-06-12', 0),
(15, 3, 'a:24:{i:0;a:2:{s:8:"tag_name";s:12:"SoundHorizon";s:6:"result";s:3:"161";}i:1;a:2:{s:8:"tag_name";s:9:"Chronicle";s:6:"result";s:2:"56";}i:2;a:2:{s:8:"tag_name";s:9:"怨念物";s:6:"result";s:2:"17";}i:3;a:2:{s:8:"tag_name";s:9:"纯音乐";s:6:"result";s:2:"16";}i:4;a:2:{s:8:"tag_name";s:2:"SH";s:6:"result";s:2:"16";}i:5;a:2:{s:8:"tag_name";s:4:"revo";s:6:"result";s:2:"15";}i:6;a:2:{s:8:"tag_name";s:12:"同人音乐";s:6:"result";s:2:"14";}i:7;a:2:{s:8:"tag_name";s:8:"Story_CD";s:6:"result";s:2:"10";}i:8;a:2:{s:8:"tag_name";s:4:"2001";s:6:"result";s:1:"7";}i:9;a:2:{s:8:"tag_name";s:7:"Aramary";s:6:"result";s:1:"5";}i:10;a:2:{s:8:"tag_name";s:4:"A姐";s:6:"result";s:1:"5";}i:11;a:2:{s:8:"tag_name";s:13:"Sound_Horizon";s:6:"result";s:1:"5";}i:12;a:2:{s:8:"tag_name";s:6:"同人";s:6:"result";s:1:"3";}i:13;a:2:{s:8:"tag_name";s:5:"sound";s:6:"result";s:1:"2";}i:14;a:2:{s:8:"tag_name";s:3:"SHK";s:6:"result";s:1:"2";}i:15;a:2:{s:8:"tag_name";s:7:"horizon";s:6:"result";s:1:"2";}i:16;a:2:{s:8:"tag_name";s:6:"011230";s:6:"result";s:1:"1";}i:17;a:2:{s:8:"tag_name";s:12:"物語音楽";s:6:"result";s:1:"1";}i:18;a:2:{s:8:"tag_name";s:13:"Sound.Horizon";s:6:"result";s:1:"1";}i:19;a:2:{s:8:"tag_name";s:15:"第一地平线";s:6:"result";s:1:"1";}i:20;a:2:{s:8:"tag_name";s:5:"album";s:6:"result";s:1:"1";}i:21;a:2:{s:8:"tag_name";s:2:"cd";s:6:"result";s:1:"1";}i:22;a:2:{s:8:"tag_name";s:12:"同人音樂";s:6:"result";s:1:"1";}i:23;a:2:{s:8:"tag_name";s:9:"伪中庸";s:6:"result";s:1:"1";}}', 0, 0, 1, 0, 1, 13, 56, 100, 69, 41, 0, 447, 2001, 12, 7, '2001-12-30', 0),
(16, 3, 'a:25:{i:0;a:2:{s:8:"tag_name";s:12:"SoundHorizon";s:6:"result";s:3:"152";}i:1;a:2:{s:8:"tag_name";s:7:"Aramary";s:6:"result";s:2:"36";}i:2;a:2:{s:8:"tag_name";s:4:"revo";s:6:"result";s:2:"32";}i:3;a:2:{s:8:"tag_name";s:8:"Thanatos";s:6:"result";s:2:"30";}i:4;a:2:{s:8:"tag_name";s:2:"SH";s:6:"result";s:2:"26";}i:5;a:2:{s:8:"tag_name";s:15:"第二地平线";s:6:"result";s:2:"19";}i:6;a:2:{s:8:"tag_name";s:12:"同人音乐";s:6:"result";s:1:"9";}i:7;a:2:{s:8:"tag_name";s:12:"THANATOS子~";s:6:"result";s:1:"7";}i:8;a:2:{s:8:"tag_name";s:4:"2002";s:6:"result";s:1:"6";}i:9;a:2:{s:8:"tag_name";s:11:"THANATOS子";s:6:"result";s:1:"6";}i:10;a:2:{s:8:"tag_name";s:27:"简单易懂的现代魔法";s:6:"result";s:1:"3";}i:11;a:2:{s:8:"tag_name";s:13:"Sound.Horizon";s:6:"result";s:1:"1";}i:12;a:2:{s:8:"tag_name";s:12:"物語音楽";s:6:"result";s:1:"1";}i:13;a:2:{s:8:"tag_name";s:12:"あらまり";s:6:"result";s:1:"1";}i:14;a:2:{s:8:"tag_name";s:6:"020811";s:6:"result";s:1:"1";}i:15;a:2:{s:8:"tag_name";s:9:"伪中庸";s:6:"result";s:1:"1";}i:16;a:2:{s:8:"tag_name";s:1:"~";s:6:"result";s:1:"1";}i:17;a:2:{s:8:"tag_name";s:5:"album";s:6:"result";s:1:"1";}i:18;a:2:{s:8:"tag_name";s:5:"sound";s:6:"result";s:1:"1";}i:19;a:2:{s:8:"tag_name";s:13:"Sound_Horizon";s:6:"result";s:1:"1";}i:20;a:2:{s:8:"tag_name";s:7:"horizon";s:6:"result";s:1:"1";}i:21;a:2:{s:8:"tag_name";s:9:"怨念物";s:6:"result";s:1:"1";}i:22;a:2:{s:8:"tag_name";s:6:"同人";s:6:"result";s:1:"1";}i:23;a:2:{s:8:"tag_name";s:12:"同人音樂";s:6:"result";s:1:"1";}i:24;a:2:{s:8:"tag_name";s:2:"~~";s:6:"result";s:1:"1";}}', 0, 0, 0, 1, 0, 12, 58, 97, 67, 45, 0, 404, 2002, 8, 5, '2002-08-11', 0),
(17, 3, 'a:30:{i:0;a:2:{s:8:"tag_name";s:12:"SoundHorizon";s:6:"result";s:3:"244";}i:1;a:2:{s:8:"tag_name";s:7:"Aramary";s:6:"result";s:2:"47";}i:2;a:2:{s:8:"tag_name";s:4:"lost";s:6:"result";s:2:"38";}i:3;a:2:{s:8:"tag_name";s:6:"神作";s:6:"result";s:2:"33";}i:4;a:2:{s:8:"tag_name";s:15:"第三地平线";s:6:"result";s:2:"29";}i:5;a:2:{s:8:"tag_name";s:4:"revo";s:6:"result";s:2:"27";}i:6;a:2:{s:8:"tag_name";s:15:"永远的少年";s:6:"result";s:2:"24";}i:7;a:2:{s:8:"tag_name";s:2:"SH";s:6:"result";s:2:"23";}i:8;a:2:{s:8:"tag_name";s:7:"REVO神";s:6:"result";s:2:"18";}i:9;a:2:{s:8:"tag_name";s:12:"同人音乐";s:6:"result";s:1:"9";}i:10;a:2:{s:8:"tag_name";s:4:"2002";s:6:"result";s:1:"7";}i:11;a:2:{s:8:"tag_name";s:13:"SoundHorizon~";s:6:"result";s:1:"5";}i:12;a:2:{s:8:"tag_name";s:6:"同人";s:6:"result";s:1:"4";}i:13;a:2:{s:8:"tag_name";s:13:"Sound_Horizon";s:6:"result";s:1:"4";}i:14;a:2:{s:8:"tag_name";s:6:"少年";s:6:"result";s:1:"2";}i:15;a:2:{s:8:"tag_name";s:6:"专辑";s:6:"result";s:1:"2";}i:16;a:2:{s:8:"tag_name";s:6:"JIMANG";s:6:"result";s:1:"2";}i:17;a:2:{s:8:"tag_name";s:6:"CANAAN";s:6:"result";s:1:"2";}i:18;a:2:{s:8:"tag_name";s:12:"物语音乐";s:6:"result";s:1:"2";}i:19;a:2:{s:8:"tag_name";s:13:"Sound.Horizon";s:6:"result";s:1:"1";}i:20;a:2:{s:8:"tag_name";s:7:"2002年";s:6:"result";s:1:"1";}i:21;a:2:{s:8:"tag_name";s:9:"伪中庸";s:6:"result";s:1:"1";}i:22;a:2:{s:8:"tag_name";s:15:"未观看原作";s:6:"result";s:1:"1";}i:23;a:2:{s:8:"tag_name";s:12:"物語音楽";s:6:"result";s:1:"1";}i:24;a:2:{s:8:"tag_name";s:12:"あらまり";s:6:"result";s:1:"1";}i:25;a:2:{s:8:"tag_name";s:6:"021230";s:6:"result";s:1:"1";}i:26;a:2:{s:8:"tag_name";s:2:"~~";s:6:"result";s:1:"1";}i:27;a:2:{s:8:"tag_name";s:12:"同人音樂";s:6:"result";s:1:"1";}i:28;a:2:{s:8:"tag_name";s:9:"怨念物";s:6:"result";s:1:"1";}i:29;a:2:{s:8:"tag_name";s:4:"J禁";s:6:"result";s:1:"1";}}', 0, 0, 0, 0, 0, 10, 52, 116, 142, 90, 0, 138, 2002, 12, 6, '2002-12-30', 0),
(18, 3, 'a:24:{i:0;a:2:{s:8:"tag_name";s:12:"SoundHorizon";s:6:"result";s:3:"106";}i:1;a:2:{s:8:"tag_name";s:7:"Aramary";s:6:"result";s:2:"29";}i:2;a:2:{s:8:"tag_name";s:4:"revo";s:6:"result";s:2:"14";}i:3;a:2:{s:8:"tag_name";s:2:"SH";s:6:"result";s:2:"10";}i:4;a:2:{s:8:"tag_name";s:9:"108人格";s:6:"result";s:1:"9";}i:5;a:2:{s:8:"tag_name";s:13:"Sound_Horizon";s:6:"result";s:1:"9";}i:6;a:2:{s:8:"tag_name";s:12:"同人音乐";s:6:"result";s:1:"6";}i:7;a:2:{s:8:"tag_name";s:10:"A姐卖萌";s:6:"result";s:1:"5";}i:8;a:2:{s:8:"tag_name";s:4:"2003";s:6:"result";s:1:"4";}i:9;a:2:{s:8:"tag_name";s:12:"屁股魔法";s:6:"result";s:1:"4";}i:10;a:2:{s:8:"tag_name";s:5:"DJ风";s:6:"result";s:1:"2";}i:11;a:2:{s:8:"tag_name";s:4:"pico";s:6:"result";s:1:"2";}i:12;a:2:{s:8:"tag_name";s:3:"SHK";s:6:"result";s:1:"2";}i:13;a:2:{s:8:"tag_name";s:12:"あらまり";s:6:"result";s:1:"1";}i:14;a:2:{s:8:"tag_name";s:12:"物語音楽";s:6:"result";s:1:"1";}i:15;a:2:{s:8:"tag_name";s:6:"030504";s:6:"result";s:1:"1";}i:16;a:2:{s:8:"tag_name";s:7:"2003年";s:6:"result";s:1:"1";}i:17;a:2:{s:8:"tag_name";s:7:"Jimangu";s:6:"result";s:1:"1";}i:18;a:2:{s:8:"tag_name";s:12:"備案完成";s:6:"result";s:1:"1";}i:19;a:2:{s:8:"tag_name";s:6:"同人";s:6:"result";s:1:"1";}i:20;a:2:{s:8:"tag_name";s:6:"JIMANG";s:6:"result";s:1:"1";}i:21;a:2:{s:8:"tag_name";s:9:"pico_mary";s:6:"result";s:1:"1";}i:22;a:2:{s:8:"tag_name";s:12:"物语音乐";s:6:"result";s:1:"1";}i:23;a:2:{s:8:"tag_name";s:13:"Sound.Horizon";s:6:"result";s:1:"1";}}', 0, 0, 0, 1, 3, 13, 39, 70, 19, 17, 0, 1410, 2003, 5, 6, '2003-05-04', 19),
(19, 3, 'a:28:{i:0;a:2:{s:8:"tag_name";s:12:"SoundHorizon";s:6:"result";s:3:"105";}i:1;a:2:{s:8:"tag_name";s:7:"Aramary";s:6:"result";s:2:"23";}i:2;a:2:{s:8:"tag_name";s:4:"revo";s:6:"result";s:2:"15";}i:3;a:2:{s:8:"tag_name";s:2:"SH";s:6:"result";s:2:"11";}i:4;a:2:{s:8:"tag_name";s:4:"2003";s:6:"result";s:2:"10";}i:5;a:2:{s:8:"tag_name";s:6:"牢笼";s:6:"result";s:2:"10";}i:6;a:2:{s:8:"tag_name";s:12:"同人音乐";s:6:"result";s:1:"8";}i:7;a:2:{s:8:"tag_name";s:9:"檻の中";s:6:"result";s:1:"7";}i:8;a:2:{s:8:"tag_name";s:11:"Reloaded』";s:6:"result";s:1:"2";}i:9;a:2:{s:8:"tag_name";s:12:"罗德里赫";s:6:"result";s:1:"2";}i:10;a:2:{s:8:"tag_name";s:10:"　『Pico";s:6:"result";s:1:"2";}i:11;a:2:{s:8:"tag_name";s:8:"Reloaded";s:6:"result";s:1:"1";}i:12;a:2:{s:8:"tag_name";s:7:"Jimangu";s:6:"result";s:1:"1";}i:13;a:2:{s:8:"tag_name";s:12:"あらまり";s:6:"result";s:1:"1";}i:14;a:2:{s:8:"tag_name";s:15:"第零地平线";s:6:"result";s:1:"1";}i:15;a:2:{s:8:"tag_name";s:19:"第三.五地平线";s:6:"result";s:1:"1";}i:16;a:2:{s:8:"tag_name";s:12:"物語音楽";s:6:"result";s:1:"1";}i:17;a:2:{s:8:"tag_name";s:7:"2003年";s:6:"result";s:1:"1";}i:18;a:2:{s:8:"tag_name";s:6:"030817";s:6:"result";s:1:"1";}i:19;a:2:{s:8:"tag_name";s:13:"Sound.Horizon";s:6:"result";s:1:"1";}i:20;a:2:{s:8:"tag_name";s:5:"Magic";s:6:"result";s:1:"1";}i:21;a:2:{s:8:"tag_name";s:6:"JIMANG";s:6:"result";s:1:"1";}i:22;a:2:{s:8:"tag_name";s:3:"SHK";s:6:"result";s:1:"1";}i:23;a:2:{s:8:"tag_name";s:13:"Sound_Horizon";s:6:"result";s:1:"1";}i:24;a:2:{s:8:"tag_name";s:6:"同人";s:6:"result";s:1:"1";}i:25;a:2:{s:8:"tag_name";s:12:"物语音乐";s:6:"result";s:1:"1";}i:26;a:2:{s:8:"tag_name";s:6:"暗黑";s:6:"result";s:1:"1";}i:27;a:2:{s:8:"tag_name";s:12:"同人音樂";s:6:"result";s:1:"1";}}', 0, 0, 0, 1, 1, 5, 39, 66, 36, 25, 0, 603, 2003, 8, 6, '2003-08-17', 0),
(20, 3, 'a:30:{i:0;a:2:{s:8:"tag_name";s:12:"SoundHorizon";s:6:"result";s:3:"244";}i:1;a:2:{s:8:"tag_name";s:6:"神作";s:6:"result";s:2:"73";}i:2;a:2:{s:8:"tag_name";s:12:"Chronicle2nd";s:6:"result";s:2:"58";}i:3;a:2:{s:8:"tag_name";s:7:"Aramary";s:6:"result";s:2:"44";}i:4;a:2:{s:8:"tag_name";s:7:"REVO神";s:6:"result";s:2:"30";}i:5;a:2:{s:8:"tag_name";s:4:"revo";s:6:"result";s:2:"29";}i:6;a:2:{s:8:"tag_name";s:2:"SH";s:6:"result";s:2:"28";}i:7;a:2:{s:8:"tag_name";s:21:"恨不能打更高分";s:6:"result";s:2:"27";}i:8;a:2:{s:8:"tag_name";s:11:"SH最高作";s:6:"result";s:2:"21";}i:9;a:2:{s:8:"tag_name";s:4:"2004";s:6:"result";s:2:"11";}i:10;a:2:{s:8:"tag_name";s:13:"Sound_Horizon";s:6:"result";s:1:"9";}i:11;a:2:{s:8:"tag_name";s:12:"同人音乐";s:6:"result";s:1:"8";}i:12;a:2:{s:8:"tag_name";s:6:"史诗";s:6:"result";s:1:"2";}i:13;a:2:{s:8:"tag_name";s:2:"~~";s:6:"result";s:1:"2";}i:14;a:2:{s:8:"tag_name";s:15:"霜月はるか";s:6:"result";s:1:"2";}i:15;a:2:{s:8:"tag_name";s:6:"同人";s:6:"result";s:1:"2";}i:16;a:2:{s:8:"tag_name";s:18:"叙事史诗组曲";s:6:"result";s:1:"1";}i:17;a:2:{s:8:"tag_name";s:13:"Sound.Horizon";s:6:"result";s:1:"1";}i:18;a:2:{s:8:"tag_name";s:9:"伪中庸";s:6:"result";s:1:"1";}i:19;a:2:{s:8:"tag_name";s:12:"物語音楽";s:6:"result";s:1:"1";}i:20;a:2:{s:8:"tag_name";s:11:"2004年3月";s:6:"result";s:1:"1";}i:21;a:2:{s:8:"tag_name";s:9:"中世纪";s:6:"result";s:1:"1";}i:22;a:2:{s:8:"tag_name";s:12:"物语音乐";s:6:"result";s:1:"1";}i:23;a:2:{s:8:"tag_name";s:15:"未观看原作";s:6:"result";s:1:"1";}i:24;a:2:{s:8:"tag_name";s:14:"Sound·Horizon";s:6:"result";s:1:"1";}i:25;a:2:{s:8:"tag_name";s:12:"あらまり";s:6:"result";s:1:"1";}i:26;a:2:{s:8:"tag_name";s:6:"040319";s:6:"result";s:1:"1";}i:27;a:2:{s:8:"tag_name";s:3:"∞";s:6:"result";s:1:"1";}i:28;a:2:{s:8:"tag_name";s:6:"物语";s:6:"result";s:1:"1";}i:29;a:2:{s:8:"tag_name";s:6:"JIMANG";s:6:"result";s:1:"1";}}', 0, 0, 0, 2, 3, 13, 36, 95, 126, 171, 0, 48, 2004, 3, 5, '2004-03-19', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 08, 2021 at 06:56 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

--
-- Dumping data for table `chii_subject_relations`
--

INSERT INTO `chii_subject_relations` (`rlt_subject_id`, `rlt_subject_type_id`, `rlt_relation_type`, `rlt_related_subject_id`, `rlt_related_subject_type_id`, `rlt_vice_versa`, `rlt_order`) VALUES
(1, 1, 1, 296317, 4, 1, 0),
(4, 4, 4002, 9944, 4, 1, 0),
(4, 4, 4006, 9950, 4, 1, 0),
(6, 4, 4099, 108488, 4, 1, 0),
(6, 4, 4002, 121872, 4, 1, 0),
(7, 4, 4002, 248786, 4, 1, 0),
(8, 2, 1, 344, 4, 1, 0),
(8, 2, 2, 793, 2, 1, 0),
(8, 2, 1004, 1081, 1, 1, 0),
(8, 2, 3001, 3219, 3, 1, 6),
(8, 2, 3004, 8813, 3, 1, 4),
(8, 2, 3003, 8816, 3, 1, 1),
(8, 2, 3003, 8817, 3, 1, 2),
(8, 2, 3099, 8819, 3, 1, 15),
(8, 2, 3001, 8820, 3, 1, 5),
(8, 2, 3004, 17967, 3, 1, 3),
(8, 2, 8, 24593, 2, 1, 0),
(8, 2, 3002, 32214, 3, 1, 7),
(8, 2, 7, 33389, 4, 1, 0),
(8, 2, 11, 35866, 2, 1, 0),
(8, 2, 3007, 51042, 3, 1, 14),
(8, 2, 1005, 73715, 1, 1, 0),
(8, 2, 7, 78546, 4, 1, 0),
(8, 2, 7, 91493, 4, 1, 0),
(8, 2, 4, 99952, 2, 1, 0),
(8, 2, 7, 102098, 4, 1, 0),
(8, 2, 1, 110909, 1, 1, 0),
(8, 2, 3007, 118733, 3, 1, 8),
(8, 2, 3007, 118734, 3, 1, 9),
(8, 2, 3007, 118735, 3, 1, 10),
(8, 2, 3007, 118736, 3, 1, 11),
(8, 2, 3007, 118737, 3, 1, 12),
(8, 2, 3007, 118738, 3, 1, 13),
(8, 2, 1004, 120756, 1, 1, 0),
(8, 2, 1004, 120758, 1, 1, 0),
(8, 2, 7, 141050, 4, 1, 0),
(8, 2, 1004, 188684, 1, 1, 0),
(8, 2, 1004, 188685, 1, 1, 0),
(8, 2, 10, 199229, 2, 1, 1),
(8, 2, 10, 199230, 2, 1, 2),
(8, 2, 10, 199231, 2, 1, 3),
(8, 2, 11, 231875, 1, 1, 0),
(8, 2, 11, 231876, 1, 1, 0),
(8, 2, 7, 231982, 4, 1, 0),
(8, 2, 1, 231989, 4, 1, 0),
(8, 2, 3002, 237827, 3, 1, 0),
(8, 2, 3099, 239861, 3, 1, 0),
(8, 2, 1, 306532, 4, 1, 0),
(8, 2, 1, 309324, 4, 1, 0),
(8, 2, 7, 321523, 4, 1, 0),
(9, 4, 4002, 949, 4, 1, 0),
(9, 4, 4003, 20482, 4, 1, 0),
(9, 4, 4003, 138435, 4, 1, 0),
(10, 1, 1004, 497, 1, 1, 0),
(11, 1, 1004, 12, 2, 1, 0),
(11, 1, 1002, 497, 1, 1, 0),
(12, 2, 1004, 11, 1, 1, 0),
(12, 2, 1, 497, 1, 1, 0),
(12, 2, 3003, 4989, 3, 1, 0),
(12, 2, 3002, 4990, 3, 1, 0),
(12, 2, 3001, 4991, 3, 1, 0),
(12, 2, 3001, 4992, 3, 1, 0),
(12, 2, 3004, 4993, 3, 1, 0),
(12, 2, 3004, 4994, 3, 1, 0),
(12, 2, 3099, 4995, 3, 1, 0),
(12, 2, 6, 57933, 2, 1, 0),
(12, 2, 11, 62538, 4, 1, 0),
(12, 2, 3007, 95057, 3, 1, 0),
(12, 2, 3007, 95058, 3, 1, 0),
(12, 2, 3007, 95059, 3, 1, 0),
(12, 2, 3007, 95060, 3, 1, 0),
(12, 2, 3007, 95062, 3, 1, 0),
(13, 4, 1, 51, 2, 1, 0),
(13, 4, 3001, 616, 3, 1, 0),
(13, 4, 1, 876, 2, 1, 0),
(13, 4, 3005, 1640, 3, 1, 0),
(13, 4, 4006, 3660, 4, 1, 0),
(13, 4, 1, 3686, 2, 1, 0),
(13, 4, 3006, 4113, 3, 1, 0),
(13, 4, 4006, 6312, 4, 1, 0),
(13, 4, 4006, 7970, 4, 1, 0),
(13, 4, 1, 37874, 2, 1, 0),
(13, 4, 3099, 56235, 3, 1, 0),
(13, 4, 3007, 76615, 3, 1, 0),
(13, 4, 3007, 76707, 3, 1, 0),
(13, 4, 3007, 76708, 3, 1, 0),
(13, 4, 3007, 76709, 3, 1, 0),
(13, 4, 3007, 76891, 3, 1, 0),
(13, 4, 4099, 128109, 4, 1, 0),
(13, 4, 1, 149014, 1, 1, 0),
(13, 4, 1, 167599, 1, 1, 0),
(13, 4, 1004, 225966, 1, 1, 0),
(13, 4, 3099, 270757, 3, 1, 0),
(13, 4, 4007, 272535, 4, 1, 0),
(13, 4, 4007, 311725, 4, 1, 0),
(13, 4, 1004, 318972, 1, 1, 0),
(13, 4, 3099, 322168, 3, 1, 0),
(13, 4, 4007, 333598, 2, 1, 0),
(14, 4, 4002, 1501, 4, 1, 0),
(14, 4, 3001, 12430, 3, 1, 0),
(14, 4, 4006, 56682, 4, 1, 0),
(14, 4, 3006, 60472, 3, 1, 0),
(14, 4, 1, 102829, 1, 1, 0),
(14, 4, 1004, 130980, 1, 1, 0),
(14, 4, 4099, 130994, 1, 1, 0),
(14, 4, 4099, 314492, 1, 1, 0),
(16, 3, 3099, 127500, 3, 1, 0),
(17, 3, 3099, 127500, 3, 1, 0),
(19, 3, 3099, 127500, 3, 1, 0),
(20, 3, 3099, 127500, 3, 1, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 08, 2021 at 06:57 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

--
-- Dumping data for table `chii_subject_relations`
--

INSERT INTO `chii_subject_relations` (`rlt_subject_id`, `rlt_subject_type_id`, `rlt_relation_type`, `rlt_related_subject_id`, `rlt_related_subject_type_id`, `rlt_vice_versa`, `rlt_order`) VALUES
(497, 1, 1004, 10, 1, 1, 0),
(497, 1, 1, 12, 2, 1, 0),
(4994, 3, 3004, 12, 2, 1, 0),
(4992, 3, 3001, 12, 2, 1, 0),
(4991, 3, 3001, 12, 2, 1, 0),
(4990, 3, 3002, 12, 2, 1, 0),
(4989, 3, 3003, 12, 2, 1, 0),
(876, 2, 1, 13, 4, 1, 0),
(51, 2, 1, 13, 4, 1, 0),
(1640, 3, 3005, 13, 4, 1, 0),
(616, 3, 3001, 13, 4, 1, 0),
(3660, 4, 4012, 13, 4, 1, 0),
(56682, 4, 4012, 14, 4, 1, 0),
(1501, 4, 4003, 14, 4, 1, 0),
(12430, 3, 3001, 14, 4, 1, 0),
(24593, 2, 8, 8, 2, 1, 0),
(8819, 3, 3099, 8, 2, 1, 0),
(8820, 3, 3001, 8, 2, 1, 0),
(3219, 3, 3001, 8, 2, 1, 0),
(6312, 4, 4012, 13, 4, 1, 0),
(199231, 2, 10, 8, 2, 1, 0),
(141, 4, 4002, 13, 4, 1, 0),
(35866, 2, 12, 8, 2, 1, 0),
(3686, 2, 1, 13, 4, 1, 0),
(110909, 1, 1, 8, 2, 1, 0),
(344, 4, 1, 8, 2, 1, 0),
(4113, 3, 3006, 13, 4, 1, 0),
(8817, 3, 3003, 8, 2, 1, 0),
(8816, 3, 3003, 8, 2, 1, 0),
(8813, 3, 3004, 8, 2, 1, 0),
(32214, 3, 3002, 8, 2, 1, 0),
(56235, 3, 3099, 13, 4, 1, 3),
(57933, 2, 12, 12, 2, 1, 0),
(55261, 3, 3003, 12, 2, 1, 0),
(949, 4, 4003, 9, 4, 1, 0),
(20482, 4, 4002, 9, 4, 1, 0),
(73715, 1, 1006, 8, 2, 1, 0),
(37874, 2, 1, 13, 4, 1, 0),
(4993, 3, 3004, 12, 2, 1, 0),
(95057, 3, 3007, 12, 2, 1, 0),
(95058, 3, 3007, 12, 2, 1, 0),
(95059, 3, 3007, 12, 2, 1, 0),
(95060, 3, 3007, 12, 2, 1, 0),
(95062, 3, 3007, 12, 2, 1, 0),
(4995, 3, 3099, 12, 2, 1, 0),
(51042, 3, 3007, 8, 2, 1, 0),
(99952, 2, 5, 8, 2, 1, 0),
(17967, 3, 3004, 8, 2, 1, 0),
(118733, 3, 3007, 8, 2, 1, 0),
(118734, 3, 3007, 8, 2, 1, 0),
(118735, 3, 3007, 8, 2, 1, 0),
(118736, 3, 3007, 8, 2, 1, 0),
(118737, 3, 3007, 8, 2, 1, 0),
(118738, 3, 3007, 8, 2, 1, 0),
(120756, 1, 1004, 8, 2, 1, 0),
(120758, 1, 1004, 8, 2, 1, 0),
(7970, 4, 4012, 13, 4, 1, 0),
(121872, 4, 4003, 6, 4, 1, 0),
(128109, 4, 4099, 13, 4, 1, 0),
(102098, 4, 7, 8, 2, 1, 0),
(91493, 4, 7, 8, 2, 1, 0),
(102829, 1, 1, 14, 4, 1, 0),
(130980, 1, 1004, 14, 4, 1, 0),
(60472, 3, 3006, 14, 4, 1, 0),
(130994, 1, 4099, 14, 4, 1, 0),
(127500, 3, 3099, 16, 3, 1, 2),
(127500, 3, 3099, 19, 3, 1, 0),
(127500, 3, 3099, 20, 3, 1, 1),
(127500, 3, 3099, 17, 3, 1, 3),
(76615, 3, 3007, 13, 4, 1, 0),
(76707, 3, 3007, 13, 4, 1, 0),
(76708, 3, 3007, 13, 4, 1, 0),
(76709, 3, 3007, 13, 4, 1, 0),
(76891, 3, 3007, 13, 4, 1, 0),
(62538, 4, 12, 12, 2, 1, 0),
(149014, 1, 1, 13, 4, 1, 0),
(1081, 1, 1004, 8, 2, 1, 0),
(167599, 1, 1, 13, 4, 1, 0),
(188685, 1, 1004, 8, 2, 1, 0),
(188684, 1, 1004, 8, 2, 1, 0),
(793, 2, 3, 8, 2, 1, 0),
(199230, 2, 10, 8, 2, 1, 0),
(231875, 1, 12, 8, 2, 1, 0),
(231876, 1, 12, 8, 2, 1, 0),
(231989, 4, 1, 8, 2, 1, 0),
(231982, 4, 7, 8, 2, 1, 13),
(9944, 4, 4003, 4, 4, 1, 0),
(199229, 2, 10, 8, 2, 1, 0),
(237827, 3, 3002, 8, 2, 1, 2),
(239861, 3, 3099, 8, 2, 1, 0),
(248786, 4, 4003, 7, 4, 1, 0),
(225966, 1, 1004, 13, 4, 1, 0),
(272535, 4, 4007, 13, 4, 1, 0),
(270757, 3, 3099, 13, 4, 1, 0),
(306532, 4, 1, 8, 2, 1, 0),
(309324, 4, 1, 8, 2, 1, 0),
(314492, 1, 4099, 14, 4, 1, 3),
(318972, 1, 1004, 13, 4, 1, 0),
(321523, 4, 7, 8, 2, 1, 0),
(322168, 3, 3099, 13, 4, 1, 0),
(108488, 4, 4099, 6, 4, 1, 0),
(296317, 4, 1, 1, 1, 1, 0),
(333598, 2, 4007, 13, 4, 1, 3),
(33389, 4, 7, 8, 2, 1, 0),
(78546, 4, 7, 8, 2, 1, 0),
(141050, 4, 7, 8, 2, 1, 0),
(311725, 4, 4007, 13, 4, 1, 0),
(9950, 4, 4012, 4, 4, 1, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 08, 2021 at 06:54 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

--
-- Dumping data for table `chii_subjects`
--

INSERT INTO `chii_subjects` (`subject_id`, `subject_type_id`, `subject_name`, `subject_name_cn`, `subject_uid`, `subject_creator`, `subject_dateline`, `subject_image`, `subject_platform`, `field_infobox`, `field_summary`, `field_5`, `field_volumes`, `field_eps`, `subject_wish`, `subject_collect`, `subject_doing`, `subject_on_hold`, `subject_dropped`, `subject_series`, `subject_series_entry`, `subject_idx_cn`, `subject_airtime`, `subject_nsfw`, `subject_ban`) VALUES
(1, 1, '第一次的親密接觸', '第一次的亲密接触', '9789861733432', 2, 1216020688, 'c4/ca/1_EcYzQ.jpg', 1002, '{{Infobox animanga/Novel\r\n|中文名= 第一次的亲密接触\r\n|别名={\r\n}\r\n|出版社= 紅色文化、知识出版社\r\n|价格= NT$160\r\n|连载杂志= \r\n|发售日= 1998-09-25\r\n|册数= \r\n|页数= 188\r\n|话数= \r\n|ISBN= 9577086705\r\n|其他= \r\n|作者= 蔡智恒\r\n}}', '　　風靡華人世界的網戀小說經典，暢銷紀錄超過百萬冊！\r\n　　有最初的《第一次的親密接觸》，才有今日網路文學。\r\n　　蔡智恆的最新作品《暖暖》，提升你的戀愛幸福溫度。\r\n　　紀念版收錄蔡智恆醞釀十年，最溫柔的純愛萬語宣言。\r\n　　PH值小於7的微酸心情，讓十年後的痞子蔡告訴你。\r\n　　一場最美麗的網路解逅，當痞子蔡遇見輕舞飛揚……\r\n　　蔡智恆最真實的情感原點\r\n　　痞子蔡與輕舞飛揚一起記錄的甜蜜日子\r\n　　一則發生在成大校園的純愛故事，網路上一再被轉載的熱門小說。', '　　蔡智恆\r\n　　BBS的ID為jht，網路上的暱稱是痞子蔡。\r\n　　1969年生於台灣嘉義縣，成功大學水利工程博士。\r\n　　1998年於BBS發表第一部小說《第一次的親密接觸》，造成全球華文地區的痞子蔡熱潮。\r\n　　自此以後，左腦創作小說，右腦書寫學術論文，獨樹一格。\r\n　　現任教於立德管理學院。', 0, 0, 13, 105, 1, 3, 3, 0, 0, 'd', 0, 0, 0),
(2, 3, '坟场', '', '', 2, 1216021625, '9b/e7/59392_05W7s.jpg', 0, '|出版社= カゲキヤ出版\n|价格= ¥330\n|连载杂志= カゲキヤコミック\n|发售日= 2017-07-20\n|页数= 32\n|作者= 松波留美 赤髭\n}}', '可能由以下原因导致条目合并至此处：\r\n【三次元】非欧美剧，非日剧，非华语剧\r\n【动画】同人视频；网友自制视频(游戏实况·攻略·解说，MAD/MV等)\r\n【书籍】同人本，与ACG无关的书籍等\r\n【音乐】BD/DVD条目，尚未发行CD版本；与ACG或剧集无关的音乐条目\r\n【游戏】已存在包含某平台游戏的条目等\r\n【其他】个人自创条目；无法查询来源的未知条目\r\n\r\n如您有意见请到WIKI小组 (http://bangumi.tv/group/wiki) 讨论，谢谢！', '', 0, 0, 109, 531, 48, 18, 19, 0, 0, 'f', 0, 0, 2),
(3, 2, 'スカイ・クロラ', '空中杀手', 'tt1056437', 2, 1216022271, 'ec/cb/3_SRc8z.jpg', 3, '{{Infobox animanga/Movie\r\n|中文名=空中杀手\r\n|导演=押井守\r\n|编剧=伊藤ちひろ / 伊藤千寻\r\n|上映年度=2008-09-03\r\n|片长= \r\n|原作=森 博嗣\r\n|官方网站=http://wwws.warnerbros.co.jp/skycrawlers/\r\n|企画=\r\n|脚本=\r\n|分镜=\r\n|演出=\r\n|人物设定=\r\n|作画监督=\r\n|机械设定=\r\n|音乐=\r\n|其他= \r\n|Copyright= \r\n}}', '战斗机飞行员函南优一（cv:加濑亮）来到基地报道，等待他的是全新的生活环境与熟悉的飞行战斗。在这里，函南优一遇到了各式各样的战友，与不苟言笑的长官草薙水素（cv:菊地凛子）。函南优一获得了一架新战斗机，但是，基地里的战友们都对战斗机的前任驾驶员缄默不语。于是函南优一开始留意相关的消息，他渐渐知道，前任驾驶员已经去世，而事件本身与草薙水素有莫大的关系。随着调查的深入，函南优一逐渐发现惊人的真相，而他每天与敌人的战斗，似乎也隐藏着他不知道的意义。 ', '', 0, 0, 0, 18, 2, 0, 0, 0, 0, 'k', 0, 0, 1),
(4, 4, 'メタルスラッグ7', '合金弹头7', '', 2, 1216022721, 'a8/7f/4_cMMK5.jpg', 5, '{{Infobox Game\r\n|中文名= 合金弹头7\r\n|别名={\r\n[Metal Slug 7]\r\n}\r\n|平台= NDS\r\n|游戏类型= ACT\r\n|游戏引擎= \r\n|游玩人数= 1人\r\n|发行日期= 2008-07-17\r\n|售价= 5040円\r\n|website= \r\n|开发= SNKプレイモア\r\n|发行= SNKプレイモア\r\n}}', '　　以细腻的画风、搞笑的动作和刺激的战斗被人们所熟知的“合金弹头系列”在NDS 平台推出正统续作！虽然本系列的前几部作品最早都是作为街机游戏而推出的，不过这一次的“7”不但先推出NDS版，而且是独占！日前SNK playmore宣布了这款游戏，目前发售日定为2008年3月。据称，本作中将搭载任务模式，在关卡中不断完成教官所下达的任务，提升军衔。\r\n　　游戏依然保持了系列一贯的风格，战斗的场面也没有因为是掌机游戏而进行削减，游戏依然是射击、跳跃和手雷三个按键，虽然是NDS游戏，不过本作却并不对应触摸屏，游戏的画面显示在上屏幕，而下屏幕则用来显示地图。在TGS 2007（Tokyo Game Show）大会上SNK放出了《合金弹头7》的试玩版。这代产品沿袭了前代风格，战斗的对象似乎也没有多大变化，没有分支路线，不过游戏性和关卡设计却不比前几代差，关卡数也有7关，另外还增加了一种武器。', 'a:1:{i:0;s:1:"5";}', 0, 0, 21, 197, 6, 5, 4, 0, 0, 'h', 0, 0, 0),
(5, 4, 'Call of Duty 4', '使命召唤 4: 现代战争', '', 4, 1216024610, 'e4/da/5_wUARf.jpg', 4, '', '由Infinity Ward制作、Activision 发行的第一人称射击游戏《使命召唤 4(Call of Duty 4：Modern Warfare)》，跳脱二次世界大战战场，将前线拉回到现代战争中。\r\n\r\n\r\n游戏特点：\r\n\r\n*紧张激烈的游戏场景，次世代画面效果，跌宕起伏的单人游戏剧情\r\n*玩家将扮演美国海军陆战队以及英国皇家特种空勤团和士兵进行游戏\r\n*连线游戏引入经验及成就设定，可玩性较之前代大为提高', 'a:3:{i:0;s:1:"4";i:1;s:1:"8";i:2;s:1:"9";}', 0, 0, 1, 36, 1, 3, 0, 0, 0, 's', 0, 0, 1),
(6, 4, 'Team Fortress 2', '军团要塞2', '', 4, 1216025173, '16/79/6_gC3iJ.jpg', 0, '{{Infobox Game\r\n|中文名= 军团要塞2\r\n|别名={\r\n[絕地要塞2]\r\n}\r\n|平台={\r\n[Xbox 360]\r\n[PS3]\r\n[PC]\r\n}\r\n|游戏类型= FPS\r\n|游戏引擎= Source 引擎\r\n|游玩人数= 多人\r\n|发行日期= 2007年10月10日\r\n|售价= 免費\r\n|website= \r\n|游戏开发商= Valve Corporation\r\n|游戏出版商= Valve Corporation\r\n|发行商= Electronic Arts (retail) , Steam (online)\r\n|游戏设计师= John Cook , Robin Walker\r\n|官方网站= http://teamfortress.com/\r\n}}', '　　《军团要塞2》（Team Fortress 2，简称TF2）是由维尔福软件公司开发的一个团队作战型在线多人第一人称射击游戏。该游戏是维尔福先前《军团要塞》（Team Fortress Classic）的续作，于2007年10月10日以橙盒（The Orange Box）三合一方式在Windows和Xbox 360平台上首次发行。PlayStation 3版紧接着在2007年11月22日发行。TF2后来在2008年4月9日在Windows上发行单行版。TF2在线下载版是由Steam负责，而零售版则由美国艺电发行。该游戏的开发是由罗宾·沃克（Ribin Walker）及约翰·库克（John Cook）所领导，他们两位是1996年给雷神之锤使用的军团要塞模组原始设计师。\r\n　　TF2开发计划早在1998年就已发布，采用维尔福的GoldSrc引擎，然而自那时起便经历了种种的设计概念变化。在1999年公开的截图显示，该游戏外观脱离其前代TF设计转而追求更真实更军事化的游戏元素；然而设计在其9年开发期间不断的变化。最终成品采用了深受J. C. 莱安德克（Joseph Christian Leyendecker）、迪恩·康沃尔（Dean Cornwell）及诺曼·洛克威尔（Norman Rockwell）艺术影响的卡通视觉效果，并由Source引擎所支持。游戏本身围绕在由9种个性独立鲜明职业组成的两组人马，于谍对谍的场景下进行种种模式的战斗。\r\n　　由于有6年游戏开发信息付之阙如或无显著进展，导致该游戏一度被贴上雾件的标签。且还是Wired News年度雾件名单里的常客，与其他业界耻辱并列成受取笑的对象。随着该游戏的发行，TF2就其游戏图形、平衡性、喜剧幽默、与专为多人游戏设计的完整人物个性等特色而受到诸多好评及奖项。', 'a:3:{i:0;s:1:"4";i:1;s:1:"8";i:2;s:1:"9";}', 0, 0, 20, 203, 25, 14, 12, 0, 0, 'j', 0, 0, 0),
(7, 4, 'Unreal Tournament 3', '虚幻竞技场3', '', 4, 1216026819, '8f/14/7_gQPtW.jpg', 0, '{{Infobox Game\r\n|中文名= 虚幻竞技场3\n|平台={\n[Mac OS]\n[xbox360]\n[windows]\n[PS3]\n}\n|游戏类型= FPS\n|发行日期= 2007年11月19日\n}}', '　　《虚幻竞技场3》（Unreal Tournament 3，UT3）是由Epic Games所开发的第一人称射击游戏，是继虚幻II之后的新一代虚幻游戏，由Midway Games于2007年11月19日发行PC Windows版本，PS3版则在2007年12月10日发行，Mac OS X与XBox 360的版本则将在2008年发售。\r\n　　《虚幻竞技场3》是浴血战场系列的第四套游戏，也是虚幻系列的第八套，《虚幻竞技场》（UT99）使用虚幻引擎（Unreal Engine 1.0），而《虚幻竞技场2003》（UT2003）及《虚幻竞技场2004》（UT2004）使用虚幻引擎2（Unreal Engine 2.0），本游戏则使用虚幻引擎3（Unreal Engine 3.0），因为UT2004大量地重复使用UT2003的内容与架构，所以UT3应该被归为本系列的第三代游戏。', 'a:3:{i:0;s:1:"4";i:1;s:1:"8";i:2;s:1:"9";}', 0, 0, 4, 63, 0, 1, 4, 0, 0, 'x', 0, 0, 0),
(8, 2, 'コードギアス 反逆のルルーシュR2', 'Code Geass 反叛的鲁路修R2', '', 4916, 1216030250, 'c9/f0/8_wK0z3.jpg', 1, '{{Infobox animanga/TVAnime\r\n|中文名= Code Geass 反叛的鲁路修R2\r\n|别名={\r\n[叛逆的鲁路修R2]\r\n[Code Geass: Hangyaku no Lelouch R2]\r\n[叛逆的勒鲁什R2]\r\n[叛逆的鲁鲁修R2]\r\n[コードギアス 反逆のルルーシュR2]\r\n[Code Geass: Lelouch of the Rebellion R2]\r\n[叛逆的勒路什R2]\r\n}\r\n|话数= 25\r\n|放送开始= 2008年4月6日\r\n|放送星期= \r\n|官方网站= http://www.geass.jp/r2/\r\n|播放电视台= 每日放送\r\n|其他电视台= \r\n|播放结束= 2008年9月28日\r\n|其他= \r\n|Copyright= （C）2006 SUNRISE inc./MBS\r\n|导演= 谷口悟朗\r\n|系列构成= 大河内一楼\r\n|人物原案= CLAMP\r\n|人物设定= 木村貴宏\r\n|美术监督= 菱沼由典\r\n|色彩设计= 岩沢れい子\r\n|摄影监督= 大矢創太\r\n|音响监督= 浦上靖夫、井澤基\r\n|音乐= 中川幸太郎、黒石ひとみ\r\n|音乐制作= AUDIO PLANNING U\r\n|动画制作= サンライズ\r\n}}', '　　“东京决战”一年后，布里塔尼亚少年鲁路修在11区（原日本国）过着平凡的学生生活。但是，鲁路修与弟弟罗洛的一次出行，遇到了黑色骑士团的余党。在与少女C.C再次结成契约之后，尘封的记忆摆在了鲁路修的面前。\r\n　　身为帝国王子的鲁路修，为了建立人人平等的世界、让妹妹娜娜丽幸福的世界，而使用GEASS，令人绝对服从的力量，带领黑色骑士团向帝国宣战。带上假面化名ZERO的他，却在一年前的“东京决战”中被好友朱雀击败，被帝国皇帝抹去了记忆。\r\n　　现在，恢复记忆的鲁路修不仅要面对帝国的强大军事力量，更要面对虚假的弟弟罗洛、失踪的妹妹娜娜丽、不知敌友的中华联盟、内部出现分歧的黑色骑士团。面对内忧外患，鲁路修走上了GEASS之力的诅咒——孤独的王之路。 ', '', 0, 25, 622, 13216, 147, 224, 115, 0, 0, 'c', 0, 0, 0),
(9, 4, 'リズム天国ゴールド', '节奏天国 金', '', 2, 1216038051, '45/c4/9_ppLN8.jpg', 5, '{{Infobox Game\r\n|中文名= 节奏天国 金\r\n|别名={\r\n}\r\n|平台= NDS\r\n|游戏类型= MUG\r\n|游戏引擎= \r\n|游玩人数= 1\r\n|发行日期= 2008-07-31\r\n|售价= 3800日元\r\n|website= http://www.nintendo.co.jp/ds/ylzj/\r\n|游戏开发商= \r\n|发行商= \r\n|游戏设计师= つんく♂\r\n}}', 'GBA人气音乐游戏《节奏天国》的续作，收录多彩迷你游戏约50种。前作《节奏天国》采用按键操作，登陆NDS的续作将采用触控笔操作。 ', 'a:1:{i:0;s:1:"5";}', 0, 0, 32, 335, 36, 22, 13, 0, 0, 'j', 0, 0, 0),
(10, 1, 'Your Eyes Only ちぃフォトグラフィクス', '', '4063346706', 1, 1216038761, 'd3/d9/10_mXv4D.jpg', 1003, '{{Infobox animanga/Book\r\n|中文名= \r\n|别名={\r\n}\r\n|出版社= 講談社\r\n|价格= \r\n|其他出版社= \r\n|连载杂志= \r\n|发售日= 2003-01\r\n|页数= \r\n|ISBN= 9784063346701\r\n|其他= \r\n|作者= CLAMP\r\n}}', 'ちぃのベストショット満載！！\r\nファン待望の『ちょびっツ』原画集\r\n\r\n『ちょびっツ』連載開始から2年。\r\nヤンマガはもとより、グッズやCD、DVD等に描きおろされたイラストの中から、フォトジェニックなちぃを集めて一冊の原画集にします！\r\nちぃのかわいさがぎっしりつまった画集、買い逃し厳禁だ！', '', 0, 0, 13, 41, 0, 0, 1, 0, 0, 'y', 0, 0, 0),
(11, 1, 'ちょびっツの「ツ」の字 - Chobits Fan Book', '', '4063346692', 1, 1216039102, '65/12/11_bsxG3.jpg', 1003, '{{Infobox animanga/Book\r\n|中文名= \r\n|别名={\r\n[Chobits动画资料集]\r\n[人形电脑天使心 动画资料集]\r\n}\r\n|出版社= 講談社\r\n|价格= \r\n|其他出版社= \r\n|连载杂志= \r\n|发售日= 2003-03\r\n|页数= 138\r\n|ISBN= 4063346692\r\n|其他= \r\n|作者= CLAMP\r\n}}', '原作版 ちょびっツ ファンブック\r\n全88章からなる＜ちぃ＞と＜本須和＞の物語。\r\nその軌跡と魅力を徹底検証！！\r\n\r\nCLAMPの画集未収録イラスト、気鋭のクリエーター10名による競作イラスト、関係者インタビュー、作品論、公式グッズカタログほか 必見コンテンツ満載！！\r\n\r\n特別付録 原作版トレーディングカード×2枚', '', 0, 0, 10, 22, 0, 0, 0, 0, 497, 'c', 0, 0, 0),
(12, 2, 'ちょびっツ', '人形电脑天使心', 'tt0326672', 1, 1216040256, 'c2/0a/12_aDoa8.jpg', 1, '{{Infobox animanga/TVAnime\r\n|中文名= 人形电脑天使心\r\n|别名={\r\n[en|Chobits]\r\n}\r\n|话数= 27\r\n|放送开始= 2002年4月2日\r\n|放送星期= 星期二\r\n|官方网站= http://www.tbs.co.jp/chobits\r\n|播放电视台= 日本TBS\r\n|其他电视台= \r\n|播放结束= 2002年9月24日\r\n|其他= \r\n|Copyright= \r\n|原作= CLAMP\r\n|导演= 浅香守生\r\n|人物设定= 阿部恒\r\n|音响监督= 三間雅文\r\n|音乐= 高浪敬太郎\r\n|动画制作= MADHOUSE\r\n|录音调整= 内田誠\r\n|音效= 小山健二\r\n|录音助手= 鳥羽瀬縁\r\n|音响助手= 三井友和\r\n|文艺= 浦畑達彦\r\n|设定制作= 加茂靖子\r\n|制片人= 源生哲雄、関戸雄一、小野達矢\r\n|制片协力= パイオニアLDC、ムービック\r\n|製作= TBS、ちょびっツ製作委員会\r\n|副导演= 田中洋之（除13）、井上英紀（仅13）\r\n}}', '在不久的将来,电子技术飞速发展,电脑成为人们生活中不可缺少的一部分.主角的名字是本须和秀树,是个19岁的少年,由于考试失败,来到东京上补习班,过着贫穷潦倒的生活……\r\n到达东京的第一天,他很幸运的在垃圾堆捡到一个人型电脑,一直以来秀树都非常渴望拥有个人电脑.当他抱着她带返公寓后,却不知如何开机,在意想不到的地方找到开关并开启后,故事就此展开\r\n本须和秀树捡到了人型计算机〔唧〕。虽然不晓得她到底是不是〔Chobits〕，但她的身上似乎藏有极大的秘密。看到秀树为了钱而烦恼，唧出去找打工，没想到却找到了危险的工作！为了让秀树开心，唧开始到色情小屋打工。但她在遭到过度激烈的强迫要求之后失控。让周遭计算机因此而强制停摆。\r\n另一方面，秀树发现好友新保与补习班的清水老师有着不可告人的关系……', '', 0, 27, 1159, 4534, 215, 463, 136, 0, 0, 'r', 0, 0, 0),
(13, 4, 'CLANNAD', '', '', 1, 1216043239, 'c5/1c/13_tQxwM.jpg', 0, '{{Infobox Game\r\n|中文名= \r\n|别名={\r\n[小镇家族]\r\n[クラナド]\r\n}\r\n|平台={\r\n[PC]\r\n[PS2]\r\n[PSP]\r\n[Xbox 360]\r\n[PS3]\r\n[Nintendo Switch]\r\n[PSV]\r\n[PS4]\r\n}\r\n|游戏类型= 恋爱ADV\r\n|游戏引擎= RealLive(PC)\r\n|游玩人数= 1\r\n|发行日期= 2004年4月28日(PC)\r\n|售价={\r\n[7,500円(税別)(PC）]\r\n[7,560円(税込)(PS2)]\r\n[6,800円(税別)(PCフルボイス)]\r\n[6,090円(税込)(PSP)]\r\n[6,720円(税込)(Xbox360)]\r\n[5,800円(税別)(PCメモリアルエディション)]\r\n[¥ 133(Steam - CLANNAD HD Edition)]\r\n}\r\n|website={\r\n[PC: http://key.visualarts.gr.jp/product/clannad/]\r\n[PS2: http://www.gunghoworks.jp/game/clannad]\r\n[PSP: http://www.prot.co.jp/psp/clannad]\r\n[Xbox360: http://www.prot.co.jp/xbox/clannad]\r\n}\r\n|其他版本={\r\n[2006年2月23日(PS2)]\r\n[2008年2月29日(PCフルボイス)]\r\n[2008年5月29日(PSP)]\r\n[2008年8月28日(Xbox360)]\r\n[2010年5月28日(PCメモリアルエディション)]\r\n[2015年11月24日(Steam - CLANNAD HD Edition)]\r\n}\r\n|游戏开发商= Key\r\n|发行= Key/ビジュアルアーツ(PC)、ガンホー・ワークス(PS2)、プロトタイプ(360/PSP/PS3)、Sekai Project(Steam)\r\n|剧本= 麻枝准(共通 / 古河渚 / 坂上智代 / 伊吹風子 / 宮沢有紀寧一部 / 相楽美佐枝 / 幸村俊夫 / AFTER STORY 担当)、魁( 藤林杏 / 藤林椋 / 宮沢有紀寧一部 / 柊勝平 担当)、涼元悠一(一ノ瀬ことみ 担当)、丘野塔也(春原兄妹 担当)\r\n}}', '季節は春、楽しく等身大で過ごす学園での日常から物語は始まり、やがてストーリーはヒロインたちとの恋愛に発展していきます。\r\n深遠な世界観を背景に語られるのはひとつの町に住む人々それぞれの思い、その先にある「生きる」ということ。\r\nその一方で、人々の思いを包み込むように存在する町そのものを幻想的なイメージで描き出していきます。\r\n-----------------------------------------------------------------------------------------------------------\r\n\r\n《CLANNAD》为2004年key社所发行的文字冒险游戏（AVG），和key社以往游戏不同的是，这款是以全年龄版PC的形式发行。CLANNAD在凯尔特语中代表的是“家族”。正如其名，这款游戏的核心价值及在描写各类的家族温暖，是个感动人心的落泪游戏。\r\n', 'a:3:{i:0;s:1:"9";i:1;s:1:"7";i:2;s:1:"6";}', 0, 0, 1103, 4027, 469, 409, 109, 0, 0, 'c', 0, 0, 0),
(14, 4, 'Metal Gear Solid 4 Guns of the Patriots', '潜龙谍影4 爱国者之枪', '', 2, 1216043502, 'aa/b3/14_FlCod.jpg', 8, '{{Infobox Game\r\n|中文名= 潜龙谍影4 爱国者之枪\r\n|别名={\r\n[メタルギアソリッド4 ガンズ・オブ・ザ・パトリオット]\r\n[潛龍諜影4 愛國者之槍]\r\n[合金装备4 爱国者之枪]\r\n}\r\n|平台= PS3\r\n|游戏类型= ACT\r\n|游戏引擎= \r\n|游玩人数= 1\r\n|发行日期= 2008年6月12日\r\n|售价= 8,800日元（日版）、99.99美元（美版）\r\n|website= http://www.konami.jp/mgs4/jp/\r\n|开发= KOJIMA PRODUCTION\r\n|发行= KONAMI\r\n|游戏设计师= 小岛秀夫\r\n}}', '2014年，在「大貝殼事件」（Metal Gear Solid 2裡面的鑽油平台事件）之後5年，武裝介入異國油田的約束開始放緩，刺激私人軍事公司Private Military Companies（PMCs）為了商業目的去進行代理戰爭，使得戰爭成為世界上的一種嶄新經濟體系。當時世界上存在著五大PMCs，分別是Praying Mantis/禱念螳螂（英國）、оцелотовая хватка/山貓鉤爪（俄羅斯）、Werewolf/狼人軍團（美國）、 Pieuvre Armement/武裝章魚（法國）、以及Raven Sword/渡鴉之劍（美國），但事實上這五大PMC背後的母公司是液體山貓所擁有的「世外方舟」（Outer Haven）。將奈米機械植入士兵體內後則對於加強士兵的管理、戰鬥能力、以及忠誠作用顯著，戰場上使用的士兵奈米機械管理系統稱為「愛國者之子」（Sons of the Patriots：SOP）。液體山貓欲利用破壞SOP引發起一場武裝破壞，且「世外方舟」已經積聚了可與美國政府匹敵的力量，世界即將落入危機，於是故事在羅伊坎貝爾請求老蛇進入中東抹殺液體山貓展開了序幕……遊戲任務在五個地方進行：中東，南美，東歐，夏德莫榭斯島，以及戰艦「Outer Haven」。　\r\n\r\n    第一章：液體的太陽/ACT.1：Liquid Sun\r\n    第二章：固體的太陽/ACT.2：Solid Sun\r\n    第三章：第三的太陽/ACT.3：Third Sun\r\n    第四章：雙子的太陽/ACT.4：Twins Sun\r\n    第五章：老雄的太陽/ACT.5：Old Sun\r\n    第六章：赤裸的太陽/ACT.6：Naked Sun\r\n    尾聲：赤裸的原罪/Epilogue：Naked Sin', 'a:1:{i:0;s:1:"8";}', 0, 0, 161, 261, 33, 14, 8, 0, 0, 'q', 0, 0, 0),
(15, 3, 'Chronicle', '', '', 1, 1216086051, '9b/f3/15_g5Apf.jpg', 0, '{{Infobox Album\r\n|中文名= \r\n|别名={\r\n}\r\n|版本特性= \r\n|发售日期= 2001-12-30\r\n|价格= \r\n|播放时长= \r\n|录音= \r\n|碟片数量= 2\r\n|艺术家= Sound Horizon\r\n}}', '2001年12月,这张CD在ComicMarket61上以同人音乐《CIRCLE》 发表.\r\n全曲无演唱.以朴素的音符首次传递出Chronicle的理念.\r\n\r\n由于年代久远的关系,这张CD早已绝版,现在可以找到应该是重制版本(也很难找…)', '', 0, 0, 28, 388, 10, 3, 0, 0, 0, 'c', 0, 0, 0),
(16, 3, 'Thanatos', '', '', 1, 1216086168, 'c7/4d/16_iseKJ.jpg', 0, '{{Infobox Album\r\n|中文名= \r\n|别名={\r\n}\r\n|版本特性= \r\n|艺术家= Sound Horizon\r\n|发售日期= 2002-08-11\r\n|价格= \r\n|播放时长= \r\n|制作人= \r\n|发行方= \r\n|录音= \r\n|碟片数量= 1\r\n}}', '2002年8月, 在ComicMarket62上首发, Aramary作为主唱首次参加.\r\n是SH的第一张演唱专辑.', '', 0, 0, 25, 392, 10, 1, 0, 0, 0, 't', 0, 1, 0),
(17, 3, 'Lost', '', '', 1, 1216086284, '70/ef/17_fJRn9.jpg', 0, '{{Infobox Album\r\n|中文名= \r\n|别名={\r\n}\r\n|版本特性= \r\n|艺术家= Sound Horizon\r\n|发售日期= 2002-12-30\r\n|价格= \r\n|播放时长= \r\n|制作人= \r\n|发行方= \r\n|录音= \r\n|碟片数量= 1\r\n}}', '2002年 12月, 在ComicMarket63上首发。男性演唱、旁白Jimang首次参加.\r\n\r\n这张CD中不乏脍炙人口的名篇,其中第3首"恋人を射ち堕とした日"最为乐迷们津津乐道.\r\n而且全曲通过各种 寓言 和 故事 的引用,紧扣主题"忘レモノハ在リマセンカ"(有忘记了的东西吗?),耐人寻味,发人深思,实在是一张精彩的作品.', '', 0, 0, 56, 558, 21, 3, 0, 0, 0, 'l', 0, 0, 0),
(18, 3, 'Pico Magic', '', '', 1, 1216086445, '6f/49/18_SdSDy.jpg', 0, '{{Infobox Album\r\n|中文名= \r\n|别名={\r\n}\r\n|版本特性= \r\n|艺术家= Sound Horizon\r\n|发售日期= 2003-05-04\r\n|价格= \r\n|播放时长= \r\n|制作人= \r\n|发行方= \r\n|录音= \r\n|碟片数量= 1\r\n}}', '在Lost裏面以44號隱藏bonus track出場的PicoMari成爲了這張pleasure CD『Pico Magic』的主人公。其實Pico本來是指以前紅白機的那種三和弦的音樂，當時在Lost裏面Revo領主將“壊れたマリオネット”這首歌製作成爲了 pico版，所以取歌名中的マリ（mari）二字合成PicoMari一曲。之後就變成了SoundHorizon中的謎樣少女，也是Aramary的 108人格中的一個奇妙電波少女（笑）。在這張專輯中有著名的PicoMari召喚“ぴこ魔神☆（Pico魔神）”的咒文，以逆再生（即倒著播放）的形式出現在bonus track中。一時間在fans中掀起了嘗試召喚ぴこ魔神☆的熱潮（笑，可是那個track做得很詭異，fans用了很久才討論出正確的咒文，召喚ぴこ魔神☆也不是那麽簡單的事情呢~^_^）\r\n另外值得一提的是“Ark [Pico Magic Ver.]”在這張專輯中第一次露面了。被稱爲Elysion中最完美的這首Ark，從這張專輯開始就在每張專輯中以不同的編曲和長度出現，最終在樂園幻想物語組曲中達到完美版本。\r\n總體來説這張CD就是以前的一些歌曲的remake版本（除了PicoMari的兩首歌+一首隱藏bonus track+Ark是新曲以外）。\r\n封面疑似PicoMari，不過PicoMari的fans們也有認爲PicoMari另有形象的。', '', 0, 0, 13, 231, 6, 1, 0, 0, 0, 'p', 0, 0, 0),
(19, 3, 'Pico Magic Reloaded', '', '', 1, 1216086593, '1f/0e/19_GVzJ9.jpg', 0, '{{Infobox Album\r\n|中文名= \r\n|别名={\r\n}\r\n|版本特性= \r\n|艺术家= Sound Horizon\r\n|发售日期= 2003-08-17\r\n|价格= \r\n|播放时长= \r\n|制作人= \r\n|发行方= \r\n|录音= \r\n|碟片数量= 1\r\n}}', '2nd pleasure CD，『Pico Magic Reloaded』。\r\n在這張CD中，Revo領主發表了著名的“牢籠三部曲”：由基於同一旋律的三首歌曲“屋根裏の少女（閣樓中的少女）”、“檻の中の遊戯（牢籠中的遊戲）”和“檻の中の花（牢籠中的花）”組成。這三首連續的曲子講述了同一位神經錯亂的女人悲劇而恐怖的殺人舞臺劇……\r\n另外，這張專輯中也出現了“Ark [Reloaded Ver.]” 後來在LIVE時被改編成超人氣的“Jimang的世界[side:→J]”的名曲“澪音の世界”也是在這張專輯中登場的。\r\n封面上倒在前面的是Ark中的主人公Soror（妹），其他二人為Lost子和Thanatos子。', '', 0, 0, 13, 248, 4, 1, 0, 0, 0, 'p', 0, 0, 0),
(20, 3, 'Chronicle 2nd', '', '', 1, 1216086747, '98/f1/20_H2vb0.jpg', 0, '{{Infobox Album\r\n|中文名= \r\n|别名={\r\n}\r\n|版本特性= \r\n|发售日期= 2004-03-19\r\n|价格= \r\n|播放时长= 71 min\r\n|录音= \r\n|碟片数量= 1\r\n|Type= 专辑\r\n|艺术家= Sound Horizon\r\n|作曲= Revo\r\n|Discs= \r\n}}', '2003年11月,应希望「Chronicle」再次贩卖的呼声，「Chronicle 2nd」的制作发表.\r\n12月 ,在ComicMarket65上，「Chronicle 2nd」试听盘发布.\r\n直到2004年3月, 1st Story Renewal CD「Chronicle 2nd」终于正式发布.\r\n\r\n这张CD是作为SH首张CD 〈Chronicle〉的重制完整版,通过Aramary,霜月はるか, Jimang, Hazeri*,Yasrow*的声音,补完了当年CD没有声乐的空白,用唱词和旁白描述了SH音乐世界第一道地平线的故事,完整将苍红歌姬,蔷薇骑士团,诗人Ballad等等人物再现.作为SH音乐世界首个故事的完整版,这张CD具有非同一般的价值.', '', 0, 0, 65, 572, 21, 9, 3, 0, 0, 'c', 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_subjects` WRITE;
/*!40000 ALTER TABLE `chii_subjects` DISABLE KEYS */;
REPLACE INTO `chii_subjects` VALUES (253,2,'カウボーイビバップ','星际牛仔','tt0213338',85,1217549729,'c2/4c/253_t3XWb.jpg',1,'{{Infobox animanga/TVAnime\r\n|中文名= 星际牛仔\r\n|别名={\r\n[Cowboy Bebop]\r\n[宇宙牛仔]\r\n[赏金猎人]\r\n[太空牛仔]\r\n[恶男杰特]\r\n}\r\n|话数= 26\r\n|放送开始= 1998年10月23日\r\n|放送星期= 星期五\r\n|官方网站= http://www.cowboybebop.org/；http://www.cowboy-bebop.net/index.html\r\n|播放电视台= WOWOW、テレビ東京\r\n|其他电视台= \r\n|播放结束= 1999年4月23日\r\n|其他= \r\n|Copyright= \r\n|原作= 矢立肇\r\n|导演= 渡辺信一郎\r\n|脚本= 渡辺信一郎、稲荷昭彦、横手美智子、信本敬子、村井さだゆき、佐藤大、山口亮太\r\n|分镜= 渡辺信一郎、本郷みつる、飯田馬之介、都留稔幸、山内重保、森邦宏、赤根和樹、佐藤順一、武井良幸、山口祐司、佐藤育郎、岡村天斎\r\n|演出= 山田弘和、森邦宏、武井良幸、佐藤育郎\r\n|音乐= シートベルツ、菅野よう子\r\n|人物设定= 川元利浩\r\n|分镜构图= 入江泰浩\r\n|系列构成= 信本敬子\r\n|作画监督= しんぼたくろう、中田栄治、本橋秀之、菅野宏紀、逢坂浩司、小森高博、竹内浩志、川元利浩、後藤雅巳\r\n|机械设定= 山根公利\r\n|摄影监督= 大神洋一\r\n|原画= 逢坂浩司、中田栄治、後藤雅巳、小森高博、杉浦幸次、中村豊、伊藤嘉之、斎藤恒徳、鴨川浩、伊藤岳史、横山彰利、星和伸、大塚健、宮田忠明、吉田徹、川元利浩、菅野宏紀、橋本誠一、富岡隆司、井上英紀、岡真里子、津野田勝敏、入江泰浩、佐藤千春、高橋しんや、伊東伸高、高山朋浩\r\n|主题歌编曲= 菅野よう子\r\n|主题歌作曲= 菅野よう子\r\n|企画= サンライズ\r\n|制作管理= 鳥羽聡\r\n|设定= 鳥羽聡、河森正治、佐藤大\r\n|音响监督= 小林克良\r\n|特效= 長谷川敏生\r\n|制片人= 南雅彦\r\n|制作助手= BONES\r\n|动画制作= サンライズ\r\n|テレビ東京版={\r\n[1998年4月3日 - 1998年6月26日]\r\n[全12话+总集篇]\r\n}\r\n}}','       2021年，随着超光速航行技术的实现，人类得以在太阳系范围内方便的自由移动，但是由于设计上的失误，这种技术引发了月球的爆炸，无数的月球碎片被吸引向地球，造成了空前绝后的大灾难。存活下来的人类逃离地球，并开始在太阳系各地建立家园。由于这次灾难，国家、政府等权利机构都极为不稳定、治安问题也成为了一个难题。为了在人力资源不足的情况下抓捕罪犯，有些组织开始允许个人抓捕通缉的罪犯并换取奖金，“赏金猎人”这个职业也就由此诞生了。\r\n\r\n       史派克（Spike）和杰特（Jet）是驾驶飞船Bebop号在宇宙中以捉拿逃犯获取奖金为生的赏金猎人。两人在星际间的旅程中，结识了身负巨债、嗜财如命的美女菲（Faye）和电脑神童艾德（Ed），并收养了拥有高智商的数据狗爱因（Ein）。从此，四人一狗游荡在广阔之宇宙之中，在自己与他人的生活中经历著种种悲欢离合，也寻找著各自的过去。','',0,26,4293,11307,1472,700,115,0,0,'x',0,0,0),(2585,2,'とある科学の超電磁砲','某科学的超电磁炮','',2627,1252804850,'36/e7/2585_pn2eP.jpg',1,'{{Infobox animanga/TVAnime\r\n|中文名= 某科学的超电磁炮\r\n|别名={\r\n[科学超电磁炮]\r\n[科学的超电磁炮]\r\n[en|Toaru Kagaku no Railgun]\r\n}\r\n|话数= 24\r\n|放送开始= 2009年10月2日\r\n|放送星期= 星期五\r\n|官方网站= http://toaru-project.com/railgun/\r\n|播放电视台= TOKYO MX\r\n|其他电视台= テレ玉 / チバテレビ /  MBS  /  tvk  /  AT-X  /  CBC\r\n|播放结束= 2010年3月19日\r\n|其他= \r\n|Copyright= ©鎌池和馬／冬川基／アスキー・メディアワークス／PROJECT-RAILGUN\r\n|原作= 鎌池和馬＋冬川基（電撃コミックス／アスキー・メディアワークス刊）\r\n|导演= 長井龍雪\r\n|人物原案= はいむらきよたか(灰村キヨタカ)\r\n|人物设定= 田中雄一\r\n|系列构成= 水上清資\r\n|美术监督= 黒田友範\r\n|色彩设计= 安藤智美\r\n|摄影监督= 福世晋吾\r\n|剪辑= 西山茂（REAL-T）\r\n|音响监督= 明田川仁\r\n|音乐= I\'ve sound ／井内舞子\r\n|动画制作= J.C.STAFF\r\n|製作= PROJECT-RAILGUN(ジェネオン・ユニバーサル・エンタテイメント[NBCユニバーサル・エンターテイメント]、アスキー・メディアワークス、J.C.STAFF、AT-X、ムービック)\r\n|企画= 川村明廣、鈴木一智、阿部倫久、三上康博、太布尚弘\r\n|制片人= 中山信宏、峯健司、三木一馬、藤田敏、金庭こず恵；动画制片人：柏田真一郎；川瀬浩平、松倉友二、梅澤淳（制片）\r\n}}','故事发生在面积占据东京都的三分之一，居住着230万名人口且其中八成人口是学生的巨大都市“学园都市”。学园都市的所有学生均会接受超能力开发，借由药物、催眠术与通电刺激等方式取得超能力。能力者以范围和威力分为LV0至LV5。\r\n\r\n主角御坂美琴是学园都市中仅七位LV5（超能力者）的其中一人，排行第三。她是拥有操纵电击能力的“电击使”，站在电击能力的顶峰，因而被称为“超电磁炮”。\r\n\r\n本作不但通过美琴的视角来描绘学园都市的平常而不平凡的日常生活，也叙述了学园都市秘密进行非人道性质的实验，从而使大家对于本作及本篇《魔法禁书目录》的背景（世界观）的认识也慢慢变得清楚。','',0,24,727,15012,563,539,312,0,0,'m',0,0,0),(211567,2,'3月のライオン 第2シリーズ','3月的狮子 第二季','',63167,1489848627,'5c/49/211567_pGm5Q.jpg',1,'{{Infobox animanga/TVAnime\r\n|中文名= 3月的狮子 第二季\r\n|别名={\r\n[三月的狮子 第二季]\r\n[三月的狮子 2期]\r\n}\r\n|话数= 22\r\n|放送开始= 2017年10月14日\r\n|放送星期= 星期六\r\n|官方网站= http://3lion-anime.com\r\n|播放电视台= NHK総合\r\n|其他电视台= \r\n|播放结束= 2018年3月31日\r\n|其他= \r\n|Copyright= © 羽海野チカ・白泉社／「3月のライオン」アニメ製作委員会\r\n|原作= 羽海野チカ（白泉社 ヤングアニマル連載）\r\n|导演= 新房昭之\r\n|人物设定= 杉山延寛\r\n|系列构成= 新房昭之、東冨耶子\r\n|作画监督= 杉山延寛、潮月一也\r\n|製作= 「3月のライオン」アニメ製作委員会\r\n}}','这是有关各式各样的人们取回什么的温馨故事，同时也是有关斗争的故事。主人公桐山零，幼时因为意外事故失去了家人，是一个背负着沉重的孤独的17岁将棋棋士。独自居住在东京旧市镇桐山零遇见了明里、日向、桃三姐妹，少年桐山零因此发生了改变。','',0,22,2191,5823,566,303,78,0,0,'3',0,0,0),(315957,3,'原神-风与牧歌之城 City of Winds and Idylls','风与牧歌之城','',8202,1601273894,'db/c8/315957_8hX0e.jpg',0,'{{Infobox Album\r\n|中文名= 风与牧歌之城\r\n|别名={\r\n[《原神》公测纪念OST-蒙德篇]\r\n}\r\n|版本特性= Digital\r\n|发售日期= 2020-09-28\r\n|价格= \r\n|播放时长= \r\n|录音= \r\n|碟片数量= 3\r\n|厂牌= miHoYo\r\n|作曲= 陈致逸\r\n|艺术家= 陈致逸\r\n}}','《原神》公测纪念OST-蒙德篇专辑《风与牧歌之城 City of Winds and Idylls》正式上线，专辑分为《风与牧歌之城 City of Winds and Idylls》、《蒲公英的国度 the Horizon of Dandelion》与《蒙德战记 Saga of the West Wind》3张分碟，共收录63首由陈致逸@HOYO-MiX为《原神》蒙德地区创作的原声音乐。','',0,0,2,91,9,0,5,0,0,'f',0,0,0);
/*!40000 ALTER TABLE `chii_subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_subjects` WRITE;
/*!40000 ALTER TABLE `chii_subjects` DISABLE KEYS */;
REPLACE INTO `chii_subjects` VALUES (495,1,'×××HOLiC','×××HOLiC','',1,1217657840,'35/05/495_Ovvsp.jpg',1001,'{{Infobox animanga/Manga\r\n|中文名= ×××HOLiC\r\n|别名={\r\n[次元魔女]\r\n[XXXHOLIC]\r\n[xxxHOLiC]\r\n[沉迷女儿香]\r\n[×××HOLiC·笼]\r\n[xxxholic笼]\r\n[四月一日灵异事件簿]\r\n[四月一日奇妙事件薄]\r\n}\r\n|出版社={\r\n[jp|講談社]\r\n[tw|東立]\r\n}\r\n|价格= \r\n|其他出版社= \r\n|连载杂志={\r\n[週刊ヤングマガジン（2003年 - 2010年）]\r\n[別冊少年マガジン（2010年 - 2011年）]\r\n}\r\n|发售日= \r\n|册数= 19\r\n|页数= \r\n|话数= 213\r\n|ISBN= \r\n|其他= \r\n|开始= 2003年13号(週刊ヤングマガジン)\r\n|结束= 2011年3月号(別冊少年マガジン)\r\n}}','      四月一日君尋進入了別名為次元魔女並自稱為壹原侑子所擁有的能夠實現任何願望的店。侑子說只要四月一日能付出對等的代價，就可以幫助四月一日實現－「可以讓你看不見妖怪，而且，讓妖怪不受你的血所吸引」的願望。因此四月一日答應侑子的條件，侑子便讓四月一日在其店中打工作為代價，直到時數足以實現願望。\r\n\r\n      “這世上有許多不可思議的事，不管是再古怪、再稀奇的事，一旦沒有人、一旦沒有人看見、一旦與人無關的話，就只不過是現象，瞬間即逝的事...，只有，人類...才是這世上最神秘又不可思議的生物────”\r\n\r\n      “世界上有許多不可思議的事，那家店也是其中之一。那裏是能夠實現願望的店，自行停止時間的店主繼承，經手秘密委託的地點。那家店確實存在，可是不對所有生物開放。有緣時，只有有緣的生物能夠...得知、造訪、見到閉門不出的店主。”','CLAMP是日本漫画家组合，是个著名和多产的漫画家团体。作品有：华丽风格的《圣传》、《东京巴比伦》、《X》、《魔法骑士雷阿斯》；清新风格的《Wish》、《少女情怀总是诗》、《喜欢，所以喜欢》《CLOVER》、《小鸠》；童真风格的《百变小樱》、《ANGELIC LAYER 天使领域》；奇幻风格的《迷幻药局》；可爱风格的《Chobits》；少年风格的《xxxHOLiC》、《TSUBASA翼》等。',19,213,159,477,82,44,15,1,0,'',0,0,0),(497,1,'ちょびっツ','人形电脑天使心','',1,1217658146,'73/80/497_7mGTv.jpg',1001,'{{Infobox animanga/Manga\r\n|中文名= 人形电脑天使心\r\n|别名={\r\n[en|Chobits]\r\n}\r\n|出版社= 講談社、台灣東販、天下出版\r\n|价格= \r\n|其他出版社= \r\n|连载杂志= 週刊ヤングマガジン\r\n|发售日= \r\n|册数= 8\r\n|页数= \r\n|话数= 88\r\n|ISBN= \r\n|其他= \r\n|作者= CLAMP\r\n|开始= 2000年第43号\r\n|结束= 2002年第48号\r\n}}','　　故事講述重考生本須和秀樹，身無分文隻身來到東京卻想擁有一部價格昂貴的人形電腦。\r\n　　於東京，人形電腦是非常普及的家電。\r\n　　他心想「如果可在垃圾堆中撿到一部便好了」，卻如他所願在東京的一晚撿到一部人形電腦……\r\n\r\n　　本作从2000年9月至2002年10月间于日本讲谈社《周刊Young Magazine》连载。共88话。单行本全8卷。\r\n　　作品的特征之一，就是并未出现CLAMP作品中有着象征性存在的“东京铁塔”。本作与《天使领域》存在人物关联。','CLAMP是日本漫画家组合，是个著名和多产的漫画家团体。作品有：华丽风格的《圣传》、《东京巴比伦》、《X》、《魔法骑士雷阿斯》；清新风格的《Wish》、《少女情怀总是诗》、《喜欢，所以喜欢》《CLOVER》、《小鸠》；童真风格的《百变小樱》、《ANGELIC LAYER 天使领域》；奇幻风格的《迷幻药局》；可爱风格的《Chobits》；少年风格的《xxxHOLiC》、《TSUBASA翼》等。',8,88,107,521,19,19,7,1,0,'r',0,0,0),(499,1,'文学少女','文学少女','',1,1217658999,'3c/f1/499_QyAUf.jpg',1002,'{{Infobox animanga/Novel\r\n|中文名= 文学少女\r\n|别名={\r\n[Book Girl]\r\n}\r\n|出版社= エンターブレイン、尖端出版，人民文学出版社，上海文艺出版社\r\n|价格= \r\n|连载杂志= FB Online（短篇部分）\r\n|发售日= \r\n|册数= 16\r\n|页数= \r\n|话数= \r\n|ISBN= \r\n|其他= \r\n|作者= 野村美月\r\n|插图= 竹岡美穂\r\n|开始= 2006-04-28\r\n|结束= 2011-04-30\r\n}}','《文学少女》系列小说，长篇每卷皆以一部实际存在的经典小说为主线文本，推动剧情前进。故事围绕圣条学园文艺社社长天野远子和社员井上心叶的事件与解谜。小说基本上以井上心叶的第一人称进行，但不时穿插“第二某人”的第一人称口白心境（粗体字），是故事黑幕的重要提示。','野村美月是日本轻小说作家，福冈县出生，东洋大学文学部毕业，2001年出道成为作家。\r\n受《清秀佳人》、《小妇人》等少女小说影响颇深，写作主题偏向粉红色的青春喜剧。2006年，野村美月欲摆脱昔日风格，以能表现严肃、温馨又哀伤的气氛为目标，创作以文学名著贯穿全局的《文学少女》系列，获得之前未有的高度评价。\r\n\r\n竹冈美穗（7月1日 - ）是日本的插画家。东京出身。 第九回コバルトイラスト大赏得奖后，以插画家的身分出道。 小说家竹冈叶月的姊姊。',16,0,752,2285,500,167,54,1,0,'w',0,0,0);
/*!40000 ALTER TABLE `chii_subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_episodes` WRITE;
/*!40000 ALTER TABLE `chii_episodes` DISABLE KEYS */;
REPLACE INTO `chii_episodes` VALUES (519,253,1,0,0,'アステロイド・ブルース Asteroid Blues','小行星蓝调',0,'00:24:43','1998-10-23','a:7:{i:0;s:47:\"http://v.youku.com/v_show/id_XMTA4OTQyOTY=.html\";i:1;s:38:\"http://player.56.com/v_NTExMjI2MDM.swf\";i:2;s:40:\"http://www.tudou.com/v/u_252U0EERY/v.swf\";i:3;s:42:\"http://www.letv.com/ptv/vplay/1305391.html\";i:4;s:60:\"http://6.cn/player.swf?flag=0&amp;vid=hkiNB/npqSwGyGFBcXBzmg\";i:5;s:39:\"http://www.bilibili.com/video/av488321/\";i:6;s:3:\"...\";}',66,0,'脚本：信本敬子  絵コンテ：渡辺信一郎  演出：武井良幸  作画監督：川元利浩  メカ作画監督：佐野浩敏\r\n\r\n賞金首のアシモフを追うスパイクとジェット。アシモフは敵対する組織から非合法の目薬ドラッグ“ブラッディアイ”を盗み出していた。アシモフは恋人のカテリーナと共に、ブラッディアイを売り捌こうと売人のバーテンの店を訪れるが……\r\n\r\nドラッグを使用した時にアシモフが見るモノトーン調な映像やトリップ感覚を、デジタル処理で巧みに表現！',1218302619,1638731153,1,0),(7027,253,2,0,0,'野良犬のストラット Stray Dog Strut','野狗阔步',0,'00:22:17','1998-04-03','a:2:{i:0;s:40:\"http://www.tudou.com/v/Q31p9pbfa8A/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765568&amp;yid=XNTEwNDc1OTU2&amp;external=bangumi\";}',38,0,'脚本：横手美智子  絵コンテ：渡辺信一郎  演出：佐藤育郎  作画監督：竹内浩志\r\n\r\n賞金首は格闘家の連続ペット窃盗犯。なぜかスパイクたちだけでなく、動物研究所もその男の行方を追っていた……。一匹の犬を巡ってチャイナタウンで巻き起こる大騒動！\r\n\r\n第1話から一転、コミカルタッチで描かれたビバップ号の愛犬となるアインの登場秘話。音楽の使われ方も素晴らしく、スパイクのブルース・リーに関するウンチクも冴える！\r\n\r\n注：标题取自 Stray Cats 的单曲 Stray Cat Strut 。',1245507149,1629024287,1,0),(7028,253,3,0,0,'ホンキィ・トンク・ウィメン Honky Tonk Women','酒馆女郎',0,'00:24:42','1998-04-10','a:2:{i:0;s:40:\"http://www.tudou.com/v/bm3yKoPYCOg/v.swf\";i:1;s:39:\"http://www.bilibili.tv/video/av488321/#\";}',42,0,'脚本：山口亮太/信本敬子  絵コンテ：赤根和樹  演出：森邦宏  作画監督：本橋秀之  メカ作画監督：後藤雅巳\r\n\r\n一攫千金を狙ってカジノにやって来たスパイクとジェット。人違いから裏取引に巻き込まれたスパイクたちは、手にした一枚のチップをネタにカジノのオーナー、ゴードンから大金をせしめようとするが……\r\n\r\n女イカサマ師・フェイの初登場話。愛機レッドテイルを自在に操り、転んでもタダでは起きないフェイの胡散臭い魅力が爆発のエピソードです！\r\n\r\n注：标题取自 The Rolling Stones 的同名歌曲。',1245507198,1637555376,1,0),(7029,253,4,0,0,'ゲイトウェイ・シャッフル Gateway Shuffle','网关曳步舞',0,'00:24:41','1998-11-13','a:2:{i:0;s:40:\"http://www.tudou.com/v/OUB9XiOHnwM/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765571&amp;yid=XNTEwNDc1OTYw&amp;external=bangumi\";}',43,0,'脚本：村井さだゆき  絵コンテ：武井良幸  演出：武井良幸  作画監督：しんぼたくろう  メカ作画監督：後藤雅巳\r\n\r\n過激な環境保護団体「スペース・ウォリアーズ」の女リーダー、トゥインクルを捕えたスパイクだが、換金しようとした矢先、彼女の賞金が突然取り消されてしまった。渋々トゥインクルを解放するスパイク。だが、トゥインクルは報復のため位相差空間内からウイルスミサイルを発射するのだった……\r\n\r\n迫り来るミサイルとスパイクの競走は手に汗握る！\r\n\r\n注：曳步舞（Shuffle），由于发源地是澳大利亚墨尔本，故也被叫做墨尔本曳步舞（MelbourneShuffle），早期为了区分 Shuffle 这个词的多元性才加了地区的前缀，目前大多直接用 Shuffle 。曳步舞动作简洁、快速有力、节奏感强，是一种自由度很高、个性十足的舞步。结合本集内容将标题选择了这个中译。',1245507226,1632746318,1,0),(7030,253,5,0,0,'堕天使たちのバラッド Ballad Of Fallen Angels','堕天使们的抒情曲',0,'00:24:01','1998-11-20','a:2:{i:0;s:40:\"http://www.tudou.com/v/tHm4Q56CrjI/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765572&amp;yid=XNTEwNDc1OTY4&amp;external=bangumi\";}',92,0,'脚本：横手美智子  絵コンテ：渡辺信一郎  演出：渡辺哲哉  作画監督：川元利浩  メカ作画監督：後藤雅巳\r\n\r\nスパイクがレッド・ドラゴンの構成員だった頃の恩人、マオに高額の賞金がかけられた。だがそれは、スパイク抹殺のための罠だった……。マオを殺し、罠を仕掛けたのはかつての相棒、ビシャス。今、二人の対決が幕を開ける！\r\n\r\nスパイク生涯の宿敵ビシャスが初登場。オペラとハードアクションが絶妙にマッチしたクールでスタイリッシュな一本だ！',1245507250,1640337661,1,0),(7031,253,6,0,0,'恶魔を怜れむ歌 Sympathy For The Devil','给恶魔的哀怜之歌',0,'00:24:42','1998-11-27','a:2:{i:0;s:40:\"http://www.tudou.com/v/NdJexUdDqMI/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765573&amp;yid=XNTEwNDc1OTcy&amp;external=bangumi\";}',54,0,'脚本：信本敬子  絵コンテ：岡村天斎  演出：佐藤育郎  作画監督：竹内浩志  メカ作画監督：後藤雅巳\r\n\r\nスパイクたちが追う賞金首のジラフが何者かに殺された。調査を開始したスパイクは、ジラフが探していたゼブラという車椅子の男に辿り着く。だが、そこで口を開いたのはゼブラに付き添っていた少年のウェンだった……少年に隠された秘密とは？\r\n\r\nスパイクが天才少年ブルースハーピストの謎に迫る！オカルトチックなSF感溢れる奇妙な物語。\r\n\r\n注：标题取自 The Rolling Stones 的同名歌曲。',1245507269,1636558342,1,0),(7032,253,7,0,0,'ヘヴィ・メタル・クイーン Heavy Metal Queen','重金属皇后',0,'00:24:42','1998-04-17','a:2:{i:0;s:40:\"http://www.tudou.com/v/Z1edXjWyL14/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765574&amp;yid=XNTEwNDc1OTc2&amp;external=bangumi\";}',50,0,'脚本：横手美智子  絵コンテ：岡村天斎  演出：森邦宏  作画監督：本橋秀之  メカ作画監督：後藤雅巳\r\n\r\n爆発物のスペシャリストで賞金首のデッカーを追っている最中、スパイクは女トラッカーのVTと出会う。一方、賞金を一人占めしようと別行動でデッカーを探していたフェイは、一度は発見するが取り逃がしてしまう。それを知ったVTは、トラック仲間からの情報でデッカーが乗った機体の追跡を開始するが……\r\n\r\n全編に流れるヘヴィ・メタルが痛快！',1245507294,1640348298,1,0),(7033,253,8,0,0,'ワルツ・フォー・ヴィーナス Waltz For Venus','金星华尔兹',0,'00:24:35','1998-04-24','a:2:{i:0;s:40:\"http://www.tudou.com/v/4plGLX4Ba08/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765575&amp;yid=XNTEwNDc1OTky&amp;external=bangumi\";}',45,0,'脚本：横手美智子  絵コンテ：武井良幸  演出：武井良幸  作画監督：しんぼたくろう  メカ作画監督：後藤雅巳\r\n\r\n金星病で視力を失った妹ステラのため、自分の所属するピカロ一味から、金星病の薬草「グレイアッシュ」を持ち逃げした青年ロコ。その逃走中、スパイクと出会ったロコは、薬草をスパイクに託し、姿を消してしまう。数日後、ロコに指定された場所に向かったスパイクを待っていたのは……\r\n\r\n最後に流れるオルゴールの音色が静かに哀しみを強調する。',1245507313,1639368639,1,0),(7034,253,9,0,0,'ジャミング・ウィズ・エドワードJamming With Edward','与艾德华竞飙',0,'00:24:33','1998-05-01','a:2:{i:0;s:40:\"http://www.tudou.com/v/gJPNk8rxR_s/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765576&amp;yid=XNTEwNDc1OTg4&amp;external=bangumi\";}',60,0,'脚本：佐藤大  絵コンテ：渡辺信一郎  演出：佐藤育郎  作画監督：小森高博  メカ作画監督：後藤雅巳\r\n\r\n地表に人工衛星を使って落書きをしたハッカーを追って地球に来たスパイクたち。それを知ったエドは、兼ねてから興味を持っていたスパイクたちの手助けをしようと犯人を追うが……\r\n\r\n天才ハッカー、エドの初登場話。地表に絵を描いた衛星をハッキングしたり、ビバップ号をラジコン飛行機のように操ったりと、彼女の悪戯心が遺憾なく発揮されている！\r\n\r\n注：标题取自 The Rolling Stones 的三位成员与 Nicky Hopkins 、 Ry Cooder 在1972年发行的专辑名。',1245507350,1629129420,1,0),(7035,253,10,0,0,'ガニメデ慕情 Ganymede Elegy','木卫三挽歌',0,'00:24:41','1998-05-08','a:2:{i:0;s:40:\"http://www.tudou.com/v/0EuWbemfv28/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765577&amp;yid=XNTEwNDc1OTg0&amp;external=bangumi\";}',68,0,'脚本：稲荷昭彦  絵コンテ：山口祐司  演出：山田弘和  作画監督：逢坂浩司  メカ作画監督：後藤雅巳\r\n\r\nある日突然、自分のもとから去って行った、かつての恋人アリサのことを昔馴染みから聞かされたジェットは、一人で故郷ガニメデに向かう。ガニメデに到着し、アリサと再会したジェットだったが、アリサには新たな恋人リントがいた。だが、リントは賞金首だったのだ……\r\n\r\n様々な音楽がモチーフとなる「ビバップ」だが、今回はズバリ“演歌”です！',1245507371,1636884301,1,0),(7036,253,11,0,0,'闇夜のヘヴィ・ロック Toys In The Attic','阁楼上的玩具',0,'00:24:41','1998-05-15','a:2:{i:0;s:40:\"http://www.tudou.com/v/FHUgg8yVwNY/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765578&amp;yid=XNTEwNDc1OTk2&amp;external=bangumi\";}',82,0,'脚本：横手美智子  絵コンテ：森邦宏  演出：森邦宏  作画監督：しんぼたくろう  メカ作画監督：後藤雅巳\r\n\r\nビバップ号の船内でジェットが何かに首筋を刺され、そのまま気絶してしまった。真相の究明に乗り出すスパイクだが、病名はおろか刺した生物の見当すらつかない。そうこうしている内に、続いてフェイ、アインも襲われ、床に伏せてしまうのだった……\r\n\r\n映画「エイリアン」シリーズを彷彿させるビバップ号を舞台にした密室サスペンス・パロディー！\r\n\r\n注：标题取自美国摇滚乐队 Aerosmith 的同名专辑。',1245507402,1639329856,1,0),(7037,253,12,0,0,'ジュピター・ジャズ（前编） Jupiter Jazz (PART 1)','木星爵士乐（前篇）',0,'00:24:41','1998-05-22','a:2:{i:0;s:40:\"http://www.tudou.com/v/7x2WOUhOV9k/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765579&amp;yid=XNTEwNDc2MDAw&amp;external=bangumi\";}',39,0,'脚本：信本敬子  絵コンテ：岡村天斎  演出：武井良幸  作画監督：川元利浩  メカ作画監督：後藤雅巳\r\n\r\n目薬ドラッグ「レッド・アイ」の取引に、木星の衛星カリストへ向かうビシャス。その頃、ビバップ号の金庫の中身を持ち逃げしたフェイを追っていたスパイクたちは、ジュリアという名前にぶち当たる。女の名に顔色を変えたスパイクは、ジェットの制止を振り切りカリストに向かう。その頃、フェイはグレンと名乗る不思議な青年に出会っていた……',1245507419,1637122117,1,0),(7038,253,13,0,0,'ジュピター・ジャズ（后编） Jupiter Jazz (PART 2)','木星爵士乐（后篇）',0,'00:24:41','1998-05-29','a:2:{i:0;s:40:\"http://www.tudou.com/v/-Ddsjlf5X5E/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765581&amp;yid=XNTEwNDc2MDA0&amp;external=bangumi\";}',53,0,'脚本：信本敬子  絵コンテ：岡村天斎  演出：佐藤育郎  作画監督：小森高博  メカ作画監督：後藤雅巳\r\n\r\nビシャスと再会したスパイクは、かつての弟分リンの銃撃の前に倒れ、グレンはフェイにビシャスとの壮絶な過去を告げる。そして、グレンはビシャスに復讐するため罠を仕掛ける。そこに復活したスパイクも加わり、ビシャス、グレン、スパイクによる三つ巴の空中戦が始まった！\r\n\r\n名曲「SPACE LION」が流れるエンディングが渋くて超カッコ良いぞ！',1245507441,1637122264,1,0),(7039,253,14,0,0,'ボヘミアン・ラプソディ Bohemian Rhapsody','波西米亚狂想曲',0,'00:24:41','1998-06-05','a:2:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765580&amp;yid=XNTEwNDc2MDA4&amp;external=bangumi\";i:1;s:47:\"http://www.tudou.com/programs/view/yxOKL03hgaU/\";}',43,0,'脚本：佐藤大  絵コンテ：都留稔幸  演出：山田弘和  作画監督：しんぼたくろう  メカ作画監督：後藤雅巳\r\n\r\n次々と起こる位相差空間ゲートのハッキング事件。スパイクたちもその実行犯は捕えるものの、彼らを操る首謀者の姿が見えてこない。唯一の手がかりは実行犯が持っていたチェスの駒のみであった。だが、その駒の仕掛けに気付いたエドは、チェスのネット対戦を始め、黒幕の“チェスマスター・ヘックス”の存在を突き止める。果たして、その正体とは？\r\n\r\n注：标题取自 Queen 的同名歌曲。',1245507458,1637209324,1,0),(7040,253,15,0,0,'マイ・ファニー・ヴァレンタイン My Funny Valentine','我可爱的情人',0,'00:24:41','1998-06-12','a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765582&amp;yid=XNTEwNDc2MDEy&amp;external=bangumi\";}',52,0,'脚本：信本敬子  絵コンテ：岡村天斎  演出：森邦宏  作画監督：逢坂浩司  メカ作画監督：後藤雅巳\r\n\r\nある日、フェイはアインに自分の過去のことを呟く。三年前にコールドスリープから目覚めたフェイ。だが、フェイはコールドスリープ以前の記憶を失っていた。その上、手術代など合わせて三億ウーロンの借金も背負ってしまう。そんなフェイを支えていたのが担当の弁護士ウィットニーだった……\r\n\r\nフェイの秘められた過去が垣間見られるエピソード！\r\n\r\n注：标题取自 Chet Baker 的同名歌曲。',1245507529,1637897682,1,0),(7041,253,16,0,0,'ブラック・ドッグ・セレナーデ Black Dog Serenade','黑犬小夜曲',0,'00:24:41','1999-02-12','a:2:{i:0;s:40:\"http://www.tudou.com/v/HpClY0AFJb8/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765583&amp;yid=XNTEwNDc1NzEy&amp;external=bangumi\";}',37,0,'脚本：横手美智子  絵コンテ：山内重保  演出：佐藤育郎  作画監督：竹内浩志  メカ作画監督：後藤雅巳\r\n\r\n冥王星へ向かう囚人輸送宇宙船の内部で、囚人たちによる反乱が発生した。その中には、昔、ジェットの左腕を奪った殺し屋ウダイがいた。かつての同僚ファドからその情報を聞いたジェットは、ファドと共に包囲網を突破して行方不明となった宇宙船の追跡を開始するが……\r\n\r\nジェットが“ブラック・ドッグ”と呼ばれていた警官時代の過去が描かれる。',1245507559,1638792827,1,0),(7042,253,17,0,0,'マッシュルーム・サンバ Mushroom Samba','蘑菇桑巴',0,'00:24:18','1999-02-19','a:2:{i:0;s:40:\"http://www.tudou.com/v/zrPgavNwQs0/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765584&amp;yid=XNTEwNDc2MjQ4&amp;external=bangumi\";}',59,0,'脚本：横手美智子/渡辺信一郎  絵コンテ：渡辺信一郎  演出：森邦宏  作画監督：しんぼたくろう/中田栄治  メカ作画監督：後藤雅巳\r\n\r\n一文無しで、宇宙を漂流していたビバップ号は当て逃げに遭い、木星の衛星イオに不時着してしまう。近くの町に食料を調達に出かけたエドとアインは、一人の不思議な老人に出会う。その老人からキノコを貰ったエドは、腹を減らしたビバップ号の面々にお裾分け。すると、めくるめくトリップの世界が彼らを待っていた……\r\n\r\nエドとアインの魅力全開！',1245507613,1632281102,1,0),(7043,253,18,0,0,'スピーク・ライク・ア・チャイルド Speak Like a Child','童言童语',0,'00:24:42','1998-06-19','a:2:{i:0;s:40:\"http://www.tudou.com/v/pN8kDInaWX8/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765586&amp;yid=XNTEwNDc1NzE2&amp;external=bangumi\";}',116,0,'脚本：稲荷昭彦/河森正治/吉永亜矢  絵コンテ：佐藤順一  演出：武井良幸  作画監督：菅野宏紀  メカ作画監督：後藤雅巳\r\n\r\nビバップ号にある日、フェイ宛の小包が届く。借金取りからの物だと勘違いしたフェイは、中身も見ないで逃走。スパイクが残された小包を開けると、一本のベータテープが出てきた。その筋のマニアに売ろうとして諦めたスパイクとジェットがその中身を再生すると、そこには少女時代のフェイの映像が映っていた……。「フレー、フレー、あたし！」。',1245507643,1638538575,1,0),(7044,253,19,0,0,'ワイルド・ホーセス Wild Horses','野马',0,'00:24:29','1999-03-05','a:2:{i:0;s:40:\"http://www.tudou.com/v/EeGfXNG-o5Y/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765595&amp;yid=XNTEwNDc1NzIw&amp;external=bangumi\";}',37,0,'脚本：稲荷昭彦  絵コンテ：飯田馬之介  演出：山田弘和  作画監督：逢坂浩司  メカ作画監督：後藤雅巳\r\n\r\nスパイクは久し振りに愛機ソードフィッシュIIをオーバーホールしてもらうため、凄腕メカニック、ドゥーハンのいる地球を訪れていた。修復が終わったソードフィッシュIIで早速、宇宙海賊スターシップ・パイレーツを追うスパイクだが、突如制御力を失い地球へと落下し始める！　スパイクの運命は？\r\n\r\nメカデザイナー・山根公利の趣味が炸裂した一本。',1245507687,1639366528,1,0),(7045,253,20,0,0,'道化師の鎮魂歌 Pierrot Le Fou','小丑的安魂曲',0,'00:24:40','1999-03-12','a:3:{i:0;s:47:\"http://v.youku.com/v_show/id_XMjg2NDk1MjEy.html\";i:1;s:40:\"http://www.tudou.com/v/9AypItnwnYY/v.swf\";i:2;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765585&amp;yid=XNTEwNDc2MzA4&amp;external=bangumi\";}',103,0,'脚本：村井さだゆき  絵コンテ：武井良幸  演出：武井良幸  作画監督：小森高博  メカ作画監督：後藤雅巳\r\n\r\nある夜、スパイクは警察の高官が暗殺されるのを目撃した。暗殺者は、マッドピエロこと東風（トンプウ）。その姿を見て生き延びた者はいないという伝説の殺し屋だった。目撃したことで東風の襲撃を受けるスパイク。その場は何とか逃げ延びたものの、東風はどこまでも追って来るのだった……。\r\n\r\n本気になったスパイクのキレのあるアクションが最高！',1245507706,1639728343,1,0),(7046,253,21,0,0,'ブギ・ウギ・フンシェイ Boogie Woogie Feng Shui','布吉伍吉风水',0,'00:24:40','1999-03-19','a:2:{i:0;s:40:\"http://www.tudou.com/v/aMjXwypBI2s/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130766707&amp;yid=XNTEwNDc1NzI0&amp;external=bangumi\";}',44,0,'脚本：村井さだゆき/渡辺信一郎  絵コンテ：潮乱太  演出：佐藤育郎  作画監督：竹内浩志  メカ作画監督：後藤雅巳\r\n\r\n古い友人のパオよりジェットに届いた一通のメール。文面には「案山より聖獣を見いだせ。我、四神相応に有り」という謎の言葉。疑問に思い、パオを探していたジェットは、パオが位相差空間内に閉じこめられていることを知る。そしてパオの孫娘メイファを付け狙う刺客の影。それは秘密のエネルギーを秘めた「太陽石」を巡る戦いの始まりだった……。\r\n\r\n注：ブギ・ウギ（Boogie Woogie）低音连奏爵士乐，是爵士乐中的一种钢琴奏法。',1245507728,1639295016,1,0),(7047,253,22,0,0,'カウボーイ・ファンク Cowboy Funk','牛仔放克',0,'00:24:41','1999-03-26','a:2:{i:0;s:40:\"http://www.tudou.com/v/tOucNYXO5WE/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130766702&amp;yid=XNTEwNDc1NzI4&amp;external=bangumi\";}',80,0,'脚本：信本敬子  絵コンテ：岡村天斎  演出：森邦宏  作画監督：川元利浩  メカ作画監督：後藤雅巳\r\n\r\nヌイグルミに爆弾を仕掛けて世を騒がす爆弾魔テディ・ボマーを追うスパイクたちは、後一歩のところでスパイクを犯人と勘違いしたカウボーイ姿の賞金稼ぎ、アンディの妨害を受ける。それがスパイクの長い長いホンキィトンクな日々の始まりだった……。\r\n\r\nシリーズ中屈指のキャラ、アンディ登場。ある意味一番「ビバップ」らしい最高に笑えるエピソード！',1245507773,1639543480,1,0),(7048,253,23,0,0,'ブレイン・スクラッチ Brain Scratch','大脑划痕',0,'00:24:40','1999-04-02','a:3:{i:0;s:40:\"http://www.tudou.com/v/cmGeW2KONLo/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130766703&amp;yid=XNTEwNDc1NzMy&amp;external=bangumi\";i:2;s:59:\"http://www.tudou.com/albumplay/7N-t2tvbwh0/kDQH5MLkfsI.html\";}',67,0,'脚本：佐藤大  絵コンテ：武井良幸  演出：武井良幸  作画監督：竹内浩志  メカ作画監督：後藤雅巳\r\n\r\nネット上に存在する謎の宗教団体・電子移民財団スクラッチ。その信者が次々に行方不明になり、教祖のロンデスに多額の賞金がかけられた。早速、抜け駆けするフェイ。しかし、ロンデスの正体は知れず、スクラッチの本部で賞金稼ぎたちの屍を目の当たりにする。フェイからの連絡にスパイクたちは渋々調査を始めるが……。\r\n\r\n退廃的なムードが全編を覆う。',1245507793,1639298677,1,0),(7049,253,24,0,0,'ハード・ラック・ウーマン Hard Luck Woman','不走运的女人',0,'00:24:37','1999-04-09','a:2:{i:0;s:40:\"http://www.tudou.com/v/Vmt41OXnYnA/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130766705&amp;yid=XNTEwNDc1NzM2&amp;external=bangumi\";}',129,0,'脚本：横手美智子  絵コンテ：岡村天斎  演出：山田弘和  作画監督：菅野宏紀  メカ作画監督：後藤雅巳\r\n\r\nかつて自分に宛てて送ったビデオレターが告げる、なくしてしまった過去。思い出せぬ記憶。その中にマーライオンの像が映っていることに気付いたフェイは、その像のある場所を知っているらしいエドと共に地球に向かった。立ち寄った修道院で明らかになるエドの父の消息とマーライオンの場所。そして、フェイは自分を知る老女に出会うのだった……。',1245507816,1639794126,1,0),(7050,253,25,0,0,'ザ・リアル・フォークブルース（前編）','The Real Folk Blues (PART 1)',0,'24m','1999-04-16','a:2:{i:0;s:40:\"http://www.tudou.com/v/8oOtPxk9rFQ/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130766706&amp;yid=XNTEwNDc1NzQ0&amp;external=bangumi\";}',21,0,'脚本：信本敬子   分镜：渡边信一郎   演出：佐藤育郎',1245507842,1636146470,1,0),(7051,253,26,0,0,'ザ・リアル・フォークブルース（後編）','The Real Folk Blues (PART 2)',0,'24m','1999-04-23','a:2:{i:0;s:40:\"http://www.tudou.com/v/FBCdLYkuHPQ/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130766708&amp;yid=XNTEwNDc1NzQ4&amp;external=bangumi\";}',79,0,'脚本：信本敬子   分镜：渡边信一郎   演出：武井良幸',1245507880,1636154430,1,0),(46037,253,0,1,0,'よせあつめブルース','Mish-Mash Blues',0,'24m','1998-06-26','a:4:{i:0;s:38:\"http://player.56.com/v_NTEwOTY2Mzc.swf\";i:1;s:47:\"http://www.tudou.com/programs/view/qTQc_CnWUyk/\";i:2;s:60:\"http://video.baidu.com/s?f=0&amp;n=1&amp;word=cowboy%20bebop\";i:3;s:90:\"http://www.tudou.com/v/uASQyyeab-8/&amp;rpid=2802833&amp;resourceId=2802833_04_05_99/v.swf\";}',23,0,'Cowboy Bebop东京电视台首轮放映中的最后一集，由零散内容剪辑而成。\r\n本集使用了日本HIP HOP小组SHAKKAZOMBIE的曲子而没有出现菅野的音乐。角色们也都自顾自地、没完没了地说着富有哲理的台词。此后都没有再放映过，并且之后发行的各种版本的录像带里也都没有收录。\r\n官网的FAQ中制作方称是由于制作进度原因匆忙剪辑而成的，实际上，是由于当时严格的审查制度(3D龙事件)使得BEBOP被减掉一半，制作人为了发泄不满而制作的通过动画角色的嘴对东京电视台进行猛烈讽刺的「特别篇」。',1281436548,1617774916,1,0),(103232,253,1,2,0,'Tank!','',0,'第0话 - 第26话','1998-06-26','',3,0,'',1307792985,1617774944,1,0),(103233,253,1,3,0,'THE REAL FOLK BLUES','',0,'第0话 - 第12话, 第14话 - 第25话','1998-06-26','',0,0,'',1307793012,0,1,0),(103234,253,2,3,0,'SPACE LION','',0,'第13话','1998-05-29','',0,0,'',1307793290,0,1,0),(103235,253,3,3,0,'BLUE','',0,'第26话','1999-04-23','',3,0,'',1307793418,1617774973,1,0),(744206,211567,23,0,0,'西陽／ラムネ','夕阳 / 柠檬酸片',0,'00:25:00','2017-10-14','',91,0,'東京の下町・六月町に一人で暮らす桐山零は、高校生にしてプロの将棋棋士。放課後理科クラブと将棋部を合体させた「将科部」では、零は、部員たちに将棋を教えたり、ラムネの手作りを教わったりと順調に活動していく。学校の中にできたあたたかな居場所に喜びをかみしめる零。ラムネを手に、もうひとつのあたたかな居場所、川本家へと向かう。\r\n\r\n脚本：木澤行人  絵コンテ・演出：大谷肇\r\n作画監督：杉山延寛　潮月一也    片山みゆき　たかおかきいち　清水勝祐',1503284904,1639750751,0,0),(744207,211567,24,0,0,'混沌／隈倉','混沌 / 隈仓',0,'00:25:00','2017-10-21','',78,0,'将棋会館を訪れた零は、二海堂たち棋士仲間とともに、宗谷と隈倉による名人戦最終局の中継を見ていた。同じ部屋にいた先輩棋士に島田をからかうような発言をされた零と二海堂は苦々しい思いをこらえるが、そこへ現れた後藤が棋士たちに対し怒りをあらわにする。義姉・香子を苦しめる後藤の振る舞いに複雑な思いを抱く零。そして、歴戦の棋士・柳原から「混沌（こんとん）」と表される、名人戦の勝負の行方は？\r\n\r\n脚本：木澤行人  絵コンテ：川畑喬  演出：吉澤翠\r\n作画監督：片山みゆき　山崎敦子　西澤真也　浅井昭人　たかおかきいち　斉藤和也　清水勝祐',1503284904,1639764789,0,0),(744208,211567,25,0,0,'六月／てんとう虫の木①','六月 / 瓢虫所在之树①',0,'00:25:00','2017-10-28','',64,0,'対局の昼食休憩中、なんとしても新人戦の決勝で零と対局すると息巻く二海堂は、将来名人となった自分を妄想し熱く語る。そんな二海堂をクールに眺めていた零だったが、自分でも気付いていなかった心の内を二海堂に指摘され、たいへん動揺する。一方その頃川本家では、相米二とあかり・ひなた・モモが、三日月堂の夏の新作和菓子を相談していた。モモの斬新なアイデアも飛び出す中、いつも明るいひなたが元気のない様子で……。\r\n\r\n脚本：木澤行人  絵コンテ：黒沢守  演出：三上喜子\r\n作画監督：杉山延寛　潮月一也　菊池聡延　北原章雄',1503284904,1638207892,0,0),(744209,211567,26,0,0,'てんとう虫の木②／てんとう虫の木③／想い','瓢虫所在之树② / 瓢虫所在之树③ / 思念',0,'00:25:00','2017-11-04','',134,0,'小学校からひなたと仲のよかった佐倉ちほが、中学３年のクラスでいじめの標的になってしまった。見て見ぬふりをする同級生ばかりの中、ひなたはちほに声をかけていっしょにご飯を食べ、担任の先生にいじめを訴えようと提案する。しかし、ちほは激しくなる一方のいじめから学校に来られなくなり、ついには転校してしまう……。\r\n\r\n脚本：木澤行人  絵コンテ：黒沢守  演出：岡田堅二朗\r\n作画監督：野道佳代　馬場一樹　西川千尋　松浦力　浅井昭人　藤本真由',1503284904,1639808605,0,0),(744210,211567,27,0,0,'想い／告白','思念(承前) / 告白',0,'00:25:00','2017-11-11','',46,0,'いじめについて元担任の林田に相談する零。林田は様々な例を挙げ、「いじめられている本人がどんな解決を望んでいるかをちゃんと聞くことが大事」とアドバイスする。そして零は自分にできることを必死に考えた結果、解決に必要な経費を対局料から捻出しようと思い至り、これまでにないほど熱い思いで対局へ向かう！（でも、電卓を持って川本家に飛び込まんとする零の熱意はちょっとズレてる？！）\r\n\r\n脚本：木澤行人  絵コンテ：佐伯昭志  演出：長友孝和\r\n作画監督：片山みゆき　山崎敦子　たかおかきいち　清水勝祐',1503284904,1639844153,0,0),(744211,211567,28,0,0,'小さな世界／手紙','小小的世界 / 信件',0,'00:25:00','2017-11-18','',74,0,'川本家を訪れた零は、ひなたに学校でのことを話してもらう。誰がどのくらい大きな声で笑っていいのか、教室でどのくらい自由に振る舞っていいのか、まるで決められているようなクラスの空気について、ぽつぽつと話すひなた。\r\nそんなある日の昼休み、教室にいるひなたを、憧れの野球部エース・高橋がキャッチボールに誘う。高橋は零からひなたのことを聞き、教室から連れ出そうとしてくれるのだった。\r\n\r\n脚本：木澤行人  絵コンテ：吉澤翠  演出：吉澤翠\r\n作画監督：佐藤義久　代見裕美　金正男　細田沙織　清水勝祐',1503284904,1639847448,0,0),(744212,211567,29,0,0,'梅雨の始まり／蜂谷','梅雨的开始 / 蜂谷',0,'00:25:00','2017-11-25','',37,0,'担任から「どうしてそう協調性がないの？」と言われ、怒りから鼻血を出し自宅の居間で横になるひなた。川本家を訪れた零は、恥ずかしがって顔を隠すひなたを彼なりの優しさで気遣う。そしてあかりと買い物に出た帰り、妹のことで不安そうな彼女に思わず大声で「ぼくもいます！」と宣言する。\r\nそんな中迎えた新人戦の準決勝。零の相手は“東のイライラ王子”こと蜂谷すばる。個性的な棋士・蜂谷を前に、零の戦いの行方は？\r\n\r\n脚本：木澤行人  絵コンテ：川畑喬  演出：川崎ゆたか\r\n作画監督：野道佳代　浅井昭人　清水勝祐　若月愛子　斉藤和也',1503284904,1616207064,0,0),(744213,211567,30,0,0,'真昼の月／冒険者たち','正午的月亮 / 冒险者们',0,'00:25:00','2017-12-02','',60,0,'ひなたたちの力になりたいともがく零は、林田から「お前にできることをひとつずつやるしかない」と諭される。その言葉を胸に、零は対局で順調に勝ちつづける。\r\n一方、ともに新人戦を勝ち進んで決勝で対局しようと零にアツく語っていた二海堂は、準決勝で山崎順慶五段と対局中に倒れ、敗れていた。二海堂が入院したことを知った零は、これまで聞くことができなかった彼の事情を教えてほしいと、島田にうったえる。\r\n\r\n脚本：木澤行人  絵コンテ：大石美絵  演出：宮西哲也  演出協力：大谷肇\r\n作画監督：たかおかきいち　伊藤良明　山崎敦子　梅下麻奈未　若月愛子　浅井昭人　清水勝祐　藤本真由　岩崎たいすけ',1503284904,1616123273,0,0),(744214,211567,31,0,0,'王国①／王国②','王国① / 王国②',0,'00:25:00','2017-12-09','',51,0,'京都への修学旅行の前日、川本家で零や家族と夕食をとっていたひなたは、胃の痛みから食事を残してしまう。無理して行かなくてもいいと言うあかりだったが、ひなたは後悔しないために行くと強い意志をみせる。その言葉にはっとする零。\r\nそして零は、ひなたの修学旅行と時を同じくして、大阪で山崎順慶五段との新人戦決勝に臨むのだった。\r\n\r\n脚本：木澤行人  絵コンテ：岡田堅二朗  演出：三上喜子\r\n作画監督：秋葉徹　渥美智也　清水勝祐　宮嶋仁志',1503284904,1639911548,0,0),(744215,211567,32,0,0,'銀色の羽根／川景色','银色的羽毛 / 河边景色',0,'00:25:00','2017-12-16','',68,0,'山崎順慶はプロ棋士になって６年の春、２つ目の降級点をとってしまう。そして将棋と同等に心血を注いできた鳩（はと）レースの世界では、愛情と手間をかけて育ててきた鳩の「銀」がレースから戻らない……。\r\n努力し続けるしかない将棋の世界で、ひるむことなくその身を投げ打つ二海堂との新人戦準決勝、山崎は何が何でも勝ちたいという思いで彼の前に立った。\r\n\r\n脚本：木澤行人  絵コンテ：佐伯昭志  演出：角地拓大\r\n作画監督：北原章雄　岡野力也　金正男\r\n作画監督補佐：斎藤和也　清水勝祐',1503284904,1639914004,0,0),(744216,211567,33,0,0,'陽のあたる場所／小さな世界','沐浴阳光的地方 / 小小的世界',0,'00:25:00','2017-12-23','',46,0,'新人王となった零は神宮寺会長から呼び出され、宗谷名人との記念対局を大々的に行うと聞かされる。幼い頃から雲の上の存在だった宗谷との対局に動揺する零だが、神宮寺から「頼りにしてる」と励ましの言葉をかけられる。学校では将科部の面々からもお祝いされ、人々の温かさを零は噛みしめる。一方島田は、長らく棋匠として君臨する老棋士・柳原への挑戦権をとるべく、櫻井岳人七段との対局を迎えていた。\r\n\r\n脚本：木澤行人  絵コンテ：川畑喬  演出：吉澤翠\r\n作画監督：宮嶋仁志　秋葉徹　清水勝祐　たかおかきいち　野道佳代',1503284904,1639936389,0,0),(744217,211567,34,0,0,'黒い霧／光','黑色的雾 / 光',0,'00:25:00','2018-01-06','',111,0,'修学旅行から戻って以来、ひなたのクラスでは高城たちによる担任への嫌がらせが始まり、担任は心労から倒れ入院してしまう。新しく担任となった学年主任の国分は、ひなたと高城の保護者それぞれと三者面談を行うことを決め、問題解決に向けて動き出す。\r\nひなたから事情を聞いたあかりは、仕事を放り出して面談に行こうとする相米二を説得し、ひなたと共に面談に向かう。しかし、２人は高城とその母に遭遇してしまう。\r\n\r\n脚本：木澤行人  絵コンテ：大谷肇  演出：大谷肇\r\n作画監督：若月愛子　山崎敦子　片山みゆき　藤本真由　浅井昭人　斎藤和也　野道佳代',1503284904,1640353192,0,0),(744218,211567,35,0,0,'小さな手のひら／日向','小小的手心 / 日向',0,'00:25:00','2018-01-13','',63,0,'国分によるクラスへの介入により、いじめ問題は解決に向かう。クラス全員の前で形ばかりの謝罪をした高城だったが、国分はそんな彼女と粘り強く対話を続けるのだった。\r\nそして、友人たちと以前のように笑い合えるようになったひなたの元に、いじめのため転校したちほから初めての手紙が届く。\r\n\r\n脚本：木澤行人  絵コンテ：佐伯昭志  演出：長友孝和\r\n作画監督：北原章雄　佐藤義久　桜井このみ　柴田和子　奥野浩行　島袋智和　劉雲留　兼高里圭　斎藤和也　清水勝祐',1503284904,1640353078,0,0),(744219,211567,36,0,0,'流れていくもの／白い嵐①','流走之物 / 白色暴风雨①',0,'00:25:00','2018-01-20','',65,0,'島田と柳原による棋匠戦一局目は柳原の勝利となった。しかし、２人の顔合わせには今ひとつ華がない……。神宮寺会長は、時期を同じくして行われる宗谷と零の記念対局に集客の期待をかける。矢面に立つことが苦手な宗谷と零のことを島田は案じる。\r\n盛岡での対局前日。零は、宗谷との初めての対局に向けての緊張をかかえながら、記念対局の前夜祭に出席する。\r\n\r\n脚本：木澤行人  絵コンテ：大石美絵  演出：宮西哲也\r\n作画監督：山崎敦子　浅井昭人　片山みゆき　若月愛子　藤本真由　斎藤和也　野道佳代　清水勝祐',1503284904,1639980931,0,0),(744220,211567,37,0,0,'白い嵐②／白い嵐③／白い嵐④','白色暴风雨② / 白色暴风雨③ / 白色暴风雨④',0,'00:25:00','2018-01-27','',55,0,'零と、現役最強の棋士・宗谷名人との記念対局が始まった。力の差は歴然だが、名人相手に食い下がる零の将棋に、控え室で対局を見ている関係者の議論も盛り上がる。しかし中盤で敗着の一手を指してしまう零。が、零は決してあきらめず最善手を探して指し続ける。果たして勝負の行方は？\r\n\r\n脚本：木澤行人  絵コンテ：佐伯昭志  演出：三上喜子\r\n作画監督：清水勝祐　たかおかきいち　片山みゆき　若月愛子　野道佳代　浅井昭人　藤本真由　山崎敦子',1503284904,1639982905,0,0),(744221,211567,38,0,0,'白い嵐④(承前)／白い嵐⑤／再始動','白色暴风雨④ / 白色暴风雨⑤ / 再启动',0,'00:25:00','2018-02-03','',58,0,'盛岡での記念対局からの帰り道、台風のため仙台で足止めを食らった零と宗谷。宿泊先を見つけて一息ついた零は、神宮寺からの電話で、「将棋の鬼」とも言われる天才・宗谷の秘密を知らされる。零は、東京に戻った後、対局を反芻しながら宗谷の過去の棋譜を追いかけるのだった。\r\n一方、入院していた二海堂は退院し、玉将戦の1次予選から復帰を果たす。\r\n\r\n脚本：木澤行人  絵コンテ：佐伯昭志  演出：川﨑ゆたか\r\n作画監督：金正男　杉田葉子　猿渡聖加　宇都木勇　安孝貞\r\n\r\n※注：因电视台节目安排，第39话的播放时间调整到3月3日。详细信息可在官网查看。',1503284904,1623301159,0,0),(744222,211567,39,0,0,'焼野が原①／焼野が原②','被烧光的原野① / 被烧光的原野②',0,'00:25:00','2018-03-03','',43,0,'零と二海堂が大盤解説をまかされた、柳原と島田の棋匠戦最終局。\r\n棋匠の座に長く君臨する柳原だけあって、前夜祭の会場ではほとんどの記者や関係者が旧知の仲。挑戦者である島田はその圧倒的なアウェイ感に気圧されながらも、何がなんでも初タイトルを獲ると意気込む。\r\n\r\n脚本：木澤行人  絵コンテ：大石美絵  演出：角地拓大\r\n作画監督：西澤真也　秋葉徹　宮嶋仁志　河島久美子\r\n\r\n※注：因为电视台节目安排，第39话的播放时间调整到3月3日。详细信息可在官网查看。',1503284904,1616066799,0,0),(744223,211567,40,0,0,'焼野が原③／焼野が原④','被烧光的原野③ / 被烧光的原野④',0,'00:25:00','2018-03-10','',77,0,'最年長A級棋士・柳原の永世称号がかかった棋匠戦最終局。終盤に差しかかり、対局は島田優勢に傾く。\r\n将棋の道を断念し引退した仲間たちから柳原に託されてきた数限りない「たすき」。その重圧にがんじがらめになりながら、柳原は焼け野が原を進む思いで指し続ける。\r\n\r\n脚本：木澤行人  絵コンテ：川畑喬  演出：大谷肇\r\n作画監督：清水勝祐　浅井昭人　若月愛子　片山みゆき　山崎敦子　たかおかきいち　藤本真由',1503284904,1640068992,0,0),(744224,211567,41,0,0,'ここにいること／夏休み①','就在这里 / 暑假①',0,'00:25:00','2018-03-17','',43,0,'三月町の夏祭りに出店した三日月堂は、あかりとひなたのアイデアで“冷やし白玉シロップ”を販売する。その中には、いじめのため転校したひなたの友人・ちほが作った梅シロップを使ったものもあった。\r\n夏休みに入ってすぐ、ひなたはちほに会いに行っていた。ちほは、楽しそうな笑顔も見せながらも、今もいじめで受けた心の傷を抱えていた。ひなたは、梅シロップをみんながおいしそうに食べる写真を送ろう、そしてまた会いに行こう、と思うのだった。\r\n\r\n脚本：木澤行人  絵コンテ：佐伯昭志  演出：橋本能理子\r\n作画監督：高野やよい　香田知樹　石川奨士　久松沙紀',1503284904,1640145948,0,0),(744225,211567,42,0,0,'夏休み②／あたらしい年','暑假② / 新的一年',0,'00:25:00','2018-03-24','',47,0,'夏休み中のひなたは新しいお菓子のアイデアが次々と浮かぶ一方、学校の勉強や高校受験に対して前向きになれないでいた。 零はそんなひなたを、モモ、あかりとともに、自分の通う駒橋高校での流しそうめんに誘う。ひなたは、野口たち将科部の面々や林田たちとふれあううちに、駒橋高校に進学することを考え始める。\r\n\r\n脚本：木澤行人  絵コンテ：大石美絵  演出：宮西哲也　川﨑ゆたか\r\n作画監督：清水勝祐　綾部美穂　斎藤和也　北原章雄　伏見裕美　岡野力也　佐藤義久　金正男',1503284904,1640323092,0,0),(744226,211567,43,0,0,'経る時／春が来る','经历 / 春天来了',0,'00:25:00','2018-03-31','',32,0,'高校受験を控え必死で勉強に取り組むひなたは、憧れの同級生・高橋が遠方に進学することを知りショックを受ける。いつまでも身近にいると思っていた人々が離れていく…。落ち込んだひなたは入試直前にして熱を出してしまう。 そんな中迎えた試験の日。ひなたは、迎えに来た零とともに受験会場に向かった。\r\n\r\n脚本：木澤行人  絵コンテ：佐伯昭志  演出：三上喜子\r\n作画監督：野道佳代　藤本真由　浅井昭人　たかおかきいち　山崎敦子　清水勝祐　若月愛子',1503284904,1640327443,0,0),(744227,211567,44,0,0,'もう一つの家／三月町の子','另一个家 / 三月町的孩子',0,'00:25:00','2018-03-31','',82,0,'みんなでもんじゃ焼きを食べに行こう。中学を卒業したひなたと高橋を、零が誘った。遠く高知の高校に進学する高橋と話す場を作ってくれた零に感謝するひなた。自分たちはどこにいても三月町の子だと、思いを新たにする。\r\nそして高橋が三月町を発つ日。ひなたは、桜まつりに賑わう三日月堂で忙しく立ち働くのだった。\r\n\r\n脚本：木澤行人  絵コンテ：大谷肇  演出：大谷肇　岡田堅二朗\r\n作画監督：杉山延寛　片山みゆき　若月愛子　山崎敦子　たかおかきいち　野道佳代　浅井昭人　藤本真由　清水勝祐',1503284904,1640330419,0,0),(980030,315957,1,0,1,'Twilight Serenity (Genshin Impact Main Theme Var.)','宁静的黄昏',0,'01:41','','',0,0,'',1601274156,0,0,0),(980031,315957,2,0,1,'Legend of the Wind','风的传说',0,'01:26','','',0,0,'',1601274156,0,0,0),(980032,315957,3,0,1,'The City Favored By Wind','风所爱之城',0,'01:03','','',0,0,'',1601274156,0,0,0),(980033,315957,4,0,1,'Bustling Afternoon of Mondstadt','蒙德城繁忙的午后',0,'01:48','','',0,0,'',1601274156,0,0,0),(980034,315957,5,0,1,'Dusk in Mondstadt','蒙德的黄昏',0,'01:48','','',0,0,'',1601274156,0,0,0),(980035,315957,6,0,1,'Mondstadt Starlit','星光下的蒙德',0,'01:00','','',0,0,'',1601274156,0,0,0),(980036,315957,7,0,1,'Moonlight in Mondstadt','蒙德的月光',0,'00:49','','',0,0,'',1601274156,0,0,0),(980037,315957,8,0,1,'Another Day in Mondstadt','蒙德的又一日',0,'00:52','','',0,0,'',1601274156,0,0,0),(980038,315957,9,0,1,'Windborne Hymn','风带来的圣歌',0,'01:48','','',0,0,'',1601274156,0,0,0),(980039,315957,10,0,1,'Knights of Favonius','西风骑士团',0,'01:15','','',0,0,'',1601274156,0,0,0),(980040,315957,11,0,1,'Angel\'s Share','天使的馈赠',0,'01:53','','',0,0,'',1601274156,0,0,0),(980041,315957,12,0,1,'Silhouette and Silk Steps','剪影与蹑步',0,'01:31','','',0,0,'',1601274156,0,0,0),(980042,315957,13,0,1,'Perilous Path','危险的小径',0,'02:19','','',0,0,'',1601274156,0,0,0),(980043,315957,14,0,1,'Say My Name','直面',0,'01:51','','',0,0,'',1601274156,0,0,0),(980044,315957,15,0,1,'Welp, Didn\'t Expect That','呃，这可没想到…',0,'01:22','','',0,0,'',1601274156,0,0,0),(980045,315957,16,0,1,'An Interesting Labour','有趣的挑战',0,'01:26','','',0,0,'',1601274156,0,0,0),(980046,315957,17,0,1,'Make Haste, Partner','速度加快',0,'01:28','','',0,0,'',1601274156,0,0,0),(980047,315957,18,0,1,'A Happy Day','开心的一天',0,'00:28','','',0,0,'',1601274156,0,0,0),(980048,315957,19,0,1,'Reunion in the Whispering Woods','低语森林的重逢',0,'00:37','','',0,0,'',1601274156,0,0,0),(980049,315957,1,0,2,'Beckoning (Genshin Impact Main Theme Var.)','情不自禁',0,'01:42','','',0,0,'',1601274156,0,0,0),(980050,315957,2,0,2,'Hence, Begins the Journey','旅途的开始',0,'01:14','','',0,0,'',1601274156,0,0,0),(980051,315957,3,0,2,'Dawn Winery Theme','晨曦酒庄',0,'01:07','','',0,0,'',1601274156,0,0,0),(980052,315957,4,0,2,'Before Dawn, at the Winery','破晓前的流光',0,'01:09','','',0,0,'',1601274156,0,0,0),(980053,315957,5,0,2,'A Familiar Sight and Leisure','见惯的风景',0,'01:07','','',0,0,'',1601274156,0,0,0),(980054,315957,6,0,2,'Cold Night','饰金的夜色',0,'01:07','','',0,0,'',1601274156,0,0,0),(980055,315957,7,0,2,'Whispering Plain','平原的低语',0,'01:10','','',0,0,'',1601274165,0,0,0),(980056,315957,8,0,2,'Statue of the Seven','七天神像',0,'01:24','','',0,0,'',1601274165,0,0,0),(980057,315957,9,0,2,'Acquaintance (Statue of the Seven)','命运的初识',0,'00:21','','',0,0,'',1601274165,0,0,0),(980058,315957,10,0,2,'Stealing Words of the Moon','月亮处盗来的歌',0,'01:24','','',0,0,'',1601274165,0,0,0),(980059,315957,11,0,2,'Wayfarer\'s Peace','旅人的暂歇',0,'01:28','','',0,0,'',1601274165,0,0,0),(980060,315957,12,0,2,'Wind-Washed Mountains','风洗的群山',0,'00:41','','',0,0,'',1601274165,0,0,0),(980061,315957,13,0,2,'Wayward Souls','不散的魂灵',0,'01:05','','',0,0,'',1601274165,0,0,0),(980062,315957,20,0,1,'Startled','震惊',0,'00:29','','',0,0,'',1601274165,0,0,0),(980063,315957,21,0,1,'Meeting Amber','初遇安柏',0,'00:13','','',0,0,'',1601274165,0,0,0),(980064,315957,22,0,1,'Storm Befalls','风暴降临',0,'01:05','','',0,0,'',1601274165,0,0,0),(980065,315957,23,0,1,'Slight Distress','淡淡的不安',0,'02:21','','',0,0,'',1601274165,0,0,0),(980066,315957,24,0,1,'Tender Strength','同伴的力量',0,'01:22','','',0,0,'',1601274165,0,0,0),(980067,315957,25,0,1,'Imminent Triumph','将至的凯歌',0,'01:00','','',0,0,'',1601274165,0,0,0),(980068,315957,1,0,3,'Photon of Fluctuation','光辉的涨落',0,'03:14','','',0,0,'',1601274165,0,0,0),(980069,315957,2,0,3,'His Resolution','解决之道',0,'04:43','','',0,0,'',1601274165,0,0,0),(980070,315957,14,0,2,'Reminiscence (Genshin Impact Main Theme Var.)','追忆',0,'01:35','','',0,0,'',1601274165,0,0,0),(980071,315957,15,0,2,'Restless Blazing Sun','烈日之残响',0,'01:35','','',0,0,'',1601274165,0,0,0),(980072,315957,16,0,2,'Remembrance (Genshin Impact Main Theme Var.)','一段回忆',0,'01:22','','',0,0,'',1601274165,0,0,0),(980073,315957,17,0,2,'The Horizon','地平',0,'01:12','','',0,0,'',1601274165,0,0,0),(980074,315957,18,0,2,'Awaiting for the Future','静候未来',0,'01:25','','',0,0,'',1601274165,0,0,0),(980075,315957,19,0,2,'Moonlit Wilderness','月照的荒野',0,'01:16','','',0,0,'',1601274165,0,0,0),(980076,315957,20,0,2,'A New Day with Hope','希望的新一天',0,'01:43','','',0,0,'',1601274165,0,0,0),(980077,315957,21,0,2,'Journey of Hope (Genshin Impact Main Theme Var.)','希望之旅',0,'01:21','','',0,0,'',1601274165,0,0,0),(980078,315957,22,0,2,'Forlorn Child of Archaic Winds (Dvalin\'s Nest)','万古之风的弃儿',0,'03:19','','',0,0,'',1601274165,0,0,0),(980079,315957,23,0,2,'Forsken Child of Ancient Times (Dvalin\'s Nest)','太古时光的遗孤',0,'02:55','','',0,0,'',1601274165,0,0,0),(980080,315957,24,0,2,'Midday Prospects','午日的眺望',0,'01:38','','',0,0,'',1601274165,0,0,0),(980081,315957,25,0,2,'Dwelling in the Past','久住往昔',0,'01:41','','',0,0,'',1601274171,0,0,0),(980082,315957,26,0,2,'Eternal Anamnesis (Genshin Impact Main Theme Var.)','永恒的回忆',0,'01:59','','',0,0,'',1601274171,0,0,0),(980083,315957,3,0,3,'Rhythm from Ancient Times','亘古的韵律',0,'03:40','','',0,0,'',1601274171,0,0,0),(980084,315957,4,0,3,'Endless Echoes','无尽的回响',0,'04:12','','',0,0,'',1601274171,0,0,0),(980085,315957,5,0,3,'Charge! Fearless Warriors','冲啊！无畏的勇士',0,'03:58','','',0,0,'',1601274171,0,0,0),(980086,315957,6,0,3,'Beats of Water Drops','水滴的节拍',0,'04:03','','',0,0,'',1601274171,0,0,0),(980087,315957,7,0,3,'Magic Intrigues','魔导的深秘',0,'03:50','','',0,0,'',1601274171,0,0,0),(980088,315957,8,0,3,'Against All Odds','无数的逆境',0,'05:21','','',0,0,'',1601274171,0,0,0),(980089,315957,9,0,3,'Perpetual Motion of Wind','不休的风航',0,'03:32','','',0,0,'',1601274171,0,0,0),(980090,315957,10,0,3,'Riders of the Wind, Onward','乘风前行',0,'03:06','','',0,0,'',1601274171,0,0,0),(980091,315957,11,0,3,'Whirl of Boreal Wind','冰风回荡',0,'03:11','','',0,0,'',1601274171,0,0,0),(980092,315957,12,0,3,'Symphony of Boreal Wind','冰封交响曲',0,'04:51','','',0,0,'',1601274171,0,0,0);
/*!40000 ALTER TABLE `chii_episodes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_subject_fields` WRITE;
/*!40000 ALTER TABLE `chii_subject_fields` DISABLE KEYS */;
REPLACE INTO `chii_subject_fields` VALUES (253,2,'a:30:{i:0;a:2:{s:8:\"tag_name\";s:15:\"渡边信一郎\";s:6:\"result\";s:4:\"2929\";}i:1;a:2:{s:8:\"tag_name\";s:12:\"菅野洋子\";s:6:\"result\";s:4:\"2669\";}i:2;a:2:{s:8:\"tag_name\";s:12:\"星际牛仔\";s:6:\"result\";s:4:\"1966\";}i:3;a:2:{s:8:\"tag_name\";s:6:\"经典\";s:6:\"result\";s:4:\"1545\";}i:4;a:2:{s:8:\"tag_name\";s:6:\"科幻\";s:6:\"result\";s:4:\"1427\";}i:5;a:2:{s:8:\"tag_name\";s:7:\"SUNRISE\";s:6:\"result\";s:4:\"1356\";}i:6;a:2:{s:8:\"tag_name\";s:6:\"神作\";s:6:\"result\";s:4:\"1004\";}i:7;a:2:{s:8:\"tag_name\";s:9:\"神配乐\";s:6:\"result\";s:3:\"961\";}i:8;a:2:{s:8:\"tag_name\";s:2:\"TV\";s:6:\"result\";s:3:\"775\";}i:9;a:2:{s:8:\"tag_name\";s:11:\"CowboyBebop\";s:6:\"result\";s:3:\"715\";}i:10;a:2:{s:8:\"tag_name\";s:4:\"1998\";s:6:\"result\";s:3:\"689\";}i:11;a:2:{s:8:\"tag_name\";s:6:\"原创\";s:6:\"result\";s:3:\"495\";}i:12;a:2:{s:8:\"tag_name\";s:6:\"cowboy\";s:6:\"result\";s:3:\"475\";}i:13;a:2:{s:8:\"tag_name\";s:9:\"林原惠\";s:6:\"result\";s:3:\"462\";}i:14;a:2:{s:8:\"tag_name\";s:12:\"山寺宏一\";s:6:\"result\";s:3:\"235\";}i:15;a:2:{s:8:\"tag_name\";s:12:\"1998年10月\";s:6:\"result\";s:2:\"94\";}i:16;a:2:{s:8:\"tag_name\";s:15:\"渡辺信一郎\";s:6:\"result\";s:2:\"52\";}i:17;a:2:{s:8:\"tag_name\";s:5:\"BONES\";s:6:\"result\";s:2:\"49\";}i:18;a:2:{s:8:\"tag_name\";s:9:\"公路片\";s:6:\"result\";s:2:\"46\";}i:19;a:2:{s:8:\"tag_name\";s:6:\"浪漫\";s:6:\"result\";s:2:\"45\";}i:20;a:2:{s:8:\"tag_name\";s:12:\"信本敬子\";s:6:\"result\";s:2:\"34\";}i:21;a:2:{s:8:\"tag_name\";s:15:\"菅野よう子\";s:6:\"result\";s:2:\"33\";}i:22;a:2:{s:8:\"tag_name\";s:7:\"1998年\";s:6:\"result\";s:2:\"32\";}i:23;a:2:{s:8:\"tag_name\";s:12:\"川元利浩\";s:6:\"result\";s:2:\"26\";}i:24;a:2:{s:8:\"tag_name\";s:5:\"Bebop\";s:6:\"result\";s:2:\"26\";}i:25;a:2:{s:8:\"tag_name\";s:3:\"神\";s:6:\"result\";s:2:\"23\";}i:26;a:2:{s:8:\"tag_name\";s:6:\"日本\";s:6:\"result\";s:2:\"22\";}i:27;a:2:{s:8:\"tag_name\";s:12:\"林原惠美\";s:6:\"result\";s:2:\"22\";}i:28;a:2:{s:8:\"tag_name\";s:6:\"音乐\";s:6:\"result\";s:2:\"22\";}i:29;a:2:{s:8:\"tag_name\";s:2:\"SF\";s:6:\"result\";s:2:\"20\";}}',38,10,4,10,47,131,389,1315,2916,4430,0,1,1998,10,5,'1998-10-23',0),(2585,2,'a:30:{i:0;a:2:{s:8:\"tag_name\";s:6:\"炮姐\";s:6:\"result\";s:4:\"1956\";}i:1;a:2:{s:8:\"tag_name\";s:12:\"超电磁炮\";s:6:\"result\";s:4:\"1756\";}i:2;a:2:{s:8:\"tag_name\";s:9:\"J.C.STAFF\";s:6:\"result\";s:4:\"1746\";}i:3;a:2:{s:8:\"tag_name\";s:12:\"御坂美琴\";s:6:\"result\";s:4:\"1367\";}i:4;a:2:{s:8:\"tag_name\";s:6:\"百合\";s:6:\"result\";s:4:\"1240\";}i:5;a:2:{s:8:\"tag_name\";s:12:\"2009年10月\";s:6:\"result\";s:3:\"917\";}i:6;a:2:{s:8:\"tag_name\";s:8:\"bilibili\";s:6:\"result\";s:3:\"795\";}i:7;a:2:{s:8:\"tag_name\";s:2:\"TV\";s:6:\"result\";s:3:\"709\";}i:8;a:2:{s:8:\"tag_name\";s:6:\"黑子\";s:6:\"result\";s:3:\"702\";}i:9;a:2:{s:8:\"tag_name\";s:18:\"科学超电磁炮\";s:6:\"result\";s:3:\"621\";}i:10;a:2:{s:8:\"tag_name\";s:18:\"魔法禁书目录\";s:6:\"result\";s:3:\"518\";}i:11;a:2:{s:8:\"tag_name\";s:4:\"2009\";s:6:\"result\";s:3:\"409\";}i:12;a:2:{s:8:\"tag_name\";s:9:\"漫画改\";s:6:\"result\";s:3:\"288\";}i:13;a:2:{s:8:\"tag_name\";s:9:\"傲娇娘\";s:6:\"result\";s:3:\"280\";}i:14;a:2:{s:8:\"tag_name\";s:6:\"校园\";s:6:\"result\";s:3:\"156\";}i:15;a:2:{s:8:\"tag_name\";s:6:\"战斗\";s:6:\"result\";s:3:\"144\";}i:16;a:2:{s:8:\"tag_name\";s:12:\"长井龙雪\";s:6:\"result\";s:3:\"123\";}i:17;a:2:{s:8:\"tag_name\";s:6:\"漫改\";s:6:\"result\";s:3:\"110\";}i:18;a:2:{s:8:\"tag_name\";s:6:\"姐控\";s:6:\"result\";s:3:\"107\";}i:19;a:2:{s:8:\"tag_name\";s:12:\"轻小说改\";s:6:\"result\";s:2:\"93\";}i:20;a:2:{s:8:\"tag_name\";s:6:\"科幻\";s:6:\"result\";s:2:\"82\";}i:21;a:2:{s:8:\"tag_name\";s:9:\"超能力\";s:6:\"result\";s:2:\"73\";}i:22;a:2:{s:8:\"tag_name\";s:6:\"日常\";s:6:\"result\";s:2:\"58\";}i:23;a:2:{s:8:\"tag_name\";s:6:\"奇幻\";s:6:\"result\";s:2:\"54\";}i:24;a:2:{s:8:\"tag_name\";s:12:\"豊崎愛生\";s:6:\"result\";s:2:\"53\";}i:25;a:2:{s:8:\"tag_name\";s:12:\"長井龍雪\";s:6:\"result\";s:2:\"47\";}i:26;a:2:{s:8:\"tag_name\";s:24:\"某科学的超电磁炮\";s:6:\"result\";s:2:\"47\";}i:27;a:2:{s:8:\"tag_name\";N;s:6:\"result\";s:2:\"42\";}i:28;a:2:{s:8:\"tag_name\";s:12:\"佐藤利奈\";s:6:\"result\";s:2:\"38\";}i:29;a:2:{s:8:\"tag_name\";s:12:\"新井里美\";s:6:\"result\";s:2:\"34\";}}',20,9,18,56,287,1198,3423,4162,987,535,5,802,2009,10,5,'2009-10-02',0),(211567,2,'a:30:{i:0;a:2:{s:8:\"tag_name\";s:12:\"新房昭之\";s:6:\"result\";s:4:\"1480\";}i:1;a:2:{s:8:\"tag_name\";s:5:\"SHAFT\";s:6:\"result\";s:4:\"1079\";}i:2;a:2:{s:8:\"tag_name\";s:6:\"治愈\";s:6:\"result\";s:3:\"833\";}i:3;a:2:{s:8:\"tag_name\";s:13:\"3月的狮子\";s:6:\"result\";s:3:\"600\";}i:4;a:2:{s:8:\"tag_name\";s:12:\"2017年10月\";s:6:\"result\";s:3:\"587\";}i:5;a:2:{s:8:\"tag_name\";s:15:\"羽海野千花\";s:6:\"result\";s:3:\"558\";}i:6;a:2:{s:8:\"tag_name\";s:9:\"漫画改\";s:6:\"result\";s:3:\"552\";}i:7;a:2:{s:8:\"tag_name\";s:2:\"TV\";s:6:\"result\";s:3:\"446\";}i:8;a:2:{s:8:\"tag_name\";s:6:\"漫改\";s:6:\"result\";s:3:\"276\";}i:9;a:2:{s:8:\"tag_name\";s:4:\"2017\";s:6:\"result\";s:3:\"253\";}i:10;a:2:{s:8:\"tag_name\";s:12:\"花泽香菜\";s:6:\"result\";s:3:\"164\";}i:11;a:2:{s:8:\"tag_name\";s:6:\"续作\";s:6:\"result\";s:3:\"151\";}i:12;a:2:{s:8:\"tag_name\";s:6:\"将棋\";s:6:\"result\";s:3:\"144\";}i:13;a:2:{s:8:\"tag_name\";s:9:\"沙发套\";s:6:\"result\";s:2:\"57\";}i:14;a:2:{s:8:\"tag_name\";s:6:\"新房\";s:6:\"result\";s:2:\"37\";}i:15;a:2:{s:8:\"tag_name\";s:6:\"日常\";s:6:\"result\";s:2:\"27\";}i:16;a:2:{s:8:\"tag_name\";s:6:\"神作\";s:6:\"result\";s:2:\"26\";}i:17;a:2:{s:8:\"tag_name\";s:6:\"青春\";s:6:\"result\";s:2:\"24\";}i:18;a:2:{s:8:\"tag_name\";s:6:\"励志\";s:6:\"result\";s:2:\"21\";}i:19;a:2:{s:8:\"tag_name\";s:6:\"竞技\";s:6:\"result\";s:2:\"20\";}i:20;a:2:{s:8:\"tag_name\";s:6:\"人生\";s:6:\"result\";s:2:\"17\";}i:21;a:2:{s:8:\"tag_name\";s:7:\"2017年\";s:6:\"result\";s:2:\"14\";}i:22;a:2:{s:8:\"tag_name\";s:6:\"成长\";s:6:\"result\";s:2:\"14\";}i:23;a:2:{s:8:\"tag_name\";s:12:\"茅野爱衣\";s:6:\"result\";s:2:\"13\";}i:24;a:2:{s:8:\"tag_name\";s:6:\"校园\";s:6:\"result\";s:2:\"12\";}i:25;a:2:{s:8:\"tag_name\";s:15:\"羽海野チカ\";s:6:\"result\";s:2:\"11\";}i:26;a:2:{s:8:\"tag_name\";s:9:\"半年番\";s:6:\"result\";s:2:\"11\";}i:27;a:2:{s:8:\"tag_name\";s:6:\"恋爱\";s:6:\"result\";s:2:\"10\";}i:28;a:2:{s:8:\"tag_name\";s:3:\"TVA\";s:6:\"result\";s:1:\"9\";}i:29;a:2:{s:8:\"tag_name\";s:9:\"剧情片\";s:6:\"result\";s:1:\"8\";}}',18,4,3,7,33,92,335,975,1491,1359,0,10,2017,10,6,'2017-10-14',0),(315957,3,'a:12:{i:0;a:2:{s:8:\"tag_name\";s:3:\"OST\";s:6:\"result\";s:2:\"31\";}i:1;a:2:{s:8:\"tag_name\";s:6:\"原神\";s:6:\"result\";s:2:\"23\";}i:2;a:2:{s:8:\"tag_name\";s:9:\"陈致逸\";s:6:\"result\";s:2:\"17\";}i:3;a:2:{s:8:\"tag_name\";s:8:\"HOYO-MiX\";s:6:\"result\";s:1:\"9\";}i:4;a:2:{s:8:\"tag_name\";s:18:\"动漫游戏原声\";s:6:\"result\";s:1:\"8\";}i:5;a:2:{s:8:\"tag_name\";s:4:\"2020\";s:6:\"result\";s:1:\"7\";}i:6;a:2:{s:8:\"tag_name\";s:6:\"中国\";s:6:\"result\";s:1:\"7\";}i:7;a:2:{s:8:\"tag_name\";s:3:\"ACG\";s:6:\"result\";s:1:\"6\";}i:8;a:2:{s:8:\"tag_name\";s:6:\"miHoYo\";s:6:\"result\";s:1:\"6\";}i:9;a:2:{s:8:\"tag_name\";s:6:\"游戏\";s:6:\"result\";s:1:\"3\";}i:10;a:2:{s:8:\"tag_name\";s:4:\"GAME\";s:6:\"result\";s:1:\"1\";}i:11;a:2:{s:8:\"tag_name\";s:12:\"游戏原声\";s:6:\"result\";s:1:\"1\";}}',2,0,1,0,0,6,15,31,16,10,0,1376,2020,9,1,'2020-09-28',0);
/*!40000 ALTER TABLE `chii_subject_fields` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 192.168.201.71    Database: bangumi
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.16.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Dumping data for table `chii_episodes`
--
-- WHERE:  ep_subject_id <= 20 and ep_subject_id != 2

LOCK TABLES `chii_episodes` WRITE;
/*!40000 ALTER TABLE `chii_episodes`
    DISABLE KEYS */;
REPLACE INTO `chii_episodes`
VALUES (522, 8, 1, 0, 0, '魔神 が 目覚める 日', '魔王的苏醒之日', 0, '24m', '2008-04-06', 'a:1:{i:0;s:16:\"http://v.qq.com/\";}', 11,
        0, '', 1218805567, 1636102860, 1, 0),
       (523, 8, 2, 0, 0, '日本独立計画', '日本独立计划', 0, '24m', '2008-04-13', '', 12, 0, '', 1218805567, 1628316829, 1, 0),
       (524, 8, 3, 0, 0, '囚われの学園', '被囚禁的学园', 0, '24m', '2008-04-20', '', 8, 0, '', 1218805567, 1623111585, 1, 0),
       (525, 8, 4, 0, 0, '逆襲の処刑台', '逆行的处刑台', 0, '24m', '2008-04-27', '', 20, 0, '', 1218805567, 1628323999, 1, 0),
       (526, 8, 5, 0, 0, 'ナイト オブ ラウンズ', '圆桌骑士', 0, '24m', '2008-05-04', '', 9, 0, '', 1218805567, 1623116092, 1, 0),
       (527, 8, 6, 0, 0, '太平洋 奇襲 作戦', '太平洋奇袭作战', 0, '24m', '2008-05-11', '', 14, 0, '', 1218805567, 1629644635, 1, 0),
       (528, 8, 7, 0, 0, '棄てられた 仮面', '被丢弃的面具', 0, '24m', '2008-05-18', '', 18, 0, '', 1218805567, 1623120129, 1, 0),
       (529, 8, 8, 0, 0, '百万のキセキ', '百万的奇迹', 0, '24m', '2008-05-25', '', 10, 0, '', 1218805567, 1614177674, 1, 0),
       (530, 8, 9, 0, 0, '朱禁城の花嫁', '朱禁城的花嫁', 0, '24m', '2008-06-08', '', 14, 0, '', 1218805567, 1624245850, 1, 0),
       (531, 8, 10, 0, 0, '神虎輝く刻', '神虎闪耀之刻', 0, '24m', '2008-06-15', '', 6, 0, '', 1218805567, 1636130590, 1, 0),
       (532, 8, 11, 0, 0, '想いの力', '思念的力量', 0, '24m', '2008-06-22', '', 12, 0, '', 1218805567, 1623204687, 1, 0),
       (89, 8, 12, 0, 0, 'ラブ アタック!', '爱的初体验', 0, '24m', '2008-07-01',
        'a:4:{i:0;s:60:\"http://6.cn/player.swf?flag=0&amp;vid=XGbUfKExdKqEUHP6OT1KvA\";i:1;s:92:\"http://www.56.com/n_v140_/c38_/18_/15_/destiy_/zhajm_121594108041x_/1470000_/0_/36562133.swf\";i:2;s:34:\"http://www.tudou.com/v/dsFjFNnuknk\";i:3;s:58:\"http://player.youku.com/player.php/sid/XMzMxODMzMjg=/v.swf\";}',
        15, 0, '', 1216105216, 1630621731, 1, 0),
       (90, 8, 13, 0, 0, '過去からの刺客', '来自过去的刺客', 0, '24m', '2008-07-06',
        'a:1:{i:0;s:60:\"http://6.cn/player.swf?flag=0&amp;vid=/4SSHQdKFFIq9HZeT6VH/g\";}', 21, 0, '', 1216718557,
        1630622493, 1, 0),
       (2, 8, 14, 0, 0, 'ギアス 狩り', 'Geass 狩猎', 0, '24m', '2008-07-12',
        'a:1:{i:0;s:60:\"http://6.cn/player.swf?flag=0&amp;vid=NvfcY73pd9Mco6_BIdCl/w\";}', 11, 0, '', 1216030436,
        1630623362, 1, 0),
       (91, 8, 15, 0, 0, 'C の 世界', 'C的世界', 0, '24m', '2008-07-20',
        'a:1:{i:0;s:60:\"http://6.cn/player.swf?flag=0&amp;vid=IBe8PhkYiLvrZ6bbAvYJeQ\";}', 10, 0, '', 1216718652,
        1630624435, 1, 0),
       (104, 8, 16, 0, 0, '超合集国決議第壱號', '超合众国决议第一号', 0, '24m', '2008-07-27',
        'a:4:{i:0;s:60:\"http://6.cn/player.swf?flag=0&amp;vid=jULceqLtM9y_nSoCLy1whQ\";i:1;s:34:\"http://www.tudou.com/v/SHkkzURdla4\";i:2;s:58:\"http://player.youku.com/player.php/sid/XMzY3OTc5NzY=/v.swf\";i:3;s:84:\"http://www.56.com/n_v162_/c37_/14_/16_/kdsic_/12174666581x_/1430000_/0_/37124943.swf\";}',
        4, 0,
        '終に実現した超合集国構想。合衆国日本と合衆国中華を中心に批准した国は47ヵ国。これによりEUは完全に弱体化し世界は超合集国とブリタニアに２分化され、世界は新たな局面を迎える。その最高評議会の場で決議された第壱號とは！',
        1217522641, 1630625021, 1, 0),
       (374, 8, 17, 0, 0, '土の味', '土之气味', 0, '24m', '2008-08-03',
        'a:5:{i:0;s:58:\"http://player.youku.com/player.php/sid/XMzc3MDU2ODA=/v.swf\";i:1;s:60:\"http://6.cn/player.swf?flag=0&amp;vid=ymDYlEkLGGMTsPl1KV23Vw\";i:2;s:87:\"http://www.56.com/n_v197_/c39_/4_/0_/ex_calibur_/121777836679_/1454000_/0_/37205808.swf\";i:3;s:34:\"http://www.tudou.com/v/3yRlw-EYCH4\";i:4;s:50:\"http://player.ku6.com/refer/vH4iNNrN7id9qmC6/v.swf\";}',
        6, 0, '', 1217744990, 1630625947, 1, 0),
       (520, 8, 18, 0, 0, '第二次 東京 決戦', '第二次东京决战', 0, '24m', '2008-08-10',
        'a:1:{i:0;s:58:\"http://player.youku.com/player.php/sid/XMzg1NTY1Njg=/v.swf\";}', 12, 0,
        'キュウシュウで、そしてトウキョウ租界で戦闘が始まった。超合集国の戦力を得た黒の騎士団とナイトオブラウンズをも投入したブリタニア軍。精鋭同士の全面対決は紅蓮聖天八極式の参戦で更に激化していく。そしてその死闘の果ての結末は…',
        1218338441, 1628393862, 1, 0),
       (574, 8, 19, 0, 0, '裏切り', '背叛', 0, '24m', '2008-08-17', '', 14, 0,
        'トウキョウ租界の決戦は多くの犠牲者を出してしまった。その混乱を突くかの如く、そのイカルガにブリタニアの特使が訪れた。自ら敵艦に乗り込んできたその人物こそ！？最凶の楔が黒の騎士団に向けられた！？', 1218893486,
        1630627352, 1, 0),
       (577, 8, 20, 0, 0, '皇帝 失格', '皇帝 失格', 0, '24m', '2008-08-24',
        'a:1:{i:0;s:58:\"http://player.youku.com/player.php/sid/XNDAyNDcwNDg=/v.swf\";}', 7, 0,
        'ロロによって窮地を脱したルルーシュ。だが、もう彼が辿るべき道は一つしか無い…。同じ頃、ブリタニア軍、黒の騎士団双方で大きなうねりが起きようとしていた。世界は新たな局面を迎えるのか？さらに神根島に降臨したブリタニア皇帝がついに動き出す！！そしてその時、ルルーシュは！？',
        1219590523, 1630628062, 1, 0),
       (593, 8, 21, 0, 0, 'ラグナレク の 接続', '诸神 黄昏 连接', 0, '24m', '2008-08-31', '', 25, 0,
        '大混乱するエリア11。引き返せない、いや引き返さない。硬く悲壮なまでの決意の元、スザクは戦いに挑む！最強の部隊を相手に彼は勝利する事が出来るのか！？そしてルルーシュもまた…。人智超越した世界で明かされる驚天動地の事実と真実は！？',
        1220203247, 1630628993, 1, 0),
       (607, 8, 22, 0, 0, '皇帝　ルルーシュ', '皇帝 鲁路修', 0, '24m', '2008-09-07', '', 14, 0, '', 1221146479, 1630629825, 1, 0),
       (609, 8, 23, 0, 0, 'シュナイゼル　の　仮面', '修耐泽尔的假面', 0, '24m', '2008-09-14', '', 9, 0, '', 1221516842, 1630630717, 1, 0),
       (1343, 8, 24, 0, 0, 'ダモクレスの空', '达摩克里斯的天空', 0, '24m', '2008-09-21', '', 6, 0, '', 1232989776, 1630631419, 1, 0),
       (1344, 8, 25, 0, 0, 'Re;', 'Re;', 0, '24m', '2008-09-28', '', 21, 0, '最终话', 1232989830, 1623384977, 1, 0),
       (1027, 12, 1, 0, 0, 'ちぃ 目覚める', '叽，觉醒了', 0, '24m', '2002-04-03',
        'a:2:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503434&amp;yid=XMzEyNjczMTY4&amp;external=bangumi\";i:1;s:60:\"http://6.cn/player.swf?flag=0&amp;vid=hkiNB/npqSwGyGFBcXBzmg\";}',
        16, 0, '', 1232950735, 1638610136, 1, 0),
       (1028, 12, 2, 0, 0, 'ちぃ でかける', '叽，出门', 0, '24m', '2002-04-10',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503435&amp;yid=XMzEyNjcxNDI0&amp;external=bangumi\";}',
        8, 0, '', 1232950735, 1638634288, 1, 0),
       (1029, 12, 3, 0, 0, 'ちぃ おぼえる', '叽，学习', 0, '24m', '2002-04-17',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503436&amp;yid=XMzEyNjcxNTg0&amp;external=bangumi\";}',
        5, 0, '', 1232950735, 1638680347, 1, 0),
       (1030, 12, 4, 0, 0, 'ちぃ おつかい', '叽，办事去', 0, '24m', '2002-04-24',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503437&amp;yid=XMzEyNjcyMDQ4&amp;external=bangumi\";}',
        6, 0, '', 1232950735, 1638266601, 1, 0),
       (1031, 12, 5, 0, 0, 'ちぃ 見つける', '叽，发现', 0, '24m', '2002-05-01',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503438&amp;yid=XMzEyNjczOTk2&amp;external=bangumi\";}',
        5, 0, '', 1232950735, 1593086909, 1, 0),
       (1032, 12, 6, 0, 0, 'ちぃ 弱る', '叽，衰弱', 0, '24m', '2002-05-08',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503439&amp;yid=XMzEyNjc0NzMy&amp;external=bangumi\";}',
        4, 0, '', 1232950735, 1638437552, 1, 0),
       (1033, 12, 7, 0, 0, 'ちぃ 働く', '叽，工作', 0, '24m', '2002-05-15',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503440&amp;yid=XMzEyNjc1OTYw&amp;external=bangumi\";}',
        4, 0, '', 1232950735, 1638523275, 1, 0),
       (1034, 12, 8, 0, 0, 'ちぃ とまどう', '叽，困惑', 0, '24m', '2002-05-22',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503441&amp;yid=XMzEyNjc2Mjc2&amp;external=bangumi\";}',
        5, 0, '', 1232950735, 1638524785, 1, 0),
       (1035, 12, 8.5, 0, 0, 'recap 新保・すもも 語る', '新保和丝茉茉的谈话', 0, '24m', '2002-05-29',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503442&amp;yid=XMzEyNjg1NDM2&amp;external=bangumi\";}',
        4, 0, '总集篇', 1232950735, 1470659348, 1, 0),
       (1036, 12, 9, 0, 0, 'ちぃ 買う', '叽，买东西', 0, '24m', '2002-06-05',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503443&amp;yid=XMzEyNjc2Nzky&amp;external=bangumi\";}',
        2, 0, '', 1232950735, 1595735127, 1, 0),
       (1037, 12, 10, 0, 0, 'ちぃ 出会う', '叽，约会', 0, '24m', '2002-06-12',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503445&amp;yid=XMzEyNjc4NjEy&amp;external=bangumi\";}',
        7, 0, '', 1232950735, 1604872635, 1, 0),
       (1038, 12, 11, 0, 0, 'ちぃ 確かめる', '叽，确定', 0, '24m', '2002-06-19',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503446&amp;yid=XMzEyNjc4OTY0&amp;external=bangumi\";}',
        9, 0, '', 1232950735, 1608386620, 1, 0),
       (1039, 12, 12, 0, 0, 'ちぃ 遊ぶ', '叽，玩游戏', 0, '24m', '2002-06-26',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503447&amp;yid=XMzEyNjc5MjMy&amp;external=bangumi\";}',
        4, 0, '', 1232950735, 1593187370, 1, 0),
       (1040, 12, 13, 0, 0, 'ちぃ 海いく', '叽，去海边', 0, '24m', '2002-07-03',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503448&amp;yid=XMzEyNjgwNzMy&amp;external=bangumi\";}',
        2, 0, '', 1232950735, 1480908866, 1, 0),
       (1041, 12, 14, 0, 0, 'ちぃ もてなす', '叽，款待', 0, '24m', '2002-07-10',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503449&amp;yid=XMzEyNjgwNzky&amp;external=bangumi\";}',
        16, 0, '', 1232950735, 1639409391, 1, 0),
       (1042, 12, 15, 0, 0, 'ちぃ 何もしない', '叽，什么也没做', 0, '24m', '2002-07-17',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503450&amp;yid=XMzEyNjgxMzcy&amp;external=bangumi\";}',
        6, 0, '', 1232950735, 1584190847, 1, 0),
       (1043, 12, 16, 0, 0, 'ちぃ まかなう', '叽，持家', 0, '24m', '2002-07-24',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503451&amp;yid=XMzEyNjgyOTM2&amp;external=bangumi\";}',
        7, 0, '', 1232950735, 1593348456, 1, 0),
       (1044, 12, 16.5, 0, 0, 'recap 稔・柚姫 語る', '稔和柚姬的谈话', 0, '24m', '31.07.2002',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503452&amp;yid=XMzEyNjg1NTYw&amp;external=bangumi\";}',
        2, 0, '', 1232950735, 1593354445, 1, 0),
       (1045, 12, 17, 0, 0, 'ちぃ 手伝う', '叽，打扫', 0, '24m', '2002-08-07',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503453&amp;yid=XMzEyNjgzMDI0&amp;external=bangumi\";}',
        5, 0, '', 1232950735, 1601876643, 1, 0),
       (1046, 12, 18, 0, 0, 'ちぃ いなくなる', '叽，不见了', 0, '24m', '2002-08-14',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503454&amp;yid=XMzEyNjgzNzM2&amp;external=bangumi\";}',
        2, 0, '', 1232950740, 1593353833, 1, 0),
       (1047, 12, 19, 0, 0, 'ちぃ 待つ', '叽，等待', 0, '24m', '2002-08-21',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503455&amp;yid=XMzEyNjg3OTcy&amp;external=bangumi\";}',
        10, 0, '', 1232950740, 1603102481, 1, 0),
       (1048, 12, 20, 0, 0, 'ちぃ 求める', '叽，愿望', 0, '24m', '2002-08-28',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503456&amp;yid=XMzEyNjg4MDI4&amp;external=bangumi\";}',
        6, 0, '', 1232950740, 1609300013, 1, 0),
       (1049, 12, 21, 0, 0, 'ちぃ 答える', '叽，答案', 0, '24m', '2002-09-04',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503457&amp;yid=XMzEyNjg4NjM2&amp;external=bangumi\";}',
        4, 0, '', 1232950740, 1609384691, 1, 0),
       (1050, 12, 22, 0, 0, 'ちぃ 着てぬぐ', '叽，换衣服', 0, '24m', '2002-09-11',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503458&amp;yid=XMzEyNjkwNDA4&amp;external=bangumi\";}',
        7, 0, '', 1232950740, 1609409093, 1, 0),
       (1051, 12, 23, 0, 0, 'ちぃ 決める', '叽，决定了', 0, '24m', '2002-09-18',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503460&amp;yid=XMzEyNjkwMjEy&amp;external=bangumi\";}',
        5, 0, '', 1232950740, 1584956903, 1, 0),
       (1052, 12, 24, 0, 0, 'ちぃ だけの人', '叽，只属于我的人', 0, '24m', '2002-09-25',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503461&amp;yid=XMzEyNjkwNDky&amp;external=bangumi\";}',
        8, 0, '', 1232950740, 1609470590, 1, 0),
       (28331, 12, 24.5, 0, 0, '日比谷・琴子 語る', '日比谷、琴子　談論', 0, '23m40s', '',
        'a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130503462&amp;yid=XMzEyNjg2MTIw&amp;external=bangumi\";}',
        5, 0, '', 1264206697, 1584274942, 1, 0),
       (3, 15, 1, 0, 0, 'Sound Horizon', '', 0, '', '', '', 0, 0, '', 1216086093, 0, 1, 0),
       (4, 15, 2, 0, 0, 'Black Chronicle', '', 0, '', '', '', 0, 0, '', 1216086093, 0, 1, 0),
       (5, 15, 3, 0, 0, '詩人バラッドの悲劇', '', 0, '', '', 'a:0:{}', 0, 0, '', 1216086093, 0, 1, 0),
       (6, 15, 4, 0, 0, 'アーベルジュの戦い', '', 0, '', '', '', 0, 0, '', 1216086093, 0, 1, 0),
       (7, 15, 5, 0, 0, '樹氷の君～凍てついた魔女～', '', 0, '', '', '', 0, 0, '', 1216086093, 0, 1, 0),
       (8, 15, 6, 0, 0, '蒼と白の境界線', '', 0, '', '', '', 0, 0, '', 1216086093, 0, 1, 0),
       (9, 15, 7, 0, 0, '雷神の左腕', '', 0, '', '', '', 0, 0, '', 1216086093, 0, 1, 0),
       (10, 15, 8, 0, 0, '少女人形', '', 0, '', '', '', 0, 0, '', 1216086093, 0, 1, 0),
       (11, 15, 9, 0, 0, '君が生まれてくる世界', '', 0, '', '', '', 0, 0, '', 1216086093, 0, 1, 0),
       (647885, 15, 10, 0, 0, '夏の時雨 [完全版]', '', 0, '', '', '', 0, 0, '', 1468305730, 0, 0, 0),
       (12, 16, 1, 0, 0, 'Sound Horizon[mode:Thanatos]', '', 0, '', '', '', 0, 0, '', 1216086187, 0, 1, 0),
       (13, 16, 2, 0, 0, 'そこに在る风景', '', 0, '', '', '', 0, 0, '', 1216086187, 0, 1, 0),
       (14, 16, 3, 0, 0, '壊れたマリオネット', '', 0, '', '', '', 0, 0, '', 1216086187, 0, 1, 0),
       (15, 16, 4, 0, 0, '银色の马车', '', 0, '', '', '', 0, 0, '', 1216086187, 0, 1, 0),
       (16, 16, 5, 0, 0, '轮廻の砂时计', '', 0, '', '', '', 0, 0, '', 1216086187, 0, 1, 0),
       (17, 16, 6, 0, 0, '珊瑚の城', '', 0, '', '', '', 0, 0, '', 1216086187, 0, 1, 0),
       (18, 16, 7, 0, 0, 'タナトスの幻想', '', 0, '', '', '', 0, 0, '', 1216086187, 0, 1, 0),
       (19, 17, 1, 0, 0, 'Sound Horizon[mode:lost]', '', 0, '', '', '', 0, 0, '', 1216086308, 0, 1, 0),
       (20, 17, 2, 0, 0, '白の幻影(White Illusion)', '', 0, '', '', '', 0, 0, '', 1216086308, 0, 1, 0),
       (21, 17, 3, 0, 0, '恋人を射ち堕とした日', '', 0, '', '',
        'a:1:{i:0;s:92:\"http://www.xiami.com/song/play?ids=/song/playlist/id/3536492/object_name/default/object_id/0\";}',
        1, 0, '', 1216086308, 1388115766, 1, 0),
       (22, 17, 4, 0, 0, '魔法使いサラバント', '', 0, '', '', '', 0, 0, '', 1216086308, 0, 1, 0),
       (23, 17, 5, 0, 0, '槛の中の游戯', '', 0, '', '', '', 0, 0, '', 1216086308, 0, 1, 0),
       (24, 17, 6, 0, 0, '记忆の水底', '', 0, '', '', '', 0, 0, '', 1216086308, 0, 1, 0),
       (25, 17, 7, 0, 0, '失われた诗', '', 0, '', '', '', 2, 0, '', 1216086308, 1286374130, 1, 0),
       (26, 17, 8, 0, 0, '绯色の花', '', 0, '', '', '', 0, 0, '', 1216086308, 0, 1, 0),
       (27, 17, 9, 0, 0, 'ゆりかご', '', 0, '', '', '', 0, 0, '', 1216086308, 0, 1, 0),
       (28, 17, 10, 0, 0, '永远の少年', '', 0, '', '', '', 0, 0, '', 1216086308, 0, 1, 0),
       (29, 17, 11, 0, 0, '忘レモノ', '', 0, '', '', '', 0, 0, '', 1216086308, 0, 1, 0),
       (30, 17, 12, 0, 0, '忘レモノハ在リマセンカ', '', 0, '', '', '', 0, 0, '', 1216086308, 0, 1, 0),
       (31, 18, 1, 0, 0, 'お愿い！ぴこ魔神☆', '', 0, '', '', '', 0, 0, '', 1216086492, 0, 1, 0),
       (32, 18, 2, 0, 0, 'ぴこＤＪ☆', '', 0, '', '', '', 0, 0, '', 1216086492, 0, 1, 0),
       (33, 18, 3, 0, 0, '诗人バラッドの悲剧', '', 0, '', '', '', 0, 0, '', 1216086492, 0, 1, 0),
       (34, 18, 4, 0, 0, '辿りつく诗', '', 0, '', '', '', 0, 0, '', 1216086492, 0, 1, 0),
       (35, 18, 5, 0, 0, '雷神の系谱', '', 0, '', '', '', 0, 0, '', 1216086492, 0, 1, 0),
       (36, 18, 6, 0, 0, 'Ark', '', 0, '', '', '', 0, 0, '', 1216086492, 0, 1, 0),
       (37, 18, 7, 0, 0, '魔女とラフレンツェ', '', 0, '', '', '', 0, 0, '', 1216086492, 0, 1, 0),
       (38, 18, 8, 0, 0, '魔法使いサラバント', '', 0, '', '', '', 0, 0, '', 1216086492, 0, 1, 0),
       (39, 18, 9, 0, 0, '恋人を射ち堕とした日', '', 0, '', '', '', 0, 0, '', 1216086492, 0, 1, 0),
       (40, 18, 10, 0, 0, '银色の马车', '', 0, '', '', '', 0, 0, '', 1216086492, 0, 1, 0),
       (41, 18, 11, 0, 0, 'タナトスの幻想は终わらない', '', 0, '', '', '', 0, 0, '', 1216086492, 0, 1, 0),
       (42, 19, 1, 0, 0, '...Reloaded', '', 0, '', '', '', 0, 0, '', 1216086634, 0, 1, 0),
       (43, 19, 2, 0, 0, '屋根裏の少女', '', 0, '', '', '', 0, 0, '', 1216086634, 0, 1, 0),
       (44, 19, 3, 0, 0, '槛の中の游戯', '', 0, '', '', '', 0, 0, '', 1216086634, 0, 1, 0),
       (45, 19, 4, 0, 0, '槛の中の花', '', 0, '', '', '', 0, 0, '', 1216086634, 0, 1, 0),
       (46, 19, 5, 0, 0, 'Ark [Reloaded ver]', '', 0, '', '', '', 0, 0, '', 1216086634, 0, 1, 0),
       (47, 19, 6, 0, 0, '轮廻の砂时计', '', 0, '', '', '', 0, 0, '', 1216086634, 0, 1, 0),
       (48, 19, 7, 0, 0, '澪音の世界', '', 0, '', '', '', 0, 0, '', 1216086634, 0, 1, 0),
       (113732, 19, 8, 0, 0, '(Track8)- They there said reloaeded', '', 0, '', '', '', 0, 0, '', 1312365129, 0, 1, 0),
       (113733, 19, 9, 0, 0, '(Extra Track )ぴこまりんご饴☆', '', 0, '', '', '', 0, 0, '', 1312365149, 0, 1, 0),
       (113734, 19, 10, 0, 0, '(Extra Track) [P.M.R]高速再生集', '', 0, '', '', '', 0, 0, '', 1312365162, 0, 1, 0),
       (991, 20, 1, 0, 0, '黒の予言書', '', 0, '', '',
        'a:1:{i:0;s:60:\"http://6.cn/player.swf?flag=0&amp;vid=hkiNB/npqSwGyGFBcXBzmg\";}', 1, 0, '', 1232912313,
        1375024915, 1, 0),
       (992, 20, 2, 0, 0, '詩人バラッドの悲劇', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (993, 20, 3, 0, 0, '辿りつく詩', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (994, 20, 4, 0, 0, 'アーベルジュの戦い', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (995, 20, 5, 0, 0, '約束の丘', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (996, 20, 6, 0, 0, '薔薇の騎士団', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (997, 20, 7, 0, 0, '聖戦と死神　第一部「銀色の死神」 ～戦場を駈ける者～', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (998, 20, 8, 0, 0, '聖戦と死神　第二部「聖戦と死神」 ～英雄の不在～', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (999, 20, 9, 0, 0, '聖戦と死神　第三部「薔薇と死神」 ～歴史を紡ぐ者～', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (1000, 20, 10, 0, 0, '聖戦と死神　第四部「黒色の死神」 ～英雄の帰還～', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (1001, 20, 11, 0, 0, '書の囁き', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (1002, 20, 12, 0, 0, '蒼と白の境界線', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (1003, 20, 13, 0, 0, '沈んだ歌姫', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (1004, 20, 14, 0, 0, '海の魔女', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (1005, 20, 15, 0, 0, '碧い眼の海賊', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (1006, 20, 16, 0, 0, '雷神の左腕', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (1007, 20, 17, 0, 0, '雷神の系譜', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (1008, 20, 18, 0, 0, '書の魔獣', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (1009, 20, 19, 0, 0, 'キミが生まれてくる世界', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (1010, 20, 20, 0, 0, '＜ハジマリ＞のChronicle', '', 0, '', '', '', 0, 0, '', 1232912313, 0, 1, 0),
       (1062152, 20, 21, 0, 0, '＜空白＞のChronicle', '', 0, '', '', '', 0, 0, '', 1634225602, 0, 0, 0);
/*!40000 ALTER TABLE `chii_episodes`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2021-12-16  8:29:05

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_subjects` WRITE;
/*!40000 ALTER TABLE `chii_subjects` DISABLE KEYS */;
REPLACE INTO `chii_subjects` VALUES (253,2,'カウボーイビバップ','星际牛仔','tt0213338',85,1217549729,'c2/4c/253_t3XWb.jpg',1,'{{Infobox animanga/TVAnime\r\n|中文名= 星际牛仔\r\n|别名={\r\n[Cowboy Bebop]\r\n[宇宙牛仔]\r\n[赏金猎人]\r\n[太空牛仔]\r\n[恶男杰特]\r\n}\r\n|话数= 26\r\n|放送开始= 1998年10月23日\r\n|放送星期= 星期五\r\n|官方网站= http://www.cowboybebop.org/；http://www.cowboy-bebop.net/index.html\r\n|播放电视台= WOWOW、テレビ東京\r\n|其他电视台= \r\n|播放结束= 1999年4月23日\r\n|其他= \r\n|Copyright= \r\n|原作= 矢立肇\r\n|导演= 渡辺信一郎\r\n|脚本= 渡辺信一郎、稲荷昭彦、横手美智子、信本敬子、村井さだゆき、佐藤大、山口亮太\r\n|分镜= 渡辺信一郎、本郷みつる、飯田馬之介、都留稔幸、山内重保、森邦宏、赤根和樹、佐藤順一、武井良幸、山口祐司、佐藤育郎、岡村天斎\r\n|演出= 山田弘和、森邦宏、武井良幸、佐藤育郎\r\n|音乐= シートベルツ、菅野よう子\r\n|人物设定= 川元利浩\r\n|分镜构图= 入江泰浩\r\n|系列构成= 信本敬子\r\n|作画监督= しんぼたくろう、中田栄治、本橋秀之、菅野宏紀、逢坂浩司、小森高博、竹内浩志、川元利浩、後藤雅巳\r\n|机械设定= 山根公利\r\n|摄影监督= 大神洋一\r\n|原画= 逢坂浩司、中田栄治、後藤雅巳、小森高博、杉浦幸次、中村豊、伊藤嘉之、斎藤恒徳、鴨川浩、伊藤岳史、横山彰利、星和伸、大塚健、宮田忠明、吉田徹、川元利浩、菅野宏紀、橋本誠一、富岡隆司、井上英紀、岡真里子、津野田勝敏、入江泰浩、佐藤千春、高橋しんや、伊東伸高、高山朋浩\r\n|主题歌编曲= 菅野よう子\r\n|主题歌作曲= 菅野よう子\r\n|企画= サンライズ\r\n|制作管理= 鳥羽聡\r\n|设定= 鳥羽聡、河森正治、佐藤大\r\n|音响监督= 小林克良\r\n|特效= 長谷川敏生\r\n|制片人= 南雅彦\r\n|制作助手= BONES\r\n|动画制作= サンライズ\r\n|テレビ東京版={\r\n[1998年4月3日 - 1998年6月26日]\r\n[全12话+总集篇]\r\n}\r\n}}','       2021年，随着超光速航行技术的实现，人类得以在太阳系范围内方便的自由移动，但是由于设计上的失误，这种技术引发了月球的爆炸，无数的月球碎片被吸引向地球，造成了空前绝后的大灾难。存活下来的人类逃离地球，并开始在太阳系各地建立家园。由于这次灾难，国家、政府等权利机构都极为不稳定、治安问题也成为了一个难题。为了在人力资源不足的情况下抓捕罪犯，有些组织开始允许个人抓捕通缉的罪犯并换取奖金，“赏金猎人”这个职业也就由此诞生了。\r\n\r\n       史派克（Spike）和杰特（Jet）是驾驶飞船Bebop号在宇宙中以捉拿逃犯获取奖金为生的赏金猎人。两人在星际间的旅程中，结识了身负巨债、嗜财如命的美女菲（Faye）和电脑神童艾德（Ed），并收养了拥有高智商的数据狗爱因（Ein）。从此，四人一狗游荡在广阔之宇宙之中，在自己与他人的生活中经历著种种悲欢离合，也寻找著各自的过去。','',0,26,4270,11261,1454,697,114,0,0,'x',0,0,0),(315957,3,'原神-风与牧歌之城 City of Winds and Idylls','风与牧歌之城','',8202,1601273894,'db/c8/315957_8hX0e.jpg',0,'{{Infobox Album\r\n|中文名= 风与牧歌之城\r\n|别名={\r\n[《原神》公测纪念OST-蒙德篇]\r\n}\r\n|版本特性= Digital\r\n|发售日期= 2020-09-28\r\n|价格= \r\n|播放时长= \r\n|录音= \r\n|碟片数量= 3\r\n|厂牌= miHoYo\r\n|作曲= 陈致逸\r\n|艺术家= 陈致逸\r\n}}','《原神》公测纪念OST-蒙德篇专辑《风与牧歌之城 City of Winds and Idylls》正式上线，专辑分为《风与牧歌之城 City of Winds and Idylls》、《蒲公英的国度 the Horizon of Dandelion》与《蒙德战记 Saga of the West Wind》3张分碟，共收录63首由陈致逸@HOYO-MiX为《原神》蒙德地区创作的原声音乐。','',0,0,2,91,9,0,5,0,0,'f',0,0,0);
/*!40000 ALTER TABLE `chii_subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_subjects` WRITE;
/*!40000 ALTER TABLE `chii_subjects` DISABLE KEYS */;
REPLACE INTO `chii_subjects` VALUES (495,1,'×××HOLiC','×××HOLiC','',1,1217657840,'35/05/495_Ovvsp.jpg',1001,'{{Infobox animanga/Manga\r\n|中文名= ×××HOLiC\r\n|别名={\r\n[次元魔女]\r\n[XXXHOLIC]\r\n[xxxHOLiC]\r\n[沉迷女儿香]\r\n[×××HOLiC·笼]\r\n[xxxholic笼]\r\n[四月一日灵异事件簿]\r\n[四月一日奇妙事件薄]\r\n}\r\n|出版社={\r\n[jp|講談社]\r\n[tw|東立]\r\n}\r\n|价格= \r\n|其他出版社= \r\n|连载杂志={\r\n[週刊ヤングマガジン（2003年 - 2010年）]\r\n[別冊少年マガジン（2010年 - 2011年）]\r\n}\r\n|发售日= \r\n|册数= 19\r\n|页数= \r\n|话数= 213\r\n|ISBN= \r\n|其他= \r\n|开始= 2003年13号(週刊ヤングマガジン)\r\n|结束= 2011年3月号(別冊少年マガジン)\r\n}}','      四月一日君尋進入了別名為次元魔女並自稱為壹原侑子所擁有的能夠實現任何願望的店。侑子說只要四月一日能付出對等的代價，就可以幫助四月一日實現－「可以讓你看不見妖怪，而且，讓妖怪不受你的血所吸引」的願望。因此四月一日答應侑子的條件，侑子便讓四月一日在其店中打工作為代價，直到時數足以實現願望。\r\n\r\n      “這世上有許多不可思議的事，不管是再古怪、再稀奇的事，一旦沒有人、一旦沒有人看見、一旦與人無關的話，就只不過是現象，瞬間即逝的事...，只有，人類...才是這世上最神秘又不可思議的生物────”\r\n\r\n      “世界上有許多不可思議的事，那家店也是其中之一。那裏是能夠實現願望的店，自行停止時間的店主繼承，經手秘密委託的地點。那家店確實存在，可是不對所有生物開放。有緣時，只有有緣的生物能夠...得知、造訪、見到閉門不出的店主。”','CLAMP是日本漫画家组合，是个著名和多产的漫画家团体。作品有：华丽风格的《圣传》、《东京巴比伦》、《X》、《魔法骑士雷阿斯》；清新风格的《Wish》、《少女情怀总是诗》、《喜欢，所以喜欢》《CLOVER》、《小鸠》；童真风格的《百变小樱》、《ANGELIC LAYER 天使领域》；奇幻风格的《迷幻药局》；可爱风格的《Chobits》；少年风格的《xxxHOLiC》、《TSUBASA翼》等。',19,213,159,477,82,44,15,1,0,'',0,0,0),(497,1,'ちょびっツ','人形电脑天使心','',1,1217658146,'73/80/497_7mGTv.jpg',1001,'{{Infobox animanga/Manga\r\n|中文名= 人形电脑天使心\r\n|别名={\r\n[en|Chobits]\r\n}\r\n|出版社= 講談社、台灣東販、天下出版\r\n|价格= \r\n|其他出版社= \r\n|连载杂志= 週刊ヤングマガジン\r\n|发售日= \r\n|册数= 8\r\n|页数= \r\n|话数= 88\r\n|ISBN= \r\n|其他= \r\n|作者= CLAMP\r\n|开始= 2000年第43号\r\n|结束= 2002年第48号\r\n}}','　　故事講述重考生本須和秀樹，身無分文隻身來到東京卻想擁有一部價格昂貴的人形電腦。\r\n　　於東京，人形電腦是非常普及的家電。\r\n　　他心想「如果可在垃圾堆中撿到一部便好了」，卻如他所願在東京的一晚撿到一部人形電腦……\r\n\r\n　　本作从2000年9月至2002年10月间于日本讲谈社《周刊Young Magazine》连载。共88话。单行本全8卷。\r\n　　作品的特征之一，就是并未出现CLAMP作品中有着象征性存在的“东京铁塔”。本作与《天使领域》存在人物关联。','CLAMP是日本漫画家组合，是个著名和多产的漫画家团体。作品有：华丽风格的《圣传》、《东京巴比伦》、《X》、《魔法骑士雷阿斯》；清新风格的《Wish》、《少女情怀总是诗》、《喜欢，所以喜欢》《CLOVER》、《小鸠》；童真风格的《百变小樱》、《ANGELIC LAYER 天使领域》；奇幻风格的《迷幻药局》；可爱风格的《Chobits》；少年风格的《xxxHOLiC》、《TSUBASA翼》等。',8,88,107,520,18,19,7,1,0,'r',0,0,0),(499,1,'文学少女','文学少女','',1,1217658999,'3c/f1/499_QyAUf.jpg',1002,'{{Infobox animanga/Novel\r\n|中文名= 文学少女\r\n|别名={\r\n[Book Girl]\r\n}\r\n|出版社= エンターブレイン、尖端出版，人民文学出版社，上海文艺出版社\r\n|价格= \r\n|连载杂志= FB Online（短篇部分）\r\n|发售日= \r\n|册数= 16\r\n|页数= \r\n|话数= \r\n|ISBN= \r\n|其他= \r\n|作者= 野村美月\r\n|插图= 竹岡美穂\r\n|开始= 2006-04-28\r\n|结束= 2011-04-30\r\n}}','《文学少女》系列小说，长篇每卷皆以一部实际存在的经典小说为主线文本，推动剧情前进。故事围绕圣条学园文艺社社长天野远子和社员井上心叶的事件与解谜。小说基本上以井上心叶的第一人称进行，但不时穿插“第二某人”的第一人称口白心境（粗体字），是故事黑幕的重要提示。','野村美月是日本轻小说作家，福冈县出生，东洋大学文学部毕业，2001年出道成为作家。\r\n受《清秀佳人》、《小妇人》等少女小说影响颇深，写作主题偏向粉红色的青春喜剧。2006年，野村美月欲摆脱昔日风格，以能表现严肃、温馨又哀伤的气氛为目标，创作以文学名著贯穿全局的《文学少女》系列，获得之前未有的高度评价。\r\n\r\n竹冈美穗（7月1日 - ）是日本的插画家。东京出身。 第九回コバルトイラスト大赏得奖后，以插画家的身分出道。 小说家竹冈叶月的姊姊。',16,0,753,2282,500,166,54,1,0,'w',0,0,0);
/*!40000 ALTER TABLE `chii_subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_episodes` WRITE;
/*!40000 ALTER TABLE `chii_episodes` DISABLE KEYS */;
REPLACE INTO `chii_episodes` VALUES (519,253,1,0,0,'アステロイド・ブルース Asteroid Blues','小行星蓝调',0,'00:24:43','1998-10-23','a:7:{i:0;s:47:\"http://v.youku.com/v_show/id_XMTA4OTQyOTY=.html\";i:1;s:38:\"http://player.56.com/v_NTExMjI2MDM.swf\";i:2;s:40:\"http://www.tudou.com/v/u_252U0EERY/v.swf\";i:3;s:42:\"http://www.letv.com/ptv/vplay/1305391.html\";i:4;s:60:\"http://6.cn/player.swf?flag=0&amp;vid=hkiNB/npqSwGyGFBcXBzmg\";i:5;s:39:\"http://www.bilibili.com/video/av488321/\";i:6;s:3:\"...\";}',66,0,'脚本：信本敬子  絵コンテ：渡辺信一郎  演出：武井良幸  作画監督：川元利浩  メカ作画監督：佐野浩敏\r\n\r\n賞金首のアシモフを追うスパイクとジェット。アシモフは敵対する組織から非合法の目薬ドラッグ“ブラッディアイ”を盗み出していた。アシモフは恋人のカテリーナと共に、ブラッディアイを売り捌こうと売人のバーテンの店を訪れるが……\r\n\r\nドラッグを使用した時にアシモフが見るモノトーン調な映像やトリップ感覚を、デジタル処理で巧みに表現！',1218302619,1638731153,1,0),(7027,253,2,0,0,'野良犬のストラット Stray Dog Strut','野狗阔步',0,'00:22:17','1998-04-03','a:2:{i:0;s:40:\"http://www.tudou.com/v/Q31p9pbfa8A/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765568&amp;yid=XNTEwNDc1OTU2&amp;external=bangumi\";}',38,0,'脚本：横手美智子  絵コンテ：渡辺信一郎  演出：佐藤育郎  作画監督：竹内浩志\r\n\r\n賞金首は格闘家の連続ペット窃盗犯。なぜかスパイクたちだけでなく、動物研究所もその男の行方を追っていた……。一匹の犬を巡ってチャイナタウンで巻き起こる大騒動！\r\n\r\n第1話から一転、コミカルタッチで描かれたビバップ号の愛犬となるアインの登場秘話。音楽の使われ方も素晴らしく、スパイクのブルース・リーに関するウンチクも冴える！\r\n\r\n注：标题取自 Stray Cats 的单曲 Stray Cat Strut 。',1245507149,1629024287,1,0),(7028,253,3,0,0,'ホンキィ・トンク・ウィメン Honky Tonk Women','酒馆女郎',0,'00:24:42','1998-04-10','a:2:{i:0;s:40:\"http://www.tudou.com/v/bm3yKoPYCOg/v.swf\";i:1;s:39:\"http://www.bilibili.tv/video/av488321/#\";}',42,0,'脚本：山口亮太/信本敬子  絵コンテ：赤根和樹  演出：森邦宏  作画監督：本橋秀之  メカ作画監督：後藤雅巳\r\n\r\n一攫千金を狙ってカジノにやって来たスパイクとジェット。人違いから裏取引に巻き込まれたスパイクたちは、手にした一枚のチップをネタにカジノのオーナー、ゴードンから大金をせしめようとするが……\r\n\r\n女イカサマ師・フェイの初登場話。愛機レッドテイルを自在に操り、転んでもタダでは起きないフェイの胡散臭い魅力が爆発のエピソードです！\r\n\r\n注：标题取自 The Rolling Stones 的同名歌曲。',1245507198,1637555376,1,0),(7029,253,4,0,0,'ゲイトウェイ・シャッフル Gateway Shuffle','网关曳步舞',0,'00:24:41','1998-11-13','a:2:{i:0;s:40:\"http://www.tudou.com/v/OUB9XiOHnwM/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765571&amp;yid=XNTEwNDc1OTYw&amp;external=bangumi\";}',43,0,'脚本：村井さだゆき  絵コンテ：武井良幸  演出：武井良幸  作画監督：しんぼたくろう  メカ作画監督：後藤雅巳\r\n\r\n過激な環境保護団体「スペース・ウォリアーズ」の女リーダー、トゥインクルを捕えたスパイクだが、換金しようとした矢先、彼女の賞金が突然取り消されてしまった。渋々トゥインクルを解放するスパイク。だが、トゥインクルは報復のため位相差空間内からウイルスミサイルを発射するのだった……\r\n\r\n迫り来るミサイルとスパイクの競走は手に汗握る！\r\n\r\n注：曳步舞（Shuffle），由于发源地是澳大利亚墨尔本，故也被叫做墨尔本曳步舞（MelbourneShuffle），早期为了区分 Shuffle 这个词的多元性才加了地区的前缀，目前大多直接用 Shuffle 。曳步舞动作简洁、快速有力、节奏感强，是一种自由度很高、个性十足的舞步。结合本集内容将标题选择了这个中译。',1245507226,1632746318,1,0),(7030,253,5,0,0,'堕天使たちのバラッド Ballad Of Fallen Angels','堕天使们的抒情曲',0,'00:24:01','1998-11-20','a:2:{i:0;s:40:\"http://www.tudou.com/v/tHm4Q56CrjI/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765572&amp;yid=XNTEwNDc1OTY4&amp;external=bangumi\";}',91,0,'脚本：横手美智子  絵コンテ：渡辺信一郎  演出：渡辺哲哉  作画監督：川元利浩  メカ作画監督：後藤雅巳\r\n\r\nスパイクがレッド・ドラゴンの構成員だった頃の恩人、マオに高額の賞金がかけられた。だがそれは、スパイク抹殺のための罠だった……。マオを殺し、罠を仕掛けたのはかつての相棒、ビシャス。今、二人の対決が幕を開ける！\r\n\r\nスパイク生涯の宿敵ビシャスが初登場。オペラとハードアクションが絶妙にマッチしたクールでスタイリッシュな一本だ！',1245507250,1636434213,1,0),(7031,253,6,0,0,'恶魔を怜れむ歌 Sympathy For The Devil','给恶魔的哀怜之歌',0,'00:24:42','1998-11-27','a:2:{i:0;s:40:\"http://www.tudou.com/v/NdJexUdDqMI/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765573&amp;yid=XNTEwNDc1OTcy&amp;external=bangumi\";}',54,0,'脚本：信本敬子  絵コンテ：岡村天斎  演出：佐藤育郎  作画監督：竹内浩志  メカ作画監督：後藤雅巳\r\n\r\nスパイクたちが追う賞金首のジラフが何者かに殺された。調査を開始したスパイクは、ジラフが探していたゼブラという車椅子の男に辿り着く。だが、そこで口を開いたのはゼブラに付き添っていた少年のウェンだった……少年に隠された秘密とは？\r\n\r\nスパイクが天才少年ブルースハーピストの謎に迫る！オカルトチックなSF感溢れる奇妙な物語。\r\n\r\n注：标题取自 The Rolling Stones 的同名歌曲。',1245507269,1636558342,1,0),(7032,253,7,0,0,'ヘヴィ・メタル・クイーン Heavy Metal Queen','重金属皇后',0,'00:24:42','1998-04-17','a:2:{i:0;s:40:\"http://www.tudou.com/v/Z1edXjWyL14/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765574&amp;yid=XNTEwNDc1OTc2&amp;external=bangumi\";}',49,0,'脚本：横手美智子  絵コンテ：岡村天斎  演出：森邦宏  作画監督：本橋秀之  メカ作画監督：後藤雅巳\r\n\r\n爆発物のスペシャリストで賞金首のデッカーを追っている最中、スパイクは女トラッカーのVTと出会う。一方、賞金を一人占めしようと別行動でデッカーを探していたフェイは、一度は発見するが取り逃がしてしまう。それを知ったVTは、トラック仲間からの情報でデッカーが乗った機体の追跡を開始するが……\r\n\r\n全編に流れるヘヴィ・メタルが痛快！',1245507294,1631030321,1,0),(7033,253,8,0,0,'ワルツ・フォー・ヴィーナス Waltz For Venus','金星华尔兹',0,'00:24:35','1998-04-24','a:2:{i:0;s:40:\"http://www.tudou.com/v/4plGLX4Ba08/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765575&amp;yid=XNTEwNDc1OTky&amp;external=bangumi\";}',45,0,'脚本：横手美智子  絵コンテ：武井良幸  演出：武井良幸  作画監督：しんぼたくろう  メカ作画監督：後藤雅巳\r\n\r\n金星病で視力を失った妹ステラのため、自分の所属するピカロ一味から、金星病の薬草「グレイアッシュ」を持ち逃げした青年ロコ。その逃走中、スパイクと出会ったロコは、薬草をスパイクに託し、姿を消してしまう。数日後、ロコに指定された場所に向かったスパイクを待っていたのは……\r\n\r\n最後に流れるオルゴールの音色が静かに哀しみを強調する。',1245507313,1639368639,1,0),(7034,253,9,0,0,'ジャミング・ウィズ・エドワードJamming With Edward','与艾德华竞飙',0,'00:24:33','1998-05-01','a:2:{i:0;s:40:\"http://www.tudou.com/v/gJPNk8rxR_s/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765576&amp;yid=XNTEwNDc1OTg4&amp;external=bangumi\";}',60,0,'脚本：佐藤大  絵コンテ：渡辺信一郎  演出：佐藤育郎  作画監督：小森高博  メカ作画監督：後藤雅巳\r\n\r\n地表に人工衛星を使って落書きをしたハッカーを追って地球に来たスパイクたち。それを知ったエドは、兼ねてから興味を持っていたスパイクたちの手助けをしようと犯人を追うが……\r\n\r\n天才ハッカー、エドの初登場話。地表に絵を描いた衛星をハッキングしたり、ビバップ号をラジコン飛行機のように操ったりと、彼女の悪戯心が遺憾なく発揮されている！\r\n\r\n注：标题取自 The Rolling Stones 的三位成员与 Nicky Hopkins 、 Ry Cooder 在1972年发行的专辑名。',1245507350,1629129420,1,0),(7035,253,10,0,0,'ガニメデ慕情 Ganymede Elegy','木卫三挽歌',0,'00:24:41','1998-05-08','a:2:{i:0;s:40:\"http://www.tudou.com/v/0EuWbemfv28/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765577&amp;yid=XNTEwNDc1OTg0&amp;external=bangumi\";}',68,0,'脚本：稲荷昭彦  絵コンテ：山口祐司  演出：山田弘和  作画監督：逢坂浩司  メカ作画監督：後藤雅巳\r\n\r\nある日突然、自分のもとから去って行った、かつての恋人アリサのことを昔馴染みから聞かされたジェットは、一人で故郷ガニメデに向かう。ガニメデに到着し、アリサと再会したジェットだったが、アリサには新たな恋人リントがいた。だが、リントは賞金首だったのだ……\r\n\r\n様々な音楽がモチーフとなる「ビバップ」だが、今回はズバリ“演歌”です！',1245507371,1636884301,1,0),(7036,253,11,0,0,'闇夜のヘヴィ・ロック Toys In The Attic','阁楼上的玩具',0,'00:24:41','1998-05-15','a:2:{i:0;s:40:\"http://www.tudou.com/v/FHUgg8yVwNY/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765578&amp;yid=XNTEwNDc1OTk2&amp;external=bangumi\";}',82,0,'脚本：横手美智子  絵コンテ：森邦宏  演出：森邦宏  作画監督：しんぼたくろう  メカ作画監督：後藤雅巳\r\n\r\nビバップ号の船内でジェットが何かに首筋を刺され、そのまま気絶してしまった。真相の究明に乗り出すスパイクだが、病名はおろか刺した生物の見当すらつかない。そうこうしている内に、続いてフェイ、アインも襲われ、床に伏せてしまうのだった……\r\n\r\n映画「エイリアン」シリーズを彷彿させるビバップ号を舞台にした密室サスペンス・パロディー！\r\n\r\n注：标题取自美国摇滚乐队 Aerosmith 的同名专辑。',1245507402,1639329856,1,0),(7037,253,12,0,0,'ジュピター・ジャズ（前编） Jupiter Jazz (PART 1)','木星爵士乐（前篇）',0,'00:24:41','1998-05-22','a:2:{i:0;s:40:\"http://www.tudou.com/v/7x2WOUhOV9k/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765579&amp;yid=XNTEwNDc2MDAw&amp;external=bangumi\";}',39,0,'脚本：信本敬子  絵コンテ：岡村天斎  演出：武井良幸  作画監督：川元利浩  メカ作画監督：後藤雅巳\r\n\r\n目薬ドラッグ「レッド・アイ」の取引に、木星の衛星カリストへ向かうビシャス。その頃、ビバップ号の金庫の中身を持ち逃げしたフェイを追っていたスパイクたちは、ジュリアという名前にぶち当たる。女の名に顔色を変えたスパイクは、ジェットの制止を振り切りカリストに向かう。その頃、フェイはグレンと名乗る不思議な青年に出会っていた……',1245507419,1637122117,1,0),(7038,253,13,0,0,'ジュピター・ジャズ（后编） Jupiter Jazz (PART 2)','木星爵士乐（后篇）',0,'00:24:41','1998-05-29','a:2:{i:0;s:40:\"http://www.tudou.com/v/-Ddsjlf5X5E/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765581&amp;yid=XNTEwNDc2MDA0&amp;external=bangumi\";}',53,0,'脚本：信本敬子  絵コンテ：岡村天斎  演出：佐藤育郎  作画監督：小森高博  メカ作画監督：後藤雅巳\r\n\r\nビシャスと再会したスパイクは、かつての弟分リンの銃撃の前に倒れ、グレンはフェイにビシャスとの壮絶な過去を告げる。そして、グレンはビシャスに復讐するため罠を仕掛ける。そこに復活したスパイクも加わり、ビシャス、グレン、スパイクによる三つ巴の空中戦が始まった！\r\n\r\n名曲「SPACE LION」が流れるエンディングが渋くて超カッコ良いぞ！',1245507441,1637122264,1,0),(7039,253,14,0,0,'ボヘミアン・ラプソディ Bohemian Rhapsody','波西米亚狂想曲',0,'00:24:41','1998-06-05','a:2:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765580&amp;yid=XNTEwNDc2MDA4&amp;external=bangumi\";i:1;s:47:\"http://www.tudou.com/programs/view/yxOKL03hgaU/\";}',43,0,'脚本：佐藤大  絵コンテ：都留稔幸  演出：山田弘和  作画監督：しんぼたくろう  メカ作画監督：後藤雅巳\r\n\r\n次々と起こる位相差空間ゲートのハッキング事件。スパイクたちもその実行犯は捕えるものの、彼らを操る首謀者の姿が見えてこない。唯一の手がかりは実行犯が持っていたチェスの駒のみであった。だが、その駒の仕掛けに気付いたエドは、チェスのネット対戦を始め、黒幕の“チェスマスター・ヘックス”の存在を突き止める。果たして、その正体とは？\r\n\r\n注：标题取自 Queen 的同名歌曲。',1245507458,1637209324,1,0),(7040,253,15,0,0,'マイ・ファニー・ヴァレンタイン My Funny Valentine','我可爱的情人',0,'00:24:41','1998-06-12','a:1:{i:0;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765582&amp;yid=XNTEwNDc2MDEy&amp;external=bangumi\";}',52,0,'脚本：信本敬子  絵コンテ：岡村天斎  演出：森邦宏  作画監督：逢坂浩司  メカ作画監督：後藤雅巳\r\n\r\nある日、フェイはアインに自分の過去のことを呟く。三年前にコールドスリープから目覚めたフェイ。だが、フェイはコールドスリープ以前の記憶を失っていた。その上、手術代など合わせて三億ウーロンの借金も背負ってしまう。そんなフェイを支えていたのが担当の弁護士ウィットニーだった……\r\n\r\nフェイの秘められた過去が垣間見られるエピソード！\r\n\r\n注：标题取自 Chet Baker 的同名歌曲。',1245507529,1637897682,1,0),(7041,253,16,0,0,'ブラック・ドッグ・セレナーデ Black Dog Serenade','黑犬小夜曲',0,'00:24:41','1999-02-12','a:2:{i:0;s:40:\"http://www.tudou.com/v/HpClY0AFJb8/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765583&amp;yid=XNTEwNDc1NzEy&amp;external=bangumi\";}',37,0,'脚本：横手美智子  絵コンテ：山内重保  演出：佐藤育郎  作画監督：竹内浩志  メカ作画監督：後藤雅巳\r\n\r\n冥王星へ向かう囚人輸送宇宙船の内部で、囚人たちによる反乱が発生した。その中には、昔、ジェットの左腕を奪った殺し屋ウダイがいた。かつての同僚ファドからその情報を聞いたジェットは、ファドと共に包囲網を突破して行方不明となった宇宙船の追跡を開始するが……\r\n\r\nジェットが“ブラック・ドッグ”と呼ばれていた警官時代の過去が描かれる。',1245507559,1638792827,1,0),(7042,253,17,0,0,'マッシュルーム・サンバ Mushroom Samba','蘑菇桑巴',0,'00:24:18','1999-02-19','a:2:{i:0;s:40:\"http://www.tudou.com/v/zrPgavNwQs0/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765584&amp;yid=XNTEwNDc2MjQ4&amp;external=bangumi\";}',59,0,'脚本：横手美智子/渡辺信一郎  絵コンテ：渡辺信一郎  演出：森邦宏  作画監督：しんぼたくろう/中田栄治  メカ作画監督：後藤雅巳\r\n\r\n一文無しで、宇宙を漂流していたビバップ号は当て逃げに遭い、木星の衛星イオに不時着してしまう。近くの町に食料を調達に出かけたエドとアインは、一人の不思議な老人に出会う。その老人からキノコを貰ったエドは、腹を減らしたビバップ号の面々にお裾分け。すると、めくるめくトリップの世界が彼らを待っていた……\r\n\r\nエドとアインの魅力全開！',1245507613,1632281102,1,0),(7043,253,18,0,0,'スピーク・ライク・ア・チャイルド Speak Like a Child','童言童语',0,'00:24:42','1998-06-19','a:2:{i:0;s:40:\"http://www.tudou.com/v/pN8kDInaWX8/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765586&amp;yid=XNTEwNDc1NzE2&amp;external=bangumi\";}',116,0,'脚本：稲荷昭彦/河森正治/吉永亜矢  絵コンテ：佐藤順一  演出：武井良幸  作画監督：菅野宏紀  メカ作画監督：後藤雅巳\r\n\r\nビバップ号にある日、フェイ宛の小包が届く。借金取りからの物だと勘違いしたフェイは、中身も見ないで逃走。スパイクが残された小包を開けると、一本のベータテープが出てきた。その筋のマニアに売ろうとして諦めたスパイクとジェットがその中身を再生すると、そこには少女時代のフェイの映像が映っていた……。「フレー、フレー、あたし！」。',1245507643,1638538575,1,0),(7044,253,19,0,0,'ワイルド・ホーセス Wild Horses','野马',0,'00:24:29','1999-03-05','a:2:{i:0;s:40:\"http://www.tudou.com/v/EeGfXNG-o5Y/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765595&amp;yid=XNTEwNDc1NzIw&amp;external=bangumi\";}',37,0,'脚本：稲荷昭彦  絵コンテ：飯田馬之介  演出：山田弘和  作画監督：逢坂浩司  メカ作画監督：後藤雅巳\r\n\r\nスパイクは久し振りに愛機ソードフィッシュIIをオーバーホールしてもらうため、凄腕メカニック、ドゥーハンのいる地球を訪れていた。修復が終わったソードフィッシュIIで早速、宇宙海賊スターシップ・パイレーツを追うスパイクだが、突如制御力を失い地球へと落下し始める！　スパイクの運命は？\r\n\r\nメカデザイナー・山根公利の趣味が炸裂した一本。',1245507687,1639366528,1,0),(7045,253,20,0,0,'道化師の鎮魂歌 Pierrot Le Fou','小丑的安魂曲',0,'00:24:40','1999-03-12','a:3:{i:0;s:47:\"http://v.youku.com/v_show/id_XMjg2NDk1MjEy.html\";i:1;s:40:\"http://www.tudou.com/v/9AypItnwnYY/v.swf\";i:2;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130765585&amp;yid=XNTEwNDc2MzA4&amp;external=bangumi\";}',103,0,'脚本：村井さだゆき  絵コンテ：武井良幸  演出：武井良幸  作画監督：小森高博  メカ作画監督：後藤雅巳\r\n\r\nある夜、スパイクは警察の高官が暗殺されるのを目撃した。暗殺者は、マッドピエロこと東風（トンプウ）。その姿を見て生き延びた者はいないという伝説の殺し屋だった。目撃したことで東風の襲撃を受けるスパイク。その場は何とか逃げ延びたものの、東風はどこまでも追って来るのだった……。\r\n\r\n本気になったスパイクのキレのあるアクションが最高！',1245507706,1639728343,1,0),(7046,253,21,0,0,'ブギ・ウギ・フンシェイ Boogie Woogie Feng Shui','布吉伍吉风水',0,'00:24:40','1999-03-19','a:2:{i:0;s:40:\"http://www.tudou.com/v/aMjXwypBI2s/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130766707&amp;yid=XNTEwNDc1NzI0&amp;external=bangumi\";}',44,0,'脚本：村井さだゆき/渡辺信一郎  絵コンテ：潮乱太  演出：佐藤育郎  作画監督：竹内浩志  メカ作画監督：後藤雅巳\r\n\r\n古い友人のパオよりジェットに届いた一通のメール。文面には「案山より聖獣を見いだせ。我、四神相応に有り」という謎の言葉。疑問に思い、パオを探していたジェットは、パオが位相差空間内に閉じこめられていることを知る。そしてパオの孫娘メイファを付け狙う刺客の影。それは秘密のエネルギーを秘めた「太陽石」を巡る戦いの始まりだった……。\r\n\r\n注：ブギ・ウギ（Boogie Woogie）低音连奏爵士乐，是爵士乐中的一种钢琴奏法。',1245507728,1639295016,1,0),(7047,253,22,0,0,'カウボーイ・ファンク Cowboy Funk','牛仔放克',0,'00:24:41','1999-03-26','a:2:{i:0;s:40:\"http://www.tudou.com/v/tOucNYXO5WE/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130766702&amp;yid=XNTEwNDc1NzI4&amp;external=bangumi\";}',80,0,'脚本：信本敬子  絵コンテ：岡村天斎  演出：森邦宏  作画監督：川元利浩  メカ作画監督：後藤雅巳\r\n\r\nヌイグルミに爆弾を仕掛けて世を騒がす爆弾魔テディ・ボマーを追うスパイクたちは、後一歩のところでスパイクを犯人と勘違いしたカウボーイ姿の賞金稼ぎ、アンディの妨害を受ける。それがスパイクの長い長いホンキィトンクな日々の始まりだった……。\r\n\r\nシリーズ中屈指のキャラ、アンディ登場。ある意味一番「ビバップ」らしい最高に笑えるエピソード！',1245507773,1639543480,1,0),(7048,253,23,0,0,'ブレイン・スクラッチ Brain Scratch','大脑划痕',0,'00:24:40','1999-04-02','a:3:{i:0;s:40:\"http://www.tudou.com/v/cmGeW2KONLo/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130766703&amp;yid=XNTEwNDc1NzMy&amp;external=bangumi\";i:2;s:59:\"http://www.tudou.com/albumplay/7N-t2tvbwh0/kDQH5MLkfsI.html\";}',67,0,'脚本：佐藤大  絵コンテ：武井良幸  演出：武井良幸  作画監督：竹内浩志  メカ作画監督：後藤雅巳\r\n\r\nネット上に存在する謎の宗教団体・電子移民財団スクラッチ。その信者が次々に行方不明になり、教祖のロンデスに多額の賞金がかけられた。早速、抜け駆けするフェイ。しかし、ロンデスの正体は知れず、スクラッチの本部で賞金稼ぎたちの屍を目の当たりにする。フェイからの連絡にスパイクたちは渋々調査を始めるが……。\r\n\r\n退廃的なムードが全編を覆う。',1245507793,1639298677,1,0),(7049,253,24,0,0,'ハード・ラック・ウーマン Hard Luck Woman','不走运的女人',0,'00:24:37','1999-04-09','a:2:{i:0;s:40:\"http://www.tudou.com/v/Vmt41OXnYnA/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130766705&amp;yid=XNTEwNDc1NzM2&amp;external=bangumi\";}',128,0,'脚本：横手美智子  絵コンテ：岡村天斎  演出：山田弘和  作画監督：菅野宏紀  メカ作画監督：後藤雅巳\r\n\r\nかつて自分に宛てて送ったビデオレターが告げる、なくしてしまった過去。思い出せぬ記憶。その中にマーライオンの像が映っていることに気付いたフェイは、その像のある場所を知っているらしいエドと共に地球に向かった。立ち寄った修道院で明らかになるエドの父の消息とマーライオンの場所。そして、フェイは自分を知る老女に出会うのだった……。',1245507816,1639669434,1,0),(7050,253,25,0,0,'ザ・リアル・フォークブルース（前編）','The Real Folk Blues (PART 1)',0,'24m','1999-04-16','a:2:{i:0;s:40:\"http://www.tudou.com/v/8oOtPxk9rFQ/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130766706&amp;yid=XNTEwNDc1NzQ0&amp;external=bangumi\";}',21,0,'脚本：信本敬子   分镜：渡边信一郎   演出：佐藤育郎',1245507842,1636146470,1,0),(7051,253,26,0,0,'ザ・リアル・フォークブルース（後編）','The Real Folk Blues (PART 2)',0,'24m','1999-04-23','a:2:{i:0;s:40:\"http://www.tudou.com/v/FBCdLYkuHPQ/v.swf\";i:1;s:88:\"http://dp.tudou.com/nplayer.swf?iid=130766708&amp;yid=XNTEwNDc1NzQ4&amp;external=bangumi\";}',79,0,'脚本：信本敬子   分镜：渡边信一郎   演出：武井良幸',1245507880,1636154430,1,0),(46037,253,0,1,0,'よせあつめブルース','Mish-Mash Blues',0,'24m','1998-06-26','a:4:{i:0;s:38:\"http://player.56.com/v_NTEwOTY2Mzc.swf\";i:1;s:47:\"http://www.tudou.com/programs/view/qTQc_CnWUyk/\";i:2;s:60:\"http://video.baidu.com/s?f=0&amp;n=1&amp;word=cowboy%20bebop\";i:3;s:90:\"http://www.tudou.com/v/uASQyyeab-8/&amp;rpid=2802833&amp;resourceId=2802833_04_05_99/v.swf\";}',23,0,'Cowboy Bebop东京电视台首轮放映中的最后一集，由零散内容剪辑而成。\r\n本集使用了日本HIP HOP小组SHAKKAZOMBIE的曲子而没有出现菅野的音乐。角色们也都自顾自地、没完没了地说着富有哲理的台词。此后都没有再放映过，并且之后发行的各种版本的录像带里也都没有收录。\r\n官网的FAQ中制作方称是由于制作进度原因匆忙剪辑而成的，实际上，是由于当时严格的审查制度(3D龙事件)使得BEBOP被减掉一半，制作人为了发泄不满而制作的通过动画角色的嘴对东京电视台进行猛烈讽刺的「特别篇」。',1281436548,1617774916,1,0),(103232,253,1,2,0,'Tank!','',0,'第0话 - 第26话','1998-06-26','',3,0,'',1307792985,1617774944,1,0),(103233,253,1,3,0,'THE REAL FOLK BLUES','',0,'第0话 - 第12话, 第14话 - 第25话','1998-06-26','',0,0,'',1307793012,0,1,0),(103234,253,2,3,0,'SPACE LION','',0,'第13话','1998-05-29','',0,0,'',1307793290,0,1,0),(103235,253,3,3,0,'BLUE','',0,'第26话','1999-04-23','',3,0,'',1307793418,1617774973,1,0),(980030,315957,1,0,1,'Twilight Serenity (Genshin Impact Main Theme Var.)','宁静的黄昏',0,'01:41','','',0,0,'',1601274156,0,0,0),(980031,315957,2,0,1,'Legend of the Wind','风的传说',0,'01:26','','',0,0,'',1601274156,0,0,0),(980032,315957,3,0,1,'The City Favored By Wind','风所爱之城',0,'01:03','','',0,0,'',1601274156,0,0,0),(980033,315957,4,0,1,'Bustling Afternoon of Mondstadt','蒙德城繁忙的午后',0,'01:48','','',0,0,'',1601274156,0,0,0),(980034,315957,5,0,1,'Dusk in Mondstadt','蒙德的黄昏',0,'01:48','','',0,0,'',1601274156,0,0,0),(980035,315957,6,0,1,'Mondstadt Starlit','星光下的蒙德',0,'01:00','','',0,0,'',1601274156,0,0,0),(980036,315957,7,0,1,'Moonlight in Mondstadt','蒙德的月光',0,'00:49','','',0,0,'',1601274156,0,0,0),(980037,315957,8,0,1,'Another Day in Mondstadt','蒙德的又一日',0,'00:52','','',0,0,'',1601274156,0,0,0),(980038,315957,9,0,1,'Windborne Hymn','风带来的圣歌',0,'01:48','','',0,0,'',1601274156,0,0,0),(980039,315957,10,0,1,'Knights of Favonius','西风骑士团',0,'01:15','','',0,0,'',1601274156,0,0,0),(980040,315957,11,0,1,'Angel\'s Share','天使的馈赠',0,'01:53','','',0,0,'',1601274156,0,0,0),(980041,315957,12,0,1,'Silhouette and Silk Steps','剪影与蹑步',0,'01:31','','',0,0,'',1601274156,0,0,0),(980042,315957,13,0,1,'Perilous Path','危险的小径',0,'02:19','','',0,0,'',1601274156,0,0,0),(980043,315957,14,0,1,'Say My Name','直面',0,'01:51','','',0,0,'',1601274156,0,0,0),(980044,315957,15,0,1,'Welp, Didn\'t Expect That','呃，这可没想到…',0,'01:22','','',0,0,'',1601274156,0,0,0),(980045,315957,16,0,1,'An Interesting Labour','有趣的挑战',0,'01:26','','',0,0,'',1601274156,0,0,0),(980046,315957,17,0,1,'Make Haste, Partner','速度加快',0,'01:28','','',0,0,'',1601274156,0,0,0),(980047,315957,18,0,1,'A Happy Day','开心的一天',0,'00:28','','',0,0,'',1601274156,0,0,0),(980048,315957,19,0,1,'Reunion in the Whispering Woods','低语森林的重逢',0,'00:37','','',0,0,'',1601274156,0,0,0),(980049,315957,1,0,2,'Beckoning (Genshin Impact Main Theme Var.)','情不自禁',0,'01:42','','',0,0,'',1601274156,0,0,0),(980050,315957,2,0,2,'Hence, Begins the Journey','旅途的开始',0,'01:14','','',0,0,'',1601274156,0,0,0),(980051,315957,3,0,2,'Dawn Winery Theme','晨曦酒庄',0,'01:07','','',0,0,'',1601274156,0,0,0),(980052,315957,4,0,2,'Before Dawn, at the Winery','破晓前的流光',0,'01:09','','',0,0,'',1601274156,0,0,0),(980053,315957,5,0,2,'A Familiar Sight and Leisure','见惯的风景',0,'01:07','','',0,0,'',1601274156,0,0,0),(980054,315957,6,0,2,'Cold Night','饰金的夜色',0,'01:07','','',0,0,'',1601274156,0,0,0),(980055,315957,7,0,2,'Whispering Plain','平原的低语',0,'01:10','','',0,0,'',1601274165,0,0,0),(980056,315957,8,0,2,'Statue of the Seven','七天神像',0,'01:24','','',0,0,'',1601274165,0,0,0),(980057,315957,9,0,2,'Acquaintance (Statue of the Seven)','命运的初识',0,'00:21','','',0,0,'',1601274165,0,0,0),(980058,315957,10,0,2,'Stealing Words of the Moon','月亮处盗来的歌',0,'01:24','','',0,0,'',1601274165,0,0,0),(980059,315957,11,0,2,'Wayfarer\'s Peace','旅人的暂歇',0,'01:28','','',0,0,'',1601274165,0,0,0),(980060,315957,12,0,2,'Wind-Washed Mountains','风洗的群山',0,'00:41','','',0,0,'',1601274165,0,0,0),(980061,315957,13,0,2,'Wayward Souls','不散的魂灵',0,'01:05','','',0,0,'',1601274165,0,0,0),(980062,315957,20,0,1,'Startled','震惊',0,'00:29','','',0,0,'',1601274165,0,0,0),(980063,315957,21,0,1,'Meeting Amber','初遇安柏',0,'00:13','','',0,0,'',1601274165,0,0,0),(980064,315957,22,0,1,'Storm Befalls','风暴降临',0,'01:05','','',0,0,'',1601274165,0,0,0),(980065,315957,23,0,1,'Slight Distress','淡淡的不安',0,'02:21','','',0,0,'',1601274165,0,0,0),(980066,315957,24,0,1,'Tender Strength','同伴的力量',0,'01:22','','',0,0,'',1601274165,0,0,0),(980067,315957,25,0,1,'Imminent Triumph','将至的凯歌',0,'01:00','','',0,0,'',1601274165,0,0,0),(980068,315957,1,0,3,'Photon of Fluctuation','光辉的涨落',0,'03:14','','',0,0,'',1601274165,0,0,0),(980069,315957,2,0,3,'His Resolution','解决之道',0,'04:43','','',0,0,'',1601274165,0,0,0),(980070,315957,14,0,2,'Reminiscence (Genshin Impact Main Theme Var.)','追忆',0,'01:35','','',0,0,'',1601274165,0,0,0),(980071,315957,15,0,2,'Restless Blazing Sun','烈日之残响',0,'01:35','','',0,0,'',1601274165,0,0,0),(980072,315957,16,0,2,'Remembrance (Genshin Impact Main Theme Var.)','一段回忆',0,'01:22','','',0,0,'',1601274165,0,0,0),(980073,315957,17,0,2,'The Horizon','地平',0,'01:12','','',0,0,'',1601274165,0,0,0),(980074,315957,18,0,2,'Awaiting for the Future','静候未来',0,'01:25','','',0,0,'',1601274165,0,0,0),(980075,315957,19,0,2,'Moonlit Wilderness','月照的荒野',0,'01:16','','',0,0,'',1601274165,0,0,0),(980076,315957,20,0,2,'A New Day with Hope','希望的新一天',0,'01:43','','',0,0,'',1601274165,0,0,0),(980077,315957,21,0,2,'Journey of Hope (Genshin Impact Main Theme Var.)','希望之旅',0,'01:21','','',0,0,'',1601274165,0,0,0),(980078,315957,22,0,2,'Forlorn Child of Archaic Winds (Dvalin\'s Nest)','万古之风的弃儿',0,'03:19','','',0,0,'',1601274165,0,0,0),(980079,315957,23,0,2,'Forsken Child of Ancient Times (Dvalin\'s Nest)','太古时光的遗孤',0,'02:55','','',0,0,'',1601274165,0,0,0),(980080,315957,24,0,2,'Midday Prospects','午日的眺望',0,'01:38','','',0,0,'',1601274165,0,0,0),(980081,315957,25,0,2,'Dwelling in the Past','久住往昔',0,'01:41','','',0,0,'',1601274171,0,0,0),(980082,315957,26,0,2,'Eternal Anamnesis (Genshin Impact Main Theme Var.)','永恒的回忆',0,'01:59','','',0,0,'',1601274171,0,0,0),(980083,315957,3,0,3,'Rhythm from Ancient Times','亘古的韵律',0,'03:40','','',0,0,'',1601274171,0,0,0),(980084,315957,4,0,3,'Endless Echoes','无尽的回响',0,'04:12','','',0,0,'',1601274171,0,0,0),(980085,315957,5,0,3,'Charge! Fearless Warriors','冲啊！无畏的勇士',0,'03:58','','',0,0,'',1601274171,0,0,0),(980086,315957,6,0,3,'Beats of Water Drops','水滴的节拍',0,'04:03','','',0,0,'',1601274171,0,0,0),(980087,315957,7,0,3,'Magic Intrigues','魔导的深秘',0,'03:50','','',0,0,'',1601274171,0,0,0),(980088,315957,8,0,3,'Against All Odds','无数的逆境',0,'05:21','','',0,0,'',1601274171,0,0,0),(980089,315957,9,0,3,'Perpetual Motion of Wind','不休的风航',0,'03:32','','',0,0,'',1601274171,0,0,0),(980090,315957,10,0,3,'Riders of the Wind, Onward','乘风前行',0,'03:06','','',0,0,'',1601274171,0,0,0),(980091,315957,11,0,3,'Whirl of Boreal Wind','冰风回荡',0,'03:11','','',0,0,'',1601274171,0,0,0),(980092,315957,12,0,3,'Symphony of Boreal Wind','冰封交响曲',0,'04:51','','',0,0,'',1601274171,0,0,0);
/*!40000 ALTER TABLE `chii_episodes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_subject_fields` WRITE;
/*!40000 ALTER TABLE `chii_subject_fields` DISABLE KEYS */;
REPLACE INTO `chii_subject_fields` VALUES (253,2,'a:30:{i:0;a:2:{s:8:\"tag_name\";s:15:\"渡边信一郎\";s:6:\"result\";s:4:\"2920\";}i:1;a:2:{s:8:\"tag_name\";s:12:\"菅野洋子\";s:6:\"result\";s:4:\"2663\";}i:2;a:2:{s:8:\"tag_name\";s:12:\"星际牛仔\";s:6:\"result\";s:4:\"1961\";}i:3;a:2:{s:8:\"tag_name\";s:6:\"经典\";s:6:\"result\";s:4:\"1541\";}i:4;a:2:{s:8:\"tag_name\";s:6:\"科幻\";s:6:\"result\";s:4:\"1421\";}i:5;a:2:{s:8:\"tag_name\";s:7:\"SUNRISE\";s:6:\"result\";s:4:\"1354\";}i:6;a:2:{s:8:\"tag_name\";s:6:\"神作\";s:6:\"result\";s:4:\"1001\";}i:7;a:2:{s:8:\"tag_name\";s:9:\"神配乐\";s:6:\"result\";s:3:\"957\";}i:8;a:2:{s:8:\"tag_name\";s:2:\"TV\";s:6:\"result\";s:3:\"772\";}i:9;a:2:{s:8:\"tag_name\";s:11:\"CowboyBebop\";s:6:\"result\";s:3:\"714\";}i:10;a:2:{s:8:\"tag_name\";s:4:\"1998\";s:6:\"result\";s:3:\"688\";}i:11;a:2:{s:8:\"tag_name\";s:6:\"原创\";s:6:\"result\";s:3:\"494\";}i:12;a:2:{s:8:\"tag_name\";s:6:\"cowboy\";s:6:\"result\";s:3:\"475\";}i:13;a:2:{s:8:\"tag_name\";s:9:\"林原惠\";s:6:\"result\";s:3:\"462\";}i:14;a:2:{s:8:\"tag_name\";s:12:\"山寺宏一\";s:6:\"result\";s:3:\"235\";}i:15;a:2:{s:8:\"tag_name\";s:12:\"1998年10月\";s:6:\"result\";s:2:\"94\";}i:16;a:2:{s:8:\"tag_name\";s:15:\"渡辺信一郎\";s:6:\"result\";s:2:\"52\";}i:17;a:2:{s:8:\"tag_name\";s:5:\"BONES\";s:6:\"result\";s:2:\"49\";}i:18;a:2:{s:8:\"tag_name\";s:9:\"公路片\";s:6:\"result\";s:2:\"46\";}i:19;a:2:{s:8:\"tag_name\";s:6:\"浪漫\";s:6:\"result\";s:2:\"45\";}i:20;a:2:{s:8:\"tag_name\";s:12:\"信本敬子\";s:6:\"result\";s:2:\"34\";}i:21;a:2:{s:8:\"tag_name\";s:15:\"菅野よう子\";s:6:\"result\";s:2:\"33\";}i:22;a:2:{s:8:\"tag_name\";s:7:\"1998年\";s:6:\"result\";s:2:\"32\";}i:23;a:2:{s:8:\"tag_name\";s:5:\"Bebop\";s:6:\"result\";s:2:\"26\";}i:24;a:2:{s:8:\"tag_name\";s:12:\"川元利浩\";s:6:\"result\";s:2:\"26\";}i:25;a:2:{s:8:\"tag_name\";s:3:\"神\";s:6:\"result\";s:2:\"23\";}i:26;a:2:{s:8:\"tag_name\";s:12:\"林原惠美\";s:6:\"result\";s:2:\"22\";}i:27;a:2:{s:8:\"tag_name\";s:6:\"日本\";s:6:\"result\";s:2:\"22\";}i:28;a:2:{s:8:\"tag_name\";s:6:\"音乐\";s:6:\"result\";s:2:\"22\";}i:29;a:2:{s:8:\"tag_name\";s:2:\"SF\";s:6:\"result\";s:2:\"20\";}}',38,10,4,10,47,130,386,1308,2896,4416,0,1,1998,10,5,'1998-10-23',0),(315957,3,'a:12:{i:0;a:2:{s:8:\"tag_name\";s:3:\"OST\";s:6:\"result\";s:2:\"31\";}i:1;a:2:{s:8:\"tag_name\";s:6:\"原神\";s:6:\"result\";s:2:\"23\";}i:2;a:2:{s:8:\"tag_name\";s:9:\"陈致逸\";s:6:\"result\";s:2:\"17\";}i:3;a:2:{s:8:\"tag_name\";s:8:\"HOYO-MiX\";s:6:\"result\";s:1:\"9\";}i:4;a:2:{s:8:\"tag_name\";s:18:\"动漫游戏原声\";s:6:\"result\";s:1:\"8\";}i:5;a:2:{s:8:\"tag_name\";s:4:\"2020\";s:6:\"result\";s:1:\"7\";}i:6;a:2:{s:8:\"tag_name\";s:6:\"中国\";s:6:\"result\";s:1:\"7\";}i:7;a:2:{s:8:\"tag_name\";s:3:\"ACG\";s:6:\"result\";s:1:\"6\";}i:8;a:2:{s:8:\"tag_name\";s:6:\"miHoYo\";s:6:\"result\";s:1:\"6\";}i:9;a:2:{s:8:\"tag_name\";s:6:\"游戏\";s:6:\"result\";s:1:\"3\";}i:10;a:2:{s:8:\"tag_name\";s:4:\"GAME\";s:6:\"result\";s:1:\"1\";}i:11;a:2:{s:8:\"tag_name\";s:12:\"游戏原声\";s:6:\"result\";s:1:\"1\";}}',2,0,1,0,0,6,15,31,16,10,0,1388,2020,9,1,'2020-09-28',0);
/*!40000 ALTER TABLE `chii_subject_fields` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_ep_revisions` WRITE;
/*!40000 ALTER TABLE `chii_ep_revisions` DISABLE KEYS */;
REPLACE INTO `chii_ep_revisions` VALUES (1435,8,'522,523,524,525,526,527,528,529,530,531,532,89,90,2,91,104,374,520,574,577','1|魔神 が 目覚める 日|魔王的苏醒之日|24m|2008-04-06\r\n2|日本独立計画|日本独立计划|24m|2008-04-13\r\n3|囚われの学園|被囚禁的学园|24m|2008-04-20\r\n4|逆襲の処刑台|逆行的处刑台|24m|2008-04-27\r\n5|ナイト オブ ラウンズ|圆桌骑士|24m|2008-05-04\r\n6|太平洋 奇襲 作戦|太平洋奇袭作战|24m|2008-05-11\r\n7|棄てられた 仮面|被丢弃的面具|24m|2008-05-18\r\n8|百万のキセキ|百万的奇迹|24m|2008-05-25\r\n9|朱禁城の花嫁|朱禁城的花嫁|24m|2008-06-08\r\n10|神虎輝く刻|神虎闪耀之刻|24m|2008-06-15\r\n11|想いの力|思念的力量|24m|2008-06-22\r\n12|ラブ アタック!|爱的初体验|24m|2008-07-01\r\n13|過去からの刺客|来自过去的刺客|24m|2008-07-06\r\n14|ギアス 狩り|Geass 狩猎|24m|2008-07-12\r\n15|C の 世界|C的世界|24m|2008-07-20\r\n16|超合集国決議第壱號|超合众国决议第一号|24m|2008-07-27\r\n17|土の味|土之气味|24m|2008-08-03\r\n18|第二次 東京 決戦|第二次东京决战|24m|2008-08-10\r\n19|裏切り|背叛|24m|2008-08-17\r\n20|皇帝 失格||24m|2008-08-24',2959,0,1272124972,''),(1436,8,'577,593,607,609,1343,1344','20|皇帝 失格|皇帝 失格|24m|2008-08-24\r\n21|ラグナレク の 接続|诸神 黄昏 连接|24m|2008-08-31\r\n22|皇帝　ルルーシュ|皇帝 鲁路修|24m|2008-09-07\r\n23|シュナイゼル　の　仮面|修耐泽尔的假面|24m|2008-09-14\r\n24|ダモクレスの空|达摩克里斯的天空|24m|2008-09-21\r\n25|Re;|Re;|24m|2008-09-28',2959,0,1272125002,''),(980,12,'1039,1052,28331','13|ちぃ 遊ぶ||24m||26.06.2002\r\n26|ちぃ だけの人||24m|25.09.2002\r\n27|日比谷・琴子 語る|日比谷、琴子　談論|23m40s|',2571,0,1264206781,''),(981,12,'1039,1040','13|ちぃ 遊ぶ||24m|26.06.2002\r\n14|ちぃ 海いく||24m|03.07.2002',2571,0,1264206967,''),(1105,12,'1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045,1046','1|ちぃ 目覚める|叽，觉醒了|24m|2002-04-03\r\n2|ちぃ でかける|叽，出门|24m|10.04.2002\r\n3|ちぃ おぼえる|叽，学习|24m|17.04.2002\r\n4|ちぃ おつかい|叽，办事去|24m|24.04.2002\r\n5|ちぃ 見つける|叽，发现|24m|01.05.2002\r\n6|ちぃ 弱る|叽，衰弱|24m|08.05.2002\r\n7|ちぃ 働く|叽，工作|24m|15.05.2002\r\n8|ちぃ とまどう|叽，困惑|24m|22.05.2002\r\n9|recap 新保・すもも 語る|新保和丝茉茉的谈话|24m|29.05.2002\r\n10|ちぃ 買う|叽，买东西|24m|05.06.2002\r\n11|ちぃ 出会う|叽，约会|24m|12.06.2002\r\n12|ちぃ 確かめる|叽，确定|24m|19.06.2002\r\n13|ちぃ 遊ぶ|叽，玩游戏|24m|26.06.2002\r\n14|ちぃ 海いく|叽，去海边|24m|03.07.2002\r\n15|ちぃ もてなす|叽，款待|24m|10.07.2002\r\n16|ちぃ 何もしない|叽，什么也没做|24m|17.07.2002\r\n17|ちぃ まかなう|叽，持家|24m|24.07.2002\r\n18|recap 稔・柚姫 語る|稔和柚姬的谈话|24m|31.07.2002\r\n19|ちぃ 手伝う|叽，打扫|24m|07.08.2002\r\n20|ちぃ いなくなる|叽，不见了|24m|14.08.2002',2959,0,1265534791,''),(1106,12,'1047,1048,1049,1050,1051,1052,28331','21|ちぃ 待つ|叽，等待|24m|21.08.2002\r\n22|ちぃ 求める|叽，愿望|24m|28.08.2002\r\n23|ちぃ 答える|叽，答案|24m|04.09.2002\r\n24|ちぃ 着てぬぐ|叽，换衣服|24m|11.09.2002\r\n25|ちぃ 決める|叽，决定了|24m|18.09.2002\r\n26|ちぃ だけの人|叽，只属于我的人|24m|25.09.2002\r\n27|日比谷・琴子 語る|日比谷、琴子　談論|23m40s|',2959,0,1265534859,''),(37643,12,'1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045','1|ちぃ 目覚める|叽，觉醒了|24m|2002-04-03\r\n2|ちぃ でかける|叽，出门|24m|10.04.2002\r\n3|ちぃ おぼえる|叽，学习|24m|17.04.2002\r\n4|ちぃ おつかい|叽，办事去|24m|24.04.2002\r\n5|ちぃ 見つける|叽，发现|24m|01.05.2002\r\n6|ちぃ 弱る|叽，衰弱|24m|08.05.2002\r\n7|ちぃ 働く|叽，工作|24m|15.05.2002\r\n8|ちぃ とまどう|叽，困惑|24m|22.05.2002\r\n8.5|recap 新保・すもも 語る|新保和丝茉茉的谈话|24m|29.05.2002\r\n9|ちぃ 買う|叽，买东西|24m|05.06.2002\r\n10|ちぃ 出会う|叽，约会|24m|12.06.2002\r\n11|ちぃ 確かめる|叽，确定|24m|19.06.2002\r\n12|ちぃ 遊ぶ|叽，玩游戏|24m|26.06.2002\r\n13|ちぃ 海いく|叽，去海边|24m|03.07.2002\r\n14|ちぃ もてなす|叽，款待|24m|10.07.2002\r\n15|ちぃ 何もしない|叽，什么也没做|24m|17.07.2002\r\n16|ちぃ まかなう|叽，持家|24m|24.07.2002\r\n16.5|recap 稔・柚姫 語る|稔和柚姬的谈话|24m|31.07.2002\r\n17|ちぃ 手伝う|叽，打扫|24m|07.08.2002',409035,0,1537602066,''),(37644,12,'1046,1047,1048,1049,1050,1051,1052,28331','18|ちぃ いなくなる|叽，不见了|24m|14.08.2002\r\n19|ちぃ 待つ|叽，等待|24m|21.08.2002\r\n20|ちぃ 求める|叽，愿望|24m|28.08.2002\r\n21|ちぃ 答える|叽，答案|24m|04.09.2002\r\n22|ちぃ 着てぬぐ|叽，换衣服|24m|11.09.2002\r\n23|ちぃ 決める|叽，决定了|24m|18.09.2002\r\n24|ちぃ だけの人|叽，只属于我的人|24m|25.09.2002\r\n24.5|日比谷・琴子 語る|日比谷、琴子　談論|23m40s|',409035,0,1537602115,''),(52612,12,'1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043','5|ちぃ 見つける|叽，发现|24m|2002-05-01\r\n6|ちぃ 弱る|叽，衰弱|24m|2002-05-08\r\n7|ちぃ 働く|叽，工作|24m|2002-05-15\r\n8|ちぃ とまどう|叽，困惑|24m|2002-05-22\r\n8.5|recap 新保・すもも 語る|新保和丝茉茉的谈话|24m|2002-05-29\r\n9|ちぃ 買う|叽，买东西|24m|2002-06-05\r\n10|ちぃ 出会う|叽，约会|24m|2002-06-12\r\n11|ちぃ 確かめる|叽，确定|24m|2002-06-19\r\n12|ちぃ 遊ぶ|叽，玩游戏|24m|2002-06-26\r\n13|ちぃ 海いく|叽，去海边|24m|2002-07-03\r\n14|ちぃ もてなす|叽，款待|24m|2002-07-10\r\n15|ちぃ 何もしない|叽，什么也没做|24m|2002-07-17\r\n16|ちぃ まかなう|叽，持家|24m|2002-07-24',452437,0,1637420763,''),(52613,12,'1045,1046,1047,1048,1049,1050,1051,1052,28331','17|ちぃ 手伝う|叽，打扫|24m|2002-08-07\r\n18|ちぃ いなくなる|叽，不见了|24m|2002-08-14\r\n19|ちぃ 待つ|叽，等待|24m|2002-08-21\r\n20|ちぃ 求める|叽，愿望|24m|2002-08-28\r\n21|ちぃ 答える|叽，答案|24m|2002-09-04\r\n22|ちぃ 着てぬぐ|叽，换衣服|24m|2002-09-11\r\n23|ちぃ 決める|叽，决定了|24m|2002-09-18\r\n24|ちぃ だけの人|叽，只属于我的人|24m|2002-09-25\r\n24.5|日比谷・琴子 語る|日比谷、琴子　談論|23m40s|',452437,0,1637420852,'');
/*!40000 ALTER TABLE `chii_ep_revisions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_subject_revisions` WRITE;
/*!40000 ALTER TABLE `chii_subject_revisions` DISABLE KEYS */;
REPLACE INTO `chii_subject_revisions` VALUES (48260,1,1,1,13974,1323056833,'第一次的親密接觸','','{{Infobox animanga/Novel\r\n|中文名= \r\n|别名={\r\n}\r\n|出版社= 知识出版社\r\n|价格= \r\n|插图= \r\n|连载杂志= \r\n|发售日= 1999-11\r\n|页数= \r\n|话数= \r\n|ISBN= 9787501524044\r\n|其他= \r\n|作者= 蔡智恒\r\n}}','　　風靡華人世界的網戀小說經典，暢銷紀錄超過百萬冊！\r\n　　有最初的《第一次的親密接觸》，才有今日網路文學。\r\n　　蔡智恆的最新作品《暖暖》，提升你的戀愛幸福溫度。\r\n　　紀念版收錄蔡智恆醞釀十年，最溫柔的純愛萬語宣言。\r\n　　PH值小於7的微酸心情，讓十年後的痞子蔡告訴你。\r\n　　一場最美麗的網路解逅，當痞子蔡遇見輕舞飛揚……\r\n　　蔡智恆最真實的情感原點\r\n　　痞子蔡與輕舞飛揚一起記錄的甜蜜日子\r\n　　一則發生在成大校園的純愛故事，網路上一再被轉載的熱門小說。','',0,'',0),(580329,1,1,1,180488,1535354893,'第一次的親密接觸','第一次的亲密接触','{{Infobox animanga/Novel\r\n|中文名= 第一次的亲密接触\r\n|别名={\r\n}\r\n|出版社= 知识出版社\r\n|价格= \r\n|连载杂志= \r\n|发售日= 1999-11\r\n|册数= \r\n|页数= \r\n|话数= \r\n|ISBN= 9787501524044\r\n|其他= \r\n|作者= 蔡智恒\r\n}}','　　風靡華人世界的網戀小說經典，暢銷紀錄超過百萬冊！\r\n　　有最初的《第一次的親密接觸》，才有今日網路文學。\r\n　　蔡智恆的最新作品《暖暖》，提升你的戀愛幸福溫度。\r\n　　紀念版收錄蔡智恆醞釀十年，最溫柔的純愛萬語宣言。\r\n　　PH值小於7的微酸心情，讓十年後的痞子蔡告訴你。\r\n　　一場最美麗的網路解逅，當痞子蔡遇見輕舞飛揚……\r\n　　蔡智恆最真實的情感原點\r\n　　痞子蔡與輕舞飛揚一起記錄的甜蜜日子\r\n　　一則發生在成大校園的純愛故事，網路上一再被轉載的熱門小說。','',0,'内容扩充',1002),(718391,1,1,1,464691,1611417171,'第一次的親密接觸','第一次的亲密接触','{{Infobox animanga/Novel\r\n|中文名= 第一次的亲密接触\r\n|别名={\r\n}\r\n|出版社= 紅色文化、知识出版社\r\n|价格= NT$160\r\n|连载杂志= \r\n|发售日= 1998-09-25\r\n|册数= \r\n|页数= 188\r\n|话数= \r\n|ISBN= 9577086705\r\n|其他= \r\n|作者= 蔡智恒\r\n}}','　　風靡華人世界的網戀小說經典，暢銷紀錄超過百萬冊！\r\n　　有最初的《第一次的親密接觸》，才有今日網路文學。\r\n　　蔡智恆的最新作品《暖暖》，提升你的戀愛幸福溫度。\r\n　　紀念版收錄蔡智恆醞釀十年，最溫柔的純愛萬語宣言。\r\n　　PH值小於7的微酸心情，讓十年後的痞子蔡告訴你。\r\n　　一場最美麗的網路解逅，當痞子蔡遇見輕舞飛揚……\r\n　　蔡智恆最真實的情感原點\r\n　　痞子蔡與輕舞飛揚一起記錄的甜蜜日子\r\n　　一則發生在成大校園的純愛故事，網路上一再被轉載的熱門小說。','',0,'信息转更早出版的台版：内容扩充（出版社、页数、价格）&amp;资讯更新（发售日、ISBN[勘误]）',1002),(6728,1,4,4,4532,1270316901,'Metal Slug 7','合金弹头','{{Infobox Game\r\n|中文名= 合金弹头\r\n|别名={\r\n}\r\n|平台= NDS\r\n|游戏类型= \r\n|游戏开发商= \r\n|游戏出版商= \r\n|发行商= \r\n|游戏设计师= \r\n|游戏引擎= \r\n|游玩人数= \r\n|发行日期= \r\n|售价= \r\n|website= \r\n}}','徹底的に破壊された正規軍本部とその周辺都市も、 驚異的な速度で進む復興作業により、徐々に破壊の爪跡を薄れさせ、 この場所のかつての都市以上の活気と秩序を感じ始めた頃、 正規軍情報部よりある映像が本部へ送られた。 ゴミ問題を報じるある番組にモーデン兵らしき人物が 一瞬横切るだけの映像だが、『間違いなくモーデン兵である』 という情報部の報告により、上層部は真偽の確認と モーデン軍発見の際はその殲滅を目的とした潜入チームを編成。 集められたメンバーには、マルコ、ターマ、エリ、フィオ、 そしてとある作戦でマルコ達と生死を共にしたラルフとクラークがいた。 「いよう！久しぶりだな。今回もこの俺がバシッと決めてやるぜ！」 「また同じ戦場とはな。あんたらとはつくづく縁がある様だ。」 「では諸君、いささか大袈裟なメンバーではあるが、 　相手はあのモーデンだ。考えうる最大の戦力で一気に殲滅する！」  かくして、彼らはモーデン兵が潜伏すると思われる ゴミの島への潜入を開始する。','',0,'',5),(16741,1,4,4,5191,1289386980,'Metal Slug 7','合金弹头7','{{Infobox Game\r\n|中文名= 合金弹头7\r\n|别名={\r\n[jp|メタルスラッグ7]\r\n}\r\n|平台= NDS\r\n|游戏类型= ACT\r\n|游戏开发商= SNK Playmore\r\n|游戏出版商= SNK Playmore\r\n|发行商= SNK Playmore\r\n|游戏设计师= \r\n|游戏引擎= \r\n|游玩人数= 1人\r\n|发行日期= 2008-07-17\r\n|售价= 5040円\r\n|website= \r\n}}','　　以细腻的画风、搞笑的动作和刺激的战斗被人们所熟知的“合金弹头系列”在NDS 平台推出正统续作！虽然本系列的前几部作品最早都是作为街机游戏而推出的，不过这一次的“7”不但先推出NDS版，而且是独占！日前SNK playmore宣布了这款游戏，目前发售日定为2008年3月。据称，本作中将搭载任务模式，在关卡中不断完成教官所下达的任务，提升军衔。\r\n　　游戏依然保持了系列一贯的风格，战斗的场面也没有因为是掌机游戏而进行削减，游戏依然是射击、跳跃和手雷三个按键，虽然是NDS游戏，不过本作却并不对应触摸屏，游戏的画面显示在上屏幕，而下屏幕则用来显示地图。在TGS 2007（Tokyo Game Show）大会上SNK放出了《合金弹头7》的试玩版。这代产品沿袭了前代风格，战斗的对象似乎也没有多大变化，没有分支路线，不过游戏性和关卡设计却不比前几代差，关卡数也有7关，另外还增加了一种武器。','',0,'内容扩充',5),(487368,1,4,4,165229,1491586579,'Metal Slug 7','合金弹头7','{{Infobox Game\r\n|中文名= 合金弹头7\r\n|别名={\r\n[jp|メタルスラッグ7]\r\n}\r\n|平台= NDS\r\n|游戏类型= ACT\r\n|游戏引擎= \r\n|游玩人数= 1人\r\n|发行日期= 2008-07-17\r\n|售价= 5040円\r\n|website= \r\n|游戏开发商= SNKプレイモア\r\n|游戏出版商= SNKプレイモア\r\n|发行商= SNKプレイモア\r\n}}','　　以细腻的画风、搞笑的动作和刺激的战斗被人们所熟知的“合金弹头系列”在NDS 平台推出正统续作！虽然本系列的前几部作品最早都是作为街机游戏而推出的，不过这一次的“7”不但先推出NDS版，而且是独占！日前SNK playmore宣布了这款游戏，目前发售日定为2008年3月。据称，本作中将搭载任务模式，在关卡中不断完成教官所下达的任务，提升军衔。\r\n　　游戏依然保持了系列一贯的风格，战斗的场面也没有因为是掌机游戏而进行削减，游戏依然是射击、跳跃和手雷三个按键，虽然是NDS游戏，不过本作却并不对应触摸屏，游戏的画面显示在上屏幕，而下屏幕则用来显示地图。在TGS 2007（Tokyo Game Show）大会上SNK放出了《合金弹头7》的试玩版。这代产品沿袭了前代风格，战斗的对象似乎也没有多大变化，没有分支路线，不过游戏性和关卡设计却不比前几代差，关卡数也有7关，另外还增加了一种武器。','',0,'',5),(726035,1,4,4,267266,1614300286,'メタルスラッグ7','合金弹头7','{{Infobox Game\r\n|中文名= 合金弹头7\r\n|别名={\r\n[Metal Slug 7]\r\n}\r\n|平台= NDS\r\n|游戏类型= ACT\r\n|游戏引擎= \r\n|游玩人数= 1人\r\n|发行日期= 2008-07-17\r\n|售价= 5040円\r\n|website= \r\n|开发= SNKプレイモア\r\n|发行= SNKプレイモア\r\n}}','　　以细腻的画风、搞笑的动作和刺激的战斗被人们所熟知的“合金弹头系列”在NDS 平台推出正统续作！虽然本系列的前几部作品最早都是作为街机游戏而推出的，不过这一次的“7”不但先推出NDS版，而且是独占！日前SNK playmore宣布了这款游戏，目前发售日定为2008年3月。据称，本作中将搭载任务模式，在关卡中不断完成教官所下达的任务，提升军衔。\r\n　　游戏依然保持了系列一贯的风格，战斗的场面也没有因为是掌机游戏而进行削减，游戏依然是射击、跳跃和手雷三个按键，虽然是NDS游戏，不过本作却并不对应触摸屏，游戏的画面显示在上屏幕，而下屏幕则用来显示地图。在TGS 2007（Tokyo Game Show）大会上SNK放出了《合金弹头7》的试玩版。这代产品沿袭了前代风格，战斗的对象似乎也没有多大变化，没有分支路线，不过游戏性和关卡设计却不比前几代差，关卡数也有7关，另外还增加了一种武器。','',0,'',5),(632320,1,4,4,407835,1563110161,'Metal Slug 7','合金弹头7','{{Infobox Game\r\n|中文名= 合金弹头7\r\n|别名={\r\n[jp|メタルスラッグ7]\r\n}\r\n|平台= NDS\r\n|游戏类型= ACT\r\n|游戏引擎= \r\n|游玩人数= 1人\r\n|发行日期= 2008-07-17\r\n|售价= 5040円\r\n|website= \r\n|开发= SNKプレイモア\r\n|发行= SNKプレイモア\r\n}}','　　以细腻的画风、搞笑的动作和刺激的战斗被人们所熟知的“合金弹头系列”在NDS 平台推出正统续作！虽然本系列的前几部作品最早都是作为街机游戏而推出的，不过这一次的“7”不但先推出NDS版，而且是独占！日前SNK playmore宣布了这款游戏，目前发售日定为2008年3月。据称，本作中将搭载任务模式，在关卡中不断完成教官所下达的任务，提升军衔。\r\n　　游戏依然保持了系列一贯的风格，战斗的场面也没有因为是掌机游戏而进行削减，游戏依然是射击、跳跃和手雷三个按键，虽然是NDS游戏，不过本作却并不对应触摸屏，游戏的画面显示在上屏幕，而下屏幕则用来显示地图。在TGS 2007（Tokyo Game Show）大会上SNK放出了《合金弹头7》的试玩版。这代产品沿袭了前代风格，战斗的对象似乎也没有多大变化，没有分支路线，不过游戏性和关卡设计却不比前几代差，关卡数也有7关，另外还增加了一种武器。','',0,'',5),(2171,1,6,4,886,1248073751,'Team Fortress 2','军团要塞2','{{Infobox Game\r\n|中文名=军团要塞2\r\n|平台=PC\r\n|游戏类型=FPS\r\n|游戏开发商=Valve Corporation\r\n|游戏出版商=Valve Corporation\r\n|发行商=Electronic Arts (retail) , Steam (online)\r\n|游戏设计师=John Cook , Robin Walker\r\n|游戏引擎=Source 引擎\r\n|游玩人数=多人\r\n|发行日期=2007年10月10日\r\n|售价=\r\n|website=http://teamfortress.com/\r\n}}','《军团要塞2》（Team Fortress 2，简称TF2）是由维尔福软件公司开发的一个团队作战型在线多人第一人称射击游戏。该游戏是维尔福先前《军团要塞》（Team Fortress Classic）的续作，于2007年10月10日以橙盒（The Orange Box）三合一方式在Windows和Xbox 360平台上首次发行。PlayStation 3版紧接着在2007年11月22日发行。TF2后来在2008年4月9日在Windows上发行单行版。TF2在线下载版是由Steam负责，而零售版则由美国艺电发行。该游戏的开发是由罗宾·沃克（Ribin Walker）及约翰·库克（John Cook）所领导，他们两位是1996年给雷神之锤使用的军团要塞模组原始设计师。\r\n\r\nTF2开发计划早在1998年就已发布，采用维尔福的GoldSrc引擎，然而自那时起便经历了种种的设计概念变化。在1999年公开的截图显示，该游戏外观脱离其前代TF设计转而追求更真实更军事化的游戏元素；然而设计在其9年开发期间不断的变化。最终成品采用了深受J. C. 莱安德克（Joseph Christian Leyendecker）、迪恩·康沃尔（Dean Cornwell）及诺曼·洛克威尔（Norman Rockwell）艺术影响的卡通视觉效果，并由Source引擎所支持。游戏本身围绕在由9种个性独立鲜明职业组成的两组人马，于谍对谍的场景下进行种种模式的战斗。\r\n\r\n由于有6年游戏开发信息付之阙如或无显著进展，导致该游戏一度被贴上雾件的标签。且还是Wired News年度雾件名单里的常客，与其他业界耻辱并列成受取笑的对象。随着该游戏的发行，TF2就其游戏图形、平衡性、喜剧幽默、与专为多人游戏设计的完整人物个性等特色而受到诸多好评及奖项。','',0,'维基化',0),(53049,1,6,4,8766,1325595925,'Team Fortress 2','军团要塞2','{{Infobox Game\r\n|中文名= 军团要塞2\r\n|别名={\r\n[絕地要塞2]\r\n}\r\n|平台= PC\r\n|游戏类型= FPS\r\n|游戏引擎= Source 引擎\r\n|游玩人数= 多人\r\n|发行日期= 2007年10月10日\r\n|售价= 免費\r\n|website= \r\n|游戏开发商= Valve Corporation\r\n|游戏出版商= Valve Corporation\r\n|发行商= Electronic Arts (retail) , Steam (online)\r\n|游戏设计师= John Cook , Robin Walker\r\n|官方网站= http://teamfortress.com/\r\n}}','　　《军团要塞2》（Team Fortress 2，简称TF2）是由维尔福软件公司开发的一个团队作战型在线多人第一人称射击游戏。该游戏是维尔福先前《军团要塞》（Team Fortress Classic）的续作，于2007年10月10日以橙盒（The Orange Box）三合一方式在Windows和Xbox 360平台上首次发行。PlayStation 3版紧接着在2007年11月22日发行。TF2后来在2008年4月9日在Windows上发行单行版。TF2在线下载版是由Steam负责，而零售版则由美国艺电发行。该游戏的开发是由罗宾·沃克（Ribin Walker）及约翰·库克（John Cook）所领导，他们两位是1996年给雷神之锤使用的军团要塞模组原始设计师。\r\n　　TF2开发计划早在1998年就已发布，采用维尔福的GoldSrc引擎，然而自那时起便经历了种种的设计概念变化。在1999年公开的截图显示，该游戏外观脱离其前代TF设计转而追求更真实更军事化的游戏元素；然而设计在其9年开发期间不断的变化。最终成品采用了深受J. C. 莱安德克（Joseph Christian Leyendecker）、迪恩·康沃尔（Dean Cornwell）及诺曼·洛克威尔（Norman Rockwell）艺术影响的卡通视觉效果，并由Source引擎所支持。游戏本身围绕在由9种个性独立鲜明职业组成的两组人马，于谍对谍的场景下进行种种模式的战斗。\r\n　　由于有6年游戏开发信息付之阙如或无显著进展，导致该游戏一度被贴上雾件的标签。且还是Wired News年度雾件名单里的常客，与其他业界耻辱并列成受取笑的对象。随着该游戏的发行，TF2就其游戏图形、平衡性、喜剧幽默、与专为多人游戏设计的完整人物个性等特色而受到诸多好评及奖项。','',0,'排版',4),(37064,1,6,4,10009,1312806564,'Team Fortress 2','军团要塞2','{{Infobox Game\r\n|中文名= 军团要塞2\r\n|别名={\r\n[絕地要塞2]\r\n}\r\n|平台= PC\r\n|游戏类型= FPS\r\n|游戏引擎= Source 引擎\r\n|游玩人数= 多人\r\n|发行日期= 2007年10月10日\r\n|售价= 免費\r\n|website= \r\n|游戏开发商= Valve Corporation\r\n|游戏出版商= Valve Corporation\r\n|发行商= Electronic Arts (retail) , Steam (online)\r\n|游戏设计师= John Cook , Robin Walker\r\n|官方网站= http://teamfortress.com/\r\n}}','《军团要塞2》（Team Fortress 2，简称TF2）是由维尔福软件公司开发的一个团队作战型在线多人第一人称射击游戏。该游戏是维尔福先前《军团要塞》（Team Fortress Classic）的续作，于2007年10月10日以橙盒（The Orange Box）三合一方式在Windows和Xbox 360平台上首次发行。PlayStation 3版紧接着在2007年11月22日发行。TF2后来在2008年4月9日在Windows上发行单行版。TF2在线下载版是由Steam负责，而零售版则由美国艺电发行。该游戏的开发是由罗宾·沃克（Ribin Walker）及约翰·库克（John Cook）所领导，他们两位是1996年给雷神之锤使用的军团要塞模组原始设计师。\r\n\r\nTF2开发计划早在1998年就已发布，采用维尔福的GoldSrc引擎，然而自那时起便经历了种种的设计概念变化。在1999年公开的截图显示，该游戏外观脱离其前代TF设计转而追求更真实更军事化的游戏元素；然而设计在其9年开发期间不断的变化。最终成品采用了深受J. C. 莱安德克（Joseph Christian Leyendecker）、迪恩·康沃尔（Dean Cornwell）及诺曼·洛克威尔（Norman Rockwell）艺术影响的卡通视觉效果，并由Source引擎所支持。游戏本身围绕在由9种个性独立鲜明职业组成的两组人马，于谍对谍的场景下进行种种模式的战斗。\r\n\r\n由于有6年游戏开发信息付之阙如或无显著进展，导致该游戏一度被贴上雾件的标签。且还是Wired News年度雾件名单里的常客，与其他业界耻辱并列成受取笑的对象。随着该游戏的发行，TF2就其游戏图形、平衡性、喜剧幽默、与专为多人游戏设计的完整人物个性等特色而受到诸多好评及奖项。','',0,'修正笔误',4),(16002,1,6,4,12439,1287286496,'TeamForce2','军团要塞2','{{Infobox Game\r\n|中文名= 军团要塞2\r\n|别名={\r\n[絕地要塞2]\r\n}\r\n|平台= PC+MAC\r\n|游戏类型= FPS\r\n|游戏开发商= VALVE\r\n|游戏出版商= VALVE\r\n|发行商= VALVE\r\n|游戏设计师= Ribin Walker;John Cook\r\n|游戏引擎= Source\r\n|游玩人数= 24(32)\r\n|发行日期= 2007年10月10日\r\n|售价= 忘了\r\n|website= http://www.teamfortress.com/\r\n|官方网站= http://www.teamfortress.com/\r\n}}','更多请WIKI:http://zh.wikipedia.org/zh-cn/絕地要塞2\r\nTF2游戏焦点集中于两支对立小组间达成某目标的对战。这两支小组：保证开挖爆破组（Reliable Excavation and Demolition，简称Red，即有意的缩写成红组）以及建筑联合同盟（Builders League United，简称Blu，缩写成蓝组），用来代表两个秘密控制地球上任何政府的控股公司。玩者玩家可以从九种各具独特优势和弱点的职业中选择一个来进行游戏。虽然从前作原型《军团要塞》面世以来各职业能力已有所变异，但各职业的基本要素仍旧保留了下来。[11][12]游戏释出时有6个官方地图，而随后的游戏更新里跟着7个额外的地图及5个竞技场模式地图。[13][14]当玩者第一次加入某一关卡，会有个导引视频显示如何完成目标。在PC平台上游戏的人数上限为24人（但部分服务器会改变人数限制，能支持高达32人[13]），在 Xbox360或PlayStation3平台上上限为16人。[15]另外，许多的社群自组的关卡也已发行。\r\nTF2是Valve第一款提供个别玩家详细统计数据的多人对战游戏。该数据包括在某单一回合里各个职业使用时间长短、谁“达阵”最多或者哪种目标被完成最多次。这些持续显示的数据让玩者了解如何改进技巧，例如玩家可紧盯他在某回合里给予对手多少伤害。[13]TF2亦针对完成某些特定苦差提供种种“成就”奖赏玩者，例如杀敌到指定数量、或者在某段时间内完成某一回合。针对职业的新奖励套餐亦随更新加上，这一旦为玩者达成特定目标解锁后将赋予各个职业新的能力与武器。[16]已解锁的成就与之前进行游戏的统计数据会公布示在Steam社群或者Xbox Live个人文件明细里。','',0,'新条目',0),(16392,1,6,4,12439,1288268860,'TeamFortress2','军团要塞2','{{Infobox Game\r\n|中文名= 军团要塞2\r\n|别名={\r\n[絕地要塞2]\r\n}\r\n|平台= PC+MAC\r\n|游戏类型= FPS\r\n|游戏开发商= VALVE\r\n|游戏出版商= VALVE\r\n|发行商= VALVE\r\n|游戏设计师= Ribin Walker;John Cook\r\n|游戏引擎= Source\r\n|游玩人数= 24(32)\r\n|发行日期= 2007年10月10日\r\n|售价= 忘了\r\n|website= http://www.teamfortress.com/\r\n|官方网站= http://www.teamfortress.com/\r\n}}','更多请WIKI:http://zh.wikipedia.org/zh-cn/絕地要塞2\r\nTF2游戏焦点集中于两支对立小组间达成某目标的对战。这两支小组：保证开挖爆破组（Reliable Excavation and Demolition，简称Red，即有意的缩写成红组）以及建筑联合同盟（Builders League United，简称Blu，缩写成蓝组），用来代表两个秘密控制地球上任何政府的控股公司。玩者玩家可以从九种各具独特优势和弱点的职业中选择一个来进行游戏。虽然从前作原型《军团要塞》面世以来各职业能力已有所变异，但各职业的基本要素仍旧保留了下来。[11][12]游戏释出时有6个官方地图，而随后的游戏更新里跟着7个额外的地图及5个竞技场模式地图。[13][14]当玩者第一次加入某一关卡，会有个导引视频显示如何完成目标。在PC平台上游戏的人数上限为24人（但部分服务器会改变人数限制，能支持高达32人[13]），在 Xbox360或PlayStation3平台上上限为16人。[15]另外，许多的社群自组的关卡也已发行。\r\nTF2是Valve第一款提供个别玩家详细统计数据的多人对战游戏。该数据包括在某单一回合里各个职业使用时间长短、谁“达阵”最多或者哪种目标被完成最多次。这些持续显示的数据让玩者了解如何改进技巧，例如玩家可紧盯他在某回合里给予对手多少伤害。[13]TF2亦针对完成某些特定苦差提供种种“成就”奖赏玩者，例如杀敌到指定数量、或者在某段时间内完成某一回合。针对职业的新奖励套餐亦随更新加上，这一旦为玩者达成特定目标解锁后将赋予各个职业新的能力与武器。[16]已解锁的成就与之前进行游戏的统计数据会公布示在Steam社群或者Xbox Live个人文件明细里。','',0,'',0),(409961,1,6,4,92853,1463156015,'Team Fortress 2','军团要塞2','{{Infobox Game\r\n|中文名= 军团要塞2\r\n|别名={\r\n[絕地要塞2]\r\n}\r\n|平台={\r\n[Xbox 360]\r\n[PS3]\r\n[PC]\r\n}\r\n|游戏类型= FPS\r\n|游戏引擎= Source 引擎\r\n|游玩人数= 多人\r\n|发行日期= 2007年10月10日\r\n|售价= 免費\r\n|website= \r\n|游戏开发商= Valve Corporation\r\n|游戏出版商= Valve Corporation\r\n|发行商= Electronic Arts (retail) , Steam (online)\r\n|游戏设计师= John Cook , Robin Walker\r\n|官方网站= http://teamfortress.com/\r\n}}','　　《军团要塞2》（Team Fortress 2，简称TF2）是由维尔福软件公司开发的一个团队作战型在线多人第一人称射击游戏。该游戏是维尔福先前《军团要塞》（Team Fortress Classic）的续作，于2007年10月10日以橙盒（The Orange Box）三合一方式在Windows和Xbox 360平台上首次发行。PlayStation 3版紧接着在2007年11月22日发行。TF2后来在2008年4月9日在Windows上发行单行版。TF2在线下载版是由Steam负责，而零售版则由美国艺电发行。该游戏的开发是由罗宾·沃克（Ribin Walker）及约翰·库克（John Cook）所领导，他们两位是1996年给雷神之锤使用的军团要塞模组原始设计师。\r\n　　TF2开发计划早在1998年就已发布，采用维尔福的GoldSrc引擎，然而自那时起便经历了种种的设计概念变化。在1999年公开的截图显示，该游戏外观脱离其前代TF设计转而追求更真实更军事化的游戏元素；然而设计在其9年开发期间不断的变化。最终成品采用了深受J. C. 莱安德克（Joseph Christian Leyendecker）、迪恩·康沃尔（Dean Cornwell）及诺曼·洛克威尔（Norman Rockwell）艺术影响的卡通视觉效果，并由Source引擎所支持。游戏本身围绕在由9种个性独立鲜明职业组成的两组人马，于谍对谍的场景下进行种种模式的战斗。\r\n　　由于有6年游戏开发信息付之阙如或无显著进展，导致该游戏一度被贴上雾件的标签。且还是Wired News年度雾件名单里的常客，与其他业界耻辱并列成受取笑的对象。随着该游戏的发行，TF2就其游戏图形、平衡性、喜剧幽默、与专为多人游戏设计的完整人物个性等特色而受到诸多好评及奖项。','',0,'',0),(53050,1,7,4,8766,1325596135,'Unreal Tournament 3','虚幻竞技场3','{{Infobox Game\r\n|中文名= 虚幻竞技场3\r\n|别名={\r\n}\r\n|平台={\r\n[Mac OS]\r\n[xbox360]\r\n[windows]\r\n[PS3]\r\n}\r\n|游戏类型= FPS\r\n|游戏引擎= \r\n|游玩人数= \r\n|发行日期= 2007年11月19日\r\n|售价= \r\n|website= \r\n}}','　　《虚幻竞技场3》（Unreal Tournament 3，UT3）是由Epic Games所开发的第一人称射击游戏，是继虚幻II之后的新一代虚幻游戏，由Midway Games于2007年11月19日发行PC Windows版本，PS3版则在2007年12月10日发行，Mac OS X与XBox 360的版本则将在2008年发售。\r\n　　《虚幻竞技场3》是浴血战场系列的第四套游戏，也是虚幻系列的第八套，《虚幻竞技场》（UT99）使用虚幻引擎（Unreal Engine 1.0），而《虚幻竞技场2003》（UT2003）及《虚幻竞技场2004》（UT2004）使用虚幻引擎2（Unreal Engine 2.0），本游戏则使用虚幻引擎3（Unreal Engine 3.0），因为UT2004大量地重复使用UT2003的内容与架构，所以UT3应该被归为本系列的第三代游戏。','',0,'内容大幅度扩充',0),(624609,11,7,4,21804,1557840805,'','','','','',0,'与 ID:119 合体',0),(7493,1,8,2,1,1272719723,'コードギアス反逆のルルーシュR2','Code Geass 反叛的鲁路修','{{Infobox animanga/TVAnime\r\n|中文名= Code Geass 反叛的鲁路修\r\n|别名={\r\n}\r\n|话数= 25\r\n|放送开始= 2008年4月6日\r\n|放送星期= 7\r\n|原作= 大河内一楼、谷口悟朗\r\n|导演= 谷口悟朗\r\n|监修= \r\n|官方网站= http://www.geass.jp/\r\n|企画= 内田健二、竹田菁滋、川城和实\r\n|系列构成= 大河内一楼\r\n|脚本= \r\n|分镜= \r\n|演出= \r\n|人物原案= CLAMP\r\n|人物设定= 木村贵宏\r\n|作画监督= 菱沼由典\r\n|机械设定= \r\n|美术监督= 菱沼由典\r\n|色彩设计= 岩沢れい子\r\n|摄影监督= 大矢创太\r\n|音响监督= 浦上靖夫、井泽基\r\n|音乐= 中川幸太郎、黒石ひとみ\r\n|音乐制作= AUDIO PLANNING U\r\n|动画制作= 日升动画\r\n|制作= 每日放送、日升动画、Code Geass制作委员会\r\n|播放电视台= 每日放送\r\n|其他电视台= 台湾 Animax、香港J2、东京放送\r\n|播放结束= 2008年9月28日\r\n|其他= \r\n|Copyright= （C）2006 SUNRISE inc./MBS\r\n}}','上一季最后\r\n鲁路修为他的妹控行为付出了代价\r\n东京攻略战失败，黑色骑士团土崩瓦解\r\n剩下的人有的升官了，比如朱雀同学\r\n有的就业了，比如那位爱因斯坦同学\r\n有的蹲号了，比如奇迹藤堂和他手下\r\n只有罪魁祸首鲁鲁同学\r\n还在享受平静的学园生活\r\n不过这样好日子不会太久了\r\n蛋蛋完结，新番将至\r\n土六已死，日五当立\r\n希望第二季能够无愧于黄金档这块招牌','',25,'合并恢复版本',1),(3574,1,8,2,2813,1254432566,'コードギアス 反逆のルルーシュ R2','叛逆的鲁路修 R2','{{Infobox animanga/TVAnime\r\n|中文名= 叛逆的鲁路修 R2\r\n|话数= 25 \r\n|放送开始= 2008年4月6日 \r\n|放送星期=\r\n|原作=\r\n|导演=谷口悟朗\r\n|监修=\r\n|官方网站= http://www.mbs.jp/geass/\r\n|企画=\r\n|系列构成=	大河内一楼\r\n|脚本= 大河内一楼、吉野弘幸、野村祐一\r\n|分镜=\r\n|演出=\r\n|人物原案= CLAMP\r\n|人物设定= 木村貴宏\r\n|作画监督= \r\n|机械设定= \r\n|美术监督= \r\n|色彩设计= \r\n|摄影监督= \r\n|音响监督= \r\n|音乐= \r\n|音乐制作= 中川幸太郎、黒石ひとみ\r\n|动画制作= SUNRISE\r\n|制作= \r\n|播放电视台=\r\n|其他电视台= \r\n|播放结束= 2008年9月20日\r\n|其他= \r\n|Copyright=\r\n}}','上一季最后\r\n鲁路修为他的妹控行为付出了代价\r\n东京攻略战失败，黑色骑士团土崩瓦解\r\n剩下的人有的升官了，比如朱雀同学\r\n有的就业了，比如那位爱因斯坦同学\r\n有的蹲号了，比如奇迹藤堂和他手下\r\n只有罪魁祸首鲁鲁同学\r\n还在享受平静的学园生活\r\n不过这样好日子不会太久了\r\n蛋蛋完结，新番将至\r\n土六已死，日五当立\r\n希望第二季能够无愧于黄金档这块招牌','',25,'内容扩充',1),(7446,1,8,2,4916,1272602725,'コードギアス反逆のルルーシュR2','Code Geass 反叛的鲁路修','{{Infobox animanga/TVAnime\r\n|中文名= Code Geass 反叛的鲁路修\r\n|别名={\r\n}\r\n|话数= 25\r\n|放送开始= 2008年4月6日\r\n|放送星期= 7\r\n|原作= 大河内一楼、谷口悟朗\r\n|导演= 谷口悟朗\r\n|监修= \r\n|官方网站= http://www.geass.jp/\r\n|企画= 内田健二、竹田菁滋、川城和实\r\n|系列构成= 大河内一楼\r\n|脚本= \r\n|分镜= \r\n|演出= \r\n|人物原案= CLAMP\r\n|人物设定= 木村贵宏\r\n|作画监督= 菱沼由典\r\n|机械设定= \r\n|美术监督= 菱沼由典\r\n|色彩设计= 岩沢れい子\r\n|摄影监督= 大矢创太\r\n|音响监督= 浦上靖夫、井泽基\r\n|音乐= 中川幸太郎、黒石ひとみ\r\n|音乐制作= AUDIO PLANNING U\r\n|动画制作= 日升动画\r\n|制作= 每日放送、日升动画、Code Geass制作委员会\r\n|播放电视台= 每日放送\r\n|其他电视台= 台湾 Animax、香港J2、东京放送\r\n|播放结束= 2008年9月28日\r\n|其他= \r\n|Copyright= （C）2006 SUNRISE inc./MBS\r\n}}','','',25,'新条目',1),(7447,1,8,2,4916,1272603175,'コードギアス反逆のルルーシュR2','Code Geass 反叛的鲁路修','{{Infobox animanga/TVAnime\r\n|中文名= Code Geass 反叛的鲁路修\r\n|别名={\r\n}\r\n|话数= 25\r\n|放送开始= 2008年4月6日\r\n|放送星期= 7\r\n|原作= 大河内一楼、谷口悟朗\r\n|导演= 谷口悟朗\r\n|监修= \r\n|官方网站= http://www.geass.jp/\r\n|企画= 内田健二、竹田菁滋、川城和实\r\n|系列构成= 大河内一楼\r\n|脚本= \r\n|分镜= \r\n|演出= \r\n|人物原案= CLAMP\r\n|人物设定= 木村贵宏\r\n|作画监督= 菱沼由典\r\n|机械设定= \r\n|美术监督= 菱沼由典\r\n|色彩设计= 岩沢れい子\r\n|摄影监督= 大矢创太\r\n|音响监督= 浦上靖夫、井泽基\r\n|音乐= 中川幸太郎、黒石ひとみ\r\n|音乐制作= AUDIO PLANNING U\r\n|动画制作= 日升动画\r\n|制作= 每日放送、日升动画、Code Geass制作委员会\r\n|播放电视台= 每日放送\r\n|其他电视台= 台湾 Animax、香港J2、东京放送\r\n|播放结束= 2008年9月28日\r\n|其他= \r\n|Copyright= （C）2006 SUNRISE inc./MBS\r\n}}','上一季最后\r\n鲁路修为他的妹控行为付出了代价\r\n东京攻略战失败，黑色骑士团土崩瓦解\r\n剩下的人有的升官了，比如朱雀同学\r\n有的就业了，比如那位爱因斯坦同学\r\n有的蹲号了，比如奇迹藤堂和他手下\r\n只有罪魁祸首鲁鲁同学\r\n还在享受平静的学园生活\r\n不过这样好日子不会太久了\r\n蛋蛋完结，新番将至\r\n土六已死，日五当立\r\n希望第二季能够无愧于黄金档这块招牌','',25,'我实在懒的写简介了',1),(4142,1,8,2,6162,1256124847,'コードギアス 反逆のルルーシュ R2','反逆的鲁路修 R2','{{Infobox animanga/TVAnime\r\n|中文名= 反逆的鲁路修 R2\r\n|话数= 25 \r\n|放送开始= 2008年4月6日 \r\n|放送星期=\r\n|原作=\r\n|导演=谷口悟朗\r\n|监修=\r\n|官方网站= http://www.mbs.jp/geass/\r\n|企画=\r\n|系列构成= 大河内一楼\r\n|脚本= 大河内一楼、吉野弘幸、野村祐一\r\n|分镜=\r\n|演出=\r\n|人物原案= CLAMP\r\n|人物设定= 木村貴宏\r\n|作画监督= \r\n|机械设定= \r\n|美术监督= \r\n|色彩设计= \r\n|摄影监督= \r\n|音响监督= \r\n|音乐= \r\n|音乐制作= 中川幸太郎、黒石ひとみ\r\n|动画制作= SUNRISE\r\n|制作= \r\n|播放电视台=\r\n|其他电视台= \r\n|播放结束= 2008年9月20日\r\n|其他= \r\n|Copyright=\r\n}}','上一季最后\r\n鲁路修为他的妹控行为付出了代价\r\n东京攻略战失败，黑色骑士团土崩瓦解\r\n剩下的人有的升官了，比如朱雀同学\r\n有的就业了，比如那位爱因斯坦同学\r\n有的蹲号了，比如奇迹藤堂和他手下\r\n只有罪魁祸首鲁鲁同学\r\n还在享受平静的学园生活\r\n不过这样好日子不会太久了\r\n蛋蛋完结，新番将至\r\n土六已死，日五当立\r\n希望第二季能够无愧于黄金档这块招牌','',25,'两季的标题至少要统一',1),(14884,1,8,2,8025,1285863983,'コードギアス反逆のルルーシュR2','Code Geass 反叛的鲁路修R2','{{Infobox animanga/TVAnime\r\n|中文名= Code Geass 反叛的鲁路修R2\r\n|别名={\r\n}\r\n|话数= 25\r\n|放送开始= 2008年4月6日\r\n|放送星期= 7\r\n|原作= 大河内一楼、谷口悟朗\r\n|导演= 谷口悟朗\r\n|监修= \r\n|官方网站= http://www.geass.jp/\r\n|企画= 内田健二、竹田菁滋、川城和实\r\n|系列构成= 大河内一楼\r\n|脚本= \r\n|分镜= \r\n|演出= \r\n|人物原案= CLAMP\r\n|人物设定= 木村贵宏\r\n|作画监督= 菱沼由典\r\n|机械设定= \r\n|美术监督= 菱沼由典\r\n|色彩设计= 岩沢れい子\r\n|摄影监督= 大矢创太\r\n|音响监督= 浦上靖夫、井泽基\r\n|音乐= 中川幸太郎、黒石ひとみ\r\n|音乐制作= AUDIO PLANNING U\r\n|动画制作= 日升动画\r\n|制作= 每日放送、日升动画、Code Geass制作委员会\r\n|播放电视台= 每日放送\r\n|其他电视台= 台湾 Animax、香港J2、东京放送\r\n|播放结束= 2008年9月28日\r\n|其他= \r\n|Copyright= （C）2006 SUNRISE inc./MBS\r\n}}','上一季最后\r\n鲁路修为他的妹控行为付出了代价\r\n东京攻略战失败，黑色骑士团土崩瓦解\r\n剩下的人有的升官了，比如朱雀同学\r\n有的就业了，比如那位爱因斯坦同学\r\n有的蹲号了，比如奇迹藤堂和他手下\r\n只有罪魁祸首鲁鲁同学\r\n还在享受平静的学园生活\r\n不过这样好日子不会太久了\r\n蛋蛋完结，新番将至\r\n土六已死，日五当立\r\n希望第二季能够无愧于黄金档这块招牌','',25,'',1),(53051,1,8,2,8766,1325596293,'コードギアス反逆のルルーシュR2','Code Geass 反叛的鲁路修R2','{{Infobox animanga/TVAnime\r\n|中文名= Code Geass 反叛的鲁路修R2\r\n|别名={\r\n}\r\n|话数= 25\r\n|放送开始= 2008年4月6日\r\n|放送星期= 7\r\n|官方网站= http://www.geass.jp/\r\n|播放电视台= 每日放送\r\n|其他电视台= 台湾 Animax、香港J2、东京放送\r\n|播放结束= 2008年9月28日\r\n|其他= \r\n|Copyright= （C）2006 SUNRISE inc./MBS\r\n|原作= 大河内一楼、谷口悟朗\r\n|导演= 谷口悟朗\r\n|企画= 内田健二、竹田菁滋、川城和实\r\n|系列构成= 大河内一楼\r\n|人物原案= CLAMP\r\n|人物设定= 木村贵宏\r\n|作画监督= 菱沼由典\r\n|美术监督= 菱沼由典\r\n|色彩设计= 岩沢れい子\r\n|摄影监督= 大矢创太\r\n|音响监督= 浦上靖夫、井泽基\r\n|音乐= 中川幸太郎、黒石ひとみ\r\n|音乐制作= AUDIO PLANNING U\r\n|动画制作= 日升动画\r\n|制作= 每日放送、日升动画、Code Geass制作委员会\r\n}}','　　“东京决战”一年后，布里塔尼亚少年鲁路修在11区（原日本国）过着平凡的学生生活。但是，鲁路修与弟弟罗洛的一次出行，遇到了黑色骑士团的余党。在与少女C.C再次结成契约之后，尘封的记忆摆在了鲁路修的面前。\r\n　　身为帝国王子的鲁路修，为了建立人人平等的世界、让妹妹娜娜丽幸福的世界，而使用GEASS，令人绝对服从的力量，带领黑色骑士团向帝国宣战。带上假面化名ZERO的他，却在一年前的“东京决战”中被好友朱雀击败，被帝国皇帝抹去了记忆。\r\n　　现在，恢复记忆的鲁路修不仅要面对帝国的强大军事力量，更要面对虚假的弟弟罗洛、失踪的妹妹娜娜丽、不知敌友的中华联盟、内部出现分歧的黑色骑士团。面对内忧外患，鲁路修走上了GEASS之力的诅咒——孤独的王之路。 ','',25,'简介修正',1),(71214,1,8,2,9023,1336751754,'コードギアス 反逆のルルーシュR2','Code Geass 反叛的鲁路修R2','{{Infobox animanga/TVAnime\r\n|中文名= Code Geass 反叛的鲁路修R2\r\n|别名={\r\n}\r\n|话数= 25\r\n|放送开始= 2008年4月6日\r\n|放送星期= 7\r\n|官方网站= http://www.geass.jp/\r\n|播放电视台= 每日放送\r\n|其他电视台= 台湾 Animax、香港J2、东京放送\r\n|播放结束= 2008年9月28日\r\n|其他= \r\n|Copyright= （C）2006 SUNRISE inc./MBS\r\n|原作= 大河内一楼、谷口悟朗\r\n|导演= 谷口悟朗\r\n|企画= 内田健二、竹田菁滋、川城和实\r\n|系列构成= 大河内一楼\r\n|人物原案= CLAMP\r\n|人物设定= 木村贵宏\r\n|作画监督= 菱沼由典\r\n|美术监督= 菱沼由典\r\n|色彩设计= 岩沢れい子\r\n|摄影监督= 大矢创太\r\n|音响监督= 浦上靖夫、井泽基\r\n|音乐= 中川幸太郎、黒石ひとみ\r\n|音乐制作= AUDIO PLANNING U\r\n|动画制作= 日升动画\r\n|制作= 每日放送、日升动画、Code Geass制作委员会\r\n}}','　　“东京决战”一年后，布里塔尼亚少年鲁路修在11区（原日本国）过着平凡的学生生活。但是，鲁路修与弟弟罗洛的一次出行，遇到了黑色骑士团的余党。在与少女C.C再次结成契约之后，尘封的记忆摆在了鲁路修的面前。\r\n　　身为帝国王子的鲁路修，为了建立人人平等的世界、让妹妹娜娜丽幸福的世界，而使用GEASS，令人绝对服从的力量，带领黑色骑士团向帝国宣战。带上假面化名ZERO的他，却在一年前的“东京决战”中被好友朱雀击败，被帝国皇帝抹去了记忆。\r\n　　现在，恢复记忆的鲁路修不仅要面对帝国的强大军事力量，更要面对虚假的弟弟罗洛、失踪的妹妹娜娜丽、不知敌友的中华联盟、内部出现分歧的黑色骑士团。面对内忧外患，鲁路修走上了GEASS之力的诅咒——孤独的王之路。 ','',25,'',1),(241960,1,8,2,26862,1417061160,'コードギアス 反逆のルルーシュR2','Code Geass 反叛的鲁路修R2','{{Infobox animanga/TVAnime\r\n|中文名= Code Geass 反叛的鲁路修R2\r\n|别名={\r\n[叛逆的鲁鲁修R2]\r\n[コードギアス 反逆のルルーシュR2]\r\n[Code Geass Lelouch of the Rebellion R2]\r\n[叛逆的勒路什R2]\r\n}\r\n|话数= 25\r\n|放送开始= 2008年4月6日\r\n|放送星期= \r\n|官方网站= http://www.geass.jp/\r\n|播放电视台= 每日放送\r\n|其他电视台= \r\n|播放结束= 2008年9月28日\r\n|其他= \r\n|Copyright= （C）2006 SUNRISE inc./MBS\r\n|导演= 谷口悟朗\r\n|系列构成= 大河内一楼\r\n|人物原案= CLAMP\r\n|人物设定= 木村貴宏\r\n|美术监督= 菱沼由典\r\n|色彩设计= 岩沢れい子\r\n|摄影监督= 大矢創太\r\n|音响监督= 浦上靖夫、井澤基\r\n|音乐= 中川幸太郎、黒石ひとみ\r\n|音乐制作= AUDIO PLANNING U\r\n|动画制作= 日升动画\r\n}}','　　“东京决战”一年后，布里塔尼亚少年鲁路修在11区（原日本国）过着平凡的学生生活。但是，鲁路修与弟弟罗洛的一次出行，遇到了黑色骑士团的余党。在与少女C.C再次结成契约之后，尘封的记忆摆在了鲁路修的面前。\r\n　　身为帝国王子的鲁路修，为了建立人人平等的世界、让妹妹娜娜丽幸福的世界，而使用GEASS，令人绝对服从的力量，带领黑色骑士团向帝国宣战。带上假面化名ZERO的他，却在一年前的“东京决战”中被好友朱雀击败，被帝国皇帝抹去了记忆。\r\n　　现在，恢复记忆的鲁路修不仅要面对帝国的强大军事力量，更要面对虚假的弟弟罗洛、失踪的妹妹娜娜丽、不知敌友的中华联盟、内部出现分歧的黑色骑士团。面对内忧外患，鲁路修走上了GEASS之力的诅咒——孤独的王之路。 ','',25,'修正笔误',1),(551942,1,8,2,79290,1522689610,'コードギアス 反逆のルルーシュR2','Code Geass 反叛的鲁路修R2','{{Infobox animanga/TVAnime\r\n|中文名= Code Geass 反叛的鲁路修R2\r\n|别名={\r\n[叛逆的鲁路修R2]\r\n[Code Geass: Hangyaku no Lelouch R2]\r\n[叛逆的勒鲁什R2]\r\n[叛逆的鲁鲁修R2]\r\n[コードギアス 反逆のルルーシュR2]\r\n[Code Geass: Lelouch of the Rebellion R2]\r\n[叛逆的勒路什R2]\r\n}\r\n|话数= 25\r\n|放送开始= 2008年4月6日\r\n|放送星期= \r\n|官方网站= http://www.geass.jp/\r\n|播放电视台= 每日放送\r\n|其他电视台= \r\n|播放结束= 2008年9月28日\r\n|其他= \r\n|Copyright= （C）2006 SUNRISE inc./MBS\r\n|导演= 谷口悟朗\r\n|系列构成= 大河内一楼\r\n|人物原案= CLAMP\r\n|人物设定= 木村貴宏\r\n|美术监督= 菱沼由典\r\n|色彩设计= 岩沢れい子\r\n|摄影监督= 大矢創太\r\n|音响监督= 浦上靖夫、井澤基\r\n|音乐= 中川幸太郎、黒石ひとみ\r\n|音乐制作= AUDIO PLANNING U\r\n|动画制作= サンライズ\r\n}}','　　“东京决战”一年后，布里塔尼亚少年鲁路修在11区（原日本国）过着平凡的学生生活。但是，鲁路修与弟弟罗洛的一次出行，遇到了黑色骑士团的余党。在与少女C.C再次结成契约之后，尘封的记忆摆在了鲁路修的面前。\r\n　　身为帝国王子的鲁路修，为了建立人人平等的世界、让妹妹娜娜丽幸福的世界，而使用GEASS，令人绝对服从的力量，带领黑色骑士团向帝国宣战。带上假面化名ZERO的他，却在一年前的“东京决战”中被好友朱雀击败，被帝国皇帝抹去了记忆。\r\n　　现在，恢复记忆的鲁路修不仅要面对帝国的强大军事力量，更要面对虚假的弟弟罗洛、失踪的妹妹娜娜丽、不知敌友的中华联盟、内部出现分歧的黑色骑士团。面对内忧外患，鲁路修走上了GEASS之力的诅咒——孤独的王之路。 ','',25,'添加别名',1),(113779,1,8,2,104510,1357187180,'コードギアス 反逆のルルーシュR2','Code Geass 反叛的鲁路修R2','{{Infobox animanga/TVAnime\r\n|中文名= Code Geass 反叛的鲁路修R2\r\n|别名={\r\n}\r\n|话数= 25\r\n|放送开始= 2008年4月6日\r\n|放送星期= \r\n|官方网站= http://www.geass.jp/\r\n|播放电视台= 每日放送\r\n|播放结束= 2008年9月28日\r\n|其他= \r\n|Copyright= （C）2006 SUNRISE inc./MBS\r\n|导演= 谷口悟朗\r\n|系列构成= 大河内一楼\r\n|人物原案= CLAMP\r\n|人物设定= 木村贵宏\r\n|美术监督= 菱沼由典\r\n|色彩设计= 岩沢れい子\r\n|摄影监督= 大矢创太\r\n|音响监督= 浦上靖夫、井泽基\r\n|音乐= 中川幸太郎、黒石ひとみ\r\n|音乐制作= AUDIO PLANNING U\r\n|动画制作= 日升动画\r\n}}','　　“东京决战”一年后，布里塔尼亚少年鲁路修在11区（原日本国）过着平凡的学生生活。但是，鲁路修与弟弟罗洛的一次出行，遇到了黑色骑士团的余党。在与少女C.C再次结成契约之后，尘封的记忆摆在了鲁路修的面前。\r\n　　身为帝国王子的鲁路修，为了建立人人平等的世界、让妹妹娜娜丽幸福的世界，而使用GEASS，令人绝对服从的力量，带领黑色骑士团向帝国宣战。带上假面化名ZERO的他，却在一年前的“东京决战”中被好友朱雀击败，被帝国皇帝抹去了记忆。\r\n　　现在，恢复记忆的鲁路修不仅要面对帝国的强大军事力量，更要面对虚假的弟弟罗洛、失踪的妹妹娜娜丽、不知敌友的中华联盟、内部出现分歧的黑色骑士团。面对内忧外患，鲁路修走上了GEASS之力的诅咒——孤独的王之路。 ','',25,'',1),(133888,1,8,2,130027,1364576814,'コードギアス 反逆のルルーシュR2','Code Geass 反叛的鲁路修R2','{{Infobox animanga/TVAnime\r\n|中文名= Code Geass 反叛的鲁路修R2\r\n|别名={\r\n[叛逆的鲁鲁修R2]\r\n[コードギアス 反逆のルルーシュR2]\r\n[Code Geass Lelouch of the Rebellion R2]\r\n[叛逆的勒路什R2]\r\n}\r\n|话数= 25\r\n|放送开始= 2008年4月6日\r\n|放送星期= \r\n|官方网站= http://www.geass.jp/\r\n|播放电视台= 每日放送\r\n|其他电视台= \r\n|播放结束= 2008年9月28日\r\n|其他= \r\n|Copyright= （C）2006 SUNRISE inc./MBS\r\n|导演= 谷口悟朗\r\n|系列构成= 大河内一楼\r\n|人物原案= CLAMP\r\n|人物设定= 木村贵宏\r\n|美术监督= 菱沼由典\r\n|色彩设计= 岩沢れい子\r\n|摄影监督= 大矢创太\r\n|音响监督= 浦上靖夫、井泽基\r\n|音乐= 中川幸太郎、黒石ひとみ\r\n|音乐制作= AUDIO PLANNING U\r\n|动画制作= 日升动画\r\n}}','　　“东京决战”一年后，布里塔尼亚少年鲁路修在11区（原日本国）过着平凡的学生生活。但是，鲁路修与弟弟罗洛的一次出行，遇到了黑色骑士团的余党。在与少女C.C再次结成契约之后，尘封的记忆摆在了鲁路修的面前。\r\n　　身为帝国王子的鲁路修，为了建立人人平等的世界、让妹妹娜娜丽幸福的世界，而使用GEASS，令人绝对服从的力量，带领黑色骑士团向帝国宣战。带上假面化名ZERO的他，却在一年前的“东京决战”中被好友朱雀击败，被帝国皇帝抹去了记忆。\r\n　　现在，恢复记忆的鲁路修不仅要面对帝国的强大军事力量，更要面对虚假的弟弟罗洛、失踪的妹妹娜娜丽、不知敌友的中华联盟、内部出现分歧的黑色骑士团。面对内忧外患，鲁路修走上了GEASS之力的诅咒——孤独的王之路。 ','',25,'内容扩充',1),(275753,1,8,2,189074,1430296495,'コードギアス 反逆のルルーシュR2','Code Geass 反叛的鲁路修R2','{{Infobox animanga/TVAnime\r\n|中文名= Code Geass 反叛的鲁路修R2\r\n|别名={\r\n[叛逆的鲁鲁修R2]\r\n[コードギアス 反逆のルルーシュR2]\r\n[Code Geass Lelouch of the Rebellion R2]\r\n[叛逆的勒路什R2]\r\n}\r\n|话数= 25\r\n|放送开始= 2008年4月6日\r\n|放送星期= \r\n|官方网站= http://www.geass.jp/\r\n|播放电视台= 每日放送\r\n|其他电视台= \r\n|播放结束= 2008年9月28日\r\n|其他= \r\n|Copyright= （C）2006 SUNRISE inc./MBS\r\n|导演= 谷口悟朗\r\n|系列构成= 大河内一楼\r\n|人物原案= CLAMP\r\n|人物设定= 木村貴宏\r\n|美术监督= 菱沼由典\r\n|色彩设计= 岩沢れい子\r\n|摄影监督= 大矢創太\r\n|音响监督= 浦上靖夫、井澤基\r\n|音乐= 中川幸太郎、黒石ひとみ\r\n|音乐制作= AUDIO PLANNING U\r\n|动画制作= サンライズ\r\n}}','　　“东京决战”一年后，布里塔尼亚少年鲁路修在11区（原日本国）过着平凡的学生生活。但是，鲁路修与弟弟罗洛的一次出行，遇到了黑色骑士团的余党。在与少女C.C再次结成契约之后，尘封的记忆摆在了鲁路修的面前。\r\n　　身为帝国王子的鲁路修，为了建立人人平等的世界、让妹妹娜娜丽幸福的世界，而使用GEASS，令人绝对服从的力量，带领黑色骑士团向帝国宣战。带上假面化名ZERO的他，却在一年前的“东京决战”中被好友朱雀击败，被帝国皇帝抹去了记忆。\r\n　　现在，恢复记忆的鲁路修不仅要面对帝国的强大军事力量，更要面对虚假的弟弟罗洛、失踪的妹妹娜娜丽、不知敌友的中华联盟、内部出现分歧的黑色骑士团。面对内忧外患，鲁路修走上了GEASS之力的诅咒——孤独的王之路。 ','',25,'',1),(643749,1,8,2,318251,1570720134,'コードギアス 反逆のルルーシュR2','Code Geass 反叛的鲁路修R2','{{Infobox animanga/TVAnime\r\n|中文名= Code Geass 反叛的鲁路修R2\r\n|别名={\r\n[叛逆的鲁路修R2]\r\n[Code Geass: Hangyaku no Lelouch R2]\r\n[叛逆的勒鲁什R2]\r\n[叛逆的鲁鲁修R2]\r\n[コードギアス 反逆のルルーシュR2]\r\n[Code Geass: Lelouch of the Rebellion R2]\r\n[叛逆的勒路什R2]\r\n}\r\n|话数= 25\r\n|放送开始= 2008年4月6日\r\n|放送星期= \r\n|官方网站= http://www.geass.jp/r2/\r\n|播放电视台= 每日放送\r\n|其他电视台= \r\n|播放结束= 2008年9月28日\r\n|其他= \r\n|Copyright= （C）2006 SUNRISE inc./MBS\r\n|导演= 谷口悟朗\r\n|系列构成= 大河内一楼\r\n|人物原案= CLAMP\r\n|人物设定= 木村貴宏\r\n|美术监督= 菱沼由典\r\n|色彩设计= 岩沢れい子\r\n|摄影监督= 大矢創太\r\n|音响监督= 浦上靖夫、井澤基\r\n|音乐= 中川幸太郎、黒石ひとみ\r\n|音乐制作= AUDIO PLANNING U\r\n|动画制作= サンライズ\r\n}}','　　“东京决战”一年后，布里塔尼亚少年鲁路修在11区（原日本国）过着平凡的学生生活。但是，鲁路修与弟弟罗洛的一次出行，遇到了黑色骑士团的余党。在与少女C.C再次结成契约之后，尘封的记忆摆在了鲁路修的面前。\r\n　　身为帝国王子的鲁路修，为了建立人人平等的世界、让妹妹娜娜丽幸福的世界，而使用GEASS，令人绝对服从的力量，带领黑色骑士团向帝国宣战。带上假面化名ZERO的他，却在一年前的“东京决战”中被好友朱雀击败，被帝国皇帝抹去了记忆。\r\n　　现在，恢复记忆的鲁路修不仅要面对帝国的强大军事力量，更要面对虚假的弟弟罗洛、失踪的妹妹娜娜丽、不知敌友的中华联盟、内部出现分歧的黑色骑士团。面对内忧外患，鲁路修走上了GEASS之力的诅咒——孤独的王之路。 ','',25,'',1),(37,1,9,4,1,1232787986,'リズム天国ゴールド','节奏天国 金','{{Infobox Game\r\n|中文名=节奏天国 金\r\n|平台=NDS\r\n|游戏类型=MUG\r\n|游戏开发商=Nintendo\r\n|游戏出版商=\r\n|发行商=Nintendo\r\n|游戏设计师=つんく♂\r\n|游戏引擎=\r\n|游玩人数=1\r\n|发行日期=2008-07-31\r\n|售价=3800日元\r\n|website=\r\n}}','GBA人气音乐游戏《节奏天国》的续作，收录多彩迷你游戏约50种。前作《节奏天国》采用按键操作，登陆NDS的续作将采用触控笔操作。 ','',0,'维基化',5),(295332,1,9,4,92853,1437992515,'リズム天国ゴールド','节奏天国 金','{{Infobox Game\r\n|中文名= 节奏天国 金\r\n|别名={\r\n}\r\n|平台= NDS\r\n|游戏类型= MUG\r\n|游戏引擎= \r\n|游玩人数= 1\r\n|发行日期= 2008-07-31\r\n|售价= 3800日元\r\n|website= http://www.nintendo.co.jp/ds/ylzj/\r\n|游戏开发商= Nintendo\r\n|发行商= Nintendo\r\n|游戏设计师= つんく♂\r\n}}','GBA人气音乐游戏《节奏天国》的续作，收录多彩迷你游戏约50种。前作《节奏天国》采用按键操作，登陆NDS的续作将采用触控笔操作。 ','',0,'',5),(639349,1,9,4,227062,1568004638,'リズム天国ゴールド','节奏天国 金','{{Infobox Game\r\n|中文名= 节奏天国 金\r\n|别名={\r\n}\r\n|平台= NDS\r\n|游戏类型= MUG\r\n|游戏引擎= \r\n|游玩人数= 1\r\n|发行日期= 2008-07-31\r\n|售价= 3800日元\r\n|website= http://www.nintendo.co.jp/ds/ylzj/\r\n|游戏开发商= \r\n|发行商= \r\n|游戏设计师= つんく♂\r\n}}','GBA人气音乐游戏《节奏天国》的续作，收录多彩迷你游戏约50种。前作《节奏天国》采用按键操作，登陆NDS的续作将采用触控笔操作。 ','',0,'',5),(48261,1,10,1,13974,1323057075,'Your Eyes Only ちぃフォトグラフィクス','','{{Infobox animanga/Manga\r\n|中文名= \r\n|别名={\r\n}\r\n|出版社= 講談社\r\n|价格= \r\n|作画= \r\n|其他出版社= \r\n|连载杂志= \r\n|发售日= 2003-01\r\n|页数= \r\n|话数= \r\n|ISBN= 9784063346701\r\n|其他= \r\n|作者= CLAMP\r\n}}','ちぃのベストショット満載！！\r\nファン待望の『ちょびっツ』原画集\r\n\r\n『ちょびっツ』連載開始から2年。\r\nヤンマガはもとより、グッズやCD、DVD等に描きおろされたイラストの中から、フォトジェニックなちぃを集めて一冊の原画集にします！\r\nちぃのかわいさがぎっしりつまった画集、買い逃し厳禁だ！','',0,'',0),(83026,1,10,1,21804,1344250510,'Your Eyes Only ちぃフォトグラフィクス','','{{Infobox animanga/Book\r\n|中文名= \r\n|别名={\r\n}\r\n|出版社= 講談社\r\n|价格= \r\n|其他出版社= \r\n|连载杂志= \r\n|发售日= 2003-01\r\n|页数= \r\n|ISBN= 9784063346701\r\n|其他= \r\n|作者= CLAMP\r\n}}','ちぃのベストショット満載！！\r\nファン待望の『ちょびっツ』原画集\r\n\r\n『ちょびっツ』連載開始から2年。\r\nヤンマガはもとより、グッズやCD、DVD等に描きおろされたイラストの中から、フォトジェニックなちぃを集めて一冊の原画集にします！\r\nちぃのかわいさがぎっしりつまった画集、買い逃し厳禁だ！','',0,'分类',1003);
/*!40000 ALTER TABLE `chii_subject_revisions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_rev_history` WRITE;
/*!40000 ALTER TABLE `chii_rev_history` DISABLE KEYS */;
REPLACE INTO `chii_rev_history` VALUES (1,2,1,1,1286307038,1,''),(2,2,1,1,1286307101,1,''),(3,2,1,1,1286307230,1,''),(4,2,1,1,1286307240,1,''),(5,2,1,1,1286307560,1,''),(7,2,1,1,1296151570,1,'新肖像'),(8,3,1,3,1296155280,1,'新条目'),(9,3,1,3,1296155858,1,'内容扩充'),(12,3,3,5,1296165131,1,'新条目'),(16,3,4,7,1296174135,1,'新条目'),(17,2,8,8,1296174187,1,''),(18,3,5,9,1296176105,1,'新条目'),(19,2,3,10,1296176145,1,'维基化'),(20,2,4,11,1262416240,2978,''),(21,2,5,12,1262416253,2978,''),(22,2,6,13,1262416267,2978,''),(23,2,8,8,1255520881,5972,''),(992,2,4,622,1249808162,4293,'新条目'),(993,2,4,622,1249808760,4293,''),(994,2,5,623,1249808269,4293,'新条目'),(995,2,5,623,1249808787,4293,''),(996,2,6,624,1249808395,4293,'新条目'),(997,2,6,624,1249808815,4293,''),(998,2,7,625,1249808508,4293,'新条目'),(999,2,7,625,1249808840,4293,''),(1000,2,8,626,1249808615,4293,'新条目'),(1001,2,8,626,1249808868,4293,''),(2175,3,1,3,1296185144,1,''),(2176,3,1,3,1296185912,1,'维基化'),(2182,2,1,1,1296258562,1,'新肖像'),(2183,2,1,1,1296258610,1,'新肖像'),(2185,3,1,3,1296265167,1,'新肖像'),(2206,3,1,3,1296281223,14432,''),(2658,4,5,1807,1296361015,4681,'关联修改'),(2663,4,4,1811,1296361162,4681,'关联修改'),(2796,9,1,1902,1296365604,14432,'关联修改'),(2797,9,1,1902,1296365628,14432,'关联修改'),(2799,9,1,1902,1296365640,14432,'关联修改'),(2800,9,1,1902,1296365654,14432,'关联修改'),(2804,9,1,1902,1296365688,14432,'关联修改'),(3117,3,1,3,1296377157,1010,''),(4159,8,1,2783,1296500374,2978,'关联修改'),(4424,9,3,2998,1296540560,8739,'关联修改'),(4708,9,1,1902,1296586071,12367,'关联修改'),(5780,9,1,1902,1296812072,14459,'关联修改'),(5909,8,1,2783,1296835082,9105,'关联修改'),(6651,9,1,1902,1297053366,12367,'关联修改'),(6653,9,1,1902,1297053421,12367,'关联修改'),(7970,9,3,2998,1297672910,2978,'关联修改'),(7971,9,3,2998,1297672977,2978,'关联修改'),(7972,9,3,2998,1297673201,2978,'关联修改'),(8033,2,5,623,1297700587,4681,'内容扩充'),(8043,2,4,622,1297700995,4681,'内容扩充'),(8046,4,4,1811,1297701139,4681,'关联修改'),(8050,2,6,624,1297701419,4681,'内容扩充'),(8051,4,6,5460,1297701473,4681,'关联修改'),(8054,2,7,625,1297701607,4681,'内容扩充'),(8058,2,8,626,1297701883,4681,'内容扩充'),(8075,2,7,625,1297702714,4681,'新肖像'),(8132,4,7,5523,1297742569,4681,'关联修改'),(8134,7,6,5525,1297742673,4681,'关联修改'),(8351,8,1,2783,1297812584,12367,'关联修改'),(8352,8,1,2783,1297812602,12367,'关联修改'),(8354,8,1,2783,1297812968,12367,'关联修改'),(8364,9,1,1902,1297820724,12367,'关联修改'),(8493,7,8,5775,1297875225,14459,'关联修改'),(10013,3,1,3,1298817641,6823,'内容扩充'),(10978,2,4,622,1299395724,6823,'简介中文化~~~'),(14696,4,8,10066,1301500195,4681,'关联修改'),(18662,3,1,3,1303388835,6823,'添加 公认荣誉'),(19856,2,3,10,1304757018,4199,'新条目'),(20590,7,5,14205,1305640309,7899,'关联修改'),(22216,10,13,15242,1307896731,4681,'关联修改'),(23053,5,8,15807,1309061365,2813,'关联修改'),(29888,7,4,20175,1318062872,9302,'关联修改'),(30189,10,13,15242,1318223862,46771,'关联修改'),(36655,9,10,24194,1326884961,9023,'关联修改'),(36656,9,10,24194,1326885001,9023,'关联修改'),(36657,3,10,24195,1326885120,9023,''),(39570,10,8,26116,1330441184,9023,'关联修改'),(39573,9,14,26118,1330441660,9023,'关联修改'),(39576,9,14,26118,1330442078,9023,'关联修改'),(43010,4,7,5523,1333495627,5267,'关联修改'),(43011,7,7,27973,1333495640,5267,'关联修改'),(43012,7,7,27973,1333495645,5267,'关联修改'),(43013,4,8,10066,1333495736,5267,'关联修改'),(43014,7,8,5775,1333495751,5267,'关联修改'),(43015,7,8,5775,1333495759,5267,'关联修改'),(50013,7,8,5775,1340421799,5267,'关联修改'),(50866,8,1,2783,1341711793,12367,'关联修改'),(52532,17,12,33837,1342972575,1,'条目关联修改'),(52533,17,12,33837,1342972610,1,'条目关联修改'),(52534,17,12,33837,1342972621,1,'条目关联修改'),(52600,17,13,33882,1342977041,1,'条目关联修改'),(52601,17,13,33882,1342977066,1,'条目关联修改'),(52723,17,8,33962,1342980876,1,'条目关联修改'),(52988,17,13,33882,1343015259,11503,'条目关联修改'),(52989,17,13,33882,1343015276,11503,'条目关联修改'),(52991,17,13,33882,1343015284,11503,'条目关联修改'),(56753,17,13,33882,1344085993,9023,'条目关联修改'),(56755,17,13,33882,1344086018,9023,'条目关联修改'),(57285,17,10,36755,1344250535,21804,'条目关联修改'),(57286,17,10,36755,1344250573,21804,'条目关联修改'),(57968,10,12,37203,1344509252,3464,'关联修改'),(59066,17,8,33962,1345099864,9023,'条目关联修改'),(62262,9,17,39751,1347249365,9023,'关联修改'),(62793,10,8,26116,1347777405,9023,'关联修改'),(65078,10,8,26116,1349061145,9023,'关联修改'),(66032,10,12,37203,1349425458,14127,'关联修改'),(66470,7,3,42389,1349598495,8270,'关联修改'),(66471,4,3,42390,1349598516,8270,'关联修改'),(66473,7,3,42389,1349598530,8270,'关联修改'),(70822,9,11,45153,1352299568,9023,'关联修改'),(70823,9,12,45154,1352299613,9023,'关联修改'),(79207,17,12,33837,1355841403,13349,'条目关联修改'),(79481,10,12,37203,1355896673,104510,'关联修改'),(83057,10,8,26116,1357185085,104510,'关联修改'),(83058,10,8,26116,1357185167,104510,'关联修改'),(87355,8,1,2783,1358325032,50094,'关联修改'),(88013,3,14,55400,1358481674,8202,'内容扩充'),(90016,10,12,37203,1359340983,104510,'关联修改'),(91049,3,3,5,1359901319,21804,'内容扩充'),(91779,10,8,26116,1360166401,9023,'关联修改'),(91835,17,9,57888,1360211234,48355,'条目关联修改'),(109635,10,8,26116,1366088014,9023,'关联修改'),(110506,9,20,68702,1366364453,104510,'关联修改'),(110507,9,20,68702,1366364740,104510,'关联修改'),(111342,3,1,3,1366704148,8202,'内容扩充'),(113047,2,9,70088,1367229876,50094,'新条目'),(113054,2,9,70088,1367229903,50094,''),(114511,2,9,70862,1367820926,8520,''),(114512,13,9,70863,1367820938,8520,'与 ID:19875 合体'),(114513,2,9,70862,1367822366,50094,'新肖像'),(118190,17,8,33962,1368866137,50094,'条目关联修改'),(147359,18,1,86237,1377253508,0,'章节初始化'),(150355,3,12,87645,1377897247,111325,''),(152115,2,12,88395,1378391892,45796,'新条目'),(152116,2,14,88396,1378392112,45796,'新条目'),(152117,2,14,88396,1378392151,45796,'新肖像'),(152118,2,12,88395,1378392188,45796,'新肖像'),(152119,2,18,88397,1378392230,45796,'新肖像'),(152120,2,18,88397,1378392303,45796,''),(152121,2,12,88395,1378392323,45796,''),(152122,2,14,88396,1378392340,45796,''),(152123,2,18,88397,1378392365,45796,''),(152124,2,17,88398,1378392459,45796,''),(152125,2,10,88399,1378392566,45796,''),(152126,2,15,88400,1378392693,45796,''),(152129,2,15,88400,1378392734,45796,''),(152130,2,11,88402,1378392816,45796,''),(152131,2,13,88403,1378392940,45796,''),(152132,2,17,88398,1378392981,45796,''),(152133,2,16,88404,1378393069,45796,''),(152134,2,16,88404,1378393105,45796,''),(152135,2,14,88396,1378393126,45796,''),(152136,2,18,88397,1378393144,45796,''),(152137,2,17,88398,1378393170,45796,''),(152138,2,10,88399,1378393194,45796,''),(152139,2,15,88400,1378393218,45796,''),(152140,2,11,88402,1378393234,45796,''),(152141,2,13,88403,1378393249,45796,''),(157825,3,8,91252,1379772059,111325,''),(158925,4,9,91759,1380182450,50094,'关联修改'),(158926,5,14,91760,1380182496,50094,'关联修改'),(171523,3,4,7,1384127408,111325,''),(184773,9,10,24194,1388196333,104510,'关联修改'),(190704,2,1,1,1389727628,14382,'引用来源不能引用自身啊=_,='),(195444,17,12,33837,1390745526,8202,'条目关联修改'),(204186,8,1,2783,1392929834,106866,'关联修改'),(204486,10,13,15242,1392974857,162854,'关联修改'),(204487,10,13,15242,1392975152,162854,'关联修改'),(204489,7,6,5525,1392975448,162854,'关联修改'),(204490,7,4,20175,1392975486,162854,'关联修改'),(204499,5,13,114690,1392976210,162854,'关联修改'),(206709,7,9,115871,1393588958,50094,'关联修改'),(206908,7,9,115871,1393604936,50094,'关联修改'),(207326,10,14,116202,1393705090,50094,'关联修改'),(208713,5,12,116917,1394081057,9023,'关联修改'),(208716,5,12,116917,1394081070,9023,'关联修改'),(208720,10,12,37203,1394082516,9023,'关联修改'),(208722,10,12,37203,1394082588,9023,'关联修改'),(208723,10,12,37203,1394082592,9023,'关联修改'),(213326,17,8,33962,1395393197,21804,'条目关联修改'),(219990,10,12,37203,1397440385,104510,'关联修改'),(220830,3,12,87645,1397723926,111325,''),(221406,9,18,123151,1397921114,144872,'关联修改'),(227045,5,8,15807,1399224927,32374,'关联修改'),(227051,5,8,15807,1399225560,32374,'关联修改'),(227066,5,8,15807,1399226533,32374,'关联修改'),(227069,5,8,15807,1399227001,32374,'关联修改'),(228661,2,19,126796,1399632053,130683,''),(249232,2,7,625,1406042331,12794,''),(249234,2,7,625,1406042380,12794,''),(250990,3,12,87645,1406407975,111325,''),(253524,8,1,2783,1407073073,18215,'关联修改'),(268305,10,10,146534,1411410214,8838,'关联修改'),(268306,10,11,146535,1411410424,8838,'关联修改'),(270842,17,13,33882,1412124701,8202,'条目关联修改'),(275525,5,8,15807,1413182492,209098,'关联修改'),(288251,17,13,33882,1415544793,8202,'条目关联修改'),(292309,3,1,3,1416706925,6823,'新肖像'),(302124,17,8,33962,1419133079,159245,'条目关联修改'),(302125,17,8,33962,1419133176,159245,'条目关联修改'),(304904,17,13,33882,1419921134,33286,'条目关联修改'),(307134,2,20,167771,1420539330,77500,'新肖像'),(307135,2,19,126796,1420539368,77500,'新肖像'),(308165,4,20,168325,1420791120,77500,'关联修改'),(315264,17,8,33962,1422275239,50094,'条目关联修改'),(315271,17,8,33962,1422275679,50094,'条目关联修改'),(324025,3,18,176177,1423963220,101885,'新条目'),(336605,9,15,182381,1425127511,46380,'关联修改'),(348475,3,9,189155,1426990441,104510,''),(357686,17,14,193919,1428889952,80380,'条目关联修改'),(357711,17,14,193919,1428890910,80380,'条目关联修改'),(357822,2,19,126796,1428909096,27551,''),(357823,4,19,193994,1428909122,27551,'关联修改'),(358413,10,14,116202,1429009166,80380,'关联修改'),(362021,3,1,3,1429956368,187943,''),(369903,7,3,42389,1432052452,50094,'关联修改'),(371575,7,1,201392,1432363448,220431,'关联修改'),(371576,4,1,201393,1432363497,220431,'关联修改'),(371577,7,1,201392,1432363510,220431,'关联修改'),(386435,3,14,55400,1436262033,8202,'新肖像'),(390549,3,1,3,1437086254,181308,''),(409030,5,14,91760,1441304701,50094,'关联修改'),(409032,5,14,91760,1441304855,50094,'关联修改'),(409034,5,14,91760,1441304968,50094,'关联修改'),(409047,2,9,70862,1441306041,50094,''),(424685,2,20,167771,1445083237,77500,''),(432539,10,8,26116,1446140392,9023,'关联修改'),(439455,3,4,7,1447416233,181882,''),(439746,10,8,26116,1447469828,153502,'关联修改'),(451499,3,12,87645,1449552429,153502,''),(453184,3,4,7,1449811355,153502,''),(455662,17,8,33962,1450235756,209098,'条目关联修改'),(457912,10,8,26116,1450578445,153502,'关联修改'),(470902,3,13,250414,1452980016,31114,'+簡體中文名'),(472802,3,6,251457,1453397958,181882,''),(472805,9,6,251460,1453398309,181882,'关联修改'),(472806,3,6,251457,1453398336,181882,''),(489665,17,8,33962,1457162584,9023,'条目关联修改'),(497104,2,7,625,1458123702,8838,''),(498967,2,3,10,1458391414,183052,''),(498968,2,1,1,1458391510,183052,''),(500859,10,8,26116,1458744097,183052,'关联修改'),(506970,3,20,267640,1459740927,183052,''),(510394,10,12,37203,1460292494,153502,'关联修改'),(514628,3,12,87645,1460960255,153502,''),(514988,3,12,87645,1461004925,20710,''),(516096,10,8,26116,1461241165,153502,'关联修改'),(525422,3,18,276829,1462613728,153502,''),(535469,10,8,26116,1464503460,183052,'关联修改'),(535472,10,8,26116,1464503649,183052,'关联修改'),(538536,17,13,33882,1465107701,77500,'条目关联修改'),(560220,3,18,276829,1469275516,183052,''),(560221,9,18,123151,1469275561,183052,'关联修改'),(563908,17,8,33962,1469991869,229195,'条目关联修改'),(563926,17,8,33962,1469993486,229195,'条目关联修改'),(568623,4,6,5460,1470717820,241668,'关联修改'),(568624,4,4,1811,1470717833,241668,'关联修改'),(572279,3,7,299451,1471432800,251011,''),(573473,7,4,20175,1471602618,241668,'关联修改'),(573479,4,8,10066,1471602786,241668,'关联修改'),(573480,4,7,5523,1471602800,241668,'关联修改'),(573487,7,8,5775,1471602924,241668,'关联修改'),(573490,7,7,27973,1471602944,241668,'关联修改'),(573492,4,5,1807,1471602986,241668,'关联修改'),(574830,3,15,300888,1471799024,181882,''),(590224,3,1,3,1474182562,189040,''),(609729,10,7,319768,1478099495,135849,'关联修改'),(620196,3,19,325419,1480228085,181882,''),(620197,3,19,325419,1480228101,181882,'修正笔误'),(631769,17,8,33962,1482214372,26862,'条目关联修改'),(634513,3,20,267640,1482678347,181882,''),(648228,5,13,114690,1485241119,274827,'关联修改'),(650157,3,18,276829,1485599148,213047,''),(654469,3,5,9,1486035308,213047,''),(654470,3,7,299451,1486035328,213047,''),(654471,3,8,91252,1486035344,213047,''),(654472,3,11,341784,1486035361,213047,''),(654475,3,12,87645,1486035398,213047,''),(654476,3,14,55400,1486035414,213047,''),(654477,3,17,341785,1486035431,213047,''),(654903,3,3,5,1486088544,181882,''),(662827,10,8,26116,1486972153,213047,'关联修改'),(666305,3,15,300888,1487414350,181882,''),(667391,3,10,24195,1487493559,181882,''),(667399,3,11,341784,1487494276,181882,''),(667402,3,17,341785,1487494404,181882,''),(668431,3,9,189155,1487569835,181882,''),(669692,9,15,182381,1487673242,213047,'关联修改'),(677136,9,6,251460,1488682469,213047,'关联修改'),(677137,3,6,251457,1488682506,213047,''),(682394,9,18,355571,1489591797,213047,'关联修改'),(682395,3,18,176177,1489591920,213047,''),(694089,10,4,361099,1491586560,165229,'关联修改'),(702372,3,6,251457,1493216096,285822,''),(735082,10,8,26116,1499757401,275163,'关联修改'),(742823,17,8,33962,1501218509,265239,'条目关联修改'),(746151,10,13,15242,1501775532,77500,'关联修改'),(746550,5,13,114690,1501850808,265851,'关联修改'),(754035,3,18,176177,1503070280,285822,''),(760643,2,5,623,1504091716,133702,'生日错误，5月13日不是5月30日'),(760644,2,5,623,1504091769,133702,''),(781045,17,8,33962,1508565156,9023,'条目关联修改'),(781048,17,8,33962,1508565225,9023,'条目关联修改'),(781521,17,8,33962,1508671780,265239,'条目关联修改'),(789417,2,3,10,1510725059,213723,''),(790514,9,14,26118,1510980784,217173,'关联修改'),(794453,9,14,26118,1511782687,217173,'关联修改'),(806147,2,4,622,1514529486,101885,'新肖像'),(808252,17,8,33962,1515057017,279427,'条目关联修改'),(809480,10,12,37203,1515333945,259795,'关联修改'),(813021,17,8,33962,1516043521,9023,'条目关联修改'),(823483,17,8,33962,1518264070,273803,'条目关联修改'),(838973,2,1,1,1521108505,57439,'新肖像'),(838979,2,3,10,1521108964,57439,'新肖像'),(838990,4,1,201393,1521109800,57439,'关联修改'),(838997,7,1,201392,1521109909,57439,'关联修改'),(838999,4,3,42390,1521110027,57439,'关联修改'),(839001,7,3,42389,1521110044,57439,'关联修改'),(839911,17,8,33962,1521262534,213723,'条目关联修改'),(872650,10,0,442487,1528177553,64779,'关联删除'),(872651,10,0,442487,1528177575,64779,'关联删除'),(872655,10,0,442487,1528177640,64779,'关联删除'),(872657,10,0,442487,1528177665,64779,'关联删除'),(872658,10,0,442487,1528177674,64779,'关联删除'),(872660,10,0,442487,1528177741,64779,'关联删除'),(875429,10,0,442487,1528688912,390597,'关联删除'),(875748,9,0,443679,1528747123,31114,'关联删除'),(876105,10,0,442487,1528869747,6588,'关联删除'),(877096,9,0,443679,1529110457,31114,'关联删除'),(877169,10,0,442487,1529122923,266927,'关联删除'),(877171,10,0,442487,1529122970,266927,'关联删除'),(877174,10,0,442487,1529123131,266927,'关联删除'),(877175,10,0,442487,1529123161,266927,'关联删除'),(877669,10,0,442487,1529184003,211324,'关联删除'),(878323,4,9,91759,1529374818,227062,'关联修改'),(878324,7,9,115871,1529374877,227062,'关联修改'),(878771,2,19,126796,1529480999,77500,''),(878772,2,20,167771,1529481024,77500,''),(880284,10,0,442487,1529733050,303664,'关联删除'),(881030,10,0,442487,1529872880,229195,'关联删除'),(881031,10,0,442487,1529872935,229195,'关联删除'),(881417,10,0,442487,1530002650,229195,'关联删除'),(881418,10,0,442487,1530002676,229195,'关联删除'),(881445,10,0,442487,1530006803,16106,'关联删除'),(881447,10,0,442487,1530006974,2331,'关联删除'),(883667,10,0,442487,1530441081,21804,'关联删除'),(885093,10,0,442487,1530676207,231889,'关联删除'),(885094,10,0,442487,1530676213,231889,'关联删除'),(885351,10,0,442487,1530709853,407835,'关联删除'),(886146,10,0,442487,1530856752,68717,'关联删除'),(886153,10,0,442487,1530857470,68717,'关联删除'),(886432,10,0,442487,1530888229,397759,'关联删除'),(888176,17,4,449641,1531205451,16106,'条目关联修改'),(888554,5,0,449802,1531265044,9955,'关联删除'),(890826,5,0,449802,1531873325,16106,'关联删除'),(890963,10,0,442487,1531901647,307891,'关联删除'),(894564,10,0,442487,1532695023,57439,'关联删除'),(894565,10,0,442487,1532695033,57439,'关联删除'),(895358,10,0,442487,1532862764,317841,'关联删除'),(895404,10,0,442487,1532873382,21804,'关联删除'),(895904,10,0,442487,1533031725,274451,'关联删除'),(896351,10,0,442487,1533134343,250298,'关联删除'),(897908,10,0,442487,1533520164,63167,'关联删除'),(897997,10,0,442487,1533559556,193200,'关联删除'),(898057,10,0,442487,1533596149,229195,'关联删除'),(898820,5,0,449802,1533752399,376746,'关联删除'),(898821,5,0,449802,1533752414,376746,'关联删除'),(898822,5,0,449802,1533752420,376746,'关联删除'),(898823,5,0,449802,1533752427,376746,'关联删除'),(898824,5,0,449802,1533752435,376746,'关联删除'),(898825,5,0,449802,1533752441,376746,'关联删除'),(898921,5,0,449802,1533803890,181308,'关联删除'),(899894,8,0,455461,1533990555,407835,'关联删除'),(900097,10,0,442487,1534065423,281833,'关联删除'),(900099,10,0,442487,1534065450,281833,'关联删除'),(900100,10,0,442487,1534065462,281833,'关联删除'),(900102,10,0,442487,1534065473,281833,'关联删除'),(900550,9,0,443679,1534143711,231889,'关联删除'),(902298,5,0,449802,1534531018,188332,'关联删除'),(902835,5,0,449802,1534661239,231889,'关联删除'),(903546,5,0,449802,1534836091,248273,'关联删除'),(903554,5,0,449802,1534836264,248273,'关联删除'),(904810,10,0,442487,1535010754,155340,'关联删除'),(905103,10,0,442487,1535073572,42041,'关联删除'),(905192,10,0,442487,1535082941,248273,'关联删除'),(906415,10,0,442487,1535346628,321997,'关联删除'),(906416,10,0,442487,1535346714,321997,'关联删除'),(908438,10,0,442487,1535730587,63167,'关联删除'),(908684,5,0,449802,1535794646,322528,'关联删除'),(909070,10,0,442487,1535875395,250298,'关联删除'),(909071,10,0,442487,1535875408,250298,'关联删除'),(909519,10,0,442487,1535966956,407835,'关联删除'),(910314,10,0,442487,1536154550,21804,'关联删除'),(910315,10,0,442487,1536154580,21804,'关联删除'),(910843,10,0,442487,1536307925,63167,'关联删除'),(911227,10,0,442487,1536390425,21804,'关联删除'),(911832,8,0,455461,1536546604,22083,'关联删除'),(914491,5,0,449802,1537249679,250298,'关联删除'),(914541,10,0,442487,1537265699,303664,'关联删除'),(914893,10,0,442487,1537325092,407835,'关联删除'),(915351,10,0,442487,1537453266,306888,'关联删除'),(917018,10,0,442487,1537817481,244702,'关联删除'),(917172,10,0,442487,1537865151,63167,'关联删除'),(917407,5,0,449802,1537925257,318251,'关联删除'),(917627,10,0,442487,1537986262,88642,'关联删除'),(917632,17,13,33882,1537986956,321997,'条目关联修改'),(918356,10,0,442487,1538227807,68717,'关联删除'),(919438,10,0,442487,1538565219,21804,'关联删除'),(919539,9,0,443679,1538572673,407835,'关联删除'),(920430,17,8,33962,1538735710,9023,'条目关联修改'),(920431,17,8,33962,1538735733,9023,'条目关联修改'),(922236,10,0,442487,1539095730,229195,'关联删除'),(924502,9,0,443679,1539763251,407835,'关联删除'),(924525,9,0,443679,1539763923,407835,'关联删除'),(924704,5,0,449802,1539789344,275444,'关联删除'),(925732,5,0,449802,1540049290,10327,'关联删除'),(925994,10,0,442487,1540111012,63167,'关联删除'),(926783,10,0,442487,1540274130,100746,'关联删除'),(927231,5,0,449802,1540387157,181308,'关联删除'),(927449,9,0,443679,1540443567,181308,'关联删除'),(928521,9,0,443679,1540707506,407835,'关联删除'),(930761,10,0,442487,1541300737,10327,'关联删除'),(931664,10,0,442487,1541602058,248273,'关联删除'),(931672,5,0,449802,1541602535,248273,'关联删除'),(932227,10,0,442487,1541831287,231889,'关联删除'),(932228,10,0,442487,1541831301,231889,'关联删除'),(932506,10,0,442487,1541911545,181308,'关联删除'),(932933,10,0,442487,1542042959,181308,'关联删除'),(933610,10,0,442487,1542323429,149052,'关联删除'),(933650,5,0,449802,1542333267,34757,'关联删除'),(933738,5,0,449802,1542362444,231889,'关联删除'),(933771,9,0,443679,1542366479,180488,'关联删除'),(934735,10,0,442487,1542534663,8142,'关联删除'),(934736,10,0,442487,1542534666,8142,'关联删除'),(935960,10,0,442487,1542815031,248006,'关联删除'),(936422,10,0,472861,1542943227,265239,'关联删除'),(936495,10,0,472861,1542966648,21804,'关联删除'),(937071,10,0,472861,1543137019,181882,'关联删除'),(937072,10,0,472861,1543137039,181882,'关联删除'),(937074,10,0,472861,1543137063,181882,'关联删除'),(937437,10,0,472861,1543233138,215877,'关联删除'),(937496,10,0,472861,1543255652,10327,'关联删除'),(938438,5,0,449802,1543561241,302323,'关联删除'),(938439,5,0,449802,1543561393,302323,'关联删除'),(938445,5,0,449802,1543562572,302323,'关联删除'),(939244,10,0,472861,1543730540,181882,'关联删除'),(939246,10,0,472861,1543730563,181882,'关联删除'),(939666,10,0,472861,1543837089,265239,'关联删除'),(939667,10,0,472861,1543837097,265239,'关联删除'),(940556,9,0,443679,1544097920,283739,'关联删除'),(940678,9,0,443679,1544141566,318251,'关联删除'),(940807,10,0,472861,1544177997,231889,'关联删除'),(941323,10,0,472861,1544293760,68717,'关联删除'),(941327,10,0,472861,1544295170,68717,'关联删除'),(941804,10,0,472861,1544413337,183052,'关联删除'),(941805,10,0,472861,1544413346,183052,'关联删除'),(942653,9,0,443679,1544705360,101885,'关联删除'),(942753,10,0,472861,1544715690,21804,'关联删除'),(942754,10,0,472861,1544715696,21804,'关联删除'),(942755,10,0,472861,1544715703,21804,'关联删除'),(942938,10,0,472861,1544784655,63167,'关联删除'),(942968,10,0,472861,1544791454,102912,'关联删除'),(943334,10,0,472861,1544865963,231889,'关联删除'),(943382,5,0,449802,1544878472,265239,'关联删除'),(944328,9,0,443679,1545130781,229195,'关联删除'),(944786,5,0,449802,1545199806,135587,'关联删除'),(945429,9,0,443679,1545382708,231889,'关联删除'),(945818,10,0,472861,1545477241,21804,'关联删除'),(946001,9,0,443679,1545499456,63429,'关联删除'),(946185,10,0,472861,1545532165,231889,'关联删除'),(946646,10,0,472861,1545654249,318540,'关联删除'),(947070,10,0,472861,1545810680,50094,'关联删除'),(947192,10,0,472861,1545828880,63167,'关联删除'),(947341,10,0,472861,1545846574,21804,'关联删除'),(947342,10,0,472861,1545846596,21804,'关联删除'),(948023,10,0,472861,1546013679,21804,'关联删除'),(948031,10,0,472861,1546015730,66689,'关联删除'),(948033,10,0,472861,1546015741,66689,'关联删除'),(948080,10,0,472861,1546047209,265239,'关联删除'),(948574,10,0,472861,1546152857,231889,'关联删除'),(948575,10,0,472861,1546152893,231889,'关联删除'),(948610,10,0,472861,1546156171,231889,'关联删除'),(948620,10,0,472861,1546156842,231889,'关联删除'),(950864,10,0,472861,1546789515,318251,'关联删除'),(952277,10,0,472861,1547204714,231889,'关联删除'),(952793,9,0,443679,1547345925,183052,'关联删除'),(952799,9,0,443679,1547346198,183052,'关联删除'),(952877,9,0,443679,1547359609,183052,'关联删除'),(953233,10,0,472861,1547458718,68717,'关联删除'),(953278,10,0,472861,1547461240,68717,'关联删除'),(954490,5,0,449802,1547788420,231889,'关联删除'),(954635,10,0,472861,1547801105,322211,'关联删除'),(955938,10,0,472861,1548135828,231889,'关联删除'),(956523,10,0,472861,1548324234,2331,'关联删除'),(956524,10,0,472861,1548324333,2331,'关联删除'),(956526,10,0,472861,1548324360,2331,'关联删除'),(957829,10,0,472861,1548754842,181882,'关联删除'),(958509,10,0,472861,1548928580,54847,'关联删除'),(958824,10,0,472861,1549032726,236860,'关联删除'),(959268,8,0,455461,1549182301,231889,'关联删除'),(959788,10,0,472861,1549231510,303664,'关联删除'),(960233,9,0,443679,1549345743,411072,'关联删除'),(960614,10,0,472861,1549428742,277474,'关联删除'),(961070,10,0,472861,1549558542,31114,'关联删除'),(962168,10,0,472861,1549855195,95396,'关联删除'),(962525,10,0,472861,1549990798,10327,'关联删除'),(962526,10,0,472861,1549990806,10327,'关联删除'),(962703,10,0,472861,1550067069,29225,'关联删除'),(964349,9,0,443679,1550488890,302424,'关联删除'),(964527,5,0,449802,1550540252,318978,'关联删除'),(964717,10,0,472861,1550584409,255907,'关联删除'),(964862,9,0,443679,1550645964,31114,'关联删除'),(964963,10,0,472861,1550669962,10327,'关联删除'),(965813,10,0,472861,1550914916,231889,'关联删除'),(966269,10,0,472861,1551022845,10327,'关联删除'),(966973,10,0,472861,1551169478,42041,'关联删除'),(967426,10,0,472861,1551274315,318978,'关联删除'),(967453,5,0,449802,1551276221,252257,'关联删除'),(968321,5,0,449802,1551517945,231889,'关联删除'),(969335,10,13,15242,1551786327,418314,'关联修改'),(969340,10,13,15242,1551786536,418314,'关联修改'),(969671,10,0,472861,1551867463,231889,'关联删除'),(969986,5,0,449802,1551968490,211998,'关联删除'),(970322,10,0,472861,1552031199,14356,'关联删除'),(971943,10,0,472861,1552569797,180164,'关联删除'),(971976,10,0,472861,1552572806,180164,'关联删除'),(972261,10,0,472861,1552697432,10327,'关联删除'),(972263,10,0,472861,1552697444,10327,'关联删除'),(972406,10,0,472861,1552719580,207398,'关联删除'),(973088,10,0,472861,1552834371,21804,'关联删除'),(973089,10,0,472861,1552834396,21804,'关联删除'),(973093,10,0,472861,1552834450,21804,'关联删除'),(974702,10,0,472861,1553169701,207398,'关联删除'),(975029,10,0,472861,1553196136,10327,'关联删除'),(975030,10,0,472861,1553196143,10327,'关联删除'),(975229,5,0,449802,1553265484,54847,'关联删除'),(975907,9,0,443679,1553392035,207398,'关联删除'),(975991,5,0,449802,1553399070,407835,'关联删除'),(977801,10,0,492012,1553938577,277398,'关联删除'),(979316,5,0,449802,1554370897,183052,'关联删除'),(981318,10,0,492012,1554926071,229195,'关联删除'),(981605,10,0,492012,1554993351,14356,'关联删除'),(981616,10,0,492012,1554995781,207398,'关联删除'),(981789,10,0,492012,1555061982,2331,'关联删除'),(982242,10,0,492012,1555220810,155340,'关联删除'),(982500,10,0,492012,1555289630,42041,'关联删除'),(982992,9,0,443679,1555497690,2331,'关联删除'),(983652,10,0,492012,1555693288,321997,'关联删除'),(984230,10,0,492012,1555908406,2331,'关联删除'),(985284,9,0,443679,1556172580,183052,'关联删除'),(986042,10,0,492012,1556352778,231889,'关联删除'),(986116,9,0,443679,1556369636,183052,'关联删除'),(988372,9,0,443679,1556985695,207398,'关联删除'),(988374,9,0,443679,1556986287,207398,'关联删除'),(988376,9,0,443679,1556986323,207398,'关联删除'),(988411,9,0,443679,1556991889,207398,'关联删除'),(988413,9,0,443679,1556991904,207398,'关联删除'),(988415,9,0,443679,1556991931,207398,'关联删除'),(988500,9,0,443679,1557037304,207398,'关联删除'),(988597,10,0,492012,1557064661,64968,'关联删除'),(988702,10,0,492012,1557076576,42852,'关联删除'),(988879,9,0,443679,1557161356,207398,'关联删除'),(989032,9,0,443679,1557206430,207398,'关联删除'),(989045,10,0,492012,1557208860,250298,'关联删除'),(989151,10,0,492012,1557278338,63167,'关联删除'),(990176,9,0,443679,1557541228,207398,'关联删除'),(990182,9,0,443679,1557541769,207398,'关联删除'),(990522,5,0,449802,1557625249,407835,'关联删除'),(990765,5,0,449802,1557666123,250298,'关联删除'),(990766,5,0,449802,1557666157,250298,'关联删除'),(990767,5,0,449802,1557666175,250298,'关联删除'),(990768,5,0,449802,1557666196,250298,'关联删除'),(991211,10,0,492012,1557825980,68717,'关联删除'),(991770,10,0,492012,1558068187,283765,'关联删除'),(991985,10,0,492012,1558147556,5073,'关联删除'),(991986,10,0,492012,1558147617,5073,'关联删除'),(991987,10,0,492012,1558147641,5073,'关联删除'),(991988,10,0,492012,1558147680,5073,'关联删除'),(991989,10,0,492012,1558147684,5073,'关联删除'),(991990,10,0,492012,1558147696,5073,'关联删除'),(991991,10,0,492012,1558147829,5073,'关联删除'),(991992,10,0,492012,1558147843,5073,'关联删除'),(991993,10,0,492012,1558147854,5073,'关联删除'),(992052,10,0,492012,1558170467,248273,'关联删除'),(993829,9,0,443679,1558776380,264857,'关联删除'),(994385,10,0,492012,1558945461,267492,'关联删除'),(994948,5,0,449802,1559126779,318251,'关联删除'),(994949,5,0,449802,1559126782,318251,'关联删除'),(995935,9,0,443679,1559398803,8202,'关联删除'),(996041,10,0,492012,1559407573,31114,'关联删除'),(996043,10,0,492012,1559407817,31114,'关联删除'),(998158,10,0,492012,1559904615,318251,'关联删除'),(998332,10,0,492012,1559919338,74929,'关联删除'),(998846,2,4,622,1560006913,101885,'新肖像'),(999601,9,0,443679,1560152226,2331,'关联删除'),(999700,10,0,492012,1560180565,318540,'关联删除'),(999734,10,0,492012,1560190688,229195,'关联删除'),(1000195,9,0,443679,1560298550,183052,'关联删除'),(1000249,8,0,455461,1560314824,231889,'关联删除'),(1000675,10,0,492012,1560448576,21804,'关联删除'),(1001216,10,12,37203,1560583721,181882,'关联修改'),(1001218,10,12,37203,1560584051,181882,'关联修改'),(1001219,10,12,37203,1560584243,181882,'关联修改'),(1001232,10,12,37203,1560592598,181882,'关联修改'),(1001235,10,12,37203,1560592850,181882,'关联修改'),(1001793,9,0,443679,1560782811,31114,'关联删除'),(1002129,9,0,443679,1560866458,418314,'关联删除'),(1002574,10,0,492012,1561047596,229195,'关联删除'),(1002575,10,0,492012,1561047610,229195,'关联删除'),(1003870,10,0,492012,1561453403,318251,'关联删除'),(1004019,10,0,492012,1561493907,10327,'关联删除'),(1004442,10,0,492012,1561646221,63167,'关联删除'),(1004460,10,0,492012,1561650016,49674,'关联删除'),(1004461,10,0,492012,1561650027,49674,'关联删除'),(1005137,9,1,1902,1561903186,318251,'关联修改'),(1006762,10,0,492012,1562402488,231889,'关联删除'),(1007845,10,0,492012,1562647720,63167,'关联删除'),(1009836,10,0,492012,1563121927,250298,'关联删除'),(1010932,9,0,443679,1563552530,207398,'关联删除'),(1011118,10,0,492012,1563602816,207398,'关联删除'),(1011415,5,0,449802,1563677685,187360,'关联删除'),(1013041,10,0,492012,1563945430,207398,'关联删除'),(1013372,10,0,492012,1564025906,407835,'关联删除'),(1013397,9,0,443679,1564026846,411072,'关联删除'),(1013859,10,0,492012,1564120853,42041,'关联删除'),(1015675,10,0,492012,1564397357,322211,'关联删除'),(1015676,10,0,492012,1564397377,322211,'关联删除'),(1015845,7,1,201392,1564455411,133702,'关联修改'),(1015846,7,3,42389,1564455422,133702,'关联修改'),(1015854,5,0,449802,1564462514,183052,'关联删除'),(1016074,9,0,443679,1564502257,2331,'关联删除'),(1016251,5,0,449802,1564556897,250298,'关联删除'),(1016714,10,0,492012,1564630619,303664,'关联删除'),(1016727,10,0,492012,1564635438,63167,'关联删除'),(1017888,9,0,443679,1564851082,318251,'关联删除'),(1018747,10,0,492012,1565097769,63167,'关联删除'),(1018885,10,0,492012,1565109845,181882,'关联删除'),(1018948,10,0,492012,1565118922,30894,'关联删除'),(1018949,10,0,492012,1565118931,30894,'关联删除'),(1018950,10,0,492012,1565118937,30894,'关联删除'),(1018951,10,0,492012,1565118942,30894,'关联删除'),(1019141,9,0,443679,1565152518,207398,'关联删除'),(1020259,10,0,492012,1565412707,181308,'关联删除'),(1020280,10,0,492012,1565417022,2331,'关联删除'),(1021414,10,0,492012,1565705926,64224,'关联删除'),(1021428,10,0,492012,1565710541,30894,'关联删除'),(1021429,10,0,492012,1565710647,30894,'关联删除'),(1021430,10,0,492012,1565710654,30894,'关联删除'),(1021431,10,0,492012,1565710659,30894,'关联删除'),(1021616,10,0,492012,1565762033,181882,'关联删除'),(1022033,9,0,443679,1565944157,229195,'关联删除'),(1023763,10,0,492012,1566528959,181308,'关联删除'),(1023951,10,0,492012,1566613402,181308,'关联删除'),(1023952,10,0,492012,1566613414,181308,'关联删除'),(1024631,10,0,492012,1566828659,2331,'关联删除'),(1025319,9,0,443679,1567009923,207398,'关联删除'),(1025573,5,0,449802,1567062949,2331,'关联删除'),(1026016,10,0,492012,1567174309,2331,'关联删除'),(1026507,10,0,492012,1567316704,2331,'关联删除'),(1026579,10,0,492012,1567324779,180488,'关联删除'),(1026634,10,0,492012,1567334906,2331,'关联删除'),(1026835,10,0,492012,1567393141,207398,'关联删除'),(1027291,10,0,512549,1567452852,180488,'关联删除'),(1027359,10,0,512549,1567480149,181882,'关联删除'),(1027360,10,0,512549,1567480160,181882,'关联删除'),(1027816,4,1,201393,1567566999,67314,'关联修改'),(1028241,2,5,623,1567667356,267845,''),(1029476,10,0,512549,1567999751,418314,'关联删除'),(1029502,10,9,513450,1568004620,227062,'关联修改'),(1030111,10,0,512549,1568168381,207398,'关联删除'),(1030112,10,0,512549,1568168392,207398,'关联删除'),(1030590,2,1,1,1568277118,67314,'修饰语句'),(1030910,4,3,42390,1568348893,67314,'关联修改'),(1032001,10,0,512549,1568639366,207398,'关联删除'),(1032492,5,0,449802,1568773936,164856,'关联删除'),(1032734,9,0,443679,1568865667,164856,'关联删除'),(1033801,9,0,443679,1568972661,183052,'关联删除'),(1034181,10,0,512549,1569061966,275163,'关联删除'),(1034205,9,0,443679,1569065456,2129,'关联删除'),(1036165,5,0,449802,1569509781,250298,'关联删除'),(1036166,5,0,449802,1569509784,250298,'关联删除'),(1036382,10,0,512549,1569579145,207398,'关联删除'),(1037683,5,0,449802,1569911822,63167,'关联删除'),(1037685,10,0,512549,1569911900,63167,'关联删除'),(1037687,5,0,449802,1569911911,63167,'关联删除'),(1037754,10,0,512549,1569943031,40231,'关联删除'),(1038239,10,0,512549,1570158317,181882,'关联删除'),(1038349,10,0,512549,1570176747,2331,'关联删除'),(1038397,5,0,449802,1570190390,183052,'关联删除'),(1038486,5,0,449802,1570233756,267657,'关联删除'),(1038487,5,0,449802,1570233773,267657,'关联删除'),(1039734,2,1,1,1570506251,67314,'新肖像'),(1040382,2,1,1,1570719952,318251,''),(1040383,2,1,1,1570719964,318251,''),(1040727,5,0,449802,1570787592,80380,'关联删除'),(1040846,10,0,512549,1570806261,8142,'关联删除'),(1040847,10,0,512549,1570806272,8142,'关联删除'),(1041128,5,8,15807,1570872040,318251,'关联修改'),(1041131,5,8,15807,1570872664,318251,'关联修改'),(1041208,5,8,15807,1570889138,318251,'关联修改'),(1041740,7,1,201392,1570973932,318251,'关联修改'),(1042400,5,8,15807,1571118707,318251,'关联修改'),(1042455,9,0,443679,1571125853,183052,'关联删除'),(1042711,10,0,512549,1571190954,181308,'关联删除'),(1042712,10,0,512549,1571190960,181308,'关联删除'),(1043011,10,0,512549,1571287220,2331,'关联删除'),(1043188,7,1,201392,1571313950,318251,'关联修改'),(1043483,10,0,512549,1571374467,181308,'关联删除'),(1043524,10,0,512549,1571381559,181308,'关联删除'),(1043525,10,0,512549,1571381576,181308,'关联删除'),(1043527,10,0,512549,1571381741,181308,'关联删除'),(1043535,10,0,512549,1571381918,181308,'关联删除'),(1043538,10,0,512549,1571381960,181308,'关联删除'),(1043937,10,0,512549,1571459879,181308,'关联删除'),(1045266,10,0,512549,1571625259,309121,'关联删除'),(1045417,5,0,449802,1571649245,2331,'关联删除'),(1045424,10,0,512549,1571649401,2331,'关联删除'),(1045775,2,17,88398,1571742952,318251,''),(1046388,10,0,512549,1571814133,2331,'关联删除'),(1046532,10,0,512549,1571833901,181308,'关联删除'),(1047210,10,0,512549,1571955526,10327,'关联删除'),(1047876,10,0,512549,1572023529,366797,'关联删除'),(1048778,10,0,512549,1572162501,274451,'关联删除'),(1049418,3,7,299451,1572260157,318251,''),(1049527,5,0,449802,1572274794,101885,'关联删除'),(1049528,10,0,512549,1572274805,101885,'关联删除'),(1049765,10,0,512549,1572319507,2331,'关联删除'),(1049819,8,0,455461,1572325646,181308,'关联删除'),(1049820,8,0,455461,1572325666,181308,'关联删除'),(1050792,10,0,512549,1572574562,181308,'关联删除'),(1050793,10,0,512549,1572574591,181308,'关联删除'),(1050794,10,0,512549,1572574599,181308,'关联删除'),(1051286,5,0,449802,1572679256,31114,'关联删除'),(1051287,5,0,449802,1572679274,31114,'关联删除'),(1051289,5,0,449802,1572679328,31114,'关联删除'),(1051293,5,0,449802,1572679422,31114,'关联删除'),(1051296,5,0,449802,1572679521,31114,'关联删除'),(1051302,5,0,449802,1572679650,31114,'关联删除'),(1051304,5,0,449802,1572679680,31114,'关联删除'),(1051306,5,0,449802,1572679705,31114,'关联删除'),(1051308,5,0,449802,1572679773,31114,'关联删除'),(1051309,5,0,449802,1572679791,31114,'关联删除'),(1051310,5,0,449802,1572679820,31114,'关联删除'),(1051316,5,0,449802,1572679954,31114,'关联删除'),(1051323,5,0,449802,1572680163,31114,'关联删除'),(1051324,5,0,449802,1572680186,31114,'关联删除'),(1051332,5,0,449802,1572680467,31114,'关联删除'),(1051335,5,0,449802,1572680482,31114,'关联删除'),(1051341,5,0,449802,1572680545,31114,'关联删除'),(1051344,5,0,449802,1572680573,31114,'关联删除'),(1051693,10,0,512549,1572754521,181308,'关联删除'),(1051698,10,0,512549,1572754677,181308,'关联删除'),(1051699,10,0,512549,1572754682,181308,'关联删除'),(1052201,8,0,455461,1572857942,231889,'关联删除'),(1053564,2,3,10,1573280238,101885,'新肖像'),(1053947,9,0,443679,1573368180,181308,'关联删除'),(1054344,2,1,1,1573445261,67314,'新肖像'),(1054368,9,0,443679,1573450741,71697,'关联删除'),(1055209,10,0,512549,1573706659,181308,'关联删除'),(1055218,10,0,512549,1573706742,181308,'关联删除'),(1055411,5,8,15807,1573783161,318251,'关联修改'),(1055655,2,1,1,1573888588,101885,'新肖像'),(1056694,2,1,1,1574167800,318251,'换本篇形象。'),(1059399,10,0,512549,1574841041,63167,'关联删除'),(1059414,5,0,525875,1574850679,63167,'关联删除'),(1059607,10,0,512549,1574940659,10327,'关联删除'),(1060383,10,0,512549,1575127757,63167,'关联删除'),(1060606,9,0,443679,1575190124,411072,'关联删除'),(1062064,7,3,42389,1575622607,207398,'关联修改'),(1062905,10,0,512549,1575890849,8838,'关联删除'),(1064920,8,0,455461,1576467337,181308,'关联删除'),(1065180,5,0,525875,1576553933,71697,'关联删除'),(1065531,9,0,443679,1576652503,228224,'关联删除'),(1065946,2,1,1,1576812712,318251,''),(1066413,5,0,525875,1576990232,22083,'关联删除'),(1066530,10,0,512549,1577018503,207398,'关联删除'),(1066812,10,0,512549,1577071548,309121,'关联删除'),(1067304,10,0,512549,1577171612,42041,'关联删除'),(1067445,10,0,512549,1577200118,63167,'关联删除'),(1069058,10,0,512549,1577524320,2331,'关联删除'),(1069095,8,0,455461,1577526570,443893,'关联删除'),(1069146,10,0,512549,1577535765,2331,'关联删除'),(1069681,10,0,512549,1577617503,63167,'关联删除'),(1069986,10,0,512549,1577667157,264815,'关联删除'),(1070206,10,0,512549,1577687852,268264,'关联删除'),(1070750,9,0,443679,1577805827,461536,'关联删除'),(1070755,9,0,443679,1577806386,461536,'关联删除'),(1070833,10,0,512549,1577845890,319610,'关联删除'),(1070835,10,0,512549,1577845961,319610,'关联删除'),(1071152,10,0,512549,1577952160,2331,'关联删除'),(1071158,5,0,525875,1577952295,2331,'关联删除'),(1071201,10,0,512549,1577970415,207398,'关联删除'),(1071553,10,0,512549,1578097219,38190,'关联删除'),(1072135,10,0,512549,1578224795,2331,'关联删除'),(1072774,5,0,525875,1578355780,23654,'关联删除'),(1073235,10,0,512549,1578465662,181308,'关联删除'),(1073408,9,0,443679,1578531549,318251,'关联删除'),(1074021,5,0,525875,1578658890,14488,'关联删除'),(1074559,10,0,512549,1578751069,21804,'关联删除'),(1074776,10,0,512549,1578805325,8592,'关联删除'),(1074777,10,0,512549,1578805375,8592,'关联删除'),(1075017,10,0,512549,1578839577,367889,'关联删除'),(1075281,9,0,443679,1578910844,239361,'关联删除'),(1075476,10,0,512549,1578941687,239361,'关联删除'),(1075788,5,0,525875,1579078407,250298,'关联删除'),(1075868,10,0,512549,1579092084,2331,'关联删除'),(1075869,10,0,512549,1579092098,2331,'关联删除'),(1076880,10,0,512549,1579344029,456600,'关联删除'),(1076896,9,0,443679,1579347818,309121,'关联删除'),(1077009,2,1,1,1579361701,106437,'内容扩充'),(1077978,9,0,443679,1579527255,253052,'关联删除'),(1078245,10,0,512549,1579581260,7908,'关联删除'),(1078823,5,0,525875,1579665443,253052,'关联删除'),(1079212,10,0,512549,1579843577,2331,'关联删除'),(1079213,10,0,512549,1579843582,2331,'关联删除'),(1080434,9,0,443679,1580126894,2331,'关联删除'),(1080947,10,0,512549,1580234061,432294,'关联删除'),(1081907,9,0,443679,1580540890,309121,'关联删除'),(1082118,10,0,512549,1580643744,253052,'关联删除'),(1082905,5,0,525875,1580875103,7908,'关联删除'),(1084387,8,0,455461,1581227284,318251,'关联删除'),(1084474,10,0,536847,1581244172,318251,'关联删除'),(1084482,10,0,536847,1581244550,318251,'关联删除'),(1085084,10,0,536847,1581369698,253052,'关联删除'),(1085486,5,0,525875,1581478006,31114,'关联删除'),(1085652,10,0,536847,1581506761,422132,'关联删除'),(1085697,10,0,536847,1581515643,207398,'关联删除'),(1087288,10,0,536847,1581842653,422132,'关联删除'),(1087328,10,0,536847,1581850808,422132,'关联删除'),(1088613,9,0,443679,1582115953,422132,'关联删除'),(1088707,10,0,536847,1582123920,309121,'关联删除'),(1088784,8,0,455461,1582132963,309121,'关联删除'),(1089119,5,0,525875,1582182985,250298,'关联删除'),(1089122,8,0,455461,1582183078,250298,'关联删除'),(1089123,8,0,455461,1582183119,250298,'关联删除'),(1089124,5,0,525875,1582183158,250298,'关联删除'),(1089383,10,0,536847,1582216406,2331,'关联删除'),(1089385,10,0,536847,1582216581,2331,'关联删除'),(1090082,10,0,536847,1582358515,2331,'关联删除'),(1090084,10,0,536847,1582358570,2331,'关联删除'),(1090085,10,0,536847,1582358589,2331,'关联删除'),(1090095,10,0,536847,1582358791,2331,'关联删除'),(1090107,10,0,536847,1582359229,2331,'关联删除'),(1090108,10,0,536847,1582359244,2331,'关联删除'),(1090118,10,0,536847,1582359538,2331,'关联删除'),(1091063,8,0,455461,1582426381,159245,'关联删除'),(1091729,8,0,455461,1582522807,318251,'关联删除'),(1091777,10,0,536847,1582531206,181882,'关联删除'),(1092381,9,0,443679,1582671640,233559,'关联删除'),(1092820,10,0,536847,1582769610,474045,'关联删除'),(1092870,10,0,536847,1582779229,207398,'关联删除'),(1093388,5,0,525875,1582877790,211998,'关联删除'),(1093824,10,0,536847,1582956225,2331,'关联删除'),(1093825,10,0,536847,1582956231,2331,'关联删除'),(1094104,9,0,443679,1583004117,218832,'关联删除'),(1094366,10,0,536847,1583053694,2331,'关联删除'),(1094842,10,0,536847,1583194880,401825,'关联删除'),(1094843,10,0,536847,1583194889,401825,'关联删除'),(1094851,5,0,525875,1583203189,152175,'关联删除'),(1095182,10,0,536847,1583255576,2331,'关联删除'),(1095571,10,0,536847,1583398347,319610,'关联删除'),(1095830,10,0,536847,1583466390,319610,'关联删除'),(1095831,10,0,536847,1583466396,319610,'关联删除'),(1095832,10,0,536847,1583466601,319610,'关联删除'),(1095846,10,0,536847,1583468696,319610,'关联删除'),(1095847,10,0,536847,1583469109,319610,'关联删除'),(1095848,10,0,536847,1583469195,319610,'关联删除'),(1097847,10,0,536847,1583853453,250298,'关联删除'),(1098469,10,0,536847,1584018372,370409,'关联删除'),(1098841,10,0,536847,1584089454,319610,'关联删除'),(1098843,10,0,536847,1584089520,319610,'关联删除'),(1098858,10,0,536847,1584090156,319610,'关联删除'),(1099073,10,0,536847,1584161175,319610,'关联删除'),(1099076,9,0,443679,1584162090,64224,'关联删除'),(1099108,10,0,536847,1584167565,319610,'关联删除'),(1099137,8,0,455461,1584172667,426720,'关联删除'),(1099169,9,0,443679,1584181177,309121,'关联删除'),(1099774,5,0,525875,1584284853,207398,'关联删除'),(1099901,9,0,443679,1584345600,411072,'关联删除'),(1099902,9,0,443679,1584345601,411072,'关联删除'),(1099907,9,0,443679,1584346415,411072,'关联删除'),(1100413,10,0,536847,1584506197,319610,'关联删除'),(1100459,10,0,536847,1584511338,319610,'关联删除'),(1100733,10,0,536847,1584545982,2331,'关联删除'),(1101057,3,17,341785,1584598323,264857,'新肖像'),(1101156,10,0,536847,1584624574,418314,'关联删除'),(1101278,10,0,536847,1584680652,319610,'关联删除'),(1101282,10,0,536847,1584681206,207398,'关联删除'),(1101294,10,0,536847,1584682988,319610,'关联删除'),(1101295,10,0,536847,1584682997,319610,'关联删除'),(1101402,10,0,536847,1584692142,181882,'关联删除'),(1101403,10,0,536847,1584692206,181882,'关联删除'),(1101404,10,0,536847,1584692294,181882,'关联删除'),(1101413,10,0,536847,1584693163,181882,'关联删除'),(1101414,10,0,536847,1584693403,181882,'关联删除'),(1101415,10,0,536847,1584693549,181882,'关联删除'),(1101416,10,0,536847,1584693648,181882,'关联删除'),(1101417,10,0,536847,1584693812,181882,'关联删除'),(1101697,10,0,536847,1584785388,242978,'关联删除'),(1101985,9,0,443679,1584842203,213047,'关联删除'),(1102644,8,0,455461,1584954189,171851,'关联删除'),(1103221,10,0,536847,1585128508,319610,'关联删除'),(1103452,10,0,536847,1585164369,2331,'关联删除'),(1103525,5,0,525875,1585177575,324690,'关联删除'),(1103572,10,8,26116,1585196553,461536,'关联修改'),(1103611,9,0,443679,1585209642,213047,'关联删除'),(1103741,10,8,26116,1585236366,461536,'关联修改'),(1103825,10,0,536847,1585293555,2331,'关联删除'),(1103853,10,0,536847,1585300321,2331,'关联删除'),(1103855,10,0,536847,1585300332,2331,'关联删除'),(1103856,10,0,536847,1585300652,2331,'关联删除'),(1103858,10,0,536847,1585300665,2331,'关联删除'),(1103859,10,0,536847,1585300670,2331,'关联删除'),(1103860,10,0,536847,1585300676,2331,'关联删除'),(1103862,10,0,536847,1585300825,2331,'关联删除'),(1103863,10,0,536847,1585300935,2331,'关联删除'),(1103865,10,0,536847,1585300963,2331,'关联删除'),(1103867,10,0,536847,1585301017,2331,'关联删除'),(1104160,10,8,26116,1585395467,461536,'关联修改'),(1104252,10,0,536847,1585412095,277398,'关联删除'),(1105013,10,0,536847,1585479759,207398,'关联删除'),(1105017,10,0,536847,1585479809,207398,'关联删除'),(1105515,10,0,536847,1585630695,78670,'关联删除'),(1105516,10,0,536847,1585630698,78670,'关联删除'),(1105610,10,0,546291,1585654701,78670,'关联删除'),(1105671,5,0,525875,1585664477,218165,'关联删除'),(1105683,5,0,525875,1585665218,218165,'关联删除'),(1106063,8,0,455461,1585813946,64224,'关联删除'),(1106456,8,0,455461,1585892137,64224,'关联删除'),(1106951,10,0,546291,1586023568,242978,'关联删除'),(1107176,9,0,547047,1586071096,213047,'关联删除'),(1107256,10,0,546291,1586085373,61142,'关联删除'),(1108002,10,0,546291,1586245598,78670,'关联删除'),(1108726,10,0,546291,1586412191,250298,'关联删除'),(1108728,10,0,546291,1586412309,250298,'关联删除'),(1108729,10,0,546291,1586412320,250298,'关联删除'),(1108866,5,0,525875,1586429083,324690,'关联删除'),(1109807,10,0,546291,1586675384,78670,'关联删除'),(1110527,10,0,546291,1586758820,78670,'关联删除'),(1111032,10,0,546291,1586861543,78670,'关联删除'),(1111033,10,0,546291,1586861557,78670,'关联删除'),(1111328,10,4,361099,1586898557,74929,'关联修改'),(1112424,9,0,547047,1587196280,213047,'关联删除'),(1113509,10,0,546291,1587342862,242978,'关联删除'),(1113511,10,0,546291,1587342953,242978,'关联删除'),(1113512,10,0,546291,1587342959,242978,'关联删除'),(1114594,8,0,455461,1587478112,253052,'关联删除'),(1114595,8,0,455461,1587478190,253052,'关联删除'),(1115168,10,0,546291,1587544989,319610,'关联删除'),(1115170,10,0,546291,1587545257,319610,'关联删除'),(1115865,10,0,546291,1587720285,319610,'关联删除'),(1115899,10,0,546291,1587730303,249906,'关联删除'),(1115900,10,0,546291,1587730431,249906,'关联删除'),(1115901,10,0,546291,1587731370,249906,'关联删除'),(1115903,10,0,546291,1587731945,249906,'关联删除'),(1115909,10,0,546291,1587732603,249906,'关联删除'),(1115916,10,0,546291,1587733064,249906,'关联删除'),(1115921,10,0,546291,1587733737,249906,'关联删除'),(1115922,10,0,546291,1587734052,249906,'关联删除'),(1115927,10,0,546291,1587734906,249906,'关联删除'),(1115928,10,0,546291,1587735546,249906,'关联删除'),(1115929,10,0,546291,1587735788,249906,'关联删除'),(1115930,10,0,546291,1587736103,249906,'关联删除'),(1115937,10,0,546291,1587736796,249906,'关联删除'),(1115943,10,0,546291,1587737034,249906,'关联删除'),(1115944,10,0,546291,1587737390,249906,'关联删除'),(1115946,10,0,546291,1587737632,249906,'关联删除'),(1115947,10,0,546291,1587737659,249906,'关联删除'),(1115948,10,0,546291,1587737915,249906,'关联删除'),(1115951,10,0,546291,1587739179,249906,'关联删除'),(1115974,10,0,546291,1587741305,249906,'关联删除'),(1116179,10,0,546291,1587794404,319610,'关联删除'),(1116246,10,0,546291,1587799515,318251,'关联删除'),(1116458,10,0,546291,1587869159,242978,'关联删除'),(1116459,10,0,546291,1587869172,242978,'关联删除'),(1116460,10,0,546291,1587869187,242978,'关联删除'),(1116750,2,1,1,1587935961,324690,'新肖像'),(1116872,10,0,546291,1587960684,78670,'关联删除'),(1117519,9,0,547047,1588085692,213047,'关联删除'),(1117841,10,0,546291,1588152585,241668,'关联删除'),(1117878,9,0,547047,1588170513,309121,'关联删除'),(1117941,8,0,455461,1588196699,22083,'关联删除'),(1118003,10,0,546291,1588234648,228224,'关联删除'),(1118167,10,0,546291,1588303245,78670,'关联删除'),(1118285,10,0,546291,1588320550,319610,'关联删除'),(1118679,10,0,546291,1588394035,78670,'关联删除'),(1118681,10,0,546291,1588394053,78670,'关联删除'),(1118689,10,0,546291,1588394276,78670,'关联删除'),(1119141,10,0,546291,1588464038,74929,'关联删除'),(1119755,10,0,546291,1588568178,78670,'关联删除'),(1120219,10,0,546291,1588653228,78670,'关联删除'),(1120718,5,0,525875,1588812472,324690,'关联删除'),(1120820,10,0,546291,1588843652,78670,'关联删除'),(1121000,9,0,547047,1588872590,213047,'关联删除'),(1121184,9,0,547047,1588951289,213047,'关联删除'),(1121185,9,0,547047,1588951289,213047,'关联删除'),(1121950,10,0,546291,1589100079,78670,'关联删除'),(1122044,10,0,546291,1589109232,78670,'关联删除'),(1122045,10,0,546291,1589109240,78670,'关联删除'),(1122046,10,0,546291,1589109250,78670,'关联删除'),(1122048,10,0,546291,1589109307,78670,'关联删除'),(1122049,10,0,546291,1589109316,78670,'关联删除'),(1123121,10,0,546291,1589384994,74929,'关联删除'),(1123122,10,0,546291,1589385079,74929,'关联删除'),(1123529,10,0,546291,1589525281,2331,'关联删除'),(1123568,10,0,546291,1589534621,78670,'关联删除'),(1123990,10,0,546291,1589644969,456600,'关联删除'),(1124353,9,0,547047,1589735923,241668,'关联删除'),(1125092,10,0,546291,1589997956,250298,'关联删除'),(1125129,10,0,546291,1590019129,74929,'关联删除'),(1125199,10,0,546291,1590041543,78670,'关联删除'),(1125593,7,20,555599,1590141592,159245,'关联修改'),(1125896,10,0,546291,1590203561,78670,'关联删除'),(1125897,10,0,546291,1590203571,78670,'关联删除'),(1126486,10,0,546291,1590307915,78670,'关联删除'),(1126509,5,0,525875,1590309929,101885,'关联删除'),(1126510,5,0,525875,1590309952,101885,'关联删除'),(1130254,10,0,546291,1591344334,180488,'关联删除'),(1130325,9,0,547047,1591369123,213047,'关联删除'),(1130545,10,0,546291,1591420792,78670,'关联删除'),(1130803,10,0,546291,1591456612,31114,'关联删除'),(1130859,5,0,525875,1591463350,290375,'关联删除'),(1131013,5,0,525875,1591541353,250298,'关联删除'),(1131516,9,0,547047,1591693139,118747,'关联删除'),(1131740,10,0,546291,1591787940,78670,'关联删除'),(1131981,10,0,558721,1591864418,319610,'关联删除'),(1131982,10,0,558721,1591864444,319610,'关联删除'),(1132075,9,14,26118,1591880728,259795,'关联修改'),(1132090,3,14,55400,1591883081,318251,''),(1132137,10,0,558721,1591892991,309121,'关联删除'),(1132878,5,0,525875,1592101170,318251,'关联删除'),(1132879,5,0,525875,1592101174,318251,'关联删除'),(1133261,10,0,558721,1592201016,78670,'关联删除'),(1133262,10,0,558721,1592201036,78670,'关联删除'),(1133279,10,0,558721,1592202554,78670,'关联删除'),(1133609,10,0,558721,1592307779,78670,'关联删除'),(1133610,10,0,558721,1592307792,78670,'关联删除'),(1133796,10,0,558721,1592363558,422132,'关联删除'),(1134105,10,0,558721,1592479403,78670,'关联删除'),(1134302,10,0,558721,1592569579,78670,'关联删除'),(1134879,10,0,558721,1592736161,10327,'关联删除'),(1135366,10,0,558721,1592880499,319610,'关联删除'),(1135466,10,0,558721,1592895537,319610,'关联删除'),(1135815,10,0,558721,1592994189,78670,'关联删除'),(1135820,10,0,558721,1592994989,78670,'关联删除'),(1136571,5,0,525875,1593176311,250298,'关联删除'),(1136572,5,0,525875,1593176343,250298,'关联删除'),(1138001,5,4,561892,1593603853,324690,'关联修改'),(1138150,10,0,558721,1593674687,36176,'关联删除'),(1138487,10,0,558721,1593794625,309121,'关联删除'),(1138754,10,0,558721,1593919478,14488,'关联删除'),(1138772,10,0,558721,1593921053,78670,'关联删除'),(1138773,10,0,558721,1593921060,78670,'关联删除'),(1138774,10,0,558721,1593921077,78670,'关联删除'),(1138775,10,0,558721,1593921093,78670,'关联删除'),(1138776,10,0,558721,1593921102,78670,'关联删除'),(1138777,10,0,558721,1593921115,78670,'关联删除'),(1138874,9,0,547047,1593941252,309121,'关联删除'),(1138902,10,0,558721,1593948428,78670,'关联删除'),(1138904,10,0,558721,1593948451,78670,'关联删除'),(1138910,10,0,558721,1593949138,78670,'关联删除'),(1139211,9,0,547047,1594066026,118747,'关联删除'),(1139393,3,1,3,1594118140,242978,'增加结婚信息。'),(1139483,10,0,558721,1594128279,14488,'关联删除'),(1140467,5,0,525875,1594437351,31114,'关联删除'),(1140468,5,0,525875,1594437357,31114,'关联删除'),(1140483,5,0,525875,1594440565,31114,'关联删除'),(1140490,10,0,558721,1594441146,319610,'关联删除'),(1140497,5,0,525875,1594442639,31114,'关联删除'),(1140498,5,0,525875,1594442750,31114,'关联删除'),(1140500,10,0,558721,1594442827,78670,'关联删除'),(1140504,5,0,525875,1594442908,31114,'关联删除'),(1140508,5,0,525875,1594442986,31114,'关联删除'),(1140511,5,0,525875,1594443060,31114,'关联删除'),(1140559,5,0,525875,1594445588,31114,'关联删除'),(1140595,10,0,558721,1594450055,78670,'关联删除'),(1140596,10,0,558721,1594450071,78670,'关联删除'),(1140597,10,0,558721,1594450082,78670,'关联删除'),(1140598,10,0,558721,1594450096,78670,'关联删除'),(1140974,8,0,455461,1594556821,73548,'关联删除'),(1141098,10,0,558721,1594603276,3350,'关联删除'),(1141182,10,0,558721,1594619790,78670,'关联删除'),(1141316,10,0,558721,1594651937,159245,'关联删除'),(1141880,10,0,558721,1594789577,78670,'关联删除'),(1142026,9,0,547047,1594831069,309121,'关联删除'),(1142074,10,0,558721,1594876131,10327,'关联删除'),(1142075,10,0,558721,1594876150,10327,'关联删除'),(1142091,10,0,558721,1594882919,8142,'关联删除'),(1142774,10,0,558721,1595057169,3350,'关联删除'),(1142797,15,18,564190,1595062875,2331,'与 ID:17435 合体'),(1142799,3,18,176177,1595063026,2331,'修饰语句'),(1142848,8,0,455461,1595070182,318251,'关联删除'),(1142850,8,0,455461,1595070204,318251,'关联删除'),(1142854,8,0,455461,1595070340,318251,'关联删除'),(1142860,8,0,455461,1595070417,318251,'关联删除'),(1142908,5,0,525875,1595082804,261227,'关联删除'),(1143362,10,0,558721,1595133112,78670,'关联删除'),(1143676,10,0,558721,1595177581,229195,'关联删除'),(1144144,10,0,558721,1595310038,78670,'关联删除'),(1144412,10,0,558721,1595351028,63167,'关联删除'),(1144430,10,0,558721,1595352341,63167,'关联删除'),(1144532,10,0,558721,1595399388,78670,'关联删除'),(1144534,10,0,558721,1595399409,78670,'关联删除'),(1144542,10,0,558721,1595401308,78670,'关联删除'),(1144543,10,0,558721,1595401332,78670,'关联删除'),(1144809,10,0,558721,1595483684,78670,'关联删除'),(1145228,9,0,547047,1595570193,318251,'关联删除'),(1145402,10,0,558721,1595595036,78670,'关联删除'),(1145404,10,0,558721,1595595062,78670,'关联删除'),(1147072,10,0,558721,1595871827,21804,'关联删除'),(1147492,10,0,558721,1595986590,309121,'关联删除'),(1147715,10,0,558721,1596054148,74929,'关联删除'),(1147937,8,0,455461,1596124877,318251,'关联删除'),(1148139,10,0,558721,1596133485,229195,'关联删除'),(1148351,9,0,547047,1596219807,31114,'关联删除'),(1148625,10,0,558721,1596288993,78670,'关联删除'),(1148627,10,0,558721,1596289102,78670,'关联删除'),(1148635,10,0,558721,1596290100,78670,'关联删除'),(1148636,10,0,558721,1596290117,78670,'关联删除'),(1148829,10,0,558721,1596364796,78670,'关联删除'),(1148830,10,0,558721,1596364821,78670,'关联删除'),(1148831,10,0,558721,1596364835,78670,'关联删除'),(1148832,10,0,558721,1596364850,78670,'关联删除'),(1148841,10,0,558721,1596368171,78670,'关联删除'),(1148842,10,0,558721,1596368184,78670,'关联删除'),(1148865,10,0,558721,1596375480,78670,'关联删除'),(1148868,10,0,558721,1596375522,78670,'关联删除'),(1148872,10,0,558721,1596376376,78670,'关联删除'),(1148874,10,0,558721,1596376403,78670,'关联删除'),(1148876,10,0,558721,1596376455,78670,'关联删除'),(1149118,10,0,558721,1596435130,78670,'关联删除'),(1149120,10,0,567357,1596435154,78670,'关联删除'),(1149135,10,0,567357,1596436871,78670,'关联删除'),(1149150,10,0,567357,1596438064,78670,'关联删除'),(1149153,10,0,567357,1596438096,78670,'关联删除'),(1149162,10,0,567357,1596439573,78670,'关联删除'),(1149163,10,0,567357,1596439587,78670,'关联删除'),(1149164,10,0,567357,1596439875,78670,'关联删除'),(1149171,10,0,567357,1596442999,78670,'关联删除'),(1149172,10,0,567357,1596443011,78670,'关联删除'),(1149482,5,0,525875,1596589177,261227,'关联删除'),(1150262,10,0,567357,1596657537,242978,'关联删除'),(1150310,9,0,547047,1596684626,411072,'关联删除'),(1150660,10,0,567357,1596779502,250298,'关联删除'),(1151251,10,0,567357,1596886801,78670,'关联删除'),(1152272,10,0,567357,1597058043,250298,'关联删除'),(1153582,10,0,567357,1597161281,2331,'关联删除'),(1153630,10,0,567357,1597166257,250298,'关联删除'),(1153862,3,1,3,1597241465,241668,'bgm_wikihelper脚本替换条目'),(1153863,3,1,3,1597241717,241668,'bgm_wikihelper脚本替换条目'),(1153865,3,1,3,1597241859,241668,''),(1154262,3,1,3,1597308871,2331,'条目名|修饰语句'),(1154310,10,0,567357,1597320656,78670,'关联删除'),(1158142,10,0,567357,1597395733,319610,'关联删除'),(1158143,10,0,567357,1597395966,319610,'关联删除'),(1158713,10,0,567357,1597418195,422132,'关联删除'),(1159113,10,0,567357,1597514519,63167,'关联删除'),(1159114,10,0,567357,1597514601,63167,'关联删除'),(1159115,10,0,567357,1597514610,63167,'关联删除'),(1159116,10,0,567357,1597514665,63167,'关联删除'),(1159117,10,0,567357,1597514739,63167,'关联删除'),(1159118,10,0,567357,1597514797,63167,'关联删除'),(1159353,8,0,455461,1597565722,407835,'关联删除'),(1159463,5,0,525875,1597583057,138931,'关联删除'),(1159518,10,0,567357,1597597457,250298,'关联删除'),(1159721,10,0,567357,1597669048,78670,'关联删除'),(1159723,10,0,567357,1597669074,78670,'关联删除'),(1160288,10,0,567357,1597864096,10327,'关联删除'),(1162005,10,0,567357,1598173060,78670,'关联删除'),(1162392,5,0,525875,1598271077,261227,'关联删除'),(1162393,5,0,525875,1598271078,261227,'关联删除'),(1162453,5,0,525875,1598271566,261227,'关联删除'),(1163689,10,0,567357,1598363396,78670,'关联删除'),(1163690,10,0,567357,1598363418,78670,'关联删除'),(1163691,10,0,567357,1598363431,78670,'关联删除'),(1163707,10,0,567357,1598369649,242978,'关联删除'),(1163894,10,0,567357,1598459536,10327,'关联删除'),(1163895,10,0,567357,1598459568,10327,'关联删除'),(1164858,5,0,525875,1598698112,409467,'关联删除'),(1165501,9,0,547047,1598816046,397093,'关联删除'),(1166110,10,0,567357,1599055307,74929,'关联删除'),(1166114,10,0,567357,1599055442,74929,'关联删除'),(1166321,5,0,525875,1599138570,233559,'关联删除'),(1166370,10,0,567357,1599166856,10327,'关联删除'),(1183898,5,0,525875,1599811013,250298,'关联删除'),(1184011,10,0,567357,1599857796,74929,'关联删除'),(1184305,10,0,567357,1599906703,78670,'关联删除'),(1184306,10,0,567357,1599906720,78670,'关联删除'),(1185752,8,0,455461,1600037934,261227,'关联删除'),(1186764,8,0,455461,1600053850,318251,'关联删除'),(1186766,8,0,455461,1600053862,318251,'关联删除'),(1186768,8,0,455461,1600053872,318251,'关联删除'),(1186793,10,0,567357,1600062556,78670,'关联删除'),(1187019,2,1,1,1600152056,422132,'bgm_wikihelper脚本替换条目'),(1187020,4,1,201393,1600152058,422132,'关联修改'),(1187022,2,1,1,1600152367,422132,'恢复版本'),(1187023,2,1,1,1600152396,422132,'新肖像'),(1187163,8,0,455461,1600239719,407835,'关联删除'),(1187425,8,0,455461,1600259407,261227,'关联删除'),(1187852,8,0,455461,1600272955,318251,'关联删除'),(1188121,10,0,567357,1600355527,15775,'关联删除'),(1189721,9,0,547047,1600860455,309121,'关联删除'),(1189802,10,0,567357,1600865162,78670,'关联删除'),(1189803,10,0,567357,1600865176,78670,'关联删除'),(1189804,10,0,567357,1600865191,78670,'关联删除'),(1190068,10,0,567357,1600953307,78670,'关联删除'),(1190069,10,0,567357,1600953328,78670,'关联删除'),(1191203,5,0,525875,1601304273,407835,'关联删除'),(1191377,8,0,455461,1601355876,156971,'关联删除'),(1195061,10,0,567357,1602215065,370409,'关联删除'),(1195267,10,0,567357,1602264862,422132,'关联删除'),(1195998,8,0,455461,1602443174,254224,'关联删除'),(1196175,10,0,567357,1602561643,482674,'关联删除'),(1196193,10,0,567357,1602562758,482674,'关联删除'),(1196265,18,6,591662,1602582726,0,'章节初始化'),(1196435,5,0,525875,1602693086,250298,'关联删除'),(1196622,10,0,567357,1602832970,156971,'关联删除'),(1196758,10,0,567357,1602864045,482674,'关联删除'),(1196827,10,0,567357,1602903971,370409,'关联删除'),(1196836,10,0,567357,1602904780,370409,'关联删除'),(1196856,10,0,567357,1602910278,370409,'关联删除'),(1197088,10,0,567357,1602936961,370409,'关联删除'),(1197657,10,0,567357,1603087631,142735,'关联删除'),(1197660,10,0,567357,1603087690,142735,'关联删除'),(1197674,10,0,567357,1603088981,370409,'关联删除'),(1197892,10,0,567357,1603189126,370409,'关联删除'),(1198703,2,1,1,1603385600,261227,'bgm_wikihelper脚本替换条目'),(1198707,2,1,1,1603386845,261227,'手贱弄错了条目，已报错，等管理员恢复版本'),(1198747,2,1,1,1603420176,422132,'恢复版本'),(1199409,10,0,567357,1603537553,225377,'关联删除'),(1199410,10,0,567357,1603537576,225377,'关联删除'),(1199411,10,0,567357,1603537582,225377,'关联删除'),(1199412,10,0,567357,1603537589,225377,'关联删除'),(1199413,10,0,567357,1603537596,225377,'关联删除'),(1199647,10,0,567357,1603604814,370409,'关联删除'),(1200873,10,0,567357,1603980605,242978,'关联删除'),(1200875,10,0,567357,1603980630,242978,'关联删除'),(1200876,10,0,567357,1603980636,242978,'关联删除'),(1200877,10,0,567357,1603980641,242978,'关联删除'),(1200878,10,0,567357,1603980644,242978,'关联删除'),(1200879,10,0,567357,1603980650,242978,'关联删除'),(1200992,10,0,593811,1604040905,370409,'关联删除'),(1202002,10,0,593811,1604241486,58023,'关联删除'),(1202591,10,0,593811,1604305719,142735,'关联删除'),(1202592,10,0,593811,1604305725,142735,'关联删除'),(1202605,10,0,593811,1604306619,142735,'关联删除'),(1203413,5,0,525875,1604405213,261227,'关联删除'),(1203414,5,0,525875,1604405219,261227,'关联删除'),(1203416,5,0,525875,1604405231,261227,'关联删除'),(1203417,5,0,525875,1604405238,261227,'关联删除'),(1203418,5,0,525875,1604405243,261227,'关联删除'),(1203419,5,0,525875,1604405247,261227,'关联删除'),(1203420,5,0,525875,1604405252,261227,'关联删除'),(1203421,5,0,525875,1604405258,261227,'关联删除'),(1203422,5,0,525875,1604405264,261227,'关联删除'),(1204568,10,0,593811,1604479129,281833,'关联删除'),(1204694,10,0,593811,1604493261,281833,'关联删除'),(1205226,10,0,593811,1604573598,482674,'关联删除'),(1205227,10,0,593811,1604573607,482674,'关联删除'),(1205228,10,0,593811,1604573632,482674,'关联删除'),(1206553,5,0,525875,1604754399,250298,'关联删除'),(1206706,5,0,525875,1604791424,31114,'关联删除'),(1206709,5,0,525875,1604792804,31114,'关联删除'),(1206717,5,0,525875,1604793203,31114,'关联删除'),(1207014,17,13,33882,1604839172,482674,'条目关联修改'),(1207192,10,0,593811,1604857012,250298,'关联删除'),(1207193,10,0,593811,1604857020,250298,'关联删除'),(1207393,10,0,593811,1604919412,21804,'关联删除'),(1207396,10,0,593811,1604919459,21804,'关联删除'),(1207448,10,0,593811,1604923724,464691,'关联删除'),(1207450,10,0,593811,1604923871,464691,'关联删除'),(1207451,10,0,593811,1604923956,58023,'关联删除'),(1207454,10,0,593811,1604924023,58023,'关联删除'),(1207563,10,0,593811,1604937363,222844,'关联删除'),(1207848,10,0,593811,1605001389,250298,'关联删除'),(1208033,10,0,593811,1605024959,461250,'关联删除'),(1209259,10,0,593811,1605234368,318251,'关联删除'),(1209285,5,0,525875,1605236299,461250,'关联删除'),(1209286,5,0,525875,1605236318,461250,'关联删除'),(1209287,5,0,525875,1605236327,461250,'关联删除'),(1209288,5,0,525875,1605236350,461250,'关联删除'),(1209655,8,0,455461,1605284999,425984,'关联删除'),(1210303,8,0,455461,1605412144,318251,'关联删除'),(1211015,10,0,593811,1605531857,58023,'关联删除'),(1211221,10,0,593811,1605600603,2331,'关联删除'),(1211287,5,0,525875,1605616481,261227,'关联删除'),(1211309,5,0,525875,1605620646,429439,'关联删除'),(1211310,5,0,525875,1605620665,429439,'关联删除'),(1211311,5,0,525875,1605620685,429439,'关联删除'),(1211312,5,0,525875,1605620699,429439,'关联删除'),(1211313,5,0,525875,1605620710,429439,'关联删除'),(1211314,5,0,525875,1605620727,429439,'关联删除'),(1211315,5,0,525875,1605620749,429439,'关联删除'),(1211316,5,0,525875,1605620767,429439,'关联删除'),(1211317,5,0,525875,1605620780,429439,'关联删除'),(1211417,10,0,593811,1605638051,321997,'关联删除'),(1212134,5,0,599342,1605784796,429439,'关联删除'),(1212135,5,0,599342,1605784800,429439,'关联删除'),(1212936,10,0,593811,1605885296,156971,'关联删除'),(1213319,10,0,593811,1605917252,464691,'关联删除'),(1213344,5,0,599342,1605924311,461250,'关联删除'),(1214763,5,0,599342,1606142339,318251,'关联删除'),(1214766,5,0,599342,1606142358,318251,'关联删除'),(1214768,5,0,599342,1606142374,318251,'关联删除'),(1215351,10,0,593811,1606193578,512537,'关联删除'),(1215693,5,0,599342,1606240423,249165,'关联删除'),(1215795,10,0,593811,1606275105,156971,'关联删除'),(1215896,9,0,547047,1606289746,321997,'关联删除'),(1216127,10,0,593811,1606314589,142735,'关联删除'),(1216336,5,0,599342,1606377047,2331,'关联删除'),(1216353,10,0,593811,1606378076,2331,'关联删除'),(1216364,10,0,593811,1606378858,319610,'关联删除'),(1216373,10,0,593811,1606378919,319610,'关联删除'),(1216376,10,0,593811,1606378945,319610,'关联删除'),(1216379,10,0,593811,1606379046,319610,'关联删除'),(1216382,10,0,593811,1606379060,319610,'关联删除'),(1216383,10,0,593811,1606379075,319610,'关联删除'),(1216384,10,0,593811,1606379090,319610,'关联删除'),(1216385,10,0,593811,1606379107,319610,'关联删除'),(1216386,10,0,593811,1606379119,319610,'关联删除'),(1216387,10,0,593811,1606379132,319610,'关联删除'),(1216388,10,0,593811,1606379155,319610,'关联删除'),(1216389,10,0,593811,1606379185,319610,'关联删除'),(1216607,10,0,593811,1606399844,58023,'关联删除'),(1216608,10,0,593811,1606399976,58023,'关联删除'),(1216677,5,0,599342,1606407826,461250,'关联删除'),(1216679,10,0,593811,1606407843,461250,'关联删除'),(1217828,9,0,547047,1606551045,407835,'关联删除'),(1218721,10,0,593811,1606641932,119200,'关联删除'),(1219154,10,0,593811,1606710235,502811,'关联删除'),(1219155,10,0,593811,1606710316,502811,'关联删除'),(1219157,10,0,593811,1606710895,502811,'关联删除'),(1219393,10,0,593811,1606755450,321997,'关联删除'),(1219394,10,0,593811,1606755453,321997,'关联删除'),(1219777,10,0,593811,1606835996,502811,'关联删除'),(1219778,10,0,593811,1606836057,502811,'关联删除'),(1219779,10,0,593811,1606836068,502811,'关联删除'),(1219782,10,0,593811,1606836100,502811,'关联删除'),(1219890,10,0,593811,1606883684,370409,'关联删除'),(1219912,10,0,593811,1606885888,370409,'关联删除'),(1220424,10,0,593811,1606950399,461250,'关联删除'),(1221162,10,0,593811,1607086255,370409,'关联删除'),(1221487,10,0,593811,1607108709,422132,'关联删除'),(1221599,10,0,593811,1607129560,461250,'关联删除'),(1223311,10,0,593811,1607373924,321997,'关联删除'),(1223562,10,0,593811,1607431354,425984,'关联删除'),(1223572,10,0,593811,1607431758,482674,'关联删除'),(1223785,10,0,593811,1607480895,370409,'关联删除'),(1223858,5,0,599342,1607505131,2331,'关联删除'),(1223984,9,0,547047,1607521956,429439,'关联删除'),(1224085,10,0,593811,1607528028,461250,'关联删除'),(1224938,10,0,593811,1607693385,370409,'关联删除'),(1225509,10,0,593811,1607783080,425984,'关联删除'),(1226012,5,0,599342,1607865602,407835,'关联删除'),(1226172,5,0,599342,1607876741,425984,'关联删除'),(1226211,8,0,455461,1607879612,540532,'关联删除'),(1226212,8,0,455461,1607879615,540532,'关联删除'),(1226464,8,0,455461,1607909918,299900,'关联删除'),(1226465,9,0,547047,1607909938,299900,'关联删除'),(1226524,5,0,599342,1607921446,142735,'关联删除'),(1226548,5,0,599342,1607926824,318251,'关联删除'),(1226823,10,0,593811,1607955426,242978,'关联删除'),(1227032,10,0,593811,1608011527,540532,'关联删除'),(1227043,10,0,593811,1608014319,331630,'关联删除'),(1228175,5,0,599342,1608195861,464691,'关联删除'),(1228177,5,0,599342,1608195995,464691,'关联删除'),(1228185,5,0,599342,1608196133,464691,'关联删除'),(1228191,5,0,599342,1608196242,464691,'关联删除'),(1228220,10,0,593811,1608200729,464691,'关联删除'),(1228223,5,0,599342,1608200772,464691,'关联删除'),(1228252,5,0,599342,1608202532,464691,'关联删除'),(1230377,10,0,593811,1608437076,321997,'关联删除'),(1230466,5,0,599342,1608446423,31114,'关联删除'),(1230526,5,0,599342,1608451847,31114,'关联删除'),(1230527,5,0,599342,1608452316,31114,'关联删除'),(1230553,5,0,599342,1608453893,31114,'关联删除'),(1230557,5,0,599342,1608454013,31114,'关联删除'),(1230627,5,0,599342,1608457740,31114,'关联删除'),(1230962,10,0,593811,1608481947,119200,'关联删除'),(1231193,10,0,608933,1608529010,464691,'关联删除'),(1231713,5,0,599342,1608617447,409467,'关联删除'),(1231901,10,0,608933,1608651096,321997,'关联删除'),(1231967,5,0,599342,1608672868,425984,'关联删除'),(1232045,10,0,608933,1608706232,106231,'关联删除'),(1232046,10,0,608933,1608706742,106231,'关联删除'),(1232062,10,0,608933,1608709370,156971,'关联删除'),(1232148,10,0,608933,1608720325,425984,'关联删除'),(1232328,10,0,608933,1608756497,242978,'关联删除'),(1232437,8,0,455461,1608795150,407835,'关联删除'),(1232797,10,0,608933,1608826178,425984,'关联删除'),(1233416,8,0,455461,1608888518,31114,'关联删除'),(1234271,10,0,608933,1609038950,461250,'关联删除'),(1234274,10,0,608933,1609039103,502811,'关联删除'),(1234400,5,0,599342,1609059004,250298,'关联删除'),(1235365,5,0,599342,1609176879,464691,'关联删除'),(1235750,9,0,547047,1609251266,119200,'关联删除'),(1235753,9,0,547047,1609251392,119200,'关联删除'),(1235981,10,0,608933,1609294228,464691,'关联删除'),(1236211,9,0,547047,1609318838,14356,'关联删除'),(1236899,10,0,608933,1609432377,456600,'关联删除'),(1237415,10,0,608933,1609526013,464691,'关联删除'),(1237481,10,0,608933,1609557268,321997,'关联删除'),(1237482,10,0,608933,1609557307,321997,'关联删除'),(1237546,10,0,608933,1609571506,2331,'关联删除'),(1239868,10,0,608933,1610056300,249165,'关联删除'),(1240341,10,0,608933,1610158025,370409,'关联删除'),(1242193,10,0,608933,1610523330,2331,'关联删除'),(1242257,5,0,599342,1610532923,249165,'关联删除'),(1243392,5,0,599342,1610720078,429439,'关联删除'),(1243400,10,0,608933,1610720422,429439,'关联删除'),(1244083,5,0,599342,1610816162,422132,'关联删除'),(1244584,10,0,608933,1610924099,321997,'关联删除'),(1244711,5,0,599342,1610957544,464691,'关联删除'),(1245111,10,0,608933,1611040829,482674,'关联删除'),(1246143,10,0,608933,1611221139,319610,'关联删除'),(1246596,9,0,547047,1611299471,482674,'关联删除'),(1247039,5,13,114690,1611344541,418314,'关联修改'),(1247674,5,0,599342,1611481393,38545,'关联删除'),(1248399,17,1,617118,1611594418,464691,'条目关联修改'),(1248477,10,0,608933,1611631599,458638,'关联删除'),(1248499,9,0,547047,1611632550,46907,'关联删除'),(1248872,10,0,608933,1611714691,48518,'关联删除'),(1248873,10,0,608933,1611714713,48518,'关联删除'),(1248996,10,0,608933,1611726478,48518,'关联删除'),(1249366,10,0,608933,1611782839,321997,'关联删除'),(1249382,10,0,608933,1611786819,461250,'关联删除'),(1249385,10,0,608933,1611787919,461250,'关联删除'),(1249386,10,0,608933,1611787934,461250,'关联删除'),(1249398,9,0,547047,1611795174,8854,'关联删除'),(1249643,10,0,608933,1611840882,2331,'关联删除'),(1249893,10,0,608933,1611888131,321997,'关联删除'),(1249894,10,0,608933,1611888146,321997,'关联删除'),(1250548,10,0,608933,1611972213,31114,'关联删除'),(1250563,10,0,608933,1611979880,318251,'关联删除'),(1250702,10,0,608933,1612014670,464691,'关联删除'),(1250734,10,0,608933,1612015963,156971,'关联删除'),(1250784,10,0,608933,1612018869,156971,'关联删除'),(1250954,10,0,608933,1612024963,156971,'关联删除'),(1251423,5,0,599342,1612100060,464691,'关联删除'),(1251433,5,0,599342,1612100728,464691,'关联删除'),(1251603,10,0,608933,1612129558,461250,'关联删除'),(1251610,10,0,608933,1612130252,461250,'关联删除'),(1251611,10,0,608933,1612130284,461250,'关联删除'),(1251612,10,0,608933,1612130294,461250,'关联删除'),(1251635,10,0,608933,1612135949,461250,'关联删除'),(1252242,10,0,608933,1612240465,8142,'关联删除'),(1252855,10,0,608933,1612339830,34584,'关联删除'),(1253162,10,0,608933,1612409271,207398,'关联删除'),(1253323,10,0,608933,1612426433,482674,'关联删除'),(1253373,10,0,608933,1612440191,461250,'关联删除'),(1253417,10,0,608933,1612443682,429439,'关联删除'),(1253418,10,0,608933,1612443722,429439,'关联删除'),(1253722,10,0,608933,1612525275,426720,'关联删除'),(1253758,10,0,608933,1612531671,31114,'关联删除'),(1254026,3,1,3,1612593419,242978,'更新资料。'),(1254242,10,0,608933,1612619101,318251,'关联删除'),(1255768,5,0,599342,1612891344,515087,'关联删除'),(1255794,5,0,599342,1612894345,515087,'关联删除'),(1255879,10,0,608933,1612934720,482674,'关联删除'),(1255881,10,0,608933,1612934806,482674,'关联删除'),(1255882,10,0,608933,1612935050,482674,'关联删除'),(1256021,10,0,608933,1612949750,455074,'关联删除'),(1256892,10,0,608933,1613111856,48518,'关联删除'),(1259640,10,0,608933,1613641083,458638,'关联删除'),(1259968,10,0,608933,1613724460,321997,'关联删除'),(1260286,10,0,608933,1613767361,461250,'关联删除'),(1260365,10,0,608933,1613784025,156971,'关联删除'),(1260366,10,0,608933,1613784035,156971,'关联删除'),(1260378,9,0,547047,1613787693,407835,'关联删除'),(1260410,10,0,608933,1613801174,432108,'关联删除'),(1260411,10,0,608933,1613801259,432108,'关联删除'),(1260412,10,0,608933,1613801393,432108,'关联删除'),(1260413,10,0,608933,1613801398,432108,'关联删除'),(1260434,5,0,599342,1613805295,407835,'关联删除'),(1260631,4,0,623296,1613830350,281833,'关联删除'),(1260965,10,0,608933,1613908083,281833,'关联删除'),(1261115,7,0,623522,1613920151,250298,'关联删除'),(1261116,8,0,455461,1613920224,250298,'关联删除'),(1261117,8,0,455461,1613920242,250298,'关联删除'),(1261282,9,0,547047,1613954479,458638,'关联删除'),(1261916,4,0,623296,1614061761,429439,'关联删除'),(1262134,10,0,608933,1614080542,167817,'关联删除'),(1262135,10,0,608933,1614080577,167817,'关联删除'),(1263192,10,0,608933,1614272400,461250,'关联删除'),(1263193,10,0,608933,1614272488,461250,'关联删除'),(1263200,10,0,608933,1614272906,461250,'关联删除'),(1263204,10,0,624463,1614274346,461250,'关联删除'),(1263921,7,0,623522,1614429798,281833,'关联删除'),(1264939,4,0,623296,1614615821,318251,'关联删除'),(1264940,7,0,623522,1614615827,318251,'关联删除'),(1264956,10,0,624463,1614618596,321997,'关联删除'),(1265758,7,0,623522,1614670939,281833,'关联删除'),(1266372,10,0,624463,1614790709,63167,'关联删除'),(1266903,10,0,624463,1614913945,225377,'关联删除'),(1267007,10,0,624463,1614931768,456600,'关联删除'),(1267008,10,0,624463,1614931777,456600,'关联删除'),(1267178,10,0,624463,1614958529,461250,'关联删除'),(1267217,10,0,624463,1614967635,482674,'关联删除'),(1267771,10,0,624463,1615066106,464691,'关联删除'),(1268608,7,0,623522,1615195533,156971,'关联删除'),(1269258,7,0,623522,1615283865,422132,'关联删除'),(1269299,5,0,599342,1615286079,482674,'关联删除'),(1269300,5,0,599342,1615286086,482674,'关联删除'),(1269322,7,0,623522,1615291915,409467,'关联删除'),(1269410,10,0,624463,1615312494,165643,'关联删除'),(1269473,10,0,624463,1615332249,461250,'关联删除'),(1269825,7,0,623522,1615385075,8854,'关联删除'),(1269996,8,0,455461,1615433091,135849,'关联删除'),(1270146,7,0,623522,1615459852,409467,'关联删除'),(1271680,10,0,624463,1615652506,461250,'关联删除'),(1272062,5,0,599342,1615729715,429439,'关联删除'),(1272203,10,0,624463,1615761902,2331,'关联删除'),(1272206,10,0,624463,1615762020,2331,'关联删除'),(1272463,5,0,599342,1615809632,2331,'关联删除'),(1272744,7,0,623522,1615868183,8854,'关联删除'),(1272867,10,0,624463,1615898819,422132,'关联删除'),(1273229,10,0,624463,1615993089,181882,'关联删除'),(1273397,8,0,455461,1616035694,422132,'关联删除'),(1274068,9,0,547047,1616125224,2331,'关联删除'),(1275045,10,0,624463,1616278668,261227,'关联删除'),(1275183,10,0,624463,1616302912,63167,'关联删除'),(1275661,10,0,624463,1616397860,425984,'关联删除'),(1275742,9,0,547047,1616414069,382761,'关联删除'),(1275870,10,0,624463,1616447896,319610,'关联删除'),(1276253,10,0,624463,1616566232,131855,'关联删除'),(1276610,8,0,455461,1616657854,22083,'关联删除'),(1277289,5,0,599342,1616762735,422132,'关联删除'),(1277924,7,0,623522,1616846284,42041,'关联删除'),(1277925,7,0,623522,1616846292,42041,'关联删除'),(1277926,7,0,623522,1616846300,42041,'关联删除'),(1277927,7,0,623522,1616846308,42041,'关联删除'),(1277928,7,0,623522,1616846314,42041,'关联删除'),(1277929,7,0,623522,1616846323,42041,'关联删除'),(1279317,8,0,455461,1617073461,407835,'关联删除'),(1280037,10,0,624463,1617154811,318251,'关联删除'),(1280155,7,0,623522,1617188323,318251,'关联删除'),(1281152,10,0,624463,1617332883,482674,'关联删除'),(1281241,5,0,599342,1617359575,432108,'关联删除'),(1281261,10,0,624463,1617362951,432108,'关联删除'),(1281550,7,0,623522,1617401881,156971,'关联删除'),(1281658,9,0,547047,1617423488,31114,'关联删除'),(1281671,5,0,599342,1617425574,31114,'关联删除'),(1282729,10,0,624463,1617583594,429439,'关联删除'),(1282777,10,0,624463,1617588297,429439,'关联删除'),(1284179,7,0,623522,1617831768,458638,'关联删除'),(1285461,10,0,624463,1618042812,422132,'关联删除'),(1285592,10,0,624463,1618059767,321997,'关联删除'),(1286790,10,0,624463,1618245859,461250,'关联删除'),(1286791,10,0,624463,1618245906,461250,'关联删除'),(1287815,7,0,623522,1618450158,156971,'关联删除'),(1288020,8,0,455461,1618474864,318251,'关联删除'),(1288348,10,0,624463,1618530299,2331,'关联删除'),(1288349,10,0,624463,1618530303,2331,'关联删除'),(1288350,10,0,624463,1618530335,2331,'关联删除'),(1288892,10,0,624463,1618625954,429439,'关联删除'),(1289139,5,0,599342,1618651776,77500,'关联删除'),(1290230,7,0,623522,1618801588,75028,'关联删除'),(1291267,10,0,624463,1619013155,74929,'关联删除'),(1291435,10,0,624463,1619043866,2331,'关联删除'),(1291787,7,0,623522,1619097324,409467,'关联删除'),(1292582,4,0,623296,1619259024,515087,'关联删除'),(1292676,10,0,624463,1619271217,461250,'关联删除'),(1293071,10,0,624463,1619331624,228289,'关联删除'),(1293124,10,0,624463,1619342561,413706,'关联删除'),(1293142,10,0,624463,1619345322,413706,'关联删除'),(1293206,10,0,624463,1619359189,228483,'关联删除'),(1293270,10,0,624463,1619369822,425984,'关联删除'),(1293317,10,0,624463,1619378796,425984,'关联删除'),(1293321,10,0,624463,1619379122,425984,'关联删除'),(1293466,10,0,624463,1619431968,413706,'关联删除'),(1294253,10,0,624463,1619605763,488858,'关联删除'),(1294702,10,0,624463,1619678281,407835,'关联删除'),(1294723,7,0,623522,1619681262,407835,'关联删除'),(1294724,4,0,623296,1619681267,407835,'关联删除'),(1294897,10,0,624463,1619707620,429439,'关联删除'),(1295027,4,0,623296,1619746522,2331,'关联删除'),(1295374,10,0,624463,1619833528,407835,'关联删除'),(1296739,7,0,623522,1620038540,207318,'关联删除'),(1297209,10,0,624463,1620113887,413706,'关联删除'),(1297470,4,0,623296,1620144754,156971,'关联删除'),(1297471,4,0,623296,1620144767,156971,'关联删除'),(1297589,10,0,624463,1620185314,362311,'关联删除'),(1297734,10,0,624463,1620203539,78670,'关联删除'),(1297745,10,0,624463,1620206351,78670,'关联删除'),(1297975,7,0,623522,1620262648,181375,'关联删除'),(1297992,7,0,623522,1620263224,181375,'关联删除'),(1298254,10,0,624463,1620310098,2331,'关联删除'),(1298258,10,0,624463,1620310819,2331,'关联删除'),(1298261,10,0,624463,1620310858,2331,'关联删除'),(1298339,5,0,599342,1620335102,49574,'关联删除'),(1298694,5,0,599342,1620402189,461250,'关联删除'),(1299157,10,0,624463,1620501840,8142,'关联删除'),(1299180,7,0,623522,1620522331,318251,'关联删除'),(1299332,10,0,624463,1620542555,482674,'关联删除'),(1299559,10,0,624463,1620564088,318251,'关联删除'),(1299641,8,0,455461,1620569616,22083,'关联删除'),(1299750,10,0,624463,1620596173,301945,'关联删除'),(1300039,10,0,624463,1620630980,482674,'关联删除'),(1300273,10,0,624463,1620642918,464691,'关联删除'),(1300483,10,0,624463,1620663810,294134,'关联删除'),(1300933,9,0,547047,1620785059,2331,'关联删除'),(1301033,10,0,624463,1620793419,65418,'关联删除'),(1301202,10,0,624463,1620822410,281833,'关联删除'),(1301348,8,0,455461,1620834011,318251,'关联删除'),(1301456,9,0,547047,1620875683,482674,'关联删除'),(1301728,4,0,623296,1620948405,461250,'关联删除'),(1301959,10,0,624463,1620976774,429439,'关联删除'),(1302336,10,0,624463,1621065455,506561,'关联删除'),(1302342,10,0,624463,1621069013,464691,'关联删除'),(1302592,5,0,599342,1621094852,464691,'关联删除'),(1303205,7,0,623522,1621183229,281833,'关联删除'),(1303215,7,0,623522,1621185873,281833,'关联删除'),(1303243,10,0,624463,1621193300,464691,'关联删除'),(1303245,4,0,623296,1621193877,464691,'关联删除'),(1303249,4,0,623296,1621194090,464691,'关联删除'),(1303255,4,0,623296,1621194392,464691,'关联删除'),(1303267,5,0,599342,1621195191,464691,'关联删除'),(1303778,10,0,624463,1621269405,229195,'关联删除'),(1303790,5,0,599342,1621274684,250298,'关联删除'),(1303822,7,0,623522,1621304050,429439,'关联删除'),(1303910,5,0,599342,1621314763,482674,'关联删除'),(1303911,5,0,599342,1621314774,482674,'关联删除'),(1303922,5,0,599342,1621315068,482674,'关联删除'),(1303926,4,0,623296,1621315128,482674,'关联删除'),(1303931,7,0,623522,1621315263,409467,'关联删除'),(1304093,10,0,624463,1621346813,413706,'关联删除'),(1304131,10,0,624463,1621351182,413706,'关联删除'),(1304132,10,0,624463,1621351186,413706,'关联删除'),(1304254,10,0,624463,1621370332,425984,'关联删除'),(1304320,10,0,624463,1621383988,156971,'关联删除'),(1305202,9,0,547047,1621524410,429439,'关联删除'),(1305647,10,0,646977,1621592868,222844,'关联删除'),(1306381,10,0,646977,1621683966,301945,'关联删除'),(1306642,4,0,623296,1621741182,318251,'关联删除'),(1307592,10,0,646977,1621942603,464691,'关联删除'),(1307795,10,0,646977,1621987664,366797,'关联删除'),(1307813,10,0,646977,1621989362,119200,'关联删除'),(1308019,8,0,455461,1622022402,318251,'关联删除'),(1308182,10,0,646977,1622055901,228224,'关联删除'),(1308227,4,0,623296,1622071892,461250,'关联删除'),(1308228,7,0,623522,1622071895,461250,'关联删除'),(1308404,7,0,623522,1622111928,482674,'关联删除'),(1308904,9,0,547047,1622215380,281833,'关联删除'),(1308929,5,0,599342,1622219899,277398,'关联删除'),(1309794,7,0,623522,1622374812,407835,'关联删除'),(1309797,7,0,623522,1622375287,407835,'关联删除'),(1310579,10,0,646977,1622547923,413706,'关联删除'),(1310877,10,0,646977,1622640112,407835,'关联删除'),(1311267,4,0,623296,1622746629,461250,'关联删除'),(1311268,7,0,623522,1622746633,461250,'关联删除'),(1311271,4,0,623296,1622746769,461250,'关联删除'),(1311455,5,0,599342,1622786319,422132,'关联删除'),(1312042,7,0,623522,1622899288,281833,'关联删除'),(1312044,7,0,623522,1622899346,281833,'关联删除'),(1312585,7,0,623522,1622984149,409467,'关联删除'),(1313303,7,0,623522,1623153153,409467,'关联删除'),(1313332,7,0,623522,1623157892,407835,'关联删除'),(1313361,7,0,623522,1623161014,409467,'关联删除'),(1313611,7,0,623522,1623250158,318251,'关联删除'),(1313895,5,0,599342,1623318663,407835,'关联删除'),(1314382,5,0,599342,1623442530,425984,'关联删除'),(1314450,10,0,646977,1623474848,482674,'关联删除'),(1314451,10,0,646977,1623474867,482674,'关联删除'),(1314953,10,0,646977,1623594968,413706,'关联删除'),(1315023,10,0,646977,1623599985,413706,'关联删除'),(1315036,10,0,646977,1623600938,413706,'关联删除'),(1315447,10,0,646977,1623674261,413706,'关联删除'),(1315828,4,0,623296,1623744959,409467,'关联删除'),(1315881,10,0,646977,1623757475,42041,'关联删除'),(1316414,4,0,623296,1623871577,409467,'关联删除'),(1317563,7,0,623522,1624073530,409467,'关联删除'),(1317953,10,0,646977,1624110018,2331,'关联删除'),(1318272,7,0,623522,1624160099,409467,'关联删除'),(1318769,7,0,623522,1624242935,275163,'关联删除'),(1318805,10,0,646977,1624249725,413706,'关联删除'),(1318898,10,0,646977,1624275146,38545,'关联删除'),(1319712,7,0,623522,1624492102,183052,'关联删除'),(1320361,7,0,623522,1624607112,34584,'关联删除'),(1321072,10,0,646977,1624755934,101885,'关联删除'),(1321508,10,0,646977,1624799164,461250,'关联删除'),(1321573,4,0,623296,1624801266,200846,'关联删除'),(1321768,10,0,646977,1624844130,58023,'关联删除'),(1322176,10,0,646977,1624952980,229195,'关联删除'),(1322289,7,0,623522,1624976142,318251,'关联删除'),(1322485,9,0,547047,1624993545,33286,'关联删除'),(1322486,9,0,547047,1624993551,33286,'关联删除'),(1322509,4,0,623296,1625000258,452437,'关联删除'),(1322512,7,0,623522,1625000379,452437,'关联删除'),(1322581,5,0,599342,1625011215,452437,'关联删除'),(1322607,9,0,547047,1625014357,183052,'关联删除'),(1323181,4,0,623296,1625057255,200846,'关联删除'),(1323187,4,0,623296,1625057837,200846,'关联删除'),(1323263,10,0,646977,1625064926,425984,'关联删除'),(1323875,8,0,455461,1625185054,241066,'关联删除'),(1325007,8,0,455461,1625379502,407835,'关联删除'),(1325016,10,0,646977,1625379706,3350,'关联删除'),(1325492,10,0,646977,1625449287,176200,'关联删除'),(1325785,9,0,547047,1625491567,482674,'关联删除'),(1325969,7,0,623522,1625532469,407835,'关联删除'),(1326003,5,0,599342,1625549463,318251,'关联删除'),(1326004,10,0,646977,1625549470,318251,'关联删除'),(1326007,7,0,623522,1625549648,318251,'关联删除'),(1326008,4,0,623296,1625549652,318251,'关联删除'),(1326009,4,0,623296,1625549652,318251,'关联删除'),(1326013,4,0,623296,1625549791,318251,'关联删除'),(1326014,4,0,623296,1625549794,318251,'关联删除'),(1326015,4,0,623296,1625549798,318251,'关联删除'),(1327295,10,0,646977,1625763799,142735,'关联删除'),(1327385,9,0,547047,1625805033,318251,'关联删除'),(1327706,9,0,547047,1625853257,422132,'关联删除'),(1328528,10,0,646977,1626010848,74929,'关联删除'),(1328783,9,0,547047,1626067829,502811,'关联删除'),(1328911,10,0,646977,1626091555,407835,'关联删除'),(1329316,10,0,646977,1626161760,301945,'关联删除'),(1329641,7,0,623522,1626228267,281833,'关联删除'),(1329642,7,0,623522,1626228291,281833,'关联删除'),(1329698,10,0,646977,1626232303,452437,'关联删除'),(1330025,10,0,646977,1626328954,78670,'关联删除'),(1330069,10,0,646977,1626338618,78670,'关联删除'),(1330130,10,0,646977,1626352495,429439,'关联删除'),(1330131,10,0,646977,1626352542,429439,'关联删除'),(1330386,10,0,646977,1626411657,78670,'关联删除'),(1330387,10,0,646977,1626411672,78670,'关联删除'),(1330388,10,0,646977,1626411689,78670,'关联删除'),(1330437,7,0,623522,1626424557,429439,'关联删除'),(1330438,7,0,623522,1626424561,429439,'关联删除'),(1330439,4,0,623296,1626424568,429439,'关联删除'),(1330623,7,0,623522,1626450154,281833,'关联删除'),(1330667,10,0,646977,1626460813,301945,'关联删除'),(1330671,10,0,646977,1626463356,422132,'关联删除'),(1330806,10,0,646977,1626500217,301945,'关联删除'),(1331085,10,13,15242,1626541576,422132,'关联修改'),(1331711,10,0,646977,1626664629,281833,'关联删除'),(1331879,10,0,646977,1626698151,422132,'关联删除'),(1331902,7,0,623522,1626699312,281833,'关联删除'),(1331903,7,0,623522,1626699328,281833,'关联删除'),(1332511,10,0,646977,1626781797,461250,'关联删除'),(1332939,10,0,646977,1626842512,482674,'关联删除'),(1333059,10,0,646977,1626867950,413706,'关联删除'),(1333737,10,0,646977,1626965004,429439,'关联删除'),(1334103,10,0,646977,1627058687,405461,'关联删除'),(1334116,10,0,646977,1627060602,405461,'关联删除'),(1334129,10,0,646977,1627061675,482674,'关联删除'),(1334545,10,0,646977,1627125145,225377,'关联删除'),(1334584,10,0,646977,1627131143,405461,'关联删除'),(1334819,7,0,623522,1627171768,461250,'关联删除'),(1334821,7,0,623522,1627171784,461250,'关联删除'),(1334895,10,0,646977,1627187890,413706,'关联删除'),(1334900,10,0,646977,1627188333,306791,'关联删除'),(1335155,10,0,646977,1627222382,405461,'关联删除'),(1335412,10,0,646977,1627272005,405461,'关联删除'),(1335476,5,0,599342,1627284072,344362,'关联删除'),(1335488,10,0,646977,1627287645,405461,'关联删除'),(1336019,10,0,646977,1627396987,405461,'关联删除'),(1336499,10,0,646977,1627532593,405461,'关联删除'),(1336758,9,0,547047,1627594778,2331,'关联删除'),(1336766,7,0,623522,1627607223,446534,'关联删除'),(1337403,10,0,646977,1627723634,413706,'关联删除'),(1337404,10,0,646977,1627723643,413706,'关联删除'),(1338441,7,0,623522,1627881221,374506,'关联删除'),(1338442,7,0,623522,1627881224,374506,'关联删除'),(1338826,10,0,646977,1627910655,405461,'关联删除'),(1338827,10,0,646977,1627910667,405461,'关联删除'),(1338830,10,0,646977,1627910697,405461,'关联删除'),(1339444,10,0,646977,1628077309,405461,'关联删除'),(1339591,10,0,646977,1628119284,344362,'关联删除'),(1340070,7,0,623522,1628243931,409467,'关联删除'),(1340331,5,0,599342,1628262471,318251,'关联删除'),(1340333,5,0,599342,1628262481,318251,'关联删除'),(1340357,5,0,599342,1628263847,318251,'关联删除'),(1341044,10,0,646977,1628338043,405461,'关联删除'),(1341512,7,0,623522,1628399217,429439,'关联删除'),(1341554,7,0,623522,1628401538,318251,'关联删除'),(1341734,5,0,599342,1628419448,163428,'关联删除'),(1342117,10,0,646977,1628473102,461250,'关联删除'),(1342637,17,13,33882,1628526439,418314,'条目关联修改'),(1342638,4,4,1811,1628526474,418314,'关联修改'),(1342720,7,0,623522,1628572604,506561,'关联删除'),(1342947,7,0,623522,1628616246,452437,'关联删除'),(1343408,10,0,646977,1628767986,225377,'关联删除'),(1343409,10,0,646977,1628767998,225377,'关联删除'),(1343410,10,0,646977,1628768004,225377,'关联删除'),(1343640,10,0,646977,1628828100,502811,'关联删除'),(1344720,9,0,547047,1628999349,452437,'关联删除'),(1345786,10,0,646977,1629118716,405461,'关联删除'),(1346025,10,0,646977,1629137944,405461,'关联删除'),(1346785,10,0,646977,1629213788,405461,'关联删除'),(1346803,10,0,667791,1629216738,405461,'关联删除'),(1347212,10,0,667791,1629290899,405461,'关联删除'),(1347213,10,0,667791,1629290906,405461,'关联删除'),(1347215,10,0,667791,1629290929,405461,'关联删除'),(1347306,10,0,667791,1629309881,461250,'关联删除'),(1347308,10,0,667791,1629309913,461250,'关联删除'),(1347312,5,0,599342,1629310021,461250,'关联删除'),(1347313,5,0,599342,1629310031,461250,'关联删除'),(1347413,10,0,667791,1629339921,405461,'关联删除'),(1347534,10,0,667791,1629361210,301945,'关联删除'),(1347535,7,0,623522,1629361289,314441,'关联删除'),(1347628,8,0,455461,1629370240,397093,'关联删除'),(1347802,7,0,623522,1629386492,430988,'关联删除'),(1347853,10,0,667791,1629411184,79660,'关联删除'),(1348080,9,0,547047,1629457521,452437,'关联删除'),(1348519,9,0,547047,1629543868,461536,'关联删除'),(1348525,9,0,547047,1629544465,452437,'关联删除'),(1349744,4,0,623296,1629766162,452437,'关联删除'),(1349790,4,0,623296,1629774594,242978,'关联删除'),(1349791,7,0,623522,1629774604,242978,'关联删除'),(1349941,4,0,623296,1629801459,452437,'关联删除'),(1349956,7,0,623522,1629801773,452437,'关联删除'),(1350080,10,0,667791,1629814571,283765,'关联删除'),(1350111,7,0,623522,1629820461,430988,'关联删除'),(1350112,7,0,623522,1629820541,430988,'关联删除'),(1350113,7,0,669483,1629820806,430988,'关联删除'),(1350389,10,0,667791,1629895693,242978,'关联删除'),(1350505,9,0,547047,1629909422,452437,'关联删除'),(1350514,9,0,547047,1629912390,452437,'关联删除'),(1350782,9,0,547047,1629975630,452437,'关联删除'),(1350783,9,0,547047,1629975630,452437,'关联删除'),(1350784,10,0,667791,1629975782,452437,'关联删除'),(1351002,10,0,667791,1629992258,461250,'关联删除'),(1351710,10,0,667791,1630082056,482674,'关联删除'),(1351810,4,0,623296,1630095292,452437,'关联删除'),(1352399,7,0,669483,1630164231,75028,'关联删除'),(1354492,10,0,667791,1630633320,283765,'关联删除'),(1354518,4,0,623296,1630641979,409467,'关联删除'),(1354519,4,0,623296,1630641986,409467,'关联删除'),(1354617,7,0,669483,1630669498,409467,'关联删除'),(1354619,4,0,623296,1630669542,409467,'关联删除'),(1355095,7,0,669483,1630766068,430988,'关联删除'),(1355109,7,0,669483,1630767316,430988,'关联删除'),(1355339,7,0,669483,1630821638,430988,'关联删除'),(1355382,7,0,669483,1630824074,430988,'关联删除'),(1356536,7,0,669483,1631016244,318251,'关联删除'),(1356726,4,19,193994,1631021946,422132,'关联修改'),(1356728,7,19,672942,1631021960,422132,'关联修改'),(1356874,10,0,667791,1631068280,519415,'关联删除'),(1357672,10,0,667791,1631239284,179593,'关联删除'),(1357684,9,0,547047,1631241249,411072,'关联删除'),(1357685,9,0,547047,1631241313,411072,'关联删除'),(1357689,9,0,547047,1631242603,411072,'关联删除'),(1357690,9,0,547047,1631242622,411072,'关联删除'),(1357693,9,0,547047,1631242691,411072,'关联删除'),(1357703,8,0,455461,1631244113,482674,'关联删除'),(1357771,9,0,547047,1631251812,411072,'关联删除'),(1357875,9,0,547047,1631261610,411072,'关联删除'),(1357995,9,0,547047,1631285229,318251,'关联删除'),(1357999,9,0,547047,1631285323,318251,'关联删除'),(1358244,7,0,669483,1631346290,278323,'关联删除'),(1359325,8,0,455461,1631590874,482674,'关联删除'),(1359775,10,0,667791,1631656606,461250,'关联删除'),(1359897,5,0,599342,1631692862,250298,'关联删除'),(1360318,10,0,667791,1631790145,461536,'关联删除'),(1360479,7,0,669483,1631841437,281833,'关联删除'),(1360928,7,0,669483,1631945375,154295,'关联删除'),(1360954,9,0,547047,1631958721,411072,'关联删除'),(1361247,9,0,547047,1632021989,452437,'关联删除'),(1361525,9,0,547047,1632057086,452437,'关联删除'),(1362000,10,0,667791,1632130559,183052,'关联删除'),(1362972,10,0,667791,1632282150,482674,'关联删除'),(1363472,10,0,667791,1632380848,482674,'关联删除'),(1364557,7,4,20175,1632504913,461250,'关联修改'),(1364558,7,7,27973,1632504934,461250,'关联修改'),(1364560,7,8,5775,1632504978,461250,'关联修改'),(1364561,7,6,5525,1632504994,461250,'关联修改'),(1364562,7,5,14205,1632505009,461250,'关联修改'),(1364732,7,0,669483,1632539270,318251,'关联删除'),(1364733,7,0,669483,1632539275,318251,'关联删除'),(1364827,9,0,547047,1632549919,318251,'关联删除'),(1364896,9,0,547047,1632558784,411072,'关联删除'),(1365159,9,0,547047,1632597153,411072,'关联删除'),(1365347,10,0,667791,1632635856,482674,'关联删除'),(1365408,8,0,455461,1632648941,77500,'关联删除'),(1365412,8,0,455461,1632649064,77500,'关联删除'),(1365420,8,0,455461,1632649280,77500,'关联删除'),(1365471,9,0,547047,1632658530,411072,'关联删除'),(1365479,9,0,547047,1632659075,411072,'关联删除'),(1365517,9,0,547047,1632660535,411072,'关联删除'),(1366305,7,0,669483,1632841157,412315,'关联删除'),(1366711,10,0,667791,1632959161,8142,'关联删除'),(1366726,10,0,667791,1632962415,156971,'关联删除'),(1366944,4,0,623296,1632994379,452437,'关联删除'),(1367723,7,0,669483,1633154931,14356,'关联删除'),(1368372,5,0,599342,1633262222,452437,'关联删除'),(1368656,7,0,669483,1633277453,512537,'关联删除'),(1368903,7,0,669483,1633323529,241066,'关联删除'),(1369111,9,0,547047,1633347733,452437,'关联删除'),(1369169,10,0,667791,1633353281,461250,'关联删除'),(1369231,7,0,669483,1633366773,412315,'关联删除'),(1369232,7,0,669483,1633366839,412315,'关联删除'),(1369473,10,0,667791,1633432093,570577,'关联删除'),(1369539,10,0,667791,1633434006,570577,'关联删除'),(1370407,10,0,667791,1633615468,461250,'关联删除'),(1370412,7,0,669483,1633615916,409467,'关联删除'),(1371208,9,0,547047,1633786057,411072,'关联删除'),(1371396,9,0,547047,1633833868,452437,'关联删除'),(1371793,10,0,667791,1633883041,225377,'关联删除'),(1371794,10,0,667791,1633883046,225377,'关联删除'),(1372247,7,0,669483,1634039803,279427,'关联删除'),(1372634,10,0,667791,1634134357,456600,'关联删除'),(1372747,9,0,547047,1634182341,452437,'关联删除'),(1373119,5,0,599342,1634236498,250298,'关联删除'),(1373120,5,0,599342,1634236523,250298,'关联删除'),(1373344,7,0,669483,1634294664,318251,'关联删除'),(1374003,10,0,667791,1634392821,461250,'关联删除'),(1374269,5,0,599342,1634443405,425984,'关联删除'),(1374270,5,0,599342,1634443417,425984,'关联删除'),(1374272,5,0,681695,1634443429,425984,'关联删除'),(1374273,5,0,681695,1634443441,425984,'关联删除'),(1374274,5,0,681695,1634443456,425984,'关联删除'),(1374431,9,0,681773,1634475871,452437,'关联删除'),(1374443,10,0,667791,1634477352,588585,'关联删除'),(1374527,9,0,681773,1634486932,452437,'关联删除'),(1374529,9,0,681773,1634486948,452437,'关联删除'),(1374530,9,0,681773,1634486955,452437,'关联删除'),(1374829,10,0,667791,1634559773,588585,'关联删除'),(1374830,10,0,667791,1634559793,588585,'关联删除'),(1374831,10,0,667791,1634559803,588585,'关联删除'),(1375071,10,0,667791,1634621980,425984,'关联删除'),(1375352,10,20,682157,1634665856,241288,'关联修改'),(1376452,10,0,667791,1634902737,215658,'关联删除'),(1376542,10,0,667791,1634918534,74929,'关联删除'),(1377011,4,0,623296,1635007471,482674,'关联删除'),(1377038,7,0,669483,1635028260,222844,'关联删除'),(1377848,10,0,667791,1635227520,21804,'关联删除'),(1378252,9,0,681773,1635275414,452437,'关联删除'),(1378414,10,0,667791,1635314868,74929,'关联删除'),(1378482,7,0,669483,1635337443,522007,'关联删除'),(1378623,9,0,681773,1635366211,452437,'关联删除'),(1378657,9,0,681773,1635372980,452437,'关联删除'),(1378688,5,4,561892,1635387272,318251,'关联修改'),(1378969,10,0,667791,1635442023,461250,'关联删除'),(1378982,9,0,681773,1635454558,452437,'关联删除'),(1379107,10,0,667791,1635477064,405461,'关联删除'),(1379119,10,0,667791,1635477745,405461,'关联删除'),(1379432,9,0,681773,1635538663,452437,'关联删除'),(1379708,10,0,667791,1635596370,452437,'关联删除'),(1380265,9,0,681773,1635695911,452437,'关联删除'),(1380330,3,1,3,1635754018,183052,''),(1380509,9,0,681773,1635800280,452437,'关联删除'),(1380510,9,0,681773,1635800289,452437,'关联删除'),(1381203,10,0,667791,1635939871,580473,'关联删除'),(1381204,10,0,667791,1635939886,580473,'关联删除'),(1381209,10,0,667791,1635940041,580473,'关联删除'),(1381212,10,0,667791,1635940070,580473,'关联删除'),(1381213,10,0,667791,1635940166,580473,'关联删除'),(1381216,10,0,667791,1635940210,580473,'关联删除'),(1381217,10,0,667791,1635940238,580473,'关联删除'),(1381245,10,0,667791,1635943864,2331,'关联删除'),(1381423,10,0,667791,1635997909,281833,'关联删除'),(1381822,9,0,681773,1636041631,452437,'关联删除'),(1382037,9,0,681773,1636116180,452437,'关联删除'),(1382041,9,0,681773,1636116747,452437,'关联删除'),(1382047,9,0,681773,1636118248,452437,'关联删除'),(1382052,9,0,681773,1636119496,452437,'关联删除'),(1382058,9,0,681773,1636121199,452437,'关联删除'),(1382074,9,0,681773,1636123148,452437,'关联删除'),(1382115,9,0,681773,1636130263,452437,'关联删除'),(1382186,9,0,681773,1636162017,452437,'关联删除'),(1382703,9,0,681773,1636207170,452437,'关联删除'),(1382790,9,0,681773,1636215839,452437,'关联删除'),(1382816,9,0,681773,1636217635,452437,'关联删除'),(1382831,9,0,681773,1636231874,452437,'关联删除'),(1382837,9,0,681773,1636236471,452437,'关联删除'),(1382922,9,0,681773,1636249887,452437,'关联删除'),(1382940,7,0,669483,1636253066,72570,'关联删除'),(1382960,9,0,681773,1636256996,452437,'关联删除'),(1382969,9,0,681773,1636257644,452437,'关联删除'),(1383212,9,0,681773,1636287234,452437,'关联删除'),(1383257,9,0,681773,1636289825,452437,'关联删除'),(1383275,9,0,681773,1636291849,452437,'关联删除'),(1383308,9,0,681773,1636293329,452437,'关联删除'),(1383337,9,0,681773,1636296838,452437,'关联删除'),(1383515,9,0,681773,1636338397,452437,'关联删除'),(1383516,9,0,681773,1636338492,452437,'关联删除'),(1383517,9,0,681773,1636338545,452437,'关联删除'),(1383518,9,0,681773,1636338620,452437,'关联删除'),(1383519,9,0,681773,1636338676,452437,'关联删除'),(1383522,9,0,681773,1636338717,452437,'关联删除'),(1383523,9,0,681773,1636338790,452437,'关联删除'),(1383524,9,0,681773,1636338817,452437,'关联删除'),(1383535,9,0,681773,1636339085,452437,'关联删除'),(1383536,9,0,681773,1636339114,452437,'关联删除'),(1383540,9,0,681773,1636339236,452437,'关联删除'),(1383542,9,0,681773,1636339269,452437,'关联删除'),(1383547,9,0,681773,1636339480,452437,'关联删除'),(1383548,9,0,681773,1636339531,452437,'关联删除'),(1383549,9,0,681773,1636339568,452437,'关联删除'),(1383552,9,0,681773,1636340212,452437,'关联删除'),(1383562,9,0,681773,1636342153,452437,'关联删除'),(1383563,9,0,681773,1636342165,452437,'关联删除'),(1383568,9,0,681773,1636342429,452437,'关联删除'),(1383569,9,0,681773,1636342461,452437,'关联删除'),(1383573,9,0,681773,1636342871,452437,'关联删除'),(1383579,9,0,681773,1636343245,452437,'关联删除'),(1383580,9,0,681773,1636343306,452437,'关联删除'),(1383581,9,0,681773,1636343365,452437,'关联删除'),(1383582,9,0,681773,1636343443,452437,'关联删除'),(1383583,9,0,681773,1636343495,452437,'关联删除'),(1383584,9,0,681773,1636343517,452437,'关联删除'),(1383586,9,0,681773,1636343660,452437,'关联删除'),(1383735,9,0,681773,1636374433,452437,'关联删除'),(1383941,9,0,681773,1636431227,452437,'关联删除'),(1383944,9,0,681773,1636431383,452437,'关联删除'),(1383963,10,0,667791,1636433233,183052,'关联删除'),(1384093,9,0,681773,1636460922,452437,'关联删除'),(1384183,9,0,681773,1636473369,461250,'关联删除'),(1384431,9,0,681773,1636548394,281833,'关联删除'),(1384938,7,0,669483,1636641004,461250,'关联删除'),(1385072,9,0,681773,1636677099,452437,'关联删除'),(1385098,9,0,681773,1636688174,452437,'关联删除'),(1385103,9,0,681773,1636690674,452437,'关联删除'),(1385106,9,0,681773,1636691194,452437,'关联删除'),(1385110,9,0,681773,1636692535,452437,'关联删除'),(1385113,9,0,681773,1636692774,452437,'关联删除'),(1385116,9,0,681773,1636693134,452437,'关联删除'),(1385120,9,0,687373,1636694374,452437,'关联删除'),(1385241,9,0,687373,1636720646,452437,'关联删除'),(1385270,9,0,687373,1636722005,452437,'关联删除'),(1385300,9,0,687373,1636722881,452437,'关联删除'),(1385332,9,0,687373,1636723528,452437,'关联删除'),(1385341,9,0,687373,1636723796,452437,'关联删除'),(1385358,9,0,687373,1636725992,452437,'关联删除'),(1385363,9,0,687373,1636726537,452437,'关联删除'),(1385367,9,0,687373,1636726753,452437,'关联删除'),(1385386,9,0,687373,1636729053,452437,'关联删除'),(1385442,9,0,687373,1636755650,452437,'关联删除'),(1385519,9,0,687373,1636770605,452437,'关联删除'),(1385533,9,0,687373,1636771747,452437,'关联删除'),(1385537,9,0,687373,1636774697,452437,'关联删除'),(1385549,9,0,687373,1636777020,452437,'关联删除'),(1385639,9,0,687373,1636799908,452437,'关联删除'),(1385643,9,0,687373,1636800140,452437,'关联删除'),(1385654,9,0,687373,1636800688,452437,'关联删除'),(1385659,9,0,687373,1636802731,452437,'关联删除'),(1385666,9,0,687373,1636806177,452437,'关联删除'),(1385673,9,0,687373,1636807498,452437,'关联删除'),(1385674,9,0,687373,1636807498,452437,'关联删除'),(1385678,9,0,687373,1636809403,452437,'关联删除'),(1385697,9,0,687373,1636811954,452437,'关联删除'),(1385876,9,0,687373,1636860590,452437,'关联删除'),(1385882,9,0,687373,1636860971,452437,'关联删除'),(1386112,9,0,687373,1636898419,452437,'关联删除'),(1386133,9,0,687373,1636899674,452437,'关联删除'),(1386159,9,0,687373,1636900815,452437,'关联删除'),(1386164,9,0,687373,1636901197,452437,'关联删除'),(1386198,9,0,687373,1636902321,452437,'关联删除'),(1386288,9,0,687373,1636913614,452437,'关联删除'),(1386328,10,0,667791,1636916194,425984,'关联删除'),(1386571,10,0,667791,1636997222,405461,'关联删除'),(1386626,9,0,687373,1637024413,452437,'关联删除'),(1386672,10,0,667791,1637034775,588585,'关联删除'),(1386677,9,0,687373,1637042898,183052,'关联删除'),(1386748,9,0,687373,1637059843,452437,'关联删除'),(1386752,9,0,687373,1637060123,452437,'关联删除'),(1386965,7,0,669483,1637118776,183052,'关联删除'),(1386987,9,0,687373,1637119895,452437,'关联删除'),(1387232,9,0,687373,1637171123,452437,'关联删除'),(1387328,10,0,667791,1637191378,452437,'关联删除'),(1387408,9,0,687373,1637203451,452437,'关联删除'),(1387589,5,0,681695,1637235339,425984,'关联删除'),(1387604,9,0,687373,1637235818,452437,'关联删除'),(1387794,9,0,687373,1637280803,452437,'关联删除'),(1387985,10,0,667791,1637302372,405461,'关联删除'),(1388036,7,0,669483,1637311788,311388,'关联删除'),(1388183,10,0,667791,1637326695,452437,'关联删除'),(1388209,9,0,687373,1637327861,452437,'关联删除'),(1388221,9,0,687373,1637328183,452437,'关联删除'),(1388235,9,0,687373,1637328788,452437,'关联删除'),(1388242,9,0,687373,1637329162,452437,'关联删除'),(1388267,9,0,687373,1637331792,452437,'关联删除'),(1388307,9,0,687373,1637333813,452437,'关联删除'),(1388364,10,0,667791,1637336588,241066,'关联删除'),(1388365,10,0,667791,1637336619,241066,'关联删除'),(1388367,10,0,667791,1637336636,241066,'关联删除'),(1388369,10,0,667791,1637336648,241066,'关联删除'),(1388908,9,0,687373,1637409261,452437,'关联删除'),(1389042,10,0,667791,1637412530,429439,'关联删除'),(1389222,10,0,667791,1637424532,21804,'关联删除'),(1389667,9,0,687373,1637501445,452437,'关联删除'),(1389752,9,0,687373,1637505963,452437,'关联删除'),(1389859,5,0,681695,1637513112,461250,'关联删除'),(1390238,10,0,667791,1637574743,8142,'关联删除'),(1390239,10,0,667791,1637574746,8142,'关联删除'),(1390840,10,0,667791,1637662047,588585,'关联删除'),(1390868,10,0,667791,1637665755,405461,'关联删除'),(1390931,10,0,667791,1637670714,78670,'关联删除'),(1391005,9,0,687373,1637677425,452437,'关联删除'),(1391038,9,0,687373,1637679527,281833,'关联删除'),(1391068,10,0,667791,1637688254,461250,'关联删除'),(1391160,2,8,626,1637716192,318251,''),(1391415,4,0,623296,1637740390,318251,'关联删除'),(1391430,7,0,669483,1637740562,318251,'关联删除'),(1391438,4,0,623296,1637740670,318251,'关联删除'),(1391759,9,0,687373,1637763696,452437,'关联删除'),(1391824,9,0,687373,1637767558,281833,'关联删除'),(1391916,10,0,667791,1637808569,225377,'关联删除'),(1391917,10,0,690889,1637808574,225377,'关联删除'),(1392290,9,0,687373,1637875553,452437,'关联删除'),(1392353,4,0,623296,1637891646,241066,'关联删除'),(1393781,9,0,687373,1638041506,452437,'关联删除'),(1393784,4,0,623296,1638041568,452437,'关联删除'),(1393786,4,0,623296,1638041592,452437,'关联删除'),(1393788,4,0,623296,1638041651,452437,'关联删除'),(1393790,4,0,623296,1638041690,452437,'关联删除'),(1393883,10,0,690889,1638070731,409467,'关联删除'),(1394271,9,0,687373,1638122444,452437,'关联删除'),(1394500,9,0,687373,1638187160,452437,'关联删除'),(1395181,10,0,690889,1638307580,2331,'关联删除'),(1395182,10,0,690889,1638307589,2331,'关联删除'),(1395191,10,0,690889,1638314878,452437,'关联删除'),(1395482,9,0,687373,1638358602,452437,'关联删除'),(1395493,9,0,687373,1638358712,452437,'关联删除'),(1395569,10,0,690889,1638366345,326517,'关联删除'),(1396317,9,0,687373,1638504129,397093,'关联删除'),(1396328,5,0,681695,1638508588,78670,'关联删除'),(1396339,10,0,690889,1638509208,78670,'关联删除'),(1396552,10,0,690889,1638540119,461250,'关联删除'),(1396791,7,0,669483,1638611925,409467,'关联删除'),(1396867,10,0,690889,1638620187,78670,'关联删除'),(1397310,10,0,690889,1638701421,452437,'关联删除'),(1397444,9,0,687373,1638713413,452437,'关联删除'),(1397452,9,0,687373,1638714317,452437,'关联删除'),(1397465,9,0,687373,1638714796,452437,'关联删除'),(1397624,9,0,687373,1638761202,452437,'关联删除'),(1398076,10,0,690889,1638880043,326517,'关联删除'),(1398305,7,0,669483,1638936887,281833,'关联删除'),(1398306,7,0,669483,1638936948,281833,'关联删除'),(1398734,9,0,687373,1639000895,452437,'关联删除'),(1399081,10,0,690889,1639067076,405461,'关联删除'),(1399194,10,0,690889,1639083977,405461,'关联删除'),(1399279,9,0,687373,1639108798,452437,'关联删除'),(1399440,10,0,690889,1639125646,156971,'关联删除'),(1399441,10,0,690889,1639125652,156971,'关联删除'),(1399442,10,0,690889,1639125659,156971,'关联删除'),(1399443,10,0,690889,1639125666,156971,'关联删除'),(1399444,10,0,690889,1639125674,156971,'关联删除'),(1399445,10,0,690889,1639125681,156971,'关联删除'),(1399446,10,0,690889,1639125690,156971,'关联删除'),(1399447,10,0,690889,1639125697,156971,'关联删除'),(1399547,7,0,669483,1639144493,452437,'关联删除'),(1399548,4,0,623296,1639144498,452437,'关联删除'),(1400630,10,0,690889,1639319989,156971,'关联删除'),(1400779,9,0,687373,1639330181,452437,'关联删除'),(1400783,9,0,687373,1639330593,452437,'关联删除'),(1400821,4,0,623296,1639353129,452437,'关联删除'),(1400824,4,0,623296,1639353176,452437,'关联删除'),(1400828,7,0,669483,1639353262,452437,'关联删除'),(1400829,4,0,623296,1639353267,452437,'关联删除'),(1400831,4,0,623296,1639353330,452437,'关联删除'),(1400835,4,0,623296,1639353404,452437,'关联删除'),(1400836,7,0,669483,1639353410,452437,'关联删除'),(1400865,9,0,687373,1639360146,452437,'关联删除'),(1400872,9,0,687373,1639360718,452437,'关联删除'),(1400906,9,0,687373,1639365832,452437,'关联删除'),(1401012,10,0,690889,1639390091,156971,'关联删除'),(1401037,9,0,687373,1639398374,183052,'关联删除'),(1401346,10,0,690889,1639461711,316864,'关联删除'),(1401458,10,0,690889,1639467360,156971,'关联删除'),(1401461,10,0,690889,1639467488,405461,'关联删除'),(1401469,10,0,690889,1639468066,156971,'关联删除'),(1401470,10,0,690889,1639468088,156971,'关联删除'),(1401695,9,0,687373,1639543440,452437,'关联删除'),(1402734,4,0,623296,1639760047,452437,'关联删除'),(1403028,7,0,669483,1639825042,233234,'关联删除'),(1403686,10,0,690889,1639946734,461250,'关联删除'),(1403772,9,0,687373,1639972728,452437,'关联删除');
/*!40000 ALTER TABLE `chii_rev_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_rev_text` WRITE;
/*!40000 ALTER TABLE `chii_rev_text` DISABLE KEYS */;
REPLACE INTO `chii_rev_text` VALUES (1,0xED9D5B4F1B491680DF23E53F307ED8CC6847D06DB7EDB627647782A2243BD1EC68A49DAC268A22C721C44980C8219B6C12A46E37171B43B804306013C060205CCDDDD82648F353A6BABADD4FF90B7BAA1B1C9B9B204B9361280999EA72D539A74E9DFEAA8EBBEDF6B8AD4EF72B9F9BFDCEE3E6DCAF9EBA79B7C5EBAFBB53E3A9AEB47CF7D46D73B82D489AD6FFB228B086A4049232487A8FA425240D6CD7A7485B9635FAFA6AEED7DEAD7D41AAAC5697DBF2EAD575A3A6A4C25F77FEDC6B754E9037DECAA959A5B71977B49597401D0E4E93E2ABF3E76EA9333372BA35FFF6EBDB50970B2F141C299144C1919A9EC7E2A7A38D88F67E06CF468C967D2BEA449214EB4189224C801E5D9FDA3D04528C626276BB981B11F0BBB0514C4F6BD37D7A118CD59A0D332FDFBC66989BED51BB2795C18492EE2015F5F5850E78FAACBADAE3FF2FA9727236B7256FFDC7EC0012826A6C0809A11B958F6B9F791F94FCE2AB2CB9ECF7D5796A6A7C9E8FD9766800C3296870C353FDA4D25FFBACAAB2E4E2A58B972C960B17CE9F9353025E5FC6A13675A0414EC5E4F48CD29D517B124AB00F3CF731DBAA653A73A1456DAA138F4EE3681C4787E5545A1BEFD5E24DBF8234E8A68E677056C809AD4A4C503341E8995B4E202120AF8771C71B4381165926B216C5DCDABCBC3907BDAE567A9E3ECD491BB8259A8B4FCBE9344E8AB82D0962F0FA9236D84F04836F97333836A9F56DCA19016723F8C31A9E1DC7516218D41B338C6747413F1E2BD2008E567A9372EA4D4569851A4D6962B3610EB4D1356F698B4FE72648EFC2AEF2FA9022C6F1589B9C6ECACD25F166130CA6C053304C1044EC4BBC5386D7F1621444C3A80B65806025B6A045051C5C55626DC4DCF55552D992C5C1246E5C5583AB72AA0D07235A7C581D68C6A9416D300EC2A12534336A94DE0D399328309798106C2EB0696B1413A35AFF58F1F80CCF1AE3201A8DFED0449F69B565551144682B7F18541B569581E5DC4A120E95C8B0B2D4831B97B4087131CC34F840EB5B5466E33839966B5F541796B468234850028B3834819BDA94991139D5A264BBA13DF175A69F74C94F74681D3C00EDB5810EBC11576359AD2706E18ED3DD787EDDD05B1C0C302E12EF76B7A5F2459DDF63019EB0842710FEBEEA2AF21607EF79B932AFA78CBD63B5F11EE6AE0BFE59997B5EAF9D71791CF79D769E73DDBD73E532C7FF5CFAF00974AAAFF7B9AD944C269189396E32512C512C9D152CD92896289628962896FE5858E22896CCC192FDD8B1642199DC850B968B9728A028A0CE0AA0ECE6008A7331870054DE21BFADE1C6A4BCF11E8EF050FAF3B9B5CBE29DE6961C9E6CB7F22ABF06B27CF3BAC0D85F7CBFADE5E31427B3727AA0C8AAAF41FC37AFF7004D712B5DEC9EBCDA0156B57BAD80ADAC558905ED50DC1BB2DFC36B01685927EFAD2EA0AD9D7B54B52F711FD4D53D719795791FF87CA5BE1AF8EFF17BBC7595FE329634ED8D29337112B5F118C00FA64F87E001947638200A284B294BCF064B9D94A594A594A594A594A5FFFF65069637E94A03C529C529C529C5E9E9C4A915C296E1CAACCE320868F6CEFDAA6AFBF3226A9A74218452935293529352F394521342D979B7CC4636A13A145FFC5471F313365917E3644CBA54C3D9AC2703CEDD743A224A4F86A4C7C0C8E30023C51FC5DF99C19F8D2BC6DF4BEECA352BC1DFDFFCE5ACCDE9B4338C8BB76E5DB176F12E076FD626D2715C2C44812C9266095AC83945FEEF65D7320A8CEA855E244DA1C02692C22810BF4D594A594A594A597AEC2CE53807EC25ADACC360296FE35D4ED31272CA52CA52CA52CAD2B3C15296B131761763124C79FB51600AA24F8EA6455A9BE6C96B4AD29A5BF148F71E1CDB07B786D0DDAD7682EE202EEFE1CECFBB4F941294129412D4940F36ED37AFFDEC2FF86093B1C106D4AC4F362934293429342934FF74D0E4189B69771FF1DC1F356D3F16669A85C243C3983293329332D37466FEA7EA3AFBE34E669AF551277F6C97D04D6326286D9A87174A4C4A4C4A4C4ACC4310D3CED938D352734A4C4A4C4A4C4ACCD344CC9D9783F2C4249783EC4EC6E570D96CAE3C3EED0EBB59DF5EA7F8A4F8A4F8A4F83C55F8DCB9E17CCC5EB771451B4E87C345379C94989498949894987B6C38996736E7CD4F1B4E1BCFF30EC6B98D4F87DDC539CCC1A79DE18F0B9F38DC05ED20C8095FA0440E36E76E53B052B052B052B07E19B0FED37BF561C527B072ACC3C95BADDB60753A19C6651258D963BB4BFE46E98DD2DB14B014B014B014B0A70AB02C1CD94DBA739E02960296029602F66C03967732EC7E3B58D6EAB6E456C6B4541C3CA36E66F7FB04D57A88BBE90BE514C3D39C5F77BF054124677AA199BC1EDABE239D686D5FDBB2252788381524B5CD69A00A8E25716BBA5C6B6EC7B31D2462570891E4EC189E5B5217328441AA380DC7A4164E477115CF0DC81B6DE5CA6246ED8D2041CC7D68C42DEF49617E59E9E93F797D3BB9F7F24169756D6595CFFFB8B4D65F55EAAD398076C0BA23C65545ED3F1EFE3B1F57BCD365B3BB785B415C594DBA11D9CEDABEE4C2BDEF77294E7C8D3E60BB903F470EBDB61FE53CA2AB365DB5E9AA6DEA25D0E73F3DF9E159C125501DA826DDA54C814A814A814A817AB680EA02A2EE075492F9C0A42931889C1960CC3EE0743087B877A4504E112C4F36F7D1119328C78925281959089C3990859497101DB1192059AE75120FBD5163C4CEDC54CF1687EC4021AB750B43E29A92982DC7A349DC30A56726611CEE574242B936D80543415204E88E240105E675404E001A89B6C6199C6D4781151418435270CB292586573E6EC494E129785FCE0EA8631F0E96F42719C74E383FF4943EF73DF23DA9BCE7F3906CED2022936FAF2B830BB83502F002454ADF3096DA91D44454486F60C9420158899A91340465638CEA44A79177C299F32D89A8D65EA5FB8306C9E36AE357DFFFE5EA5FC92A1648A1C094DA33A5AE342002EA192519F98A888375902C72BD4868839065C19343909C2AD118923AF5256F03492D64CD24368CA24097126EC41B6F911841E23812DB9038047AAD0CEB0238EACB1A0AC05F4B5ECBC7ACB88F1E24CEEDAD449CD665408F71BD9F04F301F21ED5FA1E796AFE0E12F49E23FAD2DC41FA8B93489C221DC003E0083849C1501CEE41621889FD487C4B5A040238B1A15B3C0199354E42763EAE0C8FB0603769170821710089A07D5219EAD64422425D859A4E7DA00DC640E184866E36B2A2F582D479AD3F05F4D3A4491009CB36C883902403007B88AC71202412970C89A419F83624E0857720CBA8C4C141656E85688D85A090131A898162C0180E7163016560E0077895AC85D177C6E483102DD38553F3A48BAE481D14F0C42699C196692DB6A8CF2019D2B7786C82B8A23F206774DF8BF3BA5B678867A598FE3A6D988E1B13C6A8F2FE3822AA1F70CE5FB99DA8DEEF1135AC7DD7DE771F5A5B1D87F9D5877D717DE2B0DEF55CC2CF7C18E16EB41C0417D8ED29A1706E7901671BB46EB24C2B83236A748E6C4ED6169596045442599D0DA973236A4713EEEC33F60F6A28088E3BE2545FF1FEEB65C58EA9E6CC7A1A11CF7EC934E770BFD9F179D90E74FCDCDFF8384CCE73C2F9CCEF4D5D2CCF1E3EAFB9B91DDD073E7613B66ABBE656598EC2DC2A7DF3C6D601B74CAADD1924B454D4DEAB2CD1B79B25B8BD0DB747C9DE34FF230342186649CF8432B9892E7D8B4D1FBC4953A4539F2215C1B8FE7F),(3,0xED7DE9721B5792EE7F47F81D10FEE58E892B11E0AE09C50D5A92DBB2B53844793C9E898E0EB6CD96795B227D49CA1EDBED0980104880C4424AE00A70071793C44271C34A448C9FE0BE4203A7AAF0CBAF70BF3C592814B848744BEE76B76B862D03855367C993CB977932ABBAAE38EC57BEEDB9D2F6AF5D579AAF7C3B70A5FDCA5B5FF40FF4FEBEB7EB51F75BFF2ABF8BCC5E6524A8E6B6E9BBDDA137E8E9FD63DF1FFAFE8BAE391C68F5EDB737F98AED5AFFE09B6FFC594D38CB8567E5745C991A11E381AB365C13DE6DFAF8ED9B6FFCA7BAB353CEFA8D9FFFFC3B5CD3C6764DDF94E935D337359B14AEDAB7C274E5FB1D119FE6963307EA468A3E7E874114E706C691E3A9E145F4C21FD7E2D58FDAB2532C8CF1C7EC76657B467EC4642B233CCD773E7E8FA79B9F54C39BCAFC9A921DA70BDF7D57478181C78F1E75F57F4DD79ADA1B4D7452669234F9E88EEADD5517D744B02846B2184A9D7B22D6F6687EABA9727EA6E4742971BFE21B2B3987C493A2BABDA64C1F2AD14531BA243C6BE574B49CDDE1EBC2B721222B68E668686811997D91778A8D31119854C776B4E54D251FFE31EF2FE7D6B83B8C54CE1594E026462532A79DB888C64AE479C939FA4E7F77D79F063FEFEF7BFCE0F392730C372ADEF1723A5BCE0EA3656565BA9C8B95B359656F538D243063652AA5CC2C626C2572ACE642CA58402B8E884C514C8CD2BDF930BEAAE1036D63185F45E1197F15A154399D53FC2E7445D7B17EDC159BABB837AF5D2FA79F69C713BC9C562C470B1E89E369268A589BC288B80B1F70235AB4192DA8C77C1824E476E2A91F0B16E15D7C4667583F9627467C22811D002DD788DEC58D8ADB857582D3E8ABE957CDE917D14D1E559DF457A673E02E9AABE7B09C9BD28A33150F2DF5562711211E53A6326ADCA76D3CD57C20E390E48406E284BE3F760F0CF4F4F5BE0511729008355F796BA0BBE7EBC7B2C995B7ECF4DF962B6F75F50FF60C0CD62E7E275B76FFD7607F17DDDA70E5DBEFBEEBB9D27E9E20D260CC6136F5F0F85C516C775C40140D4E7D5D32F95E4F7F576F9FADE3EBAE7AE9ACBFAECB69C9355472E74B434F4E082C36D624B3F6F636E20D7B8312F5B6E1CAD9327CD724C4F6E6B64F1F59926C49F2DF5992ED742BB8A8E7D1036A83AED104A2EDB0B7369F2BDD604530B11A4E69AB93E5B4EF5CF96EB0FF64535B135AF308F5827ABFEB4F5D9F75D93E79FCF89BBEC727E4520D1FBD665BFAAD1CE07C2194243B6B5724695BAFBCF5A8ABF70166FCD76C41CBB95B80F64A6A5FD9CC4013794B4ECFB97BD0F457EC41748736402B4E68D331BDFF7A855A3774FDE6DCEEF9E6F19F7A6C77BA7ABB5EA6321B486542633AEC175299AF61AFEC76471B136E690293C7DF8F79EFC999FC98873CFA48CB486D6AD69DC293AFE94EA8B9F062391B84BA155B11A85B6810B1EB51729B223D84066FBEF1E61BE6A1447011DD91BECC87A917D9115420149EB23422E2EBE5CC12D40AAE933A180F624DD014E5EC98185D567C4ED223B9AC964894D363AC3BABFA7C48AC65C4485C9D77924ED9902DA19E4617A99FE826144A65710FE38AD894BA9154165C2234544E07E962665CD9CF89D14DD6794406980135B2F8414FEF03DBBDEE4FFBFA3F1BD04670F3A8F0ECB26E7738447EA9AAD75D6DF425B6A1AE2C422FDAF1457D7E5C71FA2A11E8E548B54B69379464883E0F834B56CBE9636D99B438E659CECF61740C82D68DD46265015FF4D6B110C6A07BC69F9041D959169E4D112988A3651159A0FB47B23CF566B49346AA9C8E89EC3A96CDBBA7C4D72BAE6795F56110E5F4A830996A6E438905C1D4EACA8672E002DD7564510868E99076B8A7156735EF022C0B9155529C476CA511C94A28917DE1F1D286C95DA9AC4FE15E9AC0E61678012CAB0D3DC70468218B7935E8D30E3D6A76C3B84E1B131AC5A2D4EDB1726E157F4A7453DD5E50469D229AE53997D35B641CAB333766C2C6AC1D936805F73663C918575B2B62D5E268538B80BD8EC5E88234B25BD2267ACB9945ACDAB03FE07425EAC40E622CB23826E280D495C96293488500104440DADDC87370ABA31D6B24D39F0E940BC3C27B44A653F6AF66B74461927ECA2CEAD7B3C3C658E89F1BD4A66D7760DE8D2475E04962BD9D9D96066CED9DF73E50B32BEA6C814CEDB857F1CE188841849E97D3A38C3040687536475F65E313FB4492115962518029D70E16B48310FA518B7EC98901F093B6B25D19726AC9A3DAF8F633C7B741F6CBB91C5F15D9B012DAAFCC2CBEAD7F2F46F9FB6FCA9931FC474CCCFC0D8CB5037D7FF6C7CB5D6D97A59E6BFAFC9DF7DB2FFD9F2F1E54CD47DBF916DC321F96F9B0CC87653E2CF361990FDD7CBC7B6BE0932F4DE6C3D1F01ABC8FE6B60B980FB396FB873025F6E6C60B056F2C7B62D913CB9E58F6E457624FA0E1BA5A2E77B75DB6FF5E6ABAE6F75B1EBD5FB3288D767BEB8B428AACCA5F66505A5E9F4139DF9E58E6C432279639B1CC89654E7EB9E6C4DED0606F7C557BD2DA749123E8F3EDC94F39853E655ACEC912A93734D58368BEAFE45A2E0DB94B43CF6CD8E9927BA6E47697DC3EFA626B6D7D5B04825A322EA229E1CF960B45588EDFFCEE6CA3075129B99EA19F92EBFB926BD856726DE10FE2F2534DDBABDBB33FB3A9C1ACAFDACE3436349DC959A81375730CCA0F935A726A87A3743E18F7C1B0284BCB4A72B29C9EB3190A063A5F0DE7F05B65764517D08D096E4403867755DF88F0EC8850FAAACD6C0C68ADB91089B1FE6367CF83475DB6CEEE2FBB7B691AE0FDEC86E407F5D9213E52679E7DED70F5AA4DB7373BAB9042EAC697818ABB6A2B67D695BD496A9738840AA1251E82F8E2E8B932895DF0D1697C3240DA733D833FFCC4DBA41E072BEBB35229D1F937DB34E6437930ECD78A475064E268AD5C88D291F49807F25B716FD2197C5CAA32288AA77E4C0BA3BC18353435FC13A28637DFF855E3064981BF3172A88EF90BC10E722EFF88E8C198F8CF8D1F2023BF6A04D1D6D2E2785504D146C1500B415808E29F1D41609E3B5A22A60556B52D1F48F8D40F2A2ABB8B6A78575B5E25B5114E29F313F88A612B23A416C0753A46385E2EA77D588005442C206201110B885840A40E88D8ED8D4D1612B1908885447E1948A4B9A5D142221612B190888544FEB64884D669B71BEB94CB1C6DC27F40420CCD73D76BB4E48E31671A4B149E6D2C115CC20406AF9633BED37781BDA8712442AC5B5C5073719285D8F724803028D858934E630D44A2E7C41E864910AAB464B269EE02692053FFA7C58749A72EEDEBDB6BDE58BB030B6ED4D74BE340B1078FA868ACE7E1C33FF475F57F667BBFE3C38E3BB6DB1F75DEBC66EBF8B8E3DEF5CE92738C7624BB0E7E2C17F6D84AD6B46EE61053D2BB46236DDEA7B9C25A724DAC4D559633E6816B1CC59460C2D06D52F99DDED65F006074B43B1A1BA8FAB289EE6BBBF2D6A7FD832FC68B766E63C1450B2E5A70F155E0A22E48165AB4D0A285162DB468A1450B2D5E042DBE4ADE6C8BA3C1617FE5E860D3AB9562909E1CDB537CCF9438F80342BDAFFA221262CD4F888D89DF5988D04284BF4E446805102D486841420B125A90D08284BFD800E2A3472DFFB7C78429DB1B9A9BCE7F7C9B75E26C01460B305A80D1028C1660B400A305182DC0F86B078CCDED0D0E47D32B03C60B3D7CFBE7068C2557B1E49A2BB9023A70B300A405202D006901480B405A00D202901680B400E4CF0020EDF6C676FCBF85202D046921C85F24826C71D82D046921480B415A08D2429016823C852049673B1A1C0DBA24B5F2BC456255A4DD86C2542369E1D9A35D58DD5673CFC4F773BF08ECD9DCD876FEA35EF05D9907F09AD6C6FDE7E1CE96A6E697E34EA397BF1E735EFCF581FFC96F8C626E37DE27287FBE5A9B8534C4579BB15F2D8CF77408541999507D1146403081F442AD645CDB745EE56952439F53EC2EE838AAD5D10E1E0658810AA4859B76F9AA18F7C310FF989F2B67C23470324E8AFC781C0CAA8EAF5B93BAF8A44EE2EB6F3EBFF4A8AFFB414FFFC34B7DFD0F2E7DDAFB22FCD66866636979E28405A436639043AAE905CF3BB09F2D8FAF43F45EEAF65571E0F9E277814C93D7E3F5BDD8D3B39DE175D97EBA984A87EE2A7B0A275C39A00D9BC9C7D3DDBA1AC7B612ACA2456EECD4D8F60CC74E67DF3A5727B35F397E72B5A9413C77D55CBFBBF8A7E6FC557D3F7E7720BBA2570D186F3BE9D79959DFE46BBD6D40F3DF5C36A3E5B7CDAEDB6F4ECAC75F9C51C355F98B731E8272C2A9A1959BBC9ECB559F6BAEDEE7F25EEFEA19F8FA8769F91F10EF0DC03D7134AFED1FC00F25BF9681D8E8A1E2745D8527072BF58AC27746F0DD1C3D2004597D3BE3793ED3CF2994DF7CD37CFFE649A17CE1FBFD2E2494CD177939D04F7A183736F80C013B21517F73693E5384CF7C73AF114DA993A90B07546C67305D55C4CF0ADE9C19CF6021B755A5BC4E906D179364DB2B8BB2EDE792E593E26BABCAEF0B221B4DADA79F8BFE53C5F3CD375EF03BE1E0E0A27C91E75CDDCB4ACE0DD3FD28DF4EFA822009F938511F13E544448960443AABFBEF072E723A6AB3842FF7C2580ABD7FF4CC70CA62165311C94CC7B5DF9213EA8E635A4A10AED834D89FB8E3AC78CBE9608BF42239D282BE2BB3317380452BCE9C1763D10EE6E007FFB1AB77002EB3484D549EEE9A6224A7C22E7230C816A19CD4AE96CC9D8E29925375B428968668D7BC73C46FA131313FA48E0F2BEE253DA8B0BB2B42AB6A7657E4D76810DC3BEE5743710CCDD14610076E5965C585C9114BCB51E01E4B96F62B818496DC0761852F20425BB4616B19F1D44FD118EC4D6E99E223019F287830018CA8F9B2F01B8D5026F6825F31CB3E1ABAAD7AFD14A9210C9745B35131152D673C223EAE8712D3E08C08B33379A131FDD5BD22E02AA7DD107A756D01760EB33D713BA60A36B7B7A2096D7B6AB7F68DFEB0A492D3AF78274816EA84C52F5BD9FEC5F6EFF83FF05DC919404B313544349D1AFAB1B0A05F594D614B456C4BA44214D478B6CE3F3199B43162586DE389886D63258A7B8FE74DEB2C0C63506D659BC2A7879E727A4D59CA83C934A75B594A8BC40C24C6AC2C404ADA8CD05665769CC6F54068A4AE010972AB2CA2C4C4E168C593C604B0341280F161DCAE8C3D5573F392D060F86A8485DEDCEC707070A81A195B15F990084D8830BD90581C27B4425279162817A2EA5E4ECD2D7EDCD3FB59DF5703B656DB470F077B1E750D76DBAEDFFCC476E3B39EC1BE5EFD6DCA2002F4823742939137DDED149B3398BBBA35AD1D6798C0106C4C90B8D1730869116BD3DCB69CCE555666646877D7BC211C2A36EE35223922B15099F5D08ECBAD0525E0A6C88856040C86B929D3D39A37A5FABC903DB0A8E6DD31AE5027FE2C2C5A3987CE3D14EFA89F211ADCED346604D21B8462D3C284D2F9F75490802225323613981389158E19407163035A75878BA70415CA4A4186F420324129269EBF5F28E13F3E7BF78F5FD441A726C7AB3F35B6A5ADF56F768C65C657B6B7CF3047BF79ED875BECA1C82B93E6AFCAC68C4478A335B4573D027B19CEBAF841D6CF00BDCE835AAF0F5AD92EDB7E467085DE7F4E7825DF0767A1230B1D59E8C84247163AFAE745478DCDE7A1A3FFDD7FD5DEDCDEEA68B2B7B5B5EB50C9D1DCD4E038FF25A217854AED0D1654FAE543A5BF333E3A1BB4FC19CA512D4C5CB57D3E38F8C5C095CB97BFFAEAAB4B8FE4B6F46257C0B868F36E57EFB5878FFF506B0433FB292E9C6A78FFAB9EC1C1EEFE5AC341BE70E9D3BE4797EFDCFEFD9D8E3B1D1F76DCBBFFC90BD152638B03D89F0191EDC270E8C5C12998561080E110BA05F391C1A8C74550F166AC0765051AEAA088C4290756D046C83801D4907629CCC29C6AE36B94AB945A85CD148918696AEFA1920C88C2AE781620E5C5F656221D33A4A21173C1665846EDE0C88CA9E8A01A63C4D72985C93B4F82397D280D771A8A904EA123056619D2BAE34FD48D009D42E3DE64583B88102458E3CC8A380189E943C2723292AC1FFCBBFCA230594DC11955E6A3CA26D63926A91B2BB9FC25D754C9152A0DF998B2B21F1FFA41CF303D4A7142F11E89618F082C2B63BEBB1FF0F23132CCA798D88428698994281EE8B936B10DFC0403A538736278490C470858618E904F39414C4A4B3E11DE18F08B961C26D4C779148042BCFA2A9212C74E3D9D00C66297F20408C165FD320DABBD55621E9A272C2710DD8B53E5E4BA9CB05064EF407CF959C7AB9CBE9088AB39B79EA002FCB3966129A434A0AAD009E7D3CA745C62F125B0171408CD529A6ED85CDCC2896CD81A0D5A2BEDC52DE003757B0CD725BEDA101E1F1B2C8218D56E89013C87D45568081CF3E1C3AEAF3B07BB0661AC94745AF186EEDCFD7F13B76CFF7DABCBD6DBDDF3A0FBBF89FB196D8C642B900FF9DE3BDE714EDAA0F3D8640E0311A00DAD73960673A1AED0C11BB00C094AD7219E593A620703BDE9FC63B21E403060656051DCF533E36892DC0BE0683DC5CC84A07F3A6A3E916C779EFF2347D3750004BD9C7DCE8CC28D89792531880BCFA107912A91D11269EDD85D2E044165918EABC111C2ABD5994A7C5D5013CB5890C176E6BC4D6A10D8D78A8BF853A2B46E9EA7BE67D16C393F67DA1BCA1D52B31B9895F40AAAEC3B3E51870B43E3648F8A118027F6BA38F7D2F0D6E4BD41284E6238292A4442F913F1999980D14D1E18D2C94373129F2E99D9E1970A27C1C3788C47311FCE139524C189CBA39BBADCCBC17CBC3C35E7C52C798BCDE460B55371FA3EEC6431021E2FE70EFFE29CB973B7FB96ADE48C56050A1FFFE29CC54895E9CD329063C00DCEACB80BA424369E4ABDBDC6EC5FB7E6046596E9A6A72A883A375479981726C67DEADA9A4892FE86F5019A509ECF568E67856B8E9230219DB902A9DBA9ADB6E606F2293C6EDA034F5E83E6965BA2E364D80E62B453DE6D2D1D53A631497C0C39931A9F34B87BAFE47A422AD9C4333531AA666A3636993335ED0E73AA66637DAAA6BF8EFB60AD40BBB053717B14F7A672B46CB868E5CC18A9B5D4AEBAB9A7C401DA4715DF0E094DD859190991A62D4E536F6EF0F50439EE91258A0F241640231DD0A4B1ED596D39A58D175877B0E1D7FD03987F3913D51D570A898AD34952E294B19260AA9C1ED38EFCDA21D8BF080AAA917D01E72598221507DB1C5FA199486D4C19C7CF5CB0583C3135BBDED8DC504E93F4EB1B2C27633450824F65F69B8F145635BF0DF3A47C48EF309C4BA3678E56101D62537A8A239831B8A64CBBD4597D45CCEFB4E5E6CD7EEDB9B03A62AACF85BD4826ECEB7B916EE43526C1BE72066C13339C1E7042CB54185BA5E4B72BF1B0B237295210F43D12F41021172DF45CF565FEE748D94B295349B11C865B0331661D2132873C0EA31C119BA3D548EF17D24416E820A56689DFEA1470E4986268D22000E268CB9B982698B3E20C55A2CF795E5A7184526DA7A2CACE0AAD404E10236ABEE76494CF9ED43F598E2FABF10BE4F89EFEE9CCACDFD3EF77D656B6E18912D0301248B9DC606D4F0D8EC948D79939C184D8A566D0D502C05EEE7B43AD391AEC0D3FE60376C968F323E7640CA3057D6C3E6769DE6ABB33D388396558565DFC4AB3861B751EB73799A371352D273BC1CE922F6ABB7DF33F3EFAE0A6EDD6CD7FBB61BB76F3DEB58F3A6DD40585D3621B95992DB1A8079945D003BEC7A8906623A757A486495E43292573CCF2C39455E0CFC5A68CC1CC33B3CB2883BE178E2623BCC59DE05FE19F261317080212DBDBC12ADE88F22444D117FF9488C465A48C1AE9762ABF045F0B4C71ABFB41D7A75FDBEE77F57CD1DD83ED7FC1745EB2F67F61EEAE9B6F6D9E17B899692311ECB08C9032BFCB3D3B41AE730845ED5B302EFA3867B01FA6F9BF3FE6C77E98FEF8E69DFB37EED9DEBDD179BFC3F6CE75B6DD583A7C5130AFFD521B0C37E00A445284139595791D1A7A76CAC565653DCA94ACB83781F69819E5410C70641E3257BB0E240B0900CFFA9E81F598E908084A966FC700D5A139ABDCDC2D4631B40E3B4DA60E016F7C2211E330293C22EC66337A33C930D9E226D0A39D60180142BE9BCA595E262AFA014B7D33964CDD92C4E64896AA527A024601A760CAB49719D8B1B09ECA2E379526D55E8D7AE312A4455D5B50C3CF457C1C8CAA8EBBD9F09255A937BCD5EAA67C18209AE21AC1E137DF0090270C80997E083FB7BBBBDF76EBFA35D276C114559285334C2B9EE56FBB7BBBFB7AD5609246D9DC059DA5E33F4DC54D12BA129DF34BD7AECBA1D0B511A347FF6A6142CD45D5F00138F1FD8EDB3670CDFD9B77EFC03A2B7E17F97647A4B4B451E0C344C9392A39F0DA7B1D77EEDCB855728E99C19821CB740827FBE3BB04FC4270426405DA988C46202446610564C447EE90CE09449F3ACAB0E5312379EE0A6DE874E2704CDD5EA2D30F9FD3889570A080DD7FDEEC7A4700DE3A4C7A008AD67C9D69A5CF539A384255529BEA8A258D1173983CA873EFDA7B376F5D0785399A513D290411EC3A0F902F8C7D026DA58B4A1C547518D5F51CB11B9C728307934F44A2782232522E84B0AA723A88F59CF073B5C28E38769A829EE63889310D60279863EC971EE38374A7B1A831696782CAF2849682AE09813969A5402A0BD32AACD37190AF50842E0AC8E3017254734F0C470E9FA104A0F53EECEF191CE068035591103AF343821A0D1749AF5F630F89E1C1B85F86A4BCFA14E9106A3840A041A7F8289DB7A542DAA81E7D2B936C654BAE44C93D8A3FB4E7D9AB1B636A3855721DCBB027195CE5C0037C0BDC82CF842F838B956C4E5B5EA5B58D07C4F00A25CCE746C834AF87CAD9496D75125794954DBA77D9ADAC264AAED9D2D010FE78B5582185717F98A67FE57117053FC9BD977395B56F3A7AAD52BD6A68E98C86A35A2231A34C65CAC55D567C9D97AE5DB249F1B973E3BE516657951B169BBFD2B3003EAC3A1727F0898C1BE8BD81F1CE47FB2DE690BF5EC225FD941353E2804FD5FD7AEAD73793E243F3FA7DBA50CBE384BAB91B9E20BCD7D8F7F06F48BDE433F46F7897D065625EF57D5F8593D549C9B3C476EA4BCE049A45DB807793BAFF4EA7EDDAE75DBDBDDD0F95A771257C0CA84FC738528A4F0460F0133BE68445278B7060DB1B8477B8F2948A3A594B515C22EA53C77644E2504B142BD3D0762E7D0E5252566BC4939E3E39BC8903AAC4859D8046CA3EC742488D0437D5B84F0D05B4FD83CA6454C4F68DFA467445D8D35E3D19ADF7E4CC6E19A34E1824CC96FD8C134E86D9293CB1E75C080EFF527ADC6794599A0AC974D5BB3B4AE497AD3ABEEA8246C4260017E82AA97690DEAEAFA0996133DCE1723621534D646C3B53C44E603C02EA729BF4D3474960AE4B93356ABA0505FA913A818CB9EEC9CBB3586ECF2180B37C35B319A5596099D2909BE923157096ACC9644A39846E8A3402F748578E4E36F41E453829D136118CFBA0D89C249B0EC9CC026382ECE7545B7AE70985BCA8248E9C1E9DFE2D4C7F3AC13887FE22E907EE5526776A5B606FA81BB1067D5E32A85DDF391A944B0731E28B4A076DFA585C1AC829287A8C5CC699CD1DD36A1CAD5C6E8A59F4F67CDA47FF9374960D7425428EC782781E21A0BB480F00A84447746D018871E0555DC7CACEB1185BAC8C4C8091417CE274670E5F09A81E1F37DA9BB18BF636689FE1E117F974A759C48CF8CC8C62AE7D6517AFE6A031E87B99C747DCB69FD412CB669E43B76DCC709826CBA231AA569C811F035541871E6620CAF3606D2E0111C9155CC7C545656651DB5D5646274561575BDE4457D8829371011325AABC91F65D8037CC95A517E20D726BFE8E65A5BA3346A5777619BB91C121261A6DF6B897E210D5F0EE87FDDD03DDFD5F767F66BBD737D0CDA0C5CB6D34A707FB74FFD2ED4BF7BABFEC7BF898CE944C8E86E1F1492F83A744467A2A45875AF3CB06EB76F4F63CEAB6BDDB3D30D8F365D7435BC7404F97F4FFAED8FEADEBE197FD5D5F76DBEEF43CF87C90C38A32CCE39611B02DD281742838C5E70C32AEBD43865AC6455FEC2A9F00CF3FDDAF953E6C4A1DCA4819203FF484DFECE7789D83630759F658593CE4B915DD4210AA4A107CAEACCF2AE9245DDC4B6165D42C9012A93C4C624B73657A5FF1862AB32BFA6A23FBB017758B3CCD0FE56CF802FCD0A4B3B05DF73F94A911402E756342C4D7D5A84B0F18043DAC17F8BC511F131CAA87919AA0870965FAB24A34090B0F7E95D82FAEBBC8B18D727E9A0FA5743F183699427559937EAE7AEBB4081B19F9EA86D0C9AA7418B56201E4E2EDC26EB396A396553252E8B61A16009948071A3F917E09B61BFA568620EEDDE8BC7BEF7EA7EDE3BBF76E5DB7DD7FEF46C7FD7B37E83CA3CA6E7A3805FAC43B8BDB25A46AC2D64099C6B81723D442B835B641A7ED4068C980B2B42C1F2D530751CC4B3D4B823DF10BEC58B36ED01D4D0696C03C58CB183E68DC58C24B812F0570936B352C276F3C897D6AB1039623166C782104648217891DD4B7899B7657B6DF5926BC21E308670411AAE8A11A47F0EAA7CF687046DCA32EE061C416AAB0EBDC08C399D3364E0F2E7297746FA4276EC63A76C28D743AD146AE21F4567A9E54974FE225D68D74A8B6ACEC47442AFC3F4764C331309CA4F9713A00E3C0A16FA31A3E098ACC1E3C3535B74D3A8393F0427E8A3BE4C37A4C440F8EC393D8CFD51F49735E09303745F9E5997DB9B82C3C32F32519305FD712712CD546764926BAC844C65DCA4C9A49F2791A7744699AF248550C7BE15ED68679EE2BA7A5AA948D2BAEA2F004389B00A2672480E14FEA8AE0197904F2B44D393A528EE4D9201C7B106A784F24E61879D219A4696DD4CFC99C024E9E389DBF7C66920EF934F256FC7ABBE74F5DDC43E25064E36A302956DC92FE01A04B38C2B519415392CF7648A745A08D3C9DA70703A526C0D394D29109121E19A3A41E6E5CDD4AECF23094251D5B63D3736BDAFEBEB6BC8611C90F71FA2911C63B4C105B3E4447CFDD818AC9ECB3F5E283B6B63A6FEFC46190B1E12208FC3565E32405BF8B329932EB2234466743C988BA13A64722A5DD70CDC8DD0F2DA98969A020C07A324545377DCDFAF92B399EA39BCAF2AAB25BD00AEB95EF8F2BDF1F2ABE0DD5B30173A51D3C5196F29CD99A0E72293E075A38058195B639D0857D2C0D654AEE85D250ACE4DE2E0D254AEED5927BAF3494623B4267C9F9B0A194D4F590880ED3468EA0F3189D0F1FED8AA0945A3EA484622EE495788C9DE9727A1F7B2FF5CAA170CED2113C144FF6291C30BA3DB0C2CDD4581E6EB49EF622D5203158F85839D852C347224E1E3647524E2F8A27C6394D956C4E793E4B3121CF9EBA9723DACB181BEF1F9DECC1848DBB2B6B718E6EABCE1DC59B86D707EEE5C0A1CEAFDE1DDE60B21712F02C71EE179D8F9F3A4B247E79AA1F2B9F7C4495691EE8110BA0F490D91C26CA912B72C6F70A623148348D6CE9530CE694690FF41B271C30A1C9001FED9ECCAF6D61BE23552605507F44C9A4BF96394BAAD12B62DB18564BA48C445A89CE5A448812852A4E20FC11CE24648BAF389D224E92A6E7B61F3DA74CB96284D2CC49EBCF29D145A6A13237449B2B0FBAE9583A7140079ED3FBA69C1C431298FBD5E51D8A75AE3E852A272F6A15B2166326AE89907796B20DD25B9595114A0570D33AD81268B3B26062ADA051CEE810992E38B1C9B076ECE653D5CAF60C3D6F4DF62FA1C4345FA7649EC0140C216968433865969FE6AC1ACBEC70ADC13880CF1191AABD5DCFC71785674ADA43998DD8F0C01C3F254DBA0E5217906D8AAF82C4CAFC22F6AEE27496F31314770DEFBEDBDFDD6DEB78D0DD3BA81576B4913D1E85135E3892A06DF808B2C9EBA4EBD60A7CCA46ED29D95E2ECDA00085A2F638664BA7111C484A8DC2F386E3551981659B653555DD04321B3B3B760A7196D3CFB4E389CEDB1D9DEFDDBCF35B5BC71D00B0DB9DCA58807FC03EE8F3F2A6C016B531650C11B6F34C8B2C4253CA6C92937A2E62B249A0AADC61A412520EDECABAE2DE93AA2AAB4C6508FFC19D2DCE2BA37426A93E39D4023E752E61A4F3D7544F684B01194600F99C1413959120F854146EAA1F5A26A5E9DAEAA5B8E2FE47EFDC6099D0710D9D06536E08A5379D895F68FF17AAF6113B4A549C95D985D9DAE1096737FFD5B51EB2204399341203DAAA185E37440E3BD5814064E0D68CAE114658A2901C913BBC096BAF50C468D3F1E9E7866A57E68B627EBAB2F2444C8C124CDC5C2EE78A180C865B99CDE25E294A13D080CAD8A29EB74FAEECFF6A613C6E246D9C80DE18407A72EFDEFCED7B74CA4793B5BD73EBA31BB6CE9BD76F5CBE77E3BAFCC0C7B2CABC5324F64E5AD1D1A45AD8E29971B992D8F6AB5313E4C5AC6C6BB0FA53193532A104C942569C09253069268B291C3B3B07C5D406E66EA258AAA16C006EA10CCCA08C62FCB13931BB099DA82DA7D4ED381B7199B5F794742FA5FDD685D48C50740D96470A95598FD89D54635983514888AAF1753D9508C4F64F506AC3B80F6EA73205B537453914D50C0BAEE7D2D65DDC0CD880F4E232D64CE73332313A665CE13674FCC18FFFF30E43314095B6C2F9214C0F3804B9F28DA9BE03CAF72AACA029076D491D1D6C71721CF973A39B609B96F6163BDD26833FEC25C8C8B134C432371914AD1AD6CC175DFD835FDBFEF0B0EFABEEFE01E36C8B3269CF5A1A25C38131037BA452565C141349BA008D245929958D3CF725185BF39A88A7AB4BD7CB5C30197821C31E9D3B65EC197690D2BE28D597AAD338BC4A796D7264B6CFF0FA2B6B879A17387985D2D386A3B092C62ED51415748FBF7EAF1D55BFDDC856E4EA150A0FB8F7B40D57655EE6F68046996572D5AB75015C2E408E923BA7A74346172B610F66A3E646083C49E744F5793942051854891C55968B107525E895CFD74C6BC5A87EF8B6B1C331354A139859628F9D4737C75E69B68E06FD196C2BDBE4B54C1448FD728DC24154DB18229E8F6D00DCD7056D1BF80C9F9D71F994283FD1763508650FCD46476DE3C37C9A26C2899BB73FECB876DF76E3DFAFDD84A0937F1E1C532333EC0AD79000477FF27A38010DEA6281B5C770FAE5A12CC1433E7DE14174074B76425231B255CE2F115A3CDA05954D515E87BEF21F8DE74461E6B3C354C4119BA27F391BF1020BC94F02F8604BCC0BD1D3B5B161B2573E4EE49D9006764B1A71B2A6E6F934FF247A9E0E867574DEBF75E387E9F7EF7E74EFCE8D4F4E50B84658E311AC55163E456A871E54B057EBB3AA4F403498A39C1F2D67BD677186A36A6A88A594A7710E5A10337186B8E789C82F4A731ED4F3CAC7A9E2D4C81F1789054AE5CC0EC3CE55E6C2322663880CC59A534423752365E016D6CC5C3DA41FDFD259F41CC1DCFC12C51EE7D74EC5689B6BA939493F3DAAAF7A0A8751DEBDD3C9350FEA5A9CD4AF3E50D0982397BB9208CB1C800F7A7A3FE8B17DD0F3D980981F97F9BF7E062B708614187F464BF02B73415AE07844C420FC3B5A729F2A98C8364ED56994F428A56A7B89083C765D7C8A68ABE37A66048A05669F810329349319639E3F15BDD325DC4196497A4DE3E4AD79DCB232C2C7D856192D90D75B17E3D31FD9CB5B4078733F5ECEA4EC745EEAA71211D8AA77B4A924844507FC804E7E0F5FE1E0BFDEAB374D6C1CCC41E597D32B22EFA671202A0BD37ACE5564492BCE8B50800EF9B38B6800A70F94A23A82BD493EEA370C7A9D1D371629E3493FCA8248B20E067E5C4D89345CEA0975282892796D645FC47659ED73CA0959A17927747325EA8421052A575C49B3B7C26696E21BB02600F99C6F1D1A9583B6510F4FFD124318F68113D2381A4AB32E6E13023EF4EAF8EE93BEC7F71FFFA1BBB2322153B3E7DE7CC35CA0F575DFE341FC2ACBAA1E0F74F75FAE15627D0048FECB2A726C6C6B686C6C78F522C7577B3BB755E4F80F56E438D8D57FADBFFBAB13158ED2E1BCFD51E78DDB37EEDCB75DBB77A3E33E4C9B55EC68153B5AC58E56B1A355EC68153B5AC58E56B1A355EC68153B5AC58E56B1A355EC68153B5AC58E56B1A355EC68153B5AC58E56B1A355EC68153B5AC58E56B1A355EC68153B5AC58E56B1A355EC68153B5AC58E56B1A355EC68153B5AC58E56B1A355EC68153B5AC58E56B1A355EC68153B5AC58E56B1A355EC68153B5AC58E56B1A355EC68153B5AC58E56B1A355EC68153BBEA0D8F1BBFF0F),(5,0xED575B4F5BD9157E8F94FF80786F864B20E0681EDA51673AADD48766AA79A8AA11B9CC944A092348A4A908950D18DF7DCC606C830DC6015FB8F80AC4F6F1EDC770D6DEE73CE52FF45B67DB8E330DD5741EFA5409A1E3BDD7FDF2ADB5171CD38ED545C7E4D4C305C78C6375C531EF18FF7E79E5C5372F169E3F1B7FB8821BC7B859A993762CD6D322151F9CD9448B2FBE5D7ABCF4039F4DCDE27075F54B7532F6D9F2CBBB775ECB92D3E8EC188DA288792812FA740C67E43DE7CFD5BB77FE222F2E0C3D38BC7EFD579C9981EAC82F11CF8EFC927A995CEF7F75E2D6E90515E3AFBF5A78B1F8DDAB277F5B1CFB626979E9D598CD99B896F90A13AE41A970E6A1D7D62FA36948FD746C727E76969A57931322E59D9CC311DF658BF61D3ECD8C930E03EA533FB7CE13F627BCB13CCA8FDF7CFD3BE54F7B57460BE2202BF4081FACAD7D10A29557CF9F2F2CFF83CFEE738864725B1E1CDF38D7C9A3C314430FF70DE1A354E1F7F73EBBF7E8AB5F7FFEB988BF1501B7D16A993D0F79DF1A9DD4BB7610048FFEFCC73F7DF9E8B7E4DD53D786BE6596BA54DAA71F83A21D8554AA6715B50C578C866E7ACE64B44ADE240E4DA75BA9B971FA454A277F411473221637DA475FC045B3DBBD710664D10752DA71213110A77428D14633409130448F5684F20834E4768B5646D4ABA2E6139B1A6D5FCAFD4DD6143FB2F622F826EFA96C5D19FABE8895A1E85DDB4B9A17E97CD7DE1FD288D4994C67DFB57DACA5CC9E180D27E939E18DC0193AC91BEDB8592A99251DC466F9C07A93804BAC259196A7BA68B86564CBF6336086EB635313135363882E24B0F00402BE6D5E6B8A85B41069499C5B3597592F1BBD12B844F24AE98247E09EFD27FECD41824839498B8B8B37662F8CC0C9680B42EC544F70AA97BE7DB6B2B2B8F4621C8D34C98D34679F3E7DF5E4D9B24DE5189F1C7FB8B6822E1B7FF6C3CBE505269C70ACAEAD2D3AE62727EECFDFD680F88DD4CA68C58C9DDFDA7C0FE67E46F30DC4547E79170E2DF9B01D6FD6B51BD7D1D88D2B70E3F2DFAC073E6CCFAF179E2E8CFD616169F9D5ED8D29A3F50F7B73EA571333F8FBC59DB86ACBBFBD1991B48F276FEAD6E4AD38661DE30BCB2F17575EDE9A513BF5D38EF1C5E7DFD98981E6674F3E79F2F893E96F6C0B80544F1FDFFBFBF7B8E5CCCFCEDC9F9F98FE7FEAFFA7A99F9A994364D9B3D405F045246B547A8B6656583C855E9FC14C9801C110A3A95A05DE51B8673402E4BEA406E0637DF201D55CD476523E0090A57A55062EF8A398339A474AB0F03BC5E5AED108237A745CC115F3CDCF4D4209006E54B23C0F9855BFB8CEC14DCE48196CFB462BDB07DC5E92DC59A39132F40B2B7D6934238042D664AB91972DA5956744F32D35BC462B6CB4FD32A7591B059128DE385DA27A6479C28036FE4EF9902079D2A66244C1BD0A02B34782183D4A82A846C465874A3EEAE4947C11F4886056CD109C8854DA8A5F51E812504BDDB8B8AE1B0D3F8720746E016A47ACC54F8C20F8383D41DB057BDCB9FA19D04F68270412112C93FBCABC7A43C937CA2200359CB69C3E15B419C6712D0645504DC7E7B6FBA1618838981114B353F89C2A3822DA32CB2D791495A76F914745AF64CDF613D08A89B89BAA6E7191175735153ECBB9CF43B7B343A90A0F9952834EF67998B68EFBA1D7B6CD4CA19FF3FD4D352DED2425608D289EC8D68E59DEB24733F30EE3DB9FD1594D151CCC1D9A319483B964347C225694E79C4E0C2259CA503BC77A936F4C6710643CA531D3837133542777457AABB85504562E06156C8C9D121EDD872E8483A79F3742FE34F4DEBD8308F04CA3E421792B2A0F08A2AA65EC15EC7B6453E6438341E792D16BEA54F1617A0F49AB902F4F9A9F9A3DF16311DF2A2CCA05F6D4DE4094832826E5A0D14CCB6443B6F22A7AEF83D3C89AEB1B4A021A4519232ADB22AEF50F07E1456A40A0B81419EF1491D030A414F12ABD9CD66417E39A4ECEACF6CE90401CC6016FB45363C67C54F812B4B5C7B9B6C928A4810CF6B3C1CDB49220AEB266A7858CF03AA3F7DE8B4A158CE606E040A6D280839F081CD28FCAE4F268E8CAF27E5724B79032C532EAB84AE54849AC5B7B27A82BDEBF4E626A11C45AF200299C0654DD07AFD1E892FF905946DA5EEA67D4BBEE87B18D50179977300B860B24950ECD4C10F6D3760264ECCBC8895D30D00FC2BEA481152AABEFC5788E8CC619A768D01962D76D3433EF212ED90078724BB950C5BCF6B1043D0C57E679C3B20B8F050D18CCFC3AB97DBCF4757A236C762530DBE4D4281BEF87FA96CC1E50E99C4359CC990865236C74504311248C2A9AB8C8581B5CE8C29BA06452EE75151C0133B046B3E7B55371EDA25AF2A3BAED588C762BE360286CE83AA5BCB4E536F41C75BD80579465BF0E7D4E65A0E50EA91E41F5223BAAB3AC8D0E24F0A29DEC4095B5B78516B3727BA2516680EC5E5AF1024F0FAD229A5D8895074EC857EDCC955F89420BC2777F882376910D19AA548A2326C2B7439E96AA2AD52420562B3DC38D1EE5EAC778DA81D10125910192B642D89BB929FFA3200C6311ABC8760C850C71D27F412729D27C364A316C28D7F94512AD7E541443F716168663AA676016BF7DEC3EB3C33DAC57F6398741673F048E2B469BE724D50FF0A0E0422F466C7230248F9862C046E5667FD2B48F642BDD87F0580AA80989B29D4095FE048321D7DAD7E86493B4B29977FD3B3B33FA9AD475A924F3CF214863F4009F76D15EE0F2017D610C4244616E2CD9F2607D198059D4CC6F8A4286F443703142F8D7E1B5E9AB51E794DA7A7F9AC736111FB317C186C335E2D1B8B386D1DB2BD8D0B227D79B5C4AB631227E8AD13C34493965961B94B35F4A956DA0B86C6D02969023386B747B60A17A4D24BA56AA66F7B28E6D4A798792123B6E6BB7D7B7C19E0C66B627AE02CA00DEBB0A19A3D51B0D94BAE2C755FAD22EACBE28441E8FA8A1A9981E46FB6A00FF456E362C724ACEC03BA31B80E58A4535138BBD68336C6F84B9DC31EB8F32ECB8F3CCAC78F976507260E167E750E6886D43B30933D379C6D96FC4E46EF0D6779DFD34F8C81BE0E73DF6FEABA7C1DABF00),(7,0xED585B4F1B49167E8F94FF80F805E19680477920C1BB1365269198497657ABD58ACD32196B445841D04E4490DCD506DBD8D8061B8CB18D313660631B0CE6EAEBC3FE93A9AEEAEEA7FC853DA7AA0D26197623CDCE3EAC56425677F5B97CE73B97AA62CCD66F9B75D87AEE7F31661BB0CD4EDB866CDD7F9B9A7EF3E7376313E3DD5F4CDB7A7A6DDD3CBDCC8EE3BCB2CA4AA1F69A1072BCF96EF22F933FE25ADF202CCECE3E912B5D8FA7DEDEBDF35E3F706A8DB07651E26B6E165A7AD8D56909BE334F019767EFDEF9A35E2C6A55FF95E8FB3FC19AE13BEA78E3D19D8E37BD7AC814F14695202541AA44A9D2A44E27556A5459A04AB84B8835A266BEC84AD1F74F67FE3E36FDBD6362ACEBCBC9991F26C557BE7EAAEF95DFA38A5AA74A9A129592307C990370DCB907F81E76B19D0A8612490180875D3D430F06D8E5494F2F4F78E027BA83DF764AE21B3C1A6927DBF4C9C76AC12CAC83C6C0D0AB097807264C3770D03FF0C36BFCFEE8775F0A39565FD523399EDCE1D5905C8837F423240B024E1471C15D05F72C516EAFB1E33CF7FA58A065A80BBCD230D534409EBB919AE9998989B1A977B876BF1F927A0DB86D2D276DE91BAE2B731FEA7EB9682C47815AFC94296BF575EA245A2D63A4735A23C1135EEA5CE4892A5BCC71CFBAE12953A70F25CB59D3ED674B69EA5440C05CD936C30ACBE6B506A04CF3B42AC5B4DAB156AD5A32E13323336FEE2FF348CD3212F602367337A6D7DC5246DFD9343301EEDCD7E351E3649335CFA564FB19651E7DF5C2DEF55BFBB311FBA8FCA807E27AA8223FF2E896190B69973E9ED8D7533B9676B8A8D562C6F2A905A444408079F2CC63C1E49E90DE0CB05C422F798DBD15C37B0C1C98B12C2F655132BB0654B19D4BA3B5CEE34DE01291D692BAE7A8676870084C48BBAC55601EA7767964566B578B2F9F8CBEF8E6EA4DF75E325F16E8D423C7E67AEA6AFD91FDDB6FEDA35D5F0F3F4340252F30CFC20AF48739BF64B4DC660AC2232CE467F3675A6D4DA649BB70F2AD734C62479B69175596DD30D51CE44B8FD4783DC222476041BBA899DB80FE1823D9259FE6F467B92D79415CBB4C4111810D30CCEA5B8F47407F7478E4C97320CE3E022641952DADC2C34FCEC423FB574FEC2FED3F3993A00C984595DEC32A9DFC6E7C7ADA31F9A61B664F2FCE9E015BF7F4B8E3DD8C10819215C56BEB1E9B7AEB987E7BBD382724C77F7C3B3586AAF76CB3737330C21EF40CF4F6FDCB31B656D6AAABFC340F3CDD36C67A07063F638CFDE74617A1C44B155717CC2B31B55C30856ECEADE1A93147D7D3C919C7ABEF1D1D33EBA321A547CE3B86D4CF0FA28E1974DBF89915566F1F25BD90019E3CE2EB5BCC076A352C836AE1D6ACF6602A06C5EA5F675E8D4FDD9A4321D867EB764CBC461930042290D4FEBEA1FE81815F9CD407F73E676FEAB0F4FF04FFB7123CD0D733D8FFCB13FCE07F2CC13D43F77BE098F1EBE5B977F0DE2D99D6836243530EA9BA4AD57D3C1939C9DD3B9494A8BA44D54D4ACEA9EAA16A9E924B4A565839A817B75820C50EA2FA8993978330FD79B2C90ECECCB80BA836D580B5985FE7A58C25A3E4D8FC11550A46AEA4177CC2C3DD3BB0C901123D9ED1931934ED8B51A2500576C5C0E3A9778E37AFAF21010EB5D24B9D60690FB1C28ED308F3184150EA02558B94EC53D2A2244BD528FA49E72030AAAC52E2A78A1F0F7BA848A892010770240146C1255A27DB542D800A6014B9F5E8F1133C5E3A1564E15C78AF502582DF95026B1C811E6EABEE2ABA5563427B8F8797201CAA4008B86DB290AB0DA10085884129FB2C7868A80DA800B060AEF944F1A42C2E04DF1941F32106825EDD949C89882AE8F8B029ADB3D5A099F67357D028AD53E500DC8818F7E1992AB88D3F7F39CC3CC94E72E569E243DD439545AA244598C10F75AFC50901ADC0EF879F0D8FBCA0AA57603841A7C86D510080BFBA564F1AFB45918282B003E87729219228B00AFEFF4D1087503782A51CCBEEB1AC17F12ACB667C5B44904263184441449341F3E084C87201881F950342212E5837932BA0779F05E18018C46387AC11A8084CEF05551731479F62530AE64690791658C823AE1471F4D80998AC18A7E7A2D3A3D760884734FE16961586CE774AFAAA9F2DCC835B1916742DC81AF955AD99C6BA6E466551F7FD23DA67FF83FD1B01FCDC0A85543F87382C788B3B9F48DF4DE26E085FD7B9E014205AAA401F490B11B461CE9F0344C417047CCB109A56F58922DFB7B465651AAA9FC70EA171D9C186E0740D39257B0855F520DD40931B88F6F68D88DC0187DB8808E3030ECBB29928A9892C9CA32AC6E76D0B17514C75DE905752BA372F1A541420F428D9456F919C7E124345E872290FB349B485005F10D9C958663B14C1145E663C21699C9245913BAB492239AD7606ED018764611BB25630D7B6B516F9504F619F9095766C9615910E50C557B80EC644E112D92C5E41625408B7C0B6C42768CD8B4C5D8814035697B44A0838632D152A4A964EBBC6AEBA131281DDFB51A9CBEAFFCDA8DD3EF2FCEB76E91FC8666741C216B7B0724467B6A7844F060425310F579F7988438C6CC0B8677A5D7AC9A7576A165225C783673CE802C7160B729A02D58D255084392E8728AB438F04DB0309E995B462FAAE1AA75D8CA02882B6228651EA57DAC50AAD7F0895A4BBCE00023F556ECC3542F03A67ADB8E448C0A90E6F2D1CB2F502EE6A076754ADB1569427978DE313B80FA1F655DD63E344F11F08226CC81A4FA4DA39EA00AA6E88C25A1265BA059EA541492C18D46335B67572D5B37030C08916821385F366CE6EEA41F91CF248939FEE739884029A2C221C1C325D40C766427011BD6E40EDC28B0D0CBF4B2ACB1678BC2C43905B914C035CC58483ACEC6436EF31F716F0F97A98A6C4451C2CF63DE5DEB0B523AA205D103B7B01CE0562ACC404E17EBCA9364F8482A90458A02603609715D31DD05A8B0C2EA0EDC0F86A19EE8680AA5D751D64A201FDF494928A20754134CAB6D5E9D8042BBA2BAD8716F4D436FC8A4D018A7F97ED54C446F9E9D03E60652C2D1E0C220DD86AE06701CB38B92DB6A35FE7F03AF74F),(8,0xED924B4F1A5114C7F7267E8709AB765399E13D864DDDB4AB366962174D4310C5A0411BB4890D4E828FC2504468C4828855ABA855112C2AE31430F1A3B4F7DC9959F9157A2ED354ECA68B265D35994CCEF99FE73DF9F945418C8644DED5EF17ED62744A748B964064DA37E10F8F58FAA744DE265A60639E28EF38BAA692AF3B1D9137934213C1C9A1C91926094E876889461F9B0A371099EEED99D54E62A4B542940AFD90806CDACBA106F21133A3BD3D2FB4E363A22EFD0ACFBE444D4F9D7679345FEEF234B50A73B75E2B6F7C3E864ADECC2C9C6BFB35664A3884C6F6718E9783729DAD91DBC4465E8EB7D292CCDBD16662B9D211D1D4B763F031E5E59E305B3D328E0A98EBE40361F4717F23819BDB5DE3A3E83E7CFEC8CBB99DD70D87EBBAE116D87B9AAB5AEE806E94A99A65AFC2F192D47DA4A9D7E1B03FF2864936A6D1528A5C6E6AC545C82EEB6DF95B6C0F3F7DADA557CF40CD416B8516AAB0374F2BBB37CD2514F5F3865EDDC001AC24B3436B39489FC14206D3887208C93436214A8C6E35BEC7E6A17C09EDB74455A12D43B9851D2023D352D2F814876A9362F242475CDFC2FE503AC07C6C8B8FD6DB5828EB89436DF1024A35A89DEA7345633D8ED3891AD74F14D82D625B73049668EB27742B813B50394B14152A7B7865D22C6208FFC6EA154E21ADB87EB586DB9A39D8076B89B26C5E805CA68CFC19E61BCA15FDB269DEE1DED36782969407066F9A45BAFD1EEA171CADAF42257B9FDD0F111B99998EF82D082BCF60453843E15116B2632CE0E90B5AFBDC3EB7C7111CF2B8FD431EDEE1093AF8E0B055F0B846049B73D8671F1C1F0B3E187B854592141205DB5F72CFDB9C7FE69E61B25323CD82F796CD3B68DE21F3278E5D34FE0663178BDD28FEC7EE1F606715A39224FD00),(9,0x9D53DF4FD350147E27E17F58FAA40F120A6C8E4B789168F0C1671F8C21558769CC36B3B208294D3A10F7A3EC073A1CE8D820D08C1FDBD84065940D12FF95F5F6B64FFE0B9EDB42A3245B8CC9929DFB9DAFE77EE79CFB716804893C62FD131CF2225140E388791B114233212E18602604C47A1163C5337A2BD55DFAD08D29DDD8A10D8F5CF3F8D06CF845789E62237E1631A2F8D8413C5391B9C181455297F5CE27BD55333EC7712E3DE9718A917C13A7B6B19A000A4E1CD18C3838F08C54ABBAB6EAB2175DDA73489A4AF31AA627A3A05E9F5C611426DA318EB924D2295807555C2B389F6C7C2795060D25B8D6902B70F3A407ABA75467BE0C15273DECF87D2F3EFFC61AC5840F000F4DA9353B05A1B923E392E284DA9175B46187D0A0154FDBE183A7D3F63F6EAF93FCBEB1A51A5A8E0292F4D7D4846830C845162836EAF5DF4CD8EDF6CEAD89DF259906B4047DE82DCD45BBF2121D42B14ACA2ACDEE36F4F6060593B2B592B6CAA7E4CB7BF372D92826214BE3CA473379422BC8293351BA37CD3F79D895156B3763A69AA458269B9DAE1C83245ED9B7E26BB85922CA92D1A903C7386D98EB976626F3F30C42BDB58577F2305B007EB55771A54AF5D2BD25E1080548AA8AF78A389B844F895A320ADB0E6E24D670FD0708D25B8744C9E9179B78AFA26B2048C17B078090030D9F5F400F20C7A8ED82564A6817A0256892DEA5E5CD6395D40B38AEE917C04CE06C1A67BF427BD6490C7EFA15E885FAB5A9A1A9218ADA93C0B90A14B557304C57109E0D08021F0E31F0EC59FAECE1950B017E216A5310C33213920D06E6E7221C650D23519278E4F38E8DF9C6FB99056BCBF86CCB9906C99FF5348BCFFF0F66C1E7577F16EB6F967E1EB9A5AA9F53A6F948F80DF78EF33C8A06F9706FDF387A6E7CF3DFE610EDAABDFD01FBEAB337BF8DBE8ABE0C447AAECE268E22860FBE760B4A92F41B),(10,0xED99DB4F225718C0DF4DFC1F0CEF55B908C8C687D634DBF671F7A169361B832EB636D16DD426BB714D66C00B088844101414511015016FAB3033ACFFCBCE397379F25FE8F7CDE814DBB8D966FBD49E848733E77CB7F35DCEEF01BFCFED9B9BF0D9079FF87D2EDFDC8CCFEBB38D4DCF8E4CF92703B627333EFB80CF2607AFE59024874439B4000B63DB6E8A4D4C8DBF1E7DFD06B71C2E8FCF3637F7BDB9D3333C3DDBDDF54EAD73A4BD4E9A35656399AEC5877A867B877B619F86ABF839D7DDF5423D392142CC1279F712F6B4E859C7979229777CA94283F27F7EB533FAD109AD654CC9EC7BB5728ACB7970A27015F033D443CB17184AAA0086867ABEC275B966AC61A91539BA1335974255AF66877AECEEFEB149F886C8F5E5B8A9F1CD8FDF990B2AA5D5D4A1B25D5684358C1F1CCDCF77A664E6F7C949FFF45B63CB6577FA6C347FA89FF3DA7583DCD4F5ED3DD2BCC4506A225DBCA0A54B2573752BC55471930861226E3C0DF86766D4AD05BA92D397134A3A4984254B9B34399A6CCB5C50CDD569244E1B0BA49DE8344FEB5790481020ED2525DB80A3670ED8A08963BA2C28E74522ACEA62528B9CEBC749BA5FA5B93D90EDEEC2A290669C485BB4DED2EA4DCB1E46B92A427C34B74B9A022DB7B49BAC928F7CE4F244882AA1C58FDCB676C0830CADC794F09A654D1513B4D9D4AE0B5A326359D38A31BA7288B7CDD5F18AF94388074DDD6C2B2B254B0C6CE20D9A71ED661984C11DDC5B3929C21A4D2BD955B558A7F953AD78A896046DF9985E9F8134DCD7B2A5718BA695EE2E0A45B402685CC215D0F55A1C5A0694682861DC4550CF44D0B08E4055E30C773DF4F48C26E27AA6DE11609EB477D54259E7D7F5DC312486881C6985210275B30DD935CC646EA5029884A8492B4AD756317946AC6830B7A3D65260E72EAF375928B379AA1E5DA9D5029A4A6D814D7D2F0F068DCBA4E450D5F849C64096658E07EF321F93F923995F92F98CCC1F400032BF20F351084FE6F761073F8351D88178D04578E94E25B82EF3C7605CE6770DC902C840247230666881B50FD6BE1C8CC87C1AB2227369ACC95606528FE97910FAD602940C9A01E4E8E295923F816462F3844FD5D5532C7753506A7B464D8F95DA3E9512D096E6915609122903E3017D0DEA68DAAC6F47F144980FB0086E606828B7491349BD70A1A7607496C0A8290F6906DFB4BE8329344A64251E158D98CCEA9AAD004530DB11720C2A4A7A113A9B480955B881BA41E7995D546E812AF409060F52E74568CB87B38A27118E8865948DC461A2ADD01F0A82B5FCA1E9874A1C3C01A899FB002363B63A95768D11C26B56D4C5CA5DB4C6336AE445A8D2D28212CED23C86836790BF504CD96C8004AA85B35AFBC09C7F7C5D8DE921CD0D351DA3A50A9C768A99D6493345231518683389E69C358C60385A8942CB6AF592D6C0A7087E7025D0C7CADE3BD0734B58FDFB206EA5B025495B97B4255945BB9522A8083360BC5BA60C5C49C9F0D8368D16BE511D5E94469C08E7A455A0420A339F8FD244149E4EF542B45E1B23D415088388E2D36FBF7EFE5C496FC2DB8619C7ACA1203EC780B2C09BD969BF0D586747D6C1E33C31F9331EB9F06CAC6F6CB4CF39E2F5045CA3036301C778C0E175F67BC75F0D8E3BFC9E51FFB873E499A3DFF34BEFAFBF81D2FC3C62D33BE0FE72727ADDFF0A396929ADBD5FC3DC172EB4461232FD2996FE25B64FA1155DFF13BC7E29535FF8A7265E8DF64E05665F32C032C032C032C032C0FE2F01EB1AF40EBA3D8F10D6E5B361708F52D5F9DFA1EA6350F53C80EA3D53195219521952195219521952FF86548F77D06567487D14A95E8654865486548654865486D4CF43AAD7E91DF43CF60F2A432A432A432A432A432A432A43EA67FFB3DA3FE01C70BB1853195319531953195319531953EF99EA80C7DBEBEC733B80A9F8884FCEBCFDE9877B76CEFF01),(11,0x4D524D6F125114DD37E97F20B3D21D4319435E330BED46772626BA3463534DD3D0268049CD38C92B5018322D1F1105A185D202D3887C284887616092FE15DF7D33B3EA5FF04D49D4DDBDE79E7BCE791F12E291BC8B42C14D0985911C4711C46DC712AFF7A5E80EB719477C10715068D39FE300356AF708BF62ECEEBF3D787370780F851F214E969FAD90C0562CB1BEF6D11960B2F8448C3EFD9285E2A9F84F850DE16A44ACAAC82A8A75507B2274C6FE4EB9492B1D910FD13335146625C3DC168686263EF64BB3E7F5AA222F08DB51D632792F7B2A8637F6DEB1EEC9ABA76224787B2308B737117E7D4D51FE4F1B7F1F8D4AB10F3EB4E163C4C8D3338DCC9AB43A84E209CC268EA9DF5927649181FA05314CE8CC8855827E97981958AADE679B18980E7ED1CAD4AB4C1893D168BF0DC7531834D8BAB74CD36179A5E9768FA0ADFFC649F7EBC2494F99143B25BDB01C7D481B472B17A7FC839879C732C9ACE066BF11BBC5700FD7C030DCCB1E94AEA13E716A69629A64FE9DE630D80B57CF30CDBFC9D9D44B263D7C4CE66D6601CB0AA8233FAD96A5A3B2EF32CFFB093363B0536061D03528969C730C6ADDE969542D404EF752D74C875E76696AECDAAA6BD799C583E72F424E4EDD7A7967D5D80342BE19F0CCB9DBBA7AE8DF9F80B89DC3444CE2D89709225951943F),(12,0x4D525D6B1A41147D0FE43FC83EB56F6A63BB99B00F6D5EDAB742A17D2C36A4251413500B295618A344C58F2809F5330912578D464DA98DEBAE46E84FE9CE9D997DCA5FE8DDE4A1851938F7CCBDF79CB93341E223B11DE2F76D04C91A8945884A94AD70F4FD6E30B4AD6C44886F9D28CCA076B228E895C74E1CDB899E9D58DE1FF91E5277763FEE7DD8DBBFA702C8C562AF1E18CF6638BABAF24D8C285B1C3363C8BFA7A154D0B01D9BE5F8B2EC11A589B82D620A5C5CB3795543C4691732030DF49F6EE5C939AFE85A8037334FBC8890922D0A6739EDB90BCD8133A86ABEA7DEAD1086A8E1A40BDA9AFAF913462FDEBDD454F5F734805B0DACAEC4E3FF5B8E7C098582E1AF2EE5579F1185538B57C7D0EC41E396CD3A306ACBB1254ED167E76E9EE7CD2C331BA0A739ED8B7A0ABDC1F0D2A607B2B610A91B684F64AAEC9C9E816180BEC07CB638047DE61C5C6089C8CEB044F6A86CE5F9F808971C5D42198526C833D364D6154F9D43E69A190518659951E4D3299BFDC0FED804A579E506688DCDEBE2A407D93E6428142D04CCC8A13DA7F50B1525CDA379B9ACFD536CE59961BA209987529137264EBD242B47EEA570FE461FDA5DD1ADC2F8F00FEDE07AF4FA8D5F64339B6FEFE675995C889AE5714C0B5F0786A5C7EE9C0244D9DE8F86830A7E142F89C5E3F1BF),(13,0x4D52CB6EDA4014DD47CA3F20AFDA1D2620D289BC4936EDAE52A57659B9515A45158904544AE522392F6C4A9C382A04429C262958102804145A3F6A54299F92CE1DDBABFC42AF41952ACDE2DC3373CE3D776644C213699D24124B22491229471609B79ACDBFDE10336BDC528EF00B84A3DE67D09D58F8AD037D7D4AF2B343EB1B6F37DF6C6E4DA9240A25E9D98C89AD64F3F3739FFC814C275FA8DD67270AE89AF0CFA8798846B80FCD21F5EA022226B741ED0960DE46B2CA05AB99429A196A228E08A9E04A86AF656139826E2FECD5053E155FCD60890D42451392FCFB77582DBF7A2AA417EFAC54F2CE4A3F999F2B14FECF9BFB90C988D98F11B510C7BC7EF97BA074C1E8B05A9B5D5E05AAE637F6FC6B97554F61D00A95036A6BECA40FC6303CAB82FACB3F9799D1F14B0A6C37F024FB61B1FA0502386A31B91B01F316FAD77FE41D9C87EDEE07A7137FEF2768DBA01691C7A1D9B0F2E01DD04911B4319813D83DA2B6EC9F8D83418BDA6E14C61AC1BE052D85BAC57BD960AA4E5D179DF1CED8A5772F9FA339980E334A28A47697DD54B004671C567F635A181E4731DA3A2E6C84A3853BCD5966EA94F125900CCD11E83DF49FBD03DC3891C354120D658D30397679F4FC45C22FA92B2F1FBC46A81CA23616D4B4C7D1E5A508B7B695CF8A1C7E9A38910A85C25F),(622,0xED555B4F1B47147E47E23F58FE0185B5BDF812595553A94AA5AA7D4CA5A88A1C0A88462411246A2A40DA59F0057C83606C82ED183B363637DBDC9CF5DA86FF92D933BBFB94BFD03336E192B48ADAE4A152FD3673EE73E63BDFF179463CB3931EB7DB76CBE7717866673C2E8F7574FAE9FD47BEA931EBAD198FDB638578911D1D336593DF05A1A79F7C34FEF8C1E3E75D91E8F0586767BFEF492CDF4E3F1D1C98D3AB92D659D39403960CC24AD47B190475F0BAAEB537BCA88458CE545B46FE354A995486D09E174AC7DC3D9163A99257B0B14CC8E6C023CA8CBC04AFC2DE6FF851DD33F736BC82288E4EE1153399C1A8D7617F3881B7DB77EF785DC343A238E4120607E6AF573DF36C6ACA37FD0717D9057C29D6A3293196096BCD9CF1B2A32F36D8460D5622BA5AC60ADEB5235A2700A526A4B7344545899EF21B52446BAFC2C1B6A606E02C64AE9F6B8AC4AAA72CD5305327E882C6ECA0885EFAE622344FCCB345F037A0FA8AD5121789B60914CB54927B19D1129FCEB6DA7AB9C65E915E523D71A8A931BDAD6ACDB811DCD5CEF328674B92D62A99D226288AD6DE340A7BB05A81F40926D254556BEDA3019C778C7200835FBE0BB5A62C9B925F6BF1AAE02C05A13A2F3E1C64F5044FD78AF18203C770BE006D09CA615859D5B31284D2FA5E9885E2B05436172A188715B6D9C2312C458DF334A6E06D143DD6B1E74FA77D56C4CFB067767E9E83C9DE07531F4C5F064CAE61C767A0C92E383F8D26CB0D3885F6B86C7670E09EBEBFAFA9914BBBB95F5066840FAFDD104AD76EBA5A03D2BD51724AE53025612AC729D9A52446C97AD7A4933277F6E12035F7DDB3E9670F7DBFFB2C3FFA2626677CDD681BA77AB9CE43CD5F21D87203C296BFC2B0E51A882D1FA0D8720DC6962B1CCF417B5D4F5458B6C4D415AFE56A8C2C37E768FE6F016F4399A6B4102AE0DFA7A48238A7640391CCB6F29454DFB5D710AE5835FEACB9FE8665723D9C777BB204673BDDF34BEC12CB64A944D0CB4C4A9428184A6F6C521287AC8C713405DB58665296924526EF50790DAF78EEB6B742C91A95A3DCBD0B4E5E4650453053C2410BF5554A5258A1B11DD673252A2FF7325282F21DF4E2714891CA086F893738A8C06A071D79588C402AEC50A5329AE5B066B6BC41E548F73717A1FD063F141D2991BB012337A2B592989417AFE2635FF48AE70F27754A5E53B27D51FFC7981738CAED1EEBE4D404573950E7730D39C7871CF7479C6E9F6DDC3EE6147E750B2EC137E27CE0141D36C1661BBD7FE76797E0F8EAB727E8C4474618763B5D9F313376FB979B190884E0248666FF6E782CFF787AA01EEF65FBEFCF902862A3A17E68D45A2CB78299D10F79D18E83735B8F1F708E7ECFF248F188513822BD9580FB436BFA717F6079E8CD55CDEEB6A83591E8A11E30B3053CB3641DE3E9B11A141670D340A60267129FB4540569976F946CDE24F8ABCB9A1265EB05CEC5F9082771CCD85B3C2F2217BC9F564CFC9E66430FE48C1A9FAEC101A836CC6004499E678BF8414DF192334B9AB2ABE31E097578F25043538F78186587E5129CF66B51947403A021FE90512DEA995C4F8F013E58535899711EC4A8B812217AC216E3504CF22D94EF405AEDD51125100A4032C3F60BAC9DC01DC35B11AFF1ED1B3D816A04FC157694E731BA5ADC40BCB256DCDCE58FD5D355B615E4C68128B4D4CB2DA517CF7AE1B1A9AD12F6869D126C0FBABE9532902EC0C10A7E0B3681A5E26FA5ACBED4E47390CCE8A143DE072C575160AD6DACA63E30E64D3878DF664561CB877C3F7E6403CA029006F84B7A36FF69AEE07C3CE61E1AE55CC171263EB18DDBAE38C1353C22389C7D52E893429F14FAA470410A6EB7CBE518E993429F14FAA4F0FF2105BBE32629FC3433F1C35D4E0A5F4F7B0551708836B768133943CCFF09),(623,0xED97596F224710C7DF2DF93B8CF800E13E3C2B1E3651A4DD448992A73C4491053E3624C144B6236D849186355EC01CC6DA0330F84066386C2E27D80C33C67C97D0DD33F394AF90EA210B985D2B91E2CD4382C4437775757555F5FFD7808BB5B17E0FBBB06079E0622DAC7F8375B0BAA5F5CDC535977745F76083355A591D1238D48D91FEBE9C6ACB3749CD6C1CBA79D6567D6EDF53CD6433B33ABFFFF1D0C27CB4BE393FB7253738D47B81843A791DC6A984732A1478E0D316BACE3895ED9E9C955451022BAEA7608170651C397762FE571AE7E53149F34E2BC9478C661881492970F828E67C4887E2B97A9E711A6D86252F4CE144359C705A1CDF3F81D9875F3D723A1C7AAB43EFB032F37381C9F4377EF27A5DEB3F5393D50495134E2299A61CAB29E1339CAFE0DC0DEA9670A3A886E34A5382B17C10C2C52A8926706B1F32FBFD3A4EF25192BEC25C165D1FC0587E59C1D1331CE17052820112625828811DF35D3972459A09E802AEA7210E44530B974A3F2B9713980F13EE0C8C4A218E0471C03D1BF6072CC35D9015CEF5D4EC8E7CCC6B114A0AB703A7FFE9269549B48FC4E7A353C67916DB4A681F3C71EE84D48B249292A52A2D6DA7424E0AA87B0C91697A296D0BDFA34787AE142E3E0EFE2607BA8BEFE2D6DEB05E6AD76E457D760AD70AC70D4F81FCD5D323921771F10289317C788277785C2C93CB0EDC13120BE086A42424338C8F6EFA64779736BC73815B41355D572E3BE490A70968174135238AB4D5BF1420552449A8F78AE463782F467D726D1C69C1146AA125844539D9822A20DBB15168E0DD2ADCC5A828D00779DD22D11B9C3B82BEA17E01F7B76155E9274992A775B52508A20983D5AD3CDD5C77E9801003EB0F04282ED6192E335C66B8FC3D5C1C06B3F92E5E1C1A2F83EDA4CCD506C11783606510ECDF818C996AEEAF9061DEC14CE49CAEF8E7E7BE966B3524C647DE5BDF804D895D4CCCE0862666B2D8C4416D36088606C1C220D8180473A34435975E5AADD640A45B8F97BEF5ACF93656984F7D9B3EAF478B96B994CB2D1A2A306694B905294329351B6E51CA4C60CA4C71CA4C80CABC21955679FD0A6802251031456B0D8C5F0BE6ADE7227017D726EB88EB49A20167F910FA5A1A228CC4DC88412806D7AB70FB4AB6072C0C09520F8FB020002054BD3D0A1AC81EB6C8D12EC5B6C201B9A4B9071FA551C5FB70509B322E8A48AA91D03148140909DC882221493A1DD4BDA012E5BB93AFC7DB4FC7F089A0B2E4E2903CBC15E313B587820EB6E3389524B9B67A9052D27BB428D08B7006C4C9E50C6E3EFF8D2BC1675AC946AA5D78B03DDE2774C942D72CFA6597DEBAE8B6AFBADD4B2B26B3C5BA6CB7DB4D6E83CD6E71998D8E65EBE2C31F4C8F3EF9E0BB1F611305C16E33D82CF782826961E1BF8AC2D417D6BDA03053FB3F51BB091A67B2EB575741EDB4819F7DF1F1979F4FA9FACEFF0F3355BF1755333355BF5F551B0D2687C962BC97DF2DC67F55D6A3BC98DB327EA7D29999D4FFE7520FFC01),(624,0xED54DB4E1A51147D37F11F267C4005918B6378B14953BFA0699AC60055430DDAA824364832E305B008D2780115C40B1405874B558411EABF94D9E7CC3CF517BACFD0283535267D6C4DE6E1EC75F6D97BED73D61A276FE6FD1E7E70D03AE4E40778FF2C6FE70DEE99B9D129A777CC3034CB9BFA7983D2FC04F186761C0329AE63A64E8E676A7CDA353DAF4316336FF0FB473A08F77C66AEB767819604A5B5A1D425B21D8278D4D15D07B7E1B8A234930E2D14C31475238D1011F2102E3A2077CE8E6F664822E7B09154B8DF882B84D44301F6238E61B6948B5A31E930598C6E2F86D8480B451D03A6C9098C865FBD74D8EC7D96813EDB606F4FA09BF4ACCFEB75CE7C64D0800D311A39534305489D90449E1C1CAAE128DD5DA6A732D9DA8152560BAD29F528D9962055D1F6B6207C4DD302499DD0D51088BB98492EAF4832830B58CF12A1C016B973904EDBC2220E439656D49D165DAE4154847010711C9D54367F34D7945610A217906BC1D2BA5217E8DE855ACA2A759991B9AAC2CA1564438A1CFC2EA44838AEC83256C69B2307CDEF421A8B43AE4152AB7850A91748791343685C685B37C8162A9F198D7C1C3F6C84A3698BC78ABCD7A1AD342278DD886BB92AC48BD8A2F320506EB022FA2936D75515C963A3B62074E84148A6B10A56836C1E4A35BC7FF55B431FBC4092E5BB22B7158434DC5CD2EB0DE48F218E804FC7F8ACD4A0B4AF13AE31B652126B2A720C8261B8889154446964A8B4CAF22B55B57CCD5A485FF069900C4D658874DCB90A6CD72146BEAED2F421ABB076ADED1CE17498C9DED7C21BC6E6E7669C06D4B691F707024CE8B627A13F09FDDF17BADD68313EAEF4A39387956E66798F299DBB2FF57091C1FEDE9E37F4EC4C91D76E5317DE22A646AA5D114ABD2BA27219443D6A8BCB6DB1D616A36DF1B22D06DBE286BEDF4A68A767202516465CBE490FF7C2E79B9CD6CB242F69BEC26A04EE9CC5FD662DEE0FDEE2BACCC5DD7317D7652FEECE5F0BD0DCA29B27249D23729C0D19B87337F7CBDE8928C20F19B1DF6EF96F8CF8772EBC2F67131330FE723DDE09FD4F867B262B3E469F7574D0E4B638ED76E3B873DC3AEEB28C598D76DB98CBE4EA7FE71E7D3D61F5989FBDFF80870281C04F),(625,0xED965B4F1B4714C7DF91F80E2B3FB50FAD6FEBDB467E69A52A552A55EA4B1FAA0A2D6012821C222E52A86D69676D631B1BCCDD06CCC5C5060C18438060AFEDF061666776FDC457E899250203ADAA86AA4A2A4BFB3073E6CCFFFC67E7FC562B0A2E213028783CEE27A2C00B8151C12D98FA46C67A5E897E9FE9C9A8E0114C7AA6403732743DCDE656EBF5FAE0AB81E1DEE137468887A440E0FBEB08F7EDC8587757503B92D4E6825A2DD3E518999DF6DE88C01AD93E561B592FA95DD27C91C41210A2D22E891F7849F194ED5DDCA499A2D74373710F0C20A2E725B291F4FEC886CA41EB20EBB53A2D7D7E984291566CDACB3B879EC3EC9B9F9F7ADD36B3C36976DBBABB42ED8647C7FD7E71648285788B4B30D15C52AD6D6AAB11189074F2AA91A2D98A5ADD072774ABA1AD9D69F126AC8223522E91F22C24402D5D7E4BA27B7AB8095312AD8229A6B07A46A6D620F3AA11A76BEF5BFB7374AE441359BDB9A356A74879E7AA9160F995DA75519A4B9062934636B124EB2B4D2DF28ECCA7AE97486E4FAD4E93D914C86AE9B2A6EC1A7527A954077B37696ABD48D253345B24339B6A55D2CF2FF4CB353D9FA26FF320AED517E8468E99AFD4F4CA3A5421C59AB6596CA1053DB64F2E4ED8523AA58737F4F00CD9A9C1F3052D24BF7C6890155766A0325D8AD2489A2613FAE59C5A2DA88AC234A2A7DA691D72742945D6B6D4AAF2E110A0535D0511559904111A8E329DFAB25A3FBCB797E624AD1E878D7003FAF1143865F7E3104CBE376323A2097AD222044221D6A09E4E83761AF4D36D50B7C5C17F7C87DAADCEBFEF50EE4E8BC60F582CD0DDF58B7678A82AA99BBCE0AF10D393276D33E8D1B699A654083266189D6394C5E818CB118C32184D633986D1A491D5CCB44A87A49C097E37FE72B0579C10475F0C72CF2686C70DC5ECB9B67BCCE442B7707077E8E01EE2C1B5F1C1DD03846B2384BB4524481A4BDAE21E5D2F5265D6CBDDC2C911254C4B49FAAE011EFE0A24BB83174C6AB50E574AA28718ED41E3C289A1E3E9561EA3A3ABC602A99D8161D682E96D8C5254DEC7288DD194F12C6304C1138C3E5087E579E33DED6014C17212A3398C4A5842ADF5DF8934AFEF40E4882D2186258C014B506EAD6EB3B85CC1E112966B18ED92DD45B2906F2D5DDC1794E4ABC63C58827CBA22635401F187FEDBA4B60C8786FFC9A876016AE0334F12B1165A22E969D802E699727816CB05D8D89256E1F8D02DB0C538A391C03C44003356B7903482158CE015A5983109D1B3BAB6A21852651CDE36AA57B07C89C38D3F61C2CA28B00BA641FF73E373066BEE01B39537BB7A78C7409FCF275A9D2ED121DA9DFDBEFE7EBED727DA1CBCBD67E8F5F04FBEAF5FBE864DD748B91C1DA43A4875907A88948D5D8CD5ECB10352EC823C2F9EFDF6F4161D1BEFB1D96D8F80C7EEEAC0F3F1F00499D3E3F7F0CFE5E52C5FF1DC44EF4887A8CF8CA821B7D8FBC33DA21EF387D721EA5F23CADC21EA7F4014EF71592D8F21CAC67F024471FF3952DC3DA6B87F06D55D963A107DCE1085FE00),(626,0xED96CD6E1A5714C7F796FC0E231EA0307C9999884DB249A44A5DB46A17556561C7588E45A86C574A849180A43018303836C166B02171701CDBC02426CE30E6E35DCA3D77665679859E3BB431B15AF5C3AABA419AC5DC33FFF9DF73CE3DBF8180E816234B22EF70386E05D8FDAAE8136DF32B6BB30F03A105DBAD5591778A36D84F107583EE69E4F2D08AF123CDD2C360782EFCC80A7966445B24726F14E1EEACAC4D4FADEBCD18E96D13B5419FA7A090F38FFBE06338544877D74F5F6CC13B999E17A151C0288DBD06E9D40FF573E6B053A5A5BA9F77D08AC4BBF11663C68B181C64FC5FB15BEDD43CDDF5F35E7E3E844BDCCC4CE5FCEE99E5455CDDFEEEAEDFE7B57B66EC3EE7F454743CF1D59F42A1C0CA6316F2B8307163AFA73FBDA0BB2D5AC9904E552F3F85C2A6D1973E76B346AB6DBCFF60B4F6E97E9DC5F38754D9815C1B9EE4514FD41348E75049D418AD7D18C61250EF40FF67A269D097A0DE4307C84BB492365F26A1D5A5287E6205E51A6DBC82CA31EAD1160B31FAF8A264A44E3013A82846BC6CCA49DC9A6849A3A9C2AB327A8EFC51AFCB4D5A4BB184A5025135681C61A748B76C1607684E7A4963B087498E9EA203BE45D4CD5175A493314B6D3431D5017D57FD25768417E6C37C9A17A03560B38A4BF4A1725FBFCCB3AAEB9D51B144CD19E916285B783C28D02F253C13568592378B2976B8E96D7A802647186702B90D9232CA19BA557659336076149C89516E34DBA3C52D4C18FDF55A5B7FB9C9C4CD0B2396857819524C63EEBD219A4C4B351C13D4837C801AA26139193C29D64FCC309DD3B33276CF4C3EA3892AF6CA489D6393C965FD9386F407BF35C44A8699A831C8D7F17C713BAC8E3E6FB0DD374E604346076B4244DBC2A3B595800D0971889168D4E2859FF032E165C2CBDFE3C5E7F0F86EC68BCBE9FA6B5EB8EBC048A72C1C999EFA5E3F3B235AF69374FD078C1999B7632B3C80B195AEB5206EAD86F1E2309E19C6B3C3F860183F1E2612C38464497A25F3CD19344AEB5F0796038B81D012F74D38147E1CB6DC76DFEBAF156615BD6294FB0C52EE8F28E5C630E5AE71CA8D81CA5D91BA0EDDA2BE738CBC51ADC08A8D5E7D2BB8CF3F16D13FA3DAE9C353BB06F368D01175441AB41DE86DE34CC3510247E47FE41C94B7FF0E7536BB3700FEFA64F36C96712697428BEC911B9FCD0BF6A0C3EE9BF5099EE09CE00BCC09BC47087AF8E07D8753985970BABCF767DDDF2E3F087EF1E0477CC9FA2171093CEFBDE17F2F178B4DD8F8C76C4C78F8EF7870624F05A75DF0220FACB7FC97FCFCBDDFE73EFA2B),(1807,0x758E410EC3200C04FFE217600884ACFFD02F44499A033D5451A1872AE2EF0145BDC1C95EEF6AD60B34CE00EDAC978704D8D10C93960506672C1EBD15FD152B50FCAEAF7D4B737892440C20E3BCABAB076D9F34A7DFB157C9C5A9D3DDE71A2F70C901AA8F2B7596DB306EC3B80F33203F765ED32D5ACE17),(1811,0xB591310E83300C45EFE21324B17152E70EBD02A2C0900E6D45E85021EE5E47A8534102A95D92F82B7AFFDB6E84644AE298319E6392608863234EA6AC07DC0C6885A5B246203F2FD7BE1DEBD441CC2A43F05C5E41A01DC67A7C3DFA525A015B6E5EE4F23B09C53989D9A6A95B650FC094567160478AA43D712B01F4C1D3BA07FE3D7012BB0D234DA0DD1CC2B91FAEA6A443728CE16BFBB46EA104B4D6BB6AFF3CB39C16E13E74FD5034F399F1868986B0B8BF8D5583797E03),(1902,0xA5974B8E22310C86EF5227F02B4F0E33EA792CAA17746BE85921EE3E0948C002FF91D51B5446D45729279F6DDE3A733FEF5D4ACB87B74EFD7CB906E539688FA0123D07760FAC50BD07A9D4C7CF724EFC1CE83DA89A1F00264AACF3B9D6FAF9D4A56F47DB46A83362EADBE9DFCFF73FBFBE7EECBFB7C3A9A7BEE52AD5E675EDDBE7C769FFDA3F8E331CB7AACC8B32BEFF7B3A5EEF184F385C6E5801D8DC3711325287AB80CBDFE01AE0D237B8AFF3B077829995543596D9F981884C526A90289098A83207890A13C94C359720D2E022DB38D4122426BCC844C57210997DA4F5CDAC52E8B8EFBDC0B72EC4EA6D8D47AC70892C3966E4DEDB0AE81D700FC8C09941142B612270661095384C04CEDCD698A244E0CC2D8FDEF97689581936134F4217099C99AFCDE2D51E9708945914481789A54115D245626BD46A78BB8136B3E8E696A266CBA2D76816AF9EB948DC6C92A5143D9502CCD151C85BB4FE081067D6486B147E6D6CCEC8640D6F0E3067D1645D24562759B3F0E60075568DDB650277169DDB45E29E6322D15C2A7067350CB84C20CF64526B162D448A673534A9BBC8C5B096B5848FA60281EC5AD5C3C9C4D3DA98CDB9464FA6E2710DCC42AFFF450C22F0070F432E11D803CBA50BC48D07355C0F69B8F1A0DAE62271E34145C3450275568ABB4CDC7B908E2E12A8B3D2F135F372F90F),(2783,0xCD5C5B8E1B470CBC8B4ED0EF87F60EB942E038F9D80036026FFC1118BE7BBA47DEFC885364BB4BBBF95BC8C694668645168B6C7DB8F6EBB7E76BF2B93FFDF2F47CCDDDF5A70F57DFE6A76EFC95AEDF5EAEDE5D2F2F5F7FFBF38F8F7FFFFAFCFBE5E9657C7C09AEF5F967B95E3E7E79FD3C5F2FDE9594E7DFF57AF9EBCBCBE7E35F9EAFFEF6C9CBD74F9F3E7CF9E732D0BECF0F1142F42DDE218CCF7D73D50810CE01E2F5D2FBFDF5C7C73174E3E5237E42A926F1FB87148D00097EFFD083F4FD432FC6CB67F8FD7D28E2F30FF5866B0028F80597EEE4106AA919112A4448E3599F20146B90B69F46B04669C7AF21857642B466261AE6729322F580C8E69BF080CC3328652EC75EACC1EA01998F600A594228CD9E8E343E0B08B757EDCC3701187D83A8DB1098D5D1F993705A80C0BC0E3E9C9486E89D09E2E51AAE97CFE3FF4298DAEEF3DF7CE339D95026B9639E71EBFB4499981E63A6D4E494E563B431C5746BE325C98434C368E59B91B770F966E45E8DF2FBF503539E5002DFB584132408A03A4342E1FA4D9080B87C33542C2EDF947CAB487146D5C064A6D43EACC6090A019399A27270FDA6683585D2BB55EF0DCAF7ADB0CED79D5FEB6A04056FE6912247F062590D00E5B85CEB9B75D5A412A2DF2DDF2695E073DE7C6A50251C570A272FC6A56E0BE85B2C4CDA94D758D0745D4EF799E0FF765B9AFA61BC1B45FD6C0719543F1CBA68FA679BF753020D417964B4C3CBC2AFA5F6E445C0ECCD6506BF96913DE512E0B34B1451CAD02CB88C952684D69AEC528A586E654F372A252C55D10C58D0BD409832743B96A53135F1FB2FF41D8A2A25B44E8A2A65F47F8A2AA534B14A962574E24897E6A3C9ECDBB54211A6FBBE0516A623F6B390F7067276DD1C5098D4E33989596981141EB79B0341D4D62B0898D80443C16366135AFE0088CDE8F90360F5518B639605E07878D6A714145A777F5F808EEADDCC3200B33AC412EE218EBBE8D5FC2600ABE7A5D259E7BF8201689D8F521DE50C98A2592B07A55C0739A4BAB916055CAE9B50AE6714646FD6E28A8F144EFC91DCAAB52D0F98D8B5098DFF91C29359BA46C548DAF716A2D216110C9288A9CDB07922E0F60C274180AF5955519D0389FA2F5533E5A2E60C0B9963114199EE4AC6E72282E20E877692FD46205B211421BE6F404740EB232C7F7C592187176FC448B8623741ECAFC56B7AF474370152DFBCC72827D854CC0674C27D75AC59245D1E185604C51EAE554EE1B904F33C09ABF07E522472CBE66002BCFE9147656153424B560CCCEC7D0B7A400066CF4B0D76C9BC4B399ADFB7C2ED9E8B6C379931A65550639E2F3D378B813AAE5E8682964B60ADCD1A058A5220E81D9C520892EDC19A53D1FF0CDDFC06F25F51FF8C2E46D109FBAD184826AC7E122413464BFCF09E5E31EB18BE84A2FC09EE0D6634C3BDC1BA9F6071BDAF4D47731B55E92FA7BE15889FDFEC3443FCFC6AA7D9C07EBC0D8FDCBA3C0B66A962B7BA400B64D83186218A594798E620B38E328F424E1D67A2867C3AD25450B3E908A34D64D4B1E6B30F9FAD294E5D0A596EC24614987D3465B8760EE1AC21AB5875B99C0CFFEB0F61BB69D5B15A49C5AB2334C48A59C7E8EA15B78E604D20B78E65B020BF8EE21221B78EE2732966DD68879A9C9F48661DC772446E1DC937457E1DC7FC55DC3A8281ADB87504135E31EBF6E708C8AB23CD4214AB8E31D141561D672C858C3AD26C2D2B3B870C9F3FE3C9F968B1932C024BF5660C5CB307ED04AD7CE882627F56D83B8BBD9E688F968A354365C53CDBF7660786D26B333CE6FC06DBDAC125DF264E70AF1E335A719EA13612BC584446894CB650D3BDEC783CA93D146D1738B82E6CEA2EF57EEFBA09CC5A67560E42D57862A1767B21C19C7721C85E48F6D97A135845B728DBA8B403CD22C01163C1ACA1B184DEDE97864E366BE75B31BD088BEBDA8928C21102E4671F9772824E9FFF107333670EB53FCEDB9C50B64F43774994EA2BB639A6B60CB1C80BC5D62EBE0AAF9C7A2E6AE440B9435EC881C8D55692A0515C1D4E61CC871FD9FFABE6CA919B5EA35CCC4BC8A42337A53831CC56DECFC3FD2AA5A9DD770E719565B89F4A4F4BB0701FEF43631E12BC7465FB647B1AA0F4B3FBF30C5061190319545E493325655C4C39A082E94C99EF614253A69498D19459EBFB8F8C29936FAC9D09D37BF570C7F60282F25B40FB4B14685CCC590441D362D2019507FFAE9772B483734045A135E180CA1BAC76A18931ED800AD6CCD9357F62E42D1C50D18E776C1F50C1157B7FDB513BDA4158D8440363D6C6A372B8A39E18AAE3F6CC862A1A181F10420B36EB84DDA64703E3F1656BEA4E645E88CEDCD62B13E31482488A9164CD0EBA72C0E37407C145FB8280B2E525411C4D63641CF028C7972D557E52B9DB4194B25D4FFC8F85F61A4D8D8FFBE8FD14A499C76498E194B98C72D2A3D692B6E74B6876CC9A93A1E9316BDE87E6C7A4B1A53241A68C7731C929436ABC1842389FA46D686FEF0AA0F93167DF014D8F393B1B68764C5A3C41A363CEF68C3238A6EC00A1C1316531044D8DC7776D2E38316057209463178C8DB2ACEC72EEEFC565AD74EF2FF715E5F714F637148B32AB62EC59165CB72987CE0AAEDBA996768FB116B545B5D3C4BE7B0541E1F6F69262519AEE52646E2F8C5A8AE290EF6F64156D4BFBE4E79C1710F02E672E3DCB79BCD760FEF9716C94CF80DD4DB3553D57757F17F34179B361571545EE7CDC7F50CA7E89979BEE95BB50B6B443D946506CF233C51F62302FE557CCED53F1B184810B3765C3AFE2359381218F3A438AC15A2DAA76FA3AC90667C8BE99CF7D2A63ED54042B7836353598177270F1CEB10B4B208B1098E113424C222B10B8744F08B164AC40681B9D846DCBA66D7412B646DBA3373AE76F06AC4F796E5B9DCECABE86192ECF889730BE7FFF17),(2998,0x4BB432B1AACEB432313132B14EB432B0AAAECDB432B7343740E61822738CA09C5A00),(5460,0xB550410E023108FC0B2F28ADA5843E66B3AE7BC08331B61E8CD9BF0B31DED698DDC40BCC103233304A94A70A878C7574DCACC02580B1E40C8340BB1FCFF3D4073D416D36062EE48805A65B1FFAE33A3B4501F44EEFB16FAB505D54C2773573CBB841CCD43231C5F491FC15370BA4C2E5B0EE91FE1E5805F7FD32AE9EBFBC00),(5523,0xCD914B0EC2300C44EFE213C4713E967398AA942EC20221121608E5EE3845624525DA0DEC26E3683C2F1985E49185916C1AC5766D54A859048D40B91D4EF354877C8454740E1EBB6081E95A877ABFCCFD88028B1D5E76BF9C25A69605D7C3488063D890A6718E0CBEFB699BB381F5055E802247B7A9F03FD3FB488E7B41F70DBE53FCC02B2BEC6FE9777D8DDDF79A1F515B7B02),(5525,0xB5913B0EC2300C40EFE213C4B59BA4CE1DB8022A852148AD500203AA7AF73A2DAC65885822FF94A767F7423247F1481C7A6964CEFAC084A019970C8D407E5DEEB7E1798E57085BBFC512588121EDD528560B4EE091F2F499630126B74DBAF2C738F6E90DE114969D610E1824E09DAD822C511AC3EC3BA5607134874A48B53424CBAD45A5D0778D478A8A22A2B6F355DC5F5A959752ABFF1E695901),(5775,0xED944D0E82301085EF32276899FE31DCC12B1844173581182A0B43B8BB43D0B8116D52BA3071D79969E66BDFBCB62643A327A74AAC6A9234062A083A011CA9399282200C87F3A9B9EEFD11AAC0694063C4BC34044DBFE4B907272CC1A50FDD6BA77258C0520843DBD6FD0DAA5D354D9E140AA99882314CCD4CEB2CC641D119FB06EA49AC13F8045A26B697EBED91C05993D4FFA199664811A319D76546C136B281164262AC0D5845A922A7B482FC668264C93E98602BC92C2A679F98A8E7EAD2ACF7E32FC75391F96B99AF80466933EBA463C6C22844D4A5FB0F26AB7131F7E4A73B),(10066,0xCD913D0EC2300C46EFE213C471FEEA1CA66A4B87302044C28050EE8E03622312ED029BFD257AF64B2626BE2746E3061727D6AD5152489A191543BECEC77529633A40CC720E165B1118964B19CBEDBCB616199EB17BC5ED72E210AB90FB306208DE6DA009CE90427A23659B9382FE00CB403E78DAB4F03FDB5B4FC60FC234DFE81BD177A13342FFD67ED7D7E87DAFF951B5D607),(14205,0xA5904B0EC2300C44EFE21324717E9DDC812BA0505804A9154AE80255B97B53CA1684949D67C69A273B42614D50C20C224448ACA539340B6A4AEF4A0A50592EF7DBF83CA72B85772E791F2C68CC879B609AE1408F5CE6CF9E06B1578E8EA02CD314F38BC229D49A20D96A6355A3F03FCC86626633F82E6E82F87996919DF5F27B3D83BCB37D6FAB1B),(15242,0xED984D6E83301085EFC2093CFEC7394C95FE2CE88254255D45B97B6D1368A452467AD8AD90BAC319F18286F9DECC700C3E5CBA20A5247B3806112ED72E2841BE9D4F5268ED539064B80C4186A6174D3CAA7422119AE1E3F1F5E5E9FCD03D37871C27952E7C68DE4E4377EE4E7D3AEAF8BB10365DBA18791FFADB0D31E08CA0E610FF4BA0BAF45D37DEA05D56A582AA3120F5ED6925AAAB1775A9259B7555595D2BE598075D58B7B56DD63565759D31637E6DD92A8BF9D559D715D71DDF9B2FAE6BB26E0BEA8E91A5FA952317286ED2AF2562F28C9466A2642F25B1BE07B024D85F765118EBB99C4B633DE1571AEBC92E0A633D63521E6BB333ACF536FC58AE512E58AE9DB664A80AD7BB6BD733273BE17AF6A17FAEEB72BDBF761D2B4EA95416A4A6119FE011BFFDA1FA32851BF707928BE2C639B52D45EB8E84BE51CE91E0CA669C03AE6CC6E960C2FFC89160C76708871D9F7124D8F11907453B2AE748550D4927753269CE80EB79956A983E86EAC294D45AB36B7D16A8B5EF54A71A9E3B19AAE19EC4510D0BAFB6E8288C56042D9361BC13A3305A1224D685E1918B9B276A3927A145CC5A272945C2E761CE6FFF5EBB909FBB450D2691FBAE035BC7FA62093BE8421A4C0C7867FD4614190F850B90337D78A4FDDDD1B3E272692B2D977A5BB3664C1F6ED68CE7D772E66ABD04F51ED6F277352BC7E745C950CBA6A64CEB52495CAF9F),(15807,0xED9C4D6EE4361085EFD227208BA2FE7C98C164C60B679104B6B30806BE7B5A4D896DC16451C3F9D470275A196E18AC1645D67BDFA3E4AFA3B5E38FA7519CF1EEE1EB2866FCF132CA78FAC39CCEBFBAE9376BC6D3CBDFBFFDFEF8EDF5CBD3F7D3C3F993F1D44F3FFBF1F4EDF9F5CBEB3F7F3DCE1FCBF4B30D1F87BFF5E3C93AD70CA787B7A7D1D48C693F8C79FED05DC6B3D87872194FB0F1EC653CC78CD79CAFD7DAF63264830D29D28459F4CC9D3E0FD9B72E4C648B0DE91A1FE6B203876C9BCB903DF92DC3ED19C86F192EDC56ED9ACC98CD3C66D5CEC98DD98531AB764F6ECC70876CD50ECA8CE9E6EF59B585D2634A17D6BBADDA432E3566D7F4F33DAADA44E9315D1B1AB0ADDA45C931CFF7C88731ABB6516ECCF39FBF4D9D583AD34C932AF26B8AF4B1CE5991A4E98D2715E97D3B8544E97DD3FFA4BA14751312A5A8EB9C22C51D4A2AD2DC9C48459A7B28A94873ABFFEC8A340B27AA48B3BEA38A34DB105091A25BA21469E5B5EB24A9209DD02E9A5AB0F4ADDC83265DB5B36A27E91A2F553B698376FA693B89DB81E626ED6C0F9AFBAFD3DC6A8B92E239B712483C572D8F53CFD89A49F5F43BA8E7A274A47A2E8A4CAA678BABE79565419E8B2C4B8AE7C2B2E02E8ADCC969E7953B3FB776468DA7B473C58352B5913608723BDD7D697682D9EE8059CC361C307BC0EC01B307CCFEC417FD55982D8016A5C82BA5FBCC92FCDE3A808A7CC5EEAABDB445E5A74915BF83CA5B33F803BBFF17D81DF7FD1E0D8AD47987EAFCAAE173427F152654E8773847DD45E85B9EBBDB3DB8DBEEC0DDACCEAF581EDC4691E541EE8E2C0F66D65190D1CC9AC5EE35CB432ABF626CA9DA4925EBD0792F7EB60E07C71F1C5FDF990E8E3F381E626E52DF1D9BABAF991BF4C957E6E636D2D581426ABC16A4CF1F83B372BCF2229C1A5FC381AA755F8076E11E10BCDA066B1A6BE5D29EFBC537349482BE8C43F8F0CFE7EF8FCFA78749F0672301D48846E26319BF980BA64CB0401FCB348BE76066CCA66AD8C587303592D7E1166FF2D335B21DD0A7EA98C5B0007562534C2C32595C0C773DC965D62FD606AA13E428336F03366F414A134BCD44134415F2C9356DA231A2EA4CC62857A7AA0FE4AE2759476C745054A12679874C3455589DE405B5D16841752EB492983817CD17D412C40DF989E35A82F37D7A299818C3604B2ED97AAC8D6E10DB4369FD91E810B135972C2426BA46ACCDF5A942437492D05A185A6B9257D4447FC9554ADF24175D2757292F45C27985A950D29384425067980BE54D8970AD61A6DFC472B87455E1FC4227D627E7CE868557D51C145EC8CC9DABEA0D0A40E5EA54B50605FE7275AA5A8302AEB93A558D4143F95CA1AABE90B920C5A1BAAAB6905B08C9961AEA5475058DAE7385AABA42B250DBCB905BDA0B865F16388DE179A884305C457D88C1557085005CE17C6B480A57728B8105F1ACE689B3208A6B32EE3DCBE25963620716C6B30E5F601ACF218B0DCE1BC5F13455DA30773700F290CCB0449E6E708624722D9BF14232B9969EF5349467E0DFDA9EA4722D40F30DC9E50AF3596F7130CF8468F38220C93C13017887A379260338DF2190CD5592351D8CE7794A323DC9E74AB461593ED7924847F2B992B177249E2B09E1BCC65903914E6B2C8CE7F92020D8498ACF35BAB0210AA0105D232609568FA4F40C044A68E628A7A7C53DA4ACB70075F13CAAA7B3073142C37A264D91B079295C57F22109A24BF1BA927859B902BB983DCECD0F60DF58A3C4D11CAE1772016E27A907A6FB1F9C77FCB9799E644054D73301C8899733010AD5CB2EE54E515DB1ACF787EA8A693524A96FE0E79BE578E4097A81002954DF408020AB17C2BC1B1CA32FAC8976083515205B849A48B1A4AE45A128A9AB891488EA85448A84F54222758BC37443E37AE9B0043D4E57719383F5622EC0C1BA0A4C3739545FC0F62E69BD9475A047EB2A4383B45EC805B8D3753D940AB82E8DB96C2C73E07AAAC681EB153AA8F97FCE9477226907167A03A7B653A18C305910D94B090407EC85B35496D7950882E2F50D19C42D9E6BE51F775733885B1D9B91C45EC820EEEE6C7D4336C05A71351BE03A44F1749823F652364012BB9E0D90C4AE670328B1ABD900FA528C9A0DA0C4AE660324B1EBD900F9048E9E0D7CF6F3F5AA6C007C045E7FA20D0576358480787D4B080101FB8610E2EE4ED7B78410E8F1BA1A4270C7EBA510A2AA4B548510DC43381B4208EF9B8002F6082152358E10A242706F134238E7D36A6B0DF9BA7D291B00DFB657B301D63B68D100184214A201F6F15D2D1A4001438B0648BE50A301EEF9FE429A7784104708B15708B121E205538852DE813E37A0E61D6852A9E61DFBFF6B8E25EF40DF0352F30E348550F30EF43D2035EFB8C13FE898F30EAE4B94F28EBA10A22EEF20630835EFB8C367FC8B79079A42A87907F964B29E7770AFE417F30E348550F30E308528E41DDCB34585BCA3B9D59B406F6FFF02),(20175,0xE5924D0AC2301085EF3227483A93BFC91DBC82D4EA22428B247621A57777427529164A417033647E781F79BC9689A7C44DF0DEC7961B9E8A1418144847B5D38AA18CA7EBA5BB1FD319626164F0CED69765E8F2324E4C32700CB75C86D72131902603CBA28C7DDFE607C4439C13ABCFFAC2377A93BCE8378A2854885EF325D96BDC8A340EC9A140700D52A4D0FA9FB631B1DE35051580968C716FCC37D304858826F87FB64DC2BD6FACE6F909),(24194,0x9D994B721B310C05EF322720007E86D46152769285B2905391B372E9EE21A3543619BC97C1664AB4EC1604B209907E19363EAEC36A2DE5F232D2F8783C47F5EF48F6DC9ACD61EBE3E33E7F7FBB95B2CDB1ADA1A4B1DD7FBE7EFBFAF9FDD3F5CB76B98F3CB622B2AF97FBD8BEBFDDAFEFD7B7DB1AEAD834AD176DFEFCC7FDF6FB0FE607A4CBE30F37036E195B6DADC4C08603CE396B88AB38E096BB58082C04BCA795AC7FC032B61D72538C3B039682C0B993A92B96249289BC93882D5B68EE7223E052353477B91270EFD5993B835C641DE0F2808976DAB3D610986867594B888BB45B5CDD8F666E2638432C92CEC7D2708DB821B99614581046D4005C9807236698E8E1364CE32562002EDC7B8C8801B8380FC40B8FCB1704F26209275D7B24C1A41C012E4E04A946808B270E55A3295CAF12C12AF20D62611614E9E663E96A50A4DB931B59BD8A6C83589C5CD2FB39589E0524DB93DB22592025C8C7E22C10D32C17714A9BC0064D490DCAC76D144D0331CDC7C2340831CDC1D2C520ACB2CD69732A3C8E9754368FCB0326A56D9E5CEAD13AA37DB5F023D121981D048494206B5A23BD8330317C2ECE032941D6E6D445F2400E442BBF4EEFEB4FDC7CF3467ABE5DCA7E56E4852562002C8C9678E1616916FE438BD32780C5651DDF5C65212EEBF8AA1DAE5ECAA5B689B73D602EB34DF5FC7EB6B8D436ED5E7983EB81D806B85EBCD791A28720F188126C19D4036AB0137381166C705D608E9EA05C62891E195C628D4EB44B6CD18B1A97B807DB2C17D86188A5B6C3AB194414224CCA273BEDF904C63C917AAE99984FE00CFEE23E1258136A2AE7137B03A2F491589CAA9A1D647391D89CF3BDD37C6275CEB7A5EB1F0D21BF57CD716B83107DAC9FBDEE9E9B39F607F4348089050A74A193890D0A1C4926132B14B88C9F4C527B5A49276F141E8F5F),(24195,0xED534D4F1A5114DD93F01F26B36F75A0A08C71D36EDA4DB74D638C19052D35806134B14192796FB460F12B058BA6A0A168414529B68AF2A13FE6F26664E55FE87D8352BBE8AA35EDA29B99FBCE3BEFDE73EF7B47911D72C42F3BDD6E57DF8022BBE4882A7B64712AAC0647824AC0270EA8B2E490C5F67A951DE758ADCA568F6F318BE40F8E874643B31C73B85DB218893CEB20C293F0B4DD36671E69AD66B27576687C88B1B5E541A1BD7EC9DEC63B99709FC50F381CB1DB86CC52A9555BEA52E78611BB4A54EEAC8CF4EECDEAAE1EBE63D6CA8C74796633DDDE2BB1C3F4DC736542094D2AC24B459D197BE59F54AC341B2766E10B67465181A11550C4A060A6AA5C6F6A1BAB0C0A185EE534B695E884B583F6C186156237EDD8B2153E7EF1D4FAB3C6BA992A1AD95DA3B6C63BC1ACD1E84F535267020125FC86638F1CFDB7E3143AFAAF1B7120FB409680BC03921080CE03D90492C3056844F2B83CECFC9BF040B86E2C022923C4E79029013902FA09F404E839D01B402FF957235DD068A458ACC68E4E11343FE6CD6C1E34CA1674D0EB40CF399F9E01DD075A045D075A4670481A36163556D9E2CCA5B471526D932426C1012062B7D96DA0AD80BE08FA1E9038500A3409DA2AB6C0760AAC52E19AC869AB9E3736297E593C6B64B62DDD0596C029D5418F819E047DD7D24A8164F108BBC0DECB6C659B1334D26A6630B8558CFD1C829EE715B944AB494C424F81EE80FE958FC3EAF34793A4681436405BC0A9B2E6F915A9027D6F9E6089CFC871F44A128ED35CBD60992256BD394CF0E1D5F1A47513794E25F34071FED4BAC85E7E91A1719FAAFA4341119D2271A7F45BA87766CC17B658B228890351156D24FA66A7C34A97E894457F60C23209865E678FD7D323F58E586F4309FABDA30F5F4FE17634EA97DDEE3EA747FA6D2F7AFAFE012FFEF259FF2193DE58E3DEBCEA7423787F66FBEFB4BFE8B4E877),(26116,0xED9DCBB2E4B61144FFE57E0141F0D9FA1887647B71BD18393CF26A42FF6E3E1AAF3088EC4E2646BCD1BD52686C977B481650C83C55F8F566E6DB8FCF9B9DFBB1F9E5D75B73FBF1E7E76D68C7D92EFF66ECEDC7F75B7BFBF8663E967FDDFECD34B78FEFFFFDED5FFFFCFB1F7FFBFCC7C72FCB9FDC3EA6F59FD3EDE3DFBF7FFFFCE3F3F76FF73FB6EB3FC7E58FFFF3FDDBFDBFDCDD3ECCD82EFFC19F7BE04615D82E7F3ACD4BDCCF5BC38434D99066EAB7904617D2FDCA9609D9167FA565420ED99053376C213B51C8E5BDB776B25BCC9E8939FE7FCCE5FBB1FBB31C988853F62FDE993DE4F874C8E5E798A6F8CA272A66FE6337D3B8C59CA99899A7B966A669F7A0E6F9145AA20EF97C6FA76E8DBABEA6BE19D767603AB7AE10E9BFFE1F657EFEF648E4F9EFDE9C30FF5DB25E25FFCB6B2995FFC5759FCC7FB0A6502B4079E97B7E0540CBD4F3F90F97292EFDCBCB1497FD609D32CFA7D0230BD5F359F4C84235D9A65F5F7FDBAFA1ED5A001115D0FAFBFBFC4319DAAD02DA22736B602EF2F27718A669F0C5D5AC8C6CC775D9BD479EA4916D677CE4918BDC15B2640F3C2803BB17B806EEA91236FF28C6BE0BBFB8A302E77FF0388697675571B745BD0B4FA215FEE0397A10DCE923FF83DB610A3F983B7DE47F703F5AB2FA587E493B1737766AED3C8859F1FCA12A16A25FA9AA15A27D5D552AC4E5C7BB5678CD5A6189FA7CD18D4E30F70264FD02DAD99D94885D667D26F9EF7630C69ED966D02BA4B783E57FD61DECB8737B663F3808BCBEC97E3CB521AC297B10D9AD0ED481B4BCD45207D2F2524B6D08E5BD903A9016F76D729329D518E42653AC87C85DA654BB919B4CB1CE24B799F2FEFAFC3683F757629B411B2CB1C9C01D96DB62D0164BED30688B7D3E8DD0696809FA7C22A1B3DB12F4F94C8247CD252AA7EF168FC64B544EE12D1EE597A85CE156921E96D59E2BDC408DD55639A95059058E542D9500A86E9BCD38CE49DD2633B86205F5B50A8A785B555514D1B67AED82C2D73DC282C29567572E28E2DD5F55514445CABBA0781714CAED545A4F849D5F594F842A45564FC41515595014050AB6A080658AB2A2F0DB1D955655CA142448B4545E950594252A955845BD67094A2516AAD34C330FB6BF176A5FA59E12D63EAE02B870ED135568AAD2272E24A9DA07946854ED935F567D4CAAF601351A57FC80828AFAE091EC431D21CA551A9545A04AE36A1F50A571B50FA8D2B8DA0754695CED03AA3469E9E3651F69E9E30A2AB2F401C51F59FA00D9873B50A02A8D3B51A02A8D4A2B54A5516985AA342AAD609546E515AAA7A8BC82A51F9557A84AEB6CDBDB3572DF9E90D396FFD998A9D5E24DF66BD47F6F3DED75F434794DD9AF5BC3647B6951B9056D4F496A0751E776A65990070A602A9550B15AA1FD82A82C61014C25132880B9B21214C05C59090A60AEAC0405305755960B60B2A8CC045DF3C9F4C32CAE2A935A952B2B91A4C89595A85AE74E6BA0AEE64E6BF9A0FE139029D5E92720D3AAD7B0ADEDEC89CAF2F8D736DD89D2129D58AC4CAD4E1EADAD22575B4EAECE2CAFDB0B6BDB3D692D275867C26E7BEBFDA3B5DCA92DBF17B84CB0DCA92D1FD4E5ACA5D2EBE0EF3F34D3B447A5B2EBE865F934B054761D8775CF80CAAE42D87BDB1847C11F7DB17DBB3FDB8EC34B8EC2BA95ABD3E657EF7AE79486906FC8538A221EDCA7D20BE9171DA78A6416C3ED4460BAFB472093456205A393E92291D8D251D9D51DEC32F372D6DA8FC35C7B2E545BE6717B65FDC9F6DCC3D5A133E36BCA2DFE34FFB6F0FE6A0BEF27C92DB1DAA0545B822EA2545B8286A3525B12B989935BF251DBC6382FE7327A0B1286F4032F08C1058B3835465E907A0B1071647A4B7A2E96292EF1199E3B119605279DDC921EB5657A4B2A0CC80497F4755D5B72895F579566039DDE92686E4A87DCEB83D7925B9036C465171271646A4B72C8D4C92D49CEEA0497E400AF935CD2EF40ACB9387144ACB9382947A6B9C4BA934E7289562E9DE012ADB13AB925D61D49B50589A417D25B9032540542E1D4162CE25C486E01CA10A7B66011874A2D30FAACA752AB8CC76CDFEB386F87B87ED04B43DBCA30BDA630F4A21C4E245F0985212FE2A884A1446E7883389701718086271386121147A50CC56AD35B187A36E8CF1286CE77CAFF2C5928D544941C4EA07BA41C8E571A64B250A28A285521FF09285521FF0948319CF00948319C20E2C974A1F42C5CA56B54A70BA532C35710863CDD23138612BA4709E278BA47A60AC5748F4C134AE89EAB4B428980A5C57002DDF30A180E6491A4C2AB6723486928BF74B5CD708AC5418A139762401BA3320CCA58548241198BD48690E244E51710C7386908CB58FAF9974B502AB7A08CD537CDD4AF1FC2303A196B520D6F5E1F8AB5F3A941D6A5B3FDD87F9C98647D1CD94C364CEC948DB2DE9EC63C9E9A657D5CE7191BCD7026A659AF91339733AC3FBADB95993DB46C9E75B79EF9E7E6E3DC40EBFCC927094CDEA77174529BFBD79465DFBCDE9BD7D32C826F5EEF24AF7710D558632EA6CB2201994AA9B2D84B6514107B39F90888BD9C7854167BAFD520995F4EBDD6C729470715BD5325A5B85EA000A5B85E101065C26CFABAAE2DCDC6AFABCA303F29AFE7B57952964514A0ACF778DB0286FE942C0BD55E2EBD9034CD6517D290A5B89E17A3B4B85EA000A5B85E4021A5DA6C4021BF428B64907CA5DAACDF14A4CC5E601665D26CCC2CD66840266559C42C6AF3CB338BB2FC8AD82C4E97C5C234975D650D99936581DACDA9B24898E664592C4C53998524642AB3A0DACD0DA385C234955B4898A6320B0BD36668E6F5F70E939EAFDCD6713BBF6F0E7813967F2D61998F79D7AFA580659087845A5EA46449B53CAFBA49B53CAF100AB5BC48CD546979090C4AE5138241A98C2A5A2DAC9657F6C95839AFECEB51821EF4212945AFF00476DF9492F4B0F04A087A502126F43C24E6126A1E14734929AF2CE692425ED970A5853CA0112B47539F14F2F241FDABAAD3D3AE13F252C9ADCA144152C8435A66952982A48E57968839190F88D99C880785774EC483360127E261CEB8CA14414EC383CA33A7E195611956C243CAB354C2F35A93B6A9DDEB621717F162BD5129E179655426902722AE581FBF672CA9E1217D9C53F1A09ACFC978D07BE0643CE89470421EF47538250FBA509C920795674ECB43CA3397624079E6E0E5030DC79D8B062AC1A0F23CD48097070E5E3E78024E791E38911C29CF0377B52C8030072AB9809E3D50A985F56CDB77C3FAD18E5ECF9E384CF7B85C0C982E415A97AA66FB7102B42EFDE6A90D3C34415A97CADC690CE079270D6DA726FC6A92B53E7A207D13306E82B52ED6FD53F8D5046D5D385A27AF9173690E4FEDE33D2D5FCEA5F1CAAACAA5892560A14DE33C15A14DE39C1FE17D34CE9F12BA34DE4653AAC95EF7D58EC17012B5D2A50972BAD2A509D2BF700E46702984264DF05384264D707E54264D6A52295D9A60A8295D9A60FE29DDCF60542AED4FEFA9CA5C9AD850A9717DE8DBA579359746310923BFA7EA7D9A58F757BA3491E8ADE4AD23895E3C7DF81C6F0DCC8F6BDB3489A324F36912F74B397B3838754A9726B215952E4D303EBE804B132CA58BBB34E9B08A3A3AB2CEA749078168696B3FB6443D7C78169B35697FC0D5DD9AD85AD29935D1EAADB36AA27D4667D4C4D6A2D8A7713EA8CEA7893C5BD2A5C93F81D6DB75DAE472183469D3404B49D9CCE02A79CEA7013E15E7D2404BA94E3303E9D31CFC58EFFEC8BA1962A3AA4E3303E7D3404B894A2E642951A9F590A534AE9FD77466764FD143B141D7D7594AFBC23B0C954CA5A5C8ED6A994ADD1406CB746AFB2E3C10ADA994BC46ADA9D44C7378D6A4A974FC1ACF0EF14107C197F394DE9D3FEFCE1FB9A0FEEEFC7977FEC81EEABBF3E7DDF9F3F694AEEE29BD56E7CF51588726919ED241D83B4C25F694224341D9FB13DC0FE9CD05DEA9B9B8AB747AB63AB2EAC49D3FC3294F0999A0A4A9842C5BD2542A6390B4AB540637595B09A0A6ACAD04E058D65602382F6B2B15F163D65402B8346B2A41CF5266DBA63D35CABB41BC1BCC794AC860D5F6FF049F42692B0553453B216B129B4AA957A5B49582B1A69D90359F3195805B59E5B258D253422E30E72A41CF9AB395A0C3CED94A9007E07C25482F70CE12642D38670992219CB5040D56CE5C42066B8D117423D75D973927C58AC6C8D9B6C8601DABB4D78D3566D08D9C6B8B0CD691EBAE0306EB586306DD586706DD302C15ED1A7A6E9DC1CA1951E39130D3BFA60FF5C2BD4D97BB4D22FF339D0547E9E57965AB1DE6B1466F538D2B7EBD082FF6A19C61A0F4A182B921BC4D223262844654F08C84465470B7544654E2C3297DA8601956B93A5BDADBE40D5ECE87821D53C2BBB3DB6938E3440177ABC6D5D98417052D332AA58065C6E978C032E3743C6899D5B83D5B6B44056B47797FB67720B4F7677B774B764F8BA2B529FF08F4AD4D11EDA7B4A112E559EA4339955C3C83CE7FB15A27CAF90F3A272A9EE925F5A18205A36D1DF48691B875D0B966521F2A787CDA0CF39D3D35A63CEA5CA8D83DD6D950B17F4EBA50C8EC276D2860CB932E5419F4A56DA8329ACCFA5080D3667D2800ADB34614C0EC592B0A10E5AC1505BD79CE8B3ACA86C1CCD309370ABAA775AC5ECE8F42BE34674721AB57EC4679C7A4CE35F55FC38DF2DE99D68DF29F97BA45B73DE3464117B58AE5CB1952C0F2E6FC2868FA737E140014383B0AB1149C1F05C10FCE8F022C016747219682F3A3DABCC4D19AF6BE7F8D5C7265CECCDDEA6D8C7B6E8D5C6E215F7AAAD1A33B71C95536BB27AE4537FF58BDC43751B9057DE9A9CA856313D7A37B2048DD7DE989CA2DE84B4F5472F507C935D8613FD44C547221BB7BA2920BD8DD33955AD0EE1E6DDF6CB93077E7ECEE9C00BCF994ED2BDEB896589FC2C64B67D1AAFCEED849BEB0E11DD9F2C2C64B6F22AA0CEFD8EDACD21E26F3BB63034D697707AF4F6977478DA74ABB3B78A82ABB3BF57B857E77B0A6857E7730D1557E7762F74B47E47A324199579EA250DADD81F890D9DD09F322F3BB136F5A6578C726FADBEF7E36E817F7BB635756DB76E91DE4ABFBDDB1372F73BB5357566916049D5CEB777B555F7CEB9AF320C48EB7734CC48EB7F377E4BD974305CFDB7B67E2DE4BE7F4E93CEFD896945ADE9187AA6C6D0E866F95D66671E3E5998BD7B0E72F4DB040284813ECE4344F487F683D6FCFAAE83CEFB8EF4EEB783B0648EC78BBBD51E778477495D6EFF62498D4EF0EDC9AD4EFF616F257F0BBBD397F75BF3B768D74767794B45AB3DB9B713AB33B760E755E7764726A9D6E6FC8EA9CEE68ABBDBACF9D6C895AA7DB23043AA73B595F745E77526E68CD6ECFA8E8CCEE84A891DADD5D63FA337637026A48BB1BBAE85C8E65CEE2B18B4EDADDD045BF8EE18DAC79CEEFCE3FD6E0A253E9855DF40BF9DD074FC05BF3547261179D4A2EECA2737E3770D139C31BB9E8546A955DF4252A955BC506F1CD976B6CBF6D8C4B09B606B7EBBC656EE072A1B25937897B6CCEF93FD82996AF235CC63A4B23EFCAC71E79D23E8FBD2EDF4373D3CF8FCBE831FC6A6EFAF961E8317AD4BDF251DFA5AB3D72A78CBC3C8E30EA9B9B7D7EF812C7263C696EF679A1040CCF439B8AC90DC3BA4CDC4A007A993288C121F66A83201CA2AA80240A51FE3CC08D50066F3E6898022E8466FC440715DB935C81AB427112588AA8510EFFFA9E19120EEBF6EF8938AD3D008D10474BCC7710A7EB07500C420C79006F204EAB85A8CE3827349607000FC276387C599EF0211496070817E2B87E1835E058C4B1FAF86B753C1A71AA2E7CAD0E9D238485E307E0293742673410C621CCC77CD008C6E1B8B1228C4388F7EE8F0FB550EED087D863D26D2A233E9C1F80111FCE162A233EA44B9EDF55BD6ECD3DD5033DE5941B00B921CE66812C0EE788401C49DBBD1C7AADA55EAEE74566ADF93EB56A973CE1456400420C7668BDDCD0C02DC61ADCCAA5E40F4E775AFFE47673DF73AF9EEFB2BFB2599963B631F3A02751A27B21B40C829FF022FB12629C528B61789CB20632A2BBC6A3DAA0A3309148BAC8781A4977E54882B76899C73090474CBF3ADCADCE341AF570135B83FB74C400498203C68704C1E165F6DC8208E829A213E8012089E8857A8442209AA11E6126881EA347080FA2CDEC116662D68EB47035AD6994548E1D5D7940F45A3D42E5CC4AE06B68FAE9845D0CC911A28DF101CC85E80C7B00CEE26E90031C19D71C045042AE3B0AA284441BDF23741AD7CA84184DA28FEF11989068E4C3E023D1C8F700A3C95DA308A9AC3A505615268BE8BCC6F8D4CC255719F4E2E0A9FC430D176E5421B266EEB76624E4EDB03CB5FB19418664459C17070E21CE8B23D210E6452D0190F29AB9112C9927B0BEACAE1FEF0B560D768C839F013B56051DE3A6BA3C408E8DDB716EA9BFD7E07204CB0C4D0D046B8D3CDBC0056909ACB68D60262D81D5D96DA7541358EBB2BE9D21D500D6FE9B3701BF0281B5ECEF4D082D26B04CDF5720B0D6D5A335E1F3D001589B2AD6DCCB338E6E010816E54103044B4536A56C0FE518E73766C7F62861318F4B0961B1804B0967365581C53C2A2784C50282A4BC5024F027555819192C14532D1C2982F81319D915134852B02B0038D2D14D0EC152623D118527FC020230289CB214F24A89CB79B44F462126109E9498F4C020418C1888601160473E68846011BC8C410816955365048BE49A008245320700C1E2AC25846091D84519C12279837C49154D3CE00CAB03B1C30D7DE0FCFB7C507F2DB40C174B59A93AC09816C10AF752A82F90A8718B4640B064667B826029EF27F10896968EA88D319083DCA0D75EE7D22A72421C020E483200D0112419F0932717F989635A96C3F32CDADB7A1CD8A59E0AE586C4D5B8114C3BCB2DF062B24710F3625546784931CF301AADCEAD423A542A8152C57797397A547ED3DAA027BB023D4A8E3845B014473120588A6C8000BC18E76023048B73054173313B4F00B443B3CD35A05F993431E17D3255908B1AA3A6B44C979BC8A0C4A4E2167019DC17D7DE5C0748796E040B7200964707F6C53527E78D8321144AFE2E9A12416327E5B9166CEB43793C04D5B8F80083280526230EB3CE056B1C3F8C89492D84E754031D329920B93AB22DC19D75145E72B6ADC337EAD8EC847155CFF4BB7F5ECAF5C0A3B33ACC373A2B92741FA45CB584E709BE0FA298DCBBEAB2EFCAA398DC5F1FA1984A12D39E61BB00DD691A2A2A42314DC35D5D87604CD370C3FC326E5242639A4636772F46274D23BB142FC23C4D53E7FE3AD3D4B9C0CE34DC48BFCC5348A84CD35499E967B885168199DC9E80D04CC32DDF0FC0999DD99C4B631B0767EA68C4F03750C3889BEB3E6CDB700D1CB11DD7AFB20A8ED88D11E928C5115BBB7B246A1C715702E6F0ACA53CE212D80EF466621090C86C7C061189C459D820D28D5043F2319361A0C21B0A3D3C481CD90F83862B0A85A3D61C3AC9A861F9A009394A284C873FD593A3C2FBF94E02998847E3D851808E718C2FC2B1381A19617E1C918B80348E1D46F01C37661341A984BA76183500B41C8F8E504FC21639FE5CFD58B81AC3F6084BE4F8A97A2A97E3DC0192C831A9652491A3678B482247B9660E9191E4C1DD60809044EEBA058024725743402491BBC8022089DC6D2678D69AEC3EC904F4E37AFA0094C85D6702F049EE32138C7A6A076179D25106B4C48E9876189897D5C553BBFCA0B54AB79C69E7F839DF463B162E5C48A69D2FE5503472A2E3CF435EE3E99352BECD53BFE4984884E7920338019E4BF2FF08A425277002EA97EC00401CAD74426234BCEC4B5163E2DB2FDD36568BC853E658C40F2AD154877BEA58E25A37B646B867A50B9C65174AC6941F893D0322910469113E4902CA682A5C9581554A16CD6DB6DA9965DE73BF3ACC90021D62B2E70EB5549AE127A39BA2654BC748C4480BE95F82F11E72C0CBCF05D40228F74127B4335A1ECD423BA3E55932B4995D1C9C425BEF606A0A0D2094878FD0B804189742930D60C20B8D8DC049293AEE33A108B97E2B8080732D679000D74EF5F4D8A7744862E8BFD4E2998ED8E7DA3A517701D7C405FB36B8362ED8B7C17575C2BE0DDDBCD098DAE79A3A41DB02397F1281F0BA31AC09B6AF25953D5FAF239513BE5E4C2A0F1520F000D8EBC6D1C662B50E808E7B0CB84636D4C0C23D0084FF7289D0657FAAC77FB9A445F82F975C65FCB7C6DDD855E05F2AAB30FACB9D6E31FACB9D4321FACB9D9A11FACB559C18FDE5CE8C18FDE5CA438CFE723B02447FB91D01A1BFDCD20DD15F6EAF2DA3BF7FFE0F),(26118,0xC596497283301045EFA213A8D58D261F2695694116762A382B17778F3095ACA42FAB59644717C543823FE8394FF936674E53E0D373B6F9B6EE93FF9B42B213491929E4DB925D36673265E46D229BCDF2FDF2F1FE7A7D9ADFCC69293CE3AD0B71BB8ED97C5E96F93A5FCEDB28D9B0B5BC5D8672E76B39DF9F9973C1AF3BD9F6C97E943C670BA189A6989A506A41A9074D761CEA0EACB4B97DC6D0E0128F43A50B9571E8D4869627A3A430CEF46DA6CF863889575003A64A884E21D4083FAAB31215D07440A84D281DF1546C5281A97A02684381A9FA0A686381ADFA126863B1B1B0061AD47B8A8B4CDB8A29FEA6F803593B8D275857179A58EC66AD26C0BB59ABF105CE5AA58381240E840D08DB03C108E2561DE1206CF55D83B356D98ADDACD5F477276B95872294B5DA43DCBF84ADBE183A67186587757CA5ED0560AC03BD40C4CE866DC9C40F1EEF1D7BA2CAABA888A6FE9E87FA868442CDC66D2C2C9BB2714A5C530502624F4417687489B865349BC6567022B5DA42C04EBD3892543B082064AF5B847974DBB85892A75A5A212068950214B66322878DB2AF70548DA04D76602D9EA0BC8161CA7F71CE4E6E8CB9AE3F),(27973,0xED924D0AC2301085EF3227483AF9EBCB1DBC82D4EA22428B347621D2BB3BA5E2AE58085D08EE3279E17D9979D3C0E0996058691D1B309E1915A8572495992BAD40793C5D2FEDFD98CE14332C887DF0663E3B503B2C4282970B0FBA0DB97F3F3520A39DA545C863D735C383E2214E096A9D203FB0BAD05EAFDB33287857E43F2D33AB04A2B7CC4C74CDA544EBD9D49FB17D438A15BB50D6E68FA79450EDBCC6730BEC8CB54140764B2C8262665B877F30BB2E2EEF9DFCF402),(33837,0xD5575B6EC23010BC4B4EE0F58390E5308816574A45A10AE9478572F7DA3128298FAC13C7C8F0E5B006CFAC7767271B54782A517125F86A831C4F4794981DF5EE23BB3C73CCF6CC3E29FB04CC847FDE3EF57BBD2EB7D9AA8D03B70B505DA8FEFDD6E73860E6C202B34AEF367579D8B771FBA5390C18936D7C798EEBEDFAF6046817E276CBFF93CCB6A6441609AD3B6008AAF9952C727FACCD111776DFD7A1D6E78C93F061183E84279BFB11E06DB2E131DA2E1B53E0D2D91E89B5695CA98B3BA52E2FA52E2296BA20B32F6DC60AE9C7C9406D1C681E1734710D0EB4E74574A02101D09EB2D2818EA9840634F701CDFC415FEB8B24F4A5577F8F4988B01A9F53617AA5371DEFBC2A5322A7F0120AFE6CBC82C2CBC2F012453D51C5E51D1557CF302C8691F068D365E1DFA6F12C4B1C2D1CECC90407CE604F2628DB833D99A00BB91E33CA67CCB806992E2B4413CE3F6612936D72CC2436165F6BCC94285FCA26D9B198179CE577C62278BC5586BC142F8699983F557921C40832577A4211E89F309E83697D3EF75540A1A47C60518C7F318B45647597BDF8A1DAEACA1265F3EABE6BEA784C441093710E8C4765C2C3EE64947780A84C208CC928D7C6526632C22F4FF24769CD17DA1FA5E6E7487F9498DF20FD51627E8EF44749F965F3F903),(33882,0xED5ADB8E9B3010FD17BEC0E31BC6FB31ABB4A112D5765365D3876A957FAF2101820AB6B11962D03E6DB28670C673E6CCC51C3470FD59694125212F074DF5E787E63AFB28DF7E64ED77AAB377A8BF89FA1B10B3FCE7DBCFF2FBE5B53A662FCD3AB0FA03887EE9F2F777795F079DF1E62FD3D9B97C3B5CAAD37BB35EFFD33C8C11229A75755F2F8FAFC327988B4072D23C8CFD7FD1F05906CAF5069AE082063B6873A304E98FD98096F575BF4E97F2BEF79526D3163C6CCAB40D2C6EE3BB5D729B6076EB5A6998C6DBEF47385CC796CF847BBDDE980F23CC8796F99824E2842827F399949ECCE7232C02378BDA07A01911E49642A9A7B8C52CBA59C6959F3910E091EEE7A7D1431CFA10671423CE606B6407432FE68C91BCC867C4C82A81ED062D19D039DA6AE74CEA42C4DC42D47A71BE11953616D0D552D983F3D2C04AB728F0C558DE75D10459DB03C2D2C2137CB0F384CF4A947D6848785C22244F9788840B1E0AD80DAA88CC05B355264F2C139B2D539E0D2045CDF05E5C113007EAF354CFDCA5F219DB1A2022ADDFA60DA0898848E7B744A05A24A4F75B12585BF91023F2C1318B10ACF6002B22717A30EC52C481D7DC08DC53F06E70D993B737AE7272313AB98E06AB705AB9FBEA799606540B8BA34ABCE5B1D6FA4C73A2389D12686E3E48ACE97E5134EBFC61FD743E96E7DA5462B5D33C5148CA849FA9AC63109A2944869A526B13F83A8D75718B678988B064DE09D24D2DF12C81504B628F955C99E091BEC10735F7E8592B1DB4240D3F58920BE3B5B7D2E99DDB59F2429AE77654292A2607880C2F76BB622D4C8542AAE4342D09E94FD2B4E4EB6023D936006B248953AF32C20BC2A74409359481AC284AA8A11C6549C8992A9E28C514DE098BD2D051E90B13165E4C7182C5C5493025989C6AA6512BA6F066DA901AA80252A45333C5047552421B65C997D0FAB5D30302C706D036C6ABCB4A974B66E3EAD5A5B162CE57974F0905E4928DCD5787E7E748710B84F088BC40A928A4E7200C5035A83B9B0C4C70A669003EC710ACB4106B88CC45E199A9C7DE8C7515AD03A787BC1DFB48BA55B474E0DD24DEE7B5CAE9C08749C0AD550A28C9CD163EA1728D542806AAC83DAB24C0AE5C5757DB9D88D46ED24640E5DA13782B6A9B627ED894E05A4BD8F4D259931F18A792E523F941AE51C69AF6338F4A129053CF97057A07ED655483F80E47A45FA8F18AEF4B1C7C67C39AFD0CD0F63A76923EC9BB1596D8005AAD554A7050664FDEBD48A4B3C7F611545AE332BEA131A4D8D068EFFA0F),(33962,0xED5D6D72DB380CBD8B4F409094442A87E97437DE99EC749B9D34FBA3D3C9DD979623399E4AE087040A62F8AB4D1CDB8044E13D80E0C3D75EAAFED753DFC84EAA87AFBDEC7FFDE8757FFA71FEF6D769FC59F6A7EF70F9A9B9FC04C2BDFCDF1F7F9FFF7CFDF2F4787A70BFE94F66F8B7B9BDF2FAF3DFF3ED6539FCABFAD3CBF9DBD7D7A7E7EFC3EB975FBAEF5242C0F0BA797FFDFCF8E5FE0BDC1F1923C5E5BF52FDFE47F7DFA54E0F6F579BC5CE362B0936DC6667747BF9BB7F9E5FCFEF97FEA917CB1E7CB828CB4EA8754E8C57C9EF81BB5A6F4F3DA0E68ED78389B96FCEE0C68AB69D59F730AE7BAA35E45EF438E3DEA5B40E7347CFAC1FF0AC9FDBE72FDBAF57D81F7F33000C58E1BD1B2DC9130D02AEAB4F7F78FDF9E5F1FC727AB85C47CC55F78D9DEAA0097317126ED6C76F587610821CDCF08E49504ACE3D3FDD002A6437CB8582E49B35C44DE8C203F353DF523AA2D739A2621CD18CEF481BE388A27444AE88034A4A080CDA6A824C324F60D52D89615C2E16B074C47D630342CB184F044B4F5613CA2E84505E03633A43DB14627C84720C7FE9E6EA6DCD953E735B565757A184630A65E9F6CA6DEDD5C7CA861AF4F24E61898DBDEDD1B2372524483D433F559684219DBAB9B80C52744D20E70162A6E0528335001B99FB9001EC940125DE11105604E2EB5C0EA73CF87A77D39393B8AD210B41D86D92CE8D831402B177F730C5608AA2C610A39A9918A50F12A302FD05E22420778CA28CB69981A3CC70AB03C3ADC7BF1A6ED7845B7E7886E4343CF1011AD9CE71D8617DD3D5B9F2D6BB69912133C8556838383430DC4D41918127945568C8000D1DEC010DA2A9D050A1A142436C1C700B4088B6C24285054258D04DD3B67206161AE615A5E1ED0662825005B90A7215E46241AEF1EFF48F0F229B284C561823C0E40088E385C91E88E387C9C84E3F4F4C36B66D177679C8DAEEE4E54AACC030D59836305A4A4A0C9BDE9BE686D48D0DEC829494F80563BF749A1BD6DA26B04D4D1263577203A4FBBC2EE65E246467D3A28DF7CDDD799911B3A675B9EA99C8015A1F575FCA656D7281D56D7DA598A9360EFA4DABAC303341BF659E885D20D498D644253074BDE3B95331D2A4326F2AC63BAB64D3DE96B56651664ED906B45B4C31854D1E51B3CA9A550665951C4B2248FF38CB24F8C287964E031E820F69367C282FB5A33BA859A95DA57695DAF91CD999DAF90E06DE854736E8E8D918E7C745F1020C2F2E1A40ED787151CF86013F2E8A903B8E5C14391BC8928BB60ABAD6CE69890C9BA3407AC6BB5B0EE6D61FCC4DA70289E8F5B8BADDC915080026E74B207F7B5743209543409C3141BE44896D00A92202766334EA4C8A2402502A87588BF882EF2D5C4FD5478822B84F24D50EC16E0BBEFF30AEB1C0407775C6ECE50B04F912A5E9D2EDE58B0CF2254A3188F4D147B6673BDF937F187D9A80E73E4E9F86F4B1478E52E1AB4BC7AB51ED25E2843FF23A5EC4692F592D1C1E75BCAC16A9D019E2080E28EE1BA1B36DD4DADA4BFA08CF5EF55AE923F07544DE11EF7485932BCAE42A714CEC9A8DC13E71869142B331185740DA40A267637B7D0A482B257ADE9978B61DAC91EEB2B9BEBE32C7C869D918DCF90D5EA9E8B6B1C1E6609A63F6589A637034813FAFC21F2FC93CF04AFCF15224041CE12682C8C7601CE218AAD0755A9A59F17C4328820C68B3B9BFD264AD54815B9F9232599BDE9BA9F79FA8C894FD28065111005F5632685905566524655506F7C35FBC747EC8C07C93FA4C49B24ACFE847740657CFC6206EEC7636C6049430A6A8BEFF298E82CEC6703A72E469CC98E2EFFE0BC0D3913145D8FD2DF55429A6189A62E9B6771F294FF03AC385942514AB335C9D01A1E70EEE524E30B9B045B112D6E36816117BDFC491A834848EF7664D430AE02795F332E3BC65A4B629CDC92B58CFC718966BDF6E054B27311767BFCCA8FA214E8707B15F269C129F52C28853E2E4974F9236D1CA396900437D146E0B4A1657FAE24C923994B84BA90DE7CF5AE88AC385E80D559E5C6BC311B5E1D4825B25C9B5444C766111A6CC2FFBA8A5E24F5D2A6EE49C1C7FEDF3E0C7B9CA2886D53E8F557ED43E8FCAE54BE5F2B5CF23C1D84AE26B9F076A6925EF859277238C6C1686A65092F735BA4E2EC65B13C84E3431CB5AA54F25A4B081F74B13B39335E4DD820E05764D4C16578D42368D0ECC413457D533F7794AEB70276227A4DC3D7DCBCE69BF73B9EAA5D333C6C35A8FDAFCF824F130163F23353D2F3C8C45F8D6EDA9E060EA00BBA0C46CCDAC231C61993B09A50BF3594B6644A09BBD6456404D80B2EE97B7CEB44FE3B10C7124AE80495850461CD9BCC01FDB5EC92BDDACC5A6DCC5263E597C213D951CB7E03DAA27BC5A31065A2995360B47EE6B7B25D36EBECA2F19F1CB4272965268722199F03E6C9F9C2417DA5EC9898254B29C8F2CF34B95EACE6CCE9D59A69C5E590B73A562C8313E0C97D50ED8AAED8C8C52DA054AD1604C513FC0176BDA40B4CCA0769E5391BA188DF0BDA4B5B757A426D59F473C399648784E21FD4234C289074E2068B2FD9086BD4600514CCD296832D36ED38C484633ED36CE8860D6CC7E438070A84F1A36433A9CE9D34C34DA7E68562933B37E9BA611A0C9734B88D828B9E315B15BD6936CF0D6D313BC52E3BCA4D191C21847E579BC40C64F181D1F18CA4E781E2994719C9B8094CBF8A9CE17354583E760206C8E06D36151879B1685CDD2E0396D079BA6C173DC0E364E83E70826C005E9F8CDE4021FD4B11ACA75D96AB152682596BAF2396B0547351C31EE9C8A6B012BA5736A9F1E6A02A5C042BAA70AE93A2AA021EF73A81EB36A902AA2E3885F2B47399D47BCFA791092C9A7ED6C22978B473EF7D1A62510822A8593ED4392F10079A01127040A7C85B0B24238F2E72597ACD81A7EF293135BF31435B9B1F6A2C82523BE86134B662CF820E4F2ED7F),(36755,0xD5914D0EC2201085EFC20980425BA78769AA1D134C6D8DE0A231DC5D06491B537F635CB882C737C3F0780D48381BD0852C75D590B0A08059ECB62C68415A02EB39294D4AF0804FEB1D6E5C6D5A56452E386D849E911B0F98B8083CAE19B023768D33431F391D2A6AE62AF232716CEBDB09A151AD8A382B5BD62C46796F21A7BAFDE030D930C01F3B98EFFF9985E993DE74E0AFA1E4F74379EAE6AB3C26F8A761BC7EFFC749F80B),(37203,0xED9D4972DC461045EFD227404D185A8771C8C3825E500E535E2978770320500355A8DFFEC8945B247712C548A1D135FC7C3F2BEBF3D584EBB7876B18A67EFCF4F93A5CBF3D5DEDF5F2D85DE6BFB9E56FA6BB5E9EFEF9F5CF3F7EFBFACBC3EF974FEBBF1BBBFC61BC5EFEFAF2F4F0F5E1CBE3F673E7963F0CF3CFFF7E7ADC7EDD5F2FC33486CBA7E7876BF7DFA39AF9E7DF075DFEAF690D69A890B61AD2776B484B851CEB4FD9AF211DF53AFB507F4CB3C6F4A231ED1A33703187EF63BAF9C7DD3C1C9EE7A8FDFCA7E5A58E278797F7AD67FF185CA273F58E8657731AF42A437698FCB87CFBFDB23C7E8CAC3B1859EDC93FA88C82A9EB4C2FB02F9ACA089EDF88EB86F163E9FA390698CECE68BB71B0EBB76F96D8F33F3D2EA198F75C1F62C64EF3C77ADE421BC9D0CED921856666463DF41C2E74618DBC4CB9890B5CF9325F051EC5022F2FC36E2F63893C483EB2EBFA18B8970C3C842E060E5CE0CA3C9C7FDB9A18D78BC59D1FD8F63606769281A76541D90293B3AFBE22B979FB8891C9C9577FC7668A71C999577F156EECDEFC8E549FC1D67581DD93EA41D373121B1298B6D48674BC7A996162C5747D114F9F9D5066C75BCEFE9CA3BC149954949D2126D2B28476D5B04330DB5C2226D341D8B8B0CE5189F974831C33A4CAAB6B83C9F897A81A2ACF70322F5416BEB0FC7A6FDC4B5C324BADAC7ECB9B75DD360C74D29E5595AE63C1EE890FB979D597B0693ABD7B1DACE1FD68DEFCF6D5DEB8B9DDAB2132D8DDABA988D8EDABA5DFD8DDAB2536D9EDAB218CD9CD0BECDCC4F685540BB3776179C56C5D500C313B17C8B8B87D0B2588DCBE05F2596EDF02D937B769215AC0ED59086FCC51B949D554AE869B5340BA5A6E5635B5ABE5E42012AF96D38348BC5A4E0F02F16A393D88C4ABE5142110AF96D3836DF16A393508C5AB25E6D60DE2D57219D74DE2D56DE2F5DD29C1A432C4846036C7C4946026DAC48460AE2EC5946052C162423013EB624A30DBB5C58460215AC4A460AEAFEE5B0916A255010ACA09C15C5E904A10E4D3A4146CA5FFC24A30BD807B578251B3924A10E86B460BC25480518250B47232108A564E072275C9C9402885391D08452BA7049168E5742010AD9C0A84A2D571E01D8956C7655A50B49A7951DCEB00DE9D68FDC097EF125F66524052B426D122C92F93BE1053AD99BEB873D19AEB6B497C19330151333B262D92A235425131D19A0715D3AC0569BD73D59AED24629AB520ADEF52B47EC8CB0F79B9BDD9282F83E9DCB40EB1B395CC43FD03D8E0DF7EDDD80FC3ADBB20BC6FE59A14B6A470DD130149DCBA8B6131E59A46929870CD2596246C8DB04D12B646DD22A95B93C2BE7FDF5D45B826E12E265C8B74889B5295A8CB4E3899E0DF356F8D2A5354BB468ACBCD2C4071B98955095A8C0046BC429DCD4DACA9FAA8D6F47E382388A17CE7043194EF9C2286F29DD3C440BE938AD855A4EB32BA82F5FD1949DC4E0B1C57D982D302F2A0374A0BC8C3B8ADB4608ECA791A0729C0B6742D32AB9BFCB88C06DFEFD906533EBCFCBCF201D68DD2A5A34BEC91CC7A6833B8B77F24B3AD922533995DCD8B653229E9B8EFBA912C8BBB1B045F09B96C8E61DA04A2582E53EA43D12AE22866C5D29942787F94112B649E92183EE6C862C94C9675A814E693B94C7D5AD9C1DA51389929B5FC1D558FA014492C9B2992446E5EB5ED0DB1EAFC22F1E4E6553BEDE2A6154CBBB84406A65D726736C3AA7FC6E94C2A630E5EC33886702695A9A5894B5C17FC78269B39483FEDE08633C90CCA6AC9640665B5643683B25AB250BFAEB5CC346C43D771C40064B5A48376301FDC60366F43C944F33A269A5730D1E6A8DC24438699E726194CC24DD719BB4AAFE0F72C9CECF2D1D7BFC6397C6AA6E2B92CDC5676A3F9634C9D4F278499561FCB1BAA8CBE65A3F73EB527B1243B3818D8CEAFF0E01C97A8CFF0BD5F12A7799A58829985884B308B314CA499B518A7FCCC7604CD60312E5324E8CCA681300AB3B66384240628328644EADD76C64B4AF376C64BE63B209124B539E0086416D54CA4195D8EE10C999AA2449A11E537602F2687C0D88B49A420A02253DE36A051E2137267D233EE73E727D2756A3A55BA0714E04BC11626592AE21364E323D8FC49EE58FE9A37D96D12903943DB4DA3331CE4A4912DB0204DF15CB67B40539C0F6E7BBBA266BEEB3ACFDA4037C0142E33874449EED5E64049A71A5985FB78F259EB83D659D39D6A4D0B7192024D22310AA4494AA51724F4012C892454002569145ECC61B9C1D5265411252D4B4288E5E364FFD50379FBF25FF14C0609E797C8B23DEC3A9EDF4122C3E58F6D22A3C10E344E2CCAB183929D4812A9785A550C9E2476C42CBBF82401978D0174A694E78BE5B8A5612E497AF6D4592ECBCFE8894E9D36C924EB5F5682521AEC8044B2F5A07B924BA2F383D57FE2CF6BDDC0E474EAFF55D08128E538D923EF87158C94253362D52DD91A2079A8202229266386FE1FCDCFDAA0879B0208F490CA1B187EB4F46E9B7D64336A48A5C86745548A8568081FE9C02E96CD212AC57103444E44794C84477248AA8047724C2AE767829DF445705FB37281A6522A371BA11A271DD4C52D071075691C07E28616245D5EA96E2AE8D44D059DBA296E456C97EFCC0F2B5A3715CBB1826895D7EB72AC653CF4F1501479B3557D32F75D2A3D226FB63AD00D61F970E76EB63A900EAECBEAA5C8BBAD0E24EFFCBA2F272FB73A886CB2AB97BC64E48282927CF520F2B4EEA1A7F8EAC157E86D76A39ADCF5722FA3C3A72BD5E4AE975B43870DB6312B29A4B75C9EDDA4B7CC227A031465D2217CD64FA5158A42951EA3FC20BE26D93D20AD64E6AE41EF0FD8D58E6E489FA112B5A49792F45697338A72D61D09EAD04B8586388C80C2EC9291A6D0BA23DD9B7AD0DD1160742932466953E820EAEEB490AE507DAE664E8BE8BD293BBD25AD16409A49800FCE3B8A41F112348BD52966A059F28E9F7488925BAD1168566934A35351485E9D0341337BD34F7DCDDE41B3E839CA4484191BE71680CD113B4884C943AA885F932D87106816BC02B4E0A124C687F856EE3069019B4937035EB02ADAEF3F727C166203D84C367402B099EC3ED586CD64EB58049B958EE972A300D455EAC0666E7EE1CBBF5450B30A69E6E61604CD3AC59A41B35873CD4187B0836686071FECC3EB4C76A778706387EF4DA2B60C0F6E84B67DC2B60C103E0E6D86EE1C116E4929339D63C2C78F6DBD4BE49681C250A9F150B8F1B25D48A38F3D625DCF8836314C32D13612E61297261296AB932D4E432B9409CB159F2676AB726C59A7F4560C8797E85EE3F61DD1E3A53B6693AD128E2761C538737E1256A59DB34A91B06889E88E19752C01B91AE1F2E0B6D897553A0D2A15CD92F83E3A0DA2507CF70454EC0BD2136DDAD9B42B8A4C61D2176CDBD8B487D736DE690BBB5983C0A527A88484B6719A9518B4E5D4AC1CA18D9C76A98B742FC47D89659254504A24796020DBB77EA6B695920D26530707C91313A9DB04B766C1D27E851E9364B709D8C3812C6B478E0B5B7F5E976FFB3B906B3851D6E0CB759C281C17D2C8018E0B693B01C385B47160F34E154340B4043F9938A2A710A28723E78914168ED2DD772A4E0B37BF90D3425E9DD1765A82520B8B40B62E855E8BC6FD7F815B63A0DBD2735F19B45B7A9D36163D69E3B40D979EACC1078E4B2FEAB8C494A617755C5E95F6AF306234BBE322E83064FBBBB8C5B0EE4421B17A5987615E32D253CB3A0CB61B7A0D876165A1C916113418DCB2D4F10B337218C804B0E93090D006926B8DE6A0245968FB01245A69FB0124AD68BA2124AD4137858A3917A7BDA0CA1E5FB060D1FAD8541CAA73238E1C65CFB82DE907D5DF403204240DA11D86937CF5E0F3EFC5DC2A57C89384F9E0ADF6E78EDDD45FC0EE5D911EF3C1A3C6127185F6C0724744CEB777415E006987202F40AEECBCF00248EF0AD82C777E27500982553AC7889E3D888BABEC3989DD6391BBC028B302E450786605DCD3AD48D0B611A5F6BB732577A22377AE746E4F267D8B37D43C88EDC7031D068DE64124F169D738D2C8A75D9549632F50364963BA76C9244D1591CD4212AA76352D0D6CDB6592AC2D861C2C12FE356B9569B6DC2E427DB80EA2ADB49C1FA770CA1E54EA79F53F357817ED23A5E0B8E5D698522F7A391FAF70DC440F3745C78DF4F180E34676A7028E1B37C180E3469A83C87023BB5321BFAD27CF4C1DE4F62FD9474F9A83D06FE32618F6DBB84506F96D834ADFF8811B60C86F1B746E361C546E367CFE17),(39751,0x95D43B0EC3300806E0BBF804016383C961AABE067768ABBA9DAADCBDA67B9058226C459F70F09FA3827EBB56C48AEB51816DB5CC2AEB77282C9AC6E774BB9EDF877E49EB98DB49305B259A9E8FD1DFFD71B7256A22B282E7FE6BDCFFEFF709AEDB7CEE83A40998242AA2DFA2845BCC3ED85A1424F7CC8D3347C5E2B6881406EB3E58E65840324549F6C90A6D8992E292884DC2B7A7F9A4941CBFE24E68A6495CB8864D273736F112EFD2C90DD91D2AE1F180931C235B0D8F07FCEC641608934E788CCC259C1E70E263BF8C1AFC94DBF603),(42389,0xED944D6A03310C85EFA213C8962DDB6FEED02B94C9CFC28584326E1625CCDDE3619265C804672885EC2C4BE8C34F4FEEA13867A8BAC05D0F837381051D996AE4A6C830A89C365FFBEDCF67DE5157E0412212D37456D076981319522F02E87B28C76BA9ABA5D13A9A13E57438F4C32F751FDD38CE50A918590AF551B5099AC1F70906141BBB9BFBDD051492B44A269A12CB8DB240B3A821B451FFB7661976654F554494C43CBDC32F994A259994AC6DDB9FF7581E1164E5C5984462E3A3D30AB20B276F39795D71215FF5371B56CBEA2A489FF174ABEBDE9EFE5B4F67B8B53FAE71BC00),(42390,0xC592C10E83200C86DFA54F005481D687314E3DB0C3B6A83B2CCBDE7D10E361893592B9EC046DE0FB43F91A467E06B6B670BA6A5231B261B828582AAD18C6FBE9DCB7531D3AA8462E19B0F4D6A6BD676887A99E1EB73E959AC1A4D5CEED743E3056AFC04AE6C54B7E9DA5D7595A66218323CCA0459C474F4491597EBCBE584F88004D640CED0F1999E6C675E8FA21F5D4321221246F24025FCBFCDC310909464EC89744C8C0CD0C6F9D13DE817B33D2A8142AD2E9436C8E03DFFFD11F1D384EE40D0D0E126D5B8263442B7E2FDAEB0D),(45153,0x958C4B0E83300C05EFE213D8A634D1CB6110BF855984AA8615CADD9BD00354DD581E8DDE8C105C86C051358D505C5E0F65A14A5D2361909FD3B6CEC7600B25470F52D5D0B53F825EBBDB617B6EF8A88AF936A19AB7E77B631049E55BE69FE567F8B75CCA07),(45154,0x9DCC410E83300C04C0BFF805718248D83CA6829683390454D313CADF9BD07B2338D9BB5ACD08C621F02658174774381416941C95E46A6203D2CFB4CCCFFD212F8A5A4634F43CD43780B655659735D5C8A050AF2FF55BD3B917B08DF9A7DAA61A6EA8DC54FD0DD5FC573B67F8929AF317),(55400,0xED59EB4F1BD915FF1E29FF83C5E74DE3B1818057A84A50A3A4BBCD87EEF62155D5CA49D8ADAB065698ACB62248F3006C631B1BB0791930188C1D831F60C06FF3C7DCB977663EEDBFD073EE350E51DA68D554AD2A8D64C933E79E7B9EBF7BEE391AAF67D033EBF38C8C3825F7E75ECF9067D6EF19F50C7C3FED9FFC66D2FB6A62E073BF47727906D84ED4D2F27421AC37166E689CC937F9EDD4F3A91F91E61A19F10CCCCE3E1514C7F8F4CCDD3B6F8C92AC77D6F47A91AD07683C3AE6001A0D9EE0E3ECDD3B7F324E4FF566A4BFFCE6CF4033C367B7DED846B6F776DB065C319A65AAF015A294897248943C51971C440913E58828E7444972B6CE86F5F6941637DE3CF1CECC4C4DFB1C5F7867FCAFFFE2F37BB9FCCD4B2357415573601A937360DD98C348D4D0F8441AD48F39A451F7F03D49BAE79480681EC8742FCC1D319B27D6C9267F0427AD8070EFD11F9E0837DB49239167BB59D68CA3B3207F6EEEBDE0F95FBF7AE59DFE3B0FDED0E883F7C3CCCA49BDBEAD3797593549531D5ABBB05ACB56BAAA37E2B4786C6D6588ACD2D41E2CE98D308D2FFFD48EE8ADACDED961A97376D1A24B79BDDE84C8D26B0D9668E38A2E04818D8517F456CBBC0ED0A36D2317B50E97D97E5B8835B6E769B9CDDA09BDBE4C8357204A6F36410BB809A230113BA7562640176A7AEBD03CC843B0600BB0115931DAEBA09796AEB819EB824ED714B613321297B47346E4255349D078D00C56ACCD3491C3B00B8C34122D5862674734B778CFB8C8E8CD6DBABC686DBD354B951E5339420F4F408A995BA431202EFDE6775F3D1D773C7EF8F4B782E3D9932FC4B279BD67B48A34944391EB151ABB0206A318821FD80551316B1ADDC9D3F83CBA9E59A4E934040F82045EB2E2113D5A17E69BD79BC8B690C7C0C7E7E94E05E90DCD0C549172B4AED7A3463A6BAC9F53F91856E9EE368B28C6AE0CC1A3D998083FC8BC7BE7EE9DDB39852CC04E1A4DC28F6D96F57AA197D09BB8A162651BB2234430B965A456C0436B3563C42F8474786591008B643136B1BADEDEEE7B6865568C86A2374B46AA0EC8E9C5ACB00AE8440C2C5CB110685F66F9026B662047904463B902408544B36ADE4895C068A4ECE4853D34D004B488D44342FB59A6D118E8859F95BC467B6E183E5C45397DF00898252388B4D80A3D4B9A170746A404813303055A3B43FA52CA0AC47AB1038B05D404C858E28A769274394D8329D004E67288B7601B24BC273D81B031AA2D1ADC302ECA66E980D6CECD6ED7E5842C80D8AF1F7D058B6CB5C8125DB10F80A2D7D7C12A56AF0BD0217AEB2D2BB3094A10B7818291E0B61DE520D9027340A7D90ED4093A7F0D1862C5489F0E15C76856D97955804F1C04BD9186B340BB41A818200AD003958B368F7B9EBA9CCE07B471813994554BCE08D49821C0886C96F7CC2ED8281B5B5DBA920736A359A0D79722452CDE8430D362DCDA5EE46096CDCBDACDF15D3403172C79AAD7D7CCEE0AF003BE8CE23A0DAEC29210223005B94280B493B8B7DD34B4208D45E95AF4260FA90EABACB0FD79B31032AB7B445DA5B10D7C50368892EEE79D28A5DB76C3AB95AC4188B03223E7B191802ADD256A84A8612C5F8D36ADAC103508751BB2C7B21DD882E53F1465C92D533D178A8882478005E36663090B5AF198ED1F10AD85912C867AAFEAAA7119011598026D856805B0D938090BB1582D95BA91DC0266D4BB0A15A5C23993446B13F5949799AEDE8942B145A5C0A65C21673CD29740A3AB2C8B9582D62B5805BAA06E8B28716EDB317F2DD1EE5B331814CF445B24DA29D1D6006916E882D5D02578C176D2C2653CE361AE2E1726AAD28B492CC1CA51B8D16869971E6C03AEE85280A60E8576B891889203220B85FBD1C602598C6309835DF0A0943FCC8800472F9DCFBEFE3D9121079744AB122D8021D0641E883291A31CC411A2C58816E6C46BA21E116D5F2C8DFF912FA68996E58B75A269B80F22A9E6889A412EA54094B79891ED120D06C053A29CF068F702C29FDFE25EB560240BC6E53CA78490A8EDE133C841E50718DBCD7DBC23004B0221EA2A4B56E0F2224A0CEE32DA0169AA34FA408263816AA015E0F69B4B673C07009413A26DA2A768590E3A0EC90DF7A6A848688F5AE50108C1E906481BB53C84EE3D908BA049A3236ED4C153070ADE0116CAC3FC9575984605EA2AF7B28D7EF4509FE6E1AB12B54134D89BE5061D70CA353C5BA9C5BE3423B9C285D400BF3CBA4D14081B91B38DDB6595871F24B48856E4C4483F67A25021D07A85AA477F3CED9B987CE9FFCCF1E5D40F139F391E4DFCCD37F1836FF2BB77B9524ABD2B1D0A1E9A0D9D942A920697A0CB89E5173D2BDCD8D5404354F17CD6F30C337A49D4630EAA1086AFDBA0CD241659E5C4BCEEB033B5170F650D5373DB4B9E355E328EF812A0EA90CB3979573B324D38CFD0D461F990156974D409E9800A4A6380AF2ABC8F88771000491E747E24C97A5B014C7D50C960EBBC3885FCE2BEB9B3203158C3E15E4B1DC24D4AA309B358E11533F878FCE14FED10DA78EB121410E2F76002D81CC0F7EBF18782B1C46FC51AB2EF9EE9CD9E78CC57F198963274ED002A1F5B0EF6CF100D6F616DB8651B6F219DD8424E7D3BE1F7FBA62607A0757761EB3EC2A92F5FBF9898E65C9E0109FF873D03DEE9199F7FE61D71CE0FCDFEC0C48F33D35EDC2DE16EB767C0F7EA3BDE8DC2A3D77BFFB9FBBE34F80D6F55BD93BE97CF7FF1D7EF61796ECEE7718F0C0FBA8760E3604FED8BE9998F0F0C92E0B1E7857F635EE8C5CE1E17EC71C11E17EC71C11E17EC71C11E17EC71C11E17EC71E1E78D0B9FD2EA0F0F0D0E3E18FED48F036EA7F36734FBB725D98DBFFDA1C0EEFCEDCEDFEEFCEDCEDFEEFCEDCEDFEEFCEDCEDFEEFCFF431F0AFEC917817FF1F5E0E31F0ADC2068F4F9FD8917FDE9E15743E353CF707AF8E5F49834E81E760DBB9C834362949024B7CB39EAFCE45962F0BF3D4B38FE57C304005592D84E5002CA278E146F2C7917DA170EBEF498C3E574E1B11846E142BA3D73D833873D73D833873D73D833873D73D833873D73D833C7FFFBCC31F70F),(57888,0xB5905D0E82301084EFD213F40F4387C310949AD42018A90F867077B715828640D0685FB6BBB3ED7E3B05043A07235295640524BA161AACB5D5918DB904AB45C89290094EF26D7FB2079FBB9265540133312693E2EF173BC93A460576B555E15D53473D146996E65C453D1D745BE6EF03E85FC9752AC35DAA79D76C58FF84E67F8596EBD0F4D068B31D999877A1EFDC783B58EFC097177835E5F3251CC206AB0B8C0E6DC37710CBAC93175F92AA1F92D27900),(68702,0xBD994B6E1B311044EF322720D9FC4DEB30819D64C12CE420725686EE1E5231B2D254AB0B4236238F20170892D5EC577CD1A41F43630C25D4D38BE6AE1F1715DDCEB16CF35DD66B0CBA5D7EBFFEF8FEF5FDCBF8B69D2E9A754BA597F567D7EDE7DB65BC8FB7F37A8DBAC9FA6CF3EB5F97F3EDF74353385D3F6533259B748B01EA0AD02DF3BF530BC28C3719BABD4A6474A3A11B7A4E8C6E30744B92E6D49D937FDEF1B2C5B016D6ADDAB16AEBD9BB664BB561D5528B77E72ED56ACC404E9D50B55CD6BB77772D55CB64F755A1C996ACE131D92530336B58EC48D61C2EB2D89A85D4EEED59531639EC58F6781286062C989DDE9AF51C0BB6DD2B988E0567D5F1DA74A8E001C6E6DB4743B33185EE111628285EB70FADB87CB4E2156CCFAD4743BBB1C8BE4A3474C727516EE25D94889D9253A95E456C9518DD5689C02B6B8CE16F75F12862B764EF893E15815DE6D2D4D6BAAFF9989286615ADDBD8AC0316B907DAFDE1D1E8167A66489BBDB3411B8662D4EF7CF24F0CD61B105A7D6EDF9DC83703E29DF60496C1C7FD3329FD8397B732F77C207CD416F8907099C0348006B62EF1C5100D6C4078E9FDCE6139887EBFCE6933B76A0A618E7CEFD9A8E2581814029029AD74F8E5FCB54EA3F8EB7BAEB969D65F40180BDCD49F69DC58FF1EB1AAEEF20B1F9F5269BC48BDB0F00EC2E9981420360DD40F010C04AEA0C6C5B00EB6DE56D809DDB440233AD085FD78E2D9D5145FE6248C166D73901796762018B5CFD5C08EA22DBA23DBB8D045D05D9EA3EBD1DC73D05410CB81727A006C32BC15DB81167D8F03FD22BC7EB06BC12918201AF44EA61C02B11CC2078A5A223C4AE5C1133D095C9DFB05F8888D020577FF46A92AB3B7AC6E4CA455206B9BAA37C135CDD570E26B7BAAF4630B6527738985BA9EB269B5BDD376336B6BA2FF1586A858A185A991009312B172219C44A241F0858C91049706F46E1BF18570B448A24C68943041F02BCC3657C62DC2F10819C60EB30599760EF50599718810F9375650C36548894B18198102963033121D2F50F),(70088,0xED54DB4E1B57147D47E21F46FE8006135CC344BC90A84DAA464DC543A54655340993E006C6C83629A96369CCE0BB074C31E060134CC135A921362A177BC617299F92997DE6CC13BFD07D6CE4B8CFE9234F7366EDDBDA6B9FB3057E940F7A78A7F3F6C898FB8EC08FF1413F3FCE3B9EF9024F24615E74DCF1A391774C7BE73C33DCB424BCEC43CCC5233DF73EF52E3168F4EB09DE110C3EE821DC5D5F6078E88DF541365B1B66FD846CC520A34E7290D710A0F9181A215E61587078E8B1757C6C6AE9BEDF9B5F10A3A9D3EBBF7BC22BCF0C83C876E91A32965B86F2B7A12886923014DD586E188A6A284D63B9CA1C2DAD0AE17E26ABB56DBF3F8693EDEE1FC99D5BE51A3B86900491CBC86392B3B2978C6F760F6B4C72CE09F72834CE10A1FB32BC4B4D72ECA855EC4AAE7BC41EEC98DA3D4EFD74BFFB85E6A6953D22BB25A26518100A0D0AE55F9C9F177CAF1934EE428CB40A76FB2DADA9D03A85C3B2AD1C413C6AB60AB0114615AC9D15B3AED3F21F86BC4CD40F545668354C7255532F7DE79D95B8BB826F419402A20F1D49B36265F5EE64B847731EBFFFA5880EB33EAFE4793627FAB97EAEFFBA5C35E3B45AEA05937C9B641B56738BC43366FD10C958D9732476D54CDBB20231CDD25A96F617AC257BBFE42C4F7613D6DEC55533813EC80A4D869C6453ACCB443F43D10C39D5AF8CB156A7F6F11222355077CCBA06AB7B282A5230EB09533F18ECB8CBD26CEC41ED141B9EF2BCE0A6BC7E3F03D69651077272C82E8AA66169146778687888148E71D0DD3B8264068230274452F64EB4EB9E867C11A37188383C4B8F52E51D914BB6BC47E530A4B7301924D46FBC4BB3DE4569068580F51C063DF891B6DBCEF1113C52A5453654721E86F87B889C40BE45AB27F4486633CAB7919E595F85C6052D1F40F49F4F72E187451C10775F145E8912A8A7A4A07D9277512834FD2C48BF7B9E0ADCF78234636A2953BF4013A3583842FDC9F13E82B09663EF61BD4CAA61538B3E1403C21CF7AD28F830C54087766C153A0A95D32455259BEB667DCBDA4CB354ED6D88D7B096D92CD2EAD9B5C4AD03889C632DDA798B6F00D62E91BC2DCB665385CC2A56B7731D924A90AD2A248BF64E114E236CBE8D14B3E68B986D7A5698F1FEC63DF4FA457F9F3956A77F5668A7025115C9F7A430751D92FB98BFE7861918AB641122256C07D6D4CF1D59FA8AA5C730FBA359CF9C2005F0F22EBC1E5084B504991528D4AE551E0CA69D0C248FB00E7B5B2EDE212E057C820357D9081F0C857AABCD35F665ABCDEDFAFF561BBE76502B370BEE66C1DD2CB89B05F7250BCEC916DA6DDEE1997FD1DD5268733DBF35EEBEE59C1877BB9EB057E972DD9B707FF5EB023A8442A17F01),(70862,0xED576D4F135914FE4EC27F98F00356FA82400DD980A2B00B82B2EE8B6663C6B64A77B1352DBABA4832A5B4F48569EB524AA545CA0A821668ABBCB4339D36D99F62E7DC99F9E45FD873DB0A55B3891BB3C97EE8A7DE39E79EB7E79C739F9435194C3336934E67ECD2E9CEB126A369C665EA3175989DD337EDEC5D6BC739172A4D1D138E299B8599B0B3BF9E88E8159BFDB6E396E32115E97B513633335C9730E79DD3ED6D8F957D4E9696E4C21E892F4094EF632029A0404D2EA012FC192A9B696FBB3136D570FE337E28BBBBB2B07862F41836B781CF508D1ACA376417D807360B159195AD86A83A27553DAFAA1E4FD513A87AC4EA5CB1EAE1AB9E52752E5BF32A64C15DBB58FB9256B497BBB0B752FB228943653B478FB39817E1B631B53E46891DD31262EB18A38FD1F576EBA178801275838367A13E861E858C9649D48E5896B6C0D78E033F0CD57EA1B4ACC476C8DA1611A2B44C743E3BDB0C9FEBFEDDBBACF3514D6430184C1D444A69E5A76A8E07298F656B9E1DF0FB6429054B6EC443599D970BA2BAFD47959B23FCBECA79D4AC9B24B2B2B8F58D63D2CE9C679DF7ACF669AB132F9252468989354C99F1299BCBF5AB152F4C3A1D769B79CAEA624E7C7D78E55DC9AF66B7EAC6245926B1A2528A137F542E6C62324AEC10137B575AD4380F2C088A2029C20B8804EB9FE42049D602CAFAD1BB5200EF6056A8AA7241DACF0247C40304AECA854E22A3AD52C9FD750CDE1CF0AB724180F03A028B29C885802C3E6FAEB896A55C5C875C1E0B1EB0DD61061C2E171544E61007B2B749474610303482D3DED6DE4652BBD8ECDA9C60324D46E813BC216DD557BBBE08C9345A6323B1818AE8533DCF08B7A571EB2AE786C5383A83007FD1F170D271DF6E4120E049028D86AFA8E5B2AEA7138FAA47224B3C397483FF2578F72029A9D93D7587A33D4A96313DB91086E291BAFD1C7C6FDE72A9B1FBD82066C8CA3EB0DA81CF9394F0965B43A050759DB5FF6EBBC53223ACDD220B21593C42154D31B583F893DD0D1442244137E3C936C9BA65C1376A9D66A7984B56D6892E9A2AD416C250F1A8DC220965C9F213B910579617A9ABF20AF873184B2EA5D5EC410362E939780F31965A798A7B0091634C5EE338B9C443348CD1B544858402249E85605A5B4D43DE4BFB5B0C516D328DDE2626598BE33766D4E1B2BA4E32C7E8EA9F19B592011F8FC9D7A1904511821BE8BF7E0D3DD0AC8269F06E613910E14F2B52C479455C40EFE393B629D63E8DC37BEF511322B42488CE432AD740B9D958AD4421B8F37E1656D2643987399060B06E278B6184543D7A0391ACBAB1A81EE648BA40F65E107F42955E8C0E7ED73F7269B0FF2A9D951DB7EAA1DB574792CEF9DA165D30DC4ACCB9568E5C5882FD230C3671B9FFDB419C355CFB81E14B036313133855E0F39248142271B46A4C5880037F52E3D227DE1A13292D5164C4B052466025255054B679DC3B2DB17E71ECC7A1B16B972F605B402AD6B197C5B85CAE68AB516CC8475DC289D3562378074756C98428B449497BEAA518D1E2985A75EF01265E3FC4E7DF7F528031FB89A1C19191932ED1753A7E0D9B79B5F08A8E8C1857C2390C0AFC0108B1AB633F31E7FB47C7D102956AF698E4E720F98C3E7D477EC5BD37327CE5DAF005BA4C3949D9DF406B88BC22A9002493C0BB6173155EBBE948493E04AFBE8BE85889E565214CD6A388825CE049224C5F88645AAD789B17943E9F5DA60EEBC36927DB811CA6A31C868FA9EDEE1DAA32A2CED875C66C3CD37BD36CB6EAAD7A4BF7ED5B162BAB636F9BBB74E66EF359D6A23F7B73FAFAF7D73BBFFAE51E1ACDCE3628D1F0659468ECFC379478CA88FFC8819F52E0E7326033C7B6CD7E40729F70DC29C59D32DC29C135F8ED637A6BBB41FDB6F8ADC56F2D7E6BF15B8BDFFEEFFC66ECECED34767F19BFF5F47C1EBFB5FEEFB5F8B0C5872D3E6CF1618B0FFF733E34184D1D06FD19A38EF2213EBAE3765BAF8BF2DED7CE3E9DE16C778F5E6FE83150129CFD1B),(70863,0x4BB432B4AACEB4323434313534B24EB432B0AAAEAD0500),(86237,0x4BB432B4AACEB43234313736B5B44EB432B7AA2E06124AA905F1C5F945254AD6C540054A86201A225A5259900A15354088E625E642442DAC949E2ED9F86CEAF4170DADCF67B5BC5C3CFBF9FE29601903B8C2F8E43C900850002C61089648292D4A2CC9CC4791816849CC2C4A492C49459280D899925A9C0C17ACAD0500),(87645,0xED59DB4E1B57147D47E21F2C3FA56FBE60C08378695F5AF50322B5AA2A27752AAB022A0C522AB034678660F025C6C589A1763077DBF8060182B1B1F33167CE8CFDD45FE8DE7B8C0B228D48092A52E765383EB3CFBEACBDCE5E067CD2883417909C1E87DBE319F3491E692E287925FBAFD3C1C91F277D137EFB585072BA24BB5EDFEAAA0591AD187B2B977B6414987C36F564EA39EEB91D0EC93E37F78DB963FB6A7A667060DEA8CA5A6B55AB57F4D761B1121FB7F53D69AD24BC174B25DC9E1B1CF8DE7CD3091F438C1FE0B3512E6B8D58FFE83CEE75A247573EE9E9BDDEA7ABF9D1D9464D307AC395046739CECE6D9C25395BE06C1D1664D34A778B655149CF3FF6CDF89EF86DDFFA03C1D95FFCE479EDD4C81F62901024A9CB79C873DC66A4CEB0A4540E028FDB60D9D992C546D45C364ADDD21A2DA1E06E384ECB2F1F7F4D3FC5C52B2355D0DFECE98D152C16BC8642D7800CCE4E4CF8A67FC33DD708220EB565CB9C552128C4E7CA3657A35CDDE2EA0557DEE393E53953B812E5323CCF7153A973E58033782E7396E04A0C8AD5976571B40136B66E3869A40EB58B8888001E55D13AEAE6E0CCEF22912668725A2B6BA49AB0A3474ADDEC5BCED25C665A3362E48EF593A8761EE52C8AAEE5989E95451BBC574D9FC67193CB71CE0A9D828C7863E07DC49A921B1CB89ADE771E116E0058E0DA48B445B6C059ED36E913580E046BEA993F180C4C4DDA81B04E24EC28EDFE34FBD43F4D5692DD691F0B0581CD76FFF399695FDFD02DD903133FA30D380293504072B91CA36E8745FD87427DF7F01DA8FF6FB93538F09F5D8EFBA2B5C7E1F57E065A8FFCAF68EDF40E7BC5F9C9BDB1DBE9F05E61F7C779FDA0A7E690C739E4F55AF47A60F4728E402B3ECF4084B1D60DBFECB02D1C86F592886D7256C2A107B34B66FA7B1865FB5CDDB8C9E16E66516476600C7E240ECDC32A570FF0942AE313630E0E981393AB4DAD0100ED68F52DFD30610E5673101BEFD6A9259B185229812566A04051675CCD73F518E62CE6972DEBC5289CED54DE72258252D27E295A6059E1EA0E578B38D9DB697D2181D9C07D835C3195249571E35A6272FA7A55AF9E127E8CB31DA248496B34C053E7609936A1CC0533B29197AF2A82D82DEACBF15ED52C22B60B5A738DB3389CE58A42C82C9A571E605357B00C2CE9661EF147BDBE94C25F7065E19FC4E691A94B6485591501159184F17288F8F7C60B44636F109968D9583EA77904DDDAE56A8EE283699316E766197AC26C049EEF6921AB8930F4A2CDD91AE919605B2638C2FD11862F73D0905EBB4C40A0EF585B09934583BCD67A85A30FA060AB94F03A2D80AD31E02FB0FFD21F0416AB8C9AB0444DD8C724E4287D4B006586FBBA746953EA840FC4D2227D8D20DD6EBC030275DA171433836534201D45ECFEC1E51734772390A9E94D3F6913DF6B46224EAC5F308A0DFD304DE555B8227F6878177AF743518CDC1E167A1D6C82027005900057E4202D70E6D7AE7F918889544DABCB904D37D3EC148F9027001D4B8A8422229BFD30C41CA2E207A504F1EC5505D0510482AE97C29F176BE81B29A950FBCFE80E1C235678EB4A7AAC46F735A7AF2B06F2204F6DA98ACC063CB5E62B0410F07F0185EF1BA70A4D4EF366147425D75FD38D5DBC3F3502311A768DDE558D5C5ECF2DD4C852204B812C05B214C852204B81AE299077F4CE0AE4C63F7E580A740B059AD7EA0730F98CDDB6C86CC3AF8895FD4EEAB4FB1A28982566AF100B1B9654595265499525559654FD2D55C39EA1A191BBFFAF6F68F453FE74079E2CD9B264CB922D4BB62CD9B264EB93652BF417),(88395,0xED554B6F5A5710DE47CA7FA0EC1B1B1CC73191374917ADDA4A5DB58BAA8A886B17A725B6305593BA962ED818F00513DBBCC2C31803063F80EB8079DCCB43EA4F49CEEBAEF2173AC3258E934DD565254B080E73CECC7CF3FAC66E9BB2AD2DD92CD3568B65FA81DD76D7B6B66ABB6F33CFBBDC8F9FD99D0BE607AB20337FF7C2B58C478BC5B85A7AB6B8FC64F9398AA6A6676CE6B5B5AF0C89E991CB7DFBD65FBC2691FE3EE95459DC4F5F86E74CDC73C63715EABB844B1A3843D9DAED5B3FF2F373A286AEDEFDF513C8847C71ED1F4B94C6FF10034AB85AA79EAB7BDE4FE827E7B49A305E272F7959C1E33A386252197C81F3681B314573606CCE04479197E8816C1CD533FD2C393A0262DD1F1E1D1FFEF0E5E897F6623C5A61D912535F8E003BDCEE15DBC4C41F4BBF2EDD712FD89D8BCB2EB76B6175F5CEFCB273249D4098137F3A3E77D89FAD8E7150B54C230D7DBF3A67FA7665C5E170989C2BE3AFF73F26A7C3F1193C7DF4FD9C8974BA54E9B178FDEFB6686679B0CBD23D30B47EBD00ABBF3B9D76D78B9168122B40E36DC831249825EBA423417A683CC3CE8F84FF545424FCAE57DFF542D4AF42C4A41366C91D9EDAE4EA255646F6C215D1E2B4DEA57B21A3562C13A4BE06BC219A46FA31A2CA3C78A26FF441CEB312A8F08D2ADC82175AEABF95BC7AF610E4E09A6D6F833B1A68A17DA3ECF1365536E9AB0A02B8C2B9EFD3634331DC15ED2C3FD6E0310B24593C01A6C4D119F776D10B086321A2AAA49762210FD7AA3492A00185F45FA165C0D62BD25A03CDA60F59B5F846CAB0E03E51B7A87221DABB6FA42C64E3CA235A93872C280360168880231EBD20EACE272031286593576431D8E0B9EA75CC3CDDA1D0D6832C044B7332E945305D5A4CF7EC438F504F5B1C552187E0028C7FD03A19422C98B75C831582227FAEFB43E8A59410051FD86741896825280A846904487D2D2CC77B0B9FC40BC66FDFA24A9FD7F2902ADADFE3171AE9A8629866510D1D96C3683590A4199574B647551A5B02C3B476F0A1478A293D7B64E02503991E7B3F0A17147764DE3B614A9407B668A40E3069244C7B5D280B8B77E1815E3810F9102480FADAA8DBA98DABE7DFC0DB648E4664EEA9A2C1BD10EDA9D01746431985E5658D6E57DE4851F8D07083F48718777113CA225A3E0E83B3F55A8FCA187A3F03A348BA32E9C84602D28718347833FA1542F76B90BB8F9A26B9C392036C4480B35116976DA8D3475D98ACB382C472253DD1144A187533405D0D50D7A5204E05E4297D4495087CAE1A9A0C86A2D5C09AF5877AEA25ED1FB1409CF44EA19CC06518F7C81AB8862B000BAD498BF1EB7E8D5C823AD28BBC25861E21F9001B1966D97691B64BD07FB413C00A682AAFEE22926EEEBA16C4023531B444BB814DD36DB0448B250E5923067FC50003A719050A0518902AA66DE685E76E97DD0C4C6F41A69FB299979CBF8C48FE1E108B7562D23E61B13EBEFBF3CCBDC585D99999E959BBDD3A639F9C9F9D7DB2B8786FC632F978F9E16F4BDFDC79BA025AEBEBE3CD71FF6673DC6C8E9BCD71B3396E36C7CDE6F82F9BC36AB9D91CFFC7CD71770A1A02F80A39B074C0CBC9EB4CC102BB443B07D6229D22D15AC0FF6CC3673420CFD7682DF5AE978259259D7D3D5111CD9C6816587460CCF9481E16F5A6A8679159541948079888464E71AD642AC64B317C054C01729CC2C4211A5783A2560318C6E411358D1C91EE90617EBCA13C2DAA4469641716192D287AAE3122A91CF23F901AF8ED79687AA04B1131F40337E8C9D7ACBE071C07F40412A61581E169FE80F4719A69B249DB4D24A61197C03E62991CDB2989F2B1C1D5A08E380B3E2185C09AE87A858A8AC2ABEA1B15205CE03EF63AA74B2914D63DC03738EE89435153814C716F6A715C9A48B8A7102093626F250FF40D6B5F889D337689D4C6774EC00B934E21D831151E7BD941067439E0015D48C285367291FDF751B65AE1EEFEC4FC148E3296DCEDFEE2EBA7EF4776FD1F),(88396,0xED554B6F1A5714DE47CA7F40EC1B0C368E43E44DB36936D9444A2B5555841DDCB88DED081335AD63696C8C79790CB179830D360C7E601E0ED8C0F0FA319973E6CE2A7FA1E70E8826DD54AAD4AA959010DCD739F7BBDF39DF87DD3663DB58B699AD16B379F6A19DCFD66D7336E3A2D3F57CD5BEE2303E5CB7596DC6A78B6B6F5C7C6C360FF7965797D616D6DEF2A5E9193ABFB1F178B86278E474DDBDF34EAD084AEF50699531E685B0386F50FA45A866C173439BE02BF1B58DBB77BE57AFAE14796F7CEEDD0FB4C682D7A3997E2D5FC2B8F4D90155AEC2D61FB35E5CBBB882725C9F61E2463DABF1E126DD84C2195D366F50234D0E2A92A544F3061AB213018E83C3A15CD24A097D489035AFA80FBFFEF61BFD17BA5135728E4712CA611DF14B97EBB5CD64FA65F9E7E57B2E877D6569CDE9723AD6D7EF2DAEADE8AB261DB5E9B7975FBDB4AFAE8F80807C06A1BA76589E3740E1F2A3B00D8514FF3E8841F404D2393AF2E8D9BCE189DD454186670E97CBE17CE5585EA5E8CDCF795F7FB3B26277FECA97E6EECFD88C4A27A6A67634210B72110EF6884BACDCB0661D030234CFA0EFD3527D56B980C0B9D2CBA0E7940E43E556E926D9A007BE1A857FEAEE8D6B43BBE84B60A60AB56B4C542173CE06611EDB2A6B821F831718BFC58C4C8430EF2534AFD5E095EA6FF3A8681EBA6D3CBEC44807BC1D8C1212993243780F734DA59D855055E9489CC9FC811A76A3FF10935136C84061470F1F9D67790F14BCB09F857298B97B9A54C15872184BAF20B4ACD7C1A3BE26B8D9CEF5300A3C2284E24AB700953A65C0548300F0907698EEE5AFE8CA1048D32DC3E4C4FADD3B50DCC6E38CD2CBA1BBCE8A5B30281185ACDF475F18B361A575A9A62B98F30EB9C1AC44DC5026CC0820F574BE39197CB7131BA2C36A043CB71CE01675730AD30DCAC9C91673DAE92E8A1575BB4DF5C1FD73D62B8E026B212A11C72597F028CC77A321149BE37AF2BA55DB186B43A1A1C6BA4A4B84E607824FB16346A944431AD820811F4E2024821C61032F35ACD20E825FA44A42ABA81E093CAA73C5C9767B30402F22E10561CF435C82974A9A85C2C5909B420C023935565583DB745CF5A741BA658324B1A26D1D82A7F945C774925A22AB74450C85957E1A23550C35F80BBC22F1CACE0E989F43C68C9F28570F6FD11FE4496A031A2B2D819A83B2FDE92E5EB350150351DCE7647C14F64657E8C93F0A2229778C8448A25D080539918334EFBF6141D20DBA14A33E759F971C2AEE2FBAF04882566514B85556B74A7A4D2408053074497C68A93095853F24DE603591328C9CD0F1D6E5B41BC929CDDC29A76DC6E5951FF9D6CCACCD68B79B16A64DE699E7D3730F2C9685C5458BD53EBB343B35EB58B05AAC4B4B2F16ADB3CF1F3F7DF2E2D5BD9F5E53D4E6E6C879EF4F9C77E2BC13E79D38EFC479FF5DE7B55826CEFB7F72DEE929AA3B01E32628C6B17E0AF9927632004F093C3BD0CD7252C92ADA0D722B6A21EA73D2CEE75E42D2C7E4360849AECE7251E9A614799704A2F4F42707EBA478769687DDBA16AF68A709C2CB923D75E7965B7CCB4DD9E050E29F0C59B3C06E7449F676D9E03D6B1EA9C58EEE25DC15D46E0E6371143A5C537D1F84DD8A1CE22EE9273F90C67858A5AC76DC434F0729C29AEF873683F11C77FC780E7CFC215AFE98B6B860C9DEF43F0FF268B272D690B4EDBC22A7F14AC6F34B2DD382169733369B2C1D24D7F96BF9582C36E3DC9469618ACB87D33D679EF96EEE4B994C5BFFA64C1E4C64F20FCAE41DD92541844C6DDE30D60235892677E0E498555BF40DCD63DE36FD7D48F726C2FAEF086BF377),(88397,0xED544B4F1A5114DE9BF01FC8EC2B0E8314C6B8A95DB4CBB649BB681A330A286D110398DA0AC958158602BE05AAF8C0272D82285A65144DFA573AE7DE61D5BFD07385586BD334355DB87075CFFB9EFB7DF38D245AC421B7C8B79A79DEDE2631CF2FDA44AEDB17E8EC933C4EAECD2FDE15B927DED70EB7D3C73C9EAF67DD7D2E6F97779085EC583134F4B01E3076F8024D415A94B5EA8C765420C9084C26DA9B82B056D24ED26810790B947C3B9D3DC4B2D96592DAC0A09E956129C60C355FCBB3326CAF4558E3BD670FDA9B42A1CB77FB073C1EC9F796855A448E1DAD22E71C0CF8240EDFC0B3370822E7F6F4B094C52A725697C96237F1B64EB3CBD2DA6AB5F1565EB2753B5C16C96136DBED2EABC32C74BA6DF71FF534BFECC7AE50A88E89B9E5BA9808BCFD0A2886DF5131C25A1EC60E308388B0C090A1E939DDDED6D4F84551F005C6F4D86EC36BDCCA8288DCA512AAEEC0F04FAF9AAA7DDA8642EADC23E903BA556266C87041801119305C5060345C90706ED6696066830866322AD80927737436471637883A79BE736F20D02F9A4C6FDCAFDCCD01A7E471797D019FD3EF6FEEF67ACEA3A6C6DEA677BD777AA53E7F631550B760A25C9B29B41B893245D23B74384F8B054D550D7FA65CE0917428556931AB1D2721310C4A988C9461E23D7C5841E88892FE7E12D7AA617D354F4FC721BC40A232C9446B23B95A7A99C4A6B54AAC96CAC17AF29BFC9E4D8845C8DC2A9D1FD5239FF56C1CA2093895C9F616D9DFC3392423D36305C26528CEC3F83129AFC25809AF20C914BB05DB3339FD6C011B6BD30AEC54A85AA67B159C461665A214711A8E85C2A6A686B5A3044CC64961133EE6B040AB9E31149315529EC35168B3CAC35DBD78AA17B3301D07E58B56CD60256C24697E45CFE6A05AAAD7E0E674611F94126FB7D8A1B28F0B696A941ECF90C5E5FA5A6C83D175224F9368021F8029ECF98B54CC6691130493A38B4985A1EE783C8024FE2A09E1DA9210AEFE276E25F16F9208763CC51DA796602CF6F590AC8EDD8AE4868A44B05E5B2456EBAD48FEB3488210517131C8943081DFFA421551D237CEF05BBF55D08D5350E807),(88398,0xED565D4F225718BE37F13F18EE2B827CE86CBCE9F6A29BDEB7174D63D060B50D6280A6DBAAC920F2A188B88288822BBAABE0EA0C8820303340B23FA53BEF393357FE857D0FB8ACF5D2B4699B4E42E09CF7BC1FCF79DEF73CC1C5D9B8E505CE62B75AACB6672EB6F373139C69D617985E7479DCA6677ECEC999BE727BBC1ED722DB592CFDD385C539EF8CF725338DDBAD9C6979F945DF32F2DC17181E5AA122AFB6536A53209928EC24A646682C420B3508D7F1106297CCB63C3CF43DBDBA52A5AD81DFCA0F68D3E2D7F7BBFBC2CC48F6CF1EB850A90CC1CFBBF6BE7E7105C27E6F47B2755AACB0E52AD6227C11CB61FD7483C14A1F63A2A9115C6A273CBC8EF797D2A57E99ED2D11B41E4DF4965F7EF775EF17943D9A2E91A33322EDF430CF07024B9CD9FCEBC2CF0BA301B7CB33E7F5057C6EBF7F74D6EBE959CDF7B8CDBFCF7F31EF5AF4DF4301A908C91B3D25209A42E5031FEC7F8378A4D58EEE9420BA3CFF16CF7219FAEAF5FB8616DBA5A9736DAB84D1AB0FB9F7FFE2F1B87CBF31D384CDCE99C8614D9382F4705D5BEF904AFA4ED982728B6CF024BF418B097A2D33EED79A74E3027D2093A7B16BD845CE79B5F98E1CF14490A1A2904C99B432A45223FC3B74A337C7F4664F134F20B68B09B5EE812AE5B4F320AD1560B300F912866BF586265E4058802AAB3EE8B02A67212AA14595DFA8728364CBAA9CC1AD7E1A813082B925E5C4077E4D6DC561679BA1CD97B4789214140857B00F90AFA8CD4DE69FED427C97D4CFF58375ADFB8A810FC7F5E816391041780BEB5D1C0872B307C239299CA01D1DB0B920ECE038F5314325897D07815D1C1900A505B15B9D2F904D24A78CCE34B749AB1DAD9B63789A09AD1BED43C5A9617890253903E216D9ABB10C7985EE84C85E458F262151C37B9172122275B21E539B71CC303CA44ADBECBAADDEB53E817D0413DB82C4F7E1A8CD1488B78C2AA5A09578B5D3058587629CD48368C124084A6D8591A77E383AB07029A236DF62124DEC82787AA71C0EB867A9A42A8EF9679AE58C2A5F91C6350985C955073F48B0567CA34737F5600A4BDC4FCA8306B2EEA58FB1A81E6AABCA218463DAE9A51EDC072584FE34578358A59F7610858C42A348B21DBA5DC1707C2D6A5322C22902C03E20278F3AFCA772E22DD94F32E4BD91A4E96B0C8746152F8ECF436D47B003102E91EA0974C36C0631165B24C6A19B4096A87C8C551E3240D6AA2454A29767D0AA5139458E8E913146663B3218464D14A81C221B09881DB24F8F76CCC35E15BE29F7CB80CF654249B430491CE74C0B9E1FD991CDC1999C6366F79CD9E29C9EB3BA672767C6261C63CE49E7A47DD666B33AC61D3376FBDCCCF4D2E2FC0BEFE84F4B18B5BADA97D871EB9325D6E9F8EB24164ED254AEA932FF074A63A7815DD1F1FD6EB40CE935A4D7905E437AFFADD26BC5BF996E94DE1926BDEC31061CE34BDF3C9258E75325D6661D3324F69F91D8159C5A0489A3393582EC40AECD24E4D3D0E27AA046861C1B726CC8F17F448EC76C76A7D3FE643DB64CFE0D7AFCBE61C8B121C7861C1B72FCFF92E3D58F),(88399,0xED544B73125914DE5BE57FA07A3F81E61149A7D8E8266E5DE8C2B2521D430C63112C607C8450D52804C2A3D080C0249DD74487364002E6414B6852E55FB1CFBD97957FC173BB3319D7963BADA29A73BF73EE77BE3EB7BF2B4B6E291192449F5B74FBA665C92B2562925F121E46E3B34B7238284CC7249F24CC04E5A72F782C8A762EB4B410998B3CE790C733250989C46D1B71DC8AC6AF5F5BA1878A69544CBD436A59785D0A38C6D912DBCF40E61493906B712C71FDDA7DDA6E9B83E255DDCA03C458A177B9B2DA7288D4DF7F5740074790FA7F65D4C71FDAD0A95B2BD238A5CD2E0F93D889284D6C1670D06A9F8BAAEE2051C08121DB5360BB608783D6B8D5B042948C3AADF0E6BD19EB1F866F6955235BEFC9E0B5A578311E7F22399DCF428F4313F1A01C5E8844E3D1602C36F13012B650A7A5DAB9BCF8C7A2BC14BB14028326948FC7954EC001DD3464CFA9BA43F6D73173EB2ECADBACD137DB9FFB2CB74E2BFFB2A2869B92DF8F3BF657382C47AD13F07A6F4802747BF0AA6CEA0A940F48671F540D56DB54DDA51B69BA9AFF3A2C5E8D9BAA0576DAE7FA1B47A67E40F40FB05EC43278D784C33373F8F717E52518159A3E33CF6B165E637B9AF96907F991DC66C31451CE39C37003463976D1A79963C449A3CC7FED8F746BEF8B9222B91AA436203BC02E64A7CAD9F29A69A89CC15865477D72AC91741997D035E8E11ED29AFA8874FEB1EBED32049971CE1424C7EF67648E2ED82B03BAABA6B1CB359774C8B460AB8EB2B11279C6D932CBBFA46A8A650FA0DFC3A6788A90DFBC6283D209BB68A078544E733D94CA9A6BB8FD6A44A65EC22C6D6B6CB360BF2CBEBE0D62537B56442D40F9323B563640D7F928F4225137B93055E38D467573F091CBC86B64AD006B255B123B3D838BD6B8DE31F53C344EB0F5A5AB82CFE3515940D789DC751E4908851F59473C2909F31EE7FC945374CD7A27FD2EB7ECF5BA7D53377CBE798F3F38392F4E7A827EB76B76F94EF45E64E2CF27B82B99B45DECF1FF988BBD2EF1B78B7FBA8B57D00CA80CD46EC0C10A6596AA729BA83DB23BC42774ABD0EBB1347E8D29A8E4A07F825380772D523B824CE1F71DF02BDF016EB724882EE7C21CBF03F8F18B0BE2CCF27F5E4F7E03),(88400,0xED534B4F1A5114DE9BF81F26ACAD74184019E3A6A6494DF7EDA2690C20A3B4010CD0D41649C6575101F181CF226A0B05E459A50187D78F71CEBDC3CABFD033A3B6B64BD3A42E5CCD797CF79CEF7E773E2BCFF10127CF9A0CACC13C64E58D7CC0C70FF23ABBD73FE6B6BA1CBA212D7DEA9E70BA1D0EAF9AB2EC55DBE9163C36CFB45AE24C88090446AF2ACC88D7DFDB33434BA2DCDA94EB45B21D82B5E83003B534CD86A1BE844D58CAABB5406FCF2B5A28C852E4176EE635D694F0F7EBEC66B35A253BE95B182A9561F677D6DAE9E60A50DCD132B2FB83662A6A18C46544CCE0BE6186C66B2AAFF8210E1A6630548E454886AF4229DFCDEF6A21B2EE86A25AF8E4E533ED0BCD2D1ACF92833491D634D2937EFF14AFD7BF77BE75F6FB1D5697E0F1FABD0E9FAFDFEE716955FD0D71FDC7C9479356B7EF9A0B4819889D75378BC30C595A87ED04297C8186D4158FE47A4249771032F2027B474D58ACD0E5F3CBE62AC452D0AE412A8F1382B75FC0F7CEE5B27A3F682FC09A799DD2D993EB27B01151E24D889565E9F4B21951CA55A57C40EA397218A7FB0B5089A10C50CCC98D558CE5560C125968EFC0625859CB92ED32A99E228C94E372730542655C8B43E4C6F6155586CE67E87CEA429C25C913923C901B6988ADA072B4B84CB6F694B9D30B710E523955E4709A249621DD8274083AF33845DD149D85D43E9C57514BAC10B101EDC5BF18402D894274E7B3E4F49CC62BD7EB37227856AE8B78437A5CA09975287E83E83E7CCDC3E1392C3664E913C294525B291DAB604D53E429774A908AC2DA02CD44955015D65BAA04AB3958E8A8F75C11A19641CEAA88265EE798F67BAD3A3402AB1A81E3754ED784DA32A2BC169B5EE0F4AC69CC3E20088FCD060B67B65ACCE39C7DD036CE0A83824110B8316ED4E1F6F5BF99C253C1E0B5B12C7737D6C0C0BF331659AA4225CEA074543A93A52C260F5E7BF0DABDF39AC1C0EB4C46BDDDA8794D3584CD35F0FC4F4F7177F79491B53C78EA3F796A0642123285440521B77EFB3E4645D4927D0C6DAFC2E7D683FBEEA9FB823F01),(88402,0xED534B4F1A5118DD37F13F10F6158657600C9BDA45BBE8B64DDA346604ACB4410CD0D4164906157988150B02F1851627D0F26C7C8033803FA6F3DD9959F52FF4BB8355D74D9A746132C97CF77CAF33E7CEE1580B1BF5B38CDDC258CD531C6B63A361D6C91A3DA1C8CC0217F019A7C2AC9D353EF379FD1E1A33CC38E75F980BCE06972864B5B9586334FA748C18A643918907CB4A9B978779B9DF22C524E436DD06C84A4AB10489734C42AA41B1E8C483574AB3298BD99BBAE5D788A91B3FAE4FFA5A0A919270A740113B10BF3D0D4BDAB726B44AFA8994CF955A978631DC44F81A2E731B94428F922A547090DB80A17ACCC3E1C638141B5AA3AC8748594B6EEAE1A3174FF4370C7694429D1C0844CCE98CE7239145D664FAE07FE79F8CF8B8C05C301409F9C2E1494F30A0A3269DB5E9D3FCC3796E217C4D04C41A6C9D6AF9162A915C8793A4DC17E5E111A9F2A422607EFA39921C96A03DD2CA574AFA524B6E4321478A1D6C8FDD153EFC3E10E0421F75E1AD66D688ECE9A83E8F72DC68FC6B9095A5A23210A1BB0D9D4BA594904551D95D835C96AC26E06A150B10476910876E46EE0B34DBCDE0D7CB92005B195992E4E10E695561B04553FA64B5DD5224DAABF27865055C01FB75E8AE43AF0E27352CD3BEA4E0E48CA4F39010D49534BDD6D2857A55266B154875B58343E8F7E9B4C419081B3FF9156CD7E2E7D04ED1F9858A1AC7B1BB5A3C0FA31E96A9DFF36A9D57BF36D4B3A63CFC4C52399044B5DDC6148E95A5AA96CC8EBF94A47988EFDEF23CCE524DA4043EA4DCA1B1B84EA463F5E2148BB5952A0A42F838AD1786202451102473FDABFB962221CE885660A815ACACD11F78435336076B74D84D8CC5C430335E9BD5EBF2709CC367B6785C2EF3AC99735A1C768BD7C3CD38199FF5F1E4DB45EC8AC5C6D6B2FDADB59CB67B6BFD436B2D4352448EB0DF751B1080BD11648EB084DA63D483BDE1BDFBFE13F7592C98B39A1C73D47DF4265E461C0EE71F97C57E03),(88403,0xED534B4FDB4010BE23F11F2CDF4B62C72964512EA58752F54085540EA8422638C4A5899163046D122925E48142008990101A1EAD80F0480811945836293FA6BBEBF8D4BFD0B54D5B0EED8563D5D3CE7C33DFCCECE81B1EB0202602C6CB321E6690071C8845C100A003B23211E1C3023D18058F013D1A116705D97218C6098A91A034292D5890C7ED06742C36EC20D490ACF4F6C48DF324EC6C40B5814B59B45EF05346BE82B23A5ECE9320CA9D5958ACB7671C57EBC48CE38F37DDDB5394CE19C5BDD704EEE65B0E31EEB42658821071B246B8A458B16DF528EEE1F2A19F2266F75312EDE61D533B33CFB66C934C60660BB6F964EC99FDA29B4DA3788C770EB1B66E0F10529459E072CD8B33629F22F0E1A0242BB2108DF605A4B08DBA9C095CEF438F427C247A3709D26A68EDD2DC68F8A9113132430DBD95E6A62829483D1578254412865EF9A9E75228428DF08A2C0666A817D2BC2C0A849DB8BFC7E85C38CCCBEF2C88E5FA010DF512D40FD172C1FADC958EAAC728D336D36D5CDEC7A9B4B1BD84BF5EA203B28513A86DA34CDAAC6450F502AD68DF6F5660A70A550DAA49A89EE2E55AF7B60DB5555468999513ACAA38B746E850B333F5122E5F235525BB40D97D2BBF9AB38A97AFCDF29591AFA383A56FC945D21DAAAB502D99DB4543DF2109C66A137D4E4135EF1441EB2A5A2B412D73D774B3D23D6F0074B48877ABB0B30F75422EA08356B7D9240474D1B2DCDBB4A9E946EA08EA3AEC6C92814827EBFF5E400B0B8ACCD344878CA5430FA0C5F0B415E28806035E171370319E098E71071896E319B7E09E9AF40ADCA4AF3F1860F9A0C737313C3A3DF6B2EFCD2C6125128EAEB907EBDAE77BB8AE8D7A1D6A2BBFF2E27F11F53811F0BD0C436BA20FBFBD4ED93CA9A346D9F6F0D617A376E1987F3C9A7FE540E228AB911989ACFDD47DB5FF3F9D879C0ECB029A0DBA0638EB74ACB531DE10EFFD7922891F),(88404,0xED534B4F1A5114DE37F13F90D957E4253A8645EBA65D9BB48BA631838E151B84024D5524191FA80814DB225001052DD1CAD3FA1A87A126FD2BBDE7CECC8ABFD03383B56EBAE9AE89ABF9EE77CE9CF3DD73CFC7B15636EC612D0EABC5661BE1583B1B0EB2432C3311088DCF725E9E1909B2369619F3CFEBC862E9453CB3533EB76FCE085A0759261C7EDA634CA38150DF8345A52190CE2722D669661DB6922E93963D535B498CC0465527C27D0F5E28B51A9112B7498B2F9153E3273727ECA813345BB91356A4262CFD3975B2DAD71AD4B3C689E6CE95C3960E23D8870A87D8CA6552D297BA9EF41E16729910AA650176E33D2855B56ACE80A8565B4F1AF0F1F327C617E46D257D448B152A6D197AA743213F6B36BFF3BCF6F48778CE3BE50B84027C30D83FE1F31AAC19359B17A61F4E73B3C11B1990EF282758979E6E234462F499CB44C42B68C934D3FC71A99E1595D815CDCB981EB93BE1E05BAF970B1843B7D9065886B43334D724E2B1DA2A74E584BA5F4500F97D4844217F7697D1961A6ABA830C640AB4B60FE20A11E35A0EE71F579B65B551D6435717A45D81EBAA267CD4961BD05C858D1644A3B45DC6225AFEBBB2B34AC48CB29DE8CA3B5AEE9AC6632817364BF8AFB27A015BEFE9E9115D4D914E0933D59504325D798974D650247C3956AFF788B486C9980097DF94768AD6DBC8FC1496215F22A2A45FA77E80C9DAF2416F37BA729288023E2DCD96684C2062120A47581C8A29224958AA777D687D80CA292D0A3416EFCA1BB499864C1B310EB82BC7F48E78AFD4E66D023476B5CF51BA1285B5734C4001FA481D2CC3CF85021C831B6FD1371E57DCE37DA587ECB8CE134EB37DD26C191C77BA072C3CC75B1D4EDE6EE7B8E149879B9BE4879D6E6E6A7C66EC917FA17FC68F7F4522370EB2FF9B8386EF1DF47707AD4BD8050AAD7B13FD3F26B25A59C636641E1AD04DA4BFC4BCC3617BF3DB2C915F),(91252,0xED51CB4EC24014DD93F00FCD7C01AD5470081BDDE017B030C60C5275166D4DA72498D204DD6040131251D8A86141D0003E16466C447FA60FFA17CE4CB5C19D8971E7EEDE73CF9C39F71E0425686128CA99AC24E71094A145E00A04FB06D1B634A42A2047A02841E04FFBF33767DE7A74DF9B5F1827616D472FE955864999140496B51E21C29A612613B5E0AEEECECEDCE9C4BF6878EDD3BC4031EF78C44A2B99D8A0BAE15133D2DDA47D301EBBCE494CAF318C4E173ABF3BF8EC163DF1B7CEBD7718F3825937BC1D7B936EAD884CA4A192221470593175B287B94EEF29183E30AA4D2DF9F52175951782CE3333DDB9A6DF70AFF37EDDBB6A45A5330A473D5ED295C246B4CC6AB1102DF57A1E746EFCCB81EFB4D96A54D5B6BF9D8A54541519070CA387E2A3141BE93B0A2158D7000D40640164395AAE6C2B06674120829C4D683A40A99A068A894B1060753716B46D0C97E5743A23FE3ACAACF48328B9D24BA4F41FEB1FC66A7F00),(91759,0xA592CD0E83200C80DF8527A0FC48A90F6336F5C00EDB22EEB018DF7D65C6DB3A433C410BF9BEB6E9850C2D89C06334BEBD90A525734ADD41ED116852F975BD8DFDDCA541B5991C29F01ACA1549F5D3DCCDEFE75842E09772365BBA7C4F14DB7563EA43A6AE6026D2328E75E02A604CC380D65846867D06DF7ADD6F01038C8B2E54549C296E89C7348C53C9E9BD0B41523D144101B2C2330843D39C7698BF8E88DE9CEFC31E8DAA622705859315953B2508FCD19C004F3AD6F503),(91760,0xD597416E83301045EFC209EC1930C6394C94A459D0455535745155DCBD36361DA4A25039DF12592506EB0B86F97EF34FAE76DFBDD38DEDC81C4E617573E4AA3755F915879556AEBA7D9E5FAF97E1D8BF5487E9BEAEC31FEBAACBC7701CBEDEAF61A95D45E1D7C4CB7173E337778AFDFEB1772A4B54FF11F517BB4950239FD2B66612A52C515E156D6AF2A51CBD6AAD7C194201489528323764BB2728B262FB409137BE1C9768DA1A274AAC5533893658D1F8FA0629DA1A9E445BAC68ACA9858ADAF8FA1D56B48DCD9F67A7758F92E258540DF454508D4DA581A60AAAB1AC1AE82A26A25457A0ADC2B32655A0AFFC895A27D53C63AD12217456EA813C67DDE58C57CDB3D6AAAAFF5A4C0B7A85F6225D885E9DDA3DBDA423C0466BD1F4129F816D66D0F492D30B482F3968B1F44A4C78027A25CE22E9252301925E32BD20E9258316925E321322E925E32B925E326967D26B2365EC9F5E0BD2E679EB5F4C0C8D40548A89FA1998983A029AE8E6E685BA77F619D4BCF391004E747026CA410B4E745C8089095FE044674A3071CE89E044C745121D9E898B9C081D357F732278D67C28D16DE544A0B32411ED9F89C26FCAF3D67DD28E3F),(114690,0xED98CD6EDB301084DF454F402E7F24D20F13A4890FEEA12D6CF7500479F78AA299A23077852CA6410AF09488366664513BF3498FD9E7975326E37D4A87C74C36BF5C32E5E99B99D643578EACC9D3E5E797AFC7A7EBC3E9793A6C9F5B57FE59F2F474BE3E5C7FFD389643BBAE97BFB12ED72FFB75D198793ABC9EB20169AE8B7E13B438C1B009124E306E820E2758AFA1C7092E9B60406E74F9FAAA19A19AF54ACE50CDBADD8B4A9318CD7A4F26A426997A9FEB26873BD1544575D3C39D295551DD0471A2B68AEAA68813ADF7A8D54DD2BD6828A28E6E1755374E7D554FB6CEA8D50D54F70284146EE1A99B28F6546B3E59E84CC5DB5E6187AAFCFE92527E212AA74BAEB46099318F0C984B4E75FDFBF9F9789E0E256F6EA585F3893D9FD4BA0CE7E37A3EBE551CC2A736D2BD4968B50732997B26AE5521C8A4BB2DB17523C8A47B8FCDAD2C4126BE6742AD3D613798E96E8B6D8DFA7E1F2151EE7DCC5BCB228CFE0422E7A4CB0021CF39235D084875C439E96240AA53CE499705020D7046BA3C10588633D2658240629C912E17048EE48C74D920503067040D07CB4F12A1C2E10D41382360365813F83D226036789B966E1B998DB4661F43281790FC5F2F18DEEFEE7AEE21C6D42D5CD3DE3A7C444DA1B84EEC5C14D4891C8422BA3D7204421D4F8E03EAFADBC23FA040B94E7840195C27FDA4C17583EB06D70DAEEB1B7D0EAEB3E467E3D2BF798536506BA0D640AD4F885A42F6C0506B2F4D91A425F6038CB4761B0F055ABB1D8EE52C814AFE53CE12C811C559FB308C02AD7DC0076683F8CC0223ADDDC7302C6A094F961F865AAFBF01),(115871,0xB5D35D0AC2300C00E0BBE404E9CFFA93DEC12B489D3E54D890D53DC8E8DDCD1CE2DB146ADF9AA4F0D1248DA4684924D158F42192A0259324181138D26B249020CFA7EBA5BF1FD31942E634880E713D1A827EDAF2893C272CC16DCAE3E7A6724AC256C8F330C4E901E1104A79A11EDD9B5951B983768C3A6B4C95BA316287E1BAD07F30BEF74F542989B0F9809CE59266A6FB652B5892DA6B5BC7EEBEAB7E388944DBB6F15AB71EBC6AFC494A7902),(116202,0xB550390E02310CFC8B5F60E772E43C062D47618A2C224BB5CADF711054208A4574331E79C69E499CAC2A0ED9BB542621599B8DA02218F383110AB4DBFE7C3A2C3B3D4279E81406C80297B9E9A2731D34D81CD10DC8A65C5B7D2E78010E0CA577151F73206FE6E115459BA3F27B5434215334A5FFF888E3AFEE2AF88F865468A32DA5CFF726C76154DFEF),(116917,0xD595410E83201045EFC2091840C4F130C65A1776D554BB680C772F0CA42B57E6BBE80A984C5E4232FFCDC886F7858D0E2DD97E646AF253A79BE57D65D2ACD6F7ED314FDBB0DC55BFA67645265F02ABE9B50DDBE739E727A57A3E7D29FF9A6D6A8E0B13906885684E11CD21B111A20512BD101D90D80AB1011283103D90D809B1C5119D1662001249881D905827FC5C688E9165C4E95C6A8E91AE2081B171253604CC8D2BB9216470F2C763559CBF447116AE3803579C432BCEC11557E709A8B83AF440C5D564221567FE40711AAEB8BA2B908AAB0B0DA9B8BA75918AB317282E0727C62F),(123151,0xAD98496EC3300C45EFE21388A42C51CA618A4E0B77911475BB2A7AF75A2EBAE41748649538401E648B7F901F3BF7EFAD33534EE5F2D859FAF77EFCB65CD3725C9E5794FAB27F3DBDBD3E7F3E6C2FCB65EF6B5F1AAF358FEFDA97F7DBBE7D6EB7EBB8A4BEACE3B31E3F7FECD7F30F5B27BDFC6C3DD9C4DC17CE6400D90212045295E6043204564DC50914F810A5495A9DC40C972839252770C54BD456BC4B2C904889D4BBC68AD75894BC44C53BDD8A77161B04B6BA9277B8B15C3425F512815EFE249DBC8221AC186AABA1986C12B1640EA2A56A1B093433C687131B236E23816AE076DB44A09AE18E22E22502D5C0BD310D9C806AF0DED848A01BBC3726922739D352F51271D0D8BB6D1087EB96C42736EB7FE21248DC723C5D916249DE988179924FB891280F86C6FDBD095B53C0918133C53203FB522428B12D050A0C76A540DDC0A694A5DE37C903AD72E24881B281A2FCDCE85CDCED005B52A41D00BD0C9BC895DD9B3D09F348FF45611E2BFD28CBC78D6BAEC25E26D64DA41FE00E1CEA45583A91F2164E73133949F3CC6AE8DB2646A56313A751E37D908CB326D00619874D6E24DE91647C74AC8DD97DDF403772DCB7BA8193BC5135A46D13816A865D9056750F39D04D399B80B0779D8243E728A0CD3B43127DE1621327A103BCD766864F9066DD151C3AB665D844DCD4028733991C20FDC71E99BC76099CCD049F20C150DAC8E99B17EF93CC583991579FF9CE27C883089483FDDC46E2D0B1E56D1327658D8B772673BCAC5987F19F5F),(126796,0xED965B4F1A411480DF49F80F841F50D90B2CBB8634695FDAD7BEB449D398155D431BB4419BD82009881629978AA228887744838228DA6511FC31DD33BBFBD4BFD03325B1BE3431F1A1494332D99CDB9C73E6CC37C9CA122F850312CB7A3D1E6658A6DAB4E4959CFED0CCC8A41C1C770E4F4BA2E424E5AC15CD58B10AD519A6EF0F4C2A53A353B3D4C4729CE40C875FF62D8EE7A119BB6DCEA847F5EEAAAE9E91F5042C677C0EB4C1528D8A61BBEDAD717AAA6BE93BF7DC3BB499A9E63D8D142AF734436B40EC8FD62D5827A77056E8476E5C19D5732A46B0088956B18ECF61E4BFD336F23B98E87775732F0ADBA9BEA8D5ACDA86CFC1089C3F883A766A25B0478FEBC304AACF5EBFE8F77BB366E48F49B942B465DA35A68F44EE0F61FA533028873E5313C7E2E08CDB135CA49B20AD15A39785F31CB45B3F6FD246EC0A2E4AA4396F661A466755EF6C1A371B761B64E256220DAD2C5CACEB6AC6EC6D9BA9230CD73B0548E6487387B4D1AE19DABEB5BFF5233A6FB711354FCA391C9B515C00AD00E7DF708AB440BE0927D7742DD7CC5EC94CB73113495EC362C75ABB85C32AC6C0D631D4F7C9EE126EC7515BA505A8744933695663D02BC06151D7BED0E26A146EE3247E09B1A2B579488A2DA827CD64032B92B303BD9D24AAAAF776B11DC875413D227B71F36B93E65F2A5B8546BF6BC85CEA6A56579378635041B963565774AD8AD781F949FDCA2AF660E90B7ECDEA013D4BA98401249622F145CC4C07EA969CE3B33321D9896032144C842C109CA02EDE23391965C8353EC4882363F298288A2E2FC7BB1581E744C5AB28F2E898A2F8F91157489E7DF5E4FD47DC15890424CE25309C7B00FA00F4FF1D74B7E065D9C7802E3E1A743CBED9AA0D701FE0FE60DC39EA5386FC1E8A3BBD079E13DEB014EBA7211FC3B32E372772A2A7CFB857F00AC203FE5A36FFC638EF7D00E3772F6500FB00F67F057BE417),(146534,0x9D8C410E02211004FF322F980174D9E63106750FB307D6089E087F7730DEBC79E974A7539521E80A778E9E4F29C3A1570B2A4CB6FC5CC2A0FABAEEDBAD5DF44EE9F30BCF12418FA36AD3A3CC19408E39CCBAD8F3ACE50B78035CA43414FCAF567EB506F8D5AC63BC01),(146535,0x9D8C3B0E80201044EFB227D805A3B81CC6E0A7C0028C6845B8BB8BDAD9D94C663279CF3171F6AC5AA3B1B58E15E72401814096AE8B90219DE3BA4CC7E067B0F74F548B61D862F2878FA1CE86412136B576F2EC29BC80164019B0E571E36F377DDD02E85ED4A55C),(167771,0xED54DD6E1A4714BE47E21D100F50B3EC02EB8D50A5F6A67D81F6A2AA2CEC3A965B9144D8959200D212E38021E075430CE6C7A6B63740307F366E97E567DFA599999DBDEA2BF40C9B60AB559A283755A54847AB33E76FCE39F37D1B927829BA29F19E00C70B7742922045B7245172AF45B657EE85C2EBEE3B5BD2B2E4A6D7D766E21A270D76E638DBBF79EFEEFDD5FB0F6D934F7247A35FDB16D797916D47CCECCA68FA1C691D7298C24A2EE888E1B33E9A9440217203A7DB41AC5E4158E18414D5204967E8AC8F4743478CFE2AE3E32C8451BD6DB54B41CEEF5D0B3B6250CC4AE58282F8D38623F6C5B75F051DF1F8ED76B67E0E87439147CCE4F3C108442D83E04C13E9BA594EE2FE01DCF7E7E4197C71F39214F79951C9D3B3021869EA151E4D909647DAA1552E98E31A8BEC56685625833A0C611E4D69FE12526872808CE24DB54A9D74CEF1EE98A415A43F255A8B9C14A0553A1C82D72E488A75A4EFB1EB722F4CBD07D393FA84E56A1A083D6D4387B4D7A38D33A4E9687C0495E97E8B2A4DD6D8EF2756791F375410ABACE0C12E04B0B7B8AC20A36B3E6175A87E69250C344ED99352634A6AF26BF989559EA1B18A0F32B6DD548FCD4609960A2DB1AC6E0BAB234BDE415A8E1A297C30A586026124B78727490820574DDC2DE36A938CCB20A67E8AFB255805CE3FC5FD29CEED988919D25238D3B61788C6792B91C2E93EA9E52D3967255458EF7C09B2755AA4992B6CECA09941CA45DAD558D9B761F39632ECC63D198F34E80A8D4E48A9F7A6C87326A42A9BE9011A656116180D6A22ED15EE4E7177F45A4EE0F306D65F8262CE60E1535088B60BAB66AEFD1E2432E53049F77A7FC82F6D61CF0148E8B47047818273D848EEF587DB91901B88C03122F0927B33BCC15C825F722F8B4B77B925AF6725E011BD9C875B16D68480CF2F0656D7FD9CC71FE2574561E59BC75BA1C79FFDF800B2E2F14D49F00A7ED1F7F1C4F20ADEBF11CBF94F66B9C0067C626AD4E9F8CEBCB840FAB3853BF63DD8687670EB0484BB75823DE1C4CD695AB45A17B853B4234BD766A3CFD4B873C15B172CCEB960AE6B415DE782BBACA337EC75CDE9EB5CF0D7C508ECB4193C6F7CF2C22C001654A22BAC7DB8E79DBCE6BDF02237F8D732D00D191EE3F31603CF9CA7B8730E3C459321A9A6CD6ADD860AA9D6ACB3BC556952654AFA43AB76CAE29306562A243BC3B322D9A99A158DC85588773A3EFA67F0BF20EBFBC1CE83CF2B2EFDC033B0B327781079B41160A0FE3C12E404AFC7C72F0BBCDF46B818100301EFBF20FCB723AB96C6BBBFBC0BE13EEE0310BEE0C927A87F82FA7F03F5F85F),(168325,0x958D4D0E40301484EFF24EF05E4B313D8C5016B510D15A88F4EE34624962353F997CD341707868AEC594B683C611A04033D393844161EBA7D1C5D60F64030A905155936D0D726B6CE3BE8C390A48B29ABBCE730FC53679F03BEFFA2BF81F4DBE69F28796D209),(176177,0xE5565D535A57147D77C6FF40784F02882692C983F96AD24C12A7266D673A9D94249AD056EC409C494A98B9F75C541030081AA4A2A2882088D1A81541F0C71CCEFD78CA5FE8DE878B4232663A4D67DA4E5FE0DC7DCEDD7BEDB5D63E60B7596D1E87ADCB623559BA2FD96DDD368FDBD66B33FEE2723B1F3AEDC383C64B6E9BD96233CA0BD37232572F094A72A919E3871CCEA19147232F3066E932D98C1ECFAD46C470D5F5BCB3E395B229D4ABB17AA928BF996091F065436B26D867FE02863D9D1DDF291B1BF572E8F8E8ABEF21A606B75B9EE478A6E54929BF65E2C95335AEAD6FB062BC71726E4FC96EE1D20B4564210B752E1B10CFCC1264E14B7559608BC1C6B25CD00A737C0968B589305F5EF9E626FF6687B3CA4C4E5EC8C8E50806BCDE360ADCA3C3C376D74B8C01017CCB845B2343836EB763C4690462CD48EC451E7D32FA78D0C54FD98C66E325AF1B58370EBE78EEB2E34193CDE3F53A6C3D172D5DBD9FAF88B5E75FA1C89D5197FD2787E1B6FDD7D161FBE9F22833FBFF0185F8C12E9BD131FCF438214A76A1DB6AEAFA7CC97A2EFC439251225012A062980A02158354FC8D8AB5FFA18E66B3D572A1B7F754212107700F0A00F7A080264D9DA66557EF9F1ABFF664ED723696F583C0AB56C90DE70D276A35A582E047FA7CE886D6249F72C607983E300A14D5ABC7298951D147C5654A00C978BB5D6E3B86019061E099C3F983E3F133876B64B4C5349414A994A2649F4A3B9F3490D92427FD5658FE65277978FAD3CD64EEEE46557DF380AB151615085BCD6A737975B2A42EC760CD8A6B2C1C953345DC8A84E4E412150B6C3225FB4B6A3EC0560B54CC53711D760144BD92569773F56A928A6FA93075B3EFEE35C39DBE5BD70C5402BE56A9F01AA2C89D98E60C4AF0B2369FAF578F90534490A164834A87CD93352A5638EF5B5448DE1CB4BB9E0F8DFE6C78627FE9861350503D9A6607BB54CC360A52294C25894A7E4A76310B398075FFADFE7BFD7D7A466996120E45F2A32912E5336C6C4C9BAFE87048ECCC99666D10798E12D1F0BEBAC81FA6A1712AFAA9B829CF26D8E62AC6E168B3FDCE8ECE0E568D31FF0262212B540A62D788E2083FC51CBA475CE359256EA3082541FE2820A7631965B5862CD7425809B0C38BA444499E4A6F318354A012505150B215651BCC1767FEDF39D705B5B2C222D30D0DE4E826AB6E73EA80954DB69F5172414AA220241577E4C31936516693EB7220C8FBC9230642A82082BA008009516526CD01008B93545A440C402A010C1144750C4080B7A694D42E5B7B8385026900291F8E6B95283C6AC51930372728DB284AA5092AC55062D417A10257CA7C5A594843172C26026FCC9F8181536AEB0DF09C468137EEBFF7755FA3E295075FDD3DFBA0DF70FDDBABD70706A04223874E1B082CE59B7C4373935F9EBB7A6EE07EDF8D1B94F8EEDFBD0D8DB652ABCDBFD3E6050C4AEB58876C2BC50042DEADA8E5B02E6BBD04FE28584C2613980D3C0EFBF523D0B2F0BEBAA2D4A6D8D634CBEC1C4BFEBE9A86B81A09A1595A821C918F5B7F495B064F6DEA6D8336AB709FBDE69284B8D1D6F83C0475459370A795910E9CA20D34B99866B93996A9F2EB3004F706DA08DE124425516129988804BC0EA850039CEF34F62786D8580E8FB5E769021BD7F108535F9C1D71F2B183688A93994025890F0A00202AC539C98B7CC0C6B14904E7A7129F5D6C18E8D8A252851D159464AA7D1A60CAB3FCAA996AD20197EA043763823B0ECAEDEAF371328A2DC73E2A64B2F470A39DF0ABCC6EA981778DE10077CB913225AFF9D609B3A8AC36BB5F2FCF6AB530DC42E8E152818552DC7B04A108A21ACC802C728270D961B2A08168DB10115FC37F6A3A59AF468EC75CDDDB87EBB839F2006B0992F0DB33C493EBDAEA17184E9F4F5DDF56F6F628D9C1AE8056A9A20F0ED4D587A2803372B053AF60044917429FF871A242587F9144F91D3B4EC5184718622B717E97AD71079D90F2F7FEC5B0C0B267E8BCB5F7BCF9E243FE1B64773A9E3C3AF7E32F4FF1AF87F70F),(182381,0xC5994B7214311044EFD22790EAA34FCF61088359348B31419B9563EE8E34034BA7222B30ECA63BDC69FD5E5565E96997FDEDD8554B497E79DA4DF7B773BCDBAE691B8FF7A79CF6EDFCF9F9DBD72FAF9F8EE7ED728ED75BB3347FB57DFBFE721EAFC7CB753E8E0F739D3FEA78FFE3BCDEFFFED8B35F6EC79EDE17B4F15DF7CC2A66A828A9D16394C5188D1EA342454D5258455B293AABE82B4563150B3C3C9E1A2B58F110B52BABD85693A6B7BA43454B466F7506CCCC75545E113393BB565A12435392D1BB9D01353EC896EEFCCC013733A069A7153137B9259AC40CC079AC253F4A80CEFD0C09AD08D019BB53B43A1D783386C78D8F6A8213CE209C3EEA02E899336FBDF22907E03334B50B8FA4607E722B99D7C47967E4467EEA8BC4639D3EED02001A3377A98D8E4602081A9A4D9C4F9082196A52333F4EC0D06F4D7A3D1540F4D0147ADB1550742F2DE9D554CC9058AA74F850CC505369BC26CE412324D18A00A131CAAAC6E735C549488C275D31425E229B8E11AAADF2E1430142657C983C0B2D6A9821ED23C4D39AAB3ACEC8A3348BF6D24B9F2479FBE30205BBC0B11ADC7F79A866A0FAC8CC215964591FB2F4327FC0CE2D362E503482E0173EB338F88578C5F54324AA7C40ECC3E5432891ACAA87400605912F56D2E3EABBF4CE3B195C7D479A33C8BB46EB1B645EA375D8C2BD86EA45E45EA375EDCABF467A014BFFCA8F12F313F232C8C1CE568D15BEBD808BEF9835C40C854C314E3F2153BC6C9AF213C704853A0CC8BF867D3626C834D14DC4858195A2CE9BCD45F734E2B331417CFDB9B4AFA1A61FB2AFB1062A32AFC10E1D72AFC156F47F30AF811B21645E83170F0BEF1AB91D41DE357885F3AFAD6BF07E0D19D721D90AEBD3B06F8D75406C71FDD03B1DD60DD3A355F80ADB96ED537E7B16F868E73D1ABEB80B5C9218A067BAD39A93F2C304FC4C512BC65F311A0668E4727AF2BE483FFC20FDAFF74E1DF313B9B6747CE9DD0315BB637C8624B994B7DB2F),(189155,0xDD554B6F1A5714DE5BF27F40ECD3188C1F8CE54D2A45AEAA2A8B2C2A35AA2292382D8D0C11D86A221B698060301883CBD318C7E017386618E3803D0C107ECCDC736766E5BFD073675CEA38D955EDA21282CB799FEFFBEE8C8BB373AB6E6ED231EB98999A737153DCAA9F7372D6D73EBFE7A9C7B5B4689DF373363B67A5874DB8A8D2CE29E926FEB219416ECF4BEF33EF1B66B33B317375F53BD362F9D6B73C3EB6A6367932C81049A0F928A493F31656693D6656423FC4CE9879757CEC89DA6810797314BAF633DAB444EBD63F5A38BEF9777B1EE6516511828647098594505C09E227615182174A28A984D69560D2081B14F4D3060885B51FBC3EB7F795CBB2E0F679DFAEBC721BE58B1DB576CE3A057032CAD770B8798B9ABD627B64F7B1FBBCC5E69CB6DF9B98BC376147A356E5E17D62DEC28EF2997E56348EB8AF1E4D1AC7073F2E18BFD0CFA9D93ADD3BA6729AED8AF50381CF70F4AF2C2DB97C6F996D82B31AAE09E6F2BE5CF4FBDD5E8F15D9B13176660DEB8B95E78B3E238AB3DAAC73013F52675D7CB3EC738D022739AB7BE91783186CE298BAFFDC71DFF9D468E6F2B85F3CFBE6B7D7E80D04DCDCF4F4AC63D2F68FE99F9DF9CFE8FFBF516EB33918CAB85FB9A1D6B6A1DB83F39426B6C9A00CCD4B850F4154C67188BC05910EC819D81AA2918A392295D048E4861E1E805C56CF12705403E184E1249CE8E13A868D8F41B94EA5AA368C1289A7CD0E91E26A4AA08514DBB0DD83F4D6757FF3363158D2E674DAA1DB86D4B656ADEB2779558CB2613241858F6BB51348C5E9C10923ABB2ADF089EB7E8C96429AB87DDDDFC08E983C3D4AC6045ADC57739B6AE99D2A77D5B38A91B009DD4BB3CF0C86921E5B1D3B685B57F0A9800944DE86E3FC757F97412246BF5A45E1836A4FB8E3A5B1222D14D08B33C2519EF42B9F79F382990B7B51B8BAA0D9AEDACFD3581AE27535DB33D0C286701E47C4693F8B98A9D90E0C5A5803C1D50FF7418A41AC6054C5FE21FB84CDC656DDADC030AC8536E94101AAEF2172ACEF1CE092E89E349100293C9A6334226A7E0A92570C8DF5246D54A1CF432D61B26E92832D486F0BCB38B08CD661A134118141C614CBE387663019B648378D7C133901F12AB4783D3734B6C17D0AA7B4BC6FB2C770DEE0B5F30C83B17AA3B585C70FA11581A3121647F6510F18361A968DF9B1C7769664D23B4446CD5CDAFE84DD2501E2155C97C8EBA83C3D9AD20637DA8548586D579876F93E52CAA4974A33068A2244907A19C4AE260A5A9DA7E50DE8CB6A38865E227DC05BA80D07B41562B9A69A0B9744C2A74889E5EE0E589628D08F3906867107B4A68C8A472F4E4DA42492CC106FE5B0A019A9847B08D84D22AAA6F40EA21532C86171ADF607C8F87DA847E310DBC35226B328003D98F95BF489632D3CF852FA0C81D8AECE571802A90F2014F1B6E1534913936C1D594697B92663B9CCAEC34F8F1E7D6F66D2540AD677506498892820466CFF9DA6CE974625EE247F418A004D14541ADB331CF19CC3C74606BD77DA13B9A4F6DA78C6CBFAC0E5F37A7E352FEBD7DF3576F62A98E6ACBFFBDCCBB7DF34FFC20B28F027),(193919,0xDD934D0E82301085EFD21374DA0265380C41A9490D82015C18C3DD650A418810883F0B5DB52F5F9BE99B374D50E0CDA2F4025FFB5142AA4285AC32D981B51A480B643927E59302DEE2CBEE68F6756C5316390E8A36E03D507D3D9B9E03B20E4B64A5C992DA16B9E33D04B7AA112CCAD4942CB2C889E89E98349E16F6DBBB5C6811BA57C8E763D347B4759AC6DD2ACDA9A84D6F90AA24E8CD7B9B9458F607EBFE165D0CED5B77A0C841E3F20A0066F2125FCF4B5143B87A2732C943CDB747D6E5F387B32736CCDED0AB57666F9CD5A7C6CF22FCD66F69EE),(193994,0xAD93CD0E83200C80DF8527A02D3F521FC638F5E00EDBA2EEB018DF7DB06587259685B813B421DF47696919791D99ACAF90EA962DAF734CA98B5631A214816635DF4FE7A15B9AB157F5CC8695B7CEA46DC5AA9B966679DC8614022B4CAB7BA7D3F19121D4DBC83ACB73E8C33E0F041EC8BC787FA3CB6898A741198DF234DCA7D12E2D954AD67974111ABEDA63F6151141DA93B7059A39A25F99EBD40F534AEA4FD3044B79D30407C88ED2A7170C9837948C8A60A0EC3B157E16C161F255940C9560B0F9990263918E5B5CD6823A40F8C3E4FADF96C3B56CDB13),(201392,0xED56496EC3300CFC0B5F208A5A28FA0FFD42E1A63DA84082C26A0E45E0BF4782E35BE338957548919B1683037316AA1727A728E4D17ADBF542724AA2050E0AF2CE941D2A81747CFBFCD87DBFC677E89258014748AAAC9DC06E982EA2603EF0025F433A5C3E3502C4C8305DA4E37EDF0F3FD0BD746314751D0105B8B23A5EAF4E023E5055FDF1D2333FA3ACE8193BEFEB501FBB675174634D6508260EA1B062D7B092913004ADC39396A656A7C6C6284D5268D9940CC399795C665EAB60DD06B806BD290208332EAD505C9D26261CBD9C3764D9B90D606EB4B1FC4EA540561B95F069D487366A14D33A8D274F1232972C581506F7501FD49F047C1FFFBF82FC6FF5D6A7D52DF56EE18F05F56EE40FDB7A764471ED1F44BEF5C8C82FBDD6D3621CCF),(201393,0xBD954D8E83300C85EF9213C436E4C71CA6EAB42C98C5B402BAA8AADEBDC9A02E46C29E4413CD8E58E17DC17E2F1CB9E3C7C4E4A1F76E3872CF8F8591CD97356945790596CD72FBF81C4FEB613A9B61499B4C70DE537E0E6C4EF37A58EFD7312F81CD77D96DE5BC7F62189E135B592FBD14F6B5605F0B642D62E3A37032410DD52FA53E3857A547AA9E23205BD1B9241828C498FBE77E4CA7DB672401881131961F7AE1B8152EF3799C73CDBE472640EA1B23304066D4D942D04759BFD62A0281D42E55064560742AA3D252BB8C3C0A8B3E40BE05E2DB67F8BBCF2472710737121490A009A9243B7FF79D929D26BE5672D3EE0250C2D3EC0250E2D328A07A78DA04B4FF978042F016B3B3A0F447E0119C60362C263F5F),(250414,0x5551D14A0241147D17FC8765BE60D78A74C487EAA5BE202222A65A6D1F763776149475C195204305216B252A29102BB58C0864C9AFD99D5DFD8B666653EA69EE3DE770EEB9731194A0A9C0D575312526D208AE4113C314046706D60E35A4CA208DA1948080B42E83F1C477EFC2EED302E32245CBEA477A916189A4048169EE4488B065E4E3B172F856F1A757FE6414DC5C905633232C9C6EA913E5496DC060331EDB0F8743DF6D2CA5E5038ACDEA1F7FBAC0E9FD76918B10056254E8BE139B535EB5E6D98E67BF7A7643F0ECAA573DE782A9337F19929153DED3F1A9A2A11C12364A88DB76BEC2FE984DB068A2A0D2A7A168D0DE27CBDFEED2A9198196B3C70A79A847A53B980F3ABCA4DBCD2F9ABCDCDCDDE62FF9BE0EDBCFC17D2F705B6C33EA6A59FF7E0D1754151925868910704A64949E953156740DD05B48EC16498E9E148E6583AB209040DAC2F450402EE60DB414AE40A0A8B9A5A165593F),(251457,0xED94CB4AC3401486F705DF21CC13B4696DEA1437BA51DC0A2EA448D4D40669228905350D6490B6425AF1526D11545C884A5B6F20DA629F6672B16FE14C5A8376DB2C045DCD99FFFF3939335F181EC6A026C218C726C26C9287E35053E104041B8A2A2D497C5600491546C621701B6DAB6DDAC5827D54B6DA054F660739514ACBCBF216D5582E0A81A6CDF615665AD91C0BE5DD7BC3EA1E5B6F2DE7B4641F542699A1662462EF35A8A38D8516DD66D3EA94FD743E45B40FF3E9DBCEA95D0F76438DA8E9761E6CE447DD6EAD77D7B45BB5FC3CBF2E48726E25233273FC4E2E23AABCD7ABFEE2DE3CD2AC4EC6708C1B320919B0FA4AE7AE5E924F4D32A4FCB832EC0BB35F761ABD46DD2BC9A97AA58A574E2DCC78ABFD7EE2566F9DF36BA773408F43BAEAFA8FDB5273D92CAF6C532D0C816785A925A70555156509100C118A21E1A9ABB91541F15210444052570923206C6D2ABC1F24572E66D7FC86BA3E001A0F02E8043B32D01FA699FA671C0CE338C745A25C208CB90018E3DD7DDF6452A373FF07FD059A0BB3512E88D739CAFE7ED0185D627488D13D46458CAEB0616064627486D13346277FF737D03F01),(251460,0xBD984B6EDC300C86EFE21388D45B73982269BB501693A293AE8AB97BA9746BFE020923AB8106F0075AD2C7875F068FBF73A4CA2DE4DBCB88B27C8C388E3B8763ADD792C2381E7F5EDF7E7EFFF8367F1CB7C728E3A09C88782DDA387EBD3FE6C77CBFAF258D23ADDF2A7FFF7EDC3F9F98A3DC9EFFB9D4375CCE9DAA83DB0037CBB331737460EB069B4A2C0E6CC1580AB978B0196093607B0FE75446D484A95C5B72C41A775B10BB07CB38D89E5B3BA76644A55DB0499301629164EBBC4A3006CB4245860934277640915E2BD24CCACD42D08D5CB2ABDAFB6B576051B76EA95414EB46AD9E4BB687BA314B87A2483762A5D4A3F2FE5A1658D4AD579E50375A35AE64CC018B8AAC5A1B503929A5E03CD63902045666AD649DEFE81C74ED11CDC1BB8D64B2012304762A5A16D18009DE9F16B3710BB39317155EB9B6D0CF519D016ABC7671E3344787AFCC45DED9E60961517A6855F1F99CB88EA5568A9F67931677E7F7DA899A7A37D50D28B8A36FFA72BF1D1908FBED4818C06F5FC2F00AAEF180E0AE8401FCF6F4AF5070CF4CB0F3DB91D2367E9B872C2102535C63A620812BCE4449D81673A32A445C0EADEDA400812E9E564A885E615420AE8894B2F5F200631C83A9008131EB5442309E0A0361D65D2C3924A383BC31867A69C683615C5DCCD3AD1081308E195480D817EBFC29405C5EACDF0904881B48F3D82944EC8B75E41220AE308EC1882F6F21E3C52DA4108130506A150874717CB5793EFF01),(267640,0xDD565B4F1B57107E47E23F587E8F84439380231E9216B5919A440AB9A8AAAACA6D496B554085132915B1B4E7ACF16D0DB8E662C004C710B0C1372C20185FF08F397B76D74FFC85CECCDAC644CA53D53E5442F89C993973F9BE99B13DEE9BEE39AFFBD6D0EDD13B43773DEE5BEE399F7BD4EDFC63D637FDE3B4676AD279D7E776DD743B8DA313BD1A35AAF3D671A82B2323EFF4CB999F66DEA0ECE62808E7E61ED812C797B3AF0607DE9A25456F2EEBD5A2B11692F18531C795A7D300E865388FE2B9C181EFCD4241AFC57AA66F7F0099A555FA6E4672AF73EBCF073566AD2C1969046B097628980607876029C1028225C9A6996C1F146431F9F6A177DAF3BB67CAEB9898F4FA7EF392EBF553337B8451FC9095A16421B13187B9728635ACA421F298C3357AFB8E3C3F01899551E4B636E6C0632DDFCEAFD3110A6D8716E878FFC537F4291BABE64ACE78B767D4E2582438F7FBAF01E87B3D35E599FD1365436E27A9865035F372D2E7F3CE4C3B811617D23242D25F5EFF3C394B566EA7CB79D7EF03CE9C936F5ECD7A7A86C36EA777EAD79E43BFDFEBBE3DFCC52DD7F03F267864E83F23F87F43AA6B640418C2C2B60A566013FECBD2C7CB464C866A90825E5B348351142EB684C2F56ADDDA677A1554A7563628A33973A52E831BF64330181C181C90A534888CF5F7A013ACA4D757F51A0093974715C116044B133A394B51050B0B85F52C8D4449362BE6D2857C7F02F682EDB77701CA63EBA24100676D4B33B56BBEDB85AB605CF0A8F9E1A2BD7A8657CE49A219E9B85EAB9991030CDA48CB625CCEEF81A5E009C136C040B018C425C6B680B47BCF7BC1053F17BC257855705096CC52C68C07C1D9551D3C6144219DA45E5F17EC2FC12382C7D0A5C2FBB393F38D6E5E257825B50D23A2504DE5616013EE82B36E2631C12E0010CAFFB00B17120014A20D0F0B16A4C787F4A4045EDA29402089482A0069CE0800AAEB5094A915643445E0947A740A56C56B7D07FA060BA8D48CC012B125F88E50F3428D0BFE41A86150829550E6311D747F8809F248875F7E2C54F80B224A608C5E73B2B525B534410BF6FB909A156FD2F3554226619E1F01F6566B05B1B781EF8563D90E12F83080AD81215684DA10EA01DA001770BE6AA2EC73C1CF84BA20D46DC4414D0AB528D49050F7D08E9F9275CE4C23DD321E267C58D74CA5901AD55331732D823D6B9EBD97E1905E55DA4AA5BDB60C6EDB6C5196A9485EC156B09D034C9F84EFA292305280C49260CB54778E788A42E02B0230C5E56E9609637B8BC660E3FA13CDA684BD03DFF20291323F6EDA647C266E841A08DBD03EC04B688B8C795CEF434711BC4CCFB3C81ECBF61A99184BB73753D85B0A930B51684D80E0BAC13EF4A54B0683D89E1C9CEE1235107B9582ED933C82A3CC3671699DD471EC5247A44DDB8C9BA9132C08E4E1BDCF67566AAFEDE82D6E61C51A4D1634A726D44CA7E0BE19344FCEF5BAD6E93165F1F98327CF261C37EC8FFBCF269E8E3F714C8C3FF97AFC865096708E0B8561EBA002A3F662DC31F1F4DEA3AF1CF7BE7DFC681C87074AD1E66573B9BB1A3E251122C30230B0A0259C55E011618812953504031A0BEA0060E16B051959B232B14EF5349C34B1E456E157ECB272AF3EBDB925971902AE666832008CFC35723F5901F6A21D1CC04E5DAC137D8B8428A4D4A019B5FD84F04C08F4D60AEE942E2D50B5B1C169646348202E2048350F3BCFCA42FE313390B1AB0604647307B7D29A4628CD5F36B7EDFD4BCC17E17AD9609D65A4408D0163ADD86910ECA28B0E20C0AA9AE88E62B24F1B10BC4048C2363AB43BB31FBACB06D8676821B53043F892D8CAD19AEB268F96B8FDBB60F22B00EDEDC2B5CB4684A06BA78F8DBDA650A17B32F64C744A0148408E5F52875D30CADF3D7C8C3B041846AA573171B54C489769B784E95C443FFC48A875A1AE531D354AF60002FE2B3F9AFC7F03),(276829,0xED565B4F5B47107E47E23F387E4F621C4C83A33C905B93464D5049DA4A55953A0934AE8AA9EC20252296CEEE3160B04D8C0D312E0E188C31D8984080E2D8187ECC78CF397ECA5FE8CCFA984B2A557D88D4AAF2CBD19ED9DD996FBEB9ECB89C979C236EA7C3EEE8B4DBAFB89C0EE788CFD9EDB4FEE6F5791E795C83FDD62B3E6787C369D5526BDADB693DB5582B2975754A8AEDE639B76760E8F1D00B92D91D979DD691913B0D89E5BAF7797BDB2B7D53A955E3B552517B332EA291AB16948960819623ED6D3FE81B1BB572F878FBD58F283342DBA7FEB444D6FCFB04066DEAE577821D1FD5AB89FAFA8628265EDD750F0E7B5D96BE676ECF4FEE27CFDCDEA161A96B6E4FCF6DD1593FC2D0941C22B96AD167F609E8CC229A92F88C25452C841ACB72A15E98934B74A33EDE70E0DA77B71B8E1CCCEA33082AAB95A3E40E6AF5FBCFD0E31B1E1C74795F369874109781798400BC086A1AF83EA83BA070B192ABCFE58DC992B114C7B528AE8A484CCB16692B1AD6528BC00A6232AD054B467E42AC1480E581ADE32E82A85532C6D25AAD9A02F60E94A9DB3DF76E58BEEEB973C302EA12F015505EA314D812B00C7DB98A97EBF3F95AF508584022C802DF00F5A079F2105805F804B02D5052B7FB5DDEE703C3BF5A9EBA5EFAF0041A348EA6C5875D60B986415023A0AAA00681EF9216FE01D7BD777AEFF7F6981AD559E0128A1AC4C8E9C9F239313A5A9FAF987078FCDCB9A6ED00B039E0CCF2B1BA207FA6D1716041609BDA6C526CAE901C8F36DD6F6F6B6F13D5B808BE252C7C19D410794D288EE8CBD6802580AD4AAD640958147848FE2AC4E968565F3924960FC36409B1E3455E029E07F51D69500BA02215053D57D1B723A84D04FF905C178CCAB2884E3762A0C53645755B5287AC6C8AFDACBE16021EC34002DBD10E66C478594CAE6B1321E94F9E30700E0AC3E82200A1C4F4998C04802C4E82BA401890548E18A284EA188082B7A6F4F4AE587D4386263208523B18AB5762F85B2FCE604E4B82720DA3A08E831AA710537C092A72A5CF67F4B719F442C419F22682592C20FD70BD015ED2A848C783F7BFED6958BCF6F09B7BE71FF65A6E7E7FFD665F1F5A68E83069C300ABF926DFE8DCE45717AE5FE87BD073EB16F0C0837B77D1D1D3D4D6E7DFD7E71512AAEB64876FEBC50982BC5B31CA1133ACB512E647C16EB3D930D930C771BF7684B12C7CAC2EEB8753626B5A64778E43FEB19A41B9110D53B29C124A440199FA8BF525CCA94DD36D8CCDCAEFC05ECB908465A2ADCA7A0899114D615F2A131D54451B94E42C23D6E644B60A0CD7616C179446784B617AB222D2581149BC8EA8280654DF19F28F85C5E81A1D3BABA7096CCCC4A34C7D797EC823CB0EA56949669222C903680001819A90242FC8021B2327095C105459BBE430D2B1056A451C15F454FA6C356095E764AB996AD291003E2E933129330ECDED9AF571528AA78EFDC590CDDE2513ED845F7D76CB9878DF280ECC6E2D5A06FE5A6E9D304B91ADCFEED7CAB3F5C3087621CAE1524184D332F73841519811CA6258B4249761C7CA420762678A88071AF9676452B56AF4B8CC8DBD7D6CC7CD9247588BA84476CFB0546EC6D66C60547D01637D5BDFDB03BE435E21AD6AC52C1CB46B1645816AE4C34EAD4212225D09530A6003A16825246B01D9CB70770C94887991C7648F1D03169708C36239217BD9AACCA01352E4E360A3076368A0DFE7730F79ACF81A77D06B7C594A9F0E3FE9F7CA534E6B87F58ADF874FB5B5FFC573AFEBF8E025A7D53DF8B37C8571D93570B1B3FB62C7E547F20D7279DC4F1F5FF8E537DCF6FBF1BDEFB2D9EDB6CFF1DE7777FE7BEFFDDF84E0B38D021D362D15ECC4656B2668CD04AD99A03513B46682D64CF0BF9C09BA1CB60EC7179F6126B864EBFE0733C127CA5A23426B44688D08AD11A13522B44684D688F09F1C11FC7F02),(299451,0xED52DD6E124118BD6FD27720FB042C8502D370A3371A6F4DBC30C6AC4A1B2E00C342D2064876674D6985066AE94F2C5AABA5FC97B65A292BB40F333B3BCB5BF8CDA004EF4CAA8926BD999C3973E69B3327474173281D413EBFC7E30F2E28C887D22A0A22E965428D3D8D29D1B0B4A022D98324B6FADA39EDD1AD7376F0F127274491D862FC597C99731E9F8CA474FAFE9871DD4D24676732EC44B3865BD665C7DEC9D1D246C8051C5D6B71989E9D79CCDA6DCB2C4C8E334F8073F267533B7BB7FA6337ED819F30B34BF5898E0D77478D36EDEC661EA4A2CA9212713D0C27D5D48A2286EC5DB0DA29D765E17D5BAB8185908B957BDC61F900DE10C69C438DBECF8FA1D91AB5F60404FFA3DCD8F99D47F7C63F186CB372DD7E57B5CD12FF074CCD667FC9454D45A34A6245E4127023899E37ECF53CAB1468CE84D944D3E9F137A277ED4119187AF295E827D6B044CFCE1C7D87764A44C3B33304F709BE26F892E0265F8D2A31F21C6B3A318AC46811639BE04F027C20C621310604B7C4FA865D14887ECC8A57B4528777B8D268F22331582B4CD2B4FA0744DB8018D955830B35DDB9DEA4FD2FC250856EE90008C67CD5BB74AD6A992660D0D3F50D004EF3C83E02D022788DE03C2D761D6308098B2B181871B1C67AF5D1FE2AE0D1DB7DFEEDCF75FB5511BC88D0DC3CB4F862585523F198043D94790F03827D917A1E4E081592646921AB4249A5F07232A14C8473488A4497B8060681241B41F33EAFD7EFBE71A3E7E77EA3D1D3936EDB7DDBEEBFDF6ED9ED0D7AE5C08DEB1DF4FDD17A4F87FEFF563D03D50DB9A6DB7A5BFF7FA9FED9EF),(300888,0xDD555D4F1B47147D47E23FACFCD0B7A8B6F90A8BF2D05651A18A12A9A0F44B55E5B6A4F50350E1444A05963CB32618AF8D296003C6C680031816CC87A1D86B1B7ECCDD99F53EF1177A670C0E10B55255E5A5926566EE1C9F7BEFB967069FEA5527FC6A574FE7C30E779F4FED5227026AAFEAFA6D3C30FAC3A86F64D8D517503D5ED565AFD42D336955A6ECC5F39B9804F9475F8CFD38F65AC4BCDD3DAA6B6262A019513E1B7FD9DE36691743567DC12A1FF0D4349B8B3F526E33E1398B18223CD1DEF69DBDBF6F99B11674F27B8C35F4E35B3BBEB4756B679B878CC81D9025A03340C20A90132049205109A82F39BBFBEC606972F057FFB8CFAFF4FB03BE3149B47C66EF1C099620D6C0433B580696262BB2177398E79182CBC64688ADE9CDA56938C6B25C623FCE745C2E3FFDAA5FFE65B5A4BD58E0D92D6ECE895E903518BCA353E0D5C8886FFC771173AB2E79E41647632F860301FFD8A80BD5F708F51FCAE8CFAF7E1A1E9728D5E571F50503381AD7F0EB97E3BE16B04375F9477E691106837EB5BBBBBBC3DDF59FE7D8F3BF9AA3A7B7B3FB81C78B9F0F36514F6707CE497495D9075204BA099A0EDA066835A0E7A0ED8056E2F345563FB657F376360F210AB402F4126819E81ED092D86A9BF86D55F38D8D024BA4ECF37556AF2092E56AF6EC8C9D89B169136BC6487B5B7B1BCF64311F6849A079D00CD0D62144D8618CE50D99320EDADA9D533A6F9FC5806C23CCD3DBD3CB2AA7408CBFAB02D18DC2816DE832DBBBC6B437A0ED83B6F0AE436238D559BE3CCB3339203A4E8FCF99401340A398C84E5CB04C0128E5A7D5861907B20254E7C92376F407903D9C33682B9273B725108F8658D910B984030A924794505BC4F631CCC309B65A12DDA4C3F626460C1E47C744AE6A31A6E3C8AAF8A38616E32B8788B1CAC2B42C9612C622DB0E49B2F9180F63A5453B8CB587F9F23AD3120259CF602AAB1C05322F6A9CD11B5368BF43740890446337695D6C0843522921892218335EF727849996225EA2D82CF2A760234576BE651774A132E2B157FC21A56C2EC67796C569CE4451D9CE25D33785DC27C63506BF695377ABAC370ACB923E2DAD54C6B5134A63722C90CFAE02411D73988D2D10203127BBC6CA8831D8DB34568D03B02E307F04C891D7ED765F8FBC550C3944C4D07369973DC96FF64837BC052D225CD33CAD88EC02239CE4B90778F6FC13EFBD108B4EB3F5D39643EE52622F21D228443CF7C377AE879C9C2CB7E8A416C48CF529565F684EF18E4038EEBDE695919A63FE186859A0C7A069921BAB285DBB1C3B0CC56F772BC068317422BA4CA81C919F0301C3236A08983603F44036BF744D22DEA58478A7248CA78EAC72CA3E0D012D80867D6FC88C27220B5E2AADD4D4C39E89BC9FFDF3FE678343CAC05365A8FFB132D8FFF8C913E563852F5679B1CA7773E867271D6D66B14CD3D66BCA17034F1F7CF9AC1F6357B5881C635A58122FD82DF9AE6A33F276EDA22580D01BB1BC6E4F57D302AC52E291396F0FEE98B92D5EE2588A99042F03DE9F46690DB99B6B16CDB1E8A9A3159C5448B0D279965842C00D5F777346FF2CBAF2F5371F7D8B15F3C50B079F84336A996F90098B06926F3E484EF25CD4A2E3F3803ECEFDBB21BEE71D6725CEB397D22C48453FC8FFDAE05F),(319768,0x2D8A4B0E80201043EF3227184005CA618CBF052EC008AE0C7797495CB5AFAF0B14DE8889BDD53E2C42051A94983A1921C5A0F2ACE7B1D539EE14FA02B2920E74E5126BCC497000296625D5767397F4FFC72E9CD386426BED03),(325419,0xED53DB4E1A51147D37F11F26F30582B7768C0F569BD887C687DE1E9AA6195B34A48169184934483243212223027504442836F10205518CE070F563E65C86A7FE42F7CC1862FBDA87268D9993CC3EEBACB3F63EFB9CC5734E2EE0E6A69C638EC753333C37C90544EE31C77EF689DEF75EDEE3626744CE31C9B1F8F80CB522E8B6400EDAB87D63C1CE3B9EDBBB222C0BEB26E69C86CD81C0331B61E67D6BA3239BB426A1DE1ED2CE497A0B27E3B3CC1F6240C1D18AB912181D794BAB55D4DE19B237DF016628F57B339239B937A3ED0B2C5B335D8E5923A1CB5D46974B7A28A487C2BA7C60D17A9941B98ACF339B4BC227FFB2C0BC143CC2062FFA2DC56C839E5D9A72412886486750CF2C4355B334AA1621E12C03A1F15DC2DF143B6C570695AC15C2D9065B712B7CF266D1FAE3EE3E554BA47042DA49F350A01A0CFED633D1EFF1F0BE0D139B9880FE9A67CA57692E0C4921BF11CEC114D79ABA14B297868821ABF4B088BA399CCAC2EAE888F9914C19B7AE516717274248DBC5B112553B3852C509EDF9DCC2E2D2AB174F41FB3533EFF6BA3C3CEAE5F19E0C008E3621361A3776269C2F91CB6BA4C58816311A6120A08E423B71A429A08B6347B6AE2EC5F06502C6E0F007BDEA53B9A14BCA50ED677707B5149CDC35EBA8D7A97A3928A4CD8BFEBA4340BF90A2F922D2A4C1172048666A4BD9B8DD326A1A3ECED929EC0AA124A4C55127824F43E4FC18948DDB2C39EC9B528D53BA9F32FA7DDC3BC5C928F0AD5EA04E1AB58A247B61A432F024A028124EC073C3D1329193444A53B5817B757CD1255D7581F7B90566CEB7EAF2AE0966EBAFB69156802CB8D524F96D124DD28A626FA0472A2D37A1E948DB1B644AD068D45640C2A85D415EEB66C7CC9B15565CA2E816BC2C78C9617AE991857EF47F70F92C16C73AD899A00846635DEB6B3E7E481CE758B767D5E48010508277AE9C7E70E53F72E5F85FBAF2C193FF9D2783BF00),(341784,0xD5555B4F1B57107E47E23F587E6E12D6DC62231E689AB656535229555BA9AA222721959B0211265222B0B46B6358E33B57830DC6C6989B6D7030C6DEB5E1BFB03BE7EC3EF1173A67D77548D43E558AD417333BE7ECF7CDCCF7CDE272D81C336EC7407F5FDFA06DC8E5E877CC781C7687F5F59467E2E9846B7CCC3AE471703687553BCFABD22A94B6E865F4EF9C71C93DF172F2D9E45B96B3D97B1CD69919A799B13C989AEEEE9AA5655E6D2DABF512595B807864D8721B09CF413C66E999EEAE5F69B1A84AE1CED5D9DF30A7852AB79EC8FA5EFBE9360A3BA1D20908C68922F81421A408730ACF2B42C688AF8C2BAD75FDB008A5F5D991572EB7E547D72BD7B8DB404D9ED3FD5346E0C58208BF8F350D5BE8CA052B7F2583A4C316CE3EC0DDE1B83B360E935A9687EDD0B08585D2B17E9C34426C535F8818E1973F7F6BFC85E62A5D39205B7B448AB31611DFEBFD687C9E37E3E3AEA9772C87C3338E7AD8D1E4CB318FC73D396145513826CA7D23FBE2CDF3B129E396C3CA5987BC1E54CC3AF6767ACAD5B9D8EBB0BAC77F37F4C070A0FF1E67BBC7714F0D36D784FBC5B3BB7FBCC663AF17651F18ECB5DBFFB3EC83039F4DF67F91DAF2BF129AEBED45D55853E92292631D24B644576428D7145E509B02884B20D6D4565A952485F77D33E21C1DF9850479A86CDF34C3F8161643E59816DF837818EFD0FC25A472D77CFAC9B4FBCFB1E9E9C96B7EEBA6292ABE86E29F577C79C55F54FC7EC52FDE3483C830EA1C7DF8C8F9D3C327102842AC8E0CDD5DDD5D7A3D03B135885ED1CA1994E250F7C182844478FCE1E83804393FCE819682502A909D2CC2417E5F4F1E694189A44F30C67C3B2E15F48D1C49EE803FA695B3ACC152819EC9E46455AD6F622310A8414156EB12691E9BED938310C476A9748426C11AB0073363A155DE4C5DCF2F29C27B45882B4216558FA0E48AB06CF4855D40FAC0AC80ACD7B4725E3B996703AAF3662974730E2A15AD2A4164536D8458E9D2B9BE10A5FB3C49465941B102E4D7E07D0A470C4B616815D86F645D4F0530561B19926C7788B0249D41CF202DB496914EAD474DF00FB0A520D3469E2362FCAB11E783C7A396AF9D8FBE87980F1677D0F4B61E486DB75DB09F80868CD06A130723B66F3B9D4E6C0CEBD2AA19ADBAFBF8076C8021060FB5F2254EF4A6998278144D871D6AE7174883FA986631A6C1D9ED366854391B498BB6FBC88450AA1C356FD05091A9D9E4110B9D43D2417D238EF4E8A591EF469CA6836E6715DF81E26F2ABE8AF16BC63934975922720D2017495571313FC1EBF8ED1F40FD8B863FCF14FFA111ACA16911AEF3CA1716E7C4F3BBA6BEB69E1E0E399850A96D104FDB7B110AA8B2AC2576552974FB4D48886A33814EA38B35C20B1F1DADCEC3B2A0550F21B2C6E42A27692B81DBA45DC5E94AC58455E55D2D1B36590791B50F87D867CE10221710D853F845C81F42C04F8F04BA5355F810CA8338544E6B6298884936ED7A8404A26C8F0E788C757ED170D9115CAEB3DD6BF2BAB04C70951A35ED721BA2B2496DF6C24415C28690FA46BEF385C08D54E516DA94C137702F7DCC79D10CC98AECE371CB1EF848EA7522C6404CE1B784ADECC51E06AC04B6279B64ADA1E7E62193215559BBF02315AAD89E304D25E8D62E4268739B68D04FA0B136120C4138008BDBD8B5498303613B7A9A80BD33922B2019A4711B707F135AF6807DB8A2CCA69D3B1090D1B2E6BBFA6E94B4CACCEAB963ED2888DF04F450E7262E2B156BE81E2CF1B3FE8BF4FE05),(341785,0xED545D6BD35018BE2FF43F84DC0F72FABD537A3115B44CAA37C30B11C966A7BD6823490B2B6DA04974EBCC86C3D565A25D916EEB34ED5619C5529CFE98B7C969FE8527692DF5462FE660175EE53DCFFBF07E3D0FE17110973238120E85A2D1388FC3B824E179CC3E17A5DCE31C9F4DB37109A30066ADEE6BFBC0B05EEAA3CDB35F9847CAE456856561CDC5029118664BA5E418616E8A79BFAF4C4E2BC38BDD61BF63EF6D583BDB0966B612CD5B55D3854B7EDF43D26E0F075B536AF911C546FA9799976D1C4D5EB355DC0C199C59CA94472E0CE753DBEA18E54561992FF2D2B30CB3C8E7A54251A0A15769BF475A5D972CD321EC4A8BCE916048EDAB3B72AD411B25181A8E3E56AC037D1C0E4CC7DCF742BA90B3B1ED85371EDCF1BED6B7B7A47662D78FECC18EBB0CAD2ACBBF1D4A2A64B3BC5874310EB35E8A7353C26A5A9232428EA5E747EEF9631EFAA4B092163D1666111B9725AA0D9B5ECB8BFC9418C46C26FB745A5096A9909168880B5C56C82017BC064282B20B4A17D417A0180C283A2887A056E9E3DF298CE6C3B13984E602DC95698D42541C77DD0F6D504E697B3A89D338771A3FC8FB26A937A1A2FA7D7EDFC2D2ADE43DE6FEDD85542A99BACD2C81D2B27BC7C3FE2BA7BE671D9AA09856DF1C0EE8110C501AD6F72DA828446F13D343B42A689F41D3415B07B5096A0FD463D0CE41DB04F5CDE8A4E3D1DE81AAD36E57E43C8438C485DD7F4868526A45CCFFD97968CCF96FBCCB1B6F72CAEBEEBBBF1B49FE09),(355571,0x9DD04B0EC3200C04D0BBF804181B482687A9D2CF822E92AAA4AB28772FB46B90C20A8F259E606630F6083F5819759AC1067B82052D4C394A497947E9737D3E6EDB25DE694A70A0414731651E40AF35C52DAE4B890CB2E50C79FD4ECBEF42040715371D7FD974CB5A95234C1B9560C3D9E7E6A18E7A109BE0C68A2A0DD576ABAD02A4594050E50E547B5B6DA1AE8E2AC879E7CF9BBEBB53D75043EFF7EBE8717C01),(361099,0xAD903B0EC3300886EFC209003FE2E0C354E963A08353D5E954F9EE35EA431DAA0E5118801FD087601296BB4A1C3DA6314FA66A775018BA72A60805EA6D7F3E1D969D1E21F78A80B798042E73D545E762D20B1022593AF4CEB596D7BC131830406E4F34AD45F31F7453A16E8ED31BBEF5AA20E03844FADC811BBEE80BAEC22BB9F137D7BBC0F6A1F600),(442487,0x5DD4CB6DC3400C04D096F85F8E528D8FA9C170EF9181209EC9F161496A29527A5CA7AFE7F7B527A6EDEB71D9F57CFDD295AD3CCA150E97EA0A10C78D4B1D1F088F2B4B29B9C3B96BB114BC6E694A67961FE50AAB951C9C33CC36A492AFD1C96F72C76B84CDB953191FC230748AEA29255D12F7839659C6C10DE1C8AD70602B043588351A37CC0CFF08A69B298358F71C887D4F45080E9EF2560E712B97083BA674E65DFAC3F72E94B2997769A24750BF5E5DCE5C70B08C1B7E8CF6EAA69F608E54DE6C6AD0210D4644D2693468CD107396AE91767F67441FDA1C6448476F2EB36D9848AE9CC313CC3AD94ACE6DFCFD0A5E3F),(443679,0x5DD3C96D03310C05D096487EAE936A7C4C0D817B0F07013C5F814F0F92B80DFDBA2AAE9FEFAB2BCAFBEB75C9F5F3BE5932F9E18844C8439DC03C340FB18316C472E7CB1DA60F812AA26FA2646635D1324074189F861B25F214A1C861353839CC6DF9618A812EA7835B48EFA47E2B46E86DDB0C9D6EBBEDC454A506BB5176D24F1E975DF5244E063344985DD4428F80F28E28275A369FA279B013034A343BADA72A959DFA045B79F06B538AA6A23254CA1A9862A7D04CD6B5BDB0479DF39B09389F0594F3C10A1C0FE8A37EB809D7EFBBCFEC5D7DE7FAC2915C4FDE3F766C01E492A2FFD29F39FE56271CAF76818EF7D9C3F1ABA6F87E8B1FFDB5F27AAE7705793E6338E28F6FCFEC7D9E8735E7F01CF3BB6DFF4CF9EF0FD6C1467EB6FAFD0B),(449641,0xB591DB0E82300C86DF654FD08D32477918823293191403F3C210DEDD0E4F2846F1B49B75FDD6F5FFD79C24B58E8C3172A6D39C14B50D2189C6964B713C3B921CE8002430D9CD5776E1335788943324B0DFE32BF1FBADBDC71189DA96B977D5A6E721C96D1040F71C07BCAA0B5B8BD41104624EC416D96D6B2E49921842A8A2F1A5918A2E3CF84723EA2B2388D38D740DBBE07BEBCADBCB9082B7F8B1B7C14FBD6FCF1182544F0D9CABA78E41BE908A1F4E224885E88752791D00),(449802,0x5DD2CB7143310805D096F87F946ABC4C0D1EF71E7991791796671008905E27FDBC7F4F55B9DBCFEBD0797F2E9B4A02582534C99332A99336E9C886524D225DC85207AA5B0C42CFB7E528209B3554E634CA87624970583C5580290AB9CA9110550D27642AF4AC659B3D683091A9165436CB8201FD8E001785B9C00891E60A2CC54D4637964ABF9B45362E27BF233E6C7278D0CB0C9F8CC99C84F1DBDA169F3698988D1DED054F7A1DE20C16BF0F0556B1167470F872A06F73BA9CE8D29EB68A658CDF3F25C36E3CDC3EE2CE32EA7DBDE33DDDBA3CF39564D996F7F95A9EF729D3F2CA175D5EF7E9EA477DDA78F93FFFF307),(455461,0x5DD34B9203200804D02BF187764E9365CE90CADD633699D6E52B8442D0C72A5FAFE71A60107F8F25EBF57E2EA88EDB3F1356F3A38A8805C881D1CB26E434132557E0881704499EF069F6F4041B6A76D9C9D8254FB7717F803AD557B18A60D791FF6D388BAC9188CBC96E04DD5743D07C3E6C624EA75CBECED7116F1CFD273CB9DFC94E6357575CAECBDCCFB41EF79F0ECBC373D4FF8E93FBD90F0654CF0495946F2A2E54DFAC4CF5B21D0EEEDFDC82EF6FEEA1741FABBD82DB7CBE0070BCDDC1F13D1D1536FCC89F117EBFB6ABF1BE5DD479BF2E23FC3FDCF6F34E768A507D8F2EE3FCECE679F9DE37EFC32B43E634CFEFEB5FBFEF0F),(472861,0x5DD3C96D03310C05D096B82F4A353EA606C3BD478320C0FF393E531C8AA4FC3A9DE7FD7DD62BCCBE5E47CEFBF3CB4D604B2BD398810C6FE216702D8249D1AA7F844F858C20D5CD99141D09267414D6E9CC60D2E1F52116D2DD313747315A3AF8A92AEC37EEE804A96B480F65627484DA1F71657274B0D024AEEC215E724AE9701930650A72D3AC61EC7977E2C48669649443A14C1A6C5662470F8309A3CB1E5BE0A4108772B7070A959442F4768B5B2853DC6F595A320BD90277AEBBC2466E61F4BE0D64592D721BA31D54E8FE00FBBD55F10F7B1F4E38B121B7CD4A9978D842F0B00BCEEAE1121773EF0BC66BA4E0522EFD6FB09F1F),(492012,0x5DD3D96DC4300C04D096781F4E35FB991A16DB7BE4000966ECBF074A3435965F57E7F5FEBEB67B44BF5E975CEFCFE1A8EB204B92A885EC59A059183245805E89D530C76A09ED9DDC46B660752570AAD58423AC9A12BB05B993CC623673984B5CEEBCCA34A6034D308D0DA7A94E1ACAC4BDA389538D3BB6DAC6D80F3DFEA922529D68CB8E87A9EE03F11D87E892033EDCAF4B1E567475D1FA9EA0F7DD1705ACE719B46334B7BD8D7CAE0E3AF9BCB7A97FB506DB1A3D1DEC19EA371BF3F0B2531EC6F9ED04BEECC1F5A641F31DDB3CBC6C7FEC777A1FFDC2C7DEE5E4C77CC798AF4571BF12EE5729CD6E9AAF8AEEA3D5F85F9E9F1F),(512549,0x5DD3596E43210C05D02D791E5E5793CFAE21CADE03AA54F9FAF3C8188C31AF27FD79FF3E4C92D2FCF37AE8797FFEACDEE8A0E9B68C6125665E96692182B87181430BD6679483D36DBA441BAC366D5416CB392D09F55ECFF3ED5E006CA560175BF6E544EB8A6B815B61BD4B40FD6E78DEE917E4872BD49FC2042E782FAB4CC86F1774C6ACD7295B967579D6E71C183FAEE5F95EEE42CB0CEB5B717D07CD7EC59D8069699AF5C7E90F810BDE3B52C9C066907FB62B30C37C4507CCF3B95DCD789210BA5497E779673A5DC002FF27D91DF285315F056D0EFF392D611EAE673FD389D1F8DFD32B6A19F68FAAD9EF2C817E9E6982FE5FCFFB1435FCD712FE9F87CF17),(513450,0x9D8C3112C2300C04FF722F90EC9824E7C73081A41085C3E05065FC77E4193A3A1A497BA7D985CAD3A812E624212F0C3CAB0F148153ECA442D4F7EDB1DD8FABADC89E1073DF13F1DCAB1DB6978E03A122DACFD19B572DDFFF44C414A784DC8CF2A737FC7ABDB88C71706D6B1F),(525875,0x5DD2DB6D44210C04D096FCC6BEA9663F53C32ABD878D1469C69F473630805FCFC9E7FDFDA8E484C6D7EB91E7FDF371A5B6A02BD4C147351B6DE7E0FA13628ACED3D4DF6DB85FDB48A233BAD0A33A6CC3F3C69DF69FE8C4F367289F8AA7253AEB28BB1DDD5D9047EDBE40A32B65D80AEFA77E6F847557C1F754B73EBD4CFD9594EF630387449DE566D37DAE67F50FF7A7C4F2AAABB2E97E71FF93FAEF8760DE3B6F8579CA7C6C99EB91E4FBBFB87F95E3BC697BD37DEEB808AE9F0A87FFBF459AEF3FC7722D9FE55E1EB6C9B22E1BBA32294F1DA9E561739EB1CEE55ADEFD98FF4E30D53F133C6C9CEF3FEBB22DFB722CE7722DFFE7F9F905),(536847,0x5DD3C96DC3301005D096665F946A7C4C0D867B37052480FE3F3ECD90B3807A5D9DD7FBF75299888E9FD725D7FBF3E7B1A7F37C025762BCB69F6E9B01BB81A705F2D7C7C9F9F08A403FB7834CF98B56A8777BD00AD66EC8B7314137D8C7820CF5C3ABC013467ECEBFA9386F662B785CC81CC7F313456E32CCDF143FC7173CA1644727DCB7D2105FD8BF8A843A3A17DC0E71D52CB0F5A09FFBBBBD414E7088919D8CE7A9DF638ED3FD5AE406C3FFA3E2660A8E84FEF07DDD4E2773BCC8435E740999EA17D52BAA57304F18F69F82FB3B86FC4CDCDFF17FFF9F2F),(546291,0x5DD4C96D04310C04C0947888D7389A7D3A066373B7D68001763F0B1A52AD6B5E4FC5F3F3FDA84AA4CAD7EB91E7E7FDE79CD0EDB2C8ED16317059929B3CDBD352CB37808155DCC8BEED21835625437D6836BA04DC19E881FE312264253B99EA35D146F566E4223799FA3BE573AA3F94EF1C32E53B5C4FF307E52FE8975A902F0DFBE78926E3F727613D792FD076F581F9EF7D84F5B526E46F6B38DF4ECCD7D94A86F1519C6F2A763F13D301B7EDFC7734C026B0FF1F0739C94D86F95CE13E7D6CE030FC3EE03D98CF40BEFBBCA0FE3EA7410FBA27C97BFF2D4FEF71178B030E58BFDF1FCC3E4FD73AFFF9DEBF),(547047,0x5DD24B6A04310C04D02BE95F52E734B3CC19C2DC3D9E40A0647AF590AD2E19BD1EE4F3F3FDA80A14F5F57AE4F9797FAC16166CA4CE72A3C9A622B2AC1D97931D9E4E7671E3BA6B2AE7F16E703F9FD3911C26C6E723CD385FB4279F4F71E5BC95295CEF81914DB3A7D868EE6FE6C3F39A5514CD639E48B9ECEC5AF3D8B9BDFE171D33EC393F24973896D5DAC80829AE23115CEFF30254779171679F172D769E0767F708CDEF7612E7E55A2E013BB1CFC32F43D6FDB37E9CCF0B2B7F044CD82DBDBDF6F963DE3F4F39DFB6C632F87DFFCC7912D571392FCFF6C8E5DD0FD0E5C6EE37739BFB974C729EB31F81E53D7F451BB6791FBD5273F5CF58F93EDEF5D4D56F94F7DDA126BDECEB7F381BFC7FFFFD0B),(555599,0x2DCA410E83201484E1BBCC09785445863BF40A0DA52E68A2313C5D340D7717A3CB6FFE8914FE33456CDFFB4788279596580C9ABA536208DDDFDF296DAFFC41500E848C83F3E6462A57C9B4A62D8E588B2EF7B9239C751E57D07D9E63F9213C43ADF500),(558721,0x5DD2DB8D03310840D196CCCBE0D96AF2B93544E93D444AA4B948F373840D1EE071655CCFFF4BC4E494FC3DAE753D5F3FEBDD2A96779B6E19563A0FBCD7B02C38CFBEDB65056C0BF9BD983F6CE37EF87049D08AFA1DA6BB009CE174EAB00DCFF331BC8759EFF07FDBCC77D8BFE375AFEFCBCF82630D9F18DEC3395C77CB1A16EC8BF706219F54A1BE2EF4E7E3A08FC0ECA7F702A19E6DF4D3BD3FD84569C37B3C4C87793F7CC41DFDF6C27E7718F3FB18F972617F3CFDD0897DF5EA11C35B6338691B71437FAA94F98AFD68CBB0D23EE23EE23B868BCE719EF36DE3BDA717ECEBD71B),(561892,0xED943D0EC3200C85EFE213D840F8318789D224031DDA2A49872ACADD1344C79201A14A95BA60FC40FA64F34CC782D7C044D22292EFD8F23A1F1ADC108E4CC58C90617E5EAE63BFB461007F280C2A46CBD04F4BBBBC1EE35BA6187592D3DD86412BE130EE5D3AB84FC338810F8C7E8B4B358E54E4B21CAAC911F97A44550E6539B2E2FB9CF54D55AD4764394D4DBF1999E5E8128EF8C431C6657D1D0D278DD5D6A6A1FA499F9FF6F1EFF3329F17F9AFE01F325FF179605B8DE33461939BA76D07),(564190,0x4BB432B4AACEB43234343132B734B74EB432B0AAAEAD0500),(567357,0x65D3C96D04310C04C0947888D7389A7D3A86C5E6EE19C006D8ED6741E2214A7A5D15D7FBFB523DA3265FAF4BAEF7E7D71EE8A0F570741A99D70FBA94BCE3432CD199BB7EA8C58E0F338CF768743AC41F5770EB31B2834BC1A3FF7CC8414E72911B1CE43225EFFA29D67B7F9AC8AE9F9E3DE811B2824B0ADC73C8903F15E6F918F63F0997FB882AD8A1DFC77B5E9D35FBBCDD0AF3E86931B293773F23924DDEF399FBC129D872CF63522BD0D0DF649A812BA05EB661BEF64407B804EE772AA3D0F03F6E179CB77AA09F393268B8BFC74AA67878FF3379563FF7EBEB72729093CCF14DFEEBF7F303),(591662,0x4BB432B4AACEB43234B434333233B54EB432B7AA2E06124AA905F1C5F945254AD6C540154A26201A225A5259900A15354088E625E682458D80DCC74D8B1E37EF79DC3CF371F3EAC74D3B1E372F7DDCB8EE59C7B2C78D2D608D06701DF1C9792011A00058C2102C91525A945892998F2203D1929859949258928A2401B13C25B538192E585B0B00),(593811,0x65D3C971C3300C05D096B02F4C353EA6068F7B0F9D83071F3E3E415808518F937E9EBF8785A85B7E1E87CEF3F5EFFB04EDCDCB180FF269F32870B44DBB482CE732E42763BF6B05EB97A17E9A613D735AE66598373DB07E61BD228578DF050D33133B5884C1C6F3FC2CAD737E5665A8E70AF3B26743FD60D82787BAA2C3D0B9E219CB8D2E595EF9B5EA972FAFFAB5E6AD5AC6FE41B98CEF07CE5B89FB6E86EFFBB62F43FDC6FBF536E667E6722D371AF7D7D5046E9EF1FB03C9EC772F4C409C0DF6772F44CF7E72EF0F831DF3D5139DF0BDC468B9759E4FDC09FA45C9DC9724A9A00DE2758F38ACA4B04FA5FECCFBFA03),(599342,0x5DD34B6E04310804D02B198A6FE734B3CC194673F7A048235156AF9E00B70DF6EB497FDEBF8FE87CB09FD7739EF7E76BDF068CE29681CB71B9B63D9AF203A0FC88CC6545F9AED738A26449B6ABB18DEA4BD22F27BBAE780B79B6C4F6FD7F1CA3F3E3B8DE4EB6E332C783F32585F2A583E266E76C3B629FC754697D037AEF7FCA0BE4947DFE1967EEFEBA18F5630CB2F3FCC7BDEBE318DDB768ED2683CE933A0D211BDDBF4CAD5D5FB3652147925BB0F3BB7039F67E71D477BF70A0BBFFE3EC436EB92D6CA5F56A1AB02C62EEDBA8261B6AD7CF786BAF3F0D3EAB3F80CF0497ED007219EC7D5F60927B5EB0C47E8FFFDEF5DED5BB3E0AFBBD62D2A5D9BAFB953657809DDFF8E70F),(608933,0x5DD45B8E04210840D12DC94BC4594D7FCE1A3ABDF7B63299C4CBE7096221907AED8CFDFEDDA22652F6F3DA63BF3F7FAE21B77578344F7A2A2CBE60533A2B6FBBA634FBEDA885F85C55B7D325689E3F467D19ACBFD6BCEBF3617EE7BBB23F6E3EC66D8F75D7EB2182FC298EFCE599F04A6DE6F9AABB5E2F9BCD78DFE368E6F9C97A6A55F7FD9E1881791E4F8373286DCCCF4557C03287D1329AA55969BBDF1B7A4606AF40DC04FB1A7636944EDA259BD10F4BE57D19887BAB2756168D7D7D8CF37328E267FF113FF344BFCEBADCDF3FE998FFE9F68C66C61DFD7F2CCDDA6C70F17E15ECC363C4CF0F479B71DFF9C1FCD7F3F902),(617118,0x858F5B0E82301045F7322BA00F2A4C1743AA8C490D8229F5C390EE5D8660B42AE1ABB93D33B9731C0A9C3C0AA92B55D7D6A1C469448D30527786390BCE12A12F38194EA298F1FD78A1536C7C0B76FE4110CB5BBE497CDCE81B2B84409D8B7EE8179E41FD0187D05200EBB16052AD84DA26EF3508B2364A1C3848F53B961FA1C1A6B46C05BA0E91563F6E7158FE57CB2AB6FDF4BEDFA6C56B625F40B0404A4F),(623296,0x5DD14B6EC4400804D02BF129A0714E33CB9C6134779F56A44805CB67ECEE2AFC7AC29EF7EFA39692AE3FAF479EF7E7CFDA9A6CB437B92D8EB15106768815BB50B24CF7B968D961BB21967B3AE6BC2DD99930F631CEE37A2B2D8F3C7AEB711E4D28F573D328675B08E733D7A3CB7CDF5DB89CE59E565FC632F77701FF1FC75D30A65B861B9C2F6E5C9E07EE93E51ECEE1CC1EF75589F2F9AD1879AF9DCF6FF3E0BEED75B09CCB677AF4EB0ED01C77DBA6CB58EE695FEF7BB0ADFCFFFBCF17),(623522,0x5DD34B6E04310804D02BF135D039CD2C738668EE1E2652A42A2F9FB069C0F4EBA97C7EBE1FB5A3AAF9F57AE4F979FFD9C7141D1382CECA46F711F218C7C7CDC86DF8BD128D83B68A40D7D8EDBC7C2ED7E5BE3CE0164DCCD74BECB7438BCE57D3BC46CCF1FC68357E7FA2CCD1A71CF34D4D257B705E33DA90DFC54D92ADECC679AFC715BDE12687047A0BB80DFDB87E9E1C6D127639C8D9589FFA96C476631F25EF86A22B0FDDEF5D19729D414F29C64D38BFED38869C7C3E87F2D911C179EC83865EC6FB2EE175B9C907F7C3B760B1CB148FD661E3FFBAD3AB73D01D54DFC7983FB61DDCAF50EE7F9DF89EB1E3A6F39F0D47577A929BFA89DD27254F62BD294AEFFDF1FFFDF72F),(624463,0x5DD3CB91E5300840D194F80AF044D3CB89A1AB736FBDA95970BD3C250432E0AFA7F2F9FEFBA81D37893F5F8F3CDF3FFF1C9367FB78193CE2DB25522F37AC459B32BE4AB72754E8DAF54A4FEFF332C37B3E3E709F5DAFDC6CB65322616DE4CB7314EE42FD63B9E35BC477BD564D830DF9FABE70E8C2FD0CC6670EF29D1A7919F1EDD12F0F9DB8DF8DFCF319111CBEFB35F778F77B5C30CF71B5A003F99DF3BA467FC71DFB726DCC1F07F783F3B8EB23A8173DC8975E785F990C9C4D9733BEB03FD396F172D398E78C26DEF3F940F80E1CAE3D2F97BB6F03DBFE5FAEA36115A76DF7E77A12F9CCFDD08178B7403EAFFDBFBB840CCE435D5F46BE40FFAEEF82FCF7CF2F),(646977,0x5DD35B6EC4300840D12D01E699AE663EBB866AF65E4FA54ABEFE3C210183C9EBA9787EBE1F5D12E9F5F57AE4F979FF3957EBE98A31B826E0D675BAB5CFF755A206EE3AEBA97BC8658527CEFC1A629757C28E7E341AFD685DF9BA25E8E9C3A6520687305E097F1E9C5E96673D0B51C4C3315F4B113F5D86795B87A15E8F9EFDD92CE69F443F4BC482CE81F71D5E5678755EAECBAC97C97816F3B5209F16FAD91782FDD903637C378CF8DE68BA16EABBCAA231AF6DC3F71E1E743BDCC3F808E6171A88C72E40735E298AFAE90397F3FCDB384FB7E5E5A279BFE38EEF27E69CEF1E17E26EAA673E5F8EFFE1E3A155E074380AFBE4C9FDF4ACFEF7FB17),(667791,0x5DD2C97103310C04C094701F74347A3A06957217D70F1706CF2E2CC8C580AF937EDEBF87D5A2487F5E87CEFBF3E71496E55D77B0522C17D856BFAB81CB67DD898AC05A0DCE9AFDCE44024E867EB3867A54427F4642BD33E77C41CA739E10220237F4C793D0F41D37A72399D132F38BE668F04D14EC3AEB4946F3FCE46C5D9EF3DEDB20FF3482FDA799A14B1AADB43CE7C9BB2070980BD80D7CD739F3BD64F8BF6AC8239B71DE66C67AC2FB2B1698EFB12D371ADEFFE3D5CFB19C6873B009F46B073854E07FC321BF0A7C9F95EBFBEC82FB8A0BCE2F0D5BF6E55C863C9A605FD522D34DA2B5DCE03242077EDFF07EEE7AB1CEFD9FF7E70B),(669483,0x5DD0CB0DC3300C03D095F4B324BAD3E4D81982ECDEA68782CAF141324CF1D89EFB7C6FF525AAFE3AB6ECF3FAD91C60476AB197600DAB8CFDE5FE701B3B9727BB2D829C12856158B3A3DC1EE6FC992E9C2FAB6CCC3B570E43C61CE6FA30FF57123A6C16DCCF37CDB8A74A9CF357C7E8A30D21ECC0D8EF44F23DDD32FA8386F37B6481F3A3671FB7C77B2CCE1F22CD7DDFE6FF425CFEF3EB03),(672942,0x2DCCC10D83301403D05D3C41C227A4383B740514680F540255F9CDA142D99D20727CB6E548CB63A51537F8EE11E2456547EC0655FD256B08CDF3E7BDFCA6F585A01C08315EBC6B58D2DDD4A3B1269EF826DDDBD811BD881971379AB72DA63FC23394524E),(681695,0x4BB432B3AACEB432343637313237B24EB432B0AAAE85F18DD1F826487C0B73530B4B64BEA5852932DFD2CCD8C802CAAF0500),(681773,0x5DD44B0EC3300804D02BF135E09E26CB9EA1CADD6BA9529599E593316062E7DA95FBF3DEEA15E1FABAB6ECCFFD735A9107EDF2745B1A7899A313F2F534C44FF8D32DB6129C32687DD66F6D83FD265EE85032AD27EDCF4657805513DD0B5CE2E8817EAD15E3DB958CFD0D9D6F9690613E6E6A6898FF7141FFEED268ACEF89E73D5E648E6F32F697789E632707DAA9BE53FD1032E50FEA2FA8BFA0FE92F62F36F5BB281F7D8F2C8A2F5A6FEABF954CF59BF235CD0BEFA317CD6FF03D1CC3FE9081FCA1588FFE179D52861E98C779AE4E5E687CCFC714FFBF6FF717),(682157,0xADD0310EC2300C05D0BBF804761CA7A97B18D40243185244CA54E5EE24810DC41075F3D7979F2CCF4ABA07251E84C54CB33ADD931A85485012D744A8909ECBED7ADE4EE10253EB0DD6C12BDCD714B6B0C61AAD0223BA3A0EA579A4F8592885781298F21BC76E9CFFE1414DAF4B3F5DE7D034978E75FD88D85C3CF85E2BBEB9DCEB8EDFAE2890D8FAF99CF30B),(687373,0x5DD3C16D03310C44D1962492E2904A353EA606C3BD67830081BE8E0F26E5995DED6B6BEDF7F79E5E6BDAF87AEDB1DF9F3F5B4C5AFCDDC76537FADAF75574FA65D1957004CF5FB369F7CB3C6F05E7D32F07F773C5E56B3E992F75EDEBDA17FB67335F89E755A16FCE79997D73325FCE0CBAF1FF6945A7252DE47BEA705E8B79BA302FE37D500CEC2B07F2490D978DA66DD2BE68DE8F32DEA7F24137F37472BED9AFE7188BF68285E7DFF30974DAACCFEFA55D75F6E930D10BDF57AFC07D78DCE7FBEFF479E66F4504CD3E8A441F25F3961C6ED3D12FC6D0ED72B8CEF37F2D837BE4E9E7790ACEC6BEEB7FFFF303),(690889,0x5DD0C90DC3400805D09660580648353EA606CBBD7B14E5C0E7F884F82C57ADACFB5B2CC9C9FB7315D5FDFC2C11D26D1C3CBCD08975F3EC7611B419F47B38CCDFC2D41DB4BD3B09F739072858958679780DCBF0CCB3611F6EFB2B910B7533F1024BEF3F560BB4F370A237E4CB79E0DFCF0B);
/*!40000 ALTER TABLE `chii_rev_text` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_subjects` WRITE;
/*!40000 ALTER TABLE `chii_subjects` DISABLE KEYS */;
REPLACE INTO `chii_subjects` VALUES (363612,2,'沙盒','沙盒','',287622,1640456969,'82/15/363612_6uauA.jpg',1,'{{Infobox animanga/TVAnime\r\n|中文名= 沙盒\r\n|别名={\r\n}\r\n|话数= 7\r\n|放送开始= 0000-10-06\r\n|放送星期= \r\n|官方网站= \r\n|播放电视台= \r\n|其他电视台= \r\n|播放结束= \r\n|其他= \r\n|Copyright= \r\n|平台={\r\n[Xbox Series S]\r\n[Xbox Series X]\r\n[Xbox Series X/S]\r\n[PC]\r\n[Xbox Series X|S]\r\n}\r\n}}','本条目是一个沙盒，可以用于尝试bgm功能。\r\n\r\n普通维基人可以随意编辑条目信息以及相关关联查看编辑效果，但是请不要删除沙盒说明并且不要关联非沙盒条目/人物/角色。\r\n\r\nhttps://bgm.tv/group/topic/366812#post_1923517','',0,7,0,7,1,1,0,0,0,'s',0,1,0);
/*!40000 ALTER TABLE `chii_subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_subject_fields` WRITE;
/*!40000 ALTER TABLE `chii_subject_fields` DISABLE KEYS */;
REPLACE INTO `chii_subject_fields` VALUES (363612,2,'a:6:{i:0;a:2:{s:8:\"tag_name\";s:12:\"开放世界\";s:6:\"result\";s:1:\"2\";}i:1;a:2:{s:8:\"tag_name\";s:12:\"2021年12月\";s:6:\"result\";s:1:\"2\";}i:2;a:2:{s:8:\"tag_name\";s:6:\"原创\";s:6:\"result\";s:1:\"2\";}i:3;a:2:{s:8:\"tag_name\";s:10:\"2021.12.26\";s:6:\"result\";s:1:\"1\";}i:4;a:2:{s:8:\"tag_name\";s:6:\"沙盒\";s:6:\"result\";s:1:\"1\";}i:5;a:2:{s:8:\"tag_name\";s:2:\"TV\";s:6:\"result\";s:1:\"1\";}}',2,0,0,0,0,0,1,1,0,1,0,0,0000,10,5,'0000-10-06',0);
/*!40000 ALTER TABLE `chii_subject_fields` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_episodes` WRITE;
/*!40000 ALTER TABLE `chii_episodes` DISABLE KEYS */;
REPLACE INTO `chii_episodes` VALUES (1075440,363612,1,0,0,'NULL','null',0,'','1453-05-29','',0,0,'',1640456969,0,0,0),(1075441,363612,2,0,0,'','',0,'','-753-01-01','',0,0,'',1640456969,0,0,0),(1075442,363612,1,4,0,'','',0,'','','',0,0,'',1640456969,0,0,0),(1075443,363612,4,0,0,'','',0,'12m','2099-11-31','',0,0,'',1640456969,0,0,0),(1075444,363612,4.5,0,0,'12','22',0,'','4000-02-30','',0,0,'[code][/code]',1640456969,0,0,0),(1075445,363612,5,0,0,'','qqq',0,'','2021-04-32','',0,0,'test(bgm38)',1640456969,0,0,1),(1075446,363612,6,0,0,'','',0,'','10000-04-01','',0,0,'[s][/s]',1640456969,0,0,0),(1075455,363612,1,3,0,'op1','',0,'','','',0,0,'',1640457099,0,0,0),(1075456,363612,7,0,0,'','',0,'5m','2999-99-99','',0,0,'',1640457110,0,0,0),(1075457,363612,0,2,0,'','',0,'','1712-02-30','',0,0,'',1640457428,0,0,0),(1075546,363612,1,1,0,'','',0,'','0000-00-00','',0,0,'',1640516014,0,0,0),(1075547,363612,1,5,0,'','',0,'','0000-00-00','',0,0,'',1640516040,0,0,0),(1075548,363612,1,6,0,'','',0,'','0000-00-00','',0,0,'',1640516097,0,0,0);
/*!40000 ALTER TABLE `chii_episodes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_ep_revisions` WRITE;
/*!40000 ALTER TABLE `chii_ep_revisions` DISABLE KEYS */;
REPLACE INTO `chii_ep_revisions` VALUES (53135,363612,'1075443,1075456,1075444,1075446,1075445','4|||12m|2099-11-31\r\n4.5|12|22||4000-02-30\r\n5||qqq||2021-04-32\r\n6||||10000-04-01\r\n7|||5m|2999-99-99',287622,0,1640531498,'');
/*!40000 ALTER TABLE `chii_ep_revisions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO chii_usergroup (usr_grp_id, usr_grp_name, usr_grp_perm, usr_grp_dateline) VALUES (10, '普通用户', 'a:14:{s:9:"user_list";s:1:"1";s:17:"manage_user_group";s:1:"1";s:11:"manage_user";s:1:"1";s:19:"doujin_subject_lock";s:1:"1";s:12:"subject_edit";s:1:"1";s:12:"subject_lock";s:1:"1";s:15:"subject_refresh";s:1:"1";s:15:"subject_related";s:1:"1";s:10:"mono_merge";s:1:"1";s:10:"mono_erase";s:1:"1";s:7:"ep_edit";s:1:"1";s:7:"ep_move";s:1:"1";s:6:"report";s:1:"1";s:9:"app_erase";s:1:"1";}', 1304011366);

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_subject_topics` WRITE;
/*!40000 ALTER TABLE `chii_subject_topics` DISABLE KEYS */;
REPLACE INTO `chii_subject_topics` VALUES (1,1,2,'拿这个来测试',1216020847,1639999129,76,0,1),(20,2,212,'cheer~',1217558002,1217558840,1,0,1),(452,2,442,'2333',1262410348,1263199823,18,0,1),(460,2,4182,'问两个问题',1263200884,1263200884,0,0,1),(3585,2,30734,'这是什么意思Σ(っ °Д °;)っ',1375949320,1378037814,120,0,1),(3586,2,116420,'……',1375966632,1376101675,1,0,1),(3677,2,130147,'这TM都能有？',1378011331,1566267744,24,0,1),(3752,2,58132,'为什么武林外传可以有',1380471577,1382194163,2,0,1),(4030,2,157769,'(临时召唤)',1388585469,1388586320,1,0,0),(4038,2,157769,'建条目不发种，当斩。',1388872714,1389351890,51,0,1),(4093,2,9387,'《坟场之书》by尼尔·盖曼',1390144688,1390144688,0,0,1),(4322,2,101885,'2、6、16话应该是日本最早的百合动画',1397134860,1397134860,0,0,0),(4330,2,101885,'第三话的キャロン看来是这话人设最得意的作品',1397323484,1397323484,0,0,0),(4579,2,157769,'你们在舔什么呀？',1402892210,1402901320,1,0,0),(4730,2,206841,'哪里有小孩收养18751781850哪里有婴儿领养宝宝送养 哪里有小孩收养18751781850哪里有婴儿领养宝宝送养 哪里有小孩收养18751781850哪里',1405043620,1405043620,0,0,0),(4731,2,206841,'哪里有小孩收养18751781850哪里有婴儿领养宝宝送养',1405046944,1405046944,0,0,0),(4732,2,206841,'哪里有小孩收养18751781850哪里有小孩可以领养小孩送养',1405046990,1405046990,0,0,0),(4733,2,206841,'哪里有婴儿收养18751781850哪里有婴儿可以领养婴儿送养',1405047045,1405047045,0,0,0),(4744,2,207185,'哪里有小孩收养18751781850哪里有小孩可以领养小孩抱养',1405334963,1405334963,0,0,0),(4745,2,207185,'哪里有婴儿收养18751781850哪里有婴儿可以领养婴儿抱养',1405335005,1405335005,0,0,0),(4746,2,207185,'哪里有宝宝收养18751781850哪里有宝宝领养宝宝抱养',1405335039,1405335039,0,0,0),(4748,2,37478,'w卧槽还有这书',1405343587,1405467853,4,0,1),(5029,2,215406,'哪里有小孩领养15830636858待产婴儿收养',1411218966,1411218966,0,0,0),(5030,2,215406,'哪里有小孩领养15830636858小孩送养婴儿收养',1411218996,1411218996,0,0,0),(5031,2,215406,'哪里有小孩领养15830636858送养婴儿收养',1411219020,1411219020,0,0,0),(5263,2,223082,'婴儿领养婴儿送养15773804004婴儿收养锦州',1416738501,1416738501,0,0,0),(5851,2,246626,'哪里有小孩领养15756274660送养婴儿收养',1432252353,1432252371,1,0,0),(5852,2,246626,'哪里有小女孩领养15756274660送养小男孩收养',1432252403,1432252403,0,0,0),(5853,2,246626,'哪里有婴儿领养15756274660送养待产婴儿收养',1432252430,1432252437,1,0,0),(6932,2,289192,'哪里有小孩领养15658327871送养婴儿收养抱养',1464313503,1464313503,0,0,0),(6933,2,289192,'哪里有小孩送养15658327871如何抱养送养婴儿怎么领送养婴儿',1464313931,1464313931,0,0,0),(6934,2,289192,'健康婴儿领养15658327871不孕不育带养儿童 哪里有小孩送养',1464314001,1464314001,0,0,0),(3,4,2,'不错',1216022809,1217552145,2,0,1),(58,6,4,'Heavy Update is coming',1218580387,1218580387,0,0,0),(59,6,4,'Heavy Update is coming',1218580401,1218790065,3,0,1),(1219,6,3320,'【求搞基】有兴趣的不妨留下ID',1309534312,1319719408,3,0,1),(45,8,101,'绝望啦!!对这个连CC都能被萌化的世界绝望啦!!',1217761913,1240129976,7,0,1),(73,8,4,'高清在线播放地址',1221746945,1221746945,0,0,1),(564,8,2571,'Code Geass GAIDEN亡国的阿基德',1272917462,1273028200,1,0,1),(1204,8,9683,'说起来天子的声优到底是谁',1309002791,1309060709,3,0,1),(3653,8,52289,'c.c with lelouchu',1377499964,1555773511,22,0,1),(17169,8,534587,'666666',1586051356,1586051361,1,0,0),(19886,8,617229,'请教大神R2为什么节奏没有R1好',1628589932,1628845201,1,0,1),(19887,8,617229,'请教大神R2为什么节奏没有R1好',1628589969,1639381921,19,0,1),(5,12,5,'Sai，赐我一个Chobits吧',1216209316,1566361616,147,0,0),(7,12,1,'删除测试',1217520011,1217520011,0,0,0),(81,12,1465,'囧rz..CHOBITS还没看完捏。。',1230554045,1230554045,0,0,0),(6873,12,142527,'这条目简介也太剧透了吧',1462335911,1481098545,8,0,1),(8,13,43,'为什么我总good ending不起',1217529168,1434291845,15,0,1),(306,13,3943,'不知这样同一个游戏的不同版本能不能算事？',1249928428,1254495433,9,0,1),(1485,13,14127,'哪有这样说自己女儿的父亲啊……',1316166646,1493510294,21,0,1),(1726,13,64728,'南平套牌车出售',1324664544,1324664544,0,0,0),(2185,13,74384,'新人求解......',1333119113,1333203834,7,0,1),(2740,13,104740,'最爱',1351518163,1351677920,1,0,1),(19876,13,451958,'CLANNAD和寒蝉鸣泣之时 梦幻联动',1628511864,1628518918,2,0,1),(77,14,1114,'神作，也是前几部MGS的终章',1224851090,1232527707,1,0,1),(93,14,1951,'BEAST美女形态 不忍心下手最后死掉的来报到',1232955025,1232955025,0,0,1),(19800,14,546484,'小说作者与小岛的一段友谊',1627227686,1627227686,0,0,1);
/*!40000 ALTER TABLE `chii_subject_topics` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `chii_subject_posts` WRITE;
/*!40000 ALTER TABLE `chii_subject_posts` DISABLE KEYS */;
REPLACE INTO `chii_subject_posts` VALUES (1,1,2,0,'SAi看的也是红皮书吧',0,1216020847),(2,1,3,0,'你是猪 ... 鉴定完毕 ...',0,1216021115),(3,1,2,0,'023 你才是猪',0,1216021295),(7,1,1,0,'这一套的封面真赞',0,1216024050),(8,1,5,0,'这里最好有一个标题',0,1216028733),(9,1,5,0,'我的意思是来一点面包屑导航一类的。这里本来是关于XXXX的讨论。而这里左侧唯一的link是标题“拿这个来测试”。',0,1216080837),(27,1,69,0,'各个',0,1217542023),(29,1,64,0,'响应测试……\r\n我记得这本当年我看的盗版。',0,1217543185),(60,1,301,0,'恩哼',0,1217563697),(79,1,293,0,'至今仍是印象最深最美好的网络小心。',0,1217587002),(89,1,206,0,'最喜欢痞子蔡的&lt;檞寄生&gt;',0,1217605069),(24357,1,5881,89,'檞寄生+1 我的明菁 T-T',0,1356260803),(24360,1,4431,89,'[quote][b]15www[/b] 说: 檞寄生+1 我的明菁 T-T[/quote]\n挖墳黨喪心病狂！',0,1356266789),(24361,1,12391,0,'(bgm38)卧槽这什么年代的帖子了喂……',0,1356268296),(24362,1,14127,0,'看了这帖子，我去查看了豆瓣的第一个条目，发现不在影音书任何一个里，看来是黑历史被删掉了',0,1356269034),(47939,1,29266,0,'试着[s]挖[/s]',0,1411314560),(47946,1,175982,0,'/subject/topic/1\n[s]刘明[/s]',0,1411341862),(47947,1,12391,47946,'almost two years later than me (bgm38)',0,1411342326),(47948,1,9387,0,'又被娃起来了(bgm38)',0,1411352806),(47950,1,175982,47946,'[quote][b]邵小貓[/b] 说: almost two years later than me [/quote]\n(bgm38)',0,1411356928),(47995,1,77515,47948,'等等，为什么是“娃”而不是“挂”？！此事必有蹊跷(bgm38)',0,1411433212),(48049,1,9387,47948,'[quote][b]th3ta \"Paradox\"[/b] 说: 等等，为什么是“娃”而不是“挂”？！此事必有蹊跷[/quote]\r\n因为是”挖“啊！并没有“又怀孕了”的影射包含其中！',0,1411484472),(48057,1,77515,47948,'[quote][b]Phaer[/b] 说: 因为是”挖“啊！并没有“又怀孕了”的影射包含其中！[/quote]\r\n[s]谁的孩子？！！[/s](bgm53)\r\n我还以为pko是在暗示：(挂->娃) “以前用手”，但是“现在有了女朋友”（ry',0,1411501145),(48060,1,9387,47948,'[quote][b]th3ta \"Paradox\"[/b] 说: 谁的孩子？！！\n我还以为pko是在暗示：(挂->娃) “以前用手”，但是“现在有了女朋友”（ry[/quote]\n(bgm38)这个脑洞厉害，输了',0,1411514048),(67970,1,26024,0,'这个帖子竟然没人挖(bgm38)',0,1452862700),(67974,1,204679,0,'卧槽！\n为什么会有这个条目。\n为什么会被挖出来。\np.s.推荐痞子蔡的所有小说。',0,1452874283),(67989,1,29266,67970,'挖坟党丧心病狂(bgm38)',0,1452912119),(67996,1,8256,0,'没看过，但是知道这本',0,1452950840),(68004,1,259211,0,'那我也只能来一发\n有时间看看好了',0,1452960290),(68013,1,103988,67970,'专业挖坟的么=_=',0,1452965112),(77981,1,258435,0,'无意间翻到黑历史ww\n\n另外[url]http://jht.pixnet.net/blog[/url] 作者博客，最近貌似不怎么更新了~\n\n很喜欢这本书的说',0,1470800362),(77985,1,208378,0,'#八年前的那个夏天',0,1470823591),(77988,1,255501,0,'四年前的那句(bgm38)卧槽这什么年代的帖子了喂……都已经是什么年代了喂(bgm38)',0,1470840724),(77989,1,14382,0,'我上次看到这帖还是几年前，想着留言看着像“到此一游”还是算了。\n\n唔，到此一游。',0,1470854418),(77997,1,261227,0,'到此一游',0,1470886077),(78004,1,16185,0,'到此一游~(bgm24)',0,1470917195),(78010,1,95693,0,'到此一游\n(bgm37)',0,1470928052),(78011,1,8142,0,'什么你们居然打算把1号帖学姐掉(bgm38)\n[s]好像并没有什么问题[/s]',0,1470931398),(78016,1,202786,0,'8年过去了(bgm38)',0,1470967445),(78018,1,3490,78011,'丧心病狂',0,1470970181),(78019,1,3490,0,'(bgm39)果然是暑假啊',0,1470970200),(84335,1,116229,0,'这个楼主\n。是活的',0,1486705486),(84349,1,188332,0,'我想做个好人',0,1486731233),(88934,1,99210,0,'2、3楼可真是青春呀(bgm61)',0,1497530602),(88922,1,50042,0,'Lz竟然是活的。明年办个十周年纪念会吧。',0,1497489442),(88923,1,225835,0,'快十年了，留名(bgm38)',0,1497493252),(88924,1,27159,0,'(bgm38) [s]明年再来[/s]',0,1497493274),(88925,1,330033,0,'1(bgm38)',0,1497497586),(88926,1,133075,0,'到此一游',0,1497501545),(88927,1,171851,0,'(bgm67)发现文物',0,1497501781),(88931,1,283739,0,'四国一(bgm58)',0,1497511094),(88938,1,90690,88927,'放在最近的巨作展位产生 +2 文化和 +2 魅力。',0,1497532145),(88939,1,168706,0,'08-12-16-17(bgm38)\n最本书最后就记住了一个轻舞飞扬',0,1497533670),(88968,1,211998,0,'观光',0,1497608964),(88969,1,54176,88934,'鉴定完毕这词太令人怀念了。。。',0,1497611729),(88970,1,99210,88934,'[quote][b]lighthouse[/b] 说: 鉴定完毕这词太令人怀念了。。。[/quote]\n想起了哪些有趣的回忆呢(bgm106)',0,1497612827),(88984,1,54176,88934,'[quote][b]阿良良木翔[/b] 说: 想起了哪些有趣的回忆呢[/quote]\n我第一次常驻某个网络社区的时候也是差不多那段时间，所以对那个时候的网络用语都很有感觉',0,1497634519),(88989,1,211931,0,'祭奠',0,1497657984),(136681,1,407029,0,'编号1姑且还是要观光的',0,1574430511),(146050,1,485664,0,'www',0,1589374822),(146367,1,438735,0,'到此一游(bgm38)',0,1589895880),(146371,1,383342,0,'洛阳铲草',0,1589899533),(146388,1,193812,0,'这条怎么上首页了（',0,1589926926),(146398,1,533134,0,'12年老洛阳铲',0,1589939693),(146403,1,449217,0,'我铲',0,1589950826),(146423,1,432086,0,'来自十二年前的思念(bgm37)',0,1589975040),(146445,1,514619,88927,'[quote][b]Genius、小乖??[/b] 说: 放在最近的巨作展位产生+2文化和+2魅力。[/quote]\n太草了',0,1590023443),(158959,1,543571,0,'泪目',6,1611387062),(158960,1,543571,0,'2021八省联考前来考古',0,1611387082),(158982,1,524993,0,'洛阳铲',0,1611445817),(158984,1,9580,78011,'怎么什么帖子都有你',0,1611459212),(159101,1,8142,78011,'[quote][b]水嶋春歌[/b] 说: 怎么什么帖子都有你[/quote]\n那毕竟当年的bgm还是一个友好开放包容的社区\n当年的\n嗯',0,1611602460),(161716,1,480062,0,'topic001',0,1614494140),(171094,1,282103,0,'创世纪',0,1628517214),(180237,1,605528,0,'！',0,1639884408),(180316,1,437960,0,'genesis block',0,1639952681),(180375,1,503023,0,'《星之声》',0,1639995688),(180380,1,391908,0,'到此一游',0,1639999129),(5,3,2,0,'比较好玩',0,1216022809),(6,3,1,0,'NDS被别人借走了……',0,1216023735),(38,3,101,0,'里层众占领了这里',0,1217552145),(12,5,5,0,'赐我一个Chobits吧，功能不要太全。只要能和我QA即可～～\r\n^_^',0,1216209316),(33,5,80,0,'外设电源按钮能自设么?求团购',0,1217547696),(47,5,224,0,'- -\r\n像PB一样开源么？\r\n这个更类douban',0,1217559141),(83,5,547,0,'求购sumomo一只~',0,1217589463),(90,5,619,0,'QA.. 我以為ox...........',0,1217618519),(172,5,1043,0,'我要小型号的也好了',0,1219927140),(206,5,1434,0,'我也很喜欢啊.',0,1229494908),(4382,5,10376,0,'我愿做Chobits',0,1280840571),(4383,5,5,4382,'...\n第一次得到春菜的提醒.而且是天降Chobits',0,1280893744),(4385,5,5,4382,'[quote][b]南盏[/b] 说: 满足你~~　　２年ｂａｎｇｕｍｉ的老会员　　O(∩_∩)O[/quote]\n...额..俺不需要满足.',0,1280902090),(4395,5,3918,0,'+1求团购～～但是能买柚姬吗～～个人觉得柚姬更美～～啦啦啦～～',0,1280987722),(4400,5,9802,4395,'+2 团购美腻点',0,1281014046),(4403,5,3490,83,'路过路过',0,1281024645),(14389,5,68276,0,'秀树是个YY狂。',0,1327659243),(14395,5,6241,0,'这个帖子每两年被人顶一次(bgm27)',0,1327668871),(14396,5,31002,0,'= =好老的坟',0,1327670602),(14398,5,16138,0,'topic/5 注目',0,1327684488),(14399,5,11118,0,'而且还是吾辈生日那天的坟',0,1327691930),(14415,5,10823,0,'世界末日也要顶=w=',0,1327764947),(14412,5,30105,0,'既然已经被顶起来了，咱还是继续顶吧。',0,1327754043),(14468,5,10729,0,'2014年的时候会再次光顾的',0,1327870779),(14404,5,3490,14395,'今年也没有系列么？',0,1327728230),(14405,5,3332,0,'两年一次的()期',0,1327729576),(15518,5,5,0,'(bgm74)',0,1332685098),(15519,5,37469,14395,'帖子加起来，能绕地球两圈……',0,1332685613),(15520,5,14127,0,'楼主又是一个诈尸的好例子(bgm86)',0,1332685755),(15528,5,11118,15520,'(bgm86)',0,1332717775),(15555,5,12391,0,'=。=2014年再one more time么……',0,1332819387),(15568,5,4431,15518,'人群當中忽然鑽出一只樓主！',0,1332907651),(15571,5,45533,0,'(bgm90)原来是坟。。那就挖挖',0,1332909469),(15577,5,34985,0,'等2014再来',0,1332912546),(15635,5,8739,15518,'楼主居然还在！',0,1333045138),(15704,5,6705,0,'同求chobits一只(bgm37)',0,1333209173),(30625,5,53426,0,'我也好想要啊..(bgm38)',0,1370443251),(30626,5,37469,30625,'您是挖坟的吗？',0,1370443382),(30627,5,53426,30625,'[quote][b]Fantasy[/b] 说: 您是挖坟的吗？[/quote]\n不准么？',0,1370443479),(30628,5,37469,30625,'[quote][b]col[/b] 说: 不准么？[/quote]\n尚未。',0,1370443523),(30629,5,53426,30625,'[quote][b]Fantasy[/b] 说: 尚未。[/quote]\n那就好。',0,1370443550),(30633,5,8838,0,'还没到两年呢啊！',0,1370448642),(30651,5,11327,0,'既然都看到，那么就ry',0,1370516417),(30682,5,68752,0,'原来还有这种坟(bgm99)',0,1370600338),(30690,5,15578,0,'说好的两年一次呢(bgm38)',0,1370612602),(30695,5,41436,0,'诶进来就习惯性扫了下时间真是好习惯...\r\nid 号瞩目...\r\n然后顺手去 topic/1 参观了下，发现那边的楼主居然现在还活跃中...',0,1370616943),(33603,5,5,0,'挖坟的节奏，让(bgm34)时不时进来看看的人汗颜(bgm99)',0,1377065134),(33604,5,2571,33603,'好可怕，個位數的 ID 。',0,1377065876),(33605,5,123168,33603,'BGM五号机(bgm38)',0,1377066117),(33609,5,10327,33603,'……5号………………膝盖收好',0,1377067244),(33611,5,127728,0,'呼！topic5！',0,1377067728),(33614,5,38770,0,'铜球！！',0,1377076172),(33633,5,37681,0,'Chobits，赐我一个Sai吧',0,1377140213),(57932,5,3490,0,'于是今年的BGM也没有',0,1433332130),(57934,5,141485,57914,'[quote][b]lhb5883[/b] 说: 天国的年糕可好？[/quote]\n年糕是什么？',0,1433332546),(43057,5,46380,33603,'楼主我来挖坟了(bgm24)',0,1400771732),(43058,5,144717,0,'既然在首页看到了这个帖子，又正好是2014年，那我就来挖坟吧(bgm56)',0,1400776835),(43063,5,141485,0,'终于到2014年了(bgm38)，虽然已经被人在2013顶过了(bgm102)',0,1400813180),(43068,5,131421,0,'顶个顶个 既然都是传统了(bgm39)',0,1400823232),(43070,5,6,0,'这个坟挖的……(bgm27)',0,1400823502),(43071,5,175982,0,'卧槽08年的……08年是奥运会对吗？',0,1400824905),(43072,5,79332,0,'等有了chobits的时候还会再来挖的',0,1400825424),(52024,5,79256,0,'因为这个帖子有了 Chobits？',0,1421046294),(52048,5,123081,0,'刚看到这个……[url=http://www.solidot.org/story?sid=42641]霍金马斯克对人工智能研究发出警告[/url]',0,1421127304),(52050,5,211931,52048,'美帝早已成立人工智能伦理研究会',0,1421128782),(52051,5,3490,0,'(bgm38)',0,1421130968),(52039,5,29266,52016,'such',0,1421074899),(52016,5,211931,0,'wow',0,1421032282),(52019,5,141485,0,'2015年再次被顶起',0,1421038619),(57850,5,5,0,'话说又到了夏天(bgm115)',0,1433227997),(57856,5,13548,57850,'转眼间已经7年了',0,1433235201),(57858,5,49777,57850,'是啊 ~',0,1433239837),(57873,5,82575,57850,'(bgm38)',0,1433257909),(57887,5,162791,0,'然而我依然没有chobits。。。',0,1433266764),(57892,5,226624,0,'千年古坟',0,1433294760),(57894,5,231508,0,'比较喜欢丝茉茉',0,1433296666),(57895,5,49777,57894,'Sumomo 相关的图都挺可爱的 ~ 不过动画里的感觉有些闹 ... (bgm72)',0,1433301452),(57896,5,112191,0,'赌五毛再过五年还是不会有(bgm38)',0,1433301543),(57903,5,231508,57894,'[quote][b]MousHu[/b] 说: Sumomo 相关的图都挺可爱的 ~ 不过动画里的感觉有些闹 ... [/quote]\n闹闹的很好啊。。一个人很寂寞的。。',0,1433305828),(57904,5,49777,57894,'[quote][b]空琉美游亭丸京[/b] 说: 闹闹的很好啊。。一个人很寂寞的。。[/quote]\n只要不是长时间一个人的话 ~ 也是可以过得并不太寂寞的 ~',0,1433305988),(57905,5,231508,57894,'[quote][b]MousHu[/b] 说: 只要不是长时间一个人的话 ~ 也是可以过得并不太寂寞的 ~[/quote]\n(bgm38)',0,1433306294),(57906,5,49777,57894,'[quote][b]空琉美游亭丸京[/b] 说: [/quote]\n要有良好的心态 ~ (bgm24)',0,1433306614),(57914,5,141485,0,'又是一年过去了\n\n然而还是没有',0,1433310995),(57920,5,3490,57914,'天国的年糕可好？',0,1433321260),(57935,5,3490,57914,'[quote][b]音月[/b] 说: 年糕是什么？[/quote]\n[url]http://bgm.tv/apology[/url](bgm38)',0,1433334154),(57939,5,90690,0,'So what is Chobits?',0,1433341910),(57941,5,231508,57914,'[quote][b]lhb5883[/b] 说: http://bangumi.tv/apology[/quote]\n原来bangumi还有过这样的大事件啊。。',0,1433343340),(57952,5,141485,57914,'[quote][b]lhb5883[/b] 说: http://bangumi.tv/apology[/quote]\n详细过程大发现！原本只是知道发售终止了而已，毕竟入驻BGM的时候这事件就已经是过去时了',0,1433346577),(57956,5,8766,57850,'[quote][b]orange[/b] 说: 转眼间已经7年了[/quote]\n..哇塞7年了',0,1433349069),(57961,5,232228,0,'开机关机开机关机(bgm38)(bgm38)(bgm38)',0,1433390315),(61705,5,234413,0,'时间过得可真快啊(bgm35)(bgm39)',0,1440143107),(61709,5,78305,0,'洛阳铲真是可怕 (bgm38)(bgm38)',0,1440161845),(61757,5,211931,57914,'[quote][b]lhb5883[/b] 说: http://bangumi.tv/apology[/quote]\n咦你这样不会被转学吗',0,1440297167),(61792,5,10259,57894,'+1',0,1440343792),(67961,5,208378,0,'于是8年之后，还是没有\n[mask]虽然觉得好像不把这个位子留给老BGMer不太合适，不过既然看见了就顺手挖了\n[/mask]',0,1452832722),(67967,5,267492,0,'(bgm38)',0,1452844532),(67968,5,250298,0,'(bgm38)',0,1452846041),(67969,5,26024,0,'(bgm38)',0,1452862585),(67985,5,103988,0,'(bgm38)',0,1452893864),(67988,5,76509,0,'啊，这么一想，Chobits居然已经是接近15年前(完结的)作品了....(bgm41)',0,1452902152),(68019,5,6497,0,'(bgm38)',0,1452973354),(68037,5,12630,0,'(bgm38)bgm神楼之一',0,1453025063),(68045,5,215979,0,'(bgm38)',0,1453049523),(68056,5,3490,0,'(bgm38)',0,1453085279),(68057,5,3490,67988,'连Round Table feat. Nino都隐退了(bgm41)',0,1453085324),(68073,5,9387,0,'(bgm38)',0,1453118281),(68096,5,99210,0,'(bgm38)',0,1453205381),(68099,5,77488,0,'破坏bgm38队列',0,1453212408),(68105,5,267845,0,'又见挖坟(bgm38)',0,1453230720),(68222,5,5,67961,'类目，本来不打算挖的...',0,1453532170),(68233,5,208378,67961,'[quote][b]如果思念是一碗汤圆[/b] 说: 类目，本来不打算挖的...[/quote]\n楼主！！居然还在(bgm40)\n[s]楼主我们一直挖坟挖到chobits出现的那一天吧好不好[/s]',0,1453548365),(68295,5,5,67961,'[quote][b]芥末酱油丸[/b] 说: 楼主！！居然还在\n楼主我们一直挖坟挖到chobits出现的那一天吧好不好[/quote]\n要看sai能坚持么',0,1453685653),(68306,5,252257,0,'(bgm38)',0,1453700225),(68302,5,208378,67961,'[quote][b]如果思念是一碗汤圆[/b] 说: 要看sai能坚持么[/quote]\n要相信(bgm78)',0,1453689382),(71593,5,265239,0,'再过30年吧(bgm38)',0,1462365352),(71597,5,255501,0,'(bgm38)',0,1462373443),(71601,5,185084,0,'(bgm38)\n看过楼主的时间胶囊里的Chobits吐槽(bgm67)',0,1462382034),(71614,5,3490,0,'(bgm38)你们为什么挖的那么熟练啊',0,1462411018),(71615,5,248715,0,'等十周年的时候会不会有周年庆呢(bgm39)',0,1462411379),(71623,5,141485,0,'(bgm38)继续等下一个8年',0,1462431127),(71679,5,280179,0,'(bgm38)',0,1462467495),(71692,5,14268,83,'[quote][b]lhb5883-污喵王VIP⑩[/b] 说: 路过路过[/quote]\n终于又抓到你了个说',0,1462506737),(71694,5,3490,83,'[quote][b]柳胜薰CALFN-触触小污贼VIP[/b] 说: 终于又抓到你了个说[/quote]\n你来抓我啊来抓我，抓住我我就让你嘿嘿嘿(bgm38)',0,1462509441),(71707,5,14268,83,'[quote][b]lhb5883-污喵王VIP⑩[/b] 说: 你来抓我啊来抓我，抓住我我就让你嘿嘿嘿[/quote]\n别一副不情愿的样子，你这个⑩',0,1462517402),(71745,5,142527,0,'(bgm38) 你们究竟是挖了多少次啊',0,1462533783),(88886,5,5,0,'回来铲铲土~',0,1497421756),(88887,5,2571,88886,'太可怕了，九年了。',0,1497422359),(88892,5,171851,88886,'(bgm60)',0,1497431253),(88894,5,99210,88886,'围观一下～',0,1497432923),(88895,5,90690,88886,'QA 是一个复杂的东西。',0,1497433243),(88916,5,277875,0,'(bgm38)',0,1497457402),(88917,5,248715,88886,'明年就是十周年了(bgm38)',0,1497457726),(106171,5,53426,0,'十周年了，仍然还没有(bgm38)',0,1521990181),(106190,5,312525,0,'十年了。',0,1521997811),(106193,5,79290,0,'。。。。10周年未满',0,1522000094),(106200,5,15476,88886,'现在有许愿板功能了，你去那边发一下说不定下一个十年就(',0,1522018213),(106337,5,268422,0,'别想了，如果真的有那样的独立智能机器人妹子，人家一定不会满足于跟你或我聊天这种程度的行为，除非这个独立智能无欲无求，心甘情愿和你天天聊天。',0,1522067886),(106403,5,4286,0,'并没有',0,1522117567),(118121,5,341935,0,'[img]https://files.catbox.moe/xbp85a.jpeg[/img]\n微软小冰已经是这种画风了（',0,1540995946),(118123,5,268865,71745,'08,10,12,13,14,15,16,17,18',0,1540997597),(118124,5,299955,0,'科技的发展使得十年前的人们的设想一步步的接近。真是令人感叹啊。',0,1541001959),(118138,5,386396,0,'也想要一只，超超超可爱的VR女友或男友',0,1541035905),(131594,5,291520,0,'看来今年到我了(bgm38)',0,1565610307),(131605,5,310722,0,'(bgm58)',0,1565627760),(131715,5,327934,0,'谁挖的坟？',0,1565662139),(131716,5,3490,131715,'就是你LS啊',0,1565662481),(131726,5,312525,0,'出现吧',0,1565693784),(132036,5,5,0,'今年挖坟在8月：）(bgm24)',0,1566271867),(132048,5,213658,0,'我也想要一只Chobits',0,1566298860),(132066,5,320903,132036,'11年了？？',0,1566319472),(132074,5,346405,0,'又出现了！',0,1566361616),(14,7,1,0,'其实是假删',0,1217520011),(16,8,43,0,'`````失败 失败 全部失败！',0,1217529168),(17,8,1,0,'我是跟着攻略完成after story的',0,1217529276),(23,8,43,0,'~~我是智代就跟我说了句 我喜欢只有你\r\n没了 完了！！！！\r\n攻略的话就不是自己争取的了！',0,1217532429),(30,8,64,0,'同不喜攻略，但是也不喜S&amp;L，\r\n所以玩的游戏少，但是花的时间多……',0,1217543327),(31,8,64,0,'不过CLANNAD确实skip了不少，\r\n正式开始认证玩游戏的时候觉得字太多，\r\n而剧情已经了解，这也算是一种悲哀吧……',0,1217543430),(32,8,43,0,'我玩的简直跟剧情一点发展也没 郁闷死了\r\n就是少陪渚说了句话 然后就乱七八糟`',0,1217546178),(150,8,780,0,'先看了动画再玩游戏的人是绝对打不出Good Ending的……\r\n那种花心的思维模式已经成功建立～',0,1218859854),(1725,8,6157,0,'此等神作不看攻略想通关。。LZ太天真了，神作的选支一般都是很诡异。。',0,1256707839),(1727,8,4293,0,'真的，有时候的确很诡异',0,1256721814),(1736,8,5453,0,'我刚看完AfterStory动画不久，玩游戏的话，不想再那样难受一次了。。。',0,1256808938),(1743,8,3417,0,'我没看攻略完成了智代、杏、琴美的Good End\n=v=\n然后基本就在无限Loop，最后求助攻略，这……诡异的选择分支。',0,1256866223),(1745,8,3371,0,'不看攻略根本难以想象如何进入春原线、幸村线等等这些路线的吧……',0,1256869576),(1747,8,2978,0,'完全按照动画玩的。。后来不小心提早表白。。杯具了。。\n改天重来。。',0,1256915362),(2603,8,2571,0,'重要的是不能無視渚，渚王道啊！\n\n另﹕全選第一個能過美佐枝線',0,1270546090),(8883,8,31609,0,'LZ同道中人啊,我是绝对有BE的天赋...只要有选择支,第一次一般都能被我走到BE...',0,1305434601),(58288,8,192733,1743,'椋的GE好打，杏的好难啊，因为和椋去游戏厅那段我老不选“恋人”，就老是BE……',0,1434291845),(114,45,101,0,'群众纷纷表示,我们要女王,不要萌女',0,1217761913),(115,45,80,0,'你是什么- -,LZ的立场说这话很无力哟',0,1217772149),(120,45,166,0,'绿毛必须死 0/1',0,1217847264),(128,45,619,0,'綠毛跟我名字一樣給人叫死那個感覺真是囧 = =',0,1218003951),(136,45,613,0,'李兰花必须死！',0,1218134745),(186,45,1191,0,'绿毛党参上~~~~~~~~\r\n女王党退散~~~~~~~~囧',0,1221934721),(614,45,11,0,'没人理LULU了现在',0,1239866357),(622,45,6,0,'微微（=  =b）.....\r\n我知道你对LULU有所图很久了......',0,1240129976),(138,58,4,0,'[url]http://www.steampowered.com/tf2/heavy/[/url]',0,1218580387),(139,59,4,0,'http://www.steampowered.com/tf2/heavy/',0,1218580401),(140,59,4,0,'强烈呼唤 UBB 支持!',0,1218580412),(142,59,1,0,'修了频道新帖无法显示的Bug,UBB等TAG完成后再加',0,1218720825),(143,59,4,0,'那个页面现在每天都在更新',0,1218790065),(185,73,4,0,'http://6.cn/profile/playlist.php?p=165000',0,1221746945),(200,77,1114,0,'：） \r\n\r\n值得收藏',0,1224851090),(221,77,2,0,'买不起，只看录像',0,1232527707),(208,81,1465,0,'期末考试啊\r\n怨念',0,1230554045),(249,93,1951,0,'RT 每次都流着口水不断切换角度看美女和SNAKE缠绵 不顾HP条的骤降。。。小岛太坏了',0,1232955025),(1168,306,3943,0,'360版值得一玩，只是没有汉化……',0,1249928428),(1169,306,886,0,'移植作品，并且没有大量更改 的话应该归为一个条目吧',0,1249964065),(1173,306,3943,0,'但是填写平台的地方似乎不支持多个项目\r\n而且像使命召唤4这种不同平台完全一样的游戏都有多个条目，CLANNAD的PC和XBOX360版不同点还是很多的',0,1250061161),(1174,306,886,0,'不支持多平台就能添加多个条目么= =那那些跨平台的玩意儿怎么办啊……\r\n使命召唤4的多条目也只是重复了而已\r\n再说CLANNAD的PC和Xbox360版又有多少区别？',0,1250067913),(1175,306,1,0,'理论上是要合并的，只是现在人物部分合并不好处理',0,1250072223),(1177,306,3943,0,'希望网站开发人员能搞定这些跨平台游戏的问题',0,1250119245),(1178,306,4293,0,'但是啊，选游戏的时候经常没看到平台……经常选错了……啃',0,1250127990),(1456,306,5489,0,'360的有成就....还是宽屏的',0,1254231386),(1460,306,5613,0,'平臺什么的只要游戲一樣就可以了啊\n支持合并',0,1254273863),(1486,306,4755,0,'還有動畫原版\\改版\\外傳\\本篇的問題啊',0,1254495433),(2826,564,2571,0,'沒變態妹控的份',0,1272917462),(2831,564,7378,0,'车夫！',0,1273028200),(9655,1204,9683,0,'复习R2的时候突然被萌到了orz',0,1309002791),(9662,1204,7088,0,'松元環季',0,1309016840),(9673,1204,9683,9662,'非常感谢orz',0,1309060366),(9674,1204,2813,9662,'原来是真LOLI。。。[url]http://bgm.tv/person/6821[/url]',0,1309060709),(9798,1219,3320,0,'ID：wjdavid\r\n\r\n这游戏很久之前就关注过了可惜一直都玩不成\r\n现在免费了于是终于可以玩了……T  T\r\n求组队求好友\r\n菜鸟一只见谅=w=',0,1309534312),(12645,1219,58635,0,'ID：z359386903\n\n我自己感觉自己玩士兵和Spy很好',0,1319711788),(12646,1219,3320,12645,'我最近都AFK了……',0,1319713914),(12647,1219,58635,12645,'[quote][b]Aquarius才不会[/b] 说: 我最近都AFK了……[/quote]\n反正我在玩就是了',0,1319719408),(11860,1485,4681,0,'(bgm62)\n咦？咖喱酱玩的不是FV？',0,1316168319),(11964,1485,37469,11869,'[quote][b]油咖喱酱[/b] 说: 这游戏里除了芽衣就没正常人啦！[/quote]\n怎么能这么说?',0,1316263841),(11965,1485,14127,11869,'[quote][b]Fantasy[/b] 说: 怎么能这么说?[/quote]\n就这么觉得的',0,1316263999),(11966,1485,37469,11869,'[quote][b]油咖喱酱[/b] 说: 就这么觉得的[/quote]\n其实芽衣也不正常。',0,1316264144),(11967,1485,14127,11869,'[quote][b]Fantasy[/b] 说: 其实芽衣也不正常。[/quote]\n我觉得至少不会像其他角色那样属性鲜明吧',0,1316264227),(11968,1485,37469,11869,'[quote][b]油咖喱酱[/b] 说: 我觉得至少不会像其他角色那样属性鲜明吧[/quote]\n不正常才吸引人吗，再说每个人不都有点什么特点吗？相比之下藤林椋倒是有点正常女性的感觉，或者说正常女性更应该这样的。',0,1316264414),(11969,1485,14127,11869,'[quote][b]Fantasy[/b] 说: 不正常才吸引人吗，再说每个人不都有点什么特点吗？相比之下藤林椋倒是有点正常女性的感觉，或者说正常女性更应该这样的。[/quote]\n嗯 我忘了椋的存在了…你貌似误会了 我说的不正常不是贬义的   将平常人的特点加以夸大 塑造鲜明的人物性格 这估计是动画和GAL的表现优势 夸张的东西在动画里不会显得突兀 要是真人版就会很傻 这也是我喜欢看动画的原因啊',0,1316264816),(11971,1485,37469,11869,'[quote][b]油咖喱酱[/b] 说: 嗯 我忘了椋的存在了…你貌似误会了 我说的不正常不是贬义的&nbsp; &nbsp;将平常人的特点加以夸大 塑造鲜明的人物性格 这估计是动画和GAL的表现优势 夸张的东西在动画里不会显得突兀 要是真人...[/quote]\n确实，我倒是没有什么意思。夸大个性这正是アニメ和ゲーム的一种手段，所以才吸引人的嘛……\n当然clannad这种各种人物集中在一起还是比较少见的了。',0,1316269090),(11980,1485,31328,0,'秋生和冈崎都是人生的大淫家啊xsk',0,1316311881),(11854,1485,14127,0,'[IMG]http://i.imgur.com/61iNp.jpg[/IMG]',0,1316166646),(11858,1485,14876,0,'[mask]我下面的怪兽已经饥渴难耐了！[/mask]',0,1316167510),(11861,1485,14127,11860,'是的啊……这是当时就截的图……',0,1316168809),(11862,1485,14127,11858,'变态！',0,1316168865),(11867,1485,3320,0,'他说的没错啊。',0,1316176732),(11868,1485,14127,11867,'不是错没错的问题啊 这种说法真是……',0,1316176798),(11869,1485,24178,0,'= =每次看他说这种话都觉得秋生他好厉害\n= =难为早苗你了（你确定不是难为的秋生吗）',0,1316178349),(11870,1485,14127,11869,'这游戏里除了芽衣就没正常人啦！',0,1316179140),(11871,1485,24178,11869,'[quote][b]油咖喱酱[/b] 说: 这游戏里除了芽衣就没正常人啦！[/quote]\n= =我觉得椋就挺正常的.....',0,1316180701),(11872,1485,10009,0,'秋生可是紳士72柱之一啊!',0,1316180840),(11873,1485,14127,11872,'这是什么……还有哪71个？',0,1316180902),(11874,1485,10009,11872,'[quote][b]油咖喱酱[/b] 说: 这是什么……还有哪71个？[/quote]\n這是禁則事項',0,1316180936),(86483,1485,302247,0,'HENTAI',0,1493510294),(15662,2185,74384,0,'选了某个游戏以后【比如就这款团子】，怎么才能下载【玩】这款游戏啊.......或是在哪里才能找到连接之内的下载？',0,1333119113),(15664,2185,9639,0,'一下子想到了[url=http://chii.in/rakuen/topic/subject/892]这个[/url]\nBangumi不提供任何资源的下载哦(bgm25)',0,1333120490),(15665,2185,2571,0,'在里區裏有下載，進入資格要向阿叉用10000金幣換100節操，再以這100節操平均分給鸛狸猿以獲得進入里區資格。',0,1333120687),(15668,2185,74384,15665,'不是很明白 O . O  但是觉得好强大哦！求细解~(≧▽≦)/~',0,1333156112),(15669,2185,14127,0,'这里不提供下载。',0,1333157389),(15674,2185,11118,15669,'太长了，“没”\n（致敬用意',0,1333159547),(15675,2185,9639,15665,'[quote][b]【以吾之名】[/b] 说: 不是很明白 O . O&nbsp;&nbsp;但是觉得好强大哦！求细解~(≧▽≦)/~[/quote]\n解只有两个字：[mask]真相[/mask]\n(bgm38)',0,1333160316),(15698,2185,74384,0,'SOKA......原来是这样的  O . O ...不提供下载啊...',0,1333203834),(22419,2740,3417,0,'[url]http://bangumi.tv/character/8[/url]',0,1351677920),(22377,2740,104740,0,'智代~~~~赛高！！！！！',0,1351518163),(33767,3653,52289,0,'道道阳光从空中倾注而下，其本身就像生命的赞歌一般。\r\n在绿色的丘陵间延伸着一条蜿蜒曲折的小路。上面并没有铺设水泥，只由黄土培实而成。虽然正处于欧洲的正中央，但这里还没有沾染现代文明的颜色，维持着原有的土色土香。虽说住在这里想必多有不便，但也乐得远离都市的喧嚣。\r\n在鸡犬相闻的田间小路上，一驾运货马车正不慌不慢地向东而去。握着两匹马的缰绳的，是一个身材修长的乡下马夫。尽管如此，他好像深知御马之道，握缰的手没有一点颤抖。\r\n马车的车斗里装满了干草。\r\n干草上面坐着一个少女。长发齐腰，相貌端正，这就是她留给人的第一印象。\r\n在她的手里，持有和周遭环境毫无关系的日本折纸。少女正一门心思地摆弄着它。\r\n终于，折纸渐渐成型了。那是一只鹤。少女满意的端详了一会儿，把它放在了干草上，使劲伸了个懒腰，就这样在甘草上睡了过去。\r\n马车微微一摇，车夫并不转头，只是视线向背后瞟去。\r\n少女没有在意。\r\n少女尽情地吸着沐浴阳光后的草香，仰视头顶青空，嫣然一笑。\r\n  \r\n然后，\r\n“名为Geass的王之力会让人孤独——”\r\n少女C.C.那无忧无虑的，银铃般的声音在天际回响着。\r\n“呵呵……也不尽然呢。呐，鲁路修。”\r\n握着缰绳的车夫依旧看着身后。\r\n但他嘴角边突然浮出一丝笑意，转向了前方。\r\n在两匹劣马的牵引下，马车沿着小路缓缓前进。\r\n风和日丽，万里无云。',0,1377499964),(33768,3653,52289,0,'在我心目中最好的结局 (bgm50)(bgm50)(bgm50)(bgm50)',0,1377499986),(33769,3653,52289,0,'重要的不是cc跟lulu能一直在一起\n最重要的是lulu没死！！！！！！\n最好的惩罚 永生\n最好的结局 cc不会再孤独',0,1377500149),(33770,3653,52289,0,'不愧是11年最萌男 Lelouch·Vi·Britannia实在当之无愧！！！\n\n慧跟恶意 善良与为求目的不择手段的奸诈 一盘完美的棋盘\n\nAll Hail Lelouch~!All Hail Lelouch~!All Hail Lelouch~!\n完美的王之力使用者！！！！',0,1377500372),(33786,3653,157444,0,'哎。。鲁鲁修一直活在我心中。。当时他死了我都呆了QVQ',0,1377519718),(33772,3653,52289,0,'clamp大妈性格塑造跟福山润大大配音实在无敌赞！！！！！',0,1377500702),(33773,3653,52289,0,'(bgm67)(bgm67)(bgm67)(bgm67)(bgm67)(bgm67)(bgm67)',0,1377500711),(33775,3653,12391,0,'(bgm38)鲁鲁修这角色除了脸和CLAMP有关系？\n回想起来还好R2出的早。\n以及当年大河内病了，我特么还没有吃药；谷口还能整出最后一集神洗地。不然R2下场和罪冠以及VVV又有啥区别？',0,1377501764),(33780,3653,52289,33775,'这个嘛。。。我就不知道了= = 我不是很清楚那些..要是clamp跟塑造没什么关系我就说错了..我认得只有长相不好意思啊...行了行了',0,1377504288),(33781,3653,52289,33775,'体谅你 亲爱的',0,1377504298),(33788,3653,52289,33786,'我要相信他没死没死就是没死',0,1377523249),(33789,3653,157444,33786,'[quote][b]鱼子酱[/b] 说: 我要相信他没死没死就是没死[/quote]\n恩恩！0 0我一直觉得他有code！',0,1377527762),(33795,3653,155127,0,'这个是官方小说的结局吧~~\n从CP上看是个最完美的结局，一对永生CP',0,1377582295),(33813,3653,82260,33775,'+1，clamp只做了人设，其他包括剧情脚本神马的都是别人做的',0,1377609004),(33926,3653,52289,33795,'是啊 现在的我 比较喜欢he',0,1377843872),(33928,3653,155127,33795,'[quote][b]鱼子酱[/b] 说: 是啊 现在的我 比较喜欢he[/quote]\n一直都很喜欢HE哦~虽然BE也很美但是还是喜欢经历风雨后大家平静倚在一起的那种美好。',0,1377852605),(33938,3653,52289,33795,'[quote][b]十六樱[/b] 说: 一直都很喜欢HE哦~虽然BE也很美但是还是喜欢经历风雨后大家平静倚在一起的那种美好。[/quote]\n哈哈 有时候 be也是个很好的结局 因为毕竟现实中还是be为结局的事情居多',0,1377863691),(33969,3653,9703,0,'后来少年改名叫劳伦斯 少女改名叫赫萝\n当然那又是另外一个故事了',0,1377938273),(33991,3653,52289,33969,'哈哈 另外一个故事又如何呢？好看吗',0,1378011981),(34000,3653,9703,33969,'[quote][b]鱼子酱[/b] 说: 哈哈 另外一个故事又如何呢？好看吗[/quote]\n很喜欢 漫画动画都看了 小说苦手',0,1378033031),(34008,3653,155127,33795,'[quote][b]鱼子酱[/b] 说: 哈哈 有时候 be也是个很好的结局 因为毕竟现实中还是be为结局的事情居多[/quote]\n也是',0,1378050369),(34009,3653,155127,33969,'[quote][b]L君[/b] 说: 很喜欢 漫画动画都看了 小说苦手[/quote]\n这么一说我想起了鲁鲁修X卡莲…………',0,1378050400),(124927,3653,467385,0,'车夫党的胜利哦！',0,1555773511),(71572,6873,142527,0,'看到第四集了还没看到这些剧情，但是被剧透了一脸，现在都悬着一颗心 …… (bgm38)(bgm38)\r\n\r\n「本须和秀树捡到了人型计算机〔唧〕。虽然不晓得她到底是不是〔Chobits〕，但她的身上似乎藏有极大的秘密。看到秀树为了钱[mask]而烦恼，唧出去找打工，没想到却找到了危险的工作！为了让秀树开心，唧开始到色情小屋打工。但她在遭到过度激烈的强迫要求之后失控。让周遭计算机因此而强制停摆。\r\n另一方面，秀树发现好友新保与补习班的清水老师[/mask]有着不可告人的关系……」',0,1462335911),(71580,6873,38770,0,'剧透你再给他发一遍，等于是，你也有责任吧！？',0,1462337710),(71737,6873,142527,71580,'哎呀好有道理 ∑(ﾟДﾟ)\n不过不然别人怎么才知道我说的是哪一段啊 总之先标黑就是了 (',0,1462528625),(81868,6873,264146,0,'人物条目内容也满是剧透......现在一般补番不看完前都不敢进了，有些回复还会自觉打码。',0,1481041761),(81879,6873,3490,0,'其实没有透多少吧',0,1481090544),(81880,6873,264146,81879,'都透到EP十几去了......',0,1481093740),(81881,6873,3490,81879,'[quote][b]小T[/b] 说: 都透到EP十几去了......[/quote]\n这片子主要看福利，剧情太都合了',0,1481094210),(81882,6873,264146,81879,'[quote][b]lhb5883-污喵王VIP⑩[/b] 说: 这片子主要看福利，剧情太都合了[/quote]\n讲道理还好自己没看到，条目介绍最后那段我看的贼几把嗨',0,1481094293),(81884,6873,3490,81879,'[quote][b]小T[/b] 说: 讲道理还好自己没看到，条目介绍最后那段我看的贼几把嗨[/quote]\n哈哈哈 还好我看的早。',0,1481098545),(170405,19800,546484,0,'蛮感人的，重病作者与小岛还有合金装备系列的一段缘。\r\n\r\nON PROJECT ITOH\r\nCompiled from an interview with Hideo Kojima\r\nFebruary 12, 2010\r\nMARCH 1998. I remember first meeting Itoh-san during the Spring ’98 Tokyo\r\nGame Show. I was in the exhibitor’s booth for Metal Gear Solid, to be released\r\nthat September, when a young man called my name. I turned to see who it was\r\nand saw his face streaming with tears. Here, amid the clamor and festivities of\r\nthe Game Show, one young man was crying. Later, he would become the\r\nnovelist Project Itoh.\r\nAt the booth, we showed a trailer of in-game footage I’d compiled and edited.\r\nThe preview had brought Itoh-san to tears, and now he talked to me earnestly.\r\nBefore that moment, I’d never met a fan who so loved Metal Gear Solid, and I\r\nremember being moved. From then on, Itoh-san sent me fan letters and even\r\nMetal Gear doujinshi—fanzines—created by him and his friends. I eventually\r\nheard he had a website, and I would take a look at it from time to time.\r\nStill, my relationship with Itoh-san remained nothing more than that of a\r\ngame creator and a passionate fan. This may sound cold to some readers, but I\r\ndon’t ever think of fostering one-on-one connections with my fans. And I feel\r\nthis way even today—I’m just on the delivery end and mustn’t directly\r\nexchange with the consumers. The messages and presents and web comments\r\nare the most crucial nourishment for my work, and of course I’m grateful for\r\nthem each and every day. But I feel the only way I can properly respond to\r\nthem is through my creations, my games. So I never did anything to encourage\r\nItoh-san. For a time, our relationship wasn’t mutual, it was one-way.\r\nChange came to our relationship in September 2001, right before 9/11.\r\nI heard from members of the Konami team that Itoh-san had been\r\nhospitalized, possibly with cancer. I want to do something for him, I thought,\r\nthen when I thought of him on his sickbed, I wondered, But what can I do for\r\nhim? The answer I came up with was, of course, a game. We had met because\r\nof my game, Metal Gear Solid. That provided the only answer. I recorded cutscenes from the still-in-progress Metal Gear Solid 2 onto a MiniDV cassette and\r\ntook it to his hospital room. He put on a composed front, but it couldn’t mask\r\nhis dark expression. An uncertain future left him depressed. It wasn’t much, but\r\nfrom his bedside, I showed him the ending scene of the Tanker segment.\r\nNormally, we can’t show people outside the company even a portion of a\r\nwork-in-progress. But it was all I could do for him, so I let him see it.\r\n“I won’t die until you finish the game.” That was what Itoh-san said, to my\r\nrelief, when the clip ended.\r\nIn November 2001, we managed to release Metal Gear Solid 2: Sons of Liberty\r\nas planned. I invited Itoh-san to the press conference, and he attended the\r\nreception. He had been through a serious operation, and I was pained to watch\r\nhim walking with a cane, but I was glad to see him. He kept his promise. When I\r\nlook back at it now, I think that was the moment he went in my mind from\r\nbeing a fan to a friend.\r\nMetal Gear Solid 2 was greatly anticipated, but the initial response to its\r\nrelease was sharply divided. The game has since gained a reputation, but at the\r\ntime, I would become depressed when I saw what people wrote in comments\r\nand reviews—about the new character, Raiden; that the message at the end\r\nwas too strong; and that the story was too abstruse for a gamer audience. Itohsan was the first to understand me. On his personal website, he wrote an article\r\nsaying, “I’m the only one happy with this kind of game!” Someone understood\r\nthe riddles and messages I put into my games. I felt that simple fact saved me.\r\nI think that was when Itoh-san had an awakening and set forth on the\r\nauthor’s path. One time, Itoh-san asked me to look at a manga written by him\r\nand drawn by his friend. I was happy at the chance to read it, but to be blunt,\r\nhis work didn’t really do anything for me. True, he had abundant knowledge\r\nand an uncanny power of understanding. He was able to grasp points in my\r\ngames that most of my fans missed. One of my works before Metal Gear Solid,\r\nPolicenauts, featured as part of its theme the notion that a space colony would\r\nhave to become a highly medicalized society, but very few understood its\r\ninevitability. But Itoh-san got it, along with the reveal in Metal Gear Solid that\r\nLiquid’s group sought Big Boss’s corpse, and the twist in Metal Gear Solid 2\r\nwhen Snake’s NPO becomes designated a terrorist organization. He delighted inthem, saying, “This is science fiction!” But I had doubts about his creative\r\npotential, as opposed to his discernment as a gamer.\r\nThen he began to change. It started with the quality of his writings on his\r\nblog, followed by his online movie reviews. I can’t quite find the right words to\r\nexplain it, but I was seeing something like a new perspective within his writing.\r\nLooking back at it, I think the change came soon before he started writing\r\nGenocidal Organ. I can’t give a solid explanation, but perhaps the experience of\r\na severe illness awakened the author within him. I imagine as he lived with\r\ndeath by his side, his perceptions underwent a major shift.\r\nWhen I read Genocidal Organ, I was shocked. It was something only Itoh-san\r\ncould have written; delicate, yet dreadful, and even endearing. Project Itoh the\r\nwriter was born. Apparently, in a later interview, Itoh-san said that the short\r\nstory serving as the basis for Genocidal Organ had been fan fiction of my early\r\ngame Snatcher. But in the novel I saw reflections of the Metal Gear Solid series.\r\nAnd so I didn’t hesitate to approach him for the novelization of Metal Gear Solid\r\n4.\r\nWe made the first plans for the novelization in January 2008. When Itoh-san\r\nentered the meeting room cane in hand, he emanated an author’s aura. Gone\r\nwas the fragility of the young man crying at the Tokyo Game Show booth just\r\nten years prior. He had the dignified countenance of an author. I think this was\r\nthe first time Itoh-san and I exchanged words as two creators.\r\nBefore we knew it, the plans had been made. I wanted the novel to be based\r\non Metal Gear Solid 4, but also, so that those who hadn’t played the rest of the\r\nseries could understand, to include characters, history, and settings from the\r\nMetal Gear saga. I wanted it to be written and composed so that it would be\r\naccessible to younger readers, and I wanted the novel to express the themes of\r\nMGS4. He took our unreasonable list of demands and checked them off one by\r\none. He came up with the ideas of making Otacon the narrator and omitting the\r\nBeauty and the Beast Unit, boss characters crucial to the themes and game\r\ndesign of MGS4, to instead let series regulars embody the themes. In almost no\r\ntime at all, the basic concepts of the novel had been set.\r\nThen, with tremendous enthusiasm, he went to work.The first draft soon arrived, and it surpassed my expectations. There was even\r\na feeling, I have to say a nice feeling, of entrusting my own creation to a third\r\nparty. Of course he recreated the themes I’d put into the game, the emotions of\r\nmy characters, and the turns of the story, but vividly present in Itoh-san’s prose\r\nwere different aspects of the story I’d never realized were there, and motifs\r\nhidden within the setting. There’s a phrase, “reading between the lines.” Itohsan gathered meaning and details and feelings between the letters of the game\r\nscript. This wasn’t merely a carbon copy of the game in novel form.\r\nAfter the game and the novel were released, I settled on the plot for my next\r\nproject. After Metal Gear Solid 2, whenever I finished creating a game, I always\r\nfirst looked to see if it made Itoh-san happy. And not just then, but during\r\nproduction I would wonder, Will he take to this story, to this setting, to these\r\ncharacters? I had it in my head that my next game would be set in Costa Rica in\r\n1974. On the timeline it would come after Metal Gear Solid 3. It takes place\r\nduring the Cold War, when an unknown military group engages in secret\r\noperations within the peaceful, defenseless Central American nation. Naked\r\nSnake’s Militaires Sans Frontieres are brought in to stop them. The game is\r\nMetal Gear Solid: Peace Walker.\r\nI wanted to ask Itoh-san to collect my new story with Metal Gear Solid 3 into a\r\nsingle novel. My next chance to talk with him came unexpectedly.\r\nFebruary 2009. In the hospital, Itoh-san’s condition was not good. So far he\r\nhad won every battle in the long fight with his illness, but I was told that this\r\ntime he might not make it. I dropped everything and rushed to see him. Itohsan was in bed, and I talked about what movies I’d seen and what books I’d\r\nread recently, but his expression was blank, and he wasn’t able to say much in\r\nreturn. I thought, I want him to get his spark back. I don’t want him to give up\r\nliving. So I started to tell him about Peace Walker. I told him about Costa Rica\r\nand the theme of nuclear deterrence, about the secret struggle between\r\nintelligence agencies in the Cold War, about the AI weapon straight out of 70s’\r\nsci-fi, about Snake and the other characters, and as I talked he regained more\r\nand more of his smile. And then, just like before, he told me, “I won’t give up\r\nuntil you’re done.”\r\nAt that point I hadn’t publicly announced a single aspect of my plans for thegame. Itoh-san was the first person outside the company to hear any details,\r\njust as it had been with Metal Gear Solid 2. The only real difference between\r\nthe events of 2001 and 2009 was that this time, Itoh-san couldn’t keep his\r\npromise.\r\nThere is a scene in this novel in which Naomi teaches the struggling Sunny the\r\ntrick to making fried eggs. That scene, of course, is also in the game, but as Itohsan writes it, even that moment is a story handed to Sunny by Naomi. Even in\r\nthe morning’s fried eggs a story dwells—a story not expressed in my game. I\r\nbelieve this novel is Project Itoh’s Metal Gear Solid.\r\nWould this game make Itoh-san happy? That standard is part of what the\r\nstory of Project Itoh means to me. Therefore, Project Itoh already dwells inside\r\nmy game. Itoh-san took this game, retold it, and handed me back his own Metal\r\nGear Solid. Like a double helix. Such a wonderful game of catch.\r\nBecause of the existence of a man called Itoh-san, I’ve experienced a\r\nhappiness difficult for a creator to obtain.\r\nProject Itoh-san, thank you.',0,1627227686),(171087,19876,451958,0,'CLANNAD × 寒蝉鸣泣之时 命（手游）\r\n\r\n[img]https://tupian.li/images/2021/08/09/006Hm8pLgy1gtaovotpnxj30ru0fo77p.jpg[/img]\r\n\r\n[img]https://tupian.li/images/2021/08/09/-2021-08-09-202135.png[/img]\r\n\r\n[img]https://tupian.li/images/2021/08/09/-2021-08-09-202234.png[/img]\r\n\r\n[img]https://tupian.li/images/2021/08/09/-2021-08-09-202206.png[/img]\r\n\r\n[url=https://www.bilibili.com/video/BV1ZL411n7Ni]宣传pv[/url]\r\n\r\n这波啊，是双倍的治愈人心(bgm38)',0,1628511864),(171092,19876,592541,0,'——唔唔...酱油瓶子！(bgm34)\n——你喜欢这座小镇吗？(bgm35)\n我非常非常喜欢。但是，所有的这一切都在不断重复着。\n无论是多么愉快的事，还是多么痛哭的事。一切，所有这一切，都在不断重复着。即使如此，你还会喜欢上这里吗?(bgm27)\n——我最喜欢雏见泽了！(bgm43)',0,1628514735),(171096,19876,14488,0,'还是拖了同一个CV的福，感恩',0,1628518918),(171124,19886,617229,0,'请教大神R2为什么节奏没有R1好  我个人看下来倒是觉着没太大问题',0,1628589932),(171255,19886,436597,0,'势力更多更广的情况下势必要使用更多笔墨，用皇帝的金锄头不论战争的进程也明显加快，政治就不提了全靠脑补和脑抽反转Shocking观众，过段时间冷静想想其实就那么回事',0,1628845201),(171125,19887,617229,0,'请教大神R2为什么节奏没有R1好 我R2通篇看完下来没觉着有啥不妥的',0,1628589969),(171126,19887,617229,0,'不好意思 没有熟悉操作发送了两遍',0,1628590024),(171127,19887,539219,0,'凭空出现的设定、暴风般的剧情进展、语焉不详的心理活动。',0,1628590749),(171128,19887,617229,171127,'凭空设定出自哪集？ 是什么设定？',0,1628590889),(171129,19887,539219,171127,'[quote][b]翔の意识[/b] 说: 凭空设定出自哪集？ 是什么设定？[/quote]\n“C的世界”整集都是在神棍式地乱抛设定。',0,1628591945),(171148,19887,482674,0,'据一位业内人士说是大人的原因……\r\n好像原本预定有三季还是怎么回事，结果做了几集突然被金主告知要在两季内结束。',0,1628647000),(171149,19887,603727,0,'R2的细节处理相比R1要粗糙得太多了，世界观和主题表达都相当混乱。我印象最深刻的几点有，紫禁城势力的左右横跳、忽强忽弱，帝国直接把敌人精心挑选出来的分裂分子直接放走，各角色之间的感情处理混乱，人物塑造也和R1严重冲突，还有就是编剧强行多次让鲁路修降智并封口，槽点多到无力吐槽。',0,1628650022),(171151,19887,582116,0,'个人感觉最难接受的是人物塑造得工具人感太强，还有ep22-25的剧情可以多水一季，结果就往四集里硬塞。',0,1628651192),(171155,19887,617229,171149,'纳入后duo 大概懂了',0,1628655775),(171156,19887,603727,171149,'[quote][b]翔の意识[/b] 说: 纳入后duo 大概懂了[/quote]\nR2其实是非常非常可惜的，存在可以扩充和讨论的空间其实极大，但R1塑造了一个优秀的底子硬是全都让R2霍霍完了，哪怕是最后一集被吹爆的封神之作其实也不过是作者在中后段已经崩坏的前提下强行收尾。鲁路修算是我最惋惜的几部作品之一了。',0,1628656451),(171163,19887,274258,0,'剧情飞快，反复横跳，其实看的挺刺激的',0,1628667863),(171173,19887,211931,0,'名为第一骑士，实为第一工具人',0,1628677093),(171176,19887,559571,171163,'+1',0,1628682644),(171201,19887,7626,0,'R1结尾时岛上朱雀飞踢开始崩坏，设定变成了何でもあり\nR2全程迷走，最后靠着结局拉回来一点\n跟AZ非常相似，只是AZ最后也没拉住',0,1628720628),(179385,19887,307715,171127,'[quote][b]五月症候群[/b] 说: “C的世界”整集都是在神棍式地乱抛设定。[/quote]\n这就是口胡了。Geass的力量来源是从第一集就埋下的伏笔，鲁鲁修获得Geass的时候看到的幻觉，集体行走的人，挣扎嚎叫的人，闭目祷告的人，还有第二季新增的无数的假面，都是在暗示人的集体无意识。设定参考的根据，估计就是布吉波普不笑了。',0,1638797602),(179386,19887,307715,171127,'[quote][b]五月症候群[/b] 说: “C的世界”整集都是在神棍式地乱抛设定。[/quote]\n以及大多数的Geass都是通过影响人类意识发生作用的。',0,1638797678),(179387,19887,539219,171127,'[quote][b]匿名[/b] 说: 这就是口胡了。Geass的力量来源是从第一集就埋下的伏笔，鲁鲁修获得Geass的时候看到的幻觉，集体行走的人，挣扎嚎叫的人，闭目祷告的人，还有第二季新增的无数的假面，都是在暗示人的集体无意识。设定参考...[/quote]\n你也说了是暗示，所以除此之外，有没有任何一处能够支持鲁路修能打败他爹的伏笔？阿卡夏纪录、他妈的Geass、只有Geass成熟的人才能杀死C.C等等设定几乎全部都是在这集才有出现，这不是神棍式的乱抛难不成只有河森正治才能算？',0,1638800258),(179769,19887,307715,171127,'[quote][b]五月症候群[/b] 说: 你也说了是暗示，所以除此之外，有没有任何一处能够支持鲁路修能打败他爹的伏笔？阿卡夏纪录、他妈的Geass、只有Geass成熟的人才能杀死C.C等等设定几乎全部都是在这集才有出现，这不是神棍式的乱抛难不...[/quote]\n阿卡夏纪录，也即Code和Geass的来源，通过以上种种已经有暗示了。他妈的Geass，阿尼亚有说过自己的记忆非常混乱，还有持有鲁鲁修年幼时候的照片，也是有伏笔的。“只有Geass成熟的人才能杀死C.C.”，这条第一季对战毛的时候开始铺垫，第二季V.V.被杀的时候铺垫完毕，随后在C的世界中，C.C.和查理斯亲自说明了。\n思考电梯计划，都是暗示但没有明确说明，这条才可以说是非常突兀。',0,1639309484),(179770,19887,307715,171127,'[quote][b]五月症候群[/b] 说: 你也说了是暗示，所以除此之外，有没有任何一处能够支持鲁路修能打败他爹的伏笔？阿卡夏纪录、他妈的Geass、只有Geass成熟的人才能杀死C.C等等设定几乎全部都是在这集才有出现，这不是神棍式的乱抛难不...[/quote]\n你怕不是只看了总集片，还是跳着看的。',0,1639309549),(179792,19887,581555,0,'别问  问就是大河内江郎才尽(bgm74)',0,1639381921);
/*!40000 ALTER TABLE `chii_subject_posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO `chii_members` (`uid`,
                            `username`,
                            `nickname`,
                            `avatar`,
                            `groupid`,
                            `regdate`,
                            `lastvisit`,
                            `lastactivity`,
                            `lastpost`,
                            `dateformat`,
                            `timeformat`,
                            `timeoffset`,
                            `newpm`,
                            `new_notify`,
                            `sign`)
VALUES (382951,
        '382951',
        '树洞酱',
        '000/38/29/382951.jpg?r=1571167246',
        10,
        1512262276,
        1639827114,
        1639841249,
        0,
        '',
        0,
        '9999',
        0,
        7,
        'treeholechan@gmail.com 密码:lovemeplease');

INSERT INTO `chii_memberfields` (`uid`,
                                 `site`,
                                 `location`,
                                 `bio`,
                                 `privacy`,
                                 `blocklist`)
VALUES (382951,
        'bgm.tv/character/13307',
        '',
        'treeholechan@gmail.com 密码：lovemeplease\r\n（欢迎大家一起维护树洞酱，但请勿随意修改密码）\r\n\r\n[url=https://bgm.tv/user/treehole]初心[/url]\r\n\r\n[b][url=https://bgm.tv/blog/3996]1. 关于树洞酱的事[/url][/b]\r\n[size=8]任何人都可以钻到这里：可以诉说不为人知的秘密，可以自曝真相，可以晒黑历史，可以说平时不太敢说的话，可以扮演不同的人格……\r\n不用担心维护自己的形象。也许你会说，有什么都可以直接说出来嘛，为什么要这样做？但是既然有一个完全虚拟的网络，为什么非要对应着现实世界每个人都要有个id，有个头像呢？\r\n或者这只是一种尝试吧。[/size]\r\n\r\n[b][url=https://bgm.tv/blog/3998]2. 爱护我们的树洞酱[/url][/b]',
        'a:4:{i:1;i:2;i:30;i:2;i:20;i:2;i:21;i:0;}',
        '0');


INSERT INTO chii_oauth_access_tokens (access_token, client_id, user_id, expires, scope)
VALUES ('a_development_access_token', 'test_client_id', '382951', '2030-12-21 14:16:28', null);
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 27, 2021 at 03:35 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

--
-- Dumping data for table `chii_person_collects`
--

INSERT INTO `chii_person_collects` (`prsn_clt_id`, `prsn_clt_cat`, `prsn_clt_mid`, `prsn_clt_uid`, `prsn_clt_dateline`) VALUES
(1, 'crt', 706, 1, 1296495506),
(2, 'crt', 3, 1, 1296495535),
(3, 'crt', 1, 1, 1296495541),
(4, 'crt', 10792, 14459, 1296495763),
(5, 'crt', 10760, 14459, 1296495906),
(6, 'crt', 10776, 14459, 1296495929),
(7, 'crt', 292, 6162, 1296496026),
(8, 'crt', 297, 6162, 1296496052),
(9, 'crt', 10078, 6162, 1296496114),
(10, 'crt', 706, 6235, 1296496204),
(11, 'crt', 10586, 6235, 1296496213),
(13, 'crt', 4569, 6162, 1296496228),
(15, 'crt', 606, 6162, 1296496251),
(16, 'crt', 32, 6162, 1296496277),
(17, 'crt', 10774, 6235, 1296496283),
(18, 'prsn', 5816, 14459, 1296496294),
(19, 'crt', 53, 6162, 1296496302),
(20, 'prsn', 5818, 14459, 1296496318),
(21, 'prsn', 5813, 14459, 1296496349),
(22, 'crt', 1, 6162, 1296496366),
(23, 'crt', 3, 6162, 1296496378),
(24, 'prsn', 2923, 14459, 1296496379),
(25, 'crt', 5690, 6162, 1296496401),
(26, 'prsn', 5809, 14459, 1296496412),
(27, 'prsn', 5805, 14459, 1296496429),
(28, 'prsn', 5804, 14459, 1296496452),
(29, 'crt', 1937, 2978, 1296496467),
(30, 'prsn', 5802, 14459, 1296496468),
(31, 'crt', 712, 6162, 1296496472),
(33, 'prsn', 5792, 14459, 1296496505),
(34, 'crt', 9969, 6162, 1296496552),
(35, 'prsn', 5789, 14459, 1296496559),
(36, 'prsn', 5788, 14459, 1296496582),
(37, 'crt', 10447, 6162, 1296496585),
(38, 'prsn', 5830, 1, 1296496598),
(40, 'crt', 423, 6162, 1296496645),
(41, 'prsn', 5761, 14459, 1296496690),
(42, 'crt', 1026, 6162, 1296496728),
(43, 'prsn', 5830, 4, 1296496729),
(44, 'crt', 8937, 6162, 1296496759),
(45, 'prsn', 5741, 14459, 1296496763),
(46, 'crt', 10608, 14459, 1296496779),
(47, 'prsn', 1, 14459, 1296496832),
(48, 'crt', 32, 1, 1296496835),
(50, 'prsn', 3287, 3730, 1296497138);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 192.168.201.71
-- Generation Time: Dec 27, 2021 at 03:32 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangumi`
--

--
-- Dumping data for table `chii_subject_interests`
--

INSERT INTO `chii_subject_interests` (`interest_id`, `interest_uid`, `interest_subject_id`, `interest_subject_type`, `interest_rate`, `interest_type`, `interest_has_comment`, `interest_comment`, `interest_tag`, `interest_ep_status`, `interest_vol_status`, `interest_wish_dateline`, `interest_doing_dateline`, `interest_collect_dateline`, `interest_on_hold_dateline`, `interest_dropped_dateline`, `interest_lasttouch`, `interest_private`) VALUES
(17325702, 382951, 8, 2, 0, 2, 1, 'test comment', 'SUNRISE ', 23, 0, 0, 0, 1639569348, 0, 0, 1639569371, 0),
(17325710, 382951, 4, 4, 0, 1, 0, '', '', 0, 0, 1639569404, 0, 0, 0, 0,  1639569404, 0),
(17325711, 382951, 9, 4, 0, 5, 0, '', '', 0, 0, 0, 0, 0, 0, 1639569424,  1639569424, 0),
(17325712, 382951, 10, 1, 0, 4, 0, '', '', 0, 0, 0, 0, 0, 1639569433, 0, 1639569433, 0),
(17325727, 382951, 20, 3, 0, 3, 0, '', '', 0, 0, 0, 1639569656, 0, 0, 0, 1639569656, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
LOCK TABLES `chii_subject_topics` WRITE;

REPLACE
    INTO `chii_subject_topics`
VALUES (3934, 827, 53507, '是否能盖棺论定SD的历史地位', 1385429895, 1385745808, 28, 1, 1),
       (4846, 73544, 14382, '千呼万唤始出来。', 1407665652, 1407769003, 11, 1, 0),
       (5000, 93714, 143752, '垃圾片子，除了卖噱头之外一无是处。可笑nc粉还想和巨人比高。你有见过PP粉要和攻壳比高？', 1410528860, 1412335055, 240, 1, 1),
       (5088, 109328, 143752, '我是来吐槽这个@幸 的人的，还没看就', 1412337018, 1412620671, 26, 1, 1),
       (5874, 115908, 247629, '为什么评分这么低？怎么才能把评分提高？', 1432910301, 1434330445, 188, 1, 1),
       (11586, 37663, 361240, '我们心愿屋汉化组完成了该游戏的汉化', 1504873891, 1505034016, 17, 1, 1),
       (12629, 226750, 415326, '对评分行为准则标准化倡议五则', 1523770681, 1523774656, 7, 1, 1),
       (15133, 263750, 449353, '你们认为完结能有多少分', 1556765161, 1560142084, 176, 1, 1),
       (15368, 263750, 439026, '这是要冲rank1的节奏啊?', 1559740170, 1560182703, 204, 1, 1),
       (15370, 263750, 402934, '要黑要酸的至少看了再来吧', 1559796957, 1560159997, 85, 1, 0);

REPLACE INTO `chii_subject_topics`
VALUES (18472, 285666, 321304, '细思恐极，总感觉这动画是在影射现实', 1608565655, 1608619775, 116, 5, 0),
       (18784, 277554, 441789, '小小蝈蝻，很少烦恼', 1612667377, 1612877481, 128, 5, 1),
       (19477, 306742, 567312, '不是，评分标签里有个“反华”是什么zz现象？？？', 1622817436, 1629172515, 130, 5, 1);

UNLOCK TABLES;
