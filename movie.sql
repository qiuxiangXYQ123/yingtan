SET NAMES UTF8;
DROP DATABASE IF EXISTS movie;
CREATE DATABASE movie CHARSET=UTF8;
USE movie;

/*正在热映*/
CREATE TABLE hot(
    /*热门电影编号*/
    hid INT PRIMARY KEY AUTO_INCREMENT,
    /*图片*/
    pic VARCHAR(32),
    /*参数*/
    params VARCHAR(8),
    /*电影名*/
    mname VARCHAR(24),
    /*评分*/
    score DECIMAL(2,1),
    /*标题*/
    title VARCHAR(64),
    /*观看量*/
    watched DECIMAL(3,1)
);
INSERT INTO hot VALUES(NULL,'hot/1.jpg','1','双子杀手',7.1,'2019/美国 中国大陆/剧情 动作 科幻/ 李安/威尔·史密斯 玛...',8.1);

/*即将上映*/
CREATE TABLE will(
    /*编号*/
    wid INT PRIMARY KEY AUTO_INCREMENT,
    /*图片*/
    pic VARCHAR(32),
    /*参数*/
    params VARCHAR(8),
    /*电影名*/
    mname VARCHAR(24),
    /*标题*/
    title VARCHAR(64),
    /*想看*/
    want INT
);
INSERT INTO will VALUES(NULL,'will/1.jpg','21','你好霸王龙','2018/中国大陆 日本 韩国/动画/李珍钊 静野孔文/蔡伟军',1115);

/*电影详情*/
CREATE TABLE details(
    /*详情页编号*/
    did INT PRIMARY KEY AUTO_INCREMENT,
    /*图片*/
    pic VARCHAR(32),
    /*参数*/
    params VARCHAR(8),
    /*电影中文名*/
    cname VARCHAR(24),
    /*英文名及年份*/
    ename VARCHAR(24),
    /*评分*/
    score DECIMAL(2,1),
    /*标题*/
    title VARCHAR(64),
    /*简介*/
    intr  VARCHAR(256)
);
INSERT INTO details VALUES(NULL,'movie/1.jpg','1','双子杀手','Gemini Man(2019)',7.1,'美国/剧情 动作 科幻/上映时间：2019-10-18(中国大陆)/片长：117分钟 >','美国国防情报局特工亨利（威尔·史密斯饰），准备退休之际意外遭到一名神秘杀手的追杀，在两人的激烈较量中，他发现这名杀手竟然是年轻了20多岁的自己，一场我与我的对决旋即展开，而背后的真相也逐渐浮出水面');

/*演员表*/
CREATE TABLE actor(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    pic VARCHAR(32),
    aname VARCHAR(24),
    roll VARCHAR(24)/*角色*/
);
INSERT INTO actor VALUES(NULL,'actor/01.png','李安','导演');



/*用户表*/
CREATE TABLE user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    phone VARCHAR(16),
    uname VARCHAR(12),
    avt VARCHAR(24),/*头像*/
    upwd VARCHAR(32)
);
INSERT INTO actor VALUES(NULL,'13812345678''tom','avt/01.jpg',md5('123'));
INSERT INTO actor VALUES(NULL,'13812345679''jack','avt/02.jpg',md5('123'));



/*评论*/
CREATE TABLE comment(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    uid INT,
    mid INT,
    uname VARCHAR(12),
    com VARCHAR(512),/*评论*/
    avt VARCHAR(24)/*头像*/
);
INSERT INTO comment VALUES(NULL,1,1,'tom','很重要的是你抱着怎样的预期来看这部李安作品，你又期待在这部电影中看到怎样的李安式表达？预期不同，角度不同，获得的体验自然也不同。具体到我个人来说，也许因为之前对于技术层面已经有所领略，所以这次更多地是想看李安怎样将一个上世纪就能写出来的故事做一些全新的解构，可惜最后呈现的结果还是稍微有些失望的。影片虽然有很多有价值的主题，比如克隆反思、父权挑战、自我对立等，但整体并无什么新鲜感。剧本本身也很拧巴，尤其是养别人的克隆体做儿子，再派他去杀掉本体，这种设定感觉完全不符合逻辑。虽然反派最后强行圆场，但中间的很多细节还是很难说得通，这种时候也只能抛开故事看技术了。技术层面无可挑剔，两个威尔·史密斯的对垒极具真实感，前两场打斗戏的精细度甚至是令人瞠目结舌的。虽然本片平庸，但我仍对李安未来的作品抱有期待。','avt/01.png');

/*电影精选推荐*/
CREATE TABLE recommend(
    rid INT PRIMARY KEY AUTO_INCREMENT,
    rname VARCHAR(24),
    score DECIMAL(2,1),
    params VARCHAR(8)
);
INSERT INTO recommend VALUES(NULL,'亡命之徒:绝命毒...',8.3,'41');

/*一周口碑电影榜单*/
CREATE TABLE weeklist(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    mname VARCHAR(24),
    title VARCHAR(48),
    score DECIMAL(2,1),
    pic VARCHAR(24),
    params VARCHAR(8)
);
INSERT INTO weeklist VALUES(NULL,'我和我的祖国','中国大陆/剧情/陈凯歌/黄渤 张译',8.0,'list/01.jpg','51');

/*电影top10榜单*/
CREATE TABLE toplist(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    mname VARCHAR(24),
    title VARCHAR(48),
    score DECIMAL(2,1),
    pic VARCHAR(24),
    params VARCHAR(8)
);
INSERT INTO toplist VALUES(NULL,'我和我的祖国','中国大陆/剧情/陈凯歌/黄渤 张译',8.0,'list/01.jpg','61');

/*电视剧精选推荐*/
CREATE TABLE tvrecommend(
    tid INT PRIMARY KEY AUTO_INCREMENT,
    rname VARCHAR(24),
    score DECIMAL(2,1),
    params VARCHAR(8)
);
INSERT INTO tvrecommend VALUES(NULL,'亡命之徒:绝命毒...',8.3,'71');

/*话语口碑榜单*/
CREATE TABLE chilist(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    mname VARCHAR(24),
    title VARCHAR(48),
    score DECIMAL(2,1),
    pic VARCHAR(24),
    params VARCHAR(8)
);
INSERT INTO chilist VALUES(NULL,'我和我的祖国','中国大陆/剧情/陈凯歌/黄渤 张译',8.0,'list/01.jpg','81');

/*全球口碑榜单*/
CREATE TABLE earthlist(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    mname VARCHAR(24),
    title VARCHAR(48),
    score DECIMAL(2,1),
    pic VARCHAR(24),
    params VARCHAR(8)
);
INSERT INTO earthlist VALUES(NULL,'我和我的祖国','中国大陆/剧情/陈凯歌/黄渤 张译',8.0,'list/01.jpg','91');