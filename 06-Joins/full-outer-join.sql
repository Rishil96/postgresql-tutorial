-- FULL OUTER JOIN
SELECT * FROM boarding_passes b
FULL OUTER JOIN tickets t
ON b.ticket_no = t.ticket_no


-- CHALLENGE
SELECT COUNT(*) FROM boarding_passes b
FULL OUTER JOIN tickets t
ON b.ticket_no = t.ticket_no
WHERE boarding_no IS NULL;