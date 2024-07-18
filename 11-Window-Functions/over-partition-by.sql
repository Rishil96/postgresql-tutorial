-- OVER CLAUSE PARTITION BY
SELECT
*,
SUM(amount) OVER(PARTITION BY customer_id) AS total_expenditure_by_customer
FROM payment;

/*
CHALLENGE 1
Return the list of movies including film_id, title, length, category, avg. length of movies
in that category, and order the results by film_id
*/
SELECT
f.film_id,
f.title,
c.name AS category,
f.length AS length_of_movie,
ROUND(AVG(f.length) OVER(PARTITION BY c.name), 2) AS avg_length_in_category
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
ORDER BY film_id;


/*
Write a query that returns all payment details including 
the number of payments that were made by this customer and that amount
order the results by payment_id
*/
SELECT
*,
COUNT(*) OVER(PARTITION BY customer_id, amount) AS no_of_payments_with_that_amount
FROM payment
ORDER BY payment_id;


