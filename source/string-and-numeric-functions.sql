-- String functions
SELECT upper('hello') AS u, lower('HELLO') AS l;
SELECT length('hello') AS len;
SELECT substring('hello' FROM 2 FOR 3) AS sub;
SELECT trim('  hi  ') AS t;

-- Numeric functions
SELECT abs(-5) AS a, round(3.14159, 2) AS r;
SELECT ceil(2.1) AS c, floor(2.9) AS f;
