/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50622
 Source Host           : localhost:3306
 Source Schema         : ecapus

 Target Server Type    : MySQL
 Target Server Version : 50622
 File Encoding         : 65001

 Date: 2/2/2023 21:38:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_blog
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog`;
CREATE TABLE `tb_blog`
(
    `id`          bigint(20) UNSIGNED                                            NOT NULL AUTO_INCREMENT COMMENT '主键',
    `shop_id`     bigint(20)                                                     NOT NULL COMMENT '商户id',
    `user_id`     bigint(20) UNSIGNED                                            NOT NULL COMMENT '用户id',
    `title`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '标题',
    `images`      varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '探店的照片，最多9张，多张以\",\"隔开',
    `content`     varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '探店的文字描述',
    `liked`       int(8) UNSIGNED                                                NULL     DEFAULT 0 COMMENT '点赞数量',
    `comments`    int(8) UNSIGNED                                                NULL     DEFAULT NULL COMMENT '评论数量',
    `create_time` timestamp                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_blog
-- ----------------------------

-- ----------------------------
-- Table structure for tb_blog_comments
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_comments`;
CREATE TABLE `tb_blog_comments`
(
    `id`          bigint(20) UNSIGNED                                           NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id`     bigint(20) UNSIGNED                                           NOT NULL COMMENT '用户id',
    `blog_id`     bigint(20) UNSIGNED                                           NOT NULL COMMENT '探店id',
    `parent_id`   bigint(20) UNSIGNED                                           NOT NULL COMMENT '关联的1级评论id，如果是一级评论，则值为0',
    `answer_id`   bigint(20) UNSIGNED                                           NOT NULL COMMENT '回复的评论id',
    `content`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回复的内容',
    `liked`       int(8) UNSIGNED                                               NULL     DEFAULT NULL COMMENT '点赞数',
    `status`      tinyint(1) UNSIGNED                                           NULL     DEFAULT NULL COMMENT '状态，0：正常，1：被举报，2：禁止查看',
    `create_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_blog_comments
-- ----------------------------

-- ----------------------------
-- Table structure for tb_follow
-- ----------------------------
# DROP TABLE IF EXISTS `tb_follow`;
# CREATE TABLE `tb_follow`  (
#   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
#   `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
#   `follow_user_id` bigint(20) UNSIGNED NOT NULL COMMENT '关联的用户id',
#   `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
#   PRIMARY KEY (`id`) USING BTREE
# ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_follow
-- ----------------------------

-- ----------------------------
-- Table structure for tb_seckill_voucher
-- ----------------------------
DROP TABLE IF EXISTS `tb_seckill_voucher`;
CREATE TABLE `tb_seckill_voucher`
(
    `voucher_id`  bigint(20) UNSIGNED NOT NULL COMMENT '关联的优惠券的id',
    `stock`       int(8)              NOT NULL COMMENT '库存',
    `create_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `begin_time`  timestamp           NOT NULL DEFAULT '2023-01-01 00:00:00' COMMENT '生效时间',
    `end_time`    timestamp           NOT NULL DEFAULT '2023-01-01 00:00:00' COMMENT '失效时间',
    `update_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`voucher_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '秒杀优惠券表，与优惠券是一对一关系'
  ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_seckill_voucher
-- ----------------------------

-- ----------------------------
-- Table structure for tb_shop
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop`;
CREATE TABLE `tb_shop`
(
    `id`          bigint(20) UNSIGNED                                            NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '商铺名称',
    `type_id`     bigint(20) UNSIGNED                                            NOT NULL COMMENT '商铺类型的id',
    `images`      varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商铺图片，多个图片以\',\'隔开',
    `area`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '商圈，例如陆家嘴',
    `address`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '地址',
    `x`           double UNSIGNED                                                NOT NULL COMMENT '经度',
    `y`           double UNSIGNED                                                NOT NULL COMMENT '维度',
    `avg_price`   bigint(10) UNSIGNED                                            NULL DEFAULT NULL COMMENT '均价，单位/元',
    `sold`        int(10) UNSIGNED ZEROFILL                                      NOT NULL COMMENT '销量',
    `comments`    int(10) UNSIGNED ZEROFILL                                      NOT NULL COMMENT '评论数量',
    `score`       int(2) UNSIGNED ZEROFILL                                       NOT NULL COMMENT '评分，1~5分，乘10保存，避免小数',
    `open_hours`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT '营业时间，例如 10:00-22:00',
    `create_time` timestamp                                                      NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp                                                      NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `foreign_key_type` (`type_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_shop
-- ----------------------------
INSERT INTO `tb_shop`
VALUES (1, '玉湖餐厅', 1,
        'https://5b0988e595225.cdn.sohucs.com/images/20181016/de5e8faa01f74ba8b66f86d324c2cc4d.jpeg',
        '紫金港', '玉湖', 120.149192, 30.316078, 20, 0000004215, 0000003035, 37, '8:00-21:00',
        '2022-12-22 18:10:39', '2023-01-13 17:32:19');
INSERT INTO `tb_shop`
VALUES (2, '北秀餐厅', 2,
        'https://5b0988e595225.cdn.sohucs.com/images/20181016/a2ea3c99bdcb453291c89dd37b361caf.jpeg',
        '紫金港', '西区', 120.151505, 30.333422, 85, 0000002160, 0000001460, 46,
        '8:30-20:00', '2022-12-22 19:00:13', '2023-01-11 16:12:26');

-- ----------------------------
-- Table structure for tb_dish
-- ----------------------------

DROP TABLE IF EXISTS `tb_dish`;
CREATE TABLE `tb_dish`
(
    `id`          bigint(20) UNSIGNED                                            NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '菜品名称',
    `shop_id`     bigint(20) UNSIGNED                                            NOT NULL COMMENT '店铺ID',
    `images`      varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜品图片，多个图片以\',\'隔开',
    `price`       bigint(10) UNSIGNED                                            NULL DEFAULT NULL COMMENT '价格 单位/分',
    `sold`        int(10) UNSIGNED ZEROFILL                                      NOT NULL COMMENT '销量',
    `comments`    int(10) UNSIGNED ZEROFILL                                      NOT NULL COMMENT '评论数量',
    `score`       int(2) UNSIGNED ZEROFILL                                       NOT NULL COMMENT '评分，1~5分，乘10保存，避免小数',
    `protein`     int(10) UNSIGNED ZEROFILL                                      NOT NULL COMMENT '蛋白质 乘10保存',
    `fat`         int(10) UNSIGNED ZEROFILL                                      NOT NULL COMMENT '脂肪 乘10保存',
    `carbs`       int(10) UNSIGNED ZEROFILL                                      NOT NULL COMMENT '碳水化合物 乘10保存',
    `create_time` timestamp                                                      NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp                                                      NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_dish
-- ----------------------------

INSERT INTO `tb_dish`
VALUES (1, '烤鸡翅', 1,
        'https://pic4.zhimg.com/0c19fd27d3df57c6e465d2017eb3e7a5_r.jpg?source=1940ef5c',
        8, 10, 85, 40, 174, 118, 46, '2022-12-22 19:00:13', '2023-01-11 16:12:26');

INSERT INTO `tb_dish`
VALUES (2, '水煮肉片', 2,
        'https://pic2.zhimg.com/510465ac27ac5d37efa3c1ee4667063d_r.jpg?source=1940ef5c',
        8, 18, 92, 39, 79, 89, 43, '2022-12-22 19:00:13', '2023-01-11 16:12:26');

-- ----------------------------
-- Table structure for tb_shop_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_type`;
CREATE TABLE `tb_shop_type`
(
    `id`          bigint(20) UNSIGNED                                           NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '类型名称',
    `icon`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
    `sort`        int(3) UNSIGNED                                               NULL DEFAULT NULL COMMENT '顺序',
    `create_time` timestamp                                                     NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp                                                     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_shop_type
-- ----------------------------
INSERT INTO `tb_shop_type`
VALUES (1, '美食', '/types/ms.png', 1, '2021-12-22 20:17:47', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type`
VALUES (2, 'KTV', '/types/KTV.png', 2, '2021-12-22 20:18:27', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type`
VALUES (3, '丽人·美发', '/types/lrmf.png', 3, '2021-12-22 20:18:48', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type`
VALUES (4, '健身运动', '/types/jsyd.png', 10, '2021-12-22 20:19:04', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type`
VALUES (5, '按摩·足疗', '/types/amzl.png', 5, '2021-12-22 20:19:27', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type`
VALUES (6, '美容SPA', '/types/spa.png', 6, '2021-12-22 20:19:35', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type`
VALUES (7, '亲子游乐', '/types/qzyl.png', 7, '2021-12-22 20:19:53', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type`
VALUES (8, '酒吧', '/types/jiuba.png', 8, '2021-12-22 20:20:02', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type`
VALUES (9, '轰趴馆', '/types/hpg.png', 9, '2021-12-22 20:20:08', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type`
VALUES (10, '美睫·美甲', '/types/mjmj.png', 4, '2021-12-22 20:21:46', '2021-12-23 11:24:31');

-- ----------------------------
-- Table structure for tb_sign
-- ----------------------------
# DROP TABLE IF EXISTS `tb_sign`;
# CREATE TABLE `tb_sign`
# (
#     `id`        bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
#     `user_id`   bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
#     `year`      year                NOT NULL COMMENT '签到的年',
#     `month`     tinyint(2)          NOT NULL COMMENT '签到的月',
#     `date`      date                NOT NULL COMMENT '签到的日期',
#     `is_backup` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否补签',
#     PRIMARY KEY (`id`) USING BTREE
# ) ENGINE = InnoDB
#   AUTO_INCREMENT = 1
#   CHARACTER SET = utf8mb4
#   COLLATE = utf8mb4_general_ci
#   ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_sign
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`
(
    `id`          bigint(20) UNSIGNED                                           NOT NULL AUTO_INCREMENT COMMENT '主键',
    `phone`       varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '手机号码',
    `password`    varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT '' COMMENT '密码，加密存储',
    `nick_name`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT '' COMMENT '昵称，默认是用户id',
    `icon`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT '' COMMENT '人物头像',
    `create_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uniqe_key_phone` (`phone`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user`
VALUES (1, '13686869696', '', '小A', '/imgs/blogs/blog1.jpg', '2021-12-24 10:27:19', '2022-01-11 16:04:00');
INSERT INTO `tb_user`
VALUES (2, '13838411438', '', '小B', '/imgs/icons/kkjtbcr.jpg', '2021-12-24 15:14:39', '2021-12-28 19:58:04');
INSERT INTO `tb_user`
VALUES (3, '13456789011', '', '小C', '', '2022-01-07 12:07:53', '2022-01-07 12:07:53');
INSERT INTO `tb_user`
VALUES (4, '18899990000', '', 'superlit', '/imgs/icons/user5-icon.png', '2023-11-07 16:11:33', '2023-11-08 09:09:20');

-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info`
(
    `user_id`     bigint(20) UNSIGNED                                           NOT NULL COMMENT '主键，用户id',
    `city`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT '' COMMENT '城市名称',
    `introduce`   varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '个人介绍，不要超过128个字符',
    `fans`        int(8) UNSIGNED                                               NULL     DEFAULT 0 COMMENT '粉丝数量',
    `followee`    int(8) UNSIGNED                                               NULL     DEFAULT 0 COMMENT '关注的人的数量',
    `gender`      tinyint(1) UNSIGNED                                           NULL     DEFAULT 0 COMMENT '性别，0：男，1：女',
    `birthday`    date                                                          NULL     DEFAULT NULL COMMENT '生日',
    `credits`     int(8) UNSIGNED                                               NULL     DEFAULT 0 COMMENT '积分',
    `level`       tinyint(1) UNSIGNED                                           NULL     DEFAULT 0 COMMENT '会员级别，0~9级,0代表未开通会员',
    `create_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_voucher
-- ----------------------------
DROP TABLE IF EXISTS `tb_voucher`;
CREATE TABLE `tb_voucher`
(
    `id`           bigint(20) UNSIGNED                                            NOT NULL AUTO_INCREMENT COMMENT '主键',
    `shop_id`      bigint(20) UNSIGNED                                            NULL     DEFAULT NULL COMMENT '商铺id',
    `title`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '代金券标题',
    `sub_title`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT NULL COMMENT '副标题',
    `rules`        varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '使用规则',
    `pay_value`    bigint(10) UNSIGNED                                            NOT NULL COMMENT '支付金额，单位是分。例如200代表2元',
    `actual_value` bigint(10)                                                     NOT NULL COMMENT '抵扣金额，单位是分。例如200代表2元',
    `type`         tinyint(1) UNSIGNED                                            NOT NULL DEFAULT 0 COMMENT '0,普通券；1,秒杀券',
    `status`       tinyint(1) UNSIGNED                                            NOT NULL DEFAULT 1 COMMENT '1,上架; 2,下架; 3,过期',
    `create_time`  timestamp                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`  timestamp                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_voucher
-- ----------------------------
INSERT INTO `tb_voucher`
VALUES (1, 1, '50元代金券', '周一至周日均可使用', '全场通用\\n无需预约\\n可无限叠加\\不兑现、不找零\\n仅限堂食', 4750,
        5000, 0, 1, '2022-01-04 09:42:39', '2022-01-04 09:43:31');

-- ----------------------------
-- Table structure for tb_voucher_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_voucher_order`;
CREATE TABLE `tb_voucher_order`
(
    `id`          bigint(20)          NOT NULL COMMENT '主键',
    `user_id`     bigint(20) UNSIGNED NOT NULL COMMENT '下单的用户id',
    `voucher_id`  bigint(20) UNSIGNED NOT NULL COMMENT '购买的代金券id',
    `pay_type`    tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '支付方式 1：余额支付；2：支付宝；3：微信',
    `status`      tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '订单状态，1：未支付；2：已支付；3：已核销；4：已取消；5：退款中；6：已退款',
    `create_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
    `pay_time`    timestamp           NULL     DEFAULT NULL COMMENT '支付时间',
    `use_time`    timestamp           NULL     DEFAULT NULL COMMENT '核销时间',
    `refund_time` timestamp           NULL     DEFAULT NULL COMMENT '退款时间',
    `update_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_voucher_order
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
