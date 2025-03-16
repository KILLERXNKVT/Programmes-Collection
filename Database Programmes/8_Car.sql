CREATE TABLE car_8 (serialno NUMBER(6) PRIMARY KEY, model VARCHAR2(10), 
manufacturer VARCHAR2(10),price NUMBER(10));
DESC car_8;

CREATE TABLE options_8 (serialno REFERENCES car_8(serialno), 
optionname VARCHAR(10), price NUMBER(10));
DESC options_8;

CREATE TABLE salesperson_8 (salespersonid VARCHAR(10) PRIMARY KEY, 
name VARCHAR(20), phone NUMBER(10));
DESC salesperson_8;

CREATE TABLE sales_8 (salespersonid VARCHAR(10) REFERENCES 
salesperson_8(salespersonid), serialno REFERENCES car_8(serialno), 
sdate DATE, salesprice NUMBER(10));
DESC sales_8;

INSERT INTO car_8 VALUES (100001,'Alto','Maruthi',350025);
INSERT INTO car_8 VALUES (100002,'WagonR','Maruthi',401493);
INSERT INTO car_8 VALUES (100003,'Swift','Maruthi',783403);
SELECT * FROM car_8;

 SERIALNO  MODEL      MANUFACTUR      PRICE
---------- ---------- ---------- ----------
    100001 Alto       Maruthi        350025
    100002 WagonR     Maruthi        401493
    100003 Swift      Maruthi        783403

INSERT INTO options_8 VALUES (100002,'Lxi',401493);
INSERT INTO options_8 VALUES (100002,'Vxi',451493);
SELECT * FROM options_8;

SERIALNO   OPTIONNAME      PRICE
---------- ---------- ----------
    100002 Lxi            401493
    100002 Vxi            451493

INSERT INTO salesperson_8 VALUES ('S1009','Joe',9995555555);
INSERT INTO salesperson_8 VALUES ('S1010','Manoj',9995555556);
SELECT * FROM salesperson_8;

SALESPERSO NAME                      PHONE
---------- -------------------- ----------
S1009      Joe                  9995555555
S1010      Manoj                9995555556

INSERT INTO sales_8 VALUES ('S1010',100002,'12-May-2012',401493);
INSERT INTO sales_8 VALUES ('S1009',100002,'12-May-2012',451493);
SELECT * FROM sales_8;

SALESPERSO   SERIALNO SDATE     SALESPRICE
---------- ---------- --------- ----------
S1010          100002 12-MAY-12     401493
S1009          100002 12-MAY-12     451493

SET serveroutput on;
CREATE OR REPLACE TRIGGER sellprice BEFORE UPDATE ON car_8
FOR EACH ROW
DECLARE
f number(10);
BEGIN
IF :OLD.price <> :NEW.price THEN
f:=:NEW.price - :OLD.price;
dbms_output.put_line('Change in price = '||f);
END IF;
END;
/

UPDATE car_8 SET price=350050 WHERE serialno=100001;
Change in price = 25

1 row updated.

SET serveroutput on;
DECLARE
CURSOR scursor is SELECT s.serialno, manufacturer, salesprice FROM car_8 c, sales s, salesperson sp 
WHERE s.salespersonid=sp.salespersonid AND sp.name='Joe'AND s.serialno=c.serialno;
BEGIN
FOR sval IN scursor
LOOP
dbms_output.put_line(sval.serialno||' '||sval.manufacturer||' '||sval.salesprice);
END LOOP;
END;
/

100002 Maruthi 451493

SET serveroutput on;
DECLARE
CURSOR scursor is SELECT serialno,model FROM car_8
WHERE serialno NOT IN (SELECT serialno FROM options_8);
BEGIN
FOR sval IN scursor
LOOP
dbms_output.put_line(sval.serialno||' '||sval.model);
END LOOP;
END;
/

100003 Swift
100001 Alto
