-- LEFT OUTER JOIN
SELECT a.aircraft_code, COUNT(*) FROM aircrafts_data a
LEFT OUTER JOIN flights f
ON a.aircraft_code = f.aircraft_code
GROUP BY a.aircraft_code;

-- CHALLENGE
/*
Find which seats have been chosen more frequently. Make sure all the seats are included
*/
SELECT
s.seat_no, COUNT(*) as "Count" 
FROM seats s
LEFT JOIN boarding_passes b
ON s.seat_no = b.seat_no
GROUP BY s.seat_no
ORDER BY "Count" DESC;

/*
Are there any seats that has never been booked
*/
SELECT
*
FROM boarding_passes b
LEFT JOIN seats s
ON s.seat_no = b.seat_no
WHERE b.seat_no IS NULL;


-- CHALLENGE
/*
Which line is the most favorable
A - H
*/
SELECT
RIGHT(s.seat_no, 1) AS seat_row, COUNT(*) as "Count"
FROM seats s
LEFT JOIN boarding_passes b
ON s.seat_no = b.seat_no
GROUP BY RIGHT(s.seat_no, 1)
ORDER BY "Count" DESC;