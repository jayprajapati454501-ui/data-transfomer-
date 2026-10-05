DROP DATABASE IF EXISTS data_transformer;
CREATE DATABASE data_transformer;
USE data_transformer;

	CREATE TABLE Customers (
		CustomerID INT PRIMARY KEY,
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		Email VARCHAR(100),
		RegistrationDate DATE
	);

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, RegistrationDate)
VALUES
(1, 'Jay', 'prjapati', ' jayprajapati@gmail.com ', '2026-01-15'),
(2, 'hiren', 'mayavanshi', 'hirenmayavanshi@gmail.com', '2024-03-20'),
(3, 'vipul', 'patil', ' vipulpatil@gmail.com ', '2027-05-10'),
(4, 'priyanka', 'padshala', 'priyankapadshala@gmail.com', '2026-01-12'),
(5, 'dhruv', 'patel', 'dhruvpatel@gmail.com', '2027-04-25'),
(6, 'Rajan', 'hingrajiya', 'rajanhingrajiya@gmail.com', '2023-07-18');

select * from customers 

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);

INSERT INTO Orders
(OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2024-01-10', 1200.00),
(102, 2, '2025-01-15', 750.00),
(103, 1, '2023-02-05', 450.00),
(104, 3, '2026-02-20', 1500.00),
(105, 4, '2027-03-12', 300.00),
(106, 2, '2025-03-25', 900.00),
(107, 5, '2022-04-10', 1800.00),
(108, 3, '2021-04-22', 650.00);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);


INSERT INTO Employees
(EmployeeID, FirstName, LastName, Department, HireDate, Salary)
VALUES
(1, 'lucky', 'ramshoi', 'Sales', '2020-01-15', 50000.00),
(2, 'harsh', 'babariya', 'HR', '2021-03-20', 55000.00),
(3, 'Dhruv', 'patel', 'IT', '2019-06-10', 75000.00),
(4, 'priyanka', 'padshala', 'Finance', '2022-02-18', 65000.00),
(5, 'swayam', 'patel', 'Sales', '2018-11-25', 85000.00),
(6, 'shivam', 'vansia', 'IT', '2023-04-12', 60000.00);
# inner join 
 SELECT
     o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email
FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID;
    
 # left join 
 SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID;
    
 # right join 
 SELECT
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM Customers c
RIGHT JOIN Orders o
    ON c.CustomerID = o.CustomerID;
    
    
 #full outer join 
 
 SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID

UNION

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o
    ON c.CustomerID = o.CustomerID;
    
 #  Subquery – Customers With Orders Above Average
 SELECT DISTINCT
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (
    SELECT AVG(TotalAmount)
    FROM Orders
);
#  Subquery – Employees Above Average Salary
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Department,
    Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);

# Extract Year and Month From OrderDate
SELECT
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM Orders;

SELECT
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth,
    MONTHNAME(OrderDate) AS MonthName
FROM Orders;

# Calculate Difference Between Order Date and Current Date

SELECT
    OrderID,
    OrderDate,
    CURDATE() AS CurrentDate,
    DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
FROM Orders;

# Format OrderDate
SELECT
    OrderID,
    OrderDate,
    DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedOrderDate
FROM Orders;

# Concatenate FirstName and LastName
SELECT
    CustomerID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;

SELECT
    EmployeeID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employees;

# Replace Part of a String
SELECT
    CustomerID,
    FirstName,
    REPLACE(FirstName, 'jay', 'prajapati') AS ModifiedFirstName
FROM Customers;

SELECT
    CustomerID,
    Email,
    REPLACE(Email, 'gmail.com', 'company.com') AS NewEmail
FROM Customers;

# Convert FirstName to Uppercase and LastName to Lowercase
SELECT
    CustomerID,
    UPPER(FirstName) AS FirstName_Upper,
    LOWER(LastName) AS LastName_Lower
FROM Customers;

# Trim Extra Spaces From Email
SELECT
    CustomerID,
    Email AS OriginalEmail,
    TRIM(Email) AS CleanEmail
FROM Customers;

UPDATE Customers
SET Email = TRIM(Email);


# Running Total of TotalAmount

	SELECT
		OrderID,
		OrderDate,
		TotalAmount,
		SUM(TotalAmount) OVER (
			ORDER BY OrderDate, OrderID
		) AS RunningTotal
	FROM Orders;

# Rank Orders Using RANK()

SELECT
    OrderID,
    CustomerID,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS OrderRank
FROM Orders;

# Assign Discount Based on TotalAmount
SELECT
    OrderID,
    TotalAmount,

    CASE
        WHEN TotalAmount > 1000 THEN '10% Discount'
        WHEN TotalAmount > 500 THEN '5% Discount'
        ELSE 'No Discount'
    END AS DiscountCategory

FROM Orders;

# Calculate Discount Amount and Final Amount
SELECT
    OrderID,
    TotalAmount,

    CASE
        WHEN TotalAmount > 1000 THEN TotalAmount * 0.10
        WHEN TotalAmount > 500 THEN TotalAmount * 0.05
        ELSE 0
    END AS DiscountAmount,

    TotalAmount -
    CASE
        WHEN TotalAmount > 1000 THEN TotalAmount * 0.10
        WHEN TotalAmount > 500 THEN TotalAmount * 0.05
        ELSE 0
    END AS FinalAmount

FROM Orders;


# Categorize Employee Salaries
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,

    CASE
        WHEN Salary >= 75000 THEN 'High'
        WHEN Salary >= 55000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory

FROM Employees;
# Complete Data Transformer Query
SELECT
    o.OrderID,

    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,

    TRIM(c.Email) AS CleanEmail,

    o.OrderDate,

    YEAR(o.OrderDate) AS OrderYear,

    MONTH(o.OrderDate) AS OrderMonth,

    DATE_FORMAT(o.OrderDate, '%d-%b-%Y') AS FormattedOrderDate,

    o.TotalAmount,

    SUM(o.TotalAmount) OVER (
        ORDER BY o.OrderDate, o.OrderID
    ) AS RunningTotal,

    RANK() OVER (
        ORDER BY o.TotalAmount DESC
    ) AS OrderRank,

    CASE
        WHEN o.TotalAmount > 1000 THEN '10% Discount'
        WHEN o.TotalAmount > 500 THEN '5% Discount'
        ELSE 'No Discount'
    END AS DiscountCategory

FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID;
    
   #  Employee Transformation Report
   SELECT
    EmployeeID,

    CONCAT(
        UPPER(FirstName),
        ' ',
        LOWER(LastName)
    ) AS EmployeeName,

    Department,

    HireDate,

    YEAR(HireDate) AS HireYear,

    MONTH(HireDate) AS HireMonth,

    Salary,

    CASE
        WHEN Salary >= 75000 THEN 'High'
        WHEN Salary >= 55000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory

FROM Employees;