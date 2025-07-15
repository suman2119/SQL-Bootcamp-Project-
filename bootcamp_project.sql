CREATE DATABASE bootcamp_project; 
USE bootcamp_project; 

CREATE TABLE customers(
CustomerID INT PRIMARY KEY,
Name VARCHAR(50), 
City VARCHAR(20),
Age INT
); 
INSERT INTO customers
(CustomerID, Name, City, Age)
VALUES 
(1,  "Alice", "Delhi", 25), 
(2, "Bob", "Mumbai", 30), 
(3, "Charlie", "Bangalore", 28), 
(4, "David", "Delhi", 35), 
(5, "Eve", "Hyderabad", 22);
SELECT * FROM customers; 

CREATE TABLE orders(
OrderID INT PRIMARY KEY, 
CustomerID INT, 
Amount FLOAT, 
OrderDate DATE, 
FOREIGN KEY(CustomerID) REFERENCES customers(CustomerID)
); 
INSERT INTO orders
(OrderId, CustomerID, Amount, OrderDate)
VALUES
(101, 1, 2500, "2024-12-01"), 
(102, 2, 1800, "2024-12-03"), 
(103, 1, 3200, "2025-01-15"), 
(104, 3, 1500, "2025-02-10"), 
(105, 4, 2700, "2025-03-12"); 
SELECT * FROM orders; 

#question 1
SELECT Name 
FROM customers 
WHERE City="Delhi"; 

#question 2 
SELECT * 
FROM orders
WHERE Amount>2000; 

#question 3
SELECT City, COUNT(*) AS CustomerCount 
FROM customers 
GROUP BY City; 

#question 4 
SELECT SUM(Amount) AS TotalSpent 
FROM orders 
WHERE CustomerID = (SELECT CustomerID FROM customers WHERE Name="Alice"); 

#question 5 
SELECT DISTINCT customers.Name 
FROM customers 
JOIN orders ON customers.CustomerID = orders.CustomerID; 

#question 6 
SELECT AVG(Age) AS AvgAge
FROM customers
WHERE CustomerID IN (
  SELECT DISTINCT CustomerID FROM orders
);

#question 7
SELECT customers.Name, COUNT(orders.OrderID) AS OrderCount
FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID
GROUP BY customers.Name;
