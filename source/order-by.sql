-- Sort results with ORDER BY (using system catalog)
SELECT tablename
FROM pg_tables
WHERE schemaname = 'pg_catalog'
ORDER BY tablename
LIMIT 4;

-- Descending order
SELECT tablename
FROM pg_tables
WHERE schemaname = 'pg_catalog'
ORDER BY tablename DESC
LIMIT 4;
