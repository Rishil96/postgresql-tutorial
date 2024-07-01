-- CONCATENATE
-- USE || to concatenate 2 strings
SELECT 
first_name,
last_name, 
LEFT(first_name, 1) || '.' || LEFT(last_name, 1) AS initials 
FROM customer;

-- CHALLENGE 1
-- ANONYMIZE the email address
SELECT email, LEFT(email, 1) || '***'|| RIGHT(email, 19) as anonymized_emails FROM customer;


-- SEARCH CHARACTER USING POSITION
SELECT email, POSITION('@' IN email), LEFT(email, POSITION('@' IN email) - 1) FROM customer;

-- CHALLENGE 2
-- Use only email and last name columns to form a new column 'LAST_NAME, FIRST_NAME'
SELECT 
email, 
last_name, 
last_name || ', ' || LEFT(email, POSITION('.' IN email) - 1) 
FROM customer;