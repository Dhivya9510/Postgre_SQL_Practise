CREATE TABLE Student(Roll_num serial Primary key,
					Name varchar(20) not null,
					Department varchar(20) not null,
					Date_of_Joining timestamp not null default current_timestamp,
					Donation Real not null,
					Last_updated timestamp default now());
					
insert into Student (Name, Department, Donation)
values('Anu Krishna', 'English', 15000.00),
      ('Arun Vijay','Biology',20000.00),
	  ('Mohan Ram','Biology',35000.00);
insert into Student (Name, Department, Donation)
values('Raj Vikram', 'English', 15000.00),
      ('Bharathi Kannan','Biology',20000.00),
	  ('Vinay Rao','Biology',35000.00),
	  ('Krishnan Ravi','Biology',18000.00),
	  ('Ajay Kumar','English', 17000.00);

select * from Student;
Drop table Student;
					 
/* AGGREGATE FUNCTION */
SUM, AVERAGE, COUNT, MIN, MAX & DISTINCT COUNT. 

select * from Student;
select count(*) from Student;
select count(*) as num_of_students from Student;
select count (distinct Department) from Student;
select count (distinct Department) as num_of_department from Student;

select count(Name) from Student where Donation > 15000 and Donation < 20000;
select count(Name) from Student where Donation between 15000 and 20000;
select count(Name) from Student where Donation >= 15000 and Donation <= 20000;

select sum(Donation) from Student;
 select avg(Donation) from Student;
  select min(Donation) from Student;
   select max(Donation) from Student;
   
select Name, Donation from Student order by Donation limit 1;
select Name, Donation from Student order by Donation desc limit 1;

alter table Student add column Location varchar (20) not null default 'Chennai';

update Student set Location = 'Karnataka' where name in ('Arun Vijay', 'Mohan Ram');
update Student set Location = 'Delhi' where Roll_num = 7;

delete from Student where name = 'Vinay Rao';
select * from Student; 

insert into Student (Name, Department, Donation,Location)values('Vinay Rao','Biology',35000.00, 'Mumbai');

select * from Student order by Roll_num;

/* GROUP BY */
select Location, Count(*)as num_of_student from Student; 
select Location, count(*) as num_of_student from Student group by Location;

Select Location, Department , count (*) as num_of_students from Student group by Location, Department;
Select Location, Department, Count (*) as num_of_students from Student where Donation > 30000.00 group by Location, Department;

Select Location, count (*) as num_of_students from Student group by Location having count(*)>1;

Select Location, Count(*) as num_of_students from Student where Location = 'Chennai' group by Location;

Select Location, Count(*) as num_of_students from Student group by Location having Location = 'Chennai';