-- RANK FUNCTION
SELECT
f.title, c.name, f.length,
RANK() OVER(ORDER BY length DESC)
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
ORDER BY length DESC;

-- DENSE_RANK
SELECT
f.title, c.name, f.length,
DENSE_RANK() OVER(ORDER BY length DESC)
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
ORDER BY length DESC;

-- USE PARTITION BY FOR RANK
SELECT
f.title, c.name, f.length,
DENSE_RANK() OVER(PARTITION BY c.name ORDER BY length DESC)
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
ORDER BY name ASC, length DESC;



/*
CHALLENGE 1
Return customer name, country, and how many payments they have. 
Use existing view customer_list
Afterwards create a ranking of top customers with most sales for each country.
Filter the results to only top 3 results per country.
*/
SELECT
c.name, c.country, COUNT(*)
FROM customer_list c
INNER JOIN payment p
ON c.id = p.customer_id
GROUP BY c.name, c.country;


SELECT * FROM
	(
		SELECT
		c.name, c.country, 
		COUNT(*), 
		RANK() OVER(PARTITION BY country ORDER BY COUNT(*) DESC) AS rank
		FROM customer_list c
		INNER JOIN payment p
		ON c.id = p.customer_id
		GROUP BY c.name, c.country
	)
WHERE rank IN (1, 2, 3);