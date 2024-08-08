-- INDEXES

-- This query takes a lot of time to run, create an index to reduce the time
SELECT
* 
FROM flights f2
WHERE flight_no < (
		SELECT MAX(flight_no)
	    FROM flights f1
	    WHERE f1.departure_airport=f2.departure_airport
	   )

-- CREATE INDEX
CREATE INDEX index_departure_airport_flight
ON flights
(
	flight_no,
	departure_airport
);

-- DROP INDEX
DROP INDEX index_departure_airport_flight;