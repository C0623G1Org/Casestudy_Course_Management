-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: course_management
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `content_type`
--

DROP TABLE IF EXISTS `content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_type` (
  `content_type_id` int NOT NULL AUTO_INCREMENT,
  `content_type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`content_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_type`
--

LOCK TABLES `content_type` WRITE;
/*!40000 ALTER TABLE `content_type` DISABLE KEYS */;
INSERT INTO `content_type` VALUES (1,'Lesson'),(2,'Readings'),(3,'Exercise');
/*!40000 ALTER TABLE `content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(55) NOT NULL,
  `course_description` longtext NOT NULL,
  `instructor` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `knowledge` varchar(500) DEFAULT NULL,
  `device_requirements` varchar(500) DEFAULT NULL,
  `course_other_info` varchar(200) DEFAULT NULL,
  `course_category_id` int NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `course_category_id` (`course_category_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`course_category_id`) REFERENCES `course_category` (`course_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'HTML and CSS','Learn the basics of HTML and CSS to build beautiful websites.','John Smith',24.99,'<p>Cách sử dụng ngôn ngữ đánh dấu HTML để tạo các phần tử trên trang web.</p>\n<p>Cách sử dụng CSS để định dạng và trình bày các phần tử trên trang web.</p>\n<p>Cách tạo các layout và thiết kế trang web chuyên nghiệp.</p>\n<p>Cách phối hợp HTML và CSS để tạo ra các trang web độc đáo.</p>\n<p>Cách làm việc với responsive design và mobile optimization.</p>','<p>Có kiến thức cơ bản về máy tính và trình duyệt web.</p>\n<p>Có kiến thức cơ bản về HTML và CSS là một lợi thế, nhưng không bắt buộc.</p>','\n<p>Giờ học: 200 giờ học</p>\n<p>Thời gian khóa học: 4 tháng;</p>\n<p>Số bài học: 20 bài</p>\n',1),(2,'Python for Data Science','Learn the Python programming language and how it is used in data science.','Jane Doe',49.99,'<p>Các khái niệm cơ bản của khoa học dữ liệu và các công cụ phân tích dữ liệu cơ bản.</p>\n<p>Các cú pháp, tập lệnh và thư viện phương tiện trong Python, như pandas, numpy và matplotlib.</p>\n<p>Các phương pháp phân tích dữ liệu thống kê như biểu đồ và hồi quy tuyến tính.</p>\n<p>Cách sử dụng Python để xử lý, phân tích và hiểu dữ liệu.</p>','<p>Nắm vững kiến thức cơ bản về lập trình và Python.</p>\n<p>Có kiến ​​thức cơ bản về toán học, thống kê và phân tích dữ liệu là một lợi thế, nhưng không bắt buộc.</p>','\n<p>Giờ học: 200 giờ học</p>\n<p>Thời gian khóa học: 4 tháng;</p>\n<p>Số bài học: 20 bài</p>\n',2),(3,'React Native','Build mobile apps for iOS and Android using React Native.','Mike Thompson',99.99,'<p>Các khái niệm cơ bản về React Native và cách nó hoạt động.</p>\n<p>Các phương pháp phát triển ứng dụng di động và thiết kế giao diện trong React Native.</p>\n<p>Cách sử dụng các thành phần và thư viện của React Native để tạo các tính năng và chức năng.</p>\n<p>Cách sử dụng JavaScript để lập trình ứng dụng React Native và tương tác với các API.</p>','<p>Có kiến thức cơ bản về lập trình và JavaScript.</p>\n<p>Có kiến thức cơ bản về lập trình di động là một lợi thế, nhưng không bắt buộc.</p>','\n<p>Giờ học: 200 giờ học</p>\n<p>Thời gian khóa học: 4 tháng;</p>\n<p>Số bài học: 20 bài</p>\n',3);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_category`
--

DROP TABLE IF EXISTS `course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_category` (
  `course_category_id` int NOT NULL AUTO_INCREMENT,
  `course_category_name` varchar(55) NOT NULL,
  PRIMARY KEY (`course_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_category`
--

LOCK TABLES `course_category` WRITE;
/*!40000 ALTER TABLE `course_category` DISABLE KEYS */;
INSERT INTO `course_category` VALUES (1,'Beginner'),(2,'Intermediate'),(3,'Advanced');
/*!40000 ALTER TABLE `course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_content`
--

DROP TABLE IF EXISTS `course_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_content` (
  `course_content_id` int NOT NULL AUTO_INCREMENT,
  `course_content_name` varchar(55) NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`course_content_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `course_content_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_content`
--

LOCK TABLES `course_content` WRITE;
/*!40000 ALTER TABLE `course_content` DISABLE KEYS */;
INSERT INTO `course_content` VALUES (1,'String',1),(2,'Array',1),(3,'OOP',1),(4,'Data Science',2),(5,'Mobile App Development',3);
/*!40000 ALTER TABLE `course_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_order`
--

DROP TABLE IF EXISTS `course_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `order_price` double NOT NULL,
  `user_id` int NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `course_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `course_order_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_order`
--

LOCK TABLES `course_order` WRITE;
/*!40000 ALTER TABLE `course_order` DISABLE KEYS */;
INSERT INTO `course_order` VALUES (1,'2022-01-01',24.99,1,1),(2,'2022-01-02',49.99,1,2),(3,'2022-01-03',99.99,1,3);
/*!40000 ALTER TABLE `course_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detailed_content`
--

DROP TABLE IF EXISTS `detailed_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detailed_content` (
  `detailed_content_id` int NOT NULL AUTO_INCREMENT,
  `content_title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `url_video_id` varchar(50) DEFAULT NULL,
  `course_content_id` int NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`detailed_content_id`),
  KEY `course_content_id` (`course_content_id`),
  KEY `content_type_id` (`content_type_id`),
  CONSTRAINT `detailed_content_ibfk_1` FOREIGN KEY (`course_content_id`) REFERENCES `course_content` (`course_content_id`),
  CONSTRAINT `detailed_content_ibfk_2` FOREIGN KEY (`content_type_id`) REFERENCES `content_type` (`content_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detailed_content`
--

LOCK TABLES `detailed_content` WRITE;
/*!40000 ALTER TABLE `detailed_content` DISABLE KEYS */;
INSERT INTO `detailed_content` VALUES (1,'Introduction to HTML','HTML stands for Hypertext Markup Language and is used to structure content on the web.','0SJE9dYdpps',1,1),(2,'Introduction to HTML 2','HTML stands for Hypertext Markup Language and is used to structure content on the web.','0SJE9dYdpps',1,1),(3,'Introduction to HTML 3','HTML stands for Hypertext Markup Language and is used to structure content on the web.','0SJE9dYdpps',1,1),(4,'Introduction to HTML 4','HTML stands for Hypertext Markup Language and is used to structure content on the web.','0SJE9dYdpps',1,1),(5,'CSS Selectors','Learn how to select HTML elements using CSS selectors.','0SJE9dYdpps',1,2),(6,'Python Data Types','Learn about the different data types in Python, such as strings, numbers, and lists.','0SJE9dYdpps',2,1);
/*!40000 ALTER TABLE `detailed_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `id_card` varchar(12) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(55) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `id_card` (`id_card`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'johndoe','password123','123456789012','1990-05-01',_binary '','1234567890','johndoe@email.com','student'),(2,'janedoe','password456','098765432109','1985-11-15',_binary '\0','0987654321','janedoe@email.com','instructor');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-30 20:30:03
