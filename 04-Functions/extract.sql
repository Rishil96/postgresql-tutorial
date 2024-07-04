-- EXTRACT

SELECT EXTRACT(DAY from rental_date)
FROM rental

-- Use group by with
SELECT EXTRACT(MONTH from rental_date), COUNT(*)
FROM rental
GROUP BY EXTRACT(MONTH from rental_date)
ORDER BY COUNT(*) DESC

-- CHALLENGE 1
-- Months with the highest total payment amount
SELECT EXTRACT(MONTH from payment_date) AS month, SUM(amount) AS total_payment_amount
FROM payment
GROUP BY EXTRACT(MONTH from payment_date)
ORDER BY SUM(amount) DESC

-- Day of the week with highest total payment amount
SELECT EXTRACT(DOW from payment_date) AS day_of_week, SUM(amount) AS total_payment_amount
FROM payment
GROUP BY EXTRACT(DOW from payment_date)
ORDER BY SUM(amount) DESC

-- Highest amount one customer has spent in a week
SELECT EXTRACT(WEEK from payment_date) AS week_of_year, customer_id, SUM(amount)
FROM payment
GROUP BY EXTRACT(WEEK from payment_date), customer_id
ORDER BY SUM(amount) DESC


