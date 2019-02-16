-- MySQL dump 10.13  Distrib 5.7.23, for osx10.13 (x86_64)
--
-- Host: localhost    Database: gyoza_development
-- ------------------------------------------------------
-- Server version	5.7.23

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2019-02-09 03:50:00','2019-02-09 03:50:00');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendances` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `in_time` datetime DEFAULT NULL,
  `out_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
INSERT INTO `attendances` VALUES (20,3,'2019-02-09 16:26:12','2019-02-09 16:29:22','2019-02-09 07:26:12','2019-02-09 07:29:22'),(21,3,'2019-02-09 16:30:31','2019-02-09 16:30:32','2019-02-09 07:30:31','2019-02-09 07:30:32'),(22,3,'2019-02-09 16:30:32','2019-02-09 16:30:33','2019-02-09 07:30:32','2019-02-09 07:30:33'),(23,3,'2019-02-09 16:30:34','2019-02-09 16:30:47','2019-02-09 07:30:34','2019-02-09 07:30:47'),(24,4,'2019-02-09 16:31:49','2019-02-09 16:31:50','2019-02-09 07:31:49','2019-02-09 07:31:50'),(25,4,'2019-02-09 16:31:51','2019-02-09 16:43:17','2019-02-09 07:31:51','2019-02-09 07:43:17'),(26,4,'2019-02-09 16:43:18','2019-02-09 21:43:43','2019-02-09 07:43:18','2019-02-09 12:43:43'),(27,5,'2019-02-09 21:44:43','2019-02-09 21:45:46','2019-02-09 12:44:43','2019-02-09 12:45:46'),(28,6,'2019-02-10 10:30:58','2019-02-10 12:31:04','2019-02-10 01:30:58','2019-02-10 03:31:04'),(29,7,'2019-02-10 10:39:50','2019-02-10 13:31:48','2019-02-10 01:39:50','2019-02-10 04:31:48'),(30,5,'2019-02-10 12:44:21',NULL,'2019-02-10 03:44:21','2019-02-10 03:44:21'),(31,2,'2019-02-10 13:32:23','2019-02-10 17:09:38','2019-02-10 04:32:23','2019-02-10 08:09:38'),(32,3,'2019-02-15 16:30:34','2019-02-15 18:30:47','2019-02-09 07:30:34','2019-02-09 07:30:47'),(33,3,'2019-02-17 16:30:34','2019-02-17 18:30:47','2019-02-09 07:30:34','2019-02-09 07:30:47'),(34,3,'2019-03-17 16:30:34','2019-03-17 18:30:47','2019-02-09 07:30:34','2019-02-09 07:30:47'),(35,2,'2019-02-10 17:09:40','2019-02-11 10:11:18','2019-02-10 08:09:40','2019-02-11 01:11:18'),(36,8,'2019-02-10 17:11:26',NULL,'2019-02-10 08:11:26','2019-02-10 08:11:26'),(37,2,'2019-02-11 10:11:20','2019-02-12 18:59:22','2019-02-11 01:11:20','2019-02-12 09:59:22'),(38,9,'2019-02-11 10:45:37','2019-02-11 10:45:39','2019-02-11 01:45:37','2019-02-11 01:45:39'),(39,9,'2019-02-11 10:46:35',NULL,'2019-02-11 01:46:35','2019-02-11 01:46:35'),(40,5,'2019-02-01 21:44:43','2019-02-01 23:45:46','2019-02-09 12:44:43','2019-02-09 12:45:46'),(41,5,'2019-03-01 21:44:43','2019-03-01 23:45:46','2019-02-09 12:44:43','2019-02-09 12:45:46'),(42,5,'2019-02-28 21:44:43','2019-02-28 23:45:46','2019-02-09 12:44:43','2019-02-09 12:45:46'),(43,10,'2019-02-12 13:12:50','2019-02-12 13:22:19','2019-02-12 04:12:50','2019-02-12 04:22:19'),(44,10,'2019-02-12 13:22:22','2019-02-12 14:07:07','2019-02-12 04:22:22','2019-02-12 05:07:07'),(45,10,'2019-02-12 14:07:08',NULL,'2019-02-12 05:07:08','2019-02-12 05:07:08'),(46,2,'2019-02-12 18:59:23',NULL,'2019-02-12 09:59:23','2019-02-12 09:59:23');
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `earnings`
--

DROP TABLE IF EXISTS `earnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `earnings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `revenue` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `location` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `earnings`
--

LOCK TABLES `earnings` WRITE;
/*!40000 ALTER TABLE `earnings` DISABLE KEYS */;
INSERT INTO `earnings` VALUES (1,4,'2019-02-09',2900,'2019-02-09 12:31:33','2019-02-09 12:31:33','東京','',0,0),(2,4,'2019-02-09',1000,'2019-02-09 12:43:35','2019-02-09 12:43:35','東京','',0,0),(3,5,'2019-02-04',10000,'2019-02-09 12:44:50','2019-02-09 12:44:50','東京','',0,0),(4,5,'2019-02-09',111,'2019-02-09 12:46:15','2019-02-09 12:46:15','東京','',0,0),(5,5,'2019-02-09',-2,'2019-02-09 12:55:52','2019-02-09 12:55:52','東京','',0,0),(6,5,'2019-02-09',-3,'2019-02-09 12:56:59','2019-02-09 12:56:59','東京','',0,0),(7,6,'2019-02-10',30000,'2019-02-10 01:31:10','2019-02-10 01:31:10','品川','',0,0),(8,7,'2019-02-10',1000,'2019-02-10 02:20:52','2019-02-10 02:20:52','品川','',0,0),(9,5,'2019-02-14',10000,'2019-02-10 03:44:15','2019-02-10 03:44:15','品川','',0,0),(10,5,'2019-02-15',5000,'2019-02-10 03:44:18','2019-02-10 03:44:18','品川','',0,0),(11,2,'2019-02-10',4,'2019-02-10 04:54:59','2019-02-10 04:54:59','品川','',0,0),(12,2,'2019-02-10',2000,'2019-02-10 05:07:42','2019-02-10 05:07:42','新宿','',0,0),(13,2,'2019-02-10',3000,'2019-02-10 05:08:15','2019-02-10 05:08:15','新宿','',0,0),(14,5,'2019-03-15',5000,'2019-02-10 03:44:18','2019-02-10 03:44:18','品川','',0,0),(15,5,'2019-03-16',5000,'2019-02-10 03:44:18','2019-02-10 03:44:18','品川','',0,0),(16,2,'2019-02-10',9800,'2019-02-10 08:09:54','2019-02-10 08:09:54','新宿','',0,0),(17,8,'2019-02-10',5000,'2019-02-10 08:11:37','2019-02-10 08:11:37','池袋','',0,0),(18,9,'2019-02-11',11000,'2019-02-11 01:46:20','2019-02-11 01:46:20','新宿','',0,0),(19,9,'2019-02-11',100,'2019-02-11 01:47:49','2019-02-11 01:47:49','新宿','',0,0),(20,5,'2019-03-01',5000,'2019-02-10 03:44:18','2019-02-10 03:44:18','品川','',0,0),(21,5,'2019-02-01',5000,'2019-02-10 03:44:18','2019-02-10 03:44:18','品川','',0,0),(22,5,'2019-02-28',5000,'2019-02-10 03:44:18','2019-02-10 03:44:18','品川','',0,0),(23,10,'2019-02-12',10000,'2019-02-12 05:14:35','2019-02-12 05:14:35','新宿','',0,0),(24,10,'2019-02-12',5000,'2019-02-12 05:14:41','2019-02-12 05:14:41','池袋','',0,0);
/*!40000 ALTER TABLE `earnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20190209025713'),('20190209032607'),('20190209032924'),('20190209033521'),('20190210050449'),('20190212100930');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'ky0ya38365388@gmail.com','$2a$11$h8K4oRPoTBIJScXQKM8Gbu3x.mi1g7q1y4MassF37bA/U925MIW9.',NULL,NULL,NULL,'2019-02-09 06:17:20','2019-02-09 06:17:20',1,'安生恭也'),(3,'a@gmail.com','$2a$11$dCulZ8zhyFfF98YGmBkq3etcDDt6hctAU.W9DZny7pKL/78QNXxUW',NULL,NULL,NULL,'2019-02-09 06:26:05','2019-02-09 06:26:05',0,'飯田 大輔'),(4,'b@gmail.com','$2a$11$zBmz.fYGrcYhUjw/r4nUu.0G4oyLfAuFba50BeZyKsRrp0TUrLtfO',NULL,NULL,NULL,'2019-02-09 07:31:42','2019-02-09 07:31:42',0,'小島翔太'),(5,'c@gmail.com','$2a$11$yPBYvxqwV9WDG8Z1fJVX8uEpEZgNsKZATPOV8m4ae9fPC2ewYD4bS',NULL,NULL,NULL,'2019-02-09 12:44:39','2019-02-09 12:44:39',0,'黒木未来'),(6,'d@gmail.com','$2a$11$Ih/.0deHtq/4fNSpz8DHTeaJM1rgTlQwABJUPgAx0yLCtCRZfQKk2',NULL,NULL,NULL,'2019-02-10 01:21:03','2019-02-10 03:43:57',0,'杉田彩花'),(7,'e@gmail.com','$2a$11$/ivQWSvFYy0flPb9cR3tqOZS.aEUkipqhmQN9DSmdi8RAb7HaMCnC',NULL,NULL,NULL,'2019-02-10 01:39:31','2019-02-10 01:39:31',0,'永野拓海'),(8,'f@gmail.com','$2a$11$kLaZYQb2EPcqMIXP6zaGP.HtiaukZZyDBbrZNPLzua0q8xUPSViQO',NULL,NULL,NULL,'2019-02-10 08:11:23','2019-02-10 08:11:23',0,'山中武'),(9,'g@fmail.com','$2a$11$a2mhzCa4Rcuw2JPcb.qG1O7oILw6cFTklNLoEk/bOSk/2Cb4zDlBC',NULL,NULL,NULL,'2019-02-11 01:45:29','2019-02-11 01:45:29',0,'ggggg'),(10,'h@gmail.com','$2a$11$lMD3tlhjpcMeYGinuuPS2ezOpScJEdX1HoXVu1biX.LMkBbeTkK/q',NULL,NULL,NULL,'2019-02-12 04:04:21','2019-02-12 04:04:21',0,'hhhhhhh');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-12 19:24:12
