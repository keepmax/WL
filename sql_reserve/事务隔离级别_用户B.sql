use MyDB2;

--1. 数据丢失或覆盖更新
begin tran
update student set age = 78 where sname = 'zhangsan';
commit tran

waitfor delay '00:00:6';
select * from student;
go


--2.read uncommitted 带来脏读的问题（修改提交后再进行下一步查询）
set tran isolation level read uncommitted
begin tran
	select * from student;
commit tran


--3.read committed 解决脏读的问题
set tran isolation level read committed
begin tran
	select * from student;
commit tran


--4.read committed 带来的不可重复读的问题
set tran isolation level read committed
begin tran
	select * from student where sname = 'zhangsan';
	waitfor delay '00:00:10';
	select * from student where sname = 'zhangsan';
commit tran;

--5.repeatable read 解决不可重复读的问题(查询到两次记录都是修改前)
set tran isolation level repeatable read
begin tran
	select * from student where sname = 'zhangsan';
	waitfor delay '00:00:15';
	select * from student where sname = 'zhangsan';
commit tran;
	

--6.repeatable read 带来的幻象读的问题
set tran isolation level repeatable read
begin tran
	select * from student;
	waitfor delay '00:00:15';
	select * from student;
commit tran;


--7.serializable 解决幻象读的问题
set tran isolation level serializable
begin tran
	select * from student;
	waitfor delay '00:00:15';
	select * from student;
commit tran;