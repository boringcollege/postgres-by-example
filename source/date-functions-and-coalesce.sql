-- Date/time functions
SELECT current_date AS today;
SELECT date_trunc('month', current_timestamp) AS month_start;
SELECT now() - interval '1 day' AS yesterday;
SELECT extract(year FROM current_date) AS year;

-- COALESCE: first non-NULL value
SELECT COALESCE(NULL, NULL, 'default') AS c1;
SELECT COALESCE(NULL, 42) AS c2;
