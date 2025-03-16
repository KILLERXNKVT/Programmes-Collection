-- PROGRAM 4 --

CREATE TABLE client_master_4 (client_no VARCHAR(4) PRIMARY KEY, 
name VARCHAR(10), address1 VARCHAR(6), address2 VARCHAR(6), 
city VARCHAR(10), pincode NUMBER(6), state VARCHAR(12), 
bal_due NUMBER(7,2));

CREATE TABLE product_master_4 (product_no VARCHAR(4) PRIMARY KEY
, description VARCHAR(10), profit_percent NUMBER(4,2)
, unit_measure VARCHAR(4), qty_on_hand NUMBER(5)
, reorder_lv1 NUMBER(4), sell_price NUMBER(6,2)
, cost_price NUMBER(7,2));

CREATE TABLE salesman_master_4 (salesman_no VARCHAR(4) PRIMARY KEY
, address1 VARCHAR(6), city VARCHAR(10), pincode NUMBER(6)
, state VARCHAR(10), sal_amt NUMBER(7,2)
, tgt_to_get NUMBER(4,2), ytd_sales NUMBER(4,2)
, remarks VARCHAR(8));

CREATE TABLE sales_order_4 (order_no VARCHAR(5) PRIMARY KEY
, order_date DATE, client_no VARCHAR(4) REFERENCES 
client_master_4(client_no), delay_addr VARCHAR(6)
, salesman_no varchar(4) REFERENCES salesman_master_4
(salesman_no), delytype CHAR(1), billed_yn CHAR(1)
, dely_date DATE, order_status VARCHAR(10));

CREATE TABLE sales_order_details_4 (order_no VARCHAR(8) 
REFERENCES sales_order_4(order_no), product_no VARCHAR(8)
REFERENCES product_master_4(product_no), qty_ordered NUMBER(8)
, oty_disp NUMBER(8), product_rate NUMBER(10,2));

desc client_master_4;
desc product_master_4;
desc salesman_master_4;
desc sales_order_4;
desc sales_order_details_4;

INSERT INTO client_master_4 VALUES ('&client_no', '&name', '&address1', 
'&address2', '&city', &pincode, '&state', &bal_due);
/ 
SELECT * FROM client_master_4;

CLIE NAME       ADDRES ADDRES CITY          PINCODE STATE           BAL_DUE
---- ---------- ------ ------ ---------- ---------- ------------ ----------
C001 Abin       abc    abc    Kottayam       686537 Kerala         17895.58
C003 Antony     xyz    xyz    Kottayam       686537 Kerala             1000
C004 Visakh     wer    wer    Kollam         578496 Kerala            100.5
C006 Sooraj     qre    qre    Bombay         102345 Maharashtra    24321.12
C002 Don J      iop    iop    Chennai        789563 Tamilnadu         15889
C005 Abhirami   uip    uip    Bangalore      600010 Karnataka      19555.95

INSERT INTO product_master_4 VALUES ('&product_no', '&description'
, '&profit_percent', '&unit_measure', '&qty_on_hand', &reorder, &sell_price, 
&cost_price); 
/
SELECT * FROM product_master_4;

PROD DESCRIPTIO PROFIT_PERCENT UNIT QTY_ON_HAND REORDER_LV1 SELL_PRICE COST_PRICE
---- ---------- -------------- ---- ----------- ----------- ---------- ---------
P001 Keyboard                5 per            5           2       1200 999
P002 Mouse                   5 per            5           2        999 800
P003 Graphics c             15 per           10          12      32000 26000
P004 Monitor                10 per            7          16       2000 15000
P005 X-box                  20 per            9          20      50000 39999
P006 Laptop                 15 per            9          20      62000 52452

INSERT INTO salesman_master_4 VALUES ('&salesman_no', '&address1', '&city'
, &pincode, '&state', &sal_amt, &tgt_to_get, &ytd_sales, '&remarks');
/
SELECT * FROM salesman_master_4;

SALE ADDRES CITY          PINCODE STATE         SAL_AMT TGT_TO_GET  YTD_SALES REMARKS
---- ------ ---------- ---------- ---------- ---------- ---------- ---------- --------
S001 aqk    Kottayam       686537 Kerala          15000         45         6  Good
S002 pp     Kollam         578496 Kerala          15000         20         13 Fine
S003 attt   Banglore       600010 Karnataka       25000         33         3  Very G
S004 awek   Bombay         102345 Maharashta      22000         27         1  Good
S005 fd     Chennai        789563 Tamilnadu       35000         15         10 Nice
S006 afgjk  Banglore       600011 Karnataka       25000         22         5  Good

INSERT INTO sales_order_4 VALUES ('&order_no', '&order_date', '&client_no'
, '&delay_addr', '&salesman_no' , '&delytype' , '&billed_yn', '&dely_date', '&order_status') 
/
SELECT * FROM sales_order_4;

ORDER ORDER_DAT CLIE DELAY_ SALE D B DELY_DATE ORDER_STAT
----- --------- ---- ------ ---- - - --------- ----------
OR101 02-MAR-14 C001 abc    S001 F Y 08-MAR-14 Fullfilled
OR102 18-MAR-14 C004 wer    S003 F Y 22-MAR-14 Fullfilled
OR103 14-FEB-14 C002 iop    S004 F Y 01-MAR-14 Fullfilled
OR104 15-FEB-14 C001 abc    S005 P N 10-MAR-14 In Process
OR105 22-JAN-22 C005 uip    S006 F Y 04-FEB-22 Fullfilled
OR106 01-JUN-22 C003 xyz    S001 P N 08-JAN-22 In Process

INSERT INTO sales_order_details_4 VALUES ('&order_no', '&product_no'
, &qty_ordered, &oty_disp, &product_rate)  
/
SELECT * FROM sales_order_details_4;

ORDER_NO PRODUCT_ QTY_ORDERED   OTY_DISP PRODUCT_RATE
-------- -------- ----------- ---------- ------------
OR101    P001              30         27            8
OR106    P004              45         45            9
OR103    P003              10          9            7
OR102    P005              12         11            6
OR103    P001              10         10            5
OR106    P003              11          5            8
OR105    P006              63         50            9


-- 1) Find the names of all clients having 'b' as the second letter in their names? --
SELECT * FROM client_master_4 WHERE name LIKE '_b%';
--
SELECT name FROM client_master_4 WHERE name LIKE '_b%';

CLIE NAME       ADDRES ADDRES CITY       PINCODE    STATE           BAL_DUE
---- ---------- ------ ------ ---------- ---------- ------------ ----------
C001 Abin       abc    abc    Kottayam       686537 Kerala         17895.58
C005 Abhirami   uip    uip    Bangalore      600010 Karnataka      19555.95

-- 2) Find the clients who stay in a city whose second letter in 'o'? --
SELECT client_no, name, city FROM client_master_4 WHERE city LIKE '_o%';

CLIE NAME       CITY
---- ---------- ----------
C001 Abin       Kottayam
C003 Antony     Kottayam
C004 Visakh     Kollam
C006 Sooraj     Bombay

-- 3) Find the list of all clients who stay in 'Bombay' or 'Kottayam'? --
SELECT client_no, name, city FROM client_master_4 WHERE city='Bombay' 
OR city='Kottayam';

CLIE NAME       CITY
---- ---------- ----------
C001 Abin       Kottayam
C003 Antony     Kottayam
C006 Sooraj     Bombay

-- 4) Print the list of clients whose bal_due is greater than value 15000? --
SELECT client_no, name, bal_due FROM client_master_4 WHERE bal_due>15000;

CLIE NAME          BAL_DUE
---- ---------- ----------
C001 Abin         17895.58
C006 Sooraj       24321.12
C002 Don J           15889
C005 Abhirami     19555.95

-- 5) Print the information from Sales_order table for enters places in the month of 'March'? --
SELECT order_date, salesman_no, order_status FROM sales_order_4 
WHERE order_date LIKE '%MAR%';

ORDER_DAT SALE ORDER_STAT
--------- ---- ----------
02-MAR-14 S001 Fullfilled
18-MAR-14 S003 Fullfilled

-- 6) Display the order information for client_no 'C001' and 'C002'? --
SELECT * FROM sales_order_4 WHERE client_no IN ('COO1','C002');

ORDER ORDER_DAT CLIE DELAY_ SALE D B DELY_DATE ORDER_STAT
----- --------- ---- ------ ---- - - --------- ----------
OR103 14-FEB-14 C002 iop    S004 F Y 01-MAR-14 Fullfilled

-- 7) Find the products whose selling price is greater than 2000 and less than or equal to 5000? --
SELECT product_no, description, sell_price FROM product_master_4 
WHERE sell_price>2000 AND sell_price<=25000;

no rows selected

-- 8) Find products whose selling price is more than 50000. Calculate a new selling_price=original selling price *.15.Rename the new column in the above query as new_price? --
SELECT product_no, description, sell_price, sell_price+sell_price*15 
AS new_pr FROM product_master_4 WHERE sell_price>50000;

PROD DESCRIPTIO SELL_PRICE     NEW_PR
---- ---------- ---------- ----------
P006 Laptop          62000     992000

-- 9) List the names ,city and state of clients who are not in the state of 'Kerala'? --
SELECT name, city, state FROM client_master_4 WHERE state NOT LIKE 'Kerala';

NAME       CITY       STATE
---------- ---------- ------------
Sooraj     Bombay     Maharashtra
Don J      Chennai    Tamilnadu
Abhirami   Bangalore  Karnataka

-- 10) Count the total number of orders? --
SELECT COUNT(order_no) FROM sales_order_4;

COUNT(ORDER_NO)
---------------
              6

-- 11) Calculate the average price of all the products? --
SELECT AVG(sell_price), AVG(cost_price) FROM product_master_4;

AVG(SELL_PRICE) AVG(COST_PRICE)
--------------- ---------------
     24699.8333      22541.6667

-- 12) Determine the maximum and mnimum product prices.Rename the output as max_p;rice and min_price respectively? --
SELECT MAX(sell_price) AS max_price, MIN(sell_price) AS min_price 
FROM product_master_4;

 MAX_PRICE  MIN_PRICE
---------- ----------
     62000        999

-- 13) Count the number of products having price greater than or equal to 25000? --
SELECT COUNT(product_no) FROM product_master_4 WHERE sell_price>=25000;

COUNT(PRODUCT_NO)
-----------------
                3

-- 14) Find all the product whose Qty_on_hand is less than recorder level? --
SELECT * FROM product_master_4 WHERE qty_on_hand<reorder_lv1; 

PROD DESCRIPTIO PROFIT_PERCENT UNIT QTY_ON_HAND REORDER_LV1 SELL_PRICE COST_PRICE
---- ---------- -------------- ---- ----------- ----------- ---------- ----------
P006 Laptop                 15 per            9          20      62000 52452

