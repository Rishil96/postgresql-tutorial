-- COALESCE
SELECT scheduled_arrival, actual_arrival, COALESCE(actual_arrival, scheduled_arrival) AS arrival
FROM flights;

-- CAST
SELECT scheduled_arrival, CAST(scheduled_arrival AS VARCHAR) FROM flights;