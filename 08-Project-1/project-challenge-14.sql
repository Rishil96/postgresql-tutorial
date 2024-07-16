-- Problems that I couldn't complete 14

/*
14.
Topic: Correlated and uncorrelated subqueries (nested)
Task: Create a list with the top overall revenue of a film title (sum of amount per title) for each category (name).
Question: Which is the top-performing film in the animation category?
Answer: DOGMA FAMILY with 178.70.
*/

SELECT 
title, name, SUM(amount) AS total
FROM payment p
LEFT JOIN rental r
ON r.rental_id = p.rental_id
LEFT JOIN inventory i
ON i.inventory_id = r.inventory_id
LEFT JOIN film f
ON f.film_id = i.film_id
LEFT JOIN film_category fc
ON fc.film_id = f.film_id
LEFT JOIN category c
ON c.category_id = fc.category_id
GROUP BY name, title
HAVING SUM(amount) = (
	SELECT 
	MAX(total)
	FROM (
		SELECT 
		title, name, SUM(amount) AS total
		FROM payment p
		LEFT JOIN rental r
		ON r.rental_id = p.rental_id
		LEFT JOIN inventory i
		ON i.inventory_id = r.inventory_id
		LEFT JOIN film f
		ON f.film_id = i.film_id
		LEFT JOIN film_category fc
		ON fc.film_id = f.film_id
		LEFT JOIN category c
		ON c.category_id = fc.category_id
		GROUP BY name, title
		) sub
		WHERE c.name = sub.name
	)