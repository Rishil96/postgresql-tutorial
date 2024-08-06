-- STORED PROCEDURES

CREATE PROCEDURE sp_transfer (tr_amount INT, sender INT, recipient INT)
	LANGUAGE plpgsql
AS
$$
	BEGIN
	-- subtract from sender's balance
	UPDATE acc_balance
	SET amount = amount - tr_amount
	WHERE id = sender;

	-- add to recipient's balance
	UPDATE acc_balance
	SET amount = amount + tr_amount
	WHERE id = recipient;
	COMMIT;
	END;
$$

CALL sp_transfer(500, 1, 2);

SELECT
*
FROM acc_balance;

SELECT
*
FROM employee;

-- CHALLENGE
CREATE PROCEDURE sp_emp_swap (emp1 INT, emp2 INT)
	LANGUAGE plpgsql
AS
$$
	DECLARE 
	position_container TEXT; salary_container NUMERIC(8, 2);

	BEGIN
		-- Save position title of emp1
		SELECT 
		position_title
		INTO position_container
		FROM employee
		WHERE emp_id = emp1;

		-- Save salary of emp1
		SELECT 
		salary
		INTO salary_container
		FROM employee
		WHERE emp_id = emp1;

		-- Add emp2 position title and salary to emp1
		UPDATE employee
		SET position_title = (SELECT position_title FROM employee WHERE emp_id = emp2),
			salary = (SELECT salary FROM employee WHERE emp_id = emp2)
		WHERE emp_id = emp1;
		
		-- Add emp1 position title and salary to emp2
		UPDATE employee
		SET position_title = position_container, salary = salary_container
		WHERE emp_id = emp2;
	COMMIT;
	END;
$$

CALL sp_emp_swap(2, 3);

SELECT * FROM employee;
