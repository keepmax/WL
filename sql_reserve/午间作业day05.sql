use MyDB;

--1. ��ѯ���ʴ��� 1200 ��Ա�������͹���
select first_name,last_name,salary from s_emp
where salary > 1200;

--2. ��ѯԱ����Ϊ 17 ��Ա���������Ͳ��źź���н
select first_name,last_name,dept_id,salary * 12 + ISNULL(commission_pct,0)*100 '��н'
from s_emp
where id = 17;

--3. ѡ���ʲ��� 500 �� 1200 ��Ա���������͹���
select first_name,last_name,salary from s_emp
where salary < 500 or salary > 1200;

--4. ѡ���� 3 �� 5 �Ų��Ź�����Ա�������Ͳ��ź�
select first_name,last_name,dept_id from s_emp
where dept_id = 3 or dept_id = 5;

--5. ѡ��˾��û�й����ߵ�Ա�������� dept_id
select first_name,last_name,dept_id from s_emp
where manager_id is NULL;

--6. ѡ��˾���н����Ա������������
select first_name,last_name,salary from s_emp
where commission_pct is not NULL;

--7. ѡ��Ա�������ĵ�������ĸ�� a ��Ա������
select first_name,last_name from s_emp
where first_name like '__a%' or last_name like '__a%';

--8. ѡ������������ĸ a �� e ��Ա������
select first_name,last_name from s_emp
where first_name like '%a%' and first_name like '%e%'
	or last_name like '%a%' and last_name like '%e%';

--9. ��ʾ���� employees ���� first_name �� 'e'��β��Ա����Ϣ
select * from s_emp
where first_name like '%e';

--10. ��ʾ���� employees ���ű���� 3-5 ֮�� ��������ְλ
select first_name,last_name,s_dept.[name] from s_emp,s_dept
where dept_id in (3,4,5) and s_emp.dept_id = s_dept.id;

--11. ��ʾ���� employees �� manager_id �� 1,2,3 ��Ա��������ְλ
select first_name,last_name,s_dept.[name] from s_emp,s_dept
where manager_id in (1,2,3) and s_emp.dept_id = s_dept.id;

--1. ��ѯԱ���������Ͳ��źź���н������н���� ����������
select first_name,last_name,dept_id,salary*12 + ISNULL(commission_pct,0)*100 '��н'
from s_emp
order by ��н desc,first_name asc

--2. ѡ���ʲ��� 800 �� 1700 ��Ա���������͹��ʣ������ʽ���
select first_name,last_name,salary from s_emp
where salary not between 800 and 1700
order by salary desc;

--3. ��ѯfirst_name�а��� e ��Ա����Ϣ�����Ȱ�first_name���ֽ��������ٰ����ź�����
select *,DATALENGTH(first_name) '�ֽ���' from s_emp
where first_name like '%e%'
order by DATALENGTH(first_name) desc, dept_id asc;

--1. ��ʾϵͳʱ��(ע������+ʱ��)
select GETDATE();
--2. ��ѯԱ���ţ����������ʣ��Լ�������߰ٷ�֮ 20%��Ľ����new salary��
select userid,first_name,last_name,salary*1.2 new_salary from s_emp
--3. ��Ա��������������ĸ���򣬲�д�������ĳ��ȣ�length��
select first_name,last_name,len(first_name+last_name) '��������' from s_emp
order by left(first_name,1) asc;
--4. ��һ����ѯ����������Ľ��
--<last_name> earns <salary> monthly but wants <salary*3>
select last_name +' earns '+ convert(varchar,salary) + ' monthly but wants ' + convert(varchar,salary*3) from s_emp;

--5.ʹ��case when ʵ�ֹ��ʴ���2000����ʾA�����ʴ���1500��ʾB�����ʴ���1000��ʾC�����������ʾD
select userid,
	case 
		when salary>2000 Then 'A'
		when salary between 1500 and 2000 Then 'B'
		when salary > 1000 and salary < 1500 Then 'C'
	else 'D' 
	End as 'нˮ'
from s_emp;


--1. ��ѯ�� dept_id ��Ա�����ʵ����ֵ����Сֵ��ƽ��ֵ���ܺͣ����� dept_id ����
select max(salary)'���',min(salary)'��С',avg(salary)'ƽ��',sum(salary),dept_id from s_emp
group by dept_id
order by dept_id asc;
--2. ��ѯԱ����߹��ʺ���͹��ʵĲ��
select max(salary)-min(salary) '���' from s_emp;
--3. ��ѯ��������������Ա������͹��ʣ�������͹��ʲ��ܵ��� 800��û�й����ߵ�Ա������������
select min(salary) '��͹���' from s_emp e
group by manager_id
having min(salary)>800;

--4. ��ѯ���в��ŵı�ţ�Ա�������͹���ƽ��ֵ,����ƽ�����ʽ���
select dept_id,count(userid)'Ա������',avg(salary)'ƽ������' from s_emp
group by dept_id
order by avg(salary) desc;

--5. ѡ����и��� dept_id ��Ա������
select manager_id,dept_id,count(*)'Ա������' from s_emp
where manager_id is not null
group by manager_id,dept_id
order by manager_id asc;


 
--�ߡ����Ӳ�ѯ
--1. ��ʾ����Ա�������������źźͲ������ơ�
select first_name,last_name,s_emp.dept_id,s_dept.[name] from s_emp,s_dept
where s_emp.dept_id = s_dept.id;
--2. ��ѯ 3 �Ų���Ա���� region_id
select userid,region_id from s_emp
inner join s_dept
on s_emp.dept_id = s_dept.id
where dept_id = 3;
--3. ѡ����North America������Ա����
select * from s_emp
where dept_id in(
	select s_dept.id 'dept_id' from s_dept
	inner join s_region
	on s_dept.region_id = s_region.id
	where s_region.[name] = 'North America'
);

select s_dept.id from s_dept
inner join s_region
on s_dept.region_id = s_region.id
where s_region.[name] = 'North America';


--4. ��ѯÿ�����ŵĲ���������߹��ʺ���͹���
select [name],��߹���,��͹��� from s_dept
inner join (select max(salary)'��߹���',min(salary)'��͹���',dept_id
from s_emp
group by dept_id) tmp
on tmp.dept_id = s_dept.id;

select max(salary)'��߹���',min(salary)'��͹���',dept_id
from s_emp
group by dept_id;


--5. ��ѯÿ������Ĳ��Ÿ������� 2 �������ź�����
select s_region.id,s_region.[name] from s_region
inner join (
	select count(id)'����',region_id from s_dept
	group by region_id
	having count(id) > 2) tmp
on tmp.region_id = s_region.id;

select count(id)'����',region_id from s_dept
group by region_id
having count(id) > 2;


--6. ѡ��ָ��Ա����������Ա���ţ��Լ����Ĺ����ߵ�������Ա���ţ��������������ĸ�ʽ
  --employees  Emp   manager   Mgr
  --kochhar    101   king      100
select '--'+ first_name + '.' + last_name '--employees',
		s_emp.id 'Emp',
		tmp.userid  '--manager',
		Convert(varchar,tmp.id) '--Mgr' 
from s_emp
	inner join 
	(
		select id, userid from s_emp
		where id in
		(
			select distinct manager_id 
			from s_emp
			where manager_id is not null
		)
	) tmp
	on tmp.id = s_emp.manager_id;

select id, userid from s_emp
where id in
(
	select distinct manager_id 
	from s_emp
	where manager_id is not null
);

select distinct manager_id from s_emp
where manager_id is not null;



--7.��ѯ�ĸ�����û�в���
select * from s_region
where s_region.id not in (
	select region_id 'id' from 
	(
		select count(id) '����',region_id from s_dept
		group by region_id
	) tmp
);

select region_id from 
(
	select count(id) '����',region_id from s_dept
	group by region_id
) tmp;

select count(id) '����',region_id from s_dept
group by region_id;

--8.��ѯ������Ϊ Finance �� Sales ��Ա����Ϣ
select * from s_emp
where dept_id in (
	select id from s_dept
	where [name] = 'Finance' or [name] = 'Sales'
);

select id from s_dept
where [name] = 'Finance' or [name] = 'Sales';

--�ˡ�����
--1. ��ѯǰ5��������͵�Ա����Ϣ
--2. ��ѯƽ��������͵�����������Ϣ
--3. ��ѯƽ��������͵Ĳ�����Ϣ�͸ò��ŵ�ƽ������
--4. ��ѯƽ��������ߵ� job ��Ϣ������title���飩
--5. ��ѯƽ�����ʸ��ڹ�˾ƽ�����ʵĲ�������Щ?
--6. ��ѯ����˾������ manager ����ϸ��Ϣ
--7. ���������� ��߹����� ��͵��Ǹ����ŵ� ��͹����Ƕ���
--8. ��ѯƽ��������ߵĲ��ŵ� manager ����ϸ��Ϣ: last_name, department_id, email, salary