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
INSERT INTO hot VALUES(NULL,'hot/2.jpg','2','沉睡魔咒2',6.2,'2019 / 美国 / 奇幻 冒险 / 乔阿吉姆·罗恩尼 / 安吉丽娜·朱莉 艾莉...',0.9);
INSERT INTO hot VALUES(NULL,'hot/3.jpg','3','感化院',8.4,'2015 / 德国 / 剧情 / 马克·布鲁蒙德 / 约纳斯·伯格 路易斯·霍夫曼',1.2);
INSERT INTO hot VALUES(NULL,'hot/4.jpg','4','航海王:狂热行动',8.3,'2019 / 日本 / 动画 冒险 / 大塚隆史 / 田中真弓 冈村明美',1.2);
INSERT INTO hot VALUES(NULL,'hot/5.jpg','5','我和我的祖国',8.0,'2019 / 中国大陆 / 剧情 / 陈凯歌 张一白 管虎 薛晓璐 徐峥 宁浩...',43.9);
INSERT INTO hot VALUES(NULL,'hot/6.jpg','6','中国机长',7.0,'2019 / 中国大陆 / 剧情 传记 灾难 / 刘伟强 / 张涵予 欧豪',29.9);
INSERT INTO hot VALUES(NULL,'hot/7.jpg','7','犯罪现场',6.7,'2019 / 中国香港 / 犯罪 悬疑 惊悚 / 冯志强 / 古天乐 宣萱',2.1);
INSERT INTO hot VALUES(NULL,'hot/8.jpg','8','罗小黑战记',8.3,'2019 / 中国大陆 / 动作 动画 奇幻 / 木头 / 山新 郝祥海',20.7);
INSERT INTO hot VALUES(NULL,'hot/9.jpg','9','攀登者',6.5,'2019 / 中国大陆 / 剧情 冒险 / 李仁港 / 吴京 章子怡',14.7);
INSERT INTO hot VALUES(NULL,'hot/10.jpg','10','天作迷案',7.0,'2017 / 印度 / 悬疑 惊悚 / 阿沛·乔普拉 / 施坦·马洛萨 索娜什·辛...',1.0);
INSERT INTO hot VALUES(NULL,'hot/11.jpg','11','雪人奇缘',7.5,'2019 / 美国 中国大陆 / 喜剧 动画 冒险 / 吉尔·卡尔顿 托德·维...',1.2);
INSERT INTO hot VALUES(NULL,'hot/12.jpg','12','哪吒之魔童降世',8.5,'2019 / 中国大陆 / 剧情 喜剧 动画 / 饺子 / 吕艳婷 囧森瑟夫',116);
INSERT INTO hot VALUES(NULL,'hot/13.jpg','13','沉睡魔咒',7.1,'2014 / 美国 英国 / 奇幻 冒险 / 罗伯特·斯特罗姆伯格 / 安吉丽...',26.1);
INSERT INTO hot VALUES(NULL,'hot/14.jpg','14','决胜时刻',6.8,'2019 / 中国大陆 / 剧情 传记 历史 / 黄建新 宁海强 / 唐国强 刘劲',1.5);
INSERT INTO hot VALUES(NULL,'hot/15.jpg','15','巨鳄风暴',5.7,'2019 / 美国 / 剧情 惊悚 灾难 / 亚历山大·阿嘉 / 卡雅·斯考达里...',5.7);
INSERT INTO hot VALUES(NULL,'hot/16.jpg','16','徒手攀岩',8.9,'2018 / 美国 / 纪录片 / 伊丽莎白·柴·瓦莎瑞莉 金国威 / 亚力克斯·...',10.9);
INSERT INTO hot VALUES(NULL,'hot/17.jpg','17','速度与激情:特别行动',6.3,'2019 / 美国 / 动作 犯罪 / 大卫·雷奇 / 道恩·强森 杰森·斯坦森',17.3);
INSERT INTO hot VALUES(NULL,'hot/18.jpg','18','三傻大闹宝莱坞',9.2,'2009 / 印度 / 剧情 喜剧 爱情 / 拉吉库马尔·希拉尼 / 阿米尔·汗...',165);
INSERT INTO hot VALUES(NULL,'hot/19.jpg','19','最好的时光',7.6,'2005 / 中国台湾 / 剧情 爱情 / 侯孝贤 / 舒淇 张震',10.9);
INSERT INTO hot VALUES(NULL,'hot/20.jpg','20','花滑女王',6.8,'2018 / 俄罗斯 / 剧情 爱情 运动 / 奥列格·特罗费姆 / 阿格拉娅·塔...',2.5);

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
INSERT INTO will VALUES(NULL,'will/21.jpg','21','随风摇曳','2019/中国大陆/剧情/家庭/上映时间：2019-10-20(中国大陆)',441);
INSERT INTO will VALUES(NULL,'will/22.jpg','22','护宝计中计','2019/中国大陆/剧情/家庭/上映时间：2019-10-22(中国大陆)',64);
INSERT INTO will VALUES(NULL,'will/23.jpg','23','红色之子·单刀赴会','2019/中国大陆/剧情/历史/战争/上映时间：2019-10-04(中国大陆)',102);
INSERT INTO will VALUES(NULL,'will/24.jpg','24','步步为营','2019/中国大陆/剧情/犯罪/上映时间：2019-10-24(中国大陆)',1115);
INSERT INTO will VALUES(NULL,'will/25.jpg','25','天作谜案','2019/印度/悬疑/惊悚/上映时间：2019-10-25(中国大陆)',9955);
INSERT INTO will VALUES(NULL,'will/26.jpg','26','催眠裁决','2019/中国大陆/中国香港/犯罪/悬疑/上映时间：2019-10-25(中国大陆)',7845);
INSERT INTO will VALUES(NULL,'will/27.jpg','27','解放·终局营救','2019/中国大陆/剧情/历史/战争/上映时间：2019-10-20(中国大陆)',2959);
INSERT INTO will VALUES(NULL,'will/28.jpg','28','单行道','2019/中国大陆/剧情/上映时间：2019-10-25(中国大陆)',1115);
INSERT INTO will VALUES(NULL,'will/29.jpg','29','太阳升起的时刻','2019/中国大陆/剧情/战争/上映时间：2019-10-25(中国大陆)',123);
INSERT INTO will VALUES(NULL,'will/30.jpg','30','爱情诅咒','2019/中国大陆/爱情/奇幻/上映时间：2019-10-26(中国大陆)',7);
INSERT INTO will VALUES(NULL,'will/31.jpg','31','三傻闹地球','2018/德国/卢森堡/丹麦/喜剧/科幻/上映时间：2019-10-20(中国大陆)',1115);
INSERT INTO will VALUES(NULL,'will/32.jpg','32','来者何人','2019/中国大陆/剧情/西部/上映时间：2019-10-30(中国大陆)',169);
INSERT INTO will VALUES(NULL,'will/33.jpg','33','道具师','2019/中国大陆/悬疑/惊悚/上映时间：2019-10-31(中国大陆)',327);
INSERT INTO will VALUES(NULL,'will/34.jpg','34','七月之后','2019/中国大陆/剧情/爱情/上映时间：2019-10-31(中国大陆)',1115);
INSERT INTO will VALUES(NULL,'will/35.jpg','35','天气之子','2019/日本/爱情/动画/奇幻/上映时间：2019-11-1(中国大陆)',8542);
INSERT INTO will VALUES(NULL,'will/36.jpg','36','终结者:黑暗命运','2019/美国/中国大陆/动作/科幻/冒险/上映时间：2019-11-1(中国大陆)',9084);
INSERT INTO will VALUES(NULL,'will/37.jpg','37','六欲天','2019/中国大陆/剧情/犯罪/上映时间：2019-11-1(中国大陆)',1957);
INSERT INTO will VALUES(NULL,'will/38.jpg','38','一生有你','2019/中国大陆/爱情/上映时间：2019-11-1(中国大陆)',232);
INSERT INTO will VALUES(NULL,'will/39.jpg','39','越域重生','2019/美国/动作/犯罪/惊悚/上映时间：2019-08-29(中国大陆)',183);
INSERT INTO will VALUES(NULL,'will/40.jpg','40','萤火奇兵2：小虫不好惹','2019/中国大陆/喜剧/动画/奇幻/上映时间：2019-11-2(中国大陆)',85);
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
INSERT INTO details VALUES(NULL,'movie/2.jpg','2','沉睡魔咒2','Maleficent:Mistress of Ebil(2019)',6.2,'美国 / 奇幻 冒险 / 上映时间：2019-10-18(中国大陆) / 片长：119分钟 >','《沉睡魔咒》续集将讲述魔女玛琳菲森（朱莉）和将成为女王的爱洛公主（范宁）关系缓和但依旧复杂，但两人要联手对付新的反派，保护森林王国和那里神奇的动物们。');
INSERT INTO details VALUES(NULL,'movie/3.jpg','3','感化院','Freistatt(2015)',8.4,'德国 /剧情 / 上映时间：2015-06-25(德国) / 片长：104分钟 >','故事发生在1968年的德国，少年沃尔夫冈（路易斯·霍夫曼 Louis Hofmann 饰）的母亲再嫁，他和继父之间的关系很是紧张，在一场冲突之后，继父将沃尔夫冈送入了感化院之中，沃尔夫冈就此开始了充满了痛苦与折磨的监狱生活。 倔强的沃尔夫冈不愿意沦为残暴统治的奴隶，一次又一次的反抗挣扎换来的却只有伤痕累累，唯一支撑着他的，是记忆中来自母亲的温暖。沃尔夫冈决定和同伴安东（Langston Beckford-Uibel 饰）一起逃跑，两人历经千难万险，最终回到了小镇上。可是，当母亲看见沃尔夫冈时，却并未表现得如他所想象的一般高兴，更残酷的是，没过多久，他便再度被继父和母亲重新送回了感化院。');
INSERT INTO details VALUES(NULL,'movie/4.jpg','4','航海王:狂热行动','ONE PIECE STAMPEDE(2019)',8.3,'日本 / 动画冒险 / 上映时间：2019-10-18(中国大陆) / 片长：101分钟 >','《航海王：狂热行动》是“航海王系列”第14部剧场版，也是《航海王》动画二十周年纪念之作。 以超新星为代表的众多航海家纷纷现身世界最大的航海家庆典——航海世博会。草帽航海团也收到了主办者费斯塔的邀请函，搭乘万里阳光号前往。原以为航海家们的狂热世博会只是为争夺“航海王罗杰留下的宝藏”，就在神秘宝藏争夺战如火如荼之际，阻挡在路飞等人面前的可怕威胁道格拉斯·巴雷特突然现身！暗藏阴谋的敌我混战一触即发……');
INSERT INTO details VALUES(NULL,'movie/5.jpg','5','我和我的祖国','(2019)',8.0,'中国大陆 / 剧情 / 上映时间：2019-09-30(中国大陆)/片长：155分钟 >','七位导演分别取材新中国成立70周年以来，祖国经历的无数个历史性经典瞬间。讲述普通人与国家之间息息相关密不可分的动人故事。聚焦大时代大事件下，小人物和国家之间，看似遥远实则密切的关联，唤醒全球华人共同回忆。');
INSERT INTO details VALUES(NULL,'movie/6.jpg','6','中国机长','(2019)',7.0,'中国大陆 / 剧情 / 上映时间：2019-09-30(中国大陆) / 片长：111分钟 >','电影《中国机长》根据2018年5月14日四川航空3U8633航班机组成功处置特情真实事件改编：机组执行航班任务时，在万米高空突遇驾驶舱风挡玻璃爆裂脱落、座舱释压的极端罕见险情，生死关头，他们临危不乱、果断应对、正确处置，确保了机上全部人员的生命安全，创造了世界民航史上的奇迹。');
INSERT INTO details VALUES(NULL,'movie/7.jpg','7','犯罪现场','犯罪现场(2019)',6.7,'中国香港 / 犯罪 悬疑 惊悚 / 上映时间：2019-10-12(中国大陆) / 片长：105分钟 >','《犯罪現場》以通缉犯徐糠伏尸屋事件开始，负责调查的警官林法栋（张继聪 饰）发现涉及一宗一个月前的劫案，当中同谋包括汪新元（古天乐 饰）、红毛（凌文龙 饰）与欧阳（李灿森 饰），而犯罪现场唯一目击证人是一只鹦鹉，林法栋锁定汪新元为嫌犯。不过案情卻不如想像中直接……');
INSERT INTO details VALUES(NULL,'movie/8.jpg','8','罗小黑战记','(2019)',8.3,'中国大陆 / 动作 动画 奇幻 / 上映时间：2019-09-07(中国大陆) / 片长：101分钟 >','在熙攘的人类世界里，很多妖精隐匿其中，他们与人类相安无事地生活着。猫妖罗小黑因为家园被破坏，开始了它的流浪之旅。这场旅途中惺惺相惜的妖精同类与和谐包容的人类伙伴相继出现，让小黑陷入了两难抉择，究竟何处才是真正的归属？');
INSERT INTO details VALUES(NULL,'movie/9.jpg','9','攀登者','(2019)',6.5,'中国大陆 / 剧情 冒险 /上映时间：2019-09-30(中国大陆) / 片长：125分钟 >','1960年，中国登山队向珠峰发起冲刺，完成了世界首次北坡登顶这一不可能的任务。15 年后，方五洲和曲松林在气象学家徐缨的帮助下，带领李国梁、杨光等年轻队员再次挑战世界之巅。迎接他们的将是更加 严酷的现实，也是生与死的挑战......');
INSERT INTO details VALUES(NULL,'movie/10.jpg','10','天作迷案','Ittefaq(2017)',7.0,'印度 / 悬疑 惊悚 / 上映时间：2019-10-25(中国大陆) / 片长：105分钟 >','警官德夫正在调查一宗双重谋杀案，只有两名证人，他们也是主要嫌疑人。嫌疑犯之一，著名的作家；另一个，是年轻的家庭主妇玛雅。不同的故事，却在同一个命运之夜联系到了一起，而背后的真相也远非表面这么简单…… 这是一部没有歌舞也没有外挂的印度电影，只有悬疑和逻辑推理。');
INSERT INTO details VALUES(NULL,'movie/11.jpg','11','雪人奇缘','Abominable(2019)',7.5,'美国 中国大陆 / 喜剧 动画 冒险 / 上映时间：2019-10-01(中国大陆) / 片长：97分钟 >','珠穆朗玛峰的雪人是传说吗？不是！不仅不是传说，它还拥有令人着迷的魔力！少女小艺在天台上目睹了雪人大毛即将被抓的惨况，决定亲自护送大毛回家，她的小伙伴阿俊和鹏鹏也加入了护送队伍。一路上冒险小分队路经了千岛湖、黄山、乐山大佛等著名的中国景点，雪人大毛为了躲避抓捕者，也逐一展现了自己神奇的魔力。巨大化的蒲公英，一秒变大的蓝莓，油菜花海浪，还有什么是雪人大毛的魔力做不到的？而抓捕者也早已在他们的目的地珠峰等待着冒险小分队步入早已设好的圈套…');
INSERT INTO details VALUES(NULL,'movie/12.jpg','12','哪吒之魔童降世','(2019)',8.5,'中国大陆 / 剧情 喜剧 动画 / 上映时间：2019-07-26(中国大陆)/ 片长：110分钟 >','天地灵气孕育出一颗能量巨大的混元珠，元始天尊将混元珠提炼成灵珠和魔丸，灵珠投胎为人，助周伐纣时可堪大用；而魔丸则会诞出魔王，为祸人间。元始天尊启动了天劫咒语，3年后天雷将会降临，摧毁魔丸。太乙受命将灵珠托生于陈塘关李靖家的儿子哪吒身上。然而阴差阳错，灵珠和魔丸竟然被掉包。本应是灵珠英雄的哪吒却成了混世大魔王。调皮捣蛋顽劣不堪的哪吒却徒有一颗做英雄的心。然而面对众人对魔丸的误解和即将来临的天雷的降临，哪吒是否命中注定会立地成魔？他将何去何从？');
INSERT INTO details VALUES(NULL,'movie/13.jpg','13','沉睡魔咒','Maleficent(2014)',7.1,'美国 英国 / 奇幻 冒险 / 上映时间：2014-06-20(中国大陆) / 片长：98分钟(中国大陆)97分钟(美国) >','在宁静祥和的摩尔王国，广袤的大森林中，动物与精灵和谐相处，无忧无虑。那一年，天真无邪的小仙女玛琳菲森（伊莎贝尔·莫洛伊 Isobelle Molloy 饰）邂逅了人类小男孩斯特凡（迈克尔·希金斯 Michael Higgins 饰）。他们两小无猜，成为亲密无间的好朋友， 更在万物的守护下坠入爱河。但是随着年龄的增长，斯特凡（沙尔托·科普雷 Sharlto Copley 饰）褪去了往日的纯真，被人类的贪欲所吸引。而玛琳菲森（安吉丽娜·朱莉 Angelina Jolie 饰）则成长为法术强大的仙女。愚蠢的人类向摩尔王国开战，斯特凡为了成为王位继承者，残忍地割下了玛琳菲森的翅膀。
肉体的痛苦和心灵的创伤，让玛琳菲森变成了满怀仇恨的冷酷魔女，为了复仇她给斯特凡的女儿爱洛公主（艾丽·范宁 Elle Fanning 饰）施下了沉睡魔咒……');
INSERT INTO details VALUES(NULL,'movie/14.jpg','14','决胜时刻','(2019)',6.8,'中国大陆 / 剧情 传记 历史 / 上映时间：2019-09-20(中国大陆) / 片长：140分钟 >','1949年，党中央领导人进驻北京香山，在国共和谈破裂的千钧一发之际，全力筹划建立新中国。');
INSERT INTO details VALUES(NULL,'movie/15.jpg','15','巨鳄风暴','Crawl(2019)',5.7,'美国 / 剧情 惊悚 灾难 / 上映时间：2019-09-12(中国大陆) / 片长：87分钟 >','一场猛烈的飓风正在逼近美国佛罗里达州的一座小镇。女主角海莉（卡雅·斯考达里奥饰）在游泳训练中接到了姐姐的电话，他们的父亲（巴里·佩珀饰）已经失联多时，她非常担心父亲的安危。海莉不顾撤离命令独自前往父亲家中，并最终在地下室里找到了身受重伤的父亲。洪水暴涨眼看就要将地下室淹没，海莉很快就意识到最可怕的并不是洪水，而是隐藏在水中的致命猛兽--鳄鱼。');
INSERT INTO details VALUES(NULL,'movie/16.jpg','16','徒手攀岩','Free Solo(2019)',8.9,'美国 / 纪录片 / 上映时间：2019-09-06(中国大陆) / 片长：100分钟 >','亚历克斯·霍诺德从2009年就梦想着徒手攀登酋长岩，此后尝试了1000多次，而徒手攀登酋长岩是自己的 “终极目标”。为此，他准备了一年半的时间，借助绳索攀爬过近60次酋长岩。他表示，自己这样做并非为了进行预演，而是反复尝试不同的岩点，研究攻克最难的区域。纪录片拍下了约塞米蒂国家公园及酋长岩的壮丽景色及霍诺德登顶的历史时刻。除此之外，片中还回顾了他怎样处理极限目标带来的生命风险，以及他如何追求卓越完美，从而在无绳索保护的情况下保证万无一失。');
INSERT INTO details VALUES(NULL,'movie/17.jpg','17','速度与激情:特别行动','Fast & Furious Presents:Hobbs & Shaw(2019)',6.3,'美国 / 动作 犯罪 / 上映时间：2019-08-23(中国大陆)/片长：137分钟 >','一个是美国外交安全局的忠诚特工、身材魁梧的执法者霍布斯（强森饰），一个是前英国军事特工精英、无法无天的恶棍肖（斯坦森饰）。在2015年的《速度与激情7》中首次对峙之后，两人不论言语还是肢体都冲突不断，一直试图打倒对方。
然而，通过高科技进行了基因增强的无政府主义者布里克斯顿（伊德瑞斯·艾尔巴饰）控制了一种可能永远改变人类命运的不为人知的生化武器，并且还打败了一位大胆优秀又特立独行的军情六处特工（曾出演《王冠》的凡妮莎·科比饰）——她恰好是肖的妹妹，为了扳倒这个世界上唯一可能比他们更厉害的敌人，这两个不共戴天的宿敌不得不联手。
《速度与激情：特别行动》一片在《速度与激情》系列的宇宙中推开了一扇全新的大门。从洛杉矶到伦敦，从切尔诺贝利的有毒废墟到美丽的南太平洋岛国萨摩亚，本次特别行动席卷全球。
该片由大卫·雷奇执导(《死侍2》导演)，由《速度与激情》系列故事的缔造者克里斯·摩根编剧，摩根、强森、斯坦森和海拉姆·加西亚共同担纲制片。丹尼·加西亚、凯利·麦考密克、 、史蒂文·查斯曼、伊森·史密斯和安斯利·戴维斯担任监制。');
INSERT INTO details VALUES(NULL,'movie/18.jpg','18','三傻大闹宝莱坞','(2009)',9.2,'印度 / 剧情 喜剧 爱情 / 上映时间：2011-12-08(中国大陆)/片长：171分钟(印度) >','本片根据印度畅销书作家奇坦·巴哈特（Chetan Bhagat）的处女作小说《五点人》（Five Point Someone）改编而成。法兰（马德哈万 R Madhavan 饰）、拉杜（沙曼·乔希 Sharman Joshi 饰）与兰乔（阿米尔·汗 Aamir Khan 饰）是皇家工程学院的学生，三人共居一室，结为好友。在以严格著称的学院里，兰乔是个非常与众不同的学生，他不死记硬背，甚至还公然顶撞校长“病毒”（波曼·伊拉尼 Boman Irani 饰），质疑他的教学方法。他不仅鼓动法兰与拉杜去勇敢追寻理想，还劝说校长的二女儿碧雅（卡琳娜·卡普 Kareena Kapoor 饰）离开满眼铜臭的未婚夫。兰乔的特立独行引起了模范学生“消音器”（奥米·维嘉 Omi Vaidya 饰）的不满，他约定十年后再与兰乔一决高下，看哪种生活方式更能取得成功。
本片获孟买电影博览奖最佳影片、最佳导演、最佳配角（波曼·伊拉尼）、最佳剧本等六项大奖，并获国际印度电影协会最佳影片、最佳导演、最佳剧情、最佳摄影等十六项大奖。');
INSERT INTO details VALUES(NULL,'movie/19.jpg','19','最好的时光','最好的时光(2005)',7.6,'中国台湾 / 剧情 爱情 / 上映时间：2005-10-28(中国台湾)/片长：130分钟 >','该片是侯孝贤对自己电影生涯所作的一次总结。三段故事里男（张震）女（舒淇）主角表达情感的方式及所处时代背景，都能在侯孝贤各个时期的影片里找到对应。《恋爱梦》纯净，似不可抵达的梦的彼岸；《自由梦》感人，却是接近天国的更遥远的梦境；《青春梦》冰冷，却是现实。 冒失说出侯孝贤眼中“最好的时光（或最好的电影时光）”是哪一段并无太大意义，因为所有的时光都是被辜负被浪费的，也只有在辜负浪费之后，才能从记忆里将某一段拎出，拍拍上面沉积的灰尘，感叹它是最好的时光。');
INSERT INTO details VALUES(NULL,'movie/20.jpg','20','花滑女王','(2018)',6.8,'俄罗斯 / 剧情 爱情 运动 / 上映时间：2018-03-30(中国大陆)/片长：113分钟89分钟(中国大陆) >','花样滑冰新人娜佳虽然家境贫寒、天赋不足，却凭借母亲的鼓励和自身的不懈努力崭露头角，成为了世界顶级花滑男选手里奥纳夫的搭档，两人屡获佳绩，并坠入爱河成为备受瞩目的金童玉女。花滑世界杯前夕，娜佳意外受重伤，人生跌至谷底，里奥纳夫也选择了离开。心灰意冷之际，冰球运动员萨沙出现在娜迪亚的身边，二人由互相嫌弃发展出一段暖心的爱情。娜佳也在萨沙的鼓励下重塑信心再次出发，靠着执着与坚持度过了漫长的恢复期。当她终于可以重返赛场时，她的伤势再犯，人生面临再次选择......');


/*演员表*/
CREATE TABLE actor(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    pic VARCHAR(32),
    aname VARCHAR(24),
    roll VARCHAR(24)/*角色*/
);
INSERT INTO actor VALUES(NULL,'actor/01.png','李安','导演');
INSERT INTO actor VALUES(NULL,'actor/02.png','乔阿吉姆·罗恩尼','导演');
INSERT INTO actor VALUES(NULL,'actor/03.png','马克·布鲁蒙德','导演');
INSERT INTO actor VALUES(NULL,'actor/04.png','大塚隆史','导演');
INSERT INTO actor VALUES(NULL,'actor/05.png','陈凯歌','导演');
INSERT INTO actor VALUES(NULL,'actor/06.png','刘伟强','导演');
INSERT INTO actor VALUES(NULL,'actor/07.png','冯志强','导演');
INSERT INTO actor VALUES(NULL,'actor/08.png','木头','导演');
INSERT INTO actor VALUES(NULL,'actor/09.png','李仁港','导演');
INSERT INTO actor VALUES(NULL,'actor/10.png','阿沛·乔普拉','导演');
INSERT INTO actor VALUES(NULL,'actor/11.png','吉尔·卡尔顿','导演');
INSERT INTO actor VALUES(NULL,'actor/12.png','饺子','导演');
INSERT INTO actor VALUES(NULL,'actor/13.png','罗伯特·斯特罗姆伯格','导演');
INSERT INTO actor VALUES(NULL,'actor/14.png','黄建新','导演');
INSERT INTO actor VALUES(NULL,'actor/15.png','亚历山大·阿嘉','导演');
INSERT INTO actor VALUES(NULL,'actor/16.png','伊丽莎白·柴·瓦莎瑞莉','导演');
INSERT INTO actor VALUES(NULL,'actor/17.png','大卫·雷奇','导演');
INSERT INTO actor VALUES(NULL,'actor/18.png','拉吉库马尔·希拉尼','导演');
INSERT INTO actor VALUES(NULL,'actor/19.png','侯孝贤','导演');
INSERT INTO actor VALUES(NULL,'actor/20.png','奥列格·特罗费姆','导演');



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
INSERT INTO recommend VALUES(NULL,'续命之徒:绝命毒师',8.3,'41');
INSERT INTO recommend VALUES(NULL,'送我上青云',7.2,'42');
INSERT INTO recommend VALUES(NULL,'爱尔兰人',9.1,'43');
INSERT INTO recommend VALUES(NULL,'拾芳',7.1,'44');
INSERT INTO recommend VALUES(NULL,'半世界',7.2,'45');
INSERT INTO recommend VALUES(NULL,'哪吒之魔童降世',8.5,'46');
INSERT INTO recommend VALUES(NULL,'银河补习班',6.2,'47');
INSERT INTO recommend VALUES(NULL,'小丑回魂2',6.5,'48');
INSERT INTO recommend VALUES(NULL,'安娜',7.7,'49');
INSERT INTO recommend VALUES(NULL,'寄生虫',8.7,'50');

/*一周口碑电影榜单*/
CREATE TABLE weeklist(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    mname VARCHAR(24),
    title VARCHAR(48),
    score DECIMAL(2,1),
    pic VARCHAR(24),
    params VARCHAR(8)
);
INSERT INTO weeklist VALUES(NULL,'小丑','加拿大/美国/剧情 犯罪 惊悚/托德·菲利普斯',9.2,'list/51.png','51');
INSERT INTO weeklist VALUES(NULL,'续命之徒:绝命毒师','美国/剧情 犯罪 惊悚/文斯·吉利根',8.0,'list/52.png','52');
INSERT INTO weeklist VALUES(NULL,'我和我的祖国','中国大陆/剧情/陈凯歌/黄渤 张译',8.0,'list/53.png','53');
INSERT INTO weeklist VALUES(NULL,'航海王：狂热行动','日本/动画 冒险/大塚隆史',8.3,'list/54.png','54');
INSERT INTO weeklist VALUES(NULL,'柳烈的音乐专辑','韩国/剧情 爱情/郑址宇',8.3,'list/55.png','55');
INSERT INTO weeklist VALUES(NULL,'哈马舍尔德悬案','丹麦 挪威 瑞典 比利时/纪录片/麦斯·布鲁格',8.3,'list/56.png','56');
INSERT INTO weeklist VALUES(NULL,'婚姻故事','美国/剧情 喜剧/诺亚·鲍姆巴赫/斯嘉丽·约翰逊',8.7,'list/57.png','57');
INSERT INTO weeklist VALUES(NULL,'唐顿庄园','英国/剧情/迈克尔·恩格勒',8.5,'list/58.png','58');
INSERT INTO weeklist VALUES(NULL,'我的喜马拉雅','中国大陆/剧情/张馨',7.9,'list/59.png','59');
INSERT INTO weeklist VALUES(NULL,'自卫的艺术','美国/喜剧/莱利·斯特恩斯',7.3,'list/60.png','60');

/*电影top10榜单*/
CREATE TABLE toplist(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    mname VARCHAR(24),
    title VARCHAR(48),
    score DECIMAL(2,1),
    pic VARCHAR(24),
    params VARCHAR(8)
);
INSERT INTO toplist VALUES(NULL,'肖申克的救赎','美国/犯罪 剧情/弗兰克·德拉邦特',9.7,'list/61.png','61');
INSERT INTO toplist VALUES(NULL,'霸王别姬','中国大陆 中国香港/剧情 爱情 同性/陈凯歌 ',9.6,'list/62.png','62');
INSERT INTO toplist VALUES(NULL,'阿甘正传','美国/爱情 剧情/弗兰克·德拉邦特',9.7,'list/63.png','63');
INSERT INTO toplist VALUES(NULL,'这个杀手不太冷','法国/犯罪 剧情/',9.4,'list/64.png','64');
INSERT INTO toplist VALUES(NULL,'美丽人生','意大利/剧情 喜剧 爱情/罗伯托·贝尼尼',9.5,'list/65.png','65');
INSERT INTO toplist VALUES(NULL,'泰坦尼克号','美国/剧情 爱情 灾难',9.4,'list/66.png','66');
INSERT INTO toplist VALUES(NULL,'千与千寻','日本/剧情 动画 奇幻',9.3,'list/67.png','67');
INSERT INTO toplist VALUES(NULL,'辛德勒的名单','美国/剧情 历史 战争/史蒂文·斯皮尔伯格',9.5,'list/68.png','68');
INSERT INTO toplist VALUES(NULL,'盗梦空间','美国/剧情 科幻 悬疑/莱昂纳多·迪卡普里奥',9.3,'list/69.png','69');
INSERT INTO toplist VALUES(NULL,'忠犬八公的故事','美国 英国/剧情/理查·基尔',9.3,'list/70.png','70');
/*电视剧精选推荐*/
CREATE TABLE tvrecommend(
    tid INT PRIMARY KEY AUTO_INCREMENT,
    rname VARCHAR(24),
    score DECIMAL(2,1),
    params VARCHAR(8)
);
INSERT INTO tvrecommend VALUES(NULL,'真相捕捉',9.0,'71');
INSERT INTO tvrecommend VALUES(NULL,'动物狂想曲',9.4,'72');
INSERT INTO tvrecommend VALUES(NULL,'孤独的美食家',9.4,'73');
INSERT INTO tvrecommend VALUES(NULL,'偶然发现的一天',9.0,'74');
INSERT INTO tvrecommend VALUES(NULL,'致命女人',9.3,'75');
INSERT INTO tvrecommend VALUES(NULL,'我的英雄学院 第四季',9.2,'76');
INSERT INTO tvrecommend VALUES(NULL,'小谢尔顿 第三季',9.4,'77');
INSERT INTO tvrecommend VALUES(NULL,'浪漫的体质',9.2,'78');
INSERT INTO tvrecommend VALUES(NULL,'难以置信',9.3,'79');
INSERT INTO tvrecommend VALUES(NULL,'还是不能结婚的男人',8.5,'80');

/*话语口碑榜单*/
CREATE TABLE chilist(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    mname VARCHAR(24),
    title VARCHAR(48),
    score DECIMAL(2,1),
    pic VARCHAR(24),
    params VARCHAR(8)
);
INSERT INTO chilist VALUES(NULL,'金宵大厦','中国香港/剧情 悬疑 奇幻/叶镇辉/陈山聪 李施嬅',8.5,'list/81.png','81');
INSERT INTO chilist VALUES(NULL,'俗女养成记','中国台湾/剧情 喜剧/严文艺/谢莹萱',9.1,'list/82.png','82');
INSERT INTO chilist VALUES(NULL,'他乡的童年','中国大陆/纪录片/周铁君/周轶君',9.1,'list/83.png','83');
INSERT INTO chilist VALUES(NULL,'长江之恋','中国大陆/纪录片/刘丽婷',9.0,'list/84.png','84');
INSERT INTO chilist VALUES(NULL,'我在未来等你','中国大陆/剧情/薛凌',8.3,'list/85.png','85');
INSERT INTO chilist VALUES(NULL,'汉化日记','中国大陆/动画 奇幻 短片/周雪/乔菲菲',8.5,'list/86.png','86');
INSERT INTO chilist VALUES(NULL,'在远方','中国大陆/剧情 爱情/陈昆辉/刘烨',7.2,'list/87.png','87');
INSERT INTO chilist VALUES(NULL,'外交风云','中国大陆/剧情 历史/宋业明',7.9,'list/88.png','88');
INSERT INTO chilist VALUES(NULL,'水果传 第二季','中国大陆/纪录片/曾欣',8.8,'list/89.png','89');
INSERT INTO chilist VALUES(NULL,'画江湖之不良人','中国大陆/动作 武侠 动画/周飞龙/边江 申秋香',8.5,'list/90.png','90');

/*全球口碑榜单*/
CREATE TABLE earthlist(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    mname VARCHAR(24),
    title VARCHAR(48),
    score DECIMAL(2,1),
    pic VARCHAR(24),
    params VARCHAR(8)
);
INSERT INTO earthlist VALUES(NULL,'真相捕捉','英国/惊悚/本·切男/荷莉戴·格兰杰 卡勒姆·特纳',8.0,'list/91.png','91');
INSERT INTO earthlist VALUES(NULL,'动物狂想曲','日本/ 动画 /松见真一/小林亲弘 千本木彩花',8.0,'list/92.png','92');
INSERT INTO earthlist VALUES(NULL,'孤独的美食家','日本/剧情 喜剧/井川尊史/松重丰',9.4,'list/93.png','93');
INSERT INTO earthlist VALUES(NULL,'偶然发现的一天','韩国/爱情 奇幻/金尚變/金惠允 金路云',8.0,'list/94.png','94');
INSERT INTO earthlist VALUES(NULL,'致命女人','美国/剧情 喜剧 犯罪/大卫·格罗斯曼/刘玉玲',8.0,'list/95.png','95');
INSERT INTO earthlist VALUES(NULL,'我的英雄学院','日本/动作 动画 奇幻/长崎建寺/山下大辉 三宅健太',8.0,'list/96.png','96');
INSERT INTO earthlist VALUES(NULL,'小谢尔顿','美国/喜剧/加富尔·马哈穆德/伊恩·阿米蒂奇',8.0,'list/97.png','97');
INSERT INTO earthlist VALUES(NULL,'浪漫的体质','韩国/喜剧 爱情/李炳宪/千雨熙',8.0,'list/98.png','98');
INSERT INTO earthlist VALUES(NULL,'难以置信','美国/剧情 犯罪/丽莎·查罗登科',8.0,'list/99.png','99');
INSERT INTO earthlist VALUES(NULL,'还是不能结婚的男人','日本/剧情 爱情/三宅喜重/阿部宽',8.0,'list/100.png','100');