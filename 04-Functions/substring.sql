-- SUBSTRING
-- Extract last name from email
SELECT email, 
SUBSTRING(email FROM POSITION('.' IN email) + 1 FOR POSITION('@' IN email) - POSITION('.' IN email) - 1) AS extracted_last 
FROM customer;


-- CHALLENGE 1
-- 1. Anonymized email address 1 (M***.S***@sakilacustomer.org)
SELECT 
email, 
LEFT(email, 1) || '***.' || SUBSTRING(email FROM POSITION('.' IN email) + 1 FOR 1) 
|| '***' || SUBSTRING(email FROM POSITION('@' IN email)) AS anonymized_email_1 
FROM customer;


-- 2. Anonymized email address 2 (***A.J***@sakilacustomer.org)
SELECT 
email, 
'***' || RIGHT(SUBSTRING(email FROM 0 FOR POSITION('.' IN email)), 1) 
|| SUBSTRING(email FROM POSITION('.' IN email) FOR 2) || '***' 
|| SUBSTRING(email FROM POSITION('@' IN email))
FROM customer;
