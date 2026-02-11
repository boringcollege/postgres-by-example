-- EXPLAIN shows the query plan (no index vs index)
-- Small table: planner may choose sequential scan anyway
EXPLAIN (FORMAT TEXT) SELECT * FROM fruits WHERE name = 'banana';

-- Drop the index to see plan without it (then recreate if you want)
-- DROP INDEX IF EXISTS fruits_name_idx;
-- EXPLAIN SELECT * FROM fruits WHERE name = 'banana';
-- CREATE INDEX fruits_name_idx ON fruits (name);
