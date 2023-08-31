use MyDB;

-- 1.len返回的是字符数，只会计算字符串左边的空格，字符串右边的空格不参与计算
-- 2.datalength返回是字节数，注意点是非unicode编码下，一个英文占1个字节，一个中文占两个字节
--                                  unicode编码下，英文和中午都占两个字节
-- sqlserver中，nchar nvarchar都是unicode编码；char varchar都是非unicode编码
select LEN('abc你好'),DATALENGTH('abc你好');



select LEN(sname),DATALENGTH(sname) from student where sno = 20;

-- 3.charindex(要查找的字符串，原始字符串，查找的位置),会返回指定字符串出现的位置信息，注意点是这个位置是从1开始算的
select CHARINDEX('wor','hello world',0);

-- 查找姓名以x开头的学生
select * from student where CHARINDEX('x',sname) = 1;

-- 4.lower 和 upper
select UPPER(sname) from student where sno = 12;
select LOWER(sname) from student where sno = 12;

-- 5.ltrim rtrim trim : 去除首尾空格
--select LEN('   abc   '),LEN(TRIM('   abc   '));
select LEN('   abc   '),LEN(RTRIM('   abc   '));


--6 LEFT() 从左边开始获取几个字符
--RIGHT() 从右边开始获取几个字符
--SUBSTRING() 从指定的位置开始截取指定长度的字符串
select LEFT('abc',2);
select RIGHT('abc',2);
select SUBSTRING('abcdefg',2,3);

-- 查找姓名以x开头的学生
select * from student where left(sname,1) = 'x';

--7.replace ： 替换字符串
select REPLACE('无锡极客营软件实训基地','极客营','igeek');
update student set semail = replace(semail,'qq','igeek');

select * from student;

--8.STUFF ： 删除  替换  新增
select STUFF('无锡极客营软件实训基地',3,3,'');  --删除
select STUFF('无锡极客营软件实训基地',3,3,'igeek');  --替换
select STUFF('无锡极客营软件实训基地',3,0,'igeek'); --新增

--9.patindex ：返回字符串中指定的子串出现的开始位置  子串前后必须带% 
select patindex('%bc%','abcabc');

--10.将指定字符串重复4次后生成的字符串
select replicate('abc',4) --abcabcabcabc

--11.字符串反转
select reverse('abc');

--12.将数字转化成字符串 STR(数字字符串, 数字的长度, 精度)
SELECT STR('123456.45', 9, 2);