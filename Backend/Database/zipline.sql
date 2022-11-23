CREATE DATABASE  IF NOT EXISTS `zipline` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `zipline`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 192.168.1.7    Database: zipline
-- ------------------------------------------------------
-- Server version	8.0.30

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
INSERT INTO `store` VALUES (1,'damien'),(2,'peter'),(3,'kirthik'),(4,'anandh'),(5,'selvam'),(6,'dani'),(7,'kannan'),(8,'damien'),(9,'peter'),(10,'kirthik'),(11,'anandh'),(12,'selvam'),(13,'dani'),(14,'kannan'),(15,'1');
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
  `EventTime` datetime DEFAULT NULL,
  `EventDate` date DEFAULT NULL,
  `PaymentStatus` int DEFAULT '0',
  PRIMARY KEY (`BookingId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventbooking`
--

LOCK TABLES `tbl_eventbooking` WRITE;
/*!40000 ALTER TABLE `tbl_eventbooking` DISABLE KEYS */;
INSERT INTO `tbl_eventbooking` VALUES (1,5,2,4,5,8,3,180.00,'2022-11-14 13:46:13','2022-11-14',0),(2,7,3,3,9,25,1,65.00,'2022-11-15 11:00:00','2022-11-11',0),(3,9,2,2,5,13,3,180.00,'2022-11-15 11:00:00','2022-11-11',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_events`
--

LOCK TABLES `tbl_events` WRITE;
/*!40000 ALTER TABLE `tbl_events` DISABLE KEYS */;
INSERT INTO `tbl_events` VALUES (1,'capacity count change','This one-of-a-kind overnight Treehouse stay includes a set of eco tours with fourteen ziplines, two spiral staircases, eight sky bridges, and a rappel back down to the forest floor.',95.00,25,1,5,'event-img220718196.jpg',_binary '\0',_binary '\0'),(2,'Don\'t look back','Enjoy ur ride but please don\'t look down  until you finish the game',60.00,15,1,3,'Zip_line-2220837277.jpg',_binary '\0',_binary '\0'),(3,'Zambezi River','Ziplining over the Zambezi River is available year-round so there really is no excuse not to give it a go!',65.00,20,1,6,'Zip_line-4222949966.jpg',_binary '\0',_binary '\0'),(5,'Flying Baba Adventure','Enjoy one of the longest zipline of India, 930 meters long zipline over with flyingbaba,enjoy the scenic view of the sahyadri mountains',50.00,NULL,1,4,'Zip_line-3222212927.jpg',_binary '\0',_binary '\0');
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
  `DateFrom` datetime DEFAULT NULL,
  `DateTo` datetime DEFAULT NULL,
  `Times` varchar(255) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `EventId` int DEFAULT NULL,
  PRIMARY KEY (`ScheduleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventschedule`
--

LOCK TABLES `tbl_eventschedule` WRITE;
/*!40000 ALTER TABLE `tbl_eventschedule` DISABLE KEYS */;
INSERT INTO `tbl_eventschedule` VALUES (1,'Zipline','2022-11-11 00:00:00','2022-11-15 00:00:00','11:00 AM,01:00 PM,04:00 PM',_binary '\0',1),(2,'Zipline','2022-11-11 00:00:00','2022-11-15 00:00:00','11:00 AM,01:00 PM,04:00 PM',_binary '\0',2),(3,'Zipline','2022-11-11 00:00:00','2022-11-15 00:00:00','11:00 AM,01:00 PM,04:00 PM',_binary '\0',3);
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
  `Date` datetime DEFAULT NULL,
  `EventId` int DEFAULT NULL,
  `ScheduleId` bigint DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`DateId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventscheduledates`
--

LOCK TABLES `tbl_eventscheduledates` WRITE;
/*!40000 ALTER TABLE `tbl_eventscheduledates` DISABLE KEYS */;
INSERT INTO `tbl_eventscheduledates` VALUES (1,'2022-11-11 00:00:00',1,1,_binary '\0'),(2,'2022-11-12 00:00:00',1,1,_binary '\0'),(3,'2022-11-13 00:00:00',1,1,_binary '\0'),(4,'2022-11-14 00:00:00',1,1,_binary '\0'),(5,'2022-11-11 00:00:00',2,2,_binary '\0'),(6,'2022-11-12 00:00:00',2,2,_binary '\0'),(7,'2022-11-13 00:00:00',2,2,_binary '\0'),(8,'2022-11-14 00:00:00',2,2,_binary '\0'),(9,'2022-11-11 00:00:00',3,3,_binary '\0'),(10,'2022-11-12 00:00:00',3,3,_binary '\0'),(11,'2022-11-13 00:00:00',3,3,_binary '\0'),(12,'2022-11-14 00:00:00',3,3,_binary '\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventscheduletimeslots`
--

LOCK TABLES `tbl_eventscheduletimeslots` WRITE;
/*!40000 ALTER TABLE `tbl_eventscheduletimeslots` DISABLE KEYS */;
INSERT INTO `tbl_eventscheduletimeslots` VALUES (1,'11:00 AM',_binary '\0',1,1,1),(2,'01:00 PM',_binary '\0',1,1,1),(3,'04:00 PM',_binary '\0',1,1,1),(4,'11:00 AM',_binary '\0',1,1,2),(5,'01:00 PM',_binary '\0',1,1,2),(6,'04:00 PM',_binary '\0',1,1,2),(7,'11:00 AM',_binary '\0',1,1,3),(8,'01:00 PM',_binary '\0',1,1,3),(9,'04:00 PM',_binary '\0',1,1,3),(10,'11:00 AM',_binary '\0',1,1,4),(11,'01:00 PM',_binary '\0',1,1,4),(12,'04:00 PM',_binary '\0',1,1,4),(13,'11:00 AM',_binary '\0',2,2,5),(14,'01:00 PM',_binary '\0',2,2,5),(15,'04:00 PM',_binary '\0',2,2,5),(16,'11:00 AM',_binary '\0',2,2,6),(17,'01:00 PM',_binary '\0',2,2,6),(18,'04:00 PM',_binary '\0',2,2,6),(19,'11:00 AM',_binary '\0',2,2,7),(20,'01:00 PM',_binary '\0',2,2,7),(21,'04:00 PM',_binary '\0',2,2,7),(22,'11:00 AM',_binary '\0',2,2,8),(23,'01:00 PM',_binary '\0',2,2,8),(24,'04:00 PM',_binary '\0',2,2,8),(25,'11:00 AM',_binary '\0',3,3,9),(26,'01:00 PM',_binary '\0',3,3,9),(27,'04:00 PM',_binary '\0',3,3,9),(28,'11:00 AM',_binary '\0',3,3,10),(29,'01:00 PM',_binary '\0',3,3,10),(30,'04:00 PM',_binary '\0',3,3,10),(31,'11:00 AM',_binary '\0',3,3,11),(32,'01:00 PM',_binary '\0',3,3,11),(33,'04:00 PM',_binary '\0',3,3,11),(34,'11:00 AM',_binary '\0',3,3,12),(35,'01:00 PM',_binary '\0',3,3,12),(36,'04:00 PM',_binary '\0',3,3,12);
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
INSERT INTO `tbl_user` VALUES (1,'Vincent','Xavier','admin@gmail.com','root','8526073314',1),(2,'Damien','Peter','peter@gmail.com','peter@123','8526056465',2),(3,'Vincent','Xavier','vincent@gmail.com','vincent@123','9999999999',2),(4,'Vincent','Xavier','vincent@gmail.com','vincent@123','9999999999',2),(5,'test','test','vincent@gmail.com',NULL,'8526073314',2),(6,'vincent','xavier','vincent@gmail.com',NULL,'8526073314',2),(7,'vincent','xavier','vincent@gmail.com',NULL,'8526073314',2),(8,'Peter','Anandh','peter@gmail.com',NULL,'9638582741',2),(9,'Peter','Anandh','peter@gmail.com',NULL,'9638582741',2);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'zipline'
--

--
-- Dumping routines for database 'zipline'
--
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
/*!50003 DROP PROCEDURE IF EXISTS `test_SaveTimeSolt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `test_SaveTimeSolt`(in ScheduleTime varchar(15),in eId int, in sId int,in dId int)
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
/*!50003 DROP PROCEDURE IF EXISTS `usp_EventDetailsById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_EventDetailsById`(in eventId int)
BEGIN
SELECT `EventId`,
    `EventName`,
    `EventDiscription`,
    `Price`,
    `EventCapacity`,
    `Min_Booking`,
    `Max_Booking`,
    `EventImage`
FROM  tbl_events WHERE EventId = eventId AND IsDeleted = 0 AND IsActive = 0;
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
SELECT e.eventId, es.ScheduleId,sd.DateId,st.SlotId, e.EventName, e.EventDiscription, e.Price, 
e.EventCapacity, e.Min_Booking, e.Max_Booking, e.EventImage, es.Name, sd.Date, st.time,dayname(sd.Date) AS DayName,  DATE_FORMAT(sd.Date,'%M %d %Y') AS FullDate FROM tbl_events e 
LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
LEFT JOIN tbl_eventscheduletimeslots st ON sd.ScheduleId = st.ScheduleId and sd.DateId = st.DateId
where e.EventId = id AND e.IsDeleted = 0 and e.IsActive = 0 AND es.IsDeleted = 0 AND sd.IsDeleted = 0 AND st.IsDeleted = 0
ORDER BY Date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Event_GetEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_GetEvents`()
BEGIN
SELECT dayname(sd.Date) AS DayName,  DATE_FORMAT(sd.Date,'%M %d %Y') AS FullDate, e.eventId, es.ScheduleId,sd.DateId,st.SlotId, e.EventName, e.EventDiscription, e.Price, 
e.EventCapacity, e.Min_Booking, e.Max_Booking, e.EventImage, es.Name, sd.Date, st.time FROM tbl_events e 
LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
LEFT JOIN tbl_eventscheduletimeslots st ON sd.ScheduleId = st.ScheduleId and sd.DateId = st.DateId
where e.IsDeleted = 0 and e.IsActive = 0 AND es.IsDeleted = 0 AND sd.IsDeleted = 0 AND st.IsDeleted = 0
ORDER BY sd.Date and st.time;
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
in eventId int,
in eName varchar(150),
in minBook int,
in maxBook int,
in eImg varchar(255),
in price decimal(18,2),
in eDiscri varchar(255),
out returnVal int
)
BEGIN
	IF eventId = 0 THEN
        insert into tbl_events(`EventName`, `EventDiscription`,Price, Min_Booking, Max_Booking, `EventImage` )
		value (eName, eDiscri, price, minBook, maxBook, eImg);
		set returnVal = LAST_INSERT_ID();
        else 
        update tbl_events set EventName = eName, EventDiscription = eDiscri, Price = price, Min_Booking = minBook, Max_Booking = maxBook, EventImage = eImg  where EventId = eventId;
        set returnVal = eventId;
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
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_SaveEventDates`(in singleDate datetime,in eid int,in sid int,out dateId int)
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
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_SaveEventSchedule`(in ScheduleId int,in Name varchar(100),in DateFrom datetime,in DateTo datetime,in Times varchar(255),in EventId int,out returnVal int)
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
/*!50003 DROP PROCEDURE IF EXISTS `usp_Event_SaveTimeSlots` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_SaveTimeSlots`(in ScheduleTime varchar(15),in eId int, in sId int,in dId int)
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
/*!50003 DROP PROCEDURE IF EXISTS `usp_Oder_SaveEventBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Oder_SaveEventBooking`(
in firstname varchar(70),in lastname varchar(70),in email varchar(255), in phone varchar(50),
in eventid  int, scheduleid  int, dateid  int, slotid  int, guest int, totalprice decimal(18,2),
in eventtime datetime, eventdate date, out returnVal int 
)
BEGIN
	DECLARE userid int default 0 ;
		INSERT INTO `tbl_user`(`FirstName`,`LastName`,`Email`,`Phone`)
			VALUES (firstname,lastname,email,phone);
	set userid = last_insert_id();
		INSERT INTO `tbl_eventbooking`(`UserId`,`EventId`,`ScheduleId`,`DateId`,`SoltId`,
												 `Guests`,`TotalPrice`,`EventTime`,`EventDate`)
		VALUES (userid,eventid,scheduleid,dateid,slotid,guest,totalprice,eventtime,eventdate);
        
	set returnVal = last_insert_id();
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
select u.UserId,u.FirstName,u.LastName,Email,u.password,u.phone,r.Roll as UserRole from tbl_user u
join tbl_rollbase r on r.RollId = u.Roll;
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
/*!50003 DROP PROCEDURE IF EXISTS `usp_User_Register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_User_Register`(
IN firstName VARCHAR(320),
IN lastName VARCHAR(60),
IN email VARCHAR(60),
IN password VARCHAR(60),
IN phone VARCHAR(60),
OUT	returnVal int
)
BEGIN
	IF returnVal IS NULL THEN
	INSERT INTO tbl_user(`FirstName`,`LastName`,`Email`,`Password`,`Phone`) VALUES (firstName,lastName,email,password,phone);
    SET returnVal = LAST_INSERT_ID();
    end if;
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

-- Dump completed on 2022-11-16 10:34:17
