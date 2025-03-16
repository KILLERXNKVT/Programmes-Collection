-- NO.1 Employee --

CREATE TABLE emp (eno VARCHAR(5) PRIMARY KEY, ename VARCHAR(12), title VARCHAR(8), bdate DATE, salary INT, 
dno VARCHAR(6));
DESC emp;

CREATE TABLE dept (dno VARCHAR(5) PRIMARY KEY, dname VARCHAR(12), mgreno INT);
DESC dept;

CREATE TABLE proj (pno VARCHAR(5) PRIMARY KEY, pname VARCHAR(12), budget INT, 
dno VARCHAR(5) REFERENCES dept(dno));
DESC proj;

CREATE TABLE workson (eno VARCHAR(5) REFERENCES emp(eno), pno VARCHAR(5) REFERENCES proj(pno), 
resp VARCHAR(8), hours INT);
DESC workson;


INSERT INTO emp VALUES ('&eno', '&ename', '&bdate', '&title', &salary, '&dno');
/
SELECT * FROM emp;

ENO   ENAME        BDATE         SALARY DNO
----- ------------ --------- ---------- ------
E100  Richu        23-MAR-00     150000 D101
E101  Appu         12-JUN-99     100000 D101
E102  Abin         08-DEC-98      85000 D103
E103  John         22-MAR-00      50000 D105
E104  Kavya        20-FEB-00    1500000 D104
E105  Kevin        07-JUL-00      99999 D102

INSERT INTO dept VALUES ('&dno', '&dname', &mgreno);
/
SELECT * FROM dept;

DNO   DNAME            MGRENO
----- ------------ ----------
D101  Desi                  1
D102  Devep                 2
D103  Test                  3
D104  Ver                   4
D105  Mark                  5

INSERT INTO proj VALUES ('&pno', '&pname', &budget, '&dno');
/
SELECT * FROM proj;

PNO   PNAME            BUDGET DNO
----- ------------ ---------- -----
P101  Update            50000 D102
P102  Modify            25000 D101
P103  Dist              15000 D105
P104  Help              36000 D102
P105  My              1500000 D104


INSERT INTO workson VALUES ('&eno', '&pno', '&resp', &hours);
/
SELECT * FROM workson;

ENO   PNO   RESP          HOURS
----- ----- -------- ----------
E100  P102  Success          26
E101  P101  Partial          24
E102  P104  Success           4
E100  P105  Full             29
E104  P103  Success          48
E103  P103  Manager          48

COMMIT;

SELECT pno, pname FROM proj WHERE 
budget>100000;

PNO   PNAME
----- ------------
P105  My


SELECT * FROM workson WHERE 
hours>10 AND resp='Manager';

ENO   PNO   RESP          HOURS
----- ----- -------- ----------
E103  P103  Manager          48


SELECT eno, ename FROM emp WHERE title='SA' 
OR title='EE' AND salary>35000;



SELECT ename FROM emp WHERE dno='D101' 
ORDER BY salary;

ENAME
------------
Appu
Richu

SELECT * FROM dept ORDER BY dname;

DNO   DNAME            MGRENO
----- ------------ ----------
D101  Desi                  1
D102  Devep                 2
D105  Mark                  5
D103  Test                  3
D104  Ver                   4