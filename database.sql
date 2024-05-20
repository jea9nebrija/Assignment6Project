-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: cs413
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `accounttransaction`
--

DROP TABLE IF EXISTS `accounttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounttransaction` (
  `create_date` datetime DEFAULT NULL,
  `tran_type` varchar(45) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `summary` varchar(40) DEFAULT NULL,
  `acct_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounttransaction`
--

LOCK TABLES `accounttransaction` WRITE;
/*!40000 ALTER TABLE `accounttransaction` DISABLE KEYS */;
INSERT INTO `accounttransaction` VALUES ('2024-02-20 10:01:00','deposit',500,'Rent',1),('2024-02-20 10:02:00','withdrawal',1000,'Car Payment',2),('2024-02-20 10:03:00','deposit',2000,'House Payment',3),('2024-02-20 10:04:00','withdrawal',4000,'Shopping',4),('2024-02-20 10:05:00','deposit',3000,'Vacation',5),('2024-02-20 10:06:00','withdrawal',7000,'Legal Fee',6),('2024-02-20 10:07:00','deposit',800,'Medical Insurance',7),('2024-02-20 10:08:00','withdrawal',200,'Doctor Visit',8),('2024-02-20 10:09:00','deposit',3000,'Home Goods',5),('2024-02-20 10:10:00','withdrawal',7000,'Home Improvement',6),('2024-02-20 10:11:00','deposit',800,'Car Repair',7),('2024-02-20 10:12:00','withdrawal',200,'Trekking Gear',8);
/*!40000 ALTER TABLE `accounttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `userid` varchar(40) DEFAULT NULL,
  `pwd` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('kmehta','password');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankaccount`
--

DROP TABLE IF EXISTS `bankaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankaccount` (
  `acct_num` int NOT NULL AUTO_INCREMENT,
  `cust_id` int DEFAULT NULL,
  `balance` float DEFAULT NULL,
  `create_date` varchar(40) DEFAULT NULL,
  `last_update_date` varchar(40) DEFAULT NULL,
  `acct_type` varchar(5) DEFAULT NULL,
  `od_limit` float DEFAULT NULL,
  `int_rate` float DEFAULT NULL,
  PRIMARY KEY (`acct_num`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankaccount`
--

LOCK TABLES `bankaccount` WRITE;
/*!40000 ALTER TABLE `bankaccount` DISABLE KEYS */;
INSERT INTO `bankaccount` VALUES (1,1,2500,'12-12-2021','12-12-2023','CH',2000,3.2),(2,2,3500,'12-12-2022','01-12-2024','SV',1400,2.2),(3,3,4500,'12-12-2021','12-01-2024','SV',1800,1.2),(4,4,5500,'12-12-2022','07-02-2024','SV',1700,4),(5,5,6500,'12-12-2021','08-03-2024','SV',1200,2),(6,6,7500,'12-12-2022','09-03-2023','CH',1100,1.7),(7,7,8500,'12-12-2021','10-07-2023','CH',800,1.4),(8,8,9500,'12-12-2022','12-04-2023','CH',700,2.9);
/*!40000 ALTER TABLE `bankaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankcustomer`
--

DROP TABLE IF EXISTS `bankcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankcustomer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `addressid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankcustomer`
--

LOCK TABLES `bankcustomer` WRITE;
/*!40000 ALTER TABLE `bankcustomer` DISABLE KEYS */;
INSERT INTO `bankcustomer` VALUES (1,'John','Doe','jdoe@SFSU.edu','415-555-1212','Male','07-12-1960',2),(2,'Alexander','Hamilton','ahamilton@SFSU.edu','415-555-1213','Male','08-12-1898',3),(3,'Franklin','Roosevelt','froosevelt@SFSU.edu','415-555-1214','Male','07-12-1886',4),(4,'Thomas','Jefferson','tjefferson@SFSU.edu','415-555-1215','Male','07-12-1855',5),(5,'Johnny','Appleseed','jappleseed@SFSU.edu','415-555-1313','Male','03-03-1923',6),(6,'Ben','Franklin','bfranklin@SFSU.edu','415-555-1314','Male','03-03-1912',7),(7,'Herb','Hoover','hhoover@SFSU.edu','415-555-1315','Male','03-03-1913',8),(8,'Andrew','Jackson','ajackson@SFSU.edu','415-555-1316','Male','03-03-1916',9),(9,'Sarah','Connor','sconnor@SFSU.edu','415-555-1317','Female','03-03-1917',1),(10,'Hillary','Clinton','hclinton@SFSU.edu','415-555-1320','Female','03-03-1942',2);
/*!40000 ALTER TABLE `bankcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customeraddress`
--

DROP TABLE IF EXISTS `customeraddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customeraddress` (
  `streetnum` int DEFAULT NULL,
  `streetname` varchar(45) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `state` varchar(5) DEFAULT NULL,
  `zip` int DEFAULT NULL,
  `custid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customeraddress`
--

LOCK TABLES `customeraddress` WRITE;
/*!40000 ALTER TABLE `customeraddress` DISABLE KEYS */;
INSERT INTO `customeraddress` VALUES (1212,'Johnson St','Fremont','CA',94536,1),(1214,'Smith St','San Mateo','CA',94537,2),(1215,'Tyler St','South San Francisco','CA',94538,3),(1216,'Dallas St','San Mateo','CA',94539,4),(1217,'Village St','Milpitas','CA',94531,5),(1218,'Apple St','Los Altos','CA',94532,6),(1219,'Banana St','Fremont','CA',94533,7),(1220,'Kayle St','Hayward','CA',94534,8),(1221,'Victory St','San Leandro','CA',94540,9);
/*!40000 ALTER TABLE `customeraddress` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-20  0:30:35
