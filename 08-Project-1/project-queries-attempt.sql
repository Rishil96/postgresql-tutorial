/*
PROJECT 1 
*/


/*
1. 
	Task: Create a list of all the different (distinct) replacement costs of the films.
	Question: What's the lowest replacement cost?
	Answer: 9.99
*/
SELECT
DISTINCT replacement_cost
FROM film
ORDER BY replacement_cost ASC;


/*
2. 
	Task: Write a query that gives an overview of how many films have replacements costs in the following cost ranges
	low: 9.99 - 19.99
	medium: 20.00 - 24.99
	high: 25.00 - 29.99
	Question: How many films have a replacement cost in the "low" group?
	Answer: 514
*/
SELECT
CASE
	WHEN replacement_cost >= 9.99 AND replacement_cost <= 19.99 THEN 'low'
	WHEN replacement_cost <= 24.99 THEN 'medium'
	WHEN replacement_cost <= 29.99 THEN 'high'
	ELSE 'not categorized'
END AS replacement_cost_category,
	COUNT(*)
FROM 
film
GROUP BY CASE
	WHEN replacement_cost >= 9.99 AND replacement_cost <= 19.99 THEN 'low'
	WHEN replacement_cost <= 24.99 THEN 'medium'
	WHEN replacement_cost <= 29.99 THEN 'high'
	ELSE 'not categorized'
END;



/*
3.
Task: Create a list of the film titles including their title, length, and category name 
ordered descendingly by length. Filter the results to only the movies in the 
category 'Drama' or 'Sports'.
Question: In which category is the longest film and how long is it?
Answer: Sports and 184
*/
SELECT
f.film_id, f.title, f.length, c.category_id, c.name
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
WHERE c.name IN ('Drama', 'Sports')
ORDER BY f.length DESC
LIMIT 1;


/*
4.
Task: Create an overview of how many movies (titles) there are in each category (name).
Question: Which category (name) is the most common among the films?
Answer: Sports with 74 titles
*/
SELECT
COUNT(f.title) AS "Count", c.name
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY "Count" DESC
LIMIT 1;


/*
5.
Task: Create an overview of the actors' first and last names and in how many movies 
they appear in.
Question: Which actor is part of most movies??
Answer: Susan Davis with 54 movies
*/
SELECT 
a.first_name, a.last_name, COUNT(f.title)
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id
LEFT JOIN film f
ON fa.film_id = f.film_id
GROUP BY a.first_name, a.last_name
ORDER BY count DESC
LIMIT 1;


/*
6.
Task: Create an overview of the addresses that are not associated to any customer.
Question: How many addresses are that?
Answer: 4
*/
SELECT
COUNT(*)
FROM address a
LEFT JOIN customer c
ON a.address_id = c.address_id
WHERE c.first_name IS NULL;



/*
7.
Task: Create the overview of the sales  to determine the from which city 
(we are interested in the city in which the customer lives, not where the store is) 
most sales occur.
Question: What city is that and how much is the amount?
Answer: Cape Coral with a total amount of 221.55
*/
SELECT
ci.city, SUM(p.amount) as amt
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ci
ON a.city_id = ci.city_id
GROUP BY ci.city
ORDER BY amt DESC
LIMIT 1;


/*
8.
Task: Create an overview of the revenue (sum of amount) grouped by a 
column in the format "country, city".
Question: Which country, city has the least sales?
Answer: United States, Tallahassee with a total amount of 50.85.
*/
SELECT
co.country || ', ' || ci.city AS place, SUM(p.amount) as amount
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ci
ON a.city_id = ci.city_id
INNER JOIN country co
ON ci.country_id = co.country_id
GROUP BY place
ORDER BY amount;


/*
9.
Task: Create a list with the average of the sales amount each staff_id has per customer.
Question: Which staff_id makes on average more revenue per customer?
Answer: staff_id 2 with an average revenue of 56.64 per customer.
*/
SELECT 
staff_id, ROUND(AVG(sum), 2) AS avg_revenue
FROM
	(
		SELECT
		customer_id, staff_id, SUM(amount)
		FROM 
		payment
		GROUP BY customer_id, staff_id
		ORDER BY customer_id, staff_id
	)
GROUP BY staff_id
ORDER BY avg_revenue DESC
LIMIT 1;


/*
10.
Task: Create a query that shows average daily revenue of all Sundays.
Question: What is the daily average revenue of all Sundays?
Answer: 1410.65
*/
SELECT 
AVG(daily_revenue) AS average_daily_revenue
FROM
	(
		SELECT
		DATE(payment_date), SUM(amount) AS daily_revenue
		FROM payment
		GROUP BY DATE(payment_date)
		HAVING EXTRACT(DOW from DATE(payment_date)) = 0
	)


/*
11.
Task: Create a list of movies - with their length and their replacement cost - that are longer than the average length in each replacement cost group.
Question: Which two movies are the shortest on that list and how long are they?
Answer: CELEBRITY HORN and SEATTLE EXPECTATIONS with 110 minutes.
*/
SELECT
title, length, replacement_cost
FROM film f1
WHERE length > (
	SELECT 
	AVG(length) 
	FROM film f2 
	WHERE f1.replacement_cost = f2.replacement_cost
	)
ORDER BY length ASC, replacement_cost ASC
LIMIT 2;


/*
12.
Task: Create a list that shows the "average customer lifetime value" grouped by the different districts.
Example:
If there are two customers in "District 1" where one customer has a total (lifetime) spent of $1000 and the second customer 
has a total spent of $2000 then the "average customer lifetime spent" in this district is $1500.
So, first, you need to calculate the total per customer and then the average of these totals per district.
Question: Which district has the highest average customer lifetime value?
Answer: Saint-Denis with an average customer lifetime value of 216.54.
*/
SELECT
a.district, ROUND(AVG(total_expense), 2) AS avg_customer_lifetime_spent
FROM (
	SELECT 
	customer_id, SUM(amount) AS total_expense
	FROM
	payment
	GROUP BY customer_id
) AS t1
LEFT JOIN customer c
ON t1.customer_id = c.customer_id
LEFT JOIN address a
ON c.address_id = a.address_id
GROUP BY a.district
ORDER BY avg_customer_lifetime_spent DESC
LIMIT 1;


/*
13.
Task: Create a list that shows all payments including the payment_id, amount, and the film category (name) plus the total amount 
that was made in this category. Order the results ascendingly by the category (name) and as second order criterion by the 
payment_id ascendingly.
Question: What is the total revenue of the category 'Action' and what is the lowest payment_id in that category 'Action'?
Answer: Total revenue in the category 'Action' is 4375.85 and the lowest payment_id in that category is 16055.
*/
SELECT
payment_id, amount, title, name, 
	(
	SELECT SUM(amount)
	FROM payment p
	INNER JOIN rental r
	ON p.rental_id = r.rental_id
	INNER JOIN inventory i
	ON r.inventory_id = i.inventory_id
	INNER JOIN film f
	ON i.film_id = f.film_id
	INNER JOIN film_category fc
	ON f.film_id = fc.film_id
	INNER JOIN category c2
	ON fc.category_id = c.category_id
	WHERE c.name = c2.name
	)
FROM payment p
INNER JOIN rental r
ON p.rental_id = r.rental_id
INNER JOIN inventory i
ON r.inventory_id = i.inventory_id
INNER JOIN film f
ON i.film_id = f.film_id
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
ORDER BY name, payment_id




/*
14.
Topic: Correlated and uncorrelated subqueries (nested)
Task: Create a list with the top overall revenue of a film title (sum of amount per title) for each category (name).
Question: Which is the top-performing film in the animation category?
Answer: DOGMA FAMILY with 178.70.
*/

SELECT
title AS film_title, name AS category_name, SUM(amount) AS total_revenue
FROM payment p
INNER JOIN rental r
ON p.rental_id = r.rental_id
INNER JOIN inventory i
ON r.inventory_id = i.inventory_id
INNER JOIN film f
ON i.film_id = f.film_id
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
GROUP BY title, name