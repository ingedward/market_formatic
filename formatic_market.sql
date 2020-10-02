/*
MySQL Data Transfer
Source Host: localhost
Source Database: formatic_market
Target Host: localhost
Target Database: formatic_market
Date: 02/10/2020 10:36:38
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for active_pages
-- ----------------------------
DROP TABLE IF EXISTS `active_pages`;
CREATE TABLE `active_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bank_accounts
-- ----------------------------
DROP TABLE IF EXISTS `bank_accounts`;
CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `iban` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `bic` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for blog_posts
-- ----------------------------
DROP TABLE IF EXISTS `blog_posts`;
CREATE TABLE `blog_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `time` int(10) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for blog_translations
-- ----------------------------
DROP TABLE IF EXISTS `blog_translations`;
CREATE TABLE `blog_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `for_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for confirm_links
-- ----------------------------
DROP TABLE IF EXISTS `confirm_links`;
CREATE TABLE `confirm_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` char(32) NOT NULL,
  `for_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cookie_law
-- ----------------------------
DROP TABLE IF EXISTS `cookie_law`;
CREATE TABLE `cookie_law` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link` varchar(255) NOT NULL,
  `theme` varchar(20) NOT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cookie_law_translations
-- ----------------------------
DROP TABLE IF EXISTS `cookie_law_translations`;
CREATE TABLE `cookie_law_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `button_text` varchar(50) NOT NULL,
  `learn_more` varchar(50) NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `for_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`abbr`,`for_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for discount_codes
-- ----------------------------
DROP TABLE IF EXISTS `discount_codes`;
CREATE TABLE `discount_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `code` varchar(10) NOT NULL,
  `amount` varchar(20) NOT NULL,
  `valid_from_date` int(10) unsigned NOT NULL,
  `valid_to_date` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-enabled, 0-disabled',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity` varchar(255) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for keys
-- ----------------------------
DROP TABLE IF EXISTS `keys`;
CREATE TABLE `keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for languages
-- ----------------------------
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `abbr` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `currencyKey` varchar(5) NOT NULL,
  `flag` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'point to public_users ID',
  `products` text NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `referrer` varchar(255) NOT NULL,
  `clean_referrer` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `paypal_status` varchar(10) DEFAULT NULL,
  `payu_status` int(11) NOT NULL,
  `payu_method_name` varchar(50) NOT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'viewed status is change when change processed status',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders_clients
-- ----------------------------
DROP TABLE IF EXISTS `orders_clients`;
CREATE TABLE `orders_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` text,
  `city` varchar(20) DEFAULT NULL,
  `post_code` varchar(10) DEFAULT NULL,
  `notes` text NOT NULL,
  `for_id` int(11) NOT NULL,
  `document_type` varchar(30) DEFAULT NULL,
  `document_number` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder` int(10) unsigned DEFAULT NULL COMMENT 'folder with images',
  `image` varchar(255) NOT NULL,
  `time` int(10) unsigned NOT NULL COMMENT 'time created',
  `time_update` int(10) unsigned NOT NULL COMMENT 'time updated',
  `visibility` tinyint(1) NOT NULL DEFAULT '1',
  `shop_categorie` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `procurement` int(10) unsigned NOT NULL,
  `in_slider` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `virtual_products` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` int(5) DEFAULT NULL,
  `position` int(10) unsigned NOT NULL,
  `vendor_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for products_translations
-- ----------------------------
DROP TABLE IF EXISTS `products_translations`;
CREATE TABLE `products_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `basic_description` text NOT NULL,
  `price` varchar(20) NOT NULL,
  `old_price` varchar(20) NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `for_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for seo_pages
-- ----------------------------
DROP TABLE IF EXISTS `seo_pages`;
CREATE TABLE `seo_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for seo_pages_translations
-- ----------------------------
DROP TABLE IF EXISTS `seo_pages_translations`;
CREATE TABLE `seo_pages_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `page_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop_categories
-- ----------------------------
DROP TABLE IF EXISTS `shop_categories`;
CREATE TABLE `shop_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sub_for` int(11) NOT NULL,
  `position` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop_categories_translations
-- ----------------------------
DROP TABLE IF EXISTS `shop_categories_translations`;
CREATE TABLE `shop_categories_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `for_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for subscribed
-- ----------------------------
DROP TABLE IF EXISTS `subscribed`;
CREATE TABLE `subscribed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for textual_pages_tanslations
-- ----------------------------
DROP TABLE IF EXISTS `textual_pages_tanslations`;
CREATE TABLE `textual_pages_tanslations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `for_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'notifications by email',
  `last_login` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users_public
-- ----------------------------
DROP TABLE IF EXISTS `users_public`;
CREATE TABLE `users_public` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for value_store
-- ----------------------------
DROP TABLE IF EXISTS `value_store`;
CREATE TABLE `value_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thekey` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key` (`thekey`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vendors
-- ----------------------------
DROP TABLE IF EXISTS `vendors`;
CREATE TABLE `vendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`email`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vendors_orders
-- ----------------------------
DROP TABLE IF EXISTS `vendors_orders`;
CREATE TABLE `vendors_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `products` text NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `referrer` varchar(255) NOT NULL,
  `clean_referrer` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `paypal_status` varchar(10) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` tinyint(1) NOT NULL DEFAULT '0',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_code` varchar(20) NOT NULL,
  `vendor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vendors_orders_clients
-- ----------------------------
DROP TABLE IF EXISTS `vendors_orders_clients`;
CREATE TABLE `vendors_orders_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(20) NOT NULL,
  `post_code` varchar(10) NOT NULL,
  `notes` text NOT NULL,
  `for_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `active_pages` VALUES ('1', 'blog', '1');
INSERT INTO `blog_posts` VALUES ('1', 'ofima-erp.png', 'SaaS_1', '1596236645');
INSERT INTO `blog_translations` VALUES ('1', 'SaaS', '<p>SaaS</p>\r\n', 'en', '1');
INSERT INTO `blog_translations` VALUES ('2', 'SaaS', '<p>SaaS</p>\r\n', 'es', '1');
INSERT INTO `confirm_links` VALUES ('1', 'e80d60ac60787552610c9a36c95a4bfe', '1234');
INSERT INTO `confirm_links` VALUES ('2', '0f8911b332402e82cda39f09e9d1b4f1', '1234');
INSERT INTO `confirm_links` VALUES ('3', '5bf1c86973a28d8b14fe82b275d58787', '1235');
INSERT INTO `confirm_links` VALUES ('4', '52526a7def3e32990508992cf0563e4c', '1236');
INSERT INTO `confirm_links` VALUES ('5', '26fa720465baf1a021307c2dfcc7656f', '1240');
INSERT INTO `confirm_links` VALUES ('6', '7f0d2d094837401776965508f63cf3d9', '1241');
INSERT INTO `confirm_links` VALUES ('7', '48f8b0e331a6c3f1d9ef288385705ddc', '1242');
INSERT INTO `confirm_links` VALUES ('8', 'e7a08548590086cf89d7046efc7990e3', '1243');
INSERT INTO `confirm_links` VALUES ('9', '8c6558c802d180d9110f2ca4ccb761cd', '1244');
INSERT INTO `confirm_links` VALUES ('10', '4c02f58ac9d3c5ec386453fa51e06862', '1245');
INSERT INTO `confirm_links` VALUES ('11', '0db63f5ed2fd275f4c4b9aa9c75dd0f4', '1246');
INSERT INTO `confirm_links` VALUES ('12', 'ae8d8318a1b64bda26600e82f7887174', '1247');
INSERT INTO `confirm_links` VALUES ('13', '12577c7e0c95e6da34c637ec19c23ddd', '1248');
INSERT INTO `confirm_links` VALUES ('14', '2eb8d3f514f437f5889f34c7ea8d2a22', '1249');
INSERT INTO `confirm_links` VALUES ('15', '9fc604abf20c7c0942fcb544d969fd89', '1250');
INSERT INTO `confirm_links` VALUES ('16', '5617db94ee8e46c223d4af58a1607712', '1251');
INSERT INTO `confirm_links` VALUES ('17', 'f18650aaf2dcdf238dd8152ead1823ff', '1252');
INSERT INTO `confirm_links` VALUES ('18', '3a14113221b25d7a6fc2141b1974d2f4', '1253');
INSERT INTO `confirm_links` VALUES ('19', '9f40fc9643ae470ced40c00fd6a3fe27', '1254');
INSERT INTO `confirm_links` VALUES ('20', '76e55c35b9758744a50339ba116cc5e1', '1255');
INSERT INTO `confirm_links` VALUES ('21', '9f15e0e2e92a1165fb94de4266a12591', '1256');
INSERT INTO `confirm_links` VALUES ('22', 'a03d545f42cacb64d6931ae41f235db2', '1234');
INSERT INTO `confirm_links` VALUES ('23', '3654e710a2ace082188ebe4ae106f79a', '1235');
INSERT INTO `confirm_links` VALUES ('24', '691dbf9866fc5d5ca2b076b01be8caf6', '1236');
INSERT INTO `confirm_links` VALUES ('25', '9fecaa2c74034197490775a4fce6ad74', '1237');
INSERT INTO `confirm_links` VALUES ('26', 'a3bc1bcf8b95e9244d8a93012055bfad', '1238');
INSERT INTO `confirm_links` VALUES ('27', '51ec83a6750aad584bb9e8e1ee6013f0', '1239');
INSERT INTO `confirm_links` VALUES ('28', '7a0bd42580295f1a9251f1fd74066f74', '1240');
INSERT INTO `confirm_links` VALUES ('29', 'd7012c321de3684b6dfec16e141fad7a', '1241');
INSERT INTO `confirm_links` VALUES ('30', '252b4839af56eb7df3e28af2dd0f9b83', '1242');
INSERT INTO `confirm_links` VALUES ('31', 'ddd7039dd32eac37b9337a4fc9637e46', '1243');
INSERT INTO `confirm_links` VALUES ('32', '5f7224ae93306e78f3a02c5559f55bd3', '1244');
INSERT INTO `confirm_links` VALUES ('33', 'f55b07d153e8c26aaf4b0d8f88b1e980', '1245');
INSERT INTO `confirm_links` VALUES ('34', '5eb4865b41fc98f478fa263cd53b9fe4', '1246');
INSERT INTO `confirm_links` VALUES ('35', '65ae7adac90cf6468af6be78d7ed78f5', '1247');
INSERT INTO `confirm_links` VALUES ('36', '840caed9735666ee6d04518047d90d39', '1248');
INSERT INTO `confirm_links` VALUES ('37', '31d169af34014df10a565865365125b0', '1249');
INSERT INTO `confirm_links` VALUES ('38', '4ab19de093e72970e87d3d1888c0b3ba', '1250');
INSERT INTO `confirm_links` VALUES ('39', '8360b04a080554938f9c6cd40017bce0', '1251');
INSERT INTO `confirm_links` VALUES ('40', '77fbf61537cf286104b679b6b94019c5', '1431');
INSERT INTO `confirm_links` VALUES ('41', '8df363a52113888746b755d787cc8791', '1432');
INSERT INTO `confirm_links` VALUES ('42', '22bd03ecefb1e2bafd72ada951f7e639', '1433');
INSERT INTO `confirm_links` VALUES ('43', '78fa95711843fc112d7c2e7f70df2ceb', '1434');
INSERT INTO `confirm_links` VALUES ('44', 'edb915cdb28d5b3c43f387e6383474d6', '1435');
INSERT INTO `confirm_links` VALUES ('45', 'f892a87374a6f0c07f35775fc7684a50', '1436');
INSERT INTO `confirm_links` VALUES ('46', '7622eabfff99cb72ff5f4527d948e91e', '1437');
INSERT INTO `confirm_links` VALUES ('47', '0e8adb407f60b2a9415e263479b813fc', '1438');
INSERT INTO `confirm_links` VALUES ('48', 'd9572570894b0e7beac9d9cfb714d013', '1439');
INSERT INTO `confirm_links` VALUES ('49', '77dabc2f1b4eaa26528a4be2ea05473b', '1440');
INSERT INTO `confirm_links` VALUES ('50', '07f634cd021e6b4e678dfc47e5d92e4f', '1441');
INSERT INTO `confirm_links` VALUES ('51', '854eaa3ea9214c38f987c55e00be4528', '1442');
INSERT INTO `confirm_links` VALUES ('52', '7abe8db2a08409ec93e7cb9abc7c4755', '1443');
INSERT INTO `discount_codes` VALUES ('1', 'percent', 'CIYL2I', '20', '1596232800', '1596146400', '1');
INSERT INTO `languages` VALUES ('2', 'en', 'english', '$', 'USD', 'en.jpg');
INSERT INTO `languages` VALUES ('5', 'es', 'español', '$', 'COP', 'es.png');
INSERT INTO `orders` VALUES ('1', '1350', '0', 'a:3:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"9\";s:6:\"folder\";s:10:\"1597247331\";s:5:\"image\";s:9:\"word1.png\";s:4:\"time\";s:10:\"1597247399\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:14:\"Word_al_día_9\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"8\";s:9:\"course_id\";s:2:\"18\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}i:2;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"10\";s:6:\"folder\";s:10:\"1597247446\";s:5:\"image\";s:11:\"access1.png\";s:4:\"time\";s:10:\"1597247501\";s:11:\"time_update\";s:10:\"1597247693\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Access_al_día_10\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"9\";s:9:\"course_id\";s:2:\"17\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597690122', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('2', '1351', '0', 'a:3:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"9\";s:6:\"folder\";s:10:\"1597247331\";s:5:\"image\";s:9:\"word1.png\";s:4:\"time\";s:10:\"1597247399\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:14:\"Word_al_día_9\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"8\";s:9:\"course_id\";s:2:\"18\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}i:2;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"10\";s:6:\"folder\";s:10:\"1597247446\";s:5:\"image\";s:11:\"access1.png\";s:4:\"time\";s:10:\"1597247501\";s:11:\"time_update\";s:10:\"1597247693\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Access_al_día_10\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"9\";s:9:\"course_id\";s:2:\"17\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597690195', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('3', '1352', '0', 'a:3:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"9\";s:6:\"folder\";s:10:\"1597247331\";s:5:\"image\";s:9:\"word1.png\";s:4:\"time\";s:10:\"1597247399\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:14:\"Word_al_día_9\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"8\";s:9:\"course_id\";s:2:\"18\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}i:2;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"10\";s:6:\"folder\";s:10:\"1597247446\";s:5:\"image\";s:11:\"access1.png\";s:4:\"time\";s:10:\"1597247501\";s:11:\"time_update\";s:10:\"1597247693\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Access_al_día_10\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"9\";s:9:\"course_id\";s:2:\"17\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597690324', 'Direct', 'Direct', 'Payu', null, '9998', 'VISA', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('4', '1353', '0', 'a:3:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"9\";s:6:\"folder\";s:10:\"1597247331\";s:5:\"image\";s:9:\"word1.png\";s:4:\"time\";s:10:\"1597247399\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:14:\"Word_al_día_9\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"8\";s:9:\"course_id\";s:2:\"18\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}i:2;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"10\";s:6:\"folder\";s:10:\"1597247446\";s:5:\"image\";s:11:\"access1.png\";s:4:\"time\";s:10:\"1597247501\";s:11:\"time_update\";s:10:\"1597247693\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Access_al_día_10\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"9\";s:9:\"course_id\";s:2:\"17\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597691520', 'Direct', 'Direct', 'Payu', null, '9998', 'VISA', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('5', '1354', '0', 'a:3:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"9\";s:6:\"folder\";s:10:\"1597247331\";s:5:\"image\";s:9:\"word1.png\";s:4:\"time\";s:10:\"1597247399\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:14:\"Word_al_día_9\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"8\";s:9:\"course_id\";s:2:\"18\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}i:2;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"10\";s:6:\"folder\";s:10:\"1597247446\";s:5:\"image\";s:11:\"access1.png\";s:4:\"time\";s:10:\"1597247501\";s:11:\"time_update\";s:10:\"1597247693\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Access_al_día_10\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"9\";s:9:\"course_id\";s:2:\"17\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597691675', 'Direct', 'Direct', 'Payu', null, '4', 'VISA', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('6', '1355', '0', 'a:3:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"7\";s:6:\"folder\";s:10:\"1597240429\";s:5:\"image\";s:10:\"excel1.png\";s:4:\"time\";s:10:\"1597240678\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_7\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"6\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:5:\"59950\";}s:16:\"product_quantity\";s:1:\"2\";}i:2;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"10\";s:6:\"folder\";s:10:\"1597247446\";s:5:\"image\";s:11:\"access1.png\";s:4:\"time\";s:10:\"1597247501\";s:11:\"time_update\";s:10:\"1597247693\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Access_al_día_10\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"9\";s:9:\"course_id\";s:2:\"17\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"2\";}}', '1597769640', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('7', '1356', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"3\";s:6:\"folder\";s:10:\"1597071695\";s:5:\"image\";s:11:\"project.png\";s:4:\"time\";s:10:\"1597071757\";s:11:\"time_update\";s:10:\"1597242966\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Project_al_día_3\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"2\";s:9:\"course_id\";s:2:\"16\";s:5:\"price\";s:5:\"97900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"8\";s:6:\"folder\";s:10:\"1597246997\";s:5:\"image\";s:12:\"project1.png\";s:4:\"time\";s:10:\"1597247232\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Project_al_día_8\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"7\";s:9:\"course_id\";s:2:\"16\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"4\";}}', '1597770792', 'Direct', 'Direct', 'Payu', null, '4', 'MASTERCARD', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('8', '1357', '0', 'a:5:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"5\";s:6:\"folder\";s:10:\"1597090827\";s:5:\"image\";s:10:\"access.png\";s:4:\"time\";s:10:\"1597090873\";s:11:\"time_update\";s:10:\"1597090892\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:16:\"Access_al_día_5\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"4\";s:9:\"course_id\";s:2:\"17\";s:5:\"price\";s:5:\"97900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"7\";s:6:\"folder\";s:10:\"1597240429\";s:5:\"image\";s:10:\"excel1.png\";s:4:\"time\";s:10:\"1597240678\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_7\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"6\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:5:\"59950\";}s:16:\"product_quantity\";s:1:\"1\";}i:2;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"8\";s:6:\"folder\";s:10:\"1597246997\";s:5:\"image\";s:12:\"project1.png\";s:4:\"time\";s:10:\"1597247232\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Project_al_día_8\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"7\";s:9:\"course_id\";s:2:\"16\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}i:3;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"9\";s:6:\"folder\";s:10:\"1597247331\";s:5:\"image\";s:9:\"word1.png\";s:4:\"time\";s:10:\"1597247399\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:14:\"Word_al_día_9\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"8\";s:9:\"course_id\";s:2:\"18\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}i:4;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"11\";s:6:\"folder\";s:10:\"1597247510\";s:5:\"image\";s:11:\"pnlini1.png\";s:4:\"time\";s:10:\"1597247567\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:27:\"Curso_de_PNL_iniciación_11\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:2:\"10\";s:9:\"course_id\";s:1:\"9\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597776335', 'Direct', 'Direct', 'Payu', null, '1', 'VISA', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('9', '1358', '0', 'a:5:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"6\";s:6:\"folder\";s:10:\"1597090927\";s:5:\"image\";s:10:\"pnlini.png\";s:4:\"time\";s:10:\"1597090977\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"2\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:26:\"Curso_de_PNL_iniciación_6\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"5\";s:9:\"course_id\";s:1:\"9\";s:5:\"price\";s:5:\"97900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"7\";s:6:\"folder\";s:10:\"1597240429\";s:5:\"image\";s:10:\"excel1.png\";s:4:\"time\";s:10:\"1597240678\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_7\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"6\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:5:\"59950\";}s:16:\"product_quantity\";s:1:\"1\";}i:2;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"8\";s:6:\"folder\";s:10:\"1597246997\";s:5:\"image\";s:12:\"project1.png\";s:4:\"time\";s:10:\"1597247232\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Project_al_día_8\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"7\";s:9:\"course_id\";s:2:\"16\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}i:3;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"9\";s:6:\"folder\";s:10:\"1597247331\";s:5:\"image\";s:9:\"word1.png\";s:4:\"time\";s:10:\"1597247399\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:14:\"Word_al_día_9\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"8\";s:9:\"course_id\";s:2:\"18\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}i:4;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"10\";s:6:\"folder\";s:10:\"1597247446\";s:5:\"image\";s:11:\"access1.png\";s:4:\"time\";s:10:\"1597247501\";s:11:\"time_update\";s:10:\"1597247693\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Access_al_día_10\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"9\";s:9:\"course_id\";s:2:\"17\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"2\";}}', '1597777034', 'Direct', 'Direct', 'Payu', null, '1', 'VISA', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('10', '1390', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"8\";s:6:\"folder\";s:10:\"1597246997\";s:5:\"image\";s:12:\"project1.png\";s:4:\"time\";s:10:\"1597247232\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Project_al_día_8\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"7\";s:9:\"course_id\";s:2:\"16\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597778577', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('11', '1360', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"8\";s:6:\"folder\";s:10:\"1597246997\";s:5:\"image\";s:12:\"project1.png\";s:4:\"time\";s:10:\"1597247232\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Project_al_día_8\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"7\";s:9:\"course_id\";s:2:\"16\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597866241', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('12', '1391', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"10\";s:6:\"folder\";s:10:\"1597247446\";s:5:\"image\";s:11:\"access1.png\";s:4:\"time\";s:10:\"1597247501\";s:11:\"time_update\";s:10:\"1597247693\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Access_al_día_10\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"9\";s:9:\"course_id\";s:2:\"17\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597866486', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('13', '1400', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597866910', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('14', '1401', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597867000', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('15', '1402', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"10\";s:6:\"folder\";s:10:\"1597247446\";s:5:\"image\";s:11:\"access1.png\";s:4:\"time\";s:10:\"1597247501\";s:11:\"time_update\";s:10:\"1597247693\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Access_al_día_10\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"9\";s:9:\"course_id\";s:2:\"17\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597867147', 'Direct', 'Direct', 'Payu', null, '4', 'VISA', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('16', '1403', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"8\";s:6:\"folder\";s:10:\"1597246997\";s:5:\"image\";s:12:\"project1.png\";s:4:\"time\";s:10:\"1597247232\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Project_al_día_8\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"7\";s:9:\"course_id\";s:2:\"16\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597867314', 'Direct', 'Direct', 'Payu', null, '9998', 'VISA', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('17', '1404', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"8\";s:6:\"folder\";s:10:\"1597246997\";s:5:\"image\";s:12:\"project1.png\";s:4:\"time\";s:10:\"1597247232\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Project_al_día_8\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"7\";s:9:\"course_id\";s:2:\"16\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597867460', 'Direct', 'Direct', 'Payu', null, '4', 'MASTERCARD', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('18', '1405', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"8\";s:6:\"folder\";s:10:\"1597246997\";s:5:\"image\";s:12:\"project1.png\";s:4:\"time\";s:10:\"1597247232\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Project_al_día_8\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"7\";s:9:\"course_id\";s:2:\"16\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597867579', 'Direct', 'Direct', 'Payu', null, '1', 'VISA', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('19', '1406', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"9\";s:6:\"folder\";s:10:\"1597247331\";s:5:\"image\";s:9:\"word1.png\";s:4:\"time\";s:10:\"1597247399\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:14:\"Word_al_día_9\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"8\";s:9:\"course_id\";s:2:\"18\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597867855', 'Direct', 'Direct', 'Payu', null, '1', 'VISA', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('20', '1407', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"10\";s:6:\"folder\";s:10:\"1597247446\";s:5:\"image\";s:11:\"access1.png\";s:4:\"time\";s:10:\"1597247501\";s:11:\"time_update\";s:10:\"1597247693\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Access_al_día_10\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"9\";s:9:\"course_id\";s:2:\"17\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597868385', 'Direct', 'Direct', 'Payu', null, '10', 'VISA', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('21', '1408', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"8\";s:6:\"folder\";s:10:\"1597246997\";s:5:\"image\";s:12:\"project1.png\";s:4:\"time\";s:10:\"1597247232\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Project_al_día_8\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"7\";s:9:\"course_id\";s:2:\"16\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597868504', 'Direct', 'Direct', 'Payu', null, '9998', 'VISA', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('22', '1409', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"8\";s:6:\"folder\";s:10:\"1597246997\";s:5:\"image\";s:12:\"project1.png\";s:4:\"time\";s:10:\"1597247232\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Project_al_día_8\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"7\";s:9:\"course_id\";s:2:\"16\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597868667', 'Direct', 'Direct', 'Payu', null, '9998', 'VISA', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('23', '1410', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"8\";s:6:\"folder\";s:10:\"1597246997\";s:5:\"image\";s:12:\"project1.png\";s:4:\"time\";s:10:\"1597247232\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Project_al_día_8\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"7\";s:9:\"course_id\";s:2:\"16\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597869318', 'Direct', 'Direct', 'Payu', null, '1', 'VISA', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('24', '1411', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"7\";s:6:\"folder\";s:10:\"1597240429\";s:5:\"image\";s:10:\"excel1.png\";s:4:\"time\";s:10:\"1597240678\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_7\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"6\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:5:\"59950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597873366', 'Direct', 'Direct', 'Payu', null, '1', 'VISA', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('25', '1412', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597874038', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('26', '1413', '0', 'a:3:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:5:\"10000\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"9\";s:6:\"folder\";s:10:\"1597247331\";s:5:\"image\";s:9:\"word1.png\";s:4:\"time\";s:10:\"1597247399\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:14:\"Word_al_día_9\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"8\";s:9:\"course_id\";s:2:\"18\";s:5:\"price\";s:4:\"5000\";}s:16:\"product_quantity\";s:1:\"1\";}i:2;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"10\";s:6:\"folder\";s:10:\"1597247446\";s:5:\"image\";s:11:\"access1.png\";s:4:\"time\";s:10:\"1597247501\";s:11:\"time_update\";s:10:\"1597247693\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Access_al_día_10\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"9\";s:9:\"course_id\";s:2:\"17\";s:5:\"price\";s:4:\"5000\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597878708', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('27', '1414', '0', 'a:5:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:5:\"10000\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"8\";s:6:\"folder\";s:10:\"1597246997\";s:5:\"image\";s:12:\"project1.png\";s:4:\"time\";s:10:\"1597247232\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Project_al_día_8\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"7\";s:9:\"course_id\";s:2:\"16\";s:5:\"price\";s:4:\"5000\";}s:16:\"product_quantity\";s:1:\"1\";}i:2;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"9\";s:6:\"folder\";s:10:\"1597247331\";s:5:\"image\";s:9:\"word1.png\";s:4:\"time\";s:10:\"1597247399\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:14:\"Word_al_día_9\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"8\";s:9:\"course_id\";s:2:\"18\";s:5:\"price\";s:4:\"5000\";}s:16:\"product_quantity\";s:1:\"1\";}i:3;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"10\";s:6:\"folder\";s:10:\"1597247446\";s:5:\"image\";s:11:\"access1.png\";s:4:\"time\";s:10:\"1597247501\";s:11:\"time_update\";s:10:\"1597247693\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Access_al_día_10\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"9\";s:9:\"course_id\";s:2:\"17\";s:5:\"price\";s:4:\"5000\";}s:16:\"product_quantity\";s:1:\"1\";}i:4;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"11\";s:6:\"folder\";s:10:\"1597247510\";s:5:\"image\";s:11:\"pnlini1.png\";s:4:\"time\";s:10:\"1597247567\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:27:\"Curso_de_PNL_iniciación_11\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:2:\"10\";s:9:\"course_id\";s:1:\"9\";s:5:\"price\";s:4:\"5000\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597878775', 'Direct', 'Direct', 'Payu', null, '1', 'MASTERCARD', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('28', '1415', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"9\";s:6:\"folder\";s:10:\"1597247331\";s:5:\"image\";s:9:\"word1.png\";s:4:\"time\";s:10:\"1597247399\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:14:\"Word_al_día_9\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"8\";s:9:\"course_id\";s:2:\"18\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597926570', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('29', '1416', '0', 'a:4:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"4\";s:6:\"folder\";s:10:\"1597090685\";s:5:\"image\";s:8:\"word.png\";s:4:\"time\";s:10:\"1597090797\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:14:\"Word_al_día_4\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"3\";s:9:\"course_id\";s:2:\"18\";s:5:\"price\";s:5:\"97900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"8\";s:6:\"folder\";s:10:\"1597246997\";s:5:\"image\";s:12:\"project1.png\";s:4:\"time\";s:10:\"1597247232\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Project_al_día_8\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"7\";s:9:\"course_id\";s:2:\"16\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}i:2;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"10\";s:6:\"folder\";s:10:\"1597247446\";s:5:\"image\";s:11:\"access1.png\";s:4:\"time\";s:10:\"1597247501\";s:11:\"time_update\";s:10:\"1597247693\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Access_al_día_10\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"9\";s:9:\"course_id\";s:2:\"17\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}i:3;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"11\";s:6:\"folder\";s:10:\"1597247510\";s:5:\"image\";s:11:\"pnlini1.png\";s:4:\"time\";s:10:\"1597247567\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:27:\"Curso_de_PNL_iniciación_11\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:2:\"10\";s:9:\"course_id\";s:1:\"9\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597930714', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('30', '1417', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"8\";s:6:\"folder\";s:10:\"1597246997\";s:5:\"image\";s:12:\"project1.png\";s:4:\"time\";s:10:\"1597247232\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:17:\"Project_al_día_8\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"7\";s:9:\"course_id\";s:2:\"16\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597938117', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('31', '1418', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597938130', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('32', '1419', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597938141', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('33', '1420', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597938161', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('34', '1421', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597938181', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('35', '1422', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597938191', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('36', '1423', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"2\";}}', '1597938836', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('37', '1424', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"2\";}}', '1597938844', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('38', '1425', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597938981', 'Direct', 'Direct', 'Payu', null, '1', 'PSE', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('39', '1426', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"2\";}}', '1597945146', 'https://formatic.com.co/market/', 'com.co', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('40', '1427', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597945590', 'Direct', 'Direct', 'Payu', null, '1', 'SU RED', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('41', '1428', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"9\";s:6:\"folder\";s:10:\"1597247331\";s:5:\"image\";s:9:\"word1.png\";s:4:\"time\";s:10:\"1597247399\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:14:\"Word_al_día_9\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"8\";s:9:\"course_id\";s:2:\"18\";s:5:\"price\";s:5:\"48950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597954422', 'https://excelaldia.formatic.com.co/web/', 'com.co', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('42', '1429', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"7\";s:6:\"folder\";s:10:\"1597240429\";s:5:\"image\";s:10:\"excel1.png\";s:4:\"time\";s:10:\"1597240678\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"1\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_7\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"6\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:5:\"59950\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597958025', 'https://excelaldia.formatic.com.co/web/', 'com.co', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('43', '1430', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:18:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:4:\"1000\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:9:\"course_id\";s:2:\"11\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1597958043', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('44', '1431', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1601324885', 'Direct', 'Direct', 'ePayco', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('45', '1432', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1601325014', 'Direct', 'Direct', 'ePayco', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('46', '1433', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1601325532', 'Direct', 'Direct', 'ePayco', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('47', '1434', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1601393569', 'Direct', 'Direct', 'ePayco', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('48', '1435', '0', 'a:2:{i:0;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}i:1;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:2:\"12\";s:6:\"folder\";s:10:\"1598462642\";s:5:\"image\";s:20:\"kit2web-1024x683.jpg\";s:4:\"time\";s:10:\"1598462724\";s:11:\"time_update\";s:1:\"0\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"4\";s:8:\"quantity\";s:3:\"100\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:21:\"Kit_amigo_de_Jesus_12\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:5:\"price\";s:6:\"119000\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1601394322', 'Direct', 'Direct', 'ePayco', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('49', '1436', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"2\";}}', '1601394558', 'Direct', 'Direct', 'ePayco', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('50', '1437', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1601394717', 'Direct', 'Direct', 'ePayco', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('51', '1438', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1601395160', 'Direct', 'Direct', 'ePayco', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('52', '1439', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1601395273', 'Direct', 'Direct', 'ePayco', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('53', '1440', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"3\";}}', '1601397506', 'Direct', 'Direct', 'ePayco', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('54', '1441', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1601397660', 'Direct', 'Direct', 'ePayco', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('55', '1442', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1601582859', 'Direct', 'Direct', 'Payu', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders` VALUES ('56', '1443', '0', 'a:1:{i:0;a:2:{s:12:\"product_info\";a:17:{s:11:\"vendor_name\";N;s:9:\"vendor_id\";s:1:\"0\";s:2:\"id\";s:1:\"2\";s:6:\"folder\";s:10:\"1597071597\";s:5:\"image\";s:9:\"excel.png\";s:4:\"time\";s:10:\"1597071689\";s:11:\"time_update\";s:10:\"1597242954\";s:10:\"visibility\";s:1:\"1\";s:14:\"shop_categorie\";s:1:\"3\";s:8:\"quantity\";s:2:\"10\";s:11:\"procurement\";s:1:\"0\";s:9:\"in_slider\";s:1:\"0\";s:3:\"url\";s:15:\"Excel_al_día_2\";s:16:\"virtual_products\";N;s:8:\"brand_id\";N;s:8:\"position\";s:1:\"1\";s:5:\"price\";s:6:\"119900\";}s:16:\"product_quantity\";s:1:\"1\";}}', '1601582938', 'Direct', 'Direct', 'ePayco', null, '0', '', '0', '0', '0', null);
INSERT INTO `orders_clients` VALUES ('1', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 54', 'bogota', '', '', '1', null, null);
INSERT INTO `orders_clients` VALUES ('2', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 1', 'bogota', '', '', '2', null, null);
INSERT INTO `orders_clients` VALUES ('3', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 1', 'bogota', '', '', '3', null, null);
INSERT INTO `orders_clients` VALUES ('4', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'CALLE 1', 'bogota', '', '', '4', null, null);
INSERT INTO `orders_clients` VALUES ('5', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 1', 'bogota', '', '', '5', null, null);
INSERT INTO `orders_clients` VALUES ('6', 'ISabel', 'Buitragp', 'mariaibuitrago@gmail.com', '3002895525', 'Cll 139 N 67-98', 'Bogotá', '', '', '6', null, null);
INSERT INTO `orders_clients` VALUES ('7', 'ISabel', 'Buitragp', 'mariaibuitrago@gmail.com', '5678903', 'cll 155 N 78-90', 'Bogotá', '', '', '7', null, null);
INSERT INTO `orders_clients` VALUES ('8', 'ISabel', 'Buitragp', 'pruebas2@gmail.com', '3002895525', 'Cll 123 N 67-45', 'Bogotá', '', '', '8', null, null);
INSERT INTO `orders_clients` VALUES ('9', 'ISabel', 'Buitragp', 'pruebas2formatic@gmail.com', '5678903', 'cll 34 N 78-90', 'Bogotá', '', '', '9', null, null);
INSERT INTO `orders_clients` VALUES ('10', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 54', 'bogota', '', '', '10', null, null);
INSERT INTO `orders_clients` VALUES ('11', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 54', 'bogota', '', '', '11', null, null);
INSERT INTO `orders_clients` VALUES ('12', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 54', 'bogota', '', '', '12', null, null);
INSERT INTO `orders_clients` VALUES ('13', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 54', 'bogota', '', '', '13', null, null);
INSERT INTO `orders_clients` VALUES ('14', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 54', 'bogota', '', '', '14', null, null);
INSERT INTO `orders_clients` VALUES ('15', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 54', 'bogota', '', '', '15', null, null);
INSERT INTO `orders_clients` VALUES ('16', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 54', 'bogota', '', '', '16', null, null);
INSERT INTO `orders_clients` VALUES ('17', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'Calle 54', 'bogota', '', '', '17', null, null);
INSERT INTO `orders_clients` VALUES ('18', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 54', 'bogota', '', '', '18', null, null);
INSERT INTO `orders_clients` VALUES ('19', 'Edward', 'Rodriguez', 'edward.rodriguez@gmail.com', '3196530669', 'calle 54', 'bogota', '', '', '19', null, null);
INSERT INTO `orders_clients` VALUES ('20', 'Edward', 'Rodriguez', 'edward.rodriguez@gmail.com', '3196530669', 'calle 54', 'bogota', '', '', '20', null, null);
INSERT INTO `orders_clients` VALUES ('21', 'Edward', 'Rodriguez', 'edward.rodriguez@gmail.com', '3196530669', 'calle 54', 'bogota', '', '', '21', null, null);
INSERT INTO `orders_clients` VALUES ('22', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 54', 'bogota', '', '', '22', null, null);
INSERT INTO `orders_clients` VALUES ('23', 'Edward', 'Rodriguez', 'edward.rodriguez@formatic.com.co', '3196530669', 'calle 54', 'bogota', '', '', '23', null, null);
INSERT INTO `orders_clients` VALUES ('24', 'Edward', 'Rodriguez', 'edward.rodriguez@gmail.com', '3196530669', 'calle 54', 'bogota', '', '', '24', null, null);
INSERT INTO `orders_clients` VALUES ('25', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 54', 'bogota', '', '', '25', null, null);
INSERT INTO `orders_clients` VALUES ('26', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 54', 'bogota', '', '', '26', null, null);
INSERT INTO `orders_clients` VALUES ('27', 'Isabel', 'Buitrago', 'pruebas2formatic@gmail.com', '300 4567890', 'Cll 55 N 34-90', 'Bogotá', '', '', '27', null, null);
INSERT INTO `orders_clients` VALUES ('28', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 54', 'bogota', '', '', '28', null, null);
INSERT INTO `orders_clients` VALUES ('29', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 54', 'bogota', '', '', '29', null, null);
INSERT INTO `orders_clients` VALUES ('30', 'Orfidia', 'Cardenas ', 'yo.cardenas.morales.25@gmail.com', '3223717402', 'Calle 67 B # 110-43', 'Bogotá', '', '', '30', null, null);
INSERT INTO `orders_clients` VALUES ('31', 'John harvy', 'Sánchez', 'jhscali1@outlook.com', '3128633846', 'Calle 59  2 C 81', 'Cali', '', '', '31', null, null);
INSERT INTO `orders_clients` VALUES ('32', 'John harvy', 'Sánchez', 'jhscali1@outlook.com', '3128633846', 'Calle 59  2 C 81', 'Cali', '', '', '32', null, null);
INSERT INTO `orders_clients` VALUES ('33', 'John harvy', 'Sánchez', 'jhscali1@outlook.com', '3128633846', 'Calle 59  2 C 81', 'Cali', '', '', '33', null, null);
INSERT INTO `orders_clients` VALUES ('34', 'John harvy', 'Sánchez', 'jhscali1@outlook.com', '3128633846', 'Calle 59  2 C 81', 'Cali', '', '', '34', null, null);
INSERT INTO `orders_clients` VALUES ('35', 'John harvy', 'Sánchez', 'jhscali1@outlook.com', '3128633846', 'Calle 59  2 C 81', 'Cali', '', '', '35', null, null);
INSERT INTO `orders_clients` VALUES ('36', 'John harvy', 'Sánchez', 'jhscali1@outlook.com', '3128633846', 'Calle 59 2 C 81', 'Cali', '', '', '36', null, null);
INSERT INTO `orders_clients` VALUES ('37', 'John harvy', 'Sánchez', 'jhscali1@outlook.com', '3128633846', 'Calle 59 2 C 81', 'Cali', '', '', '37', null, null);
INSERT INTO `orders_clients` VALUES ('38', 'John harvy', 'Sánchez', 'jhscali1@outlook.com', '3128633846', 'Calle 59 2 c 81', 'Cali', '', '', '38', null, null);
INSERT INTO `orders_clients` VALUES ('39', 'Yessica Mariany', 'castellanos', 'marianycastellanos2@gmail.com', '2504595552', 'calle 200 # 54-32', 'bogota', '', '', '39', null, null);
INSERT INTO `orders_clients` VALUES ('40', 'Yessica Mariany', 'Castellanos', 'marianycastellanos2@gmail.com', '3504595552', 'Calle 200 #54_32', 'Bogotá ', '', '', '40', null, null);
INSERT INTO `orders_clients` VALUES ('41', 'yuli paola', 'mendivelso panqueva', 'yulipaolam@gmail.com', '3213380917', 'carrera90 #6a 98', 'bogota', '', '', '41', null, null);
INSERT INTO `orders_clients` VALUES ('42', 'monica', 'diaz', 'amouret@hotmail.com.ar', '3013260841', 'cra 7', 'bogota', '118011', '', '42', 'cc', '1024502273');
INSERT INTO `orders_clients` VALUES ('43', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 54', 'bogota', '', '', '43', 'cc', '79495926');
INSERT INTO `orders_clients` VALUES ('44', '', '', '', null, null, null, null, '', '0', null, null);
INSERT INTO `orders_clients` VALUES ('45', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 1', 'bogota', '', '', '44', 'cc', '79495926');
INSERT INTO `orders_clients` VALUES ('46', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 1', 'bogota', '', '', '45', 'cc', '79495926');
INSERT INTO `orders_clients` VALUES ('47', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 1', 'bogota', '', '', '46', 'cc', '79495926');
INSERT INTO `orders_clients` VALUES ('48', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 1', 'bogota', '', '', '47', 'cc', '79495926');
INSERT INTO `orders_clients` VALUES ('49', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 1', 'bogota', '', '', '48', 'cc', '79495926');
INSERT INTO `orders_clients` VALUES ('50', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 1', 'bogota', '', '', '49', 'cc', '79495926');
INSERT INTO `orders_clients` VALUES ('51', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 1', 'bogota', '', '', '50', 'cc', '79495926');
INSERT INTO `orders_clients` VALUES ('52', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 1', 'bogota', '', '', '51', 'cc', '79495926');
INSERT INTO `orders_clients` VALUES ('53', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 1', 'bogota', '', '', '52', 'cc', '79495926');
INSERT INTO `orders_clients` VALUES ('54', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 1', 'bogota', '', '', '53', 'cc', '79495926');
INSERT INTO `orders_clients` VALUES ('55', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 1', 'bogota', '', '', '54', 'cc', '79495926');
INSERT INTO `orders_clients` VALUES ('56', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 1', 'bogota', '', '', '55', 'cc', '79495926');
INSERT INTO `orders_clients` VALUES ('57', 'Edward', 'Rodriguez', 'ing.erodriguez@outlook.com', '3196530669', 'calle 1', 'bogota', '', '', '56', 'cc', '79495926');
INSERT INTO `products` VALUES ('2', '1597071597', 'excel.png', '1597071689', '1597242954', '1', '3', '10', '0', '0', 'Excel_al_día_2', null, null, '1', '0');
INSERT INTO `products` VALUES ('3', '1597071695', 'project.png', '1597071757', '1597242966', '1', '3', '10', '0', '0', 'Project_al_día_3', null, null, '2', '0');
INSERT INTO `products` VALUES ('4', '1597090685', 'word.png', '1597090797', '0', '1', '3', '10', '0', '0', 'Word_al_día_4', null, null, '3', '0');
INSERT INTO `products` VALUES ('5', '1597090827', 'access.png', '1597090873', '1597090892', '1', '3', '10', '0', '0', 'Access_al_día_5', null, null, '4', '0');
INSERT INTO `products` VALUES ('6', '1597090927', 'pnlini.png', '1597090977', '0', '1', '3', '10', '0', '0', 'Curso_de_PNL_iniciación_6', null, null, '5', '0');
INSERT INTO `products` VALUES ('7', '1597240429', 'excel1.png', '1597240678', '0', '0', '3', '10', '0', '0', 'Excel_al_día_7', null, null, '6', '0');
INSERT INTO `products` VALUES ('8', '1597246997', 'project1.png', '1597247232', '1601592106', '1', '3', '100', '1', '0', 'Project_al_día_8', null, null, '7', '0');
INSERT INTO `products` VALUES ('9', '1597247331', 'word1.png', '1597247399', '1601592139', '1', '3', '100', '1', '0', 'Word_al_día_9', null, null, '8', '0');
INSERT INTO `products` VALUES ('10', '1597247446', 'access1.png', '1597247501', '1601592157', '1', '3', '100', '1', '0', 'Access_al_día_10', null, null, '9', '0');
INSERT INTO `products` VALUES ('11', '1597247510', 'pnlini1.png', '1597247567', '1601592180', '1', '3', '100', '1', '0', 'Curso_de_PNL_iniciación_11', null, null, '10', '0');
INSERT INTO `products` VALUES ('12', '1598462642', 'kit2web-1024x683.jpg', '1598462724', '0', '1', '4', '100', '0', '0', 'Kit_amigo_de_Jesus_12', null, null, '1', '0');
INSERT INTO `products_translations` VALUES ('3', '', '', '', '', '', 'en', '2');
INSERT INTO `products_translations` VALUES ('4', 'Excel al día', '<p><span style=\"font-size:12px;\"><span segoe=\"\" style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, \" ui=\"\">Excel es una herramienta con la que podrás mejorar tus competencias laborales y profesionales logrando presentar informes muy bien estructurados. Cuenta con más de 200 lecciones.</span></span></p>\r\n', '', '119900', '', 'es', '2');
INSERT INTO `products_translations` VALUES ('5', '', '', '', '', '', 'en', '3');
INSERT INTO `products_translations` VALUES ('6', 'Project al día', '<p><span style=\"font-size:12px;\"><span segoe=\"\" style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, \" ui=\"\">Formatic presenta este programa con el fin de fortalecer destrezas en el desarrollo de proyectos enfocados a cualquier área, a través del uso y aprendizaje de la herramienta Microsoft Project.</span></span></p>\r\n', '', '97900', '', 'es', '3');
INSERT INTO `products_translations` VALUES ('7', '', '', '', '', '', 'en', '4');
INSERT INTO `products_translations` VALUES ('8', 'Word al día', '<p>Microsoft Word es un programa informático orientado al procesamiento de textos, permite crear, editar, ver y compartir archivos de forma rápida y sencilla.</p>\r\n', '', '97900', '', 'es', '4');
INSERT INTO `products_translations` VALUES ('9', '', '', '', '', '', 'en', '5');
INSERT INTO `products_translations` VALUES ('10', 'Access al día', '<p>Access es una herramienta fácil de usar para crear aplicaciones de negocios a partir de plantillas o desde cero. Access puede ayudarte a crear aplicaciones atractivas y muy funcionales en una cantidad de tiempo mínima.</p>\r\n', '', '97900', '', 'es', '5');
INSERT INTO `products_translations` VALUES ('11', '', '', '', '', '', 'en', '6');
INSERT INTO `products_translations` VALUES ('12', 'Curso de PNL iniciación', '<p>Es un conjunto de técnicas y herramientas que utiliza el pensamiento, el lenguaje, y la mente inconsciente para modificar conductas negativas y lograr cambios positivos en la vida de las personas.</p>\r\n', '', '97900', '', 'es', '6');
INSERT INTO `products_translations` VALUES ('13', '', '', '', '', '', 'en', '7');
INSERT INTO `products_translations` VALUES ('14', 'Excel al día', '<p><span style=\"font-size:12px;\"><span segoe=\"\" style=\"color: rgb(33, 37, 41); font-family: -apple-system, BlinkMacSystemFont, \" ui=\"\">Excel es una herramienta con la que podrás mejorar tus competencias laborales y profesionales logrando presentar informes muy bien estructurados. Cuenta con más de 200 lecciones.</span></span></p>\r\n', '', '59950', '119900', 'es', '7');
INSERT INTO `products_translations` VALUES ('15', '', '', '', '', '', 'en', '8');
INSERT INTO `products_translations` VALUES ('16', 'Project al día', '<p>Project al día</p>\r\n', '', '0', '97900', 'es', '8');
INSERT INTO `products_translations` VALUES ('17', '', '', '', '', '', 'en', '9');
INSERT INTO `products_translations` VALUES ('18', 'Word al día', '<p>Word al día</p>\r\n', '', '0', '97900', 'es', '9');
INSERT INTO `products_translations` VALUES ('19', '', '', '', '', '', 'en', '10');
INSERT INTO `products_translations` VALUES ('20', 'Access al día', '<p>Access al día</p>\r\n', '', '0', '97900', 'es', '10');
INSERT INTO `products_translations` VALUES ('21', '', '', '', '', '', 'en', '11');
INSERT INTO `products_translations` VALUES ('22', 'Curso de PNL iniciación', '<p>Curso de PNL iniciación</p>\r\n', '', '0', '97900', 'es', '11');
INSERT INTO `products_translations` VALUES ('23', '', '', '', '', '', 'en', '12');
INSERT INTO `products_translations` VALUES ('24', 'Kit amigo de Jesus', '<p>Kit amigo de Jesus</p>\r\n', '', '119000', '', 'es', '12');
INSERT INTO `seo_pages` VALUES ('1', 'home');
INSERT INTO `seo_pages` VALUES ('2', 'checkout');
INSERT INTO `seo_pages` VALUES ('3', 'contacts');
INSERT INTO `seo_pages` VALUES ('4', 'blog');
INSERT INTO `shop_categories` VALUES ('4', '0', '0');
INSERT INTO `shop_categories` VALUES ('3', '0', '0');
INSERT INTO `shop_categories_translations` VALUES ('5', 'Courses', 'en', '3');
INSERT INTO `shop_categories_translations` VALUES ('6', 'Cursos', 'es', '3');
INSERT INTO `shop_categories_translations` VALUES ('7', 'Products', 'en', '4');
INSERT INTO `shop_categories_translations` VALUES ('8', 'Productos', 'es', '4');
INSERT INTO `users` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'your@email.com', '0', '1597417246');
INSERT INTO `users` VALUES ('2', 'ingerodriguez', '1e23a7ecc25928679256d5edb9815371', 'gerente.ti@enlasys.net', '1', '1601591838');
INSERT INTO `value_store` VALUES ('1', 'sitelogo', 'logo.png');
INSERT INTO `value_store` VALUES ('2', 'navitext', '');
INSERT INTO `value_store` VALUES ('3', 'footercopyright', '© 2020 | Derechos reservados Formatic ');
INSERT INTO `value_store` VALUES ('4', 'contactspage', 'Hello dear client');
INSERT INTO `value_store` VALUES ('5', 'footerContactAddr', '');
INSERT INTO `value_store` VALUES ('6', 'footerContactEmail', 'info@enlasys.net');
INSERT INTO `value_store` VALUES ('7', 'footerContactPhone', '3196530669');
INSERT INTO `value_store` VALUES ('8', 'googleMaps', '42.671840, 83.279163');
INSERT INTO `value_store` VALUES ('9', 'footerAboutUs', '');
INSERT INTO `value_store` VALUES ('10', 'footerSocialFacebook', '');
INSERT INTO `value_store` VALUES ('11', 'footerSocialTwitter', '');
INSERT INTO `value_store` VALUES ('12', 'footerSocialGooglePlus', '');
INSERT INTO `value_store` VALUES ('13', 'footerSocialPinterest', '');
INSERT INTO `value_store` VALUES ('14', 'footerSocialYoutube', '');
INSERT INTO `value_store` VALUES ('16', 'contactsEmailTo', 'contacts@shop.dev');
INSERT INTO `value_store` VALUES ('17', 'shippingOrder', '1');
INSERT INTO `value_store` VALUES ('18', 'addJs', '');
INSERT INTO `value_store` VALUES ('19', 'publicQuantity', '0');
INSERT INTO `value_store` VALUES ('20', 'paypal_email', 'sb-pdvem2613104@business.example.com');
INSERT INTO `value_store` VALUES ('21', 'paypal_sandbox', '0');
INSERT INTO `value_store` VALUES ('22', 'publicDateAdded', '0');
INSERT INTO `value_store` VALUES ('23', 'googleApi', '');
INSERT INTO `value_store` VALUES ('24', 'template', 'formatic1');
INSERT INTO `value_store` VALUES ('25', 'cashondelivery_visibility', '0');
INSERT INTO `value_store` VALUES ('26', 'showBrands', '0');
INSERT INTO `value_store` VALUES ('27', 'showInSlider', '0');
INSERT INTO `value_store` VALUES ('28', 'codeDiscounts', '0');
INSERT INTO `value_store` VALUES ('29', 'virtualProducts', '0');
INSERT INTO `value_store` VALUES ('30', 'multiVendor', '0');
INSERT INTO `value_store` VALUES ('31', 'outOfStock', '0');
INSERT INTO `value_store` VALUES ('32', 'hideBuyButtonsOfOutOfStock', '0');
INSERT INTO `value_store` VALUES ('33', 'moreInfoBtn', '');
INSERT INTO `value_store` VALUES ('34', 'refreshAfterAddToCart', '0');
