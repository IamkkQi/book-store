/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : db_book_store

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-02-22 18:19:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bs_user
-- ----------------------------
DROP TABLE IF EXISTS `bs_user`;
CREATE TABLE `bs_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL,
  `imgSrc` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `isDel` tinyint(4) DEFAULT NULL,
  `delTime` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `birthDate` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bs_user
-- ----------------------------
INSERT INTO `bs_user` VALUES ('1', '亓凯凯', '123123', '凯凯', null, '13027786219', '1', '2017-02-22 16:59:41', null, '0', null, '1', '1992-02-13 17:59:57', 'iamkkqi@163.com', '河南郑州');
INSERT INTO `bs_user` VALUES ('2', '柴颖颖', '123123', '颖颖', null, '13503820868', '1', '2017-02-22 18:59:41', null, '0', null, '1', '1992-02-13 17:59:57', 'taoyaochai@qq.com', '河南郑州');
