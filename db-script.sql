CREATE DATABASE  IF NOT EXISTS `online-academy-db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `online-academy-db`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: online-academy-db
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `advancement`
--

DROP TABLE IF EXISTS `advancement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advancement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advancement`
--

LOCK TABLES `advancement` WRITE;
/*!40000 ALTER TABLE `advancement` DISABLE KEYS */;
INSERT INTO `advancement` VALUES (1,'BestSeller','2020-12-11 10:51:39','2020-12-11 10:51:39'),(2,'Hot & New','2020-12-11 10:51:39','2020-12-11 10:51:39'),(3,'Highest Rated','2020-12-11 10:51:39','2020-12-11 10:51:39'),(4,'New','2020-12-11 10:51:39','2020-12-11 10:51:39'),(5,'Best Choice','2020-12-11 10:51:39','2020-12-11 10:51:39');
/*!40000 ALTER TABLE `advancement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `logo` varchar(45) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Web Development','2020-12-05 15:34:54','2021-01-18 03:36:36','fas fa-blog','assets/images/categories/web-development.jpg',1),(2,'Data Science','2020-12-05 15:34:54','2021-01-14 10:03:16','fas fa-info','assets/images/categories/data-science.jpg',1),(3,'Mobile Development','2020-12-05 15:34:54','2020-12-05 15:35:09','fas fa-mobile-alt','assets/images/categories/mobile-development.jpg',1),(4,'Programming Languages','2020-12-05 15:34:54','2020-12-05 15:35:09','fas fa-folder-open','assets/images/categories/programming-languages.jpg',1),(5,'Game Development','2020-12-05 15:34:54','2020-12-05 15:35:09','fas fa-gamepad','assets/images/categories/game-development.jpg',1),(6,'Database Development','2020-12-05 15:34:54','2020-12-05 15:35:09','fas fa-database','assets/images/categories/database-development.jpg',1),(7,'Software Testing','2020-12-05 15:34:54','2020-12-05 15:35:09','fas fa-gamepad','assets/images/categories/software-testing.jpg',1),(8,'Software Engineering','2020-12-05 15:34:54','2020-12-05 15:35:09','fas fa-tools','assets/images/categories/software-engineering.jpg',1),(9,'Development Tools','2020-12-05 15:34:54','2020-12-05 15:35:09','fab fa-connectdevelop','assets/images/categories/development-tools.jpg',1),(10,'No-Code Development','2020-12-05 15:34:54','2020-12-05 15:35:09','fab fa-wpbeginner','assets/images/categories/no-code-development.jpg',1),(22,'Big Data Development','2021-01-17 10:07:58','2021-01-17 15:19:17','sdfdsfsdf','assets/images/categories/web-development.jpg',0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_link`
--

DROP TABLE IF EXISTS `category_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `sub_category_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_category_idx` (`category_id`),
  KEY `Fk_sub_category_idx` (`sub_category_id`),
  CONSTRAINT `FK_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `Fk_sub_category` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_link`
--

LOCK TABLES `category_link` WRITE;
/*!40000 ALTER TABLE `category_link` DISABLE KEYS */;
INSERT INTO `category_link` VALUES (1,1,1,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(2,1,2,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(3,1,3,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(4,1,4,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(5,1,5,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(6,1,6,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(7,1,7,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(8,1,8,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(9,2,8,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(10,2,9,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(11,2,10,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(12,2,11,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(13,2,12,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(14,2,13,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(15,2,1,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(16,2,15,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(17,3,16,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(18,3,17,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(19,3,18,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(20,3,19,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(21,3,20,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(22,3,21,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(23,3,22,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(24,3,23,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(25,4,24,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(26,4,25,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(27,4,26,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(28,4,27,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(29,4,28,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(30,4,29,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(31,4,2,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(32,4,3,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(33,4,8,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(34,5,30,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(35,5,31,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(36,5,32,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(37,5,33,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(38,5,34,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(39,5,35,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(40,5,36,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(41,5,25,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(42,5,27,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(43,6,37,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(44,6,38,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(45,6,39,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(46,6,40,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(47,6,41,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(48,6,42,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(49,6,43,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(50,6,44,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(51,6,45,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(52,7,46,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(53,7,47,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(54,7,48,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(55,7,49,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(56,7,50,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(57,7,51,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(58,7,52,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(59,7,24,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(60,8,53,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(61,8,54,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(62,8,55,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(63,8,56,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(64,8,57,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(65,8,58,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(66,8,8,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(67,9,59,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(68,9,60,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(69,9,61,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(70,9,62,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(71,9,63,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(72,9,64,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(73,9,65,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(74,9,66,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(75,10,67,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(76,10,68,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(77,10,69,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(78,10,70,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(79,10,71,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(80,10,72,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(81,10,73,'2020-12-05 15:49:36','2020-12-05 15:49:46'),(84,4,78,'2021-01-14 11:21:24','2021-01-14 11:21:24'),(85,1,79,'2021-01-17 13:52:30','2021-01-17 13:52:30'),(86,1,80,'2021-01-18 03:26:49','2021-01-18 03:26:49'),(87,1,81,'2021-01-18 03:26:50','2021-01-18 03:26:50'),(88,1,82,'2021-01-18 03:26:51','2021-01-18 03:26:51'),(89,1,83,'2021-01-18 03:27:00','2021-01-18 03:27:00');
/*!40000 ALTER TABLE `category_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `percent_discount` int DEFAULT NULL,
  `amount_discount` int DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (1,'Ưu đãi thanh toán online 10%',10,0,'2021-01-30 00:00:00',NULL,NULL,'ONLINE10'),(2,'Ưu đãi tết nguyên đán 50k đồng',0,2,'2021-01-30 00:00:00',NULL,NULL,'TET30'),(3,'Giảm 30k khi mua từ 2 khóa',0,2,'2021-01-30 00:00:00',NULL,NULL,'2COURSE30'),(4,'Không có ưu đãi',0,0,'2021-01-30 00:00:00',NULL,NULL,'NONESALE');
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `concurrency` varchar(45) DEFAULT 'USD',
  `price` float(9,2) DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `language` varchar(45) DEFAULT NULL,
  `rating` float DEFAULT '0',
  `num_review` int DEFAULT '0',
  `num_lecture` int DEFAULT NULL,
  `estimate_content_length` varchar(45) DEFAULT NULL,
  `num_student_enroll` int DEFAULT '0',
  `category_link_id` int NOT NULL,
  `instructor_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `pre_price` float(9,2) DEFAULT NULL,
  `level_id` int NOT NULL,
  `advancement_id` int NOT NULL,
  `status` int DEFAULT '1',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_level_idx` (`level_id`),
  KEY `FK_advancement_idx` (`advancement_id`),
  KEY `FK_instructor_idx` (`instructor_id`),
  KEY `FK_category_link_idx` (`category_link_id`),
  CONSTRAINT `FK_advancement` FOREIGN KEY (`advancement_id`) REFERENCES `advancement` (`id`),
  CONSTRAINT `FK_category_link` FOREIGN KEY (`category_link_id`) REFERENCES `category_link` (`id`),
  CONSTRAINT `FK_instructor` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`id`),
  CONSTRAINT `FK_level` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'The Complete JavaScript Course 2020: From Zero to Expert!','The modern JavaScript course for everyone! Master JavaScript with projects, challenges and theory. Many courses in one!','assets/images/products/The-Complete-JavaScript-Course-2020-Build-Real-Projects.jpg','USD',11.99,90,'English',4.52,84259,485,'48',60695,1,6,'2020-12-11 10:31:42','2021-01-18 03:27:52',129.99,4,4,1,''),(2,'JavaScript: Understanding the Weird Parts','An advanced JavaScript course for everyone! Scope, closures, prototypes, \'this\', build your own framework, and more.','assets/images/products/JavaScript-Understanding-the-Weird-Parts.jpg','USD',11.99,90,'English',4.19,65032,456,'48',73695,1,5,'2020-12-11 10:31:42','2021-01-17 13:49:14',129.99,1,4,0,''),(3,'Modern JavaScript From The Beginning','Learn and build projects with pure JavaScript (No frameworks or libraries)','assets/images/products/Modern-JavaScript-From-The-Beginning.jpg','USD',11.99,90,'English',4.39,72383,426,'48',86389,1,8,'2020-12-11 10:31:42','2021-01-17 13:56:36',129.99,2,1,0,''),(4,'JavaScript - The Complete Guide 2020 (Beginner + Advanced)','Modern JavaScript from the beginning - all the way up to JS expert level! THE must-have JavaScript resource in 2020.','assets/images/products/JavaScript-The-Complete-Guide-2020-(Beginner-Advanced).jpg','USD',11.99,90,'English',4.36,66817,463,'44',60862,1,9,'2020-12-11 10:31:42','2020-12-11 10:31:42',129.99,1,2,1,''),(5,'The Modern JavaScript Bootcamp','Learn JavaScript by building real-world apps. Includes 3 real-world projects, 80 programming challenges, and ES6/ES7!','assets/images/products/The-Modern-JavaScript-Bootcamp.jpg','USD',11.99,90,'English',4.64,66938,433,'48',95142,1,10,'2020-12-11 10:31:42','2020-12-11 10:31:42',129.99,4,3,1,''),(6,'React - The Complete Guide (incl Hooks, React Router, Redux)','Dive in and learn React.js from scratch! Learn Reactjs, Hooks, Redux, React Routing, Animations, Next.js and way more!','assets/images/products/React-The-Complete-Guide-Incl-Hooks-React-Router-Redux.jpg','USD',11.99,90,'English',4.12,84238,481,'36',93123,2,7,'2020-12-11 10:31:42','2020-12-11 10:31:42',129.99,2,1,1,''),(7,'Modern React with Redux [2020 Update]','Master React v16.6.3 and Redux with React Router, Webpack, and Create-React-App. Includes Hooks!','assets/images/products/Modern-React-with-Redux-[2020-Update].jpg','USD',11.99,90,'English',4.7,70373,402,'47',80187,2,5,'2020-12-11 10:31:42','2020-12-11 10:31:42',129.99,3,4,1,''),(8,'Advanced React and Redux','Walkthroughs on advanced React v16.6.3 and Redux v4.0.0 - Authentication, Testing, Middlewares, HOC\'s, and Deployment','assets/images/products/Advanced-React-and-Redux.jpg','USD',11.99,90,'English',4.13,99156,470,'37',71569,2,4,'2020-12-11 10:31:42','2020-12-11 10:31:42',129.99,1,5,1,''),(9,'Node with React: Fullstack Web Development','Build and deploy fullstack web apps with NodeJS, React, Redux, Express, and MongoDB.','assets/images/products/Node-with-React-Fullstack-Web-Development.jpg','USD',11.99,90,'English',4.53,84657,440,'34',67283,2,7,'2020-12-11 10:31:42','2020-12-11 10:31:42',129.99,2,1,1,''),(10,'The Complete React Developer Course (w/ Hooks and Redux)','Learn how to build and launch React web applications using React, Redux, Webpack, React-Router, and more!','assets/images/products/The-Complete-React-Developer-Course-(Hooks-and-Redux).jpg','USD',11.99,90,'English',4.26,75820,494,'32',71710,2,7,'2020-12-11 10:31:42','2020-12-11 10:31:42',129.99,1,3,1,''),(11,'Build Responsive Real World Websites with HTML5 and CSS3','The easiest way to learn modern web design, HTML5 and CSS3 step-by-step from scratch. Design AND code a huge project.','assets/images/products/Build-Responsive-Real-World-Websites-with-HTML5-and-CSS3.jpg','USD',11.99,90,'English',4.72,75127,449,'47',56700,3,4,'2020-12-11 10:31:42','2020-12-11 10:31:42',129.99,4,4,1,''),(12,'Web Design for Beginners: Real World Coding in HTML & CSS','Launch a career as a web designer by learning HTML5, CSS3, responsive design, Sass and more!','assets/images/products/Web-Design-for-Beginners-Real-World-Coding-in-HTML-&-CSS.jpg','USD',11.99,90,'English',4.83,98175,462,'47',68369,3,7,'2020-12-11 10:31:42','2020-12-11 10:31:42',129.99,2,2,1,''),(13,'Modern HTML & CSS From The Beginning (Including Sass)','Build modern responsive websites & UIs with HTML5, CSS3 & Sass! Learn Flex & CSS Grid','assets/images/products/Modern-HTML-&-CSS-From-The-Beginning-(Including Sass).jpg','USD',11.99,90,'English',4.98,65492,463,'44',71747,3,8,'2020-12-11 10:31:42','2020-12-11 10:31:42',129.99,4,4,1,''),(14,'CSS - The Complete Guide 2020 (incl. Flexbox, Grid & Sass)','Learn CSS for the first time or brush up your CSS skills and dive in even deeper. EVERY web developer has to know CSS.','assets/images/products/CSS-–-The-Complete-Guide-2020-incl.-Flexbox-Grid-Sass.jpg','USD',11.99,90,'English',4.42,82938,430,'30',53628,3,9,'2020-12-11 10:31:42','2020-12-11 10:31:42',129.99,3,4,1,''),(15,'Build Websites from Scratch with HTML & CSS','Learn Web Development Essentials and Become a Web Developer From Scratch in this Complete HTML & CSS Beginner\'s Course','assets/images/products/Build-Websites-from-Scratch-with-HTML-&-CSS.jpg','USD',11.99,90,'English',4.17,68211,462,'30',52902,3,4,'2020-12-11 10:31:42','2020-12-11 10:31:42',129.99,2,3,1,''),(16,'Angular - The Complete Guide (2020 Edition)','Master Angular 10 (formerly \"Angular 2\") and build awesome, reactive web apps with the successor of Angular.js','assets/images/products/Angular-The-Complete-Guide-(2020 Edition).jpg','USD',19.99,90,'English',4.58,92242,418,'50',53623,4,10,'2020-12-11 10:31:42','2020-12-11 10:31:42',199.99,1,5,1,''),(17,'Angular & NodeJS - The MEAN Stack Guide [2020 Edition]','Learn how to connect your Angular Frontend to a NodeJS & Express & MongoDB Backend by building a real Application','assets/images/products/Angular-&-NodeJS - The-MEAN-Stack-Guide-[2020-Edition].jpg','USD',19.99,90,'English',4.38,56575,406,'49',59412,4,7,'2020-12-11 10:31:42','2020-12-11 10:31:42',199.99,4,4,1,''),(18,'The Complete Angular Course: Beginner to Advanced','The most comprehensive Angular 4 (Angular 2+) course. Build a real e-commerce app with Angular, Firebase and Bootstrap 4','assets/images/products/The-Complete-Angular-Course-Beginner-to-Advanced.jpg','USD',19.99,90,'English',4.17,56151,476,'41',86189,4,8,'2020-12-11 10:31:42','2020-12-11 10:31:42',199.99,2,1,1,''),(19,'Build an app with ASPNET Core and Angular from scratch','A practical example of how to build an application with ASP.NET Core API (.Net 5.0) and Angular 10 from start to finish','assets/images/products/The-Complete-Angular-Course-Beginner-To-Advanced-Net.jpg','USD',19.99,90,'English',4.7,61031,461,'32',52707,4,10,'2020-12-11 10:31:42','2020-12-11 10:31:42',199.99,4,4,1,''),(20,'Angular Crash Course for Busy Developers','Have limited time to learn Angular 4 (Angular 2+)? Take this course and learn Angular in 10 hours!','assets/images/products/Angular-Crash-Course-for-Busy-Developers.jpg','USD',19.99,90,'English',4.99,86701,479,'46',54972,4,9,'2020-12-11 10:31:42','2020-12-11 10:31:42',199.99,1,3,1,''),(21,'PHP for Beginners - Become a PHP Master - CMS Project','PHP for Beginners: learn everything you need to become a professional PHP developer with practical exercises & projects.','assets/images/products/PHP-for-Beginners-Become-a-PHP-Master-CMS-Project.jpg','USD',19.99,90,'English',4.87,50411,410,'43',66741,5,4,'2020-12-11 10:31:35','2020-12-11 10:31:35',199.99,3,4,1,''),(22,'PHP with Laravel for beginners - Become a Master in Laravel','Learn to master Laravel to make advanced applications like the real CMS app we build on this course','assets/images/products/PHP-with-Laravel-for-beginners-Become-a-Master-in-Laravel.jpg','USD',19.99,90,'English',4.38,91957,414,'49',68785,5,4,'2020-12-11 10:31:35','2020-12-11 10:31:35',199.99,1,4,1,''),(23,'PHP OOP: Object Oriented Programming for beginners + Project','PHP OOP: Learn OOP PHP and Take your skills to another level. Make serious money by building awesome applications.','assets/images/products/Object-Oriented-PHP-&-MVC.jpg','USD',19.99,90,'English',4.28,58545,442,'43',93704,5,5,'2020-12-11 10:31:35','2020-12-11 10:31:35',199.99,4,4,1,''),(24,'Object Oriented PHP & MVC','Build a custom object oriented PHP MVC framework and then build an application with it','assets/images/products/Build-a-Social-Network-from-Scratch-JavaScript-PHP-MySQL.jpg','USD',19.99,90,'English',4.24,66859,465,'41',62161,5,10,'2020-12-11 10:31:35','2020-12-11 10:31:35',199.99,2,5,1,''),(25,'Build a Social Network from Scratch: JavaScript PHP + MySQL','Learn JavaScript, PHP and MySQL by building the ultimate social network website from scratch! The complete guide!','assets/images/products/The-Complete-Node.js-Developer-Course-(3rd-Edition).jpg','USD',19.99,90,'English',4.39,58660,400,'44',79696,5,4,'2020-12-11 10:31:35','2020-12-11 10:31:35',199.99,4,3,1,''),(26,'The Complete Node.js Developer Course (3rd Edition)','Learn Node.js by building real-world applications with Node, Express, MongoDB, Jest, and more!','assets/images/products/Learn-and-Understand-NodeJS.jpg','USD',14.99,90,'English',4.23,92725,408,'47',61997,6,9,'2020-12-11 10:31:35','2020-12-11 10:31:35',149.99,1,4,1,''),(27,'Learn and Understand NodeJS','Dive deep under the hood of NodeJS. Learn V8, Express, the MEAN stack, core Javascript concepts, and more.','assets/images/products/Learn-and-Understand-NodeJS.jpg','USD',14.99,90,'English',4.97,87643,438,'30',70896,6,5,'2020-12-11 10:31:35','2020-12-11 10:31:35',149.99,2,1,1,''),(28,'Angular & NodeJS - The MEAN Stack Guide [2020 Edition]','Learn how to connect your Angular Frontend to a NodeJS & Express & MongoDB Backend by building a real Application','assets/images/products/Angular-&-NodeJS-The-MEAN-Stack-Guide-[2020-Edition].jpg','USD',14.99,90,'English',4.18,60040,466,'44',68488,6,8,'2020-12-11 10:31:35','2020-12-11 10:31:35',149.99,3,4,1,''),(29,'Node with React: Fullstack Web Development','Build and deploy fullstack web apps with NodeJS, React, Redux, Express, and MongoDB.','assets/images/products/Node.js-The-Complete-Guide-to-Build-RESTful-APIs-(2018).jpg','USD',14.99,90,'English',4.98,87274,413,'36',79754,6,10,'2020-12-11 10:31:35','2020-12-11 10:31:35',149.99,4,4,1,''),(30,'Node.js: The Complete Guide to Build RESTful APIs (2018)','Learn to build fast, scalable and secure RESTful services with Node, Express and MongoDB, from setup to production','assets/images/products/The-Complete-WordPress-Website-Business-Course.jpg','USD',14.99,90,'English',4.35,56247,472,'39',93304,6,7,'2020-12-11 10:31:35','2020-12-11 10:31:35',149.99,2,3,1,''),(31,'The Complete WordPress Website Business Course','Master WordPress with this Complete WordPress Course, without learning how to code and without any programming!','assets/images/products/SEO-2020-Complete-SEO-Training-SEO-for-WordPress-Websites.jpg','USD',14.99,90,'English',4.83,69415,416,'39',77259,7,8,'2020-12-11 10:31:35','2020-12-11 10:31:35',149.99,4,4,1,''),(32,'SEO 2020: Complete SEO Training + SEO for WordPress Websites','Rank 1 on Google with Technical SEO, 1s Pagespeed, UX SEO, Backlink SEO, Keyword Research SEO + WordPress SEO Training','assets/images/products/Wordpress-for-Beginners-Master-Wordpress-Quickly.jpg','USD',14.99,90,'English',4.09,78332,469,'49',56383,7,10,'2020-12-11 10:31:35','2020-12-11 10:31:35',149.99,1,5,1,''),(33,'Wordpress for Beginners - Master Wordpress Quickly','In 2020, build a beautiful responsive Wordpress site that looks great on all devices. No experience required.','assets/images/products/Become-a-WordPress-Developer-Unlocking-Power-With-Code.jpg','USD',14.99,90,'English',4.95,83414,496,'35',50138,7,6,'2020-12-11 10:31:35','2020-12-11 10:31:35',149.99,2,1,1,''),(34,'Become a WordPress Developer: Unlocking Power With Code','Learn PHP, JavaScript, WordPress theming & the WP REST API to Create Custom & Interactive WordPress Websites','assets/images/products/Build-Websites-from-Scratch-with-HTML-&-CSS-1.jpg','USD',14.99,90,'English',4.47,82073,470,'42',81542,7,6,'2020-12-11 10:31:35','2020-12-11 10:31:35',149.99,1,4,1,''),(35,'WordPress Theme Development with Bootstrap','Learn how to confidently develop custom & profitable Responsive WordPress Themes and Websites with no prior experience.','assets/images/products/2020-Complete-Python-Bootcamp-From-Zero-to-Hero-in-Python.jpg','USD',14.99,90,'English',4.53,60125,462,'32',57296,7,8,'2020-12-11 10:31:35','2020-12-11 10:31:35',149.99,3,4,1,''),(36,'2020 Complete Python Bootcamp From Zero to Hero in Python','Learn Python like a Professional Start from the basics and go all the way to creating your own applications and games','assets/images/products/2020-Complete-Python-Bootcamp-From-Zero-to-Hero-in-Python.jpg','USD',13.99,90,'English',4.24,54405,499,'45',91856,8,10,'2020-12-11 10:31:35','2020-12-11 10:31:35',139.99,2,2,1,''),(37,'Python for Data Science and Machine Learning Bootcamp','Learn how to use NumPy, Pandas, Seaborn , Matplotlib , Plotly , Scikit-Learn , Machine Learning, Tensorflow , and more!','assets/images/products/Python-for-Data-Science-and-Machine-Learning-Bootcamp.jpg','USD',13.99,90,'English',4.6,91652,409,'36',87389,8,4,'2020-12-11 10:31:35','2020-12-11 10:31:35',139.99,4,4,1,''),(38,'Learn Python Programming Masterclass','This Python For Beginners Course Teaches You The Python Language Fast. Includes Python Online Training With Python 3','assets/images/products/Learn-Python-Programming-Masterclass.jpg','USD',13.99,90,'English',4.3,95044,451,'37',61376,8,5,'2020-12-11 10:31:35','2020-12-11 10:31:35',139.99,1,4,1,''),(39,'The Python Mega Course: Build 10 Real World Applications','A complete practical Python course for both beginners & intermediates! Master Python 3 by making 10 amazing Python apps.','assets/images/products/The-Python-Mega-Course-Build-10-Real-World-Applications.jpg','USD',13.99,90,'English',4.67,50261,428,'47',94715,8,10,'2020-12-11 10:31:35','2020-12-11 10:31:35',139.99,2,1,1,''),(40,'Python and Django Full Stack Web Developer Bootcamp','Learn to build websites with HTML , CSS , Bootstrap , Javascript , jQuery , Python 3 , and Django!','assets/images/products/Python-and-Django-Full-Stack-Web-Developer-Bootcamp.jpg','USD',13.99,90,'English',4.46,66175,487,'30',89444,8,9,'2020-12-11 10:31:35','2020-12-11 10:31:35',139.99,1,5,1,''),(41,'Flutter & Dart - The Complete Guide [2020 Edition]','A Complete Guide to the Flutter SDK & Flutter Framework for building native iOS and Android apps','assets/images/products/Flutter-&-Dart-The-Complete-Guide-[2020-Edition].jpg','USD',13.99,90,'English',4.31,80093,450,'46',63076,17,5,'2020-12-11 10:31:29','2020-12-11 10:31:29',139.99,4,4,1,''),(42,'The Complete 2020 Flutter Development Bootcamp with Dart','Officially created in collaboration with the Google Flutter team.','assets/images/products/The-Complete-2020-Flutter-Development-Bootcamp-with-Dart.jpg','USD',13.99,90,'English',4.15,51940,490,'44',97051,17,10,'2020-12-11 10:31:29','2020-12-11 10:31:29',139.99,3,4,1,''),(43,'Dart and Flutter: The Complete Developer\'s Guide','Everything you need to know for building mobile apps with Flutter and Dart, including RxDart and Animations!','assets/images/products/Dart-and-Flutter-The-Complete-Developer-Guide.jpg','USD',13.99,90,'English',4.84,69421,499,'34',96023,17,4,'2020-12-11 10:31:29','2020-12-11 10:31:29',139.99,4,4,1,''),(44,'Flutter & Dart - The Complete Flutter App Development Course','Build Flutter iOS and Android Apps with a Single Codebase: Learn Google\'s Flutter Mobile Development Framework & Dart','assets/images/products/Flutter-Dart-The-Complete-Flutter-App-Development-Course.jpg','USD',13.99,90,'English',4.72,91284,424,'31',88963,17,8,'2020-12-11 10:31:29','2020-12-11 10:31:29',139.99,1,2,1,''),(45,'Flutter & Firebase: Build a Complete App for iOS & Android','Learn Dart, Flutter & Firebase by Google, and build a real-world, production ready app','assets/images/products/Flutter-&-Firebase-Build-a-Complete-App-for-iOS-Android.jpg','USD',13.99,90,'English',4.11,98157,427,'42',56744,17,10,'2020-12-11 10:31:29','2020-12-11 10:31:29',139.99,2,3,1,''),(46,'The Complete Android N Developer Course','Learn Android App Development with Android 7 Nougat by building real apps including Uber, Whatsapp and Instagram!','assets/images/products/The-Complete-Android-N-Developer-Course.jpg','USD',19.99,80,'English',4.36,66931,461,'45',66836,18,7,'2020-12-11 10:31:29','2020-12-11 10:31:29',99.99,1,4,1,''),(47,'The Complete Android Oreo Developer Course - Build 23 Apps!','Learn Android O App Development using Java & Kotlin - build real apps including Super Mario Run, Whatsapp and Instagram!','assets/images/products/The-Complete-Android-Oreo-Developer-Course-Build-23-Apps!.jpg','USD',19.99,80,'English',4.5,90187,423,'48',63946,18,7,'2020-12-11 10:31:29','2020-12-11 10:31:29',99.99,4,4,1,''),(48,'Android Java Masterclass - Become an App Developer','Improve your career options by learning Android app Development. Master Android Studio and build your first app today','assets/images/products/Android-Java-Masterclass-Become-an-App-Developer.jpg','USD',19.99,80,'English',4.4,50141,433,'33',69225,18,6,'2020-12-11 10:31:29','2020-12-11 10:31:29',99.99,2,5,1,''),(49,'The Complete Android & Java Developer Course - Build 21 Apps','Learn Android Development, Java & Android Studio from Scratch in 5 Weeks. Build a Diary App & more','assets/images/products/The-Complete-Android-Java-Developer-Course-Build-21-Apps.jpg','USD',19.99,80,'English',4.52,80147,499,'35',54283,18,7,'2020-12-11 10:31:29','2020-12-11 10:31:29',99.99,3,4,1,''),(50,'Android O & Java - The Complete Android Development Bootcamp','Learn Android O app development from beginning to end. Learn to code in Java while building fun Android O projects.','assets/images/products/Android-O-ava-The Complete-Android-Development-Bootcamp.jpg','USD',19.99,80,'English',4.38,50310,490,'47',63743,18,5,'2020-12-11 10:31:29','2020-12-11 10:31:29',99.99,1,3,1,''),(51,'iOS & Swift - The Complete iOS App Development Bootcamp','From Beginner to iOS App Developer with Just One Course! Fully Updated with a Comprehensive Module Dedicated to SwiftUI!','assets/images/products/iOS-Swift-The-Complete-iOS-App-Development-Bootcamp.jpg','USD',19.99,80,'English',4.34,61112,454,'36',55865,19,6,'2020-12-11 10:31:29','2020-12-11 10:31:29',99.99,2,1,1,''),(52,'iOS 11 & Swift 4 - The Complete iOS App Development Bootcamp','Learn iOS 11 App Development From Beginning to End. Using Xcode 9 and Swift 4. Includes Full ARKit and CoreML Modules!','assets/images/products/iOS-11-Swift-4-The-Complete-iOS-App-Development-Bootcamp.jpg','USD',19.99,80,'English',4.58,54629,401,'50',88097,19,4,'2020-12-11 10:31:29','2020-12-11 10:31:29',99.99,1,2,1,''),(53,'iOS 11 & Swift 4: From Beginner to Paid Professional™','Build iOS Apps & Learn iOS 11, Swift 4, ARKit (Augmented Reality), CoreML (Machine Learning)','assets/images/products/iOS-11-&-Swift-4-From-Beginner-to-Paid-Professiona.jpg','USD',19.99,80,'English',4.87,89811,443,'31',72889,19,7,'2020-12-11 10:31:29','2020-12-11 10:31:29',99.99,4,4,1,''),(54,'The Complete iOS 12 & Swift Developer Course - Build 28 Apps','Use Xcode 10 & Swift 4 to make real iOS12 apps like Uber and Instagram, with CoreML & ARKit. Includes AWS Credits & more','assets/images/products/The-Complete-iOS-12-Swift-Developer-Course-Build-28-Apps.jpg','USD',19.99,80,'English',4.63,85166,414,'39',50153,19,6,'2020-12-11 10:31:29','2020-12-11 10:31:29',99.99,2,1,1,''),(55,'iOS & Swift: Become An App Developer','Beginner\'s Guide to Learn iOS, Swift, ARKit, CoreML, App Design, Advanced Programming and Much More','assets/images/products/iOS-Swift-Become-An-App-Developer.jpg','USD',19.99,80,'English',4.51,56394,440,'50',82100,19,10,'2020-12-11 10:31:29','2020-12-11 10:31:29',99.99,4,3,1,''),(56,'iOS & Swift - The Complete iOS App Development Bootcamp','From Beginner to iOS App Developer with Just One Course! Fully Updated with a Comprehensive Module Dedicated to SwiftUI!','assets/images/products/iOS-Swift-Become-An-App-Developer.jpg','USD',19.99,90,'English',4.68,76475,460,'39',60039,20,10,'2020-12-11 10:31:29','2020-12-11 10:31:29',129.99,3,5,1,''),(57,'iOS 11 & Swift 4 - The Complete iOS App Development Bootcamp','Learn iOS 11 App Development From Beginning to End. Using Xcode 9 and Swift 4. Includes Full ARKit and CoreML Modules!','assets/images/products/iOS-11-&-Swift-4-From-Beginner-to-Paid-Professiona.jpg','USD',19.99,90,'English',4.84,63192,477,'37',53897,20,10,'2020-12-11 10:31:29','2020-12-11 10:31:29',129.99,2,1,1,''),(58,'iOS 11 & Swift 4: From Beginner to Paid Professional™','Build iOS Apps & Learn iOS 11, Swift 4, ARKit (Augmented Reality), CoreML (Machine Learning)','assets/images/products/iOS-11-Swift-4-From-Beginner-to-Paid-Professional.jpg','USD',19.99,90,'English',4.19,86536,404,'41',89368,20,10,'2020-12-11 10:31:29','2020-12-11 10:31:29',129.99,1,4,1,''),(59,'iOS 12 & Swift 5 - App Design, UI/UX plus Development','The three-in-one course that teaches app design, UI/UX and iOS development. Includes Sketch and Figma.','assets/images/products/iOS-12-Swift-5-App-Design-UI-UX-plus-Development.jpg','USD',19.99,90,'English',4.41,93101,491,'41',85149,20,7,'2020-12-11 10:31:29','2020-12-11 10:31:29',129.99,4,4,1,''),(60,'Angry Birds, Crossy Road & more: Game Development in Swift 4','Learn how to develop mobile games like Angry Birds, Crossy Road, Color Switch and more for iOS11 in Swift 4','assets/images/products/Angry-Birds-Crossy-Road-more-Game-Development-in-Swift-4.jpg','USD',19.99,90,'English',4.48,55898,442,'31',57640,20,8,'2020-12-11 10:31:29','2020-12-11 10:31:29',129.99,2,3,1,''),(61,'The Complete React Native + Hooks Course [2020 Edition]','Understand React Native v0.62.2 with Hooks, Context, and React Navigation.','assets/images/products/The-Complete-React-Native-Hooks Course-2020-Edition.jpg','USD',19.99,90,'English',4.16,50187,438,'47',82757,21,10,'2020-12-11 10:31:21','2020-12-11 10:31:21',129.99,4,4,1,''),(62,'React Native - The Practical Guide [2020 Edition]','Use React Native and your React knowledge to build native iOS and Android Apps - incl. Push Notifications, Hooks, Redux','assets/images/products/React-Native-ThePractical-Guide-2020 Edition.jpg','USD',19.99,90,'English',4.39,83244,466,'47',90860,21,7,'2020-12-11 10:31:21','2020-12-11 10:31:21',129.99,1,4,1,''),(63,'The complete React Native course ( 2021 edition )','Take you coding to the next level with React Native.','assets/images/products/The-complete-react-native-and-redux-course.jpg','USD',19.99,90,'English',4.46,65657,412,'46',56030,21,7,'2020-12-11 10:31:21','2020-12-11 10:31:21',129.99,3,4,1,''),(64,'Master React Native Animations','Simple, easy to follow, step-by-step lessons for every type of animation','assets/images/products/Master-React-Native-Animations.jpg','USD',19.99,90,'English',4.14,78555,464,'37',57573,21,7,'2020-12-11 10:31:21','2020-12-11 10:31:21',129.99,1,5,1,''),(65,'Build Full-stack React Native Apps with Express.js Backend','Learn how to build full-stack mobile apps using React Native, Redux, React Navigation with Express.js on the backend.','assets/images/products/Build-Full-stack-React-Native-Apps-with-Express.js-Backend,js.jpg','USD',19.99,90,'English',4.3,95802,482,'39',69774,21,10,'2020-12-11 10:31:21','2020-12-11 10:31:21',129.99,4,3,1,''),(66,'Flutter & Dart - The Complete Guide [2020 Edition]','A Complete Guide to the Flutter SDK & Flutter Framework for building native iOS and Android apps','assets/images/products/Flutter-Dart-The-Complete-Guide-[2020-Edition].jpg','USD',14.99,90,'English',4.07,93345,416,'32',76150,22,5,'2020-12-11 10:31:21','2020-12-11 10:31:21',149.99,2,1,1,''),(67,'Dart and Flutter: The Complete Developer\'s Guide','Everything you need to know for building mobile apps with Flutter and Dart, including RxDart and Animations!','assets/images/products/The-Complete-Dart-Guide-for-Beginners-and-Beyond.jpg','USD',14.99,90,'English',4.47,79319,439,'35',71429,22,6,'2020-12-11 10:31:21','2020-12-11 10:31:21',149.99,4,4,1,''),(68,'Flutter & Dart - The Complete Flutter App Development Course','Build Flutter iOS and Android Apps with a Single Codebase: Learn Google\'s Flutter Mobile Development Framework & Dart','assets/images/products/Flutter-Dart-The-Complete-Flutter-App-Development-Course-1.jpg','USD',14.99,90,'English',4.13,66559,444,'49',78695,22,10,'2020-12-11 10:31:21','2020-12-11 10:31:21',149.99,1,2,1,''),(69,'Dart - Beginners Course','No experience required','assets/images/products/Dart-Beginners-Course.jpg','USD',14.99,90,'English',4.23,94840,404,'47',79189,22,8,'2020-12-11 10:31:21','2020-12-11 10:31:21',149.99,2,1,1,''),(70,'The Complete Dart Guide for Beginners and Beyond','Learn Dart Programming in depth. Includes: basic to advanced topics, exercises, and projects. Fully updated to Dart 2.10','assets/images/products/The-Complete-Dart-Guide-for Beginners-and-Beyond.jpg','USD',14.99,90,'English',4.75,74521,492,'37',59860,22,6,'2020-12-11 10:31:21','2020-12-11 10:31:21',149.99,3,4,1,''),(71,'Android App Development Masterclass using Kotlin','Learn Kotlin Android App Development And Become an Android Developer. Incl. Kotlin Tutorial and Android Tutorial Videos','assets/images/products/Android-App-Development-Masterclass-using-Kotlin.jpg','USD',14.99,90,'English',4.07,88085,443,'36',61733,23,10,'2020-12-11 10:31:21','2020-12-11 10:31:21',149.99,4,4,1,''),(72,'The Complete Android Kotlin Developer Course','Learn how to build 17 online games, and apps for Android Q, like Pokémon , twitter,Tic Tac Toe, and notepad using Kotlin','assets/images/products/The-Complete-Android-Kotlin-Developer-Course.jpg','USD',14.99,90,'English',4.1,66862,439,'40',79084,23,6,'2020-12-11 10:31:21','2020-12-11 10:31:21',149.99,2,5,1,''),(73,'Kotlin for Android: Beginner to Advanced','Kotlin is an expressive, concise & powerful development language on Android. Learn everything you need to know to start','assets/images/products/Kotlin-for-Android-Beginner-to-Advanced.jpg','USD',14.99,90,'English',4.29,70054,467,'40',60221,23,5,'2020-12-11 10:31:21','2020-12-11 10:31:21',149.99,4,4,1,''),(74,'The Complete Android 10 & Kotlin Development Masterclass','Learn Android 10 App Development From Beginner to Advanced Developer. Build Apps like Trello, 7Min Workout, Weather App','assets/images/products/The-Complete-Android-10-Kotlin-Development-Masterclass.jpg','USD',14.99,90,'English',4.16,99687,415,'49',63853,23,4,'2020-12-11 10:31:21','2020-12-11 10:31:21',149.99,1,4,1,''),(75,'Kotlin for Java Developers','Use your Java skills to learn Kotlin fast. Enhance career prospects and master Kotlin, including Java interoperability','assets/images/products/Kotlin-for-Java-Developers.jpg','USD',19.99,80,'English',4.92,88271,479,'36',88602,23,6,'2020-12-11 10:31:21','2020-12-11 10:31:21',99.99,2,3,1,''),(76,'Modern React with Redux [2020 Update]','Master React v16.6.3 and Redux with React Router, Webpack, and Create-React-App. Includes Hooks!','assets/images/products/Modern-React-with-Redux-[2020-Update]-1.jpg','USD',19.99,80,'English',4.11,92292,446,'45',51450,24,10,'2020-12-11 10:31:21','2020-12-11 10:31:21',99.99,1,2,1,''),(77,'The Complete React Native + Hooks Course [2020 Edition]','Understand React Native v0.62.2 with Hooks, Context, and React Navigation.','assets/images/products/The-complete-react-native-and-redux-course.jpg','USD',19.99,80,'English',4.8,96649,494,'43',91447,24,6,'2020-12-11 10:31:21','2020-12-11 10:31:21',99.99,3,4,1,''),(78,'Advanced React and Redux','Walkthroughs on advanced React v16.6.3 and Redux v4.0.0 - Authentication, Testing, Middlewares, HOC\'s, and Deployment','assets/images/products/React-redux-tutorial,jpg.jpg','USD',19.99,80,'English',4.66,56367,431,'30',52883,24,4,'2020-12-11 10:31:21','2020-12-11 10:31:21',99.99,2,1,1,''),(79,'Server Side Rendering with React and Redux','Build React, Redux, and React Router apps using Server Side Rendering (SSR), Isomorphic, and Universal JS techniques','assets/images/products/React-redux-tutorial-1.jpg..jpg','USD',19.99,80,'English',4.93,91893,476,'35',90078,24,5,'2020-12-11 10:31:21','2020-12-11 10:31:21',99.99,4,4,1,''),(80,'React JS Web Development - The Essentials Bootcamp','Bootcamp on the React.js essentials. Gain a strong foundation of the core concepts, and build exciting and useful apps!','assets/images/products/React-redux-tutorial-1.jpg','USD',19.99,80,'English',4.64,90361,483,'34',91739,24,10,'2020-12-11 10:31:21','2020-12-11 10:31:21',99.99,1,5,1,'');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_chapter`
--

DROP TABLE IF EXISTS `course_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_chapter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `length` varchar(45) DEFAULT NULL,
  `course_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `num_lecture` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_course_section_idx` (`course_id`),
  CONSTRAINT `FK_course_section` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_chapter`
--

LOCK TABLES `course_chapter` WRITE;
/*!40000 ALTER TABLE `course_chapter` DISABLE KEYS */;
INSERT INTO `course_chapter` VALUES (1,NULL,'Beginner',NULL,1,NULL,NULL,NULL),(2,NULL,'Intermediate',NULL,1,NULL,NULL,NULL),(3,NULL,'Advanced',NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `course_chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_chapter_section`
--

DROP TABLE IF EXISTS `course_chapter_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_chapter_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `length` varchar(45) DEFAULT NULL,
  `can_be_preview` tinyint DEFAULT NULL,
  `chapter_id` int NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `url_video` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_section_idx` (`chapter_id`),
  CONSTRAINT `FK_section` FOREIGN KEY (`chapter_id`) REFERENCES `course_chapter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_chapter_section`
--

LOCK TABLES `course_chapter_section` WRITE;
/*!40000 ALTER TABLE `course_chapter_section` DISABLE KEYS */;
INSERT INTO `course_chapter_section` VALUES (1,NULL,' Introduction and Resources','2',0,1,'2021-01-03 01:10:18','2021-01-03 01:10:18','assets/video/courses/introduction-and-resources.mp4'),(2,NULL,'Create and Style the Home Page','15',0,1,'2021-01-03 01:10:18','2021-01-03 01:10:18','assets/video/courses/create-and-style-the-home-page.mp4'),(3,NULL,'Create and Style the Game Page','7',0,1,'2021-01-03 01:10:18','2021-01-03 01:10:18','assets/video/courses/display-hard-coded-questions-and-answers.mp4'),(4,NULL,'Display Hard Coded Questions and Answers','18',0,1,'2021-01-03 01:10:18','2021-01-03 01:10:18','assets/video/courses/display-hard-coded-questions-and-answers (2).mp4'),(5,NULL,'Display Feedback for Correct/Incorrect','8',0,2,'2021-01-03 01:10:18','2021-01-03 01:10:18','assets/video/courses/create-and-style-the-home-page2.mp4'),(6,NULL,'Create Heads Up Display (HUD)','8',0,2,'2021-01-03 01:10:18','2021-01-03 01:10:18','assets/video/courses/create-head-up -display-(hud).mp4'),(7,NULL,'Create a Progress Bar','9',0,2,'2021-01-03 01:10:18','2021-01-03 01:10:18','assets/video/courses/create-a-progress-bar.mp4'),(8,NULL,'Create and Style the End Page','13',0,2,'2021-01-03 01:10:18','2021-01-03 01:10:18','assets/video/courses/create-and-style-the-end-page.mp4'),(9,NULL,'Save High Scores in Local Storage','11',0,3,'2021-01-03 01:10:18','2021-01-03 01:10:18','assets/video/courses/save-high-scores-in-local-storage.mp4'),(10,NULL,'Load and Display High Scores from Local','9',0,3,'2021-01-03 01:10:18','2021-01-03 01:10:18','assets/video/courses/load-and-display-high-scores-from-local-storage.mp4'),(11,NULL,'Fetch API to Load Questions from Local','9',0,3,'2021-01-03 01:10:18','2021-01-03 01:10:18','assets/video/courses/fetch-api-to-load-questions-from-local-json-file.mp4'),(12,NULL,'Fetch API to Load Questions from Open','6',0,3,'2021-01-03 01:10:18','2021-01-03 01:10:18','assets/video/courses/fetch-api-to-load-questions-from-open-trivia-db-api.mp4'),(13,NULL,'Create a Spinning Loader','7',0,3,'2021-01-03 01:10:18','2021-01-03 01:10:18','assets/video/courses/create-a-spinning-loader-.mp4'),(14,NULL,'Closing','1',0,3,'2021-01-03 01:10:18','2021-01-03 01:10:18','assets/video/courses/closing.mp4');
/*!40000 ALTER TABLE `course_chapter_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_review`
--

DROP TABLE IF EXISTS `course_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `course_id` int NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_course_review_idx` (`course_id`),
  KEY `FK_user_review_idx` (`user_id`),
  CONSTRAINT `FK_course_review` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_user_review` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_review`
--

LOCK TABLES `course_review` WRITE;
/*!40000 ALTER TABLE `course_review` DISABLE KEYS */;
INSERT INTO `course_review` VALUES (1,1,1,'It\'s good. I have learning many thing from this course',5,'2020-12-11 23:27:40','2020-12-11 23:27:45'),(2,2,1,'it\'s bad, you guy speak so bad, it\'s har to listen',3,'2020-12-11 23:28:27','2020-12-11 23:28:32'),(3,3,1,'pretty good, but you need enhance it a little bit',NULL,'2020-12-11 23:29:01','2020-12-11 23:29:04'),(22,24,30,'sfsdfdsfdsfsfsfffffff',5,'2021-01-16 15:51:15','2021-01-16 15:51:15'),(23,24,30,'sdfdsfdsfdsf',4,'2021-01-16 15:52:13','2021-01-16 15:52:13'),(24,24,30,'',3,'2021-01-16 15:53:18','2021-01-16 15:53:18'),(25,24,2,'sdfsdfsdfsdfdsfdsfsdfsdf',5,'2021-01-16 15:56:08','2021-01-16 15:56:08'),(26,24,2,'gggg',5,'2021-01-17 15:15:14','2021-01-17 15:15:14');
/*!40000 ALTER TABLE `course_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incentive`
--

DROP TABLE IF EXISTS `incentive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incentive` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `course_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_course_incentive_idx` (`course_id`),
  CONSTRAINT `FK_course_incentive` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incentive`
--

LOCK TABLES `incentive` WRITE;
/*!40000 ALTER TABLE `incentive` DISABLE KEYS */;
/*!40000 ALTER TABLE `incentive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `id` int NOT NULL,
  `rating` float(9,2) DEFAULT NULL,
  `num_review` int DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `num_student_enroll` int DEFAULT NULL,
  `num_course` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `contact_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_user` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (4,4.53,50849,NULL,NULL,51855,47,'2020-12-11 11:35:55','2020-12-11 11:35:55',NULL),(5,4.84,59532,NULL,NULL,56363,12,'2020-12-11 11:35:55','2020-12-11 11:35:55',NULL),(6,4.64,95113,NULL,NULL,76253,18,'2020-12-11 11:35:55','2020-12-11 11:35:55',NULL),(7,4.68,96966,NULL,NULL,62172,4,'2020-12-11 11:35:55','2020-12-11 11:35:55',NULL),(8,4.46,99491,NULL,NULL,82104,16,'2020-12-11 11:35:55','2020-12-11 11:35:55',NULL),(9,4.27,56555,NULL,NULL,74003,15,'2020-12-11 11:35:55','2020-12-11 11:35:55',NULL),(10,4.96,84304,NULL,NULL,73703,30,'2020-12-11 11:35:55','2020-12-11 11:35:55',NULL),(24,4.67,84304,NULL,NULL,74003,32,'2021-01-17 23:11:31','2021-01-17 23:11:36',NULL);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_price` varchar(45) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `refund_date` datetime DEFAULT NULL,
  `invoice_status_id` int NOT NULL DEFAULT '1',
  `user_id` int NOT NULL,
  `payment_type_id` int NOT NULL DEFAULT '8',
  `coupon_id` int NOT NULL DEFAULT '1',
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_invoice_user_idx` (`user_id`),
  KEY `FK_invoice_coupon_idx` (`coupon_id`),
  KEY `FK_invoice_payment_type_idx` (`payment_type_id`),
  KEY `FK_invoice_invoice_status_idx` (`invoice_status_id`),
  CONSTRAINT `FK_invoice_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`),
  CONSTRAINT `FK_invoice_invoice_status` FOREIGN KEY (`invoice_status_id`) REFERENCES `invoice_status` (`id`),
  CONSTRAINT `FK_invoice_payment_type` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`),
  CONSTRAINT `FK_invoice_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,'39.99','2021-01-07 11:56:37',NULL,1,11,8,1,NULL,'2021-01-08 09:26:07'),(2,'29.99','2021-01-12 13:07:49',NULL,1,12,8,2,NULL,'2021-01-17 15:06:19'),(3,'49.99',NULL,NULL,1,13,8,1,NULL,NULL),(17,NULL,'2021-01-12 15:29:19',NULL,3,23,5,1,'2021-01-12 13:05:23','2021-01-12 15:29:19'),(18,NULL,'2021-01-12 15:31:23',NULL,1,23,8,1,'2021-01-12 15:30:13','2021-01-12 15:31:23'),(19,NULL,'2021-01-14 11:24:09',NULL,3,24,5,1,'2021-01-12 17:30:10','2021-01-14 11:24:09'),(20,NULL,'2021-01-17 15:13:53',NULL,3,22,5,1,'2021-01-13 16:10:01','2021-01-17 15:13:53'),(21,NULL,'2021-01-17 18:50:54',NULL,3,24,5,3,'2021-01-17 18:49:48','2021-01-17 18:50:54'),(22,NULL,'2021-01-17 18:56:22',NULL,3,24,5,1,'2021-01-17 18:55:47','2021-01-17 18:56:22'),(23,NULL,NULL,NULL,1,22,8,1,'2021-01-18 03:46:31','2021-01-18 03:46:31');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_course`
--

DROP TABLE IF EXISTS `invoice_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int NOT NULL,
  `course_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_invoice_course_idx` (`course_id`),
  KEY `FK_specify_invoice_idx` (`invoice_id`),
  CONSTRAINT `FK_specify_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_specify_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_course`
--

LOCK TABLES `invoice_course` WRITE;
/*!40000 ALTER TABLE `invoice_course` DISABLE KEYS */;
INSERT INTO `invoice_course` VALUES (1,1,11,NULL,NULL),(2,1,12,NULL,NULL),(3,1,13,NULL,NULL),(4,2,14,NULL,NULL),(5,2,15,NULL,NULL),(6,2,16,NULL,NULL),(7,3,17,NULL,NULL),(8,3,18,NULL,NULL),(9,3,19,NULL,NULL),(12,17,1,'2021-01-12 13:05:23','2021-01-12 13:05:23'),(13,17,2,NULL,NULL),(16,18,2,'2021-01-12 17:26:49','2021-01-12 17:26:49'),(17,19,2,'2021-01-12 17:30:10','2021-01-12 17:30:10'),(18,19,5,'2021-01-12 17:31:19','2021-01-12 17:31:19'),(19,19,57,'2021-01-12 17:34:21','2021-01-12 17:34:21'),(20,18,40,'2021-01-12 18:02:35','2021-01-12 18:02:35'),(21,18,5,'2021-01-12 18:05:51','2021-01-12 18:05:51'),(22,18,5,'2021-01-12 18:08:09','2021-01-12 18:08:09'),(23,19,30,'2021-01-12 18:13:37','2021-01-12 18:13:37'),(24,19,30,'2021-01-12 18:13:59','2021-01-12 18:13:59'),(25,19,30,'2021-01-12 18:14:05','2021-01-12 18:14:05'),(26,20,2,'2021-01-13 16:10:01','2021-01-13 16:10:01'),(27,20,57,'2021-01-13 16:23:38','2021-01-13 16:23:38'),(28,20,23,'2021-01-13 16:30:57','2021-01-13 16:30:57'),(29,20,23,'2021-01-13 16:31:00','2021-01-13 16:31:00'),(30,20,23,'2021-01-13 16:31:40','2021-01-13 16:31:40'),(31,20,5,'2021-01-13 16:32:56','2021-01-13 16:32:56'),(32,20,4,'2021-01-13 16:33:26','2021-01-13 16:33:26'),(33,20,42,'2021-01-13 16:33:48','2021-01-13 16:33:48'),(34,18,27,'2021-01-13 16:36:50','2021-01-13 16:36:50'),(35,18,27,'2021-01-13 16:37:09','2021-01-13 16:37:09'),(36,18,27,'2021-01-13 16:37:20','2021-01-13 16:37:20'),(37,18,27,'2021-01-13 16:37:38','2021-01-13 16:37:38'),(38,21,1,'2021-01-17 18:49:48','2021-01-17 18:49:48'),(39,21,57,'2021-01-17 18:49:57','2021-01-17 18:49:57'),(40,22,27,'2021-01-17 18:55:47','2021-01-17 18:55:47'),(41,23,6,'2021-01-18 03:46:31','2021-01-18 03:46:31');
/*!40000 ALTER TABLE `invoice_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_status`
--

DROP TABLE IF EXISTS `invoice_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_status`
--

LOCK TABLES `invoice_status` WRITE;
/*!40000 ALTER TABLE `invoice_status` DISABLE KEYS */;
INSERT INTO `invoice_status` VALUES (1,'Chưa thanh toán',NULL,NULL),(2,'Đang thanh toán',NULL,NULL),(3,'Đã thanh toán',NULL,NULL),(4,'Yêu cầu hoàn tiền',NULL,NULL),(5,'Đã hoàn tiền',NULL,NULL),(6,'Yêu cầu hủy',NULL,NULL),(7,'Đã hủy',NULL,NULL);
/*!40000 ALTER TABLE `invoice_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `level` (
  `id` int NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'Beginner','2020-12-11 10:54:23','2020-12-11 10:54:23'),(2,'Intermediate','2020-12-11 10:54:23','2020-12-11 10:54:23'),(3,'Expert','2020-12-11 10:54:23','2020-12-11 10:54:23'),(4,'All Levels','2020-12-11 10:54:23','2020-12-11 10:54:23');
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objective`
--

DROP TABLE IF EXISTS `objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objective` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `course_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_course_objective_idx` (`course_id`),
  CONSTRAINT `FK_course_objective` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objective`
--

LOCK TABLES `objective` WRITE;
/*!40000 ALTER TABLE `objective` DISABLE KEYS */;
/*!40000 ALTER TABLE `objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES (1,'Thanh toán bằng thẻ ATM. Internet Banking',NULL,NULL),(2,'Thanh toán bằng thẻ quốc tế',NULL,NULL),(3,'Thanh toán bằng ví điện tử MoMo',NULL,NULL),(4,'Thanh toán bằng cổng ViettelPay',NULL,NULL),(5,'Thanh toán bằng cổng VnPay',NULL,NULL),(6,'Thanh toán bằng cổng AirPay',NULL,NULL),(7,'Chuyển khoản ngân hàng',NULL,NULL),(8,'Chưa xét',NULL,NULL);
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requiment`
--

DROP TABLE IF EXISTS `requiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requiment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `course_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_course_requiment_idx` (`course_id`),
  CONSTRAINT `FK_course_requiment` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requiment`
--

LOCK TABLES `requiment` WRITE;
/*!40000 ALTER TABLE `requiment` DISABLE KEYS */;
INSERT INTO `requiment` VALUES (1,'No coding experience is necessary to take this course! I take you from beginner to expert!',1,NULL,NULL),(2,'Any computer and OS will work — Windows, macOS or Linux. We will set up your text editor the course.',1,NULL,NULL),(3,'A basic understanding of HTML and CSS is a plus, but not a must! The course includes an HTML and CSS crash course.',1,NULL,NULL);
/*!40000 ALTER TABLE `requiment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(45) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Guest','2020-12-11 10:33:02','2020-12-11 10:33:02'),(2,'Student','2020-12-11 10:33:02','2020-12-11 10:33:02'),(3,'Instructor','2020-12-11 10:33:02','2020-12-11 10:33:02'),(4,'Admin','2020-12-11 10:33:02','2020-12-11 10:33:02');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category`
--

DROP TABLE IF EXISTS `sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category`
--

LOCK TABLES `sub_category` WRITE;
/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
INSERT INTO `sub_category` VALUES (1,'JavaScript','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(2,'React','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(3,'Angular','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(4,'CSS','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(5,'PHP','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(6,'Nodejs','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(7,'WordPress','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(8,'Python','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(9,'Machine Learning','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(10,'Deep Learning','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(11,'Data Analyst','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(12,'Atificial Itelligence','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(13,'R','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(14,'Tensor Flow','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(15,'Neural Network','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(16,'Google Flutter','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(17,'Android Development','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(18,'IOS Development','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(19,'Swift','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(20,'React Native','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(21,'Dart Programing Language','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(22,'Kortlin','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(23,'Redux Framework','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(24,'Java','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(25,'C#','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(26,'C++','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(27,'C','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(28,'Go Programming Language','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(29,'Spring Framework','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(30,'Unity','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(31,'Game Development','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(32,'Unreal Engine','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(33,'3D Game Development','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(34,'2D Game Development','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(35,'Unreal Engine Blueprint','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(36,'Blender','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(37,'SQL','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(38,'MySQL','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(39,'Oracle SQL','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(40,'MongoDB','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(41,'Oracle Certification','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(42,'SQL Server','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(43,'Apache Kafka','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(44,'PostgreSQL','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(45,'Database Programming','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(46,'Selenium Webdriver','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(47,'Automation Testing','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(48,'Selenium Testing','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(49,'API Testing','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(50,'Cypress.io','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(51,'RESS Arused','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(52,'Appium','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(53,'Coding Interview','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(54,'Kubernetes','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(55,'Certified Kubernetes','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(56,'Data Structures','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(57,'Microservices','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(58,'Agile','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(59,'Docker','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(60,'Git','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(61,'DevOps','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(62,'Jetkins','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(63,'JIRA','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(64,'Aws Certified Solutions','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(65,'Continuous Integration','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(66,'Confluence','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(67,'Elementor','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(68,'Wix','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(69,'Bubble Visual Programming','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(70,'Microsoft Powerapps','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(71,'Microsoft Flow','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(72,'Web Design','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(73,'Startup','2020-12-05 15:36:23','2020-12-05 15:36:31',1),(78,'dfdsfdsfdsfdsfdsfsdfdsf','2021-01-14 11:21:24','2021-01-14 11:21:24',1),(79,'sdfdsfdsfdsf','2021-01-17 13:52:30','2021-01-17 13:52:30',1),(80,'sdfdsfds','2021-01-18 03:26:49','2021-01-18 03:26:49',1),(81,'sdfdsfds','2021-01-18 03:26:50','2021-01-18 03:26:50',1),(82,'sdfdsfds','2021-01-18 03:26:51','2021-01-18 03:26:51',1),(83,'sdfdddddddddsfds','2021-01-18 03:27:00','2021-01-18 03:27:00',1);
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `gender` tinyint DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `address_street` varchar(255) DEFAULT NULL,
  `district` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `role_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_role_idx` (`role_id`),
  CONSTRAINT `FK_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Tô','Hoàng Trung','hoangtrung1234@gmail.com',NULL,NULL,NULL,1,'hoangtrung1234','$2b$10$5QDCNTOHoG8lXixJpa6nHu3WCY19eU7Q5uw/6niRxzbRBlBZLaOV2','1990-01-01 11:05:09',NULL,NULL,NULL,'Viet Nam',4,'2020-12-11 11:05:09','2021-01-18 03:50:50',0),(2,'Vũ ','Duy Quang','duyquang1234@gmail.com',NULL,NULL,NULL,1,'duyquang1234','$2b$10$/JfF8kFpolRGZRlCtOxqnubIc4Do7Uoz8fksNmXGDdL8nkpb07fuy','1990-01-01 11:05:09',NULL,NULL,NULL,'Viet Nam',4,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(3,'Nguyễn','Hoàng Phúc','hoangphuc1234@gmail.com',NULL,NULL,NULL,1,'hoangphuc1234','$2b$10$/JfF8kFpolRGZRlCtOxqnubIc4Do7Uoz8fksNmXGDdL8nkpb07fuy','1990-01-01 11:05:09',NULL,NULL,NULL,'Viet Nam',3,'2020-12-11 11:05:09','2021-01-17 13:57:06',1),(4,'Master','Trần','schwarzmüller1234@gmail.com','assets/images/users/Master-Tran.jpg','Founder of Acamotion',NULL,1,'schwarzmüller1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'Viet Nam',3,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(5,'Nguyễn','Hiếu','schmedtmann1234@gmail.com','assets/images/users/nguyen-hieu.jpg','VietNam Yoga Ambassdor - CEO Zenlife Yoga',NULL,1,'schmedtmann1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'Viet Nam',3,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(6,'Mai','Xuân Huy','grider1234@gmail.com','assets/images/users/mai-xuan-huy.jpg','Photoshop Instructor',NULL,1,'grider1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'Viet Nam',3,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(7,'Đặng','Trọng Khang','portilla1234@gmail.com','assets/images/users/dang-trong-khang.jpg','Causality Investing Speaker',NULL,1,'portilla1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'Viet Nam',3,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(8,'Nguyễn ','Cảnh Tuấn','diaz1234@gmail.com','assets/images/users/nguyen-canh-tuan.jpg','English Instructor',NULL,1,'faculty solutions1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'Viet Nam',3,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(9,'Hà','Kế Tú','schiff1234@gmail.com','assets/images/users/ha-ke-tu.jpg','Guitar Instructor - Famous Youtuber - Vietnamese guitar community',NULL,1,'schiff1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'Viet Nam',3,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(10,'Hồ','Ngọc Cương','grider1234@gmail.com','assets/images/users/ho-ngoc-cuong.jpg','English Instructor',NULL,1,'grider1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'Viet Nam',3,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(11,'Jonas','Schmedtmann','schmedtmann1234@gmail.com',NULL,NULL,NULL,1,'schmedtmann1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'USA',3,'2020-12-11 11:05:09','2021-01-18 03:28:15',0),(12,'Dr. Angela','Yu','yu1234@gmail.com',NULL,NULL,NULL,0,'yu1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'USA',2,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(13,'FutureX','Skill','skill1234@gmail.com',NULL,NULL,NULL,0,'skill1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'USA',2,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(14,'Dipnarayan ','Das','das1234@gmail.com',NULL,NULL,NULL,0,'das1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'USA',2,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(15,'Arun','Kumar','kumar1234@gmail.com',NULL,NULL,NULL,0,'kumar1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'USA',2,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(16,'Laurence ','Svekis','svekis1234@gmail.com',NULL,NULL,NULL,0,'svekis1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'USA',2,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(17,'Justin','Mitchel','mitchel1234@gmail.com',NULL,NULL,NULL,0,'mitchel1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'USA',2,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(18,'Balaji ','Sridharan','sridharan1234@gmail.com',NULL,NULL,NULL,0,'sridharan1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'USA',2,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(19,'Jose ','Portilla','portilla1234@gmail.com',NULL,NULL,NULL,0,'portilla1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'USA',2,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(20,'Ardit ','Sulce','sulce1234@gmail.com',NULL,NULL,NULL,0,'sulce1234','123456','1990-01-01 11:05:09',NULL,NULL,NULL,'USA',2,'2020-12-11 11:05:09','2020-12-11 11:05:09',1),(22,'To','Hoang Trung','','assets/images/users/Master-Tran.jpg',NULL,NULL,NULL,'trung123','$2b$10$/JfF8kFpolRGZRlCtOxqnubIc4Do7Uoz8fksNmXGDdL8nkpb07fuy',NULL,NULL,NULL,NULL,NULL,4,'2021-01-11 14:27:17','2021-01-11 14:27:17',1),(23,NULL,NULL,'hoangtrung14121412@gmail.com',NULL,NULL,NULL,NULL,'ok1000','$2b$10$auUnHGoa2PEAGFVyLUK/hunzK.7pMawJCS8wF46oCSG1IhN.wPdQC',NULL,NULL,NULL,NULL,NULL,4,'2021-01-12 09:03:06','2021-01-12 09:03:06',1),(24,NULL,NULL,'hoangtrung14121412@gmail.com',NULL,NULL,NULL,NULL,'ok1001','$2b$10$aGYrI6RyimrtAmtex5/Kveb2AI91V7WyBcEaluXhWM6ZXVg8Cy7z6',NULL,NULL,NULL,NULL,NULL,3,'2021-01-12 17:28:46','2021-01-12 17:28:46',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_course`
--

DROP TABLE IF EXISTS `user_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `course_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_course_enroll_idx` (`course_id`),
  KEY `FK_user_enroll_idx` (`user_id`),
  CONSTRAINT `FK_course_enroll` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_user_enroll` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_course`
--

LOCK TABLES `user_course` WRITE;
/*!40000 ALTER TABLE `user_course` DISABLE KEYS */;
INSERT INTO `user_course` VALUES (1,11,1,NULL,NULL,1),(2,12,1,NULL,NULL,1),(3,13,1,NULL,NULL,1),(4,11,2,NULL,NULL,1),(5,12,3,NULL,NULL,1),(6,13,4,NULL,NULL,1),(7,11,5,NULL,NULL,2),(8,12,6,NULL,NULL,2),(9,13,7,NULL,NULL,2),(10,11,8,NULL,NULL,2),(12,24,2,NULL,NULL,2),(21,24,2,'2021-01-14 11:24:09','2021-01-14 11:24:09',2),(24,24,30,'2021-01-14 11:24:09','2021-01-14 11:24:09',2),(26,24,30,'2021-01-14 11:24:09','2021-01-14 11:24:09',2),(36,24,35,NULL,NULL,1),(38,24,40,NULL,NULL,2),(39,24,41,NULL,NULL,2),(40,24,42,NULL,NULL,2),(41,24,43,NULL,NULL,2),(42,24,44,NULL,NULL,2),(43,23,1,NULL,NULL,1),(44,23,2,NULL,NULL,2),(45,23,3,NULL,NULL,1),(46,23,4,NULL,NULL,2),(47,23,5,NULL,NULL,1),(48,23,6,NULL,NULL,2),(49,23,7,NULL,NULL,1),(50,23,8,NULL,NULL,2),(51,22,2,'2021-01-17 15:13:53','2021-01-17 15:13:53',1),(52,22,57,'2021-01-17 15:13:53','2021-01-17 15:13:53',1),(53,22,23,'2021-01-17 15:13:53','2021-01-17 15:13:53',NULL),(54,22,23,'2021-01-17 15:13:53','2021-01-17 15:13:53',1),(55,22,23,'2021-01-17 15:13:53','2021-01-17 15:13:53',1),(56,22,5,'2021-01-17 15:13:53','2021-01-17 15:13:53',1),(57,22,4,'2021-01-17 15:13:53','2021-01-17 15:13:53',1),(58,22,42,'2021-01-17 15:13:53','2021-01-17 15:13:53',1),(59,24,1,NULL,NULL,2),(60,24,1,'2021-01-17 18:50:54','2021-01-17 18:50:54',2),(61,24,57,'2021-01-17 18:50:54','2021-01-17 18:50:54',2),(62,24,27,'2021-01-17 18:56:22','2021-01-17 18:56:22',2);
/*!40000 ALTER TABLE `user_course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-20 21:34:41
