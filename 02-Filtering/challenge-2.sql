-- DAY 2 CHALLENGES

-- 1. Movies containing Saga in description and either starts with A or ends with R. Use alias no_of_movies
SELECT COUNT(*) AS no_of_movies FROM film
WHERE description LIKE '%Saga%'
AND (title LIKE 'A%' OR title LIKE '%R');

-- 2. List of customers where first name contains ER and has A as second letter. Order result by last name descending
SELECT * FROM customer
WHERE first_name LIKE '_A%' AND first_name LIKE '%ER%'
ORDER BY last_name DESC;

-- 3. Payments occurred on 2020-05-01 and where the amount is either 0 or between 3.99 and 7.99
SELECT COUNT(*) FROM payment
WHERE (amount = 0 OR amount BETWEEN 3.99 AND 7.99)
AND payment_date BETWEEN '2020-05-01' AND '2020-05-02';