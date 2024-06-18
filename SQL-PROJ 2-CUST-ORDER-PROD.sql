CREATE DATABASE CUSTOMERS_ORDER_PRODUCTS
CREATE TABLE CUSTOMER (CUSTOMERID INT PRIMARY KEY ,CUS_NAME VARCHAR(50), EMAIL VARCHAR(50))

INSERT INTO CUSTOMER (CustomerID, CUS_NAME, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com')

  SELECT * FROM CUSTOMER

  CREATE TABLE ORDERS (ORDERID INT PRIMARY KEY,CUST_ID INT,PRODUCTNAME VARCHAR(50),ORDERDATE DATE,QUANTITY INT)
  INSERT INTO Orders (ORDERID, CUST_ID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10,'Product A', '2023-07-10',1)

SELECT* FROM ORDERS

CREATE TABLE PRODUCT1(PRODUCTID INT PRIMARY KEY,PRODUCTNAME VARCHAR (50),PRICE DECIMAL(10,2))
INSERT INTO PRODUCT1(ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99)

  SELECT * FROM PRODUCT1

  --TASK1--
 ---. Write a query to retrieve all records from the Customers table.
 SELECT * FROM CUSTOMER

 SELECT CUS_NAME,EMAIL FROM CUSTOMER WHERE CUS_NAME LIKE 'J_%'

 SELECT * FROM ORDERS
 SELECT SUM(QUANTITY) 'TOTALPRODUCT_ ORDER' FROM ORDERS

 --5.Write a query to retrieve the names of customers who have placed an order.
 SELECT CUSTOMER.CUS_NAME,ORDERS.CUST_ID,ORDERS.ORDERID FROM CUSTOMER
 LEFT JOIN ORDERS
 ON CUSTOMER.CUSTOMERID=ORDERS.CUST_ID
 WHERE CUSTOMER.CUSTOMERID=ORDERS.CUST_ID

 --6.Write a query to retrieve the products with a price greater than $10.00.
 SELECT PRODUCTNAME FROM PRODUCT1 WHERE PRICE>10.00

 --7.Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.
 SELECT CUSTOMER.CUS_NAME,ORDERS.ORDERID,ORDERS.ORDERDATE FROM CUSTOMER
 LEFT JOIN ORDERS
 ON CUSTOMER.CUSTOMERID=ORDERS.CUST_ID
 WHERE ORDERS.ORDERDATE>= '2023-07-05'

 --8.Write a query to calculate the average price of all products.
 SELECT AVG(PRICE) 'AVGPRICE' FROM PRODUCT1

 --9.Write a query to retrieve the customer names along with the total quantity of products they have ordered.
 SELECT CUSTOMER.CUS_NAME,ORDERS.QUANTITY FROM CUSTOMER
 INNER JOIN ORDERS
 ON CUSTOMER.CUSTOMERID=ORDERS.CUST_ID
 

 --10.Write a query to retrieve the products that have not been ordered.
 SELECT PRODUCT1.PRODUCTNAME FROM PRODUCT1
 INNER JOIN ORDERS
 ON PRODUCT1.PRODUCTID=ORDERS.ORDERID
 WHERE ORDERS.PRODUCTNAME NOT IN (PRODUCT1.PRODUCTNAME)

 --TASK 2--
--1.Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.
SELECT TOP 5 CUST_ID,QUANTITY FROM ORDERS
ORDER BY QUANTITY DESC

--2.2.Write a query to calculate the average price of products for each product category.
SELECT PRODUCT1.PRODUCTNAME,AVG(PRODUCT1.PRICE*ORDERS.QUANTITY ) 'AVG PRICE'FROM PRODUCT1
INNER JOIN ORDERS
ON PRODUCT1.PRODUCTID=ORDERS.ORDERID
GROUP BY PRODUCT1.PRODUCTNAME

--3.3.Write a query to retrieve the customers who have not placed any orders.

SELECT CUSTOMER.CUSTOMERID,CUSTOMER.CUS_NAME,ORDERS.CUST_ID FROM CUSTOMER
LEFT JOIN ORDERS
ON CUSTOMER.CUSTOMERID=ORDERS.CUST_ID
WHERE CUSTOMER.CUSTOMERID NOT IN (ORDERS.CUST_ID)

--4.rite a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M'.

SELECT * FROM ORDERS
SELECT CUSTOMER.CUS_NAME,ORDERS.ORDERID,ORDERS.PRODUCTNAME,ORDERS.QUANTITY FROM ORDERS
RIGHT JOIN CUSTOMER
ON ORDERS.CUST_ID=CUSTOMER.CUSTOMERID
WHERE CUSTOMER.CUS_NAME LIKE 'M_%'

---5.Write a query to calculate the total revenue generated from all orders.
SELECT * FROM PRODUCT1
SELECT 
SUM(PRODUCT1.PRICE*ORDERS.QUANTITY) 'TOTOL REVENUE' FROM ORDERS
RIGHT JOIN PRODUCT1
ON ORDERS.CUST_ID=PRODUCT1.PRODUCTID

--6.Write a query to retrieve the customer names along with the total revenue generated from their orders.
SELECT 
C.CUS_NAME,ORDERID,SUM(PRICE*QUANTITY) AS _REVEUNE FROM CUSTOMER C
INNER JOIN ORDERS O
ON C.CUSTOMERID=O.ORDERID
INNER JOIN PRODUCT1 P
ON
O.ORDERID=P.PRODUCTID
GROUP BY 
C.CUS_NAME,ORDERID


--9.Write a query to retrieve the top 3 products with the highest average quantity ordered.
SELECT  TOP 3 PRODUCTNAME,AVG(QUANTITY) FROM ORDERS
GROUP BY PRODUCTNAME
ORDER BY AVG(QUANTITY) DESC

--10.Write a query to calculate the percentage of orders that have a quantity greater than the average quantity.
SELECT * FROM ORDERS
SELECT PRODUCTNAME, ORDERID,COUNT(ORDERID),AVG(QUANTITY) 'AVGQUANITY' FROM ORDERS
GROUP BY PRODUCTNAME

---TASK3--
--1.Write a query to retrieve the products that have been ordered by all customers.
SELECT PRODUCT1.PRODUCTNAME,ORDERS.PRODUCTNAME FROM PRODUCT1
RIGHT JOIN ORDERS
ON PRODUCT1.PRODUCTID=ORDERS.ORDERID
WHERE PRODUCT1.PRODUCTNAME=ORDERS.PRODUCTNAME

--2.Write a query to calculate the total revenue generated from orders placed in each month.
SELECT * FROM ORDERS
SELECT ORDERS.ORDERDATE,(ORDERS.QUANTITY*PRODUCT1.PRICE) 'TOTAL REVEUE' FROM ORDERS
LEFT JOIN PRODUCT1
ON ORDERS.CUST_ID=PRODUCT1.PRODUCTID


--3.Write a query to retrieve the products that have been ordered by more than 50% of the customers.
SELECT ORDERS.PRODUCTNAME,CUSTOMER.CUSTOMERID FROM ORDERS
INNER JOIN CUSTOMER
ON ORDERS.CUST_ID=CUSTOMER.CUSTOMERID
WHERE CUSTOMERID> (SELECT COUNT(CUSTOMERID)/2 FROM CUSTOMER)


--4.Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders.
WITH MONEY_SPENT_CTE AS
(
SELECT (O.QUANTITY*P.PRICE) AMT_ORDERS,C.CUS_NAME FROM CUSTOMER C
JOIN ORDERS O ON O.CUST_ID=C.CUSTOMERID
JOIN PRODUCT1 P ON O.PRODUCTNAME=P.PRODUCTNAME
)
SELECT TOP 5 * FROM MONEY_SPENT_CTE
ORDER BY AMT_ORDERS DESC

--5.Write a query to calculate the running total of order quantities for each customer.
select ORDERID,CUST_ID,PRODUCTNAME,QUANTITY,SUM(QUANTITY) OVER(ORDER BY CUST_ID) AS RUNNING_TOTAL FROM ORDERS

--6.Write a query to retrieve the top 3 most recent orders for each customer.
SELECT * FROM ORDERS
SELECT TOP 3 PRODUCTNAME,CUST_ID,ORDERDATE FROM ORDERS
ORDER BY ORDERDATE DESC

--7.Write a query to calculate the total revenue generated by each customer in the last 30 days.

SELECT (ORDERS.QUANTITY*PRODUCT1.PRICE) 'TOTALREVEUE',ORDERS.ORDERDATE,ORDERS.CUST_ID FROM ORDERS
JOIN PRODUCT1 ON ORDERS.CUST_ID=PRODUCT1.PRODUCTID
ORDER BY ORDERS.ORDERDATE DESC

---8.Write a query to retrieve the customers who have placed orders for at least two different product categories.?
select cust_id FROM ORDERS
WHERE COUNT(PRODUCTNAME)>CUST_ID
GROUP BY CUST_ID
HAVING COUNT(DISTINCT(PRODUCTNAME))>1

--9.Write a query to calculate the average revenue per order for each customer.
SELECT 
C.CUS_NAME,ORDERID,AVG(PRICE*QUANTITY) AS AVG_REVEUNE FROM CUSTOMER C
INNER JOIN ORDERS O
ON C.CUSTOMERID=O.ORDERID
INNER JOIN PRODUCT1 P
ON
O.ORDERID=P.PRODUCTID
GROUP BY 
C.CUS_NAME,ORDERID

SELECT * FROM ORDERS
---10.10.Write a query to retrieve the customers who have placed orders for every month of a specific year.?
SELECT CUST_ID FROM ORDERS
WHERE YEAR (ORDERDATE)=2023
GROUP BY  CUST_ID
HAVING COUNT(DISTINCT MONTH(ORDERDATE))=12

--12.Write a query to retrieve the products that have been ordered by a specific customer at least twice.

SELECT ORDERID,CUST_ID,PRODUCTNAME FROM ORDERS
GROUP BY ORDERID,CUST_ID,PRODUCTNAME
HAVING COUNT(PRODUCTNAME)>1



