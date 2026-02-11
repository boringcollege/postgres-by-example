-- Delete rows matching WHERE (use a temp table so we don't lose fruits)
DROP TABLE IF EXISTS to_delete;
CREATE TABLE to_delete AS SELECT * FROM fruits LIMIT 1;

DELETE FROM to_delete WHERE id = 1;
SELECT * FROM to_delete;

DROP TABLE to_delete;
