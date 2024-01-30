--creating salesman, customer and orders table.
CREATE TABLE salesman(
	salesman_id INT PRIMARY KEY,
	name VARCHAR(50) NULL,
	city VARCHAR(50) NULL,
	commission INT NULL
);




CREATE TABLE customer(
	customer_id INT PRIMARY KEY,
	cust_name VARCHAR(50) NULL,
	city VARCHAR(50) NULL,
	grade VARCHAR(2) NULL,
	salesman_id INT,
	FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)

);

CREATE TABLE orders(
	ord_no INT PRIMARY KEY,
	purch_amt INT NULL,
	ord_date DATE NULL,
	customer_id INT,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	salesman_id INT,
	FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);


INSERT INTO salesman VALUES(20,'Pritam','mumbai',400);
INSERT INTO salesman VALUES(25,'Priya','delhi',500);
INSERT INTO salesman VALUES(35,'Priyanka','kolkata',230);
INSERT INTO salesman VALUES(45,'Poonam','chennai',250);
INSERT INTO salesman VALUES(16,'Priyam','lucknow',200);
INSERT INTO salesman VALUES(11,'Pranav','Karwar',200);
INSERT INTO salesman VALUES(24,'Prasanna','Bengalore',300);
INSERT INTO salesman VALUES(39,'Prajwal','Kodagu',100);
INSERT INTO salesman VALUES(44,'Pooja','Hubli',500);
INSERT INTO salesman VALUES(15,'Prokta','Mysore',200);


INSERT INTO customer VALUES(101,'Bhargav','Mysore','A',15);
INSERT INTO customer VALUES(206,'Ramya','Bengalore','C',24);
INSERT INTO customer VALUES(225,'Rajesh','Hubli','B',39);
INSERT INTO customer VALUES(324,'Ravi','Mangalore','E',44);
INSERT INTO customer VALUES(456,'Rajdeep','Belagavi','C',15);
INSERT INTO customer VALUES(501,'Raghu','Dharavad','D',39);
INSERT INTO customer VALUES(300,'Bhavya','Bengalore','A',15);
INSERT INTO customer VALUES(309,'Shruti','Ahmedabad','A',35);
INSERT INTO customer VALUES(230,'Harimati','Kashmir','B',45);
INSERT INTO customer VALUES(219,'Hardik','Anjar','A',20);

insert into customer values(302 , 'Nick Rimando'   , 'New York'   ,   'A' ,        15);
insert into customer values(307 , 'Brad Davis'     , 'New York'   ,   'B' ,        15);
insert into customer values(305 , 'Graham Zusi'    , 'California' ,   'B',        29);
insert into customer values(308 , 'Julian Green'   , 'London'     ,   'C' ,        17);
insert into customer values(304 , 'Fabian Johnson' , 'Paris'      ,  'C' ,        65);
insert into customer values(301 , 'Geoff Cameron'  , 'Berlin'     ,   'A' ,        33);
insert into customer values(303 , 'Jozy Altidor'   , 'Moscow'     ,   'B' ,        47);
insert into customer values(310 , 'Brad Guzan'     , 'London'     ,   'D' ,        65);
insert into customer values(300 , 'Brad Guzan'     , 'London'     ,  null ,      15);



INSERT INTO orders VALUES(15,1200,'2020-08-25',501,20);
INSERT INTO orders VALUES(12,5100,'2020-09-25',309,35);
INSERT INTO orders VALUES(13,9400,'2020-10-30',230,45);
INSERT INTO orders VALUES(14,8600,'2020-10-07',219,16);
INSERT INTO orders VALUES(18,1700,'2020-11-07',206,25);
INSERT INTO orders VALUES(5,10000,'2020-03-25',101,11);
INSERT INTO orders VALUES(10,5000,'2020-03-25',456,15);
INSERT INTO orders VALUES(7,9500,'2020-04-30',225,44);
INSERT INTO orders VALUES(11,8700,'2020-07-07',324,24);
INSERT INTO orders VALUES(17,1500,'2020-07-07',206,39);


select * FROM salesman;
select * FROM customer;
select * FROM orders;


