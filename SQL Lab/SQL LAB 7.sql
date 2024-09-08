USE hr;

#a)

SELECT AVG(salary) FROM employees;
SELECT AVG(salary) FROM employees WHERE job_id = 6;
SELECT COUNT(*) AS employee_count FROM employees WHERE job_id = 9;
SELECT SUM(salary) FROM employees;

SELECT max(salary) as maximum_salary , min(salary) AS minimum_salary FROM employees;
SELECT AVG(salary) FROM employees WHERE department_id = 5;

#b) 
#i)
SELECT employee_id, salary FROM employees
WHERE department_id =
(SELECT department_id
FROM departments
WHERE department_name = 'Sales');

SELECT employee_id, salary FROM employees
WHERE department_id =
(SELECT department_id
FROM departments
WHERE department_name = 'Human Resources');

#ii)
SELECT employee_id, first_name, last_name FROM employees
WHERE department_id IN
(SELECT department_id FROM departments
WHERE location_id = 1700)
ORDER BY first_name , last_name;

#iii)
SELECT employee_id, first_name, last_name, salary FROM employees
WHERE salary =
(SELECT MAX(salary) FROM employees)
ORDER BY first_name , last_name;

SELECT employee_id, first_name, last_name, salary FROM employees
WHERE salary =
(SELECT MIN(salary) FROM employees)
ORDER BY first_name , last_name;

SELECT department_name, SUM(salary) AS total_salary
FROM employees, departments
GROUP BY department_name;

#c)

SELECT employee_id, first_name, last_name, department_name
FROM employees NATURAL JOIN departments;

SELECT employee_id, first_name, last_name, department_name, city
FROM employees NATURAL JOIN departments
NATURAL JOIN locations;

SELECT employee_id, first_name, last_name, department_id, department_name
FROM employees JOIN departments USING (department_id);

SELECT employee_id, first_name, last_name,employees.department_id, department_name
FROM employees JOIN departments
ON (employees.department_id = departments.department_id);

SELECT DISTINCT e.manager_id, m.first_name, m.last_name
FROM employees e INNER JOIN employees m
ON e.manager_id = m.employee_id;

SELECT department_name, first_name
FROM departments LEFT OUTER JOIN employees
ON (departments.department_id = employees.department_id);

SELECT department_name, first_name
FROM departments
RIGHT OUTER JOIN employees
ON (departments.department_id = employees.department_id);

SELECT
first_name, last_name, employees.department_id, departments.department_id, department_name
FROM employees
INNER JOIN departments ON departments.department_id = employees.department_id
WHERE employees.department_id IN (1 , 2, 3);

#d)

SELECT department_name, COUNT(employee_id) AS headcount
FROM employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY department_name;

SELECT department_name, COUNT(employee_id) AS headcount
FROM employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY department_name
ORDER BY headcount DESC;

#e)

SELECT manager_id,first_name, last_name, COUNT(employee_id) AS direct_reports
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING direct_reports >= 5; #full group by

SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) BETWEEN 20000 AND 30000
ORDER BY SUM(salary);

SELECT e.department_id, department_name, ROUND(AVG(salary), 2)
FROM employees e
INNER JOIN departments d ON d.department_id = e.department_id
GROUP BY e.department_id
HAVING AVG(salary) BETWEEN 5000 AND 7000
ORDER BY AVG(salary);

#f)

SELECT first_name, last_name, salary,
RANK() OVER (ORDER BY salary) salary_rank
FROM employees;

#g)

SELECT department_id, SUM(salary) AS 'Total_salary_Rollup'
FROM employees
GROUP BY department_id WITH ROLLUP;


