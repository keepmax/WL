create or alter proc bkInfo_Insert
@msg varchar(20) output,
@bookid varchar(50),
@bookname varchar(50),
@booktype int,
@unit_price decimal(18,2),
@amount int,
@indate datetime,
@img varchar(500)
as
	set nocount on
	declare @count int
	if exists(select bookid from bookinfo where bookid = @bookid)
		begin
			set @msg = 'update'
			update bookinfo
			set bookname = @bookname,
			booktype = @booktype,
			unit_price = @unit_price,
			amount = @amount,
			indate = @indate,
			img = @img 
			where bookid = @bookid
		end
	else 
		begin
			insert into bookinfo(bookid,bookname,booktype,unit_price,amount,indate,img)
				values(@bookid,@bookname,@booktype,@unit_price,@amount,@indate,@img)
				set @count = @@ROWCOUNT
				if @count > 0
					set @msg =  '�����鼮�ɹ���'
				else
					set @msg = '�����鼮ʧ�ܣ�'
		end

exec bkInfo_Insert
@bookid = 'XB3303',@bookname = 'ʱ���ʷ',@booktype = 1,@unit_price = 44.2,@amount = 30,@indate = '2011-03-25',@img = 'D:/'