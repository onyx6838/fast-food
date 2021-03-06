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

 Date: 26/11/2021 21:17:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `LastName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'Đoàn Minh', 'Giang', '0388299424', 'giang.mink@gmail.com', 'minkgiang', '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi', NULL, NULL, NULL, NULL, NULL, 'Admin', NULL);
INSERT INTO `account` VALUES (2, 'Nguyễn Văn', 'Khánh', NULL, NULL, 'onyxzt123', '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi', NULL, NULL, NULL, NULL, NULL, 'Admin', NULL);
INSERT INTO `account` VALUES (8, 'Đặng Thị Lan', 'Hương', NULL, 'lanhuong2k@gmail.com', 'lanhuong', '$2a$10$u0O2RLOcBKPDPIuiez0wdO7YlkjW0luiAmJs5GhA6mxQIvyIXyoBK', NULL, 'not apply this time after security', 'not apply this time after security', '2021-10-24 23:45:24', '2021-10-24 23:45:39', 'User', 1);
INSERT INTO `account` VALUES (15, 'Đoàn', 'Giang', NULL, 'mink.giang@gmail.com', 'zxcqwe123', '$2a$10$c4Un6g6hScjmpZ1LqMIxF.g52fCR.gryzyYQDWXTnXhHjnUUMKM0a', NULL, 'anonymous', 'anonymous', '2021-11-05 15:37:44', '2021-11-05 15:38:18', 'User', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Burgers', NULL, NULL, 'flaticon-hamburger', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (2, 'Chicken', NULL, NULL, 'flaticon-boiled', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (3, 'Drinks', NULL, NULL, 'flaticon-frappe', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (4, 'Coffee', NULL, NULL, 'flaticon-tea-cup', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `category` VALUES (5, 'Chicken Set', NULL, NULL, 'flaticon-boiled', NULL, NULL, NULL, NULL, NULL);

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
INSERT INTO `combo` VALUES (1, 'Bulgogi Burger Combo', 74000, 'combo_burger_g_th_ng_h_ng_update.jpg', '<p>- 01&nbsp;Bulgogi Burger</p><p>- 01 Pepsi (M)</p><p>- 01 Khoai Tây Chiên (French Fries) - M</p>', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `combo` VALUES (2, 'Combo Burger Tôm (Shrimp Burger Combo)', 77000, 'combo_burger_t_m_update.jpg', '<p>- 01 Burger Tôm (Shrimp&nbsp;Burger)</p>\r\n<p>- 01 Pepsi (M)</p>\r\n<p>- 01 Khoai Tây Chiên (French Fries) - M</p>', NULL, 'anonymous', NULL, '2021-11-23 20:43:12', NULL);
INSERT INTO `combo` VALUES (3, 'Combo Burger Gà Thượng Hạng (Premium Chicken Burger Combo)', 74000, 'combo_premium-chicken_4.png', '<p>- 01 Burger Gà Thượng Hạng (Premium Chicken&nbsp;Burger)</p>\r\n<p>- 01 Pepsi (M)</p>\r\n<p>- 01 Khoai Tây Chiên (French Fries) - M</p', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `combo` VALUES (4, 'Combo Burger Cá (Fish Burger Combo)', 64000, 'combo_burger_c__update.jpg', '<p>- 01 Burger Cá (Fish Burger)</p>\r\n<p>- 01 Pepsi (M)</p>\r\n<p>- 01 Khoai Tây Chiên (French Fries) - M</p>', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `combo` VALUES (5, 'Combo Burger Phô Mai (Cheese Burger Combo)', 64000, 'combo_burger_ph_mai_update.jpg', '<p>- 01 Burger Phô Mai&nbsp;(Cheese&nbsp;Burger)</p>\r\n<p>- 01 Pepsi (M)</p>\r\n<p>- 01 Khoai Tây Chiên (French Fries) - M</p>', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `combo` VALUES (6, 'Combo Burger Bò Teriyaki (Teriyaki Burger Combo)', 61000, 'combo-burger-app-2292x2292px_beef-teriyaki-burger.jpg', '<p>- 01 Burger Bò Teriyaki (Teriyaki Burger)</p>\r\n<p>- 01 Pepsi (M)</p>\r\n<p>- 01 Khoai Tây Chiên (French Fries) - M</p>', NULL, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order` VALUES (2, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order` VALUES (18, NULL, 1, NULL, 'Cửa Ông, Cẩm Phả, Quảng Ninh', 'Quảng Ninh', NULL, 'Cửa Ông', 9.0000, 'thêm đường vào ', 'minkgiang', 'minkgiang', '2021-11-02 16:32:33', '2021-11-02 16:32:33', NULL, NULL);
INSERT INTO `order` VALUES (23, NULL, 1, '0388299424', 'Cửa Ông, Cẩm Phả, Quảng Ninh', 'Hà Nội', 'Quận Cầu Giấy', 'Phường Nghĩa Tân', 34000.0000, 'đường', 'anonymous', 'anonymous', '2021-11-04 22:09:42', '2021-11-04 22:09:42', NULL, NULL);
INSERT INTO `order` VALUES (24, NULL, 1, '0388299424', 'Cửa Ông, Cẩm Phả, Quảng Ninh', 'Hà Nội', 'Quận Cầu Giấy', 'Phường Quan Hoa', 102000.0000, '', 'anonymous', 'anonymous', '2021-11-04 22:13:48', '2021-11-04 22:13:48', NULL, NULL);
INSERT INTO `order` VALUES (25, NULL, 1, '0388299424', 'Cửa Ông, Cẩm Phả, Quảng Ninh', 'Hà Nội', 'Quận Ba Đình', 'Phường Ngọc Khánh', 102000.0000, '', 'minkgiang', 'minkgiang', '2021-11-04 22:16:21', '2021-11-04 22:16:21', NULL, NULL);
INSERT INTO `order` VALUES (26, NULL, 1, '0388299424', 'Cửa Ông, Cẩm Phả, Quảng Ninh', 'Hà Nội', 'Quận Đống Đa', 'Phường Quang Trung', 102000.0000, '', 'minkgiang', 'minkgiang', '2021-11-04 22:23:30', '2021-11-04 22:23:30', NULL, NULL);
INSERT INTO `order` VALUES (27, NULL, 15, '0388299424', 'Cửa Ông, Cẩm Phả, Quảng Ninh', 'Hà Nội', 'Quận Đống Đa', 'Phường Ngã Tư Sở', 102000.0000, 'thêm tương ớt', 'anonymous', 'anonymous', '2021-11-05 15:40:19', '2021-11-05 15:40:19', NULL, NULL);
INSERT INTO `order` VALUES (28, NULL, 1, '0388299424', 'Cửa Ông, Cẩm Phả, Quảng Ninh', 'Hà Nội', 'Huyện Đan Phượng', 'Xã Thọ Xuân', 190000.0000, '', 'anonymous', 'anonymous', '2021-11-15 14:54:07', '2021-11-15 14:54:07', NULL, NULL);
INSERT INTO `order` VALUES (29, NULL, 1, '0388299424', 'quan hoa cau giay', 'Hà Nội', 'Quận Cầu Giấy', 'Phường Quan Hoa', 190000.0000, 'them ti muoi avop', 'anonymous', 'anonymous', '2021-11-23 20:43:12', '2021-11-23 20:43:12', NULL, NULL);
INSERT INTO `order` VALUES (30, NULL, 1, '0388299424', 'quan hoa cau giay ha noi', 'Hà Nội', 'Quận Cầu Giấy', 'Phường Quan Hoa', 190000.0000, 'asdasdasd', 'anonymous', 'anonymous', '2021-11-23 20:59:40', '2021-11-23 20:59:40', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (31, 23, 7, NULL, NULL, 1, 'anonymous', 'anonymous', '2021-11-04 22:09:42', '2021-11-04 22:09:42', NULL);
INSERT INTO `orderdetail` VALUES (32, 24, 7, NULL, NULL, 3, 'anonymous', 'anonymous', '2021-11-04 22:13:49', '2021-11-04 22:13:49', NULL);
INSERT INTO `orderdetail` VALUES (33, 25, 7, NULL, NULL, 3, 'minkgiang', 'minkgiang', '2021-11-04 22:16:21', '2021-11-04 22:16:21', NULL);
INSERT INTO `orderdetail` VALUES (34, 27, 7, NULL, NULL, 3, 'anonymous', 'anonymous', '2021-11-05 15:40:19', '2021-11-05 15:40:19', NULL);
INSERT INTO `orderdetail` VALUES (35, 28, 14, NULL, NULL, 1, 'anonymous', 'anonymous', '2021-11-15 14:54:07', '2021-11-15 14:54:07', NULL);
INSERT INTO `orderdetail` VALUES (36, 28, 6, NULL, NULL, 1, 'anonymous', 'anonymous', '2021-11-15 14:54:07', '2021-11-15 14:54:07', NULL);
INSERT INTO `orderdetail` VALUES (37, 28, 3, NULL, NULL, 1, 'anonymous', 'anonymous', '2021-11-15 14:54:07', '2021-11-15 14:54:07', NULL);
INSERT INTO `orderdetail` VALUES (38, 28, NULL, 2, NULL, 1, 'anonymous', 'anonymous', '2021-11-15 14:54:07', '2021-11-15 14:54:07', NULL);
INSERT INTO `orderdetail` VALUES (39, 29, 14, NULL, NULL, 1, 'anonymous', 'anonymous', '2021-11-23 20:43:12', '2021-11-23 20:43:12', NULL);
INSERT INTO `orderdetail` VALUES (40, 29, 6, NULL, NULL, 1, 'anonymous', 'anonymous', '2021-11-23 20:43:12', '2021-11-23 20:43:12', NULL);
INSERT INTO `orderdetail` VALUES (41, 29, 3, NULL, NULL, 1, 'anonymous', 'anonymous', '2021-11-23 20:43:12', '2021-11-23 20:43:12', NULL);
INSERT INTO `orderdetail` VALUES (42, 29, NULL, 2, NULL, 1, 'anonymous', 'anonymous', '2021-11-23 20:43:12', '2021-11-23 20:43:12', NULL);
INSERT INTO `orderdetail` VALUES (43, 30, 14, NULL, NULL, 1, 'anonymous', 'anonymous', '2021-11-23 20:59:40', '2021-11-23 20:59:40', NULL);
INSERT INTO `orderdetail` VALUES (44, 30, 6, NULL, NULL, 1, 'anonymous', 'anonymous', '2021-11-23 20:59:40', '2021-11-23 20:59:40', NULL);
INSERT INTO `orderdetail` VALUES (45, 30, 3, NULL, NULL, 1, 'anonymous', 'anonymous', '2021-11-23 20:59:40', '2021-11-23 20:59:40', NULL);
INSERT INTO `orderdetail` VALUES (46, 30, NULL, 2, NULL, 1, 'anonymous', 'anonymous', '2021-11-23 20:59:40', '2021-11-23 20:59:40', NULL);

-- ----------------------------
-- Table structure for prod_comb_desc
-- ----------------------------
DROP TABLE IF EXISTS `prod_comb_desc`;
CREATE TABLE `prod_comb_desc`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NULL DEFAULT 0,
  `short_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `list_index` int NULL DEFAULT NULL,
  `lang` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `item_id_prod` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_item_id_product`(`item_id_prod`) USING BTREE,
  INDEX `fk_item_id_comb`(`item_id`) USING BTREE,
  CONSTRAINT `fk_item_id_comb` FOREIGN KEY (`item_id`) REFERENCES `combo` (`ComboID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_item_id_product` FOREIGN KEY (`item_id_prod`) REFERENCES `product` (`ProductID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prod_comb_desc
-- ----------------------------
INSERT INTO `prod_comb_desc` VALUES (1, 1, NULL, '01 Bulgogi Burger', 0, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (5, 1, NULL, '01 Pepsi (M)', 1, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (6, 1, NULL, '01 Khoai Tây Chiên (French Fries) - M', 2, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (7, 2, NULL, '01 Burger Tôm (Shrimp Burger)', 0, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (8, 2, NULL, '01 Pepsi (M)', 1, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (9, 2, NULL, '01 Khoai Tây Chiên (French Fries) - M', 2, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (10, 3, NULL, '01 Burger Gà Thượng Hạng (Premium Chicken Burger)', 0, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (11, 3, NULL, '01 Pepsi (M)', 1, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (12, 3, NULL, '01 Khoai Tây Chiên (French Fries) - M', 2, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (13, 4, NULL, '01 Burger Cá (Fish Burger)', 0, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (14, 4, NULL, '01 Pepsi (M)', 1, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (15, 4, NULL, '01 Khoai Tây Chiên (French Fries) - M', 2, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (16, 5, NULL, '01 Burger Phô Mai (Cheese Burger)', 0, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (17, 5, NULL, '01 Pepsi (M)', 1, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (18, 5, NULL, '01 Khoai Tây Chiên (French Fries) - M', 2, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (19, 6, NULL, '01 Burger Bò Teriyaki (Teriyaki Burger)', 0, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (20, 6, NULL, '01 Pepsi (M)', 1, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (21, 6, NULL, '01 Khoai Tây Chiên (French Fries) - M', 2, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (22, 1, 'Bulbogi lạ, thú vị', NULL, 3, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (23, 2, 'Combo có \"hải sản\"', NULL, 3, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (24, 3, 'Combo gà thượng hạng giòn tan đến mọi người', NULL, 3, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (25, 4, 'Burger nay có cả cá !!!', NULL, 3, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (26, 5, 'Combo có thêm tôm giòn thơm ngon', NULL, 3, 'vi', 'Comb_Desc', NULL);
INSERT INTO `prod_comb_desc` VALUES (30, NULL, NULL, '02 miếng Gà Rán (Fried Chicken - 2 Pcs)', 0, 'vi', 'Prod_Desc', 22);
INSERT INTO `prod_comb_desc` VALUES (31, NULL, NULL, '01 Khoai Tây Chiên - S (French Fries - S)', 1, 'vi', 'Prod_Desc', 22);
INSERT INTO `prod_comb_desc` VALUES (32, NULL, NULL, '01 Pepsi (M)', 2, 'vi', 'Prod_Desc', 22);
INSERT INTO `prod_comb_desc` VALUES (33, NULL, NULL, '02 miếng Gà Nướng (Grilled Chicken - 2 Pcs)', 0, 'vi', 'Prod_Desc', 23);
INSERT INTO `prod_comb_desc` VALUES (34, NULL, NULL, '01 Khoai Tây Chiên - S (French Fries - S)', 1, 'vi', 'Prod_Desc', 23);
INSERT INTO `prod_comb_desc` VALUES (35, NULL, NULL, '01 Pepsi (M)', 2, 'vi', 'Prod_Desc', 23);
INSERT INTO `prod_comb_desc` VALUES (36, NULL, NULL, '02 miếng Gà Sốt Phô Mai (Cheese Chicken - 2 Pcs)', 0, 'vi', 'Prod_Desc', 24);
INSERT INTO `prod_comb_desc` VALUES (37, NULL, NULL, '01 Khoai Tây Chiên - S (French Fries - S)', 1, 'vi', 'Prod_Desc', 24);
INSERT INTO `prod_comb_desc` VALUES (38, NULL, NULL, '01 Pepsi (M)', 2, 'vi', 'Prod_Desc', 24);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Gà Rán - 1 miếng (Fried Chicken -1 PC)', NULL, 'z1921445934290_1a09a8072d9fa62189c5cdea0b83d2ff.jpg', NULL, 2, 36000.0000, 0, 'minkgiang', NULL, '2021-10-04 23:07:32', NULL, NULL);
INSERT INTO `product` VALUES (2, 'Gà Sốt Phô Mai - 1 miếng (Cheese Chicken - 1 PC)', NULL, 'z1921445934290_1a09a8072d9fa62189c5cdea0b83d2ff.jpg', NULL, 2, 38000.0000, 3, 'minkgiang', NULL, '2021-10-05 23:07:36', NULL, NULL);
INSERT INTO `product` VALUES (3, 'Gà nướng - 1 miếng (Grilled Chicken - 1 PC)', NULL, 'g_n_ng_1_mi_ng_s_t_hs_s_t_cay.jpg', NULL, 2, 38000.0000, 1, 'minkgiang', 'anonymous', '2021-10-06 23:07:40', '2021-11-23 20:43:12', NULL);
INSERT INTO `product` VALUES (4, 'Gà nướng góc tư (Chicken Quater Leg)', NULL, 'g_g_c_t_.png', NULL, 2, 49000.0000, 1, 'minkgiang', NULL, '2021-10-06 23:07:40', NULL, NULL);
INSERT INTO `product` VALUES (5, 'Gà Rán - 3 miếng (Fried Chicken - 3 Pcs)', NULL, 'g_r_n_3_6_9_mi_ng.jpg', NULL, 2, 99000.0000, 0, 'minkgiang', NULL, '2021-10-04 23:07:32', NULL, NULL);
INSERT INTO `product` VALUES (6, 'Burger Bò Teriyaki (Teriyaki Burger)', NULL, 'image1.jpg', NULL, 1, 31000.0000, 0, 'minkgiang', 'anonymous', '2021-10-04 23:07:32', '2021-11-23 20:43:12', NULL);
INSERT INTO `product` VALUES (7, 'Burger Phô Mai (Burger Cheese)', NULL, 'burger_cheese_10.png', NULL, 1, 34000.0000, NULL, 'minkgiang', NULL, '2021-10-04 23:07:32', NULL, NULL);
INSERT INTO `product` VALUES (8, 'Burger Cá (Fish Burger)', NULL, 'burger_fish_5.png', NULL, 1, 34000.0000, NULL, 'minkgiang', NULL, '2021-10-04 23:07:32', NULL, NULL);
INSERT INTO `product` VALUES (9, 'Burger Gà Thượng Hạng (Premium Chicken Burger)', NULL, 'image3.jpg', NULL, 1, 44000.0000, NULL, 'minkgiang', NULL, '2021-10-04 23:07:32', NULL, NULL);
INSERT INTO `product` VALUES (10, 'Pepsi (M)', NULL, 'pepsi_m_l_1__update_1.jpg', NULL, 3, 14000.0000, NULL, 'minkgiang', NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (11, 'Mirinda (M)', NULL, 'mirinda_m_l__update.jpg', NULL, 3, 14000.0000, NULL, 'minkgiang', NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (12, '7 UP (M)', NULL, '7_up_m_.jpg', NULL, 3, 14000.0000, NULL, 'minkgiang', NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (13, 'Burger Bulgogi', NULL, 'image4.jpg', NULL, 1, 44000.0000, NULL, 'minkgiang', NULL, '2021-10-04 23:07:32', NULL, NULL);
INSERT INTO `product` VALUES (14, 'Burger Bò Trứng', NULL, 'image2.jpg', NULL, 1, 44000.0000, NULL, 'minkgiang', 'anonymous', '2021-10-04 23:07:32', '2021-11-23 20:43:12', NULL);
INSERT INTO `product` VALUES (15, 'Burger Tôm', NULL, 'burgers-app-2292x2292pxpx_shrimp-burger_1.jpg', NULL, 1, 47000.0000, NULL, 'minkgiang', NULL, '2021-10-04 23:07:32', NULL, NULL);
INSERT INTO `product` VALUES (16, 'Burger Mozzarella', NULL, 'image3.jpg', NULL, 1, 60000.0000, NULL, 'minkgiang', NULL, '2021-10-04 23:07:32', NULL, NULL);
INSERT INTO `product` VALUES (17, 'Burger Jumbo', NULL, 'image1.jpg', NULL, 1, 60000.0000, NULL, 'minkgiang', NULL, '2021-10-04 23:07:32', NULL, NULL);
INSERT INTO `product` VALUES (18, 'Pepsi không Calories vị chanh (Pepsi Zero Calories)', NULL, 'z2054228259338_f983ac7b886fccbe1772ccc551532ca2_1.jpg', NULL, 3, 18000.0000, NULL, 'minkgiang', NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (19, 'Tornado Yogurt Strawberry', NULL, 'drink-app-2292x2292px_tornado-strawberryyogurt.jpg', NULL, 3, 25000.0000, NULL, 'minkgiang', NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (20, 'Nestea', NULL, 'drink-app-2292x2292px_fruittea.jpg', NULL, 3, 18000.0000, NULL, 'minkgiang', NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (21, '7 Up Cherry', NULL, 'drink-app-2292x2292px_7upcherry.jpg', NULL, 3, 25000.0000, NULL, 'minkgiang', NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (22, 'Gà Rán Phần (Fried Chicken Set)', NULL, 'chickenset-app-2292x2292px_friedchicken-set.jpg', NULL, 5, 83000.0000, NULL, 'minkgiang', NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (23, 'Gà nướng phần (Grilled Chicken Set)', NULL, 'chickenset-app-2292x2292px_grilled-set.jpg', NULL, 5, 87000.0000, NULL, 'minkgiang', NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (24, 'Gà Sốt Phô Mai Phần (Cheese Chicken Set)', NULL, 'chickenset-app-2292x2292px_cheese-set.jpg', NULL, 5, 87000.0000, NULL, 'minkgiang', NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (57, '1cb0b80a-cc48-45d0-9e3f-8d21fe68d36f', 1, '2021-11-14 22:04:55', 'RefreshToken');
INSERT INTO `token` VALUES (58, '1bac48b3-4711-46db-bc82-65c06179f349', 1, '2021-11-14 22:06:01', 'RefreshToken');
INSERT INTO `token` VALUES (59, 'f195d05f-264d-4feb-9e5c-2921cef12e58', 1, '2021-11-14 22:09:12', 'RefreshToken');
INSERT INTO `token` VALUES (60, 'eb9d0e13-445d-4de1-9f23-983486a1608c', 1, '2021-11-14 22:13:00', 'RefreshToken');
INSERT INTO `token` VALUES (61, '54b74326-a2de-4fc1-8bac-3e2827dea83c', 1, '2021-11-14 22:13:24', 'RefreshToken');
INSERT INTO `token` VALUES (62, 'f49d0dd7-ef78-4438-8569-98e3272d28f3', 1, '2021-11-14 22:15:51', 'RefreshToken');
INSERT INTO `token` VALUES (65, '3f80bce4-f25a-47d3-8fad-5dce7e18b6c2', 15, '2021-11-15 15:38:39', 'RefreshToken');
INSERT INTO `token` VALUES (66, '14059c3e-09bf-4bd8-bb79-8454846fb0db', 1, '2021-11-17 00:48:22', 'RefreshToken');
INSERT INTO `token` VALUES (67, 'bac79d46-34cf-4abc-a884-6c94a42430ac', 1, '2021-11-19 10:23:01', 'RefreshToken');
INSERT INTO `token` VALUES (68, 'fd67e890-7b9d-4bab-90de-954b7da1bef7', 1, '2021-11-25 13:13:11', 'RefreshToken');
INSERT INTO `token` VALUES (69, '7d255437-5504-4d48-abe9-30765f2dba4e', 1, '2021-11-25 14:53:52', 'RefreshToken');

SET FOREIGN_KEY_CHECKS = 1;
