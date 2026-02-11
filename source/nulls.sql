-- NULL: missing or unknown value
SELECT 1 AS a, NULL AS b;

-- Check for NULL (use IS NULL / IS NOT NULL, not = NULL)
SELECT * FROM (SELECT 1 AS id, NULL AS name) t WHERE name IS NULL;
SELECT * FROM (SELECT 1 AS id, 'x' AS name) t WHERE name IS NOT NULL;
