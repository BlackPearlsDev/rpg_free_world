/*
 Navicat Premium Data Transfer

 Source Server         : Dofus
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : exo_libre

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 31/08/2022 23:39:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `pseudo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (2, 'BlackPearl', '$2b$10$M2gGm1X9pN86LSspqRq6iOh10sh4YFy09BqTz2EfAND2PA9DrUhuy', 'blackpearls');

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `classeName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `dps` int(11) UNSIGNED NOT NULL,
  `health` int(11) UNSIGNED NOT NULL,
  `armor` int(11) UNSIGNED NOT NULL,
  `gold` int(11) UNSIGNED NOT NULL,
  `account_id` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_id`(`account_id`) USING BTREE,
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES (16, 'Voleur', 'Voleur', 171, 147, 190, 1100, 2);
INSERT INTO `classes` VALUES (17, 'Paladin', 'Paladin', 165, 167, 146, 113, 2);
INSERT INTO `classes` VALUES (18, 'Chevalier de la mort', 'Chevalier de la mort', 129, 133, 111, 191, 2);
INSERT INTO `classes` VALUES (19, 'Chasseur de démons', 'Chasseur de démons', 174, 11, 113, 141, 2);

-- ----------------------------
-- Table structure for classes_template
-- ----------------------------
DROP TABLE IF EXISTS `classes_template`;
CREATE TABLE `classes_template`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `spec` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `dps` int(11) UNSIGNED NOT NULL,
  `health` int(11) UNSIGNED NOT NULL,
  `armor` int(11) UNSIGNED NOT NULL,
  `gold` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classes_template
-- ----------------------------
INSERT INTO `classes_template` VALUES (1, 'Guerrier', 'Tank', 'Spécialiste du soutien', 100, 200, 200, 500);
INSERT INTO `classes_template` VALUES (2, 'Paladin', 'Tank', 'Spécialiste du soutien', 80, 250, 300, 450);
INSERT INTO `classes_template` VALUES (3, 'Chasseur', 'DPS', 'Spécialiste des dégâts', 100, 200, 100, 600);
INSERT INTO `classes_template` VALUES (4, 'Voleur', 'DPS', 'Spécialiste des dégâts', 100, 180, 80, 600);
INSERT INTO `classes_template` VALUES (5, 'Prêtre', 'Soigneur', 'Spécialiste des soins', 20, 300, 100, 800);
INSERT INTO `classes_template` VALUES (6, 'Chaman', 'Soigneur', 'Spécialiste des soins', 30, 300, 100, 800);
INSERT INTO `classes_template` VALUES (7, 'Mage', 'DPS', 'Spécialiste des dégâts', 100, 300, 150, 750);
INSERT INTO `classes_template` VALUES (8, 'Démoniste', 'DPS', 'Spécialiste des dégâts', 100, 200, 250, 900);
INSERT INTO `classes_template` VALUES (9, 'Moine', 'Tank', 'Spécialiste du soutien', 60, 250, 250, 300);
INSERT INTO `classes_template` VALUES (10, 'Druide', 'Tank', 'Spécialiste du soutien', 70, 250, 350, 1000);
INSERT INTO `classes_template` VALUES (11, 'Chasseur de démons', 'Tank', 'Spécialiste du soutien', 100, 200, 200, 1000);
INSERT INTO `classes_template` VALUES (12, 'Chevalier de la mort', 'Tank', 'Spécialiste des dégâts', 100, 200, 150, 1200);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `classOwned` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `classOwned`(`classOwned`) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`classOwned`) REFERENCES `classes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
