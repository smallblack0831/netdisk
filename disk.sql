/*
 Navicat Premium Dump SQL

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50528 (5.5.28)
 Source Host           : localhost:3306
 Source Schema         : disk

 Target Server Type    : MySQL
 Target Server Version : 50528 (5.5.28)
 File Encoding         : 65001

 Date: 13/10/2025 11:30:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', 'http://localhost:9090/files/1760321629314-435f2fb6-05c9-4cc6-8795-fffbdc026c42.jpg', 'ADMIN', '13677889922', 'admin@xm.com');

-- ----------------------------
-- Table structure for disk_files
-- ----------------------------
DROP TABLE IF EXISTS `disk_files`;
CREATE TABLE `disk_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `folder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否文件夹',
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件路径',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` double(10, 3) NULL DEFAULT NULL COMMENT '文件大小',
  `crate_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改时间',
  `folder_id` int(11) NULL DEFAULT NULL COMMENT '所属文件夹ID',
  `root_folder_id` int(11) NULL DEFAULT NULL COMMENT '最外层文件夹ID',
  `delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '网盘文件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of disk_files
-- ----------------------------
INSERT INTO `disk_files` VALUES (84, '测试文件夹1', '是', NULL, 7, 'folder', NULL, '2025-10-13 10:52:53', '2025-10-13 10:52:53', NULL, 84, 0);
INSERT INTO `disk_files` VALUES (85, '测试文件夹1-拷贝', '是', NULL, 7, 'folder', NULL, '2025-10-13 10:52:58', '2025-10-13 10:52:58', NULL, 84, 1);
INSERT INTO `disk_files` VALUES (86, '1703256613055-Java开发手册-嵩山版.pdf', '否', 'http://localhost:9090/diskFiles/download/1760323992094-1703256613055-Java开发手册-嵩山版.pdf', 7, 'pdf', 0.000, '2025-10-13 10:53:12', '2025-10-13 10:53:12', 84, 84, 0);
INSERT INTO `disk_files` VALUES (87, '图片文件', '是', NULL, 7, 'folder', NULL, '2025-10-13 10:53:46', '2025-10-13 10:53:46', NULL, 87, 0);
INSERT INTO `disk_files` VALUES (88, '1702886328471-微信截图_20231114162404.png', '否', 'http://localhost:9090/diskFiles/download/1760324050127-1702886328471-微信截图_20231114162404.png', 7, 'png', 223.944, '2025-10-13 10:54:10', '2025-10-13 10:54:10', 87, 87, 0);
INSERT INTO `disk_files` VALUES (89, 'login-bg (2).jpg', '否', 'http://localhost:9090/diskFiles/download/1760324060240-login-bg (2).jpg', 7, 'jpg', 444.419, '2025-10-13 10:54:20', '2025-10-13 10:54:20', 87, 87, 0);
INSERT INTO `disk_files` VALUES (90, '1703256613055-Java开发手册-嵩山版.rar', '否', 'http://localhost:9090/diskFiles/download/1760324079450-1703256613055-Java开发手册-嵩山版.rar', 7, 'rar', 0.105, '2025-10-13 10:54:39', '2025-10-13 10:54:39', NULL, NULL, 0);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (4, '网盘系统上线了', '网盘系统正式上线了哦', '2025-10-13', 'admin');

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `file_id` int(11) NULL DEFAULT NULL COMMENT '文件ID',
  `share_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分享时间',
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '到期时间',
  `count` int(11) NULL DEFAULT 0 COMMENT '访问次数',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '分享人ID',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '验证码',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of share
-- ----------------------------
INSERT INTO `share` VALUES (22, '图片文件', 87, '2025-10-13 10:56:27', '2025-10-16 10:56:27', 28, 7, '1977569090110287872', 'folder');
INSERT INTO `share` VALUES (23, '测试文件夹1', 84, '2025-10-13 11:22:01', '2025-10-16 11:22:01', 1, 7, '1977575526685011968', 'folder');
INSERT INTO `share` VALUES (24, '图片文件', 87, '2025-10-13 11:22:34', '2025-10-16 11:22:34', 2, 7, '1977575662911811584', 'folder');

-- ----------------------------
-- Table structure for trash
-- ----------------------------
DROP TABLE IF EXISTS `trash`;
CREATE TABLE `trash`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NULL DEFAULT NULL COMMENT '文件ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `size` double NULL DEFAULT NULL COMMENT '文件大小',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '删除时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '回收站' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of trash
-- ----------------------------
INSERT INTO `trash` VALUES (62, 85, '测试文件夹1-拷贝', NULL, '2025-10-13 10:53:02', 7);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '普通用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (7, 'huahua', '123', '南风知我意', 'http://localhost:9090/files/1760323721334-8eaa1634-398b-4975-b999-0778c4ec0858.jpg', 'USER', '1997836736', '9838883@main.com');

SET FOREIGN_KEY_CHECKS = 1;
