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
		else print '�û�������'
		end
	else print '�û�������'
go

select * from view_stuInfo_stuscores;
--insert into score
--select 1,90,4 union
--select 2,88,4 union
--select 3,77,4 union
--select 4,97,4

-- ����ͼ��ֻ�޸�һ��������ݵ�ʱ����û�������
update view_stuInfo_stuscores set score = 55 
where sno=3 and courseNo = 1;

-- �����޸Ĵ���ԭ���ǲ�������ͼ��ͬʱ�޸Ķ���������
-- ���ڵ�������дһ��view_stuInfo_stuscores��ͼ��instead of ��update�������������������ܹ��ɹ�ִ��
update view_stuInfo_stuscores set score = 55,sname = 'xiaosan'
where sno=3 and courseNo = 1;