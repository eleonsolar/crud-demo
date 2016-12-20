CREATE DATABASE  IF NOT EXISTS `crud_demo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `crud_demo`;
-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: crud_demo
-- ------------------------------------------------------
-- Server version	5.5.53-0+deb8u1

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
-- Table structure for table `tbl_carrera`
--

DROP TABLE IF EXISTS `tbl_carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_carrera` (
  `carr_id` int(11) NOT NULL AUTO_INCREMENT,
  `carr_nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`carr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_carrera`
--

LOCK TABLES `tbl_carrera` WRITE;
/*!40000 ALTER TABLE `tbl_carrera` DISABLE KEYS */;
INSERT INTO `tbl_carrera` VALUES (1,'System engineering'),(2,'Sociology'),(3,'Accounting'),(4,'Arquitect'),(5,'Nurse'),(6,'Medical Doctor'),(7,'Policeman'),(8,'Bussinessman'),(9,'Driver');
/*!40000 ALTER TABLE `tbl_carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estudiante`
--

DROP TABLE IF EXISTS `tbl_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_estudiante` (
  `estu_id` int(11) NOT NULL AUTO_INCREMENT,
  `estu_nombre` varchar(45) NOT NULL,
  `estu_apellido` varchar(45) NOT NULL,
  `estu_cedula` int(11) NOT NULL,
  `carr_id` int(11) NOT NULL,
  PRIMARY KEY (`estu_id`),
  KEY `carr_id` (`carr_id`),
  CONSTRAINT `tbl_estudiante_ibfk_1` FOREIGN KEY (`carr_id`) REFERENCES `tbl_carrera` (`carr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estudiante`
--

LOCK TABLES `tbl_estudiante` WRITE;
/*!40000 ALTER TABLE `tbl_estudiante` DISABLE KEYS */;
INSERT INTO `tbl_estudiante` VALUES (4,'Esteban','Leon',19201202,2),(7,'Carlos','Gonzalez',123456,3),(9,'Ysmael','Blanco',12000311,3),(10,'Carlos','Ramos',18292111,2),(12,'Cecilio','Jimenez',16987234,1),(13,'Pedro','Perez',15030322,2),(14,'Ruben','Mejias',20929112,2),(15,'Erick','Perez',18782999,3),(16,'Carlos','Martinez',12399111,3),(17,'Silvio','Bustamante',23001922,3),(18,'Raul','Rodriguez',21122394,2),(20,'Carlos','Farias',123445,8),(22,'Claudio','Saraza',43434343,8);
/*!40000 ALTER TABLE `tbl_estudiante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-20 18:21:39
