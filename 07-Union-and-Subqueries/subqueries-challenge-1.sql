/*
CHALLENGE 1
1. Return all customer first and last names that have made a payment on '2020-01-25'
*/

-- Query to get list of customer ids that made payment on given date
SELECT 
customer_id 
FROM payment
WHERE DATE(payment_date) = '2020-01-25';

SELECT
first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT 
	customer_id 
	FROM payment
	WHERE DATE(payment_date) = '2020-01-25'
);


/* Return customer first name and email of those who spent more than $30 */
SELECT
first_name, email 
FROM customer
WHERE customer_id IN 
(SELECT
customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 30);


/* Return all the customer's first and last names that are from California 
and have spent more than $100 in total */
SELECT 
first_name, last_name
FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
WHERE c.customer_id IN (
	SELECT
	customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 100
)
AND 
a.district = 'California'
ORDER BY first_name ASC;