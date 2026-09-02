/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100418
 Source Host           : localhost:3306
 Source Schema         : db_enablink

 Target Server Type    : MySQL
 Target Server Version : 100418
 File Encoding         : 65001

 Date: 06/06/2022 23:51:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aplego_options
-- ----------------------------
DROP TABLE IF EXISTS `aplego_options`;
CREATE TABLE `aplego_options`  (
  `option_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_key` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `option_value` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`option_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for aplego_user
-- ----------------------------
DROP TABLE IF EXISTS `aplego_user`;
CREATE TABLE `aplego_user`  (
  `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(34) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `active` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `capability` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_login` datetime NOT NULL,
  `login_count` int UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 600 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for aplego_user_meta
-- ----------------------------
DROP TABLE IF EXISTS `aplego_user_meta`;
CREATE TABLE `aplego_user_meta`  (
  `meta_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `meta_key` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `meta_value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`meta_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `aplego_user_meta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `aplego_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 871 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_accompaniment
-- ----------------------------
DROP TABLE IF EXISTS `app_accompaniment`;
CREATE TABLE `app_accompaniment`  (
  `accompaniment_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `semester_id` int UNSIGNED NULL DEFAULT NULL,
  `schedule_student_id` int UNSIGNED NULL DEFAULT NULL,
  `volunteer_id` int UNSIGNED NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `student_status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'terjadwal',
  `volunteer_status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'terjadwal',
  `review` int NULL DEFAULT NULL,
  `review_note` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `new_room` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `new_day` int NULL DEFAULT NULL,
  `new_start_at` time NULL DEFAULT NULL,
  `new_end_at` time NULL DEFAULT NULL,
  `new_volunteer_id` int NULL DEFAULT NULL,
  `volunteer_change_status` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `accompaniment_note` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`accompaniment_id`) USING BTREE,
  INDEX `schedule_student_id`(`schedule_student_id`) USING BTREE,
  INDEX `volunteer_id`(`volunteer_id`) USING BTREE,
  INDEX `semester_id`(`semester_id`) USING BTREE,
  CONSTRAINT `app_accompaniment_ibfk_1` FOREIGN KEY (`schedule_student_id`) REFERENCES `app_schedule_student` (`schedule_student_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `app_accompaniment_ibfk_2` FOREIGN KEY (`volunteer_id`) REFERENCES `app_students` (`student_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `app_accompaniment_ibfk_3` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13273 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_faculties
-- ----------------------------
DROP TABLE IF EXISTS `app_faculties`;
CREATE TABLE `app_faculties`  (
  `faculty_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `faculty_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`faculty_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_majors
-- ----------------------------
DROP TABLE IF EXISTS `app_majors`;
CREATE TABLE `app_majors`  (
  `majors_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `faculty_id` int UNSIGNED NOT NULL,
  `majors_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `majors_focus` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`majors_id`) USING BTREE,
  INDEX `faculty_id`(`faculty_id`) USING BTREE,
  CONSTRAINT `app_majors_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `app_faculties` (`faculty_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_notifications
-- ----------------------------
DROP TABLE IF EXISTS `app_notifications`;
CREATE TABLE `app_notifications`  (
  `notif_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `notif_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notif_type_id` int NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`notif_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_payout_items
-- ----------------------------
DROP TABLE IF EXISTS `app_payout_items`;
CREATE TABLE `app_payout_items`  (
  `item_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `payout_id` int UNSIGNED NULL DEFAULT NULL,
  `volunteer_id` int UNSIGNED NULL DEFAULT NULL,
  `payout_value` int UNSIGNED NULL DEFAULT NULL,
  `pertemuan` int UNSIGNED NULL DEFAULT NULL,
  `paid_confirm_id` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`item_id`) USING BTREE,
  INDEX `payout_id`(`payout_id`) USING BTREE,
  INDEX `volunteer_id`(`volunteer_id`) USING BTREE,
  INDEX `paid_confirm_id`(`paid_confirm_id`) USING BTREE,
  CONSTRAINT `app_payout_items_ibfk_1` FOREIGN KEY (`payout_id`) REFERENCES `app_payouts` (`payout_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `app_payout_items_ibfk_2` FOREIGN KEY (`volunteer_id`) REFERENCES `app_students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `app_payout_items_ibfk_3` FOREIGN KEY (`paid_confirm_id`) REFERENCES `aplego_user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_payouts
-- ----------------------------
DROP TABLE IF EXISTS `app_payouts`;
CREATE TABLE `app_payouts`  (
  `payout_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NULL DEFAULT NULL,
  `payout_label` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `payout_max_date` date NULL DEFAULT NULL,
  `payout_keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`payout_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `app_payouts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `aplego_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_permit
-- ----------------------------
DROP TABLE IF EXISTS `app_permit`;
CREATE TABLE `app_permit`  (
  `permit_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `accompaniment_id` int UNSIGNED NULL DEFAULT NULL,
  `semester_id` int UNSIGNED NULL DEFAULT NULL,
  `student_id` int UNSIGNED NULL DEFAULT NULL,
  `student` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `clarification` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `new_volunteer_id` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'menunggu konfirmasi',
  PRIMARY KEY (`permit_id`) USING BTREE,
  INDEX `accompaniment_id`(`accompaniment_id`) USING BTREE,
  INDEX `semester_id`(`semester_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  CONSTRAINT `app_permit_ibfk_1` FOREIGN KEY (`accompaniment_id`) REFERENCES `app_accompaniment` (`accompaniment_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `app_permit_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `app_permit_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 287 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_schedule_student
-- ----------------------------
DROP TABLE IF EXISTS `app_schedule_student`;
CREATE TABLE `app_schedule_student`  (
  `schedule_student_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int UNSIGNED NOT NULL,
  `semester_id` int UNSIGNED NULL DEFAULT NULL,
  `start_at` time NULL DEFAULT NULL,
  `end_at` time NULL DEFAULT NULL,
  `day` int NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `room` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `courses` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sks` int NULL DEFAULT NULL,
  `schedule_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'kuliah',
  `deleted` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'false',
  PRIMARY KEY (`schedule_student_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  INDEX `semester_id`(`semester_id`) USING BTREE,
  CONSTRAINT `app_schedule_student_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_schedule_student_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1694 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_schedule_student_rev
-- ----------------------------
DROP TABLE IF EXISTS `app_schedule_student_rev`;
CREATE TABLE `app_schedule_student_rev`  (
  `schedule_student_rev_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int UNSIGNED NOT NULL,
  `semester_id` int UNSIGNED NULL DEFAULT NULL,
  `rev` int NULL DEFAULT 1,
  `start_at` time NULL DEFAULT NULL,
  `end_at` time NULL DEFAULT NULL,
  `day` int NULL DEFAULT NULL,
  `room` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `courses` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sks` int NULL DEFAULT NULL,
  `schedule_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'kuliah',
  `deleted` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'false',
  PRIMARY KEY (`schedule_student_rev_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  INDEX `semester_id`(`semester_id`) USING BTREE,
  CONSTRAINT `app_schedule_student_rev_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_schedule_student_rev_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1699 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_schedule_volunteer
-- ----------------------------
DROP TABLE IF EXISTS `app_schedule_volunteer`;
CREATE TABLE `app_schedule_volunteer`  (
  `schedule_volunteer_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int UNSIGNED NOT NULL,
  `semester_id` int UNSIGNED NULL DEFAULT NULL,
  `start_at` time NULL DEFAULT NULL,
  `end_at` time NULL DEFAULT NULL,
  `day` int NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `clarification` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `schedule_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'kuliah',
  `room` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'kosong',
  `deleted` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'false',
  PRIMARY KEY (`schedule_volunteer_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  INDEX `semester_id`(`semester_id`) USING BTREE,
  CONSTRAINT `app_schedule_volunteer_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_schedule_volunteer_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4067 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_schedule_volunteer_rev
-- ----------------------------
DROP TABLE IF EXISTS `app_schedule_volunteer_rev`;
CREATE TABLE `app_schedule_volunteer_rev`  (
  `schedule_volunteer_rev_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int UNSIGNED NOT NULL,
  `semester_id` int UNSIGNED NULL DEFAULT NULL,
  `rev` int NULL DEFAULT NULL,
  `start_at` time NULL DEFAULT NULL,
  `end_at` time NULL DEFAULT NULL,
  `day` int NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `clarification` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `schedule_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'kuliah',
  `room` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'kosong',
  `deleted` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'false',
  PRIMARY KEY (`schedule_volunteer_rev_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  INDEX `semester_id`(`semester_id`) USING BTREE,
  CONSTRAINT `app_schedule_volunteer_rev_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_schedule_volunteer_rev_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_semester
-- ----------------------------
DROP TABLE IF EXISTS `app_semester`;
CREATE TABLE `app_semester`  (
  `semester_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `semester_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `start_at` date NULL DEFAULT NULL,
  `end_at` date NULL DEFAULT NULL,
  `uts_start_at` date NULL DEFAULT NULL,
  `uts_end_at` date NULL DEFAULT NULL,
  `uas_start_at` date NULL DEFAULT NULL,
  `uas_end_at` date NULL DEFAULT NULL,
  PRIMARY KEY (`semester_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_student_active
-- ----------------------------
DROP TABLE IF EXISTS `app_student_active`;
CREATE TABLE `app_student_active`  (
  `register_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int UNSIGNED NULL DEFAULT NULL,
  `semester_id` int UNSIGNED NULL DEFAULT NULL,
  `approver_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `last_approve_at` datetime NULL DEFAULT NULL,
  `last_rev_at` datetime NULL DEFAULT NULL,
  `rev` int NULL DEFAULT 0,
  `rev_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`register_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  INDEX `semester_id`(`semester_id`) USING BTREE,
  INDEX `approver_id`(`approver_id`) USING BTREE,
  CONSTRAINT `app_student_active_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `app_students` (`student_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_student_active_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `app_semester` (`semester_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `app_student_active_ibfk_3` FOREIGN KEY (`approver_id`) REFERENCES `aplego_user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 639 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for app_students
-- ----------------------------
DROP TABLE IF EXISTS `app_students`;
CREATE TABLE `app_students`  (
  `student_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `majors_id` int UNSIGNED NOT NULL,
  `nick_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `class_of_college` year NULL DEFAULT NULL,
  `no_hp` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ktm` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `birth_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `majors_id`(`majors_id`) USING BTREE,
  CONSTRAINT `app_students_ibfk_2` FOREIGN KEY (`majors_id`) REFERENCES `app_majors` (`majors_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 594 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ci_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions`  (
  `id` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `timestamp` int UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ci_sessions_timestamp`(`timestamp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for app_accompaniment_base_view
-- ----------------------------
DROP VIEW IF EXISTS `app_accompaniment_base_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_accompaniment_base_view` AS select `app_accompaniment`.`accompaniment_id` AS `accompaniment_id`,`app_accompaniment`.`semester_id` AS `semester_id`,`app_accompaniment`.`schedule_student_id` AS `schedule_student_id`,(case when ((coalesce(`app_accompaniment`.`volunteer_change_status`,'') = '') or (`app_accompaniment`.`volunteer_change_status` = 'rejected') or (`app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation')) then `app_accompaniment`.`volunteer_id` else `app_accompaniment`.`new_volunteer_id` end) AS `volunteer_id`,`app_accompaniment`.`volunteer_change_status` AS `volunteer_change_status`,`app_accompaniment`.`new_volunteer_id` AS `new_volunteer_id`,`app_accompaniment`.`new_start_at` AS `start_at`,`app_accompaniment`.`new_end_at` AS `end_at`,`app_accompaniment`.`new_day` AS `new_day`,`volunteer`.`nick_name` AS `nick_name`,`app_accompaniment`.`date` AS `date`,`app_accompaniment`.`student_status` AS `student_status`,`app_accompaniment`.`volunteer_status` AS `volunteer_status`,`app_accompaniment`.`accompaniment_note` AS `accompaniment_note`,`app_accompaniment`.`review_note` AS `review_note`,`app_accompaniment`.`review` AS `review`,`app_accompaniment`.`created_at` AS `created_at`,`app_accompaniment`.`updated_at` AS `updated_at` from (`app_accompaniment` join `app_students` `volunteer` on((`volunteer`.`student_id` = (case when ((coalesce(`app_accompaniment`.`volunteer_change_status`,'') = '') or (`app_accompaniment`.`volunteer_change_status` = 'rejected') or (`app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation')) then `app_accompaniment`.`volunteer_id` else `app_accompaniment`.`new_volunteer_id` end)))) ;

-- ----------------------------
-- View structure for app_accompaniment_schedule_volunteer_view
-- ----------------------------
DROP VIEW IF EXISTS `app_accompaniment_schedule_volunteer_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_accompaniment_schedule_volunteer_view` AS select `app_accompaniment`.`accompaniment_id` AS `accompaniment_id`,`app_schedule_student`.`student_id` AS `student_id`,`app_schedule_student`.`schedule_type` AS `schedule_type`,`app_accompaniment`.`semester_id` AS `semester_id`,`app_accompaniment`.`schedule_student_id` AS `schedule_student_id`,`app_accompaniment`.`accompaniment_note` AS `accompaniment_note`,`app_accompaniment`.`review_note` AS `review_note`,`app_accompaniment`.`review` AS `review`,(case when ((coalesce(`app_accompaniment`.`volunteer_change_status`,'') = '') or (`app_accompaniment`.`volunteer_change_status` = 'rejected') or (`app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation')) then `app_accompaniment`.`volunteer_id` else `app_accompaniment`.`new_volunteer_id` end) AS `volunteer_id`,`app_accompaniment`.`volunteer_change_status` AS `volunteer_change_status`,`app_accompaniment`.`new_volunteer_id` AS `new_volunteer_id`,(case when (coalesce(`app_accompaniment`.`new_start_at`,'') = '') then `app_schedule_student`.`start_at` else `app_accompaniment`.`new_start_at` end) AS `start_at`,(case when (coalesce(`app_accompaniment`.`new_end_at`,'') = '') then `app_schedule_student`.`end_at` else `app_accompaniment`.`new_end_at` end) AS `end_at`,`app_accompaniment`.`new_day` AS `new_day`,(case when (coalesce(`app_accompaniment`.`new_day`,'') = '') then `app_schedule_student`.`day` else `app_accompaniment`.`new_day` end) AS `day`,`app_accompaniment`.`date` AS `date` from (`app_accompaniment` join `app_schedule_student` on(((`app_accompaniment`.`schedule_student_id` = `app_schedule_student`.`schedule_student_id`) and (`app_accompaniment`.`semester_id` = `app_schedule_student`.`semester_id`)))) ;

-- ----------------------------
-- View structure for app_accompaniment_view
-- ----------------------------
DROP VIEW IF EXISTS `app_accompaniment_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_accompaniment_view` AS SELECT
	`app_accompaniment`.`accompaniment_id` AS `accompaniment_id`,
	`app_students`.`user_id` AS `user_id`,
	`user_difabel`.`username` AS `username`,
	`user_difabel`.`name` AS `name`,
	`app_schedule_student`.`student_id` AS `student_id`,
	`app_students`.`majors_id` AS `majors_id`,
	`major`.`majors_name` AS `majors_name`,
	`major`.`majors_focus` AS `majors_focus`,
	`major`.`faculty_id` AS `faculty_id`,
	`faculty`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp`,
	`app_students`.`photo` AS `photo`,
	`app_accompaniment`.`semester_id` AS `semester_id`,
	`app_accompaniment`.`schedule_student_id` AS `schedule_student_id`,(
	CASE
			
			WHEN ( COALESCE ( `app_accompaniment`.`new_start_at`, '' ) = '' ) THEN
			`app_schedule_student`.`start_at` ELSE `app_accompaniment`.`new_start_at` 
		END 
			) AS `start_at`,(
		CASE
				
				WHEN ( COALESCE ( `app_accompaniment`.`new_end_at`, '' ) = '' ) THEN
				`app_schedule_student`.`end_at` ELSE `app_accompaniment`.`new_end_at` 
			END 
				) AS `end_at`,(
			CASE
					
					WHEN ( COALESCE ( `app_accompaniment`.`new_day`, '' ) = '' ) THEN
					`app_schedule_student`.`day` ELSE `app_accompaniment`.`new_day` 
				END 
					) AS `day`,(
				CASE
						
						WHEN ( COALESCE ( `app_accompaniment`.`new_room`, '' ) = '' ) THEN
						`app_schedule_student`.`room` ELSE `app_accompaniment`.`new_room` 
					END 
					) AS `room`,
					`app_accompaniment`.`date` AS `date`,
					`app_schedule_student`.`courses` AS `courses`,
					`app_schedule_student`.`sks` AS `sks`,
					`app_schedule_student`.`schedule_type` AS `schedule_type`,
					`app_accompaniment`.`new_volunteer_id` AS `new_volunteer_id`,
					`app_accompaniment`.`new_day` AS `new_day`,(
					CASE
							
							WHEN ((
									COALESCE ( `app_accompaniment`.`volunteer_change_status`, '' ) = '' 
									) 
								OR ( `app_accompaniment`.`volunteer_change_status` = 'rejected' ) 
								OR ( `app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation' )) THEN
								`app_accompaniment`.`volunteer_id` ELSE `app_accompaniment`.`new_volunteer_id` 
							END 
							) AS `volunteer_id`,
							`app_accompaniment`.`volunteer_change_status` AS `volunteer_change_status`,
							`student_volunteer`.`majors_id` AS `volunteer_majors_id`,
							`major_volunteer`.`majors_name` AS `volunteer_majors_name`,
							`major_volunteer`.`majors_focus` AS `volunteer_majors_focus`,
							`major_volunteer`.`faculty_id` AS `volunteer_faculty_id`,
							`faculty_volunteer`.`faculty_name` AS `volunteer_faculty_name`,
							`student_volunteer`.`nick_name` AS `volunteer_nick_name`,
							`student_volunteer`.`class_of_college` AS `volunteer_class_of_college`,
							`student_volunteer`.`no_hp` AS `volunteer_no_hp`,
							`student_volunteer`.`photo` AS `volunteer_photo`,
							`user_volunteer`.`user_id` AS `volunteer_user_id`,
							`user_volunteer`.`username` AS `volunteer_username`,
							`user_volunteer`.`name` AS `volunteer_name`,
							`app_accompaniment`.`student_status` AS `student_status`,
							`app_accompaniment`.`volunteer_status` AS `volunteer_status`,
							`app_accompaniment`.`accompaniment_note` AS `accompaniment_note`,
							`app_accompaniment`.`review_note` AS `review_note`,
							`app_accompaniment`.`review` AS `review`,
							`app_accompaniment`.`created_at` AS `created_at`,
							`app_accompaniment`.`updated_at` AS `updated_at` 
						FROM
							(((((((((
																`app_accompaniment`
																JOIN `app_schedule_student` ON (((
																			`app_accompaniment`.`schedule_student_id` = `app_schedule_student`.`schedule_student_id` 
																			) 
																	AND ( `app_accompaniment`.`semester_id` = `app_schedule_student`.`semester_id` ))))
															JOIN `app_students` ON ((
																	`app_students`.`student_id` = `app_schedule_student`.`student_id` 
																)))
														JOIN `app_majors` `major` ON ((
																`major`.`majors_id` = `app_students`.`majors_id` 
															)))
													JOIN `app_faculties` `faculty` ON ((
															`faculty`.`faculty_id` = `major`.`faculty_id` 
														)))
												JOIN `aplego_user` `user_difabel` ON ((
														`user_difabel`.`user_id` = `app_students`.`user_id` 
													)))
											JOIN `app_students` `student_volunteer` ON ((
													`student_volunteer`.`student_id` = (
													CASE
															
															WHEN ((
																	COALESCE ( `app_accompaniment`.`volunteer_change_status`, '' ) = '' 
																	) 
																OR ( `app_accompaniment`.`volunteer_change_status` = 'rejected' ) 
																OR ( `app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation' )) THEN
																`app_accompaniment`.`volunteer_id` ELSE `app_accompaniment`.`new_volunteer_id` 
															END 
															))))
												JOIN `aplego_user` `user_volunteer` ON ((
														`user_volunteer`.`user_id` = `student_volunteer`.`user_id` 
													)))
											JOIN `app_majors` `major_volunteer` ON ((
													`major_volunteer`.`majors_id` = `student_volunteer`.`majors_id` 
												)))
										JOIN `app_faculties` `faculty_volunteer` ON ((
												`faculty_volunteer`.`faculty_id` = `major_volunteer`.`faculty_id` 
											))) 
								ORDER BY
								`app_accompaniment`.`date`,
	`app_schedule_student`.`start_at` ;

-- ----------------------------
-- View structure for app_accompaniment_view_update
-- ----------------------------
DROP VIEW IF EXISTS `app_accompaniment_view_update`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_accompaniment_view_update` AS select `app_accompaniment`.`accompaniment_id` AS `accompaniment_id`,`app_students`.`user_id` AS `user_id`,`user_difabel`.`username` AS `username`,`user_difabel`.`name` AS `name`,`aplego_user_meta`.`meta_value` AS `jenis_disabilitas`,`app_schedule_student`.`student_id` AS `student_id`,`app_students`.`majors_id` AS `majors_id`,`major`.`majors_name` AS `majors_name`,`major`.`faculty_id` AS `faculty_id`,`faculty`.`faculty_name` AS `faculty_name`,`app_students`.`nick_name` AS `nick_name`,`app_students`.`class_of_college` AS `class_of_college`,`app_students`.`no_hp` AS `no_hp`,`app_students`.`photo` AS `photo`,`app_accompaniment`.`semester_id` AS `semester_id`,`app_accompaniment`.`schedule_student_id` AS `schedule_student_id`,`app_schedule_student`.`start_at` AS `start_at`,`app_schedule_student`.`end_at` AS `end_at`,`app_schedule_student`.`day` AS `day`,`app_schedule_student`.`room` AS `room`,`app_schedule_student`.`courses` AS `courses`,`app_schedule_student`.`sks` AS `sks`,`app_accompaniment`.`volunteer_id` AS `volunteer_id`,`student_volunteer`.`majors_id` AS `volunteer_majors_id`,`major_volunteer`.`majors_name` AS `volunteer_majors_name`,`major_volunteer`.`faculty_id` AS `volunteer_faculty_id`,`faculty_volunteer`.`faculty_name` AS `volunteer_faculty_name`,`student_volunteer`.`nick_name` AS `volunteer_nick_name`,`student_volunteer`.`class_of_college` AS `volunteer_class_of_college`,`student_volunteer`.`no_hp` AS `volunteer_no_hp`,`student_volunteer`.`photo` AS `volunteer_photo`,`user_volunteer`.`user_id` AS `volunteer_user_id`,`user_volunteer`.`username` AS `volunteer_username`,`user_volunteer`.`name` AS `volunteer_name`,`app_accompaniment`.`date` AS `date`,`app_accompaniment`.`student_status` AS `student_status`,`app_accompaniment`.`volunteer_status` AS `volunteer_status`,`app_accompaniment`.`review` AS `review`,`app_accompaniment`.`created_at` AS `created_at`,`app_accompaniment`.`updated_at` AS `updated_at` from (((((((((((`app_accompaniment` join `app_schedule_student` on(((`app_accompaniment`.`schedule_student_id` = `app_schedule_student`.`schedule_student_id`) and (`app_accompaniment`.`semester_id` = `app_schedule_student`.`semester_id`)))) join `app_students` on((`app_students`.`student_id` = `app_schedule_student`.`student_id`))) join `app_majors` `major` on((`major`.`majors_id` = `app_students`.`majors_id`))) join `app_faculties` `faculty` on((`faculty`.`faculty_id` = `major`.`faculty_id`))) join `aplego_user` `user_difabel` on((`user_difabel`.`user_id` = `app_students`.`user_id`))) join `app_students` `student_volunteer` on((`student_volunteer`.`student_id` = `app_accompaniment`.`volunteer_id`))) join `aplego_user` `user_volunteer` on((`user_volunteer`.`user_id` = `student_volunteer`.`user_id`))) join `app_students` `data_difabel` on((`data_difabel`.`student_id` = `app_accompaniment`.`schedule_student_id`))) join `aplego_user_meta` on((`aplego_user_meta`.`user_id` = `data_difabel`.`user_id`))) join `app_majors` `major_volunteer` on((`major_volunteer`.`majors_id` = `student_volunteer`.`majors_id`))) join `app_faculties` `faculty_volunteer` on((`faculty_volunteer`.`faculty_id` = `major_volunteer`.`faculty_id`))) order by `app_accompaniment`.`date`,`app_schedule_student`.`start_at` ;

-- ----------------------------
-- View structure for app_chart_accompainiment_pendampingan_view
-- ----------------------------
DROP VIEW IF EXISTS `app_chart_accompainiment_pendampingan_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_chart_accompainiment_pendampingan_view` AS SELECT
	`app_accompaniment`.`semester_id` AS `semester_id`,
	`app_schedule_student`.`student_id` AS `student_id`,
	date_format( `app_accompaniment`.`date`, '%Y-%m' ) AS `date`,
	sum(
	IF
	(( isnull( `app_accompaniment`.`student_status` ) OR ( `app_accompaniment`.`student_status` = 'terjadwal' )), 1, 0 )) AS `terjadwal`,
	sum(
	IF
	(( isnull( `app_accompaniment`.`student_status` ) OR ( `app_accompaniment`.`student_status` = 'Dilihat' )), 1, 0 )) AS `belum_datang`,
	sum(
	IF
	(( `app_accompaniment`.`student_status` = 'Selesai' ), 1, 0 )) AS `selesai`,
	sum(
	IF
	(( `app_accompaniment`.`student_status` = 'Izin' ), 1, 0 )) AS `izin`,
	sum(
	IF
	(( `app_accompaniment`.`student_status` = 'Tidak Didampingi' ), 1, 0 )) AS `tidak_datang` 
FROM
	(
		`app_accompaniment`
		JOIN `app_schedule_student` ON ((
				`app_accompaniment`.`schedule_student_id` = `app_schedule_student`.`schedule_student_id` 
			))) 
GROUP BY
	`app_accompaniment`.`semester_id`,
	`app_schedule_student`.`student_id`,
	date_format( `app_accompaniment`.`date`, '%Y-%m' ) ;

-- ----------------------------
-- View structure for app_chart_accompainiment_view
-- ----------------------------
DROP VIEW IF EXISTS `app_chart_accompainiment_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_chart_accompainiment_view` AS SELECT
	`app_accompaniment`.`semester_id` AS `semester_id`,
	date_format( `app_accompaniment`.`date`, '%Y-%m' ) AS `date`,
	sum(
	IF
	(( isnull( `app_accompaniment`.`volunteer_status` ) OR ( `app_accompaniment`.`volunteer_status` = 'terjadwal' )), 1, 0 )) AS `terjadwal`,
	sum(
	IF
	(( isnull( `app_accompaniment`.`volunteer_status` ) OR ( `app_accompaniment`.`volunteer_status` = 'Dilihat' )), 1, 0 )) AS `belum_datang`,
	sum(
	IF
	(( `app_accompaniment`.`volunteer_status` = 'Selesai' ), 1, 0 )) AS `selesai`,
	sum(
	IF
	(( `app_accompaniment`.`volunteer_status` = 'Izin' ), 1, 0 )) AS `izin`,
	sum(
	IF
	(( `app_accompaniment`.`volunteer_status` = 'Tidak Hadir' ), 1, 0 )) AS `tidak_datang` 
FROM
	`app_accompaniment` 
GROUP BY
	`app_accompaniment`.`semester_id`,
	date_format( `app_accompaniment`.`date`, '%Y-%m' ) ;

-- ----------------------------
-- View structure for app_chart_accompainiment_volunteer_view
-- ----------------------------
DROP VIEW IF EXISTS `app_chart_accompainiment_volunteer_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_chart_accompainiment_volunteer_view` AS SELECT
	`app_accompaniment`.`semester_id` AS `semester_id`,(
	CASE
			
			WHEN ((
					COALESCE ( `app_accompaniment`.`volunteer_change_status`, '' ) = '' 
					) 
				OR ( `app_accompaniment`.`volunteer_change_status` = 'rejected' ) 
				OR ( `app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation' )) THEN
				`app_accompaniment`.`volunteer_id` ELSE `app_accompaniment`.`new_volunteer_id` 
			END 
			) AS `volunteer_id`,
			date_format( `app_accompaniment`.`date`, '%Y-%m' ) AS `date`,
			sum(
			IF
			(( isnull( `app_accompaniment`.`volunteer_status` ) OR ( `app_accompaniment`.`volunteer_status` = 'terjadwal' )), 1, 0 )) AS `terjadwal`,
			sum(
			IF
			(( isnull( `app_accompaniment`.`volunteer_status` ) OR ( `app_accompaniment`.`volunteer_status` = 'Dilihat' )), 1, 0 )) AS `belum_datang`,
			sum(
			IF
			(( `app_accompaniment`.`volunteer_status` = 'Selesai' ), 1, 0 )) AS `selesai`,
			sum(
			IF
			(( `app_accompaniment`.`volunteer_status` = 'Izin' ), 1, 0 )) AS `izin`,
			sum(
			IF
			(( `app_accompaniment`.`volunteer_status` = 'Tidak Mendampingi' ), 1, 0 )) AS `tidak_datang` 
		FROM
			`app_accompaniment` 
		GROUP BY
			`app_accompaniment`.`semester_id`,(
			CASE
					
					WHEN ((
							COALESCE ( `app_accompaniment`.`volunteer_change_status`, '' ) = '' 
							) 
						OR ( `app_accompaniment`.`volunteer_change_status` = 'rejected' ) 
						OR ( `app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation' )) THEN
						`app_accompaniment`.`volunteer_id` ELSE `app_accompaniment`.`new_volunteer_id` 
					END 
					),
	date_format( `app_accompaniment`.`date`, '%Y-%m' ) ;

-- ----------------------------
-- View structure for app_faculty_view
-- ----------------------------
DROP VIEW IF EXISTS `app_faculty_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_faculty_view` AS SELECT
	`app_faculties`.`faculty_id` AS `faculty_id`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_majors`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`majors_focus` AS `majors_focus`
FROM
	(
		`app_faculties`
		LEFT JOIN `app_majors` ON ((
			`app_majors`.`faculty_id` = `app_faculties`.`faculty_id` 
	))) ;

-- ----------------------------
-- View structure for app_group_schedule_volunteer_view
-- ----------------------------
DROP VIEW IF EXISTS `app_group_schedule_volunteer_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_group_schedule_volunteer_view` AS select `app_students`.`student_id` AS `student_id`,`app_students`.`user_id` AS `user_id`,`aplego_user`.`name` AS `name`,`app_students`.`nick_name` AS `nick_name`,`app_students`.`majors_id` AS `majors_id`,`app_student_active`.`semester_id` AS `semester_id`,`major`.`majors_name` AS `majors_name`,`major`.`faculty_id` AS `faculty_id`,`faculty`.`faculty_name` AS `faculty_name`,`app_students`.`class_of_college` AS `class_of_college`,`app_students`.`no_hp` AS `no_hp`,`app_students`.`photo` AS `photo`,`get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,1) AS `day1`,`get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,2) AS `day2`,`get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,3) AS `day3`,`get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,4) AS `day4`,`get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,5) AS `day5`,`get_json_jadwal_volunteer_day`(`app_student_active`.`semester_id`,`app_students`.`student_id`,6) AS `day6`,(select count(0) from `app_accompaniment` where (((case when ((coalesce(`app_accompaniment`.`volunteer_change_status`,'') = '') or (`app_accompaniment`.`volunteer_change_status` = 'rejected') or (`app_accompaniment`.`volunteer_change_status` = 'awaiting_confirmation')) then `app_accompaniment`.`volunteer_id` else `app_accompaniment`.`new_volunteer_id` end) = `app_students`.`student_id`) and (`app_accompaniment`.`semester_id` = `app_student_active`.`semester_id`))) AS `amount`,0 AS `frequency` from ((((`app_students` join `app_student_active` on(((`app_student_active`.`student_id` = `app_students`.`student_id`) and (`app_student_active`.`approver_id` is not null)))) join `aplego_user` on((`aplego_user`.`user_id` = `app_students`.`user_id`))) join `app_majors` `major` on((`major`.`majors_id` = `app_students`.`majors_id`))) join `app_faculties` `faculty` on((`faculty`.`faculty_id` = `major`.`faculty_id`))) where (`aplego_user`.`capability` = 'volunteer') ;

-- ----------------------------
-- View structure for app_permit_view
-- ----------------------------
DROP VIEW IF EXISTS `app_permit_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_permit_view` AS select `app_permit`.`permit_id` AS `permit_id`,`app_permit`.`accompaniment_id` AS `accompaniment_id`,`app_permit`.`semester_id` AS `semester_id`,`app_accompaniment`.`schedule_student_id` AS `schedule_student_id`,`app_accompaniment`.`volunteer_id` AS `volunteer_id`,`app_accompaniment`.`date` AS `date`,`app_accompaniment`.`student_status` AS `student_status`,`app_accompaniment`.`volunteer_status` AS `volunteer_status`,`app_accompaniment`.`review` AS `review`,`app_schedule_student`.`start_at` AS `start_at`,`app_schedule_student`.`end_at` AS `end_at`,`app_schedule_student`.`day` AS `day`,`app_schedule_student`.`room` AS `room`,`app_schedule_student`.`courses` AS `courses`,`app_schedule_student`.`sks` AS `sks`,`app_permit`.`student_id` AS `student_id`,`volunteer`.`nick_name` AS `volunteer_nick_name`,`app_students`.`user_id` AS `user_id`,`aplego_user`.`name` AS `name`,`aplego_user`.`username` AS `username`,`app_students`.`majors_id` AS `majors_id`,`app_students`.`nick_name` AS `nick_name`,`app_students`.`class_of_college` AS `class_of_college`,`app_students`.`no_hp` AS `no_hp`,`app_permit`.`student` AS `student`,`app_permit`.`clarification` AS `clarification`,`app_permit`.`new_volunteer_id` AS `new_volunteer_id`,`app_permit`.`status` AS `status`,`app_permit`.`created_at` AS `created_at` from (((((`app_permit` join `app_accompaniment` on(((`app_accompaniment`.`accompaniment_id` = `app_permit`.`accompaniment_id`) and (`app_accompaniment`.`semester_id` = `app_permit`.`semester_id`)))) join `app_schedule_student` on(((`app_accompaniment`.`schedule_student_id` = `app_schedule_student`.`schedule_student_id`) and (`app_accompaniment`.`semester_id` = `app_schedule_student`.`semester_id`)))) join `app_students` on((`app_students`.`student_id` = `app_permit`.`student_id`))) join `aplego_user` on((`aplego_user`.`user_id` = `app_students`.`user_id`))) left join `app_students` `volunteer` on((`app_permit`.`new_volunteer_id` = `volunteer`.`student_id`))) ;

-- ----------------------------
-- View structure for app_prepar_schedule_student_view
-- ----------------------------
DROP VIEW IF EXISTS `app_prepar_schedule_student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_prepar_schedule_student_view` AS select `app_schedule_student`.`schedule_student_id` AS `schedule_student_id`,`app_schedule_student`.`student_id` AS `student_id`,`app_schedule_student`.`semester_id` AS `semester_id`,`app_schedule_student`.`start_at` AS `start_at`,`app_schedule_student`.`end_at` AS `end_at`,`app_schedule_student`.`day` AS `day`,`app_schedule_student`.`room` AS `room`,`app_schedule_student`.`courses` AS `courses`,`app_schedule_student`.`sks` AS `sks` from `app_schedule_student` where (`app_schedule_student`.`deleted` = 'false') ;

-- ----------------------------
-- View structure for app_prepar_schedule_volunteer_view
-- ----------------------------
DROP VIEW IF EXISTS `app_prepar_schedule_volunteer_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_prepar_schedule_volunteer_view` AS select `app_schedule_volunteer`.`schedule_volunteer_id` AS `schedule_volunteer_id`,`app_schedule_volunteer`.`student_id` AS `student_id`,`app_students`.`user_id` AS `user_id`,`app_students`.`nick_name` AS `nick_name`,`app_schedule_volunteer`.`semester_id` AS `semester_id`,`app_schedule_volunteer`.`start_at` AS `start_at`,`app_schedule_volunteer`.`end_at` AS `end_at`,`app_schedule_volunteer`.`day` AS `day` from ((`app_schedule_volunteer` join `app_student_active` on(((`app_student_active`.`student_id` = `app_schedule_volunteer`.`student_id`) and (`app_student_active`.`semester_id` = `app_schedule_volunteer`.`semester_id`) and (`app_student_active`.`approver_id` is not null) and (`app_schedule_volunteer`.`deleted` = 'false')))) join `app_students` on((`app_students`.`student_id` = `app_schedule_volunteer`.`student_id`))) ;

-- ----------------------------
-- View structure for app_report_volunteer_view
-- ----------------------------
DROP VIEW IF EXISTS `app_report_volunteer_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_report_volunteer_view` AS select `app_accompaniment`.`volunteer_id` AS `volunteer_id`,`app_accompaniment`.`semester_id` AS `semester_id`,`app_students`.`nick_name` AS `nick_name`,`app_students`.`user_id` AS `user_id`,`app_students`.`student_id` AS `student_id`,`aplego_user`.`username` AS `username`,`aplego_user`.`name` AS `name`,sum(if((isnull(`app_accompaniment`.`volunteer_status`) or (`app_accompaniment`.`volunteer_status` = 'Dilihat') or (`app_accompaniment`.`volunteer_status` = 'Dikonfirmasi')),1,0)) AS `count_belum_datang`,sum(if((`app_accompaniment`.`volunteer_status` = 'Selesai'),1,0)) AS `count_selesai`,sum(if((`app_accompaniment`.`volunteer_status` = 'Izin'),1,0)) AS `count_izin`,sum(if((`app_accompaniment`.`volunteer_status` = 'Tidak Hadir'),1,0)) AS `count_tidak_datang`,max(`app_accompaniment`.`review`) AS `max_review`,min(`app_accompaniment`.`review`) AS `min_review`,avg(`app_accompaniment`.`review`) AS `avg_review` from ((`app_accompaniment` join `app_students` on((`app_students`.`student_id` = `app_accompaniment`.`volunteer_id`))) join `aplego_user` on((`aplego_user`.`user_id` = `app_students`.`user_id`))) group by `app_accompaniment`.`semester_id`,`app_accompaniment`.`volunteer_id` ;

-- ----------------------------
-- View structure for app_schedule_exam_student_view
-- ----------------------------
DROP VIEW IF EXISTS `app_schedule_exam_student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_schedule_exam_student_view` AS SELECT
	`aplego_user`.`user_id` AS `user_id`,
	`aplego_user`.`username` AS `username`,
	`aplego_user`.`name` AS `name`,
	`aplego_user`.`email` AS `email`,
	`app_students`.`student_id` AS `student_id`,
	`app_students`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`majors_focus` AS `majors_focus`,
	`app_majors`.`faculty_id` AS `faculty_id`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp`,
	`app_schedule_student`.`schedule_student_id` AS `schedule_student_id`,
	`app_schedule_student`.`semester_id` AS `semester_id`,
	`app_schedule_student`.`start_at` AS `start_at`,
	`app_schedule_student`.`end_at` AS `end_at`,
	`app_schedule_student`.`date` AS `date`,
	`app_schedule_student`.`room` AS `room`,
	`app_schedule_student`.`courses` AS `courses`,
	`app_schedule_student`.`schedule_type` AS `schedule_type`,
	`app_schedule_student`.`sks` AS `sks` 
FROM
	((((
					`aplego_user`
					JOIN `app_students` ON ((
							`app_students`.`user_id` = `aplego_user`.`user_id` 
						)))
				JOIN `app_majors` ON ((
						`app_majors`.`majors_id` = `app_students`.`majors_id` 
					)))
			JOIN `app_faculties` ON ((
					`app_faculties`.`faculty_id` = `app_majors`.`faculty_id` 
				)))
		LEFT JOIN `app_schedule_student` ON (((
					`app_schedule_student`.`student_id` = `app_students`.`student_id` 
					)
		  AND  (`app_schedule_student`.`date` IS NOT NULL)
			AND ( `app_schedule_student`.`deleted` = 'false' )))) 
WHERE
	( `aplego_user`.`capability` = 'difabel' ) 
ORDER BY
	`aplego_user`.`name`,
	`app_schedule_student`.`day`,
	`app_schedule_student`.`start_at` ;

-- ----------------------------
-- View structure for app_schedule_exam_volunteer_view
-- ----------------------------
DROP VIEW IF EXISTS `app_schedule_exam_volunteer_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_schedule_exam_volunteer_view` AS SELECT
	`aplego_user`.`user_id` AS `user_id`,
	`aplego_user`.`username` AS `username`,
	`aplego_user`.`name` AS `name`,
	`aplego_user`.`email` AS `email`,
	`app_students`.`student_id` AS `student_id`,
	`app_students`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`faculty_id` AS `faculty_id`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp`,
	`app_schedule_volunteer`.`schedule_volunteer_id` AS `schedule_volunteer_id`,
	`app_schedule_volunteer`.`semester_id` AS `semester_id`,
	`app_schedule_volunteer`.`start_at` AS `start_at`,
	`app_schedule_volunteer`.`end_at` AS `end_at`,
	`app_schedule_volunteer`.`date` AS `date`,
	`app_schedule_volunteer`.`room` AS `room`,
	`app_schedule_volunteer`.`clarification` AS `clarification`,
	`app_schedule_volunteer`.`schedule_type` AS `schedule_type` 
FROM
	((((
					`aplego_user`
					JOIN `app_students` ON ((
							`app_students`.`user_id` = `aplego_user`.`user_id` 
						)))
				JOIN `app_majors` ON ((
						`app_majors`.`majors_id` = `app_students`.`majors_id` 
					)))
			JOIN `app_faculties` ON ((
					`app_faculties`.`faculty_id` = `app_majors`.`faculty_id` 
				)))
		LEFT JOIN `app_schedule_volunteer` ON (((
					`app_schedule_volunteer`.`student_id` = `app_students`.`student_id` 
					)
			AND ( `app_schedule_volunteer`.`date` IS NOT NULL) 
			AND ( `app_schedule_volunteer`.`deleted` = 'false' )))) 
WHERE
	( `aplego_user`.`capability` = 'volunteer' )
ORDER BY
	`aplego_user`.`name`,
	`app_schedule_volunteer`.`day`,
	`app_schedule_volunteer`.`start_at` ;

-- ----------------------------
-- View structure for app_schedule_student_active_view
-- ----------------------------
DROP VIEW IF EXISTS `app_schedule_student_active_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_schedule_student_active_view` AS SELECT
	`app_schedule_student`.`schedule_student_id` AS `schedule_student_id`,
	`aplego_user`.`user_id` AS `user_id`,
	`aplego_user`.`username` AS `username`,
	`aplego_user`.`name` AS `name`,
	`aplego_user`.`email` AS `email`,
	`app_students`.`student_id` AS `student_id`,
	`app_students`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`faculty_id` AS `faculty_id`,
	`app_majors`.`majors_focus` AS `majors_focus`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp`,
	`app_schedule_student`.`semester_id` AS `semester_id`,
	`app_schedule_student`.`start_at` AS `start_at`,
	`app_schedule_student`.`end_at` AS `end_at`,
	`app_schedule_student`.`day` AS `day`,
	`app_schedule_student`.`date` AS `date`,
	`app_schedule_student`.`room` AS `room`,
	`app_schedule_student`.`courses` AS `courses`,
	`app_schedule_student`.`sks` AS `sks`,
	`app_schedule_student`.`schedule_type` AS `schedule_type`,
	`app_student_active`.`register_id` AS `register_id`,
	`app_student_active`.`approver_id` AS `approver_id`,
	`app_student_active`.`created_at` AS `created_at`,
	`app_accompaniment`.`accompaniment_id`,
	`app_accompaniment`.`student_status`,
	`app_accompaniment`.`volunteer_status`
FROM
	(((((
						`aplego_user`
						JOIN `app_students` ON ((
								`app_students`.`user_id` = `aplego_user`.`user_id` 
							)))
					JOIN `app_majors` ON ((
							`app_majors`.`majors_id` = `app_students`.`majors_id` 
						)))
				JOIN `app_faculties` ON ((
						`app_faculties`.`faculty_id` = `app_majors`.`faculty_id` 
					)))
			JOIN `app_schedule_student` ON ((
					`app_schedule_student`.`student_id` = `app_students`.`student_id` 
				)))
		JOIN `app_student_active` ON (((
					`app_schedule_student`.`semester_id` = `app_student_active`.`semester_id` 
					) 
				AND ( `app_schedule_student`.`deleted` = 'false' ) 
			AND ( `app_schedule_student`.`student_id` = `app_student_active`.`student_id` )))) 
			LEFT JOIN  app_accompaniment ON app_accompaniment.schedule_student_id = app_schedule_student.schedule_student_id
WHERE
	((
			`aplego_user`.`capability` = 'difabel' 
			) 
	AND ( `app_student_active`.`approver_id` IS NOT NULL )) 
ORDER BY
	`aplego_user`.`name`,
	`app_schedule_student`.`day`,
	`app_schedule_student`.`date`,
	`app_schedule_student`.`start_at` ;

-- ----------------------------
-- View structure for app_schedule_student_rev_view
-- ----------------------------
DROP VIEW IF EXISTS `app_schedule_student_rev_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_schedule_student_rev_view` AS SELECT
	`aplego_user`.`user_id` AS `user_id`,
	`aplego_user`.`username` AS `username`,
	`aplego_user`.`name` AS `name`,
	`aplego_user`.`email` AS `email`,
	`app_students`.`student_id` AS `student_id`,
	`app_students`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`majors_focus` AS `majors_focus`,
	`app_majors`.`faculty_id` AS `faculty_id`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp`,
	`app_schedule_student_rev`.`schedule_student_rev_id` AS `schedule_student_rev_id`,
	`app_schedule_student_rev`.`semester_id` AS `semester_id`,
	`app_schedule_student_rev`.`start_at` AS `start_at`,
	`app_schedule_student_rev`.`end_at` AS `end_at`,
	`app_schedule_student_rev`.`day` AS `day`,
	`app_schedule_student_rev`.`room` AS `room`,
	`app_schedule_student_rev`.`courses` AS `courses`,
	`app_schedule_student_rev`.`sks` AS `sks`,
	`app_schedule_student_rev`.`rev` AS `rev` 
FROM
	((((
					`aplego_user`
					JOIN `app_students` ON ((
							`app_students`.`user_id` = `aplego_user`.`user_id` 
						)))
				JOIN `app_majors` ON ((
						`app_majors`.`majors_id` = `app_students`.`majors_id` 
					)))
			JOIN `app_faculties` ON ((
					`app_faculties`.`faculty_id` = `app_majors`.`faculty_id` 
				)))
		JOIN `app_student_active` ON app_student_active.student_id = app_students.student_id
		LEFT JOIN `app_schedule_student_rev` ON (((
					`app_schedule_student_rev`.`student_id` = `app_students`.`student_id` 
					) 
				AND ( `app_schedule_student_rev`.`deleted` = 'false' ) 
				AND `app_student_active`.`semester_id` = `app_schedule_student_rev`.`semester_id` 
			AND `app_schedule_student_rev`.`rev` = ( `app_student_active`.`rev` + 1 )))) 
WHERE
	( `aplego_user`.`capability` = 'difabel' ) 
ORDER BY
	`aplego_user`.`name`,
	`app_schedule_student_rev`.`day`,
	`app_schedule_student_rev`.`start_at` ;

-- ----------------------------
-- View structure for app_schedule_student_view
-- ----------------------------
DROP VIEW IF EXISTS `app_schedule_student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_schedule_student_view` AS SELECT
	`aplego_user`.`user_id` AS `user_id`,
	`aplego_user`.`username` AS `username`,
	`aplego_user`.`name` AS `name`,
	`aplego_user`.`email` AS `email`,
	`app_students`.`student_id` AS `student_id`,
	`app_students`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`majors_focus` AS `majors_focus`,
	`app_majors`.`faculty_id` AS `faculty_id`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp`,
	`app_schedule_student`.`schedule_student_id` AS `schedule_student_id`,
	`app_schedule_student`.`semester_id` AS `semester_id`,
	`app_schedule_student`.`start_at` AS `start_at`,
	`app_schedule_student`.`end_at` AS `end_at`,
	`app_schedule_student`.`day` AS `day`,
	`app_schedule_student`.`room` AS `room`,
	`app_schedule_student`.`courses` AS `courses`,
	`app_schedule_student`.`sks` AS `sks` 
FROM
	((((
					`aplego_user`
					JOIN `app_students` ON ((
							`app_students`.`user_id` = `aplego_user`.`user_id` 
						)))
				JOIN `app_majors` ON ((
						`app_majors`.`majors_id` = `app_students`.`majors_id` 
					)))
			JOIN `app_faculties` ON ((
					`app_faculties`.`faculty_id` = `app_majors`.`faculty_id` 
				)))
		LEFT JOIN `app_schedule_student` ON (((
					`app_schedule_student`.`student_id` = `app_students`.`student_id` 
					) 
			AND ( `app_schedule_student`.`deleted` = 'false' )))) 
WHERE
	( `aplego_user`.`capability` = 'difabel' ) 
ORDER BY
	`aplego_user`.`name`,
	`app_schedule_student`.`day`,
	`app_schedule_student`.`start_at` ;

-- ----------------------------
-- View structure for app_schedule_volunteer_rev_view
-- ----------------------------
DROP VIEW IF EXISTS `app_schedule_volunteer_rev_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_schedule_volunteer_rev_view` AS SELECT
	`aplego_user`.`user_id` AS `user_id`,
	`aplego_user`.`username` AS `username`,
	`aplego_user`.`name` AS `name`,
	`aplego_user`.`email` AS `email`,
	`app_students`.`student_id` AS `student_id`,
	`app_students`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`faculty_id` AS `faculty_id`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp`,
	`app_schedule_volunteer_rev`.`schedule_volunteer_rev_id` AS `schedule_volunteer_rev_id`,
	`app_schedule_volunteer_rev`.`semester_id` AS `semester_id`,
	`app_schedule_volunteer_rev`.`start_at` AS `start_at`,
	`app_schedule_volunteer_rev`.`end_at` AS `end_at`,
	`app_schedule_volunteer_rev`.`day` AS `day`,
	`app_schedule_volunteer_rev`.`room` AS `room`,
	`app_schedule_volunteer_rev`.`clarification` AS `clarification`,
	`app_schedule_volunteer_rev`.`rev`
FROM
	((((
					`aplego_user`
					JOIN `app_students` ON ((
							`app_students`.`user_id` = `aplego_user`.`user_id` 
						)))
				JOIN `app_majors` ON ((
						`app_majors`.`majors_id` = `app_students`.`majors_id` 
					)))
			JOIN `app_faculties` ON ((
					`app_faculties`.`faculty_id` = `app_majors`.`faculty_id` 
				)))
		JOIN `app_student_active` ON app_student_active.student_id = app_students.student_id
		LEFT JOIN `app_schedule_volunteer_rev` ON ((
					`app_schedule_volunteer_rev`.`student_id` = `app_students`.`student_id` 
					 
			AND  `app_schedule_volunteer_rev`.`deleted` = 'false')
		
		AND `app_student_active`.`semester_id` = `app_schedule_volunteer_rev`.`semester_id` 
		AND `app_schedule_volunteer_rev`.`rev` = (
		`app_student_active`.`rev` + 1)
			)) 
WHERE
	( `aplego_user`.`capability` = 'volunteer' ) 
ORDER BY
	`aplego_user`.`name`,
	`app_schedule_volunteer_rev`.`day`,
	`app_schedule_volunteer_rev`.`start_at` ;

-- ----------------------------
-- View structure for app_schedule_volunteer_view
-- ----------------------------
DROP VIEW IF EXISTS `app_schedule_volunteer_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_schedule_volunteer_view` AS SELECT
	`aplego_user`.`user_id` AS `user_id`,
	`aplego_user`.`username` AS `username`,
	`aplego_user`.`name` AS `name`,
	`aplego_user`.`email` AS `email`,
	`app_students`.`student_id` AS `student_id`,
	`app_students`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`faculty_id` AS `faculty_id`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp`,
	`app_schedule_volunteer`.`schedule_volunteer_id` AS `schedule_volunteer_id`,
	`app_schedule_volunteer`.`semester_id` AS `semester_id`,
	`app_schedule_volunteer`.`start_at` AS `start_at`,
	`app_schedule_volunteer`.`end_at` AS `end_at`,
	`app_schedule_volunteer`.`day` AS `day`,
	`app_schedule_volunteer`.`room` AS `room`,
	`app_schedule_volunteer`.`clarification` AS `clarification` 
FROM
	((((
					`aplego_user`
					JOIN `app_students` ON ((
							`app_students`.`user_id` = `aplego_user`.`user_id` 
						)))
				JOIN `app_majors` ON ((
						`app_majors`.`majors_id` = `app_students`.`majors_id` 
					)))
			JOIN `app_faculties` ON ((
					`app_faculties`.`faculty_id` = `app_majors`.`faculty_id` 
				)))
		LEFT JOIN `app_schedule_volunteer` ON (((
					`app_schedule_volunteer`.`student_id` = `app_students`.`student_id` 
					) 
			AND ( `app_schedule_volunteer`.`deleted` = 'false' )))) 
WHERE
	( `aplego_user`.`capability` = 'volunteer' ) 
ORDER BY
	`aplego_user`.`name`,
	`app_schedule_volunteer`.`day`,
	`app_schedule_volunteer`.`start_at` ;

-- ----------------------------
-- View structure for app_students_view
-- ----------------------------
DROP VIEW IF EXISTS `app_students_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_students_view` AS select `aplego_user`.`user_id` AS `user_id`,`aplego_user`.`username` AS `username`,`aplego_user`.`name` AS `name`,`aplego_user`.`email` AS `email`,`aplego_user`.`active` AS `active`,`aplego_user`.`capability` AS `capability`,`aplego_user`.`last_login` AS `last_login`,`aplego_user`.`login_count` AS `login_count`,`aplego_user`.`created_at` AS `created_at`,`aplego_user`.`updated_at` AS `updated_at`,`app_students`.`student_id` AS `student_id`,`app_students`.`majors_id` AS `majors_id`,`app_majors`.`majors_name` AS `majors_name`,`app_majors`.`faculty_id` AS `faculty_id`,`app_faculties`.`faculty_name` AS `faculty_name`,`app_students`.`nick_name` AS `nick_name`,`app_students`.`class_of_college` AS `class_of_college`,`app_students`.`no_hp` AS `no_hp`,`app_students`.`photo` AS `photo` from (((`aplego_user` join `app_students` on((`app_students`.`user_id` = `aplego_user`.`user_id`))) join `app_majors` on((`app_majors`.`majors_id` = `app_students`.`majors_id`))) join `app_faculties` on((`app_faculties`.`faculty_id` = `app_majors`.`faculty_id`))) ;

-- ----------------------------
-- View structure for app_student_active_view
-- ----------------------------
DROP VIEW IF EXISTS `app_student_active_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_student_active_view` AS SELECT
	`app_student_active`.`register_id` AS `register_id`,
	`app_student_active`.`student_id` AS `student_id`,
	`app_student_active`.`semester_id` AS `semester_id`,
	`app_student_active`.`approver_id` AS `approver_id`,
	`app_student_active`.`rev` AS `rev`,
	`app_student_active`.`rev_at` AS `rev_at`,
	`approver`.`name` AS `approver_name`,
	`app_student_active`.`created_at` AS `created_at`,
	`app_students`.`user_id` AS `user_id`,
	`aplego_user`.`username` AS `username`,
	`aplego_user`.`capability` AS `capability`,
	`aplego_user`.`name` AS `name`,
	`aplego_user`.`email` AS `email`,
	`app_students`.`majors_id` AS `majors_id`,
	`app_majors`.`majors_name` AS `majors_name`,
	`app_majors`.`faculty_id` AS `faculty_id`,
	`app_faculties`.`faculty_name` AS `faculty_name`,
	`app_students`.`nick_name` AS `nick_name`,
	`app_students`.`class_of_college` AS `class_of_college`,
	`app_students`.`no_hp` AS `no_hp` 
FROM
	(((((
						`app_student_active`
						JOIN `app_students` ON ((
								`app_students`.`student_id` = `app_student_active`.`student_id` 
							)))
					JOIN `app_majors` ON ((
							`app_majors`.`majors_id` = `app_students`.`majors_id` 
						)))
				JOIN `app_faculties` ON ((
						`app_faculties`.`faculty_id` = `app_majors`.`faculty_id` 
					)))
			JOIN `aplego_user` ON ((
					`app_students`.`user_id` = `aplego_user`.`user_id` 
				)))
		LEFT JOIN `aplego_user` `approver` ON ((
			`app_student_active`.`approver_id` = `approver`.`user_id` 
	))) ;

-- ----------------------------
-- View structure for app_student_not_active_view
-- ----------------------------
DROP VIEW IF EXISTS `app_student_not_active_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `app_student_not_active_view` AS select `app_student_active`.`register_id` AS `register_id`,`app_students`.`student_id` AS `student_id`,`app_student_active`.`semester_id` AS `semester_id`,`app_student_active`.`approver_id` AS `approver_id`,`approver`.`name` AS `approver_name`,`app_student_active`.`created_at` AS `created_at`,`app_students`.`user_id` AS `user_id`,`aplego_user`.`username` AS `username`,`aplego_user`.`capability` AS `capability`,`aplego_user`.`name` AS `name`,`aplego_user`.`email` AS `email`,`app_students`.`majors_id` AS `majors_id`,`app_majors`.`majors_name` AS `majors_name`,`app_majors`.`faculty_id` AS `faculty_id`,`app_faculties`.`faculty_name` AS `faculty_name`,`app_students`.`nick_name` AS `nick_name`,`app_students`.`class_of_college` AS `class_of_college`,`app_students`.`no_hp` AS `no_hp` from (((((`app_students` left join `app_student_active` on((`app_students`.`student_id` = `app_student_active`.`student_id`))) join `app_majors` on((`app_majors`.`majors_id` = `app_students`.`majors_id`))) join `app_faculties` on((`app_faculties`.`faculty_id` = `app_majors`.`faculty_id`))) join `aplego_user` on((`app_students`.`user_id` = `aplego_user`.`user_id`))) left join `aplego_user` `approver` on((`app_student_active`.`approver_id` = `approver`.`user_id`))) where isnull(`app_student_active`.`approver_id`) ;

-- ----------------------------
-- Function structure for get_json_jadwal_volunteer_day
-- ----------------------------
DROP FUNCTION IF EXISTS `get_json_jadwal_volunteer_day`;
delimiter ;;
CREATE FUNCTION `get_json_jadwal_volunteer_day`(`semester_id` INT, `student_id` INT, `day_int` INTEGER(1))
 RETURNS longtext CHARSET latin1
BEGIN
	set @result_data := '';
	SELECT
		IFNULL(CONCAT( '[', GROUP_CONCAT( concat( '["', `app_schedule_volunteer`.`start_at`, '","', `app_schedule_volunteer`.`end_at`, '","', `app_schedule_volunteer`.`schedule_type`, '","', `app_schedule_volunteer`.`room`, '"]' ) ), ']' ),'[]') INTO @result_data 
	FROM
		app_schedule_volunteer 
	WHERE
		app_schedule_volunteer.student_id = student_id 
		AND app_schedule_volunteer.semester_id = semester_id 
		AND app_schedule_volunteer.deleted = 'false' 
		AND app_schedule_volunteer.DAY = day_int;
	RETURN(@result_data);
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
