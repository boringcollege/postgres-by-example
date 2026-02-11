-- Aggregate functions over a table
SELECT COUNT(*) AS total_rows FROM fruits;
SELECT COUNT(name) AS non_null_names FROM fruits;
SELECT SUM(id) AS sum_id, AVG(id) AS avg_id FROM fruits;

-- MIN, MAX
SELECT MIN(name) AS min_name, MAX(name) AS max_name FROM fruits;
