CREATE TABLE client_master (client_no varchar(10) primary key, name varchar(20), address1 varchar(30), address2 varchar(30), city varchar(15), pincode number(8), state varchar(15), bal_due number(7,2));

CREATE TABLE product_master (product_no varchar(10) primary key, description varchar(15), profit_percent number(4,2), unit_measure varchar(10), qty_on_hand number(8), reorder_lv1 number(8), sell_price number(8,2), cost_price number(8,2));

CREATE TABLE salesman_master (salesman_no varchar(10) primary key, address1 varchar(30), city varchar(20), pincode number(8), state varchar(20), sal_amt number(8,2), tgt_to_get number(6,2), ytd_sales number(6,2), remarks varchar(60));

CREATE TABLE sales_order (order_no varchar(10) primary key, order_date date, client_no varchar(10) references client_master(client_no), delay_addr varchar(25), salesman_no varchar(10) references salesman_master(salesman_no), delytype char(1), billed_yn char(1), dely_date date, order_status varchar(10));

CREATE TABLE sales_order_details (order_no varchar(10) references sales_order(order_no), product_no varchar(10)references product_master(product_no), qty_ordered number(8), oty_disp number(8), product_rate number(10,2));

desc client_master;
desc product_master;
desc salesman_master;
desc sales_order;
desc sales_order_details;

INSERT INTO client_master (client_no, name, address1, 
address2, city, pincode, state, bal_due) VALUES 
('C001', 'Abin Thomas', 'abc', 'abc', 'Kottayam', 686537 ,'Kerala', 17895.58),  
('C003', 'Antony Adam', 'xyz', 'zyz', 'Kottayam', 686537 ,'Kerala', 1000),
('C004', 'Visakh Vijayan', 'wer', 'wer', 'Kollam', 578496 ,'Kerala', 100.50),
('C006', 'Sooraj Krishna', 'qre', 'qre', 'Bombay', 102345,'Maharashtra', 24321.12), 
('C002', 'Don J', 'iop', 'iop', 'Chennai',789563 ,'Tamilnadu', 15889),
('C005', 'Abhirami A J', 'uip', 'uip', 'Bangalore',600010 ,'Karnataka', 19555.95);
SELECT * FROM client_master;
INSERT INTO product_master (product_no, description
, profit_percent, unit_measure, qty_on_hand, reorder_lv1
, sell_price, cost_price) VALUES 
('P001', 'Keyboard', 5, 'per', '5', 2, 1200, 999),
('P002', 'Mouse', 5, 'per', '5', 2, 999, 800),
('P003', 'Graphics Card', 15, 'per', '10', 12, 32000, 26000),
('P004', 'Monitor', 10, 'per', '7', 16, 20000, 15000),
('P005', 'X-box', 20, 'per', '9', 20, 50000, 39999),
('P006', 'Laptop', 15, 'per', '9', 20, 62000, 52452);
SELECT * FROM product_master;

INSERT INTO salesman_master (salesman_no, address1, city, pincode, state, sal_amt, tgt_to_get, ytd_sales, remarks) VALUES 
('S001', 'aqk', 'Kottayam', 686537, 'Kerala', 15000, 45, 6, 'Good'),
('S002', 'ppp', 'Kollam', 578496, 'Kerala', 15000, 20, 13, 'Fine'),
('S003', 'attt', 'Banglore', 600010, 'Karnataka', 25000, 33, 3, 'Very good'),
('S004', 'awek', 'Bombay', 102345, 'Maharashtra', 22000, 27, 1, 'Good'),
('S005', 'fd', 'Chennai', 789563, 'Tamilnadu', 35000, 15, 10, 'Nice'),
('S006', 'afgjk', 'Banglore', 600011, 'Karnataka', 25000, 22, 5, 'Good');
SELECT * FROM salesman_master;

INSERT INTO sales_order (order_no, order_date, 
client_no, delay_addr, salesman_no, delytype, 
billed_yn, dely_date, order_status) VALUES 
('OR101', '02-MAR-2014', 'C001', 'abc', 'S001', 'F', 'Y', '08-MAR-2014', 'Fullfilled'),
('OR102', '18-MAR-2014', 'C004', 'wer', 'S003', 'F', 'Y', '22-MAR-2014', 'Fullfilled'),
('OR103', '14-FEB-2014', 'C002', 'iop', 'S004', 'F', 'Y', '1-MAR-2014', 'Fullfilled'),
('OR104', '15-FEB-2014', 'C001', 'abc', 'S005', 'P', 'N', '10-MAR-2014', 'In Process'),
('OR105', '22-JAN-2022', 'C005', 'uip', 'S006', 'F', 'Y', '04-FEB-2022', 'Fullfilled'),
('OR106', '1-JUN-2022', 'C003', 'xyz', 'S001', 'P', 'N', '08-JAN-2022', 'In Process');
SELECT * FROM sales_order;

INSERT INTO sales_order_details (order_no, product_no, qty_ordered, oty_disp, product_rate) VALUES 
('OR101', 'P001', 30, 27, 8),
('OR106', 'P004', 45, 45, 9),
('OR103', 'P003', 10, 9, 7),
('OR102', 'P005', 12, 11, 6),
('OR103', 'P001', 10, 10, 5),
('OR106', 'P003', 11, 5, 8),
('OR105', 'P006', 63, 50, 9);


SELECT * FROM sales_order_details;
-- OUTPUT --
SQL> SELECT name FROM client_master WHERE name LIKE '_b%';

NAME
---------------
Abin Thomas
Abhirami A J

SQL> SELECT client_no, name, city FROM client_master
  2  WHERE city LIKE '_o%';

CLIENT NAME            CITY
------ --------------- ---------------
C001   Abin Thomas     Kottayam
C003   Antony Adam     Kottayam
C004   Visakh Vijayan  Kollam
C006   Sooraj Krishna  Bombay

SQL> SELECT client_no, name, city FROM client_master WHERE
  2  city='Bombay' OR city='Kottayam';

CLIENT NAME            CITY
------ --------------- ---------------
C001   Abin Thomas     Kottayam
C003   Antony Adam     Kottayam
C006   Sooraj Krishna  Bombay

SQL> SELECT client_no, name, bal_due FROM client_master
  2  WHERE bal_due>15000;

CLIENT NAME               BAL_DUE
------ --------------- ----------
C001   Abin Thomas       17895.58
C006   Sooraj Krishna    24321.12
C002   Don J                15889
C005   Abhirami A J      19555.95

SQL> SELECT order_date, salesman_no, order_status
  2  FROM sales_order WHERE order_date LIKE '%MAR%';

ORDER_DAT SALESMAN_N ORDER_STAT
--------- ---------- ----------
02-MAR-14 S001       Fullfilled
18-MAR-14 S003       Fullfilled

SQL> SELECT * FROM sales_order WHERE client_no
  2  IN ('COO1','C002');

ORDER_NO   ORDER_DAT CLIENT_NO  DELAY_ADDR                SALESMAN_N D B
---------- --------- ---------- ------------------------- ---------- - -
DELY_DATE ORDER_STAT
--------- ----------
OR103      14-FEB-14 C002       iop                       S004       F Y
01-MAR-14 Fullfilled

SQL> SELECT product_no, description, sell_price
  2  FROM product_master WHERE sell_price>2000
  3  AND sell_price<=25000;


PRODUCT_NO DESCRIPTION     SELL_PRICE
---------- --------------- ----------
P004       Monitor              20000

SQL> SELECT product_no, description, sell_price
  2  , sell_price+sell_price*15 AS new_pr FROM product_master
  3  WHERE sell_price>50000;

PRODUCT_NO DESCRIPTION     SELL_PRICE     NEW_PR
---------- --------------- ---------- ----------
P006       Laptop               62000     992000

SQL> SELECT name, city, state FROM client_master
  2  WHERE state NOT LIKE 'Kerala';

NAME            CITY            STATE
--------------- --------------- ---------------
Sooraj Krishna  Bombay          Maharashtra
Don J           Chennai         Tamilnadu
Abhirami A J    bangalore       Karnataka

SQL> SELECT COUNT(order_no) FROM sales_order;

COUNT(ORDER_NO)
---------------
              6

SQL> SELECT AVG(sell_price), AVG(cost_price)
  2  FROM product_master;


AVG(SELL_PRICE) AVG(COST_PRICE)
--------------- ---------------
     27699.8333      22541.6667

SQL> SELECT MAX(sell_price) AS max_price,
  2  MIN(sell_price) AS min_price FROM product_master;

 MAX_PRICE  MIN_PRICE
---------- ----------
     62000        999

SQL> SELECT COUNT(product_no) FROM product_master
  2  WHERE sell_price>=25000;

COUNT(PRODUCT_NO)
-----------------
                3

SQL> SELECT * FROM product_master
  2  WHERE qty_on_hand<reorder_lv1;

PRODUCT_NO DESCRIPTION     PROFIT_PERCENT UNIT_MEASU QTY_ON_HAND REORDER_LV1
---------- --------------- -------------- ---------- ----------- -----------
SELL_PRICE COST_PRICE
---------- ----------
P003       Graphics Card               15 per                 10          12
     32000      26000

P004       Monitor                     10 per                  7          16
     20000      15000

P005       X-box                       20 per                  9          20
     50000      39999

PRODUCT_NO DESCRIPTION     PROFIT_PERCENT UNIT_MEASU QTY_ON_HAND REORDER_LV1
---------- --------------- -------------- ---------- ----------- -----------
SELL_PRICE COST_PRICE
---------- ----------
P006       Laptop                      15 per                  9          20
     62000      52452
