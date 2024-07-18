-- OVER CLAUSE ORDER BY
SELECT
*,
SUM(amount) OVER(ORDER BY payment_date)
FROM payment;

SELECT
*,
SUM(amount) OVER(ORDER BY payment_id)
FROM payment;

-- Use both partition by and order by
-- First we make a partition using customer id and then we order the results by payment id to get
-- aggregation for each customer id
SELECT
*,
SUM(amount) OVER(PARTITION BY customer_id ORDER BY payment_id)
FROM payment;


