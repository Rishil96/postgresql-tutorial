-- GRANT 

-- create users
CREATE USER ria
WITH PASSWORD 'ria123';

CREATE USER mike
WITH PASSWORD 'mike123';


-- create roles
CREATE ROLE read_only;
CREATE ROLE read_update;


-- Grant usage (already granted for public schema)
GRANT USAGE
ON SCHEMA public
TO read_only;

-- Grant select on tables
GRANT SELECT
ON ALL TABLES IN SCHEMA PUBLIC
TO read_only;

-- Assign read_only to read_update role
GRANT read_only
TO read_update;

-- Grant all privileges on all tables in public to role
GRANT ALL
ON ALL TABLES IN SCHEMA public
TO read_update;

-- Revoke some privileges from read_update
REVOKE DELETE, INSERT
ON ALL TABLES IN SCHEMA public
FROM read_update;

-- Assign role to users
GRANT read_only
TO mike;

GRANT read_update 
TO ria;

-- Drop roles but first remove dependencies
DROP OWNED BY read_update;
DROP ROLE read_update; 



