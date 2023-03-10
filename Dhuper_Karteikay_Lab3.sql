/*
Karteikay (Karty) Dhuper
CNIT372 Lab Section # 007
Estimated Time Spent: 2hrs total
Late hours used: 0
*/

-- Question #1

    begin
        DBMS_OUTPUT.PUT_LINE('Hello World');
    end;

/*  Q1 Query Results
    
    Nothing is outputted from DBMS Output
    Script Output states: PL/SQL procedure successfully completed.
    
*/

-- Question #2

    set serveroutput on;

/* Q2 Query Results
    Nothing for this question.
*/

-- Question #3

    begin
        DBMS_OUTPUT.PUT_LINE('Hello World');
    end;

/* Q3 Query Results

    Hello World
    
    PL/SQL procedure successfully completed.

*/

-- Question #4
/*

    "The SERVEROUTPUT setting controls whether SQL*Plus prints the output generated by the DBMS_OUTPUT package from PL/SQL procedures."
    
    Source: https://www.oreilly.com/library/view/oracle-sqlplus-the/0596007469/re85.html
    
*/

-- Question #5

    begin
        DBMS_OUTPUT.PUT_LINE('The Ubiquitous Hello World');
    end;

/* Q5 Query Results

    The Ubiquitous Hello World
    
    PL/SQL procedure successfully completed.

*/

-- Question #6

    begin
        DBMS_OUTPUT.PUT('The');
        DBMS_OUTPUT.PUT(' ');
        DBMS_OUTPUT.PUT('Ubiquitous');
        DBMS_OUTPUT.PUT(' ');
        DBMS_OUTPUT.PUT('Hello');
        DBMS_OUTPUT.PUT(' ');
        DBMS_OUTPUT.PUT_LINE('World');
    end;

/* Q6 Query Result

    The Ubiquitous Hello World
    
    PL/SQL procedure successfully completed.

*/

-- Question #7
/* 
    I think the DBMS_OUTPUT.PUT line adds strings to the same line. Whereas 
    DBMS_OUTPUT.PUT_LINE declares the end of line for a particular string of 
    characters.

*/

-- Question #8
/* 

    "You can build a line of information piece by piece by making multiple calls to DBMS.OUTPUT.PUT"
    source: https://docs.oracle.com/cd/E11882_01/timesten.112/e21645/d_output.htm#TTPLP71212

*/

-- Question #9
/* 

    "When you call PUT_LINE, the item you specify is automatically followed by an end-of-line marker"
    source: https://docs.oracle.com/cd/E11882_01/timesten.112/e21645/d_output.htm#TTPLP71212

*/

-- Question #10
/*

    The .PUT procedure lets you build a line of information piece by piece by calling it repeatedly, whereas 
    the .PUT_LINE procedure marks the end of line.

*/

-- Question #11

    begin 
            DBMS_OUTPUT.PUT_LINE ('My name is ' || '&sv_Yourname');
    end;

/* Q11 Query Results
    
    My name is Karty

    Initially it asks me to insert a value for sv_Yourname, after which it 
    prints my name to the screen with the concatonated text before it.
    
*/

-- Question #12

    set verify on;

/*
*/

-- Question #13

    begin 
            DBMS_OUTPUT.PUT_LINE ('My name is ' || '&sv_Yourname');
    end;
    
/* Q13 Query Results

    old:    begin 
                DBMS_OUTPUT.PUT_LINE ('My name is ' || '&sv_Yourname');
        end;
    new:begin 
                DBMS_OUTPUT.PUT_LINE ('My name is ' || 'Karty');
        end;
    My name is Karty
    
    
    PL/SQL procedure successfully completed.

*/

-- Question #14

    set verify off;
    
/*
*/

-- Question #15

    begin 
            DBMS_OUTPUT.PUT_LINE ('My name is ' || '&sv_Yourname');
    end;

/* Q15 Query Results
    
    My name is Karty

    PL/SQL procedure successfully completed.
    
    DBMS: My name is Karty

*/

/* Question 16

    "The VERIFY setting controls whether or not SQL*Plus displays before and after images of each line that contains a substitution variable."
    source: https://www.oreilly.com/library/view/oracle-sqlplus-the/0596007469/re106.html
    
*/

-- Question #17

    begin
        DBMS_OUTPUT.PUT_LINE ('My name is '||'&sv_YourName');
    end;

/* Q17 Query Results

    I am prompted to input a value every time I run the statement. This means there
    is no persistence in inputted value by default in PL/SQl.
    
*/

-- Question #18

    begin 
            DBMS_OUTPUT.PUT_LINE ('Today is ' || '&sv_day');
            DBMS_OUTPUT.PUT_LINE ('Tomorrow is ' || '&sv_day');
    end; 

/* Q18 Query Results

    Today is Wednesday
    Tomorrow is Thursday
    
    You can use the same variable name twice within the same unnamed block. 
    It simply asks for an input for the same variable twice and prints them 
    accordingly as shown above.

*/

-- Question #19

    begin 
            DBMS_OUTPUT.PUT_LINE ('Today is ' || '&&sv_day');
            DBMS_OUTPUT.PUT_LINE ('Tomorrow is ' || '&sv_day');
    end; 

/* Q19 Query Results

    Today is wednesday
    Tomorrow is wednesday
    
    I was not prompted to provide a value when the second DBMS_OUTPUT was executed
    this is because there were two Ampersands (&) before the variable name in the 
    first DBMS_OUTPUT line.
    
*/

/* Question 20 Query Results
    
    Today is wednesday
    Tomorrow is wednesday
    
    This time I was not prompted to provide the input for any variable. It used 
    the value of "Wednesday" automatically. This implies that the && command results 
    in persistent variable input storage in the program. 

*/

-- Question #21

    declare
        V_DAY varchar2(10) := '&sv_day1' ;
    begin 
        DBMS_OUTPUT. PUT_LINE ('Today is ' || V_DAY);
    end;
    
/* Q21 Query Results

    Today is Friday

*/

-- Question #22

    declare
        V_DAY varchar2(10) ; 
    begin
        V_DAY := to_char (sysdate, 'Day');
    
        DBMS_OUTPUT. PUT_LINE ('Today is ' || V_DAY);
        DBMS_OUTPUT. PUT_LINE ('Tomorrow is ' || to_char(sysdate +1, 'Day'));
    end;

/* Q22 Query Results

    Today is Wednesday
    Tomorrow is Thursday 
    
*/

-- Question #23

    select employeeID
    from employee
    where employeeID = '100001';

/* Q23 Query Results

    EMPLOYEEID
    ----------
    100001

    1 Row was returned from this query.
    
*/

-- Question #24

    declare
        V_EMPLOYEEID EMPLOYEE.EMPLOYEEID%TYPE;
        V_LASTNAME  EMPLOYEE.LASTNAME %TYPE;
        V_FIRSTNAME EMPLOYEE.FIRSTNAME%TYPE;
    begin 
        select EMPLOYEEID, LASTNAME, FIRSTNAME
            into V_EMPLOYEEID , V_LASTNAME, V_FIRSTNAME
        from EMPLOYEE 
        where EMPLOYEEID = '100001';
        
        DBMS_OUTPUT.PUT_LINE ('Employee ID      LASTNAME        FIRSTNAME');
        DBMS_OUTPUT.PUT_LINE ('==========================================');
        DBMS_OUTPUT.PUT (V_EMPLOYEEID);
        DBMS_OUTPUT.PUT ('             ');
        DBMS_OUTPUT.PUT (V_LASTNAME);
        DBMS_OUTPUT.PUT ('        ');
        DBMS_OUTPUT.PUT_LINE (V_FIRSTNAME);
    end;

/* Q24 Query Results

    Employee ID      LASTNAME        FIRSTNAME
    ==========================================
    100001             Manaugh        Jim

*/

-- Question 25

    select employeeID 
    from employee;

/* Q25 Query Results

    40 rows are returned from this query.
    
*/

-- Question 26

    declare
        V_EMPLOYEEID EMPLOYEE.EMPLOYEEID%TYPE;
        V_LASTNAME  EMPLOYEE.LASTNAME %TYPE;
        V_FIRSTNAME EMPLOYEE.FIRSTNAME%TYPE;
    begin 
        select EMPLOYEEID, LASTNAME, FIRSTNAME
            into V_EMPLOYEEID , V_LASTNAME, V_FIRSTNAME
        from EMPLOYEE;
        
        DBMS_OUTPUT.PUT_LINE ('Employee ID      LASTNAME        FIRSTNAME');
        DBMS_OUTPUT.PUT_LINE ('==========================================');
        DBMS_OUTPUT.PUT (V_EMPLOYEEID);
        DBMS_OUTPUT.PUT ('             ');
        DBMS_OUTPUT.PUT (V_LASTNAME);
        DBMS_OUTPUT.PUT ('        ');
        DBMS_OUTPUT.PUT_LINE (V_FIRSTNAME);
    end;

/* Q26 Query Results
 
    Error starting at line : 341 in command -
        declare
            V_EMPLOYEEID EMPLOYEE.EMPLOYEEID%TYPE;
            V_LASTNAME  EMPLOYEE.LASTNAME %TYPE;
            V_FIRSTNAME EMPLOYEE.FIRSTNAME%TYPE;
        begin 
            select EMPLOYEEID, LASTNAME, FIRSTNAME
                into V_EMPLOYEEID , V_LASTNAME, V_FIRSTNAME
            from EMPLOYEE;
    
            DBMS_OUTPUT.PUT_LINE ('Employee ID      LASTNAME        FIRSTNAME');
            DBMS_OUTPUT.PUT_LINE ('==========================================');
            DBMS_OUTPUT.PUT (V_EMPLOYEEID);
            DBMS_OUTPUT.PUT ('             ');
            DBMS_OUTPUT.PUT (V_LASTNAME);
            DBMS_OUTPUT.PUT ('        ');
            DBMS_OUTPUT.PUT_LINE (V_FIRSTNAME);
        end;
    Error report -
    ORA-01422: exact fetch returns more than requested number of rows
    ORA-06512: at line 6
    01422. 00000 -  "exact fetch returns more than requested number of rows"
    *Cause:    The number specified in exact fetch is less than the rows returned.
    *Action:   Rewrite the query or change number of rows requested

*/
/* Question 27
    
    40 values are trying to be assigned to each of the variables. PL/SWL seems to 
    through an exception when trying to do this and prompts you to rewrite the 
    query or change the number of rows requested. 

*/
/* Question 28

    The fetch from the query should return less than the requested number of rows.
    
*/

-- Question 29

    declare
        V_EMPLOYEE employee%ROWTYPE;
    begin 
        select * into V_EMPLOYEE from EMPLOYEE where EMPLOYEEID = '100001';
        
        DBMS_OUTPUT.PUT_LINE ('Employee ID      LASTNAME        FIRSTNAME');
        DBMS_OUTPUT.PUT_LINE ('==========================================');
        DBMS_OUTPUT.PUT_LINE (V_EMPLOYEE.EMPLOYEEID||'          '||V_EMPLOYEE.LASTNAME||'           '||V_EMPLOYEE.FIRSTNAME);
    end;


/* Q29 Query Results

    Employee ID      LASTNAME        FIRSTNAME
    ==========================================
    100001          Manaugh           Jim
    
    The output of Q24 and Q29 are virtually identical. The difference lies in the
    syntax. In 29 we are able to condense the number of lines needed by concatonating 
    the DBMS_OUTPUT lines into one line. We are are also not declaring specific 
    rows from the table like in 24. By getting all the rows in 29 we are able to 
    write more efficient code. 
    
*/

-- Question 30

     V_EMPLOYEEID EMPLOYEE.HOMEPHONE%TYPE;
         
/*
*/

-- Question 31a

    declare 
        v_customer INTEGER;
    
    begin 
        select max(count(customerid))
        into v_customer
        from customer
        group by substr(phone, 1, 3);
        
    end;

/* Q31a Query Results

    PL/SQL procedure successfully completed.
*/

-- Question 31b

    declare 
        v_customer INTEGER;
    
    begin 
        select max(count(customerid))
        into v_customer
        from customer
        group by substr(phone, 1, 3);
    
        dbms_output.put_line('Largest No. Of Customers');
        dbms_output.put_line(v_customer);
        
    end;

/* Q31b Query Results

    Largest No. Of Customers
    8

*/
