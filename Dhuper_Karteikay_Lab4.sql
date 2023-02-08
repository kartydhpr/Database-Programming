/*
Karteikay (Karty) Dhuper
CNIT372 Lab Section # 007
Estimated Time Spent: 5 hours
Late hours used: 0
*/

SET SERVEROUTPUT ON

-- Question #1a

    select jobtitle, count(employeeid)
    from employee 
    group by jobtitle;

/* Q1a Query Results

    JOBTITLE                            COUNT(EMPLOYEEID)
    ----------------------------------- -----------------
    VP Finance                                          1
    Sales                                               3
    VP Information                                      1
    Chief Information Officer                           1
    Chief Sales Officer                                 1
    VP Operations                                       1
    Accountant                                          2
    President                                           1
    DBA                                                 1
    Chief Financial Officer                             1
    Engineer                                            5
    
    JOBTITLE                            COUNT(EMPLOYEEID)
    ----------------------------------- -----------------
    Programmer Analyst                                  2
    Operations Officer                                  2
    Assembly                                           18
    
    14 rows selected. 

*/

-- Question #1b

    DECLARE 
        v_number_employees number; 
        v_jobtitle varchar2(50) := '&v_jobtitle';
        
    BEGIN 
        select count(employeeID)
            into v_number_employees
        from employee 
        where jobtitle = v_jobtitle;
        
        if v_number_employees < 1 then
            DBMS_OUTPUT.PUT_LINE ('There are no employees with the job title: ' || v_jobtitle);
        elsif v_number_employees < 4 then 
            DBMS_OUTPUT.PUT_LINE ('There are between 1 and 3 employees with the job title: ' || v_jobtitle);
        elsif v_number_employees < 7 then 
            DBMS_OUTPUT.PUT_LINE ('There are between 4 and 6 employees with the job title: ' || v_jobtitle);
        else 
            DBMS_OUTPUT.PUT_LINE ('There are 7 or more employees with the job title: ' || v_jobtitle);
        END IF;
    END;

/* Q1b Query Results
    
    There are no employees with the job title: CIO

*/
/* Q1c Query Results

    There are between 1 and 3 employees with the job title: Accountant

*/
/* Q1d Query Results

    There are between 4 and 6 employees with the job title: Engineer
    
*/
/* Q1e Query Results

    There are 7 or more employees with the job title: Assembly

*/
    
-- Question 2a

    DECLARE 
        v_number_employees number; 
        v_jobtitle varchar2(50) := '&v_jobtitle';
        
    BEGIN 
        select count(employeeID)
            into v_number_employees
        from employee 
        where jobtitle = v_jobtitle;
        
        case v_number_employees
        when 0 then
            DBMS_OUTPUT.PUT_LINE ('There are no employees with the job title: ' || v_jobtitle);
        when 1 then
            DBMS_OUTPUT.PUT_LINE ('There are between 1 and 3 employees with the job title: ' || v_jobtitle);
        when 2 then
            DBMS_OUTPUT.PUT_LINE ('There are between 1 and 3 employees with the job title: ' || v_jobtitle);
        when 3 then
            DBMS_OUTPUT.PUT_LINE ('There are between 1 and 3 employees with the job title: ' || v_jobtitle);
        when 4 then
            DBMS_OUTPUT.PUT_LINE ('There are between 4 and 6 employees with the job title: ' || v_jobtitle);
        when 5 then
            DBMS_OUTPUT.PUT_LINE ('There are between 4 and 6 employees with the job title: ' || v_jobtitle);    
        when 6 then
            DBMS_OUTPUT.PUT_LINE ('There are between 4 and 6 employees with the job title: ' || v_jobtitle);
        else 
            DBMS_OUTPUT.PUT_LINE ('There are 7 or more employees with the job title: ' || v_jobtitle);
        end case;
    END;

/* Q2A Query Results:

    There are no employees with the job title: CIO

*/

/* 
-- Q2b Query Results

    There are between 1 and 3 employees with the job title: Accountant

*/
/* 
-- Q2c Query Results

    There are between 4 and 6 employees with the job title: Engineer
    
*/
/* 

-- Q2d Query Results

    There are 7 or more employees with the job title: Assembly

*/

-- Question #3

    DECLARE 
        v_number_employees number; 
        v_jobtitle employee.jobtitle%TYPE := '&v_jobtitle';
        v_staff_level varchar2(100);
        
    BEGIN 
        select count(employeeID)
            into v_number_employees
        from employee 
        where jobtitle = v_jobtitle;
        
        case v_number_employees
        when 0 then
            v_staff_level := 'There are no employees with the job title: ';
        when 1 then
            v_staff_level := 'There are between 1 and 3 employees with the job title: ';
        when 2 then
            v_staff_level := 'There are between 1 and 3 employees with the job title: ';
        when 3 then
            v_staff_level := 'There are between 1 and 3 employees with the job title: ';
        when 4 then
            v_staff_level := 'There are between 4 and 6 employees with the job title: ';
        when 5 then
            v_staff_level := 'There are between 4 and 6 employees with the job title: ';    
        when 6 then
            v_staff_level :=  'There are between 4 and 6 employees with the job title: ';
        else 
            v_staff_level := 'There are 7 or more employees with the job title: ';
        end case;
        DBMS_OUTPUT.PUT_LINE(v_staff_level || v_jobtitle);
    END;

/* Q3 Query Results

    There are between 4 and 6 employees with the job title: Engineer

*/

-- Question #4a

    DECLARE
        my_count integer := '&MY_COUNT';
        my_counter integer := 1; 
        my_number integer; 
    BEGIN
        loop 
            my_number := dbms_random.value(1,MY_COUNT); 
            DBMS_OUTPUT.PUT(my_number || ',');
            my_counter := my_counter + 1; 
            exit when my_counter > my_count;
        end loop;
        DBMS_OUTPUT.PUT_LINE ('');
    END;

/* Q4a Query Results

    1,2,1,3,2,

*/
/* Question 4b

    This loop iterates through the value of my_count the user specifies. In each 
    iteration the program prints a random number between 1 and the user specified
    my_count value.

*/

-- Question #4a

    DECLARE
        my_count integer := '&MY_COUNT';
        my_counter integer := 1; 
        my_number integer; 
    BEGIN
        while(my_counter <= my_count) 
        Loop
            my_number := dbms_random.value(1,MY_COUNT); 
            DBMS_OUTPUT.PUT(my_number || ',');
            my_counter := my_counter + 1; 
            exit when my_counter > my_count;
        end loop;
        DBMS_OUTPUT.PUT_LINE ('');
    END;
    
-- Question #4b

-- 2,3,4,2,5,


-- Question #5a

    DECLARE
        my_count integer := '&MY_COUNT';
        my_counter integer := 1; 
        my_number integer; 
    BEGIN
        for my_counter in 1..my_count 
        loop 
            my_number := dbms_random.value(1,MY_COUNT); 
            DBMS_OUTPUT.PUT(my_number || ',');
        end loop;
        DBMS_OUTPUT.PUT_LINE ('');
    END;


-- Question #5b

-- 2,2,3,2,5,


----------  TABLE 2 QUESIONS ----------

-- Question #1a

    CREATE OR REPLACE PROCEDURE HELLO_WORLD
    AS
        V_OUTPUT   VARCHAR2(35) := 'Hello World';
    BEGIN 
        dbms_output.put_line (v_output);
    END HELLO_WORLD;

    
/* Q1a Query Results

    Procedure HELLO_WORLD compiled

    Printed on the Script Output pane.

*/
/* Question 1B
    
    EXECUTE HELLO_WORLD;
    
*/

-- Question #1c

    EXECUTE HELLO_WORLD;

/* Q1c Query Results

    Hello World
    
*/

/* Question 1d
    
    A named block is stored in the Oracle database and can be reused later. 
    An anonymous block on the other hand is not saved into the oracle database 
    and therefore can't be reused.

*/

-- Question #2

    CREATE OR REPLACE PROCEDURE hello_world AS
        v_output VARCHAR2(35) := 'Hello World';
    BEGIN
        dbms_output.put_line(v_output);
    END hello_world;

/* Q2 Query Results

    The formatting changes the caseing to lower case for the procedure and variable name.

*/

-- Question #3

    CREATE OR REPLACE PROCEDURE  HELLO_WORLD
    (p_name IN varchar2)
    AS 
        v_output VARCHAR2(35);
    BEGIN
        v_output := 'Hello' || p_name;
        dbms_output.put_line (v_output);
    END HELLO_WORLD;

/* Q3 Query Results
    
    Procedure HELLO_WORLD compiled

*/

-- Question #3a

    EXECUTE HELLO_WORLD(' World');

/* Q3a Query Results

    Hello World
    
*/

-- Question #3b

    EXECUTE HELLO_WORLD(' Mark');

/* Q3b Query Results

    Hello Mark

*/

-- Question #3c

     EXECUTE HELLO_WORLD(' World procedure. I have so much fun coding in SQL and PLSQL');

/* Q3c Query Results
    
    Error starting at line : 333 in command -
    BEGIN HELLO_WORLD(' World procedure. I have so much fun coding in SQL and PLSQL'); END;
    Error report -
    ORA-06502: PL/SQL: numeric or value error: character string buffer too small
    ORA-06512: at "KDHUPER.HELLO_WORLD", line 6
    ORA-06512: at line 1
    06502. 00000 -  "PL/SQL: numeric or value error%s"
    *Cause:    An arithmetic, numeric, string, conversion, or constraint error
               occurred. For example, this error occurs if an attempt is made to
               assign the value NULL to a variable declared NOT NULL, or if an
               attempt is made to assign an integer larger than 99 to a variable
               declared NUMBER(2).
    *Action:   Change the data, how it is manipulated, or how it is declared so
               that values do not violate constraints.

*/

-- Question #3d

    CREATE OR REPLACE PROCEDURE  HELLO_WORLD
    (p_name IN varchar2)
    AS 
        v_output VARCHAR2(100);
    BEGIN
        v_output := 'Hello' || p_name;
        dbms_output.put_line (v_output);
    END HELLO_WORLD;

/* Q3d Query Results

    Procedure HELLO_WORLD compiled

*/

-- Question #3e

    EXECUTE HELLO_WORLD(' World procedure. I have so much fun coding in SQL and PLSQL');

/* Q3e Query Results

    Hello World procedure. I have so much fun coding in SQL and PLSQL

*/

-- Question #4

    CREATE OR REPLACE PROCEDURE HELLO_WORLD
    (
        p_greeting IN varchar2, 
        p_name IN varchar2
    )
    AS 
        v_output varchar2(75);
    BEGIN 
        v_output := p_greeting || ' ' || p_name;
        dbms_output.put_line (v_output);
        DBMS_OUTPUT.PUT_LINE ('');
    END HELLO_WORLD;
    
/* Q4 Query Results

    Procedure HELLO_WORLD compiled

*/

-- Question #4a

    execute HELLO_WORLD('Hello','World');

/* Q4a Query Results

    Hello World
    
*/

-- Question #4b

    execute HELLO_WORLD('World');

/* Q4b Query Results

    A compilation error

    Error starting at line : 375 in command -
    BEGIN HELLO_WORLD('World'); END;
    Error report -
    ORA-06550: line 1, column 7:
    PLS-00306: wrong number or types of arguments in call to 'HELLO_WORLD'
    ORA-06550: line 1, column 7:
    PL/SQL: Statement ignored
    06550. 00000 -  "line %s, column %s:\n%s"
    *Cause:    Usually a PL/SQL compilation error.
    *Action:

*/

-- Question #4c

    execute HELLO_WORLD('Goodbye', 'Hal');

/* Q4c Query Results

    Goodbye Hal
    
*/

-- Question #4d

    execute HELLO_WORLD('Hello', null);

/* Q4d Query Results

    Hello 

*/

-- Question #5

    create or replace function NUMBER_OF_EMPLOYEES
        return NUMBER
    as
        v_number_of_employees NUMBER := 0;
    begin 
    
        select count(*)
            into v_number_of_employees
        from employee;
        
        return v_number_of_employees;
    end NUMBER_OF_EMPLOYEES;
    
    BEGIN 
        dbms_output.put_line('Number of employees: '|| NUMBER_OF_EMPLOYEES());
    END;

/* Q5 Query Results

    Number of employees: 40
    
*/

-- Question #6

    create or replace function NUMBER_OF_EMPLOYEES
    (p_jobtitle IN varchar2)
        return NUMBER
    as
        v_number_of_employees NUMBER := 0;
    begin 
    
        select count(*)
            into v_number_of_employees
        from employee
        where jobtitle = p_jobtitle;
        
        
        return v_number_of_employees;
    end NUMBER_OF_EMPLOYEES;
    
/* Q6 Query Results

    Function NUMBER_OF_EMPLOYEES compiled

*/

-- Question #6a

    BEGIN 
        dbms_output.put_line('Number of employees: '|| NUMBER_OF_EMPLOYEES('Engineer'));
    END;
    
/* Q6a Query Results

    Number of employees: 5

*/

-- Question #6b

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


-- Question #6c

    BEGIN 
        dbms_output.put_line('Number of employees: '|| NUMBER_OF_EMPLOYEES('engineer'));
    END;

/* Q6c Query Results

    Number of employees: 5

*/

-- Question #6d

    BEGIN 
        dbms_output.put_line('Number of employees: '|| NUMBER_OF_EMPLOYEES('dba'));
    END;


/* Q6d Query Results

    Number of employees: 1

*/

-- Question #6e

    BEGIN 
        dbms_output.put_line('Number of employees: '|| NUMBER_OF_EMPLOYEES('DBA'));
    END;

/* Q6e Query Results

    Number of employees: 1
    
*/

-- Question #6f
    
    BEGIN 
        dbms_output.put_line('Number of employees: '|| NUMBER_OF_EMPLOYEES('chief sales officer'));
    END;

/* Q6f Query Results

    Number of employees: 1

*/

-- Question #6g

    BEGIN 
        dbms_output.put_line('Number of employees: '|| NUMBER_OF_EMPLOYEES('   chief sales officer   '));
    END;

/* Q6g Query Results

    Number of employees: 1

*/

-- Question #6h

    BEGIN 
        dbms_output.put_line('Number of employees: '|| NUMBER_OF_EMPLOYEES('CEO'));
    END;

/* Q6h Query Results

    Number of employees: 0

*/

-- Question #7a

 CREATE OR REPLACE FUNCTION DAYS_AWAYY
    (
        p_date IN DATE
    ) RETURN NUMBER 
    AS 
        v_days_away NUMBER;
    BEGIN 
        select round(p_date - sysdate, 0)
            into v_days_away
        from dual;
        return v_days_away;
    END DAYS_AWAYY;

/* Q7a Query Results

    Function DAYS_AWAYY compiled

*/

-- Question #7b

    select DAYS_AWAYY(sysdate) from dual;

/* Q7b Query Results

    DAYS_AWAYY(SYSDATE)
    -------------------
                      0
                      
*/

-- Question #8a

    CREATE OR REPLACE PROCEDURE DAY_OF_THE_WEEK (p_date IN date) 
    AS week_day varchar2(100);
    BEGIN 
        select to_char(p_date -1, 'day') || to_char(p_date, 'day') || to_char(p_date +1, 'day')
            into week_day
        from dual;
        dbms_output.put_line(week_day);
    END DAY_OF_THE_WEEK;
    
-- Question #8b

    exec day_of_the_week('01-OCT-22');
    exec day_of_the_week(sysdate);

/* Q8b Query Results

    friday saturday sunday   
    saturday sunday monday   
    
*/
-- Question #8a

    create or replace procedure days_from_weekend(p_date in date default sysdate())
    as
        week_day number;
    begin 
        week_day := to_char(p_date, 'd');
        
        if week_day = '2' then 
            dbms_output.put_line('5 days until the weekend');
        elsif week_day = '3' then
            dbms_output.put_line('4 days until the weekend');
        elsif week_day = '4' then
            dbms_output.put_line('3 days until the weekend');
        elsif week_day = '5' then
            dbms_output.put_line('2 days until the weekend');
        elsif week_day = '6' then
            dbms_output.put_line('1 days until the weekend');
        elsif week_day = '7' then
            dbms_output.put_line('Its the weekend');
        elsif week_day = '1' then       
            dbms_output.put_line('Its the weekend');
        end if;
    end days_from_weekend;

-- Question #8b

    exec days_from_weekend('05-OCT-22');
    exec days_from_weekend(sysdate);

/* Q8b Query Results

    3 days until the weekend
    Its the weekend

*/