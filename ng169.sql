

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `{dbpre}admins`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}admins`;
CREATE TABLE `{dbpre}admins` (
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
-- Records of {dbpre}admins
-- ----------------------------
INSERT INTO `{dbpre}admins` VALUES ('19', 'admin', '21232f297a57a5a743894a0e4a801fc3', '0', '1', '', null, '', '', '', '', '', '', null, null, '0', '1562901858', '32', '127.0.0.1', '', '0', null, '0', null);

-- ----------------------------
-- Table structure for `{dbpre}admins_departs`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}admins_departs`;
CREATE TABLE `{dbpre}admins_departs` (
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
-- Records of {dbpre}admins_departs
-- ----------------------------

-- ----------------------------
-- Table structure for `{dbpre}admins_log`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}admins_log`;
CREATE TABLE `{dbpre}admins_log` (
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
-- Records of {dbpre}admins_log
-- ----------------------------

-- ----------------------------
-- Table structure for `{dbpre}admins_roles`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}admins_roles`;
CREATE TABLE `{dbpre}admins_roles` (
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
-- Records of {dbpre}admins_roles
-- ----------------------------

-- ----------------------------
-- Table structure for `{dbpre}asyn_key`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}asyn_key`;
CREATE TABLE `{dbpre}asyn_key` (
  `index` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `flag` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of {dbpre}asyn_key
-- ----------------------------


-- ----------------------------
-- Table structure for `{dbpre}backstage_menu`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}backstage_menu`;
CREATE TABLE `{dbpre}backstage_menu` (
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
) ENGINE=MyISAM AUTO_INCREMENT=487 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of {dbpre}backstage_menu
-- ----------------------------
INSERT INTO `{dbpre}backstage_menu` VALUES ('306', '系统管理.', '1', null, '0', '103', '0', 'frame', 'run', 'admin', '1473244697', '19');
INSERT INTO `{dbpre}backstage_menu` VALUES ('318', '系统设置', '2', null, '306', '98', '0', 'siteset', 'run', 'admin', '1476746005', '19');
INSERT INTO `{dbpre}backstage_menu` VALUES ('319', '系统设置', '3', null, '318', '1', '0', 'siteset', 'run', 'admin', '1476746043', '19');
INSERT INTO `{dbpre}backstage_menu` VALUES ('372', '管理员管理', '2', null, '306', '99', '0', 'admins', 'run', 'admin', '1476747568', '19');
INSERT INTO `{dbpre}backstage_menu` VALUES ('382', '角色管理', '3', null, '372', '99', '0', 'role', 'run', 'admin', '1476753682', '19');
INSERT INTO `{dbpre}backstage_menu` VALUES ('383', '创建角色', '3', null, '372', '99', '0', 'role', 'add', 'admin', '1476753693', '19');
INSERT INTO `{dbpre}backstage_menu` VALUES ('381', '系统信息', '3', null, '318', '0', '0', 'frame', 'main', 'admin', '1476751865', '19');
INSERT INTO `{dbpre}backstage_menu` VALUES ('384', '管理员列表', '3', null, '372', '99', '0', 'admins', 'run', 'admin', '1476753704', '19');
INSERT INTO `{dbpre}backstage_menu` VALUES ('385', '添加管理员', '3', null, '372', '99', '0', 'admins', 'add', 'admin', '1476753714', '19');
INSERT INTO `{dbpre}backstage_menu` VALUES ('386', '修改密码', '3', null, '372', '99', '0', 'admins', 'cgthispwd', 'admin', '1476753748', '19');
INSERT INTO `{dbpre}backstage_menu` VALUES ('485', '域名管理', '2', '0', '306', '104', '0', 'domian', 'run', 'admin', '1562834199', '19');
INSERT INTO `{dbpre}backstage_menu` VALUES ('486', '域名列表', '3', '0', '485', '0', '0', 'domian', 'run', 'admin', '1562834216', '19');

-- ----------------------------
-- Table structure for `{dbpre}cache`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}cache`;
CREATE TABLE `{dbpre}cache` (
  `key` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`key`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of {dbpre}cache
-- ----------------------------


-- ----------------------------
-- Table structure for `{dbpre}category`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}category`;
CREATE TABLE `{dbpre}category` (
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
-- Records of {dbpre}category
-- ----------------------------
INSERT INTO `{dbpre}category` VALUES ('1', '首页', '0', '1', '1', null, null, null, null, '0', null, null, null, '0', '0', null);
INSERT INTO `{dbpre}category` VALUES ('10', '资讯', '0', '1', '7', null, null, null, null, '0', null, null, null, '0', '0', '?c=article');
INSERT INTO `{dbpre}category` VALUES ('4', '优惠活动', '0', '1', '5', null, null, null, null, '0', null, null, null, '0', '0', '?c=activity');
INSERT INTO `{dbpre}category` VALUES ('5', '商家', '0', '1', '2', null, null, null, null, '0', null, null, null, '0', '0', '?c=store');
INSERT INTO `{dbpre}category` VALUES ('6', '我要结婚', '0', '1', '3', null, null, null, null, '1', null, null, null, '0', '0', '?c=need');
INSERT INTO `{dbpre}category` VALUES ('12', '产品服务', '0', '1', '4', null, null, null, null, '0', null, null, null, '0', '0', '?c=product&a=list');
INSERT INTO `{dbpre}category` VALUES ('16', '精美图片', '0', '1', '9', null, null, null, null, '0', null, null, null, '0', '0', '?c=photo_list');

-- ----------------------------
-- Table structure for `{dbpre}chat`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}chat`;
CREATE TABLE `{dbpre}chat` (
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
-- Table structure for `{dbpre}chat_msg`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}chat_msg`;
CREATE TABLE `{dbpre}chat_msg` (
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
-- Table structure for `{dbpre}chat_user`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}chat_user`;
CREATE TABLE `{dbpre}chat_user` (
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
-- Table structure for `{dbpre}cheatlist`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}cheatlist`;
CREATE TABLE `{dbpre}cheatlist` (
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
-- Table structure for `{dbpre}cheatmsg`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}cheatmsg`;
CREATE TABLE `{dbpre}cheatmsg` (
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
-- Table structure for `{dbpre}domian`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}domian`;
CREATE TABLE `{dbpre}domian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domian` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '域名状态0未启用，1启用',
  `lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未封1被封',
  `visit` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `domian` (`domian`),
  KEY `flag` (`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of {dbpre}domian
-- ----------------------------
INSERT INTO `{dbpre}domian` VALUES ('40', 'test.com', '1562903402', '0', '0', '0', '192.168.1.1');

-- ----------------------------
-- Table structure for `{dbpre}ip`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}ip`;
CREATE TABLE `{dbpre}ip` (
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
-- Records of {dbpre}ip
-- ----------------------------

-- ----------------------------
-- Table structure for `{dbpre}options`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}options`;
CREATE TABLE `{dbpre}options` (
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
-- Records of {dbpre}options
-- ----------------------------
INSERT INTO `{dbpre}options` VALUES ('site_name', 'dns后台', null, '站点名称', '1', 'siteset', '1', '0');
INSERT INTO `{dbpre}options` VALUES ('site_description', '', '多个使用英文的“|”分割 ', '描述信息', '4', 'seo', '3', '0');
INSERT INTO `{dbpre}options` VALUES ('dnsserver', '8.8.8.8', '中继DNS服务器ip ', '中继DNS服务器ip', '5', 'siteset', '1', '0');
INSERT INTO `{dbpre}options` VALUES ('site_keywords', '', ' 多个使用英文的“|”分割', '关键字', '4', 'seo', '3', '0');
INSERT INTO `{dbpre}options` VALUES ('rewrite', '', null, '伪静态开关', '0', 'seo', '4', '0');
INSERT INTO `{dbpre}options` VALUES ('site_url', 'http://ng169.com', null, '站点域名', '2', 'siteset', '1', '0');
INSERT INTO `{dbpre}options` VALUES ('anonymous', '', '', '允许匿名', '1', 'userset', '4', '0');
INSERT INTO `{dbpre}options` VALUES ('user_head_woman', '', null, '女会员头像', '2', 'userset', '2', '0');
INSERT INTO `{dbpre}options` VALUES ('user_head_man', '', null, '男会员头像', '2', 'userset', '2', '0');
INSERT INTO `{dbpre}options` VALUES ('user_head_unknow', '', null, '性别未知头像', '2', 'userset', '2', '0');
INSERT INTO `{dbpre}options` VALUES ('filetype', 'jpg|bmp|gif|png', '多个使用英文的“|”分割 ', '上传类型', '2', 'upset', '1', '0');
INSERT INTO `{dbpre}options` VALUES ('upfilesize', '5000', '单位KB', '大小上传大小', '0', 'upset', '1', '0');
INSERT INTO `{dbpre}options` VALUES ('upfilepath', '/data/image', null, '上传目录', '0', 'upset', '1', '0');
INSERT INTO `{dbpre}options` VALUES ('thumbwidth', '100', null, '缩略图宽度', '0', 'upset', '1', '0');
INSERT INTO `{dbpre}options` VALUES ('thumbheight', '100', null, '缩略图高度', '0', 'upset', '1', '0');
INSERT INTO `{dbpre}options` VALUES ('zj', '0', null, '全部中继', '4', 'siteset', '4', '0');
INSERT INTO `{dbpre}options` VALUES ('timeoutcode', '', null, '重发间隔', '0', 'smsset', 'input', '0');
INSERT INTO `{dbpre}options` VALUES ('log', '0', '日志在/data/log(liunx需要开启目录权限)', '开启日志', '0', 'siteset', '4', '0');

-- ----------------------------
-- Table structure for `{dbpre}sock_client`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}sock_client`;
CREATE TABLE `{dbpre}sock_client` (
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
-- Records of {dbpre}sock_client
-- ----------------------------
INSERT INTO `{dbpre}sock_client` VALUES ('5SIP68', '0', '192.168.6.69', '1000494', '0', '64409', '1', '1', '1', '1559295107', '3c92b7601d3c0920b2b977ea2a560608', '5');
INSERT INTO `{dbpre}sock_client` VALUES ('6SIP68', '0', '192.168.6.69', '1000491', '0', '64392', '1', '0', '0', '1559295089', 'dd5e748eb40bf81c7d3ed2989c50e9df', '6');
INSERT INTO `{dbpre}sock_client` VALUES ('16SIP73', '0', '192.168.6.69', '1001958', '73', '53386', '1', '1', '1', '1559721246', '10eb83824336c7eab5132d7153de668a', '16');
INSERT INTO `{dbpre}sock_client` VALUES ('14SIP73', '0', '192.168.6.69', '1001968', '73', '55217', '1', '1', '1', '1559722823', '7793f2d5366d6a48ca045885d003bda4', '14');

-- ----------------------------
-- Table structure for `{dbpre}sock_type`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}sock_type`;
CREATE TABLE `{dbpre}sock_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of {dbpre}sock_type
-- ----------------------------
INSERT INTO `{dbpre}sock_type` VALUES ('1', '1', 'user', '', '0');
INSERT INTO `{dbpre}sock_type` VALUES ('2', '2', 'admin', 'OUvT0pql', '1559211882');
INSERT INTO `{dbpre}sock_type` VALUES ('3', '3', 'system', 'rFHC1Cjk', '1559211882');

-- ----------------------------
-- Table structure for `{dbpre}sockserver`
-- ----------------------------
DROP TABLE IF EXISTS `{dbpre}sockserver`;
CREATE TABLE `{dbpre}sockserver` (
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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of {dbpre}sockserver
-- ----------------------------

