-- ALTER TABLE s_student MODIFY ssn INT PRIMARY KEY; --
-- ALTER TABLE s_student RENAME COLUMN ssn to roll_no; --
-- ALTER TABLE s_student DROP COLUMN roll_no; --
-- ALTER TABLE table_name RENAME TO new_table_name; --
-- INSERT INTO s_student (ssn, name, major, bdate) VALUES ('S1', 'Appu', 'major', '10-feb-1990'); --
-- UPDATE s_student SET name ='Joe' WHERE ssn ='S4'; --
-- UPDATE s_student SET major ='Major'; --
-- UPDATE s_course set course_name = 'MECH', department = 'UG' WHERE course_no = 'C104'; --
-- DELETE from s_enroll where grade=4; --

-- STUDENT DATABASE APPLICATION --

CREATE TABLE s_student(ssn varchar(6) PRIMARY KEY, name varchar(20), major varchar(20), bdate date);
CREATE TABLE s_course(course_no varchar(12) PRIMARY KEY, course_name varchar(25), department varchar(25));
CREATE TABLE s_text(book_isbn varchar(9) PRIMARY KEY, book_title varchar(20), publisher varchar(20), author varchar(20));
CREATE TABLE s_enroll(ssn varchar(6) REFERENCES s_student(ssn), course_no varchar(12) REFERENCES course(course_no), quarter number(2), grade number(2));
CREATE TABLE s_book(course_no varchar(12) REFERENCES s_course(course_no), quarter number(2), book_isbn varchar(9) REFERENCES text(book_isbn));

DESC s_student;
INSERT INTO s_student VALUES('&ssn', '&name', '&major', '&bdate');
INSERT INTO s_course (COURSE_NO,COURSE_NAME,DEPARTMENT)
VALUES
    ('C101', 'BTECH', 'CS'),
    ('C102', 'BHM', 'HK'),
    ('C103', 'PG', 'MCA'),
    ('C104', 'UG', 'BSC CS');
SELECT * FROM s_student;

SSN    NAME                 MAJOR                BDATE
------ -------------------- -------------------- ---------
S1     Akshay               sr                   10-FEB-90
S2     Joe                  sr                   23-MAR-00
S3     Jibin                sr                   17-JUN-99
S5     Anuja                jr                   20-NOV-89

DESC s_course;
INSERT INTO s_course VALUES('&course_no', '&course_name', '&department');
INSERT INTO s_course (SSN,NAME,MAJOR,BDATE)
VALUES
    ('S1', 'Akshay', 'sr', '02/10/1990'),
    ('S2', 'Joe', 'sr', '03/23/2000'),
    ('S3', 'Jibin', 'sr', '06/17/1999'),
    ('S5', 'Anuja', 'jr', '11/20/1989');
SELECT * FROM s_course;

COURSE_NO    COURSE_NAME               DEPARTMENT
------------ ------------------------- -------------------------
C101         BTECH                     CS
C102         BHM                       HK
C103         PG                        MCA
C104         UG                        BSC CS

DESC s_enroll;
INSERT INTO s_enroll VALUES('&ss', '&id', &quater, &g);
INSERT INTO s_enroll (SSN,COURSE_NO,QUARTER,GRADE)
VALUES
    ('S1', 'C102', '2', '3'),
    ('S2', 'C101', '1', '2'),
    ('S5', 'C103', '4', '1');
SELECT * FROM s_enroll;

SSN    COURSE_NO       QUARTER      GRADE
------ ------------ ---------- ----------
S1     C102                  2          3
S2     C101                  1          2
S5     C103                  4          1

DESC s_text;
INSERT INTO s_text values('&is', '&title', '&publisher', '&author');
INSERT INTO s_text (BOOK_ISBN,BOOK_TITLE,PUBLISHER,AUTHOR)
VALUES
    ('B1', 'Database', 'Hudson plb', 'Jain'),
    ('B2', 'Java', 'Pearson', 'Herbict'),
    ('B7', 'OOP with C++', 'Pearson', 'Balaguru'),
    ('B9', 'Operating System', 'Pearson', 'Allan morge');
SELECT * FROM s_text;

BOOK_ISBN BOOK_TITLE           PUBLISHER            AUTHOR
--------- -------------------- -------------------- --------------------
B1        Database             Hudson plb           Jain
B2        Java                 Pearson              Herbict
B7        OOP with C++         Pearson              Balaguru
B9        Operating System     Pearson              Allan morge

DESC s_book;
INSERT INTO s_book values('&course_no', &quarter, '&book_isbn');
INSERT INTO s_book (COURSE_NO,QUARTER,BOOK_ISBN)
VALUES
    ('C101', '1', 'B2'),
    ('C101', '1', 'B7'),
    ('C101', '2', 'B9'),
    ('C103', '2', 'B1'),
    ('C103', '4', 'B2');
SELECT * FROM s_book;

COURSE_NO       QUARTER BOOK_ISBN
------------ ---------- ---------
C101                  1 B2
C101                  1 B7
C101                  2 B9
C103                  2 B1
C103                  4 B2

COMMIT;


-- 1. List the number of courses taken by all students named joe in QUARTER-1 --
SELECT * FROM s_course WHERE course_no IN (SELECT course_no FROM s_enroll WHERE ssn IN
(SELECT ssn FROM s_student WHERE name='Joe') ); 

COURSE_NO    COURSE_NAME               DEPARTMENT
------------ ------------------------- -------------------------
C101         BTECH                     CS

SELECT course_name, course_no, department FROM s_course WHERE course_no IN 
(SELECT course_no FROM s_enroll WHERE ssn IN (SELECT ssn FROM s_student WHERE name='Joe') );

COURSE_NAME               COURSE_NO    DEPARTMENT
------------------------- ------------ -------------------------
BTECH                     C101         CS

 -- PL/SQL --
SET serveroutput ON;
DECLARE
  result number(5);
BEGIN
  SELECT count(DISTINCT course_no) INTO result FROM s_student, s_enroll
  WHERE s_student.ssn = s_enroll.ssn AND quarter = 1 AND name LIKE '%Joe%';
  dbms_output.put_line('Number of courses taken by all students named joe in quarter 1 is ' || result);
END;
/

Number of courses taken by all students named joe in quarter 1 is 1

-- 2. Produce a list of textbooks(coursenumber,book-isbn,book-title etc) for courses offered by cs department that have used more than two books. --
SELECT book_isbn, book_title FROM s_text WHERE book_isbn IN (SELECT book_isbn FROM s_book 
WHERE course_no IN (SELECT course_no FROM s_course WHERE department='CS'));

BOOK_ISBN BOOK_TITLE
--------- --------------------
B2        Java
B7        OOP with C++
B9        Operating System

SELECT c.course_no, t.book_isbn, t.book_title FROM s_course c, s_book ba, s_text t 
WHERE c.course_no=ba.course_no AND ba.book_isbn=t.book_isbn 
AND c.department='CS'; -- AND 2<(SELECT COUNT(book_isbn) FROM s_book b WHERE c.course_no=b.course_no) ORDER BY t.book_title; --

COURSE_NO    BOOK_ISBN BOOK_TITLE
------------ --------- --------------------
C101         B2        Java
C101         B7        OOP with C++
C101         B9        Operating System

-- PL/SQL --
SET serveroutput ON;
DECLARE 
  CURSOR list IS SELECT DISTINCT course_no, a.book_isbn, book_title 
  FROM s_book a, s_text b
  WHERE a.book_isbn = b.book_isbn AND
  course_no IN (
  SELECT a.course_no
  FROM s_course a, s_text b, s_book c WHERE
  a.course_no = c.course_no AND
  b.book_isbn = c.book_isbn AND
  a.department LIKE 'CS'
  GROUP BY a.course_no HAVING count(DISTINCT b.book_isbn)>2
  );
  row1 list%ROWTYPE;
BEGIN
  dbms_output.put_line('COURSE_NUMBER   BOOK_ISBN   BOOK_TITLE');
  for row1 IN list
  LOOP
    dbms_output.put_line(row1.course_no || '            ' || row1.book_isbn || '          ' || row1.book_title);
  END LOOP;
END;
/

COURSE_NUMBER   BOOK_ISBN   BOOK_TITLE
C101            B2          Java
C101            B9          Operating System
C101            B7          OOP with C++

-- 3. List any department that has all its books published by "pearson". --
SELECT * FROM s_course WHERE course_no IN ( SELECT course_no FROM s_book WHERE book_isbn IN 
(SELECT book_isbn FROM s_text WHERE publisher='Pearson'));

COURSE_NO    COURSE_NAME               DEPARTMENT
------------ ------------------------- -------------------------
C101         BTECH                     CS
C103         PG                        MCA

SELECT c.department FROM s_course c WHERE c.department IN (SELECT c.department 
FROM s_course c, s_book b, s_text t WHERE c.course_no=b.course_no AND t.book_isbn=b.book_isbn
AND t.publisher='Pearson') AND c.department NOT IN (SELECT c.department 
FROM s_course c, s_book b, s_text t WHERE c.course_no=b.course_no 
AND t.book_isbn=b.book_isbn AND t.publisher != 'Pearson');

DEPARTMENT
-------------------------
CS

SELECT c.department, COUNT(DISTINCT b.book_isbn) FROM s_course c LEFT JOIN s_book b ON
c.course_no=b.course_no AND
b.book_isbn IN (SELECT book_isbn FROM s_text where publisher='Pearson')
GROUP BY c.department;

DEPARTMENT                COUNT(DISTINCTB.BOOK_ISBN)
------------------------- --------------------------
BSC CS                                             0
CS                                                 3
HK                                                 0
MCA                                                1
      
-- PL/SQL --
SET serveroutput ON
DECLARE
    CURSOR cursor1 IS SELECT a.department, count(DISTINCT b.book_isbn) AS num 
    FROM s_course a, s_book b WHERE a.course_no = b.course_no GROUP BY department;
    CURSOR cursor2 IS SELECT department, count(DISTINCT b.book_isbn) AS num 
    FROM s_course a, s_book b, s_text c WHERE a.course_no = b.course_no 
    AND c.book_isbn = b.book_isbn 
    AND publisher LIKE 'Pearson' GROUP BY department;
    row1 cursor1%ROWTYPE;
    row2 cursor2%ROWTYPE;
BEGIN
    OPEN cursor2;
    for row1 IN cursor1
    LOOP
        FETCH cursor2 INTO row2;
        IF (row1.department = row2.department) THEN 
            IF (row1.num = row2.num) THEN
              dbms_output.put_line(row1.department);
            END IF;
        END IF;
    END LOOP;
END;
/

CS

-- 4. Create a trigger that prints the name of the book when the isbn number of the book is changed. --
SET serveroutput ON;
CREATE OR REPLACE TRIGGER isbn BEFORE UPDATE OF book_isbn ON s_text
FOR EACH ROW
BEGIN
IF (:old.book_isbn <> :new.book_isbn)
THEN
dbms_output.put_line('Book isbn tried to be changed is :'|| :old.book_title);
END IF;
END;
/

UPDATE s_text SET book_isbn = 'B2' WHERE book_title = 'Database';

ERROR at line 1:
ORA-00001: unique constraint (RICHU.SYS_C007291) violated