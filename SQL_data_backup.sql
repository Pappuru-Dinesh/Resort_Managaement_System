CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: project
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
-- Temporary view structure for view `available_utilities`
--

DROP TABLE IF EXISTS `available_utilities`;
/*!50001 DROP VIEW IF EXISTS `available_utilities`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `available_utilities` AS SELECT 
 1 AS `utility_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `customer_id` int NOT NULL,
  `bill` int NOT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (12,1000),(13,1500),(14,1200),(15,900),(17,600),(18,980),(19,500),(20,1400),(21,2000),(22,500);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `meal_plan_id` int DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `room_id` (`room_id`),
  KEY `booking_ibfk_2` (`customer_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (2,12,1,'2022-01-01 00:00:00','2022-04-04 00:00:00',11),(12,13,1,'2022-03-05 00:00:00','2022-03-07 00:00:00',22),(13,14,2,'2022-04-02 00:00:00','2022-04-06 00:00:00',13),(14,15,8,'2022-05-02 00:00:00','2022-05-07 00:00:00',13),(15,17,5,'2022-06-02 00:00:00','2022-06-05 00:00:00',NULL),(16,18,3,'2022-07-02 00:00:00','2022-07-04 00:00:00',NULL),(17,19,4,'2022-08-02 00:00:00','2022-08-08 00:00:00',15),(18,20,8,'2022-09-02 00:00:00','2022-09-05 00:00:00',19),(19,21,8,'2022-09-02 00:00:00','2022-09-08 00:00:00',19),(20,22,9,'2022-09-07 00:00:00','2022-09-15 00:00:00',18);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` char(20) NOT NULL,
  `last_name` char(20) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `contact` bigint NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `contact_UNIQUE` (`contact`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (12,'Zenia','Shah','Boston',1234567890,'2022-01-01 00:00:00'),(13,'John','Lopez','Florida',5567891256,'2022-03-05 00:00:00'),(14,'Robert','Gonzalez','Boston',6567891287,'2022-04-02 00:00:00'),(15,'Michael','Wilson','New York',7567891288,'2022-05-02 00:00:00'),(17,'William','Anderson','Boston',8567891299,'2022-06-02 00:00:00'),(18,'David','Thomas','Boston',9567891254,'2022-07-02 00:00:00'),(19,'Rosy','Taylor','Boston',1567891243,'2022-08-02 00:00:00'),(20,'Richard','Harris','Boston',2567891233,'2022-09-02 00:00:00'),(21,'Laila','Perez','Boston',3567891222,'2022-09-02 00:00:00'),(22,'Majnu','yen','New York',5678901234,'2022-09-07 00:00:00');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_booking_on_customer` AFTER INSERT ON `customer` FOR EACH ROW begin
		declare temp int;
        set @temp = (select MAX(customer_id) from customer);
		insert into booking(customer_id) values (@temp);       
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `resort_id` int DEFAULT NULL,
  `dep_name` varchar(20) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  KEY `resort_id` (`resort_id`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`resort_id`) REFERENCES `resort` (`resort_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,1,'Laundry','Washing clothes'),(2,1,'Room Service','Delivering service in room'),(3,1,'Reception','Welcome customers'),(4,1,'Security','Security'),(5,1,'Bell Boy','Luggage service'),(6,1,'IT Department','Tech Service'),(7,1,'Kitchen','Managing meals'),(8,1,'Vallet','Parking'),(9,1,'HR ','Employee Management'),(10,1,'Bar','Drink Service');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int NOT NULL,
  `salary` int NOT NULL,
  `department_id` int NOT NULL,
  `mobile_no` bigint NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Rose Mary',30,50000,1,6173131234),(2,'Mark White',35,50000,1,6173135678),(3,'Mary Flores',28,60000,2,6273131234),(4,'James Smith',25,60000,2,6273135678),(5,'Patricia Green',29,65000,3,6373131234),(6,'Robert Johnson',36,65000,3,6373135678),(7,'Jennifer Adams',40,65000,4,6473131234),(8,'John Williams',36,65000,4,6473135678),(9,'Linda Nelson',32,58000,5,6573131234),(10,'Michael Brown',34,58000,5,6573135678),(11,'Elizabeth Baker',26,80000,6,6673131234),(12,'David Jones',31,80000,6,6673135678),(13,'Barbara Hall',41,85000,7,6773131234),(14,'William Garcia',35,85000,7,6773135678),(15,'Susan Rivera',45,55000,8,6873131234),(16,'Richard Miller',43,55000,8,6873135678),(17,'Jessica Campbell',28,60000,9,6973131234),(18,'Joseph Davis',26,60000,9,6973135678),(19,'Sarah Mitchell',36,70000,10,6073131234),(20,'Thomas Rodriguez',38,70000,10,6073135678);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employee_info`
--

DROP TABLE IF EXISTS `employee_info`;
/*!50001 DROP VIEW IF EXISTS `employee_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_info` AS SELECT 
 1 AS `name`,
 1 AS `age`,
 1 AS `mobile_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `customer_id` int NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `feedback` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (12,4.0,NULL),(13,5.0,NULL),(14,4.5,NULL),(15,3.8,NULL),(17,4.5,NULL),(18,5.0,NULL),(19,4.8,NULL),(20,5.0,NULL),(21,3.9,NULL),(22,4.0,NULL);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_plan`
--

DROP TABLE IF EXISTS `meal_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal_plan` (
  `meal_plan_id` int NOT NULL AUTO_INCREMENT,
  `resort_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `cost` int NOT NULL,
  PRIMARY KEY (`meal_plan_id`),
  KEY `resort_id` (`resort_id`),
  CONSTRAINT `meal_plan_ibfk_1` FOREIGN KEY (`resort_id`) REFERENCES `resort` (`resort_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_plan`
--

LOCK TABLES `meal_plan` WRITE;
/*!40000 ALTER TABLE `meal_plan` DISABLE KEYS */;
INSERT INTO `meal_plan` VALUES (11,1,'Breakfast','Selection of two item',40),(12,1,'Lunch','Selection of Platter ',60),(13,1,'Dinner','Selection of Platter ',60),(14,1,'BreakFast, Lunch','Selection of Platter on Breakfast and Lunch',90),(15,1,'BreakFast, Dinner','Selection of Platter on Breakfast and Dinner',90),(16,1,'Lunch, Dinner','Selection of Platter on Lunch and Dinner',110),(17,1,'Breakfast Buffet','Unlimited',80),(18,1,'Lunch Buffet','Unlimited',120),(19,1,'Dinner Buffet','Unlimited',120),(20,1,'BreakFast, Lunch Buffet','Unlimited',180),(21,1,'BreakFast, Dinner Buffet','Unlimited',180),(22,1,'Lunch, Dinner Buffet','Unlimited',200);
/*!40000 ALTER TABLE `meal_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `contact` bigint NOT NULL,
  `discount` int NOT NULL,
  PRIMARY KEY (`contact`),
  CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`contact`) REFERENCES `customer` (`contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` VALUES (1234567890,10),(1567891243,5),(2567891233,5),(3567891222,10),(5567891256,15),(5678901234,5),(6567891287,10),(7567891288,10);
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resort`
--

DROP TABLE IF EXISTS `resort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resort` (
  `resort_id` int NOT NULL AUTO_INCREMENT,
  `resort_name` varchar(20) NOT NULL,
  `location` varchar(50) NOT NULL,
  `contact_info` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  PRIMARY KEY (`resort_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resort`
--

LOCK TABLES `resort` WRITE;
/*!40000 ALTER TABLE `resort` DISABLE KEYS */;
INSERT INTO `resort` VALUES (1,'Beach View Resort','Miami',1234567890,5);
/*!40000 ALTER TABLE `resort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_status`
--

DROP TABLE IF EXISTS `room_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_status` (
  `room_id` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`room_id`),
  CONSTRAINT `room_status_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_status`
--

LOCK TABLES `room_status` WRITE;
/*!40000 ALTER TABLE `room_status` DISABLE KEYS */;
INSERT INTO `room_status` VALUES (1,1),(2,0),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1);
/*!40000 ALTER TABLE `room_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type` (
  `room_id` int NOT NULL,
  `room_type` varchar(20) NOT NULL,
  `discount_percent` int NOT NULL,
  `smoke_friendly` tinyint(1) NOT NULL DEFAULT '1',
  `pet_friendly` tinyint(1) NOT NULL DEFAULT '1',
  `cost` int NOT NULL,
  PRIMARY KEY (`room_id`),
  CONSTRAINT `room_type_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
INSERT INTO `room_type` VALUES (1,'Single',5,0,0,500),(2,'Single',5,0,0,500),(3,'Double',6,0,0,700),(4,'Double',6,0,0,700),(5,'Double',6,0,0,700),(6,'Deluxe',10,1,1,1000),(7,'Deluxe',10,1,1,1000),(8,'Deluxe',10,1,1,1000),(9,'Super Deluxe',15,1,1,1500),(10,'Super Deluxe',15,1,1,1500);
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_no` int NOT NULL,
  `room_id` int NOT NULL AUTO_INCREMENT,
  `resort_id` int NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `resort_id` (`resort_id`),
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`resort_id`) REFERENCES `resort` (`resort_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (101,1,1),(102,2,1),(103,3,1),(104,4,1),(105,5,1),(201,6,1),(202,7,1),(203,8,1),(204,9,1),(205,10,1);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilities`
--

DROP TABLE IF EXISTS `utilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilities` (
  `utility_id` int NOT NULL AUTO_INCREMENT,
  `resort_id` int NOT NULL,
  `utility_name` varchar(20) NOT NULL,
  `decription` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`utility_id`),
  KEY `resort_id` (`resort_id`),
  CONSTRAINT `utilities_ibfk_1` FOREIGN KEY (`resort_id`) REFERENCES `resort` (`resort_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilities`
--

LOCK TABLES `utilities` WRITE;
/*!40000 ALTER TABLE `utilities` DISABLE KEYS */;
INSERT INTO `utilities` VALUES (1,1,'Game Room','Indoor games',1),(2,1,'Free Wifi','Wifi',1),(3,1,'Mini-Fridge','Cooling',1),(4,1,'Gym','Exercise',1),(5,1,'Laundry Services','Washing',1),(6,1,'Pool','Swimming',0),(7,1,'Meeting Rooms','Meetings',1),(8,1,'Spa','Relaxation',0),(9,1,'Champagne Bar','Drinks',1),(10,1,'Entertainment','Movies, Games',1),(11,1,'Outdoor Games','Outdoor games',1);
/*!40000 ALTER TABLE `utilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'project'
--
/*!50003 DROP FUNCTION IF EXISTS `bill_amount_after_discount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `bill_amount_after_discount`(cont bigint) RETURNS int
    DETERMINISTIC
begin
	declare discounted_bill int;
    select (b.bill - ((m.discount/100)* b.bill)) into discounted_bill
    from membership m, customer c, bill b 
    where m.contact = c.contact and
		  c.customer_id = b.customer_id and
          m.contact = cont;
	return discounted_bill;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `peak_time_of_the_year` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `peak_time_of_the_year`() RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
begin
	declare month varchar(20);
	select monthname(check_in) into month
	from booking
	group by Month(check_in) 
	order by Month(check_in) desc
	limit 1;    
	return month;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `room_availibity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `room_availibity`(room_number int) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
begin
	declare status int;
    declare output varchar(20);
    select rs.status into status
    from rooms r, room_status rs
    where r.room_id = rs.room_id and
		  r. room_no = room_number;    
          
	if status = 1 then
		set output = 'Available';
    else    
		set output = 'Not Available';
	end if;
    return output;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_department_employees` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_department_employees`( in dept_name varchar(20))
begin
	select d.dep_name, count(e.employee_id) as no_of_employees
    from department d, employee e
    where d.department_id = e.department_id and d.dep_name = dept_name
    group by e.department_id;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_membership_discount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_membership_discount`(in contact_number bigint)
begin
	select first_name, last_name, discount
		from customer c, membership m
        where c.contact = m.contact and
			  m.contact = contact_number;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_most_used_meal_plan_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_most_used_meal_plan_details`()
begin
	select m.name, m.cost
    from booking b, meal_plan m
    where b.meal_plan_id = m.meal_plan_id
    group by b.meal_plan_id
    order by b.meal_plan_id desc
    limit 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `available_utilities`
--

/*!50001 DROP VIEW IF EXISTS `available_utilities`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `available_utilities` AS select `utilities`.`utility_name` AS `utility_name` from `utilities` where (`utilities`.`status` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_info`
--

/*!50001 DROP VIEW IF EXISTS `employee_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_info` AS select `employee`.`name` AS `name`,`employee`.`age` AS `age`,`employee`.`mobile_no` AS `mobile_no` from `employee` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-01 16:57:34
