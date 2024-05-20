CREATE TABLE Students_Mark(Id serial primary key,
						  Student_name varchar,
						  Student_marks Int);
insert into Students_Mark(Student_name, Student_marks)
values('Jaya',32),('Sheela',55),('Anu',97),('Karthik',79),
      ('Mohammed',48),('Selva',64),('Venkat',85);
	  
select * from Students_Mark;

/* Q1: I want to know - Who are all the students whose marks are greater than 35 and less than 60? */
select * from Students_Mark where Student_marks > 35 and Student_marks < 60;

/* Q2: Who are all the students whose marks are lesser than or equal to 35 and greater than or equal to  60? */
select * from Students_Mark where Student_marks <= 35 and Student_marks >= 60;

/* Q3: Who are all the students whose marks are lesser than or equal to 35 or greater than or equal to  60? */
select * from Students_Mark where Student_marks <= 35 or Student_marks >= 60;

/* Now we are going to write SUBQUERY */
/* Table name is 'Students_marks' one of the field name also kind of same. To avoid confusion, first we will change the field name */

alter table Students_Mark rename column Student_marks to Marks;
select * from Students_Mark;

/* SQL always executes step by step from the inner most query */
/* It will always better to write query inside on the exclusion of the data what we need and should write 'NOT IN' clause in the before query */

select * from Students_Mark where Marks not in 
(select Marks from Students_Mark where Marks <= 35 or Marks >= 60);



create table School(Id int primary key,
				   Name varchar);
insert into School(Id,Name) values (1,'English'),(2,'Maths');
select * from School;

Create table School2(Id serial primary key,
					Name varchar,
					Donation real,
					Department_id int,
					foreign key (Department_id) references School(Id));
insert into School2(Name,Donation,Department_id)
values('Anu',70000,1),('Arun',90000,2),('Selvi',75000,2),('Keethana',92000,1),('Malar',74000,1);
select * from School2;
drop table School2;

insert into School2(Name,Donation,Department_id)
values('Arul',86000,1),('Saatha',74000,2);     

/* What are the  names of the students whose Donation is less than the overall average donation */

select Name, Donation from School2 where Donation < (select avg(Donation) as average_donation from School2);

/* Among all of the students, which one gets the highest donation  (by using sub-query & Groupby function) */
  
Select Name, Donation from School2 where Donation = (select max(Donation) from School2);

     /* Highest donation received student belongs to which department? */ 
select Department_Id, max(Donation) from School2 group by Department_id;

/* The below one is little tricky - Understand it well.
we need the 'name' of the department_id that was defined in the table 'School'. 
Here we going to join table 'School' & 'School2' */

Select Department_Id, School.Name, max(Donation) from School2 
inner join School on School2.Department_Id = School.Id group by Department_Id, School.Name;

/* Now we going to use SUB-Query for the above question.
Which student in which department gets the highest donation. 
Want the answer along with the department name. */

select Department_Id, School.Name, School2.Name, Donation from School2 
inner join School on School2.Department_Id = School.Id 
where (Department_Id,Donation) in (select Department_Id, max(Donation) as Donation from School2 group by Department_Id);

/* What is the first highest Donation? */
select max(Donation) from School2;

/* What is the second highest Donation? */
select max(Donation) from School2 where Donation < (select max(Donation) from School2); 
     /* alternatively we can write as below */
select Donation as Second_Highest_Donation from School2 order by Donation desc limit 1 offset 1;
     /* Offset gives position to line number 1 as 0, line number 2 as 1...*/

/* What is the third highest Donation? */
select Donation as Third_Highest_Donation from School2 order by Donation desc limit 1 offset 2;
	 
/*  TRIGGERS TRIGGERS  TRIGGERS  TRIGGERS  TRIGGERS  TRIGGERS  TRIGGERS  TRIGGERS  TRIGGERS  TRIGGERS */

create table sales_data(cust_name varchar not null,
					   product_name varchar not null,
					   sales real not null,
					   quantity real not null,
					   total_price real);
					   
/* Total price is the product of Sales and Quantity; however SQL does not know this. 
   We have to create a PROCEDURE for this. */

insert into sales_data values('Jenny','Cupboard',1000.00,5),
                             ('Deepa','Cot',7000.00,2);

		
select * from sales_data;
drop table sales_data;

/* creating PROCEDURE */

create function calc_total_price()
returns Trigger
as $$
declare
 total numeric;
begin 
 total = new.sales * new.quantity;
 return new;
end;
 $$ language plpgsql;
 
/* Example: Now the Gun is set up to shoot as per the Procedure instructed to it.
   We need to press the trigger to release the bullets. For that we need to write a command */
   
create trigger calc_sum_insert
before insert
on sales_data
for each row
execute procedure calc_total_price();

insert into sales_data values ('Mani','Study_table',3000.00,3),
							 ('Geetha','Dressing_cupboard',5000.00,4);
insert into sales_data values ('Hari','Cup_board',4500.00,2),
							 ('Dhivya','Interior_Decoration',2400.00,5);

/*Note: reference line number 115 - you should always mention as 'new' when you do 'insert' or 'update' or any other functions instead 'delete'.
  For 'delete' you should use 'old' instead on 'new', because you do change in already existing data*/
 




