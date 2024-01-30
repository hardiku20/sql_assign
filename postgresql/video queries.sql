--SELECT
--WHERE
--AS
--DISTINCT

--ORDER BY

--LIMIT
SELECT * FROM payment
ORDER BY Amount DESC
LIMIT 15

--BETEEN
Select * FROM payment
WHERE Amount BETWEEN 3.99 AND 4.99
--NOT BETWEEN
Select * FROM payment
WHERE Amount NOT BETWEEN 3.99 AND 4.99

--IN KEYWORD
SELECT * FROM address 
WHERE district IN ('Texas', 'California' , 'Florida' , 'Hawai') 
--NOT IN 
SELECT * FROM address 
WHERE district NOT IN ('Texas', 'California' , 'Florida' , 'Hawai') 

--LIKE ~ for matching patterns
SELECT * FROM address
WHERE address LIKE '%Avenue%'

SELECT * FROM address
WHERE district LIKE '%and_%'

--not case sensitive
SELECT * FROM address
WHERE district ILIKE '%and_%'

--AGGREGATE FUNCTIONS
--AVG
SELECT AVG(rental_rate)
FROM film;

--MAX
SELECT MAX(rental_rate)
FROM film;

--SUM
SELECT SUM(rental_rate)
FROM film;

SELECT ROUND(AVG(rental_rate),2) AS avg_rental_rate, SUM(replacement_cost) AS avg_replacement_cost
FROM film;


--COUNT
SELECT COUNT(*) FROM film
WHERE rating = 'PG-13'

--GROUP BY
SELECT staff_id, SUM(amount)
FROM payment
GROUP BY staff_id
ORDER BY SUM(amount) DESC;

SELECT staff_id AS "Staff ID", SUM(amount) AS "Total Sales"
FROM payment
WHERE payment_date BETWEEN '2007-02-15' AND '2007-02-20'
GROUP BY staff_id
ORDER BY SUM(amount) DESC;

SELECT staff_id, SUM(amount) AS total_amount
FROM payment
GROUP BY staff_id
HAVING SUM(amount) >30000;

--SUB-QUERY
SELECT title, rental_rate FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);
 

--JOINS
--INNER JOIN
SELECT * FROM customer;
SELECT customer_id, first_name, last_name, address, district, postal_code, phone
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id

--CONCAT
SELECT * FROM customer;
	SELECT customer_id, CONCAT(first_name, ' ' ,last_name), address, district, postal_code, phone
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'California';

--LEFT JOIN --film & inventory
SELECT film.film_id, film.title, inventory.inventory_id, store_id
FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id
Where inventory_id IS NULL

--RIGHT JOIN
SELECT staff_id, first_name, last_name, staff.address_id, address.address_id, address, postal_code
FROM staff
RIGHT JOIN address
ON staff.address_id = address.address_id

--FULL OUTER JOIN
SELECT * FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE customer.address_id IS NULL

SELECT * FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE customer.address_id IS NOT NULL

SELECT COUNT(*) FROM customer
FULL JOIN address
ON customer.address_id = address.address_id

SELECT COUNT(*) FROM address
FULL JOIN customer
ON customer.address_id = address.address_id

--UNION
SELECT name FROM  category
UNION
SELECT name FROM language;

--***each union query must have same number of columns and datatypes***

--MATHEMATICAL EXPRESSION
SELECT amount, amount+1 AS "New Amount" FROM payment
LIMIT 25;


SELECT ABS(-1.75);

SELECT amount,ROUND(amount,1) AS "Rounded", TRUNC(amount, 0) AS "Trunc" 
FROM payment
LIMIT 25;

--STRING FUNCTIONS
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) AS "Full Name"
FROM staff;

SELECT last_name, substr(last_name, 3, 2) AS "Substring"
FROM staff
WHERE staff_id=2;

SELECT last_name, substr(last_name, 3) AS "Substring"
FROM staff
WHERE staff_id=1;
