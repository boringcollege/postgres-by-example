-- Boolean: true, false, or NULL
SELECT true AS ok, false AS no;
SELECT (1 = 1) AS same, (1 = 2) AS diff;

-- Date and timestamp
SELECT current_date AS today;
SELECT current_timestamp AS now;
SELECT '2024-01-15'::date AS d;
SELECT '2024-01-15 10:30:00'::timestamp AS ts;
