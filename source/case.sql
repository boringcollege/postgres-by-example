-- CASE expression: conditional result
SELECT id, name,
  CASE
    WHEN id <= 2 THEN 'low'
    WHEN id <= 4 THEN 'mid'
    ELSE 'high'
  END AS tier
FROM fruits
ORDER BY id;

-- Simple CASE (equality)
SELECT name, CASE name
  WHEN 'apricot' THEN 'A'
  WHEN 'banana' THEN 'B'
  ELSE '?'
END AS code
FROM fruits
ORDER BY id
LIMIT 3;
