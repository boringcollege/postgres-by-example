-- Update rows matching WHERE
UPDATE fruits SET name = 'apricot' WHERE id = 1;

-- Update multiple columns
UPDATE fruits SET name = 'banana', id = id WHERE id = 2;

SELECT * FROM fruits ORDER BY id;
