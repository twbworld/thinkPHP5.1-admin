-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: tp
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tp_account_log`
--

DROP TABLE IF EXISTS `tp_account_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_account_log` (
  `log_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `user_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_money` decimal(10,2) DEFAULT '0.00' COMMENT '用户金额',
  `frozen_money` decimal(10,2) DEFAULT '0.00' COMMENT '冻结金额',
  `pay_points` mediumint NOT NULL DEFAULT '0' COMMENT '支付积分',
  `change_time` int unsigned NOT NULL COMMENT '变动时间',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `order_sn` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `order_id` int DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=512 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_account_log`
--

LOCK TABLES `tp_account_log` WRITE;
/*!40000 ALTER TABLE `tp_account_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_account_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_ad`
--

DROP TABLE IF EXISTS `tp_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_ad` (
  `ad_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '广告位置ID',
  `media_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '广告类型',
  `ad_name` varchar(60) NOT NULL DEFAULT '' COMMENT '广告名称',
  `ad_link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `ad_code` text NOT NULL COMMENT '图片地址',
  `start_time` int NOT NULL DEFAULT '0' COMMENT '投放时间',
  `end_time` int NOT NULL DEFAULT '0' COMMENT '结束时间',
  `link_man` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人',
  `link_email` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人邮箱',
  `link_phone` varchar(60) NOT NULL DEFAULT '' COMMENT '添加人联系电话',
  `click_count` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `enabled` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `orderby` smallint DEFAULT '50' COMMENT '排序',
  `target` tinyint(1) DEFAULT '0' COMMENT '是否开启浏览器新窗口',
  `bgcolor` varchar(20) DEFAULT NULL COMMENT '背景颜色',
  PRIMARY KEY (`ad_id`) USING BTREE,
  KEY `enabled` (`enabled`) USING BTREE,
  KEY `position_id` (`pid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_ad`
--

LOCK TABLES `tp_ad` WRITE;
/*!40000 ALTER TABLE `tp_ad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_ad_position`
--

DROP TABLE IF EXISTS `tp_ad_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_ad_position` (
  `position_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `position_name` varchar(60) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `ad_width` smallint unsigned NOT NULL DEFAULT '0' COMMENT '广告位宽度',
  `ad_height` smallint unsigned NOT NULL DEFAULT '0' COMMENT '广告位高度',
  `position_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '广告描述',
  `position_style` text COMMENT '模板',
  `is_open` tinyint(1) DEFAULT '0' COMMENT '0关闭1开启',
  PRIMARY KEY (`position_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=537 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_ad_position`
--

LOCK TABLES `tp_ad_position` WRITE;
/*!40000 ALTER TABLE `tp_ad_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_ad_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_admin`
--

DROP TABLE IF EXISTS `tp_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_admin` (
  `admin_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT 'email',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `ec_salt` varchar(10) DEFAULT NULL COMMENT '秘钥',
  `add_time` int NOT NULL DEFAULT '0' COMMENT '添加时间',
  `last_login` int NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `nav_list` text COMMENT '权限',
  `lang_type` varchar(50) NOT NULL DEFAULT '' COMMENT 'lang_type',
  `agency_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'agency_id',
  `suppliers_id` smallint unsigned DEFAULT '0' COMMENT 'suppliers_id',
  `todolist` longtext COMMENT 'todolist',
  `role_id` smallint DEFAULT '0' COMMENT '角色id',
  `province_id` int unsigned DEFAULT '0' COMMENT '加盟商省级id',
  `city_id` int unsigned DEFAULT '0' COMMENT '加盟商市级id',
  `district_id` int unsigned DEFAULT '0' COMMENT '加盟商区级id',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `update_time` int NOT NULL DEFAULT '0' COMMENT '更新时间戳',
  `delete_time` int NOT NULL DEFAULT '0' COMMENT '软删除标记',
  PRIMARY KEY (`admin_id`) USING BTREE,
  KEY `user_name` (`user_name`) USING BTREE,
  KEY `agency_id` (`agency_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_admin`
--

LOCK TABLES `tp_admin` WRITE;
/*!40000 ALTER TABLE `tp_admin` DISABLE KEYS */;
INSERT INTO `tp_admin` VALUES (1,'twbworld','','18bfbd528f9b86971ea76bc2cada199d',NULL,0,1546240030,'127.0.0.1',NULL,'',0,0,NULL,1,0,0,0,1545386657,1545726615,0),(2,'test','','1eee0c116a9e16244f923295541e51f9',NULL,0,1545806600,'127.0.0.1',NULL,'',0,0,NULL,2,0,0,0,1545386657,1545757686,0);
/*!40000 ALTER TABLE `tp_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_admin_log`
--

DROP TABLE IF EXISTS `tp_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_admin_log` (
  `log_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `admin_id` int DEFAULT NULL COMMENT '管理员id',
  `log_info` varchar(255) DEFAULT NULL COMMENT '日志描述',
  `log_ip` varchar(30) DEFAULT NULL COMMENT 'ip地址',
  `log_url` varchar(50) DEFAULT NULL COMMENT 'url',
  `log_time` int DEFAULT NULL COMMENT '日志时间',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=583 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_admin_log`
--

LOCK TABLES `tp_admin_log` WRITE;
/*!40000 ALTER TABLE `tp_admin_log` DISABLE KEYS */;
INSERT INTO `tp_admin_log` VALUES (496,1,'后台登录','127.0.0.1','/admintp/admin/login',1541134621),(497,1,'后台登录','127.0.0.1','/admintp/admin/login',1541134708),(498,1,'后台登录','127.0.0.1','/admintp/admin/login',1541134765),(499,1,'后台登录','127.0.0.1','/admintp/admin/login',1541134778),(500,1,'后台登录','127.0.0.1','/admintp/admin/login',1541145356),(501,1,'后台登录','127.0.0.1','/admintp/admin/login',1541145470),(502,1,'后台登录','127.0.0.1','/admintp/admin/login',1541147764),(503,1,'后台登录','127.0.0.1','/admintp/admin/login',1541149360),(504,1,'后台登录','127.0.0.1','/admintp/admin/login',1541152053),(505,1,'后台登录','127.0.0.1','/admintp/admin/login',1541155740),(506,1,'后台登录','127.0.0.1','/admintp/admin/login',1541157787),(507,1,'后台登录','127.0.0.1','/admintp/admin/login',1541158320),(508,1,'后台登录','127.0.0.1','/admintp/admin/login',1541174105),(509,1,'后台登录','127.0.0.1','/admintp/admin/login',1541176998),(510,1,'后台登录','127.0.0.1','/admintp/admin/login',1541177173),(511,1,'后台登录','127.0.0.1','/admintp/admin/login',1541177370),(512,1,'后台登录','127.0.0.1','/admintp/admin/login',1541177637),(513,1,'后台登录','127.0.0.1','/admintp/admin/login',1541177883),(514,1,'后台登录','127.0.0.1','/admintp/admin/login',1541178223),(515,1,'后台登录','127.0.0.1','/admintp/admin/login',1541179100),(516,1,'后台登录','127.0.0.1','/admintp/admin/login',1541179854),(517,1,'后台登录','127.0.0.1','/admintp/admin/login',1541220802),(518,1,'后台登录','127.0.0.1','/admintp/admin/login',1541226819),(519,1,'后台登录','127.0.0.1','/admintp/admin/login',1541252981),(520,1,'后台登录','127.0.0.1','/admintp/admin/login',1541257673),(521,1,'后台登录','127.0.0.1','/admintp/admin/login',1541337991),(522,1,'后台登录','127.0.0.1','/admintp/admin/login',1541398130),(523,1,'后台登录','127.0.0.1','/admintp/admin/login',1541399271),(524,1,'后台登录','127.0.0.1','/admintp/admin/login',1541401132),(525,1,'后台登录','127.0.0.1','/admintp/admin/login',1541586180),(526,1,'后台登录','127.0.0.1','/admintp/admin/login',1542105553),(527,1,'后台登录','127.0.0.1','/admintp/admin/login',1542181756),(528,1,'后台登录','127.0.0.1','/admintp/admin/login',1542780449),(529,1,'后台登录','127.0.0.1','/admintp/admin/login',1542789735),(530,1,'后台登录','127.0.0.1','/admintp/admin/login',1543038307),(531,1,'后台登录','127.0.0.1','/admintp/admin/login',1543129484),(532,1,'后台登录','127.0.0.1','/admintp/admin/login',1543139909),(533,1,'后台登录','127.0.0.1','/admintp/admin/login',1543313591),(534,1,'后台登录','127.0.0.1','/admintp/admin/login',1543333822),(535,1,'后台登录','127.0.0.1','/admintp/admin/login',1543494713),(536,1,'后台登录','127.0.0.1','/admintp/admin/login',1543931222),(537,1,'后台登录','127.0.0.1','/admintp/admin/login',1543931687),(538,1,'后台登录','127.0.0.1','/admintp/admin/login',1544157140),(539,1,'后台登录','127.0.0.1','/admintp/admin/login',1544187635),(540,1,'后台登录','127.0.0.1','/admintp/admin/login',1544447432),(541,1,'后台登录','127.0.0.1','/admintp/admin/login',1544533116),(542,1,'后台登录','127.0.0.1','/admintp/admin/login',1544536468),(543,1,'后台登录','127.0.0.1','/admintp/admin/login',1544938041),(544,1,'后台登录','127.0.0.1','/admintp/admin/login',1545055926),(545,1,'后台登录','127.0.0.1','/admintp/admin/login',1545056949),(546,1,'后台登录','127.0.0.1','/admintp/admin/login',1545317557),(547,1,'后台登录','127.0.0.1','/admintp/admin/login',1545372097),(548,1,'后台登录','127.0.0.1','/admintp/admin/login',1545384791),(549,1,'后台登录','127.0.0.1','/admintp/admin/login',1545385526),(550,1,'后台登录','127.0.0.1','/admintp/admin/login',1545385630),(551,1,'后台登录','127.0.0.1','/admintp/admin/login',1545385946),(552,1,'后台登录','127.0.0.1','/admintp/admin/login',1545386019),(553,1,'后台登录','127.0.0.1','/admintp/admin/login',1545386081),(554,1,'后台登录','127.0.0.1','/admintp/admin/login',1545386145),(555,1,'后台登录','127.0.0.1','/admintp/admin/login',1545386240),(556,1,'后台登录','127.0.0.1','/admintp/admin/login',1545386378),(557,1,'后台登录','127.0.0.1','/admintp/admin/login',1545386483),(558,1,'后台登录','127.0.0.1','/admintp/admin/login',1545386550),(559,1,'后台登录','127.0.0.1','/admintp/admin/login',1545386595),(560,1,'后台登录','127.0.0.1','/admintp/admin/login',1545386657),(561,1,'后台登录','127.0.0.1','/admintp/admin/login',1545568042),(562,1,'后台登录','127.0.0.1','/admintp/admin/login',1545636787),(563,1,'后台登录','127.0.0.1','/admintp/admin/login',1545643355),(564,1,'后台登录','127.0.0.1','/admintp/admin/login',1545730421),(565,2,'后台登录','127.0.0.1','/admintp/admin/login',1545730868),(566,1,'后台登录','127.0.0.1','/admintp/admin/login',1545732195),(567,2,'后台登录','127.0.0.1','/admintp/admin/login',1545732252),(568,1,'后台登录','127.0.0.1','/admintp/admin/login',1545741057),(569,2,'后台登录','127.0.0.1','/admintp/admin/login',1545741239),(570,1,'后台登录','127.0.0.1','/admintp/admin/login',1545742974),(571,2,'后台登录','127.0.0.1','/admintp/admin/login',1545745042),(572,1,'后台登录','127.0.0.1','/admintp/admin/login',1545754051),(573,1,'后台登录','127.0.0.1','/admintp/admin/login',1545755655),(574,1,'后台登录','127.0.0.1','/admintp/admin/login',1545757216),(575,2,'后台登录','127.0.0.1','/admintp/admin/login',1545806600),(576,1,'后台登录','127.0.0.1','/admintp/admin/login',1545807314),(577,1,'后台登录','127.0.0.1','/admintp/admin/login',1545824444),(578,1,'后台登录','127.0.0.1','/admintp/admin/login',1545980412),(579,1,'后台登录','127.0.0.1','/admintp/admin/login',1546238406),(580,1,'后台登录','127.0.0.1','/admintp/admin/login',1546238708),(581,1,'后台登录','127.0.0.1','/admintp/admin/login',1546238856),(582,1,'后台登录','127.0.0.1','/admintp/admin/login',1546240030);
/*!40000 ALTER TABLE `tp_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_admin_role`
--

DROP TABLE IF EXISTS `tp_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_admin_role` (
  `role_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `act_list` text COMMENT '权限列表',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `delete_time` int NOT NULL DEFAULT '0' COMMENT '软删除标记',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_admin_role`
--

LOCK TABLES `tp_admin_role` WRITE;
/*!40000 ALTER TABLE `tp_admin_role` DISABLE KEYS */;
INSERT INTO `tp_admin_role` VALUES (1,'超级管理员','all','管理全站',0),(2,'文章管理员','1,2,3,5','发布/更新/删除文章,文章分类处理',0);
/*!40000 ALTER TABLE `tp_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_area_region`
--

DROP TABLE IF EXISTS `tp_area_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_area_region` (
  `shipping_area_id` int unsigned NOT NULL DEFAULT '0' COMMENT '物流配置id',
  `region_id` int unsigned NOT NULL DEFAULT '0' COMMENT '地区id对应region表id',
  PRIMARY KEY (`shipping_area_id`,`region_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_area_region`
--

LOCK TABLES `tp_area_region` WRITE;
/*!40000 ALTER TABLE `tp_area_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_area_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_article`
--

DROP TABLE IF EXISTS `tp_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_article` (
  `article_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint NOT NULL DEFAULT '0' COMMENT '类别ID',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` longtext NOT NULL,
  `author` varchar(30) NOT NULL DEFAULT '' COMMENT '文章作者',
  `author_email` varchar(60) NOT NULL DEFAULT '' COMMENT '作者邮箱',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `article_type` tinyint unsigned NOT NULL DEFAULT '2',
  `is_open` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否显示,1:显示;0:不显示',
  `is_top` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '附件地址',
  `open_type` tinyint unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext COMMENT '文章摘要',
  `click` int DEFAULT '0' COMMENT '浏览量',
  `thumb` varchar(255) DEFAULT '' COMMENT '文章缩略图',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `update_time` int NOT NULL DEFAULT '0' COMMENT '更新时间戳',
  `publish_time` int DEFAULT NULL COMMENT '文章预告发布时间',
  `delete_time` int NOT NULL DEFAULT '0' COMMENT '软删除标记',
  PRIMARY KEY (`article_id`) USING BTREE,
  KEY `cat_id` (`cat_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_article`
--

LOCK TABLES `tp_article` WRITE;
/*!40000 ALTER TABLE `tp_article` DISABLE KEYS */;
INSERT INTO `tp_article` VALUES (1,5,'test1','&lt;figure class=&quot;image&quot;&gt;&lt;img src=&quot;/upload/201812/20181213/8f7310a9ab511824ead4e2a6ceea5588.png&quot;&gt;&lt;/figure&gt;&lt;p&gt;四季豆嗲&lt;/p&gt;','这是author','这是author_email','这是keywords',2,1,0,'这是file_url附件地址',0,'www.google.comaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','js',111,'/upload/201812/20181213/7305d3b61e5c51c4d04f3a248e6a46a8.jpg',1544014994,1545670315,1545321600,0),(2,4,'标题','&lt;figure class=&quot;image image-style-side&quot;&gt;&lt;img src=&quot;/upload/201812/20181212/7cec99b1ddbcafd8d93631fdf463f282.jpg&quot;&gt;&lt;figcaption&gt;图片标题&lt;/figcaption&gt;&lt;/figure&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;hello world!&lt;/p&gt;','','','',2,1,1,'',0,'','简述',0,'/upload/201812/20181212/1c7703a72a99d239e40e1a0d2cd05ae9.jpg',1544621107,1545644924,1544544000,0),(5,2,'44','&lt;figure class=&quot;image image-style-side&quot;&gt;&lt;img src=&quot;/upload/201812/20181213/a7e92f8deea5e7a7d6706a16450ef949.jpg&quot;&gt;&lt;/figure&gt;&lt;p&gt;sjiao&lt;/p&gt;','','','',2,0,0,'',0,'','jiansu',0,'/upload/201812/20181213/ab86218bd39253ef7a1d149ebcf57902.jpg',1544703675,1545669113,1544630400,0);
/*!40000 ALTER TABLE `tp_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_article2`
--

DROP TABLE IF EXISTS `tp_article2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_article2` (
  `article_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `cat_id` smallint NOT NULL DEFAULT '0' COMMENT '类别ID',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` longtext NOT NULL COMMENT '文章内容',
  `author` varchar(30) NOT NULL DEFAULT '' COMMENT '文章作者',
  `author_email` varchar(60) NOT NULL DEFAULT '' COMMENT '作者邮箱',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `article_type` tinyint unsigned NOT NULL DEFAULT '2' COMMENT '文章类型',
  `is_open` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '附件地址',
  `open_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'open_type',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext COMMENT '文章摘要',
  `click` int DEFAULT '0' COMMENT '浏览量',
  `publish_time` int DEFAULT '0' COMMENT '文章发布时间',
  `thumb` varchar(255) DEFAULT '' COMMENT '文章缩略图',
  PRIMARY KEY (`article_id`) USING BTREE,
  KEY `cat_id` (`cat_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_article2`
--

LOCK TABLES `tp_article2` WRITE;
/*!40000 ALTER TABLE `tp_article2` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_article2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_article_bak`
--

DROP TABLE IF EXISTS `tp_article_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_article_bak` (
  `article_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `cat_id` smallint NOT NULL DEFAULT '0' COMMENT '类别ID',
  `cat_id2` smallint DEFAULT '0' COMMENT '扩展类别ID',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` longtext NOT NULL COMMENT '文章内容',
  `author` varchar(30) NOT NULL DEFAULT '' COMMENT '文章作者',
  `author_email` varchar(60) NOT NULL DEFAULT '' COMMENT '作者邮箱',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `article_type` tinyint unsigned NOT NULL DEFAULT '2' COMMENT '文章类型',
  `is_open` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '附件地址',
  `open_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'open_type',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext COMMENT '文章摘要',
  `click` int DEFAULT '0' COMMENT '浏览量',
  `publish_time` int DEFAULT '0' COMMENT '文章发布时间',
  `thumb` varchar(255) DEFAULT '' COMMENT '文章缩略图',
  PRIMARY KEY (`article_id`) USING BTREE,
  KEY `cat_id` (`cat_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_article_bak`
--

LOCK TABLES `tp_article_bak` WRITE;
/*!40000 ALTER TABLE `tp_article_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_article_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_article_cat`
--

DROP TABLE IF EXISTS `tp_article_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_article_cat` (
  `cat_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(20) DEFAULT NULL COMMENT '类别名称',
  `cat_type` smallint DEFAULT '0' COMMENT '默认分组',
  `parent_id` smallint DEFAULT '0' COMMENT '夫级ID',
  `show_in_nav` tinyint(1) DEFAULT '0' COMMENT '是否导航显示',
  `sort_order` smallint DEFAULT '50' COMMENT '排序',
  `cat_desc` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `keywords` varchar(30) DEFAULT NULL COMMENT '搜索关键词',
  `cat_alias` varchar(20) DEFAULT NULL COMMENT '别名',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `update_time` int NOT NULL DEFAULT '0' COMMENT '更新时间戳',
  `delete_time` int NOT NULL DEFAULT '0' COMMENT '软删除',
  PRIMARY KEY (`cat_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_article_cat`
--

LOCK TABLES `tp_article_cat` WRITE;
/*!40000 ALTER TABLE `tp_article_cat` DISABLE KEYS */;
INSERT INTO `tp_article_cat` VALUES (1,'a',0,0,0,50,NULL,NULL,NULL,0,0,0),(2,'bb',0,0,0,50,'',NULL,NULL,0,1545752670,0),(3,'a-1',0,1,0,50,NULL,NULL,NULL,0,0,0),(4,'a-2',0,1,0,50,NULL,NULL,NULL,0,1545664152,0),(5,'a-1-1',0,3,0,50,NULL,NULL,NULL,0,1545753094,0);
/*!40000 ALTER TABLE `tp_article_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_article_cat2`
--

DROP TABLE IF EXISTS `tp_article_cat2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_article_cat2` (
  `cat_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `cat_name` varchar(20) DEFAULT NULL COMMENT '类别名称',
  `cat_type` smallint DEFAULT '0' COMMENT '系统分组',
  `parent_id` smallint DEFAULT NULL COMMENT '夫级ID',
  `show_in_nav` tinyint(1) DEFAULT '0' COMMENT '是否导航显示',
  `sort_order` smallint DEFAULT '50' COMMENT '排序',
  `cat_desc` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `keywords` varchar(30) DEFAULT NULL COMMENT '搜索关键词',
  `cat_alias` varchar(20) DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`cat_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_article_cat2`
--

LOCK TABLES `tp_article_cat2` WRITE;
/*!40000 ALTER TABLE `tp_article_cat2` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_article_cat2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_brand`
--

DROP TABLE IF EXISTS `tp_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_brand` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '品牌表',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `logo` varchar(80) NOT NULL DEFAULT '' COMMENT '品牌logo',
  `desc` text NOT NULL COMMENT '品牌描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌地址',
  `sort` int unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `cat_name` varchar(128) DEFAULT '' COMMENT '品牌分类',
  `parent_cat_id` int DEFAULT '0' COMMENT '分类id',
  `cat_id` int DEFAULT '0' COMMENT '分类id',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_brand`
--

LOCK TABLES `tp_brand` WRITE;
/*!40000 ALTER TABLE `tp_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_cart`
--

DROP TABLE IF EXISTS `tp_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车表',
  `user_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `session_id` char(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'session',
  `goods_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品货号',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `member_goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '会员折扣价',
  `goods_num` smallint unsigned DEFAULT '0' COMMENT '购买数量',
  `item_id` int DEFAULT '0' COMMENT '规格ID',
  `spec_key` varchar(64) DEFAULT '' COMMENT '商品规格key 对应tp_spec_goods_price 表',
  `spec_key_name` varchar(64) DEFAULT '' COMMENT '商品规格组合名称',
  `bar_code` varchar(64) DEFAULT '' COMMENT '商品条码',
  `selected` tinyint(1) DEFAULT '1' COMMENT '购物车选中状态',
  `add_time` int DEFAULT '0' COMMENT '加入购物车的时间',
  `prom_type` tinyint(1) DEFAULT '0' COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠,7 搭配购',
  `prom_id` int DEFAULT '0' COMMENT '活动id',
  `sku` varchar(128) DEFAULT '' COMMENT 'sku',
  `combination_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT ' 搭配购的组id/cart_id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `session_id` (`session_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `spec_key` (`spec_key`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_cart`
--

LOCK TABLES `tp_cart` WRITE;
/*!40000 ALTER TABLE `tp_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_combination`
--

DROP TABLE IF EXISTS `tp_combination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_combination` (
  `combination_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `is_on_sale` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '上下架，0下，1上',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '活动有效起始时间',
  `end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '活动有效截止时间',
  PRIMARY KEY (`combination_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='组合促销表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_combination`
--

LOCK TABLES `tp_combination` WRITE;
/*!40000 ALTER TABLE `tp_combination` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_combination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_combination_goods`
--

DROP TABLE IF EXISTS `tp_combination_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_combination_goods` (
  `combination_id` int NOT NULL,
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `key_name` varchar(255) NOT NULL DEFAULT '' COMMENT '规格名称',
  `goods_id` int NOT NULL,
  `item_id` int NOT NULL,
  `original_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '原价/商城价',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠价格',
  `is_master` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '1主0从'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='组合促销商品映射关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_combination_goods`
--

LOCK TABLES `tp_combination_goods` WRITE;
/*!40000 ALTER TABLE `tp_combination_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_combination_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_comment`
--

DROP TABLE IF EXISTS `tp_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_comment` (
  `comment_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `goods_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT 'email邮箱',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `content` text NOT NULL COMMENT '评论内容',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `ip_address` varchar(15) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `is_show` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '评论用户',
  `img` text COMMENT '晒单图片',
  `order_id` mediumint DEFAULT '0' COMMENT '订单id',
  `deliver_rank` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '物流评价等级',
  `goods_rank` tinyint(1) DEFAULT '0' COMMENT '商品评价等级',
  `service_rank` tinyint(1) DEFAULT '0' COMMENT '商家服务态度评价等级',
  `zan_num` int NOT NULL DEFAULT '0' COMMENT '被赞数',
  `zan_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '点赞用户id',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否匿名评价:0不是，1是',
  `rec_id` int DEFAULT NULL COMMENT '订单商品表ID',
  `sort` int unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`comment_id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `id_value` (`goods_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_comment`
--

LOCK TABLES `tp_comment` WRITE;
/*!40000 ALTER TABLE `tp_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_config`
--

DROP TABLE IF EXISTS `tp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_config` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) DEFAULT NULL COMMENT '配置的key键名',
  `value` varchar(512) DEFAULT NULL COMMENT '配置的val值',
  `inc_type` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `desc` varchar(50) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_config`
--

LOCK TABLES `tp_config` WRITE;
/*!40000 ALTER TABLE `tp_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_coupon`
--

DROP TABLE IF EXISTS `tp_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_coupon` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '优惠券名字',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发放类型 0下单赠送1 指定发放 2 免费领取 3线下发放',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券金额',
  `condition` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用条件',
  `createnum` int DEFAULT '0' COMMENT '发放数量',
  `send_num` int DEFAULT '0' COMMENT '已领取数量',
  `use_num` int DEFAULT '0' COMMENT '已使用数量',
  `send_start_time` int DEFAULT NULL COMMENT '发放开始时间',
  `send_end_time` int DEFAULT NULL COMMENT '发放结束时间',
  `use_start_time` int DEFAULT NULL COMMENT '使用开始时间',
  `use_end_time` int DEFAULT NULL COMMENT '使用结束时间',
  `add_time` int DEFAULT NULL COMMENT '添加时间',
  `status` int DEFAULT NULL COMMENT '状态：1有效,2无效',
  `use_type` tinyint(1) DEFAULT '0' COMMENT '使用范围：0全店通用1指定商品可用2指定分类商品可用',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `use_end_time` (`use_end_time`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_coupon`
--

LOCK TABLES `tp_coupon` WRITE;
/*!40000 ALTER TABLE `tp_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_coupon_list`
--

DROP TABLE IF EXISTS `tp_coupon_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_coupon_list` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '表id',
  `cid` int NOT NULL DEFAULT '0' COMMENT '优惠券 对应coupon表id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发放类型 1 按订单发放 2 注册 3 邀请 4 按用户发放',
  `uid` int NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int NOT NULL DEFAULT '0' COMMENT '订单id',
  `get_order_id` int DEFAULT '0' COMMENT '优惠券来自订单ID',
  `use_time` int NOT NULL DEFAULT '0' COMMENT '使用时间',
  `code` varchar(10) DEFAULT '' COMMENT '优惠券兑换码',
  `send_time` int NOT NULL DEFAULT '0' COMMENT '发放时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未使用1已使用2已过期',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `code` (`code`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_coupon_list`
--

LOCK TABLES `tp_coupon_list` WRITE;
/*!40000 ALTER TABLE `tp_coupon_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_coupon_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_delivery_doc`
--

DROP TABLE IF EXISTS `tp_delivery_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_delivery_doc` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '发货单ID',
  `order_id` int unsigned NOT NULL COMMENT '订单ID',
  `order_sn` varchar(64) NOT NULL DEFAULT '' COMMENT '订单编号',
  `user_id` int unsigned NOT NULL COMMENT '用户ID',
  `admin_id` int unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `consignee` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人',
  `zipcode` varchar(6) DEFAULT NULL COMMENT '邮编',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '联系手机',
  `country` int unsigned NOT NULL COMMENT '国ID',
  `province` int unsigned NOT NULL COMMENT '省ID',
  `city` int unsigned NOT NULL COMMENT '市ID',
  `district` int unsigned NOT NULL COMMENT '区ID',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `shipping_code` varchar(32) DEFAULT NULL COMMENT '物流code',
  `shipping_name` varchar(64) DEFAULT NULL COMMENT '快递名称',
  `shipping_price` decimal(10,2) DEFAULT '0.00' COMMENT '运费',
  `invoice_no` varchar(255) DEFAULT '' COMMENT '物流单号',
  `tel` varchar(64) DEFAULT NULL COMMENT '座机电话',
  `note` text COMMENT '管理员添加的备注信息',
  `best_time` int DEFAULT NULL COMMENT '友好收货时间',
  `create_time` int NOT NULL COMMENT '创建时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `send_type` tinyint(1) DEFAULT '0' COMMENT '发货方式0自填快递1在线预约2电子面单3无需物流',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='发货单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_delivery_doc`
--

LOCK TABLES `tp_delivery_doc` WRITE;
/*!40000 ALTER TABLE `tp_delivery_doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_delivery_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_distribut_goods`
--

DROP TABLE IF EXISTS `tp_distribut_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_distribut_goods` (
  `user_id` int DEFAULT NULL,
  `goods_id` int DEFAULT NULL,
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `sales` int DEFAULT NULL COMMENT '销量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='分销商销售表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_distribut_goods`
--

LOCK TABLES `tp_distribut_goods` WRITE;
/*!40000 ALTER TABLE `tp_distribut_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_distribut_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_distribut_level`
--

DROP TABLE IF EXISTS `tp_distribut_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_distribut_level` (
  `level_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `level_type` tinyint(1) DEFAULT '0' COMMENT '分销等级类别',
  `rate1` decimal(6,2) DEFAULT '0.00' COMMENT '一级佣金比例',
  `rate2` decimal(6,2) DEFAULT '0.00' COMMENT '二级佣金比例',
  `rate3` decimal(6,2) DEFAULT '0.00' COMMENT '三级佣金比例',
  `order_money` decimal(12,2) DEFAULT '0.00' COMMENT '升级条件',
  `level_name` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`level_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_distribut_level`
--

LOCK TABLES `tp_distribut_level` WRITE;
/*!40000 ALTER TABLE `tp_distribut_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_distribut_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_expense_log`
--

DROP TABLE IF EXISTS `tp_expense_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_expense_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL COMMENT '操作管理员',
  `money` decimal(10,2) DEFAULT NULL COMMENT '支出金额',
  `integral` int DEFAULT '0' COMMENT '赠送积分',
  `type` tinyint(1) DEFAULT '0' COMMENT '支出类型0用户提现,1订单退款,2其他,3注册,4邀请,5分享,6评论',
  `addtime` int DEFAULT NULL COMMENT '日志记录时间',
  `log_type_id` int DEFAULT '0' COMMENT '业务关联ID',
  `user_id` int DEFAULT '0' COMMENT '涉及会员id',
  `user_name` int DEFAULT '0' COMMENT '涉及用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED COMMENT='平台支出金额或赠送积分日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_expense_log`
--

LOCK TABLES `tp_expense_log` WRITE;
/*!40000 ALTER TABLE `tp_expense_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_expense_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_feedback`
--

DROP TABLE IF EXISTS `tp_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_feedback` (
  `msg_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '默认自增ID',
  `parent_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '回复留言ID',
  `user_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `msg_title` varchar(200) NOT NULL DEFAULT '' COMMENT '留言标题',
  `msg_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '留言类型',
  `msg_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '处理状态',
  `msg_content` text NOT NULL COMMENT '留言内容',
  `msg_time` int unsigned NOT NULL DEFAULT '0' COMMENT '留言时间',
  `message_img` varchar(255) NOT NULL DEFAULT '',
  `order_id` int unsigned NOT NULL DEFAULT '0',
  `msg_area` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_feedback`
--

LOCK TABLES `tp_feedback` WRITE;
/*!40000 ALTER TABLE `tp_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_flash_sale`
--

DROP TABLE IF EXISTS `tp_flash_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_flash_sale` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '活动标题',
  `goods_id` int NOT NULL COMMENT '参团商品ID',
  `item_id` bigint DEFAULT '0' COMMENT '对应spec_goods_price商品规格id',
  `price` float(10,2) NOT NULL COMMENT '活动价格',
  `goods_num` int DEFAULT '1' COMMENT '商品参加活动数',
  `buy_limit` int NOT NULL DEFAULT '1' COMMENT '每人限购数',
  `buy_num` int NOT NULL DEFAULT '0' COMMENT '已购买人数',
  `order_num` int DEFAULT '0' COMMENT '已下单数',
  `description` text COMMENT '活动描述',
  `start_time` int NOT NULL COMMENT '开始时间',
  `end_time` int NOT NULL COMMENT '结束时间',
  `is_end` tinyint(1) DEFAULT '0' COMMENT '是否已结束',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_flash_sale`
--

LOCK TABLES `tp_flash_sale` WRITE;
/*!40000 ALTER TABLE `tp_flash_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_flash_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_freight_config`
--

DROP TABLE IF EXISTS `tp_freight_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_freight_config` (
  `config_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `first_unit` double(16,4) NOT NULL DEFAULT '0.0000' COMMENT '首(重：体积：件）',
  `first_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '首(重：体积：件）运费',
  `continue_unit` double(16,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '继续加（件：重量：体积）区间',
  `continue_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '继续加（件：重量：体积）的运费',
  `template_id` int unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否是默认运费配置.0不是，1是',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED COMMENT='运费配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_freight_config`
--

LOCK TABLES `tp_freight_config` WRITE;
/*!40000 ALTER TABLE `tp_freight_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_freight_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_freight_region`
--

DROP TABLE IF EXISTS `tp_freight_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_freight_region` (
  `template_id` int unsigned NOT NULL DEFAULT '0' COMMENT '模板id',
  `config_id` int unsigned NOT NULL DEFAULT '0' COMMENT '运费模板配置ID',
  `region_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'region表id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_freight_region`
--

LOCK TABLES `tp_freight_region` WRITE;
/*!40000 ALTER TABLE `tp_freight_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_freight_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_freight_template`
--

DROP TABLE IF EXISTS `tp_freight_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_freight_template` (
  `template_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板ID',
  `template_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 件数；1 商品重量；2 商品体积',
  `is_enable_default` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否启用使用默认运费配置,0:不启用，1:启用',
  PRIMARY KEY (`template_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='运费模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_freight_template`
--

LOCK TABLES `tp_freight_template` WRITE;
/*!40000 ALTER TABLE `tp_freight_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_freight_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_friend_link`
--

DROP TABLE IF EXISTS `tp_friend_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_friend_link` (
  `link_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `link_name` varchar(255) NOT NULL DEFAULT '' COMMENT '链接名称',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `link_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '链接logo',
  `orderby` tinyint unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `target` tinyint(1) DEFAULT '1' COMMENT '是否新窗口打开',
  PRIMARY KEY (`link_id`) USING BTREE,
  KEY `show_order` (`orderby`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_friend_link`
--

LOCK TABLES `tp_friend_link` WRITE;
/*!40000 ALTER TABLE `tp_friend_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_friend_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_goods`
--

DROP TABLE IF EXISTS `tp_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_goods` (
  `goods_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `cat_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `extend_cat_id` int DEFAULT '0' COMMENT '扩展分类id',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品编号',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `click_count` int unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `brand_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `store_count` smallint unsigned NOT NULL DEFAULT '10' COMMENT '库存数量',
  `comment_count` smallint DEFAULT '0' COMMENT '商品评论数',
  `weight` int unsigned NOT NULL DEFAULT '0' COMMENT '商品重量克为单位',
  `volume` double(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '商品体积。单位立方米',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价',
  `price_ladder` text COMMENT '价格阶梯',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `goods_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简单描述',
  `goods_content` text COMMENT '商品详细描述',
  `mobile_content` text COMMENT '手机端商品详情',
  `original_img` varchar(255) NOT NULL DEFAULT '' COMMENT '商品上传原始图',
  `is_virtual` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否为虚拟商品 1是，0否',
  `virtual_indate` int DEFAULT '0' COMMENT '虚拟商品有效期',
  `virtual_limit` smallint DEFAULT '0' COMMENT '虚拟商品购买上限',
  `virtual_refund` tinyint(1) DEFAULT '1' COMMENT '是否允许过期退款， 1是，0否',
  `virtual_sales_sum` int unsigned NOT NULL DEFAULT '0' COMMENT '虚拟销售量',
  `virtual_collect_sum` int unsigned NOT NULL DEFAULT '0' COMMENT '虚拟收藏量',
  `collect_sum` int unsigned NOT NULL DEFAULT '0' COMMENT '收藏量',
  `is_on_sale` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否上架',
  `is_free_shipping` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否包邮0否1是',
  `sort` smallint unsigned NOT NULL DEFAULT '50' COMMENT '商品排序',
  `is_recommend` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_new` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否新品',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否热卖',
  `last_update` int unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `goods_type` smallint unsigned NOT NULL DEFAULT '0' COMMENT '商品所属类型id，取值表goods_type的cat_id',
  `give_integral` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '购买商品赠送积分',
  `exchange_integral` int NOT NULL DEFAULT '0' COMMENT '积分兑换：0不参与积分兑换，积分和现金的兑换比例见后台配置',
  `suppliers_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT '供货商ID',
  `sales_sum` int DEFAULT '0' COMMENT '商品销量',
  `prom_type` tinyint(1) DEFAULT '0' COMMENT '0默认1抢购2团购3优惠促销4预售5虚拟(5其实没用)6拼团7搭配购',
  `prom_id` int NOT NULL DEFAULT '0' COMMENT '优惠活动id',
  `commission` decimal(10,2) DEFAULT '0.00' COMMENT '佣金用于分销分成',
  `spu` varchar(128) DEFAULT '' COMMENT 'SPU',
  `sku` varchar(128) DEFAULT '' COMMENT 'SKU',
  `template_id` int unsigned DEFAULT '0' COMMENT '运费模板ID',
  `video` varchar(255) DEFAULT '' COMMENT '视频',
  PRIMARY KEY (`goods_id`) USING BTREE,
  KEY `goods_sn` (`goods_sn`) USING BTREE,
  KEY `cat_id` (`cat_id`) USING BTREE,
  KEY `last_update` (`last_update`) USING BTREE,
  KEY `brand_id` (`brand_id`) USING BTREE,
  KEY `goods_number` (`store_count`) USING BTREE,
  KEY `goods_weight` (`weight`) USING BTREE,
  KEY `sort_order` (`sort`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_goods`
--

LOCK TABLES `tp_goods` WRITE;
/*!40000 ALTER TABLE `tp_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_goods_activity`
--

DROP TABLE IF EXISTS `tp_goods_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_goods_activity` (
  `act_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `act_name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `act_desc` text NOT NULL COMMENT '活动描述',
  `act_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '活动类型:1预售2拼团',
  `goods_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '参加活动商品ID',
  `spec_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '商品规格ID',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `start_time` int unsigned NOT NULL COMMENT '活动开始时间',
  `end_time` int unsigned NOT NULL COMMENT '活动结束时间',
  `is_finished` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否已结束:0,正常；1,成功结束；2，失败结束。',
  `ext_info` text NOT NULL COMMENT '活动扩展配置',
  `act_count` mediumint NOT NULL DEFAULT '0' COMMENT '商品购买数',
  PRIMARY KEY (`act_id`) USING BTREE,
  KEY `act_name` (`act_name`,`act_type`,`goods_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_goods_activity`
--

LOCK TABLES `tp_goods_activity` WRITE;
/*!40000 ALTER TABLE `tp_goods_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_goods_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_goods_attr`
--

DROP TABLE IF EXISTS `tp_goods_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_goods_attr` (
  `goods_attr_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '商品属性id自增',
  `goods_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `attr_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT '属性id',
  `attr_value` text NOT NULL COMMENT '属性值',
  `attr_price` varchar(255) NOT NULL DEFAULT '' COMMENT '属性价格',
  PRIMARY KEY (`goods_attr_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `attr_id` (`attr_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_goods_attr`
--

LOCK TABLES `tp_goods_attr` WRITE;
/*!40000 ALTER TABLE `tp_goods_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_goods_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_goods_attribute`
--

DROP TABLE IF EXISTS `tp_goods_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_goods_attribute` (
  `attr_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(60) NOT NULL DEFAULT '' COMMENT '属性名称',
  `type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT '属性分类id',
  `attr_index` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否显示0不显示1显示',
  `attr_values` text NOT NULL COMMENT '可选值列表',
  `order` tinyint unsigned NOT NULL DEFAULT '50' COMMENT '属性排序',
  PRIMARY KEY (`attr_id`) USING BTREE,
  KEY `cat_id` (`type_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_goods_attribute`
--

LOCK TABLES `tp_goods_attribute` WRITE;
/*!40000 ALTER TABLE `tp_goods_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_goods_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_goods_category`
--

DROP TABLE IF EXISTS `tp_goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_goods_category` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '商品分类id',
  `name` varchar(90) NOT NULL DEFAULT '' COMMENT '商品分类名称',
  `mobile_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '手机端显示的商品分类名',
  `parent_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `parent_id_path` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '家族图谱',
  `level` tinyint(1) DEFAULT '0' COMMENT '等级',
  `sort_order` tinyint unsigned NOT NULL DEFAULT '50' COMMENT '顺序排序',
  `is_show` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `image` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '分类图片',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否推荐为热门分类',
  `cat_group` tinyint(1) DEFAULT '0' COMMENT '分类分组默认0',
  `commission_rate` tinyint(1) DEFAULT '0' COMMENT '分佣比例',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=581 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_goods_category`
--

LOCK TABLES `tp_goods_category` WRITE;
/*!40000 ALTER TABLE `tp_goods_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_goods_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_goods_collect`
--

DROP TABLE IF EXISTS `tp_goods_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_goods_collect` (
  `collect_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`collect_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_goods_collect`
--

LOCK TABLES `tp_goods_collect` WRITE;
/*!40000 ALTER TABLE `tp_goods_collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_goods_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_goods_consult`
--

DROP TABLE IF EXISTS `tp_goods_consult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_goods_consult` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '商品咨询id',
  `goods_id` int DEFAULT '0' COMMENT '商品id',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '网名',
  `add_time` int DEFAULT '0' COMMENT '咨询时间',
  `consult_type` tinyint(1) DEFAULT '1' COMMENT '1 商品咨询 2 支付咨询 3 配送 4 售后',
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '咨询内容',
  `parent_id` int DEFAULT '0' COMMENT '父id 用于管理员回复',
  `is_show` tinyint(1) DEFAULT '0' COMMENT '是否显示',
  `status` tinyint(1) DEFAULT '0' COMMENT '管理员回复状态，0未回复，1已回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_goods_consult`
--

LOCK TABLES `tp_goods_consult` WRITE;
/*!40000 ALTER TABLE `tp_goods_consult` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_goods_consult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_goods_coupon`
--

DROP TABLE IF EXISTS `tp_goods_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_goods_coupon` (
  `coupon_id` int NOT NULL COMMENT '优惠券id',
  `goods_id` int NOT NULL DEFAULT '0' COMMENT '指定的商品id：为零表示不指定商品',
  `goods_category_id` smallint NOT NULL DEFAULT '0' COMMENT '指定的商品分类：为零表示不指定分类',
  PRIMARY KEY (`coupon_id`,`goods_id`,`goods_category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_goods_coupon`
--

LOCK TABLES `tp_goods_coupon` WRITE;
/*!40000 ALTER TABLE `tp_goods_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_goods_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_goods_images`
--

DROP TABLE IF EXISTS `tp_goods_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_goods_images` (
  `img_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '图片id 自增',
  `goods_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  PRIMARY KEY (`img_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=948 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_goods_images`
--

LOCK TABLES `tp_goods_images` WRITE;
/*!40000 ALTER TABLE `tp_goods_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_goods_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_goods_type`
--

DROP TABLE IF EXISTS `tp_goods_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_goods_type` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_goods_type`
--

LOCK TABLES `tp_goods_type` WRITE;
/*!40000 ALTER TABLE `tp_goods_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_goods_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_goods_visit`
--

DROP TABLE IF EXISTS `tp_goods_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_goods_visit` (
  `visit_id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `goods_id` int NOT NULL COMMENT '商品ID',
  `user_id` int NOT NULL COMMENT '会员ID',
  `visittime` int NOT NULL COMMENT '浏览时间',
  `cat_id` int NOT NULL COMMENT '商品分类ID',
  `extend_cat_id` int NOT NULL COMMENT '商品扩展分类ID',
  PRIMARY KEY (`goods_id`,`user_id`,`visit_id`) USING BTREE,
  KEY `visit_id` (`visit_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=666 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='商品浏览历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_goods_visit`
--

LOCK TABLES `tp_goods_visit` WRITE;
/*!40000 ALTER TABLE `tp_goods_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_goods_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_group_buy`
--

DROP TABLE IF EXISTS `tp_group_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_group_buy` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '团购ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `item_id` bigint DEFAULT '0' COMMENT '对应spec_goods_price商品规格id',
  `price` decimal(10,2) NOT NULL COMMENT '团购价格',
  `goods_num` int DEFAULT '0' COMMENT '商品参团数',
  `buy_num` int unsigned NOT NULL DEFAULT '0' COMMENT '商品已购买数',
  `order_num` int unsigned NOT NULL DEFAULT '0' COMMENT '已下单人数',
  `virtual_num` int unsigned NOT NULL DEFAULT '0' COMMENT '虚拟购买数',
  `rebate` decimal(10,1) NOT NULL COMMENT '折扣',
  `intro` text COMMENT '本团介绍',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品原价',
  `goods_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品名称',
  `recommended` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐 0.未推荐 1.已推荐',
  `views` int unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `is_end` tinyint(1) DEFAULT '0' COMMENT '是否结束',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='团购商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_group_buy`
--

LOCK TABLES `tp_group_buy` WRITE;
/*!40000 ALTER TABLE `tp_group_buy` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_group_buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_hijack`
--

DROP TABLE IF EXISTS `tp_hijack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_hijack` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `hijack_url` varchar(255) DEFAULT NULL COMMENT '劫持URL',
  `page_url` varchar(255) DEFAULT NULL COMMENT '发生页面url',
  `add_time` int NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_hijack`
--

LOCK TABLES `tp_hijack` WRITE;
/*!40000 ALTER TABLE `tp_hijack` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_hijack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_industry_template`
--

DROP TABLE IF EXISTS `tp_industry_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_industry_template` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `industry_id` int unsigned NOT NULL COMMENT '行业id',
  `style_id` int unsigned NOT NULL COMMENT '风格id',
  `template_name` varchar(64) NOT NULL COMMENT '模板名称',
  `template_html` longtext NOT NULL COMMENT '保存编辑后的HTML',
  `add_time` int unsigned NOT NULL COMMENT '添加时间',
  `block_info` longtext NOT NULL COMMENT '接口数据',
  `thumb` varchar(255) DEFAULT NULL COMMENT '图片展示',
  `code_url` varchar(255) DEFAULT NULL COMMENT '二维码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_industry_template`
--

LOCK TABLES `tp_industry_template` WRITE;
/*!40000 ALTER TABLE `tp_industry_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_industry_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_invoice`
--

DROP TABLE IF EXISTS `tp_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_invoice` (
  `invoice_id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint DEFAULT NULL COMMENT '订单id',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `invoice_type` tinyint(1) DEFAULT '0' COMMENT '0普通发票1电子发票2增值税发票',
  `invoice_money` decimal(10,2) DEFAULT '0.00' COMMENT '发票金额',
  `invoice_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发票抬头',
  `invoice_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发票内容',
  `invoice_rate` decimal(10,4) DEFAULT NULL COMMENT '发票税率',
  `taxpayer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '纳税人识别号',
  `status` tinyint(1) DEFAULT '0' COMMENT '发票状态0待开1已开2作废',
  `atime` int DEFAULT '0' COMMENT '开票时间',
  `ctime` int DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`invoice_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=301 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='发票信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_invoice`
--

LOCK TABLES `tp_invoice` WRITE;
/*!40000 ALTER TABLE `tp_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_kf_access`
--

DROP TABLE IF EXISTS `tp_kf_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_kf_access` (
  `role_id` smallint unsigned NOT NULL,
  `node_id` smallint unsigned NOT NULL,
  `pid` smallint unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`) USING BTREE,
  KEY `nodeId` (`node_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_kf_access`
--

LOCK TABLES `tp_kf_access` WRITE;
/*!40000 ALTER TABLE `tp_kf_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_kf_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_kf_admin`
--

DROP TABLE IF EXISTS `tp_kf_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_kf_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login_name` varchar(155) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` smallint unsigned NOT NULL COMMENT '组ID',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态 1:启用 0:禁止',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `last_login_time` int unsigned NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) DEFAULT NULL COMMENT '最后登录IP',
  `last_location` varchar(100) DEFAULT NULL COMMENT '最后登录位置',
  `storeid` int unsigned NOT NULL COMMENT '企业id（店铺id）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_kf_admin`
--

LOCK TABLES `tp_kf_admin` WRITE;
/*!40000 ALTER TABLE `tp_kf_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_kf_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_kf_answer`
--

DROP TABLE IF EXISTS `tp_kf_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_kf_answer` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `que_id` int unsigned NOT NULL COMMENT '问题id',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `add_time` int unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_kf_answer`
--

LOCK TABLES `tp_kf_answer` WRITE;
/*!40000 ALTER TABLE `tp_kf_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_kf_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_kf_attr_question`
--

DROP TABLE IF EXISTS `tp_kf_attr_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_kf_attr_question` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) NOT NULL COMMENT '问题分类名称',
  `pid` int unsigned NOT NULL COMMENT '父分类id',
  `storeid` int unsigned NOT NULL DEFAULT '1' COMMENT '所属店铺id',
  `add_time` int unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_kf_attr_question`
--

LOCK TABLES `tp_kf_attr_question` WRITE;
/*!40000 ALTER TABLE `tp_kf_attr_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_kf_attr_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_kf_chatlog`
--

DROP TABLE IF EXISTS `tp_kf_chatlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_kf_chatlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_id` varchar(55) NOT NULL COMMENT '网页用户随机编号(仅为记录参考记录)',
  `kefu_id` varchar(55) NOT NULL COMMENT '客服的id',
  `content` text NOT NULL COMMENT '发送的内容',
  `timeline` int NOT NULL COMMENT '记录时间',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否删除  0：未删除 1：已删除',
  `need_send` tinyint(1) DEFAULT '0' COMMENT '0 不需要推送 1 需要推送',
  `from_name` varchar(155) NOT NULL DEFAULT '' COMMENT '消息来源用户名',
  `to_name` varchar(155) NOT NULL DEFAULT '' COMMENT '接收消息用户名',
  `storeid` int unsigned NOT NULL DEFAULT '1' COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '客服所属店铺名称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fromid` (`from_id`(4)) USING BTREE,
  KEY `toid` (`kefu_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_kf_chatlog`
--

LOCK TABLES `tp_kf_chatlog` WRITE;
/*!40000 ALTER TABLE `tp_kf_chatlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_kf_chatlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_kf_kefu`
--

DROP TABLE IF EXISTS `tp_kf_kefu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_kf_kefu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(155) DEFAULT NULL,
  `pwd` varchar(155) DEFAULT NULL COMMENT '密码',
  `sign` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0下线 1在线',
  `storeid` int unsigned NOT NULL DEFAULT '1' COMMENT '店铺id，默认1',
  `Auditing` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否审核  0：待审核  1：审核通过  2：审核不通过',
  `store_name` varchar(50) NOT NULL COMMENT '客服所属店铺名称',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否删除  0：未删除 1：已删除',
  `role` smallint unsigned NOT NULL DEFAULT '5' COMMENT '组ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_kf_kefu`
--

LOCK TABLES `tp_kf_kefu` WRITE;
/*!40000 ALTER TABLE `tp_kf_kefu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_kf_kefu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_kf_node`
--

DROP TABLE IF EXISTS `tp_kf_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_kf_node` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '节点名称',
  `title` varchar(50) NOT NULL COMMENT '菜单名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否激活 1：是 2：否',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `pid` smallint unsigned NOT NULL COMMENT '父ID',
  `level` tinyint unsigned NOT NULL COMMENT '节点等级',
  `data` varchar(255) DEFAULT NULL COMMENT '附加参数',
  `sort` smallint unsigned NOT NULL DEFAULT '0' COMMENT '排序权重',
  `display` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '菜单显示类型 0:不显示 1:导航菜单 2:左侧菜单',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `level` (`level`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_kf_node`
--

LOCK TABLES `tp_kf_node` WRITE;
/*!40000 ALTER TABLE `tp_kf_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_kf_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_kf_question`
--

DROP TABLE IF EXISTS `tp_kf_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_kf_question` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `link` varchar(255) DEFAULT NULL COMMENT '连接',
  `add_time` int unsigned NOT NULL COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用 0 ：不启用  1：启用',
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `storeid` int unsigned NOT NULL DEFAULT '1' COMMENT '店铺id',
  `is_host` tinyint unsigned NOT NULL COMMENT '是否热门  0：否 1：是',
  `is_common` tinyint unsigned NOT NULL COMMENT '是否常见 0：否 1：是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='问题分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_kf_question`
--

LOCK TABLES `tp_kf_question` WRITE;
/*!40000 ALTER TABLE `tp_kf_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_kf_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_kf_robot`
--

DROP TABLE IF EXISTS `tp_kf_robot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_kf_robot` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `robot_name` varchar(32) NOT NULL COMMENT '名称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `storeid` int unsigned NOT NULL COMMENT '店铺id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_kf_robot`
--

LOCK TABLES `tp_kf_robot` WRITE;
/*!40000 ALTER TABLE `tp_kf_robot` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_kf_robot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_kf_role`
--

DROP TABLE IF EXISTS `tp_kf_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_kf_role` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '后台组名',
  `pid` smallint unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `status` tinyint unsigned DEFAULT '0' COMMENT '是否激活 1：是 0：否',
  `sort` smallint unsigned NOT NULL DEFAULT '0' COMMENT '排序权重',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_kf_role`
--

LOCK TABLES `tp_kf_role` WRITE;
/*!40000 ALTER TABLE `tp_kf_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_kf_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_kf_role_user`
--

DROP TABLE IF EXISTS `tp_kf_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_kf_role_user` (
  `user_id` int unsigned NOT NULL,
  `role_id` smallint unsigned NOT NULL,
  KEY `group_id` (`role_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_kf_role_user`
--

LOCK TABLES `tp_kf_role_user` WRITE;
/*!40000 ALTER TABLE `tp_kf_role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_kf_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_kf_slogan`
--

DROP TABLE IF EXISTS `tp_kf_slogan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_kf_slogan` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '提示语id主键',
  `slogan` varchar(55) DEFAULT NULL COMMENT '标语（客服加载欢迎语）',
  `slogan_status` tinyint unsigned DEFAULT '1' COMMENT '提示语状态  0：不开启  1：开启',
  `auditing` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否审核提示语  0：待审核  1：审核通过  2：审核不通过',
  `timeline` int unsigned DEFAULT NULL COMMENT '提示语设置时间',
  `storeid` int unsigned NOT NULL COMMENT '提示语所属店铺id',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否删除  0：未删除 1：已删除',
  `kefuid` int unsigned NOT NULL DEFAULT '0' COMMENT '客服id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_kf_slogan`
--

LOCK TABLES `tp_kf_slogan` WRITE;
/*!40000 ALTER TABLE `tp_kf_slogan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_kf_slogan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_kf_store`
--

DROP TABLE IF EXISTS `tp_kf_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_kf_store` (
  `storeid` int unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `store_name` varchar(55) NOT NULL COMMENT '店铺名称',
  `avatar` varchar(255) NOT NULL COMMENT '店铺头像',
  `auditing` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否审核  0：待审核  1：审核通过  2：审核不通过',
  `timeline` int unsigned DEFAULT NULL COMMENT '提示语设置时间',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否删除  0：未删除 1：已删除',
  `webid` varchar(255) NOT NULL COMMENT '网站域名',
  `phone` char(11) NOT NULL COMMENT '企业电话',
  `city` varchar(255) NOT NULL COMMENT '企业地址',
  `email` varchar(255) NOT NULL COMMENT '企业邮箱',
  PRIMARY KEY (`storeid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_kf_store`
--

LOCK TABLES `tp_kf_store` WRITE;
/*!40000 ALTER TABLE `tp_kf_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_kf_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_kf_suggest`
--

DROP TABLE IF EXISTS `tp_kf_suggest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_kf_suggest` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '客户意见反馈主键id',
  `storeid` int unsigned NOT NULL COMMENT '店铺id',
  `kehuid` varchar(255) NOT NULL COMMENT '客户id',
  `is_satisfied` tinyint unsigned NOT NULL DEFAULT '3' COMMENT '满意度 0：很不满意  1：不满意 2：一般 3：满意 4：非常满意',
  `suggest` varchar(255) DEFAULT NULL COMMENT '建议',
  `timeline` int unsigned DEFAULT NULL COMMENT '反馈时间',
  `is_delete` tinyint unsigned NOT NULL COMMENT '是否删除  0：未删除   1：已删除',
  `kefu_id` int unsigned NOT NULL COMMENT '客服id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='客户意见表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_kf_suggest`
--

LOCK TABLES `tp_kf_suggest` WRITE;
/*!40000 ALTER TABLE `tp_kf_suggest` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_kf_suggest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_kf_weixin_merchant`
--

DROP TABLE IF EXISTS `tp_kf_weixin_merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_kf_weixin_merchant` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '联关v1_store表主键',
  `storeid` int DEFAULT NULL,
  `wx_type` tinyint(1) DEFAULT '0' COMMENT '众公号类型',
  `wx_url` varchar(100) DEFAULT NULL,
  `wx_token` varchar(50) DEFAULT NULL,
  `wx_EncodingAESKey` varchar(50) DEFAULT NULL COMMENT '消息加密密钥',
  `wx_raw_id` varchar(30) DEFAULT NULL COMMENT '微信原始ID',
  `wx_AppId` varchar(20) DEFAULT NULL,
  `wx_AppSecret` varchar(50) DEFAULT NULL,
  `wx_Random` tinyint(1) DEFAULT '0' COMMENT '是否随机回复',
  `wx_Subscribe` text COMMENT '关注后的回复',
  `wx_NoneReply` text COMMENT '无匹配时的回复',
  `media_id` varchar(255) DEFAULT NULL COMMENT '关注回复',
  `media_id2` varchar(255) DEFAULT NULL COMMENT '无匹配回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_kf_weixin_merchant`
--

LOCK TABLES `tp_kf_weixin_merchant` WRITE;
/*!40000 ALTER TABLE `tp_kf_weixin_merchant` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_kf_weixin_merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_menu`
--

DROP TABLE IF EXISTS `tp_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_menu` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '导航的id',
  `cat_id` int NOT NULL COMMENT '分类id',
  `text` varchar(32) NOT NULL DEFAULT '' COMMENT '导航名',
  `icon` varchar(32) DEFAULT '' COMMENT '图标的class',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `target` tinyint NOT NULL DEFAULT '0' COMMENT '跳转模式',
  `top` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '置顶',
  `enabled` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '开启',
  `delete_time` int NOT NULL DEFAULT '0' COMMENT '软删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `enabled` (`enabled`) USING BTREE,
  KEY `cat_id` (`cat_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_menu`
--

LOCK TABLES `tp_menu` WRITE;
/*!40000 ALTER TABLE `tp_menu` DISABLE KEYS */;
INSERT INTO `tp_menu` VALUES (69,1,'后台菜单','fas fa-sort-alpha-down','/admintp/menu/menuList.html',0,0,1,0),(1,0,'设置','fas fa-wrench','',0,0,1,0),(59,44,'test','','',0,0,1,1544871637),(64,61,'文章分类','fas fa-chart-pie','/admintp/article/categoryList.html',0,0,1,0),(37,44,'qq','','',0,0,1,1544871626),(67,1,'权限资源','fas fa-plug','/admintp/system/rightList.html',0,0,1,0),(58,0,'taaqqaa','','',0,0,1,1544872021),(61,0,'文章','far fa-newspaper','',0,0,1,0),(62,61,'文章列表','fas fa-list-ul','/admintp/article/articleList.html',0,0,1,0),(66,1,'角色管理','fas fa-user-lock','/admintp/admin/roleList.html',0,0,1,0),(65,1,'管理人员','fas fa-users','/admintp/admin/adminList.html',0,0,1,0),(68,1,'日志记录','fas fa-user-clock','/admintp/admin/logList.html',0,1,1,0);
/*!40000 ALTER TABLE `tp_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_menu_cfg`
--

DROP TABLE IF EXISTS `tp_menu_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_menu_cfg` (
  `menu_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(100) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `default_name` varchar(100) NOT NULL DEFAULT '' COMMENT '默认名称',
  `is_show` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `is_tab` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否切块',
  `menu_url` varchar(255) NOT NULL DEFAULT '' COMMENT '手机端url',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_menu_cfg`
--

LOCK TABLES `tp_menu_cfg` WRITE;
/*!40000 ALTER TABLE `tp_menu_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_menu_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_message`
--

DROP TABLE IF EXISTS `tp_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_message` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `admin_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT '管理者id',
  `message` text NOT NULL COMMENT '站内信内容',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '个体消息：0，全体消息1',
  `category` tinyint unsigned NOT NULL DEFAULT '0' COMMENT ' 系统消息：0，活动消息：1',
  `send_time` int unsigned NOT NULL COMMENT '发送时间',
  `data` text COMMENT '消息序列化内容',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_message`
--

LOCK TABLES `tp_message` WRITE;
/*!40000 ALTER TABLE `tp_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_message_activity`
--

DROP TABLE IF EXISTS `tp_message_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_message_activity` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `message_title` varchar(255) NOT NULL COMMENT '消息标题',
  `message_content` text COMMENT '消息内容',
  `img_uri` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `send_time` int unsigned NOT NULL COMMENT '发送时间',
  `end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `mmt_code` varchar(50) NOT NULL COMMENT '用户消息模板编号',
  `prom_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '1抢购2团购3优惠促销4预售5虚拟6拼团7搭配购8自定义图文消息9订单促销',
  `prom_id` int NOT NULL DEFAULT '0' COMMENT '活动id',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='活动消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_message_activity`
--

LOCK TABLES `tp_message_activity` WRITE;
/*!40000 ALTER TABLE `tp_message_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_message_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_message_logistics`
--

DROP TABLE IF EXISTS `tp_message_logistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_message_logistics` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `message_title` varchar(255) DEFAULT NULL COMMENT '消息标题',
  `message_content` text NOT NULL COMMENT '消息内容',
  `img_uri` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `send_time` int unsigned NOT NULL COMMENT '发送时间',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '单号',
  `order_id` int NOT NULL DEFAULT '0' COMMENT '物流订单id',
  `mmt_code` varchar(50) DEFAULT NULL COMMENT '用户消息模板编号',
  `type` tinyint unsigned DEFAULT '0' COMMENT '1到货通知2发货提醒3签收提醒4评价提醒5退货提醒6退款提醒7虚拟商品',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='物流消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_message_logistics`
--

LOCK TABLES `tp_message_logistics` WRITE;
/*!40000 ALTER TABLE `tp_message_logistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_message_logistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_message_notice`
--

DROP TABLE IF EXISTS `tp_message_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_message_notice` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `message_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '个体消息：0，全体消息:1',
  `message_title` varchar(255) DEFAULT NULL COMMENT '消息标题',
  `message_content` text NOT NULL COMMENT '消息内容',
  `send_time` int unsigned NOT NULL COMMENT '发送时间',
  `mmt_code` varchar(50) DEFAULT NULL COMMENT '用户消息模板编号',
  `type` tinyint unsigned DEFAULT '0' COMMENT '0系统公告1降价通知2优惠券到账提醒3优惠券使用提醒4优惠券即将过期提醒5预售订单尾款支付提醒6提现到账提醒',
  `prom_id` int NOT NULL DEFAULT '0' COMMENT '活动id',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='通知消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_message_notice`
--

LOCK TABLES `tp_message_notice` WRITE;
/*!40000 ALTER TABLE `tp_message_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_message_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_message_private`
--

DROP TABLE IF EXISTS `tp_message_private`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_message_private` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `message_content` text NOT NULL COMMENT '消息内容',
  `send_time` int unsigned NOT NULL COMMENT '发送时间',
  `send_user_id` mediumint unsigned NOT NULL COMMENT '发送者',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='私信消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_message_private`
--

LOCK TABLES `tp_message_private` WRITE;
/*!40000 ALTER TABLE `tp_message_private` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_message_private` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_mobile_block_info`
--

DROP TABLE IF EXISTS `tp_mobile_block_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_mobile_block_info` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `block_id` int NOT NULL COMMENT '所属板块id',
  `block_type` int unsigned NOT NULL COMMENT '板块类型',
  `title` varchar(120) DEFAULT NULL COMMENT '标题、描述、文字内容',
  `block_content` varchar(255) DEFAULT NULL COMMENT '其它信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_mobile_block_info`
--

LOCK TABLES `tp_mobile_block_info` WRITE;
/*!40000 ALTER TABLE `tp_mobile_block_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_mobile_block_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_mobile_template`
--

DROP TABLE IF EXISTS `tp_mobile_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_mobile_template` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `is_index` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否设为首页 0否 1是',
  `template_name` varchar(64) NOT NULL COMMENT '模板名称',
  `template_html` longtext NOT NULL COMMENT '保存编辑后的HTML',
  `is_show` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否显示 0不显示  1显示',
  `add_time` int unsigned NOT NULL COMMENT '添加时间',
  `block_info` longtext NOT NULL COMMENT '接口数据',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '模板类型 0内页  1首页',
  `thumb` varchar(64) DEFAULT NULL COMMENT '模板缩略图',
  `style_id` int DEFAULT '0' COMMENT '从模板库中添加风格id，',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_mobile_template`
--

LOCK TABLES `tp_mobile_template` WRITE;
/*!40000 ALTER TABLE `tp_mobile_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_mobile_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_navigation`
--

DROP TABLE IF EXISTS `tp_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_navigation` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '前台导航表',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '导航名称',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `is_new` tinyint(1) DEFAULT '1' COMMENT '是否新窗口',
  `sort` smallint DEFAULT '50' COMMENT '排序',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '链接地址',
  `position` enum('top','bottom') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'top' COMMENT '菜单位置，top顶部，bottom底部',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_navigation`
--

LOCK TABLES `tp_navigation` WRITE;
/*!40000 ALTER TABLE `tp_navigation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_news`
--

DROP TABLE IF EXISTS `tp_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_news` (
  `article_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint NOT NULL DEFAULT '0' COMMENT '类别ID',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '文章标题',
  `tags` char(64) DEFAULT NULL COMMENT '新闻标签',
  `content` longtext NOT NULL,
  `author` varchar(30) NOT NULL DEFAULT '' COMMENT '文章作者',
  `author_email` varchar(60) NOT NULL DEFAULT '' COMMENT '作者邮箱',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `article_type` tinyint unsigned NOT NULL DEFAULT '2',
  `is_open` tinyint unsigned NOT NULL DEFAULT '1',
  `add_time` int unsigned NOT NULL DEFAULT '0',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '附件地址',
  `open_type` tinyint unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `description` mediumtext COMMENT '文章摘要',
  `click` int DEFAULT '0' COMMENT '浏览量',
  `publish_time` int DEFAULT NULL COMMENT '文章预告发布时间',
  `thumb` varchar(255) DEFAULT '' COMMENT '文章缩略图',
  PRIMARY KEY (`article_id`) USING BTREE,
  KEY `cat_id` (`cat_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_news`
--

LOCK TABLES `tp_news` WRITE;
/*!40000 ALTER TABLE `tp_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_news_cat`
--

DROP TABLE IF EXISTS `tp_news_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_news_cat` (
  `cat_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(20) DEFAULT NULL COMMENT '类别名称',
  `cat_type` smallint DEFAULT '0' COMMENT '默认分组',
  `parent_id` smallint DEFAULT '0' COMMENT '夫级ID',
  `show_in_nav` tinyint(1) DEFAULT '0' COMMENT '是否导航显示',
  `sort_order` smallint DEFAULT '50' COMMENT '排序',
  `cat_desc` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `keywords` varchar(30) DEFAULT NULL COMMENT '搜索关键词',
  `cat_alias` varchar(20) DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`cat_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_news_cat`
--

LOCK TABLES `tp_news_cat` WRITE;
/*!40000 ALTER TABLE `tp_news_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_news_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_oauth_users`
--

DROP TABLE IF EXISTS `tp_oauth_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_oauth_users` (
  `tu_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '表自增ID',
  `user_id` mediumint NOT NULL COMMENT '用户表ID',
  `openid` varchar(255) NOT NULL COMMENT '第三方开放平台openid',
  `oauth` varchar(50) NOT NULL COMMENT '第三方授权平台',
  `unionid` varchar(255) DEFAULT NULL COMMENT 'unionid',
  `oauth_child` varchar(50) DEFAULT NULL COMMENT 'mp标识来自公众号, open标识来自开放平台,用于标识来自哪个第三方授权平台, 因为同是微信平台有来自公众号和开放平台',
  `nick_name` varchar(64) DEFAULT NULL COMMENT '绑定时的昵称',
  PRIMARY KEY (`tu_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_oauth_users`
--

LOCK TABLES `tp_oauth_users` WRITE;
/*!40000 ALTER TABLE `tp_oauth_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_oauth_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_order`
--

DROP TABLE IF EXISTS `tp_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_order` (
  `order_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '订单编号',
  `user_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
  `shipping_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '发货状态',
  `pay_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `consignee` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `country` int unsigned NOT NULL DEFAULT '0' COMMENT '国家',
  `province` int unsigned NOT NULL DEFAULT '0' COMMENT '省份',
  `city` int unsigned NOT NULL DEFAULT '0' COMMENT '城市',
  `district` int unsigned NOT NULL DEFAULT '0' COMMENT '县区',
  `twon` int DEFAULT '0' COMMENT '乡镇',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `zipcode` varchar(60) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `mobile` varchar(60) NOT NULL DEFAULT '' COMMENT '手机',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮件',
  `shipping_code` varchar(32) NOT NULL DEFAULT '' COMMENT '物流code',
  `shipping_name` varchar(120) NOT NULL DEFAULT '' COMMENT '物流名称',
  `pay_code` varchar(32) NOT NULL DEFAULT '' COMMENT '支付code',
  `pay_name` varchar(120) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `invoice_title` varchar(256) DEFAULT '' COMMENT '发票抬头',
  `taxpayer` varchar(30) DEFAULT '' COMMENT '纳税人识别号',
  `invoice_desc` varchar(30) DEFAULT NULL COMMENT '发票内容',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `shipping_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用余额',
  `coupon_price` decimal(10,2) DEFAULT '0.00' COMMENT '优惠券抵扣',
  `integral` int unsigned NOT NULL DEFAULT '0' COMMENT '使用积分',
  `integral_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用积分抵多少钱',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应付款金额',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单总价',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  `shipping_time` int DEFAULT '0' COMMENT '最后新发货时间',
  `confirm_time` int DEFAULT '0' COMMENT '收货确认时间',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT '第三方平台交易流水号',
  `prom_id` int unsigned DEFAULT '0' COMMENT '活动ID',
  `prom_type` tinyint unsigned DEFAULT '0' COMMENT '订单类型：0普通订单4预售订单5虚拟订单6拼团订单',
  `order_prom_id` smallint NOT NULL DEFAULT '0' COMMENT '活动id',
  `order_prom_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活动优惠金额',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格调整',
  `user_note` varchar(255) NOT NULL DEFAULT '' COMMENT '用户备注',
  `admin_note` varchar(255) DEFAULT '' COMMENT '管理员备注',
  `parent_sn` varchar(100) DEFAULT NULL COMMENT '父单单号',
  `is_distribut` tinyint(1) DEFAULT '0' COMMENT '是否已分成0未分成1已分成',
  `paid_money` decimal(10,2) DEFAULT '0.00' COMMENT '订金',
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '自提点门店id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户假删除标识,1:删除,0未删除',
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE KEY `order_sn` (`order_sn`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=588 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_order`
--

LOCK TABLES `tp_order` WRITE;
/*!40000 ALTER TABLE `tp_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_order_action`
--

DROP TABLE IF EXISTS `tp_order_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_order_action` (
  `action_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `order_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `action_user` int DEFAULT '0' COMMENT '操作人 0 为用户操作，其他为管理员id',
  `order_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
  `shipping_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '配送状态',
  `pay_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `action_note` varchar(255) NOT NULL DEFAULT '' COMMENT '操作备注',
  `log_time` int unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `status_desc` varchar(255) DEFAULT NULL COMMENT '状态描述',
  PRIMARY KEY (`action_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1601 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_order_action`
--

LOCK TABLES `tp_order_action` WRITE;
/*!40000 ALTER TABLE `tp_order_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_order_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_order_goods`
--

DROP TABLE IF EXISTS `tp_order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_order_goods` (
  `rec_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id自增',
  `order_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品货号',
  `goods_num` smallint unsigned NOT NULL DEFAULT '1' COMMENT '购买数量',
  `final_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品实际购买价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价',
  `member_goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '会员折扣价',
  `give_integral` mediumint unsigned DEFAULT '0' COMMENT '购买商品赠送积分',
  `item_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品规格id',
  `spec_key` varchar(128) DEFAULT '' COMMENT '商品规格key',
  `spec_key_name` varchar(128) DEFAULT '' COMMENT '规格对应的中文名字',
  `bar_code` varchar(64) NOT NULL DEFAULT '' COMMENT '条码',
  `is_comment` tinyint(1) DEFAULT '0' COMMENT '是否评价',
  `prom_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠,4预售',
  `prom_id` int unsigned DEFAULT '0' COMMENT '活动id',
  `is_send` tinyint(1) DEFAULT '0' COMMENT '0未发货，1已发货，2已换货，3已退货',
  `delivery_id` int DEFAULT '0' COMMENT '发货单ID',
  `sku` varchar(128) DEFAULT '' COMMENT 'sku',
  PRIMARY KEY (`rec_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=652 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_order_goods`
--

LOCK TABLES `tp_order_goods` WRITE;
/*!40000 ALTER TABLE `tp_order_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_payment`
--

DROP TABLE IF EXISTS `tp_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_payment` (
  `pay_id` tinyint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `pay_code` varchar(20) NOT NULL DEFAULT '' COMMENT '支付code',
  `pay_name` varchar(120) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `pay_fee` varchar(10) NOT NULL DEFAULT '' COMMENT '手续费',
  `pay_desc` text NOT NULL COMMENT '描述',
  `pay_order` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'pay_coder',
  `pay_config` text NOT NULL COMMENT '配置',
  `enabled` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '开启',
  `is_cod` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否货到付款',
  `is_online` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否在线支付',
  PRIMARY KEY (`pay_id`) USING BTREE,
  UNIQUE KEY `pay_code` (`pay_code`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_payment`
--

LOCK TABLES `tp_payment` WRITE;
/*!40000 ALTER TABLE `tp_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_pick_up`
--

DROP TABLE IF EXISTS `tp_pick_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_pick_up` (
  `pickup_id` int NOT NULL AUTO_INCREMENT COMMENT '自提点id',
  `pickup_name` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点名称',
  `pickup_pic` varchar(255) DEFAULT NULL COMMENT '门店头像',
  `pickup_details` text COMMENT '门店简介',
  `pickup_address` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点地址',
  `pickup_phone` varchar(30) NOT NULL DEFAULT '' COMMENT '自提点电话',
  `pickup_contact` varchar(20) NOT NULL DEFAULT '' COMMENT '自提点联系人',
  `province_id` int NOT NULL COMMENT '省id',
  `city_id` int NOT NULL COMMENT '市id',
  `district_id` int NOT NULL COMMENT '区id',
  `longitude` decimal(10,7) DEFAULT '0.0000000' COMMENT '经度',
  `latitude` decimal(10,7) DEFAULT '0.0000000' COMMENT '纬度',
  `open` tinyint DEFAULT '0' COMMENT '营业开始时间',
  `close` tinyint DEFAULT '0' COMMENT '营业打烊时间',
  `suppliersid` int NOT NULL COMMENT '供应商id',
  PRIMARY KEY (`pickup_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='自提点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_pick_up`
--

LOCK TABLES `tp_pick_up` WRITE;
/*!40000 ALTER TABLE `tp_pick_up` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_pick_up` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_plugin`
--

DROP TABLE IF EXISTS `tp_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_plugin` (
  `code` varchar(13) DEFAULT NULL COMMENT '插件编码',
  `name` varchar(55) DEFAULT NULL COMMENT '中文名字',
  `version` varchar(255) DEFAULT NULL COMMENT '插件的版本',
  `author` varchar(30) DEFAULT NULL COMMENT '插件作者',
  `config` text COMMENT '配置信息',
  `config_value` text COMMENT '配置值信息',
  `desc` varchar(255) DEFAULT NULL COMMENT '插件描述',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否启用',
  `type` varchar(50) DEFAULT NULL COMMENT '插件类型 payment支付 login 登陆 shipping物流',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `bank_code` text COMMENT '网银配置信息',
  `scene` tinyint(1) DEFAULT '0' COMMENT '使用场景 0PC+手机 1手机 2PC 3APP 4小程序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_plugin`
--

LOCK TABLES `tp_plugin` WRITE;
/*!40000 ALTER TABLE `tp_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_poster`
--

DROP TABLE IF EXISTS `tp_poster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_poster` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `poster_name` char(10) DEFAULT '' COMMENT '海报名称',
  `canvas_width` int DEFAULT '0' COMMENT '画布宽度',
  `canvas_height` int DEFAULT '0' COMMENT '画布高度',
  `poster_width` int DEFAULT '0' COMMENT '海报宽度',
  `poster_height` int DEFAULT '0' COMMENT '海报高度',
  `back_url` varchar(255) DEFAULT NULL COMMENT '海报路径',
  `canvas_x` int DEFAULT '0' COMMENT '画布x轴',
  `canvas_y` int DEFAULT '0' COMMENT '画布y轴',
  `enabled` tinyint(1) DEFAULT '0' COMMENT '是否启用 ： 0 = 未启用，1 = 已启用',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `add_time` int DEFAULT NULL COMMENT '添加时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='自定义海报';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_poster`
--

LOCK TABLES `tp_poster` WRITE;
/*!40000 ALTER TABLE `tp_poster` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_poster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_pre_sell`
--

DROP TABLE IF EXISTS `tp_pre_sell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_pre_sell` (
  `pre_sell_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '预售id',
  `goods_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `item_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '规格id',
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规格名称',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '预售标题',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '预售描述',
  `deposit_goods_num` int unsigned NOT NULL DEFAULT '0' COMMENT '订购商品数',
  `deposit_order_num` int unsigned NOT NULL DEFAULT '0' COMMENT '订购订单数',
  `stock_num` smallint unsigned NOT NULL DEFAULT '0' COMMENT '预售库存',
  `sell_start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '活动开始时间',
  `sell_end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `pay_start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '尾款支付开始时间',
  `pay_end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '尾款支付结束时间',
  `deposit_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订金',
  `price_ladder` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '价格阶梯。预定人数达到多少个时，价格为多少钱',
  `delivery_time_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '开始发货时间描述',
  `is_finished` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否已结束:0,正常；1，结束（待处理）；2,成功结束；3，失败结束。',
  PRIMARY KEY (`pre_sell_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_pre_sell`
--

LOCK TABLES `tp_pre_sell` WRITE;
/*!40000 ALTER TABLE `tp_pre_sell` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_pre_sell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_prom_goods`
--

DROP TABLE IF EXISTS `tp_prom_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_prom_goods` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '促销活动名称',
  `type` int NOT NULL DEFAULT '0' COMMENT '促销类型',
  `expression` varchar(100) NOT NULL DEFAULT '' COMMENT '优惠体现',
  `description` text COMMENT '活动描述',
  `start_time` int NOT NULL COMMENT '活动开始时间',
  `end_time` int NOT NULL COMMENT '活动结束时间',
  `is_end` tinyint(1) DEFAULT '0' COMMENT '是否已结束',
  `group` varchar(255) DEFAULT NULL COMMENT '适用范围',
  `prom_img` varchar(150) DEFAULT NULL COMMENT '活动宣传图片',
  `buy_limit` int DEFAULT NULL COMMENT '每人限购数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_prom_goods`
--

LOCK TABLES `tp_prom_goods` WRITE;
/*!40000 ALTER TABLE `tp_prom_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_prom_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_prom_goods_item`
--

DROP TABLE IF EXISTS `tp_prom_goods_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_prom_goods_item` (
  `prom_id` int unsigned NOT NULL COMMENT '活动id',
  `goods_id` int unsigned NOT NULL COMMENT '商品id',
  `item_id` int NOT NULL COMMENT '商品规格id',
  `goods_name` varchar(120) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `image` varchar(255) DEFAULT NULL COMMENT '商品图片'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_prom_goods_item`
--

LOCK TABLES `tp_prom_goods_item` WRITE;
/*!40000 ALTER TABLE `tp_prom_goods_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_prom_goods_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_prom_order`
--

DROP TABLE IF EXISTS `tp_prom_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_prom_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '活动名称',
  `type` int NOT NULL DEFAULT '0' COMMENT '活动类型',
  `money` float(10,2) DEFAULT '0.00' COMMENT '最小金额',
  `expression` varchar(100) DEFAULT NULL COMMENT '优惠体现',
  `description` text COMMENT '活动描述',
  `start_time` int DEFAULT NULL COMMENT '活动开始时间',
  `end_time` int DEFAULT NULL COMMENT '活动结束时间',
  `is_close` tinyint(1) DEFAULT '0',
  `group` varchar(255) DEFAULT NULL COMMENT '适用范围',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_prom_order`
--

LOCK TABLES `tp_prom_order` WRITE;
/*!40000 ALTER TABLE `tp_prom_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_prom_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_rebate_log`
--

DROP TABLE IF EXISTS `tp_rebate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_rebate_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分成记录表',
  `user_id` int DEFAULT '0' COMMENT '获佣用户',
  `buy_user_id` int DEFAULT '0' COMMENT '购买人id',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '购买人名称',
  `order_sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '订单编号',
  `order_id` int DEFAULT '0' COMMENT '订单id',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '订单商品总额',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '获佣金额',
  `level` tinyint(1) DEFAULT '1' COMMENT '获佣用户级别',
  `create_time` int DEFAULT '0' COMMENT '分成记录生成时间',
  `confirm` int DEFAULT '0' COMMENT '确定收货时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未付款,1已付款, 2等待分成(已收货) 3已分成, 4已取消',
  `confirm_time` int DEFAULT '0' COMMENT '确定分成或者取消时间',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '如果是取消, 有取消备注',
  `detail` varchar(1024) DEFAULT NULL COMMENT '记录该笔佣金中来自每个商品的分佣详情',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_rebate_log`
--

LOCK TABLES `tp_rebate_log` WRITE;
/*!40000 ALTER TABLE `tp_rebate_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_rebate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_recharge`
--

DROP TABLE IF EXISTS `tp_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_recharge` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '会员ID',
  `nickname` varchar(50) DEFAULT NULL COMMENT '会员昵称',
  `order_sn` varchar(30) NOT NULL DEFAULT '' COMMENT '充值单号',
  `account` decimal(10,2) DEFAULT '0.00' COMMENT '充值金额',
  `ctime` int DEFAULT NULL COMMENT '充值时间',
  `pay_time` int DEFAULT NULL COMMENT '支付时间',
  `pay_code` varchar(20) DEFAULT NULL,
  `pay_name` varchar(80) DEFAULT NULL COMMENT '支付方式',
  `pay_status` tinyint(1) DEFAULT '0' COMMENT '充值状态0:待支付 1:充值成功 2:交易关闭',
  `buy_vip` tinyint(1) DEFAULT '0' COMMENT '是否为VIP充值，1是',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_recharge`
--

LOCK TABLES `tp_recharge` WRITE;
/*!40000 ALTER TABLE `tp_recharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_region`
--

DROP TABLE IF EXISTS `tp_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_region` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(32) DEFAULT NULL COMMENT '地区名称',
  `level` tinyint DEFAULT '0' COMMENT '地区等级 分省市县区',
  `parent_id` int DEFAULT NULL COMMENT '父id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=47503 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_region`
--

LOCK TABLES `tp_region` WRITE;
/*!40000 ALTER TABLE `tp_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_region2`
--

DROP TABLE IF EXISTS `tp_region2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_region2` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(20) NOT NULL COMMENT '地区名称',
  `parent_id` int DEFAULT NULL COMMENT '父id',
  `level` tinyint(1) DEFAULT NULL COMMENT '地区等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3524 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_region2`
--

LOCK TABLES `tp_region2` WRITE;
/*!40000 ALTER TABLE `tp_region2` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_region2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_remittance`
--

DROP TABLE IF EXISTS `tp_remittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_remittance` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分销用户转账记录表',
  `user_id` int DEFAULT '0' COMMENT '汇款的用户id',
  `bank_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '收款银行名称',
  `account_bank` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行账号',
  `account_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '开户人名称',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '汇款金额',
  `status` tinyint(1) DEFAULT '0' COMMENT '0汇款失败 1汇款成功',
  `handle_time` int DEFAULT '0' COMMENT '处理时间',
  `create_time` int DEFAULT '0' COMMENT '申请时间',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '汇款备注',
  `admin_id` int DEFAULT '0' COMMENT '处理管理员id',
  `withdrawals_id` int DEFAULT '0' COMMENT '提现申请表id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_remittance`
--

LOCK TABLES `tp_remittance` WRITE;
/*!40000 ALTER TABLE `tp_remittance` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_remittance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_reply`
--

DROP TABLE IF EXISTS `tp_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_reply` (
  `reply_id` int NOT NULL AUTO_INCREMENT COMMENT '回复id',
  `comment_id` int NOT NULL COMMENT '评论id：关联评论表',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT '父类id，0为最顶级',
  `content` text NOT NULL COMMENT '回复内容',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '回复人的昵称',
  `to_name` varchar(255) NOT NULL DEFAULT '' COMMENT '被回复人的昵称',
  `deleted` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '未删除0；删除：1',
  `reply_time` int unsigned NOT NULL COMMENT '回复时间',
  PRIMARY KEY (`reply_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_reply`
--

LOCK TABLES `tp_reply` WRITE;
/*!40000 ALTER TABLE `tp_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_return_goods`
--

DROP TABLE IF EXISTS `tp_return_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_return_goods` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '退货申请表id自增',
  `rec_id` int DEFAULT '0' COMMENT 'order_goods表id',
  `order_id` int DEFAULT '0' COMMENT '订单id',
  `order_sn` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '订单编号',
  `goods_id` int DEFAULT '0' COMMENT '商品id',
  `goods_num` int DEFAULT '1' COMMENT '退货数量',
  `type` tinyint(1) DEFAULT '0' COMMENT '0仅退款 1退货退款 2换货',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '退换货原因',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '问题描述',
  `imgs` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '拍照图片路径',
  `addtime` int DEFAULT '0' COMMENT '申请时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '-2用户取消-1不同意0待审核1通过2已发货3已收货4换货完成5退款完成',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '客服备注',
  `user_id` int DEFAULT '0' COMMENT '用户id',
  `spec_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '商品规格key 对应tp_spec_goods_price 表',
  `seller_delivery` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '换货服务，卖家重新发货信息',
  `refund_money` decimal(10,2) DEFAULT '0.00' COMMENT '退还金额',
  `refund_deposit` decimal(10,2) DEFAULT '0.00' COMMENT '退还余额',
  `refund_integral` int DEFAULT '0' COMMENT '退还积分',
  `refund_type` tinyint(1) DEFAULT '0' COMMENT '退款类型',
  `refund_mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退款备注',
  `refund_time` int DEFAULT '0' COMMENT '退款时间',
  `is_receive` tinyint DEFAULT '0' COMMENT '申请售后时是否收到货物',
  `delivery` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '用户发货信息',
  `checktime` int DEFAULT NULL COMMENT '卖家审核时间',
  `receivetime` int DEFAULT NULL COMMENT '卖家收货时间',
  `canceltime` int DEFAULT NULL COMMENT '用户取消时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_return_goods`
--

LOCK TABLES `tp_return_goods` WRITE;
/*!40000 ALTER TABLE `tp_return_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_return_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_search_word`
--

DROP TABLE IF EXISTS `tp_search_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_search_word` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '搜索表ID',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '搜索关键词，商品关键词',
  `pinyin_full` varchar(255) NOT NULL DEFAULT '' COMMENT '拼音全拼',
  `pinyin_simple` varchar(255) NOT NULL DEFAULT '' COMMENT '拼音简写',
  `search_num` int NOT NULL DEFAULT '0' COMMENT '搜索次数',
  `goods_num` int NOT NULL DEFAULT '0' COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='搜索关键词表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_search_word`
--

LOCK TABLES `tp_search_word` WRITE;
/*!40000 ALTER TABLE `tp_search_word` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_search_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_shipping`
--

DROP TABLE IF EXISTS `tp_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_shipping` (
  `shipping_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '物流公司id',
  `shipping_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `shipping_code` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司编码',
  `is_open` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `shipping_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '物流描述',
  `shipping_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司logo',
  `template_width` int unsigned NOT NULL DEFAULT '0' COMMENT '运单模板宽度',
  `template_height` int unsigned NOT NULL DEFAULT '0' COMMENT '运单模板高度',
  `template_offset_x` int unsigned NOT NULL DEFAULT '0' COMMENT '运单模板左偏移量',
  `template_offset_y` int unsigned NOT NULL DEFAULT '0' COMMENT '运单模板上偏移量',
  `template_img` varchar(255) NOT NULL DEFAULT '' COMMENT '运单模板图片',
  `template_html` text NOT NULL COMMENT '打印项偏移校正',
  PRIMARY KEY (`shipping_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_shipping`
--

LOCK TABLES `tp_shipping` WRITE;
/*!40000 ALTER TABLE `tp_shipping` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_shipping_area`
--

DROP TABLE IF EXISTS `tp_shipping_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_shipping_area` (
  `shipping_area_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `shipping_area_name` varchar(150) NOT NULL DEFAULT '' COMMENT '配送区域名称',
  `shipping_code` varchar(50) NOT NULL DEFAULT '0' COMMENT '物流id',
  `config` text NOT NULL COMMENT '配置首重续重等...序列化存储',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认',
  PRIMARY KEY (`shipping_area_id`) USING BTREE,
  KEY `shipping_id` (`shipping_code`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_shipping_area`
--

LOCK TABLES `tp_shipping_area` WRITE;
/*!40000 ALTER TABLE `tp_shipping_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_shipping_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_shop`
--

DROP TABLE IF EXISTS `tp_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_shop` (
  `shop_id` int NOT NULL AUTO_INCREMENT COMMENT '门店索引id',
  `shop_name` varchar(50) NOT NULL DEFAULT '' COMMENT '门店名称',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '会员id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '会员名称',
  `shopper_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店主卖家用户名',
  `province_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '门店所在省份ID',
  `city_id` mediumint NOT NULL DEFAULT '0' COMMENT '门店所在城市ID',
  `district_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '门店所在地区ID',
  `shop_address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地区',
  `longitude` decimal(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '门店地址经度',
  `latitude` decimal(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '门店地址纬度',
  `shop_zip` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `suppliers_id` int unsigned NOT NULL DEFAULT '0' COMMENT '供应商id，0表示没有',
  `shop_status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '门店状态，0关闭，1开启',
  `work_start_time` varchar(10) NOT NULL DEFAULT '' COMMENT '每天营业起始时间',
  `work_end_time` varchar(10) NOT NULL DEFAULT '' COMMENT '每天营业截止时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '开店时间',
  `shop_phone_code` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话区号',
  `shop_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '商家电话',
  `monday` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '星期一是否营业,0不是,1是',
  `tuesday` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '星期二是否营业，0不是1是',
  `wednesday` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '星期三是否营业，0不是1是',
  `thursday` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '星期四是否营业，0不是1是',
  `friday` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '星期五是否营业，0不是1是',
  `saturday` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '星期六是否营业，0不是1是',
  `sunday` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '星期日是否营业，0不是1是',
  `deleted` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '未删除0，已删除1',
  `shop_desc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`shop_id`) USING BTREE,
  KEY `store_name` (`shop_name`) USING BTREE,
  KEY `store_state` (`shop_status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='门店自提点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_shop`
--

LOCK TABLES `tp_shop` WRITE;
/*!40000 ALTER TABLE `tp_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_shop_images`
--

DROP TABLE IF EXISTS `tp_shop_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_shop_images` (
  `shop_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  KEY `shop_id` (`shop_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_shop_images`
--

LOCK TABLES `tp_shop_images` WRITE;
/*!40000 ALTER TABLE `tp_shop_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_shop_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_shop_order`
--

DROP TABLE IF EXISTS `tp_shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_shop_order` (
  `shop_order_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '提货核销码。主键',
  `order_id` mediumint NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `shop_id` int unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `take_time` datetime NOT NULL COMMENT '提货时间',
  `is_write_off` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否核销。0未核销，1已核销',
  `write_off_time` int unsigned NOT NULL DEFAULT '0' COMMENT '核销时间',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '记录插入时间',
  PRIMARY KEY (`shop_order_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='门店订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_shop_order`
--

LOCK TABLES `tp_shop_order` WRITE;
/*!40000 ALTER TABLE `tp_shop_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_shopper`
--

DROP TABLE IF EXISTS `tp_shopper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_shopper` (
  `shopper_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '门店id',
  `shopper_name` varchar(50) NOT NULL DEFAULT '' COMMENT '门店账号',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `shop_id` int NOT NULL DEFAULT '0' COMMENT '门店Id',
  `last_login_time` int unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`shopper_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='门店自提点管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_shopper`
--

LOCK TABLES `tp_shopper` WRITE;
/*!40000 ALTER TABLE `tp_shopper` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_shopper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_shopper_log`
--

DROP TABLE IF EXISTS `tp_shopper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_shopper_log` (
  `log_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `log_content` varchar(50) NOT NULL DEFAULT '' COMMENT '日志内容',
  `log_time` int unsigned NOT NULL COMMENT '日志时间',
  `log_shopper_id` int unsigned NOT NULL COMMENT '卖家编号',
  `log_shopper_name` varchar(50) NOT NULL DEFAULT '' COMMENT '门店帐号',
  `log_shop_id` int unsigned NOT NULL COMMENT '门店id',
  `log_shopper_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '门店ip',
  `log_url` varchar(50) NOT NULL DEFAULT '' COMMENT '日志url',
  `log_state` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '日志状态(0-失败 1-成功)',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='门店自提点管理员日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_shopper_log`
--

LOCK TABLES `tp_shopper_log` WRITE;
/*!40000 ALTER TABLE `tp_shopper_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_shopper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_sms_log`
--

DROP TABLE IF EXISTS `tp_sms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_sms_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '表id',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号',
  `session_id` varchar(128) DEFAULT '' COMMENT 'session_id',
  `add_time` int DEFAULT '0' COMMENT '发送时间',
  `code` varchar(10) DEFAULT '' COMMENT '验证码',
  `status` int NOT NULL DEFAULT '0' COMMENT '发送状态,1:成功,0:失败',
  `msg` varchar(255) DEFAULT NULL COMMENT '短信内容',
  `scene` int DEFAULT '0' COMMENT '发送场景,1:用户注册,2:找回密码,3:客户下单,4:客户支付,5:商家发货,6:身份验证',
  `error_msg` text COMMENT '发送短信异常内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_sms_log`
--

LOCK TABLES `tp_sms_log` WRITE;
/*!40000 ALTER TABLE `tp_sms_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_sms_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_sms_template`
--

DROP TABLE IF EXISTS `tp_sms_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_sms_template` (
  `tpl_id` mediumint NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sms_sign` varchar(50) NOT NULL DEFAULT '' COMMENT '短信签名',
  `sms_tpl_code` varchar(100) NOT NULL DEFAULT '' COMMENT '短信模板ID',
  `tpl_content` varchar(512) NOT NULL DEFAULT '' COMMENT '发送短信内容',
  `send_scene` varchar(100) NOT NULL DEFAULT '' COMMENT '短信发送场景',
  `add_time` int NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`tpl_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_sms_template`
--

LOCK TABLES `tp_sms_template` WRITE;
/*!40000 ALTER TABLE `tp_sms_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_sms_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_spec`
--

DROP TABLE IF EXISTS `tp_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_spec` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '规格表',
  `type_id` int DEFAULT '0' COMMENT '规格类型',
  `name` varchar(55) DEFAULT NULL COMMENT '规格名称',
  `order` int DEFAULT '50' COMMENT '排序',
  `is_upload_image` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否可上传规格图.0不可，1可以',
  `search_index` tinyint(1) DEFAULT '1' COMMENT '是否需要检索：1是，0否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_spec`
--

LOCK TABLES `tp_spec` WRITE;
/*!40000 ALTER TABLE `tp_spec` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_spec_goods_price`
--

DROP TABLE IF EXISTS `tp_spec_goods_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_spec_goods_price` (
  `item_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '规格商品id',
  `goods_id` int DEFAULT '0' COMMENT '商品id',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '规格键名',
  `key_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '规格键名中文',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `commission` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '佣金用于分销分成',
  `store_count` int unsigned DEFAULT '10' COMMENT '库存数量',
  `bar_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '商品条形码',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'SKU',
  `spec_img` varchar(255) DEFAULT NULL COMMENT '规格商品主图',
  `prom_id` int DEFAULT '0' COMMENT '活动id',
  `prom_type` tinyint DEFAULT '0' COMMENT '参加活动类型',
  PRIMARY KEY (`item_id`) USING BTREE,
  KEY `key` (`key`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=377 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_spec_goods_price`
--

LOCK TABLES `tp_spec_goods_price` WRITE;
/*!40000 ALTER TABLE `tp_spec_goods_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_spec_goods_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_spec_image`
--

DROP TABLE IF EXISTS `tp_spec_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_spec_image` (
  `goods_id` int DEFAULT '0' COMMENT '商品规格图片表id',
  `spec_image_id` int DEFAULT '0' COMMENT '规格项id',
  `src` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '商品规格图片路径'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_spec_image`
--

LOCK TABLES `tp_spec_image` WRITE;
/*!40000 ALTER TABLE `tp_spec_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_spec_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_spec_item`
--

DROP TABLE IF EXISTS `tp_spec_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_spec_item` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '规格项id',
  `spec_id` int DEFAULT NULL COMMENT '规格id',
  `item` varchar(54) DEFAULT NULL COMMENT '规格项',
  `order_index` int unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_spec_item`
--

LOCK TABLES `tp_spec_item` WRITE;
/*!40000 ALTER TABLE `tp_spec_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_spec_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_stock_log`
--

DROP TABLE IF EXISTS `tp_stock_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_stock_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `goods_spec` varchar(50) DEFAULT NULL COMMENT '商品规格',
  `order_sn` varchar(30) DEFAULT NULL COMMENT '订单编号',
  `muid` int DEFAULT NULL COMMENT '操作用户ID',
  `stock` int DEFAULT NULL COMMENT '更改库存',
  `ctime` int DEFAULT NULL COMMENT '操作时间',
  `change_type` tinyint NOT NULL DEFAULT '0' COMMENT '更改操作类型 （默认）0订单出库 1商品录入 2退货入库 3盘点更改',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1070 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_stock_log`
--

LOCK TABLES `tp_stock_log` WRITE;
/*!40000 ALTER TABLE `tp_stock_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_stock_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_storage`
--

DROP TABLE IF EXISTS `tp_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_storage` (
  `storage_id` int unsigned NOT NULL AUTO_INCREMENT,
  `storage_name` varchar(128) NOT NULL COMMENT '仓储名称',
  `is_open` tinyint unsigned DEFAULT '1' COMMENT '仓储是否启用  0不启用  1启用',
  `province_id` int unsigned NOT NULL COMMENT '省id',
  `city_id` int unsigned NOT NULL COMMENT '市id',
  `district_id` int unsigned NOT NULL COMMENT '区id',
  `address` varchar(255) NOT NULL COMMENT '仓储详细地址',
  `name` varchar(120) NOT NULL COMMENT '仓储负责人姓名',
  `mobile` char(15) NOT NULL COMMENT '仓储负责人联系电话',
  `capacity` int unsigned NOT NULL COMMENT '仓储容量(前台取用单位立方米)',
  PRIMARY KEY (`storage_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_storage`
--

LOCK TABLES `tp_storage` WRITE;
/*!40000 ALTER TABLE `tp_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_suppliers`
--

DROP TABLE IF EXISTS `tp_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_suppliers` (
  `suppliers_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `suppliers_name` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `suppliers_desc` mediumtext NOT NULL COMMENT '供应商描述',
  `is_check` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '供应商状态',
  `suppliers_contacts` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商联系人',
  `suppliers_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '供应商电话',
  `province_id` int unsigned DEFAULT NULL COMMENT '所在省份id',
  `city_id` int unsigned DEFAULT NULL COMMENT '所在城市id',
  PRIMARY KEY (`suppliers_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_suppliers`
--

LOCK TABLES `tp_suppliers` WRITE;
/*!40000 ALTER TABLE `tp_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_system_article`
--

DROP TABLE IF EXISTS `tp_system_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_system_article` (
  `doc_id` mediumint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `doc_code` varchar(255) NOT NULL COMMENT '调用标识码',
  `doc_title` varchar(255) NOT NULL COMMENT '标题',
  `doc_content` text NOT NULL COMMENT '内容',
  `doc_time` int unsigned NOT NULL COMMENT '添加时间/修改时间',
  PRIMARY KEY (`doc_id`) USING BTREE,
  UNIQUE KEY `doc_code` (`doc_code`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='系统文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_system_article`
--

LOCK TABLES `tp_system_article` WRITE;
/*!40000 ALTER TABLE `tp_system_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_system_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_system_menu`
--

DROP TABLE IF EXISTS `tp_system_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_system_menu` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '权限名字',
  `group` varchar(20) DEFAULT NULL COMMENT '所属分组',
  `right` text COMMENT '权限码(控制器+动作)',
  `type` tinyint DEFAULT '0' COMMENT '所属模块类型 0admin 1home 2mobile 3api',
  `delete_time` int NOT NULL DEFAULT '0' COMMENT '软删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_system_menu`
--

LOCK TABLES `tp_system_menu` WRITE;
/*!40000 ALTER TABLE `tp_system_menu` DISABLE KEYS */;
INSERT INTO `tp_system_menu` VALUES (1,'基础权限','system','Admin@login,Admin@logout,Base@_empty,Base@initialize,Base@publicAssign,Base@checkPriv,Error@initialize,Index@welcome,Index@index,Upload@uploadOne,Upload@uploadDel',0,0),(2,'文章-查','content','Article@articleList,Article@ajaxArticleList',0,0),(3,'文章-增删改','content','Article@article,Article@articleHandle',0,0),(4,'文章-回收','content','Article@articleRecycle',0,0),(5,'文章分类-查','content','Article@categoryList,Article@ajaxCategoryList',0,0),(6,'文章分类-增删改','content','Article@category,Article@categoryHandle',0,0),(7,'文章分类-回收','content','Article@categoryRecycle',0,0),(8,'超级接口(用于列表页的快速修改)','system','Api@changeTableVal',0,0),(9,'菜单栏-查','system','Menu@menuList,Menu@ajaxMenuList',0,0),(10,'菜单栏-增删改','system','Menu@menuHandle,Menu@menu',0,0),(11,'菜单栏-回收','system','Menu@menuRecycle',0,0);
/*!40000 ALTER TABLE `tp_system_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_system_menu1`
--

DROP TABLE IF EXISTS `tp_system_menu1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_system_menu1` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '权限名字',
  `group` varchar(20) DEFAULT NULL COMMENT '所属分组',
  `right` text COMMENT '权限码(控制器+动作)',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除,0正常',
  `type` tinyint DEFAULT '0' COMMENT '所属模块类型 0admin 1home 2mobile 3api',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_system_menu1`
--

LOCK TABLES `tp_system_menu1` WRITE;
/*!40000 ALTER TABLE `tp_system_menu1` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_system_menu1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_system_module`
--

DROP TABLE IF EXISTS `tp_system_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_system_module` (
  `mod_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `module` enum('top','menu','module') DEFAULT 'module',
  `level` tinyint(1) DEFAULT '3',
  `ctl` varchar(20) DEFAULT '',
  `act` varchar(30) DEFAULT '',
  `title` varchar(20) DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `parent_id` smallint DEFAULT '0',
  `orderby` smallint DEFAULT '50',
  `icon` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`mod_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_system_module`
--

LOCK TABLES `tp_system_module` WRITE;
/*!40000 ALTER TABLE `tp_system_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_system_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_team_activity`
--

DROP TABLE IF EXISTS `tp_team_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_team_activity` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `act_name` varchar(255) NOT NULL DEFAULT '' COMMENT '拼团活动标题',
  `team_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '拼团活动类型,0分享团1佣金团2抽奖团',
  `time_limit` int NOT NULL DEFAULT '0' COMMENT '成团有效期。单位（秒)',
  `needer` int NOT NULL DEFAULT '2' COMMENT '需要成团人数',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_id` int NOT NULL DEFAULT '0' COMMENT '商品id',
  `bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '团长佣金',
  `stock_limit` int NOT NULL DEFAULT '0' COMMENT '抽奖限量',
  `buy_limit` smallint NOT NULL DEFAULT '0' COMMENT '单次团购买限制数0为不限制',
  `sales_sum` int unsigned NOT NULL DEFAULT '0' COMMENT '已拼多少件',
  `virtual_num` int NOT NULL DEFAULT '0' COMMENT '虚拟销售基数',
  `share_title` varchar(100) NOT NULL COMMENT '分享标题',
  `share_desc` varchar(255) NOT NULL COMMENT '分享描述',
  `share_img` varchar(150) DEFAULT NULL COMMENT '分享图片',
  `sort` smallint unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_recommend` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0关闭1正常',
  `is_lottery` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已经抽奖.1是，0否',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否已删除0否，1删除',
  PRIMARY KEY (`team_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='拼团活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_team_activity`
--

LOCK TABLES `tp_team_activity` WRITE;
/*!40000 ALTER TABLE `tp_team_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_team_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_team_follow`
--

DROP TABLE IF EXISTS `tp_team_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_team_follow` (
  `follow_id` int unsigned NOT NULL AUTO_INCREMENT,
  `follow_user_id` int DEFAULT '0' COMMENT '参团会员id',
  `follow_user_nickname` varchar(100) DEFAULT NULL COMMENT '参团会员昵称',
  `follow_user_head_pic` varchar(255) DEFAULT NULL COMMENT '会员头像',
  `follow_time` int DEFAULT '0' COMMENT '参团时间',
  `order_id` int DEFAULT '0' COMMENT '订单id',
  `found_id` int DEFAULT '0' COMMENT '开团ID',
  `found_user_id` int DEFAULT '0' COMMENT '开团人user_id',
  `team_id` int DEFAULT '0' COMMENT '拼团活动id',
  `status` tinyint(1) DEFAULT '0' COMMENT '参团状态0:待拼单(表示已下单但是未支付)1拼单成功(已支付)2成团成功3成团失败',
  `is_win` tinyint(1) DEFAULT '0' COMMENT '抽奖团是否中奖',
  PRIMARY KEY (`follow_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='参团表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_team_follow`
--

LOCK TABLES `tp_team_follow` WRITE;
/*!40000 ALTER TABLE `tp_team_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_team_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_team_found`
--

DROP TABLE IF EXISTS `tp_team_found`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_team_found` (
  `found_id` int unsigned NOT NULL AUTO_INCREMENT,
  `found_time` int DEFAULT '0' COMMENT '开团时间',
  `found_end_time` int DEFAULT '0' COMMENT '成团截止时间',
  `user_id` int DEFAULT '0' COMMENT '团长id',
  `team_id` int DEFAULT '0' COMMENT '拼团活动id',
  `nickname` varchar(100) DEFAULT NULL COMMENT '团长用户名昵称',
  `head_pic` varchar(255) DEFAULT '' COMMENT '团长头像',
  `order_id` int DEFAULT '0' COMMENT '团长订单id',
  `join` int DEFAULT '1' COMMENT '已参团人数',
  `need` int DEFAULT '1' COMMENT '需多少人成团',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '拼团价格',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品原价',
  `status` tinyint(1) DEFAULT '0' COMMENT '拼团状态0:待开团(表示已下单但是未支付)1:已经开团(团长已支付)2:拼团成功,3拼团失败',
  `bonus_status` tinyint(1) DEFAULT '0' COMMENT '团长佣金领取状态：0无1领取',
  PRIMARY KEY (`found_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='开团表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_team_found`
--

LOCK TABLES `tp_team_found` WRITE;
/*!40000 ALTER TABLE `tp_team_found` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_team_found` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_team_goods_item`
--

DROP TABLE IF EXISTS `tp_team_goods_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_team_goods_item` (
  `team_id` int unsigned NOT NULL,
  `goods_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `item_id` int unsigned NOT NULL DEFAULT '0' COMMENT '商品规格ID',
  `team_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '拼团价',
  `sales_sum` int unsigned NOT NULL DEFAULT '0' COMMENT '已拼多少件',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否已删除0否，1删除'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_team_goods_item`
--

LOCK TABLES `tp_team_goods_item` WRITE;
/*!40000 ALTER TABLE `tp_team_goods_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_team_goods_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_team_lottery`
--

DROP TABLE IF EXISTS `tp_team_lottery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_team_lottery` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT '0' COMMENT '幸运儿手机',
  `order_id` int DEFAULT '0' COMMENT '订单id',
  `order_sn` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT '' COMMENT '幸运儿手机',
  `team_id` int DEFAULT '0' COMMENT '拼团活动ID',
  `nickname` varchar(100) DEFAULT '' COMMENT '会员昵称',
  `head_pic` varchar(150) DEFAULT '' COMMENT '幸运儿头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_team_lottery`
--

LOCK TABLES `tp_team_lottery` WRITE;
/*!40000 ALTER TABLE `tp_team_lottery` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_team_lottery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_template_class`
--

DROP TABLE IF EXISTS `tp_template_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_template_class` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `type` tinyint unsigned DEFAULT NULL COMMENT '类型  1行业  2风格',
  `name` varchar(64) DEFAULT NULL COMMENT '行业或风格名称',
  `sort_order` int unsigned DEFAULT '0' COMMENT '排序',
  `add_time` int unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_template_class`
--

LOCK TABLES `tp_template_class` WRITE;
/*!40000 ALTER TABLE `tp_template_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_template_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_topic`
--

DROP TABLE IF EXISTS `tp_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_topic` (
  `topic_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `topic_title` varchar(100) DEFAULT NULL COMMENT '专题标题',
  `topic_image` varchar(100) DEFAULT NULL COMMENT '专题封面',
  `topic_background_color` varchar(20) DEFAULT NULL COMMENT '专题背景颜色',
  `topic_background` varchar(100) DEFAULT NULL COMMENT '专题背景图',
  `topic_content` text COMMENT '专题详情',
  `topic_repeat` varchar(20) DEFAULT '' COMMENT '背景重复方式',
  `topic_state` tinyint(1) DEFAULT '1' COMMENT '专题状态1-草稿、2-已发布',
  `topic_margin_top` tinyint DEFAULT '0' COMMENT '正文距顶部距离',
  `ctime` int DEFAULT NULL COMMENT '专题创建时间',
  PRIMARY KEY (`topic_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_topic`
--

LOCK TABLES `tp_topic` WRITE;
/*!40000 ALTER TABLE `tp_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_user_address`
--

DROP TABLE IF EXISTS `tp_user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_user_address` (
  `address_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `consignee` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `country` int NOT NULL DEFAULT '0' COMMENT '国家',
  `province` int NOT NULL DEFAULT '0' COMMENT '省份',
  `city` int NOT NULL DEFAULT '0' COMMENT '城市',
  `district` int NOT NULL DEFAULT '0' COMMENT '地区',
  `twon` int DEFAULT '0' COMMENT '乡镇',
  `address` varchar(120) NOT NULL DEFAULT '' COMMENT '地址',
  `zipcode` varchar(60) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `mobile` varchar(60) NOT NULL DEFAULT '' COMMENT '手机',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '默认收货地址',
  `longitude` decimal(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '地址经度',
  `latitude` decimal(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '地址纬度',
  PRIMARY KEY (`address_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_user_address`
--

LOCK TABLES `tp_user_address` WRITE;
/*!40000 ALTER TABLE `tp_user_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_user_collection`
--

DROP TABLE IF EXISTS `tp_user_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_user_collection` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户下载收集表',
  `mobile` varchar(11) DEFAULT '' COMMENT '用户手机号',
  `contact` varchar(32) DEFAULT '' COMMENT '联系人',
  `why_down` varchar(32) DEFAULT '' COMMENT '下载原因',
  `add_time` int DEFAULT '0' COMMENT '申请时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_user_collection`
--

LOCK TABLES `tp_user_collection` WRITE;
/*!40000 ALTER TABLE `tp_user_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_user_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_user_distribution`
--

DROP TABLE IF EXISTS `tp_user_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_user_distribution` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT '分销会员id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '会员昵称',
  `goods_id` int DEFAULT NULL COMMENT '商品id',
  `goods_name` varchar(150) DEFAULT NULL COMMENT '商品名称',
  `cat_id` smallint DEFAULT '0' COMMENT '商品分类ID',
  `brand_id` mediumint DEFAULT '0' COMMENT '商品品牌',
  `share_num` int DEFAULT '0' COMMENT '分享次数',
  `sales_num` int DEFAULT '0' COMMENT '分销销量',
  `addtime` int DEFAULT NULL COMMENT '加入个人分销库时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户选择分销商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_user_distribution`
--

LOCK TABLES `tp_user_distribution` WRITE;
/*!40000 ALTER TABLE `tp_user_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_user_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_user_extend`
--

DROP TABLE IF EXISTS `tp_user_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_user_extend` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT '0',
  `invoice_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发票抬头',
  `taxpayer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '纳税人识别号',
  `invoice_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '不开发票/明细',
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '真实姓名',
  `idcard` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证号',
  `cash_alipay` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '提现支付宝号',
  `cash_unionpay` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '提现银行卡号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_user_extend`
--

LOCK TABLES `tp_user_extend` WRITE;
/*!40000 ALTER TABLE `tp_user_extend` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_user_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_user_label`
--

DROP TABLE IF EXISTS `tp_user_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_user_label` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '标签名称',
  `label_name` char(30) NOT NULL COMMENT '标签名称',
  `label_order` tinyint NOT NULL COMMENT '标签排序',
  `label_code` varchar(80) NOT NULL COMMENT '标签图片',
  `label_describe` varchar(255) DEFAULT NULL COMMENT '标签描述',
  `is_recommend` enum('1','0') NOT NULL DEFAULT '0' COMMENT '是否推荐:0=否,1=是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_user_label`
--

LOCK TABLES `tp_user_label` WRITE;
/*!40000 ALTER TABLE `tp_user_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_user_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_user_level`
--

DROP TABLE IF EXISTS `tp_user_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_user_level` (
  `level_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `level_name` varchar(30) DEFAULT NULL COMMENT '头衔名称',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '等级必要金额',
  `discount` smallint DEFAULT '0' COMMENT '折扣',
  `describe` varchar(200) DEFAULT NULL COMMENT '头街 描述',
  PRIMARY KEY (`level_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_user_level`
--

LOCK TABLES `tp_user_level` WRITE;
/*!40000 ALTER TABLE `tp_user_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_user_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_user_message`
--

DROP TABLE IF EXISTS `tp_user_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_user_message` (
  `rec_id` int NOT NULL AUTO_INCREMENT,
  `user_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `message_id` int unsigned NOT NULL DEFAULT '0' COMMENT '消息id',
  `category` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '通知消息：0, 活动消息：1, 物流:2, 私信:3',
  `is_see` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否查看：0未查看, 1已查看',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户假删除标识,1:删除,0未删除',
  PRIMARY KEY (`rec_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `message_id` (`message_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='用户的消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_user_message`
--

LOCK TABLES `tp_user_message` WRITE;
/*!40000 ALTER TABLE `tp_user_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_user_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_user_msg_tpl`
--

DROP TABLE IF EXISTS `tp_user_msg_tpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_user_msg_tpl` (
  `mmt_code` varchar(50) NOT NULL COMMENT '用户消息模板编号',
  `mmt_name` varchar(50) NOT NULL COMMENT '模板名称',
  `mmt_message_switch` tinyint unsigned NOT NULL COMMENT '站内信接收开关',
  `mmt_message_content` varchar(255) NOT NULL COMMENT '站内信消息内容',
  `mmt_short_switch` tinyint unsigned NOT NULL COMMENT '短信接收开关',
  `mmt_short_content` varchar(255) DEFAULT NULL COMMENT '短信接收内容',
  `mmt_short_sign` varchar(50) DEFAULT NULL COMMENT '短信签名',
  `mmt_short_code` varchar(50) DEFAULT NULL COMMENT '短信模板ID',
  `mmt_mail_switch` tinyint unsigned NOT NULL COMMENT '邮件接收开关',
  `mmt_mail_subject` varchar(255) DEFAULT NULL COMMENT '邮件标题',
  `mmt_mail_content` text COMMENT '邮件内容',
  PRIMARY KEY (`mmt_code`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户消息模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_user_msg_tpl`
--

LOCK TABLES `tp_user_msg_tpl` WRITE;
/*!40000 ALTER TABLE `tp_user_msg_tpl` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_user_msg_tpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_user_sign`
--

DROP TABLE IF EXISTS `tp_user_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_user_sign` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT '0' COMMENT '用户id',
  `sign_total` int DEFAULT '0' COMMENT '累计签到天数',
  `sign_count` int DEFAULT '0' COMMENT '连续签到天数',
  `sign_last` char(11) DEFAULT '0' COMMENT '最后签到时间，时间格式20170907',
  `sign_time` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '历史签到时间，以逗号隔开',
  `cumtrapz` int DEFAULT '0' COMMENT '用户累计签到总积分',
  `this_month` int DEFAULT NULL COMMENT '本月累计积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_user_sign`
--

LOCK TABLES `tp_user_sign` WRITE;
/*!40000 ALTER TABLE `tp_user_sign` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_user_sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_user_store`
--

DROP TABLE IF EXISTS `tp_user_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_user_store` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `store_name` varchar(50) DEFAULT NULL COMMENT '店铺名',
  `true_name` varchar(50) DEFAULT NULL COMMENT '真名',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `store_img` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺图片',
  `store_time` int unsigned NOT NULL COMMENT '开店时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户店铺信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_user_store`
--

LOCK TABLES `tp_user_store` WRITE;
/*!40000 ALTER TABLE `tp_user_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_user_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_users`
--

DROP TABLE IF EXISTS `tp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_users` (
  `user_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮件',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `paypwd` varchar(32) DEFAULT NULL COMMENT '支付密码',
  `sex` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0 保密 1 男 2 女',
  `birthday` int NOT NULL DEFAULT '0' COMMENT '生日',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用户金额',
  `frozen_money` decimal(10,2) DEFAULT '0.00' COMMENT '冻结金额',
  `distribut_money` decimal(10,2) DEFAULT '0.00' COMMENT '累积分佣金额',
  `underling_number` int DEFAULT '0' COMMENT '用户下线总数',
  `pay_points` int unsigned NOT NULL DEFAULT '0' COMMENT '消费积分',
  `address_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '默认收货地址',
  `reg_time` int unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login` int unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_validated` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否验证手机',
  `oauth` varchar(10) DEFAULT '' COMMENT '第三方来源 wx weibo alipay',
  `openid` varchar(100) DEFAULT NULL COMMENT '第三方唯一标示',
  `unionid` varchar(100) DEFAULT NULL,
  `head_pic` varchar(255) DEFAULT NULL COMMENT '头像',
  `province` int DEFAULT '0' COMMENT '省份',
  `city` int DEFAULT '0' COMMENT '市区',
  `district` int DEFAULT '0' COMMENT '县',
  `email_validated` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否验证电子邮箱',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '第三方返回昵称',
  `level` tinyint(1) DEFAULT '1' COMMENT '会员等级',
  `discount` decimal(10,2) DEFAULT '1.00' COMMENT '会员折扣，默认1不享受',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '消费累计额度',
  `is_lock` tinyint(1) DEFAULT '0' COMMENT '是否被锁定冻结',
  `is_distribut` tinyint(1) DEFAULT '0' COMMENT '是否为分销商 0 否 1 是',
  `first_leader` int DEFAULT '0' COMMENT '第一个上级',
  `second_leader` int DEFAULT '0' COMMENT '第二个上级',
  `third_leader` int DEFAULT '0' COMMENT '第三个上级',
  `token` varchar(64) DEFAULT '' COMMENT '用于app 授权类似于session_id',
  `message_mask` tinyint(1) NOT NULL DEFAULT '63' COMMENT '消息掩码',
  `push_id` varchar(30) NOT NULL DEFAULT '' COMMENT '推送id',
  `distribut_level` tinyint DEFAULT '0' COMMENT '分销商等级',
  `is_vip` tinyint(1) DEFAULT '0' COMMENT '是否为VIP ：0不是，1是',
  `xcx_qrcode` varchar(255) DEFAULT NULL COMMENT '小程序专属二维码',
  `poster` varchar(255) DEFAULT NULL COMMENT '专属推广海报',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `email` (`email`) USING BTREE,
  KEY `underling_number` (`underling_number`) USING BTREE,
  KEY `mobile` (`mobile_validated`) USING BTREE,
  KEY `openid` (`openid`) USING BTREE,
  KEY `unionid` (`unionid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_users`
--

LOCK TABLES `tp_users` WRITE;
/*!40000 ALTER TABLE `tp_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_virtual_shop`
--

DROP TABLE IF EXISTS `tp_virtual_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_virtual_shop` (
  `user_id` int DEFAULT NULL,
  `shop_name` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `shop_level` tinyint(1) DEFAULT '0' COMMENT '店铺等级',
  `shop_intro` text COMMENT '店铺介绍',
  `shop_logo` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `shop_phone` varchar(20) DEFAULT NULL,
  `shop_qq` varchar(20) DEFAULT NULL,
  `shop_theme` tinyint(1) DEFAULT '0' COMMENT '店铺模板风格'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='分销商虚拟店铺表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_virtual_shop`
--

LOCK TABLES `tp_virtual_shop` WRITE;
/*!40000 ALTER TABLE `tp_virtual_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_virtual_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_vr_order_code`
--

DROP TABLE IF EXISTS `tp_vr_order_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_vr_order_code` (
  `rec_id` int NOT NULL AUTO_INCREMENT COMMENT '兑换码表索引id',
  `order_id` int NOT NULL COMMENT '虚拟订单id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `vr_code` varchar(18) NOT NULL DEFAULT '' COMMENT '兑换码',
  `vr_state` tinyint NOT NULL DEFAULT '0' COMMENT '使用状态 0:(默认)未使用1:已使用2:已过期',
  `vr_usetime` int NOT NULL DEFAULT '0' COMMENT '使用时间',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付金额(结算)',
  `vr_indate` int NOT NULL DEFAULT '0' COMMENT '过期时间',
  `refund_lock` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '退款锁定状态:0为正常,1为锁定,2为同意,默认为0',
  `vr_invalid_refund` tinyint NOT NULL DEFAULT '1' COMMENT '允许过期退款1是0否',
  PRIMARY KEY (`rec_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='兑换码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_vr_order_code`
--

LOCK TABLES `tp_vr_order_code` WRITE;
/*!40000 ALTER TABLE `tp_vr_order_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_vr_order_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_withdrawals`
--

DROP TABLE IF EXISTS `tp_withdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_withdrawals` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '提现申请表',
  `user_id` int DEFAULT '0' COMMENT '用户id',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '提现金额',
  `create_time` int DEFAULT '0' COMMENT '申请时间',
  `check_time` int DEFAULT '0' COMMENT '审核时间',
  `pay_time` int DEFAULT '0' COMMENT '支付时间',
  `refuse_time` int DEFAULT '0' COMMENT '拒绝时间',
  `bank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行名称 如支付宝 微信 中国银行 农业银行等',
  `bank_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行账号或支付宝账号',
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '提款账号真实姓名',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '提现备注',
  `taxfee` decimal(10,2) DEFAULT '0.00' COMMENT '税收手续费',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态：-2删除作废-1审核失败0申请中1审核通过2付款成功3付款失败',
  `pay_code` varchar(100) DEFAULT NULL COMMENT '付款对账流水号',
  `error_code` varchar(255) DEFAULT NULL COMMENT '付款失败错误代码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_withdrawals`
--

LOCK TABLES `tp_withdrawals` WRITE;
/*!40000 ALTER TABLE `tp_withdrawals` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_withdrawals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_wx_img`
--

DROP TABLE IF EXISTS `tp_wx_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_wx_img` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `desc` text NOT NULL COMMENT '简介',
  `pic` char(255) NOT NULL COMMENT '封面图片',
  `url` char(255) NOT NULL COMMENT '图文外链地址',
  `createtime` varchar(13) NOT NULL COMMENT '创建时间',
  `uptatetime` varchar(13) NOT NULL COMMENT '更新时间',
  `token` char(30) NOT NULL COMMENT 'token',
  `title` varchar(60) NOT NULL COMMENT '标题',
  `goods_id` int NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='微信图文';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_wx_img`
--

LOCK TABLES `tp_wx_img` WRITE;
/*!40000 ALTER TABLE `tp_wx_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_wx_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_wx_keyword`
--

DROP TABLE IF EXISTS `tp_wx_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_wx_keyword` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '微信关键词表',
  `keyword` char(255) NOT NULL,
  `pid` int NOT NULL COMMENT '对应表ID，如wx_reply的id',
  `type` varchar(30) NOT NULL COMMENT '关键词操作类型 auto_reply',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_wx_keyword`
--

LOCK TABLES `tp_wx_keyword` WRITE;
/*!40000 ALTER TABLE `tp_wx_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_wx_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_wx_material`
--

DROP TABLE IF EXISTS `tp_wx_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_wx_material` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '微信公众号素材',
  `media_id` varchar(64) DEFAULT '' COMMENT '微信媒体id',
  `type` varchar(10) NOT NULL COMMENT '素材类型：text、image、news、video',
  `data` text COMMENT 'json数据',
  `update_time` int unsigned DEFAULT NULL COMMENT '更新时间',
  `key` char(32) DEFAULT NULL COMMENT '便于查询的key，现用于image',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `media_id` (`media_id`) USING BTREE,
  KEY `key` (`key`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_wx_material`
--

LOCK TABLES `tp_wx_material` WRITE;
/*!40000 ALTER TABLE `tp_wx_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_wx_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_wx_menu`
--

DROP TABLE IF EXISTS `tp_wx_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_wx_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` tinyint(1) DEFAULT '1' COMMENT '菜单级别',
  `name` varchar(50) NOT NULL DEFAULT '',
  `sort` int DEFAULT '0' COMMENT '排序',
  `type` varchar(20) DEFAULT '' COMMENT '0 view 1 click',
  `value` varchar(255) DEFAULT NULL,
  `token` varchar(50) NOT NULL DEFAULT '',
  `pid` int DEFAULT '0' COMMENT '上级菜单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_wx_menu`
--

LOCK TABLES `tp_wx_menu` WRITE;
/*!40000 ALTER TABLE `tp_wx_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_wx_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_wx_msg`
--

DROP TABLE IF EXISTS `tp_wx_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_wx_msg` (
  `msgid` int NOT NULL AUTO_INCREMENT,
  `admin_id` int NOT NULL COMMENT '系统用户ID',
  `titile` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `createtime` int NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sendtime` int NOT NULL DEFAULT '0' COMMENT '发送时间',
  `issend` tinyint(1) DEFAULT '0' COMMENT '0未发送1成功2失败',
  `sendtype` tinyint(1) DEFAULT '1' COMMENT '0单人1所有',
  PRIMARY KEY (`msgid`) USING BTREE,
  KEY `uid` (`admin_id`) USING BTREE,
  KEY `createymd` (`sendtime`) USING BTREE,
  KEY `fake_id` (`titile`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_wx_msg`
--

LOCK TABLES `tp_wx_msg` WRITE;
/*!40000 ALTER TABLE `tp_wx_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_wx_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_wx_news`
--

DROP TABLE IF EXISTS `tp_wx_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_wx_news` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '图文子素材id',
  `update_time` int unsigned DEFAULT NULL COMMENT '更新时间',
  `title` varchar(64) DEFAULT '' COMMENT '标题',
  `material_id` int unsigned DEFAULT NULL COMMENT '图片素材id，一个图片为素材可包括几个子图文',
  `author` varchar(8) DEFAULT '' COMMENT '作者',
  `content` text COMMENT 'html内容',
  `digest` varchar(120) DEFAULT '' COMMENT '摘要',
  `thumb_url` text COMMENT '封面链接',
  `thumb_media_id` varchar(64) DEFAULT '' COMMENT '封面媒体id',
  `content_source_url` text COMMENT '原文链接',
  `show_cover_pic` int DEFAULT '0' COMMENT '是否显示封面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='微信图文';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_wx_news`
--

LOCK TABLES `tp_wx_news` WRITE;
/*!40000 ALTER TABLE `tp_wx_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_wx_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_wx_reply`
--

DROP TABLE IF EXISTS `tp_wx_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_wx_reply` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '微信关键词回复表',
  `rule` varchar(32) DEFAULT NULL COMMENT '规则名',
  `update_time` int unsigned DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL COMMENT '回复类型keyword,default,follow',
  `msg_type` varchar(10) DEFAULT NULL COMMENT '回复消息类型text,news',
  `data` text COMMENT 'text使用该自动存储文本',
  `material_id` int unsigned DEFAULT NULL COMMENT 'news、image的素材id等',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_wx_reply`
--

LOCK TABLES `tp_wx_reply` WRITE;
/*!40000 ALTER TABLE `tp_wx_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_wx_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_wx_text`
--

DROP TABLE IF EXISTS `tp_wx_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_wx_text` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '表id',
  `uid` int NOT NULL COMMENT '用户id',
  `uname` varchar(90) NOT NULL COMMENT '用户名',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `precisions` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'precisions',
  `text` text NOT NULL COMMENT 'text',
  `createtime` varchar(13) NOT NULL COMMENT '创建时间',
  `updatetime` varchar(13) NOT NULL COMMENT '更新时间',
  `click` int NOT NULL COMMENT '点击',
  `token` char(30) NOT NULL COMMENT 'token',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='文本回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_wx_text`
--

LOCK TABLES `tp_wx_text` WRITE;
/*!40000 ALTER TABLE `tp_wx_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_wx_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_wx_tpl_msg`
--

DROP TABLE IF EXISTS `tp_wx_tpl_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_wx_tpl_msg` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '微信模板消息',
  `title` varchar(32) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT '' COMMENT '模板标题',
  `template_sn` varchar(64) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT '' COMMENT '模板编号',
  `template_id` varchar(64) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT '' COMMENT '模板id',
  `remark` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT '' COMMENT '留言',
  `is_use` tinyint(1) DEFAULT '0' COMMENT '该模板是否启用',
  `add_time` int unsigned DEFAULT NULL COMMENT '添加模板的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_wx_tpl_msg`
--

LOCK TABLES `tp_wx_tpl_msg` WRITE;
/*!40000 ALTER TABLE `tp_wx_tpl_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_wx_tpl_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_wx_user`
--

DROP TABLE IF EXISTS `tp_wx_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tp_wx_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '表id',
  `uid` int NOT NULL COMMENT 'uid',
  `wxname` varchar(60) NOT NULL DEFAULT '' COMMENT '公众号名称',
  `aeskey` varchar(256) NOT NULL DEFAULT '' COMMENT 'aeskey',
  `encode` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'encode',
  `appid` varchar(50) NOT NULL DEFAULT '' COMMENT 'appid',
  `appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT 'appsecret',
  `wxid` varchar(64) NOT NULL DEFAULT '' COMMENT '公众号原始ID',
  `weixin` char(64) NOT NULL COMMENT '微信号',
  `headerpic` char(255) NOT NULL COMMENT '头像地址',
  `token` char(255) NOT NULL COMMENT 'token',
  `w_token` varchar(150) NOT NULL DEFAULT '' COMMENT '微信对接token',
  `create_time` int NOT NULL COMMENT 'create_time',
  `updatetime` int NOT NULL COMMENT 'updatetime',
  `tplcontentid` varchar(2) NOT NULL DEFAULT '' COMMENT '内容模版ID',
  `share_ticket` varchar(150) NOT NULL DEFAULT '' COMMENT '分享ticket',
  `share_dated` char(15) NOT NULL COMMENT 'share_dated',
  `authorizer_access_token` varchar(200) NOT NULL DEFAULT '' COMMENT 'authorizer_access_token',
  `authorizer_refresh_token` varchar(200) NOT NULL DEFAULT '' COMMENT 'authorizer_refresh_token',
  `authorizer_expires` char(10) NOT NULL COMMENT 'authorizer_expires',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `web_access_token` varchar(200) DEFAULT '' COMMENT ' 网页授权token',
  `web_refresh_token` varchar(200) DEFAULT '' COMMENT 'web_refresh_token',
  `web_expires` int NOT NULL COMMENT '过期时间',
  `qr` varchar(200) NOT NULL DEFAULT '' COMMENT 'qr',
  `menu_config` text COMMENT '菜单',
  `wait_access` tinyint(1) DEFAULT '0' COMMENT '微信接入状态,0待接入1已接入',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `uid_2` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='微信公共帐号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_wx_user`
--

LOCK TABLES `tp_wx_user` WRITE;
/*!40000 ALTER TABLE `tp_wx_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_wx_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-29 14:44:53
