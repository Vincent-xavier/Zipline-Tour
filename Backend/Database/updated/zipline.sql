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
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `allValues` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` (`Id`, `allValues`) VALUES (1,'damien'),(2,'peter'),(3,'kirthik'),(4,'anandh'),(5,'selvam'),(6,'dani'),(7,'kannan'),(8,'damien'),(9,'peter'),(10,'kirthik'),(11,'anandh'),(12,'selvam'),(13,'dani'),(14,'kannan'),(15,'1');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventbooking`
--

LOCK TABLES `tbl_eventbooking` WRITE;
/*!40000 ALTER TABLE `tbl_eventbooking` DISABLE KEYS */;
INSERT INTO `tbl_eventbooking` (`BookingId`, `UserId`, `EventId`, `ScheduleId`, `DateId`, `SlotId`, `Guests`, `TotalPrice`, `EventTime`, `EventDate`, `PaymentStatus`) VALUES (1,16,3,5,21,48,1,65.00,'10:00 AM','2022-11-22',0),(2,17,5,4,15,41,4,200.00,'08:50 AM','2022-11-18',0),(3,18,3,9,47,92,4,260.00,'08:00 AM','2022-11-24',0),(4,19,6,7,29,60,5,175.00,'05:40 PM','2022-11-24',0),(5,20,5,8,43,88,3,150.00,'07:14 AM','2022-11-29',0),(6,21,5,8,43,88,7,350.00,'07:14 AM','2022-11-29',0),(7,22,3,9,48,93,1,65.00,'08:00 AM','2022-11-25',0),(8,23,3,9,48,93,1,65.00,'08:00 AM','2022-11-25',0),(9,24,5,8,39,80,1,50.00,'07:14 AM','2022-11-25',0),(10,25,5,8,39,79,1,50.00,'01:00 PM','2022-11-25',0),(11,26,5,8,39,79,3,150.00,'01:00 PM','2022-11-25',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_events`
--

LOCK TABLES `tbl_events` WRITE;
/*!40000 ALTER TABLE `tbl_events` DISABLE KEYS */;
INSERT INTO `tbl_events` (`EventId`, `EventName`, `EventDiscription`, `Price`, `EventCapacity`, `Min_Booking`, `Max_Booking`, `EventImage`, `IsDeleted`, `IsActive`) VALUES (1,'capacity count change','This one-of-a-kind overnight Treehouse stay includes a set of eco tours with fourteen ziplines, two spiral staircases, eight sky bridges, and a rappel back down to the forest floor.',95.00,25,1,5,'event-img220718196.jpg',_binary '\0',_binary '\0'),(2,'Don\'t look back','Enjoy ur ride but please don\'t look down  until you finish the game',60.00,15,1,3,'Zip_line-2220837277.jpg',_binary '\0',_binary '\0'),(3,'Zambezi River','Ziplining over the Zambezi River is available year-round so there really is no excuse not to give it a go!',65.00,20,1,6,'Zip_line-4222949966.jpg',_binary '\0',_binary '\0'),(5,'Flying Baba Adventure','Enjoy one of the longest zipline of India, 930 meters long zipline over with flyingbaba,enjoy the scenic view of the sahyadri mountains',50.00,22,1,4,'Zip_line-3222212927.jpg',_binary '\0',_binary '\0'),(6,'Swing into the Semester Zipline Event','The Carolina Adventures Challenge Course invites you to swing your way into the new semester with us! Soar through the sky on our Giant Swing, and take an exhilarating ride down our 1,200 ft. Tandem Zipline!',35.00,12,2,2,'zipline_7223120581.jfif',_binary '\0',_binary '\0'),(8,'Zipline','test',60.00,26,5,1,'test.jpg',_binary '\0',_binary '\0'),(9,'Zipline','test test',60.00,26,5,1,'',_binary '\0',_binary '\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventschedule`
--

LOCK TABLES `tbl_eventschedule` WRITE;
/*!40000 ALTER TABLE `tbl_eventschedule` DISABLE KEYS */;
INSERT INTO `tbl_eventschedule` (`ScheduleId`, `Name`, `DateFrom`, `DateTo`, `Times`, `IsDeleted`, `EventId`) VALUES (1,'Zipline','2022-11-11','2022-11-15','11:00 AM,01:00 PM,04:00 PM',_binary '\0',1),(2,'Zipline','2022-11-11','2022-11-15','11:00 AM,01:00 PM,04:00 PM',_binary '\0',2),(3,'Zipline','2022-11-11','2022-11-15','11:00 AM,01:00 PM,04:00 PM',_binary '\0',3),(4,'zipline','2022-11-16','2022-11-18','08:50 AM,05:10 PM',_binary '\0',5),(5,'Daily','2022-11-17','2022-11-22','10:00 AM',_binary '\0',3),(6,'Evening Only','2022-11-17','2022-11-20','03:00 PM',_binary '\0',2),(7,'Special Event','2022-11-21','2022-11-29','11:10 AM,05:40 PM',_binary '\0',6),(8,'Reschedule','2022-11-21','2022-11-29','01:00 PM,07:14 AM',_binary '\0',5),(9,'Reschedule','2022-11-21','2022-11-29','08:00 AM',_binary '\0',3),(10,'Every Morning','2022-11-21','2022-11-29','09:15 AM',_binary '\0',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventscheduledates`
--

LOCK TABLES `tbl_eventscheduledates` WRITE;
/*!40000 ALTER TABLE `tbl_eventscheduledates` DISABLE KEYS */;
INSERT INTO `tbl_eventscheduledates` (`DateId`, `Date`, `EventId`, `ScheduleId`, `IsDeleted`) VALUES (1,'2022-11-11',1,1,_binary '\0'),(2,'2022-11-12',1,1,_binary '\0'),(3,'2022-11-13',1,1,_binary '\0'),(4,'2022-11-14',1,1,_binary '\0'),(5,'2022-11-11',2,2,_binary '\0'),(6,'2022-11-12',2,2,_binary '\0'),(7,'2022-11-13',2,2,_binary '\0'),(8,'2022-11-14',2,2,_binary '\0'),(9,'2022-11-11',3,3,_binary '\0'),(10,'2022-11-12',3,3,_binary '\0'),(11,'2022-11-13',3,3,_binary '\0'),(12,'2022-11-14',3,3,_binary '\0'),(13,'2022-11-16',5,4,_binary '\0'),(14,'2022-11-17',5,4,_binary '\0'),(15,'2022-11-18',5,4,_binary '\0'),(16,'2022-11-17',3,5,_binary '\0'),(17,'2022-11-18',3,5,_binary '\0'),(18,'2022-11-19',3,5,_binary '\0'),(19,'2022-11-20',3,5,_binary '\0'),(20,'2022-11-21',3,5,_binary '\0'),(21,'2022-11-22',3,5,_binary '\0'),(22,'2022-11-17',2,6,_binary '\0'),(23,'2022-11-18',2,6,_binary '\0'),(24,'2022-11-19',2,6,_binary '\0'),(25,'2022-11-20',2,6,_binary '\0'),(26,'2022-11-21',6,7,_binary '\0'),(27,'2022-11-22',6,7,_binary '\0'),(28,'2022-11-23',6,7,_binary '\0'),(29,'2022-11-24',6,7,_binary '\0'),(30,'2022-11-25',6,7,_binary '\0'),(31,'2022-11-26',6,7,_binary '\0'),(32,'2022-11-27',6,7,_binary '\0'),(33,'2022-11-28',6,7,_binary '\0'),(34,'2022-11-29',6,7,_binary '\0'),(35,'2022-11-21',5,8,_binary '\0'),(36,'2022-11-22',5,8,_binary '\0'),(37,'2022-11-23',5,8,_binary '\0'),(38,'2022-11-24',5,8,_binary '\0'),(39,'2022-11-25',5,8,_binary '\0'),(40,'2022-11-26',5,8,_binary '\0'),(41,'2022-11-27',5,8,_binary '\0'),(42,'2022-11-28',5,8,_binary '\0'),(43,'2022-11-29',5,8,_binary '\0'),(44,'2022-11-21',3,9,_binary '\0'),(45,'2022-11-22',3,9,_binary '\0'),(46,'2022-11-23',3,9,_binary '\0'),(47,'2022-11-24',3,9,_binary '\0'),(48,'2022-11-25',3,9,_binary '\0'),(49,'2022-11-26',3,9,_binary '\0'),(50,'2022-11-27',3,9,_binary '\0'),(51,'2022-11-28',3,9,_binary '\0'),(52,'2022-11-29',3,9,_binary '\0'),(53,'2022-11-21',2,10,_binary '\0'),(54,'2022-11-22',2,10,_binary '\0'),(55,'2022-11-23',2,10,_binary '\0'),(56,'2022-11-24',2,10,_binary '\0'),(57,'2022-11-25',2,10,_binary '\0'),(58,'2022-11-26',2,10,_binary '\0'),(59,'2022-11-27',2,10,_binary '\0'),(60,'2022-11-28',2,10,_binary '\0'),(61,'2022-11-29',2,10,_binary '\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventscheduletimeslots`
--

LOCK TABLES `tbl_eventscheduletimeslots` WRITE;
/*!40000 ALTER TABLE `tbl_eventscheduletimeslots` DISABLE KEYS */;
INSERT INTO `tbl_eventscheduletimeslots` (`SlotId`, `Time`, `IsDeleted`, `EventId`, `ScheduleId`, `DateId`) VALUES (1,'11:00 AM',_binary '\0',1,1,1),(2,'01:00 PM',_binary '\0',1,1,1),(3,'04:00 PM',_binary '\0',1,1,1),(4,'11:00 AM',_binary '\0',1,1,2),(5,'01:00 PM',_binary '\0',1,1,2),(6,'04:00 PM',_binary '\0',1,1,2),(7,'11:00 AM',_binary '\0',1,1,3),(8,'01:00 PM',_binary '\0',1,1,3),(9,'04:00 PM',_binary '\0',1,1,3),(10,'11:00 AM',_binary '\0',1,1,4),(11,'01:00 PM',_binary '\0',1,1,4),(12,'04:00 PM',_binary '\0',1,1,4),(13,'11:00 AM',_binary '\0',2,2,5),(14,'01:00 PM',_binary '\0',2,2,5),(15,'04:00 PM',_binary '\0',2,2,5),(16,'11:00 AM',_binary '\0',2,2,6),(17,'01:00 PM',_binary '\0',2,2,6),(18,'04:00 PM',_binary '\0',2,2,6),(19,'11:00 AM',_binary '\0',2,2,7),(20,'01:00 PM',_binary '\0',2,2,7),(21,'04:00 PM',_binary '\0',2,2,7),(22,'11:00 AM',_binary '\0',2,2,8),(23,'01:00 PM',_binary '\0',2,2,8),(24,'04:00 PM',_binary '\0',2,2,8),(25,'11:00 AM',_binary '\0',3,3,9),(26,'01:00 PM',_binary '\0',3,3,9),(27,'04:00 PM',_binary '\0',3,3,9),(28,'11:00 AM',_binary '\0',3,3,10),(29,'01:00 PM',_binary '\0',3,3,10),(30,'04:00 PM',_binary '\0',3,3,10),(31,'11:00 AM',_binary '\0',3,3,11),(32,'01:00 PM',_binary '\0',3,3,11),(33,'04:00 PM',_binary '\0',3,3,11),(34,'11:00 AM',_binary '\0',3,3,12),(35,'01:00 PM',_binary '\0',3,3,12),(36,'04:00 PM',_binary '\0',3,3,12),(37,'08:50 AM',_binary '\0',5,4,13),(38,'05:10 PM',_binary '\0',5,4,13),(39,'08:50 AM',_binary '\0',5,4,14),(40,'05:10 PM',_binary '\0',5,4,14),(41,'08:50 AM',_binary '\0',5,4,15),(42,'05:10 PM',_binary '\0',5,4,15),(43,'10:00 AM',_binary '\0',3,5,16),(44,'10:00 AM',_binary '\0',3,5,17),(45,'10:00 AM',_binary '\0',3,5,18),(46,'10:00 AM',_binary '\0',3,5,19),(47,'10:00 AM',_binary '\0',3,5,20),(48,'10:00 AM',_binary '\0',3,5,21),(49,'03:00 PM',_binary '\0',2,6,22),(50,'03:00 PM',_binary '\0',2,6,23),(51,'03:00 PM',_binary '\0',2,6,24),(52,'03:00 PM',_binary '\0',2,6,25),(53,'11:10 AM',_binary '\0',6,7,26),(54,'05:40 PM',_binary '\0',6,7,26),(55,'11:10 AM',_binary '\0',6,7,27),(56,'05:40 PM',_binary '\0',6,7,27),(57,'11:10 AM',_binary '\0',6,7,28),(58,'05:40 PM',_binary '\0',6,7,28),(59,'11:10 AM',_binary '\0',6,7,29),(60,'05:40 PM',_binary '\0',6,7,29),(61,'11:10 AM',_binary '\0',6,7,30),(62,'05:40 PM',_binary '\0',6,7,30),(63,'11:10 AM',_binary '\0',6,7,31),(64,'05:40 PM',_binary '\0',6,7,31),(65,'11:10 AM',_binary '\0',6,7,32),(66,'05:40 PM',_binary '\0',6,7,32),(67,'11:10 AM',_binary '\0',6,7,33),(68,'05:40 PM',_binary '\0',6,7,33),(69,'11:10 AM',_binary '\0',6,7,34),(70,'05:40 PM',_binary '\0',6,7,34),(71,'01:00 PM',_binary '\0',5,8,35),(72,'07:14 AM',_binary '\0',5,8,35),(73,'01:00 PM',_binary '\0',5,8,36),(74,'07:14 AM',_binary '\0',5,8,36),(75,'01:00 PM',_binary '\0',5,8,37),(76,'07:14 AM',_binary '\0',5,8,37),(77,'01:00 PM',_binary '\0',5,8,38),(78,'07:14 AM',_binary '\0',5,8,38),(79,'01:00 PM',_binary '\0',5,8,39),(80,'07:14 AM',_binary '\0',5,8,39),(81,'01:00 PM',_binary '\0',5,8,40),(82,'07:14 AM',_binary '\0',5,8,40),(83,'01:00 PM',_binary '\0',5,8,41),(84,'07:14 AM',_binary '\0',5,8,41),(85,'01:00 PM',_binary '\0',5,8,42),(86,'07:14 AM',_binary '\0',5,8,42),(87,'01:00 PM',_binary '\0',5,8,43),(88,'07:14 AM',_binary '\0',5,8,43),(89,'08:00 AM',_binary '\0',3,9,44),(90,'08:00 AM',_binary '\0',3,9,45),(91,'08:00 AM',_binary '\0',3,9,46),(92,'08:00 AM',_binary '\0',3,9,47),(93,'08:00 AM',_binary '\0',3,9,48),(94,'08:00 AM',_binary '\0',3,9,49),(95,'08:00 AM',_binary '\0',3,9,50),(96,'08:00 AM',_binary '\0',3,9,51),(97,'08:00 AM',_binary '\0',3,9,52),(98,'09:15 AM',_binary '\0',2,10,53),(99,'09:15 AM',_binary '\0',2,10,54),(100,'09:15 AM',_binary '\0',2,10,55),(101,'09:15 AM',_binary '\0',2,10,56),(102,'09:15 AM',_binary '\0',2,10,57),(103,'09:15 AM',_binary '\0',2,10,58),(104,'09:15 AM',_binary '\0',2,10,59),(105,'09:15 AM',_binary '\0',2,10,60),(106,'09:15 AM',_binary '\0',2,10,61);
/*!40000 ALTER TABLE `tbl_eventscheduletimeslots` ENABLE KEYS */;
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
INSERT INTO `tbl_rollbase` (`RollId`, `Roll`) VALUES (1,'Admin'),(2,'User');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` (`UserId`, `FirstName`, `LastName`, `Email`, `Password`, `Phone`, `Roll`) VALUES (1,'Vincent','Xavier','admin@gmail.com','root','8526073314',1),(2,'Damien','Peter','peter@gmail.com','peter@123','8526056465',2),(3,'Vincent','Xavier','vincent@gmail.com','vincent@123','9999999999',2),(4,'Vincent','Xavier','vincent@gmail.com','vincent@123','9999999999',2),(5,'test','test','vincent@gmail.com',NULL,'8526073314',2),(6,'vincent','xavier','vincent@gmail.com',NULL,'8526073314',2),(7,'vincent','xavier','vincent@gmail.com',NULL,'8526073314',2),(8,'Peter','Anandh','peter@gmail.com',NULL,'9638582741',2),(9,'Peter','Anandh','peter@gmail.com',NULL,'9638582741',2),(10,'Santhana ','Raj Kumar','kumar@gmail.com',NULL,'7418361921',2),(11,'Santhana ','Raj Kumar','kumar@gmail.com',NULL,'7418361921',2),(12,'Santhana ','Raj Kumar','kumar@gmail.com',NULL,'7418361921',2),(13,'kirthik','sk','sk@gmail.com',NULL,'9876543128',2),(14,'kirthik','sk','kirthik@gmail.com',NULL,'9868646498',2),(15,'test','test','test@gmail.com',NULL,'9879879879',2),(16,'Vincent','Xavier','vincent@gmail.com',NULL,'8526073314',2),(17,'Damien','Peter','peter@gmail.com',NULL,'9875461152',2),(18,'Sherlin','Jessy','jessykutty@gmail.com',NULL,'8779867856',2),(19,'testing','testing','testing@gmail.com',NULL,'9898756456',2),(20,'Santhana ','nivas','nivas@gmail.com',NULL,'9798654564',2),(21,'leo','shawlin','leo@gmail.com',NULL,'9879987546',2),(22,'test','tset','adsasd@gdfs.com',NULL,'8479879864',2),(23,'bosco','soft','bosco@gmail.com',NULL,'9685631453',2),(24,'john ','brito','john@gmail.com',NULL,'8',2),(25,'Vincent','Xavier','signis@gmail.com',NULL,'9894626687',2),(26,'First Name','fghbfcvbgv','signis@gmail.com',NULL,'9894626687',2);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'zipline'
--

--
-- Dumping routines for database 'zipline'
--
/*!50003 DROP PROCEDURE IF EXISTS `Bookingdetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `Bookingdetails`()
BEGIN
	SELECT eb.BookingId, e.eventName,e.price, eb.BookingId, eb.Guests, eb.TotalPrice, eb.EventTime, Eb.EventDate, e.EventName FROM `tbl_eventbooking` eb LEFT JOIN tbl_events e on e.EventId = eb.EventId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bookingdetailsId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `bookingdetailsId`(in id int)
BEGIN
	SELECT eb.BookingId, e.eventName,e.price, eb.BookingId, eb.Guests, eb.TotalPrice, eb.EventTime, Eb.EventDate, e.EventName FROM `tbl_eventbooking` eb LEFT JOIN tbl_events e on e.EventId = eb.EventId where eb.BookingId = id;
    
    SELECT  u.FirstName, u.LastName, u.Email, u.Phone FROM `tbl_eventbooking` eb LEFT JOIN tbl_user u on u.UserId = eb.userId where eb.BookingId = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eventDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `eventDetails`()
BEGIN
SELECT `EventId`,
    `EventName`,
    `EventDiscription`,
    `Price`,
    `EventCapacity`,
    `Min_Booking`,
    `Max_Booking`,
    `EventImage`
FROM  tbl_events WHERE IsDeleted = 0 AND IsActive = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eventdetailsId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `eventdetailsId`(in eId int)
BEGIN
SELECT EventId, EventName, EventDiscription, Price, EventCapacity, Min_Booking, Max_Booking, EventImage FROM zipline.tbl_events WHERE EventId = eId AND IsDeleted = 0 AND IsActive = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getallevents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `getallevents`()
BEGIN
SELECT dayname(sd.Date) AS DayName,  DATE_FORMAT(sd.Date,'%M %d %Y') AS FullDate, e.eventId,
es.ScheduleId,sd.DateId,st.SlotId, e.EventName, e.EventDiscription, e.Price, 
e.EventCapacity, e.Min_Booking, e.Max_Booking, e.EventImage, es.Name, sd.Date,
cast(STR_TO_DATE(st.time, '%h:%i %p')as datetime) AS times
FROM tbl_events e 
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
/*!50003 DROP PROCEDURE IF EXISTS `Getdatesbetweentwodays` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `Getdatesbetweentwodays`(
in DateFrom date,
in DateTo date,
in evantId int,
in scheduleId int
)
BEGIN
INSERT INTO `zipline`.`eventscheduledates`
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
/*!50003 DROP PROCEDURE IF EXISTS `geteventId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `geteventId`(in id int )
BEGIN
SELECT e.eventId, es.ScheduleId,sd.DateId,st.SlotId, e.EventName, e.EventDiscription, e.Price, 
e.EventCapacity, e.Min_Booking, e.Max_Booking, e.EventImage, es.Name, sd.Date, cast(STR_TO_DATE(st.time, '%h:%i %p')as datetime) AS times, dayname(sd.Date) AS DayName,  DATE_FORMAT(sd.Date,'%M %d %Y') AS FullDate FROM tbl_events e 
LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
LEFT JOIN tbl_eventscheduletimeslots st ON sd.ScheduleId = st.ScheduleId AND sd.DateId = st.DateId
WHERE st.SlotId = id AND e.IsDeleted = 0 AND
 e.IsActive = 0 AND es.IsDeleted = 0 AND sd.IsDeleted = 0 AND st.IsDeleted = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getevents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `getevents`()
BEGIN
SELECT dayname(sd.Date) AS DayName,  DATE_FORMAT(sd.Date,'%M %d %Y') AS FullDate, e.eventId,
es.ScheduleId,sd.DateId,st.SlotId, e.EventName, e.EventDiscription, e.Price, 
e.EventCapacity, e.Min_Booking, e.Max_Booking, e.EventImage, es.Name, sd.Date, cast(STR_TO_DATE(st.time, '%h:%i %p')as datetime) AS times FROM tbl_events e 
LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
LEFT JOIN tbl_eventscheduletimeslots st ON sd.ScheduleId = st.ScheduleId and sd.DateId = st.DateId
where e.IsDeleted = 0 and e.IsActive = 0 AND es.IsDeleted = 0 AND sd.IsDeleted = 0 AND st.IsDeleted = 0 AND sd.Date >= curdate()
ORDER BY sd.Date,times;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getScheduledetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `getScheduledetails`(in id int)
BEGIN
SELECT	`EventId`,
		`ScheduleId`,
		`Name`,
		CAST(`DateFrom` AS DATE) AS DateFrom ,
		CAST(`DateTo` AS DATE) AS DateTo,
		`Times`
FROM `tbl_eventschedule` WHERE EventId = id AND IsDeleted = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `getUser`()
BEGIN
select u.UserId,u.FirstName,u.LastName,Email,u.password,u.phone,r.Roll as UserRole from tbl_user u
join tbl_rollbase r on r.RollId = u.Roll;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `login`(
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
/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `new_procedure`(
in DateFrom date,
in DateTo date,
in evantId int,
in scheduleId int
)
BEGIN
INSERT INTO `zipline`.`eventscheduledates`
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
/*!50003 DROP PROCEDURE IF EXISTS `Saveevent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `Saveevent`(
in eId int,
in eName varchar(150),
in minBook int,
in maxBook int,
in eImg varchar(255),
in price decimal(18,2),
in eCapacity int,
in eDiscri varchar(255),
out returnVal int
)
BEGIN
	IF eId = 0 THEN
        insert into tbl_events(`EventName`, `EventDiscription`,Price,EventCapacity, Min_Booking, Max_Booking, `EventImage` )
		value (eName, eDiscri, price,eCapacity, minBook, maxBook, eImg);
		set returnVal = LAST_INSERT_ID();
        else 
        update tbl_events set EventName = eName, EventDiscription = eDiscri, Price = price, EventCapacity=eCapacity, Min_Booking = minBook, Max_Booking = maxBook, EventImage = eImg  where EventId = eId;
        set returnVal = eId;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveeventbooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `saveeventbooking`(
in firstname varchar(70),in lastname varchar(70),in email varchar(255), in phone varchar(50),
in eventid  int,in scheduleid  int,in dateid  int,in slotid  int,in guest int,in totalprice decimal(18,2),
in eventtime varchar(15), eventdate date, out returnVal int 
)
BEGIN
	DECLARE userid int default 0 ;
		INSERT INTO `tbl_user`(`FirstName`,`LastName`,`Email`,`Phone`)
			VALUES (firstname,lastname,email,phone);
	set userid = last_insert_id();
		INSERT INTO `tbl_eventbooking`(`UserId`,`EventId`,`ScheduleId`,`DateId`,`SlotId`,
												 `Guests`,`TotalPrice`,`EventTime`,`EventDate`)
		VALUES (userid,eventid,scheduleid,dateid,slotid,guest,totalprice,eventtime,eventdate);
        
	set returnVal = last_insert_id();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveEventdates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `saveEventdates`(in singleDate datetime,in eid int,in sid int,out dateId int)
BEGIN
		INSERT INTO `tbl_eventscheduledates`
(`Date`,
`EventId`,
`ScheduleId`)
VALUES
(singleDate,eid,sid);
	set dateId = last_insert_id();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveEventschedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `saveEventschedule`(in ScheduleId int,in Name varchar(100),in DateFrom datetime,in DateTo datetime,in Times varchar(255),in EventId int,out returnVal int)
BEGIN
		DECLARE newScheduleId int default 0;  
	IF ScheduleId = 0 THEN
			INSERT INTO tbl_eventschedule(`Name`,`DateFrom`,`DateTo`,`Times`,`EventId`)
			VALUE (Name, DateFrom, DateTo, Times, EventId);
			set returnVal = LAST_INSERT_ID();
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveTimeslot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `saveTimeslot`(in ScheduleTime varchar(15),in eId int, in sId int,in dId int)
BEGIN
INSERT INTO `zipline`.`tbl_eventscheduletimeslots`
(`Time`,
`EventId`,
`ScheduleId`,
`DateId`)
VALUES
(ScheduleTime,eId,SId,dId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `splitString` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `splitString`(
  IN inputString text,
  IN delimiterChar CHAR(1)
)
BEGIN
  DROP TEMPORARY TABLE IF EXISTS temp_string;
  CREATE TEMPORARY TABLE temp_string(vals text); 
  WHILE LOCATE(delimiterChar,inputString) > 1 DO
    INSERT INTO temp_string SELECT SUBSTRING_INDEX(inputString,delimiterChar,1);
    SET inputString = REPLACE(inputString, (SELECT LEFT(inputString, LOCATE(delimiterChar, inputString))),'');
  END WHILE;
  INSERT INTO temp_string(vals) VALUES(inputString);
  SELECT TRIM(vals) FROM temp_string;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SplitString` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `SP_SplitString`(Value longtext)
BEGIN
    DECLARE front TEXT DEFAULT NULL;
    DECLARE frontlen INT DEFAULT NULL;
    DECLARE TempValue TEXT DEFAULT NULL;
    set @start =  last_insert_id();
         select @start;
    iterator:
		LOOP  
		IF LENGTH(TRIM(Value)) = 0 OR Value IS NULL THEN
		LEAVE iterator;
		END IF;
		SET front = SUBSTRING_INDEX(Value,',',1);
		SET frontlen = LENGTH(front);
		SET TempValue = TRIM(front);
		INSERT INTO store (allValues) VALUES (TempValue);
		SET Value = INSERT(Value,1,frontlen + 1,'');
    END LOOP;
    set @end = last_insert_id();
    select	@start as StartingDate, @end as EndingDate ;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test_MultipleTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `test_MultipleTable`()
BEGIN
SELECT sd.Date
FROM tbl_events e 
LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
LEFT JOIN tbl_eventscheduletimeslots st ON sd.ScheduleId = st.ScheduleId AND sd.DateId = st.DateId
WHERE e.IsDeleted = 0 AND e.IsActive = 0 AND es.IsDeleted = 0 AND sd.IsDeleted = 0 AND st.IsDeleted = 0 AND sd.Date >= curdate()
group by sd.Date
ORDER BY sd.Date,times;

SELECT st.SlotId, sd.Date, e.EventName,e.Price,e.EventCapacity, e.Min_Booking, e.Max_Booking, e.EventImage,
CAST(CAST(STR_TO_DATE(st.time, '%h:%i %p') as time) AS CHAR) AS orderbyTime, st.Time
FROM tbl_events e 
LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
LEFT JOIN tbl_eventscheduletimeslots st ON sd.ScheduleId = st.ScheduleId AND sd.DateId = st.DateId
WHERE e.IsDeleted = 0 AND e.IsActive = 0 AND es.IsDeleted = 0 AND sd.IsDeleted = 0 AND st.IsDeleted = 0 AND sd.Date >= curdate()
ORDER BY sd.Date,orderbyTime;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test_returnArray` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `test_returnArray`()
BEGIN
DROP TEMPORARY TABLE IF EXISTS `blah`;
   CREATE TEMPORARY TABLE `blah` ( num INT );
   SET @x := 1; 
   WHILE @x<13 DO 
      INSERT INTO blah (num)
      SELECT COUNT(work.workType) 
      FROM work 
      WHERE year(workDate)=yearInput 
            AND work.technicianID = id 
            AND month(workDate)= @x
      ; 
      SET @x := @x+1; 
   END WHILE; 
   SELECT * FROM blah;
   DROP TEMPORARY TABLE blah;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test_saveEventSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `test_saveEventSchedule`(in singleDate datetime,in eid int,in sid int,out dateId int)
BEGIN
		INSERT INTO `tbl_eventscheduledates`
(`Date`,
`EventId`,
`ScheduleId`)
VALUES
(singleDate,eid,sid);
	set dateId = last_insert_id();
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-28 10:12:28
