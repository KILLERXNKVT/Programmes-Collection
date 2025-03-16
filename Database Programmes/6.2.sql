SQL> select * from employee;

     EMPID EMPNAME
---------- ------------
     20765 Sam
     20766 Pooja
     20767 Abhirami
     20768 Richu
     20769 Ajo
     20764 Ram

6 rows selected.

SQL> create table manager(managerid int,mname varchar(12));

Table created.

SQL> create or replace trigger tr2
  2  after update on manager
  3  referencing new as newrow
  4  for each row when (newrow.managerid<=50)
  5  begin
  6  insert into employee values
  7  (:newrow.managerid,:newrow.mname);
  8  end tr2;
  9  /

Trigger created.

SQL> insert into manager values (10,'suhana');

1 row created.

SQL> insert into manager values (11,'don');

1 row created.

SQL> insert into manager values (12,'deepak');

1 row created.

SQL> select * from employee;

     EMPID EMPNAME
---------- ------------
     20765 Sam
     20766 Pooja
     20767 Abhirami
     20768 Richu
     20769 Ajo
     20764 Ram

6 rows selected.

SQL> select * from manager;

 MANAGERID MNAME
---------- ------------
        10 suhana
        11 don
        12 deepak

SQL> set serveroutput on
SQL> update manager set managerid = 34 where mname='don';

1 row updated.

SQL> update manager set managerid = 54 where mname='deepak';

1 row updated.

SQL> select * from manager;

 MANAGERID MNAME
---------- ------------
        10 suhana
        34 don
        54 deepak

SQL> select * from employee;

     EMPID EMPNAME
---------- ------------
     20765 Sam
     20766 Pooja
     20767 Abhirami
     20768 Richu
     20769 Ajo
     20764 Ram
        34 don

7 rows selected.