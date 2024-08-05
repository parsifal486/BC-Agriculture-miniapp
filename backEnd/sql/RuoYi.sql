/*
 Navicat Premium Data Transfer

 Source Server         : BlockChain
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : 47.94.53.88:3306
 Source Schema         : RuoYi

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 13/03/2024 14:39:58
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for block_id
-- ----------------------------
DROP TABLE IF EXISTS `block_id`;
CREATE TABLE `block_id`  (
  `commodity_id` bigint NOT NULL AUTO_INCREMENT,
  `commodity_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`commodity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102900011006989 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of block_id
-- ----------------------------
INSERT INTO `block_id` VALUES (102900005116042, '藕');
INSERT INTO `block_id` VALUES (102900005116219, '红尖椒');
INSERT INTO `block_id` VALUES (102900005116226, '青尖椒');
INSERT INTO `block_id` VALUES (102900005116233, '红椒');
INSERT INTO `block_id` VALUES (102900005116714, '西兰花');
INSERT INTO `block_id` VALUES (102900005116806, '黑油菜');
INSERT INTO `block_id` VALUES (102900005116905, '青杭椒');
INSERT INTO `block_id` VALUES (102900005118817, '菠菜');
INSERT INTO `block_id` VALUES (102900005118831, '娃娃菜');
INSERT INTO `block_id` VALUES (102900005125808, '小米椒');
INSERT INTO `block_id` VALUES (102900011000175, '快菜');
INSERT INTO `block_id` VALUES (102900011000328, '螺丝椒');
INSERT INTO `block_id` VALUES (102900011000335, '紫圆茄');
INSERT INTO `block_id` VALUES (102900011006689, '东门口小白菜');
INSERT INTO `block_id` VALUES (102900011006955, '冰草');
INSERT INTO `block_id` VALUES (102900011006988, '北京小米');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (6, 'web_user_detail', '', NULL, NULL, 'WebUserDetail', 'crud', '', 'com.ruoyi.system', 'system', 'detail', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2024-01-31 17:35:09', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (56, 6, 'user_id', NULL, 'bigint(20) unsigned zerofill', 'Long', 'userId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-01-31 17:35:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, 6, 'nickname', NULL, 'varchar(32)', 'String', 'nickname', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-01-31 17:35:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, 6, 'pwd', NULL, 'varchar(60)', 'String', 'pwd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-01-31 17:35:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, 6, 'profile_image', NULL, 'varchar(500)', 'String', 'profileImage', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'imageUpload', '', 4, 'admin', '2024-01-31 17:35:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (60, 6, 'age', NULL, 'varchar(2)', 'String', 'age', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-01-31 17:35:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (61, 6, 'love', NULL, 'varchar(100)', 'String', 'love', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-01-31 17:35:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (62, 6, 'sex', NULL, 'varchar(2)', 'String', 'sex', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2024-01-31 17:35:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (63, 6, 'phone', NULL, 'varchar(15)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-01-31 17:35:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (64, 6, 'create_time', NULL, 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-01-31 17:35:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (65, 6, 'update_time', NULL, 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-01-31 17:35:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (66, 6, 'permission', NULL, 'int', 'Long', 'permission', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-01-31 17:35:09', '', NULL);

-- ----------------------------
-- Table structure for sys_blockchain_origin
-- ----------------------------
DROP TABLE IF EXISTS `sys_blockchain_origin`;
CREATE TABLE `sys_blockchain_origin`  (
  `commodity_id` bigint NOT NULL,
  `commodity_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `origin` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `temperature` bigint NULL DEFAULT NULL,
  `farming` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picking_time` datetime NULL DEFAULT NULL,
  `supervisor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `origin_x` bigint NULL DEFAULT NULL,
  `origin_y` bigint NULL DEFAULT NULL,
  `commodity_partition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bagging` bigint NULL DEFAULT NULL,
  `grow_time` bigint NULL DEFAULT NULL,
  `irrigate_time` bigint NULL DEFAULT NULL,
  `fertilizer_time` bigint NULL DEFAULT NULL,
  `weeding_time` bigint NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`commodity_id`) USING BTREE,
  INDEX `commodity_id`(`commodity_id` ASC, `commodity_name` ASC) USING BTREE,
  INDEX `supervisor`(`supervisor` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '区块链产地表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_blockchain_origin
-- ----------------------------
INSERT INTO `sys_blockchain_origin` VALUES (102900005115984, '云南油麦菜', '云南省武汉市蔡甸区大冶镇花山村', 22, '有机种植', '2024-01-28 00:00:00', '郭纪壮', 119, 35, '花叶类', 0, 30, 34, 33, 33, '病虫害情况：轻微叶斑病感染，喷洒了杀菌剂');
INSERT INTO `sys_blockchain_origin` VALUES (102900005116042, '藕', '河南省郑州市巩义市西村乡段寨村', 23, '有机种植', '2024-01-28 00:00:00', '郭纪壮', 114, 31, '水生根茎类', 0, 28, 24, 26, 31, '生长阶段：发芽期');
INSERT INTO `sys_blockchain_origin` VALUES (102900005116219, '红尖椒', '湖南省长沙市宁乡市炎陵县青山铺镇坪阳村', 26, '有机种植', '2024-01-28 00:00:00', '郭纪壮', 117, 36, '辣椒类', 1, 30, 24, 33, 27, '生长阶段：生长期');
INSERT INTO `sys_blockchain_origin` VALUES (102900005116226, '青尖椒', '广东省广州市增城区派潭镇尚街村', 22, '有机种植', '2024-01-28 00:00:00', '郭纪壮', 115, 34, '辣椒类', 0, 31, 34, 33, 25, '生长环境：温度：25摄氏度，湿度：70%，光照：14小时');
INSERT INTO `sys_blockchain_origin` VALUES (102900005116233, '红椒', '广西壮族自治区南宁市邕宁区蒲庙镇板头村', 21, '有机种植', '2024-01-28 00:00:00', '郭纪壮', 104, 30, '辣椒类', 1, 28, 21, 31, 29, '收获日期：预计2024年7月中旬收获');
INSERT INTO `sys_blockchain_origin` VALUES (102900005116714, '西兰花', '云南省昆明市宜良县羊街镇黄树村', 25, '温室种植', '2024-03-14 00:00:00', '张天朔', 115, 33, '花菜类', 1, 31, 32, 28, 26, '其他备注：需要定期除草和浇水');
INSERT INTO `sys_blockchain_origin` VALUES (102900005116806, '黑油菜', '浙江省杭州市淳安县千岛湖镇宋家村', 26, '温室种植', '2024-01-28 00:00:00', '张天朔', 118, 36, '花叶类', 1, 28, 34, 30, 33, '生长阶段：开花期');
INSERT INTO `sys_blockchain_origin` VALUES (102900005116905, '青杭椒', '江苏省南京市江宁区湖熟街道华阳村', 27, '温室种植', '2024-01-28 00:00:00', '张天朔', 115, 36, '辣椒类', 0, 29, 31, 34, 31, '施肥情况：使用复合肥，适量施加');
INSERT INTO `sys_blockchain_origin` VALUES (102900005118817, '菠菜', '山东省青岛市平度市辛寨子镇朱家房村', 24, '温室种植', '2024-01-28 00:00:00', '张天朔', 125, 43, '花叶类', 1, 33, 20, 34, 29, '病虫害情况：轻微叶斑病感染，进行了防治');
INSERT INTO `sys_blockchain_origin` VALUES (102900005118831, '娃娃菜', '河北省石家庄市井陉矿区陵园镇青云村', 28, '温室种植', '2024-01-28 00:00:00', '于靖霖', 111, 31, '花叶类', 0, 26, 23, 31, 31, '生长环境：温度适宜，湿度适中，光照充足');
INSERT INTO `sys_blockchain_origin` VALUES (102900005125808, '小米椒', '陕西省西安市长安区王寺镇孟祖庄村', 28, '水培种植', '2024-01-28 00:00:00', '于靖霖', 115, 33, '辣椒类', 1, 31, 13, 30, 27, '其他备注：土壤pH值适宜，注意水分管理');
INSERT INTO `sys_blockchain_origin` VALUES (102900005128748, '黄花菜', '辽宁省沈阳市法库县佟各庄镇马家房村', 29, '水培种植', '2024-01-28 00:00:00', '于靖霖', 110, 35, '花叶类', 1, 32, 31, 34, 26, '病虫害情况：未发现病虫害');
INSERT INTO `sys_blockchain_origin` VALUES (102900011000175, '快菜', '安徽省合肥市肥东县三河镇桃花村', 24, '水培种植', '2024-01-28 00:00:00', '高庆灿', 114, 38, '花叶类', 0, 30, 30, 30, 35, '收获日期：预计在适当时机进行收获');
INSERT INTO `sys_blockchain_origin` VALUES (102900011000328, '螺丝椒', '湖北省黄冈市黄梅县团结镇薛集村', 22, '水培种植', '2024-01-28 00:00:00', '高庆灿', 106, 29, '辣椒类', 0, 34, 23, 30, 26, '施肥情况：使用适宜的肥料，按需施加');
INSERT INTO `sys_blockchain_origin` VALUES (102900011000335, '紫圆茄', '四川省成都市郫都区安靖镇兴隆村', 21, '垂直种植', '2024-01-28 00:00:00', '高庆灿', 118, 33, '茄类', 1, 28, 34, 33, 34, '生长阶段：开花期');
INSERT INTO `sys_blockchain_origin` VALUES (102900011006689, '东门口小白菜', '贵州省贵阳市清镇市龙沙镇平地村', 22, '垂直种植', '2024-01-28 00:00:00', '高岩鑫', 115, 32, '花叶类', 0, 29, 35, 32, 35, '病虫害情况：未发现病虫害');
INSERT INTO `sys_blockchain_origin` VALUES (102900011006955, '冰草', '江西省南昌市新建区黄马乡高枧村', 29, '垂直种植', '2024-01-28 00:00:00', '高岩鑫', 103, 36, '花叶类', 0, 31, 31, 29, 29, '施肥情况：使用适当的有机肥料，进行施肥');

-- ----------------------------
-- Table structure for sys_blockchain_sell
-- ----------------------------
DROP TABLE IF EXISTS `sys_blockchain_sell`;
CREATE TABLE `sys_blockchain_sell`  (
  `commodity_id` bigint NOT NULL,
  `commodity_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sell_time` datetime NULL DEFAULT NULL,
  `supervisor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `test_result` bigint NULL DEFAULT NULL,
  `test_picture` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`commodity_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '区块链销售表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_blockchain_sell
-- ----------------------------
INSERT INTO `sys_blockchain_sell` VALUES (102900005115984, '云南油麦菜', '2024-02-29 17:55:38', '于靖霖', '\"新鲜蔬菜，品质优良。\"', 0, 'https://ts1.cn.mm.bing.net/th/id/R-C.9caa6b5c17094e0ae91c883b1f18b0a4?rik=iTgJaXB6B5aRsw&riu=http%3a%2f%2fquote.agdata.cn%2freport%2fimg%2f2021%2f202101181609363182%2f2021011816093631820.png&ehk=4x2ylvtB3yHEpLsn65XdgBqumbU1L3lkuPjuoi81sQo%3d&risl=&pid=ImgRaw&r=0');
INSERT INTO `sys_blockchain_sell` VALUES (102900005116042, '藕', '2024-03-03 01:08:30', '于靖霖', '\"价格实惠，物美价廉。\"', 0, 'https://ts1.cn.mm.bing.net/th/id/R-C.d9a4772c101d40f4bc6cd1067aafe126?rik=wg9fsR59r%2beYvA&riu=http%3a%2f%2fwww.sooth-road.com.cn%2fimages%2fup_images%2f2015127134612.jpg&ehk=OOHURAng5BCtXWuQEn7veZY1vZIyhLQ%2bvNsoYFnAwNY%3d&risl=&pid=ImgRaw&r=0');
INSERT INTO `sys_blockchain_sell` VALUES (102900005116219, '红尖椒', '2024-02-29 06:15:46', '于靖霖', '\"蔬菜种类多样，选择丰富。\"', 0, 'https://ts1.cn.mm.bing.net/th/id/R-C.ac7ae67877a45dfbe0139470d2b2dcfd?rik=6JQKCjdaabAYpg&riu=http%3a%2f%2fwww.znlg.com%2fcommon%2fstatic%2fznlg%2fzs%2fh.jpg&ehk=%2b8TrbLhQ5DO241mQxT0KbXKdOi1KKOmvrjBsut52LwE%3d&risl=&pid=ImgRaw&r=0');
INSERT INTO `sys_blockchain_sell` VALUES (102900005116226, '青尖椒', '2024-03-04 18:30:05', '张天朔', '\"蔬菜包装精美，保鲜好。\"', 0, 'https://ts1.cn.mm.bing.net/th/id/R-C.12e40119c2f86d23342509fb562ebbf1?rik=3E8GLK1G0CBBEw&riu=http%3a%2f%2fwww.gxrzs.com%2fsites%2fdefault%2ffiles%2fpictures%2f1868857597.jpg&ehk=KVPUiounlhzLop5%2fDKoYuRWSBQj658q66qvVNMxcbrc%3d&risl=&pid=ImgRaw&r=0');
INSERT INTO `sys_blockchain_sell` VALUES (102900005116233, '红椒', '2024-03-01 16:02:34', '张天朔', '\"配送及时，服务态度好。\"', 0, 'https://ts1.cn.mm.bing.net/th/id/R-C.8d9df272ae9d0836a98ac93e92b96390?rik=W%2buMR6aznUsGXw&riu=http%3a%2f%2fnwzimg.wezhan.cn%2fcontents%2fsitefiles2022%2f10113565%2fimages%2f3131440.jpg&ehk=Quds6XPeHnfR33Jxr9OlMfJb9nMHmqnbYEgOeyS4ysM%3d&risl=&pid=ImgRaw&r=0');
INSERT INTO `sys_blockchain_sell` VALUES (102900005116714, '西兰花', '2024-02-29 23:50:22', '张天朔', '\"蔬菜品质参差不齐。\"', 0, 'https://ts1.cn.mm.bing.net/th/id/R-C.68ea873d59318de2c52bd7d725e18afc?rik=Ar%2bKFyG%2bx3JVwQ&riu=http%3a%2f%2fnwzimg.wezhan.cn%2fcontents%2fsitefiles2022%2f10113565%2fimages%2f3131441.jpg&ehk=KaIdC7vo5HSIZgBZpyaSS1z3XBlAdKdZjahlkvV5mzA%3d&risl=&pid=ImgRaw&r=0');
INSERT INTO `sys_blockchain_sell` VALUES (102900005116806, '黑油菜', '2024-03-03 15:19:27', '张天朔', '\"蔬菜价格偏高，不划算。\"', 0, 'https://ts1.cn.mm.bing.net/th/id/R-C.e3b1cec97e626209c190accd8ee61d3d?rik=lnqIlW5%2b0gxFmg&riu=http%3a%2f%2fzjqysw.com%2fzjqysw202004035366%2fuploadfiles%2f2020%2f09%2f20200923135109863.png&ehk=UBuD5qSBzCD0XpX4ZLDkUFRJF%2frcKYFllXdC%2b7eMOSc%3d&risl=&pid=ImgRaw&r=0');
INSERT INTO `sys_blockchain_sell` VALUES (102900005116905, '青杭椒', '2024-03-01 16:41:33', '郭纪壮', '\"蔬菜新鲜度欠佳，需改进。\"', 0, 'https://ts1.cn.mm.bing.net/th/id/R-C.2051365e16fc74e8aa220392bdb4d789?rik=a6HIT0jHsrlwIg&riu=http%3a%2f%2ffile.fh21.com.cn%2ffhfile1%2fM00%2f4D%2f8E%2fo4YBAFi-ip-AGwWAAADUWVYeYlA737.jpg&ehk=WiyRLF8E2uFN%2b5exwYZPZm5n2A25irzwwgTbt2UCexI%3d&risl=&pid=ImgRaw&r=0');
INSERT INTO `sys_blockchain_sell` VALUES (102900005118817, '菠菜', '2024-03-03 03:26:55', '郭纪壮', '\"蔬菜种类单一，选择有限。\"', 0, 'https://ts1.cn.mm.bing.net/th/id/R-C.7d2f442c03384194415e79b0da4012ef?rik=Oi354xGEJH0%2b6g&riu=http%3a%2f%2ff.cdn.zhuolaoshi.cn%2fuser%2fsite72515%2fproduct%2f2021421%2f2021421141448835996_500%C3%97500.jpg&ehk=VIavCmx9u4gQacykjdxV8A5R3HDYuQZSOFoxJsgEWEg%3d&risl=&pid=ImgRaw&r=0');
INSERT INTO `sys_blockchain_sell` VALUES (102900005118831, '娃娃菜', '2024-02-29 05:15:12', '郭纪壮', '\"包装简陋，易导致损坏。\"', 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.0e329074a1ec39907cb15bbf28b66bd4?rik=DQ7401dCmQU98Q&riu=http%3a%2f%2fwww.ntxiehe.com%2fupLoad%2fimage%2f20141112%2f14157776048375776.JPG&ehk=JT9ZbSyXbBYiOtInLv6bL82ak%2bCMIDAVydpidF8XJGk%3d&risl=&pid=ImgRaw&r=0');
INSERT INTO `sys_blockchain_sell` VALUES (102900005125808, '小米椒', '2024-03-03 11:14:51', '郭纪壮', '\"配送服务不及时，影响使用。\"', 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.b902944c8feee46c9163a0eea1d16dd0?rik=c9u%2bY9EUTLqisg&riu=http%3a%2f%2fwww.sqi.com.cn%2fCertificatePic%2fCATL%E8%AF%81%E4%B9%A6%5b2019%5d%E5%86%9C%E8%B4%A8%E6%A3%80%E6%A0%B8%EF%BC%88%E6%B2%AA%EF%BC%89%E5%AD%97%E7%AC%AC0005%E5%8F%B72019.6.26-2025.6.25_20190812133103.jpg&ehk=I0nl35m7NqLNS%2bFeyPhl6LnExSBbm0dW58%2bMnP7IkPw%3d&risl=&pid=ImgRaw&r=0');
INSERT INTO `sys_blockchain_sell` VALUES (102900005128748, '黄花菜', '2024-03-03 05:13:16', '郭纪壮', '\"蔬菜质量不稳定，需提升。\"', 1, 'https://tse4-mm.cn.bing.net/th/id/OIP-C.yMUUo8oozSXnl3i7I71tmwHaFj?w=600&h=450&rs=1&pid=ImgDetMain');
INSERT INTO `sys_blockchain_sell` VALUES (102900011000175, '快菜', '2024-03-03 08:44:02', '高岩鑫', '\"蔬菜售卖不透明，价格不明确。\"', 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.73de9f80b6e8b6e099b6ed3361c20322?rik=jaT%2b67AWAfQg4g&riu=http%3a%2f%2fwww.qxaqhgy.com%2fUpload%2f5d76071e90007.png&ehk=GeL77wbdKIp%2fR4f4TtiCrLGXEZTUGql9307S51XFSkQ%3d&risl=&pid=ImgRaw&r=0');
INSERT INTO `sys_blockchain_sell` VALUES (102900011000328, '螺丝椒', '2024-03-03 00:25:24', '高岩鑫', '\"蔬菜包装不环保，需改善。\"', 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.0346025d8dcdf47a9316805c541ea21d?rik=tRNA5tF2a0jyEA&riu=http%3a%2f%2ffile.spsb114.com%2f2646%2fnews%2fpic%2f201203%2fp874227001331990399.jpg&ehk=HiGm7QGel3IFFjJTcl3HRjzIO9nsgL3pYRaYZqiAvIY%3d&risl=&pid=ImgRaw&r=0');
INSERT INTO `sys_blockchain_sell` VALUES (102900011000335, '紫圆茄', '2024-03-04 21:10:54', '高庆灿', '\"蔬菜配送地域限制较多。\"', 1, 'https://tse3-mm.cn.bing.net/th/id/OIP-C.Dq-moanD4GbNRq4y3xrz-QAAAA?rs=1&pid=ImgDetMain');
INSERT INTO `sys_blockchain_sell` VALUES (102900011006689, '东门口小白菜', '2024-03-04 10:19:33', '高庆灿', '\"蔬菜存储方式不当，影响品质。\"', 1, 'https://sitecdn.sdongpo.com/wordpress-upyun/2020/04/2c3ec9a881c09c05db5bff3d5ca7d088-768x580.jpeg');
INSERT INTO `sys_blockchain_sell` VALUES (102900011006955, '冰草', '2024-03-01 11:01:40', '高庆灿', '\"蔬菜售卖信息更新不及时。\"', 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.2051365e16fc74e8aa220392bdb4d789?rik=a6HIT0jHsrlwIg&riu=http%3a%2f%2ffile.fh21.com.cn%2ffhfile1%2fM00%2f4D%2f8E%2fo4YBAFi-ip-AGwWAAADUWVYeYlA737.jpg&ehk=WiyRLF8E2uFN%2b5exwYZPZm5n2A25irzwwgTbt2UCexI%3d&risl=&pid=ImgRaw&r=0');

-- ----------------------------
-- Table structure for sys_blockchain_transport
-- ----------------------------
DROP TABLE IF EXISTS `sys_blockchain_transport`;
CREATE TABLE `sys_blockchain_transport`  (
  `commodity_id` bigint NOT NULL,
  `commodity_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commodity_transport` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transport_time` datetime NULL DEFAULT NULL,
  `supervisor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transport_x` bigint NULL DEFAULT NULL,
  `transport_y` bigint NULL DEFAULT NULL,
  `transport_status` bigint NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`commodity_id`) USING BTREE,
  INDEX `qqq`(`commodity_id` ASC, `commodity_name` ASC) USING BTREE,
  INDEX `supervisor`(`supervisor` ASC) USING BTREE,
  CONSTRAINT `qqq` FOREIGN KEY (`commodity_id`, `commodity_name`) REFERENCES `sys_blockchain_origin` (`commodity_id`, `commodity_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '区块链运输表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_blockchain_transport
-- ----------------------------
INSERT INTO `sys_blockchain_transport` VALUES (102900005115984, '云南油麦菜', '火车', '2024-02-24 21:00:31', '于靖霖', 101, 24, 0, '迅速配送，服务好');
INSERT INTO `sys_blockchain_transport` VALUES (102900005116042, '藕', '火车', '2024-02-23 09:35:50', '于靖霖', 113, 32, 0, '包装破损，需改进');
INSERT INTO `sys_blockchain_transport` VALUES (102900005116219, '红尖椒', '公路', '2024-02-29 01:18:18', '于靖霖', 118, 37, 0, '准时派送，满意。');
INSERT INTO `sys_blockchain_transport` VALUES (102900005116226, '青尖椒', '公路', '2024-02-26 12:51:41', '张天朔', 114, 35, 0, '物流费用透明合理。\"');
INSERT INTO `sys_blockchain_transport` VALUES (102900005116233, '红椒', '公路', '2024-02-25 13:11:34', '张天朔', 105, 31, 0, '\"交通拥堵，派送延迟。\"');
INSERT INTO `sys_blockchain_transport` VALUES (102900005116714, '西兰花', '空运', '2024-02-15 11:10:32', '张天朔', 116, 32, 0, '\"包裹完好，值得信赖。\"');
INSERT INTO `sys_blockchain_transport` VALUES (102900005116806, '黑油菜', '水运', '2024-02-17 20:18:34', '张天朔', 117, 36, 0, '\"派件员态度差，需改善。\"');
INSERT INTO `sys_blockchain_transport` VALUES (102900005116905, '青杭椒', '空运', '2024-02-19 00:36:43', '郭纪壮', 116, 38, 0, '\"物流通知及时准确。\"');
INSERT INTO `sys_blockchain_transport` VALUES (102900005118817, '菠菜', '火车', '2024-02-23 00:00:07', '郭纪壮', 126, 41, 1, '\"货物受损，需索赔。\"');
INSERT INTO `sys_blockchain_transport` VALUES (102900005118831, '娃娃菜', '空运', '2024-02-24 18:42:20', '郭纪壮', 110, 32, 1, '\"物流信息更新滞后。\"');
INSERT INTO `sys_blockchain_transport` VALUES (102900005125808, '小米椒', '公路', '2024-02-21 13:34:02', '郭纪壮', 116, 32, 1, '\"派送准时，服务周到。\"');
INSERT INTO `sys_blockchain_transport` VALUES (102900005128748, '黄花菜', '公路', '2024-02-15 12:01:37', '郭纪壮', 111, 34, 1, '\"货物配送地址错误。\"');
INSERT INTO `sys_blockchain_transport` VALUES (102900011000175, '快菜', '火车', '2024-02-16 01:47:11', '高岩鑫', 115, 37, 1, '\"派送时间预约不准。\"');
INSERT INTO `sys_blockchain_transport` VALUES (102900011000328, '螺丝椒', '火车', '2024-02-29 01:50:34', '高岩鑫', 105, 27, 1, '\"物流处理投诉效率低。\"');
INSERT INTO `sys_blockchain_transport` VALUES (102900011000335, '紫圆茄', '火车', '2024-02-29 14:22:04', '高庆灿', 119, 32, 1, '\"货物丢失，返程处理。\"');
INSERT INTO `sys_blockchain_transport` VALUES (102900011006689, '东门口小白菜', '火车', '2024-02-28 07:21:32', '高庆灿', 114, 31, 1, '\"物流包装精细。\"');
INSERT INTO `sys_blockchain_transport` VALUES (102900011006955, '冰草', '空运', '2024-02-17 18:30:01', '高庆灿', 102, 37, 1, '\"配送速度慢，影响。\"');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-01-26 22:08:13', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-01-26 22:08:13', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-01-26 22:08:13', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-01-26 22:08:13', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'N', 'admin', '2024-01-26 22:08:13', 'admin', '2024-02-06 18:24:38', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-01-26 22:08:13', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-26 22:08:12', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-26 22:08:12', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-26 22:08:12', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-26 22:08:12', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-26 22:08:12', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-26 22:08:12', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-26 22:08:12', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-26 22:08:12', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-26 22:08:12', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-26 22:08:12', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-01-26 22:08:13', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-01-26 22:08:13', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-01-26 22:08:13', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 691 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-27 12:35:28');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-01-28 16:45:48');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-01-28 18:27:22');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-28 23:52:58');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-28 23:53:31');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-31 14:41:07');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-31 14:48:22');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-31 16:53:00');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-31 17:25:46');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-31 17:27:49');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:04:48');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:04:55');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:05:00');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:06:01');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:11:41');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:17:02');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:17:40');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:18:52');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:21:19');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-02-02 21:21:21');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:21:56');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:26:41');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:38:23');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:40:09');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:46:55');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:49:15');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:56:07');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 21:56:44');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：admin 不存在', '2024-02-02 22:00:39');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-02 22:06:04');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-03 11:32:51');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-03 12:05:06');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-03 12:08:52');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-02-03 12:08:54');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-03 12:08:59');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-03 12:09:36');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-03 13:13:45');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-02-03 14:07:05');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-02-03 20:22:49');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-02-03 20:22:51');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-03 20:22:54');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-03 20:23:50');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-03 23:39:58');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-03 23:41:56');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 14:00:57');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-04 14:03:31');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 14:03:41');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-04 14:04:12');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 14:04:30');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-04 14:05:11');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 14:05:18');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-04 14:05:53');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-04 14:08:20');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 14:08:25');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 14:39:26');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 15:58:31');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-04 15:58:35');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 15:58:39');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-04 15:58:58');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 16:00:17');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 16:24:29');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-04 16:27:32');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 16:30:48');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 17:53:28');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 21:38:12');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-04 21:38:40');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 21:39:34');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 22:30:09');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-04 22:30:47');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 22:31:12');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-04 22:32:01');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 22:51:35');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-04 23:02:02');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-02-04 23:42:18');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-05 11:57:19');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-05 17:50:27');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-05 17:50:34');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-05 21:43:02');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-05 21:43:07');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-05 22:35:25');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-02-05 22:36:05');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-05 22:36:09');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-05 22:39:53');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-05 22:40:39');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-05 22:40:49');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-05 22:45:04');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-05 22:45:12');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-05 22:47:39');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-05 22:47:54');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-05 22:54:04');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-05 22:54:17');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-05 22:56:25');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2024-02-05 23:06:58');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-02-05 23:07:03');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-02-05 23:07:59');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 15:32:17');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-06 15:34:55');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 15:35:02');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-06 15:38:19');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 15:38:25');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-06 15:39:26');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 15:39:33');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-06 15:40:24');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 15:40:31');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 16:16:36');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 17:01:56');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-06 17:02:05');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 17:53:42');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-06 17:57:18');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 17:57:30');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-06 17:58:37');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 18:17:15');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 22:45:39');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-06 22:54:51');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-06 22:57:03');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 22:57:13');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-06 23:03:37');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 23:03:46');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-06 23:04:38');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 23:05:14');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-06 23:09:57');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 23:10:06');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-06 23:23:04');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 23:23:12');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-06 23:59:32');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-07 10:01:02');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-07 10:12:39');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-07 10:13:25');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-07 10:14:34');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-07 10:15:29');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-07 10:22:12');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-07 10:50:54');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-07 16:03:22');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-07 16:22:21');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-07 16:22:27');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-07 16:53:16');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-07 17:57:35');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-07 18:03:59');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-07 18:07:30');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-07 18:07:35');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-07 20:59:57');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-07 21:21:54');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-07 21:22:37');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-07 21:29:36');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-07 21:30:08');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 10:15:19');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 11:28:49');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 11:59:25');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 12:12:18');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 15:57:41');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 16:16:25');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-08 16:19:18');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 16:19:24');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-08 16:20:46');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 16:20:52');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-08 16:21:07');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 16:21:29');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-08 16:21:44');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 16:23:22');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-08 16:23:37');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 16:27:39');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 16:42:40');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 17:01:47');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 19:06:58');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 19:27:33');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 21:22:17');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 21:30:13');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-08 21:41:42');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 21:42:51');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 22:30:34');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-08 23:15:46');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-09 10:23:27');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-09 10:31:15');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-09 10:42:47');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-09 10:43:24');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-09 10:59:27');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-09 11:08:50');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-09 12:03:55');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-09 13:14:06');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-09 16:02:39');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-09 16:09:26');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-09 16:09:32');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-09 16:46:40');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-09 17:26:55');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-09 21:25:59');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-10 11:29:50');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-10 11:37:19');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-10 12:02:51');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-10 20:03:10');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-10 20:09:50');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-10 20:16:59');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-10 20:20:37');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-10 20:27:57');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-10 20:33:27');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-10 20:46:00');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-10 20:46:26');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-11 10:44:01');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-11 10:44:06');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-11 11:24:50');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-11 11:24:58');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-11 11:29:13');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-11 12:02:54');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-11 12:42:36');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-11 20:29:09');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-11 21:15:46');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-11 21:21:42');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-11 21:43:58');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-11 21:44:05');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-11 21:48:06');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-11 22:21:00');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-11 22:21:06');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-11 23:43:27');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 09:10:06');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 10:10:51');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 10:18:39');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 11:25:54');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 14:58:45');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 16:40:43');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 17:06:00');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-12 17:41:30');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 17:42:12');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 17:50:31');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 20:07:53');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 20:27:28');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 21:37:06');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 21:39:26');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 22:00:31');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 22:18:57');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-12 22:20:30');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 22:20:38');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 22:32:27');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 22:38:37');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-12 22:49:10');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-12 22:49:17');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 10:04:28');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 10:58:44');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 11:06:47');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 11:29:31');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 11:32:50');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 15:53:01');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 16:50:50');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-13 16:52:27');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 16:52:31');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 17:04:40');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-13 17:17:37');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 17:19:55');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-13 17:21:45');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 17:22:20');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-13 17:29:16');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 17:31:04');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-13 17:33:46');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 17:34:30');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-13 17:34:44');
INSERT INTO `sys_logininfor` VALUES (353, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 17:35:26');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-13 17:38:14');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 17:38:26');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-13 17:39:14');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 18:02:01');
INSERT INTO `sys_logininfor` VALUES (358, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-13 18:10:09');
INSERT INTO `sys_logininfor` VALUES (359, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 18:10:40');
INSERT INTO `sys_logininfor` VALUES (360, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-13 18:45:01');
INSERT INTO `sys_logininfor` VALUES (361, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 18:45:07');
INSERT INTO `sys_logininfor` VALUES (362, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-13 18:46:17');
INSERT INTO `sys_logininfor` VALUES (363, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-13 21:20:24');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 21:20:29');
INSERT INTO `sys_logininfor` VALUES (365, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-13 21:24:04');
INSERT INTO `sys_logininfor` VALUES (366, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 21:29:40');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-13 21:51:16');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 22:43:22');
INSERT INTO `sys_logininfor` VALUES (369, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-13 22:43:33');
INSERT INTO `sys_logininfor` VALUES (370, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-13 22:52:12');
INSERT INTO `sys_logininfor` VALUES (371, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-14 10:30:01');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-14 10:52:11');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-14 10:53:26');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-14 11:36:02');
INSERT INTO `sys_logininfor` VALUES (375, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-14 15:43:35');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-14 15:57:05');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-14 16:26:44');
INSERT INTO `sys_logininfor` VALUES (378, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-14 17:22:40');
INSERT INTO `sys_logininfor` VALUES (379, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-14 17:42:07');
INSERT INTO `sys_logininfor` VALUES (380, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-14 21:00:50');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-14 21:03:02');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-14 21:03:37');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-14 21:05:41');
INSERT INTO `sys_logininfor` VALUES (384, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-14 21:13:02');
INSERT INTO `sys_logininfor` VALUES (385, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-02-14 21:14:25');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-14 21:14:28');
INSERT INTO `sys_logininfor` VALUES (387, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-14 21:24:33');
INSERT INTO `sys_logininfor` VALUES (388, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-14 21:32:48');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-14 21:52:16');
INSERT INTO `sys_logininfor` VALUES (390, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-14 22:00:46');
INSERT INTO `sys_logininfor` VALUES (391, 'test', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-02-14 22:00:59');
INSERT INTO `sys_logininfor` VALUES (392, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-14 22:01:15');
INSERT INTO `sys_logininfor` VALUES (393, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-14 22:03:42');
INSERT INTO `sys_logininfor` VALUES (394, 'test', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-14 22:03:54');
INSERT INTO `sys_logininfor` VALUES (395, 'test', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-14 22:04:21');
INSERT INTO `sys_logininfor` VALUES (396, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-14 22:04:27');
INSERT INTO `sys_logininfor` VALUES (397, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-14 22:21:05');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-14 22:38:03');
INSERT INTO `sys_logininfor` VALUES (399, 'Ava', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-14 22:39:09');
INSERT INTO `sys_logininfor` VALUES (400, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-15 20:07:23');
INSERT INTO `sys_logininfor` VALUES (401, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-15 20:19:18');
INSERT INTO `sys_logininfor` VALUES (402, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-15 20:19:25');
INSERT INTO `sys_logininfor` VALUES (403, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-15 20:33:52');
INSERT INTO `sys_logininfor` VALUES (404, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-15 20:33:57');
INSERT INTO `sys_logininfor` VALUES (405, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-15 20:39:15');
INSERT INTO `sys_logininfor` VALUES (406, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-15 20:39:31');
INSERT INTO `sys_logininfor` VALUES (407, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-15 20:43:34');
INSERT INTO `sys_logininfor` VALUES (408, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-15 20:53:31');
INSERT INTO `sys_logininfor` VALUES (409, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-15 21:19:39');
INSERT INTO `sys_logininfor` VALUES (410, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-15 21:19:44');
INSERT INTO `sys_logininfor` VALUES (411, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-15 21:22:52');
INSERT INTO `sys_logininfor` VALUES (412, 'Ava', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-15 22:13:23');
INSERT INTO `sys_logininfor` VALUES (413, 'Ava', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-15 22:13:52');
INSERT INTO `sys_logininfor` VALUES (414, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-02-15 22:15:36');
INSERT INTO `sys_logininfor` VALUES (415, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-02-15 22:16:18');
INSERT INTO `sys_logininfor` VALUES (416, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-02-15 22:16:25');
INSERT INTO `sys_logininfor` VALUES (417, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-02-15 22:16:30');
INSERT INTO `sys_logininfor` VALUES (418, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-02-15 22:16:37');
INSERT INTO `sys_logininfor` VALUES (419, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-15 22:17:45');
INSERT INTO `sys_logininfor` VALUES (420, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-15 22:17:50');
INSERT INTO `sys_logininfor` VALUES (421, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-02-15 22:18:20');
INSERT INTO `sys_logininfor` VALUES (422, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-15 22:18:26');
INSERT INTO `sys_logininfor` VALUES (423, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-15 22:21:50');
INSERT INTO `sys_logininfor` VALUES (424, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-15 22:47:31');
INSERT INTO `sys_logininfor` VALUES (425, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-16 14:19:45');
INSERT INTO `sys_logininfor` VALUES (426, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-16 14:19:49');
INSERT INTO `sys_logininfor` VALUES (427, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-16 14:55:43');
INSERT INTO `sys_logininfor` VALUES (428, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-16 14:55:47');
INSERT INTO `sys_logininfor` VALUES (429, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-16 14:56:39');
INSERT INTO `sys_logininfor` VALUES (430, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-16 14:56:43');
INSERT INTO `sys_logininfor` VALUES (431, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-16 15:11:09');
INSERT INTO `sys_logininfor` VALUES (432, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-16 15:11:13');
INSERT INTO `sys_logininfor` VALUES (433, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-16 15:21:14');
INSERT INTO `sys_logininfor` VALUES (434, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-16 17:22:50');
INSERT INTO `sys_logininfor` VALUES (435, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-16 17:22:54');
INSERT INTO `sys_logininfor` VALUES (436, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-16 17:24:51');
INSERT INTO `sys_logininfor` VALUES (437, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-16 21:57:58');
INSERT INTO `sys_logininfor` VALUES (438, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-16 21:58:37');
INSERT INTO `sys_logininfor` VALUES (439, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-16 22:17:58');
INSERT INTO `sys_logininfor` VALUES (440, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-16 22:30:34');
INSERT INTO `sys_logininfor` VALUES (441, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-17 11:38:26');
INSERT INTO `sys_logininfor` VALUES (442, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-17 11:39:07');
INSERT INTO `sys_logininfor` VALUES (443, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-17 16:33:41');
INSERT INTO `sys_logininfor` VALUES (444, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-17 17:01:47');
INSERT INTO `sys_logininfor` VALUES (445, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-17 17:01:55');
INSERT INTO `sys_logininfor` VALUES (446, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-17 17:12:25');
INSERT INTO `sys_logininfor` VALUES (447, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-17 17:12:33');
INSERT INTO `sys_logininfor` VALUES (448, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-17 17:19:46');
INSERT INTO `sys_logininfor` VALUES (449, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-17 17:37:44');
INSERT INTO `sys_logininfor` VALUES (450, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-17 17:37:51');
INSERT INTO `sys_logininfor` VALUES (451, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-17 17:37:58');
INSERT INTO `sys_logininfor` VALUES (452, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-17 17:41:11');
INSERT INTO `sys_logininfor` VALUES (453, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-17 17:43:30');
INSERT INTO `sys_logininfor` VALUES (454, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-17 17:45:13');
INSERT INTO `sys_logininfor` VALUES (455, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-17 17:45:43');
INSERT INTO `sys_logininfor` VALUES (456, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-17 17:46:44');
INSERT INTO `sys_logininfor` VALUES (457, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-17 17:50:53');
INSERT INTO `sys_logininfor` VALUES (458, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-17 17:51:01');
INSERT INTO `sys_logininfor` VALUES (459, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-17 23:32:21');
INSERT INTO `sys_logininfor` VALUES (460, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-18 07:55:25');
INSERT INTO `sys_logininfor` VALUES (461, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-18 08:00:43');
INSERT INTO `sys_logininfor` VALUES (462, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-18 08:00:51');
INSERT INTO `sys_logininfor` VALUES (463, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-18 15:15:34');
INSERT INTO `sys_logininfor` VALUES (464, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-18 15:23:14');
INSERT INTO `sys_logininfor` VALUES (465, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-18 15:27:24');
INSERT INTO `sys_logininfor` VALUES (466, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-18 15:35:28');
INSERT INTO `sys_logininfor` VALUES (467, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-18 20:03:30');
INSERT INTO `sys_logininfor` VALUES (468, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-18 20:13:03');
INSERT INTO `sys_logininfor` VALUES (469, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-18 21:50:55');
INSERT INTO `sys_logininfor` VALUES (470, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-18 23:50:11');
INSERT INTO `sys_logininfor` VALUES (471, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-19 00:00:33');
INSERT INTO `sys_logininfor` VALUES (472, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-19 00:01:28');
INSERT INTO `sys_logininfor` VALUES (473, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-19 06:35:29');
INSERT INTO `sys_logininfor` VALUES (474, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-19 11:04:53');
INSERT INTO `sys_logininfor` VALUES (475, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-19 14:49:17');
INSERT INTO `sys_logininfor` VALUES (476, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-19 15:36:02');
INSERT INTO `sys_logininfor` VALUES (477, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-19 15:53:17');
INSERT INTO `sys_logininfor` VALUES (478, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-19 16:03:38');
INSERT INTO `sys_logininfor` VALUES (479, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-19 16:03:48');
INSERT INTO `sys_logininfor` VALUES (480, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-19 16:23:34');
INSERT INTO `sys_logininfor` VALUES (481, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-19 18:02:13');
INSERT INTO `sys_logininfor` VALUES (482, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-19 18:11:51');
INSERT INTO `sys_logininfor` VALUES (483, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-19 20:11:30');
INSERT INTO `sys_logininfor` VALUES (484, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-19 21:58:58');
INSERT INTO `sys_logininfor` VALUES (485, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-19 22:31:59');
INSERT INTO `sys_logininfor` VALUES (486, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-19 23:04:11');
INSERT INTO `sys_logininfor` VALUES (487, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-19 23:50:23');
INSERT INTO `sys_logininfor` VALUES (488, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-20 10:57:06');
INSERT INTO `sys_logininfor` VALUES (489, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-20 11:21:56');
INSERT INTO `sys_logininfor` VALUES (490, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-20 12:31:04');
INSERT INTO `sys_logininfor` VALUES (491, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-20 15:31:49');
INSERT INTO `sys_logininfor` VALUES (492, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-20 16:25:55');
INSERT INTO `sys_logininfor` VALUES (493, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-20 16:30:49');
INSERT INTO `sys_logininfor` VALUES (494, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-20 16:30:55');
INSERT INTO `sys_logininfor` VALUES (495, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-20 16:47:09');
INSERT INTO `sys_logininfor` VALUES (496, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-20 16:47:17');
INSERT INTO `sys_logininfor` VALUES (497, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-20 17:12:01');
INSERT INTO `sys_logininfor` VALUES (498, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-20 17:12:08');
INSERT INTO `sys_logininfor` VALUES (499, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-20 18:12:29');
INSERT INTO `sys_logininfor` VALUES (500, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-20 18:14:55');
INSERT INTO `sys_logininfor` VALUES (501, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-20 18:19:54');
INSERT INTO `sys_logininfor` VALUES (502, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-20 18:50:41');
INSERT INTO `sys_logininfor` VALUES (503, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-20 19:55:04');
INSERT INTO `sys_logininfor` VALUES (504, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-20 20:42:04');
INSERT INTO `sys_logininfor` VALUES (505, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-26 14:44:36');
INSERT INTO `sys_logininfor` VALUES (506, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-26 15:59:49');
INSERT INTO `sys_logininfor` VALUES (507, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-26 16:02:46');
INSERT INTO `sys_logininfor` VALUES (508, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-26 18:54:01');
INSERT INTO `sys_logininfor` VALUES (509, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-26 19:16:32');
INSERT INTO `sys_logininfor` VALUES (510, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-26 19:39:48');
INSERT INTO `sys_logininfor` VALUES (511, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-26 19:44:25');
INSERT INTO `sys_logininfor` VALUES (512, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-26 19:44:32');
INSERT INTO `sys_logininfor` VALUES (513, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-26 19:50:35');
INSERT INTO `sys_logininfor` VALUES (514, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-26 20:40:37');
INSERT INTO `sys_logininfor` VALUES (515, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-26 20:41:02');
INSERT INTO `sys_logininfor` VALUES (516, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-26 21:43:31');
INSERT INTO `sys_logininfor` VALUES (517, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-02-26 21:43:32');
INSERT INTO `sys_logininfor` VALUES (518, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-26 21:43:37');
INSERT INTO `sys_logininfor` VALUES (519, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-26 22:07:36');
INSERT INTO `sys_logininfor` VALUES (520, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-26 22:20:34');
INSERT INTO `sys_logininfor` VALUES (521, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-26 22:26:42');
INSERT INTO `sys_logininfor` VALUES (522, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 09:54:05');
INSERT INTO `sys_logininfor` VALUES (523, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 10:50:07');
INSERT INTO `sys_logininfor` VALUES (524, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 11:07:38');
INSERT INTO `sys_logininfor` VALUES (525, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 14:40:32');
INSERT INTO `sys_logininfor` VALUES (526, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 14:44:52');
INSERT INTO `sys_logininfor` VALUES (527, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 14:52:49');
INSERT INTO `sys_logininfor` VALUES (528, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 15:24:56');
INSERT INTO `sys_logininfor` VALUES (529, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 16:18:40');
INSERT INTO `sys_logininfor` VALUES (530, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 17:18:05');
INSERT INTO `sys_logininfor` VALUES (531, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-27 17:23:01');
INSERT INTO `sys_logininfor` VALUES (532, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 17:23:08');
INSERT INTO `sys_logininfor` VALUES (533, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 18:31:27');
INSERT INTO `sys_logininfor` VALUES (534, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 19:12:03');
INSERT INTO `sys_logininfor` VALUES (535, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 19:44:40');
INSERT INTO `sys_logininfor` VALUES (536, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 20:00:47');
INSERT INTO `sys_logininfor` VALUES (537, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-27 20:20:15');
INSERT INTO `sys_logininfor` VALUES (538, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 20:29:39');
INSERT INTO `sys_logininfor` VALUES (539, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-27 21:37:48');
INSERT INTO `sys_logininfor` VALUES (540, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 21:37:54');
INSERT INTO `sys_logininfor` VALUES (541, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-27 21:39:46');
INSERT INTO `sys_logininfor` VALUES (542, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 21:39:51');
INSERT INTO `sys_logininfor` VALUES (543, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-27 21:43:39');
INSERT INTO `sys_logininfor` VALUES (544, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 21:49:47');
INSERT INTO `sys_logininfor` VALUES (545, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 22:12:10');
INSERT INTO `sys_logininfor` VALUES (546, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-27 22:14:04');
INSERT INTO `sys_logininfor` VALUES (547, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 22:14:13');
INSERT INTO `sys_logininfor` VALUES (548, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 23:45:11');
INSERT INTO `sys_logininfor` VALUES (549, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 23:47:44');
INSERT INTO `sys_logininfor` VALUES (550, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-28 14:30:22');
INSERT INTO `sys_logininfor` VALUES (551, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-28 14:30:48');
INSERT INTO `sys_logininfor` VALUES (552, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-28 14:33:35');
INSERT INTO `sys_logininfor` VALUES (553, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-28 14:38:59');
INSERT INTO `sys_logininfor` VALUES (554, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-02-28 15:00:35');
INSERT INTO `sys_logininfor` VALUES (555, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-28 15:00:39');
INSERT INTO `sys_logininfor` VALUES (556, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-28 15:44:59');
INSERT INTO `sys_logininfor` VALUES (557, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-28 21:35:53');
INSERT INTO `sys_logininfor` VALUES (558, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-28 21:46:49');
INSERT INTO `sys_logininfor` VALUES (559, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-29 16:49:45');
INSERT INTO `sys_logininfor` VALUES (560, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-29 19:21:44');
INSERT INTO `sys_logininfor` VALUES (561, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-29 19:32:23');
INSERT INTO `sys_logininfor` VALUES (562, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-29 20:34:42');
INSERT INTO `sys_logininfor` VALUES (563, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-29 20:34:48');
INSERT INTO `sys_logininfor` VALUES (564, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-29 21:21:16');
INSERT INTO `sys_logininfor` VALUES (565, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-29 21:30:34');
INSERT INTO `sys_logininfor` VALUES (566, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-29 21:30:46');
INSERT INTO `sys_logininfor` VALUES (567, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-29 21:30:58');
INSERT INTO `sys_logininfor` VALUES (568, 'admin2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-29 21:31:15');
INSERT INTO `sys_logininfor` VALUES (569, 'admin2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-29 21:31:38');
INSERT INTO `sys_logininfor` VALUES (570, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-29 21:31:46');
INSERT INTO `sys_logininfor` VALUES (571, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-29 21:32:21');
INSERT INTO `sys_logininfor` VALUES (572, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-29 22:48:29');
INSERT INTO `sys_logininfor` VALUES (573, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-29 22:48:58');
INSERT INTO `sys_logininfor` VALUES (574, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-29 22:49:12');
INSERT INTO `sys_logininfor` VALUES (575, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-29 22:49:23');
INSERT INTO `sys_logininfor` VALUES (576, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-29 22:49:32');
INSERT INTO `sys_logininfor` VALUES (577, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-01 15:54:30');
INSERT INTO `sys_logininfor` VALUES (578, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-01 17:12:10');
INSERT INTO `sys_logininfor` VALUES (579, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-01 17:12:21');
INSERT INTO `sys_logininfor` VALUES (580, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-01 17:14:08');
INSERT INTO `sys_logininfor` VALUES (581, 'admin3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-01 17:14:17');
INSERT INTO `sys_logininfor` VALUES (582, 'admin3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-01 17:15:18');
INSERT INTO `sys_logininfor` VALUES (583, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-03-01 17:31:49');
INSERT INTO `sys_logininfor` VALUES (584, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-01 17:31:55');
INSERT INTO `sys_logininfor` VALUES (585, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-01 17:33:52');
INSERT INTO `sys_logininfor` VALUES (586, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-01 20:59:43');
INSERT INTO `sys_logininfor` VALUES (587, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-02 15:37:56');
INSERT INTO `sys_logininfor` VALUES (588, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-02 15:38:22');
INSERT INTO `sys_logininfor` VALUES (589, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-03-02 15:45:18');
INSERT INTO `sys_logininfor` VALUES (590, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-02 15:45:24');
INSERT INTO `sys_logininfor` VALUES (591, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-02 15:47:43');
INSERT INTO `sys_logininfor` VALUES (592, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-02 22:45:45');
INSERT INTO `sys_logininfor` VALUES (593, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-03 20:35:55');
INSERT INTO `sys_logininfor` VALUES (594, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-05 17:10:33');
INSERT INTO `sys_logininfor` VALUES (595, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-03-05 20:41:14');
INSERT INTO `sys_logininfor` VALUES (596, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-05 20:41:20');
INSERT INTO `sys_logininfor` VALUES (597, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-05 23:29:46');
INSERT INTO `sys_logininfor` VALUES (598, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-03-06 13:00:43');
INSERT INTO `sys_logininfor` VALUES (599, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-06 13:00:50');
INSERT INTO `sys_logininfor` VALUES (600, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-06 13:02:58');
INSERT INTO `sys_logininfor` VALUES (601, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-03-06 13:03:48');
INSERT INTO `sys_logininfor` VALUES (602, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-06 13:04:01');
INSERT INTO `sys_logininfor` VALUES (603, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-06 13:04:26');
INSERT INTO `sys_logininfor` VALUES (604, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-06 16:38:40');
INSERT INTO `sys_logininfor` VALUES (605, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-06 19:33:15');
INSERT INTO `sys_logininfor` VALUES (606, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-06 20:09:18');
INSERT INTO `sys_logininfor` VALUES (607, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-06 20:30:23');
INSERT INTO `sys_logininfor` VALUES (608, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-06 21:35:28');
INSERT INTO `sys_logininfor` VALUES (609, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-06 22:22:07');
INSERT INTO `sys_logininfor` VALUES (610, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-06 22:36:49');
INSERT INTO `sys_logininfor` VALUES (611, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-06 22:48:54');
INSERT INTO `sys_logininfor` VALUES (612, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-06 23:14:08');
INSERT INTO `sys_logininfor` VALUES (613, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-06 23:14:16');
INSERT INTO `sys_logininfor` VALUES (614, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-07 16:11:45');
INSERT INTO `sys_logininfor` VALUES (615, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-07 16:11:54');
INSERT INTO `sys_logininfor` VALUES (616, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-07 17:10:44');
INSERT INTO `sys_logininfor` VALUES (617, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-07 17:20:39');
INSERT INTO `sys_logininfor` VALUES (618, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-07 17:20:45');
INSERT INTO `sys_logininfor` VALUES (619, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-07 19:34:52');
INSERT INTO `sys_logininfor` VALUES (620, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-07 20:31:57');
INSERT INTO `sys_logininfor` VALUES (621, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-07 20:32:03');
INSERT INTO `sys_logininfor` VALUES (622, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-07 20:33:00');
INSERT INTO `sys_logininfor` VALUES (623, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-07 20:33:07');
INSERT INTO `sys_logininfor` VALUES (624, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-07 20:37:26');
INSERT INTO `sys_logininfor` VALUES (625, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-07 20:42:23');
INSERT INTO `sys_logininfor` VALUES (626, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-07 20:44:29');
INSERT INTO `sys_logininfor` VALUES (627, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-07 20:44:35');
INSERT INTO `sys_logininfor` VALUES (628, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-07 21:00:15');
INSERT INTO `sys_logininfor` VALUES (629, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-07 21:00:21');
INSERT INTO `sys_logininfor` VALUES (630, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-07 21:04:34');
INSERT INTO `sys_logininfor` VALUES (631, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-07 21:05:17');
INSERT INTO `sys_logininfor` VALUES (632, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-07 21:18:36');
INSERT INTO `sys_logininfor` VALUES (633, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-03-07 21:41:25');
INSERT INTO `sys_logininfor` VALUES (634, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-07 21:41:33');
INSERT INTO `sys_logininfor` VALUES (635, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-07 22:01:51');
INSERT INTO `sys_logininfor` VALUES (636, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-08 00:16:02');
INSERT INTO `sys_logininfor` VALUES (637, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-08 13:12:29');
INSERT INTO `sys_logininfor` VALUES (638, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-08 16:09:30');
INSERT INTO `sys_logininfor` VALUES (639, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-08 16:28:13');
INSERT INTO `sys_logininfor` VALUES (640, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-08 19:56:08');
INSERT INTO `sys_logininfor` VALUES (641, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-08 20:01:58');
INSERT INTO `sys_logininfor` VALUES (642, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-03-08 20:25:51');
INSERT INTO `sys_logininfor` VALUES (643, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-08 20:25:56');
INSERT INTO `sys_logininfor` VALUES (644, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-08 20:38:04');
INSERT INTO `sys_logininfor` VALUES (645, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-08 21:25:17');
INSERT INTO `sys_logininfor` VALUES (646, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-08 22:31:18');
INSERT INTO `sys_logininfor` VALUES (647, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-08 23:20:14');
INSERT INTO `sys_logininfor` VALUES (648, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-08 23:27:23');
INSERT INTO `sys_logininfor` VALUES (649, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-03-08 23:32:53');
INSERT INTO `sys_logininfor` VALUES (650, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-03-08 23:32:55');
INSERT INTO `sys_logininfor` VALUES (651, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-08 23:33:01');
INSERT INTO `sys_logininfor` VALUES (652, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-08 23:33:26');
INSERT INTO `sys_logininfor` VALUES (653, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-09 00:16:33');
INSERT INTO `sys_logininfor` VALUES (654, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-09 00:22:36');
INSERT INTO `sys_logininfor` VALUES (655, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-09 00:24:01');
INSERT INTO `sys_logininfor` VALUES (656, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-09 11:25:07');
INSERT INTO `sys_logininfor` VALUES (657, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-09 13:49:15');
INSERT INTO `sys_logininfor` VALUES (658, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-09 15:37:04');
INSERT INTO `sys_logininfor` VALUES (659, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-09 16:06:14');
INSERT INTO `sys_logininfor` VALUES (660, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-09 16:06:20');
INSERT INTO `sys_logininfor` VALUES (661, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-09 16:14:15');
INSERT INTO `sys_logininfor` VALUES (662, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-09 16:41:42');
INSERT INTO `sys_logininfor` VALUES (663, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-09 16:45:03');
INSERT INTO `sys_logininfor` VALUES (664, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-09 19:29:24');
INSERT INTO `sys_logininfor` VALUES (665, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-10 13:11:06');
INSERT INTO `sys_logininfor` VALUES (666, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-10 13:12:24');
INSERT INTO `sys_logininfor` VALUES (667, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-10 14:30:03');
INSERT INTO `sys_logininfor` VALUES (668, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-03-10 23:15:07');
INSERT INTO `sys_logininfor` VALUES (669, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-03-10 23:15:08');
INSERT INTO `sys_logininfor` VALUES (670, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-10 23:15:13');
INSERT INTO `sys_logininfor` VALUES (671, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-03-11 18:12:12');
INSERT INTO `sys_logininfor` VALUES (672, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-03-11 18:17:52');
INSERT INTO `sys_logininfor` VALUES (673, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-03-11 18:31:09');
INSERT INTO `sys_logininfor` VALUES (674, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-03-11 18:32:45');
INSERT INTO `sys_logininfor` VALUES (675, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2024-03-11 18:37:34');
INSERT INTO `sys_logininfor` VALUES (676, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2024-03-11 18:37:39');
INSERT INTO `sys_logininfor` VALUES (677, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-03-11 18:37:45');
INSERT INTO `sys_logininfor` VALUES (678, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-03-11 18:39:56');
INSERT INTO `sys_logininfor` VALUES (679, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2024-03-11 18:50:13');
INSERT INTO `sys_logininfor` VALUES (680, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-03-11 18:50:19');
INSERT INTO `sys_logininfor` VALUES (681, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-03-11 18:51:44');
INSERT INTO `sys_logininfor` VALUES (682, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-12 11:35:15');
INSERT INTO `sys_logininfor` VALUES (683, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-12 11:46:59');
INSERT INTO `sys_logininfor` VALUES (684, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-12 16:54:23');
INSERT INTO `sys_logininfor` VALUES (685, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-12 17:10:08');
INSERT INTO `sys_logininfor` VALUES (686, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-12 17:25:24');
INSERT INTO `sys_logininfor` VALUES (687, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-12 19:58:58');
INSERT INTO `sys_logininfor` VALUES (688, 'admin', '192.168.43.120', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-03-12 21:01:28');
INSERT INTO `sys_logininfor` VALUES (689, 'admin', '192.168.43.120', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-12 21:01:34');
INSERT INTO `sys_logininfor` VALUES (690, 'admin', '192.168.43.120', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-12 21:05:43');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2013 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 4, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-01-26 22:08:12', 'admin', '2024-02-13 11:15:59', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 5, 'monitor', NULL, '', 1, 0, 'M', '0', '1', '', 'monitor', 'admin', '2024-01-26 22:08:12', 'admin', '2024-02-27 18:43:08', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 6, 'tool', NULL, '', 1, 0, 'M', '0', '1', '', 'tool', 'admin', '2024-01-26 22:08:12', 'admin', '2024-02-27 18:43:19', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 8, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '1', '', 'guide', 'admin', '2024-01-26 22:08:12', 'admin', '2024-02-27 19:59:10', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '1', 'system:user:list', 'user', 'admin', '2024-01-26 22:08:12', 'admin', '2024-02-29 21:31:58', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '1', 'system:role:list', 'peoples', 'admin', '2024-01-26 22:08:12', 'admin', '2024-02-29 21:32:07', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-01-26 22:08:12', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '1', 'system:dept:list', 'tree', 'admin', '2024-01-26 22:08:12', 'admin', '2024-02-06 18:22:58', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '1', 'system:post:list', 'post', 'admin', '2024-01-26 22:08:12', 'admin', '2024-02-06 18:23:15', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '1', 'system:dict:list', 'dict', 'admin', '2024-01-26 22:08:12', 'admin', '2024-02-13 11:04:06', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '1', 'system:config:list', 'edit', 'admin', '2024-01-26 22:08:12', 'admin', '2024-02-14 17:10:46', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '1', 'system:notice:list', 'message', 'admin', '2024-01-26 22:08:12', 'admin', '2024-02-06 18:25:23', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-01-26 22:08:12', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-01-26 22:08:12', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '1', 'monitor:job:list', 'job', 'admin', '2024-01-26 22:08:12', 'admin', '2024-02-10 20:21:35', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-01-26 22:08:12', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-01-26 22:08:12', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-01-26 22:08:12', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-01-26 22:08:12', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-01-26 22:08:12', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-01-26 22:08:12', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-01-26 22:08:12', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-01-26 22:08:12', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-01-26 22:08:12', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '后台管理', 0, 1, 'back', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'manage', 'admin', '2024-02-07 16:56:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '用户管理', 2000, 1, 'user', 'back/user/index', NULL, 1, 0, 'C', '0', '0', 'back:user:list', 'user', 'admin', '2024-02-07 17:02:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '商品管理', 2000, 2, 'commodity', 'back/commodity/index', NULL, 1, 0, 'C', '0', '0', 'back:commodity:list', 'commodity', 'admin', '2024-02-10 12:09:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '订单管理', 2000, 3, 'order', 'back/order/index', NULL, 1, 0, 'C', '0', '0', 'back:order:list', 'order', 'admin', '2024-02-12 21:39:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '评论管理', 2006, 2, 'remark', 'benefit/remark/index', NULL, 1, 0, 'C', '0', '0', 'benefit:remark:list', 'view', 'admin', '2024-02-13 10:41:53', 'admin', '2024-02-26 14:46:12', '');
INSERT INTO `sys_menu` VALUES (2005, '公告管理', 2006, 1, 'notice', 'benefit/notice/index', NULL, 1, 0, 'C', '0', '0', 'benefit:notice:list', 'notice', 'admin', '2024-02-13 11:05:18', 'admin', '2024-02-20 20:39:28', '');
INSERT INTO `sys_menu` VALUES (2006, '权益管理', 0, 2, 'benefit', NULL, NULL, 1, 0, 'M', '0', '0', '', 'benefit', 'admin', '2024-02-13 11:15:28', 'admin', '2024-02-13 11:16:26', '');
INSERT INTO `sys_menu` VALUES (2007, '优惠券管理', 2006, 3, 'coupon', 'benefit/coupon/index', NULL, 1, 0, 'C', '0', '0', 'benefit:coupon:list', 'coupon', 'admin', '2024-02-13 11:17:43', 'admin', '2024-02-29 22:55:24', '');
INSERT INTO `sys_menu` VALUES (2008, '溯源管理', 0, 3, 'traceability', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'traceability', 'admin', '2024-02-13 11:26:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '供应管理', 2008, 1, 'offer', 'traceability/offer/index', NULL, 1, 0, 'C', '0', '0', 'traceability:offer:list', 'offer', 'admin', '2024-02-13 11:42:26', 'admin', '2024-02-13 11:42:48', '');
INSERT INTO `sys_menu` VALUES (2010, '运输管理', 2008, 2, 'transport', 'traceability/transport/index', NULL, 1, 0, 'C', '0', '0', 'traceability:transport:list', 'transport', 'admin', '2024-02-13 11:43:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '销售管理', 2008, 3, 'sell', 'traceability/sell/index', NULL, 1, 0, 'C', '0', '0', 'traceability:sell:list', 'sell', 'admin', '2024-02-13 11:44:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '区块链浏览器', 0, 7, 'http://101.200.85.246:5002/WeBASE-Front/#/home', 'monitor/browser/index', NULL, 0, 0, 'M', '0', '0', '', 'browser', 'admin', '2024-02-27 18:41:35', 'admin', '2024-02-27 20:03:18', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-01-26 22:08:13', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-01-26 22:08:13', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 455 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"web_user_detail\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-31 16:53:48', 786);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"web_user_detail\"}', NULL, 0, NULL, '2024-01-31 16:53:52', 170);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-31 17:25:56', 180);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"web_user_detail\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-31 17:26:16', 760);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"web_user_detail\"}', NULL, 0, NULL, '2024-01-31 17:26:19', 56);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-31 17:30:00', 170);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"web_user_detail\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-31 17:30:05', 709);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-31 17:34:07', 198);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"web_user_detail\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-31 17:34:12', 751);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"web_user_detail\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-31 17:34:13', 708);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-31 17:34:18', 209);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-31 17:35:03', 175);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"web_user_detail\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-31 17:35:10', 742);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"web_user_detail\"}', NULL, 0, NULL, '2024-01-31 17:35:24', 42);
INSERT INTO `sys_oper_log` VALUES (114, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-03 11:36:22', 58);
INSERT INTO `sys_oper_log` VALUES (115, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"测试用\",\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"client \",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-04 14:14:13', 232);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-06 18:22:25', 104);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-06 18:22:58', 67);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-06 18:23:15', 77);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-06 18:24:02', 65);
INSERT INTO `sys_oper_log` VALUES (120, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"N\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2024-01-26 22:08:13\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-06 18:24:38', 121);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"通知公告\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":1,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-06 18:25:23', 67);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"manage\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"后台管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"back\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-07 16:56:20', 118);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-07 16:56:33', 64);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-07 16:56:40', 64);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-07 16:56:46', 64);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-02-07 16:56:54', 116);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-07 16:57:04', 67);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-02-07 16:57:07', 40);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-07 16:57:27', 63);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"back/user/index\",\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"user\",\"perms\":\"back:user:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-07 17:02:28', 86);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-02-07 21:01:21', 48);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-07 21:01:25', 100);
INSERT INTO `sys_oper_log` VALUES (133, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"18\",\"createTime\":\"2024-02-08 22:09:37\",\"love\":\"花叶类,茄类,辣椒类\",\"loveList\":[\"花叶类\",\"茄类\",\"辣椒类\"],\"nickname\":\"Jack\",\"params\":{},\"permission\":0,\"phone\":\"18369883001\",\"profileImage\":\"https://picsum.photos/seed/picsum/200/300\",\"pwd\":\"123456\",\"sex\":\"0\",\"updateTime\":\"2024-02-09 23:19:56\",\"userId\":200011}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-08 22:09:37', 56);
INSERT INTO `sys_oper_log` VALUES (134, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"30\",\"createTime\":\"2024-02-08 22:09:59\",\"love\":\"花叶类,茄类,辣椒类\",\"loveList\":[\"花叶类\",\"茄类\",\"辣椒类\"],\"nickname\":\"Jack\",\"params\":{},\"permission\":0,\"phone\":\"13061199456\",\"profileImage\":\"https://picsum.photos/seed/picsum/200/300\",\"pwd\":\"123456\",\"sex\":\"1\",\"updateTime\":\"2024-02-09 23:19:56\",\"userId\":200012}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-08 22:09:59', 43);
INSERT INTO `sys_oper_log` VALUES (135, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"18\",\"createTime\":\"2023-12-16 18:30:46\",\"love\":\"花叶类,茄类,辣椒类\",\"loveList\":[\"花叶类\",\"茄类\",\"辣椒类\"],\"nickname\":\"Jack\",\"params\":{},\"permission\":0,\"phone\":\"13061199456\",\"profileImage\":\"https://picsum.photos/seed/picsum/200/300\",\"pwd\":\"123456\",\"sex\":\"0\",\"updateTime\":\"2024-02-08 22:11:37\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-08 22:11:36', 46);
INSERT INTO `sys_oper_log` VALUES (136, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"33\",\"createTime\":\"2023-12-20 18:12:43\",\"love\":\"水生根茎类,辣椒类\",\"loveList\":[\"水生根茎类\",\"辣椒类\"],\"nickname\":\"Rose\",\"params\":{},\"permission\":0,\"phone\":\"18691194539\",\"profileImage\":\"https://s2.loli.net/2024/02/08/GLqpclg6iJt3uOz.jpg\",\"pwd\":\"9TeevqqbQd\",\"sex\":\"1\",\"updateTime\":\"2024-02-08 22:44:52\",\"userId\":200002}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-08 22:44:51', 65);
INSERT INTO `sys_oper_log` VALUES (137, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"19\",\"createTime\":\"2024-01-27 01:43:39\",\"love\":\"茄类,辣椒类\",\"loveList\":[\"辣椒类\",\"食用菌\"],\"nickname\":\"William\",\"params\":{},\"permission\":0,\"phone\":\"17861179759\",\"profileImage\":\"https://s2.loli.net/2024/02/08/R8pBfGQwqFkaWnt.jpg\",\"pwd\":\"gfx9vhOnBe\",\"sex\":\"0\",\"updateTime\":\"2024-02-08 23:07:40\",\"userId\":200007}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-08 23:07:39', 49);
INSERT INTO `sys_oper_log` VALUES (138, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"19\",\"createTime\":\"2024-01-27 01:43:39\",\"love\":\"茄类,辣椒类\",\"loveList\":[\"辣椒类\"],\"nickname\":\"William\",\"params\":{},\"permission\":0,\"phone\":\"17861179759\",\"profileImage\":\"https://s2.loli.net/2024/02/08/R8pBfGQwqFkaWnt.jpg\",\"pwd\":\"gfx9vhOnBe\",\"sex\":\"0\",\"updateTime\":\"2024-02-08 23:07:57\",\"userId\":200007}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-08 23:07:56', 49);
INSERT INTO `sys_oper_log` VALUES (139, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"23\",\"createTime\":\"2024-01-21 03:36:55\",\"love\":\"水生根茎类,食用菌,花叶类\",\"loveList\":[\"花叶类\",\"食用菌\"],\"nickname\":\"Ava\",\"params\":{},\"permission\":0,\"phone\":\"13061194516\",\"profileImage\":\"https://s2.loli.net/2024/02/08/irATxF7owf16JWD.jpg\",\"pwd\":\"yB7eEeakRd\",\"sex\":\"0\",\"updateTime\":\"2024-02-08 23:09:18\",\"userId\":200005}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-08 23:09:18', 50);
INSERT INTO `sys_oper_log` VALUES (140, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"18\",\"createTime\":\"2023-12-16 18:30:46\",\"love\":\"null花叶类辣椒类食用菌水生根茎类\",\"loveList\":[\"花叶类\",\"辣椒类\",\"食用菌\",\"水生根茎类\"],\"nickname\":\"Jack\",\"params\":{},\"permission\":0,\"phone\":\"13061199456\",\"profileImage\":\"https://picsum.photos/seed/picsum/200/300\",\"pwd\":\"123456\",\"sex\":\"0\",\"updateTime\":\"2024-02-08 23:19:03\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-08 23:19:04', 63);
INSERT INTO `sys_oper_log` VALUES (141, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"21\",\"createTime\":\"2024-01-02 12:35:18\",\"love\":\"食用菌,茄类\",\"loveList\":[\"茄类\",\"食用菌\"],\"nickname\":\"Daniel\",\"params\":{},\"permission\":0,\"phone\":\"13061178564\",\"profileImage\":\"https://s2.loli.net/2024/02/08/R8pBfGQwqFkaWnt.jpg\",\"pwd\":\"T0FQ4d5dtl\",\"sex\":\"0\",\"updateTime\":\"2024-02-08 23:21:25\",\"userId\":200010}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-08 23:21:24', 48);
INSERT INTO `sys_oper_log` VALUES (142, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"18\",\"createTime\":\"2023-12-16 18:30:46\",\"love\":\"水生根茎类,花叶类,食用菌,花菜类\",\"loveList\":[\"水生根茎类\",\"花叶类\",\"食用菌\",\"花菜类\"],\"nickname\":\"Jack\",\"params\":{},\"permission\":0,\"phone\":\"13061199456\",\"profileImage\":\"https://picsum.photos/seed/picsum/200/300\",\"pwd\":\"123456\",\"sex\":\"0\",\"updateTime\":\"2024-02-08 23:25:02\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-08 23:25:03', 68);
INSERT INTO `sys_oper_log` VALUES (143, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-08 23:26:52\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-08 23:26:51', 46);
INSERT INTO `sys_oper_log` VALUES (144, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-08 23:27:15\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-08 23:27:14', 44);
INSERT INTO `sys_oper_log` VALUES (145, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-08 23:35:44\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-08 23:35:44', 47);
INSERT INTO `sys_oper_log` VALUES (146, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-08 23:39:57\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-08 23:39:56', 44);
INSERT INTO `sys_oper_log` VALUES (147, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-08 23:40:19\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-08 23:40:19', 43);
INSERT INTO `sys_oper_log` VALUES (148, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-08 23:40:45\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-08 23:40:44', 57);
INSERT INTO `sys_oper_log` VALUES (149, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-08 23:41:08\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-08 23:41:07', 46);
INSERT INTO `sys_oper_log` VALUES (150, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-08 23:42:20\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-08 23:42:19', 47);
INSERT INTO `sys_oper_log` VALUES (151, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"18\",\"createTime\":\"2023-12-16 18:30:46\",\"love\":\"水生根茎类,花菜类,食用菌\",\"loveList\":[\"水生根茎类\",\"花菜类\",\"食用菌\"],\"nickname\":\"Jack\",\"params\":{},\"permission\":0,\"phone\":\"13061199456\",\"profileImage\":\"https://picsum.photos/seed/picsum/200/300\",\"pwd\":\"123456\",\"sex\":\"0\",\"updateTime\":\"2024-02-08 23:44:43\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-08 23:44:42', 61);
INSERT INTO `sys_oper_log` VALUES (152, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, 'Cannot read the array length because \"toUpdate\" is null', '2024-02-08 23:45:53', 7);
INSERT INTO `sys_oper_log` VALUES (153, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, 'Cannot read the array length because \"toUpdate\" is null', '2024-02-08 23:48:32', 0);
INSERT INTO `sys_oper_log` VALUES (154, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, 'Cannot read the array length because \"toUpdate\" is null', '2024-02-08 23:48:52', 0);
INSERT INTO `sys_oper_log` VALUES (155, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, 'Cannot read the array length because \"toUpdate\" is null', '2024-02-08 23:50:42', 0);
INSERT INTO `sys_oper_log` VALUES (156, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, 'Cannot read the array length because \"toUpdate\" is null', '2024-02-08 23:50:46', 1);
INSERT INTO `sys_oper_log` VALUES (157, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, 'Cannot read the array length because \"toUpdate\" is null', '2024-02-08 23:50:52', 0);
INSERT INTO `sys_oper_log` VALUES (158, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, 'Cannot read the array length because \"toUpdate\" is null', '2024-02-08 23:52:08', 0);
INSERT INTO `sys_oper_log` VALUES (159, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, 'Cannot read the array length because \"toUpdate\" is null', '2024-02-09 10:33:15', 9);
INSERT INTO `sys_oper_log` VALUES (160, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"18\",\"createTime\":\"2024-02-09 10:43:25\",\"loveList\":[\"食用菌\",\"辣椒类\"],\"nickname\":\"test\",\"params\":{},\"phone\":\"18369883001\",\"pwd\":\"123456\",\"sex\":\"0\",\"userId\":200013}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 10:43:24', 50);
INSERT INTO `sys_oper_log` VALUES (161, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, '', '2024-02-09 10:43:41', 8);
INSERT INTO `sys_oper_log` VALUES (162, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, '', '2024-02-09 10:45:12', 10);
INSERT INTO `sys_oper_log` VALUES (163, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"1\",\"createTime\":\"2024-02-09 10:46:16\",\"loveList\":[\"食用菌\"],\"nickname\":\"1\",\"params\":{},\"phone\":\"18369883001\",\"pwd\":\"1\",\"sex\":\"0\",\"userId\":200014}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 10:46:15', 65);
INSERT INTO `sys_oper_log` VALUES (164, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, '', '2024-02-09 10:46:53', 10);
INSERT INTO `sys_oper_log` VALUES (165, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, '', '2024-02-09 10:48:07', 9);
INSERT INTO `sys_oper_log` VALUES (166, '【请填写功能名称】', 3, 'com.ruoyi.web.controller.reception.WebUserDetailController.remove()', 'DELETE', 1, 'admin', '研发部门', '/web/userDetail/200012', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 10:49:26', 46);
INSERT INTO `sys_oper_log` VALUES (167, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"18\",\"createTime\":\"2024-02-09 10:49:55\",\"loveList\":[\"花叶类\",\"花菜类\"],\"nickname\":\"1\",\"params\":{},\"phone\":\"18369883001\",\"pwd\":\"1\",\"sex\":\"1\",\"userId\":200015}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 10:49:54', 51);
INSERT INTO `sys_oper_log` VALUES (168, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, '', '2024-02-09 10:49:55', 7);
INSERT INTO `sys_oper_log` VALUES (169, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"18\",\"createTime\":\"2024-02-09 10:51:12\",\"loveList\":[\"花叶类\",\"花菜类\"],\"nickname\":\"1\",\"params\":{},\"phone\":\"18369883001\",\"pwd\":\"1\",\"sex\":\"1\",\"userId\":200016}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 10:51:11', 43);
INSERT INTO `sys_oper_log` VALUES (170, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"1\",\"createTime\":\"2024-02-09 10:52:45\",\"loveList\":[\"花菜类\",\"花叶类\"],\"nickname\":\"1\",\"params\":{},\"phone\":\"18369883001\",\"pwd\":\"1\",\"sex\":\"0\",\"userId\":200017}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 10:52:44', 45);
INSERT INTO `sys_oper_log` VALUES (171, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, '', '2024-02-09 10:59:43', 8);
INSERT INTO `sys_oper_log` VALUES (172, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, '', '2024-02-09 11:01:36', 7);
INSERT INTO `sys_oper_log` VALUES (173, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, '', '2024-02-09 11:05:16', 10);
INSERT INTO `sys_oper_log` VALUES (174, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":200001}', NULL, 1, '', '2024-02-09 11:08:23', 7);
INSERT INTO `sys_oper_log` VALUES (175, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:09:04\",\"userId\":200001}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'param\' in \'class com.ruoyi.web.domain.WebUserDetail\'', '2024-02-09 11:09:05', 16);
INSERT INTO `sys_oper_log` VALUES (176, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:10:29\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 11:10:31', 94);
INSERT INTO `sys_oper_log` VALUES (177, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:11:23\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 11:11:25', 55);
INSERT INTO `sys_oper_log` VALUES (178, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:16:49\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 11:16:51', 51);
INSERT INTO `sys_oper_log` VALUES (179, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:18:41\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 11:18:42', 52);
INSERT INTO `sys_oper_log` VALUES (180, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:25:08\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 11:25:10', 73);
INSERT INTO `sys_oper_log` VALUES (181, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:26:54\",\"userId\":200002}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 11:26:56', 77);
INSERT INTO `sys_oper_log` VALUES (182, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:28:09\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-09 11:28:11', 68);
INSERT INTO `sys_oper_log` VALUES (183, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:31:59\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-09 11:32:00', 50);
INSERT INTO `sys_oper_log` VALUES (184, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:34:43\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-09 11:34:45', 71);
INSERT INTO `sys_oper_log` VALUES (185, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:37:45\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-09 11:37:47', 97);
INSERT INTO `sys_oper_log` VALUES (186, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:38:01\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-09 11:38:03', 51);
INSERT INTO `sys_oper_log` VALUES (187, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:39:47\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-09 11:39:49', 71);
INSERT INTO `sys_oper_log` VALUES (188, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:40:39\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-09 11:40:41', 68);
INSERT INTO `sys_oper_log` VALUES (189, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:40:44\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-09 11:40:45', 47);
INSERT INTO `sys_oper_log` VALUES (190, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:50:00\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 11:50:01', 70);
INSERT INTO `sys_oper_log` VALUES (191, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 11:52:08\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 11:52:10', 71);
INSERT INTO `sys_oper_log` VALUES (192, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 12:00:31\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 12:00:33', 82);
INSERT INTO `sys_oper_log` VALUES (193, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"updateTime\":\"2024-02-09 12:08:06\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-09 12:08:07', 72);
INSERT INTO `sys_oper_log` VALUES (194, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 12:18:49\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 12:18:50', 72);
INSERT INTO `sys_oper_log` VALUES (195, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 13:14:12\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 13:14:13', 57);
INSERT INTO `sys_oper_log` VALUES (196, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 13:15:13\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 13:15:14', 49);
INSERT INTO `sys_oper_log` VALUES (197, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 13:15:15\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 13:15:17', 51);
INSERT INTO `sys_oper_log` VALUES (198, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 13:15:17\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 13:15:19', 52);
INSERT INTO `sys_oper_log` VALUES (199, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"18\",\"createTime\":\"2023-12-16 18:30:46\",\"love\":\"水生根茎类,花菜类,食用菌\",\"loveList\":[\"水生根茎类\",\"花菜类\",\"食用菌\"],\"nickname\":\"Jack\",\"params\":{},\"permission\":1,\"phone\":\"13061199456\",\"profileImage\":\"https://picsum.photos/seed/picsum/200/300\",\"pwd\":\"123456\",\"sex\":\"1\",\"updateTime\":\"2024-02-09 13:15:37\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 13:15:38', 55);
INSERT INTO `sys_oper_log` VALUES (200, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"18\",\"createTime\":\"2023-12-16 18:30:46\",\"love\":\"水生根茎类,花菜类,食用菌\",\"loveList\":[\"水生根茎类\",\"花菜类\",\"食用菌\"],\"nickname\":\"Jack\",\"params\":{},\"permission\":1,\"phone\":\"13061199452\",\"profileImage\":\"https://picsum.photos/seed/picsum/200/300\",\"pwd\":\"12345677\",\"sex\":\"1\",\"updateTime\":\"2024-02-09 13:15:49\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 13:15:51', 116);
INSERT INTO `sys_oper_log` VALUES (201, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 13:20:04\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 13:20:06', 65);
INSERT INTO `sys_oper_log` VALUES (202, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 13:20:07\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 13:20:09', 56);
INSERT INTO `sys_oper_log` VALUES (203, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 13:20:19\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 13:20:20', 58);
INSERT INTO `sys_oper_log` VALUES (204, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 13:20:29\",\"userId\":200006}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 13:20:31', 63);
INSERT INTO `sys_oper_log` VALUES (205, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 13:20:47\",\"userId\":200006}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 13:20:49', 58);
INSERT INTO `sys_oper_log` VALUES (206, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"999\",\"createTime\":\"2024-02-09 13:22:07\",\"love\":\"花叶类,食用菌,茄类\",\"loveList\":[\"花叶类\",\"食用菌\",\"茄类\"],\"nickname\":\"guozhuangzhuang\",\"params\":{},\"phone\":\"13554334565\",\"pwd\":\"111222333\",\"sex\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'age\' at row 1\r\n### The error may exist in file [D:\\block-chain-agriculture\\ruoyi-web\\target\\classes\\mapper\\system\\WebUserDetailMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.WebUserDetailMapper.insertWebUserDetail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into web_user_detail          ( nickname,             pwd,                          age,             love,             sex,             phone,             create_time )           values ( ?,             ?,                          ?,             ?,             ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'age\' at row 1\n; Data truncation: Data too long for column \'age\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'age\' at row 1', '2024-02-09 13:22:09', 133);
INSERT INTO `sys_oper_log` VALUES (207, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"99\",\"createTime\":\"2024-02-09 13:22:17\",\"love\":\"花叶类,食用菌,茄类\",\"loveList\":[\"花叶类\",\"食用菌\",\"茄类\"],\"nickname\":\"guozhuangzhuang\",\"params\":{},\"phone\":\"13554334565\",\"pwd\":\"111222333\",\"sex\":\"0\",\"userId\":200018}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 13:22:18', 64);
INSERT INTO `sys_oper_log` VALUES (208, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 13:23:01\",\"userId\":200011}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 13:23:03', 57);
INSERT INTO `sys_oper_log` VALUES (209, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"18\",\"createTime\":\"2023-12-16 18:30:46\",\"love\":\"水生根茎类,食用菌\",\"loveList\":[\"水生根茎类\",\"食用菌\"],\"nickname\":\"Jack\",\"params\":{},\"permission\":1,\"phone\":\"13061199452\",\"profileImage\":\"https://picsum.photos/seed/picsum/200/300\",\"pwd\":\"12345677\",\"sex\":\"1\",\"updateTime\":\"2024-02-09 16:03:24\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 16:03:24', 56);
INSERT INTO `sys_oper_log` VALUES (210, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"18\",\"createTime\":\"2024-02-09 16:55:17\",\"love\":\"茄类\",\"loveList\":[\"茄类\"],\"nickname\":\"test\",\"params\":{},\"phone\":\"18369883001\",\"profileImage\":\"1\",\"pwd\":\"1\",\"sex\":\"0\",\"userId\":200019}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 16:55:17', 48);
INSERT INTO `sys_oper_log` VALUES (211, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"18\",\"createTime\":\"2024-02-09 16:59:09\",\"love\":\"茄类\",\"loveList\":[\"茄类\"],\"nickname\":\"test\",\"params\":{},\"phone\":\"18369883001\",\"profileImage\":\"https://s2.loli.net/2024/02/08/DE9qcKdWQymIu8C.jpg\",\"pwd\":\"1\",\"sex\":\"0\",\"userId\":200020}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 16:59:09', 44);
INSERT INTO `sys_oper_log` VALUES (212, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"40\",\"createTime\":\"2023-12-12 09:16:06\",\"love\":\"水生根茎类,辣椒类\",\"loveList\":[\"水生根茎类\",\"辣椒类\"],\"nickname\":\"David\",\"params\":{},\"permission\":1,\"phone\":\"17761194594\",\"profileImage\":\"https://s2.loli.net/2024/02/08/R8pBfGQwqFkaWnt.jpg\",\"pwd\":\"krj2jSV31R\",\"sex\":\"0\",\"updateTime\":\"2024-02-09 17:00:50\",\"userId\":200006}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 17:00:50', 47);
INSERT INTO `sys_oper_log` VALUES (213, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 17:12:20\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 17:12:20', 42);
INSERT INTO `sys_oper_log` VALUES (214, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 17:12:40\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 17:12:40', 41);
INSERT INTO `sys_oper_log` VALUES (215, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"89\",\"createTime\":\"2024-02-09 17:27:41\",\"love\":\"花叶类,食用菌,花菜类\",\"loveList\":[\"花叶类\",\"食用菌\",\"花菜类\"],\"nickname\":\"ttt\",\"params\":{},\"phone\":\"13266698625\",\"pwd\":\"8208208820\",\"sex\":\"0\",\"updateTime\":\"2024-02-09 17:27:41\",\"userId\":200021}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 17:27:43', 56);
INSERT INTO `sys_oper_log` VALUES (216, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 17:28:22\",\"userId\":200003}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 17:28:22', 44);
INSERT INTO `sys_oper_log` VALUES (217, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 17:28:25\",\"userId\":200004}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 17:28:25', 49);
INSERT INTO `sys_oper_log` VALUES (218, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 17:28:35\",\"userId\":200005}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 17:28:35', 45);
INSERT INTO `sys_oper_log` VALUES (219, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 17:28:40\",\"userId\":200007}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 17:28:40', 45);
INSERT INTO `sys_oper_log` VALUES (220, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 17:28:44\",\"userId\":200008}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 17:28:44', 73);
INSERT INTO `sys_oper_log` VALUES (221, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-09 17:28:46\",\"userId\":200009}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 17:28:46', 44);
INSERT INTO `sys_oper_log` VALUES (222, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 17:31:44', 77);
INSERT INTO `sys_oper_log` VALUES (223, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 17:31:57', 68);
INSERT INTO `sys_oper_log` VALUES (224, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 17:32:09', 65);
INSERT INTO `sys_oper_log` VALUES (225, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 17:32:14', 65);
INSERT INTO `sys_oper_log` VALUES (226, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"30\",\"createTime\":\"2024-02-09 17:32:41\",\"love\":\"水生根茎类,花菜类,辣椒类,花叶类\",\"loveList\":[\"水生根茎类\",\"花菜类\",\"辣椒类\",\"花叶类\"],\"nickname\":\"rose\",\"params\":{},\"phone\":\"13303363536\",\"pwd\":\"20000000\",\"sex\":\"0\",\"updateTime\":\"2024-02-09 17:32:41\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [D:\\block-chain-agriculture\\ruoyi-web\\target\\classes\\mapper\\system\\WebUserDetailMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.WebUserDetailMapper.insertWebUserDetail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into web_user_detail          ( nickname,             pwd,                          age,             love,             sex,             phone,             create_time,             update_time,             permission )           values ( ?,             ?,                          ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2024-02-09 17:32:43', 130);
INSERT INTO `sys_oper_log` VALUES (227, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"30\",\"createTime\":\"2024-02-09 17:33:44\",\"love\":\"水生根茎类,花菜类,辣椒类,花叶类\",\"loveList\":[\"水生根茎类\",\"花菜类\",\"辣椒类\",\"花叶类\"],\"nickname\":\"rose\",\"params\":{},\"phone\":\"13303363536\",\"pwd\":\"20000000\",\"sex\":\"0\",\"updateTime\":\"2024-02-09 17:33:44\",\"userId\":200022}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 17:33:46', 80);
INSERT INTO `sys_oper_log` VALUES (228, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"18\",\"createTime\":\"2024-02-09 21:27:19\",\"love\":\"辣椒类,花菜类\",\"loveList\":[\"辣椒类\",\"花菜类\"],\"nickname\":\"test\",\"params\":{},\"phone\":\"18369883002\",\"profileImage\":\"https://s2.loli.net/2024/02/08/irATxF7owf16JWD.jpg\",\"pwd\":\"1\",\"sex\":\"1\",\"updateTime\":\"2024-02-09 21:27:19\",\"userId\":200023}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-09 21:27:19', 57);
INSERT INTO `sys_oper_log` VALUES (229, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"back/commodity/index\",\"createBy\":\"admin\",\"icon\":\"commodity\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"commodity\",\"perms\":\"back:commodity:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-10 12:09:27', 99);
INSERT INTO `sys_oper_log` VALUES (230, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-10 20:19:23', 79);
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-10 20:20:49', 93);
INSERT INTO `sys_oper_log` VALUES (232, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/job/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":110,\"menuName\":\"定时任务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"job\",\"perms\":\"monitor:job:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-10 20:21:35', 64);
INSERT INTO `sys_oper_log` VALUES (233, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":true,\"permission\":0,\"updateTime\":\"2024-02-11 12:45:58\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-11 12:45:58', 61);
INSERT INTO `sys_oper_log` VALUES (234, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":200001,\"params\":{},\"perm\":true,\"permission\":0,\"updateTime\":\"2024-02-11 12:48:20\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-11 12:48:20', 80);
INSERT INTO `sys_oper_log` VALUES (235, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115625,\"params\":{},\"perm\":true,\"permission\":0,\"updateTime\":\"2024-02-11 12:49:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-11 12:49:07', 54);
INSERT INTO `sys_oper_log` VALUES (236, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-11 21:49:03\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-11 21:49:03', 95);
INSERT INTO `sys_oper_log` VALUES (237, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":true,\"permission\":0,\"updateTime\":\"2024-02-11 22:47:44\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-11 22:47:44', 58);
INSERT INTO `sys_oper_log` VALUES (238, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115199,\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-11 22:59:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-11 22:59:04', 56);
INSERT INTO `sys_oper_log` VALUES (239, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115199,\"params\":{},\"perm\":true,\"permission\":0,\"updateTime\":\"2024-02-11 22:59:22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-11 22:59:22', 46);
INSERT INTO `sys_oper_log` VALUES (240, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115199,\"params\":{},\"perm\":false,\"permission\":1,\"updateTime\":\"2024-02-11 22:59:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-11 22:59:24', 47);
INSERT INTO `sys_oper_log` VALUES (241, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/editPermission', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115199,\"params\":{},\"perm\":true,\"permission\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-11 23:17:28', 60);
INSERT INTO `sys_oper_log` VALUES (242, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/editPermission', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115199,\"params\":{},\"perm\":false,\"permission\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-11 23:17:31', 50);
INSERT INTO `sys_oper_log` VALUES (243, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/editPermission', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115748,\"params\":{},\"perm\":false,\"permission\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-11 23:17:34', 49);
INSERT INTO `sys_oper_log` VALUES (244, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/editPermission', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115762,\"params\":{},\"perm\":false,\"permission\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 09:14:42', 56);
INSERT INTO `sys_oper_log` VALUES (245, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/editPermission', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115779,\"params\":{},\"perm\":false,\"permission\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 09:15:25', 49);
INSERT INTO `sys_oper_log` VALUES (246, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/editPermission', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115199,\"params\":{},\"perm\":true,\"permission\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 10:29:03', 66);
INSERT INTO `sys_oper_log` VALUES (247, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/editPermission', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115793,\"params\":{},\"perm\":false,\"permission\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 10:29:07', 56);
INSERT INTO `sys_oper_log` VALUES (248, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/editPermission', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115823,\"params\":{},\"perm\":false,\"permission\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 10:29:10', 55);
INSERT INTO `sys_oper_log` VALUES (249, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/editPermission', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115748,\"params\":{},\"perm\":true,\"permission\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 10:49:33', 56);
INSERT INTO `sys_oper_log` VALUES (250, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/editPermission', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115748,\"params\":{},\"perm\":false,\"permission\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 10:49:35', 42);
INSERT INTO `sys_oper_log` VALUES (251, '【请填写功能名称】', 3, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.remove()', 'DELETE', 1, 'admin', '研发部门', '/web/commodityDetail/102900005115199', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 11:05:58', 43);
INSERT INTO `sys_oper_log` VALUES (252, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115625,\"commodityName\":\"本地小毛白菜\",\"commodityPrice\":3,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":123,\"lossRate\":0,\"origin\":\"山东\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F14622788%2Fbd6fc86904d8495d80267c429999b34f.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvMTQ2MjI3ODgvYmQ2ZmM4NjkwNGQ4NDk1ZDgwMjY3YzQyOTk5OWIzNGYuanBn%2Fsign%2Feb7960a8704abf301343f2e4ffdb3c04.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709043646&t=1f83ec542021d10f4f8c02d50df45082\",\"remark\":\"中国原产蔬菜，有悠久的栽培历史，且其种类很多，分别是山东胶州大白菜、北京青白、东北大矮白菜、山西阳城的大毛边、乌金白、蚕白菜等\",\"selling\":90,\"updateTime\":\"2024-02-12 18:07:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 18:07:03', 64);
INSERT INTO `sys_oper_log` VALUES (253, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115625,\"commodityName\":\"本地小毛白菜\",\"commodityPrice\":3,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":123,\"lossRate\":0,\"origin\":\"山东\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F14622788%2Fbd6fc86904d8495d80267c429999b34f.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvMTQ2MjI3ODgvYmQ2ZmM4NjkwNGQ4NDk1ZDgwMjY3YzQyOTk5OWIzNGYuanBn%2Fsign%2Feb7960a8704abf301343f2e4ffdb3c04.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709043646&t=1f83ec542021d10f4f8c02d50df45082\",\"remark\":\"中国原产蔬菜，有悠久的栽培历史，且其种类极其多，分别是山东胶州大白菜、北京青白、东北大矮白菜、山西阳城的大毛边、乌金白、蚕白菜等\",\"selling\":90,\"updateTime\":\"2024-02-12 18:09:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 18:09:35', 83);
INSERT INTO `sys_oper_log` VALUES (254, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115625,\"commodityName\":\"本地小毛白菜\",\"commodityPrice\":3,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":123,\"lossRate\":1,\"origin\":\"山东\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F14622788%2Fbd6fc86904d8495d80267c429999b34f.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvMTQ2MjI3ODgvYmQ2ZmM4NjkwNGQ4NDk1ZDgwMjY3YzQyOTk5OWIzNGYuanBn%2Fsign%2Feb7960a8704abf301343f2e4ffdb3c04.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709043646&t=1f83ec542021d10f4f8c02d50df45082\",\"remark\":\"中国原产蔬菜，有悠久的栽培历史，且其种类极其多，分别是山东胶州大白菜、北京青白、东北大矮白菜、山西阳城的大毛边、乌金白、蚕白菜等\",\"selling\":90,\"updateTime\":\"2024-02-12 20:17:40\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 20:17:39', 59);
INSERT INTO `sys_oper_log` VALUES (255, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115625,\"commodityName\":\"本地小毛白菜\",\"commodityPrice\":3,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":123,\"lossRate\":1,\"origin\":\"山东\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F14622788%2Fbd6fc86904d8495d80267c429999b34f.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvMTQ2MjI3ODgvYmQ2ZmM4NjkwNGQ4NDk1ZDgwMjY3YzQyOTk5OWIzNGYuanBn%2Fsign%2Feb7960a8704abf301343f2e4ffdb3c04.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709043646&t=1f83ec542021d10f4f8c02d50df45082\",\"remark\":\"中国原产蔬菜，有悠久的栽培历史，且其种类极其多，分别是山东胶州大白菜、北京青白、东北大矮白菜、山西阳城的大毛边、乌金白、蚕白菜等\",\"selling\":92,\"updateTime\":\"2024-02-12 20:18:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 20:18:43', 48);
INSERT INTO `sys_oper_log` VALUES (256, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115748,\"commodityName\":\"白菜苔\",\"commodityPrice\":2,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":1,\"expirationTime\":3,\"lossRate\":8,\"origin\":\"河南\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":1,\"profileImage\":\"https://img1.baidu.com/it/u=534206185,916523924&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333\",\"remark\":\"白菜苔，是小白菜在春季时节从菜芯里抽出的苔，掐苔的尖部食用。菜薹的色泽翠绿，鲜嫩可口，功效和大白菜相同\",\"selling\":1,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 20:28:21', 67);
INSERT INTO `sys_oper_log` VALUES (257, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115748,\"commodityName\":\"白菜苔\",\"commodityPrice\":2,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":1,\"expirationTime\":2,\"lossRate\":8,\"origin\":\"河南\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":1,\"profileImage\":\"https://img1.baidu.com/it/u=534206185,916523924&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333\",\"remark\":\"白菜苔，是小白菜在春季时节从菜芯里抽出的苔，掐苔的尖部食用。菜薹的色泽翠绿，鲜嫩可口，功效和大白菜相同\",\"selling\":10,\"updateTime\":\"2024-02-12 20:28:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 20:28:28', 73);
INSERT INTO `sys_oper_log` VALUES (258, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115748,\"commodityName\":\"白菜苔\",\"commodityPrice\":3,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":2,\"lossRate\":8,\"origin\":\"河南\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":1,\"profileImage\":\"https://img1.baidu.com/it/u=534206185,916523924&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333\",\"remark\":\"白菜苔，是小白菜在春季时节从菜芯里抽出的苔，掐苔的尖部食用。菜薹的色泽翠绿，鲜嫩可口，功效和大白菜相同\",\"selling\":10,\"updateTime\":\"2024-02-12 20:28:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 20:31:44', 60);
INSERT INTO `sys_oper_log` VALUES (259, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115748,\"commodityName\":\"白菜苔\",\"commodityPrice\":3,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":2,\"lossRate\":8,\"origin\":\"河南\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":1,\"profileImage\":\"https://img1.baidu.com/it/u=534206185,916523924&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333\",\"remark\":\"白菜苔，是小白菜在春季时节从菜芯里抽出的苔，掐苔的尖部食用。菜薹的色泽翠绿，鲜嫩可口，功效和大白菜相同\",\"selling\":10,\"updateTime\":\"2024-02-12 20:28:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 20:31:45', 51);
INSERT INTO `sys_oper_log` VALUES (260, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115748,\"commodityName\":\"白菜苔\",\"commodityPrice\":4,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":2,\"lossRate\":8,\"origin\":\"河南\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":1,\"profileImage\":\"https://img1.baidu.com/it/u=534206185,916523924&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333\",\"remark\":\"白菜苔，是小白菜在春季时节从菜芯里抽出的苔，掐苔的尖部食用。菜薹的色泽翠绿，鲜嫩可口，功效和大白菜相同\",\"selling\":10,\"updateTime\":\"2024-02-12 20:28:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 20:40:06', 85);
INSERT INTO `sys_oper_log` VALUES (261, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115748,\"commodityName\":\"白菜苔\",\"commodityPrice\":5,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":1,\"expirationTime\":2,\"lossRate\":8,\"origin\":\"河南\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":1,\"profileImage\":\"https://img1.baidu.com/it/u=534206185,916523924&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333\",\"remark\":\"白菜苔，是小白菜在春季时节从菜芯里抽出的苔，掐苔的尖部食用。菜薹的色泽翠绿，鲜嫩可口，功效和大白菜相同\",\"selling\":10,\"updateTime\":\"2024-01-28 20:28:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 20:41:13', 46);
INSERT INTO `sys_oper_log` VALUES (262, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115960,\"commodityName\":\"大白菜\",\"commodityPrice\":2,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":1,\"lossRate\":22,\"origin\":\"山西\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://gss0.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/zhidao/wh=450,600/sign=0657eba83512b31bc739c52db3281a4c/3ac79f3df8dcd100cf7b8fce7e8b4710b8122f7d.jpg\",\"remark\":\"白菜含丰富的维生素、膳食纤维和抗氧化物质，能促进肠道蠕动，帮助消化。\",\"selling\":68,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 20:41:51', 43);
INSERT INTO `sys_oper_log` VALUES (263, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115960,\"commodityName\":\"大白菜\",\"commodityPrice\":2,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":1,\"expirationTime\":30,\"lossRate\":22,\"origin\":\"山西\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://gss0.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/zhidao/wh=450,600/sign=0657eba83512b31bc739c52db3281a4c/3ac79f3df8dcd100cf7b8fce7e8b4710b8122f7d.jpg\",\"remark\":\"白菜含丰富的维生素、膳食纤维和抗氧化物质，能促进肠道蠕动，帮助消化。\",\"selling\":68,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 20:49:15', 49);
INSERT INTO `sys_oper_log` VALUES (264, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115960,\"commodityName\":\"大白菜\",\"commodityPrice\":2,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":1,\"lossRate\":22,\"origin\":\"山西\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://gss0.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/zhidao/wh=450,600/sign=0657eba83512b31bc739c52db3281a4c/3ac79f3df8dcd100cf7b8fce7e8b4710b8122f7d.jpg\",\"remark\":\"白菜含丰富的维生素、膳食纤维和抗氧化物质，能促进肠道蠕动，帮助消化。\",\"selling\":68,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 20:51:12', 63);
INSERT INTO `sys_oper_log` VALUES (265, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115960,\"commodityName\":\"大白菜\",\"commodityPrice\":2,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":1,\"expirationTime\":30,\"lossRate\":22,\"origin\":\"山西\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://gss0.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/zhidao/wh=450,600/sign=0657eba83512b31bc739c52db3281a4c/3ac79f3df8dcd100cf7b8fce7e8b4710b8122f7d.jpg\",\"remark\":\"白菜含丰富的维生素、膳食纤维和抗氧化物质，能促进肠道蠕动，帮助消化。\",\"selling\":68,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 20:53:21', 86);
INSERT INTO `sys_oper_log` VALUES (266, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/commodityDetail/add', '127.0.0.1', '内网IP', '{\"commodityId\":102900011034324,\"commodityName\":\"山东豆角子\",\"commodityPrice\":2.5,\"createTime\":\"2024-02-12 21:04:06\",\"expirationTime\":5,\"lossRate\":2.5,\"origin\":\"山东\",\"params\":{},\"remark\":\"山东特色美食，名为doujuezi\",\"selling\":82}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 21:04:06', 159);
INSERT INTO `sys_oper_log` VALUES (267, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115960,\"commodityName\":\"大白菜\",\"commodityPrice\":2.0,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":30,\"lossRate\":22.0,\"origin\":\"山西\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://gss0.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/zhidao/wh=450,600/sign=0657eba83512b31bc739c52db3281a4c/3ac79f3df8dcd100cf7b8fce7e8b4710b8122f7d.jpg\",\"remark\":\"白菜含丰富的维生素、膳食纤维和抗氧化物质，能促进肠道蠕动，帮助消化。\",\"selling\":68,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 21:06:57', 65);
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"back/order/index\",\"createBy\":\"admin\",\"icon\":\"order\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"order\",\"perms\":\"back:order:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 21:39:20', 77);
INSERT INTO `sys_oper_log` VALUES (269, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115625,\"commodityName\":\"本地小毛白菜\",\"commodityPrice\":3.0,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":123,\"lossRate\":2.0,\"origin\":\"山东\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F14622788%2Fbd6fc86904d8495d80267c429999b34f.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvMTQ2MjI3ODgvYmQ2ZmM4NjkwNGQ4NDk1ZDgwMjY3YzQyOTk5OWIzNGYuanBn%2Fsign%2Feb7960a8704abf301343f2e4ffdb3c04.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709043646&t=1f83ec542021d10f4f8c02d50df45082\",\"remark\":\"中国原产蔬菜，有悠久的栽培历史，且其种类极其多，分别是山东胶州大白菜、北京青白、东北大矮白菜、山西阳城的大毛边、乌金白、蚕白菜等\",\"selling\":92,\"updateTime\":\"2024-02-12 21:39:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 21:39:55', 92);
INSERT INTO `sys_oper_log` VALUES (270, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115625,\"commodityName\":\"本地小毛白菜\",\"commodityPrice\":2.0,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":123,\"lossRate\":2.0,\"origin\":\"山东\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F14622788%2Fbd6fc86904d8495d80267c429999b34f.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvMTQ2MjI3ODgvYmQ2ZmM4NjkwNGQ4NDk1ZDgwMjY3YzQyOTk5OWIzNGYuanBn%2Fsign%2Feb7960a8704abf301343f2e4ffdb3c04.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709043646&t=1f83ec542021d10f4f8c02d50df45082\",\"remark\":\"中国原产蔬菜，有悠久的栽培历史，且其种类极其多，分别是山东胶州大白菜、北京青白、东北大矮白菜、山西阳城的大毛边、乌金白、蚕白菜等\",\"selling\":92,\"updateTime\":\"2024-02-12 21:46:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 21:46:57', 82);
INSERT INTO `sys_oper_log` VALUES (271, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115625,\"commodityName\":\"本地小毛白菜\",\"commodityPrice\":3.0,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":123,\"lossRate\":2.0,\"origin\":\"山东\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F14622788%2Fbd6fc86904d8495d80267c429999b34f.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvMTQ2MjI3ODgvYmQ2ZmM4NjkwNGQ4NDk1ZDgwMjY3YzQyOTk5OWIzNGYuanBn%2Fsign%2Feb7960a8704abf301343f2e4ffdb3c04.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709043646&t=1f83ec542021d10f4f8c02d50df45082\",\"remark\":\"中国原产蔬菜，有悠久的栽培历史，且其种类极其多，分别是山东胶州大白菜、北京青白、东北大矮白菜、山西阳城的大毛边、乌金白、蚕白菜等\",\"selling\":92,\"updateTime\":\"2024-02-12 21:48:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 21:48:47', 108);
INSERT INTO `sys_oper_log` VALUES (272, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115625,\"commodityName\":\"本地小毛白菜\",\"commodityPrice\":2.0,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":123,\"lossRate\":2.0,\"origin\":\"山东\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F14622788%2Fbd6fc86904d8495d80267c429999b34f.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvMTQ2MjI3ODgvYmQ2ZmM4NjkwNGQ4NDk1ZDgwMjY3YzQyOTk5OWIzNGYuanBn%2Fsign%2Feb7960a8704abf301343f2e4ffdb3c04.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709043646&t=1f83ec542021d10f4f8c02d50df45082\",\"remark\":\"中国原产蔬菜，有悠久的栽培历史，且其种类极其多，分别是山东胶州大白菜、北京青白、东北大矮白菜、山西阳城的大毛边、乌金白、蚕白菜等\",\"selling\":92,\"updateTime\":\"2024-02-12 21:48:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 21:50:21', 74);
INSERT INTO `sys_oper_log` VALUES (273, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115625,\"commodityName\":\"本地小毛白菜\",\"commodityPrice\":3.0,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":123,\"lossRate\":2.0,\"origin\":\"山东\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F14622788%2Fbd6fc86904d8495d80267c429999b34f.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvMTQ2MjI3ODgvYmQ2ZmM4NjkwNGQ4NDk1ZDgwMjY3YzQyOTk5OWIzNGYuanBn%2Fsign%2Feb7960a8704abf301343f2e4ffdb3c04.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709043646&t=1f83ec542021d10f4f8c02d50df45082\",\"remark\":\"中国原产蔬菜，有悠久的栽培历史，且其种类极其多，分别是山东胶州大白菜、北京青白、东北大矮白菜、山西阳城的大毛边、乌金白、蚕白菜等\",\"selling\":92,\"updateTime\":\"2024-02-12 21:48:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 21:54:18', 89);
INSERT INTO `sys_oper_log` VALUES (274, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115625,\"commodityName\":\"本地小毛白菜\",\"commodityPrice\":3.0,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":122,\"lossRate\":2.0,\"origin\":\"山东\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F14622788%2Fbd6fc86904d8495d80267c429999b34f.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvMTQ2MjI3ODgvYmQ2ZmM4NjkwNGQ4NDk1ZDgwMjY3YzQyOTk5OWIzNGYuanBn%2Fsign%2Feb7960a8704abf301343f2e4ffdb3c04.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709043646&t=1f83ec542021d10f4f8c02d50df45082\",\"remark\":\"中国原产蔬菜，有悠久的栽培历史，且其种类极其多，分别是山东胶州大白菜、北京青白、东北大矮白菜、山西阳城的大毛边、乌金白、蚕白菜等\",\"selling\":92,\"updateTime\":\"2024-02-12 21:54:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 21:54:44', 84);
INSERT INTO `sys_oper_log` VALUES (275, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115748,\"commodityName\":\"白菜苔\",\"commodityPrice\":5.5,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":1,\"expirationTime\":2,\"lossRate\":8.0,\"origin\":\"河南\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":1,\"profileImage\":\"https://img1.baidu.com/it/u=534206185,916523924&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333\",\"remark\":\"白菜苔，是小白菜在春季时节从菜芯里抽出的苔，掐苔的尖部食用。菜薹的色泽翠绿，鲜嫩可口，功效和大白菜相同\",\"selling\":10,\"updateTime\":\"2024-01-28 20:28:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 22:01:00', 81);
INSERT INTO `sys_oper_log` VALUES (276, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115748,\"commodityName\":\"白菜苔\",\"commodityPrice\":5.5,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":1,\"expirationTime\":2,\"lossRate\":8.2,\"origin\":\"河南\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":1,\"profileImage\":\"https://img1.baidu.com/it/u=534206185,916523924&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333\",\"remark\":\"白菜苔，是小白菜在春季时节从菜芯里抽出的苔，掐苔的尖部食用。菜薹的色泽翠绿，鲜嫩可口，功效和大白菜相同\",\"selling\":10,\"updateTime\":\"2024-01-28 20:28:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 22:01:10', 117);
INSERT INTO `sys_oper_log` VALUES (277, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115748,\"commodityName\":\"白菜苔\",\"commodityPrice\":5.5,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":1,\"expirationTime\":30,\"lossRate\":8.2,\"origin\":\"河南\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":1,\"profileImage\":\"https://img1.baidu.com/it/u=534206185,916523924&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333\",\"remark\":\"白菜苔，是小白菜在春季时节从菜芯里抽出的苔，掐苔的尖部食用。菜薹的色泽翠绿，鲜嫩可口，功效和大白菜相同\",\"selling\":10,\"updateTime\":\"2024-02-12 22:01:20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 22:01:21', 67);
INSERT INTO `sys_oper_log` VALUES (278, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/commodityDetail/add', '127.0.0.1', '内网IP', '{\"commodityId\":102900011034327,\"commodityName\":\"tttest\",\"commodityPrice\":1.0,\"createTime\":\"2024-02-12 22:39:32\",\"expirationTime\":1,\"lossRate\":1.0,\"origin\":\"1\",\"params\":{},\"partitionId\":1011010801,\"remark\":\"1\",\"selling\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 22:39:32', 98);
INSERT INTO `sys_oper_log` VALUES (279, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/commodityDetail/add', '127.0.0.1', '内网IP', '{\"commodityId\":102900011034328,\"commodityName\":\"1\",\"commodityPrice\":1.0,\"createTime\":\"2024-02-12 22:44:53\",\"expirationTime\":1,\"lossRate\":1.0,\"origin\":\"1\",\"params\":{},\"partitionId\":1011010801,\"remark\":\"1\",\"selling\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 22:44:53', 100);
INSERT INTO `sys_oper_log` VALUES (280, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/commodityDetail/add', '127.0.0.1', '内网IP', '{\"commodityId\":102900011034329,\"commodityName\":\"2\",\"commodityPrice\":2.0,\"createTime\":\"2024-02-12 22:49:42\",\"expirationTime\":2,\"lossRate\":2.0,\"origin\":\"2\",\"params\":{},\"partitionId\":1011010402,\"remark\":\"2\",\"selling\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 22:49:42', 90);
INSERT INTO `sys_oper_log` VALUES (281, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/commodityDetail/add', '127.0.0.1', '内网IP', '{\"commodityId\":102900011034330,\"commodityName\":\"33\",\"commodityPrice\":3.0,\"createTime\":\"2024-02-12 22:51:28\",\"expirationTime\":3,\"lossRate\":3.0,\"origin\":\"3\",\"params\":{},\"partitionId\":1011010101,\"remark\":\"33\",\"selling\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 22:51:27', 105);
INSERT INTO `sys_oper_log` VALUES (282, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/commodityDetail/add', '127.0.0.1', '内网IP', '{\"commodityId\":102900011034331,\"commodityName\":\"1\",\"commodityPrice\":1.0,\"createTime\":\"2024-02-12 22:57:35\",\"expirationTime\":10,\"lossRate\":1.0,\"origin\":\"山东\",\"params\":{},\"partitionName\":\"1011010402\",\"profileImage\":\"1\",\"remark\":\"666\",\"selling\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 22:57:36', 67);
INSERT INTO `sys_oper_log` VALUES (283, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/commodityDetail/add', '127.0.0.1', '内网IP', '{\"commodityId\":102900011034332,\"commodityName\":\"6\",\"commodityPrice\":6.0,\"createTime\":\"2024-02-12 23:00:42\",\"expirationTime\":6,\"lossRate\":6.0,\"origin\":\"6\",\"params\":{},\"partitionId\":1011010101,\"remark\":\"6\",\"selling\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 23:00:42', 102);
INSERT INTO `sys_oper_log` VALUES (284, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/commodityDetail/add', '127.0.0.1', '内网IP', '{\"commodityId\":102900011034333,\"commodityName\":\"7\",\"commodityPrice\":7.0,\"createTime\":\"2024-02-12 23:05:29\",\"expirationTime\":7,\"lossRate\":7.0,\"origin\":\"7\",\"params\":{},\"partitionId\":1011010201,\"remark\":\"7\",\"selling\":7}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', '2024-02-12 23:05:28', 72);
INSERT INTO `sys_oper_log` VALUES (285, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/commodityDetail/add', '127.0.0.1', '内网IP', '{\"commodityId\":102900011034333,\"commodityName\":\"7\",\"commodityPrice\":7.0,\"createTime\":\"2024-02-12 23:05:39\",\"expirationTime\":7,\"lossRate\":7.0,\"origin\":\"7\",\"params\":{},\"partitionId\":1011010201,\"remark\":\"7\",\"selling\":7}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', '2024-02-12 23:05:38', 47);
INSERT INTO `sys_oper_log` VALUES (286, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/commodityDetail/add', '127.0.0.1', '内网IP', '{\"commodityId\":102900011034333,\"commodityName\":\"7\",\"commodityPrice\":7.0,\"createTime\":\"2024-02-12 23:06:57\",\"expirationTime\":7,\"lossRate\":7.0,\"origin\":\"7\",\"params\":{},\"partitionId\":1011010201,\"partitionName\":\"花菜类\",\"remark\":\"7\",\"selling\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-12 23:06:56', 147);
INSERT INTO `sys_oper_log` VALUES (287, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserOrdersController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/orders/editPermission', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-12 23:41:53', 70);
INSERT INTO `sys_oper_log` VALUES (288, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserOrdersController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/orders/editPermission', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-12 23:42:45', 50);
INSERT INTO `sys_oper_log` VALUES (289, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserOrdersController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/orders/editPermission', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-12 23:46:13', 81);
INSERT INTO `sys_oper_log` VALUES (290, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserOrdersController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/orders/editPermission', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-13 10:16:00', 90);
INSERT INTO `sys_oper_log` VALUES (291, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserOrdersController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/orders/editPermission', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-13 10:16:09', 41);
INSERT INTO `sys_oper_log` VALUES (292, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserOrdersController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/orders/editPermission', '127.0.0.1', '内网IP', '{\"ordersId\":100001,\"params\":{},\"perm\":false,\"permission\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 10:16:54', 45);
INSERT INTO `sys_oper_log` VALUES (293, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserOrdersController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/orders/editPermission', '127.0.0.1', '内网IP', '{\"ordersId\":100001,\"params\":{},\"perm\":true,\"permission\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 10:17:00', 43);
INSERT INTO `sys_oper_log` VALUES (294, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/commodityDetail/add', '127.0.0.1', '内网IP', '{\"commodityId\":102900011034324,\"commodityName\":\"芥蓝\",\"commodityPrice\":2.5,\"createTime\":\"2024-02-13 10:27:49\",\"expirationTime\":60,\"lossRate\":5.1,\"origin\":\"广东\",\"params\":{},\"partitionId\":1011010201,\"partitionName\":\"花菜类\",\"profileImage\":\"https://pic.baike.soso.com/ugc/baikepic2/20724/20220318190148-951406496_jpeg_724_544_64860.jpg/300\",\"remark\":\"芥蓝别名有白花芥蓝、羽衣甘蓝等。是十字花科芸苔属草本植物。芥蓝喜温和的气候，耐热性强，属长日照作物。\",\"selling\":12}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 10:27:50', 119);
INSERT INTO `sys_oper_log` VALUES (295, '【请填写功能名称】', 3, 'com.ruoyi.web.controller.reception.WebUserOrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/web/orders/100000', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 10:28:31', 40);
INSERT INTO `sys_oper_log` VALUES (296, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"/back/view/index\",\"createBy\":\"admin\",\"icon\":\"view\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"评论管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"view\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 10:41:53', 95);
INSERT INTO `sys_oper_log` VALUES (297, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"/back/view/index\",\"createTime\":\"2024-02-13 10:41:53\",\"icon\":\"view\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"评论管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"view\",\"perms\":\"back:view:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 10:42:34', 61);
INSERT INTO `sys_oper_log` VALUES (298, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:04:06', 79);
INSERT INTO `sys_oper_log` VALUES (299, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:04:15', 95);
INSERT INTO `sys_oper_log` VALUES (300, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"back/notice/index\",\"createBy\":\"admin\",\"icon\":\"notice\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"公告管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"notice\",\"perms\":\"back:notice:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:05:18', 70);
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"benefit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"权益管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"benefit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:15:28', 66);
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:15:51', 67);
INSERT INTO `sys_oper_log` VALUES (303, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:15:59', 68);
INSERT INTO `sys_oper_log` VALUES (304, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:16:04', 64);
INSERT INTO `sys_oper_log` VALUES (305, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:16:12', 69);
INSERT INTO `sys_oper_log` VALUES (306, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-02-13 11:15:28\",\"icon\":\"benefit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"权益管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"benefit\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:16:26', 69);
INSERT INTO `sys_oper_log` VALUES (307, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"benfit/coupon/index\",\"createBy\":\"admin\",\"icon\":\"coupon\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"优惠卷管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"coupon\",\"perms\":\"benefit:coupon:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:17:43', 90);
INSERT INTO `sys_oper_log` VALUES (308, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:25:43', 68);
INSERT INTO `sys_oper_log` VALUES (309, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:25:50', 66);
INSERT INTO `sys_oper_log` VALUES (310, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:25:54', 63);
INSERT INTO `sys_oper_log` VALUES (311, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:25:58', 65);
INSERT INTO `sys_oper_log` VALUES (312, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:26:11', 65);
INSERT INTO `sys_oper_log` VALUES (313, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:26:17', 65);
INSERT INTO `sys_oper_log` VALUES (314, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"traceability\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"溯源管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"traceability\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:26:51', 64);
INSERT INTO `sys_oper_log` VALUES (315, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/commodityDetail/add', '127.0.0.1', '内网IP', '{\"commodityId\":102900011034325,\"commodityName\":\"test\",\"commodityPrice\":3.0,\"createTime\":\"2024-02-13 11:34:16\",\"expirationTime\":3,\"lossRate\":3.0,\"origin\":\"3\",\"params\":{},\"partitionId\":1011010201,\"partitionName\":\"花菜类\",\"profileImage\":\"\",\"remark\":\"3\",\"selling\":3,\"updateTime\":\"2024-02-13 11:34:16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:34:17', 120);
INSERT INTO `sys_oper_log` VALUES (316, '【请填写功能名称】', 3, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.remove()', 'DELETE', 1, 'admin', '研发部门', '/web/commodityDetail/102900011034325', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:34:28', 66);
INSERT INTO `sys_oper_log` VALUES (317, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"traceability/offer/index\",\"createBy\":\"admin\",\"icon\":\"offer\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"供应管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"offer\",\"perms\":\"offer:\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:42:26', 68);
INSERT INTO `sys_oper_log` VALUES (318, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"traceability/offer/index\",\"createTime\":\"2024-02-13 11:42:26\",\"icon\":\"offer\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"供应管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"offer\",\"perms\":\"traceability:offer:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:42:48', 65);
INSERT INTO `sys_oper_log` VALUES (319, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"traceability/transport/index\",\"createBy\":\"admin\",\"icon\":\"transport\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"运输管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2008,\"path\":\"transport\",\"perms\":\"traceability:transport:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:43:58', 84);
INSERT INTO `sys_oper_log` VALUES (320, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"traceability/sell/index\",\"createBy\":\"admin\",\"icon\":\"sell\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"销售管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2008,\"path\":\"sell\",\"perms\":\"traceability:sell:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 11:44:48', 66);
INSERT INTO `sys_oper_log` VALUES (321, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/commodityDetail/add', '127.0.0.1', '内网IP', '{\"commodityId\":102900011034325,\"commodityName\":\"芥菜\",\"commodityPrice\":5.83,\"createTime\":\"2024-02-13 16:56:13\",\"expirationTime\":90,\"lossRate\":3.2,\"origin\":\"云南\",\"params\":{},\"partitionId\":1011010201,\"partitionName\":\"花菜类\",\"profileImage\":\"https://bkimg.cdn.bcebos.com/pic/c8ea15ce36d3d539e7773b6a3287e950342ab0d4?x-bce-process=image/format,f_auto/resize,m_lfit,limit_1,h_330\",\"remark\":\"芥菜，十字花科芸苔属一年生草本植物。直立多分枝，基生叶倒卵形或宽卵形，顶端钝，基部楔形；总状花序顶生，花黄色；萼片淡黄色，直立开展；花瓣倒卵形；角果线形；种子球形，褐色。花期3-5月，果期5-6月。明《广群芳谱》说芥菜“其气味辛辣，有介然之义”，所以称为“芥菜”。\",\"selling\":20,\"updateTime\":\"2024-02-13 16:56:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 16:56:13', 123);
INSERT INTO `sys_oper_log` VALUES (322, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900011034325,\"commodityName\":\"芥菜\",\"commodityPrice\":5.83,\"createTime\":\"2024-02-13 16:56:14\",\"expirationTime\":90,\"lossRate\":3.2,\"origin\":\"云南\",\"params\":{},\"partitionId\":1011010201,\"partitionName\":\"花菜类\",\"profileImage\":\"https://ts4.cn.mm.bing.net/th?id=OIP.NOlBHQB6H_F-h8tfHLxEGQAAAA&w=298&h=204&c=12&rs=1&qlt=99&pcl=faf9f7&bgcl=fffffe&r=0&o=6&pid=MultiSMRSV2Source\",\"remark\":\"芥菜，十字花科芸苔属一年生草本植物。直立多分枝，基生叶倒卵形或宽卵形，顶端钝，基部楔形；总状花序顶生，花黄色；萼片淡黄色，直立开展；花瓣倒卵形；角果线形；种子球形，褐色。花期3-5月，果期5-6月。明《广群芳谱》说芥菜“其气味辛辣，有介然之义”，所以称为“芥菜”。\",\"selling\":20,\"updateTime\":\"2024-02-13 16:56:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 16:58:04', 76);
INSERT INTO `sys_oper_log` VALUES (323, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/commodityDetail/add', '127.0.0.1', '内网IP', '{\"commodityId\":102900011034326,\"commodityName\":\"1\",\"commodityPrice\":1.0,\"createTime\":\"2024-02-13 17:05:06\",\"expirationTime\":1,\"lossRate\":1.0,\"origin\":\"1\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"remark\":\"1\",\"selling\":1,\"updateTime\":\"2024-02-13 17:05:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-13 17:05:08', 126);
INSERT INTO `sys_oper_log` VALUES (324, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 16:01:10', 76);
INSERT INTO `sys_oper_log` VALUES (325, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 17:10:46', 62);
INSERT INTO `sys_oper_log` VALUES (326, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 21:36:26', 78);
INSERT INTO `sys_oper_log` VALUES (327, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-26 22:08:12\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-01-26 22:08:12\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"test\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 22:00:14', 334);
INSERT INTO `sys_oper_log` VALUES (328, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 22:01:26', 308);
INSERT INTO `sys_oper_log` VALUES (329, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":105,\"email\":\"110@qq.com\",\"nickName\":\"test\",\"params\":{},\"phonenumber\":\"18369883001\",\"postIds\":[4],\"remark\":\"测试\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 22:02:48', 363);
INSERT INTO `sys_oper_log` VALUES (330, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":102,\"email\":\"111111111@qq.com\",\"nickName\":\"Jack\",\"params\":{},\"phonenumber\":\"13061199452\",\"postIds\":[4],\"roleIds\":[100],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"Jack\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 22:18:57', 410);
INSERT INTO `sys_oper_log` VALUES (331, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 22:19:48', 116);
INSERT INTO `sys_oper_log` VALUES (332, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":102,\"email\":\"111111111@qq.com\",\"nickName\":\"Rose\",\"params\":{},\"phonenumber\":\"13061199452\",\"postIds\":[4],\"roleIds\":[100],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"Rose\"}', '{\"msg\":\"新增用户\'Rose\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2024-02-14 22:21:50', 75);
INSERT INTO `sys_oper_log` VALUES (333, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":102,\"email\":\"111111111@qq.com\",\"nickName\":\"Rose\",\"params\":{},\"phonenumber\":\"18691194539\",\"postIds\":[4],\"roleIds\":[100],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"Rose\"}', '{\"msg\":\"新增用户\'Rose\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2024-02-14 22:21:59', 69);
INSERT INTO `sys_oper_log` VALUES (334, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":102,\"email\":\"11111112@qq.com\",\"nickName\":\"Rose\",\"params\":{},\"phonenumber\":\"18691194539\",\"postIds\":[4],\"roleIds\":[100],\"sex\":\"0\",\"status\":\"0\",\"userId\":102,\"userName\":\"Rose\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 22:22:16', 339);
INSERT INTO `sys_oper_log` VALUES (335, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":102,\"email\":\"11111113@qq.com\",\"nickName\":\"Peter\",\"params\":{},\"phonenumber\":\"13061145949\",\"postIds\":[4],\"roleIds\":[100],\"sex\":\"1\",\"status\":\"0\",\"userId\":103,\"userName\":\"Peter\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 22:23:37', 368);
INSERT INTO `sys_oper_log` VALUES (336, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":102,\"email\":\"11111114@qq.com\",\"nickName\":\"Andy\",\"params\":{},\"phonenumber\":\"13578145299\",\"postIds\":[4],\"roleIds\":[100],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"Peter\"}', '{\"msg\":\"新增用户\'Peter\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2024-02-14 22:24:25', 25);
INSERT INTO `sys_oper_log` VALUES (337, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":102,\"email\":\"11111114@qq.com\",\"nickName\":\"Andy\",\"params\":{},\"phonenumber\":\"13578145299\",\"postIds\":[4],\"roleIds\":[100],\"sex\":\"0\",\"status\":\"0\",\"userId\":104,\"userName\":\"Andy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 22:25:09', 413);
INSERT INTO `sys_oper_log` VALUES (338, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":102,\"email\":\"11111115@qq.com\",\"nickName\":\"Ava\",\"params\":{},\"phonenumber\":\"13061194516\",\"postIds\":[4],\"roleIds\":[100],\"sex\":\"1\",\"status\":\"0\",\"userId\":105,\"userName\":\"Ava\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 22:26:27', 378);
INSERT INTO `sys_oper_log` VALUES (339, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":102,\"email\":\"11111116@qq.com\",\"nickName\":\"David\",\"params\":{},\"phonenumber\":\"17761194594\",\"postIds\":[4],\"roleIds\":[100],\"sex\":\"1\",\"status\":\"0\",\"userId\":106,\"userName\":\"David\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 22:27:52', 334);
INSERT INTO `sys_oper_log` VALUES (340, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":102,\"email\":\"11111117@qq.com\",\"nickName\":\"William\",\"params\":{},\"phonenumber\":\"17861179759\",\"postIds\":[4],\"roleIds\":[100],\"sex\":\"1\",\"status\":\"0\",\"userId\":107,\"userName\":\"William\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 22:28:58', 365);
INSERT INTO `sys_oper_log` VALUES (341, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":102,\"email\":\"11111118@qq.com\",\"nickName\":\"Amelia\",\"params\":{},\"phonenumber\":\"13061194561\",\"postIds\":[4],\"roleIds\":[100],\"sex\":\"1\",\"status\":\"0\",\"userId\":108,\"userName\":\"Amelia\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 22:31:22', 381);
INSERT INTO `sys_oper_log` VALUES (342, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":102,\"email\":\"11111119@qq.com\",\"nickName\":\"Charlotte\",\"params\":{},\"phonenumber\":\"13061178654\",\"postIds\":[4],\"roleIds\":[100],\"sex\":\"0\",\"status\":\"0\",\"userId\":109,\"userName\":\"Charlotte\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 22:32:18', 335);
INSERT INTO `sys_oper_log` VALUES (343, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":102,\"email\":\"11111121@qq.com\",\"nickName\":\"Daniel\",\"params\":{},\"phonenumber\":\"13061178564\",\"postIds\":[4],\"roleIds\":[100],\"sex\":\"1\",\"status\":\"0\",\"userId\":110,\"userName\":\"Daniel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-14 22:34:52', 339);
INSERT INTO `sys_oper_log` VALUES (344, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserOrdersController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/orders/editPermission', '127.0.0.1', '内网IP', '{\"ordersId\":100001,\"params\":{},\"perm\":false,\"permission\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-17 11:39:25', 64);
INSERT INTO `sys_oper_log` VALUES (345, '【请填写功能名称】', 3, 'com.ruoyi.web.controller.reception.WebUserOrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/web/orders/101739', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-17 11:39:59', 68);
INSERT INTO `sys_oper_log` VALUES (346, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"back/view/index\",\"createTime\":\"2024-02-13 10:41:53\",\"icon\":\"view\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"评论管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"view\",\"perms\":\"back:view:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-17 17:51:38', 81);
INSERT INTO `sys_oper_log` VALUES (347, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-17 17:52:01', 67);
INSERT INTO `sys_oper_log` VALUES (348, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-17 17:52:08', 67);
INSERT INTO `sys_oper_log` VALUES (349, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115823,\"commodityName\":\"上海青\",\"commodityPrice\":6.25,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":45,\"lossRate\":14.43,\"origin\":\"上海\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":1,\"profileImage\":\"https://p1.ssl.qhimg.com/t01472539910c3d5ba6.jpg\",\"remark\":\"上海青是一种小白菜，叶少茎多，菜茎白白的像葫芦瓢\",\"selling\":77,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-18 23:27:05', 105);
INSERT INTO `sys_oper_log` VALUES (350, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005115960,\"commodityName\":\"大白菜\",\"commodityPrice\":2.0,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":30,\"lossRate\":22.0,\"origin\":\"山西\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://ts1.cn.mm.bing.net/th/id/R-C.db752b5a9355e4b5112d087ffa2ab873?rik=oI9yH7oW0YtlTA&riu=http%3a%2f%2fimg.365diandao.com%2fStorage%2fShop%2f528%2fProducts%2f8129%2f1.png&ehk=V0XZJC4phgEvQ1TwZE3DkhguWDWYxCMAc1tIua%2b9eX4%3d&risl=&pid=ImgRaw&r=0\",\"remark\":\"白菜含丰富的维生素、膳食纤维和抗氧化物质，能促进肠道蠕动，帮助消化。\",\"selling\":68,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-18 23:27:31', 66);
INSERT INTO `sys_oper_log` VALUES (351, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"back/views/index\",\"createTime\":\"2024-02-13 10:41:53\",\"icon\":\"view\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"评论管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"views\",\"perms\":\"back:views:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-19 11:25:25', 85);
INSERT INTO `sys_oper_log` VALUES (352, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/sys/view/editPermission', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"viewId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-19 11:25:40', 49);
INSERT INTO `sys_oper_log` VALUES (353, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/sys/view/editPermission', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":false,\"permission\":1,\"viewId\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-19 11:25:47', 46);
INSERT INTO `sys_oper_log` VALUES (354, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserOrdersController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/orders/editPermission', '127.0.0.1', '内网IP', '{\"ordersId\":100006,\"params\":{},\"perm\":false,\"permission\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-19 11:25:58', 49);
INSERT INTO `sys_oper_log` VALUES (355, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"back/remark/index\",\"createTime\":\"2024-02-13 10:41:53\",\"icon\":\"view\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"评论管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"remark\",\"perms\":\"back:remark:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-19 16:24:13', 84);
INSERT INTO `sys_oper_log` VALUES (356, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/sys/view/editPermission', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":true,\"permission\":0,\"viewId\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-19 17:03:43', 56);
INSERT INTO `sys_oper_log` VALUES (357, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/sys/view/editPermission', '127.0.0.1', '内网IP', '{\"params\":{},\"perm\":true,\"permission\":0,\"viewId\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-19 17:03:46', 45);
INSERT INTO `sys_oper_log` VALUES (358, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where view_id = null\' at line 3\r\n### The error may exist in file [C:\\Users\\13684\\Desktop\\block-chain-agriculture\\ruoyi-web\\target\\classes\\mapper\\system\\SysUserViewMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.SysUserViewMapper.updateSysUserView-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user_view                    where view_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where view_id = null\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where view_id = null\' at line 3', '2024-02-19 22:21:13', 119);
INSERT INTO `sys_oper_log` VALUES (359, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where view_id = null\' at line 3\r\n### The error may exist in file [C:\\Users\\13684\\Desktop\\block-chain-agriculture\\ruoyi-web\\target\\classes\\mapper\\system\\SysUserViewMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.SysUserViewMapper.updateSysUserView-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user_view                    where view_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where view_id = null\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where view_id = null\' at line 3', '2024-02-19 22:21:21', 46);
INSERT INTO `sys_oper_log` VALUES (360, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005128748,\"createTime\":\"2023-11-30 13:45:46\",\"loveFlag\":3,\"params\":{},\"permission\":0,\"userId\":200002,\"viewContext\":\"不新鲜~\",\"viewId\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-19 22:22:07', 50);
INSERT INTO `sys_oper_log` VALUES (361, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005128748,\"createTime\":\"2023-11-30 13:45:46\",\"loveFlag\":3,\"params\":{},\"permission\":0,\"userId\":200002,\"viewContext\":\"不新鲜~量少\",\"viewId\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-19 22:23:03', 49);
INSERT INTO `sys_oper_log` VALUES (362, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005128748,\"createTime\":\"2023-11-30 13:45:46\",\"loveFlag\":3,\"params\":{},\"permission\":0,\"userId\":200002,\"viewContext\":\"不新鲜~\",\"viewId\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-19 22:23:38', 49);
INSERT INTO `sys_oper_log` VALUES (363, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":1,\"commodityName\":\"甜白菜\",\"commodityPrice\":3.98,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":1,\"expirationTime\":7,\"lossRate\":9.43,\"origin\":\"山东\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://img1.baidu.com/it/u=1706945176,804624848&fm=253&fmt=auto&app=138&f=JPEG?w=512&h=500\",\"remark\":\"性凉，味甘、苦，功能清热解毒，行瘀止血。\",\"selling\":5,\"updateTime\":\"2024-02-19 22:54:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-19 22:54:25', 76);
INSERT INTO `sys_oper_log` VALUES (364, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":2,\"commodityName\":\"甜白菜\",\"commodityPrice\":3.98,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":1,\"expirationTime\":78,\"lossRate\":9.43,\"origin\":\"山东\",\"params\":{},\"partitionId\":1011010101,\"partitionName\":\"花叶类\",\"permission\":0,\"profileImage\":\"https://img1.baidu.com/it/u=1706945176,804624848&fm=253&fmt=auto&app=138&f=JPEG?w=512&h=500\",\"remark\":\"性凉，味甘、苦，功能清热解毒，行瘀止血。\",\"selling\":5,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-19 22:54:34', 66);
INSERT INTO `sys_oper_log` VALUES (365, '【请填写功能名称】', 3, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.remove()', 'DELETE', 1, 'admin', '研发部门', '/web/commodityDetail/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-19 22:56:03', 134);
INSERT INTO `sys_oper_log` VALUES (366, '【请填写功能名称】', 3, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.remove()', 'DELETE', 1, 'admin', '研发部门', '/web/commodityDetail/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-19 22:56:05', 41);
INSERT INTO `sys_oper_log` VALUES (367, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserOrdersController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/orders/editPermission', '127.0.0.1', '内网IP', '{\"ordersId\":100009,\"params\":{},\"perm\":false,\"permission\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-19 23:26:59', 47);
INSERT INTO `sys_oper_log` VALUES (368, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"auditFlag\":1,\"commodityId\":102900005115625,\"createTime\":\"2024-01-05 11:58:20\",\"loveFlag\":5,\"params\":{},\"permission\":5,\"userId\":200003,\"viewContext\":\"很好~\",\"viewId\":8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-20 15:46:07', 56);
INSERT INTO `sys_oper_log` VALUES (369, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserOrdersController.editPermission()', 'PUT', 1, 'admin', '研发部门', '/web/orders/editPermission', '127.0.0.1', '内网IP', '{\"ordersId\":100001,\"params\":{},\"perm\":true,\"permission\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-20 18:15:47', 61);
INSERT INTO `sys_oper_log` VALUES (370, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"auditFlag\":1,\"commodityId\":102900011006955,\"createTime\":\"2024-04-22 21:45:53\",\"loveFlag\":2,\"params\":{},\"permission\":0,\"userId\":200001,\"viewContext\":\"难吃\",\"viewId\":11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-20 19:55:16', 55);
INSERT INTO `sys_oper_log` VALUES (371, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"auditFlag\":1,\"commodityId\":102900011034323,\"createTime\":\"2024-06-02 11:58:39\",\"loveFlag\":4,\"params\":{},\"permission\":1,\"userId\":200005,\"viewContext\":\"一般\",\"viewId\":12}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-20 19:55:21', 45);
INSERT INTO `sys_oper_log` VALUES (372, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"auditFlag\":1,\"commodityId\":102900011016909,\"createTime\":\"2024-05-22 12:59:19\",\"loveFlag\":1,\"params\":{},\"permission\":0,\"userId\":200003,\"viewContext\":\"难吃\",\"viewId\":13}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-20 19:55:27', 45);
INSERT INTO `sys_oper_log` VALUES (373, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"audit\":true,\"auditFlag\":1,\"params\":{},\"perm\":true,\"permission\":0,\"viewId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-20 20:22:46', 95);
INSERT INTO `sys_oper_log` VALUES (374, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"audit\":true,\"auditFlag\":1,\"params\":{},\"perm\":true,\"permission\":0,\"viewId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-20 20:25:16', 46);
INSERT INTO `sys_oper_log` VALUES (375, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"audit\":true,\"auditFlag\":1,\"params\":{},\"perm\":false,\"permission\":1,\"viewId\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-20 20:25:45', 46);
INSERT INTO `sys_oper_log` VALUES (376, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"audit\":true,\"auditFlag\":1,\"params\":{},\"perm\":false,\"permission\":1,\"viewId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-20 20:27:34', 48);
INSERT INTO `sys_oper_log` VALUES (377, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"audit\":true,\"auditFlag\":1,\"params\":{},\"perm\":true,\"permission\":0,\"viewId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-20 20:30:22', 53);
INSERT INTO `sys_oper_log` VALUES (378, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"benefit/notice/index\",\"createTime\":\"2024-02-13 11:05:18\",\"icon\":\"notice\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"公告管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2006,\"path\":\"notice\",\"perms\":\"benefit:notice:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-20 20:39:17', 76);
INSERT INTO `sys_oper_log` VALUES (379, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"benefit/notice/index\",\"createTime\":\"2024-02-13 11:05:18\",\"icon\":\"notice\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"公告管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"notice\",\"perms\":\"benefit:notice:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-20 20:39:28', 69);
INSERT INTO `sys_oper_log` VALUES (380, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"benfit/coupon/index\",\"createTime\":\"2024-02-13 11:17:43\",\"icon\":\"coupon\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"优惠卷管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2006,\"path\":\"coupon\",\"perms\":\"benefit:coupon:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-20 20:39:33', 68);
INSERT INTO `sys_oper_log` VALUES (381, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"benefit/remark/index\",\"createTime\":\"2024-02-13 10:41:53\",\"icon\":\"view\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"评论管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2006,\"path\":\"remark\",\"perms\":\"benefit:remark:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 14:45:55', 103);
INSERT INTO `sys_oper_log` VALUES (382, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"benefit/remark/index\",\"createTime\":\"2024-02-13 10:41:53\",\"icon\":\"view\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"评论管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2006,\"path\":\"remark\",\"perms\":\"benefit:remark:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 14:46:12', 93);
INSERT INTO `sys_oper_log` VALUES (383, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"benfit/coupon/index\",\"createTime\":\"2024-02-13 11:17:43\",\"icon\":\"coupon\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"优惠卷管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2006,\"path\":\"coupon\",\"perms\":\"benefit:coupon:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 14:46:17', 92);
INSERT INTO `sys_oper_log` VALUES (384, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"23\",\"createTime\":\"2024-01-21 03:36:55\",\"love\":\"水生根茎类,花叶类,食用菌,茄类\",\"loveList\":[\"水生根茎类\",\"花叶类\",\"食用菌\",\"茄类\"],\"nickname\":\"Ava\",\"params\":{},\"permission\":1,\"phone\":\"13061194516\",\"profileImage\":\"https://s2.loli.net/2024/02/08/irATxF7owf16JWD.jpg\",\"pwd\":\"yB7eEeakRd\",\"sex\":\"0\",\"updateTime\":\"2024-02-26 14:51:11\",\"userId\":200005}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 14:51:11', 66);
INSERT INTO `sys_oper_log` VALUES (385, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"23\",\"createTime\":\"2024-01-21 03:36:55\",\"love\":\"食用菌,辣椒类\",\"loveList\":[\"食用菌\",\"辣椒类\"],\"nickname\":\"Ava\",\"params\":{},\"permission\":1,\"phone\":\"13061194516\",\"profileImage\":\"https://s2.loli.net/2024/02/08/irATxF7owf16JWD.jpg\",\"pwd\":\"yB7eEeakRd\",\"sex\":\"0\",\"updateTime\":\"2024-02-26 14:57:54\",\"userId\":200005}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 14:57:54', 60);
INSERT INTO `sys_oper_log` VALUES (386, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"benefit/coupon/index\",\"createTime\":\"2024-02-13 11:17:43\",\"icon\":\"coupon\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"优惠卷管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2006,\"path\":\"coupon\",\"perms\":\"benefit:coupon:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 18:56:13', 108);
INSERT INTO `sys_oper_log` VALUES (387, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"38\",\"createTime\":\"2023-12-20 18:12:43\",\"love\":\"花菜类,水生根茎类,食用菌\",\"loveList\":[\"花菜类\",\"水生根茎类\",\"食用菌\"],\"nickname\":\"Rosed\",\"params\":{},\"permission\":1,\"phone\":\"18691194538\",\"profileImage\":\"https://s2.loli.net/2024/02/08/irATxF7owf16JWD.jpg\",\"pwd\":\"66666\",\"sex\":\"0\",\"updateTime\":\"2024-02-27 14:41:26\",\"userId\":200002}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 14:41:28', 68);
INSERT INTO `sys_oper_log` VALUES (388, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserCouponsController.add()', 'POST', 1, 'admin', '研发部门', '/web/coupons', '127.0.0.1', '内网IP', '{\"couponsId\":22,\"couponsName\":\"test\",\"createTime\":\"2024-02-27 15:25:18\",\"expirationTime\":111,\"params\":{},\"updateTime\":\"2024-02-27 15:25:18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 15:25:19', 73);
INSERT INTO `sys_oper_log` VALUES (389, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"auditFlag\":1,\"commodityId\":102900011016909,\"createTime\":\"2024-05-22 12:59:19\",\"loveFlag\":2,\"params\":{},\"permission\":0,\"userId\":200003,\"viewContext\":\"打农药，不卫生\",\"viewId\":13}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 16:27:20', 63);
INSERT INTO `sys_oper_log` VALUES (390, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"auditFlag\":1,\"commodityId\":102900011000328,\"createTime\":\"2023-11-01 12:33:07\",\"loveFlag\":4,\"params\":{},\"permission\":0,\"userId\":200004,\"viewContext\":\"很棒！\",\"viewId\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 16:27:57', 54);
INSERT INTO `sys_oper_log` VALUES (391, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"auditFlag\":1,\"commodityId\":102900011000328,\"createTime\":\"2023-11-01 12:33:07\",\"loveFlag\":5,\"params\":{},\"permission\":0,\"userId\":200004,\"viewContext\":\"很棒！\",\"viewId\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 16:28:01', 54);
INSERT INTO `sys_oper_log` VALUES (392, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.SysUserViewController.edit()', 'PUT', 1, 'admin', '研发部门', '/sys/view/edit', '127.0.0.1', '内网IP', '{\"auditFlag\":1,\"commodityId\":102900011016909,\"createTime\":\"2024-05-22 12:59:19\",\"loveFlag\":2,\"params\":{},\"permission\":0,\"userId\":200003,\"viewContext\":\"打农药，不卫生~\",\"viewId\":13}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 16:28:07', 54);
INSERT INTO `sys_oper_log` VALUES (393, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserCouponsController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/coupons', '127.0.0.1', '内网IP', '{\"couponsId\":1,\"couponsName\":\"品类券\",\"createTime\":\"2012-11-04 14:04:29\",\"expirationFlag\":0,\"expirationTime\":124,\"params\":{},\"permission\":0,\"reductionFull\":10,\"reductionPrice\":5,\"updateTime\":\"2024-02-27 17:40:28\",\"userId\":200001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 17:40:26', 64);
INSERT INTO `sys_oper_log` VALUES (394, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebUserDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/userDetail/updateUser', '127.0.0.1', '内网IP', '{\"age\":\"38\",\"createTime\":\"2023-12-20 18:12:43\",\"love\":\"水生根茎类,花菜类\",\"loveList\":[\"水生根茎类\",\"花菜类\"],\"nickname\":\"Rosed\",\"params\":{},\"permission\":1,\"phone\":\"18691194538\",\"profileImage\":\"https://s2.loli.net/2024/02/08/irATxF7owf16JWD.jpg\",\"pwd\":\"66666\",\"sex\":\"0\",\"updateTime\":\"2024-02-27 18:34:45\",\"userId\":200002}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 18:34:45', 165);
INSERT INTO `sys_oper_log` VALUES (395, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"区块链浏览器\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"http://101.200.85.246:5002/WeBASE-Front/#/home\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 18:41:35', 120);
INSERT INTO `sys_oper_log` VALUES (396, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http://101.200.85.246:5002/WeBASE-Front/#/home\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 18:41:51', 86);
INSERT INTO `sys_oper_log` VALUES (397, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-02-27 18:41:54', 56);
INSERT INTO `sys_oper_log` VALUES (398, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 18:43:08', 79);
INSERT INTO `sys_oper_log` VALUES (399, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 18:43:19', 84);
INSERT INTO `sys_oper_log` VALUES (400, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http(s)://101.200.85.246:5002/WeBASE-Front/#/home\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 19:12:43', 104);
INSERT INTO `sys_oper_log` VALUES (401, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http://101.200.85.246:5002/WeBASE-Front/#/home\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 19:21:02', 111);
INSERT INTO `sys_oper_log` VALUES (402, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http://101.200.85.246:5002/WeBASE-Front/#/home\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 19:26:45', 134);
INSERT INTO `sys_oper_log` VALUES (403, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http://101.200.85.246:5002/WeBASE-Front/#/home\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 19:27:14', 102);
INSERT INTO `sys_oper_log` VALUES (404, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http://101.200.85.246:5002/WeBASE-Front/#/home\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 19:27:14', 166);
INSERT INTO `sys_oper_log` VALUES (405, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http(s)://101.200.85.246:5002/WeBASE-Front/#/home\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"修改菜单\'区块链浏览器\'失败，地址必须以http(s)://开头\",\"code\":500}', 0, NULL, '2024-02-27 19:27:38', 37);
INSERT INTO `sys_oper_log` VALUES (406, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http://101.200.85.246:5002/WeBASE-Front/#/home\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 19:27:44', 85);
INSERT INTO `sys_oper_log` VALUES (407, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http://101.200.85.246:5002/WeBASE-Front/#/home\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 19:33:57', 117);
INSERT INTO `sys_oper_log` VALUES (408, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 19:50:16', 114);
INSERT INTO `sys_oper_log` VALUES (409, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/browser/index\",\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"browser\",\"perms\":\"monitor:browser:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 19:51:33', 94);
INSERT INTO `sys_oper_log` VALUES (410, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 19:54:11', 95);
INSERT INTO `sys_oper_log` VALUES (411, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 19:54:17', 88);
INSERT INTO `sys_oper_log` VALUES (412, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/browser/index\",\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"browser\",\"perms\":\"monitor:browser:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 19:55:08', 93);
INSERT INTO `sys_oper_log` VALUES (413, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"browser\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 19:58:28', 93);
INSERT INTO `sys_oper_log` VALUES (414, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http://101.200.85.246:5002/WeBASE-Front/#/home\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 19:58:53', 89);
INSERT INTO `sys_oper_log` VALUES (415, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-02-27 19:58:57', 59);
INSERT INTO `sys_oper_log` VALUES (416, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 19:59:11', 90);
INSERT INTO `sys_oper_log` VALUES (417, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/browser/index\",\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"browser\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"修改菜单\'区块链浏览器\'失败，地址必须以http(s)://开头\",\"code\":500}', 0, NULL, '2024-02-27 20:02:12', 55);
INSERT INTO `sys_oper_log` VALUES (418, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/browser/index\",\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"browser\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 20:02:20', 91);
INSERT INTO `sys_oper_log` VALUES (419, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/browser/index\",\"createTime\":\"2024-02-27 18:41:35\",\"icon\":\"browser\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":2012,\"menuName\":\"区块链浏览器\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http://101.200.85.246:5002/WeBASE-Front/#/home\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-27 20:03:18', 87);
INSERT INTO `sys_oper_log` VALUES (420, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:23:24', 108);
INSERT INTO `sys_oper_log` VALUES (421, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:23:29', 89);
INSERT INTO `sys_oper_log` VALUES (422, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/110', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:23:44', 270);
INSERT INTO `sys_oper_log` VALUES (423, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:23:47', 246);
INSERT INTO `sys_oper_log` VALUES (424, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:23:51', 247);
INSERT INTO `sys_oper_log` VALUES (425, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/101,102,103,104,105,106,107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:24:05', 253);
INSERT INTO `sys_oper_log` VALUES (426, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2006,2005,2004,2007,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"remark\":\"商城管理\",\"roleId\":101,\"roleKey\":\"admin1\",\"roleName\":\"admin1\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:25:17', 290);
INSERT INTO `sys_oper_log` VALUES (427, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/role/100', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:25:27', 307);
INSERT INTO `sys_oper_log` VALUES (428, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2008,2009,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2012],\"params\":{},\"remark\":\"供应管理\",\"roleId\":102,\"roleKey\":\"admin2\",\"roleName\":\"admin2\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:26:05', 259);
INSERT INTO `sys_oper_log` VALUES (429, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2008,2010,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2012],\"params\":{},\"remark\":\"运输管理\",\"roleId\":103,\"roleKey\":\"admin3\",\"roleName\":\"admin3\",\"roleSort\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:26:26', 254);
INSERT INTO `sys_oper_log` VALUES (430, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2008,2011,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2012],\"params\":{},\"remark\":\"销售管理\",\"roleId\":104,\"roleKey\":\"admin4\",\"roleName\":\"admin4\",\"roleSort\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:26:51', 261);
INSERT INTO `sys_oper_log` VALUES (431, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"136@qq.com\",\"nickName\":\"admin1\",\"params\":{},\"phonenumber\":\"18311111111\",\"postIds\":[2],\"roleIds\":[101],\"sex\":\"0\",\"status\":\"0\",\"userId\":111,\"userName\":\"admin1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:28:42', 556);
INSERT INTO `sys_oper_log` VALUES (432, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":100,\"email\":\"1@qq.com\",\"nickName\":\"admin2\",\"params\":{},\"phonenumber\":\"18311111111\",\"postIds\":[2],\"roleIds\":[102],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"admin2\"}', '{\"msg\":\"新增用户\'admin2\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2024-02-29 21:29:13', 58);
INSERT INTO `sys_oper_log` VALUES (433, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"1@qq.com\",\"nickName\":\"admin2\",\"params\":{},\"phonenumber\":\"18211111111\",\"postIds\":[2],\"roleIds\":[102],\"sex\":\"0\",\"status\":\"0\",\"userId\":112,\"userName\":\"admin2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:29:21', 487);
INSERT INTO `sys_oper_log` VALUES (434, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":100,\"email\":\"1@qq.com\",\"nickName\":\"admin3\",\"params\":{},\"phonenumber\":\"18411111111\",\"postIds\":[2],\"roleIds\":[103],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"admin3\"}', '{\"msg\":\"新增用户\'admin3\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2024-02-29 21:29:46', 89);
INSERT INTO `sys_oper_log` VALUES (435, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"123@qq.com\",\"nickName\":\"admin3\",\"params\":{},\"phonenumber\":\"18411111111\",\"postIds\":[2],\"roleIds\":[103],\"sex\":\"0\",\"status\":\"0\",\"userId\":113,\"userName\":\"admin3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:29:51', 481);
INSERT INTO `sys_oper_log` VALUES (436, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"1234@qq.com\",\"nickName\":\"admin4\",\"params\":{},\"phonenumber\":\"18511111111\",\"postIds\":[2],\"roleIds\":[104],\"sex\":\"0\",\"status\":\"0\",\"userId\":114,\"userName\":\"admin4\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:30:22', 497);
INSERT INTO `sys_oper_log` VALUES (437, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:31:59', 86);
INSERT INTO `sys_oper_log` VALUES (438, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2024-01-26 22:08:12\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 21:32:07', 88);
INSERT INTO `sys_oper_log` VALUES (439, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"benefit/coupon/index\",\"createTime\":\"2024-02-13 11:17:43\",\"icon\":\"coupon\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"优惠券管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2006,\"path\":\"coupon\",\"perms\":\"benefit:coupon:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 22:55:24', 105);
INSERT INTO `sys_oper_log` VALUES (440, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserMessageController.add()', 'POST', 1, 'admin', '研发部门', '/web/message', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-03 20:37:24\",\"messageId\":10010,\"params\":{},\"updateTime\":\"2024-03-03 20:37:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-03 20:37:25', 97);
INSERT INTO `sys_oper_log` VALUES (441, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"111\",\"createTime\":\"2024-03-07 16:13:46\",\"love\":\"花叶类,食用菌,花菜类\",\"loveList\":[\"花叶类\",\"食用菌\",\"花菜类\"],\"nickname\":\"test\",\"params\":{},\"phone\":\"13061184333\",\"profileImage\":\"https://s2.loli.net/2024/02/08/DE9qcKdWQymIu8C.jpg\",\"pwd\":\"1111\",\"sex\":\"0\",\"updateTime\":\"2024-03-07 16:13:46\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'age\' at row 1\r\n### The error may exist in file [D:\\block-chain-agriculture\\ruoyi-web\\target\\classes\\mapper\\system\\WebUserDetailMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.WebUserDetailMapper.insertWebUserDetail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into web_user_detail          ( nickname,             pwd,             profile_image,             age,             love,             sex,             phone,             create_time,             update_time,             permission )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             0 )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'age\' at row 1\n; Data truncation: Data too long for column \'age\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'age\' at row 1', '2024-03-07 16:13:48', 92);
INSERT INTO `sys_oper_log` VALUES (442, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"111\",\"createTime\":\"2024-03-07 16:13:51\",\"love\":\"花叶类,食用菌,花菜类\",\"loveList\":[\"花叶类\",\"食用菌\",\"花菜类\"],\"nickname\":\"test\",\"params\":{},\"phone\":\"13061184333\",\"profileImage\":\"https://s2.loli.net/2024/02/08/DE9qcKdWQymIu8C.jpg\",\"pwd\":\"1111\",\"sex\":\"0\",\"updateTime\":\"2024-03-07 16:13:51\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'age\' at row 1\r\n### The error may exist in file [D:\\block-chain-agriculture\\ruoyi-web\\target\\classes\\mapper\\system\\WebUserDetailMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.WebUserDetailMapper.insertWebUserDetail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into web_user_detail          ( nickname,             pwd,             profile_image,             age,             love,             sex,             phone,             create_time,             update_time,             permission )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             0 )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'age\' at row 1\n; Data truncation: Data too long for column \'age\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'age\' at row 1', '2024-03-07 16:13:53', 55);
INSERT INTO `sys_oper_log` VALUES (443, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"11\",\"createTime\":\"2024-03-07 16:14:00\",\"love\":\"花叶类,食用菌,花菜类\",\"loveList\":[\"花叶类\",\"食用菌\",\"花菜类\"],\"nickname\":\"test\",\"params\":{},\"phone\":\"13061184333\",\"profileImage\":\"https://s2.loli.net/2024/02/08/DE9qcKdWQymIu8C.jpg\",\"pwd\":\"1111\",\"sex\":\"0\",\"updateTime\":\"2024-03-07 16:14:00\",\"userId\":200024}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-07 16:14:01', 64);
INSERT INTO `sys_oper_log` VALUES (444, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.reception.WebUserDetailController.add()', 'POST', 1, 'admin', '研发部门', '/web/userDetail/addUser', '127.0.0.1', '内网IP', '{\"age\":\"11\",\"createTime\":\"2024-03-07 16:14:13\",\"love\":\"辣椒类,花叶类,水生根茎类\",\"loveList\":[\"辣椒类\",\"花叶类\",\"水生根茎类\"],\"nickname\":\"11\",\"params\":{},\"phone\":\"13061184333\",\"profileImage\":\"https://s2.loli.net/2024/02/08/irATxF7owf16JWD.jpg\",\"pwd\":\"11\",\"sex\":\"0\",\"updateTime\":\"2024-03-07 16:14:13\",\"userId\":200025}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-07 16:14:14', 58);
INSERT INTO `sys_oper_log` VALUES (445, '【请填写功能名称】', 3, 'com.ruoyi.web.controller.reception.WebUserDetailController.remove()', 'DELETE', 1, 'admin', '研发部门', '/web/userDetail/200024,200025', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-07 16:14:25', 67);
INSERT INTO `sys_oper_log` VALUES (446, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005116042,\"commodityName\":\"藕\",\"commodityPrice\":7.0,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":56,\"lossRate\":15.32,\"origin\":\"河南\",\"params\":{},\"partitionId\":1011010402,\"partitionName\":\"水生根茎类\",\"permission\":0,\"profileImage\":\"https://img0.baidu.com/it/u=2738406818,1535369178&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500\",\"remark\":\"生津凉血；熟藕性温，能补脾益血，减少脂类的吸收。\",\"selling\":3,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-12 11:45:21', 104);
INSERT INTO `sys_oper_log` VALUES (447, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005116714,\"commodityName\":\"西兰花\",\"commodityPrice\":8.82,\"createTime\":\"2024-03-14 00:00:00\",\"expirationFlag\":0,\"expirationTime\":320,\"lossRate\":9.26,\"origin\":\"云南\",\"params\":{},\"partitionId\":1011010201,\"partitionName\":\"花菜类\",\"permission\":0,\"profileImage\":\"https://gss0.baidu.com/70cFfyinKgQFm2e88IuM_a/baike/pic/item/8759287a24b1b1f52e73b304.jpg\",\"remark\":\"西蓝花的平均营养价值及防病作用远远超出其他蔬菜，古代西方人曾把西蓝花称为“天赐的良药”“穷人的医生”。\",\"selling\":4,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-12 11:45:33', 87);
INSERT INTO `sys_oper_log` VALUES (448, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005116219,\"commodityName\":\"红尖椒\",\"commodityPrice\":16.53,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":70,\"lossRate\":6.73,\"origin\":\"湖南\",\"params\":{},\"partitionId\":1011010504,\"partitionName\":\"辣椒类\",\"permission\":0,\"profileImage\":\"https://img2.baidu.com/it/u=2032125909,3189363820&fm=253&fmt=auto&app=138&f=JPEG?w=670&h=456\",\"remark\":\"除了含有丰富的胡萝卜素外，一根红辣椒还大约含有5000个国际单位的维生素A，可满足成年人的每天需求量\",\"selling\":8,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-12 11:45:44', 89);
INSERT INTO `sys_oper_log` VALUES (449, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005116226,\"commodityName\":\"青尖椒\",\"commodityPrice\":3.05,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":47,\"lossRate\":6.72,\"origin\":\"广东\",\"params\":{},\"partitionId\":1011010504,\"partitionName\":\"辣椒类\",\"permission\":0,\"profileImage\":\"https://ooo.0x0.ooo/2024/02/13/Ov27YD.jpg\",\"remark\":\"辣椒不但能给人带来好口感，还含有丰富的维生素C、叶酸、镁及钾等营养成分。还有温中散寒、开胃消食的功效。\",\"selling\":4,\"updateTime\":\"2024-02-18 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-12 11:46:00', 87);
INSERT INTO `sys_oper_log` VALUES (450, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005116233,\"commodityName\":\"红椒\",\"commodityPrice\":8.39,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":145,\"lossRate\":11.76,\"origin\":\"广西\",\"params\":{},\"partitionId\":1011010504,\"partitionName\":\"辣椒类\",\"permission\":0,\"profileImage\":\"https://img2.baidu.com/it/u=870842531,2083936975&fm=253&fmt=auto&app=138&f=JPEG?w=624&h=500\",\"remark\":\"红椒是菜椒的培育变种，属于茄科。有辛香味，能去除菜肴中的腥味，营养价值甚高\",\"selling\":7,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-12 11:46:10', 86);
INSERT INTO `sys_oper_log` VALUES (451, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005116905,\"commodityName\":\"青杭椒\",\"commodityPrice\":10.0,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":1,\"expirationTime\":40,\"lossRate\":0.0,\"origin\":\"江苏\",\"params\":{},\"partitionId\":1011010504,\"partitionName\":\"辣椒类\",\"permission\":0,\"profileImage\":\"https://img.bdyoo.com/shop/store/goods/86/2020/09/86_06525281814333796.jpg-wh360\",\"remark\":\"它既是美味佳肴的好佐料，又是一种温中散寒、可用于食欲不振等症的食疗佳品\",\"selling\":3,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-12 11:46:17', 87);
INSERT INTO `sys_oper_log` VALUES (452, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900005125808,\"commodityName\":\"小米椒\",\"commodityPrice\":13.74,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":56,\"lossRate\":5.86,\"origin\":\"陕西\",\"params\":{},\"partitionId\":1011010504,\"partitionName\":\"辣椒类\",\"permission\":0,\"profileImage\":\"https://www.cixinge.cn/rl_img/12384gq.jpg\",\"remark\":\"在江西赣州、福建龙岩等地为小米椒的主要产地，最为著名的是江西赣州石城县，该地利用当地烤烟用的烤烟房对小米椒进行烘干，具有数量大、速度快，成本低等优点\",\"selling\":5,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-12 11:46:22', 88);
INSERT INTO `sys_oper_log` VALUES (453, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900011000328,\"commodityName\":\"螺丝椒\",\"commodityPrice\":9.11,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":79,\"lossRate\":10.18,\"origin\":\"湖北\",\"params\":{},\"partitionId\":1011010504,\"partitionName\":\"辣椒类\",\"permission\":0,\"profileImage\":\"https://img1.baidu.com/it/u=3074433278,559417852&fm=253&fmt=auto&app=138&f=JPG?w=500&h=667\",\"remark\":\"因为螺丝椒口感较辣，肉质鲜美，深受湖南等地人民的喜爱。\",\"selling\":5,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-12 11:46:32', 89);
INSERT INTO `sys_oper_log` VALUES (454, '【请填写功能名称】', 2, 'com.ruoyi.web.controller.reception.WebCommodityDetailController.edit()', 'PUT', 1, 'admin', '研发部门', '/web/commodityDetail/edit', '127.0.0.1', '内网IP', '{\"commodityId\":102900011000335,\"commodityName\":\"紫圆茄\",\"commodityPrice\":2.51,\"createTime\":\"2024-01-28 00:00:00\",\"expirationFlag\":0,\"expirationTime\":54,\"lossRate\":0.32,\"origin\":\"四川\",\"params\":{},\"partitionId\":1011010501,\"partitionName\":\"茄类\",\"permission\":0,\"profileImage\":\"https://img2.baidu.com/it/u=1427067631,96291376&fm=253&fmt=auto&app=138&f=JPEG?w=700&h=416\",\"remark\":\"紫茄子性寒凉，味甘，具有清热活血、止痛消肿、祛风通络、利尿解毒等功效。\",\"selling\":4,\"updateTime\":\"2024-01-28 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-12 11:46:49', 86);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-01-26 22:08:12', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-01-26 22:08:12', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-01-26 22:08:12', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (100, 'client ', 'user', 3, '1', 1, 1, '0', '2', 'admin', '2024-02-04 14:14:13', '', NULL, '测试用');
INSERT INTO `sys_role` VALUES (101, 'admin1', 'admin1', 3, '1', 1, 1, '0', '0', 'admin', '2024-02-29 21:25:17', '', NULL, '商城管理');
INSERT INTO `sys_role` VALUES (102, 'admin2', 'admin2', 4, '1', 1, 1, '0', '0', 'admin', '2024-02-29 21:26:04', '', NULL, '供应管理');
INSERT INTO `sys_role` VALUES (103, 'admin3', 'admin3', 5, '1', 1, 1, '0', '0', 'admin', '2024-02-29 21:26:26', '', NULL, '运输管理');
INSERT INTO `sys_role` VALUES (104, 'admin4', 'admin4', 6, '1', 1, 1, '0', '0', 'admin', '2024-02-29 21:26:51', '', NULL, '销售管理');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 100);
INSERT INTO `sys_role_menu` VALUES (101, 101);
INSERT INTO `sys_role_menu` VALUES (101, 102);
INSERT INTO `sys_role_menu` VALUES (101, 103);
INSERT INTO `sys_role_menu` VALUES (101, 104);
INSERT INTO `sys_role_menu` VALUES (101, 105);
INSERT INTO `sys_role_menu` VALUES (101, 106);
INSERT INTO `sys_role_menu` VALUES (101, 107);
INSERT INTO `sys_role_menu` VALUES (101, 108);
INSERT INTO `sys_role_menu` VALUES (101, 500);
INSERT INTO `sys_role_menu` VALUES (101, 501);
INSERT INTO `sys_role_menu` VALUES (101, 1000);
INSERT INTO `sys_role_menu` VALUES (101, 1001);
INSERT INTO `sys_role_menu` VALUES (101, 1002);
INSERT INTO `sys_role_menu` VALUES (101, 1003);
INSERT INTO `sys_role_menu` VALUES (101, 1004);
INSERT INTO `sys_role_menu` VALUES (101, 1005);
INSERT INTO `sys_role_menu` VALUES (101, 1006);
INSERT INTO `sys_role_menu` VALUES (101, 1007);
INSERT INTO `sys_role_menu` VALUES (101, 1008);
INSERT INTO `sys_role_menu` VALUES (101, 1009);
INSERT INTO `sys_role_menu` VALUES (101, 1010);
INSERT INTO `sys_role_menu` VALUES (101, 1011);
INSERT INTO `sys_role_menu` VALUES (101, 1012);
INSERT INTO `sys_role_menu` VALUES (101, 1013);
INSERT INTO `sys_role_menu` VALUES (101, 1014);
INSERT INTO `sys_role_menu` VALUES (101, 1015);
INSERT INTO `sys_role_menu` VALUES (101, 1016);
INSERT INTO `sys_role_menu` VALUES (101, 1017);
INSERT INTO `sys_role_menu` VALUES (101, 1018);
INSERT INTO `sys_role_menu` VALUES (101, 1019);
INSERT INTO `sys_role_menu` VALUES (101, 1020);
INSERT INTO `sys_role_menu` VALUES (101, 1021);
INSERT INTO `sys_role_menu` VALUES (101, 1022);
INSERT INTO `sys_role_menu` VALUES (101, 1023);
INSERT INTO `sys_role_menu` VALUES (101, 1024);
INSERT INTO `sys_role_menu` VALUES (101, 1025);
INSERT INTO `sys_role_menu` VALUES (101, 1026);
INSERT INTO `sys_role_menu` VALUES (101, 1027);
INSERT INTO `sys_role_menu` VALUES (101, 1028);
INSERT INTO `sys_role_menu` VALUES (101, 1029);
INSERT INTO `sys_role_menu` VALUES (101, 1030);
INSERT INTO `sys_role_menu` VALUES (101, 1031);
INSERT INTO `sys_role_menu` VALUES (101, 1032);
INSERT INTO `sys_role_menu` VALUES (101, 1033);
INSERT INTO `sys_role_menu` VALUES (101, 1034);
INSERT INTO `sys_role_menu` VALUES (101, 1035);
INSERT INTO `sys_role_menu` VALUES (101, 1036);
INSERT INTO `sys_role_menu` VALUES (101, 1037);
INSERT INTO `sys_role_menu` VALUES (101, 1038);
INSERT INTO `sys_role_menu` VALUES (101, 1039);
INSERT INTO `sys_role_menu` VALUES (101, 1040);
INSERT INTO `sys_role_menu` VALUES (101, 1041);
INSERT INTO `sys_role_menu` VALUES (101, 1042);
INSERT INTO `sys_role_menu` VALUES (101, 1043);
INSERT INTO `sys_role_menu` VALUES (101, 1044);
INSERT INTO `sys_role_menu` VALUES (101, 1045);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2001);
INSERT INTO `sys_role_menu` VALUES (101, 2002);
INSERT INTO `sys_role_menu` VALUES (101, 2003);
INSERT INTO `sys_role_menu` VALUES (101, 2004);
INSERT INTO `sys_role_menu` VALUES (101, 2005);
INSERT INTO `sys_role_menu` VALUES (101, 2006);
INSERT INTO `sys_role_menu` VALUES (101, 2007);
INSERT INTO `sys_role_menu` VALUES (102, 1);
INSERT INTO `sys_role_menu` VALUES (102, 100);
INSERT INTO `sys_role_menu` VALUES (102, 101);
INSERT INTO `sys_role_menu` VALUES (102, 102);
INSERT INTO `sys_role_menu` VALUES (102, 103);
INSERT INTO `sys_role_menu` VALUES (102, 104);
INSERT INTO `sys_role_menu` VALUES (102, 105);
INSERT INTO `sys_role_menu` VALUES (102, 106);
INSERT INTO `sys_role_menu` VALUES (102, 107);
INSERT INTO `sys_role_menu` VALUES (102, 108);
INSERT INTO `sys_role_menu` VALUES (102, 500);
INSERT INTO `sys_role_menu` VALUES (102, 501);
INSERT INTO `sys_role_menu` VALUES (102, 1000);
INSERT INTO `sys_role_menu` VALUES (102, 1001);
INSERT INTO `sys_role_menu` VALUES (102, 1002);
INSERT INTO `sys_role_menu` VALUES (102, 1003);
INSERT INTO `sys_role_menu` VALUES (102, 1004);
INSERT INTO `sys_role_menu` VALUES (102, 1005);
INSERT INTO `sys_role_menu` VALUES (102, 1006);
INSERT INTO `sys_role_menu` VALUES (102, 1007);
INSERT INTO `sys_role_menu` VALUES (102, 1008);
INSERT INTO `sys_role_menu` VALUES (102, 1009);
INSERT INTO `sys_role_menu` VALUES (102, 1010);
INSERT INTO `sys_role_menu` VALUES (102, 1011);
INSERT INTO `sys_role_menu` VALUES (102, 1012);
INSERT INTO `sys_role_menu` VALUES (102, 1013);
INSERT INTO `sys_role_menu` VALUES (102, 1014);
INSERT INTO `sys_role_menu` VALUES (102, 1015);
INSERT INTO `sys_role_menu` VALUES (102, 1016);
INSERT INTO `sys_role_menu` VALUES (102, 1017);
INSERT INTO `sys_role_menu` VALUES (102, 1018);
INSERT INTO `sys_role_menu` VALUES (102, 1019);
INSERT INTO `sys_role_menu` VALUES (102, 1020);
INSERT INTO `sys_role_menu` VALUES (102, 1021);
INSERT INTO `sys_role_menu` VALUES (102, 1022);
INSERT INTO `sys_role_menu` VALUES (102, 1023);
INSERT INTO `sys_role_menu` VALUES (102, 1024);
INSERT INTO `sys_role_menu` VALUES (102, 1025);
INSERT INTO `sys_role_menu` VALUES (102, 1026);
INSERT INTO `sys_role_menu` VALUES (102, 1027);
INSERT INTO `sys_role_menu` VALUES (102, 1028);
INSERT INTO `sys_role_menu` VALUES (102, 1029);
INSERT INTO `sys_role_menu` VALUES (102, 1030);
INSERT INTO `sys_role_menu` VALUES (102, 1031);
INSERT INTO `sys_role_menu` VALUES (102, 1032);
INSERT INTO `sys_role_menu` VALUES (102, 1033);
INSERT INTO `sys_role_menu` VALUES (102, 1034);
INSERT INTO `sys_role_menu` VALUES (102, 1035);
INSERT INTO `sys_role_menu` VALUES (102, 1036);
INSERT INTO `sys_role_menu` VALUES (102, 1037);
INSERT INTO `sys_role_menu` VALUES (102, 1038);
INSERT INTO `sys_role_menu` VALUES (102, 1039);
INSERT INTO `sys_role_menu` VALUES (102, 1040);
INSERT INTO `sys_role_menu` VALUES (102, 1041);
INSERT INTO `sys_role_menu` VALUES (102, 1042);
INSERT INTO `sys_role_menu` VALUES (102, 1043);
INSERT INTO `sys_role_menu` VALUES (102, 1044);
INSERT INTO `sys_role_menu` VALUES (102, 1045);
INSERT INTO `sys_role_menu` VALUES (102, 2008);
INSERT INTO `sys_role_menu` VALUES (102, 2009);
INSERT INTO `sys_role_menu` VALUES (102, 2012);
INSERT INTO `sys_role_menu` VALUES (103, 1);
INSERT INTO `sys_role_menu` VALUES (103, 100);
INSERT INTO `sys_role_menu` VALUES (103, 101);
INSERT INTO `sys_role_menu` VALUES (103, 102);
INSERT INTO `sys_role_menu` VALUES (103, 103);
INSERT INTO `sys_role_menu` VALUES (103, 104);
INSERT INTO `sys_role_menu` VALUES (103, 105);
INSERT INTO `sys_role_menu` VALUES (103, 106);
INSERT INTO `sys_role_menu` VALUES (103, 107);
INSERT INTO `sys_role_menu` VALUES (103, 108);
INSERT INTO `sys_role_menu` VALUES (103, 500);
INSERT INTO `sys_role_menu` VALUES (103, 501);
INSERT INTO `sys_role_menu` VALUES (103, 1000);
INSERT INTO `sys_role_menu` VALUES (103, 1001);
INSERT INTO `sys_role_menu` VALUES (103, 1002);
INSERT INTO `sys_role_menu` VALUES (103, 1003);
INSERT INTO `sys_role_menu` VALUES (103, 1004);
INSERT INTO `sys_role_menu` VALUES (103, 1005);
INSERT INTO `sys_role_menu` VALUES (103, 1006);
INSERT INTO `sys_role_menu` VALUES (103, 1007);
INSERT INTO `sys_role_menu` VALUES (103, 1008);
INSERT INTO `sys_role_menu` VALUES (103, 1009);
INSERT INTO `sys_role_menu` VALUES (103, 1010);
INSERT INTO `sys_role_menu` VALUES (103, 1011);
INSERT INTO `sys_role_menu` VALUES (103, 1012);
INSERT INTO `sys_role_menu` VALUES (103, 1013);
INSERT INTO `sys_role_menu` VALUES (103, 1014);
INSERT INTO `sys_role_menu` VALUES (103, 1015);
INSERT INTO `sys_role_menu` VALUES (103, 1016);
INSERT INTO `sys_role_menu` VALUES (103, 1017);
INSERT INTO `sys_role_menu` VALUES (103, 1018);
INSERT INTO `sys_role_menu` VALUES (103, 1019);
INSERT INTO `sys_role_menu` VALUES (103, 1020);
INSERT INTO `sys_role_menu` VALUES (103, 1021);
INSERT INTO `sys_role_menu` VALUES (103, 1022);
INSERT INTO `sys_role_menu` VALUES (103, 1023);
INSERT INTO `sys_role_menu` VALUES (103, 1024);
INSERT INTO `sys_role_menu` VALUES (103, 1025);
INSERT INTO `sys_role_menu` VALUES (103, 1026);
INSERT INTO `sys_role_menu` VALUES (103, 1027);
INSERT INTO `sys_role_menu` VALUES (103, 1028);
INSERT INTO `sys_role_menu` VALUES (103, 1029);
INSERT INTO `sys_role_menu` VALUES (103, 1030);
INSERT INTO `sys_role_menu` VALUES (103, 1031);
INSERT INTO `sys_role_menu` VALUES (103, 1032);
INSERT INTO `sys_role_menu` VALUES (103, 1033);
INSERT INTO `sys_role_menu` VALUES (103, 1034);
INSERT INTO `sys_role_menu` VALUES (103, 1035);
INSERT INTO `sys_role_menu` VALUES (103, 1036);
INSERT INTO `sys_role_menu` VALUES (103, 1037);
INSERT INTO `sys_role_menu` VALUES (103, 1038);
INSERT INTO `sys_role_menu` VALUES (103, 1039);
INSERT INTO `sys_role_menu` VALUES (103, 1040);
INSERT INTO `sys_role_menu` VALUES (103, 1041);
INSERT INTO `sys_role_menu` VALUES (103, 1042);
INSERT INTO `sys_role_menu` VALUES (103, 1043);
INSERT INTO `sys_role_menu` VALUES (103, 1044);
INSERT INTO `sys_role_menu` VALUES (103, 1045);
INSERT INTO `sys_role_menu` VALUES (103, 2008);
INSERT INTO `sys_role_menu` VALUES (103, 2010);
INSERT INTO `sys_role_menu` VALUES (103, 2012);
INSERT INTO `sys_role_menu` VALUES (104, 1);
INSERT INTO `sys_role_menu` VALUES (104, 100);
INSERT INTO `sys_role_menu` VALUES (104, 101);
INSERT INTO `sys_role_menu` VALUES (104, 102);
INSERT INTO `sys_role_menu` VALUES (104, 103);
INSERT INTO `sys_role_menu` VALUES (104, 104);
INSERT INTO `sys_role_menu` VALUES (104, 105);
INSERT INTO `sys_role_menu` VALUES (104, 106);
INSERT INTO `sys_role_menu` VALUES (104, 107);
INSERT INTO `sys_role_menu` VALUES (104, 108);
INSERT INTO `sys_role_menu` VALUES (104, 500);
INSERT INTO `sys_role_menu` VALUES (104, 501);
INSERT INTO `sys_role_menu` VALUES (104, 1000);
INSERT INTO `sys_role_menu` VALUES (104, 1001);
INSERT INTO `sys_role_menu` VALUES (104, 1002);
INSERT INTO `sys_role_menu` VALUES (104, 1003);
INSERT INTO `sys_role_menu` VALUES (104, 1004);
INSERT INTO `sys_role_menu` VALUES (104, 1005);
INSERT INTO `sys_role_menu` VALUES (104, 1006);
INSERT INTO `sys_role_menu` VALUES (104, 1007);
INSERT INTO `sys_role_menu` VALUES (104, 1008);
INSERT INTO `sys_role_menu` VALUES (104, 1009);
INSERT INTO `sys_role_menu` VALUES (104, 1010);
INSERT INTO `sys_role_menu` VALUES (104, 1011);
INSERT INTO `sys_role_menu` VALUES (104, 1012);
INSERT INTO `sys_role_menu` VALUES (104, 1013);
INSERT INTO `sys_role_menu` VALUES (104, 1014);
INSERT INTO `sys_role_menu` VALUES (104, 1015);
INSERT INTO `sys_role_menu` VALUES (104, 1016);
INSERT INTO `sys_role_menu` VALUES (104, 1017);
INSERT INTO `sys_role_menu` VALUES (104, 1018);
INSERT INTO `sys_role_menu` VALUES (104, 1019);
INSERT INTO `sys_role_menu` VALUES (104, 1020);
INSERT INTO `sys_role_menu` VALUES (104, 1021);
INSERT INTO `sys_role_menu` VALUES (104, 1022);
INSERT INTO `sys_role_menu` VALUES (104, 1023);
INSERT INTO `sys_role_menu` VALUES (104, 1024);
INSERT INTO `sys_role_menu` VALUES (104, 1025);
INSERT INTO `sys_role_menu` VALUES (104, 1026);
INSERT INTO `sys_role_menu` VALUES (104, 1027);
INSERT INTO `sys_role_menu` VALUES (104, 1028);
INSERT INTO `sys_role_menu` VALUES (104, 1029);
INSERT INTO `sys_role_menu` VALUES (104, 1030);
INSERT INTO `sys_role_menu` VALUES (104, 1031);
INSERT INTO `sys_role_menu` VALUES (104, 1032);
INSERT INTO `sys_role_menu` VALUES (104, 1033);
INSERT INTO `sys_role_menu` VALUES (104, 1034);
INSERT INTO `sys_role_menu` VALUES (104, 1035);
INSERT INTO `sys_role_menu` VALUES (104, 1036);
INSERT INTO `sys_role_menu` VALUES (104, 1037);
INSERT INTO `sys_role_menu` VALUES (104, 1038);
INSERT INTO `sys_role_menu` VALUES (104, 1039);
INSERT INTO `sys_role_menu` VALUES (104, 1040);
INSERT INTO `sys_role_menu` VALUES (104, 1041);
INSERT INTO `sys_role_menu` VALUES (104, 1042);
INSERT INTO `sys_role_menu` VALUES (104, 1043);
INSERT INTO `sys_role_menu` VALUES (104, 1044);
INSERT INTO `sys_role_menu` VALUES (104, 1045);
INSERT INTO `sys_role_menu` VALUES (104, 2008);
INSERT INTO `sys_role_menu` VALUES (104, 2011);
INSERT INTO `sys_role_menu` VALUES (104, 2012);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '192.168.43.120', '2024-03-12 21:01:34', 'admin', '2024-01-26 22:08:12', '', '2024-03-12 21:01:34', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', 'test', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2024-01-26 22:08:12', 'admin', '2024-01-26 22:08:12', 'admin', '2024-02-14 22:00:14', '测试员');
INSERT INTO `sys_user` VALUES (100, 105, 'test', 'test', '00', '110@qq.com', '18369883001', '0', '', '$2a$10$MsyG0OavG/gkd8IJRLwZj.MKjOq20Zdyye9YYvMtMjzDV.Eha.YNe', '0', '0', '127.0.0.1', '2024-02-14 22:03:56', 'admin', '2024-02-14 22:02:47', '', '2024-02-14 22:03:54', '测试');
INSERT INTO `sys_user` VALUES (101, 102, 'Jack', 'Jack', '00', '111111111@qq.com', '13061199452', '0', '', '$2a$10$6s51LR4WXcT6v96VqtugxOw7WkAuT8Fy4K9dnQHdDMjWowMZrpuam', '0', '2', '', NULL, 'admin', '2024-02-14 22:18:57', 'admin', '2024-02-14 22:19:48', NULL);
INSERT INTO `sys_user` VALUES (102, 102, 'Rose', 'Rose', '00', '11111112@qq.com', '18691194539', '0', '', '$2a$10$KvwB7/m7Sc1ObMA6iAC2C.7T3VHY2qVFqb9g1b4jq.uZG1wIZ1Dmi', '0', '2', '', NULL, 'admin', '2024-02-14 22:22:16', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, 102, 'Peter', 'Peter', '00', '11111113@qq.com', '13061145949', '1', '', '$2a$10$cUzt9r541zK56lqPNieaV.Bh73oSos0.rXgx8H9E7KwUMQyg3sVv.', '0', '2', '', NULL, 'admin', '2024-02-14 22:23:37', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (104, 102, 'Andy', 'Andy', '00', '11111114@qq.com', '13578145299', '0', '', '$2a$10$gqV3AC9BkozTd72mdetL.eL8qrbXOuOegjx0fO8/Y/5Dc7PyMaPKO', '0', '2', '', NULL, 'admin', '2024-02-14 22:25:09', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (105, 102, 'Ava', 'Ava', '00', '11111115@qq.com', '13061194516', '1', '', '$2a$10$4TjL3A5b2vl/hsLeNScyF.tHuTDuAekKbHr1E3PPfcO2jAmdqNU9q', '0', '2', '127.0.0.1', '2024-02-15 22:13:22', 'admin', '2024-02-14 22:26:27', '', '2024-02-15 22:13:23', NULL);
INSERT INTO `sys_user` VALUES (106, 102, 'David', 'David', '00', '11111116@qq.com', '17761194594', '1', '', '$2a$10$sH1i00AWfkWK/r5HyAVmMeT/jlBbrP6dm0z1XPZk2gHUmbNPSdFga', '0', '2', '', NULL, 'admin', '2024-02-14 22:27:52', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (107, 102, 'William', 'William', '00', '11111117@qq.com', '17861179759', '1', '', '$2a$10$xYKnZMwhka7VoPHQGyysNeoEYGxcRyaJxd8dVMNzoe57wwyAFfRk2', '0', '2', '', NULL, 'admin', '2024-02-14 22:28:58', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (108, 102, 'Amelia', 'Amelia', '00', '11111118@qq.com', '13061194561', '1', '', '$2a$10$trCMHi8AP5aYpqYeX6WAeOKQHRZN4tJT8s1Y/0DAbB7L30.xJCG2i', '0', '2', '', NULL, 'admin', '2024-02-14 22:31:22', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (109, 102, 'Charlotte', 'Charlotte', '00', '11111119@qq.com', '13061178654', '0', '', '$2a$10$Va2DRs0MBLiil0Xk/ylcdeltB/pqpPOEJvl6GuAoMaFCzHKVSW0GW', '0', '2', '', NULL, 'admin', '2024-02-14 22:32:17', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (110, 102, 'Daniel', 'Daniel', '00', '11111121@qq.com', '13061178564', '1', '', '$2a$10$W/x83r.cg1rK8Xwq2jqbO.3D3PtIhuUaKOTP6EpDRz7xsrJfvqk/O', '0', '2', '', NULL, 'admin', '2024-02-14 22:34:52', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (111, 100, 'admin1', 'admin1', '00', '136@qq.com', '18311111111', '0', '', '$2a$10$v5xjxeu5dccXE1W/eaArz.P2Ry7XLEeZt8jjWxAvW.zGOb68XiLkK', '0', '0', '127.0.0.1', '2024-03-06 13:04:01', 'admin', '2024-02-29 21:28:42', '', '2024-03-06 13:04:01', NULL);
INSERT INTO `sys_user` VALUES (112, 100, 'admin2', 'admin2', '00', '1@qq.com', '18211111111', '0', '', '$2a$10$qC5/GvZZQX0Ua5mwfgTF5uDrxCeNGU8ocQaeQ9l1WUCu24j2.dynC', '0', '0', '127.0.0.1', '2024-02-29 21:31:17', 'admin', '2024-02-29 21:29:21', '', '2024-02-29 21:31:15', NULL);
INSERT INTO `sys_user` VALUES (113, 100, 'admin3', 'admin3', '00', '123@qq.com', '18411111111', '0', '', '$2a$10$X3lBugJtJPSG/1FU4Fb0MuCcb.BakHkhHLXtriULZFA6ni7tHcCt2', '0', '0', '127.0.0.1', '2024-03-01 17:14:21', 'admin', '2024-02-29 21:29:51', '', '2024-03-01 17:14:17', NULL);
INSERT INTO `sys_user` VALUES (114, 100, 'admin4', 'admin4', '00', '1234@qq.com', '18511111111', '0', '', '$2a$10$/B5ht3v9sSb3bzTf95GGdu7R4btPNGLsImNYvuPc7yHivtGvHtdb2', '0', '0', '', NULL, 'admin', '2024-02-29 21:30:22', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (100, 4);
INSERT INTO `sys_user_post` VALUES (111, 2);
INSERT INTO `sys_user_post` VALUES (112, 2);
INSERT INTO `sys_user_post` VALUES (113, 2);
INSERT INTO `sys_user_post` VALUES (114, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 2);
INSERT INTO `sys_user_role` VALUES (111, 101);
INSERT INTO `sys_user_role` VALUES (112, 102);
INSERT INTO `sys_user_role` VALUES (113, 103);
INSERT INTO `sys_user_role` VALUES (114, 104);

-- ----------------------------
-- Table structure for sys_user_view
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_view`;
CREATE TABLE `sys_user_view`  (
  `view_id` bigint NOT NULL AUTO_INCREMENT,
  `commodity_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `view_context` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `love_flag` bigint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `permission` int NULL DEFAULT NULL,
  `audit_flag` int NULL DEFAULT NULL,
  PRIMARY KEY (`view_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 720 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_view
-- ----------------------------
INSERT INTO `sys_user_view` VALUES (1, 102900005115823, 200001, '很新鲜！', 5, '2024-01-19 06:08:29', 0, 0);
INSERT INTO `sys_user_view` VALUES (2, 102900005116219, 200001, '带练加我110250666', 4, '2024-02-15 01:06:14', 0, 0);
INSERT INTO `sys_user_view` VALUES (3, 102900005116714, 200001, '不好，差评！', 2, '2023-12-22 19:02:00', 1, 0);
INSERT INTO `sys_user_view` VALUES (4, 102900005128748, 200002, '私我看性感女郎在线发牌', 3, '2023-11-30 13:45:46', 1, 0);
INSERT INTO `sys_user_view` VALUES (5, 102900011000328, 200004, '很棒！', 5, '2023-11-01 12:33:07', 0, 1);
INSERT INTO `sys_user_view` VALUES (6, 102900011007969, 200006, '菜都坏了！', 2, '2023-11-24 06:52:15', 0, 1);
INSERT INTO `sys_user_view` VALUES (7, 102900005115762, 200008, '量太少', 3, '2024-01-07 03:56:48', 0, 1);
INSERT INTO `sys_user_view` VALUES (8, 102900005115625, 200003, '很好~', 5, '2024-01-05 11:58:20', 5, 1);
INSERT INTO `sys_user_view` VALUES (9, 102900005115984, 200005, '不好！', 3, '2023-05-15 10:45:47', 0, 1);
INSERT INTO `sys_user_view` VALUES (10, 102900005118831, 200001, '有虫子，绝对差评！', 1, '2024-01-24 13:30:49', 0, 1);
INSERT INTO `sys_user_view` VALUES (11, 102900011006955, 200001, '难吃', 2, '2024-04-22 21:45:53', 0, 1);
INSERT INTO `sys_user_view` VALUES (12, 102900011034323, 200005, '一般', 4, '2024-06-02 11:58:39', 1, 1);
INSERT INTO `sys_user_view` VALUES (13, 102900011016909, 200003, '打农药，不卫生~', 2, '2024-05-22 12:59:19', 0, 1);
INSERT INTO `sys_user_view` VALUES (14, 102900005115823, 200004, '难吃', 2, '2024-05-21 23:21:35', 0, 1);
INSERT INTO `sys_user_view` VALUES (15, 102900011010563, 200004, '难吃', 0, '2024-05-16 11:38:27', 1, 1);
INSERT INTO `sys_user_view` VALUES (16, 102900011007969, 200010, '一般', 1, '2024-06-05 01:42:10', 0, 1);
INSERT INTO `sys_user_view` VALUES (17, 102900011034324, 200003, '难吃', 0, '2024-04-17 04:36:05', 1, 1);
INSERT INTO `sys_user_view` VALUES (18, 102900005116806, 200005, '一般', 4, '2024-04-18 09:14:46', 0, 1);
INSERT INTO `sys_user_view` VALUES (19, 102900005115861, 200007, '难吃', 1, '2024-05-05 22:36:34', 0, 1);
INSERT INTO `sys_user_view` VALUES (20, 102900011022764, 200007, '一般', 3, '2024-06-09 07:13:55', 1, 1);
INSERT INTO `sys_user_view` VALUES (21, 102900005115984, 200002, '难吃', 3, '2024-05-11 02:43:03', 1, 1);
INSERT INTO `sys_user_view` VALUES (22, 102900011022764, 200003, '一般', 3, '2024-04-29 02:48:50', 1, 1);
INSERT INTO `sys_user_view` VALUES (23, 102900005116806, 200010, '一般', 0, '2024-06-01 22:24:12', 1, 1);
INSERT INTO `sys_user_view` VALUES (24, 102900005116714, 200002, '一般', 5, '2024-06-07 06:20:08', 0, 1);
INSERT INTO `sys_user_view` VALUES (25, 102900005116714, 200010, '难吃', 1, '2024-05-03 06:21:04', 0, 1);
INSERT INTO `sys_user_view` VALUES (26, 102900005116905, 200009, '好吃', 2, '2024-04-30 03:26:42', 0, 1);
INSERT INTO `sys_user_view` VALUES (27, 102900011009277, 200007, '一般', 2, '2024-05-01 06:26:08', 0, 1);
INSERT INTO `sys_user_view` VALUES (28, 102900005125808, 200008, '好吃', 1, '2024-05-27 08:56:09', 0, 1);
INSERT INTO `sys_user_view` VALUES (29, 102900005115861, 200006, '一般', 2, '2024-05-07 21:24:23', 0, 1);
INSERT INTO `sys_user_view` VALUES (30, 102900005116219, 200005, '难吃', 2, '2024-05-08 03:29:33', 0, 1);
INSERT INTO `sys_user_view` VALUES (31, 102900011000328, 200001, '一般', 5, '2024-04-26 03:32:19', 1, 1);
INSERT INTO `sys_user_view` VALUES (32, 102900011000175, 200006, '好吃', 3, '2024-05-04 16:23:16', 1, 1);
INSERT INTO `sys_user_view` VALUES (33, 102900011016909, 200003, '一般', 3, '2024-05-14 04:26:13', 1, 1);
INSERT INTO `sys_user_view` VALUES (34, 102900011006689, 200006, '好吃', 5, '2024-05-14 07:38:03', 1, 1);
INSERT INTO `sys_user_view` VALUES (35, 102900011034323, 200006, '好吃', 4, '2024-06-09 01:09:11', 0, 1);
INSERT INTO `sys_user_view` VALUES (36, 102900011008522, 200007, '一般', 4, '2024-05-22 23:54:59', 0, 1);
INSERT INTO `sys_user_view` VALUES (37, 102900005115960, 200004, '好吃', 5, '2024-04-27 08:12:38', 1, 1);
INSERT INTO `sys_user_view` VALUES (38, 102900005116233, 200009, '一般', 4, '2024-06-03 08:07:57', 0, 1);
INSERT INTO `sys_user_view` VALUES (39, 102900011011058, 200008, '难吃', 1, '2024-05-15 14:53:54', 1, 1);
INSERT INTO `sys_user_view` VALUES (40, 102900011007969, 200001, '一般', 3, '2024-04-27 10:31:50', 0, 1);
INSERT INTO `sys_user_view` VALUES (41, 102900011007471, 200001, '好吃', 0, '2024-06-02 09:08:39', 1, 1);
INSERT INTO `sys_user_view` VALUES (42, 102900005115861, 200010, '一般', 4, '2024-06-07 18:39:08', 0, 1);
INSERT INTO `sys_user_view` VALUES (43, 102900005115786, 200009, '难吃', 0, '2024-05-14 04:21:54', 1, 1);
INSERT INTO `sys_user_view` VALUES (44, 102900005116714, 200004, '一般', 3, '2024-05-21 17:23:20', 0, 1);
INSERT INTO `sys_user_view` VALUES (45, 102900005116226, 200008, '一般', 1, '2024-05-26 16:05:01', 1, 1);
INSERT INTO `sys_user_view` VALUES (46, 102900011008522, 200008, '一般', 5, '2024-05-17 05:09:20', 0, 1);
INSERT INTO `sys_user_view` VALUES (47, 102900011006689, 200010, '一般', 2, '2024-06-10 06:45:52', 1, 1);
INSERT INTO `sys_user_view` VALUES (48, 102900005116233, 200008, '难吃', 2, '2024-04-21 00:46:05', 0, 1);
INSERT INTO `sys_user_view` VALUES (49, 102900011034325, 200004, '难吃', 1, '2024-06-02 08:00:16', 0, 1);
INSERT INTO `sys_user_view` VALUES (50, 102900011010563, 200004, '好吃', 1, '2024-06-01 05:25:48', 0, 1);
INSERT INTO `sys_user_view` VALUES (51, 102900011000328, 200009, '好吃', 2, '2024-05-08 17:08:49', 1, 1);
INSERT INTO `sys_user_view` VALUES (52, 102900005128748, 200007, '好吃', 1, '2024-05-16 09:36:43', 1, 1);
INSERT INTO `sys_user_view` VALUES (53, 102900011034325, 200009, '好吃', 5, '2024-05-30 11:09:06', 1, 1);
INSERT INTO `sys_user_view` VALUES (54, 102900011008577, 200002, '好吃', 3, '2024-05-09 00:59:51', 1, 1);
INSERT INTO `sys_user_view` VALUES (55, 102900011034325, 200009, '好吃', 0, '2024-06-13 08:18:01', 0, 1);
INSERT INTO `sys_user_view` VALUES (56, 102900005115793, 200001, '好吃', 4, '2024-06-02 07:04:53', 1, 1);
INSERT INTO `sys_user_view` VALUES (57, 102900005115748, 200010, '好吃', 0, '2024-05-01 11:31:29', 1, 1);
INSERT INTO `sys_user_view` VALUES (58, 102900005116226, 200002, '好吃', 3, '2024-04-18 02:10:02', 1, 1);
INSERT INTO `sys_user_view` VALUES (59, 102900011033920, 200003, '难吃', 1, '2024-05-29 07:17:52', 1, 1);
INSERT INTO `sys_user_view` VALUES (60, 102900011009277, 200008, '一般', 5, '2024-05-05 03:46:47', 1, 1);
INSERT INTO `sys_user_view` VALUES (61, 102900011008522, 200006, '难吃', 3, '2024-05-22 21:56:15', 1, 1);
INSERT INTO `sys_user_view` VALUES (62, 102900011034224, 200009, '好吃', 1, '2024-06-05 00:51:39', 1, 1);
INSERT INTO `sys_user_view` VALUES (63, 102900005115946, 200005, '一般', 2, '2024-05-30 17:40:24', 0, 1);
INSERT INTO `sys_user_view` VALUES (64, 102900005116226, 200001, '难吃', 3, '2024-04-26 03:51:44', 0, 1);
INSERT INTO `sys_user_view` VALUES (65, 102900011016909, 200002, '一般', 3, '2024-04-29 04:46:31', 0, 1);
INSERT INTO `sys_user_view` VALUES (66, 102900011006689, 200006, '好吃', 1, '2024-06-10 23:22:02', 0, 1);
INSERT INTO `sys_user_view` VALUES (67, 102900011011058, 200005, '一般', 5, '2024-05-30 14:33:10', 1, 1);
INSERT INTO `sys_user_view` VALUES (68, 102900005116233, 200005, '难吃', 4, '2024-04-18 19:53:05', 1, 1);
INSERT INTO `sys_user_view` VALUES (69, 102900005115977, 200008, '一般', 5, '2024-04-20 02:28:24', 1, 1);
INSERT INTO `sys_user_view` VALUES (70, 102900011034224, 200009, '好吃', 2, '2024-05-18 03:42:41', 0, 1);
INSERT INTO `sys_user_view` VALUES (71, 102900011007464, 200006, '一般', 4, '2024-05-27 12:08:50', 0, 1);
INSERT INTO `sys_user_view` VALUES (72, 102900005116905, 200002, '难吃', 2, '2024-05-11 04:44:48', 1, 1);
INSERT INTO `sys_user_view` VALUES (73, 102900005115823, 200006, '好吃', 3, '2024-05-27 13:50:33', 0, 1);
INSERT INTO `sys_user_view` VALUES (74, 102900005115793, 200001, '难吃', 3, '2024-05-19 17:27:54', 0, 1);
INSERT INTO `sys_user_view` VALUES (75, 102900005115748, 200008, '一般', 0, '2024-05-12 07:21:53', 0, 1);
INSERT INTO `sys_user_view` VALUES (76, 102900011011058, 200007, '好吃', 0, '2024-06-10 11:08:45', 0, 1);
INSERT INTO `sys_user_view` VALUES (77, 102900005115984, 200006, '好吃', 2, '2024-04-23 10:45:50', 0, 1);
INSERT INTO `sys_user_view` VALUES (78, 102900011033920, 200001, '难吃', 2, '2024-04-26 18:35:22', 0, 1);
INSERT INTO `sys_user_view` VALUES (79, 102900005115762, 200002, '难吃', 5, '2024-05-28 19:38:06', 1, 1);
INSERT INTO `sys_user_view` VALUES (80, 102900011007969, 200005, '一般', 0, '2024-05-18 11:31:21', 0, 1);
INSERT INTO `sys_user_view` VALUES (81, 102900005116714, 200002, '难吃', 1, '2024-05-25 23:34:48', 1, 1);
INSERT INTO `sys_user_view` VALUES (82, 102900011033920, 200010, '难吃', 4, '2024-05-05 14:35:32', 1, 1);
INSERT INTO `sys_user_view` VALUES (83, 102900005128748, 200009, '好吃', 2, '2024-06-05 06:37:44', 1, 1);
INSERT INTO `sys_user_view` VALUES (84, 102900005116233, 200006, '难吃', 3, '2024-05-26 08:49:01', 0, 1);
INSERT INTO `sys_user_view` VALUES (85, 102900011008522, 200009, '一般', 3, '2024-06-14 08:05:54', 0, 1);
INSERT INTO `sys_user_view` VALUES (86, 102900011008485, 200003, '好吃', 4, '2024-05-03 02:03:37', 0, 1);
INSERT INTO `sys_user_view` VALUES (87, 102900005116806, 200008, '好吃', 3, '2024-05-05 12:10:47', 0, 1);
INSERT INTO `sys_user_view` VALUES (88, 102900011022764, 200010, '一般', 4, '2024-05-04 19:20:00', 1, 1);
INSERT INTO `sys_user_view` VALUES (89, 102900005115762, 200007, '好吃', 1, '2024-05-27 02:26:57', 1, 1);
INSERT INTO `sys_user_view` VALUES (90, 102900011007464, 200004, '好吃', 2, '2024-05-25 10:47:19', 1, 1);
INSERT INTO `sys_user_view` VALUES (91, 102900005125808, 200002, '难吃', 0, '2024-05-11 00:28:38', 0, 1);
INSERT INTO `sys_user_view` VALUES (92, 102900011006955, 200006, '一般', 5, '2024-04-23 08:06:51', 1, 1);
INSERT INTO `sys_user_view` VALUES (93, 102900011008492, 200005, '好吃', 1, '2024-06-11 21:58:01', 0, 1);
INSERT INTO `sys_user_view` VALUES (94, 102900005115984, 200008, '好吃', 1, '2024-04-17 16:43:27', 0, 1);
INSERT INTO `sys_user_view` VALUES (95, 102900005115946, 200007, '好吃', 4, '2024-06-13 08:40:17', 0, 1);
INSERT INTO `sys_user_view` VALUES (96, 102900011034325, 200006, '一般', 4, '2024-04-29 07:37:24', 0, 1);
INSERT INTO `sys_user_view` VALUES (97, 102900005115946, 200010, '难吃', 0, '2024-06-06 02:24:49', 1, 1);
INSERT INTO `sys_user_view` VALUES (98, 102900011034325, 200001, '好吃', 5, '2024-05-30 16:02:36', 1, 1);
INSERT INTO `sys_user_view` VALUES (99, 10, 200004, '难吃', 0, '2024-06-12 10:48:20', 1, 1);
INSERT INTO `sys_user_view` VALUES (100, 102900005115861, 200002, '难吃', 3, '2024-04-29 04:45:38', 1, 1);
INSERT INTO `sys_user_view` VALUES (101, 102900005115779, 200001, '好吃', 0, '2024-05-04 09:41:10', 0, 1);
INSERT INTO `sys_user_view` VALUES (102, 102900011033920, 200006, '一般', 3, '2024-05-23 03:12:35', 1, 1);
INSERT INTO `sys_user_view` VALUES (103, 102900011000328, 200006, '好吃', 2, '2024-05-04 09:48:58', 1, 1);
INSERT INTO `sys_user_view` VALUES (104, 10, 200002, '一般', 2, '2024-05-29 05:52:22', 0, 1);
INSERT INTO `sys_user_view` VALUES (105, 102900005116905, 200006, '好吃', 1, '2024-06-11 18:58:39', 0, 1);
INSERT INTO `sys_user_view` VALUES (106, 102900011008492, 200006, '好吃', 5, '2024-05-31 03:11:26', 0, 1);
INSERT INTO `sys_user_view` VALUES (107, 102900011007969, 200005, '一般', 3, '2024-05-15 08:52:21', 0, 1);
INSERT INTO `sys_user_view` VALUES (108, 102900011009277, 200008, '好吃', 0, '2024-05-09 13:20:20', 0, 1);
INSERT INTO `sys_user_view` VALUES (109, 102900005115946, 200002, '好吃', 1, '2024-05-25 09:40:10', 0, 1);
INSERT INTO `sys_user_view` VALUES (110, 102900005115779, 200007, '一般', 4, '2024-06-12 09:23:53', 1, 1);
INSERT INTO `sys_user_view` VALUES (111, 102900005115946, 200003, '一般', 1, '2024-05-04 06:16:22', 0, 1);
INSERT INTO `sys_user_view` VALUES (112, 102900005115861, 200002, '好吃', 0, '2024-05-20 15:57:51', 0, 1);
INSERT INTO `sys_user_view` VALUES (113, 102900011008577, 200007, '一般', 2, '2024-04-24 00:59:53', 0, 1);
INSERT INTO `sys_user_view` VALUES (114, 102900011022764, 200005, '难吃', 4, '2024-05-10 05:36:01', 1, 1);
INSERT INTO `sys_user_view` VALUES (115, 102900011022764, 200005, '一般', 1, '2024-04-30 18:41:47', 1, 1);
INSERT INTO `sys_user_view` VALUES (116, 102900005115946, 200007, '难吃', 5, '2024-05-19 06:53:00', 0, 1);
INSERT INTO `sys_user_view` VALUES (117, 102900005125808, 200004, '好吃', 2, '2024-05-30 07:43:13', 1, 1);
INSERT INTO `sys_user_view` VALUES (118, 102900011008485, 200008, '好吃', 4, '2024-06-12 07:40:10', 1, 1);
INSERT INTO `sys_user_view` VALUES (119, 102900005115960, 200002, '好吃', 3, '2024-05-01 15:20:56', 0, 1);
INSERT INTO `sys_user_view` VALUES (120, 102900011007471, 200004, '难吃', 2, '2024-06-12 12:43:47', 1, 1);
INSERT INTO `sys_user_view` VALUES (121, 102900005115748, 200006, '一般', 1, '2024-05-22 18:30:36', 0, 1);
INSERT INTO `sys_user_view` VALUES (122, 102900005115977, 200006, '好吃', 1, '2024-05-02 09:53:21', 1, 1);
INSERT INTO `sys_user_view` VALUES (123, 102900011034324, 200010, '好吃', 5, '2024-05-26 01:30:15', 1, 1);
INSERT INTO `sys_user_view` VALUES (124, 102900005116806, 200005, '一般', 3, '2024-06-01 07:21:27', 0, 1);
INSERT INTO `sys_user_view` VALUES (125, 102900005115762, 200005, '一般', 2, '2024-05-12 12:04:37', 0, 1);
INSERT INTO `sys_user_view` VALUES (126, 102900011033920, 200004, '好吃', 2, '2024-05-07 21:57:49', 1, 1);
INSERT INTO `sys_user_view` VALUES (127, 102900011022764, 200010, '一般', 0, '2024-05-15 08:26:18', 0, 1);
INSERT INTO `sys_user_view` VALUES (128, 102900011018132, 200005, '好吃', 5, '2024-06-10 08:54:03', 1, 1);
INSERT INTO `sys_user_view` VALUES (129, 102900011007464, 200010, '好吃', 0, '2024-04-20 09:07:01', 0, 1);
INSERT INTO `sys_user_view` VALUES (130, 102900011033920, 200004, '好吃', 4, '2024-05-13 04:58:59', 1, 1);
INSERT INTO `sys_user_view` VALUES (131, 102900011000175, 200002, '好吃', 5, '2024-06-03 00:27:35', 1, 1);
INSERT INTO `sys_user_view` VALUES (132, 102900011034326, 200002, '难吃', 2, '2024-05-22 10:39:13', 1, 1);
INSERT INTO `sys_user_view` VALUES (133, 102900005115793, 200005, '一般', 1, '2024-06-12 09:23:33', 0, 1);
INSERT INTO `sys_user_view` VALUES (134, 102900011007969, 200004, '一般', 4, '2024-04-22 09:01:51', 1, 1);
INSERT INTO `sys_user_view` VALUES (135, 102900011033999, 200002, '好吃', 4, '2024-05-24 13:29:25', 1, 1);
INSERT INTO `sys_user_view` VALUES (136, 102900011008485, 200007, '一般', 5, '2024-05-12 04:47:22', 1, 1);
INSERT INTO `sys_user_view` VALUES (137, 102900005115793, 200010, '难吃', 5, '2024-06-08 20:43:48', 0, 1);
INSERT INTO `sys_user_view` VALUES (138, 102900011034326, 200005, '一般', 5, '2024-05-16 23:31:16', 0, 1);
INSERT INTO `sys_user_view` VALUES (139, 102900005115625, 200007, '难吃', 5, '2024-06-03 22:20:45', 1, 1);
INSERT INTO `sys_user_view` VALUES (140, 102900005116233, 200004, '一般', 0, '2024-05-05 07:26:36', 1, 1);
INSERT INTO `sys_user_view` VALUES (141, 102900011008577, 200005, '好吃', 2, '2024-05-21 22:37:27', 0, 1);
INSERT INTO `sys_user_view` VALUES (142, 102900011008522, 200008, '难吃', 1, '2024-04-20 22:03:15', 1, 1);
INSERT INTO `sys_user_view` VALUES (143, 102900005115625, 200004, '好吃', 5, '2024-04-26 10:57:44', 1, 1);
INSERT INTO `sys_user_view` VALUES (144, 102900005115977, 200009, '一般', 2, '2024-04-21 11:57:34', 1, 1);
INSERT INTO `sys_user_view` VALUES (145, 102900011034323, 200003, '一般', 2, '2024-05-08 21:10:43', 1, 1);
INSERT INTO `sys_user_view` VALUES (146, 102900005116233, 200003, '好吃', 4, '2024-05-26 21:30:32', 1, 1);
INSERT INTO `sys_user_view` VALUES (147, 102900011000328, 200005, '难吃', 5, '2024-04-27 02:29:31', 0, 1);
INSERT INTO `sys_user_view` VALUES (148, 102900011008485, 200002, '好吃', 0, '2024-04-22 07:08:15', 1, 1);
INSERT INTO `sys_user_view` VALUES (149, 102900005115984, 200005, '一般', 0, '2024-05-26 08:10:26', 0, 1);
INSERT INTO `sys_user_view` VALUES (150, 102900011008492, 200009, '一般', 0, '2024-05-04 00:30:58', 1, 1);
INSERT INTO `sys_user_view` VALUES (151, 102900011016909, 200003, '难吃', 1, '2024-05-05 09:07:03', 1, 1);
INSERT INTO `sys_user_view` VALUES (152, 102900011006955, 200002, '一般', 4, '2024-04-24 05:29:00', 0, 1);
INSERT INTO `sys_user_view` VALUES (153, 102900005115823, 200004, '难吃', 0, '2024-05-15 11:59:35', 0, 1);
INSERT INTO `sys_user_view` VALUES (154, 102900011006955, 200006, '难吃', 3, '2024-06-13 20:44:51', 0, 1);
INSERT INTO `sys_user_view` VALUES (155, 102900005115762, 200010, '一般', 3, '2024-05-21 21:10:28', 0, 1);
INSERT INTO `sys_user_view` VALUES (156, 102900005115861, 200006, '一般', 1, '2024-05-19 22:01:20', 0, 1);
INSERT INTO `sys_user_view` VALUES (157, 102900005115786, 200002, '一般', 1, '2024-05-15 19:34:23', 1, 1);
INSERT INTO `sys_user_view` VALUES (158, 102900011033920, 200007, '难吃', 0, '2024-04-28 03:39:04', 0, 1);
INSERT INTO `sys_user_view` VALUES (159, 102900011007464, 200004, '一般', 3, '2024-05-30 13:22:56', 1, 1);
INSERT INTO `sys_user_view` VALUES (160, 102900005115823, 200008, '一般', 3, '2024-04-20 14:29:52', 0, 1);
INSERT INTO `sys_user_view` VALUES (161, 102900011007969, 200001, '好吃', 1, '2024-04-21 00:26:39', 0, 1);
INSERT INTO `sys_user_view` VALUES (162, 102900005115793, 200008, '好吃', 3, '2024-06-07 00:43:30', 0, 1);
INSERT INTO `sys_user_view` VALUES (163, 102900011008485, 200006, '一般', 4, '2024-05-02 19:34:17', 0, 1);
INSERT INTO `sys_user_view` VALUES (164, 102900011008522, 200006, '一般', 4, '2024-04-29 20:47:28', 1, 1);
INSERT INTO `sys_user_view` VALUES (165, 102900011009277, 200007, '难吃', 0, '2024-06-01 01:26:56', 1, 1);
INSERT INTO `sys_user_view` VALUES (166, 102900005115823, 200009, '难吃', 4, '2024-04-25 11:43:23', 1, 1);
INSERT INTO `sys_user_view` VALUES (167, 102900011007464, 200003, '难吃', 0, '2024-04-27 01:54:11', 1, 1);
INSERT INTO `sys_user_view` VALUES (168, 102900005116806, 200007, '难吃', 5, '2024-06-10 09:57:09', 0, 1);
INSERT INTO `sys_user_view` VALUES (169, 102900005116806, 200002, '好吃', 3, '2024-05-19 23:24:49', 0, 1);
INSERT INTO `sys_user_view` VALUES (170, 102900011034325, 200007, '难吃', 5, '2024-05-12 16:38:59', 0, 1);
INSERT INTO `sys_user_view` VALUES (171, 102900011034324, 200006, '好吃', 3, '2024-06-15 17:19:10', 1, 1);
INSERT INTO `sys_user_view` VALUES (172, 102900005116219, 200010, '一般', 0, '2024-05-28 16:55:41', 1, 1);
INSERT INTO `sys_user_view` VALUES (173, 102900011008577, 200007, '难吃', 0, '2024-05-24 22:46:11', 0, 1);
INSERT INTO `sys_user_view` VALUES (174, 102900005115762, 200008, '一般', 0, '2024-06-01 05:13:21', 0, 1);
INSERT INTO `sys_user_view` VALUES (175, 102900011022764, 200003, '一般', 5, '2024-05-29 12:53:51', 0, 1);
INSERT INTO `sys_user_view` VALUES (176, 102900011007471, 200003, '难吃', 4, '2024-04-28 06:57:01', 1, 1);
INSERT INTO `sys_user_view` VALUES (177, 102900005115946, 200003, '好吃', 0, '2024-06-10 15:54:04', 0, 1);
INSERT INTO `sys_user_view` VALUES (178, 102900005115861, 200001, '一般', 1, '2024-05-24 11:28:09', 0, 1);
INSERT INTO `sys_user_view` VALUES (179, 102900011008522, 200007, '一般', 4, '2024-04-28 02:16:14', 1, 1);
INSERT INTO `sys_user_view` VALUES (180, 102900011009277, 200010, '一般', 1, '2024-06-12 01:20:30', 1, 1);
INSERT INTO `sys_user_view` VALUES (181, 102900011011058, 200006, '难吃', 3, '2024-06-12 19:56:52', 0, 1);
INSERT INTO `sys_user_view` VALUES (182, 102900011018132, 200003, '难吃', 4, '2024-04-21 03:35:37', 0, 1);
INSERT INTO `sys_user_view` VALUES (183, 102900011034224, 200001, '一般', 4, '2024-05-25 20:11:53', 1, 1);
INSERT INTO `sys_user_view` VALUES (184, 102900011006955, 200010, '好吃', 4, '2024-06-06 16:41:52', 1, 1);
INSERT INTO `sys_user_view` VALUES (185, 102900011008577, 200003, '难吃', 0, '2024-06-10 19:46:14', 1, 1);
INSERT INTO `sys_user_view` VALUES (186, 102900011007464, 200007, '一般', 3, '2024-05-14 21:56:50', 1, 1);
INSERT INTO `sys_user_view` VALUES (187, 102900011007471, 200007, '好吃', 2, '2024-06-14 04:12:29', 1, 1);
INSERT INTO `sys_user_view` VALUES (188, 102900005115625, 200008, '一般', 1, '2024-06-12 22:56:13', 0, 1);
INSERT INTO `sys_user_view` VALUES (189, 102900005116905, 200008, '好吃', 2, '2024-04-30 13:38:51', 1, 1);
INSERT INTO `sys_user_view` VALUES (190, 102900005125808, 200005, '好吃', 0, '2024-04-20 13:42:38', 0, 1);
INSERT INTO `sys_user_view` VALUES (191, 102900005116905, 200003, '好吃', 0, '2024-05-03 14:51:47', 1, 1);
INSERT INTO `sys_user_view` VALUES (192, 102900005115748, 200010, '一般', 1, '2024-04-21 11:29:55', 0, 1);
INSERT INTO `sys_user_view` VALUES (193, 102900011007464, 200005, '好吃', 4, '2024-06-08 08:20:42', 1, 1);
INSERT INTO `sys_user_view` VALUES (194, 102900011034325, 200003, '好吃', 3, '2024-06-09 12:00:30', 0, 1);
INSERT INTO `sys_user_view` VALUES (195, 102900005115946, 200008, '一般', 5, '2024-04-24 20:45:07', 0, 1);
INSERT INTO `sys_user_view` VALUES (196, 102900005116219, 200010, '一般', 1, '2024-04-17 13:50:28', 0, 1);
INSERT INTO `sys_user_view` VALUES (197, 102900005115823, 200010, '好吃', 4, '2024-05-13 17:43:00', 1, 1);
INSERT INTO `sys_user_view` VALUES (198, 102900005115748, 200005, '好吃', 0, '2024-06-09 15:39:03', 0, 1);
INSERT INTO `sys_user_view` VALUES (199, 102900011009277, 200001, '好吃', 1, '2024-04-20 11:09:57', 1, 1);
INSERT INTO `sys_user_view` VALUES (200, 102900005115946, 200005, '好吃', 5, '2024-05-13 09:47:38', 1, 1);
INSERT INTO `sys_user_view` VALUES (201, 102900005128748, 200003, '难吃', 3, '2024-05-11 06:09:38', 1, 1);
INSERT INTO `sys_user_view` VALUES (202, 102900011010563, 200001, '难吃', 0, '2024-05-02 07:16:43', 1, 1);
INSERT INTO `sys_user_view` VALUES (203, 102900005115779, 200002, '难吃', 4, '2024-05-04 18:44:21', 1, 1);
INSERT INTO `sys_user_view` VALUES (204, 102900011008577, 200010, '一般', 3, '2024-05-17 12:18:41', 1, 1);
INSERT INTO `sys_user_view` VALUES (205, 102900011008164, 200005, '好吃', 4, '2024-04-26 09:36:37', 1, 1);
INSERT INTO `sys_user_view` VALUES (206, 102900011008485, 200008, '好吃', 1, '2024-05-20 20:09:43', 1, 1);
INSERT INTO `sys_user_view` VALUES (207, 102900005116714, 200002, '好吃', 2, '2024-05-29 23:13:35', 1, 1);
INSERT INTO `sys_user_view` VALUES (208, 102900011007969, 200009, '难吃', 0, '2024-04-21 08:28:05', 0, 1);
INSERT INTO `sys_user_view` VALUES (209, 102900005116226, 200001, '好吃', 1, '2024-05-11 02:30:52', 0, 1);
INSERT INTO `sys_user_view` VALUES (210, 102900005115984, 200006, '好吃', 4, '2024-06-15 14:59:33', 0, 1);
INSERT INTO `sys_user_view` VALUES (211, 102900005115984, 200001, '难吃', 3, '2024-06-01 21:21:10', 1, 1);
INSERT INTO `sys_user_view` VALUES (212, 102900011009277, 200007, '好吃', 1, '2024-05-15 20:30:20', 0, 1);
INSERT INTO `sys_user_view` VALUES (213, 102900005128748, 200010, '好吃', 5, '2024-05-25 10:40:23', 1, 1);
INSERT INTO `sys_user_view` VALUES (214, 102900011034326, 200006, '好吃', 5, '2024-05-12 03:28:57', 0, 1);
INSERT INTO `sys_user_view` VALUES (215, 102900011033999, 200002, '一般', 2, '2024-05-28 00:25:39', 1, 1);
INSERT INTO `sys_user_view` VALUES (216, 102900011033999, 200007, '难吃', 0, '2024-05-25 12:18:35', 1, 1);
INSERT INTO `sys_user_view` VALUES (217, 102900011016909, 200009, '好吃', 2, '2024-05-07 12:33:22', 0, 1);
INSERT INTO `sys_user_view` VALUES (218, 102900011034325, 200005, '难吃', 5, '2024-05-30 23:01:29', 1, 1);
INSERT INTO `sys_user_view` VALUES (219, 102900005115960, 200008, '难吃', 0, '2024-04-19 12:50:04', 1, 1);
INSERT INTO `sys_user_view` VALUES (220, 102900005125808, 200009, '好吃', 2, '2024-05-05 11:13:15', 0, 1);
INSERT INTO `sys_user_view` VALUES (221, 102900005116714, 200002, '难吃', 4, '2024-05-09 00:14:00', 1, 1);
INSERT INTO `sys_user_view` VALUES (222, 102900011022764, 200009, '好吃', 0, '2024-04-30 15:04:56', 0, 1);
INSERT INTO `sys_user_view` VALUES (223, 10, 200002, '难吃', 1, '2024-05-27 09:13:11', 0, 1);
INSERT INTO `sys_user_view` VALUES (224, 102900005115960, 200001, '好吃', 4, '2024-04-29 23:21:26', 1, 1);
INSERT INTO `sys_user_view` VALUES (225, 102900005115748, 200010, '难吃', 2, '2024-06-16 02:47:41', 0, 1);
INSERT INTO `sys_user_view` VALUES (226, 102900005115823, 200005, '一般', 1, '2024-06-09 21:17:04', 0, 1);
INSERT INTO `sys_user_view` VALUES (227, 102900005115946, 200001, '难吃', 3, '2024-05-22 10:58:07', 1, 1);
INSERT INTO `sys_user_view` VALUES (228, 102900011022764, 200009, '一般', 4, '2024-05-15 23:17:39', 0, 1);
INSERT INTO `sys_user_view` VALUES (229, 102900011000175, 200009, '难吃', 1, '2024-05-13 16:37:52', 1, 1);
INSERT INTO `sys_user_view` VALUES (230, 102900005115984, 200008, '好吃', 0, '2024-06-05 01:32:05', 1, 1);
INSERT INTO `sys_user_view` VALUES (231, 102900005115977, 200002, '一般', 2, '2024-06-07 06:39:38', 1, 1);
INSERT INTO `sys_user_view` VALUES (232, 102900011006689, 200002, '一般', 1, '2024-05-16 08:33:20', 0, 1);
INSERT INTO `sys_user_view` VALUES (233, 102900011006955, 200005, '好吃', 1, '2024-05-19 22:50:52', 0, 1);
INSERT INTO `sys_user_view` VALUES (234, 102900011034325, 200005, '一般', 4, '2024-05-16 12:04:55', 1, 1);
INSERT INTO `sys_user_view` VALUES (235, 102900011034224, 200010, '难吃', 3, '2024-04-25 09:19:23', 1, 1);
INSERT INTO `sys_user_view` VALUES (236, 102900005115946, 200008, '一般', 0, '2024-06-05 13:12:54', 1, 1);
INSERT INTO `sys_user_view` VALUES (237, 102900005115960, 200006, '一般', 2, '2024-05-08 18:00:45', 1, 1);
INSERT INTO `sys_user_view` VALUES (238, 102900011034325, 200004, '好吃', 1, '2024-05-13 05:05:14', 0, 1);
INSERT INTO `sys_user_view` VALUES (239, 102900011022764, 200003, '一般', 1, '2024-06-14 08:03:34', 0, 1);
INSERT INTO `sys_user_view` VALUES (240, 102900011006955, 200002, '一般', 5, '2024-05-16 04:16:51', 0, 1);
INSERT INTO `sys_user_view` VALUES (241, 102900011008164, 200004, '一般', 2, '2024-04-24 22:10:02', 0, 1);
INSERT INTO `sys_user_view` VALUES (242, 102900005116219, 200001, '一般', 4, '2024-04-20 00:38:55', 1, 1);
INSERT INTO `sys_user_view` VALUES (243, 102900011006689, 200008, '一般', 0, '2024-06-16 18:53:52', 0, 1);
INSERT INTO `sys_user_view` VALUES (244, 102900011022764, 200006, '好吃', 4, '2024-05-18 11:39:23', 0, 1);
INSERT INTO `sys_user_view` VALUES (245, 102900011006955, 200008, '好吃', 0, '2024-06-10 05:28:22', 1, 1);
INSERT INTO `sys_user_view` VALUES (246, 102900011000335, 200006, '好吃', 5, '2024-05-06 00:06:53', 0, 1);
INSERT INTO `sys_user_view` VALUES (247, 102900011016909, 200005, '难吃', 5, '2024-06-09 18:35:30', 0, 1);
INSERT INTO `sys_user_view` VALUES (248, 102900011008164, 200004, '一般', 4, '2024-05-08 07:31:07', 1, 1);
INSERT INTO `sys_user_view` VALUES (249, 102900011007464, 200007, '好吃', 0, '2024-05-18 13:40:52', 0, 1);
INSERT INTO `sys_user_view` VALUES (250, 102900005115946, 200008, '好吃', 2, '2024-05-26 14:47:22', 1, 1);
INSERT INTO `sys_user_view` VALUES (251, 102900005115748, 200008, '一般', 4, '2024-04-27 08:10:31', 0, 1);
INSERT INTO `sys_user_view` VALUES (252, 102900011018132, 200003, '难吃', 4, '2024-06-09 10:40:12', 0, 1);
INSERT INTO `sys_user_view` VALUES (253, 102900005116714, 200007, '好吃', 1, '2024-06-17 19:38:37', 1, 1);
INSERT INTO `sys_user_view` VALUES (254, 102900005125808, 200009, '难吃', 4, '2024-06-04 09:46:16', 0, 1);
INSERT INTO `sys_user_view` VALUES (255, 102900005115748, 200010, '难吃', 0, '2024-05-28 23:02:37', 0, 1);
INSERT INTO `sys_user_view` VALUES (256, 102900011033920, 200006, '一般', 3, '2024-05-16 14:55:30', 0, 1);
INSERT INTO `sys_user_view` VALUES (257, 102900011011058, 200003, '难吃', 0, '2024-05-29 13:37:42', 1, 1);
INSERT INTO `sys_user_view` VALUES (258, 102900011008492, 200001, '好吃', 3, '2024-05-07 16:33:57', 1, 1);
INSERT INTO `sys_user_view` VALUES (259, 102900005118831, 200002, '难吃', 0, '2024-05-03 09:56:19', 0, 1);
INSERT INTO `sys_user_view` VALUES (260, 102900011034326, 200001, '好吃', 4, '2024-05-18 11:06:59', 1, 1);
INSERT INTO `sys_user_view` VALUES (261, 102900005115946, 200006, '一般', 4, '2024-05-07 08:28:36', 1, 1);
INSERT INTO `sys_user_view` VALUES (262, 102900011011058, 200005, '好吃', 3, '2024-05-29 21:51:06', 0, 1);
INSERT INTO `sys_user_view` VALUES (263, 102900011016909, 200003, '难吃', 1, '2024-04-23 07:01:52', 1, 1);
INSERT INTO `sys_user_view` VALUES (264, 102900005115861, 200003, '一般', 5, '2024-04-28 23:21:00', 0, 1);
INSERT INTO `sys_user_view` VALUES (265, 102900005115977, 200008, '一般', 1, '2024-06-02 10:05:35', 0, 1);
INSERT INTO `sys_user_view` VALUES (266, 102900011008577, 200010, '好吃', 2, '2024-05-23 18:42:23', 1, 1);
INSERT INTO `sys_user_view` VALUES (267, 102900011008164, 200002, '难吃', 2, '2024-05-31 19:07:08', 0, 1);
INSERT INTO `sys_user_view` VALUES (268, 102900011034224, 200004, '一般', 5, '2024-06-16 12:00:28', 0, 1);
INSERT INTO `sys_user_view` VALUES (269, 102900011034224, 200003, '难吃', 5, '2024-06-07 14:10:42', 0, 1);
INSERT INTO `sys_user_view` VALUES (270, 102900005118817, 200005, '好吃', 2, '2024-04-28 13:14:16', 0, 1);
INSERT INTO `sys_user_view` VALUES (271, 102900011033999, 200010, '一般', 2, '2024-05-08 01:53:39', 1, 1);
INSERT INTO `sys_user_view` VALUES (272, 10, 200002, '难吃', 3, '2024-04-28 07:51:27', 1, 1);
INSERT INTO `sys_user_view` VALUES (273, 102900011006955, 200009, '好吃', 0, '2024-05-03 19:39:42', 0, 1);
INSERT INTO `sys_user_view` VALUES (274, 102900005115984, 200006, '一般', 1, '2024-05-26 19:27:06', 0, 1);
INSERT INTO `sys_user_view` VALUES (275, 102900005115823, 200001, '好吃', 1, '2024-05-10 05:19:58', 1, 1);
INSERT INTO `sys_user_view` VALUES (276, 102900011000335, 200003, '难吃', 2, '2024-05-03 21:38:11', 1, 1);
INSERT INTO `sys_user_view` VALUES (277, 102900005115625, 200003, '难吃', 4, '2024-06-13 11:46:47', 1, 1);
INSERT INTO `sys_user_view` VALUES (278, 10, 200006, '好吃', 3, '2024-05-04 16:15:21', 1, 1);
INSERT INTO `sys_user_view` VALUES (279, 102900011034325, 200001, '一般', 3, '2024-05-20 06:43:38', 1, 1);
INSERT INTO `sys_user_view` VALUES (280, 102900011009277, 200003, '难吃', 4, '2024-04-27 15:38:09', 0, 1);
INSERT INTO `sys_user_view` VALUES (281, 102900005115960, 200006, '好吃', 5, '2024-05-21 06:12:21', 0, 1);
INSERT INTO `sys_user_view` VALUES (282, 102900005115762, 200001, '难吃', 2, '2024-04-23 16:46:54', 1, 1);
INSERT INTO `sys_user_view` VALUES (283, 102900011007471, 200004, '一般', 0, '2024-04-28 06:23:27', 1, 1);
INSERT INTO `sys_user_view` VALUES (284, 102900005115625, 200005, '一般', 1, '2024-06-14 05:31:54', 0, 1);
INSERT INTO `sys_user_view` VALUES (285, 102900011007464, 200009, '一般', 5, '2024-06-07 16:09:49', 0, 1);
INSERT INTO `sys_user_view` VALUES (286, 102900011008492, 200004, '一般', 3, '2024-06-03 15:24:55', 1, 1);
INSERT INTO `sys_user_view` VALUES (287, 102900005115984, 200003, '难吃', 0, '2024-06-02 02:00:59', 0, 1);
INSERT INTO `sys_user_view` VALUES (288, 102900005115762, 200002, '好吃', 1, '2024-06-08 11:22:53', 1, 1);
INSERT INTO `sys_user_view` VALUES (289, 102900011016909, 200002, '难吃', 2, '2024-05-06 05:24:19', 1, 1);
INSERT INTO `sys_user_view` VALUES (290, 102900005115823, 200003, '难吃', 0, '2024-04-24 02:05:07', 1, 1);
INSERT INTO `sys_user_view` VALUES (291, 102900005115748, 200006, '好吃', 0, '2024-05-25 21:09:09', 0, 1);
INSERT INTO `sys_user_view` VALUES (292, 102900011009277, 200004, '难吃', 1, '2024-05-09 22:46:00', 1, 1);
INSERT INTO `sys_user_view` VALUES (293, 102900011011058, 200004, '难吃', 4, '2024-05-20 05:37:00', 0, 1);
INSERT INTO `sys_user_view` VALUES (294, 102900005118817, 200007, '好吃', 3, '2024-04-28 09:58:57', 0, 1);
INSERT INTO `sys_user_view` VALUES (295, 102900005116806, 200003, '难吃', 1, '2024-05-26 17:33:51', 0, 1);
INSERT INTO `sys_user_view` VALUES (296, 102900011022764, 200006, '一般', 5, '2024-06-14 17:14:20', 1, 1);
INSERT INTO `sys_user_view` VALUES (297, 102900005115823, 200009, '难吃', 0, '2024-05-07 17:00:01', 1, 1);
INSERT INTO `sys_user_view` VALUES (298, 102900005125808, 200006, '一般', 1, '2024-06-05 23:44:58', 1, 1);
INSERT INTO `sys_user_view` VALUES (299, 102900011034323, 200005, '难吃', 0, '2024-06-15 21:03:06', 1, 1);
INSERT INTO `sys_user_view` VALUES (300, 102900011033999, 200005, '好吃', 3, '2024-06-14 06:22:24', 1, 1);
INSERT INTO `sys_user_view` VALUES (301, 102900005116219, 200002, '难吃', 4, '2024-05-20 04:19:59', 0, 1);
INSERT INTO `sys_user_view` VALUES (302, 102900005115748, 200007, '难吃', 3, '2024-05-18 02:30:27', 1, 1);
INSERT INTO `sys_user_view` VALUES (303, 102900005115762, 200009, '难吃', 1, '2024-05-11 13:01:33', 0, 1);
INSERT INTO `sys_user_view` VALUES (304, 102900005125808, 200004, '难吃', 1, '2024-05-13 08:46:46', 0, 1);
INSERT INTO `sys_user_view` VALUES (305, 102900005116714, 200008, '难吃', 3, '2024-06-07 22:17:13', 1, 1);
INSERT INTO `sys_user_view` VALUES (306, 102900005115625, 200007, '一般', 2, '2024-06-03 07:08:14', 1, 1);
INSERT INTO `sys_user_view` VALUES (307, 102900011008485, 200009, '难吃', 1, '2024-04-29 05:16:45', 0, 1);
INSERT INTO `sys_user_view` VALUES (308, 102900005118831, 200007, '难吃', 2, '2024-05-13 16:18:57', 0, 1);
INSERT INTO `sys_user_view` VALUES (309, 102900011034324, 200003, '难吃', 3, '2024-06-13 06:53:48', 1, 1);
INSERT INTO `sys_user_view` VALUES (310, 102900011033920, 200007, '难吃', 3, '2024-05-05 06:02:22', 1, 1);
INSERT INTO `sys_user_view` VALUES (311, 102900011006955, 200010, '一般', 5, '2024-05-11 05:37:28', 0, 1);
INSERT INTO `sys_user_view` VALUES (312, 102900011033920, 200002, '难吃', 5, '2024-05-31 03:45:08', 1, 1);
INSERT INTO `sys_user_view` VALUES (313, 102900005115960, 200004, '好吃', 0, '2024-06-04 21:54:53', 0, 1);
INSERT INTO `sys_user_view` VALUES (314, 102900011008492, 200010, '难吃', 1, '2024-05-01 12:12:17', 0, 1);
INSERT INTO `sys_user_view` VALUES (315, 102900011000175, 200004, '一般', 1, '2024-05-25 14:53:47', 1, 1);
INSERT INTO `sys_user_view` VALUES (316, 102900005115786, 200010, '好吃', 1, '2024-05-24 22:27:40', 1, 1);
INSERT INTO `sys_user_view` VALUES (317, 102900011000335, 200002, '一般', 0, '2024-05-12 04:22:51', 1, 1);
INSERT INTO `sys_user_view` VALUES (318, 102900005115823, 200002, '好吃', 1, '2024-04-26 04:48:07', 1, 1);
INSERT INTO `sys_user_view` VALUES (319, 102900005116042, 200009, '难吃', 0, '2024-05-28 11:00:12', 0, 1);
INSERT INTO `sys_user_view` VALUES (320, 102900011008492, 200010, '难吃', 5, '2024-06-01 23:06:20', 1, 1);
INSERT INTO `sys_user_view` VALUES (321, 102900011008522, 200008, '难吃', 1, '2024-06-15 13:32:17', 1, 1);
INSERT INTO `sys_user_view` VALUES (322, 102900005115960, 200010, '一般', 0, '2024-04-30 04:41:26', 1, 1);
INSERT INTO `sys_user_view` VALUES (323, 102900011034324, 200002, '好吃', 3, '2024-04-30 17:17:06', 1, 1);
INSERT INTO `sys_user_view` VALUES (324, 102900011009277, 200007, '一般', 3, '2024-05-12 07:18:36', 1, 1);
INSERT INTO `sys_user_view` VALUES (325, 102900011034325, 200001, '难吃', 5, '2024-05-31 03:07:19', 0, 1);
INSERT INTO `sys_user_view` VALUES (326, 102900011006955, 200006, '难吃', 1, '2024-05-25 17:35:33', 1, 1);
INSERT INTO `sys_user_view` VALUES (327, 102900005118817, 200005, '难吃', 0, '2024-06-16 09:17:33', 0, 1);
INSERT INTO `sys_user_view` VALUES (328, 102900011008164, 200001, '好吃', 0, '2024-05-09 12:31:47', 1, 1);
INSERT INTO `sys_user_view` VALUES (329, 102900005115977, 200006, '好吃', 3, '2024-04-23 01:47:45', 0, 1);
INSERT INTO `sys_user_view` VALUES (330, 102900005116233, 200007, '一般', 2, '2024-05-11 12:19:40', 0, 1);
INSERT INTO `sys_user_view` VALUES (331, 102900005115984, 200001, '好吃', 3, '2024-06-10 11:46:41', 1, 1);
INSERT INTO `sys_user_view` VALUES (332, 102900011034323, 200008, '一般', 4, '2024-05-08 09:01:06', 0, 1);
INSERT INTO `sys_user_view` VALUES (333, 102900011010563, 200004, '难吃', 2, '2024-04-19 22:41:42', 0, 1);
INSERT INTO `sys_user_view` VALUES (334, 102900011008164, 200004, '好吃', 4, '2024-06-17 16:51:04', 0, 1);
INSERT INTO `sys_user_view` VALUES (335, 102900005115762, 200007, '难吃', 1, '2024-04-25 19:21:37', 1, 1);
INSERT INTO `sys_user_view` VALUES (336, 102900005115946, 200005, '好吃', 0, '2024-06-10 22:25:17', 0, 1);
INSERT INTO `sys_user_view` VALUES (337, 102900011034324, 200010, '一般', 2, '2024-04-25 06:42:07', 0, 1);
INSERT INTO `sys_user_view` VALUES (338, 102900005116219, 200005, '难吃', 3, '2024-04-21 06:34:22', 1, 1);
INSERT INTO `sys_user_view` VALUES (339, 102900005115793, 200005, '一般', 0, '2024-05-29 17:00:11', 0, 1);
INSERT INTO `sys_user_view` VALUES (340, 102900011000328, 200002, '一般', 1, '2024-06-05 18:56:05', 0, 1);
INSERT INTO `sys_user_view` VALUES (341, 102900011018132, 200003, '好吃', 0, '2024-06-02 16:09:25', 1, 1);
INSERT INTO `sys_user_view` VALUES (342, 102900005115786, 200005, '好吃', 3, '2024-05-11 17:45:59', 0, 1);
INSERT INTO `sys_user_view` VALUES (343, 102900011011058, 200010, '难吃', 3, '2024-05-09 18:45:22', 0, 1);
INSERT INTO `sys_user_view` VALUES (344, 102900011034325, 200007, '难吃', 2, '2024-05-09 01:50:41', 0, 1);
INSERT INTO `sys_user_view` VALUES (345, 102900011008485, 200003, '一般', 5, '2024-04-26 07:47:58', 1, 1);
INSERT INTO `sys_user_view` VALUES (346, 102900005115984, 200002, '一般', 0, '2024-06-07 02:25:45', 1, 1);
INSERT INTO `sys_user_view` VALUES (347, 102900011008164, 200007, '难吃', 0, '2024-05-25 16:16:02', 0, 1);
INSERT INTO `sys_user_view` VALUES (348, 102900005128748, 200007, '好吃', 1, '2024-05-22 14:36:09', 1, 1);
INSERT INTO `sys_user_view` VALUES (349, 102900011008492, 200001, '难吃', 1, '2024-05-14 18:39:46', 0, 1);
INSERT INTO `sys_user_view` VALUES (350, 102900011022764, 200006, '难吃', 4, '2024-06-12 23:26:21', 0, 1);
INSERT INTO `sys_user_view` VALUES (351, 102900011008164, 200006, '一般', 3, '2024-06-08 17:15:24', 1, 1);
INSERT INTO `sys_user_view` VALUES (352, 102900005115762, 200001, '难吃', 2, '2024-05-10 09:09:15', 1, 1);
INSERT INTO `sys_user_view` VALUES (353, 10, 200008, '好吃', 4, '2024-04-29 13:33:40', 1, 1);
INSERT INTO `sys_user_view` VALUES (354, 102900011006689, 200005, '好吃', 1, '2024-04-21 17:19:19', 1, 1);
INSERT INTO `sys_user_view` VALUES (355, 102900011034224, 200004, '一般', 4, '2024-05-05 21:59:15', 1, 1);
INSERT INTO `sys_user_view` VALUES (356, 102900011034325, 200006, '好吃', 5, '2024-06-06 20:29:29', 1, 1);
INSERT INTO `sys_user_view` VALUES (357, 102900005116042, 200006, '难吃', 3, '2024-06-17 22:18:54', 0, 1);
INSERT INTO `sys_user_view` VALUES (358, 102900005116219, 200009, '好吃', 1, '2024-06-06 04:47:52', 1, 1);
INSERT INTO `sys_user_view` VALUES (359, 102900005115977, 200006, '难吃', 0, '2024-04-29 18:31:03', 1, 1);
INSERT INTO `sys_user_view` VALUES (360, 102900011007969, 200009, '难吃', 5, '2024-05-13 17:34:53', 1, 1);
INSERT INTO `sys_user_view` VALUES (361, 102900005115748, 200003, '好吃', 0, '2024-05-27 21:08:46', 1, 1);
INSERT INTO `sys_user_view` VALUES (362, 102900005115977, 200004, '一般', 5, '2024-06-16 20:16:07', 1, 1);
INSERT INTO `sys_user_view` VALUES (363, 102900011007471, 200003, '难吃', 2, '2024-05-05 08:59:39', 0, 1);
INSERT INTO `sys_user_view` VALUES (364, 102900005116806, 200008, '难吃', 2, '2024-06-02 17:32:14', 0, 1);
INSERT INTO `sys_user_view` VALUES (365, 102900005115946, 200010, '一般', 4, '2024-06-12 00:05:30', 1, 1);
INSERT INTO `sys_user_view` VALUES (366, 102900005116042, 200010, '好吃', 1, '2024-05-08 23:06:21', 1, 1);
INSERT INTO `sys_user_view` VALUES (367, 102900005116233, 200008, '好吃', 1, '2024-06-04 12:07:49', 1, 1);
INSERT INTO `sys_user_view` VALUES (368, 102900005115762, 200005, '一般', 0, '2024-06-17 16:10:35', 0, 1);
INSERT INTO `sys_user_view` VALUES (369, 102900011008492, 200006, '好吃', 3, '2024-05-11 19:02:23', 1, 1);
INSERT INTO `sys_user_view` VALUES (370, 102900011000335, 200004, '好吃', 2, '2024-04-25 21:05:08', 0, 1);
INSERT INTO `sys_user_view` VALUES (371, 102900005116233, 200007, '好吃', 3, '2024-06-11 01:15:59', 0, 1);
INSERT INTO `sys_user_view` VALUES (372, 102900005125808, 200002, '难吃', 1, '2024-05-10 15:32:08', 1, 1);
INSERT INTO `sys_user_view` VALUES (373, 102900011033920, 200004, '好吃', 1, '2024-06-02 02:54:22', 0, 1);
INSERT INTO `sys_user_view` VALUES (374, 102900005115823, 200007, '好吃', 2, '2024-05-20 01:50:04', 0, 1);
INSERT INTO `sys_user_view` VALUES (375, 102900011006689, 200002, '一般', 4, '2024-05-27 14:42:38', 0, 1);
INSERT INTO `sys_user_view` VALUES (376, 102900011000175, 200004, '好吃', 0, '2024-05-06 09:20:14', 1, 1);
INSERT INTO `sys_user_view` VALUES (377, 102900005116219, 200003, '好吃', 4, '2024-06-09 10:20:36', 1, 1);
INSERT INTO `sys_user_view` VALUES (378, 102900005116042, 200010, '一般', 1, '2024-06-06 21:31:51', 0, 1);
INSERT INTO `sys_user_view` VALUES (379, 102900011034224, 200010, '难吃', 0, '2024-05-27 22:40:00', 0, 1);
INSERT INTO `sys_user_view` VALUES (380, 102900011034326, 200002, '难吃', 5, '2024-05-24 21:45:06', 1, 1);
INSERT INTO `sys_user_view` VALUES (381, 102900005115946, 200007, '好吃', 0, '2024-04-18 15:13:23', 1, 1);
INSERT INTO `sys_user_view` VALUES (382, 10, 200001, '一般', 4, '2024-04-27 03:14:28', 1, 1);
INSERT INTO `sys_user_view` VALUES (383, 102900011006689, 200004, '难吃', 2, '2024-05-07 02:11:16', 0, 1);
INSERT INTO `sys_user_view` VALUES (384, 102900005116714, 200005, '难吃', 2, '2024-05-29 12:50:36', 0, 1);
INSERT INTO `sys_user_view` VALUES (385, 102900011034326, 200005, '好吃', 4, '2024-06-13 09:31:35', 0, 1);
INSERT INTO `sys_user_view` VALUES (386, 102900011008492, 200003, '难吃', 2, '2024-06-09 19:40:54', 0, 1);
INSERT INTO `sys_user_view` VALUES (387, 102900011007969, 200008, '难吃', 4, '2024-04-19 06:06:31', 1, 1);
INSERT INTO `sys_user_view` VALUES (388, 102900011006689, 200001, '一般', 2, '2024-04-28 20:53:20', 1, 1);
INSERT INTO `sys_user_view` VALUES (389, 102900011008522, 200004, '一般', 0, '2024-06-08 03:23:02', 0, 1);
INSERT INTO `sys_user_view` VALUES (390, 102900011034325, 200004, '难吃', 3, '2024-06-07 12:45:36', 0, 1);
INSERT INTO `sys_user_view` VALUES (391, 102900005128748, 200005, '难吃', 5, '2024-05-28 14:33:31', 1, 1);
INSERT INTO `sys_user_view` VALUES (392, 102900011011058, 200001, '难吃', 3, '2024-05-14 13:51:52', 1, 1);
INSERT INTO `sys_user_view` VALUES (393, 102900011000175, 200003, '难吃', 3, '2024-05-10 05:13:02', 0, 1);
INSERT INTO `sys_user_view` VALUES (394, 102900005116042, 200003, '一般', 5, '2024-06-11 20:22:07', 1, 1);
INSERT INTO `sys_user_view` VALUES (395, 102900011008577, 200010, '难吃', 2, '2024-04-23 12:28:00', 0, 1);
INSERT INTO `sys_user_view` VALUES (396, 102900011006689, 200006, '一般', 0, '2024-04-24 09:54:41', 0, 1);
INSERT INTO `sys_user_view` VALUES (397, 102900011006955, 200005, '难吃', 0, '2024-05-02 17:36:26', 0, 1);
INSERT INTO `sys_user_view` VALUES (398, 102900005116042, 200002, '一般', 1, '2024-06-01 10:14:53', 0, 1);
INSERT INTO `sys_user_view` VALUES (399, 102900005115748, 200009, '好吃', 5, '2024-06-06 08:39:04', 0, 1);
INSERT INTO `sys_user_view` VALUES (400, 102900011007969, 200008, '一般', 5, '2024-06-01 19:27:58', 0, 1);
INSERT INTO `sys_user_view` VALUES (401, 102900011009277, 200006, '一般', 2, '2024-06-14 13:28:06', 0, 1);
INSERT INTO `sys_user_view` VALUES (402, 102900005115748, 200010, '一般', 3, '2024-05-13 11:10:05', 1, 1);
INSERT INTO `sys_user_view` VALUES (403, 102900005118831, 200001, '一般', 5, '2024-06-14 07:54:13', 0, 1);
INSERT INTO `sys_user_view` VALUES (404, 102900005116714, 200003, '难吃', 1, '2024-05-09 03:21:39', 0, 1);
INSERT INTO `sys_user_view` VALUES (405, 102900011018132, 200010, '一般', 2, '2024-05-18 23:01:54', 0, 1);
INSERT INTO `sys_user_view` VALUES (406, 102900005116714, 200007, '一般', 3, '2024-04-25 02:41:18', 1, 1);
INSERT INTO `sys_user_view` VALUES (407, 102900005116226, 200005, '好吃', 0, '2024-04-19 06:04:09', 0, 1);
INSERT INTO `sys_user_view` VALUES (408, 102900005116042, 200004, '难吃', 1, '2024-04-18 18:01:40', 0, 1);
INSERT INTO `sys_user_view` VALUES (409, 102900011008485, 200008, '好吃', 1, '2024-05-11 12:45:18', 1, 1);
INSERT INTO `sys_user_view` VALUES (410, 102900005125808, 200008, '好吃', 4, '2024-05-27 08:41:09', 1, 1);
INSERT INTO `sys_user_view` VALUES (411, 102900011034326, 200003, '一般', 4, '2024-04-28 13:14:13', 1, 1);
INSERT INTO `sys_user_view` VALUES (412, 102900005116233, 200008, '一般', 0, '2024-04-18 00:51:38', 1, 1);
INSERT INTO `sys_user_view` VALUES (413, 102900011011058, 200001, '难吃', 3, '2024-05-23 15:01:40', 0, 1);
INSERT INTO `sys_user_view` VALUES (414, 102900005115977, 200006, '一般', 5, '2024-06-13 19:12:31', 1, 1);
INSERT INTO `sys_user_view` VALUES (415, 102900005115960, 200008, '好吃', 2, '2024-05-11 08:58:25', 1, 1);
INSERT INTO `sys_user_view` VALUES (416, 102900011034224, 200002, '一般', 5, '2024-04-21 07:48:31', 0, 1);
INSERT INTO `sys_user_view` VALUES (417, 102900005115779, 200007, '一般', 3, '2024-05-17 08:27:07', 0, 1);
INSERT INTO `sys_user_view` VALUES (418, 102900005115960, 200008, '难吃', 0, '2024-05-17 16:02:50', 0, 1);
INSERT INTO `sys_user_view` VALUES (419, 102900011008577, 200006, '一般', 3, '2024-04-29 15:00:22', 1, 1);
INSERT INTO `sys_user_view` VALUES (420, 102900005115946, 200004, '好吃', 5, '2024-06-08 13:15:27', 1, 1);
INSERT INTO `sys_user_view` VALUES (421, 102900005116219, 200002, '难吃', 2, '2024-06-09 13:08:51', 0, 1);
INSERT INTO `sys_user_view` VALUES (422, 102900005116219, 200010, '好吃', 1, '2024-05-02 03:21:04', 0, 1);
INSERT INTO `sys_user_view` VALUES (423, 102900011034325, 200004, '好吃', 0, '2024-04-29 04:42:25', 1, 1);
INSERT INTO `sys_user_view` VALUES (424, 102900005116714, 200007, '一般', 2, '2024-05-19 11:47:24', 0, 1);
INSERT INTO `sys_user_view` VALUES (425, 102900005116226, 200003, '好吃', 1, '2024-05-10 13:39:10', 1, 1);
INSERT INTO `sys_user_view` VALUES (426, 102900011034325, 200009, '好吃', 4, '2024-06-15 01:47:43', 0, 1);
INSERT INTO `sys_user_view` VALUES (427, 102900005115946, 200001, '难吃', 0, '2024-06-05 04:50:52', 1, 1);
INSERT INTO `sys_user_view` VALUES (428, 102900011010563, 200006, '难吃', 5, '2024-06-02 19:58:19', 1, 1);
INSERT INTO `sys_user_view` VALUES (429, 102900005116042, 200005, '好吃', 3, '2024-04-18 06:38:38', 0, 1);
INSERT INTO `sys_user_view` VALUES (430, 102900011034224, 200004, '难吃', 3, '2024-05-30 10:44:30', 1, 1);
INSERT INTO `sys_user_view` VALUES (431, 102900005115762, 200009, '一般', 2, '2024-04-27 18:02:09', 1, 1);
INSERT INTO `sys_user_view` VALUES (432, 102900005115748, 200001, '难吃', 5, '2024-04-17 05:07:56', 1, 1);
INSERT INTO `sys_user_view` VALUES (433, 102900005115861, 200002, '好吃', 2, '2024-05-18 16:58:00', 1, 1);
INSERT INTO `sys_user_view` VALUES (434, 102900005118831, 200010, '一般', 5, '2024-06-13 13:41:50', 1, 1);
INSERT INTO `sys_user_view` VALUES (435, 102900005118831, 200001, '难吃', 5, '2024-05-04 19:28:50', 1, 1);
INSERT INTO `sys_user_view` VALUES (436, 102900011007471, 200010, '好吃', 2, '2024-05-02 21:15:35', 0, 1);
INSERT INTO `sys_user_view` VALUES (437, 102900005116219, 200006, '难吃', 5, '2024-06-07 05:17:31', 0, 1);
INSERT INTO `sys_user_view` VALUES (438, 102900005128748, 200009, '难吃', 0, '2024-04-22 02:23:44', 1, 1);
INSERT INTO `sys_user_view` VALUES (439, 102900005116806, 200004, '难吃', 4, '2024-05-12 11:25:06', 0, 1);
INSERT INTO `sys_user_view` VALUES (440, 102900005115960, 200005, '好吃', 3, '2024-05-31 00:38:41', 1, 1);
INSERT INTO `sys_user_view` VALUES (441, 102900011034323, 200005, '好吃', 2, '2024-05-26 14:40:50', 1, 1);
INSERT INTO `sys_user_view` VALUES (442, 102900011007969, 200007, '好吃', 4, '2024-04-25 13:44:48', 0, 1);
INSERT INTO `sys_user_view` VALUES (443, 102900005115861, 200010, '一般', 5, '2024-05-06 09:42:37', 0, 1);
INSERT INTO `sys_user_view` VALUES (444, 102900011034324, 200010, '难吃', 1, '2024-06-05 21:19:16', 0, 1);
INSERT INTO `sys_user_view` VALUES (445, 102900005116042, 200009, '一般', 3, '2024-05-04 14:02:21', 0, 1);
INSERT INTO `sys_user_view` VALUES (446, 102900011016909, 200001, '难吃', 4, '2024-06-15 23:42:31', 0, 1);
INSERT INTO `sys_user_view` VALUES (447, 102900005116806, 200008, '好吃', 0, '2024-04-27 10:28:19', 1, 1);
INSERT INTO `sys_user_view` VALUES (448, 102900011034324, 200002, '一般', 1, '2024-05-01 03:06:25', 1, 1);
INSERT INTO `sys_user_view` VALUES (449, 10, 200006, '好吃', 2, '2024-05-03 18:28:09', 1, 1);
INSERT INTO `sys_user_view` VALUES (450, 102900005116042, 200003, '好吃', 0, '2024-05-29 13:19:20', 0, 1);
INSERT INTO `sys_user_view` VALUES (451, 102900005115823, 200005, '好吃', 4, '2024-05-28 02:20:59', 1, 1);
INSERT INTO `sys_user_view` VALUES (452, 102900005116042, 200006, '好吃', 3, '2024-05-13 09:38:11', 0, 1);
INSERT INTO `sys_user_view` VALUES (453, 102900011011058, 200006, '好吃', 1, '2024-04-22 04:11:07', 1, 1);
INSERT INTO `sys_user_view` VALUES (454, 102900011007471, 200006, '好吃', 4, '2024-06-11 02:24:10', 1, 1);
INSERT INTO `sys_user_view` VALUES (455, 102900005115779, 200004, '好吃', 2, '2024-04-21 09:48:33', 0, 1);
INSERT INTO `sys_user_view` VALUES (456, 102900011034224, 200009, '难吃', 3, '2024-05-24 02:04:51', 1, 1);
INSERT INTO `sys_user_view` VALUES (457, 102900011008492, 200008, '难吃', 4, '2024-05-20 23:02:28', 1, 1);
INSERT INTO `sys_user_view` VALUES (458, 102900011018132, 200006, '一般', 2, '2024-06-16 13:36:44', 0, 1);
INSERT INTO `sys_user_view` VALUES (459, 102900011008485, 200003, '好吃', 0, '2024-04-28 14:25:50', 0, 1);
INSERT INTO `sys_user_view` VALUES (460, 102900011000175, 200007, '难吃', 1, '2024-06-03 02:28:38', 1, 1);
INSERT INTO `sys_user_view` VALUES (461, 102900005116226, 200003, '好吃', 2, '2024-06-12 17:20:01', 0, 1);
INSERT INTO `sys_user_view` VALUES (462, 102900005115625, 200003, '一般', 3, '2024-05-24 00:24:38', 1, 1);
INSERT INTO `sys_user_view` VALUES (463, 102900011008164, 200007, '好吃', 1, '2024-05-26 18:04:51', 1, 1);
INSERT INTO `sys_user_view` VALUES (464, 102900011033920, 200010, '难吃', 3, '2024-05-08 08:02:44', 0, 1);
INSERT INTO `sys_user_view` VALUES (465, 102900011006955, 200002, '难吃', 4, '2024-05-14 01:34:27', 0, 1);
INSERT INTO `sys_user_view` VALUES (466, 102900005115786, 200010, '一般', 3, '2024-05-19 09:25:01', 0, 1);
INSERT INTO `sys_user_view` VALUES (467, 102900011034323, 200007, '好吃', 2, '2024-04-17 20:23:04', 0, 1);
INSERT INTO `sys_user_view` VALUES (468, 102900005116714, 200008, '一般', 2, '2024-04-20 06:55:46', 0, 1);
INSERT INTO `sys_user_view` VALUES (469, 102900011006689, 200005, '好吃', 0, '2024-06-11 13:51:27', 0, 1);
INSERT INTO `sys_user_view` VALUES (470, 102900011034323, 200010, '好吃', 3, '2024-06-11 14:17:21', 1, 1);
INSERT INTO `sys_user_view` VALUES (471, 102900005116714, 200008, '难吃', 3, '2024-05-15 15:12:49', 0, 1);
INSERT INTO `sys_user_view` VALUES (472, 102900011034324, 200009, '好吃', 0, '2024-05-25 17:04:19', 0, 1);
INSERT INTO `sys_user_view` VALUES (473, 102900011008492, 200009, '好吃', 2, '2024-04-29 14:47:50', 0, 1);
INSERT INTO `sys_user_view` VALUES (474, 102900011034224, 200002, '难吃', 4, '2024-06-03 15:54:24', 1, 1);
INSERT INTO `sys_user_view` VALUES (475, 102900011034224, 200002, '一般', 1, '2024-06-13 16:07:38', 0, 1);
INSERT INTO `sys_user_view` VALUES (476, 102900005115984, 200009, '一般', 5, '2024-06-04 07:51:20', 1, 1);
INSERT INTO `sys_user_view` VALUES (477, 102900005116226, 200005, '一般', 4, '2024-04-30 14:54:07', 1, 1);
INSERT INTO `sys_user_view` VALUES (478, 102900011034323, 200004, '难吃', 5, '2024-05-16 16:47:31', 0, 1);
INSERT INTO `sys_user_view` VALUES (479, 102900011034324, 200003, '好吃', 0, '2024-06-14 04:37:33', 1, 1);
INSERT INTO `sys_user_view` VALUES (480, 102900005115762, 200009, '好吃', 4, '2024-04-30 00:33:57', 1, 1);
INSERT INTO `sys_user_view` VALUES (481, 102900011008164, 200010, '一般', 3, '2024-04-18 13:14:21', 1, 1);
INSERT INTO `sys_user_view` VALUES (482, 102900011033999, 200004, '难吃', 2, '2024-06-05 07:52:31', 1, 1);
INSERT INTO `sys_user_view` VALUES (483, 102900005128748, 200005, '好吃', 0, '2024-05-15 00:52:44', 0, 1);
INSERT INTO `sys_user_view` VALUES (484, 102900011008492, 200002, '好吃', 4, '2024-05-30 15:21:02', 0, 1);
INSERT INTO `sys_user_view` VALUES (485, 102900005115786, 200010, '一般', 4, '2024-05-19 20:59:30', 1, 1);
INSERT INTO `sys_user_view` VALUES (486, 102900005116226, 200005, '好吃', 2, '2024-05-24 17:59:50', 0, 1);
INSERT INTO `sys_user_view` VALUES (487, 102900011034324, 200005, '好吃', 2, '2024-06-07 14:39:26', 1, 1);
INSERT INTO `sys_user_view` VALUES (488, 102900011034224, 200008, '一般', 2, '2024-05-31 18:40:51', 1, 1);
INSERT INTO `sys_user_view` VALUES (489, 102900011007471, 200010, '难吃', 3, '2024-05-09 06:29:02', 1, 1);
INSERT INTO `sys_user_view` VALUES (490, 102900005115960, 200007, '好吃', 4, '2024-06-16 17:07:32', 0, 1);
INSERT INTO `sys_user_view` VALUES (491, 102900005118817, 200008, '好吃', 4, '2024-04-25 03:00:37', 0, 1);
INSERT INTO `sys_user_view` VALUES (492, 102900011022764, 200005, '难吃', 4, '2024-04-28 06:02:50', 1, 1);
INSERT INTO `sys_user_view` VALUES (493, 102900005116233, 200006, '好吃', 5, '2024-04-20 18:13:03', 0, 1);
INSERT INTO `sys_user_view` VALUES (494, 102900011034224, 200005, '难吃', 2, '2024-04-30 06:03:53', 1, 1);
INSERT INTO `sys_user_view` VALUES (495, 102900011008492, 200007, '难吃', 2, '2024-04-19 13:38:25', 1, 1);
INSERT INTO `sys_user_view` VALUES (496, 102900011000328, 200007, '好吃', 4, '2024-06-17 01:45:40', 0, 1);
INSERT INTO `sys_user_view` VALUES (497, 102900005118831, 200004, '难吃', 0, '2024-05-20 12:01:41', 0, 1);
INSERT INTO `sys_user_view` VALUES (498, 102900005115793, 200003, '一般', 0, '2024-05-01 16:07:49', 0, 1);
INSERT INTO `sys_user_view` VALUES (499, 10, 200005, '一般', 2, '2024-05-02 02:49:51', 0, 1);
INSERT INTO `sys_user_view` VALUES (500, 102900011000335, 200002, '好吃', 3, '2024-04-26 03:00:29', 0, 1);
INSERT INTO `sys_user_view` VALUES (501, 102900005118817, 200003, '好吃', 5, '2024-04-23 15:45:27', 1, 1);
INSERT INTO `sys_user_view` VALUES (502, 102900011034323, 200002, '难吃', 0, '2024-06-01 22:12:07', 0, 1);
INSERT INTO `sys_user_view` VALUES (503, 102900011034323, 200002, '好吃', 0, '2024-05-21 02:31:36', 1, 1);
INSERT INTO `sys_user_view` VALUES (504, 102900011008485, 200009, '好吃', 3, '2024-04-18 06:42:11', 1, 1);
INSERT INTO `sys_user_view` VALUES (505, 102900011033920, 200005, '好吃', 0, '2024-04-29 04:16:58', 1, 1);
INSERT INTO `sys_user_view` VALUES (506, 102900011008522, 200005, '好吃', 4, '2024-05-22 06:25:17', 1, 1);
INSERT INTO `sys_user_view` VALUES (507, 102900005118831, 200003, '一般', 2, '2024-06-15 00:03:10', 1, 1);
INSERT INTO `sys_user_view` VALUES (508, 102900005115861, 200004, '好吃', 1, '2024-04-23 10:36:35', 0, 1);
INSERT INTO `sys_user_view` VALUES (509, 102900011008164, 200007, '好吃', 3, '2024-04-21 14:34:09', 1, 1);
INSERT INTO `sys_user_view` VALUES (510, 102900005116042, 200008, '一般', 2, '2024-05-18 02:05:40', 1, 1);
INSERT INTO `sys_user_view` VALUES (511, 102900005115861, 200003, '难吃', 5, '2024-04-28 13:47:57', 1, 1);
INSERT INTO `sys_user_view` VALUES (512, 102900011034224, 200006, '好吃', 4, '2024-04-25 14:04:07', 0, 1);
INSERT INTO `sys_user_view` VALUES (513, 102900005115786, 200005, '难吃', 1, '2024-05-17 17:40:07', 1, 1);
INSERT INTO `sys_user_view` VALUES (514, 102900011033920, 200008, '难吃', 2, '2024-06-17 16:48:54', 0, 1);
INSERT INTO `sys_user_view` VALUES (515, 102900011033920, 200009, '好吃', 2, '2024-04-28 18:03:49', 1, 1);
INSERT INTO `sys_user_view` VALUES (516, 102900011033920, 200008, '难吃', 2, '2024-05-03 08:18:21', 0, 1);
INSERT INTO `sys_user_view` VALUES (517, 102900005116233, 200006, '好吃', 2, '2024-06-03 02:20:54', 1, 1);
INSERT INTO `sys_user_view` VALUES (518, 102900011007969, 200008, '好吃', 2, '2024-06-11 12:01:19', 1, 1);
INSERT INTO `sys_user_view` VALUES (519, 102900005115977, 200006, '一般', 0, '2024-05-06 04:42:44', 1, 1);
INSERT INTO `sys_user_view` VALUES (520, 102900005125808, 200006, '好吃', 4, '2024-06-05 15:38:46', 0, 1);
INSERT INTO `sys_user_view` VALUES (521, 102900005115748, 200003, '难吃', 1, '2024-05-01 07:49:46', 1, 1);
INSERT INTO `sys_user_view` VALUES (522, 102900011008522, 200007, '好吃', 1, '2024-05-03 19:35:52', 1, 1);
INSERT INTO `sys_user_view` VALUES (523, 102900011034326, 200007, '好吃', 0, '2024-04-26 09:24:36', 1, 1);
INSERT INTO `sys_user_view` VALUES (524, 102900011007464, 200001, '一般', 5, '2024-06-01 23:11:03', 0, 1);
INSERT INTO `sys_user_view` VALUES (525, 102900011033999, 200001, '难吃', 4, '2024-06-01 14:50:44', 1, 1);
INSERT INTO `sys_user_view` VALUES (526, 102900011022764, 200009, '难吃', 0, '2024-06-07 21:07:27', 0, 1);
INSERT INTO `sys_user_view` VALUES (527, 102900011008164, 200001, '一般', 5, '2024-04-23 01:33:07', 1, 1);
INSERT INTO `sys_user_view` VALUES (528, 102900005116219, 200010, '难吃', 3, '2024-04-24 16:27:51', 1, 1);
INSERT INTO `sys_user_view` VALUES (529, 102900005128748, 200003, '难吃', 4, '2024-05-26 06:24:37', 1, 1);
INSERT INTO `sys_user_view` VALUES (530, 102900005115960, 200005, '难吃', 4, '2024-06-11 06:32:40', 1, 1);
INSERT INTO `sys_user_view` VALUES (531, 102900005116233, 200004, '一般', 4, '2024-05-23 21:48:53', 0, 1);
INSERT INTO `sys_user_view` VALUES (532, 102900011007969, 200004, '难吃', 2, '2024-06-13 05:57:41', 1, 1);
INSERT INTO `sys_user_view` VALUES (533, 102900011011058, 200009, '好吃', 4, '2024-05-26 15:41:51', 1, 1);
INSERT INTO `sys_user_view` VALUES (534, 102900005115984, 200008, '好吃', 3, '2024-06-01 06:31:50', 1, 1);
INSERT INTO `sys_user_view` VALUES (535, 102900005125808, 200010, '一般', 2, '2024-06-01 12:33:56', 1, 1);
INSERT INTO `sys_user_view` VALUES (536, 102900005125808, 200005, '一般', 4, '2024-04-24 13:20:36', 0, 1);
INSERT INTO `sys_user_view` VALUES (537, 102900011011058, 200005, '好吃', 4, '2024-04-19 20:40:15', 0, 1);
INSERT INTO `sys_user_view` VALUES (538, 102900011008577, 200007, '难吃', 5, '2024-05-12 15:49:12', 1, 1);
INSERT INTO `sys_user_view` VALUES (539, 102900011008485, 200006, '难吃', 2, '2024-05-31 17:25:35', 0, 1);
INSERT INTO `sys_user_view` VALUES (540, 102900005115960, 200008, '难吃', 1, '2024-05-16 04:25:40', 1, 1);
INSERT INTO `sys_user_view` VALUES (541, 102900011034224, 200001, '好吃', 5, '2024-06-09 00:12:41', 0, 1);
INSERT INTO `sys_user_view` VALUES (542, 102900005118817, 200004, '一般', 3, '2024-05-17 23:28:16', 1, 1);
INSERT INTO `sys_user_view` VALUES (543, 102900011008577, 200005, '难吃', 5, '2024-06-06 15:08:22', 0, 1);
INSERT INTO `sys_user_view` VALUES (544, 102900005118831, 200006, '难吃', 1, '2024-05-31 06:17:37', 1, 1);
INSERT INTO `sys_user_view` VALUES (545, 102900005115960, 200005, '难吃', 3, '2024-05-20 14:57:25', 0, 1);
INSERT INTO `sys_user_view` VALUES (546, 102900011010563, 200006, '一般', 5, '2024-04-20 03:43:14', 1, 1);
INSERT INTO `sys_user_view` VALUES (547, 102900005116905, 200009, '一般', 0, '2024-05-31 13:44:10', 1, 1);
INSERT INTO `sys_user_view` VALUES (548, 102900011008164, 200004, '难吃', 4, '2024-04-24 00:26:44', 1, 1);
INSERT INTO `sys_user_view` VALUES (549, 102900011034224, 200009, '难吃', 3, '2024-04-30 01:20:05', 1, 1);
INSERT INTO `sys_user_view` VALUES (550, 102900011007471, 200002, '一般', 3, '2024-05-21 19:14:30', 0, 1);
INSERT INTO `sys_user_view` VALUES (551, 102900005115786, 200009, '一般', 1, '2024-05-12 12:38:11', 0, 1);
INSERT INTO `sys_user_view` VALUES (552, 102900011034323, 200007, '一般', 1, '2024-06-03 02:01:22', 0, 1);
INSERT INTO `sys_user_view` VALUES (553, 102900011033999, 200001, '一般', 0, '2024-04-19 08:47:04', 0, 1);
INSERT INTO `sys_user_view` VALUES (554, 102900011034326, 200008, '难吃', 5, '2024-05-19 04:16:58', 1, 1);
INSERT INTO `sys_user_view` VALUES (555, 102900011011058, 200002, '好吃', 2, '2024-05-24 13:19:34', 1, 1);
INSERT INTO `sys_user_view` VALUES (556, 102900011034324, 200006, '难吃', 3, '2024-04-30 22:39:45', 0, 1);
INSERT INTO `sys_user_view` VALUES (557, 102900005116714, 200002, '一般', 4, '2024-04-21 01:30:57', 1, 1);
INSERT INTO `sys_user_view` VALUES (558, 102900005116233, 200002, '一般', 2, '2024-05-07 22:27:28', 0, 1);
INSERT INTO `sys_user_view` VALUES (559, 102900005115977, 200010, '难吃', 5, '2024-04-23 06:35:18', 0, 1);
INSERT INTO `sys_user_view` VALUES (560, 102900011008522, 200002, '好吃', 0, '2024-05-03 10:23:08', 0, 1);
INSERT INTO `sys_user_view` VALUES (561, 102900005116042, 200010, '一般', 2, '2024-04-20 11:36:47', 1, 1);
INSERT INTO `sys_user_view` VALUES (562, 102900011007464, 200002, '难吃', 4, '2024-04-22 14:04:39', 0, 1);
INSERT INTO `sys_user_view` VALUES (563, 102900011033920, 200008, '难吃', 1, '2024-04-26 06:16:39', 1, 1);
INSERT INTO `sys_user_view` VALUES (564, 102900005118831, 200005, '一般', 2, '2024-06-03 20:53:51', 1, 1);
INSERT INTO `sys_user_view` VALUES (565, 102900005116806, 200010, '难吃', 3, '2024-05-25 00:32:04', 0, 1);
INSERT INTO `sys_user_view` VALUES (566, 102900011008522, 200006, '难吃', 5, '2024-05-01 23:16:45', 0, 1);
INSERT INTO `sys_user_view` VALUES (567, 102900011016909, 200002, '难吃', 4, '2024-06-11 00:34:18', 1, 1);
INSERT INTO `sys_user_view` VALUES (568, 102900011022764, 200004, '一般', 4, '2024-06-17 08:26:58', 1, 1);
INSERT INTO `sys_user_view` VALUES (569, 102900005115748, 200002, '难吃', 0, '2024-05-22 00:43:04', 1, 1);
INSERT INTO `sys_user_view` VALUES (570, 102900011008164, 200003, '好吃', 4, '2024-05-10 08:56:08', 1, 1);
INSERT INTO `sys_user_view` VALUES (571, 102900005116226, 200010, '难吃', 5, '2024-05-02 19:47:07', 1, 1);
INSERT INTO `sys_user_view` VALUES (572, 102900011000328, 200007, '难吃', 3, '2024-06-13 14:32:06', 0, 1);
INSERT INTO `sys_user_view` VALUES (573, 102900011008164, 200009, '一般', 3, '2024-05-20 17:03:06', 1, 1);
INSERT INTO `sys_user_view` VALUES (574, 102900005115786, 200006, '一般', 0, '2024-05-26 12:27:19', 0, 1);
INSERT INTO `sys_user_view` VALUES (575, 102900005115946, 200004, '好吃', 5, '2024-05-23 19:15:04', 0, 1);
INSERT INTO `sys_user_view` VALUES (576, 102900005115748, 200009, '难吃', 4, '2024-05-01 23:07:03', 1, 1);
INSERT INTO `sys_user_view` VALUES (577, 102900011008485, 200002, '好吃', 0, '2024-04-21 14:52:50', 0, 1);
INSERT INTO `sys_user_view` VALUES (578, 102900005116042, 200008, '一般', 3, '2024-06-03 22:21:07', 1, 1);
INSERT INTO `sys_user_view` VALUES (579, 102900005116226, 200001, '难吃', 4, '2024-06-14 17:14:33', 1, 1);
INSERT INTO `sys_user_view` VALUES (580, 102900011006689, 200005, '难吃', 2, '2024-04-26 19:42:30', 1, 1);
INSERT INTO `sys_user_view` VALUES (581, 102900005115786, 200006, '一般', 0, '2024-05-13 02:19:49', 1, 1);
INSERT INTO `sys_user_view` VALUES (582, 102900011008522, 200008, '一般', 4, '2024-05-03 08:14:24', 0, 1);
INSERT INTO `sys_user_view` VALUES (583, 102900005116714, 200005, '一般', 2, '2024-05-07 06:13:51', 1, 1);
INSERT INTO `sys_user_view` VALUES (584, 102900011018132, 200005, '难吃', 0, '2024-05-17 19:26:06', 1, 1);
INSERT INTO `sys_user_view` VALUES (585, 102900011022764, 200007, '一般', 5, '2024-05-23 07:00:32', 1, 1);
INSERT INTO `sys_user_view` VALUES (586, 102900011008164, 200010, '一般', 2, '2024-05-25 05:36:09', 0, 1);
INSERT INTO `sys_user_view` VALUES (587, 102900005115977, 200010, '好吃', 0, '2024-06-10 05:41:07', 1, 1);
INSERT INTO `sys_user_view` VALUES (588, 102900011000175, 200005, '好吃', 4, '2024-05-09 08:01:38', 0, 1);
INSERT INTO `sys_user_view` VALUES (589, 102900005116226, 200001, '好吃', 1, '2024-05-22 15:50:41', 0, 1);
INSERT INTO `sys_user_view` VALUES (590, 102900011034224, 200010, '难吃', 3, '2024-06-07 11:59:19', 0, 1);
INSERT INTO `sys_user_view` VALUES (591, 102900005128748, 200003, '一般', 2, '2024-05-25 03:10:28', 1, 1);
INSERT INTO `sys_user_view` VALUES (592, 102900011034325, 200006, '好吃', 2, '2024-05-02 17:22:22', 1, 1);
INSERT INTO `sys_user_view` VALUES (593, 102900005116219, 200005, '好吃', 3, '2024-06-04 15:39:39', 0, 1);
INSERT INTO `sys_user_view` VALUES (594, 102900011034325, 200008, '难吃', 4, '2024-05-06 00:48:20', 0, 1);
INSERT INTO `sys_user_view` VALUES (595, 102900005115946, 200009, '难吃', 1, '2024-04-29 21:18:30', 0, 1);
INSERT INTO `sys_user_view` VALUES (596, 102900005128748, 200008, '好吃', 1, '2024-04-27 16:33:41', 1, 1);
INSERT INTO `sys_user_view` VALUES (597, 102900005118831, 200002, '一般', 2, '2024-04-17 03:36:13', 1, 1);
INSERT INTO `sys_user_view` VALUES (598, 10, 200007, '一般', 3, '2024-06-17 08:09:54', 1, 1);
INSERT INTO `sys_user_view` VALUES (599, 102900011034323, 200007, '难吃', 5, '2024-04-20 22:41:01', 1, 1);
INSERT INTO `sys_user_view` VALUES (600, 102900011034325, 200004, '好吃', 4, '2024-06-13 05:30:13', 1, 1);
INSERT INTO `sys_user_view` VALUES (601, 102900011010563, 200006, '好吃', 3, '2024-05-16 17:53:00', 0, 1);
INSERT INTO `sys_user_view` VALUES (602, 102900005115960, 200005, '好吃', 0, '2024-05-30 12:58:10', 1, 1);
INSERT INTO `sys_user_view` VALUES (603, 102900005118831, 200004, '好吃', 4, '2024-06-15 19:12:08', 0, 1);
INSERT INTO `sys_user_view` VALUES (604, 102900011010563, 200009, '一般', 4, '2024-05-09 18:14:24', 0, 1);
INSERT INTO `sys_user_view` VALUES (605, 102900011034323, 200003, '好吃', 1, '2024-05-18 11:28:15', 0, 1);
INSERT INTO `sys_user_view` VALUES (606, 102900005115748, 200003, '难吃', 5, '2024-05-15 22:29:07', 1, 1);
INSERT INTO `sys_user_view` VALUES (607, 102900011008492, 200004, '难吃', 4, '2024-06-04 09:54:57', 0, 1);
INSERT INTO `sys_user_view` VALUES (608, 102900011007464, 200005, '难吃', 4, '2024-05-26 04:34:45', 0, 1);
INSERT INTO `sys_user_view` VALUES (609, 102900011007464, 200001, '好吃', 0, '2024-06-03 08:14:34', 0, 1);
INSERT INTO `sys_user_view` VALUES (610, 102900005116905, 200005, '难吃', 4, '2024-05-11 21:10:30', 1, 1);
INSERT INTO `sys_user_view` VALUES (611, 102900011033920, 200007, '一般', 1, '2024-04-23 18:32:19', 1, 1);
INSERT INTO `sys_user_view` VALUES (612, 102900005128748, 200002, '一般', 5, '2024-05-10 18:55:37', 0, 1);
INSERT INTO `sys_user_view` VALUES (613, 102900011011058, 200009, '难吃', 4, '2024-05-16 07:25:25', 1, 1);
INSERT INTO `sys_user_view` VALUES (614, 102900011022764, 200007, '难吃', 4, '2024-04-26 05:39:38', 0, 1);
INSERT INTO `sys_user_view` VALUES (615, 102900011000175, 200002, '难吃', 3, '2024-05-14 07:50:50', 0, 1);
INSERT INTO `sys_user_view` VALUES (616, 102900011034325, 200005, '一般', 5, '2024-05-09 15:53:52', 0, 1);
INSERT INTO `sys_user_view` VALUES (617, 102900005118817, 200002, '一般', 5, '2024-04-22 21:17:09', 0, 1);
INSERT INTO `sys_user_view` VALUES (618, 102900011011058, 200006, '好吃', 1, '2024-05-27 05:14:36', 1, 1);
INSERT INTO `sys_user_view` VALUES (619, 102900005128748, 200005, '好吃', 3, '2024-05-09 17:28:55', 1, 1);
INSERT INTO `sys_user_view` VALUES (620, 102900005116219, 200010, '一般', 3, '2024-05-26 21:40:45', 0, 1);
INSERT INTO `sys_user_view` VALUES (621, 102900011007471, 200004, '难吃', 4, '2024-04-20 14:03:34', 1, 1);
INSERT INTO `sys_user_view` VALUES (622, 102900005115793, 200005, '一般', 3, '2024-04-29 10:13:17', 0, 1);
INSERT INTO `sys_user_view` VALUES (623, 102900005116806, 200001, '难吃', 3, '2024-04-24 03:51:14', 1, 1);
INSERT INTO `sys_user_view` VALUES (624, 102900005115793, 200003, '难吃', 1, '2024-04-20 10:47:40', 1, 1);
INSERT INTO `sys_user_view` VALUES (625, 102900005115977, 200004, '难吃', 5, '2024-04-26 21:02:32', 1, 1);
INSERT INTO `sys_user_view` VALUES (626, 102900005125808, 200010, '难吃', 4, '2024-04-19 03:18:49', 0, 1);
INSERT INTO `sys_user_view` VALUES (627, 102900005116806, 200004, '难吃', 5, '2024-04-20 15:39:19', 0, 1);
INSERT INTO `sys_user_view` VALUES (628, 102900011007464, 200004, '一般', 2, '2024-04-29 08:08:09', 1, 1);
INSERT INTO `sys_user_view` VALUES (629, 102900005115984, 200003, '一般', 5, '2024-05-25 18:48:28', 0, 1);
INSERT INTO `sys_user_view` VALUES (630, 102900005115625, 200004, '一般', 5, '2024-05-19 09:59:38', 0, 1);
INSERT INTO `sys_user_view` VALUES (631, 102900011022764, 200008, '好吃', 4, '2024-05-16 06:10:47', 1, 1);
INSERT INTO `sys_user_view` VALUES (632, 102900011000328, 200008, '好吃', 1, '2024-05-24 03:34:51', 1, 1);
INSERT INTO `sys_user_view` VALUES (633, 102900011011058, 200007, '好吃', 0, '2024-06-02 13:18:59', 1, 1);
INSERT INTO `sys_user_view` VALUES (634, 102900011007969, 200005, '难吃', 0, '2024-04-17 20:14:45', 0, 1);
INSERT INTO `sys_user_view` VALUES (635, 102900011008577, 200006, '一般', 3, '2024-05-29 03:20:53', 0, 1);
INSERT INTO `sys_user_view` VALUES (636, 102900005118831, 200001, '难吃', 0, '2024-04-24 15:10:37', 1, 1);
INSERT INTO `sys_user_view` VALUES (637, 102900011008577, 200010, '一般', 4, '2024-05-12 15:14:40', 0, 1);
INSERT INTO `sys_user_view` VALUES (638, 102900005116042, 200008, '难吃', 0, '2024-05-07 22:58:06', 1, 1);
INSERT INTO `sys_user_view` VALUES (639, 102900011008492, 200002, '一般', 2, '2024-05-10 02:41:44', 1, 1);
INSERT INTO `sys_user_view` VALUES (640, 102900011016909, 200004, '难吃', 5, '2024-06-03 18:59:06', 0, 1);
INSERT INTO `sys_user_view` VALUES (641, 102900011008522, 200005, '难吃', 3, '2024-05-13 03:30:31', 0, 1);
INSERT INTO `sys_user_view` VALUES (642, 102900005115861, 200003, '一般', 1, '2024-05-03 16:29:19', 0, 1);
INSERT INTO `sys_user_view` VALUES (643, 102900005116714, 200001, '难吃', 1, '2024-06-08 19:42:36', 1, 1);
INSERT INTO `sys_user_view` VALUES (644, 102900005116233, 200006, '好吃', 0, '2024-04-23 20:03:29', 1, 1);
INSERT INTO `sys_user_view` VALUES (645, 102900011007969, 200010, '好吃', 1, '2024-05-10 11:16:29', 1, 1);
INSERT INTO `sys_user_view` VALUES (646, 102900011007471, 200008, '一般', 2, '2024-05-19 00:01:26', 0, 1);
INSERT INTO `sys_user_view` VALUES (647, 102900011008522, 200010, '好吃', 5, '2024-06-15 12:23:17', 0, 1);
INSERT INTO `sys_user_view` VALUES (648, 102900005115625, 200007, '好吃', 5, '2024-05-25 05:45:16', 1, 1);
INSERT INTO `sys_user_view` VALUES (649, 102900005115748, 200001, '好吃', 4, '2024-06-03 22:32:47', 1, 1);
INSERT INTO `sys_user_view` VALUES (650, 102900005115793, 200005, '好吃', 2, '2024-04-26 13:41:55', 0, 1);
INSERT INTO `sys_user_view` VALUES (651, 10, 200010, '难吃', 4, '2024-05-30 05:08:07', 0, 1);
INSERT INTO `sys_user_view` VALUES (652, 102900011033920, 200007, '一般', 0, '2024-05-25 22:17:08', 1, 1);
INSERT INTO `sys_user_view` VALUES (653, 102900005115984, 200002, '一般', 1, '2024-06-07 14:38:58', 0, 1);
INSERT INTO `sys_user_view` VALUES (654, 102900005115823, 200007, '好吃', 2, '2024-05-05 11:13:08', 0, 1);
INSERT INTO `sys_user_view` VALUES (655, 102900005115625, 200002, '一般', 5, '2024-05-02 01:58:37', 0, 1);
INSERT INTO `sys_user_view` VALUES (656, 102900011010563, 200004, '一般', 4, '2024-06-12 15:23:35', 1, 1);
INSERT INTO `sys_user_view` VALUES (657, 102900005115960, 200001, '难吃', 3, '2024-05-02 00:07:27', 1, 1);
INSERT INTO `sys_user_view` VALUES (658, 102900011034326, 200001, '好吃', 0, '2024-05-12 18:38:14', 1, 1);
INSERT INTO `sys_user_view` VALUES (659, 102900011016909, 200006, '好吃', 5, '2024-06-01 18:45:26', 1, 1);
INSERT INTO `sys_user_view` VALUES (660, 102900011007969, 200003, '难吃', 1, '2024-05-22 03:13:29', 1, 1);
INSERT INTO `sys_user_view` VALUES (661, 102900005115793, 200008, '好吃', 4, '2024-04-27 06:13:30', 1, 1);
INSERT INTO `sys_user_view` VALUES (662, 102900005115823, 200004, '好吃', 1, '2024-04-19 23:23:11', 1, 1);
INSERT INTO `sys_user_view` VALUES (663, 102900011008485, 200002, '好吃', 1, '2024-05-05 08:33:23', 1, 1);
INSERT INTO `sys_user_view` VALUES (664, 102900005115960, 200009, '好吃', 0, '2024-05-17 19:26:27', 1, 1);
INSERT INTO `sys_user_view` VALUES (665, 102900011008492, 200009, '一般', 1, '2024-05-01 15:29:10', 0, 1);
INSERT INTO `sys_user_view` VALUES (666, 102900005115977, 200007, '一般', 4, '2024-05-02 04:26:09', 1, 1);
INSERT INTO `sys_user_view` VALUES (667, 102900011007471, 200004, '难吃', 0, '2024-05-03 18:50:01', 0, 1);
INSERT INTO `sys_user_view` VALUES (668, 102900011000328, 200003, '一般', 4, '2024-04-24 21:37:41', 1, 1);
INSERT INTO `sys_user_view` VALUES (669, 102900005116219, 200004, '难吃', 3, '2024-05-30 06:21:07', 1, 1);
INSERT INTO `sys_user_view` VALUES (670, 102900011034324, 200004, '一般', 4, '2024-04-21 11:20:10', 0, 1);
INSERT INTO `sys_user_view` VALUES (671, 102900005118831, 200009, '难吃', 0, '2024-05-06 19:22:40', 1, 1);
INSERT INTO `sys_user_view` VALUES (672, 102900011007471, 200008, '难吃', 5, '2024-05-11 07:24:46', 0, 1);
INSERT INTO `sys_user_view` VALUES (673, 102900005115960, 200003, '一般', 5, '2024-05-11 13:34:21', 1, 1);
INSERT INTO `sys_user_view` VALUES (674, 102900005118817, 200010, '一般', 2, '2024-04-19 02:08:19', 1, 1);
INSERT INTO `sys_user_view` VALUES (675, 102900005116219, 200009, '好吃', 2, '2024-05-27 13:49:51', 1, 1);
INSERT INTO `sys_user_view` VALUES (676, 102900011034323, 200004, '一般', 4, '2024-06-07 23:26:54', 1, 1);
INSERT INTO `sys_user_view` VALUES (677, 102900011008485, 200005, '难吃', 3, '2024-06-08 13:27:28', 1, 1);
INSERT INTO `sys_user_view` VALUES (678, 102900011034323, 200002, '难吃', 4, '2024-05-05 14:21:49', 0, 1);
INSERT INTO `sys_user_view` VALUES (679, 102900011006955, 200009, '一般', 4, '2024-05-06 01:07:01', 0, 1);
INSERT INTO `sys_user_view` VALUES (680, 102900011011058, 200003, '好吃', 0, '2024-05-29 18:21:52', 1, 1);
INSERT INTO `sys_user_view` VALUES (681, 102900011006955, 200010, '一般', 2, '2024-04-23 14:27:22', 0, 1);
INSERT INTO `sys_user_view` VALUES (682, 102900011009277, 200010, '难吃', 2, '2024-05-21 10:49:15', 1, 1);
INSERT INTO `sys_user_view` VALUES (683, 102900011010563, 200005, '一般', 5, '2024-05-27 05:56:14', 1, 1);
INSERT INTO `sys_user_view` VALUES (684, 102900011007471, 200002, '一般', 5, '2024-06-07 10:00:33', 1, 1);
INSERT INTO `sys_user_view` VALUES (685, 102900011008485, 200006, '好吃', 1, '2024-04-22 18:42:20', 1, 1);
INSERT INTO `sys_user_view` VALUES (686, 102900011016909, 200007, '一般', 4, '2024-06-09 02:01:18', 0, 1);
INSERT INTO `sys_user_view` VALUES (687, 102900011007471, 200009, '难吃', 1, '2024-05-25 16:18:16', 1, 1);
INSERT INTO `sys_user_view` VALUES (688, 102900011007471, 200007, '好吃', 2, '2024-05-15 02:54:32', 1, 1);
INSERT INTO `sys_user_view` VALUES (689, 102900011006955, 200007, '难吃', 1, '2024-06-07 02:33:11', 0, 1);
INSERT INTO `sys_user_view` VALUES (690, 102900011034324, 200008, '难吃', 5, '2024-05-18 13:09:50', 0, 1);
INSERT INTO `sys_user_view` VALUES (691, 102900011008577, 200010, '好吃', 2, '2024-05-22 18:50:46', 0, 1);
INSERT INTO `sys_user_view` VALUES (692, 102900011033920, 200006, '一般', 3, '2024-05-05 11:33:14', 0, 1);
INSERT INTO `sys_user_view` VALUES (693, 102900011000335, 200007, '一般', 5, '2024-05-16 20:54:49', 0, 1);
INSERT INTO `sys_user_view` VALUES (694, 102900011034323, 200006, '一般', 5, '2024-05-05 06:27:17', 0, 1);
INSERT INTO `sys_user_view` VALUES (695, 102900011034325, 200001, '好吃', 1, '2024-04-20 07:24:48', 0, 1);
INSERT INTO `sys_user_view` VALUES (696, 102900005116226, 200006, '好吃', 4, '2024-05-27 12:40:22', 0, 1);
INSERT INTO `sys_user_view` VALUES (697, 102900011034324, 200008, '好吃', 2, '2024-05-26 09:10:29', 1, 1);
INSERT INTO `sys_user_view` VALUES (698, 102900011007464, 200003, '难吃', 2, '2024-05-02 16:53:13', 1, 1);
INSERT INTO `sys_user_view` VALUES (699, 102900005116905, 200008, '好吃', 4, '2024-05-16 02:28:52', 1, 1);
INSERT INTO `sys_user_view` VALUES (700, 102900011016909, 200007, '一般', 4, '2024-05-03 04:58:05', 0, 1);
INSERT INTO `sys_user_view` VALUES (701, 102900005116042, 200010, '难吃', 2, '2024-06-14 05:34:08', 0, 1);
INSERT INTO `sys_user_view` VALUES (702, 102900005118817, 200005, '难吃', 5, '2024-05-08 20:22:16', 1, 1);
INSERT INTO `sys_user_view` VALUES (703, 102900011018132, 200006, '一般', 5, '2024-04-21 04:56:44', 0, 1);
INSERT INTO `sys_user_view` VALUES (704, 102900011008577, 200009, '一般', 3, '2024-05-19 12:27:12', 0, 1);
INSERT INTO `sys_user_view` VALUES (705, 102900005115625, 200008, '好吃', 3, '2024-05-23 21:24:12', 0, 1);
INSERT INTO `sys_user_view` VALUES (706, 102900005115977, 200005, '好吃', 3, '2024-05-19 22:59:29', 1, 1);
INSERT INTO `sys_user_view` VALUES (707, 102900011009277, 200010, '好吃', 2, '2024-05-12 13:58:59', 0, 1);
INSERT INTO `sys_user_view` VALUES (708, 102900011034224, 200002, '难吃', 3, '2024-05-28 12:31:34', 0, 1);
INSERT INTO `sys_user_view` VALUES (709, 102900011008485, 200002, '一般', 3, '2024-05-11 12:37:20', 1, 1);
INSERT INTO `sys_user_view` VALUES (710, 102900005116219, 200008, '一般', 4, '2024-05-06 05:20:32', 0, 1);
INSERT INTO `sys_user_view` VALUES (711, 102900011007464, 200009, 'test', 1, '2024-03-10 00:00:00', 0, 0);
INSERT INTO `sys_user_view` VALUES (712, 102900011007464, 200009, 'test', 1, '2024-03-10 00:00:00', 0, 0);
INSERT INTO `sys_user_view` VALUES (713, 102900011007464, 200009, 'test', 1, '2024-03-10 00:00:00', 0, 0);
INSERT INTO `sys_user_view` VALUES (714, 102900011018132, 200001, '你好', 1, '2024-03-11 00:00:00', 0, 0);
INSERT INTO `sys_user_view` VALUES (715, 102900011018132, 200001, 'okk', 1, '2024-03-11 00:00:00', 0, 0);
INSERT INTO `sys_user_view` VALUES (716, 102900011009277, 200001, '这个蔬菜很新鲜', 1, '2024-03-11 00:00:00', 0, 0);
INSERT INTO `sys_user_view` VALUES (717, 102900011010563, 200001, 'Helloworld', 1, '2024-03-11 00:00:00', 0, 0);
INSERT INTO `sys_user_view` VALUES (718, 102900011010563, 200001, '你好', 1, '2024-03-11 00:00:00', 0, 0);
INSERT INTO `sys_user_view` VALUES (719, 102900111034326, 200001, '你好,世界', 1, '2024-03-12 00:00:00', 0, 0);

-- ----------------------------
-- Table structure for web_commodity_detail
-- ----------------------------
DROP TABLE IF EXISTS `web_commodity_detail`;
CREATE TABLE `web_commodity_detail`  (
  `commodity_id` bigint NOT NULL,
  `partition_id` bigint NULL DEFAULT NULL,
  `partition_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commodity_price` float NULL DEFAULT NULL,
  `commodity_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `profile_image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `origin` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `selling` int NULL DEFAULT NULL,
  `expiration_flag` int NULL DEFAULT NULL,
  `expiration_time` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `permission` int NULL DEFAULT NULL,
  `loss_rate` float NULL DEFAULT NULL,
  PRIMARY KEY (`commodity_id`) USING BTREE,
  INDEX `commodity_name`(`commodity_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of web_commodity_detail
-- ----------------------------
INSERT INTO `web_commodity_detail` VALUES (10, 0, '蔬菜类', 0, '蔬菜类', '根节点', NULL, NULL, 0, 1, 0, '2024-02-12 00:08:29', '2024-02-12 00:08:34', 1, 0);
INSERT INTO `web_commodity_detail` VALUES (102900005115625, 1011010101, '花叶类', 3, '本地小毛白菜', '又名鸡毛菜（学名：Brassica rapa L.）是十字花科芸薹属植物，小白菜（青菜）的幼苗的俗称，此叫法以上海一带比较普遍。可治疗肺热咳嗽、便秘、丹毒、漆疮等疾病。小儿缺钙，骨软、发秃，可用小白菜煮汤加盐或糖令其饮服，经常食用颇有益。小白菜含维生素B1、维生素B6、泛酸等，具有缓解精神紧张的功能。', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F14622788%2Fbd6fc86904d8495d80267c429999b34f.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvMTQ2MjI3ODgvYmQ2ZmM4NjkwNGQ4NDk1ZDgwMjY3YzQyOTk5OWIzNGYuanBn%2Fsign%2Feb7960a8704abf301343f2e4ffdb3c04.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709043646&t=1f83ec542021d10f4f8c02d50df45082', '山东', 92, 0, 122, '2024-01-28 00:00:00', '2024-02-12 21:54:45', 0, 2);
INSERT INTO `web_commodity_detail` VALUES (102900005115748, 1011010101, '花叶类', 5.5, '白菜苔', '菜苔，又名菜心、菜尖和苔心菜等，种类很多，包括有白菜苔、青菜苔(即油菜苔)、腊菜苔、紫菜苔和芥菜苔等。其性凉而味甘，属性和味道各异，但都是十字花科植物二年生或两年生草本菜类的花苔及嫩叶。\r\n白菜苔，油料作物之一黄油菜的嫩茎。生于田间地头产品遍布各地。每年春季采摘上市。产品色泽青翠，肉质细嫩。', 'https://img1.baidu.com/it/u=534206185,916523924&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333', '河南', 10, 0, 30, '2024-01-28 00:00:00', '2024-02-12 22:01:21', 1, 8.2);
INSERT INTO `web_commodity_detail` VALUES (102900005115762, 1011010101, '花叶类', 11.3, '苋菜', '苋菜主治补气除热，通九窍。 凉拌马齿苋具有清热利湿、涩肠止泻的功效；适合时有大肠湿热泄泻的人群食用。 马齿苋见阳光花开，早、晚、阴天闭合，故有太阳花、午时花之名，花语是沉默的爱、光明、热烈、忠诚、阳光、积极向上。 ', 'https://img1.baidu.com/it/u=1201088783,146327752&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500', '河北', 1, 1, 3, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 1, 18.52);
INSERT INTO `web_commodity_detail` VALUES (102900005115779, 1011010101, '花叶类', 5.35, '云南生菜', '生菜可壮筋骨，利五脏，开利胸膈，疏通经脉，益脾气，吃了令人牙齿变白，精神饱满，减少睡眠；煮来吃，具有解热毒、酒毒，止消渴，利大小肠的作用，在《本草纲目》中有记载。生菜是西餐的必需蔬菜，西方国家对其重视，中国对其的需求也呈上升趋势，受到市民和酒店、宾馆欢迎，具有一定的经济价值。', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fss2.meipian.me%2Fusers%2F47224961%2F063536cc33eff614a858e7744f047de4.jpg%3Fmeipian-raw%2Fbucket%2Fivwen%2Fkey%2FdXNlcnMvNDcyMjQ5NjEvMDYzNTM2Y2MzM2VmZjYxNGE4NThlNzc0NGYwNDdkZTQuanBn%2Fsign%2F54a016f538c0085ebbba7de7008c829a.jpg&refer=http%3A%2F%2Fss2.meipian.me&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709044141&t=7e71c6291795faafaa52449381e12a4d', '云南', 3, 1, 4, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 1, 15.25);
INSERT INTO `web_commodity_detail` VALUES (102900005115786, 1011010101, '花叶类', 4.29, '竹叶菜', '又称饭包草，可入菜，可入药；鸭跖草科鸭跖草属，多年生匍匐草本植物。茎多分枝，上部直立，基部匍匐，节处生不定根，被疏柔毛。单叶互生，有明显的叶柄，叶片卵形或椭圆状卵形，全缘，边缘有毛。摘其嫩叶洗净，清炒或凉拌，味道清香； 入药有清热解毒、利水消肿等功效。 其叶花兼赏，叶形秀丽，小花蓝色，可用于园林湿生绿化，也可盆栽作观赏植物。', 'https://img0.baidu.com/it/u=2022995037,2754856397&fm=253&fmt=auto&app=138&f=JPEG?w=600&h=480', '山东', 1, 0, 64, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 13.62);
INSERT INTO `web_commodity_detail` VALUES (102900005115793, 1011010101, '花叶类', 10.05, '小白菜', '据测定，小白菜是蔬菜中含矿物质和维生素最丰富的菜。', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F4a05af40-27eb-404e-8e00-97e7eb73f177%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709044324&t=76ebc7083a6094b7982ca068d5159342', '陕西', 111, 0, 56, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 1, 7.59);
INSERT INTO `web_commodity_detail` VALUES (102900005115823, 1011010101, '花叶类', 6.25, '上海青', '上海青是一种小白菜，叶少茎多，菜茎白白的像葫芦瓢', 'https://p1.ssl.qhimg.com/t01472539910c3d5ba6.jpg', '上海', 77, 1, 45, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 1, 14.43);
INSERT INTO `web_commodity_detail` VALUES (102900005115861, 1011010101, '花叶类', 1.84, '牛首油菜', '喜冷凉，抗寒力较强的作物。', 'https://t9.baidu.com/it/u=2905230170,2874679475&fm=193', '广西', 6, 1, 32, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 12.17);
INSERT INTO `web_commodity_detail` VALUES (102900005115946, 1011010101, '花叶类', 4.31, '木耳菜', '全草可以入药。性味甘、苦，平。具有接筋续骨，消肿散。用于骨折，跌打损伤，风湿关节炎。', 'https://img0.baidu.com/it/u=2225729489,3626516625&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=375', '山东', 16, 0, 78, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 7.61);
INSERT INTO `web_commodity_detail` VALUES (102900005115960, 1011010101, '花叶类', 2, '大白菜', '白菜含丰富的维生素、膳食纤维和抗氧化物质，能促进肠道蠕动，帮助消化。', 'https://ts1.cn.mm.bing.net/th/id/R-C.db752b5a9355e4b5112d087ffa2ab873?rik=oI9yH7oW0YtlTA&riu=http%3a%2f%2fimg.365diandao.com%2fStorage%2fShop%2f528%2fProducts%2f8129%2f1.png&ehk=V0XZJC4phgEvQ1TwZE3DkhguWDWYxCMAc1tIua%2b9eX4%3d&risl=&pid=ImgRaw&r=0', '山西', 68, 1, 30, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 22);
INSERT INTO `web_commodity_detail` VALUES (102900005115977, 1011010101, '花叶类', 6.29, '豌豆尖', '又被称为“豌豆尖”“龙须菜”，“龙须苗”．是以蔬菜豌豆的幼嫩茎叶、嫩梢作为食用的一种绿叶菜', 'https://img.yzcdn.cn/upload_files/2019/06/04/FmqqGWbNmYsyejyb4Yu15gLm6jXS.jpg%21middle.jpg', '湖北', 15, 0, 56, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 8.36);
INSERT INTO `web_commodity_detail` VALUES (102900005115984, 1011010101, '花叶类', 3.75, '云南油麦菜', '油麦菜是菊科莴苣属一年生草本植物。根系发达，主根较短，须根多分布在土壤浅层', 'https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2022%2F0826%2F800f82b5j00rh70on000xc000hs00hsm.jpg&thumbnail=660x2147483647&quality=80&type=jpg', '云南省武汉市蔡甸区大冶镇花山村', 21, 1, 10, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 12.81);
INSERT INTO `web_commodity_detail` VALUES (102900005116042, 1011010402, '水生根茎类', 7, '白莲藕', '白莲藕是山东省茌平县特产，藕身洁白，口感鲜嫩，脆甜清新，主藕5-6节，长约1.1-1.2米，稍节粗大，亩产2500公斤。\r\n生津凉血；《名医别录》中认为生藕性寒，能生津凉血；熟藕性温，能补脾益血，减少脂类的吸收。藕色白、质脆、味甜，具有较高的食用价值，早藕脆嫩作水果或凉拌菜生食，中、晚熟藕作蔬菜熟食，可炒、炖、烩、溜、蒸煮吃。', 'https://img0.baidu.com/it/u=2738406818,1535369178&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', '山东省茌平县欧村', 3, 0, 56, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 15.32);
INSERT INTO `web_commodity_detail` VALUES (102900005116219, 1011010504, '辣椒类', 16.53, '红尖椒', '除了含有丰富的胡萝卜素外，一根红辣椒还大约含有5000个国际单位的维生素A，可满足成年人的每天需求量', 'https://img2.baidu.com/it/u=2032125909,3189363820&fm=253&fmt=auto&app=138&f=JPEG?w=670&h=456', '湖南', 8, 0, 70, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 6.73);
INSERT INTO `web_commodity_detail` VALUES (102900005116226, 1011010504, '辣椒类', 3.05, '青尖椒', '辣椒不但能给人带来好口感，还含有丰富的维生素C、叶酸、镁及钾等营养成分。还有温中散寒、开胃消食的功效。', 'https://ooo.0x0.ooo/2024/02/13/Ov27YD.jpg', '广东', 4, 0, 47, '2024-01-28 00:00:00', '2024-02-18 00:00:00', 0, 6.72);
INSERT INTO `web_commodity_detail` VALUES (102900005116233, 1011010504, '辣椒类', 8.39, '红椒', '红椒是菜椒的培育变种，属于茄科。有辛香味，能去除菜肴中的腥味，营养价值甚高', 'https://img2.baidu.com/it/u=870842531,2083936975&fm=253&fmt=auto&app=138&f=JPEG?w=624&h=500', '广西', 7, 0, 145, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 11.76);
INSERT INTO `web_commodity_detail` VALUES (102900005116714, 1011010201, '花菜类', 8.82, '西兰花', '西蓝花的平均营养价值及防病作用远远超出其他蔬菜，古代西方人曾把西蓝花称为“天赐的良药”“穷人的医生”。', 'https://gss0.baidu.com/70cFfyinKgQFm2e88IuM_a/baike/pic/item/8759287a24b1b1f52e73b304.jpg', '云南', 4, 0, 320, '2024-03-14 00:00:00', '2024-01-28 00:00:00', 0, 9.26);
INSERT INTO `web_commodity_detail` VALUES (102900005116806, 1011010101, '花叶类', 3.26, '黑油菜', '油菜花四片花瓣，整齐地围绕着花蕊，朴实个性。花瓣十分精致', 'https://ss3.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/baike/w=400/sign=4fa8b71ad554564ee565e53983df9cde/c9fcc3cec3fdfc0394b968b1dc3f8794a5c226f1.jpg', '浙江省杭州市淳安县千岛湖镇宋家村', 4, 1, 43, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 0.1);
INSERT INTO `web_commodity_detail` VALUES (102900005116905, 1011010504, '辣椒类', 10, '青杭椒', '它既是美味佳肴的好佐料，又是一种温中散寒、可用于食欲不振等症的食疗佳品', 'https://img.bdyoo.com/shop/store/goods/86/2020/09/86_06525281814333796.jpg-wh360', '江苏', 3, 1, 40, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 0);
INSERT INTO `web_commodity_detail` VALUES (102900005118817, 1011010101, '花叶类', 6.33, '菠菜', '菠菜口感清甜软滑，含有较高的蛋白质、维生素、胡萝卜素、铁等营养物质', 'https://img.yzcdn.cn/upload_files/2017/03/23/Fqw_XfarepV7NtS2nYJ4lZ1nSB03.png?imageView2/2/w/580/h/580/q/75/format/png', '山东省青岛市平度市辛寨子镇朱家房村', 21, 0, 80, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 18.51);
INSERT INTO `web_commodity_detail` VALUES (102900005118831, 1011010101, '花叶类', 2.95, '娃娃菜', '娃娃菜喜光照，属长日照作物，在高温、长日照的条件下能抽墓开花。', 'https://img2.baidu.com/it/u=1701913896,1450633120&fm=253&fmt=auto&app=138&f=JPEG?w=736&h=500', '河北省石家庄市井陉矿区陵园镇青云村', 2, 0, 94, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 2.48);
INSERT INTO `web_commodity_detail` VALUES (102900005125808, 1011010504, '辣椒类', 13.74, '小米椒', '在江西赣州、福建龙岩等地为小米椒的主要产地，最为著名的是江西赣州石城县，该地利用当地烤烟用的烤烟房对小米椒进行烘干，具有数量大、速度快，成本低等优点', 'https://www.cixinge.cn/rl_img/12384gq.jpg', '陕西', 5, 0, 56, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 5.86);
INSERT INTO `web_commodity_detail` VALUES (102900005128748, 1011010101, '花叶类', 65.41, '黄花菜', '黄花菜营养价值丰富，富含蛋白质、脂肪、糖类等，人们食用后常有舒畅安逸的感觉', 'https://ooo.0x0.ooo/2024/02/13/Ov2e5F.jpg', '辽宁省沈阳市法库县佟各庄镇马家房村', 4, 0, 72, '2024-01-28 00:00:00', '2024-02-15 00:00:00', 0, 16.89);
INSERT INTO `web_commodity_detail` VALUES (102900011000175, 1011010101, '花叶类', 4.68, '快菜', '快菜,快菜形像小白菜但比小白菜稍大,其具有生育期60天,白帮、直筒合抱、叶色浅绿的特征与特性。', 'https://t8.baidu.com/it/u=1995653633,2320262167&fm=193', '安徽省合肥市肥东县三河镇桃花村', 1, 0, 46, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 20.38);
INSERT INTO `web_commodity_detail` VALUES (102900011000328, 1011010504, '辣椒类', 9.11, '螺丝椒', '因为螺丝椒口感较辣，肉质鲜美，深受湖南等地人民的喜爱。', 'https://img1.baidu.com/it/u=3074433278,559417852&fm=253&fmt=auto&app=138&f=JPG?w=500&h=667', '湖北', 5, 0, 79, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 10.18);
INSERT INTO `web_commodity_detail` VALUES (102900011000335, 1011010501, '茄类', 2.51, '紫圆茄', '紫茄子性寒凉，味甘，具有清热活血、止痛消肿、祛风通络、利尿解毒等功效。', 'https://img2.baidu.com/it/u=1427067631,96291376&fm=253&fmt=auto&app=138&f=JPEG?w=700&h=416', '四川', 4, 0, 54, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 0.32);
INSERT INTO `web_commodity_detail` VALUES (102900011006689, 1011010101, '花叶类', 7.03, '东门口小白菜', '据测定，小白菜是蔬菜中含矿物质和维生素最丰富的菜。', 'https://ss3.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/baike/w%3D268/sign=212957888e5494ee8722081f15f4e0e1/4034970a304e251f473d32cfa586c9177f3e533b.jpg', '贵州省贵阳市清镇市龙沙镇平地村', 13, 1, 12, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 27.84);
INSERT INTO `web_commodity_detail` VALUES (102900011006955, 1011010101, '花叶类', 7.51, '冰草', '清热利湿；平喘；止血。主淋病；赤白带下；哮喘；咳痰带血；鼻衄', 'https://img.zhiwushuo.com/uploads/allimg/202148/20210608091521700.jpg', '江西省南昌市新建区黄马乡高枧村', 0, 0, 87, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 15.01);
INSERT INTO `web_commodity_detail` VALUES (102900011007464, 1011010101, '花叶类', 9.38, '本地小白菜', '白菜含丰富的维生素、膳食纤维和抗氧化物质，能促进肠道蠕动，帮助消化。', 'https://gss0.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/zhidao/wh=450,600/sign=0657eba83512b31bc739c52db3281a4c/3ac79f3df8dcd100cf7b8fce7e8b4710b8122f7d.jpg', '山东', 4, 0, 47, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 12.88);
INSERT INTO `web_commodity_detail` VALUES (102900011007471, 1011010101, '花叶类', 9.2, '薄荷叶', '可以健胃祛风、祛痰、利胆、抗痉挛，改善感冒发烧、咽喉、肿痛，并消除头痛、牙痛、恶心感。', 'https://ooo.0x0.ooo/2024/02/13/Ov2rA6.jpg', '湖北', 2, 1, 45, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 13.28);
INSERT INTO `web_commodity_detail` VALUES (102900011007969, 1011010402, '水生根茎类', 9.25, '红莲藕带', '藕带，古时称藕鞭、藕丝菜、银苗菜，又称藕心菜、藕梢、藕带、藕苗，藕带是莲（Nelumbo nucifera Gaertn.）的幼嫩根状茎，由根状茎顶端的一个节间和顶芽组成。植株的各个部分都可以入药，主要功效为散淤止血，去湿消风。炒、拌、煎、蒸、炸、熘、生吃皆可。既可作主料，又可作配料，荤素皆宜。最为有名的是清炒藕带和酸辣藕带这两道菜，但不管怎么吃，味道都是绝佳的。斜刀切成细长的段，用盐略腌制，烈火烹油放入红辣椒丝，翻炒片刻即可。成菜的藕带细脆无筋，清香浓郁，嫩、雅、朴、鲜、香、辣、爽，怎么形容它都不过分。利用藕带加工泡菜，如酸辣藕带、糖醋藕带等，也极受消费者欢迎。', 'https://cp1.douguo.com/upload/caiku/4/d/1/yuan_4dac410aa4dc2d578b8051fbd18a7b81.jpg', '安徽省蚌埠市蚌埠区小呜呼村', 5, 1, 23, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 16.63);
INSERT INTO `web_commodity_detail` VALUES (102900011008164, 1011010101, '花叶类', 3.2, '奶白菜', '性味甘、微寒，具有清热解毒、通利肠胃等作用。', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.alicdn.com%2Fi1%2F368994072%2FO1CN01RHU1Gz1fx1O77hmie_%21%21368994072.jpg&refer=http%3A%2F%2Fimg.alicdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709084153&t=a330db45c5bf0c6ddb519b03173e99bf', '山东', 3, 0, 66, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 15.68);
INSERT INTO `web_commodity_detail` VALUES (102900011008485, 1011010101, '花叶类', 3.86, '芥菜', '芥菜也被用于炒食，煮汤等，风味独特，而且芥菜有一种特殊的香气，可以促进人体的新陈代谢。', 'https://img0.baidu.com/it/u=2477835663,2749452975&fm=253&fmt=auto&app=138&f=JPEG?w=250&h=250', '四川', 8, 0, 54, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 13.75);
INSERT INTO `web_commodity_detail` VALUES (102900011008522, 1011010101, '花叶类', 3.98, '甜白菜', '性凉，味甘、苦，功能清热解毒，行瘀止血。', 'https://img1.baidu.com/it/u=1706945176,804624848&fm=253&fmt=auto&app=138&f=JPEG?w=512&h=500', '山东', 5, 0, 78, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 9.43);
INSERT INTO `web_commodity_detail` VALUES (102900011008577, 1011010801, '食用菌', 4.36, '常山猴头菇', '猴头菇在中国既是食用珍品，又是重要的药用菌。常山猴头菇，浙江省常山县特产，全国农产品地理标志。\r\n常山猴头菇的鲜菇色泽洁白或淡黄色，外形头状、球形至扁半球形，无柄，直径3～15厘米，肉质细嫩，表面密布针形菌刺，菌刺长0.2～1.5厘米。鲜品有猴头菇特有清香，口感嫩滑，成熟后味微苦；干品呈淡黄色至黄褐色，香味浓郁，味微苦。\r\n2015年11月05日，原中华人民共和国农业部批准对“常山猴头菇”实施国家农产品地理标志登记保护。', 'http://t15.baidu.com/it/u=4215243442,3997394384&fm=224&app=112&f=JPEG?w=500&h=500', '浙江省常山县特产农庄', 4, 0, 54, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 16.19);
INSERT INTO `web_commodity_detail` VALUES (102900011009277, 1011010402, '水生根茎类', 7.19, '黄陂荸荠', '黄陂荸荠个大、皮薄，黄陂荸荠具有球茎扁圆、脐平，表皮枣红色，肉脆色白、汁多渣少及味甜等，因其独特的口感和营养，明清时期成为朝廷贡品。黄陂荸荠，个大、皮薄，黄陂荸荠具有球茎扁圆、脐平，表皮枣红色，肉脆色白、汁多渣少及味甜等。荸荠有清热化痰、生津止渴和润燥滑肠的作用，并治阴虚肺燥、痰热咳嗽、肠胃积热等症。中医认为，荸荠性味甘、寒，具有清热化痰、开胃消食、生津润燥、明目醒酒等功效。', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.alicdn.com%2Fi1%2F2892479820%2FO1CN012xrv7D2MPc5IW7Mn3_%21%212892479820.jpg&refer=http%3A%2F%2Fimg.alicdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1712499397&t=2bd8528f07a0cf4a12761f97c71a3622', '湖北省武汉市黄陂区荸荠村', 5, 1, 36, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 11.02);
INSERT INTO `web_commodity_detail` VALUES (102900011010563, 1011010801, '食用菌', 80, '鸡枞菌', '鸡㙡菌是鹅膏菌科、蚁巢伞属真菌。鸡圾菌子实体散生、群生。分布于我国南方地区。鸡𭎂菌子实体散生、群生。菌盖直径3~20cm，初期圆锥形，后渐伸展，中央有显著的乳头状突起，淡褐色或灰褐色，脐突褐色，盖面往往呈辐射状撕裂，表面湿时粘，光滑。菌肉肥厚，白色。菌褶白色，后变为浅粉红色或米黄色，密，近离生至弯生，不等长。菌柄中生，圆柱形或近纺锤形，内实，纤维质，外表淡褐色或灰白色，内部白色，假根长度与地下蚁巢相连结，地上部分5~15cm，向上渐细，基部膨大，地下部分长10~30cm，向下渐细。孢子光滑，无色，椭圆形，7~9μmx5~6μm。孢子印近白色至浅黄色。囊状体棍棒形至圆柱形，顶端尖或圆钝，20-5μmx10-2μm。味美，食用价值极佳', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.alicdn.com%2Fimgextra%2Fi1%2F358588256%2FTB29pycmXXXXXcCXXXXXXXXXXXX_%21%21358588256.png&refer=http%3A%2F%2Fimg.alicdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709087707&t=86415dbbf5c679820abcba1515ff7569', '云南省昆明市鸡枞区鸡枞庄园', 4, 0, 89, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 11.93);
INSERT INTO `web_commodity_detail` VALUES (102900011011058, 1011010801, '食用菌', 65.98, '黑牛肝菌', '黑牛肝菌，是一种可食用的蘑菇。在欧洲，黑牛肝菌经常被拿来食用。外边和菌肉都是黑色的。味道鲜美，是最香的牛肝菌之一。夏季生马尾松，油茶林中地上。我国特有品种。其干片氨基酸的总量为15.3%。有人体必需氨基酸7种，占总量的39.5%；有\r\n其它氨基酸多种，占总量的60.25%。', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.alicdn.com%2Fbao%2Fuploaded%2Fi2%2F3261113866%2FO1CN01RQ6AB71eQfwww1R3A_%21%213261113866.jpg&refer=http%3A%2F%2Fimg.alicdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1712499694&t=36eb7c108ca0c0dfe8421ecbd1aae18f', '云南省思茅市普洱茶区小普洱村', 1, 0, 92, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 10.17);
INSERT INTO `web_commodity_detail` VALUES (102900011016909, 1011010501, '茄类', 6.91, '花茄子', '大花茄喜高温，耐热耐旱不耐寒，适宜排水良好的砂壤土。', 'https://inews.gtimg.com/newsapp_bt/0/12080548952/641', '山东', 4, 1, 45, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 6.98);
INSERT INTO `web_commodity_detail` VALUES (102900011018132, 1011010402, '水生根茎类', 10.2, '野生粉藕', '莲藕属睡莲科(Nelumbonaceae)莲属(Nelumbo)植物\r\n中医认为，生藕性寒，甘凉入胃，可消瘀凉血、清烦热，止呕渴。适用于烦渴、酒醉、咳血、吐血等症。妇女产后忌食生冷，惟独不忌藕，就是因为藕有很好的消瘀作用，故民间有“新采嫩藕胜太医”之说。熟藕，其性也由凉变温，有养胃滋阴，健脾益气的功效，是一种很好的食补佳品。而用藕加工制成的藕粉，既富营养，又易于消化，有养血止血，调中开胃之功效。藕含有多种营养及天冬碱、蛋白氨基酸、葫芦巴碱、干酷基酸、蔗糖、葡萄糖等。鲜藕含有20%的糖类物质和丰富的钙、磷、铁及多种维生素。', 'https://img0.baidu.com/it/u=3047502557,316472483&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', '广东省珠海市斗门区翻斗村', 4, 1, 34, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 12.69);
INSERT INTO `web_commodity_detail` VALUES (102900011018522, 1011010101, '花叶类', 3.98, '甜白菜', '性凉，味甘、苦，功能清热解毒，行瘀止血。', 'https://img1.baidu.com/it/u=1706945176,804624848&fm=253&fmt=auto&app=138&f=JPEG?w=512&h=500', '山东', 5, 0, 78, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 9.43);
INSERT INTO `web_commodity_detail` VALUES (102900011022764, 1011010501, '茄类', 4.6, '长线茄', '茄味甘，性寒，无毒。主治损人，动气，发疮等，', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.alicdn.com%2Fi4%2F914817250%2FO1CN01a1zJTf23QY2EWcRcm_%21%21914817250.jpg&refer=http%3A%2F%2Fimg.alicdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709086175&t=e7ebd27d633aa1f85316e206f0895421', '山东', 5, 1, 37, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 6.9);
INSERT INTO `web_commodity_detail` VALUES (102900011033920, 1011010101, '花叶类', 4.65, '黄心菜', '黄心菜抗逆性强，适应性广，产量高，适播期长，特耐低温', 'https://img11.360buyimg.com/n1/jfs/t1/147196/35/23103/85789/618e8bceEea996720/442dc282d3daad5d.jpg', '山东', 5, 0, 68, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 9.43);
INSERT INTO `web_commodity_detail` VALUES (102900011033999, 1011010501, '茄类', 6.19, '圆茄子', '可用于热毒痈疮、皮肤溃疡、口舌生疮、痔疮下血、便血、衄血等。', 'https://img2.baidu.com/it/u=1427067631,96291376&fm=253&fmt=auto&app=138&f=JPEG?w=700&h=416', '山东', 7, 1, 34, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 9.43);
INSERT INTO `web_commodity_detail` VALUES (102900011034224, 1011010101, '花叶类', 1.88, '小青菜', '青菜是蔬菜中含矿物质和维生素极丰富的菜，其所含的钙、维生素、胡萝卜素都比大白菜丰富，因此青菜也是中国常食用的蔬菜之一。', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.alicdn.com%2Fi2%2F56426271%2FTB2cHbgb4hmpuFjSZFyXXcLdFXa_%21%2156426271.jpg_310x310.jpg&refer=http%3A%2F%2Fimg.alicdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709084857&t=b788886dd86adb8afa3aafac00936072', '广东', 4, 1, 34, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 9.45);
INSERT INTO `web_commodity_detail` VALUES (102900011034323, 1011010101, '花叶类', 15.7, '鲜粽叶', '粽叶是“端午节”节日那天所食用的食物“粽子”必不可少的材料之一。', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fg-search1.alicdn.com%2Fimg%2Fbao%2Fuploaded%2Fi2%2F1695222839%2FO1CN01YC11fR1WqJA1jospP_%21%211695222839.jpg_300x300.jpg&refer=http%3A%2F%2Fg-search1.alicdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709084988&t=3067acdd8b449fdbffdc82d3a0359328', '山东', 2, 0, 87, '2024-01-28 00:00:00', '2024-01-28 00:00:00', 0, 0);
INSERT INTO `web_commodity_detail` VALUES (102900011034324, 1011010201, '花菜类', 2.5, '芥蓝', '芥蓝别名有白花芥蓝、羽衣甘蓝等。是十字花科芸苔属草本植物。芥蓝喜温和的气候，耐热性强，属长日照作物。', 'https://pic.baike.soso.com/ugc/baikepic2/20724/20220318190148-951406496_jpeg_724_544_64860.jpg/300', '广东', 12, 0, 60, '2024-02-13 10:27:50', '2024-02-13 16:54:02', 0, 5.1);
INSERT INTO `web_commodity_detail` VALUES (102900011034325, 1011010201, '花菜类', 5.83, '芥菜', '芥菜，十字花科芸苔属一年生草本植物。直立多分枝，基生叶倒卵形或宽卵形，顶端钝，基部楔形；总状花序顶生，花黄色；萼片淡黄色，直立开展；花瓣倒卵形；角果线形；种子球形，褐色。花期3-5月，果期5-6月。明《广群芳谱》说芥菜“其气味辛辣，有介然之义”，所以称为“芥菜”。', 'https://ts4.cn.mm.bing.net/th?id=OIP.NOlBHQB6H_F-h8tfHLxEGQAAAA&w=298&h=204&c=12&rs=1&qlt=99&pcl=faf9f7&bgcl=fffffe&r=0&o=6&pid=MultiSMRSV2Source', '云南', 20, 0, 90, '2024-02-13 16:56:14', '2024-02-13 16:56:14', NULL, 3.2);
INSERT INTO `web_commodity_detail` VALUES (102900111034326, 1011010101, '花叶类', 1, '唐王大白菜', '唐王大白菜，山东省济南市历城区特产，全国农产品地理标志。历城区唐王街道 素有“大白菜之乡”的美誉，境内地势平坦，土质肥沃，地下水资源丰富，水质甘洌，空气宜人，四季分明，出产的唐王大白菜比杂交白菜品种含水分少，干物质多，品质风味均属上乘，特别是经过贮藏后的白莱，心叶黄白，脆嫩清甜，味美可口，凉拌、炒炖俱佳，凭其高产耐贮、味美质佳等特点被誉为“济南四美蔬”之一。', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.alicdn.com%2Fi1%2F2202394993269%2FO1CN01R8GK5A1a1FN5J9s2v_%21%212202394993269.jpg&refer=http%3A%2F%2Fimg.alicdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1712499163&t=5a6b078f189afd7ac7ebbbabff395bbe', '山东省济南市历城区特产村', 1, 0, 90, '2024-02-13 17:05:07', '2024-02-13 17:05:07', 0, 1);

-- ----------------------------
-- Table structure for web_user_coupons
-- ----------------------------
DROP TABLE IF EXISTS `web_user_coupons`;
CREATE TABLE `web_user_coupons`  (
  `coupons_id` bigint NOT NULL AUTO_INCREMENT,
  `coupons_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expiration_time` int NOT NULL COMMENT '保质期',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `expiration_flag` int NOT NULL COMMENT '标志',
  `permission` int NULL DEFAULT NULL,
  `reduction_full` int NULL DEFAULT NULL,
  `reduction_price` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`coupons_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户优惠券表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of web_user_coupons
-- ----------------------------
INSERT INTO `web_user_coupons` VALUES (1, '品类券', 124, '2012-11-04 14:04:29', '2024-02-27 17:40:28', 0, 0, 10, 5, 200001);
INSERT INTO `web_user_coupons` VALUES (3, '现金券', 321, '2008-09-14 02:23:26', '2024-01-29 13:59:16', 0, 0, 15, 2, 200002);
INSERT INTO `web_user_coupons` VALUES (4, '折扣券', 93, '2004-10-11 23:47:04', '2024-01-29 20:49:59', 0, 0, 20, 5, 200003);
INSERT INTO `web_user_coupons` VALUES (5, '店铺优惠券', 10, '2004-09-10 21:28:04', '2024-01-29 21:44:22', 1, 0, 25, 8, 200004);
INSERT INTO `web_user_coupons` VALUES (6, '满减券', 79, '2009-03-05 14:48:47', '2024-01-29 16:57:26', 0, 0, 30, 9, 200005);
INSERT INTO `web_user_coupons` VALUES (7, '平台优惠券', 46, '2009-12-08 04:22:40', '2024-01-29 20:56:44', 0, 0, 35, 12, 200006);
INSERT INTO `web_user_coupons` VALUES (8, '品牌券', 62, '2019-05-19 15:35:53', '2024-01-29 10:01:42', 0, 0, 40, 15, 200007);
INSERT INTO `web_user_coupons` VALUES (9, '活动劵', 10, '2024-02-17 12:00:00', '2024-02-27 12:00:00', 1, 0, 15, 30, 200008);
INSERT INTO `web_user_coupons` VALUES (10, '限时优惠券', 15, '2024-02-12 12:00:00', '2024-02-27 12:00:00', 0, 0, 5, 25, 200009);
INSERT INTO `web_user_coupons` VALUES (11, '会员专享优惠券', 10, '2024-02-12 12:00:00', '2024-02-22 12:00:00', 1, 0, 6, 30, 200010);
INSERT INTO `web_user_coupons` VALUES (12, '品类券', 124, '2012-11-04 14:04:00', '2024-01-29 09:11:00', 0, 0, 1, 10, 200005);
INSERT INTO `web_user_coupons` VALUES (13, '现金券', 321, '2008-09-14 02:23:00', '2024-01-29 13:59:00', 0, 0, 2, 15, 200006);
INSERT INTO `web_user_coupons` VALUES (14, '折扣券', 93, '2004-10-11 23:47:00', '2024-01-29 20:49:00', 0, 0, 5, 20, 200007);
INSERT INTO `web_user_coupons` VALUES (15, '店铺优惠券', 10, '2004-09-10 21:28:00', '2024-01-29 21:44:00', 1, 0, 8, 25, 200008);
INSERT INTO `web_user_coupons` VALUES (16, '满减券', 79, '2009-03-05 14:48:00', '2024-01-29 16:57:00', 0, 0, 9, 30, 200009);
INSERT INTO `web_user_coupons` VALUES (17, '平台优惠券', 46, '2009-12-08 04:22:00', '2024-01-29 20:56:00', 0, 0, 12, 35, 2000010);
INSERT INTO `web_user_coupons` VALUES (18, '品牌券', 62, '2019-05-19 15:35:00', '2024-01-29 10:01:00', 0, 0, 15, 40, 200001);
INSERT INTO `web_user_coupons` VALUES (19, '活动劵', 10, '2024-02-17 12:00:00', '2024-02-27 12:00:00', 1, 0, 15, 30, 200002);
INSERT INTO `web_user_coupons` VALUES (20, '限时优惠券', 15, '2024-02-12 12:00:00', '2024-02-27 12:00:00', 0, 0, 5, 25, 200003);
INSERT INTO `web_user_coupons` VALUES (21, '会员专享优惠券', 10, '2024-02-12 12:00:00', '2024-02-22 12:00:00', 1, 0, 6, 30, 200004);

-- ----------------------------
-- Table structure for web_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `web_user_detail`;
CREATE TABLE `web_user_detail`  (
  `user_id` bigint(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `profile_image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `love` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `permission` int NULL DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200026 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of web_user_detail
-- ----------------------------
INSERT INTO `web_user_detail` VALUES (200001, 'jack', '123', 'https://img2.baidu.com/it/u=1356066100,1222147443&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500', '18', '水生根茎类,食用菌', '1', '04598722165', '2023-12-16 18:30:46', '2024-03-10 21:24:19', 0, '翻斗花园一楼一单元101室，翻斗花园一楼一单元102室');
INSERT INTO `web_user_detail` VALUES (200002, 'Rosed', '66666', 'https://s2.loli.net/2024/02/08/irATxF7owf16JWD.jpg', '38', '花菜类,茄类,食用菌', '0', '186911', '2023-12-20 18:12:43', '2024-03-10 21:27:35', 1, '汪汪小区，喵喵小区');
INSERT INTO `web_user_detail` VALUES (200003, 'Peter', 'GlNl2iqlEb', 'https://s2.loli.net/2024/02/08/Ds1nCMEFHOoQeAG.jpg', '49', '辣椒类,花菜类', '0', '13061145949', '2023-12-21 01:16:56', '2024-02-09 17:28:23', 1, '洞拐村大鸟驿站，他家村你家大鸟驿站');
INSERT INTO `web_user_detail` VALUES (200004, 'Andy', '7UAMGqEwrG', 'https://s2.loli.net/2024/02/08/DE9qcKdWQymIu8C.jpg', '25', '花菜类,食用菌', '1', '13578145299', '2024-01-21 18:38:42', '2024-02-09 17:28:26', 1, '斗气大陆乌坦城的萧家，斗气大陆云岚宗');
INSERT INTO `web_user_detail` VALUES (200005, 'Ava', 'yB7eEeakRd', 'https://s2.loli.net/2024/02/08/irATxF7owf16JWD.jpg', '23', '食用菌,辣椒类', '0', '13061194516', '2024-01-21 03:36:55', '2024-02-26 14:57:55', 1, '斗罗大陆史莱克学院，斗罗大陆魂王村');
INSERT INTO `web_user_detail` VALUES (200006, 'David', 'krj2jSV31R', 'https://s2.loli.net/2024/02/08/R8pBfGQwqFkaWnt.jpg', '40', '水生根茎类,辣椒类', '0', '17761194594', '2023-12-12 09:16:06', '2024-02-09 17:00:51', 1, '青州邬洲市大鸟驿站总局');
INSERT INTO `web_user_detail` VALUES (200007, 'William', 'gfx9vhOnBe', 'https://s2.loli.net/2024/02/10/dzQnjktuSAPXrOy.jpg', '19', '茄类,辣椒类', '0', '17861179759', '2024-01-27 01:43:39', '2024-02-09 17:28:40', 1, '寡妇村村头大树下');
INSERT INTO `web_user_detail` VALUES (200008, 'Amelia', 'J4E7u1zd19', 'https://s2.loli.net/2024/02/10/gSZ7O24NopXJamq.jpg', '47', '花菜类,茄类', '0', '13061194561', '2024-01-12 20:25:47', '2024-02-09 17:28:44', 1, '楚州幕府山大棒槌村');
INSERT INTO `web_user_detail` VALUES (200009, 'Charlotte', 'aMeGVNl6H1', 'https://s2.loli.net/2024/02/10/dzQnjktuSAPXrOy.jpg', '22', '茄类,花叶类', '1', '13061178654', '2024-01-14 20:45:34', '2024-02-09 17:28:46', 1, '徐州曹家大院');
INSERT INTO `web_user_detail` VALUES (200010, 'Daniel', 'T0FQ4d5dtl', 'https://s2.loli.net/2024/02/08/R8pBfGQwqFkaWnt.jpg', '21', '食用菌,茄类', '0', '13061178564', '2024-01-02 12:35:18', '2024-02-08 23:21:25', 0, '滁州龙兴城王二大街001号');

-- ----------------------------
-- Table structure for web_user_message
-- ----------------------------
DROP TABLE IF EXISTS `web_user_message`;
CREATE TABLE `web_user_message`  (
  `message_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL,
  `chat_flag` int NULL DEFAULT NULL,
  `chat_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chat_context` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `permission` int NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10011 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户/系统消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of web_user_message
-- ----------------------------
INSERT INTO `web_user_message` VALUES (10000, 200001, 0, '小明', '\"我们正在进行一次特别的促销活动，提供临期产品给我们的忠实客户。\"', '2022-11-23 21:41:05', '2024-01-11 13:11:13', 0, '临期促销!!!', '#');
INSERT INTO `web_user_message` VALUES (10001, 200004, 0, '小红', '\"祝您新年充满喜悦和成功，事事顺心如意！\"', '2000-02-17 04:00:41', '2012-07-04 11:23:35', 0, '新年快乐~', '#');
INSERT INTO `web_user_message` VALUES (10002, 200001, 1, '小乐', '亲，您看中的这款宝贝是有现货的呢，现在全场做活动，满xx有活动，您看一下。(推出活动特款)', '2000-10-28 22:40:39', '2008-01-25 08:32:09', 0, NULL, NULL);
INSERT INTO `web_user_message` VALUES (10003, 200001, 0, '小马', '\"愿新年带来亲朋好友的团聚和温馨时刻，祝您新年快乐，友谊长存！\"', '2018-02-17 00:14:00', '2023-10-04 19:45:52', 0, '龙年大吉!', '#');
INSERT INTO `web_user_message` VALUES (10004, 200009, 1, '小高', '\"非常抱歉，我们的产品目前缺货，我可以为您提供替代方案吗？\"', '2009-04-07 21:59:07', '2024-01-05 05:06:32', 0, NULL, NULL);
INSERT INTO `web_user_message` VALUES (10005, 200005, 0, '小郭', '\"我们直接从产地采购，将优质产品以更低的价格提供给我们的客户。\"', '2011-12-07 22:23:56', '2014-12-30 22:46:19', 0, '产地直销~', '#');
INSERT INTO `web_user_message` VALUES (10006, 200008, 1, '小张', '\"非常感谢您的支持和信任，如果您还有其他问题，随时联系我们，我们将竭诚为您服务。\"', '2010-09-09 23:54:43', '2023-06-16 12:16:56', 0, NULL, NULL);
INSERT INTO `web_user_message` VALUES (10007, 200009, 0, '小于', '\"我们的绿色健康产品经过严格的筛选和检测，确保它们符合高标准的质量和安全要求。\"', '2019-01-24 00:38:58', '2022-03-12 00:50:05', 0, '绿色健康，明智之选~', '#');
INSERT INTO `web_user_message` VALUES (10008, 200008, 1, '小憨', '\"您好，欢迎来到我们的客服中心！我是您的专属客服，有什么可以帮助您的？\"', '2019-05-27 02:11:43', '2021-05-07 18:29:42', 0, NULL, NULL);
INSERT INTO `web_user_message` VALUES (10009, 200004, 0, '小美', '\"感谢您在过去一年对我们的支持，祝您新年快乐，更加繁荣！\"', '2021-08-18 20:49:36', '2024-01-30 19:44:01', 0, '开年优惠~', '#');
INSERT INTO `web_user_message` VALUES (10010, 100001, 0, NULL, NULL, '2024-03-03 20:37:24', '2024-03-03 20:37:24', 0, NULL, NULL);

-- ----------------------------
-- Table structure for web_user_orders
-- ----------------------------
DROP TABLE IF EXISTS `web_user_orders`;
CREATE TABLE `web_user_orders`  (
  `orders_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL,
  `commodity_id` bigint NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  `flag` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `permission` int NULL DEFAULT NULL,
  `quantity` double NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  PRIMARY KEY (`orders_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105121 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of web_user_orders
-- ----------------------------
INSERT INTO `web_user_orders` VALUES (100001, 200006, 102900011009277, '2024-04-06 08:59:28', 0, '2024-03-29 16:06:10', '2024-04-04 18:16:25', 1, 1.89, 12.13);
INSERT INTO `web_user_orders` VALUES (100002, 200002, 102900005116226, '2024-04-07 02:31:53', 0, '2024-03-26 19:14:48', '2024-04-01 23:00:45', 1, 2.1, 7.41);
INSERT INTO `web_user_orders` VALUES (100003, 200007, 102900005118831, '2024-04-08 17:56:52', 0, '2024-03-23 14:30:58', '2024-03-29 10:45:59', 0, 1.84, 6.18);
INSERT INTO `web_user_orders` VALUES (100005, 200005, 102900011006689, '2024-04-07 21:54:51', 0, '2024-03-24 11:24:18', '2024-04-01 18:44:44', 1, 1.13, 6.44);
INSERT INTO `web_user_orders` VALUES (100006, 200008, 102900011034323, '2024-04-05 23:12:49', 0, '2024-03-23 17:22:39', '2024-04-04 19:13:18', 0, 1.96, 35.95);
INSERT INTO `web_user_orders` VALUES (100007, 200005, 102900005115960, '2024-04-08 04:28:31', 0, '2024-03-23 11:44:45', '2024-04-03 00:07:18', 0, 1.24, 2.21);
INSERT INTO `web_user_orders` VALUES (100008, 200009, 102900011033999, '2024-04-05 01:02:00', 0, '2024-03-23 22:07:50', '2024-04-04 10:02:16', 0, 1.66, 8.57);
INSERT INTO `web_user_orders` VALUES (100009, 200004, 102900005115861, '2024-04-06 03:25:06', 0, '2024-03-28 01:02:28', '2024-04-05 16:35:17', 0, 1.9, 3.5);
INSERT INTO `web_user_orders` VALUES (100010, 200010, 102900011034224, '2024-04-08 05:57:37', 0, '2024-03-28 16:38:36', '2024-03-29 22:34:33', 1, 1.3, 2.69);
INSERT INTO `web_user_orders` VALUES (100011, 200002, 102900211034326, '2024-04-08 13:02:56', 0, '2024-03-25 01:28:33', '2024-04-03 08:41:17', 1, 1.01, 1.13);
INSERT INTO `web_user_orders` VALUES (100012, 200010, 102900005125808, '2024-04-07 12:16:25', 0, '2024-03-24 03:47:42', '2024-04-04 21:06:12', 0, 2.13, 27.37);
INSERT INTO `web_user_orders` VALUES (100013, 200003, 102900005115960, '2024-04-05 17:22:18', 0, '2024-03-24 13:53:42', '2024-04-02 22:17:58', 1, 2.02, 3.64);
INSERT INTO `web_user_orders` VALUES (100015, 200002, 102900011011058, '2024-04-08 21:52:20', 0, '2024-03-24 22:01:16', '2024-04-01 18:27:20', 1, 2.17, 136.3);
INSERT INTO `web_user_orders` VALUES (100016, 200005, 102900005116042, '2024-04-05 06:01:15', 0, '2024-03-27 22:04:16', '2024-04-05 01:49:40', 0, 2.18, 17);
INSERT INTO `web_user_orders` VALUES (100017, 200005, 102900011034323, '2024-04-07 10:46:36', 0, '2024-03-27 02:12:25', '2024-04-03 13:40:32', 0, 2.17, 34.2);
INSERT INTO `web_user_orders` VALUES (100018, 200003, 102900211034326, '2024-04-08 07:10:54', 0, '2024-03-23 07:25:12', '2024-04-03 16:39:00', 0, 1.76, 1.85);
INSERT INTO `web_user_orders` VALUES (100019, 200005, 102900005115861, '2024-04-06 01:13:36', 0, '2024-03-25 03:15:55', '2024-04-05 19:16:34', 1, 1.28, 2.15);
INSERT INTO `web_user_orders` VALUES (100020, 200004, 102900005116219, '2024-04-06 09:23:15', 0, '2024-03-25 16:18:41', '2024-04-05 13:46:59', 0, 1.87, 34.45);
INSERT INTO `web_user_orders` VALUES (100021, 200002, 102900005115861, '2024-04-06 22:56:36', 0, '2024-03-26 00:51:21', '2024-03-31 07:51:14', 1, 1.89, 3.27);
INSERT INTO `web_user_orders` VALUES (100022, 200006, 102900005115984, '2024-04-06 08:29:50', 0, '2024-03-27 09:28:36', '2024-03-31 05:02:47', 1, 1.66, 6.71);
INSERT INTO `web_user_orders` VALUES (100023, 200004, 102900011008164, '2024-04-05 11:51:04', 0, '2024-03-29 21:27:20', '2024-03-31 08:31:51', 0, 1.99, 5.17);
INSERT INTO `web_user_orders` VALUES (100024, 200009, 102900011007969, '2024-04-06 20:59:29', 0, '2024-03-26 16:29:33', '2024-03-31 05:11:31', 1, 1.83, 15.87);
INSERT INTO `web_user_orders` VALUES (100025, 200002, 102900005116714, '2024-04-05 15:59:00', 0, '2024-03-29 13:13:10', '2024-03-30 01:48:35', 1, 1.78, 13.94);
INSERT INTO `web_user_orders` VALUES (100026, 200005, 102900005115946, '2024-04-05 16:11:23', 0, '2024-03-25 09:26:12', '2024-04-04 22:50:54', 0, 1.18, 4.25);
INSERT INTO `web_user_orders` VALUES (100027, 200009, 102900005115861, '2024-04-07 08:44:11', 0, '2024-03-23 13:36:45', '2024-04-04 19:17:30', 0, 2.18, 4.29);
INSERT INTO `web_user_orders` VALUES (100028, 200006, 102900011007969, '2024-04-05 10:19:41', 0, '2024-03-24 19:20:01', '2024-03-31 11:34:12', 0, 1.5, 11.43);
INSERT INTO `web_user_orders` VALUES (100029, 200008, 102900011034323, '2024-04-05 22:01:39', 0, '2024-03-27 09:52:32', '2024-04-05 08:54:44', 0, 1.05, 13.38);
INSERT INTO `web_user_orders` VALUES (100030, 200005, 102900011008522, '2024-04-08 13:10:58', 0, '2024-03-28 08:39:30', '2024-04-05 04:26:59', 0, 1.03, 3.33);
INSERT INTO `web_user_orders` VALUES (100031, 200008, 102900011018522, '2024-04-08 21:49:28', 0, '2024-03-28 21:53:48', '2024-04-05 20:06:04', 0, 1.09, 4);
INSERT INTO `web_user_orders` VALUES (100032, 200002, 102900005115625, '2024-04-07 04:47:59', 0, '2024-03-26 19:34:23', '2024-03-31 04:35:15', 0, 1.34, 4.01);
INSERT INTO `web_user_orders` VALUES (100033, 200001, 102900011018522, '2024-04-08 07:07:41', 0, '2024-03-26 08:25:33', '2024-04-03 15:59:16', 0, 1.74, 7.22);
INSERT INTO `web_user_orders` VALUES (100034, 200006, 102900011034326, '2024-04-07 19:43:17', 0, '2024-03-29 05:44:06', '2024-04-01 07:25:15', 1, 1.24, 1.08);
INSERT INTO `web_user_orders` VALUES (100035, 200003, 102900011007969, '2024-04-07 17:21:54', 0, '2024-03-24 11:38:49', '2024-04-04 23:30:36', 0, 1.26, 12.18);
INSERT INTO `web_user_orders` VALUES (100036, 200006, 102900011009277, '2024-04-07 00:33:59', 0, '2024-03-23 21:25:56', '2024-03-30 12:54:29', 1, 1.48, 9.21);
INSERT INTO `web_user_orders` VALUES (100037, 200005, 102900005115793, '2024-04-07 09:35:44', 0, '2024-03-29 15:15:29', '2024-04-01 19:37:36', 1, 1.74, 18.2);
INSERT INTO `web_user_orders` VALUES (100038, 200009, 102900011008577, '2024-04-06 23:27:23', 0, '2024-03-26 08:06:41', '2024-03-30 16:46:18', 1, 1.19, 6.15);
INSERT INTO `web_user_orders` VALUES (100039, 200001, 102900111034326, '2024-04-07 10:30:06', 0, '2024-03-28 19:51:59', '2024-04-03 06:39:49', 1, 1.44, 1.68);
INSERT INTO `web_user_orders` VALUES (100040, 200009, 102900111034326, '2024-04-07 08:30:34', 0, '2024-03-28 07:34:39', '2024-04-01 07:46:50', 0, 1.62, 1.83);
INSERT INTO `web_user_orders` VALUES (100041, 200009, 102900005128748, '2024-04-05 18:09:03', 0, '2024-03-29 04:14:59', '2024-03-30 14:02:33', 0, 1.7, 107.95);
INSERT INTO `web_user_orders` VALUES (100042, 200003, 102900011008577, '2024-04-08 10:59:40', 0, '2024-03-27 20:10:47', '2024-03-31 01:11:02', 0, 1.47, 6.84);
INSERT INTO `web_user_orders` VALUES (100043, 200001, 102900005118817, '2024-04-07 23:51:52', 0, '2024-03-24 08:26:18', '2024-03-29 08:46:02', 0, 1.21, 8.74);
INSERT INTO `web_user_orders` VALUES (100044, 200007, 102900011008164, '2024-04-07 16:08:35', 0, '2024-03-25 09:09:26', '2024-04-04 10:07:01', 0, 1.9, 5.36);
INSERT INTO `web_user_orders` VALUES (100045, 200010, 102900011006955, '2024-04-06 02:21:27', 0, '2024-03-26 23:25:11', '2024-03-29 10:49:25', 0, 1.89, 12);
INSERT INTO `web_user_orders` VALUES (100046, 200007, 102900005116905, '2024-04-08 15:32:31', 0, '2024-03-28 13:14:04', '2024-04-05 06:50:48', 1, 1.41, 13.37);
INSERT INTO `web_user_orders` VALUES (100047, 200010, 102900005118817, '2024-04-08 20:45:10', 0, '2024-03-24 18:27:32', '2024-03-31 03:09:01', 0, 1.99, 10.13);
INSERT INTO `web_user_orders` VALUES (100048, 200009, 102900011007471, '2024-04-06 01:03:51', 0, '2024-03-24 01:08:39', '2024-04-05 00:12:41', 1, 1.69, 17.75);
INSERT INTO `web_user_orders` VALUES (100049, 200008, 102900011016909, '2024-04-07 21:43:50', 0, '2024-03-27 05:53:05', '2024-04-04 20:31:10', 0, 1.64, 9.54);
INSERT INTO `web_user_orders` VALUES (100050, 200001, 102900005116219, '2024-04-06 15:22:56', 0, '2024-03-26 00:44:29', '2024-04-01 10:29:57', 1, 2.12, 33.09);
INSERT INTO `web_user_orders` VALUES (100051, 200004, 102900005128748, '2024-04-06 00:43:43', 0, '2024-03-27 10:33:10', '2024-03-31 05:29:33', 1, 2.19, 165.24);
INSERT INTO `web_user_orders` VALUES (100053, 200010, 102900005115786, '2024-04-07 03:29:40', 0, '2024-03-26 22:39:29', '2024-03-31 16:33:11', 0, 1.53, 6.69);
INSERT INTO `web_user_orders` VALUES (100054, 200004, 102900011034324, '2024-04-07 01:45:24', 0, '2024-03-25 16:03:55', '2024-03-30 07:06:40', 0, 1.5, 3.69);
INSERT INTO `web_user_orders` VALUES (100055, 200001, 102900005115984, '2024-04-05 16:33:42', 0, '2024-03-24 04:51:06', '2024-04-05 09:00:23', 1, 1.04, 4.34);
INSERT INTO `web_user_orders` VALUES (100056, 200007, 102900011034324, '2024-04-07 05:24:21', 0, '2024-03-29 18:03:12', '2024-04-01 11:42:55', 0, 1.97, 5.32);
INSERT INTO `web_user_orders` VALUES (100057, 200006, 102900005115779, '2024-04-06 05:18:20', 0, '2024-03-23 18:18:22', '2024-04-05 22:08:01', 1, 1.08, 5.14);
INSERT INTO `web_user_orders` VALUES (100058, 200006, 102900005115748, '2024-04-06 18:41:21', 0, '2024-03-29 21:37:52', '2024-04-03 18:18:24', 1, 2.11, 13.8);
INSERT INTO `web_user_orders` VALUES (100059, 200002, 102900011006955, '2024-04-05 15:33:49', 0, '2024-03-27 04:07:54', '2024-03-31 10:01:48', 1, 1.1, 8.27);
INSERT INTO `web_user_orders` VALUES (100060, 200007, 102900011033920, '2024-04-05 12:29:25', 0, '2024-03-24 01:09:40', '2024-03-30 04:57:33', 0, 1.31, 6.81);
INSERT INTO `web_user_orders` VALUES (100062, 200003, 102900005125808, '2024-04-05 07:01:18', 0, '2024-03-26 11:59:49', '2024-04-01 15:54:38', 1, 1.24, 17.89);
INSERT INTO `web_user_orders` VALUES (100063, 200008, 102900011022764, '2024-04-07 20:03:28', 0, '2024-03-24 21:19:04', '2024-03-30 06:13:11', 0, 1.62, 8.05);
INSERT INTO `web_user_orders` VALUES (100064, 200006, 102900011018522, '2024-04-05 18:11:31', 0, '2024-03-25 13:03:24', '2024-03-29 20:32:15', 0, 2.16, 9.42);
INSERT INTO `web_user_orders` VALUES (100065, 200003, 102900005116219, '2024-04-07 14:26:58', 0, '2024-03-27 00:00:47', '2024-04-01 06:32:20', 1, 1.94, 34.61);
INSERT INTO `web_user_orders` VALUES (100066, 200004, 102900005115984, '2024-04-07 05:22:14', 0, '2024-03-23 15:35:45', '2024-04-03 05:25:30', 1, 1.17, 4.57);
INSERT INTO `web_user_orders` VALUES (100067, 200001, 102900011007464, '2024-04-06 11:09:56', 0, '2024-03-28 10:05:16', '2024-04-01 12:42:42', 0, 1.73, 14.39);
INSERT INTO `web_user_orders` VALUES (100068, 200009, 102900005115946, '2024-04-05 10:49:01', 0, '2024-03-26 03:33:57', '2024-04-01 19:07:05', 0, 1.32, 6.12);
INSERT INTO `web_user_orders` VALUES (100069, 200003, 102900005115960, '2024-04-05 23:15:26', 0, '2024-03-25 19:26:26', '2024-03-30 08:12:06', 1, 1.77, 3.06);
INSERT INTO `web_user_orders` VALUES (100070, 200004, 102900011007471, '2024-04-05 10:55:10', 0, '2024-03-27 20:12:02', '2024-04-01 18:08:12', 0, 2.01, 20.4);
INSERT INTO `web_user_orders` VALUES (100071, 200009, 102900011009277, '2024-04-07 19:44:21', 0, '2024-03-23 08:05:49', '2024-04-05 01:00:28', 1, 1.31, 7.61);
INSERT INTO `web_user_orders` VALUES (100072, 200009, 102900011010563, '2024-04-07 17:27:32', 0, '2024-03-28 22:52:46', '2024-03-29 11:50:13', 0, 1.39, 113.76);
INSERT INTO `web_user_orders` VALUES (100073, 200003, 102900011018522, '2024-04-06 18:12:52', 0, '2024-03-26 11:28:31', '2024-04-03 22:00:31', 1, 1.98, 7.58);
INSERT INTO `web_user_orders` VALUES (100074, 200001, 102900011018522, '2024-04-06 10:22:45', 0, '2024-03-23 21:19:37', '2024-04-02 22:28:49', 0, 1.71, 7.44);
INSERT INTO `web_user_orders` VALUES (100075, 200001, 102900005118817, '2024-04-08 12:08:47', 0, '2024-03-23 11:54:19', '2024-03-30 17:08:18', 0, 2.05, 11.44);
INSERT INTO `web_user_orders` VALUES (100076, 200010, 102900011000335, '2024-04-05 06:59:51', 0, '2024-03-25 12:16:20', '2024-04-01 17:38:48', 1, 1.45, 3.31);
INSERT INTO `web_user_orders` VALUES (100078, 200005, 102900011018522, '2024-04-05 16:29:40', 0, '2024-03-23 07:04:22', '2024-03-30 07:21:41', 1, 2.14, 9.48);
INSERT INTO `web_user_orders` VALUES (100079, 200003, 102900005116233, '2024-04-06 15:09:35', 0, '2024-03-29 22:57:49', '2024-04-03 03:13:45', 1, 1.08, 10.79);
INSERT INTO `web_user_orders` VALUES (100081, 200002, 102900005115625, '2024-04-06 14:32:56', 0, '2024-03-27 03:43:59', '2024-03-31 21:35:00', 0, 1.82, 5.46);
INSERT INTO `web_user_orders` VALUES (100082, 200001, 102900011006689, '2024-04-07 06:03:37', 0, '2024-03-29 00:35:32', '2024-03-30 20:57:57', 0, 1.53, 11.58);
INSERT INTO `web_user_orders` VALUES (100083, 200007, 102900011034224, '2024-04-06 06:41:54', 0, '2024-03-26 09:11:38', '2024-04-02 16:16:11', 0, 1.17, 2.3);
INSERT INTO `web_user_orders` VALUES (100084, 200001, 102900011006689, '2024-04-08 17:50:10', 0, '2024-03-29 02:05:58', '2024-04-02 21:51:10', 1, 1.84, 13.54);
INSERT INTO `web_user_orders` VALUES (100085, 200006, 102900005125808, '2024-04-07 07:14:51', 0, '2024-03-25 08:29:13', '2024-03-29 12:43:23', 1, 2.19, 25.4);
INSERT INTO `web_user_orders` VALUES (100086, 200006, 102900005118831, '2024-04-07 16:23:25', 0, '2024-03-25 06:11:30', '2024-03-31 15:18:08', 0, 1.69, 5.07);
INSERT INTO `web_user_orders` VALUES (100087, 200008, 102900011008164, '2024-04-05 21:17:39', 0, '2024-03-26 10:30:00', '2024-04-02 14:52:18', 1, 2.17, 6.27);
INSERT INTO `web_user_orders` VALUES (100088, 200001, 102900005116714, '2024-04-05 12:11:42', 0, '2024-03-27 17:16:54', '2024-04-02 13:20:58', 0, 1.43, 10.24);
INSERT INTO `web_user_orders` VALUES (100089, 200005, 102900011007471, '2024-04-08 21:47:32', 0, '2024-03-29 10:36:43', '2024-04-05 03:20:50', 0, 1.09, 9.09);
INSERT INTO `web_user_orders` VALUES (100090, 200005, 102900005118817, '2024-04-05 14:53:23', 0, '2024-03-25 10:51:36', '2024-04-03 03:52:10', 0, 1.15, 8.17);
INSERT INTO `web_user_orders` VALUES (100091, 200007, 102900005118831, '2024-04-05 19:33:17', 0, '2024-03-23 22:18:16', '2024-03-30 10:14:52', 0, 1.8, 6.16);
INSERT INTO `web_user_orders` VALUES (100092, 200004, 102900011006955, '2024-04-06 21:33:05', 0, '2024-03-27 21:19:15', '2024-04-04 07:33:12', 1, 1.6, 13.44);
INSERT INTO `web_user_orders` VALUES (100093, 200005, 102900005115625, '2024-04-05 17:03:35', 0, '2024-03-29 16:39:37', '2024-04-05 16:19:14', 0, 1.59, 3.98);
INSERT INTO `web_user_orders` VALUES (100094, 200010, 102900011034224, '2024-04-05 17:59:33', 0, '2024-03-28 21:42:37', '2024-04-03 08:21:30', 0, 2.11, 3.78);
INSERT INTO `web_user_orders` VALUES (100095, 200010, 102900005116226, '2024-04-05 14:44:43', 0, '2024-03-29 15:48:16', '2024-04-05 04:35:53', 1, 1.17, 3.66);
INSERT INTO `web_user_orders` VALUES (100096, 200007, 102900011008577, '2024-04-05 01:13:31', 0, '2024-03-27 21:33:39', '2024-04-03 10:53:40', 0, 1.49, 6.06);
INSERT INTO `web_user_orders` VALUES (100097, 200007, 102900005118817, '2024-04-06 14:32:46', 0, '2024-03-29 10:08:20', '2024-04-02 12:06:03', NULL, 1.52, 8.41);
INSERT INTO `web_user_orders` VALUES (100098, 200006, 102900005115984, '2024-04-07 22:29:24', 0, '2024-03-29 21:00:58', '2024-04-02 21:03:45', 0, 1.73, 6.5);
INSERT INTO `web_user_orders` VALUES (100099, 200006, 102900005115823, '2024-04-05 23:46:54', 0, '2024-03-27 09:07:40', '2024-04-01 10:20:03', 1, 1.85, 9.31);
INSERT INTO `web_user_orders` VALUES (100100, 200005, 102900005115779, '2024-04-08 06:57:57', 0, '2024-03-25 08:27:32', '2024-04-01 19:01:46', 0, 2.13, 12.1);
INSERT INTO `web_user_orders` VALUES (100101, 200001, 102900011034324, '2024-04-06 15:44:22', 0, '2024-03-29 07:05:27', '2024-03-31 04:36:03', 0, 1.54, 3.51);
INSERT INTO `web_user_orders` VALUES (100102, 200010, 102900005115793, '2024-04-08 23:55:37', 0, '2024-03-29 17:43:57', '2024-04-05 15:57:48', 0, 1.08, 10.8);
INSERT INTO `web_user_orders` VALUES (100103, 200007, 102900111034326, '2024-04-08 21:51:22', 0, '2024-03-26 06:12:29', '2024-04-02 20:25:59', 0, 1.28, 1.4);
INSERT INTO `web_user_orders` VALUES (100104, 200010, 102900111034326, '2024-04-05 18:59:22', 0, '2024-03-28 07:56:05', '2024-04-02 17:40:30', 1, 2.04, 1.77);
INSERT INTO `web_user_orders` VALUES (100105, 200004, 102900005118831, '2024-04-05 19:56:23', 0, '2024-03-29 08:15:36', '2024-04-01 13:50:45', 1, 1.38, 3.3);
INSERT INTO `web_user_orders` VALUES (100106, 200007, 102900005118817, '2024-04-07 07:59:36', 0, '2024-03-28 08:51:07', '2024-04-04 02:50:34', 1, 1.23, 8.94);
INSERT INTO `web_user_orders` VALUES (100107, 200002, 102900005115861, '2024-04-08 11:38:29', 0, '2024-03-26 21:39:42', '2024-03-29 17:53:39', 0, 1.95, 3.33);
INSERT INTO `web_user_orders` VALUES (100108, 200001, 102900005115786, '2024-04-06 19:37:42', 0, '2024-03-27 22:40:08', '2024-03-30 06:32:30', 0, 1.33, 5.44);
INSERT INTO `web_user_orders` VALUES (100109, 200003, 102900005115793, '2024-04-05 06:04:00', 0, '2024-03-28 08:15:00', '2024-04-05 00:52:11', 1, 1.11, 10.28);
INSERT INTO `web_user_orders` VALUES (100110, 200001, 102900005116042, '2024-04-06 05:05:11', 0, '2024-03-28 16:25:25', '2024-03-31 18:56:44', 0, 1.3, 8.54);
INSERT INTO `web_user_orders` VALUES (100111, 200005, 102900005125808, '2024-04-08 03:24:38', 0, '2024-03-24 12:03:58', '2024-04-03 18:49:42', 0, 2.17, 33.77);
INSERT INTO `web_user_orders` VALUES (100112, 200007, 102900005116714, '2024-04-07 07:48:18', 0, '2024-03-27 16:15:43', '2024-03-30 16:08:57', 0, 1.28, 12.03);
INSERT INTO `web_user_orders` VALUES (100113, 200004, 102900005115762, '2024-04-06 01:14:58', 0, '2024-03-26 23:25:49', '2024-03-29 21:22:11', 0, 1.76, 17.25);
INSERT INTO `web_user_orders` VALUES (100114, 200010, 102900005116226, '2024-04-08 16:36:43', 0, '2024-03-23 00:56:17', '2024-04-04 18:09:26', 1, 2.13, 5.71);
INSERT INTO `web_user_orders` VALUES (100115, 200009, 102900011008164, '2024-04-08 15:16:40', 0, '2024-03-28 10:15:21', '2024-03-29 04:04:58', 0, 1.18, 3.28);
INSERT INTO `web_user_orders` VALUES (100116, 200007, 102900011018522, '2024-04-08 02:39:52', 0, '2024-03-25 19:22:47', '2024-04-02 02:34:25', 1, 1.48, 5.85);
INSERT INTO `web_user_orders` VALUES (100117, 200008, 102900011008164, '2024-04-07 01:36:23', 0, '2024-03-29 11:30:25', '2024-04-04 09:07:31', 1, 1.24, 4.08);
INSERT INTO `web_user_orders` VALUES (100118, 200002, 102900005125808, '2024-04-07 07:59:21', 0, '2024-03-24 09:24:26', '2024-03-30 01:09:23', 1, 1.28, 17.28);
INSERT INTO `web_user_orders` VALUES (100119, 200010, 102900005115960, '2024-04-06 08:36:22', 0, '2024-03-23 23:09:07', '2024-04-03 01:57:29', 0, 1.71, 3.52);
INSERT INTO `web_user_orders` VALUES (100120, 200002, 102900005115823, '2024-04-07 04:35:50', 0, '2024-03-24 20:15:51', '2024-04-04 11:15:46', 1, 1.13, 7.96);
INSERT INTO `web_user_orders` VALUES (100121, 200010, 102900011008577, '2024-04-07 16:37:35', 0, '2024-03-24 16:06:33', '2024-04-03 05:30:37', 0, 1.91, 7.85);
INSERT INTO `web_user_orders` VALUES (100122, 200009, 102900005118831, '2024-04-06 10:10:10', 0, '2024-03-23 21:35:06', '2024-04-03 11:39:31', 0, 1.59, 4.5);
INSERT INTO `web_user_orders` VALUES (100123, 200004, 102900011034324, '2024-04-06 06:48:45', 0, '2024-03-25 00:15:38', '2024-04-02 13:48:10', 1, 1.6, 3.7);
INSERT INTO `web_user_orders` VALUES (100124, 200001, 102900011034324, '2024-04-08 12:20:53', 0, '2024-03-26 02:37:21', '2024-03-31 18:52:17', 0, 1.09, 2.64);
INSERT INTO `web_user_orders` VALUES (100125, 200006, 102900011006689, '2024-04-07 16:35:21', 0, '2024-03-28 08:06:14', '2024-04-05 11:56:42', 0, 2.07, 12.67);
INSERT INTO `web_user_orders` VALUES (100126, 200005, 102900011034324, '2024-04-08 22:01:55', 0, '2024-03-27 14:27:43', '2024-03-30 18:32:30', 1, 1.27, 3.26);
INSERT INTO `web_user_orders` VALUES (100127, 200010, 102900005115946, '2024-04-08 12:23:10', 0, '2024-03-23 10:54:45', '2024-04-05 17:10:14', 1, 1.25, 5);
INSERT INTO `web_user_orders` VALUES (100128, 200009, 102900005115762, '2024-04-07 03:14:09', 0, '2024-03-29 06:02:30', '2024-04-04 14:50:46', 1, 2.16, 28.27);
INSERT INTO `web_user_orders` VALUES (100129, 200008, 102900005115762, '2024-04-05 14:19:20', 0, '2024-03-27 02:59:53', '2024-03-31 20:46:36', 1, 1.68, 16.25);
INSERT INTO `web_user_orders` VALUES (100130, 200006, 102900011033920, '2024-04-05 16:28:54', 0, '2024-03-29 02:28:52', '2024-04-02 07:36:54', 0, 1, 4.83);
INSERT INTO `web_user_orders` VALUES (100131, 200004, 102900005116042, '2024-04-08 00:55:26', 0, '2024-03-29 10:51:00', '2024-04-01 10:17:01', 0, 2.18, 12.99);
INSERT INTO `web_user_orders` VALUES (100132, 200005, 102900005115984, '2024-04-08 21:42:38', 0, '2024-03-27 09:56:34', '2024-03-31 11:58:34', 1, 1.83, 5.67);
INSERT INTO `web_user_orders` VALUES (100133, 200008, 102900005118817, '2024-04-08 11:56:35', 0, '2024-03-29 00:57:40', '2024-03-30 15:15:39', 0, 1.31, 7);
INSERT INTO `web_user_orders` VALUES (100134, 200009, 102900011008577, '2024-04-07 20:36:06', 0, '2024-03-27 03:25:09', '2024-04-03 15:45:25', 0, 1.91, 8.17);
INSERT INTO `web_user_orders` VALUES (100135, 200003, 102900011007464, '2024-04-07 04:34:44', 0, '2024-03-23 15:25:00', '2024-04-02 11:43:23', 0, 1.01, 10.13);
INSERT INTO `web_user_orders` VALUES (100136, 200005, 102900011006689, '2024-04-06 03:17:05', 0, '2024-03-29 20:40:19', '2024-03-31 01:00:58', 0, 1.41, 10.63);
INSERT INTO `web_user_orders` VALUES (100137, 200009, 102900005118831, '2024-04-08 00:25:24', 0, '2024-03-25 23:56:59', '2024-03-31 18:58:39', 0, 1.46, 4.95);
INSERT INTO `web_user_orders` VALUES (100138, 200004, 102900011007464, '2024-04-06 03:16:15', 0, '2024-03-28 09:00:27', '2024-04-04 13:29:17', 0, 1.27, 11.99);
INSERT INTO `web_user_orders` VALUES (100139, 200005, 102900005116714, '2024-04-06 05:42:13', 0, '2024-03-29 13:55:47', '2024-04-05 19:01:39', 1, 2.08, 21.59);
INSERT INTO `web_user_orders` VALUES (100140, 200005, 102900011008522, '2024-04-05 00:32:17', 0, '2024-03-23 12:03:02', '2024-03-30 22:54:45', 0, 1.02, 3.66);
INSERT INTO `web_user_orders` VALUES (100141, 200009, 102900005116233, '2024-04-08 10:25:50', 0, '2024-03-28 09:12:09', '2024-04-03 15:26:01', 0, 1.26, 9.88);
INSERT INTO `web_user_orders` VALUES (100142, 200009, 102900005115762, '2024-04-07 17:06:56', 0, '2024-03-26 12:38:59', '2024-04-04 23:55:44', 0, 1.03, 9.79);
INSERT INTO `web_user_orders` VALUES (100143, 200007, 102900005116714, '2024-04-06 19:44:18', 0, '2024-03-24 07:55:51', '2024-03-31 00:27:33', 0, 1.53, 15.71);
INSERT INTO `web_user_orders` VALUES (100144, 200002, 102900011034324, '2024-04-05 22:01:23', 0, '2024-03-28 01:57:38', '2024-04-01 04:22:46', 0, 1.27, 3.06);
INSERT INTO `web_user_orders` VALUES (100145, 200001, 102900011008577, '2024-04-05 14:52:56', 0, '2024-03-23 02:33:38', '2024-03-31 09:06:43', 0, 1.41, 6.13);
INSERT INTO `web_user_orders` VALUES (100146, 200002, 102900005115946, '2024-04-06 21:57:32', 0, '2024-03-26 17:54:40', '2024-03-31 19:32:05', 0, 1.53, 7.24);
INSERT INTO `web_user_orders` VALUES (100147, 200003, 102900011007464, '2024-04-05 05:23:23', 0, '2024-03-29 17:18:21', '2024-04-02 04:27:42', 0, 1.45, 14.33);
INSERT INTO `web_user_orders` VALUES (100148, 200008, 102900011033999, '2024-04-05 23:42:36', 0, '2024-03-23 01:51:59', '2024-03-29 15:04:08', 0, 1.06, 6.19);
INSERT INTO `web_user_orders` VALUES (100149, 200002, 102900011033920, '2024-04-06 18:09:23', 0, '2024-03-23 06:13:17', '2024-04-05 00:28:59', 0, 1.76, 6.86);
INSERT INTO `web_user_orders` VALUES (100150, 200005, 102900011008164, '2024-04-08 17:36:23', 0, '2024-03-25 07:32:43', '2024-04-04 10:59:56', 0, 1.69, 5.58);
INSERT INTO `web_user_orders` VALUES (100151, 200002, 102900011008577, '2024-04-07 19:46:58', 0, '2024-03-25 03:42:44', '2024-03-29 20:30:27', 1, 1.22, 4.61);
INSERT INTO `web_user_orders` VALUES (100152, 200008, 102900011007969, '2024-04-08 12:39:26', 0, '2024-03-27 23:16:29', '2024-04-05 06:16:35', 1, 1.36, 15.07);
INSERT INTO `web_user_orders` VALUES (100153, 200001, 102900011011058, '2024-04-05 13:40:13', 0, '2024-03-25 14:04:51', '2024-04-02 09:16:46', 0, 1.09, 68.23);
INSERT INTO `web_user_orders` VALUES (100154, 200004, 102900011000328, '2024-04-06 04:02:06', 0, '2024-03-26 00:27:27', '2024-04-01 18:46:22', 0, 1.77, 13.63);
INSERT INTO `web_user_orders` VALUES (100155, 200002, 102900011000335, '2024-04-06 05:16:04', 0, '2024-03-26 21:46:52', '2024-04-01 01:32:25', 0, 1.75, 4.94);
INSERT INTO `web_user_orders` VALUES (100156, 200010, 102900011034323, '2024-04-05 08:32:17', 0, '2024-03-28 01:43:41', '2024-04-02 04:56:51', 0, 1.16, 16.52);
INSERT INTO `web_user_orders` VALUES (100157, 200008, 102900011034326, '2024-04-06 12:01:00', 0, '2024-03-28 20:29:32', '2024-04-04 10:05:18', 1, 2.12, 2.42);
INSERT INTO `web_user_orders` VALUES (100158, 200008, 102900011034323, '2024-04-07 19:34:00', 0, '2024-03-27 10:48:43', '2024-04-05 10:18:30', 1, 1.54, 26.1);
INSERT INTO `web_user_orders` VALUES (100159, 200002, 102900005116806, '2024-04-07 18:22:22', 0, '2024-03-23 12:38:27', '2024-04-02 12:50:11', 0, 1.18, 4.07);
INSERT INTO `web_user_orders` VALUES (100160, 200010, 102900011033999, '2024-04-07 17:37:26', 0, '2024-03-28 19:12:00', '2024-04-02 00:42:36', 0, 1.96, 9.9);
INSERT INTO `web_user_orders` VALUES (100161, 200001, 102900005115793, '2024-04-05 20:44:43', 0, '2024-03-29 06:22:58', '2024-03-29 00:16:24', 1, 1.96, 22.83);
INSERT INTO `web_user_orders` VALUES (100162, 200003, 102900005115977, '2024-04-08 21:38:48', 0, '2024-03-24 11:33:14', '2024-04-05 09:25:15', 1, 1.09, 7.38);
INSERT INTO `web_user_orders` VALUES (100163, 200004, 102900005116219, '2024-04-06 01:11:32', 0, '2024-03-29 10:47:30', '2024-03-30 11:26:21', 0, 1.27, 17.27);
INSERT INTO `web_user_orders` VALUES (100164, 200004, 102900011007969, '2024-04-06 23:02:07', 0, '2024-03-27 19:03:26', '2024-03-29 06:51:23', 1, 1.73, 18.32);
INSERT INTO `web_user_orders` VALUES (100165, 200009, 102900011008485, '2024-04-07 22:40:36', 0, '2024-03-28 13:36:24', '2024-04-04 02:19:18', 1, 1.59, 7.01);
INSERT INTO `web_user_orders` VALUES (100166, 200007, 102900111034326, '2024-04-07 08:21:55', 0, '2024-03-27 07:01:50', '2024-03-30 04:11:51', 1, 1.98, 1.98);
INSERT INTO `web_user_orders` VALUES (100168, 200001, 102900005115977, '2024-04-07 05:46:42', 0, '2024-03-27 12:14:44', '2024-03-30 16:23:54', 1, 1.13, 5.74);
INSERT INTO `web_user_orders` VALUES (100169, 200005, 102900005115762, '2024-04-08 00:09:40', 0, '2024-03-29 18:17:27', '2024-03-29 07:38:11', 0, 1.91, 23.53);
INSERT INTO `web_user_orders` VALUES (100170, 200002, 102900011007471, '2024-04-05 22:52:09', 0, '2024-03-28 23:04:49', '2024-04-01 18:44:29', 1, 1.43, 13.74);
INSERT INTO `web_user_orders` VALUES (100171, 200009, 102900005115823, '2024-04-06 01:01:41', 0, '2024-03-27 18:00:49', '2024-04-01 12:50:18', 1, 2.18, 11.34);
INSERT INTO `web_user_orders` VALUES (100172, 200009, 102900011008164, '2024-04-05 01:52:01', 0, '2024-03-23 21:16:49', '2024-03-30 17:35:54', 0, 1.55, 4.09);
INSERT INTO `web_user_orders` VALUES (100173, 200009, 102900005115861, '2024-04-08 17:21:41', 0, '2024-03-29 02:39:21', '2024-04-01 16:47:11', 0, 2.1, 3.74);
INSERT INTO `web_user_orders` VALUES (100174, 200005, 102900005125808, '2024-04-06 18:38:33', 0, '2024-03-27 10:25:53', '2024-04-05 20:54:18', 0, 1.38, 17.76);
INSERT INTO `web_user_orders` VALUES (100175, 200007, 102900005115748, '2024-04-06 03:02:46', 0, '2024-03-29 22:51:49', '2024-04-04 05:48:45', 1, 1.91, 11.61);
INSERT INTO `web_user_orders` VALUES (100176, 200006, 102900011016909, '2024-04-05 04:33:06', 0, '2024-03-27 09:06:56', '2024-03-31 05:30:54', 1, 1.66, 11.24);
INSERT INTO `web_user_orders` VALUES (100177, 200001, 102900005116226, '2024-04-07 13:23:26', 0, '2024-03-27 21:17:44', '2024-04-02 07:37:56', 1, 1.73, 5.67);
INSERT INTO `web_user_orders` VALUES (100178, 200010, 102900011034326, '2024-04-08 04:54:29', 0, '2024-03-25 13:16:14', '2024-03-31 17:00:13', 1, 1.73, 2.06);
INSERT INTO `web_user_orders` VALUES (100179, 200003, 102900005116042, '2024-04-05 20:06:09', 0, '2024-03-27 09:54:55', '2024-03-31 10:52:28', 1, 1.05, 6.71);
INSERT INTO `web_user_orders` VALUES (100180, 200004, 102900005115960, '2024-04-06 18:44:44', 0, '2024-03-29 08:00:23', '2024-04-04 18:37:50', 0, 1.35, 2.84);
INSERT INTO `web_user_orders` VALUES (100181, 200009, 102900011016909, '2024-04-05 12:23:30', 0, '2024-03-26 19:56:34', '2024-04-05 00:08:28', 0, 1.26, 7.74);
INSERT INTO `web_user_orders` VALUES (100182, 200003, 102900011000335, '2024-04-08 01:53:29', 0, '2024-03-27 16:26:36', '2024-04-01 14:36:22', 1, 1.56, 4.15);
INSERT INTO `web_user_orders` VALUES (100183, 200002, 102900005115625, '2024-04-07 10:23:57', 0, '2024-03-27 20:51:33', '2024-04-01 15:28:22', 0, 2.05, 5.95);
INSERT INTO `web_user_orders` VALUES (100184, 200004, 102900111034326, '2024-04-05 03:14:03', 0, '2024-03-29 07:01:04', '2024-03-29 10:55:12', 0, 1.56, 1.28);
INSERT INTO `web_user_orders` VALUES (100185, 200006, 102900005115977, '2024-04-08 20:29:05', 0, '2024-03-23 13:54:03', '2024-04-02 15:15:18', 1, 2.09, 12.44);
INSERT INTO `web_user_orders` VALUES (100186, 200002, 102900005116226, '2024-04-08 00:18:15', 0, '2024-03-25 06:24:23', '2024-04-03 13:29:20', 0, 1.11, 3.23);
INSERT INTO `web_user_orders` VALUES (100187, 200007, 102900011034323, '2024-04-08 04:40:41', 0, '2024-03-29 20:36:48', '2024-03-30 13:50:46', 0, 1.76, 22.21);
INSERT INTO `web_user_orders` VALUES (100188, 200005, 102900005116905, '2024-04-06 16:24:01', 0, '2024-03-27 09:44:36', '2024-04-02 08:00:40', 1, 1.18, 12.83);
INSERT INTO `web_user_orders` VALUES (100190, 200003, 102900005115861, '2024-04-06 08:33:32', 0, '2024-03-29 05:42:42', '2024-04-01 04:07:33', 1, 1.17, 2.19);
INSERT INTO `web_user_orders` VALUES (100191, 200001, 102900005125808, '2024-04-08 02:08:31', 0, '2024-03-26 05:06:34', '2024-04-04 03:11:24', 0, 1.36, 21.47);
INSERT INTO `web_user_orders` VALUES (100192, 200005, 102900005116042, '2024-04-05 18:11:24', 0, '2024-03-23 23:33:14', '2024-04-02 22:10:23', 0, 1.56, 11.79);
INSERT INTO `web_user_orders` VALUES (100193, 200004, 102900011000328, '2024-04-06 22:47:10', 0, '2024-03-28 06:39:19', '2024-03-29 20:57:54', 0, 1.13, 10.03);
INSERT INTO `web_user_orders` VALUES (100194, 200002, 102900011011058, '2024-04-07 21:19:53', 0, '2024-03-27 16:08:49', '2024-04-03 02:32:08', 0, 2.03, 160.02);
INSERT INTO `web_user_orders` VALUES (100195, 200008, 102900011010563, '2024-04-08 00:25:13', 0, '2024-03-26 03:52:07', '2024-03-29 19:14:42', 0, 1.43, 129.31);
INSERT INTO `web_user_orders` VALUES (100196, 200003, 102900011006689, '2024-04-08 12:05:55', 0, '2024-03-25 02:53:21', '2024-03-29 05:39:36', 1, 1.07, 8.45);
INSERT INTO `web_user_orders` VALUES (100197, 200006, 102900111034326, '2024-04-05 07:40:12', 0, '2024-03-29 05:29:18', '2024-03-29 13:57:54', 1, 2.06, 2.45);
INSERT INTO `web_user_orders` VALUES (100198, 200002, 102900005116905, '2024-04-08 06:32:35', 0, '2024-03-27 11:31:29', '2024-04-05 10:41:53', 1, 1.23, 10.17);
INSERT INTO `web_user_orders` VALUES (100199, 200008, 102900005115960, '2024-04-06 23:44:00', 0, '2024-03-25 12:47:48', '2024-04-03 18:34:14', 0, 1.91, 3.97);
INSERT INTO `web_user_orders` VALUES (100200, 200002, 102900011033920, '2024-04-07 18:44:03', 0, '2024-03-29 05:31:23', '2024-03-29 18:23:55', 1, 1.89, 10.13);
INSERT INTO `web_user_orders` VALUES (100201, 200007, 102900011034323, '2024-04-06 03:24:56', 0, '2024-03-27 19:10:18', '2024-03-31 13:52:04', 1, 1.22, 17.57);
INSERT INTO `web_user_orders` VALUES (100202, 200009, 102900005116219, '2024-04-07 13:52:43', 0, '2024-03-23 22:55:48', '2024-03-30 16:02:10', 0, 2.08, 36.23);
INSERT INTO `web_user_orders` VALUES (100203, 200002, 102900011007969, '2024-04-06 07:22:17', 0, '2024-03-27 02:59:11', '2024-04-04 14:56:12', 0, 1.56, 14.01);
INSERT INTO `web_user_orders` VALUES (100204, 200008, 102900005115823, '2024-04-05 21:19:27', 0, '2024-03-23 05:36:22', '2024-04-01 06:56:30', 1, 1.88, 11.28);
INSERT INTO `web_user_orders` VALUES (100205, 200004, 102900005128748, '2024-04-07 04:56:20', 0, '2024-03-25 01:54:56', '2024-03-29 06:27:01', 1, 1.96, 143.24);
INSERT INTO `web_user_orders` VALUES (100207, 200002, 102900011007464, '2024-04-06 05:35:21', 0, '2024-03-24 21:38:23', '2024-04-05 03:55:50', 0, 1.68, 15.46);
INSERT INTO `web_user_orders` VALUES (100208, 200007, 102900005115960, '2024-04-07 22:48:39', 0, '2024-03-27 21:46:55', '2024-03-30 00:59:24', 1, 1.67, 3.26);
INSERT INTO `web_user_orders` VALUES (100209, 200010, 102900011008522, '2024-04-05 20:51:28', 0, '2024-03-25 17:12:56', '2024-04-04 02:22:48', 1, 1.58, 5.39);
INSERT INTO `web_user_orders` VALUES (100210, 200009, 102900005115861, '2024-04-08 02:07:56', 0, '2024-03-29 04:16:27', '2024-03-30 10:12:13', 1, 1.28, 2.6);
INSERT INTO `web_user_orders` VALUES (100211, 200008, 102900005116905, '2024-04-07 08:19:55', 0, '2024-03-24 23:39:54', '2024-03-29 19:54:38', 1, 1.1, 9.5);
INSERT INTO `web_user_orders` VALUES (100212, 200010, 102900005116233, '2024-04-06 16:08:51', 0, '2024-03-24 19:11:58', '2024-03-31 11:35:56', 1, 1.65, 12.36);
INSERT INTO `web_user_orders` VALUES (100213, 200010, 102900005115793, '2024-04-08 09:44:31', 0, '2024-03-29 23:53:35', '2024-04-02 09:37:28', 1, 1.63, 19.28);
INSERT INTO `web_user_orders` VALUES (100214, 200002, 102900011000328, '2024-04-05 05:30:59', 0, '2024-03-23 22:28:14', '2024-03-30 22:08:37', 0, 1.15, 11.8);
INSERT INTO `web_user_orders` VALUES (100216, 200003, 102900005115984, '2024-04-05 13:46:34', 0, '2024-03-26 04:56:25', '2024-03-31 17:51:01', 1, 2.18, 9.37);
INSERT INTO `web_user_orders` VALUES (100217, 200006, 102900011008485, '2024-04-08 06:18:37', 0, '2024-03-26 18:57:06', '2024-04-02 03:38:19', 1, 1.48, 5.51);
INSERT INTO `web_user_orders` VALUES (100218, 200001, 102900005115762, '2024-04-08 09:06:41', 0, '2024-03-25 16:15:06', '2024-04-05 01:11:46', 0, 2.01, 26.97);
INSERT INTO `web_user_orders` VALUES (100219, 200004, 102900005115861, '2024-04-06 08:49:11', 0, '2024-03-29 06:22:29', '2024-04-05 01:58:23', 0, 1.39, 2.78);
INSERT INTO `web_user_orders` VALUES (100220, 200006, 102900005115984, '2024-04-06 16:43:14', 0, '2024-03-28 16:47:39', '2024-04-04 10:07:04', 1, 1.72, 7.38);
INSERT INTO `web_user_orders` VALUES (100221, 200009, 102900011016909, '2024-04-07 13:14:25', 0, '2024-03-28 14:51:13', '2024-03-30 17:24:34', 1, 1.61, 13.15);
INSERT INTO `web_user_orders` VALUES (100222, 200002, 102900211034326, '2024-04-07 19:50:21', 0, '2024-03-24 10:34:19', '2024-04-02 19:04:16', 1, 1.3, 1.24);
INSERT INTO `web_user_orders` VALUES (100223, 200002, 102900005116226, '2024-04-06 12:17:45', 0, '2024-03-23 11:54:09', '2024-04-02 09:11:39', 1, 1.22, 4.11);
INSERT INTO `web_user_orders` VALUES (100224, 200001, 102900005115625, '2024-04-08 22:34:35', 0, '2024-03-25 15:25:41', '2024-03-31 16:49:14', 0, 1.31, 4.72);
INSERT INTO `web_user_orders` VALUES (100225, 200001, 102900011008164, '2024-04-07 09:51:46', 0, '2024-03-29 12:56:57', '2024-04-03 09:57:22', 0, 1.27, 3.45);
INSERT INTO `web_user_orders` VALUES (100226, 200006, 102900011007969, '2024-04-06 20:24:49', 0, '2024-03-29 10:28:40', '2024-04-03 21:51:44', 1, 2.13, 18.42);
INSERT INTO `web_user_orders` VALUES (100227, 200009, 102900011006689, '2024-04-05 14:20:08', 0, '2024-03-25 10:03:27', '2024-04-02 13:22:09', 0, 2.04, 13.34);
INSERT INTO `web_user_orders` VALUES (100228, 200007, 102900011008577, '2024-04-05 17:53:57', 0, '2024-03-23 17:15:21', '2024-04-05 03:28:49', 0, 1.04, 3.93);
INSERT INTO `web_user_orders` VALUES (100229, 200005, 102900011034324, '2024-04-05 06:58:51', 0, '2024-03-29 11:48:01', '2024-04-03 17:08:08', 0, 1.9, 4.26);
INSERT INTO `web_user_orders` VALUES (100230, 200001, 102900011007471, '2024-04-05 07:17:12', 0, '2024-03-29 03:40:25', '2024-03-31 07:42:45', 1, 2.13, 15.76);
INSERT INTO `web_user_orders` VALUES (100231, 200003, 102900005116226, '2024-04-07 20:39:15', 0, '2024-03-23 03:38:51', '2024-04-03 02:51:56', 1, 1.27, 3.24);
INSERT INTO `web_user_orders` VALUES (100232, 200010, 102900011008485, '2024-04-07 15:26:13', 0, '2024-03-23 08:44:04', '2024-04-04 08:28:11', 1, 1.93, 7.76);
INSERT INTO `web_user_orders` VALUES (100233, 200005, 102900011034325, '2024-04-08 18:22:09', 0, '2024-03-23 19:48:45', '2024-04-05 05:46:41', 0, 1.82, 11.1);
INSERT INTO `web_user_orders` VALUES (100234, 200002, 102900005116042, '2024-04-06 04:43:28', 0, '2024-03-27 23:57:46', '2024-04-02 23:36:49', 0, 1.03, 6.54);
INSERT INTO `web_user_orders` VALUES (100235, 200004, 102900011016909, '2024-04-07 12:58:00', 0, '2024-03-28 04:14:32', '2024-04-05 01:05:13', 0, 1.34, 9.59);
INSERT INTO `web_user_orders` VALUES (100236, 200007, 102900011008577, '2024-04-05 22:11:09', 0, '2024-03-27 09:40:06', '2024-03-31 20:24:41', 0, 1.13, 5.46);
INSERT INTO `web_user_orders` VALUES (100237, 200001, 102900011000335, '2024-04-08 03:45:24', 0, '2024-03-26 04:24:49', '2024-03-30 20:55:31', 0, 1.63, 3.78);
INSERT INTO `web_user_orders` VALUES (100238, 200009, 102900011000175, '2024-04-08 08:39:49', 0, '2024-03-29 18:53:25', '2024-04-04 14:41:32', 1, 2.19, 8.28);
INSERT INTO `web_user_orders` VALUES (100239, 200006, 102900011000335, '2024-04-05 04:57:02', 0, '2024-03-24 00:16:37', '2024-04-04 21:49:25', 0, 1.13, 2.85);
INSERT INTO `web_user_orders` VALUES (100240, 200006, 102900211034326, '2024-04-06 02:16:58', 0, '2024-03-28 19:19:45', '2024-04-04 02:57:49', 0, 1.26, 1.27);
INSERT INTO `web_user_orders` VALUES (100241, 200006, 102900011007969, '2024-04-06 06:19:22', 0, '2024-03-23 04:23:29', '2024-04-03 11:23:57', 1, 1.04, 9.91);
INSERT INTO `web_user_orders` VALUES (100242, 200004, 102900005115793, '2024-04-05 03:08:52', 0, '2024-03-29 18:22:41', '2024-04-04 11:07:13', 1, 1.92, 16.4);
INSERT INTO `web_user_orders` VALUES (100243, 200009, 102900011018132, '2024-04-06 09:02:01', 0, '2024-03-24 00:03:43', '2024-04-05 01:15:38', 1, 1.37, 12.19);
INSERT INTO `web_user_orders` VALUES (100244, 200003, 102900011008164, '2024-04-07 20:35:03', 0, '2024-03-24 18:43:05', '2024-04-03 03:30:44', 1, 2.17, 6.49);
INSERT INTO `web_user_orders` VALUES (100245, 200008, 102900005115960, '2024-04-07 03:56:06', 0, '2024-03-27 06:59:33', '2024-04-01 00:19:57', 1, 1.9, 4.16);
INSERT INTO `web_user_orders` VALUES (100246, 200007, 102900005116226, '2024-04-08 17:24:58', 0, '2024-03-27 18:02:45', '2024-03-30 08:45:14', 0, 1.5, 5.28);
INSERT INTO `web_user_orders` VALUES (100247, 200002, 102900011000335, '2024-04-08 08:36:48', 0, '2024-03-24 11:09:30', '2024-03-29 18:39:17', 0, 1.23, 2.82);
INSERT INTO `web_user_orders` VALUES (100248, 200008, 102900011007464, '2024-04-08 05:19:36', 0, '2024-03-27 06:12:48', '2024-04-01 20:05:37', 1, 2, 17.52);
INSERT INTO `web_user_orders` VALUES (100249, 200009, 102900005116226, '2024-04-07 06:35:16', 0, '2024-03-25 02:36:26', '2024-04-04 07:30:30', 0, 1.2, 4.14);
INSERT INTO `web_user_orders` VALUES (100250, 200008, 102900005116219, '2024-04-08 01:46:02', 0, '2024-03-27 03:00:16', '2024-03-30 23:40:04', 1, 1.78, 32.65);
INSERT INTO `web_user_orders` VALUES (100251, 200002, 102900011034323, '2024-04-08 20:40:16', 0, '2024-03-24 10:26:46', '2024-03-29 21:17:36', 0, 2.09, 29.18);
INSERT INTO `web_user_orders` VALUES (100252, 200002, 102900005115977, '2024-04-08 18:36:56', 0, '2024-03-24 04:53:49', '2024-04-04 13:40:16', 1, 1.47, 8.39);
INSERT INTO `web_user_orders` VALUES (100253, 200001, 102900011022764, '2024-04-06 15:55:34', 0, '2024-03-24 03:00:54', '2024-04-01 04:08:20', 1, 1.22, 4.76);
INSERT INTO `web_user_orders` VALUES (100254, 200010, 102900011008485, '2024-04-06 23:18:46', 0, '2024-03-26 22:24:16', '2024-03-30 17:28:28', 1, 1.05, 4.59);
INSERT INTO `web_user_orders` VALUES (100255, 200004, 102900011008485, '2024-04-08 14:31:55', 0, '2024-03-26 22:39:00', '2024-03-29 02:53:12', 1, 1.05, 4.41);
INSERT INTO `web_user_orders` VALUES (100256, 200005, 102900005116233, '2024-04-08 01:39:00', 0, '2024-03-28 21:09:02', '2024-04-03 16:56:45', 1, 1.56, 11.45);
INSERT INTO `web_user_orders` VALUES (100257, 200002, 102900011018132, '2024-04-07 04:32:00', 0, '2024-03-24 13:57:53', '2024-03-31 20:18:38', 1, 1.64, 14.04);
INSERT INTO `web_user_orders` VALUES (100258, 200006, 102900011018132, '2024-04-07 09:33:44', 0, '2024-03-24 08:22:30', '2024-03-29 22:38:04', 1, 2.08, 18.57);
INSERT INTO `web_user_orders` VALUES (100259, 200010, 102900011022764, '2024-04-06 13:56:23', 0, '2024-03-24 02:05:39', '2024-03-31 14:21:08', 0, 1.31, 6.52);
INSERT INTO `web_user_orders` VALUES (100260, 200004, 102900005116042, '2024-04-08 16:58:22', 0, '2024-03-26 08:42:01', '2024-04-02 15:20:35', 1, 1.93, 14.88);
INSERT INTO `web_user_orders` VALUES (100261, 200005, 102900011022764, '2024-04-07 18:44:28', 0, '2024-03-29 06:39:41', '2024-04-04 13:30:35', 0, 1.53, 8.31);
INSERT INTO `web_user_orders` VALUES (100262, 200001, 102900011034324, '2024-04-05 08:35:26', 0, '2024-03-25 11:32:27', '2024-03-30 12:37:18', 0, 1.52, 3.5);
INSERT INTO `web_user_orders` VALUES (100263, 200010, 102900011000175, '2024-04-08 20:26:38', 0, '2024-03-23 07:27:33', '2024-03-29 17:06:20', 0, 1.24, 4.91);
INSERT INTO `web_user_orders` VALUES (100264, 200005, 102900005115984, '2024-04-05 11:48:50', 0, '2024-03-23 19:38:36', '2024-04-02 09:36:31', 0, 2.16, 8.04);
INSERT INTO `web_user_orders` VALUES (100265, 200007, 102900011006955, '2024-04-08 11:46:53', 0, '2024-03-25 03:44:10', '2024-04-01 22:48:15', 0, 1.61, 10.08);
INSERT INTO `web_user_orders` VALUES (100266, 200010, 102900005116219, '2024-04-05 21:09:55', 0, '2024-03-23 02:23:46', '2024-03-29 10:34:13', 0, 2.08, 31.03);
INSERT INTO `web_user_orders` VALUES (100267, 200004, 102900005116233, '2024-04-06 20:24:14', 0, '2024-03-26 11:12:23', '2024-04-02 12:04:07', 0, 1.69, 12);
INSERT INTO `web_user_orders` VALUES (100268, 200001, 102900011006689, '2024-04-05 10:46:23', 0, '2024-03-27 20:39:27', '2024-03-31 16:28:38', 0, 2.02, 16.5);
INSERT INTO `web_user_orders` VALUES (100269, 200003, 102900005128748, '2024-04-05 04:11:27', 0, '2024-03-24 07:18:40', '2024-03-30 01:55:33', 0, 2.18, 124.41);
INSERT INTO `web_user_orders` VALUES (100270, 200001, 102900011008164, '2024-04-06 18:17:22', 0, '2024-03-24 21:28:04', '2024-03-29 01:16:30', 0, 2.16, 6.31);
INSERT INTO `web_user_orders` VALUES (100271, 200004, 102900005115793, '2024-04-08 13:57:37', 0, '2024-03-23 15:07:19', '2024-03-30 06:48:47', 0, 1.63, 18.11);
INSERT INTO `web_user_orders` VALUES (100272, 200010, 102900005116806, '2024-04-06 09:29:53', 0, '2024-03-25 05:43:36', '2024-04-05 07:30:24', 0, 1.29, 4.94);
INSERT INTO `web_user_orders` VALUES (100273, 200002, 102900011034323, '2024-04-08 13:44:58', 0, '2024-03-28 14:25:09', '2024-04-04 07:56:54', 1, 2.13, 38.98);
INSERT INTO `web_user_orders` VALUES (100274, 200004, 102900011011058, '2024-04-07 02:15:44', 0, '2024-03-24 17:23:31', '2024-04-05 17:24:59', 1, 1.89, 146.95);
INSERT INTO `web_user_orders` VALUES (100275, 200009, 102900005115946, '2024-04-06 04:08:05', 0, '2024-03-28 17:30:05', '2024-03-31 10:19:41', 0, 1.62, 7.68);
INSERT INTO `web_user_orders` VALUES (100276, 200007, 102900005115861, '2024-04-08 03:19:24', 0, '2024-03-24 17:16:54', '2024-03-29 21:02:27', 1, 1.23, 2.46);
INSERT INTO `web_user_orders` VALUES (100277, 200004, 102900011034323, '2024-04-06 02:56:40', 0, '2024-03-24 23:23:50', '2024-03-31 00:09:45', 0, 1.02, 18.74);
INSERT INTO `web_user_orders` VALUES (100278, 200003, 102900005116714, '2024-04-08 17:47:42', 0, '2024-03-23 14:25:39', '2024-04-02 15:14:50', 0, 1.69, 12.51);
INSERT INTO `web_user_orders` VALUES (100279, 200003, 102900005116219, '2024-04-08 03:51:38', 0, '2024-03-24 22:57:02', '2024-03-29 10:42:16', 1, 1.92, 32.43);
INSERT INTO `web_user_orders` VALUES (100281, 200010, 102900005115960, '2024-04-07 17:18:28', 0, '2024-03-26 00:47:20', '2024-04-05 13:34:28', 1, 1.56, 3.31);
INSERT INTO `web_user_orders` VALUES (100282, 200007, 102900005116042, '2024-04-05 20:53:59', 0, '2024-03-25 13:08:23', '2024-03-29 22:05:26', 1, 2.03, 13.34);
INSERT INTO `web_user_orders` VALUES (100283, 200009, 102900005118831, '2024-04-06 11:07:17', 0, '2024-03-27 06:58:32', '2024-04-05 05:19:13', 1, 1.18, 3.78);
INSERT INTO `web_user_orders` VALUES (100284, 200001, 102900011016909, '2024-04-07 19:55:24', 0, '2024-03-27 12:12:38', '2024-04-02 13:00:23', 1, 1.12, 7.39);
INSERT INTO `web_user_orders` VALUES (100285, 200004, 102900011000335, '2024-04-05 09:34:46', 0, '2024-03-27 19:55:09', '2024-04-04 18:58:44', 1, 1.75, 5.18);
INSERT INTO `web_user_orders` VALUES (100286, 200001, 102900011009277, '2024-04-06 15:16:41', 0, '2024-03-24 01:16:51', '2024-04-02 05:27:30', 0, 2.05, 14.99);
INSERT INTO `web_user_orders` VALUES (100287, 200006, 102900011022764, '2024-04-07 12:39:31', 0, '2024-03-26 05:52:31', '2024-04-05 16:37:27', 1, 1.1, 5.64);
INSERT INTO `web_user_orders` VALUES (100288, 200010, 102900005115977, '2024-04-08 17:58:34', 0, '2024-03-24 02:50:05', '2024-03-30 18:04:42', 0, 1.84, 9.81);
INSERT INTO `web_user_orders` VALUES (100289, 200004, 102900011008164, '2024-04-08 17:38:22', 0, '2024-03-25 10:43:26', '2024-04-04 12:52:49', 0, 1.59, 4.29);
INSERT INTO `web_user_orders` VALUES (100290, 200003, 102900011007969, '2024-04-08 22:54:39', 0, '2024-03-28 22:37:16', '2024-04-03 02:15:30', 1, 1.08, 8.08);
INSERT INTO `web_user_orders` VALUES (100291, 200003, 102900005115748, '2024-04-07 05:51:05', 0, '2024-03-27 01:10:21', '2024-04-04 01:43:19', 0, 2.07, 10.97);
INSERT INTO `web_user_orders` VALUES (100292, 200004, 102900011034323, '2024-04-05 21:00:27', 0, '2024-03-25 16:08:13', '2024-03-30 06:14:52', 0, 1.44, 23.49);
INSERT INTO `web_user_orders` VALUES (100293, 200006, 102900005115762, '2024-04-06 10:45:46', 0, '2024-03-28 15:52:50', '2024-04-04 07:18:07', 1, 2.07, 24.96);
INSERT INTO `web_user_orders` VALUES (100294, 200008, 102900011034224, '2024-04-05 00:06:38', 0, '2024-03-29 22:01:38', '2024-04-05 16:56:47', 1, 1.8, 3.15);
INSERT INTO `web_user_orders` VALUES (100295, 200007, 102900005116219, '2024-04-05 20:37:17', 0, '2024-03-24 08:22:53', '2024-03-31 04:25:21', 0, 1.8, 27.58);
INSERT INTO `web_user_orders` VALUES (100296, 200010, 102900011033999, '2024-04-05 22:47:57', 0, '2024-03-27 18:18:13', '2024-04-04 22:00:42', 1, 1.71, 8.53);
INSERT INTO `web_user_orders` VALUES (100297, 200005, 102900005116226, '2024-04-08 20:38:29', 0, '2024-03-28 04:41:35', '2024-03-31 21:44:12', 0, 1.36, 4.05);
INSERT INTO `web_user_orders` VALUES (100298, 200007, 102900005115823, '2024-04-08 19:34:36', 0, '2024-03-26 08:43:57', '2024-04-05 02:15:11', 0, 1.38, 7.73);
INSERT INTO `web_user_orders` VALUES (100299, 200008, 102900011008485, '2024-04-06 17:17:20', 0, '2024-03-26 00:17:19', '2024-04-02 23:13:15', 1, 1.32, 5.35);
INSERT INTO `web_user_orders` VALUES (100300, 200009, 102900005115786, '2024-04-05 08:39:27', 0, '2024-03-26 05:37:06', '2024-03-29 17:27:16', 0, 1.37, 6.32);
INSERT INTO `web_user_orders` VALUES (100301, 200008, 102900011008577, '2024-04-07 15:55:53', 0, '2024-03-28 03:58:16', '2024-04-03 12:41:51', 0, 1.6, 6.8);
INSERT INTO `web_user_orders` VALUES (100302, 200001, 102900005115625, '2024-04-07 05:50:06', 0, '2024-03-29 19:10:14', '2024-04-02 01:40:27', 1, 1.81, 4.51);
INSERT INTO `web_user_orders` VALUES (100303, 200010, 102900011033920, '2024-04-06 17:43:40', 0, '2024-03-23 17:50:29', '2024-03-30 18:02:41', 1, 1.41, 6.54);
INSERT INTO `web_user_orders` VALUES (100304, 200006, 102900011010563, '2024-04-05 02:00:40', 0, '2024-03-24 19:46:01', '2024-04-04 03:31:01', 0, 1.52, 131.08);
INSERT INTO `web_user_orders` VALUES (100305, 200002, 102900005116714, '2024-04-08 02:00:36', 0, '2024-03-23 11:34:53', '2024-04-05 06:37:09', 0, 1.21, 11.83);
INSERT INTO `web_user_orders` VALUES (100306, 200001, 102900011000335, '2024-04-07 17:16:55', 0, '2024-03-23 22:47:17', '2024-04-04 04:45:22', 1, 1.42, 3.44);
INSERT INTO `web_user_orders` VALUES (100307, 200007, 102900005116042, '2024-04-08 13:30:13', 0, '2024-03-27 10:27:02', '2024-04-01 18:42:52', 1, 1.03, 8.36);
INSERT INTO `web_user_orders` VALUES (100308, 200009, 102900011034326, '2024-04-08 19:10:10', 0, '2024-03-23 14:39:25', '2024-04-01 21:55:06', 1, 1.5, 1.44);
INSERT INTO `web_user_orders` VALUES (100309, 200006, 102900005116042, '2024-04-07 07:43:07', 0, '2024-03-28 23:36:10', '2024-04-03 12:42:52', 1, 1.87, 12.66);
INSERT INTO `web_user_orders` VALUES (100310, 200008, 102900011008577, '2024-04-07 23:26:54', 0, '2024-03-24 11:10:14', '2024-04-03 18:10:34', 1, 2.11, 8.67);
INSERT INTO `web_user_orders` VALUES (100311, 200007, 102900005116233, '2024-04-08 05:36:19', 0, '2024-03-23 08:37:53', '2024-03-30 04:20:48', 1, 1.02, 6.92);
INSERT INTO `web_user_orders` VALUES (100312, 200003, 102900111034326, '2024-04-07 06:41:37', 0, '2024-03-23 01:09:10', '2024-03-29 11:24:05', 1, 1.06, 0.92);
INSERT INTO `web_user_orders` VALUES (100313, 200007, 102900011000335, '2024-04-08 01:44:11', 0, '2024-03-24 23:13:26', '2024-04-05 15:09:36', 0, 1.86, 3.83);
INSERT INTO `web_user_orders` VALUES (100314, 200005, 102900011007471, '2024-04-06 08:40:56', 0, '2024-03-28 04:55:09', '2024-03-30 20:42:09', 0, 1.17, 10.96);
INSERT INTO `web_user_orders` VALUES (100315, 200008, 102900005115960, '2024-04-05 07:38:39', 0, '2024-03-26 20:25:47', '2024-03-31 16:13:59', 0, 1.35, 3.08);
INSERT INTO `web_user_orders` VALUES (100316, 200008, 102900005115786, '2024-04-07 18:45:52', 0, '2024-03-29 13:07:43', '2024-04-03 21:38:18', 1, 1.4, 5.12);
INSERT INTO `web_user_orders` VALUES (100317, 200010, 102900011018522, '2024-04-06 09:51:10', 0, '2024-03-29 19:00:47', '2024-03-31 01:56:48', 0, 1.79, 8.31);
INSERT INTO `web_user_orders` VALUES (100318, 200010, 102900011034224, '2024-04-08 02:11:38', 0, '2024-03-26 13:42:31', '2024-04-05 13:07:51', 1, 1.7, 2.79);
INSERT INTO `web_user_orders` VALUES (100319, 200006, 102900005116042, '2024-04-07 20:52:15', 0, '2024-03-25 21:30:28', '2024-03-30 16:38:40', 0, 1.15, 6.76);
INSERT INTO `web_user_orders` VALUES (100320, 200006, 102900005115977, '2024-04-07 10:54:06', 0, '2024-03-23 08:40:03', '2024-03-31 23:33:48', 1, 1.15, 6.75);
INSERT INTO `web_user_orders` VALUES (100321, 200008, 102900211034326, '2024-04-07 17:59:01', 0, '2024-03-28 11:31:18', '2024-04-01 03:55:25', 1, 1.34, 1.29);
INSERT INTO `web_user_orders` VALUES (100322, 200010, 102900005115748, '2024-04-06 23:16:23', 0, '2024-03-29 02:36:54', '2024-03-30 11:03:37', 0, 1.21, 7.13);
INSERT INTO `web_user_orders` VALUES (100323, 200001, 102900005115786, '2024-04-06 14:35:36', 0, '2024-03-24 11:44:25', '2024-03-31 12:47:24', 1, 2.02, 7.72);
INSERT INTO `web_user_orders` VALUES (100324, 200001, 102900011011058, '2024-04-08 00:11:38', 0, '2024-03-23 16:13:33', '2024-03-30 00:54:21', 1, 1.68, 95.88);
INSERT INTO `web_user_orders` VALUES (100325, 200005, 102900005115762, '2024-04-08 21:31:45', 0, '2024-03-24 15:58:07', '2024-04-03 18:17:54', 1, 1.14, 10.69);
INSERT INTO `web_user_orders` VALUES (100326, 200007, 102900011034224, '2024-04-06 02:10:33', 0, '2024-03-28 20:45:20', '2024-03-31 21:44:19', 1, 1.04, 2.32);
INSERT INTO `web_user_orders` VALUES (100327, 200005, 102900005116219, '2024-04-05 15:38:45', 0, '2024-03-27 04:34:17', '2024-03-29 01:07:41', 1, 1.83, 31.26);
INSERT INTO `web_user_orders` VALUES (100328, 200001, 102900011018132, '2024-04-08 12:54:42', 0, '2024-03-23 13:55:09', '2024-04-03 23:54:50', 1, 2, 19.82);
INSERT INTO `web_user_orders` VALUES (100329, 200006, 102900011000175, '2024-04-07 22:52:13', 0, '2024-03-29 15:26:39', '2024-04-03 20:00:39', 1, 1.77, 9.68);
INSERT INTO `web_user_orders` VALUES (100330, 200010, 102900005115779, '2024-04-05 08:39:08', 0, '2024-03-29 09:34:19', '2024-04-03 23:31:40', 1, 1.82, 10.28);
INSERT INTO `web_user_orders` VALUES (100331, 200005, 102900011033999, '2024-04-06 16:14:36', 0, '2024-03-23 16:24:47', '2024-04-04 17:39:24', 1, 1.19, 8.5);
INSERT INTO `web_user_orders` VALUES (100332, 200001, 102900011006689, '2024-04-05 00:57:25', 0, '2024-03-29 04:54:37', '2024-04-01 11:55:29', 0, 2.13, 12.23);
INSERT INTO `web_user_orders` VALUES (100333, 200005, 102900011008522, '2024-04-07 18:51:12', 0, '2024-03-25 19:54:21', '2024-04-01 17:23:41', 0, 1.47, 6.6);
INSERT INTO `web_user_orders` VALUES (100334, 200002, 102900005116905, '2024-04-08 15:56:44', 0, '2024-03-24 23:54:08', '2024-03-31 00:54:19', 0, 2.13, 19);
INSERT INTO `web_user_orders` VALUES (100335, 200008, 102900011033999, '2024-04-08 00:52:38', 0, '2024-03-24 12:19:54', '2024-04-05 10:19:43', 1, 1.4, 10.28);
INSERT INTO `web_user_orders` VALUES (100336, 200003, 102900005116226, '2024-04-06 13:37:20', 0, '2024-03-26 11:44:50', '2024-04-03 07:06:21', 1, 1.99, 5.41);
INSERT INTO `web_user_orders` VALUES (100337, 200006, 102900011018522, '2024-04-08 03:18:04', 0, '2024-03-26 16:25:15', '2024-03-29 05:29:01', 0, 1.8, 7.6);
INSERT INTO `web_user_orders` VALUES (100338, 200003, 102900011000335, '2024-04-06 13:25:05', 0, '2024-03-23 02:04:52', '2024-04-01 04:53:09', 0, 1.32, 3.15);
INSERT INTO `web_user_orders` VALUES (100339, 200004, 102900011010563, '2024-04-08 17:36:35', 0, '2024-03-26 07:46:35', '2024-04-05 00:23:03', 1, 1.11, 81.9);
INSERT INTO `web_user_orders` VALUES (100341, 200006, 102900011011058, '2024-04-06 02:48:48', 0, '2024-03-24 23:22:29', '2024-03-29 18:51:28', 0, 1.32, 83.71);
INSERT INTO `web_user_orders` VALUES (100342, 200001, 102900005116714, '2024-04-06 03:15:05', 0, '2024-03-23 13:34:34', '2024-03-30 11:10:21', 0, 1.27, 13.02);
INSERT INTO `web_user_orders` VALUES (100343, 200009, 102900011010563, '2024-04-07 20:50:43', 0, '2024-03-26 16:04:58', '2024-03-30 18:38:07', 1, 2.03, 166.42);
INSERT INTO `web_user_orders` VALUES (100344, 200001, 102900011008164, '2024-04-08 12:07:23', 0, '2024-03-24 12:38:22', '2024-04-03 09:05:36', 0, 1.29, 4.18);
INSERT INTO `web_user_orders` VALUES (100345, 200006, 102900011000175, '2024-04-08 04:50:05', 0, '2024-03-24 23:41:47', '2024-04-03 16:11:09', 1, 2.13, 8.35);
INSERT INTO `web_user_orders` VALUES (100346, 200008, 102900005116219, '2024-04-06 00:25:22', 0, '2024-03-25 05:45:50', '2024-03-30 17:59:17', 1, 1.77, 34.39);
INSERT INTO `web_user_orders` VALUES (100347, 200004, 102900005116233, '2024-04-07 23:07:09', 0, '2024-03-29 19:37:53', '2024-04-01 21:06:31', 1, 1.92, 12.9);
INSERT INTO `web_user_orders` VALUES (100348, 200007, 102900011007471, '2024-04-06 01:19:24', 0, '2024-03-27 20:55:10', '2024-04-05 20:19:43', 1, 1.87, 17.9);
INSERT INTO `web_user_orders` VALUES (100349, 200007, 102900005118831, '2024-04-06 14:24:14', 0, '2024-03-23 16:56:22', '2024-04-03 05:34:42', 1, 2.01, 5.71);
INSERT INTO `web_user_orders` VALUES (100350, 200008, 102900005118831, '2024-04-06 12:47:11', 0, '2024-03-29 01:25:43', '2024-04-03 05:29:59', 1, 1.63, 4.58);
INSERT INTO `web_user_orders` VALUES (100351, 200004, 102900011007464, '2024-04-05 15:56:52', 0, '2024-03-23 03:10:16', '2024-04-05 14:45:23', 0, 1.39, 13);
INSERT INTO `web_user_orders` VALUES (100352, 200007, 102900005116233, '2024-04-08 09:28:27', 0, '2024-03-26 14:15:11', '2024-04-04 10:52:15', 0, 1.58, 15.5);
INSERT INTO `web_user_orders` VALUES (100353, 200007, 102900005115984, '2024-04-05 12:02:53', 0, '2024-03-28 13:44:44', '2024-04-05 06:35:33', 1, 1.22, 3.9);
INSERT INTO `web_user_orders` VALUES (100354, 200002, 102900005116905, '2024-04-07 16:44:37', 0, '2024-03-24 15:13:31', '2024-04-03 10:33:52', 1, 1.14, 10.05);
INSERT INTO `web_user_orders` VALUES (100355, 200009, 102900005118831, '2024-04-06 04:57:47', 0, '2024-03-28 17:47:34', '2024-04-04 08:45:13', 1, 1.79, 5.67);
INSERT INTO `web_user_orders` VALUES (100356, 200005, 102900005115762, '2024-04-08 12:06:47', 0, '2024-03-23 21:15:45', '2024-04-04 05:12:32', 0, 1.53, 14.84);
INSERT INTO `web_user_orders` VALUES (100357, 200006, 102900005115762, '2024-04-07 18:24:38', 0, '2024-03-23 14:31:33', '2024-04-04 06:51:21', 1, 1.49, 17.66);
INSERT INTO `web_user_orders` VALUES (100358, 200009, 102900005115946, '2024-04-07 06:33:30', 0, '2024-03-24 01:28:55', '2024-04-04 11:49:26', 1, 2.04, 8.73);
INSERT INTO `web_user_orders` VALUES (100359, 200008, 102900005115793, '2024-04-05 18:03:09', 0, '2024-03-24 20:11:56', '2024-03-29 04:36:22', 0, 1.97, 20.49);
INSERT INTO `web_user_orders` VALUES (100360, 200003, 102900011000175, '2024-04-05 04:27:05', 0, '2024-03-24 16:24:10', '2024-03-29 10:28:39', 1, 1.62, 8.55);
INSERT INTO `web_user_orders` VALUES (100361, 200008, 102900005118831, '2024-04-07 17:22:07', 0, '2024-03-26 03:24:19', '2024-04-03 01:39:46', 0, 1.65, 4.41);
INSERT INTO `web_user_orders` VALUES (100362, 200003, 102900011008577, '2024-04-07 17:32:39', 0, '2024-03-27 00:57:25', '2024-04-02 18:58:34', 0, 1.83, 8.53);
INSERT INTO `web_user_orders` VALUES (100364, 200008, 102900011011058, '2024-04-06 08:23:31', 0, '2024-03-28 14:41:12', '2024-04-02 03:26:46', 1, 1.34, 84.86);
INSERT INTO `web_user_orders` VALUES (100365, 200006, 102900011008485, '2024-04-06 11:38:04', 0, '2024-03-28 11:52:22', '2024-04-03 03:36:10', 1, 1.18, 4.63);
INSERT INTO `web_user_orders` VALUES (100366, 200001, 102900005125808, '2024-04-05 09:41:40', 0, '2024-03-24 23:06:23', '2024-04-03 14:21:18', 0, 1.29, 18.33);
INSERT INTO `web_user_orders` VALUES (100367, 200008, 102900011007471, '2024-04-07 01:12:41', 0, '2024-03-23 07:30:53', '2024-04-01 14:52:27', 0, 1.26, 10.74);
INSERT INTO `web_user_orders` VALUES (100368, 200002, 102900005115823, '2024-04-06 04:42:25', 0, '2024-03-24 07:34:07', '2024-04-05 11:39:55', 0, 2.12, 14.46);
INSERT INTO `web_user_orders` VALUES (100369, 200007, 102900011008522, '2024-04-08 18:48:14', 0, '2024-03-25 16:34:02', '2024-04-01 03:16:13', 1, 2, 9.46);
INSERT INTO `web_user_orders` VALUES (100370, 200005, 102900011034324, '2024-04-07 04:32:33', 0, '2024-03-25 11:05:24', '2024-04-05 00:49:40', 0, 1.43, 4.13);
INSERT INTO `web_user_orders` VALUES (100371, 200002, 102900005125808, '2024-04-06 00:37:39', 0, '2024-03-26 17:37:53', '2024-04-01 12:35:19', 0, 1.44, 17.24);
INSERT INTO `web_user_orders` VALUES (100372, 200005, 102900005115946, '2024-04-07 07:30:12', 0, '2024-03-23 21:50:46', '2024-03-29 09:16:46', 0, 1.93, 7.84);
INSERT INTO `web_user_orders` VALUES (100373, 200008, 102900005118817, '2024-04-06 13:03:27', 0, '2024-03-24 15:55:26', '2024-04-02 21:53:32', 0, 1.53, 8.37);
INSERT INTO `web_user_orders` VALUES (100374, 200006, 102900011000328, '2024-04-05 17:27:11', 0, '2024-03-25 15:18:19', '2024-03-30 23:08:51', 1, 1.57, 16.44);
INSERT INTO `web_user_orders` VALUES (100375, 200003, 102900005116806, '2024-04-07 14:20:03', 0, '2024-03-24 08:57:47', '2024-04-01 13:56:04', 1, 2.15, 6.04);
INSERT INTO `web_user_orders` VALUES (100376, 200009, 102900005115625, '2024-04-06 03:00:23', 0, '2024-03-26 13:33:47', '2024-03-31 20:26:54', 1, 2.11, 5.42);
INSERT INTO `web_user_orders` VALUES (100377, 200001, 102900011011058, '2024-04-07 00:24:27', 0, '2024-03-23 17:02:06', '2024-04-04 20:29:38', 1, 2.14, 130.03);
INSERT INTO `web_user_orders` VALUES (100378, 200007, 102900005116905, '2024-04-05 23:24:00', 0, '2024-03-23 23:50:05', '2024-03-31 16:53:49', 0, 1.81, 17.74);
INSERT INTO `web_user_orders` VALUES (100379, 200006, 102900005116042, '2024-04-05 09:34:05', 0, '2024-03-24 15:30:15', '2024-03-31 18:29:26', 0, 1.29, 10.29);
INSERT INTO `web_user_orders` VALUES (100380, 200003, 102900011008577, '2024-04-08 10:42:54', 0, '2024-03-28 13:30:45', '2024-03-31 17:05:59', 1, 1.64, 6.05);
INSERT INTO `web_user_orders` VALUES (100381, 200006, 102900005118817, '2024-04-08 04:51:27', 0, '2024-03-29 00:19:26', '2024-04-05 04:59:28', 1, 2.16, 13.65);
INSERT INTO `web_user_orders` VALUES (100382, 200001, 102900011016909, '2024-04-05 06:39:27', 0, '2024-03-28 15:36:39', '2024-03-29 06:15:21', 1, 1.69, 11.22);
INSERT INTO `web_user_orders` VALUES (100383, 200003, 102900005115793, '2024-04-08 02:56:19', 0, '2024-03-27 05:51:58', '2024-04-04 03:09:51', 0, 1.33, 11.61);
INSERT INTO `web_user_orders` VALUES (100384, 200004, 102900011007464, '2024-04-05 06:48:29', 0, '2024-03-27 14:29:12', '2024-04-04 21:55:52', 0, 1.03, 10.16);
INSERT INTO `web_user_orders` VALUES (100385, 200010, 102900005116233, '2024-04-08 05:08:41', 0, '2024-03-28 02:50:32', '2024-04-03 13:18:01', 0, 1.06, 8.45);
INSERT INTO `web_user_orders` VALUES (100386, 200008, 102900011033920, '2024-04-08 18:13:08', 0, '2024-03-27 16:56:13', '2024-03-31 02:22:15', 1, 1.86, 8.54);
INSERT INTO `web_user_orders` VALUES (100387, 200008, 102900011034326, '2024-04-08 16:20:19', 0, '2024-03-27 03:15:10', '2024-04-03 18:32:53', 1, 1.22, 1.23);
INSERT INTO `web_user_orders` VALUES (100388, 200010, 102900011022764, '2024-04-07 22:25:08', 0, '2024-03-24 19:32:03', '2024-04-01 16:37:04', 0, 1.11, 5.87);
INSERT INTO `web_user_orders` VALUES (100389, 200006, 102900005115960, '2024-04-06 22:34:46', 0, '2024-03-25 12:17:24', '2024-04-01 00:58:18', 1, 1.12, 2.56);
INSERT INTO `web_user_orders` VALUES (100390, 200003, 102900011000328, '2024-04-07 14:21:53', 0, '2024-03-29 04:52:52', '2024-03-30 01:41:00', 0, 1.05, 9.93);
INSERT INTO `web_user_orders` VALUES (100391, 200004, 102900011034224, '2024-04-05 09:08:22', 0, '2024-03-29 10:25:47', '2024-04-01 06:23:38', 1, 2.03, 3.84);
INSERT INTO `web_user_orders` VALUES (100392, 200004, 102900011008522, '2024-04-05 20:22:34', 0, '2024-03-28 01:13:56', '2024-04-04 01:22:40', 0, 2.16, 7.95);
INSERT INTO `web_user_orders` VALUES (100393, 200001, 102900011033920, '2024-04-08 12:44:00', 0, '2024-03-24 04:53:55', '2024-03-29 09:49:51', 0, 1.8, 7.99);
INSERT INTO `web_user_orders` VALUES (100394, 200004, 102900005125808, '2024-04-08 04:00:01', 0, '2024-03-28 19:05:11', '2024-03-29 07:08:38', 0, 2.12, 29.13);
INSERT INTO `web_user_orders` VALUES (100395, 200003, 102900211034326, '2024-04-08 11:13:23', 0, '2024-03-25 02:09:01', '2024-04-02 15:10:50', 0, 1.85, 1.52);
INSERT INTO `web_user_orders` VALUES (100396, 200006, 102900011010563, '2024-04-05 00:00:23', 0, '2024-03-23 05:25:32', '2024-04-02 03:52:18', 1, 1.09, 79.06);
INSERT INTO `web_user_orders` VALUES (100397, 200006, 102900011011058, '2024-04-06 06:25:44', 0, '2024-03-26 19:58:01', '2024-04-02 12:23:47', 1, 1.12, 79.83);
INSERT INTO `web_user_orders` VALUES (100398, 200007, 102900005115960, '2024-04-08 18:22:29', 0, '2024-03-26 21:20:36', '2024-03-29 22:21:10', 0, 1.25, 2.91);
INSERT INTO `web_user_orders` VALUES (100399, 200007, 102900005116233, '2024-04-08 04:31:08', 0, '2024-03-25 15:28:49', '2024-04-02 17:25:55', 0, 2.17, 15.58);
INSERT INTO `web_user_orders` VALUES (100400, 200009, 102900005115779, '2024-04-08 05:00:15', 0, '2024-03-29 21:14:53', '2024-04-02 03:35:36', 1, 1.91, 9.66);
INSERT INTO `web_user_orders` VALUES (100401, 200010, 102900011034326, '2024-04-05 02:17:33', 0, '2024-03-25 22:55:44', '2024-04-05 20:15:01', 1, 1.65, 1.75);
INSERT INTO `web_user_orders` VALUES (100402, 200004, 102900005118831, '2024-04-05 13:48:21', 0, '2024-03-24 17:03:51', '2024-03-30 18:35:01', 0, 1.68, 5.78);
INSERT INTO `web_user_orders` VALUES (100403, 200002, 102900011009277, '2024-04-08 14:02:00', 0, '2024-03-24 18:46:24', '2024-04-05 04:35:23', 0, 2.04, 15.12);
INSERT INTO `web_user_orders` VALUES (100404, 200006, 102900011034224, '2024-04-07 02:47:28', 0, '2024-03-24 08:21:39', '2024-04-05 16:31:56', 0, 1.35, 2.78);
INSERT INTO `web_user_orders` VALUES (100405, 200009, 102900005115786, '2024-04-07 18:15:55', 0, '2024-03-25 05:24:23', '2024-04-03 15:28:21', 1, 1.99, 9.97);
INSERT INTO `web_user_orders` VALUES (100406, 200001, 102900011034324, '2024-04-05 01:06:07', 0, '2024-03-27 08:11:57', '2024-03-30 17:18:27', 0, 1.12, 3.07);
INSERT INTO `web_user_orders` VALUES (100407, 200009, 102900005118817, '2024-04-07 12:14:36', 0, '2024-03-27 10:25:49', '2024-04-02 17:51:14', 1, 1.48, 10.45);
INSERT INTO `web_user_orders` VALUES (100409, 200006, 102900011033920, '2024-04-05 04:43:51', 0, '2024-03-27 04:27:22', '2024-04-03 07:42:07', 0, 1.89, 8.24);
INSERT INTO `web_user_orders` VALUES (100410, 200009, 102900005116219, '2024-04-08 04:38:44', 0, '2024-03-25 19:46:49', '2024-04-01 01:13:44', 1, 1.58, 25.07);
INSERT INTO `web_user_orders` VALUES (100411, 200005, 102900011008164, '2024-04-07 10:15:57', 0, '2024-03-23 03:33:29', '2024-03-31 09:21:46', 0, 1.65, 5.31);
INSERT INTO `web_user_orders` VALUES (100412, 200002, 102900005116219, '2024-04-05 13:36:06', 0, '2024-03-28 15:12:28', '2024-04-05 02:46:39', 0, 2.14, 31.2);
INSERT INTO `web_user_orders` VALUES (100413, 200007, 102900211034326, '2024-04-06 06:40:38', 0, '2024-03-23 04:27:13', '2024-04-05 20:21:23', 1, 1.21, 1.09);
INSERT INTO `web_user_orders` VALUES (100414, 200010, 102900005118831, '2024-04-08 14:42:05', 0, '2024-03-29 04:40:48', '2024-03-31 23:20:15', 0, 1.93, 4.79);
INSERT INTO `web_user_orders` VALUES (100415, 200003, 102900005115786, '2024-04-06 15:29:29', 0, '2024-03-25 02:14:25', '2024-03-30 20:01:47', 1, 1.21, 5.37);
INSERT INTO `web_user_orders` VALUES (100416, 200001, 102900011034324, '2024-04-05 02:29:47', 0, '2024-03-24 02:52:12', '2024-04-05 17:17:51', 0, 1.49, 3.41);
INSERT INTO `web_user_orders` VALUES (100417, 200002, 102900005115779, '2024-04-07 03:22:14', 0, '2024-03-28 11:10:46', '2024-04-02 18:35:24', 0, 1.25, 5.78);
INSERT INTO `web_user_orders` VALUES (100418, 200001, 102900011034224, '2024-04-08 14:42:39', 0, '2024-03-25 22:25:18', '2024-04-02 10:24:17', 0, 1.22, 2.24);
INSERT INTO `web_user_orders` VALUES (100419, 200008, 102900011034326, '2024-04-07 01:45:24', 0, '2024-03-25 22:45:12', '2024-03-30 01:50:50', 0, 1.79, 2.13);
INSERT INTO `web_user_orders` VALUES (100420, 200004, 102900005116905, '2024-04-08 03:58:09', 0, '2024-03-25 15:38:10', '2024-03-31 00:26:03', 0, 2.06, 20.66);
INSERT INTO `web_user_orders` VALUES (100421, 200006, 102900011008485, '2024-04-05 12:33:55', 0, '2024-03-28 17:41:27', '2024-04-02 17:11:22', 0, 2.06, 9.17);
INSERT INTO `web_user_orders` VALUES (100422, 200007, 102900005116219, '2024-04-05 18:04:33', 0, '2024-03-24 17:54:06', '2024-04-03 08:29:30', 0, 1.92, 27.9);
INSERT INTO `web_user_orders` VALUES (100423, 200003, 102900011000175, '2024-04-08 15:09:45', 0, '2024-03-29 05:46:45', '2024-04-04 19:16:23', 1, 1.82, 9.61);
INSERT INTO `web_user_orders` VALUES (100424, 200006, 102900005115977, '2024-04-08 18:57:30', 0, '2024-03-23 09:43:21', '2024-04-03 13:46:42', 0, 1.07, 7.56);
INSERT INTO `web_user_orders` VALUES (100426, 200005, 102900005115960, '2024-04-08 04:19:27', 0, '2024-03-25 05:43:11', '2024-04-04 06:36:36', 0, 2.07, 3.33);
INSERT INTO `web_user_orders` VALUES (100427, 200010, 102900011034324, '2024-04-06 12:37:56', 0, '2024-03-28 14:47:13', '2024-03-29 20:52:13', 0, 1.47, 4.31);
INSERT INTO `web_user_orders` VALUES (100428, 200003, 102900005116219, '2024-04-07 16:52:47', 0, '2024-03-24 13:49:42', '2024-04-03 17:05:02', 0, 1.57, 26.77);
INSERT INTO `web_user_orders` VALUES (100429, 200001, 102900011000328, '2024-04-06 15:08:57', 0, '2024-03-28 04:08:24', '2024-04-01 07:57:08', 0, 1.57, 14.99);
INSERT INTO `web_user_orders` VALUES (100430, 200010, 102900011006955, '2024-04-05 17:41:33', 0, '2024-03-25 16:21:00', '2024-04-05 10:21:34', 0, 1.83, 14.33);
INSERT INTO `web_user_orders` VALUES (100431, 200008, 102900111034326, '2024-04-05 04:54:55', 0, '2024-03-26 00:30:54', '2024-04-02 11:47:42', 0, 2.14, 2.5);
INSERT INTO `web_user_orders` VALUES (100432, 200002, 102900011007969, '2024-04-06 01:34:00', 0, '2024-03-25 03:14:16', '2024-04-05 15:04:03', 1, 1.91, 14.27);
INSERT INTO `web_user_orders` VALUES (100433, 200006, 102900005115786, '2024-04-07 07:20:45', 0, '2024-03-27 15:38:39', '2024-04-04 14:27:15', 0, 2, 7.2);
INSERT INTO `web_user_orders` VALUES (100434, 200002, 102900111034326, '2024-04-08 20:04:07', 0, '2024-03-23 02:14:58', '2024-03-31 20:03:43', 0, 1, 1.09);
INSERT INTO `web_user_orders` VALUES (100435, 200002, 102900005115786, '2024-04-06 16:09:29', 0, '2024-03-29 21:58:56', '2024-04-03 01:14:07', 1, 1.68, 7.76);
INSERT INTO `web_user_orders` VALUES (100436, 200009, 102900011034323, '2024-04-06 14:30:35', 0, '2024-03-26 04:48:12', '2024-04-03 01:30:43', 1, 1.91, 32.72);
INSERT INTO `web_user_orders` VALUES (100437, 200009, 102900011034325, '2024-04-06 22:49:05', 0, '2024-03-28 08:54:04', '2024-03-30 10:14:23', 1, 1.42, 8.53);
INSERT INTO `web_user_orders` VALUES (100438, 200007, 102900005115625, '2024-04-06 08:22:26', 0, '2024-03-28 02:57:39', '2024-04-05 06:00:16', 0, 1.99, 5.75);
INSERT INTO `web_user_orders` VALUES (100439, 200005, 102900011000175, '2024-04-06 03:33:58', 0, '2024-03-26 22:29:42', '2024-03-31 15:05:37', 1, 1.67, 8.07);
INSERT INTO `web_user_orders` VALUES (100440, 200006, 102900005118817, '2024-04-07 23:11:02', 0, '2024-03-23 03:43:14', '2024-04-02 13:04:57', 1, 1.27, 7.65);
INSERT INTO `web_user_orders` VALUES (100441, 200010, 102900011033999, '2024-04-06 20:36:53', 0, '2024-03-28 20:07:57', '2024-03-29 11:19:06', 0, 1.26, 9.15);
INSERT INTO `web_user_orders` VALUES (100442, 200003, 102900011018522, '2024-04-07 23:04:35', 0, '2024-03-29 04:49:05', '2024-04-03 23:38:24', 0, 1.03, 3.82);
INSERT INTO `web_user_orders` VALUES (100443, 200008, 102900111034326, '2024-04-08 04:26:07', 0, '2024-03-24 17:54:06', '2024-04-04 10:08:18', 0, 1.68, 1.9);
INSERT INTO `web_user_orders` VALUES (100444, 200010, 102900011034323, '2024-04-05 12:26:45', 0, '2024-03-23 13:31:56', '2024-04-02 15:05:26', 0, 1.56, 27.69);
INSERT INTO `web_user_orders` VALUES (100445, 200001, 102900005115779, '2024-04-07 23:33:35', 0, '2024-03-24 07:05:20', '2024-03-31 04:31:48', 1, 1.89, 9.02);
INSERT INTO `web_user_orders` VALUES (100446, 200010, 102900005115946, '2024-04-07 02:05:58', 0, '2024-03-29 23:17:23', '2024-04-05 21:54:44', 0, 2.09, 10.35);
INSERT INTO `web_user_orders` VALUES (100447, 200008, 102900011034325, '2024-04-08 23:41:56', 0, '2024-03-27 10:04:31', '2024-04-05 00:14:35', 0, 1.75, 10.22);
INSERT INTO `web_user_orders` VALUES (100448, 200008, 102900005115823, '2024-04-07 18:07:59', 0, '2024-03-28 09:04:30', '2024-04-05 11:44:53', 1, 1.79, 12.39);
INSERT INTO `web_user_orders` VALUES (100449, 200003, 102900011033920, '2024-04-06 06:08:22', 0, '2024-03-29 23:44:42', '2024-04-01 23:14:42', 0, 2.05, 7.81);
INSERT INTO `web_user_orders` VALUES (100450, 200004, 102900011010563, '2024-04-06 21:04:12', 0, '2024-03-23 12:57:36', '2024-03-30 03:46:38', 0, 1.76, 114.14);
INSERT INTO `web_user_orders` VALUES (100451, 200009, 102900011000175, '2024-04-05 21:26:03', 0, '2024-03-23 09:27:45', '2024-03-31 07:15:17', 0, 1.27, 4.89);
INSERT INTO `web_user_orders` VALUES (100452, 200007, 102900005116905, '2024-04-08 14:31:51', 0, '2024-03-27 07:48:06', '2024-04-02 07:17:25', 1, 1.74, 20.08);
INSERT INTO `web_user_orders` VALUES (100453, 200006, 102900011007471, '2024-04-07 18:56:19', 0, '2024-03-24 12:38:46', '2024-04-05 12:11:30', 1, 1.71, 14.48);
INSERT INTO `web_user_orders` VALUES (100454, 200003, 102900005115823, '2024-04-06 02:19:39', 0, '2024-03-28 20:00:15', '2024-04-01 09:11:24', 0, 1.88, 12.99);
INSERT INTO `web_user_orders` VALUES (100455, 200002, 102900005118831, '2024-04-06 00:53:45', 0, '2024-03-28 17:53:50', '2024-04-04 23:36:10', 0, 1.74, 5.72);
INSERT INTO `web_user_orders` VALUES (100456, 200005, 102900011000175, '2024-04-05 01:32:43', 0, '2024-03-26 01:35:50', '2024-04-01 21:27:22', 1, 1.09, 4.16);
INSERT INTO `web_user_orders` VALUES (100457, 200004, 102900011008164, '2024-04-05 08:59:53', 0, '2024-03-28 19:42:04', '2024-03-29 23:07:32', 0, 2.16, 7.52);
INSERT INTO `web_user_orders` VALUES (100458, 200008, 102900011008164, '2024-04-08 00:40:42', 0, '2024-03-24 13:03:48', '2024-03-31 01:10:58', 0, 1.84, 5.54);
INSERT INTO `web_user_orders` VALUES (100459, 200004, 102900005115779, '2024-04-07 19:48:19', 0, '2024-03-27 23:03:04', '2024-03-29 21:16:06', 0, 1.76, 8.03);
INSERT INTO `web_user_orders` VALUES (100460, 200007, 102900111034326, '2024-04-07 04:31:12', 0, '2024-03-29 21:54:12', '2024-04-05 15:52:30', 1, 1.89, 1.76);
INSERT INTO `web_user_orders` VALUES (100461, 200005, 102900005125808, '2024-04-07 22:03:33', 0, '2024-03-28 00:56:30', '2024-03-31 11:22:33', 0, 1.43, 22.41);
INSERT INTO `web_user_orders` VALUES (100462, 200008, 102900005116042, '2024-04-06 18:53:19', 0, '2024-03-26 00:49:18', '2024-04-03 21:19:32', 0, 1.21, 7.9);
INSERT INTO `web_user_orders` VALUES (100463, 200007, 102900011007464, '2024-04-07 19:03:47', 0, '2024-03-26 01:56:20', '2024-03-30 19:59:09', 1, 1.15, 11.34);
INSERT INTO `web_user_orders` VALUES (100464, 200010, 102900011033920, '2024-04-08 10:29:55', 0, '2024-03-23 15:14:46', '2024-03-31 06:37:40', 1, 1.92, 10.58);
INSERT INTO `web_user_orders` VALUES (100465, 200005, 102900005115861, '2024-04-06 13:12:37', 0, '2024-03-23 10:21:24', '2024-03-30 08:14:27', 1, 1.6, 3.07);
INSERT INTO `web_user_orders` VALUES (100466, 200010, 102900011034324, '2024-04-07 20:09:04', 0, '2024-03-25 18:09:32', '2024-03-31 04:09:33', 1, 1.66, 4.88);
INSERT INTO `web_user_orders` VALUES (100467, 200006, 102900005128748, '2024-04-08 20:27:54', 0, '2024-03-28 01:14:29', '2024-04-02 04:25:07', 0, 1.03, 62.82);
INSERT INTO `web_user_orders` VALUES (100468, 200010, 102900005115748, '2024-04-08 20:53:17', 0, '2024-03-28 08:09:07', '2024-03-29 22:35:38', 1, 1.68, 10.52);
INSERT INTO `web_user_orders` VALUES (100469, 200008, 102900005118817, '2024-04-07 21:16:43', 0, '2024-03-27 09:52:18', '2024-03-31 11:43:48', 1, 1.63, 8.59);
INSERT INTO `web_user_orders` VALUES (100470, 200009, 102900005116233, '2024-04-06 00:10:16', 0, '2024-03-23 04:17:22', '2024-04-02 13:22:20', 1, 2.01, 19.98);
INSERT INTO `web_user_orders` VALUES (100471, 200005, 102900011008577, '2024-04-05 16:35:23', 0, '2024-03-26 14:21:58', '2024-04-01 16:02:44', 0, 1.34, 5.88);
INSERT INTO `web_user_orders` VALUES (100472, 200005, 102900011008485, '2024-04-06 07:31:24', 0, '2024-03-24 14:23:22', '2024-04-02 15:19:06', 0, 1.9, 6.5);
INSERT INTO `web_user_orders` VALUES (100473, 200008, 102900005115861, '2024-04-08 05:04:55', 0, '2024-03-23 03:33:57', '2024-03-29 12:52:41', 1, 1.96, 3.41);
INSERT INTO `web_user_orders` VALUES (100474, 200003, 102900011033999, '2024-04-05 05:10:48', 0, '2024-03-26 13:43:54', '2024-04-03 15:08:00', 1, 1.53, 7.99);
INSERT INTO `web_user_orders` VALUES (100475, 200003, 102900005128748, '2024-04-07 12:37:50', 0, '2024-03-26 15:40:52', '2024-04-05 17:06:15', 0, 1.26, 91.01);
INSERT INTO `web_user_orders` VALUES (100476, 200009, 102900011000335, '2024-04-08 10:25:43', 0, '2024-03-26 23:48:09', '2024-04-01 10:05:21', 0, 1.18, 2.91);
INSERT INTO `web_user_orders` VALUES (100477, 200004, 102900005115960, '2024-04-08 20:54:01', 0, '2024-03-23 17:20:09', '2024-03-31 23:34:17', 0, 2.03, 4.75);
INSERT INTO `web_user_orders` VALUES (100478, 200009, 102900011007969, '2024-04-05 10:30:23', 0, '2024-03-23 05:25:54', '2024-04-04 13:50:47', 0, 1.04, 9.21);
INSERT INTO `web_user_orders` VALUES (100479, 200007, 102900005116714, '2024-04-06 08:25:27', 0, '2024-03-23 21:17:16', '2024-04-02 00:17:25', 0, 2.05, 15.91);
INSERT INTO `web_user_orders` VALUES (100480, 200003, 102900005115946, '2024-04-07 01:08:27', 0, '2024-03-29 19:26:19', '2024-03-31 20:50:36', 1, 1.44, 5.52);
INSERT INTO `web_user_orders` VALUES (100481, 200010, 102900011011058, '2024-04-06 17:09:00', 0, '2024-03-25 23:48:21', '2024-04-05 00:03:55', 0, 1.01, 63.49);
INSERT INTO `web_user_orders` VALUES (100482, 200004, 102900005115823, '2024-04-08 03:47:02', 0, '2024-03-26 08:21:36', '2024-04-03 04:42:31', 1, 2.06, 11.74);
INSERT INTO `web_user_orders` VALUES (100483, 200007, 102900005115786, '2024-04-06 09:58:50', 0, '2024-03-28 01:22:37', '2024-03-29 08:16:14', 0, 1.9, 9.44);
INSERT INTO `web_user_orders` VALUES (100484, 200006, 102900011034325, '2024-04-05 01:59:50', 0, '2024-03-23 18:14:28', '2024-03-30 12:31:15', 0, 1.28, 7.45);
INSERT INTO `web_user_orders` VALUES (100485, 200003, 102900005116042, '2024-04-06 17:25:28', 0, '2024-03-28 03:36:42', '2024-03-30 23:17:38', 0, 1.93, 12.82);
INSERT INTO `web_user_orders` VALUES (100486, 200002, 102900005115779, '2024-04-06 09:48:56', 0, '2024-03-23 08:34:13', '2024-03-31 14:32:29', 1, 1.65, 9.16);
INSERT INTO `web_user_orders` VALUES (100487, 200006, 102900005115625, '2024-04-05 20:14:55', 0, '2024-03-29 10:30:39', '2024-04-01 20:32:29', 1, 1.41, 4.98);
INSERT INTO `web_user_orders` VALUES (100488, 200005, 102900011034325, '2024-04-05 17:24:05', 0, '2024-03-27 04:06:57', '2024-04-05 00:41:52', 1, 1.83, 11.14);
INSERT INTO `web_user_orders` VALUES (100489, 200010, 102900011007464, '2024-04-08 10:42:19', 0, '2024-03-23 10:41:11', '2024-04-04 08:18:30', 1, 2.18, 17.13);
INSERT INTO `web_user_orders` VALUES (100490, 200006, 102900011033999, '2024-04-07 07:28:54', 0, '2024-03-27 05:04:30', '2024-04-02 20:51:54', 1, 1.62, 9.27);
INSERT INTO `web_user_orders` VALUES (100491, 200002, 102900005115946, '2024-04-08 18:08:44', 0, '2024-03-28 12:53:16', '2024-04-03 23:36:17', 1, 1, 3.58);
INSERT INTO `web_user_orders` VALUES (100492, 200005, 102900011034326, '2024-04-07 08:31:38', 0, '2024-03-24 03:17:46', '2024-04-04 15:10:42', 1, 1.44, 1.5);
INSERT INTO `web_user_orders` VALUES (100493, 200006, 102900005115977, '2024-04-05 20:57:59', 0, '2024-03-24 03:38:26', '2024-04-02 18:49:26', 1, 2.15, 16.02);
INSERT INTO `web_user_orders` VALUES (100494, 200005, 102900005115946, '2024-04-06 02:42:22', 0, '2024-03-24 16:44:47', '2024-03-31 00:25:12', 1, 2.1, 9.85);
INSERT INTO `web_user_orders` VALUES (100495, 200009, 102900011008485, '2024-04-05 20:37:46', 0, '2024-03-27 09:46:07', '2024-04-02 17:52:57', 1, 2.02, 6.46);
INSERT INTO `web_user_orders` VALUES (100496, 200002, 102900011008577, '2024-04-08 13:44:13', 0, '2024-03-25 18:41:34', '2024-04-04 15:54:22', 1, 1.97, 9.71);
INSERT INTO `web_user_orders` VALUES (100497, 200010, 102900011006955, '2024-04-06 03:04:55', 0, '2024-03-24 16:16:26', '2024-04-02 00:54:51', 0, 1.87, 11.93);
INSERT INTO `web_user_orders` VALUES (100498, 200003, 102900011010563, '2024-04-06 22:08:33', 0, '2024-03-24 09:08:07', '2024-03-29 01:16:02', 1, 1.54, 141.08);
INSERT INTO `web_user_orders` VALUES (100499, 200009, 102900005115960, '2024-04-05 14:45:01', 0, '2024-03-29 05:41:53', '2024-04-01 00:48:18', 0, 2.17, 3.97);
INSERT INTO `web_user_orders` VALUES (100501, 200002, 102900011034326, '2024-04-06 07:32:55', 0, '2024-03-26 17:45:32', '2024-03-30 16:27:28', 0, 1.53, 1.7);
INSERT INTO `web_user_orders` VALUES (100502, 200002, 102900011022764, '2024-04-06 17:44:22', 0, '2024-03-29 17:48:43', '2024-03-31 14:35:11', 0, 1.72, 8.34);
INSERT INTO `web_user_orders` VALUES (100503, 200001, 102900011034224, '2024-04-08 08:17:51', 0, '2024-03-25 23:33:48', '2024-04-02 17:23:22', 0, 1.45, 3.23);
INSERT INTO `web_user_orders` VALUES (100504, 200007, 102900005116042, '2024-04-05 21:18:03', 0, '2024-03-28 07:08:55', '2024-03-29 08:17:57', 1, 1.82, 12.94);
INSERT INTO `web_user_orders` VALUES (100505, 200005, 102900005125808, '2024-04-08 21:07:07', 0, '2024-03-29 16:02:31', '2024-04-03 01:26:53', 1, 1.77, 25.35);
INSERT INTO `web_user_orders` VALUES (100506, 200001, 102900011006689, '2024-04-05 10:52:23', 0, '2024-03-25 02:56:46', '2024-03-30 18:43:24', 0, 1.12, 8.4);
INSERT INTO `web_user_orders` VALUES (100507, 200008, 102900005115762, '2024-04-06 07:14:26', 0, '2024-03-25 14:21:15', '2024-04-05 05:21:25', 0, 1.06, 10.72);
INSERT INTO `web_user_orders` VALUES (100508, 200002, 102900011011058, '2024-04-06 18:26:14', 0, '2024-03-27 10:17:59', '2024-03-29 15:33:24', 1, 1.05, 69.12);
INSERT INTO `web_user_orders` VALUES (100509, 200003, 102900011007464, '2024-04-08 21:24:44', 0, '2024-03-24 21:30:47', '2024-03-31 01:48:58', 0, 1.42, 12);
INSERT INTO `web_user_orders` VALUES (100510, 200005, 102900005116905, '2024-04-05 22:55:56', 0, '2024-03-28 02:09:37', '2024-03-30 09:47:13', 0, 1.27, 12.03);
INSERT INTO `web_user_orders` VALUES (100511, 200007, 102900011000328, '2024-04-08 12:10:54', 0, '2024-03-29 15:31:08', '2024-04-03 00:25:03', 1, 1.2, 11.9);
INSERT INTO `web_user_orders` VALUES (100512, 200001, 102900011008485, '2024-04-07 18:55:31', 0, '2024-03-23 20:15:33', '2024-04-01 01:39:47', 0, 1.13, 4.17);
INSERT INTO `web_user_orders` VALUES (100513, 200001, 102900011009277, '2024-04-05 12:23:42', 0, '2024-03-29 03:36:13', '2024-04-04 03:39:51', 1, 1.73, 14.24);
INSERT INTO `web_user_orders` VALUES (100514, 200006, 102900005116233, '2024-04-08 14:44:33', 0, '2024-03-28 18:25:41', '2024-04-05 00:40:38', 1, 1.6, 15.65);
INSERT INTO `web_user_orders` VALUES (100515, 200010, 102900011007969, '2024-04-06 17:42:54', 0, '2024-03-29 12:05:56', '2024-04-01 20:14:02', 1, 1.08, 10.42);
INSERT INTO `web_user_orders` VALUES (100516, 200001, 102900011000328, '2024-04-07 20:05:28', 0, '2024-03-24 12:24:12', '2024-04-05 12:14:19', 1, 1.99, 16.68);
INSERT INTO `web_user_orders` VALUES (100517, 200001, 102900005116714, '2024-04-05 00:06:29', 0, '2024-03-23 02:20:17', '2024-04-04 04:22:03', 0, 1.04, 8.27);
INSERT INTO `web_user_orders` VALUES (100518, 200009, 102900005125808, '2024-04-07 19:59:18', 0, '2024-03-28 23:29:06', '2024-03-29 22:53:02', 0, 1.22, 14.31);
INSERT INTO `web_user_orders` VALUES (100519, 200009, 102900011022764, '2024-04-06 06:29:11', 0, '2024-03-24 14:52:06', '2024-04-01 22:45:31', 1, 1.15, 4.75);
INSERT INTO `web_user_orders` VALUES (100520, 200004, 102900005116806, '2024-04-08 11:53:01', 0, '2024-03-29 18:54:50', '2024-04-02 01:30:55', 0, 1.99, 6.27);
INSERT INTO `web_user_orders` VALUES (100521, 200007, 102900005115762, '2024-04-08 05:43:55', 0, '2024-03-26 04:34:06', '2024-03-30 14:43:04', 0, 1.69, 20.18);
INSERT INTO `web_user_orders` VALUES (100522, 200001, 102900005115748, '2024-04-05 02:20:49', 0, '2024-03-23 19:09:47', '2024-03-29 03:54:40', 0, 1.58, 8.6);
INSERT INTO `web_user_orders` VALUES (100523, 200008, 102900011034323, '2024-04-07 07:21:45', 0, '2024-03-26 21:23:52', '2024-04-02 14:23:18', 1, 2.12, 29.7);
INSERT INTO `web_user_orders` VALUES (100524, 200001, 102900011008485, '2024-04-07 13:32:25', 0, '2024-03-29 04:06:19', '2024-04-03 23:33:16', 0, 1.43, 4.66);
INSERT INTO `web_user_orders` VALUES (100525, 200005, 102900005115946, '2024-04-06 18:35:25', 0, '2024-03-23 03:34:51', '2024-04-04 20:06:30', 1, 1.58, 5.7);
INSERT INTO `web_user_orders` VALUES (100526, 200005, 102900005116226, '2024-04-06 10:35:33', 0, '2024-03-27 15:17:50', '2024-04-02 18:47:53', 1, 1.01, 3.38);
INSERT INTO `web_user_orders` VALUES (100527, 200009, 102900005115793, '2024-04-05 02:13:36', 0, '2024-03-25 12:30:25', '2024-04-01 13:45:56', 1, 1.84, 16.82);
INSERT INTO `web_user_orders` VALUES (100528, 200003, 102900005115625, '2024-04-08 22:03:29', 0, '2024-03-27 12:59:33', '2024-04-01 12:52:45', 0, 1.32, 3.97);
INSERT INTO `web_user_orders` VALUES (100529, 200006, 102900011000328, '2024-04-08 18:24:20', 0, '2024-03-25 21:26:33', '2024-04-05 22:56:50', 1, 1.88, 14.66);
INSERT INTO `web_user_orders` VALUES (100530, 200006, 102900011006689, '2024-04-07 11:01:56', 0, '2024-03-29 21:47:31', '2024-04-01 11:53:41', 0, 1.61, 9.53);
INSERT INTO `web_user_orders` VALUES (100531, 200007, 102900011000328, '2024-04-05 06:59:24', 0, '2024-03-26 23:57:15', '2024-04-03 14:18:53', 0, 1.02, 10.26);
INSERT INTO `web_user_orders` VALUES (100532, 200008, 102900005115946, '2024-04-06 09:05:42', 0, '2024-03-24 12:48:03', '2024-04-02 16:51:31', 1, 1.9, 8.11);
INSERT INTO `web_user_orders` VALUES (100534, 200007, 102900011006689, '2024-04-08 20:33:50', 0, '2024-03-27 03:44:46', '2024-04-02 22:16:54', 0, 1.87, 15.54);
INSERT INTO `web_user_orders` VALUES (100535, 200008, 102900011006955, '2024-04-08 15:22:20', 0, '2024-03-23 13:49:59', '2024-04-02 08:14:56', 0, 1.72, 11.04);
INSERT INTO `web_user_orders` VALUES (100536, 200009, 102900005115779, '2024-04-07 14:43:49', 0, '2024-03-27 16:26:43', '2024-04-04 20:18:50', 0, 2.07, 9.03);
INSERT INTO `web_user_orders` VALUES (100537, 200003, 102900011010563, '2024-04-06 08:29:21', 0, '2024-03-28 19:36:28', '2024-03-31 13:21:27', 1, 1.62, 128);
INSERT INTO `web_user_orders` VALUES (100538, 200008, 102900011016909, '2024-04-05 01:11:46', 0, '2024-03-24 10:47:52', '2024-03-31 22:33:18', 1, 1.95, 13.85);
INSERT INTO `web_user_orders` VALUES (100539, 200002, 102900005115823, '2024-04-06 21:17:43', 0, '2024-03-25 16:55:44', '2024-04-02 01:15:47', 1, 1.56, 10.17);
INSERT INTO `web_user_orders` VALUES (100540, 200002, 102900011008522, '2024-04-06 18:14:51', 0, '2024-03-24 01:20:28', '2024-03-29 09:29:42', 1, 1.78, 6.84);
INSERT INTO `web_user_orders` VALUES (100541, 200004, 102900011034325, '2024-04-08 05:34:34', 0, '2024-03-23 01:42:15', '2024-04-04 11:16:25', 1, 1.13, 6.12);
INSERT INTO `web_user_orders` VALUES (100542, 200010, 102900011033920, '2024-04-05 00:21:37', 0, '2024-03-25 04:02:31', '2024-04-01 09:00:20', 1, 1.34, 6.07);
INSERT INTO `web_user_orders` VALUES (100543, 200001, 102900011033999, '2024-04-08 13:06:45', 0, '2024-03-28 05:08:06', '2024-04-05 13:36:03', 1, 1.4, 8.2);
INSERT INTO `web_user_orders` VALUES (100544, 200005, 102900011000328, '2024-04-05 21:47:19', 0, '2024-03-24 20:16:22', '2024-03-30 03:06:38', 0, 1.99, 14.67);
INSERT INTO `web_user_orders` VALUES (100545, 200006, 102900011008577, '2024-04-06 16:57:49', 0, '2024-03-27 18:32:45', '2024-03-29 17:13:18', 1, 1.78, 6.71);
INSERT INTO `web_user_orders` VALUES (100546, 200009, 102900011034325, '2024-04-05 05:01:32', 0, '2024-03-23 22:27:19', '2024-03-29 01:43:42', 1, 2.04, 13.55);
INSERT INTO `web_user_orders` VALUES (100547, 200003, 102900005116806, '2024-04-06 16:20:22', 0, '2024-03-28 18:41:45', '2024-04-03 17:20:17', 0, 1.76, 6.04);
INSERT INTO `web_user_orders` VALUES (100548, 200009, 102900005116905, '2024-04-07 12:04:22', 0, '2024-03-29 06:40:05', '2024-04-04 09:42:35', 1, 1.31, 12.51);
INSERT INTO `web_user_orders` VALUES (100549, 200009, 102900011000328, '2024-04-06 12:58:21', 0, '2024-03-29 09:11:04', '2024-03-29 15:24:46', 0, 1.2, 11.75);
INSERT INTO `web_user_orders` VALUES (100550, 200009, 102900011018522, '2024-04-06 13:51:23', 0, '2024-03-29 12:38:22', '2024-04-05 23:38:03', 1, 2.11, 8.57);
INSERT INTO `web_user_orders` VALUES (100551, 200002, 102900011000175, '2024-04-06 01:04:39', 0, '2024-03-23 23:09:28', '2024-03-31 00:26:04', 0, 2.17, 9.05);
INSERT INTO `web_user_orders` VALUES (100552, 200003, 102900011018522, '2024-04-05 19:52:55', 0, '2024-03-27 05:53:15', '2024-04-05 09:59:33', 0, 1.26, 4.81);
INSERT INTO `web_user_orders` VALUES (100553, 200010, 102900111034326, '2024-04-07 08:06:17', 0, '2024-03-27 11:02:39', '2024-03-29 20:36:44', 0, 1.41, 1.42);
INSERT INTO `web_user_orders` VALUES (100554, 200007, 102900011034326, '2024-04-07 23:57:18', 0, '2024-03-27 13:01:52', '2024-03-29 22:25:54', 0, 1.71, 1.62);
INSERT INTO `web_user_orders` VALUES (100555, 200005, 102900011000175, '2024-04-08 06:30:56', 0, '2024-03-28 21:14:50', '2024-04-03 00:02:59', 0, 1.09, 4.67);
INSERT INTO `web_user_orders` VALUES (100556, 200007, 102900005116806, '2024-04-08 14:26:52', 0, '2024-03-29 03:35:46', '2024-04-03 02:22:14', 1, 1.24, 3.45);
INSERT INTO `web_user_orders` VALUES (100557, 200010, 102900011018132, '2024-04-08 13:14:31', 0, '2024-03-28 15:24:29', '2024-03-29 22:05:56', 1, 1.07, 12.66);
INSERT INTO `web_user_orders` VALUES (100558, 200003, 102900011009277, '2024-04-05 10:22:49', 0, '2024-03-23 05:16:53', '2024-03-30 19:47:05', 0, 1.38, 11.5);
INSERT INTO `web_user_orders` VALUES (100559, 200010, 102900011034325, '2024-04-07 15:47:03', 0, '2024-03-29 19:45:08', '2024-04-04 22:05:15', 0, 1.64, 11.37);
INSERT INTO `web_user_orders` VALUES (100560, 200010, 102900011000335, '2024-04-08 22:16:44', 0, '2024-03-29 19:28:26', '2024-04-04 16:24:01', 0, 1.3, 3.07);
INSERT INTO `web_user_orders` VALUES (100561, 200001, 102900011007471, '2024-04-06 04:50:20', 0, '2024-03-23 12:42:16', '2024-03-29 08:28:16', 1, 2.17, 22.81);
INSERT INTO `web_user_orders` VALUES (100562, 200001, 102900005116219, '2024-04-06 11:17:44', 0, '2024-03-23 00:57:10', '2024-04-05 08:10:13', 1, 1.41, 19.95);
INSERT INTO `web_user_orders` VALUES (100563, 200006, 102900011008577, '2024-04-08 22:32:41', 0, '2024-03-29 07:05:41', '2024-03-29 05:46:05', 1, 1.81, 9.38);
INSERT INTO `web_user_orders` VALUES (100564, 200009, 102900011000335, '2024-04-08 22:46:45', 0, '2024-03-24 00:20:14', '2024-04-02 05:25:39', 0, 1.97, 4.22);
INSERT INTO `web_user_orders` VALUES (100565, 200003, 102900005115748, '2024-04-05 23:04:09', 0, '2024-03-27 20:17:52', '2024-04-04 21:22:15', 0, 1.27, 7.61);
INSERT INTO `web_user_orders` VALUES (100566, 200008, 102900011034323, '2024-04-07 08:08:47', 0, '2024-03-23 12:19:25', '2024-04-02 15:30:56', 1, 2.13, 33.95);
INSERT INTO `web_user_orders` VALUES (100567, 200007, 102900011034324, '2024-04-07 19:03:58', 0, '2024-03-27 20:09:59', '2024-04-05 20:42:59', 1, 2.04, 5.57);
INSERT INTO `web_user_orders` VALUES (100568, 200001, 102900005115748, '2024-04-07 18:25:13', 0, '2024-03-28 10:18:29', '2024-04-02 13:22:56', 1, 1.06, 4.79);
INSERT INTO `web_user_orders` VALUES (100569, 200004, 102900005115977, '2024-04-07 20:17:18', 0, '2024-03-27 10:40:49', '2024-04-01 12:41:50', 0, 1.16, 7.25);
INSERT INTO `web_user_orders` VALUES (100571, 200003, 102900111034326, '2024-04-07 12:36:25', 0, '2024-03-26 16:26:47', '2024-04-05 01:31:58', 1, 1.36, 1.35);
INSERT INTO `web_user_orders` VALUES (100572, 200009, 102900005116226, '2024-04-06 17:21:43', 0, '2024-03-24 06:28:31', '2024-04-04 14:42:58', 1, 1.58, 5.74);
INSERT INTO `web_user_orders` VALUES (100573, 200005, 102900005115748, '2024-04-06 15:01:30', 0, '2024-03-26 10:53:45', '2024-03-29 12:16:52', 0, 1.52, 7.52);
INSERT INTO `web_user_orders` VALUES (100574, 200003, 102900005116714, '2024-04-06 04:27:57', 0, '2024-03-27 15:14:01', '2024-04-01 05:43:33', 1, 2.14, 15.15);
INSERT INTO `web_user_orders` VALUES (100575, 200010, 102900005118817, '2024-04-06 19:34:30', 0, '2024-03-28 00:00:39', '2024-04-02 18:47:34', 1, 1.21, 8.8);
INSERT INTO `web_user_orders` VALUES (100576, 200002, 102900005115977, '2024-04-05 04:50:14', 0, '2024-03-28 01:36:14', '2024-04-04 06:44:44', 0, 1.97, 12.15);
INSERT INTO `web_user_orders` VALUES (100577, 200010, 102900011007471, '2024-04-06 22:50:20', 0, '2024-03-27 14:09:19', '2024-04-01 06:53:54', 1, 2, 20.62);
INSERT INTO `web_user_orders` VALUES (100578, 200006, 102900011018522, '2024-04-06 11:07:05', 0, '2024-03-25 19:05:57', '2024-04-05 00:14:13', 1, 1.61, 5.52);
INSERT INTO `web_user_orders` VALUES (100579, 200008, 102900011000175, '2024-04-05 06:21:47', 0, '2024-03-23 15:10:22', '2024-03-31 04:04:42', 1, 1.27, 6.32);
INSERT INTO `web_user_orders` VALUES (100580, 200010, 102900005115786, '2024-04-06 03:59:39', 0, '2024-03-28 04:19:45', '2024-03-30 18:21:15', 0, 1.77, 6.74);
INSERT INTO `web_user_orders` VALUES (100581, 200006, 102900005115977, '2024-04-05 15:14:14', 0, '2024-03-25 05:04:37', '2024-03-29 07:36:51', 0, 1.21, 6.69);
INSERT INTO `web_user_orders` VALUES (100582, 200004, 102900005115946, '2024-04-08 08:54:43', 0, '2024-03-28 11:45:38', '2024-04-04 07:00:09', 0, 1.58, 7.65);
INSERT INTO `web_user_orders` VALUES (100583, 200006, 102900011034325, '2024-04-05 01:54:26', 0, '2024-03-24 20:35:27', '2024-03-31 13:48:48', 0, 1.71, 10.07);
INSERT INTO `web_user_orders` VALUES (100584, 200009, 102900011033920, '2024-04-07 22:45:18', 0, '2024-03-26 06:17:32', '2024-04-01 14:13:37', 1, 2.03, 10.21);
INSERT INTO `web_user_orders` VALUES (100585, 200006, 102900005125808, '2024-04-08 02:07:56', 0, '2024-03-29 01:46:28', '2024-04-04 04:00:13', 0, 2.14, 31.01);
INSERT INTO `web_user_orders` VALUES (100586, 200005, 102900005118817, '2024-04-05 07:20:47', 0, '2024-03-27 09:39:14', '2024-04-04 16:05:25', 1, 1.4, 9.83);
INSERT INTO `web_user_orders` VALUES (100588, 200009, 102900011034324, '2024-04-07 17:44:42', 0, '2024-03-24 12:00:35', '2024-03-31 18:24:05', 0, 2.02, 5.94);
INSERT INTO `web_user_orders` VALUES (100589, 200010, 102900011010563, '2024-04-06 15:14:41', 0, '2024-03-29 19:11:38', '2024-03-29 10:53:00', 0, 1.17, 107.65);
INSERT INTO `web_user_orders` VALUES (100590, 200006, 102900011034224, '2024-04-05 21:27:32', 0, '2024-03-25 01:43:02', '2024-03-31 10:24:10', 1, 2.16, 3.56);
INSERT INTO `web_user_orders` VALUES (100591, 200004, 102900011034224, '2024-04-08 02:07:13', 0, '2024-03-29 16:14:16', '2024-04-05 18:07:57', 0, 1.07, 2.18);
INSERT INTO `web_user_orders` VALUES (100592, 200002, 102900005115786, '2024-04-07 03:01:42', 0, '2024-03-24 04:13:23', '2024-04-02 03:37:18', 0, 1.48, 7.25);
INSERT INTO `web_user_orders` VALUES (100593, 200008, 102900011033920, '2024-04-07 08:59:49', 0, '2024-03-24 20:15:16', '2024-03-29 22:48:30', 0, 1.1, 5.86);
INSERT INTO `web_user_orders` VALUES (100594, 200005, 102900011008522, '2024-04-08 06:34:06', 0, '2024-03-29 20:22:01', '2024-04-03 13:47:16', 0, 1.07, 4.6);
INSERT INTO `web_user_orders` VALUES (100595, 200008, 102900011018132, '2024-04-05 02:03:09', 0, '2024-03-25 15:53:07', '2024-04-04 13:05:35', 1, 1.39, 14.28);
INSERT INTO `web_user_orders` VALUES (100596, 200010, 102900005115823, '2024-04-05 03:58:52', 0, '2024-03-23 04:31:34', '2024-04-04 13:51:46', 0, 1.74, 10.98);
INSERT INTO `web_user_orders` VALUES (100597, 200003, 102900005115861, '2024-04-05 08:38:11', 0, '2024-03-27 17:14:53', '2024-03-29 18:22:29', 1, 1.93, 3.28);
INSERT INTO `web_user_orders` VALUES (100598, 200008, 102900011033999, '2024-04-06 20:57:10', 0, '2024-03-27 22:37:11', '2024-03-31 17:51:28', 0, 1.26, 6.73);
INSERT INTO `web_user_orders` VALUES (100599, 200004, 102900011034326, '2024-04-08 22:32:33', 0, '2024-03-25 16:35:25', '2024-04-02 18:52:48', 1, 1.16, 1.01);
INSERT INTO `web_user_orders` VALUES (100600, 200007, 102900011034326, '2024-04-07 04:14:47', 0, '2024-03-23 20:21:26', '2024-04-02 21:06:08', 1, 1.65, 1.42);
INSERT INTO `web_user_orders` VALUES (100601, 200006, 102900005115762, '2024-04-07 17:31:23', 0, '2024-03-23 09:10:12', '2024-04-02 16:30:45', 1, 1.1, 14.88);
INSERT INTO `web_user_orders` VALUES (100602, 200005, 102900005116806, '2024-04-08 05:53:59', 0, '2024-03-29 14:44:12', '2024-04-05 19:13:16', 0, 1.86, 6.34);
INSERT INTO `web_user_orders` VALUES (100604, 200008, 102900011034325, '2024-04-05 00:09:26', 0, '2024-03-25 19:41:23', '2024-03-29 22:05:26', 1, 2.09, 13.17);
INSERT INTO `web_user_orders` VALUES (100605, 200008, 102900005116226, '2024-04-05 04:28:56', 0, '2024-03-23 04:36:45', '2024-04-01 10:25:50', 0, 1.93, 6.54);
INSERT INTO `web_user_orders` VALUES (100606, 200005, 102900005115748, '2024-04-06 23:24:09', 0, '2024-03-26 15:29:45', '2024-03-29 08:24:43', 1, 1.68, 9.21);
INSERT INTO `web_user_orders` VALUES (100607, 200001, 102900005115977, '2024-04-05 15:33:41', 0, '2024-03-25 13:56:44', '2024-04-01 07:02:51', 1, 1.92, 11.39);
INSERT INTO `web_user_orders` VALUES (100608, 200005, 102900005128748, '2024-04-05 14:17:34', 0, '2024-03-29 21:54:15', '2024-03-29 19:51:03', 1, 1.59, 98.68);
INSERT INTO `web_user_orders` VALUES (100609, 200004, 102900011034324, '2024-04-08 23:30:48', 0, '2024-03-29 09:01:33', '2024-03-29 17:13:38', 0, 1.47, 4.17);
INSERT INTO `web_user_orders` VALUES (100610, 200006, 102900005116806, '2024-04-08 00:22:27', 0, '2024-03-25 17:36:48', '2024-04-04 10:16:39', 1, 1.03, 3.49);
INSERT INTO `web_user_orders` VALUES (100611, 200001, 102900011008164, '2024-04-05 19:35:11', 0, '2024-03-23 17:20:08', '2024-03-30 18:09:55', 0, 2.12, 7.76);
INSERT INTO `web_user_orders` VALUES (100612, 200004, 102900011016909, '2024-04-07 12:51:25', 0, '2024-03-27 05:39:20', '2024-04-03 09:46:38', 1, 1.61, 13.12);
INSERT INTO `web_user_orders` VALUES (100613, 200007, 102900011022764, '2024-04-08 07:43:49', 0, '2024-03-26 21:26:01', '2024-04-04 18:19:41', 0, 1.27, 5.32);
INSERT INTO `web_user_orders` VALUES (100614, 200001, 102900005116226, '2024-04-05 18:34:42', 0, '2024-03-29 06:06:21', '2024-03-30 06:25:48', 0, 1.87, 6.34);
INSERT INTO `web_user_orders` VALUES (100615, 200008, 102900005115762, '2024-04-07 10:40:05', 0, '2024-03-28 02:00:05', '2024-03-29 09:34:58', 0, 1.85, 18.56);
INSERT INTO `web_user_orders` VALUES (100616, 200004, 102900011011058, '2024-04-06 15:36:42', 0, '2024-03-23 10:42:06', '2024-04-05 16:26:34', 1, 2.16, 124.59);
INSERT INTO `web_user_orders` VALUES (100617, 200008, 102900005116226, '2024-04-05 04:58:27', 0, '2024-03-29 18:23:01', '2024-03-31 03:58:34', 0, 1.02, 3.17);
INSERT INTO `web_user_orders` VALUES (100618, 200004, 102900011007471, '2024-04-07 08:03:14', 0, '2024-03-23 09:45:25', '2024-03-30 00:32:34', 0, 1.81, 18.26);
INSERT INTO `web_user_orders` VALUES (100619, 200009, 102900005116226, '2024-04-07 17:32:17', 0, '2024-03-25 13:22:08', '2024-04-04 17:43:21', 1, 1.81, 4.74);
INSERT INTO `web_user_orders` VALUES (100620, 200007, 102900005118817, '2024-04-08 22:25:48', 0, '2024-03-26 06:36:44', '2024-03-29 04:35:43', 1, 1.85, 9.93);
INSERT INTO `web_user_orders` VALUES (100621, 200005, 102900111034326, '2024-04-08 01:57:29', 0, '2024-03-29 23:30:40', '2024-04-01 00:19:14', 0, 1.56, 1.86);
INSERT INTO `web_user_orders` VALUES (100622, 200004, 102900005115946, '2024-04-05 11:02:14', 0, '2024-03-29 22:32:43', '2024-04-04 04:17:36', 1, 1.53, 6.09);
INSERT INTO `web_user_orders` VALUES (100623, 200005, 102900011033920, '2024-04-05 02:05:50', 0, '2024-03-24 03:03:36', '2024-04-03 03:29:35', 0, 1.24, 4.85);
INSERT INTO `web_user_orders` VALUES (100624, 200002, 102900011018522, '2024-04-06 20:30:41', 0, '2024-03-24 09:15:10', '2024-04-02 15:54:08', 1, 2.08, 7.28);
INSERT INTO `web_user_orders` VALUES (100625, 200007, 102900005115946, '2024-04-06 23:25:18', 0, '2024-03-23 20:01:48', '2024-04-02 06:57:05', 1, 1.33, 6.41);
INSERT INTO `web_user_orders` VALUES (100626, 200009, 102900011006689, '2024-04-05 11:37:31', 0, '2024-03-29 21:12:54', '2024-04-01 11:58:12', 1, 1.19, 8);
INSERT INTO `web_user_orders` VALUES (100627, 200003, 102900011008577, '2024-04-07 21:35:48', 0, '2024-03-29 05:51:33', '2024-04-04 14:07:18', 1, 1.57, 6.08);
INSERT INTO `web_user_orders` VALUES (100628, 200004, 102900005115786, '2024-04-08 18:13:38', 0, '2024-03-24 13:25:40', '2024-04-05 11:45:01', 0, 1.79, 8.14);
INSERT INTO `web_user_orders` VALUES (100629, 200001, 102900011034325, '2024-04-05 11:44:26', 0, '2024-03-25 10:18:56', '2024-04-01 07:40:29', 1, 1.31, 7.21);
INSERT INTO `web_user_orders` VALUES (100630, 200007, 102900011008577, '2024-04-07 07:51:08', 0, '2024-03-25 23:59:09', '2024-04-04 01:28:02', 0, 1.02, 5.32);
INSERT INTO `web_user_orders` VALUES (100631, 200005, 102900011008522, '2024-04-07 01:44:29', 0, '2024-03-24 02:32:31', '2024-03-30 18:18:03', 1, 2.11, 8.93);
INSERT INTO `web_user_orders` VALUES (100632, 200006, 102900011018132, '2024-04-05 10:27:33', 0, '2024-03-28 02:37:45', '2024-03-29 17:50:36', 0, 1.6, 16.5);
INSERT INTO `web_user_orders` VALUES (100633, 200002, 102900005115946, '2024-04-07 16:47:05', 0, '2024-03-26 07:55:04', '2024-04-04 02:06:12', 0, 1.16, 4.18);
INSERT INTO `web_user_orders` VALUES (100634, 200006, 102900011007969, '2024-04-08 16:54:22', 0, '2024-03-27 06:32:49', '2024-04-04 09:39:56', 0, 1.06, 11.65);
INSERT INTO `web_user_orders` VALUES (100635, 200005, 102900011008577, '2024-04-08 14:06:15', 0, '2024-03-29 18:50:01', '2024-04-03 02:59:24', 1, 1.86, 8.59);
INSERT INTO `web_user_orders` VALUES (100636, 200004, 102900005115960, '2024-04-05 16:11:37', 0, '2024-03-24 05:08:13', '2024-03-31 15:49:52', 1, 1.14, 2.38);
INSERT INTO `web_user_orders` VALUES (100637, 200001, 102900011000175, '2024-04-07 18:38:24', 0, '2024-03-27 12:18:03', '2024-04-01 12:17:52', 0, 1.9, 10.24);
INSERT INTO `web_user_orders` VALUES (100638, 200006, 102900111034326, '2024-04-06 01:28:38', 0, '2024-03-24 07:25:24', '2024-03-30 20:03:13', 0, 1.18, 1);
INSERT INTO `web_user_orders` VALUES (100639, 200005, 102900005115946, '2024-04-07 07:50:47', 0, '2024-03-29 17:31:06', '2024-03-30 11:10:26', 0, 1.15, 4.52);
INSERT INTO `web_user_orders` VALUES (100640, 200002, 102900011011058, '2024-04-06 05:42:08', 0, '2024-03-27 19:57:36', '2024-03-30 12:57:37', 1, 1.03, 61.81);
INSERT INTO `web_user_orders` VALUES (100641, 200003, 102900005115823, '2024-04-08 16:29:15', 0, '2024-03-26 02:27:47', '2024-04-01 21:20:51', 0, 1.36, 9.14);
INSERT INTO `web_user_orders` VALUES (100642, 200005, 102900011000335, '2024-04-05 01:53:56', 0, '2024-03-25 02:05:54', '2024-03-31 06:23:17', 1, 1.63, 4.22);
INSERT INTO `web_user_orders` VALUES (100643, 200005, 102900011008577, '2024-04-06 06:36:06', 0, '2024-03-28 14:23:51', '2024-03-29 05:34:28', 1, 1.39, 6.96);
INSERT INTO `web_user_orders` VALUES (100644, 200010, 102900005116806, '2024-04-06 00:00:56', 0, '2024-03-27 00:56:44', '2024-04-02 14:36:30', 1, 1.47, 4.45);
INSERT INTO `web_user_orders` VALUES (100645, 200007, 102900011008522, '2024-04-05 18:17:14', 0, '2024-03-28 20:04:31', '2024-04-05 13:58:35', 1, 1.56, 5.87);
INSERT INTO `web_user_orders` VALUES (100646, 200003, 102900011007464, '2024-04-07 05:58:41', 0, '2024-03-28 21:01:47', '2024-04-01 10:36:10', 0, 1.48, 16.21);
INSERT INTO `web_user_orders` VALUES (100647, 200009, 102900111034326, '2024-04-05 23:03:16', 0, '2024-03-26 01:18:33', '2024-03-30 19:26:46', 0, 1.47, 1.29);
INSERT INTO `web_user_orders` VALUES (100648, 200001, 102900005115984, '2024-04-05 19:50:28', 0, '2024-03-23 22:44:29', '2024-03-31 15:38:53', 1, 1.95, 7);
INSERT INTO `web_user_orders` VALUES (100649, 200010, 102900011000335, '2024-04-05 10:25:50', 0, '2024-03-24 20:59:07', '2024-04-02 13:50:58', 1, 1.68, 4.52);
INSERT INTO `web_user_orders` VALUES (100650, 200009, 102900011008485, '2024-04-06 06:17:23', 0, '2024-03-24 05:31:31', '2024-03-31 02:58:16', 1, 1.84, 6.92);
INSERT INTO `web_user_orders` VALUES (100651, 200010, 102900011000328, '2024-04-05 14:03:26', 0, '2024-03-24 02:18:05', '2024-04-02 13:47:19', 0, 1.11, 8.76);
INSERT INTO `web_user_orders` VALUES (100652, 200002, 102900005116714, '2024-04-07 10:16:01', 0, '2024-03-27 17:26:03', '2024-04-01 22:40:05', 1, 1.65, 12.97);
INSERT INTO `web_user_orders` VALUES (100653, 200005, 102900011007471, '2024-04-08 19:34:34', 0, '2024-03-29 23:14:36', '2024-04-03 20:53:33', 0, 1.6, 16.69);
INSERT INTO `web_user_orders` VALUES (100654, 200007, 102900005116714, '2024-04-08 05:19:12', 0, '2024-03-28 03:34:49', '2024-04-03 07:30:58', 1, 1.79, 17.6);
INSERT INTO `web_user_orders` VALUES (100655, 200006, 102900011000328, '2024-04-05 04:57:26', 0, '2024-03-29 19:41:15', '2024-03-30 03:56:07', 1, 2.16, 19.35);
INSERT INTO `web_user_orders` VALUES (100656, 200001, 102900005115793, '2024-04-06 06:02:58', 0, '2024-03-23 03:22:45', '2024-04-03 01:58:22', 1, 1.49, 15.87);
INSERT INTO `web_user_orders` VALUES (100657, 200001, 102900005115793, '2024-04-08 13:20:21', 0, '2024-03-29 08:55:45', '2024-04-04 03:52:42', 1, 1.04, 9.22);
INSERT INTO `web_user_orders` VALUES (100658, 200007, 102900011008164, '2024-04-07 10:22:44', 0, '2024-03-26 07:19:30', '2024-04-05 19:53:58', 0, 2.13, 5.67);
INSERT INTO `web_user_orders` VALUES (100659, 200005, 102900011008485, '2024-04-05 12:25:09', 0, '2024-03-29 15:03:45', '2024-04-02 13:55:19', 0, 1.7, 7.06);
INSERT INTO `web_user_orders` VALUES (100660, 200010, 102900005115779, '2024-04-06 14:22:28', 0, '2024-03-29 08:50:39', '2024-04-03 08:57:50', 1, 1.83, 9.37);
INSERT INTO `web_user_orders` VALUES (100661, 200002, 102900011007471, '2024-04-06 08:34:39', 0, '2024-03-29 20:59:37', '2024-04-04 09:20:50', 0, 2.07, 17.26);
INSERT INTO `web_user_orders` VALUES (100662, 200010, 102900011007471, '2024-04-06 10:09:10', 0, '2024-03-27 01:39:03', '2024-04-04 16:37:41', 0, 1.8, 16.72);
INSERT INTO `web_user_orders` VALUES (100663, 200001, 102900011033999, '2024-04-05 22:51:40', 0, '2024-03-24 01:30:39', '2024-04-05 16:00:54', 0, 1.75, 11.01);
INSERT INTO `web_user_orders` VALUES (100664, 200004, 102900011033920, '2024-04-07 23:35:54', 0, '2024-03-26 07:19:44', '2024-03-31 12:01:53', 0, 2.01, 9.59);
INSERT INTO `web_user_orders` VALUES (100665, 200004, 102900011018522, '2024-04-08 20:21:22', 0, '2024-03-26 01:08:28', '2024-04-02 09:45:38', 1, 1.38, 6.38);
INSERT INTO `web_user_orders` VALUES (100666, 200004, 102900011034224, '2024-04-08 23:18:23', 0, '2024-03-29 07:25:27', '2024-04-02 02:48:42', 0, 1.65, 3.71);
INSERT INTO `web_user_orders` VALUES (100667, 200006, 102900011008522, '2024-04-06 01:26:10', 0, '2024-03-23 19:16:53', '2024-04-05 06:16:52', 1, 1.4, 6.05);
INSERT INTO `web_user_orders` VALUES (100668, 200002, 102900011011058, '2024-04-05 00:04:45', 0, '2024-03-26 19:24:23', '2024-04-03 20:48:37', 0, 1.65, 113.07);
INSERT INTO `web_user_orders` VALUES (100669, 200009, 102900011034224, '2024-04-05 11:03:46', 0, '2024-03-27 17:21:19', '2024-04-01 08:23:27', 0, 1.42, 3.14);
INSERT INTO `web_user_orders` VALUES (100670, 200005, 102900011008577, '2024-04-08 02:04:59', 0, '2024-03-25 10:07:33', '2024-03-29 06:14:12', 0, 1.8, 7.83);
INSERT INTO `web_user_orders` VALUES (100671, 200007, 102900005128748, '2024-04-08 11:05:39', 0, '2024-03-25 23:29:22', '2024-04-04 18:44:11', 0, 1.57, 119.08);
INSERT INTO `web_user_orders` VALUES (100672, 200003, 102900011034224, '2024-04-08 22:31:07', 0, '2024-03-28 05:39:21', '2024-03-31 17:14:05', 0, 1.08, 2.15);
INSERT INTO `web_user_orders` VALUES (100673, 200001, 102900011000175, '2024-04-05 19:16:45', 0, '2024-03-26 07:53:51', '2024-04-04 21:08:39', 0, 1.03, 4.2);
INSERT INTO `web_user_orders` VALUES (100674, 200009, 102900011000175, '2024-04-07 19:49:49', 0, '2024-03-24 02:55:13', '2024-04-04 20:16:42', 1, 1.98, 9.46);
INSERT INTO `web_user_orders` VALUES (100675, 200010, 102900011008485, '2024-04-06 05:51:38', 0, '2024-03-26 07:18:36', '2024-03-30 03:53:09', 1, 1.38, 6.24);
INSERT INTO `web_user_orders` VALUES (100676, 200003, 102900005115625, '2024-04-07 13:14:46', 0, '2024-03-26 08:32:01', '2024-04-01 05:57:11', 0, 1.84, 5.94);
INSERT INTO `web_user_orders` VALUES (100677, 200006, 102900005116714, '2024-04-07 13:17:55', 0, '2024-03-24 15:36:10', '2024-03-29 20:49:57', 0, 1.43, 13.7);
INSERT INTO `web_user_orders` VALUES (100678, 200006, 102900005115946, '2024-04-05 04:34:46', 0, '2024-03-26 23:35:09', '2024-03-31 20:25:35', 0, 1.61, 6.6);
INSERT INTO `web_user_orders` VALUES (100679, 200009, 102900005116714, '2024-04-08 12:49:13', 0, '2024-03-28 21:07:14', '2024-03-31 15:54:40', 0, 1.45, 14.02);
INSERT INTO `web_user_orders` VALUES (100680, 200002, 102900005116219, '2024-04-06 00:56:24', 0, '2024-03-26 14:04:44', '2024-04-02 19:58:52', 1, 1.7, 30.12);
INSERT INTO `web_user_orders` VALUES (100681, 200010, 102900005116226, '2024-04-07 10:17:38', 0, '2024-03-24 21:19:39', '2024-03-31 08:49:58', 0, 1.79, 4.94);
INSERT INTO `web_user_orders` VALUES (100682, 200003, 102900005115793, '2024-04-08 12:59:28', 0, '2024-03-25 04:11:52', '2024-04-02 22:03:16', 1, 1.38, 15.61);
INSERT INTO `web_user_orders` VALUES (100683, 200009, 102900111034326, '2024-04-08 21:54:46', 0, '2024-03-26 07:18:19', '2024-03-31 23:21:46', 0, 1.13, 0.95);
INSERT INTO `web_user_orders` VALUES (100684, 200007, 102900005116219, '2024-04-08 18:51:50', 0, '2024-03-26 00:43:33', '2024-04-01 09:07:07', 0, 1.19, 19.71);
INSERT INTO `web_user_orders` VALUES (100685, 200003, 102900011000335, '2024-04-07 21:04:36', 0, '2024-03-27 15:33:47', '2024-04-03 04:42:14', 0, 1.06, 2.92);
INSERT INTO `web_user_orders` VALUES (100686, 200010, 102900111034326, '2024-04-06 10:37:31', 0, '2024-03-23 06:27:12', '2024-04-01 17:41:31', 0, 1.63, 1.58);
INSERT INTO `web_user_orders` VALUES (100687, 200005, 102900011007969, '2024-04-05 16:04:16', 0, '2024-03-28 13:08:18', '2024-04-03 21:37:05', 0, 1.64, 14.55);
INSERT INTO `web_user_orders` VALUES (100688, 200010, 102900005125808, '2024-04-07 04:12:52', 0, '2024-03-28 02:32:28', '2024-04-01 17:53:22', 1, 1.46, 21.97);
INSERT INTO `web_user_orders` VALUES (100689, 200010, 102900005115779, '2024-04-07 10:09:04', 0, '2024-03-28 17:46:58', '2024-04-05 07:05:19', 0, 1.64, 8.58);
INSERT INTO `web_user_orders` VALUES (100690, 200005, 102900011033920, '2024-04-06 16:30:33', 0, '2024-03-23 03:48:27', '2024-04-04 09:10:09', 1, 1.75, 9.14);
INSERT INTO `web_user_orders` VALUES (100691, 200003, 102900005118817, '2024-04-06 18:09:18', 0, '2024-03-23 14:56:39', '2024-04-04 18:23:33', 1, 1.19, 7.13);
INSERT INTO `web_user_orders` VALUES (100692, 200005, 102900011016909, '2024-04-06 16:53:24', 0, '2024-03-26 16:33:42', '2024-04-04 00:03:33', 1, 1.42, 10.48);
INSERT INTO `web_user_orders` VALUES (100693, 200005, 102900011033920, '2024-04-05 07:50:13', 0, '2024-03-23 07:52:32', '2024-03-31 20:10:00', 1, 1.35, 6.1);
INSERT INTO `web_user_orders` VALUES (100694, 200009, 102900005115786, '2024-04-05 02:43:09', 0, '2024-03-28 18:57:14', '2024-04-02 02:03:31', 0, 1.35, 5);
INSERT INTO `web_user_orders` VALUES (100695, 200010, 102900005116219, '2024-04-07 15:54:27', 0, '2024-03-29 06:33:55', '2024-04-01 20:02:55', 1, 2.08, 28.12);
INSERT INTO `web_user_orders` VALUES (100696, 200003, 102900011006955, '2024-04-08 17:56:13', 0, '2024-03-25 04:42:12', '2024-04-05 23:31:40', 1, 1.62, 11.96);
INSERT INTO `web_user_orders` VALUES (100697, 200004, 102900005115786, '2024-04-07 13:27:03', 0, '2024-03-29 07:52:30', '2024-04-05 05:53:07', 0, 1.88, 7.41);
INSERT INTO `web_user_orders` VALUES (100698, 200004, 102900005116905, '2024-04-08 09:45:34', 0, '2024-03-23 02:25:45', '2024-04-03 04:29:13', 1, 1.33, 13.21);
INSERT INTO `web_user_orders` VALUES (100699, 200005, 102900005115779, '2024-04-08 14:22:04', 0, '2024-03-27 11:32:49', '2024-04-02 22:38:40', 0, 1.71, 9.17);
INSERT INTO `web_user_orders` VALUES (100700, 200005, 102900011008164, '2024-04-07 15:28:15', 0, '2024-03-27 12:06:59', '2024-03-31 17:49:19', 1, 1.9, 5.43);
INSERT INTO `web_user_orders` VALUES (100701, 200005, 102900005115793, '2024-04-08 02:18:35', 0, '2024-03-29 00:53:14', '2024-03-30 00:05:44', 1, 2.12, 25.21);
INSERT INTO `web_user_orders` VALUES (100702, 200010, 102900011000328, '2024-04-05 11:12:23', 0, '2024-03-25 18:26:23', '2024-04-04 05:55:14', 0, 2.18, 16.39);
INSERT INTO `web_user_orders` VALUES (100703, 200001, 102900011000335, '2024-04-06 02:54:11', 0, '2024-03-26 10:21:59', '2024-04-03 21:18:09', 1, 1.43, 3.75);
INSERT INTO `web_user_orders` VALUES (100704, 200003, 102900011008522, '2024-04-06 00:19:32', 0, '2024-03-29 09:21:54', '2024-03-29 11:44:39', 0, 2.18, 7.15);
INSERT INTO `web_user_orders` VALUES (100705, 200008, 102900011034324, '2024-04-06 18:27:29', 0, '2024-03-23 04:36:38', '2024-04-03 03:59:48', 1, 1.44, 3.83);
INSERT INTO `web_user_orders` VALUES (100706, 200007, 102900005115960, '2024-04-05 09:52:19', 0, '2024-03-24 23:30:03', '2024-04-05 15:54:12', 1, 1.21, 2.8);
INSERT INTO `web_user_orders` VALUES (100707, 200005, 102900005115984, '2024-04-07 03:29:48', 0, '2024-03-24 08:36:22', '2024-03-29 02:13:30', 1, 2.13, 6.54);
INSERT INTO `web_user_orders` VALUES (100708, 200009, 102900011008522, '2024-04-08 08:03:40', 0, '2024-03-29 07:51:27', '2024-03-30 23:54:22', 1, 1.49, 6.84);
INSERT INTO `web_user_orders` VALUES (100709, 200007, 102900005128748, '2024-04-07 09:13:40', 0, '2024-03-24 04:47:47', '2024-03-29 21:42:57', 1, 1.24, 76.77);
INSERT INTO `web_user_orders` VALUES (100710, 200008, 102900005118831, '2024-04-08 08:01:20', 0, '2024-03-26 23:39:39', '2024-04-03 08:04:08', 1, 1.26, 4.46);
INSERT INTO `web_user_orders` VALUES (100711, 200005, 102900005115762, '2024-04-05 12:57:37', 0, '2024-03-26 19:38:53', '2024-04-05 00:38:27', 0, 1.4, 17.02);
INSERT INTO `web_user_orders` VALUES (100712, 200009, 102900005116806, '2024-04-06 20:01:18', 0, '2024-03-27 13:04:21', '2024-03-29 13:06:37', 1, 1.52, 4.16);
INSERT INTO `web_user_orders` VALUES (100713, 200009, 102900011034325, '2024-04-08 00:25:35', 0, '2024-03-28 09:52:24', '2024-03-29 16:10:16', 0, 1.25, 8);
INSERT INTO `web_user_orders` VALUES (100714, 200008, 102900011034325, '2024-04-06 20:06:50', 0, '2024-03-28 10:07:58', '2024-04-02 10:39:10', 1, 1.12, 5.87);
INSERT INTO `web_user_orders` VALUES (100715, 200008, 102900011008164, '2024-04-07 03:26:54', 0, '2024-03-29 09:33:25', '2024-03-29 23:49:06', 1, 2.12, 7.99);
INSERT INTO `web_user_orders` VALUES (100716, 200001, 102900011022764, '2024-04-07 00:04:54', 0, '2024-03-26 04:24:31', '2024-03-29 01:31:12', 0, 2.08, 10.3);
INSERT INTO `web_user_orders` VALUES (100717, 200007, 102900005115786, '2024-04-05 03:39:11', 0, '2024-03-26 17:36:38', '2024-04-05 10:39:33', 1, 1.89, 8.56);
INSERT INTO `web_user_orders` VALUES (100718, 200003, 102900011018522, '2024-04-07 00:19:34', 0, '2024-03-23 14:10:55', '2024-04-03 18:09:22', 0, 2.17, 10.16);
INSERT INTO `web_user_orders` VALUES (100719, 200004, 102900011018132, '2024-04-07 22:59:27', 0, '2024-03-26 16:50:17', '2024-04-05 10:32:22', 1, 1.95, 17.04);
INSERT INTO `web_user_orders` VALUES (100720, 200001, 102900005115748, '2024-04-08 14:18:45', 0, '2024-03-29 23:34:44', '2024-04-02 21:30:21', 1, 1.4, 6.9);
INSERT INTO `web_user_orders` VALUES (100721, 200010, 102900011011058, '2024-04-05 03:34:29', 0, '2024-03-28 15:44:25', '2024-03-31 02:26:07', 1, 1.25, 76.81);
INSERT INTO `web_user_orders` VALUES (100722, 200010, 102900005118817, '2024-04-05 09:06:40', 0, '2024-03-25 22:57:06', '2024-03-30 05:01:05', 1, 1.01, 5.25);
INSERT INTO `web_user_orders` VALUES (100723, 200009, 102900005115748, '2024-04-08 16:26:38', 0, '2024-03-29 00:07:57', '2024-04-04 22:04:53', 0, 1.29, 5.83);
INSERT INTO `web_user_orders` VALUES (100724, 200007, 102900011011058, '2024-04-08 09:45:06', 0, '2024-03-28 08:15:26', '2024-04-02 04:42:30', 0, 1.64, 109.42);
INSERT INTO `web_user_orders` VALUES (100725, 200004, 102900005118831, '2024-04-07 05:17:10', 0, '2024-03-28 10:01:25', '2024-04-02 17:09:03', 1, 1.03, 3.11);
INSERT INTO `web_user_orders` VALUES (100726, 200010, 102900011007969, '2024-04-06 02:52:42', 0, '2024-03-29 23:44:17', '2024-03-29 18:57:05', 0, 1.83, 19);
INSERT INTO `web_user_orders` VALUES (100727, 200008, 102900005128748, '2024-04-05 04:01:12', 0, '2024-03-25 11:43:56', '2024-04-04 08:23:43', 0, 2.14, 130.18);
INSERT INTO `web_user_orders` VALUES (100728, 200007, 102900011000335, '2024-04-07 19:54:30', 0, '2024-03-24 09:20:13', '2024-03-30 17:05:22', 1, 1.93, 5.65);
INSERT INTO `web_user_orders` VALUES (100729, 200003, 102900011006955, '2024-04-05 10:34:48', 0, '2024-03-28 15:56:52', '2024-03-31 02:29:40', 0, 1.3, 9.8);
INSERT INTO `web_user_orders` VALUES (100730, 200007, 102900011000328, '2024-04-08 01:10:18', 0, '2024-03-25 15:34:22', '2024-04-04 03:16:04', 1, 1.95, 17.14);
INSERT INTO `web_user_orders` VALUES (100731, 200005, 102900005115762, '2024-04-07 10:42:53', 0, '2024-03-27 13:46:12', '2024-04-04 07:08:25', 1, 1.84, 18.86);
INSERT INTO `web_user_orders` VALUES (100732, 200004, 102900011007471, '2024-04-08 00:08:39', 0, '2024-03-27 11:04:41', '2024-03-30 13:35:39', 1, 1.28, 11.14);
INSERT INTO `web_user_orders` VALUES (100733, 200009, 102900005115861, '2024-04-05 14:42:41', 0, '2024-03-26 13:00:55', '2024-03-29 12:42:48', 0, 1.14, 2.1);
INSERT INTO `web_user_orders` VALUES (100734, 200010, 102900011009277, '2024-04-05 17:09:48', 0, '2024-03-24 14:25:03', '2024-03-31 15:06:34', 1, 1.18, 7.66);
INSERT INTO `web_user_orders` VALUES (100735, 200001, 102900011034224, '2024-04-07 22:17:25', 0, '2024-03-29 09:53:01', '2024-03-31 18:36:51', 0, 1.98, 3.47);
INSERT INTO `web_user_orders` VALUES (100736, 200003, 102900005116233, '2024-04-07 01:53:42', 0, '2024-03-23 17:17:57', '2024-04-03 22:09:12', 0, 1.24, 12.44);
INSERT INTO `web_user_orders` VALUES (100737, 200004, 102900011007464, '2024-04-05 10:47:45', 0, '2024-03-29 16:49:43', '2024-04-02 06:40:21', 0, 1.42, 14.84);
INSERT INTO `web_user_orders` VALUES (100738, 200005, 102900005116806, '2024-04-07 15:17:30', 0, '2024-03-23 06:06:25', '2024-03-31 18:39:02', 0, 2.05, 5.41);
INSERT INTO `web_user_orders` VALUES (100739, 200004, 102900005115793, '2024-04-08 23:26:12', 0, '2024-03-24 04:21:36', '2024-04-01 04:16:57', 1, 1.59, 15.34);
INSERT INTO `web_user_orders` VALUES (100740, 200004, 102900011008577, '2024-04-06 04:39:51', 0, '2024-03-23 02:04:07', '2024-04-01 17:50:14', 1, 1.62, 6.76);
INSERT INTO `web_user_orders` VALUES (100741, 200002, 102900011018132, '2024-04-07 21:10:04', 0, '2024-03-24 01:41:18', '2024-04-04 00:03:34', 0, 1.47, 16.68);
INSERT INTO `web_user_orders` VALUES (100742, 200007, 102900011008164, '2024-04-08 05:19:56', 0, '2024-03-24 14:20:15', '2024-03-31 23:57:43', 0, 1.88, 5.62);
INSERT INTO `web_user_orders` VALUES (100743, 200003, 102900011000335, '2024-04-06 05:11:17', 0, '2024-03-28 09:13:38', '2024-04-01 13:09:57', 0, 1.56, 3.67);
INSERT INTO `web_user_orders` VALUES (100744, 200001, 102900005115779, '2024-04-06 19:12:23', 0, '2024-03-26 16:15:52', '2024-03-29 14:28:30', 1, 1.37, 7.33);
INSERT INTO `web_user_orders` VALUES (100745, 200007, 102900005115960, '2024-04-07 10:41:36', 0, '2024-03-29 12:17:13', '2024-04-05 02:28:51', 1, 1.71, 3.35);
INSERT INTO `web_user_orders` VALUES (100746, 200006, 102900005116219, '2024-04-05 16:29:59', 0, '2024-03-29 19:18:42', '2024-04-05 06:38:04', 0, 1.57, 20.88);
INSERT INTO `web_user_orders` VALUES (100747, 200007, 102900011034326, '2024-04-05 18:57:17', 0, '2024-03-27 20:04:32', '2024-04-01 14:47:13', 0, 1.77, 1.54);
INSERT INTO `web_user_orders` VALUES (100748, 200010, 102900011007471, '2024-04-08 08:10:42', 0, '2024-03-29 16:28:49', '2024-04-03 03:33:25', 1, 2.17, 18.75);
INSERT INTO `web_user_orders` VALUES (100749, 200010, 102900005115960, '2024-04-07 04:05:34', 0, '2024-03-29 09:30:53', '2024-03-30 08:25:10', 0, 1.96, 4.66);
INSERT INTO `web_user_orders` VALUES (100750, 200001, 102900011009277, '2024-04-06 11:48:35', 0, '2024-03-27 17:37:10', '2024-04-05 14:21:12', 1, 1.54, 10.41);
INSERT INTO `web_user_orders` VALUES (100751, 200001, 102900011006955, '2024-04-05 12:55:45', 0, '2024-03-25 10:05:43', '2024-04-03 12:30:22', 1, 1.47, 12.91);
INSERT INTO `web_user_orders` VALUES (100752, 200009, 102900005115946, '2024-04-05 02:49:00', 0, '2024-03-25 09:43:37', '2024-03-29 14:14:43', 0, 1.52, 6.25);
INSERT INTO `web_user_orders` VALUES (100753, 200005, 102900011034224, '2024-04-07 09:11:05', 0, '2024-03-28 23:43:48', '2024-04-02 02:06:01', 0, 1.74, 3.86);
INSERT INTO `web_user_orders` VALUES (100754, 200009, 102900011034224, '2024-04-07 06:50:19', 0, '2024-03-25 20:30:59', '2024-04-02 23:58:01', 1, 2.08, 4.16);
INSERT INTO `web_user_orders` VALUES (100755, 200001, 102900005115861, '2024-04-06 01:56:09', 0, '2024-03-29 09:19:59', '2024-04-05 15:12:39', 0, 1.68, 3.54);
INSERT INTO `web_user_orders` VALUES (100756, 200003, 102900011034325, '2024-04-08 13:09:49', 0, '2024-03-25 09:38:10', '2024-04-01 11:12:26', 0, 1.74, 10.2);
INSERT INTO `web_user_orders` VALUES (100757, 200005, 102900011018132, '2024-04-08 15:22:48', 0, '2024-03-25 12:45:13', '2024-03-31 23:53:45', 0, 1.84, 22.36);
INSERT INTO `web_user_orders` VALUES (100758, 200004, 102900005115946, '2024-04-05 15:38:35', 0, '2024-03-23 00:52:35', '2024-03-31 02:47:44', 0, 1.94, 9.97);
INSERT INTO `web_user_orders` VALUES (100759, 200010, 102900005116042, '2024-04-08 10:41:53', 0, '2024-03-29 08:03:50', '2024-04-01 12:38:34', 0, 1.66, 13);
INSERT INTO `web_user_orders` VALUES (100760, 200009, 102900005116806, '2024-04-07 02:26:19', 0, '2024-03-25 12:26:30', '2024-03-31 18:33:17', 1, 1.41, 4.24);
INSERT INTO `web_user_orders` VALUES (100761, 200009, 102900005115960, '2024-04-06 00:02:04', 0, '2024-03-23 02:42:20', '2024-04-02 04:01:19', 0, 1.65, 3.65);
INSERT INTO `web_user_orders` VALUES (100762, 200008, 102900005115984, '2024-04-08 08:42:53', 0, '2024-03-26 11:44:23', '2024-04-01 11:18:07', 0, 1.22, 4.81);
INSERT INTO `web_user_orders` VALUES (100763, 200002, 102900005115946, '2024-04-05 03:56:37', 0, '2024-03-27 21:07:23', '2024-03-29 13:49:14', 0, 1.7, 5.93);
INSERT INTO `web_user_orders` VALUES (100764, 200008, 102900005115823, '2024-04-05 16:55:30', 0, '2024-03-24 16:45:36', '2024-04-01 09:15:57', 1, 1.46, 10.34);
INSERT INTO `web_user_orders` VALUES (100765, 200007, 102900011007969, '2024-04-06 18:12:56', 0, '2024-03-25 22:47:03', '2024-04-05 20:22:48', 0, 1.03, 9.94);
INSERT INTO `web_user_orders` VALUES (100766, 200001, 102900011022764, '2024-04-07 06:23:47', 0, '2024-03-26 01:08:13', '2024-04-02 08:48:15', 1, 2.17, 8.25);
INSERT INTO `web_user_orders` VALUES (100767, 200007, 102900005116905, '2024-04-05 16:41:25', 0, '2024-03-28 05:11:17', '2024-04-05 08:29:12', 1, 1.47, 16.14);
INSERT INTO `web_user_orders` VALUES (100768, 200006, 102900011008164, '2024-04-05 01:31:45', 0, '2024-03-24 20:15:37', '2024-04-03 15:02:05', 0, 1.68, 5.58);
INSERT INTO `web_user_orders` VALUES (100769, 200001, 102900005118831, '2024-04-06 19:44:19', 0, '2024-03-26 14:17:01', '2024-04-05 03:41:56', 1, 1.33, 4.07);
INSERT INTO `web_user_orders` VALUES (100770, 200004, 102900005116905, '2024-04-07 23:15:30', 0, '2024-03-23 23:04:06', '2024-04-05 12:21:15', 0, 1.15, 13.05);
INSERT INTO `web_user_orders` VALUES (100771, 200007, 102900011006689, '2024-04-07 19:44:43', 0, '2024-03-26 20:58:33', '2024-03-31 13:09:23', 0, 1.99, 14.71);
INSERT INTO `web_user_orders` VALUES (100772, 200004, 102900011034324, '2024-04-07 02:12:39', 0, '2024-03-25 00:49:07', '2024-04-03 13:01:46', 0, 1.79, 4.31);
INSERT INTO `web_user_orders` VALUES (100773, 200005, 102900005115861, '2024-04-06 10:15:55', 0, '2024-03-29 23:06:10', '2024-04-05 23:09:26', 1, 1.11, 1.8);
INSERT INTO `web_user_orders` VALUES (100774, 200010, 102900011007471, '2024-04-07 16:45:37', 0, '2024-03-26 06:54:09', '2024-04-05 10:39:05', 1, 1.91, 15.24);
INSERT INTO `web_user_orders` VALUES (100776, 200007, 102900011033999, '2024-04-08 00:04:10', 0, '2024-03-24 00:04:31', '2024-04-02 14:52:02', 0, 2.15, 14.94);
INSERT INTO `web_user_orders` VALUES (100777, 200008, 102900005115960, '2024-04-07 13:27:30', 0, '2024-03-25 12:15:07', '2024-04-04 16:04:22', 1, 1.19, 2.25);
INSERT INTO `web_user_orders` VALUES (100778, 200010, 102900005115786, '2024-04-06 06:31:08', 0, '2024-03-26 00:48:41', '2024-03-29 13:43:54', 0, 1.38, 5.92);
INSERT INTO `web_user_orders` VALUES (100779, 200009, 102900005116233, '2024-04-08 19:45:16', 0, '2024-03-29 01:28:05', '2024-04-03 12:01:54', 1, 1.68, 13.22);
INSERT INTO `web_user_orders` VALUES (100780, 200009, 102900005118831, '2024-04-06 03:26:18', 0, '2024-03-28 20:49:36', '2024-04-04 01:13:08', 0, 1.02, 2.45);
INSERT INTO `web_user_orders` VALUES (100781, 200007, 102900011007969, '2024-04-07 18:27:05', 0, '2024-03-28 06:34:49', '2024-03-30 17:33:17', 1, 1.17, 11.31);
INSERT INTO `web_user_orders` VALUES (100782, 200010, 102900005115960, '2024-04-05 21:11:50', 0, '2024-03-25 19:41:27', '2024-04-01 13:40:53', 0, 1.76, 3.29);
INSERT INTO `web_user_orders` VALUES (100783, 200001, 102900011034224, '2024-04-06 23:44:30', 0, '2024-03-26 01:42:02', '2024-04-02 09:14:47', 0, 1.94, 4.21);
INSERT INTO `web_user_orders` VALUES (100784, 200001, 102900005116226, '2024-04-07 23:30:47', 0, '2024-03-25 00:28:20', '2024-03-31 18:51:47', 1, 1.12, 3.88);
INSERT INTO `web_user_orders` VALUES (100785, 200005, 102900011033920, '2024-04-08 09:44:36', 0, '2024-03-23 16:57:09', '2024-03-31 21:45:41', 1, 2.06, 11.21);
INSERT INTO `web_user_orders` VALUES (100786, 200004, 102900011007464, '2024-04-07 04:49:09', 0, '2024-03-28 12:28:38', '2024-04-01 03:02:12', 1, 2.14, 24.08);
INSERT INTO `web_user_orders` VALUES (100788, 200008, 102900005115748, '2024-04-06 07:58:49', 0, '2024-03-23 00:38:49', '2024-04-01 06:30:21', 1, 2.11, 12.28);
INSERT INTO `web_user_orders` VALUES (100789, 200006, 102900005118831, '2024-04-07 02:27:44', 0, '2024-03-27 04:45:21', '2024-03-29 06:27:00', 1, 1.53, 4.1);
INSERT INTO `web_user_orders` VALUES (100791, 200008, 102900005125808, '2024-04-07 23:13:59', 0, '2024-03-25 07:49:59', '2024-04-03 00:33:05', 1, 1.03, 13.17);
INSERT INTO `web_user_orders` VALUES (100792, 200005, 102900005116233, '2024-04-06 15:06:11', 0, '2024-03-24 09:24:03', '2024-03-30 12:56:44', 0, 1.67, 15.66);
INSERT INTO `web_user_orders` VALUES (100793, 200008, 102900005116233, '2024-04-05 17:49:30', 0, '2024-03-26 08:35:07', '2024-04-05 00:18:46', 1, 1.38, 10.07);
INSERT INTO `web_user_orders` VALUES (100794, 200005, 102900011006955, '2024-04-08 10:21:38', 0, '2024-03-27 15:40:24', '2024-04-03 14:20:30', 0, 2.13, 13.87);
INSERT INTO `web_user_orders` VALUES (100795, 200006, 102900011006955, '2024-04-05 16:42:06', 0, '2024-03-23 17:45:03', '2024-04-02 03:36:32', 0, 1.02, 7.97);
INSERT INTO `web_user_orders` VALUES (100798, 200006, 102900005115786, '2024-04-05 07:20:23', 0, '2024-03-27 08:22:52', '2024-04-02 15:16:50', 1, 1.41, 5.05);
INSERT INTO `web_user_orders` VALUES (100799, 200006, 102900005116233, '2024-04-06 02:13:34', 0, '2024-03-27 06:50:42', '2024-04-03 01:01:13', 0, 1.49, 13.98);
INSERT INTO `web_user_orders` VALUES (100800, 200010, 102900011018132, '2024-04-05 21:03:42', 0, '2024-03-29 06:29:43', '2024-03-29 09:37:22', 1, 1.89, 17.78);
INSERT INTO `web_user_orders` VALUES (100801, 200004, 102900011008164, '2024-04-05 16:09:53', 0, '2024-03-25 02:46:30', '2024-03-29 20:05:28', 1, 1.38, 4.72);
INSERT INTO `web_user_orders` VALUES (100802, 200003, 102900005115748, '2024-04-07 06:00:33', 0, '2024-03-23 03:04:34', '2024-03-29 15:58:50', 0, 1.5, 6.78);
INSERT INTO `web_user_orders` VALUES (100803, 200008, 102900011008522, '2024-04-08 22:09:09', 0, '2024-03-28 06:29:24', '2024-04-05 12:26:37', 1, 1.04, 4.93);
INSERT INTO `web_user_orders` VALUES (100804, 200005, 102900011000335, '2024-04-06 19:55:38', 0, '2024-03-25 09:10:17', '2024-04-02 02:19:42', 1, 1.98, 4.22);
INSERT INTO `web_user_orders` VALUES (100805, 200007, 102900211034326, '2024-04-06 09:18:29', 0, '2024-03-23 00:21:49', '2024-04-02 06:52:59', 0, 1.22, 1.24);
INSERT INTO `web_user_orders` VALUES (100806, 200009, 102900005115625, '2024-04-06 20:01:43', 0, '2024-03-23 03:44:04', '2024-03-31 04:02:48', 1, 1.18, 3.01);
INSERT INTO `web_user_orders` VALUES (100807, 200005, 102900005115984, '2024-04-05 19:58:22', 0, '2024-03-29 00:54:36', '2024-04-05 17:56:57', 0, 1.21, 4.56);
INSERT INTO `web_user_orders` VALUES (100808, 200006, 102900011034323, '2024-04-06 00:14:36', 0, '2024-03-26 06:46:17', '2024-03-29 23:38:10', 0, 1.04, 17.06);
INSERT INTO `web_user_orders` VALUES (100809, 200006, 102900005116219, '2024-04-07 07:19:05', 0, '2024-03-27 17:01:38', '2024-04-05 01:38:12', 1, 2.16, 28.58);
INSERT INTO `web_user_orders` VALUES (100810, 200010, 102900011016909, '2024-04-08 04:34:15', 0, '2024-03-24 01:14:41', '2024-03-31 23:38:10', 0, 1.13, 7.86);
INSERT INTO `web_user_orders` VALUES (100811, 200010, 102900005115946, '2024-04-08 13:30:34', 0, '2024-03-24 15:46:53', '2024-04-04 12:25:09', 1, 1.33, 6.5);
INSERT INTO `web_user_orders` VALUES (100812, 200001, 102900005115779, '2024-04-08 00:27:43', 0, '2024-03-28 03:43:30', '2024-04-01 18:07:02', 0, 1.41, 6.7);
INSERT INTO `web_user_orders` VALUES (100813, 200003, 102900005115625, '2024-04-08 09:28:10', 0, '2024-03-29 08:12:16', '2024-03-30 06:49:14', 0, 1.08, 3.47);
INSERT INTO `web_user_orders` VALUES (100814, 200008, 102900005116233, '2024-04-08 11:11:02', 0, '2024-03-26 02:45:14', '2024-04-01 03:25:44', 0, 1.2, 11.26);
INSERT INTO `web_user_orders` VALUES (100815, 200003, 102900011011058, '2024-04-07 14:39:00', 0, '2024-03-27 20:58:33', '2024-03-31 22:00:09', 0, 1.58, 85.34);
INSERT INTO `web_user_orders` VALUES (100816, 200007, 102900011034323, '2024-04-05 06:52:50', 0, '2024-03-29 15:12:19', '2024-04-01 15:16:46', 0, 1.93, 33.06);
INSERT INTO `web_user_orders` VALUES (100817, 200005, 102900011034224, '2024-04-07 16:08:10', 0, '2024-03-25 01:08:24', '2024-04-05 10:29:05', 1, 1.38, 2.5);
INSERT INTO `web_user_orders` VALUES (100818, 200006, 102900005116905, '2024-04-07 15:53:05', 0, '2024-03-25 10:37:20', '2024-03-30 06:31:54', 1, 1.12, 10.14);
INSERT INTO `web_user_orders` VALUES (100819, 200006, 102900005116042, '2024-04-08 09:26:32', 0, '2024-03-25 05:59:49', '2024-04-01 08:03:03', 0, 1.02, 6.54);
INSERT INTO `web_user_orders` VALUES (100820, 200010, 102900005115984, '2024-04-05 05:29:13', 0, '2024-03-24 20:31:02', '2024-03-30 17:19:27', 0, 1.47, 4.65);
INSERT INTO `web_user_orders` VALUES (100821, 200001, 102900011008577, '2024-04-05 19:28:09', 0, '2024-03-29 16:06:50', '2024-03-29 15:34:58', 0, 1.41, 5.91);
INSERT INTO `web_user_orders` VALUES (100822, 200009, 102900005115960, '2024-04-08 03:51:50', 0, '2024-03-25 11:33:42', '2024-03-31 05:19:07', 0, 2.19, 4.8);
INSERT INTO `web_user_orders` VALUES (100823, 200004, 102900005116714, '2024-04-07 22:49:34', 0, '2024-03-28 23:09:37', '2024-04-02 20:26:33', 0, 1.88, 16.15);
INSERT INTO `web_user_orders` VALUES (100824, 200002, 102900011008485, '2024-04-08 09:03:37', 0, '2024-03-29 10:04:50', '2024-04-01 23:03:52', 0, 2.18, 8.81);
INSERT INTO `web_user_orders` VALUES (100825, 200005, 102900011007471, '2024-04-06 06:17:47', 0, '2024-03-27 09:18:45', '2024-03-31 03:47:40', 0, 1.17, 12.26);
INSERT INTO `web_user_orders` VALUES (100826, 200003, 102900005116042, '2024-04-08 20:44:24', 0, '2024-03-29 00:13:20', '2024-04-02 22:27:46', 1, 1.97, 13.91);
INSERT INTO `web_user_orders` VALUES (100827, 200004, 102900011009277, '2024-04-08 03:31:49', 0, '2024-03-26 02:51:38', '2024-03-29 09:08:37', 0, 1.2, 7.8);
INSERT INTO `web_user_orders` VALUES (100828, 200009, 102900005116905, '2024-04-05 20:45:50', 0, '2024-03-25 14:59:17', '2024-03-30 16:49:00', 1, 1.97, 17.75);
INSERT INTO `web_user_orders` VALUES (100829, 200006, 102900005115625, '2024-04-07 22:57:48', 0, '2024-03-25 23:39:04', '2024-04-03 17:22:07', 0, 2.01, 5.89);
INSERT INTO `web_user_orders` VALUES (100830, 200005, 102900011034325, '2024-04-05 02:51:37', 0, '2024-03-29 10:18:57', '2024-03-30 05:22:09', 1, 1.83, 9.15);
INSERT INTO `web_user_orders` VALUES (100831, 200001, 102900011000335, '2024-04-07 23:25:14', 0, '2024-03-29 08:33:28', '2024-04-03 19:59:02', 1, 1.76, 4.84);
INSERT INTO `web_user_orders` VALUES (100832, 200006, 102900005116219, '2024-04-06 09:09:49', 0, '2024-03-24 16:33:19', '2024-03-30 13:54:36', 0, 1.97, 36.74);
INSERT INTO `web_user_orders` VALUES (100833, 200006, 102900005115977, '2024-04-07 21:03:50', 0, '2024-03-26 21:36:54', '2024-04-02 10:44:04', 1, 1.81, 13.21);
INSERT INTO `web_user_orders` VALUES (100834, 200004, 102900011008577, '2024-04-05 19:00:47', 0, '2024-03-27 17:55:17', '2024-03-29 10:18:24', 1, 1.59, 7.6);
INSERT INTO `web_user_orders` VALUES (100835, 200005, 102900005116806, '2024-04-08 14:37:03', 0, '2024-03-23 22:51:36', '2024-03-29 15:20:26', 0, 1.28, 4.94);
INSERT INTO `web_user_orders` VALUES (100836, 200008, 102900005116233, '2024-04-08 23:53:08', 0, '2024-03-25 21:11:03', '2024-03-31 12:45:38', 1, 1.13, 9.99);
INSERT INTO `web_user_orders` VALUES (100837, 200010, 102900005115762, '2024-04-06 07:50:38', 0, '2024-03-27 03:56:19', '2024-03-30 13:03:34', 1, 2.02, 21.49);
INSERT INTO `web_user_orders` VALUES (100838, 200003, 102900005115779, '2024-04-07 14:26:52', 0, '2024-03-23 10:17:39', '2024-04-03 11:45:39', 1, 1.27, 5.55);
INSERT INTO `web_user_orders` VALUES (100839, 200002, 102900011000328, '2024-04-05 05:38:20', 0, '2024-03-25 10:55:17', '2024-03-31 14:55:58', 1, 1.66, 15.95);
INSERT INTO `web_user_orders` VALUES (100840, 200006, 102900005115625, '2024-04-07 11:42:56', 0, '2024-03-24 12:50:46', '2024-03-30 17:29:54', 0, 1.63, 5.28);
INSERT INTO `web_user_orders` VALUES (100842, 200004, 102900005115861, '2024-04-08 23:37:26', 0, '2024-03-29 21:27:21', '2024-03-30 18:48:34', 0, 1.37, 2.67);
INSERT INTO `web_user_orders` VALUES (100843, 200004, 102900005115748, '2024-04-05 21:45:11', 0, '2024-03-24 05:43:46', '2024-04-05 04:40:50', 0, 1.37, 7.9);
INSERT INTO `web_user_orders` VALUES (100844, 200009, 102900005116806, '2024-04-05 21:28:54', 0, '2024-03-23 11:39:53', '2024-04-04 15:31:09', 0, 1.2, 4.66);
INSERT INTO `web_user_orders` VALUES (100845, 200003, 102900005115625, '2024-04-06 01:50:07', 0, '2024-03-29 05:20:00', '2024-04-02 04:25:34', 0, 1.43, 4.95);
INSERT INTO `web_user_orders` VALUES (100846, 200007, 102900005115977, '2024-04-07 01:34:53', 0, '2024-03-23 19:23:15', '2024-03-31 04:38:22', 0, 1.41, 7.28);
INSERT INTO `web_user_orders` VALUES (100847, 200006, 102900005115786, '2024-04-06 05:21:16', 0, '2024-03-23 17:02:41', '2024-04-04 12:57:56', 1, 1.28, 4.42);
INSERT INTO `web_user_orders` VALUES (100848, 200004, 102900005125808, '2024-04-05 01:37:57', 0, '2024-03-27 01:47:31', '2024-03-29 10:22:23', 0, 1.42, 21.13);
INSERT INTO `web_user_orders` VALUES (100849, 200008, 102900011000335, '2024-04-08 08:44:18', 0, '2024-03-28 13:20:33', '2024-03-30 04:26:50', 0, 1.6, 3.79);
INSERT INTO `web_user_orders` VALUES (100850, 200001, 102900011018522, '2024-04-07 16:35:16', 0, '2024-03-29 22:20:11', '2024-04-02 01:15:50', 0, 1.37, 5.37);
INSERT INTO `web_user_orders` VALUES (100851, 200007, 102900005125808, '2024-04-05 05:42:01', 0, '2024-03-29 14:58:24', '2024-04-04 14:12:35', 0, 1.47, 20.87);
INSERT INTO `web_user_orders` VALUES (100852, 200001, 102900005115793, '2024-04-06 15:29:23', 0, '2024-03-28 09:38:35', '2024-03-29 11:42:02', 0, 1.88, 22.01);
INSERT INTO `web_user_orders` VALUES (100853, 200007, 102900011007969, '2024-04-06 07:50:40', 0, '2024-03-27 12:42:38', '2024-04-04 05:09:09', 0, 1.44, 11.17);
INSERT INTO `web_user_orders` VALUES (100854, 200002, 102900005115977, '2024-04-05 13:31:39', 0, '2024-03-28 10:04:30', '2024-03-31 13:17:06', 0, 1.46, 9.68);
INSERT INTO `web_user_orders` VALUES (100855, 200002, 102900005115625, '2024-04-05 10:40:07', 0, '2024-03-23 05:32:07', '2024-03-31 08:07:17', 0, 1.02, 2.68);
INSERT INTO `web_user_orders` VALUES (100857, 200003, 102900011008164, '2024-04-08 19:55:52', 0, '2024-03-29 20:03:18', '2024-03-29 01:45:59', 0, 2.09, 7.96);
INSERT INTO `web_user_orders` VALUES (100858, 200005, 102900005116905, '2024-04-07 10:48:50', 0, '2024-03-25 03:08:50', '2024-04-01 17:13:39', 1, 1.18, 13.24);
INSERT INTO `web_user_orders` VALUES (100859, 200007, 102900005116806, '2024-04-05 18:49:46', 0, '2024-03-27 07:45:39', '2024-04-01 04:18:51', 1, 1.7, 5.53);
INSERT INTO `web_user_orders` VALUES (100860, 200008, 102900011034224, '2024-04-05 18:03:44', 0, '2024-03-29 09:29:19', '2024-03-29 18:16:23', 1, 1.87, 3.01);
INSERT INTO `web_user_orders` VALUES (100861, 200004, 102900005116714, '2024-04-08 19:34:06', 0, '2024-03-25 09:22:34', '2024-04-05 11:05:08', 1, 1.67, 13.88);
INSERT INTO `web_user_orders` VALUES (100862, 200003, 102900011007969, '2024-04-07 12:50:47', 0, '2024-03-23 01:40:57', '2024-04-05 05:55:20', 1, 1.12, 10.07);
INSERT INTO `web_user_orders` VALUES (100863, 200005, 102900011007464, '2024-04-07 02:31:23', 0, '2024-03-28 07:57:20', '2024-03-31 21:21:58', 1, 2.02, 22.54);
INSERT INTO `web_user_orders` VALUES (100864, 200002, 102900011007464, '2024-04-06 00:41:15', 0, '2024-03-28 10:30:52', '2024-04-03 20:59:46', 0, 1.38, 13.73);
INSERT INTO `web_user_orders` VALUES (100865, 200003, 102900005128748, '2024-04-06 08:17:58', 0, '2024-03-27 22:25:57', '2024-04-05 15:43:25', 0, 1.37, 93.39);
INSERT INTO `web_user_orders` VALUES (100866, 200003, 102900011009277, '2024-04-06 13:15:10', 0, '2024-03-23 10:18:32', '2024-03-30 18:14:53', 0, 1.11, 8.42);
INSERT INTO `web_user_orders` VALUES (100867, 200003, 102900011008485, '2024-04-06 09:25:27', 0, '2024-03-24 05:42:06', '2024-04-03 23:56:18', 0, 2.11, 8.8);
INSERT INTO `web_user_orders` VALUES (100868, 200004, 102900011008164, '2024-04-07 16:53:25', 0, '2024-03-26 03:44:27', '2024-03-31 23:56:00', 0, 1.87, 6.02);
INSERT INTO `web_user_orders` VALUES (100869, 200005, 102900005115762, '2024-04-05 21:22:15', 0, '2024-03-23 19:48:07', '2024-03-31 12:35:52', 1, 1.5, 17.25);
INSERT INTO `web_user_orders` VALUES (100870, 200005, 102900005115823, '2024-04-08 19:11:47', 0, '2024-03-26 00:17:39', '2024-04-04 17:16:53', 0, 1.56, 10.51);
INSERT INTO `web_user_orders` VALUES (100871, 200002, 102900011008577, '2024-04-06 15:52:19', 0, '2024-03-28 12:20:55', '2024-04-05 16:32:13', 0, 1.1, 4.46);
INSERT INTO `web_user_orders` VALUES (100873, 200007, 102900011008164, '2024-04-08 18:42:38', 0, '2024-03-28 13:33:49', '2024-03-30 03:08:25', 1, 1.18, 3.33);
INSERT INTO `web_user_orders` VALUES (100874, 200007, 102900005115786, '2024-04-07 08:28:03', 0, '2024-03-25 03:42:17', '2024-04-04 20:20:54', 0, 1.7, 6.7);
INSERT INTO `web_user_orders` VALUES (100875, 200007, 102900005116233, '2024-04-08 14:02:15', 0, '2024-03-26 11:00:59', '2024-03-31 18:09:18', 1, 1.87, 17.2);
INSERT INTO `web_user_orders` VALUES (100876, 200003, 102900005115625, '2024-04-05 16:38:08', 0, '2024-03-28 19:18:33', '2024-04-03 16:23:08', 0, 1.64, 4.79);
INSERT INTO `web_user_orders` VALUES (100877, 200009, 102900011010563, '2024-04-08 23:43:10', 0, '2024-03-23 01:49:28', '2024-04-05 19:01:48', 1, 1.7, 140.95);
INSERT INTO `web_user_orders` VALUES (100878, 200006, 102900011008522, '2024-04-05 19:05:31', 0, '2024-03-28 10:33:49', '2024-03-30 19:17:57', 1, 1.26, 4.65);
INSERT INTO `web_user_orders` VALUES (100879, 200003, 102900005116233, '2024-04-06 21:54:23', 0, '2024-03-26 22:56:05', '2024-03-29 15:38:35', 1, 2.11, 18.99);
INSERT INTO `web_user_orders` VALUES (100880, 200005, 102900011016909, '2024-04-06 17:26:42', 0, '2024-03-27 12:25:25', '2024-04-03 05:51:55', 1, 1.75, 10.13);
INSERT INTO `web_user_orders` VALUES (100881, 200009, 102900011033999, '2024-04-05 15:44:56', 0, '2024-03-25 09:32:31', '2024-03-30 04:28:30', 1, 1.72, 11.47);
INSERT INTO `web_user_orders` VALUES (100882, 200005, 102900011007969, '2024-04-08 06:22:33', 0, '2024-03-24 00:02:16', '2024-03-29 16:52:27', 1, 1.81, 15.39);
INSERT INTO `web_user_orders` VALUES (100883, 200001, 102900011008164, '2024-04-06 17:30:55', 0, '2024-03-26 20:57:59', '2024-03-31 20:01:49', 1, 1.56, 4.87);
INSERT INTO `web_user_orders` VALUES (100884, 200004, 102900011034324, '2024-04-08 14:00:16', 0, '2024-03-27 02:24:25', '2024-04-03 13:13:08', 0, 1.93, 4.96);
INSERT INTO `web_user_orders` VALUES (100885, 200001, 102900011034324, '2024-04-08 21:55:01', 0, '2024-03-26 13:24:24', '2024-04-05 03:07:56', 0, 1.65, 4.93);
INSERT INTO `web_user_orders` VALUES (100886, 200006, 102900011000335, '2024-04-07 23:50:34', 0, '2024-03-23 03:02:48', '2024-04-01 13:29:01', 0, 1.38, 3.62);
INSERT INTO `web_user_orders` VALUES (100887, 200002, 102900005115823, '2024-04-05 11:54:34', 0, '2024-03-25 12:17:13', '2024-04-03 03:19:38', 0, 1.11, 7.36);
INSERT INTO `web_user_orders` VALUES (100888, 200010, 102900005115625, '2024-04-05 20:36:42', 0, '2024-03-23 09:42:46', '2024-03-30 16:23:43', 1, 2.16, 7.52);
INSERT INTO `web_user_orders` VALUES (100889, 200008, 102900011034224, '2024-04-07 07:05:03', 0, '2024-03-27 23:49:51', '2024-04-03 16:10:17', 0, 1.69, 2.77);
INSERT INTO `web_user_orders` VALUES (100890, 200008, 102900011034325, '2024-04-05 16:15:21', 0, '2024-03-25 19:28:04', '2024-04-03 06:53:54', 0, 1.23, 6.94);
INSERT INTO `web_user_orders` VALUES (100891, 200002, 102900111034326, '2024-04-05 10:32:13', 0, '2024-03-23 04:11:03', '2024-03-29 05:14:28', 0, 1.61, 1.48);
INSERT INTO `web_user_orders` VALUES (100892, 200003, 102900005128748, '2024-04-05 13:14:11', 0, '2024-03-23 23:13:55', '2024-04-01 07:45:18', 1, 2.18, 114.89);
INSERT INTO `web_user_orders` VALUES (100893, 200005, 102900011034326, '2024-04-08 13:48:36', 0, '2024-03-25 14:54:57', '2024-04-03 16:23:52', 0, 1.14, 1.15);
INSERT INTO `web_user_orders` VALUES (100894, 200001, 102900005116233, '2024-04-08 11:28:51', 0, '2024-03-23 22:13:29', '2024-03-31 11:21:16', 1, 1.37, 13.62);
INSERT INTO `web_user_orders` VALUES (100895, 200009, 102900011000328, '2024-04-08 03:03:18', 0, '2024-03-29 01:06:47', '2024-03-30 16:30:07', 1, 2.05, 18.51);
INSERT INTO `web_user_orders` VALUES (100896, 200006, 102900011009277, '2024-04-05 16:48:43', 0, '2024-03-24 01:11:39', '2024-04-01 13:05:27', 1, 1.93, 13.59);
INSERT INTO `web_user_orders` VALUES (100897, 200010, 102900011034326, '2024-04-07 11:40:43', 0, '2024-03-26 08:30:26', '2024-04-05 03:08:42', 1, 2.1, 1.87);
INSERT INTO `web_user_orders` VALUES (100898, 200003, 102900011008522, '2024-04-05 12:42:26', 0, '2024-03-26 22:27:07', '2024-04-02 08:07:11', 0, 1.43, 4.89);
INSERT INTO `web_user_orders` VALUES (100899, 200004, 102900005115786, '2024-04-06 01:25:57', 0, '2024-03-24 11:32:15', '2024-04-01 18:33:20', 1, 1.78, 8.54);
INSERT INTO `web_user_orders` VALUES (100900, 200007, 102900011009277, '2024-04-08 04:25:02', 0, '2024-03-26 03:46:54', '2024-03-29 01:14:16', 1, 1.06, 8.75);
INSERT INTO `web_user_orders` VALUES (100901, 200004, 102900011008577, '2024-04-08 14:18:49', 0, '2024-03-28 07:39:45', '2024-03-30 13:29:16', 0, 1.22, 4.94);
INSERT INTO `web_user_orders` VALUES (100902, 200008, 102900011009277, '2024-04-08 13:31:05', 0, '2024-03-29 06:59:20', '2024-04-03 15:42:24', 0, 1.06, 6.94);
INSERT INTO `web_user_orders` VALUES (100903, 200005, 102900005115984, '2024-04-05 00:35:44', 0, '2024-03-28 23:53:48', '2024-03-31 05:05:52', 0, 1.28, 4.52);
INSERT INTO `web_user_orders` VALUES (100904, 200003, 102900011006955, '2024-04-06 03:21:51', 0, '2024-03-25 00:06:56', '2024-03-29 09:51:41', 1, 1.06, 7.02);
INSERT INTO `web_user_orders` VALUES (100905, 200010, 102900005128748, '2024-04-08 02:47:56', 0, '2024-03-25 16:20:13', '2024-04-05 01:28:51', 0, 2.04, 145.51);
INSERT INTO `web_user_orders` VALUES (100906, 200005, 102900011016909, '2024-04-07 05:04:15', 0, '2024-03-29 17:58:12', '2024-03-29 15:35:47', 1, 1.03, 8.42);
INSERT INTO `web_user_orders` VALUES (100907, 200002, 102900011000335, '2024-04-07 19:55:55', 0, '2024-03-29 18:04:53', '2024-04-03 03:20:19', 0, 1.84, 4.86);
INSERT INTO `web_user_orders` VALUES (100908, 200003, 102900211034326, '2024-04-05 17:08:47', 0, '2024-03-29 07:34:38', '2024-03-29 09:17:45', 0, 1.06, 1.01);
INSERT INTO `web_user_orders` VALUES (100909, 200005, 102900005115861, '2024-04-06 21:55:48', 0, '2024-03-26 15:58:59', '2024-04-04 23:13:28', 1, 1.81, 3.02);
INSERT INTO `web_user_orders` VALUES (100910, 200006, 102900011007471, '2024-04-08 22:44:43', 0, '2024-03-24 10:27:31', '2024-03-29 09:32:10', 0, 1.39, 14.43);
INSERT INTO `web_user_orders` VALUES (100911, 200007, 102900005115984, '2024-04-05 08:35:49', 0, '2024-03-25 07:53:18', '2024-04-02 09:13:30', 0, 1.15, 3.73);
INSERT INTO `web_user_orders` VALUES (100913, 200004, 102900005118831, '2024-04-07 13:10:05', 0, '2024-03-28 22:43:06', '2024-04-05 23:31:26', 1, 1.99, 5.33);
INSERT INTO `web_user_orders` VALUES (100914, 200003, 102900111034326, '2024-04-06 18:42:34', 0, '2024-03-29 10:32:34', '2024-03-30 08:12:59', 1, 2.08, 2.23);
INSERT INTO `web_user_orders` VALUES (100915, 200003, 102900011006955, '2024-04-07 14:45:14', 0, '2024-03-25 05:20:24', '2024-03-31 11:07:33', 1, 1.81, 12.8);
INSERT INTO `web_user_orders` VALUES (100916, 200002, 102900005115977, '2024-04-07 05:32:35', 0, '2024-03-28 05:06:52', '2024-03-29 15:35:29', 0, 1.9, 12.77);
INSERT INTO `web_user_orders` VALUES (100917, 200002, 102900011006955, '2024-04-06 13:31:07', 0, '2024-03-24 15:22:51', '2024-04-03 11:34:52', 0, 1.14, 8.76);
INSERT INTO `web_user_orders` VALUES (100918, 200006, 102900011018132, '2024-04-07 16:56:43', 0, '2024-03-27 07:54:33', '2024-04-02 01:44:21', 1, 1.54, 16.08);
INSERT INTO `web_user_orders` VALUES (100919, 200003, 102900005118831, '2024-04-06 02:49:52', 0, '2024-03-26 15:03:29', '2024-04-02 00:52:50', 0, 1.55, 4.77);
INSERT INTO `web_user_orders` VALUES (100920, 200007, 102900005116905, '2024-04-05 08:45:44', 0, '2024-03-24 00:55:51', '2024-04-01 14:46:53', 1, 1.8, 18.05);
INSERT INTO `web_user_orders` VALUES (100921, 200009, 102900005115984, '2024-04-08 02:58:14', 0, '2024-03-24 08:26:27', '2024-04-02 00:59:44', 1, 1.64, 5.3);
INSERT INTO `web_user_orders` VALUES (100922, 200007, 102900005115762, '2024-04-08 18:30:10', 0, '2024-03-24 09:50:54', '2024-04-02 18:31:33', 1, 1.21, 13.16);
INSERT INTO `web_user_orders` VALUES (100923, 200009, 102900011022764, '2024-04-05 19:38:32', 0, '2024-03-26 21:54:41', '2024-03-29 17:21:57', 1, 1.61, 6.92);
INSERT INTO `web_user_orders` VALUES (100924, 200008, 102900011018132, '2024-04-08 20:06:34', 0, '2024-03-29 06:59:11', '2024-03-31 12:35:01', 1, 1.19, 13.48);
INSERT INTO `web_user_orders` VALUES (100925, 200004, 102900011007464, '2024-04-07 07:21:01', 0, '2024-03-28 22:22:10', '2024-03-31 22:23:35', 1, 1.49, 15.12);
INSERT INTO `web_user_orders` VALUES (100926, 200010, 102900011008485, '2024-04-06 06:13:52', 0, '2024-03-26 10:18:34', '2024-04-02 08:22:41', 1, 1.37, 5.14);
INSERT INTO `web_user_orders` VALUES (100928, 200005, 102900011011058, '2024-04-08 13:30:38', 0, '2024-03-28 02:10:30', '2024-04-03 12:16:07', 0, 1.25, 91.35);
INSERT INTO `web_user_orders` VALUES (100929, 200001, 102900011034324, '2024-04-06 12:49:10', 0, '2024-03-28 15:15:44', '2024-04-04 02:43:13', 0, 1.26, 3.48);
INSERT INTO `web_user_orders` VALUES (100930, 200008, 102900005115861, '2024-04-06 03:20:54', 0, '2024-03-27 10:42:07', '2024-03-30 19:48:29', 1, 1.2, 2.24);
INSERT INTO `web_user_orders` VALUES (100931, 200009, 102900011009277, '2024-04-08 04:38:12', 0, '2024-03-24 06:08:26', '2024-03-29 19:29:52', 0, 1.25, 8.74);
INSERT INTO `web_user_orders` VALUES (100932, 200003, 102900005115779, '2024-04-08 08:24:30', 0, '2024-03-23 17:13:35', '2024-04-05 05:21:01', 1, 1.62, 7.95);
INSERT INTO `web_user_orders` VALUES (100933, 200005, 102900005115779, '2024-04-05 16:21:59', 0, '2024-03-24 15:29:20', '2024-04-04 23:52:42', 1, 2.1, 12.12);
INSERT INTO `web_user_orders` VALUES (100934, 200009, 102900005128748, '2024-04-08 07:26:43', 0, '2024-03-26 16:22:15', '2024-04-01 02:37:04', 0, 1.89, 129.12);
INSERT INTO `web_user_orders` VALUES (100935, 200010, 102900011007471, '2024-04-08 10:30:35', 0, '2024-03-25 03:25:54', '2024-03-30 03:15:27', 1, 2, 17.2);
INSERT INTO `web_user_orders` VALUES (100936, 200005, 102900011000175, '2024-04-08 18:13:45', 0, '2024-03-25 01:59:16', '2024-04-03 20:27:39', 1, 1.22, 6.62);
INSERT INTO `web_user_orders` VALUES (100937, 200006, 102900005115779, '2024-04-06 21:38:47', 0, '2024-03-28 21:02:09', '2024-04-04 17:28:24', 1, 2.14, 9.37);
INSERT INTO `web_user_orders` VALUES (100939, 200004, 102900005115960, '2024-04-08 07:34:14', 0, '2024-03-23 03:58:37', '2024-04-03 11:01:23', 1, 1.97, 4.2);
INSERT INTO `web_user_orders` VALUES (100940, 200003, 102900011016909, '2024-04-08 12:04:16', 0, '2024-03-28 12:47:29', '2024-03-31 19:03:21', 0, 2.03, 13.07);
INSERT INTO `web_user_orders` VALUES (100941, 200003, 102900011008485, '2024-04-08 09:15:37', 0, '2024-03-25 18:32:41', '2024-03-30 13:20:34', 0, 1.09, 4.02);
INSERT INTO `web_user_orders` VALUES (100942, 200009, 102900005115625, '2024-04-05 05:30:40', 0, '2024-03-28 01:42:56', '2024-03-30 15:39:03', 1, 1.86, 5.38);
INSERT INTO `web_user_orders` VALUES (100943, 200003, 102900005128748, '2024-04-05 04:17:17', 0, '2024-03-23 05:29:39', '2024-04-02 12:44:42', 1, 2.06, 118);
INSERT INTO `web_user_orders` VALUES (100944, 200003, 102900011006955, '2024-04-05 01:34:48', 0, '2024-03-28 22:45:09', '2024-04-04 21:08:43', 0, 1.36, 12.06);
INSERT INTO `web_user_orders` VALUES (100945, 200008, 102900111034326, '2024-04-07 15:39:46', 0, '2024-03-25 15:14:07', '2024-04-03 15:51:46', 0, 2.01, 1.91);
INSERT INTO `web_user_orders` VALUES (100946, 200006, 102900011008577, '2024-04-06 19:00:37', 0, '2024-03-29 08:52:02', '2024-03-31 21:45:50', 0, 1.4, 6.19);
INSERT INTO `web_user_orders` VALUES (100947, 200010, 102900005115625, '2024-04-07 12:52:58', 0, '2024-03-23 23:45:49', '2024-04-05 05:36:11', 1, 1.81, 6.01);
INSERT INTO `web_user_orders` VALUES (100948, 200004, 102900005116905, '2024-04-06 04:18:32', 0, '2024-03-29 04:54:28', '2024-03-30 16:04:09', 1, 1.99, 22.31);
INSERT INTO `web_user_orders` VALUES (100949, 200007, 102900005115861, '2024-04-07 18:55:46', 0, '2024-03-29 19:59:42', '2024-04-03 19:19:19', 0, 1.66, 2.87);
INSERT INTO `web_user_orders` VALUES (100950, 200003, 102900005115625, '2024-04-07 18:04:01', 0, '2024-03-28 07:50:28', '2024-04-02 15:08:44', 1, 1.09, 3.07);
INSERT INTO `web_user_orders` VALUES (100951, 200002, 102900011033920, '2024-04-06 21:22:52', 0, '2024-03-28 16:39:31', '2024-04-04 03:15:26', 1, 1.63, 7.79);
INSERT INTO `web_user_orders` VALUES (100952, 200008, 102900005115960, '2024-04-05 13:26:24', 0, '2024-03-23 06:39:46', '2024-04-04 20:24:00', 0, 1.32, 2.77);
INSERT INTO `web_user_orders` VALUES (100954, 200003, 102900005115984, '2024-04-05 10:04:10', 0, '2024-03-28 04:13:31', '2024-03-31 01:42:40', 0, 1.4, 5.87);
INSERT INTO `web_user_orders` VALUES (100955, 200007, 102900011007471, '2024-04-05 13:14:31', 0, '2024-03-23 12:52:03', '2024-04-01 12:08:24', 0, 2.15, 19.11);
INSERT INTO `web_user_orders` VALUES (100956, 200005, 102900005118817, '2024-04-07 08:42:40', 0, '2024-03-23 14:58:13', '2024-03-30 20:38:48', 0, 1.24, 8.69);
INSERT INTO `web_user_orders` VALUES (100957, 200006, 102900005115960, '2024-04-08 18:44:15', 0, '2024-03-29 21:11:58', '2024-03-31 03:34:53', 1, 1.29, 2.98);
INSERT INTO `web_user_orders` VALUES (100958, 200007, 102900011010563, '2024-04-05 09:59:54', 0, '2024-03-24 15:09:39', '2024-04-03 13:35:46', 1, 1.85, 171.25);
INSERT INTO `web_user_orders` VALUES (100959, 200007, 102900011033999, '2024-04-08 22:07:27', 0, '2024-03-26 15:12:31', '2024-04-05 15:11:41', 1, 1.4, 10.37);
INSERT INTO `web_user_orders` VALUES (100960, 200001, 102900011018522, '2024-04-06 10:29:13', 0, '2024-03-29 09:30:27', '2024-04-03 17:20:14', 0, 2.16, 9.78);
INSERT INTO `web_user_orders` VALUES (100961, 200001, 102900005115823, '2024-04-07 21:45:17', 0, '2024-03-26 05:58:56', '2024-04-04 00:06:37', 0, 1.38, 7.12);
INSERT INTO `web_user_orders` VALUES (100962, 200002, 102900005115762, '2024-04-08 15:31:21', 0, '2024-03-26 06:28:16', '2024-03-31 12:12:01', 0, 1.44, 17.19);
INSERT INTO `web_user_orders` VALUES (100963, 200005, 102900005116042, '2024-04-05 08:01:14', 0, '2024-03-29 05:19:21', '2024-03-29 00:21:52', 1, 1.13, 8.31);
INSERT INTO `web_user_orders` VALUES (100964, 200006, 102900211034326, '2024-04-07 17:44:53', 0, '2024-03-28 02:42:04', '2024-04-02 02:29:27', 1, 1.95, 1.62);
INSERT INTO `web_user_orders` VALUES (100965, 200001, 102900011008164, '2024-04-08 16:12:27', 0, '2024-03-27 11:06:49', '2024-03-29 07:55:56', 0, 2.18, 7.59);
INSERT INTO `web_user_orders` VALUES (100966, 200008, 102900111034326, '2024-04-06 18:27:14', 0, '2024-03-28 13:01:49', '2024-03-31 04:31:34', 1, 1.78, 1.48);
INSERT INTO `web_user_orders` VALUES (100967, 200006, 102900005115977, '2024-04-07 03:32:47', 0, '2024-03-25 07:00:41', '2024-04-01 11:29:51', 1, 1.5, 10.86);
INSERT INTO `web_user_orders` VALUES (100968, 200009, 102900011018132, '2024-04-05 20:02:55', 0, '2024-03-29 19:36:57', '2024-04-03 20:33:09', 1, 1.15, 9.42);
INSERT INTO `web_user_orders` VALUES (100969, 200005, 102900011006689, '2024-04-06 02:53:43', 0, '2024-03-25 02:47:37', '2024-03-29 22:19:37', 1, 1.79, 11.35);
INSERT INTO `web_user_orders` VALUES (100970, 200006, 102900005116226, '2024-04-07 19:23:08', 0, '2024-03-24 22:59:20', '2024-04-04 12:37:05', 1, 1.37, 4.63);
INSERT INTO `web_user_orders` VALUES (100971, 200007, 102900011022764, '2024-04-06 09:54:05', 0, '2024-03-26 15:06:32', '2024-04-01 21:44:33', 1, 2.13, 9.33);
INSERT INTO `web_user_orders` VALUES (100972, 200003, 102900005115762, '2024-04-08 17:39:16', 0, '2024-03-23 19:22:36', '2024-04-01 06:34:34', 0, 1.11, 11.66);
INSERT INTO `web_user_orders` VALUES (100973, 200010, 102900011033920, '2024-04-06 00:27:54', 0, '2024-03-23 05:38:44', '2024-03-29 17:27:52', 1, 1.4, 7.04);
INSERT INTO `web_user_orders` VALUES (100974, 200008, 102900011034326, '2024-04-06 20:21:32', 0, '2024-03-26 00:52:41', '2024-04-01 22:46:34', 1, 1.61, 1.56);
INSERT INTO `web_user_orders` VALUES (100975, 200010, 102900005116905, '2024-04-07 06:47:09', 0, '2024-03-24 18:26:41', '2024-04-04 16:08:02', 1, 1.73, 19.03);
INSERT INTO `web_user_orders` VALUES (100976, 200004, 102900005116233, '2024-04-08 14:48:20', 0, '2024-03-24 16:24:48', '2024-04-03 07:29:59', 0, 2.12, 17.28);
INSERT INTO `web_user_orders` VALUES (100977, 200009, 102900011016909, '2024-04-08 05:28:30', 0, '2024-03-27 14:04:43', '2024-03-29 11:58:49', 0, 1.4, 9.28);
INSERT INTO `web_user_orders` VALUES (100978, 200008, 102900011022764, '2024-04-06 16:17:26', 0, '2024-03-23 23:31:40', '2024-04-03 19:10:03', 1, 2.19, 11.04);
INSERT INTO `web_user_orders` VALUES (100979, 200010, 102900011000328, '2024-04-05 23:11:37', 0, '2024-03-25 19:57:16', '2024-04-04 01:36:09', 1, 1.87, 16.47);
INSERT INTO `web_user_orders` VALUES (100980, 200004, 102900011008522, '2024-04-07 16:11:23', 0, '2024-03-24 17:07:38', '2024-03-29 15:26:39', 0, 2.1, 7.75);
INSERT INTO `web_user_orders` VALUES (100981, 200004, 102900011010563, '2024-04-05 19:23:29', 0, '2024-03-23 01:08:52', '2024-03-29 15:05:30', 0, 2.01, 145.95);
INSERT INTO `web_user_orders` VALUES (100982, 200002, 102900005115762, '2024-04-07 01:00:49', 0, '2024-03-23 08:59:59', '2024-04-04 21:49:04', 1, 1.97, 20.03);
INSERT INTO `web_user_orders` VALUES (100983, 200007, 102900011034323, '2024-04-08 14:38:41', 0, '2024-03-27 04:38:58', '2024-03-29 11:37:42', 0, 1.97, 28.62);
INSERT INTO `web_user_orders` VALUES (100984, 200005, 102900011018132, '2024-04-08 08:24:16', 0, '2024-03-23 09:22:47', '2024-04-05 09:36:53', 1, 1.16, 12.86);
INSERT INTO `web_user_orders` VALUES (100985, 200005, 102900005115960, '2024-04-07 21:23:37', 0, '2024-03-23 14:16:18', '2024-03-29 17:00:00', 1, 1.24, 2.81);
INSERT INTO `web_user_orders` VALUES (100986, 200003, 102900011033920, '2024-04-08 16:57:24', 0, '2024-03-28 20:15:21', '2024-03-30 17:16:59', 0, 1.68, 7.27);
INSERT INTO `web_user_orders` VALUES (100987, 200004, 102900011033920, '2024-04-05 10:57:29', 0, '2024-03-28 21:15:30', '2024-03-31 10:40:08', 1, 2.14, 10.94);
INSERT INTO `web_user_orders` VALUES (100988, 200002, 102900005125808, '2024-04-05 10:11:50', 0, '2024-03-24 06:14:46', '2024-04-04 19:19:21', 1, 2.08, 25.77);
INSERT INTO `web_user_orders` VALUES (100989, 200004, 102900011034326, '2024-04-08 10:14:14', 0, '2024-03-24 12:24:23', '2024-04-04 04:15:33', 0, 1.69, 1.42);
INSERT INTO `web_user_orders` VALUES (100990, 200008, 102900005116226, '2024-04-08 00:02:32', 0, '2024-03-27 03:15:57', '2024-03-31 06:48:27', 0, 1.92, 5.97);
INSERT INTO `web_user_orders` VALUES (100991, 200010, 102900011006689, '2024-04-05 07:09:56', 0, '2024-03-24 09:08:54', '2024-03-29 11:35:38', 1, 1.53, 11.03);
INSERT INTO `web_user_orders` VALUES (100992, 200001, 102900005115861, '2024-04-05 15:51:40', 0, '2024-03-24 17:27:23', '2024-04-01 09:23:14', 1, 1.59, 3.24);
INSERT INTO `web_user_orders` VALUES (100993, 200002, 102900011008164, '2024-04-06 18:30:59', 0, '2024-03-25 19:54:45', '2024-03-31 00:43:52', 0, 1.46, 4.85);
INSERT INTO `web_user_orders` VALUES (100994, 200002, 102900011016909, '2024-04-06 10:03:21', 0, '2024-03-29 21:19:36', '2024-04-01 06:31:27', 1, 1.98, 12.53);
INSERT INTO `web_user_orders` VALUES (100995, 200010, 102900011034325, '2024-04-06 05:03:08', 0, '2024-03-27 01:12:51', '2024-04-02 05:04:43', 0, 1.02, 5.25);
INSERT INTO `web_user_orders` VALUES (100996, 200010, 102900005116226, '2024-04-05 19:42:14', 0, '2024-03-27 09:43:06', '2024-03-30 08:45:50', 1, 2.19, 6.24);
INSERT INTO `web_user_orders` VALUES (100997, 200009, 102900005116905, '2024-04-06 08:12:26', 0, '2024-03-25 19:47:15', '2024-03-29 08:46:04', 0, 1.84, 18.47);
INSERT INTO `web_user_orders` VALUES (100998, 200005, 102900005115625, '2024-04-06 01:20:14', 0, '2024-03-24 07:26:29', '2024-04-02 13:02:18', 1, 1.53, 4.91);
INSERT INTO `web_user_orders` VALUES (100999, 200006, 102900005116042, '2024-04-05 18:22:53', 0, '2024-03-28 13:07:54', '2024-04-01 22:37:15', 0, 1.04, 6.29);
INSERT INTO `web_user_orders` VALUES (101000, 200006, 102900111034326, '2024-04-06 00:09:03', 0, '2024-03-25 01:45:37', '2024-04-01 21:26:37', 1, 1.84, 1.49);
INSERT INTO `web_user_orders` VALUES (105000, 200001, 102900011009277, NULL, 0, '2024-03-08 15:46:10', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105001, 200001, 102900011009277, NULL, 0, '2024-03-08 15:46:10', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105002, 200001, 102900011009277, NULL, 0, '2024-03-08 15:46:10', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105003, 200001, 102900011009277, NULL, 0, '2024-03-08 15:46:10', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105004, 200001, 102900011009277, NULL, 0, '2024-03-08 15:46:10', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105005, 200001, 102900011009277, NULL, 0, '2024-03-08 15:46:10', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105006, 200001, 102900011009277, NULL, 0, '2024-03-08 15:46:10', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105007, 200001, 102900011009277, NULL, 0, '2024-03-08 15:46:10', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105008, 200001, 102900011009277, NULL, 0, '2024-03-08 15:46:10', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105009, 200001, 102900011009277, NULL, 0, '2024-03-08 15:46:11', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105010, 200001, 102900011009277, NULL, 0, '2024-03-08 15:46:11', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105011, 200001, 102900011009277, NULL, 0, '2024-03-08 15:46:11', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105012, 200001, 102900011009277, NULL, 0, '2024-03-08 15:46:11', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105013, 200001, 102900011009277, NULL, 0, '2024-03-08 15:46:11', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105014, 200001, 102900011009277, NULL, 0, '2024-03-08 15:46:11', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105015, 200001, 102900011009277, NULL, 0, '2024-03-08 15:46:11', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105016, 200001, 102900011010563, NULL, 0, '2024-03-08 23:34:37', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105017, 200001, 102900011010563, NULL, 0, '2024-03-08 23:37:52', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105018, 200001, 102900011010563, NULL, 0, '2024-03-08 23:38:08', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105019, 200001, 102900011010563, NULL, 0, '2024-03-08 23:38:38', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105020, 200001, 102900011010563, NULL, 0, '2024-03-08 23:38:39', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105021, 200001, 102900011010563, NULL, 0, '2024-03-08 23:39:50', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105022, 200001, 102900011010563, NULL, 0, '2024-03-08 23:40:04', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105023, 200001, 102900011010563, NULL, 0, '2024-03-08 23:40:15', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105024, 200001, 102900011010563, NULL, 0, '2024-03-08 23:50:34', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105025, 200001, 102900011010563, NULL, 0, '2024-03-08 23:50:38', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105026, 200001, 102900011010563, NULL, 0, '2024-03-08 23:58:44', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105027, 200001, 102900011010563, NULL, 0, '2024-03-08 23:58:44', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105028, 200001, 102900011010563, NULL, 0, '2024-03-08 23:58:44', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105029, 200001, 102900011010563, NULL, 0, '2024-03-08 23:58:44', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105030, 200001, 102900011010563, NULL, 0, '2024-03-08 23:58:47', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105031, 200001, 102900011010563, NULL, 0, '2024-03-08 23:58:47', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105032, 200001, 102900011010563, NULL, 0, '2024-03-09 00:00:19', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105033, 200001, 102900011010563, NULL, 0, '2024-03-09 00:00:19', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105034, 200001, 102900011010563, NULL, 0, '2024-03-09 00:01:25', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105035, 200001, 102900011010563, NULL, 0, '2024-03-09 00:01:25', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105036, 200001, 102900011010563, NULL, 0, '2024-03-09 00:04:05', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105037, 200001, 102900011010563, NULL, 0, '2024-03-09 00:04:05', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105038, 200001, 102900011010563, NULL, 0, '2024-03-09 00:26:26', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105039, 200001, 102900011010563, NULL, 0, '2024-03-09 00:26:26', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105040, 200001, 102900011010563, NULL, 0, '2024-03-09 00:28:41', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105041, 200001, 102900011010563, NULL, 0, '2024-03-09 00:40:26', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105042, 200001, 102900011010563, NULL, 0, '2024-03-09 00:41:54', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105043, 200001, 102900011010563, NULL, 0, '2024-03-09 00:42:04', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105044, 200001, 102900011010563, NULL, 0, '2024-03-09 00:42:09', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105045, 200001, 102900011010563, NULL, 0, '2024-03-09 00:42:12', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105046, 200001, 102900011010563, NULL, 0, '2024-03-09 00:42:26', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105047, 200001, 102900011010563, NULL, 0, '2024-03-09 00:42:32', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105048, 200001, 102900011010563, NULL, 0, '2024-03-09 00:42:33', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105049, 200001, 102900011010563, NULL, 0, '2024-03-09 00:45:12', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105050, 200001, 102900011010563, NULL, 0, '2024-03-09 00:45:23', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105051, 200001, 102900011010563, NULL, 0, '2024-03-09 21:14:51', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105052, 200001, 102900011010563, NULL, 0, '2024-03-09 21:14:51', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105053, 200001, 102900011010563, NULL, 0, '2024-03-09 21:14:56', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105054, 200001, 102900011010563, NULL, 0, '2024-03-09 21:14:56', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105055, 200001, 102900011010563, NULL, 0, '2024-03-09 21:21:05', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105056, 200001, 102900011011058, NULL, 0, '2024-03-09 21:21:05', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105057, 200001, 102900011010563, NULL, 0, '2024-03-09 21:21:28', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105058, 200001, 102900011011058, NULL, 0, '2024-03-09 21:21:29', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105059, 200001, 102900011010563, NULL, 0, '2024-03-09 21:31:27', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105060, 200001, 102900011010563, NULL, 0, '2024-03-09 21:31:27', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105061, 200001, 102900011010563, NULL, 0, '2024-03-09 21:31:30', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105062, 200001, 102900011010563, NULL, 0, '2024-03-09 21:31:30', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105063, 200001, 102900011010563, NULL, 0, '2024-03-09 21:31:33', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105064, 200001, 102900011010563, NULL, 0, '2024-03-09 21:31:33', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105065, 200001, 102900011010563, NULL, 0, '2024-03-09 21:48:30', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105066, 200001, 102900011018132, NULL, 0, '2024-03-09 21:48:30', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105067, 200001, 102900011010563, NULL, 0, '2024-03-09 21:48:53', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105068, 200001, 102900011018132, NULL, 0, '2024-03-09 21:48:53', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105069, 200001, 102900011010563, NULL, 0, '2024-03-09 21:54:57', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105070, 200001, 102900011007969, NULL, 0, '2024-03-09 21:56:28', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105071, 200001, 102900011010563, NULL, 0, '2024-03-09 22:05:53', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105072, 200001, 102900011007969, NULL, 0, '2024-03-09 22:06:58', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105073, 200001, 102900011009277, NULL, 0, '2024-03-10 10:07:41', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105074, 200001, 102900011009277, NULL, 0, '2024-03-10 13:04:53', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105075, 200001, 102900011009277, NULL, 0, '2024-03-10 13:05:01', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105076, 200001, 102900011009277, NULL, 0, '2024-03-10 13:05:27', NULL, 0, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105077, 200005, 102900011007464, NULL, 0, '2024-03-10 23:13:59', NULL, 0, 2, 9.99);
INSERT INTO `web_user_orders` VALUES (105078, 200001, 102900011010563, NULL, 0, '2024-03-11 12:52:28', NULL, 0, NULL, 80);
INSERT INTO `web_user_orders` VALUES (105079, 200001, 102900011009277, NULL, 0, '2024-03-11 12:52:29', NULL, 0, NULL, 7.19);
INSERT INTO `web_user_orders` VALUES (105080, 200001, 102900011010563, NULL, 0, '2024-03-11 12:54:09', NULL, 0, NULL, 80);
INSERT INTO `web_user_orders` VALUES (105081, 200001, 102900011011058, NULL, 0, '2024-03-11 13:00:13', NULL, 0, NULL, 65.98);
INSERT INTO `web_user_orders` VALUES (105082, 200001, 102900011011058, NULL, 0, '2024-03-11 13:00:42', NULL, 0, NULL, 65.98);
INSERT INTO `web_user_orders` VALUES (105083, 200001, 102900011011058, NULL, 0, '2024-03-11 13:03:31', NULL, 0, NULL, 65.98);
INSERT INTO `web_user_orders` VALUES (105084, NULL, NULL, NULL, NULL, '2024-03-11 14:20:25', NULL, NULL, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105085, NULL, NULL, NULL, NULL, '2024-03-11 14:21:03', NULL, NULL, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105086, NULL, NULL, NULL, NULL, '2024-03-11 22:10:41', NULL, NULL, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105087, NULL, NULL, NULL, NULL, '2024-03-12 17:13:39', NULL, NULL, NULL, NULL);
INSERT INTO `web_user_orders` VALUES (105088, 200001, 102900011011058, NULL, 0, '2024-03-12 17:48:16', NULL, 0, NULL, 65.98);
INSERT INTO `web_user_orders` VALUES (105089, 200001, 102900011018132, NULL, 0, '2024-03-12 17:48:16', NULL, 0, NULL, 10.2);
INSERT INTO `web_user_orders` VALUES (105090, 200001, 102900011011058, NULL, 0, '2024-03-12 17:53:24', NULL, 0, NULL, 65.98);
INSERT INTO `web_user_orders` VALUES (105091, 200001, 102900011011058, NULL, 0, '2024-03-12 17:58:11', NULL, 0, NULL, 65.98);
INSERT INTO `web_user_orders` VALUES (105092, 200001, 102900011011058, NULL, 0, '2024-03-12 17:59:33', NULL, 0, NULL, 65.98);
INSERT INTO `web_user_orders` VALUES (105093, 200001, 102900011011058, NULL, 0, '2024-03-12 17:59:40', NULL, 0, NULL, 65.98);
INSERT INTO `web_user_orders` VALUES (105094, 200001, 102900011011058, NULL, 0, '2024-03-12 17:59:47', NULL, 0, NULL, 65.98);
INSERT INTO `web_user_orders` VALUES (105095, 200001, 102900011007969, NULL, 0, '2024-03-12 18:01:30', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105096, 200001, 102900011007969, NULL, 0, '2024-03-12 18:01:39', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105097, 200001, 102900011007969, NULL, 0, '2024-03-12 18:02:11', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105098, 200001, 102900011007969, NULL, 0, '2024-03-12 18:02:11', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105099, 200001, 102900011007969, NULL, 0, '2024-03-12 18:02:15', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105100, 200001, 102900011007969, NULL, 0, '2024-03-12 18:02:16', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105101, 200001, 102900011007969, NULL, 0, '2024-03-12 18:02:42', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105102, 200001, 102900011007969, NULL, 0, '2024-03-12 18:02:46', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105103, 200001, 102900011007969, NULL, 0, '2024-03-12 18:03:55', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105104, 200001, 102900011007969, NULL, 0, '2024-03-12 18:05:00', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105105, 200001, 102900011007969, NULL, 0, '2024-03-12 18:05:43', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105106, 200001, 102900011007969, NULL, 0, '2024-03-12 18:05:52', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105107, 200001, 102900011007969, NULL, 0, '2024-03-12 18:07:05', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105108, 200001, 102900011007969, NULL, 0, '2024-03-12 18:07:12', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105109, 200001, 102900011007969, NULL, 0, '2024-03-12 18:08:33', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105110, 200001, 102900011007969, NULL, 0, '2024-03-12 18:08:41', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105111, 200001, 102900011007969, NULL, 0, '2024-03-12 18:12:02', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105112, 200001, 102900011007969, NULL, 0, '2024-03-12 18:12:05', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105113, 200001, 102900011007969, NULL, 0, '2024-03-12 18:12:53', NULL, 0, NULL, 9.25);
INSERT INTO `web_user_orders` VALUES (105114, 200001, 102900011034324, NULL, 0, '2024-03-12 20:30:11', NULL, 0, NULL, 2.5);
INSERT INTO `web_user_orders` VALUES (105115, 200001, 102900011010563, NULL, 0, '2024-03-12 22:49:26', NULL, 0, NULL, 80);
INSERT INTO `web_user_orders` VALUES (105116, 200001, 102900011010563, NULL, 0, '2024-03-12 23:03:51', NULL, 0, NULL, 80);
INSERT INTO `web_user_orders` VALUES (105117, 200001, 102900011010563, NULL, 0, '2024-03-12 23:03:52', NULL, 0, NULL, 80);
INSERT INTO `web_user_orders` VALUES (105118, 200001, 102900011010563, NULL, 0, '2024-03-12 23:03:55', NULL, 0, NULL, 80);
INSERT INTO `web_user_orders` VALUES (105119, 200001, 102900011010563, NULL, 0, '2024-03-12 23:30:19', NULL, 0, NULL, 80);
INSERT INTO `web_user_orders` VALUES (105120, 200001, 102900011010563, NULL, 0, '2024-03-12 23:30:20', NULL, 0, NULL, 80);

-- ----------------------------
-- Procedure structure for add
-- ----------------------------
DROP PROCEDURE IF EXISTS `add`;
delimiter ;;
CREATE PROCEDURE `add`(IN n int)
BEGIN
    DECLARE i INT DEFAULT 100001;
	WHILE (i <= n ) DO
		INSERT into web_user_orders (flag) VALUES (
		0 + rand() * 5
		);
		set i=i+1;
	END WHILE;
END
;;
delimiter ;

-- ----------------------------
-- Event structure for evt_update_expiration_flag_every_day
-- ----------------------------
DROP EVENT IF EXISTS `evt_update_expiration_flag_every_day`;
delimiter ;;
CREATE EVENT `evt_update_expiration_flag_every_day`
ON SCHEDULE
EVERY '1' DAY STARTS '2024-01-30 00:00:00'
DO UPDATE web_commodity_detail
    SET expiration_flag = CASE
                                  WHEN DATE_ADD(update_time,INTERVAL expiration_time DAY) > NOW() THEN 0
                                  ELSE 1
            END
;;
delimiter ;

-- ----------------------------
-- Event structure for update_expiration_flag_daily
-- ----------------------------
DROP EVENT IF EXISTS `update_expiration_flag_daily`;
delimiter ;;
CREATE EVENT `update_expiration_flag_daily`
ON SCHEDULE
EVERY '1' DAY STARTS '2024-01-30 00:00:00'
DO UPDATE web_user_coupons
        SET expiration_flag = CASE
                                  WHEN DATE_ADD(update_time,INTERVAL expiration_time DAY) > NOW() THEN 0
                                  ELSE 1
            END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table web_commodity_detail
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_web_commodity_detail_update_expiration_flag`;
delimiter ;;
CREATE TRIGGER `trg_web_commodity_detail_update_expiration_flag` BEFORE UPDATE ON `web_commodity_detail` FOR EACH ROW BEGIN
    IF DATE_ADD(NEW.update_time, INTERVAL NEW.expiration_time DAY) > NOW() THEN
        SET NEW.expiration_flag = 0;
    ELSE
        SET NEW.expiration_flag = 1;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table web_user_coupons
-- ----------------------------
DROP TRIGGER IF EXISTS `update_expiration_flag_web_user_coupons`;
delimiter ;;
CREATE TRIGGER `update_expiration_flag_web_user_coupons` BEFORE UPDATE ON `web_user_coupons` FOR EACH ROW BEGIN
    IF DATE_ADD(NEW.update_time, INTERVAL NEW.expiration_time DAY) > NOW() THEN
        SET NEW.expiration_flag = 0;
    ELSE
        SET NEW.expiration_flag = 1;
    END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
