/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50713
 Source Host           : localhost:3306
 Source Schema         : oauth2_resource

 Target Server Type    : MySQL
 Target Server Version : 50713
 File Encoding         : 65001

 Date: 16/06/2019 16:32:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_content
-- ----------------------------
DROP TABLE IF EXISTS `tb_content`;
CREATE TABLE `tb_content`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL COMMENT '内容类目ID',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容标题',
  `sub_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子标题',
  `title_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题描述',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `pic` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片绝对路径',
  `pic2` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片2',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `updated`(`updated`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_content
-- ----------------------------
INSERT INTO `tb_content` VALUES (28, 89, '标题', '子标题', '标题说明', 'http://www.jd.com', NULL, NULL, NULL, '2019-04-07 00:56:09', '2019-04-07 00:56:11');
INSERT INTO `tb_content` VALUES (29, 89, 'ad2', 'ad2', 'ad2', 'http://www.baidu.com', NULL, NULL, NULL, '2019-04-07 00:56:13', '2019-04-07 00:56:15');
INSERT INTO `tb_content` VALUES (30, 89, 'ad3', 'ad3', 'ad3', 'http://www.sina.com.cn', NULL, NULL, NULL, '2019-04-07 00:56:17', '2019-04-07 00:56:19');
INSERT INTO `tb_content` VALUES (31, 89, 'ad4', 'ad4', 'ad4', 'http://www.funtl.com', NULL, NULL, NULL, '2019-04-07 00:56:22', '2019-04-07 00:56:25');

-- ----------------------------
-- Table structure for tb_content_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_content_category`;
CREATE TABLE `tb_content_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态。可选值:1(正常),2(删除)',
  `sort_order` int(4) NULL DEFAULT NULL COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
  `is_parent` tinyint(1) NULL DEFAULT 1 COMMENT '该类目是否为父类目，1为true，0为false',
  `created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`, `status`) USING BTREE,
  INDEX `sort_order`(`sort_order`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_content_category
-- ----------------------------
INSERT INTO `tb_content_category` VALUES (30, 0, 'LeeShop', 1, 1, 1, '2015-04-03 16:51:38', '2015-04-03 16:51:40');
INSERT INTO `tb_content_category` VALUES (86, 30, '首页', 1, 1, 1, '2015-06-07 15:36:07', '2015-06-07 15:36:07');
INSERT INTO `tb_content_category` VALUES (87, 30, '列表页面', 1, 1, 1, '2015-06-07 15:36:16', '2015-06-07 15:36:16');
INSERT INTO `tb_content_category` VALUES (88, 30, '详细页面', 1, 1, 1, '2015-06-07 15:36:27', '2015-06-07 15:36:27');
INSERT INTO `tb_content_category` VALUES (89, 86, '大广告', 1, 1, 0, '2015-06-07 15:36:38', '2015-06-07 15:36:38');
INSERT INTO `tb_content_category` VALUES (90, 86, '小广告', 1, 1, 0, '2015-06-07 15:36:45', '2015-06-07 15:36:45');
INSERT INTO `tb_content_category` VALUES (91, 86, '商城快报', 1, 1, 0, '2015-06-07 15:36:55', '2015-06-07 15:36:55');
INSERT INTO `tb_content_category` VALUES (92, 87, '边栏广告', 1, 1, 0, '2015-06-07 15:37:07', '2015-06-07 15:37:07');
INSERT INTO `tb_content_category` VALUES (93, 87, '页头广告', 1, 1, 0, '2015-06-07 15:37:17', '2015-06-07 15:37:17');
INSERT INTO `tb_content_category` VALUES (94, 87, '页脚广告', 1, 1, 0, '2015-06-07 15:37:31', '2015-06-07 15:37:31');
INSERT INTO `tb_content_category` VALUES (95, 88, '边栏广告', 1, 1, 0, '2015-06-07 15:37:56', '2015-06-07 15:37:56');
INSERT INTO `tb_content_category` VALUES (96, 86, '中广告', 1, 1, 1, '2015-07-25 18:58:52', '2015-07-25 18:58:52');
INSERT INTO `tb_content_category` VALUES (97, 96, '中广告1', 1, 1, 0, '2015-07-25 18:59:43', '2015-07-25 18:59:43');

SET FOREIGN_KEY_CHECKS = 1;
