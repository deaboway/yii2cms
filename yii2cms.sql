/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : yii2cms

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-10-19 17:55:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `head_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `auth_key` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index` (`id`,`username`,`email`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', '管理员', 'https://www.deaboway.com/wp-content/uploads/2016/12/WechatIMG59.jpg', 'FoFuK-WrcOayDI0_kLdRwGavKN-6mXs6', '$2y$13$bK1PVK/hcl2YZzuRsp7gT.1aY74UZKg6iA4JfxwFKkbJeZ3pr3CaG', null, 'deaboway@gmail.com', '10', '1498634445', '1539942177');
INSERT INTO `t_admin` VALUES ('2', 'demo', '演示账号', 'https://www.deaboway.com/wp-content/uploads/2017/07/The_Wolf_of_Wall_Street.jpg', 'MGILqfoQyFko0kLvlaOxvNRp8LgZA0Qt', '$2y$13$E27DkITDZIJbC0Snm3u8e.G1uueBTI4ubsPtV5S5PjmNroxqLbHJy', null, 'demo@gmail.com', '10', '1521768073', '1521796799');

-- ----------------------------
-- Table structure for t_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_log`;
CREATE TABLE `t_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gets` text COLLATE utf8mb4_unicode_ci,
  `posts` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31031 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for t_auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_assignment`;
CREATE TABLE `t_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `t_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `t_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_auth_assignment
-- ----------------------------
INSERT INTO `t_auth_assignment` VALUES ('基本权限', '1', '1539312113');
INSERT INTO `t_auth_assignment` VALUES ('文章管理权限', '1', '1539312113');
INSERT INTO `t_auth_assignment` VALUES ('演示角色', '1', '1539312113');
INSERT INTO `t_auth_assignment` VALUES ('管理员', '1', '1516773830');
INSERT INTO `t_auth_assignment` VALUES ('基本权限', '2', '1539312113');
INSERT INTO `t_auth_assignment` VALUES ('文章管理权限', '2', '1539312113');
INSERT INTO `t_auth_assignment` VALUES ('演示角色', '2', '1539312113');
INSERT INTO `t_auth_assignment` VALUES ('管理员', '2', '1516773830');

-- ----------------------------
-- Table structure for t_auth_item
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_item`;
CREATE TABLE `t_auth_item` (
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `t_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `t_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_auth_item
-- ----------------------------
INSERT INTO `t_auth_item` VALUES ('/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/export/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/export/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/export/init', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/export/optimize', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/export/repair', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/export/start', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/import/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/import/del', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/import/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/import/init', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/backup/import/start', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/default/db-explain', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/user/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/user/reset-identity', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/debug/user/set-identity', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/gii/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/assignment/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/assignment/assign', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/assignment/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/assignment/revoke', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/assignment/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/default/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/default/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/log/*', '2', null, null, null, '1521793951', '1521793951');
INSERT INTO `t_auth_item` VALUES ('/rbac/log/index', '2', null, null, null, '1521793951', '1521793951');
INSERT INTO `t_auth_item` VALUES ('/rbac/log/view', '2', null, null, null, '1521793951', '1521793951');
INSERT INTO `t_auth_item` VALUES ('/rbac/menu/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/menu/create', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/menu/delete', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/menu/delete-all', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/menu/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/menu/update', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/menu/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/permission/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/permission/assign', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/permission/create', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/permission/delete', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/permission/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/permission/remove', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/permission/update', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/permission/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/role/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/role/assign', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/role/create', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/role/delete', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/role/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/role/remove', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/role/update', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/role/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/route/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/route/assign', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/route/create', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/route/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/route/refresh', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/route/remove', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/rule/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/rule/create', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/rule/delete', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/rule/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/rule/update', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/rule/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/active', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/change-password', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/delete', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/inactive', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/login', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/logout', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/request-password-reset', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/reset-password', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/signup', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/update', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/update-self', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/rbac/user/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/site/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/site/dashboard', '2', null, null, null, '1516773692', '1516773692');
INSERT INTO `t_auth_item` VALUES ('/site/error', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/site/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/site/test', '2', null, null, null, '1539312029', '1539312029');
INSERT INTO `t_auth_item` VALUES ('/system/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/config/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/config/create', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/config/delete', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/config/delete-all', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/config/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/config/update', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/config/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/memorandum/*', '2', null, null, null, '1528875249', '1528875249');
INSERT INTO `t_auth_item` VALUES ('/system/memorandum/create', '2', null, null, null, '1528875249', '1528875249');
INSERT INTO `t_auth_item` VALUES ('/system/memorandum/delete', '2', null, null, null, '1528875249', '1528875249');
INSERT INTO `t_auth_item` VALUES ('/system/memorandum/delete-all', '2', null, null, null, '1528875249', '1528875249');
INSERT INTO `t_auth_item` VALUES ('/system/memorandum/index', '2', null, null, null, '1528875249', '1528875249');
INSERT INTO `t_auth_item` VALUES ('/system/memorandum/update', '2', null, null, null, '1528875249', '1528875249');
INSERT INTO `t_auth_item` VALUES ('/system/memorandum/view', '2', null, null, null, '1528875249', '1528875249');
INSERT INTO `t_auth_item` VALUES ('/system/neteasy/*', '2', null, null, null, '1528873251', '1528873251');
INSERT INTO `t_auth_item` VALUES ('/system/neteasy/create', '2', null, null, null, '1528873251', '1528873251');
INSERT INTO `t_auth_item` VALUES ('/system/neteasy/delete', '2', null, null, null, '1528873251', '1528873251');
INSERT INTO `t_auth_item` VALUES ('/system/neteasy/delete-all', '2', null, null, null, '1528873251', '1528873251');
INSERT INTO `t_auth_item` VALUES ('/system/neteasy/index', '2', null, null, null, '1528873251', '1528873251');
INSERT INTO `t_auth_item` VALUES ('/system/neteasy/update', '2', null, null, null, '1528873251', '1528873251');
INSERT INTO `t_auth_item` VALUES ('/system/neteasy/view', '2', null, null, null, '1528873251', '1528873251');
INSERT INTO `t_auth_item` VALUES ('/system/user-rank/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user-rank/create', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user-rank/delete', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user-rank/delete-all', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user-rank/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user-rank/update', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user-rank/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/active', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/create', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/delete', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/delete-all', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/inactive', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/index', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/online-users', '2', null, null, null, '1518083077', '1518083077');
INSERT INTO `t_auth_item` VALUES ('/system/user/update', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/system/user/view', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/tools/*', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/tools/ico', '2', null, null, null, '1539334899', '1539334899');
INSERT INTO `t_auth_item` VALUES ('/tools/upload', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('/tools/upload-editor', '2', null, null, null, '1513838979', '1513838979');
INSERT INTO `t_auth_item` VALUES ('基本权限', '1', '后台人员所需要的基本权限', null, null, '1512542066', '1512542066');
INSERT INTO `t_auth_item` VALUES ('文章管理权限', '1', '管理后台文章权限', null, null, '1512542259', '1512542259');
INSERT INTO `t_auth_item` VALUES ('演示角色', '1', '用于演示的角色', null, null, '1521768107', '1521768107');
INSERT INTO `t_auth_item` VALUES ('管理员', '1', '超级管理员权限', null, null, '1498697175', '1512542127');

-- ----------------------------
-- Table structure for t_auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_item_child`;
CREATE TABLE `t_auth_item_child` (
  `parent` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `t_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `t_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `t_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_auth_item_child
-- ----------------------------
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/export/*');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/backup/export/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/export/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/export/init');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/export/optimize');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/export/repair');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/export/start');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/import/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/import/del');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/backup/import/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/import/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/import/init');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/backup/import/start');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/default/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/default/db-explain');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/default/download-mail');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/default/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/default/toolbar');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/default/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/user/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/user/reset-identity');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/debug/user/set-identity');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/gii/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/gii/default/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/gii/default/action');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/gii/default/diff');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/gii/default/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/gii/default/preview');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/gii/default/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/assignment/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/assignment/assign');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/assignment/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/assignment/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/assignment/revoke');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/assignment/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/assignment/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/default/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/default/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/log/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/log/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/log/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/menu/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/menu/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/menu/delete');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/menu/delete-all');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/menu/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/menu/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/menu/update');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/menu/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/menu/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/permission/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/permission/assign');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/permission/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/permission/delete');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/permission/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/permission/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/permission/remove');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/permission/update');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/permission/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/permission/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/role/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/role/assign');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/role/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/role/delete');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/role/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/role/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/role/remove');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/role/update');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/role/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/role/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/route/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/route/assign');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/route/create');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/route/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/route/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/route/refresh');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/route/remove');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/rule/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/rule/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/rule/delete');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/rule/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/rule/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/rule/update');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/rule/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/rule/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/active');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/change-password');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/delete');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/inactive');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/user/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/index');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/user/login');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/login');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/user/logout');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/logout');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/request-password-reset');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/reset-password');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/signup');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/update');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/update-self');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/rbac/user/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/rbac/user/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/site/*');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/site/dashboard');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/site/dashboard');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/site/error');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/site/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/site/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/site/test');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/config/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/config/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/config/delete');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/config/delete-all');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/config/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/config/update');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/config/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/memorandum/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/memorandum/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/memorandum/delete');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/memorandum/delete-all');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/memorandum/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/memorandum/update');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/memorandum/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/neteasy/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/neteasy/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/neteasy/delete');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/neteasy/delete-all');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/neteasy/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/neteasy/update');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/neteasy/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user-rank/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user-rank/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user-rank/delete');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user-rank/delete-all');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/system/user-rank/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user-rank/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user-rank/update');
INSERT INTO `t_auth_item_child` VALUES ('演示角色', '/system/user-rank/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user-rank/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/active');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/create');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/delete');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/delete-all');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/inactive');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/index');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/online-users');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/update');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/system/user/view');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/tools/*');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/tools/ico');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/tools/upload');
INSERT INTO `t_auth_item_child` VALUES ('管理员', '/tools/upload-editor');

-- ----------------------------
-- Table structure for t_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_rule`;
CREATE TABLE `t_auth_rule` (
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for t_config
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `value` text COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index` (`name`,`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_config
-- ----------------------------
INSERT INTO `t_config` VALUES ('1', 'WEB_SITE_TITLE', '网站标题', '内容管理框架', '网站标题前台显示标题', '0', '0', '1378898976', '1510118190');
INSERT INTO `t_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '网站描述', '内容管理框架', '网站搜索引擎描述', '1', '0', '1378898976', '1472528403');
INSERT INTO `t_config` VALUES ('3', 'WEB_SITE_KEYWORD', '网站关键字', '微信机器人', '网站搜索引擎关键字', '8', '0', '1378898976', '1472528403');
INSERT INTO `t_config` VALUES ('4', 'WEB_SITE_CLOSE', '网站关闭', '0', '网站关闭', '0', '0', '1379122533', '1379122533');
INSERT INTO `t_config` VALUES ('10', 'WEB_SITE_ICP', '网站备案号', '沪ICP备17026641号-1', '设置在网站底部显示的备案号，如“沪ICP备17026641号-1', '9', '0', '1378900335', '1472528403');
INSERT INTO `t_config` VALUES ('11', 'WEB_SITE_RESOURCES_URL', '上传图片服务器域名（可用二级域名）', 'https://pics.deaboway.com/', '域名格式（https://pics.deaboway.com/）', '3', '0', '1379053380', '1516948101');
INSERT INTO `t_config` VALUES ('13', 'COLOR_STYLE', '后台色系', 'default_color', '后台颜色风格', '10', '1', '1379122533', '1472528403');
INSERT INTO `t_config` VALUES ('20', 'WEB_SITE_ALLOW_UPLOAD_TYPE', '站点允许上传文件类型', 'jpg,rar,png,gif,rar', '只需要填写后缀即可', '1', '1', '1512626843', '1517147572');
INSERT INTO `t_config` VALUES ('21', 'OAUTH_QQ', '第三方QQ登录配置项', '{\r\n	\"client_id\": \"**********\",\r\n	\"client_secret\": \"**********\",\r\n	\"redirect_uri\": \"**********\"\r\n}', '第三方QQ登录配置项', '1', '1', '1516869590', '1539942431');
INSERT INTO `t_config` VALUES ('22', 'WEB_SITE_AJAX_URL', '网站AJAX请求域名', 'https://www.deaboway.com/', '网站AJAX请求域名', '2', '1', '1516869798', '1516948115');
INSERT INTO `t_config` VALUES ('23', 'WEB_SITE_BACKGROUND', '站点头部背景图', '/images/background.jpg', '站点头部背景图', '3', '1', '1516949337', '1516949390');
INSERT INTO `t_config` VALUES ('24', 'NETEASE_COOKIE', '网易云音乐cookie', '888888', '网易云音乐cookie', '1', '1', '1527666426', '1539942454');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `icon` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `t_menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `t_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '权限管理', null, null, '3', 'fa fa-bullhorn');
INSERT INTO `t_menu` VALUES ('2', '角色列表', '1', '/rbac/role/index', '34', '&#xe6bf;');
INSERT INTO `t_menu` VALUES ('3', '路由列表', '1', '/rbac/route/index', '46', '&#xea3a;');
INSERT INTO `t_menu` VALUES ('4', '权限列表', '1', '/rbac/permission/index', '33', '&#xe60b;');
INSERT INTO `t_menu` VALUES ('5', '分配权限', '1', '/rbac/assignment/index', '37', '&#xe609;');
INSERT INTO `t_menu` VALUES ('6', '菜单列表', '1', '/rbac/menu/index', '36', '&#xe65e;');
INSERT INTO `t_menu` VALUES ('7', '规则列表', '1', '/rbac/rule/index', '35', '&#xe748;');
INSERT INTO `t_menu` VALUES ('8', '后台用户', '1', '/rbac/user/index', '32', '&#xe60d;');
INSERT INTO `t_menu` VALUES ('10', '前台用户', '14', '/system/user/index', '21', '&#xe60d;');
INSERT INTO `t_menu` VALUES ('14', '系统管理', null, null, '2', '&#xe602;');
INSERT INTO `t_menu` VALUES ('15', '配置设置', '14', '/system/config/index', '23', '&#xe609;');
INSERT INTO `t_menu` VALUES ('16', '用户等级', '14', '/system/user-rank/index', '22', '&#xe629;');
INSERT INTO `t_menu` VALUES ('21', '数据备份', '14', '/backup/export/index', '24', '&#xe778;');
INSERT INTO `t_menu` VALUES ('22', '数据恢复', '14', '/backup/import/index', '25', '&#xe777;');
INSERT INTO `t_menu` VALUES ('26', '日志记录', '1', '/rbac/log/index', '31', '&#xe7b8;');
INSERT INTO `t_menu` VALUES ('31', '自动生成', '14', '/gii/default/index', '18', '&#xe614;');

-- ----------------------------
-- Table structure for t_migration
-- ----------------------------
DROP TABLE IF EXISTS `t_migration`;
CREATE TABLE `t_migration` (
  `version` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_migration
-- ----------------------------
INSERT INTO `t_migration` VALUES ('m000000_000000_base', '1498633414');
INSERT INTO `t_migration` VALUES ('m140602_111327_create_menu_table', '1498633912');
INSERT INTO `t_migration` VALUES ('m160312_050000_create_user', '1498633912');
INSERT INTO `t_migration` VALUES ('m140516_214808_actionlog', '1506561803');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `head_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `auth_key` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码hash',
  `password_reset_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '重置密码凭据',
  `access_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户访问数据凭证',
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户电子邮箱',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '用户状态',
  `r_id` int(11) unsigned NOT NULL COMMENT '用户等级',
  `created_at` int(11) NOT NULL COMMENT '注册账号时间',
  `created_address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注册账号的地点',
  `created_ip` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注册账号的IP',
  `last_login_date` int(11) DEFAULT NULL COMMENT '最后一次登录时间',
  `last_login_ip` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后一次登录IP',
  `last_login_address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后一次登录地点',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  `balance` decimal(10,0) DEFAULT '0' COMMENT '余额',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index` (`id`,`username`,`mobile`,`email`,`r_id`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'deaboway', '大波巍', 'https://www.deaboway.com/wp-content/uploads/2017/07/The_Wolf_of_Wall_Street.jpg', 'gOQEd6Q8nKh6J8WnVWbf466wqgXKUh8V', '$2y$13$w5oLa8hCsNC3IXM17ADODOjRoNzyGd0rL5A8icjI9UxgGBlMJ5rWO', null, 'lTn0p3L-HstHiS3EzPHH5kpa7gEUpf1__1537259088', '18888888888', 'deaboway@gmail.com', '10', '6', '1483534763', '上海市闸北区 电信ADSL', '218.81.204.109', '1537256688', '101.81.232.103', '上海市 电信', '0', '0', '1537256688');

-- ----------------------------
-- Table structure for t_user_rank
-- ----------------------------
DROP TABLE IF EXISTS `t_user_rank`;
CREATE TABLE `t_user_rank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '等级名称',
  `score` int(8) NOT NULL COMMENT '积分界限',
  `discount` decimal(6,2) NOT NULL COMMENT '折扣百分比',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `index` (`id`,`name`,`discount`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_user_rank
-- ----------------------------
INSERT INTO `t_user_rank` VALUES ('1', '普通会员', '0', '1.00', '1');
INSERT INTO `t_user_rank` VALUES ('2', '一级会员', '2000', '0.95', '1');
INSERT INTO `t_user_rank` VALUES ('3', '二级会员', '5000', '0.90', '1');
INSERT INTO `t_user_rank` VALUES ('4', 'VIP会员', '10000', '0.85', '1');
INSERT INTO `t_user_rank` VALUES ('5', '钻石会员', '100000', '0.80', '1');
INSERT INTO `t_user_rank` VALUES ('6', '超级会员', '10000000', '0.50', '1');

-- ----------------------------
-- Procedure structure for proc_batch_insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_batch_insert`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_batch_insert`()
BEGIN
DECLARE pre_name BIGINT;
DECLARE ageVal INT;
DECLARE i INT;
SET pre_name=187635267;
SET ageVal=100;
SET i=1;
WHILE i < 10000 DO
		INSERT INTO t_user(`name`,age,create_time,update_time) VALUES(CONCAT(pre_name,'@qq.com'),(ageVal+1)%30,NOW(),NOW());
SET pre_name=pre_name+100;
SET i=i+1;
END WHILE;
END
;;
DELIMITER ;
