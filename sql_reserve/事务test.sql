create table bank_test(
	id int,
	name varchar(20),
	money int,
);

ALTER TABLE bank_test
ADD CONSTRAINT CK_currentMoney CHECK([money]>=1);

UPDATE bank_test SET [money] = [money] - 1000 WHERE [name] = '张三'
UPDATE bank_test SET [money] = [money] + 1000 WHERE [name] = '李四'
GO
--再次查看转帐后的结果。 
SELECT * FROM bank_test;

--显式事务

begin transaction
declare @summ_error int
	update bank_test set [money] = [money] - 1000
	where [name] = '张三'
	set @summ_error = @summ_error + @@ERROR
	update bank_test set [money] = [money] + 1000
	where [name] = '李四'
	set @summ_error = @summ_error + @@ERROR

if @summ_error != 0 
	begin 
		print '转账出错'
		rollback transaction
	end
else 
	begin
		print '转账成功'
		commit transaction
	end

print '账户中剩余余额'
select * from bank_test
go


--使用try catch写法
begin  try
     begin tran   --开启
      --从张三账户中减去1000
     update bank_test set money=money-800 where name='张三'
     --向李四账户增加1000
     update bank_test set money=money+800 where name='李四'
     commit tran    --提交
     print '提交事务';
end try
begin catch
     rollback tran   --回滚
     print '出现异常';
end catch






