This repository contains SQL practice queries using the classic Northwind Sample Database.

The Northwind_practice1.sql file includes examples and exercises that cover fundamental to intermediate SQL concepts such as filtering, aggregation, and joins.

📂 Contents

northwind.sql – script to create and populate the Northwind Database (not included, can be downloaded from Microsoft/MySQL sample databases)

Northwind_practice1.sql – SQL exercises and solutions

README.md – description and usage instructions

🗂 Database Overview

The Northwind Database simulates a trading company. It contains tables such as:

Customers – information about customers

Orders – customer orders

Employees – employee details

Products – product catalog with prices and stock

Suppliers – product suppliers

Shippers – shipping companies

Categories – product categories

📝 Exercises

The practice file demonstrates queries for:

Basic SELECT statements (columns, distinct values)

Filtering with WHERE (equality, ranges, BETWEEN, LIKE, IN)

Sorting results with ORDER BY

Using LIMIT to restrict output

Aggregate functions (COUNT, SUM, AVG, MIN, MAX)

Aliases & concatenation (AS, CONCAT_WS)

Subqueries inside WHERE

Joins (INNER, LEFT, RIGHT, CROSS)

Grouping and aggregation (GROUP BY, HAVING)

Reports combining multiple tables
<img width="643" height="527" alt="image" src="https://github.com/user-attachments/assets/90b0b06b-1218-4066-b76f-2a08c1133397" />


🚀 Usage

Import the Northwind database:

mysql -u root -p < northwind.sql


Open MySQL Workbench or CLI:

USE northwind;


Run queries from Northwind_practice1.sql.

📚 Reference

Northwind Database Sample
# Northwind_sql_practice
This repository contains SQL practice queries using the classic Northwind Sample Database.
