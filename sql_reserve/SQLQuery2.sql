create database MyDB
on PRIMARY  -- PRIMARY��ʾMyDB����PRIMARY�飬����ʡ�ԣ�Ĭ�Ͼ���PRIMARY
(
    -- �������ļ���Ϣ
	name='MyDB_data',
	filename='D:\createdata_test\MyDB_data.mdf',
	size=5mb,
	maxsize=100mb,
	filegrowth=1mb   -- �������ļ�ÿ�������Ĵ�С
)
-- ��־�ļ���Ϣ
log on
(
	name='MyDB_log',
	filename='D:\createdata_test\MyDB_log.ldf',
	size=1mb,
	maxsize=unlimited,
	filegrowth=10%
)


--�������ݿ⵽ָ����λ��
backup database MyDB to disk='D:/Test.bak'


--ɾ�����ݿ�
drop database MyDB


--ʹ��ָ���ı����ļ���ԭ���ݿ�
restore database MyDB from disk='D:/Test.bak' with replace




;

-- 2.����һ�ű�
create table student (
	sno int,
	sname nvarchar(10),
	sage int,
	sgender bit,
	sbirthday datetime,
	semail varchar(50)
);


--3. �޸ı��ֶ�
-- ��ѧ�������һ���ֶν�sphone
alter table student add sphone varchar(11);

-- ɾ��ѧ����ָ���ֶ�
alter table student drop column sphone;

-- �޸�ѧ������е�����
alter table student alter column sphone char(11);

-- ѧ��ѧ�����ָ���е�����
EXEC sp_rename 'student.sphone','mysphone','column';

--ɾ��ѧ����
drop table student;

-- 4.��ӱ�Լ��
-- ���Լ�����Է�Ϊ���֣��ֱ���ʵ�������ԡ��������Ժ�����������
-- ʵ��(����)�����ԣ�����Լ��(�ǿ�+Ψһ)��ΨһԼ������ʶ��Լ��
-- �������ԣ��ǿ�Լ�������Լ����Ĭ��ֵԼ��
-- ���������ԣ����Լ��
alter table student alter column sno int not null;
alter table student alter column sbirthday datetime not null;

-- ��email�ֶ����һ��checkԼ��
alter table student add constraint CK_email check(semail like '%@%.com');

-- ��age�ֶ����checkԼ��
alter table student add constraint CK_age check(sage >=1 and sage<=100);

-- ��sphone���checkԼ��
alter table student add constraint CK_sphone check(LEN(mysphone)=11);

-- ��sgender���Ĭ��ֵԼ��
alter table student add constraint DF_sex default(1) for sgender;