create database MyDB3;
use MyDB3;

DROP TABLE IF EXISTS  s_dept;
CREATE TABLE s_dept
(
	id  int identity(1,1) PRIMARY KEY,
  name  VARCHAR(25) NOT NULL,
  region_id  int
);

INSERT INTO s_dept VALUES (
    'Finance', 1);
INSERT INTO s_dept VALUES (
    'Sales', 1);
INSERT INTO s_dept VALUES (
    'Sales', 2);
INSERT INTO s_dept VALUES (
    'Sales', 3);
INSERT INTO s_dept VALUES (
    'Sales', 4);
INSERT INTO s_dept VALUES (
    'Sales', 5);
INSERT INTO s_dept VALUES (
    'Operations', 1);
INSERT INTO s_dept VALUES (
    'Operations', 2);
INSERT INTO s_dept VALUES (
    'Operations', 3);
INSERT INTO s_dept VALUES (
    'Operations', 4);
INSERT INTO s_dept VALUES (
    'Operations', 5);
INSERT INTO s_dept VALUES (
    'Administration', 1);

DROP TABLE IF EXISTS  s_emp;
CREATE TABLE s_emp
(
 id int  identity(1,1) PRIMARY KEY ,
 last_name  VARCHAR(25) NOT NULL,
 first_name                 VARCHAR(25),
 userid                     VARCHAR(8),
 start_date                 DATETIME,
 comments                   VARCHAR(255),
 manager_id                 int,
 title                      VARCHAR(25),
 dept_id                    int,
 salary                     float,
 commission_pct             float
);

INSERT INTO s_emp VALUES (
   'Velasquez', 'Carmen', 'cvelasqu',
   '1990-05-03', NULL, NULL, 'President',
   5, 2500, NULL);
   
INSERT INTO s_emp VALUES (
    'Ngao', 'LaDoris', 'lngao',
   '1990-05-08', NULL, 1, 'VP, Operations',
   4, 1450, NULL);
   
INSERT INTO s_emp VALUES (
    'Nagayama', 'Midori', 'mnagayam',
   '1991-1-17', NULL, 1, 'VP, Sales',
   3, 1400, NULL);
   
INSERT INTO s_emp VALUES (
    'Quick-To-See', 'Mark', 'mquickto',
   '1990-06-07', NULL, 1, 'VP, Finance',
   1, 1450, NULL);
   
INSERT INTO s_emp VALUES (
    'Ropeburn', 'Audry', 'aropebur',
   '1990-05-04', NULL, 1, 'VP, Administration',
   5, 1550, NULL);
   
INSERT INTO s_emp VALUES (
    'Urguhart', 'Molly', 'murguhar',
   '1991-01-18', NULL, 2, 'Warehouse Manager',
   4, 1200, NULL);
   
INSERT INTO s_emp VALUES (
    'Menchu', 'Roberta', 'rmenchu',
   '1990-05-14', NULL, 2, 'Warehouse Manager',
   4, 1250, NULL);
   
INSERT INTO s_emp VALUES (
    'Biri', 'Ben', 'bbiri',
   '1990-06-07', NULL, 2, 'Warehouse Manager',
   4, 1100, NULL);
   
INSERT INTO s_emp VALUES (
    'Catchpole', 'Antoinette', 'acatchpo',
   '1992-02-09', NULL, 2, 'Warehouse Manager',
   4, 1300, NULL);
   
INSERT INTO s_emp VALUES (
    'Havel', 'Marta', 'mhavel',
   '1991-02-27', NULL, 2, 'Warehouse Manager',
   4, 1307, NULL);
   
INSERT INTO s_emp VALUES (
    'Magee', 'Colin', 'cmagee',
   '1990-04-14', NULL, 3, 'Sales Representative',
   3, 1400, 10);
   
INSERT INTO s_emp VALUES (
    'Giljum', 'Henry', 'hgiljum',
   '1992-01-18', NULL, 3, 'Sales Representative',
   3, 1490, 12.5);
   
INSERT INTO s_emp VALUES (
    'Sedeghi', 'Yasmin', 'ysedeghi',
   '1991-02-18', NULL, 3, 'Sales Representative',
   3, 1515, 10);
   
INSERT INTO s_emp VALUES (
   'Nguyen', 'Mai', 'mnguyen',
   '1992-01-22', NULL, 3, 'Sales Representative',
   3, 1525, 15);
   
INSERT INTO s_emp VALUES (
    'Dumas', 'Andre', 'adumas',
   '1991-10-09', NULL, 3, 'Sales Representative',
   3, 1450, 17.5);
   
INSERT INTO s_emp VALUES (
    'Maduro', 'Elena', 'emaduro',
   '1992-02-07', NULL, 6, 'Stock Clerk',
   4, 1400, NULL);
   
INSERT INTO s_emp VALUES (
    'Smith', 'George', 'gsmith',
   '1990-05-08', NULL, 6, 'Stock Clerk',
   4, 940, NULL);
   
INSERT INTO s_emp VALUES (
    'Nozaki', 'Akira', 'anozaki',
   '1991-02-09', NULL, 7, 'Stock Clerk',
   4, 1200, NULL);
   
INSERT INTO s_emp VALUES (
    'Patel', 'Vikram', 'vpatel',
   '1991-08-06', NULL, 7, 'Stock Clerk',
   4, 795, NULL);
   
INSERT INTO s_emp VALUES (
    'Newman', 'Chad', 'cnewman',
   '1991-01-21', NULL, 8, 'Stock Clerk',
   3, 750, NULL);
   
INSERT INTO s_emp VALUES (
    'Markarian', 'Alexander', 'amarkari',
   '1991-04-26', NULL, 8, 'Stock Clerk',
   3, 850, NULL);
   
INSERT INTO s_emp VALUES (
    'Chang', 'Eddie', 'echang',
   '1990-11-30', NULL, 9, 'Stock Clerk',
   4, 800, NULL);
   
INSERT INTO s_emp VALUES (
    'Patel', 'Radha', 'rpatel',
   '1990-10-17', NULL, 9, 'Stock Clerk',
   3, 795, NULL);
   
INSERT INTO s_emp VALUES (
    'Dancs', 'Bela', 'bdancs',
   '1991-05-17', NULL, 10, 'Stock Clerk',
   4, 860, NULL);
   
INSERT INTO s_emp VALUES (
    'Schwartz', 'Sylvie', 'sschwart',
   '1991-04-09', NULL, 10, 'Stock Clerk',
   4, 1100, NULL);


DROP TABLE IF EXISTS s_region;
CREATE TABLE s_region
(
   id   int identity(1,1) PRIMARY KEY,
   name VARCHAR(50)
);


INSERT INTO s_region VALUES (
    'North America');
INSERT INTO s_region VALUES (
    'South America');
INSERT INTO s_region VALUES (
   'Africa / Middle East');
INSERT INTO s_region VALUES (
   'Asia');
INSERT INTO s_region VALUES (
   'Europe');

DROP TABLE IF EXISTS  s_title;
CREATE TABLE s_title
(
   title   VARCHAR(25) NOT NULL,
   PRIMARY KEY (title) 
);

INSERT INTO s_title VALUES ('President');
INSERT INTO s_title VALUES ('Sales Representative');
INSERT INTO s_title VALUES ('Stock Clerk');
INSERT INTO s_title VALUES ('VP, Administration');
INSERT INTO s_title VALUES ('VP, Finance');
INSERT INTO s_title VALUES ('VP, Operations');
INSERT INTO s_title VALUES ('VP, Sales');
INSERT INTO s_title VALUES ('Warehouse Manager');

ALTER TABLE s_dept
   ADD CONSTRAINT s_dept_region_id_fk
   FOREIGN KEY (region_id) REFERENCES s_region (id);
ALTER TABLE s_emp
   ADD CONSTRAINT s_emp_manager_id_fk
   FOREIGN KEY (manager_id) REFERENCES s_emp (id);
ALTER TABLE s_emp
   ADD CONSTRAINT s_emp_dept_id_fk
   FOREIGN KEY (dept_id) REFERENCES s_dept (id);

select * from s_emp;
select * from s_dept;
select * from s_region;
