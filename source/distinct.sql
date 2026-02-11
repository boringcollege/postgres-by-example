-- Get unique values in a column
SELECT DISTINCT name FROM fruits;

-- Distinct pairs (id, name) - here all rows are already unique
SELECT DISTINCT id, name FROM fruits ORDER BY id LIMIT 3;
