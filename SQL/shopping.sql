# MySQL-Front 5.1  (Build 4.13)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: shopping
# ------------------------------------------------------
# Server version 5.0.22-community-nt

#
# Source for table category
#

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL auto_increment,
  `pid` int(11) default NULL,
  `name` varchar(255) default NULL,
  `descr` varchar(255) default NULL,
  `cno` int(11) default NULL,
  `grade` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Dumping data for table category
#

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,0,'进口水果','来自美洲非洲欧洲等国家',10000,1);
INSERT INTO `category` VALUES (2,0,'国产水果','来自中国海南，云南，江南等地区',20000,1);
INSERT INTO `category` VALUES (3,0,'水果礼盒','搭配各种水果，均衡营养',30000,1);
INSERT INTO `category` VALUES (4,0,'特惠水果','价格便宜，味道好',40000,1);
INSERT INTO `category` VALUES (5,1,'美国','来自美国',10100,2);
INSERT INTO `category` VALUES (6,2,'海南','海南特种水果',20100,2);
INSERT INTO `category` VALUES (7,1,'德国','产自德国',10200,2);
INSERT INTO `category` VALUES (8,1,'英国','产自英国',10300,2);
INSERT INTO `category` VALUES (9,2,'苏州','产自苏州',20200,2);
INSERT INTO `category` VALUES (10,3,'送长辈','适合40-50岁',30100,2);
INSERT INTO `category` VALUES (11,3,'送小孩','适合5-20岁',30200,2);
INSERT INTO `category` VALUES (12,4,'苹果','海南苹果',40100,2);
INSERT INTO `category` VALUES (13,0,'11','111',50000,1);
INSERT INTO `category` VALUES (14,0,'11','11',60000,1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table collect
#

DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `pid` int(11) default NULL,
  `cdate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Dumping data for table collect
#

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table comment
#

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `pid` int(11) default NULL,
  `cdate` datetime default NULL,
  `comment` varchar(255) default NULL,
  `itemid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Dumping data for table comment
#

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (16,1,7,'2014-03-04 00:14:25','香蕉保存的很好，味道很甜，五分好评，下次再来',1);
INSERT INTO `comment` VALUES (18,2,4,'2014-03-27 23:23:30','果子味道很不错哈！',31);
INSERT INTO `comment` VALUES (20,1,4,'2014-05-09 16:56:02','果子很新鲜',66);
INSERT INTO `comment` VALUES (21,1,6,'2014-04-28 21:59:07','好吃！下次再来',60);
INSERT INTO `comment` VALUES (22,1,7,'2014-03-28 23:28:29','111',38);
INSERT INTO `comment` VALUES (23,1,5,'2014-05-12 21:32:05','111',84);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table product
#

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `descr` varchar(255) default NULL,
  `normalprice` double default NULL,
  `memberprice` double default NULL,
  `pdate` datetime default NULL,
  `categoryid` int(11) default NULL,
  `recommend` int(11) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Dumping data for table product
#

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'海南苹果','来自中国海南岛，价格便宜，营养丰富，老少皆宜',10,9,'2014-03-03 22:54:23',6,1);
INSERT INTO `product` VALUES (2,'苏州梨子','产自苏州，水分充足，味道甘甜！',8,7,'2014-03-03 22:55:06',9,0);
INSERT INTO `product` VALUES (3,'美国火龙果','来自美国，品质优良，新鲜，味道极好',30,28,'2014-03-03 22:56:13',5,1);
INSERT INTO `product` VALUES (4,'德国蛇果','来自德国，营养丰富',15,14,'2014-03-03 22:57:08',7,1);
INSERT INTO `product` VALUES (5,'英国葡萄','产自英国，适合葡萄酒酿造',20,19,'2014-03-03 22:58:19',8,1);
INSERT INTO `product` VALUES (6,'桃子','小孩子的最爱，味道好，水分足',14,13,'2014-03-03 22:59:00',11,0);
INSERT INTO `product` VALUES (7,'香蕉','消化好，味道棒',16,15,'2014-03-03 22:59:47',10,1);
INSERT INTO `product` VALUES (8,'香瓜','营养丰富',9,8,'2014-05-12 00:33:20',6,0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table salesitem
#

DROP TABLE IF EXISTS `salesitem`;
CREATE TABLE `salesitem` (
  `id` int(11) NOT NULL auto_increment,
  `productid` int(11) default NULL,
  `unitprice` double default NULL,
  `pcount` int(11) default NULL,
  `orderid` int(11) default NULL,
  `judgec` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Dumping data for table salesitem
#

LOCK TABLES `salesitem` WRITE;
/*!40000 ALTER TABLE `salesitem` DISABLE KEYS */;
INSERT INTO `salesitem` VALUES (1,7,15,2,1,0);
INSERT INTO `salesitem` VALUES (2,6,13,1,1,0);
INSERT INTO `salesitem` VALUES (3,5,19,1,1,0);
INSERT INTO `salesitem` VALUES (4,7,15,1,2,0);
INSERT INTO `salesitem` VALUES (5,6,13,1,2,0);
INSERT INTO `salesitem` VALUES (6,4,14,1,2,0);
INSERT INTO `salesitem` VALUES (7,4,14,1,3,0);
INSERT INTO `salesitem` VALUES (8,3,28,1,3,0);
INSERT INTO `salesitem` VALUES (9,7,15,1,4,0);
INSERT INTO `salesitem` VALUES (10,5,19,1,4,0);
INSERT INTO `salesitem` VALUES (11,6,13,2,5,0);
INSERT INTO `salesitem` VALUES (12,4,14,1,5,0);
INSERT INTO `salesitem` VALUES (13,1,9,1,6,0);
INSERT INTO `salesitem` VALUES (14,2,7,1,6,0);
INSERT INTO `salesitem` VALUES (15,4,14,1,6,0);
INSERT INTO `salesitem` VALUES (16,5,19,2,7,0);
INSERT INTO `salesitem` VALUES (17,7,15,1,7,0);
INSERT INTO `salesitem` VALUES (18,7,15,1,9,0);
INSERT INTO `salesitem` VALUES (19,4,14,1,9,0);
INSERT INTO `salesitem` VALUES (20,6,13,1,10,0);
INSERT INTO `salesitem` VALUES (21,7,15,1,11,0);
INSERT INTO `salesitem` VALUES (22,6,13,1,11,0);
INSERT INTO `salesitem` VALUES (23,7,15,1,12,0);
INSERT INTO `salesitem` VALUES (24,7,15,1,13,0);
INSERT INTO `salesitem` VALUES (25,5,19,1,13,0);
INSERT INTO `salesitem` VALUES (26,4,14,1,14,0);
INSERT INTO `salesitem` VALUES (27,7,15,1,15,0);
INSERT INTO `salesitem` VALUES (28,6,13,1,15,0);
INSERT INTO `salesitem` VALUES (29,7,15,1,16,0);
INSERT INTO `salesitem` VALUES (30,5,19,1,16,0);
INSERT INTO `salesitem` VALUES (31,4,14,1,22,1);
INSERT INTO `salesitem` VALUES (32,7,15,1,23,0);
INSERT INTO `salesitem` VALUES (33,5,19,1,24,0);
INSERT INTO `salesitem` VALUES (34,7,15,1,25,0);
INSERT INTO `salesitem` VALUES (35,6,13,1,26,0);
INSERT INTO `salesitem` VALUES (36,5,19,2,26,0);
INSERT INTO `salesitem` VALUES (37,4,14,2,26,0);
INSERT INTO `salesitem` VALUES (38,7,15,5,27,1);
INSERT INTO `salesitem` VALUES (39,6,13,2,27,0);
INSERT INTO `salesitem` VALUES (40,7,15,2,28,0);
INSERT INTO `salesitem` VALUES (41,3,28,2,29,0);
INSERT INTO `salesitem` VALUES (42,5,19,4,29,0);
INSERT INTO `salesitem` VALUES (43,4,14,2,29,0);
INSERT INTO `salesitem` VALUES (44,7,15,2,29,0);
INSERT INTO `salesitem` VALUES (45,7,15,2,30,0);
INSERT INTO `salesitem` VALUES (46,4,14,2,30,0);
INSERT INTO `salesitem` VALUES (47,3,28,2,30,0);
INSERT INTO `salesitem` VALUES (48,5,19,2,30,0);
INSERT INTO `salesitem` VALUES (49,4,14,2,31,0);
INSERT INTO `salesitem` VALUES (50,5,19,2,31,0);
INSERT INTO `salesitem` VALUES (51,4,14,2,32,0);
INSERT INTO `salesitem` VALUES (52,5,19,2,33,0);
INSERT INTO `salesitem` VALUES (53,7,15,1,34,0);
INSERT INTO `salesitem` VALUES (54,7,15,1,35,0);
INSERT INTO `salesitem` VALUES (55,4,14,2,35,0);
INSERT INTO `salesitem` VALUES (56,7,15,1,36,0);
INSERT INTO `salesitem` VALUES (57,4,14,2,36,0);
INSERT INTO `salesitem` VALUES (58,5,19,2,36,0);
INSERT INTO `salesitem` VALUES (59,5,19,2,37,0);
INSERT INTO `salesitem` VALUES (60,6,13,1,38,1);
INSERT INTO `salesitem` VALUES (61,7,15,1,38,0);
INSERT INTO `salesitem` VALUES (62,5,19,1,8,0);
INSERT INTO `salesitem` VALUES (63,7,15,1,39,0);
INSERT INTO `salesitem` VALUES (64,7,15,2,40,1);
INSERT INTO `salesitem` VALUES (65,7,15,2,41,0);
INSERT INTO `salesitem` VALUES (66,4,14,2,41,1);
INSERT INTO `salesitem` VALUES (67,5,19,1,42,1);
INSERT INTO `salesitem` VALUES (68,7,15,1,43,0);
INSERT INTO `salesitem` VALUES (69,5,19,1,44,0);
INSERT INTO `salesitem` VALUES (70,5,19,1,45,0);
INSERT INTO `salesitem` VALUES (71,5,19,1,46,0);
INSERT INTO `salesitem` VALUES (72,5,19,1,47,0);
INSERT INTO `salesitem` VALUES (73,5,19,1,48,0);
INSERT INTO `salesitem` VALUES (74,7,15,1,49,0);
INSERT INTO `salesitem` VALUES (75,7,15,1,50,0);
INSERT INTO `salesitem` VALUES (76,7,15,1,51,0);
INSERT INTO `salesitem` VALUES (77,6,13,1,51,0);
INSERT INTO `salesitem` VALUES (78,5,19,2,52,0);
INSERT INTO `salesitem` VALUES (79,4,14,2,52,0);
INSERT INTO `salesitem` VALUES (80,3,28,1,53,0);
INSERT INTO `salesitem` VALUES (81,1,9,1,54,0);
INSERT INTO `salesitem` VALUES (82,7,15,1,55,0);
INSERT INTO `salesitem` VALUES (83,7,15,1,56,0);
INSERT INTO `salesitem` VALUES (84,5,19,1,56,1);
INSERT INTO `salesitem` VALUES (85,8,8,1,57,0);
INSERT INTO `salesitem` VALUES (86,4,14,1,58,0);
INSERT INTO `salesitem` VALUES (87,8,8,1,58,0);
INSERT INTO `salesitem` VALUES (88,7,15,1,58,0);
INSERT INTO `salesitem` VALUES (89,6,13,1,58,0);
INSERT INTO `salesitem` VALUES (90,5,19,1,58,0);
/*!40000 ALTER TABLE `salesitem` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table salesorder
#

DROP TABLE IF EXISTS `salesorder`;
CREATE TABLE `salesorder` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) default NULL,
  `addr` varchar(255) default NULL,
  `odate` datetime default NULL,
  `status` int(11) default NULL,
  `phone` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Dumping data for table salesorder
#

LOCK TABLES `salesorder` WRITE;
/*!40000 ALTER TABLE `salesorder` DISABLE KEYS */;
INSERT INTO `salesorder` VALUES (1,1,'中国科学与技术大学苏州研究院','2014-03-04 00:14:25',1,'18036095723');
INSERT INTO `salesorder` VALUES (2,1,'中国科学与技术大学苏州研究院','2014-03-04 22:16:17',0,'18036095723');
INSERT INTO `salesorder` VALUES (3,1,'中国科学与技术大学苏州研究院','2014-03-05 00:59:15',0,'18036095723');
INSERT INTO `salesorder` VALUES (4,1,'中国科学与技术大学苏州研究院','2014-03-05 01:20:20',0,'18036095723');
INSERT INTO `salesorder` VALUES (5,2,'中国科学与技术大学明德楼','2014-03-05 09:14:20',1,'18036095723');
INSERT INTO `salesorder` VALUES (6,1,'中国科学与技术大学苏州研究院','2014-03-05 10:56:22',0,'18036095723');
INSERT INTO `salesorder` VALUES (7,1,'中国科学与技术大学苏州研究院','2014-03-05 14:30:31',0,'18036095723');
INSERT INTO `salesorder` VALUES (8,1,'中国科学与技术大学苏州研究院','2014-03-05 14:31:27',0,'18036095723');
INSERT INTO `salesorder` VALUES (9,1,'中国科学与技术大学苏州研究院','2014-03-05 14:45:59',0,'18036095723');
INSERT INTO `salesorder` VALUES (10,1,'中国科学与技术大学苏州研究院','2014-03-05 14:47:21',0,'18036095723');
INSERT INTO `salesorder` VALUES (11,2,'中国科学与技术大学明德楼','2014-03-05 14:49:03',0,'18036095723');
INSERT INTO `salesorder` VALUES (12,1,'中国科学与技术大学苏州研究院','2014-03-05 18:00:17',0,'18036095723');
INSERT INTO `salesorder` VALUES (13,1,'中国科学与技术大学苏州研究院','2014-03-05 23:05:00',0,'18036095723');
INSERT INTO `salesorder` VALUES (14,1,'中国科学与技术大学苏州研究院','2014-03-06 00:33:52',0,'18036095723');
INSERT INTO `salesorder` VALUES (15,1,'中国科学与技术大学苏州研究院','2014-03-06 14:11:44',0,'18036095723');
INSERT INTO `salesorder` VALUES (16,1,'中国科学与技术大学苏州研究院','2014-03-06 21:33:01',0,'18036095723');
INSERT INTO `salesorder` VALUES (22,2,'中国科学与技术大学明德楼','2014-03-27 23:23:30',0,'18036095723');
INSERT INTO `salesorder` VALUES (23,0,'中国科学与技术大学明德楼','2014-03-27 23:49:25',0,'18036095723');
INSERT INTO `salesorder` VALUES (24,0,'中国科学与技术大学明德楼','2014-03-27 23:52:48',0,'18036095723');
INSERT INTO `salesorder` VALUES (25,0,'中国科学与技术大学明德楼','2014-03-27 23:55:47',0,'18036095723');
INSERT INTO `salesorder` VALUES (26,0,'中国科学与技术大学明德楼','2014-03-28 01:15:00',0,'18036095723');
INSERT INTO `salesorder` VALUES (27,1,'中国科学与技术大学苏州研究院','2014-03-28 23:28:29',0,'18036095723');
INSERT INTO `salesorder` VALUES (28,0,'中科大','2014-03-29 12:43:19',0,'18036095723');
INSERT INTO `salesorder` VALUES (29,0,'中国科学与技术大学明德楼','2014-04-10 17:47:30',0,'18036095723');
INSERT INTO `salesorder` VALUES (30,0,'中国科学与技术大学明德楼','2014-04-18 14:31:13',0,'18036095723');
INSERT INTO `salesorder` VALUES (31,0,'中科大','2014-04-21 00:51:05',0,'18036095723');
INSERT INTO `salesorder` VALUES (32,0,'中国科学与技术大学明德楼','2014-04-21 01:12:45',0,'18036095723');
INSERT INTO `salesorder` VALUES (33,0,'中国科学与技术大学明德楼','2014-04-21 11:38:10',0,'18036095723');
INSERT INTO `salesorder` VALUES (34,0,'中国科学与技术大学明德楼','2014-04-28 21:36:07',0,'18036095723');
INSERT INTO `salesorder` VALUES (35,0,'中国科学与技术大学明德楼','2014-04-28 21:37:55',0,'18036095723');
INSERT INTO `salesorder` VALUES (36,0,'中国科学与技术大学明德楼','2014-04-28 21:42:21',0,'18036095723');
INSERT INTO `salesorder` VALUES (37,0,'中国科学与技术大学明德楼','2014-04-28 21:43:46',0,'18036095723');
INSERT INTO `salesorder` VALUES (38,1,'中国科学与技术大学','2014-04-28 21:59:07',0,'13866031858');
INSERT INTO `salesorder` VALUES (39,0,'111','2014-04-28 22:05:44',0,'111');
INSERT INTO `salesorder` VALUES (40,0,'中科大','2014-05-08 21:41:18',0,'18036095723');
INSERT INTO `salesorder` VALUES (41,1,'中国科学与技术大学','2014-05-09 16:56:02',0,'13866031858');
INSERT INTO `salesorder` VALUES (42,1,'中国科学与技术大学','2014-05-11 09:26:23',0,'13866031858');
INSERT INTO `salesorder` VALUES (43,0,'中科大','2014-05-11 12:57:38',0,'12345678');
INSERT INTO `salesorder` VALUES (44,0,'中科大','2014-05-11 18:23:24',0,'111');
INSERT INTO `salesorder` VALUES (45,0,'中科大','2014-05-11 18:27:57',0,'111');
INSERT INTO `salesorder` VALUES (46,0,'中科大','2014-05-11 18:29:07',0,'111');
INSERT INTO `salesorder` VALUES (47,0,'222','2014-05-11 18:34:12',0,'222');
INSERT INTO `salesorder` VALUES (48,0,'中科大','2014-05-11 18:37:07',0,'1234');
INSERT INTO `salesorder` VALUES (49,0,'33','2014-05-11 18:40:28',0,'33');
INSERT INTO `salesorder` VALUES (50,0,'明德楼','2014-05-11 19:06:21',0,'1111111111');
INSERT INTO `salesorder` VALUES (51,0,'中科大','2014-05-12 12:21:33',0,'111');
INSERT INTO `salesorder` VALUES (52,5,'明德楼','2014-05-12 12:25:11',0,'123456');
INSERT INTO `salesorder` VALUES (53,0,'111','2014-05-12 21:12:18',0,'111');
INSERT INTO `salesorder` VALUES (54,0,'中科大','2014-05-12 21:15:15',0,'11111');
INSERT INTO `salesorder` VALUES (55,1,'中国科学与技术大学','2014-05-12 21:22:39',0,'13866031858');
INSERT INTO `salesorder` VALUES (56,1,'中国科学与技术大学','2014-05-12 21:32:05',0,'13866031858');
INSERT INTO `salesorder` VALUES (57,0,'','2014-05-17 10:20:18',0,'');
INSERT INTO `salesorder` VALUES (58,1,'中国科学与技术大学','2014-05-17 10:21:25',0,'13866031858');
/*!40000 ALTER TABLE `salesorder` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table setmeal
#

DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal` (
  `setmealId` int(11) NOT NULL auto_increment,
  `pid1` int(11) default NULL,
  `pid2` int(11) default NULL,
  `pid3` int(11) default NULL,
  `pid4` int(11) default NULL,
  PRIMARY KEY  (`setmealId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Dumping data for table setmeal
#

LOCK TABLES `setmeal` WRITE;
/*!40000 ALTER TABLE `setmeal` DISABLE KEYS */;
/*!40000 ALTER TABLE `setmeal` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sjzdfl
#

DROP TABLE IF EXISTS `sjzdfl`;
CREATE TABLE `sjzdfl` (
  `sjzdflId` int(11) NOT NULL auto_increment,
  `sjzdflmc` varchar(255) default NULL,
  `qiyong` varchar(255) default NULL,
  PRIMARY KEY  (`sjzdflId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

#
# Dumping data for table sjzdfl
#

LOCK TABLES `sjzdfl` WRITE;
/*!40000 ALTER TABLE `sjzdfl` DISABLE KEYS */;
INSERT INTO `sjzdfl` VALUES (1,'健康套餐','yes');
INSERT INTO `sjzdfl` VALUES (2,'营养套餐','yes');
INSERT INTO `sjzdfl` VALUES (3,'混搭套餐','yes');
INSERT INTO `sjzdfl` VALUES (4,'节日套餐','yes');
INSERT INTO `sjzdfl` VALUES (5,'送礼套餐','yes');
/*!40000 ALTER TABLE `sjzdfl` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sjzdxx
#

DROP TABLE IF EXISTS `sjzdxx`;
CREATE TABLE `sjzdxx` (
  `sjzzId` int(11) NOT NULL auto_increment,
  `sjzdflId` int(11) default NULL,
  `sjzzxxmc` varchar(255) default NULL,
  `qiyong` varchar(255) default NULL,
  PRIMARY KEY  (`sjzzId`),
  KEY `FKCA4C0681391396C` (`sjzdflId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

#
# Dumping data for table sjzdxx
#

LOCK TABLES `sjzdxx` WRITE;
/*!40000 ALTER TABLE `sjzdxx` DISABLE KEYS */;
INSERT INTO `sjzdxx` VALUES (1,1,'8-香瓜','yes');
INSERT INTO `sjzdxx` VALUES (2,1,'7-香蕉','no');
INSERT INTO `sjzdxx` VALUES (3,1,'8-香瓜','no');
INSERT INTO `sjzdxx` VALUES (4,1,'5-英国葡萄','no');
INSERT INTO `sjzdxx` VALUES (5,1,'4-德国蛇果','no');
INSERT INTO `sjzdxx` VALUES (6,1,'3-美国火龙果','no');
INSERT INTO `sjzdxx` VALUES (7,1,'2-苏州梨子','no');
INSERT INTO `sjzdxx` VALUES (8,1,'1-海南苹果','no');
INSERT INTO `sjzdxx` VALUES (9,1,'7-香蕉','no');
INSERT INTO `sjzdxx` VALUES (10,1,'6-桃子','no');
INSERT INTO `sjzdxx` VALUES (11,2,'7-香蕉','yes');
INSERT INTO `sjzdxx` VALUES (12,2,'8-香瓜','yes');
INSERT INTO `sjzdxx` VALUES (13,2,'5-英国葡萄','yes');
INSERT INTO `sjzdxx` VALUES (14,2,'6-桃子','no');
INSERT INTO `sjzdxx` VALUES (15,2,'4-德国蛇果','no');
INSERT INTO `sjzdxx` VALUES (16,2,'4-德国蛇果','no');
INSERT INTO `sjzdxx` VALUES (17,2,'3-美国火龙果','no');
INSERT INTO `sjzdxx` VALUES (18,2,'2-苏州梨子','no');
INSERT INTO `sjzdxx` VALUES (19,2,'1-海南苹果','no');
INSERT INTO `sjzdxx` VALUES (20,2,'8-香瓜','no');
INSERT INTO `sjzdxx` VALUES (21,3,'4-德国蛇果','no');
INSERT INTO `sjzdxx` VALUES (22,3,'8-香瓜','no');
INSERT INTO `sjzdxx` VALUES (23,3,'7-香蕉','no');
INSERT INTO `sjzdxx` VALUES (24,3,'6-桃子','yes');
INSERT INTO `sjzdxx` VALUES (25,3,'5-英国葡萄','yes');
INSERT INTO `sjzdxx` VALUES (26,3,'4-德国蛇果','yes');
INSERT INTO `sjzdxx` VALUES (27,3,'3-美国火龙果','yes');
INSERT INTO `sjzdxx` VALUES (28,3,'2-苏州梨子','no');
INSERT INTO `sjzdxx` VALUES (29,3,'1-海南苹果','no');
INSERT INTO `sjzdxx` VALUES (30,3,'6-桃子','no');
INSERT INTO `sjzdxx` VALUES (31,4,'8-香瓜','no');
INSERT INTO `sjzdxx` VALUES (32,4,'7-香蕉','yes');
INSERT INTO `sjzdxx` VALUES (33,4,'6-桃子','yes');
INSERT INTO `sjzdxx` VALUES (34,4,'5-英国葡萄','no');
INSERT INTO `sjzdxx` VALUES (35,4,'4-德国蛇果','no');
INSERT INTO `sjzdxx` VALUES (36,4,'4-德国蛇果','no');
INSERT INTO `sjzdxx` VALUES (37,4,'3-美国火龙果','yes');
INSERT INTO `sjzdxx` VALUES (38,4,'2-苏州梨子','no');
INSERT INTO `sjzdxx` VALUES (39,4,'1-海南苹果','no');
INSERT INTO `sjzdxx` VALUES (40,4,'1-海南苹果','no');
INSERT INTO `sjzdxx` VALUES (41,5,'8-香瓜','no');
INSERT INTO `sjzdxx` VALUES (42,5,'8-香瓜','no');
INSERT INTO `sjzdxx` VALUES (43,5,'6-桃子','yes');
INSERT INTO `sjzdxx` VALUES (44,5,'6-桃子','yes');
INSERT INTO `sjzdxx` VALUES (45,5,'5-英国葡萄','no');
INSERT INTO `sjzdxx` VALUES (46,5,'5-英国葡萄','no');
INSERT INTO `sjzdxx` VALUES (47,5,'4-德国蛇果','no');
INSERT INTO `sjzdxx` VALUES (48,5,'4-德国蛇果','no');
INSERT INTO `sjzdxx` VALUES (49,5,'2-苏州梨子','no');
INSERT INTO `sjzdxx` VALUES (50,5,'2-苏州梨子','yes');
/*!40000 ALTER TABLE `sjzdxx` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table user
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(40) default NULL,
  `password` varchar(16) default NULL,
  `phone` varchar(40) default NULL,
  `addr` varchar(255) default NULL,
  `rdate` datetime default NULL,
  `email` varchar(255) default NULL,
  `right` int(11) unsigned zerofill default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#
# Dumping data for table user
#

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'郑祥','111','13866031858','中国科学与技术大学','2014-03-03 22:14:18','1021515609@qq.com',1);
INSERT INTO `user` VALUES (2,'潘飞','111','13866031858','中国科学与技术大学','2014-03-05 01:19:26','11111@qq.com',3);
INSERT INTO `user` VALUES (4,'2','111','123456','中科大','2014-05-11 01:10:02','',0);
INSERT INTO `user` VALUES (5,'王启蒙','111','123456','明德楼','2014-05-12 12:22:29','',4);
INSERT INTO `user` VALUES (6,'丁元禛','111','111','思贤楼','2014-05-12 20:02:38','',0);
INSERT INTO `user` VALUES (7,'李四','111','111','中科大','2014-05-12 21:20:05','',0);
INSERT INTO `user` VALUES (8,'张思','111','111','问问','2014-05-12 21:24:31','',0);
INSERT INTO `user` VALUES (9,'郑祥22','11122','22','2222','2014-05-12 21:30:46','',0);
INSERT INTO `user` VALUES (10,'郑祥11','111','111','111','2014-05-12 21:31:36','',0);
INSERT INTO `user` VALUES (11,'郑祥11','111','111','111','2014-05-12 21:33:54','',0);
INSERT INTO `user` VALUES (13,'郑祥33','111','11111','111','2014-05-13 22:14:14','111',0);
INSERT INTO `user` VALUES (14,'郑祥8','111','111','111','2014-05-15 00:57:21','111',0);
INSERT INTO `user` VALUES (15,'郑祥9','111','111','111','2014-05-15 00:58:50','111',0);
INSERT INTO `user` VALUES (16,'郑祥111','111','111','111','2014-05-15 00:59:33','111',0);
INSERT INTO `user` VALUES (17,'郑祥111','111','111','111','2014-05-15 23:43:26','111',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

#
#  Foreign keys for table sjzdxx
#

ALTER TABLE `sjzdxx`
ADD CONSTRAINT `FKCA4C0681391396C` FOREIGN KEY (`sjzdflId`) REFERENCES `beifengcrm`.`sjzdfl` (`sjzdflId`);


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
