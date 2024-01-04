-- Clodeaniea 2 Our Government Breakdown 

CREATE TABLE CLODEANIEA2( 
						 STATE VARCHAR(2) PRIMARY KEY NOT NULL, 
						 HOR INT NOT NULL, 
						 SENATE INT NOT NULL,
						 STATE_LOWER INT NOT NULL, 
						 STATE_UPPER INT NOT NULL); 
						 
SELECT * FROM CLODEANIEA2;

INSERT INTO CLODEANIEA2 
VALUES
('NA', 63, 10, 300,	100),
('FR', 38,	10,	300,	100 ),
('KT',	34,	10,	300,	100 ),
('NJ',	29,	10,	300,	100 ),
('SO',	20,	10,	300,	100 ),
('OX',	16,	10,	300,	100 ),
('MA',	15,	10,	300,	100 ),
('CO',	20,	10,	300,	100 ),
('SP',	9,	10,	300,	100 ),
('AZ',	4,	10,	300,	100 ),
('AL',	7,	10,	300,	100 ),
('GU',	4,	10,	300,	100 ),
('HA',	20,	10,	300,	100 ),
('IW',	8,	10,	300,	100 ),
('BE',	16,	10,	300,	100 ),
('NS',	27,	10,	300,	100 ),
('SS',	16,	10,	300,	100 ),
('DO',	11,	10,	300,	100 ),
('DE', 	32,	10,	300,	100 ),
('SU', 	23,	10,	300,	100 ),
('NI',	8,	10,	300,	100 );

SELECT * FROM CLODEANIEA2;

INSERT INTO CLODEANIEA2
VALUES
('OT',	210,	0,	0,	0);

SELECT * FROM CLODEANIEA2;

---- How many seats in the house of represntatives
SELECT SUM(HOR) FROM CLODEANIEA2;

---- Average ammount of sears 
SELECT AVG(HOR) FROM CLODEANIEA2 WHERE STATE != 'OT';

----- How many at Large seats are there 
SELECT STATE, HOR FROM CLODEANIEA2 WHERE STATE = 'OT';
SELECT STATE, HOR FROM CLODEANIEA2 WHERE STATE LIKE 'O%'; --- This gives oxfordshere and at large seats 

---- How many senate seats are there 
SELECT SUM(SENATE) FROM CLODEANIEA2 ;

----- Whats the average SENATE sears
SELECT AVG(SENATE) FROM CLODEANIEA2 WHERE STATE != 'OT';

--- How many state lower seats are there 
SELECT SUM(STATE_LOWER) FROM CLODEANIEA2;

---- What is the at-large composition
SELECT * FROM CLODEANIEA2 WHERE STATE = 'OT';

----- Whats the average state lower seats
SELECT AVG(STATE_LOWER) FROM CLODEANIEA2 WHERE STATE != 'OT';

----- Whats the average state upper seats
SELECT AVG(STATE_UPPER) FROM CLODEANIEA2 WHERE STATE != 'OT';

--- Lets create a super table by combine this together 

SELECT * FROM CLODEANIEA1 AS C1
INNER JOIN CLODEANIEA2 AS C2
ON C1.CODE = C2.STATE; 

SELECT C1.STATE, C1.CODE, C1.CAPITAL, C1.PERCENTAGE, C1.POPULATION, C1.CAT, C2.HOR, C2.SENATE, C1.POPULATION/C2.HOR AS POP_PER_REP FROM CLODEANIEA1 AS C1
INNER JOIN CLODEANIEA2 AS C2
ON C1.CODE = C2.STATE; 

--- EXPORT TABLE FROM THIS POINT

