/*
Karteikay (Karty) Dhuper
CNIT372 Lab Section # 007
Estimated Time Spent: 4hrs total
Late hours used: 0
*/

-- Question #1
/*

    FROM BOOKSHELF
    WHERE RATING > 1
    GROUP BY CATEGORY_NAME
    HAVING CATEGORY_NAME LIKE "A%"
    SELECT NAME, COUNT (*), AVG(RATING)
    ORDER BY COUNT(*);

*/

-- Question #2

    select distinct substr(phone, 1, 3)
    from customer
    where state = 'CO';

/* Q2 Query Results

    SUB
    ---
    719
    970
    728
    720
    644

*/

-- Question #3

    select substr(phone, 1, 3), count(customerid)
    from customer
    where state = 'CO'
    group by substr(phone, 1, 3)
    order by count(customerid) desc;


/* Q3 Query Results

    SUB COUNT(CUSTOMERID)
    --- -----------------
    719                 4
    970                 2
    720                 1
    644                 1
    728                 1

*/

-- Question #4

    select substr(phone, 1, 3), count(customerid)
    from customer
    where state = 'CO'
    group by substr(phone, 1, 3)
    having count(customerid) = (select max(count(customerid))
                                from customer
                                where state = 'CO'
                                group by substr(phone, 1, 3));


/* Q4 Query Results

    SUB COUNT(CUSTOMERID)
    --- -----------------
    719                 4

*/

-- Question #5

    select (custlastname ||','|| custfirstname) as "Name", city, state, phone
    from customer
    where substr(phone, 1, 3) = (select substr(phone, 1, 3)
                                 from customer
                                 where state = 'CO'
                                 group by substr(phone, 1, 3)
                                 having count(customerid) = (select max(count(customerid))
                                                             from customer
                                                             where state = 'CO'
                                                             group by substr(phone, 1, 3)));

/* Q5 Query Results

    Name                                 CITY                 ST PHONE
    ------------------------------------ -------------------- -- ------------
    Rodkey,Daniel                        Lamar                CO 719-748-3205
    Kaakeh,Paul                          Gunnison             CO 719-750-4539
    Smith,Matt                           Montrose             CO 719-822-8828
    Rice,Paul                            Craig                CO 719-541-1837


*/

-- Question #6
/*
    We could use the query in question 4 to provide businesses with insight into
    which area code has the most customers living in it. This could impact
    marketing decisions and allow businesses to reach a larger nuber of customers.

*/

-- Question #7

    select customerid, count(orderid)
    from custorder
    where to_char(orderdate, 'MM/YYYY') = '08/2010'
    group by customerid
    order by count(orderid) desc;


/* Q7 Query Results

    CUSTOMERID COUNT(ORDERID)
    ---------- --------------
    C-300006                3
    I-300016                2
    C-300041                2
    C-300031                2
    I-300015                2
    C-300055                2
    I-300010                2
    C-300005                2
    C-300027                2
    I-300014                2
    I-300070                1

    CUSTOMERID COUNT(ORDERID)
    ---------- --------------
    C-300017                1
    I-300031                1
    I-300126                1
    C-300001                1
    I-300091                1
    I-300020                1
    C-300011                1
    I-300069                1
    C-300033                1
    I-300024                1
    I-300117                1

    CUSTOMERID COUNT(ORDERID)
    ---------- --------------
    C-300002                1
    I-300132                1
    I-300005                1
    C-300010                1
    I-300122                1
    C-300013                1
    C-300053                1
    I-300068                1
    C-300020                1
    I-300096                1
    I-300120                1

    CUSTOMERID COUNT(ORDERID)
    ---------- --------------
    I-300112                1
    I-300115                1
    I-300076                1
    C-300035                1
    I-300012                1
    I-300095                1
    I-300017                1
    I-300026                1
    I-300042                1
    I-300097                1
    I-300093                1

    CUSTOMERID COUNT(ORDERID)
    ---------- --------------
    I-300102                1
    I-300007                1
    I-300138                1
    I-300043                1
    I-300108                1
    I-300044                1
    I-300110                1
    C-300051                1
    I-300009                1
    C-300004                1
    C-300026                1

    CUSTOMERID COUNT(ORDERID)
    ---------- --------------
    C-300003                1
    I-300004                1
    I-300025                1
    I-300129                1
    I-300002                1
    I-300011                1
    I-300081                1
    I-300088                1
    I-300013                1
    I-300061                1
    I-300018                1

    66 rows selected.

*/

-- Question #8

    select count(orderid)
    from custorder
    where to_char(orderdate, 'MM/YYYY') = '08/2010'
    group by customerid
    having count(orderid) = (select max(count(orderid))
                            from custorder
                            where to_char(orderdate, 'MM/YYYY') = '08/2010'
                            group by customerid);

/* Q8 Query Results

    COUNT(ORDERID)
    --------------
                 3
*/

-- Question #9

    select customerid
    from custorder
    where to_char(orderdate, 'MM/YYYY') = '08/2010'
    group by customerid
    having count(orderid) = (select max(count(orderid))
                            from custorder
                            where to_char(orderdate, 'MM/YYYY') = '08/2010'
                            group by customerid);

/* Q9 Query Results

    CUSTOMERID
    ----------
    C-300006

*/

-- Question #10

    select customerid, count(orderid)
    from custorder
    where to_char(orderdate, 'MM/YYYY') = '08/2010'
    group by customerid
    having count(orderid) >  (select avg(count(orderid))
                             from custorder
                             where to_char(orderdate, 'MM/YYYY') = '08/2010'
                             group by customerid)
    order by count(orderid) desc;

/* Q10 Query Results

    CUSTOMERID COUNT(ORDERID)
    ---------- --------------
    C-300006                3
    I-300016                2
    C-300041                2
    C-300031                2
    I-300015                2
    C-300055                2
    I-300010                2
    C-300005                2
    C-300027                2
    I-300014                2

    10 rows selected.

*/

-- Question #11

    select customerid, count(orderid)
    from custorder
    where to_char(orderdate, 'MM/YYYY') = '08/2010'
    group by customerid
    having count(orderid) <  (select avg(count(orderid))
                             from custorder
                             where to_char(orderdate, 'MM/YYYY') = '08/2010'
                             group by customerid)
    order by count(orderid) desc;


/* Q11 Query Results

    CUSTOMERID COUNT(ORDERID)
    ---------- --------------
    I-300070                1
    I-300018                1
    I-300031                1
    I-300126                1
    C-300001                1
    I-300091                1
    I-300020                1
    C-300011                1
    I-300069                1
    C-300033                1
    I-300024                1

    CUSTOMERID COUNT(ORDERID)
    ---------- --------------
    I-300117                1
    C-300002                1
    I-300132                1
    I-300005                1
    C-300010                1
    I-300122                1
    C-300013                1
    C-300053                1
    I-300068                1
    C-300020                1
    I-300096                1

    CUSTOMERID COUNT(ORDERID)
    ---------- --------------
    I-300120                1
    I-300112                1
    I-300115                1
    I-300076                1
    C-300035                1
    I-300012                1
    I-300095                1
    I-300017                1
    I-300026                1
    I-300042                1
    I-300097                1

    CUSTOMERID COUNT(ORDERID)
    ---------- --------------
    I-300093                1
    I-300102                1
    I-300007                1
    I-300138                1
    I-300043                1
    I-300108                1
    I-300044                1
    I-300110                1
    C-300051                1
    I-300009                1
    C-300004                1

    CUSTOMERID COUNT(ORDERID)
    ---------- --------------
    C-300026                1
    C-300003                1
    I-300004                1
    I-300025                1
    I-300129                1
    I-300002                1
    I-300011                1
    I-300081                1
    I-300088                1
    I-300013                1
    I-300061                1

    CUSTOMERID COUNT(ORDERID)
    ---------- --------------
    C-300017                1

    56 rows selected.

*/

-- Question #12
/*
    The queries from question 10 and 11 can allow us to glean useful information
    as to the purchase habits of the businesses most loyal custoemrs. It also
    allows to follow up and seek critical feedback from customers that are
    ordering under the average.
*/

-- Question #13

    select c.customerid, c.companyname, (c.custfirstname ||','|| c.custlastname) as "Name", to_char(co.orderdate, 'MM.DD.YYYY')
    from customer c inner join custorder co
    on c.customerid = co.customerid
    where co.orderdate between '31-DEC-2009' and '01-JAN-2011' and state = 'IN'
    order by co.orderdate desc;


/* Q13 Query Results

    CUSTOMERID COMPANYNAME                              Name                                 TO_CHAR(CO
    ---------- ---------------------------------------- ------------------------------------ ----------
    I-300147                                            Steven,Yaun                          12.07.2010
    C-300001   Baker and Company                        Gregory,Abbott                       12.02.2010
    C-300014   R and R Air                              Cathy,Bending                        10.04.2010
    I-300030                                            Eric,Quintero                        09.15.2010
    C-300001   Baker and Company                        Gregory,Abbott                       08.13.2010
    C-300001   Baker and Company                        Gregory,Abbott                       07.14.2010
    C-300001   Baker and Company                        Gregory,Abbott                       07.08.2010

    7 rows selected.

*/

-- Question #14

    select c.companyname, c.custtitle ||' '|| substr(c.custfirstname, 1, 1) || '. ' || c.custlastname as "Name", co.orderdate, co.requireddate
    from customer c INNER JOIN custorder co
    on c.customerid = co.customerid
    where c.customerid LIKE '%C-300001%'
    order by co.orderdate asc;

/* Q14 Query Results

    COMPANYNAME                              Name                          ORDERDATE REQUIREDD
    ---------------------------------------- ----------------------------- --------- ---------
    Baker and Company                        Mr. G. Abbott                 08-JUL-10 12-JUL-10
    Baker and Company                        Mr. G. Abbott                 14-JUL-10 15-JUL-10
    Baker and Company                        Mr. G. Abbott                 13-AUG-10 20-AUG-10
    Baker and Company                        Mr. G. Abbott                 02-DEC-10 08-DEC-10
    Baker and Company                        Mr. G. Abbott                 27-JAN-11 03-FEB-11
    Baker and Company                        Mr. G. Abbott                 24-FEB-11 03-MAR-11
    Baker and Company                        Mr. G. Abbott                 10-MAR-11 15-MAR-11

    7 rows selected.

*/

-- Question #15

    select col.orderid, ip.partnumber, ip.partdescription, col.unitprice, col.orderquantity, c.categoryname
    from category c inner join inventorypart ip
        on c.categoryid = ip.categoryid
        inner join custorderline col
        on ip.partnumber = col.partnumber
    where ip.partdescription like '%BOARD GAMES%'
    order by col.orderquantity desc;


/* Q15 Query Results

    ORDERID    PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY CATEGORYNAME
    ---------- ---------- -------------------------------------------------- ---------- ------------- ------------------------------
    2001000536 SFT-005    BOARD GAMES                                              9.99            15 Software
    2000000050 SFT-005    BOARD GAMES                                              9.99            14 Software
    2000000279 SFT-005    BOARD GAMES                                              9.99            10 Software
    2000000426 SFT-005    BOARD GAMES                                              9.99            10 Software
    2000000348 SFT-005    BOARD GAMES                                              9.99             2 Software
    2000000139 SFT-005    BOARD GAMES                                              9.99             2 Software
    2001000722 SFT-005    BOARD GAMES                                              9.99             1 Software
    2000000206 SFT-005    BOARD GAMES                                              9.99             1 Software
    2000000362 SFT-005    BOARD GAMES                                              9.99             1 Software
    2000000005 SFT-005    BOARD GAMES                                              9.99             1 Software
    2000000436 SFT-005    BOARD GAMES                                              9.99             1 Software

    ORDERID    PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY CATEGORYNAME
    ---------- ---------- -------------------------------------------------- ---------- ------------- ------------------------------
    2001000600 SFT-005    BOARD GAMES                                              9.99             1 Software
    2000000040 SFT-005    BOARD GAMES                                              9.99             1 Software
    2000000011 SFT-005    BOARD GAMES                                              9.99             1 Software

    14 rows selected.

*/

-- Question #16
    select co.orderid, col.partnumber, ip.partdescription, col.unitprice, col.orderquantity
    from custorder co inner join custorderline col
        on co.orderid = col.orderid
        inner join inventorypart ip
        on col.partnumber = ip.partnumber
    where co.customerid LIKE '%C-300001%' and to_char(co.orderdate, 'DD/MM/YYYY') = '14/07/2010'
    order by col.orderquantity desc;



/* Q16 Query Results

ORDERID    PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY
---------- ---------- -------------------------------------------------- ---------- -------------
2000000032 BRK-011    2ND PARALLEL PORT                                        5.99            20
2000000032 CTR-019    FLY XPST                                              1717.99             9
2000000032 ADT-003    EXTERNAL SCSI-3 MALE TERMINATOR                         39.99             8
2000000032 CAB-027    2FT 3/1 SCSI CABLE                                      44.99             6
2000000032 SCN-002    SCANJET BUSINESS SERIES COLOR SCANNER                     249             4
*/

-- Question #17

    select to_char(co.orderdate, 'MM.DD.YYYY') as "Date", co.orderid, col.partnumber, ip.partdescription, col.unitprice, col.orderquantity
    from customer c inner join custorder co
        on c.customerid = co.customerid
        inner join custorderline col
        on co.orderid = col.orderid
        inner join inventorypart ip
        on col.partnumber = ip.partnumber
    where c.companyname like '%Bankruptcy Help%' and to_char(co.orderdate, 'YYYY') = '2011'
    order by co.orderdate desc, col.orderquantity desc;


/* Q17 Query Results

    Date       ORDERID    PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY
    ---------- ---------- ---------- -------------------------------------------------- ---------- -------------
    03.22.2011 2001000778 BRK-002    1X4 USB CABLE AND BRACKET                                9.99            20
    03.22.2011 2001000778 MEM-004    30.7GB HARD DRIVE                                      269.99            10
    03.22.2011 2001000778 P-006      600 PENTIUM III PROCESSOR                              339.99             6
    02.28.2011 2001000699 MOD-002    112K DUAL MODEM                                         89.99            16
    02.28.2011 2001000699 MEM-001    2MB FLASH BUFFER MEMORY                                259.95            12
    02.28.2011 2001000699 PRT-003    LASER JET 2500SE                                          699             3
    02.24.2011 2001000676 MIC-009    WHEEL MOUSE                                              29.5            27
    02.14.2011 2001000622 BB-004     SOCKET MINI BAREBONE                                   199.99             6
    02.14.2011 2001000622 P-005      700 PENTIUM III PROCESSOR                              399.99             4

    9 rows selected.

*/

-- Question #18

    select to_char(co.orderdate, 'MM.DD.YYYY') as "Date", co.orderid, col.partnumber, ip.partdescription, (col.unitprice * col.orderquantity) as "Line Item Total"
    from customer c inner join custorder co
        on c.customerid = co.customerid
        inner join custorderline col
        on co.orderid = col.orderid
        inner join inventorypart ip
        on col.partnumber = ip.partnumber
    where c.companyname like '%Bankruptcy Help%' and to_char(co.orderdate, 'YYYY') = '2011'
    order by co.orderdate desc, col.orderquantity desc;


/* Q18 Query Results

    Date       ORDERID    PARTNUMBER PARTDESCRIPTION                                    Line Item Total
    ---------- ---------- ---------- -------------------------------------------------- ---------------
    03.22.2011 2001000778 BRK-002    1X4 USB CABLE AND BRACKET                                    199.8
    03.22.2011 2001000778 MEM-004    30.7GB HARD DRIVE                                           2699.9
    03.22.2011 2001000778 P-006      600 PENTIUM III PROCESSOR                                  2039.94
    02.28.2011 2001000699 MOD-002    112K DUAL MODEM                                            1439.84
    02.28.2011 2001000699 MEM-001    2MB FLASH BUFFER MEMORY                                     3119.4
    02.28.2011 2001000699 PRT-003    LASER JET 2500SE                                              2097
    02.24.2011 2001000676 MIC-009    WHEEL MOUSE                                                  796.5
    02.14.2011 2001000622 BB-004     SOCKET MINI BAREBONE                                       1199.94
    02.14.2011 2001000622 P-005      700 PENTIUM III PROCESSOR                                  1599.96

    9 rows selected.

*/

-- Question #19

    select c.customerid, c.companyname, (c.custlastname ||','|| c.custfirstname) as "Name", count(co.orderid) as "Orders Placed"
    from customer c inner join custorder co
    on c.customerid = co.customerid
    where state = 'IN' and co.orderdate between '31-DEC-2010' and '01-FEB-2011'
    group by c.customerid, c.companyname, c.custlastname, c.custfirstname
    order by count(co.orderid) asc;


/* Q19 Query Results

    CUSTOMERID COMPANYNAME                              Name                                 Orders Placed
    ---------- ---------------------------------------- ------------------------------------ -------------
    C-300001   Baker and Company                        Abbott,Gregory                                   1
    C-300014   R and R Air                              Bending,Cathy                                    1
    I-300030                                            Quintero,Eric                                    2

*/

-- Question #20

    select c.categoryname, cast(avg(ip.stocklevel) as decimal(6,2)) as "Avg Stock Level"
    from category c inner join inventorypart ip
    on c.categoryid = ip.categoryid
    group by c.categoryname
    order by avg(ip.stocklevel) asc;


/* Q20 Query Results

    CATEGORYNAME                   Avg Stock Level
    ------------------------------ ---------------
    Computers                                 2.45
    Accessories                               9.21
    Power                                     10.5
    Storage                                  20.47
    Basics                                    20.5
    Processors                               23.74
    Software                                 33.89
    Cables                                   35.86

    8 rows selected.

*/

-- Question #21

    select (c.categoryname ||': ' || c.description) as "Category Detail", count(ip.partdescription) as "No. of Part Types"
    from category c inner join inventorypart ip
    on c.categoryid = ip.categoryid
    group by (c.categoryname ||': ' || c.description)
    order by count(ip.partdescription) asc;




/* Q21 Query Results

    Category Detail                                                   No. of Part Types
    ----------------------------------------------------------------- -----------------
    Power: Power Supplies                                                             4
    Software: Games, maps                                                             9
    Accessories: Scanners, Printers, Modems                                          14
    Processors: Athlon, Celeron, Pentium, Fans                                       19
    Storage: CD-ROM, DVD, Hard Drives, Memory                                        19
    Computers: Assembled Computers                                                   29
    Cables: Printer, Keyboard, Internal, SCSI, Connectors, Brackets                  36
    Basics: Casing, Barebone, Monitors, Keyboards, Mice                              44

    8 rows selected.

*/

-- Question #22

    select max(weight)
    from category c inner join inventorypart ip
    on c.categoryid = ip.categoryid
    where categoryname like '%Software%';


/* Q22 Query Results

    MAX(WEIGHT)
    -----------
           .438

*/

-- Question #23

    select c.categoryname, max(ip.weight)
    from category c inner join inventorypart ip
    on c.categoryid = ip.categoryid
    where (categoryname like '%Power%' or categoryname like '%Software%' or categoryname like'%Storage%')
    group by c.categoryname
    order by c.categoryname asc;


/* Q23 Query Results

    CATEGORYNAME                   MAX(IP.WEIGHT)
    ------------------------------ --------------
    Power                                       3
    Software                                 .438
    Storage                                     4

*/

-- Question #24

    select c.categoryname, max(ip.weight), ip.partdescription
    from category c inner join inventorypart ip
    on c.categoryid = ip.categoryid
    where (c.categoryname like '%Power%' or c.categoryname like '%Software%' or c.categoryname like'%Storage%')
    group by c.categoryname, ip.partdescription
    having max(weight) in (select max(ip.weight) from category c inner join inventorypart ip on c.categoryid = ip.categoryid where c.categoryname like 'Power')
                        or max(weight) in (select max(ip.weight) from category C inner join inventorypart ip on c.categoryid = ip.categoryid where c.categoryname like 'Software')
                        or max(weight) in (select max(ip.weight) from category c inner join inventorypart ip on c.categoryid = ip.categoryid where c.categoryname LIKE 'Storage' )
    order by c.categoryname asc;


/* Q24 Query Results

    CATEGORYNAME                   MAX(IP.WEIGHT) PARTDESCRIPTION
    ------------------------------ -------------- --------------------------------------------------
    Power                                       3 250 WATT POWER SUPPLY
    Power                                       3 300 WATT POWER SUPPLY
    Software                                 .438 BOARD GAMES
    Software                                 .438 DESKTOP PUBLISHER
    Storage                                     3 30.7GB HARD DRIVE
    Storage                                     4 ETHERNET FIBER OPTIC MINI-TRANSCEIVER

    6 rows selected.


*/
/* Question 25
    I think there should be an easier way to execute the above sql statement
    since in my response to question 24 i had to hard code the values
    categoryname rather than automatically finding the corresponding
    partdescription. After some Googling i was able to a technique called common
    table expression (cte.) which could prove to be promising.

*/
