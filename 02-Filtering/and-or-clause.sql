-- AND / OR 

-- OR Clause
SELECT * FROM payment
WHERE customer_id = 30 OR customer_id = 31


-- AND Clause
SELECT * FROM payment
WHERE customer_id = 30 AND amount = 1.99

-- Combining AND and OR Clause
SELECT * FROM payment
WHERE (customer_id = 30 OR customer_id = 31) AND amount = 2.99

-- CHALLENGE 2

-- 1. List of customer 322, 346, 354 where amount is less than 2 or greater than 10. 
-- Customer ascending and amount descending
SELECT * FROM payment
WHERE (customer_id = 322 OR customer_id = 346 OR customer_id = 354)
AND (amount < 2 OR amount > 10)
ORDER BY customer_id ASC, amount DESC
