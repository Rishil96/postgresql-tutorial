-- CHALLENGE 1

-- CTE for getting total rental count and total rental amount for each customer
WITH customer_rental_aggregation AS (
	SELECT
	c.customer_id, c.first_name, c.last_name, COUNT(*) AS rental_count, SUM(p.amount) AS total_rental_amount
	FROM customer c
	LEFT JOIN payment p
	ON c.customer_id = p.customer_id
	LEFT JOIN rental r
	ON p.rental_id = r.rental_id
	GROUP BY c.customer_id, c.first_name, c.last_name
	ORDER BY c.customer_id
)

SELECT 
* 
FROM customer_rental_aggregation
WHERE rental_count > (
	SELECT 
	AVG(rental_count)
	FROM customer_rental_aggregation
)