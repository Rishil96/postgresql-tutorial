-- CORRELATED SUBQUERY SELECT CLAUSE
-- show the max amount made by each customer besides every transaction
SELECT 
*, (
		SELECT MAX(amount) 
		FROM payment p2 
		WHERE p1.customer_id = p2.customer_id
	) 
FROM payment p1
ORDER BY customer_id;


/*
CHALLENGE 1
Show the payments plus the total amount and no. of transactions for every customer
*/
SELECT
*,
(
	SELECT 
	SUM(amount)
	FROM payment p2
	WHERE p1.customer_id = p2.customer_id
) AS total_payment_amount,
(
	SELECT
	COUNT(*)
	FROM payment p3
	WHERE p1.customer_id = p3.customer_id
) AS no_of_completed_transactions
FROM payment p1
ORDER BY customer_id, amount DESC;


/*
CHALLENGE 2
Show only those films with the highest replacement costs in their rating
category plus show the average replacement cost in their rating category
*/
SELECT 
film_id, title, rating, replacement_cost,
(
	SELECT
	AVG(replacement_cost)
	FROM film f3
	WHERE f1.rating = f3.rating
) AS avg_replacement_cost_in_rating
FROM film f1
WHERE replacement_cost = (
	SELECT 
	MAX(replacement_cost)
	FROM film f2
	WHERE f1.rating = f2.rating
);


/*
CHALLENGE 3
Show only those payments with the highest payment for each customers first name - including 
the payment id of that payment
*/
SELECT 
first_name, amount, payment_id 
FROM 
payment p1
INNER JOIN customer c1
ON c1.customer_id = p1.customer_id
WHERE amount = (
	SELECT 
	MAX(amount)
	FROM payment p2
	WHERE p1.customer_id = p2.customer_id
);

