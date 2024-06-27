-- IN Clause

SELECT * FROM customer
WHERE customer_id IN (123, 212, 323, 243, 353, 432)


SELECT * FROM customer
WHERE customer_id NOT IN (123, 212, 323, 243, 353, 432)


-- CHALLENGE 4
SELECT * FROM payment
WHERE customer_id IN (12, 25, 67, 93, 124, 234)
AND amount in (4.99, 7.99, 9.99)
AND payment_date BETWEEN '2020-01-01' AND '2020-01-31 23:59'