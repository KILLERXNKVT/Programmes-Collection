#6
(1)
-- create table --

create table employee(empid int,empname varchar(12));

Table created.


-- insert table --

insert into employee values(20764,'Ram');

1 row created.

SQL> insert into employee values(20765,'Sam');

1 row created.

SQL> insert into employee values(20766,'Pooja');

1 row created.

SQL> insert into employee values(20767,'Abhirami');

1 row created.

SQL> insert into employee values(20768,'Richu');

1 row created.

SQL> insert into employee values(20769,'Ajo');

1 row created.


-- select --

 select * from employee;

     EMPID EMPNAME
---------- ------------
     20764 Ram
     20765 Sam
     20766 Pooja
     20767 Abhirami
     20768 Richu
     20769 Ajo

6 rows selected.


-- source code --

create or replace trigger emply_trigg before delete on employee
for each row
Begin
raise_application_error(-20101,'Deletion not allowed on employee');
End;
/

Trigger created.


-- delete table --

SQL> DELETE from employee where empid=20768;
DELETE from employee where empid=20768
            *
ERROR at line 1:
ORA-20101: Deletion not allowed on employee
ORA-06512: at "SYSTEM.EMPLY_TRIGG", line 2
ORA-04088: error during execution of trigger 'SYSTEM.EMPLY_TRIGG'
