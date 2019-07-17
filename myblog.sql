# Host: 127.0.0.1  (Version: 5.5.15)
# Date: 2019-06-08 23:53:57
# Generator: MySQL-Front 5.3  (Build 4.269)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "admin"
#

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `hobby` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "admin"
#

INSERT INTO `admin` VALUES (1,'ygm123',NULL,'撸代码','20','123456','哥只是个传说');

#
# Structure for table "blog"
#

DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `blogName` varchar(255) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "blog"
#


#
# Structure for table "comment"
#

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

#
# Data for table "comment"
#

INSERT INTO `comment` VALUES (1,'11','11','2019-06-04 10:33:24'),(2,'222222','22','2019-06-04 10:33:24'),(80,'ppp123',' 222','2019-06-04 10:33:24'),(81,'ppp123',' 666','2019-06-04 10:39:02'),(82,'33','33','2019-06-04 10:33:24'),(84,'ppp123',' mm','2019-06-04 10:43:16'),(85,'ppp123',' 10:47','2019-06-04 10:47:38'),(86,'ppp123',' 10:49','2019-06-04 10:49:12'),(87,'ppp123',' 10:50','2019-06-04 10:50:23'),(88,'ppp123',' 6/5 9:04','2019-06-05 09:04:35'),(89,'ppp123',' 9:05','2019-06-05 09:05:09'),(90,'ppp123',' 14:18','2019-06-05 14:18:50'),(92,'ppp123',' 14:19','2019-06-05 14:19:33'),(93,'ppp123',' 123','2019-06-05 22:39:13'),(94,'ppp123',' 12\r\n','2019-06-05 22:54:02'),(95,'ppp123','说几句呗！！！','2019-06-06 11:26:09'),(96,'ppp123','说几句呗！！！','2019-06-06 11:33:59'),(97,'ppp123','ok完成了！！','2019-06-06 11:34:21'),(98,'ygm123','说几句呗！！！','2019-06-07 18:34:57');

#
# Structure for table "message"
#

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blogName` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "message"
#


#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rights` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'ygm123','111111',1),(2,'ppp123','111111',2),(3,'yyy123','111111',3),(4,'屁屁1234','111111',2);

#
# Trigger "t_afterdelete_on_tab1"
#

DROP TRIGGER IF EXISTS `t_afterdelete_on_tab1`;
CREATE DEFINER='root'@'localhost' TRIGGER `t_afterdelete_on_tab1` AFTER DELETE ON `blog`
  FOR EACH ROW BEGIN
delete from message where message.blogName=old.blogName;
END;
