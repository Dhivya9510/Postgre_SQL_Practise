/* Joins, Unions & Views */

CREATE TABLE Personal_Details (Student_Id Int,
                              Name varchar(20));
							   
insert into Personal_Details (Student_Id, Name)
Values (1001,'A'),(1002,'B'),(1003,'C'),(1004,'D');
       
select * from Personal_Details;
drop table Personal_Details;

CREATE TABLE Course_Details(Student_Id Int,
                           Department varchar(20));
insert into Course_Details(Student_Id, Department)
Values (1002,'English'),(1003,'Maths'),(1004,'Physics'),(1005,'Biology');
      
select * from Course_Details;
drop table Course_Details;

/* Inner Join */
select Personal_Details.Student_Id,Name, Course_Details.Student_Id, Department 
from Personal_Details inner join Course_Details on Personal_Details.Student_Id = Course_Details.Student_Id;

/* Left Join */
select Personal_Details.Student_Id, Name, Course_Details.Student_Id, Department
from Personal_Details left join Course_Details on Personal_Details.Student_Id = Course_Details.Student_Id;

/* Right Join */
select Personal_Details.Student_Id, Name, Course_Details.Student_Id, Department
from Personal_Details right join Course_Details on Personal_Details.Student_Id = Course_Details.Student_Id;

/* Full Join */
select Personal_Details.Student_Id, Name, Course_Details.Student_Id, Department
from Personal_Details full join Course_Details on Personal_Details.Student_Id = Course_Details.Student_Id;

/* Left only or Left outer Join */
select Personal_Details.Student_Id, Name, Course_Details.Student_Id, Department
from Personal_Details left outer join Course_Details on Personal_Details.Student_Id = Course_Details.Student_Id
where Course_Details.Student_Id is null;

/* Right Only or Right outer Join */
select Personal_Details.Student_Id, Name, Course_Details.Student_Id, Department
from Personal_Details right outer join Course_Details on Personal_Details.Student_Id = Course_Details.Student_Id
where Personal_Details.Student_Id is null;

/* Not Inner or Full outer Join */
select Personal_Details.Student_Id, Name, Course_Details.Student_Id, Department
from Personal_Details Full outer join Course_Details on Personal_Details.Student_Id = Course_Details.Student_Id
where Personal_Details.Student_Id is null or Course_Details.Student_Id is null;

/* Union */

create table Jan(Day int, Student_name varchar, Age int, Payment_mode varchar);
insert into Jan(Day,Student_name,Age,Payment_mode)
values(4,'Aa',19,'Bank'),(20,'Bb',18,'Credit'),(24,'Cc',23,'Cash');
Select * from Jan;
drop table Jan;

create table Feb(Day int, Student_name varchar, Age int, Payment_mode varchar);
insert into Feb(Day,Student_name,Age,Payment_mode)
values(14,'Dd',29,'Bank'),(20,'Ee',18,'Credit'),(24,'Ff',23,'Cash');
Select * from Feb;
drop table Feb;

Create table Mar(Day int, Student_name varchar, Age int, Payment_mode varchar);
insert into Mar(Day,Student_name,Age,Payment_mode)
values(24,'Gg',29,'Bank'),(28,'Hh',18,'Credit'),(13,'Ii',23,'Cash');
Select * from Mar;
drop table Mar;

Select * from Jan union select * from Feb union Select * from Mar;

Select * from Jan union select * from Feb union Select * from Mar order by Student_name;

/* To save the output of just previous above query, we can write the same query by adding another extension before */

Create table Students_record as Select * from Jan union select * from Feb union Select * from Mar order by Student_name;
select * from Students_record;

/* VIEW */
Create VIEW Students_record_view as Select *from Jan union select *from Feb union Select *from Mar order by Student_name;
select * from Students_record;


