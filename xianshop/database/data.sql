/*
 Navicat Premium Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 50022
 Source Host           : localhost:3306
 Source Schema         : xianshop

 Target Server Type    : MySQL
 Target Server Version : 50022
 File Encoding         : 65001

 Date: 09/07/2019 11:31:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for collectors
-- ----------------------------
DROP TABLE IF EXISTS `collectors`;
CREATE TABLE `collectors`  (
  `COLLECTID` int(11) NOT NULL AUTO_INCREMENT,
  `COLLECTTIME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `CLASSIFY` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GOODSID` int(11) NOT NULL DEFAULT '',
  `USERID` int(11) NOT NULL DEFAULT '',
  PRIMARY KEY USING BTREE (`COLLECTID`),
  INDEX `GOODSID` USING BTREE(`GOODSID`),
  INDEX `USERID` USING BTREE(`USERID`),
  CONSTRAINT `collectors_ibfk_2` FOREIGN KEY (`USERID`) REFERENCES `users` (`USERID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `collectors_ibfk_1` FOREIGN KEY (`GOODSID`) REFERENCES `goods` (`GOODSID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 3072 kB; (`USERID`) REFER `xianshop/users`(`USERID`); (`GOODSID`) R' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `GOODSID` int(11) NOT NULL AUTO_INCREMENT,
  `GOODSNAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `GOODSTYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GOODSPRICE` decimal(10, 2) NOT NULL DEFAULT '',
  `GOODSNUMBER` int(11) NOT NULL DEFAULT '',
  `GOODSPIC` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`GOODSID`)
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 'mi ad', '家具', 645.84, 200, 'images/lproduct1.png');
INSERT INTO `goods` VALUES (2, 'Duis Morbi', '化妆品', 121.39, 233, 'images/lproduct2.png');
INSERT INTO `goods` VALUES (3, 'massa mattis lorem', '健身器材', 437.42, 586, 'images/lproduct3.png');
INSERT INTO `goods` VALUES (4, 'libero porttitor', '服装', 971.00, 340, 'images/lproduct4.png');
INSERT INTO `goods` VALUES (5, 'parturient', '健身器材', 97.15, 327, 'images/lproduct5.png');
INSERT INTO `goods` VALUES (6, 'Suspendisse Nunc', '健身器材', 606.10, 762, 'images/lproduct6.png');
INSERT INTO `goods` VALUES (7, 'Curabitur', '健身器材', 583.77, 974, 'images/lproduct7.png');
INSERT INTO `goods` VALUES (8, 'Curae', '家具', 589.49, 862, 'images/lproduct8.png');
INSERT INTO `goods` VALUES (9, 'quam Ut ad', '家具', 668.77, 114, 'images/lproduct9.png');
INSERT INTO `goods` VALUES (10, 'nunc', '食品', 586.25, 439, 'images/lproduct.png');
INSERT INTO `goods` VALUES (11, 'sit', '服装', 778.32, 829, 'images/lproduct1.png');
INSERT INTO `goods` VALUES (12, 'Aliquam', '电子产品', 568.63, 965, 'images/lproduct2.png');
INSERT INTO `goods` VALUES (13, 'pulvinar', '家具', 594.81, 965, 'images/lproduct3.png');
INSERT INTO `goods` VALUES (14, 'dis', '健身器材', 418.21, 945, 'images/lproduct4.png');
INSERT INTO `goods` VALUES (15, 'sociis', '家具', 459.80, 362, 'images/lproduct5.png');
INSERT INTO `goods` VALUES (16, 'aliquam', '化妆品', 943.32, 526, 'images/lproduct6.png');
INSERT INTO `goods` VALUES (17, 'elementum', '服装', 147.34, 279, 'images/lproduct7.png');
INSERT INTO `goods` VALUES (18, 'viverra', '健身器材', 677.60, 808, 'images/lproduct8.png');
INSERT INTO `goods` VALUES (19, 'Aliquam', '电子产品', 535.85, 367, 'images/lproduct9.png');
INSERT INTO `goods` VALUES (20, 'lacus', '食品', 629.19, 317, 'images/lproduct.png');
INSERT INTO `goods` VALUES (21, 'diam', '化妆品', 834.82, 885, 'images/lproduct1.png');
INSERT INTO `goods` VALUES (22, 'lectus', '服装', 798.81, 782, 'images/lproduct2.png');
INSERT INTO `goods` VALUES (23, 'accumsan', '服装', 656.78, 999, 'images/lproduct3.png');
INSERT INTO `goods` VALUES (24, 'Suspendisse', '化妆品', 776.18, 366, 'images/lproduct4.png');
INSERT INTO `goods` VALUES (25, 'ultricies', '电子产品', 872.91, 691, 'images/lproduct5.png');
INSERT INTO `goods` VALUES (26, 'rutrum', '化妆品', 839.31, 293, 'images/lproduct6.png');
INSERT INTO `goods` VALUES (27, 'commodo', '健身器材', 343.01, 452, 'images/lproduct7.png');
INSERT INTO `goods` VALUES (28, 'laoreet', '健身器材', 877.71, 946, 'images/lproduct8.png');
INSERT INTO `goods` VALUES (29, 'molestie', '家具', 217.80, 465, 'images/lproduct9.png');
INSERT INTO `goods` VALUES (30, 'Duis', '化妆品', 234.27, 820, 'images/lproduct.png');
INSERT INTO `goods` VALUES (31, 'eget', '服装', 359.27, 189, 'images/lproduct1.png');
INSERT INTO `goods` VALUES (32, 'mauris', '服装', 316.50, 152, 'images/lproduct2.png');
INSERT INTO `goods` VALUES (33, 'Duis', '化妆品', 863.37, 787, 'images/lproduct3.png');
INSERT INTO `goods` VALUES (34, 'torquent', '电子产品', 29.96, 159, 'images/lproduct4.png');
INSERT INTO `goods` VALUES (35, 'pede', '健身器材', 744.49, 231, 'images/lproduct5.png');
INSERT INTO `goods` VALUES (36, 'adipiscing', '服装', 321.44, 235, 'images/lproduct6.png');
INSERT INTO `goods` VALUES (37, 'nibh', '家具', 536.18, 790, 'images/lproduct7.png');
INSERT INTO `goods` VALUES (38, 'sollicitudin', '化妆品', 975.98, 176, 'images/lproduct8.png');
INSERT INTO `goods` VALUES (39, 'massa', '电子产品', 511.27, 253, 'images/lproduct9.png');
INSERT INTO `goods` VALUES (40, 'dictum', '食品', 809.22, 743, 'images/lproduct.png');
INSERT INTO `goods` VALUES (41, 'vestibulum', '化妆品', 734.95, 554, 'images/lproduct1.png');
INSERT INTO `goods` VALUES (42, 'adipiscing', '家具', 354.68, 316, 'images/lproduct2.png');
INSERT INTO `goods` VALUES (43, 'imperdiet', '电子产品', 326.52, 570, 'images/lproduct3.png');
INSERT INTO `goods` VALUES (44, 'consectetuer', '食品', 458.10, 502, 'images/lproduct4.png');
INSERT INTO `goods` VALUES (45, 'lacinia', '电子产品', 761.49, 521, 'images/lproduct5.png');
INSERT INTO `goods` VALUES (46, 'convallis', '食品', 178.99, 209, 'images/lproduct6.png');
INSERT INTO `goods` VALUES (47, 'a', '健身器材', 410.67, 966, 'images/lproduct7.png');
INSERT INTO `goods` VALUES (48, 'Cum', '服装', 983.81, 233, 'images/lproduct8.png');
INSERT INTO `goods` VALUES (49, 'Donec', '食品', 466.80, 646, 'images/lproduct9.png');
INSERT INTO `goods` VALUES (50, 'sed', '服装', 611.72, 893, 'images/lproduct.png');
INSERT INTO `goods` VALUES (51, 'pulvinar', '化妆品', 315.01, 838, 'images/lproduct1.png');
INSERT INTO `goods` VALUES (52, 'nunc', '电子产品', 488.16, 820, 'images/lproduct2.png');
INSERT INTO `goods` VALUES (53, 'elit', '服装', 695.68, 441, 'images/lproduct3.png');
INSERT INTO `goods` VALUES (54, 'torquent', '化妆品', 994.01, 329, 'images/lproduct4.png');
INSERT INTO `goods` VALUES (55, 'tempor', '电子产品', 916.66, 643, 'images/lproduct5.png');
INSERT INTO `goods` VALUES (56, 'ipsum', '电子产品', 736.29, 985, 'images/lproduct6.png');
INSERT INTO `goods` VALUES (57, 'congue', '化妆品', 849.27, 670, 'images/lproduct7.png');
INSERT INTO `goods` VALUES (58, 'facilisis', '家具', 715.87, 356, 'images/lproduct8.png');
INSERT INTO `goods` VALUES (59, 'parturient', '化妆品', 278.93, 939, 'images/lproduct9.png');
INSERT INTO `goods` VALUES (60, 'vehicula', '电子产品', 705.50, 598, 'images/lproduct.png');
INSERT INTO `goods` VALUES (61, 'metus', '健身器材', 853.38, 776, 'images/lproduct1.png');
INSERT INTO `goods` VALUES (62, 'fermentum', '化妆品', 135.52, 968, 'images/lproduct2.png');
INSERT INTO `goods` VALUES (63, 'risus', '电子产品', 126.89, 274, 'images/lproduct3.png');
INSERT INTO `goods` VALUES (64, 'Duis', '化妆品', 54.11, 374, 'images/lproduct4.png');
INSERT INTO `goods` VALUES (65, 'Cras', '化妆品', 996.90, 171, 'images/lproduct5.png');
INSERT INTO `goods` VALUES (66, 'varius', '服装', 745.29, 649, 'images/lproduct6.png');
INSERT INTO `goods` VALUES (67, 'vitae', '家具', 396.30, 695, 'images/lproduct7.png');
INSERT INTO `goods` VALUES (68, 'quis', '电子产品', 692.11, 460, 'images/lproduct8.png');
INSERT INTO `goods` VALUES (69, 'ipsum', '电子产品', 660.23, 347, 'images/lproduct9.png');
INSERT INTO `goods` VALUES (70, 'pretium', '健身器材', 562.83, 181, 'images/lproduct.png');
INSERT INTO `goods` VALUES (71, 'dolor', '健身器材', 72.67, 202, 'images/lproduct1.png');
INSERT INTO `goods` VALUES (72, 'mattis', '电子产品', 450.20, 837, 'images/lproduct2.png');
INSERT INTO `goods` VALUES (73, 'sociis', '健身器材', 852.19, 209, 'images/lproduct3.png');
INSERT INTO `goods` VALUES (74, 'lectus', '家具', 812.72, 644, 'images/lproduct4.png');
INSERT INTO `goods` VALUES (75, 'auctor', '家具', 879.61, 456, 'images/lproduct5.png');
INSERT INTO `goods` VALUES (76, 'ac', '健身器材', 876.06, 318, 'images/lproduct6.png');
INSERT INTO `goods` VALUES (77, 'magna', '家具', 283.46, 890, 'images/lproduct7.png');
INSERT INTO `goods` VALUES (78, 'pretium', '家具', 102.82, 390, 'images/lproduct8.png');
INSERT INTO `goods` VALUES (79, 'diam', '食品', 4.04, 851, 'images/lproduct9.png');
INSERT INTO `goods` VALUES (80, 'pharetra', '服装', 29.22, 396, 'images/lproduct.png');
INSERT INTO `goods` VALUES (81, 'lorem', '服装', 783.13, 367, 'images/lproduct1.png');
INSERT INTO `goods` VALUES (82, 'habitant', '食品', 779.59, 406, 'images/lproduct2.png');
INSERT INTO `goods` VALUES (83, 'augue', '健身器材', 370.40, 769, 'images/lproduct3.png');
INSERT INTO `goods` VALUES (84, 'Duis', '健身器材', 401.30, 503, 'images/lproduct4.png');
INSERT INTO `goods` VALUES (85, 'conubia', '化妆品', 330.95, 639, 'images/lproduct5.png');
INSERT INTO `goods` VALUES (86, 'malesuada', '电子产品', 269.71, 992, 'images/lproduct6.png');
INSERT INTO `goods` VALUES (87, 'eleifend', '健身器材', 645.82, 800, 'images/lproduct7.png');
INSERT INTO `goods` VALUES (88, 'penatibus', '健身器材', 165.59, 473, 'images/lproduct8.png');
INSERT INTO `goods` VALUES (89, 'dui', '家具', 530.64, 925, 'images/lproduct9.png');
INSERT INTO `goods` VALUES (90, 'metus', '服装', 99.76, 827, 'images/lproduct.png');
INSERT INTO `goods` VALUES (91, 'morbi', '电子产品', 955.29, 189, 'images/lproduct1.png');
INSERT INTO `goods` VALUES (92, 'fames', '食品', 95.79, 568, 'images/lproduct2.png');
INSERT INTO `goods` VALUES (93, 'justo', '服装', 602.25, 113, 'images/lproduct3.png');
INSERT INTO `goods` VALUES (94, 'neque', '化妆品', 125.89, 335, 'images/lproduct4.png');
INSERT INTO `goods` VALUES (95, 'sollicitudin', '电子产品', 377.69, 927, 'images/lproduct5.png');
INSERT INTO `goods` VALUES (96, 'tincidunt', '化妆品', 792.94, 934, 'images/lproduct6.png');
INSERT INTO `goods` VALUES (97, 'Pellentesque', '健身器材', 250.38, 563, 'images/lproduct7.png');
INSERT INTO `goods` VALUES (98, 'nec', '家具', 816.52, 793, 'images/lproduct8.png');
INSERT INTO `goods` VALUES (99, 'mattis', '化妆品', 234.06, 284, 'images/lproduct9.png');
INSERT INTO `goods` VALUES (100, 'ultricies', '家具', 195.22, 542, 'images/lproduct.png');
INSERT INTO `goods` VALUES (101, 'pellentesque', '化妆品', 470.55, 287, 'images/lproduct1.png');
INSERT INTO `goods` VALUES (102, 'in', '服装', 768.16, 906, 'images/lproduct2.png');
INSERT INTO `goods` VALUES (103, 'blandit', '食品', 681.98, 221, 'images/lproduct3.png');
INSERT INTO `goods` VALUES (104, 'dui', '健身器材', 591.94, 288, 'images/lproduct4.png');
INSERT INTO `goods` VALUES (105, 'Duis', '食品', 956.06, 700, 'images/lproduct5.png');
INSERT INTO `goods` VALUES (106, 'nibh', '健身器材', 703.50, 678, 'images/lproduct6.png');
INSERT INTO `goods` VALUES (107, 'eget', '食品', 835.54, 550, 'images/lproduct7.png');
INSERT INTO `goods` VALUES (108, 'senectus', '食品', 734.24, 800, 'images/lproduct8.png');
INSERT INTO `goods` VALUES (109, 'dictum', '健身器材', 142.40, 183, 'images/lproduct9.png');
INSERT INTO `goods` VALUES (110, 'scelerisque', '电子产品', 754.30, 113, 'images/lproduct.png');
INSERT INTO `goods` VALUES (111, 'natoque', '化妆品', 51.93, 126, 'images/lproduct1.png');
INSERT INTO `goods` VALUES (112, 'ultricies', '健身器材', 626.95, 634, 'images/lproduct2.png');
INSERT INTO `goods` VALUES (113, 'mus', '家具', 129.55, 438, 'images/lproduct3.png');
INSERT INTO `goods` VALUES (114, 'dapibus', '电子产品', 264.22, 344, 'images/lproduct4.png');
INSERT INTO `goods` VALUES (115, 'Phasellus', '电子产品', 660.62, 343, 'images/lproduct5.png');
INSERT INTO `goods` VALUES (116, 'semper', '食品', 446.08, 576, 'images/lproduct6.png');
INSERT INTO `goods` VALUES (117, 'senectus', '健身器材', 301.59, 183, 'images/lproduct7.png');
INSERT INTO `goods` VALUES (118, 'viverra', '服装', 426.55, 737, 'images/lproduct8.png');
INSERT INTO `goods` VALUES (119, 'Curae', '健身器材', 514.86, 581, 'images/lproduct9.png');
INSERT INTO `goods` VALUES (120, 'pretium', '家具', 303.11, 913, 'images/lproduct.png');
INSERT INTO `goods` VALUES (121, 'imperdiet', '电子产品', 29.32, 517, 'images/lproduct1.png');
INSERT INTO `goods` VALUES (122, 'risus', '食品', 82.43, 565, 'images/lproduct2.png');
INSERT INTO `goods` VALUES (123, 'Ut', '服装', 593.00, 784, 'images/lproduct3.png');
INSERT INTO `goods` VALUES (124, 'sit', '化妆品', 876.66, 197, 'images/lproduct4.png');
INSERT INTO `goods` VALUES (125, 'inceptos', '电子产品', 355.31, 672, 'images/lproduct5.png');
INSERT INTO `goods` VALUES (126, 'eros', '健身器材', 586.93, 974, 'images/lproduct6.png');
INSERT INTO `goods` VALUES (127, 'fames', '食品', 512.89, 421, 'images/lproduct7.png');
INSERT INTO `goods` VALUES (128, 'Donec', '家具', 351.05, 358, 'images/lproduct8.png');
INSERT INTO `goods` VALUES (129, 'blandit', '食品', 385.83, 679, 'images/lproduct9.png');

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `ITEMID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEMNUMBER` int(11) NOT NULL DEFAULT '',
  `GOODSID` int(11) NOT NULL DEFAULT '',
  `ORDERID` int(11) NOT NULL DEFAULT '',
  PRIMARY KEY USING BTREE (`ITEMID`),
  INDEX `GOODSID` USING BTREE(`GOODSID`),
  INDEX `ORDERID` USING BTREE(`ORDERID`),
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`ORDERID`) REFERENCES `orders` (`ORDERID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`GOODSID`) REFERENCES `goods` (`GOODSID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 3072 kB; (`ORDERID`) REFER `xianshop/orders`(`ORDERID`); (`GOODSID`' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `ORDERID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDERDATE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ORDERSTATUS` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ADDRESS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `REMARKS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USERID` int(11) NOT NULL DEFAULT '',
  PRIMARY KEY USING BTREE (`ORDERID`),
  INDEX `USERID` USING BTREE(`USERID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `users` (`USERID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 3072 kB; (`USERID`) REFER `xianshop/users`(`USERID`)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shopcart
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart`  (
  `CARID` int(11) NOT NULL AUTO_INCREMENT,
  `CARNUMBER` int(11) NOT NULL DEFAULT '',
  `USERID` int(11) NOT NULL DEFAULT '',
  `GOODSID` int(11) NOT NULL DEFAULT '',
  PRIMARY KEY USING BTREE (`CARID`),
  INDEX `GOODSID` USING BTREE(`GOODSID`),
  INDEX `USERID` USING BTREE(`USERID`),
  CONSTRAINT `shopcart_ibfk_2` FOREIGN KEY (`USERID`) REFERENCES `users` (`USERID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shopcart_ibfk_1` FOREIGN KEY (`GOODSID`) REFERENCES `goods` (`GOODSID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 3072 kB; (`USERID`) REFER `xianshop/users`(`USERID`); (`GOODSID`) R' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `USERID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `PASSWORD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `NICHENG` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY USING BTREE (`USERID`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'a', 'a', 'a');
INSERT INTO `users` VALUES (2, 'b', 'b', 'b');
INSERT INTO `users` VALUES (3, 'c', 'c', 'c');
INSERT INTO `users` VALUES (4, 'd', 'd', 'd');

SET FOREIGN_KEY_CHECKS = 1;
