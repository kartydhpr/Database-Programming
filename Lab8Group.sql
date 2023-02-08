/*
Partner 1: Marcus Orciuch, Partner 2: Karty Dhuper 
CNIT372 Lab Section #1
Estimated Time Spent: 2hrs
Late hours used: 0
*/

-- Question #1

CREATE VIEW SUPERVISOR AS
    SELECT SUPERVISOR AS ID, COUNT(*) AS NUMBER_OF_EMPLOYEES
    FROM EMPLOYEE
    GROUP BY SUPERVISOR
    ORDER BY SUPERVISOR;

/* Q1 Query Results

View SUPERVISOR created.

*/

-- Question #2

GRANT
    SELECT
ON
    SUPERVISOR
TO
    kdhuper;


/* Q2 Query Results

Grant succeeded.

*/

-- Question #3

select * from morciuch.supervisor;

/* Q3 Query Results

ID         NUMBER_OF_EMPLOYEES
---------- -------------------
100001                       2
100103                       2
100104                       3
100125                       3
100127                       2
100200                       2
100206                       1
100209                       4
100330                       2
100365                       3
100559                       5

ID         NUMBER_OF_EMPLOYEES
---------- -------------------
100650                       2
100880                       3
100944                       5
                             1

15 rows selected.

*/

-- Question #4

INSERT INTO EMPLOYEE 
    (EMPLOYEEID, LASTNAME, FIRSTNAME, SUPERVISOR)
VALUES
    ('999999', 'Doe', 'John', '100001');

/* Q4 Query Results

1 row inserted.

*/

-- Question #5

SELECT *
FROM SUPERVISOR;

/* Q5 Query Results

The new employee is reflected by the view,
as supervisor 100001 now has 3 subordinates
instead of 2.

ID         NUMBER_OF_EMPLOYEES
---------- -------------------
100001                       3
100103                       2
100104                       3
100125                       3
100127                       2
100200                       2
100206                       1
100209                       4
100330                       2
100365                       3
100559                       5

ID         NUMBER_OF_EMPLOYEES
---------- -------------------
100650                       2
100880                       3
100944                       5
                             1

15 rows selected. 

*/

-- Question #6

select * from morciuch.supervisor;

/* Q6 Query Results

    Because the change was not commited to the database
    the new employee was not reflectde in the supervisor 
    view as it still shows 2 instead of 3.
    
ID         NUMBER_OF_EMPLOYEES
---------- -------------------
100001                       2
100103                       2
100104                       3
100125                       3
100127                       2
100200                       2
100206                       1
100209                       4
100330                       2
100365                       3
100559                       5

ID         NUMBER_OF_EMPLOYEES
---------- -------------------
100650                       2
100880                       3
100944                       5
                             1

15 rows selected.


*/

-- Question #7

COMMIT;

/* Q7 Query Results

Commit complete.

*/

-- Question #8

select * from morciuch.supervisor;

/* Q8 Query Results

ID         NUMBER_OF_EMPLOYEES
---------- -------------------
100001                       3
100103                       2
100104                       3
100125                       3
100127                       2
100200                       2
100206                       1
100209                       4
100330                       2
100365                       3
100559                       5

ID         NUMBER_OF_EMPLOYEES
---------- -------------------
100650                       2
100880                       3
100944                       5
                             1

15 rows selected. 

*/

-- Question #9

DELETE FROM EMPLOYEE
    WHERE EMPLOYEEID = '999999';

/* Q9 Query Results

1 row deleted.

*/

-- Question #10

SELECT *
FROM SUPERVISOR;

/* Q10 Query Results

I do see that the new employee that has just
been deleted no longer exists in the SUPERVISOR
view, as supervisor 100001 now has 2 subordinates
instead of 3.

ID         NUMBER_OF_EMPLOYEES
---------- -------------------
100001                       2
100103                       2
100104                       3
100125                       3
100127                       2
100200                       2
100206                       1
100209                       4
100330                       2
100365                       3
100559                       5

ID         NUMBER_OF_EMPLOYEES
---------- -------------------
100650                       2
100880                       3
100944                       5
                             1

15 rows selected. 

*/

-- Question #11

select * from morciuch.supervisor;

/* Q11 Query Results

    I do not see the change as the changes were not committed.
    
ID         NUMBER_OF_EMPLOYEES
---------- -------------------
100001                       3
100103                       2
100104                       3
100125                       3
100127                       2
100200                       2
100206                       1
100209                       4
100330                       2
100365                       3
100559                       5

ID         NUMBER_OF_EMPLOYEES
---------- -------------------
100650                       2
100880                       3
100944                       5
                             1

15 rows selected. 

*/

-- Question #12

REVOKE
    SELECT
ON
    SUPERVISOR
FROM  
    kdhuper;
    

/* Q12 Query Results

Revoke succeeded.

*/

-- Question #13

select * from morciuch.supervisor;

/* Q13 Query Results

Error starting at line : 294 in command -
select * from morciuch.supervisor
Error at Command Line : 294 Column : 24
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

The message is misleading because it doesnt specify 
that I don't have read/write privileges. even though the 
table does exist - i just don't have the priviliges.

*/

-- Question #14

DROP VIEW SUPERVISOR;

/* Q14 Query Results

View SUPERVISOR dropped.

*/

-- Question #15

/* Since we don't have the correct permissions to
   query the DBA_SYS_PRIVS, DBA_TAB_PRIVS, or 
   USER_SYS_PRIVS tables, we are unable to exactly
   verify what permission we are missing. However, 
   the documentation states that we need the following
   permissions to create materialized views:
   - CREATE MATERIALIZED VIEW system privilage (probably the one missing)
   - CREATE TABLE system privilage
   - CREATE ANY TABLE system privilage 
   The CREATE MATERIALIZED VIEW system privilage is probably
   not given to students, because a materialzied view stores
   snapshots of the query instead of doing the query in memory,
   which takes up additional storage.
   */

-- Question #16
/*
    We weren't able to verify what permissions we were lacking as 
    we didn't have the nessecary permissions to query the DBA_SYS_PRIVS, 
    DBA_TAB_PRIVS, or USER_SYS_PRIVS tables. The documentation states, however,
    that we would require the CREATE ROLE permission to create a role.
    These priviliges were probably not provided by the ECN database administrators
    because allowing low ranking individuals the ability to give themselves role would be destructive. 
*/  

/* Q16 Query Results

[Result goes here]

*/