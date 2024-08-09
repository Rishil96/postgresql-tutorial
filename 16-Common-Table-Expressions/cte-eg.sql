-- COMMON TABLE EXRESSION

WITH subquery AS (
	SELECT 
	f.film_id, f.title, COUNT(r.rental_id) AS rental_count
	FROM film f
	JOIN inventory i
	ON f.film_id = i.film_id
	JOIN rental r
	ON i.inventory_id = r.inventory_id
	GROUP BY f.film_id, f.title
)

SELECT
film_id, title, rental_count
FROM subquery AS film_rentals
WHERE rental_count > 30;


-- GETTING MOVIES WITH RENTAL DURATION HIGHER THAN AVERAGE RENTAL DURATION
WITH rental_duration_cte AS (
	SELECT
	f.film_id, f.title, AVG(r.return_date - r.rental_date) AS rental_duration
	FROM film f
	JOIN inventory i
	ON f.film_id = i.film_id
	JOIN rental r
	ON i.inventory_id = r.inventory_id
	GROUP BY f.film_id, f.title
)


SELECT
film_id, title, rental_duration
FROM rental_duration_cte
WHERE rental_duration > (
	SELECT 
	AVG(rental_duration) 
	FROM rental_duration_cte
)



