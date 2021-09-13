-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: fracflame
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artwork`
--

DROP TABLE IF EXISTS `artwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artwork` (
  `artworkid` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `canvas_width` int NOT NULL,
  `canvas_height` int NOT NULL,
  `gamma` float NOT NULL,
  `created_at` int NOT NULL,
  `last_updated_at` int NOT NULL,
  PRIMARY KEY (`artworkid`),
  KEY `FK_cb8f16c82cdf05d540b53d9b3d1` (`userid`),
  CONSTRAINT `FK_cb8f16c82cdf05d540b53d9b3d1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artwork`
--

LOCK TABLES `artwork` WRITE;
/*!40000 ALTER TABLE `artwork` DISABLE KEYS */;
INSERT INTO `artwork` VALUES (1,1,'test flame 1-1',800,600,2.2,1631517585,1631517585);
/*!40000 ALTER TABLE `artwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attractor`
--

DROP TABLE IF EXISTS `attractor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attractor` (
  `attractorid` int NOT NULL AUTO_INCREMENT,
  `artworkid` int DEFAULT NULL,
  `affine_a` float NOT NULL,
  `affine_b` float NOT NULL,
  `affine_c` float NOT NULL,
  `affine_d` float NOT NULL,
  `affine_e` float NOT NULL,
  `affine_f` float NOT NULL,
  `weight` float NOT NULL,
  `color_r` int NOT NULL,
  `color_g` int NOT NULL,
  `color_b` int NOT NULL,
  PRIMARY KEY (`attractorid`),
  KEY `FK_5c2c5be113a118731ae7a1104b7` (`artworkid`),
  CONSTRAINT `FK_5c2c5be113a118731ae7a1104b7` FOREIGN KEY (`artworkid`) REFERENCES `artwork` (`artworkid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attractor`
--

LOCK TABLES `attractor` WRITE;
/*!40000 ALTER TABLE `attractor` DISABLE KEYS */;
INSERT INTO `attractor` VALUES (1,1,0.5,0,0,0,0.5,0,0.33,255,0,0),(2,1,0.5,0,0.5,0,0.5,0,0.33,0,255,0),(3,1,0.5,0,0,0,0.5,0.5,0.34,0,0,255);
/*!40000 ALTER TABLE `attractor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test1','111111'),(3,'test3','333333'),(5,'test5','555555'),(6,'test6','555555'),(7,'test7','777777'),(10,'test10','101010'),(11,'test8','8888888');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation`
--

DROP TABLE IF EXISTS `variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variation` (
  `variationid` int NOT NULL AUTO_INCREMENT,
  `attractorid` int DEFAULT NULL,
  `weight` float NOT NULL,
  `type_index` int NOT NULL,
  PRIMARY KEY (`variationid`),
  KEY `FK_7aae06b1d29b8462278e1d59c89` (`attractorid`),
  CONSTRAINT `FK_7aae06b1d29b8462278e1d59c89` FOREIGN KEY (`attractorid`) REFERENCES `attractor` (`attractorid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation`
--

LOCK TABLES `variation` WRITE;
/*!40000 ALTER TABLE `variation` DISABLE KEYS */;
INSERT INTO `variation` VALUES (1,1,1,1),(2,2,1,1),(3,3,1,1);
/*!40000 ALTER TABLE `variation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'fracflame'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-13 17:37:31
