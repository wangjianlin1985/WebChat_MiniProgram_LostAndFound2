/*
 Navicat Premium Data Transfer

 Source Server         : mysql5.6
 Source Server Type    : MySQL
 Source Server Version : 50620
 Source Host           : localhost:3306
 Source Schema         : ershou_db

 Target Server Type    : MySQL
 Target Server Version : 50620
 File Encoding         : 65001

 Date: 10/10/2021 00:17:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for t_announce
-- ----------------------------
DROP TABLE IF EXISTS `t_announce`;
CREATE TABLE `t_announce`  (
  `announceId` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告编号',
  `announceTitle` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `announceContent` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告内容',
  `announceDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布日期',
  PRIMARY KEY (`announceId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_announce
-- ----------------------------
INSERT INTO `t_announce` VALUES (1, '失物招领平台上线', '同学们以后可以在小程序上面发布失物招领信息了！', '2020-03-11');
INSERT INTO `t_announce` VALUES (2, '这里还可以交友哦', '大家可以把自己不用的物品转给需要的同学，还可以成为好朋友', '2020-03-28');

-- ----------------------------
-- Table structure for t_areainfo
-- ----------------------------
DROP TABLE IF EXISTS `t_areainfo`;
CREATE TABLE `t_areainfo`  (
  `areaId` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `areaName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域名称',
  PRIMARY KEY (`areaId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_areainfo
-- ----------------------------
INSERT INTO `t_areainfo` VALUES (1, '南校区');
INSERT INTO `t_areainfo` VALUES (2, '北校区');
INSERT INTO `t_areainfo` VALUES (3, '本部');

-- ----------------------------
-- Table structure for t_leaveword
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword`  (
  `leaveWordId` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `leaveTitle` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `userObj` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言时间',
  `replyContent` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理回复',
  `replyTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`leaveWordId`) USING BTREE,
  INDEX `userObj`(`userObj`) USING BTREE,
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES (1, '111', '222', 'user1', '2020-03-26 17:03:41', '333', '2020-03-26 17:03:43');
INSERT INTO `t_leaveword` VALUES (2, '管理你好，问个问题', '我这发布的宝贝，他们怎么购买呢', '13688886666', '2020-03-27 20:58:21', '咱们这个是一个信息平台，你们可以电话联系，线下微信支付宝交易就行！', '2020-03-28 13:56:05');
INSERT INTO `t_leaveword` VALUES (3, 'aa', 'bb', '13688886666', '2020-03-27 20:58:21', '--', '--');

-- ----------------------------
-- Table structure for t_newoldlevel
-- ----------------------------
DROP TABLE IF EXISTS `t_newoldlevel`;
CREATE TABLE `t_newoldlevel`  (
  `levelId` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `levelName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新旧程度',
  PRIMARY KEY (`levelId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_newoldlevel
-- ----------------------------
INSERT INTO `t_newoldlevel` VALUES (1, '全新');
INSERT INTO `t_newoldlevel` VALUES (2, '9成新');
INSERT INTO `t_newoldlevel` VALUES (3, '8成新');

-- ----------------------------
-- Table structure for t_priceregion
-- ----------------------------
DROP TABLE IF EXISTS `t_priceregion`;
CREATE TABLE `t_priceregion`  (
  `regionId` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `regionName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '价格区间',
  PRIMARY KEY (`regionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_priceregion
-- ----------------------------
INSERT INTO `t_priceregion` VALUES (1, '0~500元');
INSERT INTO `t_priceregion` VALUES (2, '500~1000元');
INSERT INTO `t_priceregion` VALUES (3, '1000~2000元');
INSERT INTO `t_priceregion` VALUES (4, '2000~5000元');
INSERT INTO `t_priceregion` VALUES (5, '5000元以上');

-- ----------------------------
-- Table structure for t_productclass
-- ----------------------------
DROP TABLE IF EXISTS `t_productclass`;
CREATE TABLE `t_productclass`  (
  `productClassId` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别编号',
  `productClassName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`productClassId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_productclass
-- ----------------------------
INSERT INTO `t_productclass` VALUES (1, '电脑硬件');
INSERT INTO `t_productclass` VALUES (2, '手机数码');
INSERT INTO `t_productclass` VALUES (3, '图书书籍');
INSERT INTO `t_productclass` VALUES (4, '服装首饰');

-- ----------------------------
-- Table structure for t_productinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_productinfo`;
CREATE TABLE `t_productinfo`  (
  `productId` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `productClassObj` int(11) NOT NULL COMMENT '商品类别',
  `productName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `priceRegionObj` int(11) NOT NULL COMMENT '价格区域',
  `price` float NOT NULL COMMENT '商品价格',
  `newOldLevelObj` int(11) NOT NULL COMMENT '成色',
  `areaObj` int(11) NOT NULL COMMENT '区域',
  `productPhoto` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `connectPerson` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `connectPhone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `productDes` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品描述',
  `userObj` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `addTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`productId`) USING BTREE,
  INDEX `productClassObj`(`productClassObj`) USING BTREE,
  INDEX `priceRegionObj`(`priceRegionObj`) USING BTREE,
  INDEX `newOldLevelObj`(`newOldLevelObj`) USING BTREE,
  INDEX `areaObj`(`areaObj`) USING BTREE,
  INDEX `userObj`(`userObj`) USING BTREE,
  CONSTRAINT `t_productinfo_ibfk_1` FOREIGN KEY (`productClassObj`) REFERENCES `t_productclass` (`productClassId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_productinfo_ibfk_2` FOREIGN KEY (`priceRegionObj`) REFERENCES `t_priceregion` (`regionId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_productinfo_ibfk_3` FOREIGN KEY (`newOldLevelObj`) REFERENCES `t_newoldlevel` (`levelId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_productinfo_ibfk_4` FOREIGN KEY (`areaObj`) REFERENCES `t_areainfo` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_productinfo_ibfk_5` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_productinfo
-- ----------------------------
INSERT INTO `t_productinfo` VALUES (1, 2, '苹果5s手机', 2, 628, 1, 1, 'upload/1e99589e-7e88-4fc6-b1e3-1e3b5c8f979c.jpg', '李明涛', '13984830812', '二手苹果6s一部，128G内存，成色很新，刚用不到半年，不小心掉了，麻烦谁捡到了联系我！', 'user1', '2020-03-26 17:04:34');
INSERT INTO `t_productinfo` VALUES (2, 1, '二手戴尔台式机主机', 1, 350, 2, 1, 'upload/9789cb86-4aac-4b74-9699-2fef32056e5f.jpg', '王晓婷', '13985081234', '二代990机箱，G630处理器，4G内存，500G硬盘,H61主板，不小心掉了，麻烦联系我！', '13688886666', '2020-03-27 19:45:57');
INSERT INTO `t_productinfo` VALUES (3, 3, 'PHP基础案例教程', 1, 15, 1, 3, 'upload/e13c58df-d57e-4be3-8e5a-7cd0a966ca35.jpg', '李夏', '13082992342', '一本php网站开发的书籍，买来我都没怎么看，然后就掉图书馆了，谁看到了？', '13688886666', '2020-03-28 14:26:05');

-- ----------------------------
-- Table structure for t_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo`  (
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'user_name',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆密码',
  `realname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `bornDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户qq',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `myPhoto` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户头像',
  `memo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加信息',
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('13528731234', '--', '牵着蜗牛去逛街', '男', '2021-10-09', '', '', '', 'upload/3aa1c1d5-bcd0-479f-9445-bbb120a9bea4.jpg', '', 'oM7Mu5XyeVJSc8roaUCRlcz_IP9j');
INSERT INTO `t_userinfo` VALUES ('13688886666', '--', '鼠鼠', '男', '2020-03-28', '1113', 'bbb', 'taser@126.com', 'upload/677c8c9211254462881910e247e80c57', '', 'oewYJ6xHpV5ZJbSMOXMQO3YPaQew');
INSERT INTO `t_userinfo` VALUES ('user1', '123', '小明', '男', '2020-03-10', '7356252', '成都滨江路10号', 'xiaoming@126.com', 'upload/NoImage.jpg', 'test', NULL);

SET FOREIGN_KEY_CHECKS = 1;
