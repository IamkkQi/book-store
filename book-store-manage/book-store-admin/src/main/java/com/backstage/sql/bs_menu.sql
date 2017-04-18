/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50536
Source Host           : 127.0.0.1:3306
Source Database       : db_book_store

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2017-04-19 00:13:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bs_menu
-- ----------------------------
DROP TABLE IF EXISTS `bs_menu`;
CREATE TABLE `bs_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `eventType` tinyint(4) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `menuPinYin` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bs_menu
-- ----------------------------
INSERT INTO `bs_menu` VALUES ('1', '用户管理', '1', null, '1', null, 'yonghuguanli', null);
INSERT INTO `bs_menu` VALUES ('2', '图书管理', '1', null, '1', null, 'tushuguanli', null);
INSERT INTO `bs_menu` VALUES ('3', '类别管理', '1', null, '1', null, 'leibieguanli', null);
INSERT INTO `bs_menu` VALUES ('4', '控制面板', '1', null, '1', null, 'kongzhimianban', null);
INSERT INTO `bs_menu` VALUES ('5', '全部用户', '2', '1', '2', '/admin/user/list', 'quanbuyonghu', null);
INSERT INTO `bs_menu` VALUES ('6', '角色管理', '2', '4', '2', null, null, null);
INSERT INTO `bs_menu` VALUES ('7', '日志管理', '2', '4', '2', null, null, null);
