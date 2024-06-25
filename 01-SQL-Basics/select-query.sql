-- SELECT STATEMENT

-- Select table query with all columns (*)
SELECT * FROM public.actor;

-- Select table one column
SELECT first_name FROM public.actor;

-- Select 2 or more columns
SELECT first_name, last_name FROM public.actor;

-- CHALLENGE 1
SELECT first_name, last_name, email from public.customer;