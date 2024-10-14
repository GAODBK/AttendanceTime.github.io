这个项目 文件夹原名：asp_xmsx，如果报错，请先重命名文件夹
The original name of this project folder is: asp_xmsx. If an error is reported, please rename the folder first.

```sql
CREATE TABLE tb_College
(
Coid char(2) primary key,
Ccollege varchar(30) not null,
Cocreatedate varchar(30),
Coattribute varchar(10),
Copremier varchar(16),
Coinfo varchar(30),
Cosort char(2),
Coextra1 varchar(6) null,
Coextra2 varchar (6) null,
Coextra3 varchar(6) null,
Coextra4 varchar (6) null,
Coextra5 varchar(6) null
)


insert
into tb_College(Coid,Ccollege)
values
('01','文学院'),
('02','历史文化学院'),
('03','计算机与信息工程学院'),
('04','化学与化工学院'),
('05','外国语学院'),
('06','国际教育学院'),
('07','数学与统计学院'),
('08','哲学学院'),
('09','资源与环境工程学院'),
('10','商学院'),
('11','物理与电子科学学院'),
('12','新闻与传播学院'),
('13','体育学院');
select * from tb_College

CREATE TABLE tb_Course
(
Cno char(5) primary key,
Cname varchar(40),
Credit decimal(2,1),
Cnature char(4),
Ctime varchar(6) null,
Coid char(2) not null,
Ccollege varchar(30) not null,
Ccreatedate date,
Cpicture varchar(40),
Cextra1 varchar(6) null,
Cextra2 varchar (6) null,
Cextra3 varchar(6) null,
Cextra4 varchar (6) null,
Cextra5 varchar(6) null,
FOREIGN KEY (Coid) REFERENCES tb_College(Coid)
)

insert
into tb_Course(Cno,Cname,Credit,Cnature,Ctime,Coid,Ccollege,Ccreatedate,Cpicture)
values
('16001','数据库系统概论','3','专选','32','03','计算机与信息工程学院','2014-12-22','/images/courses/SQL Server.jpg'),
('16002','计算机组成原理','5','必修','80','03','计算机与信息工程学院','2014-12-22','/images/courses/计算机组成原理.jpg'),
('16003','计算机网络','6','必修','90','03','计算机与信息工程学院','2015-12-22','/images/courses/计算机网络.jpg'),
('16004','操作系统','6','必修','92','03','计算机与信息工程学院','2015-12-22','/images/courses/操作系统.jpg'),
('16005','微机原理与接口技术','2','专选','60','11','物理与电子科学学院','2015-11-16','/images/courses/单片机.jpg'),
('16006','大学语文','3','公选','64','01','文学院','2009-12-09','/images/courses/毛概.jpg'),
('16007','大学英语','3','公选','60','05','外国语学院','2008-12-12','/images/courses/英语.jpg'),
('16008','马克思原理','3','专选','80','08','哲学学院','2005-12-16','/images/courses/马原.jpg'),
('16009','高等数学','3','必修','100','07','数学与统计学院','2006-09-17','/images/courses/高等数学.jpg'),
('16010','线性代数','3','必修','56','07','数学与统计学院','2006-09-22','/images/courses/线性代数.jpg'),
('16011','心理学导论','3','公选','30','08','哲学学院','2015-12-02','/images/courses/数字逻辑.jpg'),
('16012','道家思想','2','公选','36','02','历史文化学院','2004-06-22','/images/courses/模拟电路.jpg'),
('16013','经济学导论','3','公选','60','10','商学院','2015-07-22','/images/courses/毛概.jpg'),
('16014','新闻学','3','专选','80','12','新闻与传播学院','2015-09-04','/images/courses/概率论与数理统计.jpg'),
('16015','新媒体概论','3','必修','100','12','新闻与传播学院','2016-06-01','/images/courses/单片机.jpg'),
('16016','篮球裁判','3','必修','56','13','体育学院','2014-10-26','/images/courses/Python.jpg'),
('16017','大学物理','3','公选','30','11','物理与电子科学学院','2014-10-12','/images/courses/css.jpg'),
('16018','教育心理学','2','公选','36','06','国际教育学院','2011-05-22','/images/courses/JavaScript.jpg'),
('16019','无机非金属','2','公选','36','04','化学与化工学院','2000-10-12','/images/courses/计算机系统结构.jpg'),
('16020','环境工程','3','必修','48','09','资源与环境工程学院','2014-12-12','/images/courses/Android.jpg');


```
