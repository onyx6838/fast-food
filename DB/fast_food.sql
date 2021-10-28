/*
 Navicat Premium Data Transfer

 Source Server         : ONYX-3306
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : fast_food

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 28/10/2021 23:50:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Password` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedDate` datetime(0) NULL DEFAULT NULL,
  `UpdatedDate` datetime(0) NULL DEFAULT NULL,
  `Role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Status` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'Đặng Thị Lan Hương   ádasdasd', NULL, NULL, 'minkgiang', '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi', NULL, NULL, NULL, NULL, NULL, 'Admin', NULL);
INSERT INTO `account` VALUES (2, 'nv1', NULL, NULL, 'onyxzt123', '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi', NULL, NULL, NULL, NULL, NULL, 'Admin', NULL);
INSERT INTO `account` VALUES (4, NULL, NULL, '', '', '$2a$10$NfpMz3q0WBSKb1//u4RjvehpIyhhlskO07CDGqyPrPM4rWZSR8n8S', NULL, 'not apply this time after security', 'not apply this time after security', '2021-10-24 01:15:33', '2021-10-24 01:15:33', 'User', 0);
INSERT INTO `account` VALUES (5, NULL, NULL, '', '', '$2a$10$5.lMdjnDTnkKbfALvsK/7OH0zmYpOonNe5qJbXlq042o7GfMvtTOW', NULL, 'not apply this time after security', 'not apply this time after security', '2021-10-24 01:15:54', '2021-10-24 01:15:54', 'User', 0);
INSERT INTO `account` VALUES (6, NULL, NULL, '', '', '$2a$10$s0QIvTP.ht0OnHuz1nayBODpeR6xjXwLyK2maAyvBXsZuCaNFGGOO', NULL, 'not apply this time after security', 'not apply this time after security', '2021-10-24 01:16:06', '2021-10-24 01:16:06', 'User', 0);
INSERT INTO `account` VALUES (8, NULL, NULL, 'mink.giang@gmail.com', 'giangmink', '$2a$10$u0O2RLOcBKPDPIuiez0wdO7YlkjW0luiAmJs5GhA6mxQIvyIXyoBK', NULL, 'not apply this time after security', 'not apply this time after security', '2021-10-24 23:45:24', '2021-10-24 23:45:39', 'User', 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `CategoryID` int NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `OrderBy` int NULL DEFAULT NULL,
  `Image` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedDate` datetime(0) NULL DEFAULT NULL,
  `UpdatedDate` datetime(0) NULL DEFAULT NULL,
  `Status` int NULL DEFAULT NULL,
  PRIMARY KEY (`CategoryID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Burgers', NULL, NULL, 'flaticon-hamburger', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (2, 'Chicken', NULL, NULL, 'flaticon-boiled', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (3, 'Beverage', NULL, NULL, 'flaticon-frappe', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (4, 'Coffee', NULL, NULL, 'flaticon-tea-cup', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (5, 'Pizzas', NULL, NULL, 'flaticon-pizza-slice', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for combo
-- ----------------------------
DROP TABLE IF EXISTS `combo`;
CREATE TABLE `combo`  (
  `ComboID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `TotalPrice` double NULL DEFAULT NULL,
  `Image` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedDate` datetime(0) NULL DEFAULT NULL,
  `UpdatedDate` datetime(0) NULL DEFAULT NULL,
  `Status` int NULL DEFAULT NULL,
  PRIMARY KEY (`ComboID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of combo
-- ----------------------------
INSERT INTO `combo` VALUES (1, 'combo1', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `combo` VALUES (2, 'combo2', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `combo` VALUES (3, 'combo3', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `combo` VALUES (4, 'combo4', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `combo` VALUES (5, 'combo5', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `combo` VALUES (6, 'combo6', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `combo` VALUES (7, 'combo7', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `combo` VALUES (8, 'combo8', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for comboproduct
-- ----------------------------
DROP TABLE IF EXISTS `comboproduct`;
CREATE TABLE `comboproduct`  (
  `ID` int NOT NULL,
  `ComboID` int NULL DEFAULT NULL,
  `ProductID` int NULL DEFAULT NULL,
  `Quantity` int NULL DEFAULT NULL,
  `Price` decimal(19, 4) NULL DEFAULT NULL,
  `CreatedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedDate` datetime(0) NULL DEFAULT NULL,
  `UpdatedDate` datetime(0) NULL DEFAULT NULL,
  `Status` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fk_comboproduct_combo`(`ComboID`) USING BTREE,
  INDEX `fk_comboproduct_product`(`ProductID`) USING BTREE,
  CONSTRAINT `fk_comboproduct_combo` FOREIGN KEY (`ComboID`) REFERENCES `combo` (`ComboID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_comboproduct_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comboproduct
-- ----------------------------
INSERT INTO `comboproduct` VALUES (1, 1, 1, 1, 5.0000, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `comboproduct` VALUES (2, 1, 3, 2, 6.0000, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `comboproduct` VALUES (3, 1, 4, 1, 4.0000, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `comboproduct` VALUES (4, 2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `comboproduct` VALUES (5, 2, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int NULL DEFAULT NULL,
  `CustomerID` int NULL DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `District` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Ward` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `TotalPrice` decimal(19, 4) NULL DEFAULT NULL,
  `Note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedDate` datetime(0) NULL DEFAULT NULL,
  `UpdatedDate` datetime(0) NULL DEFAULT NULL,
  `OrderStatus` int NULL DEFAULT NULL,
  `PaymentStatus` int NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`) USING BTREE,
  INDEX `fk_order_customer_account`(`CustomerID`) USING BTREE,
  INDEX `fk_order_employee_account`(`EmployeeID`) USING BTREE,
  CONSTRAINT `fk_order_customer_account` FOREIGN KEY (`CustomerID`) REFERENCES `account` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_employee_account` FOREIGN KEY (`EmployeeID`) REFERENCES `account` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order` VALUES (2, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order` VALUES (4, NULL, 1, NULL, 'QN', NULL, NULL, 12022112.0000, 'cho nhieu duong', 'not apply this time after security', 'not apply this time after security', '2021-10-28 22:50:04', '2021-10-28 22:50:04', NULL, NULL);
INSERT INTO `order` VALUES (10, NULL, 1, NULL, 'QN', NULL, NULL, 12022112.0000, 'cho nhieu duong', 'minkgiang', 'minkgiang', '2021-10-28 23:36:52', '2021-10-28 23:36:52', NULL, NULL);

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NULL DEFAULT NULL,
  `ProductID` int NULL DEFAULT NULL,
  `ComboID` int NULL DEFAULT NULL,
  `Discount` int NULL DEFAULT NULL,
  `Quantity` int NULL DEFAULT NULL,
  `CreatedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedDate` datetime(0) NULL DEFAULT NULL,
  `UpdatedDate` datetime(0) NULL DEFAULT NULL,
  `Status` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fk_orderdetail_product`(`ProductID`) USING BTREE,
  INDEX `fk_orderdetail_order`(`OrderID`) USING BTREE,
  INDEX `fk_orderdetail_combo`(`ComboID`) USING BTREE,
  CONSTRAINT `fk_orderdetail_combo` FOREIGN KEY (`ComboID`) REFERENCES `combo` (`ComboID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderdetail_order` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderdetail_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (1, 1, 1, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orderdetail` VALUES (2, 1, NULL, 1, 5, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orderdetail` VALUES (10, 10, NULL, 1, NULL, 2, 'minkgiang', 'minkgiang', '2021-10-28 23:36:52', '2021-10-28 23:36:52', NULL);
INSERT INTO `orderdetail` VALUES (11, 10, 2, NULL, NULL, 2, 'minkgiang', 'minkgiang', '2021-10-28 23:36:52', '2021-10-28 23:36:52', NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `ProductID` int NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Image` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CategoryID` int NULL DEFAULT NULL,
  `Price` decimal(19, 4) NULL DEFAULT NULL,
  `Rating` int NULL DEFAULT NULL,
  `CreatedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedDate` datetime(0) NULL DEFAULT NULL,
  `UpdatedDate` datetime(0) NULL DEFAULT NULL,
  `Status` int NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`) USING BTREE,
  INDEX `fk_product_category`(`CategoryID`) USING BTREE,
  CONSTRAINT `fk_product_category` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'hot dog', NULL, NULL, '“Hot dog” means a whole, cured, cooked sausage that is skinless or stuffed in a casing, that may be known as a frankfurter, frank, furter, wiener, red hot, vienna, bologna, garlic bologna, or knockwurst, and that may be served in a bun or roll', 1, 5.0000, 0, NULL, NULL, '2021-10-04 23:07:32', NULL, NULL);
INSERT INTO `product` VALUES (2, 'cake', NULL, NULL, 'Cake is a form of sweet food made from flour, sugar, and other ingredients, that is usually baked. ... Cakes can also be filled with fruit preserves, nuts or dessert sauces (like pastry cream), iced with buttercream', 1, 3.0000, 3, NULL, NULL, '2021-10-05 23:07:36', NULL, NULL);
INSERT INTO `product` VALUES (3, 'drink', NULL, NULL, 'The Coca-Cola Co. is the nonalcoholic beverage company, which engages in the manufacture, market, and sale of non-alcoholic beverages which include sparkling soft drinks, water, enhanced water and sports drinks, juice, dairy and pla', 1, 3.0000, 1, NULL, NULL, '2021-10-06 23:07:40', NULL, NULL);
INSERT INTO `product` VALUES (4, 'bun', NULL, NULL, '“Hot dog” means a whole, cured, cooked sausage that is skinless or stuffed in a casing, that may be known as a frankfurter, frank, furter, wiener, red hot, vienna, bologna, garlic bologna, or knockwurst, and that may be served in a bun or roll', 2, 4.0000, 2, NULL, NULL, '2021-10-11 23:07:44', NULL, NULL);
INSERT INTO `product` VALUES (5, 'hot dog bun', NULL, NULL, '“Hot dog” means a whole, cured, cooked sausage that is skinless or stuffed in a casing, that may be known as a frankfurter, frank, furter, wiener, red hot, vienna, bologna, garlic bologna, or knockwurst, and that may be served in a bun or roll', 2, 6.0000, 4, NULL, NULL, '2021-10-10 23:08:10', NULL, NULL);

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `AccountID` int NOT NULL,
  `ExpiredDate` datetime(0) NOT NULL,
  `Type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fk_accountid_to_account`(`AccountID`) USING BTREE,
  CONSTRAINT `fk_accountid_to_account` FOREIGN KEY (`AccountID`) REFERENCES `account` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (10, 'ce17269f-5f83-498c-bcd1-d02c372eee32', 1, '2021-11-03 23:45:48', 'RefreshToken');
INSERT INTO `token` VALUES (11, '72c24ff3-45e3-4714-8bd0-9b65e8d21595', 1, '2021-11-03 23:47:33', 'RefreshToken');
INSERT INTO `token` VALUES (12, 'db7757ca-ea7c-47dc-b571-c2b65ef5ca37', 1, '2021-11-03 23:47:58', 'RefreshToken');
INSERT INTO `token` VALUES (13, '50a02c39-3cf8-4bff-b764-1d9fd9762bba', 1, '2021-11-03 23:49:54', 'RefreshToken');
INSERT INTO `token` VALUES (14, '7ffdbad0-a0e2-43e2-8eab-59ca0a67eed5', 1, '2021-11-07 21:38:19', 'RefreshToken');
INSERT INTO `token` VALUES (15, '80e486da-45a4-43c1-a3a0-c5d010b213c0', 1, '2021-11-07 21:41:38', 'RefreshToken');
INSERT INTO `token` VALUES (16, '175ba65c-9181-4cda-b27c-f9fbc6152735', 1, '2021-11-07 21:43:34', 'RefreshToken');
INSERT INTO `token` VALUES (17, '8058f9e7-7b71-4f77-a623-d16c4bd658d5', 1, '2021-11-07 22:52:52', 'RefreshToken');
INSERT INTO `token` VALUES (18, '173c49aa-8129-4de2-affa-41a824eab175', 1, '2021-11-07 23:39:41', 'RefreshToken');

SET FOREIGN_KEY_CHECKS = 1;
