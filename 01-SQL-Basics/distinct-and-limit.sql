-- SELECT DISTINCT STATEMENT

-- Select distinct from single column
SELECT DISTINCT first_name FROM actor
ORDER BY first_name ASC

-- Select distinct from multiple columns
SELECT DISTINCT first_name, last_name FROM actor
ORDER BY first_name ASC

SELECT DISTINCT rating, rental_duration
FROM film

-- CHALLENGE 3 : ALSO USING LIMIT
SELECT DISTINCT amount FROM payment
ORDER BY amount DESC
LIMIT 5