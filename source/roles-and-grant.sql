-- Roles: users and groups (in PostgreSQL, roles can be both)
-- List current user
SELECT current_user;

-- Create a role (may need superuser; skip if you can't)
-- CREATE ROLE read_only LOGIN PASSWORD 'xxx';

-- Grant usage on schema and SELECT on a table (example; adjust role/table)
-- GRANT USAGE ON SCHEMA public TO read_only;
-- GRANT SELECT ON fruits TO read_only;

-- Revoke (example)
-- REVOKE SELECT ON fruits FROM read_only;

-- Show your own privileges (example table)
SELECT grantee, privilege_type
FROM information_schema.role_table_grants
WHERE table_name = 'fruits' AND grantee = current_user;
