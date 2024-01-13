--creating categories table
CREATE TABLE categories(
	categoryID INT PRIMARY KEY,
	categoryName VARCHAR(30),
	description VARCHAR(70)
);

--creating shippers table
CREATE TABLE shippers (
	shipperID INT PRIMARY KEY,
	companyName VARCHAR(20)
);

--creating employees table
CREATE TABLE employees (
	employeeID INT PRIMARY KEY,
	employeeName VARCHAR(30),
	title VARCHAR(50),
	city VARCHAR(20),
	country VARCHAR(5),
	reportsTo VARCHAR(5)
);


--creating customers table
CREATE TABLE customers (
	customerID VARCHAR(15) PRIMARY KEY,
	customerName VARCHAR(100),
	contactName VARCHAR(50),
	contactTitle VARCHAR(50),
	city VARCHAR(15),
	country VARCHAR(30)
);


--creating products table
CREATE TABLE products (
	productID INT PRIMARY KEY,
	productName VARCHAR(50),
	quantityPerUnit VARCHAR(50),
	unitPrice DECIMAL(10,2),
	discontinued INT,
	categoryID INT REFERENCES categories(categoryID)
);


--creating orders table
CREATE TABLE orders (
	orderID INT PRIMARY KEY,
	customerID VARCHAR(15) REFERENCES customers(customerID),
	employeeID INT REFERENCES employees(employeeID),
	orderDate DATE,
	requiredDATE DATE,
	shippedDate DATE,
	shipperID INT REFERENCES shippers(shipperID),
	freight DECIMAL(10,2)
);


--change data type in orders table
ALTER TABLE customers
ALTER COLUMN city
SET DATA TYPE VARCHAR(15);

--creating order_details table
CREATE TABLE order_details (
	orderID INT REFERENCES orders(orderID),
	productID INT REFERENCES products(productID),
	unitPrice DECIMAL(10,2),
	quantity INT,
	discount FLOAT,
	PRIMARY KEY(orderID, productID)
);


--change data type in order details table
ALTER TABLE order_details
ALTER COLUMN discount
SET DATA TYPE DECIMAL(10,2);


--view categories table
SELECT*
FROM categories;

--view customers table
SELECT*
FROM customers;

--view employees table
SELECT*
FROM employees;

--view order_details table
SELECT*
FROM order_details;

--view orders table
SELECT*
FROM orders;

--view products table
SELECT*
FROM products;

--view shippers table
SELECT*
FROM shippers;

--BUSINESS QUESTIONS
--KPIs
--Total orders
SELECT 
		COUNT(orderid) AS Total_orders 
FROM order_details;


--Total revenue
SELECT 
		ROUND(SUM((p.unitprice * od.quantity) - (p.unitprice * od.quantity * od.discount)),2) AS Revenue
FROM order_details AS od
INNER JOIN products AS p USING(productID);


--Total customers
SELECT
		COUNT(customerid) AS Total_customers
FROM customers;


--Average order Value
SELECT 
		ROUND((SUM((p.unitprice * od.quantity) - (p.unitprice * od.quantity * od.discount)) / COUNT(orderid)), 2)
FROM order_details AS od
INNER JOIN products AS p USING(productID);


--1. Are there any noticeable sales trends over time? Based on years
SELECT 
		DATE_PART('Year', o.orderdate) AS Years,
		ROUND(SUM((p.unitprice * od.quantity) - (p.unitprice * od.quantity * od.discount)), 2) AS Revenue
FROM order_details AS od
INNER JOIN orders AS o USING(orderID)
INNER JOIN products AS p USING(productID)
GROUP BY Years
ORDER BY Years

--b.Based on months
SELECT
		TO_CHAR(o.orderdate, 'MONTH') AS Month_Name,
		DATE_PART('Month', o.orderdate) AS Month_Number,
		SUM((p.unitprice * od.quantity) - (p.unitprice * od.quantity * od.discount)) AS Revenue
FROM order_details AS od
INNER JOIN orders AS o USING(orderID)
INNER JOIN products AS p USING(productID)
GROUP BY Month_Name, Month_Number
ORDER BY Month_Number;

--2. Which are the best selling products?
SELECT p.productName,
		ROUND(SUM((p.unitprice * od.quantity) - (p.unitprice * od.quantity * od.discount)),2) AS best_selling	
FROM order_details AS od
INNER JOIN products AS p USING(productID)
GROUP BY p.productName
ORDER BY best_selling DESC
LIMIT 5;


--2b. Which are the worst selling products?
SELECT p.productName,
		ROUND(SUM((p.unitprice * od.quantity) - (p.unitprice * od.quantity * od.discount)),2) AS worst_selling	
FROM order_details AS od
INNER JOIN products AS p USING(productID)
GROUP BY p.productName
ORDER BY worst_selling ASC
LIMIT 5;


--Most popular products
SELECT p.productName,
		COUNT(od.productID)	AS most_popular
FROM order_details AS od
INNER JOIN products AS p USING(productID)
GROUP BY p.productName
ORDER BY most_popular DESC
LIMIT 5;

--3. Can you identify any key customers?
SELECT c.customername,
		ROUND(SUM((p.unitprice * od.quantity) - (p.unitprice * od.quantity * od.discount)),2) AS Revenue
FROM customers AS c
INNER JOIN orders AS o USING(customerid)
INNER JOIN order_details AS od USING(orderid)
INNER JOIN products AS p USING(productID)
GROUP BY c.customername
ORDER BY Revenue DESC
LIMIT 5;

--4. Are shipping costs consistent across providers?
SELECT s.companyname,
		SUM(o.freight) AS Shipping_costs
FROM shippers AS s
INNER JOIN orders AS o USING(shipperid)
GROUP BY s.companyname
ORDER BY Shipping_costs DESC;


--Number of orders handled by each employee
SELECT e.employeename,
		e.title,
		COUNT(o.orderid) AS No_of_orders
FROM employees AS e
INNER JOIN orders AS o USING(employeeid)
GROUP BY e.employeename, e.title
ORDER BY No_of_orders DESC;


--products that have been discontinued but are still being ordered
SELECT p.productname,
		ROUND(SUM((p.unitprice * od.quantity) - (p.unitprice * od.quantity * od.discount)),2) AS Revenue
FROM products AS p
INNER JOIN order_details AS od USING(productid)
WHERE discontinued = 1
GROUP BY p.productname
ORDER BY Revenue DESC;


--Number of orders handled by each employee
SELECT e.employeename,
		COUNT(od.orderid) AS No_of_orders
FROM employees AS e
INNER JOIN orders AS od USING(employeeid)
INNER JOIN order_details AS o USING(orderid)
GROUP BY e.employeename
ORDER BY No_of_orders DESC;


--Shipping interval from order date
SELECT orderid,
		AGE(shippeddate, orderdate) AS shipping_time
FROM orders
WHERE AGE(shippeddate, orderdate) IS NOT NULL
ORDER BY shipping_time DESC;