-- �Ӳ�ѯ �� ����������select����е�select��䣬�ͳ�Ϊ�Ӳ�ѯ��
-- ����ѯ �� ����Ƕ������select���Ĳ�ѯ��䣬��������ѯ��

-- �Ӳ�ѯ���Գ����� select���桢from����join���桢where����having���桢in���桢exists����

use MyDB2;

-- 1.�Ӳ�ѯ������select���棬���Ӳ�ѯ������select�����ʱ��Ҫ���Ӳ�ѯ�Ľ���ǵ��е���(�����Ӳ�ѯ)
-- ������Ӳ�ѯ���Ӳ�ѯ�Ľ�����������ⲿ������ѯ��ִ��˳������ִ���Ӳ�ѯ����ִ������ѯ
select (
	select count(*) from student
) 'ѧ������';

select (
	select count(*) from student
) 'ѧ������';

select avg(age) from student;

-- ��ѯѧ��������ѧ�������ƽ������
select sno,sname,(
	select avg(age) from student
) 'ƽ������' from student;


--2.�Ӳ�ѯ������form����join���棬���ʱ���������Ӳ�ѯ����һ����ʱ�����õģ����Զ����Ӳ�ѯ�Ľ��û���к��е�����

--��ѯÿ��ѧԱ�Ŀ��Դ������Լ�ƽ���֣�ѧԱ��Ϣ����ѧ�š��������Ա�
select stu.sno,stu.sname,stu.sex,tmp.���Դ���,tmp.ƽ���� 
from student stu
inner join (
	select sno,count(*) '���Դ���',avg(score) 'ƽ����' 
	from score 
	group by sno
) tmp
on stu.sno = tmp.sno;


select stu.sno,stu.sname,stu.sex,tmp.���Դ���,tmp.ƽ���� 
from student stu,(
	select sno,count(*) '���Դ���',avg(score) 'ƽ����' 
	from score 
	group by sno
) tmp
where stu.sno = tmp.sno;


--��ѯÿ�ſγ̵�ƽ���֣��Լ���Ӧ�Ŀγ�����
select cou.courseName,tmp.ƽ���� 
from course cou
inner join (
	select courseNo,avg(score) 'ƽ����' 
	from score 
	group by courseNo
) tmp
on cou.courseNo = tmp.courseNo;

-- 3.�Ӳ�ѯ����where����having���棬�Ӳ�ѯ��������ǵ��е��У�Ҳ���Ƕ��е���
-- ��where����������� = < > <= >=��ʱ���Ӳ�ѯ�Ľ���ǵ��е���
-- ��where����������� all  any�Ⱥ�����ʱ���Ӳ�ѯ�Ľ���ǵ��ж���

-- 3.1 ���е���
-- �鿴zhangsan���ԵĿ�Ŀ�������Լ��ֺܷ�ƽ����
select sno 'ѧ��',count(*) '���Կ�Ŀ����',sum(score) '�ܷ�',avg(score) 'ƽ����' 
from score
where sno = (
	select sno 
	from student 
	where sname = 'zhangsan'
)
group by sno;

-- ��ѯѧ�Ŵ���zhangsan��ÿ��ѧ���Ŀ��ԵĿ�Ŀ�������Լ��ֺܷ�ƽ����
select sno 'ѧ��',count(*) '���Կ�Ŀ����',sum(score) '�ܷ�',avg(score) 'ƽ����' 
from score
where sno > (
	select sno 
	from student 
	where sname = 'zhangsan'
)
group by sno;

--��ѯ�������zhangsan�����ѧԱ��Ϣ
select * 
from student 
where age > (
	select age 
	from student 
	where sname = 'zhangsan'
);

--��ѯ��ѧ��Ϊ5���ֻܷ����ѧ����ѧ�š����Կ�Ŀ�������ܷ֡�ƽ������Ϣ
-- select sum(score) from score where sno=5;

select sno 'ѧ��',sum(score) '�ܷ�',avg(score) 'ƽ����',count(*) '���Կ�Ŀ��'
from score 
group by sno 
having sum(score)>(
	select sum(score) 
	from score 
	where sno=5
);

-- 3.2 ���ж���  any all��
--��ѯ������Ů�����䶼���������Ϣ
select * 
from student
where age > any(
	select age 
	from student
	where sex = 0
) and sex = 1;


--��ѯ������Ů�����䶼���������Ϣ
select * 
from student
where age > all(
	select age 
	from student
	where sex = 0
) and sex = 1;


-- 4.�Ӳ�ѯ������in����
-- ��ѯ������20����28����11��ѧ��
select * from student where age = 28 or age = 20 or age = 11;
select * from student where age in (11,20,28);

-- ��ѯ���䲻��20����28����11��ѧ��
select * from student where age != 28 and age != 20 and age != 11;
select * from student where age not in (11,20,28);

--��ѯ���Գɼ�����80��ѧ��
select * 
from student 
where sno = any(
	select distinct sno 
	from score 
	where score >= 80
)

select * 
from student 
where sno in (
	select distinct sno 
	from score 
	where score >= 80
)


--��ѯ�μӿ��Ե�ѧԱ��Ϣ
select * 
from student 
where sno in (
	select distinct sno 
	from score
);


--��ѯ���п�Ŀ������ѧ���Ŀ�����Ϣ
select * 
from score 
where sno in (
	select sno 
	from score 
	group by sno 
	having min(score)>=60
);


select * 
from score 
where score >= 60 and sno not in(
	select distinct sno 
	from score 
	where score<60
);


--��ѯ���п�Ŀ������ѧԱ��Ϣ�Ϳ�����Ϣ
select stu.sno,stu.sname ,tmp.score
from student stu
inner join (
	select * 
	from score 
	where score >= 60 and sno not in(
		select distinct sno 
		from score 
		where score<60
	)
) tmp
on stu.sno = tmp.sno;


--��ѯ���п�Ŀ������ѧԱ��Ϣ�Ϳ�����Ϣ�Ϳγ�����
select stu.sno,stu.sname ,tmp.score,cou.courseName
from student stu
inner join (
	select * 
	from score 
	where score >= 60 and sno not in(
		select distinct sno 
		from score 
		where score<60
	)
) tmp
on stu.sno = tmp.sno
inner join course cou
on cou.courseNo = tmp.courseNo;