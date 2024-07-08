-- REPLACE
SELECT passenger_id, CAST(REPLACE(passenger_id, ' ', '') AS BIGINT) FROM tickets;