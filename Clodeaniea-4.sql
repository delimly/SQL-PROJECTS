-- Clodeaniea 4: 

CREATE TABLE PRESIDENTS (
						 ID int PRIMARY KEY NOT NULL,
						 START int NOT NULL,
						 END int NOT NULL,
						 NAME varchar(30) NOT NULL,
						 PARTY varchar(3) NOT NULL);
						 
SELECT * FROM PRESIDENTS;

INSERT INTO PRESIDENTS 
VALUES 
(33,1956 , 1962,'Terrance Cantrell','NRC'),
(34, 1962, 1965,'Daniella Wallace','DSU'),
(35, 1965, 1968,'Keenan Ritter','DSU'),
(36, 1968, 1974,'Madeline Silva ','NRC'),
(37, 1974, 1980,'Douglas Malone','L'),
(38, 1980, 1992,'John Major ','NRC'),
(39, 1992, 2010,'Benjamin McKinley ','DSU'),
(40, 2010, 2016,'David Cameron','NRC'),
(41, 2016, 2022,'Theresa May','L'),
(42, 2022,2040 ,'Andreas Schmitt','DSU');
						 
SELECT * FROM PRESIDENTS;

--- LETS CREATE A NEW COLUMN CALLED TENURE
ALTER TABLE PRESIDENTS ADD COLUMN TENURE INT;

-- TENURE = THE LENGTH A PRESIDENT SEERVED 
UPDATE PRESIDENTS
SET TENURE = END - START ; 

--- Who had the largest tenure 
SELECT NAME, TENURE, PARTY FROM PRESIDENTS ORDER BY TENURE DESC LIMIT 1;

--- Who had the smallest tenure 
SELECT NAME, TENURE, PARTY FROM PRESIDENTS ORDER BY TENURE ASC LIMIT 1;

--- Lets get a profile on Benjemin Mckinley
SELECT * FROM PRESIDENTS WHERE NAME LIKE 'Ben%';

--- Who were the last five presidents 
SELECT * FROM PRESIDENTS ORDER BY ID DESC LIMIT 5; 

---- Which party had the most presidents 
SELECT PARTY, COUNT(*) FROM PRESIDENTS GROUP BY PARTY;

--- AVERAGE TENURE PER PARTY 
SELECT PARTY, AVG(TENURE) FROM PRESIDENTS GROUP BY PARTY;

---- TOTAL TENURE PER PARTY 
SELECT PARTY, SUM(TENURE) FROM PRESIDENTS GROUP BY PARTY; 

--- Who was the 35th president 
SELECT * FROM PRESIDENTS WHERE ID = 35;

--- WHEN DID JOHN MAJOR START AND END HIS PRESIDENCY
SELECT START, END FROM PRESIDENTS WHERE NAME LIKE 'John%';


