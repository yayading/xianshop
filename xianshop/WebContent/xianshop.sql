/*
 Navicat Premium Data Transfer

 Source Server         : test1
 Source Server Type    : MySQL
 Source Server Version : 50022
 Source Host           : localhost:3306
 Source Schema         : xianshop

 Target Server Type    : MySQL
 Target Server Version : 50022
 File Encoding         : 65001

 Date: 07/07/2019 14:16:38
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
  PRIMARY KEY USING BTREE (`COLLECTID`),
  INDEX `GOODSID` USING BTREE(`GOODSID`),
  CONSTRAINT `collectors_ibfk_1` FOREIGN KEY (`GOODSID`) REFERENCES `goods` (`GOODSID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 3072 kB; (`GOODSID`) REFER `xianshop/goods`(`GOODSID`)' ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
