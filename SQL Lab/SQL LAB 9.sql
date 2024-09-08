CREATE DATABASE Products;

USE Products;

CREATE TABLE Product (
    PName varchar(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Category varchar(50),
    Manufacturer varchar(50)
);

INSERT INTO Product (PName, Price, Category, Manufacturer)
VALUES ('Gizmo', 19.99, 'Gadgets', 'GizmoWorks'),
       ('Powergizmo', 29.99, 'Gadgets', 'GizmoWorks'),
       ('SingleTouch', 149.99, 'Photography', 'Canon'),
       ('MultiTouch', 203.99, 'Household', 'Hitachi');
       
SELECT * FROM Product;   

SELECT * FROM Product LIMIT 2;  

SELECT Pname AS Product_Name, Price FROM Product
WHERE Price >100; 

SELECT Pname AS Product_Name, Manufacturer FROM Product
WHERE  Manufacturer = "GizmoWorks";

SELECT Pname AS Product_Name, Price FROM Product
WHERE Price BETWEEN 15 AND 30; 

       