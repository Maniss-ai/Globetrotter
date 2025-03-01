-- MySQL dump 10.13  Distrib 8.0.41, for macos15 (arm64)
--
-- Host: localhost    Database: globetrotter_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `destination_id` bigint NOT NULL,
  `text` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `destination_id` (`destination_id`),
  CONSTRAINT `answers_fk` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (32,1,'Paris',1),(33,1,'Rome',0),(34,1,'Venice',0),(35,1,'London',0),(36,2,'Tokyo',1),(37,2,'Beijing',0),(38,2,'Seoul',0),(39,2,'New York',0),(40,3,'New York',1),(41,3,'Los Angeles',0),(42,3,'Chicago',0),(43,3,'San Francisco',0),(44,4,'London',1),(45,4,'Dublin',0),(46,4,'Manchester',0),(47,4,'Glasgow',0),(48,5,'Sydney',1),(49,5,'Melbourne',0),(50,5,'Brisbane',0),(51,5,'Perth',0),(52,6,'Rome',1),(53,6,'Athens',0),(54,6,'Florence',0),(55,6,'Madrid',0),(56,7,'Barcelona',1),(57,7,'Lisbon',0),(58,7,'Valencia',0),(59,7,'Porto',0),(60,8,'Singapore',1),(61,8,'Kuala Lumpur',0),(62,8,'Bangkok',0),(63,8,'Jakarta',0),(64,9,'Berlin',1),(65,9,'Munich',0),(66,9,'Frankfurt',0),(67,9,'Hamburg',0),(68,10,'Dubai',1),(69,10,'Abu Dhabi',0),(70,10,'Riyadh',0),(71,10,'Doha',0),(72,11,'Amsterdam',1),(73,11,'Brussels',0),(74,11,'Copenhagen',0),(75,11,'Vienna',0),(76,12,'Cairo',1),(77,12,'Istanbul',0),(78,12,'Casablanca',0),(79,12,'Tehran',0),(80,13,'Rio de Janeiro',1),(81,13,'Buenos Aires',0),(82,13,'Sao Paulo',0),(83,13,'Lima',0),(84,14,'Moscow',1),(85,14,'St. Petersburg',0),(86,14,'Helsinki',0),(87,14,'Warsaw',0),(88,15,'Toronto',1),(89,15,'Vancouver',0),(90,15,'Montreal',0),(91,15,'Boston',0),(92,16,'Beijing',1),(93,16,'Shanghai',0),(94,16,'Hong Kong',0),(95,16,'Taipei',0),(96,17,'Istanbul',1),(97,17,'Athens',0),(98,17,'Rome',0),(99,17,'Cairo',0),(100,18,'Mumbai',1),(101,18,'Delhi',0),(102,18,'Bangalore',0),(103,18,'Chennai',0),(104,19,'Los Angeles',1),(105,19,'San Diego',0),(106,19,'San Francisco',0),(107,19,'Las Vegas',0),(108,20,'Cape Town',1),(109,20,'Johannesburg',0),(110,20,'Durban',0),(111,20,'Pretoria',0),(112,21,'Vienna',1),(113,21,'Salzburg',0),(114,21,'Zurich',0),(115,21,'Munich',0),(116,22,'Buenos Aires',1),(117,22,'Montevideo',0),(118,22,'Lima',0),(119,22,'Santiago',0),(120,23,'Seoul',1),(121,23,'Busan',0),(122,23,'Osaka',0),(123,23,'Kyoto',0),(124,24,'Lisbon',1),(125,24,'Porto',0),(126,24,'Madrid',0),(127,24,'Barcelona',0),(128,25,'Prague',1),(129,25,'Bratislava',0),(130,25,'Krakow',0),(131,25,'Budapest',0),(132,26,'Stockholm',1),(133,26,'Copenhagen',0),(134,26,'Helsinki',0),(135,26,'Oslo',0),(136,27,'Helsinki',1),(137,27,'Stockholm',0),(138,27,'Oslo',0),(139,27,'Reykjavik',0),(140,28,'Dublin',1),(141,28,'Edinburgh',0),(142,28,'Belfast',0),(143,28,'London',0),(144,29,'Zurich',1),(145,29,'Geneva',0),(146,29,'Bern',0),(147,29,'Munich',0),(148,30,'Auckland',1),(149,30,'Wellington',0),(150,30,'Christchurch',0),(151,30,'Sydney',0);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenges`
--

DROP TABLE IF EXISTS `challenges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenges` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `accepted` bit(1) NOT NULL,
  `challenger_username` varchar(255) DEFAULT NULL,
  `invite_link` varchar(255) DEFAULT NULL,
  `invited_username` varchar(255) DEFAULT NULL,
  `game_session_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2a2h5i6sqb0g6xhqvu4vvli45` (`game_session_id`),
  CONSTRAINT `FK2a2h5i6sqb0g6xhqvu4vvli45` FOREIGN KEY (`game_session_id`) REFERENCES `game_sessions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES (1,_binary '\0','Manish','http://localhost:8080/api/challenges/join/a2a3b2a0-edc8-4836-acf1-883871a44408','Friend',1),(2,_binary '\0','Manish','http://localhost:8080/api/challenges/join/a5007845-c4f0-4284-a684-b0fa5596df01','Friend',1),(3,_binary '\0','Manish','http://localhost:8080/api/challenges/join/b72414f5-bd50-4f2e-9280-4241bb2dfa64','Friend',1);
/*!40000 ALTER TABLE `challenges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clues`
--

DROP TABLE IF EXISTS `clues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clues` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `destination_id` bigint NOT NULL,
  `clue_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `destination_id` (`destination_id`),
  CONSTRAINT `clues_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clues`
--

LOCK TABLES `clues` WRITE;
/*!40000 ALTER TABLE `clues` DISABLE KEYS */;
INSERT INTO `clues` VALUES (1,1,'This city is famous for the Eiffel Tower and its sparkling nights.'),(2,1,'Known as the City of Love, Paris enchants with art and cuisine.'),(3,2,'Tokyo dazzles with the bustling Shibuya Crossing and neon lights.'),(4,2,'A perfect blend of tradition and modernity defines Tokyo.'),(5,3,'The Big Apple boasts an iconic skyline and endless energy.'),(6,3,'Diverse neighborhoods and world-class museums make New York unique.'),(7,4,'London’s historic landmarks like Big Ben and the Thames captivate visitors.'),(8,4,'Experience a mix of royal heritage and modern culture in London.'),(9,5,'Sydney is renowned for its Opera House and stunning harbor views.'),(10,5,'Beautiful beaches and urban charm define Sydney.'),(11,6,'Rome, the Eternal City, is filled with ancient ruins and art.'),(12,6,'From the Colosseum to the Vatican, history breathes in Rome.'),(13,7,'Barcelona shines with Gaudí’s unique architecture and Mediterranean flair.'),(14,7,'The vibrant street life and artistic energy make Barcelona memorable.'),(15,8,'Singapore impresses with a futuristic skyline and lush green spaces.'),(16,8,'A cultural melting pot, Singapore delights with its cuisine and order.'),(17,9,'Berlin’s rich history is visible in its monuments and modern art scene.'),(18,9,'From the Brandenburg Gate to street art, Berlin has much to offer.'),(19,10,'Dubai stands out with luxurious skyscrapers and modern architecture.'),(20,10,'A city of superlatives, Dubai merges futuristic design with tradition.'),(21,11,'Amsterdam charms with its historic canals and laid-back vibe.'),(22,11,'Biking culture and artistic heritage make Amsterdam unique.'),(23,12,'Cairo is steeped in history with nearby pyramids and ancient monuments.'),(24,12,'Bustling bazaars and timeless traditions define Cairo.'),(25,13,'Rio is famous for its breathtaking beaches and Carnival spirit.'),(26,13,'The iconic Christ the Redeemer watches over the energetic city.'),(27,14,'Moscow impresses with its ornate architecture and the historic Red Square.'),(28,14,'A blend of culture and history, Moscow reveals layers of Russian heritage.'),(29,15,'Toronto is celebrated for its multicultural neighborhoods and skyline.'),(30,15,'The CN Tower and vibrant arts scene highlight Toronto’s charm.'),(31,16,'Beijing is rich in history, home to the Forbidden City and ancient sites.'),(32,16,'A city where tradition meets rapid modernization, Beijing fascinates.'),(33,17,'Istanbul uniquely straddles two continents, offering diverse cultural sights.'),(34,17,'Historic mosques and bustling bazaars are hallmarks of Istanbul.'),(35,18,'Mumbai pulses with energy as India’s financial and entertainment hub.'),(36,18,'Its busy markets and film industry contribute to Mumbai’s vibrant spirit.'),(37,19,'Los Angeles dazzles with its ties to Hollywood and sunny beaches.'),(38,19,'A blend of glamour and laid-back lifestyle makes LA distinct.'),(39,20,'Cape Town offers stunning coastal views and the majesty of Table Mountain.'),(40,20,'Natural beauty and cultural diversity define Cape Town.'),(41,21,'Vienna is synonymous with classical music, elegant palaces, and historic cafés.'),(42,21,'A rich imperial history meets modern art in Vienna.'),(43,22,'Buenos Aires pulsates with tango, vibrant streets, and European charm.'),(44,22,'The city’s artistic soul and bustling nightlife are unforgettable.'),(45,23,'Seoul mixes ancient palaces with futuristic technology and style.'),(46,23,'A dynamic hub of fashion, food, and culture, Seoul stands out.'),(47,24,'Lisbon enchants with its historic trams and scenic, hilly streets.'),(48,24,'The city’s waterfront views and traditional Fado music create a unique atmosphere.'),(49,25,'Prague’s fairy-tale architecture and charming Old Town attract many visitors.'),(50,25,'Historic bridges and cobblestone streets tell stories of centuries past.'),(51,26,'Stockholm is spread across islands, combining modern design with natural beauty.'),(52,26,'The city’s clean aesthetics and cultural richness make it special.'),(53,27,'Helsinki blends modern design with access to nature and maritime charm.'),(54,27,'Innovative spirit and a high quality of life define Helsinki.'),(55,28,'Dublin is known for its literary heritage and welcoming pub culture.'),(56,28,'Rich in history and lively music, Dublin leaves a lasting impression.'),(57,29,'Zurich balances a modern financial center with a charming, historic old town.'),(58,29,'High living standards and scenic lake views are trademarks of Zurich.'),(59,30,'Auckland is celebrated for its maritime heritage and scenic harbors.'),(60,30,'A diverse cultural scene and access to nature make Auckland unique.');
/*!40000 ALTER TABLE `clues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinations`
--

DROP TABLE IF EXISTS `destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_city_country` (`city`,`country`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinations`
--

LOCK TABLES `destinations` WRITE;
/*!40000 ALTER TABLE `destinations` DISABLE KEYS */;
INSERT INTO `destinations` VALUES (11,'Amsterdam','Netherlands'),(30,'Auckland','New Zealand'),(7,'Barcelona','Spain'),(16,'Beijing','China'),(9,'Berlin','Germany'),(22,'Buenos Aires','Argentina'),(12,'Cairo','Egypt'),(20,'Cape Town','South Africa'),(10,'Dubai','United Arab Emirates'),(28,'Dublin','Ireland'),(27,'Helsinki','Finland'),(17,'Istanbul','Turkey'),(24,'Lisbon','Portugal'),(4,'London','UK'),(19,'Los Angeles','USA'),(14,'Moscow','Russia'),(18,'Mumbai','India'),(3,'New York','USA'),(1,'Paris','France'),(25,'Prague','Czech Republic'),(13,'Rio de Janeiro','Brazil'),(6,'Rome','Italy'),(23,'Seoul','South Korea'),(8,'Singapore','Singapore'),(26,'Stockholm','Sweden'),(5,'Sydney','Australia'),(2,'Tokyo','Japan'),(15,'Toronto','Canada'),(21,'Vienna','Austria'),(29,'Zurich','Switzerland');
/*!40000 ALTER TABLE `destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fun_facts`
--

DROP TABLE IF EXISTS `fun_facts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fun_facts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `destination_id` bigint NOT NULL,
  `fact_text` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `destination_id` (`destination_id`),
  CONSTRAINT `fun_facts_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fun_facts`
--

LOCK TABLES `fun_facts` WRITE;
/*!40000 ALTER TABLE `fun_facts` DISABLE KEYS */;
INSERT INTO `fun_facts` VALUES (1,1,'The Eiffel Tower was initially intended as a temporary exhibit.'),(2,1,'Paris is home to over 70 museums, including the Louvre, the world’s largest art museum.'),(3,2,'Tokyo originated from a small fishing village known as Edo.'),(4,2,'It is one of the most populous metropolitan areas in the world.'),(5,3,'The Statue of Liberty was a gift from France to the United States.'),(6,3,'New York’s extensive subway system operates 24/7.'),(7,4,'London’s Underground is the oldest metro system in the world.'),(8,4,'The River Thames has been central to London’s history for centuries.'),(9,5,'Sydney hosted the 2000 Olympic Games, boosting its international profile.'),(10,5,'The Sydney Opera House is a UNESCO World Heritage site.'),(11,6,'Rome is over 2,500 years old and has influenced much of Western culture.'),(12,6,'The Colosseum could hold up to 80,000 spectators in ancient times.'),(13,7,'Barcelona’s Sagrada Família has been under construction for over a century.'),(14,7,'The city is a hub for art and modernist architecture.'),(15,8,'Singapore is renowned for its cleanliness and efficient urban planning.'),(16,8,'It is one of the world’s busiest ports despite its small land area.'),(17,9,'Berlin was divided by the Berlin Wall during the Cold War era.'),(18,9,'Today, Berlin is a thriving center for arts, technology, and startups.'),(19,10,'Dubai’s Burj Khalifa is the tallest building in the world at 828 meters.'),(20,10,'The city transformed rapidly from a small trading port into a modern metropolis.'),(21,11,'Amsterdam’s canal system is a UNESCO World Heritage site.'),(22,11,'The city is famous for its bicycle-friendly streets and liberal culture.'),(23,12,'Cairo is close to the ancient pyramids of Giza, one of the world’s wonders.'),(24,12,'It has been a center of education and culture for millennia.'),(25,13,'Rio is home to the iconic Christ the Redeemer statue overlooking the city.'),(26,13,'Its Carnival is one of the largest and most colorful festivals in the world.'),(27,14,'Moscow’s Kremlin and Red Square are symbols of Russian history and power.'),(28,14,'The city features distinctive onion-domed architecture on its churches.'),(29,15,'Toronto is recognized as one of the most multicultural cities globally.'),(30,15,'The CN Tower in Toronto was once the world’s tallest free-standing structure.'),(31,16,'Beijing is home to the Forbidden City, an immense imperial palace complex.'),(32,16,'The Great Wall of China, visible from space according to popular lore, is near Beijing.'),(33,17,'Istanbul is the only city in the world spanning two continents: Europe and Asia.'),(34,17,'The Hagia Sophia in Istanbul has served as a church and mosque over the centuries.'),(35,18,'Mumbai is the financial powerhouse and entertainment hub of India.'),(36,18,'It is the heart of Bollywood, one of the world’s largest film industries.'),(37,19,'Los Angeles is synonymous with Hollywood and the global entertainment industry.'),(38,19,'The city is famous for its year-round sunshine and diverse culture.'),(39,20,'Cape Town’s Table Mountain provides panoramic views over the city and ocean.'),(40,20,'It is one of the most biodiverse regions in the world.'),(41,21,'Vienna is celebrated for its classical music legacy and grand imperial palaces.'),(42,21,'The city’s café culture has been an integral part of its social life for centuries.'),(43,22,'Buenos Aires is often referred to as the “Paris of South America” due to its architecture.'),(44,22,'The city is famous for its passionate tango dancing and lively street art.'),(45,23,'Seoul is a high-tech city with ancient palaces and bustling markets.'),(46,23,'It is known for its rapid modernization and vibrant pop culture.'),(47,24,'Lisbon is one of Europe’s oldest cities, rich with maritime history.'),(48,24,'Its steep, narrow streets and scenic views over the Atlantic define Lisbon.'),(49,25,'Prague’s Old Town is a well-preserved medieval gem and UNESCO site.'),(50,25,'The city’s historical bridges and cobblestone streets attract millions each year.'),(51,26,'Built on 14 islands, Stockholm is known for its modern design and eco-friendly policies.'),(52,26,'The city boasts a rich cultural scene alongside a pristine natural environment.'),(53,27,'Helsinki is famous for its innovative design and high quality of life.'),(54,27,'Its location by the Baltic Sea provides a unique maritime charm.'),(55,28,'Dublin has a storied literary tradition and vibrant pub culture.'),(56,28,'The city is known for its friendly locals and historic landmarks.'),(57,29,'Zurich is a global financial hub with a high standard of living.'),(58,29,'Its mix of modern infrastructure and a well-preserved old town creates a unique charm.'),(59,30,'Auckland is known as the City of Sails for its thriving boating culture.'),(60,30,'The city’s diverse culture and natural harbor make it a top destination.');
/*!40000 ALTER TABLE `fun_facts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_sessions`
--

DROP TABLE IF EXISTS `game_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_sessions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `current_score` int NOT NULL DEFAULT '0',
  `total_questions` int NOT NULL DEFAULT '0',
  `correct_answers` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `game_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_sessions`
--

LOCK TABLES `game_sessions` WRITE;
/*!40000 ALTER TABLE `game_sessions` DISABLE KEYS */;
INSERT INTO `game_sessions` VALUES (1,1,70,184,70),(2,2,1,5,1),(3,3,50,139,50),(4,4,2,5,2),(5,5,4,8,4);
/*!40000 ALTER TABLE `game_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trivia`
--

DROP TABLE IF EXISTS `trivia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trivia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `destination_id` bigint NOT NULL,
  `trivia_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `destination_id` (`destination_id`),
  CONSTRAINT `trivia_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trivia`
--

LOCK TABLES `trivia` WRITE;
/*!40000 ALTER TABLE `trivia` DISABLE KEYS */;
INSERT INTO `trivia` VALUES (1,1,'Paris is often called the City of Light.'),(2,1,'The Louvre in Paris is the world’s largest art museum.'),(3,2,'Tokyo is renowned for its advanced technology and vibrant street fashion.'),(4,2,'Sushi and ramen are among the culinary delights that define Tokyo.'),(5,3,'New York is known as The Big Apple.'),(6,3,'Central Park in New York covers over 800 acres of green space.'),(7,4,'Buckingham Palace is one of London’s major attractions.'),(8,4,'The London Eye provides panoramic views of the city skyline.'),(9,5,'Sydney is famous for its world-class harbor and coastal attractions.'),(10,5,'The city’s vibrant arts scene and outdoor lifestyle attract many visitors.'),(11,6,'Rome is built on layers of history spanning more than two millennia.'),(12,6,'Vatican City, the smallest independent state, is located within Rome.'),(13,7,'Barcelona is famed for its modernist architecture and artistic heritage.'),(14,7,'It was the host city of the 1992 Olympic Games.'),(15,8,'Singapore is one of the world’s most efficient and clean cities.'),(16,8,'The city-state is a major global financial hub despite its small size.'),(17,9,'Berlin has reinvented itself as a center for art and innovation.'),(18,9,'The city’s history is marked by the dramatic fall of the Berlin Wall.'),(19,10,'Dubai is home to the world’s tallest building, the Burj Khalifa.'),(20,10,'Luxurious shopping malls and man-made islands are part of Dubai’s modern marvels.'),(21,11,'Amsterdam is famous for its liberal culture and extensive canal network.'),(22,11,'The city is also known for its thriving arts and music scenes.'),(23,12,'Cairo is the largest city in the Arab world.'),(24,12,'It has been a center of education and culture for thousands of years.'),(25,13,'Rio is synonymous with its lively Carnival and festive atmosphere.'),(26,13,'Its landscape combines dramatic mountains with sun-kissed beaches.'),(27,14,'Moscow’s Red Square is a symbol of Russian heritage.'),(28,14,'The city is renowned for its striking architecture and historical significance.'),(29,15,'Toronto is one of the most multicultural cities in the world.'),(30,15,'The city’s skyline is dominated by the iconic CN Tower.'),(31,16,'Beijing has been the capital of several Chinese dynasties.'),(32,16,'Its cuisine and cultural festivals are celebrated worldwide.'),(33,17,'Istanbul was once known as Byzantium and Constantinople.'),(34,17,'It is the only major city that spans two continents.'),(35,18,'Mumbai is the financial and entertainment heart of India.'),(36,18,'It is known for its bustling markets and vibrant street scenes.'),(37,19,'Los Angeles is a global center for film and television.'),(38,19,'The city’s pleasant weather and diverse culture draw visitors year-round.'),(39,20,'Cape Town is celebrated for its breathtaking natural beauty.'),(40,20,'Table Mountain is one of the city’s most iconic landmarks.'),(41,21,'Vienna is steeped in classical music history with ties to Mozart and Beethoven.'),(42,21,'The city’s coffeehouse culture has been recognized by UNESCO.'),(43,22,'Buenos Aires is famed for its passionate tango and vibrant street art.'),(44,22,'Often called the Paris of South America, it boasts European-style architecture.'),(45,23,'Seoul combines cutting-edge technology with centuries-old traditions.'),(46,23,'It is one of Asia’s most dynamic and rapidly developing cities.'),(47,24,'Lisbon is known for its steep streets and pastel-colored buildings.'),(48,24,'The city’s history as a maritime power is celebrated in its museums.'),(49,25,'Prague’s historic center is one of the best-preserved in Europe.'),(50,25,'Its unique blend of Gothic, Baroque, and Renaissance architecture fascinates visitors.'),(51,26,'Stockholm is built on 14 islands, creating a scenic urban landscape.'),(52,26,'It is known for its innovative design and sustainable living.'),(53,27,'Helsinki is celebrated for its modern art and design.'),(54,27,'The city offers a high quality of life and close proximity to nature.'),(55,28,'Dublin is famed for its literary history and friendly atmosphere.'),(56,28,'The city’s cultural festivals and historic sites attract visitors worldwide.'),(57,29,'Zurich is a blend of modern finance and a charming historical center.'),(58,29,'The city consistently ranks among the best in quality of life.'),(59,30,'Auckland is known as the City of Sails for its vibrant boating culture.'),(60,30,'The city offers a mix of urban sophistication and natural beauty.');
/*!40000 ALTER TABLE `trivia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Divya'),(1,'Manish'),(2,'New User'),(4,'rohit'),(5,'ronit');
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

-- Dump completed on 2025-03-01 23:37:14
