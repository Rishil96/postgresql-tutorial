-- UPPER, LOWER, LENGTH

SELECT UPPER(email) AS email_upper, LOWER(email) AS email_lower, LENGTH(email) AS email_length
FROM customer
WHERE LENGTH(email) < 30;


-- CHALLENGE 1
-- Find customers with first or last name more than 10 characters and return it in lower case
SELECT LOWER(first_name), LOWER(last_name), LOWER(email) FROM customer
WHERE LENGTH(first_name) > 10 OR LENGTH(last_name) > 10;