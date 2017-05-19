/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50536
Source Host           : 127.0.0.1:3306
Source Database       : db_book_store

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2017-05-20 02:51:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bs_book
-- ----------------------------
DROP TABLE IF EXISTS `bs_book`;
CREATE TABLE `bs_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(255) DEFAULT NULL,
  `bookAuthor` varchar(255) DEFAULT NULL,
  `bookPrice` decimal(10,0) DEFAULT NULL,
  `bookImgUrl` varchar(255) DEFAULT NULL,
  `bookNumber` varchar(255) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `deleteTime` datetime DEFAULT NULL,
  `isDel` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  `bookPress` varchar(255) DEFAULT NULL COMMENT '出版社',
  `bookPubTime` datetime DEFAULT NULL,
  `bookSize` varchar(255) DEFAULT NULL,
  `bookPages` int(11) DEFAULT NULL,
  `bookOutline` varchar(255) DEFAULT NULL COMMENT '图书简介',
  `bookCatalog` varchar(255) DEFAULT NULL COMMENT '图书目录',
  `bookMarketPrice` decimal(10,0) DEFAULT NULL COMMENT '市场价',
  `bookVIPPrice` decimal(10,0) DEFAULT NULL,
  `bookDealMount` int(11) DEFAULT NULL COMMENT '成交量',
  `bookLookMount` int(11) DEFAULT NULL COMMENT '浏览次数',
  `bookStoreMount` int(11) DEFAULT NULL COMMENT '库存量',
  `bookStoreTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bs_book
-- ----------------------------
INSERT INTO `bs_book` VALUES ('1', '水浒传', '施耐庵', '29', '', '97870200087422', '26', '2017-05-19 00:34:36', '2017-05-19 21:23:50', null, '0', '1', '人民文学出版社', '2004-09-01 00:00:00', '32开', '436', '《水浒传》是我国第一部以农民起义为题材的长篇章回小说，是我国文学史上一座巍然屹立的丰碑，也是世界文学宝库中一颗光彩夺目的明珠。数百年来，它一直深受我国人民的喜爱，并被译为多种文字，成为我国流传最为广泛的古代长篇小说之一。', '引首', '27', '27', '222', '1000', '1111', '2017-05-09 00:00:00');
INSERT INTO `bs_book` VALUES ('2', '西游记', '吴承恩', '24', null, '9787020008735', '26', '2017-05-19 21:07:42', '2017-05-19 21:23:49', '2017-05-19 21:24:08', '1', '0', '人民文学出版社', '2004-08-03 00:00:00', '32开', '448', null, null, '24', '21', null, null, '1002', '2017-05-19 21:07:42');

-- ----------------------------
-- Table structure for bs_category
-- ----------------------------
DROP TABLE IF EXISTS `bs_category`;
CREATE TABLE `bs_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryNumber` varchar(255) DEFAULT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `deleteTime` datetime DEFAULT NULL,
  `isDel` tinyint(4) DEFAULT '0',
  `parentId` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bs_category
-- ----------------------------
INSERT INTO `bs_category` VALUES ('1', '00001', '人文社科', '2017-05-18 23:42:53', null, null, '0', null, '1');
INSERT INTO `bs_category` VALUES ('2', '00002', '教育', '2017-05-18 23:43:55', null, null, '0', null, '1');
INSERT INTO `bs_category` VALUES ('3', '00003', '生活', '2017-05-18 23:44:12', null, null, '0', null, '1');
INSERT INTO `bs_category` VALUES ('4', '00004', '文艺', '2017-05-18 23:44:25', null, null, '0', null, '1');
INSERT INTO `bs_category` VALUES ('5', '00005', '小说', '2017-05-18 23:44:41', null, null, '0', null, '1');
INSERT INTO `bs_category` VALUES ('6', '00006', '科技', '2017-05-18 23:45:29', null, null, '0', null, '1');
INSERT INTO `bs_category` VALUES ('7', '00007', '历史', '2017-05-18 23:47:54', null, null, '0', '1', '2');
INSERT INTO `bs_category` VALUES ('8', '00008', '文化', '2017-05-18 23:48:22', null, null, '0', '1', '2');
INSERT INTO `bs_category` VALUES ('9', '00009', '古籍', '2017-05-18 23:48:52', null, null, '0', '1', '2');
INSERT INTO `bs_category` VALUES ('10', '00010', '社会科学', '2017-05-18 23:49:12', null, null, '0', '1', '2');
INSERT INTO `bs_category` VALUES ('11', '00011', '法律', '2017-05-18 23:49:40', null, null, '0', '1', '2');
INSERT INTO `bs_category` VALUES ('12', '00012', '教材', '2017-05-18 23:50:06', null, null, '0', '2', '2');
INSERT INTO `bs_category` VALUES ('13', '00013', '外语', '2017-05-18 23:50:24', null, null, '0', '2', '2');
INSERT INTO `bs_category` VALUES ('14', '00014', '考试', '2017-05-18 23:50:45', null, null, '0', '2', '2');
INSERT INTO `bs_category` VALUES ('15', '00015', '工具书', '2017-05-18 23:51:06', null, null, '0', '2', '2');
INSERT INTO `bs_category` VALUES ('16', '00016', '休闲/爱好', '2017-05-18 23:52:27', null, null, '0', '3', '2');
INSERT INTO `bs_category` VALUES ('17', '00017', '烹饪/美食', '2017-05-18 23:52:58', null, null, '0', '3', '2');
INSERT INTO `bs_category` VALUES ('18', '00018', '风水/占卜', '2017-05-18 23:53:25', null, null, '0', '3', '2');
INSERT INTO `bs_category` VALUES ('19', '00019', '体育/运动', '2017-05-18 23:53:51', null, null, '0', '3', '2');
INSERT INTO `bs_category` VALUES ('20', '00020', '文学', '2017-05-18 23:54:30', null, null, '0', '4', '2');
INSERT INTO `bs_category` VALUES ('21', '00021', '艺术', '2017-05-18 23:54:43', null, null, '0', '4', '2');
INSERT INTO `bs_category` VALUES ('22', '00022', '摄影', '2017-05-18 23:54:53', null, null, '0', '4', '2');
INSERT INTO `bs_category` VALUES ('23', '00023', '传记', '2017-05-18 23:55:17', null, null, '0', '4', '2');
INSERT INTO `bs_category` VALUES ('24', '00024', '中国当代小说', '2017-05-18 23:55:57', null, null, '0', '5', '2');
INSERT INTO `bs_category` VALUES ('25', '00025', '中国近代小说', '2017-05-18 23:56:20', null, null, '0', '5', '2');
INSERT INTO `bs_category` VALUES ('26', '00026', '四大名著', '2017-05-18 23:56:41', null, null, '0', '5', '2');
INSERT INTO `bs_category` VALUES ('27', '00027', '科幻', '2017-05-18 23:57:04', null, null, '0', '5', '2');
INSERT INTO `bs_category` VALUES ('28', '00028', '武侠', '2017-05-18 23:57:18', null, null, '0', '5', '2');
INSERT INTO `bs_category` VALUES ('29', '00029', '科普', '2017-05-18 23:57:52', null, null, '0', '6', '2');
INSERT INTO `bs_category` VALUES ('30', '00030', '计算机/网络', '2017-05-18 23:58:16', null, null, '0', '6', '2');
INSERT INTO `bs_category` VALUES ('31', '00031', '自然科学', '2017-05-18 23:58:43', null, null, '0', '6', '2');
INSERT INTO `bs_category` VALUES ('32', '00032', '医学', '2017-05-18 23:59:07', null, null, '0', '6', '2');
INSERT INTO `bs_category` VALUES ('33', '00033', '童书', '2017-05-20 00:10:34', '2017-05-20 02:32:11', '2017-05-20 02:49:54', '1', null, '1');
INSERT INTO `bs_category` VALUES ('34', '00034', '漫画', '2017-05-20 00:17:07', '2017-05-20 02:31:25', '2017-05-20 02:49:54', '1', '33', '2');

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
INSERT INTO `bs_menu` VALUES ('9', '类别列表', '2', '3', '2', '/admin/category/list', null, null, 'glyphicon glyphicon-th-large');

-- ----------------------------
-- Table structure for bs_permission
-- ----------------------------
DROP TABLE IF EXISTS `bs_permission`;
CREATE TABLE `bs_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `desp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bs_permission
-- ----------------------------
INSERT INTO `bs_permission` VALUES ('1', 'user:user', null, null, '2017-04-29 23:06:32', '用户管理');
INSERT INTO `bs_permission` VALUES ('2', 'user:list', '/admin/user/list', '1', '2017-04-29 23:07:07', '用户列表');

-- ----------------------------
-- Table structure for bs_role
-- ----------------------------
DROP TABLE IF EXISTS `bs_role`;
CREATE TABLE `bs_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) DEFAULT NULL,
  `desp` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bs_role
-- ----------------------------
INSERT INTO `bs_role` VALUES ('1', 'admin', '超级管理员', '0', '2017-04-29 23:02:18');

-- ----------------------------
-- Table structure for bs_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `bs_role_permission`;
CREATE TABLE `bs_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) DEFAULT NULL,
  `permissionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bs_role_permission
-- ----------------------------
INSERT INTO `bs_role_permission` VALUES ('1', '1', '1');
INSERT INTO `bs_role_permission` VALUES ('2', '1', '2');

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
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `birthDate` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `loginStatus` tinyint(4) DEFAULT NULL,
  `lastAccessTime` datetime DEFAULT NULL,
  `userIp` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `idCard` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bs_user
-- ----------------------------
INSERT INTO `bs_user` VALUES ('1', '亓凯凯', '4297f44b13955235245b2497399d7a93', '凯凯', null, '13027786219', '1', '2017-04-19 20:57:44', '2017-04-19 20:57:47', '0', null, '1', null, null, '1992-03-16 20:58:04', null, null, '2017-04-19 20:58:36', null, 'fjdUVxGx', null, null, null);
INSERT INTO `bs_user` VALUES ('2', '宋江', '123456', '天魁星', null, '13027786210', '1', '2017-04-19 21:03:23', '2017-04-19 21:03:26', '0', null, '1', null, null, '2010-04-19 21:03:31', null, null, '2017-04-19 21:03:41', null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('3', '卢俊义', '123456', '天罡星', null, '13027865722', '1', '2017-04-19 21:04:59', '2017-04-19 21:05:02', '0', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('4', '吴用', '123444', '天机星', null, '13927868646', '1', '2017-04-19 21:05:32', '2017-04-19 21:05:34', '0', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('5', '公孙胜', '123456', '天闲星', null, '15300078692', '1', '2017-04-19 21:06:08', '2017-04-19 21:06:12', '0', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('6', '关胜', '123456', '天勇星', null, '15808699776', '1', '2017-04-19 21:06:43', '2017-04-19 21:06:46', '0', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('7', '林冲', '123123', '天雄星', null, '15097656423', '1', '2017-04-19 21:07:19', '2017-04-19 21:07:22', '0', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('8', '秦明', '2323232', '天猛星', null, '17975765677', '1', '2017-04-19 21:07:52', '2017-04-19 21:07:55', '0', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('9', '呼延灼', '1232312', '天威星', null, '18042343434', '1', '2017-04-19 21:08:23', '2017-04-19 21:08:26', '0', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('10', '花荣', '123232', '天英星', null, '18764232321', '1', '2017-04-19 21:08:56', '2017-04-19 21:09:00', '0', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('11', '柴进', '123421', '天贵星', null, '18723124214', '1', '2017-04-19 21:09:23', '2017-04-19 21:09:25', '0', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('12', '李应', '123421', '天富星', null, '18765231321', '1', '2017-04-19 21:10:02', '2017-04-19 21:10:05', '0', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('13', '朱仝', '123445', '天满星', null, '13923324241', '1', '2017-04-19 21:11:00', '2017-04-24 11:29:06', '0', null, '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('14', '鲁智深', '123342', '天孤星', null, '13876562112', '1', '2017-04-19 21:11:37', '2017-04-24 11:29:08', '0', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('15', '武松', '1231233', '天伤星', null, '13520863123', '1', '2017-04-19 21:12:08', '2017-04-19 21:12:10', '1', '2017-04-24 11:28:59', '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('16', '董平', '1232132', '天立星', null, '13876554123', '1', '2017-04-19 21:12:45', '2017-04-19 21:12:48', '1', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('17', '柴颖颖', null, '颖颖', null, '13503820868', '2', '2017-04-23 23:19:48', null, '0', null, '1', null, null, '2017-04-21 00:00:00', '850494695@qq.com', null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('18', '测试', null, '测试', null, '13027786200', '1', '2017-05-16 16:48:17', null, '0', null, '1', null, null, '2017-05-09 00:00:00', 'dayu@qq.com', null, null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('19', '张三', null, '三儿', null, '13027786212', '1', '2017-05-18 19:53:44', '2017-05-18 23:18:54', '0', null, '0', '河南省', '商丘市', '2010-06-09 00:00:00', '1111222@qq.com', null, null, null, null, '汉族', '程序员', '411481199809984122');

-- ----------------------------
-- Table structure for bs_user_role
-- ----------------------------
DROP TABLE IF EXISTS `bs_user_role`;
CREATE TABLE `bs_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bs_user_role
-- ----------------------------
INSERT INTO `bs_user_role` VALUES ('1', '1', '1');
