create database companyDB on primary(
	name = 'cmp',
	filename = 'D:\createdata_test\cmp_data.mdf',
	size = 5mb,
	maxsize = 50mb,
	filegrowth = 1mb
);

use companyDB
create table dept1(
	id int not null, 
	dname varchar(25) not null
);

use companyDB
alter table dept1
add constraint PK_id_dept1 primary key(id);

use companyDB
create table emp5(
	id int identity(1,1) not null primary key,
	First_name varchar(25),
	Last_name varchar(25),
	Dept_id int references dept1(id) on delete set NULL on update cascade
);

use companyDB
select * from dept1 ;

use companyDB
alter table dept1
add constraint UQ_dname_dept1 unique(dname);

use companyDB
alter table emp5
alter column Last_name varchar(50);

use companyDB
alter table emp5
add constraint DF_Last_name_emp5 default 'Á¿' for Last_name;

select * from sys.default_constraints;

use companyDB
alter table emp5
add constraint CK_First_name_emp5 check(LEN(First_name) <= 10 and LEN(First_name)>=1);

use companyDB
drop table emp5;

use companyDB
alter table emp5 
drop constraint PK__emp5__3213E83FFF4599C2;

use companyDB
alter table emp5
drop constraint FK__emp5__Dept_id__3C69FB99;

use companyDB
alter table emp5
drop column Dept_id;

drop database companyDB;