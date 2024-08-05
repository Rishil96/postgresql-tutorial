-- TRANSACTIONS

CREATE TABLE acc_balance (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
    amount DEC(9,2) NOT NULL    
);

INSERT INTO acc_balance
VALUES 
(1,'Tim','Brown',2500),
(2,'Sandra','Miller',1600);

SELECT * FROM acc_balance;

BEGIN;
UPDATE acc_balance
SET amount = amount - 100
WHERE id = 1;
UPDATE acc_balance
SET amount = amount + 100
WHERE id = 2;
COMMIT;


SELECT * FROM acc_balance;

-- CHALLENGE 1
SELECT
*
FROM employee;


BEGIN;
UPDATE employee
SET position_title = 'Head of Sales', salary = 12587.00
WHERE first_name = 'Miller' AND last_name = 'McQuarter';
UPDATE employee
SET position_title = 'Head of BI', salary = 14614.00
WHERE first_name = 'Christalle' AND last_name = 'McKenny';
COMMIT;
