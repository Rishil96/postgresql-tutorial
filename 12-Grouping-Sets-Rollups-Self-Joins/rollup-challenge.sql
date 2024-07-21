-- CHALLENGE 1
-- Calculate a booking amount rollup for the heirarchy of quarter, month, week in month and day
SELECT
'Q' || TO_CHAR(book_date, 'Q') AS quarter,
EXTRACT(Month from book_date) AS month,
TO_CHAR(book_date, 'W') AS week,
DATE(book_date) AS current_date,
SUM(total_amount) AS total_booking_amount
FROM 
bookings
GROUP BY
ROLLUP (
	'Q' || TO_CHAR(book_date, 'Q'),
	EXTRACT(Month from book_date),
	TO_CHAR(book_date, 'W'),
	DATE(book_date)
)
ORDER BY 1, 2, 3, 4