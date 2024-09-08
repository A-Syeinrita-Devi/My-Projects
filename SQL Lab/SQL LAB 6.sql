CREATE DATABASE sales;

USE sales;

SELECT * FROM sales;

SELECT ï»¿Sid,Sname,Rating,
CASE WHEN Rating <5 THEN "Below"
	 WHEN Rating =5 THEN "Median"
     WHEN Rating <=10 THEN "Above"
     ELSE "illegal rating" END Scale
FROM sales;

SELECT AVG(Age)
FROM sales
WHERE Rating=10;

SELECT count(*) FROM sales;

SELECT MAX(Rating) AS MAX , MIN(Rating) AS MIN, MAX(Rating)-MIN(Rating) AS range_of_it
FROM sales;

USE hr;

#slide 26
SELECT e.employee_id, e.first_name, e.last_name, m.employee_id MANAGER_ID, m.first_name
MANAGER_FNAME, m.last_name MANAGER_LNAME
FROM employees e
JOIN employees m #use inner join, same function too
ON e.manager_id = m.employee_id;

#slide 29
SELECT DISTINCT e.manager_id, m.first_name, m.last_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.employee_id;

#slide 30
SELECT employee_id, first_name, last_name, employees.department_id, department_name
FROM employees
INNER JOIN departments
ON (employees.department_id = departments.department_id);

#slide 31
SELECT employee_id, first_name, last_name, department_name, location_id
FROM employees
INNER JOIN departments
ON (employees.department_id = departments.department_id);

#slide 34
SELECT department_name, first_name
FROM departments
LEFT OUTER JOIN employees
ON (departments.department_id = employees.department_id);

#slide 36
SELECT department_name, first_name
FROM departments
RIGHT OUTER JOIN employees
ON (departments.department_id = employees.department_id);

