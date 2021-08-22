/*
Navicat MySQL Data Transfer
Source Server         : localhost
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : book_shop
Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001
Date: 2016-05-19 17:27:35
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `books`
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` float(8,0) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `bookConcern` varchar(50) DEFAULT NULL,
  `counts` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO books VALUES ('1', 'jsp程序设计', '29', '水晶依恋', '河南大学', '32');
INSERT INTO books VALUES ('2', 'PHP从入门到放弃', '75', '水晶依恋', '河南大学', '76');
INSERT INTO books VALUES ('3', 'java高级编程', '42', '水晶依恋', '河南大学', '60');
INSERT INTO books VALUES ('9', '安抚', '324', '345', '新华书店', '234');
INSERT INTO books VALUES ('10', 'PHP从入门到精通', '50', '杨森源', '河南大学', '81');
INSERT INTO books VALUES ('14', 'jsp程序设计2', '29', '水晶依恋', '河南大学', '3445');
INSERT INTO books VALUES ('18', 'javaweb从入门到放弃', '56', '杨森源', '107网站', '456');

-- ----------------------------
-- Table structure for `borrow`
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `bookid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrow
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `power` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('1', 'admin', '123456', '1');
INSERT INTO user VALUES ('2', '杨森源', '123456', '0');
INSERT INTO user VALUES ('3', 'test', '123456', '0');