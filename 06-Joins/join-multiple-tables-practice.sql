-- CHALLENGE
/*
Which customers are from Brazil?
Get first_name, last_name, email and country for all customers from Brazil
*/
SELECT * FROM customer;
SELECT * FROM address;
SELECT * FROM city;
SELECT * FROM country;


SELECT 
c.first_name, c.last_name, c.email, ci.city, co.country 
FROM customer c
LEFT JOIN address a
ON c.address_id = a.address_id
LEFT JOIN city ci
ON a.city_id = ci.city_id
LEFT JOIN country co
ON ci.country_id = co.country_id
WHERE country = 'Brazil';

/*
CHALLENGE 3:
What is the title of the movie that customer George Linton has rented the most times?
*/
SELECT
c.first_name, c.last_name, f.title, COUNT(*) as "Count"
FROM customer c
LEFT JOIN rental r
ON c.customer_id = r.customer_id
LEFT JOIN inventory i
ON r.inventory_id = i.inventory_id
LEFT JOIN film f
ON i.film_id = f.film_id
WHERE first_name = 'GEORGE' AND last_name = 'LINTON'
GROUP BY c.first_name, c.last_name, f.title
ORDER BY "Count" DESC
LIMIT 1;

