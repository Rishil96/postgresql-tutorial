-- UPDATE TABLE
SELECT 
* 
FROM customer
ORDER BY customer_id;

-- Change last name of customer with ID 1
UPDATE customer
SET last_name = 'BROWN'
WHERE customer_id = 1;

-- Lowercase all email ids
UPDATE customer
SET email = LOWER(email);


-- CHALLENGE 1
/*
1. Update all rental prices from 0.99 to 1.99
2. Add new column 'initials' to customer table having varchar(10)
3. Update initials using first and last name e.g. Frank Smith will have initials "F.S."
*/
-- 1.
SELECT 
* 
FROM film
ORDER BY film_id;

UPDATE film
SET rental_rate = 1.99
WHERE rental_rate = 0.99;

-- 2.
ALTER TABLE customer
ADD COLUMN initials VARCHAR(10);

UPDATE customer
SET initials = LEFT(first_name, 1) || '.' || LEFT(last_name, 1) || '.'

-- DELETE FROM TABLE
DELETE FROM payment
WHERE payment_id IN (17064, 17067)
RETURNING *;

