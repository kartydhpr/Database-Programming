/*
Karteikay (Karty) Dhuper
CNIT372 Lab Section # 007
Estimated Time Spent: 7 hrs total over the week
Late hours used: 0
*/

-- Question #1
	select ip.partnumber, ip.partdescription, round(avg(col.orderquantity),1) as "Average Quantity"
	from category c inner join inventorypart ip 
	on c.categoryid = ip.categoryid
	inner join custorderline col
	on ip.partnumber = col.partnumber
	where c.categoryid like '%ACCESS%'
	group by ip.partnumber, ip.partdescription
	order by avg(col.orderquantity) desc;

/* Q1 Query Results
	
    PARTNUMBER PARTDESCRIPTION                                    Average Quantity
    ---------- -------------------------------------------------- ----------------
    MOD-001    PCI DATA/FAX/VOICE MODEM                                        8.3
    MOD-002    112K DUAL MODEM                                                 5.1
    PRT-006    SINGLEHEAD THERMAL INKJET PRINTER                               3.8
    PRT-004    3-IN-1 COLOR INKJET PRINTER                                     3.6
    SCN-002    SCANJET BUSINESS SERIES COLOR SCANNER                           3.5
    PRT-003    LASER JET 2500SE                                                3.4
    MOD-005    V.90/K56 FLEX 56K FAX MODEM                                     3.1
    PRT-001    LASER JET 1999SE                                                2.9
    MOD-003    PCI MODEM                                                       2.4
    PRT-002    LASER JET 2000SE                                                2.3
    SCN-001    SCANJET CSE COLOR SCANNER                                       1.8
    
    PARTNUMBER PARTDESCRIPTION                                    Average Quantity
    ---------- -------------------------------------------------- ----------------
    MOD-004    PCI V.90 DATA/FAX/VOICE MODEM                                   1.6
    
    12 rows selected.  

*/

-- Question #2
	select to_char(co.orderdate, 'MM' ) as "MM", to_char(co.orderdate, 'YYYY' ) as "YYYY",  round(avg(col.orderquantity),1) as "average quantity"
	from custorderline col inner join custorder co 
	on col.orderid = co.orderid
	where col.partnumber like '%DVD-001%' 
    group by to_char(co.orderdate, 'MM' ), to_char(co.orderdate, 'YYYY' )
	order by to_char(co.orderdate, 'YYYY'), to_char(co.orderdate, 'MM');


/* Q2 Query Results
    
    MM YYYY average quantity
    -- ---- ----------------
    07 2010              1.5
    09 2010                4
    10 2010                1
    11 2010                2
    12 2010                1
    01 2011                1
    02 2011                8
    03 2011                1
    
    8 rows selected. 

*/

/* Question 2b

    The average quanitiy modally was at 1 but had periods in which it went higher
    like in 09/2010 when it shot up to 4, then again in 02/2011 it rose to 8. There
    was also a period in 11/2010 when it rose to 2. However for the most part it
    plateaus at 1 average order quantity. This could potentially be a business 
    that booms during the valentine season.

*/

-- Question #3

	select (to_char(co.orderdate, 'MM') ||'-'|| to_char(co.orderdate, 'YYYY')) as "Date",  round(sum(col.orderquantity),1) as "avg quantity"
	from custorder co inner join custorderline col 
	on co.orderid = col.orderid
	where col.partnumber like '%DVD-001%' 
    group by to_char(co.orderdate, 'MM'), to_char(co.orderdate, 'YYYY')
    order by to_char(co.orderdate, 'YYYY'), to_char(co.orderdate, 'MM');


/* Q3 Query Results

    Date    avg quantity
    ------- ------------
    07-2010            3
    09-2010           12
    10-2010            1
    11-2010            4
    12-2010            3
    01-2011            1
    02-2011           16
    03-2011            1
    
    8 rows selected. 

*/

/* Question 3b

    I would procure more of the DVD in September of 2011 and keep production high
    for the last two months to account for the spikes in those months in particular.
    October and January would not require as much DVD to be procured.

*/

-- Question #4

    select to_char(co.orderdate, 'MM' ) as "MM", to_char(co.orderdate, 'YYYY' ) as "YYYY",  count(orderquantity) as "number of orders placed"
	from custorderline col inner join custorder co 
	on col.orderid = co.orderid
	where col.partnumber like '%DVD-001%' 
    group by to_char(co.orderdate, 'MM' ), to_char(co.orderdate, 'YYYY' )
	order by to_char(co.orderdate, 'YYYY'), to_char(co.orderdate, 'MM'); 
    
/* Q4 Query Results

    MM YYYY number of orders placed
    -- ---- -----------------------
    07 2010                       2
    09 2010                       3
    10 2010                       1
    11 2010                       2
    12 2010                       3
    01 2011                       1
    02 2011                       2
    03 2011                       1
    
    8 rows selected. 

*/

/* Question 5A:

    Question 2 illustrates the average number quantity that was ordered for 
    DVD-001 and the subsequent month and year it was ordered in.
    Question 3 illustrates the total quantity that was ordered in that specific 
    date for all DVD-001 orders.
    Question 4 illustrates the amount of times that orders were placed for DVD-001
    in a specific month.

   Question 5B:
   
   It seems from question 2-4, the few people that are procuring the dvd seem to 
   be ordering more of it in September of 2010 and February of 2011.
   
   Question 5C:
   
   The answers from 2 and 3 seem to support each other because the spikes seem 
   to be reflected in both of them. Question 4 seems to conflict with them but this
   doensn't make the data any less credible/accurate.

*/

-- Question #6

    select s.orderid, ps.shipmentid, ps.packagenumber, ps.shippeddate, s.shipname, s.shipaddress
    from shipment s inner join packingslip ps 
    on s.shipmentid = ps.shipmentid
    where s.orderid like '%2000000007%';


/* Q6 Query Results

    ORDERID    SHIPMENTID PACKAGENUMBER SHIPPEDDA SHIPNAME             SHIPADDRESS                             
    ---------- ---------- ------------- --------- -------------------- ----------------------------------------
    2000000007 H003                   1 05-JUL-10 Evelyn Cassens       6094 Pearson Ave.                       
    2000000007 H003                   2 05-JUL-10 Evelyn Cassens       6094 Pearson Ave.                       
    2000000007 H003                   3 05-JUL-10 Evelyn Cassens       6094 Pearson Ave.   

*/

/* Question 6B

    Query 6 displays the shipment id, package number, shipped date and the name 
    and address of the person that initiated order id 2000000007. It shows that 
    Evelyn Cassens ordered three differnet packages under one order that shpped 
    on the same date.
*/

-- Question #7
    select (c.custlastname ||','|| c.custfirstname) as "Name", c.customerid, co.orderid
    from customer c left join custorder co
    on c.customerid = co.customerid
    where companyname is null and state like '%PA%';

/* Q7 Query Results

    Name                                 CUSTOMERID ORDERID   
    ------------------------------------ ---------- ----------
    Wolfe,Thomas                         I-300149   2000000497
    Wolfe,Thomas                         I-300149   2001000670
    Wolfe,Thomas                         I-300149   2001000736
    Wolfe,Thomas                         I-300149   2001000751
    Wolfe,Thomas                         I-300149   2001000768
    Kaleta,Don                           I-300028             
    
    6 rows selected. 

*/

-- Question #7b

    select (c.custlastname ||','|| c.custfirstname) as "Name", c.customerid, co.orderid
    from customer c right join custorder co
    on c.customerid = co.customerid
    where companyname is null and state like '%PA%';

/* Q7b Query Results

    Name                                 CUSTOMERID ORDERID   
    ------------------------------------ ---------- ----------
    Wolfe,Thomas                         I-300149   2000000497
    Wolfe,Thomas                         I-300149   2001000670
    Wolfe,Thomas                         I-300149   2001000736
    Wolfe,Thomas                         I-300149   2001000751
    Wolfe,Thomas                         I-300149   2001000768
    
*/

-- Question #8
    select partnumber, categoryname
    from category c full join inventorypart ip
    on c.categoryid = ip.categoryid


/* Q8 Query Results

    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    ADT-001    Storage                       
    ADT-002    Cables                        
    ADT-003    Cables                        
    ADT-004    Cables                        
    ADT-005    Cables                        
    ADT-006    Cables                        
    ADT-007    Cables                        
    BB-001     Basics                        
    BB-002     Basics                        
    BB-003     Basics                        
    BB-004     Basics                        
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    BB-005     Basics                        
    BRK-001    Cables                        
    BRK-002    Cables                        
    BRK-003    Cables                        
    BRK-004    Cables                        
    BRK-005    Cables                        
    BRK-006    Cables                        
    BRK-007    Cables                        
    BRK-008    Cables                        
    BRK-009    Cables                        
    BRK-010    Cables                        
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    BRK-011    Cables                        
    C-001      Basics                        
    C-002      Basics                        
    C-003      Basics                        
    CAB-001    Cables                        
    CAB-002    Cables                        
    CAB-003    Cables                        
    CAB-004    Cables                        
    CAB-005    Cables                        
    CAB-006    Cables                        
    CAB-007    Cables                        
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    CAB-008    Cables                        
    CAB-009                                  
    CAB-010                                  
    CAB-011                                  
    CAB-012                                  
    CAB-013                                  
    CAB-014                                  
    CAB-015                                  
    CAB-016                                  
    CAB-017                                  
    CAB-018                                  
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    CAB-019                                  
    CAB-020                                  
    CAB-021                                  
    CAB-022                                  
    CAB-023                                  
    CAB-024                                  
    CAB-025                                  
    CAB-026                                  
    CAB-027                                  
    CAB-028                                  
    CD-001     Storage                       
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    CD-002     Storage                       
    CD-003     Storage                       
    CD-004     Storage                       
    CF-001     Processors                    
    CF-002     Processors                    
    CF-003     Processors                    
    CF-004     Processors                    
    CF-005     Processors                    
    CF-006     Processors                    
    CF-007     Processors                    
    CF-008     Processors                    
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    CF-009     Processors                    
    CRD-001                                  
    CRD-002                                  
    CRD-003                                  
    CRD-004                                  
    CRD-005                                  
    CRD-006                                  
    CRD-007                                  
    CRD-008                                  
    CRD-009                                  
    CTR-001    Computers                     
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    CTR-002    Computers                     
    CTR-003    Computers                     
    CTR-004    Computers                     
    CTR-005    Computers                     
    CTR-006    Computers                     
    CTR-007    Computers                     
    CTR-008    Computers                     
    CTR-009    Computers                     
    CTR-010    Computers                     
    CTR-011    Computers                     
    CTR-012    Computers                     
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    CTR-013    Computers                     
    CTR-014    Computers                     
    CTR-015    Computers                     
    CTR-016    Computers                     
    CTR-017    Computers                     
    CTR-018    Computers                     
    CTR-019    Computers                     
    CTR-020    Computers                     
    CTR-021    Computers                     
    CTR-022    Computers                     
    CTR-023    Computers                     
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    CTR-024    Computers                     
    CTR-025    Computers                     
    CTR-026    Computers                     
    CTR-027    Computers                     
    CTR-028    Computers                     
    CTR-029    Computers                     
    DVD-001    Storage                       
    DVD-002    Storage                       
    ICAB-001   Cables                        
    ICAB-002   Cables                        
    ICAB-003   Cables                        
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    ICAB-004   Cables                        
    ICAB-005   Cables                        
    ICAB-006   Cables                        
    ICAB-007   Cables                        
    ICAB-008   Cables                        
    KEY-001    Basics                        
    KEY-002    Basics                        
    KEY-003    Basics                        
    KEY-004    Basics                        
    KEY-005    Basics                        
    KEY-006    Basics                        
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    KEY-007    Basics                        
    KEY-008    Basics                        
    KEY-009    Basics                        
    MEM-001    Storage                       
    MEM-002    Storage                       
    MEM-003    Storage                       
    MEM-004    Storage                       
    MEM-005    Storage                       
    MEM-006    Storage                       
    MEM-007    Storage                       
    MEM-008    Storage                       
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    MEM-009    Storage                       
    MEM-010    Storage                       
    MEM-011    Storage                       
    MEM-012    Storage                       
    MIC-001    Basics                        
    MIC-002    Basics                        
    MIC-003    Basics                        
    MIC-004    Basics                        
    MIC-005    Basics                        
    MIC-006    Basics                        
    MIC-007    Basics                        
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    MIC-008    Basics                        
    MIC-009    Basics                        
    MIC-010    Basics                        
    MIC-011    Basics                        
    MIC-012    Basics                        
    MOD-001    Accessories                   
    MOD-002    Accessories                   
    MOD-003    Accessories                   
    MOD-004    Accessories                   
    MOD-005    Accessories                   
    MOM-001    Basics                        
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    MOM-002    Basics                        
    MOM-003    Basics                        
    MOM-004    Basics                        
    MON-001    Basics                        
    MON-002    Basics                        
    MON-003    Basics                        
    MON-004    Basics                        
    MON-005    Basics                        
    MON-006    Basics                        
    MON-007    Basics                        
    MON-008    Basics                        
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    P-001      Processors                    
    P-002      Processors                    
    P-003      Processors                    
    P-004      Processors                    
    P-005      Processors                    
    P-006      Processors                    
    P-007      Processors                    
    P-008      Processors                    
    P-009      Processors                    
    P-010      Processors                    
    POW-001    Cables                        
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    POW-002    Cables                        
    POW-003    Cables                        
    PRT-001    Accessories                   
    PRT-002    Accessories                   
    PRT-003    Accessories                   
    PRT-004    Accessories                   
    PRT-005    Accessories                   
    PRT-006    Accessories                   
    PS-001     Power                         
    PS-002     Power                         
    PS-003     Power                         
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    PS-004     Power                         
    SCN-001    Accessories                   
    SCN-002    Accessories                   
    SCN-003    Accessories                   
    SFT-001    Software                      
    SFT-002    Software                      
    SFT-003    Software                      
    SFT-004    Software                      
    SFT-005    Software                      
    SFT-006    Software                      
    SFT-007    Software                      
    
    PARTNUMBER CATEGORYNAME                  
    ---------- ------------------------------
    SFT-008    Software                      
    SFT-009    Software                      
    SP-001     Basics                        
    SP-002     Basics                        
    SP-003     Basics                        
               Tablets                       
    
    204 rows selected. 

*/

-- Question #9

    select (c.custfirstname ||' '|| c.custlastname) as "Name", co.customerid, co.orderdate, ps.shipmentid, ps.packagenumber, s.shipname, ps.shippeddate
    from customer c inner join custorder co 
    on c.customerid = co.customerid
    left join shipment s 
    on co.orderid = s.orderid
    left join packingslip ps 
    on s.shipmentid = ps.shipmentid
    where co.orderid like '%2001000807%';

/* Q9 Query Results

    Name                                 CUSTOMERID ORDERDATE SHIPMENTID PACKAGENUMBER SHIPNAME             SHIPPEDDA
    ------------------------------------ ---------- --------- ---------- ------------- -------------------- ---------
    Cecil Scheetz                        C-300003   31-MAR-11                          Cecil Scheetz                 

*/

-- Question #9b

    select (c.custfirstname ||' '|| c.custlastname) as "Name", co.customerid, co.orderdate, s.shipmentid, s.shipname
    from customer c inner join custorder co 
    on c.customerid = co.customerid
    left join shipment s 
    on co.orderid = s.orderid
    left join packingslip ps 
    on s.shipmentid = ps.shipmentid
    where ps.shippeddate is null;

/* Q9b Query Results

    Name                                 CUSTOMERID ORDERDATE SHIPMENTID SHIPNAME            
    ------------------------------------ ---------- --------- ---------- --------------------
    Verna McGrew                         I-300069   27-MAR-11 L257       Verna McGrew        
    Charles Jones                        I-300087   30-MAR-11 L260       Charles Jones       
    Zack Hill                            I-300120   23-FEB-11 M129       Zack Hill           
    Mary Jo Wales                        I-300125   30-MAR-11 L261       Mary Jo Wales       
    Tom Baker                            I-300134   29-MAR-11 L259       Tom Baker           
    Daniel Rodkey                        I-300141   31-MAR-11 L262       Daniel Rodkey       
    Steven Yaun                          I-300147   27-MAR-11 L258       Michelle Oakley     
    Andy Huegel                          I-300151   31-MAR-11 M162       Andy Huegel         
    Phil Reece                           I-300154   29-MAR-11 M159       Phil Reece          
    Cecil Scheetz                        C-300003   31-MAR-11 H384       Cecil Scheetz       
    Larry Osmanova                       C-300026   30-MAR-11 H382       Larry Osmanova      
    
    Name                                 CUSTOMERID ORDERDATE SHIPMENTID SHIPNAME            
    ------------------------------------ ---------- --------- ---------- --------------------
    Archie Doremski                      C-300032   29-MAR-11 H380       Archie Doremski     
    Marjorie Vandermay                   C-300045   31-MAR-11 H383       Marjorie Vandermay  
    Orville Gilliland                    C-300069   30-MAR-11 H381       Orville Gilliland   
    Shirley Osborne                      I-300013   30-MAR-11 M161       Shirley Osborne     
    Karen Mangus                         I-300015   29-MAR-11 M160       Karen Mangus        
    Joan Hedden                          I-300024   01-MAR-11 M137       Joan Hedden         
    Louise Cool                          I-300044   13-MAR-11 M147       Louise Cool         
    
    18 rows selected. 

*/

-- Question #10
    select distinct customerid 
    from customer 
    where state like '%PA%'
    INTERSECT 
    select distinct customerid 
    from custorder;

/* Q10 Query Results
    
    CUSTOMERID
    ----------
    C-300006
    C-300040
    C-300062
    I-300149
    
*/

-- Question #10b

    select distinct customerid 
    from customer 
    where state like '%PA%'
    MINUS 
    select distinct customerid 
    from custorder;

/* Q10b Query Results

    CUSTOMERID
    ----------
    I-300028

*/

-- Question #10c

    select distinct customerid 
    from customer 
    where state like '%PA%'
    INTERSECT 
    select distinct customerid 
    from custorder
    where to_char(orderdate, 'YYYY') like '2011';

/* Q10c Query Results

    CUSTOMERID
    ----------
    C-300006
    C-300040
    I-300149

*/

-- Question #10d

    select distinct customerid 
    from customer 
    where state like '%PA%'
    MINUS 
    select distinct customerid 
    from custorder
    where to_char(orderdate, 'YYYY') like '2011';
    
/* Q10d Query Results

    CUSTOMERID
    ----------
    C-300062
    I-300028
*/

-- Question #11

    select distinct partnumber
    from inventorypart
    where categoryid like '%CAB%'
    INTERSECT
    select distinct partnumber
    from custorderline;

/* Q11 Query Results
    
    PARTNUMBER
    ----------
    ADT-003
    ADT-004
    ADT-005
    ADT-006
    ADT-007
    BRK-001
    BRK-002
    BRK-003
    BRK-004
    BRK-005
    BRK-007
    
    PARTNUMBER
    ----------
    BRK-008
    BRK-009
    BRK-010
    BRK-011
    CAB-001
    CAB-003
    CAB-005
    CAB-006
    CAB-007
    CAB-008
    ICAB-001
    
    PARTNUMBER
    ----------
    ICAB-002
    ICAB-003
    ICAB-004
    ICAB-005
    ICAB-006
    ICAB-007
    ICAB-008
    POW-002
    POW-003
    
    31 rows selected. 

*/

-- Question #11b

    select distinct partnumber
    from inventorypart
    where categoryid like '%CAB%'
    MINUS
    select distinct partnumber
    from custorderline;

/* Q11b Query Results

    PARTNUMBER
    ----------
    ADT-002
    BRK-006
    CAB-002
    CAB-004
    POW-001
    
*/

-- Question #11c

    select distinct partnumber
    from inventorypart
    where categoryid like '%CAB%'
    INTERSECT
    select distinct partnumber
    from custorderline
    where orderid in (select orderid from custorder where cast(to_char(orderdate, 'YYYY') as Int) >= 2010);


/* Q11c Query Results
    
    PARTNUMBER
    ----------
    ADT-003
    ADT-004
    ADT-005
    ADT-006
    ADT-007
    BRK-001
    BRK-002
    BRK-003
    BRK-004
    BRK-005
    BRK-007
    
    PARTNUMBER
    ----------
    BRK-008
    BRK-009
    BRK-010
    BRK-011
    CAB-001
    CAB-003
    CAB-005
    CAB-006
    CAB-007
    CAB-008
    ICAB-001
    
    PARTNUMBER
    ----------
    ICAB-002
    ICAB-003
    ICAB-004
    ICAB-005
    ICAB-006
    ICAB-007
    ICAB-008
    POW-002
    POW-003
    
    31 rows selected. 

*/

-- Question #11d

    select distinct partnumber
    from inventorypart
    where categoryid like '%CAB%'
    MINUS
    select distinct partnumber
    from custorderline
    where orderid in (select orderid from custorder where cast(to_char(orderdate, 'YYYY') as Int) >= 2010);

/* Q11d Query Results

    PARTNUMBER
    ----------
    ADT-002
    BRK-006
    CAB-002
    CAB-004
    POW-001

*/

-- Question #12

    select distinct custfirstname, custlastname
    from customer
    where state like '%FL%'
    UNION
    select distinct firstname, lastname
    from employee
    order by custfirstname asc, custlastname asc;
    


/* Q12 Query Results

    CUSTFIRSTNAME   CUSTLASTNAME        
    --------------- --------------------
    Allison         Roland              
    Austin          Ortman              
    Beth            Zobitz              
    Calie           Zollman             
    Charles         Jones               
    David           Deppe               
    David           Keck                
    Edna            Lilley              
    Gabrielle       Stevenson           
    Gary            German              
    Gregory         Hettinger           
    
    CUSTFIRSTNAME   CUSTLASTNAME        
    --------------- --------------------
    Jack            Barrick             
    Jack            Brose               
    Jamie           Osman               
    Jason           Krasner             
    Jason           Wendling            
    Jim             Manaugh             
    Joanne          Rosner              
    Joseph          Platt               
    Karen           Mangus              
    Kathleen        Xolo                
    Kathryn         Deagen              
    
    CUSTFIRSTNAME   CUSTLASTNAME        
    --------------- --------------------
    Kathy           Gunderson           
    Kelly           Jordan              
    Kristen         Gustavel            
    Kristey         Moore               
    Kristy          Moore               
    Laura           Rodgers             
    Marla           Reeder              
    Meghan          Tyrie               
    Melissa         Alvarez             
    Michael         Abbott              
    Michael         Emore               
    
    CUSTFIRSTNAME   CUSTLASTNAME        
    --------------- --------------------
    Michelle        Nairn               
    Nicholas        Albregts            
    Patricha        Underwood           
    Paul            Eckelman            
    Phil            Reece               
    Rita            Bush                
    Ronald          Day                 
    Ryan            Stahley             
    Sherman         Cheswick            
    Steve           Cochran             
    Steve           Hess                
    
    CUSTFIRSTNAME   CUSTLASTNAME        
    --------------- --------------------
    Steven          Hickman             
    Tina            Yates               
    Todd            Vigus               
    
    47 rows selected. 

*/

-- Question #12b

    select custfirstname, custlastname
    from customer
    where state like '%FL%'
    UNION ALL
    select firstname, lastname
    from employee
    order by custfirstname asc, custlastname asc;

/* Q12b Query Results

    CUSTFIRSTNAME   CUSTLASTNAME        
    --------------- --------------------
    Allison         Roland              
    Allison         Roland              
    Austin          Ortman              
    Beth            Zobitz              
    Calie           Zollman             
    Charles         Jones               
    Charles         Jones               
    David           Deppe               
    David           Keck                
    Edna            Lilley              
    Gabrielle       Stevenson           
    
    CUSTFIRSTNAME   CUSTLASTNAME        
    --------------- --------------------
    Gary            German              
    Gregory         Hettinger           
    Jack            Barrick             
    Jack            Brose               
    Jamie           Osman               
    Jason           Krasner             
    Jason           Wendling            
    Jim             Manaugh             
    Jim             Manaugh             
    Joanne          Rosner              
    Joseph          Platt               
    
    CUSTFIRSTNAME   CUSTLASTNAME        
    --------------- --------------------
    Karen           Mangus              
    Kathleen        Xolo                
    Kathryn         Deagen              
    Kathy           Gunderson           
    Kelly           Jordan              
    Kristen         Gustavel            
    Kristey         Moore               
    Kristy          Moore               
    Laura           Rodgers             
    Marla           Reeder              
    Meghan          Tyrie               
    
    CUSTFIRSTNAME   CUSTLASTNAME        
    --------------- --------------------
    Melissa         Alvarez             
    Michael         Abbott              
    Michael         Emore               
    Michelle        Nairn               
    Nicholas        Albregts            
    Patricha        Underwood           
    Paul            Eckelman            
    Phil            Reece               
    Phil            Reece               
    Rita            Bush                
    Ronald          Day                 
    
    CUSTFIRSTNAME   CUSTLASTNAME        
    --------------- --------------------
    Ryan            Stahley             
    Ryan            Stahley             
    Sherman         Cheswick            
    Steve           Cochran             
    Steve           Hess                
    Steven          Hickman             
    Tina            Yates               
    Todd            Vigus               
    
    52 rows selected. 

*/

-- Question #13

    select (c.custfirstname ||' '|| c.custlastname ||', '|| 'Residential' ) as "Name", c.customerid, co.orderid, co.orderdate
    from customer c inner join custorder co
    on c.customerid = co.customerid
    where state like '%PA%' and c.companyname is null
    UNION
    select (c.custfirstname ||' '|| c.custlastname ||', '||c.companyname) as "Name", c.customerid, co.orderid, co.orderdate
    from customer c inner join custorder co
    on c.customerid = co.customerid
    where state like '%PA%' and c.companyname is not null
    order by customerid, orderid;

/* Q13 Query Results

    Name                                                                           CUSTOMERID ORDERID    ORDERDATE
    ------------------------------------------------------------------------------ ---------- ---------- ---------
    George Purcell, BMA Advertising Design                                         C-300006   2000000050 26-JUL-10
    George Purcell, BMA Advertising Design                                         C-300006   2000000083 10-AUG-10
    George Purcell, BMA Advertising Design                                         C-300006   2000000110 20-AUG-10
    George Purcell, BMA Advertising Design                                         C-300006   2000000130 27-AUG-10
    George Purcell, BMA Advertising Design                                         C-300006   2000000355 01-DEC-10
    George Purcell, BMA Advertising Design                                         C-300006   2001000643 17-FEB-11
    George Purcell, BMA Advertising Design                                         C-300006   2001000729 07-MAR-11
    Mildred Jones, Computer Consultants                                            C-300040   2000000012 06-JUL-10
    Mildred Jones, Computer Consultants                                            C-300040   2000000284 02-NOV-10
    Mildred Jones, Computer Consultants                                            C-300040   2001000721 03-MAR-11
    Mildred Jones, Computer Consultants                                            C-300040   2001000782 23-MAR-11
    
    Name                                                                           CUSTOMERID ORDERID    ORDERDATE
    ------------------------------------------------------------------------------ ---------- ---------- ---------
    Scott Gray, Security Installation                                              C-300062   2000000361 01-DEC-10
    Scott Gray, Security Installation                                              C-300062   2000000421 10-DEC-10
    Scott Gray, Security Installation                                              C-300062   2000000440 14-DEC-10
    Scott Gray, Security Installation                                              C-300062   2000000496 17-DEC-10
    Thomas Wolfe, Residential                                                      I-300149   2000000497 17-DEC-10
    Thomas Wolfe, Residential                                                      I-300149   2001000670 23-FEB-11
    Thomas Wolfe, Residential                                                      I-300149   2001000736 08-MAR-11
    Thomas Wolfe, Residential                                                      I-300149   2001000751 13-MAR-11
    Thomas Wolfe, Residential                                                      I-300149   2001000768 20-MAR-11
    
    20 rows selected. 

*/

-- Question #13b

    select (c.custfirstname ||' '|| c.custlastname ||', '||c.companyname) as "Name", c.customerid, co.orderid, co.orderdate
    from customer c inner join custorder co
    on c.customerid = co.customerid
    where state like '%PA%' and c.companyname is not null
    order by customerid, orderid;

    select (c.custfirstname ||' '|| c.custlastname ||', '|| 'Residential' ) as "Name", c.customerid, co.orderid, co.orderdate
    from customer c inner join custorder co
    on c.customerid = co.customerid
    where state like '%PA%' and c.companyname is null;

/* Q13b Query Results
    
    Name                                                                           CUSTOMERID ORDERID    ORDERDATE
    ------------------------------------------------------------------------------ ---------- ---------- ---------
    George Purcell, BMA Advertising Design                                         C-300006   2000000050 26-JUL-10
    George Purcell, BMA Advertising Design                                         C-300006   2000000083 10-AUG-10
    George Purcell, BMA Advertising Design                                         C-300006   2000000110 20-AUG-10
    George Purcell, BMA Advertising Design                                         C-300006   2000000130 27-AUG-10
    George Purcell, BMA Advertising Design                                         C-300006   2000000355 01-DEC-10
    George Purcell, BMA Advertising Design                                         C-300006   2001000643 17-FEB-11
    George Purcell, BMA Advertising Design                                         C-300006   2001000729 07-MAR-11
    Mildred Jones, Computer Consultants                                            C-300040   2000000012 06-JUL-10
    Mildred Jones, Computer Consultants                                            C-300040   2000000284 02-NOV-10
    Mildred Jones, Computer Consultants                                            C-300040   2001000721 03-MAR-11
    Mildred Jones, Computer Consultants                                            C-300040   2001000782 23-MAR-11
    
    Name                                                                           CUSTOMERID ORDERID    ORDERDATE
    ------------------------------------------------------------------------------ ---------- ---------- ---------
    Scott Gray, Security Installation                                              C-300062   2000000361 01-DEC-10
    Scott Gray, Security Installation                                              C-300062   2000000421 10-DEC-10
    Scott Gray, Security Installation                                              C-300062   2000000440 14-DEC-10
    Scott Gray, Security Installation                                              C-300062   2000000496 17-DEC-10
    
    15 rows selected. 
    
    Name                                              CUSTOMERID ORDERID    ORDERDATE
    ------------------------------------------------- ---------- ---------- ---------
    Thomas Wolfe, Residential                         I-300149   2000000497 17-DEC-10
    Thomas Wolfe, Residential                         I-300149   2001000670 23-FEB-11
    Thomas Wolfe, Residential                         I-300149   2001000736 08-MAR-11
    Thomas Wolfe, Residential                         I-300149   2001000751 13-MAR-11
    Thomas Wolfe, Residential                         I-300149   2001000768 20-MAR-11

*/

-- Question #14

    -- uncomment below line to drop table before running the query for question 14 
    -- drop table lab2_contact cascade constraints

    create table Lab2_CONTACT as select distinct custfirstname, lastName.custlastname, location.city, location.state
                                 from customer
                                 cross join (select custlastname from customer) lastName
                                 cross join (select city, state from customer) location;

    -- this will count everything in the table                             
    select count(*) 
    from lab2_contact;

/* Q14 Query Results

    Table LAB2_CONTACT created.
    
    
      COUNT(*)
    ----------
       8040340
*/

-- Question #14b

    select distinct count(custfirstName), count(custlastName), count(city), count(state)
    from lab2_Contact;

/* Q14b Query Results

    COUNT(CUSTFIRSTNAME) COUNT(CUSTLASTNAME) COUNT(CITY) COUNT(STATE)
    -------------------- ------------------- ----------- ------------
                 8040340             8040340     8040340      8040340

*/