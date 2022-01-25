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
-- Table structure for table `confirmed_booking`
--

DROP TABLE IF EXISTS `confirmed_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `confirmed_booking` (
  `id_` int NOT NULL AUTO_INCREMENT,
  `petowner_id` varchar(45) DEFAULT NULL,
  `petowner_username` varchar(45) DEFAULT NULL,
  `petsitter_id` varchar(45) DEFAULT NULL,
  `petsitter_username` varchar(45) DEFAULT NULL,
  `from_date` varchar(45) DEFAULT NULL,
  `to_date` varchar(45) DEFAULT NULL,
  `pet` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirmed_booking`
--

LOCK TABLES `confirmed_booking` WRITE;
/*!40000 ALTER TABLE `confirmed_booking` DISABLE KEYS */;
INSERT INTO `confirmed_booking` VALUES (1,'a27042907f0e701c742edb30679ea232','redmario','1acccfd6017be27484cdd691c9b05153','whitemario','Wed 26-Jan-2022','Fri 28-Jan-2022','cat','accepted'),(2,'11b1fd2d481a638a0d6b8d38f0d1732e','Tomawk','1acccfd6017be27484cdd691c9b05153','whitemario','Tue 25-Jan-2022','Tue 25-Jan-2022','rabbit','declined'),(3,'11b1fd2d481a638a0d6b8d38f0d1732e','Tomawk','1acccfd6017be27484cdd691c9b05153','whitemario','Wed 26-Jan-2022','Wed 26-Jan-2022','dog','accepted'),(4,'11b1fd2d481a638a0d6b8d38f0d1732e','Tomawk','1acccfd6017be27484cdd691c9b05153','whitemario','Wed 26-Jan-2022','Fri 28-Jan-2022','dog','declined'),(5,'a27042907f0e701c742edb30679ea232','redmario','1acccfd6017be27484cdd691c9b05153','whitemario','Thu 24-Feb-2022','Fri 25-Feb-2022','dog','declined');
/*!40000 ALTER TABLE `confirmed_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_booking`
--

DROP TABLE IF EXISTS `pending_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pending_booking` (
  `id_` int NOT NULL AUTO_INCREMENT,
  `petsitter_id` varchar(45) DEFAULT NULL,
  `petsitter_us` varchar(45) DEFAULT NULL,
  `petowner_id` varchar(45) DEFAULT NULL,
  `petowner_us` varchar(45) DEFAULT NULL,
  `from_date` varchar(45) DEFAULT NULL,
  `to_date` varchar(45) DEFAULT NULL,
  `pet` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_booking`
--

LOCK TABLES `pending_booking` WRITE;
/*!40000 ALTER TABLE `pending_booking` DISABLE KEYS */;
INSERT INTO `pending_booking` VALUES (9,'1acccfd6017be27484cdd691c9b05153','whitemario','11b1fd2d481a638a0d6b8d38f0d1732e','Tomawk','Tue 08-Feb-2022','Thu 10-Feb-2022','cat'),(10,'1acccfd6017be27484cdd691c9b05153','whitemario','a27042907f0e701c742edb30679ea232','redmario','Wed 26-Jan-2022','Fri 28-Jan-2022','dog'),(11,'1acccfd6017be27484cdd691c9b05153','whitemario','11b1fd2d481a638a0d6b8d38f0d1732e','Tomawk','Tue 01-Feb-2022','Tue 01-Feb-2022','dog'),(12,'1acccfd6017be27484cdd691c9b05153','whitemario','11b1fd2d481a638a0d6b8d38f0d1732e','Tomawk','Wed 02-Feb-2022','Wed 02-Feb-2022','dog'),(13,'1acccfd6017be27484cdd691c9b05153','whitemario','11b1fd2d481a638a0d6b8d38f0d1732e','Tomawk','Thu 27-Jan-2022','Thu 27-Jan-2022','dog');
/*!40000 ALTER TABLE `pending_booking` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `owner` varchar(45) NOT NULL,
  `pet_sitter` varchar(45) NOT NULL,
  `text` varchar(256) DEFAULT NULL,
  `rating` int DEFAULT '0',
  `timestamp` timestamp NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `owner` (`owner`),
  KEY `pet_sitter` (`pet_sitter`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`pet_sitter`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'11b1fd2d481a638a0d6b8d38f0d1732e','1acccfd6017be27484cdd691c9b05153','Fenomenale!',3,'2022-01-22 10:31:52'),(2,'11b1fd2d481a638a0d6b8d38f0d1732e','1acccfd6017be27484cdd691c9b05153','Bravo!',5,'2022-01-22 10:32:20'),(3,'11b1fd2d481a638a0d6b8d38f0d1732e','1acccfd6017be27484cdd691c9b05153','Bravo!',2,'2022-01-22 10:39:01'),(4,'11b1fd2d481a638a0d6b8d38f0d1732e','1acccfd6017be27484cdd691c9b05153','Bravo!',3,'2022-01-22 10:39:36'),(5,'11b1fd2d481a638a0d6b8d38f0d1732e','1acccfd6017be27484cdd691c9b05153','Bravo!',5,'2022-01-22 10:40:04');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
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
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('11b1fd2d481a638a0d6b8d38f0d1732e','Tommaso','Giorgi','Tomawk','t.giorgi@studenti.unipi.it','Livorno','57128','Hi, i only have a dog, searching for a pet sitter!',_binary '\0',_binary '','123'),('1acccfd6017be27484cdd691c9b05153','Mario','Bianchi','whitemario','whitemario@mail.com','Pisa','57100','Hi the new petsitter is here! Whoa!',_binary '',_binary '','123'),('a27042907f0e701c742edb30679ea232','Mario','Rossi','redmario','redmario@mail.com','Pisa','57100','Hi, my name is mario and i love pets. Searching for petsitters . . . ',_binary '\0',_binary '','123'),('d4e8e2f30df4d47603ffb10ee88bad05','Maria','Rosa','pinkmaria','pinkmaria@mail.com','Pisa','57100','Hi, i have two dogs named Jacob and Esau and my cat is named Silvio',_binary '\0',_binary '\0','123');
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

-- Dump completed on 2022-01-25 16:03:50
