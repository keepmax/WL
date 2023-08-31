create view [dbo].[view_stuInfo_stuscores] 
as
select stu.sno,stu.sname,sco.courseNo,sco.score from student stu
inner join score sco
on stu.sno = sco.sno;
GO



alter trigger view_stuInfo_update
on view_stuInfo_stuscores
instead of update
as
	declare @sno int,@sname varchar(50),@courseNo int,@score int 
	select @sno = sno, @courseNo = courseNo from deleted
	select @sname = sname, @score = score from inserted
	if @sno is not null
		begin
		if @courseNo is not null
			begin
				update score set score = @score where courseNo = @courseNo and sno = @sno
				update student set sname = @sname where sno = @sno
			end
		else print '用户不存在'
		end
	else print '用户不存在'
go

select * from view_stuInfo_stuscores;
--insert into score
--select 1,90,4 union
--select 2,88,4 union
--select 3,77,4 union
--select 4,97,4

-- 当视图中只修改一个表的数据的时候，是没有问题的
update view_stuInfo_stuscores set score = 55 
where sno=3 and courseNo = 1;

-- 下面修改错误，原因是不能在视图中同时修改多个表的数据
-- 现在的任务是写一个view_stuInfo_stuscores视图的instead of 的update触发器，让下面的语句能够成功执行
update view_stuInfo_stuscores set score = 55,sname = 'xiaosan'
where sno=3 and courseNo = 1;