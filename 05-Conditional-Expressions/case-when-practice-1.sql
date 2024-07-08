-- CASE WHEN PRACTICE

SELECT COUNT(*) as flights_count,
CASE
	WHEN actual_departure IS NULL THEN 'No Departure Time'
	WHEN actual_departure - scheduled_departure < '00:05' THEN 'On Time'
	WHEN actual_departure - scheduled_departure < '01:00' THEN 'A little bit Late'
	ELSE 'Very Late'
END AS is_late
FROM flights
GROUP BY is_late;


-- CHALLENGE 1
/*
Find how many tickets are sold in following categories
- low price ticket: total_amount < 20000
- mid price ticket: total_amount 20000 and 150000
- high price ticket: total_amount > 150000
*/
SELECT 
CASE
	WHEN total_amount < 20000 THEN 'Low Price Ticket'
	WHEN total_amount >= 20000 AND total_amount < 150000 THEN 'Mid Price Ticket'
	ELSE 'High Price Ticket'
END AS price_category,
COUNT(*)
FROM bookings
GROUP BY price_category;

-- CHALLENGE 2
/*
Find out how many flights are departed in following seasons
- Winter : Dec, Jan, Feb
- Spring : Mar, Apr, May
- Summer : June, July, Aug
- Fall : Sept, Oct, Nov
*/
SELECT
CASE
	WHEN EXTRACT(Month from scheduled_departure) IN (12, 1, 2) THEN 'Winter'
	WHEN EXTRACT(Month from scheduled_departure) IN (3, 4, 5) THEN 'Spring'
	WHEN EXTRACT(Month from scheduled_departure) IN (6, 7, 8) THEN 'Summer'
	WHEN EXTRACT(Month from scheduled_departure) IN (9, 10, 11) THEN 'Fall'
	ELSE 'Invalid Month'
END AS season,
COUNT(*)
FROM flights
GROUP BY season;


