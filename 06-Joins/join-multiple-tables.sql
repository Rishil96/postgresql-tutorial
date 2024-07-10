-- JOIN MULTIPLE TABLES
SELECT * FROM tickets;
SELECT * FROM flights;

-- Get scheduled departure of every passenger
SELECT passenger_name, scheduled_departure FROM tickets t
INNER JOIN ticket_flights tf
ON t.ticket_no = tf.ticket_no
INNER JOIN flights f
ON tf.flight_id = f.flight_id;
