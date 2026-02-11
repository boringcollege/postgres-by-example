-- Limit number of rows returned
SELECT * FROM fruits ORDER BY id LIMIT 2;

-- Skip rows with OFFSET, then take LIMIT
SELECT * FROM fruits ORDER BY id LIMIT 2 OFFSET 1;
