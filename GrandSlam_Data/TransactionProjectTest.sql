DROP TABLE TRANSACTIONS CASCADE CONSTRAINTS;

CREATE TABLE Transactions(
    PrimaryDate date NOT NULL,
    Time number(1,0),
    PrimaryDateIsApproximate number(1,0),
    SecondaryDate date, 
    SecondaryDateIsApproximate number(1,0),
    TransactionID varchar2(5) NOT NULL PRIMARY KEY,
    PlayerID varchar2(8) NOT NULL,
    Type varchar2(2) NOT NULL,
    FromTeam varchar2(255),
    FromLeague varchar2(255),
    ToTeam varchar2(255),
    ToLeague varchar2(255),
    DraftType varchar2(3),
    DraftRound number(2,0),
    PickNumber number(2,0),
    OtherInformation varchar2(255)
);

