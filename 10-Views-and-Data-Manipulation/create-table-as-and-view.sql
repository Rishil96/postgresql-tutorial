-- CREATE TABLE AS
/* 
CHALLENGE 1 : Create a customer spendings table where we have full name of each customer
along with their total payment
*/
CREATE TABLE customer_spendings 
AS
SELECT 
first_name || ' ' || last_name AS "name", SUM(amount) AS total_amount
FROM customer c
INNER JOIN payment p
ON p.customer_id = c.customer_id
GROUP BY "name";

SELECT
*
FROM 
customer_spendings;

-- Drop the table and make a view of it
DROP TABLE customer_spendings;

-- VIEW
CREATE VIEW customer_spendings 
AS
SELECT 
first_name || ' ' || last_name AS "name", SUM(amount) AS total_amount
FROM customer c
INNER JOIN payment p
ON p.customer_id = c.customer_id
GROUP BY "name";

-- CHALLENGE 1
/*
Create a view called films_category that shows a list of the film titles 
including their title, length and category name ordered descendingly by the length.
Filter the results to only the movies in the category 'Action' and 'Comedy'.
*/
CREATE VIEW films_category
AS
SELECT
title, length, name AS category_name
FROM film f
LEFT JOIN film_category fc
ON f.film_id = fc.film_id
LEFT JOIN category c
ON fc.category_id = c.category_id
WHERE name IN ('Action', 'Comedy')
ORDER BY length DESC;

SELECT
*
FROM films_category;
