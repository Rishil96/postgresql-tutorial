-- BETWEEN Keyword

-- Between to get a range of values
SELECT * FROM payment
WHERE amount BETWEEN 1.99 AND 6.99

-- Not between to ignore a range of values
SELECT * FROM payment
WHERE amount NOT BETWEEN 1.99 AND 6.99


-- CHALLENGE 3
-- How many payments have been made on Jan 26th and 27th 2020 with amount between 1.99 and 3.99
SELECT COUNT(*) FROM payment
WHERE payment_date BETWEEN '2020-01-26' AND '2020-01-28'
AND amount BETWEEN 1.99 and 3.99
