/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50022
 Source Host           : localhost:3306
 Source Schema         : xianshop

 Target Server Type    : MySQL
 Target Server Version : 50022
 File Encoding         : 65001

 Date: 07/07/2019 16:00:54
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
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 'mi ad', '家具', 645.84, 200, 'ueD9&pzV&h');
INSERT INTO `goods` VALUES (2, 'Duis Morbi', '化妆品', 121.39, 233, 'L8sYl^!6U2');
INSERT INTO `goods` VALUES (3, 'massa mattis lorem', '健身器材', 437.42, 586, 'yW.~f))V');
INSERT INTO `goods` VALUES (4, 'libero porttitor', '服装', 971.00, 340, 'sKo-vDC(L2');
INSERT INTO `goods` VALUES (5, 'parturient', '健身器材', 97.15, 327, '6oGW9dcyn');
INSERT INTO `goods` VALUES (6, 'Suspendisse Nunc', '健身器材', 606.10, 762, 'z+Q7d{.1=g');
INSERT INTO `goods` VALUES (7, 'Curabitur', '健身器材', 583.77, 974, 'J%fQ$s^HD:');
INSERT INTO `goods` VALUES (8, 'Curae', '家具', 589.49, 862, '[T9}*J~iR{');
INSERT INTO `goods` VALUES (9, 'quam Ut ad', '家具', 668.77, 114, 'CYcJOA8Y+');
INSERT INTO `goods` VALUES (10, 'nunc', '食品', 586.25, 439, '%R5kX^it(B');
INSERT INTO `goods` VALUES (11, 'sit', '服装', 778.32, 829, '.ZW?i[>jv.');
INSERT INTO `goods` VALUES (12, 'Aliquam', '电子产品', 568.63, 965, '&$HQsXws?t');
INSERT INTO `goods` VALUES (13, 'pulvinar', '家具', 594.81, 965, 'H 4S)d%5MD');
INSERT INTO `goods` VALUES (14, 'dis', '健身器材', 418.21, 945, 'L^:ue*VWuU');
INSERT INTO `goods` VALUES (15, 'sociis', '家具', 459.80, 362, 'P}*Brc.$([');
INSERT INTO `goods` VALUES (16, 'aliquam', '化妆品', 943.32, 526, 'm*9]~U~mFj');
INSERT INTO `goods` VALUES (17, 'elementum', '服装', 147.34, 279, ';V3X;P&%[J');
INSERT INTO `goods` VALUES (18, 'viverra', '健身器材', 677.60, 808, 'mzB3B8N**Z');
INSERT INTO `goods` VALUES (19, 'Aliquam', '电子产品', 535.85, 367, 'UkO)op+=-U');
INSERT INTO `goods` VALUES (20, 'lacus', '食品', 629.19, 317, '31rCXTQF65');
INSERT INTO `goods` VALUES (21, 'diam', '化妆品', 834.82, 885, 'l]s(?/E)}F');
INSERT INTO `goods` VALUES (22, 'lectus', '服装', 798.81, 782, '2rYt?eayCk');
INSERT INTO `goods` VALUES (23, 'accumsan', '服装', 656.78, 999, 'd_i?7l8}mJ');
INSERT INTO `goods` VALUES (24, 'Suspendisse', '化妆品', 776.18, 366, '}>2YDZxW/^');
INSERT INTO `goods` VALUES (25, 'ultricies', '电子产品', 872.91, 691, 'OpYi}Y`2w6');
INSERT INTO `goods` VALUES (26, 'rutrum', '化妆品', 839.31, 293, '<d$r/2>Uf)');
INSERT INTO `goods` VALUES (27, 'commodo', '健身器材', 343.01, 452, 'xunLH{F`i(');
INSERT INTO `goods` VALUES (28, 'laoreet', '健身器材', 877.71, 946, 'R Q5w]S_L4');
INSERT INTO `goods` VALUES (29, 'molestie', '家具', 217.80, 465, '<]%R.3nKIg');
INSERT INTO `goods` VALUES (30, 'Duis', '化妆品', 234.27, 820, '!Z4h{E}M$?');
INSERT INTO `goods` VALUES (31, 'eget', '服装', 359.27, 189, '1ef!%qU8b)');
INSERT INTO `goods` VALUES (32, 'mauris', '服装', 316.50, 152, 'P&^B#2>^_o');
INSERT INTO `goods` VALUES (33, 'Duis', '化妆品', 863.37, 787, 'JBsZBx#^`3');
INSERT INTO `goods` VALUES (34, 'torquent', '电子产品', 29.96, 159, 'T9TWDgB0Q^');
INSERT INTO `goods` VALUES (35, 'pede', '健身器材', 744.49, 231, '/meHn$]Rw_');
INSERT INTO `goods` VALUES (36, 'adipiscing', '服装', 321.44, 235, 'z=t9?/<)2^');
INSERT INTO `goods` VALUES (37, 'nibh', '家具', 536.18, 790, '7x9.*xj=C2');
INSERT INTO `goods` VALUES (38, 'sollicitudin', '化妆品', 975.98, 176, '}8[rMM8gnP');
INSERT INTO `goods` VALUES (39, 'massa', '电子产品', 511.27, 253, '.HZ~`Px6]k');
INSERT INTO `goods` VALUES (40, 'dictum', '食品', 809.22, 743, 'Dmfc^t?v((');
INSERT INTO `goods` VALUES (41, 'vestibulum', '化妆品', 734.95, 554, 'nf<5oTuj`S');
INSERT INTO `goods` VALUES (42, 'adipiscing', '家具', 354.68, 316, 'RTbc4v~E>');
INSERT INTO `goods` VALUES (43, 'imperdiet', '电子产品', 326.52, 570, 'NmHZ$Xjc?x');
INSERT INTO `goods` VALUES (44, 'consectetuer', '食品', 458.10, 502, 'q=5t xv#H');
INSERT INTO `goods` VALUES (45, 'lacinia', '电子产品', 761.49, 521, 'Cy`uLSl{6');
INSERT INTO `goods` VALUES (46, 'convallis', '食品', 178.99, 209, ';`u/rc.: 7');
INSERT INTO `goods` VALUES (47, 'a', '健身器材', 410.67, 966, 'm!G3^maeYJ');
INSERT INTO `goods` VALUES (48, 'Cum', '服装', 983.81, 233, '?e qDSYyUN');
INSERT INTO `goods` VALUES (49, 'Donec', '食品', 466.80, 646, 'cgs}<k -c2');
INSERT INTO `goods` VALUES (50, 'sed', '服装', 611.72, 893, 'Ao+o<T-20o');
INSERT INTO `goods` VALUES (51, 'pulvinar', '化妆品', 315.01, 838, '8ql:o5!R$*');
INSERT INTO `goods` VALUES (52, 'nunc', '电子产品', 488.16, 820, '=mO;]NNESj');
INSERT INTO `goods` VALUES (53, 'elit', '服装', 695.68, 441, 'A`owM)5Rrf');
INSERT INTO `goods` VALUES (54, 'torquent', '化妆品', 994.01, 329, 'aZG/4X_=q.');
INSERT INTO `goods` VALUES (55, 'tempor', '电子产品', 916.66, 643, '>x@z[j}k^d');
INSERT INTO `goods` VALUES (56, 'ipsum', '电子产品', 736.29, 985, 'd.d=0sq7Yu');
INSERT INTO `goods` VALUES (57, 'congue', '化妆品', 849.27, 670, 'ID)^]JfsmJ');
INSERT INTO `goods` VALUES (58, 'facilisis', '家具', 715.87, 356, '35S}s3fQtP');
INSERT INTO `goods` VALUES (59, 'parturient', '化妆品', 278.93, 939, 'EM$w[(W*dx');
INSERT INTO `goods` VALUES (60, 'vehicula', '电子产品', 705.50, 598, ']`;{U7ocs4');
INSERT INTO `goods` VALUES (61, 'metus', '健身器材', 853.38, 776, 'J^hJCoZ&)y');
INSERT INTO `goods` VALUES (62, 'fermentum', '化妆品', 135.52, 968, '<_#W4[8H$D');
INSERT INTO `goods` VALUES (63, 'risus', '电子产品', 126.89, 274, 'X?+=4t*LB ');
INSERT INTO `goods` VALUES (64, 'Duis', '化妆品', 54.11, 374, 'Nj_e~d!t?K');
INSERT INTO `goods` VALUES (65, 'Cras', '化妆品', 996.90, 171, 'RDiS)hSYe;');
INSERT INTO `goods` VALUES (66, 'varius', '服装', 745.29, 649, 'V2dVGJ{:`W');
INSERT INTO `goods` VALUES (67, 'vitae', '家具', 396.30, 695, '[T^JIo5JB)');
INSERT INTO `goods` VALUES (68, 'quis', '电子产品', 692.11, 460, '$#Ls3KN!&U');
INSERT INTO `goods` VALUES (69, 'ipsum', '电子产品', 660.23, 347, '{#Pb/ii):+');
INSERT INTO `goods` VALUES (70, 'pretium', '健身器材', 562.83, 181, 'D`QW~WP-Fm');
INSERT INTO `goods` VALUES (71, 'dolor', '健身器材', 72.67, 202, '2&>ruUnc U');
INSERT INTO `goods` VALUES (72, 'mattis', '电子产品', 450.20, 837, 'J)@X}c.*mg');
INSERT INTO `goods` VALUES (73, 'sociis', '健身器材', 852.19, 209, 'KNvgD1P]a=');
INSERT INTO `goods` VALUES (74, 'lectus', '家具', 812.72, 644, '6tGh;?]O]<');
INSERT INTO `goods` VALUES (75, 'auctor', '家具', 879.61, 456, 'veo/eTdT?0');
INSERT INTO `goods` VALUES (76, 'ac', '健身器材', 876.06, 318, 'E LizJ$lW=');
INSERT INTO `goods` VALUES (77, 'magna', '家具', 283.46, 890, '%tA#?x1/Ej');
INSERT INTO `goods` VALUES (78, 'pretium', '家具', 102.82, 390, 'tTi04( RB');
INSERT INTO `goods` VALUES (79, 'diam', '食品', 4.04, 851, 'uClfV^QJ^.');
INSERT INTO `goods` VALUES (80, 'pharetra', '服装', 29.22, 396, '!C-@V]xEm-');
INSERT INTO `goods` VALUES (81, 'lorem', '服装', 783.13, 367, '8*ml]Zbs(a');
INSERT INTO `goods` VALUES (82, 'habitant', '食品', 779.59, 406, 'brKa[R0&@x');
INSERT INTO `goods` VALUES (83, 'augue', '健身器材', 370.40, 769, ' sj6#F#cX!');
INSERT INTO `goods` VALUES (84, 'Duis', '健身器材', 401.30, 503, '=9h$F_#x<');
INSERT INTO `goods` VALUES (85, 'conubia', '化妆品', 330.95, 639, 'Db%6W`(`]m');
INSERT INTO `goods` VALUES (86, 'malesuada', '电子产品', 269.71, 992, '=+u~2544<*');
INSERT INTO `goods` VALUES (87, 'eleifend', '健身器材', 645.82, 800, 'XL@5yu3<Kn');
INSERT INTO `goods` VALUES (88, 'penatibus', '健身器材', 165.59, 473, 'ZmFO3D`0[n');
INSERT INTO `goods` VALUES (89, 'dui', '家具', 530.64, 925, 'bX-[)~[Kb<');
INSERT INTO `goods` VALUES (90, 'metus', '服装', 99.76, 827, 'mo1Cbm-j_+');
INSERT INTO `goods` VALUES (91, 'morbi', '电子产品', 955.29, 189, '[Qg&pBC[$H');
INSERT INTO `goods` VALUES (92, 'fames', '食品', 95.79, 568, 'J+;nh2Psz');
INSERT INTO `goods` VALUES (93, 'justo', '服装', 602.25, 113, '[Xeo36}EC/');
INSERT INTO `goods` VALUES (94, 'neque', '化妆品', 125.89, 335, '/YtHRgQg)_');
INSERT INTO `goods` VALUES (95, 'sollicitudin', '电子产品', 377.69, 927, '@/f4k?r[1');
INSERT INTO `goods` VALUES (96, 'tincidunt', '化妆品', 792.94, 934, '5k0DdZFCF{');
INSERT INTO `goods` VALUES (97, 'Pellentesque', '健身器材', 250.38, 563, 'vX$;VZ zVw');
INSERT INTO `goods` VALUES (98, 'nec', '家具', 816.52, 793, ']lBB(Nl]+<');
INSERT INTO `goods` VALUES (99, 'mattis', '化妆品', 234.06, 284, 'RZL*+%8ueO');
INSERT INTO `goods` VALUES (100, 'ultricies', '家具', 195.22, 542, 'QAk+)k)rT_');
INSERT INTO `goods` VALUES (101, 'pellentesque', '化妆品', 470.55, 287, '?]TOBnZ@I?');
INSERT INTO `goods` VALUES (102, 'in', '服装', 768.16, 906, 'OT>583H-.g');
INSERT INTO `goods` VALUES (103, 'blandit', '食品', 681.98, 221, 'Qe?UhSlm`f');
INSERT INTO `goods` VALUES (104, 'dui', '健身器材', 591.94, 288, 'z~5Cxv25 .');
INSERT INTO `goods` VALUES (105, 'Duis', '食品', 956.06, 700, '{JVPCSsT*Z');
INSERT INTO `goods` VALUES (106, 'nibh', '健身器材', 703.50, 678, 'j_HRw?c4Ps');
INSERT INTO `goods` VALUES (107, 'eget', '食品', 835.54, 550, '=EJ. /Q[13');
INSERT INTO `goods` VALUES (108, 'senectus', '食品', 734.24, 800, 'D6G?&o/FV>');
INSERT INTO `goods` VALUES (109, 'dictum', '健身器材', 142.40, 183, '1h>j.d(s:r');
INSERT INTO `goods` VALUES (110, 'scelerisque', '电子产品', 754.30, 113, '(yPDSTQI@V');
INSERT INTO `goods` VALUES (111, 'natoque', '化妆品', 51.93, 126, '>@c6Jt!:cM');
INSERT INTO `goods` VALUES (112, 'ultricies', '健身器材', 626.95, 634, 's35?SDQRdc');
INSERT INTO `goods` VALUES (113, 'mus', '家具', 129.55, 438, 'l03h>`ddib');
INSERT INTO `goods` VALUES (114, 'dapibus', '电子产品', 264.22, 344, 'xg%?*v0g=R');
INSERT INTO `goods` VALUES (115, 'Phasellus', '电子产品', 660.62, 343, 'IH0mUbO>5&');
INSERT INTO `goods` VALUES (116, 'semper', '食品', 446.08, 576, 'pyy<}5Ls?');
INSERT INTO `goods` VALUES (117, 'senectus', '健身器材', 301.59, 183, '(y9-<eSG&b');
INSERT INTO `goods` VALUES (118, 'viverra', '服装', 426.55, 737, 'Cgl._9b_P^');
INSERT INTO `goods` VALUES (119, 'Curae', '健身器材', 514.86, 581, '3k7kpRoY(p');
INSERT INTO `goods` VALUES (120, 'pretium', '家具', 303.11, 913, 'Qtd<V<DH4.');
INSERT INTO `goods` VALUES (121, 'imperdiet', '电子产品', 29.32, 517, 'B.pyB[BTG4');
INSERT INTO `goods` VALUES (122, 'risus', '食品', 82.43, 565, 'mDwC/z}Cxp');
INSERT INTO `goods` VALUES (123, 'Ut', '服装', 593.00, 784, '23{}X;az');
INSERT INTO `goods` VALUES (124, 'sit', '化妆品', 876.66, 197, '/YLtH<u:&a');
INSERT INTO `goods` VALUES (125, 'inceptos', '电子产品', 355.31, 672, 'Pr3H2pB^ql');
INSERT INTO `goods` VALUES (126, 'eros', '健身器材', 586.93, 974, '.vbT:tt$!4');
INSERT INTO `goods` VALUES (127, 'fames', '食品', 512.89, 421, 'e1/$~RKj{6');
INSERT INTO `goods` VALUES (128, 'Donec', '家具', 351.05, 358, 'VG*Cf9=y%&');
INSERT INTO `goods` VALUES (129, 'blandit', '食品', 385.83, 679, '`kA1!<J!m#');

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
