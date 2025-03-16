SQL> create table employee(empid int primary key,empname varchar(15),department varchar(10),contactno int,emailid varchar(20),empheadid int);

Table created.


SQL> desc table employee;
Usage: DESCRIBE [schema.]object[@db_link]
SQL> desc employee;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPID                                     NOT NULL NUMBER(38)
 EMPNAME                                            VARCHAR2(15)
 DEPARTMENT                                         VARCHAR2(10)
 CONTACTNO                                          NUMBER(38)
 EMAILID                                            VARCHAR2(20)
 EMPHEADID                                          NUMBER(38)

SQL> insert into employee values('&empid','&empname','&department','&contactno','&emailid','&empheadid');
Enter value for empid: 101
Enter value for empname: isha
Enter value for department: e-101
Enter value for contactno: 1234567890
Enter value for emailid: isha@gmail.com
Enter value for empheadid: 105
old   1: insert into employee values('&empid','&empname','&department','&contactno','&emailid','&empheadid')
new   1: insert into employee values('101','isha','e-101','1234567890','isha@gmail.com','105')

1 row created.

SQL> /
Enter value for empid: 102
Enter value for empname: priya
Enter value for department: e-104
Enter value for contactno: 1234567890
Enter value for emailid: priya@yahoo.com
Enter value for empheadid: 103
old   1: insert into employee values('&empid','&empname','&department','&contactno','&emailid','&empheadid')
new   1: insert into employee values('102','priya','e-104','1234567890','priya@yahoo.com','103')

1 row created.

SQL> /
Enter value for empid: 103
Enter value for empname: neha
Enter value for department: e-101
Enter value for contactno: 1234567890
Enter value for emailid: neha@gmail.com
Enter value for empheadid: 101
old   1: insert into employee values('&empid','&empname','&department','&contactno','&emailid','&empheadid')
new   1: insert into employee values('103','neha','e-101','123456890','neha@gmail.com','101')

1 row created.

SQL> /
Enter value for empid: 104
Enter value for empname: rahul
Enter value for department: e-102
Enter value for contactno: 1234567890
Enter value for emailid: rahul@yahoo.com
Enter value for empheadid: 105
old   1: insert into employee values('&empid','&empname','&department','&contactno','&emailid','&empheadid')
new   1: insert into employee values('104','rahul','e-102','1234567890','rahul@yahoo.com','105')

1 row created.

SQL> /
Enter value for empid: 105
Enter value for empname: abhishek
Enter value for department: e-101
Enter value for contactno: 1234567890
Enter value for emailid: abhishek@gmail.com
Enter value for empheadid: 102
old   1: insert into employee values('&empid','&empname','&department','&contactno','&emailid','&empheadid')
new   1: insert into employee values('105','abhishek','e-101','1234567890','abhishek@gmail.com','102')

1 row created.


SQL> select * from employee;

     EMPID EMPNAME         DEPARTMENT  CONTACTNO EMAILID              EMPHEADID
       
---------- --------------- ---------- ---------- -------------------- ----------
       101 isha            e-101      1234567890 isha@gmail.com           105
       102 priya           e-104      1234567890 priya@yahoo.com          103
       103 neha            e-101      1234567890 neha@gmail.com           101
       104 rahul           e-102      1234567890 rahul@yahoo.com          105
       105 abhishek        e-101      1234567890 abhishek@gmail.com       102



SQL> create table empdept(deptid varchar(10) primary key,deptname varchar(15),dept_off varchar(10),depthead int);

Table created.

SQL> insert into empdept values('&deptid','&deptname','&dept_off','&depthead');
Enter value for deptid: e-101
Enter value for deptname: hr
Enter value for dept_off: monday
Enter value for depthead: 105
old   1: insert into empdept values('&deptid','&deptname','&dept_off','&depthead')
new   1: insert into empdept values('e-101','hr','monday','105')

1 row created.

SQL> /
Enter value for deptid: e-102
Enter value for deptname: development
Enter value for dept_off: tuesday
Enter value for depthead: 101
old   1: insert into empdept values('&deptid','&deptname','&dept_off','&depthead')
new   1: insert into empdept values('e-102','development','tuesday','101')

1 row created.

SQL> /
Enter value for deptid: e-103
Enter value for deptname: housekeeping
Enter value for dept_off: saturday
Enter value for depthead: 103
old   1: insert into empdept values('&deptid','&deptname','&dept_off','&depthead')
new   1: insert into empdept values('e-103','housekeeping','saturday','103')

1 row created.

SQL> /
Enter value for deptid: e-104
Enter value for deptname: sales
Enter value for dept_off: sunday
Enter value for depthead: 104
old   1: insert into empdept values('&deptid','&deptname','&dept_off','&depthead')
new   1: insert into empdept values('e-104','sales','sunday','104')

1 row created.

SQL> /
Enter value for deptid: e-105
Enter value for deptname: purchase
Enter value for dept_off: tuesday
Enter value for depthead: 104
old   1: insert into empdept values('&deptid','&deptname','&dept_off','&depthead')
new   1: insert into empdept values('e-105','purchase','tuesday','104')

1 row created.

SQL> select * from empdept;

DEPTID     DEPTNAME        DEPT_OFF     DEPTHEAD
---------- --------------- ---------- ----------
e-101      hr              monday            105
e-102      development     tuesday           101
e-103      housekeeping    saturday          103
e-104      sales           sunday            104
e-105      purchase        tuesday           104




SQL> create table empsalary(empid int references employee(empid), salary int,ispermanent varchar(5));

Table created.

SQL> insert into empsalary values('&empid','&salary','&ispermanent');
Enter value for empid: 101
Enter value for salary: 2000
Enter value for ispermanent: yes
old   1: insert into empsalary values('&empid','&salary','&ispermanent')
new   1: insert into empsalary values('101','2000','yes')

1 row created.

SQL> /
Enter value for empid: 102
Enter value for salary: 10000
Enter value for ispermanent: yes
old   1: insert into empsalary values('&empid','&salary','&ispermanent')
new   1: insert into empsalary values('102','10000','yes')

1 row created.

SQL> /
Enter value for empid: 103
Enter value for salary: 5000
Enter value for ispermanent: no
old   1: insert into empsalary values('&empid','&salary','&ispermanent')
new   1: insert into empsalary values('103','5000','no')

1 row created.

SQL> /
Enter value for empid: 104
Enter value for salary: 1900
Enter value for ispermanent: yes
old   1: insert into empsalary values('&empid','&salary','&ispermanent')
new   1: insert into empsalary values('104','1900','yes')

1 row created.

SQL> /
Enter value for empid: 105
Enter value for salary: 2300
Enter value for ispermanent: yes
old   1: insert into empsalary values('&empid','&salary','&ispermanent')
new   1: insert into empsalary values('105','2300','yes')

1 row created.

SQL> select * from empsalary;

     EMPID     SALARY ISPER
---------- ---------- -----
       101       2000 yes
       102      10000 yes
       103       5000 no
       104       1900 yes
       105       2300 yes

SQL> create table project(projectid varchar(5) primary key,duration int);

Table created.

SQL> insert into project values('&projectid','&duration');
Enter value for projectid: p-1
Enter value for duration: 23
old   1: insert into project values('&projectid','&duration')
new   1: insert into project values('p-1','23')

1 row created.

SQL> /
Enter value for projectid: p-2
Enter value for duration: 15
old   1: insert into project values('&projectid','&duration')
new   1: insert into project values('p-2','15')

1 row created.

SQL> /
Enter value for projectid: p-3
Enter value for duration: 45
old   1: insert into project values('&projectid','&duration')
new   1: insert into project values('p-3','45')

1 row created.

SQL> /
Enter value for projectid: p-4
Enter value for duration: 2
old   1: insert into project values('&projectid','&duration')
new   1: insert into project values('p-4','2')

1 row created.

SQL> /
Enter value for projectid: p-5
Enter value for duration: 30
old   1: insert into project values('&projectid','&duration')
new   1: insert into project values('p-5','30')

1 row created.

SQL> select * from project;

PROJE   DURATION
----- ----------
p-1           23
p-2           15
p-3           45
p-4            2
p-5           30


SQL> create table empproject(empid int references employee(empid),projectid varchar(5) references project(projectid),clientid varchar(8),startyear int,endyear int);

Table created.

SQL> insert into empproject values('&empid','&projectid','&clientid','&startyear','&endyear');
Enter value for empid: 101
Enter value for projectid: p-1
Enter value for clientid: c1-1
Enter value for startyear: 2010
Enter value for endyear: 2010
old   1: insert into empproject values('&empid','&projectid','&clientid','&startyear','&endyear')
new   1: insert into empproject values('101','p-1','c1-1','2010','2010')

1 row created.

SQL> /
Enter value for empid: 102
Enter value for projectid: p-2
Enter value for clientid: c1-2
Enter value for startyear: 2010
Enter value for endyear: 2012
old   1: insert into empproject values('&empid','&projectid','&clientid','&startyear','&endyear')
new   1: insert into empproject values('102','p-2','c1-2','2010','2012')

1 row created.

SQL> /
Enter value for empid: 103
Enter value for projectid: p-1
Enter value for clientid: c1-3
Enter value for startyear: 2013
Enter value for endyear:
old   1: insert into empproject values('&empid','&projectid','&clientid','&startyear','&endyear')
new   1: insert into empproject values('103','p-1','c1-3','2013','')

1 row created.

SQL> /
Enter value for empid: 104
Enter value for projectid: p-4
Enter value for clientid: c1-1
Enter value for startyear: 2014
Enter value for endyear: 2015
old   1: insert into empproject values('&empid','&projectid','&clientid','&startyear','&endyear')
new   1: insert into empproject values('104','p-4','c1-1','2014','2015')

1 row created.

SQL> /
Enter value for empid: 105
Enter value for projectid: p-4
Enter value for clientid: c1-5
Enter value for startyear: 2015
Enter value for endyear:
old   1: insert into empproject values('&empid','&projectid','&clientid','&startyear','&endyear')
new   1: insert into empproject values('105','p-4','c1-5','2015','')

1 row created.

SQL> select * from empproject;

     EMPID PROJE CLIENTID  STARTYEAR    ENDYEAR
---------- ----- -------- ---------- ----------
       101 p-1   c1-1           2010       2010
       102 p-2   c1-2           2010       2012
       103 p-1   c1-3           2013
       104 p-4   c1-1           2014       2015
       105 p-4   c1-5           2015


SQL> select * from employee;

     EMPID EMPNAME         DEPARTMENT  CONTACTNO EMAILID
       EMPHEADID
---------- --------------- ---------- ---------- -------------------- ----------
       101 isha            e-101      1234567890 isha@gmail.com           105
       102 priya           e-104      1234567890 priya@yahoo.com          103
       103 neha            e-101      1234567890 neha@gmail.com           101
       104 rahul           e-102      1234567890 rahul@yahoo.com          105
       105 abhishek        e-101      1234567890 abhishek@gmail.com       102

SQL> select * from empdept;

DEPTID     DEPTNAME        DEPT_OFF     DEPTHEAD
---------- --------------- ---------- ----------
e-101      hr              monday            105
e-102      development     tuesday           101
e-103      housekeeping    saturday          103
e-104      sales           sunday            104
e-105      purchase        tuesday           104

SQL> select * from empsalary;

     EMPID     SALARY ISPER
---------- ---------- -----
       101       2000 yes
       102      10000 yes
       103       5000 no
       104       1900 yes
       105       2300 yes

SQL> select * from project;

PROJE   DURATION
----- ----------
p-1           23
p-2           15
p-3           45
p-4            2
p-5           30

SQL> select * from empproject;

     EMPID PROJE CLIENTID  STARTYEAR    ENDYEAR
---------- ----- -------- ---------- ----------
       101 p-1   c1-1           2010       2010
       102 p-2   c1-2           2010       2012
       103 p-1   c1-3           2013
       104 p-4   c1-1           2014       2015
       105 p-4   c1-5           2015







1. Select the detail of the employee whose name start with P. 

SQL> select * from employee where empname like 'p%';

     EMPID EMPNAME         DEPARTMENT  CONTACTNO EMAILID
       EMPHEADID
---------- --------------- ---------- ---------- -------------------- ----------
       102 priya           e-104      1234567890 priya@yahoo.com          103








2.   How many permanent candidate take salary more than 5000.

SQL> select count(ispermanent) from empsalary where salary>5000;

COUNT(ISPERMANENT)
------------------
                 1







3.   Select the detail of employee whose emailId is in gmail

SQL> select * from employee where emailid like '%gmail%';

     EMPID EMPNAME         DEPARTMENT  CONTACTNO EMAILID
       EMPHEADID
---------- --------------- ---------- ---------- -------------------- ----------
       101 isha            e-101      1234567890 isha@gmail.com           105
       103 neha            e-101      1234567890 neha@gmail.com           101
       105 abhishek        e-101      1234567890 abhishek@gmail.com       102







4.    Select the details of the employee who work either for department E-104 or E-102. 
Query

SQL> select * from employee where department in ('e-102','e-104');

     EMPID EMPNAME         DEPARTMENT  CONTACTNO EMAILID
       EMPHEADID
---------- --------------- ---------- ---------- -------------------- ----------
       102 priya           e-104      1234567890 priya@yahoo.com          103
       104 rahul           e-102      1234567890 rahul@yahoo.com          105









5.  What is the department name for DeptID E-102? 

SQL> select deptname from empdept where deptid='e-102';

DEPTNAME
---------------
development







6.   What is total salary that is paid to permanent employees? 

SQL> select sum(salary) from empsalary where ispermanent='yes';

SUM(SALARY)
-----------
      16200






7.   List name of all employees whose name ends with a. 

SQL> select * from employee where empname like '%a';

     EMPID EMPNAME         DEPARTMENT  CONTACTNO EMAILID
       EMPHEADID
---------- --------------- ---------- ---------- -------------------- ----------
       101 isha            e-101      1234567890 isha@gmail.com           105
       102 priya           e-104      1234567890 priya@yahoo.com          103
       103 neha            e-101      1234567890 neha@gmail.com           101








8. How many project started in year 2010. 

SQL> select count(projectid) from empproject where startyear=2010;

COUNT(PROJECTID)
----------------
               2







9. How many project started and finished in the same year. 

SQL> select count(projectid) from empproject where startyear=endyear;

COUNT(PROJECTID)
----------------
               1






10.   select the name of the employee whose name's 3rd character is 'h'. 

SQL> select * from employee where empname like '__h%';

     EMPID EMPNAME         DEPARTMENT  CONTACTNO EMAILID
       EMPHEADID
---------- --------------- ---------- ---------- -------------------- ----------
       101 isha            e-101      1234567890 isha@gmail.com           105
       103 neha            e-101      1234567890 neha@gmail.com           101
       104 rahul           e-102      1234567890 rahul@yahoo.com          105
       105 abhishek        e-101      1234567890 abhishek@gmail.com       102








11.  Select the department name of the company which is assigned to the employee whose employee id is greater than 103. 

SQL> select deptname from empdept where deptid in (select department from employee where empid>103);

DEPTNAME
---------------
development
hr






12. Select the name of the employee who is working under Abhishek. 

SQL> select empname from employee where empheadid=(select empid from employee where empname='abhishek');

EMPNAME
---------------
isha
rahul






13. Select the name of the employee who is department head of HR. 

SQL> select empname from employee where empid=(select depthead from empdept where deptname='hr');

EMPNAME
---------------
abhishek







14. Select the employee whose department off is Monday. 

SQL> select * from employee where department in (select deptid from empdept where dept_off='monday');

     EMPID EMPNAME         DEPARTMENT  CONTACTNO EMAILID
       EMPHEADID
---------- --------------- ---------- ---------- -------------------- ----------
       101 isha            e-101      1234567890 isha@gmail.com           105
       103 neha            e-101      1234567890 neha@gmail.com           101
       105 abhishek        e-101      1234567890 abhishek@gmail.com       102








15.Select the details of all employees working in development department. Query: 

SQL> select * from employee where department in (select deptid from empdept where deptname='development');

     EMPID EMPNAME         DEPARTMENT  CONTACTNO EMAILID
       EMPHEADID
---------- --------------- ---------- ---------- -------------------- ----------
       104 rahul           e-102      1234567890 rahul@yahoo.com          105














INNER QUERIES 





SQL> create table employee2(id int,name varchar(15),age int,address varchar(12),salary int);

Table created.

SQL> insert into employee2 values('&id','&name','&age','&address','&salary');
Enter value for id: 1
Enter value for name: john
Enter value for age: 20
Enter value for address: us
Enter value for salary: 2000
old   1: insert into employee2 values('&id','&name','&age','&address','&salary')
new   1: insert into employee2 values('1','john','20','us','2000')

1 row created.

SQL> /
Enter value for id: 2
Enter value for name: stephan
Enter value for age: 26
Enter value for address: dubai
Enter value for salary: 1500
old   1: insert into employee2 values('&id','&name','&age','&address','&salary')
new   1: insert into employee2 values('2','stephan','26','dubai','1500')

1 row created.

SQL> /
Enter value for id: 3
Enter value for name: david
Enter value for age: 27
Enter value for address: bangkok
Enter value for salary: 2000
old   1: insert into employee2 values('&id','&name','&age','&address','&salary')
new   1: insert into employee2 values('3','david','27','bangkok','2000')

1 row created.

SQL> /
Enter value for id: 4
Enter value for name: alina
Enter value for age: 29
Enter value for address: uk
Enter value for salary: 6500
old   1: insert into employee2 values('&id','&name','&age','&address','&salary')
new   1: insert into employee2 values('4','alina','29','uk','6500')

1 row created.

SQL> /
Enter value for id: 5
Enter value for name: kathrin
Enter value for age: 34
Enter value for address: bangalore
Enter value for salary: 8500
old   1: insert into employee2 values('&id','&name','&age','&address','&salary')
new   1: insert into employee2 values('5','kathrin','34','bangalore','8500')

1 row created.

SQL> /
Enter value for id: 6
Enter value for name: harry
Enter value for age: 42
Enter value for address: china
Enter value for salary: 4500
old   1: insert into employee2 values('&id','&name','&age','&address','&salary')
new   1: insert into employee2 values('6','harry','42','china','4500')

1 row created.

SQL> /
Enter value for id: 7
Enter value for name: jackson
Enter value for age: 25
Enter value for address: mizoram
Enter value for salary: 10000
old   1: insert into employee2 values('&id','&name','&age','&address','&salary')
new   1: insert into employee2 values('7','jackson','25','mizoram','10000')

1 row created.

SQL> select * from employee2;

        ID NAME                   AGE ADDRESS          SALARY
---------- --------------- ---------- ------------ ----------
         1 john                    20 us                 2000
         2 stephan                 26 dubai              1500
         3 david                   27 bangkok            2000
         4 alina                   29 uk                 6500
         5 kathrin                 34 bangalore          8500
         6 harry                   42 china              4500
         7 jackson                 25 mizoram           10000

7 rows selected.








1) Write a SQL statement to display the details of employees who are getting more than 4500 as SALARY. 

SQL> SELECT*FROM employee2 WHERE id IN (SELECT id FROM employee2 WHERE salary > 4500);

        ID NAME                   AGE ADDRESS          SALARY
---------- --------------- ---------- ------------ ----------
         4 alina                   29 uk                 6500
         5 kathrin                 34 bangalore          8500
         7 jackson                 25 mizoram           10000











2) Write a SQL statement to copy the complete Employee table in to newly created Employee_BKP table. 


SQL> create table employee_bkp(id int,name varchar(15),age int,address varchar(12),salary int);

Table created.

SQL> INSERT INTO employee_bkp SELECT * FROM employee2;

7 rows created.

SQL> select * from employee_bkp;

        ID NAME                   AGE ADDRESS          SALARY
---------- --------------- ---------- ------------ ----------
         1 john                    20 us                 2000
         2 stephan                 26 dubai              1500
         3 david                   27 bangkok            2000
         4 alina                   29 uk                 6500
         5 kathrin                 34 bangalore          8500
         6 harry                   42 china              4500
         7 jackson                 25 mizoram           10000

7 rows selected.









3) Write a SQL statement to update the Employee_BKP table in which Salary by 0.25 times in the Employee table for all employee whose Age is greater than or equal to 29

SQL> UPDATE employee_bkp SET SALARY = SALARY * 0.25 WHERE age IN (SELECT age FROM employee2 WHERE age >= 29);

3 rows updated.

SQL> select * from employee_bkp;

        ID NAME                   AGE ADDRESS          SALARY
---------- --------------- ---------- ------------ ----------
         1 john                    20 us                 2000
         2 stephan                 26 dubai              1500
         3 david                   27 bangkok            2000
         4 alina                   29 uk                 1625
         5 kathrin                 34 bangalore          2125
         6 harry                   42 china              1125
         7 jackson                 25 mizoram           10000

7 rows selected.








4) Write a SQL statement to delete the records from Employee table for all Employee whose age is greater than or equal to 29. 

SQL> DELETE FROM employee2  WHERE age IN (SELECT age FROM employee_bkp WHERE age >= 29 );

3 rows deleted.

SQL> select * from employee2;

        ID NAME                   AGE ADDRESS          SALARY
---------- --------------- ---------- ------------ ----------
         1 john                    20 us                 2000
         2 stephan                 26 dubai              1500
         3 david                   27 bangkok            2000
         7 jackson                 25 mizoram           10000










GROUP BY CLAUSE 






SQL> create table officers(officerid int,officername varchar(15),address varchar(15),workinghours int,to_date date);

Table created.

SQL> insert into officers values('&officerid','&officername','&address','&workinghours','&to_date');
Enter value for officerid: 1
Enter value for officername: ajeet
Enter value for address: mau
Enter value for workinghours: 12
Enter value for to_date: 24-jan-2021
old   1: insert into officers values('&officerid','&officername','&address','&workinghours','&to_date')
new   1: insert into officers values('1','ajeet','mau','12','24-jan-2021')

1 row created.

SQL> /
Enter value for officerid: 2
Enter value for officername: deepika
Enter value for address: lucknow
Enter value for workinghours: 10
Enter value for to_date: 24-jan-2021
old   1: insert into officers values('&officerid','&officername','&address','&workinghours','&to_date')
new   1: insert into officers values('2','deepika','lucknow','10','24-jan-2021')

1 row created.

SQL> /
Enter value for officerid: 3
Enter value for officername: vimal
Enter value for address: faizabad
Enter value for workinghours: 5
Enter value for to_date: 25-jan-2021
old   1: insert into officers values('&officerid','&officername','&address','&workinghours','&to_date')
new   1: insert into officers values('3','vimal','faizabad','5','25-jan-2021')

1 row created.

SQL> /
Enter value for officerid: 4
Enter value for officername: rahul
Enter value for address: lucknow
Enter value for workinghours: 4
Enter value for to_date: 25-jan-2021
old   1: insert into officers values('&officerid','&officername','&address','&workinghours','&to_date')
new   1: insert into officers values('4','rahul','lucknow','4','25-jan-2021')

1 row created.

SQL> /
Enter value for officerid: 5
Enter value for officername: ajeet
Enter value for address: mau
Enter value for workinghours: 9
Enter value for to_date: 26-jan-2021
old   1: insert into officers values('&officerid','&officername','&address','&workinghours','&to_date')
new   1: insert into officers values('5','ajeet','mau','9','26-jan-2021')

1 row created.

SQL> /
Enter value for officerid: 6
Enter value for officername: deepika
Enter value for address: lucknow
Enter value for workinghours: 5
Enter value for to_date: 26-jan-2021
old   1: insert into officers values('&officerid','&officername','&address','&workinghours','&to_date')
new   1: insert into officers values('6','deepika','lucknow','5','26-jan-2021')

1 row created.

SQL> /
Enter value for officerid: 7
Enter value for officername: vimal
Enter value for address: faizabad
Enter value for workinghours: 12
Enter value for to_date: 27-jan-2021
old   1: insert into officers values('&officerid','&officername','&address','&workinghours','&to_date')
new   1: insert into officers values('7','vimal','faizabad','12','27-jan-2021')

1 row created.

SQL> /
Enter value for officerid: 8
Enter value for officername: rahul
Enter value for address: lucknow
Enter value for workinghours: 10
Enter value for to_date: 27-jan-2021
old   1: insert into officers values('&officerid','&officername','&address','&workinghours','&to_date')
new   1: insert into officers values('8','rahul','lucknow','10','27-jan-2021')

1 row created.

SQL> select * from officers;

 OFFICERID OFFICERNAME     ADDRESS         WORKINGHOURS TO_DATE
---------- --------------- --------------- ------------ ---------
         1 ajeet           mau                       12 24-JAN-21
         2 deepika         lucknow                   10 24-JAN-21
         3 vimal           faizabad                   5 25-JAN-21
         4 rahul           lucknow                    4 25-JAN-21
         5 ajeet           mau                        9 26-JAN-21
         6 deepika         lucknow                    5 26-JAN-21
         7 vimal           faizabad                  12 27-JAN-21
         8 rahul           lucknow                   10 27-JAN-21

8 rows selected.






1) Write a SQL statement to display how many officers are from the same city. 

SQL> SELECT address, COUNT(*) FROM officers GROUP BY address;

ADDRESS           COUNT(*)
--------------- ----------
lucknow                  4
mau                      2
faizabad                 2





2) Write a SQL statement to display officer_name and total working hours of each officers from officers table.

SQL> SELECT officername, SUM(workinghours) AS "Total working hours" FROM officers GROUP by officername;

OFFICERNAME     Total working hours
--------------- -------------------
rahul                            14
deepika                          15
vimal                            17
ajeet                            21





3) Write a SQL statement to display minimum working hours of each officers from officer table.

SQL> SELECT officername, MIN(workinghours) AS "Minimum working hour" FROM officers GROUP BY officername;

OFFICERNAME     Minimum working hour
--------------- --------------------
rahul                              4
deepika                            5
vimal                              5
ajeet                              9






4) Write a SQL statement to display maximum working hours of each officers from officer table.

SQL> SELECT officername, MAX(workinghours) AS "Maximum working hour" FROM officers GROUP BY officername;

OFFICERNAME     Maximum working hour
--------------- --------------------
rahul                             10
deepika                           10
vimal                             12
ajeet                             12






5) Write a SQL statement to display average working hours of each officers from officer table.

SQL> SELECT officername, AVG(workinghours) AS "Avg working hour" FROM officers GROUP BY officername;

OFFICERNAME     Avg working hour
--------------- ----------------
rahul                          7
deepika                      7.5
vimal                        8.5
ajeet                       10.5






6) Write a SQL statement to display Total working hours of each officers having more than 5 hours from officer table. 

SQL> SELECT officername, SUM(workinghours) AS "Total working hours" FROM officers GROUP BY officername HAVING SUM(workinghours) > 5;

OFFICERNAME     Total working hours
--------------- -------------------
rahul                            14
deepika                          15
vimal                            17
ajeet                            21
























