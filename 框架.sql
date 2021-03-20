/*
Navicat MySQL Data Transfer

Source Server         : BD
Source Server Version : 50726
Source Host           : 127.0.0.1:3306
Source Database       : rtmp

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-03-10 11:57:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for a_admins
-- ----------------------------
DROP TABLE IF EXISTS `a_admins`;
CREATE TABLE `a_admins` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `super` tinyint(4) DEFAULT NULL,
  `roleids` varchar(255) DEFAULT NULL,
  `departid` smallint(6) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `weixin` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `creatid` int(11) DEFAULT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `logintime` int(11) NOT NULL DEFAULT '0',
  `logintimes` int(11) NOT NULL DEFAULT '0',
  `loginip` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `alias` varchar(255) DEFAULT NULL,
  `regtime` int(11) NOT NULL DEFAULT '0',
  `regip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminid`),
  UNIQUE KEY `adminname` (`adminname`),
  KEY `adminid` (`adminid`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_admins
-- ----------------------------
INSERT INTO `a_admins` VALUES ('19', 'admin', 'ff5893a8668fc973b91a4ebc61cb7ab1', '0', '1', '', null, '', '', '', '', '', '', null, null, '0', '1615348387', '23', '127.0.0.1', '', '0', null, '0', null);

-- ----------------------------
-- Table structure for a_admins_departs
-- ----------------------------
DROP TABLE IF EXISTS `a_admins_departs`;
CREATE TABLE `a_admins_departs` (
  `departid` smallint(6) NOT NULL AUTO_INCREMENT,
  `departname` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `parentid` smallint(6) DEFAULT NULL,
  `depth` smallint(6) DEFAULT NULL,
  `orders` smallint(6) DEFAULT NULL,
  `creatid` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`departid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_admins_departs
-- ----------------------------

-- ----------------------------
-- Table structure for a_admins_log
-- ----------------------------
DROP TABLE IF EXISTS `a_admins_log`;
CREATE TABLE `a_admins_log` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `opuser` varbinary(255) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `dowhat` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `param` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM AUTO_INCREMENT=6705 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_admins_log
-- ----------------------------

-- ----------------------------
-- Table structure for a_admins_roles
-- ----------------------------
DROP TABLE IF EXISTS `a_admins_roles`;
CREATE TABLE `a_admins_roles` (
  `roleid` smallint(6) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) DEFAULT NULL,
  `parentid` smallint(6) NOT NULL DEFAULT '0' COMMENT '0',
  `depath` smallint(6) DEFAULT NULL,
  `orders` smallint(6) DEFAULT '9999',
  `creatid` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `mods` varchar(255) DEFAULT NULL,
  `profiles` text,
  PRIMARY KEY (`roleid`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_admins_roles
-- ----------------------------

-- ----------------------------
-- Table structure for a_asyn_key
-- ----------------------------
DROP TABLE IF EXISTS `a_asyn_key`;
CREATE TABLE `a_asyn_key` (
  `index` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=634 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of a_asyn_key
-- ----------------------------

-- ----------------------------
-- Table structure for a_backstage_menu
-- ----------------------------
DROP TABLE IF EXISTS `a_backstage_menu`;
CREATE TABLE `a_backstage_menu` (
  `catid` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(255) DEFAULT NULL,
  `depth` int(11) DEFAULT '1',
  `url` varchar(255) DEFAULT NULL COMMENT 'c,a,',
  `parentid` int(11) NOT NULL DEFAULT '0',
  `orders` int(11) NOT NULL DEFAULT '99',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `mod` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `group` varchar(255) DEFAULT 'admin',
  `addtime` int(11) DEFAULT NULL,
  `creatid` int(11) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=478 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_backstage_menu
-- ----------------------------
INSERT INTO `a_backstage_menu` VALUES ('306', '系统管理', '1', null, '0', '99', '0', 'frame', 'run', 'admin', '1473244697', '19');
INSERT INTO `a_backstage_menu` VALUES ('310', '账号管理', '1', null, '0', '99', '0', 'user', 'run', 'admin', '1473244850', '19');
INSERT INTO `a_backstage_menu` VALUES ('318', '系统设置', '2', null, '306', '99', '0', 'siteset', 'run', 'admin', '1476746005', '19');
INSERT INTO `a_backstage_menu` VALUES ('319', '系统设置', '3', null, '318', '1', '0', 'siteset', 'run', 'admin', '1476746043', '19');
INSERT INTO `a_backstage_menu` VALUES ('326', '用户管理', '2', null, '310', '99', '0', 'user', 'run', 'admin', '1476746452', '19');
INSERT INTO `a_backstage_menu` VALUES ('327', '所有用户', '3', null, '326', '99', '0', 'user', 'run', 'admin', '1476746465', '19');
INSERT INTO `a_backstage_menu` VALUES ('328', '锁定用户', '3', null, '326', '99', '0', 'user', 'black', 'admin', '1476746474', '19');
INSERT INTO `a_backstage_menu` VALUES ('372', '管理员管理', '2', null, '306', '99', '0', 'admins', 'run', 'admin', '1476747568', '19');
INSERT INTO `a_backstage_menu` VALUES ('382', '角色管理', '3', null, '372', '99', '0', 'role', 'run', 'admin', '1476753682', '19');
INSERT INTO `a_backstage_menu` VALUES ('383', '创建角色', '3', null, '372', '99', '0', 'role', 'add', 'admin', '1476753693', '19');
INSERT INTO `a_backstage_menu` VALUES ('381', '系统信息', '3', null, '318', '0', '0', 'frame', 'main', 'admin', '1476751865', '19');
INSERT INTO `a_backstage_menu` VALUES ('384', '管理员列表', '3', null, '372', '99', '0', 'admins', 'run', 'admin', '1476753704', '19');
INSERT INTO `a_backstage_menu` VALUES ('385', '添加管理员', '3', null, '372', '99', '0', 'admins', 'add', 'admin', '1476753714', '19');
INSERT INTO `a_backstage_menu` VALUES ('386', '修改密码', '3', null, '372', '99', '0', 'admins', 'cgthispwd', 'admin', '1476753748', '19');
INSERT INTO `a_backstage_menu` VALUES ('447', '其他设置', '3', null, '318', '99', '0', 'siteset', 'order', 'admin', '1481695840', '19');

-- ----------------------------
-- Table structure for a_cache
-- ----------------------------
DROP TABLE IF EXISTS `a_cache`;
CREATE TABLE `a_cache` (
  `key` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`key`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_cache
-- ----------------------------
INSERT INTO `a_cache` VALUES ('options', 'YTozOntzOjQ6InRpbWUiO2k6MTYxNTM0Mjk2MjtzOjc6InRpbWVvdXQiO2k6MTYxNTM0NjU2MztzOjQ6ImRhdGEiO2E6NDg6e2k6MDthOjg6e3M6MTA6Im9wdGlvbm5hbWUiO3M6OToic2l0ZV9uYW1lIjtzOjExOiJvcHRpb252YWx1ZSI7czoxNToiQVBJ566h55CG5bmz5Y+wIjtzOjQ6ImRlc2MiO047czo0OiJuYW1lIjtzOjEyOiLnq5nngrnlkI3np7AiO3M6Njoib3JkZXJzIjtzOjE6IjEiO3M6ODoiaWRlbnRpZnkiO3M6Nzoic2l0ZXNldCI7czo4OiJodG1sdHlwZSI7czoxOiIxIjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6MTthOjg6e3M6MTA6Im9wdGlvbm5hbWUiO3M6MTY6InNpdGVfZGVzY3JpcHRpb24iO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjA6IiI7czo0OiJkZXNjIjtzOjM1OiLlpJrkuKrkvb/nlKjoi7HmlofnmoTigJx84oCd5YiG5YmyICI7czo0OiJuYW1lIjtzOjEyOiLmj4/ov7Dkv6Hmga8iO3M6Njoib3JkZXJzIjtzOjE6IjQiO3M6ODoiaWRlbnRpZnkiO3M6Mzoic2VvIjtzOjg6Imh0bWx0eXBlIjtzOjE6IjMiO3M6NDoiZmxhZyI7czoxOiIwIjt9aToyO2E6ODp7czoxMDoib3B0aW9ubmFtZSI7czo4OiJzaXRlX2ljcCI7czoxMToib3B0aW9udmFsdWUiO3M6MjI6Iua4nUlDUOWkhzE4MDAzNDA15Y+3LTEiO3M6NDoiZGVzYyI7czo0ODoi5L6L5aaC77yaeHh4eHh45pyJ6ZmQ5YWs5Y+4L+mygUlDUOWkh3h4eHh4eHjlj7cgIjtzOjQ6Im5hbWUiO3M6MTY6IuWFrOWPuC/lpIfmoYjlj7ciO3M6Njoib3JkZXJzIjtzOjE6IjUiO3M6ODoiaWRlbnRpZnkiO3M6Nzoic2l0ZXNldCI7czo4OiJodG1sdHlwZSI7czoxOiIxIjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6MzthOjg6e3M6MTA6Im9wdGlvbm5hbWUiO3M6MTM6InNpdGVfa2V5d29yZHMiO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjA6IiI7czo0OiJkZXNjIjtzOjM1OiIg5aSa5Liq5L2/55So6Iux5paH55qE4oCcfOKAneWIhuWJsiI7czo0OiJuYW1lIjtzOjk6IuWFs+mUruWtlyI7czo2OiJvcmRlcnMiO3M6MToiNCI7czo4OiJpZGVudGlmeSI7czozOiJzZW8iO3M6ODoiaHRtbHR5cGUiO3M6MToiMyI7czo0OiJmbGFnIjtzOjE6IjAiO31pOjQ7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjc6InJld3JpdGUiO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjA6IiI7czo0OiJkZXNjIjtOO3M6NDoibmFtZSI7czoxNToi5Lyq6Z2Z5oCB5byA5YWzIjtzOjY6Im9yZGVycyI7czoxOiIwIjtzOjg6ImlkZW50aWZ5IjtzOjM6InNlbyI7czo4OiJodG1sdHlwZSI7czoxOiI0IjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6NTthOjg6e3M6MTA6Im9wdGlvbm5hbWUiO3M6ODoic2l0ZV91cmwiO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjA6IiI7czo0OiJkZXNjIjtOO3M6NDoibmFtZSI7czoxMjoi56uZ54K55Z+f5ZCNIjtzOjY6Im9yZGVycyI7czoxOiIyIjtzOjg6ImlkZW50aWZ5IjtzOjc6InNpdGVzZXQiO3M6ODoiaHRtbHR5cGUiO3M6MToiMSI7czo0OiJmbGFnIjtzOjE6IjAiO31pOjY7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjk6ImFub255bW91cyI7czoxMToib3B0aW9udmFsdWUiO3M6MDoiIjtzOjQ6ImRlc2MiO3M6MDoiIjtzOjQ6Im5hbWUiO3M6MTI6IuWFgeiuuOWMv+WQjSI7czo2OiJvcmRlcnMiO3M6MToiMSI7czo4OiJpZGVudGlmeSI7czo3OiJ1c2Vyc2V0IjtzOjg6Imh0bWx0eXBlIjtzOjE6IjQiO3M6NDoiZmxhZyI7czoxOiIwIjt9aTo3O2E6ODp7czoxMDoib3B0aW9ubmFtZSI7czoxNToidXNlcl9oZWFkX3dvbWFuIjtzOjExOiJvcHRpb252YWx1ZSI7czowOiIiO3M6NDoiZGVzYyI7TjtzOjQ6Im5hbWUiO3M6MTU6IuWls+S8muWRmOWktOWDjyI7czo2OiJvcmRlcnMiO3M6MToiMiI7czo4OiJpZGVudGlmeSI7czo3OiJ1c2Vyc2V0IjtzOjg6Imh0bWx0eXBlIjtzOjE6IjIiO3M6NDoiZmxhZyI7czoxOiIwIjt9aTo4O2E6ODp7czoxMDoib3B0aW9ubmFtZSI7czoxMzoidXNlcl9oZWFkX21hbiI7czoxMToib3B0aW9udmFsdWUiO3M6MDoiIjtzOjQ6ImRlc2MiO047czo0OiJuYW1lIjtzOjE1OiLnlLfkvJrlkZjlpLTlg48iO3M6Njoib3JkZXJzIjtzOjE6IjIiO3M6ODoiaWRlbnRpZnkiO3M6NzoidXNlcnNldCI7czo4OiJodG1sdHlwZSI7czoxOiIyIjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6OTthOjg6e3M6MTA6Im9wdGlvbm5hbWUiO3M6MTY6InVzZXJfaGVhZF91bmtub3ciO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjA6IiI7czo0OiJkZXNjIjtOO3M6NDoibmFtZSI7czoxODoi5oCn5Yir5pyq55+l5aS05YOPIjtzOjY6Im9yZGVycyI7czoxOiIyIjtzOjg6ImlkZW50aWZ5IjtzOjc6InVzZXJzZXQiO3M6ODoiaHRtbHR5cGUiO3M6MToiMiI7czo0OiJmbGFnIjtzOjE6IjAiO31pOjEwO2E6ODp7czoxMDoib3B0aW9ubmFtZSI7czo4OiJmaWxldHlwZSI7czoxMToib3B0aW9udmFsdWUiO3M6MTU6ImpwZ3xibXB8Z2lmfHBuZyI7czo0OiJkZXNjIjtzOjM1OiLlpJrkuKrkvb/nlKjoi7HmlofnmoTigJx84oCd5YiG5YmyICI7czo0OiJuYW1lIjtzOjEyOiLkuIrkvKDnsbvlnosiO3M6Njoib3JkZXJzIjtzOjE6IjIiO3M6ODoiaWRlbnRpZnkiO3M6NToidXBzZXQiO3M6ODoiaHRtbHR5cGUiO3M6MToiMSI7czo0OiJmbGFnIjtzOjE6IjAiO31pOjExO2E6ODp7czoxMDoib3B0aW9ubmFtZSI7czoxMDoidXBmaWxlc2l6ZSI7czoxMToib3B0aW9udmFsdWUiO3M6NDoiNTAwMCI7czo0OiJkZXNjIjtzOjg6IuWNleS9jUtCIjtzOjQ6Im5hbWUiO3M6MTg6IuWkp+Wwj+S4iuS8oOWkp+WwjyI7czo2OiJvcmRlcnMiO3M6MToiMCI7czo4OiJpZGVudGlmeSI7czo1OiJ1cHNldCI7czo4OiJodG1sdHlwZSI7czoxOiIxIjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6MTI7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjEwOiJ1cGZpbGVwYXRoIjtzOjExOiJvcHRpb252YWx1ZSI7czoxMToiL2RhdGEvaW1hZ2UiO3M6NDoiZGVzYyI7TjtzOjQ6Im5hbWUiO3M6MTI6IuS4iuS8oOebruW9lSI7czo2OiJvcmRlcnMiO3M6MToiMCI7czo4OiJpZGVudGlmeSI7czo1OiJ1cHNldCI7czo4OiJodG1sdHlwZSI7czoxOiIxIjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6MTM7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjEwOiJ0aHVtYndpZHRoIjtzOjExOiJvcHRpb252YWx1ZSI7czozOiIxMDAiO3M6NDoiZGVzYyI7TjtzOjQ6Im5hbWUiO3M6MTU6Iue8qeeVpeWbvuWuveW6piI7czo2OiJvcmRlcnMiO3M6MToiMCI7czo4OiJpZGVudGlmeSI7czo1OiJ1cHNldCI7czo4OiJodG1sdHlwZSI7czoxOiIxIjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6MTQ7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjExOiJ0aHVtYmhlaWdodCI7czoxMToib3B0aW9udmFsdWUiO3M6MzoiMTAwIjtzOjQ6ImRlc2MiO047czo0OiJuYW1lIjtzOjE1OiLnvKnnlaXlm77pq5jluqYiO3M6Njoib3JkZXJzIjtzOjE6IjAiO3M6ODoiaWRlbnRpZnkiO3M6NToidXBzZXQiO3M6ODoiaHRtbHR5cGUiO3M6MToiMSI7czo0OiJmbGFnIjtzOjE6IjAiO31pOjE1O2E6ODp7czoxMDoib3B0aW9ubmFtZSI7czo4OiJjdXJyZW5jeSI7czoxMToib3B0aW9udmFsdWUiO3M6MDoiIjtzOjQ6ImRlc2MiO047czo0OiJuYW1lIjtzOjEyOiLluIHnp43nrKblj7ciO3M6Njoib3JkZXJzIjtzOjE6IjQiO3M6ODoiaWRlbnRpZnkiO3M6Nzoic2l0ZXNldCI7czo4OiJodG1sdHlwZSI7czoxOiIxIjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6MTY7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjk6ImNvcHlyaWdodCI7czoxMToib3B0aW9udmFsdWUiO3M6MzM6IsKpMjAyMCDpnJPlhYnnvZHnu5wgd3d3Lm5nMTY5LmNvbSI7czo0OiJkZXNjIjtOO3M6NDoibmFtZSI7czoxMjoi54mI5p2D5L+h5oGvIjtzOjY6Im9yZGVycyI7czoyOiIxMyI7czo4OiJpZGVudGlmeSI7czo3OiJzaXRlc2V0IjtzOjg6Imh0bWx0eXBlIjtzOjE6IjMiO3M6NDoiZmxhZyI7czoxOiIwIjt9aToxNzthOjg6e3M6MTA6Im9wdGlvbm5hbWUiO3M6MTE6InRpbWVvdXRjb2RlIjtzOjExOiJvcHRpb252YWx1ZSI7czowOiIiO3M6NDoiZGVzYyI7TjtzOjQ6Im5hbWUiO3M6MTI6IumHjeWPkemXtOmalCI7czo2OiJvcmRlcnMiO3M6MToiMCI7czo4OiJpZGVudGlmeSI7czo2OiJzbXNzZXQiO3M6ODoiaHRtbHR5cGUiO3M6NToiaW5wdXQiO3M6NDoiZmxhZyI7czoxOiIwIjt9aToxODthOjg6e3M6MTA6Im9wdGlvbm5hbWUiO3M6MTI6InNlbmRwYXNzd29yZCI7czoxMToib3B0aW9udmFsdWUiO3M6MDoiIjtzOjQ6ImRlc2MiO047czo0OiJuYW1lIjtOO3M6Njoib3JkZXJzIjtzOjE6IjAiO3M6ODoiaWRlbnRpZnkiO3M6NzoibWFpbHNldCI7czo4OiJodG1sdHlwZSI7czo1OiJpbnB1dCI7czo0OiJmbGFnIjtzOjE6IjAiO31pOjE5O2E6ODp7czoxMDoib3B0aW9ubmFtZSI7czo0OiJwb3J0IjtzOjExOiJvcHRpb252YWx1ZSI7czowOiIiO3M6NDoiZGVzYyI7TjtzOjQ6Im5hbWUiO047czo2OiJvcmRlcnMiO3M6MToiMCI7czo4OiJpZGVudGlmeSI7czo3OiJtYWlsc2V0IjtzOjg6Imh0bWx0eXBlIjtzOjU6ImlucHV0IjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6MjA7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjg6InNlbmR0eXBlIjtzOjExOiJvcHRpb252YWx1ZSI7czowOiIiO3M6NDoiZGVzYyI7TjtzOjQ6Im5hbWUiO047czo2OiJvcmRlcnMiO3M6MToiMCI7czo4OiJpZGVudGlmeSI7czo3OiJtYWlsc2V0IjtzOjg6Imh0bWx0eXBlIjtzOjU6ImlucHV0IjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6MjE7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjQ6InNtdHAiO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjA6IiI7czo0OiJkZXNjIjtOO3M6NDoibmFtZSI7TjtzOjY6Im9yZGVycyI7czoxOiIwIjtzOjg6ImlkZW50aWZ5IjtzOjc6Im1haWxzZXQiO3M6ODoiaHRtbHR5cGUiO3M6NToiaW5wdXQiO3M6NDoiZmxhZyI7czoxOiIwIjt9aToyMjthOjg6e3M6MTA6Im9wdGlvbm5hbWUiO3M6ODoic2VuZG1haWwiO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjA6IiI7czo0OiJkZXNjIjtOO3M6NDoibmFtZSI7TjtzOjY6Im9yZGVycyI7czoxOiIwIjtzOjg6ImlkZW50aWZ5IjtzOjc6Im1haWxzZXQiO3M6ODoiaHRtbHR5cGUiO3M6NToiaW5wdXQiO3M6NDoiZmxhZyI7czoxOiIwIjt9aToyMzthOjg6e3M6MTA6Im9wdGlvbm5hbWUiO3M6ODoic2VuZG5hbWUiO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjA6IiI7czo0OiJkZXNjIjtOO3M6NDoibmFtZSI7TjtzOjY6Im9yZGVycyI7czoxOiIwIjtzOjg6ImlkZW50aWZ5IjtzOjc6Im1haWxzZXQiO3M6ODoiaHRtbHR5cGUiO3M6NToiaW5wdXQiO3M6NDoiZmxhZyI7czoxOiIwIjt9aToyNDthOjg6e3M6MTA6Im9wdGlvbm5hbWUiO3M6Nzoic21zZmxhZyI7czoxMToib3B0aW9udmFsdWUiO3M6MDoiIjtzOjQ6ImRlc2MiO047czo0OiJuYW1lIjtOO3M6Njoib3JkZXJzIjtzOjE6IjAiO3M6ODoiaWRlbnRpZnkiO3M6Njoic21zc2V0IjtzOjg6Imh0bWx0eXBlIjtzOjU6ImlucHV0IjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6MjU7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjY6InNtc2tleSI7czoxMToib3B0aW9udmFsdWUiO3M6MDoiIjtzOjQ6ImRlc2MiO047czo0OiJuYW1lIjtOO3M6Njoib3JkZXJzIjtzOjE6IjAiO3M6ODoiaWRlbnRpZnkiO3M6Njoic21zc2V0IjtzOjg6Imh0bWx0eXBlIjtzOjU6ImlucHV0IjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6MjY7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjc6InNtc25hbWUiO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjA6IiI7czo0OiJkZXNjIjtOO3M6NDoibmFtZSI7TjtzOjY6Im9yZGVycyI7czoxOiIwIjtzOjg6ImlkZW50aWZ5IjtzOjY6InNtc3NldCI7czo4OiJodG1sdHlwZSI7czo1OiJpbnB1dCI7czo0OiJmbGFnIjtzOjE6IjAiO31pOjI3O2E6ODp7czoxMDoib3B0aW9ubmFtZSI7czoxMToic21zcGFzc3dvcmQiO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjA6IiI7czo0OiJkZXNjIjtOO3M6NDoibmFtZSI7TjtzOjY6Im9yZGVycyI7czoxOiIwIjtzOjg6ImlkZW50aWZ5IjtzOjY6InNtc3NldCI7czo4OiJodG1sdHlwZSI7czo1OiJpbnB1dCI7czo0OiJmbGFnIjtzOjE6IjAiO31pOjI4O2E6ODp7czoxMDoib3B0aW9ubmFtZSI7czo5OiJzbXNzZW5kZXIiO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjA6IiI7czo0OiJkZXNjIjtOO3M6NDoibmFtZSI7TjtzOjY6Im9yZGVycyI7czoxOiIwIjtzOjg6ImlkZW50aWZ5IjtzOjY6InNtc3NldCI7czo4OiJodG1sdHlwZSI7czo1OiJpbnB1dCI7czo0OiJmbGFnIjtzOjE6IjAiO31pOjI5O2E6ODp7czoxMDoib3B0aW9ubmFtZSI7czoxNToiYnVzaW5lc3NfcmV2aWV3IjtzOjExOiJvcHRpb252YWx1ZSI7czowOiIiO3M6NDoiZGVzYyI7czowOiIiO3M6NDoibmFtZSI7czoxODoi5ZWG5a626Ieq5Yqo5a6h5qC4IjtzOjY6Im9yZGVycyI7czoxOiIwIjtzOjg6ImlkZW50aWZ5IjtzOjc6InVzZXJzZXQiO3M6ODoiaHRtbHR5cGUiO3M6Njoib3B0aW9uIjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6MzA7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjEyOiJhbmRvcmlkX2Rvd24iO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjA6IiI7czo0OiJkZXNjIjtOO3M6NDoibmFtZSI7czoxODoi5a6J5Y2T5LiL6L295Zyw5Z2AIjtzOjY6Im9yZGVycyI7czoyOiI5OSI7czo4OiJpZGVudGlmeSI7czo3OiJzaXRlc2V0IjtzOjg6Imh0bWx0eXBlIjtzOjE6IjEiO3M6NDoiZmxhZyI7czoxOiIwIjt9aTozMTthOjg6e3M6MTA6Im9wdGlvbm5hbWUiO3M6ODoibWFjX2Rvd24iO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjA6IiI7czo0OiJkZXNjIjtOO3M6NDoibmFtZSI7czoxODoi6Iu55p6c5LiL6L295Zyw5Z2AIjtzOjY6Im9yZGVycyI7czoyOiI5OSI7czo4OiJpZGVudGlmeSI7czo3OiJzaXRlc2V0IjtzOjg6Imh0bWx0eXBlIjtzOjE6IjEiO3M6NDoiZmxhZyI7czoxOiIwIjt9aTozMjthOjg6e3M6MTA6Im9wdGlvbm5hbWUiO3M6ODoiYmFua2xpc3QiO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjA6IiI7czo0OiJkZXNjIjtzOjI4OiLpk7booYzku6XpgJflj7fliIblibLigJws4oCdIjtzOjQ6Im5hbWUiO3M6MTU6IuaUr+aMgeeahOmTtuihjCI7czo2OiJvcmRlcnMiO3M6MToiMCI7czo4OiJpZGVudGlmeSI7czo1OiJvcmRlciI7czo4OiJodG1sdHlwZSI7czoxOiIxIjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6MzM7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjEzOiJjb2luX3BhcmVudF8xIjtzOjExOiJvcHRpb252YWx1ZSI7czozOiI1MDAiO3M6NDoiZGVzYyI7TjtzOjQ6Im5hbWUiO3M6MTg6Iuiiq+mCgOivt+iAheWlluWKsSI7czo2OiJvcmRlcnMiO3M6MToiMCI7czo4OiJpZGVudGlmeSI7czoyOiJtMSI7czo4OiJodG1sdHlwZSI7czoxOiIxIjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6MzQ7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjEzOiJjb2luX3BhcmVudF8yIjtzOjExOiJvcHRpb252YWx1ZSI7czozOiI4MDAiO3M6NDoiZGVzYyI7TjtzOjQ6Im5hbWUiO3M6MTk6Iuiiq+mCgOivt+iAheWlluWKsTIiO3M6Njoib3JkZXJzIjtzOjE6IjAiO3M6ODoiaWRlbnRpZnkiO3M6MjoibTIiO3M6ODoiaHRtbHR5cGUiO3M6MToiMSI7czo0OiJmbGFnIjtzOjE6IjAiO31pOjM1O2E6ODp7czoxMDoib3B0aW9ubmFtZSI7czo2OiJjb2luXzIiO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjM6IjIwMCI7czo0OiJkZXNjIjtOO3M6NDoibmFtZSI7czoxOToi5paw5Lq65Lu75Yqh6L6+5YiwMiI7czo2OiJvcmRlcnMiO3M6MToiMCI7czo4OiJpZGVudGlmeSI7czoyOiJtMiI7czo4OiJodG1sdHlwZSI7czoxOiIxIjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6MzY7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjEzOiJjb2luX3BhcmVudF8zIjtzOjExOiJvcHRpb252YWx1ZSI7czo0OiIxMjAwIjtzOjQ6ImRlc2MiO047czo0OiJuYW1lIjtzOjE5OiLooqvpgoDor7fogIXlpZblirEzIjtzOjY6Im9yZGVycyI7czoxOiIwIjtzOjg6ImlkZW50aWZ5IjtzOjI6Im0zIjtzOjg6Imh0bWx0eXBlIjtzOjE6IjEiO3M6NDoiZmxhZyI7czoxOiIwIjt9aTozNzthOjg6e3M6MTA6Im9wdGlvbm5hbWUiO3M6NjoiY29pbl8zIjtzOjExOiJvcHRpb252YWx1ZSI7czozOiI1MDAiO3M6NDoiZGVzYyI7TjtzOjQ6Im5hbWUiO3M6MTk6IuaWsOS6uuS7u+WKoei+vuWIsDMiO3M6Njoib3JkZXJzIjtzOjE6IjAiO3M6ODoiaWRlbnRpZnkiO3M6MjoibTMiO3M6ODoiaHRtbHR5cGUiO3M6MToiMSI7czo0OiJmbGFnIjtzOjE6IjAiO31pOjM4O2E6ODp7czoxMDoib3B0aW9ubmFtZSI7czoxMToiY29pbl90aW1lXzIiO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjE6IjMiO3M6NDoiZGVzYyI7czozOiLlpKkiO3M6NDoibmFtZSI7czoxMzoi5aSp5pWw6ZmQ5Yi2MiI7czo2OiJvcmRlcnMiO3M6MToiMCI7czo4OiJpZGVudGlmeSI7czoyOiJtMiI7czo4OiJodG1sdHlwZSI7czoxOiIxIjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6Mzk7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjExOiJjb2luX3RpbWVfMyI7czoxMToib3B0aW9udmFsdWUiO3M6MjoiMTAiO3M6NDoiZGVzYyI7czozOiLlpKkiO3M6NDoibmFtZSI7czoxMzoi5aSp5pWw6ZmQ5Yi2MyI7czo2OiJvcmRlcnMiO3M6MToiMCI7czo4OiJpZGVudGlmeSI7czoyOiJtMyI7czo4OiJodG1sdHlwZSI7czoxOiIxIjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6NDA7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjE2OiJjb2luX3BhcmVudF9yYXRlIjtzOjExOiJvcHRpb252YWx1ZSI7czoyOiIxNSI7czo0OiJkZXNjIjtzOjE6IiUiO3M6NDoibmFtZSI7czoxMjoi5pS255uK5YiG5ramIjtzOjY6Im9yZGVycyI7czoxOiIwIjtzOjg6ImlkZW50aWZ5IjtzOjI6Im00IjtzOjg6Imh0bWx0eXBlIjtzOjE6IjEiO3M6NDoiZmxhZyI7czoxOiIwIjt9aTo0MTthOjg6e3M6MTA6Im9wdGlvbm5hbWUiO3M6OToiY29pbl9yYXRlIjtzOjExOiJvcHRpb252YWx1ZSI7czo0OiIxMDAwIjtzOjQ6ImRlc2MiO3M6MzY6IuWmguWhq+WGmTEwMDDljbMxMDAw6YeR5biB5YWR5o2iMeWFgyI7czo0OiJuYW1lIjtzOjEyOiLph5HluIHmr5TlgLwiO3M6Njoib3JkZXJzIjtzOjE6IjAiO3M6ODoiaWRlbnRpZnkiO3M6NToib3JkZXIiO3M6ODoiaHRtbHR5cGUiO3M6MToiMSI7czo0OiJmbGFnIjtzOjE6IjAiO31pOjQyO2E6ODp7czoxMDoib3B0aW9ubmFtZSI7czoxNDoic2VsZl9yZWFkX3RpbWUiO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjE6IjEiO3M6NDoiZGVzYyI7TjtzOjQ6Im5hbWUiO3M6MTg6IuiHquW3semYheivu+aXtumXtCI7czo2OiJvcmRlcnMiO3M6MToiMCI7czo4OiJpZGVudGlmeSI7czo1OiJvcmRlciI7czo4OiJodG1sdHlwZSI7czoxOiIyIjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6NDM7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjE1OiJzaGFyZV9yZWFkX3RpbWUiO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjE6IjIiO3M6NDoiZGVzYyI7TjtzOjQ6Im5hbWUiO3M6MTk6IiDliIbkuqvpmIXor7vml7bpl7QiO3M6Njoib3JkZXJzIjtzOjE6IjAiO3M6ODoiaWRlbnRpZnkiO3M6NToib3JkZXIiO3M6ODoiaHRtbHR5cGUiO3M6MToiMSI7czo0OiJmbGFnIjtzOjE6IjAiO31pOjQ0O2E6ODp7czoxMDoib3B0aW9ubmFtZSI7czo5OiJhd29yZF9udW0iO3M6MTE6Im9wdGlvbnZhbHVlIjtzOjE6IjMiO3M6NDoiZGVzYyI7TjtzOjQ6Im5hbWUiO3M6MzY6IuWQjOS4gOaWh+eroOmYheivu+WlluWKseS4iumZkOasoeaVsCI7czo2OiJvcmRlcnMiO3M6MToiMCI7czo4OiJpZGVudGlmeSI7czo1OiJvcmRlciI7czo4OiJodG1sdHlwZSI7czoxOiIxIjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6NDU7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjE0OiJzZWxmX3JlYWRfY29pbiI7czoxMToib3B0aW9udmFsdWUiO3M6MToiNSI7czo0OiJkZXNjIjtOO3M6NDoibmFtZSI7czoyNDoi6Ieq5bex6ZiF6K+75aWW5Yqx6YeR5biBIjtzOjY6Im9yZGVycyI7czoxOiIwIjtzOjg6ImlkZW50aWZ5IjtzOjU6Im9yZGVyIjtzOjg6Imh0bWx0eXBlIjtzOjE6IjEiO3M6NDoiZmxhZyI7czoxOiIwIjt9aTo0NjthOjg6e3M6MTA6Im9wdGlvbm5hbWUiO3M6MTU6InNoYXJlX3JlYWRfY29pbiI7czoxMToib3B0aW9udmFsdWUiO3M6MjoiMzAiO3M6NDoiZGVzYyI7TjtzOjQ6Im5hbWUiO3M6MjQ6IuWIhuS6q+mYheivu+WlluWKsemHkeW4gSI7czo2OiJvcmRlcnMiO3M6MToiMCI7czo4OiJpZGVudGlmeSI7czo1OiJvcmRlciI7czo4OiJodG1sdHlwZSI7czoxOiIxIjtzOjQ6ImZsYWciO3M6MToiMCI7fWk6NDc7YTo4OntzOjEwOiJvcHRpb25uYW1lIjtzOjY6ImNvaW5fMSI7czoxMToib3B0aW9udmFsdWUiO3M6MzoiODAwIjtzOjQ6ImRlc2MiO047czo0OiJuYW1lIjtzOjE4OiLmlrDkurrku7vliqHlpZblirEiO3M6Njoib3JkZXJzIjtzOjE6IjEiO3M6ODoiaWRlbnRpZnkiO3M6MjoibTEiO3M6ODoiaHRtbHR5cGUiO3M6MToiMSI7czo0OiJmbGFnIjtzOjE6IjAiO319fQ==');

-- ----------------------------
-- Table structure for a_category
-- ----------------------------
DROP TABLE IF EXISTS `a_category`;
CREATE TABLE `a_category` (
  `catid` int(10) NOT NULL AUTO_INCREMENT,
  `catname` varchar(255) DEFAULT NULL,
  `parentid` int(10) DEFAULT '0',
  `depth` int(10) DEFAULT '0',
  `orders` int(10) DEFAULT '0',
  `dirpath` varchar(50) DEFAULT NULL,
  `metatitle` varchar(255) DEFAULT NULL,
  `metakeyword` varchar(255) DEFAULT NULL,
  `metadesc` varchar(255) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  `indextpl` varchar(255) DEFAULT NULL,
  `listtpl` varchar(255) DEFAULT NULL,
  `detailtpl` varchar(255) DEFAULT NULL,
  `addtime` int(10) DEFAULT '0',
  `creatid` int(10) DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_category
-- ----------------------------

-- ----------------------------
-- Table structure for a_chat
-- ----------------------------
DROP TABLE IF EXISTS `a_chat`;
CREATE TABLE `a_chat` (
  `chatid` int(11) NOT NULL AUTO_INCREMENT COMMENT '会话id',
  `usernum` int(11) NOT NULL DEFAULT '0' COMMENT '用户量',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '会话创建时间',
  `chatname` varchar(255) DEFAULT NULL COMMENT '会话别名',
  PRIMARY KEY (`chatid`),
  KEY `usernum` (`usernum`),
  KEY `chatid` (`chatid`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=483 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_chat
-- ----------------------------

-- ----------------------------
-- Table structure for a_chat_msg
-- ----------------------------
DROP TABLE IF EXISTS `a_chat_msg`;
CREATE TABLE `a_chat_msg` (
  `msgid` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `chatid` int(11) NOT NULL DEFAULT '0' COMMENT '会话id',
  `comeid` int(11) NOT NULL DEFAULT '0' COMMENT '发送方用户id',
  `sendtime` int(11) NOT NULL DEFAULT '0' COMMENT '发送时间',
  `readflag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `content` text COMMENT '消息内容',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：文本，2：图片，3：动图，4：语音，5：视频，6：表情，7：链接，8礼物',
  `resid` int(11) NOT NULL DEFAULT '0' COMMENT '资源id',
  `url` varchar(255) DEFAULT '0' COMMENT '资源url',
  `murl` varchar(255) DEFAULT NULL COMMENT '小图url',
  PRIMARY KEY (`msgid`),
  KEY `msgid` (`msgid`),
  KEY `chatid` (`chatid`),
  KEY `comeid` (`comeid`),
  KEY `sendtime` (`sendtime`),
  KEY `readflag` (`readflag`)
) ENGINE=MyISAM AUTO_INCREMENT=433 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_chat_msg
-- ----------------------------

-- ----------------------------
-- Table structure for a_chat_user
-- ----------------------------
DROP TABLE IF EXISTS `a_chat_user`;
CREATE TABLE `a_chat_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chatid` int(11) NOT NULL DEFAULT '0' COMMENT '会话id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `jointime` int(11) NOT NULL DEFAULT '0' COMMENT '加入会话的时间',
  `lastsendtime` int(11) NOT NULL DEFAULT '0' COMMENT '上次回复时间',
  PRIMARY KEY (`id`),
  KEY `chatid` (`chatid`),
  KEY `uid` (`uid`),
  KEY `jointime` (`jointime`)
) ENGINE=MyISAM AUTO_INCREMENT=965 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_chat_user
-- ----------------------------

-- ----------------------------
-- Table structure for a_cheatlist
-- ----------------------------
DROP TABLE IF EXISTS `a_cheatlist`;
CREATE TABLE `a_cheatlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `touid` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `u1name` varchar(255) DEFAULT NULL COMMENT '用户1名称',
  `u2name` varchar(255) DEFAULT NULL COMMENT '用户2名称',
  `u1bzhu` varchar(255) DEFAULT NULL COMMENT '用户1备注',
  `u2bzhu` varchar(255) DEFAULT NULL COMMENT '用户2备注',
  `chtime` int(10) unsigned NOT NULL DEFAULT '0',
  `u1num` int(11) NOT NULL DEFAULT '0',
  `u2num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `touid` (`touid`),
  KEY `id` (`id`),
  KEY `chtime` (`chtime`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_cheatlist
-- ----------------------------

-- ----------------------------
-- Table structure for a_cheatmsg
-- ----------------------------
DROP TABLE IF EXISTS `a_cheatmsg`;
CREATE TABLE `a_cheatmsg` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL DEFAULT '0',
  `sendtime` int(11) NOT NULL DEFAULT '0',
  `fid` int(11) NOT NULL DEFAULT '0',
  `msg` text NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `id` (`id`),
  KEY `fid` (`fid`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=7710 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_cheatmsg
-- ----------------------------

-- ----------------------------
-- Table structure for a_ip
-- ----------------------------
DROP TABLE IF EXISTS `a_ip`;
CREATE TABLE `a_ip` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `start_ip` varchar(50) DEFAULT NULL,
  `end_ip` varchar(50) DEFAULT NULL,
  `province_city` varchar(50) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_start_ip` (`start_ip`),
  KEY `index_end_ip` (`end_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_ip
-- ----------------------------

-- ----------------------------
-- Table structure for a_iplog
-- ----------------------------
DROP TABLE IF EXISTS `a_iplog`;
CREATE TABLE `a_iplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=354 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_iplog
-- ----------------------------

-- ----------------------------
-- Table structure for a_keyword
-- ----------------------------
DROP TABLE IF EXISTS `a_keyword`;
CREATE TABLE `a_keyword` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(255) NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `elite` tinyint(1) NOT NULL DEFAULT '0',
  `catids` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `word` (`word`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for a_keyword_log
-- ----------------------------
DROP TABLE IF EXISTS `a_keyword_log`;
CREATE TABLE `a_keyword_log` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `stime` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM AUTO_INCREMENT=20309 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_keyword_log
-- ----------------------------

-- ----------------------------
-- Table structure for a_loginlog
-- ----------------------------
DROP TABLE IF EXISTS `a_loginlog`;
CREATE TABLE `a_loginlog` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_loginlog
-- ----------------------------

-- ----------------------------
-- Table structure for a_logistemp
-- ----------------------------
DROP TABLE IF EXISTS `a_logistemp`;
CREATE TABLE `a_logistemp` (
  `logistempid` int(11) NOT NULL AUTO_INCREMENT,
  `logisname` varchar(255) NOT NULL,
  `muid` int(11) NOT NULL,
  `ltype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否包邮 0否；1是',
  `pricingmode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '计价方式：0按件数    1按重量    2按体积',
  `kd` tinyint(1) NOT NULL DEFAULT '0',
  `ems` tinyint(1) NOT NULL DEFAULT '0',
  `py` tinyint(1) NOT NULL DEFAULT '0',
  `kdnum` int(11) unsigned NOT NULL DEFAULT '0',
  `kdmoney` int(10) NOT NULL DEFAULT '0',
  `kdnummore` int(11) NOT NULL DEFAULT '0',
  `kdmoneymore` int(10) unsigned NOT NULL DEFAULT '0',
  `emsnum` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '0',
  `emsmoney` int(10) unsigned NOT NULL DEFAULT '0',
  `emsnummore` int(11) unsigned NOT NULL DEFAULT '0',
  `emsmoneymore` int(10) unsigned NOT NULL DEFAULT '0',
  `pynum` int(11) NOT NULL DEFAULT '0',
  `pymoney` int(10) NOT NULL DEFAULT '0',
  `pynummore` int(11) NOT NULL DEFAULT '0',
  `pymoneymore` int(10) NOT NULL DEFAULT '0',
  `provinceid` int(11) NOT NULL DEFAULT '0',
  `cityid` int(11) NOT NULL DEFAULT '0',
  `areaid` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`logistempid`),
  KEY `logistempid` (`logistempid`,`muid`,`addtime`),
  FULLTEXT KEY `logisname` (`logisname`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_logistemp
-- ----------------------------

-- ----------------------------
-- Table structure for a_options
-- ----------------------------
DROP TABLE IF EXISTS `a_options`;
CREATE TABLE `a_options` (
  `optionname` varchar(50) NOT NULL,
  `optionvalue` text,
  `desc` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `orders` int(11) DEFAULT '0',
  `identify` varchar(255) DEFAULT NULL,
  `htmltype` varchar(255) DEFAULT '1',
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`optionname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_options
-- ----------------------------
INSERT INTO `a_options` VALUES ('site_name', 'API管理平台', null, '站点名称', '1', 'siteset', '1', '0');
INSERT INTO `a_options` VALUES ('site_description', '', '多个使用英文的“|”分割 ', '描述信息', '4', 'seo', '3', '0');
INSERT INTO `a_options` VALUES ('site_icp', '渝ICP备18003405号-1', '例如：xxxxxx有限公司/鲁ICP备xxxxxxx号 ', '公司/备案号', '5', 'siteset', '1', '0');
INSERT INTO `a_options` VALUES ('site_keywords', '', ' 多个使用英文的“|”分割', '关键字', '4', 'seo', '3', '0');
INSERT INTO `a_options` VALUES ('rewrite', '', null, '伪静态开关', '0', 'seo', '4', '0');
INSERT INTO `a_options` VALUES ('site_url', '', null, '站点域名', '2', 'siteset', '1', '0');
INSERT INTO `a_options` VALUES ('anonymous', '', '', '允许匿名', '1', 'userset', '4', '0');
INSERT INTO `a_options` VALUES ('user_head_woman', '', null, '女会员头像', '2', 'userset', '2', '0');
INSERT INTO `a_options` VALUES ('user_head_man', '', null, '男会员头像', '2', 'userset', '2', '0');
INSERT INTO `a_options` VALUES ('user_head_unknow', '', null, '性别未知头像', '2', 'userset', '2', '0');
INSERT INTO `a_options` VALUES ('filetype', 'jpg|bmp|gif|png', '多个使用英文的“|”分割 ', '上传类型', '2', 'upset', '1', '0');
INSERT INTO `a_options` VALUES ('upfilesize', '5000', '单位KB', '大小上传大小', '0', 'upset', '1', '0');
INSERT INTO `a_options` VALUES ('upfilepath', '/data/image', null, '上传目录', '0', 'upset', '1', '0');
INSERT INTO `a_options` VALUES ('thumbwidth', '100', null, '缩略图宽度', '0', 'upset', '1', '0');
INSERT INTO `a_options` VALUES ('thumbheight', '100', null, '缩略图高度', '0', 'upset', '1', '0');
INSERT INTO `a_options` VALUES ('currency', '', null, '币种符号', '4', 'siteset', '1', '0');
INSERT INTO `a_options` VALUES ('copyright', '©2020 霓光网络 www.ng169.com', null, '版权信息', '13', 'siteset', '3', '0');
INSERT INTO `a_options` VALUES ('timeoutcode', '', null, '重发间隔', '0', 'smsset', 'input', '0');
INSERT INTO `a_options` VALUES ('sendpassword', '', null, null, '0', 'mailset', 'input', '0');
INSERT INTO `a_options` VALUES ('port', '', null, null, '0', 'mailset', 'input', '0');
INSERT INTO `a_options` VALUES ('sendtype', '', null, null, '0', 'mailset', 'input', '0');
INSERT INTO `a_options` VALUES ('smtp', '', null, null, '0', 'mailset', 'input', '0');
INSERT INTO `a_options` VALUES ('sendmail', '', null, null, '0', 'mailset', 'input', '0');
INSERT INTO `a_options` VALUES ('sendname', '', null, null, '0', 'mailset', 'input', '0');
INSERT INTO `a_options` VALUES ('smsflag', '', null, null, '0', 'smsset', 'input', '0');
INSERT INTO `a_options` VALUES ('smskey', '', null, null, '0', 'smsset', 'input', '0');
INSERT INTO `a_options` VALUES ('smsname', '', null, null, '0', 'smsset', 'input', '0');
INSERT INTO `a_options` VALUES ('smspassword', '', null, null, '0', 'smsset', 'input', '0');
INSERT INTO `a_options` VALUES ('smssender', '', null, null, '0', 'smsset', 'input', '0');
INSERT INTO `a_options` VALUES ('business_review', '', '', '商家自动审核', '0', 'userset', 'option', '0');
INSERT INTO `a_options` VALUES ('andorid_down', '', null, '安卓下载地址', '99', 'siteset', '1', '0');
INSERT INTO `a_options` VALUES ('mac_down', '', null, '苹果下载地址', '99', 'siteset', '1', '0');
INSERT INTO `a_options` VALUES ('banklist', '', '银行以逗号分割“,”', '支持的银行', '0', 'order', '1', '0');
INSERT INTO `a_options` VALUES ('coin_parent_1', '500', null, '被邀请者奖励', '0', 'm1', '1', '0');
INSERT INTO `a_options` VALUES ('coin_parent_2', '800', null, '被邀请者奖励2', '0', 'm2', '1', '0');
INSERT INTO `a_options` VALUES ('coin_2', '200', null, '新人任务达到2', '0', 'm2', '1', '0');
INSERT INTO `a_options` VALUES ('coin_parent_3', '1200', null, '被邀请者奖励3', '0', 'm3', '1', '0');
INSERT INTO `a_options` VALUES ('coin_3', '500', null, '新人任务达到3', '0', 'm3', '1', '0');
INSERT INTO `a_options` VALUES ('coin_time_2', '3', '天', '天数限制2', '0', 'm2', '1', '0');
INSERT INTO `a_options` VALUES ('coin_time_3', '10', '天', '天数限制3', '0', 'm3', '1', '0');
INSERT INTO `a_options` VALUES ('coin_parent_rate', '15', '%', '收益分润', '0', 'm4', '1', '0');
INSERT INTO `a_options` VALUES ('coin_rate', '1000', '如填写1000即1000金币兑换1元', '金币比值', '0', 'order', '1', '0');
INSERT INTO `a_options` VALUES ('self_read_time', '1', null, '自己阅读时间', '0', 'order', '2', '0');
INSERT INTO `a_options` VALUES ('share_read_time', '2', null, ' 分享阅读时间', '0', 'order', '1', '0');
INSERT INTO `a_options` VALUES ('aword_num', '3', null, '同一文章阅读奖励上限次数', '0', 'order', '1', '0');
INSERT INTO `a_options` VALUES ('self_read_coin', '5', null, '自己阅读奖励金币', '0', 'order', '1', '0');
INSERT INTO `a_options` VALUES ('share_read_coin', '30', null, '分享阅读奖励金币', '0', 'order', '1', '0');
INSERT INTO `a_options` VALUES ('coin_1', '800', null, '新人任务奖励', '1', 'm1', '1', '0');

-- ----------------------------
-- Table structure for a_seo
-- ----------------------------
DROP TABLE IF EXISTS `a_seo`;
CREATE TABLE `a_seo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idenfity` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `metatitle` varchar(255) DEFAULT NULL,
  `metadesc` varchar(255) DEFAULT NULL,
  `metakeyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idenfity` (`idenfity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_seo
-- ----------------------------

-- ----------------------------
-- Table structure for a_sock_client
-- ----------------------------
DROP TABLE IF EXISTS `a_sock_client`;
CREATE TABLE `a_sock_client` (
  `clientid` varchar(36) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `resource` int(255) DEFAULT '0' COMMENT '服务端索引ID',
  `port` varchar(255) DEFAULT NULL,
  `check` tinyint(4) NOT NULL DEFAULT '0',
  `online` tinyint(4) NOT NULL DEFAULT '0',
  `handshake` tinyint(4) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `token` varchar(255) DEFAULT '',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '服务器id',
  PRIMARY KEY (`clientid`),
  KEY `clientid` (`clientid`),
  KEY `uname` (`uname`),
  KEY `check` (`check`),
  KEY `online` (`online`),
  KEY `sid` (`sid`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=6627 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_sock_client
-- ----------------------------

-- ----------------------------
-- Table structure for a_sock_type
-- ----------------------------
DROP TABLE IF EXISTS `a_sock_type`;
CREATE TABLE `a_sock_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_sock_type
-- ----------------------------

-- ----------------------------
-- Table structure for a_sockserver
-- ----------------------------
DROP TABLE IF EXISTS `a_sockserver`;
CREATE TABLE `a_sockserver` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '服务id',
  `ip` varchar(50) NOT NULL COMMENT 'sock服务器ip',
  `port` int(11) NOT NULL DEFAULT '0' COMMENT 'sock服务器端口',
  `starttime` int(11) NOT NULL DEFAULT '0' COMMENT '开启时间',
  `flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态0关闭，1启动',
  `conns` int(11) NOT NULL DEFAULT '0' COMMENT '连接数',
  `ismaster` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'is主服务器',
  PRIMARY KEY (`sid`),
  KEY `ip` (`ip`),
  KEY `port` (`port`),
  KEY `flag` (`flag`),
  KEY `id` (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_sockserver
-- ----------------------------

-- ----------------------------
-- Table structure for a_task
-- ----------------------------
DROP TABLE IF EXISTS `a_task`;
CREATE TABLE `a_task` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `dotime` int(11) NOT NULL DEFAULT '0',
  `desc` varchar(255) DEFAULT NULL,
  `exectime` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '任务类型1，每日任务，2 ，3日任务 3，10日任务',
  PRIMARY KEY (`tid`),
  KEY `uid` (`uid`),
  KEY `flag` (`flag`),
  KEY `dotime` (`dotime`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_task
-- ----------------------------

-- ----------------------------
-- Table structure for a_template
-- ----------------------------
DROP TABLE IF EXISTS `a_template`;
CREATE TABLE `a_template` (
  `tmpid` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `addtime` int(11) DEFAULT '0',
  `idenfity` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `orders` int(11) DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `htmlflag` tinyint(1) NOT NULL DEFAULT '1',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmpid`),
  UNIQUE KEY `idenfity` (`idenfity`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_template
-- ----------------------------

-- ----------------------------
-- Table structure for a_tmpcode
-- ----------------------------
DROP TABLE IF EXISTS `a_tmpcode`;
CREATE TABLE `a_tmpcode` (
  `ip` varchar(255) DEFAULT NULL,
  `who` varchar(255) NOT NULL DEFAULT '',
  `addtime` int(11) DEFAULT '0',
  `code` int(11) DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`who`),
  UNIQUE KEY `who` (`who`)
) ENGINE=MyISAM AUTO_INCREMENT=295 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_tmpcode
-- ----------------------------

-- ----------------------------
-- Table structure for a_token
-- ----------------------------
DROP TABLE IF EXISTS `a_token`;
CREATE TABLE `a_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `token` varchar(255) DEFAULT NULL COMMENT '用户令牌',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ip` varchar(50) NOT NULL COMMENT '用户ip',
  `endtime` int(11) DEFAULT NULL COMMENT '缩小时间',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0无效，1有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_token
-- ----------------------------

-- ----------------------------
-- Table structure for a_url_encode
-- ----------------------------
DROP TABLE IF EXISTS `a_url_encode`;
CREATE TABLE `a_url_encode` (
  `urlid` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `encodeurl` varchar(255) DEFAULT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`urlid`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_url_encode
-- ----------------------------

-- ----------------------------
-- Table structure for a_user
-- ----------------------------
DROP TABLE IF EXISTS `a_user`;
CREATE TABLE `a_user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '1',
  `openid` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  `coin` int(18) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `regtime` int(15) NOT NULL DEFAULT '0',
  `regip` varchar(20) DEFAULT NULL,
  `orders` int(1) NOT NULL DEFAULT '0',
  `logtime` int(11) NOT NULL DEFAULT '0',
  `logip` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `safepwd` varchar(255) DEFAULT NULL,
  `headimg` varchar(255) DEFAULT NULL,
  `logtimes` int(11) NOT NULL DEFAULT '0',
  `taskcoin` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `flag` (`flag`),
  KEY `username` (`username`),
  KEY `uid` (`uid`),
  KEY `openid` (`openid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=1001990 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_user
-- ----------------------------

-- ----------------------------
-- Table structure for a_user_address
-- ----------------------------
DROP TABLE IF EXISTS `a_user_address`;
CREATE TABLE `a_user_address` (
  `addid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `realname` varchar(255) NOT NULL,
  `recvmobile` varchar(255) NOT NULL,
  `recvphone` varchar(255) DEFAULT NULL,
  `recvnum` int(11) NOT NULL DEFAULT '0' COMMENT '邮政编码',
  `provinceid` int(11) NOT NULL DEFAULT '0',
  `cityid` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `areaid` int(11) NOT NULL DEFAULT '0',
  `mflag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认收货地址',
  PRIMARY KEY (`addid`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_user_address
-- ----------------------------

-- ----------------------------
-- Table structure for a_user_attr
-- ----------------------------
DROP TABLE IF EXISTS `a_user_attr`;
CREATE TABLE `a_user_attr` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `wx` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `provinceid` int(11) DEFAULT NULL,
  `cityid` int(11) DEFAULT NULL,
  `areaid` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `ww` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_user_attr
-- ----------------------------

-- ----------------------------
-- Table structure for a_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `a_visit_log`;
CREATE TABLE `a_visit_log` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '访问用户id',
  `muid` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `url` text NOT NULL COMMENT 'url',
  `usertype` varchar(255) DEFAULT NULL COMMENT '客户端类型',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '访问具体时间',
  `lktime` int(11) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0' COMMENT '年月日',
  `browtype` varchar(255) DEFAULT NULL COMMENT '浏览器类型',
  `serverinfo` text,
  `getinfo` text,
  `postinfo` text,
  `address` varchar(255) DEFAULT NULL,
  `intime` int(11) NOT NULL DEFAULT '0' COMMENT '页面停留时间',
  `soururl` varchar(255) DEFAULT NULL COMMENT '来源url',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '产品ID',
  `a` varchar(255) DEFAULT NULL,
  `c` varchar(255) DEFAULT NULL,
  `g` varchar(255) DEFAULT NULL,
  `outtype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '离开类型时间统计 0未知，1刷新，2关闭',
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM AUTO_INCREMENT=607401 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_visit_log
-- ----------------------------
INSERT INTO `a_visit_log` VALUES ('607372', '0', '0', 'http://www.ng169.com/index.php?a=forget&c=login', 'unknown', '46.229.168.141', '1561098598', '0', '20190621', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; SemrushBot\\/3~bl; +http:\\/\\/www.semrush.com\\/bot.html)\",\"HTTP_CONNECTION\":\"close\",\"HTTP_ACCEPT_ENCODING\":\"gzip,deflate\",\"HTTP_ACCEPT\":\"text\\/html, application\\/rss+xml, application\\/atom+xml, text\\/xml, text\\/rss+xml\",\"HTTP_HOST\":\"www.ng169.com\",\"PATH_INFO\":\"\",\"PHP_ADMIN_VALUE\":\"open_basedir=\\/d\\/api\\/:\\/tmp\\/:\\/proc\\/\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"45970\",\"REMOTE_ADDR\":\"46.229.168.141\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?a=forget&c=login\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"a=forget&c=login\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\",\"REQUEST_TIME_FLOAT\":1561098598.114938,\"REQUEST_TIME\":1561098598}', '{\"a\":\"forget\",\"c\":\"login\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607373', '0', '0', 'http://ng169.com/index.php?a=forget&c=login', 'unknown', '46.229.168.138', '1561278545', '0', '20190623', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; SemrushBot\\/3~bl; +http:\\/\\/www.semrush.com\\/bot.html)\",\"HTTP_CONNECTION\":\"close\",\"HTTP_ACCEPT_ENCODING\":\"gzip,deflate\",\"HTTP_ACCEPT\":\"text\\/html, application\\/rss+xml, application\\/atom+xml, text\\/xml, text\\/rss+xml\",\"HTTP_HOST\":\"ng169.com\",\"PATH_INFO\":\"\",\"PHP_ADMIN_VALUE\":\"open_basedir=\\/d\\/api\\/:\\/tmp\\/:\\/proc\\/\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"19870\",\"REMOTE_ADDR\":\"46.229.168.138\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?a=forget&c=login\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"a=forget&c=login\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\",\"REQUEST_TIME_FLOAT\":1561278545.381926,\"REQUEST_TIME\":1561278545}', '{\"a\":\"forget\",\"c\":\"login\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607374', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '148.251.235.104', '1562103076', '0', '20190703', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_HOST\":\"ng169.com\",\"HTTP_ACCEPT_LANGUAGE\":\"en\",\"HTTP_ACCEPT_ENCODING\":\"gzip\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; MJ12bot\\/v1.4.8; http:\\/\\/mj12bot.com\\/)\",\"HTTP_ACCEPT\":\"text\\/html,text\\/plain,text\\/xml,text\\/*,application\\/xml,application\\/xhtml+xml,application\\/rss+xml,application\\/atom+xml,application\\/rdf+xml,application\\/php,application\\/x-php,application\\/x-httpd-php\",\"PATH_INFO\":\"\",\"PHP_ADMIN_VALUE\":\"open_basedir=\\/d\\/api\\/:\\/tmp\\/:\\/proc\\/\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"37908\",\"REMOTE_ADDR\":\"148.251.235.104\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\",\"REQUEST_TIME_FLOAT\":1562103076.547136,\"REQUEST_TIME\":1562103076}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607375', '0', '0', 'http://www.ng169.com/index.php?c=login&a=forget', 'Linux', '66.249.79.158', '1566518079', '0', '20190823', '[\"Chrome\",\"41.0\"]', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_ACCEPT_ENCODING\":\"gzip,deflate,br\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/41.0.2272.96 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\",\"HTTP_FROM\":\"googlebot(at)googlebot.com\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8,text\\/html,application\\/xhtml+xml,application\\/signed-exchange;v=b3,application\\/xml;q=0.9,*\\/*;q=0.8\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_AMP_CACHE_TRANSFORM\":\"google;v=\\\"1..2\\\"\",\"HTTP_HOST\":\"www.ng169.com\",\"PATH_INFO\":\"\",\"PHP_ADMIN_VALUE\":\"open_basedir=\\/d\\/api\\/:\\/tmp\\/:\\/proc\\/\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"34771\",\"REMOTE_ADDR\":\"66.249.79.158\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\",\"REQUEST_TIME_FLOAT\":1566518079.190907,\"REQUEST_TIME\":1566518079}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607376', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '54.36.148.41', '1567297050', '0', '20190901', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_ACCEPT_ENCODING\":\"deflate, gzip\",\"HTTP_ACCEPT\":\"*\\/*\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; AhrefsBot\\/6.1; +http:\\/\\/ahrefs.com\\/robot\\/)\",\"HTTP_HOST\":\"ng169.com\",\"PATH_INFO\":\"\",\"PHP_ADMIN_VALUE\":\"open_basedir=\\/d\\/api\\/:\\/tmp\\/:\\/proc\\/\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"21682\",\"REMOTE_ADDR\":\"54.36.148.41\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\",\"REQUEST_TIME_FLOAT\":1567297049.934461,\"REQUEST_TIME\":1567297049}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607377', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '89.163.242.186', '1568974766', '0', '20190920', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_HOST\":\"ng169.com\",\"HTTP_ACCEPT_LANGUAGE\":\"en\",\"HTTP_ACCEPT_ENCODING\":\"br,gzip\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; MJ12bot\\/v1.4.8; http:\\/\\/mj12bot.com\\/)\",\"HTTP_ACCEPT\":\"text\\/html,text\\/plain,text\\/xml,text\\/*,application\\/xml,application\\/xhtml+xml,application\\/rss+xml,application\\/atom+xml,application\\/rdf+xml,application\\/php,application\\/x-php,application\\/x-httpd-php\",\"PATH_INFO\":\"\",\"PHP_ADMIN_VALUE\":\"open_basedir=\\/d\\/api\\/:\\/tmp\\/:\\/proc\\/\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"54282\",\"REMOTE_ADDR\":\"89.163.242.186\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\",\"REQUEST_TIME_FLOAT\":1568974766.419326,\"REQUEST_TIME\":1568974766}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607378', '0', '0', 'http://www.ng169.com/index.php?c=login&a=forget', 'unknown', '203.208.60.121', '1570623368', '0', '20191009', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_ACCEPT_ENCODING\":\"gzip,deflate,br\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\",\"HTTP_FROM\":\"googlebot(at)googlebot.com\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_HOST\":\"www.ng169.com\",\"PATH_INFO\":\"\",\"PHP_ADMIN_VALUE\":\"open_basedir=\\/d\\/api\\/:\\/tmp\\/:\\/proc\\/\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"37534\",\"REMOTE_ADDR\":\"203.208.60.121\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\",\"REQUEST_TIME_FLOAT\":1570623368.472348,\"REQUEST_TIME\":1570623368}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607379', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '216.244.66.196', '1572233100', '0', '20191028', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_ACCEPT_CHARSET\":\"utf-8;q=0.7,iso-8859-1;q=0.2,*;q=0.1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; DotBot\\/1.1; http:\\/\\/www.opensiteexplorer.org\\/dotbot, help@moz.com)\",\"HTTP_ACCEPT\":\"*\\/*\",\"HTTP_HOST\":\"ng169.com\",\"PATH_INFO\":\"\",\"PHP_ADMIN_VALUE\":\"open_basedir=\\/d\\/api\\/:\\/tmp\\/:\\/proc\\/\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"44512\",\"REMOTE_ADDR\":\"216.244.66.196\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\",\"REQUEST_TIME_FLOAT\":1572233100.15294,\"REQUEST_TIME\":1572233100}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607380', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '54.36.150.173', '1573009662', '0', '20191106', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_ACCEPT_ENCODING\":\"deflate, gzip\",\"HTTP_ACCEPT\":\"*\\/*\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; AhrefsBot\\/6.1; +http:\\/\\/ahrefs.com\\/robot\\/)\",\"HTTP_HOST\":\"ng169.com\",\"PATH_INFO\":\"\",\"PHP_ADMIN_VALUE\":\"open_basedir=\\/d\\/api\\/:\\/tmp\\/:\\/proc\\/\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"40072\",\"REMOTE_ADDR\":\"54.36.150.173\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\",\"REQUEST_TIME_FLOAT\":1573009662.227934,\"REQUEST_TIME\":1573009662}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607381', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '66.249.79.172', '1575882347', '0', '20191209', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_ACCEPT_ENCODING\":\"gzip,deflate,br\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\",\"HTTP_FROM\":\"googlebot(at)googlebot.com\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_HOST\":\"ng169.com\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"39442\",\"REMOTE_ADDR\":\"66.249.79.172\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1575882346.929461,\"REQUEST_TIME\":1575882346}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607382', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '89.163.242.62', '1575923227', '0', '20191210', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_HOST\":\"ng169.com\",\"HTTP_ACCEPT_LANGUAGE\":\"en\",\"HTTP_ACCEPT_ENCODING\":\"br,gzip\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; MJ12bot\\/v1.4.8; http:\\/\\/mj12bot.com\\/)\",\"HTTP_ACCEPT\":\"text\\/html,text\\/plain,text\\/xml,text\\/*,application\\/xml,application\\/xhtml+xml,application\\/rss+xml,application\\/atom+xml,application\\/rdf+xml,application\\/php,application\\/x-php,application\\/x-httpd-php\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"44396\",\"REMOTE_ADDR\":\"89.163.242.62\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1575923227.816273,\"REQUEST_TIME\":1575923227}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607383', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '54.36.148.185', '1576597620', '0', '20191217', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_ACCEPT_ENCODING\":\"deflate, gzip, br\",\"HTTP_ACCEPT\":\"*\\/*\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; AhrefsBot\\/6.1; +http:\\/\\/ahrefs.com\\/robot\\/)\",\"HTTP_HOST\":\"ng169.com\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"48524\",\"REMOTE_ADDR\":\"54.36.148.185\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1576597619.994112,\"REQUEST_TIME\":1576597619}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607384', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '54.36.149.32', '1579480536', '0', '20200120', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_ACCEPT_ENCODING\":\"deflate, gzip, br\",\"HTTP_ACCEPT\":\"*\\/*\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; AhrefsBot\\/6.1; +http:\\/\\/ahrefs.com\\/robot\\/)\",\"HTTP_HOST\":\"ng169.com\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"37896\",\"REMOTE_ADDR\":\"54.36.149.32\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1579480535.980681,\"REQUEST_TIME\":1579480535}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607385', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'Linux', '203.208.60.88', '1579532293', '0', '20200120', '[\"Chrome\",\"41.0\"]', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_ACCEPT_ENCODING\":\"gzip,deflate,br\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/41.0.2272.96 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\",\"HTTP_FROM\":\"googlebot(at)googlebot.com\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/signed-exchange;v=b3,application\\/xml;q=0.9,*\\/*;q=0.8\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_AMP_CACHE_TRANSFORM\":\"google;v=\\\"1..2\\\"\",\"HTTP_HOST\":\"ng169.com\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"36410\",\"REMOTE_ADDR\":\"203.208.60.88\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1579532293.452755,\"REQUEST_TIME\":1579532293}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607386', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '54.36.149.68', '1580233347', '0', '20200129', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_ACCEPT_ENCODING\":\"deflate, gzip, br\",\"HTTP_ACCEPT\":\"*\\/*\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; AhrefsBot\\/6.1; +http:\\/\\/ahrefs.com\\/robot\\/)\",\"HTTP_HOST\":\"ng169.com\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"48106\",\"REMOTE_ADDR\":\"54.36.149.68\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1580233347.770917,\"REQUEST_TIME\":1580233347}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607387', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '216.244.66.196', '1580391795', '0', '20200130', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_ACCEPT_CHARSET\":\"utf-8;q=0.7,iso-8859-1;q=0.2,*;q=0.1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; DotBot\\/1.1; http:\\/\\/www.opensiteexplorer.org\\/dotbot, help@moz.com)\",\"HTTP_ACCEPT\":\"*\\/*\",\"HTTP_HOST\":\"ng169.com\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"59164\",\"REMOTE_ADDR\":\"216.244.66.196\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1580391795.009213,\"REQUEST_TIME\":1580391795}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607388', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '216.244.66.196', '1580692391', '0', '20200203', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_ACCEPT_CHARSET\":\"utf-8;q=0.7,iso-8859-1;q=0.2,*;q=0.1\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; DotBot\\/1.1; http:\\/\\/www.opensiteexplorer.org\\/dotbot, help@moz.com)\",\"HTTP_ACCEPT\":\"*\\/*\",\"HTTP_HOST\":\"ng169.com\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"56790\",\"REMOTE_ADDR\":\"216.244.66.196\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1580692391.575884,\"REQUEST_TIME\":1580692391}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607389', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '173.249.2.13', '1582773771', '0', '20200227', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_HOST\":\"ng169.com\",\"HTTP_ACCEPT_LANGUAGE\":\"en\",\"HTTP_ACCEPT_ENCODING\":\"br,gzip\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; MJ12bot\\/v1.4.8; http:\\/\\/mj12bot.com\\/)\",\"HTTP_ACCEPT\":\"text\\/html,text\\/plain,text\\/xml,text\\/*,application\\/xml,application\\/xhtml+xml,application\\/rss+xml,application\\/atom+xml,application\\/rdf+xml,application\\/php,application\\/x-php,application\\/x-httpd-php\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"39972\",\"REMOTE_ADDR\":\"173.249.2.13\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1582773770.345607,\"REQUEST_TIME\":1582773770}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607390', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '54.36.149.57', '1583283332', '0', '20200304', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_ACCEPT_ENCODING\":\"deflate, gzip, br\",\"HTTP_ACCEPT\":\"*\\/*\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; AhrefsBot\\/6.1; +http:\\/\\/ahrefs.com\\/robot\\/)\",\"HTTP_HOST\":\"ng169.com\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"35880\",\"REMOTE_ADDR\":\"54.36.149.57\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1583283331.272025,\"REQUEST_TIME\":1583283331}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607391', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '54.36.148.61', '1586746264', '0', '20200413', '0', '{\"USER\":\"www\",\"HOME\":\"\\/home\\/www\",\"HTTP_ACCEPT_ENCODING\":\"deflate, gzip, br\",\"HTTP_ACCEPT\":\"*\\/*\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (compatible; AhrefsBot\\/6.1; +http:\\/\\/ahrefs.com\\/robot\\/)\",\"HTTP_HOST\":\"ng169.com\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"api.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"32344\",\"REMOTE_ADDR\":\"54.36.148.61\",\"SERVER_SOFTWARE\":\"nginx\\/1.16.0\",\"GATEWAY_INTERFACE\":\"CGI\\/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"DOCUMENT_ROOT\":\"\\/d\\/api\",\"DOCUMENT_URI\":\"\\/index.php\",\"REQUEST_URI\":\"\\/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"\\/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"\\/d\\/api\\/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1586746264.18711,\"REQUEST_TIME\":1586746264}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607392', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '144.91.99.244', '1589744955', '0', '20200518', '0', '{\"USER\":\"www\",\"HOME\":\"/home/www\",\"HTTP_HOST\":\"ng169.com\",\"HTTP_ACCEPT_LANGUAGE\":\"en\",\"HTTP_ACCEPT_ENCODING\":\"br,gzip\",\"HTTP_USER_AGENT\":\"Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)\",\"HTTP_ACCEPT\":\"text/html,text/plain,text/xml,text/*,application/xml,application/xhtml+xml,application/rss+xml,application/atom+xml,application/rdf+xml,application/php,application/x-php,application/x-httpd-php\",\"PHP_ADMIN_VALUE\":\"open_basedir=/d/api/:/tmp/:/proc/\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"www.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"58050\",\"REMOTE_ADDR\":\"144.91.99.244\",\"SERVER_SOFTWARE\":\"nginx/1.16.1\",\"GATEWAY_INTERFACE\":\"CGI/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP/1.1\",\"DOCUMENT_ROOT\":\"/d/api\",\"DOCUMENT_URI\":\"/index.php\",\"REQUEST_URI\":\"/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"/d/api/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"/index.php\",\"REQUEST_TIME_FLOAT\":1589744954.915657,\"REQUEST_TIME\":1589744954}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607393', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '5.9.71.213', '1596712144', '0', '20200806', '0', '{\"USER\":\"www\",\"HOME\":\"/home/www\",\"HTTP_HOST\":\"ng169.com\",\"HTTP_ACCEPT_LANGUAGE\":\"en\",\"HTTP_ACCEPT_ENCODING\":\"br,gzip\",\"HTTP_USER_AGENT\":\"Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)\",\"HTTP_ACCEPT\":\"text/html,text/plain,text/xml,text/*,application/xml,application/xhtml+xml,application/rss+xml,application/atom+xml,application/rdf+xml,application/php,application/x-php,application/x-httpd-php\",\"PHP_ADMIN_VALUE\":\"open_basedir=/d/api/:/tmp/:/proc/:/d/xs/pic\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"www.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"4326\",\"REMOTE_ADDR\":\"5.9.71.213\",\"SERVER_SOFTWARE\":\"nginx/1.16.1\",\"GATEWAY_INTERFACE\":\"CGI/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP/1.1\",\"DOCUMENT_ROOT\":\"/d/api\",\"DOCUMENT_URI\":\"/index.php\",\"REQUEST_URI\":\"/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"/d/api/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"/index.php\",\"REQUEST_TIME_FLOAT\":1596712143.850799,\"REQUEST_TIME\":1596712143}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607394', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '216.244.66.196', '1596931822', '0', '20200809', '0', '{\"USER\":\"www\",\"HOME\":\"/home/www\",\"HTTP_ACCEPT_CHARSET\":\"utf-8;q=0.7,iso-8859-1;q=0.2,*;q=0.1\",\"HTTP_USER_AGENT\":\"Mozilla/5.0 (compatible; DotBot/1.1; http://www.opensiteexplorer.org/dotbot, help@moz.com)\",\"HTTP_ACCEPT\":\"*/*\",\"HTTP_HOST\":\"ng169.com\",\"PHP_ADMIN_VALUE\":\"open_basedir=/d/api/:/tmp/:/proc/:/d/xs/pic\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"www.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"47274\",\"REMOTE_ADDR\":\"216.244.66.196\",\"SERVER_SOFTWARE\":\"nginx/1.16.1\",\"GATEWAY_INTERFACE\":\"CGI/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP/1.1\",\"DOCUMENT_ROOT\":\"/d/api\",\"DOCUMENT_URI\":\"/index.php\",\"REQUEST_URI\":\"/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"/d/api/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"/index.php\",\"REQUEST_TIME_FLOAT\":1596931822.717118,\"REQUEST_TIME\":1596931822}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607395', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'Linux', '203.208.60.66', '1597063037', '0', '20200810', '[\"Chrome\",\"80.0\"]', '{\"USER\":\"www\",\"HOME\":\"/home/www\",\"HTTP_ACCEPT_ENCODING\":\"gzip,deflate,br\",\"HTTP_USER_AGENT\":\"Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)\",\"HTTP_FROM\":\"googlebot(at)googlebot.com\",\"HTTP_ACCEPT\":\"text/html,application/xhtml+xml,application/signed-exchange;v=b3,application/xml;q=0.9,*/*;q=0.8\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_AMP_CACHE_TRANSFORM\":\"google;v=\"1..4\"\",\"HTTP_HOST\":\"ng169.com\",\"PHP_ADMIN_VALUE\":\"open_basedir=/d/api/:/tmp/:/proc/:/d/xs/pic\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"www.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"35712\",\"REMOTE_ADDR\":\"203.208.60.66\",\"SERVER_SOFTWARE\":\"nginx/1.16.1\",\"GATEWAY_INTERFACE\":\"CGI/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP/1.1\",\"DOCUMENT_ROOT\":\"/d/api\",\"DOCUMENT_URI\":\"/index.php\",\"REQUEST_URI\":\"/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"/d/api/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"/index.php\",\"REQUEST_TIME_FLOAT\":1597063037.743827,\"REQUEST_TIME\":1597063037}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607396', '0', '0', 'http://www.ng169.com/index.php?c=login&a=forget', 'Linux', '66.249.64.239', '1600456184', '0', '20200919', '[\"Chrome\",\"85.0\"]', '{\"USER\":\"www\",\"HOME\":\"/home/www\",\"HTTP_ACCEPT_ENCODING\":\"gzip,deflate,br\",\"HTTP_USER_AGENT\":\"Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.110 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)\",\"HTTP_FROM\":\"googlebot(at)googlebot.com\",\"HTTP_ACCEPT\":\"text/html,application/xhtml+xml,application/signed-exchange;v=b3,application/xml;q=0.9,*/*;q=0.8\",\"HTTP_CONNECTION\":\"keep-alive\",\"HTTP_AMP_CACHE_TRANSFORM\":\"google;v=\"1..4\"\",\"HTTP_HOST\":\"www.ng169.com\",\"PHP_ADMIN_VALUE\":\"open_basedir=/d/api/:/tmp/:/proc/:/d/xs/pic\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"www.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"56733\",\"REMOTE_ADDR\":\"66.249.64.239\",\"SERVER_SOFTWARE\":\"nginx/1.16.1\",\"GATEWAY_INTERFACE\":\"CGI/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP/1.1\",\"DOCUMENT_ROOT\":\"/d/api\",\"DOCUMENT_URI\":\"/index.php\",\"REQUEST_URI\":\"/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"/d/api/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"/index.php\",\"REQUEST_TIME_FLOAT\":1600456184.38841,\"REQUEST_TIME\":1600456184}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607397', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '107.150.59.98', '1603628293', '0', '20201025', '0', '{\"USER\":\"www\",\"HOME\":\"/home/www\",\"HTTP_HOST\":\"ng169.com\",\"HTTP_ACCEPT_LANGUAGE\":\"en\",\"HTTP_ACCEPT_ENCODING\":\"br,gzip\",\"HTTP_USER_AGENT\":\"Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)\",\"HTTP_ACCEPT\":\"text/html,text/plain,text/xml,text/*,application/xml,application/xhtml+xml,application/rss+xml,application/atom+xml,application/rdf+xml,application/php,application/x-php,application/x-httpd-php\",\"PHP_ADMIN_VALUE\":\"open_basedir=/d/api/:/tmp/:/proc/:/d/xs/pic\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"www.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"53506\",\"REMOTE_ADDR\":\"107.150.59.98\",\"SERVER_SOFTWARE\":\"nginx/1.16.1\",\"GATEWAY_INTERFACE\":\"CGI/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP/1.1\",\"DOCUMENT_ROOT\":\"/d/api\",\"DOCUMENT_URI\":\"/index.php\",\"REQUEST_URI\":\"/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"/d/api/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"/index.php\",\"REQUEST_TIME_FLOAT\":1603628293.594879,\"REQUEST_TIME\":1603628293}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607398', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '216.244.66.196', '1604829798', '0', '20201108', '0', '{\"USER\":\"www\",\"HOME\":\"/home/www\",\"HTTP_ACCEPT_CHARSET\":\"utf-8;q=0.7,iso-8859-1;q=0.2,*;q=0.1\",\"HTTP_USER_AGENT\":\"Mozilla/5.0 (compatible; DotBot/1.1; http://www.opensiteexplorer.org/dotbot, help@moz.com)\",\"HTTP_ACCEPT\":\"*/*\",\"HTTP_HOST\":\"ng169.com\",\"PHP_ADMIN_VALUE\":\"open_basedir=/d/api/:/tmp/:/proc/:/d/xs/pic\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"www.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"37540\",\"REMOTE_ADDR\":\"216.244.66.196\",\"SERVER_SOFTWARE\":\"nginx/1.16.1\",\"GATEWAY_INTERFACE\":\"CGI/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP/1.1\",\"DOCUMENT_ROOT\":\"/d/api\",\"DOCUMENT_URI\":\"/index.php\",\"REQUEST_URI\":\"/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"/d/api/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"/index.php\",\"REQUEST_TIME_FLOAT\":1604829798.651484,\"REQUEST_TIME\":1604829798}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607399', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '5.9.98.234', '1610629206', '0', '20210114', '0', '{\"USER\":\"www\",\"HOME\":\"/home/www\",\"HTTP_HOST\":\"ng169.com\",\"HTTP_ACCEPT_LANGUAGE\":\"en\",\"HTTP_ACCEPT_ENCODING\":\"br,gzip\",\"HTTP_USER_AGENT\":\"Mozilla/5.0 (compatible; MJ12bot/v1.4.8; http://mj12bot.com/)\",\"HTTP_ACCEPT\":\"text/html,text/plain,text/xml,text/*,application/xml,application/xhtml+xml,application/rss+xml,application/atom+xml,application/rdf+xml,application/php,application/x-php,application/x-httpd-php\",\"PHP_ADMIN_VALUE\":\"open_basedir=/d/api/:/tmp/:/proc/:/d/xs/pic\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"www.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"51252\",\"REMOTE_ADDR\":\"5.9.98.234\",\"SERVER_SOFTWARE\":\"nginx/1.16.1\",\"GATEWAY_INTERFACE\":\"CGI/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP/1.1\",\"DOCUMENT_ROOT\":\"/d/api\",\"DOCUMENT_URI\":\"/index.php\",\"REQUEST_URI\":\"/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"/d/api/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"/index.php\",\"REQUEST_TIME_FLOAT\":1610629206.706588,\"REQUEST_TIME\":1610629206}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');
INSERT INTO `a_visit_log` VALUES ('607400', '0', '0', 'http://ng169.com/index.php?c=login&a=forget', 'unknown', '216.244.66.196', '1612836558', '0', '20210209', '0', '{\"USER\":\"www\",\"HOME\":\"/home/www\",\"HTTP_ACCEPT_CHARSET\":\"utf-8;q=0.7,iso-8859-1;q=0.2,*;q=0.1\",\"HTTP_USER_AGENT\":\"Mozilla/5.0 (compatible; DotBot/1.1; http://www.opensiteexplorer.org/dotbot, help@moz.com)\",\"HTTP_ACCEPT\":\"*/*\",\"HTTP_HOST\":\"ng169.com\",\"PHP_ADMIN_VALUE\":\"open_basedir=/d/api/:/tmp/:/proc/:/d/xs/pic\",\"REDIRECT_STATUS\":\"200\",\"SERVER_NAME\":\"www.ng169.com\",\"SERVER_PORT\":\"80\",\"SERVER_ADDR\":\"103.115.66.149\",\"REMOTE_PORT\":\"44212\",\"REMOTE_ADDR\":\"216.244.66.196\",\"SERVER_SOFTWARE\":\"nginx/1.16.1\",\"GATEWAY_INTERFACE\":\"CGI/1.1\",\"REQUEST_SCHEME\":\"http\",\"SERVER_PROTOCOL\":\"HTTP/1.1\",\"DOCUMENT_ROOT\":\"/d/api\",\"DOCUMENT_URI\":\"/index.php\",\"REQUEST_URI\":\"/index.php?c=login&a=forget\",\"SCRIPT_NAME\":\"/index.php\",\"CONTENT_LENGTH\":\"\",\"CONTENT_TYPE\":\"\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"c=login&a=forget\",\"SCRIPT_FILENAME\":\"/d/api/index.php\",\"FCGI_ROLE\":\"RESPONDER\",\"PHP_SELF\":\"/index.php\",\"REQUEST_TIME_FLOAT\":1612836555.647973,\"REQUEST_TIME\":1612836555}', '{\"c\":\"login\",\"a\":\"forget\"}', '[]', null, '0', '0', '0', 'forget', 'login', 'index', '0');

-- ----------------------------
-- Table structure for a_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `a_withdraw`;
CREATE TABLE `a_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `desc` varchar(255) DEFAULT NULL,
  `addtime` int(11) DEFAULT '0',
  `recvrealname` varchar(255) NOT NULL COMMENT '收款人姓名',
  `recvnum` varchar(255) NOT NULL COMMENT '收款人卡号',
  `recvbank` varchar(255) NOT NULL COMMENT '收款银行',
  `endtime` int(11) NOT NULL DEFAULT '0' COMMENT '最晚到账时间',
  `paytime` int(11) NOT NULL DEFAULT '0' COMMENT '管理操作实际到账时间',
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `adminid` int(11) NOT NULL DEFAULT '0' COMMENT '打款管理员ID',
  `adminimg` varchar(255) DEFAULT NULL COMMENT '管理打款截图',
  `admindesc` varchar(255) DEFAULT NULL COMMENT '管理员备注',
  `choosetype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '到账类型：1 两小时到账；2 一天到账，3 两天到账',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态：0待管理操作；1提款完成；2提款关闭；',
  `recvbankadd` varchar(255) DEFAULT NULL COMMENT '收款银行地址',
  `soleid` varchar(255) NOT NULL COMMENT '交易号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_withdraw
-- ----------------------------
