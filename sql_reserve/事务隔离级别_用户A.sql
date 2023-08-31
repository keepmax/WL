use MyDB2;

--1. 数据丢失或覆盖更新
begin tran
update student set age = 30 where sname = 'zhangsan';
commit tran

waitfor delay '00:00:10';
select * from student;
go


--2.read uncommitted 带来脏读的问题
set tran isolation level read uncommitted
begin tran
	update student set age = 11 where sname = 'zhangsan';
	waitfor delay '00:00:10';
	update student set age = 30 where sname = 'zhangsan';
commit tran;
	

--3.read committed 解决脏读的问题
set tran isolation level read committed
begin tran
	update student set age = 11 where sname = 'zhangsan';
	waitfor delay '00:00:10';
	update student set age = 50 where sname = 'zhangsan';
commit tran;

--4.read committed 带来的不可重复读的问题
set tran isolation level read committed
begin tran
	waitfor delay '00:00:10';
	update student set age = 55 where sname = 'zhangsan';
commit tran;

--5.repeatable read 解决不可重复读的问题
set tran isolation level repeatable read
begin tran
	waitfor delay '00:00:5';
	update student set age = 66 where sname = 'zhangsan';
commit tran;

--6.repeatable read 带来的幻象读的问题
set tran isolation level repeatable read
begin tran
	waitfor delay '00:00:5';
	insert into student  values('xiaobai',1,'2011-1-1',null,18,null);
commit tran;


--7.serializable 解决幻象读的问题
set tran isolation level serializable
begin tran
	waitfor delay '00:00:5';
	insert into student  values('xiaobai2',1,'2011-1-1',null,18,null);
commit tran;