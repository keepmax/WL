-- DML��� : ���ݵ���ɾ��

-- 1.���ݲ���
-- 1.1 �������ݲ���
SET IDENTITY_INSERT student ON;
insert into student(sno,sname,sage,sgender,semail,sphone,sbirthday) 
values(1,'����',18,default,'zhangsan@qq.com','18888888888','2010-1-1');

-- һ������£���ʶ�в��ò���ֵ�����Զ�����
-- ���ĳһ��Ҫʹ��Ĭ��ֵ������ֱ����default����ʾ
-- �������ݵ�ʱ��Ҫ�����Ӧ���е�Լ������
-- �������ݵ�ʱ�򣬵�ֵ�������ַ�������ʱ�����͵�ʱ���õ���������ʾ
-- �������ݵ�ʱ�򣬶��ڷ�NULL�ֶΣ�Ҫ��ʾ�ĸ�ֵ
-- �������ݵ�ʱ��Ҫ������кͲ����ֵ��һһ��Ӧ��
-- �������ݵ�ʱ�򣬿���ָ��Ҫ����Ĳ����е���Ϣ(��һ�����е��ж�Ҫ�������ݣ����Ƕ�Ӧ��NULL����һ��Ҫָ������)
-- ���������ݲ�ָ��������ʱ�򣬱�ʾҪ������˱�ʶ��֮������������е���Ϣ
SET IDENTITY_INSERT student OFF;
insert into student(sname,sage,sgender,semail,sphone,sbirthday) 
values('����',18,default,'lisi@qq.com','18888888888','2010-1-1');

insert into student(sname,sage,sgender,semail,sphone,sbirthday) 
values('����2',18,default,'lisi@qq.com',NULL,'2011-2-2');

insert into student(sname,sage,semail,sbirthday) 
values('����',18,'lisi@qq.com','2011-2-2');

insert into student 
values('����',18,default,'zhaoliu@qq.com','18222222111','2011-2-2');


-- 1.2 �������ݵĲ��룬��ָ���е����
insert into student 
select 'xiaoming',18,1,'xiaoming@qq.com','18222222111','2011-2-2' union
select 'xiaohong',18,0,'xiaohong@qq.com','18222222111','2011-2-2' union
select 'xiaohei',18,1,'xiaohei@qq.com','18222222111','2011-2-2' 

-- 1.3 �������ݵĲ��룬ָ���е����
insert into tcourse(name)
select '����' union
select '��ѧ' union
select 'Ӣ��' 

select * from student;
select * from tcourse;


-- 1.4 ����������ݣ���һ�ű�����ݲ��뵽����һ�ű�
-- 1.4.1 ���ʹ�õ���insert into table select x from student ���ӷ�ʽ����Ҫ��Ŀ�������ȴ���
create table relationStudent(
	sname nvarchar(10),
	sage int check(sage>0 and sage<100),
	sgender bit default(1)
);

insert into relationStudent
select sname,sage,sgender from student;

select * from relationStudent;

-- 1.4.2 ���ʹ�õ���select x into table from student ���ַ�ʽ�������贴��Ŀ������Զ�����
select sno,sage,sname
into relationStudent2
from student;

select * from relationStudent2;

-- 1.4.3 �ڸ��Ʊ����ݵ�ʱ����ӱ�ʶ��
select sname,sage,sgender,IDENTITY(int,1,1) as sid
into relationStudent3
from student;

insert into relationStudent3
values('xx',12,1);

select * from relationStudent3;


select * from student;

-- �������˵��Ա𶼸ĳ�1
update student set sgender = 1;

-- ���������Ա�ĳ�0
update student set sgender = 0 where sno = 10;

-- ��С�ڵ��Ա�ĳ�0��ͬʱ������ĳ�28
update student set sgender = 0,sage = 28 where sno = 11;

-- update��������ַ�������ʱ�����ͣ��õ�����
update student set sname = 'С��' where sno = 11;

-- ���������20���˵������޸�
update student set semail = 'xx@xx.com' where sage > 20;

-- �������˵Ŀ��Գɼ�-5
select * from tscoreinfo;
update tscoreinfo set score = score - 5;

-- �ѿ��Գɼ��������ѧ�� + 10
update tscoreinfo set score = score + 10 where score < 60;