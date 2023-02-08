/*
Karteikay (Karty) Dhuper
CNIT372 Lab Section #007
Estimated Time Spent: 0.5hrs
Late hours used: 0
*/

-- Question #1

select user from dual;

/* Q1 Query Results

USER                                                                                                                            
--------------------------------------------------------------------------------------------------------------------------------
KDHUPER

*/

-- Question #2

select current_timestamp from dual;

/* Q2 Query Results

CURRENT_TIMESTAMP                                           
------------------------------------------------------------
28-AUG-22 09.49.51.148832000 PM AMERICA/INDIANA/INDIANAPOLIS

*/

-- Question #3

select count(customerID) from customer 
where companyname is not null;

/* Q3 Query Results

COUNT(CUSTOMERID)
-----------------
               74

*/

-- Question #4

select count(customerID) from customer
where companyname is null;

/* Q4 Query Results

COUNT(CUSTOMERID)
-----------------
              157

*/

-- Question #5

select count(customerid) from customer
where state = 'IN';

/* Q5 Query Results

COUNT(CUSTOMERID)
-----------------
                4

*/

-- Question #6

select count(customerid) from customer
where state = 'PA' and city = 'Scranton';

/* Q6 Query Results

COUNT(CUSTOMERID)
-----------------
                2

*/

-- Question #7

select customerID, companyname, custlastname, custfirstname, phone, lower(emailaddr) as email
from customer
where state in ('MI', 'IL')
order by custlastname asc;

/* Q7 Query Results

CUSTOMERID COMPANYNAME                              CUSTLASTNAME         CUSTFIRSTNAME   PHONE        EMAIL                                             
---------- ---------------------------------------- -------------------- --------------- ------------ --------------------------------------------------
I-300007                                            Cain                 Jessica         517-901-2610                                                   
C-300023   TAS                                      Dalury               Robert          906-278-6446 tas@zeronet.net                                   
I-300093                                            Hanau                Jay             773-490-8254                                                   
I-300031                                            Hession              Phillip         231-711-6837 howdy@usol.com                                    
C-300024   Bankruptcy Help                          Lichty               Jim             618-847-1904 bankrupt@usol.com                                 
I-300025                                            Miller               Ronald          734-820-2076 picky@zeronet.net                                 
C-300039   Gards Auto Repair                        Sammons              Dennis          616-544-1969 repairit@free.com                                 
I-300038                                            Smith                David           309-980-4350 emerald@onlineservice.com                         
I-300052                                            Yelnick              Andrew          517-803-5818 family@free.com                                   

9 rows selected. 

*/

-- Question #8

select customerID, custlastname || ', ' || custfirstname as cust_name, phone from customer
where state = 'OH' and companyname is null;

/* Q8 Query Results

CUSTOMERID CUST_NAME                             PHONE       
---------- ------------------------------------- ------------
I-300094   Schuman, Joseph                       330-209-1273
I-300119   Skadberg, John                        513-282-3919
I-300003   Hague, Carl                           419-890-3531
I-300039   Chang, David                          740-750-1272
I-300045   Kempf, Gary                           937-724-7313

*/

-- Question #9

select customerID, substr(custfirstname, 1, 1) || '. ' || custlastname as cust_name, phone, lower(emailaddr) as email
from customer 
where state in ('IN', 'OH') and companyname is null
order by custlastname desc;

/* Q9 Query Results

CUSTOMERID CUST_NAME               PHONE        EMAIL                                             
---------- ----------------------- ------------ --------------------------------------------------
I-300147   S. Yaun                 317-780-9804 yawn@fast.com                                     
I-300119   J. Skadberg             513-282-3919 skad@zeronet.net                                  
I-300094   J. Schuman              330-209-1273                                                   
I-300030   E. Quintero             812-805-1588 diamond@onlineservice.com                         
I-300045   G. Kempf                937-724-7313 kempfg@free.com                                   
I-300003   C. Hague                419-890-3531                                                   
I-300039   D. Chang                740-750-1272 lion@free.com                                     

7 rows selected. 

*/

-- Question #10

select count(distinct(customerID)) from customer
where state = 'OH' and companyname is not null;

/* Q10 Query Results

COUNT(DISTINCT(CUSTOMERID))
---------------------------
                          2                              

*/

-- Question #11

select companyname, count(address) from customer
where state in ('IN', 'IL') and companyname is not null
group by companyname
order by companyname;

/* Q11 Query Results

COMPANYNAME                              COUNT(ADDRESS)
---------------------------------------- --------------
Baker and Company                                     1
Bankruptcy Help                                       1
R and R Air                                           1                         

*/

-- Question #12

select customerID, companyname, custfirstname || ' ' || custlastname as cust_name, phone
from customer
where state = 'CO'
order by phone;

/* Q12 Query Results

CUSTOMERID COMPANYNAME                              CUST_NAME                            PHONE       
---------- ---------------------------------------- ------------------------------------ ------------
C-300031   Copy Center                              Allen Robles                         644-730-8090
I-300049                                            Paul Rice                            719-541-1837
I-300141                                            Daniel Rodkey                        719-748-3205
C-300041   Laser Graphics Associates                Paul Kaakeh                          719-750-4539
I-300021                                            Matt Smith                           719-822-8828
I-300061                                            Brenda Jones                         720-800-2638
I-300043                                            Carey Dailey                         728-896-2767
I-300073                                            Dean Eagon                           970-581-8611
I-300078                                            Andrea Griswold                      970-746-0995

9 rows selected.                             

*/