# Postgres by Example: Roles and GRANT

PostgreSQL uses roles for authentication and authorization. A role can be a login user or a group. You grant privileges (SELECT, INSERT, UPDATE, DELETE, etc.) on objects to roles; REVOKE removes them. The owner of an object has full rights; others need explicit GRANTs.

**What you'll learn:**
- That roles represent users and groups
- Granting SELECT (or other privileges) on a table
- REVOKE and checking privileges

```sql
-- Roles: users and groups (in PostgreSQL, roles can be both)
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
```

The script shows the current user and how to inspect table grants. Uncomment the GRANT/REVOKE lines if you have permission to create roles and grant on tables.

To run:

```bash
$ psql -f source/roles-and-grant.sql postgres
 current_user
--------------
 your_user
(1 row)

 grantee   | privilege_type
-----------+-----------------
 your_user | SELECT
 your_user | INSERT
 ...
```

**Tip:** Use principle of least privilege: grant only the privileges each role needs. Restrict schema (USAGE), then table (SELECT, etc.).

**Try it:** If you have two roles, grant SELECT on a table to one and connect as that role to verify.

Source: [roles-and-grant.sql](../source/roles-and-grant.sql)

Next: [psql Meta-commands](psql-meta-commands.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
