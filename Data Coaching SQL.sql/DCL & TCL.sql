/* DDL Commands - CREATE, ALTER, DROP & TRUNCATE */
/* DML Commands - INSERT, UPDATE & DELETE */
/* DQL Commands - SELECT */
/* DCL Commands - GRANT & REVOKE */
/* TCL Commands - BEGIN, ROLL BACK & COMMIT */

create user Dhivya password '0987654321';

select * from feb;

grant select on students_record to Dhivya;
grant update on students_record to Dhivya;
grant insert on students_record to Dhivya;
grant delete on students_record to Dhivya;
grant all on students_record to Dhivya;

revoke all on students_record from Dhivya;

update students_record set Department = 'English' where Name = 'Mohan Ram';

drop user Dhivya;

/* TCL Commands - BEGIN, ROLL BACK & COMMIT */

    /* Every time you write and run the query - It is known as Transaction. 															
	   'ROLL BACK' in SQL is similar to 'UNDO' function in Excel.															
		We need to instruct SQL TO KEEP RECORDS OF WHAT WE ARE DOING IN DATABASE.
		SO THAT IT CAN BE ABLE TO PROVIDE US BACK THE DELETED THING (Like Undo in Excel).															
		Here 'BEGIN' MEANS 'START TO RECORD MY TRANSACTIONS'.															
	   'LIKE' clause is also known as 'Wildcard Match'. Example below 
	    'COMMIT' IS USED WHEN WE INSTRUCT SQL TO STOP RECORD TRANSACTIONS.
		Only we can use TCL commands in DML command that is 'Insert','Update' & 'Delete'*/
	   
BEGIN;
ROLLBACK;
COMMIT;

delete from students_record where name = 'Keethi Vijay';
delete from students_record where name like 'a%';  

    /* meaning that get all the names starting with 'a%',
       ('%' here means 'any number of following characters' might be there after 'a') */
	   
	 
