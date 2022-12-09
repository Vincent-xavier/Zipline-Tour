CREATE DATABASE  IF NOT EXISTS `zipline` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `zipline`;
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
  PRIMARY KEY (`BookingId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventbooking`
--

LOCK TABLES `tbl_eventbooking` WRITE;
/*!40000 ALTER TABLE `tbl_eventbooking` DISABLE KEYS */;
INSERT INTO `tbl_eventbooking` VALUES (1,16,3,5,21,48,1,65.00,'10:00 AM','2022-11-22',0),(2,17,5,4,15,41,4,200.00,'08:50 AM','2022-11-18',0),(3,18,3,9,47,92,4,260.00,'08:00 AM','2022-11-24',0),(4,19,6,7,29,60,5,175.00,'05:40 PM','2022-11-24',0),(5,20,5,8,43,88,3,150.00,'07:14 AM','2022-11-29',0),(6,21,5,8,43,88,7,350.00,'07:14 AM','2022-11-29',0),(7,22,3,9,48,93,1,65.00,'08:00 AM','2022-11-25',0),(8,23,3,9,48,93,1,65.00,'08:00 AM','2022-11-25',0),(9,24,5,8,39,80,1,50.00,'07:14 AM','2022-11-25',0),(10,25,5,8,39,79,1,50.00,'01:00 PM','2022-11-25',0),(11,26,5,8,39,79,3,150.00,'01:00 PM','2022-11-25',0),(12,27,1,1,1,1,4,380.00,'11:00 AM','2022-11-11',0),(13,28,2,2,5,13,3,180.00,'11:00 AM','2022-11-11',0),(14,29,1,1,1,1,11,1045.00,'11:00 AM','2022-11-11',0),(15,30,2,2,5,13,2,120.00,'11:00 AM','2022-11-11',0),(16,31,1,12,83,150,2,80.00,'02:05 PM','2022-12-04',0),(17,32,10,13,99,181,3,60.00,'02:07 PM','2022-12-04',0),(18,33,13,18,177,269,9,900.00,'02:31 PM','2022-12-09',0);
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
INSERT INTO `tbl_events` VALUES (1,'Zipline Tree','This one-of-a-kind overnight Treehouse stay includes a set of eco tours with fourteen ziplines, two spiral staircases, eight sky bridges, and a rappel back down to the forest floor.',40.00,25,1,5,'event-img220718196.jpg',_binary '\0',_binary '\0'),(2,'Don\'t look back','Enjoy ur ride but please don\'t look down  until you finish the game',60.00,15,1,3,'Zip_line-2220837277.jpg',_binary '\0',_binary '\0'),(3,'Zambezi River','Ziplining over the Zambezi River is available year-round so there really is no excuse not to give it a go!',65.00,20,1,6,'Zip_line-3220145236.jpg',_binary '\0',_binary '\0'),(5,'Flying Baba Adventure','Enjoy one of the longest zipline of India, 930 meters long zipline over with flyingbaba,enjoy the scenic view of the sahyadri mountains',50.00,22,1,4,'Zip_line-4222949966.jpg',_binary '\0',_binary '\0'),(6,'Swing into the Semester Zipline Event','The Carolina Adventures Challenge Course invites you to swing your way into the new semester with us! Soar through the sky on our Giant Swing, and take an exhilarating ride down our 1,200 ft. Tandem Zipline!',35.00,12,2,2,'Zipline_5225904433.jfif',_binary '\0',_binary '\0'),(10,'The Unreal Zip','2,000 meters/ 6,561 feet, or 1.25 miles',20.00,25,1,3,'zipline_6222747943.jfif',_binary '\0',_binary '\0'),(11,'Zip World Velocity 2','Penrhyn Slate Quarry, located near Bethesda in North Wales, is home to Zip World Velocity 2, the fastest zip line in the world and the longest in Europe.',15.00,30,1,4,'zipline_10224318798.jfif',_binary '\0',_binary '\0'),(12,'Bosoco soft zipline','Yelagiri',25.00,25,1,5,'Zip_line-3222921292.jpg',_binary '\0',_binary '\0'),(13,'Bosoco soft Zipper','Yelagiri Javadhu Hills',100.00,25,5,25,'Zipline_5223021564.jfif',_binary '\0',_binary '\0'),(14,'Jaguar Cave Zip Line','A zip-line, zip line, zip-wire, flying fox, or death slide is a pulley suspended on a cable, usually made of stainless steel, mounted on a slope.',50.00,50,1,5,'zipline_17220404727.jfif',_binary '\0',_binary '\0'),(15,'Dragon\'s Breath Flight Line','Spanning a total length of 330 feet and a height of 70 feet, a rider can fly at an approx. speed of 50 km while enjoying the breathtaking scenery of forests, snowy mountains, and meadows.',45.00,30,2,6,'zipline-mu221328508.jpg',_binary '\0',_binary '\0'),(16,'Skyline Zipline','Penrhyn Slate Quarry, located near Bethesda in North Wales, is home to Skyline Zipline, the fastest zip line in the world and the longest in Europe.',25.00,15,2,6,'zipline_47225354181.jfif',_binary '\0',_binary '\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventschedule`
--

LOCK TABLES `tbl_eventschedule` WRITE;
/*!40000 ALTER TABLE `tbl_eventschedule` DISABLE KEYS */;
INSERT INTO `tbl_eventschedule` VALUES (1,'Zipline test','2022-11-11','2022-11-15','05:00 AM',_binary '\0',1),(2,'Zipline_test','2022-11-12','2022-11-16','10:00 AM,05:00 PM',_binary '\0',2),(3,'Zipline','2022-11-11','2022-11-16','11:00 AM',_binary '\0',3),(4,'zipline','2022-11-16','2022-11-18','08:50 AM,05:10 PM',_binary '\0',5),(5,'Daily','2022-11-17','2022-11-22','10:00 AM',_binary '\0',3),(6,'Evening Only','2022-11-17','2022-11-20','03:00 PM',_binary '\0',2),(7,'Special Event','2022-11-21','2022-11-29','11:10 AM,05:40 PM',_binary '\0',6),(8,'Reschedule','2022-11-21','2022-11-29','01:00 PM,07:14 AM',_binary '\0',5),(9,'Reschedule','2022-11-21','2022-11-29','08:00 AM',_binary '\0',3),(10,'Every Morning','2022-11-21','2022-11-29','09:15 AM',_binary '\0',2),(12,'New Schedule','2022-11-29','2022-12-14','10:20 AM,08:00 PM',_binary '\0',1),(13,'New Event','2022-11-29','2022-12-14','09:30 AM,07:40 PM',_binary '\0',10),(14,'Evening Event','2022-11-30','2022-12-14','05:00 PM',_binary '\0',11),(15,'Four Days only','2022-11-30','2022-12-14','03:15 PM',_binary '\0',5),(16,'Special Event','2022-11-30','2022-12-14','12:35 PM',_binary '\0',2),(17,'New Schedule','2022-11-30','2022-12-14','02:00 PM',_binary '\0',6),(18,'Bosoco','2022-12-07','2022-12-13','03:31 PM',_binary '\0',13),(19,'Board','2022-12-07','2022-12-14','10:00 AM',_binary '\0',14),(20,'Special Event','2022-12-09','2022-12-15','02:30 PM',_binary '\0',15),(21,'New Event ','2022-12-08','2022-12-14','04:00 PM',_binary '\0',16);
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
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventscheduledates`
--

LOCK TABLES `tbl_eventscheduledates` WRITE;
/*!40000 ALTER TABLE `tbl_eventscheduledates` DISABLE KEYS */;
INSERT INTO `tbl_eventscheduledates` VALUES (13,'2022-11-16',5,4,_binary '\0'),(14,'2022-11-17',5,4,_binary '\0'),(15,'2022-11-18',5,4,_binary '\0'),(16,'2022-11-17',3,5,_binary '\0'),(17,'2022-11-18',3,5,_binary '\0'),(18,'2022-11-19',3,5,_binary '\0'),(19,'2022-11-20',3,5,_binary '\0'),(20,'2022-11-21',3,5,_binary '\0'),(21,'2022-11-22',3,5,_binary '\0'),(22,'2022-11-17',2,6,_binary '\0'),(23,'2022-11-18',2,6,_binary '\0'),(24,'2022-11-19',2,6,_binary '\0'),(25,'2022-11-20',2,6,_binary '\0'),(26,'2022-11-21',6,7,_binary '\0'),(27,'2022-11-22',6,7,_binary '\0'),(28,'2022-11-23',6,7,_binary '\0'),(29,'2022-11-24',6,7,_binary '\0'),(30,'2022-11-25',6,7,_binary '\0'),(31,'2022-11-26',6,7,_binary '\0'),(32,'2022-11-27',6,7,_binary '\0'),(33,'2022-11-28',6,7,_binary '\0'),(34,'2022-11-29',6,7,_binary '\0'),(35,'2022-11-21',5,8,_binary '\0'),(36,'2022-11-22',5,8,_binary '\0'),(37,'2022-11-23',5,8,_binary '\0'),(38,'2022-11-24',5,8,_binary '\0'),(39,'2022-11-25',5,8,_binary '\0'),(40,'2022-11-26',5,8,_binary '\0'),(41,'2022-11-27',5,8,_binary '\0'),(42,'2022-11-28',5,8,_binary '\0'),(43,'2022-11-29',5,8,_binary '\0'),(44,'2022-11-21',3,9,_binary '\0'),(45,'2022-11-22',3,9,_binary '\0'),(46,'2022-11-23',3,9,_binary '\0'),(47,'2022-11-24',3,9,_binary '\0'),(48,'2022-11-25',3,9,_binary '\0'),(49,'2022-11-26',3,9,_binary '\0'),(50,'2022-11-27',3,9,_binary '\0'),(51,'2022-11-28',3,9,_binary '\0'),(52,'2022-11-29',3,9,_binary '\0'),(53,'2022-11-21',2,10,_binary '\0'),(54,'2022-11-22',2,10,_binary '\0'),(55,'2022-11-23',2,10,_binary '\0'),(56,'2022-11-24',2,10,_binary '\0'),(57,'2022-11-25',2,10,_binary '\0'),(58,'2022-11-26',2,10,_binary '\0'),(59,'2022-11-27',2,10,_binary '\0'),(60,'2022-11-28',2,10,_binary '\0'),(61,'2022-11-29',2,10,_binary '\0'),(78,'2022-11-29',1,12,_binary '\0'),(79,'2022-11-30',1,12,_binary '\0'),(80,'2022-12-01',1,12,_binary '\0'),(81,'2022-12-02',1,12,_binary '\0'),(82,'2022-12-03',1,12,_binary '\0'),(83,'2022-12-04',1,12,_binary '\0'),(84,'2022-12-05',1,12,_binary '\0'),(85,'2022-12-06',1,12,_binary '\0'),(86,'2022-12-07',1,12,_binary '\0'),(87,'2022-12-08',1,12,_binary '\0'),(88,'2022-12-09',1,12,_binary '\0'),(89,'2022-12-10',1,12,_binary '\0'),(90,'2022-12-11',1,12,_binary '\0'),(91,'2022-12-12',1,12,_binary '\0'),(92,'2022-12-13',1,12,_binary '\0'),(93,'2022-12-14',1,12,_binary '\0'),(94,'2022-11-29',10,13,_binary '\0'),(95,'2022-11-30',10,13,_binary '\0'),(96,'2022-12-01',10,13,_binary '\0'),(97,'2022-12-02',10,13,_binary '\0'),(98,'2022-12-03',10,13,_binary '\0'),(99,'2022-12-04',10,13,_binary '\0'),(100,'2022-12-05',10,13,_binary '\0'),(101,'2022-12-06',10,13,_binary '\0'),(102,'2022-12-07',10,13,_binary '\0'),(103,'2022-12-08',10,13,_binary '\0'),(104,'2022-12-09',10,13,_binary '\0'),(105,'2022-12-10',10,13,_binary '\0'),(106,'2022-12-11',10,13,_binary '\0'),(107,'2022-12-12',10,13,_binary '\0'),(108,'2022-12-13',10,13,_binary '\0'),(109,'2022-12-14',10,13,_binary '\0'),(110,'2022-11-30',11,14,_binary '\0'),(111,'2022-12-01',11,14,_binary '\0'),(112,'2022-12-02',11,14,_binary '\0'),(113,'2022-12-03',11,14,_binary '\0'),(114,'2022-12-04',11,14,_binary '\0'),(115,'2022-12-05',11,14,_binary '\0'),(116,'2022-12-06',11,14,_binary '\0'),(117,'2022-12-07',11,14,_binary '\0'),(119,'2022-12-09',11,14,_binary '\0'),(120,'2022-12-10',11,14,_binary '\0'),(121,'2022-12-11',11,14,_binary '\0'),(122,'2022-12-12',11,14,_binary '\0'),(123,'2022-12-13',11,14,_binary '\0'),(124,'2022-12-14',11,14,_binary '\0'),(125,'2022-11-30',5,15,_binary '\0'),(126,'2022-12-01',5,15,_binary '\0'),(127,'2022-12-02',5,15,_binary '\0'),(128,'2022-12-03',5,15,_binary '\0'),(129,'2022-12-04',5,15,_binary '\0'),(130,'2022-12-05',5,15,_binary '\0'),(131,'2022-12-06',5,15,_binary '\0'),(132,'2022-12-07',5,15,_binary '\0'),(133,'2022-12-08',5,15,_binary '\0'),(134,'2022-12-09',5,15,_binary '\0'),(135,'2022-12-10',5,15,_binary '\0'),(136,'2022-12-11',5,15,_binary '\0'),(137,'2022-12-12',5,15,_binary '\0'),(138,'2022-12-13',5,15,_binary '\0'),(139,'2022-12-14',5,15,_binary '\0'),(140,'2022-11-30',2,16,_binary '\0'),(141,'2022-12-01',2,16,_binary '\0'),(142,'2022-12-02',2,16,_binary '\0'),(143,'2022-12-03',2,16,_binary '\0'),(144,'2022-12-04',2,16,_binary '\0'),(145,'2022-12-05',2,16,_binary '\0'),(146,'2022-12-06',2,16,_binary '\0'),(147,'2022-12-07',2,16,_binary '\0'),(148,'2022-12-08',2,16,_binary '\0'),(149,'2022-12-09',2,16,_binary '\0'),(150,'2022-12-10',2,16,_binary '\0'),(151,'2022-12-11',2,16,_binary '\0'),(152,'2022-12-12',2,16,_binary '\0'),(153,'2022-12-13',2,16,_binary '\0'),(154,'2022-12-14',2,16,_binary '\0'),(155,'2022-11-30',6,17,_binary '\0'),(156,'2022-12-01',6,17,_binary '\0'),(157,'2022-12-02',6,17,_binary '\0'),(158,'2022-12-03',6,17,_binary '\0'),(159,'2022-12-04',6,17,_binary '\0'),(160,'2022-12-05',6,17,_binary '\0'),(161,'2022-12-06',6,17,_binary '\0'),(162,'2022-12-07',6,17,_binary '\0'),(163,'2022-12-08',6,17,_binary '\0'),(164,'2022-12-09',6,17,_binary '\0'),(165,'2022-12-10',6,17,_binary '\0'),(166,'2022-12-11',6,17,_binary '\0'),(167,'2022-12-12',6,17,_binary '\0'),(168,'2022-12-13',6,17,_binary '\0'),(169,'2022-12-14',6,17,_binary '\0'),(170,'2022-12-08',11,14,_binary '\0'),(182,'2022-12-07',14,19,_binary '\0'),(183,'2022-12-08',14,19,_binary '\0'),(184,'2022-12-09',14,19,_binary '\0'),(185,'2022-12-10',14,19,_binary '\0'),(186,'2022-12-11',14,19,_binary '\0'),(187,'2022-12-12',14,19,_binary '\0'),(188,'2022-12-13',14,19,_binary '\0'),(189,'2022-12-14',14,19,_binary '\0'),(197,'2022-11-12',2,2,_binary '\0'),(198,'2022-11-13',2,2,_binary '\0'),(199,'2022-11-14',2,2,_binary '\0'),(200,'2022-11-15',2,2,_binary '\0'),(201,'2022-11-16',2,2,_binary '\0'),(207,'2022-11-16',3,3,_binary '\0'),(213,'2022-11-11',1,1,_binary '\0'),(214,'2022-11-12',1,1,_binary '\0'),(215,'2022-11-13',1,1,_binary '\0'),(216,'2022-11-14',1,1,_binary '\0'),(217,'2022-11-15',1,1,_binary '\0'),(225,'2022-12-09',15,20,_binary '\0'),(226,'2022-12-10',15,20,_binary '\0'),(227,'2022-12-11',15,20,_binary '\0'),(228,'2022-12-12',15,20,_binary '\0'),(229,'2022-12-13',15,20,_binary '\0'),(230,'2022-12-14',15,20,_binary '\0'),(231,'2022-12-15',15,20,_binary '\0'),(232,'2022-12-08',16,21,_binary '\0'),(233,'2022-12-09',16,21,_binary '\0'),(234,'2022-12-10',16,21,_binary '\0'),(235,'2022-12-11',16,21,_binary '\0'),(236,'2022-12-12',16,21,_binary '\0'),(237,'2022-12-13',16,21,_binary '\0'),(238,'2022-12-14',16,21,_binary '\0'),(239,'2022-12-07',13,18,_binary '\0'),(240,'2022-12-08',13,18,_binary '\0'),(241,'2022-12-09',13,18,_binary '\0'),(242,'2022-12-10',13,18,_binary '\0'),(243,'2022-12-11',13,18,_binary '\0'),(244,'2022-12-12',13,18,_binary '\0'),(245,'2022-12-13',13,18,_binary '\0');
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
  PRIMARY KEY (`SlotId`)
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventscheduletimeslots`
--

LOCK TABLES `tbl_eventscheduletimeslots` WRITE;
/*!40000 ALTER TABLE `tbl_eventscheduletimeslots` DISABLE KEYS */;
INSERT INTO `tbl_eventscheduletimeslots` VALUES (25,'11:00 AM',_binary '\0',3,3,9),(26,'01:00 PM',_binary '\0',3,3,9),(27,'04:00 PM',_binary '\0',3,3,9),(28,'11:00 AM',_binary '\0',3,3,10),(29,'01:00 PM',_binary '\0',3,3,10),(30,'04:00 PM',_binary '\0',3,3,10),(31,'11:00 AM',_binary '\0',3,3,11),(32,'01:00 PM',_binary '\0',3,3,11),(33,'04:00 PM',_binary '\0',3,3,11),(34,'11:00 AM',_binary '\0',3,3,12),(35,'01:00 PM',_binary '\0',3,3,12),(36,'04:00 PM',_binary '\0',3,3,12),(37,'08:50 AM',_binary '\0',5,4,13),(38,'05:10 PM',_binary '\0',5,4,13),(39,'08:50 AM',_binary '\0',5,4,14),(40,'05:10 PM',_binary '\0',5,4,14),(41,'08:50 AM',_binary '\0',5,4,15),(42,'05:10 PM',_binary '\0',5,4,15),(43,'10:00 AM',_binary '\0',3,5,16),(44,'10:00 AM',_binary '\0',3,5,17),(45,'10:00 AM',_binary '\0',3,5,18),(46,'10:00 AM',_binary '\0',3,5,19),(47,'10:00 AM',_binary '\0',3,5,20),(48,'10:00 AM',_binary '\0',3,5,21),(49,'03:00 PM',_binary '\0',2,6,22),(50,'03:00 PM',_binary '\0',2,6,23),(51,'03:00 PM',_binary '\0',2,6,24),(52,'03:00 PM',_binary '\0',2,6,25),(53,'11:10 AM',_binary '\0',6,7,26),(54,'05:40 PM',_binary '\0',6,7,26),(55,'11:10 AM',_binary '\0',6,7,27),(56,'05:40 PM',_binary '\0',6,7,27),(57,'11:10 AM',_binary '\0',6,7,28),(58,'05:40 PM',_binary '\0',6,7,28),(59,'11:10 AM',_binary '\0',6,7,29),(60,'05:40 PM',_binary '\0',6,7,29),(61,'11:10 AM',_binary '\0',6,7,30),(62,'05:40 PM',_binary '\0',6,7,30),(63,'11:10 AM',_binary '\0',6,7,31),(64,'05:40 PM',_binary '\0',6,7,31),(65,'11:10 AM',_binary '\0',6,7,32),(66,'05:40 PM',_binary '\0',6,7,32),(67,'11:10 AM',_binary '\0',6,7,33),(68,'05:40 PM',_binary '\0',6,7,33),(69,'11:10 AM',_binary '\0',6,7,34),(70,'05:40 PM',_binary '\0',6,7,34),(71,'01:00 PM',_binary '\0',5,8,35),(72,'07:14 AM',_binary '\0',5,8,35),(73,'01:00 PM',_binary '\0',5,8,36),(74,'07:14 AM',_binary '\0',5,8,36),(75,'01:00 PM',_binary '\0',5,8,37),(76,'07:14 AM',_binary '\0',5,8,37),(77,'01:00 PM',_binary '\0',5,8,38),(78,'07:14 AM',_binary '\0',5,8,38),(79,'01:00 PM',_binary '\0',5,8,39),(80,'07:14 AM',_binary '\0',5,8,39),(81,'01:00 PM',_binary '\0',5,8,40),(82,'07:14 AM',_binary '\0',5,8,40),(83,'01:00 PM',_binary '\0',5,8,41),(84,'07:14 AM',_binary '\0',5,8,41),(85,'01:00 PM',_binary '\0',5,8,42),(86,'07:14 AM',_binary '\0',5,8,42),(87,'01:00 PM',_binary '\0',5,8,43),(88,'07:14 AM',_binary '\0',5,8,43),(89,'08:00 AM',_binary '\0',3,9,44),(90,'08:00 AM',_binary '\0',3,9,45),(91,'08:00 AM',_binary '\0',3,9,46),(92,'08:00 AM',_binary '\0',3,9,47),(93,'08:00 AM',_binary '\0',3,9,48),(94,'08:00 AM',_binary '\0',3,9,49),(95,'08:00 AM',_binary '\0',3,9,50),(96,'08:00 AM',_binary '\0',3,9,51),(97,'08:00 AM',_binary '\0',3,9,52),(98,'09:15 AM',_binary '\0',2,10,53),(99,'09:15 AM',_binary '\0',2,10,54),(100,'09:15 AM',_binary '\0',2,10,55),(101,'09:15 AM',_binary '\0',2,10,56),(102,'09:15 AM',_binary '\0',2,10,57),(103,'09:15 AM',_binary '\0',2,10,58),(104,'09:15 AM',_binary '\0',2,10,59),(105,'09:15 AM',_binary '\0',2,10,60),(106,'09:15 AM',_binary '\0',2,10,61),(137,'Invalid date',_binary '\0',6,11,77),(138,'Invalid date',_binary '\0',6,11,77),(139,'10:20 AM',_binary '\0',1,12,78),(140,'08:00 PM',_binary '\0',1,12,78),(141,'10:20 AM',_binary '\0',1,12,79),(142,'08:00 PM',_binary '\0',1,12,79),(143,'10:20 AM',_binary '\0',1,12,80),(144,'08:00 PM',_binary '\0',1,12,80),(145,'10:20 AM',_binary '\0',1,12,81),(146,'08:00 PM',_binary '\0',1,12,81),(147,'10:20 AM',_binary '\0',1,12,82),(148,'08:00 PM',_binary '\0',1,12,82),(149,'10:20 AM',_binary '\0',1,12,83),(150,'08:00 PM',_binary '\0',1,12,83),(151,'10:20 AM',_binary '\0',1,12,84),(152,'08:00 PM',_binary '\0',1,12,84),(153,'10:20 AM',_binary '\0',1,12,85),(154,'08:00 PM',_binary '\0',1,12,85),(155,'10:20 AM',_binary '\0',1,12,86),(156,'08:00 PM',_binary '\0',1,12,86),(157,'10:20 AM',_binary '\0',1,12,87),(158,'08:00 PM',_binary '\0',1,12,87),(159,'10:20 AM',_binary '\0',1,12,88),(160,'08:00 PM',_binary '\0',1,12,88),(161,'10:20 AM',_binary '\0',1,12,89),(162,'08:00 PM',_binary '\0',1,12,89),(163,'10:20 AM',_binary '\0',1,12,90),(164,'08:00 PM',_binary '\0',1,12,90),(165,'10:20 AM',_binary '\0',1,12,91),(166,'08:00 PM',_binary '\0',1,12,91),(167,'10:20 AM',_binary '\0',1,12,92),(168,'08:00 PM',_binary '\0',1,12,92),(169,'10:20 AM',_binary '\0',1,12,93),(170,'08:00 PM',_binary '\0',1,12,93),(171,'09:30 AM',_binary '\0',10,13,94),(172,'07:40 PM',_binary '\0',10,13,94),(173,'09:30 AM',_binary '\0',10,13,95),(174,'07:40 PM',_binary '\0',10,13,95),(175,'09:30 AM',_binary '\0',10,13,96),(176,'07:40 PM',_binary '\0',10,13,96),(177,'09:30 AM',_binary '\0',10,13,97),(178,'07:40 PM',_binary '\0',10,13,97),(179,'09:30 AM',_binary '\0',10,13,98),(180,'07:40 PM',_binary '\0',10,13,98),(181,'09:30 AM',_binary '\0',10,13,99),(182,'07:40 PM',_binary '\0',10,13,99),(183,'09:30 AM',_binary '\0',10,13,100),(184,'07:40 PM',_binary '\0',10,13,100),(185,'09:30 AM',_binary '\0',10,13,101),(186,'07:40 PM',_binary '\0',10,13,101),(187,'09:30 AM',_binary '\0',10,13,102),(188,'07:40 PM',_binary '\0',10,13,102),(189,'09:30 AM',_binary '\0',10,13,103),(190,'07:40 PM',_binary '\0',10,13,103),(191,'09:30 AM',_binary '\0',10,13,104),(192,'07:40 PM',_binary '\0',10,13,104),(193,'09:30 AM',_binary '\0',10,13,105),(194,'07:40 PM',_binary '\0',10,13,105),(195,'09:30 AM',_binary '\0',10,13,106),(196,'07:40 PM',_binary '\0',10,13,106),(197,'09:30 AM',_binary '\0',10,13,107),(198,'07:40 PM',_binary '\0',10,13,107),(199,'09:30 AM',_binary '\0',10,13,108),(200,'07:40 PM',_binary '\0',10,13,108),(201,'09:30 AM',_binary '\0',10,13,109),(202,'07:40 PM',_binary '\0',10,13,109),(203,'05:00 PM',_binary '\0',11,14,110),(204,'05:00 PM',_binary '\0',11,14,111),(205,'05:00 PM',_binary '\0',11,14,112),(206,'05:00 PM',_binary '\0',11,14,113),(207,'05:00 PM',_binary '\0',11,14,114),(208,'05:00 PM',_binary '\0',11,14,115),(209,'05:00 PM',_binary '\0',11,14,116),(210,'05:00 PM',_binary '\0',11,14,117),(211,'05:00 PM',_binary '\0',11,14,118),(212,'05:00 PM',_binary '\0',11,14,119),(213,'05:00 PM',_binary '\0',11,14,120),(214,'05:00 PM',_binary '\0',11,14,121),(215,'05:00 PM',_binary '\0',11,14,122),(216,'05:00 PM',_binary '\0',11,14,123),(217,'05:00 PM',_binary '\0',11,14,124),(218,'03:15 PM',_binary '\0',5,15,125),(219,'03:15 PM',_binary '\0',5,15,126),(220,'03:15 PM',_binary '\0',5,15,127),(221,'03:15 PM',_binary '\0',5,15,128),(222,'03:15 PM',_binary '\0',5,15,129),(223,'03:15 PM',_binary '\0',5,15,130),(224,'03:15 PM',_binary '\0',5,15,131),(225,'03:15 PM',_binary '\0',5,15,132),(226,'03:15 PM',_binary '\0',5,15,133),(227,'03:15 PM',_binary '\0',5,15,134),(228,'03:15 PM',_binary '\0',5,15,135),(229,'03:15 PM',_binary '\0',5,15,136),(230,'03:15 PM',_binary '\0',5,15,137),(231,'03:15 PM',_binary '\0',5,15,138),(232,'03:15 PM',_binary '\0',5,15,139),(233,'12:35 PM',_binary '\0',2,16,140),(234,'12:35 PM',_binary '\0',2,16,141),(235,'12:35 PM',_binary '\0',2,16,142),(236,'12:35 PM',_binary '\0',2,16,143),(237,'12:35 PM',_binary '\0',2,16,144),(238,'12:35 PM',_binary '\0',2,16,145),(239,'12:35 PM',_binary '\0',2,16,146),(240,'12:35 PM',_binary '\0',2,16,147),(241,'12:35 PM',_binary '\0',2,16,148),(242,'12:35 PM',_binary '\0',2,16,149),(243,'12:35 PM',_binary '\0',2,16,150),(244,'12:35 PM',_binary '\0',2,16,151),(245,'12:35 PM',_binary '\0',2,16,152),(246,'12:35 PM',_binary '\0',2,16,153),(247,'12:35 PM',_binary '\0',2,16,154),(248,'02:00 PM',_binary '\0',6,17,155),(249,'02:00 PM',_binary '\0',6,17,156),(250,'02:00 PM',_binary '\0',6,17,157),(251,'02:00 PM',_binary '\0',6,17,158),(252,'02:00 PM',_binary '\0',6,17,159),(253,'02:00 PM',_binary '\0',6,17,160),(254,'02:00 PM',_binary '\0',6,17,161),(255,'02:00 PM',_binary '\0',6,17,162),(256,'02:00 PM',_binary '\0',6,17,163),(257,'02:00 PM',_binary '\0',6,17,164),(258,'02:00 PM',_binary '\0',6,17,165),(259,'02:00 PM',_binary '\0',6,17,166),(260,'02:00 PM',_binary '\0',6,17,167),(261,'02:00 PM',_binary '\0',6,17,168),(262,'02:00 PM',_binary '\0',6,17,169),(278,'10:00 AM',_binary '\0',14,19,182),(279,'10:00 AM',_binary '\0',14,19,183),(280,'10:00 AM',_binary '\0',14,19,184),(281,'10:00 AM',_binary '\0',14,19,185),(282,'10:00 AM',_binary '\0',14,19,186),(283,'10:00 AM',_binary '\0',14,19,187),(284,'10:00 AM',_binary '\0',14,19,188),(285,'10:00 AM',_binary '\0',14,19,189),(286,'10:00 AM',_binary '\0',2,2,197),(287,'05:00 PM',_binary '\0',2,2,197),(288,'10:00 AM',_binary '\0',2,2,198),(289,'05:00 PM',_binary '\0',2,2,198),(290,'10:00 AM',_binary '\0',2,2,199),(291,'05:00 PM',_binary '\0',2,2,199),(292,'10:00 AM',_binary '\0',2,2,200),(293,'05:00 PM',_binary '\0',2,2,200),(294,'10:00 AM',_binary '\0',2,2,201),(295,'05:00 PM',_binary '\0',2,2,201),(311,'05:00 AM',_binary '\0',1,1,213),(312,'05:00 AM',_binary '\0',1,1,214),(313,'05:00 AM',_binary '\0',1,1,215),(314,'05:00 AM',_binary '\0',1,1,216),(315,'05:00 AM',_binary '\0',1,1,217),(323,'02:30 PM',_binary '\0',15,20,225),(324,'02:30 PM',_binary '\0',15,20,226),(325,'02:30 PM',_binary '\0',15,20,227),(326,'02:30 PM',_binary '\0',15,20,228),(327,'02:30 PM',_binary '\0',15,20,229),(328,'02:30 PM',_binary '\0',15,20,230),(329,'02:30 PM',_binary '\0',15,20,231),(330,'04:00 PM',_binary '\0',16,21,232),(331,'04:00 PM',_binary '\0',16,21,233),(332,'04:00 PM',_binary '\0',16,21,234),(333,'04:00 PM',_binary '\0',16,21,235),(334,'04:00 PM',_binary '\0',16,21,236),(335,'04:00 PM',_binary '\0',16,21,237),(336,'04:00 PM',_binary '\0',16,21,238),(337,'03:31 PM',_binary '\0',13,18,239),(338,'03:31 PM',_binary '\0',13,18,240),(339,'03:31 PM',_binary '\0',13,18,241),(340,'03:31 PM',_binary '\0',13,18,242),(341,'03:31 PM',_binary '\0',13,18,243),(342,'03:31 PM',_binary '\0',13,18,244),(343,'03:31 PM',_binary '\0',13,18,245);
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
  `CardNumber` int NOT NULL,
  `ExpiryDate` varchar(20) NOT NULL,
  `Cvv` smallint NOT NULL,
  `BookingId` int DEFAULT NULL,
  PRIMARY KEY (`PaymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payment`
--

LOCK TABLES `tbl_payment` WRITE;
/*!40000 ALTER TABLE `tbl_payment` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'Vincent','Xavier','admin@gmail.com','root','8526073314',1),(2,'Damien','Peter','peter@gmail.com','peter@123','8526056465',2),(3,'Vincent','Xavier','vincent@gmail.com','vincent@123','9999999999',2),(4,'Vincent','Xavier','vincent@gmail.com','vincent@123','9999999999',2),(5,'test','test','vincent@gmail.com',NULL,'8526073314',2),(6,'vincent','xavier','vincent@gmail.com',NULL,'8526073314',2),(7,'vincent','xavier','vincent@gmail.com',NULL,'8526073314',2),(8,'Peter','Anandh','peter@gmail.com',NULL,'9638582741',2),(9,'Peter','Anandh','peter@gmail.com',NULL,'9638582741',2),(10,'Santhana ','Raj Kumar','kumar@gmail.com',NULL,'7418361921',2),(11,'Santhana ','Raj Kumar','kumar@gmail.com',NULL,'7418361921',2),(12,'Santhana ','Raj Kumar','kumar@gmail.com',NULL,'7418361921',2),(13,'kirthik','sk','sk@gmail.com',NULL,'9876543128',2),(14,'kirthik','sk','kirthik@gmail.com',NULL,'9868646498',2),(15,'test','test','test@gmail.com',NULL,'9879879879',2),(16,'Vincent','Xavier','vincent@gmail.com',NULL,'8526073314',2),(17,'Damien','Peter','peter@gmail.com',NULL,'9875461152',2),(18,'Sherlin','Jessy','jessykutty@gmail.com',NULL,'8779867856',2),(19,'testing','testing','testing@gmail.com',NULL,'9898756456',2),(20,'Santhana ','nivas','nivas@gmail.com',NULL,'9798654564',2),(21,'leo','shawlin','leo@gmail.com',NULL,'9879987546',2),(22,'test','tset','adsasd@gdfs.com',NULL,'8479879864',2),(23,'bosco','soft','bosco@gmail.com',NULL,'9685631453',2),(24,'john ','brito','john@gmail.com',NULL,'8',2),(25,'Vincent','Xavier','signis@gmail.com',NULL,'9894626687',2),(26,'First Name','fghbfcvbgv','signis@gmail.com',NULL,'9894626687',2),(27,'Santhana ','Raj Kumar','kumar@gmail.com',NULL,'85260733',2),(28,'vincent','Vincent','vincent@gmail.com',NULL,'87798678',2),(29,'Santhana ','nivas','test@gmail.com',NULL,'98765431',2),(30,'vincent','xavier','VINCENT@GMAIL.COM',NULL,'96385827',2),(31,'Denis','Sylvester','denissyl@gmail.com',NULL,'9894656673',2),(32,'Denis','Sylvester','denissyl@gmail.com',NULL,'94656673',2),(33,'damien','peter','peter@gmail.com',NULL,'8526073314',2),(34,'boscosoft','Technologies','bosco@gmail.com',NULL,'9632587415',2);
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
/*!50003 DROP PROCEDURE IF EXISTS `test_UserNames` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `test_UserNames`(in pUserName varchar(45), OUT returnval int)
BEGIN
		DECLARE NewId int Default	0; 
			IF exists(SELECT Id FROM test_usernames where name = pUserName) THEN
        BEGIN
			set NewId := (SELECT id FROM test_usernames where name = pUserName);
            delete from test_usernames where id = NewId;
            Insert into test_usernames (`name`) values ( pUserName);
			set	returnval = last_insert_id();
        
			-- SET NewId := (SELECT Id FROM test_usernames where name = pUserName);
			-- DELETE FROM test_usernames where name = pUserName;
        END;
        END IF;
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
	SELECT eb.BookingId, e.eventName,e.price, eb.BookingId, eb.Guests, eb.TotalPrice, eb.EventTime, Eb.EventDate, e.EventName FROM `tbl_eventbooking` eb LEFT JOIN tbl_events e on e.EventId = eb.EventId where eb.BookingId = id;
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
	SELECT eb.BookingId, e.eventName,e.price, eb.BookingId, eb.Guests, eb.TotalPrice, eb.EventTime, Eb.EventDate, e.EventName FROM `tbl_eventbooking` eb LEFT JOIN tbl_events e on e.EventId = eb.EventId;
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
		SELECT st.SlotId, sd.Date, e.EventName, e.Price, e.EventCapacity, e.Min_Booking, e.Max_Booking,
			e.EventImage, st.Time, s.Bookings ,s.Available FROM tbl_events e
			LEFT JOIN ( SELECT eb.EventId,sum(Guests) AS Bookings, e.eventcapacity - sum(Guests)  AS Available
						FROM `zipline`.`tbl_eventbooking` eb
						LEFT JOIN tbl_events e ON e.eventId = eb.eventId
						GROUP BY eb.eventId
					  ) s ON e.EventId = s.EventId
			LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
			LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
			LEFT JOIN tbl_eventscheduletimeslots st ON sd.ScheduleId = st.ScheduleId AND sd.DateId = st.DateId
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
		SELECT  sd.Date, e.EventName, e.EventDiscription, e.Price, e.EventCapacity, e.Min_Booking, e.Max_Booking,
		e.EventImage, st.Time,s.Bookings, s.Available, e.EventId, es.ScheduleId, sd.DateId, st.SlotId FROM tbl_events e
		LEFT JOIN ( SELECT eb.EventId,sum(Guests) AS Bookings, e.eventcapacity - sum(Guests)  AS Available
					FROM `zipline`.`tbl_eventbooking` eb
					LEFT JOIN tbl_events e ON e.eventId = eb.eventId
					GROUP BY eb.eventId
				  ) s ON e.EventId = s.EventId
		LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
		LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
		LEFT JOIN tbl_eventscheduletimeslots st ON sd.ScheduleId = st.ScheduleId AND sd.DateId = st.DateId
		WHERE st.SlotId = id AND e.IsDeleted = 0 AND e.IsActive = 0 AND es.IsDeleted = 0 AND sd.IsDeleted = 0 AND st.IsDeleted = 0;
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
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_RemoveScheduleDateAndTime`(IN pEventId INT,IN pScheduleId INT)
BEGIN
		IF EXISTS(SELECT * FROM tbl_eventscheduledates WHERE EventId = pEventId AND ScheduleId = pScheduleId) THEN
			BEGIN
				SET SQL_SAFE_UPDATES = 0;
					DELETE FROM tbl_eventscheduledates WHERE EventId = pEventId AND ScheduleId = pScheduleId ;
					DELETE FROM tbl_eventscheduletimeslots WHERE EventId = pEventId AND ScheduleId = pScheduleId ;
				SET SQL_SAFE_UPDATES = 1;
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

	INSERT INTO tbl_eventscheduletimeslots (`Time`, `EventId`, `ScheduleId`, `DateId`) VALUES (ScheduleTime, eId, SId, dId);
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

-- Dump completed on 2022-12-09 18:59:10
