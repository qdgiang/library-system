-- drop database mylib; hoac delete tat ca table truoc khi run
CREATE DATABASE  IF NOT EXISTS `mylib` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mylib`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: mylib
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `authors_have_books`
--

DROP TABLE IF EXISTS `authors_have_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors_have_books` (
  `a_name` varchar(50) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  PRIMARY KEY (`a_name`,`isbn`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `authors_have_books_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors_have_books`
--

LOCK TABLES `authors_have_books` WRITE;
/*!40000 ALTER TABLE `authors_have_books` DISABLE KEYS */;
INSERT INTO `authors_have_books` VALUES ('Lay, David','10'),('Lay, Steven ','10'),('McDonald, Judi','10'),('Dimitri P. Bertsekas','11'),('John N. Tsitsiklis','11'),('Devore, Jay L.','12'),('J.K. Rowling','15'),('J.K. Rowling','16'),('J.K. Rowling','17'),('Giancoli, Douglas','19'),('Aho, Alfred ','20'),('Hopcroft, John','20'),('Ullman, Jeffrey','20'),('Mazzucchelli, David','4'),('Miller, Frank','4'),('Alan Grant ','5'),('Chuck Dixon','5'),('Doug Moench','5'),('Jo Duffy','5');
/*!40000 ALTER TABLE `authors_have_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `isbn` varchar(20) NOT NULL,
  `no_of_copies` int DEFAULT '0',
  `title` varchar(100) DEFAULT NULL,
  `b_year` year DEFAULT '2001',
  `publisher` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('1',0,'Modern Database Management (11th Edition)',2012,NULL),('10',0,'Linear Algebra and Its Applications',2014,NULL),('11',0,'Introduction To Probability, 2nd Edition',2008,NULL),('12',0,'Probability and Statistics for Engineering and the Sciences',2015,NULL),('13',0,'The Amazing Spiderman',1992,NULL),('14',0,'Applied Predictive Modeling',2013,NULL),('15',0,'Harry Potter and the Philosopher\'s Stone',2000,NULL),('16',0,'Harry Potter and the Half-Blood Prince',2005,NULL),('17',0,'Harry Potter And The Goblet Of Fire',2003,NULL),('18',0,'Fundamentals of Discrete Math for Computer Science',2012,NULL),('19',0,'Physics for Scientists & Engineers',2008,NULL),('2',0,'Database Systems: Design, Implementation, & Management',2014,NULL),('20',0,'Data Structures and Algorithms',1983,NULL),('3',0,'Learning Python, 5th Edition',2013,NULL),('4',0,'Batman: Year One',2007,NULL),('5',0,'Batman: Knightfall, Vol. 2: Knightquest',2012,NULL),('6',0,'Batman: The Dark Knight: Master Race',2017,NULL),('7',0,'Superman: Red Son',2004,NULL),('8',0,'Superman: Emperor Joker',2007,NULL),('9',0,'Calculus, 7th Edition',2012,NULL);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_has_categories`
--

DROP TABLE IF EXISTS `book_has_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_has_categories` (
  `isbn` varchar(20) NOT NULL,
  `cateID` int NOT NULL,
  PRIMARY KEY (`cateID`,`isbn`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `book_has_categories_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE,
  CONSTRAINT `book_has_categories_ibfk_2` FOREIGN KEY (`cateID`) REFERENCES `category` (`cateID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_has_categories`
--

LOCK TABLES `book_has_categories` WRITE;
/*!40000 ALTER TABLE `book_has_categories` DISABLE KEYS */;
INSERT INTO `book_has_categories` VALUES ('1',14),('10',14),('11',14),('12',14),('13',6),('14',14),('15',5),('16',5),('17',5),('18',14),('19',14),('2',14),('20',14),('3',14),('4',5),('4',6),('5',5),('5',6),('6',5),('6',6),('7',5),('7',6),('8',5),('8',6),('9',14);
/*!40000 ALTER TABLE `book_has_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branchID` int NOT NULL,
  `b_name` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`branchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'HN1','31 Tràng Thi, Trần Hưng Đạo, Hoàn Kiếm, Hà Nội, Vietnam'),(2,'HN2','54E Trần Hưng Đạo, Hàng Bài, Hoàn Kiếm, Hà Nội, Vietnam'),(3,'HN3','2R2V+228, Đồng Tâm, Hai Bà Trưng, Hà Nội, Vietnam'),(4,'DN1','33 Đ. Trần Phú, Hải Châu 1, Q. Hải Châu, Đà Nẵng, Vietnam'),(5,'DN2','46 Bạch Đằng, Hải Châu 1, Hải Châu, Đà Nẵng, Vietnam'),(6,'HCM1','69 Lý Tự Trọng, Phường Bến Thành, Quận 1, Thành phố Hồ Chí Minh, Vietnam'),(7,'HCM2','PMJX+9P7, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh, Vietnam'),(8,'HCM3','268 Lý Thường Kiệt, Phường 14, Quận 10, Thành phố Hồ Chí Minh, Vietnam');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cateID` int NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cateID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Horror'),(2,'Comedy'),(3,'History'),(4,'Journal'),(5,'Fantasy'),(6,'Comic book'),(7,'Classic'),(8,'Dystopian'),(9,'Mystery'),(10,'Thriller & Suspense'),(11,'Romance'),(12,'Biography'),(13,'Science & Technology'),(14,'Textbook'),(15,'Novel');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copy`
--

DROP TABLE IF EXISTS `copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copy` (
  `copyID` int NOT NULL,
  `availability` tinyint(1) DEFAULT '1',
  `isbn` varchar(20) NOT NULL,
  `branchID` int DEFAULT NULL,
  PRIMARY KEY (`copyID`,`isbn`),
  KEY `branchID` (`branchID`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `copy_ibfk_1` FOREIGN KEY (`branchID`) REFERENCES `branch` (`branchID`) ON DELETE CASCADE,
  CONSTRAINT `copy_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copy`
--

LOCK TABLES `copy` WRITE;
/*!40000 ALTER TABLE `copy` DISABLE KEYS */;
INSERT INTO `copy` VALUES (1,1,'1',1),(1,1,'12',2),(1,1,'15',2),(1,1,'16',5),(1,1,'19',2),(1,1,'20',5),(1,1,'9',5),(2,1,'1',3),(2,1,'12',2),(2,1,'15',3),(2,1,'16',6),(2,1,'19',3),(2,1,'20',6),(2,1,'9',5),(3,1,'1',2),(3,1,'12',2),(3,1,'15',4),(3,1,'16',6),(3,1,'19',4),(3,1,'20',6),(3,1,'9',5),(4,1,'1',4),(4,1,'12',2),(4,1,'15',6),(4,1,'16',6),(4,1,'19',3),(4,1,'20',4),(4,1,'9',4),(5,1,'1',5),(5,1,'12',6),(5,1,'15',6),(5,1,'16',3),(5,1,'19',4),(5,1,'20',3),(5,1,'9',6),(6,1,'1',6),(6,1,'12',6),(6,1,'15',7),(6,1,'16',2),(6,1,'19',5),(6,1,'20',2),(6,1,'9',5),(7,1,'1',7),(7,1,'12',6),(7,1,'15',3),(7,1,'16',3),(7,1,'19',6),(7,1,'20',8),(7,1,'9',4),(8,1,'1',5),(8,1,'12',6),(8,1,'15',4),(8,1,'16',4),(8,1,'19',6),(8,1,'20',8),(8,1,'9',5),(9,1,'1',4),(9,1,'12',7),(9,1,'15',3),(9,1,'16',8),(9,1,'19',1),(9,1,'20',1),(9,1,'9',6),(10,1,'1',5),(10,1,'12',7),(10,1,'15',4),(10,1,'16',1),(10,1,'19',6),(10,1,'20',2),(10,1,'9',5),(11,1,'1',3),(11,1,'12',7),(11,1,'16',1),(11,1,'19',7),(11,1,'9',4),(12,1,'1',4),(12,1,'12',7),(12,1,'9',5),(13,1,'9',4),(14,1,'9',5);
/*!40000 ALTER TABLE `copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `librarian` (
  `libID` int NOT NULL AUTO_INCREMENT,
  `librarian_name` varchar(50) DEFAULT NULL,
  `User` varchar(50) default null,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `branchID` int DEFAULT NULL,
  PRIMARY KEY (`libID`),
  KEY `branchID` (`branchID`),
  CONSTRAINT `librarian_ibfk_1` FOREIGN KEY (`branchID`) REFERENCES `branch` (`branchID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarian`
--

LOCK TABLES `librarian` WRITE;
/*!40000 ALTER TABLE `librarian` DISABLE KEYS */;
INSERT INTO `librarian` VALUES (1,'Quach Dang Giang','qdgiang','giang','giang.quach3012@hcmut.edu.vn',NULL,NULL,6),(2,'Trinh Quynh Hoa','Trinh_Quynh_Hoa','hoa','hoa.trinhquynh.1006@hcmut.edu.vn',NULL,NULL,1),(3,'Nguyen Thanh Hieu','Nguyen_Thanh_Hieu','hieu','hieu.nguyenthanh_hieu@hcmut.edu.vn',NULL,NULL,2),(4,'Nhan vien 1','nhanvien1',1212,'nhanvien1@gmail.com',NULL,NULL,3),(5,'Nhan vien 2','nhanvien2','2323','nhanvien2@gmail.com',NULL,NULL,4),(6,'Nhan vien 3','nhanvien3','3434','nhanvien3@gmail.com',NULL,NULL,5),(7,'Nhan vien 4','nhanvien4','4545','nhanvien4@gmail.com',NULL,NULL,7),(8,'Nhan vien 5','nhanvien5','5555','nhanvien5@gmail.com',NULL,NULL,8),(9,'Nhan vien 6','nhanvien6','6565','nhanvien6@gmail.com',NULL,NULL,8);
/*!40000 ALTER TABLE `librarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reader`
--

DROP TABLE IF EXISTS `reader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reader` (
  `readID` int NOT NULL AUTO_INCREMENT,
  `reader_name` varchar(50) DEFAULT NULL,
  `User` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`readID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reader`
--

LOCK TABLES `reader` WRITE;
/*!40000 ALTER TABLE `reader` DISABLE KEYS */;
INSERT INTO `reader` VALUES (1,'Quach Dang Giang','giang','11111','giang.quach3012@hcmut.edu.vn','','HCM'),(2,'Nhan vien 1','nhanvien1','12121','nhanvien1@gmail.com',NULL,NULL),(3,'Nhan vien 5','4545','nhanvien5','nhanvien5@gmail.com',NULL,NULL),(4,'Harry Potter','harry','potter',NULL,NULL,'Godric\'s Hollow'),(5,'Justin Trudeau','Justin','canada','canada@gmail.com','123456789','Canada'),(6,'Donald Trump','Trump','usa','oldusa@gmail.com','111111111','Washington DC'),(7,'Joe Biden','Biden','usb','newusa@gmail.com','222222222','Washington DC'),(8,'Vladimir Putin','Sir','russia','russia@gmail.com','333333333','Moscow'),(9,'Boris Johnson',NULL,'boris','uk@gmail.com','444444444','London'),(10,'Xi Jinping',NULL,'china','china@gmail.com','555555555','Beijing'),(11,'Scott Morrison','aus','aus','aus@gmail.com','666666666','Sydney'),(12,'Angela Merkel','angel','german','germany@gmail.com','777777777','Berlin'),(13,'Emmanuel Macron','emmanuel','emma','france@gmail.com','888888888','Paris'),(14,'Trinh Quynh Hoa','hoa','bong','hoa.trinhquynh.1006@hcmut.edu.vn','',NULL),(15,'Nhan vien 6','nhanvien6','676767','nhanvien6@gmail.com',NULL,NULL);
/*!40000 ALTER TABLE `reader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `issue_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `readID` int DEFAULT NULL,
  `copyID` int NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `returned` tinyint(1) DEFAULT '0',
  `libID` int DEFAULT NULL,
  PRIMARY KEY (`copyID`,`isbn`,`issue_date`),
  KEY `readID` (`readID`),
  KEY `libID` (`libID`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`readID`) REFERENCES `reader` (`readID`) ON DELETE CASCADE,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`copyID`, `isbn`) REFERENCES `copy` (`copyID`, `isbn`) ON DELETE CASCADE,
  CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`libID`) REFERENCES `librarian` (`libID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('2021-05-25','2021-06-25',4,1,'12',1,3),('2021-09-10','2021-10-10',1,1,'12',0,3),('2021-10-01','2021-11-01',1,1,'12',1,3),('2021-10-28','2021-11-28',10,1,'19',0,6),('2020-01-03','2020-02-03',5,1,'20',1,4),('2021-10-17','2021-11-17',9,1,'20',0,8),('2021-06-20','2021-07-20',5,2,'12',1,3),('2021-10-25','2021-11-25',6,2,'12',0,3),('2016-03-20','2016-04-20',9,2,'19',1,5),('2021-03-05','2021-04-05',3,3,'12',1,3),('2021-09-02','2021-10-02',2,3,'12',1,3),('2014-03-26','2014-04-26',4,3,'19',1,3),('2017-07-07','2017-08-07',10,3,'19',1,4),('2018-08-08','2018-09-08',10,3,'19',1,7),('2016-03-20','2016-04-20',4,3,'20',1,3),('2017-03-20','2017-04-20',4,3,'20',1,2),('2018-04-01','2018-05-01',4,3,'20',1,4),('2021-09-28','2021-10-28',12,3,'20',0,6),('2019-04-19','2019-05-19',5,4,'20',1,5),('2009-10-20','2009-11-20',5,5,'19',1,5),('2010-11-21','2010-12-21',5,5,'19',1,5),('2015-01-03','2015-02-03',5,5,'19',1,5),('2016-01-03','2016-02-03',7,6,'19',1,2),('2021-09-09','2021-10-10',9,6,'19',0,7),('2021-10-21','2021-11-21',6,7,'20',1,5),('2021-06-13','2021-07-13',6,9,'12',1,7),('2021-08-01','2021-09-01',1,9,'12',1,7),('2021-10-20','2021-11-20',7,9,'12',0,7),('2019-05-27','2019-06-27',2,9,'19',1,8),('2021-10-20','2021-11-20',11,9,'20',0,6),('2021-01-06','2021-02-06',8,10,'12',1,7),('2021-01-10','2021-02-10',9,11,'12',0,7);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

select * from librarian;
-- Dump completed on 2021-11-06 21:26:01
