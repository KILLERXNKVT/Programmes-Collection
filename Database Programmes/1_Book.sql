-- No: 1 Book SQL Program --

CREATE TABLE book_1 (book_id INT PRIMARY KEY, book_title VARCHAR(10), 
pages int, price int);
DESC book_1;
-- DROP TABLE book_1; --
-- DROP TABLE book_1 CASCADE CONSTRAINTS; --

CREATE TABLE author_1 (author_id INT PRIMARY KEY, author_name varchar(11),
address varchar(10), book_id INT REFERENCES book_1(book_id));
DESC author_1;

CREATE TABLE studentcard_1 (roll_no int PRIMARY KEY, branch VARCHAR(6), 
age int, book_id int REFERENCES book_1(book_id), author_id REFERENCES 
author_1(author_id));
DESC studentcard_1;
-- ALTER TABLE studentcard_1 MODIFY branch VARCHAR(6); --

INSERT INTO book_1 VALUES (&id, '&title', &pages, &price);
/
SELECT * FROM book_1;

BOOK_ID    BOOK_TITLE      PAGES      PRICE
---------- ---------- ---------- ----------
         1 OS                500        750
         2 HTML              100        150
         3 Addu              500        550
         4 Godfather        1000       2400
         5 AI                459        499

INSERT INTO author_1 VALUES (&id, '&name', '&addres', &book_id);
/
SELECT * FROM author_1;

 AUTHOR_ID AUTHOR_NAME ADDRESS       BOOK_ID
---------- ----------- ---------- ----------
       101 Mark        Chicago             2
       102 Jhon        Chennai             4
       103 Steve       Chennai             1
       104 David       Montreal            3
       105 Lewis       UK                  5

INSERT INTO studentcard_1 VALUES (&rollno, '&branch', &age, &book_id, &author_id);
/
SELECT * FROM studentcard_1;

ROLL_NO    BRANCH       AGE    BOOK_ID  AUTHOR_ID
---------- ----- ---------- ---------- ----------
         1 MCA           22          1        103
         2 MCA           21          4        102
         3 MBA           22          2        101
         4 MBA           22          3        104
         5 MCA           23          5        105

COMMIT;

-- 1. Find details of author who wrote the book which has max. no. of pages. --
SELECT author_1.author_id, author_name, address, 
book_1.book_id, pages FROM author_1, book_1 WHERE author_1.
book_id=book_1.book_id AND pages=(SELECT MAX(pages) FROM book_1);
-- OR --
SELECT author_1.author_id, author_1.author_name, author_1.address, 
book_1.book_id, book_1.pages FROM author_1, book_1 WHERE author_1.
book_id=book_1.book_id AND pages=(SELECT MAX(pages) FROM book_1);

AUTHOR_ID AUTHOR_NAME ADDRESS       BOOK_ID      PAGES
---------- ----------- ---------- ---------- ----------
       102 Jhon        Chennai             4       1000

SELECT author_1.author_id, author_1.author_name, author_1.address, 
book_1.book_id, book_1.pages FROM author_1 RIGHT JOIN book_1 ON 
author_1.book_id=book_1.book_id AND pages=(SELECT MAX(pages) 
FROM book_1);

AUTHOR_ID AUTHOR_NAME ADDRESS       BOOK_ID      PAGES
---------- ----------- ---------- ---------- ----------
                                           1        500
                                           2        100
                                           3        500
       102 Jhon        Chennai             4       1000
                                           5        459

-- 2. Find the details of students who did not take ‘OS’ book. --
SELECT roll_no, age, branch FROM studentcard_1, book_1 WHERE 
studentcard_1.book_id=book_1.book_id AND book_title!='OS';

ROLL_NO           AGE BRANCH
---------- ---------- ------
         2         21 MCA
         3         22 MBA
         4         22 MBA
         5         23 MCA

-- 3. Find the average age of students in a specified branch. --
SELECT branch, AVG(age) FROM studentcard_1 GROUP BY branch;

BRANCH   AVG(AGE)
------ ----------
MBA            22
MCA            22

-- 4. Find the details of students who took the books of authors in ‘Chennai’. --
SELECT roll_no, age, branch FROM studentcard_1 WHERE author_id IN 
(SELECT author_id FROM author_1 WHERE address='Chennai');

 ROLL_NO        AGE BRANCH
---------- ---------- ------
         1         22 MCA
         2         21 MCA

