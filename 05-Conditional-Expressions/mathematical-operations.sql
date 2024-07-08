-- MATHEMATICAL FUNCTIONS

SELECT film_id, title, rental_rate AS old_rental_rate, rental_rate + 1 AS new_rental_rate 
FROM film;

SELECT film_id, title, rental_rate AS old_rental_rate, CEILING(rental_rate * 1.2) - 0.01 AS new_rental_rate 
FROM film;


-- CHALLENGE 1
-- Create a list of films including the relation of rental_rate/replacement_cost where the rental rate 
-- is less than 4% of the replacement cost
SELECT 
film_id, 
title, 
rental_rate, 
replacement_cost, 
ROUND((rental_rate / replacement_cost) * 100, 2) AS replacement_value 
FROM film
WHERE ROUND((rental_rate / replacement_cost) * 100, 2) < 4
ORDER BY replacement_value ASC