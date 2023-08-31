select * from s_dept;


--1. 查询和 Zlotkey 相同部门的员工姓名和工资
select first_name '姓', last_name '名',salary,dept_id '部门号'
from s_emp
where dept_id in(
	select dept_id from s_emp
	where userid = 'rmenchu'
);
--2. 查询工资比公司平均工资高的员工的员工号，姓名和工资。
select userid '员工号',first_name '姓', last_name '名',salary
from s_emp
where salary > (
	select AVG(salary) from s_emp
);
select AVG(salary) from s_emp;

--3. 查询各部门中工资比本部门平均工资高的员工的员工号, 姓名和工资
select userid,first_name '姓', last_name '名',salary,tmp.平均工资,e.dept_id
from s_emp e
inner join (
	select AVG(salary) '平均工资',dept_id
	from s_emp
	group by dept_id
) tmp on e.dept_id = tmp.dept_id
where e.salary > tmp.平均工资;

--4. 查询和姓名中包含字母 u 的员工在相同部门的员工的员工号和姓名
select userid ,first_name '姓', last_name '名'
from s_emp
where dept_id in
(
	select dept_id
	from s_emp
	where first_name like '%u' or first_name like '%u%' or first_name like 'u%'
		or last_name like '%u' or last_name like '%u%' or last_name like 'u%'
) and first_name not in
(select first_name from s_emp where first_name like '%u' or first_name like '%u%' or first_name like 'u%') 
and last_name not in
(select last_name from s_emp where last_name like '%u' or last_name like '%u%' or last_name like 'u%');

--5. 查询在部门的 location_id 为 1700 的部门工作的员工的员工号
select

select id from s_dept d
where d.region_id = 4;


select AVG(salary),dept_id
from s_emp
group by dept_id;

