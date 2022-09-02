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

 Date: 02/09/2022 10:22:56
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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (2, 'BlackPearl', '$2b$10$M2gGm1X9pN86LSspqRq6iOh10sh4YFy09BqTz2EfAND2PA9DrUhuy', 'blackpearls');
INSERT INTO `accounts` VALUES (4, 'test', '$2b$10$ceym5aWl4vVcYXn2fhLTq.VgfXjx0AqHi6qDeHxs.8hcJrOaMEeum', 'test');
INSERT INTO `accounts` VALUES (5, 'test1', '$2b$10$oKCSVOZpiRTJcIiIbfLPZ.FuRG4K4nMmW.mTO9b7rzoNDB4Nf1W0S', 'test1');
INSERT INTO `accounts` VALUES (6, 'John', '$2b$10$Z2GpUIGo.fIT451Rmrke2OGhha8BZAFqC3arnovgzDYw1UHlTbgji', 'John');
INSERT INTO `accounts` VALUES (7, 'Michel', '$2b$10$tgoyKKLzql4SsJSbi4NRF.RbJ6FCzRmW43tKv.hAriYlfdbZKmgl2', 'Michel');
INSERT INTO `accounts` VALUES (8, 'jean', '$2b$10$K6/rQ5H7zrwxn7jUvcKT.ubwMHobCdEEvs.LSB6mmQri7IB7RVqFa', 'jean');

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
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES (45, 'Paladin', 'Survie', 784, 315, 346, 212, 7);
INSERT INTO `classes` VALUES (46, 'Voleur', 'Amélioration', 957, 521, 829, 659, 2);
INSERT INTO `classes` VALUES (47, 'Chasseur', 'Restauration', 815, 783, 617, 473, 2);
INSERT INTO `classes` VALUES (49, 'Voleur', 'Élémentaire', 475, 998, 817, 805, 2);
INSERT INTO `classes` VALUES (50, 'Paladin', 'Amélioration', 418, 492, 242, 921, 2);
INSERT INTO `classes` VALUES (51, 'Chasseur', 'Précision', 664, 539, 803, 550, 2);
INSERT INTO `classes` VALUES (52, 'Voleur', 'Restauration', 758, 286, 144, 610, 8);

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
-- Table structure for specs_template
-- ----------------------------
DROP TABLE IF EXISTS `specs_template`;
CREATE TABLE `specs_template`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `specName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `classes_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of specs_template
-- ----------------------------
INSERT INTO `specs_template` VALUES (1, 'Armes', 'Melee Damage (DPS)', 1);
INSERT INTO `specs_template` VALUES (2, 'Fureur', 'Melee Damage (DPS)', 1);
INSERT INTO `specs_template` VALUES (3, 'Protection', 'Tank', 1);
INSERT INTO `specs_template` VALUES (4, 'Sacré', 'Healer', 2);
INSERT INTO `specs_template` VALUES (5, 'Protection', 'Tank', 2);
INSERT INTO `specs_template` VALUES (6, 'Vindicte', 'Melee Damage (DPS)', 2);
INSERT INTO `specs_template` VALUES (7, 'Maîtrise des bêtes', 'Ranged Damage (DPS)', 3);
INSERT INTO `specs_template` VALUES (8, 'Précision', 'Ranged Damage (DPS)', 3);
INSERT INTO `specs_template` VALUES (9, 'Survie', 'Melee Damage (DPS)', 3);
INSERT INTO `specs_template` VALUES (10, 'Assassinat', 'Melee Damage (DPS)', 4);
INSERT INTO `specs_template` VALUES (11, 'Hors-la-loi', 'Melee Damage (DPS)', 4);
INSERT INTO `specs_template` VALUES (12, 'Finesse', 'Melee Damage (DPS)', 4);
INSERT INTO `specs_template` VALUES (13, 'Discipline', 'Healer', 5);
INSERT INTO `specs_template` VALUES (14, 'Sacré', 'Healer', 5);
INSERT INTO `specs_template` VALUES (15, 'Ombre', 'Magic Damage (DPS)', 5);
INSERT INTO `specs_template` VALUES (16, 'Élémentaire', 'Magic Damage (DPS)', 6);
INSERT INTO `specs_template` VALUES (17, 'Amélioration', 'Melee Damage (DPS)', 6);
INSERT INTO `specs_template` VALUES (18, 'Restauration', 'Healer', 6);
INSERT INTO `specs_template` VALUES (19, 'Arcanes', 'Magic Damage (DPS)', 7);
INSERT INTO `specs_template` VALUES (20, 'Feu', 'Magic Damage (DPS)', 7);
INSERT INTO `specs_template` VALUES (21, 'Givre', 'Magic Damage (DPS)', 7);
INSERT INTO `specs_template` VALUES (22, 'Affliction', 'Magic Damage (DPS)', 8);
INSERT INTO `specs_template` VALUES (23, 'Démonologie', 'Magic Damage (DPS)', 8);
INSERT INTO `specs_template` VALUES (24, 'Destruction', 'Magic Damage (DPS)', 8);
INSERT INTO `specs_template` VALUES (25, 'Maître brasseur', 'Tank', 9);
INSERT INTO `specs_template` VALUES (26, 'Tisse-brume', 'Healer', 9);
INSERT INTO `specs_template` VALUES (27, 'Marche-vent', 'Melee Damage (DPS)', 9);
INSERT INTO `specs_template` VALUES (28, 'Équilibre', 'Magic Damage (DPS)', 10);
INSERT INTO `specs_template` VALUES (29, 'Farouche', 'Melee Damage (DPS)', 10);
INSERT INTO `specs_template` VALUES (30, 'Gardien', 'Tank', 10);
INSERT INTO `specs_template` VALUES (31, 'Restauration', 'Healer', 10);
INSERT INTO `specs_template` VALUES (32, 'Dévastation', 'Melee Damage (DPS)', 11);
INSERT INTO `specs_template` VALUES (33, 'Vengeance', 'Tank', 11);
INSERT INTO `specs_template` VALUES (34, 'Sang', 'Tank', 12);
INSERT INTO `specs_template` VALUES (35, 'Givre', 'Melee Damage (DPS)', 12);
INSERT INTO `specs_template` VALUES (36, 'Impie', 'Melee Damage (DPS)', 12);

SET FOREIGN_KEY_CHECKS = 1;
