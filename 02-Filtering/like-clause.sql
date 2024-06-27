-- LIKE Clause

-- Pattern to match name starting with A followed by any number of characters.
SELECT * FROM actor
WHERE first_name LIKE 'A%';

-- Match any single character followed by A and followed by any no. of characters.
SELECT * FROM actor
WHERE first_name LIKE '_A%';

-- Match any phrase having drama
SELECT * FROM film
WHERE description ILIKE '%Drama%'
AND title LIKE '_T%';


-- CHALLENGE 5
-- 1. Movies that contain documentary in the description
SELECT COUNT(*) FROM film
WHERE description ILIKE '%documentary%';

-- 2. Customer names that have first names that are 3 letters long and last name ending with X or Y
SELECT COUNT(*) FROM customer
WHERE (last_name LIKE '%X' OR last_name LIKE '%Y')
AND first_name LIKE '___';
