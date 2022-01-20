-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: dsmt_project
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `pets_user`
--

DROP TABLE IF EXISTS `pets_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets_user` (
  `user_id` varchar(45) NOT NULL,
  `dog` bit(1) DEFAULT NULL,
  `cat` bit(1) DEFAULT NULL,
  `rabbit` bit(1) DEFAULT NULL,
  `hamster` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets_user`
--

LOCK TABLES `pets_user` WRITE;
/*!40000 ALTER TABLE `pets_user` DISABLE KEYS */;
INSERT INTO `pets_user` VALUES ('11b1fd2d481a638a0d6b8d38f0d1732e',_binary '',_binary '\0',_binary '\0',_binary '\0'),('1acccfd6017be27484cdd691c9b05153',_binary '',_binary '',_binary '\0',_binary '\0'),('a27042907f0e701c742edb30679ea232',_binary '',_binary '',_binary '',_binary ''),('d4e8e2f30df4d47603ffb10ee88bad05',_binary '',_binary '\0',_binary '',_binary '\0');
/*!40000 ALTER TABLE `pets_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `postal_code` varchar(45) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `petsitter` bit(1) DEFAULT NULL,
  `male` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('11b1fd2d481a638a0d6b8d38f0d1732e','Tommaso','Giorgi','Tomawk','t.giorgi@studenti.unipi.it','Livorno','57128','Hi, i only have a dog, searching for a pet sitter!',_binary '\0',_binary ''),('1acccfd6017be27484cdd691c9b05153','Mario','Bianchi','whitemario','whitemario@mail.com','Pisa','57100','Hi the new petsitter is here! Whoa!',_binary '',_binary ''),('a27042907f0e701c742edb30679ea232','Mario','Rossi','redmario','redmario@mail.com','Pisa','57100','Hi, my name is mario and i love pets. Searching for petsitters . . . ',_binary '\0',_binary ''),('d4e8e2f30df4d47603ffb10ee88bad05','Maria','Rosa','pinkmaria','pinkmaria@mail.com','Pisa','57100','Hi, i have two dogs named Jacob and Esau and my cat is named Silvio',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-19 18:38:16
