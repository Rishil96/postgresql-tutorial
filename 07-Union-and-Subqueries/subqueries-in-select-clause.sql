-- SUBQUERY IN SELECT CLAUSE
SELECT 
*, (SELECT ROUND(AVG(amount), 2) FROM payment)
FROM payment;

/*
CHALLENGE 1
Show all the payments together with how much the payment is below the maximum payment amount
*/
SELECT 
*, (SELECT MAX(amount) FROM payment) - amount AS difference
FROM payment;