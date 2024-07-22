-- SELF JOIN
SELECT
f1.title, f2.title, f1.length
FROM film f1
INNER JOIN film f2
ON f1.length = f2.length
WHERE f1.title <> f2.title
ORDER BY 3 DESC;


-- CROSS JOIN
SELECT
staff.staff_id,
store.store_id,
staff.first_name,
staff.last_name
FROM staff
CROSS JOIN store;


-- NATURAL JOIN
SELECT
first_name, last_name, SUM(amount) AS total_paid
FROM payment
NATURAL INNER JOIN customer
GROUP BY first_name, last_name;

