--Folder-03
--Coding exercise-1
SELECT * FROM Payment

SELECT DISTINCT customer_id FROM payment 
WHERE amount>=7.99


--Coding exercise-2
SELECT * FROM film

SELECT title, rental_rate, replacement_cost FROM film
WHERE rental_rate > 2.99 OR replacement_cost > 19.99

--Folder-4
--Coding Exercise-1
SELECT title, replacement_cost, rental_duration 
FROM  film
WHERE rental_duration BETWEEN 4 AND 6
ORDER BY replacement_cost DESC
LIMIT 100;

--Coding Exercise-2
SELECT * FROM film

SELECT title, length, rating, description
FROM film
WHERE rating IN ('G','PG')
AND length>120
AND description ILIKE '%Action%'


--Folder-6
--Coding Exercise-2
SELECT DISTINCT first_name, COUNT(first_name)
FROM actor
GROUP BY first_name
ORDER BY COUNT(first_name) DESC;

--Folder-8
--Coding Exercise-1
SELECT title, name AS Language, rental_rate
FROM film
JOIN language
ON film.language_id = language.language_id
ORDER BY rental_rate;

--Coding Exercise-2
Select actor. actor_id, CONCAT(actor.first_name, ' ', actor.last_name) AS "actor_name", COUNT(film.film_id) AS "Movies acted In"
FROM actor
JOIN film_actor 
ON film_actor.actor_id = actor.actor_id
JOIN film 
ON film.film_id = film_actor.film_id
GROUP BY actor. actor_id
ORDER BY  "Movies acted In" DESC;

SELECT * FROM film;
Select * from rental;
select * from inventory;

--Coding Exercise-3
SELECT film.rating, COUNT(inventory.inventory_id)
FROM rental
JOIN  inventory
ON rental.inventory_id = inventory.inventory_id
RIGHT JOIN film
ON inventory.film_id = film.film_id
GROUP BY film.rating;


--Folder-10
--Coding Exercise-1
SELECT rental_date, return_date, AGE(return_date, rental_date) AS "Rent_Duration", 
CONCAT(first_name,' ', last_name) AS "full_name", email
FROM rental
JOIN customer 
ON customer.customer_id = rental.customer_id
WHERE return_date IS NOT NULL
AND AGE(return_date, rental_date) >= interval '7 days'
ORDER BY "Rent_Duration" ASC;


--Coding Exercise-2
select * from film


SELECT title, SUBSTR(title, 10)
FROM film;

SELECT title, SUBSTR(title, 15)
FROM film;

SELECT title, SUBSTR(title, 5, 3)
FROM film;

SELECT title, SUBSTR(title, 5, 1)
FROM film;


--Folder-12
--Coding Exercise-1
SELECT * FROM customer

SELECT CONCAT(first_name,' ', last_name) AS "name", email,
SUM(amount) AS "total rentals",
CASE
	WHEN SUM(amount)>=200 THEN 'Elite'
	WHEN SUM(amount)>=150 AND SUM(amount)<=200 THEN 'Platinum'
	WHEN SUM(amount)>=100 AND SUM(amount)<150 THEN 'Gold'
	WHEN SUM(amount)>=0 AND SUM(amount)<100 THEN 'Silver'
END AS "Customer Category"
FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id
GROUP BY "name" , email;

--Coding Exercise-2
CREATE VIEW customer_segments AS
	SELECT CONCAT(first_name,' ', last_name) AS "name", email,
	SUM(amount) AS "total rentals",
	CASE
		WHEN SUM(amount)>=200 THEN 'Elite'
		WHEN SUM(amount)>=150 AND SUM(amount)<=200 THEN 'Platinum'
		WHEN SUM(amount)>=100 AND SUM(amount)<150 THEN 'Gold'
		WHEN SUM(amount)>=0 AND SUM(amount)<100 THEN 'Silver'
	END AS "Customer Category"
	FROM payment
	JOIN customer
	ON payment.customer_id = customer.customer_id
	GROUP BY "name" , email;


SELECT * FROM customer_segments;

--Folder-14
--Coding Exercise-01
CREATE DATABASE mycommerce;

CREATE TABLE order_Details(
	order_id INTEGER PRIMARY KEY,
	customer_name VARCHAR(50) NOT NULL,
	product_name VARCHAR(50) NOT NULL,
	ordered_from VARCHAR(50) NOT NULL,
	order_amount NUMERIC(7,2),
	order_date DATE NOT NULL,
	delivery_date DATE 
);

SELECT * FROM order_Details;

--Coding Exercise-02
ALTER TABLE order_Details RENAME COLUMN customer_name TO customer_first_name;

ALTER TABLE order_Details ADD COLUMN cancel_Date DATE;







