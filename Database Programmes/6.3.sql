SQL> create table table4(no int,name varchar(10));

Table created.

SQL> create table table5(no int,name varchar(10));

Table created.

SQL> create or replace trigger tr1
  2  after insert on table4
  3  referencing new as newrow
  4  for each row when(newrow.no<=10)
  5  begin
  6  insert into table5 values(:newrow.no,:newrow.name);
  7  end tr1;
  8  /

Trigger created.

SQL> set serveroutput on
SQL> insert into table4 values(5,'rajesh');

1 row created.

SQL> insert into table4 values(13,'rejeev');

1 row created.

SQL> insert into table4 values(10,'rani');

1 row created.

SQL> select * from table4;

        NO NAME
---------- ----------
         5 rajesh
        13 rejeev
        10 rani

SQL> select * from table5;

        NO NAME
---------- ----------
         5 rajesh
        10 rani