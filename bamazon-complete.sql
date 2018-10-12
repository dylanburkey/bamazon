/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50638
 Source Host           : localhost
 Source Database       : bamazon

 Target Server Type    : MySQL
 Target Server Version : 50638
 File Encoding         : utf-8

 Date: 10/12/2018 15:13:15 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `departments`
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(45) NOT NULL,
  `over_head_costs` decimal(10,2) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `departments`
-- ----------------------------
BEGIN;
INSERT INTO `departments` VALUES ('1', 'Video Games', '200.00'), ('2', 'Food and Drink', '100.00'), ('3', 'Apparel', '50.00'), ('4', 'Necessities', '300.00'), ('5', 'Films', '35.00'), ('6', 'Board Games', '0.00');
COMMIT;

-- ----------------------------
--  Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  `product_sales` decimal(10,2) DEFAULT '0.00',
  `department_name` varchar(45) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(10) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `products`
-- ----------------------------
BEGIN;
INSERT INTO `products` VALUES ('1', 'The Eminem Show', '0.00', 'Video Games', '150.10', '20'), ('2', 'Uncharted 4', '0.00', 'Video Games', '49.95', '150'), ('3', 'My Little Pony', '0.00', 'Video Games', '59.99', '200'), ('4', 'Cheese Puffs', '0.00', 'Food and Drink', '24.50', '50'), ('5', 'Ray Ban', '0.00', 'Apparel', '75.00', '5'), ('6', 'Paige Jeans', '0.00', 'Apparel', '54.25', '35'), ('7', 'Blow Up Doll', '0.00', 'Necessities', '42.42', '42'), ('8', 'Bill and Ted\'s Excellent Adventure', '0.00', 'Films', '15.00', '25'), ('9', 'Old School', '0.00', 'Films', '25.50', '57'), ('10', 'Monopoly', '0.00', 'Board Games', '30.50', '35'), ('11', 'Strip Poker', '0.00', 'Board Games', '19.95', '23');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
