-- DML语句 : 数据的增删改

-- 1.数据插入
-- 1.1 单行数据插入
SET IDENTITY_INSERT student ON;
insert into student(sno,sname,sage,sgender,semail,sphone,sbirthday) 
values(1,'张三',18,default,'zhangsan@qq.com','18888888888','2010-1-1');

-- 一般情况下，标识列不用插入值，会自动生成
-- 如果某一列要使用默认值，可以直接用default来表示
-- 插入数据的时候要满足对应的列的约束规则
-- 插入数据的时候，当值类型是字符串或者时间类型的时候，用单引号来表示
-- 插入数据的时候，对于非NULL字段，要显示的赋值
-- 插入数据的时候，要插入的列和插入的值是一一对应的
-- 插入数据的时候，可以指定要插入的部分列的信息(不一定所有的列都要插入数据，但是对应非NULL的列一定要指定数据)
-- 当插入数据不指定列名的时候，表示要插入除了标识列之外的其他所有列的信息
SET IDENTITY_INSERT student OFF;
insert into student(sname,sage,sgender,semail,sphone,sbirthday) 
values('李四',18,default,'lisi@qq.com','18888888888','2010-1-1');

insert into student(sname,sage,sgender,semail,sphone,sbirthday) 
values('李四2',18,default,'lisi@qq.com',NULL,'2011-2-2');

insert into student(sname,sage,semail,sbirthday) 
values('王五',18,'lisi@qq.com','2011-2-2');

insert into student 
values('赵六',18,default,'zhaoliu@qq.com','18222222111','2011-2-2');


-- 1.2 多行数据的插入，不指定列的情况
insert into student 
select 'xiaoming',18,1,'xiaoming@qq.com','18222222111','2011-2-2' union
select 'xiaohong',18,0,'xiaohong@qq.com','18222222111','2011-2-2' union
select 'xiaohei',18,1,'xiaohei@qq.com','18222222111','2011-2-2' 

-- 1.3 多行数据的插入，指定列的情况
insert into tcourse(name)
select '语文' union
select '数学' union
select '英语' 

select * from student;
select * from tcourse;


-- 1.4 插入多行数据：把一张表的数据插入到另外一张表
-- 1.4.1 如果使用的是insert into table select x from student 这钟方式，则要求目标表必须先创建
create table relationStudent(
	sname nvarchar(10),
	sage int check(sage>0 and sage<100),
	sgender bit default(1)
);

insert into relationStudent
select sname,sage,sgender from student;

select * from relationStudent;

-- 1.4.2 如果使用的是select x into table from student 这种方式，则无需创建目标表，会自动创建
select sno,sage,sname
into relationStudent2
from student;

select * from relationStudent2;

-- 1.4.3 在复制表数据的时候添加标识列
select sname,sage,sgender,IDENTITY(int,1,1) as sid
into relationStudent3
from student;

insert into relationStudent3
values('xx',12,1);

select * from relationStudent3;


select * from student;

-- 把所有人的性别都改成1
update student set sgender = 1;

-- 把赵六的性别改成0
update student set sgender = 0 where sno = 10;

-- 把小黑的性别改成0，同时把年龄改成28
update student set sgender = 0,sage = 28 where sno = 11;

-- update语句中有字符串或者时间类型，用单引号
update student set sname = '小黑' where sno = 11;

-- 把年龄大于20的人的邮箱修改
update student set semail = 'xx@xx.com' where sage > 20;

-- 把所有人的考试成绩-5
select * from tscoreinfo;
update tscoreinfo set score = score - 5;

-- 把考试成绩不及格的学生 + 10
update tscoreinfo set score = score + 10 where score < 60;