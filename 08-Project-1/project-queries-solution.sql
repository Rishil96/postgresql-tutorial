-- 1.
SELECT DISTINCT replacement_cost 
FROM film
ORDER BY 1;


-- 2.
SELECT 
CASE 
	WHEN replacement_cost BETWEEN 9.99 AND 19.99
	THEN 'low'
	WHEN replacement_cost BETWEEN 20 AND 24.99
	THEN 'medium'
	ELSE 'high'
END AS cost_range,
COUNT(*)
FROM film
GROUP BY cost_range;


-- 3. 
SELECT 
title,
name,
length
FROM film f
LEFT JOIN film_category fc
ON f.film_id=fc.film_id
LEFT JOIN category c
ON c.category_id=fc.category_id
WHERE name = 'Sports' OR name = 'Drama'
ORDER BY length DESC;


-- 4.
SELECT
name,
COUNT(title)
FROM film f
INNER JOIN film_category fc
ON f.film_id=fc.film_id
INNER JOIN category c
ON c.category_id=fc.category_id
GROUP BY name
ORDER BY 2 DESC;


-- 5.
SELECT 
first_name,
last_name,
COUNT(*)
FROM actor a
LEFT JOIN film_actor fa
ON fa.actor_id=a.actor_id
LEFT JOIN film f
ON fa.film_id=f.film_id
GROUP BY first_name, last_name
ORDER BY COUNT(*) DESC;


-- 6.
SELECT * FROM address a
LEFT JOIN customer c
ON c.address_id = a.address_id
WHERE c.first_name is null;


-- 7.
SELECT 
city,
SUM(amount)
FROM payment p
LEFT JOIN customer c
ON p.customer_id=c.customer_id
LEFT JOIN address a
ON a.address_id=c.address_id
LEFT JOIN city ci
ON ci.city_id=a.city_id
GROUP BY city
ORDER BY city DESC;


-- 8.
SELECT 
country ||', ' ||city,
SUM(amount)
FROM payment p
LEFT JOIN customer c
ON p.customer_id=c.customer_id
LEFT JOIN address a
ON a.address_id=c.address_id
LEFT JOIN city ci
ON ci.city_id=a.city_id
LEFT JOIN country co
ON co.country_id=ci.country_id
GROUP BY country ||', ' ||city
ORDER BY 2 ASC;


-- 9.
SELECT 
staff_id,
ROUND(AVG(total),2) as avg_amount 
FROM (
SELECT SUM(amount) as total,customer_id,staff_id
FROM payment
GROUP BY customer_id, staff_id) a
GROUP BY staff_id;


-- 10.
SELECT 
AVG(total)
FROM 
	(SELECT
	 SUM(amount) as total,
	 DATE(payment_date),
	 EXTRACT(dow from payment_date) as weekday
	 FROM payment
	 WHERE EXTRACT(dow from payment_date)=0
	 GROUP BY DATE(payment_date),weekday) daily;


-- 11.
SELECT 
title,
length
FROM film f1
WHERE length > (SELECT AVG(length) FROM film f2
			   WHERE f1.replacement_cost=f2.replacement_cost)
ORDER BY length ASC;


-- 12.
SELECT
district,
ROUND(AVG(total),2) avg_customer_spent
FROM
(SELECT 
c.customer_id,
district,
SUM(amount) total
FROM payment p
INNER JOIN customer c
ON c.customer_id=p.customer_id
INNER JOIN address a
ON c.address_id=a.address_id
GROUP BY district, c.customer_id) sub
GROUP BY district
ORDER BY 2 DESC;


-- 13.
SELECT
title,
amount,
name,
payment_id,
(SELECT SUM(amount) FROM payment p
LEFT JOIN rental r
ON r.rental_id=p.rental_id
LEFT JOIN inventory i
ON i.inventory_id=r.inventory_id
LEFT JOIN film f
ON f.film_id=i.film_id
LEFT JOIN film_category fc
ON fc.film_id=f.film_id
LEFT JOIN category c1
ON c1.category_id=fc.category_id
WHERE c1.name=c.name)
FROM payment p
LEFT JOIN rental r
ON r.rental_id=p.rental_id
LEFT JOIN inventory i
ON i.inventory_id=r.inventory_id
LEFT JOIN film f
ON f.film_id=i.film_id
LEFT JOIN film_category fc
ON fc.film_id=f.film_id
LEFT JOIN category c
ON c.category_id=fc.category_id
ORDER BY name;


-- 14.
SELECT
title,
name,
SUM(amount) as total
FROM payment p
LEFT JOIN rental r
ON r.rental_id=p.rental_id
LEFT JOIN inventory i
ON i.inventory_id=r.inventory_id
LEFT JOIN film f
ON f.film_id=i.film_id
LEFT JOIN film_category fc
ON fc.film_id=f.film_id
LEFT JOIN category c
ON c.category_id=fc.category_id
GROUP BY name,title
HAVING SUM(amount) = (SELECT MAX(total)
			  		  FROM 
					 (SELECT
			          title, name,
			          SUM(amount) as total
			          FROM payment p
			          LEFT JOIN rental r
			          ON r.rental_id=p.rental_id
			          LEFT JOIN inventory i
			          ON i.inventory_id=r.inventory_id
					  LEFT JOIN film f
					  ON f.film_id=i.film_id
					  LEFT JOIN film_category fc
					  ON fc.film_id=f.film_id
					  LEFT JOIN category c1
					  ON c1.category_id=fc.category_id
					  GROUP BY name,title) sub
			   		  WHERE c.name=sub.name);
