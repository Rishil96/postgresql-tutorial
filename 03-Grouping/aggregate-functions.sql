-- AGGREGATE FUNCTIONS

-- Sum
SELECT SUM(amount) FROM payment;

-- Count
SELECT COUNT(amount) FROM payment;

-- Min
SELECT MIN(amount) FROM payment;

-- Max
SELECT MAX(amount) FROM payment;

-- Average
SELECT ROUND(AVG(amount), 2) FROM payment;


-- CHALLENGE
-- Get min, max, avg and Sum of the replacement cost of the films
SELECT MIN(replacement_cost), 
MAX(replacement_cost), 
ROUND(AVG(replacement_cost), 2), 
SUM(replacement_cost) FROM film