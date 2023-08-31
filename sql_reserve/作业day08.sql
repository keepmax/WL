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
			print '用户存在'
			update student
			set sname = @sname,sage = @sage,sgender = @sgender,sbirthday = @sbirthday,mysphone = @mysphone
			where sno = @sno
			print '更新成功，数据改动为:sname:'+ @sname + ',sage:' + cast(@sage as varchar) + ',sgender:' + cast(@sgender as varchar) + ',sphone:' + @mysphone 
		end
	else 
	print '用户不存在，请重新输入'
go

--(9) 创建一个存储过程添加学生信息并返回学生编号，传参学生名称、班级名称、性别、电话号码 。要求：班级名称已存在或不存在两种可能性都包含。
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
		print '手机号已被使用，请重新输入'
		end
	else 
		begin
			insert into student(sno,sname,sage,sgender,sbirthday,mysphone)
			values(@sno,@sname,@sage,@sgender,@sbirthday,@mysphone)
			set @number = @sno
			set @count = @@ROWCOUNT
            if @count > 0
                print '新增学员成功！'
            else
                print '新增学员失败！'
		end
go

declare @result int;

exec Add_stu_Re
@result output,@sno = 34,@sname = 'ssss',@sage = 19,@sgender = 1,@sbirthday = '2007-02-21',@mysphone = '17998999799'

print cast(@result as varchar)

--(10) 为学生表创建一个after触发器，实现删除学生信息，并把删除学生信息备份到backupstudent表
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
	if(@sno is null)print 'sno对应学生不存在'
	else 
		begin
			if(exists(select * from sysobjects where name = 'backupstudent'))
				insert into backupstudent(sno,sname,sage,sgender,sbirthday,semail,mysphone) 
					select	@sno,@sname,@sage,@sgender,@sbirthday,@semail,@mysphone
			else
				select * into backupstudent from deleted
			print '备份成功,表中数据如下'
			select * from backupstudent
		end
go

delete from student where sno = 2;
select * from student;




