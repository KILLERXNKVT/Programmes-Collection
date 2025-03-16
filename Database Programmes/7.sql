
SQL*Plus: Release 11.2.0.1.0 Production on Mon Jul 4 21:11:07 2022

Copyright (c) 1982, 2010, Oracle.  All rights reserved.

Enter user-name: system
Enter password:

Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options

SQL> create table employee (eno int,ename varchar(10),dname varchar(5),doj date,desig varchar(10));

Table created.

SQL> insert into employee values (&eno,'&ename','&dname','&doj','&desig');
Enter value for eno: 100
Enter value for ename: rajesh
Enter value for dname: mca
Enter value for doj: 25-may-22
Enter value for desig: lecturer
old   1: insert into employee values (&eno,'&ename','&dname','&doj','&desig')
new   1: insert into employee values (100,'rajesh','mca','25-may-22','lecturer')

1 row created.

SQL> /
Enter value for eno: 102
Enter value for ename: joy
Enter value for dname: me
Enter value for doj: 20-apr-22
Enter value for desig: lecturer
old   1: insert into employee values (&eno,'&ename','&dname','&doj','&desig')
new   1: insert into employee values (102,'joy','me','20-apr-22','lecturer')

1 row created.

SQL> /
Enter value for eno: 104
Enter value for ename: ranjith
Enter value for dname: ec
Enter value for doj: 12-jan-22
Enter value for desig: lecturer
old   1: insert into employee values (&eno,'&ename','&dname','&doj','&desig')
new   1: insert into employee values (104,'ranjith','ec','12-jan-22','lecturer')

1 row created.

SQL> /
Enter value for eno: 105
Enter value for ename: mable
Enter value for dname: cse
Enter value for doj: 12-jan-22
Enter value for desig: lecturer
old   1: insert into employee values (&eno,'&ename','&dname','&doj','&desig')
new   1: insert into employee values (105,'mable','cse','12-jan-22','lecturer')

1 row created.

SQL> select * from employee;

       ENO ENAME      DNAME DOJ       DESIG
---------- ---------- ----- --------- ----------
       100 rajesh     mca   25-MAY-22 lecturer
       102 joy        me    20-APR-22 lecturer
       104 ranjith    ec    12-JAN-22 lecturer
       105 mable      cse   12-JAN-22 lecturer

SQL> create or replace procedure des_ch(eid IN int)
  2  IS
  3  dt number;
  4  jd date;
  5  sd date;
  6  Begin
  7  select doj into jd from employee where eno=eid;
  8  select sysdate into sd from dual;
  9  dt:=months_between(sd,jd) / 12;
 10  if dt>=3 then
 11  update employee set desig='ass.prof' where eno=eid;
 12  dbms_output.put_line('Your designation changed');
 13  else
 14  dbms_output.put_line('you have to wait');
 15  end if;
 16  End des_ch;
 17  /

Procedure created.

SQL> set serveroutput on
SQL> execute des_ch(100);
you have to wait

PL/SQL procedure successfully completed.

SQL> INSERT into employee values(106,'justin','mca','25-jan-12','lecturer');

1 row created.

SQL> select * from employee;

       ENO ENAME      DNAME DOJ       DESIG
---------- ---------- ----- --------- ----------
       100 rajesh     mca   25-MAY-22 lecturer
       102 joy        me    20-APR-22 lecturer
       104 ranjith    ec    12-JAN-22 lecturer
       105 mable      cse   12-JAN-22 lecturer
       106 justin     mca   25-JAN-12 lecturer

SQL> set serveroutput on
SQL> execute des_ch(106);
Your designation changed

PL/SQL procedure successfully completed.

SQL> select * from employee;

       ENO ENAME      DNAME DOJ       DESIG
---------- ---------- ----- --------- ----------
       100 rajesh     mca   25-MAY-22 lecturer
       102 joy        me    20-APR-22 lecturer
       104 ranjith    ec    12-JAN-22 lecturer
       105 mable      cse   12-JAN-22 lecturer
       106 justin     mca   25-JAN-12 ass.prof
