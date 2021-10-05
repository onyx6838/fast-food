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

 Date: 06/10/2021 01:02:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `ID` int NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UpdatedBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedDate` datetime(0) NULL DEFAULT NULL,
  `UpdatedDate` datetime(0) NULL DEFAULT NULL,
  `Role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'ggg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `account` VALUES (2, 'nv1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of combo
-- ----------------------------
INSERT INTO `combo` VALUES (1, 'combo1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `combo` VALUES (2, 'combo2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  `OrderID` int NOT NULL,
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

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `ID` int NOT NULL,
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
INSERT INTO `product` VALUES (1, 'hot dog', NULL, NULL, NULL, NULL, 5.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (2, 'cake', NULL, NULL, NULL, NULL, 3.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (3, 'drink', NULL, NULL, NULL, NULL, 3.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (4, 'bun', NULL, NULL, NULL, NULL, 4.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (5, 'hot dog bun', NULL, NULL, NULL, NULL, 6.0000, NULL, NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
