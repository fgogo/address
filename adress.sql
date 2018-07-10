/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : adress

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-07-10 15:29:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator` (
  `user` char(10) DEFAULT NULL,
  `password` char(10) DEFAULT NULL,
  `tablename` char(10) DEFAULT NULL,
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES ('fu', '123', 'listfu');
INSERT INTO `administrator` VALUES ('1234', '1234', 'list1234');
INSERT INTO `administrator` VALUES ('fuu', '1234', 'listfuu');
INSERT INTO `administrator` VALUES ('fg', '111', 'listfg');
INSERT INTO `administrator` VALUES ('abc', '111', 'listabc');

-- ----------------------------
-- Table structure for listabc
-- ----------------------------
DROP TABLE IF EXISTS `listabc`;
CREATE TABLE `listabc` (
  `name` char(15) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `tellphone` char(11) DEFAULT NULL,
  `email` varchar(15) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  `fenzu` char(10) DEFAULT NULL,
  UNIQUE KEY `tellphone` (`tellphone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of listabc
-- ----------------------------

-- ----------------------------
-- Table structure for listfg
-- ----------------------------
DROP TABLE IF EXISTS `listfg`;
CREATE TABLE `listfg` (
  `name` char(15) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `tellphone` char(11) DEFAULT NULL,
  `email` varchar(15) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  `fenzu` char(10) DEFAULT NULL,
  UNIQUE KEY `tellphone` (`tellphone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of listfg
-- ----------------------------

-- ----------------------------
-- Table structure for listfu
-- ----------------------------
DROP TABLE IF EXISTS `listfu`;
CREATE TABLE `listfu` (
  `name` char(15) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `tellphone` char(11) DEFAULT NULL,
  `email` varchar(15) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  `fenzu` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of listfu
-- ----------------------------
INSERT INTO `listfu` VALUES ('liming', '1531167818189.jpg', '1231312', '12@qq.com', '212', '同学');
INSERT INTO `listfu` VALUES ('fg', '1531167837105.jpg', '123', '12344@qq.com', '12', '同事');
INSERT INTO `listfu` VALUES ('fufu', '1531167845953.jpg', '123', '12344@qq.com', 'guoguo', '家人');
INSERT INTO `listfu` VALUES ('ceshi2', 'E:\\图片\\Saved Pictures\\6734.jpg', '2', '124@qq.com', 'ming', '同事');
INSERT INTO `listfu` VALUES ('ceshi3', 'E:\\图片\\Saved Pictures\\6735.jpg', '3', '125@qq.com', 'ming', '同事');
INSERT INTO `listfu` VALUES ('ceshi4', 'E:\\图片\\Saved Pictures\\6736.jpg', '4', '126@qq.com', 'ming', '同事');
INSERT INTO `listfu` VALUES ('ceshi5', 'E:\\图片\\Saved Pictures\\6737.jpg', '5', '127@qq.com', 'ming', '同事');
INSERT INTO `listfu` VALUES ('ceshi6', 'E:\\图片\\Saved Pictures\\6738.jpg', '6', '128@qq.com', 'ming', '同事');

-- ----------------------------
-- Table structure for listfuu
-- ----------------------------
DROP TABLE IF EXISTS `listfuu`;
CREATE TABLE `listfuu` (
  `name` char(15) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `tellphone` char(11) DEFAULT NULL,
  `email` varchar(15) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  `fenzu` char(10) DEFAULT NULL,
  UNIQUE KEY `tellphone` (`tellphone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of listfuu
-- ----------------------------
INSERT INTO `listfuu` VALUES ('ef', '1531160052593.jpg', '1231312', '112@1.com', '12', '家人');

-- ----------------------------
-- Table structure for trashabc
-- ----------------------------
DROP TABLE IF EXISTS `trashabc`;
CREATE TABLE `trashabc` (
  `name` char(15) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `tellphone` char(11) DEFAULT NULL,
  `email` varchar(15) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  `fenzu` char(10) DEFAULT NULL,
  UNIQUE KEY `tellphone` (`tellphone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trashabc
-- ----------------------------

-- ----------------------------
-- Table structure for trashfg
-- ----------------------------
DROP TABLE IF EXISTS `trashfg`;
CREATE TABLE `trashfg` (
  `name` char(15) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `tellphone` char(11) DEFAULT NULL,
  `email` varchar(15) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  `fenzu` char(10) DEFAULT NULL,
  UNIQUE KEY `tellphone` (`tellphone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trashfg
-- ----------------------------

-- ----------------------------
-- Table structure for trashfu
-- ----------------------------
DROP TABLE IF EXISTS `trashfu`;
CREATE TABLE `trashfu` (
  `name` char(15) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `tellphone` char(11) DEFAULT NULL,
  `email` varchar(15) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  `fenzu` char(10) DEFAULT NULL,
  UNIQUE KEY `tellphone` (`tellphone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trashfu
-- ----------------------------

-- ----------------------------
-- Table structure for trashfuu
-- ----------------------------
DROP TABLE IF EXISTS `trashfuu`;
CREATE TABLE `trashfuu` (
  `name` char(15) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `tellphone` char(11) DEFAULT NULL,
  `email` varchar(15) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  `fenzu` char(10) DEFAULT NULL,
  UNIQUE KEY `tellphone` (`tellphone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trashfuu
-- ----------------------------
INSERT INTO `trashfuu` VALUES ('fufu', '1531159992495.jpg', '1231312', '123441@qq.com', 'guoguo', '同学');
