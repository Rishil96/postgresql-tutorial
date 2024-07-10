-- INNER JOIN
SELECT
first_name, last_name, customer.customer_id, payment_id, amount
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

SELECT
first_name, last_name, staff.staff_id, payment_id, amount
FROM payment
INNER JOIN staff
ON payment.staff_id = staff.staff_id
WHERE staff.staff_id = 1;

-- 