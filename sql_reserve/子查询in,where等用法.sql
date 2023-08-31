-- 子查询 ： 出现在其他select语句中的select语句，就称为子查询。
-- 主查询 ： 里面嵌套其他select语句的查询语句，就是主查询。

-- 子查询可以出现在 select后面、from或者join后面、where或者having后面、in后面、exists后面

use MyDB2;

-- 1.子查询出现在select后面，当子查询出现在select后面的时候，要求子查询的结果是单行单列(标量子查询)
-- 不相关子查询：子查询的结果不依赖于外部的主查询，执行顺序是先执行子查询、再执行主查询
select (
	select count(*) from student
) '学生个数';

select (
	select count(*) from student
) '学生个数';

select avg(age) from student;

-- 查询学生姓名、学生年龄和平均年龄
select sno,sname,(
	select avg(age) from student
) '平均年龄' from student;


--2.子查询出现在form或者join后面，这个时候往往将子查询当成一张临时表来用的，所以对于子查询的结果没有行和列的限制

--查询每个学员的考试次数，以及平均分，学员信息包括学号、姓名、性别
select stu.sno,stu.sname,stu.sex,tmp.考试次数,tmp.平均分 
from student stu
inner join (
	select sno,count(*) '考试次数',avg(score) '平均分' 
	from score 
	group by sno
) tmp
on stu.sno = tmp.sno;


select stu.sno,stu.sname,stu.sex,tmp.考试次数,tmp.平均分 
from student stu,(
	select sno,count(*) '考试次数',avg(score) '平均分' 
	from score 
	group by sno
) tmp
where stu.sno = tmp.sno;


--查询每门课程的平均分，以及对应的课程名称
select cou.courseName,tmp.平均分 
from course cou
inner join (
	select courseNo,avg(score) '平均分' 
	from score 
	group by courseNo
) tmp
on cou.courseNo = tmp.courseNo;

-- 3.子查询放在where或者having后面，子查询结果可以是单行单列，也可是多行单列
-- 当where后面的条件是 = < > <= >=的时候，子查询的结果是单行单列
-- 当where后面的条件是 all  any等函数的时候，子查询的结果是单行多列

-- 3.1 单行单列
-- 查看zhangsan考试的科目总数，以及总分和平均分
select sno '学号',count(*) '考试科目总数',sum(score) '总分',avg(score) '平均分' 
from score
where sno = (
	select sno 
	from student 
	where sname = 'zhangsan'
)
group by sno;

-- 查询学号大于zhangsan的每个学生的考试的科目总数，以及总分和平均分
select sno '学号',count(*) '考试科目总数',sum(score) '总分',avg(score) '平均分' 
from score
where sno > (
	select sno 
	from student 
	where sname = 'zhangsan'
)
group by sno;

--查询年龄大于zhangsan年龄的学员信息
select * 
from student 
where age > (
	select age 
	from student 
	where sname = 'zhangsan'
);

--查询比学号为5的总分还大的学生的学号、考试科目总数、总分、平均分信息
-- select sum(score) from score where sno=5;

select sno '学号',sum(score) '总分',avg(score) '平均分',count(*) '考试科目数'
from score 
group by sno 
having sum(score)>(
	select sum(score) 
	from score 
	where sno=5
);

-- 3.2 单行多列  any all等
--查询比任意女生年龄都大的男生信息
select * 
from student
where age > any(
	select age 
	from student
	where sex = 0
) and sex = 1;


--查询比所有女生年龄都大的男生信息
select * 
from student
where age > all(
	select age 
	from student
	where sex = 0
) and sex = 1;


-- 4.子查询出现在in后面
-- 查询年龄是20或者28或者11的学生
select * from student where age = 28 or age = 20 or age = 11;
select * from student where age in (11,20,28);

-- 查询年龄不是20或者28或者11的学生
select * from student where age != 28 and age != 20 and age != 11;
select * from student where age not in (11,20,28);

--查询考试成绩大于80的学生
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


--查询参加考试的学员信息
select * 
from student 
where sno in (
	select distinct sno 
	from score
);


--查询所有科目都及格学生的考试信息
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


--查询所有科目都及格学员信息和考试信息
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


--查询所有科目都及格学员信息和考试信息和课程名字
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