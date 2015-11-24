/*
Navicat MySQL Data Transfer

Source Server         : hjzgg
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : hzml

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-11-24 15:28:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `card`
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `cardTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cardContent` varchar(200) DEFAULT NULL,
  `cardid` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` int(11) DEFAULT NULL,
  `postCardName` varchar(20) DEFAULT NULL,
  `receiveCardName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cardid`),
  KEY `FK_taskToCard` (`taskid`),
  CONSTRAINT `FK_taskToCard` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES ('2015-06-20 12:24:37', '请问一下，项目什么时间会开始进行啊！？', '1', '1', '暗影修罗', null);
INSERT INTO `card` VALUES ('2015-06-20 12:26:07', '最好能够快一点儿进行，因为我要开始打lol了！晋级赛啊。哥哥们！', '2', '1', '暗影修罗', null);
INSERT INTO `card` VALUES ('2015-06-20 12:28:01', '', '3', '1', '暗影修罗', null);
INSERT INTO `card` VALUES ('2015-06-20 12:28:18', '1111', '4', '1', '暗影修罗', null);
INSERT INTO `card` VALUES ('2015-06-20 12:36:59', '大家好我是hjzgg', '5', '1', '暗影修罗', null);
INSERT INTO `card` VALUES ('2015-06-20 12:37:42', '大家好，我是lxkdd', '6', '1', '暗影修罗', null);
INSERT INTO `card` VALUES ('2015-06-20 12:38:13', '大家好，我是lxkdd', '7', '1', '暗影修罗', null);
INSERT INTO `card` VALUES ('2015-06-20 13:39:20', '回复与  暗影修罗: 你着啥急啊，等等，不忙吧....', '8', '1', 'lxkdd', '暗影修罗');
INSERT INTO `card` VALUES ('2015-06-20 13:43:33', 'hehe,heieheifsdjklf....', '9', '1', 'lxkdd', '暗影修罗');
INSERT INTO `card` VALUES ('2015-06-20 18:01:18', '打击盗版！', '10', '1', 'lxkdd', null);
INSERT INTO `card` VALUES ('2015-06-20 18:25:44', '大家好，我是abc，第一次搞这个，好紧张啊！', '11', '1', 'abc', null);
INSERT INTO `card` VALUES ('2015-06-20 20:21:13', '大家准备好了吗，项目准备开始了！', '12', '1', 'abc', null);
INSERT INTO `card` VALUES ('2015-07-09 23:01:08', '何时才能开发项目.....?', '13', '2', 'abc', null);
INSERT INTO `card` VALUES ('2015-08-02 21:14:00', '项目什么时候开始执行？', '14', '3', '暗影修罗', null);
INSERT INTO `card` VALUES ('2015-08-02 21:14:56', '快开始了吧.....', '15', '3', 'lxkdd', '暗影修罗');
INSERT INTO `card` VALUES ('2015-08-02 21:15:41', '项目准备开始吧！', '16', '3', 'abc', null);
INSERT INTO `card` VALUES ('2015-08-03 00:25:56', '防守打法', '17', '3', 'abc', 'abc');
INSERT INTO `card` VALUES ('2015-08-03 00:26:18', '佛挡杀佛', '18', '3', 'abc', 'abc');
INSERT INTO `card` VALUES ('2015-08-03 09:36:45', '项目什么时候开始？', '19', '4', 'lxkdd', null);
INSERT INTO `card` VALUES ('2015-08-03 09:42:36', '现在就开始吧！', '20', '4', 'abc', 'lxkdd');
INSERT INTO `card` VALUES ('2015-10-10 13:07:16', 'HAHAHA', '21', '7', 'christinaiii', null);
INSERT INTO `card` VALUES ('2015-10-10 13:08:01', '你真帅', '22', '7', 'christinaiii', 'christinaiii');
INSERT INTO `card` VALUES ('2015-10-14 10:37:01', '项目准备开始了！', '23', '9', 'abc', null);
INSERT INTO `card` VALUES ('2015-10-14 10:54:32', '好了，项目已经完事了！', '24', '9', 'abc', null);
INSERT INTO `card` VALUES ('2015-10-22 22:10:18', 'fsdf', '25', '7', 'abc', null);
INSERT INTO `card` VALUES ('2015-10-22 22:14:59', 'fsdgfg', '26', '7', 'abc', null);
INSERT INTO `card` VALUES ('2015-10-22 22:15:03', 'fsdgfg', '27', '7', 'abc', null);
INSERT INTO `card` VALUES ('2015-10-22 22:17:36', 'fsdfgvcbcvbc', '28', '7', 'abc', null);
INSERT INTO `card` VALUES ('2015-10-22 22:19:49', 'fsdffsd', '29', '7', 'abc', null);
INSERT INTO `card` VALUES ('2015-10-22 22:20:13', 'gfsdgfds', '30', '7', 'abc', null);
INSERT INTO `card` VALUES ('2015-10-22 22:20:44', 'gfsdgfds', '31', '7', 'abc', null);
INSERT INTO `card` VALUES ('2015-10-22 22:23:58', '我是胡峻峥', '32', '7', 'abc', null);
INSERT INTO `card` VALUES ('2015-10-22 23:00:02', 'FSAF', '33', '6', 'jjj', null);
INSERT INTO `card` VALUES ('2015-10-22 23:00:15', 'buzhidao', '34', '6', 'jjj', null);

-- ----------------------------
-- Table structure for `contact`
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `msgId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `msgTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`msgId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES ('1', 'hjzgg', '2570230521@qq.com', '你们的系统什么时候进行更新啊？感觉有的地方用的不是很舒服！', '1', '2015-08-19 20:34:41');
INSERT INTO `contact` VALUES ('2', 'HJZGG', '2570230521@qq.com', '你好，我是HJZGG! 非常喜欢你们的系统！', '1', '2015-10-10 22:30:03');
INSERT INTO `contact` VALUES ('3', '啦啦', '2570230521@qq.com', '嘎嘎', '1', '2015-10-11 00:12:37');
INSERT INTO `contact` VALUES ('4', 'hjzgg', '2570230521@qq.com', '胡峻峥', '1', '2015-10-13 23:48:27');
INSERT INTO `contact` VALUES ('5', 'hjzgg', '2570230521@qq.com', 'lala', '1', '2015-10-14 00:22:07');
INSERT INTO `contact` VALUES ('6', 'hjzgg', '2570230521@qq.com', 'GFD', '0', '2015-10-14 15:18:22');
INSERT INTO `contact` VALUES ('7', 'hjzgg', '2570230521@qq.com', 'thank you!', '0', '2015-11-23 14:54:52');

-- ----------------------------
-- Table structure for `developingparty`
-- ----------------------------
DROP TABLE IF EXISTS `developingparty`;
CREATE TABLE `developingparty` (
  `developName` varchar(50) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `evaluate` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`developName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of developingparty
-- ----------------------------
INSERT INTO `developingparty` VALUES ('abc', '123', '160', 'xxxxxx', '123456@qq.com', 'hehehe');
INSERT INTO `developingparty` VALUES ('christinaiii', '199308', '40', '18638500150', 'lxk811@163.com', '菊园6号楼东');
INSERT INTO `developingparty` VALUES ('jjj', '123', '0', '4234', '423', 'sdfg');
INSERT INTO `developingparty` VALUES ('lxkdd', '123', '110', '156xxxxx', '123456789@qq.com', '河南驻马店');
INSERT INTO `developingparty` VALUES ('暗影修罗', '123', '80', '15670637914', '2570230521@qq.com', '内蒙古赤峰市松山区');

-- ----------------------------
-- Table structure for `developtopublishmsg`
-- ----------------------------
DROP TABLE IF EXISTS `developtopublishmsg`;
CREATE TABLE `developtopublishmsg` (
  `msgId` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` int(11) DEFAULT NULL,
  `msg` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `msgTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `publishName` varchar(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `taskName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`msgId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of developtopublishmsg
-- ----------------------------
INSERT INTO `developtopublishmsg` VALUES ('2', '8', '该任务已经开始，请您及时与我们联系！', '2570230521@qq.com', '2015-10-24 20:30:10', 'hjzgg', '1', '校园信息发布平台');
INSERT INTO `developtopublishmsg` VALUES ('3', '8', '我们的项目已经开始了第一步，请及时查看是否符合标准\n', '2570230521@qq.com', '2015-10-25 16:31:14', 'hjzgg', '1', '校园信息发布平台');
INSERT INTO `developtopublishmsg` VALUES ('4', '8', '我们的项目已经进行第二部了，请您查看！！！', '2570230521@qq.com', '2015-10-25 16:59:01', 'hjzgg', '0', '校园信息发布平台');

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `name` varchar(50) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('hjzgg', '123');

-- ----------------------------
-- Table structure for `publishparty`
-- ----------------------------
DROP TABLE IF EXISTS `publishparty`;
CREATE TABLE `publishparty` (
  `publishName` varchar(50) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`publishName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publishparty
-- ----------------------------
INSERT INTO `publishparty` VALUES ('hjzgg', '123', '15670637914', '2570230521@qq.com', '内蒙古赤峰市松山区');
INSERT INTO `publishparty` VALUES ('hujunzheng', '123', '18337174540', '2570230521@qq.com', '河南省郑州市高新区科学大道100号');

-- ----------------------------
-- Table structure for `questionlist`
-- ----------------------------
DROP TABLE IF EXISTS `questionlist`;
CREATE TABLE `questionlist` (
  `questionId` int(11) NOT NULL AUTO_INCREMENT,
  `questionMsg` varchar(100) DEFAULT NULL,
  `optionA` varchar(50) DEFAULT NULL,
  `optionB` varchar(50) DEFAULT NULL,
  `optionC` varchar(50) DEFAULT NULL,
  `optionD` varchar(50) DEFAULT NULL,
  `optionCorrect` int(11) DEFAULT NULL,
  `difficultDegree` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questionlist
-- ----------------------------
INSERT INTO `questionlist` VALUES ('1', '软件生命周期中所花费用最多的阶段是（）', '详细设计', '软件编码', '软件测试', '软件维护', '4', '1');
INSERT INTO `questionlist` VALUES ('2', '下列关于瀑布模型的描述正确的是（）', '瀑布模型的核心是按照软件开发的时间顺序将问题简化。', '瀑布模型具由于良好的灵活性。 ', '瀑布模型采用结构化的分析与设计方法，将逻辑实现与物理实现分开。', '利用瀑布模型，如果发现问题则修改的代价很低。', '2', '2');
INSERT INTO `questionlist` VALUES ('3', '面向对象程序设计中的数据隐藏指的是（）', '输入数据必须输入保密口令', '数据经过加密处理', '对象内部数据结构上建有防火墙', '对象内部数据结构的不可访问性', '4', '3');
INSERT INTO `questionlist` VALUES ('5', '下面关于面向对象方法中消息的叙述，不正确的是（）', '键盘、鼠标、通信端口、网络等设备一有变化，就会产生消息', '操作系统不断向应用程序发送消息，但应用程序不能向操作系统发送消息 ', '应用程序之间可以相互发送消息', '发送与接收消息的通信机制与传统的子程序调用机制不同', '2', '2');
INSERT INTO `questionlist` VALUES ('6', '面向对象技术中，对象是类的实例。对象有三种成份：（）、属性和方法(或操作)', '标识', ' 规则', '封装', '消息', '1', '1');
INSERT INTO `questionlist` VALUES ('7', '确认软件的功能是否与需求规格说明书中所要求的功能相符的测试属于（）', '集成测试', '恢复测试', '验收测试', '单元测试', '3', '1');
INSERT INTO `questionlist` VALUES ('8', '程序的三种基本控制结构是（）', '过程、子程序和分程序', '顺序、选择和重复', '递归、堆栈和队列', '调用、返回和转移 ', '2', '1');
INSERT INTO `questionlist` VALUES ('9', '结构化程序设计主要强调的是（） ', '程序的规模', '程序的效率', '程序设计语言的先进性', '程序 易读性', '4', '1');
INSERT INTO `questionlist` VALUES ('10', '结构设计是一种应用最广泛的系统设计方法，是以（）为基础、自顶向下、逐步求精 和模块化的过程。', '数据流', '数据流图', '数据库', '数据结构', '1', '1');
INSERT INTO `questionlist` VALUES ('11', '软件开发中常采用的结构化生命周期方法，由于其特征而一般称其为(  )', '瀑布模型', '对象模型', '螺旋模型', '层次模型', '1', '1');
INSERT INTO `questionlist` VALUES ('18', '软件工程的出现主要是由于( )', '程序设计方法学的影响', '其它工 程科学的影响', ' 软件危机的出现', '计算机 的发展 ', '3', '1');

-- ----------------------------
-- Table structure for `questions`
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `qId` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) DEFAULT NULL,
  `optionSelect` int(11) DEFAULT NULL,
  `pageQuestionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`qId`),
  KEY `FK_Reference_8` (`questionId`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`questionId`) REFERENCES `questionlist` (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('1', '10', '1', '1');
INSERT INTO `questions` VALUES ('2', '9', '1', '1');
INSERT INTO `questions` VALUES ('3', '6', '1', '1');
INSERT INTO `questions` VALUES ('4', '18', '1', '1');
INSERT INTO `questions` VALUES ('5', '8', '1', '1');
INSERT INTO `questions` VALUES ('6', '11', '1', '1');
INSERT INTO `questions` VALUES ('7', '2', '1', '1');
INSERT INTO `questions` VALUES ('8', '5', '1', '1');
INSERT INTO `questions` VALUES ('9', '3', '1', '1');
INSERT INTO `questions` VALUES ('10', '1', '1', '1');
INSERT INTO `questions` VALUES ('11', '8', '1', '2');
INSERT INTO `questions` VALUES ('12', '1', '3', '2');
INSERT INTO `questions` VALUES ('13', '18', '3', '2');
INSERT INTO `questions` VALUES ('14', '2', '1', '2');
INSERT INTO `questions` VALUES ('15', '7', '1', '2');
INSERT INTO `questions` VALUES ('16', '5', '1', '2');
INSERT INTO `questions` VALUES ('17', '10', '3', '2');
INSERT INTO `questions` VALUES ('18', '6', '1', '2');
INSERT INTO `questions` VALUES ('19', '9', '1', '2');
INSERT INTO `questions` VALUES ('20', '11', '3', '2');
INSERT INTO `questions` VALUES ('21', '8', '1', '3');
INSERT INTO `questions` VALUES ('22', '9', '1', '3');
INSERT INTO `questions` VALUES ('23', '18', '1', '3');
INSERT INTO `questions` VALUES ('24', '6', '1', '3');
INSERT INTO `questions` VALUES ('25', '5', '1', '3');
INSERT INTO `questions` VALUES ('26', '7', '1', '3');
INSERT INTO `questions` VALUES ('27', '1', '1', '3');
INSERT INTO `questions` VALUES ('28', '3', '1', '3');
INSERT INTO `questions` VALUES ('29', '11', '1', '3');
INSERT INTO `questions` VALUES ('30', '2', '1', '3');
INSERT INTO `questions` VALUES ('31', '8', '1', '4');
INSERT INTO `questions` VALUES ('32', '3', '1', '4');
INSERT INTO `questions` VALUES ('33', '5', '1', '4');
INSERT INTO `questions` VALUES ('34', '11', '1', '4');
INSERT INTO `questions` VALUES ('35', '9', '1', '4');
INSERT INTO `questions` VALUES ('36', '10', '1', '4');
INSERT INTO `questions` VALUES ('37', '18', '1', '4');
INSERT INTO `questions` VALUES ('38', '1', '1', '4');
INSERT INTO `questions` VALUES ('39', '7', '1', '4');
INSERT INTO `questions` VALUES ('40', '2', '1', '4');
INSERT INTO `questions` VALUES ('41', '8', '1', '5');
INSERT INTO `questions` VALUES ('42', '6', '1', '5');
INSERT INTO `questions` VALUES ('43', '18', '1', '5');
INSERT INTO `questions` VALUES ('44', '3', '1', '5');
INSERT INTO `questions` VALUES ('45', '5', '1', '5');
INSERT INTO `questions` VALUES ('46', '2', '1', '5');
INSERT INTO `questions` VALUES ('47', '1', '1', '5');
INSERT INTO `questions` VALUES ('48', '7', '1', '5');
INSERT INTO `questions` VALUES ('49', '10', '1', '5');
INSERT INTO `questions` VALUES ('50', '9', '1', '5');
INSERT INTO `questions` VALUES ('51', '1', '1', '6');
INSERT INTO `questions` VALUES ('52', '10', '1', '6');
INSERT INTO `questions` VALUES ('53', '2', '1', '6');
INSERT INTO `questions` VALUES ('54', '7', '1', '6');
INSERT INTO `questions` VALUES ('55', '5', '1', '6');
INSERT INTO `questions` VALUES ('56', '3', '1', '6');
INSERT INTO `questions` VALUES ('57', '11', '1', '6');
INSERT INTO `questions` VALUES ('58', '18', '1', '6');
INSERT INTO `questions` VALUES ('59', '9', '1', '6');
INSERT INTO `questions` VALUES ('60', '8', '1', '6');
INSERT INTO `questions` VALUES ('61', '11', '1', '7');
INSERT INTO `questions` VALUES ('62', '5', '1', '7');
INSERT INTO `questions` VALUES ('63', '3', '1', '7');
INSERT INTO `questions` VALUES ('64', '1', '1', '7');
INSERT INTO `questions` VALUES ('65', '2', '1', '7');
INSERT INTO `questions` VALUES ('66', '18', '1', '7');
INSERT INTO `questions` VALUES ('67', '9', '1', '7');
INSERT INTO `questions` VALUES ('68', '6', '1', '7');
INSERT INTO `questions` VALUES ('69', '7', '1', '7');
INSERT INTO `questions` VALUES ('70', '8', '1', '7');
INSERT INTO `questions` VALUES ('71', '9', '1', '8');
INSERT INTO `questions` VALUES ('72', '1', '1', '8');
INSERT INTO `questions` VALUES ('73', '18', '1', '8');
INSERT INTO `questions` VALUES ('74', '10', '1', '8');
INSERT INTO `questions` VALUES ('75', '2', '1', '8');
INSERT INTO `questions` VALUES ('76', '7', '1', '8');
INSERT INTO `questions` VALUES ('77', '6', '1', '8');
INSERT INTO `questions` VALUES ('78', '11', '1', '8');
INSERT INTO `questions` VALUES ('79', '5', '1', '8');
INSERT INTO `questions` VALUES ('80', '8', '1', '8');
INSERT INTO `questions` VALUES ('81', '3', '4', '9');
INSERT INTO `questions` VALUES ('82', '10', '2', '9');
INSERT INTO `questions` VALUES ('83', '5', '1', '9');
INSERT INTO `questions` VALUES ('84', '18', '1', '9');
INSERT INTO `questions` VALUES ('85', '1', '1', '9');
INSERT INTO `questions` VALUES ('86', '7', '1', '9');
INSERT INTO `questions` VALUES ('87', '9', '1', '9');
INSERT INTO `questions` VALUES ('88', '8', '1', '9');
INSERT INTO `questions` VALUES ('89', '11', '1', '9');
INSERT INTO `questions` VALUES ('90', '2', '1', '9');
INSERT INTO `questions` VALUES ('91', '5', '1', '10');
INSERT INTO `questions` VALUES ('92', '8', '1', '10');
INSERT INTO `questions` VALUES ('93', '1', '1', '10');
INSERT INTO `questions` VALUES ('94', '18', '1', '10');
INSERT INTO `questions` VALUES ('95', '6', '1', '10');
INSERT INTO `questions` VALUES ('96', '9', '1', '10');
INSERT INTO `questions` VALUES ('97', '3', '1', '10');
INSERT INTO `questions` VALUES ('98', '7', '1', '10');
INSERT INTO `questions` VALUES ('99', '2', '1', '10');
INSERT INTO `questions` VALUES ('100', '10', '1', '10');
INSERT INTO `questions` VALUES ('101', '11', '1', '11');
INSERT INTO `questions` VALUES ('102', '8', '1', '11');
INSERT INTO `questions` VALUES ('103', '5', '1', '11');
INSERT INTO `questions` VALUES ('104', '18', '1', '11');
INSERT INTO `questions` VALUES ('105', '1', '1', '11');
INSERT INTO `questions` VALUES ('106', '6', '1', '11');
INSERT INTO `questions` VALUES ('107', '2', '1', '11');
INSERT INTO `questions` VALUES ('108', '3', '1', '11');
INSERT INTO `questions` VALUES ('109', '9', '1', '11');
INSERT INTO `questions` VALUES ('110', '10', '1', '11');
INSERT INTO `questions` VALUES ('111', '18', '1', '12');
INSERT INTO `questions` VALUES ('112', '5', '1', '12');
INSERT INTO `questions` VALUES ('113', '8', '1', '12');
INSERT INTO `questions` VALUES ('114', '9', '1', '12');
INSERT INTO `questions` VALUES ('115', '11', '1', '12');
INSERT INTO `questions` VALUES ('116', '2', '1', '12');
INSERT INTO `questions` VALUES ('117', '6', '1', '12');
INSERT INTO `questions` VALUES ('118', '3', '1', '12');
INSERT INTO `questions` VALUES ('119', '1', '1', '12');
INSERT INTO `questions` VALUES ('120', '7', '1', '12');
INSERT INTO `questions` VALUES ('121', '9', '1', '13');
INSERT INTO `questions` VALUES ('122', '10', '1', '13');
INSERT INTO `questions` VALUES ('123', '5', '1', '13');
INSERT INTO `questions` VALUES ('124', '3', '1', '13');
INSERT INTO `questions` VALUES ('125', '1', '1', '13');
INSERT INTO `questions` VALUES ('126', '18', '1', '13');
INSERT INTO `questions` VALUES ('127', '7', '1', '13');
INSERT INTO `questions` VALUES ('128', '6', '1', '13');
INSERT INTO `questions` VALUES ('129', '11', '1', '13');
INSERT INTO `questions` VALUES ('130', '2', '1', '13');

-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `taskid` int(11) NOT NULL AUTO_INCREMENT,
  `publishName` varchar(50) DEFAULT NULL,
  `taskDescription` varchar(100) DEFAULT NULL,
  `beginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `publishTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `developmentTime` int(11) DEFAULT NULL,
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `money` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `taskAddress` varchar(100) DEFAULT NULL,
  `documentationAddress` varchar(30) DEFAULT NULL,
  `taskName` varchar(50) DEFAULT NULL,
  `accountID` varchar(25) DEFAULT NULL,
  `keyValue` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`taskid`),
  KEY `FK_publishPartyToTask` (`publishName`),
  CONSTRAINT `FK_publishPartyToTask` FOREIGN KEY (`publishName`) REFERENCES `publishparty` (`publishName`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', 'hjzgg', '在线软件工程开发，方便，简介，明了！', '2015-06-20 20:25:12', '2015-06-14 12:18:16', '40', '2015-06-14 12:18:16', '10000', '3', 'www.github.com', 'crebas.sql', '在线软件工程开发', '10001126856', '69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl');
INSERT INTO `task` VALUES ('2', 'hujunzheng', '大家一起来做一个androidApp吧！', '2015-08-12 20:32:36', '2015-06-14 23:01:57', '40', '2015-06-14 23:01:57', '2000', '3', 'five.zip', '温馨提示.doc', 'androidApp开发', null, null);
INSERT INTO `task` VALUES ('3', 'hujunzheng', '大家一起来做一个IOSApp吧！', '2015-08-02 21:15:48', '2015-06-14 23:02:54', '45', '2015-06-14 23:02:53', '20000', '3', 'www.baidu.com', '温馨提示.doc', 'IOSApp开发', null, null);
INSERT INTO `task` VALUES ('4', 'hjzgg', '网页版的qq聊天程序！', '2015-08-20 17:37:51', '2015-06-22 18:03:16', '43', '2015-06-22 18:03:15', '23333', '3', 'www.baidu.com', 'crebas.sql', 'WEB QQ', null, null);
INSERT INTO `task` VALUES ('5', 'hjzgg', 'web微信，显得跟牛逼你一点儿！', '2015-10-14 15:13:32', '2015-06-22 18:05:12', '40', '2015-06-22 18:05:11', '10000', '3', '北航专业课考研大纲.doc', 'Untitled1.cpp', 'web 微信', null, null);
INSERT INTO `task` VALUES ('6', 'hjzgg', '开发一个关于学校acmoj的测评系统！', '2015-06-22 18:07:40', '2015-06-22 18:07:40', '100', '2015-06-22 18:07:40', '190000', '0', null, 'codeforce.cpp', 'acm 测评系统', null, null);
INSERT INTO `task` VALUES ('7', 'hjzgg', '让喜欢音乐的人有一个展现自己的舞台！', '2015-10-10 13:10:09', '2015-06-22 18:20:13', '100', '2015-06-22 18:20:13', '1000', '3', '16yuedu150pianfandujiexi.pdf', 'Untitled1.cpp', 'web 音乐平台', null, null);
INSERT INTO `task` VALUES ('8', 'hjzgg', '为了让同学们更好的掌握校园里的信息！', '2015-10-24 12:21:07', '2015-06-22 18:22:18', '423', '2015-06-22 18:22:18', '45465', '1', null, 'crebas.sql', '校园信息发布平台', null, null);
INSERT INTO `task` VALUES ('9', 'hjzgg', '增进用户的朋友圈', '2015-10-14 10:31:22', '2015-06-22 18:24:07', '34', '2015-06-22 18:24:07', '3243', '3', 'codeforce.cpp', 'codeforce.cpp', '网上交友平台', null, null);
INSERT INTO `task` VALUES ('10', 'hjzgg', '减少单身狗的数目！', '2015-08-16 14:11:13', '2015-06-22 18:26:03', '34', '2015-06-22 18:26:03', '3243', '0', null, 'codeforce.cpp', '网上恋爱平台', null, null);
INSERT INTO `task` VALUES ('11', 'hjzgg', '网上购物商城，便于人们购物！', '2015-06-22 18:30:20', '2015-06-22 18:30:21', '120', '2015-06-22 18:30:20', '45000', '0', null, 'Untitled1.cpp', '网上购物商城', null, null);
INSERT INTO `task` VALUES ('12', 'hjzgg', '扩展交流，增加知识面!', '2015-08-03 10:04:30', '2015-08-03 10:04:30', '60', '2015-08-03 10:04:30', '3424', '0', null, 'lala.cpp', 'WEB交流平台', null, null);

-- ----------------------------
-- Table structure for `taskappend`
-- ----------------------------
DROP TABLE IF EXISTS `taskappend`;
CREATE TABLE `taskappend` (
  `taskid` int(11) NOT NULL DEFAULT '0',
  `taskLeader` varchar(20) DEFAULT NULL,
  `taskStep` int(11) DEFAULT NULL,
  `nextTaskStep` int(11) DEFAULT NULL,
  `taskAllocationDoc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of taskappend
-- ----------------------------
INSERT INTO `taskappend` VALUES ('1', 'abc', '3', '4', 'ff.cpp');
INSERT INTO `taskappend` VALUES ('2', 'abc', '0', '0', 'codeforce.cpp');
INSERT INTO `taskappend` VALUES ('3', 'abc', '3', '4', 'codeforce.cpp');
INSERT INTO `taskappend` VALUES ('4', 'abc', '0', '1', 'lala.cpp');
INSERT INTO `taskappend` VALUES ('5', 'abc', '0', '1', '交通灯.asm');
INSERT INTO `taskappend` VALUES ('6', 'abc', '0', '0', null);
INSERT INTO `taskappend` VALUES ('7', 'abc', '0', '1', '交通灯.asm');
INSERT INTO `taskappend` VALUES ('8', 'abc', '1', '2', 'in.txt');
INSERT INTO `taskappend` VALUES ('9', 'abc', '0', '1', '在线软件开发工程.ppt');

-- ----------------------------
-- Table structure for `taskteam`
-- ----------------------------
DROP TABLE IF EXISTS `taskteam`;
CREATE TABLE `taskteam` (
  `taskid` int(11) DEFAULT NULL,
  `developName` varchar(50) DEFAULT NULL,
  `taskTeamid` int(11) NOT NULL AUTO_INCREMENT,
  `agreeToStart` int(11) DEFAULT NULL,
  `finishMyTask` int(11) DEFAULT '0',
  PRIMARY KEY (`taskTeamid`),
  KEY `FK_developingPartyToTaskTeam` (`developName`),
  KEY `FK_taskToTaskTeam` (`taskid`),
  CONSTRAINT `FK_developingPartyToTaskTeam` FOREIGN KEY (`developName`) REFERENCES `developingparty` (`developName`),
  CONSTRAINT `FK_taskToTaskTeam` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='agreeToStart 表示参与这个项目的某个人是否同意该项目开始执行';

-- ----------------------------
-- Records of taskteam
-- ----------------------------
INSERT INTO `taskteam` VALUES ('1', '暗影修罗', '2', '1', '0');
INSERT INTO `taskteam` VALUES ('1', 'lxkdd', '3', '0', '0');
INSERT INTO `taskteam` VALUES ('1', 'abc', '4', '0', '1');
INSERT INTO `taskteam` VALUES ('2', 'abc', '5', '0', '0');
INSERT INTO `taskteam` VALUES ('3', 'abc', '6', '0', '1');
INSERT INTO `taskteam` VALUES ('3', '暗影修罗', '7', '0', '0');
INSERT INTO `taskteam` VALUES ('3', 'lxkdd', '8', '1', '1');
INSERT INTO `taskteam` VALUES ('4', 'abc', '9', '0', '1');
INSERT INTO `taskteam` VALUES ('4', 'lxkdd', '10', '1', '0');
INSERT INTO `taskteam` VALUES ('4', '暗影修罗', '11', '0', '1');
INSERT INTO `taskteam` VALUES ('8', 'abc', '12', '0', '0');
INSERT INTO `taskteam` VALUES ('9', 'abc', '13', '0', '1');
INSERT INTO `taskteam` VALUES ('2', 'christinaiii', '14', '0', '0');
INSERT INTO `taskteam` VALUES ('7', 'christinaiii', '15', '1', '0');
INSERT INTO `taskteam` VALUES ('5', 'abc', '16', '0', '1');
INSERT INTO `taskteam` VALUES ('7', 'abc', '17', '0', '0');
INSERT INTO `taskteam` VALUES ('3', 'christinaiii', '18', '0', '0');
INSERT INTO `taskteam` VALUES ('9', 'lxkdd', '19', '1', '1');
INSERT INTO `taskteam` VALUES ('4', 'christinaiii', '20', '0', '0');
INSERT INTO `taskteam` VALUES ('5', 'christinaiii', '21', '1', '0');
INSERT INTO `taskteam` VALUES ('1', 'christinaiii', '22', '0', '0');
INSERT INTO `taskteam` VALUES ('6', 'abc', '23', '0', '0');
INSERT INTO `taskteam` VALUES ('7', 'lxkdd', '24', '0', '0');
INSERT INTO `taskteam` VALUES ('10', 'lxkdd', '25', '0', '0');
INSERT INTO `taskteam` VALUES ('6', 'lxkdd', '26', '0', '0');
INSERT INTO `taskteam` VALUES ('8', 'lxkdd', '27', '0', '1');
INSERT INTO `taskteam` VALUES ('6', 'jjj', '28', '0', '0');
INSERT INTO `taskteam` VALUES ('11', 'lxkdd', '29', '0', '0');

-- ----------------------------
-- Table structure for `updatewrok`
-- ----------------------------
DROP TABLE IF EXISTS `updatewrok`;
CREATE TABLE `updatewrok` (
  `taskid` int(11) DEFAULT NULL,
  `developName` varchar(50) DEFAULT NULL,
  `planDocumentAddress` varchar(50) DEFAULT NULL,
  `updateWorkid` int(11) NOT NULL AUTO_INCREMENT,
  `workSummaryAddress` varchar(50) DEFAULT NULL,
  `taskStep` int(11) DEFAULT NULL,
  PRIMARY KEY (`updateWorkid`),
  KEY `FK_developingPartyToUpdateWord` (`developName`),
  KEY `FK_taskToUpdateWork` (`taskid`),
  CONSTRAINT `FK_developingPartyToUpdateWord` FOREIGN KEY (`developName`) REFERENCES `developingparty` (`developName`),
  CONSTRAINT `FK_taskToUpdateWork` FOREIGN KEY (`taskid`) REFERENCES `task` (`taskid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of updatewrok
-- ----------------------------
INSERT INTO `updatewrok` VALUES ('1', '暗影修罗', 'codeforce.cpp', '4', 'Untitled1.cpp', '1');
INSERT INTO `updatewrok` VALUES ('1', 'lxkdd', null, '5', 'codeforce.cpp', '1');
INSERT INTO `updatewrok` VALUES ('1', 'abc', null, '6', 'Untitled1.cpp', '1');
INSERT INTO `updatewrok` VALUES ('1', 'abc', null, '7', 'Untitled1.cpp', '2');
INSERT INTO `updatewrok` VALUES ('1', 'abc', null, '8', 'codeforce.cpp', '3');
INSERT INTO `updatewrok` VALUES ('3', 'lxkdd', 'ff.cpp', '9', 'lala.cpp', '3');
INSERT INTO `updatewrok` VALUES ('3', '暗影修罗', 'lala.cpp', '10', 'ff.cpp', '4');
INSERT INTO `updatewrok` VALUES ('3', 'lxkdd', 'ff.cpp', '11', 'lala.cpp', '4');
INSERT INTO `updatewrok` VALUES ('4', 'abc', 'ff.cpp', '12', 'lala.cpp', '1');
INSERT INTO `updatewrok` VALUES ('4', '暗影修罗', 'lala.cpp', '13', 'lala.cpp', '1');
INSERT INTO `updatewrok` VALUES ('4', 'lxkdd', 'lala.cpp', '14', 'ff.cpp', '1');
INSERT INTO `updatewrok` VALUES ('9', 'abc', 'lala.cpp', '15', 'ff.cpp', '1');
INSERT INTO `updatewrok` VALUES ('9', 'lxkdd', 'HZML数据库模型.jpg', '16', '在线软件开发工程.ppt', '1');
INSERT INTO `updatewrok` VALUES ('5', 'abc', 'codeforce.cpp', '17', 'ff.cpp', '1');
INSERT INTO `updatewrok` VALUES ('5', 'christinaiii', 'lala.cpp', '18', 'lala.cpp', '1');
INSERT INTO `updatewrok` VALUES ('8', 'abc', 'codeforce.cpp', '19', 'lala.cpp', '1');
INSERT INTO `updatewrok` VALUES ('8', 'lxkdd', 'ff.cpp', '20', 'lala.cpp', '1');
INSERT INTO `updatewrok` VALUES ('8', 'abc', '斐波那契的四种求法.cpp', '21', '二叉平衡树插入.cpp', '2');
INSERT INTO `updatewrok` VALUES ('8', 'lxkdd', '交通灯.asm', '22', '网络延迟.txt', '2');

-- ----------------------------
-- Table structure for `userquestions`
-- ----------------------------
DROP TABLE IF EXISTS `userquestions`;
CREATE TABLE `userquestions` (
  `developName` varchar(50) DEFAULT NULL,
  `uqId` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) DEFAULT NULL,
  `pageQuestionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`uqId`),
  KEY `FK_userToQuestion` (`developName`),
  CONSTRAINT `FK_userToQuestion` FOREIGN KEY (`developName`) REFERENCES `developingparty` (`developName`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userquestions
-- ----------------------------
INSERT INTO `userquestions` VALUES ('abc', '1', '3', '1');
INSERT INTO `userquestions` VALUES ('lxkdd', '2', '2', '2');
INSERT INTO `userquestions` VALUES ('lxkdd', '3', '2', '3');
INSERT INTO `userquestions` VALUES ('lxkdd', '4', '2', '4');
INSERT INTO `userquestions` VALUES ('lxkdd', '5', '2', '5');
INSERT INTO `userquestions` VALUES ('lxkdd', '6', '2', '6');
INSERT INTO `userquestions` VALUES ('lxkdd', '7', '2', '7');
INSERT INTO `userquestions` VALUES ('abc', '8', '3', '8');
INSERT INTO `userquestions` VALUES ('christinaiii', '9', '2', '9');
INSERT INTO `userquestions` VALUES ('christinaiii', '10', '2', '10');
INSERT INTO `userquestions` VALUES ('abc', '11', '3', '11');
INSERT INTO `userquestions` VALUES ('abc', '12', '2', '12');
INSERT INTO `userquestions` VALUES ('lxkdd', '13', '3', '13');
