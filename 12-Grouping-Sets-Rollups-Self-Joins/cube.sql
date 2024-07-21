-- CUBE 
SELECT
customer_id,
staff_id,
DATE(payment_date),
SUM(amount)
FROM payment
GROUP BY
CUBE (
	customer_id, 
	staff_id, 
	DATE(payment_date)
	)
ORDER BY 1, 2, 3

-- CHALLENGE: query that returns all grouping sets in all combinations of customer_id,
-- date, and title with the aggregation of payment amount
SELECT
c.customer_id, DATE(p.payment_date), f.title, SUM(amount) AS total_revenue
FROM customer c
LEFT JOIN rental r
ON c.customer_id = r.customer_id
LEFT JOIN payment p
ON r.rental_id = p.rental_id
LEFT JOIN inventory i
ON r.inventory_id = i.inventory_id
LEFT JOIN film f
ON i.film_id = f.film_id
GROUP BY 
CUBE (
	c.customer_id,
	DATE(p.payment_date),
	f.title
)
ORDER BY 1, 2, 3
