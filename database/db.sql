-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'electronics','Electronic devices and accessories','2024-03-01 17:45:04','2024-03-05 14:35:46'),(2,'clothing','Men, women, and children\'s clothing','2024-03-01 17:45:04','2024-03-05 14:35:46'),(3,'home & garden','Products for your home and garden','2024-03-01 17:45:04','2024-03-05 14:35:46'),(4,'toys & games','Toys and games for all ages','2024-03-01 17:45:04','2024-03-05 14:35:46'),(5,'sports & outdoors','Sporting goods and outdoor equipment','2024-03-01 17:45:04','2024-03-05 14:35:46'),(6,'unknown','Unknown category','2024-03-01 20:16:31','2024-03-05 14:35:46'),(7,'foods','Foods for hungry','2024-03-01 20:21:09','2024-03-05 14:35:46'),(13,'clothingq',NULL,'2024-03-05 05:58:03','2024-03-05 14:35:46'),(14,'figure',NULL,'2024-03-05 05:58:25','2024-03-05 14:35:46'),(15,'t-shirt',NULL,'2024-03-05 06:02:09','2024-03-05 14:35:46'),(16,'foodsz',NULL,'2024-03-05 07:19:10','2024-03-05 14:35:46'),(17,'foods and drinks',NULL,'2024-03-05 07:21:34','2024-03-05 14:35:46'),(18,'test',NULL,'2024-03-05 07:23:34','2024-03-05 07:23:34'),(19,'testz',NULL,'2024-03-05 07:25:35','2024-03-05 07:25:35'),(20,'drinks',NULL,'2024-03-05 07:27:49','2024-03-05 14:35:46'),(21,'books',NULL,'2024-03-05 07:28:42','2024-03-05 14:35:46'),(22,'book',NULL,'2024-03-05 07:34:31','2024-03-05 07:34:31'),(23,'con meo',NULL,'2024-03-05 13:20:23','2024-03-05 13:20:23'),(24,'nobita',NULL,'2024-03-05 13:20:38','2024-03-05 13:20:38'),(25,'pencil',NULL,'2024-03-05 13:39:14','2024-03-05 13:39:14'),(26,'pizza',NULL,'2024-03-05 13:49:39','2024-03-05 13:49:39'),(27,'xe hoi',NULL,'2024-03-08 16:33:38','2024-03-08 16:33:38'),(28,'long text',NULL,'2024-03-09 16:30:02','2024-03-09 16:30:02');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,1,1,6942,5,'2024-03-07 10:53:24','2024-03-07 10:53:24'),(2,1,45,135000,1,'2024-03-07 10:55:19','2024-03-07 10:55:19'),(3,1,41,10000,3,'2024-03-07 10:55:43','2024-03-07 10:55:43'),(4,2,41,10000,3,'2024-03-07 10:57:53','2024-03-07 10:57:53'),(5,2,45,135000,1,'2024-03-07 10:57:55','2024-03-07 10:57:55'),(6,2,1,6942,5,'2024-03-07 10:57:56','2024-03-07 10:57:56'),(7,2,5,100000,10,'2024-03-07 10:59:52','2024-03-07 10:59:52');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `total_price` int NOT NULL,
  `status` enum('pending','shipping','delivered','cancelled') NOT NULL DEFAULT 'pending',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,9,199710,'pending','2024-03-07 10:48:25','2024-03-07 11:14:03'),(2,2,1199710,'pending','2024-03-07 10:57:36','2024-03-07 11:14:03');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` int DEFAULT '0',
  `stock` int DEFAULT '0',
  `promotion` float DEFAULT '0',
  `description` text,
  `author` int NOT NULL,
  `thumbnail` varchar(512) DEFAULT 'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',
  `category` int DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `author` (`author`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`author`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'hamburger',69420,10,0,NULL,1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',7,'2024-03-01 13:51:36','2024-03-05 14:34:58'),(3,'pizza fist pesto',450000,10,0,NULL,1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',7,'2024-03-01 14:17:11','2024-03-05 14:34:58'),(4,'headphones',300000,25,0,'Listen to your music in style',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',2,'2024-03-03 16:42:08','2024-03-05 14:34:58'),(5,'mouse',100000,40,0,'Wireless mouse for increased productivity',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',2,'2024-03-03 16:42:08','2024-03-05 14:34:58'),(6,'keyboard',200000,30,0,'Mechanical keyboard for gamers and writers',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',2,'2024-03-03 16:42:08','2024-03-05 14:34:58'),(7,'smartwatch',1500000,15,0,'Track your fitness and stay connected',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',2,'2024-03-03 16:42:08','2024-03-05 14:34:58'),(8,'phone case',150000,50,0,'Protect your phone in style',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',2,'2024-03-03 16:42:08','2024-03-05 14:34:58'),(9,'sunglasses',500000,10,0,'Look cool and protect your eyes from the sun',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',1,'2024-03-03 16:42:08','2024-03-05 14:34:58'),(10,'hat',200000,20,0,'Keep the sun out of your face in style',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',1,'2024-03-03 16:42:08','2024-03-05 14:34:58'),(11,'socks',50000,100,0,'Keep your feet warm and comfortable',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',1,'2024-03-03 16:42:08','2024-03-05 14:34:58'),(12,'scarf',100000,30,0,'Add a touch of style to your outfit',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',1,'2024-03-03 16:42:08','2024-03-05 14:34:58'),(13,'water bottle',150000,20,0,'Stay hydrated throughout the day',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',4,'2024-03-03 16:42:08','2024-03-05 14:34:58'),(14,'g.e.m. series naruto shippuden naruto uzumaki six paths sage mode g.e.m. 15th anniversary ver',6700000,101,0,NULL,1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',6,'2024-03-04 14:51:13','2024-03-05 14:34:58'),(15,'product 0',69420,10,0,NULL,1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',6,'2024-03-04 15:17:09','2024-03-05 14:34:58'),(16,'product 1',69420,10,10,'asdasdad',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',6,'2024-03-04 15:26:35','2024-03-05 14:34:58'),(17,'pizza',69420,50,5,'asd',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',1,'2024-03-04 15:27:23','2024-03-05 14:34:58'),(18,'pizza',69420,50,5,'asda',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',1,'2024-03-04 15:27:49','2024-03-05 14:34:58'),(19,'sasuke',300000,1,20,'No descipiton',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',6,'2024-03-04 15:36:32','2024-03-05 14:34:58'),(20,'sasuke',300000,1,20,'No descipiton',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',6,'2024-03-04 15:39:09','2024-03-05 14:34:58'),(21,'kạdkajsk',69000,10,0,NULL,1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',6,'2024-03-04 15:55:43','2024-03-04 15:55:43'),(22,'kạdkajsk',69000,10,0,NULL,1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',6,'2024-03-04 15:56:10','2024-03-04 15:56:10'),(23,'asdasdas',1000000,8576,0,NULL,1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',6,'2024-03-04 16:00:08','2024-03-04 16:00:08'),(24,'asdasdas',1000000,8576,10,'aasdzxc',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',1,'2024-03-04 16:00:18','2024-03-04 16:00:18'),(25,'ahihi',69000,10,30,'zzz',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',6,'2024-03-04 16:01:10','2024-03-04 16:01:10'),(26,'demo cloud',9999999,10,0,'asdasdasdzxczxc',1,'http://res.cloudinary.com/dfib3gi7p/image/upload/v1709612584/AdminDashboard/product_media/1/sm2cgazeu5t5iprq4ydo.jpg',6,'2024-03-05 04:23:04','2024-03-05 04:23:04'),(27,'con meo u',69000,15,25,NULL,1,'http://res.cloudinary.com/dfib3gi7p/image/upload/v1709612897/AdminDashboard/product_media/1/xr5mza6rbn3vipkvv4wn.jpg',3,'2024-03-05 04:28:17','2024-03-05 04:28:17'),(28,'adasdasdasd',100000,5,0,NULL,1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',6,'2024-03-05 04:30:38','2024-03-05 12:14:18'),(29,'oooo',10000,69,0,NULL,1,'http://res.cloudinary.com/dfib3gi7p/image/upload/v1709613538/AdminDashboard/product_media/1/cr67u4ybxdgqxgnfhjr2.jpg',6,'2024-03-05 04:38:58','2024-03-05 04:38:58'),(30,'zzcxz',1000,1098,0,NULL,1,'http://res.cloudinary.com/dfib3gi7p/image/upload/v1709613678/AdminDashboard/product_media/1/lts2apjsfuz88cwska8k.jpg',6,'2024-03-05 04:41:19','2024-03-05 04:41:19'),(31,'zxczxxjch',99999,1,5,NULL,1,'http://res.cloudinary.com/dfib3gi7p/image/upload/v1709615492/AdminDashboard/product_media/1/bwlq1anq5m6pwa2zdfbh.jpg',6,'2024-03-05 04:41:45','2024-03-05 12:12:20'),(32,'adasda',100000,10,0,NULL,1,'http://res.cloudinary.com/dfib3gi7p/image/upload/v1709615051/AdminDashboard/product_media/1/ealgqsyrkowu9goq30hy.jpg',6,'2024-03-05 05:04:12','2024-03-05 05:04:12'),(33,'zzzzxcxz',400000,99,0,NULL,1,'http://res.cloudinary.com/dfib3gi7p/image/upload/v1709615492/AdminDashboard/product_media/1/bwlq1anq5m6pwa2zdfbh.jpg',6,'2024-03-05 05:04:37','2024-03-05 12:12:20'),(34,'headphones',30,25,0,'Listen to your music in style',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',2,'2024-03-05 12:06:20','2024-03-05 14:34:58'),(35,'headphones',30,25,0,'Listen to your music in style',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',2,'2024-03-05 12:06:31','2024-03-05 14:34:58'),(36,'zzzzxcxz',400000,99,0,NULL,1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',6,'2024-03-05 05:11:08','2024-03-05 05:11:08'),(37,'zzzzxcxzcczxczxczx',400000,99,0,NULL,1,'http://res.cloudinary.com/dfib3gi7p/image/upload/v1709615492/AdminDashboard/product_media/1/bwlq1anq5m6pwa2zdfbh.jpg',6,'2024-03-05 05:11:32','2024-03-05 05:11:32'),(38,'asdada',69420,99,0,NULL,1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',17,'2024-03-05 07:21:35','2024-03-05 07:21:35'),(39,'adasjkd with thumbnail',499485947,1200,60,NULL,1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',18,'2024-03-05 07:23:34','2024-03-05 07:23:34'),(40,'product with existed category and no thumbnail',10000,1,0,NULL,1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',7,'2024-03-05 07:26:59','2024-03-05 07:26:59'),(41,'product with existed category and have thumbnail',10000,1,0,NULL,1,'http://res.cloudinary.com/dfib3gi7p/image/upload/v1709623642/AdminDashboard/product_media/1/zq2b1rz1xuflqvpudbrc.jpg',7,'2024-03-05 07:27:22','2024-03-05 07:27:22'),(42,'product with not existed category and have thumbnail',10000,1,0,NULL,1,'http://res.cloudinary.com/dfib3gi7p/image/upload/v1709623672/AdminDashboard/product_media/1/zywzu1o2ghw31wayfe52.jpg',20,'2024-03-05 07:27:52','2024-03-05 07:27:52'),(43,'product with not existed category and no thumbnail',30193,18237,10,NULL,1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',21,'2024-03-05 07:28:42','2024-03-05 07:28:42'),(44,'product with not existed category and no thumbnail',30193,18237,10,NULL,1,'http://res.cloudinary.com/dfib3gi7p/image/upload/v1709647939/AdminDashboard/product_media/1/w4wwxdrrx6chmcv9zgui.jpg',22,'2024-03-05 07:36:20','2024-03-05 14:12:19'),(45,'pizza',150000,699,10,'pizza siu ngon',1,'http://res.cloudinary.com/dfib3gi7p/image/upload/v1709646585/AdminDashboard/product_media/1/mmfp2qynhysxlp6tlwhu.jpg',26,'2024-03-05 12:06:40','2024-03-05 13:49:45'),(46,'new product ne',13000,74,90,'asdadasd',1,'http://res.cloudinary.com/dfib3gi7p/image/upload/v1709915623/AdminDashboard/product_media/1/lrvgga7hy3zaeqznizja.jpg',27,'2024-03-08 16:33:44','2024-03-09 13:52:47'),(47,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',100000,60,0,'asdas',1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',28,'2024-03-09 16:30:02','2024-03-09 16:30:02'),(48,'meo meo',10000,40,0,NULL,1,'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',7,'2024-03-12 12:25:11','2024-03-12 12:25:11'),(49,'nước cam đỏ',15000,1,30,'nước chất độc màu da cam',1,'http://res.cloudinary.com/dfib3gi7p/image/upload/v1710505016/AdminDashboard/product_media/1/oxf9fcjpinuqs0679vtt.jpg',17,'2024-03-15 12:16:53','2024-03-15 12:16:53');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refresh_tokens`
--

DROP TABLE IF EXISTS `refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_tokens` (
  `id` varchar(255) NOT NULL,
  `expired_in` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_tokens`
--

LOCK TABLES `refresh_tokens` WRITE;
/*!40000 ALTER TABLE `refresh_tokens` DISABLE KEYS */;
INSERT INTO `refresh_tokens` VALUES ('@bc','2024-03-24 00:00:00'),('abc','2024-03-24 00:00:00'),('áee','2024-03-24 00:00:00');
/*!40000 ALTER TABLE `refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('customer','shop','admin') NOT NULL,
  `avatar` varchar(512) DEFAULT 'https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nguyễn Mạnh Dũng','dunguyen1608@gmail.com','$2y$12$1tI.6MKSviWQbGTGKdNbd.RANUrO1MC5Nbb8UJh7IKfN4lAaSPxey','admin','https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp','2024-03-01 05:14:14','2024-03-01 13:18:46'),(2,'phu le','phu@gmail.com','$2y$12$WSaldQYJt8sNwVaQeCiemOsazpHipe4JgOjZT6qY5EKh4f6RV9TTG','customer','https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp','2024-03-02 00:51:17','2024-03-02 00:51:17'),(3,'test','test@gmail.com','$2y$12$gUElfJx4yD4x3ZvaIcdfzegO9FNLIQcWAJj8sG9LPMDTwN7Prm06e','customer','https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp','2024-03-02 01:02:20','2024-03-02 01:02:20'),(4,'adasdj','asdh@gmail.com','$2y$12$LUr0xfIqUSM/aBtszbECCuLancdEhBl2IP3XFQClD8h4WDM0tQPGy','customer','https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp','2024-03-02 01:14:33','2024-03-02 01:14:33'),(5,'meo','meo@gmail.com','$2y$12$Pc5oieDQKYkdbRmxy8poTOfSnSw0rwN0g.WdE8q4Q6kTGmwCIrGcq','customer','https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp','2024-03-02 01:15:25','2024-03-02 01:15:25'),(6,'lmao','lmao@gmail.com','$2y$12$uI2gAI6wPPa3Vo/HskUDB.8AjvESVAZoAceSD4ZPvalatCaZaaY0e','customer','https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp','2024-03-02 01:16:10','2024-03-02 01:16:10'),(7,'hehe','hehe@gmail.com','$2y$12$J2QFhf5nfJNKQIqeGSWZmOmpZ46wyFalS3CwLEqPhHZIRqgyZQ46e','customer','https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp','2024-03-02 01:43:02','2024-03-02 01:43:02'),(8,'usermeo','usermeo@gmail.com','$2y$12$fpMD5WCkV750eZrj6j0aaem7bx2BznH4VGpyUokQ7GTwmyQblIUL2','customer','https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp','2024-03-02 05:57:23','2024-03-02 05:57:23'),(9,'nguyen van a','a@gmail.com','$2y$12$oBbJLNxbkYNOaLzyLZ9HLubBfZiA9JNji1u3/icjU8jsLIKtdw8j.','customer','https://res.cloudinary.com/dfib3gi7p/image/upload/v1709286674/AdminDashboard/user_avatars/vjyyjxgsnzkyzg8wreur.webp','2024-03-02 06:06:10','2024-03-02 06:06:10');
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

-- Dump completed on 2024-03-17 16:27:15
