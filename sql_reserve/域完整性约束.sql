-- 2.创建一张表
create table student(
	sno int,
	sname nvarchar(10),
	sage int,
	sgender bit,
	sbirthday datetime,
	semail varchar(50)
);


--3. 修改表字段
-- 给学生表添加一个字段叫sphone
alter table student add sphone varchar(11);

-- 删除学生表单指定字段
alter table student drop column sphone;

-- 修改学生表的列的类型
alter table student alter column sphone char(11);

-- 学生学生表的指令列的名字
EXEC sp_rename 'student.sphone','mysphone','column';

--删除学生表
drop table student;

-- 4.添加表约束
-- 表的约束可以分为三种，分别是实体完整性、域完整性和引用完整性
-- 实体(数据)完整性：主键约束(非空+唯一)、唯一约束、标识列约束
-- 域完整性：非空约束、检查约束、默认值约束
-- 引用完整性：外键约束
alter table student alter column sno int not null;
alter table student alter column sbirthday datetime not null;

-- 给email字段添加一个check约束
alter table student add constraint CK_email check(semail like '%@%.com');

-- 给age字段添加check约束
alter table student add constraint CK_age check(sage >=1 and sage<=100);

-- 给sphone添加check约束
alter table student add constraint CK_sphone check(LEN(mysphone)=11);

-- 给sgender添加默认值约束
alter table student add constraint DF_sex default(1) for sgender;

select * from sys.check_constraints;