/*
 Navicat MySQL Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : ssm_blog

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 06/04/2022 15:48:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) NOT NULL COMMENT '分类Id',
  `title` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` blob NOT NULL COMMENT '内容',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章简介  用于列表显示',
  `statue` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0：正常  1：不可用',
  `author` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'tulun' COMMENT '作者',
  `createTime` datetime NOT NULL COMMENT '发表时间',
  `showCount` int(11) NOT NULL DEFAULT 0 COMMENT '浏览量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_article_image
-- ----------------------------
DROP TABLE IF EXISTS `t_article_image`;
CREATE TABLE `t_article_image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imageUrl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `articleId` int(11) NOT NULL COMMENT '文章Id',
  PRIMARY KEY (`id`, `articleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章图  主要用于列表浏览' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_article_tag`;
CREATE TABLE `t_article_tag`  (
  `articleId` int(11) NOT NULL COMMENT '文章Id',
  `tagId` int(11) NOT NULL COMMENT '标签Id',
  PRIMARY KEY (`articleId`, `tagId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章标签中间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称  唯一',
  `iconClass` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图标样式',
  `aliasName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '别名  唯一  比如新闻 就用News 代替  栏目Id不显示在url中',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 （0-10）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `aliasName_UNIQUE`(`aliasName`) USING BTREE,
  UNIQUE INDEX `categoryName_UNIQUE`(`categoryName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表  只支持一级分类  如果需要分多个层次 用标签来协助实现' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名称  唯一',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tagName_UNIQUE`(`tagName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
