-- Employee Write a PL/SQL block to display total salary of all employees using cursor. --

CREATE TABLE employee_8 (employee_id INT PRIMARY KEY, employee_name 
VARCHAR(12), salary INT, comm INT);
DESC employee_8;

INSERT INTO employee_8 VALUES(&id, '&name', &salary, '&com');

SELECT * FROM employee_8;

EMPLOYEE_ID EMPLOYEE_NAM     SALARY       COMM
----------- ------------ ---------- ----------
      20765 Sam                5000       1500
      20766 Pooja              4500        750
      20767 Abhirami           4000       1050
      20768 Richu              5600       1100

SET serveroutput on;
DECLARE 
    eid employee_8.employee_id %type;
    ena employee_8.employee_name %type;
    esal employee_8.salary %type;
    ecomm employee_8.comm%type;
CURSOR eselect IS SELECT employee_id, employee_name, salary, comm FROM employee_8;
    ts number(8, 2);
BEGIN 
    OPEN eselect;
    dbms_output.put_line('......................');
    LOOP
    FETCH eselect INTO eid, ena, esal, ecomm;
    EXIT WHEN (eselect%notfound);
    ts:= esal+NVL(ecomm,0);
    dbms_output.put_line('Employee Id: '|| to_char(eid));
    dbms_output.put_line('Employee Name: '||ena);
    dbms_output.put_line('Total Salary: '|| to_char(ts));
    dbms_output.put_line('......................');
    END LOOP;
    CLOSE eselect;
END;
/

......................
Employee Id: 20765
Employee Name: Sam
Total Salary: 6500
......................
Employee Id: 20766
Employee Name: Pooja
Total Salary: 5250
......................
Employee Id: 20767
Employee Name: Abhirami
Total Salary: 5050
......................
Employee Id: 20768
Employee Name: Richu
Total Salary: 6700
......................