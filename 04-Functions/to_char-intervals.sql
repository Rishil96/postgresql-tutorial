-- TO_CHAR

SELECT payment_date, TO_CHAR(payment_date, 'YYYY') FROM payment;

SELECT payment_date, TO_CHAR(payment_date, 'MM') FROM payment;

SELECT payment_date, TO_CHAR(payment_date, 'Day') FROM payment;

SELECT payment_date, TO_CHAR(payment_date, 'MonthDD, YYYY') FROM payment;


-- CHALLENGE 1
-- Group by using Fri, 24/01/2020
SELECT TO_CHAR(payment_date, 'Dy, DD/MM/YYYY'), SUM(amount) AS total_amount
FROM payment
GROUP BY TO_CHAR(payment_date, 'Dy, DD/MM/YYYY')
ORDER BY total_amount ASC;


-- Group by using May 2020
SELECT TO_CHAR(payment_date, 'Mon, YYYY'), SUM(amount) AS total_amount
FROM payment
GROUP BY TO_CHAR(payment_date, 'Mon, YYYY')
ORDER BY total_amount ASC;


-- Group by using Thu, 02:44
SELECT TO_CHAR(payment_date, 'Dy, HH:MI'), SUM(amount) AS total_amount
FROM payment
GROUP BY TO_CHAR(payment_date, 'Dy, HH:MI')
ORDER BY total_amount DESC;


-- INTERVALS AND TIMESTAMPS
SELECT CURRENT_DATE

SELECT CURRENT_TIMESTAMP

-- CHALLENGE
-- Create a list for the support team of all rental durations of customer with id 35
SELECT customer_id, return_date - rental_date AS rental_duration 
FROM rental
WHERE customer_id = 35;

-- Which customer has the longest average rent duration
SELECT customer_id, AVG(return_date - rental_date) as average_rental_duration
FROM rental
GROUP BY customer_id
ORDER BY average_rental_duration DESC;
