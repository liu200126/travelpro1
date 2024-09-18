/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : traveldb

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 13/11/2023 23:08:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `bookID` int NOT NULL AUTO_INCREMENT COMMENT '书id',
  `bookName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '书名',
  `bookCounts` int NOT NULL COMMENT '数量',
  `detail` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '描述',
  PRIMARY KEY (`bookID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, 'Java', 1, '从入门到入土');
INSERT INTO `books` VALUES (2, 'MySQL', 10, '从删库到跑路');
INSERT INTO `books` VALUES (3, 'Linux', 5, '从入门到精通');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '删除了m',
  `nickName` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phoneNum` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '删除了m',
  `email` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, '张三', '小三', '13888889999', 'zhangsan@QQ.com');
INSERT INTO `member` VALUES (2, '李四', '小李', '15077887777', 'lisi@qq.com');
INSERT INTO `member` VALUES (3, '王五', '小五', '13789666677', 'wang@163.com');
INSERT INTO `member` VALUES (4, '赵六', '小六子', '13876457777', 'zhao@gmail.com');

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller`  (
  `orderId` int NOT NULL COMMENT '订单id',
  `travellerId` int NOT NULL COMMENT '旅客id',
  PRIMARY KEY (`orderId`, `travellerId`) USING BTREE,
  INDEX `travellerId`(`travellerId` ASC) USING BTREE,
  CONSTRAINT `order_traveller_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_traveller_ibfk_2` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES (5, 1);
INSERT INTO `order_traveller` VALUES (33, 2);
INSERT INTO `order_traveller` VALUES (4, 4);
INSERT INTO `order_traveller` VALUES (32, 4);
INSERT INTO `order_traveller` VALUES (33, 4);
INSERT INTO `order_traveller` VALUES (34, 6);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `orderTime` timestamp NULL DEFAULT NULL,
  `peopleCount` int NULL DEFAULT NULL,
  `orderDesc` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `payType` int NULL DEFAULT NULL COMMENT '支付方式（0 支付宝 1微信 2 其他',
  `orderStatus` int NULL DEFAULT NULL COMMENT '订单状态（0未支付1已支付）',
  `productId` int NULL DEFAULT NULL COMMENT '产品id外键',
  `memberId` int NULL DEFAULT NULL COMMENT '会员（联系人）id外键',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_o_p`(`productId` ASC) USING BTREE,
  INDEX `fk_o_m`(`memberId` ASC) USING BTREE,
  CONSTRAINT `fk_o_m` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_o_p` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '001', '2018-02-03 07:30:00', 1, '哈哈', 0, 1, NULL, 1);
INSERT INTO `orders` VALUES (2, '002', '2020-04-15 10:15:00', 3, '嘻嘻', 1, 1, NULL, 2);
INSERT INTO `orders` VALUES (3, '003', '2018-02-03 15:00:00', 2, '没什么', 0, 1, 26, 1);
INSERT INTO `orders` VALUES (4, '004', '2020-04-15 19:00:00', 2, '没什么1', 1, 1, NULL, 2);
INSERT INTO `orders` VALUES (5, '005', '2018-02-03 00:00:00', 1, '没什么2', 2, 0, 26, 4);
INSERT INTO `orders` VALUES (32, '99', NULL, 2, '', 1, 1, NULL, 2);
INSERT INTO `orders` VALUES (33, '11', '2023-05-06 11:55:00', 3, '3人行', 0, 0, 27, 1);
INSERT INTO `orders` VALUES (34, '6', '2023-06-12 10:20:00', 36, '', 0, 1, 25, 4);
INSERT INTO `orders` VALUES (35, '8899', '2023-11-03 23:35:00', 2, 'zcC', 0, 0, 32, 1);
INSERT INTO `orders` VALUES (36, '898', '2023-11-04 00:05:00', 1, '哦哦哦', 0, 0, 32, 1);
INSERT INTO `orders` VALUES (37, '9000', '2023-11-04 00:15:00', 1, '扣款', 0, 0, 32, 1);
INSERT INTO `orders` VALUES (38, '111', '2023-11-04 03:25:00', 1, '11111', 0, 0, 32, 1);
INSERT INTO `orders` VALUES (39, '3343', '2023-11-04 00:45:00', 1, '12132', 0, 0, 32, 1);
INSERT INTO `orders` VALUES (40, '3333', '2023-11-04 01:00:00', 3, '333', 0, 0, 32, 1);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '角色管理', '/role/findAll');
INSERT INTO `permission` VALUES (2, '资源权限管理', '/permission/findAll');
INSERT INTO `permission` VALUES (3, '用户管理', '/user/findAll');
INSERT INTO `permission` VALUES (4, '订单管理', '/order/findAll');
INSERT INTO `permission` VALUES (5, '产品管理', '/product/findAll');
INSERT INTO `permission` VALUES (6, '新增角色', '/role/addRole');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `productName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `cityName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `departureTime` timestamp NULL DEFAULT NULL,
  `productPrice` double(11, 0) NULL DEFAULT NULL,
  `productDesc` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `productStatus` int NULL DEFAULT NULL COMMENT '状态（0关闭 1开启）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (25, '123', '唐山夜游', '郑州', '2022-06-01 09:45:00', 666, '可爱的唐山欢迎您', 0);
INSERT INTO `product` VALUES (26, '666', '富士康游', '郑州', '2022-11-01 21:25:00', 100, '高速游', 1);
INSERT INTO `product` VALUES (27, '520', '北京一游', '郑州', '2023-05-01 10:50:00', 666, '北京天安门', 1);
INSERT INTO `product` VALUES (28, '111', '信阳郭家河', '郑州', '2023-05-01 10:50:00', 200, '露营好去处', 1);
INSERT INTO `product` VALUES (32, '999', '日照三日游', '郑州', '2023-06-23 08:00:00', 280, '日照香啊', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `roleDesc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ADMIN', '系统管理员');
INSERT INTO `role` VALUES (2, 'USER', '普通用户');
INSERT INTO `role` VALUES (4, '经理', '中层管理');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `permissionId` int NOT NULL,
  `roleId` int NOT NULL,
  PRIMARY KEY (`permissionId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId` ASC) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1);
INSERT INTO `role_permission` VALUES (2, 1);
INSERT INTO `role_permission` VALUES (3, 1);
INSERT INTO `role_permission` VALUES (3, 2);
INSERT INTO `role_permission` VALUES (4, 2);

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `visitTime` datetime NULL DEFAULT NULL COMMENT '访问时间',
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作者用户名',
  `ip` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '访问ip',
  `url` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '访问资源url',
  `executionTime` int NULL DEFAULT NULL COMMENT '执行时长',
  `method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '访问方法',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('011ddce878bf11eea9f08c164500d448', '2023-11-01 22:00:25', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findById/3', 4, 'findOrderById');
INSERT INTO `syslog` VALUES ('088a17a17bdd11ee90828c164500d448', '2023-11-05 21:12:56', 'jack', '127.0.0.1', 'http://localhost:8080/user/findAll', 4, 'findAllUsers');
INSERT INTO `syslog` VALUES ('0e1a587378be11eea9f08c164500d448', '2023-11-01 21:53:37', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findAll', 19, 'findAllOrders');
INSERT INTO `syslog` VALUES ('0f95ac2078be11eea9f08c164500d448', '2023-11-01 21:53:40', 'jack', '127.0.0.1', 'http://localhost:8080/user/findAll', 3, 'findAllUsers');
INSERT INTO `syslog` VALUES ('1', '2023-05-06 21:22:03', 'jack', '0:0:0:0:0:0:0:1', 'http://localhost:8080/to/login', 0, 'toPage1');
INSERT INTO `syslog` VALUES ('116532c678be11eea9f08c164500d448', '2023-11-01 21:53:43', 'jack', '127.0.0.1', 'http://localhost:8080/role/findAll', 7, 'findAllRoles');
INSERT INTO `syslog` VALUES ('131fc28d78be11eea9f08c164500d448', '2023-11-01 21:53:45', 'jack', '127.0.0.1', 'http://localhost:8080/permission/findAll', 7, 'findAllPermissions');
INSERT INTO `syslog` VALUES ('17df69f678be11eea9f08c164500d448', '2023-11-01 21:53:53', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findAll', 8, 'findAllOrders');
INSERT INTO `syslog` VALUES ('1d0b8cd578be11eea9f08c164500d448', '2023-11-01 21:54:02', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findById/34', 3, 'findOrderById');
INSERT INTO `syslog` VALUES ('2', '2023-05-06 21:22:04', 'jack', '0:0:0:0:0:0:0:1', 'http://localhost:8080/to/login', 0, 'toPage1');
INSERT INTO `syslog` VALUES ('2ae6b9cf78bd11eea9f08c164500d448', '2023-11-01 21:47:16', 'jack', '127.0.0.1', 'http://localhost:8080/login', 17, 'loadUserByUsername');
INSERT INTO `syslog` VALUES ('30455507823611ee831e8c164500d448', '2023-11-13 23:06:14', 'jack', '127.0.0.1', 'http://localhost:8088/orders/findAll', 56, 'findAllOrders');
INSERT INTO `syslog` VALUES ('320ed788823611ee831e8c164500d448', '2023-11-13 23:06:17', 'jack', '127.0.0.1', 'http://localhost:8088/orders/findAll', 20, 'findAllOrders');
INSERT INTO `syslog` VALUES ('3523a68e823611ee831e8c164500d448', '2023-11-13 23:06:23', 'jack', '127.0.0.1', 'http://localhost:8088/user/findAll', 4, 'findAllUsers');
INSERT INTO `syslog` VALUES ('36cf5dfd823611ee831e8c164500d448', '2023-11-13 23:06:25', 'jack', '127.0.0.1', 'http://localhost:8088/role/findAll', 9, 'findAllRoles');
INSERT INTO `syslog` VALUES ('567dee3f78bf11eea9f08c164500d448', '2023-11-01 22:02:48', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findAll', 14, 'findAllOrders');
INSERT INTO `syslog` VALUES ('63eb9e6978bf11eea9f08c164500d448', '2023-11-01 22:03:11', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findAll', 5, 'findAllOrders');
INSERT INTO `syslog` VALUES ('675c776278bf11eea9f08c164500d448', '2023-11-01 22:03:16', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findAll', 6, 'findAllOrders');
INSERT INTO `syslog` VALUES ('6d41916778bd11eea9f08c164500d448', '2023-11-01 21:49:07', 'jack', '127.0.0.1', 'http://localhost:8080/login', 16, 'loadUserByUsername');
INSERT INTO `syslog` VALUES ('6eb48c2c78bd11eea9f08c164500d448', '2023-11-01 21:49:10', 'jack', '127.0.0.1', 'http://localhost:8080/product/findProductByParam', 9, 'findAllProductByParam');
INSERT INTO `syslog` VALUES ('72f7f6b078bd11eea9f08c164500d448', '2023-11-01 21:49:17', 'jack', '127.0.0.1', 'http://localhost:8080/product/findProductByParam', 6, 'findAllProductByParam');
INSERT INTO `syslog` VALUES ('76468fa078bd11eea9f08c164500d448', '2023-11-01 21:49:22', 'jack', '127.0.0.1', 'http://localhost:8080/product/findProductByParam', 6, 'findAllProductByParam');
INSERT INTO `syslog` VALUES ('7a0af2dd78bd11eea9f08c164500d448', '2023-11-01 21:49:29', 'jack', '127.0.0.1', 'http://localhost:8080/product/findProductByParam', 7, 'findAllProductByParam');
INSERT INTO `syslog` VALUES ('7bc23f9178be11eea9f08c164500d448', '2023-11-01 21:56:41', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findAll', 14, 'findAllOrders');
INSERT INTO `syslog` VALUES ('7bc60cf9-7de5-11ee-b858-8c164500d448', '2023-11-08 11:18:27', 'jack', '127.0.0.1', '/user/findAll', 98, '[类名]	class com.yh.service.impl.UserServiceImpl[方法名]	findAllUsers');
INSERT INTO `syslog` VALUES ('7d61eb0e-7de5-11ee-b858-8c164500d448', '2023-11-08 11:18:30', 'jack', '127.0.0.1', '/role/findAll', 17, '[类名]	class com.yh.service.impl.RoleServiceImpl[方法名]	findAllRoles');
INSERT INTO `syslog` VALUES ('7f60ae1278be11eea9f08c164500d448', '2023-11-01 21:56:47', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findAll', 5, 'findAllOrders');
INSERT INTO `syslog` VALUES ('8355ebf478be11eea9f08c164500d448', '2023-11-01 21:56:54', 'jack', '127.0.0.1', 'http://localhost:8080/user/findAll', 5, 'findAllUsers');
INSERT INTO `syslog` VALUES ('85403c3478be11eea9f08c164500d448', '2023-11-01 21:56:57', 'jack', '127.0.0.1', 'http://localhost:8080/role/findAll', 4, 'findAllRoles');
INSERT INTO `syslog` VALUES ('85ce63d9-7de5-11ee-b858-8c164500d448', '2023-11-08 11:18:44', 'jack', '127.0.0.1', '/role/save', 7, '[类名]	class com.yh.service.impl.RoleServiceImpl[方法名]	save');
INSERT INTO `syslog` VALUES ('85d34cf2-7de5-11ee-b858-8c164500d448', '2023-11-08 11:18:44', 'jack', '127.0.0.1', '/role/findAll', 7, '[类名]	class com.yh.service.impl.RoleServiceImpl[方法名]	findAllRoles');
INSERT INTO `syslog` VALUES ('86618b8d78bf11eea9f08c164500d448', '2023-11-01 22:04:08', 'jack', '127.0.0.1', 'http://localhost:8080/role/findAll', 7, 'findAllRoles');
INSERT INTO `syslog` VALUES ('870ea5b878be11eea9f08c164500d448', '2023-11-01 21:57:00', 'jack', '127.0.0.1', 'http://localhost:8080/permission/findAll', 3, 'findAllPermissions');
INSERT INTO `syslog` VALUES ('89ae541378be11eea9f08c164500d448', '2023-11-01 21:57:04', 'jack', '127.0.0.1', 'http://localhost:8080/product/findProductByParam', 6, 'findAllProductByParam');
INSERT INTO `syslog` VALUES ('8bcd0f3378be11eea9f08c164500d448', '2023-11-01 21:57:08', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findAll', 10, 'findAllOrders');
INSERT INTO `syslog` VALUES ('8fc5df3f78be11eea9f08c164500d448', '2023-11-01 21:57:15', 'jack', '127.0.0.1', 'http://localhost:8080/product/findProductByParam', 8, 'findAllProductByParam');
INSERT INTO `syslog` VALUES ('9b5498ee78be11eea9f08c164500d448', '2023-11-01 21:57:34', 'jack', '127.0.0.1', 'http://localhost:8080/user/findAll', 4, 'findAllUsers');
INSERT INTO `syslog` VALUES ('9f15bc2978be11eea9f08c164500d448', '2023-11-01 21:57:40', 'jack', '127.0.0.1', 'http://localhost:8080/role/findAll', 3, 'findAllRoles');
INSERT INTO `syslog` VALUES ('a8513661-7de7-11ee-b858-8c164500d448', '2023-11-08 11:34:01', 'jack', '127.0.0.1', '/syslog/findAll', 33, '[类名]	class com.yh.service.impl.LogServiceImpl[方法名]	findAll');
INSERT INTO `syslog` VALUES ('b0e18bed78bd11eea9f08c164500d448', '2023-11-01 21:51:01', 'jack', '127.0.0.1', 'http://localhost:8080/product/findProductByParam', 12, 'findAllProductByParam');
INSERT INTO `syslog` VALUES ('b27abdd978be11eea9f08c164500d448', '2023-11-01 21:58:13', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findAll', 11, 'findAllOrders');
INSERT INTO `syslog` VALUES ('b2deb5a678bd11eea9f08c164500d448', '2023-11-01 21:51:04', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findAll', 14, 'findAllOrders');
INSERT INTO `syslog` VALUES ('b57eefeb78be11eea9f08c164500d448', '2023-11-01 21:58:18', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findById/3', 65, 'findOrderById');
INSERT INTO `syslog` VALUES ('bbeeb58678bd11eea9f08c164500d448', '2023-11-01 21:51:19', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findById/3', 8, 'findOrderById');
INSERT INTO `syslog` VALUES ('c6855a31-7d86-11ee-a373-8c164500d448', '2023-11-08 00:00:30', 'jack', '127.0.0.1', '/order/findAll', 68, '[类名]	class com.yh.service.impl.OrderServiceImpl[方法名]	findAll');
INSERT INTO `syslog` VALUES ('cd2da7af-7d86-11ee-a373-8c164500d448', '2023-11-08 00:00:42', 'jack', '127.0.0.1', '/product/findAll', 22, '[类名]	class com.yh.service.impl.ProductServiceImpl[方法名]	findAll');
INSERT INTO `syslog` VALUES ('d12bee83-7d86-11ee-a373-8c164500d448', '2023-11-08 00:00:48', 'jack', '127.0.0.1', '/product/selectDelete', 8, '[类名]	class com.yh.service.impl.ProductServiceImpl[方法名]	deleteById');
INSERT INTO `syslog` VALUES ('d13111b4-7d86-11ee-a373-8c164500d448', '2023-11-08 00:00:48', 'jack', '127.0.0.1', '/product/findAll', 7, '[类名]	class com.yh.service.impl.ProductServiceImpl[方法名]	findAll');
INSERT INTO `syslog` VALUES ('d14b537a-7d86-11ee-a373-8c164500d448', '2023-11-08 00:00:49', 'jack', '127.0.0.1', '/product/findAll', 14, '[类名]	class com.yh.service.impl.ProductServiceImpl[方法名]	findAll');
INSERT INTO `syslog` VALUES ('d2128fad7bdc11ee90828c164500d448', '2023-11-05 21:11:24', 'jack', '127.0.0.1', 'http://localhost:8080/user/findAll', 4, 'findAllUsers');
INSERT INTO `syslog` VALUES ('dbfb0d007bdc11ee90828c164500d448', '2023-11-05 21:11:41', 'jack', '127.0.0.1', 'http://localhost:8080/user/addUser', 312, 'addUser');
INSERT INTO `syslog` VALUES ('e3734c367bdc11ee90828c164500d448', '2023-11-05 21:11:53', 'jack', '127.0.0.1', 'http://localhost:8080/user/findAll', 5, 'findAllUsers');
INSERT INTO `syslog` VALUES ('e667e4f37bdc11ee90828c164500d448', '2023-11-05 21:11:58', 'jack', '127.0.0.1', 'http://localhost:8080/role/findAll', 12, 'findAllRoles');
INSERT INTO `syslog` VALUES ('e7e0dff67bdc11ee90828c164500d448', '2023-11-05 21:12:01', 'jack', '127.0.0.1', 'http://localhost:8080/user/findAll', 4, 'findAllUsers');
INSERT INTO `syslog` VALUES ('eef2eabb78be11eea9f08c164500d448', '2023-11-01 21:59:54', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findAll', 28, 'findAllOrders');
INSERT INTO `syslog` VALUES ('efd6cb2578be11eea9f08c164500d448', '2023-11-01 21:59:56', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findAll', 7, 'findAllOrders');
INSERT INTO `syslog` VALUES ('eff901c37bdc11ee90828c164500d448', '2023-11-05 21:12:14', 'jack', '127.0.0.1', 'http://localhost:8080/user/addUser', 118, 'addUser');
INSERT INTO `syslog` VALUES ('f102347278be11eea9f08c164500d448', '2023-11-01 21:59:58', 'jack', '127.0.0.1', 'http://localhost:8080/user/findAll', 4, 'findAllUsers');
INSERT INTO `syslog` VALUES ('f2e9a4be78be11eea9f08c164500d448', '2023-11-01 22:00:01', 'jack', '127.0.0.1', 'http://localhost:8080/user/findById/1', 15, 'findUserById');
INSERT INTO `syslog` VALUES ('f8254e2778be11eea9f08c164500d448', '2023-11-01 22:00:10', 'jack', '127.0.0.1', 'http://localhost:8080/role/findAll', 8, 'findAllRoles');
INSERT INTO `syslog` VALUES ('f95e32a978be11eea9f08c164500d448', '2023-11-01 22:00:12', 'jack', '127.0.0.1', 'http://localhost:8080/role/findRoleByIdAndPermission/1', 6, 'findOtherPermission');
INSERT INTO `syslog` VALUES ('fb31629c78be11eea9f08c164500d448', '2023-11-01 22:00:15', 'jack', '127.0.0.1', 'http://localhost:8080/product/findProductByParam', 53, 'findAllProductByParam');
INSERT INTO `syslog` VALUES ('fce5179d78be11eea9f08c164500d448', '2023-11-01 22:00:18', 'jack', '127.0.0.1', 'http://localhost:8080/orders/findAll', 7, 'findAllOrders');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sex` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `credentialsType` int NULL DEFAULT NULL COMMENT '证件类型 0身份证 1护照 2军官证',
  `credentialsNum` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `travellerType` int NULL DEFAULT NULL COMMENT '旅客类型(人群) 0 成人 1 儿童',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES (1, '赵龙', '男', '13140008888', 0, '411524199909091234', 0);
INSERT INTO `traveller` VALUES (2, '小明', '男', '13140001111', 0, '411524199809091234', 1);
INSERT INTO `traveller` VALUES (3, '小张', '男', '13140002222', 1, '789012345', 0);
INSERT INTO `traveller` VALUES (4, '晴子', '女', '13140003333', 1, '567812345', 0);
INSERT INTO `traveller` VALUES (5, '上校', '男', '13140004444', 2, '99999999999', 0);
INSERT INTO `traveller` VALUES (6, '小豆子', '女', '13140005555', 0, '88888888888', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL COMMENT '状态0 未开启 1 开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'jack@126.com', 'jack', '$2a$10$oNLgK8HAMbfpIdMB915NwedwikfLDG1tRO5jJfnY/DPsuy3dXlKqy', '13140008888', 1);
INSERT INTO `users` VALUES (5, '', 'zhang', '$2a$10$oNLgK8HAMbfpIdMB915NwedwikfLDG1tRO5jJfnY/DPsuy3dXlKqy', '', 1);

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role`  (
  `userId` int NOT NULL,
  `roleId` int NOT NULL,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId` ASC) USING BTREE,
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES (1, 1);
INSERT INTO `users_role` VALUES (1, 2);
INSERT INTO `users_role` VALUES (5, 2);

SET FOREIGN_KEY_CHECKS = 1;
