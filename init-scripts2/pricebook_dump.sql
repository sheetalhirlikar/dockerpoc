-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: pricebook
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
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `features` (
  `featid` int(11) NOT NULL,
  `pbid` int(11) NOT NULL,
  `pid` varchar(24) NOT NULL,
  `feature` varchar(48) NOT NULL,
  `qualifier` varchar(48) DEFAULT NULL,
  `description` varchar(256) NOT NULL,
  `details` varchar(256) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(32) NOT NULL,
  PRIMARY KEY (`featid`,`pbid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `heading`
--

DROP TABLE IF EXISTS `heading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heading` (
  `headid` int(11) NOT NULL,
  `pbid` int(11) NOT NULL,
  `description` varchar(256) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `itemlist`
--

DROP TABLE IF EXISTS `itemlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemlist` (
  `pbid` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `itemtype` enum('feature','product','package','section') NOT NULL,
  `itemid` int(11) NOT NULL,
  KEY `setdefid` (`pbid`,`sequence`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lictype`
--

DROP TABLE IF EXISTS `lictype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lictype` (
  `lictypeid` int(11) NOT NULL AUTO_INCREMENT,
  `pbid` int(11) NOT NULL,
  `name` varchar(48) NOT NULL,
  `description` varchar(256) NOT NULL,
  `type` enum('nodelock','network','cnodelock') NOT NULL,
  UNIQUE KEY `setid` (`lictypeid`)
) ENGINE=MyISAM AUTO_INCREMENT=544 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notify`
--

DROP TABLE IF EXISTS `notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify` (
  `notify_id` int(11) NOT NULL AUTO_INCREMENT,
  `notify_pbid` int(11) NOT NULL,
  `notify_re` varchar(256) NOT NULL,
  `notify_mode` enum('bcc') NOT NULL DEFAULT 'bcc',
  `notify_destination` varchar(512) NOT NULL,
  PRIMARY KEY (`notify_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `packid` int(11) NOT NULL,
  `pbid` int(11) NOT NULL,
  `pkn` varchar(24) NOT NULL,
  `description` varchar(256) NOT NULL,
  `details` varchar(128) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(32) NOT NULL,
  PRIMARY KEY (`packid`,`pbid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pricebook`
--

DROP TABLE IF EXISTS `pricebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricebook` (
  `pbid` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(16) NOT NULL,
  `revision` varchar(11) NOT NULL,
  `description` varchar(128) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) NOT NULL,
  PRIMARY KEY (`pbid`)
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `prodid` int(11) NOT NULL,
  `pbid` int(11) NOT NULL,
  `pfn` varchar(24) NOT NULL,
  `description` varchar(256) NOT NULL,
  `groupdef` varchar(32) DEFAULT NULL,
  `mode` varchar(128) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(32) NOT NULL,
  PRIMARY KEY (`prodid`,`pbid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `sectid` int(11) NOT NULL,
  `pbid` int(11) NOT NULL,
  `skn` int(11) NOT NULL,
  `description` varchar(80) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) NOT NULL,
  PRIMARY KEY (`sectid`,`pbid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `source`
--

DROP TABLE IF EXISTS `source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source` (
  `pbid` int(11) NOT NULL,
  `llist` longblob NOT NULL,
  `pbtext` longblob NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(32) NOT NULL,
  UNIQUE KEY `pbid` (`pbid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
