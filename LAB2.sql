

CREATE TABLE tblStudent (
    studentNumber INT(11) AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100) NOT NULL,
    middleName VARCHAR(100),
    birthdate VARCHAR(20),
    citizenship VARCHAR(50) COMMENT 'Example: Filipino, Nigerian, Korean',
    gender VARCHAR(100) COMMENT 'Male or Female'
);

-- SHOW TABLE
SHOW FULL COLUMNS FROM tblStudent;


INSERT INTO tblStudent 
(studentNumber, firstName, lastName, middleName, birthdate, citizenship, gender)
VALUES
(202014912, 'STEVEN', 'ESPEDIDO', 'ROSALDO', '2000-01-01', 'Filipino', 'Male'),
(202014165, 'NINA KLARISSE', 'ULANGKAY', 'AMBROSIO', '2000-01-02', 'Filipino', 'Female'),
(202011535, 'ADRIAN', 'CARRANZA', 'RUBIA', '2000-01-03', 'Filipino', 'Male'),
(202011818, 'JEAN', 'DACLES', 'RICO', '2000-01-04', 'Filipino', 'Female'),
(202012336, 'GILLIAN KYLE', 'CATAHAN', 'DIMAALA', '2000-01-05', 'Filipino', 'Male');

-- UPDATE
ALTER TABLE tblStudent CHANGE gender sex VARCHAR(6);
ALTER TABLE tblStudent CHANGE birthdate birthdate DATE;
ALTER TABLE tblStudent CHANGE citizenship citizenship VARCHAR(20);

-- ADD AGE
ALTER TABLE tblStudent ADD age INT(3) AFTER birthdate;


-- RENAME TABLE
ALTER TABLE tblStudent RENAME studentinfo;



-- Convert First, Last, Middle Name to Uppercase
SELECT 
UPPER(firstName) AS FirstName,
UPPER(lastName) AS LastName,
UPPER(middleName) AS MiddleName
FROM studentinfo;

-- Replace Filipino with Pinoy
SELECT 
studentNumber,
firstName,
lastName,
middleName,
birthdate,
REPLACE(citizenship, 'Filipino', 'Pinoy') AS citizenship,
sex,
age
FROM studentinfo;

--  Display Student Number and Full Name
SELECT 
studentNumber,
CONCAT(firstName, ' ', middleName, ' ', lastName) AS FullName
FROM studentinfo;

-- Display last name repeated five times
SELECT 
REPEAT(lastName, 5) AS RepeatedLastName
FROM studentinfo;


-- NUMERIC FUNCTION
-- Average Age
SELECT AVG(age) AS AverageAge
FROM studentinfo;


-- DATE FUNCTION
-- Change birthdate format (Example: Month Day, Year)
SELECT 
studentNumber,
firstName,
lastName,
DATE_FORMAT(birthdate, '%M %d, %Y') AS FormattedBirthdate,
sex,
age
FROM studentinfo;


-- Total Male and Female
SELECT 
sex,
COUNT(*) AS Total
FROM studentinfo
GROUP BY sex;


-- 12. Arrange alphabetically by Last Name
SELECT *
FROM studentinfo
ORDER BY lastName ASC;