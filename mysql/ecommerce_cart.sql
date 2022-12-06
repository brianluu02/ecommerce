CREATE DATABASE ecommerce_cart;

use ecommerce_cart;

CREATE TABLE `orders` (
  `o_id` int NOT NULL AUTO_INCREMENT,
  `p_id` int NOT NULL,
  `u_id` int NOT NULL,
  `o_quantity` int NOT NULL,
  `o_date` varchar(450) NOT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `orders` VALUES (25,3,1,3,'2021-05-15'),(26,2,1,1,'2021-05-15');

CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(450) NOT NULL,
  `category` varchar(450) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(450) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `products` VALUES (1,'Iphone 12','64GB',120,'iphone_12.jpg'),
(2,'Iphone 13','128GB',69.99,'iphone_13.jfif'),
(3,'Iphone 13 pro max','256GB',169,'iphone_13promax.jpg'),
(4,'Iphone 14','256GB',2500.99,'iphone_14.jfif'),
(5,'Iphone 14 pro max ','1T',310,'iphone_14promax.png'),
(6,'iphone 12 mini ','64GB',555.5,'iphone_12mini.jpg');

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `users` VALUES (2,'quocluu','quocluu@mail.com','123456', 'user');
INSERT INTO `users` VALUES (3,'acx','quocluuanh@mail.com','123123', 'user');
INSERT INTO `users` VALUES (4,'admin','admin@mail.com','123456', 'admin');
select *from ecommerce_cart.users