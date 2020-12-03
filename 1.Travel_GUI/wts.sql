/*
 Navicat Premium Data Transfer

 Source Server         : hjt
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : wts

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 23/07/2020 17:35:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收获人姓名',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收获人手机号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `isDefault` int(11) NULL DEFAULT NULL COMMENT '是否默认。1：默认。0：非默认',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 1, '邹明军', '13666666666', '蜗牛学院五号楼', 1);
INSERT INTO `address` VALUES (2, 1, '邹大军', '13888888888', '华阳时代天城', 0);
INSERT INTO `address` VALUES (3, 1, '邹小军', '13999999999', '蜗牛学院四号楼', 0);
INSERT INTO `address` VALUES (4, 1, '哈哈哈', '15700510600', '别纠结了', 0);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态，0启用，1停用',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `county` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区县',
  `logins` int(11) NULL DEFAULT NULL COMMENT '登录次数',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'fc1709d0a95a6be30bc5926fdb7f22f4', '张三', 0, 'zhangsan@qq.com', '四川省', '成都市', '青羊区', 112, '2020-06-03 15:20:18', '2020-06-18 14:01:04', '17360243053');
INSERT INTO `admin` VALUES (2, 'tom', 'fc1709d0a95a6be30bc5926fdb7f22f4', '李四', 0, 'lisi@qq.com', '四川省', '成都市', '双流区', 4, '2020-06-14 15:19:07', '2020-06-15 15:19:15', '17360243054');
INSERT INTO `admin` VALUES (3, 'jack', 'fc1709d0a95a6be30bc5926fdb7f22f4', '王五', 0, 'wangwu@qq.com', '四川省', '成都市', '金牛区', 4, '2020-06-06 15:20:28', '2020-06-13 15:20:33', '17360243055');
INSERT INTO `admin` VALUES (4, 'mary', 'fc1709d0a95a6be30bc5926fdb7f22f4', '赵六', 0, 'zhaoliu@qq.com', '四川省', '成都市', '锦江区', 2, '2020-06-11 15:20:37', '2020-06-15 15:20:41', '17360243056');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `rid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (2, 2, 2);
INSERT INTO `admin_role` VALUES (3, 3, 3);
INSERT INTO `admin_role` VALUES (4, 4, 5);
INSERT INTO `admin_role` VALUES (76, 1, 1);
INSERT INTO `admin_role` VALUES (77, 1, 2);
INSERT INTO `admin_role` VALUES (78, 1, 3);
INSERT INTO `admin_role` VALUES (79, 1, 5);
INSERT INTO `admin_role` VALUES (80, 1, 6);
INSERT INTO `admin_role` VALUES (81, 1, 7);

-- ----------------------------
-- Table structure for cinema
-- ----------------------------
DROP TABLE IF EXISTS `cinema`;
CREATE TABLE `cinema`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影院公司名称',
  `c_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影院地址',
  `province` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `zone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `c_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电影院表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cinema
-- ----------------------------
INSERT INTO `cinema` VALUES (1, '金牛万达电影院', '人民北路1号万达广场', '四川省', '成都市', '金牛区', '18708133589');
INSERT INTO `cinema` VALUES (2, '青羊万达电影院', '日月大道一段978号', '四川省', '成都市', '青羊区', '1351111444');
INSERT INTO `cinema` VALUES (3, '锦华万达电影院', '锦华路一段68号', '四川省', '成都市', '锦江区', '13684141174');
INSERT INTO `cinema` VALUES (5, '高新万达电影院', '人民北路1号万达广场', '北京市', '北京市', '东城区', '1351111444');

-- ----------------------------
-- Table structure for cinema_users
-- ----------------------------
DROP TABLE IF EXISTS `cinema_users`;
CREATE TABLE `cinema_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电影院用户名',
  `c_telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `c_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `rid` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电影院用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cinema_users
-- ----------------------------
INSERT INTO `cinema_users` VALUES (1, 'helloworld1', '18708133599', '6cb3de5cbf18c23d695b6f81df198880', 1);
INSERT INTO `cinema_users` VALUES (3, 'hahaha', '18708133598', '879d6457d5315e047d842e5507c262b5', 2);
INSERT INTO `cinema_users` VALUES (4, 'hahah', '13684141175', 'fc1709d0a95a6be30bc5926fdb7f22f4', 2);

-- ----------------------------
-- Table structure for cinemauser_cinema
-- ----------------------------
DROP TABLE IF EXISTS `cinemauser_cinema`;
CREATE TABLE `cinemauser_cinema`  (
  `cuid` int(11) NULL DEFAULT NULL COMMENT '电影登录用户id',
  `cid` int(11) NULL DEFAULT NULL COMMENT '电影院id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电影用户与电影院中间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cinemauser_cinema
-- ----------------------------
INSERT INTO `cinemauser_cinema` VALUES (1, 1);
INSERT INTO `cinemauser_cinema` VALUES (1, 2);
INSERT INTO `cinemauser_cinema` VALUES (1, 3);
INSERT INTO `cinemauser_cinema` VALUES (1, 5);
INSERT INTO `cinemauser_cinema` VALUES (3, 2);
INSERT INTO `cinemauser_cinema` VALUES (4, 2);

-- ----------------------------
-- Table structure for complaint
-- ----------------------------
DROP TABLE IF EXISTS `complaint`;
CREATE TABLE `complaint`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `cinema_id` int(11) NULL DEFAULT NULL COMMENT '电影院ID',
  `text` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投诉内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态：0未处理，1已处理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投诉表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of complaint
-- ----------------------------
INSERT INTO `complaint` VALUES (1, 1, 1, '不能使用优惠券', '2020-06-20 19:34:18', 1);
INSERT INTO `complaint` VALUES (2, 1, 2, '环境太差', '2020-06-26 12:26:46', 0);
INSERT INTO `complaint` VALUES (4, 1, 1, '服务人员态度差', '2020-05-01 14:14:55', 1);
INSERT INTO `complaint` VALUES (8, 2, 2, '心情不好', '2020-05-01 17:34:44', 1);
INSERT INTO `complaint` VALUES (9, 2, 1, '服务人员态度差', '2020-04-01 19:16:49', 1);
INSERT INTO `complaint` VALUES (10, 2, 2, '心情不好', '2020-04-01 19:17:06', 0);
INSERT INTO `complaint` VALUES (11, 2, 1, '不能使用优惠券', '2020-03-01 19:17:34', 1);
INSERT INTO `complaint` VALUES (12, 2, 1, '服务人员态度差', '2020-02-01 19:17:49', 0);
INSERT INTO `complaint` VALUES (13, 1, 3, '环境太差', '2020-06-17 19:18:11', 0);
INSERT INTO `complaint` VALUES (14, 1, 3, '服务人员态度差', '2020-05-01 19:18:31', 0);
INSERT INTO `complaint` VALUES (15, 2, 4, '服务人员态度差', '2020-06-24 19:18:48', 1);
INSERT INTO `complaint` VALUES (16, 2, 4, '不能使用优惠券', '2020-05-01 19:19:10', 1);
INSERT INTO `complaint` VALUES (17, 2, 3, '不能使用优惠券', '2020-04-01 19:19:29', 1);
INSERT INTO `complaint` VALUES (18, 1, 3, '心情不好', '2020-03-01 19:26:27', 1);
INSERT INTO `complaint` VALUES (19, 1, 1, '太影响心情了', '2020-06-17 09:41:27', 0);
INSERT INTO `complaint` VALUES (20, 1, 1, '音响声音真嘈杂', '2020-04-01 09:42:30', 0);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `goods_type_id` int(11) NULL DEFAULT NULL COMMENT '商品类型id',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `amount` int(11) NULL DEFAULT NULL COMMENT '库存',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销价格',
  `carriage` int(11) NULL DEFAULT NULL COMMENT '邮费',
  `stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `sale` int(11) NULL DEFAULT 0 COMMENT '销量',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `publish_status` int(11) NULL DEFAULT NULL COMMENT '上架状态：0下架，1上架',
  `delete_status` int(11) NULL DEFAULT 0 COMMENT '删除状态：0未删除，1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 4, '复联1234 英文原版套装', 1777, 149.00, 105.50, 10, 975, 'img_2020062317113214339.jpg', 122, 10, 1, 0);
INSERT INTO `goods` VALUES (2, 1, 'Mun life 小咪迷你风扇', 2000, 59.00, 39.00, 5, 1886, 'img_2020062317115141923.jpg', 500, 15, 1, 0);
INSERT INTO `goods` VALUES (3, 5, '小马宝莉家居抱枕', 6666, 89.00, 55.00, 0, 2999, 'img_2020062317120943511.jpg', 55, 35, 1, 0);
INSERT INTO `goods` VALUES (5, 3, '中国机长电影周边帽子', 1500, 168.00, 99.00, 0, 3994, 'img_2020062317121934546.jpg', 135, 0, 1, 0);
INSERT INTO `goods` VALUES (6, 3, '小马宝莉单双层杯', 1000, 69.00, 39.00, 0, 5000, 'img_2020062317123598562.jpg', 3455, 0, 1, 0);
INSERT INTO `goods` VALUES (7, 1, '小马宝莉炫彩无线蓝牙座充耳机', 1000, 199.00, 89.00, 0, 990, 'img_2020070615303035335.jpg', 0, 0, 1, 0);
INSERT INTO `goods` VALUES (8, 1, 'ipad保护壳', 1000, 100.00, 56.00, 0, NULL, 'img_2020070817234355234.jpg', 0, 0, 1, 0);

-- ----------------------------
-- Table structure for goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `goods_comment`;
CREATE TABLE `goods_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论',
  `star` int(11) NULL DEFAULT NULL COMMENT '星级（1-5）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `read_count` int(11) NULL DEFAULT NULL COMMENT '读取次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_detail
-- ----------------------------
DROP TABLE IF EXISTS `goods_detail`;
CREATE TABLE `goods_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `sort` int(11) NULL DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品详细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_detail
-- ----------------------------
INSERT INTO `goods_detail` VALUES (29, 3, 'https://p0.meituan.net/movie/97a64ac596681be4d6bdeeb3a6cafc71448912.jpg', 1);
INSERT INTO `goods_detail` VALUES (30, 3, 'https://p0.meituan.net/movie/79af002771797dd1b9962f13e4470bfc480716.jpg', 2);
INSERT INTO `goods_detail` VALUES (31, 3, 'https://p0.meituan.net/movie/2aee32f49da51d5ef6c50d3c9833c525532813.jpg', 3);
INSERT INTO `goods_detail` VALUES (60, 1, 'img_2020062317125349361.png', 1);
INSERT INTO `goods_detail` VALUES (62, 1, 'img_2020062317125378116.png', 3);
INSERT INTO `goods_detail` VALUES (63, 1, 'img_2020062317125366535.png', 4);
INSERT INTO `goods_detail` VALUES (64, 1, 'img_2020062317125314792.png', 5);
INSERT INTO `goods_detail` VALUES (65, 1, 'img_2020062317125355647.png', 6);
INSERT INTO `goods_detail` VALUES (66, 1, 'img_2020062317125331659.jpg', 7);
INSERT INTO `goods_detail` VALUES (67, 1, 'img_2020062317125355225.png', 8);
INSERT INTO `goods_detail` VALUES (81, 2, 'img_2020062810342837492.jpg', 1);
INSERT INTO `goods_detail` VALUES (82, 2, 'img_2020062810352457673.jpg', 2);
INSERT INTO `goods_detail` VALUES (83, 2, 'img_2020062810353412727.jpg', 3);
INSERT INTO `goods_detail` VALUES (84, 2, 'img_2020062810354489145.jpg', 4);
INSERT INTO `goods_detail` VALUES (85, 2, 'img_2020062810360233087.jpg', 5);
INSERT INTO `goods_detail` VALUES (86, 2, 'img_2020062810362172176.jpg', 6);
INSERT INTO `goods_detail` VALUES (87, 2, 'img_2020062810362667802.jpg', 7);
INSERT INTO `goods_detail` VALUES (88, 2, 'img_2020062810363782796.jpg', 8);
INSERT INTO `goods_detail` VALUES (93, 2, 'img_2020062810381336195.jpg', 9);
INSERT INTO `goods_detail` VALUES (94, 2, 'img_2020062810383258521.jpg', 10);
INSERT INTO `goods_detail` VALUES (95, 2, 'img_2020062810383784871.jpg', 11);
INSERT INTO `goods_detail` VALUES (96, 2, 'img_2020062810384816942.jpg', 12);
INSERT INTO `goods_detail` VALUES (97, 2, 'img_2020062810385254815.jpg', 13);
INSERT INTO `goods_detail` VALUES (98, 5, 'img_2020062812154753205.jpg', 1);
INSERT INTO `goods_detail` VALUES (99, 5, 'img_2020062812154765623.jpg', 2);
INSERT INTO `goods_detail` VALUES (100, 5, 'img_2020062812154732425.jpg', 3);
INSERT INTO `goods_detail` VALUES (101, 5, 'img_2020062812154753663.jpg', 4);
INSERT INTO `goods_detail` VALUES (102, 5, 'img_2020062812154795484.jpg', 5);
INSERT INTO `goods_detail` VALUES (103, 7, 'img_2020070615331631564.jpg', 1);
INSERT INTO `goods_detail` VALUES (104, 7, 'img_2020070615332056136.jpg', 2);
INSERT INTO `goods_detail` VALUES (105, 7, 'img_2020070615332597928.jpg', 3);
INSERT INTO `goods_detail` VALUES (106, 7, 'img_2020070615333029322.jpg', 4);
INSERT INTO `goods_detail` VALUES (107, 7, 'img_2020070615333698662.jpg', 5);
INSERT INTO `goods_detail` VALUES (108, 7, 'img_2020070615334138861.jpg', 6);
INSERT INTO `goods_detail` VALUES (109, 7, 'img_2020070615334512826.jpg', 7);
INSERT INTO `goods_detail` VALUES (110, 7, 'img_2020070615334844825.jpg', 8);
INSERT INTO `goods_detail` VALUES (111, 8, 'img_2020070817251526272.jpg', 1);
INSERT INTO `goods_detail` VALUES (112, 8, 'img_2020070817251550985.jpg', 2);
INSERT INTO `goods_detail` VALUES (113, 8, 'img_2020070817251582066.jpg', 3);
INSERT INTO `goods_detail` VALUES (114, 8, 'img_2020070817251523081.jpg', 4);
INSERT INTO `goods_detail` VALUES (115, 8, 'img_2020070817251558187.jpg', 5);
INSERT INTO `goods_detail` VALUES (116, 8, 'img_2020070817251531638.jpg', 6);
INSERT INTO `goods_detail` VALUES (117, 8, 'img_2020070817251511694.jpg', 7);
INSERT INTO `goods_detail` VALUES (118, 8, 'img_2020070817251560548.jpg', 8);
INSERT INTO `goods_detail` VALUES (119, 8, 'img_2020070817251598620.jpg', 9);
INSERT INTO `goods_detail` VALUES (120, 8, 'img_2020070817251597113.jpg', 10);
INSERT INTO `goods_detail` VALUES (121, 8, 'img_2020070817251532476.jpg', 11);
INSERT INTO `goods_detail` VALUES (122, 8, 'img_2020070817251576370.jpg', 12);
INSERT INTO `goods_detail` VALUES (123, 8, 'img_2020070817251585258.jpg', 13);
INSERT INTO `goods_detail` VALUES (124, 8, 'img_2020070817251555201.jpg', 14);
INSERT INTO `goods_detail` VALUES (125, 8, 'img_2020070817251512842.jpg', 15);
INSERT INTO `goods_detail` VALUES (126, 8, 'img_2020070817251551095.jpg', 16);

-- ----------------------------
-- Table structure for goods_order
-- ----------------------------
DROP TABLE IF EXISTS `goods_order`;
CREATE TABLE `goods_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `goods_order_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(11) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->待收货；3->已完成；4->已关闭；5->无效订单',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `carriage` decimal(10, 0) NULL DEFAULT NULL COMMENT '运费',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `pay_type` int(11) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `payment_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付流水号',
  `address_id` int(11) NULL DEFAULT NULL COMMENT '收货地址id',
  `delivery_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `delivery_company` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `confirm_time` datetime(0) NULL DEFAULT NULL COMMENT '收货时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_order
-- ----------------------------
INSERT INTO `goods_order` VALUES (1, 1, '001', '2020-06-29 15:43:40', 1, 100.00, 10, 110.00, 1, '2020-07-01 14:13:09', '2020001', 3, NULL, NULL, NULL, NULL, '麻烦尽快发货，打包包裹时请多拿几个泡沫放在纸箱盒内，防止摔碎');
INSERT INTO `goods_order` VALUES (2, 1, '002', '2020-06-18 15:16:00', 2, 150.00, 0, 150.00, 1, '2020-06-18 16:21:58', '000000011', 3, '1234567890', '顺丰快递', '2020-06-18 17:05:00', NULL, '麻烦尽快发货');
INSERT INTO `goods_order` VALUES (3, 1, '003', '2020-06-18 16:16:00', 1, 150.00, 5, 155.00, 2, '2020-06-18 15:23:55', '000000012', 3, '', '', NULL, NULL, '麻烦尽快发货，打包包裹时请多拿几个泡沫放在纸箱盒内，防止摔碎');
INSERT INTO `goods_order` VALUES (4, 1, 'a84195ab-94ff-46cd-9e37-ddd178d0fa1', '2020-07-04 16:05:13', 0, 2.00, 0, 2.00, 1, '2020-07-02 15:26:48', '2020070222001442050500699997', 2, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (5, 1, '8246f7c8-0679-4760-9d90-665b518fbb03', '2020-07-04 01:58:57', 4, 195.00, 5, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (6, 1, '2af6cdf8-1206-48c0-aa73-9f357887baf5', '2020-07-04 02:00:34', 4, 273.00, 5, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (7, 1, '3285deef-e4be-4c2d-a012-97dcb1187523', '2020-07-04 02:01:01', 4, 39.00, 5, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (8, 1, '32704899-43eb-4996-8608-20215b2f9e3f', '2020-07-04 02:02:04', 4, 78.00, 5, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (9, 1, '3f3e5d30-ddf9-4c1d-a8b0-3ef77ace2744', '2020-07-04 02:04:42', 4, 39.00, 5, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (10, 1, 'ff8d232b-6865-4bd1-ade7-95a086ac3270', '2020-07-04 02:06:28', 4, 39.00, 5, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (11, 1, '050f3de1-18b4-4569-b059-a90a39cf732f', '2020-07-04 02:07:33', 4, 527.50, 10, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (12, 1, '15cebf50-0c4d-4e07-a0cc-5f930c9bf0fd', '2020-07-04 02:08:20', 4, 39.00, 5, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (13, 1, '5527c69a-0e65-48c7-93db-c860779319de', '2020-07-04 02:09:29', 4, 39.00, 5, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (14, 1, '5be9e611-a126-4987-b6c0-41cff5ce3717', '2020-07-04 02:17:30', 4, 211.00, 10, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (15, 1, '4fb31534-4880-420c-a99c-d602171c4e25', '2020-07-04 15:03:11', 0, 105.50, 10, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (16, 1, 'ac2d74e3-868e-4cc2-ae4f-d11b3084c554', '2020-07-04 15:04:45', 0, 105.50, 10, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (17, 1, 'fd9796d2-9d6b-4961-8627-31e0a4656339', '2020-07-04 15:06:00', 0, 105.50, 10, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (18, 1, '8d8fb6c2-ce9e-4661-a190-1a5cf4aed842', '2020-07-04 15:18:51', 0, 39.00, 5, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (19, 1, '6966e926-bf4a-4c04-979f-a08ba96b3742', '2020-07-04 15:21:06', 0, 55.00, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (20, 1, '97f50a45-0dc7-4824-a91b-3d3b20b6149d', '2020-07-04 15:26:15', 1, 99.00, 0, 1.00, 1, '2020-07-04 15:27:00', '2020070422001442050500701225', 2, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (21, 1, '1789b492-9d94-447a-8be4-8212e806476f', '2020-07-04 15:28:29', 0, 99.00, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (22, 1, '18ae6c9c-bdcc-4326-80ff-a6e2f4bbcfb2', '2020-07-06 20:43:28', 4, 39.00, 5, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (23, 1, 'f6f5ea2c-7b38-4af3-b83d-180b272cc4e7', '2020-07-06 20:47:24', 4, 39.00, 5, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (24, 1, '3a9b3388-60ed-4ddf-b9cf-c11a349410f5', '2020-07-06 21:00:23', 4, 39.00, 5, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (25, 1, '0477effe-fa62-4f23-a8c8-d7dc300d4afb', '2020-07-06 21:03:39', 4, 105.50, 10, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (26, 1, 'fac39dc2-a656-4c79-b9d6-f678a26cd85e', '2020-07-06 21:12:55', 1, 39.00, 5, 44.00, 1, '2020-07-06 21:13:51', '2020070622001442050500703653', 14, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (27, 1, 'fb10cc5e-e000-49b9-8ca3-46b49ec35866', '2020-07-07 14:17:30', 0, 39.00, 5, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (28, 1, '6e9c14b5-5f14-4f91-93ac-16e982fd7259', '2020-07-07 21:02:49', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (29, 1, 'd3da9a19-c13a-47e4-9982-51affcaa8980', '2020-07-07 21:02:53', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (30, 1, 'bb1023a7-9659-4068-a590-7d2361d6a235', '2020-07-07 21:02:53', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (31, 1, '08bd39ed-bbbf-445e-b023-a1e2053d58a3', '2020-07-07 21:02:54', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (32, 1, '658d3333-6963-4214-8427-86cdf8bb8dbd', '2020-07-07 21:02:58', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (33, 1, '8f9c7b12-915f-4a98-b5cf-59acc338149a', '2020-07-07 21:03:02', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (34, 1, 'a35c544a-9cae-451e-a8f2-10fa51b68046', '2020-07-07 21:03:11', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (35, 1, 'cd951fe1-8348-4635-a7a7-9e0d602cf6ea', '2020-07-07 21:03:15', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (36, 1, '590468cd-642f-4796-8700-63c740c2534f', '2020-07-07 21:03:19', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (37, 1, '7128b774-4c3c-4098-beb0-0f224668e678', '2020-07-07 21:03:23', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (38, 1, '1b1081e8-5762-4513-94c7-8b58a1f7e935', '2020-07-07 21:03:31', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (39, 1, '50d6dead-99f3-4f45-98fc-cb4f01d15e1c', '2020-07-07 21:03:39', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (40, 1, '2e14919a-36b0-47ef-aa4d-03afc2ab33b3', '2020-07-07 21:03:43', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (41, 1, 'f06ec321-a566-49df-84ca-d16ff206837a', '2020-07-07 21:03:51', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (42, 1, '4eb09cbc-2085-42a8-8f68-3494d5801314', '2020-07-07 21:03:55', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (43, 1, '8593ea9c-b859-4e91-894b-309bb4f9dc2d', '2020-07-07 21:03:59', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (44, 1, '278674c4-f6d2-4aff-827a-699b994bfada', '2020-07-07 21:04:07', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (45, 1, 'ee90fd9a-f504-4d22-95e2-ec0ee3a51dde', '2020-07-07 21:04:11', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (46, 1, '291ed799-887c-4810-8b1d-baafaa934069', '2020-07-07 21:04:15', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (47, 1, '3b96962d-509a-4e7d-b0f0-fe15c2010dd6', '2020-07-07 21:04:19', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (48, 1, 'b68a75e9-6dad-43d7-8c69-eab06be572f0', '2020-07-07 21:04:27', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (49, 1, '82aa9326-303e-4042-9b47-70bbc5d092f7', '2020-07-07 21:04:35', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (50, 1, 'c1acc6cd-99ad-43d2-84b5-ddbe8d6082d5', '2020-07-07 21:04:40', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (51, 1, '236a4977-7b20-4c02-a4b8-0ccac9e5e01f', '2020-07-07 21:04:48', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (52, 1, 'a217b10d-5137-4ff7-a824-db0ebd757941', '2020-07-07 21:04:52', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (53, 1, '0cac9de1-fa54-40b8-8944-b5572933a137', '2020-07-07 21:05:52', 0, 105.50, 10, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (54, 1, '0a75e5d9-9bd9-4961-b058-e3a57c4ea6f9', '2020-07-07 21:06:20', 0, 105.50, 10, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (55, 1, 'e8696857-e57d-4bfc-bfdb-357b99974a0e', '2020-07-07 21:07:52', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (56, 1, '652bed96-6258-4e8a-ac18-cd5a33198b19', '2020-07-07 21:08:06', 0, 39.00, 5, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (57, 1, 'e3f8e925-84cb-4778-ba1b-91d5d47af21b', '2020-07-07 21:47:21', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (58, 1, '07b77a38-d107-47fa-8f79-6066c8ace798', '2020-07-07 21:47:33', 0, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (59, 1, '5fe46c8f-5338-4222-81f4-4f94d39de18c', '2020-07-07 21:49:27', 1, 39.00, 5, 44.00, 1, '2020-07-07 21:50:13', '2020070722001442050500704461', 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (60, 1, 'e235a6c0-4001-4f72-a4c0-fb1240a5e97e', '2020-07-07 22:25:09', 1, 39.00, 5, 44.00, 1, '2020-07-07 22:26:01', '2020070722001442050500704462', 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (61, 1, '9aec82c5-c85e-419c-99be-71c35ef3c0f3', '2020-07-07 22:39:01', 1, 39.00, 5, 44.00, 1, '2020-07-07 22:40:03', '2020070722001442050500704463', 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (62, 1, '2d9805b4-9695-4459-ab75-483471b0b8c9', '2020-07-08 10:15:18', 1, 39.00, 5, 44.00, 1, '2020-07-08 10:15:36', '2020070822001442050500704585', 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (63, 1, '51a7514d-d1f0-45c1-ae1c-f0180c0ef53e', '2020-07-08 11:54:27', 4, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (64, 1, '4dd8e4c1-ee9b-4791-bc0f-c0ac601bd9a2', '2020-07-08 11:55:03', 4, 99.00, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (65, 1, '0b40291c-c9e7-4eb6-96f0-489a9ce22eee', '2020-07-08 11:55:03', 4, 99.00, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (66, 1, '6653125b-3edb-445c-883a-77d9ee0b582d', '2020-07-08 11:56:42', 4, 178.00, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (67, 1, '927bc3e1-d2fd-46bb-8fa3-dc354a4f00aa', '2020-07-08 11:57:58', 4, 89.00, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (68, 1, '8c588943-f1d7-44af-9bc6-d8d5881d5dd9', '2020-07-08 12:42:54', 4, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (69, 1, '9a087229-26a8-457e-8450-35488c0a3fb8', '2020-07-08 12:51:30', 4, 89.00, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (70, 1, '719b9b20-faaf-4f3a-b6aa-3dccfb8b0c92', '2020-07-08 14:39:21', 4, 39.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (71, 1, 'e65e4c49-b928-446f-b191-8b729c3db09e', '2020-07-08 15:20:16', 4, 89.00, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (72, 1, 'ec9506ec-6c41-4e84-bfcc-ecdc1c17da14', '2020-07-08 17:20:53', 1, 211.00, 10, 221.00, 1, '2020-07-08 17:21:36', '2020070822001442050500704739', 2, NULL, NULL, NULL, NULL, '请尽快发货');
INSERT INTO `goods_order` VALUES (73, 1, 'ce67fd96-929c-4c13-8ade-e5d8db73f549', '2020-07-08 17:22:25', 4, 78.00, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');
INSERT INTO `goods_order` VALUES (74, 1, 'c2a9daa8-3d58-4545-a7c7-d435c571124f', '2020-07-17 13:13:15', 0, 211.00, 10, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '');

-- ----------------------------
-- Table structure for goods_order_item
-- ----------------------------
DROP TABLE IF EXISTS `goods_order_item`;
CREATE TABLE `goods_order_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `goods_order_id` int(11) NULL DEFAULT NULL COMMENT '商品订单id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `count` int(11) NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品订单物品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_order_item
-- ----------------------------
INSERT INTO `goods_order_item` VALUES (1, 1, 1, 50.00, 2);
INSERT INTO `goods_order_item` VALUES (2, 2, 3, 50.00, 3);
INSERT INTO `goods_order_item` VALUES (3, 3, 2, 70.00, 2);
INSERT INTO `goods_order_item` VALUES (4, 4, 2, 39.00, 2);
INSERT INTO `goods_order_item` VALUES (5, 5, 2, 39.00, 5);
INSERT INTO `goods_order_item` VALUES (6, 6, 2, 39.00, 7);
INSERT INTO `goods_order_item` VALUES (7, 7, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (8, 8, 2, 39.00, 2);
INSERT INTO `goods_order_item` VALUES (9, 9, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (10, 10, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (11, 11, 1, 105.50, 5);
INSERT INTO `goods_order_item` VALUES (12, 12, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (13, 13, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (14, 14, 1, 105.50, 2);
INSERT INTO `goods_order_item` VALUES (15, 15, 1, 105.50, 1);
INSERT INTO `goods_order_item` VALUES (16, 16, 1, 105.50, 1);
INSERT INTO `goods_order_item` VALUES (17, 17, 1, 105.50, 1);
INSERT INTO `goods_order_item` VALUES (18, 18, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (19, 19, 3, 55.00, 1);
INSERT INTO `goods_order_item` VALUES (20, 20, 5, 99.00, 1);
INSERT INTO `goods_order_item` VALUES (21, 21, 5, 99.00, 1);
INSERT INTO `goods_order_item` VALUES (22, 22, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (23, 23, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (24, 24, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (25, 25, 1, 105.50, 1);
INSERT INTO `goods_order_item` VALUES (26, 26, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (27, 27, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (28, 28, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (29, 29, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (30, 30, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (31, 31, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (32, 32, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (33, 33, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (34, 34, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (35, 35, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (36, 36, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (37, 37, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (38, 38, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (39, 39, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (40, 40, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (41, 41, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (42, 42, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (43, 43, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (44, 44, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (45, 45, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (46, 46, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (47, 47, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (48, 48, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (49, 49, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (50, 50, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (51, 51, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (52, 52, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (53, 53, 1, 105.50, 1);
INSERT INTO `goods_order_item` VALUES (54, 54, 1, 105.50, 1);
INSERT INTO `goods_order_item` VALUES (55, 55, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (56, 56, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (57, 57, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (58, 58, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (59, 59, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (60, 60, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (61, 61, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (62, 62, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (63, 63, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (64, 64, 5, 99.00, 1);
INSERT INTO `goods_order_item` VALUES (65, 65, 5, 99.00, 1);
INSERT INTO `goods_order_item` VALUES (66, 66, 7, 89.00, 2);
INSERT INTO `goods_order_item` VALUES (67, 67, 7, 89.00, 1);
INSERT INTO `goods_order_item` VALUES (68, 68, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (69, 69, 7, 89.00, 1);
INSERT INTO `goods_order_item` VALUES (70, 70, 2, 39.00, 1);
INSERT INTO `goods_order_item` VALUES (71, 71, 7, 89.00, 1);
INSERT INTO `goods_order_item` VALUES (72, 72, 1, 105.50, 2);
INSERT INTO `goods_order_item` VALUES (73, 73, 2, 39.00, 2);
INSERT INTO `goods_order_item` VALUES (74, 74, 1, 105.50, 2);

-- ----------------------------
-- Table structure for goods_order_settting
-- ----------------------------
DROP TABLE IF EXISTS `goods_order_settting`;
CREATE TABLE `goods_order_settting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `payment_overtime` int(11) NULL DEFAULT NULL COMMENT '付款超时时间（分钟）',
  `confirm_overtime` int(11) NULL DEFAULT NULL COMMENT '自动确认收货时间（天）',
  `comment_overtime` int(11) NULL DEFAULT NULL COMMENT '自动好评时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品订单设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_pic
-- ----------------------------
DROP TABLE IF EXISTS `goods_pic`;
CREATE TABLE `goods_pic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_pic
-- ----------------------------
INSERT INTO `goods_pic` VALUES (5, 3, 'https://p0.meituan.net/movie/d2c6f450694521b9f8041bb5c382a0ca859441.jpg@750w_750h_2e');
INSERT INTO `goods_pic` VALUES (6, 3, 'https://p0.meituan.net/movie/71ed2c20be0d0435710293064bbed100752383.jpg@750w_750h_2e');
INSERT INTO `goods_pic` VALUES (7, 3, 'https://p0.meituan.net/movie/bc192ba4e106acaad966139614bccf39712237.jpg@750w_750h_2e');
INSERT INTO `goods_pic` VALUES (8, 3, 'https://p1.meituan.net/movie/ce5d218ce1abd683e2343df06dbec254717860.jpg@750w_750h_2e');
INSERT INTO `goods_pic` VALUES (22, 1, 'img_2020062317131650775.jpg');
INSERT INTO `goods_pic` VALUES (24, 1, 'img_2020062809520762365.jpg');
INSERT INTO `goods_pic` VALUES (25, 2, 'img_2020062810205460924.jpg');
INSERT INTO `goods_pic` VALUES (26, 2, 'img_2020062810205414176.jpg');
INSERT INTO `goods_pic` VALUES (27, 2, 'img_2020062810205412575.jpg');
INSERT INTO `goods_pic` VALUES (28, 2, 'img_2020062810205464338.jpg');
INSERT INTO `goods_pic` VALUES (29, 7, 'img_2020070615320068216.jpg');
INSERT INTO `goods_pic` VALUES (30, 7, 'img_2020070615320093208.jpg');
INSERT INTO `goods_pic` VALUES (31, 7, 'img_2020070615320042351.jpg');
INSERT INTO `goods_pic` VALUES (32, 7, 'img_2020070615320030793.jpg');
INSERT INTO `goods_pic` VALUES (33, 7, 'img_2020070615320020313.jpg');
INSERT INTO `goods_pic` VALUES (34, 8, 'img_2020070817244623724.jpg');
INSERT INTO `goods_pic` VALUES (35, 8, 'img_2020070817245520487.jpg');
INSERT INTO `goods_pic` VALUES (36, 8, 'img_2020070817245522120.jpg');

-- ----------------------------
-- Table structure for goods_return
-- ----------------------------
DROP TABLE IF EXISTS `goods_return`;
CREATE TABLE `goods_return`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `return_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货编号',
  `goods_order_id` int(11) NULL DEFAULT NULL COMMENT '商品订单id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `type` int(11) NULL DEFAULT NULL COMMENT '退货类型：0质量问题，1拍错了，2其他问题',
  `count` int(11) NULL DEFAULT NULL COMMENT '退货数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请理由',
  `pics` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '凭证图片地址（以逗号分隔）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `handle_id` int(11) NULL DEFAULT NULL COMMENT '处理人员',
  `handle_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理备注',
  `receive_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `receive_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `receive_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人地址',
  `confirm_time` datetime(0) NULL DEFAULT NULL COMMENT '完成时间',
  `status` int(11) NULL DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
  `delivery_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `delivery_company` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品退货表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_seckill
-- ----------------------------
DROP TABLE IF EXISTS `goods_seckill`;
CREATE TABLE `goods_seckill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '秒杀价格',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `status` int(11) NULL DEFAULT NULL COMMENT '0：未开始，1：进行中，2：已结束',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品秒杀表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_type
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品种类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_type
-- ----------------------------
INSERT INTO `goods_type` VALUES (1, '3C配件');
INSERT INTO `goods_type` VALUES (2, '手办公仔');
INSERT INTO `goods_type` VALUES (3, '生活服饰');
INSERT INTO `goods_type` VALUES (4, '电影原著');
INSERT INTO `goods_type` VALUES (5, '毛绒公仔');
INSERT INTO `goods_type` VALUES (6, '潮玩盲盒');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员名字',
  `opration` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NULL DEFAULT NULL COMMENT '执行时长（毫秒）',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, '18708133599', '根据电影院名字模糊查询', 'selectCinemaByCinemaName', '[{\"page\":1,\"limit\":10,\"LAY_CHECKED\":false,\"cName\":\"金牛万达电影院\"}]', 7, '0:0:0:0:0:0:0:1', '2020-06-30 15:30:06');
INSERT INTO `log` VALUES (2, 'helloworld1', '根据电影院名字模糊查询', 'selectCinemaByCinemaName', '[{\"page\":1,\"limit\":10,\"LAY_CHECKED\":false,\"cName\":\"金牛万达电影院\"}]', 4, '0:0:0:0:0:0:0:1', '2020-06-30 15:32:18');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父类菜单ID',
  `menu_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应地址',
  `open` int(11) NULL DEFAULT NULL COMMENT '是否展开 0.否 1.是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('L1', NULL, '电影院管理系统', NULL, 0);
INSERT INTO `menu` VALUES ('L101', 'L1', '影片管理', NULL, 0);
INSERT INTO `menu` VALUES ('L10101', 'L101', '发布管理', 'MovieInfo_Management.do', 0);
INSERT INTO `menu` VALUES ('L10102', 'L101', '图片管理', 'MoviePic.do', 0);
INSERT INTO `menu` VALUES ('L10103', 'L101', '视频管理', 'MovieVideo.do', 0);
INSERT INTO `menu` VALUES ('L10104', 'L101', '排片管理', 'Cinema.do', 0);
INSERT INTO `menu` VALUES ('L10105', 'L101', '演员管理', 'MovieActor.do', 0);
INSERT INTO `menu` VALUES ('L102', 'L1', '影厅管理', '', 0);
INSERT INTO `menu` VALUES ('L10201', 'L102', '播放厅管理', 'MovieOffice.do', 0);
INSERT INTO `menu` VALUES ('L10202', 'L102', '座位表管理', 'MovieSeat.do', 0);
INSERT INTO `menu` VALUES ('L103', 'L1', '影院管理', NULL, 0);
INSERT INTO `menu` VALUES ('L10301', 'L103', '影院列表', 'CinemaAll.do', 0);
INSERT INTO `menu` VALUES ('L10302', 'L103', '修改基本信息', 'Cinema_Management.do', 0);
INSERT INTO `menu` VALUES ('L10303', 'L103', '修改密码', 'CinemaUserEditPsw.do', 0);
INSERT INTO `menu` VALUES ('L104', 'L1', '订单管理', NULL, 0);
INSERT INTO `menu` VALUES ('L10401', 'L104', '已支付订单', 'Paid.do', 0);
INSERT INTO `menu` VALUES ('L10402', 'L104', '未支付订单', 'Unpaid.do', 0);
INSERT INTO `menu` VALUES ('L10403', 'L104', '已退票订单', NULL, 0);
INSERT INTO `menu` VALUES ('L105', 'L1', '数据统计管理', NULL, 0);
INSERT INTO `menu` VALUES ('L10501', 'L105', '收入统计', NULL, 0);
INSERT INTO `menu` VALUES ('L10502', 'L105', '影片统计', 'Stats.do', 0);
INSERT INTO `menu` VALUES ('L10503', 'L105', '订单统计', NULL, 0);
INSERT INTO `menu` VALUES ('L106', 'L1', '系统管理', NULL, 0);
INSERT INTO `menu` VALUES ('L10601', 'L106', '用户管理', 'CinemaUser.do', 0);
INSERT INTO `menu` VALUES ('L10602', 'L106', '角色管理', 'Roles.do', 0);
INSERT INTO `menu` VALUES ('L107', 'L1', '系统日志', NULL, 0);
INSERT INTO `menu` VALUES ('L10701', 'L107', '日志管理', 'Logs.do', 0);

-- ----------------------------
-- Table structure for movei_return
-- ----------------------------
DROP TABLE IF EXISTS `movei_return`;
CREATE TABLE `movei_return`  (
  `id` int(11) NOT NULL,
  `movie_order_id` int(11) NULL DEFAULT NULL COMMENT '电影订单表id',
  `return_time` datetime(0) NULL DEFAULT NULL COMMENT '退票时间',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电影退票表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for movie_actor
-- ----------------------------
DROP TABLE IF EXISTS `movie_actor`;
CREATE TABLE `movie_actor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NULL DEFAULT NULL COMMENT '电影名称id',
  `real_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `actor_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '演职人员图片',
  `actor_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份（导演，演员）',
  `role` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扮演角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '演职人员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_actor
-- ----------------------------
INSERT INTO `movie_actor` VALUES (7, 1, '周润发', 'img_202007081738247.jpg', '演员', '赌神');
INSERT INTO `movie_actor` VALUES (8, 1, '刘德华', 'img_202007081738458.jpg', '演员', '小弟');

-- ----------------------------
-- Table structure for movie_comment
-- ----------------------------
DROP TABLE IF EXISTS `movie_comment`;
CREATE TABLE `movie_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NULL DEFAULT NULL COMMENT '电影名称id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `star` decimal(2, 1) NULL DEFAULT NULL COMMENT '评分',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '评论时间',
  `praise` int(11) NULL DEFAULT NULL COMMENT '1表示点赞，2表示不好',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电影评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_comment
-- ----------------------------
INSERT INTO `movie_comment` VALUES (1, 1, '很好', 1, 4.5, '2020-06-12 14:51:42', 1);

-- ----------------------------
-- Table structure for movie_info
-- ----------------------------
DROP TABLE IF EXISTS `movie_info`;
CREATE TABLE `movie_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影名称',
  `release_time` date NULL DEFAULT NULL COMMENT '上映时间',
  `tid` int(11) NULL DEFAULT NULL COMMENT '电影类别id',
  `synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图片',
  `duration` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影时长',
  `dimensional` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '2d，3d',
  `notice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购票须知',
  `producer` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出票商',
  `language` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语言',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态：1表示上映，0表示未上映',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电影信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_info
-- ----------------------------
INSERT INTO `movie_info` VALUES (1, '赌神', '2020-06-20', 5, '《赌神》是1989年上映的一部香港赌片。该片是由香港导演王晶执导，周润发、刘德华、张敏、王祖贤等领衔主演的电影。该片讲述了因赌术精湛闻名于世界的赌神高进。 由于意外，高进误入小刀设下的陷井，头部受重伤而失去记忆。高进手下与外敌勾结，企图取代高进的地位并谋夺其家产。一场世界瞩目的赌王大战在公海拉开了帷幕。', 'img_202007071449516.png', '90分钟', '2d', '无', '万达电影', '国语', 1);
INSERT INTO `movie_info` VALUES (2, '让子弹飞', '2020-06-29', 5, '民国年间，花钱捐得县长的马邦德（葛优 饰）携妻（刘嘉玲 饰）及随从走马上任。途经南国某地，遭劫匪张麻子（姜文 饰）一伙伏击，随从尽死，只夫妻二人侥幸活命。马为保命，谎称自己是县长的汤师爷。为汤师爷许下的财富所动，张麻子摇身一变化身县长，带着手下赶赴鹅城上任。有道是天高皇帝远，鹅城地处偏僻，一方霸主黄四郎（周润发 饰）只手遮天，全然不将这个新来的县长放在眼里。张麻子痛打了黄的武教头（姜武 饰），黄则设计害死张的义子小六（张默 饰）。原本只想赚钱的马邦德，怎么也想不到竟会被卷入...', 'img_202007021159492.jpg', '90分钟', '2d', '无', '万达电影', '国语', 1);
INSERT INTO `movie_info` VALUES (3, '重庆森林', '2020-06-28', 3, '《重庆森林》是泽东电影公司出品的一部都市时装片，由王家卫执导，林青霞、梁朝伟、王菲、金城武等主演。1994年7月14日，该片在香港上映。影片讲述了两个爱情故事：失恋的警察与神秘女杀手一段都市邂逅以及巡警663与快餐店女孩的爱情故事。1995年，该片获得了第14届香港电影金像奖最佳影片、最佳导演等奖项。 ', 'img_202007071451223.jpg', '100分钟', '2D', '不能退票', '华谊公司', '国语', 1);
INSERT INTO `movie_info` VALUES (4, '新龙门客栈', '2020-06-25', 4, '《新龙门客栈》是由香港思远影业与潇湘电影制片厂联合制作的武侠动作片，由徐克监制，李惠民导演，梁家辉、张曼玉、林青霞、甄子丹主演，程小东担任武术指导。影片改编自胡金铨的《龙门客栈》。电影背景基于明朝中叶，讲述了武林侠士救助忠良之后，跟东厂高手在大漠龙门客栈发生尔虞我诈的遭遇战故事。影片以高亢大气的西北风述说了江湖儿女的恩怨情仇，无论是人物刻画抑或故事气度，在遵循传统武侠形制的基础上有所突破，开一派新 ...', 'img_202007071452459.jpg', '100分钟', '2D', '不能退票', '华谊公司', '国语', 0);

-- ----------------------------
-- Table structure for movie_office
-- ----------------------------
DROP TABLE IF EXISTS `movie_office`;
CREATE TABLE `movie_office`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '播放厅名字',
  `seat` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '座位表',
  `cid` int(11) NULL DEFAULT NULL COMMENT '电影院id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '播放厅表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_office
-- ----------------------------
INSERT INTO `movie_office` VALUES (1, '1号厅', '[[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,0,0,0,0,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0]]', 1);
INSERT INTO `movie_office` VALUES (2, '2号厅', '[[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0]]', 1);
INSERT INTO `movie_office` VALUES (3, '3号厅', '[[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0]]', 1);
INSERT INTO `movie_office` VALUES (4, '4号厅', '[[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0]]', 1);
INSERT INTO `movie_office` VALUES (5, '1号厅', '[[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0]]', 2);
INSERT INTO `movie_office` VALUES (6, '2号厅', '[[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0]]', 2);
INSERT INTO `movie_office` VALUES (10, '桂花厅', '[[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]', 2);
INSERT INTO `movie_office` VALUES (11, '66666', '[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]', 5);
INSERT INTO `movie_office` VALUES (16, '会员厅', '[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]', 3);

-- ----------------------------
-- Table structure for movie_order
-- ----------------------------
DROP TABLE IF EXISTS `movie_order`;
CREATE TABLE `movie_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `cid` int(11) NULL DEFAULT NULL COMMENT '电影院id',
  `mid` int(11) NULL DEFAULT NULL COMMENT '电影名称id',
  `sid` int(11) NULL DEFAULT NULL COMMENT '场次id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '订单创建时间',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `tickets` int(11) NULL DEFAULT NULL COMMENT '票的数量',
  `seatno` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '座位号（几排几号，1-1，1-2）',
  `session_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '场次的票价',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价钱=票的数量*场次的票价',
  `state` int(11) NULL DEFAULT NULL COMMENT '0：未支付 1：已支付:2：已退票',
  `remarks` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电影订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_order
-- ----------------------------
INSERT INTO `movie_order` VALUES (62, '7f42aa57-03b3-4127-a80f-7c45a7b4226e', 1, 1, 1, '2020-07-06 20:21:49', 1, 2, '[[3,4],[3,3]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (63, '01b6f1a5-c48a-4c84-9052-6b65d45fb834', 1, 1, 1, '2020-07-06 20:21:57', 1, 4, '[[3,4],[3,3],[8,11],[8,12]]', 39.00, 156.00, -1, NULL);
INSERT INTO `movie_order` VALUES (64, '087de735-fd88-4033-af81-5c8a14cbb661', 1, 1, 6, '2020-07-06 20:27:35', 1, 2, '[[0,6],[1,6]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (74, '91394d5b-7204-4f77-b1be-94fc00a32ba9', 1, 1, 1, '2020-07-06 20:54:18', 1, 2, '[[8,2],[9,2]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (75, 'a87f8566-ccd2-4da4-8967-745795bb1aa8', 1, 1, 1, '2020-07-06 20:54:45', 1, 3, '[[8,2],[9,2],[7,1]]', 39.00, 117.00, -1, NULL);
INSERT INTO `movie_order` VALUES (76, '80732ba9-1e5a-4a61-8c4b-e1a2bfa6bb22', 5, 1, 4, '2020-07-06 20:55:19', 1, 2, '[[6,7],[6,8]]', 29.00, 58.00, -1, NULL);
INSERT INTO `movie_order` VALUES (77, 'df8c91f1-e9d0-4f05-9efe-fbbd7874317b', 5, 1, 4, '2020-07-06 20:57:30', 1, 4, '[[6,7],[6,8],[6,4],[6,5]]', 29.00, 116.00, -1, NULL);
INSERT INTO `movie_order` VALUES (78, 'd376357b-864d-464a-b40c-f0dc2daa5361', 2, 1, 5, '2020-07-06 21:04:53', 1, 2, '[[7,7],[7,6]]', 40.00, 80.00, 1, NULL);
INSERT INTO `movie_order` VALUES (79, '03a9d0a9-667f-4bb3-9ddb-5b7398ff4ebd', 2, 1, 5, '2020-07-06 21:09:26', 1, 2, '[[1,3],[1,4]]', 40.00, 80.00, 1, NULL);
INSERT INTO `movie_order` VALUES (80, '01eb1f35-f2c5-4890-89ea-9b44ad7d8d45', 1, 1, 1, '2020-07-06 21:09:38', 1, 1, '[[5,4]]', 39.00, 39.00, 1, NULL);
INSERT INTO `movie_order` VALUES (81, 'f6c680a8-448f-4652-bee1-6d3594a40c67', 1, 1, 1, '2020-07-06 21:10:59', 1, 2, '[[5,4],[8,4]]', 39.00, 78.00, 1, NULL);
INSERT INTO `movie_order` VALUES (82, 'ed77f27e-fe24-4095-9620-88b75d3d11aa', 1, 1, 1, '2020-07-06 21:11:42', 1, 1, '[[7,5]]', 39.00, 39.00, 1, NULL);
INSERT INTO `movie_order` VALUES (83, '7e631064-e67e-498e-a02f-a75a7b1c8419', 5, 1, 4, '2020-07-06 21:12:44', 1, 2, '[[6,2],[7,2]]', 29.00, 58.00, 1, NULL);
INSERT INTO `movie_order` VALUES (84, '1fc78b38-bbb4-4e6e-b1f5-19dcf6a85e10', 1, 1, 1, '2020-07-06 21:15:17', 1, 1, '[[9,1]]', 39.00, 39.00, 1, NULL);
INSERT INTO `movie_order` VALUES (85, 'aad05b28-b92e-4626-9c8c-54df95431b69', 1, 1, 1, '2020-07-06 21:25:53', 1, 2, '[[6,12],[6,13]]', 39.00, 78.00, 1, NULL);
INSERT INTO `movie_order` VALUES (86, '6a2499d1-8653-4371-a122-c4b7f3043255', 1, 1, 1, '2020-07-06 21:31:24', 1, 1, '[[6,6]]', 39.00, 39.00, 1, NULL);
INSERT INTO `movie_order` VALUES (87, '6c9f9108-aac0-43ee-8ed6-bc657389e646', 1, 1, 1, '2020-07-06 21:31:33', 1, 4, '[[6,6],[5,7],[5,8],[5,11]]', 39.00, 156.00, 1, NULL);
INSERT INTO `movie_order` VALUES (88, '355a17f1-1699-4bc0-a9fb-71415c0a95e0', 1, 1, 1, '2020-07-06 21:35:58', 1, 1, '[[3,11]]', 39.00, 39.00, 1, NULL);
INSERT INTO `movie_order` VALUES (89, '54d26f85-2069-4a2a-a251-cab6d50da225', 1, 1, 1, '2020-07-06 21:47:06', 1, 1, '[[3,11]]', 39.00, 39.00, 1, NULL);
INSERT INTO `movie_order` VALUES (90, '82493df8-13f1-4f08-a5c4-5c0b1a7b8198', 1, 1, 6, '2020-07-06 21:58:27', 1, 4, '[[0,6],[0,7],[0,8],[1,6]]', 39.00, 156.00, -1, NULL);
INSERT INTO `movie_order` VALUES (91, '175327b8-c897-4097-81b9-2f5e1cfab157', 5, 1, 11, '2020-07-06 21:59:30', 1, 4, '[[3,6],[3,7],[3,8],[3,9]]', 40.00, 160.00, -1, NULL);
INSERT INTO `movie_order` VALUES (92, '846eec21-9e99-46a4-9dcf-5bd3072513b9', 1, 1, 1, '2020-07-07 10:07:40', 1, 2, '[[5,7],[5,8]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (93, '2880c0fe-6126-410f-b963-3790685df53b', 1, 1, 1, '2020-07-07 10:10:07', 1, 2, '[[7,6],[8,6]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (94, '0a6047ea-ba3d-4691-a4cd-4177fc065590', 1, 1, 1, '2020-07-07 10:11:42', 1, 2, '[[0,7],[0,8]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (95, 'ba2a0a48-2df9-4574-873d-947c2d56bc57', 1, 1, 1, '2020-07-07 10:14:58', 1, 1, '[[1,3]]', 39.00, 39.00, -1, NULL);
INSERT INTO `movie_order` VALUES (96, '1f11c0d6-4b7f-492e-b389-069b17c7bbab', 1, 1, 6, '2020-07-07 10:17:22', 1, 2, '[[0,6],[1,6]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (97, '64208843-ea35-48e9-be35-4057c455b6ac', 1, 1, 1, '2020-07-07 10:26:18', 1, 2, '[[3,6],[3,7]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (98, '1735a669-eaeb-457d-961a-6eab8087907c', 1, 1, 1, '2020-07-07 10:28:39', 1, 2, '[[7,8],[7,7]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (99, '2bc59370-abc9-449f-8d2e-bb9bb53e30fe', 1, 1, 9, '2020-07-07 12:19:12', 1, 4, '[[5,5],[5,6],[5,7],[5,8]]', 40.00, 160.00, -1, NULL);
INSERT INTO `movie_order` VALUES (100, 'a8f949c7-1aaf-42e1-b092-c0a12651b277', 1, 1, 6, '2020-07-07 14:05:38', 1, 1, '[[1,4]]', 39.00, 39.00, -1, NULL);
INSERT INTO `movie_order` VALUES (101, '5902da31-92ef-43b1-81eb-12f397d4f5af', 5, 1, 11, '2020-07-07 14:09:42', 1, 2, '[[1,6],[1,7]]', 40.00, 80.00, -1, NULL);
INSERT INTO `movie_order` VALUES (102, '256323d3-732c-43d4-bad4-3038250b7c10', 1, 1, 1, '2020-07-07 15:35:25', 1, 4, '[[5,11],[5,12],[5,13],[5,14]]', 39.00, 156.00, -1, NULL);
INSERT INTO `movie_order` VALUES (103, 'a21e1db7-5eed-4f0f-886f-86b6c94c93f2', 1, 1, 6, '2020-07-07 15:35:44', 1, 4, '[[5,5],[5,6],[5,7],[5,8]]', 39.00, 156.00, -1, NULL);
INSERT INTO `movie_order` VALUES (104, 'c5fe1236-e95c-4b26-a6d0-a4f0f51f5d68', 1, 1, 1, '2020-07-07 15:36:59', 1, 2, '[[5,7],[5,8]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (105, 'b647794a-cb7e-4502-b357-0f3ed0481749', 1, 1, 1, '2020-07-07 15:43:10', 1, 2, '[[6,7],[6,8]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (106, '3f4fafdb-d0b5-4a7b-a4ba-a222a9827f09', 1, 1, 1, '2020-07-07 16:07:20', 1, 2, '[[0,8],[1,8]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (107, '78ed0a15-90fe-4e7a-8e42-fd4321757606', 1, 1, 1, '2020-07-07 16:07:28', 1, 2, '[[7,5],[7,6]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (108, 'fedd73c7-7364-4e3f-9293-9a16eb5345a5', 1, 3, 8, '2020-07-07 16:14:19', 1, 2, '[[7,7],[7,8]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (109, '16f60972-f235-490f-beb3-0ce6c3c624a8', 1, 1, 6, '2020-07-07 16:20:15', 1, 2, '[[7,6],[7,5]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (110, '93e09495-d900-48e3-b884-66d7fd40bacf', 1, 1, 1, '2020-07-07 16:44:49', 1, 2, '[[8,5],[8,6]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (111, '4b496766-adbf-40c1-8143-0b15372f5b7b', 1, 2, 7, '2020-07-07 17:36:19', 1, 3, '[[0,3],[0,4],[1,4]]', 39.00, 117.00, -1, NULL);
INSERT INTO `movie_order` VALUES (112, 'a3f45f8b-e4cc-4c0d-a790-94b4e18be621', 1, 1, 1, '2020-07-07 21:00:48', 1, 3, '[[6,6],[6,8],[6,7]]', 39.00, 117.00, -1, NULL);
INSERT INTO `movie_order` VALUES (113, 'e2dd8170-6fe1-4850-867e-22aa990c1d13', 1, 1, 1, '2020-07-07 21:27:23', 1, 2, '[[6,13],[6,12]]', 39.00, 78.00, 1, NULL);
INSERT INTO `movie_order` VALUES (114, 'c0c7e990-f13f-485f-bca8-4681df222e9e', 1, 2, 7, '2020-07-08 09:46:56', 1, 2, '[[8,5],[8,8]]', 39.00, 78.00, -1, NULL);
INSERT INTO `movie_order` VALUES (115, '259e3477-508e-410b-87aa-5203c0e986c6', 1, 1, 1, '2020-07-08 10:06:24', 1, 2, '[[6,4],[6,5]]', 39.00, 78.00, 1, NULL);
INSERT INTO `movie_order` VALUES (116, '70bebf4b-d6d2-4e32-8347-36296f173ee4', 3, 1, 13, '2020-07-08 11:21:57', 1, 3, '[[3,3],[3,5],[3,4]]', 40.00, 120.00, 1, NULL);
INSERT INTO `movie_order` VALUES (117, '9fe1a148-6057-4441-8655-d1f8220e1bf3', 1, 1, 6, '2020-07-08 16:53:50', 1, 4, '[[5,5],[5,6],[5,7],[5,8]]', 39.00, 156.00, -1, NULL);
INSERT INTO `movie_order` VALUES (118, '605ed167-4e6e-4d06-9719-c60b913bab87', 1, 1, 6, '2020-07-08 16:55:54', 1, 4, '[[5,5],[5,6],[5,7],[5,8]]', 39.00, 156.00, 1, NULL);
INSERT INTO `movie_order` VALUES (119, 'a98c42a5-748c-42e0-87a8-fe9d4892bd57', 3, 1, 13, '2020-07-08 16:57:36', 1, 2, '[[4,5],[4,6]]', 40.00, 80.00, -1, NULL);

-- ----------------------------
-- Table structure for movie_pic
-- ----------------------------
DROP TABLE IF EXISTS `movie_pic`;
CREATE TABLE `movie_pic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NULL DEFAULT NULL COMMENT '电影名称id',
  `pic_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影剧照',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电影剧照图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_pic
-- ----------------------------
INSERT INTO `movie_pic` VALUES (7, 3, 'img_20200618164712.jpg');
INSERT INTO `movie_pic` VALUES (24, 4, 'img_202006281258173.png');
INSERT INTO `movie_pic` VALUES (25, 3, 'img_202006281300418.jpg');
INSERT INTO `movie_pic` VALUES (26, 3, 'img_202006281301057.jpg');
INSERT INTO `movie_pic` VALUES (27, 2, 'img_202006281302539.jpg');
INSERT INTO `movie_pic` VALUES (28, 3, 'img_202006281304540.jpg');
INSERT INTO `movie_pic` VALUES (29, 2, 'img_202006281311390.jpg');
INSERT INTO `movie_pic` VALUES (30, 2, 'img_202006281311405.jpg');
INSERT INTO `movie_pic` VALUES (31, 1, 'img_202007081737115.png');
INSERT INTO `movie_pic` VALUES (32, 1, 'img_202007081737118.png');
INSERT INTO `movie_pic` VALUES (33, 1, 'img_202007081737119.png');

-- ----------------------------
-- Table structure for movie_seat
-- ----------------------------
DROP TABLE IF EXISTS `movie_seat`;
CREATE TABLE `movie_seat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `YCoord` int(11) NULL DEFAULT NULL COMMENT '纵坐标',
  `XCoord` int(11) NULL DEFAULT NULL COMMENT '横坐标',
  `SeatCode` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座位信息',
  `Status` int(11) NULL DEFAULT NULL COMMENT '0：未出售 1：已售出',
  `RowNum` int(11) NULL DEFAULT NULL COMMENT '第几排',
  `ColumnNum` int(11) NULL DEFAULT NULL COMMENT '第几座',
  `movie_office_id` int(11) NULL DEFAULT NULL COMMENT '播放厅id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 601 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '座位表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_seat
-- ----------------------------
INSERT INTO `movie_seat` VALUES (121, 3, 11, '4413141101#01#01', 0, 1, 1, 1);
INSERT INTO `movie_seat` VALUES (122, 3, 12, '4413141101#01#02', 0, 1, 2, 1);
INSERT INTO `movie_seat` VALUES (123, 3, 13, '4413141101#01#03', 0, 1, 3, 1);
INSERT INTO `movie_seat` VALUES (124, 3, 14, '4413141101#01#04', 0, 1, 4, 1);
INSERT INTO `movie_seat` VALUES (125, 3, 15, '4413141101#01#05', 0, 1, 5, 1);
INSERT INTO `movie_seat` VALUES (126, 3, 16, '4413141101#01#06', 0, 1, 6, 1);
INSERT INTO `movie_seat` VALUES (127, 3, 17, '4413141101#01#07', 0, 1, 7, 1);
INSERT INTO `movie_seat` VALUES (128, 3, 18, '4413141101#01#08', 0, 1, 8, 1);
INSERT INTO `movie_seat` VALUES (129, 3, 19, '4413141101#01#09', 0, 1, 9, 1);
INSERT INTO `movie_seat` VALUES (130, 3, 20, '4413141101#01#10', 0, 1, 10, 1);
INSERT INTO `movie_seat` VALUES (131, 3, 21, '4413141101#01#11', 0, 1, 11, 1);
INSERT INTO `movie_seat` VALUES (132, 3, 22, '4413141101#01#12', 0, 1, 12, 1);
INSERT INTO `movie_seat` VALUES (133, 3, 23, '4413141101#01#13', 0, 1, 13, 1);
INSERT INTO `movie_seat` VALUES (134, 3, 24, '4413141101#01#14', 0, 1, 14, 1);
INSERT INTO `movie_seat` VALUES (135, 3, 25, '4413141101#01#15', 0, 1, 15, 1);
INSERT INTO `movie_seat` VALUES (136, 4, 11, '4413141101#02#01', 0, 2, 1, 1);
INSERT INTO `movie_seat` VALUES (137, 4, 12, '4413141101#02#02', 0, 2, 2, 1);
INSERT INTO `movie_seat` VALUES (138, 4, 13, '4413141101#02#03', 0, 2, 3, 1);
INSERT INTO `movie_seat` VALUES (139, 4, 14, '4413141101#02#04', 0, 2, 4, 1);
INSERT INTO `movie_seat` VALUES (140, 4, 15, '4413141101#02#05', 0, 2, 5, 1);
INSERT INTO `movie_seat` VALUES (141, 4, 16, '4413141101#02#06', 0, 2, 6, 1);
INSERT INTO `movie_seat` VALUES (142, 4, 17, '4413141101#02#07', 0, 2, 7, 1);
INSERT INTO `movie_seat` VALUES (143, 4, 18, '4413141101#02#08', 0, 2, 8, 1);
INSERT INTO `movie_seat` VALUES (144, 4, 19, '4413141101#02#09', 0, 2, 9, 1);
INSERT INTO `movie_seat` VALUES (145, 4, 20, '4413141101#02#10', 0, 2, 10, 1);
INSERT INTO `movie_seat` VALUES (146, 4, 21, '4413141101#02#11', 0, 2, 11, 1);
INSERT INTO `movie_seat` VALUES (147, 4, 22, '4413141101#02#12', 0, 2, 12, 1);
INSERT INTO `movie_seat` VALUES (148, 4, 23, '4413141101#02#13', 0, 2, 13, 1);
INSERT INTO `movie_seat` VALUES (149, 4, 24, '4413141101#02#14', 0, 2, 14, 1);
INSERT INTO `movie_seat` VALUES (150, 4, 25, '4413141101#02#15', 0, 2, 15, 1);
INSERT INTO `movie_seat` VALUES (151, 5, 11, '4413141101#03#01', 0, 3, 1, 1);
INSERT INTO `movie_seat` VALUES (152, 5, 12, '4413141101#03#02', 0, 3, 2, 1);
INSERT INTO `movie_seat` VALUES (153, 5, 13, '4413141101#03#03', 0, 3, 3, 1);
INSERT INTO `movie_seat` VALUES (154, 5, 14, '4413141101#03#04', 0, 3, 4, 1);
INSERT INTO `movie_seat` VALUES (155, 5, 15, '4413141101#03#05', 0, 3, 5, 1);
INSERT INTO `movie_seat` VALUES (156, 5, 16, '4413141101#03#06', 0, 3, 6, 1);
INSERT INTO `movie_seat` VALUES (157, 5, 17, '4413141101#03#07', 0, 3, 7, 1);
INSERT INTO `movie_seat` VALUES (158, 5, 18, '4413141101#03#08', 0, 3, 8, 1);
INSERT INTO `movie_seat` VALUES (159, 5, 19, '4413141101#03#09', 0, 3, 9, 1);
INSERT INTO `movie_seat` VALUES (160, 5, 20, '4413141101#03#10', 0, 3, 10, 1);
INSERT INTO `movie_seat` VALUES (161, 5, 21, '4413141101#03#11', 0, 3, 11, 1);
INSERT INTO `movie_seat` VALUES (162, 5, 22, '4413141101#03#12', 0, 3, 12, 1);
INSERT INTO `movie_seat` VALUES (163, 5, 23, '4413141101#03#13', 0, 3, 13, 1);
INSERT INTO `movie_seat` VALUES (164, 5, 24, '4413141101#03#14', 0, 3, 14, 1);
INSERT INTO `movie_seat` VALUES (165, 5, 25, '4413141101#03#15', 0, 3, 15, 1);
INSERT INTO `movie_seat` VALUES (166, 6, 11, '4413141101#04#01', 0, 4, 1, 1);
INSERT INTO `movie_seat` VALUES (167, 6, 12, '4413141101#04#02', 0, 4, 2, 1);
INSERT INTO `movie_seat` VALUES (168, 6, 13, '4413141101#04#03', 0, 4, 3, 1);
INSERT INTO `movie_seat` VALUES (169, 6, 14, '4413141101#04#04', 0, 4, 4, 1);
INSERT INTO `movie_seat` VALUES (170, 6, 15, '4413141101#04#05', 0, 4, 5, 1);
INSERT INTO `movie_seat` VALUES (171, 6, 16, '4413141101#04#06', 0, 4, 6, 1);
INSERT INTO `movie_seat` VALUES (172, 6, 17, '4413141101#04#07', 0, 4, 7, 1);
INSERT INTO `movie_seat` VALUES (173, 6, 18, '4413141101#04#08', 0, 4, 8, 1);
INSERT INTO `movie_seat` VALUES (174, 6, 19, '4413141101#04#09', 0, 4, 9, 1);
INSERT INTO `movie_seat` VALUES (175, 6, 20, '4413141101#04#10', 0, 4, 10, 1);
INSERT INTO `movie_seat` VALUES (176, 6, 21, '4413141101#04#11', 0, 4, 11, 1);
INSERT INTO `movie_seat` VALUES (177, 6, 22, '4413141101#04#12', 0, 4, 12, 1);
INSERT INTO `movie_seat` VALUES (178, 6, 23, '4413141101#04#13', 0, 4, 13, 1);
INSERT INTO `movie_seat` VALUES (179, 6, 24, '4413141101#04#14', 0, 4, 14, 1);
INSERT INTO `movie_seat` VALUES (180, 6, 25, '4413141101#04#15', 0, 4, 15, 1);
INSERT INTO `movie_seat` VALUES (181, 7, 11, '4413141101#05#01', 0, 5, 1, 1);
INSERT INTO `movie_seat` VALUES (182, 7, 12, '4413141101#05#02', 0, 5, 2, 1);
INSERT INTO `movie_seat` VALUES (183, 7, 13, '4413141101#05#03', 0, 5, 3, 1);
INSERT INTO `movie_seat` VALUES (184, 7, 14, '4413141101#05#04', 0, 5, 4, 1);
INSERT INTO `movie_seat` VALUES (185, 7, 15, '4413141101#05#05', 0, 5, 5, 1);
INSERT INTO `movie_seat` VALUES (186, 7, 16, '4413141101#05#06', 0, 5, 6, 1);
INSERT INTO `movie_seat` VALUES (187, 7, 17, '4413141101#05#07', 0, 5, 7, 1);
INSERT INTO `movie_seat` VALUES (188, 7, 18, '4413141101#05#08', 0, 5, 8, 1);
INSERT INTO `movie_seat` VALUES (189, 7, 19, '4413141101#05#09', 0, 5, 9, 1);
INSERT INTO `movie_seat` VALUES (190, 7, 20, '4413141101#05#10', 0, 5, 10, 1);
INSERT INTO `movie_seat` VALUES (191, 7, 21, '4413141101#05#11', 0, 5, 11, 1);
INSERT INTO `movie_seat` VALUES (192, 7, 22, '4413141101#05#12', 0, 5, 12, 1);
INSERT INTO `movie_seat` VALUES (193, 7, 23, '4413141101#05#13', 0, 5, 13, 1);
INSERT INTO `movie_seat` VALUES (194, 7, 24, '4413141101#05#14', 0, 5, 14, 1);
INSERT INTO `movie_seat` VALUES (195, 7, 25, '4413141101#05#15', 0, 5, 15, 1);
INSERT INTO `movie_seat` VALUES (196, 8, 11, '4413141101#06#01', 0, 6, 1, 1);
INSERT INTO `movie_seat` VALUES (197, 8, 12, '4413141101#06#02', 0, 6, 2, 1);
INSERT INTO `movie_seat` VALUES (198, 8, 13, '4413141101#06#03', 0, 6, 3, 1);
INSERT INTO `movie_seat` VALUES (199, 8, 14, '4413141101#06#04', 0, 6, 4, 1);
INSERT INTO `movie_seat` VALUES (200, 8, 15, '4413141101#06#05', 0, 6, 5, 1);
INSERT INTO `movie_seat` VALUES (201, 8, 16, '4413141101#06#06', 0, 6, 6, 1);
INSERT INTO `movie_seat` VALUES (202, 8, 17, '4413141101#06#07', 0, 6, 7, 1);
INSERT INTO `movie_seat` VALUES (203, 8, 18, '4413141101#06#08', 0, 6, 8, 1);
INSERT INTO `movie_seat` VALUES (204, 8, 19, '4413141101#06#09', 0, 6, 9, 1);
INSERT INTO `movie_seat` VALUES (205, 8, 20, '4413141101#06#10', 0, 6, 10, 1);
INSERT INTO `movie_seat` VALUES (206, 8, 21, '4413141101#06#11', 0, 6, 11, 1);
INSERT INTO `movie_seat` VALUES (207, 8, 22, '4413141101#06#12', 0, 6, 12, 1);
INSERT INTO `movie_seat` VALUES (208, 8, 23, '4413141101#06#13', 0, 6, 13, 1);
INSERT INTO `movie_seat` VALUES (209, 8, 24, '4413141101#06#14', 0, 6, 14, 1);
INSERT INTO `movie_seat` VALUES (210, 8, 25, '4413141101#06#15', 0, 6, 15, 1);
INSERT INTO `movie_seat` VALUES (211, 9, 11, '4413141101#07#01', 0, 7, 1, 1);
INSERT INTO `movie_seat` VALUES (212, 9, 12, '4413141101#07#02', 0, 7, 2, 1);
INSERT INTO `movie_seat` VALUES (213, 9, 13, '4413141101#07#03', 0, 7, 3, 1);
INSERT INTO `movie_seat` VALUES (214, 9, 14, '4413141101#07#04', 0, 7, 4, 1);
INSERT INTO `movie_seat` VALUES (215, 9, 15, '4413141101#07#05', 0, 7, 5, 1);
INSERT INTO `movie_seat` VALUES (216, 9, 16, '4413141101#07#06', 0, 7, 6, 1);
INSERT INTO `movie_seat` VALUES (217, 9, 17, '4413141101#07#07', 0, 7, 7, 1);
INSERT INTO `movie_seat` VALUES (218, 9, 18, '4413141101#07#08', 0, 7, 8, 1);
INSERT INTO `movie_seat` VALUES (219, 9, 19, '4413141101#07#09', 0, 7, 9, 1);
INSERT INTO `movie_seat` VALUES (220, 9, 20, '4413141101#07#10', 0, 7, 10, 1);
INSERT INTO `movie_seat` VALUES (221, 9, 21, '4413141101#07#11', 0, 7, 11, 1);
INSERT INTO `movie_seat` VALUES (222, 9, 22, '4413141101#07#12', 0, 7, 12, 1);
INSERT INTO `movie_seat` VALUES (223, 9, 23, '4413141101#07#13', 0, 7, 13, 1);
INSERT INTO `movie_seat` VALUES (224, 9, 24, '4413141101#07#14', 0, 7, 14, 1);
INSERT INTO `movie_seat` VALUES (225, 9, 25, '4413141101#07#15', 0, 7, 15, 1);
INSERT INTO `movie_seat` VALUES (226, 10, 11, '4413141101#08#01', 0, 8, 1, 1);
INSERT INTO `movie_seat` VALUES (227, 10, 12, '4413141101#08#02', 0, 8, 2, 1);
INSERT INTO `movie_seat` VALUES (228, 10, 13, '4413141101#08#03', 0, 8, 3, 1);
INSERT INTO `movie_seat` VALUES (229, 10, 14, '4413141101#08#04', 0, 8, 4, 1);
INSERT INTO `movie_seat` VALUES (230, 10, 15, '4413141101#08#05', 0, 8, 5, 1);
INSERT INTO `movie_seat` VALUES (231, 10, 16, '4413141101#08#06', 0, 8, 6, 1);
INSERT INTO `movie_seat` VALUES (232, 10, 17, '4413141101#08#07', 0, 8, 7, 1);
INSERT INTO `movie_seat` VALUES (233, 10, 18, '4413141101#08#08', 0, 8, 8, 1);
INSERT INTO `movie_seat` VALUES (234, 10, 19, '4413141101#08#09', 0, 8, 9, 1);
INSERT INTO `movie_seat` VALUES (235, 10, 20, '4413141101#08#10', 0, 8, 10, 1);
INSERT INTO `movie_seat` VALUES (236, 10, 21, '4413141101#08#11', 0, 8, 11, 1);
INSERT INTO `movie_seat` VALUES (237, 10, 22, '4413141101#08#12', 0, 8, 12, 1);
INSERT INTO `movie_seat` VALUES (238, 10, 23, '4413141101#08#13', 0, 8, 13, 1);
INSERT INTO `movie_seat` VALUES (239, 10, 24, '4413141101#08#14', 0, 8, 14, 1);
INSERT INTO `movie_seat` VALUES (240, 10, 25, '4413141101#08#15', 0, 8, 15, 1);
INSERT INTO `movie_seat` VALUES (241, 3, 11, '4413141101#01#01', 0, 1, 1, 1);
INSERT INTO `movie_seat` VALUES (242, 3, 12, '4413141101#01#02', 0, 1, 2, 1);
INSERT INTO `movie_seat` VALUES (243, 3, 13, '4413141101#01#03', 0, 1, 3, 1);
INSERT INTO `movie_seat` VALUES (244, 3, 14, '4413141101#01#04', 0, 1, 4, 1);
INSERT INTO `movie_seat` VALUES (245, 3, 15, '4413141101#01#05', 0, 1, 5, 1);
INSERT INTO `movie_seat` VALUES (246, 3, 16, '4413141101#01#06', 0, 1, 6, 1);
INSERT INTO `movie_seat` VALUES (247, 3, 17, '4413141101#01#07', 0, 1, 7, 1);
INSERT INTO `movie_seat` VALUES (248, 3, 18, '4413141101#01#08', 0, 1, 8, 1);
INSERT INTO `movie_seat` VALUES (249, 3, 19, '4413141101#01#09', 0, 1, 9, 1);
INSERT INTO `movie_seat` VALUES (250, 3, 20, '4413141101#01#10', 0, 1, 10, 1);
INSERT INTO `movie_seat` VALUES (251, 3, 21, '4413141101#01#11', 0, 1, 11, 1);
INSERT INTO `movie_seat` VALUES (252, 3, 22, '4413141101#01#12', 0, 1, 12, 1);
INSERT INTO `movie_seat` VALUES (253, 3, 23, '4413141101#01#13', 0, 1, 13, 1);
INSERT INTO `movie_seat` VALUES (254, 3, 24, '4413141101#01#14', 0, 1, 14, 1);
INSERT INTO `movie_seat` VALUES (255, 3, 25, '4413141101#01#15', 0, 1, 15, 1);
INSERT INTO `movie_seat` VALUES (256, 4, 11, '4413141101#02#01', 0, 2, 1, 1);
INSERT INTO `movie_seat` VALUES (257, 4, 12, '4413141101#02#02', 0, 2, 2, 1);
INSERT INTO `movie_seat` VALUES (258, 4, 13, '4413141101#02#03', 0, 2, 3, 1);
INSERT INTO `movie_seat` VALUES (259, 4, 14, '4413141101#02#04', 0, 2, 4, 1);
INSERT INTO `movie_seat` VALUES (260, 4, 15, '4413141101#02#05', 0, 2, 5, 1);
INSERT INTO `movie_seat` VALUES (261, 4, 16, '4413141101#02#06', 0, 2, 6, 1);
INSERT INTO `movie_seat` VALUES (262, 4, 17, '4413141101#02#07', 0, 2, 7, 1);
INSERT INTO `movie_seat` VALUES (263, 4, 18, '4413141101#02#08', 0, 2, 8, 1);
INSERT INTO `movie_seat` VALUES (264, 4, 19, '4413141101#02#09', 0, 2, 9, 1);
INSERT INTO `movie_seat` VALUES (265, 4, 20, '4413141101#02#10', 0, 2, 10, 1);
INSERT INTO `movie_seat` VALUES (266, 4, 21, '4413141101#02#11', 0, 2, 11, 1);
INSERT INTO `movie_seat` VALUES (267, 4, 22, '4413141101#02#12', 0, 2, 12, 1);
INSERT INTO `movie_seat` VALUES (268, 4, 23, '4413141101#02#13', 0, 2, 13, 1);
INSERT INTO `movie_seat` VALUES (269, 4, 24, '4413141101#02#14', 0, 2, 14, 1);
INSERT INTO `movie_seat` VALUES (270, 4, 25, '4413141101#02#15', 0, 2, 15, 1);
INSERT INTO `movie_seat` VALUES (271, 5, 11, '4413141101#03#01', 0, 3, 1, 1);
INSERT INTO `movie_seat` VALUES (272, 5, 12, '4413141101#03#02', 0, 3, 2, 1);
INSERT INTO `movie_seat` VALUES (273, 5, 13, '4413141101#03#03', 0, 3, 3, 1);
INSERT INTO `movie_seat` VALUES (274, 5, 14, '4413141101#03#04', 0, 3, 4, 1);
INSERT INTO `movie_seat` VALUES (275, 5, 15, '4413141101#03#05', 0, 3, 5, 1);
INSERT INTO `movie_seat` VALUES (276, 5, 16, '4413141101#03#06', 0, 3, 6, 1);
INSERT INTO `movie_seat` VALUES (277, 5, 17, '4413141101#03#07', 0, 3, 7, 1);
INSERT INTO `movie_seat` VALUES (278, 5, 18, '4413141101#03#08', 0, 3, 8, 1);
INSERT INTO `movie_seat` VALUES (279, 5, 19, '4413141101#03#09', 0, 3, 9, 1);
INSERT INTO `movie_seat` VALUES (280, 5, 20, '4413141101#03#10', 0, 3, 10, 1);
INSERT INTO `movie_seat` VALUES (281, 5, 21, '4413141101#03#11', 0, 3, 11, 1);
INSERT INTO `movie_seat` VALUES (282, 5, 22, '4413141101#03#12', 0, 3, 12, 1);
INSERT INTO `movie_seat` VALUES (283, 5, 23, '4413141101#03#13', 0, 3, 13, 1);
INSERT INTO `movie_seat` VALUES (284, 5, 24, '4413141101#03#14', 0, 3, 14, 1);
INSERT INTO `movie_seat` VALUES (285, 5, 25, '4413141101#03#15', 0, 3, 15, 1);
INSERT INTO `movie_seat` VALUES (286, 6, 11, '4413141101#04#01', 0, 4, 1, 1);
INSERT INTO `movie_seat` VALUES (287, 6, 12, '4413141101#04#02', 0, 4, 2, 1);
INSERT INTO `movie_seat` VALUES (288, 6, 13, '4413141101#04#03', 0, 4, 3, 1);
INSERT INTO `movie_seat` VALUES (289, 6, 14, '4413141101#04#04', 0, 4, 4, 1);
INSERT INTO `movie_seat` VALUES (290, 6, 15, '4413141101#04#05', 0, 4, 5, 1);
INSERT INTO `movie_seat` VALUES (291, 6, 16, '4413141101#04#06', 0, 4, 6, 1);
INSERT INTO `movie_seat` VALUES (292, 6, 17, '4413141101#04#07', 0, 4, 7, 1);
INSERT INTO `movie_seat` VALUES (293, 6, 18, '4413141101#04#08', 0, 4, 8, 1);
INSERT INTO `movie_seat` VALUES (294, 6, 19, '4413141101#04#09', 0, 4, 9, 1);
INSERT INTO `movie_seat` VALUES (295, 6, 20, '4413141101#04#10', 0, 4, 10, 1);
INSERT INTO `movie_seat` VALUES (296, 6, 21, '4413141101#04#11', 0, 4, 11, 1);
INSERT INTO `movie_seat` VALUES (297, 6, 22, '4413141101#04#12', 0, 4, 12, 1);
INSERT INTO `movie_seat` VALUES (298, 6, 23, '4413141101#04#13', 0, 4, 13, 1);
INSERT INTO `movie_seat` VALUES (299, 6, 24, '4413141101#04#14', 0, 4, 14, 1);
INSERT INTO `movie_seat` VALUES (300, 6, 25, '4413141101#04#15', 0, 4, 15, 1);
INSERT INTO `movie_seat` VALUES (301, 7, 11, '4413141101#05#01', 0, 5, 1, 1);
INSERT INTO `movie_seat` VALUES (302, 7, 12, '4413141101#05#02', 0, 5, 2, 1);
INSERT INTO `movie_seat` VALUES (303, 7, 13, '4413141101#05#03', 0, 5, 3, 1);
INSERT INTO `movie_seat` VALUES (304, 7, 14, '4413141101#05#04', 0, 5, 4, 1);
INSERT INTO `movie_seat` VALUES (305, 7, 15, '4413141101#05#05', 0, 5, 5, 1);
INSERT INTO `movie_seat` VALUES (306, 7, 16, '4413141101#05#06', 0, 5, 6, 1);
INSERT INTO `movie_seat` VALUES (307, 7, 17, '4413141101#05#07', 0, 5, 7, 1);
INSERT INTO `movie_seat` VALUES (308, 7, 18, '4413141101#05#08', 0, 5, 8, 1);
INSERT INTO `movie_seat` VALUES (309, 7, 19, '4413141101#05#09', 0, 5, 9, 1);
INSERT INTO `movie_seat` VALUES (310, 7, 20, '4413141101#05#10', 0, 5, 10, 1);
INSERT INTO `movie_seat` VALUES (311, 7, 21, '4413141101#05#11', 0, 5, 11, 1);
INSERT INTO `movie_seat` VALUES (312, 7, 22, '4413141101#05#12', 0, 5, 12, 1);
INSERT INTO `movie_seat` VALUES (313, 7, 23, '4413141101#05#13', 0, 5, 13, 1);
INSERT INTO `movie_seat` VALUES (314, 7, 24, '4413141101#05#14', 0, 5, 14, 1);
INSERT INTO `movie_seat` VALUES (315, 7, 25, '4413141101#05#15', 0, 5, 15, 1);
INSERT INTO `movie_seat` VALUES (316, 8, 11, '4413141101#06#01', 0, 6, 1, 1);
INSERT INTO `movie_seat` VALUES (317, 8, 12, '4413141101#06#02', 0, 6, 2, 1);
INSERT INTO `movie_seat` VALUES (318, 8, 13, '4413141101#06#03', 0, 6, 3, 1);
INSERT INTO `movie_seat` VALUES (319, 8, 14, '4413141101#06#04', 0, 6, 4, 1);
INSERT INTO `movie_seat` VALUES (320, 8, 15, '4413141101#06#05', 0, 6, 5, 1);
INSERT INTO `movie_seat` VALUES (321, 8, 16, '4413141101#06#06', 0, 6, 6, 1);
INSERT INTO `movie_seat` VALUES (322, 8, 17, '4413141101#06#07', 0, 6, 7, 1);
INSERT INTO `movie_seat` VALUES (323, 8, 18, '4413141101#06#08', 0, 6, 8, 1);
INSERT INTO `movie_seat` VALUES (324, 8, 19, '4413141101#06#09', 0, 6, 9, 1);
INSERT INTO `movie_seat` VALUES (325, 8, 20, '4413141101#06#10', 0, 6, 10, 1);
INSERT INTO `movie_seat` VALUES (326, 8, 21, '4413141101#06#11', 0, 6, 11, 1);
INSERT INTO `movie_seat` VALUES (327, 8, 22, '4413141101#06#12', 0, 6, 12, 1);
INSERT INTO `movie_seat` VALUES (328, 8, 23, '4413141101#06#13', 0, 6, 13, 1);
INSERT INTO `movie_seat` VALUES (329, 8, 24, '4413141101#06#14', 0, 6, 14, 1);
INSERT INTO `movie_seat` VALUES (330, 8, 25, '4413141101#06#15', 0, 6, 15, 1);
INSERT INTO `movie_seat` VALUES (331, 9, 11, '4413141101#07#01', 0, 7, 1, 1);
INSERT INTO `movie_seat` VALUES (332, 9, 12, '4413141101#07#02', 0, 7, 2, 1);
INSERT INTO `movie_seat` VALUES (333, 9, 13, '4413141101#07#03', 0, 7, 3, 1);
INSERT INTO `movie_seat` VALUES (334, 9, 14, '4413141101#07#04', 0, 7, 4, 1);
INSERT INTO `movie_seat` VALUES (335, 9, 15, '4413141101#07#05', 0, 7, 5, 1);
INSERT INTO `movie_seat` VALUES (336, 9, 16, '4413141101#07#06', 0, 7, 6, 1);
INSERT INTO `movie_seat` VALUES (337, 9, 17, '4413141101#07#07', 0, 7, 7, 1);
INSERT INTO `movie_seat` VALUES (338, 9, 18, '4413141101#07#08', 0, 7, 8, 1);
INSERT INTO `movie_seat` VALUES (339, 9, 19, '4413141101#07#09', 0, 7, 9, 1);
INSERT INTO `movie_seat` VALUES (340, 9, 20, '4413141101#07#10', 0, 7, 10, 1);
INSERT INTO `movie_seat` VALUES (341, 9, 21, '4413141101#07#11', 0, 7, 11, 1);
INSERT INTO `movie_seat` VALUES (342, 9, 22, '4413141101#07#12', 0, 7, 12, 1);
INSERT INTO `movie_seat` VALUES (343, 9, 23, '4413141101#07#13', 0, 7, 13, 1);
INSERT INTO `movie_seat` VALUES (344, 9, 24, '4413141101#07#14', 0, 7, 14, 1);
INSERT INTO `movie_seat` VALUES (345, 9, 25, '4413141101#07#15', 0, 7, 15, 1);
INSERT INTO `movie_seat` VALUES (346, 10, 11, '4413141101#08#01', 0, 8, 1, 1);
INSERT INTO `movie_seat` VALUES (347, 10, 12, '4413141101#08#02', 0, 8, 2, 1);
INSERT INTO `movie_seat` VALUES (348, 10, 13, '4413141101#08#03', 0, 8, 3, 1);
INSERT INTO `movie_seat` VALUES (349, 10, 14, '4413141101#08#04', 0, 8, 4, 1);
INSERT INTO `movie_seat` VALUES (350, 10, 15, '4413141101#08#05', 0, 8, 5, 1);
INSERT INTO `movie_seat` VALUES (351, 10, 16, '4413141101#08#06', 0, 8, 6, 1);
INSERT INTO `movie_seat` VALUES (352, 10, 17, '4413141101#08#07', 0, 8, 7, 1);
INSERT INTO `movie_seat` VALUES (353, 10, 18, '4413141101#08#08', 0, 8, 8, 1);
INSERT INTO `movie_seat` VALUES (354, 10, 19, '4413141101#08#09', 0, 8, 9, 1);
INSERT INTO `movie_seat` VALUES (355, 10, 20, '4413141101#08#10', 0, 8, 10, 1);
INSERT INTO `movie_seat` VALUES (356, 10, 21, '4413141101#08#11', 0, 8, 11, 1);
INSERT INTO `movie_seat` VALUES (357, 10, 22, '4413141101#08#12', 0, 8, 12, 1);
INSERT INTO `movie_seat` VALUES (358, 10, 23, '4413141101#08#13', 0, 8, 13, 1);
INSERT INTO `movie_seat` VALUES (359, 10, 24, '4413141101#08#14', 0, 8, 14, 1);
INSERT INTO `movie_seat` VALUES (360, 10, 25, '4413141101#08#15', 0, 8, 15, 1);
INSERT INTO `movie_seat` VALUES (361, 3, 11, '4413141101#01#01', 0, 1, 1, 1);
INSERT INTO `movie_seat` VALUES (362, 3, 12, '4413141101#01#02', 0, 1, 2, 1);
INSERT INTO `movie_seat` VALUES (363, 3, 13, '4413141101#01#03', 0, 1, 3, 1);
INSERT INTO `movie_seat` VALUES (364, 3, 14, '4413141101#01#04', 0, 1, 4, 1);
INSERT INTO `movie_seat` VALUES (365, 3, 15, '4413141101#01#05', 0, 1, 5, 1);
INSERT INTO `movie_seat` VALUES (366, 3, 16, '4413141101#01#06', 0, 1, 6, 1);
INSERT INTO `movie_seat` VALUES (367, 3, 17, '4413141101#01#07', 0, 1, 7, 1);
INSERT INTO `movie_seat` VALUES (368, 3, 18, '4413141101#01#08', 0, 1, 8, 1);
INSERT INTO `movie_seat` VALUES (369, 3, 19, '4413141101#01#09', 0, 1, 9, 1);
INSERT INTO `movie_seat` VALUES (370, 3, 20, '4413141101#01#10', 0, 1, 10, 1);
INSERT INTO `movie_seat` VALUES (371, 3, 21, '4413141101#01#11', 0, 1, 11, 1);
INSERT INTO `movie_seat` VALUES (372, 3, 22, '4413141101#01#12', 0, 1, 12, 1);
INSERT INTO `movie_seat` VALUES (373, 3, 23, '4413141101#01#13', 0, 1, 13, 1);
INSERT INTO `movie_seat` VALUES (374, 3, 24, '4413141101#01#14', 0, 1, 14, 1);
INSERT INTO `movie_seat` VALUES (375, 3, 25, '4413141101#01#15', 0, 1, 15, 1);
INSERT INTO `movie_seat` VALUES (376, 4, 11, '4413141101#02#01', 0, 2, 1, 1);
INSERT INTO `movie_seat` VALUES (377, 4, 12, '4413141101#02#02', 0, 2, 2, 1);
INSERT INTO `movie_seat` VALUES (378, 4, 13, '4413141101#02#03', 0, 2, 3, 1);
INSERT INTO `movie_seat` VALUES (379, 4, 14, '4413141101#02#04', 0, 2, 4, 1);
INSERT INTO `movie_seat` VALUES (380, 4, 15, '4413141101#02#05', 0, 2, 5, 1);
INSERT INTO `movie_seat` VALUES (381, 4, 16, '4413141101#02#06', 0, 2, 6, 1);
INSERT INTO `movie_seat` VALUES (382, 4, 17, '4413141101#02#07', 0, 2, 7, 1);
INSERT INTO `movie_seat` VALUES (383, 4, 18, '4413141101#02#08', 0, 2, 8, 1);
INSERT INTO `movie_seat` VALUES (384, 4, 19, '4413141101#02#09', 0, 2, 9, 1);
INSERT INTO `movie_seat` VALUES (385, 4, 20, '4413141101#02#10', 0, 2, 10, 1);
INSERT INTO `movie_seat` VALUES (386, 4, 21, '4413141101#02#11', 0, 2, 11, 1);
INSERT INTO `movie_seat` VALUES (387, 4, 22, '4413141101#02#12', 0, 2, 12, 1);
INSERT INTO `movie_seat` VALUES (388, 4, 23, '4413141101#02#13', 0, 2, 13, 1);
INSERT INTO `movie_seat` VALUES (389, 4, 24, '4413141101#02#14', 0, 2, 14, 1);
INSERT INTO `movie_seat` VALUES (390, 4, 25, '4413141101#02#15', 0, 2, 15, 1);
INSERT INTO `movie_seat` VALUES (391, 5, 11, '4413141101#03#01', 0, 3, 1, 1);
INSERT INTO `movie_seat` VALUES (392, 5, 12, '4413141101#03#02', 0, 3, 2, 1);
INSERT INTO `movie_seat` VALUES (393, 5, 13, '4413141101#03#03', 0, 3, 3, 1);
INSERT INTO `movie_seat` VALUES (394, 5, 14, '4413141101#03#04', 0, 3, 4, 1);
INSERT INTO `movie_seat` VALUES (395, 5, 15, '4413141101#03#05', 0, 3, 5, 1);
INSERT INTO `movie_seat` VALUES (396, 5, 16, '4413141101#03#06', 0, 3, 6, 1);
INSERT INTO `movie_seat` VALUES (397, 5, 17, '4413141101#03#07', 0, 3, 7, 1);
INSERT INTO `movie_seat` VALUES (398, 5, 18, '4413141101#03#08', 0, 3, 8, 1);
INSERT INTO `movie_seat` VALUES (399, 5, 19, '4413141101#03#09', 0, 3, 9, 1);
INSERT INTO `movie_seat` VALUES (400, 5, 20, '4413141101#03#10', 0, 3, 10, 1);
INSERT INTO `movie_seat` VALUES (401, 5, 21, '4413141101#03#11', 0, 3, 11, 1);
INSERT INTO `movie_seat` VALUES (402, 5, 22, '4413141101#03#12', 0, 3, 12, 1);
INSERT INTO `movie_seat` VALUES (403, 5, 23, '4413141101#03#13', 0, 3, 13, 1);
INSERT INTO `movie_seat` VALUES (404, 5, 24, '4413141101#03#14', 0, 3, 14, 1);
INSERT INTO `movie_seat` VALUES (405, 5, 25, '4413141101#03#15', 0, 3, 15, 1);
INSERT INTO `movie_seat` VALUES (406, 6, 11, '4413141101#04#01', 0, 4, 1, 1);
INSERT INTO `movie_seat` VALUES (407, 6, 12, '4413141101#04#02', 0, 4, 2, 1);
INSERT INTO `movie_seat` VALUES (408, 6, 13, '4413141101#04#03', 0, 4, 3, 1);
INSERT INTO `movie_seat` VALUES (409, 6, 14, '4413141101#04#04', 0, 4, 4, 1);
INSERT INTO `movie_seat` VALUES (410, 6, 15, '4413141101#04#05', 0, 4, 5, 1);
INSERT INTO `movie_seat` VALUES (411, 6, 16, '4413141101#04#06', 0, 4, 6, 1);
INSERT INTO `movie_seat` VALUES (412, 6, 17, '4413141101#04#07', 0, 4, 7, 1);
INSERT INTO `movie_seat` VALUES (413, 6, 18, '4413141101#04#08', 0, 4, 8, 1);
INSERT INTO `movie_seat` VALUES (414, 6, 19, '4413141101#04#09', 0, 4, 9, 1);
INSERT INTO `movie_seat` VALUES (415, 6, 20, '4413141101#04#10', 0, 4, 10, 1);
INSERT INTO `movie_seat` VALUES (416, 6, 21, '4413141101#04#11', 0, 4, 11, 1);
INSERT INTO `movie_seat` VALUES (417, 6, 22, '4413141101#04#12', 0, 4, 12, 1);
INSERT INTO `movie_seat` VALUES (418, 6, 23, '4413141101#04#13', 0, 4, 13, 1);
INSERT INTO `movie_seat` VALUES (419, 6, 24, '4413141101#04#14', 0, 4, 14, 1);
INSERT INTO `movie_seat` VALUES (420, 6, 25, '4413141101#04#15', 0, 4, 15, 1);
INSERT INTO `movie_seat` VALUES (421, 7, 11, '4413141101#05#01', 0, 5, 1, 1);
INSERT INTO `movie_seat` VALUES (422, 7, 12, '4413141101#05#02', 0, 5, 2, 1);
INSERT INTO `movie_seat` VALUES (423, 7, 13, '4413141101#05#03', 0, 5, 3, 1);
INSERT INTO `movie_seat` VALUES (424, 7, 14, '4413141101#05#04', 0, 5, 4, 1);
INSERT INTO `movie_seat` VALUES (425, 7, 15, '4413141101#05#05', 0, 5, 5, 1);
INSERT INTO `movie_seat` VALUES (426, 7, 16, '4413141101#05#06', 0, 5, 6, 1);
INSERT INTO `movie_seat` VALUES (427, 7, 17, '4413141101#05#07', 0, 5, 7, 1);
INSERT INTO `movie_seat` VALUES (428, 7, 18, '4413141101#05#08', 0, 5, 8, 1);
INSERT INTO `movie_seat` VALUES (429, 7, 19, '4413141101#05#09', 0, 5, 9, 1);
INSERT INTO `movie_seat` VALUES (430, 7, 20, '4413141101#05#10', 0, 5, 10, 1);
INSERT INTO `movie_seat` VALUES (431, 7, 21, '4413141101#05#11', 0, 5, 11, 1);
INSERT INTO `movie_seat` VALUES (432, 7, 22, '4413141101#05#12', 0, 5, 12, 1);
INSERT INTO `movie_seat` VALUES (433, 7, 23, '4413141101#05#13', 0, 5, 13, 1);
INSERT INTO `movie_seat` VALUES (434, 7, 24, '4413141101#05#14', 0, 5, 14, 1);
INSERT INTO `movie_seat` VALUES (435, 7, 25, '4413141101#05#15', 0, 5, 15, 1);
INSERT INTO `movie_seat` VALUES (436, 8, 11, '4413141101#06#01', 0, 6, 1, 1);
INSERT INTO `movie_seat` VALUES (437, 8, 12, '4413141101#06#02', 0, 6, 2, 1);
INSERT INTO `movie_seat` VALUES (438, 8, 13, '4413141101#06#03', 0, 6, 3, 1);
INSERT INTO `movie_seat` VALUES (439, 8, 14, '4413141101#06#04', 0, 6, 4, 1);
INSERT INTO `movie_seat` VALUES (440, 8, 15, '4413141101#06#05', 0, 6, 5, 1);
INSERT INTO `movie_seat` VALUES (441, 8, 16, '4413141101#06#06', 0, 6, 6, 1);
INSERT INTO `movie_seat` VALUES (442, 8, 17, '4413141101#06#07', 0, 6, 7, 1);
INSERT INTO `movie_seat` VALUES (443, 8, 18, '4413141101#06#08', 0, 6, 8, 1);
INSERT INTO `movie_seat` VALUES (444, 8, 19, '4413141101#06#09', 0, 6, 9, 1);
INSERT INTO `movie_seat` VALUES (445, 8, 20, '4413141101#06#10', 0, 6, 10, 1);
INSERT INTO `movie_seat` VALUES (446, 8, 21, '4413141101#06#11', 0, 6, 11, 1);
INSERT INTO `movie_seat` VALUES (447, 8, 22, '4413141101#06#12', 0, 6, 12, 1);
INSERT INTO `movie_seat` VALUES (448, 8, 23, '4413141101#06#13', 0, 6, 13, 1);
INSERT INTO `movie_seat` VALUES (449, 8, 24, '4413141101#06#14', 0, 6, 14, 1);
INSERT INTO `movie_seat` VALUES (450, 8, 25, '4413141101#06#15', 0, 6, 15, 1);
INSERT INTO `movie_seat` VALUES (451, 9, 11, '4413141101#07#01', 0, 7, 1, 1);
INSERT INTO `movie_seat` VALUES (452, 9, 12, '4413141101#07#02', 0, 7, 2, 1);
INSERT INTO `movie_seat` VALUES (453, 9, 13, '4413141101#07#03', 0, 7, 3, 1);
INSERT INTO `movie_seat` VALUES (454, 9, 14, '4413141101#07#04', 0, 7, 4, 1);
INSERT INTO `movie_seat` VALUES (455, 9, 15, '4413141101#07#05', 0, 7, 5, 1);
INSERT INTO `movie_seat` VALUES (456, 9, 16, '4413141101#07#06', 0, 7, 6, 1);
INSERT INTO `movie_seat` VALUES (457, 9, 17, '4413141101#07#07', 0, 7, 7, 1);
INSERT INTO `movie_seat` VALUES (458, 9, 18, '4413141101#07#08', 0, 7, 8, 1);
INSERT INTO `movie_seat` VALUES (459, 9, 19, '4413141101#07#09', 0, 7, 9, 1);
INSERT INTO `movie_seat` VALUES (460, 9, 20, '4413141101#07#10', 0, 7, 10, 1);
INSERT INTO `movie_seat` VALUES (461, 9, 21, '4413141101#07#11', 0, 7, 11, 1);
INSERT INTO `movie_seat` VALUES (462, 9, 22, '4413141101#07#12', 0, 7, 12, 1);
INSERT INTO `movie_seat` VALUES (463, 9, 23, '4413141101#07#13', 0, 7, 13, 1);
INSERT INTO `movie_seat` VALUES (464, 9, 24, '4413141101#07#14', 0, 7, 14, 1);
INSERT INTO `movie_seat` VALUES (465, 9, 25, '4413141101#07#15', 0, 7, 15, 1);
INSERT INTO `movie_seat` VALUES (466, 10, 11, '4413141101#08#01', 0, 8, 1, 1);
INSERT INTO `movie_seat` VALUES (467, 10, 12, '4413141101#08#02', 0, 8, 2, 1);
INSERT INTO `movie_seat` VALUES (468, 10, 13, '4413141101#08#03', 0, 8, 3, 1);
INSERT INTO `movie_seat` VALUES (469, 10, 14, '4413141101#08#04', 0, 8, 4, 1);
INSERT INTO `movie_seat` VALUES (470, 10, 15, '4413141101#08#05', 0, 8, 5, 1);
INSERT INTO `movie_seat` VALUES (471, 10, 16, '4413141101#08#06', 0, 8, 6, 1);
INSERT INTO `movie_seat` VALUES (472, 10, 17, '4413141101#08#07', 0, 8, 7, 1);
INSERT INTO `movie_seat` VALUES (473, 10, 18, '4413141101#08#08', 0, 8, 8, 1);
INSERT INTO `movie_seat` VALUES (474, 10, 19, '4413141101#08#09', 0, 8, 9, 1);
INSERT INTO `movie_seat` VALUES (475, 10, 20, '4413141101#08#10', 0, 8, 10, 1);
INSERT INTO `movie_seat` VALUES (476, 10, 21, '4413141101#08#11', 0, 8, 11, 1);
INSERT INTO `movie_seat` VALUES (477, 10, 22, '4413141101#08#12', 0, 8, 12, 1);
INSERT INTO `movie_seat` VALUES (478, 10, 23, '4413141101#08#13', 0, 8, 13, 1);
INSERT INTO `movie_seat` VALUES (479, 10, 24, '4413141101#08#14', 0, 8, 14, 1);
INSERT INTO `movie_seat` VALUES (480, 10, 25, '4413141101#08#15', 0, 8, 15, 1);
INSERT INTO `movie_seat` VALUES (481, 3, 11, '4413141101#01#01', 0, 1, 1, 1);
INSERT INTO `movie_seat` VALUES (482, 3, 12, '4413141101#01#02', 0, 1, 2, 1);
INSERT INTO `movie_seat` VALUES (483, 3, 13, '4413141101#01#03', 0, 1, 3, 1);
INSERT INTO `movie_seat` VALUES (484, 3, 14, '4413141101#01#04', 0, 1, 4, 1);
INSERT INTO `movie_seat` VALUES (485, 3, 15, '4413141101#01#05', 0, 1, 5, 1);
INSERT INTO `movie_seat` VALUES (486, 3, 16, '4413141101#01#06', 0, 1, 6, 1);
INSERT INTO `movie_seat` VALUES (487, 3, 17, '4413141101#01#07', 0, 1, 7, 1);
INSERT INTO `movie_seat` VALUES (488, 3, 18, '4413141101#01#08', 0, 1, 8, 1);
INSERT INTO `movie_seat` VALUES (489, 3, 19, '4413141101#01#09', 0, 1, 9, 1);
INSERT INTO `movie_seat` VALUES (490, 3, 20, '4413141101#01#10', 0, 1, 10, 1);
INSERT INTO `movie_seat` VALUES (491, 3, 21, '4413141101#01#11', 0, 1, 11, 1);
INSERT INTO `movie_seat` VALUES (492, 3, 22, '4413141101#01#12', 0, 1, 12, 1);
INSERT INTO `movie_seat` VALUES (493, 3, 23, '4413141101#01#13', 0, 1, 13, 1);
INSERT INTO `movie_seat` VALUES (494, 3, 24, '4413141101#01#14', 0, 1, 14, 1);
INSERT INTO `movie_seat` VALUES (495, 3, 25, '4413141101#01#15', 0, 1, 15, 1);
INSERT INTO `movie_seat` VALUES (496, 4, 11, '4413141101#02#01', 0, 2, 1, 1);
INSERT INTO `movie_seat` VALUES (497, 4, 12, '4413141101#02#02', 0, 2, 2, 1);
INSERT INTO `movie_seat` VALUES (498, 4, 13, '4413141101#02#03', 0, 2, 3, 1);
INSERT INTO `movie_seat` VALUES (499, 4, 14, '4413141101#02#04', 0, 2, 4, 1);
INSERT INTO `movie_seat` VALUES (500, 4, 15, '4413141101#02#05', 0, 2, 5, 1);
INSERT INTO `movie_seat` VALUES (501, 4, 16, '4413141101#02#06', 0, 2, 6, 1);
INSERT INTO `movie_seat` VALUES (502, 4, 17, '4413141101#02#07', 0, 2, 7, 1);
INSERT INTO `movie_seat` VALUES (503, 4, 18, '4413141101#02#08', 0, 2, 8, 1);
INSERT INTO `movie_seat` VALUES (504, 4, 19, '4413141101#02#09', 0, 2, 9, 1);
INSERT INTO `movie_seat` VALUES (505, 4, 20, '4413141101#02#10', 0, 2, 10, 1);
INSERT INTO `movie_seat` VALUES (506, 4, 21, '4413141101#02#11', 0, 2, 11, 1);
INSERT INTO `movie_seat` VALUES (507, 4, 22, '4413141101#02#12', 0, 2, 12, 1);
INSERT INTO `movie_seat` VALUES (508, 4, 23, '4413141101#02#13', 0, 2, 13, 1);
INSERT INTO `movie_seat` VALUES (509, 4, 24, '4413141101#02#14', 0, 2, 14, 1);
INSERT INTO `movie_seat` VALUES (510, 4, 25, '4413141101#02#15', 0, 2, 15, 1);
INSERT INTO `movie_seat` VALUES (511, 5, 11, '4413141101#03#01', 0, 3, 1, 1);
INSERT INTO `movie_seat` VALUES (512, 5, 12, '4413141101#03#02', 0, 3, 2, 1);
INSERT INTO `movie_seat` VALUES (513, 5, 13, '4413141101#03#03', 0, 3, 3, 1);
INSERT INTO `movie_seat` VALUES (514, 5, 14, '4413141101#03#04', 0, 3, 4, 1);
INSERT INTO `movie_seat` VALUES (515, 5, 15, '4413141101#03#05', 0, 3, 5, 1);
INSERT INTO `movie_seat` VALUES (516, 5, 16, '4413141101#03#06', 0, 3, 6, 1);
INSERT INTO `movie_seat` VALUES (517, 5, 17, '4413141101#03#07', 0, 3, 7, 1);
INSERT INTO `movie_seat` VALUES (518, 5, 18, '4413141101#03#08', 0, 3, 8, 1);
INSERT INTO `movie_seat` VALUES (519, 5, 19, '4413141101#03#09', 0, 3, 9, 1);
INSERT INTO `movie_seat` VALUES (520, 5, 20, '4413141101#03#10', 0, 3, 10, 1);
INSERT INTO `movie_seat` VALUES (521, 5, 21, '4413141101#03#11', 0, 3, 11, 1);
INSERT INTO `movie_seat` VALUES (522, 5, 22, '4413141101#03#12', 0, 3, 12, 1);
INSERT INTO `movie_seat` VALUES (523, 5, 23, '4413141101#03#13', 0, 3, 13, 1);
INSERT INTO `movie_seat` VALUES (524, 5, 24, '4413141101#03#14', 0, 3, 14, 1);
INSERT INTO `movie_seat` VALUES (525, 5, 25, '4413141101#03#15', 0, 3, 15, 1);
INSERT INTO `movie_seat` VALUES (526, 6, 11, '4413141101#04#01', 0, 4, 1, 1);
INSERT INTO `movie_seat` VALUES (527, 6, 12, '4413141101#04#02', 0, 4, 2, 1);
INSERT INTO `movie_seat` VALUES (528, 6, 13, '4413141101#04#03', 0, 4, 3, 1);
INSERT INTO `movie_seat` VALUES (529, 6, 14, '4413141101#04#04', 0, 4, 4, 1);
INSERT INTO `movie_seat` VALUES (530, 6, 15, '4413141101#04#05', 0, 4, 5, 1);
INSERT INTO `movie_seat` VALUES (531, 6, 16, '4413141101#04#06', 0, 4, 6, 1);
INSERT INTO `movie_seat` VALUES (532, 6, 17, '4413141101#04#07', 0, 4, 7, 1);
INSERT INTO `movie_seat` VALUES (533, 6, 18, '4413141101#04#08', 0, 4, 8, 1);
INSERT INTO `movie_seat` VALUES (534, 6, 19, '4413141101#04#09', 0, 4, 9, 1);
INSERT INTO `movie_seat` VALUES (535, 6, 20, '4413141101#04#10', 0, 4, 10, 1);
INSERT INTO `movie_seat` VALUES (536, 6, 21, '4413141101#04#11', 0, 4, 11, 1);
INSERT INTO `movie_seat` VALUES (537, 6, 22, '4413141101#04#12', 0, 4, 12, 1);
INSERT INTO `movie_seat` VALUES (538, 6, 23, '4413141101#04#13', 0, 4, 13, 1);
INSERT INTO `movie_seat` VALUES (539, 6, 24, '4413141101#04#14', 0, 4, 14, 1);
INSERT INTO `movie_seat` VALUES (540, 6, 25, '4413141101#04#15', 0, 4, 15, 1);
INSERT INTO `movie_seat` VALUES (541, 7, 11, '4413141101#05#01', 0, 5, 1, 1);
INSERT INTO `movie_seat` VALUES (542, 7, 12, '4413141101#05#02', 0, 5, 2, 1);
INSERT INTO `movie_seat` VALUES (543, 7, 13, '4413141101#05#03', 0, 5, 3, 1);
INSERT INTO `movie_seat` VALUES (544, 7, 14, '4413141101#05#04', 0, 5, 4, 1);
INSERT INTO `movie_seat` VALUES (545, 7, 15, '4413141101#05#05', 0, 5, 5, 1);
INSERT INTO `movie_seat` VALUES (546, 7, 16, '4413141101#05#06', 0, 5, 6, 1);
INSERT INTO `movie_seat` VALUES (547, 7, 17, '4413141101#05#07', 0, 5, 7, 1);
INSERT INTO `movie_seat` VALUES (548, 7, 18, '4413141101#05#08', 0, 5, 8, 1);
INSERT INTO `movie_seat` VALUES (549, 7, 19, '4413141101#05#09', 0, 5, 9, 1);
INSERT INTO `movie_seat` VALUES (550, 7, 20, '4413141101#05#10', 0, 5, 10, 1);
INSERT INTO `movie_seat` VALUES (551, 7, 21, '4413141101#05#11', 0, 5, 11, 1);
INSERT INTO `movie_seat` VALUES (552, 7, 22, '4413141101#05#12', 0, 5, 12, 1);
INSERT INTO `movie_seat` VALUES (553, 7, 23, '4413141101#05#13', 0, 5, 13, 1);
INSERT INTO `movie_seat` VALUES (554, 7, 24, '4413141101#05#14', 0, 5, 14, 1);
INSERT INTO `movie_seat` VALUES (555, 7, 25, '4413141101#05#15', 0, 5, 15, 1);
INSERT INTO `movie_seat` VALUES (556, 8, 11, '4413141101#06#01', 0, 6, 1, 1);
INSERT INTO `movie_seat` VALUES (557, 8, 12, '4413141101#06#02', 0, 6, 2, 1);
INSERT INTO `movie_seat` VALUES (558, 8, 13, '4413141101#06#03', 0, 6, 3, 1);
INSERT INTO `movie_seat` VALUES (559, 8, 14, '4413141101#06#04', 0, 6, 4, 1);
INSERT INTO `movie_seat` VALUES (560, 8, 15, '4413141101#06#05', 0, 6, 5, 1);
INSERT INTO `movie_seat` VALUES (561, 8, 16, '4413141101#06#06', 0, 6, 6, 1);
INSERT INTO `movie_seat` VALUES (562, 8, 17, '4413141101#06#07', 0, 6, 7, 1);
INSERT INTO `movie_seat` VALUES (563, 8, 18, '4413141101#06#08', 0, 6, 8, 1);
INSERT INTO `movie_seat` VALUES (564, 8, 19, '4413141101#06#09', 0, 6, 9, 1);
INSERT INTO `movie_seat` VALUES (565, 8, 20, '4413141101#06#10', 0, 6, 10, 1);
INSERT INTO `movie_seat` VALUES (566, 8, 21, '4413141101#06#11', 0, 6, 11, 1);
INSERT INTO `movie_seat` VALUES (567, 8, 22, '4413141101#06#12', 0, 6, 12, 1);
INSERT INTO `movie_seat` VALUES (568, 8, 23, '4413141101#06#13', 0, 6, 13, 1);
INSERT INTO `movie_seat` VALUES (569, 8, 24, '4413141101#06#14', 0, 6, 14, 1);
INSERT INTO `movie_seat` VALUES (570, 8, 25, '4413141101#06#15', 0, 6, 15, 1);
INSERT INTO `movie_seat` VALUES (571, 9, 11, '4413141101#07#01', 0, 7, 1, 1);
INSERT INTO `movie_seat` VALUES (572, 9, 12, '4413141101#07#02', 0, 7, 2, 1);
INSERT INTO `movie_seat` VALUES (573, 9, 13, '4413141101#07#03', 0, 7, 3, 1);
INSERT INTO `movie_seat` VALUES (574, 9, 14, '4413141101#07#04', 0, 7, 4, 1);
INSERT INTO `movie_seat` VALUES (575, 9, 15, '4413141101#07#05', 0, 7, 5, 1);
INSERT INTO `movie_seat` VALUES (576, 9, 16, '4413141101#07#06', 0, 7, 6, 1);
INSERT INTO `movie_seat` VALUES (577, 9, 17, '4413141101#07#07', 0, 7, 7, 1);
INSERT INTO `movie_seat` VALUES (578, 9, 18, '4413141101#07#08', 0, 7, 8, 1);
INSERT INTO `movie_seat` VALUES (579, 9, 19, '4413141101#07#09', 0, 7, 9, 1);
INSERT INTO `movie_seat` VALUES (580, 9, 20, '4413141101#07#10', 0, 7, 10, 1);
INSERT INTO `movie_seat` VALUES (581, 9, 21, '4413141101#07#11', 0, 7, 11, 1);
INSERT INTO `movie_seat` VALUES (582, 9, 22, '4413141101#07#12', 0, 7, 12, 1);
INSERT INTO `movie_seat` VALUES (583, 9, 23, '4413141101#07#13', 0, 7, 13, 1);
INSERT INTO `movie_seat` VALUES (584, 9, 24, '4413141101#07#14', 0, 7, 14, 1);
INSERT INTO `movie_seat` VALUES (585, 9, 25, '4413141101#07#15', 0, 7, 15, 1);
INSERT INTO `movie_seat` VALUES (586, 10, 11, '4413141101#08#01', 0, 8, 1, 1);
INSERT INTO `movie_seat` VALUES (587, 10, 12, '4413141101#08#02', 0, 8, 2, 1);
INSERT INTO `movie_seat` VALUES (588, 10, 13, '4413141101#08#03', 0, 8, 3, 1);
INSERT INTO `movie_seat` VALUES (589, 10, 14, '4413141101#08#04', 0, 8, 4, 1);
INSERT INTO `movie_seat` VALUES (590, 10, 15, '4413141101#08#05', 0, 8, 5, 1);
INSERT INTO `movie_seat` VALUES (591, 10, 16, '4413141101#08#06', 0, 8, 6, 1);
INSERT INTO `movie_seat` VALUES (592, 10, 17, '4413141101#08#07', 0, 8, 7, 1);
INSERT INTO `movie_seat` VALUES (593, 10, 18, '4413141101#08#08', 0, 8, 8, 1);
INSERT INTO `movie_seat` VALUES (594, 10, 19, '4413141101#08#09', 0, 8, 9, 1);
INSERT INTO `movie_seat` VALUES (595, 10, 20, '4413141101#08#10', 0, 8, 10, 1);
INSERT INTO `movie_seat` VALUES (596, 10, 21, '4413141101#08#11', 0, 8, 11, 1);
INSERT INTO `movie_seat` VALUES (597, 10, 22, '4413141101#08#12', 0, 8, 12, 1);
INSERT INTO `movie_seat` VALUES (598, 10, 23, '4413141101#08#13', 0, 8, 13, 1);
INSERT INTO `movie_seat` VALUES (599, 10, 24, '4413141101#08#14', 0, 8, 14, 1);
INSERT INTO `movie_seat` VALUES (600, 10, 25, '4413141101#08#15', 0, 8, 15, 1);

-- ----------------------------
-- Table structure for movie_sessions
-- ----------------------------
DROP TABLE IF EXISTS `movie_sessions`;
CREATE TABLE `movie_sessions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NULL DEFAULT NULL COMMENT '电影名称id',
  `cid` int(11) NULL DEFAULT NULL COMMENT '电影院id',
  `playtime` date NULL DEFAULT NULL COMMENT '播放时间',
  `begintime` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `office_id` int(11) NULL DEFAULT NULL COMMENT '播放厅id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '票价',
  `seat` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '座位表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '场次信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_sessions
-- ----------------------------
INSERT INTO `movie_sessions` VALUES (1, 1, 1, '2020-06-22', '2020-06-22 14:00:00', '2020-06-22 15:30:00', 1, 39.00, '[[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[0,0,0,-1,0,2,2,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,2,2,0,0,0,-1,-1,0,2,2,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0]]');
INSERT INTO `movie_sessions` VALUES (4, 1, 5, '2020-06-22', '2020-06-22 10:00:00', '2020-06-22 11:30:00', 1, 29.00, '[[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0]]');
INSERT INTO `movie_sessions` VALUES (5, 1, 2, '2020-06-22', '2020-06-22 10:00:00', '2020-06-22 11:30:00', 5, 40.00, '[[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0]]');
INSERT INTO `movie_sessions` VALUES (6, 1, 1, '2020-06-23', '2020-06-22 14:00:00', '2020-06-22 15:30:00', 1, 39.00, '[[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0]]');
INSERT INTO `movie_sessions` VALUES (7, 2, 1, '2020-06-22', '2020-06-22 14:00:00', '2020-06-22 15:30:00', 1, 39.00, '[[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0]]');
INSERT INTO `movie_sessions` VALUES (8, 3, 1, '2020-06-22', '2020-06-22 14:00:00', '2020-06-22 15:30:00', 1, 39.00, '[[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0]]');
INSERT INTO `movie_sessions` VALUES (9, 1, 1, '2020-06-22', '2020-06-22 10:00:00', '2020-06-22 11:30:00', 2, 40.00, '[[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[0,0,-1,0,0,-1,0,0,0,-1,-1,0,0,0,-1,0,0,-1,0,0],[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0],[0,0,0,-1,0,0,0,0,0,-1,-1,0,0,0,0,0,-1,0,0,0]]');
INSERT INTO `movie_sessions` VALUES (10, 1, 2, '2020-06-22', '2020-06-22 10:00:00', '2020-06-22 11:30:00', 10, 40.00, '[[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]');
INSERT INTO `movie_sessions` VALUES (11, 1, 5, '2020-06-22', '2020-06-22 10:00:00', '2020-06-22 11:30:00', 11, 40.00, '[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]');
INSERT INTO `movie_sessions` VALUES (12, 2, 3, '2020-06-22', '2020-06-22 10:00:00', '2020-06-22 11:30:00', 16, 40.00, '[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]');
INSERT INTO `movie_sessions` VALUES (13, 1, 3, '2020-06-22', '2020-06-22 10:00:00', '2020-06-22 11:30:00', 16, 40.00, '[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]');

-- ----------------------------
-- Table structure for movie_type
-- ----------------------------
DROP TABLE IF EXISTS `movie_type`;
CREATE TABLE `movie_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电影分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_type
-- ----------------------------
INSERT INTO `movie_type` VALUES (1, '喜剧');
INSERT INTO `movie_type` VALUES (2, '悬疑');
INSERT INTO `movie_type` VALUES (3, '爱情');
INSERT INTO `movie_type` VALUES (4, '惊悚');
INSERT INTO `movie_type` VALUES (5, '动作');

-- ----------------------------
-- Table structure for movie_video
-- ----------------------------
DROP TABLE IF EXISTS `movie_video`;
CREATE TABLE `movie_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NULL DEFAULT NULL COMMENT '电影名称id',
  `video_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影预告视频',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电影预告视频表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_video
-- ----------------------------
INSERT INTO `movie_video` VALUES (3, 2, 'img_20200619105609.MP4');
INSERT INTO `movie_video` VALUES (4, 1, 'img_202007081739272.mp4');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表role（超管，电影院，周边商城，演出）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '后台管理员');
INSERT INTO `role` VALUES (2, '电影院管理员');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单中间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (1, 'L1');
INSERT INTO `role_menu` VALUES (1, 'L101');
INSERT INTO `role_menu` VALUES (1, 'L10101');
INSERT INTO `role_menu` VALUES (1, 'L10102');
INSERT INTO `role_menu` VALUES (1, 'L10103');
INSERT INTO `role_menu` VALUES (1, 'L10104');
INSERT INTO `role_menu` VALUES (1, 'L10105');
INSERT INTO `role_menu` VALUES (1, 'L102');
INSERT INTO `role_menu` VALUES (1, 'L10201');
INSERT INTO `role_menu` VALUES (1, 'L103');
INSERT INTO `role_menu` VALUES (1, 'L10301');
INSERT INTO `role_menu` VALUES (1, 'L10302');
INSERT INTO `role_menu` VALUES (1, 'L10303');
INSERT INTO `role_menu` VALUES (1, 'L104');
INSERT INTO `role_menu` VALUES (1, 'L10401');
INSERT INTO `role_menu` VALUES (1, 'L10402');
INSERT INTO `role_menu` VALUES (1, 'L10403');
INSERT INTO `role_menu` VALUES (1, 'L105');
INSERT INTO `role_menu` VALUES (1, 'L10502');
INSERT INTO `role_menu` VALUES (1, 'L106');
INSERT INTO `role_menu` VALUES (1, 'L10601');
INSERT INTO `role_menu` VALUES (1, 'L10602');
INSERT INTO `role_menu` VALUES (1, 'L107');
INSERT INTO `role_menu` VALUES (1, 'L10701');
INSERT INTO `role_menu` VALUES (2, 'L1');
INSERT INTO `role_menu` VALUES (2, 'L101');
INSERT INTO `role_menu` VALUES (2, 'L10104');
INSERT INTO `role_menu` VALUES (2, 'L103');
INSERT INTO `role_menu` VALUES (2, 'L10302');
INSERT INTO `role_menu` VALUES (2, 'L10303');

-- ----------------------------
-- Table structure for show_img
-- ----------------------------
DROP TABLE IF EXISTS `show_img`;
CREATE TABLE `show_img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `show_id` int(11) NULL DEFAULT NULL COMMENT '演出信息ID',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详情图片',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '演出信息图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of show_img
-- ----------------------------
INSERT INTO `show_img` VALUES (18, 15, 'img_20200622092802467367.png', 1);
INSERT INTO `show_img` VALUES (19, 15, 'img_20200622092802426341.png', 2);
INSERT INTO `show_img` VALUES (43, 1, 'img_20200624033405847560.jpg', NULL);
INSERT INTO `show_img` VALUES (44, 1, 'img_20200624033405844183.jpg', NULL);
INSERT INTO `show_img` VALUES (46, 2, 'img_20200624033502128450.jpg', NULL);
INSERT INTO `show_img` VALUES (48, 2, 'img_20200624033502174208.png', NULL);
INSERT INTO `show_img` VALUES (49, 3, 'img_20200624033503824404.jpg', NULL);
INSERT INTO `show_img` VALUES (50, 3, 'img_20200624033503899735.jpg', NULL);
INSERT INTO `show_img` VALUES (51, 3, 'img_20200624033503823572.png', NULL);
INSERT INTO `show_img` VALUES (52, 4, 'img_20200624033505943130.png', NULL);
INSERT INTO `show_img` VALUES (53, 4, 'img_20200624033505940721.png', NULL);
INSERT INTO `show_img` VALUES (54, 4, 'img_20200624033505927043.jpg', NULL);
INSERT INTO `show_img` VALUES (55, 1, 'img_20200629070305593881.jpg', NULL);
INSERT INTO `show_img` VALUES (59, 2, 'img_20200629070503975763.jpg', NULL);
INSERT INTO `show_img` VALUES (60, 2, 'img_20200629070503966811.jpg', NULL);
INSERT INTO `show_img` VALUES (61, 21, 'img_20200702023905658667.jpg', 1);
INSERT INTO `show_img` VALUES (62, 21, 'img_20200702023905656349.jpg', 2);
INSERT INTO `show_img` VALUES (63, 22, 'img_20200702025005483393.jpg', 1);
INSERT INTO `show_img` VALUES (64, 22, 'img_20200702025005418380.jpg', 2);
INSERT INTO `show_img` VALUES (65, 22, 'img_20200702025005494834.jpg', 3);
INSERT INTO `show_img` VALUES (66, 23, 'img_20200708113900455294.png', 1);
INSERT INTO `show_img` VALUES (67, 23, 'img_20200708113900497481.png', 2);
INSERT INTO `show_img` VALUES (68, 23, 'img_20200708113900436360.png', 3);
INSERT INTO `show_img` VALUES (69, 24, 'img_20200708050900047904.jpg', 1);
INSERT INTO `show_img` VALUES (70, 24, 'img_20200708050900027912.jpg', 2);
INSERT INTO `show_img` VALUES (71, 24, 'img_20200708050900012833.png', 3);

-- ----------------------------
-- Table structure for show_info
-- ----------------------------
DROP TABLE IF EXISTS `show_info`;
CREATE TABLE `show_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '演出标题',
  `show_time` datetime(0) NULL DEFAULT NULL COMMENT '演出时间',
  `show_details` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '演出详情',
  `show_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '演出地点',
  `show_length` int(11) NULL DEFAULT NULL COMMENT '演出时长(分钟)',
  `head_img` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '演出标题图片',
  `show_type` int(11) NULL DEFAULT NULL COMMENT '演出类别',
  `statue` int(11) NULL DEFAULT NULL COMMENT '状态：0.未开始 1.已取消 2.已结束 3.延期举行',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '演出信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of show_info
-- ----------------------------
INSERT INTO `show_info` VALUES (1, '\"归山\"城市音乐现场hjt', '2020-07-15 20:00:00', '前成都The Passenger乐队。在历经多次的人员更迭后，于2017年9月形成稳定阵容。2018年春 节前，乐队独立同期录制首张同名EP《THE\r\nPASSENGER》，并于2018年9月独立展开以长沙、武汉、贵阳、西安、新乡、北京等地的6城巡演。2019年上半年，乐队不可避免的也迎来了较大的人员\r\n调整，同时，乐队更名为“群像乐队”。乐队植根于后朋克，音乐在后朋克的黑暗笼罩下，更多的是融入了早期PUNK的暴躁粗砺和对六七十年代老乐队的喜\r\n好。一个热爱排练多过演出的乐队，对于黑暗绵延的后朋克之爱，让你彻身感受他们的暗面之声。hjt', '梵木创艺区正火艺术中心1号馆(东洪路666号)hjt', 150, 'img_20200624032704495353.jpg', 1, 0);
INSERT INTO `show_info` VALUES (2, '西游乐队十周年巡演上海站', '2020-07-15 20:00:00', '十年之前真的你不认识我，只是我们几个开始了-段新鲜又奇怪的故事，那就是攒了西游乐队。这个名字保到今天，可以说是我们几个加上老吴的功劳。\r\n十年之后真的我们是朋友，感受过这段历程中次次的感动。“什么时候来我家\"已经是最平凡的评论了，真想去，知道你们看视频不过瘾。其实-出北京，\r\n周老板就不敢说相声了。传达几句精神:“一半玲珑塔唱到今天应该有个终了;一顿皇上不急太监急的满汉全席打破了相声贯口在人们心中不可触碰的念\r\n想;一把丢了许久的扇子依旧没有找到，口吐莲花时请观众自行准备。还有《那时》、《80后的我们》 、《同仁 堂》等这次十周年巡演场次都会一一呈\r\n现。', '育音堂(凯旋路851号麦当劳对面)', 90, 'img_20200624032304589776.jpg', 2, 0);
INSERT INTO `show_info` VALUES (3, '2020\"壹梦拾年全国巡回音乐会-成都站', '2020-07-15 20:00:00', '前成都The Passenger乐队。在历经多次的人员更迭后，于2017年9月形成稳定阵容。2018年春 节前，乐队独立同期录制首张同名EP《THE\r\nPASSENGER》，并于2018年9月独立展开以长沙、武汉、贵阳、西安、新乡、北京等地的6城巡演。2019年上半年，乐队不可避免的也迎来了较大的人员\r\n调整，同时，乐队更名为“群像乐队”。乐队植根于后朋克，音乐在后朋克的黑暗笼罩下，更多的是融入了早期PUNK的暴躁粗砺和对六七十年代老乐队的喜\r\n好。一个热爱排练多过演出的乐队，对于黑暗绵延的后朋克之爱，让你彻身感受他们的暗面之声。', '梵木创艺区正火艺术中心1号馆(东洪路666号)', 150, 'img_20200624032705580394.jpg', 5, 0);
INSERT INTO `show_info` VALUES (4, 'Push 2020成都粉丝见面会', '2020-07-15 20:00:00', '前成都The Passenger乐队。在历经多次的人员更迭后，于2017年9月形成稳定阵容。2018年春 节前，乐队独立同期录制首张同名EP《THE\r\nPASSENGER》，并于2018年9月独立展开以长沙、武汉、贵阳、西安、新乡、北京等地的6城巡演。2019年上半年，乐队不可避免的也迎来了较大的人员\r\n调整，同时，乐队更名为“群像乐队”。乐队植根于后朋克，音乐在后朋克的黑暗笼罩下，更多的是融入了早期PUNK的暴躁粗砺和对六七十年代老乐队的喜\r\n好。一个热爱排练多过演出的乐队，对于黑暗绵延的后朋克之爱，让你彻身感受他们的暗面之声。', '梵木创艺区正火艺术中心1号馆(东洪路666号)', 150, 'img_20200624032505371296.png', 1, 0);
INSERT INTO `show_info` VALUES (5, 'SHARK卫彬月2020暑期小巡', '2020-07-15 20:00:00', '前成都The Passenger乐队。在历经多次的人员更迭后，于2017年9月形成稳定阵容。2018年春 节前，乐队独立同期录制首张同名EP《THE\r\nPASSENGER》，并于2018年9月独立展开以长沙、武汉、贵阳、西安、新乡、北京等地的6城巡演。2019年上半年，乐队不可避免的也迎来了较大的人员\r\n调整，同时，乐队更名为“群像乐队”。乐队植根于后朋克，音乐在后朋克的黑暗笼罩下，更多的是融入了早期PUNK的暴躁粗砺和对六七十年代老乐队的喜\r\n好。一个热爱排练多过演出的乐队，对于黑暗绵延的后朋克之爱，让你彻身感受他们的暗面之声。', '梵木创艺区正火艺术中心1号馆(东洪路666号)', 150, 'img_20200624032600248368.jpg', 6, 0);
INSERT INTO `show_info` VALUES (6, '北京爆笑感动话剧《夜未\r\n央》', '2020-07-15 20:00:00', '前成都The Passenger乐队。在历经多次的人员更迭后，于2017年9月形成稳定阵容。2018年春 节前，乐队独立同期录制首张同名EP《THE\r\nPASSENGER》，并于2018年9月独立展开以长沙、武汉、贵阳、西安、新乡、北京等地的6城巡演。2019年上半年，乐队不可避免的也迎来了较大的人员\r\n调整，同时，乐队更名为“群像乐队”。乐队植根于后朋克，音乐在后朋克的黑暗笼罩下，更多的是融入了早期PUNK的暴躁粗砺和对六七十年代老乐队的喜\r\n好。一个热爱排练多过演出的乐队，对于黑暗绵延的后朋克之爱，让你彻身感受他们的暗面之声。', '梵木创艺区正火艺术中心1号馆(东洪路666号)', 150, 'img_20200624032601031244.jpg', 8, 0);
INSERT INTO `show_info` VALUES (7, '孟京辉城市浸没剧《成都\r\n偷心》', '2020-07-15 20:00:00', '前成都The Passenger乐队。在历经多次的人员更迭后，于2017年9月形成稳定阵容。2018年春 节前，乐队独立同期录制首张同名EP《THE\r\nPASSENGER》，并于2018年9月独立展开以长沙、武汉、贵阳、西安、新乡、北京等地的6城巡演。2019年上半年，乐队不可避免的也迎来了较大的人员\r\n调整，同时，乐队更名为“群像乐队”。乐队植根于后朋克，音乐在后朋克的黑暗笼罩下，更多的是融入了早期PUNK的暴躁粗砺和对六七十年代老乐队的喜\r\n好。一个热爱排练多过演出的乐队，对于黑暗绵延的后朋克之爱，让你彻身感受他们的暗面之声。', '梵木创艺区正火艺术中心1号馆(东洪路666号)', 150, 'img_20200624032800624378.jpg', 7, 0);
INSERT INTO `show_info` VALUES (8, '阿加莎悬疑推理名剧《谋\r\n杀启事》', '2020-07-15 20:00:00', '前成都The Passenger乐队。在历经多次的人员更迭后，于2017年9月形成稳定阵容。2018年春 节前，乐队独立同期录制首张同名EP《THE\r\nPASSENGER》，并于2018年9月独立展开以长沙、武汉、贵阳、西安、新乡、北京等地的6城巡演。2019年上半年，乐队不可避免的也迎来了较大的人员\r\n调整，同时，乐队更名为“群像乐队”。乐队植根于后朋克，音乐在后朋克的黑暗笼罩下，更多的是融入了早期PUNK的暴躁粗砺和对六七十年代老乐队的喜\r\n好。一个热爱排练多过演出的乐队，对于黑暗绵延的后朋克之爱，让你彻身感受他们的暗面之声。', '梵木创艺区正火艺术中心1号馆(东洪路666号)', 150, 'img_20200624032801853360.png', 1, 0);
INSERT INTO `show_info` VALUES (9, '爆笑感动话剧《诱惑的\r\n街》', '2020-07-15 20:00:00', '前成都The Passenger乐队。在历经多次的人员更迭后，于2017年9月形成稳定阵容。2018年春 节前，乐队独立同期录制首张同名EP《THE\r\nPASSENGER》，并于2018年9月独立展开以长沙、武汉、贵阳、西安、新乡、北京等地的6城巡演。2019年上半年，乐队不可避免的也迎来了较大的人员\r\n调整，同时，乐队更名为“群像乐队”。乐队植根于后朋克，音乐在后朋克的黑暗笼罩下，更多的是融入了早期PUNK的暴躁粗砺和对六七十年代老乐队的喜\r\n好。一个热爱排练多过演出的乐队，对于黑暗绵延的后朋克之爱，让你彻身感受他们的暗面之声。', '梵木创艺区正火艺术中心1号馆(东洪路666号)', 150, 'img_20200624032803050272.jpg', 5, 0);
INSERT INTO `show_info` VALUES (10, '凡人喜剧脱口秀-开放麦', '2020-07-15 20:00:00', '前成都The Passenger乐队。在历经多次的人员更迭后，于2017年9月形成稳定阵容。2018年春 节前，乐队独立同期录制首张同名EP《THE\r\nPASSENGER》，并于2018年9月独立展开以长沙、武汉、贵阳、西安、新乡、北京等地的6城巡演。2019年上半年，乐队不可避免的也迎来了较大的人员\r\n调整，同时，乐队更名为“群像乐队”。乐队植根于后朋克，音乐在后朋克的黑暗笼罩下，更多的是融入了早期PUNK的暴躁粗砺和对六七十年代老乐队的喜\r\n好。一个热爱排练多过演出的乐队，对于黑暗绵延的后朋克之爱，让你彻身感受他们的暗面之声。', '梵木创艺区正火艺术中心1号馆(东洪路666号)', 150, 'img_20200624032804026422.png', 4, 0);
INSERT INTO `show_info` VALUES (11, '蒙特梭利儿童世家复城国\r\n际店体验课', '2020-07-15 20:00:00', '前成都The Passenger乐队。在历经多次的人员更迭后，于2017年9月形成稳定阵容。2018年春 节前，乐队独立同期录制首张同名EP《THE\r\nPASSENGER》，并于2018年9月独立展开以长沙、武汉、贵阳、西安、新乡、北京等地的6城巡演。2019年上半年，乐队不可避免的也迎来了较大的人员\r\n调整，同时，乐队更名为“群像乐队”。乐队植根于后朋克，音乐在后朋克的黑暗笼罩下，更多的是融入了早期PUNK的暴躁粗砺和对六七十年代老乐队的喜\r\n好。一个热爱排练多过演出的乐队，对于黑暗绵延的后朋克之爱，让你彻身感受他们的暗面之声。', '梵木创艺区正火艺术中心1号馆(东洪路666号)hjt', 150, 'img_20200624032805073629.png', 4, 0);
INSERT INTO `show_info` VALUES (12, '11', '2020-07-15 20:00:00', '11', '11', 11, 'img_20200624032900571642.jpg', 2, 0);
INSERT INTO `show_info` VALUES (13, '11', '2020-07-15 20:00:00', '11', '11', 11, 'img_20200620050001871366.png', 8, 0);
INSERT INTO `show_info` VALUES (14, '测试', '2020-07-15 20:00:00', '测试', '成都', 120, 'img_20200620050301978793.png', 3, 0);
INSERT INTO `show_info` VALUES (15, '测试2', '2020-07-15 20:00:00', '11', '成都', 120, 'img_20200622092704076064.png', 3, 0);
INSERT INTO `show_info` VALUES (16, '测试3', '2020-07-15 20:00:00', '111', '成都', 150, 'img_20200622100600244092.png', 1, 0);
INSERT INTO `show_info` VALUES (21, '111', '2020-07-18 20:00:00', '111', 'cd', 123, 'img_20200702023904410235.jpg', 2, 0);
INSERT INTO `show_info` VALUES (22, '测试', '2020-07-25 20:00:00', '测试', '成都', 120, 'img_20200702025000388104.jpg', 1, 0);
INSERT INTO `show_info` VALUES (23, '测试11111', '2020-07-15 20:00:00', '测试', '成都', 150, 'img_20200708113800062025.jpg', 5, 0);
INSERT INTO `show_info` VALUES (24, '测试', '2020-07-08 00:00:00', '111', '成都', 130, 'img_20200708050800050855.jpg', 1, 1);

-- ----------------------------
-- Table structure for show_order
-- ----------------------------
DROP TABLE IF EXISTS `show_order`;
CREATE TABLE `show_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `ticket_number` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `state` int(11) NULL DEFAULT NULL COMMENT '订单状态 0.未付款 1.已付款 2.已失效 3.退款申请 4.退款成功',
  `pay_way` int(11) NULL DEFAULT NULL COMMENT '支付方式 1.支付宝 2.微信',
  `pay_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付流水号',
  `create_Time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '演出门票订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of show_order
-- ----------------------------
INSERT INTO `show_order` VALUES (1, '7a0a44b0-f57d-4069-b181-2a1d52706329', 99.00, 1, 1, 1, 1, '123321', '2020-06-01 11:36:42');
INSERT INTO `show_order` VALUES (2, 'cb75281d-2f64-4e4f-86e4-57b6ea26296f', 99.00, 1, 2, 4, NULL, NULL, '2020-06-07 11:36:52');
INSERT INTO `show_order` VALUES (3, '777814fb-7995-474c-b307-35fc735dd1aa', 198.00, 2, 3, 4, NULL, NULL, '2020-06-23 11:36:55');
INSERT INTO `show_order` VALUES (5, 'ae7392ae-c43d-451a-a7a1-06067b2ccb68', 990.00, 10, 666, 4, NULL, NULL, '2020-06-30 10:55:49');
INSERT INTO `show_order` VALUES (6, '3b4ce89c-99ea-4c17-87ce-9052b5a6af3d', 495.00, 5, 888, 0, NULL, NULL, '2020-06-30 15:36:34');
INSERT INTO `show_order` VALUES (7, '50786b74-fa0a-471f-8d89-4c588be80a76', 198.00, 2, 999, 2, NULL, NULL, '2020-06-30 15:43:57');
INSERT INTO `show_order` VALUES (8, 'e702ec08-6a91-4f53-9786-d19349925b7b', 198.00, 2, 529, 2, NULL, NULL, '2020-07-01 14:19:19');
INSERT INTO `show_order` VALUES (9, '6918a47d-9c13-4dfd-9c21-707e123a1dad', 198.00, 2, 1001, 2, NULL, NULL, '2020-07-01 14:43:49');
INSERT INTO `show_order` VALUES (10, 'ac1e48bc-dc93-4013-b2f4-729240a90a39', 99.00, 1, 1002, 1, 1, '11112222', '2020-07-01 14:50:01');
INSERT INTO `show_order` VALUES (19, '6021eac0-0d3e-42e7-bbaa-936300cd1fe8', 99.00, 1, 1012, 4, 1, '2020070222001442050500700079', '2020-07-02 10:09:48');
INSERT INTO `show_order` VALUES (20, '0b1af337-a19f-4074-8ed0-10ab00b348a3', 99.00, 1, 1013, 4, 1, '2020070222001442050500699806', '2020-07-02 10:26:03');
INSERT INTO `show_order` VALUES (21, 'e0bd60ab-6f01-480a-9927-ffe247641b8b', 99.00, 1, 1014, 4, 1, '2020070222001442050500700080', '2020-07-02 10:32:30');
INSERT INTO `show_order` VALUES (22, '5c0d1100-9bcc-48ea-b46e-b80860f2832d', 99.00, 1, 1015, 4, 1, '2020070222001442050500699809', '2020-07-02 10:48:45');
INSERT INTO `show_order` VALUES (23, 'ca2042ab-d1f4-4d6b-9e0d-b528826e6aa9', 99.00, 1, 1016, 2, NULL, NULL, '2020-07-02 17:16:59');
INSERT INTO `show_order` VALUES (24, '4a48d34c-cace-4fae-a235-0118f50deb2f', 99.00, 1, 1017, 2, NULL, NULL, '2020-07-02 17:18:42');
INSERT INTO `show_order` VALUES (25, '58f5a357-8127-41ec-9778-2affe266b177', 99.00, 1, 1019, 2, NULL, NULL, '2020-07-02 17:32:32');
INSERT INTO `show_order` VALUES (26, '8c39b9d8-3d70-4320-8b60-0cf8f51175f8', 99.00, 1, 1020, 2, NULL, NULL, '2020-07-02 17:34:10');
INSERT INTO `show_order` VALUES (27, '642b2213-2fd1-4b35-b291-965263625916', 99.00, 1, 1021, 2, NULL, NULL, '2020-07-02 17:34:41');
INSERT INTO `show_order` VALUES (28, '4374933b-ba9f-43aa-8094-e61942450692', 99.00, 1, 1022, 2, NULL, NULL, '2020-07-02 17:35:35');
INSERT INTO `show_order` VALUES (29, 'd84be4a4-7bcd-4c28-b03c-a09328942f51', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 17:45:33');
INSERT INTO `show_order` VALUES (30, '96cf464b-5377-4865-ac97-f4a3e2fd87e6', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 17:45:34');
INSERT INTO `show_order` VALUES (31, '4de7c50d-702f-4a5f-891e-8db3f7878236', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 17:45:35');
INSERT INTO `show_order` VALUES (32, '185d7483-d39a-4a35-8d7b-4dc73a4fe25a', 396.00, 4, 1, 2, NULL, NULL, '2020-07-02 17:46:51');
INSERT INTO `show_order` VALUES (33, 'fedbdf9b-578a-4656-ae4f-2d3e609d1a18', 199.00, 1, 1, 2, NULL, NULL, '2020-07-02 18:44:42');
INSERT INTO `show_order` VALUES (34, 'dc521dc1-d083-4740-9c33-e7eaef727c78', 199.00, 1, 1, 2, NULL, NULL, '2020-07-02 18:44:43');
INSERT INTO `show_order` VALUES (35, '8bf95e88-e6b1-42d8-8366-606fe8235490', 199.00, 1, 1, 2, NULL, NULL, '2020-07-02 18:44:43');
INSERT INTO `show_order` VALUES (36, '05836f73-0756-4790-9adf-f14d43b1122e', 199.00, 1, 1, 2, NULL, NULL, '2020-07-02 18:44:43');
INSERT INTO `show_order` VALUES (37, '82132c50-6aae-4260-92e0-1dc3397ca59c', 199.00, 1, 1, 2, NULL, NULL, '2020-07-02 18:44:44');
INSERT INTO `show_order` VALUES (38, 'f9a2439a-c04c-4f1e-818b-c361e752c56c', 199.00, 1, 1, 2, NULL, NULL, '2020-07-02 18:44:44');
INSERT INTO `show_order` VALUES (39, 'f04e1922-7cae-466d-b28e-ecd91a2b4f7e', 8970.00, 30, 1, 2, NULL, NULL, '2020-07-02 18:47:30');
INSERT INTO `show_order` VALUES (40, '91b9c569-f66b-4e59-8570-3bfcbf4ba989', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 18:57:40');
INSERT INTO `show_order` VALUES (41, 'c7f75bc4-80b0-43a9-a5bb-bc20ad53fbb1', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 18:57:41');
INSERT INTO `show_order` VALUES (42, 'ed815ba0-3934-47bc-b4a3-73c519e17619', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 18:57:41');
INSERT INTO `show_order` VALUES (43, 'cfdc4cce-5c6c-457f-be72-eaf8d8e2117d', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 18:57:42');
INSERT INTO `show_order` VALUES (44, '97d40f48-b911-44d0-9a50-57904c167e42', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 18:57:43');
INSERT INTO `show_order` VALUES (45, 'a7529302-2705-4ee9-9a1d-e89ae53b7cd7', 198.00, 2, 1, 2, NULL, NULL, '2020-07-02 18:57:57');
INSERT INTO `show_order` VALUES (46, 'fbd21106-0c21-4401-95e1-cd163c1da24c', 198.00, 2, 1, 2, NULL, NULL, '2020-07-02 18:57:58');
INSERT INTO `show_order` VALUES (47, 'da96c94a-937b-4fe1-ba57-fb9a600ff134', 198.00, 2, 1, 2, NULL, NULL, '2020-07-02 18:57:58');
INSERT INTO `show_order` VALUES (48, 'bee8a4be-8a61-4608-9047-a360b1a658e4', 198.00, 2, 1, 2, NULL, NULL, '2020-07-02 18:58:45');
INSERT INTO `show_order` VALUES (49, '584615bb-fb8a-4693-a6bb-184545cf8c46', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 18:59:11');
INSERT INTO `show_order` VALUES (50, '1d6f1547-12e8-4555-9f04-22f5ab4becbd', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:08:35');
INSERT INTO `show_order` VALUES (51, '13b7cba2-3a9e-4d3b-aae8-024d5b73d9b4', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:10:00');
INSERT INTO `show_order` VALUES (52, 'cda518e3-8643-4c38-9e4f-cef27180b60c', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:10:06');
INSERT INTO `show_order` VALUES (53, '1e063e0d-2d56-49d3-be36-90da67074b24', 398.00, 2, 1, 2, NULL, NULL, '2020-07-02 19:10:18');
INSERT INTO `show_order` VALUES (54, '6b7c54ea-0532-497d-8d61-eaa672c90a94', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:12:33');
INSERT INTO `show_order` VALUES (55, '6f9285dd-49d7-49e0-9913-261f4d540191', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:12:39');
INSERT INTO `show_order` VALUES (56, 'c02aeb73-365a-48a9-bb4e-66b9b46aa0a0', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:12:49');
INSERT INTO `show_order` VALUES (57, '2243e02d-039d-428e-9363-c0d5be4ea313', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:13:16');
INSERT INTO `show_order` VALUES (58, '4e90161e-ce54-4250-81fb-2dd686b1c04e', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:15:53');
INSERT INTO `show_order` VALUES (59, '22573e13-4a7e-48b7-870a-2f155f5ad4ab', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:17:09');
INSERT INTO `show_order` VALUES (60, '2941e4b8-9764-41ae-b4fe-9557fe6f41b0', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:18:10');
INSERT INTO `show_order` VALUES (61, '7dba3e55-0514-4c43-b803-3c942bb354fe', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:18:16');
INSERT INTO `show_order` VALUES (62, '35129e9b-2d22-49a9-ba63-24c8cd18646c', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:18:23');
INSERT INTO `show_order` VALUES (63, '8e920b3f-bddc-46e8-870e-891592b6f0cd', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:18:55');
INSERT INTO `show_order` VALUES (64, '551f7d45-9e2c-4705-b2b8-27627a4acf08', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:19:33');
INSERT INTO `show_order` VALUES (65, '09277463-01ff-43b3-9015-a7cdd4fe0bd8', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:19:46');
INSERT INTO `show_order` VALUES (66, '6e06304a-b304-408d-83fd-1ee37eccc35e', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:19:48');
INSERT INTO `show_order` VALUES (67, '6c4372bf-6419-4731-98fd-50f528d4b5d3', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:21:40');
INSERT INTO `show_order` VALUES (68, '9d95597b-7e14-4181-b6ae-4d276efae8af', 199.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:22:20');
INSERT INTO `show_order` VALUES (69, '85bcfe28-e6ad-4ee7-b0b3-21bfc65e9bec', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:23:48');
INSERT INTO `show_order` VALUES (70, '708b2c2f-123d-4bb5-9658-4954ceb05a77', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:29:13');
INSERT INTO `show_order` VALUES (71, '88279c96-51be-490d-b03b-2d46c95f0e16', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:29:21');
INSERT INTO `show_order` VALUES (72, 'c5ea3f5b-b574-42ab-84a7-2669bd6f0a74', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:30:08');
INSERT INTO `show_order` VALUES (73, 'd829c0d3-ccdc-48ee-a6d3-212eee628a8d', 99.00, 1, 1, 2, NULL, NULL, '2020-07-02 19:30:49');
INSERT INTO `show_order` VALUES (74, '61fdec64-f9ab-441c-9869-ee171232b102', 1194.00, 6, 1, 2, NULL, NULL, '2020-07-02 19:35:46');
INSERT INTO `show_order` VALUES (75, 'd1177a56-5df1-4c3a-9d1f-beec4019f734', 398.00, 2, 1, 2, NULL, NULL, '2020-07-02 19:45:15');
INSERT INTO `show_order` VALUES (76, '83bbcc43-0586-49d8-8ae5-9149aed0cb4c', 398.00, 2, 1, 2, NULL, NULL, '2020-07-02 20:12:48');
INSERT INTO `show_order` VALUES (77, 'cbd52df7-0e5f-4f27-8391-547e964132ab', 597.00, 3, 1, 2, NULL, NULL, '2020-07-03 09:41:28');
INSERT INTO `show_order` VALUES (78, '57e00f52-eae4-4750-9e5b-3dcda1ea76a4', 597.00, 3, 1, 2, NULL, NULL, '2020-07-03 09:43:45');
INSERT INTO `show_order` VALUES (79, 'b95509f5-f101-410e-9830-5b0aba22abaf', 597.00, 3, 1, 2, NULL, NULL, '2020-07-03 09:43:51');
INSERT INTO `show_order` VALUES (80, 'f89674f8-2f35-4646-8e1a-43e96f27737d', 597.00, 3, 1, 2, NULL, NULL, '2020-07-03 09:46:32');
INSERT INTO `show_order` VALUES (81, '629d6e89-f9c4-4702-971f-2da3ea9abf66', 398.00, 2, 1, 2, NULL, NULL, '2020-07-03 09:53:50');
INSERT INTO `show_order` VALUES (82, '95798b05-e6b1-4fc9-900a-f51fe6cbd280', 398.00, 2, 1, 2, NULL, NULL, '2020-07-03 09:54:54');
INSERT INTO `show_order` VALUES (83, '0a584abd-510d-47d7-856b-e2874ac0be19', 398.00, 2, 1, 2, NULL, NULL, '2020-07-03 09:55:31');
INSERT INTO `show_order` VALUES (84, '20e6ddd6-0a89-42d1-b41c-92903427d255', 398.00, 2, 1, 2, NULL, NULL, '2020-07-03 09:57:10');
INSERT INTO `show_order` VALUES (85, '9f45262d-1549-48b0-94cc-f954dd27787d', 398.00, 2, 1, 2, NULL, NULL, '2020-07-03 09:59:11');
INSERT INTO `show_order` VALUES (86, '620d9bed-8849-4e4b-a1bf-c21c4ac9d832', 398.00, 2, 1, 2, NULL, NULL, '2020-07-03 10:04:34');
INSERT INTO `show_order` VALUES (87, '6578ac5a-93e5-4d9a-91b1-0e47463e4d23', 398.00, 2, 1, 2, NULL, NULL, '2020-07-03 10:04:43');
INSERT INTO `show_order` VALUES (88, '0dec6b39-8156-4104-8ba4-693833174bcb', 398.00, 2, 1, 2, NULL, NULL, '2020-07-03 10:25:35');
INSERT INTO `show_order` VALUES (89, '7934cf9a-0ed8-413d-827d-27c21a2d897c', 99.00, 1, 1, 2, NULL, NULL, '2020-07-03 10:45:22');
INSERT INTO `show_order` VALUES (90, 'ea41d4ad-4b13-4294-8953-be040410cdf7', 99.00, 1, 1, 2, NULL, NULL, '2020-07-03 10:52:21');
INSERT INTO `show_order` VALUES (91, '5c79c261-76f6-4291-b531-3568d9b2d36c', 99.00, 1, 1, 2, NULL, NULL, '2020-07-03 10:54:21');
INSERT INTO `show_order` VALUES (92, '2be0e5e4-ba90-4da6-aa36-9e993f8c3100', 99.00, 1, 1, 2, NULL, NULL, '2020-07-03 11:00:18');
INSERT INTO `show_order` VALUES (93, '4647573b-db44-4579-bef5-31af7668a33d', 99.00, 1, 1, 2, NULL, NULL, '2020-07-03 11:01:02');
INSERT INTO `show_order` VALUES (94, '11069ea9-81e6-4e40-a72e-0ed6e6ec27a1', 99.00, 1, 1, 3, 1, '2020070322001442050500700317', '2020-07-03 11:01:26');
INSERT INTO `show_order` VALUES (95, 'dd6472b9-a32e-4700-a7bf-1c877eee013f', 99.00, 1, 1, 2, NULL, NULL, '2020-07-03 11:12:19');
INSERT INTO `show_order` VALUES (96, '505df15c-39ff-421d-b62e-2e3ac65ca172', 99.00, 1, 1, 3, 1, '2020070322001442050500700837', '2020-07-03 11:12:47');
INSERT INTO `show_order` VALUES (97, 'b2d9252e-5f65-4fc9-8815-f8cd66b3edef', 198.00, 2, 1, 2, NULL, NULL, '2020-07-03 14:00:17');
INSERT INTO `show_order` VALUES (98, '28355518-47b0-4e90-8501-bbd78cddc555', 99.00, 1, 1, 2, NULL, NULL, '2020-07-03 14:59:07');
INSERT INTO `show_order` VALUES (99, '8e3da035-f9ce-4224-9d54-ec23ee0e06d5', 99.00, 1, 1, 2, NULL, NULL, '2020-07-03 15:06:26');
INSERT INTO `show_order` VALUES (100, 'a7380580-6b67-4561-9dc7-04580d50bc64', 199.00, 1, 1, 3, 1, '2020070322001442050500700008', '2020-07-03 15:07:11');
INSERT INTO `show_order` VALUES (101, '69f1caff-9855-48fb-8c94-d6c7fd551cb5', 299.00, 1, 1, 2, NULL, NULL, '2020-07-03 15:08:35');
INSERT INTO `show_order` VALUES (102, '89962e58-90b5-4999-bab8-a8b4bd56935d', 299.00, 1, 1, 3, 1, '2020070322001442050500700256', '2020-07-03 15:08:35');
INSERT INTO `show_order` VALUES (103, '03cecb6e-3b3c-40a2-b1bf-1393a75ee40e', 99.00, 1, 1, 1, 1, '2020070322001442050500700841', '2020-07-03 15:09:22');
INSERT INTO `show_order` VALUES (104, '18cf403f-5bfd-41a6-a115-731ce396fda4', 398.00, 2, 1, 2, NULL, NULL, '2020-07-03 15:18:29');
INSERT INTO `show_order` VALUES (105, 'd47e1180-75bb-4fbe-ae9c-bb7281e432ab', 398.00, 2, 1, 3, 1, '2020070322001442050500701025', '2020-07-03 15:18:31');
INSERT INTO `show_order` VALUES (106, 'aaeb565c-9e6b-4367-b6ec-f393b259eef5', 99.00, 1, 1, 2, NULL, NULL, '2020-07-06 10:25:08');
INSERT INTO `show_order` VALUES (107, 'c8d61090-5484-4852-81db-5202f36fffcb', 199.00, 1, 1, 2, NULL, NULL, '2020-07-06 10:25:16');
INSERT INTO `show_order` VALUES (108, '303c646b-59d9-43ec-aed9-122c4b1c5cf9', 299.00, 1, 1, 2, NULL, NULL, '2020-07-06 10:25:19');
INSERT INTO `show_order` VALUES (109, 'd5ae00bf-6be9-4790-b419-28502f0f710a', 99.00, 1, 1, 2, NULL, NULL, '2020-07-06 13:09:59');
INSERT INTO `show_order` VALUES (110, 'a14a3141-7366-4c7c-8290-a69f8532d4bc', 99.00, 1, 1, 2, NULL, NULL, '2020-07-06 13:11:30');
INSERT INTO `show_order` VALUES (111, '157a18e4-6bf1-4b3a-b1e0-64e1a89b450e', 99.00, 1, 1, 2, NULL, NULL, '2020-07-06 13:21:24');
INSERT INTO `show_order` VALUES (112, 'b176b255-2aad-4f13-a6fd-8f302002d318', 1794.00, 6, 1, 2, NULL, NULL, '2020-07-06 13:26:59');
INSERT INTO `show_order` VALUES (113, '5d646430-7a2a-4452-b18a-d90a96e95954', 99.00, 1, 1, 2, NULL, NULL, '2020-07-06 13:33:32');
INSERT INTO `show_order` VALUES (114, 'f19e9f07-e39e-4d49-a688-04aadbc99682', 99.00, 1, 1, 2, NULL, NULL, '2020-07-06 13:33:33');
INSERT INTO `show_order` VALUES (115, 'c24f1006-4870-411f-b1f7-597fbd523b9e', 1794.00, 6, 1, 2, NULL, NULL, '2020-07-06 13:34:26');
INSERT INTO `show_order` VALUES (116, '32b6203e-771f-4264-a410-514cb6abb8bf', 199.00, 1, 1, 2, NULL, NULL, '2020-07-06 15:04:16');
INSERT INTO `show_order` VALUES (117, '07e498f2-17e7-4213-b7e9-2b8668d0d399', 99.00, 1, 2, 2, NULL, NULL, '2020-07-06 19:09:22');
INSERT INTO `show_order` VALUES (118, '1ab47851-7931-4117-a699-753009f13d49', 99.00, 1, 1, 2, NULL, NULL, '2020-07-06 19:36:09');
INSERT INTO `show_order` VALUES (119, '8bb10a22-0b60-48b1-ae7e-b1ea5e9c44a1', 99.00, 1, 1, 2, NULL, NULL, '2020-07-06 19:37:00');
INSERT INTO `show_order` VALUES (120, '3b3b506b-1ede-4e57-bb5c-e4913b6a910d', 398.00, 2, 1, 2, NULL, NULL, '2020-07-06 19:37:52');
INSERT INTO `show_order` VALUES (121, '38de31f8-6fbf-4ee3-bd52-60d9be04d9e7', 99.00, 1, 1, 2, NULL, NULL, '2020-07-06 20:07:04');
INSERT INTO `show_order` VALUES (122, 'c87bdaa1-965b-42a6-a414-60ad9a16a6e9', 99.00, 1, 1, 2, NULL, NULL, '2020-07-06 21:07:52');
INSERT INTO `show_order` VALUES (123, 'c792c738-90a5-4d63-893f-c27d3c3c2452', 597.00, 3, 1, 2, NULL, NULL, '2020-07-07 14:11:31');
INSERT INTO `show_order` VALUES (124, 'be1fea33-2b97-42e0-814a-989c6c1627f0', 398.00, 2, 1, 2, NULL, NULL, '2020-07-07 15:25:57');
INSERT INTO `show_order` VALUES (125, '3f9cb72b-07f5-4a7c-a1e1-b5feb2cc1627', 398.00, 2, 1, 2, NULL, NULL, '2020-07-07 15:25:58');
INSERT INTO `show_order` VALUES (126, '7dcd66ef-ac6c-452f-8d3a-08687ae75b70', 198.00, 2, 1, 2, NULL, NULL, '2020-07-07 15:47:01');
INSERT INTO `show_order` VALUES (127, 'ef057a5c-2300-4d07-a7cc-1fb4c8f37c55', 198.00, 2, 1, 2, NULL, NULL, '2020-07-07 15:52:05');
INSERT INTO `show_order` VALUES (128, '65a970d9-10e9-4fbe-8338-60e9732526a6', 99.00, 1, 1, 3, 1, '2020070722001442050500703683', '2020-07-07 15:54:26');
INSERT INTO `show_order` VALUES (129, 'ccbcbc3e-3013-4246-9acc-808c309e2637', 199.00, 1, 1, 2, NULL, NULL, '2020-07-07 15:57:00');
INSERT INTO `show_order` VALUES (130, '447413f3-8f85-4114-a78a-565cb6ba17cb', 199.00, 1, 1, 2, NULL, NULL, '2020-07-07 15:57:53');
INSERT INTO `show_order` VALUES (131, 'd253cfbb-b097-42f3-8aeb-847388dd2ea8', 199.00, 1, 1, 2, NULL, NULL, '2020-07-07 15:57:54');
INSERT INTO `show_order` VALUES (132, '70592654-4a42-434e-8da8-066621a9497e', 99.00, 1, 1, 2, NULL, NULL, '2020-07-07 16:10:46');
INSERT INTO `show_order` VALUES (133, '50a8066b-b653-445f-9824-609f8e77429e', 99.00, 1, 1, 2, NULL, NULL, '2020-07-07 16:10:47');
INSERT INTO `show_order` VALUES (134, '2de86415-3008-418d-806f-e60665a49014', 99.00, 1, 1, 2, NULL, NULL, '2020-07-07 16:10:47');
INSERT INTO `show_order` VALUES (135, 'b184bfd9-90ff-4a0d-bbbe-a0b98ed16d47', 99.00, 1, 1, 2, NULL, NULL, '2020-07-07 16:10:47');
INSERT INTO `show_order` VALUES (136, 'd770493b-3599-4d1c-b3de-59a95c967350', 99.00, 1, 1, 1, 1, '2020070722001442050500703807', '2020-07-07 16:10:48');
INSERT INTO `show_order` VALUES (137, '38a3ff9d-3602-4b9a-a066-590ace137d6d', 199.00, 1, 1, 2, NULL, NULL, '2020-07-07 16:43:54');
INSERT INTO `show_order` VALUES (138, '21fd84d5-76f6-48a5-be61-311f424eb3c1', 199.00, 1, 1, 2, NULL, NULL, '2020-07-07 17:00:05');
INSERT INTO `show_order` VALUES (139, '0f9841ba-a21c-4b9b-a339-967ee81cf4e3', 99.00, 1, 1, 2, NULL, NULL, '2020-07-07 17:01:27');
INSERT INTO `show_order` VALUES (140, '63fa8530-0c58-46a6-a6b1-adf622bcc3ce', 99.00, 1, 1, 2, NULL, NULL, '2020-07-07 17:07:48');
INSERT INTO `show_order` VALUES (141, 'bc55806d-b6f6-46cd-bff8-85632295cffc', 199.00, 1, 1, 2, NULL, NULL, '2020-07-07 17:13:16');
INSERT INTO `show_order` VALUES (142, '0d7f3403-0485-49e9-9102-24b205e19828', 299.00, 1, 1, 1, 1, '2020070722001442050500704453', '2020-07-07 17:26:23');
INSERT INTO `show_order` VALUES (143, '4c4f694c-aad4-47f6-894f-7039a12a8d7c', 199.00, 1, 1, 2, NULL, NULL, '2020-07-07 17:38:08');
INSERT INTO `show_order` VALUES (144, '241df962-6863-4900-bc33-32985bc486a7', 199.00, 1, 1, 2, NULL, NULL, '2020-07-07 18:00:12');
INSERT INTO `show_order` VALUES (145, '51784acd-6f31-4c68-a8f1-5581e922f859', 99.00, 1, 1, 2, NULL, NULL, '2020-07-07 21:14:40');
INSERT INTO `show_order` VALUES (146, '8cc186ee-9f7f-4109-93ce-f094cfcfe80a', 199.00, 1, 1, 2, NULL, NULL, '2020-07-07 21:23:52');
INSERT INTO `show_order` VALUES (147, 'df59e76d-5d99-48d8-8a49-e1c820e83c57', 99.00, 1, 1, 4, 1, '2020070722001442050500704578', '2020-07-07 21:26:21');
INSERT INTO `show_order` VALUES (148, '81dd1337-85f5-462f-9124-381731a22cfe', 198.00, 2, 1, 2, NULL, NULL, '2020-07-08 09:45:33');
INSERT INTO `show_order` VALUES (149, '041cf4aa-64cd-43b7-9119-76a27cd1b558', 99.00, 1, 1, 1, 1, '2020070822001442050500704131', '2020-07-08 10:16:20');
INSERT INTO `show_order` VALUES (150, '17a8e1b1-3d67-47e5-bc09-a9e24660af35', 199.00, 1, 1, 1, 1, '2020070822001442050500704589', '2020-07-08 11:25:21');
INSERT INTO `show_order` VALUES (151, 'accc0f93-ea82-4d63-923f-849fce45f280', 1194.00, 6, 1, 2, NULL, NULL, '2020-07-08 16:58:34');
INSERT INTO `show_order` VALUES (152, '03e46f24-5099-4265-abef-e3a7cdcaf5ee', 1194.00, 6, 1, 1, 1, '2020070822001442050500704485', '2020-07-08 16:58:35');
INSERT INTO `show_order` VALUES (153, '2a505100-fd59-4072-93dc-5e7693cbe54e', 160.00, 2, 1, 1, 1, '2020070822001442050500704486', '2020-07-08 17:11:24');
INSERT INTO `show_order` VALUES (154, 'ff1f8170-dd1f-4025-85ec-57a67bb68035', 160.00, 2, 1, 2, NULL, NULL, '2020-07-08 17:11:24');
INSERT INTO `show_order` VALUES (155, 'cbedc173-c7b2-402f-aebd-ff7ae737e2dd', 597.00, 3, 1, 2, NULL, NULL, '2020-07-08 19:07:46');
INSERT INTO `show_order` VALUES (156, 'cec1bba9-8e78-425d-9837-77a08773ac25', 990.00, 10, 666, 2, NULL, NULL, '2020-07-08 20:06:01');
INSERT INTO `show_order` VALUES (157, '4eb74588-8860-45d7-bde4-fa4a11ef843a', 398.00, 2, 1, 1, 1, '2020071422001442050500708047', '2020-07-14 12:15:20');
INSERT INTO `show_order` VALUES (158, 'c4c9c06c-626d-41c6-81b4-16d4bb08b8ce', 398.00, 2, 1, 2, NULL, NULL, '2020-07-14 12:15:20');

-- ----------------------------
-- Table structure for show_order_details
-- ----------------------------
DROP TABLE IF EXISTS `show_order_details`;
CREATE TABLE `show_order_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NULL DEFAULT NULL COMMENT '演出订单ID',
  `ticket_id` int(11) NULL DEFAULT NULL COMMENT '演出门票ID',
  `seat` int(3) NULL DEFAULT NULL COMMENT '座位号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 281 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of show_order_details
-- ----------------------------
INSERT INTO `show_order_details` VALUES (1, 1, 1, 10);
INSERT INTO `show_order_details` VALUES (2, 2, 2, 12);
INSERT INTO `show_order_details` VALUES (3, 3, 4, 11);
INSERT INTO `show_order_details` VALUES (4, 3, 4, 12);
INSERT INTO `show_order_details` VALUES (5, 5, 10, 11);
INSERT INTO `show_order_details` VALUES (6, 5, 10, 12);
INSERT INTO `show_order_details` VALUES (7, 5, 10, 13);
INSERT INTO `show_order_details` VALUES (8, 5, 10, 14);
INSERT INTO `show_order_details` VALUES (9, 5, 10, 15);
INSERT INTO `show_order_details` VALUES (10, 5, 10, 16);
INSERT INTO `show_order_details` VALUES (11, 5, 10, 17);
INSERT INTO `show_order_details` VALUES (12, 5, 10, 18);
INSERT INTO `show_order_details` VALUES (13, 5, 10, 19);
INSERT INTO `show_order_details` VALUES (14, 5, 10, 20);
INSERT INTO `show_order_details` VALUES (15, 6, 10, 21);
INSERT INTO `show_order_details` VALUES (16, 6, 10, 22);
INSERT INTO `show_order_details` VALUES (17, 6, 10, 23);
INSERT INTO `show_order_details` VALUES (18, 6, 10, 24);
INSERT INTO `show_order_details` VALUES (19, 6, 10, 25);
INSERT INTO `show_order_details` VALUES (20, 7, 10, 26);
INSERT INTO `show_order_details` VALUES (21, 7, 10, 27);
INSERT INTO `show_order_details` VALUES (22, 8, 10, 28);
INSERT INTO `show_order_details` VALUES (23, 8, 10, 29);
INSERT INTO `show_order_details` VALUES (24, 9, 10, 29);
INSERT INTO `show_order_details` VALUES (25, 9, 10, 28);
INSERT INTO `show_order_details` VALUES (26, 10, 10, 30);
INSERT INTO `show_order_details` VALUES (27, 11, 10, 28);
INSERT INTO `show_order_details` VALUES (28, 12, 10, 29);
INSERT INTO `show_order_details` VALUES (29, 13, 10, 31);
INSERT INTO `show_order_details` VALUES (30, 14, 10, 32);
INSERT INTO `show_order_details` VALUES (31, 15, 10, 33);
INSERT INTO `show_order_details` VALUES (32, 16, 10, 31);
INSERT INTO `show_order_details` VALUES (33, 17, 10, 31);
INSERT INTO `show_order_details` VALUES (34, 18, 10, 33);
INSERT INTO `show_order_details` VALUES (35, 19, 10, 32);
INSERT INTO `show_order_details` VALUES (36, 20, 10, 29);
INSERT INTO `show_order_details` VALUES (37, 21, 10, 28);
INSERT INTO `show_order_details` VALUES (38, 22, 10, 34);
INSERT INTO `show_order_details` VALUES (39, 23, 10, 35);
INSERT INTO `show_order_details` VALUES (40, 24, 10, 36);
INSERT INTO `show_order_details` VALUES (41, 25, 10, 35);
INSERT INTO `show_order_details` VALUES (42, 26, 10, 36);
INSERT INTO `show_order_details` VALUES (43, 27, 10, 37);
INSERT INTO `show_order_details` VALUES (44, 28, 10, 38);
INSERT INTO `show_order_details` VALUES (45, 29, 4, 1);
INSERT INTO `show_order_details` VALUES (46, 30, 4, 2);
INSERT INTO `show_order_details` VALUES (47, 31, 4, 3);
INSERT INTO `show_order_details` VALUES (48, 32, 4, 4);
INSERT INTO `show_order_details` VALUES (49, 32, 4, 5);
INSERT INTO `show_order_details` VALUES (50, 32, 4, 6);
INSERT INTO `show_order_details` VALUES (51, 32, 4, 7);
INSERT INTO `show_order_details` VALUES (52, 33, 5, 1);
INSERT INTO `show_order_details` VALUES (53, 34, 5, 2);
INSERT INTO `show_order_details` VALUES (54, 35, 5, 3);
INSERT INTO `show_order_details` VALUES (55, 36, 5, 4);
INSERT INTO `show_order_details` VALUES (56, 37, 5, 5);
INSERT INTO `show_order_details` VALUES (57, 38, 5, 6);
INSERT INTO `show_order_details` VALUES (58, 39, 6, 1);
INSERT INTO `show_order_details` VALUES (59, 39, 6, 2);
INSERT INTO `show_order_details` VALUES (60, 39, 6, 3);
INSERT INTO `show_order_details` VALUES (61, 39, 6, 4);
INSERT INTO `show_order_details` VALUES (62, 39, 6, 5);
INSERT INTO `show_order_details` VALUES (63, 39, 6, 6);
INSERT INTO `show_order_details` VALUES (64, 39, 6, 7);
INSERT INTO `show_order_details` VALUES (65, 39, 6, 8);
INSERT INTO `show_order_details` VALUES (66, 39, 6, 9);
INSERT INTO `show_order_details` VALUES (67, 39, 6, 10);
INSERT INTO `show_order_details` VALUES (68, 39, 6, 11);
INSERT INTO `show_order_details` VALUES (69, 39, 6, 12);
INSERT INTO `show_order_details` VALUES (70, 39, 6, 13);
INSERT INTO `show_order_details` VALUES (71, 39, 6, 14);
INSERT INTO `show_order_details` VALUES (72, 39, 6, 15);
INSERT INTO `show_order_details` VALUES (73, 39, 6, 16);
INSERT INTO `show_order_details` VALUES (74, 39, 6, 17);
INSERT INTO `show_order_details` VALUES (75, 39, 6, 18);
INSERT INTO `show_order_details` VALUES (76, 39, 6, 19);
INSERT INTO `show_order_details` VALUES (77, 39, 6, 20);
INSERT INTO `show_order_details` VALUES (78, 39, 6, 21);
INSERT INTO `show_order_details` VALUES (79, 39, 6, 22);
INSERT INTO `show_order_details` VALUES (80, 39, 6, 23);
INSERT INTO `show_order_details` VALUES (81, 39, 6, 24);
INSERT INTO `show_order_details` VALUES (82, 39, 6, 25);
INSERT INTO `show_order_details` VALUES (83, 39, 6, 26);
INSERT INTO `show_order_details` VALUES (84, 39, 6, 27);
INSERT INTO `show_order_details` VALUES (85, 39, 6, 28);
INSERT INTO `show_order_details` VALUES (86, 39, 6, 29);
INSERT INTO `show_order_details` VALUES (87, 39, 6, 30);
INSERT INTO `show_order_details` VALUES (88, 40, 4, 7);
INSERT INTO `show_order_details` VALUES (89, 41, 4, 6);
INSERT INTO `show_order_details` VALUES (90, 42, 4, 5);
INSERT INTO `show_order_details` VALUES (91, 43, 4, 4);
INSERT INTO `show_order_details` VALUES (92, 44, 4, 3);
INSERT INTO `show_order_details` VALUES (93, 45, 4, 2);
INSERT INTO `show_order_details` VALUES (94, 45, 4, 1);
INSERT INTO `show_order_details` VALUES (95, 46, 4, 8);
INSERT INTO `show_order_details` VALUES (96, 46, 4, 9);
INSERT INTO `show_order_details` VALUES (97, 47, 4, 10);
INSERT INTO `show_order_details` VALUES (98, 47, 4, 11);
INSERT INTO `show_order_details` VALUES (99, 48, 4, 12);
INSERT INTO `show_order_details` VALUES (100, 48, 4, 13);
INSERT INTO `show_order_details` VALUES (101, 49, 4, 14);
INSERT INTO `show_order_details` VALUES (102, 50, 1, 1);
INSERT INTO `show_order_details` VALUES (103, 51, 1, 2);
INSERT INTO `show_order_details` VALUES (104, 52, 1, 3);
INSERT INTO `show_order_details` VALUES (105, 53, 2, 1);
INSERT INTO `show_order_details` VALUES (106, 53, 2, 2);
INSERT INTO `show_order_details` VALUES (107, 54, 1, 4);
INSERT INTO `show_order_details` VALUES (108, 55, 1, 5);
INSERT INTO `show_order_details` VALUES (109, 56, 1, 6);
INSERT INTO `show_order_details` VALUES (110, 57, 1, 7);
INSERT INTO `show_order_details` VALUES (111, 58, 1, 8);
INSERT INTO `show_order_details` VALUES (112, 59, 1, 9);
INSERT INTO `show_order_details` VALUES (113, 60, 1, 10);
INSERT INTO `show_order_details` VALUES (114, 61, 1, 11);
INSERT INTO `show_order_details` VALUES (115, 62, 1, 12);
INSERT INTO `show_order_details` VALUES (116, 63, 1, 13);
INSERT INTO `show_order_details` VALUES (117, 64, 1, 14);
INSERT INTO `show_order_details` VALUES (118, 65, 1, 15);
INSERT INTO `show_order_details` VALUES (119, 66, 1, 16);
INSERT INTO `show_order_details` VALUES (120, 67, 1, 17);
INSERT INTO `show_order_details` VALUES (121, 68, 2, 3);
INSERT INTO `show_order_details` VALUES (122, 69, 1, 1);
INSERT INTO `show_order_details` VALUES (123, 70, 1, 7);
INSERT INTO `show_order_details` VALUES (124, 71, 4, 14);
INSERT INTO `show_order_details` VALUES (125, 72, 1, 6);
INSERT INTO `show_order_details` VALUES (126, 73, 1, 5);
INSERT INTO `show_order_details` VALUES (127, 74, 11, 1);
INSERT INTO `show_order_details` VALUES (128, 74, 11, 2);
INSERT INTO `show_order_details` VALUES (129, 74, 11, 3);
INSERT INTO `show_order_details` VALUES (130, 74, 11, 4);
INSERT INTO `show_order_details` VALUES (131, 74, 11, 5);
INSERT INTO `show_order_details` VALUES (132, 74, 11, 6);
INSERT INTO `show_order_details` VALUES (133, 75, 2, 3);
INSERT INTO `show_order_details` VALUES (134, 75, 2, 2);
INSERT INTO `show_order_details` VALUES (135, 76, 2, 2);
INSERT INTO `show_order_details` VALUES (136, 76, 2, 3);
INSERT INTO `show_order_details` VALUES (137, 77, 2, 1);
INSERT INTO `show_order_details` VALUES (138, 77, 2, 4);
INSERT INTO `show_order_details` VALUES (139, 77, 2, 5);
INSERT INTO `show_order_details` VALUES (140, 78, 2, 6);
INSERT INTO `show_order_details` VALUES (141, 78, 2, 7);
INSERT INTO `show_order_details` VALUES (142, 78, 2, 8);
INSERT INTO `show_order_details` VALUES (143, 79, 2, 9);
INSERT INTO `show_order_details` VALUES (144, 79, 2, 10);
INSERT INTO `show_order_details` VALUES (145, 79, 2, 11);
INSERT INTO `show_order_details` VALUES (146, 80, 2, 12);
INSERT INTO `show_order_details` VALUES (147, 80, 2, 13);
INSERT INTO `show_order_details` VALUES (148, 80, 2, 14);
INSERT INTO `show_order_details` VALUES (149, 81, 2, 15);
INSERT INTO `show_order_details` VALUES (150, 81, 2, 16);
INSERT INTO `show_order_details` VALUES (151, 82, 2, 17);
INSERT INTO `show_order_details` VALUES (152, 82, 2, 18);
INSERT INTO `show_order_details` VALUES (153, 83, 2, 19);
INSERT INTO `show_order_details` VALUES (154, 83, 2, 20);
INSERT INTO `show_order_details` VALUES (155, 84, 2, 5);
INSERT INTO `show_order_details` VALUES (156, 84, 2, 4);
INSERT INTO `show_order_details` VALUES (157, 85, 2, 11);
INSERT INTO `show_order_details` VALUES (158, 85, 2, 10);
INSERT INTO `show_order_details` VALUES (159, 86, 2, 14);
INSERT INTO `show_order_details` VALUES (160, 86, 2, 13);
INSERT INTO `show_order_details` VALUES (161, 87, 2, 12);
INSERT INTO `show_order_details` VALUES (162, 87, 2, 9);
INSERT INTO `show_order_details` VALUES (163, 88, 2, 9);
INSERT INTO `show_order_details` VALUES (164, 88, 2, 12);
INSERT INTO `show_order_details` VALUES (165, 89, 1, 5);
INSERT INTO `show_order_details` VALUES (166, 90, 1, 6);
INSERT INTO `show_order_details` VALUES (167, 91, 1, 7);
INSERT INTO `show_order_details` VALUES (168, 92, 1, 1);
INSERT INTO `show_order_details` VALUES (169, 93, 1, 5);
INSERT INTO `show_order_details` VALUES (170, 94, 1, 17);
INSERT INTO `show_order_details` VALUES (171, 95, 4, 14);
INSERT INTO `show_order_details` VALUES (172, 96, 4, 13);
INSERT INTO `show_order_details` VALUES (173, 97, 4, 14);
INSERT INTO `show_order_details` VALUES (174, 97, 4, 12);
INSERT INTO `show_order_details` VALUES (175, 98, 1, 5);
INSERT INTO `show_order_details` VALUES (176, 99, 1, 1);
INSERT INTO `show_order_details` VALUES (177, 100, 2, 12);
INSERT INTO `show_order_details` VALUES (178, 101, 3, 1);
INSERT INTO `show_order_details` VALUES (179, 102, 3, 2);
INSERT INTO `show_order_details` VALUES (180, 103, 1, 7);
INSERT INTO `show_order_details` VALUES (181, 104, 5, 6);
INSERT INTO `show_order_details` VALUES (182, 104, 5, 5);
INSERT INTO `show_order_details` VALUES (183, 105, 5, 4);
INSERT INTO `show_order_details` VALUES (184, 105, 5, 3);
INSERT INTO `show_order_details` VALUES (185, 106, 4, 12);
INSERT INTO `show_order_details` VALUES (186, 107, 5, 5);
INSERT INTO `show_order_details` VALUES (187, 108, 6, 30);
INSERT INTO `show_order_details` VALUES (188, 109, 1, 1);
INSERT INTO `show_order_details` VALUES (189, 110, 1, 5);
INSERT INTO `show_order_details` VALUES (190, 111, 1, 6);
INSERT INTO `show_order_details` VALUES (191, 112, 3, 1);
INSERT INTO `show_order_details` VALUES (192, 112, 3, 3);
INSERT INTO `show_order_details` VALUES (193, 112, 3, 4);
INSERT INTO `show_order_details` VALUES (194, 112, 3, 5);
INSERT INTO `show_order_details` VALUES (195, 112, 3, 6);
INSERT INTO `show_order_details` VALUES (196, 112, 3, 7);
INSERT INTO `show_order_details` VALUES (197, 113, 1, 5);
INSERT INTO `show_order_details` VALUES (198, 114, 1, 1);
INSERT INTO `show_order_details` VALUES (199, 115, 3, 8);
INSERT INTO `show_order_details` VALUES (200, 115, 3, 9);
INSERT INTO `show_order_details` VALUES (201, 115, 3, 10);
INSERT INTO `show_order_details` VALUES (202, 115, 3, 11);
INSERT INTO `show_order_details` VALUES (203, 115, 3, 12);
INSERT INTO `show_order_details` VALUES (204, 115, 3, 13);
INSERT INTO `show_order_details` VALUES (205, 116, 2, 9);
INSERT INTO `show_order_details` VALUES (206, 117, 1, 1);
INSERT INTO `show_order_details` VALUES (207, 118, 1, 1);
INSERT INTO `show_order_details` VALUES (208, 119, 7, 1);
INSERT INTO `show_order_details` VALUES (209, 120, 2, 9);
INSERT INTO `show_order_details` VALUES (210, 120, 2, 13);
INSERT INTO `show_order_details` VALUES (211, 121, 1, 1);
INSERT INTO `show_order_details` VALUES (212, 122, 1, 1);
INSERT INTO `show_order_details` VALUES (213, 123, 2, 13);
INSERT INTO `show_order_details` VALUES (214, 123, 2, 9);
INSERT INTO `show_order_details` VALUES (215, 123, 2, 14);
INSERT INTO `show_order_details` VALUES (216, 124, 17, 1);
INSERT INTO `show_order_details` VALUES (217, 124, 17, 2);
INSERT INTO `show_order_details` VALUES (218, 125, 17, 3);
INSERT INTO `show_order_details` VALUES (219, 125, 17, 4);
INSERT INTO `show_order_details` VALUES (220, 126, 10, 38);
INSERT INTO `show_order_details` VALUES (221, 126, 10, 37);
INSERT INTO `show_order_details` VALUES (222, 127, 10, 36);
INSERT INTO `show_order_details` VALUES (223, 127, 10, 35);
INSERT INTO `show_order_details` VALUES (224, 128, 7, 1);
INSERT INTO `show_order_details` VALUES (225, 129, 8, 1);
INSERT INTO `show_order_details` VALUES (226, 130, 5, 5);
INSERT INTO `show_order_details` VALUES (227, 131, 5, 6);
INSERT INTO `show_order_details` VALUES (228, 132, 1, 5);
INSERT INTO `show_order_details` VALUES (229, 133, 1, 6);
INSERT INTO `show_order_details` VALUES (230, 134, 1, 16);
INSERT INTO `show_order_details` VALUES (231, 135, 1, 15);
INSERT INTO `show_order_details` VALUES (232, 136, 1, 14);
INSERT INTO `show_order_details` VALUES (233, 137, 20, 1);
INSERT INTO `show_order_details` VALUES (234, 138, 5, 6);
INSERT INTO `show_order_details` VALUES (235, 139, 10, 35);
INSERT INTO `show_order_details` VALUES (236, 140, 10, 36);
INSERT INTO `show_order_details` VALUES (237, 141, 11, 6);
INSERT INTO `show_order_details` VALUES (238, 142, 6, 30);
INSERT INTO `show_order_details` VALUES (239, 143, 5, 6);
INSERT INTO `show_order_details` VALUES (240, 144, 8, 1);
INSERT INTO `show_order_details` VALUES (241, 145, 1, 15);
INSERT INTO `show_order_details` VALUES (242, 146, 5, 6);
INSERT INTO `show_order_details` VALUES (243, 147, 1, 16);
INSERT INTO `show_order_details` VALUES (244, 148, 1, 15);
INSERT INTO `show_order_details` VALUES (245, 148, 1, 6);
INSERT INTO `show_order_details` VALUES (246, 149, 4, 12);
INSERT INTO `show_order_details` VALUES (247, 150, 2, 14);
INSERT INTO `show_order_details` VALUES (248, 151, 5, 6);
INSERT INTO `show_order_details` VALUES (249, 151, 5, 5);
INSERT INTO `show_order_details` VALUES (250, 151, 5, 2);
INSERT INTO `show_order_details` VALUES (251, 151, 5, 1);
INSERT INTO `show_order_details` VALUES (252, 151, 5, 7);
INSERT INTO `show_order_details` VALUES (253, 151, 5, 8);
INSERT INTO `show_order_details` VALUES (254, 152, 5, 9);
INSERT INTO `show_order_details` VALUES (255, 152, 5, 10);
INSERT INTO `show_order_details` VALUES (256, 152, 5, 11);
INSERT INTO `show_order_details` VALUES (257, 152, 5, 12);
INSERT INTO `show_order_details` VALUES (258, 152, 5, 13);
INSERT INTO `show_order_details` VALUES (259, 152, 5, 14);
INSERT INTO `show_order_details` VALUES (260, 153, 56, 1);
INSERT INTO `show_order_details` VALUES (261, 153, 56, 2);
INSERT INTO `show_order_details` VALUES (262, 154, 56, 3);
INSERT INTO `show_order_details` VALUES (263, 154, 56, 4);
INSERT INTO `show_order_details` VALUES (264, 155, 2, 9);
INSERT INTO `show_order_details` VALUES (265, 155, 2, 13);
INSERT INTO `show_order_details` VALUES (266, 155, 2, 10);
INSERT INTO `show_order_details` VALUES (267, 156, 10, 1);
INSERT INTO `show_order_details` VALUES (268, 156, 10, 36);
INSERT INTO `show_order_details` VALUES (269, 156, 10, 35);
INSERT INTO `show_order_details` VALUES (270, 156, 10, 37);
INSERT INTO `show_order_details` VALUES (271, 156, 10, 38);
INSERT INTO `show_order_details` VALUES (272, 156, 10, 39);
INSERT INTO `show_order_details` VALUES (273, 156, 10, 40);
INSERT INTO `show_order_details` VALUES (274, 156, 10, 41);
INSERT INTO `show_order_details` VALUES (275, 156, 10, 42);
INSERT INTO `show_order_details` VALUES (276, 156, 10, 43);
INSERT INTO `show_order_details` VALUES (277, 157, 8, 1);
INSERT INTO `show_order_details` VALUES (278, 157, 8, 2);
INSERT INTO `show_order_details` VALUES (279, 158, 8, 3);
INSERT INTO `show_order_details` VALUES (280, 158, 8, 4);

-- ----------------------------
-- Table structure for show_ticket
-- ----------------------------
DROP TABLE IF EXISTS `show_ticket`;
CREATE TABLE `show_ticket`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `show_id` int(11) NULL DEFAULT NULL COMMENT '演出信息ID',
  `level` int(11) NULL DEFAULT NULL COMMENT '座位区域 1.A区 2.B区 3.C区',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '票价',
  `stock` int(11) NULL DEFAULT NULL COMMENT '余票数量',
  `state` int(1) NULL DEFAULT NULL COMMENT '状态 1.已上架 0.未上架',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '演出门票表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of show_ticket
-- ----------------------------
INSERT INTO `show_ticket` VALUES (1, 1, 1, 99.00, 96, 1);
INSERT INTO `show_ticket` VALUES (2, 1, 2, 199.00, 96, 1);
INSERT INTO `show_ticket` VALUES (3, 1, 3, 299.00, 99, 1);
INSERT INTO `show_ticket` VALUES (4, 2, 1, 99.00, 98, 1);
INSERT INTO `show_ticket` VALUES (5, 2, 2, 199.00, 92, 1);
INSERT INTO `show_ticket` VALUES (6, 2, 3, 299.00, 128, 1);
INSERT INTO `show_ticket` VALUES (7, 3, 1, 99.00, 99, 1);
INSERT INTO `show_ticket` VALUES (8, 3, 2, 199.00, 98, 1);
INSERT INTO `show_ticket` VALUES (9, 3, 3, 299.00, 100, 1);
INSERT INTO `show_ticket` VALUES (10, 4, 1, 99.00, 94, 1);
INSERT INTO `show_ticket` VALUES (11, 4, 2, 199.00, 105, 1);
INSERT INTO `show_ticket` VALUES (12, 4, 3, 299.00, 100, 1);
INSERT INTO `show_ticket` VALUES (13, 5, 1, 99.00, 100, 1);
INSERT INTO `show_ticket` VALUES (14, 5, 2, 199.00, 100, 1);
INSERT INTO `show_ticket` VALUES (15, 5, 3, 299.00, 100, 1);
INSERT INTO `show_ticket` VALUES (16, 6, 1, 99.00, 100, 1);
INSERT INTO `show_ticket` VALUES (17, 6, 2, 199.00, 100, 1);
INSERT INTO `show_ticket` VALUES (18, 6, 3, 299.00, 100, 1);
INSERT INTO `show_ticket` VALUES (19, 7, 1, 99.00, 100, 1);
INSERT INTO `show_ticket` VALUES (20, 7, 2, 199.00, 100, 1);
INSERT INTO `show_ticket` VALUES (21, 7, 3, 299.00, 100, 1);
INSERT INTO `show_ticket` VALUES (22, 8, 1, 99.00, 100, 1);
INSERT INTO `show_ticket` VALUES (23, 8, 2, 199.00, 100, 1);
INSERT INTO `show_ticket` VALUES (24, 8, 3, 299.00, 100, 1);
INSERT INTO `show_ticket` VALUES (25, 9, 1, 99.00, 100, 1);
INSERT INTO `show_ticket` VALUES (26, 9, 2, 199.00, 100, 1);
INSERT INTO `show_ticket` VALUES (27, 9, 3, 299.00, 100, 1);
INSERT INTO `show_ticket` VALUES (28, 10, 1, 99.00, 100, 1);
INSERT INTO `show_ticket` VALUES (29, 10, 2, 199.00, 100, 1);
INSERT INTO `show_ticket` VALUES (30, 10, 3, 299.00, 100, 1);
INSERT INTO `show_ticket` VALUES (31, 11, 1, 99.00, 100, 1);
INSERT INTO `show_ticket` VALUES (32, 11, 2, 199.00, 100, 1);
INSERT INTO `show_ticket` VALUES (33, 11, 3, 299.00, 100, 1);
INSERT INTO `show_ticket` VALUES (34, 12, 1, 11.00, 11, 1);
INSERT INTO `show_ticket` VALUES (35, 12, 2, 11.00, 11, 1);
INSERT INTO `show_ticket` VALUES (36, 12, 3, 11.00, 11, 1);
INSERT INTO `show_ticket` VALUES (37, 13, 1, 11.00, 11, 1);
INSERT INTO `show_ticket` VALUES (38, 13, 2, 11.00, 11, 1);
INSERT INTO `show_ticket` VALUES (39, 13, 3, 11.00, 11, 1);
INSERT INTO `show_ticket` VALUES (40, 14, 1, 100.00, 100, 1);
INSERT INTO `show_ticket` VALUES (41, 14, 2, 200.00, 100, 1);
INSERT INTO `show_ticket` VALUES (42, 14, 3, 300.00, 100, 1);
INSERT INTO `show_ticket` VALUES (43, 15, 1, 100.00, 100, 1);
INSERT INTO `show_ticket` VALUES (44, 15, 2, 200.00, 100, 1);
INSERT INTO `show_ticket` VALUES (45, 15, 3, 300.00, 100, 1);
INSERT INTO `show_ticket` VALUES (46, 16, 1, 99.00, 100, 1);
INSERT INTO `show_ticket` VALUES (47, 16, 2, 199.00, 100, 1);
INSERT INTO `show_ticket` VALUES (48, 16, 3, 299.00, 50, 1);
INSERT INTO `show_ticket` VALUES (49, 21, 1, 20.00, 10, 1);
INSERT INTO `show_ticket` VALUES (50, 21, 2, 30.00, 12, 1);
INSERT INTO `show_ticket` VALUES (51, 21, 3, 40.00, 15, 1);
INSERT INTO `show_ticket` VALUES (52, 22, 1, 100.00, 20, 1);
INSERT INTO `show_ticket` VALUES (53, 22, 2, 200.00, 30, 1);
INSERT INTO `show_ticket` VALUES (54, 22, 3, 300.00, 40, 1);
INSERT INTO `show_ticket` VALUES (55, 23, 1, 50.00, 30, 1);
INSERT INTO `show_ticket` VALUES (56, 23, 2, 80.00, 28, 1);
INSERT INTO `show_ticket` VALUES (57, 23, 3, 100.00, 30, 1);
INSERT INTO `show_ticket` VALUES (58, 24, 1, 99.00, 100, 1);
INSERT INTO `show_ticket` VALUES (59, 24, 2, 199.00, 100, 1);
INSERT INTO `show_ticket` VALUES (60, 24, 3, 299.00, 100, 1);

-- ----------------------------
-- Table structure for show_type
-- ----------------------------
DROP TABLE IF EXISTS `show_type`;
CREATE TABLE `show_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '演出类别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '演出类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of show_type
-- ----------------------------
INSERT INTO `show_type` VALUES (1, '演唱会');
INSERT INTO `show_type` VALUES (2, '话剧歌剧');
INSERT INTO `show_type` VALUES (3, '戏曲艺术');
INSERT INTO `show_type` VALUES (4, '亲子演出');
INSERT INTO `show_type` VALUES (5, '舞蹈芭蕾');
INSERT INTO `show_type` VALUES (6, '体育赛事');
INSERT INTO `show_type` VALUES (7, '音乐会');
INSERT INTO `show_type` VALUES (8, '其它');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员',
  `operation` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NULL DEFAULT NULL COMMENT '执行时长（毫秒）',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 377 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (175, '张三', '用户登录', 'appUserLogin', '[{\"pwd\":\"123456\",\"phone\":\"18809461303\"}]', 539, '192.168.10.66', '2020-06-30 10:53:18');
INSERT INTO `sys_log` VALUES (178, '张三', '用户登录', 'appUserLogin', '[{\"pwd\":\"123456\",\"phone\":\"18809461303\"}]', 78, '192.168.10.66', '2020-06-30 10:59:03');
INSERT INTO `sys_log` VALUES (216, '王五', '用户登录', 'appUserLogin', '[{\"pwd\":\"123456\",\"phone\":\"18808246077\"}]', 21, '0:0:0:0:0:0:0:1', '2020-07-04 17:38:58');
INSERT INTO `sys_log` VALUES (217, '王五', '用户登录', 'appUserLogin', '[{\"pwd\":\"123456\",\"phone\":\"18808246077\"}]', 134, '0:0:0:0:0:0:0:1', '2020-07-04 17:43:59');
INSERT INTO `sys_log` VALUES (221, '王五', '用户登录', 'appUserLogin', '[{\"pwd\":\"123456\",\"phone\":\"18808246077\"}]', 19, '0:0:0:0:0:0:0:1', '2020-07-04 17:47:53');
INSERT INTO `sys_log` VALUES (222, '王五', '用户登录', 'appUserLogin', '[{\"pwd\":\"123456\",\"phone\":\"18808246077\"}]', 1643, '0:0:0:0:0:0:0:1', '2020-07-04 17:50:34');
INSERT INTO `sys_log` VALUES (223, '王五', '用户登录', 'appUserLogin', '[{\"pwd\":\"123456\",\"phone\":\"18808246077\"}]', 1687, '0:0:0:0:0:0:0:1', '2020-07-04 17:54:18');
INSERT INTO `sys_log` VALUES (272, 'admin', '批量删除日志', 'deleteBatchSysLogs', '[[10,14,100,118,185,194,195,196,197,198,210,211,212,213,219,269,270,271]]', 38, '0:0:0:0:0:0:0:1', '2020-07-06 19:03:39');
INSERT INTO `sys_log` VALUES (273, '赵六', '用户登录', 'appUserLogin', '[Ljava.lang.Object;@33e56aff', 792, '0:0:0:0:0:0:0:1', '2020-07-06 19:13:33');
INSERT INTO `sys_log` VALUES (274, '赵六', '用户登录', 'appUserLogin', '[Ljava.lang.Object;@7c5a1d06', 665, '0:0:0:0:0:0:0:1', '2020-07-06 19:19:52');
INSERT INTO `sys_log` VALUES (275, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 39, '0:0:0:0:0:0:0:1', '2020-07-06 19:20:39');
INSERT INTO `sys_log` VALUES (276, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 755, '127.0.0.1', '2020-07-06 20:42:13');
INSERT INTO `sys_log` VALUES (277, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 701, '0:0:0:0:0:0:0:1', '2020-07-07 10:10:13');
INSERT INTO `sys_log` VALUES (278, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 464, '192.168.10.66', '2020-07-07 10:25:58');
INSERT INTO `sys_log` VALUES (279, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 117, '192.168.10.66', '2020-07-07 10:29:44');
INSERT INTO `sys_log` VALUES (280, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 23, '192.168.10.66', '2020-07-07 10:30:36');
INSERT INTO `sys_log` VALUES (281, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 31, '192.168.10.66', '2020-07-07 10:30:47');
INSERT INTO `sys_log` VALUES (282, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 28, '192.168.10.66', '2020-07-07 10:31:16');
INSERT INTO `sys_log` VALUES (283, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 19, '192.168.10.66', '2020-07-07 10:31:45');
INSERT INTO `sys_log` VALUES (284, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 113, '127.0.0.1', '2020-07-07 10:39:25');
INSERT INTO `sys_log` VALUES (285, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 30, '127.0.0.1', '2020-07-07 10:41:01');
INSERT INTO `sys_log` VALUES (286, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 31, '127.0.0.1', '2020-07-07 10:44:46');
INSERT INTO `sys_log` VALUES (287, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 23, '192.168.10.66', '2020-07-07 10:45:52');
INSERT INTO `sys_log` VALUES (288, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 31, '192.168.10.66', '2020-07-07 10:47:28');
INSERT INTO `sys_log` VALUES (289, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 522, '192.168.10.66', '2020-07-07 10:54:59');
INSERT INTO `sys_log` VALUES (290, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 42, '192.168.10.66', '2020-07-07 10:56:09');
INSERT INTO `sys_log` VALUES (291, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 499, '192.168.10.66', '2020-07-07 10:58:17');
INSERT INTO `sys_log` VALUES (292, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 122, '192.168.10.66', '2020-07-07 11:01:03');
INSERT INTO `sys_log` VALUES (293, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 34, '192.168.10.66', '2020-07-07 11:09:18');
INSERT INTO `sys_log` VALUES (294, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 26, '192.168.10.66', '2020-07-07 11:15:56');
INSERT INTO `sys_log` VALUES (295, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 15, '127.0.0.1', '2020-07-07 11:16:43');
INSERT INTO `sys_log` VALUES (296, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 17, '127.0.0.1', '2020-07-07 11:17:19');
INSERT INTO `sys_log` VALUES (297, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 27, '192.168.10.66', '2020-07-07 11:19:13');
INSERT INTO `sys_log` VALUES (298, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 27, '192.168.10.66', '2020-07-07 11:20:55');
INSERT INTO `sys_log` VALUES (299, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 22, '192.168.10.66', '2020-07-07 11:21:25');
INSERT INTO `sys_log` VALUES (300, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 16, '192.168.10.66', '2020-07-07 11:22:10');
INSERT INTO `sys_log` VALUES (301, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 30, '192.168.10.66', '2020-07-07 11:23:16');
INSERT INTO `sys_log` VALUES (302, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 25, '192.168.10.66', '2020-07-07 11:38:48');
INSERT INTO `sys_log` VALUES (303, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 109, '192.168.10.66', '2020-07-07 11:44:21');
INSERT INTO `sys_log` VALUES (304, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 31, '192.168.10.66', '2020-07-07 11:45:40');
INSERT INTO `sys_log` VALUES (305, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 24, '192.168.10.66', '2020-07-07 11:47:38');
INSERT INTO `sys_log` VALUES (306, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 33, '192.168.10.66', '2020-07-07 11:55:42');
INSERT INTO `sys_log` VALUES (307, '赵六', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123456\', phone=\'18808246078\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 101, '0:0:0:0:0:0:0:1', '2020-07-07 12:06:04');
INSERT INTO `sys_log` VALUES (308, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 545, '192.168.10.66', '2020-07-07 14:06:00');
INSERT INTO `sys_log` VALUES (309, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 30, '0:0:0:0:0:0:0:1', '2020-07-07 14:06:19');
INSERT INTO `sys_log` VALUES (310, '张三', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123456\', phone=\'18809461303\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 682, '192.168.137.1', '2020-07-07 15:29:40');
INSERT INTO `sys_log` VALUES (311, '张三', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123456\', phone=\'18809461303\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 100, '192.168.137.1', '2020-07-07 15:31:30');
INSERT INTO `sys_log` VALUES (312, '教规川', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'zmj12345_\', phone=\'13830808888\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 19, '192.168.137.1', '2020-07-07 16:43:25');
INSERT INTO `sys_log` VALUES (313, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 174, '0:0:0:0:0:0:0:1', '2020-07-07 17:07:53');
INSERT INTO `sys_log` VALUES (314, '张三', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123456\', phone=\'18280004413\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 989, '192.168.10.77', '2020-07-07 20:41:31');
INSERT INTO `sys_log` VALUES (315, '纸烤纽', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123321000qqq\', phone=\'18809381238\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 6, '192.168.10.77', '2020-07-07 20:48:49');
INSERT INTO `sys_log` VALUES (316, '张三', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123456\', phone=\'18280004413\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 19, '192.168.10.77', '2020-07-07 21:00:03');
INSERT INTO `sys_log` VALUES (317, '张三', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123456\', phone=\'18280004413\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 3, '192.168.10.77', '2020-07-07 21:06:18');
INSERT INTO `sys_log` VALUES (318, '张三', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123456\', phone=\'18280004413\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 5, '192.168.10.77', '2020-07-07 21:07:20');
INSERT INTO `sys_log` VALUES (319, '张三', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123456\', phone=\'18280004413\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 2032, '192.168.10.77', '2020-07-07 22:38:45');
INSERT INTO `sys_log` VALUES (320, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 170, '192.168.10.120', '2020-07-08 09:30:06');
INSERT INTO `sys_log` VALUES (321, NULL, '管理员登录', 'login', '[\"18280004413\",\"123456\"]', 16, '192.168.10.120', '2020-07-08 09:36:45');
INSERT INTO `sys_log` VALUES (322, NULL, '管理员登录', 'login', '[\"18280004413\",\"123456\"]', 4, '192.168.10.120', '2020-07-08 09:37:03');
INSERT INTO `sys_log` VALUES (323, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 23, '192.168.10.120', '2020-07-08 09:37:17');
INSERT INTO `sys_log` VALUES (324, '张三', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123456\', phone=\'18280004413\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 1436, '192.168.10.120', '2020-07-08 10:04:50');
INSERT INTO `sys_log` VALUES (325, '张三', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123456\', phone=\'18280004413\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 107, '192.168.10.120', '2020-07-08 10:45:50');
INSERT INTO `sys_log` VALUES (326, '张三', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123456\', phone=\'18280004413\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 47, '192.168.10.120', '2020-07-08 11:48:42');
INSERT INTO `sys_log` VALUES (327, '张三', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123456\', phone=\'18280004413\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 62, '192.168.10.120', '2020-07-08 12:51:05');
INSERT INTO `sys_log` VALUES (328, '张三', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123456\', phone=\'18280004413\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 32, '192.168.10.120', '2020-07-08 15:23:43');
INSERT INTO `sys_log` VALUES (329, '张三', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123456\', phone=\'18280004413\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 32, '192.168.10.120', '2020-07-08 16:50:55');
INSERT INTO `sys_log` VALUES (330, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 219, '192.168.10.120', '2020-07-08 17:01:36');
INSERT INTO `sys_log` VALUES (331, 'admin', '增加角色', 'addRole', '[{\"id\":8,\"name\":\"ceshi\",\"creator\":\"admin\",\"status\":0,\"remarks\":\"test\"}]', 186, '192.168.10.120', '2020-07-08 17:03:18');
INSERT INTO `sys_log` VALUES (332, 'admin', '删除管理员', 'deleteAdmin', '[5]', 8, '192.168.10.120', '2020-07-08 17:04:40');
INSERT INTO `sys_log` VALUES (333, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 693, '192.168.10.120', '2020-07-14 12:01:01');
INSERT INTO `sys_log` VALUES (334, '张三', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123456\', phone=\'18280004413\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 1742, '192.168.10.120', '2020-07-14 12:15:13');
INSERT INTO `sys_log` VALUES (335, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 442, '0:0:0:0:0:0:0:1', '2020-07-17 13:08:20');
INSERT INTO `sys_log` VALUES (336, '张三', '用户登录', 'appUserLogin', 'User{id=null, salt=\'null\', name=\'null\', pwd=\'123456\', phone=\'18280004413\', email=\'null\', image=\'null\', sex=null, address=null, money=null, isCertification=null, status=null, createdTime=null}', 648, '192.168.2.132', '2020-07-17 13:14:41');
INSERT INTO `sys_log` VALUES (337, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 269, '192.168.2.122', '2020-07-22 19:33:20');
INSERT INTO `sys_log` VALUES (338, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 148, '192.168.2.122', '2020-07-22 20:38:52');
INSERT INTO `sys_log` VALUES (339, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 27, '192.168.2.122', '2020-07-22 20:39:35');
INSERT INTO `sys_log` VALUES (340, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 126, '192.168.2.122', '2020-07-22 20:42:20');
INSERT INTO `sys_log` VALUES (341, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 33, '192.168.2.122', '2020-07-22 20:44:21');
INSERT INTO `sys_log` VALUES (342, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 16, '192.168.2.122', '2020-07-22 20:44:58');
INSERT INTO `sys_log` VALUES (343, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 26, '192.168.2.122', '2020-07-22 20:45:52');
INSERT INTO `sys_log` VALUES (344, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 25, '192.168.2.122', '2020-07-22 20:46:30');
INSERT INTO `sys_log` VALUES (345, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 106, '192.168.2.122', '2020-07-22 20:58:54');
INSERT INTO `sys_log` VALUES (346, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 38, '0:0:0:0:0:0:0:1', '2020-07-22 21:08:49');
INSERT INTO `sys_log` VALUES (347, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 129, '0:0:0:0:0:0:0:1', '2020-07-22 21:10:36');
INSERT INTO `sys_log` VALUES (348, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 109, '192.168.2.133', '2020-07-23 09:48:45');
INSERT INTO `sys_log` VALUES (349, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 25, '192.168.2.133', '2020-07-23 09:49:07');
INSERT INTO `sys_log` VALUES (350, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 72, '192.168.2.133', '2020-07-23 09:55:10');
INSERT INTO `sys_log` VALUES (351, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 56, '0:0:0:0:0:0:0:1', '2020-07-23 09:58:20');
INSERT INTO `sys_log` VALUES (352, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 21, '192.168.2.133', '2020-07-23 10:02:28');
INSERT INTO `sys_log` VALUES (353, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 109, '192.168.2.133', '2020-07-23 10:13:15');
INSERT INTO `sys_log` VALUES (354, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 30, '192.168.2.133', '2020-07-23 10:15:16');
INSERT INTO `sys_log` VALUES (355, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 48, '192.168.2.133', '2020-07-23 11:11:00');
INSERT INTO `sys_log` VALUES (356, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 118, '192.168.2.133', '2020-07-23 11:13:27');
INSERT INTO `sys_log` VALUES (357, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 17, '192.168.2.133', '2020-07-23 11:13:49');
INSERT INTO `sys_log` VALUES (358, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 34, '192.168.2.133', '2020-07-23 11:14:20');
INSERT INTO `sys_log` VALUES (359, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 23, '192.168.2.133', '2020-07-23 11:15:41');
INSERT INTO `sys_log` VALUES (360, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 21, '192.168.2.133', '2020-07-23 11:20:47');
INSERT INTO `sys_log` VALUES (361, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 18, '192.168.2.133', '2020-07-23 11:27:00');
INSERT INTO `sys_log` VALUES (362, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 18, '192.168.2.133', '2020-07-23 11:27:51');
INSERT INTO `sys_log` VALUES (363, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 30, '192.168.2.133', '2020-07-23 11:28:38');
INSERT INTO `sys_log` VALUES (364, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 112, '192.168.2.133', '2020-07-23 11:30:11');
INSERT INTO `sys_log` VALUES (365, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 35, '192.168.2.133', '2020-07-23 11:31:00');
INSERT INTO `sys_log` VALUES (366, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 27, '192.168.2.133', '2020-07-23 11:33:22');
INSERT INTO `sys_log` VALUES (367, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 21, '192.168.2.133', '2020-07-23 11:36:48');
INSERT INTO `sys_log` VALUES (368, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 127, '192.168.2.133', '2020-07-23 11:43:17');
INSERT INTO `sys_log` VALUES (369, 'admin', '删除用户', 'delUser', '[16]', 27, '192.168.2.133', '2020-07-23 11:57:45');
INSERT INTO `sys_log` VALUES (370, 'admin', '删除用户', 'delUser', '[15]', 26, '192.168.2.133', '2020-07-23 11:57:48');
INSERT INTO `sys_log` VALUES (371, 'admin', '删除用户', 'delUser', '[14]', 9, '192.168.2.133', '2020-07-23 11:57:51');
INSERT INTO `sys_log` VALUES (372, 'admin', '删除用户', 'delUser', '[13]', 8, '192.168.2.133', '2020-07-23 11:57:57');
INSERT INTO `sys_log` VALUES (373, 'admin', '删除用户', 'delUser', '[12]', 8, '192.168.2.133', '2020-07-23 11:58:01');
INSERT INTO `sys_log` VALUES (374, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 103, '192.168.2.133', '2020-07-23 15:11:54');
INSERT INTO `sys_log` VALUES (375, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 756, '192.168.2.133', '2020-07-23 16:56:25');
INSERT INTO `sys_log` VALUES (376, 'admin', '管理员登录', 'login', '[\"admin\",\"123456\"]', 781, '192.168.2.133', '2020-07-23 17:14:10');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL COMMENT '父类菜单ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应地址',
  `open` int(11) NULL DEFAULT NULL COMMENT '是否展开 0.否 1.是',
  `fontFamily` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图表类型',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, NULL, '蜗牛票务管理系统', NULL, 0, 'k-icon', '&#xe654;');
INSERT INTO `sys_menu` VALUES (2, 1, '系统管理', NULL, 0, 'k-icon', '&#xe68a;');
INSERT INTO `sys_menu` VALUES (4, 1, '演出管理', NULL, 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (5, 1, '周边商城管理', NULL, 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (6, 2, '管理员列表', '/adminservice/Admin_Management.do', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (7, 2, '角色管理', '/adminservice/Role_Management.do', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (9, 1, '日志管理', '', 0, 'k-icon', '&#xe62e;');
INSERT INTO `sys_menu` VALUES (13, 4, '列表管理', '', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (14, 5, '商品管理', '/goodsservice/toGoodsListPage.do', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (22, 5, '商品类型管理', '/goodsservice/toGoodsTypeListPage.do', 0, 'k-icon', '&#xe62e;');
INSERT INTO `sys_menu` VALUES (23, 5, '商品订单管理', '/goodsservice/toGoodsOrderListPage.do', 0, 'k-icon', '&#xe62e;');
INSERT INTO `sys_menu` VALUES (24, 1, '投诉管理', NULL, 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (25, 24, '投诉列表', '/adminservice/Complaint_Management.do', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (31, 1, '用户管理', '', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (41, 2, '修改密码', '/adminservice/Modify_Password.do', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (42, 9, '系统操作日志', '/adminservice/SysLog_Manage.do', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (43, 9, '用户登录日志', '/adminservice/UserLoginLog_Manage.do', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (44, 31, '用户列表', '/adminservice/User_Management.do', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (49, 24, '投诉分布', '/adminservice/ComplaintPieReport.do', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (50, 24, '投诉对比', '/adminservice/ComplaintBarReport.do', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (51, 13, '演出列表', '/showservice/showInfos', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (52, 13, '添加演出', '/showservice/addShow', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (53, 13, '图片管理', '/showservice/showImages', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (54, 4, '订单管理', '', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (55, 54, '订单列表', '/showservice/orderList', 0, 'k-icon', '&#xe69b;');
INSERT INTO `sys_menu` VALUES (56, 54, '退款', '/showservice/toOrderRefund', 0, 'k-icon', '&#xe69b;');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态 0启用，1停用',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `remarks` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表role（超管，电影院，周边商城，演出）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 0, '张三', '2020-06-01 13:58:32', '所有权限拥有者', '2020-06-16 17:31:53');
INSERT INTO `sys_role` VALUES (3, '演出管理员', 0, '张三', '2020-06-01 13:58:40', '负责演出', '2020-06-12 17:32:00');
INSERT INTO `sys_role` VALUES (5, '周边商城管理员', 0, '张三', '2020-06-01 13:58:44', '负责商城', '2020-06-05 17:32:04');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NULL DEFAULT NULL COMMENT '菜单ID',
  `rid` int(11) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单中间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2, 1);
INSERT INTO `sys_role_menu` VALUES (4, 4, 1);
INSERT INTO `sys_role_menu` VALUES (5, 5, 1);
INSERT INTO `sys_role_menu` VALUES (6, 6, 1);
INSERT INTO `sys_role_menu` VALUES (7, 7, 1);
INSERT INTO `sys_role_menu` VALUES (9, 9, 1);
INSERT INTO `sys_role_menu` VALUES (10, 11, 1);
INSERT INTO `sys_role_menu` VALUES (12, 13, 1);
INSERT INTO `sys_role_menu` VALUES (13, 14, 1);
INSERT INTO `sys_role_menu` VALUES (14, 16, 1);
INSERT INTO `sys_role_menu` VALUES (15, 17, 1);
INSERT INTO `sys_role_menu` VALUES (16, 19, 1);
INSERT INTO `sys_role_menu` VALUES (17, 20, 1);
INSERT INTO `sys_role_menu` VALUES (18, 22, 1);
INSERT INTO `sys_role_menu` VALUES (19, 23, 1);
INSERT INTO `sys_role_menu` VALUES (25, 1, 3);
INSERT INTO `sys_role_menu` VALUES (26, 4, 3);
INSERT INTO `sys_role_menu` VALUES (27, 13, 3);
INSERT INTO `sys_role_menu` VALUES (28, 19, 3);
INSERT INTO `sys_role_menu` VALUES (29, 20, 3);
INSERT INTO `sys_role_menu` VALUES (30, 1, 5);
INSERT INTO `sys_role_menu` VALUES (31, 5, 5);
INSERT INTO `sys_role_menu` VALUES (32, 14, 5);
INSERT INTO `sys_role_menu` VALUES (33, 22, 5);
INSERT INTO `sys_role_menu` VALUES (34, 23, 5);
INSERT INTO `sys_role_menu` VALUES (35, 24, 1);
INSERT INTO `sys_role_menu` VALUES (36, 25, 1);
INSERT INTO `sys_role_menu` VALUES (38, 27, 1);
INSERT INTO `sys_role_menu` VALUES (39, 28, 1);
INSERT INTO `sys_role_menu` VALUES (40, 29, 1);
INSERT INTO `sys_role_menu` VALUES (42, 31, 1);
INSERT INTO `sys_role_menu` VALUES (43, 33, 1);
INSERT INTO `sys_role_menu` VALUES (57, 24, 3);
INSERT INTO `sys_role_menu` VALUES (58, 25, 3);
INSERT INTO `sys_role_menu` VALUES (60, 27, 3);
INSERT INTO `sys_role_menu` VALUES (61, 28, 3);
INSERT INTO `sys_role_menu` VALUES (62, 29, 3);
INSERT INTO `sys_role_menu` VALUES (64, 31, 3);
INSERT INTO `sys_role_menu` VALUES (65, 33, 3);
INSERT INTO `sys_role_menu` VALUES (68, 44, 3);
INSERT INTO `sys_role_menu` VALUES (69, 24, 5);
INSERT INTO `sys_role_menu` VALUES (70, 25, 5);
INSERT INTO `sys_role_menu` VALUES (72, 27, 5);
INSERT INTO `sys_role_menu` VALUES (73, 28, 5);
INSERT INTO `sys_role_menu` VALUES (74, 29, 5);
INSERT INTO `sys_role_menu` VALUES (76, 31, 5);
INSERT INTO `sys_role_menu` VALUES (77, 33, 5);
INSERT INTO `sys_role_menu` VALUES (80, 44, 5);
INSERT INTO `sys_role_menu` VALUES (81, 38, 1);
INSERT INTO `sys_role_menu` VALUES (84, 41, 1);
INSERT INTO `sys_role_menu` VALUES (85, 42, 1);
INSERT INTO `sys_role_menu` VALUES (86, 43, 1);
INSERT INTO `sys_role_menu` VALUES (87, 44, 1);
INSERT INTO `sys_role_menu` VALUES (89, 49, 1);
INSERT INTO `sys_role_menu` VALUES (90, 50, 1);
INSERT INTO `sys_role_menu` VALUES (95, 9, 3);
INSERT INTO `sys_role_menu` VALUES (96, 42, 3);
INSERT INTO `sys_role_menu` VALUES (97, 43, 3);
INSERT INTO `sys_role_menu` VALUES (98, 9, 5);
INSERT INTO `sys_role_menu` VALUES (99, 42, 5);
INSERT INTO `sys_role_menu` VALUES (101, 51, 1);
INSERT INTO `sys_role_menu` VALUES (102, 52, 1);
INSERT INTO `sys_role_menu` VALUES (103, 53, 1);
INSERT INTO `sys_role_menu` VALUES (104, 54, 1);
INSERT INTO `sys_role_menu` VALUES (105, 55, 1);
INSERT INTO `sys_role_menu` VALUES (106, 56, 1);
INSERT INTO `sys_role_menu` VALUES (107, 51, 3);
INSERT INTO `sys_role_menu` VALUES (108, 52, 3);
INSERT INTO `sys_role_menu` VALUES (109, 53, 3);
INSERT INTO `sys_role_menu` VALUES (110, 54, 3);
INSERT INTO `sys_role_menu` VALUES (111, 55, 3);
INSERT INTO `sys_role_menu` VALUES (112, 56, 3);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `salt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码、通信等加密盐',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `pwd` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码，md5加密',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `image` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '性别：0 男，1 女，2 未知',
  `money` decimal(10, 0) UNSIGNED NULL DEFAULT NULL COMMENT '钱包余额',
  `is_certification` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '是否认证：0 未，1 是',
  `status` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '0正常，1锁定',
  `created_time` datetime(0) NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'APP用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '11111', '张三', '123456', '18280004413', 'zhangsan@qq.com', '20200708001.jpg', 0, 200, 1, 0, '2020-06-12 09:51:47');
INSERT INTO `users` VALUES (2, '11111', '李四', '123456', '18808246076', 'zhangsan@qq.com', '20200708002.jpg', 0, 200, 0, 1, '2020-06-19 09:51:47');
INSERT INTO `users` VALUES (3, '11111', '王五', '123456', '18808246077', 'zhangsan@qq.com', '20200708003.jpg', 1, 200, 1, 0, '2020-06-04 09:51:47');
INSERT INTO `users` VALUES (4, '11111', '赵六', '123456', '18808246078', 'zhangsan@qq.com', '20200708004.jpg', 0, 200, 1, 1, '2020-06-19 09:51:47');
INSERT INTO `users` VALUES (5, '11111', '郑七', '123456', '18808246079', 'zhangsan@qq.com', '20200708005.jpg', 1, 200, 0, 1, '2020-06-19 09:51:47');
INSERT INTO `users` VALUES (6, '11111', '钱八', '123456', '18808246080', 'zhangsan@qq.com', '20200708006.jpg', 0, 200, 1, 0, '2020-06-10 09:51:47');
INSERT INTO `users` VALUES (7, '', '吴九', '123456', '18808246081', 'wujiu@qq.com', '20200708007.jpg', 1, 200, 0, 0, '2020-06-19 09:51:47');
INSERT INTO `users` VALUES (11, '', '朱十', '123456', '18809887688', 'zhuqi@qq.com', '20200708001.jpg', 0, 200, 0, 0, '2020-06-20 13:24:08');

SET FOREIGN_KEY_CHECKS = 1;
