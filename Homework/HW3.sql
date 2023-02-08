-- QA.1. 

    CREATE TABLE Cust_Audit(
        Transaction varchar2(10) CHECK(Transaction in('SELECT', 'UPDATE', 'DELETE', 'INSERT')),
        NumRows INTEGER,
        Timestamp date,
        Userid varchar(10),
        Description varchar2(99),
        CONSTRAINT CUST_ORDER_PK PRIMARY KEY (USERID),
        CONSTRAINT CUST_ORDER_FK FOREIGN KEY (USERID)
            REFERENCES USER (USERID)
    );
    rollback;
-- QA.2.
<your answer>

-- QC.1. Problem Background
    -- Adam is a sales strategist for a company. One of his many responsibilities is to keep track of orders placed by customers and make sales decisions accordingly. 

-- QC.2. Overall Problem 
    -- Write a trigger alerts the user when any update and deletion takes place on the Part_Popularity table but not on each row as one modification would chanfe multiple coloumns.

-- QC.3. Example Table
/*
    Table Name: PART_POPULARITY
    Table Specification:
      PartNumber  (String)
      PartDescription (String)
      OrderQuantity  (Integer)
      OrderDate  (Date)
      ShipmentID (String)
*/

-- Query for create and populate the example table:
    CREATE TABLE PART_POPULARITY (
      PartNumber VARCHAR2(10),
      PartDescription VARCHAR2(50),
      OrderQuantity INT,
      OrderDate DATE,
      ShipmentID VARCHAR2(10)
    );
    
    INSERT INTO PART_POPULARITY
    select * from (
      (select PartNumber from InventoryPart FETCH FIRST 5 			ROWS ONLY) CROSS JOIN 
      (select PartDescription from InventoryPart FETCH FIRST 5 ROWS ONLY) CROSS JOIN 
      (select OrderQuantity from CustOrderline FETCH FIRST 5 ROWS ONLY) CROSS JOIN 
      (select OrderDate from CustOrder FETCH FIRST 5 ROWS ONLY) CROSS JOIN 
      (select ShipmentID from Shipment FETCH FIRST 5 ROWS ONLY)
    );

-- QC.4. Key steps to solve the overall problem
/* 
Step 1: 
    Declare a trigger named pop_part_trigger that 
    fires after each row is updated or deleted in the part_popularity table
*/

/* 
Step 2: 
    Add a print statement inside the trigger body to alert the user that something was updated/deleted from the part_popularity table.
*/

/* 
Step 3: 
    Test the trigger
*/

-- QC.5. Answers to each step
-- Step 1. 
    CREATE OR REPLACE TRIGGER part_pop_trigger
        AFTER UPDATE OR DELETE ON part_popularity
    BEGIN
        -- Leave empty for now
    END;
-- Step 2. 
    CREATE OR REPLACE TRIGGER part_pop_trigger
        AFTER UPDATE OR DELETE ON part_popularity 
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Trigger fired after a row was updated/deleted from part_popularity');
    END;
-- Step 3.
    DELETE FROM part_popularity
    WHERE PartNumber LIKE 'ADT-002';
/*    
    1,250 rows deleted.
    Trigger fired after a row was updated/deleted from part_popularity
*/
    