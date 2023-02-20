drop database if exists OnTheGo ;
create database OnTheGo;
use OnTheGo;

-- 1)You are required to create two tables PASSENGER and PRICE with the following attributes and properties 
CREATE TABLE PASSENGER (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Passenger_name VARCHAR(255),
    Category VARCHAR(10),
    Gender VARCHAR(10),
    Boarding_City VARCHAR(255),
    Destination_City VARCHAR(255),
    Distance INT,
    Bus_Type VARCHAR(10)
);

CREATE TABLE PRICE (
    Bus_Type VARCHAR(10),
    Distance INT,
    Price INT
);

-- 2)Insert the following data in the tables
INSERT INTO PASSENGER (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) VALUES
('Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
('Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
('Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
('Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
('Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
('Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
('Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper'),
('Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
('Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');

INSERT INTO PRICE (Bus_Type, Distance, Price) VALUES
('Sleeper', 350, 770),
('Sleeper', 500, 1100),
('Sleeper', 600, 1320),
('Sleeper', 700, 1540),
('Sleeper', 1000, 2200),
('Sleeper', 1200, 2640),
('Sleeper', 1500, 2700),
('Sitting', 500, 620),
('Sitting', 600, 744),
('Sitting', 700, 868),
('Sitting', 1000, 1240),
('Sitting', 1200, 1488),
('Sitting', 1500, 1860);

-- 3)How many females and how many male passengers travelled for a minimum distance of 600 KM s?
SELECT Gender, COUNT(*) AS Num_Passengers
FROM PASSENGER
WHERE Distance >= 600
GROUP BY Gender;

-- 4)Query to find the minimum ticket price for Sleeper Bus:
SELECT MIN(Price) AS Min_Price
FROM PRICE
WHERE Bus_Type = 'Sleeper';

-- 5)Query to select passenger names whose names start with the character 'S':
SELECT Passenger_name
FROM PASSENGER
WHERE Passenger_name LIKE 'S%';

-- 6)Query to calculate the price charged for each passenger displaying Passenger name,
--   Boarding City, Destination City, Bus_Type, Price in the output:
SELECT p.Passenger_name, p.Boarding_City, p.Destination_City, p.Bus_Type, pr.Price
FROM PASSENGER p
INNER JOIN PRICE pr ON p.Distance = pr.Distance AND p.Bus_Type = pr.Bus_Type;

-- 7)What are the passenger name/s and his/her ticket price who travelled in the Sitting
--   bus for a distance of 1000 KM s
SELECT p.Passenger_name, pr.Price
FROM PASSENGER p
JOIN PRICE pr ON p.Distance = pr.Distance AND p.Bus_Type = pr.Bus_Type
WHERE p.Distance = 1000 AND p.Bus_Type = 'Sitting';

-- 8)What will be the Sitting and Sleeper bus
--   charge for Pallavi to travel from Bangalore to Panaji?
SELECT Bus_Type, Price
FROM PRICE
WHERE Bus_Type IN ('Sitting', 'Sleeper') 
AND
 Distance = (SELECT Distance FROM PASSENGER WHERE Passenger_name = 'Pallavi' 
 AND 
 Boarding_City = 'Bengaluru' AND Destination_City = 'Panaji');

-- 9)List the distances from the "Passenger" table which are unique (non-repeated distances) 
--   in descending order.
SELECT Distance
FROM PASSENGER
GROUP BY Distance
HAVING COUNT(*) = 1
ORDER BY Distance DESC;

-- 10)Display the passenger name and percentage of distance travelled by 
--    that passenger from the total distance
 --   travelled by all passengers without using user variables
SELECT p.Passenger_name, (p.Distance*100.0)/(SELECT SUM(Distance) FROM PASSENGER) 
as Distance_Percentage
FROM PASSENGER p;

-- 11)Display the distance, price in three categories in table Price
--    a) Expensive if the cost is more than 1000
--    b) Average Cost if the cost is less than 1000 and greater than 500
--    c) Cheap otherwise
SELECT Distance, Price,
CASE
    WHEN Price > 1000 THEN 'Expensive'
    WHEN Price > 500 THEN 'Average Cost'
    ELSE 'Cheap'
END as Price_Category
FROM PRICE;







