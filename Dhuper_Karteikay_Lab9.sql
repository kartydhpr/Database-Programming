/*
Karteikay (Karty) Dhuper
CNIT372 Lab Section # 007
Estimated Time Spent: 1 hour
Late hours used: 0
*/

SET SERVEROUTPUT ON

-- Question #1a

    CREATE TABLE LAB9_EMPLOYEE 
      AS 
        SELECT * FROM EMPLOYEE;

/* Q1a Query Results

    Table LAB9_EMPLOYEE created.

*/

-- Question 1b

    CREATE OR REPLACE TRIGGER TBDS_LAB9_EMPLOYEE
        BEFORE DELETE ON LAB9_EMPLOYEE
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Trigger fired before deleting anything from LAB9_EMPLOYEE.');
    END;

/* Q1b Query Results
    
   Trigger TBDS_LAB9_EMPLOYEE compiled

   The database object that this trigger is defined on is the TBDS_LAB9_EMPLOYEE.
   The timing of this trigger is before anything is deleted from the table LAB9_EMPLOYEE
   
*/

-- Question 1c

    CREATE OR REPLACE TRIGGER TBDR_LAB9_EMPLOYEE
        BEFORE DELETE ON LAB9_EMPLOYEE
        FOR EACH ROW
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Trigger fired before deleting a row from LAB9_EMPLOYEE.');
    END;
    
/* Q1c Query Results:

   Trigger TBDR_LAB9_EMPLOYEE compiled

   The database object that this trigger is defined on is the TBDR_LAB9_EMPLOYEE.
   The timing of this trigger is before a row is deleted from the table LAB9_EMPLOYEE

*/

-- Question 1d

    CREATE OR REPLACE TRIGGER TADS_LAB9_EMPLOYEE
        AFTER DELETE ON LAB9_EMPLOYEE
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Trigger fired after deleting anything from LAB9_EMPLOYEE.');
    END;
/* 
-- Q1d Query Results

    Trigger TADS_LAB9_EMPLOYEE compiled
    
   The database object that this trigger is defined on is the TADS_LAB9_EMPLOYEE.
   The timing of this trigger is after anything is deleted from the table LAB9_EMPLOYEE.
*/
-- Question 1e

    CREATE OR REPLACE TRIGGER TADR_LAB9_EMPLOYEE
        AFTER DELETE ON LAB9_EMPLOYEE
        FOR EACH ROW
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Trigger fired after deleting a row from LAB9_EMPLOYEE.');
    END;
/* 
-- Q1e Query Results

    Trigger TADR_LAB9_EMPLOYEE compiled
    
   The database object that this trigger is defined on is the TADR_LAB9_EMPLOYEE.
   The timing of this trigger is after a row is deleted from the table LAB9_EMPLOYEE.

*/

-- Question 1f

    DELETE FROM LAB9_EMPLOYEE
    WHERE employeeid LIKE '101135';
        
/* Q1f Query Results

    1 row deleted.

    Trigger fired before deleting anything from LAB9_EMPLOYEE.
    Trigger fired before deleting a row from LAB9_EMPLOYEE.
    Trigger fired after deleting a row from LAB9_EMPLOYEE.
    Trigger fired after deleting anything from LAB9_EMPLOYEE.
    
    Each trigger only fired once. 

*/

-- Question 1g

    ROLLBACK;

/* Q1g Query Results
    
    Rollback complete.

    The data is restored, since running the delete statement after the rollback
    deletes 1 row. This mean that a trigger execution does NOT implictly perform 
    a commit.
    
*/

-- Question 1h

    DELETE FROM LAB9_EMPLOYEE
    WHERE jobtitle LIKE 'Sales';

/* Q1h Query Results

    3 rows deleted.
    
    Trigger fired before deleting anything from LAB9_EMPLOYEE.
    Trigger fired before deleting a row from LAB9_EMPLOYEE.
    Trigger fired after deleting a row from LAB9_EMPLOYEE.
    Trigger fired before deleting a row from LAB9_EMPLOYEE.
    Trigger fired after deleting a row from LAB9_EMPLOYEE.
    Trigger fired before deleting a row from LAB9_EMPLOYEE.
    Trigger fired after deleting a row from LAB9_EMPLOYEE.
    Trigger fired after deleting anything from LAB9_EMPLOYEE.
    
    All the triggers fired. The "delete before and after anything" trigger fired 
    once each. Whereas, the before deleting a row and after deleting a row fired 
    three times for each row deleted.

*/

-- Question 1i

    ROLLBACK;
    
/* Q1i Query Results

    Rollback complete.
    
    The rollback restored all the data to the table as expected.

*/

-- Question 1j

    TRUNCATE TABLE LAB9_EMPLOYEE;
  
/* Q1j Query Results

    Table LAB9_EMPLOYEE truncated.
    
    None of the triggers fired.

*/

-- Question #2a

   -- Before insert anything
    CREATE OR REPLACE TRIGGER TBIS_LAB9_EMPLOYEE
        BEFORE INSERT ON LAB9_EMPLOYEE
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Trigger fired before inserting anything from LAB9_EMPLOYEE.');
    END;
    
   -- Before insert row
    CREATE OR REPLACE TRIGGER TBIR_LAB9_EMPLOYEE
        BEFORE INSERT ON LAB9_EMPLOYEE
        FOR EACH ROW
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Trigger fired before inserting a row from LAB9_EMPLOYEE.');
    END;
    
   -- After insert anything
    CREATE OR REPLACE TRIGGER TAIS_LAB9_EMPLOYEE
        AFTER INSERT ON LAB9_EMPLOYEE
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Trigger fired after inserting anything from LAB9_EMPLOYEE.');
    END;
    
   -- After insert row
    CREATE OR REPLACE TRIGGER TAIR_LAB9_EMPLOYEE
        AFTER INSERT ON LAB9_EMPLOYEE
        FOR EACH ROW
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Trigger fired after inserting a row from LAB9_EMPLOYEE.');
    END;
    

/* Q2a Query Results

    Trigger TBIS_LAB9_EMPLOYEE compiled
    Trigger TBIR_LAB9_EMPLOYEE compiled
    Trigger TAIS_LAB9_EMPLOYEE compiled
    Trigger TAIR_LAB9_EMPLOYEE compiled
    
*/

/* Question 2b:

    I hypothesize that if I insert something all 4 triggers would fire once.
    Since, only one row is inserted both before and after triggers would fire 
    one time each.
    
    The firing sequence would be: 
        before insert anything 
        before insert row 
        after insert anything 
        after insert row
        
*/

-- Question #2c
    INSERT INTO LAB9_EMPLOYEE(employeeid, lastname, firstname, jobtitle)
        VALUES('000002','Dhuper','Karteikay','CEO');
        
/* Q2c Query Results

    1 row inserted.

    Trigger fired before inserting anything from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting anything from LAB9_EMPLOYEE.

    My test supported my hypothesis.
*/

/* Question 2d
    
    I would expect the "before and after insert anything" to fire only once each. 
    However, I would expect the "before and after insert row" triggers to fire 40 
    times each for each row that is inserted into the Lab9_Employee table.

*/

-- Question #2e
    
    INSERT INTO LAB9_EMPLOYEE
      SELECT * FROM EMPLOYEE
      fetch first 40 rows only;


/* Q2e Query Results

   40 rows inserted.

    Trigger fired before inserting anything from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired before inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting a row from LAB9_EMPLOYEE.
    Trigger fired after inserting anything from LAB9_EMPLOYEE.
    
    My test supported my hypothesis. 
*/

-- Question #3a

    CREATE OR REPLACE TRIGGER RESTRICT_UPDATE
        BEFORE UPDATE ON LAB9_EMPLOYEE
        FOR EACH ROW
        WHEN (NEW.emailaddr NOT LIKE '%.com')
    BEGIN
        RAISE_APPLICATION_ERROR(-20001, 'INVALID EMAIL DETECTED');
    END;

/* Q3a Query Results

    Trigger RESTRICT_UPDATE compiled
    
*/
    
-- Question 3b
    
    UPDATE LAB9_EMPLOYEE
        SET emailaddr = 'tester@gmail.com'
        WHERE employeeid like '100001';
    
    UPDATE LAB9_EMPLOYEE
        SET emailaddr = 'tester@purdue.edu'
        WHERE employeeid like '100001';

/* Q3b Query Results:

    1 row updated.
    
    Error starting at line : 369 in command -
    UPDATE LAB9_EMPLOYEE
        SET emailaddr = 'tester@purdue.edu'
        WHERE employeeid like '100001'
    Error report -
    ORA-20001: INVALID EMAIL DETECTED
    ORA-06512: at "KDHUPER.RESTRICT_UPDATE", line 2
    ORA-04088: error during execution of trigger 'KDHUPER.RESTRICT_UPDATE'

*/ 

-- Question #3c

    CREATE OR REPLACE TRIGGER RESTRICT_UPDATE
        BEFORE UPDATE ON LAB9_EMPLOYEE
        FOR EACH ROW
    BEGIN
        if(:NEW.emailaddr NOT LIKE '%.com') then 
            RAISE_APPLICATION_ERROR(-20001, 'INVALID EMAIL DETECTED');
        end if;
    END;

/* Q3c Query Results

    Trigger RESTRICT_UPDATE compiled

*/


-- Question #3d

    UPDATE LAB9_EMPLOYEE
        SET emailaddr = 'tester@gmail.com'
        WHERE employeeid like '100001';
    
    UPDATE LAB9_EMPLOYEE
        SET emailaddr = 'tester@purdue.edu'
        WHERE employeeid like '100001';

/* Q3d Query Results

    1 row updated.

    Error starting at line : 413 in command -
        UPDATE LAB9_EMPLOYEE
            SET emailaddr = 'tester@purdue.edu'
            WHERE employeeid like '100001'
    Error report -
    ORA-20001: INVALID EMAIL DETECTED
    ORA-06512: at "KDHUPER.RESTRICT_UPDATE", line 3
    ORA-04088: error during execution of trigger 'KDHUPER.RESTRICT_UPDATE'

*/

-- Question #4

    DROP TABLE LAB9_EMPLOYEE CASCADE CONSTRAINTS;

/* Q4 Query Results
    
    Table LAB9_EMPLOYEE dropped.

*/