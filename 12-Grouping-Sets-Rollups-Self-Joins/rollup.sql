-- ROLLUP
SELECT
'Q' || TO_CHAR(payment_date, 'Q') AS quarter,
EXTRACT(Month from payment_date) AS month,
DATE(payment_date),
SUM(amount)
FROM payment
GROUP BY
ROLLUP (
	'Q' || TO_CHAR(payment_date, 'Q'),
	EXTRACT(Month from payment_date),
	DATE(payment_date)
)
ORDER BY 1, 2, 3