-- NO.2 --

CREATE TABLE books_2 (book_id INT PRIMARY KEY, title VARCHAR2(20), 
COST NUMBER(7,2) CHECK (COST>0) );
DESC books_2;

CREATE TABLE authors_2 (book_id REFERENCES books_2(book_id), author 
VARCHAR(10) );
DESC authors_2;

CREATE TABLE users_2 (user_id INT PRIMARY KEY, name VARCHAR(10), 
category VARCHAR(10));
DESC users_2;
-- ALTER TABLE users_2 MODIFY category VARCHAR(10); --

CREATE TABLE circulation_2 (user_id REFERENCES users_2(user_id), book_id 
REFERENCES books_2(book_id), issue_date DATE, receipt_date DATE);
DESC circulation_2;
-- ALTER TABLE circulation_2 RENAME COLUMN receit_date TO receipt_date; --

INSERT INTO books_2 VALUES (&bid, '&title', &cost);
/
SELECT * FROM books_2;

 BOOK_ID   TITLE                      COST
---------- -------------------- ----------
    1001    Harry Potter                500
    1002    Goosebumps                  285
    1003    Fighting Fantasy            625
    1004    Sherlock Holmes             267
    1005    Falcon                      1

INSERT INTO authors_2 VALUES (&bid, '&author');
/
SELECT * FROM authors_2;

 BOOK_ID   AUTHOR
---------- ----------
      1003 Ullman
      1004 Ullman
      1001 JK Rowling
      1002 Steve

INSERT INTO users_2 VALUES (&uid, '&name', '&category');
/
SELECT * FROM users_2;

USER_ID    NAME       CATEGORY
---------- ---------- ----------
      2001 Dalvin     Thriller
      2002 Don        Fantasy
      2003 Richu      Suspense

INSERT INTO circulation_2 VALUES (&uid, &bid, '&idate', '&rdate');
/
SELECT * FROM circulation_2;

USER_ID    BOOK_ID    ISSUE_DATE RECEIPT_DATE
---------- ---------- ---------- ------------
      2003    1002    11-JAN-22  09-JUL-22
      2001    1003    12-JAN-22  08-JUL-22
      2002    1004    13-JUN-22  15-JUN-22
      2002    1001    13-JUN-22

COMMIT;

-- 1) Find the titles of books where ULLMAN is an author. --
SELECT title FROM books_2 WHERE book_id IN (SELECT book_id FROM 
authors_2 WHERE author='Ullman');

TITLE
--------------------
Fighting Fantasy
Sherlock Holmes

-- 2) Find the usernames of all users who have not returned books costing above rs 300
SELECT name FROM users_2 U, circulation_2 C, books_2 B WHERE 
U.user_id=C.user_id AND C.book_id=B.book_id AND COST > 300 AND 
receipt_date IS NULL;

NAME
----------
Don

-- 3) Find titles of books issued to users of category 3 costing avbove rs 300
SELECT title FROM books_2 B, users_2 U, circulation_2 C WHERE 
B.book_id=C.book_id AND C.user_id=U.user_id AND CATEGORY='Fantasy' 
AND COST > 300;

TITLE
--------------------
Harry Potter

-- 4) Find titles of books due to be returned. RECEIPTDATE can be 15 days after 
SELECT title FROM books_2 B, circulation_2 C WHERE B.book_id=C.book_id 
AND issue_date + 15 < SYSDATE AND receipt_date IS NULL;

TITLE
--------------------
Harry Potter
