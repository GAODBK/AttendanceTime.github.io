-- 删除已有的表 DROP TABLE book_info;

-- 重新创建表，设置 book_id 为自动增长
CREATE TABLE book_info (
    book_id BIGINT IDENTITY(1, 1) PRIMARY KEY,   -- 图书号，自动增长
    name VARCHAR(20) NOT NULL,                   -- 书名
    author VARCHAR(15) NOT NULL,                 -- 作者
    publish VARCHAR(20) NOT NULL,                -- 出版社
    ISBN VARCHAR(15) NOT NULL,                   -- 标准书号
    introduction TEXT NULL,                      -- 简介
    language VARCHAR(4) NOT NULL,                -- 语言
    price DECIMAL(10, 2) NOT NULL,               -- 价格
    pub_date DATE NOT NULL,                      -- 出版时间
    class_id INT NULL,                           -- 分类号 (外键，连接分类表)
    number INT NULL                              -- 剩余数量
);
-- class_id字段的值如/foreignNovels或类似的路径表示，通常适合用字符串数据类型（例如VARCHAR或TEXT）

ALTER TABLE book_info
ALTER COLUMN name VARCHAR(50) NOT NULL;

INSERT INTO book_info (
    book_id, name, author,publish, ISBN, introduction, language, price, pub_date, class_id, number
) VALUES (
    8, 'SRE 工作现场直击', '叶承彦(Ia̍p Sêng Gān)(Sean Ia̍p)', ' 博碩文化 ', 
    '6263339349', '维运起点x 实战经验x 职涯规划面面观（iThome铁人赛系列书）', 
    '繁體中文', 468.00, '2024-09-03', 
    3, 30
);
INSERT INTO book_info (name, author, publish, ISBN, introduction, language, price, pub_date, class_id) VALUES
('推荐系统实践入门', '风间正宏', '欧莱礼', '6263247800', '推荐系统实用入门——工作中可以使用的入门指南', '繁体中文', 680.0, '2024-11-04', '1'),
('云端/ DevOps / SRE 工程师转职必杀技', '謝明宏', '博碩文化', '6263339772', '翻转职涯！云端/ DevOps / SRE 工程师转职必杀技：四大步骤带你找出职能优势、成功精准转职的规划指南（iThome铁人赛系列书）', '繁体中文', 650.0, '2024-11-06', '1'),
('Coding Video', 'Richardson, Iain E', 'Wiley', '1118711785', 'Coding Video: A Practical Guide to Hevc and Beyond', '英文', 3600.0, '2024-11-01', '2'),
('Practical Lakehouse Architecture', 'Thalpati, Gaurav Ashok', 'O Reilly', '1098153014', 'Designing and Implementing Modern Data Platforms at Scale (Paperback)', '英文', 2450.0, '2024-08-27', '2'),
('Azure AI 人工智慧基础能力', 'MCF', 'Microsoft', '1111', 'Microsoft MCF 微軟核心能力原廠國際認證-AI-900 Azure AI 人工智慧基礎能力', '英文', 3200.0, '2024-11-01', '3'),
('VR Developer', 'UCU', 'Unity', '1111', 'Unity UCU 游戏设计开发原厂国际认证', '英文', 4200.0, '2024-11-01', '3'),
('LLM 大型语言模型的绝世秘笈', '陈威廷（Penut Chen）', '博碩文化', '6263339292', '27路独步剑法，带你闯荡生成式AI 的五湖四海（iThome铁人赛系列书）', '繁体中文', 507.0, '2024-08-12', '4'),
('SRE 工作现场直击', '叶承彦(Ia̍p Sêng Gān)(Sean Ia̍p)', '博碩文化', '6263339349', '维运起点x 实战经验x 职涯规划面面观（iThome铁人赛系列书）', '繁體中文', 468.0, '2024-09-03', '4'),
('双城记', '狄更斯', '中国对外翻译出版公司', 'B09MQBW6QG', '以18世纪的法国大革命为背景，故事中将巴黎、伦敦两个大城市连结起来，叙述梅尼特医生一家充满了爱与冒险的遭遇，中间穿插了贵族的残暴、人民的愤怒、审判间谍……', '英语', 714.0, '2009-05-01', '/foreignNovels'),
('忏悔录', '[法]卢梭 (著) ', '重庆出版社', '9787229109349', '哲学/宗教|哲学经典著作', '中文', 468.0, '2016-04-30', '/foreignNovels'),
('茶花女', '(法)亚历山大•小仲马(著)', '外语教学与研究出版社', 'B092YFZV2G', '讲述在19世纪40年代，一个叫阿尔丰西娜•普莱西的贫苦乡下姑娘来到巴黎，走进了名利场，成了上流社会的一个社交明星，开始了卖笑生涯；之后她改名为玛丽•杜普莱西，结识了小仲马，于是两人开始了一段交往的爱情故事。', '繁體中文', 783.0, '2013-02-01', '/foreignNovels'),
('活着', '余华', '作家出版社', 'B0098SGXLK', '在大时代背景下，随着内战、三反五反，大跃进，文化大革命等社会变革，徐福贵的人生和家庭不断经受着苦难，到了最后所有亲人都先后离他而去，仅剩下年老的他和一头老牛相依为命', '中文', 1430.0, '2012-08-01', '/ContemporaryChineseNovels'),
('平凡的世界', '路遥', '北京十月文芸出版社', 'B071SDP8PC', '该书以中国70年代中期到80年代中期十年间为背景，通过复杂的矛盾纠葛，以孙少安和孙少平两兄弟为中心，刻画了当时社会各阶层众多普通人的形象；', '中文', 470.0, '2017-01-01', '/ContemporaryChineseNovels'),
('黄金时代', '王小波', 'Cypress Book Co. UK Ltd', '7530220292', '是作品系列之“时代三部曲”中的一部作品', '中文', 468.0, '2021-06-01', '/ContemporaryChineseNovels'),
('穆斯林的葬礼', '霍达', '博碩文化', 'B0BVTZL64W', '是霍达创作的一部长篇小说', '中文', 684.0, '2024-09-03', '/ContemporaryChineseNovels'),
('一半是火焰一半是海水', '王朔', '北京十月文艺出版社', 'B01FS1661M', '你能看出更深的东西你就看，你不能看出更深的东西，起码也让你乐一乐。', '中文', 258.0, '2015-02-28', '/socialFiction'),
('活着', '余华', '作家出版社', 'B0098SGXLK', '余华是我国当代著名作家，也是享誉世界的小说家，曾荣获众多国内外奖项。《活着》是其代表作，已成为中国乃至世界当代文学的经典。', '中文', 143.0, '2012-08-01', '/socialFiction'),
('人间', '蔡骏', '中国友谊出版公司', '7505745085', '神秘的读心术，古老的兰陵王面具，两个斗争千年不休的世家大族，一次关于人性和命运的传奇体验', '中文', 369.0, '2019-02-28', '/socialFiction'),
('福尔摩斯探案全集', '柯南·道尔 著', '中华书局', '9787101089110', '这部小说包含了四部长篇《血字的研究》《四签名》《奇案记》和《巴斯克维尔猎犬》和众多短篇故事，其中大部分内容都是医生华生对于好友福尔摩斯探案故事的回忆录', '中文', 176.0, '2012-11-01', '/detectiveNovel'),
('马耳他黑鹰', '达希尔·哈米特 著', '文汇出版社', '9787549613946', '哈米特是“硬汉派”侦探小说的创始人和重要代表人物之一，这本书也是硬汉派小说的开山之作。由于作者本人就当过私人侦探，因而对社会现实、犯罪心理、警匪争斗的描写具体又详细', '中文', 30.0, '2015-03-01', '/detectiveNovel');

UPDATE book_info
SET ISBN = '6263339292'  -- 将 ISBN 修改为 6263339292
WHERE ISBN = '1111';      -- 查找 ISBN 为 1111 的记录

UPDATE book_info
SET class_id = 4
WHERE book_id IN (7, 8);

CREATE TABLE class_info (
    class_id INT PRIMARY KEY,            -- 类别号
    class_name VARCHAR(15) NOT NULL      -- 类别名
);
select * from book_info
select * from class_info
CREATE TABLE lend_list (
    ser_num BIGINT PRIMARY KEY,          -- 流水号
    book_id BIGINT NOT NULL,             -- 图书号 (外键，连接书目表)
    reader_id BIGINT NOT NULL,           -- 读者证号 (外键，连接读者表)
    lend_date DATE NULL,                 -- 借出日期
    back_date DATE NULL                  -- 归还日期
);

CREATE TABLE reader_card (
    reader_id BIGINT PRIMARY KEY,        -- 读者证号 (外键，连接读者信息表)
    password VARCHAR(15) NOT NULL,       -- 密码
    username VARCHAR(15) NULL            -- 用户名
);

CREATE TABLE reader_info (
    reader_id BIGINT PRIMARY KEY,        -- 读者证号
    name VARCHAR(10) NOT NULL,           -- 姓名
    sex VARCHAR(2) NOT NULL,             -- 性别
    birth DATE NOT NULL,                 -- 生日
    address VARCHAR(50) NOT NULL,        -- 地址
    phone VARCHAR(15) NOT NULL           -- 电话
);

-- 在 book_info 表中添加外键，连接 class_info 表的 class_id
ALTER TABLE book_info
ADD CONSTRAINT FK_Book_Class FOREIGN KEY (class_id) REFERENCES class_info(class_id);

-- 在 lend_list 表中添加外键，连接 book_info 表和 reader_info 表
ALTER TABLE lend_list
ADD CONSTRAINT FK_Lend_Reader FOREIGN KEY (reader_id) REFERENCES reader_info(reader_id);
-- ADD CONSTRAINT FK_Lend_Book FOREIGN KEY (book_id) REFERENCES book_info(book_id),

-- 在 reader_card 表中添加外键，连接 reader_info 表的 reader_id
ALTER TABLE reader_card
ADD CONSTRAINT FK_Reader_Card FOREIGN KEY (reader_id) REFERENCES reader_info(reader_id);
