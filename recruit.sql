/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : recruit

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 20/12/2022 20:52:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '企业id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司名称',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司位置',
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '公司描述',
  `contact_id` int NULL DEFAULT NULL COMMENT '负责人用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `contact_id`(`contact_id` ASC) USING BTREE,
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (1, '三一重能', '韶山市清溪镇高新区三一重能', '三一重能股份有限公司（Sany Renewable Energy Co.,Ltd）（股票代码：688349）成立于 2008 年，致力于成为全球清洁能源装备及服务的领航者，三一重能已成为全球综合排名前十、中国陆上前五的风电整机商。主营业务为风电机组的研发、制造与销售，风电场设计、建设、运营管理。三一重能通过整合全球***研发资源，不断自主创新，持续打造具有竞争优势的风机产品，形成了数字化顶层设计、智能化生产制造、整机系统集成、核心部件制造、风场设计、风场 EPC、风场运营维护为一体的风电整体解决方案。 公司总部坐落于北京市昌平区，生产基地遍布湖南、内蒙古、吉林、河北、新疆、甘肃等省份，是“智能制造标杆企业”及“国家知识产权优势企业”。岗位职责：1.设备管理数据的在线收集及分析，对异常情况进行画像考核；2.现场设备故障分析及维修支持，落实故障防再发措施；3.编制设备年度保养计划和设备紧急预警方案，监督设备保养计划的执行，确认保养效果；4.对设备精度检测，对问题设备分析并作出明确计划；5.设备备件的需求分析、统计及申报，通报设备管理异常；6.设备资产管理，包括设备台账建立维护、二手设备的管理、设备分级的评定等。任职要求：1.学历：统招本科以上学历，机械专业优先；2.年龄：不高于40岁；3.工作经验：2年以上设备专项工作，有实施设备技改的经验。优秀应届毕业生亦可；4.知识与专业技能：熟悉设备保养实施的基本流程，掌握设备紧急维修的技巧方法，熟练掌握设备故障分析的能力。', 4);
INSERT INTO `company` VALUES (2, '阿特斯（新能源）', '高新区鹿山路199号', '阿特斯阳光电力是一家由“‘***’***”瞿晓铧博士于2001年11月创办的太阳能光伏公司，2006年公司在美国纳斯达克成功上市，是中国***家登陆美国纳斯达克的光伏一体化企业(纳斯达克代码: CSIQ)。阿特斯阳光电力专业从事硅锭、硅片、太阳能电池片、太阳能组件和太阳能应用产品的研发、生产和销售，以及太阳能电站的系统安装，其光伏产品遍布德国、西班牙、意大利、美国、加拿大、韩国、日本、中国等全球5大洲的30多个国家和地区。', 4);
INSERT INTO `company` VALUES (3, '沃尔核材（新能源）', '青松西路53号沃尔工业园', '深圳市沃尔核材股份有限公司（简称：沃尔核材，股票代码：002130）创建于1998年，是***高新技术企业，专业从事高分子核辐射改性新材料及系列电子、电力新产品和新设备的研发、制造及销售。2016年，公司重点发展新能源汽车产业链、风力发电领域，通过自主研发、产业并购与资本募集相结合的方式，迅速切入新能源汽车行业。2017年实现青岛一期风电项目并网发电。\r\n新能源汽车项目与风电项目成为公司迈向新材料与新能源双轮驱动、协同发展的重要战略布局。', 4);
INSERT INTO `company` VALUES (4, '理士国际（新能源）', '江苏省南京市玄武区玄武大道699号', '理士国际技术有限公司(理士国际)始于1999年，是专门从事LEOCH(理士)牌全系列铅酸蓄电池的研制、开发、制造和销售的国际化新型高科技企业,香港主板上市企业(理士国际********)。经过多年成长，理士国际已成为中国领先的铅酸蓄电池制造商及***的铅酸蓄电池出口商。 理士国际现已在国内建立了深圳、肇庆、江苏、安徽四个区域性生产基地及国外马来西来、斯里兰卡两个区域性生产基地，占地面积近91万平方米，拥有70条电池生产线及其相应的检测设备，以及肇庆、江苏两个专门的蓄电池研究开发中心，共同构成我公司先进而雄厚的研发制造能力。', 4);
INSERT INTO `company` VALUES (5, '阿特斯（新能源）', '江苏省南京市玄武区玄武大道699号', '阿特斯阳光电力是一家由“‘***’***”瞿晓铧博士于2001年11月创办的太阳能光伏公司，2006年公司在美国纳斯达克成功上市，是中国***家登陆美国纳斯达克的光伏一体化企业(纳斯达克代码: CSIQ)。阿特斯阳光电力专业从事硅锭、硅片、太阳能电池片、太阳能组件和太阳能应用产品的研发、生产和销售，以及太阳能电站的系统安装，其光伏产品遍布德国、西班牙、意大利、美国、加拿大、韩国、日本、中国等全球5大洲的30多个国家和地区。', 4);

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '发布id',
  `company_id` int NOT NULL COMMENT '企业id',
  `position_id` int NULL DEFAULT NULL COMMENT '职位id',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作地区',
  `time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '全职/兼职',
  `contact` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  `maxsalary` double NULL DEFAULT NULL COMMENT '最高薪资',
  `minsalary` double NULL DEFAULT NULL COMMENT '最低薪资',
  `job_requirements` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '岗位职责',
  `job_require` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '任职要求',
  `welfare` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '福利',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company_id`(`company_id` ASC) USING BTREE,
  INDEX `position_id`(`position_id` ASC) USING BTREE,
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `job_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES (1, 1, 1, '江苏省南京市玄武区玄武大道699号', '全职工作', '张小姐', 4000, 3000, '1.本科及以上学历，理工科类专业；\r\n2.具备熟练的英语口语交流及书写能力者优先；\r\n3.具备3年以上通信备电/工商业储能/UPS锂电工作经验；\r\n4.熟知不同应用场景对锂电产品的要求，熟悉锂电池工作原理、关键参数指标数据及BMS功能要求；\r\n5.具备解析锂电池相关国标/行标/企标的能力；\r\n6.具备良好的文案基础；\r\n7.能够适应不定期出差；', '1.锂电池产品的技术咨询、选型、推广方案制定，发布和维护；\r\n2.锂电池产品的投标技术应答；\r\n3.锂电池客户项目的产品生命周期管理；\r\n4.配合锂电研发团队的产品需求管理工作，新产品开发需求的导入和产品开发项目跟进；\r\n5.锂电池产品的内外部客户交流、培训；\r\n6.锂电池市场调研、分析及输出，制定产品路线、产品规划。', '五险一金，保吃，包住');
INSERT INTO `job` VALUES (2, 2, 2, '高新区鹿山路199号', '全职工作', '李先生', 5000, 4000, '- 负责嵌入式软件相关调试及测试工作；\r\nResponsible for embedded software debugging and testing\r\n- 负责产品软件相关的现场调试工作；\r\nResponsible for product software field debugging\r\n- 负责多国安规的认证和调试工作，并协助测试部门完成认证工作\r\nResponsible for the certification of multi-national security code and debugging job, and assist the testing department to complete the certification work.\r\n- 完成领导交办的其他它工作\r\nOther jobs assigned by leaders', '熟练使用C语言，并对C++有一定了解；\r\nFamiliar with C language, and have a certain understanding of C++.\r\n熟悉DSP, FPGA, ARM等微型处理器的设计；\r\nFamiliar with DSP, FPGA, ARM and other microprocessors design.\r\n具备良好的沟通能力；\r\nGood communication ability.\r\n具有较强的工作责任心和事业心。', NULL);

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '职位id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '职位名称',
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (1, '工程/设备工程师');
INSERT INTO `position` VALUES (2, '结构工程师');
INSERT INTO `position` VALUES (3, 'Java开发工程师');
INSERT INTO `position` VALUES (4, 'PHP开发工程师');
INSERT INTO `position` VALUES (5, '前端开发工程师');
INSERT INTO `position` VALUES (6, '后端开发工程师');
INSERT INTO `position` VALUES (7, '全栈工程师');
INSERT INTO `position` VALUES (8, '产品经理/主管');
INSERT INTO `position` VALUES (9, '软件实施员');
INSERT INTO `position` VALUES (10, '售前/售后技术支持工程师');

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '简历id',
  `userid` int NOT NULL COMMENT '绑定用户',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '男' COMMENT '性别',
  `school` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '毕业学校',
  `projectexp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '项目经历',
  `workexp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'findJob.jsp',
  `education` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学历',
  `year` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '大学学习年份',
  `hope` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '期望工作',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '城市',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态',
  `datetime` datetime(6) NULL DEFAULT NULL COMMENT '发布时间',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简历图片',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userid`(`userid` ASC) USING BTREE,
  CONSTRAINT `resume_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES (1, 2, 'jakt', '12312312', '202131231@qq.com', '男', '北京科技大学', 'java开发', NULL, '本科', '1', NULL, '广州', '待处理', '2016-06-04 00:00:00.000000', NULL);
INSERT INTO `resume` VALUES (2, 3, 'dads', '21312', '123@12e21.com', '女', 'asdsa', 'dsad', NULL, 'dasda', '2', NULL, 'ddsa', '待定', '2022-12-21 23:53:03.000000', NULL);
INSERT INTO `resume` VALUES (3, 4, 'dasda', '123', '213@12.com', '女', 'dasda', 'dsadas', NULL, 'dasdas', '12', NULL, 'dsada', '待处理', '2022-12-28 23:53:44.000000', NULL);

-- ----------------------------
-- Table structure for technology
-- ----------------------------
DROP TABLE IF EXISTS `technology`;
CREATE TABLE `technology`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '技术id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '技术名称',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '技术描述',
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of technology
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '帐号',
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `avatars` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `sex` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '男' COMMENT '性别',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `register_date` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'user',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', NULL, '男', NULL, '', '', NULL, 'admin');
INSERT INTO `user` VALUES (2, 'user', '123456', NULL, '男', 21, '11111111113', '122313456@qq.com', '2022-12-06 19:58:28', 'user');
INSERT INTO `user` VALUES (3, 'qwe', '123', NULL, '男', 21, '11111111113', '122313456@qq.com', '2022-12-07 19:59:51', 'user');
INSERT INTO `user` VALUES (4, 'q', '111', NULL, '男', 21, '11111111113', '122313456@qq.com', '2022-12-06 20:07:00', 'company');
INSERT INTO `user` VALUES (9, 'aa', '123', NULL, '男', 21, '11111111113', '122313456@qq.com', '2022-12-15 00:00:00', 'company');
INSERT INTO `user` VALUES (12, 'wqe', 'a', NULL, '男', 21, '11111111113', '122313456@qq.com', '2022-12-17 00:00:00', 'company');

SET FOREIGN_KEY_CHECKS = 1;
