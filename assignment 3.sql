use hardikupadhyay_db;


--1. write a SQL query to find Employees who have the biggest salary in their Department.

SELECT emp_name, salary 
FROM Employee AS E
JOIN (SELECT MAX(salary) AS Max_Salary, dept_id
FROM Employee 
GROUP BY dept_id) AS Dept_details 
ON Dept_details.dept_id= E.dept_id AND E.salary=Max_Salary

--2. write a SQL query to find Departments that have less than 3 people in it.
SELECT dept_name
FROM Department as d
JOIN (SELECT dept_id,count(emp_id) as c 
FROM Employee
GROUP BY dept_id) as a
ON d.dept_id = a.dept_id 
WHERE c >6


--3. write a SQL query to find All Department along with the number of people there.SELECT dept_name,a.number
FROM Department as d
JOIN (SELECT dept_id,count(emp_id) as numberFROM EmployeeGROUP BY  dept_id) as aON d.dept_id = a.dept_id --4. write a SQL query to find All Department along with the total salary there.
SELECT	D.dept_name, Dept_details.sum_Salary
FROM Department AS D
JOIN (SELECT sum(salary) AS sum_Salary, dept_id
FROM Employee 
GROUP BY dept_id) AS Dept_details 
ON Dept_details.dept_id= D.dept_id 