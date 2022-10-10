-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: tourdb1
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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `price` decimal(10,0) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `modificationDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_car_category_idx` (`category_id`),
  CONSTRAINT `fk_car_category` FOREIGN KEY (`category_id`) REFERENCES `category_car` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'TUYẾN HCM - NHA TRANG - ĐÀ LẠT','Xe chất lượng cao, giá thuê hiện đại',3000000,'https://res.cloudinary.com/dyfc3ns2j/image/upload/v1631087509/re023am0njznkxxjn0az.jpg',1,NULL),(2,'TUYẾN HCM - VŨNG TÀU','Xe chất lượng cao',2000000,'https://res.cloudinary.com/dyfc3ns2j/image/upload/v1631087509/re023am0njznkxxjn0az.jpg',2,NULL),(3,'TUYẾN HCM - PHAN THIẾT','Xe giường nằm đời mới, chuẩn phục vụ du lịch',4000000,NULL,3,NULL),(4,'TUYẾN HCM - PHÚ YÊN - BÌNH ĐỊNH','Xe giường nằm đời mới, chuẩn phục vụ du lịch',6000000,NULL,3,NULL),(5,'TUYẾN HCM - QUẢNG NGÃI','Xe chất lượng cao, giá thuê hợp lý',700000,NULL,2,NULL),(6,'TUYẾN HCM - KIÊN GIANG','Xe 7 chỗ chất lượng cao',500000,NULL,1,NULL),(7,'TUYẾN HCM - CẦN THƠ','Xe chất lượng cao, dịch vụ đẳng cấp phục vụ riêng',900000,NULL,2,NULL),(8,'TUYẾN HCM - ĐĂK LĂK','Xe chất lượng cao, chuẩn phục vụ du lịch',1000000,'https://res.cloudinary.com/regnuxcloud/image/upload/v1635935845/bzbsmrfuufuujyy1tpkw.jpg',3,NULL),(9,'TUYẾN HCM - BẠC LIÊU','Xe 16 chỗ chất lượng cao',800000,NULL,2,NULL),(10,'TUYẾN HCM - ĐÀ NẴNG','Xe chất lượng cao, dịch vụ đẳng cấp du lịch',700000,NULL,2,NULL),(11,'TUYẾN HCM - HUẾ','Xe 16 chỗ chất lượng cao, giá thuê hợp lý',700000,'https://res.cloudinary.com/regnuxcloud/image/upload/v1635936149/lnmrqr7xg0v1nyrktwxz.jpg',2,NULL),(12,'TUYẾN HCM - HÀ NỘI','Xe dịch vụ cao cấp.',4000000,'https://res.cloudinary.com/regnuxcloud/image/upload/v1635933574/vxokhxfdd6fb934x59g8.jpg',1,NULL);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'TOUR TRONG NƯỚC'),(2,'TOUR NƯỚC NGOÀI');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_car`
--

DROP TABLE IF EXISTS `category_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_car` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_car`
--

LOCK TABLES `category_car` WRITE;
/*!40000 ALTER TABLE `category_car` DISABLE KEYS */;
INSERT INTO `category_car` VALUES (1,'7 CHỖ'),(2,'16 CHỖ'),(3,'45 CHỖ');
/*!40000 ALTER TABLE `category_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_news`
--

DROP TABLE IF EXISTS `category_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_news`
--

LOCK TABLES `category_news` WRITE;
/*!40000 ALTER TABLE `category_news` DISABLE KEYS */;
INSERT INTO `category_news` VALUES (2,'VNExpress','https://vnexpress.net/du-lich/diem-den'),(3,'DuLichVN','https://dulichvn.org.vn/index.php/cat/Tin-tuc---Su-kien');
/*!40000 ALTER TABLE `category_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender` int DEFAULT NULL,
  `recipient` int DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_send_idx` (`sender`),
  KEY `fk_re_idx` (`recipient`),
  CONSTRAINT `fk_re` FOREIGN KEY (`recipient`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_send` FOREIGN KEY (`sender`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message`
--

LOCK TABLES `chat_message` WRITE;
/*!40000 ALTER TABLE `chat_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_date` timestamp NULL DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `news_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_idx` (`user_id`),
  KEY `fk_news_idx` (`news_id`),
  KEY `fk_parentComment_idx` (`parent_id`),
  CONSTRAINT `fk_news` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_parentComment` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_userComment` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Dịch vụ tốt!!!','2021-10-15 08:34:00',65,5,NULL,'2021-11-04 03:20:03'),(2,'Rat huu ich','2021-10-15 11:55:17',66,5,NULL,NULL),(3,'Tuyệt vời','2021-10-15 12:20:20',66,5,NULL,NULL),(4,'Tuyệt','2021-10-15 13:20:33',66,5,NULL,NULL),(6,'Bài viết hay','2021-10-23 02:16:23',63,5,NULL,NULL),(7,'Rất hữu ích','2021-10-23 02:18:18',63,5,NULL,NULL),(11,'chất lượng','2021-10-23 02:46:31',7,5,NULL,NULL),(12,'tốt','2021-10-23 02:49:06',7,5,NULL,NULL),(13,'Cảm ơn bạn đã quan tâm đến VN Go Travel','2021-10-23 02:55:31',7,5,NULL,'2021-10-25 13:39:41'),(15,'cảm ơn','2021-10-23 03:00:08',65,5,NULL,NULL),(16,'reply','2021-10-15 07:22:00',65,5,1,'2021-11-14 11:05:14'),(21,'Bài viết hay!!!','2021-11-05 06:50:53',7,11,NULL,'2021-11-05 07:13:17'),(22,'Bài viết hay','2021-11-05 06:51:10',7,11,NULL,NULL),(23,'Tốt','2021-11-05 06:55:01',7,11,NULL,NULL),(24,'Cảm ơn!!!','2021-11-05 06:55:27',7,11,21,'2021-11-05 07:15:52'),(28,'','2021-11-14 11:03:10',65,5,2,NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_demo`
--

DROP TABLE IF EXISTS `index_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index_demo` (
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `age` int DEFAULT NULL,
  `pan_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_no` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`phone_no`),
  UNIQUE KEY `unique_idx_1` (`pan_no`),
  KEY `secondary_idx_1` (`name`),
  KEY `composite_index_1` (`phone_no`,`name`,`age`),
  KEY `composite_index_2` (`pan_no`,`name`,`age`),
  KEY `secondary_index_1` (`name`(4))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_demo`
--

LOCK TABLES `index_demo` WRITE;
/*!40000 ALTER TABLE `index_demo` DISABLE KEYS */;
INSERT INTO `index_demo` VALUES ('Trang',29,'IEYTV8935E','0562123656'),('Thao',22,'IPOET0935V','0562088010'),('Xuan',21,'MNWTT0935V','0562987212'),('Phuong',25,'OPETV0915E','0562625344'),('An',24,'OPETV8935E','0562212322');
/*!40000 ALTER TABLE `index_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `feature_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` int DEFAULT NULL,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_url` longtext COLLATE utf8_unicode_ci,
  `category_news` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_idx` (`user`),
  KEY `fk_cate_idx` (`category_news`),
  CONSTRAINT `fk_cate` FOREIGN KEY (`category_news`) REFERENCES `category_news` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (5,'Phú Quốc - Thiên đường du lịch nghĩ dưỡng và khám phá','<h2><strong>Ph&uacute; Quốc &ndash; Giới Thiệu Về Ph&uacute; Quốc</strong></h2>\r\n\r\n<p><strong><a href=\"https://phuquocexplorer.com/phu-quoc\">Ph&uacute; Quốc</a>, thi&ecirc;n đường nhiệt đới nằm trong Vịnh Th&aacute;i Lan, l&agrave; h&ograve;n đảo lớn nhất của Việt Nam nằm ở ph&iacute;a T&acirc;y Nam, cũng l&agrave; h&ograve;n đảo lớn nhất trong quần thể 22 đảo nhỏ to kh&aacute;c nhau tại đ&acirc;y.&nbsp;<a href=\"https://phuquocexplorer.com/phu-quoc/\" target=\"_top\" title=\"Phú Quốc\">Ph&uacute; Quốc</a>&nbsp;c&ugrave;ng với c&aacute;c h&ograve;n đảo kh&aacute;c tạo th&agrave;nh huyện đảo&nbsp;<a href=\"https://phuquocexplorer.com/phu-quoc/\" target=\"_top\" title=\"Phú Quốc\">Ph&uacute; Quốc</a>&nbsp;thuộc tỉnh Ki&ecirc;n Giang.</strong></p>\r\n\r\n<p><iframe class=\"w-100\" frameborder=\"0\" height=\"500\" scrolling=\"no\" src=\"https://i2.wp.com/storage.googleapis.com/inspitrip-blog/vi/2019/07/0260ef85-phu-quoc-2-1024x1024.jpg?zoom=1.5&amp;resize=696%2C696&amp;ssl=1\" width=\"500\"></iframe></p>\r\n\r\n<p><strong><a href=\"https://phuquocexplorer.com/phu-quoc/\" target=\"_top\" title=\"Phú Quốc\">Ph&uacute; Quốc</a></strong>&nbsp;c&oacute; diện t&iacute;ch&nbsp;589,23&nbsp;km&sup2;, trải d&agrave;i từ vĩ độ 9&deg;53&prime; đến 10&deg;28&prime; độ vĩ bắc v&agrave; kinh độ từ 103&deg;49&prime; đến 104&deg;05&prime; độ kinh đ&ocirc;ng, nằm c&aacute;ch th&agrave;nh phố Rạch Gi&aacute; 120&nbsp;km v&agrave; c&aacute;ch th&agrave;nh phố H&agrave; Ti&ecirc;n 45&nbsp;km. Năm 2006, Khu dự trữ sinh quyển ven biển v&agrave; biển đảo Ki&ecirc;n Giang bao gồm cả Ph&uacute; Quốc được UNESCO c&ocirc;ng nhận l&agrave; khu dự trữ sinh quyển thế giới.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Ph&uacute; Quốc</strong>&nbsp;c&oacute; nhiều b&atilde;i biển đẹp trải d&agrave;i từ ph&iacute;a bắc đến ph&iacute;a nam, c&oacute; 99 ngọn n&uacute;i đồi v&agrave; d&atilde;y rừng nguy&ecirc;n sinh với hệ động thực vật phong ph&uacute;. Ph&iacute;a Bắc của đảo c&oacute; l&agrave;ng ch&agrave;i Rạch Vẹm, B&atilde;i Thơm, H&ograve;n Một,&hellip; nổi bật với vẻ đẹp hoang sơ hay ở Nam Đảo c&oacute; 12 h&ograve;n đảo nhỏ to kh&aacute;c nhau thuộc quần đảo An Thới c&oacute; thể kể đến như H&ograve;n Thơm, H&ograve;n M&oacute;ng Tay, H&ograve;n Gầm Gh&igrave;, H&ograve;n M&acirc;y R&uacute;t,&hellip; l&agrave; những nơi l&yacute; tưởng cho c&aacute;c hoạt động kh&aacute;m ph&aacute; thi&ecirc;n nhi&ecirc;n c&ugrave;ng c&aacute;c hoạt động tr&ecirc;n biển như du thuyền, c&acirc;u c&aacute;, lặn ngắm san h&ocirc; v&agrave; kh&aacute;m ph&aacute; đảo hoang kỳ th&uacute;&hellip;</p>\r\n','2022-05-09 17:00:00','2022-05-09 17:00:00','https://res.cloudinary.com/dyfc3ns2j/image/upload/v1634094257/cjkboif0p91tibouuo5t.jpg',NULL,'thao',NULL,NULL,NULL),(11,'KHU CHỢ GIÁNG SINH LỘNG LẪY NHẤT TRUNG ÂU','<p>Từ khoảng&nbsp;th&aacute;ng 11, ch&iacute;nh quyền những th&agrave;nh phố lớn ở ch&acirc;u &Acirc;u bắt đầu rục rịch chuẩn bị cho một trong những hoạt động ngo&agrave;i trời được y&ecirc;u th&iacute;ch nhất trong năm: chợ Gi&aacute;ng Sinh.<br />\r\nNếu đ&atilde; qu&aacute; quen thuộc với những khu chợ Gi&aacute;ng Sinh đ&ocirc;ng đ&uacute;c v&agrave; nổi tiếng ở Đức v&agrave; Ph&aacute;p, năm nay, sao bạn kh&ocirc;ng thử trải nghiệm 4 khu chợ Gi&aacute;ng Sinh lộng lẫy kh&ocirc;ng k&eacute;m ở Đ&ocirc;ng &Acirc;u n&agrave;y!</p>\r\n\r\n<p><strong>1. Chợ Gi&aacute;ng Sinh ở thủ đ&ocirc; Vienna, &Aacute;o</strong><br />\r\nChợ Gi&aacute;ng Sinh ở Vienna được h&igrave;nh th&agrave;nh từ năm 1298, khi C&ocirc;ng tước xứ &Aacute;o Albrecht đệ nhất cho ph&eacute;p người d&acirc;n th&agrave;nh Vienna được tự đứng ra tổ chức những khu chợ Gi&aacute;ng Sinh v&agrave;o dịp cuối năm.</p>\r\n\r\n<p><iframe class=\"w-100\" frameborder=\"0\" height=\"500\" scrolling=\"no\" src=\"https://drive.google.com/file/d/177wJZcr0DFJNny6JWdVAf8msX1OpQo7d/preview\" width=\"500\"></iframe></p>\r\n\r\n<p>Từ đ&oacute; đến nay, chợ Gi&aacute;ng Sinh ở Vienna l&agrave; một trong những khu chợ lộng lẫy nhất ở khu vực Trung &Acirc;u, đặc biệt l&agrave; chợ Gi&aacute;ng Sinh Wiener Weihnachtstraum ngay trước T&ograve;a Thị ch&iacute;nh v&agrave; một khu chợ kh&aacute;c tại Cung điện Sch&ouml;nbrunn.</p>\r\n\r\n<p>&nbsp;</p>\r\n','2022-05-09 17:00:00','2022-05-09 17:00:00','https://res.cloudinary.com/regnuxcloud/image/upload/v1635910183/pzypzjndgxdux1b4kh6q.jpg',7,'thao',NULL,NULL,NULL),(12,'Một Thái Lan đẹp vi diệu','<p>Mặc d&ugrave; Th&aacute;i Lan l&agrave; một điểm đến du lịch rất phổ biến ở Đ&ocirc;ng Nam &Aacute;, nhưng bạn vẫn c&oacute; thể dễ d&agrave;ng cảm thấy như m&igrave;nh bị lạc trong số l&atilde;nh thổ du lịch tuyệt đẹp ở mỗi v&ugrave;ng miền nơi đ&acirc;y.<br />\r\n<br />\r\nC&oacute; lẽ, ng&agrave;y nay, nhiếp ảnh lu&ocirc;n song h&agrave;nh c&ugrave;ng du lịch bởi bạn sẽ thấy tất cả những phong cảnh huyền diệu, m&ocirc;i trường đa dạng v&agrave; những trải nghiệm văn h&oacute;a độc đ&aacute;o đều trở n&ecirc;n thật sinh động v&agrave; mới mẻ qua ống k&iacute;nh.&nbsp;<br />\r\n<br />\r\nC&ugrave;ng điểm qua một số h&igrave;nh ảnh đẹp đến &ldquo;vi diệu&rdquo; m&agrave; bạn sẽ cảm nhận được rằng bản chất thật sự của Th&aacute;i Lan được thể hiện v&ocirc; c&ugrave;ng r&otilde; n&eacute;t.</p>\r\n\r\n<p><iframe class=\"w-100\" frameborder=\"0\" height=\"500\" scrolling=\"no\" src=\"https://drive.google.com/file/d/1nofYAOg4SgOqMl-HSAI-QagurCgyayHo/preview\" width=\"500\"></iframe><iframe class=\"w-100\" frameborder=\"0\" height=\"500\" scrolling=\"no\" src=\"https://drive.google.com/file/d/10H6o0axLbwnlMJ1WpIJpBMfD2ADTSt2t/preview\" width=\"500\"></iframe></p>\r\n','2022-05-09 17:00:00',NULL,'https://res.cloudinary.com/regnuxcloud/image/upload/v1635921100/jkkjyin69qe2qwczitdv.jpg',7,'thao',NULL,NULL,NULL),(13,'Bạn đã biết những bãi biển nổi tiếng ở Phú Quốc?','<ol>\r\n	<li><strong>B&atilde;i Trường</strong></li>\r\n</ol>\r\n\r\n<p>C&ograve;n được biết tới với c&aacute;i t&ecirc;n Long Beach, sở dĩ gọi là Bãi Trường vì đ&acirc;y là l&agrave; khu phức hợp du lịch lớn nhất đảo Ph&uacute; Quốc nằm ngay thị trấn Dương Đ&ocirc;ng c&oacute; đường bở bi&ecirc;̉n dài nh&acirc;́t Phú Qu&ocirc;́c, với chiều d&agrave;i 20 km. Chạy dài từ Dinh Cậu đến bắc An Thới v&agrave; được chia l&agrave;m hai b&atilde;i l&agrave; Bắc Long Beach v&agrave; Nam Long Beach. B&atilde;i Trường chia th&agrave;nh nhiều đoạn nhỏ, nối liền nhau bởi những ghềnh đ&aacute;, c&acirc;y xanh v&agrave; l&agrave;ng ch&agrave;i thấp tho&aacute;ng ẩn hiện.</p>\r\n\r\n<p><iframe class=\"w-100\" frameborder=\"0\" height=\"500\" scrolling=\"no\" src=\"https://drive.google.com/file/d/1tH_shg1jOIDm5FvQlbLilx2xI_Xh9SgF/preview\" width=\"500\"></iframe></p>\r\n\r\n<ol>\r\n	<li value=\"2\"><strong>B&atilde;i D&agrave;i</strong></li>\r\n</ol>\r\n\r\n<p>Được bầu chọn l&agrave; đứng đầu trong 13 b&atilde;i biển hoang sơ v&agrave; đẹp nhất thế giới, B&atilde;i D&agrave;i l&agrave; một nh&acirc;n tố quan trọng l&agrave;m n&ecirc;n t&ecirc;n tuổi huyện đảo Ph&uacute; Quốc trong mắt du kh&aacute;ch trong nước v&agrave; quốc tế. Nằm ở ph&iacute;a T&acirc;y, với đường bờ biển d&agrave;i 15km c&ugrave;ng l&agrave; nước xanh trong vắt, b&atilde;i c&aacute;t mịn m&agrave;ng v&agrave; h&agrave;ng c&acirc;y xanh r&igrave; l&agrave; điểm đến l&yacute; tưởng đối với những du kh&aacute;ch y&ecirc;u th&iacute;ch sự y&ecirc;n tĩnh v&agrave; hoang sơ.</p>\r\n\r\n<p><iframe class=\"w-100\" frameborder=\"0\" height=\"500\" scrolling=\"no\" src=\"https://drive.google.com/file/d/13KVUHfV3v3VYIab_iwe262-Bo0LfDSW0/preview\" width=\"500\"></iframe></p>\r\n','2022-05-09 17:00:00',NULL,'https://res.cloudinary.com/regnuxcloud/image/upload/v1635921329/e9cn2jz6wwdxznv4bssu.jpg',7,'thao',NULL,NULL,NULL),(14,'Côn Đảo - Du lịch tâm linh','<p>Bạn c&oacute; thể du lịch theo d&ograve;ng lịch sử kết hợp hội nghị, c&ugrave;ng gia đ&igrave;nh du lịch nghĩ dưỡng, c&oacute; thể du lịch theo hướng tự t&uacute;c, kh&aacute;m ph&aacute;, th&aacute;m hiểm v&agrave; cũng c&oacute; thể du lịch thi&ecirc;n về t&acirc;m linh.</p>\r\n\r\n<p><iframe class=\"w-100\" frameborder=\"0\" height=\"500\" scrolling=\"no\" src=\"https://drive.google.com/file/d/1SNLdaKpIKiBXfZBTiTpHf0yXAseRoRpn/preview\" width=\"500\"></iframe>Nghĩa trang H&agrave;ng Dương, hệ thống nh&agrave; t&ugrave; C&ocirc;n Đảo, di t&iacute;ch cầu Ma Thi&ecirc;n L&atilde;nh, hay miếu B&agrave; Phi Yến,.. l&agrave; những điểm đến quan trọng khi nhắc đến du lịch t&acirc;m linh. C&oacute; những du kh&aacute;ch gh&eacute; thăm v&igrave; nằm trong lịch tr&igrave;nh tour đ&atilde; được sắp xếp, nhưng cũng kh&ocirc;ng &iacute;t những người đến từ những nơi rất xa chỉ để một lần tận mắt chứng kiến hay tận tai lắng nghe những giai thoại linh thi&ecirc;ng, b&iacute; ẩn được truyền miệng từ l&acirc;u đời.</p>\r\n','2022-05-09 17:00:00',NULL,'https://res.cloudinary.com/regnuxcloud/image/upload/v1635921594/vyqgaizfdwmscd9ecgoq.jpg',7,'thao',NULL,NULL,NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order1`
--

DROP TABLE IF EXISTS `order1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_day` datetime DEFAULT NULL,
  `adult_quantity` int DEFAULT NULL,
  `child_quantity` int DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `tour_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tourid_idx` (`tour_id`),
  KEY `fk_userid_idx` (`user_id`),
  CONSTRAINT `fk_tourid` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`id`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order1`
--

LOCK TABLES `order1` WRITE;
/*!40000 ALTER TABLE `order1` DISABLE KEYS */;
INSERT INTO `order1` VALUES (1,'2021-11-01 17:42:44',1,0,50000000,8,NULL),(2,'2021-11-01 17:45:37',2,1,5000000,10,NULL),(3,'2021-11-01 18:21:26',1,0,180000,1,NULL),(4,'2021-11-01 18:21:52',1,0,5000000,6,NULL),(5,'2021-11-01 19:43:53',2,0,4000000,9,NULL),(8,'2021-11-02 18:41:25',2,1,14000000,6,65),(9,'2021-11-02 18:42:22',3,1,170000000,8,65),(10,'2021-11-02 18:45:22',2,4,960000,1,65),(11,'2022-05-13 21:31:36',1,1,70000000,8,7),(12,'2022-06-15 15:50:48',1,0,180000,1,65);
/*!40000 ALTER TABLE `order1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_car`
--

DROP TABLE IF EXISTS `order_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_car` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_number` decimal(10,0) DEFAULT NULL,
  `date_rent` date DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `car_id` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_order_idx` (`user_id`),
  KEY `fk_car_order_idx` (`car_id`),
  CONSTRAINT `fk_car_order` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`),
  CONSTRAINT `fk_user_order` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_car`
--

LOCK TABLES `order_car` WRITE;
/*!40000 ALTER TABLE `order_car` DISABLE KEYS */;
INSERT INTO `order_car` VALUES (1,1,'2021-11-06',3000000,65,1,'2021-09-21 00:00:00',NULL),(2,1,'2021-11-06',3000000,65,1,'2021-09-13 00:00:00',NULL),(3,1,'2021-10-30',3000000,65,1,'2021-08-07 00:00:00',NULL),(4,1,'2021-11-06',2000000,65,2,'2021-08-23 00:00:00',NULL),(5,1,'2021-10-31',2000000,65,2,'2021-10-12 00:00:00',NULL),(6,2,'2021-11-26',6000000,65,1,'2021-10-01 00:00:00',NULL),(7,4,'2021-11-06',12000000,65,1,'2021-09-22 00:00:00',NULL),(8,4,'2021-11-06',8000000,65,2,'2021-08-03 00:00:00',NULL),(9,1,'2021-10-30',2000000,65,2,'2021-08-15 00:00:00',NULL),(10,1,'2021-10-31',2000000,65,2,'2021-10-14 00:00:00',NULL),(11,4,'2021-10-31',8000000,65,2,'2021-11-02 00:00:00',NULL),(12,2,'2021-10-31',4000000,65,2,'2021-11-01 00:00:00',NULL),(13,1,'2021-10-29',2000000,65,2,'2021-10-03 00:00:00',NULL),(14,1,'2021-10-29',2000000,65,2,'2021-09-03 00:00:00',NULL),(15,3,'2021-11-18',6000000,65,2,'2021-10-18 00:00:00',NULL),(16,1,'2021-10-31',2000000,65,2,'2021-10-19 00:00:00',NULL),(17,3,'2021-11-02',6000000,65,2,'2021-09-12 00:00:00',NULL),(18,1,'2021-10-31',2000000,65,2,'2021-08-14 00:00:00',NULL),(19,3,'2021-11-11',6000000,65,2,'2021-11-03 00:00:00',NULL),(20,1,'2021-11-17',2000000,65,2,'2021-11-03 00:00:00',NULL),(21,3,'2021-11-12',2100000,65,5,'2021-11-03 00:00:00',NULL),(22,1,'2021-11-10',700000,7,5,'2021-11-05 00:00:00',NULL),(23,1,'2021-11-16',700000,7,11,'2021-11-05 00:00:00',NULL),(24,1,'2021-11-13',700000,7,11,'2021-11-05 00:00:00',NULL),(25,3,'2021-11-12',3000000,65,8,'2021-11-05 00:00:00',NULL),(26,1,'2021-11-10',6000000,65,4,'2021-11-05 00:00:00','Đã thanh toán'),(27,4,'2021-11-09',2800000,65,5,'2021-11-07 00:00:00','Thanh toán tiền mặt'),(28,1,'2021-11-15',900000,65,7,'2021-11-13 00:00:00','Thanh toán tiền mặt'),(29,1,'2021-11-18',900000,65,7,'2021-11-13 00:00:00','Thanh toán Paypal'),(30,1,'2021-11-26',800000,7,9,'2021-11-14 00:00:00',NULL);
/*!40000 ALTER TABLE `order_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `trip` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `start_day` date DEFAULT NULL,
  `end_day` date DEFAULT NULL,
  `adult_price` decimal(10,0) NOT NULL,
  `child_price` decimal(10,0) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image3` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image4` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image5` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_day` datetime DEFAULT NULL,
  `category_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_loai_tour_idx` (`category_id`),
  KEY `fk_user_id_idx` (`user_id`),
  CONSTRAINT `fk_loai_tour` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES (1,'Tour Vịnh hạ long','3 ngày 2 đêm',22,'2022-05-20','2022-05-23',180000,150000,'','https://res.cloudinary.com/regnuxcloud/image/upload/v1632908857/zh6scry5ewohsigr9pm3.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632908859/xbhjrdmtutpkacyrxmzp.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632908862/lmisrx5j2p3l7lcooazh.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632908864/cvmbuadgxgbgqblm6kzm.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632908867/v1fbwxqsdrxnxwuzz23d.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632908869/ofsf1fds4tuj3wb0k7cx.jpg','2021-10-01 00:00:00',1,NULL),(2,'Tour Nha trang','2 ngay',29,'2022-05-20','2022-05-22',100000,80000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(3,'Tour Sai gon','1 ngay',30,'2022-05-20','2022-05-21',120000,100000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(4,'Tour phú yên','2 ngày',30,'2022-05-20','2022-05-22',200000,150000,'chuyến đi bắt đầu lúc 10h sáng','https://res.cloudinary.com/dyfc3ns2j/image/upload/v1631087509/re023am0njznkxxjn0az.jpg',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(5,'Tour đà nẵng','đăk lak đà nẵng 3 ngày 2 đêm',30,'2022-05-20','2022-05-23',230000,200000,'','https://res.cloudinary.com/dyfc3ns2j/image/upload/v1631341442/javtq7wmrrlncn1jc1t9.jpg',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(6,'Tour Phú Quốc','2 ngày',26,'2022-05-20','2022-05-22',5000000,4000000,'Được ví như tuyệt phẩm của thiên nhiên, bức tranh thiên nhiên hữu tình, còn nguyên nét hoang sơ với biển xanh','https://res.cloudinary.com/dyfc3ns2j/image/upload/v1634030777/jmrghhfwmhukqxom6q3d.jpg',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(7,'Tour Las Vegas','4 ngày 3 đêm',30,'2022-05-20','2022-05-24',10000000,6000000,NULL,'https://res.cloudinary.com/regnuxcloud/image/upload/v1631784702/LasVegas_gvrfkq.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632909449/q15wzx3yxm9ebuqunwof.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632909536/wg4h3gaexiomzvilurxv.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632912350/yluytj3efvswgm0us4g7.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632912870/uqt5y67d24mqu2nl6jrf.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632912872/ilyqbwwfjq92imaourko.png','2021-10-13 17:43:14',2,NULL),(8,'Tour Maldives','3 ngày 2 đêm',18,'2022-05-20','2022-05-23',50000000,20000000,'','https://res.cloudinary.com/dyfc3ns2j/image/upload/v1631956530/yubwvyjeyxxjokposdcp.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632913473/q8kf9dflbjnkkgkgrk0t.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632913475/jkooaqazasexkjaketij.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632913488/klcwdzxfugoulpbwvtp0.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632913490/xau0plyrtp63jxn15h1u.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632913493/p6gctxxnqy0oa5j2dpql.jpg','2021-10-16 00:00:00',2,NULL),(9,'Tour Đảo mèo tại Nhật Bản','1 ngày ',28,'2022-05-20','2022-05-21',2000000,1000000,'- Bạn sẽ được trải nghiệm một cảm thú vị khi chỉ có tại đảo mèo','https://res.cloudinary.com/regnuxcloud/image/upload/v1632041211/nymbtnwnu4cztlftelis.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632041213/tjbjizi9dahpi35rdobh.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632041216/kvtlizdh4nqtwc2dy3wu.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632041218/lwk4nidembasphlzhadv.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632041223/w1otctz0ihphjxctlclr.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1632041225/asthpclwow46qic3jtnh.jpg','2021-10-13 00:00:00',1,NULL),(10,'Tour Đà Lạt','3 ngày 2 đêm',26,'2022-05-20','2022-05-23',2000000,1000000,NULL,'https://res.cloudinary.com/regnuxcloud/image/upload/v1634033786/sktmuomrk5w0mwgdbara.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1634033979/dalat1_emekyi.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1634033792/ye2tbashvnh7qs3scxz5.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1634033795/l1rkkqjsau46afgnsoey.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1634033798/kmbd8g6aizk8euhus4ow.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1634033801/u6fjfjewe3g1ucnmcygn.jpg','2021-10-11 00:00:00',1,NULL),(11,'Tour Phú Quốc','2 ngày',NULL,'2022-06-17','2022-06-19',5000000,200000,'dadsdsdsds','https://res.cloudinary.com/regnuxcloud/image/upload/v1655280815/impqnweyzmstnmozkkwd.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1655280817/uvuuprzt4p0vifauzmgu.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1655280819/gsnd4gyy9j3erujg2d2k.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1655280822/gwicysvepswsv912thgv.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1655280824/b4pkha6wowpm8wz9eno3.jpg','https://res.cloudinary.com/regnuxcloud/image/upload/v1655280826/vzelxpivnkbv5aephzq0.jpg','2022-06-15 00:00:00',1,NULL);
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `user_role` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (7,'Thao','Nguyen','562','thao@gmail.com','Đăk Lăk','thao','$2a$10$q.jiNiO0vEoUjmm35zOK.udilzQRtGl8L1SSsUZpZzl1bwwNMJZsK','https://res.cloudinary.com/dyfc3ns2j/image/upload/v1631277587/ylskyuavdb1neegwedo3.jpg',_binary '\0','ROLE_ADMIN'),(8,'Thao','Nguyen Phuong','562088010','admin@gmail.com','Đăk Lăk','admin00','$2a$10$doOajFY5P9gWjl/L1LQgyupQqbczesc34qIxR46p6te4gnEw5ItIy','https://res.cloudinary.com/dyfc3ns2j/image/upload/v1631335525/mzbwlbeflvgrai6yfxuk.jpg',_binary '\0','ROLE_ADMIN'),(9,'Thao','Nguyen','3432','abc@gmail.com','Đăk Lăk','abc','$2a$10$VdeDmfW2RWmyw8ZdK2XTEObOSRp6rfYpYfrEwjj5CKzdF33wIqtUG','https://res.cloudinary.com/dyfc3ns2j/image/upload/v1632034857/l3esmgzwkmiga3q7qobf.jpg',_binary '\0','ROLE_ADMIN'),(10,'Thao','Nguyen','0562088010','thao@gmail','Đăk Lăk','test','$2a$10$Wi2GgzoQZY51AuoZCWn7uun8p0gSwPfTkVMrrgQPnkLoDeV.l6XYG','https://res.cloudinary.com/dyfc3ns2j/image/upload/v1632061945/xti9cbfpzm2gf1kfu4yw.jpg',_binary '\0','ROLE_ADMIN'),(11,'Thao','Nguyen','0842354768','ad@gmail','Đăk Lăk','ad','$2a$10$ahMETh3EtV8p1zTKxqgD6.HsjjWIR06NwBFuxfcsutyvQ0Qc2zlJO','https://res.cloudinary.com/dyfc3ns2j/image/upload/v1632062194/mshtji54qxh1phywwp2q.jpg',_binary '\0','ROLE_ADMIN'),(58,'Thảo','Nguyen','0562088010','f@x','Đăk Lăk','ư','$2a$10$Fk/VVNgzV7ApxZO8y/UwD.7y8LhwZeEtj9/RXTBQDTVrKtnKQwdvm','https://res.cloudinary.com/regnuxcloud/image/upload/v1635559244/fzqs91kguakacxg2srnz.jpg',_binary '\0','ROLE_STAFF'),(61,'a','a','0842354768','a@a','Đăk Lăk','a','$2a$10$igT2GlE.MefL.3.vL2f3su9xz5hkUKU.1bXtmby5KAiSdaplukWUm','https://res.cloudinary.com/regnuxcloud/image/upload/v1635559694/l6ocwxwyygfzptblygty.jpg',_binary '\0','ROLE_STAFF'),(63,'cccccc','c','0562088010','c@c','Tp HCM','c','$2a$10$z4sJyqwMbSahO9mZUn6kZuKPbGdI7xMtiN0f8tSlt9/CpVLW3IrfG','https://res.cloudinary.com/regnuxcloud/image/upload/v1635559720/wd3vl1qkrklm60jn2oco.jpg',_binary '\0','ROLE_STAFF'),(65,'Xuân','Nguyen','0562088010','xuan@gmail.com','Tp HCM','xuan','$2a$10$QPQWk1VoUSs8WeaxQARlNewp/PLyKdpndoFK4eghmM86DdnFSfquK','https://res.cloudinary.com/regnuxcloud/image/upload/v1635559642/xi7yb0b1ylghecgartmd.jpg',_binary '\0','ROLE_CLIENT'),(66,'Phương','Nguyễn','0842354768','phuong@gmail.com','Tp HCM','phuong','$2a$10$9mcGd0YKtQg//AxSzeH.leAgrVxBa3Thsnded48qOYnQoKm.MjO2i','https://res.cloudinary.com/dyfc3ns2j/image/upload/v1634282045/mlk9fsb9ju0ncw54madx.jpg',_binary '\0','ROLE_CLIENT'),(67,'Lan','Nguyễn Xuân','0842354768','lan@gmail.com','Hà Nội','lan','$2a$10$nQ6p/l1o2SrA/TyerS6e0O.tDhiCID8mAFGiUm3rgdHHXeTEwBW1m','https://res.cloudinary.com/regnuxcloud/image/upload/v1635559882/kov8s9xpjxv5tcb1b7nu.jpg',_binary '\0','ROLE_STAFF'),(68,'Mai','Nguyễn','0842354768','mai@gmail.com','Tp HCM','mai','$2a$10$BLuHxDer15C3Vs.WRalniuhHoQdTVrzY4OJgC0Ytl.38rkTp7mZ1e','https://res.cloudinary.com/regnuxcloud/image/upload/v1635935692/ldx5al8qq2sgs1nllp6y.jpg',_binary '\0','ROLE_STAFF'),(70,'An','Trần Văn','0562088012','1851010126thao@ou.edu.vn','Phú Yên','an','$2a$10$9bhXIZ76r18B53LVjg4equWZLC2w1L1Tv/e6NkTdE5aXz6PXI90li','https://res.cloudinary.com/regnuxcloud/image/upload/v1655279693/cznlysvzlgk1ncughh9i.png',_binary '\0','ROLE_CLIENT');
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

-- Dump completed on 2022-06-15 16:15:35
