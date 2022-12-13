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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `Min_Booking` int DEFAULT NULL,
  `Max_Booking` int DEFAULT NULL,
  `EventImage` varchar(255) DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT b'0',
  `IsActive` bit(1) DEFAULT b'0',
  PRIMARY KEY (`EventId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'zipline'
--

--
-- Dumping routines for database 'zipline'
--
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
			
            SELECT * FROM test_usernames where id = returnval;
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
    SELECT u.UserId, u.FirstName, u.LastName, u.Email, u.Phone FROM `tbl_eventbooking` eb LEFT JOIN tbl_user u on u.UserId = eb.userId where eb.BookingId = id;
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
	SELECT EventId, EventName, EventDiscription, Price, Min_Booking, Max_Booking, EventImage
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
SELECT EventId, EventName, EventDiscription, Price,  Min_Booking, Max_Booking, EventImage FROM zipline.tbl_events WHERE EventId = eId AND IsDeleted = 0 AND IsActive = 0;
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
		SELECT e.EventId, st.SlotId, st.EventCapacity, es.ScheduleId, sd.DateId,  sd.Date, e.EventName, e.Price, e.Min_Booking, e.Max_Booking,
			e.EventImage, st.Time, s.Bookings, s.Available FROM tbl_events e
			LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
			LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
			LEFT JOIN tbl_eventscheduletimeslots st ON sd.ScheduleId = st.ScheduleId AND sd.DateId = st.DateId
            			LEFT JOIN ( SELECT st.SlotId,  sum(eb.Guests) AS Bookings, st.EventCapacity - sum(eb.Guests)  AS Available
						FROM `zipline`.`tbl_eventbooking` eb
						LEFT JOIN tbl_eventscheduletimeslots st ON st.SlotId = eb.SlotId
						GROUP BY eb.SlotId
					  ) s ON s.SlotId = st.SlotId
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
		SELECT  sd.Date, e.EventName, e.EventDiscription, e.Price, st.EventCapacity, e.Min_Booking,
        e.Max_Booking, e.EventImage, st.Time,s.Bookings, s.Available, e.EventId, es.ScheduleId,
        sd.DateId, st.SlotId FROM tbl_events e
		LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
		LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
		LEFT JOIN tbl_eventscheduletimeslots st ON sd.ScheduleId = st.ScheduleId AND sd.DateId = st.DateId
			LEFT JOIN ( SELECT st.SlotId,  sum(eb.Guests) AS Bookings, st.EventCapacity - sum(eb.Guests)  AS Available
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
CREATE DEFINER=`sjc`@`%` PROCEDURE `usp_Event_RemoveScheduleDateAndTime`(IN pEventId INT, IN pScheduleId INT)
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
in eDiscri varchar(255),
out returnVal int
)
BEGIN
	IF eId = 0 THEN
		BEGIN
			INSERT INTO tbl_events(`EventName`, `EventDiscription`, Price,  Min_Booking, Max_Booking, `EventImage` )
			VALUE (eName, eDiscri, e_price, minBook, maxBook, eImg);
			SET returnVal = LAST_INSERT_ID();
		END;
	ELSE
		BEGIN
			UPDATE tbl_events SET EventName = eName, EventDiscription = eDiscri, Price = e_price, Min_Booking = minBook, Max_Booking = maxBook, EventImage = eImg  WHERE EventId = eId;
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

-- Dump completed on 2022-12-13 19:31:16
