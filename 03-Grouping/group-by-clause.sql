-- GROUP BY CLAUSE

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY customer_id;

-- CHALLENGE 1
-- 1. Which of the 2 employees (staff_id) is responsible for more payments
-- 2. Which of the 2 is responsible for a higher overall payment amount
SELECT staff_id, SUM(amount), COUNT(*) FROM payment
GROUP BY staff_id;

-- 3. How do these amounts change if we don't consider amounts equal to 0
SELECT staff_id, SUM(amount), COUNT(*) FROM payment
WHERE amount > 0
GROUP BY staff_id;

-- GROUP BY MULTIPLE COLUMNS
SELECT staff_id, customer_id, SUM(amount), COUNT(*) 
FROM payment
GROUP BY staff_id, customer_id
ORDER BY COUNT(*) DESC;

-- CHALLENGE 2
-- 1. Which employee has the highest sales amount in a single day
-- 2. Which employee had the most sales in a single day (not counting payments with amount 0)
SELECT staff_id, DATE(payment_date), SUM(amount), COUNT(*) FROM payment
WHERE amount != 0
GROUP BY staff_id, DATE(payment_date)
ORDER BY SUM(amount) DESC;
