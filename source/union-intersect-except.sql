-- Set operations: same number and compatible types of columns
SELECT 1 AS n UNION SELECT 2 UNION SELECT 1;
-- UNION removes duplicates; UNION ALL keeps them
SELECT 1 AS n UNION ALL SELECT 1;

SELECT id FROM fruits WHERE id <= 2
INTERSECT
SELECT id FROM fruits WHERE id >= 2;

SELECT id FROM fruits WHERE id <= 2
EXCEPT
SELECT id FROM fruits WHERE id >= 2;
