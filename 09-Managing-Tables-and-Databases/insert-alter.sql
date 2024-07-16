-- INSERT
INSERT INTO online_sales (customer_id, film_id, amount, promotion_code)
VALUES
	(124, 65, 14.99, 'PROMO2022'),
	(225, 231, 12.99, 'JULYPROMO'),
	(119, 53, 15.99, 'SUMMERDEAL');


-- ALTER TABLE
ALTER TABLE staff
DROP COLUMN IF EXISTS first_name;


-- CHALLENGE 2
SELECT * FROM director

-- 1. director_account_name to VARCHAR(30)
-- 2. drop the default on last_name
-- 3. add the constraint not null to last_name
-- 4. add the column email of data type VARCHAR(40)
ALTER TABLE director
ALTER COLUMN director_account_name TYPE VARCHAR(30),
ALTER COLUMN last_name DROP DEFAULT,
ALTER COLUMN last_name DROP NOT NULL,
ADD COLUMN email VARCHAR(40);

-- 5. rename the director_account_name to account_name
ALTER TABLE director
RENAME COLUMN director_account_name TO account_name;

-- 6. rename the table from director to directors
ALTER TABLE director
RENAME TO directors;