select * from s_dept;


--1. ��ѯ�� Zlotkey ��ͬ���ŵ�Ա�������͹���
select first_name '��', last_name '��',salary,dept_id '���ź�'
from s_emp
where dept_id in(
	select dept_id from s_emp
	where userid = 'rmenchu'
);
--2. ��ѯ���ʱȹ�˾ƽ�����ʸߵ�Ա����Ա���ţ������͹��ʡ�
select userid 'Ա����',first_name '��', last_name '��',salary
from s_emp
where salary > (
	select AVG(salary) from s_emp
);
select AVG(salary) from s_emp;

--3. ��ѯ�������й��ʱȱ�����ƽ�����ʸߵ�Ա����Ա����, �����͹���
select userid,first_name '��', last_name '��',salary,tmp.ƽ������,e.dept_id
from s_emp e
inner join (
	select AVG(salary) 'ƽ������',dept_id
	from s_emp
	group by dept_id
) tmp on e.dept_id = tmp.dept_id
where e.salary > tmp.ƽ������;

--4. ��ѯ�������а�����ĸ u ��Ա������ͬ���ŵ�Ա����Ա���ź�����
select userid ,first_name '��', last_name '��'
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

--5. ��ѯ�ڲ��ŵ� location_id Ϊ 1700 �Ĳ��Ź�����Ա����Ա����
select

select id from s_dept d
where d.region_id = 4;


select AVG(salary),dept_id
from s_emp
group by dept_id;

