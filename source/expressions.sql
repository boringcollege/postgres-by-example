-- Expressions in SELECT: arithmetic, concatenation
SELECT 10 + 2 AS sum, 10 * 2 AS product;
SELECT 'Hello ' || 'world' AS greeting;

-- Expression in WHERE
SELECT * FROM fruits WHERE id * 2 > 4 ORDER BY id;
