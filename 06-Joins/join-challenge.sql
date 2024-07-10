-- JOIN CHALLENGE
/*
What are the customers (first_name, last_name, phone_no, district) from Texas
*/
SELECT 
first_name, last_name, phone, district 
FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
WHERE a.district = 'Texas'; 

/*
Are there any old addresses that are not related to any customers
*/
SELECT * FROM address a
LEFT JOIN customer c
ON c.address_id = a.address_id
WHERE c.address_id IS NULL;
