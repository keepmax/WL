create table my_employees(
	Id int,
	First_name varchar(10),
	Last_name varchar(10),
	Userid varchar(10),
	Salary decimal(10,2) 
);

create table users(
	id int,
	userid varchar(10),
	department_id int
);

create table dept(
	id int identity(10,10) primary key,
	name varchar(10)
);

--insert��������
insert into dept(name)
values('dpt110');

insert into users(id,userid,department_id)
select 1,'Rpatel',10 union
select 2,'Bdancs',10 union
select 3,'Bbiri',20 union
select 4,'Cnewman',30 union
select 5,'Aropebur',40;

insert into my_employees
select 1,'patel','Ralph','Rpatel',895 union
select 2,'Dancs','Betty','Bdancs',860 union
select 3,'Biri','Ben','Bbiri',1100 union
select 4,'Newman','Chad','Cnewman',750 union
select 5,'Ropeburn','Audrey','Aropebur',1550;

--update�޸�����
update my_employees
set Last_name = 'drelxer' where Id = 3;

--update�޸�����
update my_employees
set Salary = 1000 where Salary < 900;

--alter table my_employees
--alter column Userid varchar(10)not null;
--alter table my_employees
--add constraint PK_my_employees_Userid primary key(Userid);

delete from my_employees
where Userid = 'Bbiri';

insert into my_employees
select 3,'Biri','Ben','Bbiri',1100;

alter table users
drop constraint FK__users__departmen__5BE2A6F2;


alter table users
alter column id int not null;
alter table users
add constraint PK_ur_id primary key(id);
alter table users
drop constraint PK_ur_id;

alter table my_employees
alter column id int not null;
alter table my_employees
add constraint PK_id primary key(Id);


alter table my_employees
drop constraint FK_myemployees;

alter table my_employees
add constraint FK_myemployees foreign key(Userid) references users(userid)on delete cascade;

alter table users
drop constraint FK_dptid_users;
alter table users
add constraint FK_dptid_users foreign key(department_id) references dept(id);

delete from my_employees where Userid = 'Aropebur' 

delete from users where Userid = 'Bdancs' 


--��ѯнˮ����100������Ա��,��ָ������
select Id as'���',First_name '��',Last_name '��',Userid '�û��ǳ�','нˮ' = Salary from my_employees 
where Salary > 1000;

--��ѯB��ͷFirst_name��������
select * from my_employees
where First_name like 'B%';

--��ѯB��βFirst_name��������
select * from my_employees
where First_name like '%B';

--��ѯнˮ��800��1000��������
select * from my_employees
where Salary between 800 and 1000;


--��ѯԱ������нˮ����������,��ͬ����id����
select * from my_employees
order by Salary desc,Id desc;

--��ѯ����Ա��ƽ������,����userid����,��ѯÿ����ƽ��н��������,�����800����������нˮ������
select AVG(Salary) from my_employees;
select * from dept;

select AVG(my_employees.Salary)'ƽ��нˮ',users.department_id '����' from my_employees,users
where my_employees.Userid = users.userid
group by users.department_id
--having AVG(my_employees.Salary) > 800
order by AVG(my_employees.Salary)desc;

truncate table dept
truncate table users
truncate table my_employees;

drop table dept
drop table users
drop table my_employees;
