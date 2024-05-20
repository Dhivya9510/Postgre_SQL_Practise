CREATE TABLE School(Id int,
	                first_name varchar(20) not null,
                    last_name varchar(20) not null,
					age int not null,
					course_enrolled varchar(20) not null default 'Maths',
					fees int not null,
                    PRIMARY KEY(Id));

insert into School(Id,first_name,last_name,age,fees)values(1,'Shree','Kumar',25,15000);
insert into School(Id,first_name,last_name,age,fees)values(2,'Shree','Kumar',25,15000);

Select * from School;
drop table School;



CREATE TABLE Med_Rep(first_name varchar(20) not null, 
					 last_name varchar(20) not null,
					 Salary int not null,
					primary key(first_name,last_name));
					 
insert into Med_Rep(first_name,last_name,Salary)
values('John','Eva',15000),('Henry','Paul',20000),('Charlie','Samuel',15000);

Select * from Med_Rep
drop table Med_Rep



create table email_id(first_name varchar(20), 
					  last_name varchar(20), 
					  email_id varchar(50) not null unique,
					  primary key (first_name,last_name));

insert into email_id values('Alexander','Roy','alex001_r@gmail.com');
insert into email_id values('Alex','Robert','robert001_a@gmail.com');
					  
select* from email_id
drop table email_id



CREATE TABLE Employee(Id serial primary key,
					 first_name varchar(20) not null,
					 last_name varchar(20) not null,
					 age int not null,
					 address varchar(20) not null default 'California',
					 dept varchar(20)not null);
					 
insert into Employee(first_name, last_name, age, dept)
values ('William','Thomas',34,'Physics'),
       ('Jackson','Eve',21,'Chemistry'),
	   ('Shirly','Smith',24,'English');
insert into Employee(first_name, last_name, age, dept)values('Mary','Martin',24,'Biology');
					 
select * from Employee
drop table Employee
delete from Employee where dept = 'Biology'

create table department(dept_name varchar(20) Primary key,
					   dept_hod varchar(20));
					   
insert into department(dept_name,dept_hod)
values ('Physics','Mathew'),
       ('Chemistry','Jenny'),
	   ('English','Rao');
	   select * from department
	   drop table department
       alter table Employee add foreign key (dept) references department (dept_name);
	   
	   
	   
	   
	   
CREATE TABLE Institute(Name varchar(20) not null,
					  Institute_name varchar default 'Zion Institute',
					  Age int not null,
					  check (age >=25));
					
insert into Institute (Name,Age) values ('Anitha',26), ('Angelina',25);
insert into Institute (Name,Age) values ('Preethi',28);
select * from Institute;
alter table Institute add column Location varchar(30) not null default 'Bangalore';
alter table Institute drop column Location;
alter table Institute alter column Name type varchar(50);
alter table Institute rename column Name to First_name;



CREATE TABLE Textile_shop(item_no int,
						 item_name varchar,
						 price numeric,
						 check (price > 0));
						 
insert into Textile_shop(item_no, item_name, price)
values (001,'Jeans',250.00),
       (002,'Shirt',400.00),
	   (003,'Dhothi',100.00);
	   
insert into Textile_shop(item_no, item_name, price)
values(004,'Sports_Wear',100.00),
	  (005,'Saree',300.00);
	  
select * from Textile_shop;
delete from Textile_shop where item_name = 'Shirt';
Truncate table Textile_shop;


	   
CREATE TABLE Workers(Roll_num serial primary key,
                    first_name varchar(20) not null,
					last_name varchar(20) not null,
					age int not null,
					location varchar(20) not null default 'Bangalore',
					Department varchar(20) not null);
					
alter table Workers add column Salary real not null;

insert into Workers(first_name, last_name, age, Department, Salary)values('Arun','Kumar',25,'Full_stack',25000.00);
insert into Workers (first_name, last_name, age, Department, Salary)
values('Yoga','Varshini',28,'Full_stack',30000.00),
      ('Saran','Kumar',35,'Frontend_developer',40000.00),
	  ('Yogesh','Bala',40,'Frontend_developer',45000.00);
	  
insert into Workers (first_name, last_name, age, location, Department, Salary)
values('Anu','Srinivas',26,'Tamilnadu','IT',42000.00),
      ('Akila','Venkat',35,'AP','IT',60000.00),
	  ('Keerthana','Srinivaasan',40,'AP','IT',44000.00),
	  ('Madhan','Kumar',56,'Tamilnadu','HR',47000.00);
select * from Workers;

Select location from Workers;
Select distinct location from Workers;

select department from Workers;
select count(department) from Workers;
select distinct department from Workers;
select count(distinct department) from Workers;


/* alias */

select count(distinct department) as num_of_dept from Workers;
	   

select first_name from Workers;
select first_name from Workers order by first_name;
select first_name from Workers order by first_name desc;

select first_name from Workers;
select first_name from Workers order by Age;
select first_name, age from Workers order by Age;
select first_name from Workers order by Age desc;
select first_name, age from Workers order by Age desc;
select first_name,age from Workers order by Age,first_name;
Select * from Workers order by Age, Salary desc;

select * from Workers limit 3;

select * from Workers order by Salary desc limit 3;
select * from Workers order by Age limit 5;

select *from Workers;
select Roll_num , first_name, last_name from Workers order by Roll_num limit 3 offset 3;