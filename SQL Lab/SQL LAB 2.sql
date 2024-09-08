USE classicmodels;

SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM offices;
SELECT * FROM oderdetails;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM productlines;
SELECT * FROM products;

SELECT * FROM employees WHERE jobTitle = 'Sales Rep';
SELECT COUNT(*) FROM customers;
SELECT DISTINCT country FROM offices;




#a)
SELECT COUNT(*) AS Number_of_Employees, o.city 	AS City
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode
GROUP BY o.city
ORDER BY Number_of_Employees DESC;

#b)
CREATE VIEW staff_office1 AS
SELECT CONCAT(e.lastName, ', ', e.firstName) AS Name, o.city, o.addressLine1, o.country
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode
WHERE e.officeCode = '1';

SELECT * FROM staff_office1;

#C)
SELECT AVG(creditLimit) AS 'Average Credit Limit'
FROM customers;

#d)
SELECT customerName AS Customers
FROM customers
WHERE creditLimit > (
    SELECT AVG(creditLimit)
    FROM customers);

#e)
SELECT c.customerName AS Customer_Name, c.phone AS Contact, e.firstName AS Salesperson_Name, 
e.jobTitle AS Position
FROM customers c
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

#f)
SELECT COUNT(c.customerNumber) AS Number_of_Customer, e.firstName AS Salesperson_name
FROM employees e
LEFT JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE e.jobTitle LIKE '%Sales Rep'
GROUP BY e.firstName;

#g)
SELECT e.firstName AS Salesperson_Name, COUNT(c.customerNumber) AS Customer_Count
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE e.jobTitle LIKE '%Sales Rep'
GROUP BY  e.firstName
HAVING COUNT(c.customerNumber) > 10;


#h)
SELECT c.customerName AS `Customer name`, p.checkNumber AS `Cheque Number`, 
p.paymentDate AS `Date`, p.amount AS `Amount`
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
WHERE c.customerName = 'Atelier graphique';

#i)
SELECT p.productName AS Product_Name, SUM(od.quantityOrdered) AS Quantity_Order, 
EXTRACT(MONTH FROM o.orderDate) AS Month_sale, EXTRACT(YEAR FROM o.orderDate) AS Year_sale
FROM orderdetails od
JOIN orders o ON od.orderNumber = o.orderNumber
JOIN products p ON od.productCode = p.productCode
GROUP BY p.productName, Month_sale, Year_sale;

#J)
SELECT productName AS "Product with >50 profit", MSRP - buyPrice AS "Profit"
FROM products 
WHERE MSRP - buyPrice >50
ORDER BY productName;


#k)
SELECT c.customerName AS `Customer Name`, o.orderNumber AS `Order Number`, 
SUM(od.quantityOrdered * od.priceEach) AS `Total Amount`
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY c.customerNumber, o.orderNumber;


#l)
SELECT p.productLine as "Line", p.productVendor as "Vendor" , 
SUM(p.quantityInStock) AS "Stock"
FROM products p
GROUP BY p.productLine, p.productVendor
ORDER BY p.productLine, p.productVendor;


#m)
SELECT p.productVendor AS Product_Vendor, p.productName AS Product_Name, 
p.buyPrice AS Product_Price,
       ROW_NUMBER() OVER (PARTITION BY p.productVendor ORDER BY p.buyPrice) AS Price_Rank
FROM products p
ORDER BY p.productVendor, p.buyPrice;






