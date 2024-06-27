-- WHERE Clause

-- Where clause single condition
SELECT COUNT(*) FROM payment
WHERE amount = 0;

SELECT * FROM customer
WHERE first_name = 'ADAM';

SELECT * FROM payment
WHERE amount > 10


-- CHALLENGE 1

-- 1. How many payment were made by the customer with customer_id 100
SELECT COUNT(*) FROM payment 
WHERE customer_id = 100;


-- 2. What is the last name of the customer with first name ERICA?
SELECT last_name FROM customer
WHERE first_name = 'ERICA';


-- CHALLENGE 2

-- 1. How many rentals have not been returned yet?
SELECT COUNT(*) FROM rental
WHERE return_date IS NULL

-- 2. List of all payment ids with amount less than or equal to 2. Include payment id and amount
SELECT payment_id, amount FROM payment
WHERE amount <= 2

