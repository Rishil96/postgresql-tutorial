-- CHALLENGE 3
/*
Create a tier list
1. Rating is PG or PG-13 or length is more than 210min: Great rating or long (tier 1)
2. Description contains 'Drama' and length is more than 90min: Long drama (tier 2)
3. Description contains 'Drama' and length is not more than 90min: Short drama (tier 3)
4. Rental rate less than $1: Very cheap (tier 4)

- Also filter out movies that only appear in one of above 4 tiers
*/
SELECT
title,
CASE
	WHEN rating IN ('PG', 'PG-13') OR length > 210 THEN 'Great rating or very long (tier 1)'
	WHEN description LIKE '%Drama%' AND length > 90 THEN 'Long drama (tier 2)'
	WHEN description LIKE '%Drama%' AND length <= 90 THEN 'Short drama (tier 3)'
	WHEN rental_rate < 1 THEN 'Very cheap (tier 4)'
	ELSE '(tier 5)'
END AS tiers
FROM film
WHERE CASE
	WHEN rating IN ('PG', 'PG-13') OR length > 210 THEN 'Great rating or long (tier 1)'
	WHEN description LIKE '%Drama%' AND length > 90 THEN 'Long drama (tier 2)'
	WHEN description LIKE '%Drama%' AND length <= 90 THEN 'Short drama (tier 3)'
	WHEN rental_rate < 1 THEN 'Very cheap (tier 4)'
	ELSE '(tier 5)'
END != '(tier 5)'
