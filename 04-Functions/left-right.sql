-- LEFT AND RIGHT FUNCTION

-- Extract n characters from left
SELECT LEFT(first_name, 2), first_name FROM customer;

-- Extract n characters from right
SELECT RIGHT(first_name, 2), first_name FROM customer;

-- Combine left and right to get character in middle
-- Get first 2 characters from left and get the 1st char from right of those 2 characters, 
-- that's how we get 2nd character
SELECT RIGHT(LEFT(first_name, 2), 1), first_name FROM customer;

-- CHALLENGE 1
-- Extract last 5 characters of the email address first
SELECT RIGHT(email, 5), email FROM customer;

-- Extract . from .org of email address
SELECT LEFT(RIGHT(email, 4), 1), email FROM customer;