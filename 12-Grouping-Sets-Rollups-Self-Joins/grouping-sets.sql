-- GROUPING SETS
SELECT
TO_CHAR(payment_date, 'Month') AS month,
staff_id,
SUM(amount)
FROM payment
GROUP BY
	GROUPING SETS (
	(staff_id),
	(month),
	(staff_id, month)
	)
ORDER BY 1, 2;


/*
CHALLENGE 1:
1. Query that returns the sum of the amounts for each customer (first name and last name)
and each staff id. Also add the overall revenue per customer
2. Calculate the share of revenue each staff_id makes per customer
	ans. Partition by each customer and order by the total revenue and calculate its %
*/
SELECT
first_name, last_name, staff_id, SUM(amount) AS total_revenue,
ROUND((SUM(amount) / FIRST_VALUE(SUM(amount)) OVER(PARTITION BY first_name, last_name ORDER BY SUM(amount) DESC)) * 100, 2) AS staff_revenue_per_customer_percent
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY 
	GROUPING SETS (
	(first_name, last_name),
	(first_name, last_name, staff_id)
	)
ORDER BY first_name, last_name, staff_id