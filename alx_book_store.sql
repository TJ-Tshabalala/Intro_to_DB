CREATE DATABASE IF NOT EXISTS alx_book_store;

USE DATABASE alx_book_store;
--
-- Table structure for table `Authors`
--

DROP TABLE IF EXISTS Authors;
CREATE TABLE Authors (
  author_id int NOT NULL,
  author_name varchar(215) NOT NULL,
  PRIMARY KEY (author_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES Authors WRITE;
/*!40000 ALTER TABLE `Authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `Authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
CREATE TABLE `Books` (
  `book_id` int NOT NULL,
  `title` varchar(130) NOT NULL,
  `author_id` int DEFAULT NULL,
  `price` double NOT NULL,
  `publication_date` date DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `Books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `Authors` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `Books`
--


UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;

CREATE TABLE `Customers` (
  customer_id int NOT NULL,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215) DEFAULT NULL,
  address TEXT,
  PRIMARY KEY (customer_id),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;

UNLOCK TABLES;

--
-- Table structure for table `Order_Details`
--

DROP TABLE IF EXISTS `Order_Details`;
CREATE TABLE `Order_Details` (
    order_detailid INT NOT NULL,
    order_id INT DEFAULT NULL,
    book_id INT DEFAULT NULL,
    quantity DOUBLE DEFAULT NULL,
    PRIMARY KEY (order_detailid),
    KEY order_id (order_id),
    KEY book_id (book_id),
    CONSTRAINT FK_OrderDetailOrder FOREIGN KEY (order_id) REFERENCES `Orders` (order_id),
    CONSTRAINT FK_OrderDetailBook FOREIGN KEY (book_id) REFERENCES `Books` (book_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `Order_Details`
--

LOCK TABLES `Order_Details` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    order_id INT NOT NULL,
    customer_id INT DEFAULT NULL,
    order_date DATE DEFAULT NULL,
    PRIMARY KEY (order_id),
    KEY customer_id (customer_id),
    CONSTRAINT FK_CustomerOrder FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
UNLOCK TABLES;
