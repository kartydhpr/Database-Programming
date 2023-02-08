/*
Group 17: Karty Dhuper, Jack Mahedy, Ryan Melenchuk, & Ethan Zeronik
CNIT372
*/
-- 372 Baseball Project Questions ----------------------------------------------
-- Question 1: What is a given team's batting average in a given year?

CREATE OR REPLACE PROCEDURE TeamBattAvg (p_team IN gamelogs.hometeam%TYPE, p_year IN varchar2) AS
    v_visitingAtBats gamelogs.visitingatbats%TYPE;
    v_visitingHits gamelogs.visitinghits%TYPE;
    v_homeAtBats gamelogs.homeatbats%TYPE;
    v_homeHits gamelogs.homehits%TYPE;
    v_totalAtBats gamelogs.homeatbats%TYPE;
    v_totalHits gamelogs.homehits%TYPE;
    v_battAvg NUMBER(4,3);
BEGIN
    SELECT sum(visitingAtBats), sum(visitingHits)
    INTO v_visitingAtBats, v_visitingHits
    FROM gamelogs
    WHERE (p_team LIKE visitingTeam) AND (p_year = trim(TO_CHAR(gamedate, 'YYYY')));
    
    SELECT sum(homeAtBats), sum(homeHits)
    INTO v_homeAtBats, v_homeHits
    FROM gamelogs
    WHERE (p_team LIKE homeTeam) AND (p_year = trim(TO_CHAR(gamedate, 'YYYY')));
    
    v_totalAtBats := v_visitingAtBats + v_homeAtBats;
    v_totalHits := v_visitingHits + v_homeHits;
    v_battAvg := v_totalHits/v_totalAtBats;
    
    dbms_output.put_line(p_team || '''s team-wide batting average for the '|| p_year || ' season is: ' || v_battAvg);      
END TeamBattAvg;
/
EXEC TeamBattAvg('NYA','2021');

-- Question 2: What home and visiting teams had the most strike-outs in a given year? 

CREATE OR REPLACE PROCEDURE TopTeamStrikeouts (p_year IN varchar2) AS
    v_visitingStrikeouts gamelogs.visitingstrikeouts%TYPE;
    v_homeStrikeouts gamelogs.homestrikeouts%TYPE;
    v_vTeam gamelogs.visitingteam%TYPE;
    v_hTeam gamelogs.hometeam%TYPE;
BEGIN
    SELECT visitingTeam
    INTO v_vTeam
    FROM gamelogs
    WHERE (p_year = trim(TO_CHAR(gamedate, 'YYYY')))
    GROUP BY visitingTeam
    HAVING sum(visitingStrikeouts) IN (SELECT max(sum(visitingStrikeouts))
                                       FROM gamelogs
                                       WHERE (p_year = trim(TO_CHAR(gamedate, 'YYYY')))
                                       GROUP BY visitingTeam);
    SELECT max(sum(visitingStrikeouts))
    INTO v_visitingStrikeouts
    FROM gamelogs
    WHERE (p_year = trim(TO_CHAR(gamedate, 'YYYY')))
    GROUP BY visitingTeam;
    
    SELECT homeTeam
    INTO v_hTeam
    FROM gamelogs
    WHERE (p_year = trim(TO_CHAR(gamedate, 'YYYY')))
    GROUP BY homeTeam
    HAVING sum(homeStrikeouts) IN (SELECT max(sum(homeStrikeouts))
                                   FROM gamelogs
                                   WHERE (p_year = trim(TO_CHAR(gamedate, 'YYYY')))
                                   GROUP BY homeTeam);
    SELECT max(sum(homeStrikeouts))
    INTO v_homeStrikeouts
    FROM gamelogs
    WHERE (p_year = trim(TO_CHAR(gamedate, 'YYYY')))
    GROUP BY homeTeam;
    
   dbms_output.put_line(v_vTeam || ' had the most visiting strikeouts in ' || p_year || ' with ' || v_visitingStrikeouts || ' strikeouts.');
   dbms_output.put_line(v_hTeam || ' had the most home strikeouts in ' || p_year || ' with ' || v_homeStrikeouts || ' strikeouts.');
END TopTeamStrikeouts;
/
EXEC TopTeamStrikeouts('2021');

-- Question 3: What is the career-average game duration for every park?

CREATE OR REPLACE PROCEDURE parkGameDuration
AS
    CURSOR all_parks
    IS
        SELECT parkid, nvl(round(avg(timeInMinutes),-1),'0') AS avg_time
        FROM gamelogs
        GROUP BY parkid;        
    current_park all_parks%ROWTYPE;    
BEGIN
    OPEN all_parks;   
    FETCH all_parks INTO current_park;
    WHILE all_parks%FOUND LOOP
        DBMS_OUTPUT.PUT (RPAD(current_park.parkid, 10, ' '));
        DBMS_OUTPUT.PUT_LINE (current_park.avg_time);
        FETCH all_parks INTO current_park;
    END LOOP;
    CLOSE all_parks;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT(SQLCODE);
        DBMS_OUTPUT.PUT(': ');
        DBMS_OUTPUT.PUT_LINE(SUBSTR(SQLERRM, 1, 100));
END parkGameDuration;
/
EXEC parkGameDuration;

-- Question 4: What is the average attendance for a given stadium in a given year? 

--Q4 What is the average attendance for a given stadium in a given year?

CREATE OR REPLACE PROCEDURE ParkAttendAvg (p_park IN gamelogs.parkid%TYPE, p_year IN varchar2) AS
    v_avgAttend gamelogs.attendance%TYPE;
BEGIN
    SELECT avg(attendance)
    INTO v_avgAttend
    FROM gamelogs
    WHERE (p_park LIKE parkid) AND (p_year = trim(TO_CHAR(gamedate, 'YYYY')));

    dbms_output.put_line('Stadium ' || p_park || '''s average attendance for the ' || p_year || ' season was: ' || v_avgAttend);

END ParkAttendAvg;
/
EXEC ParkAttendAvg('NYC21','2021');

-- Question 5: How many home runs did a given player get in a year? 

--Q5 How many home runs did a given team get in a given year?

CREATE OR REPLACE PROCEDURE TeamHomeRuns (p_team IN gamelogs.hometeam%TYPE, p_year IN varchar2) AS
    v_visitingHomeRun gamelogs.visitinghomeruns%TYPE;
    v_homeHomeRun gamelogs.homehomeruns%TYPE;
    v_total gamelogs.homehomeruns%TYPE;
BEGIN
    SELECT sum(visitinghomeruns)
    INTO v_visitingHomeRun
    FROM gamelogs
    WHERE (p_team LIKE visitingTeam) AND (p_year = trim(TO_CHAR(gamedate, 'YYYY')));

    SELECT sum(homehomeruns)
    INTO v_homeHomeRun
    FROM gamelogs
    WHERE (p_team LIKE homeTeam) AND (p_year = trim(TO_CHAR(gamedate, 'YYYY')));

    v_total := v_visitingHomeRun + v_homeHomeRun;
    dbms_output.put_line(p_team || ' had a total of ' || v_total || ' home runs in the ' || p_year || ' season.');

END TeamHomeRuns;
/
EXEC TeamHomeRuns('ATL','2021');

-- Question 6: Who were the umpires at a given stadium on a given date? 

--Q6 Who were the umpires at a given stadium on a given date?

CREATE OR REPLACE PROCEDURE GameUmpires (p_park IN gamelogs.parkid%TYPE, p_date IN varchar2) AS
    v_homePlateUmp gamelogs.homeplateumpireid%TYPE;
    v_firstBaseUmp gamelogs.firstbaseumpireid%TYPE;
    v_secondBaseUmp gamelogs.secondbaseumpireid%TYPE;
    v_thirdBaseUmp gamelogs.thirdbaseumpireid%TYPE;
BEGIN
    SELECT homeplateumpireid, firstbaseumpireid, secondbaseumpireid, thirdbaseumpireid
    INTO v_homePlateUmp, v_firstBaseUmp, v_secondBaseUmp, v_thirdBaseUmp
    FROM gamelogs
    WHERE (p_park LIKE parkid) AND (p_date = trim(TO_CHAR(gamedate, 'MM-DD-YYYY')));

    dbms_output.put_line('On ' || p_date || ' at stadium ' || p_park || ' the umpires were: ' || v_homePlateUmp || ', '  
                                                                                              || v_firstBaseUmp || ', ' 
                                                                                              || v_secondBaseUmp || ', and '
                                                                                              || v_thirdBaseUmp);
END GameUmpires;
/
EXEC GameUmpires('CHI11','04-24-2021');

-- Question 9: Given a date and a stadium, how long was the game?

CREATE OR REPLACE PROCEDURE GameLength (p_date IN varchar2, p_park IN GAMELOGS.PARKID%TYPE)
    AS V_GameLength gamelogs.timeinminutes%type;
BEGIN 
    SELECT timeinminutes	
    INTO V_GameLength
    FROM gamelogs
    WHERE (p_park LIKE parkid) AND (p_date = trim(TO_CHAR(gamedate, 'MM-DD-YYYY')));

    dbms_output.put_line('The game on ' || p_date || ' at stadium ' || p_park || ' was played for '|| V_GameLength ||' minutes.');

END GameLength;

EXEC GameLength('04-24-2021', 'CHI11');

-- Question 10: Given a team and a year, which players were in the top and bottom 50% of average stolen bases.

CREATE OR REPLACE PROCEDURE TopAndBottom50Players(p_team IN GAMELOGS.HOMETEAM%type, p_year IN VARCHAR2) AS
    V_top50 gamelogs.PLAYERNAME%type;
BEGIN
    SELECT player
    INTO V_top50
    FROM GAMELOGS
    WHERE (p_team LIKE HOMETEAM AND p_year = trim(TO_CHAR(gamedate, 'YYYY'))) AND (HOMESTOLENBASES < (select 0.50 * avg(HOMESTOLENBASES) from GAMELOGS));

    dbms_output.put_line('The players that were in the top 50% of stolen bases from' || p_team || ' team, in the year ' || p_year || ' were '|| V_top50 ||'.');

END TopAndBottom50Players;


DESCRIBE GAMELOGS;
SHOW ERRORS;
