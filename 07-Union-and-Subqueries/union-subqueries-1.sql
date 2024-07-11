-- UNION 
SELECT first_name FROM actor
UNION
SELECT first_name FROM customer
ORDER BY first_name ASC;


SELECT first_name, 'actor' FROM actor
UNION ALL
SELECT first_name, 'customer' FROM customer
UNION ALL
SELECT UPPER(first_name), 'staff' FROM staff
ORDER BY 2 DESC;

-- SUBQUERIES
SELECT 
* 
FROM payment
WHERE amount > (SELECT AVG(amount) FROM payment);

-- CHALLENGE
-- Select all of the films where the length is longer than the average length of film
SELECT 
* 
FROM film
WHERE length > (SELECT AVG(length) FROM film);

-- Return all the films that are available in the inventory in store 2 more than 3 times
/* Below query returns a list of film_ids that have count > 3 in inventory */
SELECT 
film_id 
FROM inventory
WHERE store_id = 2
GROUP BY film_id
HAVING COUNT(*) > 3

SELECT film_id, title FROM film
WHERE film_id IN (
	SELECT 
	film_id 
	FROM inventory
	WHERE store_id = 2
	GROUP BY film_id
	HAVING COUNT(*) > 3
)

