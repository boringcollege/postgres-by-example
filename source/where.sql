-- Filter rows with WHERE (using system catalog)
SELECT schemaname, tablename
FROM pg_tables
WHERE schemaname = 'pg_catalog'
ORDER BY tablename
LIMIT 3;

-- Compare: only tables whose name contains 'pg'
SELECT tablename
FROM pg_tables
WHERE tablename LIKE '%pg%'
LIMIT 3;
