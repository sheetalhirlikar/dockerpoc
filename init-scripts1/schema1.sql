-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: licensing
-- ------------------------------------------------------
-- Server version	5.5.68-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alr_account`
--

DROP TABLE IF EXISTS `alr_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alr_account` (
  `account` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `area` varchar(32) NOT NULL,
  `mode` enum('partner','er','demo') NOT NULL,
  `tags` varchar(1024) NOT NULL,
  UNIQUE KEY `reference` (`account`,`mode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alr_restrictions`
--

DROP TABLE IF EXISTS `alr_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alr_restrictions` (
  `empno` int(11) NOT NULL,
  `mode` enum('partner','er','demo') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alr_user`
--

DROP TABLE IF EXISTS `alr_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alr_user` (
  `email` varchar(128) NOT NULL,
  `account` varchar(32) NOT NULL,
  `mode` enum('partner','er','demo') NOT NULL,
  PRIMARY KEY (`email`,`mode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `iso` char(2) NOT NULL,
  `iso3` char(3) NOT NULL,
  `name` varchar(48) NOT NULL,
  `continent` char(2) NOT NULL,
  `tld` varchar(12) NOT NULL,
  `tzlow` float NOT NULL,
  `tzhigh` float NOT NULL,
  UNIQUE KEY `iso` (`iso`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `country_code` char(2) COLLATE utf8_bin DEFAULT NULL,
  `country_name` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  KEY `idx_country_code` (`country_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dach_archive`
--

DROP TABLE IF EXISTS `dach_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dach_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` varchar(32) NOT NULL,
  `license_archive_id` int(11) NOT NULL,
  `agreement` varchar(128) NOT NULL,
  `installation` varchar(128) NOT NULL,
  `customer` varchar(128) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `es_date` date NOT NULL,
  `lictype` varchar(32) NOT NULL,
  `server_id` varchar(128) DEFAULT NULL,
  `target_id` varchar(128) DEFAULT NULL,
  `features` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=176 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `download_activity`
--

DROP TABLE IF EXISTS `download_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `download_activity` (
  `DownloadID` int(11) NOT NULL,
  `DownloadType` char(4) DEFAULT NULL,
  `StartDateTime` datetime DEFAULT NULL,
  `EndDateTime` datetime DEFAULT NULL,
  `DurationSeconds` int(11) DEFAULT NULL,
  `DownloadIPAddress` varchar(128) DEFAULT NULL,
  `IPAddressCountry` char(3) DEFAULT NULL,
  `IntrawareAccountID` char(15) DEFAULT NULL,
  `AccountID` varchar(100) DEFAULT NULL,
  `AccountName` varchar(100) DEFAULT NULL,
  `IntrawareMemberID` int(11) DEFAULT NULL,
  `MemberID` char(100) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `FirstName` varchar(30) DEFAULT NULL,
  `Email` char(100) DEFAULT NULL,
  `Country` char(3) DEFAULT NULL,
  `IntrawareOrderID` int(11) DEFAULT NULL,
  `OrderID` varchar(100) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `IntrawareCatalogItemID` int(11) DEFAULT NULL,
  `CatalogItemID` char(40) DEFAULT NULL,
  `CatalogItemName` varchar(255) DEFAULT NULL,
  `IntrawareProductID` int(11) DEFAULT NULL,
  `ProductID` char(40) DEFAULT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `IntrawareFileID` int(11) DEFAULT NULL,
  `FileID` char(40) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DownloadID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `els_archive`
--

DROP TABLE IF EXISTS `els_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `els_archive` (
  `id` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created` datetime DEFAULT NULL,
  `customer` varchar(80) DEFAULT NULL,
  `agreement` varchar(30) DEFAULT NULL,
  `installation` varchar(30) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `po` varchar(80) DEFAULT NULL,
  `serverid` varchar(255) DEFAULT NULL,
  `methtype` varchar(20) DEFAULT NULL,
  `lictype` varchar(30) DEFAULT NULL,
  `letter` varchar(30) DEFAULT NULL,
  `elsieif` longblob,
  `body` longblob,
  `cgi` longblob,
  `license` longblob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp` (
  `empno` int(11) NOT NULL,
  `fullname` varchar(80) NOT NULL,
  `lastfi` varchar(60) NOT NULL,
  `nameph` varchar(80) NOT NULL,
  `first` varchar(30) NOT NULL,
  `preferred` varchar(30) NOT NULL,
  `last` varchar(30) NOT NULL,
  `minname` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `buno` varchar(8) NOT NULL,
  `buname` varchar(128) NOT NULL,
  `deptno` varchar(8) NOT NULL,
  `deptname` varchar(128) NOT NULL,
  `location` varchar(80) NOT NULL,
  `phonesite` varchar(40) NOT NULL,
  `supno` int(11) NOT NULL,
  `supname` varchar(40) NOT NULL,
  `skypename` varchar(40) NOT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `gositeflag` varchar(20) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `fileno` varchar(40) DEFAULT NULL,
  `locid` int(11) DEFAULT NULL,
  `personid` int(11) DEFAULT NULL,
  `fullemail` varchar(90) NOT NULL,
  `userid` varchar(90) DEFAULT NULL,
  `exempt` varchar(8) DEFAULT NULL,
  `start` varchar(20) DEFAULT NULL,
  `category` varchar(80) DEFAULT NULL,
  `expensebu` varchar(20) DEFAULT NULL,
  `expnsdept` varchar(20) DEFAULT NULL,
  `title` varchar(80) DEFAULT NULL,
  `resourcetype` varchar(80) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `companyname` varchar(50) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`empno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp_locations`
--

DROP TABLE IF EXISTS `emp_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_locations` (
  `loccode` varchar(80) DEFAULT NULL,
  `description` varchar(80) DEFAULT NULL,
  `contact` varchar(80) DEFAULT NULL,
  `address1` varchar(80) DEFAULT NULL,
  `address2` varchar(80) DEFAULT NULL,
  `address3` varchar(80) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postalcode` varchar(25) DEFAULT NULL,
  `region1` varchar(80) DEFAULT NULL,
  `region2` varchar(80) DEFAULT NULL,
  `region3` varchar(80) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `phone1` varchar(30) DEFAULT NULL,
  `phone2` varchar(30) DEFAULT NULL,
  `phone3` varchar(30) DEFAULT NULL,
  `shiptosite` varchar(80) DEFAULT NULL,
  `billtosite` varchar(80) DEFAULT NULL,
  `officesite` varchar(80) DEFAULT NULL,
  `internalsite` varchar(80) DEFAULT NULL,
  `receivingsite` varchar(80) DEFAULT NULL,
  `addressstyle` varchar(20) DEFAULT NULL,
  `locid` int(11) NOT NULL,
  `locworldarea` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`locid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emplic_addons`
--

DROP TABLE IF EXISTS `emplic_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emplic_addons` (
  `userid` varchar(32) NOT NULL,
  `addon` varchar(32) NOT NULL,
  PRIMARY KEY (`userid`,`addon`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emplic_confirm`
--

DROP TABLE IF EXISTS `emplic_confirm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emplic_confirm` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `mscid` varchar(12) DEFAULT NULL,
  `empno` int(11) DEFAULT NULL,
  `generated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ipaddr` varchar(32) DEFAULT NULL,
  `confirmkey` varchar(32) DEFAULT NULL,
  `confirmed` datetime DEFAULT NULL,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `confirmkey` (`confirmkey`)
) ENGINE=MyISAM AUTO_INCREMENT=3237 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emplic_hits`
--

DROP TABLE IF EXISTS `emplic_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emplic_hits` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `mscid` varchar(12) DEFAULT NULL,
  `empno` int(11) DEFAULT NULL,
  `generated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ipaddr` varchar(32) DEFAULT NULL,
  `archive_id` int(11) DEFAULT NULL,
  `license` longtext,
  PRIMARY KEY (`seq`)
) ENGINE=MyISAM AUTO_INCREMENT=9241 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emplic_override`
--

DROP TABLE IF EXISTS `emplic_override`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emplic_override` (
  `empno` int(11) NOT NULL,
  UNIQUE KEY `empno` (`empno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` varchar(128) DEFAULT NULL,
  `subsystem` varchar(128) DEFAULT NULL,
  `topic` varchar(128) DEFAULT NULL,
  `level` varchar(64) DEFAULT NULL,
  `priority` varchar(64) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glas_archive`
--

DROP TABLE IF EXISTS `glas_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glas_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` varchar(32) NOT NULL,
  `actual_user` varchar(32) NOT NULL,
  `delivery_key` varchar(36) NOT NULL,
  `license` longblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `delivery_key` (`delivery_key`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `glas_delivery`
--

DROP TABLE IF EXISTS `glas_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glas_delivery` (
  `glas_archive_id` int(11) NOT NULL,
  `key` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lgx_archive`
--

DROP TABLE IF EXISTS `lgx_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lgx_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `username` varchar(16) NOT NULL,
  `lgx_server` varchar(128) DEFAULT NULL,
  `lgx_server_ip` varchar(128) DEFAULT NULL,
  `customer` varchar(80) DEFAULT NULL,
  `agreement` varchar(30) DEFAULT NULL,
  `installation` varchar(30) DEFAULT NULL,
  `order_number` varchar(128) DEFAULT NULL,
  `service_id` varchar(128) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `es_date` date DEFAULT NULL,
  `origin` varchar(16) DEFAULT NULL,
  `category` varchar(24) DEFAULT NULL,
  `product_set` varchar(24) DEFAULT NULL,
  `license_type` varchar(24) DEFAULT NULL,
  `server_ids` varchar(2048) DEFAULT NULL,
  `server_names` varchar(2048) DEFAULT NULL,
  `host_ids` varchar(2048) DEFAULT NULL,
  `mail_to` varchar(255) DEFAULT NULL,
  `mail_cc` varchar(255) DEFAULT NULL,
  `mail_bcc` varchar(255) DEFAULT NULL,
  `input_data` varchar(16384) NOT NULL,
  `letter` blob NOT NULL,
  `archive_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=318588 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lgx_letter`
--

DROP TABLE IF EXISTS `lgx_letter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lgx_letter` (
  `name` varchar(32) NOT NULL,
  `sequence` int(11) NOT NULL,
  `description` varchar(128) NOT NULL,
  `template` varchar(128) NOT NULL,
  `permission` varchar(32) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lgx_lot`
--

DROP TABLE IF EXISTS `lgx_lot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lgx_lot` (
  `lot_id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lot_mode` enum('automatic','manual') NOT NULL,
  `lot_user` varchar(32) NOT NULL,
  `lot_filename` varchar(256) NOT NULL,
  `lot_input` longtext NOT NULL,
  `lot_md5` varchar(128) NOT NULL,
  PRIMARY KEY (`lot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1248 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lgx_lot_detail`
--

DROP TABLE IF EXISTS `lgx_lot_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lgx_lot_detail` (
  `lot_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_detail_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lot_detail_email` varchar(128) NOT NULL,
  `lot_id` int(11) NOT NULL,
  `lot_item_input` mediumtext NOT NULL,
  `lot_archive_id` int(11) NOT NULL,
  `lot_detail_hostid` varchar(32) NOT NULL,
  `lot_item_status` enum('success','fail','warning') NOT NULL,
  `lot_item_status_msg` varchar(1024) NOT NULL,
  `lot_detail_letter` mediumtext NOT NULL,
  `lot_detail_lethtml` mediumtext NOT NULL,
  `lot_detail_campaign` varchar(128) NOT NULL,
  PRIMARY KEY (`lot_item_id`),
  KEY `lgx_lot_detail_email` (`lot_detail_email`)
) ENGINE=MyISAM AUTO_INCREMENT=2001 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lgx_lot_status`
--

DROP TABLE IF EXISTS `lgx_lot_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lgx_lot_status` (
  `lot_id` int(11) NOT NULL,
  `lot_status_signal` enum('green','red','yellow') NOT NULL,
  `lot_status_msg` varchar(4096) NOT NULL,
  `lot_status_count_good` int(11) NOT NULL,
  `lot_status_count_bad` int(11) NOT NULL,
  KEY `lot_id` (`lot_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lgx_sfdc`
--

DROP TABLE IF EXISTS `lgx_sfdc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lgx_sfdc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lgx_id` int(11) NOT NULL,
  `posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) DEFAULT '0',
  `postlog` varchar(8192) DEFAULT NULL,
  `sfdcdata` varchar(20000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lgx_id` (`lgx_id`)
) ENGINE=InnoDB AUTO_INCREMENT=148579 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_archive`
--

DROP TABLE IF EXISTS `license_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` varchar(32) NOT NULL,
  `actual_user` varchar(128) NOT NULL,
  `service` varchar(32) NOT NULL,
  `subservice` varchar(64) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `delivery_key` varchar(36) NOT NULL,
  `license` longblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `delivery_key` (`delivery_key`)
) ENGINE=MyISAM AUTO_INCREMENT=156012 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_purpose`
--

DROP TABLE IF EXISTS `license_purpose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_purpose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `details` varchar(1024) DEFAULT NULL,
  `internal` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `duration` varchar(64) DEFAULT NULL,
  `presets` varchar(80) DEFAULT NULL,
  `psl` tinyint(1) DEFAULT NULL,
  `ordered` tinyint(1) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `retired` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_tags`
--

DROP TABLE IF EXISTS `license_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_tags` (
  `user` varchar(16) NOT NULL,
  `tag` varchar(256) NOT NULL,
  PRIMARY KEY (`user`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `logtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ident` char(16) NOT NULL,
  `priority` int(11) NOT NULL,
  `message` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_id_seq`
--

DROP TABLE IF EXISTS `log_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_id_seq` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=572551 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lpfeats_allowed`
--

DROP TABLE IF EXISTS `lpfeats_allowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lpfeats_allowed` (
  `username` varchar(32) NOT NULL,
  `product` varchar(32) NOT NULL,
  UNIQUE KEY `username` (`username`,`product`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lpfeats_delivery`
--

DROP TABLE IF EXISTS `lpfeats_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lpfeats_delivery` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `product` varchar(32) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delivery` longtext,
  PRIMARY KEY (`seq`)
) ENGINE=MyISAM AUTO_INCREMENT=1091 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lpfeats_empname`
--

DROP TABLE IF EXISTS `lpfeats_empname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lpfeats_empname` (
  `username` varchar(32) NOT NULL,
  `empno` int(11) NOT NULL,
  `admin` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lpfeats_products`
--

DROP TABLE IF EXISTS `lpfeats_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lpfeats_products` (
  `product` varchar(32) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`product`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `revised` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `level` int(11) NOT NULL,
  `author` varchar(48) NOT NULL,
  `summary` varchar(80) NOT NULL,
  `article` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `perm_entries`
--

DROP TABLE IF EXISTS `perm_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perm_entries` (
  `permission` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  UNIQUE KEY `permission` (`permission`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `perm_users`
--

DROP TABLE IF EXISTS `perm_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perm_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(16) NOT NULL,
  `permission` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `predator_archive`
--

DROP TABLE IF EXISTS `predator_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `predator_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` varchar(32) NOT NULL,
  `license_archive_id` int(11) NOT NULL,
  `agreement` varchar(128) DEFAULT NULL,
  `installation` varchar(128) NOT NULL,
  `customer` varchar(128) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `es_date` date NOT NULL,
  `lictype` varchar(32) NOT NULL,
  `server_id` varchar(128) DEFAULT NULL,
  `target_id` varchar(128) DEFAULT NULL,
  `features` text NOT NULL,
  `email` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=323 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `server_status`
--

DROP TABLE IF EXISTS `server_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `server` varchar(128) DEFAULT NULL,
  `status` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5600762 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `simufact_archive`
--

DROP TABLE IF EXISTS `simufact_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simufact_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expiration` date NOT NULL,
  `hostid` varchar(32) NOT NULL,
  `sid` varchar(32) NOT NULL,
  `type` enum('network','nodelock') NOT NULL,
  `sequence` int(11) NOT NULL,
  `license` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sequence` (`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=2462 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `process` varchar(32) NOT NULL,
  `mode` enum('error','warning','info') NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `process` (`process`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timezone`
--

DROP TABLE IF EXISTS `timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timezone` (
  `zone_id` int(10) NOT NULL,
  `abbreviation` varchar(6) COLLATE utf8_bin NOT NULL,
  `time_start` int(11) NOT NULL,
  `gmt_offset` int(11) NOT NULL,
  `dst` char(1) COLLATE utf8_bin NOT NULL,
  KEY `idx_zone_id` (`zone_id`),
  KEY `idx_time_start` (`time_start`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trial_desc`
--

DROP TABLE IF EXISTS `trial_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trial_desc` (
  `template` varchar(33) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trial_templates`
--

DROP TABLE IF EXISTS `trial_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trial_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `template` varchar(33) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trial_type`
--

DROP TABLE IF EXISTS `trial_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trial_type` (
  `typename` varchar(32) DEFAULT NULL,
  `typesort` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trial_users`
--

DROP TABLE IF EXISTS `trial_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trial_users` (
  `username` varchar(20) DEFAULT NULL,
  `reference` varchar(33) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unsupported_features`
--

DROP TABLE IF EXISTS `unsupported_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unsupported_features` (
  `feature` varchar(48) NOT NULL,
  PRIMARY KEY (`feature`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone` (
  `zone_id` int(10) NOT NULL AUTO_INCREMENT,
  `country_code` char(2) COLLATE utf8_bin NOT NULL,
  `zone_name` varchar(35) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`zone_id`),
  KEY `idx_zone_name` (`zone_name`)
) ENGINE=MyISAM AUTO_INCREMENT=417 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-10  4:26:44
