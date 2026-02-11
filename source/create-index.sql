-- Create an index on a column (speeds up WHERE, ORDER BY, JOINs on that column)
CREATE INDEX IF NOT EXISTS fruits_name_idx ON fruits (name);

-- List indexes on a table (system catalog)
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'fruits';
