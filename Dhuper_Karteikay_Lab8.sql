/*
Karteikay (Karty) Dhuper
CNIT372 Lab Section # 007
Estimated Time Spent: 2 hours
Late hours used: 0
*/

SET SERVEROUTPUT ON

-- Question 1

    CREATE TABLE CUSTOMER_NEW 
    AS 
        SELECT * FROM CNIT372TA.CUSTOMER_NEW; 
        ALTER TABLE CUSTOMER_NEW 
            ADD PRIMARY KEY (CustomerID);

/* Q1 Query Results

    Table CUSTOMER_NEW created.
    
    Table CUSTOMER_NEW altered.

*/
-- Question 2 

    CREATE OR REPLACE VIEW CUSTOMER_NEW_VIEW AS
        SELECT custname, companyname, address, city, state, postalcode, phone, emailaddr
        FROM customer_new;
        
    SELECT * 
    FROM CUSTOMER_NEW_VIEW;


/* Q2 Query Results
    
   View CUSTOMER_NEW_VIEW created.
   
   CUSTNAME                            COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ----------------------------------- ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    Helly Smith                                                                  953 Eden Park Dr.                        Cincinnati           OH 45202      513-639-2995 information@cincyart.org                          
    John Day                            Purdue University                        401 N. Grant St.                         West Lafayette       IN 47907      765-494-2560 johnday@purdue.edu                                
    Shannon Jing                        Purdue University                        500 Oval Dr.                             Wset Lafayette       IN 47907      765-588-7610 jing@purdue.edu                                   
    Julia Rayz                          Purdue University                        401 N. Grant St.                         West Lafayette       IN 47907      765-494-9525 jtaylor1@purdue.edu                               
    Jack Anderson                       University of Chicago                    5801 S. Ellis Ave.                       Chicago              IL 60637      773-702-8650 infocenter@uchicago.edu                           
    Kate Johnson                        Michigan University                      500 S. State St.                         Ann Arbor            MI 48109      734-764-1817 info@umich.edu                                    
    Shannon Jing                                                                 500 Oval Dr.                             West Lafayette       IN 47907      765-588-7610 tarokingu@gmail.com                               
    Jackson Williams                                                             3400 Vine St.                            Cincinnati           OH 45220                   jackwilliams@gmail.com                            
    Zack Browns                                                                  1777 E. Broad St.                        Columnbus            OH 43203      614-715-0000 zbrowns@yahoo.com                                 
    Kate Sun                                                                     405 Sagamore Pkwy S.                     Lafayette            IN 47904                   katesun@gmail.com                                 
    
    10 rows selected. 
    
    Assumptions: The assumption is that the user would like to see the name, 
    company name, address, city, state, postal code, phone, and email address
    for all customers.

*/

-- Question 3

    INSERT INTO CUSTOMER_NEW_VIEW(custname, address, city, state, postalcode)
        VALUES('John Doe','401 N. Grant St.', 'West Lafayette', 'IN', '47907');

/* Q3 Query Results:

    I am unable to add this customer since when I attempt to insert into the 
    CUSTOMER_NEW_VIEW I am met with an error message that says "cannot insert
    NULL into ("KDHUPER"."CUSTOMER_NEW"."CUSTOMERID"). This is because we have 
    left out the primary key value.
    
*/

-- Question 4

    CREATE OR REPLACE VIEW CUSTOMER_ALL AS
        SELECT customerid, custname, companyname, address, city, state, postalcode, phone, emailaddr
        FROM customer_new
        UNION ALL
        SELECT customerid, custfirstname ||' '|| custlastname, companyname, address, city, state, postalcode, phone, emailaddr
        FROM customer;
        
    SELECT * 
    FROM CUSTOMER_ALL;


/* Q4 Query Results

    View CUSTOMER_ALL created.
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    I-305      Helly Smith                                                                   953 Eden Park Dr.                        Cincinnati           OH 45202      513-639-2995 information@cincyart.org                          
    C-301      John Day                             Purdue University                        401 N. Grant St.                         West Lafayette       IN 47907      765-494-2560 johnday@purdue.edu                                
    C-302      Shannon Jing                         Purdue University                        500 Oval Dr.                             Wset Lafayette       IN 47907      765-588-7610 jing@purdue.edu                                   
    C-303      Julia Rayz                           Purdue University                        401 N. Grant St.                         West Lafayette       IN 47907      765-494-9525 jtaylor1@purdue.edu                               
    C-304      Jack Anderson                        University of Chicago                    5801 S. Ellis Ave.                       Chicago              IL 60637      773-702-8650 infocenter@uchicago.edu                           
    C-305      Kate Johnson                         Michigan University                      500 S. State St.                         Ann Arbor            MI 48109      734-764-1817 info@umich.edu                                    
    I-301      Shannon Jing                                                                  500 Oval Dr.                             West Lafayette       IN 47907      765-588-7610 tarokingu@gmail.com                               
    I-302      Jackson Williams                                                              3400 Vine St.                            Cincinnati           OH 45220                   jackwilliams@gmail.com                            
    I-303      Zack Browns                                                                   1777 E. Broad St.                        Columnbus            OH 43203      614-715-0000 zbrowns@yahoo.com                                 
    I-304      Kate Sun                                                                      405 Sagamore Pkwy S.                     Lafayette            IN 47904                   katesun@gmail.com                                 
    I-300051   Lynne Lagunes                                                                 2820 Beechmont Ave.                      Pocatello            ID 83209      208-502-9976 hello@zeronet.net                                 
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    I-300052   Andrew Yelnick                                                                6972 Winton Rd.                          Detroit              MI 48226      517-803-5818 family@free.com                                   
    I-300053   Stephanie Pearl                                                               6460 Springdale Rd.                      Maryville            MO 64468      660-447-8319 mommyl@fast.com                                   
    I-300054   Dorlan Bresnaham                                                              1328 Mill Ave.                           Plymouth             NH 03264      603-497-7374 dorlan@usol.com                                   
    I-300055   Jon Clute                                                                     1680 River Oaks Blvd.                    Tucson               AZ 85711      480-181-8940                                                   
    I-300056   Elizabeth Henderson                                                           2819 Otay Rd.                            Zeona                SD 57758      449-486-8018                                                   
    I-300057   Tonya Owens                                                                   1414 Fields Ertel Rd.                    Abbeville            SC 29620      843-773-2751                                                   
    I-300058   Matthew Quant                                                                 253 Silver Creek Rd.                     Hamlet               NC 28345      910-577-1319 walker@onlineservice.com                          
    I-300059   Kenneth Mintier                                                               4831 Skeet Blvd.                         Eureka               CA 95534      323-673-0690 builder@usol.com                                  
    I-300060   Lucille Appleton                                                              5260 Blue Mound Rd.                      Newburgh             NY 12553      914-497-2160 muscle@zeronet.net                                
    I-300061   Brenda Jones                                                                  3696 Cooper St.                          Aurora               CO 80230      720-800-2638 show@free.com                                     
    I-300062   John McGinnis                                                                 7841 Hurst Blvd.                         Preston              ID 83263      208-741-1963 john@zeronet.net                                  
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    I-300063   Dennis Eberle                                                                 9425 James Rd.                           Waterloo             IA 50707      515-708-1802 deber@free.com                                    
    I-300064   Jo Jacko                                                                      6588 Ken Caryl Rd.                       Vineland             NJ 08361      856-752-7471                                                   
    I-300065   Karen Randolph                                                                1038 Coal Mine Rd.                       Franklin             NH 03235      603-744-9002 cookin@zeronet.net                                
    I-300066   Ruth Ball                                                                     1093 Valley View Ln.                     St. Cloud            MN 56387      651-479-7538                                                   
    I-300067   Travis Camargo                                                                6681 Forrest Ln.                         Neosho               MO 64853      816-746-4913                                                   
    I-300068   Jerry Muench                                                                  1694 Stone Valley Rd.                    Miami                TX 79059      464-669-8537 redhot@onlineservice.com                          
    I-300069   Verna McGrew                                                                  4755 Rocket Blvd.                        Huntsville           AL 35811      334-547-9329 verngrew@free.com                                 
    I-300070   Elizabeth Derhammer                                                           2343 Pioneer Pkwy.                       Garden City          KS 67868      785-970-9916 lizzy@onlineservice.com                           
    I-300071   Ted Zissa                                                                     4935 Cedar Hill Rd.                      Ardmore              OK 73402      405-151-7445                                                   
    I-300072   Matt Shade                                                                    8441 Skillman Ave.                       Green Valley         AZ 85622      623-422-6616 shadtree@free.com                                 
    I-300073   Dean Eagon                                                                    616 Burton Rd.                           Peublo               CO 81011      970-581-8611                                                   
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    I-300074   Andrew Ray                                                                    1246 Ferry St.                           Millville            NJ 08332      609-345-9680 andyray@usol.com                                  
    I-300075   Robert Cortez                                                                 219 Pleasant Run Rd.                     Keene                NH 03435      603-442-3740                                                   
    I-300076   Tim Carlton                                                                   1038 Lancaster St.                       Enfield              CT 06082      203-608-3465                                                   
    I-300077   Jennifer Hundley                                                              6354 Buckner Blvd.                       Richwood             WV 26261      304-713-3298 jenhund@fast.com                                  
    I-300078   Andrea Griswold                                                               8215 Garland Rd.                         Leadville            CO 80429      970-746-0995 andygwold@usol.com                                
    I-300079   Christina Wilson                                                              5766 Scyene Rd.                          Pratt                KS 67124      316-210-8989                                                   
    I-300080   Juicheng Nugent                                                               9443 Illinois Ave.                       Springfield          VT 05156      802-352-8923 nugent@fast.com                                   
    I-300081   Bryan Price                                                                   1745 Best Line Rd.                       Hampton              VA 23666      804-674-9666                                                   
    I-300082   Helene Ziekart                                                                9533 Simonds Rd.                         New Haven            CT 06511      203-244-9192                                                   
    I-300083   Marty Fay                                                                     9241 School Rd.                          Fairbanks            AK 99775      501-631-3727 sparky@free.com                                   
    I-300084   Lisa Pettry                                                                   8515 Cossell Ave.                        Carson City          NV 89714      702-799-7272 lpett@zeronet.net                                 
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    I-300085   Zach McGrew                                                                   5788 Rockville Rd.                       Globe                AZ 85502      520-730-8494                                                   
    I-300086   Jamie Thompson                                                                6878 Holt Ave.                           Athens               GA 30606      706-471-1222 jthompson@onlineservice.com                       
    I-300087   Charles Jones                                                                 1420 N. Highland Ave.                    Grand                FL 33606      919-774-5552 charlie@usol.com                                  
    I-300088   Thomas Zelenka                                                                5371 Brookeville Rd.                     Manchester           NH 03108      603-374-3706 zelenka@free.com                                  
    I-300089   James Laake                                                                   3434 Great Street                        Aladdin              WY 82710      613-785-7063                                                   
    I-300090   Daniel Stabnik                                                                3745 35th St.                            Perryville           MO 63775      636-746-4124                                                   
    I-300091   Trudi Antonio                                                                 9882 Strother Rd.                        Potsdam              NY 13699      718-747-3259 toni@onlineservice.com                            
    I-300092   John Garcia                                                                   231 63rd St.                             Portland             ME 04122      207-311-0174 jgar@onlineservice.com                            
    I-300093   Jay Hanau                                                                     5897 Sunset Rd.                          Marion               IL 62959      773-490-8254                                                   
    I-300094   Joseph Schuman                                                                5893 Warm Springs Rd.                    Akron                OH 44304      330-209-1273                                                   
    I-300095   Joshua Cole                                                                   7903 Paradise Rd.                        Jackson              TN 38308      865-269-7782 fido@zeronet.net                                  
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    I-300096   David Schilling                                                               8671 Chapel Rd.                          Bowling Green        KY 42102      502-421-1516                                                   
    I-300097   Mary Ann Rausch                                                               3679 Western Ave.                        Green River          WY 82938      307-944-3324 spiritual@free.com                                
    I-300098   Allison Roland                                                                4599 S. Maodill Ave.                     Palma                FL 33604      929-498-4174 alley@onlineservice.com                           
    I-300099   Roy Beer                                                                      8065 Colina Rd.                          Yakima               WA 98907      206-745-2584 wizzy@usol.com                                    
    I-300100   Chris Dunlap                                                                  3526 10th St.                            Gillette             WY 82731      307-473-2281                                                   
    I-300101   Ansel Farrell                                                                 316 Birch St.                            Storm Lake           IA 50588      712-440-3934 prickly@onlineservice.com                         
    I-300102   Jason Laxton                                                                  7858 Dowling Ave. N.                     Athol                MA 01368      978-860-2824 coondog@usol.com                                  
    I-300103   Larry Gardiner                                                                1739 W 39th St.                          Winnsboro            LA 71295      225-313-6268 square@onlineserveice.com                         
    I-300104   Lawrence Pullen                                                               4599 Rheem Blvd.                         Greenbush            MN 56726      644-591-3243 laurie@free.com                                   
    I-300105   Matt Nakanishi                                                                8108 Middle Rd.                          Price                UT 84501      435-710-5324 nakan@free.com                                    
    I-300106   Nancy Basham                                                                  3409 36th Ave. N.                        Dexter               ME 04930      207-422-7135                                                   
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    I-300107   Rachel Davis                                                                  2954 Cedar Lake Rd.                      Reno                 NV 89523      702-907-4818 rachdav@zeronet.net                               
    I-300108   Sarah McCammon                                                                3216 Dimond Lake Rd.                     Kingman              AZ 86411      520-438-7944 squirrel@zeronet.net                              
    I-300109   David Tietz                                                                   5235 E. 44th St.                         Montevideo           MN 56265      651-912-1583 tietz@free.com                                    
    I-300110   Jim Manaugh                                                                   1011 W. Hillsborough Ave.                Garyville            FL 33605      919-747-5603 jmanaugh@eagle.com                                
    I-300111   Richard Stetler                                                               7496 University Ave.                     Auburn               AL 36832      256-412-8112 screwball@free.com                                
    I-300112   Jonathon Blanco                                                               8095 Mounty Rd.                          Oshkosh              WI 54904      902-226-1858 hammer@free.com                                   
    I-300113   Randolph Darling                                                              8254 Coral Way                           Putnam               CT 06260      860-684-1620 randolph@fast.com                                 
    I-300114   Melody Fazal                                                                  4603 Killian Rd.                         Bakersfield          CA 93311      760-877-4849 melfazal@zeronet.net                              
    I-300115   Michael Tendam                                                                190 Dixie St.                            Glasgow              MT 592331     406-424-7496 flute@usol.com                                    
    I-300116   Sean Akropolis                                                                6603 E. Little Yak Rd.                   Anchorage            AK 99509      907-262-4254 pickle@free.com                                   
    I-300117   Anne Hatzell                                                                  5200 Belfat Blvd.                        Seaford              DE 19973      302-651-6440 hazel@zeronet.net                                 
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    I-300118   Meredith Rushing                                                              1856 Cullen Blvd.                        Lexington            KY 40516      606-608-2105 merry@free.com                                    
    I-300119   John Skadberg                                                                 7577 Holmes Rd.                          Findlay              OH 45840      513-282-3919 skad@zeronet.net                                  
    I-300120   Zack Hill                                                                     2064 Preston Rd.                         Winston              OR 97496      503-794-2322 boogie@free.com                                   
    I-300121   Dan Lageveen                                                                  3056 Southern Ave. N.                    Laramie              WY 82073      307-344-8928 veenie@zeronet.net                                
    I-300122   Marla Reeder                                                                  1029 Moraga Ave. W.                      Bonifay              FL 32425      728-442-3031 reedmar@zeronet.net                               
    I-300123   Linda Bowen                                                                   5541 Bell Rd.                            Huron                SD 57350      605-234-4114                                                   
    I-300124   Michael Emore                                                                 7347 Peoria Ave.                         Orlando              FL 32810      352-472-1224 mikemore@usol.com                                 
    I-300125   Mary Jo Wales                                                                 1416 Wynnewood Ave.                      Wallowa              OR 97885      852-441-4984 jomary@onlineservice.com                          
    I-300126   Tom Moore                                                                     7742 Glendale Ave.                       Morehead             KY 04351      270-692-2845 seedle@fast.com                                   
    I-300127   Susan Watson                                                                  6151 Indian School Rd.                   Ogden                UT 84414      801-746-7701 mswatson@fast.com                                 
    I-300128   Tom Irelan                                                                    7833 McDowell Rd.                        Cumberland           MD 21503      240-634-5581 tucker@free.com                                   
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    I-300129   Rosemary Vanderhoff                                                           843 99th St.                             Macon                GA 31206      770-293-8783                                                   
    I-300130   Mike Dunbar                                                                   1750 Broadway St.                        Grangeville          ID 83531      208-297-5374 duh@onlineservice.com                             
    I-300131   Ryan Stahley                                                                  9281 E. Bird St.                         Grand                FL 33606      919-774-5340 rstahley@eagle.com                                
    I-300132   Patricia Leong                                                                6213 Baseline Rd.                        Prescott             AZ 86313      520-247-4141 patrice@usol.com                                  
    I-300133   Roy McGrew                                                                    1968 Elliot Rd.                          Nampa                ID 83686      208-324-0783 grow@zeronet.net                                  
    I-300134   Tom Baker                                                                     483 Greenway St.                         Sparta               WI 54656      414-778-5640 bologna@free.com                                  
    I-300135   Bill Umbarger                                                                 1476 Eastern Pkwy.                       Belfast              ME 04915      207-155-1577 cheezy@onlineservice.com                          
    I-300136   Bob Weldy                                                                     8227 Oak Ridge Rd.                       Lynchburg            VA 24506      571-490-6449 sucker42@usol.com                                 
    I-300137   Kris Shinn                                                                    7451 Tiden St.                           Pecos                TX 79772      469-740-2748 shinnk@zeronet.net                                
    I-300138   James King                                                                    2734 Mulga Loop Rd.                      Lincoln              ME 04457      207-708-3317 jamesk@usol.com                                   
    I-300139   Frank Malady                                                                  7894 Geary Blvd.                         Nahunta              GA 31533      574-493-0510 frankmala@zeronet.net                             
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    I-300140   Jim Webb                                                                      3577 Hessian Ave.                        Lowell               MA 01853      978-204-3019                                                   
    I-300141   Daniel Rodkey                                                                 4024 Mill Plain Blvd.                    Lamar                CO 81052      719-748-3205 dannie@free.com                                   
    I-300142   Marc Williams                                                                 8443 15th St.                            Cedar City           VT 84721      435-774-4595 peanut@fast.com                                   
    I-300143   Kristy Moore                                                                  4410 W. Spruce St.                       Fort Sutton          FL 33603      919-486-6765 fluffy@onlineservice.com                          
    I-300144   Russ Mann                                                                     6879 Island Ave.                         Las Vegas            NV 89199      775-549-1798 scooter@onlineservice.com                         
    I-300145   Carrie Buchko                                                                 3793 Leheigh Ave.                        Jasper               TX 75951      817-739-1335 goobert@free.com                                  
    I-300146   Michelle Oakley                                                               5348 Elmwood Ave.                        Brockton             MA 02303      978-514-5425 littleone@usol.com                                
    I-300147   Steven Yaun                                                                   4711 Hook Rd.                            Indianapolis         IN 46208      317-780-9804 yawn@fast.com                                     
    I-300148   Jack Illingworth                                                              2741 Ashland Ave.                        Buffalo              NY 14206      914-748-9829 illing@free.com                                   
    I-300149   Thomas Wolfe                                                                  7347 Broad St.                           Scranton             PA 18510      610-365-9766 wolf@onlineservice.com                            
    I-300150   Irene Poczekay                                                                7000 W. 7th St.                          Newport              RI 02840      401-461-9567                                                   
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    I-300151   Andy Huegel                                                                   7542 Haverford Blvd.                     Milford              DE 19963      302-620-1366                                                   
    I-300152   Karen Marko                                                                   4954 Clifton Rd.                         Lawton               OK 73506      580-555-1871 marko@usol.com                                    
    I-300153   Trevor Snuffer                                                                6550 Forbes Ave.                         Rocky Mount          NC 27803      336-185-0630 snuffer@zeronet.net                               
    I-300154   Phil Reece                                                                    1204 N. Nebraska Ave.                    Fort Sutton          FL 33603      919-486-0649 sly@zeronet.net                                   
    I-300155   Linda Hari                                                                    791 McKnight Rd.                         Franklin             KY 42134      270-411-2316                                                   
    I-300156   Andrew Smith                                                                  1244 Fremont Ave.                        Tribune              KS 67879      709-307-2568 smokey@zeronet.net                                
    I-300157   Linda Li                                                                      5920 Grove St.                           Torrington           CT 06790      203-744-4677 ll@free.com                                       
    C-300001   Gregory Abbott                       Baker and Company                        7837 Busse Rd.                           Terre Haute          IN 47813      812-447-3621 greggie@usol.com                                  
    C-300002   Tommy McFerren                       Cole Sales and Associates                3817 Farrell Rd.                         Bend                 OR 97709      503-767-7054 mcferren@cole.com                                 
    C-300003   Cecil Scheetz                        Tippe Inn                                391 Weber Rd.                            Waterville           ME 04903      207-679-9822 cecil@free.com                                    
    C-300004   Frank Aamodt                         Franklin Trinkets                        3304 Leredo Ave.                         New Milford          CT 06776      898-762-8741 fa@fast.com                                       
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    C-300005   Kathleen Plyman                      Needle Center                            7627 Belmont Ave                         New York City        NY 10131      507-543-2052 needles@onlineservice.com                         
    C-300006   George Purcell                       BMA Advertising Design                   4281 Jefferson Rd.                       Scranton             PA 18522      432-320-6905 design@zeronet.net                                
    C-300007   Eugene Gasper                        Regency Hospital                         7022 Ward Lake Rd.                       Barre                VT 05641      705-580-6124 medcare@fast.com                                  
    C-300008   Jared Meers                          South Street Rehabilitation              4271 Airport Rd.                         Grand Forks          ND 58026      701-371-1701 rehabsouth@zeronet.net                            
    C-300009   Tracy Cicholski                      Dixon Pharmacy                           1920 Albion St.                          Crystal Springs      MS 39059      601-959-1315 dixpharm@free.com                                 
    C-300010   Bruce Fogarty                        Photography Niche                        1012 Island Ave.                         Ellenboro            WV 26346      598-791-1420 photoniche@usol.com                               
    C-300011   Susan Strong                         Family Medical Center                    5883 Sudbury Rd.                         Adel                 GA 31620      912-760-7840 fammed@onlineservice.com                          
    C-300012   Ginger Xiao                          Bryant Accounting                        6636 Walnut St.                          Rapid City           SD 57703      605-846-0451 acctsbryant@zeronet.net                           
    C-300013   Karen Burns                          Recreation Supply                        2850 Farm St.                            Modesto              CA 95354      707-598-2670 burnskaren@fast.com                               
    C-300014   Cathy Bending                        R and R Air                              9573 Chestnut St.                        Evansville           IN 47732      765-617-2811 rrair@zeronet.net                                 
    C-300015   Evelyn Cassens                       Vets Inc.                                6094 Pearson St.                         Newark               DE 19726      302-762-9526 dr.animal@onlineservice.com                       
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    C-300016   Angie Hoover                         Goodwork Corporation                     6427 Genesee St.                         Casper               WY 82638      307-459-4165 ahoover@free.com                                  
    C-300017   Jim Sokeland                         Powerful Employment                      6671 Pearl Rd.                           Reisterstown         MD 21136      723-366-1117 employment@zeronet.net                            
    C-300018   Hugo Gillespie                       Wadake Critters                          4194 Northfield Rd.                      Salina               KS 67402      785-981-0669 critters@free.com                                 
    C-300019   Wade Jacobs                          Conner National                          2610 E. Lake Rd.                         Scranton             ND 58653      803-477-5347 connernat@usol.com                                
    C-300020   Brittany Cottingham                  Cottingham Plastics                      4234 Taylor Rd.                          Lima                 OH 45819      419-464-5273 plastic@onlineservice.com                         
    C-300021   David Tarter                         Realty Specialties                       6274 Blue Rock Rd.                       Syracuse             NY 13261      518-500-0570 estate@fast.com                                   
    C-300022   Heather Wallpe                       Reflexions Manufacturing                 4128 Hulen St.                           Park Hills           MO 63653      816-433-9799 flex@onlineservice.com                            
    C-300023   Robert Dalury                        TAS                                      4718 Pleasant Valley Rd.                 Bay City             MI 48708      906-278-6446 tas@zeronet.net                                   
    C-300024   Jim Lichty                           Bankruptcy Help                          5991 Kenwood Rd.                         Chicago              IL 60624      618-847-1904 bankrupt@usol.com                                 
    C-300025   Dusty Jones                          Railroad Express                         1390 Clearview Pkwy.                     Eastport             ID 83826      674-727-0511 rr@usol.com                                       
    C-300026   Larry Osmanova                       City Bus Transport                       256 Royal Ln.                            Salem                OR 97311      541-905-4819 citybus@fast.com                                  
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    C-300027   Richard Strehle                      Vacation Car Rentals                     9862 Rock Island Rd.                     Walla Walla          WA 99362      206-434-7305 vacation@fast.com                                 
    C-300028   Brenda Kitchel                       Cheesman Corporation                     6482 Thomasen Rd.                        Roanoke              VA 24011      804-214-8732 cheesman@zeronet.net                              
    C-300029   Don Torres                           Down Deep Drilling Inc.                  1979 Illinois Ave.                       Elberton             GA 30635      706-649-6375 drill@usol.com                                    
    C-300030   Richard Kluth                        Main St. Bar and Grill                   7901 Peach Tree Dr.                      Middletown           DE 19709      302-296-8012 rickkluth@free.com                                
    C-300031   Allen Robles                         Copy Center                              1228 Bailey Rd.                          Haxtun               CO 80761      644-730-8090 copy@onlineservice.com                            
    C-300032   Archie Doremski                      Greenpart Steet Metal                    6580 Midway Rd.                          Cody                 WY 82414      307-944-8959 sheetz@free.com                                   
    C-300033   Daniel Ezra                          Pools For You                            7393 Lake June Rd.                       Auburn               ME 04212      207-744-1997 swim@zeronet.net                                  
    C-300034   Dean Katpally                        Phone Corporation                        1179 38th St.                            Kapaa                HI 96746      808-799-3727 phonecorp@usol.com                                
    C-300035   Randall Neely                        Store It Here                            1132 Madison St.                         Rutland              VT 05701      802-319-9805 storage@fast.com                                  
    C-300036   Mike Condie                          Kids Recreation Inc.                     449 Troy Ave.                            Wilson               NC 27895      336-211-1238 kidrec@zeronet.net                                
    C-300037   Tim Leffert                          Trailor Rentals                          2765 Independence Ave.                   Rome                 NY 13442      315-486-4777 trailrent@zeronet.net                             
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    C-300038   Carl Dallas                          Water Analysts                           2530 Lakewood Blvd.                      Sumter               SC 29153      864-541-5114 analyzeh20@fast.com                               
    C-300039   Dennis Sammons                       Gards Auto Repair                        581 Sahara Blvd.                         Saginaw              MI 48609      616-544-1969 repairit@free.com                                 
    C-300040   Mildred Jones                        Computer Consultants                     2278 Flamingo Rd.                        Allentown            PA 18195      610-437-6687 compconsul@usol.com                               
    C-300041   Paul Kaakeh                          Laser Graphics Associates                3616 Jones Blvd.                         Gunnison             CO 81247      719-750-4539 graphit@usol.com                                  
    C-300042   Kevin Zubarev                        Signs Signs Signs                        5933 Valley St.                          Blackfoot            ID 83221      208-364-3785 sign3@fast.com                                    
    C-300043   Mary Uhl                             Flowers by Mickey                        6936 Citrus Blvd.                        Charleston           SC 29413      803-974-2809 mouse@fast.com                                    
    C-300044   Jennifer Kmec                        Kelly Dance Studio                       9413 E. Broadway St.                     Taneytown            MD 21787      443-542-1386 dancingk@free.com                                 
    C-300045   Marjorie Vandermay                   National Art Museum                      5384 Raymond Ave.                        Beatrice             NE 68310      308-489-1137 nam@fast com                                      
    C-300046   Stephanie Yeinick                    Tuckers Jewels                           2596 S. Fairview Rd.                     Moberly              MO 65270      573-455-4278 jewels@usol.com                                   
    C-300047   Cathy Harvey                         The Employment Agency                    9481 Town Line Rd.                       Asheville            NC 28810      336-477-0249 findwork@onlineservice.com                        
    C-300048   Geo Schofield                        Cleaning Supply                          4931 Talbot Blvd.                        Winona               MS 38967      228-480-9751 cleanit@usol.com                                  
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    C-300049   Kara Orze                            Appliances Inc.                          2666 Stillwater Rd.                      Wausau               WI 54401      414-773-1017 appinc@zeronet.net                                
    C-300050   Jeff Kowaiski                        Quality Equipment Corp.                  3323 Mission Pkwy.                       Wellsville           NY 14895      212-492-5644 equipit@usol.com                                  
    C-300051   Sharon Rouls                         Sharons Shamrock                         1274 Weaver Rd.                          Dothan               AL 36303      205-246-3224 irish@free.com                                    
    C-300052   Sherry Garling                       Manufactured Homes Corp.                 4350 Concord Blvd.                       Millinockets         ME 04462      353-822-7623 homely@fast.com                                   
    C-300053   Mary Deets                           Camping Supplies                         4534 South Acres Rd.                     Pearl City           HI 96782      808-562-4081 camphere@fast.com                                 
    C-300054   Dennis Drazer                        Financial Planning Consul                4799 Silverstar Rd.                      Seattle              WA 98115      253-315-4247 dollarplan@usol.com                               
    C-300055   Robert Lister                        Fire Alarm Systems                       3016 Dunlap Ave.                         Provo                UT 84603      801-404-1240 fines@free.com                                    
    C-300056   Heather Waters                       Happytime Escort Service                 805 Cactus Rd.                           Lake City            SC 29560      869-741-7817 dates@free.com                                    
    C-300057   Anita Pastron                        Industrail Contracting Co                2817 Northern Ave.                       McMinnville          TN 37111      901-796-4654 contracts@fast.com                                
    C-300058   Amy Heide                            Outlets                                  9119 Camelback Rd.                       Brattleboro          VT 05304      802-894-1024 letout@usol.com                                   
    C-300059   Charlene Franks                      Rydell High School                       1627 Thomas Rd.                          Douglas              WY 82633      307-892-2938 learn@rydell.edu                                  
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    C-300060   Doug Blizzard                        Collectibles Inc.                        856 Van Buren St.                        Mars Hill            MS 39666      228-646-5114 collectit@onlineservice.com                       
    C-300061   Richard Scott                        Karate Made Easy                         1489 Dobbins Rd.                         Fairmont             WV 26555      304-774-2226 kick@onlineservice.com                            
    C-300062   Scott Gray                           Security Installation                    115 Shea Blvd.                           York                 PA 17406      484-453-7105 keepsafe@zeronet.net                              
    C-300063   Randy Talauage                       Ceramic Supply                           6364 Brown St.                           Northport            WA 99157      347-671-2022 paintit@fast.com                                  
    C-300064   Daniel Hundnall                      Bobs Repair Service                      909 Reams Rd.                            Enid                 OK 73705      918-830-9731 fixit@usol.com                                    
    C-300065   Sally Valle                          Investment Specialties                   6298 Killingsworth St.                   Denton               TX 76208      972-234-2044 roi@usol.com                                      
    C-300066   Noemi Elston                         North Street Church                      3024 28th St.                            Rock Springs         WY 82902      307-359-9514 closetoheaven@zeronet.net                         
    C-300067   Kelly Jordan                         Supplying Crafts                         168 Division St.                         Jacksonville         FL 32205      727-951-7737 supplycrafts@fast.com                             
    C-300068   Steve Fulkerson                      Cellular Services                        6912 White Horse Rd.                     Snowflake            AZ 85937      602-129-1885 cellcall@usol.com                                 
    C-300069   Orville Gilliland                    Easy Internet Access                     5515 Page-Mill Rd.                       Vancleeve            MS 39565      490-263-2957 eia@zeronet.net                                   
    C-300070   Bridgette Kyger                      Sampson Home Mortgages                   5682 Chester Pike Rd.                    Annapolis            MD 21412      301-467-6480 homeloans@fast.com                                
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    C-300071   Norman Fields                        The Cable Company                        4174 Collings St.                        Juneau               AK 99811      501-346-4841 catv@onlineservice.com                            
    C-300072   Jessica Nakamura                     Automart                                 8233 Clairton Ave.                       Mitchell             SD 57301      605-324-2193 carsell@usol.com                                  
    C-300073   Jack Barrick                         First National Bank                      2638 Becks Run Rd.                       Titusville           FL 32783      786-494-4782 1natbank@free.com                                 
    C-300074   Aricka Bross                         Apartment Referrals                      555 W. Liberty Ave.                      Jewett               OH 43986      419-676-9758 placetolive@free.com                              
    I-300001   Anna Mayton                                                                   2381 Basse Rd.                           McKenzie             Al 36456      888-451-1233 doctor@free.com                                   
    I-300002   Lou Caldwell                                                                  1486 Joliet Rd.                          Louisville           KY 40211      606-901-1238 lucky@fast.com                                    
    I-300003   Carl Hague                                                                    2711 143rd St.                           Cincinnati           OH 45207      419-890-3531                                                   
    I-300004   Jeffery Jordan                                                                1500 Normantown Rd.                      Spokane              WA 99211      509-989-9996 seeya@usol.com                                    
    I-300005   Kimber Spaller                                                                1565 Culebra Rd.                         Sitka                AK 99836      878-119-5448 mcgimmie@zero.net                                 
    I-300006   Eric Fannon                                                                   2526 Nelson Rd.                          Redding              CA 96003      209-980-0812 ef@free.com                                       
    I-300007   Jessica Cain                                                                  942 55th St.                             Greenville           MI 48838      517-901-2610                                                   
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    I-300008   Richard Zito                                                                  7569 130th St.                           Lebanon              NH 03766      603-787-0787 rzito@zeronet.net                                 
    I-300009   Angela Wainscott                                                              3646 North Ave.                          Idaho Falls          ID 83415      208-788-4112 awainscott@free.com                               
    I-300010   James Gross                                                                   1983 Mill St.                            Lakewood             NJ 08701      908-879-8672 jgross@fast.com                                   
    I-300011   Jack Akers                                                                    1485 71st St.                            Wilmington           DE 19850      301-454-6061 pizazz@usol.com                                   
    I-300012   Kevin Jackson                                                                 5990 Cuba Rd.                            New Orleans          LA 70123      225-624-2341                                                   
    I-300013   Shirley Osborne                                                               816 Penny Rd.                            Swainsboro           GA 30401      706-333-7174                                                   
    I-300014   Eric Becker                                                                   8784 Wabash Ave.                         Kinston              NC 28504      910-717-7613 daddyo@usol.com                                   
    I-300015   Karen Mangus                                                                  4804 Ridge Rd.                           Sebring              FL 33871      863-623-0459 missright@onlineservice.com                       
    I-300016   Peter Austin                                                                  4804 River Rd.                           Barnwell             SC 29812      803-343-6063                                                   
    I-300017   Brad Arquette                                                                 2599 Ben Hill Rd.                        Tonopah              NV 89049      775-914-4294 arq@usol.com                                      
    I-300018   Daniel Barton                                                                 4599 Atlanta Rd.                         Sweetwater           TX 79556      915-894-8034 dannie@zeronet.net                                
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    I-300019   Jerry Mennen                                                                  869 Clay St.                             Flagstaff            AZ 86038      520-306-8426 mennenj@free.com                                  
    I-300020   Kenneth Wilcox                                                                9364 Hershell Rd.                        Creston              IA 50801      515-872-8848 kenny@onlineservice.com                           
    I-300021   Matt Smith                                                                    6804 All Rd.                             Montrose             CO 81402      719-822-8828 matsm@fast.com                                    
    I-300022   Paul Sullivan                                                                 9399 Flat Rd.                            Wichita              KS 67251      785-322-5896 sullie@zeronet.net                                
    I-300023   Gerald Campbell                                                               1869 Boundary St.                        Westfield            WI 53964      431-087-1044 gcampbell@free.com                                
    I-300024   Joan Hedden                                                                   4518 Red Bud Trail                       Springdale           AR 72765      501-710-0658                                                   
    I-300025   Ronald Miller                                                                 360 Spring St.                           Kalamazoo            MI 49008      734-820-2076 picky@zeronet.net                                 
    I-300026   Terry Xu                                                                      2019 Elm St.                             Columbia             MO 65215      417-546-2570 muffin@fast.com                                   
    I-300027   Danita Sharp                                                                  3475 Mystic St.                          Yakima               WA 98908      360-650-5604 girlfriend@fast.com                               
    I-300028   Don Kaleta                                                                    8948 Washington St.                      Altoona              PA 16602      724-695-2157 stud@zeronet.net                                  
    I-300029   Tammi Baldocchio                                                              924 North Ave.                           Slatersville         RI 02876      401-989-4975                                                   
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    I-300030   Eric Quintero                                                                 144 Concord Rd.                          Columbus             IN 47202      812-805-1588 diamond@onlineservice.com                         
    I-300031   Phillip Hession                                                               7610 Hartford Ct.                        Battle Creek         MI 49016      231-711-6837 howdy@usol.com                                    
    I-300032   Ruth Albeering                                                                1348 Yonge Rd.                           Galax                VA 24333      784-444-0131 rabeering@free.com                                
    I-300033   Jacob Richer                                                                  1490 N. Shore Rd.                        Ephrata              WA 98823      425-942-3763 laugh@free.com                                    
    I-300034   James Jones                                                                   4685 Vernon St.                          Burns                OR 97720      971-522-5851 puffy@fast.com                                    
    I-300035   Tim Parker                                                                    2848 Marrett Rd.                         Troy                 NY 12182      315-985-4102 jeckle@onlineservice.com                          
    I-300036   Andrea Montgomery                                                             1699 Conner Dr.                          Thurmont             MD 21788      349-397-7772                                                   
    I-300037   Chas Funk                                                                     2490 Maple St.                           Trumbull             CT 06611      860-498-3900 duck@usol.com                                     
    I-300038   David Smith                                                                   9245 Main St.                            Rockford             IL 61125      309-980-4350 emerald@onlineservice.com                         
    I-300039   David Chang                                                                   5786 Manor Rd.                           Mansfield            OH 44907      740-750-1272 lion@free.com                                     
    I-300040   Kathy Gunderson                                                               2257 Oak Springs Rd.                     Marianna             FL 32447      941-330-3314                                                   
    
    CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
    ---------- ------------------------------------ ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
    I-300041   Dennis Mundy                                                                  5781 Red Bud Trail                       Littleton            NH 03561      603-306-0774 rino@usol.com                                     
    I-300042   George Trenkle                                                                1874 Jefferson Ave.                      Edison               NJ 08837      856-267-7913 cold@fast.com                                     
    I-300043   Carey Dailey                                                                  234 Sheridan Dr.                         Denver               CO 80219      728-896-2767 shelty@usol.com                                   
    I-300044   Louise Cool                                                                   6831 Walden Ave.                         Hailey               ID 83333      208-956-0698                                                   
    I-300045   Gary Kempf                                                                    3908 William St.                         Kenton               OH 43326      937-724-7313 kempfg@free.com                                   
    I-300046   Jane Mumford                                                                  8235 Center Rd.                          Campbellsville       KY 42719      270-428-5866                                                   
    I-300047   Scott Yarian                                                                  4198 Center Ridge Rd.                    Whiteville           NC 28472      252-310-2224 syarian@fast.com                                  
    I-300048   Patrick Bollock                                                               1472 Bayley Rd.                          Powell               WY 82435      307-635-1692 pat@fast.com                                      
    I-300049   Paul Rice                                                                     830 Shaker Blvd.                         Craig                CO 81626      719-541-1837 paulier@onlineservice.com                         
    I-300050   James Schilling                                                               2021 North Bend Rd.                      Cedar Rapids         IA 52498      319-429-9772                                                   
    
    241 rows selected. 
    
    Assumption: The assumption is that the user would like to see the id, name, 
    company name, address, city, state, postal code, phone, and email address
    for both new and old customers.

*/
-- Question 5

    INSERT INTO CUSTOMER_ALL(customerid, custname, address, city, state, postalcode)
        VALUES('C-001', 'John Doe', '401 N. Grant St.', 'West Lafayette', 'IN', '47907');
    
    
/* Q5 Query Results

    I am unable to add this customer since the view is made up of two tables. 
    The custname coloumn in particular is what doesn't allow the name to be entered 
    since first name and last name are two fields. Since, the data manipulation 
    operation not legal on this view the customer will not get added.
*/

-- Question 6

    CREATE OR REPLACE VIEW INDIANA_CUSTOMER AS
        SELECT * 
        FROM CUSTOMER_NEW
        WHERE state like 'IN';
        
    SELECT * 
    FROM INDIANA_CUSTOMER;

/* Q6 Query Results

    View INDIANA_CUSTOMER created.

    CUSTOMERID CUSTNAME                            COMPANYNAME                              CUSTT ADDRESS                                  CITY                 ST POSTALCODE FAX          PHONE        EMAILADDR                                         
    ---------- ----------------------------------- ---------------------------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
    C-301      John Day                            Purdue University                        Mr.   401 N. Grant St.                         West Lafayette       IN 47907                   765-494-2560 johnday@purdue.edu                                
    C-302      Shannon Jing                        Purdue University                        Ms.   500 Oval Dr.                             Wset Lafayette       IN 47907                   765-588-7610 jing@purdue.edu                                   
    C-303      Julia Rayz                          Purdue University                        Dr.   401 N. Grant St.                         West Lafayette       IN 47907                   765-494-9525 jtaylor1@purdue.edu                               
    I-301      Shannon Jing                                                                 Ms.   500 Oval Dr.                             West Lafayette       IN 47907                   765-588-7610 tarokingu@gmail.com                               
    I-304      Kate Sun                                                                     Ms.   405 Sagamore Pkwy S.                     Lafayette            IN 47904                                katesun@gmail.com                                 

    
*/

-- Question 7

 INSERT INTO INDIANA_CUSTOMER(customerid, custname, address, city, state, postalcode)
        VALUES('C-001', 'John Doe', '401 N. Grant St.', 'West Lafayette', 'IN', '47907');
        
 COMMIT;

/* Q7 Query Results
    
    1 row inserted.

    Commit complete.

*/

-- Question 8

    DELETE FROM INDIANA_CUSTOMER
        WHERE customerid like 'C-001'; 
        
    SELECT * FROM INDIANA_CUSTOMER;
    SELECT * FROM CUSTOMER_NEW;
    
    COMMIT;

/* Q8 Query Results

    1 row deleted.
    
    CUSTOMERID CUSTNAME                            COMPANYNAME                              CUSTT ADDRESS                                  CITY                 ST POSTALCODE FAX          PHONE        EMAILADDR                                         
    ---------- ----------------------------------- ---------------------------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
    C-301      John Day                            Purdue University                        Mr.   401 N. Grant St.                         West Lafayette       IN 47907                   765-494-2560 johnday@purdue.edu                                
    C-302      Shannon Jing                        Purdue University                        Ms.   500 Oval Dr.                             Wset Lafayette       IN 47907                   765-588-7610 jing@purdue.edu                                   
    C-303      Julia Rayz                          Purdue University                        Dr.   401 N. Grant St.                         West Lafayette       IN 47907                   765-494-9525 jtaylor1@purdue.edu                               
    I-301      Shannon Jing                                                                 Ms.   500 Oval Dr.                             West Lafayette       IN 47907                   765-588-7610 tarokingu@gmail.com                               
    I-304      Kate Sun                                                                     Ms.   405 Sagamore Pkwy S.                     Lafayette            IN 47904                                katesun@gmail.com                                 
    
    CUSTOMERID CUSTNAME                            COMPANYNAME                              CUSTT ADDRESS                                  CITY                 ST POSTALCODE FAX          PHONE        EMAILADDR                                         
    ---------- ----------------------------------- ---------------------------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
    I-305      Helly Smith                                                                  Mrs.  953 Eden Park Dr.                        Cincinnati           OH 45202                   513-639-2995 information@cincyart.org                          
    C-301      John Day                            Purdue University                        Mr.   401 N. Grant St.                         West Lafayette       IN 47907                   765-494-2560 johnday@purdue.edu                                
    C-302      Shannon Jing                        Purdue University                        Ms.   500 Oval Dr.                             Wset Lafayette       IN 47907                   765-588-7610 jing@purdue.edu                                   
    C-303      Julia Rayz                          Purdue University                        Dr.   401 N. Grant St.                         West Lafayette       IN 47907                   765-494-9525 jtaylor1@purdue.edu                               
    C-304      Jack Anderson                       University of Chicago                    Mr.   5801 S. Ellis Ave.                       Chicago              IL 60637      773-702-4199 773-702-8650 infocenter@uchicago.edu                           
    C-305      Kate Johnson                        Michigan University                      Ms.   500 S. State St.                         Ann Arbor            MI 48109                   734-764-1817 info@umich.edu                                    
    I-301      Shannon Jing                                                                 Ms.   500 Oval Dr.                             West Lafayette       IN 47907                   765-588-7610 tarokingu@gmail.com                               
    I-302      Jackson Williams                                                             Mr.   3400 Vine St.                            Cincinnati           OH 45220                                jackwilliams@gmail.com                            
    I-303      Zack Browns                                                                  Mr.   1777 E. Broad St.                        Columnbus            OH 43203                   614-715-0000 zbrowns@yahoo.com                                 
    I-304      Kate Sun                                                                     Ms.   405 Sagamore Pkwy S.                     Lafayette            IN 47904                                katesun@gmail.com                                 
    
    10 rows selected. 

    The customer no longer exists in either of the table/views since we removed them.
    
    Commit complete.

*/

-- Question 9

    DELETE FROM CUSTOMER_NEW;
    
    SELECT * FROM CUSTOMER_NEW;
    
    ROLLBACK;

    
/* Q9 Query Results

    10 rows deleted.
    
    no rows selected

    Rollback complete.
    
    CUSTOMERID CUSTNAME                            COMPANYNAME                              CUSTT ADDRESS                                  CITY                 ST POSTALCODE FAX          PHONE        EMAILADDR                                         
    ---------- ----------------------------------- ---------------------------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
    I-305      Helly Smith                                                                  Mrs.  953 Eden Park Dr.                        Cincinnati           OH 45202                   513-639-2995 information@cincyart.org                          
    C-301      John Day                            Purdue University                        Mr.   401 N. Grant St.                         West Lafayette       IN 47907                   765-494-2560 johnday@purdue.edu                                
    C-302      Shannon Jing                        Purdue University                        Ms.   500 Oval Dr.                             Wset Lafayette       IN 47907                   765-588-7610 jing@purdue.edu                                   
    C-303      Julia Rayz                          Purdue University                        Dr.   401 N. Grant St.                         West Lafayette       IN 47907                   765-494-9525 jtaylor1@purdue.edu                               
    C-304      Jack Anderson                       University of Chicago                    Mr.   5801 S. Ellis Ave.                       Chicago              IL 60637      773-702-4199 773-702-8650 infocenter@uchicago.edu                           
    C-305      Kate Johnson                        Michigan University                      Ms.   500 S. State St.                         Ann Arbor            MI 48109                   734-764-1817 info@umich.edu                                    
    I-301      Shannon Jing                                                                 Ms.   500 Oval Dr.                             West Lafayette       IN 47907                   765-588-7610 tarokingu@gmail.com                               
    I-302      Jackson Williams                                                             Mr.   3400 Vine St.                            Cincinnati           OH 45220                                jackwilliams@gmail.com                            
    I-303      Zack Browns                                                                  Mr.   1777 E. Broad St.                        Columnbus            OH 43203                   614-715-0000 zbrowns@yahoo.com                                 
    I-304      Kate Sun                                                                     Ms.   405 Sagamore Pkwy S.                     Lafayette            IN 47904                                katesun@gmail.com                                 
    
    10 rows selected. 
    
    After deleting everything from the table no rows were returned when the table 
    was queried. After the rollback, however, all 10 rows were selected when 
    the query was ran

*/

-- Question 10

    TRUNCATE TABLE CUSTOMER_NEW;
    
    SELECT * FROM CUSTOMER_NEW;
    
    ROLLBACK;

  
/* Q10 Query Results

    Table CUSTOMER_NEW truncated.

    no rows selected
    
    Rollback complete.

    no rows selected
    
    This result is different from the previous question since truncating the table
    removes everything from it and also commits the changes automatically. This 
    is why when you rollback and query the table again there are still no rows 
    selected.

*/

-- Question 11

    GRANT SELECT ON CUSTOMER_ALL TO CNIT372TA;

/* Q11 Query Results

    Grant succeeded.

*/
-- Question 12 

    REVOKE SELECT ON CUSTOMER_ALL FROM CNIT372TA;

/* Q12 Query Results
    
   Revoke succeeded.
   
*/

-- Question 13

    GRANT SELECT, INSERT, DELETE ON CUSTOMER_ALL TO CNIT372TA;

/* Q13 Query Results:

    Grant succeeded.

*/

-- Question 14

    REVOKE SELECT, INSERT, DELETE ON CUSTOMER_ALL FROM CNIT372TA;

/* Q14 Query Results

    Revoke succeeded.

*/
-- Question 15

    REVOKE SELECT ON CUSTOMER_ALL FROM KDHUPER;
    
/* Q15 Query Results

    Error starting at line : 598 in command -
        REVOKE SELECT ON CUSTOMER_ALL FROM KDHUPER
    Error report -
    ORA-01749: you may not GRANT/REVOKE privileges to/from yourself
    01749. 00000 -  "you may not GRANT/REVOKE privileges to/from yourself"
    *Cause:    
    *Action:
    
*/

-- Question 16

    DROP TABLE CUSTOMER_NEW; 
    DROP VIEW CUSTOMER_NEW_VIEW; 
    DROP VIEW CUSTOMER_ALL;
    DROP VIEW INDIANA_CUSTOMER;

/* Q16 Query Results

    Table CUSTOMER_NEW dropped.

    View CUSTOMER_NEW_VIEW dropped.

    View CUSTOMER_ALL dropped.

    View INDIANA_CUSTOMER dropped.
    
*/

-- Question 17

    CREATE OR REPLACE PROCEDURE  HELLO_WORLD
    (p_name IN varchar2)
    AS 
        v_output VARCHAR2(35);
    BEGIN
        v_output := 'Hello' || p_name;
        dbms_output.put_line (v_output);
    END HELLO_WORLD;


/* Q17 Query Results

    Procedure HELLO_WORLD compiled
    
    https://learn.microsoft.com/en-us/sql/relational-databases/stored-procedures/grant-permissions-on-a-stored-procedure?view=sql-server-ver16

    You need to grant execute priviliges to the user that you want to access your
    stored procedure. 
*/

-- Question 18
    create or replace function NUMBER_OF_EMPLOYEES
    (p_jobtitle IN employee.jobtitle%TYPE)
        return NUMBER
    as
        v_number_of_employees NUMBER := 0;
    begin 
    
        select count(*)
            into v_number_of_employees
        from employee
        where lower(jobtitle) = trim(lower(p_jobtitle));
        
        return v_number_of_employees;
    end NUMBER_OF_EMPLOYEES;
  

    GRANT EXECUTE ON NUMBER_OF_EMPLOYEES TO CNIT372TA;

/* Q18 Query Results

    Function NUMBER_OF_EMPLOYEES compiled

    Grant succeeded.

*/

-- Question 19

    REVOKE EXECUTE ON NUMBER_OF_EMPLOYEES FROM CNIT372TA;
    
/* Q19 Query Results

    Revoke succeeded.

*/

-- Question 20

    DROP PROCEDURE HELLO_WORLD;
    
    CREATE OR REPLACE PROCEDURE  HELLO_WORLD
    (p_name IN varchar2)
    AS 
        v_output VARCHAR2(35);
    BEGIN
        v_output := 'Hello' || p_name;
        dbms_output.put_line (v_output);
    END HELLO_WORLD;

    SELECT * FROM USER_TAB_PRIVS;    
    
/* Q20 Query Results

    Procedure HELLO_WORLD dropped.
    
    Procedure HELLO_WORLD compiled
    
    GRANTEE                                                                                                                          OWNER                                                                                                                            TABLE_NAME                                                                                                                       GRANTOR                                                                                                                          PRIVILEGE                                GRA HIE COM TYPE                     INH
    -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------- --- --- --- ------------------------ ---
    PUBLIC                                                                                                                           SYS                                                                                                                              KDHUPER                                                                                                                          KDHUPER                                                                                                                          INHERIT PRIVILEGES                       NO  NO  NO  USER                     NO 

    The CNIT372TA doesn't have execution permission for Hello_World

*/

-- Question 21

    GRANT EXECUTE ON NUMBER_OF_EMPLOYEES TO CNIT372TA;
  
/* Q21 Query Results

    Grant succeeded.

*/

-- Question 22

    create or replace function NUMBER_OF_EMPLOYEES
    (p_jobtitle IN employee.jobtitle%TYPE)
        return NUMBER
    as
        v_number_of_employees NUMBER := 0;
    begin 
    
        select count(*)
            into v_number_of_employees
        from employee
        where lower(jobtitle) = trim(lower(p_jobtitle));
        
        return v_number_of_employees;
    end NUMBER_OF_EMPLOYEES;
    
    SELECT * FROM USER_TAB_PRIVS;

  
/* Q22 Query Results

    Function NUMBER_OF_EMPLOYEES compiled
    
    GRANTEE                                                                                                                          OWNER                                                                                                                            TABLE_NAME                                                                                                                       GRANTOR                                                                                                                          PRIVILEGE                                GRA HIE COM TYPE                     INH
    -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------- --- --- --- ------------------------ ---
    CNIT372TA                                                                                                                        KDHUPER                                                                                                                          NUMBER_OF_EMPLOYEES                                                                                                              KDHUPER                                                                                                                          EXECUTE                                  NO  NO  NO  FUNCTION                 NO 
    PUBLIC                                                                                                                           SYS                                                                                                                              KDHUPER                                                                                                                          KDHUPER                                                                                                                          INHERIT PRIVILEGES                       NO  NO  NO  USER                     NO 

    The CNIT372TA user still has permission for the newly compiled 
    number_of_employees procedure.

*/
/* Q23 Query Results

    Based on Question 20-22 it is apparent that replacing and recreating a pricedure
    does not remove a user's permissions from it. However, dropping the procedure then 
    recreating it does remove the user's permissions. 
*/
