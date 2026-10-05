Data Transformer SQL Project

📌 Project Title

Data Transformer

📖 Project Overview

Data Transformer is a MySQL-based SQL project designed to practice and
demonstrate important SQL operations used for data transformation,
reporting, and analysis.

The project works with three main tables:

Customers

Orders

Employees

The SQL script demonstrates joins, subqueries, date functions, string
functions, window functions, CASE expressions, data cleaning, running
totals, ranking, discounts, and salary categorization.

The README is based on the uploaded data transfomer.sql project file.
The SQL file creates the data_transformer database and defines the
three tables used throughout the project.

🎯 Objectives

The main objectives of this project are to:

Create and manage a relational database.

Create tables with primary and foreign keys.

Insert and retrieve customer, order, and employee data.

Perform different types of SQL joins.

Use subqueries for analytical queries.

Extract and format date information.

Manipulate strings using SQL functions.

Clean unnecessary spaces from email data.

Calculate running totals using window functions.

Rank orders according to their total amount.

Apply discounts using CASE.

Categorize employee salaries.

Create combined transformation reports.

🗄️ Database

Database name:

data_transformer

The project starts by removing the database if it already exists,
creating it again, and selecting it for use.

DROP DATABASE IF EXISTS data_transformer;
CREATE DATABASE data_transformer;
USE data_transformer;

📊 Database Tables

1. Customers

The Customers table stores customer information.

Column             Data Type      Description

CustomerID         INT            Unique customer identifier
FirstName          VARCHAR(50)    Customer first name
LastName           VARCHAR(50)    Customer last name
Email              VARCHAR(100)   Customer email address
RegistrationDate   DATE           Customer registration date

2. Orders

The Orders table stores sales/order information.

Column        Data Type       Description

OrderID       INT             Unique order identifier
CustomerID    INT             Customer associated with the order
OrderDate     DATE            Date of the order
TotalAmount   DECIMAL(10,2)   Total order amount

CustomerID is a foreign key that references Customers(CustomerID).

3. Employees

The Employees table stores employee information.

Column       Data Type       Description

EmployeeID   INT             Unique employee identifier
FirstName    VARCHAR(50)     Employee first name
LastName     VARCHAR(50)     Employee last name
Department   VARCHAR(50)     Employee department
HireDate     DATE            Employee hiring date
Salary       DECIMAL(10,2)   Employee salary

🔗 SQL Joins

INNER JOIN

The project uses an INNER JOIN to retrieve orders together with
matching customer information.

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

LEFT JOIN

The LEFT JOIN retrieves all customers and their matching orders, if
available.

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

RIGHT JOIN

The RIGHT JOIN retrieves orders and their corresponding customer
information.

FULL OUTER JOIN Simulation

MySQL does not provide a direct FULL OUTER JOIN syntax. The project
simulates it using LEFT JOIN, RIGHT JOIN, and UNION.

🔍 Subqueries

Customers With Orders Above Average

The project uses a subquery to calculate the average order amount and
then finds customers associated with orders above that average.

WHERE o.TotalAmount > (
    SELECT AVG(TotalAmount)
    FROM Orders
)

Employees Above Average Salary

A second subquery compares employee salaries with the average employee
salary.

WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
)

📅 Date Functions

The project demonstrates several MySQL date functions.

Extract Year

YEAR(OrderDate)

Extract Month

MONTH(OrderDate)

Month Name

MONTHNAME(OrderDate)

Difference Between Dates

DATEDIFF(CURDATE(), OrderDate)

Format Dates

The project formats dates into a more readable DD-MMM-YYYY style.

DATE_FORMAT(OrderDate, '%d-%b-%Y')

🔤 String Functions

The project demonstrates the following string transformations.

CONCAT()

Combines first name and last name into a full name.

CONCAT(FirstName, ' ', LastName)

REPLACE()

Replaces part of a string.

REPLACE(FirstName, 'jay', 'prajapati')

The project also demonstrates replacement of gmail.com in email
addresses.

UPPER()

Converts the first name to uppercase.

UPPER(FirstName)

LOWER()

Converts the last name to lowercase.

LOWER(LastName)

TRIM()

Removes extra spaces from email values.

TRIM(Email)

The uploaded SQL file also updates the customer table so that email
values are stored without the surrounding spaces.

📈 Window Functions

Running Total

The project calculates a running total of order amounts using
SUM() OVER().

SUM(TotalAmount) OVER (
    ORDER BY OrderDate, OrderID
) AS RunningTotal

Ranking Orders

Orders are ranked from the highest total amount to the lowest using
RANK().

RANK() OVER (
    ORDER BY TotalAmount DESC
) AS OrderRank

💰 Discount Calculation

The project uses a CASE expression to assign discounts based on order
amount.

Total Amount     Discount

More than 1000   10%
More than 500    5%
500 or below     No Discount

Example:

CASE
    WHEN TotalAmount > 1000 THEN '10% Discount'
    WHEN TotalAmount > 500 THEN '5% Discount'
    ELSE 'No Discount'
END AS DiscountCategory

The SQL file also calculates the actual discount amount and final
amount.

👨‍💼 Employee Salary Categorization

Employee salaries are categorized using CASE.

Salary                 Category

75000 or more          High
55000 to below 75000   Medium
Below 55000            Low

Example:

CASE
    WHEN Salary >= 75000 THEN 'High'
    WHEN Salary >= 55000 THEN 'Medium'
    ELSE 'Low'
END AS SalaryCategory

📋 Complete Data Transformer Report

The project contains a combined query that produces a transformed order
report containing:

Order ID

Customer name

Clean email

Order date

Order year

Order month

Formatted order date

Total amount

Running total

Order rank

Discount category

This combines joins, string functions, date functions, window functions,
and CASE expressions in one report.

👨‍💻 Employee Transformation Report

The employee report combines:

Employee ID

Uppercase first name

Lowercase last name

Full employee name

Department

Hire date

Hire year

Hire month

Salary

Salary category

🛠️ Technologies Used

MySQL

SQL

MySQL 8.0+ recommended

Relational Database Concepts

Window Functions

Aggregate Functions

String Functions

Date Functions

▶️ How to Run the Project

Step 1: Install MySQL

Install MySQL Server and MySQL Workbench.

Step 2: Open MySQL Workbench

Open the SQL editor.

Step 3: Open the SQL file

Open:

data transfomer.sql

Step 4: Execute the script

Run the SQL script from beginning to end.

The script will:

Create the data_transformer database.

Create the Customers table.

Insert customer records.

Create the Orders table.

Insert order records.

Create the Employees table.

Insert employee records.

Execute joins and subqueries.

Perform date and string transformations.

Calculate running totals and rankings.

Apply discounts.

Categorize employee salaries.

Generate transformation reports.

📁 Project Files

Recommended project structure:

Data-Transformer/
│
├── data transfomer.sql
└── README.md

🎓 Learning Outcomes

After completing this project, a student should understand how to:

Design a basic relational database.

Connect related tables using keys.

Use INNER JOIN, LEFT JOIN, and RIGHT JOIN.

Simulate a full outer join in MySQL.

Write and understand subqueries.

Work with SQL date functions.

Manipulate and clean text data.

Use window functions for analytical calculations.

Generate running totals.

Rank records.

Use CASE for business rules.

Transform raw data into useful reports.

⚠️ Notes

The SQL file is written for MySQL-style syntax.

MySQL does not directly support FULL OUTER JOIN; the project uses
UNION with left and right joins.

The uploaded data contains dates extending into future years
relative to some order/registration records. The README describes
the project as supplied rather than changing the source data.

The email cleaning query uses TRIM() to remove leading and
trailing spaces.

📌 Conclusion

Data Transformer demonstrates how SQL can be used not only to store
data, but also to transform, clean, analyze, rank, and report data.

The project combines fundamental SQL concepts with advanced features
such as subqueries and window functions, making it suitable as a
practical SQL learning project and portfolio project.

 Functions, String Functions,
Window Functions, CASE, Data Transformation
