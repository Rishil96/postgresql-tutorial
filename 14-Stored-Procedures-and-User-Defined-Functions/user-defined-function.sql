-- USER DEFINED FUNCTION

CREATE FUNCTION count_rr (min_r DECIMAL(4, 2), max_r DECIMAL(4, 2))
RETURNS INT
LANGUAGE plpgsql
AS
$$
	DECLARE
	movie_count INT;

	BEGIN
		SELECT 
		COUNT(*)
		INTO movie_count
		FROM film
		WHERE rental_rate BETWEEN min_r AND max_r;
		RETURN movie_count;
	END;
$$


-- CALL FUNCTION
SELECT count_rr(3, 6);



-- CHALLENGE
CREATE OR REPLACE FUNCTION name_search(f_name TEXT, l_name TEXT)
RETURNS DECIMAL(6, 2)
LANGUAGE plpgsql
AS
$$
	DECLARE
	total_amount DECIMAL(6, 2);
	BEGIN
		SELECT 
		SUM(amount)
		INTO total_amount
		FROM customer c
		LEFT JOIN payment p
		ON c.customer_id = p.customer_id
		WHERE c.first_name = f_name AND c.last_name = l_name;
		RETURN total_amount;
	END;
$$

-- DROP function
DROP FUNCTION name_search(first_name TEXT, last_name TEXT);


-- RUN FUNCTION
SELECT name_search('AMY', 'LOPEZ');

