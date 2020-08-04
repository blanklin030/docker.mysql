SET NAMES utf8;

DROP DATABASE IF EXISTS `test_mysql`;
CREATE DATABASE `test_mysql`;
USE `test_mysql`;

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '账号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user';
