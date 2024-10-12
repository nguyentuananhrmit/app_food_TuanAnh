-- -------------------------------------------------------------
-- TablePlus 6.1.6(570)
--
-- https://tableplus.com/
--
-- Database: food_res_app
-- Generation Time: 2024-10-12 14:06:40.8720
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) NOT NULL,
  `sub_price` float NOT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(1, 'Pepperoni Pizza', 'pepperoni_pizza.jpg', 12.99, 'Classic pepperoni pizza', 1),
(2, 'California Roll', 'california_roll.jpg', 8.5, 'Fresh and tasty sushi roll', 2),
(3, 'Vegan Salad', 'vegan_salad.jpg', 9.99, 'Healthy mixed green salad', 3);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Pizza'),
(2, 'Sushi'),
(3, 'Vegan');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2024-09-30 10:15:00'),
(2, 1, '2024-10-01 13:00:00'),
(2, 2, '2024-10-01 13:30:00'),
(3, 3, '2024-10-02 15:30:00'),
(4, 1, '2024-10-02 16:00:00'),
(4, 2, '2024-10-02 17:00:00'),
(5, 3, '2024-10-03 18:00:00'),
(5, 2, '2024-10-03 19:00:00'),
(6, 1, '2024-10-04 09:00:00');

INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 2, 'ORD001', '1'),
(2, 2, 1, 'ORD002', '2'),
(3, 3, 1, 'ORD003', '3'),
(5, 2, 2, 'ORD005', '2'),
(1, 1, 2, 'ORD001', '1'),
(2, 2, 1, 'ORD002', '2'),
(3, 3, 1, 'ORD003', '3'),
(5, 2, 2, 'ORD005', '2'),
(1, 1, 2, 'ORD001', '1'),
(2, 2, 1, 'ORD002', '2'),
(3, 3, 1, 'ORD003', '3'),
(5, 2, 2, 'ORD005', '2'),
(5, 2, 2, 'ORD006', '2'),
(5, 2, 2, 'ORD007', '2'),
(5, 2, 2, 'ORD008', '2');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 5, '2024-10-01 12:30:00'),
(2, 2, 4, '2024-10-02 14:45:00'),
(3, 3, 5, '2024-10-03 11:20:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(1, 'Pizza House', 'pizza_house.jpg', 'Famous for its cheesy pizza'),
(2, 'Sushi World', 'sushi_world.jpg', 'The best sushi in town'),
(3, 'Vegan Delight', 'vegan_delight.jpg', 'Healthy vegan meals');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Extra Cheese', 1.5, 1),
(2, 'Avocado', 2, 2),
(3, 'Tofu', 1, 3);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'John Doe', 'johndoe@example.com', 'password123'),
(2, 'Jane Smith', 'janesmith@example.com', 'password456'),
(3, 'Michael Johnson', 'michaelj@example.com', 'password789'),
(4, 'Emily Davis', 'emilyd@example.com', 'password101112'),
(5, 'David Brown', 'davidb@example.com', 'password131415'),
(6, 'Sarah Wilson', 'sarahw@example.com', 'password161718'),
(7, 'James Moore', 'jamesm@example.com', 'password192021'),
(8, 'Olivia Taylor', 'oliviat@example.com', 'password222324'),
(9, 'William Anderson', 'williama@example.com', 'password252627'),
(10, 'Sophia Thomas', 'sophiat@example.com', 'password282930');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;