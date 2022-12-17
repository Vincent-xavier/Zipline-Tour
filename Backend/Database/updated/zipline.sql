-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 192.168.1.7    Database: zipline
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `tbl_eventbooking`
--

DROP TABLE IF EXISTS `tbl_eventbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_eventbooking` (
  `BookingId` int NOT NULL AUTO_INCREMENT,
  `UserId` int DEFAULT NULL,
  `EventId` int DEFAULT NULL,
  `ScheduleId` int DEFAULT NULL,
  `DateId` int DEFAULT NULL,
  `SlotId` int DEFAULT NULL,
  `Guests` int DEFAULT NULL,
  `TotalPrice` decimal(18,2) DEFAULT NULL,
  `EventTime` varchar(15) DEFAULT NULL,
  `EventDate` date DEFAULT NULL,
  `PaymentStatus` int DEFAULT '0',
  `BookingDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BookingId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventbooking`
--

LOCK TABLES `tbl_eventbooking` WRITE;
/*!40000 ALTER TABLE `tbl_eventbooking` DISABLE KEYS */;
INSERT INTO `tbl_eventbooking` VALUES (1,3,10,22,249,347,1,20.00,'10:01 AM','2022-12-16',0,'2022-12-15 18:01:55'),(2,4,10,22,249,347,6,120.00,'03:35 PM','2022-12-16',1,'2022-12-15 18:01:55'),(3,5,11,23,257,355,4,60.00,'09:00 AM','2022-12-17',1,'2022-12-15 18:13:42'),(4,6,10,22,249,347,1,20.00,'08:15 AM','2022-12-16',1,'2022-12-15 18:22:02'),(5,7,10,22,250,348,3,60.00,'08:15 AM','2022-12-17',0,'2022-12-17 10:37:24'),(6,8,10,22,250,348,3,60.00,'08:15 AM','2022-12-17',1,'2022-12-17 10:41:19'),(7,9,10,22,251,349,3,60.00,'08:15 AM','2022-12-18',0,'2022-12-17 11:49:06');
/*!40000 ALTER TABLE `tbl_eventbooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_events`
--

DROP TABLE IF EXISTS `tbl_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_events` (
  `EventId` int NOT NULL AUTO_INCREMENT,
  `EventName` varchar(150) NOT NULL,
  `EventDiscription` longtext,
  `Price` decimal(18,2) NOT NULL,
  `EventCapacity` int DEFAULT NULL,
  `Min_Booking` int DEFAULT NULL,
  `Max_Booking` int DEFAULT NULL,
  `EventImage` varchar(255) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `IsActive` bit(1) DEFAULT b'0',
  PRIMARY KEY (`EventId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_events`
--

LOCK TABLES `tbl_events` WRITE;
/*!40000 ALTER TABLE `tbl_events` DISABLE KEYS */;
INSERT INTO `tbl_events` VALUES (1,'Zipline','This one-of-a-kind overnight Treehouse stay includes a set of eco tours with fourteen ziplines, two spiral staircases, eight sky bridges, and a rappel back down to the forest floor.',40.00,25,1,5,'event-img220718196.jpg',_binary '\0',_binary '\0'),(2,'Don\'t look back','Enjoy ur ride but please don\'t look down  until you finish the game',60.00,15,1,3,'Zip_line-2220837277.jpg',_binary '\0',_binary '\0'),(3,'Zambezi River','Ziplining over the Zambezi River is available year-round so there really is no excuse not to give it a go!',65.00,20,1,6,'Zip_line-3220145236.jpg',_binary '\0',_binary '\0'),(5,'Flying Baba Adventure','Enjoy one of the longest zipline of India, 930 meters long zipline over with flyingbaba,enjoy the scenic view of the sahyadri mountains',50.00,22,1,4,'Zip_line-4222949966.jpg',_binary '\0',_binary '\0'),(6,'Swing into the Semester Zipline Event','The Carolina Adventures Challenge Course invites you to swing your way into the new semester with us! Soar through the sky on our Giant Swing, and take an exhilarating ride down our 1,200 ft. Tandem Zipline!',35.00,12,2,2,'Zipline_5225904433.jfif',_binary '\0',_binary '\0'),(10,'The Unreal Zip','2,000 meters/ 6,561 feet, or 1.25 miles',20.00,25,1,3,'zipline_6222747943.jfif',_binary '\0',_binary '\0'),(11,'Zip World Velocity 2','Penrhyn Slate Quarry, located near Bethesda in North Wales, is home to Zip World Velocity 2, the fastest zip line in the world and the longest in Europe.',15.00,30,1,4,'zipline_10224318798.jfif',_binary '\0',_binary '\0'),(12,'Bosoco soft zipline','Yelagiri',25.00,25,1,5,'Zip_line-3222921292.jpg',_binary '\0',_binary '\0'),(13,'Bosoco soft Zipper','Yelagiri Javadhu Hills',100.00,25,5,25,'Zipline_5223021564.jfif',_binary '\0',_binary '\0'),(14,'Jaguar Cave Zip Line','A zip-line, zip line, zip-wire, flying fox, or death slide is a pulley suspended on a cable, usually made of stainless steel, mounted on a slope.',50.00,50,1,5,'zipline_17220404727.jfif',_binary '\0',_binary '\0'),(15,'Dragon\'s Breath Flight Line','Spanning a total length of 330 feet and a height of 70 feet, a rider can fly at an approx. speed of 50 km while enjoying the breathtaking scenery of forests, snowy mountains, and meadows.',45.00,30,2,6,'zipline-mu221328508.jpg',_binary '\0',_binary '\0'),(16,'Skyline Zipline','Penrhyn Slate Quarry, located near Bethesda in North Wales, is home to Skyline Zipline, the fastest zip line in the world and the longest in Europe.',25.00,15,2,6,'zipline_47225354181.jfif',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `tbl_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_eventschedule`
--

DROP TABLE IF EXISTS `tbl_eventschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_eventschedule` (
  `ScheduleId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `DateFrom` date DEFAULT NULL,
  `DateTo` date DEFAULT NULL,
  `Times` varchar(255) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `EventId` int DEFAULT NULL,
  PRIMARY KEY (`ScheduleId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventschedule`
--

LOCK TABLES `tbl_eventschedule` WRITE;
/*!40000 ALTER TABLE `tbl_eventschedule` DISABLE KEYS */;
INSERT INTO `tbl_eventschedule` VALUES (1,'Zipline test','2022-11-11','2022-11-15','05:00 AM,11:19 AM,01:23 AM',_binary '\0',1),(2,'Zipline_test','2022-11-12','2022-11-16','10:00 AM,05:00 PM',_binary '\0',2),(3,'Zipline','2022-11-11','2022-11-16','11:00 AM',_binary '\0',3),(4,'zipline','2022-11-16','2022-11-18','08:50 AM,05:10 PM',_binary '\0',5),(5,'Daily','2022-11-17','2022-11-22','10:00 AM',_binary '\0',3),(6,'Evening Only','2022-11-17','2022-11-20','03:00 PM',_binary '\0',2),(7,'Special Event','2022-11-21','2022-11-29','11:10 AM,05:40 PM',_binary '\0',6),(8,'Reschedule','2022-11-21','2022-11-29','01:00 PM,07:14 AM',_binary '\0',5),(9,'Reschedule','2022-11-21','2022-11-29','08:00 AM',_binary '\0',3),(10,'Every Morning','2022-11-21','2022-11-29','09:15 AM',_binary '\0',2),(12,'New Schedule','2022-11-29','2022-12-14','10:20 AM,08:00 PM',_binary '\0',1),(13,'New Event','2022-11-29','2022-12-14','09:30 AM,07:40 PM',_binary '\0',10),(14,'Evening Event','2022-11-30','2022-12-14','05:00 PM',_binary '\0',11),(15,'Four Days only','2022-11-30','2022-12-14','03:15 PM',_binary '\0',5),(16,'Special Event','2022-11-30','2022-12-14','12:35 PM',_binary '\0',2),(17,'New Schedule','2022-11-30','2022-12-14','02:00 PM',_binary '\0',6),(18,'Bosoco','2022-12-07','2022-12-13','03:31 PM',_binary '\0',13),(19,'Board','2022-12-07','2022-12-14','10:00 AM',_binary '\0',14),(20,'Special Event','2022-12-15','2022-12-20','02:30 PM',_binary '\0',15),(21,'New Event ','2022-12-08','2022-12-14','04:00 PM',_binary '\0',16),(22,'Special Event','2022-12-13','2022-12-19','08:15 AM',_binary '\0',10),(23,'Special Event','2022-12-13','2022-12-19','09:00 AM',_binary '\0',11),(24,'Stephen','2022-12-14','2022-12-20','11:25 AM',_binary '\0',1);
/*!40000 ALTER TABLE `tbl_eventschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_eventscheduledates`
--

DROP TABLE IF EXISTS `tbl_eventscheduledates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_eventscheduledates` (
  `DateId` int NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `EventId` int DEFAULT NULL,
  `ScheduleId` bigint DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`DateId`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventscheduledates`
--

LOCK TABLES `tbl_eventscheduledates` WRITE;
/*!40000 ALTER TABLE `tbl_eventscheduledates` DISABLE KEYS */;
INSERT INTO `tbl_eventscheduledates` VALUES (13,'2022-11-16',5,4,_binary '\0'),(14,'2022-11-17',5,4,_binary '\0'),(15,'2022-11-18',5,4,_binary '\0'),(16,'2022-11-17',3,5,_binary '\0'),(17,'2022-11-18',3,5,_binary '\0'),(18,'2022-11-19',3,5,_binary '\0'),(19,'2022-11-20',3,5,_binary '\0'),(20,'2022-11-21',3,5,_binary '\0'),(21,'2022-11-22',3,5,_binary '\0'),(22,'2022-11-17',2,6,_binary '\0'),(23,'2022-11-18',2,6,_binary '\0'),(24,'2022-11-19',2,6,_binary '\0'),(25,'2022-11-20',2,6,_binary '\0'),(26,'2022-11-21',6,7,_binary '\0'),(27,'2022-11-22',6,7,_binary '\0'),(28,'2022-11-23',6,7,_binary '\0'),(29,'2022-11-24',6,7,_binary '\0'),(30,'2022-11-25',6,7,_binary '\0'),(31,'2022-11-26',6,7,_binary '\0'),(32,'2022-11-27',6,7,_binary '\0'),(33,'2022-11-28',6,7,_binary '\0'),(34,'2022-11-29',6,7,_binary '\0'),(35,'2022-11-21',5,8,_binary '\0'),(36,'2022-11-22',5,8,_binary '\0'),(37,'2022-11-23',5,8,_binary '\0'),(38,'2022-11-24',5,8,_binary '\0'),(39,'2022-11-25',5,8,_binary '\0'),(40,'2022-11-26',5,8,_binary '\0'),(41,'2022-11-27',5,8,_binary '\0'),(42,'2022-11-28',5,8,_binary '\0'),(43,'2022-11-29',5,8,_binary '\0'),(44,'2022-11-21',3,9,_binary '\0'),(45,'2022-11-22',3,9,_binary '\0'),(46,'2022-11-23',3,9,_binary '\0'),(47,'2022-11-24',3,9,_binary '\0'),(48,'2022-11-25',3,9,_binary '\0'),(49,'2022-11-26',3,9,_binary '\0'),(50,'2022-11-27',3,9,_binary '\0'),(51,'2022-11-28',3,9,_binary '\0'),(52,'2022-11-29',3,9,_binary '\0'),(53,'2022-11-21',2,10,_binary '\0'),(54,'2022-11-22',2,10,_binary '\0'),(55,'2022-11-23',2,10,_binary '\0'),(56,'2022-11-24',2,10,_binary '\0'),(57,'2022-11-25',2,10,_binary '\0'),(58,'2022-11-26',2,10,_binary '\0'),(59,'2022-11-27',2,10,_binary '\0'),(60,'2022-11-28',2,10,_binary '\0'),(61,'2022-11-29',2,10,_binary '\0'),(78,'2022-11-29',1,12,_binary '\0'),(79,'2022-11-30',1,12,_binary '\0'),(80,'2022-12-01',1,12,_binary '\0'),(81,'2022-12-02',1,12,_binary '\0'),(82,'2022-12-03',1,12,_binary '\0'),(83,'2022-12-04',1,12,_binary '\0'),(84,'2022-12-05',1,12,_binary '\0'),(85,'2022-12-06',1,12,_binary '\0'),(86,'2022-12-07',1,12,_binary '\0'),(87,'2022-12-08',1,12,_binary '\0'),(88,'2022-12-09',1,12,_binary '\0'),(89,'2022-12-10',1,12,_binary '\0'),(90,'2022-12-11',1,12,_binary '\0'),(91,'2022-12-12',1,12,_binary '\0'),(92,'2022-12-13',1,12,_binary '\0'),(93,'2022-12-14',1,12,_binary '\0'),(94,'2022-11-29',10,13,_binary '\0'),(95,'2022-11-30',10,13,_binary '\0'),(96,'2022-12-01',10,13,_binary '\0'),(97,'2022-12-02',10,13,_binary '\0'),(98,'2022-12-03',10,13,_binary '\0'),(99,'2022-12-04',10,13,_binary '\0'),(100,'2022-12-05',10,13,_binary '\0'),(101,'2022-12-06',10,13,_binary '\0'),(102,'2022-12-07',10,13,_binary '\0'),(103,'2022-12-08',10,13,_binary '\0'),(104,'2022-12-09',10,13,_binary '\0'),(105,'2022-12-10',10,13,_binary '\0'),(106,'2022-12-11',10,13,_binary '\0'),(107,'2022-12-12',10,13,_binary '\0'),(108,'2022-12-13',10,13,_binary '\0'),(109,'2022-12-14',10,13,_binary '\0'),(110,'2022-11-30',11,14,_binary '\0'),(111,'2022-12-01',11,14,_binary '\0'),(112,'2022-12-02',11,14,_binary '\0'),(113,'2022-12-03',11,14,_binary '\0'),(114,'2022-12-04',11,14,_binary '\0'),(115,'2022-12-05',11,14,_binary '\0'),(116,'2022-12-06',11,14,_binary '\0'),(117,'2022-12-07',11,14,_binary '\0'),(119,'2022-12-09',11,14,_binary '\0'),(120,'2022-12-10',11,14,_binary '\0'),(121,'2022-12-11',11,14,_binary '\0'),(122,'2022-12-12',11,14,_binary '\0'),(123,'2022-12-13',11,14,_binary '\0'),(124,'2022-12-14',11,14,_binary '\0'),(125,'2022-11-30',5,15,_binary '\0'),(126,'2022-12-01',5,15,_binary '\0'),(127,'2022-12-02',5,15,_binary '\0'),(128,'2022-12-03',5,15,_binary '\0'),(129,'2022-12-04',5,15,_binary '\0'),(130,'2022-12-05',5,15,_binary '\0'),(131,'2022-12-06',5,15,_binary '\0'),(132,'2022-12-07',5,15,_binary '\0'),(133,'2022-12-08',5,15,_binary '\0'),(134,'2022-12-09',5,15,_binary '\0'),(135,'2022-12-10',5,15,_binary '\0'),(136,'2022-12-11',5,15,_binary '\0'),(137,'2022-12-12',5,15,_binary '\0'),(138,'2022-12-13',5,15,_binary '\0'),(139,'2022-12-14',5,15,_binary '\0'),(140,'2022-11-30',2,16,_binary '\0'),(141,'2022-12-01',2,16,_binary '\0'),(142,'2022-12-02',2,16,_binary '\0'),(143,'2022-12-03',2,16,_binary '\0'),(144,'2022-12-04',2,16,_binary '\0'),(145,'2022-12-05',2,16,_binary '\0'),(146,'2022-12-06',2,16,_binary '\0'),(147,'2022-12-07',2,16,_binary '\0'),(148,'2022-12-08',2,16,_binary '\0'),(149,'2022-12-09',2,16,_binary '\0'),(150,'2022-12-10',2,16,_binary '\0'),(151,'2022-12-11',2,16,_binary '\0'),(152,'2022-12-12',2,16,_binary '\0'),(153,'2022-12-13',2,16,_binary '\0'),(154,'2022-12-14',2,16,_binary '\0'),(155,'2022-11-30',6,17,_binary '\0'),(156,'2022-12-01',6,17,_binary '\0'),(157,'2022-12-02',6,17,_binary '\0'),(158,'2022-12-03',6,17,_binary '\0'),(159,'2022-12-04',6,17,_binary '\0'),(160,'2022-12-05',6,17,_binary '\0'),(161,'2022-12-06',6,17,_binary '\0'),(162,'2022-12-07',6,17,_binary '\0'),(163,'2022-12-08',6,17,_binary '\0'),(164,'2022-12-09',6,17,_binary '\0'),(165,'2022-12-10',6,17,_binary '\0'),(166,'2022-12-11',6,17,_binary '\0'),(167,'2022-12-12',6,17,_binary '\0'),(168,'2022-12-13',6,17,_binary '\0'),(169,'2022-12-14',6,17,_binary '\0'),(170,'2022-12-08',11,14,_binary '\0'),(182,'2022-12-07',14,19,_binary '\0'),(183,'2022-12-08',14,19,_binary '\0'),(184,'2022-12-09',14,19,_binary '\0'),(185,'2022-12-10',14,19,_binary '\0'),(186,'2022-12-11',14,19,_binary '\0'),(187,'2022-12-12',14,19,_binary '\0'),(188,'2022-12-13',14,19,_binary '\0'),(189,'2022-12-14',14,19,_binary '\0'),(197,'2022-11-12',2,2,_binary '\0'),(198,'2022-11-13',2,2,_binary '\0'),(199,'2022-11-14',2,2,_binary '\0'),(200,'2022-11-15',2,2,_binary '\0'),(201,'2022-11-16',2,2,_binary '\0'),(207,'2022-11-16',3,3,_binary '\0'),(232,'2022-12-08',16,21,_binary '\0'),(233,'2022-12-09',16,21,_binary '\0'),(234,'2022-12-10',16,21,_binary '\0'),(235,'2022-12-11',16,21,_binary '\0'),(236,'2022-12-12',16,21,_binary '\0'),(237,'2022-12-13',16,21,_binary '\0'),(238,'2022-12-14',16,21,_binary '\0'),(239,'2022-12-07',13,18,_binary '\0'),(240,'2022-12-08',13,18,_binary '\0'),(241,'2022-12-09',13,18,_binary '\0'),(242,'2022-12-10',13,18,_binary '\0'),(243,'2022-12-11',13,18,_binary '\0'),(244,'2022-12-12',13,18,_binary '\0'),(245,'2022-12-13',13,18,_binary '\0'),(246,'2022-12-13',10,22,_binary '\0'),(247,'2022-12-14',10,22,_binary '\0'),(248,'2022-12-15',10,22,_binary '\0'),(249,'2022-12-16',10,22,_binary '\0'),(250,'2022-12-17',10,22,_binary '\0'),(251,'2022-12-18',10,22,_binary '\0'),(252,'2022-12-19',10,22,_binary '\0'),(253,'2022-12-13',11,23,_binary '\0'),(254,'2022-12-14',11,23,_binary '\0'),(255,'2022-12-15',11,23,_binary '\0'),(256,'2022-12-16',11,23,_binary '\0'),(257,'2022-12-17',11,23,_binary '\0'),(258,'2022-12-18',11,23,_binary '\0'),(259,'2022-12-19',11,23,_binary '\0'),(260,'2022-11-11',1,1,_binary '\0'),(261,'2022-11-12',1,1,_binary '\0'),(262,'2022-11-13',1,1,_binary '\0'),(263,'2022-11-14',1,1,_binary '\0'),(264,'2022-11-15',1,1,_binary '\0'),(302,'2022-12-15',15,20,_binary '\0'),(303,'2022-12-16',15,20,_binary '\0'),(304,'2022-12-17',15,20,_binary '\0'),(305,'2022-12-18',15,20,_binary '\0'),(306,'2022-12-19',15,20,_binary '\0'),(307,'2022-12-20',15,20,_binary '\0'),(308,'2022-12-14',1,24,_binary '\0'),(309,'2022-12-15',1,24,_binary '\0'),(310,'2022-12-16',1,24,_binary '\0'),(311,'2022-12-17',1,24,_binary '\0'),(312,'2022-12-18',1,24,_binary '\0'),(313,'2022-12-19',1,24,_binary '\0'),(314,'2022-12-20',1,24,_binary '\0');
/*!40000 ALTER TABLE `tbl_eventscheduledates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_eventscheduletimeslots`
--

DROP TABLE IF EXISTS `tbl_eventscheduletimeslots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_eventscheduletimeslots` (
  `SlotId` int NOT NULL AUTO_INCREMENT,
  `Time` varchar(15) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `EventId` int DEFAULT NULL,
  `ScheduleId` int DEFAULT NULL,
  `DateId` int DEFAULT NULL,
  `EventCapacity` int DEFAULT '30',
  PRIMARY KEY (`SlotId`)
) ENGINE=InnoDB AUTO_INCREMENT=438 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventscheduletimeslots`
--

LOCK TABLES `tbl_eventscheduletimeslots` WRITE;
/*!40000 ALTER TABLE `tbl_eventscheduletimeslots` DISABLE KEYS */;
INSERT INTO `tbl_eventscheduletimeslots` VALUES (25,'11:00 AM',_binary '\0',3,3,9,20),(26,'01:00 PM',_binary '\0',3,3,9,20),(27,'04:00 PM',_binary '\0',3,3,9,20),(28,'11:00 AM',_binary '\0',3,3,10,20),(29,'01:00 PM',_binary '\0',3,3,10,20),(30,'04:00 PM',_binary '\0',3,3,10,20),(31,'11:00 AM',_binary '\0',3,3,11,20),(32,'01:00 PM',_binary '\0',3,3,11,20),(33,'04:00 PM',_binary '\0',3,3,11,20),(34,'11:00 AM',_binary '\0',3,3,12,20),(35,'01:00 PM',_binary '\0',3,3,12,20),(36,'04:00 PM',_binary '\0',3,3,12,20),(37,'08:50 AM',_binary '\0',5,4,13,22),(38,'05:10 PM',_binary '\0',5,4,13,22),(39,'08:50 AM',_binary '\0',5,4,14,22),(40,'05:10 PM',_binary '\0',5,4,14,22),(41,'08:50 AM',_binary '\0',5,4,15,22),(42,'05:10 PM',_binary '\0',5,4,15,22),(43,'10:00 AM',_binary '\0',3,5,16,20),(44,'10:00 AM',_binary '\0',3,5,17,20),(45,'10:00 AM',_binary '\0',3,5,18,20),(46,'10:00 AM',_binary '\0',3,5,19,20),(47,'10:00 AM',_binary '\0',3,5,20,20),(48,'10:00 AM',_binary '\0',3,5,21,20),(49,'03:00 PM',_binary '\0',2,6,22,15),(50,'03:00 PM',_binary '\0',2,6,23,15),(51,'03:00 PM',_binary '\0',2,6,24,15),(52,'03:00 PM',_binary '\0',2,6,25,15),(53,'11:10 AM',_binary '\0',6,7,26,12),(54,'05:40 PM',_binary '\0',6,7,26,12),(55,'11:10 AM',_binary '\0',6,7,27,12),(56,'05:40 PM',_binary '\0',6,7,27,12),(57,'11:10 AM',_binary '\0',6,7,28,12),(58,'05:40 PM',_binary '\0',6,7,28,12),(59,'11:10 AM',_binary '\0',6,7,29,12),(60,'05:40 PM',_binary '\0',6,7,29,12),(61,'11:10 AM',_binary '\0',6,7,30,12),(62,'05:40 PM',_binary '\0',6,7,30,12),(63,'11:10 AM',_binary '\0',6,7,31,12),(64,'05:40 PM',_binary '\0',6,7,31,12),(65,'11:10 AM',_binary '\0',6,7,32,12),(66,'05:40 PM',_binary '\0',6,7,32,12),(67,'11:10 AM',_binary '\0',6,7,33,12),(68,'05:40 PM',_binary '\0',6,7,33,12),(69,'11:10 AM',_binary '\0',6,7,34,12),(70,'05:40 PM',_binary '\0',6,7,34,12),(71,'01:00 PM',_binary '\0',5,8,35,22),(72,'07:14 AM',_binary '\0',5,8,35,22),(73,'01:00 PM',_binary '\0',5,8,36,22),(74,'07:14 AM',_binary '\0',5,8,36,22),(75,'01:00 PM',_binary '\0',5,8,37,22),(76,'07:14 AM',_binary '\0',5,8,37,22),(77,'01:00 PM',_binary '\0',5,8,38,22),(78,'07:14 AM',_binary '\0',5,8,38,22),(79,'01:00 PM',_binary '\0',5,8,39,22),(80,'07:14 AM',_binary '\0',5,8,39,22),(81,'01:00 PM',_binary '\0',5,8,40,22),(82,'07:14 AM',_binary '\0',5,8,40,22),(83,'01:00 PM',_binary '\0',5,8,41,22),(84,'07:14 AM',_binary '\0',5,8,41,22),(85,'01:00 PM',_binary '\0',5,8,42,22),(86,'07:14 AM',_binary '\0',5,8,42,22),(87,'01:00 PM',_binary '\0',5,8,43,22),(88,'07:14 AM',_binary '\0',5,8,43,22),(89,'08:00 AM',_binary '\0',3,9,44,20),(90,'08:00 AM',_binary '\0',3,9,45,20),(91,'08:00 AM',_binary '\0',3,9,46,20),(92,'08:00 AM',_binary '\0',3,9,47,20),(93,'08:00 AM',_binary '\0',3,9,48,20),(94,'08:00 AM',_binary '\0',3,9,49,20),(95,'08:00 AM',_binary '\0',3,9,50,20),(96,'08:00 AM',_binary '\0',3,9,51,20),(97,'08:00 AM',_binary '\0',3,9,52,20),(98,'09:15 AM',_binary '\0',2,10,53,15),(99,'09:15 AM',_binary '\0',2,10,54,15),(100,'09:15 AM',_binary '\0',2,10,55,15),(101,'09:15 AM',_binary '\0',2,10,56,15),(102,'09:15 AM',_binary '\0',2,10,57,15),(103,'09:15 AM',_binary '\0',2,10,58,15),(104,'09:15 AM',_binary '\0',2,10,59,15),(105,'09:15 AM',_binary '\0',2,10,60,15),(106,'09:15 AM',_binary '\0',2,10,61,15),(137,'Invalid date',_binary '\0',6,11,77,12),(138,'Invalid date',_binary '\0',6,11,77,12),(139,'10:20 AM',_binary '\0',1,12,78,25),(140,'08:00 PM',_binary '\0',1,12,78,25),(141,'10:20 AM',_binary '\0',1,12,79,25),(142,'08:00 PM',_binary '\0',1,12,79,25),(143,'10:20 AM',_binary '\0',1,12,80,25),(144,'08:00 PM',_binary '\0',1,12,80,25),(145,'10:20 AM',_binary '\0',1,12,81,25),(146,'08:00 PM',_binary '\0',1,12,81,25),(147,'10:20 AM',_binary '\0',1,12,82,25),(148,'08:00 PM',_binary '\0',1,12,82,25),(149,'10:20 AM',_binary '\0',1,12,83,25),(150,'08:00 PM',_binary '\0',1,12,83,25),(151,'10:20 AM',_binary '\0',1,12,84,25),(152,'08:00 PM',_binary '\0',1,12,84,25),(153,'10:20 AM',_binary '\0',1,12,85,25),(154,'08:00 PM',_binary '\0',1,12,85,25),(155,'10:20 AM',_binary '\0',1,12,86,25),(156,'08:00 PM',_binary '\0',1,12,86,25),(157,'10:20 AM',_binary '\0',1,12,87,25),(158,'08:00 PM',_binary '\0',1,12,87,25),(159,'10:20 AM',_binary '\0',1,12,88,25),(160,'08:00 PM',_binary '\0',1,12,88,25),(161,'10:20 AM',_binary '\0',1,12,89,25),(162,'08:00 PM',_binary '\0',1,12,89,25),(163,'10:20 AM',_binary '\0',1,12,90,25),(164,'08:00 PM',_binary '\0',1,12,90,25),(165,'10:20 AM',_binary '\0',1,12,91,25),(166,'08:00 PM',_binary '\0',1,12,91,25),(167,'10:20 AM',_binary '\0',1,12,92,25),(168,'08:00 PM',_binary '\0',1,12,92,25),(169,'10:20 AM',_binary '\0',1,12,93,25),(170,'08:00 PM',_binary '\0',1,12,93,25),(171,'09:30 AM',_binary '\0',10,13,94,25),(172,'07:40 PM',_binary '\0',10,13,94,25),(173,'09:30 AM',_binary '\0',10,13,95,25),(174,'07:40 PM',_binary '\0',10,13,95,25),(175,'09:30 AM',_binary '\0',10,13,96,25),(176,'07:40 PM',_binary '\0',10,13,96,25),(177,'09:30 AM',_binary '\0',10,13,97,25),(178,'07:40 PM',_binary '\0',10,13,97,25),(179,'09:30 AM',_binary '\0',10,13,98,25),(180,'07:40 PM',_binary '\0',10,13,98,25),(181,'09:30 AM',_binary '\0',10,13,99,25),(182,'07:40 PM',_binary '\0',10,13,99,25),(183,'09:30 AM',_binary '\0',10,13,100,25),(184,'07:40 PM',_binary '\0',10,13,100,25),(185,'09:30 AM',_binary '\0',10,13,101,25),(186,'07:40 PM',_binary '\0',10,13,101,25),(187,'09:30 AM',_binary '\0',10,13,102,25),(188,'07:40 PM',_binary '\0',10,13,102,25),(189,'09:30 AM',_binary '\0',10,13,103,25),(190,'07:40 PM',_binary '\0',10,13,103,25),(191,'09:30 AM',_binary '\0',10,13,104,25),(192,'07:40 PM',_binary '\0',10,13,104,25),(193,'09:30 AM',_binary '\0',10,13,105,25),(194,'07:40 PM',_binary '\0',10,13,105,25),(195,'09:30 AM',_binary '\0',10,13,106,25),(196,'07:40 PM',_binary '\0',10,13,106,25),(197,'09:30 AM',_binary '\0',10,13,107,25),(198,'07:40 PM',_binary '\0',10,13,107,25),(199,'09:30 AM',_binary '\0',10,13,108,25),(200,'07:40 PM',_binary '\0',10,13,108,25),(201,'09:30 AM',_binary '\0',10,13,109,25),(202,'07:40 PM',_binary '\0',10,13,109,25),(203,'05:00 PM',_binary '\0',11,14,110,30),(204,'05:00 PM',_binary '\0',11,14,111,30),(205,'05:00 PM',_binary '\0',11,14,112,30),(206,'05:00 PM',_binary '\0',11,14,113,30),(207,'05:00 PM',_binary '\0',11,14,114,30),(208,'05:00 PM',_binary '\0',11,14,115,30),(209,'05:00 PM',_binary '\0',11,14,116,30),(210,'05:00 PM',_binary '\0',11,14,117,30),(211,'05:00 PM',_binary '\0',11,14,118,30),(212,'05:00 PM',_binary '\0',11,14,119,30),(213,'05:00 PM',_binary '\0',11,14,120,30),(214,'05:00 PM',_binary '\0',11,14,121,30),(215,'05:00 PM',_binary '\0',11,14,122,30),(216,'05:00 PM',_binary '\0',11,14,123,30),(217,'05:00 PM',_binary '\0',11,14,124,30),(218,'03:15 PM',_binary '\0',5,15,125,22),(219,'03:15 PM',_binary '\0',5,15,126,22),(220,'03:15 PM',_binary '\0',5,15,127,22),(221,'03:15 PM',_binary '\0',5,15,128,22),(222,'03:15 PM',_binary '\0',5,15,129,22),(223,'03:15 PM',_binary '\0',5,15,130,22),(224,'03:15 PM',_binary '\0',5,15,131,22),(225,'03:15 PM',_binary '\0',5,15,132,22),(226,'03:15 PM',_binary '\0',5,15,133,22),(227,'03:15 PM',_binary '\0',5,15,134,22),(228,'03:15 PM',_binary '\0',5,15,135,22),(229,'03:15 PM',_binary '\0',5,15,136,22),(230,'03:15 PM',_binary '\0',5,15,137,22),(231,'03:15 PM',_binary '\0',5,15,138,22),(232,'03:15 PM',_binary '\0',5,15,139,22),(233,'12:35 PM',_binary '\0',2,16,140,15),(234,'12:35 PM',_binary '\0',2,16,141,15),(235,'12:35 PM',_binary '\0',2,16,142,15),(236,'12:35 PM',_binary '\0',2,16,143,15),(237,'12:35 PM',_binary '\0',2,16,144,15),(238,'12:35 PM',_binary '\0',2,16,145,15),(239,'12:35 PM',_binary '\0',2,16,146,15),(240,'12:35 PM',_binary '\0',2,16,147,15),(241,'12:35 PM',_binary '\0',2,16,148,15),(242,'12:35 PM',_binary '\0',2,16,149,15),(243,'12:35 PM',_binary '\0',2,16,150,15),(244,'12:35 PM',_binary '\0',2,16,151,15),(245,'12:35 PM',_binary '\0',2,16,152,15),(246,'12:35 PM',_binary '\0',2,16,153,15),(247,'12:35 PM',_binary '\0',2,16,154,15),(248,'02:00 PM',_binary '\0',6,17,155,12),(249,'02:00 PM',_binary '\0',6,17,156,12),(250,'02:00 PM',_binary '\0',6,17,157,12),(251,'02:00 PM',_binary '\0',6,17,158,12),(252,'02:00 PM',_binary '\0',6,17,159,12),(253,'02:00 PM',_binary '\0',6,17,160,12),(254,'02:00 PM',_binary '\0',6,17,161,12),(255,'02:00 PM',_binary '\0',6,17,162,12),(256,'02:00 PM',_binary '\0',6,17,163,12),(257,'02:00 PM',_binary '\0',6,17,164,12),(258,'02:00 PM',_binary '\0',6,17,165,12),(259,'02:00 PM',_binary '\0',6,17,166,12),(260,'02:00 PM',_binary '\0',6,17,167,12),(261,'02:00 PM',_binary '\0',6,17,168,12),(262,'02:00 PM',_binary '\0',6,17,169,12),(278,'10:00 AM',_binary '\0',14,19,182,NULL),(279,'10:00 AM',_binary '\0',14,19,183,NULL),(280,'10:00 AM',_binary '\0',14,19,184,NULL),(281,'10:00 AM',_binary '\0',14,19,185,NULL),(282,'10:00 AM',_binary '\0',14,19,186,NULL),(283,'10:00 AM',_binary '\0',14,19,187,NULL),(284,'10:00 AM',_binary '\0',14,19,188,NULL),(285,'10:00 AM',_binary '\0',14,19,189,NULL),(286,'10:00 AM',_binary '\0',2,2,197,15),(287,'05:00 PM',_binary '\0',2,2,197,15),(288,'10:00 AM',_binary '\0',2,2,198,15),(289,'05:00 PM',_binary '\0',2,2,198,15),(290,'10:00 AM',_binary '\0',2,2,199,15),(291,'05:00 PM',_binary '\0',2,2,199,15),(292,'10:00 AM',_binary '\0',2,2,200,15),(293,'05:00 PM',_binary '\0',2,2,200,15),(294,'10:00 AM',_binary '\0',2,2,201,15),(295,'05:00 PM',_binary '\0',2,2,201,15),(330,'04:00 PM',_binary '\0',16,21,232,NULL),(331,'04:00 PM',_binary '\0',16,21,233,NULL),(332,'04:00 PM',_binary '\0',16,21,234,NULL),(333,'04:00 PM',_binary '\0',16,21,235,NULL),(334,'04:00 PM',_binary '\0',16,21,236,NULL),(335,'04:00 PM',_binary '\0',16,21,237,NULL),(336,'04:00 PM',_binary '\0',16,21,238,NULL),(337,'03:31 PM',_binary '\0',13,18,239,25),(338,'03:31 PM',_binary '\0',13,18,240,25),(339,'03:31 PM',_binary '\0',13,18,241,25),(340,'03:31 PM',_binary '\0',13,18,242,25),(341,'03:31 PM',_binary '\0',13,18,243,25),(342,'03:31 PM',_binary '\0',13,18,244,25),(343,'03:31 PM',_binary '\0',13,18,245,25),(344,'08:15 AM',_binary '\0',10,22,246,25),(345,'08:15 AM',_binary '\0',10,22,247,25),(346,'08:15 AM',_binary '\0',10,22,248,25),(347,'08:15 AM',_binary '\0',10,22,249,25),(348,'08:15 AM',_binary '\0',10,22,250,25),(349,'08:15 AM',_binary '\0',10,22,251,25),(350,'08:15 AM',_binary '\0',10,22,252,25),(351,'09:00 AM',_binary '\0',11,23,253,30),(352,'09:00 AM',_binary '\0',11,23,254,30),(353,'09:00 AM',_binary '\0',11,23,255,30),(354,'09:00 AM',_binary '\0',11,23,256,30),(355,'09:00 AM',_binary '\0',11,23,257,30),(356,'09:00 AM',_binary '\0',11,23,258,30),(357,'09:00 AM',_binary '\0',11,23,259,30),(358,'05:00 AM',_binary '\0',1,1,260,25),(359,'11:19 AM',_binary '\0',1,1,260,25),(360,'01:23 AM',_binary '\0',1,1,260,25),(361,'05:00 AM',_binary '\0',1,1,261,25),(362,'11:19 AM',_binary '\0',1,1,261,25),(363,'01:23 AM',_binary '\0',1,1,261,25),(364,'05:00 AM',_binary '\0',1,1,262,25),(365,'11:19 AM',_binary '\0',1,1,262,25),(366,'01:23 AM',_binary '\0',1,1,262,25),(367,'05:00 AM',_binary '\0',1,1,263,25),(368,'11:19 AM',_binary '\0',1,1,263,25),(369,'01:23 AM',_binary '\0',1,1,263,25),(370,'05:00 AM',_binary '\0',1,1,264,25),(371,'11:19 AM',_binary '\0',1,1,264,25),(372,'01:23 AM',_binary '\0',1,1,264,25),(425,'02:30 PM',_binary '\0',15,20,302,30),(426,'02:30 PM',_binary '\0',15,20,303,30),(427,'02:30 PM',_binary '\0',15,20,304,30),(428,'02:30 PM',_binary '\0',15,20,305,30),(429,'02:30 PM',_binary '\0',15,20,306,30),(430,'02:30 PM',_binary '\0',15,20,307,30),(431,'11:25 AM',_binary '\0',1,24,308,25),(432,'11:25 AM',_binary '\0',1,24,309,25),(433,'11:25 AM',_binary '\0',1,24,310,25),(434,'11:25 AM',_binary '\0',1,24,311,25),(435,'11:25 AM',_binary '\0',1,24,312,25),(436,'11:25 AM',_binary '\0',1,24,313,25),(437,'11:25 AM',_binary '\0',1,24,314,25);
/*!40000 ALTER TABLE `tbl_eventscheduletimeslots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_payment`
--

DROP TABLE IF EXISTS `tbl_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_payment` (
  `PaymentId` int NOT NULL AUTO_INCREMENT,
  `PayerName` varchar(70) NOT NULL,
  `CardNumber` bigint NOT NULL,
  `ExpiryDate` varchar(20) NOT NULL,
  `Cvv` smallint NOT NULL,
  `BookingId` int DEFAULT NULL,
  PRIMARY KEY (`PaymentId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payment`
--

LOCK TABLES `tbl_payment` WRITE;
/*!40000 ALTER TABLE `tbl_payment` DISABLE KEYS */;
INSERT INTO `tbl_payment` VALUES (1,'Damien Peter',4263982640269299,'2022-05',956,2),(2,'Jerome',4351456486489743,'2022-12',897,3),(3,'Kirthik',4259951649876879,'2022-10',785,4),(4,'Santhana Raj Kumar',51051051051051,'2022-12',425,6);
/*!40000 ALTER TABLE `tbl_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_rollbase`
--

DROP TABLE IF EXISTS `tbl_rollbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_rollbase` (
  `RollId` int NOT NULL AUTO_INCREMENT,
  `Roll` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`RollId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rollbase`
--

LOCK TABLES `tbl_rollbase` WRITE;
/*!40000 ALTER TABLE `tbl_rollbase` DISABLE KEYS */;
INSERT INTO `tbl_rollbase` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `tbl_rollbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `UserId` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(70) NOT NULL,
  `LastName` varchar(70) NOT NULL,
  `Email` varchar(320) NOT NULL,
  `Password` varchar(75) DEFAULT NULL,
  `Phone` varchar(50) NOT NULL,
  `Roll` int DEFAULT '2',
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'Vincent','Xavier','admin@gmail.com','root','8526073314',1),(3,'Santhana ','Raj Kumar','rajkumar@gmail.com',NULL,'7418361921',2),(4,'Damien','Peter','peter@gmail.com',NULL,'9868646498',2),(5,'Look At Me','Jerom','lookatme@gmail.com',NULL,'8797987465',2),(6,'kirthik','sk','kirthik@gmail.com',NULL,'9868646498',2),(7,'Santhana ','Nivas','nivi@live.com',NULL,'8798746341',2),(8,'Santhana ','Raj Kumar','kumar@gmail.com',NULL,'7418361921',2),(9,'john ','Britto','john@gmail.com',NULL,'8987846545',2);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_usernames`
--

DROP TABLE IF EXISTS `test_usernames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_usernames` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_usernames`
--

LOCK TABLES `test_usernames` WRITE;
/*!40000 ALTER TABLE `test_usernames` DISABLE KEYS */;
INSERT INTO `test_usernames` VALUES (3,'Krithik'),(4,'Denis'),(5,'Peter');
/*!40000 ALTER TABLE `test_usernames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'zipline'
--

--
-- Dumping routines for database 'zipline'
--
/*!50003 DROP PROCEDURE IF EXISTS `test_DeleteInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `test_DeleteInsert`(in singleDate date,in eid int,in sid int,out dateId int)
BEGIN
	 DECLARE OldDateId INT DEFAULT 0;
		IF EXISTS(SELECT DateId FROM tbl_eventscheduledates WHERE EventId = eid AND ScheduleId = sid) THEN
			BEGIN
				SET OldDateId := (SELECT DateId FROM tbl_eventscheduledates WHERE Date = singleDate AND EventId = eid AND ScheduleId = sid);
				DELETE FROM tbl_eventscheduledates WHERE DateId = OldDateId;
				
				INSERT INTO `tbl_eventscheduledates` (`Date`,`EventId`,`ScheduleId`) VALUES (singleDate, eid, sid);
				SET dateId = last_insert_id();
			END;
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test_Getdatesbetweentwodays` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `test_Getdatesbetweentwodays`(
in DateFrom date,
in DateTo date
)
BEGIN
select Date from 
			(select adddate('1970-01-01',t4*10000 + t3*1000 + t2*100 + t1*10 + t0) Date from
			 (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
			 (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
			 (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
			 (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
			 (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v
where Date between DateFrom and DateTo Order by Date;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test_SaveScheduleAndDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `test_SaveScheduleAndDate`(in ScheduleId int,in Name varchar(100),in DateFrom datetime,in DateTo datetime,in Times varchar(255),in EventId int,out startDate int, out endDate int)
BEGIN
declare newScheduleId int default 0;
            
IF ScheduleId = 0 THEN
        insert into tbl_eventschedule(`Name`,`DateFrom`,`DateTo`,`Times`,`EventId`)
		value (Name, DateFrom, DateTo, Times, EventId);
		set newScheduleId = LAST_INSERT_ID();
               
        if	newScheduleId > 0 then
			         
                     set @eid = EventId;
			
			INSERT INTO `zipline`.`tbl_eventscheduledates`
			(`Date`,
			`EventId`,
			`ScheduleId`)
			select Date, @eid as EventId, newScheduleId as ScheduleId from 
						(select adddate('1970-01-01',t4*10000 + t3*1000 + t2*100 + t1*10 + t0) Date from
						 (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
						 (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
						 (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
						 (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
						 (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v
			where Date between DateFrom and DateTo Order by Date;
           set startDate = LAST_INSERT_ID();
        end if;
            set endDate = LAST_INSERT_ID();
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test_SaveScheduleDates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `test_SaveScheduleDates`(
in DateFrom date,
in DateTo date,
in evantId int,
in scheduleId int
)
BEGIN

INSERT INTO `zipline`.`tbl_eventscheduledates`
(`Date`,
`EventId`,
`ScheduleId`)

select Date, evantId as EventId, scheduleId as ScheduleId from 
			(select adddate('1970-01-01',t4*10000 + t3*1000 + t2*100 + t1*10 + t0) Date from
			 (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
			 (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
			 (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
			 (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
			 (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v
where Date between DateFrom and DateTo Order by Date;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Booking_BookingById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Booking_BookingById`(in id int)
BEGIN
	SELECT eb.BookingId, e.eventName,e.price, eb.BookingId, eb.Guests, eb.TotalPrice, eb.EventTime, Eb.EventDate FROM `tbl_eventbooking` eb LEFT JOIN tbl_events e on e.EventId = eb.EventId where eb.BookingId = id;
    SELECT  u.FirstName, u.LastName, u.Email, u.Phone FROM `tbl_eventbooking` eb LEFT JOIN tbl_user u on u.UserId = eb.userId where eb.BookingId = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Booking_FetchBookingDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Booking_FetchBookingDetails`()
BEGIN
	SELECT eb.BookingId, e.eventName,e.price, eb.BookingId, eb.Guests, eb.TotalPrice, eb.EventTime, Eb.EventDate FROM `tbl_eventbooking` eb LEFT JOIN tbl_events e on e.EventId = eb.EventId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Booking_FetchBookingListBySlotId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Booking_FetchBookingListBySlotId`(In pSlotId INT)
BEGIN
	SELECT eb.BookingId, eb.UserId, eb.EventId, eb.ScheduleId, eb.DateId, eb.SlotId, eb.Guests, eb.TotalPrice,
    eb.EventTime, eb.EventDate,u.FirstName, u.LastName, u.Email, u.Phone, e.EventName,
    CASE  eb.PaymentStatus WHEN 1 THEN 'Paid' ELSE  'Pending' END As PaymentStatus
    FROM `tbl_eventbooking` eb
    LEFT JOIN tbl_user u on u.UserId = eb.userId
    LEFT JOIN tbl_events e on e.EventId = eb.EventId
    WHERE eb.SlotId = pSlotId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Booking_FetchOrderList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Booking_FetchOrderList`()
BEGIN
	SELECT eb.BookingId, eb.UserId, eb.EventId, eb.ScheduleId, eb.DateId, eb.SlotId, eb.Guests, eb.TotalPrice,
    eb.EventTime, eb.EventDate,u.FirstName, u.LastName, u.Email, u.Phone, e.EventName, eb.BookingDate,
    CASE  eb.PaymentStatus WHEN 1 THEN 'Paid' ELSE  'Pending' END As PaymentStatus
    FROM `tbl_eventbooking` eb
    LEFT JOIN tbl_user u on u.UserId = eb.userId
    LEFT JOIN tbl_events e on e.EventId = eb.EventId
    WHERE eb.PaymentStatus = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Booking_SaveEventBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Booking_SaveEventBooking`(
in firstname varchar(70),in lastname varchar(70),in email varchar(255), in phone varchar(50),
in eventid  int,in scheduleid  int,in dateid  int,in slotid  int,in guest int,in totalprice decimal(18,2),
in eventtime varchar(15), eventdate date, out returnVal int 
)
BEGIN
	DECLARE userid INT DEFAULT 0 ;
		INSERT INTO `tbl_user`(`FirstName`,`LastName`,`Email`,`Phone`)
			VALUES (firstname, lastname, email, phone);
	SET userid = last_insert_id();
		INSERT INTO `tbl_eventbooking`(`UserId`,`EventId`,`ScheduleId`,`DateId`,`SlotId`, `Guests`,`TotalPrice`,`EventTime`,`EventDate`)
			VALUES (userid, eventid, scheduleid, dateid, slotid, guest, totalprice, eventtime, eventdate);
	SET returnVal = last_insert_id();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Booking_SavePayment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Booking_SavePayment`(
											IN pPaymentId INT, IN pPayerName VARCHAR(70),
											IN pCardNumber BIGINT, IN pExpiryDate VARCHAR(20),
											IN pCvv SMALLINT, IN pBookingId INT,
											OUT ReturnVal INT
                                            )
BEGIN
	IF (pPaymentId = 0) THEN
        
			BEGIN
				INSERT INTO tbl_payment (`PayerName`, `CardNumber`, `ExpiryDate`, `Cvv`, `BookingId`)
				VALUES (pPayerName, pCardNumber, pExpiryDate, pCvv, pBookingId);
                
                -- If Payment Success update pending to success in booking table
                UPDATE tbl_eventbooking SET PaymentStatus = 1 where BookingId = pBookingId;
                
                SET ReturnVal = last_insert_id();
			END;
            
		ELSE
        
			BEGIN
				UPDATE tbl_payment SET PayerName = pPayerName, CardNumber = pCardNumber, ExpiryDate = pExpiryDate, Cvv= pCvv, BookingId = pBookingId WHERE PaymentId = pPaymentId ;
				SET ReturnVal = pPaymentId;
            END;
            
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Event_DeleteEventDates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_DeleteEventDates`(in i_eventId int,in i_scheduleId int)
begin
			DELETE FROM tbl_eventscheduletimeslots WHERE eventid=i_eventId and scheduleId=i_scheduleId;
           DELETE FROM  tbl_eventscheduledates WHERE eventid=i_eventId and scheduleId=i_scheduleId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Event_EventDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_EventDetails`()
BEGIN
	SELECT EventId, EventName, EventDiscription, Price, EventCapacity, Min_Booking, Max_Booking, EventImage
	FROM  tbl_events WHERE IsDeleted = 0 AND IsActive = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Event_EventDetailsById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_EventDetailsById`(in eId int)
BEGIN
SELECT EventId, EventName, EventDiscription, Price, EventCapacity, Min_Booking, Max_Booking, EventImage FROM zipline.tbl_events WHERE EventId = eId AND IsDeleted = 0 AND IsActive = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Event_FetchEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_FetchEvents`()
BEGIN
		SELECT sd.Date FROM tbl_events e 
			LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
			LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
		WHERE sd.Date >= DATE_FORMAT(now(),'%Y-%m-%d')
		GROUP BY sd.Date
		ORDER BY sd.Date;
        
	-- Another Table
		SELECT e.EventId,sd.ScheduleId,sd.DateId, st.SlotId, sd.Date, e.EventName, e.Price, st.EventCapacity, e.Min_Booking, e.Max_Booking,
			e.EventImage, st.Time, s.Bookings ,s.Available FROM tbl_events e
			
			LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
			LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
			LEFT JOIN tbl_eventscheduletimeslots st ON sd.ScheduleId = st.ScheduleId AND sd.DateId = st.DateId
            LEFT JOIN ( SELECT st.SlotId, sum(Guests) AS Bookings, st.eventcapacity - sum(eb.Guests)  AS Available
						FROM `zipline`.`tbl_eventbooking` eb
						LEFT JOIN tbl_eventscheduletimeslots st ON st.SlotId = eb.SlotId
						GROUP BY eb.SlotId
					  ) s ON s.SlotId = st.SlotId
			-- LEFT JOIN tbl_eventbooking eb on eb.EventId = e.EventId
		WHERE sd.Date >= DATE_FORMAT(now(),'%Y-%m-%d')
		ORDER BY sd.Date, STR_TO_DATE(st.time, '%h:%i %p');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Event_FetchScheduleDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_FetchScheduleDetails`(in id int)
BEGIN
	SELECT	EventId, ScheduleId, Name, DateFrom, DateTo, Times 
	FROM tbl_eventschedule
	WHERE EventId = id AND IsDeleted = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Event_GetAllEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_GetAllEvents`()
BEGIN
		SELECT dayname(sd.Date) AS DayName,  DATE_FORMAT(sd.Date,'%M %d %Y') AS FullDate, e.eventId,
		es.ScheduleId,sd.DateId,st.SlotId, e.EventName, e.EventDiscription, e.Price, 
		e.EventCapacity, e.Min_Booking, e.Max_Booking, e.EventImage, es.Name, sd.Date,
		cast(STR_TO_DATE(st.time, '%h:%i %p')as datetime) AS times FROM tbl_events e 
		LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
		LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
		LEFT JOIN tbl_eventscheduletimeslots st ON sd.ScheduleId = st.ScheduleId AND sd.DateId = st.DateId
		WHERE e.IsDeleted = 0 AND e.IsActive = 0 AND es.IsDeleted = 0 AND sd.IsDeleted = 0 AND st.IsDeleted = 0
		ORDER BY sd.Date,times;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Event_GetEventById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_GetEventById`(in id int )
BEGIN
		SELECT  sd.Date, e.EventName, e.EventDiscription, e.Price, st.EventCapacity, e.Min_Booking, e.Max_Booking,
		e.EventImage, st.Time,s.Bookings, s.Available, e.EventId, es.ScheduleId, sd.DateId, st.SlotId FROM tbl_events e
		LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
		LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
		LEFT JOIN tbl_eventscheduletimeslots st ON sd.ScheduleId = st.ScheduleId AND sd.DateId = st.DateId
        LEFT JOIN ( SELECT st.SlotId, sum(Guests) AS Bookings, st.eventcapacity - sum(eb.Guests)  AS Available
						FROM `zipline`.`tbl_eventbooking` eb
						LEFT JOIN tbl_eventscheduletimeslots st ON st.SlotId = eb.SlotId
						GROUP BY eb.SlotId
					  ) s ON s.SlotId = st.SlotId
		WHERE st.SlotId = id AND e.IsDeleted = 0 AND e.IsActive = 0 AND es.IsDeleted = 0 AND sd.IsDeleted = 0 AND st.IsDeleted = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Event_RemoveEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_RemoveEvent`(IN pEventId INT, OUT IsDeleted INT)
BEGIN
		IF EXISTS(SELECT EventId FROM tbl_events WHERE EventId = pEventId) THEN
			BEGIN
				SET SQL_SAFE_UPDATES = 0;
					DELETE FROM tbl_events WHERE EventId = pEventId;
					DELETE FROM tbl_eventschedule WHERE EventId = pEventId;
					DELETE FROM tbl_eventscheduletimeslots WHERE EventId = pEventId;
					DELETE FROM  tbl_eventscheduledates WHERE EventId = pEventId;
				SET  IsDeleted = 1;
				SET SQL_SAFE_UPDATES = 1;
            END;
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Event_RemoveScheduleDateAndTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_RemoveScheduleDateAndTime`(in singleDate date,in eid int,in sid int)
BEGIN
DECLARE OldDateId INT DEFAULT 0;
		IF EXISTS(SELECT DateId FROM tbl_eventscheduledates WHERE Date = singleDate AND EventId = eid AND ScheduleId = sid) THEN
			BEGIN
				SET OldDateId := (SELECT DateId FROM tbl_eventscheduledates WHERE Date = singleDate AND EventId = eid AND ScheduleId = sid);
				-- DELETE FROM tbl_eventscheduledates WHERE DateId = OldDateId;
                SELECT * FROM tbl_eventscheduledates WHERE DateId = OldDateId;
			END;
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Event_SaveEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_SaveEvent`(
in eId int,
in eName varchar(150),
in minBook int,
in maxBook int,
in eImg varchar(255),
in e_price decimal(18,2),
in eCapacity int,
in eDiscri varchar(255),
out returnVal int
)
BEGIN
	IF eId = 0 THEN
		BEGIN
			INSERT INTO tbl_events(`EventName`, `EventDiscription`, Price, EventCapacity, Min_Booking, Max_Booking, `EventImage` )
			VALUE (eName, eDiscri, e_price,eCapacity, minBook, maxBook, eImg);
			SET returnVal = LAST_INSERT_ID();
		END;
	ELSE
		BEGIN
			UPDATE tbl_events SET EventName = eName, EventDiscription = eDiscri, Price = e_price, EventCapacity = eCapacity, Min_Booking = minBook, Max_Booking = maxBook, EventImage = eImg  WHERE EventId = eId;
			SET returnVal = eId;
		END;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Event_SaveEventDates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_SaveEventDates`(in singleDate date,in eid int,in sid int,out dateId int)
BEGIN
				INSERT INTO `tbl_eventscheduledates` (`Date`,`EventId`,`ScheduleId`) VALUES (singleDate, eid, sid);
				SET dateId = last_insert_id();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Event_SaveEventSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_SaveEventSchedule`(in pScheduleId int,in pName varchar(100),in pDateFrom datetime,in pDateTo datetime,in pTimes varchar(255),in pEventId int,out preturnVal int)
BEGIN
	IF pScheduleId = 0 THEN
		BEGIN
			INSERT INTO tbl_eventschedule(`Name`,`DateFrom`,`DateTo`,`Times`,`EventId`)
			VALUE (pName, pDateFrom, pDateTo, pTimes, pEventId);
			SET preturnVal = LAST_INSERT_ID();
		END;
	ELSE
		BEGIN
            UPDATE tbl_eventschedule SET Name = pName, DateFrom = pDateFrom, DateTo = pDateTo, Times = pTimes WHERE ScheduleId = pScheduleId;
            SET preturnVal = pScheduleId;
		END;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Event_SaveEventTimeSlot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_SaveEventTimeSlot`(IN ScheduleTime VARCHAR(15), IN eId INT, IN sId INT, IN dId INT , OUT returnval int)
BEGIN
	
    
	INSERT INTO tbl_eventscheduletimeslots (`Time`, `EventId`, `ScheduleId`, `DateId`,eventcapacity)
    VALUES (ScheduleTime, eId, SId, dId,(SELECT eventcapacity FROM tbl_events WHERE eventid=eId));
	SET returnval = last_insert_id();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Event_ScheduleById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_ScheduleById`(id int)
BEGIN
	SELECT	EventId, ScheduleId, Name, DateFrom, DateTo, Times
	FROM tbl_eventschedule
    WHERE ScheduleId = id AND IsDeleted = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_User_GetUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_User_GetUsers`()
BEGIN
	SELECT u.UserId, u.FirstName, u.LastName, Email, u.password, u.phone, r.Roll as UserRole FROM tbl_user u
	JOIN tbl_rollbase r ON r.RollId = u.Roll;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_User_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_User_Login`(
in email varchar(320),
in pass varchar(60)
)
BEGIN
select u.FirstName,u.LastName,Email,u.phone ,r.Roll as UserRole from tbl_user u
join tbl_rollbase r on r.RollId = u.Roll  where Email = email and Password = pass;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-17 16:38:45
