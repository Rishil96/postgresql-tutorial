/*
CHALLENGE 1:
Which passenger has spent the most amount in their bookings?
*/
SELECT
t.passenger_name, SUM(b.total_amount) AS total_amount
FROM tickets t
LEFT JOIN bookings b
ON t.book_ref = b.book_ref
GROUP BY t.passenger_name
ORDER BY total_amount DESC
LIMIT 1;


/*
CHALLENGE 2:
Which fare condition has ALEKSANDR IVANOV has used the most?
*/
SELECT
t.passenger_name, tf.fare_conditions, COUNT(*)
FROM tickets t
INNER JOIN bookings b
ON t.book_ref = b.book_ref
INNER JOIN ticket_flights tf
ON t.ticket_no = tf.ticket_no
WHERE t.passenger_name = 'ALEKSANDR IVANOV'
GROUP BY t.passenger_name, tf.fare_conditions;

