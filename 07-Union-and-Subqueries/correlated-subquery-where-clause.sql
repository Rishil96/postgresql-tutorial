-- CORRELATED SUBQUERY

-- Query with highest payment amount for every customer
SELECT 
*
FROM payment p1
WHERE amount = (SELECT MAX(amount) FROM payment p2 WHERE p1.customer_id = p2.customer_id)
ORDER BY customer_id;


/*
CHALLENGE 1
Show only those movie titles, their associated film_id and replacement_cost with the lowest 
replacement_costs for in each rating category - also show the rating.
*/
SELECT 
film_id, title, replacement_cost, rating
FROM film f1
WHERE replacement_cost = (SELECT MIN(replacement_cost) FROM film f2 WHERE f1.rating = f2.rating);


/*
CHALLENGE 2
Show only those movie titles, their associated film_id and the length that have the highest 
length in each rating category - also show the rating
*/
SELECT
film_id, title, length, rating
FROM film f1
WHERE length = (SELECT MAX(length) FROM film f2 WHERE f1.rating = f2.rating);
 