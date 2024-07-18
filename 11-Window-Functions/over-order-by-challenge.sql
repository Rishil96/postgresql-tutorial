/*
CHALLENGE 1
Return total of how late the flights are 
(difference between actual_arrival and scheduled_arrival)
ordered by flight id including the departure airport

2 Also partition the first challenge by departure airport
*/
SELECT
flight_id, departure_airport, 
SUM(actual_arrival - scheduled_arrival) OVER(ORDER BY flight_id, departure_airport)
FROM flights;


SELECT
flight_id, departure_airport, 
SUM(actual_arrival - scheduled_arrival) OVER(PARTITION BY departure_airport ORDER BY flight_id, departure_airport)
FROM flights;