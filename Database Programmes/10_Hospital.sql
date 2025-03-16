-- HOSPITAL DATABASE APPLICATION --

CREATE TABLE h_patient (patient_id VARCHAR(11) PRIMARY KEY, patient_name VARCHAR(20), dob DATE, age NUMBER, place VARCHAR(20));
CREATE TABLE h_doctor (doc_id VARCHAR(8) PRIMARY KEY, specialization VARCHAR(15), salary INT);

CREATE TABLE h_treatment (patient_id VARCHAR(11) REFERENCES h_patient(patient_id), doc_id VARCHAR(8) REFERENCES h_doctor(doc_id), from_date DATE, to_date DATE);

DESC h_patient;
DESC h_doctor;
DESC h_treatment;

INSERT INTO h_patient VALUES ('&pid', '&name', '&date', &age, '&place');
INSERT INTO h_patient (PATIENT_ID,PATIENT_NAME,DOB,AGE,PLACE)
VALUES
    ('102', 'Abin', '11/17/2000', '22', 'ktym'),
    ('103', 'Don', '12/22/2000', '21', 'allpy'),
    ('101', 'Febin', '06/06/2000', '22', 'tvm'),
    ('104', 'Vipin', '02/19/2000', '22', 'tvm'),
    ('105', 'Appu', '01/22/1999', '23', 'tvm');
SELECT * FROM h_patient ORDER BY patient_id;

PATIENT_ID  PATIENT_NAME         DOB              AGE PLACE
----------- -------------------- --------- ---------- --------------------
101         Febin                06-JUN-00         22 tvm
102         Abin                 17-NOV-00         22 ktym
103         Don                  22-DEC-00         21 allpy
104         Vipin                19-FEB-00         22 tvm
105         Appu                 22-JAN-99         23 tvm

INSERT INTO h_doctor VALUES ('&did', '&spec', &salary);
INSERT INTO h_doctor (DOC_ID,SPECIALIZATION,SALARY)
VALUES
    ('D101', 'Mental', '100000'),
    ('D102', 'Neuro', '110000'),
    ('D103', 'Ent', '95000'),
    ('D104', 'Dental', '105000'),
    ('D105', 'Ortho', '80000');
SELECT * FROM h_doctor;

DOC_ID   SPECIALIZATION      SALARY
-------- --------------- ----------
D101     Mental              100000
D102     Neuro               110000
D103     Ent                  95000
D104     Dental              105000
D105     Ortho                80000

INSERT INTO h_treatment VALUES ('&pid', '&docid', '&from', '&to');
INSERT INTO h_doctor (PATIENT_ID,DOC_ID,FROM_DATE,TO_DATE)
VALUES
    ('101', 'D101', '01/01/2019', '02/02/2019'),
    ('102', 'D102', '02/25/2020', '03/30/2020'),
    ('103', 'D103', '08/04/2018', '09/05/2018'),
    ('104', 'D104', '11/27/2021', '11/30/2021'),
    ('105', 'D103', '08/15/2019', '08/20/2019');
SELECT * FROM h_treatment;

PATIENT_ID  DOC_ID   FROM_DATE TO_DATE
----------- -------- --------- ---------
101         D101     01-JAN-19 02-FEB-19
102         D102     25-FEB-20 30-MAR-20
103         D103     04-AUG-18 05-SEP-18
104         D104     27-NOV-21 30-NOV-21
105         D103     15-AUG-19 20-AUG-19

-- 1. Find the details of patients treated by the doctor with maximum salary --
SELECT * FROM h_patient WHERE patient_id IN 
(SELECT patient_id FROM h_treatment WHERE doc_id IN 
(SELECT doc_id FROM h_doctor WHERE salary IN 
(SELECT MAX(salary) FROM h_doctor))) ORDER BY patient_id; 

PATIENT_ID  PATIENT_NAME         DOB              AGE PLACE
----------- -------------------- --------- ---------- --------------------
102         Abin                 17-NOV-00         22 ktym

SELECT * FROM h_patient WHERE patient_id IN 
(SELECT patient_id FROM h_treatment WHERE doc_id IN 
(SELECT doc_id FROM h_doctor WHERE salary >= 100000 )) ORDER BY patient_id;

PATIENT_ID  PATIENT_NAME         DOB              AGE PLACE
----------- -------------------- --------- ---------- --------------------
101         Febin                06-JUN-00         22 tvm
102         Abin                 17-NOV-00         22 ktym
104         Vipin                19-FEB-00         22 tvm

-- 2. Find the details of doctors who treated patients within the period 04/06/2022 to 03/10/2022 --
SELECT * FROM h_doctor WHERE doc_id IN 
(SELECT doc_id FROM h_treatment WHERE from_date >= '04-aug-2018' 
AND to_date >= '02-feb-2019');

DOC_ID   SPECIALIZATION      SALARY
-------- --------------- ----------
D101     Mental              100000
D102     Neuro               110000
D103     Ent                  95000
D104     Dental              105000

-- 3. Find the details of patients discharged on august --
SELECT * FROM h_patient WHERE patient_id IN 
(SELECT patient_id FROM h_treatment WHERE to_date BETWEEN '01-aug-2019' 
AND '30-aug-19');

PATIENT_ID  PATIENT_NAME         DOB              AGE PLACE
----------- -------------------- --------- ---------- --------------------
105         Appu                 22-JAN-99         23 tvm

-- 4. Create triggers for the following --
-- a)	Deletion is possible from patient table if dob is less than 01/01/1910 --
SET serveroutput ON;
CREATE OR REPLACE TRIGGER delpatient BEFORE DELETE ON h_patient
FOR EACH ROW
BEGIN
    IF :old.dob >'01-jan-1910' THEN
      raise_application_error(-20101, 'DELETION IS NOT POSSIBLE');
    END IF;
END;
/

DELETE FROM h_patient WHERE dob='17-nov-2000';

ERROR at line 1:
ORA-20101: DELETION IS NOT POSSIBLE
ORA-06512: at "RICHU.DELPATIENT", line 3
ORA-04088: error during execution of trigger 'RICHU.DELPATIENT'

-- b)	Updation is possible on doctor table if the specialization is pediatric --
SET serveroutput ON;
CREATE OR REPLACE TRIGGER updoctor BEFORE UPDATE ON h_doctor
FOR EACH ROW
BEGIN
    IF :old.specialization !='ental' THEN
      raise_application_error(-20101, 'UPDATION IS NOT POSSIBLE');
    END IF;
END;
/

UPDATE h_doctor SET specialization='Mental' WHERE doc_id='D101';


ERROR at line 1:
ORA-20101: UPDATION IS NOT POSSIBLE
ORA-06512: at "RICHU.UPDOCTOR", line 3
ORA-04088: error during execution of trigger 'RICHU.UPDOCTOR'