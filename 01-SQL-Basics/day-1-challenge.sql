-- CHALLENGE DAY 1

-- 1. Create a list of all the distinct districts customers are from.
SELECT DISTINCT district FROM address;


-- 2. What is the latest rental date?
SELECT * FROM rental
ORDER BY rental_date DESC
LIMIT 5;


-- 3. How many films does the company have?
SELECT COUNT(film_id) FROM film;


-- 4. How many distinct last names of the customers are there
SELECT COUNT(DISTINCT last_name) FROM customer;

