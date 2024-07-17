-- MATERIALIZED VIEW
CREATE VIEW v_customer_info
AS
SELECT cu.customer_id,
    cu.first_name || ' ' || cu.last_name AS name,
    a.address,
    a.postal_code,
    a.phone,
    city.city,
    country.country
     FROM customer cu
     JOIN address a ON cu.address_id = a.address_id
     JOIN city ON a.city_id = city.city_id
     JOIN country ON city.country_id = country.country_id
ORDER BY customer_id;

/*
CHALLENGE 1
1) Rename the view to v_customer_information.
2) Rename the customer_id column to c_id.
3) Add also the initial column as the last column to the view by replacing the view.
*/
ALTER VIEW v_customer_info
RENAME TO v_customer_information;

ALTER VIEW v_customer_information
RENAME COLUMN customer_id TO c_id;

CREATE OR REPLACE VIEW v_customer_information
AS
SELECT 
    cu.customer_id as c_id,
    cu.first_name || ' ' || cu.last_name AS name,
    a.address,
    a.postal_code,
    a.phone,
    city.city,
    country.country,
    CONCAT(LEFT(cu.first_name,1),LEFT(cu.last_name,1)) as initials
FROM customer cu
JOIN address a ON cu.address_id = a.address_id
JOIN city ON a.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
ORDER BY c_id;