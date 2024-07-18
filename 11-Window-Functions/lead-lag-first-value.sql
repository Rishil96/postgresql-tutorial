-- FIRST VALUE
SELECT
c.name, c.country, 
COUNT(*) AS customer_country_count, 
FIRST_VALUE(COUNT(*)) OVER(PARTITION BY country ORDER BY COUNT(*) ASC) AS rank_per_country,
COUNT(*) - FIRST_VALUE(COUNT(*)) OVER(PARTITION BY country ORDER BY COUNT(*) ASC) AS difference
FROM customer_list c
INNER JOIN payment p
ON c.id = p.customer_id
GROUP BY c.name, c.country


-- LEAD
SELECT
c.name, c.country, 
COUNT(*) AS customer_country_count,
LEAD(COUNT(*)) OVER(PARTITION BY c.country ORDER BY COUNT(*) ASC) AS rank_per_country
FROM customer_list c
INNER JOIN payment p
ON c.id = p.customer_id
GROUP BY c.name, c.country

-- LAG
SELECT
c.name, c.country, 
COUNT(*) AS customer_country_count,
LAG(COUNT(*)) OVER(PARTITION BY c.country ORDER BY COUNT(*) ASC) AS rank_per_country
FROM customer_list c
INNER JOIN payment p
ON c.id = p.customer_id
GROUP BY c.name, c.country

/*
CHALLENGE 
Return the revenue of the day and the revenue of the previous day
Percentage Growth : (current day - previous day) / previous day * 100
*/
SELECT
DATE(payment_date) AS day,
SUM(amount),
LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS previous_day,
SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS difference,
ROUND((SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date))) 
/ LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) 
* 100, 2)
FROM payment
GROUP BY DATE(payment_date)
ORDER BY DATE(payment_date);