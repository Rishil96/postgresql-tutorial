-- CASE WHEN

SELECT
amount,
CASE
	WHEN amount < 2 THEN 'less amount'
	WHEN amount < 5 THEN 'mid amount'
	ELSE 'high amount'
END
FROM payment;