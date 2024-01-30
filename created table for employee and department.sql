CREATE TABLE Department(
	dept_id INT PRIMARY KEY,
	dept_name VARCHAR(50)
);

CREATE TABLE Employee(
	emp_id INT PRIMARY KEY,
	dept_id INT,
	FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	mngr_id INT,
	emp_name VARCHAR(50) NULL,
	salary INT NULL
);


	

SELECT * FROM Department
SELECT * FROM Employee



INSERT INTO Department (dept_id,dept_name) 
VALUES	(101,'asp.net'),
		(102,'java'),
		(103,'HR'),
		(104,'QA'),
		(105,'php');


INSERT INTO Employee (emp_id,dept_id,mngr_id,emp_name,salary)
VALUES	(1,101,10,'chirag',50000),
		(2,101,10,'charlie',50000),
		(3,101,10,'dan',50000),
		(4,101,9,'bob',50000),
		(5,101,9,'lily',50000),
		(6,102,20,'Marcelo',45000),
		(7,102,20,'Meyer',45000),
		(8,102,20,'Anderson',45000),
		(9,102,15,'Chambers',45000),
		(10,102,10,'Derek',45000),
		(11,103,10,'Miles',49000),
		(12,103,20,'Blackburn',70000),
		(13,103,30,'Brenden',50000),
		(15,103,30,'Alia',49000),
		(14,103,30,'Odom',54000),
		(16,104,10,'Schmidt',35000),
		(17,104,13,'Wagner',35000),
		(18,104,35,'Avila',35000),
		(19,104,34,'Isabelle',35000),
		(20,104,34,'Wilkinson',NULL),
		(21,105,35,'Grant',25000),
		(22,105,20,NULL,25000),
		(23,105,34,'Wilkinson',25000),
		(24,105,34,'bob',25000),
		(25,105,34,'harry',25000),
		(26,102,10,'Grant',50000),
		(27,103,10,'Rhys',50000),
		(28,104,10,'Ryan',50000),
		(29,105,10,'Wilkinson',50000),
		(30,101,10,'Johnson',50000);