-- Task 7: Creating Views
-- Database: SQLite / MySQL

-----------------------------------------------------
-- 1. Customers Table
-----------------------------------------------------
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

-----------------------------------------------------
-- 2. Orders Table
-----------------------------------------------------
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    product VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-----------------------------------------------------
-- 3. Insert Sample Data
-----------------------------------------------------
INSERT INTO Customers VALUES (1, 'Alice', 'Delhi');
INSERT INTO Customers VALUES (2, 'Bob', 'Mumbai');
INSERT INTO Customers VALUES (3, 'Charlie', 'Chennai');
INSERT INTO Customers VALUES (4, 'David', 'Kolkata');

INSERT INTO Orders VALUES (101, 1, 50000, 'Laptop');
INSERT INTO Orders VALUES (102, 1, 1500, 'Mouse');
INSERT INTO Orders VALUES (103, 2, 3000, 'Keyboard');
INSERT INTO Orders VALUES (104, 3, 20000, 'Phone');
INSERT INTO Orders VALUES (105, 3, 800, 'Charger');

-----------------------------------------------------
-- 4. Create Views
-----------------------------------------------------

-- View 1: Customer Orders Summary
CREATE VIEW CustomerOrderSummary AS
SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_orders, SUM(o.amount) AS total_amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- View 2: High Value Orders (>10,000)
CREATE VIEW HighValueOrders AS
SELECT o.order_id, c.name, o.product, o.amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.amount > 10000;

-- View 3: City-wise Customers
CREATE VIEW CityCustomers AS
SELECT city, GROUP_CONCAT(name, ', ') AS customers
FROM Customers
GROUP BY city;

-----------------------------------------------------
-- 5. Using Views
-----------------------------------------------------

-- Get all customer summaries
SELECT * FROM CustomerOrderSummary;

-- Find high value orders
SELECT * FROM HighValueOrders;

-- List customers grouped by city
SELECT * FROM CityCustomers;

-----------------------------------------------------
-- 6. Drop a View
-----------------------------------------------------
DROP VIEW IF EXISTS HighValueOrders;
