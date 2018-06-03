/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : itwen

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2018-05-29 11:57:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for shangping
-- ----------------------------
DROP TABLE IF EXISTS `shangping`;
CREATE TABLE `shangping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `miaoshu` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shangping
-- ----------------------------
INSERT INTO `shangping` VALUES ('1', 'dddd', 'dd', 'd', 'd');
INSERT INTO `shangping` VALUES ('3', 'aaaaa', 'd', 'd', 'd');

-- ----------------------------
-- Table structure for userroot
-- ----------------------------
DROP TABLE IF EXISTS `userroot`;
CREATE TABLE `userroot` (
  `username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 NOT NULL,
  `email` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userroot
-- ----------------------------
INSERT INTO `userroot` VALUES ('aaaa', 'dfd', 'df');
INSERT INTO `userroot` VALUES ('bbbb', 'bbbb', 'bbbb');
INSERT INTO `userroot` VALUES ('ccccc', 'ccccc', 'ccccc');
INSERT INTO `userroot` VALUES ('ddddd', 'dddd', 'ddddd');
INSERT INTO `userroot` VALUES ('root', '123', '123@qq.com');
INSERT INTO `userroot` VALUES ('rssd', 'dddd', 'djfd@qq.com');
INSERT INTO `userroot` VALUES ('点击发电机房', 'dddd', 'djf@qq.com');
