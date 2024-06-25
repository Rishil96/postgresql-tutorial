-- ORDER BY STATEMENT

-- Order by Ascending order
SELECT first_name, last_name
FROM public.actor
ORDER BY first_name ASC;

-- Order by Descending order
SELECT first_name, last_name
FROM public.actor
ORDER BY first_name DESC;

-- Order by multiple columns
SELECT * FROM payment
ORDER BY customer_id ASC, amount DESC

-- CHALLENGE 2
SELECT first_name, last_name, email FROM customer
ORDER BY last_name DESC, first_name DESC