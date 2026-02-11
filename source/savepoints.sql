-- Savepoints: partial rollback within a transaction
BEGIN;
DROP TABLE IF EXISTS sp_demo;
CREATE TABLE sp_demo (id integer PRIMARY KEY);
INSERT INTO sp_demo VALUES (1);
SAVEPOINT one;
INSERT INTO sp_demo VALUES (2);
ROLLBACK TO SAVEPOINT one;  -- undo only the second insert
SELECT * FROM sp_demo;
COMMIT;

-- Cleanup
DROP TABLE IF EXISTS sp_demo;
