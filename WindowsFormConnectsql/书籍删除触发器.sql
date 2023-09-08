create or alter trigger table_bookinfo_del
on bookinfo
for delete
as
	declare @bookid varchar(50),@bookname varchar(50),@booktype int,@unit_price decimal(18,2),@amount int,@indate datetime,@img varchar(500)

	select @bookid = bookid,@bookname = bookname,@booktype = booktype,@unit_price = unit_price,@amount = amount,@indate = indate,@img = img from deleted
	if(@bookid is null)print 'nonexist'
	else
	begin
	if (exists(select * from sysobjects where name = 'backupbookinfo'))
		begin
			insert into backupbookinfo(bookid,bookname,booktype,unit_price,amount,indate,img)
			select @bookid,@bookname,@booktype,@unit_price,@amount,@indate,@img
		end
	else
		select * into backupbookinfo from deleted
	end
go


delete from bookinfo where bookid = 'XB3303';
select * from backupbookinfo;
select * from bookinfo;