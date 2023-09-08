create or alter proc backdata_bookinfo_proc
@bookid varchar(50)
as
	set nocount on
	declare @count int,

	@bookname varchar(50),
	@booktype int,
	@unit_price decimal(18,2),
	@amount int,
	@indate datetime,
	@img varchar(500)
	if exists(select bookid from backupbookinfo where bookid = @bookid)
	begin
		select @bookname = bookname,@booktype = booktype,@unit_price = unit_price,@amount = amount,@indate = indate,@img = img
		from backupbookinfo
		where bookid = @bookid
		
		insert into bookinfo(bookid,bookname,booktype,unit_price,amount,indate,img)
				values(@bookid,@bookname,@booktype,@unit_price,@amount,@indate,@img)
				set @count = @@ROWCOUNT
		delete from backupbookinfo where bookid = @bookid
	end
go

select * from bookinfo inner join booktype on bookinfo.booktype = booktype.Typeid;
select bookid,bookname,booktype.bookType,unit_price,amount,indate,img 
from bookinfo inner join booktype 
on bookinfo.booktype = booktype.Typeid 
where booktype.bookType = '≥Ã–Ú ÈºÆ';