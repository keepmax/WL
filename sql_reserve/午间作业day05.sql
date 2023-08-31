use MyDB;

--1. 查询工资大于 1200 的员工姓名和工资
select first_name,last_name,salary from s_emp
where salary > 1200;

--2. 查询员工号为 17 的员工的姓名和部门号和年薪
select first_name,last_name,dept_id,salary * 12 + ISNULL(commission_pct,0)*100 '年薪'
from s_emp
where id = 17;

--3. 选择工资不在 500 到 1200 的员工的姓名和工资
select first_name,last_name,salary from s_emp
where salary < 500 or salary > 1200;

--4. 选择在 3 或 5 号部门工作的员工姓名和部门号
select first_name,last_name,dept_id from s_emp
where dept_id = 3 or dept_id = 5;

--5. 选择公司中没有管理者的员工姓名及 dept_id
select first_name,last_name,dept_id from s_emp
where manager_id is NULL;

--6. 选择公司中有奖金的员工姓名，工资
select first_name,last_name,salary from s_emp
where commission_pct is not NULL;

--7. 选择员工姓名的第三个字母是 a 的员工姓名
select first_name,last_name from s_emp
where first_name like '__a%' or last_name like '__a%';

--8. 选择姓名中有字母 a 和 e 的员工姓名
select first_name,last_name from s_emp
where first_name like '%a%' and first_name like '%e%'
	or last_name like '%a%' and last_name like '%e%';

--9. 显示出表 employees 表中 first_name 以 'e'结尾的员工信息
select * from s_emp
where first_name like '%e';

--10. 显示出表 employees 部门编号在 3-5 之间 的姓名、职位
select first_name,last_name,s_dept.[name] from s_emp,s_dept
where dept_id in (3,4,5) and s_emp.dept_id = s_dept.id;

--11. 显示出表 employees 的 manager_id 是 1,2,3 的员工姓名、职位
select first_name,last_name,s_dept.[name] from s_emp,s_dept
where manager_id in (1,2,3) and s_emp.dept_id = s_dept.id;

--1. 查询员工的姓名和部门号和年薪，按年薪降序 按姓名升序
select first_name,last_name,dept_id,salary*12 + ISNULL(commission_pct,0)*100 '年薪'
from s_emp
order by 年薪 desc,first_name asc

--2. 选择工资不在 800 到 1700 的员工的姓名和工资，按工资降序
select first_name,last_name,salary from s_emp
where salary not between 800 and 1700
order by salary desc;

--3. 查询first_name中包含 e 的员工信息，并先按first_name的字节数降序，再按部门号升序
select *,DATALENGTH(first_name) '字节数' from s_emp
where first_name like '%e%'
order by DATALENGTH(first_name) desc, dept_id asc;

--1. 显示系统时间(注：日期+时间)
select GETDATE();
--2. 查询员工号，姓名，工资，以及工资提高百分之 20%后的结果（new salary）
select userid,first_name,last_name,salary*1.2 new_salary from s_emp
--3. 将员工的姓名按首字母排序，并写出姓名的长度（length）
select first_name,last_name,len(first_name+last_name) '姓名长度' from s_emp
order by left(first_name,1) asc;
--4. 做一个查询，产生下面的结果
--<last_name> earns <salary> monthly but wants <salary*3>
select last_name +' earns '+ convert(varchar,salary) + ' monthly but wants ' + convert(varchar,salary*3) from s_emp;

--5.使用case when 实现工资大于2000，显示A，工资大于1500显示B，工资大于1000显示C，其他情况显示D
select userid,
	case 
		when salary>2000 Then 'A'
		when salary between 1500 and 2000 Then 'B'
		when salary > 1000 and salary < 1500 Then 'C'
	else 'D' 
	End as '薪水'
from s_emp;


--1. 查询各 dept_id 的员工工资的最大值，最小值，平均值，总和，并按 dept_id 升序
select max(salary)'最大',min(salary)'最小',avg(salary)'平均',sum(salary),dept_id from s_emp
group by dept_id
order by dept_id asc;
--2. 查询员工最高工资和最低工资的差距
select max(salary)-min(salary) '差距' from s_emp;
--3. 查询各个管理者手下员工的最低工资，其中最低工资不能低于 800，没有管理者的员工不计算在内
select min(salary) '最低工资' from s_emp e
group by manager_id
having min(salary)>800;

--4. 查询所有部门的编号，员工数量和工资平均值,并按平均工资降序
select dept_id,count(userid)'员工数量',avg(salary)'平均工资' from s_emp
group by dept_id
order by avg(salary) desc;

--5. 选择具有各个 dept_id 的员工人数
select manager_id,dept_id,count(*)'员工人数' from s_emp
where manager_id is not null
group by manager_id,dept_id
order by manager_id asc;


 
--七、连接查询
--1. 显示所有员工的姓名，部门号和部门名称。
select first_name,last_name,s_emp.dept_id,s_dept.[name] from s_emp,s_dept
where s_emp.dept_id = s_dept.id;
--2. 查询 3 号部门员工的 region_id
select userid,region_id from s_emp
inner join s_dept
on s_emp.dept_id = s_dept.id
where dept_id = 3;
--3. 选择在North America工作的员工的
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


--4. 查询每个部门的部门名、最高工资和最低工资
select [name],最高工资,最低工资 from s_dept
inner join (select max(salary)'最高工资',min(salary)'最低工资',dept_id
from s_emp
group by dept_id) tmp
on tmp.dept_id = s_dept.id;

select max(salary)'最高工资',min(salary)'最低工资',dept_id
from s_emp
group by dept_id;


--5. 查询每个区域的部门个数大于 2 的区域编号和名字
select s_region.id,s_region.[name] from s_region
inner join (
	select count(id)'数量',region_id from s_dept
	group by region_id
	having count(id) > 2) tmp
on tmp.region_id = s_region.id;

select count(id)'数量',region_id from s_dept
group by region_id
having count(id) > 2;


--6. 选择指定员工的姓名，员工号，以及他的管理者的姓名和员工号，结果类似于下面的格式
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



--7.查询哪个区域没有部门
select * from s_region
where s_region.id not in (
	select region_id 'id' from 
	(
		select count(id) '数量',region_id from s_dept
		group by region_id
	) tmp
);

select region_id from 
(
	select count(id) '数量',region_id from s_dept
	group by region_id
) tmp;

select count(id) '数量',region_id from s_dept
group by region_id;

--8.查询部门名为 Finance 或 Sales 的员工信息
select * from s_emp
where dept_id in (
	select id from s_dept
	where [name] = 'Finance' or [name] = 'Sales'
);

select id from s_dept
where [name] = 'Finance' or [name] = 'Sales';

--八、其他
--1. 查询前5个工资最低的员工信息
--2. 查询平均工资最低的两个部门信息
--3. 查询平均工资最低的部门信息和该部门的平均工资
--4. 查询平均工资最高的 job 信息（按照title分组）
--5. 查询平均工资高于公司平均工资的部门有哪些?
--6. 查询出公司中所有 manager 的详细信息
--7. 各个部门中 最高工资中 最低的那个部门的 最低工资是多少
--8. 查询平均工资最高的部门的 manager 的详细信息: last_name, department_id, email, salary