-- SUBQUERIES ON FROM CLAUSE
SELECT 
ROUND(AVG(total_amount), 2) AS lifetime_average
FROM
(
	SELECT 
	customer_id, SUM(amount) AS total_amount 
	FROM payment
	GROUP BY customer_id
) AS subquery;


/*
CHALLENGE 1
What is the average total amount spent per day (average daily revenue)?
*/

SELECT ROUND(AVG(daily_revenue),2) AS avg_daily_revenue
FROM (
	SELECT 
	DATE(payment_date), SUM(amount) as daily_revenue
	FROM 
	payment
	GROUP BY DATE(payment_date)
) AS average_daily_revenue;