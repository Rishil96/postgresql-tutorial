-- JOIN ON MULTIPLE CONDITIONS
SELECT * FROM ticket_flights;
SELECT * FROM boarding_passes;
SELECT * FROM tickets;

/*
CHALLENGE
Get the average price amount for different seat no
*/
SELECT 
b.seat_no, ROUND(AVG(t.amount), 2) AS avg_amount
FROM ticket_flights t
INNER JOIN boarding_passes b
ON t.ticket_no = b.ticket_no 
AND t.flight_id = b.flight_id
GROUP BY b.seat_no
ORDER BY avg_amount DESC;