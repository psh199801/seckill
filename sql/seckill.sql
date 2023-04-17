/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50709
 Source Host           : localhost:3306
 Source Schema         : seckill

 Target Server Type    : MySQL
 Target Server Version : 50709
 File Encoding         : 65001

 Date: 30/07/2020 15:08:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for seckill
-- ----------------------------
DROP TABLE IF EXISTS `seckill`;
CREATE TABLE `seckill` (
                           `seckill_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品库存ID',
                           `name` varchar(120) NOT NULL COMMENT 'Product',
                           `number` int(11) NOT NULL COMMENT 'Number in Stock',
                           `start_time` datetime NOT NULL COMMENT 'Seckill Start Time',
                           `end_time` datetime NOT NULL COMMENT 'Seckill End Time',
                           `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create Time',
                           PRIMARY KEY (`seckill_id`) USING BTREE,
                           KEY `idx_start_time` (`start_time`) USING BTREE,
                           KEY `idx_end_time` (`end_time`) USING BTREE,
                           KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='秒杀库存表';

-- ----------------------------
-- Records of seckill
-- ----------------------------
BEGIN;
INSERT INTO `seckill` VALUES (1000, '$1000 for iphone13', 285, '2020-11-19 00:00:00', '2021-11-20 00:00:00', '2021-11-20 20:08:46');
INSERT INTO `seckill` VALUES (1001, '$500 for iphone12', 999, '2020-11-19 00:00:00', '2021-11-20 00:00:00', '2021-11-20 20:08:46');
INSERT INTO `seckill` VALUES (1002, '$1000 for Mac Pro', 86, '2020-11-19 00:00:00', '2021-11-20 00:00:00', '2021-11-20 20:08:46');
INSERT INTO `seckill` VALUES (1003, '$200 for Ipad Mini', 186, '2020-11-19 00:00:00', '2021-11-20 00:00:00', '2021-11-20 20:08:46');
COMMIT;

-- ----------------------------
-- Table structure for success_killed
-- ----------------------------
DROP TABLE IF EXISTS `success_killed`;
CREATE TABLE `success_killed` (
                                  `seckill_id` bigint(20) NOT NULL COMMENT '秒杀商品ID',
                                  `user_phone` bigint(20) NOT NULL COMMENT '用户手机号',
                                  `state` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '状态标识:-1:无效 0:成功 1:已付款 2:已发货',
                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
                                  PRIMARY KEY (`seckill_id`,`user_phone`) USING BTREE,
                                  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='秒杀成功明细表';

-- ----------------------------
-- Records of success_killed
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
