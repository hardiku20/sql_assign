use hardikupadhyay_db;


--1. write a SQL query to find the salesperson and customer who reside in the same city. 
--Return Salesman, cust_name and city

SELECT salesman.name,customer.cust_name, salesman.city
FROM salesman
INNER JOIN customer
ON salesman.city =customer.city;

--2. write a SQL query to find those orders where the order amount exists between 500 
--and 2000. Return ord_no, purch_amt, cust_name, city

SELECT orders.ord_no,orders.purch_amt,customer.cust_name,customer.city
FROM orders
LEFT JOIN customer
ON orders.customer_id= customer.customer_id
WHERE purch_amt BETWEEN 500 AND 2000;

--3. write a SQL query to find the salesperson(s) and the customer(s) he represents. 
--Return Customer Name, city, Salesman, commission

SELECT customer.cust_name,salesman.city,salesman.name,salesman.commission
FROM salesman
LEFT JOIN customer
ON salesman.salesman_id=customer.salesman_id;



--4. write a SQL query to find salespeople who received commissions of more than 12 
--percent from the company. Return Customer Name, customer city, Salesman, 
--commission.

--SELECT customer.cust_name,customer.city,salesman.name,salesman.commission
--FROM salesman
--LEFT JOIN customer 
--ON salesman.salesman_id= customer.salesman_id
--WHERE commission>120;

--5. write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the 
--   company. Return Customer Name, customer city, Salesman, salesman city, commission
SELECT customer.cust_name,customer.city,salesman.name,salesman.commission,salesman.city
FROM salesman
LEFT JOIN customer 
ON salesman.salesman_id= customer.salesman_id
WHERE commission>120 AND salesman.city<>customer.city;

--6. write a SQL query to find the details of an order. Return ord_no, ord_date, 
--purch_amt, Customer Name, grade, Salesman, commission
SELECT orders.ord_no,orders.ord_date,orders.purch_amt,customer.cust_name,customer.grade,salesman.name,salesman.commission
FROM orders
JOIN customer
ON orders.customer_id=customer.customer_id
JOIN salesman
ON orders.salesman_id=salesman.salesman_id



--7. Write a SQL statement to join the tables salesman, customer and orders so that the 
--same column of each table appears once and only the relational rows are returned.  ERROR
SELECT * FROM orders AS O
JOIN customer AS C 
ON O.customer_id= C.customer_id
NATURAL JOIN salesman AS S
ON O.salesman_id = S.salesman_id


--8. write a SQL query to display the customer name, customer city, grade, salesman, 
--salesman city. The results should be sorted by ascending customer_id.

SELECT c.cust_name,c.city,c.grade,s.name,s.city,c.customer_id
FROM customer as c
LEFT JOIN salesman as s 
ON c.salesman_id= s.salesman_id
Order by c.customer_id ASC

--9. write a SQL query to find those customers with a grade less than 300. Return 
--cust_name, customer city, grade, Salesman, salesmancity. The result should be 
--ordered by ascending customer_id.

SELECT c.cust_name,c.city,c.grade,s.name,s.city,c.customer_id
FROM customer as c
LEFT JOIN salesman as s 
ON c.salesman_id= s.salesman_id
where grade>'A'
Order by c.customer_id ASC


--10. Write a SQL statement to make a report with customer name, city, order number, 
--order date, and order amount in ascending order according to the order date to 
--determine whether any of the existing customers have placed an order or not
SELECT c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt
FROM orders as o 
LEFT JOIN customer as c
ON o.customer_id=c.customer_id
order by o.ord_date desc



--11. Write a SQL statement to generate a report with customer name, city, order number, 
--order date, order amount, salesperson name, and commission to determine if any of 
--the existing customers have not placed orders or if they have placed orders through 
--their salesman or by themselves.



--12. Write a SQL statement to generate a list in ascending order of salespersons who 
--work either for one or more customers or have not yet joined any of the customers



--13. write a SQL query to list all salespersons along with customer name, city, grade, 
--order number, date, and amount.
SELECT s.name ,c.cust_name,c.city,c.grade,o.ord_no,o.ord_date,o.purch_amt
FROM orders as o
JOIN customer as c
ON o.customer_id= c.customer_id
JOIN salesman as s 
ON o.salesman_id= s.salesman_id

--14. Write a SQL statement to make a list for the salesmen who either work for one or 
--more customers or yet to join any of the customers. The customer may have placed, 
--either one or more orders on or above order amount 2000 and must have a grade, or 
--he may not have placed any order to the associated supplier.

SELECT a.cust_name, a.city, a.grade, 
       b.name AS "Salesman", 
       c.ord_no, c.ord_date, c.purch_amt 
FROM customer a 
RIGHT OUTER JOIN salesman b 
ON b.salesman_id = a.salesman_id 
LEFT OUTER JOIN orders c 
ON c.customer_id = a.customer_id 
WHERE c.purch_amt >= 2000 

--15.  Write a SQL statement to generate a list of all the salesmen who either work for one 
--or more customers or have yet to join any of them. The customer may have placed 
--one or more orders at or above order amount 2000, and must have a grade, or he 
--may not have placed any orders to the associated supplier.
SELECT S.salesman_id , S.name AS Salesman_name , C.cust_name , C.city AS CustomerCity , C.grade
 FROM salesman AS S
JOIN customer AS C ON C.salesman_id = S.salesman_id
JOIN orders AS O ON O.salesman_id = S.salesman_id
WHERE O.purch_amt>2000 AND C.grade IS NOT NULL



--16. Write a SQL statement to generate a report with the customer name, city, order no. 
--order date, purchase amount for only those customers on the list who must have a 
--grade and placed one or more orders or which order(s) have been placed by the 
--customer who neither is on the list nor has a grade.SELECT O.ord_no , O.purch_amt ,  O.ord_date ,  C.cust_name , C.city AS CustomerCity   
FROM orders AS O
JOIN customer AS C ON O.customer_id = C.customer_id
WHERE C.grade IS NOT NULL AND O.ord_no > 0




--17. Write a SQL query to combine each row of the salesman table with each row of the 
--customer table
SELECT *   
FROM salesman AS S
CROSS JOIN customer AS C


--18. Write a SQL statement to create a Cartesian product between salesperson and 
--customer, i.e. each salesperson will appear for all customers and vice versa for that 
--salesperson who belongs to that city.
SELECT *   
FROM salesman AS S
CROSS JOIN customer AS C
WHERE C.city is not null AND C.grade IS NOT NULL

--19. Write a SQL statement to create a Cartesian product between salesperson and 
--customer, i.e. each salesperson will appear for every customer and vice versa for 
--those salesmen who belong to a city and customers who require a gradeSELECT *   
FROM salesman AS S
CROSS JOIN customer AS C
WHERE C.city is not null AND C.grade IS NULL--20. Write a SQL statement to make a Cartesian product between salesman and 
--customer i.e. each salesman will appear for all customers and vice versa for those 
--salesmen who must belong to a city which is not the same as his customer and the 
--customers should have their own gradeSELECT *   
FROM salesman AS S
CROSS JOIN customer AS C
WHERE C.city <> S.city AND C.grade IS NOT NULL