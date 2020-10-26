SET NAMES UTF8;
DROP DATABASE IF EXISTS photo;
CREATE DATABASE photo CHARSET=UTF8;
USE photo;


DROP TABLE IF EXISTS log_category;
CREATE TABLE log_category(
	id smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型ID,主键且自增',
  category_name varchar(20) NOT NULL COMMENT '类型名称,唯一',
  PRIMARY KEY (id),
  UNIQUE KEY category_name (category_name)
);
INSERT INTO log_category(id,category_name) VALUES(1,'风景'),(2,'人物'),(3,'美食'),(4,'摄影技巧');



DROP TABLE IF EXISTS log_author;
CREATE TABLE log_author (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '作者ID,主键且自增',
  username varchar(20) COMMENT '用户名,唯一',
  password varchar(32) NOT NULL COMMENT '密码,MD5',
  phone varchar(11) NOT NULL COMMENT '验证码,唯一',
  nickname varchar(20) DEFAULT NULL,
  avatar varchar(50) NOT NULL DEFAULT 'unnamed.jpg' COMMENT '用户头像',
  log_number mediumint(9) NOT NULL DEFAULT '0' COMMENT '发表的日志数量',
  PRIMARY KEY (id),
  UNIQUE KEY username (username)
);
INSERT INTO log_author(username,password,nickname,avatar) VALUES('admin','admin','柔眸如梦','001f075ad3feeda8012138670b58f0.jpg');
INSERT INTO log_author(username,password,nickname,avatar) VALUES('gmy123','123456','栀子花开','0120cd5dc0e038a801209e1fc96ef7.jpg');
INSERT INTO log_author(username,password,nickname,avatar) VALUES('zyd123','123456','重拾记忆','04f1d7566ef37f00000174108c38c5.jpg');
INSERT INTO log_author(username,password,nickname,avatar) VALUES('myf123','123456','夏目','01a7b05c3d47b5a8012090db918155.jpg');




DROP TABLE IF EXISTS log_info;
CREATE TABLE log_info(
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志ID,主键且自增',
  `title` varchar(255) NOT NULL COMMENT '日志标题',
  `content` mediumtext NOT NULL COMMENT '日志正文',
  `image` varchar(50) DEFAULT NULL COMMENT '日志缩略像',
  `category_id` smallint(5) unsigned NOT NULL COMMENT '外键,日志分类ID',
  `author_id` int(10) unsigned NOT NULL COMMENT '外键,作者ID',
  `created_at` int(10) unsigned NOT NULL COMMENT '发表日期',
  `views` int(10) unsigned NOT NULL COMMENT '浏览量',
  `likes` int(10) unsigned NOT NULL COMMENT '点赞数量',
  PRIMARY KEY (`id`)
);
INSERT INTO log_info(title,content,image,category_id,author_id,created_at,views,likes) VALUES
('爱好摄影的人','伩天游，我的摄影笔名，我是一个爱好旅游，爱好摄影的人，2018年12月31日，2018年最后一天，开通了简书会员，以此记录我的摄影作品。','1.jpeg',1,1,1488390400,11234,4521),
('芜湖长江二桥','芜湖长江二桥是安徽省内第8座长江大桥，也是芜湖的第二条过江通道。北起安徽省无为县石涧镇，南至芜湖市繁昌县峨山镇。北岸连接北沿江高速公路，经仓头、陡沟，在矶头山跨越长江，南接已建成的芜湖至铜陵高速公路，全长约57公里。其中，长江大桥长约13公里，北岸接线长23公里，南岸接线长约21公里，全线采用高速公路标准建设。 芜湖长江二桥是安徽省高速公路网规划“四纵八横”中“纵二”的组成部分，也是安徽省高速公路网规划中徐州至福州高速公路的过江通道。','2.jpg',1,1,1488399400,11234,4521),
('民园体育场街景随影','','3.jpg',1,2,1478390400,116548,8523),
('深秋的早晨','在朝阳、红枫的衬托下西湖更美…………','4.jpg',1,2,1488399400,116548,8523),
('天津之眼','','5.jpg',1,4,1480012540,116548,8523),
('大美青海 察尔汗盐湖','','6.jpg',1,1,1478399400,116548,8523),
('晚霞','','7.jpg',1,1,1478399400,116548,8523),
('秦淮河','','8.jpg',1,3,1478399400,116548,8523),
('孤舟晨影','','9.jpg',1,1,1478399400,116548,8523),
('即将消失的地平线','','10.jpg',1,3,1478399400,116548,8523),
('烟雨舟船泊江岸','','11.jpg',1,2,1478399400,116548,8523),
('祊河祊河','','12.jpg',1,1,1478399400,116548,8523),
('新丝路之影','大漠驼影新丝路，西出阳关故人多','13.jpg',1,4,1475896584,116548,8523),
('浪漫玫瑰海岸','国庆游览玫瑰海岸','14.jpg',1,3,1476954867,116548,8523),
('秋日湿地日落','秋日湿地日落~','15.jpg',1,3,1480012540,116548,8523),
('快乐摄影颐和园','1 腊月十五的月亮
据称今天的月亮十二年中最大，故赶忙去了一趟颐和园，今天天气真好，明月当空。连照数张，未见月亮大多少。','16.jpg',1,2,1480012540,116548,8523);

INSERT INTO log_info(title,content,image,category_id,author_id,created_at,views,likes) VALUES
('只因你太温柔','#只因你太温柔#长沙约拍','102.jpg',2,1,1484589678,116548,8523),
('不早不晚，刚好是你','#不早不晚，刚好是你#','202.jpg',2,3,1484589678,116548,8523),
('一人的等待','#一人的等待#','302.jpg',2,4,1484589678,116548,8523),
('八月的清风','#八月的清风#','402.jpg',2,2,1484589678,116548,8523),
('旧时光是个美人','#旧时光是个美人#','502.jpg',2,3,1484589678,116548,8523),
('浓情锁清秋','#浓情锁清秋#','602.jpg',2,4,1484589678,116548,8523),
('秋の温度','#秋の温度#','702.jpg',2,1,1484589678,116548,8523),
('星辰与海','#星辰与海#','802.jpg',2,2,1484589678,116548,8523),
('秋色，暮沉沉','#秋色，暮沉沉#','902.jpg',2,2,1484589678,116548,8523),
('一个人的车厢','#一个人的车厢#','1002.jpg',2,1,1484589678,116548,8523);


INSERT INTO log_info(title,content,image,category_id,author_id,created_at,views,likes) VALUES
('美食 ','水果牛奶冰棍','a.jpg',3,2,1802546325,1258,2365),
('美食 ','大闸蟹蟹黄','b.jpg',3,1,1802546325,1258,2365),
('美食 ','四川火锅串串','c.jpg',3,2,1802546325,1258,2365),
('美食 ','扣肉','d.jpg',3,3,1802546325,1258,2365),
('美食 ','小米炖辽参','e.jpg',3,1,1802546325,1258,2365),
('美食 ','麻辣香锅','f.jpg',3,4,1802546325,1258,2365),
('美食 ','粥','g.jpg',3,1,1802546325,1258,2365),
('美食 ','美味牛角包早餐','h.jpg',3,1,1802546325,1258,2365),
('美食 ','红烧牛肉面','i.jpg',3,1,1802546325,1258,2365);


INSERT INTO log_info(title,content,image,category_id,author_id,created_at,views,likes) VALUES
('三分法','三分法构图应该是最常见也是最基本的构图方法。这个构图方法是用4条直线，将画面分割成9个相等的方格。这种构图，表现鲜明，画面简练。目前，绝大多数的数码相机甚至是手机都内置了九宫格辅助构图线，它适合应用于各种拍摄题材，最常使用的就是风景、人物等.<br/>如下例图中，分别将画面中的主体树木和教堂放在框架线上，同样的，水平线也是放在框架线的部分，这就是非常典型的三分法构图，令画面主体非常鲜明地体现出来。。','41.jpg',4,1,1823652485,8888,666),
('对称式构图','对称式构图具有平衡、稳定、相呼应的特点，但其缺点就是过于呆板、缺少变化。常用于表现对称的物体、建筑、特殊风格的物体。<br/>
如下图，拍的是一座桥，根据桥本身对称的特性，非常适合采用对称式构图去拍摄。','43.jpg',4,2,1823652485,8888,666),
('前景与纵深感','照片本身是一个平面，但如果在画面中加一个前景，以广角拍摄，就会出现一种纵深感，从而达到3D的效果。','45.jpg',4,1,1823652485,8888,666),
('框架式构图','选择框架式前景，能把观众的视线引向框架内的景物，突出主体，同时也能制造出纵深感。将主体影像包围起来，形成一种框架可营造一种神秘气氛，就好像一个人从藏匿处偷偷窥视某个地方。框架式构图有助于将主体影像与风景融为一体，赋予照片更大的视觉冲击。<br/>下面的这张图拍摄于威尼斯的圣马可广场，画面中，拱门框住了圣马可教堂和钟楼。透过拱门框住风景，是文艺复兴时期常用的绘画方法。','47.jpg',4,3,1823652485,8888,666),
('引导线','引导线构图法，就是利用画面中的线条去引导观者的目光，让他的目光最终可以汇聚到画面的焦点。当然引导线并不一定是具体的线，只要是有方向性的、连续的东西，我们都可以称之为引导线。在现实生活中，道路、河流、整齐排列的树木、颜色、阴影甚至是人的目光都可以当做引导线使用。<br/>如这张埃菲尔铁塔的照片，使用铺路石作为引导线，将观众的目光带到埃菲尔铁塔上，在这个画面中还同时使用了中心对称构图法。','49.jpg',4,4,1823652485,8888,666),
('对角线和三角形','对角线和三角形构图可以给照片添加动态的张力，让照片看起来更活泼。相对来说，水平线和垂直线就显得很稳定，如果一个人站在水平的表面上，他看起来就很稳定，但当把它放在倾斜的表面，就会给人造成一种紧张感。这样的构图方式更多地被运用在建筑和运动拍摄上。','411.jpg',4,1,1823652485,8888,666),
('图案和纹理','人类天生就容易被图案所吸引，图案可以是拱门的形状、地板上的花纹、墙上的浮雕，将这些作为画面的视觉主体，搭配光影，便能表现出特别的质感。','412.jpg',4,3,1823652485,8888,666),
('奇数法则','奇数法则是说，画面中主体是奇数时，画面在视觉上比较动人。例如，如果你要拍摄不止一个人的照片时，不要拍2个人，应该拍3、5或7个人。当然，对于婚纱摄影来说，这是个愚蠢的想法。但是只要有可能，如果你拍的不仅仅是真实生活的纪念照，就要记住奇数法则。','413.jpg',4,1,1823652485,8888,666),
('填满画面','让主体填满画面，周围留很少空间甚至不留空间，它有助于观众完全关注主体而不受任何干扰，而且还能让人很清楚地看到这个主体的细节。<br/>
如下图，第一张，狮子的脸部填满了整个画面，可以让观众清楚地观察到它的眼睛和毛发细节。第二张，将巴黎圣母院几乎填满整个画面，只是为了表现建筑上的细节。','414.jpg',4,2,1823652485,8888,666),
('利用空白空间','在上面提到，要填满空间，而这个却正好相反，在画面中留出一些空白空间，它同样能让你的主题很明显且具有吸引力，同时还创造出一种极简的画面。','415.jpg',4,3,1823652485,8888,666);