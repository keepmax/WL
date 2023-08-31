create table bank_test(
	id int,
	name varchar(20),
	money int,
);

ALTER TABLE bank_test
ADD CONSTRAINT CK_currentMoney CHECK([money]>=1);

UPDATE bank_test SET [money] = [money] - 1000 WHERE [name] = '����'
UPDATE bank_test SET [money] = [money] + 1000 WHERE [name] = '����'
GO
--�ٴβ鿴ת�ʺ�Ľ���� 
SELECT * FROM bank_test;

--��ʽ����

begin transaction
declare @summ_error int
	update bank_test set [money] = [money] - 1000
	where [name] = '����'
	set @summ_error = @summ_error + @@ERROR
	update bank_test set [money] = [money] + 1000
	where [name] = '����'
	set @summ_error = @summ_error + @@ERROR

if @summ_error != 0 
	begin 
		print 'ת�˳���'
		rollback transaction
	end
else 
	begin
		print 'ת�˳ɹ�'
		commit transaction
	end

print '�˻���ʣ�����'
select * from bank_test
go


--ʹ��try catchд��
begin  try
     begin tran   --����
      --�������˻��м�ȥ1000
     update bank_test set money=money-800 where name='����'
     --�������˻�����1000
     update bank_test set money=money+800 where name='����'
     commit tran    --�ύ
     print '�ύ����';
end try
begin catch
     rollback tran   --�ع�
     print '�����쳣';
end catch






