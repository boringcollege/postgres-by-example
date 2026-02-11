-- Literals and expressions (no table)
SELECT 1 AS one;
SELECT 2 + 3 AS sum;
SELECT 'hello' AS greeting;

-- From a system table (one row)
SELECT relname FROM pg_class WHERE relname = 'pg_database' LIMIT 1;
