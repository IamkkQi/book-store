/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50536
Source Host           : 127.0.0.1:3306
Source Database       : db_book_store

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2017-04-25 00:48:57
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
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bs_menu
-- ----------------------------
INSERT INTO `bs_menu` VALUES ('1', '用户管理', '1', null, '1', null, 'yonghuguanli', null, 'glyphicon glyphicon-user');
INSERT INTO `bs_menu` VALUES ('2', '图书管理', '1', null, '1', null, 'tushuguanli', null, 'fa fa-book');
INSERT INTO `bs_menu` VALUES ('3', '类别管理', '1', null, '1', null, 'leibieguanli', null, 'glyphicon glyphicon-th');
INSERT INTO `bs_menu` VALUES ('4', '控制面板', '1', null, '1', null, 'kongzhimianban', null, 'glyphicon glyphicon-home');
INSERT INTO `bs_menu` VALUES ('5', '全部用户', '2', '1', '2', '/admin/user/list', 'quanbuyonghu', null, 'fa fa-users');
INSERT INTO `bs_menu` VALUES ('6', '角色管理', '2', '4', '2', null, null, null, 'fa fa-user-md');
INSERT INTO `bs_menu` VALUES ('7', '日志管理', '2', '4', '2', null, null, null, 'glyphicon glyphicon-list-alt');
INSERT INTO `bs_menu` VALUES ('8', '图书列表', '2', '2', '2', '/admin/book/list', null, null, 'glyphicon glyphicon-book');
INSERT INTO `bs_menu` VALUES ('9', '类别列表', '2', '3', '2', null, null, null, 'glyphicon glyphicon-th-large');

-- ----------------------------
-- Table structure for bs_user
-- ----------------------------
DROP TABLE IF EXISTS `bs_user`;
CREATE TABLE `bs_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL,
  `imgSrc` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `isDel` tinyint(4) DEFAULT '0',
  `delTime` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `birthDate` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `loginStatus` tinyint(4) DEFAULT NULL,
  `lastAccessTime` datetime DEFAULT NULL,
  `userIp` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bs_user
-- ----------------------------
INSERT INTO `bs_user` VALUES ('1', '亓凯凯', '4297f44b13955235245b2497399d7a93', '凯凯', null, '13027786219', '1', '2017-04-19 20:57:44', '2017-04-19 20:57:47', '0', null, '1', '1992-03-16 20:58:04', null, null, null, '2017-04-19 20:58:36', null, 'fjdUVxGx');
INSERT INTO `bs_user` VALUES ('2', '宋江', '123456', '天魁星', null, '13027786210', '1', '2017-04-19 21:03:23', '2017-04-19 21:03:26', '0', null, '1', '2010-04-19 21:03:31', null, null, null, '2017-04-19 21:03:41', null, null);
INSERT INTO `bs_user` VALUES ('3', '卢俊义', '123456', '天罡星', null, '13027865722', '1', '2017-04-19 21:04:59', '2017-04-19 21:05:02', '0', null, '1', null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('4', '吴用', '123444', '天机星', null, '13927868646', '1', '2017-04-19 21:05:32', '2017-04-19 21:05:34', '0', null, '1', null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('5', '公孙胜', '123456', '天闲星', null, '15300078692', '1', '2017-04-19 21:06:08', '2017-04-19 21:06:12', '0', null, '1', null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('6', '关胜', '123456', '天勇星', null, '15808699776', '1', '2017-04-19 21:06:43', '2017-04-19 21:06:46', '0', null, '1', null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('7', '林冲', '123123', '天雄星', null, '15097656423', '1', '2017-04-19 21:07:19', '2017-04-19 21:07:22', '0', null, '1', null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('8', '秦明', '2323232', '天猛星', null, '17975765677', '1', '2017-04-19 21:07:52', '2017-04-19 21:07:55', '0', null, '1', null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('9', '呼延灼', '1232312', '天威星', null, '18042343434', '1', '2017-04-19 21:08:23', '2017-04-19 21:08:26', '0', null, '1', null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('10', '花荣', '123232', '天英星', null, '18764232321', '1', '2017-04-19 21:08:56', '2017-04-19 21:09:00', '0', null, '1', null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('11', '柴进', '123421', '天贵星', null, '18723124214', '1', '2017-04-19 21:09:23', '2017-04-19 21:09:25', '0', null, '1', null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('12', '李应', '123421', '天富星', null, '18765231321', '1', '2017-04-19 21:10:02', '2017-04-19 21:10:05', '0', null, '1', null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('13', '朱仝', '123445', '天满星', null, '13923324241', '1', '2017-04-19 21:11:00', '2017-04-24 11:29:06', '0', null, '0', null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('14', '鲁智深', '123342', '天孤星', null, '13876562112', '1', '2017-04-19 21:11:37', '2017-04-24 11:29:08', '0', null, '1', null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('15', '武松', '1231233', '天伤星', null, '13520863123', '1', '2017-04-19 21:12:08', '2017-04-19 21:12:10', '1', '2017-04-24 11:28:59', '1', null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('16', '董平', '1232132', '天立星', null, '13876554123', '1', '2017-04-19 21:12:45', '2017-04-19 21:12:48', '1', null, '1', null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('17', '柴颖颖', null, '颖颖', null, '13027786219', '2', '2017-04-23 23:19:48', null, '0', null, '1', '2017-04-21 00:00:00', '850494695@qq.com', '河南省,郑州市', null, null, null, null);
