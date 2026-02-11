-- UUID: requires extension (often created by default in cloud)
-- If extension is not available, skip or: CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
SELECT gen_random_uuid() AS id;

-- JSONB: binary JSON, supports indexing and operators
SELECT '{"name": "Alice", "age": 30}'::jsonb AS j;
SELECT '{"name": "Alice", "age": 30}'::jsonb -> 'name' AS name;
SELECT '["a", "b"]'::jsonb -> 1 AS second;
