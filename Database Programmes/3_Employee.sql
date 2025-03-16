-- NO.3 Employee --
 
CREATE TABLE employee_3 (emp_id INT PRIMARY KEY, emp_name VARCHAR(12),
department VARCHAR(5), contact_no INT, email_id VARCHAR(20), 
emphead_id INT);
DESC employee_3;

CREATE TABLE department_3 (dept_id VARCHAR(10) primary key, dept_name 
VARCHAR(15), dept_off VARCHAR(10),dept_head INT);
DESC department_3;

CREATE TABLE salary_3 (emp_id INT REFERENCES employee_3(emp_id), 
salary INT, is_permanent VARCHAR(5));
DESC salary_3;

CREATE TABLE project_3 (project_id VARCHAR(5) PRIMARY KEY, duration INT);
DESC project_3;

CREATE TABLE empproject_3 (emp_id INT REFERENCES employee_3(emp_id), 
project_id VARCHAR(5) REFERENCES project_3(project_id), client_id 
VARCHAR(8), start_year INT, end_year INT);
DESC empproject_3;


INSERT INTO employee_3 VALUES (&eid, '&ename', '&dep', &Contact, '&email'
, &head);
/
SELECT * FROM employee_3;

EMP_ID     EMP_NAME     DEPAR CONTACT_NO EMAIL_ID             EMPHEAD_ID
---------- ------------ ----- ---------- -------------------- ----------
       101 Isha         E-101 1234567890 isha@gmail.com              105
       102 Priya        E-104 1234567891 priya@yahoo.com             103
       103 Neha         E-101 1234567894 neha@gmail.com              101
       104 Rahul        E-102 1023456784 rahul@gmal.com              105
       105 abhishek     E-101 1452758963 abhishek@gmail.com          102

INSERT INTO department_3 VALUES ('&did', '&dname', '&dep', &head);
/ 
SELECT * FROM department_3;

DEPT_ID    DEPT_NAME       DEPT_OFF    DEPT_HEAD
---------- --------------- ---------- ----------
E-101      HR              Monday            105
E-102      Development     Tuesday           101
E-103      Housekeeping    Saturday          103
E-104      Sales           Sunday            104
E-105      Purchase        Tuesday           104

INSERT INTO salary_3 VALUES (&eid, &salary, '&per');
/
SELECT * FROM salary_3;

 EMP_ID     SALARY IS_PE
---------- ---------- -----
       101       2000 yes
       102      10000 yes
       103       5000 no
       104       1900 yes
       105       2300 yes

INSERT INTO project_3 VALUES ('&did', &dur); 
/
SELECT * FROM project_3;

PROJE   DURATION
----- ----------
P-1           23
P-2           15
P-3           45
P-4            2
P-5           30

INSERT INTO empproject_3 VALUES (&eid, '&pid', '&cid', '&syear', '&eyear'); 
/
SELECT * FROM empproject_3;
--  TRUNCATE TABLE empproject_3; --

EMP_ID PROJE CLIENT_I START_YEAR   END_YEAR
---------- ----- -------- ---------- ----------
       101 P-1   C1-1           2010       2010
       102 P-2   C1-2           2010       2012
       103 P-1   C1-3           2013
       104 P-4   C1-1           2014       2015
       105 P-4   C1-5           2015

COMMIT;

-- 1) Select the detail of the employee whose name start with P. --
SELECT * FROM employee_3 WHERE emp_name LIKE 'P%';

EMP_ID     EMP_NAME     DEPAR CONTACT_NO EMAIL_ID             EMPHEAD_ID
---------- ------------ ----- ---------- -------------------- ----------
       102 Priya        E-104 1234567891 priya@yahoo.com             103

-- 2) How many permanent candidate take salary more than 5000. --
SELECT COUNT(is_permanent) FROM salary_3 WHERE salary>5000;

COUNT(ISPERMANENT)
------------------
                 1

-- 3.   Select the detail of employee whose emailId is in gmail
SELECT * FROM employee_3 WHERE email_id LIKE '%gmail%';

 EMP_ID    EMP_NAME     DEPAR CONTACT_NO EMAIL_ID             EMPHEAD_ID
---------- ------------ ----- ---------- -------------------- ----------
       101 Isha         E-101 1234567890 isha@gmail.com              105
       103 Neha         E-101 1234567894 neha@gmail.com              101
       105 abhishek     E-101 1452758963 abhishek@gmail.com          102

-- 4. Select the details of the employee who work either for department E-104 or E-102. --
SELECT * FROM employee_3 WHERE department IN ('E-102','E-104');

 EMP_ID    EMP_NAME     DEPAR CONTACT_NO EMAIL_ID             EMPHEAD_ID
---------- ------------ ----- ---------- -------------------- ----------
       102 Priya        E-104 1234567891 priya@yahoo.com             103
       104 Rahul        E-102 1023456784 rahul@gmal.com              105

-- 5. What is the department name for DeptID E-102? -- 
SELECT dept_name FROM department_3 WHERE dept_id='E-102';

DEPT_NAME
---------------
Development

-- 6. What is total salary that is paid to permanent employees? --
SELECT SUM(salary) FROM salary_3 WHERE is_permanent='yes';

SUM(SALARY)
-----------
      16200


-- 7. List name of all employees whose name ends with a. --
SELECT * FROM employee_3 WHERE emp_name LIKE '%a';

EMP_ID     EMP_NAME     DEPAR CONTACT_NO EMAIL_ID             EMPHEAD_ID
---------- ------------ ----- ---------- -------------------- ----------
       101 Isha         E-101 1234567890 isha@gmail.com              105
       102 Priya        E-104 1234567891 priya@yahoo.com             103
       103 Neha         E-101 1234567894 neha@gmail.com              101

-- 8. How many project started in year 2010. --
SELECT COUNT(project_id) FROM empproject_3 WHERE start_year=2010;

COUNT(PROJECT_ID)
-----------------
                2

-- 9. How many project started and finished in the same year. --
SELECT COUNT(project_id) FROM empproject_3 WHERE start_year=end_year;

COUNT(PROJECTID)
----------------
               1

-- 10. select the name of the employee whose name's 3rd character is 'h'. --
SELECT * FROM employee_3 WHERE emp_name LIKE '__h%';

EMP_ID     EMP_NAME     DEPAR CONTACT_NO EMAIL_ID             EMPHEAD_ID
---------- ------------ ----- ---------- -------------------- ----------
       101 Isha         E-101 1234567890 isha@gmail.com              105
       103 Neha         E-101 1234567894 neha@gmail.com              101
       104 Rahul        E-102 1023456784 rahul@gmal.com              105
       105 Abhishek     E-101 1452758963 abhishek@gmail.com          102

-- 11. Select the department name of the company which is assigned to the employee whose employee id is greater than 103. --
SELECT dept_name FROM department_3 WHERE dept_id IN (SELECT department 
FROM employee_3 WHERE emp_id>103);

DEPT_NAME
---------------
HR
Development

-- 12. Select the name of the employee who is working under Abhishek. --
SELECT emp_name FROM employee_3 WHERE emphead_id=(SELECT emp_id FROM 
employee_3 WHERE emp_name='Abhishek');

EMP_NAME
------------
Isha
Rahul

-- 13. Select the name of the employee who is department head of HR. --
SELECT emp_name FROM employee_3 WHERE emp_id=(SELECT dept_head FROM 
department_3 WHERE dept_name='HR');

EMP_NAME
------------
Abhishek

-- 14. Select the employee whose department off is Monday. --
SELECT * FROM employee_3 WHERE department IN (SELECT dept_id FROM 
department_3 WHERE dept_off='Monday');

EMP_ID EMP_NAME         DEPAR CONTACT_NO EMAIL_ID             EMPHEAD_ID
---------- ------------ ----- ---------- -------------------- ----------
       101 Isha         E-101 1234567890 isha@gmail.com              105
       103 Neha         E-101 1234567894 neha@gmail.com              101
       105 Abhishek     E-101 1452758963 abhishek@gmail.com          102

-- 15.Select the details of all employees working in development department. --
SELECT * FROM employee_3 WHERE department IN (SELECT dept_id FROM 
department_3 WHERE dept_name='Development');

 EMP_ID    EMP_NAME     DEPAR CONTACT_NO EMAIL_ID             EMPHEAD_ID
---------- ------------ ----- ---------- -------------------- ----------
       104 Rahul        E-102 1023456784 rahul@gmal.com              105

