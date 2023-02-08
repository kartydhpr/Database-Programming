DROP TABLE PART_POPULARITY cascade constraints;

CREATE TABLE PART_POPULARITY (
    PartNumber VARCHAR2(10),
    PartDescription VARCHAR2(50),
    OrderQuantity INT,
    OrderDate DATE,
    ShipmentID VARCHAR2(10)
);

-- Table PART_POPULARITY created.

INSERT INTO PART_POPULARITY
select * from (
    (select PartNumber from InventoryPart FETCH FIRST 5 ROWS ONLY) CROSS JOIN 
    (select PartDescription from InventoryPart FETCH FIRST 5 ROWS ONLY) CROSS JOIN 
    (select OrderQuantity from CustOrderline FETCH FIRST 5 ROWS ONLY) CROSS JOIN 
    (select OrderDate from CustOrder FETCH FIRST 5 ROWS ONLY) CROSS JOIN  
    (select ShipmentID from Shipment FETCH FIRST 5 ROWS ONLY)
);

-- 3,125 rows inserted.


select orderdate, count(*) as "No. of Shipments"
from part_popularity
group by orderdate;

select partdescription, count(*)
from part_popularity
where orderdate = '06-DEC-10'
group by partdescription;


DECLARE
    MOST_SHIPMENTS INTEGER;
    MAX_SHIP_DATE DATE;
    
BEGIN

    select max(count(*)) into most_shipments
    from part_popularity
    group by partdescription;
    
    select max(orderdate) into max_ship_date
    from part_popularity;
        
    DBMS_OUTPUT.PUT_LINE('The maximum number of shipments for the most popular part was '||TO_CHAR(most_shipments)|| ' shipments on '||to_char(max_ship_date)||'.');
END;
