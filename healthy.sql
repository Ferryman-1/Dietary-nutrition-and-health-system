/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : healthy

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 05/05/2023 16:42:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO `chat` VALUES (2, '1682600044448.jpg', '小白菜含蛋白质、脂肪、粗纤维、碳水化合物、酸性果胶、钙、磷、铁等矿物质及多种维生素，是蔬菜中含矿物质和维生素最丰富的菜。与大白菜相比，小白菜的含钙量是其2倍，维生素C含量约为3倍，胡萝卜素含量高达74倍。 小白菜所含的矿物质钙、磷能够促进骨骼发育，加速人体新陈代谢，增强机体造血功能。\r\n养胃小米粥	小米温和，味甘，具有补益虚损，健脾功效，还能去热，小米中含有脂肪，碳水化合物，胡萝卜素，蛋白质等多种营养物质，可以很好的给孕妇补充营养，并且，小米粥还可以有效的缓解孕妇的孕吐症状，还能预防反胃，除此以外，还可以滋阴养血，可以很好的改善孕妇虚寒的体质。\r\n', 2, '小白菜肉丸汤', '2023-04-03 14:19:48');
INSERT INTO `chat` VALUES (11, '1682600059209.jpg', '对减肥的人来说，如何吃好一日三餐是减肥减脂路上的大磨难，克制食欲吃得少，身心受折磨。难得放纵自己，多吃点自己爱吃的食物，薯片、糖果、糕点等都来点，却让肥肉缠上身，还附带个营养不良，简直是晴天霹雳！想要健康变瘦，每顿饭都要吃好，让你的减肥餐不出错，瘦身大业才更容易成功。', 7, '减肥吃法', '2023-04-09 00:12:12');
INSERT INTO `chat` VALUES (15, '1683276032763.jpg', '1. 控制总能量，维持理想体重，超过正常标准体重者逐渐减重。结合每个人的身高、体重、体力活动情况确定合适的饮食量。40岁以上者尤应预防发胖。正常体重的简单计算法为：BMI=kg（体重）/㎡（身高的平方） ，一般以19~24为正常范围，大于25超重，大于28肥胖。\r\n\r\n　　2. 适量主食：每日5~8两，米面为主，每日粗杂粮占主食的1/3。\r\n\r\n　　3. 多食蔬菜：每日1斤左右，注意选择深绿色蔬菜和红色蔬菜；每天中等大小水果1~2个，不能以加工的果汁饮料代替水果。\r\n\r\n　　4. 适量肉类：每天鱼虾1~2两，瘦猪（或者牛、羊肉）1两~1两半，鸡鸭肉可以去外皮后替换猪肉。煮鸡蛋清1个。每周鸡蛋黄不超过3个。\r\n\r\n　　5. 每日低脂牛奶半斤和半两大豆（或者大约1两豆干、2~3两豆腐）。\r\n\r\n　　6. 清淡少盐：除脂肪的数量以外，脂肪的类型更为重要，烹调油最好选用含不饱和脂肪酸较多的植物油20克，如豆油、菜籽油、调和油、茶油、橄榄油等，大约2汤勺。每天小于6克盐，不另外食用咸菜、黄酱、豆腐乳、芝麻酱等食物。\r\n\r\n　　7. 禁用或少用的食物：动物脂肪如猪油、牛油、鸡油、奶油等；动物内脏如脑、肝脏、肾脏等；富含胆固醇的食物如肥肉、鱼子、鸡蛋黄、松花蛋等；奶油蛋糕、甜点、甜饮料等；辛辣有刺激性的调味品；烈性酒；浓的咖啡、茶和肉汤等。\r\n\r\n　　8. 餐次安排应少量多餐，避免吃得过饱，晚餐应注意避免摄入过于油腻和不宜消化的食物。提倡进餐半小时后散步30~60分钟。', 8, '八大饮食建议', '2023-04-10 00:09:42');
INSERT INTO `chat` VALUES (16, '1682600139920.jpg', '水果是世界上最受欢迎的健康食品，这些甜而有营养的食物很容易加入我们的日常饮食，因为不需要额外的烹饪就可以直接食用~\r\n\r\n1、苹果\r\n\r\n苹果富含纤维，维生素C和多种抗氧化剂。如果在正餐外饿了，可以作为美味的填饥小吃。\r\n\r\n2、牛油果\r\n\r\n与大部分水果不同，它们富含健康的脂肪而不是碳水化合物。它们不仅奶油可口，而且纤维、钾和维生素C含量都很高。\r\n\r\n3、香蕉\r\n\r\n香蕉是世界上最好的钾的来源之一。它们富含维生素B6和纤维，而且方便携带和食用。\r\n\r\n4、蓝莓\r\n\r\n蓝莓不仅美味，而且是世界上最强大的抗氧化剂来源之一。\r\n\r\n5、橘子\r\n\r\n橘子因其维生素C含量高而闻名。而且，它们的纤维和抗氧化剂含量也很高。\r\n\r\n6、草莓\r\n\r\n草莓营养丰富，碳水化合物和卡路里含量低，适合减肥人群食用。\r\n\r\n它们富含维生素C，纤维和锰，可以说是现有最美味的食物之一。\r\n\r\n其他健康水果\r\n\r\n其他的健康水果包括樱桃，葡萄，葡萄柚，猕猴桃，柠檬，芒果，瓜，橄榄，桃子，梨，菠萝，李子和覆盆子等。', 8, '超级健康的食物', '2023-04-10 00:11:40');
INSERT INTO `chat` VALUES (17, '1682600153523.jpg', '1.适当摄入低脂肪、优质蛋白质食物。\r\n每日脂肪的摄入不超过50克在限量范围内选择富含不饱和脂肪酸的油脂和肉类，它们可能会减少动脉硬化的发生，对增加微血管弹性、预防血管破裂、防止高血压并发症有一定作用。\r\n\r\n薯类食物。如淀粉、面粉、米、红薯等，少进食含单糖和双糖类食物，如蔗糖、果糖等，以防止血脂增高。\r\n\r\n2. 饮食要清淡，不宜太成。\r\n\r\n人体摄入食盐(主要成分是氯化钠)量过多会造成体内水和钠潴留，从而导致血管管腔变细、血管阻力增加，使血压上升；增加肾脏负担，造成排钠障碍使血压升高；可能对抗降压药物而影响降压效果。\r\n\r\n3. 高钙饮食。\r\n\r\n高钙饮食是防治高血压的有效措施之一。钙具有强大的“除钠”作用，从而使血压维持稳定。所以，解决高血压的关键不是限钠、限镁或其他矿物质，而是补钙。\r\n\r\n因此，健康人群或高血压患者，都应多吃些含钙丰富的食物，如牛奶、豆类、鱼虾、芝麻等。\r\n\r\n4. 多吃含钾丰富的食物。\r\n\r\n高血压的典型特征是动脉壁增厚，但当给予足量的钾后，动脉壁便不再增厚。这主要是钾对血管有保护作用，可防止动脉壁不受血压的机械性损伤，从而降低了高血压病人中风的发病率。\r\n\r\n含钾丰富的食品主要有瘦肉、牛肉、鱼类及其他海产品、小白菜、油菜黄瓜、西红柿、土豆、橘子、香蕉、桃、葡萄干等蔬菜与水果。', 8, '高血压食疗调理方法', '2023-04-10 00:13:29');
INSERT INTO `chat` VALUES (18, '1682600162244.jpg', '1.碳水化合物食品\r\n\r\n适宜的食品——米饭、粥、面、面类、葛粉汤、芋类、软豆类   \r\n\r\n应忌的食品——番薯（产生腹气的食品）、干豆类、味浓的饼干类  \r\n\r\n2.蛋白质性食品\r\n\r\n适宜的食品——脂肪少的食品（嫩肉、牛、猪的瘦肉、白肉鱼）、蛋、牛奶和牛奶制品（鲜奶油、酵母乳、冰淇淋、乳酪）、大豆制品（豆腐、纳豆、黄豆粉、油豆腐、青菜丝豆腐）。   \r\n\r\n应忌的食品——脂肪多的食品（牛、猪的五花肉、排骨肉、鲸鱼肉、鲱鱼、鳗鱼、金枪鱼等）、加工品（香肠等）。   \r\n\r\n3.脂肪类食品\r\n\r\n适宜的食品——植物油、少量奶油、沙拉酱。   应忌的食品——动物油、生猪油、熏肉、油渍沙丁鱼   \r\n\r\n4.维生素、矿物质食品  \r\n\r\n适宜的食品——蔬菜类（菠菜、白菜、胡萝卜、番茄、百合根、南瓜、茄子、黄瓜等纤维少的），水果类（苹果、桃、橘子、梨、葡萄、西瓜、香蕉等），海藻类、菌类、水果类、蔬菜类生吃会产生腹气，必须软煮或做成酱。   \r\n\r\n应忌的食品——纤维硬的蔬菜(牛旁、竹笋、玉米)、刺激性强的蔬菜(香辛蔬菜、如芥菜、葱类)。   \r\n\r\n5.其他食品   \r\n\r\n适宜的食品——淡红茶、酵母乳饮料。 \r\n\r\n应忌的食品——香辛料(辣椒、芥末、咖喱粉、酒类饮料、咖啡、浓红茶等)、碳酸饮料、盐渍食品(咸菜类、咸鲑鱼、咸鱼子、腥鱼子、糖酱油煮的菜、酱菜类)。    \r\n\r\n◆高血脂预防：少吃或不吃动物内脏，包括心、肝、肾、脑胆固醇含量很高；蛋黄、蟹黄、鱼籽含胆固醇也很多——高血脂的人每周吃蛋黄不能超过两个，对口感很好的多春鱼也要说“拜拜”；贝壳类食物往往是连内脏一起吃下，也增加了胆固醇的摄入；软体鱼类，例如鱿鱼、八爪鱼、墨鱼等海鲜，也富含胆固醇；动物脂肪，摄入体内以后能够转化为胆固醇。   \r\n\r\n以上饮食原则，高血压病人若能落到实处，持之以恒，必会有益于健康。', 8, '高血压患者的饮食宜忌', '2023-04-10 00:14:57');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `collectuserid`(`user_id`) USING BTREE,
  INDEX `collectmenuid`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (1, 66, 1);
INSERT INTO `collect` VALUES (3, 70, 2);
INSERT INTO `collect` VALUES (5, 71, 2);
INSERT INTO `collect` VALUES (9, 68, 6);
INSERT INTO `collect` VALUES (10, 69, 6);
INSERT INTO `collect` VALUES (11, 70, 6);
INSERT INTO `collect` VALUES (12, 71, 6);
INSERT INTO `collect` VALUES (14, 74, 2);
INSERT INTO `collect` VALUES (17, 68, 7);
INSERT INTO `collect` VALUES (18, 69, 7);
INSERT INTO `collect` VALUES (19, 70, 7);
INSERT INTO `collect` VALUES (20, 71, 7);
INSERT INTO `collect` VALUES (21, 68, 2);
INSERT INTO `collect` VALUES (22, 69, 2);
INSERT INTO `collect` VALUES (24, 73, 2);
INSERT INTO `collect` VALUES (25, 75, 2);
INSERT INTO `collect` VALUES (28, 68, 9);
INSERT INTO `collect` VALUES (29, 87, 9);
INSERT INTO `collect` VALUES (30, 73, 9);
INSERT INTO `collect` VALUES (31, 77, 9);
INSERT INTO `collect` VALUES (32, 78, 9);
INSERT INTO `collect` VALUES (33, 79, 9);
INSERT INTO `collect` VALUES (34, 84, 9);
INSERT INTO `collect` VALUES (35, 92, 9);
INSERT INTO `collect` VALUES (37, 69, 8);
INSERT INTO `collect` VALUES (38, 70, 8);
INSERT INTO `collect` VALUES (39, 71, 8);
INSERT INTO `collect` VALUES (40, 74, 8);
INSERT INTO `collect` VALUES (41, 73, 8);
INSERT INTO `collect` VALUES (43, 68, 8);

-- ----------------------------
-- Table structure for collectchat
-- ----------------------------
DROP TABLE IF EXISTS `collectchat`;
CREATE TABLE `collectchat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `chat_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collectchat
-- ----------------------------
INSERT INTO `collectchat` VALUES (48, 6, 1);
INSERT INTO `collectchat` VALUES (49, 6, 2);
INSERT INTO `collectchat` VALUES (51, 2, 10);
INSERT INTO `collectchat` VALUES (52, 2, 3);
INSERT INTO `collectchat` VALUES (53, 7, 3);
INSERT INTO `collectchat` VALUES (54, 7, 9);
INSERT INTO `collectchat` VALUES (55, 7, 1);
INSERT INTO `collectchat` VALUES (56, 7, 2);
INSERT INTO `collectchat` VALUES (57, 7, 10);
INSERT INTO `collectchat` VALUES (58, 7, 11);
INSERT INTO `collectchat` VALUES (61, 2, 8);
INSERT INTO `collectchat` VALUES (62, 2, 11);
INSERT INTO `collectchat` VALUES (63, 8, 14);
INSERT INTO `collectchat` VALUES (64, 9, 3);
INSERT INTO `collectchat` VALUES (65, 9, 9);
INSERT INTO `collectchat` VALUES (66, 9, 13);
INSERT INTO `collectchat` VALUES (67, 9, 18);
INSERT INTO `collectchat` VALUES (68, 2, 1);
INSERT INTO `collectchat` VALUES (72, 8, 2);
INSERT INTO `collectchat` VALUES (73, 8, 8);
INSERT INTO `collectchat` VALUES (74, 2, 13);
INSERT INTO `collectchat` VALUES (75, 1, 21);
INSERT INTO `collectchat` VALUES (76, 7, 15);
INSERT INTO `collectchat` VALUES (77, 8, 16);
INSERT INTO `collectchat` VALUES (78, 8, 11);
INSERT INTO `collectchat` VALUES (79, 8, 1);
INSERT INTO `collectchat` VALUES (80, 8, 15);
INSERT INTO `collectchat` VALUES (81, 8, 17);
INSERT INTO `collectchat` VALUES (82, 8, 18);
INSERT INTO `collectchat` VALUES (83, 2, 15);
INSERT INTO `collectchat` VALUES (84, 2, 16);
INSERT INTO `collectchat` VALUES (85, 2, 18);
INSERT INTO `collectchat` VALUES (86, 2, 17);

-- ----------------------------
-- Table structure for comment2
-- ----------------------------
DROP TABLE IF EXISTS `comment2`;
CREATE TABLE `comment2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment2
-- ----------------------------
INSERT INTO `comment2` VALUES (24, 1, 2, '好喜欢啊！', '2023-04-27 21:15:51');
INSERT INTO `comment2` VALUES (13, 8, 2, '111', '2023-04-10 22:36:52');
INSERT INTO `comment2` VALUES (3, 3, 2, '111', '2023-04-10 16:07:14');
INSERT INTO `comment2` VALUES (22, 1, 8, '感谢大家的喜欢', '2023-04-27 21:10:08');
INSERT INTO `comment2` VALUES (28, 2, 2, '看上去很不错！', '2023-05-03 23:19:43');
INSERT INTO `comment2` VALUES (27, 2, 8, '谢谢大家喜欢', '2023-05-03 23:19:00');
INSERT INTO `comment2` VALUES (7, 9, 2, '111', '2023-04-10 16:44:39');
INSERT INTO `comment2` VALUES (8, 9, 2, '11', '2023-04-10 16:45:11');
INSERT INTO `comment2` VALUES (25, 15, 2, '非常有用的科普！', '2023-04-27 21:16:30');
INSERT INTO `comment2` VALUES (11, 8, 8, '喜欢小白菜肉丸汤', '2023-04-10 22:14:04');
INSERT INTO `comment2` VALUES (12, 2, 8, '喜欢\r\n', '2023-04-10 22:18:09');

-- ----------------------------
-- Table structure for healthyinfo
-- ----------------------------
DROP TABLE IF EXISTS `healthyinfo`;
CREATE TABLE `healthyinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` float(8, 2) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of healthyinfo
-- ----------------------------
INSERT INTO `healthyinfo` VALUES (1, 15.00, '水分(100ml/d)', 0);
INSERT INTO `healthyinfo` VALUES (2, 15.00, '碳水(10g/d)', 0);
INSERT INTO `healthyinfo` VALUES (3, 8.10, '维A(0.1mgRAE/d)', 0);
INSERT INTO `healthyinfo` VALUES (4, 16.00, '水分(100ml/d)', 3);
INSERT INTO `healthyinfo` VALUES (5, 8.10, '蛋白质(10 g/d)', 0);
INSERT INTO `healthyinfo` VALUES (10, 13.00, '水分(100ml/d)', 2);
INSERT INTO `healthyinfo` VALUES (11, 8.00, '维C(10mg/d)', 0);
INSERT INTO `healthyinfo` VALUES (13, 12.00, '水分(100ml/d)', 1);
INSERT INTO `healthyinfo` VALUES (14, 6.50, '蛋白质(10 g/d)', 1);
INSERT INTO `healthyinfo` VALUES (15, 8.50, '维A(0.1mgRAE/d)', 1);
INSERT INTO `healthyinfo` VALUES (16, 10.00, '碳水(10g/d)', 1);
INSERT INTO `healthyinfo` VALUES (17, 3.00, '维B(10mg/d)', 1);
INSERT INTO `healthyinfo` VALUES (18, 9.00, '维C(10mg/d)', 1);
INSERT INTO `healthyinfo` VALUES (19, 7.00, '蛋白质(10 g/d)', 2);
INSERT INTO `healthyinfo` VALUES (20, 6.00, '脂肪(10mg/d)', 1);
INSERT INTO `healthyinfo` VALUES (21, 7.80, '维A(0.1mgRAE/d)', 2);
INSERT INTO `healthyinfo` VALUES (22, 6.00, '蛋白质(10 g/d)', 3);
INSERT INTO `healthyinfo` VALUES (23, 7.00, '维A(0.1mgRAE/d)', 3);
INSERT INTO `healthyinfo` VALUES (24, 12.00, '碳水(10g/d)', 2);
INSERT INTO `healthyinfo` VALUES (25, 2.20, '维B(10mg/d)', 3);
INSERT INTO `healthyinfo` VALUES (26, 2.50, '维B(10mg/d)', 2);
INSERT INTO `healthyinfo` VALUES (27, 13.00, '碳水(10g/d)', 3);
INSERT INTO `healthyinfo` VALUES (28, 10.00, '维C(10mg/d)', 2);
INSERT INTO `healthyinfo` VALUES (29, 9.50, '维C(10mg/d)', 3);
INSERT INTO `healthyinfo` VALUES (30, 5.50, '脂肪(10mg/d)', 2);
INSERT INTO `healthyinfo` VALUES (31, 5.10, '脂肪(10mg/d)', 3);
INSERT INTO `healthyinfo` VALUES (36, 5.00, '脂肪(10mg/d)', 0);
INSERT INTO `healthyinfo` VALUES (37, 2.00, '维B(10mg/d)', 0);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `htm_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `word_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `show1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (66, '1680371802349', '海带三丝', '1680371802349.htm', '1680371802349.docx', '海带三丝适用于糖尿病及肥胖症患者，一般人群也可以使用，尤其适合缺碘，甲状腺肿大患者。', '2023-04-02 01:56:42');
INSERT INTO `menu` VALUES (68, '1682595536761', '蚝油西葫芦', '1682595536761.htm', '1682595536761.docx', '西葫芦是一种很常见的蔬菜，具有营养价值高及低热量的特点。其富含葡萄糖以及大量的膳食纤维，可加快胃肠的蠕动，达到缓解便秘的作用，从而辅助减肥。另外，西葫芦中富含维生素，可帮助减肥期间，更好地吸收营养。', '2023-04-27 19:39:11');
INSERT INTO `menu` VALUES (69, '1682595548877', '海带三丝', '1682595548877.htm', '1682595548877.docx', '海带三丝适用于糖尿病及肥胖症患者，一般人群也可以使用，尤其适合缺碘，甲状腺肿大患者。', '2023-04-27 19:39:11');
INSERT INTO `menu` VALUES (71, '1682595576423', '苦瓜炒牛肉', '1682595576423.htm', '1682595576423.docx', '苦瓜对糖尿病患者的保护作用已经在多家杂志刊登，配合牛肉烹调能够减轻其苦味并增加牛肉的鲜味。', '2023-04-27 19:39:39');
INSERT INTO `menu` VALUES (73, '1682596233754', '山药鸡汤', '1682596233754.htm', '1682596233754.docx', '山药中含有大量黏液蛋白及维生素，可以有效防止血脂在血管壁沉积，对预防心血管疾病可以起到较好的作用，血糖控制较好者可以适量食用山药。', '2023-04-27 19:50:36');
INSERT INTO `menu` VALUES (74, '1682596314029', '素炒荷兰豆', '1682596314029.htm', '1682596314029.docx', '荷兰豆对血糖的影响比较小。营养价值很高，含有多种维生素以及微量元素，而且荷兰豆的热量相对较低，糖尿病患者多食可补充因糖原异生而消耗的蛋白质，并且具有丰富的优质蛋白和胡萝卜素，具有提高人体免疫力的作用。', '2023-04-27 19:51:57');
INSERT INTO `menu` VALUES (75, '1682596430989', '莴笋炒木耳', '1682596430989.htm', '1682596430989.docx', '木耳能帮助消化系统将无法消化的异物溶解，能有效预防缺铁性贫血、血栓、动脉硬化和冠心病，还具有防癌作用。', '2023-04-27 19:53:53');
INSERT INTO `menu` VALUES (76, '1682596606973', '西红柿炒菜花', '1682596606973.htm', '1682596606973.docx', '西红柿是医生推荐给糖尿病人的代“水果”菜，具有生津止渴，健胃消食，清热解毒，凉血平肝，补血养血和增进食欲的功效；菜花中还含有对改善糖尿病症状非常有益的维生素C，不仅有助于2型糖尿病患者调节血糖，还能预防心血管疾病等并发症。', '2023-04-08 23:49:57');
INSERT INTO `menu` VALUES (77, '1682596622976', '爆炒猪肝', '1682596622976.htm', '1682596622976.docx', '孕妇吃炒猪肝主要有补充营养、补充维生素A的好处。猪肝主要有补血、明目、排毒的功效，其蛋白质含量较高，含有丰富的矿物质、微量元素及维生素B1、烟酸等，少量食用对人体有益。', '2023-04-08 23:50:13');
INSERT INTO `menu` VALUES (78, '1682596637483', '大葱炒羊肉', '1682596637483.htm', '1682596637483.docx', '羊肉的营养价值高，羊肉比猪肉的肉质要细嫩，而且比猪肉和牛肉的脂肪、胆固醇含量都要少。羊肉蛋白质含量丰富，维生素B1、B2、B6以及铁、锌、硒的含量也颇为丰富，孕妇常吃羊肉可益气补虚、促进血液循环；羊肉还有补精血，益虚劳，温中健脾，补肾壮阳，养肝等功效。', '2023-04-08 23:50:34');
INSERT INTO `menu` VALUES (79, '1682596650624', '海带黄豆猪蹄汤', '1682596650624.htm', '1682596650624.docx', '猪蹄黄豆海带汤的功效有美容养颜、强壮骨骼、调节胆固醇和促进排便，猪蹄中含有丰富的胶原蛋白等营养物质，可以促进乳汁的分泌，对于产后乳汁分泌不足的人有很好的通乳汁、促进乳汁分泌的功效。', '2023-04-08 23:50:47');
INSERT INTO `menu` VALUES (80, '1682596669237', '鲫鱼豆腐汤', '1682596669237.htm', '1682596669237.docx', '鲫鱼豆腐汤	孕期由于营养需求，应多摄入富含蛋白质的食物，鲫鱼为富含优质蛋白质的鱼类食品，在与豆腐慢炖过程中，不仅不会破坏其中营养物质，还会与豆腐中的营养物质，包括蛋白质和钙充分混合，形成营养充分的鱼汤。', '2023-04-08 23:50:59');
INSERT INTO `menu` VALUES (81, '1682596685106', '莲子猪肚汤', '1682596685106.htm', '1682596685106.docx', '莲子的营养价值很高，其中包含丰富的碳水化合物、脂肪和蛋白质，还含有钾、磷、钙等人体需要的元素，有调节心率，促进凝血、维持肌肉伸缩性、促进凝血等作用。吃猪肚有利于调理身体、增强体质，还可以缓解消化不良的现象。', '2023-04-08 23:51:15');
INSERT INTO `menu` VALUES (82, '1682596703163', '肉末蒸蛋', '1682596703163.htm', '1682596703163.docx', '鸡蛋的营养价值很高，含蛋白质丰富且利用率最高，还含有脂肪、卵磷脂、卵黄素、钙、铁及维生素A、B、D等,脂肪极易被人体消化吸收,并且卵磷脂和卵黄素在维护神经系统的健康中发挥重要作用。因此,产妇多吃鸡蛋，有助于体力的恢复和婴儿的生长发育。', '2023-04-08 23:51:35');
INSERT INTO `menu` VALUES (84, '1682596733078', '小白菜肉丸汤', '1682596733078.htm', '1682596733078.docx', '小白菜含蛋白质、脂肪、粗纤维、碳水化合物、酸性果胶、钙、磷、铁等矿物质及多种维生素，是蔬菜中含矿物质和维生素最丰富的菜。与大白菜相比，小白菜的含钙量是其2倍，维生素C含量约为3倍，胡萝卜素含量高达74倍。 小白菜所含的矿物质钙、磷能够促进骨骼发育，加速人体新陈代谢，增强机体造血功能。', '2023-04-08 23:52:37');
INSERT INTO `menu` VALUES (85, '1682596745197', '养胃小米粥', '1682596745197.htm', '1682596745197.docx', '小米温和，味甘，具有补益虚损，健脾功效，还能去热，小米中含有脂肪，碳水化合物，胡萝卜素，蛋白质等多种营养物质，可以很好的给孕妇补充营养，并且，小米粥还可以有效的缓解孕妇的孕吐症状，还能预防反胃，除此以外，还可以滋阴养血，可以很好的改善孕妇虚寒的体质。', '2023-04-08 23:52:49');
INSERT INTO `menu` VALUES (87, '1682596799055', '凉拌鸡丝', '1682596799055.htm', '1682596799055.docx', '因为鸡脯肉高蛋白食物低脂肪，营养丰富，因此得到许多运动健身和减肥人士的钟爱，美味营养价值又不易长多肉。', '2023-04-08 23:53:29');
INSERT INTO `menu` VALUES (88, '1682596820335', '秋葵炒蛋', '1682596820335.htm', '1682596820335.docx', '秋葵含有蛋白质、脂肪、碳水化合物及丰富的维他命A和B群、钙、磷、铁等，以及含有锌和硒等微量元素，对增强人体免疫力有一定帮助。秋葵和鸡蛋火腿肠搭配炒食，口味清淡，家常营养。', '2023-04-08 23:53:41');
INSERT INTO `menu` VALUES (89, '1682596833113', '砂锅豆腐煲', '1682596833113.htm', '1682596833113.docx', '豆腐是一种传统美食，主要由黄豆制作而成的，营养价值丰富，豆腐有清热润燥、补中益气、健脾益胃的功效。', '2023-04-08 23:54:08');
INSERT INTO `menu` VALUES (92, '1682596847440', '香煎芦笋三文鱼', '1682596847440.htm', '1682596847440.docx', '三文鱼是富含不饱和脂肪酸的食物，吃三文鱼可以补充人体所需的不饱和脂肪酸；芦笋属于低脂肪、低热量的食物，再加上芦笋含有丰富的膳食纤维，常吃芦笋可起到减脂、排脂、降脂的作用。', '2023-04-08 23:54:48');
INSERT INTO `menu` VALUES (94, '1682596861402', '照烧鸡腿波奇饭', '1682596861402.htm', '1682596861402.docx', '鸡腿富含蛋白质，甚至是众多肉类里面数一数二高蛋白的，特别值得提醒大家的是，鸡肉虽然蛋白质很丰富，但是脂肪却很低，尽管存在脂肪，都是有益人体的不饱和脂肪酸，就算吃较多也不担心会长胖。', '2023-04-08 23:54:58');
INSERT INTO `menu` VALUES (100, '1682596889563', '酸奶蔬菜沙拉', '1682596889563.htm', '1682596889563.docx', '蔬菜富含丰富的营养物质，配上具有丰富蛋白质的酸奶，再搭配上健康营养的橄榄油，不但能助消化，还能提高人体免疫力。', '2023-04-07 18:42:29');

-- ----------------------------
-- Table structure for menutype
-- ----------------------------
DROP TABLE IF EXISTS `menutype`;
CREATE TABLE `menutype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NULL DEFAULT NULL,
  `menu_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `n1`(`type_id`) USING BTREE,
  INDEX `n2`(`menu_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 270 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of menutype
-- ----------------------------
INSERT INTO `menutype` VALUES (240, 2, 82);
INSERT INTO `menutype` VALUES (239, 2, 81);
INSERT INTO `menutype` VALUES (238, 2, 80);
INSERT INTO `menutype` VALUES (237, 2, 79);
INSERT INTO `menutype` VALUES (236, 2, 78);
INSERT INTO `menutype` VALUES (235, 2, 77);
INSERT INTO `menutype` VALUES (234, 3, 76);
INSERT INTO `menutype` VALUES (233, 1, 76);
INSERT INTO `menutype` VALUES (232, 1, 75);
INSERT INTO `menutype` VALUES (231, 3, 74);
INSERT INTO `menutype` VALUES (230, 1, 74);
INSERT INTO `menutype` VALUES (229, 2, 73);
INSERT INTO `menutype` VALUES (228, 1, 73);
INSERT INTO `menutype` VALUES (223, 1, 71);
INSERT INTO `menutype` VALUES (261, 3, 69);
INSERT INTO `menutype` VALUES (260, 1, 69);
INSERT INTO `menutype` VALUES (214, 3, 104);
INSERT INTO `menutype` VALUES (213, 2, 104);
INSERT INTO `menutype` VALUES (212, 1, 104);
INSERT INTO `menutype` VALUES (254, 3, 100);
INSERT INTO `menutype` VALUES (243, 3, 85);
INSERT INTO `menutype` VALUES (241, 2, 84);
INSERT INTO `menutype` VALUES (242, 2, 85);
INSERT INTO `menutype` VALUES (267, 1, 68);
INSERT INTO `menutype` VALUES (246, 3, 87);
INSERT INTO `menutype` VALUES (245, 1, 87);
INSERT INTO `menutype` VALUES (247, 3, 88);
INSERT INTO `menutype` VALUES (249, 3, 89);
INSERT INTO `menutype` VALUES (200, 3, 90);
INSERT INTO `menutype` VALUES (201, 3, 91);
INSERT INTO `menutype` VALUES (250, 3, 92);
INSERT INTO `menutype` VALUES (251, 3, 94);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (0, '默认人群');
INSERT INTO `type` VALUES (1, '糖尿病');
INSERT INTO `type` VALUES (2, '孕妇');
INSERT INTO `type` VALUES (3, '减肥健身');

-- ----------------------------
-- Table structure for up
-- ----------------------------
DROP TABLE IF EXISTS `up`;
CREATE TABLE `up`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `upmenu`(`menu_id`) USING BTREE,
  INDEX `upuserid`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of up
-- ----------------------------
INSERT INTO `up` VALUES (1, 66, 1);
INSERT INTO `up` VALUES (6, 74, 2);
INSERT INTO `up` VALUES (10, 69, 6);
INSERT INTO `up` VALUES (11, 70, 6);
INSERT INTO `up` VALUES (13, 71, 6);
INSERT INTO `up` VALUES (14, 68, 6);
INSERT INTO `up` VALUES (15, 69, 2);
INSERT INTO `up` VALUES (16, 68, 7);
INSERT INTO `up` VALUES (17, 69, 7);
INSERT INTO `up` VALUES (18, 82, 7);
INSERT INTO `up` VALUES (19, 85, 7);
INSERT INTO `up` VALUES (20, 99, 7);
INSERT INTO `up` VALUES (21, 76, 7);
INSERT INTO `up` VALUES (22, 76, 2);
INSERT INTO `up` VALUES (23, 79, 2);
INSERT INTO `up` VALUES (24, 94, 2);
INSERT INTO `up` VALUES (25, 68, 2);
INSERT INTO `up` VALUES (27, 68, 9);
INSERT INTO `up` VALUES (28, 87, 9);
INSERT INTO `up` VALUES (29, 73, 9);
INSERT INTO `up` VALUES (30, 82, 9);
INSERT INTO `up` VALUES (31, 77, 9);
INSERT INTO `up` VALUES (32, 78, 9);
INSERT INTO `up` VALUES (33, 79, 9);
INSERT INTO `up` VALUES (34, 89, 9);
INSERT INTO `up` VALUES (35, 94, 9);
INSERT INTO `up` VALUES (36, 70, 2);
INSERT INTO `up` VALUES (37, 81, 2);
INSERT INTO `up` VALUES (38, 70, 8);
INSERT INTO `up` VALUES (41, 71, 8);
INSERT INTO `up` VALUES (42, 75, 8);
INSERT INTO `up` VALUES (43, 73, 8);
INSERT INTO `up` VALUES (45, 82, 8);

-- ----------------------------
-- Table structure for upchat
-- ----------------------------
DROP TABLE IF EXISTS `upchat`;
CREATE TABLE `upchat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `chat_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of upchat
-- ----------------------------
INSERT INTO `upchat` VALUES (47, 2, 1);
INSERT INTO `upchat` VALUES (52, 6, 1);
INSERT INTO `upchat` VALUES (53, 6, 9);
INSERT INTO `upchat` VALUES (54, 2, 3);
INSERT INTO `upchat` VALUES (55, 7, 3);
INSERT INTO `upchat` VALUES (56, 7, 9);
INSERT INTO `upchat` VALUES (57, 7, 1);
INSERT INTO `upchat` VALUES (58, 7, 2);
INSERT INTO `upchat` VALUES (59, 7, 10);
INSERT INTO `upchat` VALUES (60, 7, 11);
INSERT INTO `upchat` VALUES (62, 2, 10);
INSERT INTO `upchat` VALUES (64, 2, 8);
INSERT INTO `upchat` VALUES (65, 2, 11);
INSERT INTO `upchat` VALUES (66, 8, 14);
INSERT INTO `upchat` VALUES (67, 9, 3);
INSERT INTO `upchat` VALUES (68, 9, 9);
INSERT INTO `upchat` VALUES (69, 9, 13);
INSERT INTO `upchat` VALUES (70, 9, 8);
INSERT INTO `upchat` VALUES (71, 2, 18);
INSERT INTO `upchat` VALUES (74, 2, 9);
INSERT INTO `upchat` VALUES (75, 8, 2);
INSERT INTO `upchat` VALUES (76, 8, 8);
INSERT INTO `upchat` VALUES (77, 8, 1);
INSERT INTO `upchat` VALUES (78, 8, 3);
INSERT INTO `upchat` VALUES (79, 2, 13);
INSERT INTO `upchat` VALUES (80, 1, 21);
INSERT INTO `upchat` VALUES (81, 7, 15);
INSERT INTO `upchat` VALUES (82, 8, 15);
INSERT INTO `upchat` VALUES (83, 8, 16);
INSERT INTO `upchat` VALUES (84, 8, 11);
INSERT INTO `upchat` VALUES (86, 2, 15);
INSERT INTO `upchat` VALUES (87, 2, 16);
INSERT INTO `upchat` VALUES (88, 2, 17);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sex` int(1) NOT NULL,
  `age` int(3) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` int(1) NOT NULL,
  `image_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 2, 21, 'admin', '111', 1, '1682612325109.jpg', 'admin', '我是管理员，拥有所有的权限a');
INSERT INTO `user` VALUES (2, 1, 17, '纯牛奶', '222', 2, '1682600323867.webp', 'bbb', '喜欢纯牛奶啊');
INSERT INTO `user` VALUES (3, 1, 22, 'cc', '999', 2, '1680881250475.png', 'cc', 'cc');
INSERT INTO `user` VALUES (7, 2, 19, '草莓牛奶', '111', 2, '1681204838060.jpg', 'lll', '吹不出褶的平静日子也在闪光。');
INSERT INTO `user` VALUES (8, 1, 25, '香蕉牛奶', 'ccc', 2, '1683128054805.jpg', 'ccc', '一年好景君须记，最是橙黄橘绿时。');
INSERT INTO `user` VALUES (9, 2, 20, '香草牛奶', 'www', 2, '1682607191209.jpg', 'www', '逃跑吧，跑出这满是世俗的生活。');
INSERT INTO `user` VALUES (10, 1, 1, '11', '1', 2, NULL, '1', '1');
INSERT INTO `user` VALUES (11, 1, 11, '11', '11', 2, '1682612325109.jpg', '11', '11');

-- ----------------------------
-- Table structure for userback
-- ----------------------------
DROP TABLE IF EXISTS `userback`;
CREATE TABLE `userback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) UNSIGNED ZEROFILL NOT NULL DEFAULT 00000000000,
  `userback_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reply` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userbackuserid`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of userback
-- ----------------------------
INSERT INTO `userback` VALUES (18, 8, '建议增加菜谱数量', 00000000001, '2023-05-03 21:54:13', '收到', '123456@qq.com');
INSERT INTO `userback` VALUES (21, 8, '页面可以美化一下吗', 00000000000, '2023-05-03 23:40:37', NULL, '89738432@qq.com');
INSERT INTO `userback` VALUES (22, 8, '人群类型可以更多吗', 00000000000, '2023-05-05 16:41:23', NULL, '1849754864@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
