-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: nurserydb
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `assigned_room`
--

DROP TABLE IF EXISTS `assigned_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assigned_room` (
  `patientRoomID` int DEFAULT NULL,
  `facultyID` int DEFAULT NULL,
  `floorNumber` int DEFAULT NULL,
  UNIQUE KEY `patientRoomID` (`patientRoomID`,`facultyID`),
  CONSTRAINT `assigned_room_ibfk_1` FOREIGN KEY (`patientRoomID`) REFERENCES `patient_room` (`patientroomID`),
  CONSTRAINT `assigned_room_chk_1` CHECK (((`floorNumber` > 0) and (`floorNumber` < 4)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned_room`
--

LOCK TABLES `assigned_room` WRITE;
/*!40000 ALTER TABLE `assigned_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `assigned_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost`
--

DROP TABLE IF EXISTS `cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cost` (
  `medication_price` float DEFAULT NULL,
  `medicationID` int DEFAULT NULL,
  `paymentID` int DEFAULT NULL,
  UNIQUE KEY `medicationID` (`medicationID`,`paymentID`),
  KEY `paymentID` (`paymentID`),
  CONSTRAINT `cost_ibfk_1` FOREIGN KEY (`medicationID`) REFERENCES `medication` (`medicationID`),
  CONSTRAINT `cost_ibfk_2` FOREIGN KEY (`paymentID`) REFERENCES `payment_system` (`paymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost`
--

LOCK TABLES `cost` WRITE;
/*!40000 ALTER TABLE `cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `facultyID` int NOT NULL,
  `facultylastName` varchar(20) DEFAULT NULL,
  `facultyTypeID` int DEFAULT NULL,
  PRIMARY KEY (`facultyID`),
  UNIQUE KEY `facultyID` (`facultyID`),
  KEY `facultyTypeID` (`facultyTypeID`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`facultyTypeID`) REFERENCES `faculty_type` (`facultyTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_type`
--

DROP TABLE IF EXISTS `faculty_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty_type` (
  `facultyTypeID` int NOT NULL,
  `facultyType` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`facultyTypeID`),
  UNIQUE KEY `facultyTypeID` (`facultyTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_type`
--

LOCK TABLES `faculty_type` WRITE;
/*!40000 ALTER TABLE `faculty_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `faculty_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication` (
  `medicationID` int NOT NULL,
  `medidactionType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`medicationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patientID` int NOT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `patientPriority` int DEFAULT NULL,
  `conditiondesc` varchar(100) DEFAULT NULL,
  `familyID` int DEFAULT NULL,
  PRIMARY KEY (`patientID`),
  UNIQUE KEY `patientID` (`patientID`),
  KEY `familyID` (`familyID`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`familyID`) REFERENCES `trusted_family` (`familyID`),
  CONSTRAINT `patient_chk_1` CHECK (((`patientPriority` > 0) and (`patientPriority` < 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_room`
--

DROP TABLE IF EXISTS `patient_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_room` (
  `patientroomID` int NOT NULL,
  `patientroomNumber` varchar(4) NOT NULL,
  `patientID` int NOT NULL,
  PRIMARY KEY (`patientroomID`),
  UNIQUE KEY `patientroomID` (`patientroomID`),
  UNIQUE KEY `patientroomID_2` (`patientroomID`,`patientID`),
  KEY `patientID` (`patientID`),
  CONSTRAINT `patient_room_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_room`
--

LOCK TABLES `patient_room` WRITE;
/*!40000 ALTER TABLE `patient_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_summary`
--

DROP TABLE IF EXISTS `payment_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_summary` (
  `paymentSumID` int NOT NULL,
  `netpayment` float DEFAULT NULL,
  `paymentID` int DEFAULT NULL,
  PRIMARY KEY (`paymentSumID`),
  KEY `paymentID` (`paymentID`),
  CONSTRAINT `payment_summary_ibfk_1` FOREIGN KEY (`paymentID`) REFERENCES `payment_system` (`paymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_summary`
--

LOCK TABLES `payment_summary` WRITE;
/*!40000 ALTER TABLE `payment_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_system`
--

DROP TABLE IF EXISTS `payment_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_system` (
  `paymentID` int NOT NULL,
  `price` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  PRIMARY KEY (`paymentID`),
  UNIQUE KEY `paymentID` (`paymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_system`
--

LOCK TABLES `payment_system` WRITE;
/*!40000 ALTER TABLE `payment_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_number`
--

DROP TABLE IF EXISTS `phone_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_number` (
  `phone_number` varchar(12) DEFAULT NULL,
  `numberID` int NOT NULL,
  PRIMARY KEY (`numberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_number`
--

LOCK TABLES `phone_number` WRITE;
/*!40000 ALTER TABLE `phone_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trusted_family`
--

DROP TABLE IF EXISTS `trusted_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trusted_family` (
  `familyID` int NOT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `phone_numberID` int DEFAULT NULL,
  PRIMARY KEY (`familyID`),
  UNIQUE KEY `familyID` (`familyID`,`lastName`),
  KEY `phone_numberID` (`phone_numberID`),
  CONSTRAINT `trusted_family_ibfk_1` FOREIGN KEY (`phone_numberID`) REFERENCES `phone_number` (`numberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trusted_family`
--

LOCK TABLES `trusted_family` WRITE;
/*!40000 ALTER TABLE `trusted_family` DISABLE KEYS */;
/*!40000 ALTER TABLE `trusted_family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_with`
--

DROP TABLE IF EXISTS `works_with`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_with` (
  `familyID` int DEFAULT NULL,
  `facultyID` int DEFAULT NULL,
  `paymentSumID` int DEFAULT NULL,
  UNIQUE KEY `facultyID` (`facultyID`,`familyID`),
  KEY `familyID` (`familyID`),
  KEY `paymentSumID` (`paymentSumID`),
  CONSTRAINT `works_with_ibfk_1` FOREIGN KEY (`familyID`) REFERENCES `trusted_family` (`familyID`),
  CONSTRAINT `works_with_ibfk_2` FOREIGN KEY (`facultyID`) REFERENCES `faculty` (`facultyID`),
  CONSTRAINT `works_with_ibfk_3` FOREIGN KEY (`paymentSumID`) REFERENCES `payment_summary` (`paymentSumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_with`
--

LOCK TABLES `works_with` WRITE;
/*!40000 ALTER TABLE `works_with` DISABLE KEYS */;
/*!40000 ALTER TABLE `works_with` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-02 18:34:39
