/* BASIC SQL QUERIES */
use northwind

SHOW tables;

SELECT * FROM northwind.customers;
SELECT * FROM northwind.products;
select * from orders;	
select * from employees;
select * from suppliers;
select * from shippers;

-- RETURN SECIFIC COLUMS AND ALL ROWS --

Select customerName, City, Country FROM customers;
Select ProductID, ProductName FROM products;


SELECT FirstName, LastName, BirthDate 
FROM employees;
SELECT CustomerName, Address, City 
FROM customers;

-- HOW TO RETURN DIFFERENT VALUES --

SELECT Country
FROM Customers;

SELECT DISTINCT Country
FROM Customers;


-- HOW MANY DIFFERENT COUNTRIES IN CUSTOMERS?-

SELECT COUNT(DISTINCT Country) -- function has a name and ()
FROM Customers;
-- count function will count number of rows --


-- HOW MANY CUSTOMERS ARE THERE?--
SELECT COUNT(DISTINCT CustomerID)
FROM customers;

-- HOW MANY CITIES ARE IN SUPPLIERS TABLE?--

SELECT COUNT(DISTINCT City)
FROM Suppliers;



SELECT DISTINCT City
FROM Suppliers;

------------ 02/09/25 -----------


SELECT * FROM Customers
WHERE Country = "Mexico";

--- anything outside "" must be either keyword, table name or column name --

SELECT * FROM customers
WHERE CustomerID = 12;

-- Write SQL query to return number of Customers from London--

SELECT * FROM  customers
WHERE City = "London";

-- Write SQL query to return number of Customers from USA --

select count(customerid)
from customers
where country = "USA";
-- since CustomerID is PK, you don't need distinct --


-- quotes also used for date values 
SELECT * FROM Orders
WHERE OrderDate > "1996-07-30";


SELECT * FROM Products
WHERE Price > 100;


-- CUSTOMERS THAT ARE NOT IN THE USA--

SELECT *
FROM customers
WHERE Country !="USA";

--- != or <> means NOT EQUAL TO !--


--- Write SQL query to return Customers with their customerid is equal to and greater than 15.--

SELECT * 
FROM customers
WHERE CustomerID >= 15;

-- Write SQL query to return order details where order quantity is less than 3.--

SELECT *
FROM order_details
WHERE Quantity < 3;

-- Write SQL query to find details of employees who were born after 1960-01-01.--

SELECT *
FROM employees
WHERE BirthDate > "1960-01-01";


-- QUERY TO RETURN AALL CUSTOMERS FROM GERMANY + CITY BERLIN--

SELECT * 
from customers
where country = "Germany" AND City="Berlin";


-- RETURN CUST FROM GERMANY EXCEPT BERLIN--


SELECT * 
from customers
where country = "Germany" AND NOT City="Berlin";


-- RETURN SUPPLIERS FROM JAPAN, TOKYO --


SELECT * FROM Suppliers
WHERE Country = 'Japan' AND City = 'Tokyo';


-- Write SQL query to find customer from UK and London.--

SELECT *
FROM customers
WHERE Country="UK" AND City="London";

SELECT *
FROM customers
WHERE Country="UK" AND "USA";





-- Write SQL query to find products with price is less than 5 and productid more than 10. --

SELECT *
FROM products
WHERE Price < 5 AND ProductID > 10;


-- Sorting Results ---- ASC or DESC -- default is ASC --

SELECT *
FROM customers
ORDER BY Country ;


SELECT ProductName, Price FROM Products
ORDER BY Price DESC;



SELECT *
FROM suppliers
ORDER BY City DESC;



SELECT * 
FROM Customers
ORDER BY Country, CustomerName;



SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;


-- Sort customers in USA Ascending -- 

SELECT *
FROM customers
WHERE Country= "USA"
ORDER BY CustomerName;


-- APPLYING LIMIT NR OR REFULTS -- 

SELECT *
FROM customers
LIMIT 9;


-- top 5 cheapest products--

SELECT *
FROM Products
ORDER BY Price
LIMIT 5;


-- COMBINING LIMITS ORDER BY

SELECT *
FROM customers
WHERE Country= "Germany"
ORDER BY City
LIMIT 3;


-- TOP 10 PRODUCTS WITH PRRICE GREATER THAN 20--

SELECT *
FROM Products
Where Price > 20
LIMIT 10;

-- FIRST 3 CUSTOMERS LIVING IN LONDON--

SELECT *
FROM customers
WHERE City= "London"
LIMIT 3;


-- SHOW minumum maximum average sum price--

SELECT min(price)
from products;


SELECT max(price)
from products;


SELECT avg(price)
from products;


select sum(price)
from products;

--first customer name in alphabetical order--


SELECT MIN(CustomerName)
FROM customers;

SELECT max(orderdate)
from orders;


Open-Ended Question Activity
-- Write an SQL query to find the customer with the most recent OrderDate in the Orders table.

SELECT OrderDate, CustomerID
FROM orders
ORDER BY OrderDate DESC
LIMIT 1;

-- Write an SQL query to find the product with the highest price from the Products table.

SELECT ProductName, Price
FROM products
ORDER BY Price DESC
LIMIT 1;

--  Write an SQL query to retrieve the product with the lowest Quantity in the OrderDetails table.

SELECT *
FROM order_details
ORDER BY Quantity
Limit 1;

-- CUSTOMER NAME STARTING WITH LETTER "A"--

SELECT *
FROM customers
WHERE CustomerName LIKE "a%";


-- CUSTOMER NAME ENDING WITH LETTER "A"--

SELECT *
FROM customers
WHERE CustomerName LIKE "%a";

-- customername contains letter J--

SELECT *
FROM customers
WHERE CustomerName LIKE "%J%";

-- Customername has a second character r--

SELECT * 
FROM customers
WHERE CustomerName LIKE "_r%";

-- Customer starting and ending with letter A // It can be modified as per each letter//--

SELECT * 
FROM customers
WHERE CustomerName LIKE "a%a";



-- Write an SQL query to find customers whose CustomerName does not start with 'a'.

SELECT *
FROM customers
WHERE CustomerName NOT LIKE "a%";

-- Write an SQL query to find all suppliers from countries that contain the substring 'land' (e.g., 'Finland', 'Poland') in the Country field.

SELECT *
FROM suppliers
WHERE Country LIKE "%land%";


-- Write an SQL query to find all employees whose FirstName contains the letter 'n ' as the second character.

SELECT * 
FROM employees
WHERE FirstName LIKE "_n%";


-- Write an SQL query to find all shippers whose ShipperName contains the word 'Express'.

SELECT *
FROM shippers
WHERE ShipperName LIKE "%Express%";


-- FILTER CUST FROM DIFFERENT COUNTRIES / IN OPERATOR MAKES MULTIPLE OR CONDITIONS --

SELECT *
FROM Customers
WHERE Country IN ("Germany", "France", "UK");

-- NOT in Germany, France or UK --

SELECT *
FROM Customers
WHERE Country NOT IN ("Germany", "France", "UK");


-- SUBQUERIES
-- THIS QUERY WILL RETURN CUSTOMERS WHO ARE IN THE SAME COUNTRY AS SUPPLIERS --

SELECT *
FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers);

 -- THIS RETURNS COUNTRIES IN SUPPLIERS TABLE--
 
SELECT Country FROM SuppliersCountry
-- The result of countries will be used to filter customers--
- -------------------------------------------------------------------------------

-- Write an SQL query to find all customers from either Berlin, 'Paris', or 'Madrid' in the Customers table.

SELECT *
FROM Customers
WHERE City IN ("Berlin", "Paris", "Madrid");


-- Write an SQL query to find all orders that were shipped by ShipperID 1 or 3 from the Orders table.

SELECT *
FROM orders
WHERE ShipperID IN (1,3);


-- Write an SQL query to find all products that have UnitPrice is 10, 20, or 30.

SELECT *
FROM products
WHERE Price IN(10, 20, 30);

-- Write an SQL query to find all customers who have placed an order. Use a subquery on the Orders table to match the customers. (Use subquery)

SELECT *
FROM customers
WHERE CustomerID IN (SELECT CustomerID FROM orders);


-- WHAT ARE THE PRODUCTS WITH PRICE BETWEEN 10 AND 20?--

SELECT * 
FROM products
WHERE Price BETWEEN 10 AND 20;

-- WHAT ARE THE PRODUCTS WITH PRICE OUTSIDE 10 AND 20?--

SELECT * 
FROM products
WHERE Price NOT BETWEEN 10 AND 20;

-- Products between range of values --

SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

-- Products NOT in a range of values--

SELECT * FROM Products
WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;



 -- SELECT ORDERS BETWEEN DATES--

SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';


-- Write a query to select all products with a unit price between 50 and 100.

SELECT *
FROM products
WHERE Price BETWEEN 50 AND 100
ORDER BY ProductName;

-- Write a query to retrieve all orders placed between January 1, 1996, and December 31, 1996.

SELECT *
FROM orders
WHERE OrderDate BETWEEN "1996-01-01" AND "1996-12-31";

-- Write a query to retrieve order details where the quantity is between 5 and 15.

SELECT * 
FROM order_details
WHERE Quantity BETWEEN 5 AND 15;


-- TEMPORARY RENAME COLUMN (ALIAS)--

SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;


SELECT CustomerName AS Customer, ContactName AS "Contact Person"
FROM Customers;

-- COMBINE ADDRESSES INTO A SINGLE RESULT NAMED ADDRESS--

SELECT CustomerName, CONCAT_WS(', ', Address, PostalCode, City, Country) AS Address
FROM Customers;


-- FIND OUT NUMBER OF CCUSTOMERS FROM LONDON--

SELECT COUNT(*) as NumberofCustomers FROM customers
WHERE City = "London";


SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName
FROM Customers, Orders
WHERE Customers.CustomerName='Around the Horn' AND Customers.CustomerID=Orders.CustomerID;


-- Write a SQL query to retrieve all columns from the Customers table.

Select *
FROM customers;

-- Write a SQL query to retrieve all columns from the Customers table. 

SELECT CustomerName, City
FROM customers;

-- Write a SQL query to retrieve distinct values from the City column in the Customers table. 

SELECT DISTINCT City
FROM customers;


-- Write a SQL query to retrieve all columns from the Products table where the Price is greater than 50.

SELECT *
FROM products
WHERE Price > 50;


-- Write a SQL query to retrieve all columns from the Customers table where the Country is either 'USA' or 'UK'.

SELECT *
FROM customers
WHERE Country IN("USA", "UK");


-- Write a SQL query to retrieve all columns from the Orders table, sorted by OrderDate in descending order.

SELECT *
FROM orders
ORDER BY OrderDate DESC;


-- Write a SQL query to retrieve all columns from the Products table where the Price is between 20 and 50, ordered by descending Price.

SELECT *
FROM products
WHERE Price BETWEEN 20 AND 50
ORDER BY Price DESC;


-- Write a SQL query to retrieve all columns from the Customers table where the Country is 'USA' and City is either 'Portland' or 'Kirkland', ordered by ascending

SELECT *
FROM customers
WHERE Country = "USA" AND City IN("Portland", "Kirkland");


-- Write a SQL query to retrieve all columns from the Customers table where the Country is 'UK' or City is 'London', ordered by descending CustomerName.

SELECT *
FROM customers
WHERE Country = "UK" AND City = "London"
ORDER BY CustomerName DESC;


-- Write a SQL query to retrieve all columns from the Products table where the CategoryID is 1 or 2, ordered by ascending ProductName.

SELECT *
FROM products
WHERE CategoryID IN(1,2)
ORDER BY ProductName ASC;


-- *** -- JOINS -- *** ----------------------------------------------------------------------------------------------------------------------------


SELECT *
FROM orders
INNER JOIN customers
on orders.CustomerID = customers.customerid;

SELECT orders.orderid, customers.customerid, customers.CustomerName
FROM orders -- left table
INNER JOIN customers -- right table
ON orders.CustomerID = customers.customerid;


-- join orders to shippers --

SELECT *
FROM orders
INNER JOIN shippers
ON orders.shipperid = shippers.ShipperID

SELECT *
FROM shippers  -- left
inner join orders -- right
on orders.shipperid - shippers.shipperid;


-- products and their supplies --

SELECT SupplierName, ProductName
FROM Products
INNER JOIN Suppliers
on Products.SupplierID = Suppliers.SupplierID;


-- SHOW SPECIFIC SUPPLIER INNER JOIN --

SELECT SupplierName, ProductName
FROM Products
INNER JOIN Suppliers
on Products.SupplierID = Suppliers.SupplierID
where SupplierName = "G'day, Mate";


-- Write a query to list the employees who handled each order, along with the order date.

SELECT employees.FirstName, employees.LastName, orders.OrderID, orders.OrderDate
FROM employees
INNER JOIN orders
ON orders.EmployeeID = employees.EmployeeID;


-- Write a query to find all orders shipped by a specific shipper (e.g., ShipperName = 'Speedy Express').

SELECT orders.orderid, orders.OrderDate, shippers.ShipperName
FROM orders
INNER JOIN shippers
on orders.ShipperID = shippers.ShipperID
WHERE ShipperName="Speedy Express";



SELECT orders.orderid, orders.orderdate, shippers.ShipperName
FROM orders
INNER JOIN shippers
ON orders.ShipperID = shippers.ShipperID
WHERE ShipperName="Speedy Express"



-- Write a query to display all products along with their category names.

SELECT products.productid, products.productname, categories.categoryname 
FROM products 
INNER JOIN categories 
ON products.categoryid = categories.categoryid;


-- Write a query to list all products and their quantities for each order.

SELECT products.productname, order_details.quantity
FROM products
JOIN order_details 
ON order_details.ProductID = products.ProductID;



 -- RIGHT JOIN --
 
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;


 -- LEFT JOIN --
 
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
where orders.orderid is null
ORDER BY orders.OrderID;


SELECT p.ProductID, p.ProductName, od.OrderID
FROM products as p
left join order_details as od
on p.productid = od.productid
order by orderid;

-- CROSS JOIN - matching everything in both tables--

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
CROSS JOIN Orders;


-- GROUP BY STATEMENT --

SELECT count(*)
from products;



SELECT count(*) AS numberofcustomers, country
from customers
GROUP BY Country;


select count(*) as numberofcustomers, country, city
from customers
GROUP BY Country, City
order by numberofcustomers desc;

-- every nonaggregate column used  in select must be repeated in group by statement--


SELECT COUNT(*),
FROM orders

------------- GROUP BY + JOIN --------------


SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders 
FROM Orders
LEFT JOIN Shippers 
ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;

-- while writing query, default join type is INNER JOIN --

SELECT *
FROM customers as c
JOIN orders as o -- inner default
ON c.customerid = o.customerid;


-- number of orders by each customer --

SELECT COUNT(o.orderid) as NumberOfOrders, c.CustomerName
FROM customers AS c
JOIN orders as o -- inner join
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY NumberOfOrders DESC;

-- Total number of quantity for products that include "choco" --

SELECT p.ProductName, sum(Quantity) as totalquantity
FROM products as p
JOIN order_details as od
ON p.ProductID = od.ProductID
WHERE productname like "%choco%"
group by p.ProductName;


-- TOTAL SALES PER PRODUCT --

SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalSales
FROM Order_Details as od
JOIN Products as p 
ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC;


-- Write SQL query to list the number of customers in each country.

SELECT count(*) AS numberofcustomers, country
from customers
GROUP BY Country
ORDER BY numberofcustomers DESC;

-- Write a query to list each product category and the total quantity of products sold in that category.


SELECT c.CategoryName, SUM(od.Quantity) AS TotalQuantity
FROM categories AS c
JOIN products AS p
ON c.CategoryID = p.CategoryID
JOIN order_details AS od
ON p.ProductID = od.ProductID
GROUP BY c.CategoryName
ORDER BY TotalQuantity DESC;


-- Write a query to list each employee and the number of orders they have handled.


SELECT e.EmployeeID, e.FirstName, e.LastName, COUNT(o.OrderID) AS TotalOrders
FROM employees AS e
LEFT JOIN orders AS o
ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalOrders DESC;


--  Write a SQL query to find the supplier of each product.


SELECT p.ProductID, p.ProductName, s.SupplierName
FROM Products AS p 
JOIN Suppliers AS s
ON p.SupplierID = s.SupplierID
ORDER BY p.ProductID;


-- Write a SQL query to find the category of each product.

SELECT p.ProductID, p.ProductName, c.CategoryName
FROM Products AS p
JOIN Categories AS c
ON p.CategoryID = c.CategoryID
ORDER BY p.ProductID;


-- Write a SQL query to retrieve all products belonging to the Meat/Poultry category.

SELECT p.ProductID, p.ProductName, c.CategoryName
FROM products AS p
JOIN categories AS c
ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = "Meat/Poultry"
ORDER BY p.ProductID;


--  Write a SQL query to retrieve the Order ID, Order Date, Customer Name, and Employee Name for all orders.

SELECT o.OrderID, o.OrderDate, c.CustomerName, CONCAT(e.FirstName, " ", e.LastName) AS Employee
FROM orders AS o
JOIN customers AS c
ON o.CustomerID = c.CustomerID
JOIN employees AS e
ON o.EmployeeID = e.EmployeeID
ORDER BY o.OrderID;

--  Write a SQL query to retrieve the Product Name, Category Name, and Supplier Name for all products.

SELECT p.ProductName, c.CategoryName, s.SupplierName
FROM Products AS p
JOIN Categories AS c
ON p.CategoryID = c.CategoryID
JOIN Suppliers AS s
ON p.SupplierID = s.SupplierID
ORDER BY ProductName;


-- Write a SQL query to create a report for all the orders of 1996 and their customers.

SELECT o.OrderID, o.OrderDate, c.CustomerID, c.CustomerName, c.ContactName, c.Country
FROM orders as o
JOIN customers as c
ON o.CustomerID = c.CustomerID
WHERE o.OrderDate >= "1996-01-01" AND o.OrderDate < "1997-01-01"
ORDER BY o.OrderDate, o.OrderID;

-- Write a SQL query to retrieve all categories along with the number of products in each category.

SELECT c.CategoryID, c.CategoryName, COUNT(p.ProductID) AS NumberofProducts
FROM categories AS c
LEFT JOIN products AS p
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY NumberofProducts DESC, c.CategoryName;


--  Write a SQL query to retrieve all products with their prices and the quantity ordered for each product.

SELECT p.ProductID, p.ProductName, p.Price, SUM(od.Quantity) AS TotalUnitsOrdered
FROM products AS p
LEFT JOIN order_details AS od
ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName, p.Price
ORDER BY TotalUnitsOrdered DESC, p.ProductName;

