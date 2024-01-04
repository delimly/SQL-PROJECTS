-- Clodeaniea Table1 : States, Code, Capital , %, Populaion

CREATE TABLE CLODEANIEA1(STATE varchar(30) PRIMARY KEY NOT NULL,
						 CODE char(2) NOT NULL, 
						 CAPITAL varchar(30) NOT NULL);
						 
ALTER TABLE CLODEANIEA1 ADD COLUMN PERCENTAGE float ADD COLUMN POPULATION BIGINT; 

SELECT * FROM CLODEANIEA1;

INSERT INTO CLODEANIEA1
--- VALUES('New Arlington', 'NA',	'Old Arlington', 15, 71349380);
VALUES
('New France', 'FR', 'Lionsville', 9, 42809628),
('Kent', 'KT', 'Canterbury', 8, 38053003),
('New Jersey', 'NJ', 'New London', 7, 33296377),
('Southerina', 'SO',	'Swindon', 	4.7, 22356139),
('Cornwall & Isle Of Scilly', 'CO', 'Truro',	4.8, 22831802),
('New Spain', 'SP', 'Fort Mead', 2.3, 10940238),
('Azores', 'AZ', 'Ponta Delgado', 0.7, 3329678),
('Alcasta', 'AL',	'Las Riveras', 1.8,	8561926),
('Guernsey', 'GU', 'Guernsey City', 0.85, 4043132),
('Hampshire', 'HA', 'Winchester', 4.9, 23307464),
('Isle Of Wight', 'IW', 'Newport', 1.8, 	8561926),
('Berkshire',	'BE', 'Royal Winsor', 3.8, 18075176),
('North Sussex', 'NS', 'Royal Hastings', 6.5, 30918064),
('South Sussex','SS', 'Chichester', 3.75	,17837345),
('Dorset', 'DO', 'Dorchester', 2.7, 12842888),
('Devon', 'DE', 'Exeter', 7.5, 35674689),
('Surrey', 'SU', 'Stillesville', 5.5, 26161439),
('Northern Island', 'NI', 'Providence', 1.8, 8561926);

SELECT * FROM CLODEANIEA1;

-- How many states are there 
SELECT COUNT(*) FROM CLODEANIEA1;

--- Thats incorrect , Lets change it
INSERT INTO CLODEANIEA1
VALUES 
('Oxfordshire',	'OX', 'Oxford',	3.9, 18550839),
('Maine',	'MA',	'Fort Zabetha', 3.7, 17599514);

-- How many states are there now 
SELECT COUNT(*) FROM CLODEANIEA1;
--- Its correct now 

--- Names of the states 
SELECT STATE FROM CLODEANIEA1;

---- lets find the top 5 states by population 
SELECT STATE, POPULATION FROM CLODEANIEA1 ORDER BY POPULATION DESC LIMIT 5;

---- Lets find the bottom 5 states by population
SELECT STATE, POPULATION FROM CLODEANIEA1 ORDER BY POPULATION LIMIT 5; 

----- Largest state population
SELECT STATE, POPULATION FROM CLODEANIEA1 WHERE POPULATION = (SELECT MAX(POPULATION) FROM CLODEANIEA1);

---- Smallest State Population 
SELECT STATE, POPULATION FROM CLODEANIEA1 WHERE POPULATION = (SELECT MIN(POPULATION) FROM CLODEANIEA1);

----- Average State Population
SELECT AVG(POPULATION) FROM CLODEANIEA1; 

---- Total Population 
SELECT SUM(POPULATION) FROM CLODEANIEA1;

----- STATE WITH LONGEST LENGTH
SELECT STATE, LENGTH(STATE) FROM CLODEANIEA1 WHERE LENGTH(STATE) = (SELECT MAX(LENGTH(STATE)) FROM CLODEANIEA1); 

---- STATE WITH SHORTEST LENGTH
SELECT STATE, LENGTH(STATE) FROM CLODEANIEA1 WHERE LENGTH(STATE) = (SELECT MIN(LENGTH(STATE)) FROM CLODEANIEA1);

---- Lets Catogorise our populations sets
ALTER TABLE CLODEANIEA1 ADD COLUMN CAT char(1);

--- Our new table 
SELECT * FROM CLODEANIEA1;

--- Catogorising our values 
UPDATE CLODEANIEA1 
SET CAT = 'A'
WHERE POPULATION >= 30000000;

SELECT * FROM CLODEANIEA1;

UPDATE CLODEANIEA1 
SET CAT = 'B'
WHERE POPULATION BETWEEN 20000000 AND 30000000;

UPDATE CLODEANIEA1 
SET CAT = 'C'
WHERE POPULATION BETWEEN 10000000 AND 20000000;

UPDATE CLODEANIEA1 
SET CAT = 'D'
WHERE POPULATION <= 10000000;

--- Let find our more about our groups 
SELECT CAT, AVG(POPULATION) AS AVERAGE_POP FROM CLODEANIEA1 GROUP BY CAT ORDER BY AVG(POPULATION) DESC;

SELECT CAT, COUNT(*) AS NUMBER_OF_STATES FROM CLODEANIEA1 GROUP BY CAT;

SELECT CAT , MIN(POPULATION) AS MIN_CAT , MAX(POPULATION) MAX_CAT FROM CLODEANIEA1 GROUP BY CAT;

SELECT STATE, CODE, POPULATION FROM CLODEANIEA1 WHERE CAT = 'A' ORDER BY POPULATION DESC;

SELECT STATE, CODE, POPULATION FROM CLODEANIEA1 WHERE CAT = 'B' ORDER BY POPULATION DESC;

SELECT STATE, CODE, POPULATION FROM CLODEANIEA1 WHERE CAT = 'C' ORDER BY POPULATION DESC;

SELECT STATE, CODE, POPULATION FROM CLODEANIEA1 WHERE CAT = 'D' ORDER BY POPULATION DESC;