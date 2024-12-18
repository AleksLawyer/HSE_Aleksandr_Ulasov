-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: court
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `case_categories`
--

DROP TABLE IF EXISTS `case_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_categories`
--

LOCK TABLES `case_categories` WRITE;
/*!40000 ALTER TABLE `case_categories` DISABLE KEYS */;
INSERT INTO `case_categories` VALUES (3,'Административное'),(2,'Гражданское'),(1,'Уголовное');
/*!40000 ALTER TABLE `case_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_outcomes`
--

DROP TABLE IF EXISTS `case_outcomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_outcomes` (
  `case_id` int NOT NULL,
  `outcome_date` date DEFAULT NULL,
  `outcome_type_id` int DEFAULT NULL,
  `outcome_details` text,
  PRIMARY KEY (`case_id`),
  KEY `outcome_type_id` (`outcome_type_id`),
  CONSTRAINT `case_outcomes_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `court_cases` (`id`) ON DELETE CASCADE,
  CONSTRAINT `case_outcomes_ibfk_2` FOREIGN KEY (`outcome_type_id`) REFERENCES `outcome_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_outcomes`
--

LOCK TABLES `case_outcomes` WRITE;
/*!40000 ALTER TABLE `case_outcomes` DISABLE KEYS */;
INSERT INTO `case_outcomes` VALUES (2,'2024-06-30',2,'Детали определения по делу');
/*!40000 ALTER TABLE `case_outcomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_participants_individuals`
--

DROP TABLE IF EXISTS `case_participants_individuals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_participants_individuals` (
  `case_id` int NOT NULL,
  `participant_id` int NOT NULL,
  `participant_type_id` int NOT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`case_id`,`participant_id`,`participant_type_id`),
  KEY `role_id` (`role_id`),
  KEY `participant_type_id` (`participant_type_id`),
  KEY `participant_id` (`participant_id`),
  CONSTRAINT `case_participants_individuals_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `court_cases` (`id`) ON DELETE CASCADE,
  CONSTRAINT `case_participants_individuals_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `participant_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `case_participants_individuals_ibfk_3` FOREIGN KEY (`participant_type_id`) REFERENCES `participant_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `case_participants_individuals_ibfk_4` FOREIGN KEY (`participant_id`) REFERENCES `individuals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_participants_individuals`
--

LOCK TABLES `case_participants_individuals` WRITE;
/*!40000 ALTER TABLE `case_participants_individuals` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_participants_individuals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_participants_legal_entities`
--

DROP TABLE IF EXISTS `case_participants_legal_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_participants_legal_entities` (
  `case_id` int NOT NULL,
  `participant_id` int NOT NULL,
  `participant_type_id` int NOT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`case_id`,`participant_id`,`participant_type_id`),
  KEY `role_id` (`role_id`),
  KEY `participant_type_id` (`participant_type_id`),
  KEY `participant_id` (`participant_id`),
  CONSTRAINT `case_participants_legal_entities_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `court_cases` (`id`) ON DELETE CASCADE,
  CONSTRAINT `case_participants_legal_entities_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `participant_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `case_participants_legal_entities_ibfk_3` FOREIGN KEY (`participant_type_id`) REFERENCES `participant_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `case_participants_legal_entities_ibfk_4` FOREIGN KEY (`participant_id`) REFERENCES `legal_entities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_participants_legal_entities`
--

LOCK TABLES `case_participants_legal_entities` WRITE;
/*!40000 ALTER TABLE `case_participants_legal_entities` DISABLE KEYS */;
INSERT INTO `case_participants_legal_entities` VALUES (2,1,2,1),(2,2,2,2);
/*!40000 ALTER TABLE `case_participants_legal_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `court_cases`
--

DROP TABLE IF EXISTS `court_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `court_cases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `case_number` varchar(100) DEFAULT NULL,
  `case_category_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `judge_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `case_number` (`case_number`),
  KEY `judge_id` (`judge_id`),
  KEY `case_category_id` (`case_category_id`),
  CONSTRAINT `court_cases_ibfk_1` FOREIGN KEY (`judge_id`) REFERENCES `judges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `court_cases_ibfk_2` FOREIGN KEY (`case_category_id`) REFERENCES `case_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `court_cases_chk_1` CHECK ((`start_date` <= `end_date`))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `court_cases`
--

LOCK TABLES `court_cases` WRITE;
/*!40000 ALTER TABLE `court_cases` DISABLE KEYS */;
INSERT INTO `court_cases` VALUES (2,'5678/2024',2,'2024-02-15','2024-06-30',2);
/*!40000 ALTER TABLE `court_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `case_id` int DEFAULT NULL,
  `document_type` varchar(100) DEFAULT NULL,
  `document_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `document_content` text,
  PRIMARY KEY (`id`),
  KEY `case_id` (`case_id`),
  CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `court_cases` (`id`) ON DELETE CASCADE,
  CONSTRAINT `documents_chk_1` CHECK ((`document_date` <= cast(`created_at` as date)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (2,2,'Протокол судебного заседания','2024-03-15','2024-12-15 11:36:17','Текст протокола'),(3,2,'Решение суда','2024-06-10','2024-12-15 11:43:08','Судья: Петрова Елена Сергеевна\nРешение: Отказать\nДетали: Детали определения по делу');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `individuals`
--

DROP TABLE IF EXISTS `individuals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individuals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `inn` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `participant_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `last_name` (`last_name`,`first_name`,`middle_name`,`inn`,`date_of_birth`),
  KEY `participant_type_id` (`participant_type_id`),
  CONSTRAINT `individuals_ibfk_1` FOREIGN KEY (`participant_type_id`) REFERENCES `participant_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individuals`
--

LOCK TABLES `individuals` WRITE;
/*!40000 ALTER TABLE `individuals` DISABLE KEYS */;
INSERT INTO `individuals` VALUES (1,'Иванов','Иван','Иванович','1234567890','1990-01-01','new_email@example.com',1),(2,'Петрова','Елена','Сергеевна','9876543210','1985-05-10','+7 (910) 123-45-67',1);
/*!40000 ALTER TABLE `individuals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `judges`
--

DROP TABLE IF EXISTS `judges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `judges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `individual_id` int DEFAULT NULL,
  `court_district` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `individual_id` (`individual_id`),
  CONSTRAINT `judges_ibfk_1` FOREIGN KEY (`individual_id`) REFERENCES `individuals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `judges`
--

LOCK TABLES `judges` WRITE;
/*!40000 ALTER TABLE `judges` DISABLE KEYS */;
INSERT INTO `judges` VALUES (1,1,'Центральный округ'),(2,2,'Западный округ');
/*!40000 ALTER TABLE `judges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legal_entities`
--

DROP TABLE IF EXISTS `legal_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `legal_entities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `inn` varchar(20) DEFAULT NULL,
  `ogrn` varchar(20) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `participant_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inn` (`inn`,`ogrn`),
  KEY `participant_type_id` (`participant_type_id`),
  CONSTRAINT `legal_entities_ibfk_1` FOREIGN KEY (`participant_type_id`) REFERENCES `participant_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal_entities`
--

LOCK TABLES `legal_entities` WRITE;
/*!40000 ALTER TABLE `legal_entities` DISABLE KEYS */;
INSERT INTO `legal_entities` VALUES (1,'ООО \"Рога и Копыта\"','1234567890','1234567890123','+1234567890',2),(2,'ЗАО \"Вектор\"','9876543210','9876543210987','+7 (495) 123-45-67',2);
/*!40000 ALTER TABLE `legal_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcome_types`
--

DROP TABLE IF EXISTS `outcome_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outcome_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcome_types`
--

LOCK TABLES `outcome_types` WRITE;
/*!40000 ALTER TABLE `outcome_types` DISABLE KEYS */;
INSERT INTO `outcome_types` VALUES (2,'Отказать'),(1,'Удовлетворить');
/*!40000 ALTER TABLE `outcome_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant_roles`
--

DROP TABLE IF EXISTS `participant_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participant_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_roles`
--

LOCK TABLES `participant_roles` WRITE;
/*!40000 ALTER TABLE `participant_roles` DISABLE KEYS */;
INSERT INTO `participant_roles` VALUES (4,'Адвокат'),(1,'Истец'),(2,'Ответчик'),(3,'Судья');
/*!40000 ALTER TABLE `participant_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant_types`
--

DROP TABLE IF EXISTS `participant_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participant_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_types`
--

LOCK TABLES `participant_types` WRITE;
/*!40000 ALTER TABLE `participant_types` DISABLE KEYS */;
INSERT INTO `participant_types` VALUES (1,'Физическое лицо'),(2,'Юридическое лицо');
/*!40000 ALTER TABLE `participant_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'court'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-15 16:26:24
