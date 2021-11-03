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

 Date: 03/11/2021 16:02:01
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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'Đoàn Minh Giang', '0388299424', 'giang.mink@gmail.com', 'minkgiang', '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi', NULL, NULL, NULL, NULL, NULL, 'Admin', NULL);
INSERT INTO `account` VALUES (2, 'Nguyễn Văn Khánh', NULL, NULL, 'onyxzt123', '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi', NULL, NULL, NULL, NULL, NULL, 'Admin', NULL);
INSERT INTO `account` VALUES (8, 'Đặng Thị Lan Hương', NULL, 'lanhuong2k@gmail.com', 'lanhuong', '$2a$10$u0O2RLOcBKPDPIuiez0wdO7YlkjW0luiAmJs5GhA6mxQIvyIXyoBK', NULL, 'not apply this time after security', 'not apply this time after security', '2021-10-24 23:45:24', '2021-10-24 23:45:39', 'User', 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
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
INSERT INTO `category` VALUES (3, 'Drinks', NULL, NULL, 'flaticon-frappe', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (4, 'Coffee', NULL, NULL, 'flaticon-tea-cup', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (5, 'Pizzas', NULL, NULL, 'flaticon-pizza-slice', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for combo
-- ----------------------------
DROP TABLE IF EXISTS `combo`;
CREATE TABLE `combo`  (
  `ComboID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
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
INSERT INTO `combo` VALUES (1, 'Bulgogi Burger Combo', 74000, NULL, '<p>- 01&nbsp;Bulgogi Burger</p>\r\n<p>- 01 Pepsi (M)</p>\r\n<p>- 01 Khoai Tây Chiên (French Fries) - M</p>', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `combo` VALUES (2, 'Combo Burger Tôm (Shrimp Burger Combo)', 77000, NULL, '<p>- 01 Burger Tôm (Shrimp&nbsp;Burger)</p>\r\n<p>- 01 Pepsi (M)</p>\r\n<p>- 01 Khoai Tây Chiên (French Fries) - M</p>', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `combo` VALUES (3, 'Combo Burger Gà Thượng Hạng (Premium Chicken Burger Combo)', 74000, NULL, '<p>- 01 Burger Gà Thượng Hạng (Premium Chicken&nbsp;Burger)</p>\r\n<p>- 01 Pepsi (M)</p>\r\n<p>- 01 Khoai Tây Chiên (French Fries) - M</p', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `combo` VALUES (4, 'Combo Burger Cá (Fish Burger Combo)', 64000, NULL, '<p>- 01 Burger Cá (Fish Burger)</p>\r\n<p>- 01 Pepsi (M)</p>\r\n<p>- 01 Khoai Tây Chiên (French Fries) - M</p>', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `combo` VALUES (5, 'Combo Burger Phô Mai (Cheese Burger Combo)', 64000, NULL, '<p>- 01 Burger Phô Mai&nbsp;(Cheese&nbsp;Burger)</p>\r\n<p>- 01 Pepsi (M)</p>\r\n<p>- 01 Khoai Tây Chiên (French Fries) - M</p>', NULL, NULL, NULL, NULL, NULL);

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
INSERT INTO `comboproduct` VALUES (4, 2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int NULL DEFAULT NULL,
  `CustomerID` int NULL DEFAULT NULL,
  `Contact` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order` VALUES (2, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order` VALUES (18, NULL, 1, NULL, 'Cửa Ông, Cẩm Phả, Quảng Ninh', 'Quảng Ninh', NULL, 'Cửa Ông', 9.0000, 'thêm đường vào ', 'minkgiang', 'minkgiang', '2021-11-02 16:32:33', '2021-11-02 16:32:33', NULL, NULL);

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
  INDEX `fk_orderdetail_order`(`OrderID`) USING BTREE,
  INDEX `fk_orderdetail_combo`(`ComboID`) USING BTREE,
  INDEX `fk_orderdetail_product`(`ProductID`) USING BTREE,
  CONSTRAINT `fk_orderdetail_combo` FOREIGN KEY (`ComboID`) REFERENCES `combo` (`ComboID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderdetail_order` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderdetail_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Image` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CategoryID` int NULL DEFAULT NULL,
  `Stock` int NULL DEFAULT NULL,
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
INSERT INTO `product` VALUES (1, 'Gà Rán - 1 miếng (Fried Chicken -1 PC)', NULL, NULL, '', 2, NULL, 36000.0000, 0, NULL, NULL, '2021-10-04 23:07:32', NULL, NULL);
INSERT INTO `product` VALUES (2, 'Gà Sốt Phô Mai - 1 miếng (Cheese Chicken - 1 PC)', NULL, NULL, '', 2, NULL, 38000.0000, 3, NULL, NULL, '2021-10-05 23:07:36', NULL, NULL);
INSERT INTO `product` VALUES (3, 'Gà nướng - 1 miếng (Grilled Chicken - 1 PC)', NULL, NULL, '', 2, NULL, 38000.0000, 1, NULL, NULL, '2021-10-06 23:07:40', NULL, NULL);
INSERT INTO `product` VALUES (4, 'Gà nướng góc tư (Chicken Quater Leg)', NULL, NULL, '', 2, NULL, 49000.0000, 1, NULL, NULL, '2021-10-06 23:07:40', NULL, NULL);
INSERT INTO `product` VALUES (5, 'Gà Rán - 3 miếng (Fried Chicken - 3 Pcs)', NULL, NULL, NULL, 2, NULL, 99000.0000, 0, NULL, NULL, '2021-10-04 23:07:32', NULL, NULL);
INSERT INTO `product` VALUES (6, 'Burger Bò Teriyaki (Teriyaki Burger)', NULL, NULL, NULL, 2, NULL, 31000.0000, 0, NULL, NULL, '2021-10-04 23:07:32', NULL, NULL);
INSERT INTO `product` VALUES (7, 'Burger Phô Mai (Burger Cheese)', NULL, NULL, NULL, 1, NULL, 34000.0000, NULL, NULL, NULL, '2021-10-04 23:07:32', NULL, NULL);
INSERT INTO `product` VALUES (8, 'Burger Cá (Fish Burger)', NULL, NULL, NULL, 1, NULL, 34000.0000, NULL, NULL, NULL, '2021-10-04 23:07:32', NULL, NULL);
INSERT INTO `product` VALUES (9, 'Burger Gà Thượng Hạng (Premium Chicken Burger)', NULL, NULL, NULL, 1, NULL, 44000.0000, NULL, NULL, NULL, '2021-10-04 23:07:32', NULL, NULL);
INSERT INTO `product` VALUES (10, 'Pepsi (M)', NULL, NULL, NULL, 3, NULL, 14000.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (11, 'Mirinda (M)', NULL, NULL, NULL, 3, NULL, 14000.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (12, '7 UP (M)', NULL, NULL, NULL, 3, NULL, 14000.0000, NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
