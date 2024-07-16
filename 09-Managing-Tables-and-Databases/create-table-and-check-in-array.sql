-- Check from array column if a value exists
SELECT * FROM film
WHERE 'Behind the Scenes' = ANY(special_features);

-- Create table
CREATE TABLE director (
	director_id SERIAL PRIMARY KEY, 
	director_account_name VARCHAR(20) UNIQUE,
	first_name VARCHAR(50),
	last_name VARCHAR(50) DEFAULT 'Not specified',
	date_of_birth DATE,
	address_id INT REFERENCES address(address_id)
)


-- CHALLENGE 1
CREATE TABLE online_sales (
	transaction_id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES customer(customer_id),
	film_id INT REFERENCES film(film_id),
	amount NUMERIC(5, 2) NOT NULL,
	promotion_code VARCHAR(10) DEFAULT 'None'
)

