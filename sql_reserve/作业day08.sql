alter proc Add_stu
@sno int,
@sname nvarchar(10),
@sage int,
@sgender bit,
@sbirthday datetime,
@mysphone char(11)
as
	set nocount on
	if exists(select * from student where sno = @sno)
		begin
			print '�û�����'
			update student
			set sname = @sname,sage = @sage,sgender = @sgender,sbirthday = @sbirthday,mysphone = @mysphone
			where sno = @sno
			print '���³ɹ������ݸĶ�Ϊ:sname:'+ @sname + ',sage:' + cast(@sage as varchar) + ',sgender:' + cast(@sgender as varchar) + ',sphone:' + @mysphone 
		end
	else 
	print '�û������ڣ�����������'
go

--(9) ����һ���洢�������ѧ����Ϣ������ѧ����ţ�����ѧ�����ơ��༶���ơ��Ա𡢵绰���� ��Ҫ�󣺰༶�����Ѵ��ڻ򲻴������ֿ����Զ�������
alter proc Add_stu_Re
@number int output,
@sno int,
@sname nvarchar(10),
@sage int,
@sgender bit,
@sbirthday datetime,
@mysphone char(11)

as
	set nocount on
	declare @count int
	declare @tmp char(11)
	if exists(select mysphone from student where mysphone = @mysphone)
		begin
		set @number = 404
		print '�ֻ����ѱ�ʹ�ã�����������'
		end
	else 
		begin
			insert into student(sno,sname,sage,sgender,sbirthday,mysphone)
			values(@sno,@sname,@sage,@sgender,@sbirthday,@mysphone)
			set @number = @sno
			set @count = @@ROWCOUNT
            if @count > 0
                print '����ѧԱ�ɹ���'
            else
                print '����ѧԱʧ�ܣ�'
		end
go

declare @result int;

exec Add_stu_Re
@result output,@sno = 34,@sname = 'ssss',@sage = 19,@sgender = 1,@sbirthday = '2007-02-21',@mysphone = '17998999799'

print cast(@result as varchar)

--(10) Ϊѧ������һ��after��������ʵ��ɾ��ѧ����Ϣ������ɾ��ѧ����Ϣ���ݵ�backupstudent��
alter trigger Del_tri_stu
on student 
for delete
as 
	declare @sno int,
	@sname nvarchar(10),
	@sage int,
	@sgender bit,
	@sbirthday datetime,
	@semail varchar(50),
	@mysphone char(11)
	select @sno = sno,@sname = sname,@sage = sage, @sgender = sgender, @sbirthday = sbirthday,@semail = semail,@mysphone = mysphone
	from deleted
	if(@sno is null)print 'sno��Ӧѧ��������'
	else 
		begin
			if(exists(select * from sysobjects where name = 'backupstudent'))
				insert into backupstudent(sno,sname,sage,sgender,sbirthday,semail,mysphone) 
					select	@sno,@sname,@sage,@sgender,@sbirthday,@semail,@mysphone
			else
				select * into backupstudent from deleted
			print '���ݳɹ�,������������'
			select * from backupstudent
		end
go

delete from student where sno = 2;
select * from student;




