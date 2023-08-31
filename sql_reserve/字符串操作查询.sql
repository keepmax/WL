use MyDB;

-- 1.len���ص����ַ�����ֻ������ַ�����ߵĿո��ַ����ұߵĿո񲻲������
-- 2.datalength�������ֽ�����ע����Ƿ�unicode�����£�һ��Ӣ��ռ1���ֽڣ�һ������ռ�����ֽ�
--                                  unicode�����£�Ӣ�ĺ����綼ռ�����ֽ�
-- sqlserver�У�nchar nvarchar����unicode���룻char varchar���Ƿ�unicode����
select LEN('abc���'),DATALENGTH('abc���');



select LEN(sname),DATALENGTH(sname) from student where sno = 20;

-- 3.charindex(Ҫ���ҵ��ַ�����ԭʼ�ַ��������ҵ�λ��),�᷵��ָ���ַ������ֵ�λ����Ϣ��ע��������λ���Ǵ�1��ʼ���
select CHARINDEX('wor','hello world',0);

-- ����������x��ͷ��ѧ��
select * from student where CHARINDEX('x',sname) = 1;

-- 4.lower �� upper
select UPPER(sname) from student where sno = 12;
select LOWER(sname) from student where sno = 12;

-- 5.ltrim rtrim trim : ȥ����β�ո�
--select LEN('   abc   '),LEN(TRIM('   abc   '));
select LEN('   abc   '),LEN(RTRIM('   abc   '));


--6 LEFT() ����߿�ʼ��ȡ�����ַ�
--RIGHT() ���ұ߿�ʼ��ȡ�����ַ�
--SUBSTRING() ��ָ����λ�ÿ�ʼ��ȡָ�����ȵ��ַ���
select LEFT('abc',2);
select RIGHT('abc',2);
select SUBSTRING('abcdefg',2,3);

-- ����������x��ͷ��ѧ��
select * from student where left(sname,1) = 'x';

--7.replace �� �滻�ַ���
select REPLACE('��������Ӫ���ʵѵ����','����Ӫ','igeek');
update student set semail = replace(semail,'qq','igeek');

select * from student;

--8.STUFF �� ɾ��  �滻  ����
select STUFF('��������Ӫ���ʵѵ����',3,3,'');  --ɾ��
select STUFF('��������Ӫ���ʵѵ����',3,3,'igeek');  --�滻
select STUFF('��������Ӫ���ʵѵ����',3,0,'igeek'); --����

--9.patindex �������ַ�����ָ�����Ӵ����ֵĿ�ʼλ��  �Ӵ�ǰ������% 
select patindex('%bc%','abcabc');

--10.��ָ���ַ����ظ�4�κ����ɵ��ַ���
select replicate('abc',4) --abcabcabcabc

--11.�ַ�����ת
select reverse('abc');

--12.������ת�����ַ��� STR(�����ַ���, ���ֵĳ���, ����)
SELECT STR('123456.45', 9, 2);