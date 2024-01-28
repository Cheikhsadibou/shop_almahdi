/*
 Navicat MySQL Data Transfer

 Source Server         : myshopdb
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35)
 Source Host           : localhost:3306
 Source Schema         : myshopdb

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35)
 File Encoding         : 65001

 Date: 23/01/2024 14:40:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_account
-- ----------------------------
DROP TABLE IF EXISTS `account_account`;
CREATE TABLE `account_account`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superadmin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_account
-- ----------------------------
INSERT INTO `account_account` VALUES (1, 'pbkdf2_sha256$720000$LrLSv8ffzfTJ2WYpUhnPlB$Wg4gaPSe9uG/tyc26aONUYXYFArfn6ybgpNDVUsV1nU=', 'Shop Almahdi', 'Service', 'Shop Almahdi Service', 'shopalmahdiservice@gmail.com', '', '2024-01-22 16:53:59.188064', '2024-01-23 14:39:39.379558', 1, 1, 1, 1);
INSERT INTO `account_account` VALUES (2, 'pbkdf2_sha256$720000$SVtqzQibh9t1lreYBoRn2p$a2TKTYmBTmrgYrIfJsPr4PwIpPfs0qDBM+FBZ084JkA=', 'Cheikh Sadibou', 'Diouf', 'cheikhdiouf035', 'cheikhdiouf035@gmail.com', '772882303', '2024-01-22 19:04:51.832288', '2024-01-23 14:08:55.913995', 0, 0, 1, 0);

-- ----------------------------
-- Table structure for account_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `account_userprofile`;
CREATE TABLE `account_userprofile`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adress_line_1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adress_line_2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `profile_picture` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `account_userprofile_user_id_5afa3c7a_fk_account_account_id` FOREIGN KEY (`user_id`) REFERENCES `account_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_userprofile
-- ----------------------------
INSERT INTO `account_userprofile` VALUES (1, '', '', 'userprofile/default-user.png', '', '', '', 2);

-- ----------------------------
-- Table structure for admin_honeypot_loginattempt
-- ----------------------------
DROP TABLE IF EXISTS `admin_honeypot_loginattempt`;
CREATE TABLE `admin_honeypot_loginattempt`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ip_address` char(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `session_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_agent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `timestamp` datetime(6) NOT NULL,
  `path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_honeypot_loginattempt
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add category', 6, 'add_category');
INSERT INTO `auth_permission` VALUES (22, 'Can change category', 6, 'change_category');
INSERT INTO `auth_permission` VALUES (23, 'Can delete category', 6, 'delete_category');
INSERT INTO `auth_permission` VALUES (24, 'Can view category', 6, 'view_category');
INSERT INTO `auth_permission` VALUES (25, 'Can add account', 7, 'add_account');
INSERT INTO `auth_permission` VALUES (26, 'Can change account', 7, 'change_account');
INSERT INTO `auth_permission` VALUES (27, 'Can delete account', 7, 'delete_account');
INSERT INTO `auth_permission` VALUES (28, 'Can view account', 7, 'view_account');
INSERT INTO `auth_permission` VALUES (29, 'Can add user profile', 8, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (30, 'Can change user profile', 8, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (31, 'Can delete user profile', 8, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (32, 'Can view user profile', 8, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (33, 'Can add product', 9, 'add_product');
INSERT INTO `auth_permission` VALUES (34, 'Can change product', 9, 'change_product');
INSERT INTO `auth_permission` VALUES (35, 'Can delete product', 9, 'delete_product');
INSERT INTO `auth_permission` VALUES (36, 'Can view product', 9, 'view_product');
INSERT INTO `auth_permission` VALUES (37, 'Can add productgallery', 10, 'add_productgallery');
INSERT INTO `auth_permission` VALUES (38, 'Can change productgallery', 10, 'change_productgallery');
INSERT INTO `auth_permission` VALUES (39, 'Can delete productgallery', 10, 'delete_productgallery');
INSERT INTO `auth_permission` VALUES (40, 'Can view productgallery', 10, 'view_productgallery');
INSERT INTO `auth_permission` VALUES (41, 'Can add review rating', 11, 'add_reviewrating');
INSERT INTO `auth_permission` VALUES (42, 'Can change review rating', 11, 'change_reviewrating');
INSERT INTO `auth_permission` VALUES (43, 'Can delete review rating', 11, 'delete_reviewrating');
INSERT INTO `auth_permission` VALUES (44, 'Can view review rating', 11, 'view_reviewrating');
INSERT INTO `auth_permission` VALUES (45, 'Can add variation', 12, 'add_variation');
INSERT INTO `auth_permission` VALUES (46, 'Can change variation', 12, 'change_variation');
INSERT INTO `auth_permission` VALUES (47, 'Can delete variation', 12, 'delete_variation');
INSERT INTO `auth_permission` VALUES (48, 'Can view variation', 12, 'view_variation');
INSERT INTO `auth_permission` VALUES (49, 'Can add cart', 13, 'add_cart');
INSERT INTO `auth_permission` VALUES (50, 'Can change cart', 13, 'change_cart');
INSERT INTO `auth_permission` VALUES (51, 'Can delete cart', 13, 'delete_cart');
INSERT INTO `auth_permission` VALUES (52, 'Can view cart', 13, 'view_cart');
INSERT INTO `auth_permission` VALUES (53, 'Can add cart item', 14, 'add_cartitem');
INSERT INTO `auth_permission` VALUES (54, 'Can change cart item', 14, 'change_cartitem');
INSERT INTO `auth_permission` VALUES (55, 'Can delete cart item', 14, 'delete_cartitem');
INSERT INTO `auth_permission` VALUES (56, 'Can view cart item', 14, 'view_cartitem');
INSERT INTO `auth_permission` VALUES (57, 'Can add order', 15, 'add_order');
INSERT INTO `auth_permission` VALUES (58, 'Can change order', 15, 'change_order');
INSERT INTO `auth_permission` VALUES (59, 'Can delete order', 15, 'delete_order');
INSERT INTO `auth_permission` VALUES (60, 'Can view order', 15, 'view_order');
INSERT INTO `auth_permission` VALUES (61, 'Can add payment', 16, 'add_payment');
INSERT INTO `auth_permission` VALUES (62, 'Can change payment', 16, 'change_payment');
INSERT INTO `auth_permission` VALUES (63, 'Can delete payment', 16, 'delete_payment');
INSERT INTO `auth_permission` VALUES (64, 'Can view payment', 16, 'view_payment');
INSERT INTO `auth_permission` VALUES (65, 'Can add order product', 17, 'add_orderproduct');
INSERT INTO `auth_permission` VALUES (66, 'Can change order product', 17, 'change_orderproduct');
INSERT INTO `auth_permission` VALUES (67, 'Can delete order product', 17, 'delete_orderproduct');
INSERT INTO `auth_permission` VALUES (68, 'Can view order product', 17, 'view_orderproduct');
INSERT INTO `auth_permission` VALUES (69, 'Can add login attempt', 18, 'add_loginattempt');
INSERT INTO `auth_permission` VALUES (70, 'Can change login attempt', 18, 'change_loginattempt');
INSERT INTO `auth_permission` VALUES (71, 'Can delete login attempt', 18, 'delete_loginattempt');
INSERT INTO `auth_permission` VALUES (72, 'Can view login attempt', 18, 'view_loginattempt');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cart_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_added` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 'ylqxqp46dpcsdhut070zsvz9fn91um8b', '2024-01-22');
INSERT INTO `cart` VALUES (2, 'hz3ppwstsiqvo9co5mqdt34crwpzfe0s', '2024-01-23');

-- ----------------------------
-- Table structure for carts_cartitem
-- ----------------------------
DROP TABLE IF EXISTS `carts_cartitem`;
CREATE TABLE `carts_cartitem`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `cart_id` bigint NULL DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `carts_cartitem_cart_id_9cb0a756_fk_Cart_id`(`cart_id` ASC) USING BTREE,
  INDEX `carts_cartitem_product_id_acd010e4_fk_store_product_id`(`product_id` ASC) USING BTREE,
  INDEX `carts_cartitem_user_id_4d21e0d9_fk_account_account_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `carts_cartitem_cart_id_9cb0a756_fk_Cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `carts_cartitem_product_id_acd010e4_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `carts_cartitem_user_id_4d21e0d9_fk_account_account_id` FOREIGN KEY (`user_id`) REFERENCES `account_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts_cartitem
-- ----------------------------
INSERT INTO `carts_cartitem` VALUES (1, 1, 1, 1, 2, NULL);
INSERT INTO `carts_cartitem` VALUES (6, 1, 1, NULL, 33, 1);

-- ----------------------------
-- Table structure for carts_cartitem_variations
-- ----------------------------
DROP TABLE IF EXISTS `carts_cartitem_variations`;
CREATE TABLE `carts_cartitem_variations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cartitem_id` bigint NOT NULL,
  `variation_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `carts_cartitem_variations_cartitem_id_variation_id_5f8efaf5_uniq`(`cartitem_id` ASC, `variation_id` ASC) USING BTREE,
  INDEX `carts_cartitem_varia_variation_id_ef9f9ee3_fk_store_var`(`variation_id` ASC) USING BTREE,
  CONSTRAINT `carts_cartitem_varia_cartitem_id_8be23372_fk_carts_car` FOREIGN KEY (`cartitem_id`) REFERENCES `carts_cartitem` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `carts_cartitem_varia_variation_id_ef9f9ee3_fk_store_var` FOREIGN KEY (`variation_id`) REFERENCES `store_variation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts_cartitem_variations
-- ----------------------------
INSERT INTO `carts_cartitem_variations` VALUES (1, 1, 10);
INSERT INTO `carts_cartitem_variations` VALUES (2, 1, 15);
INSERT INTO `carts_cartitem_variations` VALUES (12, 6, 287);
INSERT INTO `carts_cartitem_variations` VALUES (11, 6, 292);

-- ----------------------------
-- Table structure for category_category
-- ----------------------------
DROP TABLE IF EXISTS `category_category`;
CREATE TABLE `category_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cat_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `category_name`(`category_name` ASC) USING BTREE,
  UNIQUE INDEX `slug`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_category
-- ----------------------------
INSERT INTO `category_category` VALUES (1, 'Shoes Class', 'shoes-class', 'Shoes Class', 'photos/categories/Capture1.png');
INSERT INTO `category_category` VALUES (2, 'Talon', 'talon', 'Talon', 'photos/categories/Captured2.png');
INSERT INTO `category_category` VALUES (3, 'Ceinture', 'ceinture', 'Ceinture', 'photos/categories/Capturec1.jpg');
INSERT INTO `category_category` VALUES (4, 'T shert', 't-shert', 'T shert', 'photos/categories/Capturet1.jpg');
INSERT INTO `category_category` VALUES (5, 'Shoes Basquet', 'shoes-basquet', 'Shoes Basquet', 'photos/categories/adidas1.jpg');
INSERT INTO `category_category` VALUES (6, 'Sandale cuir', 'sandale-cuir', 'Sandale cuir', 'photos/categories/ArtisanatS1.jpg');
INSERT INTO `category_category` VALUES (7, 'Montre', 'montre', 'Montre', 'photos/categories/WATCH1.jpg');
INSERT INTO `category_category` VALUES (8, 'Chemise', 'chemise', 'Chemise', 'photos/categories/Capture_ch.png');
INSERT INTO `category_category` VALUES (9, 'Casquete', 'casquete', 'Casquete', 'photos/categories/Moderne_P.png');
INSERT INTO `category_category` VALUES (10, 'Lacoste', 'lacoste', 'Lacoste', 'photos/categories/Lacoste.jpg');
INSERT INTO `category_category` VALUES (11, 'Sac', 'sac', 'Sac', 'photos/categories/SasEnfant.jpg');
INSERT INTO `category_category` VALUES (12, 'Super cent', 'super-cent', 'Super cent', 'photos/categories/kisspngjeanss.jpg');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_account_account_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_account_id` FOREIGN KEY (`user_id`) REFERENCES `account_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 1075 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2023-12-18 18:38:56.355079', '1', 'Shoes Class', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (2, '2023-12-18 18:40:03.444536', '2', 'Talon', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (3, '2023-12-18 18:41:03.899122', '3', 'Ceinture', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (4, '2023-12-18 18:41:57.606673', '4', 'T shert', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (5, '2023-12-18 18:42:44.366320', '5', 'Shoes Basquet', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (6, '2023-12-18 18:43:40.632869', '6', 'Sandale cuir', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (7, '2023-12-18 18:44:32.882628', '7', 'Montre', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (8, '2023-12-18 18:45:22.030581', '8', 'Chemise', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (9, '2023-12-18 18:46:02.958076', '9', 'Casquete', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (10, '2023-12-18 18:46:43.790684', '10', 'Lacoste', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (11, '2023-12-18 18:47:18.023208', '11', 'Sac', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (12, '2023-12-18 18:49:28.116514', '12', 'Super cent', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (13, '2023-12-18 19:25:01.963864', '1', 'Choes de sport', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (14, '2023-12-18 19:26:07.332741', '2', 'Chaussure haute de gamme', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (15, '2023-12-18 19:27:20.547458', '3', 'Chaussures pour un mariage', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (16, '2023-12-18 19:29:13.118729', '4', 'chaussures hommes haut de gamme', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (17, '2023-12-18 19:30:51.135612', '5', 'Chaussure de running Marine', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (18, '2023-12-18 19:32:29.633823', '6', 'BOOTS SANTONI CARTER', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (19, '2023-12-18 19:36:38.714950', '7', 'Chaussures adidas', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (20, '2023-12-18 19:37:55.102589', '8', 'Sandales cuir homme artisanales', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (21, '2023-12-18 19:39:29.044551', '9', 'Mode homme sandale en cuir', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (22, '2023-12-18 19:41:09.044906', '10', 'sandales coups de c?ur', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (23, '2023-12-18 19:42:44.720571', '11', 'sandales en cuir Zeus', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (24, '2023-12-18 19:43:57.624676', '12', 'sandales cuir bio', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (25, '2023-12-18 19:49:22.414068', '13', 'sandale Artisanat Maroc', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (26, '2023-12-18 19:51:09.777558', '14', 'Sandales grises Chaussures Compensées', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (27, '2023-12-18 19:52:14.882484', '15', 'Sandales grises Chaussures', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (28, '2023-12-18 19:53:38.568296', '16', 'Sandales Cuir N°902  Doré', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (29, '2023-12-18 19:54:27.709140', '17', 'Femme Sandales en Cuir en Doré', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (30, '2023-12-18 19:56:01.803129', '18', 'Sandales & Nu-pieds', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (31, '2023-12-18 19:56:58.014630', '19', 'Sandales talon noir', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (32, '2023-12-18 19:57:59.644119', '20', 'sandale casadei-femme', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (33, '2023-12-18 20:00:08.864712', '21', 'Sac titangamingbackpackg', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (34, '2023-12-18 20:02:25.715111', '22', 'sac-vintage-gris', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (35, '2023-12-18 20:04:03.438684', '23', 'Sac de voyage', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (36, '2023-12-18 20:06:13.941936', '24', 'Sac À Do Femme', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (37, '2023-12-18 20:15:21.072479', '25', 'sac-a-dos', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (38, '2023-12-18 20:16:15.837305', '26', 'Sac-a-dos-enfant', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (39, '2023-12-18 20:18:10.315257', '27', 'Sac Ordinateur', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (40, '2023-12-18 20:20:31.647423', '28', 'Pantalons Simples Homme', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (41, '2023-12-18 20:22:47.310123', '29', 'jean homme Super cent', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (42, '2023-12-18 20:23:47.815946', '30', 'Pantalon Casse Super 100 Homme', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (43, '2023-12-18 20:25:12.954241', '31', 'WATCH WEAR E-shop', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (44, '2023-12-19 11:03:16.222730', '32', 'Watch - Apple Store', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (45, '2023-12-19 11:04:58.931771', '33', 'PERPETUAL STAINLESS STEEL', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (46, '2023-12-19 11:07:14.113191', '34', 'Circle Smart Watch', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (47, '2023-12-19 11:08:52.121365', '35', 'Buy HUAWEI WATCH GT 3', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (48, '2023-12-19 11:10:03.295900', '36', 'Apple Watch Series 9', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (49, '2023-12-19 11:11:47.075449', '37', 'Watch - Apple', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (50, '2023-12-19 11:13:09.515218', '38', 'WATCH WEAR', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (51, '2023-12-19 11:16:57.674092', '39', 'Lacoste', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (52, '2023-12-19 11:18:21.614997', '40', 'LACOSTE  Bleu marine', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (53, '2023-12-19 11:19:31.900630', '41', 'Lacoste Polo', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (54, '2023-12-19 11:20:40.253900', '42', 'Lacoste Navy Cotton', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (55, '2023-12-19 11:24:02.896502', '42', 'Lacoste Navy Cotton', 2, '[{\"changed\": {\"fields\": [\"Images\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (56, '2023-12-19 11:24:59.397787', '43', 'Lacoste Blanc', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (57, '2023-12-19 11:26:26.390379', '44', 'Chemises Solid Manches', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (58, '2023-12-19 11:28:19.970461', '44', 'Chemises Solid Manches', 2, '[{\"changed\": {\"fields\": [\"Images\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (59, '2023-12-19 11:31:09.419156', '45', 'Lacoste Cotton', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (60, '2023-12-19 11:32:32.492425', '46', 'LACOSTE  Bleu', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (61, '2023-12-19 11:34:12.336848', '47', 'lacoste vert olive', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (62, '2023-12-19 11:36:13.321968', '48', 'Chemise Homme blue', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (63, '2023-12-19 11:43:01.384335', '49', 'Chemise Homme pret à port', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (64, '2023-12-19 11:44:34.003634', '50', 'Chemise Homme', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (65, '2023-12-19 11:46:16.474093', '51', 'Chemise classe', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (66, '2023-12-19 11:47:35.073072', '51', 'Chemise classe', 2, '[{\"changed\": {\"fields\": [\"Images\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (67, '2023-12-19 11:49:25.901827', '52', 'Chemise classe homme', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (68, '2023-12-19 11:51:13.297422', '53', 'Ceinture sans trou cuir', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (69, '2023-12-19 11:55:44.367209', '54', 'Ceinture  Femme Kezel', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (70, '2023-12-19 11:56:27.486711', '54', 'Ceinture  Homme Kezel', 2, '[{\"changed\": {\"fields\": [\"Product name\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (71, '2023-12-19 11:57:50.296559', '55', 'Ceinture Élastique Femme', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (72, '2023-12-19 11:59:50.818204', '56', 'Ceinture Femme', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (73, '2023-12-19 12:02:16.693727', '57', 'Ceinture  Femme style', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (74, '2023-12-19 12:04:40.340343', '58', 'Ceinture Belter Belt', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (75, '2023-12-19 12:06:06.263444', '59', 'Ceinture Kezel', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (76, '2023-12-19 12:08:00.154825', '60', 'Casquette Parasol Chapeau', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (77, '2023-12-19 12:11:44.335144', '61', 'casquet Floral fleur', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (78, '2023-12-19 12:15:46.667363', '62', 'Casquette basebal', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (79, '2023-12-19 12:17:21.763893', '63', 'Casquette aigle', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (80, '2023-12-19 12:19:00.915183', '64', 'Casquette star', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (81, '2023-12-19 12:21:14.544788', '1', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (82, '2023-12-19 12:21:38.827592', '2', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (83, '2023-12-19 12:21:56.734809', '3', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (84, '2023-12-19 12:22:09.644093', '4', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (85, '2023-12-19 12:22:51.961368', '5', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (86, '2023-12-19 12:23:04.104727', '6', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (87, '2023-12-19 12:23:21.558271', '7', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (88, '2023-12-19 12:24:30.961001', '8', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (89, '2023-12-19 12:25:12.670278', '9', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (90, '2023-12-19 12:25:27.022118', '10', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (91, '2023-12-19 12:25:47.490040', '11', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (92, '2023-12-19 12:26:45.318331', '12', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (93, '2023-12-19 12:27:34.372059', '13', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (94, '2023-12-19 12:27:47.216865', '14', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (95, '2023-12-19 12:28:12.849916', '15', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (96, '2023-12-19 12:28:27.390925', '16', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (97, '2023-12-19 12:28:39.637249', '17', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (98, '2023-12-19 12:28:50.601049', '18', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (99, '2023-12-19 12:29:13.553093', '19', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (100, '2023-12-19 12:29:23.613833', '20', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (101, '2023-12-19 12:29:35.166784', '21', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (102, '2023-12-19 12:29:45.920924', '22', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (103, '2023-12-19 12:30:00.696943', '23', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (104, '2023-12-19 12:30:23.375075', '24', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (105, '2023-12-19 12:30:39.255778', '25', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (106, '2023-12-19 12:30:47.769183', '26', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (107, '2023-12-19 12:30:57.598976', '27', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (108, '2023-12-19 12:31:09.379863', '28', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (109, '2023-12-19 12:31:22.574304', '29', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (110, '2023-12-19 12:31:33.281954', '30', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (111, '2023-12-19 12:31:50.992951', '31', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (112, '2023-12-19 12:32:01.362461', '32', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (113, '2023-12-19 12:32:13.516876', '33', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (114, '2023-12-19 12:32:24.710229', '34', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (115, '2023-12-19 12:32:41.214666', '35', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (116, '2023-12-19 12:32:51.521411', '36', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (117, '2023-12-19 12:33:01.376193', '37', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (118, '2023-12-19 12:33:25.860960', '38', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (119, '2023-12-19 12:33:36.810257', '39', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (120, '2023-12-19 12:33:45.375010', '40', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (121, '2023-12-19 12:33:57.685996', '41', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (122, '2023-12-19 12:34:07.755098', '42', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (123, '2023-12-19 12:34:24.875634', '43', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (124, '2023-12-19 12:34:35.728565', '44', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (125, '2023-12-19 12:34:55.130635', '45', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (126, '2023-12-19 12:35:31.760833', '46', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (127, '2023-12-19 12:36:12.538182', '47', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (128, '2023-12-19 12:36:28.007039', '48', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (129, '2023-12-19 12:36:37.913643', '49', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (130, '2023-12-19 12:36:51.482240', '50', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (131, '2023-12-19 12:37:02.890211', '51', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (132, '2023-12-19 12:37:13.988006', '52', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (133, '2023-12-19 12:37:25.501436', '53', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (134, '2023-12-19 12:37:46.275018', '54', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (135, '2023-12-19 12:38:48.695348', '55', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (136, '2023-12-19 12:39:01.077853', '56', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (137, '2023-12-19 12:39:13.447829', '57', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (138, '2023-12-19 12:40:09.339545', '58', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (139, '2023-12-19 12:40:19.408170', '59', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (140, '2023-12-19 12:40:30.056724', '60', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (141, '2023-12-19 12:40:42.286728', '61', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (142, '2023-12-19 12:40:51.243210', '62', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (143, '2023-12-19 12:41:05.926365', '63', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (144, '2023-12-19 12:41:21.368561', '64', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (145, '2023-12-19 12:41:34.012797', '65', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (146, '2023-12-19 12:41:51.121820', '66', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (147, '2023-12-19 12:42:13.025181', '67', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (148, '2023-12-19 12:42:24.655643', '68', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (149, '2023-12-19 12:42:45.067342', '69', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (150, '2023-12-19 12:42:55.892099', '70', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (151, '2023-12-19 12:43:45.697409', '71', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (152, '2023-12-19 12:44:07.105957', '72', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (153, '2023-12-19 12:44:32.035578', '73', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (154, '2023-12-19 12:44:46.134633', '74', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (155, '2023-12-19 12:45:04.045100', '75', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (156, '2023-12-19 12:45:28.823574', '76', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (157, '2023-12-19 12:45:48.814463', '77', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (158, '2023-12-19 12:47:04.010129', '78', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (159, '2023-12-19 12:47:22.364391', '79', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (160, '2023-12-19 12:47:33.677452', '80', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (161, '2023-12-19 12:47:58.684848', '81', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (162, '2023-12-19 12:48:11.348562', '82', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (163, '2023-12-19 12:48:35.589084', '83', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (164, '2023-12-19 12:48:53.614960', '84', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (165, '2023-12-19 12:49:17.715638', '85', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (166, '2023-12-19 12:49:30.221860', '86', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (167, '2023-12-19 12:49:46.393913', '87', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (168, '2023-12-19 12:50:09.241786', '88', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (169, '2023-12-19 12:50:22.112908', '89', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (170, '2023-12-19 12:50:33.346106', '90', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (171, '2023-12-19 12:50:41.546720', '91', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (172, '2023-12-19 12:51:00.855567', '92', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (173, '2023-12-19 12:51:23.197647', '93', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (174, '2023-12-19 12:51:39.503103', '94', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (175, '2023-12-19 12:51:55.073952', '95', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (176, '2023-12-19 12:52:17.864176', '96', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (177, '2023-12-19 12:52:32.456801', '97', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (178, '2023-12-19 12:53:31.591505', '98', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (179, '2023-12-19 12:53:42.724121', '99', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (180, '2023-12-19 12:53:58.341356', '100', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (181, '2023-12-19 12:54:31.077341', '101', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (182, '2023-12-19 12:54:45.078204', '102', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (183, '2023-12-19 12:55:03.568983', '103', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (184, '2023-12-19 12:55:19.933074', '104', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (185, '2023-12-19 12:55:44.513062', '105', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (186, '2023-12-19 12:55:58.530397', '106', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (187, '2023-12-19 12:56:23.505628', '107', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (188, '2023-12-19 12:56:35.701562', '108', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (189, '2023-12-19 12:56:51.666332', '109', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (190, '2023-12-19 12:57:13.374625', '110', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (191, '2023-12-19 12:57:32.554900', '111', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (192, '2023-12-19 12:57:47.599264', '112', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (193, '2023-12-19 12:57:57.028222', '113', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (194, '2023-12-19 12:58:19.117385', '114', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (195, '2023-12-19 12:58:33.629225', '115', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (196, '2023-12-19 12:59:12.709113', '116', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (197, '2023-12-19 12:59:26.012068', '117', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (198, '2023-12-19 12:59:39.159158', '118', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (199, '2023-12-19 12:59:52.545121', '119', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (200, '2023-12-19 13:00:07.629918', '120', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (201, '2023-12-19 13:00:20.741895', '121', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (202, '2023-12-19 13:00:31.739636', '122', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (203, '2023-12-19 13:00:50.620033', '123', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (204, '2023-12-19 13:01:03.490734', '124', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (205, '2023-12-19 13:01:16.803581', '125', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (206, '2023-12-19 13:01:32.371966', '126', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (207, '2023-12-19 13:01:49.082886', '127', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (208, '2023-12-19 13:02:01.994950', '128', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (209, '2023-12-19 13:02:20.194095', '129', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (210, '2023-12-19 13:02:57.750368', '130', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (211, '2023-12-19 13:03:07.831809', '131', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (212, '2023-12-19 13:03:21.443190', '132', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (213, '2023-12-19 13:03:37.429301', '133', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (214, '2023-12-19 13:04:14.822780', '134', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (215, '2023-12-19 13:04:27.124663', '135', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (216, '2023-12-19 13:04:37.809745', '136', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (217, '2023-12-19 13:04:57.000608', '137', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (218, '2023-12-19 13:05:18.390771', '138', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (219, '2023-12-19 13:05:33.631451', '139', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (220, '2023-12-19 13:05:53.189138', '140', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (221, '2023-12-19 13:06:10.127392', '141', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (222, '2023-12-19 13:06:32.167676', '142', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (223, '2023-12-19 13:06:42.297512', '143', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (224, '2023-12-19 13:08:13.991332', '144', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (225, '2023-12-19 13:08:37.959161', '145', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (226, '2023-12-19 13:08:57.745195', '146', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (227, '2023-12-19 13:09:45.355019', '147', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (228, '2023-12-19 13:09:56.230258', '148', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (229, '2023-12-19 13:10:07.605102', '149', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (230, '2023-12-19 13:10:22.499696', '150', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (231, '2023-12-19 13:11:04.604424', '151', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (232, '2023-12-19 13:11:34.528768', '152', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (233, '2023-12-19 13:11:50.740608', '153', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (234, '2023-12-19 13:12:01.553790', '154', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (235, '2023-12-19 13:12:15.433572', '155', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (236, '2023-12-19 13:12:28.554075', '156', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (237, '2023-12-19 13:13:18.131993', '157', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (238, '2023-12-19 13:13:31.284289', '158', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (239, '2023-12-19 13:13:43.148536', '159', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (240, '2023-12-19 13:14:09.426343', '160', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (241, '2023-12-19 13:14:28.382605', '161', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (242, '2023-12-19 13:14:47.564748', '162', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (243, '2023-12-19 13:15:02.608186', '163', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (244, '2023-12-19 13:15:14.649314', '164', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (245, '2023-12-19 13:15:29.318450', '165', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (246, '2023-12-19 13:15:43.894174', '166', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (247, '2023-12-19 13:15:54.630863', '167', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (248, '2023-12-19 13:16:10.490901', '168', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (249, '2023-12-19 13:16:29.030092', '169', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (250, '2023-12-19 13:16:42.742604', '170', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (251, '2023-12-19 13:16:55.838781', '171', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (252, '2023-12-19 13:17:12.690434', '172', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (253, '2023-12-19 13:17:31.470462', '173', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (254, '2023-12-19 13:17:48.232209', '174', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (255, '2023-12-19 13:18:01.735618', '175', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (256, '2023-12-19 13:18:13.971976', '176', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (257, '2023-12-19 13:18:28.389677', '177', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (258, '2023-12-19 13:18:48.441206', '178', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (259, '2023-12-19 13:19:00.559982', '179', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (260, '2023-12-19 13:19:20.860779', '180', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (261, '2023-12-19 13:19:38.944517', '181', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (262, '2023-12-19 13:19:53.153722', '182', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (263, '2023-12-19 13:20:10.465830', '183', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (264, '2023-12-19 13:20:31.890469', '184', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (265, '2023-12-19 13:20:57.827918', '185', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (266, '2023-12-19 13:21:10.514869', '186', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (267, '2023-12-19 13:21:25.364689', '187', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (268, '2023-12-19 13:21:35.602246', '188', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (269, '2023-12-19 13:21:47.136577', '189', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (270, '2023-12-19 13:22:27.945304', '190', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (271, '2023-12-19 13:22:56.420528', '191', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (272, '2023-12-19 13:23:17.275024', '192', 'V 20L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (273, '2023-12-19 13:23:30.641898', '193', 'V 40L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (274, '2023-12-19 13:23:43.408967', '194', 'V 60L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (275, '2023-12-19 13:24:00.738641', '195', 'V 80L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (276, '2023-12-19 13:24:38.123798', '183', 'V 20L', 2, '[{\"changed\": {\"fields\": [\"Variation value\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (277, '2023-12-19 13:25:41.095730', '184', 'V 40L', 2, '[{\"changed\": {\"fields\": [\"Variation value\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (278, '2023-12-19 13:25:57.095955', '185', 'V 60L', 2, '[{\"changed\": {\"fields\": [\"Variation value\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (279, '2023-12-19 13:26:17.886918', '186', 'V 80L', 2, '[{\"changed\": {\"fields\": [\"Variation value\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (280, '2023-12-19 13:27:42.232750', '188', 'white', 2, '[{\"changed\": {\"fields\": [\"Product\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (281, '2023-12-19 13:28:28.852668', '196', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (282, '2023-12-19 13:28:44.689022', '197', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (283, '2023-12-19 13:29:17.593227', '198', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (284, '2023-12-19 13:30:10.904491', '199', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (285, '2023-12-19 13:30:34.064349', '200', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (286, '2023-12-19 13:31:04.935093', '201', 'V 20L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (287, '2023-12-19 13:31:17.974766', '202', 'V 40L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (288, '2023-12-19 13:31:37.896510', '203', 'V 60L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (289, '2023-12-19 13:31:48.225351', '204', 'V 80L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (290, '2023-12-19 13:32:29.931305', '205', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (291, '2023-12-19 13:32:41.637237', '206', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (292, '2023-12-19 13:32:54.099966', '207', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (293, '2023-12-19 13:33:21.888759', '208', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (294, '2023-12-19 13:34:02.146929', '209', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (295, '2023-12-19 13:34:30.902745', '210', 'V 20L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (296, '2023-12-19 13:34:44.367408', '211', 'V 40L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (297, '2023-12-19 13:34:56.265530', '212', 'V 60L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (298, '2023-12-19 13:35:15.431818', '213', 'V 80L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (299, '2023-12-19 13:35:46.929155', '214', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (300, '2023-12-19 13:36:06.507128', '215', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (301, '2023-12-19 13:36:24.364186', '216', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (302, '2023-12-19 13:36:42.884992', '217', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (303, '2023-12-19 13:37:00.048255', '218', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (304, '2023-12-19 13:37:17.912918', '219', 'V 20L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (305, '2023-12-19 13:37:32.924051', '220', 'V 40L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (306, '2023-12-19 13:38:19.817241', '221', 'V 60L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (307, '2023-12-19 13:38:30.802309', '222', 'V 80L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (308, '2023-12-19 13:38:41.896159', '223', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (309, '2023-12-19 13:38:53.855744', '224', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (310, '2023-12-19 13:39:04.518024', '225', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (311, '2023-12-19 13:39:27.239790', '226', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (312, '2023-12-19 13:39:48.437006', '227', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (313, '2023-12-19 13:40:05.035863', '228', 'V 20L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (314, '2023-12-19 13:40:16.535674', '229', 'V 40L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (315, '2023-12-19 13:40:37.187219', '230', 'V 60L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (316, '2023-12-19 13:41:01.655432', '231', 'V 80L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (317, '2023-12-19 13:41:21.763804', '232', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (318, '2023-12-19 13:42:32.819597', '233', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (319, '2023-12-19 13:42:58.650472', '234', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (320, '2023-12-19 13:44:10.574672', '235', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (321, '2023-12-19 13:44:31.580132', '236', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (322, '2023-12-19 13:44:41.140424', '237', 'V 20L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (323, '2023-12-19 13:45:07.485064', '238', 'V 40L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (324, '2023-12-19 13:45:38.149456', '239', 'V 60L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (325, '2023-12-19 13:45:52.289440', '240', 'V 80L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (326, '2023-12-19 13:46:16.687637', '241', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (327, '2023-12-19 13:46:56.265497', '242', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (328, '2023-12-19 13:47:06.090797', '243', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (329, '2023-12-19 13:47:16.038906', '244', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (330, '2023-12-19 13:47:34.303488', '245', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (331, '2023-12-19 13:47:48.240665', '246', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (332, '2023-12-19 13:47:56.375310', '247', 'm', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (333, '2023-12-19 13:48:12.920749', '247', 'M', 2, '[{\"changed\": {\"fields\": [\"Variation value\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (334, '2023-12-19 13:48:25.171818', '248', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (335, '2023-12-19 13:48:37.503108', '249', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (336, '2023-12-19 13:48:50.301941', '250', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (337, '2023-12-19 13:49:12.128179', '251', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (338, '2023-12-19 13:49:21.571689', '252', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (339, '2023-12-19 13:49:31.665050', '253', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (340, '2023-12-19 13:50:24.797880', '254', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (341, '2023-12-19 13:50:49.042946', '255', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (342, '2023-12-19 13:50:58.965898', '256', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (343, '2023-12-19 13:51:08.410928', '257', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (344, '2023-12-19 13:51:24.351939', '258', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (345, '2023-12-19 13:51:41.047600', '259', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (346, '2023-12-19 13:52:51.431406', '260', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (347, '2023-12-19 13:53:18.412351', '261', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (348, '2023-12-19 13:53:28.303909', '262', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (349, '2023-12-19 13:53:43.572490', '263', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (350, '2023-12-19 13:53:54.215489', '264', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (351, '2023-12-19 13:54:03.835564', '265', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (352, '2023-12-19 13:54:17.273883', '266', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (353, '2023-12-19 13:54:30.656875', '267', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (354, '2023-12-19 13:54:52.429538', '268', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (355, '2023-12-19 13:55:22.722047', '269', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (356, '2023-12-19 13:55:32.658368', '270', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (357, '2023-12-19 13:55:43.158942', '271', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (358, '2023-12-19 13:55:59.733135', '272', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (359, '2023-12-19 13:56:13.985022', '273', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (360, '2023-12-19 13:56:33.818149', '274', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (361, '2023-12-19 13:57:07.315237', '275', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (362, '2023-12-19 13:57:36.059461', '276', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (363, '2023-12-19 13:57:45.405682', '277', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (364, '2023-12-19 13:58:22.917589', '278', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (365, '2023-12-19 13:58:33.852668', '279', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (366, '2023-12-19 13:59:12.648668', '280', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (367, '2023-12-19 13:59:32.215375', '281', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (368, '2023-12-19 13:59:49.679961', '282', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (369, '2023-12-19 14:00:08.085109', '283', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (370, '2023-12-19 14:00:27.744313', '284', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (371, '2023-12-19 14:00:38.938633', '285', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (372, '2023-12-19 14:00:47.930054', '286', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (373, '2023-12-19 14:01:06.874278', '287', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (374, '2023-12-19 14:01:23.018833', '288', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (375, '2023-12-19 14:01:33.314736', '289', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (376, '2023-12-19 14:01:47.460598', '290', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (377, '2023-12-19 14:02:07.904506', '291', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (378, '2023-12-19 14:02:17.964263', '292', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (379, '2023-12-19 14:02:27.619791', '293', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (380, '2023-12-19 14:02:40.310824', '294', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (381, '2023-12-19 14:02:49.527037', '295', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (382, '2023-12-19 14:03:07.723403', '296', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (383, '2023-12-19 14:03:23.265283', '297', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (384, '2023-12-19 14:03:35.702429', '298', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (385, '2023-12-19 14:03:52.683539', '299', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (386, '2023-12-19 14:04:06.694329', '300', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (387, '2023-12-19 14:04:18.518054', '301', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (388, '2023-12-19 14:04:32.137245', '302', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (389, '2023-12-19 14:04:44.967798', '303', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (390, '2023-12-19 14:04:59.330127', '304', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (391, '2023-12-19 14:05:15.431031', '305', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (392, '2023-12-19 14:06:01.545652', '306', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (393, '2023-12-19 14:06:31.205380', '306', 'white', 2, '[{\"changed\": {\"fields\": [\"Product\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (394, '2023-12-19 14:06:54.433943', '307', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (395, '2023-12-19 14:07:15.558984', '308', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (396, '2023-12-19 14:07:37.945245', '309', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (397, '2023-12-19 14:07:50.620516', '310', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (398, '2023-12-19 14:08:05.634280', '311', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (399, '2023-12-19 14:08:37.471536', '312', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (400, '2023-12-19 14:08:49.495988', '313', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (401, '2023-12-19 14:09:10.302392', '314', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (402, '2023-12-19 14:10:48.363119', '315', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (403, '2023-12-19 14:11:28.251713', '316', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (404, '2023-12-19 14:11:42.121083', '317', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (405, '2023-12-19 14:11:57.338099', '318', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (406, '2023-12-19 14:12:16.112491', '319', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (407, '2023-12-19 14:12:26.114337', '320', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (408, '2023-12-19 14:12:35.824136', '321', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (409, '2023-12-19 14:12:54.827801', '322', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (410, '2023-12-19 14:13:12.616460', '323', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (411, '2023-12-19 14:13:25.122889', '324', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (412, '2023-12-19 14:13:37.091206', '325', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (413, '2023-12-19 14:13:58.417391', '326', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (414, '2023-12-19 14:14:09.421493', '327', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (415, '2023-12-19 14:14:35.671497', '328', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (416, '2023-12-19 14:14:46.258337', '329', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (417, '2023-12-19 14:14:57.524149', '330', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (418, '2023-12-19 14:15:12.052680', '331', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (419, '2023-12-19 14:15:25.267541', '332', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (420, '2023-12-19 14:15:39.680550', '333', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (421, '2023-12-19 14:15:57.383092', '334', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (422, '2023-12-19 14:16:17.986825', '335', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (423, '2023-12-19 14:16:30.862312', '336', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (424, '2023-12-19 14:16:45.409678', '337', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (425, '2023-12-19 14:16:56.322962', '338', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (426, '2023-12-19 14:17:18.600917', '339', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (427, '2023-12-19 14:17:33.164348', '340', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (428, '2023-12-19 14:17:43.759425', '341', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (429, '2023-12-19 14:17:58.526887', '342', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (430, '2023-12-19 14:18:29.746397', '343', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (431, '2023-12-19 14:18:38.899841', '344', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (432, '2023-12-19 14:19:03.531561', '345', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (433, '2023-12-19 14:19:20.081250', '346', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (434, '2023-12-19 14:19:32.734346', '347', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (435, '2023-12-19 14:19:42.394552', '348', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (436, '2023-12-19 14:19:52.359945', '349', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (437, '2023-12-19 14:20:02.209863', '350', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (438, '2023-12-19 14:20:14.453786', '351', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (439, '2023-12-19 14:20:32.600910', '352', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (440, '2023-12-19 14:20:46.191431', '353', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (441, '2023-12-19 14:22:05.116123', '354', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (442, '2023-12-19 14:22:20.269816', '355', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (443, '2023-12-19 14:25:13.423625', '356', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (444, '2023-12-19 14:25:34.850425', '357', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (445, '2023-12-19 14:28:10.793631', '358', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (446, '2023-12-19 14:28:22.592610', '359', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (447, '2023-12-19 14:28:54.005157', '360', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (448, '2023-12-19 14:29:14.363587', '361', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (449, '2023-12-19 14:29:26.991049', '362', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (450, '2023-12-19 14:29:37.244044', '363', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (451, '2023-12-19 14:29:54.240167', '364', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (452, '2023-12-19 14:30:08.955550', '365', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (453, '2023-12-19 14:30:20.652836', '366', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (454, '2023-12-19 14:30:31.710349', '367', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (455, '2023-12-19 14:30:45.917594', '368', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (456, '2023-12-19 14:31:24.769790', '369', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (457, '2023-12-19 14:31:39.336890', '370', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (458, '2023-12-19 14:31:52.638538', '371', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (459, '2023-12-19 14:32:06.955745', '372', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (460, '2023-12-19 14:32:23.620785', '373', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (461, '2023-12-19 14:32:45.224361', '374', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (462, '2023-12-19 14:33:03.304160', '375', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (463, '2023-12-19 14:33:13.814598', '376', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (464, '2023-12-19 14:33:25.942830', '377', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (465, '2023-12-19 14:33:45.094924', '378', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (466, '2023-12-19 14:34:02.764323', '379', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (467, '2023-12-19 14:34:23.166749', '380', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (468, '2023-12-19 14:34:34.015326', '381', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (469, '2023-12-19 14:34:53.725656', '382', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (470, '2023-12-19 14:35:07.616516', '383', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (471, '2023-12-19 14:35:29.676552', '384', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (472, '2023-12-19 14:35:50.095111', '385', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (473, '2023-12-19 14:36:11.572553', '386', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (474, '2023-12-19 14:36:31.238075', '387', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (475, '2023-12-19 14:36:43.533008', '388', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (476, '2023-12-19 14:36:59.886473', '389', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (477, '2023-12-19 14:37:12.058654', '390', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (478, '2023-12-19 14:37:31.154587', '391', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (479, '2023-12-19 14:37:44.016339', '392', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (480, '2023-12-19 14:38:53.610818', '393', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (481, '2023-12-19 14:39:09.803296', '394', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (482, '2023-12-19 14:39:25.022924', '395', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (483, '2023-12-19 14:39:36.571455', '396', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (484, '2023-12-19 14:40:11.551779', '397', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (485, '2023-12-19 14:40:29.087773', '398', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (486, '2023-12-19 14:40:42.283843', '399', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (487, '2023-12-19 14:40:57.102611', '400', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (488, '2023-12-19 14:41:40.564906', '401', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (489, '2023-12-19 14:41:50.468627', '402', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (490, '2023-12-19 14:48:31.300551', '403', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (491, '2023-12-19 14:48:46.518202', '404', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (492, '2023-12-19 14:49:15.113664', '405', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (493, '2023-12-19 15:21:22.664575', '406', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (494, '2023-12-19 15:22:13.563490', '407', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (495, '2023-12-19 15:22:32.013991', '408', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (496, '2023-12-19 15:22:43.839033', '409', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (497, '2023-12-19 15:23:21.073423', '410', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (498, '2023-12-19 15:23:31.877337', '411', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (499, '2023-12-19 15:23:45.741545', '412', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (500, '2023-12-19 15:24:17.081340', '413', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (501, '2023-12-19 15:24:34.750330', '414', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (502, '2023-12-19 15:24:46.760049', '415', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (503, '2023-12-19 15:24:57.194560', '416', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (504, '2023-12-19 15:25:09.949096', '417', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (505, '2023-12-19 15:25:24.166376', '418', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (506, '2023-12-19 15:25:47.347328', '419', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (507, '2023-12-19 15:26:06.618504', '420', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (508, '2023-12-19 15:26:17.483364', '421', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (509, '2023-12-19 15:26:36.470332', '422', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (510, '2023-12-19 15:27:24.477481', '423', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (511, '2023-12-19 15:27:38.223050', '424', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (512, '2023-12-19 15:27:59.583829', '425', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (513, '2023-12-19 15:28:13.795295', '426', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (514, '2023-12-19 15:28:24.492185', '427', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (515, '2023-12-19 15:28:43.806668', '428', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (516, '2023-12-19 15:28:58.351384', '429', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (517, '2023-12-19 15:29:11.317623', '430', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (518, '2023-12-19 15:29:25.703702', '431', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (519, '2023-12-19 15:30:00.545953', '432', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (520, '2023-12-19 15:30:16.796896', '433', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (521, '2023-12-19 15:30:30.444299', '434', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (522, '2023-12-19 15:30:54.247089', '435', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (523, '2023-12-19 15:31:07.739624', '436', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (524, '2023-12-19 15:32:59.450074', '437', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (525, '2023-12-19 15:33:31.087937', '406', 'M', 2, '[{\"changed\": {\"fields\": [\"Product\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (526, '2023-12-19 15:34:01.985740', '431', 'gold', 2, '[{\"changed\": {\"fields\": [\"Product\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (527, '2023-12-19 15:41:37.100277', '438', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (528, '2023-12-19 15:42:30.470634', '439', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (529, '2023-12-19 15:42:50.314973', '440', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (530, '2023-12-19 15:43:10.093707', '441', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (531, '2023-12-19 15:43:44.368014', '442', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (532, '2023-12-19 15:44:08.823542', '443', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (533, '2023-12-19 15:44:24.303787', '444', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (534, '2023-12-19 15:44:36.423467', '445', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (535, '2023-12-19 15:44:50.238580', '446', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (536, '2023-12-19 15:45:26.972786', '447', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (537, '2023-12-19 15:45:41.236607', '448', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (538, '2023-12-19 15:45:53.465968', '449', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (539, '2023-12-19 15:46:07.897755', '450', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (540, '2023-12-19 15:47:15.689961', '451', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (541, '2023-12-19 15:47:28.992578', '452', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (542, '2023-12-19 15:47:39.402014', '453', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (543, '2023-12-19 15:48:14.612913', '454', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (544, '2023-12-19 15:50:31.960648', '455', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (545, '2023-12-19 15:50:44.574993', '456', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (546, '2023-12-19 15:51:12.000169', '457', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (547, '2023-12-19 15:51:26.832954', '458', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (548, '2023-12-19 15:52:03.198808', '459', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (549, '2023-12-19 15:52:13.108625', '460', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (550, '2023-12-19 15:52:25.695309', '461', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (551, '2023-12-19 15:52:47.159269', '462', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (552, '2023-12-19 15:52:59.185834', '463', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (553, '2023-12-19 15:53:18.096993', '464', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (554, '2023-12-19 15:53:32.591317', '465', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (555, '2023-12-19 15:53:44.943146', '466', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (556, '2023-12-19 15:54:04.969116', '467', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (557, '2023-12-19 15:54:27.968676', '468', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (558, '2023-12-19 15:55:32.468792', '469', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (559, '2023-12-19 15:55:44.793874', '470', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (560, '2023-12-19 15:56:00.079936', '471', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (561, '2023-12-19 15:56:44.839075', '472', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (562, '2023-12-19 15:57:12.122037', '473', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (563, '2023-12-19 15:57:25.336621', '474', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (564, '2023-12-19 16:06:11.496539', '475', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (565, '2023-12-19 16:06:49.257932', '476', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (566, '2023-12-19 16:47:32.168926', '477', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (567, '2023-12-19 16:47:58.917516', '478', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (568, '2023-12-19 16:48:16.362021', '479', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (569, '2023-12-19 16:48:38.543741', '480', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (570, '2023-12-19 16:48:56.141875', '481', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (571, '2023-12-19 16:49:21.324822', '482', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (572, '2023-12-19 16:50:07.025559', '483', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (573, '2023-12-19 16:50:19.702600', '484', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (574, '2023-12-19 16:50:47.091800', '485', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (575, '2023-12-19 16:51:01.755862', '486', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (576, '2023-12-19 16:52:29.055539', '487', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (577, '2023-12-19 16:52:42.355510', '488', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (578, '2023-12-19 16:52:56.965699', '489', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (579, '2023-12-19 16:53:15.641601', '490', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (580, '2023-12-19 16:54:07.314554', '491', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (581, '2023-12-19 16:54:30.908963', '492', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (582, '2023-12-19 16:55:05.949783', '493', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (583, '2023-12-19 16:56:03.956046', '494', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (584, '2023-12-19 16:57:16.143181', '495', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (585, '2023-12-19 16:57:55.368345', '496', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (586, '2023-12-19 16:59:09.759216', '497', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (587, '2023-12-19 17:00:01.221642', '498', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (588, '2023-12-19 17:00:29.368685', '499', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (589, '2023-12-19 17:02:23.074752', '500', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (590, '2023-12-19 17:02:40.283721', '501', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (591, '2023-12-19 17:03:40.764849', '502', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (592, '2023-12-19 17:03:55.641805', '503', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (593, '2023-12-19 17:04:15.300033', '504', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (594, '2023-12-19 17:04:27.903431', '505', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (595, '2023-12-19 17:09:06.342461', '506', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (596, '2023-12-19 17:09:27.208061', '507', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (597, '2023-12-19 17:09:50.490821', '508', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (598, '2023-12-19 17:10:08.649014', '509', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (599, '2023-12-19 17:10:43.882031', '510', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (600, '2023-12-19 17:12:24.676808', '511', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (601, '2023-12-19 17:13:02.047858', '512', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (602, '2023-12-19 17:13:35.397597', '451', 'M', 2, '[{\"changed\": {\"fields\": [\"Product\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (603, '2023-12-19 17:14:10.347384', '451', 'M', 2, '[{\"changed\": {\"fields\": [\"Product\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (604, '2023-12-19 17:15:09.778677', '513', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (605, '2023-12-19 17:15:29.170905', '514', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (606, '2023-12-19 17:15:53.292470', '515', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (607, '2023-12-19 17:16:30.043228', '516', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (608, '2023-12-19 17:16:55.108049', '517', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (609, '2023-12-19 17:17:29.696097', '518', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (610, '2023-12-19 17:17:43.097106', '519', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (611, '2023-12-19 17:18:00.805859', '520', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (612, '2023-12-19 17:18:17.752410', '521', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (613, '2023-12-19 17:18:35.169003', '522', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (614, '2023-12-19 17:18:46.546731', '523', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (615, '2023-12-19 17:19:05.438796', '524', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (616, '2023-12-19 17:19:18.321851', '525', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (617, '2023-12-19 17:48:27.887361', '526', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (618, '2023-12-19 17:48:58.453887', '527', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (619, '2023-12-19 17:49:20.645264', '528', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (620, '2023-12-19 17:49:49.864286', '529', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (621, '2023-12-19 17:50:11.816320', '530', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (622, '2023-12-19 17:50:29.443118', '531', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (623, '2023-12-19 17:50:49.080200', '532', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (624, '2023-12-19 17:51:06.092066', '533', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (625, '2023-12-19 17:51:24.116035', '534', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (626, '2023-12-19 17:51:50.229969', '535', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (627, '2023-12-19 17:52:09.564576', '536', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (628, '2023-12-19 17:52:25.707953', '537', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (629, '2023-12-19 17:52:48.972649', '538', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (630, '2023-12-19 17:53:00.533389', '539', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (631, '2023-12-19 17:53:15.394731', '540', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (632, '2023-12-19 17:53:40.871117', '541', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (633, '2023-12-19 17:53:55.087416', '542', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (634, '2023-12-19 17:54:17.507185', '543', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (635, '2023-12-19 17:55:04.339537', '544', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (636, '2023-12-19 17:55:19.958469', '545', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (637, '2023-12-19 17:55:35.196746', '546', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (638, '2023-12-19 17:56:00.387049', '547', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (639, '2023-12-19 17:56:31.416244', '548', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (640, '2023-12-19 17:56:52.006208', '549', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (641, '2023-12-19 17:57:22.436961', '550', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (642, '2023-12-19 17:57:57.082729', '551', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (643, '2023-12-19 17:58:11.383629', '552', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (644, '2023-12-19 17:58:40.787661', '553', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (645, '2023-12-19 17:58:57.684986', '554', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (646, '2023-12-19 17:59:12.749884', '555', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (647, '2023-12-19 17:59:31.979263', '556', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (648, '2023-12-19 18:00:06.026404', '557', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (649, '2023-12-19 18:00:23.681562', '558', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (650, '2023-12-19 18:01:02.660715', '559', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (651, '2023-12-19 18:01:27.303047', '560', 'black', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (652, '2023-12-19 18:01:41.712735', '561', 'white', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (653, '2023-12-19 18:02:05.052397', '562', 'gray', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (654, '2023-12-19 18:02:19.760922', '563', 'gold', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (655, '2023-12-19 18:02:39.448810', '564', 'red', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (656, '2023-12-19 18:02:52.458201', '565', 'M', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (657, '2023-12-19 18:03:31.572115', '566', 'L', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (658, '2023-12-19 18:03:57.071239', '567', 'XL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (659, '2023-12-19 18:04:32.519570', '568', 'XXL', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (660, '2023-12-30 14:18:52.335103', '3', 'CartItem object (3)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (661, '2023-12-30 14:18:52.879354', '2', 'CartItem object (2)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (662, '2023-12-30 14:18:52.988050', '1', 'CartItem object (1)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (663, '2023-12-30 14:19:06.479507', '1', '36jqa91sllat06jh9nvfythxn6wzujuy', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (664, '2024-01-01 14:33:26.874170', '6', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (665, '2024-01-01 14:33:27.026422', '5', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (666, '2024-01-01 14:33:27.120720', '4', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (667, '2024-01-01 14:33:27.248523', '3', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (668, '2024-01-01 14:33:27.591811', '2', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (669, '2024-01-01 14:33:27.898468', '1', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (670, '2024-01-01 17:52:33.423521', '14', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (671, '2024-01-01 17:52:33.555588', '13', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (672, '2024-01-01 17:52:33.627385', '12', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (673, '2024-01-01 17:52:33.738915', '11', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (674, '2024-01-01 17:52:33.863520', '10', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (675, '2024-01-01 17:52:34.204730', '9', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (676, '2024-01-01 17:52:34.293618', '8', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (677, '2024-01-01 17:52:34.438047', '7', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (678, '2024-01-01 18:49:22.561526', '19', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (679, '2024-01-01 18:49:22.717565', '18', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (680, '2024-01-01 18:49:22.845901', '17', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (681, '2024-01-01 18:49:22.950247', '16', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (682, '2024-01-01 18:49:23.017406', '15', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (683, '2024-01-01 19:00:35.452583', '25', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (684, '2024-01-01 19:00:35.624322', '24', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (685, '2024-01-01 19:00:35.755257', '23', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (686, '2024-01-01 19:00:35.921410', '22', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (687, '2024-01-01 19:00:36.170036', '21', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (688, '2024-01-01 19:00:36.312878', '20', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (689, '2024-01-02 13:11:11.682649', '28', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (690, '2024-01-02 13:11:11.837994', '27', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (691, '2024-01-02 13:11:11.898162', '26', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (692, '2024-01-02 13:26:51.999911', '31', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (693, '2024-01-02 13:26:52.481407', '30', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (694, '2024-01-02 13:26:52.606868', '29', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (695, '2024-01-02 15:32:46.334137', '34', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (696, '2024-01-02 15:32:46.451223', '33', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (697, '2024-01-02 15:32:46.638724', '32', 'cheikh', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (698, '2024-01-03 10:42:30.168266', '38', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (699, '2024-01-03 10:42:30.280254', '37', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (700, '2024-01-03 10:42:30.343974', '36', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (701, '2024-01-03 10:42:30.462485', '35', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (702, '2024-01-03 12:38:19.781084', '48', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (703, '2024-01-03 12:38:19.907839', '47', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (704, '2024-01-03 12:38:20.029899', '46', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (705, '2024-01-03 12:38:20.365321', '45', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (706, '2024-01-03 12:38:20.529815', '44', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (707, '2024-01-03 12:38:20.672506', '43', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (708, '2024-01-03 12:38:20.848705', '42', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (709, '2024-01-03 12:38:21.013081', '41', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (710, '2024-01-03 12:38:21.136341', '40', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (711, '2024-01-03 12:38:21.258265', '39', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (712, '2024-01-05 11:23:58.165971', '57', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (713, '2024-01-05 11:23:58.375581', '56', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (714, '2024-01-05 11:23:58.806413', '55', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (715, '2024-01-05 11:23:58.852418', '54', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (716, '2024-01-05 11:23:58.912616', '53', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (717, '2024-01-05 11:23:59.079406', '52', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (718, '2024-01-05 11:23:59.269299', '51', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (719, '2024-01-05 11:23:59.361637', '50', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (720, '2024-01-05 11:23:59.578359', '49', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (721, '2024-01-05 12:32:22.178740', '60', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (722, '2024-01-05 12:32:22.296673', '59', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (723, '2024-01-05 12:32:22.504848', '58', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (724, '2024-01-05 12:49:26.522961', '64', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (725, '2024-01-05 12:49:26.744750', '63', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (726, '2024-01-05 12:49:26.800883', '62', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (727, '2024-01-05 12:49:26.884205', '61', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (728, '2024-01-05 17:13:30.143807', '68', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (729, '2024-01-05 17:13:30.467852', '67', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (730, '2024-01-05 17:13:30.810142', '66', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (731, '2024-01-05 17:13:31.121207', '65', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (732, '2024-01-05 18:16:36.816509', '78', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (733, '2024-01-05 18:16:36.938679', '77', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (734, '2024-01-05 18:16:37.005342', '76', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (735, '2024-01-05 18:16:37.067438', '75', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (736, '2024-01-05 18:16:37.193657', '74', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (737, '2024-01-05 18:16:37.894490', '73', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (738, '2024-01-05 18:16:38.048639', '72', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (739, '2024-01-05 18:16:38.275983', '71', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (740, '2024-01-05 18:16:38.580291', '70', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (741, '2024-01-05 18:16:38.872990', '69', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (742, '2024-01-06 12:53:33.264609', '85', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (743, '2024-01-06 12:53:33.674320', '84', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (744, '2024-01-06 12:53:33.815191', '83', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (745, '2024-01-06 12:53:34.065388', '82', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (746, '2024-01-06 12:53:34.901516', '81', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (747, '2024-01-06 12:53:34.968796', '80', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (748, '2024-01-06 12:53:35.112177', '79', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (749, '2024-01-09 16:20:33.187992', '122', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (750, '2024-01-09 16:20:33.272128', '121', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (751, '2024-01-09 16:20:33.351666', '120', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (752, '2024-01-09 16:20:33.510920', '119', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (753, '2024-01-09 16:20:33.731562', '118', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (754, '2024-01-09 16:20:33.860870', '117', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (755, '2024-01-09 16:20:34.011368', '116', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (756, '2024-01-09 16:20:34.511267', '115', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (757, '2024-01-09 16:20:34.616753', '114', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (758, '2024-01-09 16:20:34.786682', '113', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (759, '2024-01-09 16:20:34.905385', '112', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (760, '2024-01-09 16:20:34.994459', '111', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (761, '2024-01-09 16:20:35.283274', '110', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (762, '2024-01-09 16:20:35.371959', '109', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (763, '2024-01-09 16:20:35.510070', '108', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (764, '2024-01-09 16:20:35.732480', '107', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (765, '2024-01-09 16:20:35.820277', '106', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (766, '2024-01-09 16:20:35.887242', '105', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (767, '2024-01-09 16:20:35.972218', '104', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (768, '2024-01-09 16:20:36.064587', '103', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (769, '2024-01-09 16:20:59.447648', '102', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (770, '2024-01-09 16:20:59.530458', '101', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (771, '2024-01-09 16:20:59.684478', '100', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (772, '2024-01-09 16:20:59.907875', '99', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (773, '2024-01-09 16:21:00.025753', '98', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (774, '2024-01-09 16:21:00.096024', '97', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (775, '2024-01-09 16:21:00.181976', '96', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (776, '2024-01-09 16:21:00.248783', '95', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (777, '2024-01-09 16:21:00.316329', '94', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (778, '2024-01-09 16:21:00.406724', '93', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (779, '2024-01-09 16:21:00.584651', '92', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (780, '2024-01-09 16:21:01.009890', '91', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (781, '2024-01-09 16:21:01.140644', '90', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (782, '2024-01-09 16:21:01.206507', '89', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (783, '2024-01-09 16:21:01.327337', '88', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (784, '2024-01-09 16:21:01.448631', '87', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (785, '2024-01-09 16:21:01.573716', '86', 'Cheikh Sadibou', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (786, '2024-01-09 16:37:50.544418', '3', 'my reviews', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (787, '2024-01-09 17:17:41.146817', '3', 'my reviews', 2, '[{\"changed\": {\"fields\": [\"Rating\"]}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (788, '2024-01-09 17:22:37.474431', '3', 'my reviews', 2, '[{\"changed\": {\"fields\": [\"Rating\"]}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (789, '2024-01-09 18:12:31.121996', '2', 'My review', 2, '[{\"changed\": {\"fields\": [\"Rating\"]}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (790, '2024-01-09 19:01:43.015396', '3', 'my reviews', 2, '[{\"changed\": {\"fields\": [\"Rating\"]}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (791, '2024-01-09 19:01:53.152678', '2', 'My review', 2, '[{\"changed\": {\"fields\": [\"Rating\"]}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (792, '2024-01-11 18:08:27.539722', '1', 'Cheikh Sadibou', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (793, '2024-01-12 19:38:48.335736', '64', 'Casquette star', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette star\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (794, '2024-01-12 19:49:08.694110', '6', 'BOOTS SANTONI CARTER', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"BOOTS SANTONI CARTER\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (795, '2024-01-12 19:49:26.672344', '6', 'BOOTS SANTONI CARTER', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"BOOTS SANTONI CARTER\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (796, '2024-01-12 19:49:43.832968', '6', 'BOOTS SANTONI CARTER', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"BOOTS SANTONI CARTER\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (797, '2024-01-13 12:17:21.272163', '1', 'Choes de sport', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Choes de sport\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (798, '2024-01-13 12:18:19.391369', '1', 'Choes de sport', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Choes de sport\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (799, '2024-01-13 12:18:46.088185', '1', 'Choes de sport', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Choes de sport\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (800, '2024-01-13 12:19:10.381348', '1', 'Choes de sport', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Choes de sport\"}}, {\"changed\": {\"name\": \"productgallery\", \"object\": \"Choes de sport\", \"fields\": [\"Image\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (801, '2024-01-13 12:19:28.078394', '1', 'Choes de sport', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Choes de sport\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (802, '2024-01-13 12:19:53.762972', '1', 'Choes de sport', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Choes de sport\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (803, '2024-01-13 12:35:35.399114', '2', 'Chaussure haute de gamme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chaussure haute de gamme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (804, '2024-01-13 12:35:52.572815', '2', 'Chaussure haute de gamme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chaussure haute de gamme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (805, '2024-01-13 12:36:04.167930', '2', 'Chaussure haute de gamme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chaussure haute de gamme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (806, '2024-01-13 12:36:17.891650', '2', 'Chaussure haute de gamme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chaussure haute de gamme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (807, '2024-01-13 12:45:17.611776', '3', 'Chaussures pour un mariage', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chaussures pour un mariage\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (808, '2024-01-13 12:45:27.136622', '3', 'Chaussures pour un mariage', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chaussures pour un mariage\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (809, '2024-01-13 12:45:49.495644', '3', 'Chaussures pour un mariage', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chaussures pour un mariage\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (810, '2024-01-13 12:46:00.497678', '3', 'Chaussures pour un mariage', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chaussures pour un mariage\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (811, '2024-01-13 12:54:35.184446', '4', 'chaussures hommes haut de gamme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"chaussures hommes haut de gamme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (812, '2024-01-13 12:54:46.621473', '4', 'chaussures hommes haut de gamme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"chaussures hommes haut de gamme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (813, '2024-01-13 12:54:58.282181', '4', 'chaussures hommes haut de gamme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"chaussures hommes haut de gamme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (814, '2024-01-13 12:55:34.486370', '4', 'chaussures hommes haut de gamme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"chaussures hommes haut de gamme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (815, '2024-01-13 12:55:39.265089', '4', 'chaussures hommes haut de gamme', 2, '[]', 8, 1);
INSERT INTO `django_admin_log` VALUES (816, '2024-01-13 12:55:49.741070', '4', 'chaussures hommes haut de gamme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"chaussures hommes haut de gamme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (817, '2024-01-13 13:15:10.162480', '5', 'Chaussure de running Marine', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chaussure de running Marine\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (818, '2024-01-13 13:15:25.170285', '5', 'Chaussure de running Marine', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chaussure de running Marine\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (819, '2024-01-13 13:15:39.885443', '5', 'Chaussure de running Marine', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chaussure de running Marine\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (820, '2024-01-13 13:15:58.267977', '5', 'Chaussure de running Marine', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chaussure de running Marine\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (821, '2024-01-13 13:22:44.372231', '7', 'Chaussures adidas', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chaussures adidas\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (822, '2024-01-13 13:23:02.408110', '7', 'Chaussures adidas', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chaussures adidas\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (823, '2024-01-13 13:23:14.087251', '7', 'Chaussures adidas', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chaussures adidas\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (824, '2024-01-13 13:23:27.735332', '7', 'Chaussures adidas', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chaussures adidas\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (825, '2024-01-13 13:45:20.534403', '8', 'Sandales cuir homme artisanales', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales cuir homme artisanales\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (826, '2024-01-13 13:45:35.373177', '8', 'Sandales cuir homme artisanales', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales cuir homme artisanales\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (827, '2024-01-13 13:51:28.370535', '8', 'Sandales cuir homme artisanales', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales cuir homme artisanales\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (828, '2024-01-13 14:07:32.516316', '9', 'Mode homme sandale en cuir', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Mode homme sandale en cuir\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (829, '2024-01-13 14:07:42.987284', '9', 'Mode homme sandale en cuir', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Mode homme sandale en cuir\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (830, '2024-01-13 14:07:46.885766', '9', 'Mode homme sandale en cuir', 2, '[]', 8, 1);
INSERT INTO `django_admin_log` VALUES (831, '2024-01-13 14:08:02.197056', '9', 'Mode homme sandale en cuir', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Mode homme sandale en cuir\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (832, '2024-01-13 14:17:59.729514', '10', 'sandales coups de c?ur', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sandales coups de c\\u0153ur\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (833, '2024-01-13 14:18:08.535734', '10', 'sandales coups de c?ur', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sandales coups de c\\u0153ur\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (834, '2024-01-13 14:27:29.431746', '11', 'sandales en cuir Zeus', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sandales en cuir Zeus\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (835, '2024-01-13 14:27:48.516514', '11', 'sandales en cuir Zeus', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sandales en cuir Zeus\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (836, '2024-01-13 14:27:59.071279', '11', 'sandales en cuir Zeus', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sandales en cuir Zeus\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (837, '2024-01-13 14:28:09.215557', '11', 'sandales en cuir Zeus', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sandales en cuir Zeus\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (838, '2024-01-13 14:45:26.054245', '12', 'sandales cuir bio', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sandales cuir bio\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (839, '2024-01-13 14:45:37.055166', '12', 'sandales cuir bio', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sandales cuir bio\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (840, '2024-01-13 14:45:46.052750', '12', 'sandales cuir bio', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sandales cuir bio\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (841, '2024-01-13 14:46:02.639546', '12', 'sandales cuir bio', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sandales cuir bio\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (842, '2024-01-13 15:40:36.007430', '13', 'sandale Artisanat Maroc', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sandale Artisanat Maroc\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (843, '2024-01-13 15:40:49.204063', '13', 'sandale Artisanat Maroc', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sandale Artisanat Maroc\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (844, '2024-01-13 16:00:30.047485', '14', 'Sandales grises Chaussures Compensées', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales grises Chaussures Compens\\u00e9es\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (845, '2024-01-13 16:00:41.200237', '14', 'Sandales grises Chaussures Compensées', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales grises Chaussures Compens\\u00e9es\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (846, '2024-01-13 16:00:53.543567', '14', 'Sandales grises Chaussures Compensées', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales grises Chaussures Compens\\u00e9es\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (847, '2024-01-13 16:01:06.862177', '14', 'Sandales grises Chaussures Compensées', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales grises Chaussures Compens\\u00e9es\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (848, '2024-01-13 16:10:06.350615', '15', 'Sandales grises Chaussures', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales grises Chaussures\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (849, '2024-01-13 16:10:15.262189', '15', 'Sandales grises Chaussures', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales grises Chaussures\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (850, '2024-01-13 16:10:26.377397', '15', 'Sandales grises Chaussures', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales grises Chaussures\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (851, '2024-01-13 16:10:36.452929', '15', 'Sandales grises Chaussures', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales grises Chaussures\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (852, '2024-01-13 16:22:41.059053', '15', 'Sandales grises Chaussures', 2, '[{\"changed\": {\"fields\": [\"Images\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (853, '2024-01-13 16:24:38.636940', '19', 'Sandales talon argentin', 2, '[{\"changed\": {\"fields\": [\"Product name\", \"Images\"]}}, {\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales talon argentin\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (854, '2024-01-13 16:24:49.263139', '19', 'Sandales talon argentin', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales talon argentin\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (855, '2024-01-13 16:24:59.539647', '19', 'Sandales talon argentin', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales talon argentin\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (856, '2024-01-13 16:29:30.796740', '16', 'Sandales Cuir N°902  Doré', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales Cuir N\\u00b0902  Dor\\u00e9\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (857, '2024-01-13 16:29:48.883208', '16', 'Sandales Cuir N°902  Doré', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales Cuir N\\u00b0902  Dor\\u00e9\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (858, '2024-01-13 16:29:59.680506', '16', 'Sandales Cuir N°902  Doré', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales Cuir N\\u00b0902  Dor\\u00e9\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (859, '2024-01-13 16:30:11.440333', '16', 'Sandales Cuir N°902  Doré', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales Cuir N\\u00b0902  Dor\\u00e9\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (860, '2024-01-13 16:34:27.434834', '17', 'Femme Sandales en Cuir en Noir', 2, '[{\"changed\": {\"fields\": [\"Product name\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (861, '2024-01-13 16:34:45.967086', '17', 'Femme Sandales en Cuir en Noir', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Femme Sandales en Cuir en Noir\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (862, '2024-01-13 16:34:50.591569', '17', 'Femme Sandales en Cuir en Noir', 2, '[]', 8, 1);
INSERT INTO `django_admin_log` VALUES (863, '2024-01-13 16:34:59.584307', '17', 'Femme Sandales en Cuir en Noir', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Femme Sandales en Cuir en Noir\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (864, '2024-01-13 16:35:11.437829', '17', 'Femme Sandales en Cuir en Noir', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Femme Sandales en Cuir en Noir\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (865, '2024-01-13 16:35:27.021106', '17', 'Femme Sandales en Cuir en Noir', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Femme Sandales en Cuir en Noir\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (866, '2024-01-13 16:37:04.983537', '17', 'Femme Sandales Cuir en Noir', 2, '[{\"changed\": {\"fields\": [\"Product name\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (867, '2024-01-13 16:42:20.505489', '18', 'Sandales & Nu-pieds', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales & Nu-pieds\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (868, '2024-01-13 16:42:31.078333', '18', 'Sandales & Nu-pieds', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales & Nu-pieds\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (869, '2024-01-13 16:42:40.633227', '18', 'Sandales & Nu-pieds', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales & Nu-pieds\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (870, '2024-01-13 16:42:50.526111', '18', 'Sandales & Nu-pieds', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sandales & Nu-pieds\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (871, '2024-01-13 16:47:50.828863', '20', 'sandale casadei-femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sandale casadei-femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (872, '2024-01-13 16:48:04.824989', '20', 'sandale casadei-femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sandale casadei-femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (873, '2024-01-13 16:48:21.811190', '20', 'sandale casadei-femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sandale casadei-femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (874, '2024-01-13 16:48:32.077749', '20', 'sandale casadei-femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sandale casadei-femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (875, '2024-01-13 17:01:48.018265', '21', 'Sac titangamingbackpackg', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac titangamingbackpackg\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (876, '2024-01-13 17:01:58.035856', '21', 'Sac titangamingbackpackg', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac titangamingbackpackg\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (877, '2024-01-13 17:02:13.719061', '21', 'Sac titangamingbackpackg', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac titangamingbackpackg\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (878, '2024-01-13 17:02:25.199292', '21', 'Sac titangamingbackpackg', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac titangamingbackpackg\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (879, '2024-01-13 17:14:25.497865', '22', 'sac-vintage-gris', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sac-vintage-gris\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (880, '2024-01-13 17:14:36.517372', '22', 'sac-vintage-gris', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sac-vintage-gris\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (881, '2024-01-13 17:14:46.766330', '22', 'sac-vintage-gris', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sac-vintage-gris\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (882, '2024-01-13 17:15:06.363241', '22', 'sac-vintage-gris', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sac-vintage-gris\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (883, '2024-01-13 17:44:37.861452', '23', 'Sac de voyage', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac de voyage\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (884, '2024-01-13 17:44:51.142619', '23', 'Sac de voyage', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac de voyage\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (885, '2024-01-13 17:45:04.932801', '23', 'Sac de voyage', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac de voyage\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (886, '2024-01-13 17:45:19.525031', '23', 'Sac de voyage', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac de voyage\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (887, '2024-01-13 17:45:30.876091', '23', 'Sac de voyage', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac de voyage\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (888, '2024-01-13 18:02:42.900425', '24', 'Sac À Do Femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac \\u00c0 Do Femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (889, '2024-01-13 18:02:52.130759', '24', 'Sac À Do Femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac \\u00c0 Do Femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (890, '2024-01-13 18:03:02.293641', '24', 'Sac À Do Femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac \\u00c0 Do Femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (891, '2024-01-13 18:03:26.672883', '24', 'Sac À Do Femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac \\u00c0 Do Femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (892, '2024-01-13 18:03:56.423486', '24', 'Sac À Do Femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac \\u00c0 Do Femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (893, '2024-01-13 18:17:08.201246', '25', 'sac-a-dos', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sac-a-dos\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (894, '2024-01-13 18:17:18.531212', '25', 'sac-a-dos', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sac-a-dos\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (895, '2024-01-13 18:17:30.541839', '25', 'sac-a-dos', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sac-a-dos\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (896, '2024-01-13 18:17:46.733058', '25', 'sac-a-dos', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"sac-a-dos\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (897, '2024-01-13 18:30:14.818516', '26', 'Sac-a-dos-enfant', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac-a-dos-enfant\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (898, '2024-01-13 18:30:31.855627', '26', 'Sac-a-dos-enfant', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac-a-dos-enfant\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (899, '2024-01-13 18:30:41.780703', '26', 'Sac-a-dos-enfant', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac-a-dos-enfant\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (900, '2024-01-13 18:30:57.624315', '26', 'Sac-a-dos-enfant', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac-a-dos-enfant\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (901, '2024-01-13 18:31:59.537754', '26', 'Sac-a-dos-enfant', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac-a-dos-enfant\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (902, '2024-01-13 18:36:24.848690', '27', 'Sac Ordinateur', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac Ordinateur\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (903, '2024-01-13 18:36:36.115345', '27', 'Sac Ordinateur', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac Ordinateur\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (904, '2024-01-13 18:36:46.843375', '27', 'Sac Ordinateur', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac Ordinateur\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (905, '2024-01-13 18:36:55.537559', '27', 'Sac Ordinateur', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Sac Ordinateur\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (906, '2024-01-13 18:43:11.692776', '28', 'Pantalons Simples Homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Pantalons Simples Homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (907, '2024-01-13 18:43:21.178094', '28', 'Pantalons Simples Homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Pantalons Simples Homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (908, '2024-01-13 18:43:32.845365', '28', 'Pantalons Simples Homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Pantalons Simples Homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (909, '2024-01-13 18:43:42.962868', '28', 'Pantalons Simples Homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Pantalons Simples Homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (910, '2024-01-13 18:53:32.842726', '29', 'jean homme Super cent', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"jean homme Super cent\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (911, '2024-01-13 18:53:41.395756', '29', 'jean homme Super cent', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"jean homme Super cent\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (912, '2024-01-13 18:53:51.251159', '29', 'jean homme Super cent', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"jean homme Super cent\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (913, '2024-01-13 18:54:03.224531', '29', 'jean homme Super cent', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"jean homme Super cent\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (914, '2024-01-13 19:28:34.703965', '30', 'Pantalon Casse Super 100 Homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Pantalon Casse Super 100 Homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (915, '2024-01-13 19:28:47.196722', '30', 'Pantalon Casse Super 100 Homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Pantalon Casse Super 100 Homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (916, '2024-01-13 19:28:59.619651', '30', 'Pantalon Casse Super 100 Homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Pantalon Casse Super 100 Homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (917, '2024-01-13 19:29:11.841272', '30', 'Pantalon Casse Super 100 Homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Pantalon Casse Super 100 Homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (918, '2024-01-13 19:46:13.426167', '31', 'WATCH APPL E-shop S9', 2, '[{\"changed\": {\"fields\": [\"Product name\"]}}, {\"added\": {\"name\": \"productgallery\", \"object\": \"WATCH APPL E-shop S9\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (919, '2024-01-13 19:46:22.738851', '31', 'WATCH APPL E-shop S9', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"WATCH APPL E-shop S9\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (920, '2024-01-13 19:46:33.875768', '31', 'WATCH APPL E-shop S9', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"WATCH APPL E-shop S9\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (921, '2024-01-13 19:46:50.277983', '31', 'WATCH APPL E-shop S9', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"WATCH APPL E-shop S9\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (922, '2024-01-13 19:52:47.165736', '32', 'HUAWEI Watch 3 GT', 2, '[{\"changed\": {\"fields\": [\"Product name\", \"Slug\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (923, '2024-01-13 19:56:18.305401', '32', 'HUAWEI Watch 3 GT', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"HUAWEI Watch 3 GT\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (924, '2024-01-13 19:56:28.366436', '32', 'HUAWEI Watch 3 GT', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"HUAWEI Watch 3 GT\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (925, '2024-01-13 19:56:40.738882', '32', 'HUAWEI Watch 3 GT', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"HUAWEI Watch 3 GT\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (926, '2024-01-15 10:33:00.983614', '33', 'PERPETUAL STAINLESS STEEL', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"PERPETUAL STAINLESS STEEL\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (927, '2024-01-15 10:33:05.292447', '33', 'PERPETUAL STAINLESS STEEL', 2, '[]', 8, 1);
INSERT INTO `django_admin_log` VALUES (928, '2024-01-15 10:33:12.970002', '33', 'PERPETUAL STAINLESS STEEL', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"PERPETUAL STAINLESS STEEL\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (929, '2024-01-15 10:33:25.206152', '33', 'PERPETUAL STAINLESS STEEL', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"PERPETUAL STAINLESS STEEL\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (930, '2024-01-15 10:37:15.188652', '33', 'PERPETUAL STAINLESS STEEL', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"PERPETUAL STAINLESS STEEL\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (931, '2024-01-15 10:50:37.746453', '34', 'Circle Smart Watch', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Circle Smart Watch\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (932, '2024-01-15 10:50:49.137513', '34', 'Circle Smart Watch', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Circle Smart Watch\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (933, '2024-01-15 10:50:57.857146', '34', 'Circle Smart Watch', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Circle Smart Watch\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (934, '2024-01-15 10:51:06.883942', '34', 'Circle Smart Watch', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Circle Smart Watch\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (935, '2024-01-15 15:50:08.792650', '34', 'Circle Smart Watch', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Circle Smart Watch\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (936, '2024-01-15 16:09:00.421665', '35', 'Buy HUAWEI WATCH GT 3', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Buy HUAWEI WATCH GT 3\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (937, '2024-01-15 16:09:11.925172', '35', 'Buy HUAWEI WATCH GT 3', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Buy HUAWEI WATCH GT 3\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (938, '2024-01-15 16:09:21.981123', '35', 'Buy HUAWEI WATCH GT 3', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Buy HUAWEI WATCH GT 3\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (939, '2024-01-15 16:16:33.716100', '36', 'Apple Watch Series 9', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Apple Watch Series 9\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (940, '2024-01-15 16:16:42.221669', '36', 'Apple Watch Series 9', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Apple Watch Series 9\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (941, '2024-01-15 16:16:51.030627', '36', 'Apple Watch Series 9', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Apple Watch Series 9\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (942, '2024-01-15 16:16:59.524540', '36', 'Apple Watch Series 9', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Apple Watch Series 9\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (943, '2024-01-15 16:35:18.090891', '37', 'Watch - Apple', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Watch - Apple\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (944, '2024-01-15 16:35:27.872417', '37', 'Watch - Apple', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Watch - Apple\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (945, '2024-01-15 16:35:38.189820', '37', 'Watch - Apple', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Watch - Apple\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (946, '2024-01-15 16:35:48.211832', '37', 'Watch - Apple', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Watch - Apple\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (947, '2024-01-15 16:45:49.320016', '38', 'Apple Watch Ultra 2', 2, '[{\"changed\": {\"fields\": [\"Product name\", \"Slug\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (948, '2024-01-15 16:47:15.642462', '38', 'Apple Watch Ultra 2', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Apple Watch Ultra 2\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (949, '2024-01-15 16:47:40.631827', '38', 'Apple Watch Ultra 2', 2, '[]', 8, 1);
INSERT INTO `django_admin_log` VALUES (950, '2024-01-15 16:47:51.303044', '38', 'Apple Watch Ultra 2', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Apple Watch Ultra 2\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (951, '2024-01-15 16:48:02.917324', '38', 'Apple Watch Ultra 2', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Apple Watch Ultra 2\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (952, '2024-01-15 17:09:26.963747', '39', 'Lacoste', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Lacoste\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (953, '2024-01-15 17:09:35.975769', '39', 'Lacoste', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Lacoste\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (954, '2024-01-15 17:09:45.597740', '39', 'Lacoste', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Lacoste\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (955, '2024-01-15 17:10:02.279560', '39', 'Lacoste', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Lacoste\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (956, '2024-01-15 18:02:51.523894', '40', 'LACOSTE  Bleu marine', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"LACOSTE  Bleu marine\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (957, '2024-01-15 18:03:00.107218', '40', 'LACOSTE  Bleu marine', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"LACOSTE  Bleu marine\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (958, '2024-01-15 18:03:08.827382', '40', 'LACOSTE  Bleu marine', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"LACOSTE  Bleu marine\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (959, '2024-01-15 18:03:18.372706', '40', 'LACOSTE  Bleu marine', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"LACOSTE  Bleu marine\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (960, '2024-01-15 18:12:47.097155', '42', 'Lacoste Navy Cotton', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Lacoste Navy Cotton\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (961, '2024-01-15 18:12:55.695239', '42', 'Lacoste Navy Cotton', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Lacoste Navy Cotton\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (962, '2024-01-15 18:13:03.530546', '42', 'Lacoste Navy Cotton', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Lacoste Navy Cotton\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (963, '2024-01-15 18:22:34.076926', '43', 'Lacoste Blanc', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Lacoste Blanc\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (964, '2024-01-15 18:22:42.808030', '43', 'Lacoste Blanc', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Lacoste Blanc\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (965, '2024-01-15 18:22:51.354042', '43', 'Lacoste Blanc', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Lacoste Blanc\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (966, '2024-01-15 18:23:03.050032', '43', 'Lacoste Blanc', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Lacoste Blanc\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (967, '2024-01-15 18:34:47.715528', '44', 'Chemises Solid Manches', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemises Solid Manches\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (968, '2024-01-15 18:34:56.944898', '44', 'Chemises Solid Manches', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemises Solid Manches\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (969, '2024-01-15 18:35:23.472662', '44', 'Chemises Solid Manches', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemises Solid Manches\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (970, '2024-01-15 18:35:32.882510', '44', 'Chemises Solid Manches', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemises Solid Manches\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (971, '2024-01-15 18:48:41.784151', '45', 'Lacoste Cotton', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Lacoste Cotton\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (972, '2024-01-15 18:48:49.119771', '45', 'Lacoste Cotton', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Lacoste Cotton\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (973, '2024-01-15 18:48:57.783062', '45', 'Lacoste Cotton', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Lacoste Cotton\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (974, '2024-01-15 19:54:21.529150', '46', 'LACOSTE  Bleu', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"LACOSTE  Bleu\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (975, '2024-01-15 19:54:30.645022', '46', 'LACOSTE  Bleu', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"LACOSTE  Bleu\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (976, '2024-01-15 19:54:40.280597', '46', 'LACOSTE  Bleu', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"LACOSTE  Bleu\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (977, '2024-01-16 11:45:10.246733', '47', 'lacoste vert olive', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"lacoste vert olive\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (978, '2024-01-16 11:45:25.554883', '47', 'lacoste vert olive', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"lacoste vert olive\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (979, '2024-01-16 11:45:36.535170', '47', 'lacoste vert olive', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"lacoste vert olive\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (980, '2024-01-16 11:45:46.311913', '47', 'lacoste vert olive', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"lacoste vert olive\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (981, '2024-01-16 12:03:06.820710', '48', 'Chemise Homme blue', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise Homme blue\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (982, '2024-01-16 12:03:16.399219', '48', 'Chemise Homme blue', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise Homme blue\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (983, '2024-01-16 12:03:24.626560', '48', 'Chemise Homme blue', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise Homme blue\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (984, '2024-01-16 12:12:38.193608', '49', 'Chemise Homme pret à port', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise Homme pret \\u00e0 port\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (985, '2024-01-16 12:12:50.465233', '49', 'Chemise Homme pret à port', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise Homme pret \\u00e0 port\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (986, '2024-01-16 12:13:01.917391', '49', 'Chemise Homme pret à port', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise Homme pret \\u00e0 port\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (987, '2024-01-16 12:13:14.443567', '49', 'Chemise Homme pret à port', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise Homme pret \\u00e0 port\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (988, '2024-01-16 12:30:01.348886', '50', 'Chemise Homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise Homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (989, '2024-01-16 12:30:13.710968', '50', 'Chemise Homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise Homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (990, '2024-01-16 12:30:36.727718', '50', 'Chemise Homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise Homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (991, '2024-01-16 12:30:50.402109', '50', 'Chemise Homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise Homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (992, '2024-01-16 12:31:05.801256', '50', 'Chemise Homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise Homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (993, '2024-01-16 12:46:22.213714', '51', 'Chemise classe', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise classe\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (994, '2024-01-16 12:46:31.039089', '51', 'Chemise classe', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise classe\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (995, '2024-01-16 18:01:21.305302', '51', 'Chemise classe', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise classe\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (996, '2024-01-16 18:01:33.031849', '51', 'Chemise classe', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise classe\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (997, '2024-01-16 18:30:37.571242', '52', 'Chemise classe homme', 2, '[{\"changed\": {\"fields\": [\"Images\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (998, '2024-01-16 18:31:00.928229', '52', 'Chemise classe homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise classe homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (999, '2024-01-16 18:31:08.756284', '52', 'Chemise classe homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise classe homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1000, '2024-01-16 18:31:21.154733', '52', 'Chemise classe homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise classe homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1001, '2024-01-16 18:31:30.127636', '52', 'Chemise classe homme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Chemise classe homme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1002, '2024-01-16 18:37:55.101661', '53', 'Ceinture sans trou cuir', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture sans trou cuir\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1003, '2024-01-16 18:39:15.336749', '53', 'Ceinture sans trou cuir', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture sans trou cuir\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1004, '2024-01-16 18:39:23.325238', '53', 'Ceinture sans trou cuir', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture sans trou cuir\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1005, '2024-01-16 18:39:36.384677', '53', 'Ceinture sans trou cuir', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture sans trou cuir\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1006, '2024-01-16 18:51:39.514026', '54', 'Ceinture  Homme Kezel', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture  Homme Kezel\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1007, '2024-01-16 18:51:48.648353', '54', 'Ceinture  Homme Kezel', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture  Homme Kezel\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1008, '2024-01-16 18:51:57.306384', '54', 'Ceinture  Homme Kezel', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture  Homme Kezel\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1009, '2024-01-16 18:52:10.718852', '54', 'Ceinture  Homme Kezel', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture  Homme Kezel\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1010, '2024-01-16 18:52:20.586177', '54', 'Ceinture  Homme Kezel', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture  Homme Kezel\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1011, '2024-01-16 19:24:24.702880', '55', 'Ceinture Élastique Femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture \\u00c9lastique Femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1012, '2024-01-16 19:24:38.358055', '55', 'Ceinture Élastique Femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture \\u00c9lastique Femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1013, '2024-01-16 19:24:48.117632', '55', 'Ceinture Élastique Femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture \\u00c9lastique Femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1014, '2024-01-16 19:24:57.209115', '55', 'Ceinture Élastique Femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture \\u00c9lastique Femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1015, '2024-01-16 19:25:07.361487', '55', 'Ceinture Élastique Femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture \\u00c9lastique Femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1016, '2024-01-16 19:37:57.420597', '56', 'Ceinture Femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture Femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1017, '2024-01-16 19:55:42.856089', '56', 'Ceinture Femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture Femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1018, '2024-01-16 19:55:51.426383', '56', 'Ceinture Femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture Femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1019, '2024-01-16 19:56:01.117593', '56', 'Ceinture Femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture Femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1020, '2024-01-16 19:56:13.857647', '56', 'Ceinture Femme', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture Femme\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1021, '2024-01-17 16:49:36.594735', '3', 'senxibaar220@gmail.com', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (1022, '2024-01-17 16:59:17.452890', '4', 'senxibaar220@gmail.com', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (1023, '2024-01-17 17:54:47.385020', '57', 'Ceinture  Femme style', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture  Femme style\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1024, '2024-01-17 17:54:56.338802', '57', 'Ceinture  Femme style', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture  Femme style\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1025, '2024-01-17 17:55:07.577633', '57', 'Ceinture  Femme style', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture  Femme style\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1026, '2024-01-17 17:55:16.607183', '57', 'Ceinture  Femme style', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture  Femme style\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1027, '2024-01-17 18:03:39.815709', '58', 'Ceinture Belter Belt', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture Belter Belt\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1028, '2024-01-17 18:03:48.231632', '58', 'Ceinture Belter Belt', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture Belter Belt\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1029, '2024-01-17 18:03:56.326888', '58', 'Ceinture Belter Belt', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture Belter Belt\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1030, '2024-01-17 18:03:59.764179', '58', 'Ceinture Belter Belt', 2, '[]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1031, '2024-01-17 18:04:10.579183', '58', 'Ceinture Belter Belt', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture Belter Belt\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1032, '2024-01-17 18:04:40.326520', '58', 'Ceinture Belter Belt', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture Belter Belt\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1033, '2024-01-17 18:20:38.318697', '59', 'Ceinture Caporale', 2, '[{\"changed\": {\"fields\": [\"Product name\"]}}, {\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture Caporale\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1034, '2024-01-17 18:20:47.339240', '59', 'Ceinture Caporale', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture Caporale\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1035, '2024-01-17 18:21:00.483015', '59', 'Ceinture Caporale', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture Caporale\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1036, '2024-01-17 18:21:08.750217', '59', 'Ceinture Caporale', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Ceinture Caporale\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1037, '2024-01-17 18:32:39.226596', '60', 'Casquette Parasol Chapeau', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette Parasol Chapeau\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1038, '2024-01-17 18:32:48.713832', '60', 'Casquette Parasol Chapeau', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette Parasol Chapeau\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1039, '2024-01-17 18:32:59.106015', '60', 'Casquette Parasol Chapeau', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette Parasol Chapeau\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1040, '2024-01-17 18:33:18.660830', '60', 'Casquette Parasol Chapeau', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette Parasol Chapeau\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1041, '2024-01-17 18:52:27.182115', '61', 'casquet Floral fleur', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"casquet Floral fleur\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1042, '2024-01-17 18:52:35.965233', '61', 'casquet Floral fleur', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"casquet Floral fleur\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1043, '2024-01-17 18:52:45.330481', '61', 'casquet Floral fleur', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"casquet Floral fleur\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1044, '2024-01-17 18:52:55.229294', '61', 'casquet Floral fleur', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"casquet Floral fleur\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1045, '2024-01-17 19:04:17.246634', '62', 'Casquette basebal', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette basebal\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1046, '2024-01-17 19:04:35.589743', '62', 'Casquette basebal', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette basebal\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1047, '2024-01-17 19:04:44.266223', '62', 'Casquette basebal', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette basebal\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1048, '2024-01-17 19:05:00.692511', '62', 'Casquette basebal', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette basebal\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1049, '2024-01-17 19:39:14.834748', '63', 'Casquette aigle', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette aigle\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1050, '2024-01-17 19:39:22.966407', '63', 'Casquette aigle', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette aigle\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1051, '2024-01-17 19:39:33.158542', '63', 'Casquette aigle', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette aigle\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1052, '2024-01-17 19:39:41.791851', '63', 'Casquette aigle', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette aigle\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1053, '2024-01-17 19:52:12.402260', '64', 'Casquette star', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette star\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1054, '2024-01-17 19:52:25.350758', '64', 'Casquette star', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette star\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1055, '2024-01-17 19:52:34.695506', '64', 'Casquette star', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette star\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1056, '2024-01-17 19:52:43.287385', '64', 'Casquette star', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette star\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1057, '2024-01-17 20:10:12.167031', '64', 'Casquette star', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette star\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1058, '2024-01-17 20:10:21.096863', '64', 'Casquette star', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette star\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1059, '2024-01-17 20:10:30.536050', '64', 'Casquette star', 2, '[{\"added\": {\"name\": \"productgallery\", \"object\": \"Casquette star\"}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (1060, '2024-01-18 22:19:23.815357', '5', 'senxibaar220@gmail.com', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (1061, '2024-01-18 22:19:42.349770', '1', 'Cheikh Sadi', 3, '', 16, 1);
INSERT INTO `django_admin_log` VALUES (1062, '2024-01-20 16:51:49.205816', '6', 'senxibaar220@gmail.com', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (1063, '2024-01-20 16:51:49.491619', '2', 'cheikhdiouf035@gmail.com', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (1064, '2024-01-22 13:46:13.032420', '7', 'cheikhdiouf035@gmail.com', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (1065, '2024-01-22 13:46:51.904796', '24', 'CartItem object (24)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (1066, '2024-01-22 13:46:52.011728', '17', 'CartItem object (17)', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (1067, '2024-01-22 13:47:05.614414', '2', '9k6eqmxah6x7iqfvjwo4j97zegpjdccg', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (1068, '2024-01-22 13:47:05.677389', '4', 'oa4knayyxfsbs2cj56cyan6vqv41cjhy', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (1069, '2024-01-22 13:47:05.749326', '3', 'f1w4tpqzpvnht58x8fs07bm5mdjuusps', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (1070, '2024-01-22 13:47:05.804956', '5', 'y4wv2clylmctio379g59t5tobrncig4h', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (1071, '2024-01-22 13:47:05.882729', '6', '9ygt4vurvzeb9e0b53q2x9zqhyhmdm3g', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (1072, '2024-01-22 13:47:05.961516', '7', 'gsvjnvyzw2wl9ksug6mmwav1squx19up', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (1073, '2024-01-22 13:47:31.702841', '124', 'Cheikh', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (1074, '2024-01-22 13:47:31.826034', '123', 'Cheikh Sadibou', 3, '', 12, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (7, 'account', 'account');
INSERT INTO `django_content_type` VALUES (8, 'account', 'userprofile');
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (18, 'admin_honeypot', 'loginattempt');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (13, 'carts', 'cart');
INSERT INTO `django_content_type` VALUES (14, 'carts', 'cartitem');
INSERT INTO `django_content_type` VALUES (6, 'category', 'category');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (15, 'orders', 'order');
INSERT INTO `django_content_type` VALUES (17, 'orders', 'orderproduct');
INSERT INTO `django_content_type` VALUES (16, 'orders', 'payment');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (9, 'store', 'product');
INSERT INTO `django_content_type` VALUES (10, 'store', 'productgallery');
INSERT INTO `django_content_type` VALUES (11, 'store', 'reviewrating');
INSERT INTO `django_content_type` VALUES (12, 'store', 'variation');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'account', '0001_initial', '2024-01-22 16:48:24.640598');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0001_initial', '2024-01-22 16:48:26.281596');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2024-01-22 16:48:30.928756');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2024-01-22 16:48:31.110796');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-22 16:48:31.397690');
INSERT INTO `django_migrations` VALUES (6, 'admin_honeypot', '0001_initial', '2024-01-22 16:48:32.496873');
INSERT INTO `django_migrations` VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2024-01-22 16:48:35.386818');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0001_initial', '2024-01-22 16:48:44.753212');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0002_alter_permission_name_max_length', '2024-01-22 16:48:46.110612');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0003_alter_user_email_max_length', '2024-01-22 16:48:46.237567');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0004_alter_user_username_opts', '2024-01-22 16:48:46.353629');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0005_alter_user_last_login_null', '2024-01-22 16:48:46.459951');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0006_require_contenttypes_0002', '2024-01-22 16:48:46.605311');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0007_alter_validators_add_error_messages', '2024-01-22 16:48:46.740347');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0008_alter_user_username_max_length', '2024-01-22 16:48:46.828371');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0009_alter_user_last_name_max_length', '2024-01-22 16:48:46.890386');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0010_alter_group_name_max_length', '2024-01-22 16:48:47.187443');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0011_update_proxy_permissions', '2024-01-22 16:48:47.255610');
INSERT INTO `django_migrations` VALUES (19, 'auth', '0012_alter_user_first_name_max_length', '2024-01-22 16:48:47.337331');
INSERT INTO `django_migrations` VALUES (20, 'category', '0001_initial', '2024-01-22 16:48:48.374974');
INSERT INTO `django_migrations` VALUES (21, 'store', '0001_initial', '2024-01-22 16:49:02.527335');
INSERT INTO `django_migrations` VALUES (22, 'carts', '0001_initial', '2024-01-22 16:49:17.029562');
INSERT INTO `django_migrations` VALUES (23, 'orders', '0001_initial', '2024-01-22 16:49:40.865865');
INSERT INTO `django_migrations` VALUES (24, 'sessions', '0001_initial', '2024-01-22 16:49:42.344102');
INSERT INTO `django_migrations` VALUES (25, 'admin_honeypot', '0002_alter_loginattempt_id', '2024-01-22 16:50:44.866978');
INSERT INTO `django_migrations` VALUES (26, 'account', '0002_alter_userprofile_user', '2024-01-22 19:54:02.765966');
INSERT INTO `django_migrations` VALUES (27, 'account', '0003_alter_userprofile_user', '2024-01-23 09:36:09.150463');
INSERT INTO `django_migrations` VALUES (28, 'orders', '0002_alter_order_order_number', '2024-01-23 11:11:02.310495');
INSERT INTO `django_migrations` VALUES (29, 'orders', '0003_alter_order_order_number', '2024-01-23 14:08:02.329912');
INSERT INTO `django_migrations` VALUES (30, 'orders', '0004_alter_order_order_number', '2024-01-23 14:14:55.192621');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('ajctg3l2229ia7qnsbzsrqft0kskcr68', '.eJxVjMsOwiAUBf-FtSE8C3Tp3m8glwu1qAVT6Mr479qkm27PzJwP8S21lmvxueTue15S67C8PRm5YQMTzFhNudbWOXshHrY--62l1edIRsLJaQuAz1R2EB9Q7pViLX3Nge4KPWijtxrT63q4p4MZ2vyvw6SEYNZEBzzEQaRJgZWohEzaAQKDOKFSIqkBLDMcNQaMTEuJEawz5PsDHttG4A:1rSHwH:BzwGB8Gj_zILGxie3QsC-9QDrP0uNPPD9z6onlbju9A', '2024-02-06 14:39:45.567004');
INSERT INTO `django_session` VALUES ('jxqr9xl6rere0jnqcwkyex1maca4x7o5', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE3MDYwMTk4NjIuMjEwMzU1NX0:1rSHhP:oFvuoZPquqiMShzY5MEqOAcRRyjJe98ijc20Gdxkmwo', '2024-02-06 14:24:23.784748');

-- ----------------------------
-- Table structure for orders_order
-- ----------------------------
DROP TABLE IF EXISTS `orders_order`;
CREATE TABLE `orders_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_number` int NULL DEFAULT NULL,
  `first_name` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address_line_1` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address_line_2` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `country` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `state` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `order_note` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `order_total` double NOT NULL,
  `tax` double NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_ordered` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `payment_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orders_order_payment_id_46928ccc_fk_orders_payment_id`(`payment_id` ASC) USING BTREE,
  INDEX `orders_order_user_id_e9b59eb1_fk_account_account_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `orders_order_payment_id_46928ccc_fk_orders_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `orders_payment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_order_user_id_e9b59eb1_fk_account_account_id` FOREIGN KEY (`user_id`) REFERENCES `account_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_order
-- ----------------------------
INSERT INTO `orders_order` VALUES (1, 2401231, 'Cheikh Sadibou', 'Diouf', '0772882303', 'cheikhdiouf035@gmail.com', 'Dakar', 'Sunugal', 'Pays-Bas', 'Alaska', 'Sénégal', '', 15075, 75, 'New', '127.0.0.1', 1, '2024-01-23 11:14:10.802051', '2024-01-23 11:15:20.147804', 2, 1);
INSERT INTO `orders_order` VALUES (2, 2401232, 'Cheikh Sadibou', 'Diouf', '772882303', 'cheikhdiouf035@gmail.com', 'Dakar', 'Yoff', 'Afrika', 'Senegal', 'Dakar', 'ok', 50250, 250, 'New', '127.0.0.1', 1, '2024-01-23 14:18:41.483766', '2024-01-23 14:19:29.261180', 2, 2);

-- ----------------------------
-- Table structure for orders_orderproduct
-- ----------------------------
DROP TABLE IF EXISTS `orders_orderproduct`;
CREATE TABLE `orders_orderproduct`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `product_price` double NOT NULL,
  `ordered` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `payment_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orders_orderproduct_order_id_5022a3e2_fk_orders_order_id`(`order_id` ASC) USING BTREE,
  INDEX `orders_orderproduct_product_id_4d6ac024_fk_store_product_id`(`product_id` ASC) USING BTREE,
  INDEX `orders_orderproduct_user_id_1e7a7ab7_fk_account_account_id`(`user_id` ASC) USING BTREE,
  INDEX `orders_orderproduct_payment_id_492ed997_fk_orders_payment_id`(`payment_id` ASC) USING BTREE,
  CONSTRAINT `orders_orderproduct_order_id_5022a3e2_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_orderproduct_payment_id_492ed997_fk_orders_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `orders_payment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_orderproduct_product_id_4d6ac024_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_orderproduct_user_id_1e7a7ab7_fk_account_account_id` FOREIGN KEY (`user_id`) REFERENCES `account_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_orderproduct
-- ----------------------------
INSERT INTO `orders_orderproduct` VALUES (1, 1, 15000, 1, '2024-01-23 11:15:20.407829', '2024-01-23 11:15:20.812928', 1, 36, 2, 1);
INSERT INTO `orders_orderproduct` VALUES (2, 1, 30000, 1, '2024-01-23 14:19:29.362176', '2024-01-23 14:19:30.301412', 2, 6, 2, 2);
INSERT INTO `orders_orderproduct` VALUES (3, 1, 5000, 1, '2024-01-23 14:19:30.775113', '2024-01-23 14:19:31.205932', 2, 48, 2, 2);
INSERT INTO `orders_orderproduct` VALUES (4, 1, 15000, 1, '2024-01-23 14:19:31.686884', '2024-01-23 14:19:31.852771', 2, 36, 2, 2);

-- ----------------------------
-- Table structure for orders_orderproduct_variations
-- ----------------------------
DROP TABLE IF EXISTS `orders_orderproduct_variations`;
CREATE TABLE `orders_orderproduct_variations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderproduct_id` bigint NOT NULL,
  `variation_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orders_orderproduct_vari_orderproduct_id_variatio_8c028ee7_uniq`(`orderproduct_id` ASC, `variation_id` ASC) USING BTREE,
  INDEX `orders_orderproduct__variation_id_5dfd0e51_fk_store_var`(`variation_id` ASC) USING BTREE,
  CONSTRAINT `orders_orderproduct__orderproduct_id_0f116a3b_fk_orders_or` FOREIGN KEY (`orderproduct_id`) REFERENCES `orders_orderproduct` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_orderproduct__variation_id_5dfd0e51_fk_store_var` FOREIGN KEY (`variation_id`) REFERENCES `store_variation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders_orderproduct_variations
-- ----------------------------
INSERT INTO `orders_orderproduct_variations` VALUES (49, 1, 315);
INSERT INTO `orders_orderproduct_variations` VALUES (50, 1, 318);
INSERT INTO `orders_orderproduct_variations` VALUES (52, 2, 47);
INSERT INTO `orders_orderproduct_variations` VALUES (51, 2, 50);
INSERT INTO `orders_orderproduct_variations` VALUES (54, 3, 420);
INSERT INTO `orders_orderproduct_variations` VALUES (53, 3, 424);
INSERT INTO `orders_orderproduct_variations` VALUES (55, 4, 315);
INSERT INTO `orders_orderproduct_variations` VALUES (56, 4, 318);

-- ----------------------------
-- Table structure for orders_payment
-- ----------------------------
DROP TABLE IF EXISTS `orders_payment`;
CREATE TABLE `orders_payment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `payment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount_paid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orders_payment_user_id_cfa9f321_fk_account_account_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `orders_payment_user_id_cfa9f321_fk_account_account_id` FOREIGN KEY (`user_id`) REFERENCES `account_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_payment
-- ----------------------------
INSERT INTO `orders_payment` VALUES (1, '8A690515E6875184C', 'PayPal', '15075.0', 'COMPLETED', '2024-01-23 11:15:20.022825', 2);
INSERT INTO `orders_payment` VALUES (2, '6A7256605G281264M', 'PayPal', '50250.0', 'COMPLETED', '2024-01-23 14:19:29.159125', 2);

-- ----------------------------
-- Table structure for store_product
-- ----------------------------
DROP TABLE IF EXISTS `store_product`;
CREATE TABLE `store_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` int NOT NULL,
  `images` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stock` int NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` date NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_name`(`product_name` ASC) USING BTREE,
  UNIQUE INDEX `slug`(`slug` ASC) USING BTREE,
  INDEX `store_product_category_id_574bae65_fk_category_category_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `store_product_category_id_574bae65_fk_category_category_id` FOREIGN KEY (`category_id`) REFERENCES `category_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store_product
-- ----------------------------
INSERT INTO `store_product` VALUES (1, 'Choes de sport', 'choes-de-sport', 'Chemise pour homme - Coupe classique Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. chemise', 5000, 'photo/produts/chaussures2.jpg', 99, 1, '2023-12-18 19:25:01.960862', '2024-01-13', 5);
INSERT INTO `store_product` VALUES (2, 'Chaussure haute de gamme', 'chaussure-haute-de-gamme', 'Chemise pour homme Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. chemise', 25000, 'photo/produts/Capture3.png', 95, 1, '2023-12-18 19:26:07.329740', '2024-01-13', 1);
INSERT INTO `store_product` VALUES (3, 'Chaussures pour un mariage', 'chaussures-pour-un-mariage', 'Chaussures pour un mariage Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Shoes Class', 5000, 'photo/produts/chaussures_hommes.jpg', 97, 1, '2023-12-18 19:27:20.545454', '2024-01-13', 1);
INSERT INTO `store_product` VALUES (4, 'chaussures hommes haut de gamme', 'chaussures-hommes-haut-de-gamme', 'chaussures hommes haut de gamme Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Shoes class', 25000, 'photo/produts/Capture_class.png', 100, 1, '2023-12-18 19:29:13.116728', '2024-01-13', 1);
INSERT INTO `store_product` VALUES (5, 'Chaussure de running Marine', 'chaussure-de-running-marine', 'Chaussure de running Marine Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Shoes Basquet', 12000, 'photo/produts/Chaussure_de_running.jpg', 100, 1, '2023-12-18 19:30:51.130267', '2024-01-13', 5);
INSERT INTO `store_product` VALUES (6, 'BOOTS SANTONI CARTER', 'boots-santoni-carter', 'BOOTS SANTONI CARTER Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Shoes Class', 30000, 'photo/produts/santonileather.jpg', 91, 1, '2023-12-18 19:32:29.630822', '2024-01-23', 1);
INSERT INTO `store_product` VALUES (7, 'Chaussures adidas', 'chaussures-adidas', 'Chaussures adidas Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Shoes Basquet', 13000, 'photo/produts/ChaussuresMarine.jpg', 100, 1, '2023-12-18 19:36:38.711954', '2024-01-13', 5);
INSERT INTO `store_product` VALUES (8, 'Sandales cuir homme artisanales', 'sandales-cuir-homme-artisanales', 'Sandales cuir homme artisanales Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Sandale cuir', 100, 'photo/produts/Artisanat_Maroc.jpg', 100, 1, '2023-12-18 19:37:55.099588', '2024-01-13', 6);
INSERT INTO `store_product` VALUES (9, 'Mode homme sandale en cuir', 'mode-homme-sandale-en-cuir', 'Mode homme sandale en cuir Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Sandale cuir', 100, 'photo/produts/ArtisanatS1.jpg', 100, 1, '2023-12-18 19:39:29.041544', '2024-01-13', 6);
INSERT INTO `store_product` VALUES (10, 'sandales coups de c?ur', 'sandales-coups-de-cur', 'sandales coups de c?ur Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Sandale cuir', 11000, 'photo/produts/BONNEGUEULE.jpg', 100, 1, '2023-12-18 19:41:09.004276', '2024-01-13', 6);
INSERT INTO `store_product` VALUES (11, 'sandales en cuir Zeus', 'sandales-en-cuir-zeus', 'sandales en cuir Zeus Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Sandale cuir', 11000, 'photo/produts/Des_sandales_en.jpg', 100, 1, '2023-12-18 19:42:44.715564', '2024-01-13', 6);
INSERT INTO `store_product` VALUES (12, 'sandales cuir bio', 'sandales-cuir-bio', 'sandales cuir bio Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Sandale cuir', 12000, 'photo/produts/Les_5_sandales.jpg', 100, 1, '2023-12-18 19:43:57.622675', '2024-01-13', 6);
INSERT INTO `store_product` VALUES (13, 'sandale Artisanat Maroc', 'sandale-artisanat-maroc', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Sandale cuir', 10000, 'photo/produts/Mode_homme_sandale_en.jpg', 100, 1, '2023-12-18 19:49:22.411067', '2024-01-13', 6);
INSERT INTO `store_product` VALUES (14, 'Sandales grises Chaussures Compensées', 'sandales-grises-chaussures-compensees', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Talon', 12000, 'photo/produts/Captured2.png', 100, 1, '2023-12-18 19:51:09.774534', '2024-01-13', 2);
INSERT INTO `store_product` VALUES (15, 'Sandales grises Chaussures', 'sandales-grises-chaussures', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Talon', 13000, 'photo/produts/22.png', 100, 1, '2023-12-18 19:52:14.880484', '2024-01-13', 2);
INSERT INTO `store_product` VALUES (16, 'Sandales Cuir N°902  Doré', 'sandales-cuir-n902-dore', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Talon', 10000, 'photo/produts/Chaussure_Compensées_Femme.jpg', 80, 1, '2023-12-18 19:53:38.566295', '2024-01-13', 2);
INSERT INTO `store_product` VALUES (17, 'Femme Sandales Cuir en Noir', 'femme-sandales-en-cuir-en-dore', 'Femme Sandales en Cuir en Doré Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Talon', 12000, 'photo/produts/Fin_Sandales.jpg', 80, 1, '2023-12-18 19:54:27.706139', '2024-01-13', 2);
INSERT INTO `store_product` VALUES (18, 'Sandales & Nu-pieds', 'sandales-nu-pieds', 'Sandales & Nu-pieds Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Talon', 10000, 'photo/produts/images.jpg', 100, 1, '2023-12-18 19:56:01.800128', '2024-01-13', 2);
INSERT INTO `store_product` VALUES (19, 'Sandales talon argentin', 'sandales-talon-noir', 'Sandales talon noir Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Talon', 100, 'photo/produts/26.png', 100, 1, '2023-12-18 19:56:58.011630', '2024-01-13', 2);
INSERT INTO `store_product` VALUES (20, 'sandale casadei-femme', 'sandale-casadei-femme', 'sandale casadei-femme Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Talon', 12000, 'photo/produts/MARINA_RINALDI.jpg', 100, 1, '2023-12-18 19:57:59.638992', '2024-01-13', 2);
INSERT INTO `store_product` VALUES (21, 'Sac titangamingbackpackg', 'sac-titangamingbackpackg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Sac', 13000, 'photo/produts/SACc1.jpg', 100, 1, '2023-12-18 20:00:08.862712', '2024-01-13', 11);
INSERT INTO `store_product` VALUES (22, 'sac-vintage-gris', 'sac-vintage-gris', 'sac-vintage-gris Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Sac', 18000, 'photo/produts/PourFemme_SacGrande.jpg', 100, 1, '2023-12-18 20:02:25.712109', '2024-01-13', 11);
INSERT INTO `store_product` VALUES (23, 'Sac de voyage', 'sac-de-voyage', 'Sac de voyage Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Sac', 17000, 'photo/produts/Sac_de_voyage.jpg', 99, 1, '2023-12-18 20:04:03.426027', '2024-01-13', 11);
INSERT INTO `store_product` VALUES (24, 'Sac À Do Femme', 'sac-a-do-femme', 'Sac À Do Femme Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Sac', 16500, 'photo/produts/sacvintagegris.jpg', 100, 1, '2023-12-18 20:06:13.938966', '2024-01-13', 11);
INSERT INTO `store_product` VALUES (25, 'sac-a-dos', 'sac-a-dos', 'sac-a-dos Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Sac', 15000, 'photo/produts/SasEnfant.jpg', 100, 1, '2023-12-18 20:15:21.065534', '2024-01-13', 11);
INSERT INTO `store_product` VALUES (26, 'Sac-a-dos-enfant', 'sac-a-dos-enfant', 'Sac-a-dos-enfant Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Sac', 16000, 'photo/produts/Captureecran_sac.png', 100, 1, '2023-12-18 20:16:15.833620', '2024-01-13', 11);
INSERT INTO `store_product` VALUES (27, 'Sac Ordinateur', 'sac-ordinateur', 'Sac-a-dos-enfant Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Sac', 15000, 'photo/produts/titangamingbackp.png', 100, 1, '2023-12-18 20:18:10.313225', '2024-01-13', 11);
INSERT INTO `store_product` VALUES (28, 'Pantalons Simples Homme', 'pantalons-simples-homme', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. jeans', 5000, 'photo/produts/Pantalons_Simples.jpg', 100, 1, '2023-12-18 20:20:31.645421', '2024-01-13', 12);
INSERT INTO `store_product` VALUES (29, 'jean homme Super cent', 'jean-homme-super-cent', 'Pantalon jean homme Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Super cent', 4000, 'photo/produts/Capturepantlon.png', 100, 1, '2023-12-18 20:22:47.307124', '2024-01-13', 12);
INSERT INTO `store_product` VALUES (30, 'Pantalon Casse Super 100 Homme', 'pantalon-casse-super-100-homme', 'Pantalon Casse Super 100 Homme  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. super-cent', 4500, 'photo/produts/Generic_Pantalons.jpg', 100, 1, '2023-12-18 20:23:47.812946', '2024-01-13', 12);
INSERT INTO `store_product` VALUES (31, 'WATCH APPL E-shop S9', 'watch-wear-e-shop', 'WATCH WEAR E-shop Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. WATCH WEAR E-shop  montre', 15000, 'photo/produts/Buy_Apple_Watch.jpg', 100, 1, '2023-12-18 20:25:12.952241', '2024-01-13', 7);
INSERT INTO `store_product` VALUES (32, 'HUAWEI Watch 3 GT', 'huawei-watch-3-gt', 'Watch - Apple Store Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Watch - Apple Store Montre', 25000, 'photo/produts/Capture_montre.png', 100, 1, '2023-12-19 11:03:16.219728', '2024-01-13', 7);
INSERT INTO `store_product` VALUES (33, 'PERPETUAL STAINLESS STEEL', 'perpetual-stainless-steel', 'PERPETUAL STAINLESS STEEL Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen montre', 20000, 'photo/produts/Capture_d_montre.png', 100, 1, '2023-12-19 11:04:58.929771', '2024-01-15', 7);
INSERT INTO `store_product` VALUES (34, 'Circle Smart Watch', 'circle-smart-watch', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Circle Smart Watch Montre', 20000, 'photo/produts/Capturmontre.png', 100, 1, '2023-12-19 11:07:14.109992', '2024-01-15', 7);
INSERT INTO `store_product` VALUES (35, 'Buy HUAWEI WATCH GT 3', 'buy-huawei-watch-gt-3', 'Buy HUAWEI WATCH GT 3 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Montre', 15000, 'photo/produts/Capture2023montre.png', 80, 1, '2023-12-19 11:08:52.118360', '2024-01-15', 7);
INSERT INTO `store_product` VALUES (36, 'Apple Watch Series 9', 'apple-watch-series-9', 'Apple Watch Series 9 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book  Apple Watch Series 9 Montre', 15000, 'photo/produts/e0ef9c.jpg', 97, 1, '2023-12-19 11:10:03.292898', '2024-01-23', 7);
INSERT INTO `store_product` VALUES (37, 'Watch - Apple', 'watch-apple', 'Apple Watch Series 9 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book  Apple Watch Series 9 Montre', 25000, 'photo/produts/WATCH1.jpg', 100, 1, '2023-12-19 11:11:47.073484', '2024-01-15', 7);
INSERT INTO `store_product` VALUES (38, 'Apple Watch Ultra 2', 'apple-watch-ultra-2', 'Apple Watch Series 9 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book  Apple Watch Series 9 Montre', 35000, 'photo/produts/watchcard.jpg', 48, 1, '2023-12-19 11:13:09.459603', '2024-01-15', 7);
INSERT INTO `store_product` VALUES (39, 'Lacoste', 'lacoste', 'lacoste-noir-et-blanc Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book lacoste noir et blanc', 3000, 'photo/produts/captureL1.jpg', 80, 1, '2023-12-19 11:16:57.672095', '2024-01-15', 7);
INSERT INTO `store_product` VALUES (40, 'LACOSTE  Bleu marine', 'lacoste-bleu-marine', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book LACOSTE T-shirt Bleu marine', 3000, 'photo/produts/Capture_chemise_bleu.png', 50, 1, '2023-12-19 11:18:21.612998', '2024-01-15', 10);
INSERT INTO `store_product` VALUES (41, 'Lacoste Polo', 'lacoste-polo', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book  Lacoste Polo KM', 5000, 'photo/produts/Capture_lacoste_bleu_bleu.png', 100, 1, '2023-12-19 11:19:31.898628', '2023-12-19', 10);
INSERT INTO `store_product` VALUES (42, 'Lacoste Navy Cotton', 'lacoste-navy-cotton', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lacoste Navy Cotton', 3500, 'photo/produts/Lacoste.jpg', 60, 1, '2023-12-19 11:20:40.216575', '2024-01-15', 10);
INSERT INTO `store_product` VALUES (43, 'Lacoste Blanc', 'lacoste-blanc', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lacoste Blanc', 4000, 'photo/produts/LacosteBlanc.jpg', 100, 1, '2023-12-19 11:24:59.377736', '2024-01-15', 10);
INSERT INTO `store_product` VALUES (44, 'Chemises Solid Manches', 'chemises-solid-manches', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Chemises Solid Manches', 4000, 'photo/produts/captureC1.jpg', 100, 1, '2023-12-19 11:26:26.369559', '2024-01-15', 10);
INSERT INTO `store_product` VALUES (45, 'Lacoste Cotton', 'lacoste-cotton', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lacoste Solid Manches', 4000, 'photo/produts/CaptureL2_fGciOXW.jpg', 100, 1, '2023-12-19 11:31:09.373227', '2024-01-15', 10);
INSERT INTO `store_product` VALUES (46, 'LACOSTE  Bleu', 'lacoste-bleu', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lacoste Solid Manches', 4000, 'photo/produts/LACOSTEmarine.jpg', 50, 1, '2023-12-19 11:32:32.490423', '2024-01-15', 10);
INSERT INTO `store_product` VALUES (47, 'lacoste vert olive', 'lacoste-vert-olive', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lacoste Solid Manches', 5000, 'photo/produts/LacostePolo.jpg', 80, 1, '2023-12-19 11:34:12.333848', '2024-01-16', 10);
INSERT INTO `store_product` VALUES (48, 'Chemise Homme blue', 'chemise-homme-blue', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Chemise Homme blue', 5000, 'photo/produts/Capturech.png', 97, 1, '2023-12-19 11:36:13.319966', '2024-01-23', 8);
INSERT INTO `store_product` VALUES (49, 'Chemise Homme pret à port', 'chemise-homme-pret-a-port', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Chemise Homme rouge', 3500, 'photo/produts/Captureplus.png', 100, 1, '2023-12-19 11:43:01.381331', '2024-01-16', 8);
INSERT INTO `store_product` VALUES (50, 'Chemise Homme', 'chemise-homme', 'Chemise Homme Chemise Homme noir Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Chemise Homme noir', 4000, 'photo/produts/Chemisesimple.png', 76, 1, '2023-12-19 11:44:34.000630', '2024-01-16', 8);
INSERT INTO `store_product` VALUES (51, 'Chemise classe', 'chemise-classe', 'Chemise classe Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Chemise classe', 4500, 'photo/produts/CaptureC3.jpg', 100, 1, '2023-12-19 11:46:16.472091', '2024-01-16', 8);
INSERT INTO `store_product` VALUES (52, 'Chemise classe homme', 'chemise-classe-homme', 'Chemise classe homme Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book chemise', 4500, 'photo/produts/CaptureC4.png', 100, 1, '2023-12-19 11:49:25.882821', '2024-01-16', 8);
INSERT INTO `store_product` VALUES (53, 'Ceinture sans trou cuir', 'ceinture-sans-trou-cuir', 'Ceinture sans trou cuir Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen bookboucle automatique à crémaillère 3.5 cm Homme (Taille 46115 cm, J07 Bleu )  Amazon.fr Mode Ceinture sans trou cuir', 4500, 'photo/produts/Capturec1_0b3b1sW.jpg', 85, 1, '2023-12-19 11:51:13.294420', '2024-01-16', 3);
INSERT INTO `store_product` VALUES (54, 'Ceinture  Homme Kezel', 'ceinture-femme-kezel', 'Ceinture  Homme Kezel Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Ceinture  Homme Kezel', 4000, 'photo/produts/CeintureHomme.png', 100, 1, '2023-12-19 11:55:44.365206', '2024-01-16', 3);
INSERT INTO `store_product` VALUES (55, 'Ceinture Élastique Femme', 'ceinture-elastique-femme', 'Ceinture Élastique Femme Ceinture Élastique Extensible Jupe Robe Décor Ceinture Fine Taille Noire Cinch Belt  Ne Manquez Pas Ces Bonnes Affaires  Temu Belgium Ceinture Élastique Femme', 3500, 'photo/produts/CaptureCin1.jpg', 100, 1, '2023-12-19 11:57:50.283556', '2024-01-16', 3);
INSERT INTO `store_product` VALUES (56, 'Ceinture Femme', 'ceinture-femme', 'Ceinture Élastique Femme Ceinture Élastique Extensible Jupe Robe Décor Ceinture Fine Taille Noire Cinch Belt  Ne Manquez Pas Ces Bonnes Affaires  Temu Belgium Ceinture Élastique Femme', 3500, 'photo/produts/CaptureCin2.jpg', 95, 1, '2023-12-19 11:59:50.805922', '2024-01-16', 3);
INSERT INTO `store_product` VALUES (57, 'Ceinture  Femme style', 'ceinture-femme-style', 'Ceinture Élastique Femme Ceinture Élastique Extensible Jupe Robe Décor Ceinture Fine Taille Noire Cinch Belt  Ne Manquez Pas Ces Bonnes Affaires  Temu Belgium Ceinture Élastique Femme', 4500, 'photo/produts/capturecin3.jpeg', 87, 1, '2023-12-19 12:02:16.650395', '2024-01-17', 3);
INSERT INTO `store_product` VALUES (58, 'Ceinture Belter Belt', 'ceinture-belter-belt', 'Belter Belt Belter Belt Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book ceinture Belter Belt15', 4000, 'photo/produts/Capturecin4.jpg', 90, 1, '2023-12-19 12:04:40.318470', '2024-01-17', 3);
INSERT INTO `store_product` VALUES (59, 'Ceinture Caporale', 'ceinture-kezel', 'ceinture Belter Belt Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book ceinture Belter Belt15', 4000, 'photo/produts/Modern.png', 100, 1, '2023-12-19 12:06:06.260439', '2024-01-17', 3);
INSERT INTO `store_product` VALUES (60, 'Casquette Parasol Chapeau', 'casquette-parasol-chapeau', 'Casquette Parasol Chapeau Casquette Parasol Chapeau Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Casquette Parasol Chapeau', 20000, 'photo/produts/CaptureCa1.png', 100, 1, '2023-12-19 12:08:00.137820', '2024-01-17', 9);
INSERT INTO `store_product` VALUES (61, 'casquet Floral fleur', 'casquet-floral-fleur', 'casquet Floral fleur casquet Floral fleur Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book casquet Floral fleur', 3000, 'photo/produts/Capturefleur.png', 100, 1, '2023-12-19 12:11:44.317139', '2024-01-17', 3);
INSERT INTO `store_product` VALUES (62, 'Casquette basebal', 'casquette-basebal', 'Casquette basebal Casquette basebal Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Casquette basebal', 3500, 'photo/produts/CaptureCa2.png', 100, 1, '2023-12-19 12:15:46.623334', '2024-01-17', 9);
INSERT INTO `store_product` VALUES (63, 'Casquette aigle', 'casquette-aigle', 'Casquette basebal Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Casquette basebal', 4000, 'photo/produts/casquetteaigle.jpg', 100, 1, '2023-12-19 12:17:21.746894', '2024-01-17', 9);
INSERT INTO `store_product` VALUES (64, 'Casquette star', 'casquette-star', 'Casquette star Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Casquette basebal', 4000, 'photo/produts/Moderne.png', 100, 1, '2023-12-19 12:19:00.898178', '2024-01-17', 9);

-- ----------------------------
-- Table structure for store_productgallery
-- ----------------------------
DROP TABLE IF EXISTS `store_productgallery`;
CREATE TABLE `store_productgallery`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `store_productgallery_product_id_f2821a49_fk_store_product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `store_productgallery_product_id_f2821a49_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 254 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of store_productgallery
-- ----------------------------
INSERT INTO `store_productgallery` VALUES (2, 'store/products/Class.jpg', 6);
INSERT INTO `store_productgallery` VALUES (3, 'store/products/class2.jpg', 6);
INSERT INTO `store_productgallery` VALUES (4, 'store/products/class3.jpg', 6);
INSERT INTO `store_productgallery` VALUES (5, 'store/products/1.jpg', 1);
INSERT INTO `store_productgallery` VALUES (6, 'store/products/2.jpg', 1);
INSERT INTO `store_productgallery` VALUES (8, 'store/products/5.jpg', 1);
INSERT INTO `store_productgallery` VALUES (9, 'store/products/6.jpg', 1);
INSERT INTO `store_productgallery` VALUES (11, 'store/products/1.png', 2);
INSERT INTO `store_productgallery` VALUES (12, 'store/products/2.png', 2);
INSERT INTO `store_productgallery` VALUES (13, 'store/products/3.png', 2);
INSERT INTO `store_productgallery` VALUES (14, 'store/products/4.png', 2);
INSERT INTO `store_productgallery` VALUES (15, 'store/products/1_QzB2U7U.jpg', 3);
INSERT INTO `store_productgallery` VALUES (16, 'store/products/2_gOrKAxZ.jpg', 3);
INSERT INTO `store_productgallery` VALUES (17, 'store/products/3.jpg', 3);
INSERT INTO `store_productgallery` VALUES (18, 'store/products/4_YzE8Kqa.jpg', 3);
INSERT INTO `store_productgallery` VALUES (19, 'store/products/1_NdaDXws.jpg', 4);
INSERT INTO `store_productgallery` VALUES (20, 'store/products/2_rrIsgbI.jpg', 4);
INSERT INTO `store_productgallery` VALUES (21, 'store/products/3_9TaeCVL.jpg', 4);
INSERT INTO `store_productgallery` VALUES (22, 'store/products/4_SrMFqhj.jpg', 4);
INSERT INTO `store_productgallery` VALUES (23, 'store/products/5_HW4yshl.jpg', 4);
INSERT INTO `store_productgallery` VALUES (24, 'store/products/1_4N2JjXf.png', 5);
INSERT INTO `store_productgallery` VALUES (25, 'store/products/2_nOt6Ak0.png', 5);
INSERT INTO `store_productgallery` VALUES (26, 'store/products/3_jsLdwzX.png', 5);
INSERT INTO `store_productgallery` VALUES (27, 'store/products/4_VjJKW4c.png', 5);
INSERT INTO `store_productgallery` VALUES (28, 'store/products/1_C0ki7p1.png', 7);
INSERT INTO `store_productgallery` VALUES (29, 'store/products/2_6bzFYEw.png', 7);
INSERT INTO `store_productgallery` VALUES (30, 'store/products/3_d2rrTLJ.png', 7);
INSERT INTO `store_productgallery` VALUES (31, 'store/products/4_162N7FE.png', 7);
INSERT INTO `store_productgallery` VALUES (32, 'store/products/1_kSBH50W.png', 8);
INSERT INTO `store_productgallery` VALUES (33, 'store/products/2_NTSg3oZ.png', 8);
INSERT INTO `store_productgallery` VALUES (34, 'store/products/3_U6LpSVo.png', 8);
INSERT INTO `store_productgallery` VALUES (35, 'store/products/1_727pTLG.png', 9);
INSERT INTO `store_productgallery` VALUES (36, 'store/products/2_KVYHlrw.png', 9);
INSERT INTO `store_productgallery` VALUES (37, 'store/products/4_OlEPfzh.jpg', 9);
INSERT INTO `store_productgallery` VALUES (38, 'store/products/1_uZVU3Gg.png', 10);
INSERT INTO `store_productgallery` VALUES (39, 'store/products/3_uA9EJHH.png', 10);
INSERT INTO `store_productgallery` VALUES (40, 'store/products/1_NUStBKd.jpg', 11);
INSERT INTO `store_productgallery` VALUES (41, 'store/products/2_V1r1hnw.jpg', 11);
INSERT INTO `store_productgallery` VALUES (42, 'store/products/3_GBCaEju.jpg', 11);
INSERT INTO `store_productgallery` VALUES (43, 'store/products/4_y6kiJSI.jpg', 11);
INSERT INTO `store_productgallery` VALUES (44, 'store/products/11.jpg', 12);
INSERT INTO `store_productgallery` VALUES (45, 'store/products/12.png', 12);
INSERT INTO `store_productgallery` VALUES (46, 'store/products/13.png', 12);
INSERT INTO `store_productgallery` VALUES (47, 'store/products/14.png', 12);
INSERT INTO `store_productgallery` VALUES (48, 'store/products/15.png', 13);
INSERT INTO `store_productgallery` VALUES (49, 'store/products/16.png', 13);
INSERT INTO `store_productgallery` VALUES (50, 'store/products/17.png', 14);
INSERT INTO `store_productgallery` VALUES (51, 'store/products/18.png', 14);
INSERT INTO `store_productgallery` VALUES (52, 'store/products/19.png', 14);
INSERT INTO `store_productgallery` VALUES (53, 'store/products/20.png', 14);
INSERT INTO `store_productgallery` VALUES (54, 'store/products/21.png', 15);
INSERT INTO `store_productgallery` VALUES (55, 'store/products/22.png', 15);
INSERT INTO `store_productgallery` VALUES (56, 'store/products/23.png', 15);
INSERT INTO `store_productgallery` VALUES (57, 'store/products/24.png', 15);
INSERT INTO `store_productgallery` VALUES (58, 'store/products/25.png', 19);
INSERT INTO `store_productgallery` VALUES (59, 'store/products/27.png', 19);
INSERT INTO `store_productgallery` VALUES (60, 'store/products/28.png', 19);
INSERT INTO `store_productgallery` VALUES (61, 'store/products/29.jpg', 16);
INSERT INTO `store_productgallery` VALUES (62, 'store/products/30.jpg', 16);
INSERT INTO `store_productgallery` VALUES (63, 'store/products/31.jpg', 16);
INSERT INTO `store_productgallery` VALUES (64, 'store/products/32.jpg', 16);
INSERT INTO `store_productgallery` VALUES (65, 'store/products/33.jpg', 17);
INSERT INTO `store_productgallery` VALUES (66, 'store/products/34.jpg', 17);
INSERT INTO `store_productgallery` VALUES (67, 'store/products/35.jpg', 17);
INSERT INTO `store_productgallery` VALUES (68, 'store/products/36.jpg', 17);
INSERT INTO `store_productgallery` VALUES (69, 'store/products/37.jpg', 18);
INSERT INTO `store_productgallery` VALUES (70, 'store/products/38.jpg', 18);
INSERT INTO `store_productgallery` VALUES (71, 'store/products/39.jpg', 18);
INSERT INTO `store_productgallery` VALUES (72, 'store/products/40.jpg', 18);
INSERT INTO `store_productgallery` VALUES (73, 'store/products/41.jpg', 20);
INSERT INTO `store_productgallery` VALUES (74, 'store/products/42.jpg', 20);
INSERT INTO `store_productgallery` VALUES (75, 'store/products/43.jpg', 20);
INSERT INTO `store_productgallery` VALUES (76, 'store/products/44.jpg', 20);
INSERT INTO `store_productgallery` VALUES (77, 'store/products/45.png', 21);
INSERT INTO `store_productgallery` VALUES (78, 'store/products/46.png', 21);
INSERT INTO `store_productgallery` VALUES (79, 'store/products/47.png', 21);
INSERT INTO `store_productgallery` VALUES (80, 'store/products/48.png', 21);
INSERT INTO `store_productgallery` VALUES (81, 'store/products/49.png', 22);
INSERT INTO `store_productgallery` VALUES (82, 'store/products/50.png', 22);
INSERT INTO `store_productgallery` VALUES (83, 'store/products/51.png', 22);
INSERT INTO `store_productgallery` VALUES (84, 'store/products/52.png', 22);
INSERT INTO `store_productgallery` VALUES (85, 'store/products/53.png', 23);
INSERT INTO `store_productgallery` VALUES (86, 'store/products/54.png', 23);
INSERT INTO `store_productgallery` VALUES (87, 'store/products/55.png', 23);
INSERT INTO `store_productgallery` VALUES (88, 'store/products/56.png', 23);
INSERT INTO `store_productgallery` VALUES (89, 'store/products/57.png', 23);
INSERT INTO `store_productgallery` VALUES (90, 'store/products/58.png', 24);
INSERT INTO `store_productgallery` VALUES (91, 'store/products/59.png', 24);
INSERT INTO `store_productgallery` VALUES (92, 'store/products/60.png', 24);
INSERT INTO `store_productgallery` VALUES (93, 'store/products/61.png', 24);
INSERT INTO `store_productgallery` VALUES (94, 'store/products/62.png', 24);
INSERT INTO `store_productgallery` VALUES (95, 'store/products/62.jpg', 25);
INSERT INTO `store_productgallery` VALUES (96, 'store/products/63.jpg', 25);
INSERT INTO `store_productgallery` VALUES (97, 'store/products/64.jpg', 25);
INSERT INTO `store_productgallery` VALUES (98, 'store/products/65.jpg', 25);
INSERT INTO `store_productgallery` VALUES (99, 'store/products/66.png', 26);
INSERT INTO `store_productgallery` VALUES (100, 'store/products/67.png', 26);
INSERT INTO `store_productgallery` VALUES (101, 'store/products/68.png', 26);
INSERT INTO `store_productgallery` VALUES (102, 'store/products/69.png', 26);
INSERT INTO `store_productgallery` VALUES (103, 'store/products/70.png', 26);
INSERT INTO `store_productgallery` VALUES (104, 'store/products/71.jpg', 27);
INSERT INTO `store_productgallery` VALUES (105, 'store/products/72.jpg', 27);
INSERT INTO `store_productgallery` VALUES (106, 'store/products/73.jpg', 27);
INSERT INTO `store_productgallery` VALUES (107, 'store/products/74.jpg', 27);
INSERT INTO `store_productgallery` VALUES (108, 'store/products/75.jpg', 28);
INSERT INTO `store_productgallery` VALUES (109, 'store/products/76.jpg', 28);
INSERT INTO `store_productgallery` VALUES (110, 'store/products/77.jpg', 28);
INSERT INTO `store_productgallery` VALUES (111, 'store/products/78.jpg', 28);
INSERT INTO `store_productgallery` VALUES (112, 'store/products/79.jpg', 29);
INSERT INTO `store_productgallery` VALUES (113, 'store/products/80.jpg', 29);
INSERT INTO `store_productgallery` VALUES (114, 'store/products/81.jpg', 29);
INSERT INTO `store_productgallery` VALUES (115, 'store/products/82.jpg', 29);
INSERT INTO `store_productgallery` VALUES (116, 'store/products/83.png', 30);
INSERT INTO `store_productgallery` VALUES (117, 'store/products/84.png', 30);
INSERT INTO `store_productgallery` VALUES (118, 'store/products/85.png', 30);
INSERT INTO `store_productgallery` VALUES (119, 'store/products/86.png', 30);
INSERT INTO `store_productgallery` VALUES (120, 'store/products/87.png', 31);
INSERT INTO `store_productgallery` VALUES (121, 'store/products/88.png', 31);
INSERT INTO `store_productgallery` VALUES (122, 'store/products/89.png', 31);
INSERT INTO `store_productgallery` VALUES (123, 'store/products/90.png', 31);
INSERT INTO `store_productgallery` VALUES (124, 'store/products/91.png', 32);
INSERT INTO `store_productgallery` VALUES (125, 'store/products/92.png', 32);
INSERT INTO `store_productgallery` VALUES (126, 'store/products/93.png', 32);
INSERT INTO `store_productgallery` VALUES (127, 'store/products/94.jpg', 33);
INSERT INTO `store_productgallery` VALUES (128, 'store/products/95.png', 33);
INSERT INTO `store_productgallery` VALUES (129, 'store/products/95.jpg', 33);
INSERT INTO `store_productgallery` VALUES (130, 'store/products/97.png', 33);
INSERT INTO `store_productgallery` VALUES (131, 'store/products/98.png', 34);
INSERT INTO `store_productgallery` VALUES (132, 'store/products/99.png', 34);
INSERT INTO `store_productgallery` VALUES (133, 'store/products/100.png', 34);
INSERT INTO `store_productgallery` VALUES (135, 'store/products/102.png', 34);
INSERT INTO `store_productgallery` VALUES (136, 'store/products/103.jpg', 35);
INSERT INTO `store_productgallery` VALUES (137, 'store/products/104.jpg', 35);
INSERT INTO `store_productgallery` VALUES (138, 'store/products/105.jpg', 35);
INSERT INTO `store_productgallery` VALUES (139, 'store/products/106.jpeg', 36);
INSERT INTO `store_productgallery` VALUES (140, 'store/products/107.jpeg', 36);
INSERT INTO `store_productgallery` VALUES (142, 'store/products/108.jpeg', 36);
INSERT INTO `store_productgallery` VALUES (143, 'store/products/109.png', 37);
INSERT INTO `store_productgallery` VALUES (144, 'store/products/110.png', 37);
INSERT INTO `store_productgallery` VALUES (145, 'store/products/111.png', 37);
INSERT INTO `store_productgallery` VALUES (146, 'store/products/112.png', 37);
INSERT INTO `store_productgallery` VALUES (147, 'store/products/113.jpg', 38);
INSERT INTO `store_productgallery` VALUES (148, 'store/products/114.jpg', 38);
INSERT INTO `store_productgallery` VALUES (149, 'store/products/115.jpg', 38);
INSERT INTO `store_productgallery` VALUES (150, 'store/products/116.jpg', 39);
INSERT INTO `store_productgallery` VALUES (151, 'store/products/117.png', 39);
INSERT INTO `store_productgallery` VALUES (152, 'store/products/119.png', 39);
INSERT INTO `store_productgallery` VALUES (153, 'store/products/120.png', 39);
INSERT INTO `store_productgallery` VALUES (154, 'store/products/121.png', 40);
INSERT INTO `store_productgallery` VALUES (155, 'store/products/122.png', 40);
INSERT INTO `store_productgallery` VALUES (156, 'store/products/123.png', 40);
INSERT INTO `store_productgallery` VALUES (157, 'store/products/125.png', 40);
INSERT INTO `store_productgallery` VALUES (158, 'store/products/126.jpg', 42);
INSERT INTO `store_productgallery` VALUES (159, 'store/products/127.jpg', 42);
INSERT INTO `store_productgallery` VALUES (160, 'store/products/128.jpg', 42);
INSERT INTO `store_productgallery` VALUES (161, 'store/products/131.jpg', 43);
INSERT INTO `store_productgallery` VALUES (162, 'store/products/132.jpg', 43);
INSERT INTO `store_productgallery` VALUES (163, 'store/products/133.jpg', 43);
INSERT INTO `store_productgallery` VALUES (164, 'store/products/134.png', 43);
INSERT INTO `store_productgallery` VALUES (165, 'store/products/135.png', 44);
INSERT INTO `store_productgallery` VALUES (166, 'store/products/139.png', 44);
INSERT INTO `store_productgallery` VALUES (167, 'store/products/137.png', 44);
INSERT INTO `store_productgallery` VALUES (168, 'store/products/138.png', 44);
INSERT INTO `store_productgallery` VALUES (169, 'store/products/138_at423Hf.png', 45);
INSERT INTO `store_productgallery` VALUES (170, 'store/products/139_fFjmVfQ.png', 45);
INSERT INTO `store_productgallery` VALUES (171, 'store/products/140.png', 45);
INSERT INTO `store_productgallery` VALUES (172, 'store/products/141.jpg', 46);
INSERT INTO `store_productgallery` VALUES (173, 'store/products/142.png', 46);
INSERT INTO `store_productgallery` VALUES (174, 'store/products/143.png', 46);
INSERT INTO `store_productgallery` VALUES (175, 'store/products/146.png', 47);
INSERT INTO `store_productgallery` VALUES (176, 'store/products/143.jpg', 47);
INSERT INTO `store_productgallery` VALUES (177, 'store/products/144.jpg', 47);
INSERT INTO `store_productgallery` VALUES (178, 'store/products/145.jpg', 47);
INSERT INTO `store_productgallery` VALUES (179, 'store/products/147.png', 48);
INSERT INTO `store_productgallery` VALUES (180, 'store/products/148.png', 48);
INSERT INTO `store_productgallery` VALUES (181, 'store/products/149.png', 48);
INSERT INTO `store_productgallery` VALUES (182, 'store/products/150.jpg', 49);
INSERT INTO `store_productgallery` VALUES (183, 'store/products/157.jpg', 49);
INSERT INTO `store_productgallery` VALUES (184, 'store/products/152.jpg', 49);
INSERT INTO `store_productgallery` VALUES (185, 'store/products/156.jpg', 49);
INSERT INTO `store_productgallery` VALUES (186, 'store/products/158.png', 50);
INSERT INTO `store_productgallery` VALUES (188, 'store/products/160.png', 50);
INSERT INTO `store_productgallery` VALUES (189, 'store/products/159.png', 50);
INSERT INTO `store_productgallery` VALUES (190, 'store/products/161.png', 50);
INSERT INTO `store_productgallery` VALUES (191, 'store/products/162.png', 51);
INSERT INTO `store_productgallery` VALUES (192, 'store/products/163.png', 51);
INSERT INTO `store_productgallery` VALUES (193, 'store/products/164.png', 51);
INSERT INTO `store_productgallery` VALUES (194, 'store/products/165.png', 51);
INSERT INTO `store_productgallery` VALUES (195, 'store/products/167.png', 52);
INSERT INTO `store_productgallery` VALUES (196, 'store/products/166.png', 52);
INSERT INTO `store_productgallery` VALUES (197, 'store/products/168.png', 52);
INSERT INTO `store_productgallery` VALUES (198, 'store/products/169.png', 52);
INSERT INTO `store_productgallery` VALUES (199, 'store/products/162.jpg', 53);
INSERT INTO `store_productgallery` VALUES (200, 'store/products/163.jpg', 53);
INSERT INTO `store_productgallery` VALUES (201, 'store/products/164.jpg', 53);
INSERT INTO `store_productgallery` VALUES (202, 'store/products/165.jpg', 53);
INSERT INTO `store_productgallery` VALUES (203, 'store/products/166_UCRAv5l.png', 54);
INSERT INTO `store_productgallery` VALUES (204, 'store/products/167_UUjVbTL.png', 54);
INSERT INTO `store_productgallery` VALUES (205, 'store/products/168_afGUAyu.png', 54);
INSERT INTO `store_productgallery` VALUES (206, 'store/products/169_hO1aytS.png', 54);
INSERT INTO `store_productgallery` VALUES (207, 'store/products/170.png', 54);
INSERT INTO `store_productgallery` VALUES (208, 'store/products/171.png', 55);
INSERT INTO `store_productgallery` VALUES (209, 'store/products/172.png', 55);
INSERT INTO `store_productgallery` VALUES (210, 'store/products/173.png', 55);
INSERT INTO `store_productgallery` VALUES (211, 'store/products/174.png', 55);
INSERT INTO `store_productgallery` VALUES (212, 'store/products/175.png', 55);
INSERT INTO `store_productgallery` VALUES (214, 'store/products/178.png', 56);
INSERT INTO `store_productgallery` VALUES (215, 'store/products/179.png', 56);
INSERT INTO `store_productgallery` VALUES (216, 'store/products/180.png', 56);
INSERT INTO `store_productgallery` VALUES (217, 'store/products/181.png', 56);
INSERT INTO `store_productgallery` VALUES (218, 'store/products/182.png', 57);
INSERT INTO `store_productgallery` VALUES (219, 'store/products/183.png', 57);
INSERT INTO `store_productgallery` VALUES (220, 'store/products/184.png', 57);
INSERT INTO `store_productgallery` VALUES (221, 'store/products/185.png', 57);
INSERT INTO `store_productgallery` VALUES (222, 'store/products/187.jpg', 58);
INSERT INTO `store_productgallery` VALUES (223, 'store/products/188.jpg', 58);
INSERT INTO `store_productgallery` VALUES (224, 'store/products/189.jpg', 58);
INSERT INTO `store_productgallery` VALUES (225, 'store/products/190.jpg', 58);
INSERT INTO `store_productgallery` VALUES (226, 'store/products/191.jpg', 58);
INSERT INTO `store_productgallery` VALUES (227, 'store/products/192.png', 59);
INSERT INTO `store_productgallery` VALUES (228, 'store/products/193.png', 59);
INSERT INTO `store_productgallery` VALUES (229, 'store/products/194.png', 59);
INSERT INTO `store_productgallery` VALUES (230, 'store/products/195.png', 59);
INSERT INTO `store_productgallery` VALUES (231, 'store/products/196.png', 60);
INSERT INTO `store_productgallery` VALUES (232, 'store/products/197.png', 60);
INSERT INTO `store_productgallery` VALUES (233, 'store/products/199.png', 60);
INSERT INTO `store_productgallery` VALUES (234, 'store/products/200.png', 60);
INSERT INTO `store_productgallery` VALUES (235, 'store/products/201.png', 61);
INSERT INTO `store_productgallery` VALUES (236, 'store/products/202.png', 61);
INSERT INTO `store_productgallery` VALUES (237, 'store/products/203.png', 61);
INSERT INTO `store_productgallery` VALUES (238, 'store/products/204.png', 61);
INSERT INTO `store_productgallery` VALUES (239, 'store/products/206.jpg', 62);
INSERT INTO `store_productgallery` VALUES (240, 'store/products/209.png', 62);
INSERT INTO `store_productgallery` VALUES (241, 'store/products/208.png', 62);
INSERT INTO `store_productgallery` VALUES (242, 'store/products/CaptureCa2.png', 62);
INSERT INTO `store_productgallery` VALUES (243, 'store/products/211.png', 63);
INSERT INTO `store_productgallery` VALUES (244, 'store/products/212.png', 63);
INSERT INTO `store_productgallery` VALUES (245, 'store/products/213.png', 63);
INSERT INTO `store_productgallery` VALUES (246, 'store/products/214.png', 63);
INSERT INTO `store_productgallery` VALUES (250, 'store/products/220.jpg', 64);
INSERT INTO `store_productgallery` VALUES (251, 'store/products/221.jpg', 64);
INSERT INTO `store_productgallery` VALUES (252, 'store/products/222.jpg', 64);
INSERT INTO `store_productgallery` VALUES (253, 'store/products/223.jpg', 64);

-- ----------------------------
-- Table structure for store_reviewrating
-- ----------------------------
DROP TABLE IF EXISTS `store_reviewrating`;
CREATE TABLE `store_reviewrating`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `review` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rating` double NOT NULL,
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `store_reviewrating_product_id_2e1974d6_fk_store_product_id`(`product_id` ASC) USING BTREE,
  INDEX `store_reviewrating_user_id_da0ed849_fk_account_account_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `store_reviewrating_product_id_2e1974d6_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `store_reviewrating_user_id_da0ed849_fk_account_account_id` FOREIGN KEY (`user_id`) REFERENCES `account_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store_reviewrating
-- ----------------------------

-- ----------------------------
-- Table structure for store_variation
-- ----------------------------
DROP TABLE IF EXISTS `store_variation`;
CREATE TABLE `store_variation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `variation_category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `variation_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `store_variation_product_id_e4f08cbc_fk_store_product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `store_variation_product_id_e4f08cbc_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 569 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store_variation
-- ----------------------------
INSERT INTO `store_variation` VALUES (1, 'color', 'black', 1, '2023-12-19 12:21:14.527816', 1);
INSERT INTO `store_variation` VALUES (2, 'color', 'white', 1, '2023-12-19 12:21:38.800832', 1);
INSERT INTO `store_variation` VALUES (3, 'color', 'gray', 1, '2023-12-19 12:21:56.731811', 1);
INSERT INTO `store_variation` VALUES (4, 'color', 'gold', 1, '2023-12-19 12:22:09.639451', 1);
INSERT INTO `store_variation` VALUES (5, 'color', 'red', 1, '2023-12-19 12:22:51.959400', 1);
INSERT INTO `store_variation` VALUES (6, 'size', 'M', 1, '2023-12-19 12:23:04.102726', 1);
INSERT INTO `store_variation` VALUES (7, 'size', 'L', 1, '2023-12-19 12:23:21.554267', 1);
INSERT INTO `store_variation` VALUES (8, 'color', 'XL', 1, '2023-12-19 12:24:30.957999', 1);
INSERT INTO `store_variation` VALUES (9, 'size', 'XXL', 1, '2023-12-19 12:25:12.667275', 1);
INSERT INTO `store_variation` VALUES (10, 'color', 'black', 1, '2023-12-19 12:25:27.020119', 2);
INSERT INTO `store_variation` VALUES (11, 'color', 'white', 1, '2023-12-19 12:25:47.483042', 2);
INSERT INTO `store_variation` VALUES (12, 'color', 'gray', 1, '2023-12-19 12:26:45.315330', 2);
INSERT INTO `store_variation` VALUES (13, 'color', 'gold', 1, '2023-12-19 12:27:34.370061', 2);
INSERT INTO `store_variation` VALUES (14, 'color', 'red', 1, '2023-12-19 12:27:47.213896', 2);
INSERT INTO `store_variation` VALUES (15, 'size', 'M', 1, '2023-12-19 12:28:12.844850', 2);
INSERT INTO `store_variation` VALUES (16, 'size', 'L', 1, '2023-12-19 12:28:27.388953', 2);
INSERT INTO `store_variation` VALUES (17, 'size', 'XL', 1, '2023-12-19 12:28:39.633783', 2);
INSERT INTO `store_variation` VALUES (18, 'size', 'XXL', 1, '2023-12-19 12:28:50.560472', 2);
INSERT INTO `store_variation` VALUES (19, 'color', 'black', 1, '2023-12-19 12:29:13.551093', 3);
INSERT INTO `store_variation` VALUES (20, 'color', 'white', 1, '2023-12-19 12:29:23.610597', 3);
INSERT INTO `store_variation` VALUES (21, 'color', 'gray', 1, '2023-12-19 12:29:35.158251', 3);
INSERT INTO `store_variation` VALUES (22, 'color', 'gold', 1, '2023-12-19 12:29:45.918925', 3);
INSERT INTO `store_variation` VALUES (23, 'color', 'red', 1, '2023-12-19 12:30:00.694942', 3);
INSERT INTO `store_variation` VALUES (24, 'size', 'M', 1, '2023-12-19 12:30:23.372075', 3);
INSERT INTO `store_variation` VALUES (25, 'size', 'L', 1, '2023-12-19 12:30:39.253777', 3);
INSERT INTO `store_variation` VALUES (26, 'size', 'XL', 1, '2023-12-19 12:30:47.766300', 3);
INSERT INTO `store_variation` VALUES (27, 'size', 'XXL', 1, '2023-12-19 12:30:57.551496', 3);
INSERT INTO `store_variation` VALUES (28, 'color', 'black', 1, '2023-12-19 12:31:09.377868', 4);
INSERT INTO `store_variation` VALUES (29, 'color', 'white', 1, '2023-12-19 12:31:22.554267', 4);
INSERT INTO `store_variation` VALUES (30, 'color', 'gray', 1, '2023-12-19 12:31:33.278149', 4);
INSERT INTO `store_variation` VALUES (31, 'color', 'gold', 1, '2023-12-19 12:31:50.988593', 4);
INSERT INTO `store_variation` VALUES (32, 'size', 'M', 1, '2023-12-19 12:32:01.360458', 4);
INSERT INTO `store_variation` VALUES (33, 'size', 'L', 1, '2023-12-19 12:32:13.514875', 4);
INSERT INTO `store_variation` VALUES (34, 'size', 'XL', 1, '2023-12-19 12:32:24.707226', 4);
INSERT INTO `store_variation` VALUES (35, 'size', 'XXL', 1, '2023-12-19 12:32:41.209509', 4);
INSERT INTO `store_variation` VALUES (36, 'color', 'black', 1, '2023-12-19 12:32:51.519407', 5);
INSERT INTO `store_variation` VALUES (37, 'color', 'white', 1, '2023-12-19 12:33:01.374193', 5);
INSERT INTO `store_variation` VALUES (38, 'color', 'gray', 1, '2023-12-19 12:33:25.858956', 5);
INSERT INTO `store_variation` VALUES (39, 'color', 'gold', 1, '2023-12-19 12:33:36.807257', 5);
INSERT INTO `store_variation` VALUES (40, 'color', 'red', 1, '2023-12-19 12:33:45.373010', 5);
INSERT INTO `store_variation` VALUES (41, 'size', 'M', 1, '2023-12-19 12:33:57.683994', 5);
INSERT INTO `store_variation` VALUES (42, 'size', 'L', 1, '2023-12-19 12:34:07.752112', 5);
INSERT INTO `store_variation` VALUES (43, 'size', 'XL', 1, '2023-12-19 12:34:24.874636', 5);
INSERT INTO `store_variation` VALUES (44, 'size', 'XXL', 1, '2023-12-19 12:34:35.727565', 5);
INSERT INTO `store_variation` VALUES (45, 'color', 'black', 1, '2023-12-19 12:34:55.116969', 6);
INSERT INTO `store_variation` VALUES (46, 'color', 'white', 1, '2023-12-19 12:35:31.758832', 6);
INSERT INTO `store_variation` VALUES (47, 'color', 'gray', 1, '2023-12-19 12:36:12.536180', 6);
INSERT INTO `store_variation` VALUES (48, 'color', 'gold', 1, '2023-12-19 12:36:28.004010', 6);
INSERT INTO `store_variation` VALUES (49, 'color', 'red', 1, '2023-12-19 12:36:37.910639', 6);
INSERT INTO `store_variation` VALUES (50, 'size', 'M', 1, '2023-12-19 12:36:51.480240', 6);
INSERT INTO `store_variation` VALUES (51, 'size', 'L', 1, '2023-12-19 12:37:02.888210', 6);
INSERT INTO `store_variation` VALUES (52, 'size', 'XL', 1, '2023-12-19 12:37:13.986008', 6);
INSERT INTO `store_variation` VALUES (53, 'size', 'XXL', 1, '2023-12-19 12:37:25.499436', 6);
INSERT INTO `store_variation` VALUES (54, 'color', 'black', 1, '2023-12-19 12:37:46.272019', 7);
INSERT INTO `store_variation` VALUES (55, 'color', 'white', 1, '2023-12-19 12:38:48.693348', 7);
INSERT INTO `store_variation` VALUES (56, 'color', 'gray', 1, '2023-12-19 12:39:01.075851', 7);
INSERT INTO `store_variation` VALUES (57, 'color', 'gold', 1, '2023-12-19 12:39:13.445830', 7);
INSERT INTO `store_variation` VALUES (58, 'color', 'red', 1, '2023-12-19 12:40:09.337544', 7);
INSERT INTO `store_variation` VALUES (59, 'size', 'M', 1, '2023-12-19 12:40:19.405170', 7);
INSERT INTO `store_variation` VALUES (60, 'size', 'L', 1, '2023-12-19 12:40:30.052450', 7);
INSERT INTO `store_variation` VALUES (61, 'size', 'XL', 1, '2023-12-19 12:40:42.283427', 7);
INSERT INTO `store_variation` VALUES (62, 'size', 'XXL', 1, '2023-12-19 12:40:51.241208', 7);
INSERT INTO `store_variation` VALUES (63, 'color', 'black', 1, '2023-12-19 12:41:05.924363', 8);
INSERT INTO `store_variation` VALUES (64, 'color', 'white', 1, '2023-12-19 12:41:21.366561', 8);
INSERT INTO `store_variation` VALUES (65, 'color', 'gray', 1, '2023-12-19 12:41:34.009805', 8);
INSERT INTO `store_variation` VALUES (66, 'color', 'gold', 1, '2023-12-19 12:41:51.119821', 8);
INSERT INTO `store_variation` VALUES (67, 'color', 'red', 1, '2023-12-19 12:42:13.023179', 8);
INSERT INTO `store_variation` VALUES (68, 'size', 'M', 1, '2023-12-19 12:42:24.653643', 8);
INSERT INTO `store_variation` VALUES (69, 'size', 'L', 1, '2023-12-19 12:42:45.065341', 8);
INSERT INTO `store_variation` VALUES (70, 'size', 'XL', 1, '2023-12-19 12:42:55.890100', 8);
INSERT INTO `store_variation` VALUES (71, 'size', 'XXL', 1, '2023-12-19 12:43:45.695405', 8);
INSERT INTO `store_variation` VALUES (72, 'color', 'black', 1, '2023-12-19 12:44:07.090309', 9);
INSERT INTO `store_variation` VALUES (73, 'color', 'white', 1, '2023-12-19 12:44:32.032578', 9);
INSERT INTO `store_variation` VALUES (74, 'color', 'gray', 1, '2023-12-19 12:44:46.132637', 9);
INSERT INTO `store_variation` VALUES (75, 'color', 'gold', 1, '2023-12-19 12:45:04.042099', 9);
INSERT INTO `store_variation` VALUES (76, 'color', 'red', 1, '2023-12-19 12:45:28.821575', 9);
INSERT INTO `store_variation` VALUES (77, 'size', 'M', 1, '2023-12-19 12:45:48.785077', 9);
INSERT INTO `store_variation` VALUES (78, 'size', 'L', 1, '2023-12-19 12:47:04.001115', 9);
INSERT INTO `store_variation` VALUES (79, 'size', 'XL', 1, '2023-12-19 12:47:22.361549', 9);
INSERT INTO `store_variation` VALUES (80, 'size', 'XXL', 1, '2023-12-19 12:47:33.675449', 9);
INSERT INTO `store_variation` VALUES (81, 'color', 'black', 1, '2023-12-19 12:47:58.682847', 10);
INSERT INTO `store_variation` VALUES (82, 'color', 'white', 1, '2023-12-19 12:48:11.346560', 10);
INSERT INTO `store_variation` VALUES (83, 'color', 'gray', 1, '2023-12-19 12:48:35.587082', 10);
INSERT INTO `store_variation` VALUES (84, 'color', 'gold', 1, '2023-12-19 12:48:53.611957', 10);
INSERT INTO `store_variation` VALUES (85, 'color', 'red', 1, '2023-12-19 12:49:17.676689', 10);
INSERT INTO `store_variation` VALUES (86, 'size', 'M', 1, '2023-12-19 12:49:30.218854', 10);
INSERT INTO `store_variation` VALUES (87, 'size', 'L', 1, '2023-12-19 12:49:46.390972', 10);
INSERT INTO `store_variation` VALUES (88, 'size', 'XL', 1, '2023-12-19 12:50:09.166891', 10);
INSERT INTO `store_variation` VALUES (89, 'size', 'XXL', 1, '2023-12-19 12:50:22.109903', 10);
INSERT INTO `store_variation` VALUES (90, 'color', 'black', 1, '2023-12-19 12:50:33.345108', 11);
INSERT INTO `store_variation` VALUES (91, 'color', 'white', 1, '2023-12-19 12:50:41.506305', 11);
INSERT INTO `store_variation` VALUES (92, 'color', 'gray', 1, '2023-12-19 12:51:00.800594', 11);
INSERT INTO `store_variation` VALUES (93, 'color', 'gold', 1, '2023-12-19 12:51:23.196650', 11);
INSERT INTO `store_variation` VALUES (94, 'size', 'M', 1, '2023-12-19 12:51:39.501099', 11);
INSERT INTO `store_variation` VALUES (95, 'size', 'L', 1, '2023-12-19 12:51:55.042121', 11);
INSERT INTO `store_variation` VALUES (96, 'size', 'XL', 1, '2023-12-19 12:52:17.863178', 11);
INSERT INTO `store_variation` VALUES (97, 'size', 'XXL', 1, '2023-12-19 12:52:32.455804', 11);
INSERT INTO `store_variation` VALUES (98, 'color', 'black', 1, '2023-12-19 12:53:31.589508', 12);
INSERT INTO `store_variation` VALUES (99, 'color', 'white', 1, '2023-12-19 12:53:42.722119', 12);
INSERT INTO `store_variation` VALUES (100, 'color', 'gray', 1, '2023-12-19 12:53:58.339355', 12);
INSERT INTO `store_variation` VALUES (101, 'color', 'gold', 1, '2023-12-19 12:54:31.075345', 12);
INSERT INTO `store_variation` VALUES (102, 'color', 'red', 1, '2023-12-19 12:54:45.076202', 12);
INSERT INTO `store_variation` VALUES (103, 'size', 'M', 1, '2023-12-19 12:55:03.565983', 12);
INSERT INTO `store_variation` VALUES (104, 'size', 'L', 1, '2023-12-19 12:55:19.932073', 12);
INSERT INTO `store_variation` VALUES (105, 'size', 'XL', 1, '2023-12-19 12:55:44.511064', 12);
INSERT INTO `store_variation` VALUES (106, 'size', 'XXL', 1, '2023-12-19 12:55:58.527719', 12);
INSERT INTO `store_variation` VALUES (107, 'color', 'black', 1, '2023-12-19 12:56:23.503649', 13);
INSERT INTO `store_variation` VALUES (108, 'color', 'white', 1, '2023-12-19 12:56:35.678236', 13);
INSERT INTO `store_variation` VALUES (109, 'color', 'gray', 1, '2023-12-19 12:56:51.663345', 13);
INSERT INTO `store_variation` VALUES (110, 'color', 'gold', 1, '2023-12-19 12:57:13.371625', 13);
INSERT INTO `store_variation` VALUES (111, 'color', 'red', 1, '2023-12-19 12:57:32.552904', 13);
INSERT INTO `store_variation` VALUES (112, 'size', 'M', 1, '2023-12-19 12:57:47.597263', 13);
INSERT INTO `store_variation` VALUES (113, 'size', 'L', 1, '2023-12-19 12:57:57.026221', 13);
INSERT INTO `store_variation` VALUES (114, 'size', 'XL', 1, '2023-12-19 12:58:19.114381', 13);
INSERT INTO `store_variation` VALUES (115, 'size', 'XXL', 1, '2023-12-19 12:58:33.621785', 13);
INSERT INTO `store_variation` VALUES (116, 'color', 'black', 1, '2023-12-19 12:59:12.707112', 14);
INSERT INTO `store_variation` VALUES (117, 'color', 'white', 1, '2023-12-19 12:59:26.010115', 14);
INSERT INTO `store_variation` VALUES (118, 'color', 'gray', 1, '2023-12-19 12:59:39.153621', 14);
INSERT INTO `store_variation` VALUES (119, 'color', 'gold', 1, '2023-12-19 12:59:52.532117', 14);
INSERT INTO `store_variation` VALUES (120, 'color', 'red', 1, '2023-12-19 13:00:07.626899', 14);
INSERT INTO `store_variation` VALUES (121, 'size', 'M', 1, '2023-12-19 13:00:20.739894', 14);
INSERT INTO `store_variation` VALUES (122, 'size', 'L', 1, '2023-12-19 13:00:31.737632', 14);
INSERT INTO `store_variation` VALUES (123, 'size', 'XL', 1, '2023-12-19 13:00:50.617035', 14);
INSERT INTO `store_variation` VALUES (124, 'size', 'XXL', 1, '2023-12-19 13:01:03.483533', 14);
INSERT INTO `store_variation` VALUES (125, 'color', 'black', 1, '2023-12-19 13:01:16.796706', 15);
INSERT INTO `store_variation` VALUES (126, 'color', 'white', 1, '2023-12-19 13:01:32.369966', 15);
INSERT INTO `store_variation` VALUES (127, 'color', 'gray', 1, '2023-12-19 13:01:49.079911', 15);
INSERT INTO `store_variation` VALUES (128, 'color', 'gold', 1, '2023-12-19 13:02:01.992949', 15);
INSERT INTO `store_variation` VALUES (129, 'color', 'red', 1, '2023-12-19 13:02:20.192096', 15);
INSERT INTO `store_variation` VALUES (130, 'size', 'M', 1, '2023-12-19 13:02:57.748367', 15);
INSERT INTO `store_variation` VALUES (131, 'size', 'L', 1, '2023-12-19 13:03:07.829811', 15);
INSERT INTO `store_variation` VALUES (132, 'size', 'XL', 1, '2023-12-19 13:03:21.441222', 15);
INSERT INTO `store_variation` VALUES (133, 'size', 'XXL', 1, '2023-12-19 13:03:37.423902', 15);
INSERT INTO `store_variation` VALUES (134, 'color', 'black', 1, '2023-12-19 13:04:14.814047', 16);
INSERT INTO `store_variation` VALUES (135, 'color', 'white', 1, '2023-12-19 13:04:27.122661', 16);
INSERT INTO `store_variation` VALUES (136, 'color', 'gray', 1, '2023-12-19 13:04:37.807416', 16);
INSERT INTO `store_variation` VALUES (137, 'color', 'red', 1, '2023-12-19 13:04:56.998609', 16);
INSERT INTO `store_variation` VALUES (138, 'size', 'M', 1, '2023-12-19 13:05:18.380343', 16);
INSERT INTO `store_variation` VALUES (139, 'size', 'L', 1, '2023-12-19 13:05:33.614318', 16);
INSERT INTO `store_variation` VALUES (140, 'size', 'XL', 1, '2023-12-19 13:05:53.187130', 16);
INSERT INTO `store_variation` VALUES (141, 'size', 'XXL', 1, '2023-12-19 13:06:10.125424', 16);
INSERT INTO `store_variation` VALUES (142, 'color', 'black', 1, '2023-12-19 13:06:32.166677', 17);
INSERT INTO `store_variation` VALUES (143, 'color', 'white', 1, '2023-12-19 13:06:42.293171', 17);
INSERT INTO `store_variation` VALUES (144, 'color', 'gray', 1, '2023-12-19 13:08:13.988814', 17);
INSERT INTO `store_variation` VALUES (145, 'color', 'gold', 1, '2023-12-19 13:08:37.957166', 17);
INSERT INTO `store_variation` VALUES (146, 'color', 'red', 1, '2023-12-19 13:08:57.741194', 17);
INSERT INTO `store_variation` VALUES (147, 'size', 'M', 1, '2023-12-19 13:09:45.353019', 17);
INSERT INTO `store_variation` VALUES (148, 'size', 'L', 1, '2023-12-19 13:09:56.228269', 17);
INSERT INTO `store_variation` VALUES (149, 'size', 'XL', 1, '2023-12-19 13:10:07.603098', 17);
INSERT INTO `store_variation` VALUES (150, 'size', 'XXL', 1, '2023-12-19 13:10:22.497695', 17);
INSERT INTO `store_variation` VALUES (151, 'color', 'black', 1, '2023-12-19 13:11:04.600705', 18);
INSERT INTO `store_variation` VALUES (152, 'color', 'white', 1, '2023-12-19 13:11:34.526767', 18);
INSERT INTO `store_variation` VALUES (153, 'color', 'gray', 1, '2023-12-19 13:11:50.737609', 18);
INSERT INTO `store_variation` VALUES (154, 'color', 'gold', 1, '2023-12-19 13:12:01.550790', 18);
INSERT INTO `store_variation` VALUES (155, 'color', 'red', 1, '2023-12-19 13:12:15.431581', 18);
INSERT INTO `store_variation` VALUES (156, 'size', 'M', 1, '2023-12-19 13:12:28.552072', 18);
INSERT INTO `store_variation` VALUES (157, 'size', 'L', 1, '2023-12-19 13:13:18.129994', 18);
INSERT INTO `store_variation` VALUES (158, 'size', 'XL', 1, '2023-12-19 13:13:31.281291', 18);
INSERT INTO `store_variation` VALUES (159, 'size', 'XXL', 1, '2023-12-19 13:13:43.145535', 18);
INSERT INTO `store_variation` VALUES (160, 'color', 'black', 1, '2023-12-19 13:14:09.423320', 19);
INSERT INTO `store_variation` VALUES (161, 'color', 'white', 1, '2023-12-19 13:14:28.380592', 19);
INSERT INTO `store_variation` VALUES (162, 'color', 'gray', 1, '2023-12-19 13:14:47.562747', 19);
INSERT INTO `store_variation` VALUES (163, 'color', 'gold', 1, '2023-12-19 13:15:02.607188', 19);
INSERT INTO `store_variation` VALUES (164, 'color', 'red', 1, '2023-12-19 13:15:14.643313', 19);
INSERT INTO `store_variation` VALUES (165, 'size', 'M', 1, '2023-12-19 13:15:29.315442', 19);
INSERT INTO `store_variation` VALUES (166, 'size', 'L', 1, '2023-12-19 13:15:43.892174', 19);
INSERT INTO `store_variation` VALUES (167, 'size', 'XL', 1, '2023-12-19 13:15:54.628861', 19);
INSERT INTO `store_variation` VALUES (168, 'size', 'XXL', 1, '2023-12-19 13:16:10.488900', 19);
INSERT INTO `store_variation` VALUES (169, 'color', 'black', 1, '2023-12-19 13:16:29.002090', 20);
INSERT INTO `store_variation` VALUES (170, 'color', 'white', 1, '2023-12-19 13:16:42.737452', 20);
INSERT INTO `store_variation` VALUES (171, 'color', 'gray', 1, '2023-12-19 13:16:55.836779', 20);
INSERT INTO `store_variation` VALUES (172, 'color', 'gold', 1, '2023-12-19 13:17:12.688437', 20);
INSERT INTO `store_variation` VALUES (173, 'color', 'red', 1, '2023-12-19 13:17:31.468461', 20);
INSERT INTO `store_variation` VALUES (174, 'size', 'M', 1, '2023-12-19 13:17:48.230207', 20);
INSERT INTO `store_variation` VALUES (175, 'size', 'L', 1, '2023-12-19 13:18:01.733593', 20);
INSERT INTO `store_variation` VALUES (176, 'size', 'XL', 1, '2023-12-19 13:18:13.965845', 20);
INSERT INTO `store_variation` VALUES (177, 'size', 'XXL', 1, '2023-12-19 13:18:28.387677', 20);
INSERT INTO `store_variation` VALUES (178, 'color', 'black', 1, '2023-12-19 13:18:48.439173', 21);
INSERT INTO `store_variation` VALUES (179, 'color', 'white', 1, '2023-12-19 13:19:00.553339', 21);
INSERT INTO `store_variation` VALUES (180, 'color', 'gray', 1, '2023-12-19 13:19:20.838987', 21);
INSERT INTO `store_variation` VALUES (181, 'color', 'gold', 1, '2023-12-19 13:19:38.942517', 21);
INSERT INTO `store_variation` VALUES (182, 'color', 'red', 1, '2023-12-19 13:19:53.151725', 21);
INSERT INTO `store_variation` VALUES (183, 'size', 'V 20L', 1, '2023-12-19 13:24:38.083188', 21);
INSERT INTO `store_variation` VALUES (184, 'size', 'V 40L', 1, '2023-12-19 13:25:41.091543', 21);
INSERT INTO `store_variation` VALUES (185, 'size', 'V 60L', 1, '2023-12-19 13:25:57.089738', 21);
INSERT INTO `store_variation` VALUES (186, 'size', 'V 80L', 1, '2023-12-19 13:26:17.883943', 21);
INSERT INTO `store_variation` VALUES (187, 'color', 'black', 1, '2023-12-19 13:21:25.362692', 22);
INSERT INTO `store_variation` VALUES (188, 'color', 'white', 1, '2023-12-19 13:27:42.228567', 22);
INSERT INTO `store_variation` VALUES (189, 'color', 'gray', 1, '2023-12-19 13:21:47.134577', 22);
INSERT INTO `store_variation` VALUES (190, 'color', 'gold', 1, '2023-12-19 13:22:27.943311', 22);
INSERT INTO `store_variation` VALUES (191, 'color', 'red', 1, '2023-12-19 13:22:56.418528', 22);
INSERT INTO `store_variation` VALUES (192, 'size', 'V 20L', 1, '2023-12-19 13:23:17.273024', 22);
INSERT INTO `store_variation` VALUES (193, 'size', 'V 40L', 1, '2023-12-19 13:23:30.639896', 22);
INSERT INTO `store_variation` VALUES (194, 'size', 'V 60L', 1, '2023-12-19 13:23:43.406967', 22);
INSERT INTO `store_variation` VALUES (195, 'size', 'V 80L', 1, '2023-12-19 13:24:00.736640', 22);
INSERT INTO `store_variation` VALUES (196, 'color', 'black', 1, '2023-12-19 13:28:28.850667', 23);
INSERT INTO `store_variation` VALUES (197, 'color', 'white', 1, '2023-12-19 13:28:44.687023', 23);
INSERT INTO `store_variation` VALUES (198, 'color', 'gray', 1, '2023-12-19 13:29:17.590225', 23);
INSERT INTO `store_variation` VALUES (199, 'color', 'gold', 1, '2023-12-19 13:30:10.901487', 23);
INSERT INTO `store_variation` VALUES (200, 'color', 'red', 1, '2023-12-19 13:30:34.062349', 23);
INSERT INTO `store_variation` VALUES (201, 'size', 'V 20L', 1, '2023-12-19 13:31:04.933093', 23);
INSERT INTO `store_variation` VALUES (202, 'size', 'V 40L', 1, '2023-12-19 13:31:17.972766', 23);
INSERT INTO `store_variation` VALUES (203, 'size', 'V 60L', 1, '2023-12-19 13:31:37.889163', 23);
INSERT INTO `store_variation` VALUES (204, 'size', 'V 80L', 1, '2023-12-19 13:31:48.217599', 23);
INSERT INTO `store_variation` VALUES (205, 'color', 'black', 1, '2023-12-19 13:32:29.924459', 24);
INSERT INTO `store_variation` VALUES (206, 'color', 'white', 1, '2023-12-19 13:32:41.635236', 24);
INSERT INTO `store_variation` VALUES (207, 'color', 'gray', 1, '2023-12-19 13:32:54.097929', 24);
INSERT INTO `store_variation` VALUES (208, 'color', 'gold', 1, '2023-12-19 13:33:21.886759', 24);
INSERT INTO `store_variation` VALUES (209, 'color', 'red', 1, '2023-12-19 13:34:02.143928', 24);
INSERT INTO `store_variation` VALUES (210, 'size', 'V 20L', 1, '2023-12-19 13:34:30.900744', 24);
INSERT INTO `store_variation` VALUES (211, 'size', 'V 40L', 1, '2023-12-19 13:34:44.365409', 24);
INSERT INTO `store_variation` VALUES (212, 'size', 'V 60L', 1, '2023-12-19 13:34:56.263509', 24);
INSERT INTO `store_variation` VALUES (213, 'size', 'V 80L', 1, '2023-12-19 13:35:15.427930', 24);
INSERT INTO `store_variation` VALUES (214, 'color', 'black', 1, '2023-12-19 13:35:46.927160', 25);
INSERT INTO `store_variation` VALUES (215, 'color', 'white', 1, '2023-12-19 13:36:06.500127', 25);
INSERT INTO `store_variation` VALUES (216, 'color', 'gray', 1, '2023-12-19 13:36:24.360810', 25);
INSERT INTO `store_variation` VALUES (217, 'color', 'gold', 1, '2023-12-19 13:36:42.882990', 25);
INSERT INTO `store_variation` VALUES (218, 'color', 'red', 1, '2023-12-19 13:37:00.046272', 25);
INSERT INTO `store_variation` VALUES (219, 'size', 'V 20L', 1, '2023-12-19 13:37:17.910919', 25);
INSERT INTO `store_variation` VALUES (220, 'size', 'V 40L', 1, '2023-12-19 13:37:32.922051', 25);
INSERT INTO `store_variation` VALUES (221, 'size', 'V 60L', 1, '2023-12-19 13:38:19.814014', 25);
INSERT INTO `store_variation` VALUES (222, 'size', 'V 80L', 1, '2023-12-19 13:38:30.801308', 25);
INSERT INTO `store_variation` VALUES (223, 'color', 'black', 1, '2023-12-19 13:38:41.892155', 26);
INSERT INTO `store_variation` VALUES (224, 'color', 'white', 1, '2023-12-19 13:38:53.853717', 26);
INSERT INTO `store_variation` VALUES (225, 'color', 'gray', 1, '2023-12-19 13:39:04.516022', 26);
INSERT INTO `store_variation` VALUES (226, 'color', 'gold', 1, '2023-12-19 13:39:27.237594', 26);
INSERT INTO `store_variation` VALUES (227, 'color', 'red', 1, '2023-12-19 13:39:48.432961', 26);
INSERT INTO `store_variation` VALUES (228, 'size', 'V 20L', 1, '2023-12-19 13:40:05.033896', 26);
INSERT INTO `store_variation` VALUES (229, 'size', 'V 40L', 1, '2023-12-19 13:40:16.533678', 26);
INSERT INTO `store_variation` VALUES (230, 'size', 'V 60L', 1, '2023-12-19 13:40:37.185219', 26);
INSERT INTO `store_variation` VALUES (231, 'size', 'V 80L', 1, '2023-12-19 13:41:01.654431', 26);
INSERT INTO `store_variation` VALUES (232, 'color', 'black', 1, '2023-12-19 13:41:21.750803', 27);
INSERT INTO `store_variation` VALUES (233, 'color', 'white', 1, '2023-12-19 13:42:32.814398', 27);
INSERT INTO `store_variation` VALUES (234, 'color', 'gray', 1, '2023-12-19 13:42:58.648468', 27);
INSERT INTO `store_variation` VALUES (235, 'color', 'gold', 1, '2023-12-19 13:44:10.572673', 27);
INSERT INTO `store_variation` VALUES (236, 'color', 'red', 1, '2023-12-19 13:44:31.577112', 27);
INSERT INTO `store_variation` VALUES (237, 'size', 'V 20L', 1, '2023-12-19 13:44:41.138426', 27);
INSERT INTO `store_variation` VALUES (238, 'size', 'V 40L', 1, '2023-12-19 13:45:07.481058', 27);
INSERT INTO `store_variation` VALUES (239, 'size', 'V 60L', 1, '2023-12-19 13:45:38.147453', 27);
INSERT INTO `store_variation` VALUES (240, 'size', 'V 80L', 1, '2023-12-19 13:45:52.281725', 27);
INSERT INTO `store_variation` VALUES (241, 'color', 'black', 1, '2023-12-19 13:46:16.685620', 28);
INSERT INTO `store_variation` VALUES (242, 'color', 'black', 1, '2023-12-19 13:46:56.262497', 28);
INSERT INTO `store_variation` VALUES (243, 'color', 'white', 1, '2023-12-19 13:47:06.088795', 28);
INSERT INTO `store_variation` VALUES (244, 'color', 'gray', 1, '2023-12-19 13:47:16.036899', 28);
INSERT INTO `store_variation` VALUES (245, 'color', 'gold', 1, '2023-12-19 13:47:34.301523', 28);
INSERT INTO `store_variation` VALUES (246, 'color', 'red', 1, '2023-12-19 13:47:48.234534', 28);
INSERT INTO `store_variation` VALUES (247, 'size', 'M', 1, '2023-12-19 13:48:12.892391', 28);
INSERT INTO `store_variation` VALUES (248, 'size', 'L', 1, '2023-12-19 13:48:25.168819', 28);
INSERT INTO `store_variation` VALUES (249, 'size', 'XL', 1, '2023-12-19 13:48:37.501107', 28);
INSERT INTO `store_variation` VALUES (250, 'size', 'XXL', 1, '2023-12-19 13:48:50.281756', 28);
INSERT INTO `store_variation` VALUES (251, 'color', 'black', 1, '2023-12-19 13:49:12.124955', 29);
INSERT INTO `store_variation` VALUES (252, 'color', 'white', 1, '2023-12-19 13:49:21.569690', 29);
INSERT INTO `store_variation` VALUES (253, 'color', 'gray', 1, '2023-12-19 13:49:31.658042', 29);
INSERT INTO `store_variation` VALUES (254, 'color', 'gold', 1, '2023-12-19 13:50:24.794879', 29);
INSERT INTO `store_variation` VALUES (255, 'color', 'red', 1, '2023-12-19 13:50:49.039943', 29);
INSERT INTO `store_variation` VALUES (256, 'size', 'M', 1, '2023-12-19 13:50:58.963897', 29);
INSERT INTO `store_variation` VALUES (257, 'size', 'L', 1, '2023-12-19 13:51:08.407928', 29);
INSERT INTO `store_variation` VALUES (258, 'size', 'XL', 1, '2023-12-19 13:51:24.344734', 29);
INSERT INTO `store_variation` VALUES (259, 'size', 'XXL', 1, '2023-12-19 13:51:41.040839', 29);
INSERT INTO `store_variation` VALUES (260, 'color', 'black', 1, '2023-12-19 13:52:51.429408', 30);
INSERT INTO `store_variation` VALUES (261, 'color', 'white', 1, '2023-12-19 13:53:18.410352', 30);
INSERT INTO `store_variation` VALUES (262, 'color', 'gray', 1, '2023-12-19 13:53:28.300901', 30);
INSERT INTO `store_variation` VALUES (263, 'color', 'gold', 1, '2023-12-19 13:53:43.567490', 30);
INSERT INTO `store_variation` VALUES (264, 'color', 'red', 1, '2023-12-19 13:53:54.212487', 30);
INSERT INTO `store_variation` VALUES (265, 'size', 'M', 1, '2023-12-19 13:54:03.833563', 30);
INSERT INTO `store_variation` VALUES (266, 'size', 'L', 1, '2023-12-19 13:54:17.263585', 30);
INSERT INTO `store_variation` VALUES (267, 'size', 'XL', 1, '2023-12-19 13:54:30.654872', 30);
INSERT INTO `store_variation` VALUES (268, 'size', 'XXL', 1, '2023-12-19 13:54:52.427534', 30);
INSERT INTO `store_variation` VALUES (269, 'color', 'black', 1, '2023-12-19 13:55:22.714044', 31);
INSERT INTO `store_variation` VALUES (270, 'color', 'white', 1, '2023-12-19 13:55:32.655362', 31);
INSERT INTO `store_variation` VALUES (271, 'color', 'gray', 1, '2023-12-19 13:55:43.157943', 31);
INSERT INTO `store_variation` VALUES (272, 'color', 'gold', 1, '2023-12-19 13:55:59.731140', 31);
INSERT INTO `store_variation` VALUES (273, 'color', 'red', 1, '2023-12-19 13:56:13.983022', 31);
INSERT INTO `store_variation` VALUES (274, 'size', 'M', 1, '2023-12-19 13:56:33.816156', 31);
INSERT INTO `store_variation` VALUES (275, 'size', 'L', 1, '2023-12-19 13:57:07.313234', 31);
INSERT INTO `store_variation` VALUES (276, 'size', 'XL', 1, '2023-12-19 13:57:36.057460', 31);
INSERT INTO `store_variation` VALUES (277, 'size', 'XXL', 1, '2023-12-19 13:57:45.403709', 31);
INSERT INTO `store_variation` VALUES (278, 'color', 'black', 1, '2023-12-19 13:58:22.914553', 32);
INSERT INTO `store_variation` VALUES (279, 'color', 'white', 1, '2023-12-19 13:58:33.850665', 32);
INSERT INTO `store_variation` VALUES (280, 'color', 'gray', 1, '2023-12-19 13:59:12.646667', 32);
INSERT INTO `store_variation` VALUES (281, 'color', 'gold', 1, '2023-12-19 13:59:32.214378', 32);
INSERT INTO `store_variation` VALUES (282, 'color', 'red', 1, '2023-12-19 13:59:49.676888', 32);
INSERT INTO `store_variation` VALUES (283, 'size', 'M', 1, '2023-12-19 14:00:08.083075', 32);
INSERT INTO `store_variation` VALUES (284, 'size', 'L', 1, '2023-12-19 14:00:27.743316', 32);
INSERT INTO `store_variation` VALUES (285, 'size', 'XL', 1, '2023-12-19 14:00:38.836546', 32);
INSERT INTO `store_variation` VALUES (286, 'size', 'XXL', 1, '2023-12-19 14:00:47.928053', 32);
INSERT INTO `store_variation` VALUES (287, 'color', 'black', 1, '2023-12-19 14:01:06.872278', 33);
INSERT INTO `store_variation` VALUES (288, 'color', 'white', 1, '2023-12-19 14:01:23.015838', 33);
INSERT INTO `store_variation` VALUES (289, 'color', 'gray', 1, '2023-12-19 14:01:33.310890', 33);
INSERT INTO `store_variation` VALUES (290, 'color', 'gold', 1, '2023-12-19 14:01:47.459597', 33);
INSERT INTO `store_variation` VALUES (291, 'color', 'red', 1, '2023-12-19 14:02:07.901503', 33);
INSERT INTO `store_variation` VALUES (292, 'size', 'M', 1, '2023-12-19 14:02:17.962263', 33);
INSERT INTO `store_variation` VALUES (293, 'size', 'L', 1, '2023-12-19 14:02:27.617789', 33);
INSERT INTO `store_variation` VALUES (294, 'size', 'XL', 1, '2023-12-19 14:02:40.308829', 33);
INSERT INTO `store_variation` VALUES (295, 'size', 'XXL', 1, '2023-12-19 14:02:49.525039', 33);
INSERT INTO `store_variation` VALUES (296, 'color', 'black', 1, '2023-12-19 14:03:07.721400', 34);
INSERT INTO `store_variation` VALUES (297, 'color', 'white', 1, '2023-12-19 14:03:23.261266', 34);
INSERT INTO `store_variation` VALUES (298, 'color', 'gray', 1, '2023-12-19 14:03:35.700428', 34);
INSERT INTO `store_variation` VALUES (299, 'color', 'gold', 1, '2023-12-19 14:03:52.680159', 34);
INSERT INTO `store_variation` VALUES (300, 'color', 'red', 1, '2023-12-19 14:04:06.692329', 34);
INSERT INTO `store_variation` VALUES (301, 'size', 'M', 1, '2023-12-19 14:04:18.514053', 34);
INSERT INTO `store_variation` VALUES (302, 'size', 'L', 1, '2023-12-19 14:04:32.134278', 34);
INSERT INTO `store_variation` VALUES (303, 'size', 'XL', 1, '2023-12-19 14:04:44.965799', 34);
INSERT INTO `store_variation` VALUES (304, 'size', 'XXL', 1, '2023-12-19 14:04:59.327126', 34);
INSERT INTO `store_variation` VALUES (305, 'color', 'black', 1, '2023-12-19 14:05:15.429029', 35);
INSERT INTO `store_variation` VALUES (306, 'color', 'white', 1, '2023-12-19 14:06:31.203381', 35);
INSERT INTO `store_variation` VALUES (307, 'color', 'gray', 1, '2023-12-19 14:06:54.431940', 35);
INSERT INTO `store_variation` VALUES (308, 'color', 'gold', 1, '2023-12-19 14:07:15.556963', 35);
INSERT INTO `store_variation` VALUES (309, 'color', 'red', 1, '2023-12-19 14:07:37.939805', 35);
INSERT INTO `store_variation` VALUES (310, 'size', 'M', 1, '2023-12-19 14:07:50.618515', 35);
INSERT INTO `store_variation` VALUES (311, 'size', 'L', 1, '2023-12-19 14:08:05.629615', 35);
INSERT INTO `store_variation` VALUES (312, 'size', 'XL', 1, '2023-12-19 14:08:37.468535', 35);
INSERT INTO `store_variation` VALUES (313, 'size', 'XXL', 1, '2023-12-19 14:08:49.493989', 35);
INSERT INTO `store_variation` VALUES (314, 'color', 'black', 1, '2023-12-19 14:09:10.298664', 36);
INSERT INTO `store_variation` VALUES (315, 'color', 'white', 1, '2023-12-19 14:10:48.360115', 36);
INSERT INTO `store_variation` VALUES (316, 'color', 'gray', 1, '2023-12-19 14:11:28.249711', 36);
INSERT INTO `store_variation` VALUES (317, 'color', 'gold', 1, '2023-12-19 14:11:42.119082', 36);
INSERT INTO `store_variation` VALUES (318, 'size', 'M', 1, '2023-12-19 14:11:57.336097', 36);
INSERT INTO `store_variation` VALUES (319, 'size', 'L', 1, '2023-12-19 14:12:16.110491', 36);
INSERT INTO `store_variation` VALUES (320, 'size', 'XL', 1, '2023-12-19 14:12:26.112336', 36);
INSERT INTO `store_variation` VALUES (321, 'size', 'XXL', 1, '2023-12-19 14:12:35.822135', 36);
INSERT INTO `store_variation` VALUES (322, 'color', 'black', 1, '2023-12-19 14:12:54.823275', 37);
INSERT INTO `store_variation` VALUES (323, 'color', 'white', 1, '2023-12-19 14:13:12.613461', 37);
INSERT INTO `store_variation` VALUES (324, 'color', 'gray', 1, '2023-12-19 14:13:25.116094', 37);
INSERT INTO `store_variation` VALUES (325, 'color', 'gold', 1, '2023-12-19 14:13:37.078053', 37);
INSERT INTO `store_variation` VALUES (326, 'color', 'red', 1, '2023-12-19 14:13:58.415390', 37);
INSERT INTO `store_variation` VALUES (327, 'size', 'M', 1, '2023-12-19 14:14:09.419491', 37);
INSERT INTO `store_variation` VALUES (328, 'size', 'L', 1, '2023-12-19 14:14:35.663410', 37);
INSERT INTO `store_variation` VALUES (329, 'size', 'XL', 1, '2023-12-19 14:14:46.256337', 37);
INSERT INTO `store_variation` VALUES (330, 'size', 'XXL', 1, '2023-12-19 14:14:57.522147', 37);
INSERT INTO `store_variation` VALUES (331, 'color', 'black', 1, '2023-12-19 14:15:12.050681', 38);
INSERT INTO `store_variation` VALUES (332, 'color', 'white', 1, '2023-12-19 14:15:25.265534', 38);
INSERT INTO `store_variation` VALUES (333, 'size', 'gray', 1, '2023-12-19 14:15:39.677551', 38);
INSERT INTO `store_variation` VALUES (334, 'color', 'gold', 1, '2023-12-19 14:15:57.376090', 38);
INSERT INTO `store_variation` VALUES (335, 'color', 'red', 1, '2023-12-19 14:16:17.983823', 38);
INSERT INTO `store_variation` VALUES (336, 'size', 'M', 1, '2023-12-19 14:16:30.860312', 38);
INSERT INTO `store_variation` VALUES (337, 'size', 'L', 1, '2023-12-19 14:16:45.407678', 38);
INSERT INTO `store_variation` VALUES (338, 'size', 'XL', 1, '2023-12-19 14:16:56.319961', 38);
INSERT INTO `store_variation` VALUES (339, 'size', 'XXL', 1, '2023-12-19 14:17:18.598916', 38);
INSERT INTO `store_variation` VALUES (340, 'color', 'black', 1, '2023-12-19 14:17:33.162350', 39);
INSERT INTO `store_variation` VALUES (341, 'color', 'white', 1, '2023-12-19 14:17:43.757423', 39);
INSERT INTO `store_variation` VALUES (342, 'color', 'gray', 1, '2023-12-19 14:17:58.523885', 39);
INSERT INTO `store_variation` VALUES (343, 'color', 'gold', 1, '2023-12-19 14:18:29.744399', 39);
INSERT INTO `store_variation` VALUES (344, 'color', 'red', 1, '2023-12-19 14:18:38.897840', 39);
INSERT INTO `store_variation` VALUES (345, 'size', 'M', 1, '2023-12-19 14:19:03.529559', 39);
INSERT INTO `store_variation` VALUES (346, 'size', 'L', 1, '2023-12-19 14:19:20.078250', 39);
INSERT INTO `store_variation` VALUES (347, 'size', 'XL', 1, '2023-12-19 14:19:32.732345', 39);
INSERT INTO `store_variation` VALUES (348, 'size', 'XXL', 1, '2023-12-19 14:19:42.393551', 39);
INSERT INTO `store_variation` VALUES (349, 'color', 'black', 1, '2023-12-19 14:19:52.357945', 40);
INSERT INTO `store_variation` VALUES (350, 'color', 'white', 1, '2023-12-19 14:20:02.206862', 40);
INSERT INTO `store_variation` VALUES (351, 'color', 'gray', 1, '2023-12-19 14:20:14.451784', 40);
INSERT INTO `store_variation` VALUES (352, 'color', 'gold', 1, '2023-12-19 14:20:32.598912', 40);
INSERT INTO `store_variation` VALUES (353, 'color', 'red', 1, '2023-12-19 14:20:46.185288', 40);
INSERT INTO `store_variation` VALUES (354, 'size', 'M', 1, '2023-12-19 14:22:05.111734', 40);
INSERT INTO `store_variation` VALUES (355, 'size', 'L', 1, '2023-12-19 14:22:20.267816', 40);
INSERT INTO `store_variation` VALUES (356, 'size', 'XL', 1, '2023-12-19 14:25:13.413623', 40);
INSERT INTO `store_variation` VALUES (357, 'size', 'XXL', 1, '2023-12-19 14:25:34.848426', 40);
INSERT INTO `store_variation` VALUES (358, 'color', 'black', 1, '2023-12-19 14:28:10.791632', 41);
INSERT INTO `store_variation` VALUES (359, 'color', 'white', 1, '2023-12-19 14:28:22.590609', 41);
INSERT INTO `store_variation` VALUES (360, 'color', 'gray', 1, '2023-12-19 14:28:54.003157', 41);
INSERT INTO `store_variation` VALUES (361, 'color', 'gold', 1, '2023-12-19 14:29:14.361584', 41);
INSERT INTO `store_variation` VALUES (362, 'color', 'red', 1, '2023-12-19 14:29:26.990051', 41);
INSERT INTO `store_variation` VALUES (363, 'size', 'M', 1, '2023-12-19 14:29:37.242052', 41);
INSERT INTO `store_variation` VALUES (364, 'size', 'L', 1, '2023-12-19 14:29:54.237166', 41);
INSERT INTO `store_variation` VALUES (365, 'size', 'XL', 1, '2023-12-19 14:30:08.952676', 41);
INSERT INTO `store_variation` VALUES (366, 'size', 'XXL', 1, '2023-12-19 14:30:20.650837', 41);
INSERT INTO `store_variation` VALUES (367, 'color', 'black', 1, '2023-12-19 14:30:31.708351', 42);
INSERT INTO `store_variation` VALUES (368, 'color', 'white', 1, '2023-12-19 14:30:45.915592', 42);
INSERT INTO `store_variation` VALUES (369, 'color', 'gray', 1, '2023-12-19 14:31:24.765787', 42);
INSERT INTO `store_variation` VALUES (370, 'color', 'red', 1, '2023-12-19 14:31:39.335889', 42);
INSERT INTO `store_variation` VALUES (371, 'size', 'M', 1, '2023-12-19 14:31:52.632534', 42);
INSERT INTO `store_variation` VALUES (372, 'size', 'L', 1, '2023-12-19 14:32:06.953741', 42);
INSERT INTO `store_variation` VALUES (373, 'size', 'XL', 1, '2023-12-19 14:32:23.617289', 42);
INSERT INTO `store_variation` VALUES (374, 'size', 'XXL', 1, '2023-12-19 14:32:45.222362', 42);
INSERT INTO `store_variation` VALUES (375, 'color', 'black', 1, '2023-12-19 14:33:03.302158', 43);
INSERT INTO `store_variation` VALUES (376, 'color', 'white', 1, '2023-12-19 14:33:13.808205', 43);
INSERT INTO `store_variation` VALUES (377, 'color', 'gray', 1, '2023-12-19 14:33:25.926651', 43);
INSERT INTO `store_variation` VALUES (378, 'color', 'gold', 1, '2023-12-19 14:33:45.092931', 43);
INSERT INTO `store_variation` VALUES (379, 'color', 'red', 1, '2023-12-19 14:34:02.759316', 43);
INSERT INTO `store_variation` VALUES (380, 'size', 'M', 1, '2023-12-19 14:34:23.164749', 43);
INSERT INTO `store_variation` VALUES (381, 'size', 'L', 1, '2023-12-19 14:34:34.013323', 43);
INSERT INTO `store_variation` VALUES (382, 'size', 'XL', 1, '2023-12-19 14:34:53.712941', 43);
INSERT INTO `store_variation` VALUES (383, 'size', 'XXL', 1, '2023-12-19 14:35:07.609930', 43);
INSERT INTO `store_variation` VALUES (384, 'color', 'black', 1, '2023-12-19 14:35:29.674540', 44);
INSERT INTO `store_variation` VALUES (385, 'color', 'white', 1, '2023-12-19 14:35:50.093109', 44);
INSERT INTO `store_variation` VALUES (386, 'color', 'gray', 1, '2023-12-19 14:36:11.570517', 44);
INSERT INTO `store_variation` VALUES (387, 'color', 'gold', 1, '2023-12-19 14:36:31.236073', 44);
INSERT INTO `store_variation` VALUES (388, 'color', 'red', 1, '2023-12-19 14:36:43.531008', 44);
INSERT INTO `store_variation` VALUES (389, 'size', 'M', 1, '2023-12-19 14:36:59.881484', 44);
INSERT INTO `store_variation` VALUES (390, 'size', 'L', 1, '2023-12-19 14:37:12.056618', 44);
INSERT INTO `store_variation` VALUES (391, 'size', 'XL', 1, '2023-12-19 14:37:31.153589', 44);
INSERT INTO `store_variation` VALUES (392, 'size', 'XXL', 1, '2023-12-19 14:37:44.014338', 44);
INSERT INTO `store_variation` VALUES (393, 'color', 'black', 1, '2023-12-19 14:38:53.601576', 45);
INSERT INTO `store_variation` VALUES (394, 'color', 'white', 1, '2023-12-19 14:39:09.801299', 45);
INSERT INTO `store_variation` VALUES (395, 'color', 'gray', 1, '2023-12-19 14:39:25.020922', 45);
INSERT INTO `store_variation` VALUES (396, 'color', 'red', 1, '2023-12-19 14:39:36.569451', 45);
INSERT INTO `store_variation` VALUES (397, 'size', 'M', 1, '2023-12-19 14:40:11.549777', 45);
INSERT INTO `store_variation` VALUES (398, 'size', 'L', 1, '2023-12-19 14:40:29.085771', 45);
INSERT INTO `store_variation` VALUES (399, 'size', 'XL', 1, '2023-12-19 14:40:42.282846', 45);
INSERT INTO `store_variation` VALUES (400, 'size', 'XXL', 1, '2023-12-19 14:40:57.099556', 45);
INSERT INTO `store_variation` VALUES (401, 'color', 'black', 1, '2023-12-19 14:41:40.559826', 46);
INSERT INTO `store_variation` VALUES (402, 'color', 'white', 1, '2023-12-19 14:41:50.466627', 46);
INSERT INTO `store_variation` VALUES (403, 'color', 'gray', 1, '2023-12-19 14:48:31.298556', 46);
INSERT INTO `store_variation` VALUES (404, 'color', 'gold', 1, '2023-12-19 14:48:46.516204', 46);
INSERT INTO `store_variation` VALUES (405, 'color', 'red', 1, '2023-12-19 14:49:15.111638', 46);
INSERT INTO `store_variation` VALUES (406, 'size', 'M', 1, '2023-12-19 15:33:31.079635', 46);
INSERT INTO `store_variation` VALUES (407, 'size', 'L', 1, '2023-12-19 15:22:13.560489', 46);
INSERT INTO `store_variation` VALUES (408, 'size', 'XL', 1, '2023-12-19 15:22:32.011991', 46);
INSERT INTO `store_variation` VALUES (409, 'size', 'XXL', 1, '2023-12-19 15:22:43.837030', 46);
INSERT INTO `store_variation` VALUES (410, 'color', 'black', 1, '2023-12-19 15:23:21.071421', 47);
INSERT INTO `store_variation` VALUES (411, 'color', 'white', 1, '2023-12-19 15:23:31.872624', 47);
INSERT INTO `store_variation` VALUES (412, 'color', 'gray', 1, '2023-12-19 15:23:45.740544', 47);
INSERT INTO `store_variation` VALUES (413, 'color', 'gold', 1, '2023-12-19 15:24:17.079341', 47);
INSERT INTO `store_variation` VALUES (414, 'color', 'red', 1, '2023-12-19 15:24:34.749331', 47);
INSERT INTO `store_variation` VALUES (415, 'size', 'M', 1, '2023-12-19 15:24:46.758047', 47);
INSERT INTO `store_variation` VALUES (416, 'size', 'L', 1, '2023-12-19 15:24:57.192557', 47);
INSERT INTO `store_variation` VALUES (417, 'size', 'XL', 1, '2023-12-19 15:25:09.947093', 47);
INSERT INTO `store_variation` VALUES (418, 'size', 'XXL', 1, '2023-12-19 15:25:24.165378', 47);
INSERT INTO `store_variation` VALUES (419, 'color', 'black', 1, '2023-12-19 15:25:47.346329', 48);
INSERT INTO `store_variation` VALUES (420, 'color', 'white', 1, '2023-12-19 15:26:06.616506', 48);
INSERT INTO `store_variation` VALUES (421, 'color', 'gray', 1, '2023-12-19 15:26:17.481363', 48);
INSERT INTO `store_variation` VALUES (422, 'color', 'gold', 1, '2023-12-19 15:26:36.469334', 48);
INSERT INTO `store_variation` VALUES (423, 'color', 'red', 1, '2023-12-19 15:27:24.475485', 48);
INSERT INTO `store_variation` VALUES (424, 'size', 'M', 1, '2023-12-19 15:27:38.221048', 48);
INSERT INTO `store_variation` VALUES (425, 'size', 'L', 1, '2023-12-19 15:27:59.582830', 48);
INSERT INTO `store_variation` VALUES (426, 'size', 'XL', 1, '2023-12-19 15:28:13.793296', 48);
INSERT INTO `store_variation` VALUES (427, 'size', 'XXL', 1, '2023-12-19 15:28:24.446178', 48);
INSERT INTO `store_variation` VALUES (428, 'color', 'black', 1, '2023-12-19 15:28:43.804665', 49);
INSERT INTO `store_variation` VALUES (429, 'color', 'white', 1, '2023-12-19 15:28:58.349389', 49);
INSERT INTO `store_variation` VALUES (430, 'color', 'gray', 1, '2023-12-19 15:29:11.314108', 49);
INSERT INTO `store_variation` VALUES (431, 'color', 'gold', 1, '2023-12-19 15:34:01.939432', 49);
INSERT INTO `store_variation` VALUES (432, 'color', 'red', 1, '2023-12-19 15:30:00.543952', 49);
INSERT INTO `store_variation` VALUES (433, 'size', 'M', 1, '2023-12-19 15:30:16.794698', 49);
INSERT INTO `store_variation` VALUES (434, 'size', 'L', 1, '2023-12-19 15:30:30.442313', 49);
INSERT INTO `store_variation` VALUES (435, 'size', 'XL', 1, '2023-12-19 15:30:54.245088', 49);
INSERT INTO `store_variation` VALUES (436, 'size', 'XXL', 1, '2023-12-19 15:31:07.737623', 49);
INSERT INTO `store_variation` VALUES (437, 'color', 'black', 1, '2023-12-19 15:32:59.448075', 50);
INSERT INTO `store_variation` VALUES (438, 'color', 'white', 1, '2023-12-19 15:41:37.098275', 50);
INSERT INTO `store_variation` VALUES (439, 'color', 'gray', 1, '2023-12-19 15:42:30.468638', 50);
INSERT INTO `store_variation` VALUES (440, 'color', 'gold', 1, '2023-12-19 15:42:50.312971', 50);
INSERT INTO `store_variation` VALUES (441, 'color', 'red', 1, '2023-12-19 15:43:10.091704', 50);
INSERT INTO `store_variation` VALUES (442, 'size', 'M', 1, '2023-12-19 15:43:44.366011', 50);
INSERT INTO `store_variation` VALUES (443, 'size', 'L', 1, '2023-12-19 15:44:08.816313', 50);
INSERT INTO `store_variation` VALUES (444, 'size', 'XL', 1, '2023-12-19 15:44:24.301787', 50);
INSERT INTO `store_variation` VALUES (445, 'size', 'XXL', 1, '2023-12-19 15:44:36.402910', 50);
INSERT INTO `store_variation` VALUES (446, 'color', 'black', 1, '2023-12-19 15:44:50.236418', 51);
INSERT INTO `store_variation` VALUES (447, 'color', 'white', 1, '2023-12-19 15:45:26.968941', 51);
INSERT INTO `store_variation` VALUES (448, 'color', 'gray', 1, '2023-12-19 15:45:41.234608', 51);
INSERT INTO `store_variation` VALUES (449, 'color', 'gold', 1, '2023-12-19 15:45:53.463966', 51);
INSERT INTO `store_variation` VALUES (450, 'color', 'red', 1, '2023-12-19 15:46:07.895754', 51);
INSERT INTO `store_variation` VALUES (451, 'size', 'M', 1, '2023-12-19 17:14:10.282368', 51);
INSERT INTO `store_variation` VALUES (452, 'size', 'L', 1, '2023-12-19 15:47:28.991578', 51);
INSERT INTO `store_variation` VALUES (453, 'size', 'XL', 1, '2023-12-19 15:47:39.397922', 51);
INSERT INTO `store_variation` VALUES (454, 'size', 'XXL', 1, '2023-12-19 15:48:14.610912', 51);
INSERT INTO `store_variation` VALUES (455, 'color', 'black', 1, '2023-12-19 15:50:31.958648', 52);
INSERT INTO `store_variation` VALUES (456, 'color', 'white', 1, '2023-12-19 15:50:44.572993', 52);
INSERT INTO `store_variation` VALUES (457, 'color', 'gray', 1, '2023-12-19 15:51:11.998188', 52);
INSERT INTO `store_variation` VALUES (458, 'color', 'gold', 1, '2023-12-19 15:51:26.830951', 52);
INSERT INTO `store_variation` VALUES (459, 'color', 'red', 1, '2023-12-19 15:52:03.196807', 52);
INSERT INTO `store_variation` VALUES (460, 'size', 'M', 1, '2023-12-19 15:52:13.106575', 52);
INSERT INTO `store_variation` VALUES (461, 'size', 'L', 1, '2023-12-19 15:52:25.692312', 52);
INSERT INTO `store_variation` VALUES (462, 'size', 'XL', 1, '2023-12-19 15:52:47.157248', 52);
INSERT INTO `store_variation` VALUES (463, 'size', 'XXL', 1, '2023-12-19 15:52:59.183838', 52);
INSERT INTO `store_variation` VALUES (464, 'color', 'black', 1, '2023-12-19 15:53:18.090267', 53);
INSERT INTO `store_variation` VALUES (465, 'color', 'white', 1, '2023-12-19 15:53:32.584588', 53);
INSERT INTO `store_variation` VALUES (466, 'color', 'gray', 1, '2023-12-19 15:53:44.942148', 53);
INSERT INTO `store_variation` VALUES (467, 'color', 'gold', 1, '2023-12-19 15:54:04.966113', 53);
INSERT INTO `store_variation` VALUES (468, 'color', 'red', 1, '2023-12-19 15:54:27.966679', 53);
INSERT INTO `store_variation` VALUES (469, 'size', 'M', 1, '2023-12-19 15:55:32.466791', 53);
INSERT INTO `store_variation` VALUES (470, 'size', 'L', 1, '2023-12-19 15:55:44.791871', 53);
INSERT INTO `store_variation` VALUES (471, 'size', 'XL', 1, '2023-12-19 15:56:00.077916', 53);
INSERT INTO `store_variation` VALUES (472, 'size', 'XXL', 1, '2023-12-19 15:56:44.837077', 53);
INSERT INTO `store_variation` VALUES (473, 'color', 'black', 1, '2023-12-19 15:57:12.120037', 54);
INSERT INTO `store_variation` VALUES (474, 'color', 'white', 1, '2023-12-19 15:57:25.335621', 54);
INSERT INTO `store_variation` VALUES (475, 'color', 'gray', 1, '2023-12-19 16:06:11.494538', 54);
INSERT INTO `store_variation` VALUES (476, 'color', 'gold', 1, '2023-12-19 16:06:49.255935', 54);
INSERT INTO `store_variation` VALUES (477, 'color', 'red', 1, '2023-12-19 16:47:32.014974', 54);
INSERT INTO `store_variation` VALUES (478, 'size', 'M', 1, '2023-12-19 16:47:58.913515', 54);
INSERT INTO `store_variation` VALUES (479, 'size', 'L', 1, '2023-12-19 16:48:16.358213', 54);
INSERT INTO `store_variation` VALUES (480, 'size', 'XL', 1, '2023-12-19 16:48:38.537171', 54);
INSERT INTO `store_variation` VALUES (481, 'size', 'XXL', 1, '2023-12-19 16:48:56.134681', 54);
INSERT INTO `store_variation` VALUES (482, 'color', 'black', 1, '2023-12-19 16:49:21.322798', 55);
INSERT INTO `store_variation` VALUES (483, 'color', 'white', 1, '2023-12-19 16:50:07.023558', 55);
INSERT INTO `store_variation` VALUES (484, 'color', 'gray', 1, '2023-12-19 16:50:19.701600', 55);
INSERT INTO `store_variation` VALUES (485, 'color', 'gold', 1, '2023-12-19 16:50:47.090803', 55);
INSERT INTO `store_variation` VALUES (486, 'color', 'red', 1, '2023-12-19 16:51:01.752860', 55);
INSERT INTO `store_variation` VALUES (487, 'size', 'M', 1, '2023-12-19 16:52:29.053538', 55);
INSERT INTO `store_variation` VALUES (488, 'size', 'L', 1, '2023-12-19 16:52:42.353513', 55);
INSERT INTO `store_variation` VALUES (489, 'size', 'XL', 1, '2023-12-19 16:52:56.963698', 55);
INSERT INTO `store_variation` VALUES (490, 'size', 'XXL', 1, '2023-12-19 16:53:15.638599', 55);
INSERT INTO `store_variation` VALUES (491, 'color', 'black', 1, '2023-12-19 16:54:07.312555', 56);
INSERT INTO `store_variation` VALUES (492, 'color', 'white', 1, '2023-12-19 16:54:30.906963', 56);
INSERT INTO `store_variation` VALUES (493, 'color', 'gray', 1, '2023-12-19 16:55:05.946779', 56);
INSERT INTO `store_variation` VALUES (494, 'color', 'gold', 1, '2023-12-19 16:56:03.954034', 56);
INSERT INTO `store_variation` VALUES (495, 'color', 'red', 1, '2023-12-19 16:57:16.135175', 56);
INSERT INTO `store_variation` VALUES (496, 'size', 'M', 1, '2023-12-19 16:57:55.361825', 56);
INSERT INTO `store_variation` VALUES (497, 'size', 'L', 1, '2023-12-19 16:59:09.755911', 56);
INSERT INTO `store_variation` VALUES (498, 'color', 'XL', 1, '2023-12-19 17:00:01.219640', 56);
INSERT INTO `store_variation` VALUES (499, 'size', 'XXL', 1, '2023-12-19 17:00:29.366702', 56);
INSERT INTO `store_variation` VALUES (500, 'color', 'black', 1, '2023-12-19 17:02:23.071143', 57);
INSERT INTO `store_variation` VALUES (501, 'color', 'white', 1, '2023-12-19 17:02:40.280683', 57);
INSERT INTO `store_variation` VALUES (502, 'color', 'gray', 1, '2023-12-19 17:03:40.762849', 57);
INSERT INTO `store_variation` VALUES (503, 'color', 'gold', 1, '2023-12-19 17:03:55.639805', 57);
INSERT INTO `store_variation` VALUES (504, 'color', 'red', 1, '2023-12-19 17:04:15.299034', 57);
INSERT INTO `store_variation` VALUES (505, 'size', 'M', 1, '2023-12-19 17:04:27.900426', 57);
INSERT INTO `store_variation` VALUES (506, 'size', 'L', 1, '2023-12-19 17:09:06.340459', 57);
INSERT INTO `store_variation` VALUES (507, 'size', 'XL', 1, '2023-12-19 17:09:27.206060', 57);
INSERT INTO `store_variation` VALUES (508, 'size', 'XXL', 1, '2023-12-19 17:09:50.488266', 57);
INSERT INTO `store_variation` VALUES (509, 'color', 'black', 1, '2023-12-19 17:10:08.647015', 58);
INSERT INTO `store_variation` VALUES (510, 'color', 'white', 1, '2023-12-19 17:10:43.880030', 58);
INSERT INTO `store_variation` VALUES (511, 'color', 'gray', 1, '2023-12-19 17:12:24.674812', 58);
INSERT INTO `store_variation` VALUES (512, 'color', 'gold', 1, '2023-12-19 17:13:02.045859', 58);
INSERT INTO `store_variation` VALUES (513, 'size', 'M', 1, '2023-12-19 17:15:09.777677', 58);
INSERT INTO `store_variation` VALUES (514, 'size', 'L', 1, '2023-12-19 17:15:29.167907', 58);
INSERT INTO `store_variation` VALUES (515, 'size', 'XL', 1, '2023-12-19 17:15:53.291471', 58);
INSERT INTO `store_variation` VALUES (516, 'color', 'XXL', 1, '2023-12-19 17:16:30.042225', 58);
INSERT INTO `store_variation` VALUES (517, 'color', 'black', 1, '2023-12-19 17:16:55.106051', 59);
INSERT INTO `store_variation` VALUES (518, 'color', 'white', 1, '2023-12-19 17:17:29.694096', 59);
INSERT INTO `store_variation` VALUES (519, 'color', 'gray', 1, '2023-12-19 17:17:43.096107', 59);
INSERT INTO `store_variation` VALUES (520, 'color', 'gold', 1, '2023-12-19 17:18:00.803860', 59);
INSERT INTO `store_variation` VALUES (521, 'color', 'red', 1, '2023-12-19 17:18:17.750409', 59);
INSERT INTO `store_variation` VALUES (522, 'size', 'M', 1, '2023-12-19 17:18:35.167004', 59);
INSERT INTO `store_variation` VALUES (523, 'size', 'L', 1, '2023-12-19 17:18:46.544731', 59);
INSERT INTO `store_variation` VALUES (524, 'size', 'XL', 1, '2023-12-19 17:19:05.437798', 59);
INSERT INTO `store_variation` VALUES (525, 'size', 'XXL', 1, '2023-12-19 17:19:18.319848', 59);
INSERT INTO `store_variation` VALUES (526, 'color', 'black', 1, '2023-12-19 17:48:27.884353', 60);
INSERT INTO `store_variation` VALUES (527, 'color', 'white', 1, '2023-12-19 17:48:58.451884', 60);
INSERT INTO `store_variation` VALUES (528, 'color', 'gray', 1, '2023-12-19 17:49:20.643263', 60);
INSERT INTO `store_variation` VALUES (529, 'color', 'gold', 1, '2023-12-19 17:49:49.863316', 60);
INSERT INTO `store_variation` VALUES (530, 'color', 'red', 1, '2023-12-19 17:50:11.815320', 60);
INSERT INTO `store_variation` VALUES (531, 'size', 'M', 1, '2023-12-19 17:50:29.441117', 60);
INSERT INTO `store_variation` VALUES (532, 'size', 'L', 1, '2023-12-19 17:50:49.078206', 60);
INSERT INTO `store_variation` VALUES (533, 'size', 'XL', 1, '2023-12-19 17:51:06.084326', 60);
INSERT INTO `store_variation` VALUES (534, 'size', 'XXL', 1, '2023-12-19 17:51:24.114035', 60);
INSERT INTO `store_variation` VALUES (535, 'color', 'black', 1, '2023-12-19 17:51:50.223974', 61);
INSERT INTO `store_variation` VALUES (536, 'color', 'white', 1, '2023-12-19 17:52:09.562574', 61);
INSERT INTO `store_variation` VALUES (537, 'color', 'gray', 1, '2023-12-19 17:52:25.705954', 61);
INSERT INTO `store_variation` VALUES (538, 'color', 'gold', 1, '2023-12-19 17:52:48.970650', 61);
INSERT INTO `store_variation` VALUES (539, 'size', 'M', 1, '2023-12-19 17:53:00.531389', 61);
INSERT INTO `store_variation` VALUES (540, 'size', 'L', 1, '2023-12-19 17:53:15.392693', 61);
INSERT INTO `store_variation` VALUES (541, 'size', 'XL', 1, '2023-12-19 17:53:40.870118', 61);
INSERT INTO `store_variation` VALUES (542, 'size', 'XXL', 1, '2023-12-19 17:53:55.086417', 61);
INSERT INTO `store_variation` VALUES (543, 'color', 'black', 1, '2023-12-19 17:54:17.505182', 62);
INSERT INTO `store_variation` VALUES (544, 'color', 'white', 1, '2023-12-19 17:55:04.337534', 62);
INSERT INTO `store_variation` VALUES (545, 'color', 'gray', 1, '2023-12-19 17:55:19.957470', 62);
INSERT INTO `store_variation` VALUES (546, 'color', 'gold', 1, '2023-12-19 17:55:35.194744', 62);
INSERT INTO `store_variation` VALUES (547, 'size', 'M', 1, '2023-12-19 17:56:00.385049', 62);
INSERT INTO `store_variation` VALUES (548, 'size', 'L', 1, '2023-12-19 17:56:31.413243', 62);
INSERT INTO `store_variation` VALUES (549, 'size', 'XL', 1, '2023-12-19 17:56:52.004284', 62);
INSERT INTO `store_variation` VALUES (550, 'size', 'XXL', 1, '2023-12-19 17:57:22.435041', 62);
INSERT INTO `store_variation` VALUES (551, 'color', 'black', 1, '2023-12-19 17:57:57.077748', 63);
INSERT INTO `store_variation` VALUES (552, 'color', 'white', 1, '2023-12-19 17:58:11.381627', 63);
INSERT INTO `store_variation` VALUES (553, 'color', 'gray', 1, '2023-12-19 17:58:40.785691', 63);
INSERT INTO `store_variation` VALUES (554, 'color', 'gold', 1, '2023-12-19 17:58:57.682985', 63);
INSERT INTO `store_variation` VALUES (555, 'color', 'red', 1, '2023-12-19 17:59:12.742398', 63);
INSERT INTO `store_variation` VALUES (556, 'size', 'M', 1, '2023-12-19 17:59:31.977260', 63);
INSERT INTO `store_variation` VALUES (557, 'color', 'L', 1, '2023-12-19 18:00:06.024403', 63);
INSERT INTO `store_variation` VALUES (558, 'size', 'XL', 1, '2023-12-19 18:00:23.680565', 63);
INSERT INTO `store_variation` VALUES (559, 'size', 'XXL', 1, '2023-12-19 18:01:02.658715', 63);
INSERT INTO `store_variation` VALUES (560, 'color', 'black', 1, '2023-12-19 18:01:27.301050', 64);
INSERT INTO `store_variation` VALUES (561, 'color', 'white', 1, '2023-12-19 18:01:41.710735', 64);
INSERT INTO `store_variation` VALUES (562, 'color', 'gray', 1, '2023-12-19 18:02:05.050398', 64);
INSERT INTO `store_variation` VALUES (563, 'color', 'gold', 1, '2023-12-19 18:02:19.758895', 64);
INSERT INTO `store_variation` VALUES (564, 'color', 'red', 1, '2023-12-19 18:02:39.447810', 64);
INSERT INTO `store_variation` VALUES (565, 'size', 'M', 1, '2023-12-19 18:02:52.456200', 64);
INSERT INTO `store_variation` VALUES (566, 'size', 'L', 1, '2023-12-19 18:03:31.570115', 64);
INSERT INTO `store_variation` VALUES (567, 'size', 'XL', 1, '2023-12-19 18:03:57.067235', 64);
INSERT INTO `store_variation` VALUES (568, 'size', 'XXL', 1, '2023-12-19 18:04:32.518572', 64);

SET FOREIGN_KEY_CHECKS = 1;
