-- INNER JOIN
-- CHALLENGE 1
/*
The airline company wants to know which category they sell the most tickets
- business
- economy
- comfort

tables : flights, seats, boarding_passes
*/
SELECT * FROM flights;
SELECT * FROM seats;
SELECT * FROM boarding_passes;

SELECT
s.fare_conditions AS "Fare Conditions",
COUNt(*)
FROM boarding_passes AS bp
INNER JOIN flights AS f
ON f.flight_id = bp.flight_id
INNER JOIN seats AS s
ON s.seat_no = bp.seat_no
GROUP BY "Fare Conditions";


SELECT
    s.fare_conditions AS "Fare Conditions",
    COUNT(*) AS "Count"
FROM
    boarding_passes bp
INNER JOIN
    flights f ON bp.flight_id = f.flight_id
INNER JOIN
    seats s ON f.aircraft_code = s.aircraft_code AND bp.seat_no = s.seat_no
GROUP BY
    s.fare_conditions
ORDER BY 2 DESC;