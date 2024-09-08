/*RHESHWAN RAJ A/L RAVICHANDRAN (MCS221009)*/

/*Creating database*/
create database lab1sql;
use lab1sql;

/*Declare attributes & varible type*/
create table Carinfo (
	CarType varchar(10),
	CarPrice decimal(20),
	CarFuel integer(30),
	DriveTrain varchar(10),
    Passengers integer(1),
    CarWeight integer(4)
);

/*Question a*/
use lab1sql;
select CarPrice, CarWeight, CarType
from Carinfo
where CarType = "midsize";

/*Question b*/
SELECT * FROM Carinfo LIMIT 10 ORDER BY CarFuel DESC



/*Question c*/
SELECT CarType, CarWeight
FROM Carinfo
WHERE CarWeight > 2500
ORDER BY CarWeight DESC, CarType;

/*Question d*/
SELECT CarType, Passengers
FROM Carinfo
WHERE Passengers >= 5 AND CarType = "small";

/*Question e*/
SELECT CarType, DriveTrain
FROM Carinfo
WHERE DriveTrain = "front" AND CarType = "large";

/*Question f*/
SELECT COUNT(CarType)
FROM Carinfo
WHERE CarType = "large";

/*Question g*/
SELECT AVG(CarPrice)
FROM Carinfo
WHERE CarType = "small";

/*Question h*/
SELECT CarType, DriveTrain, CarFuel
FROM Carinfo
WHERE DriveTrain = "rear" AND CarType = "midsize" AND CarFuel < 20;

/*Question i*/
SELECT CarType, CarPrice
FROM Carinfo
WHERE CarPrice
BETWEEN 25 AND 35;

/*Question j*/
SELECT MAX(CarFuel)
FROM Carinfo
WHERE CarType = "small";