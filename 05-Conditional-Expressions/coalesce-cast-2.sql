-- CHALLENGE 
SELECT rental_date, return_date, COALESCE(CAST(return_date AS VARCHAR), 'Not returned') FROM rental
ORDER BY rental_date DESC;
