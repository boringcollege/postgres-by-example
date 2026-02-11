-- RETURNING: get the row(s) affected by INSERT/UPDATE/DELETE
DROP TABLE IF EXISTS logs_example;
CREATE TABLE logs_example (id serial PRIMARY KEY, msg text);

INSERT INTO logs_example (msg) VALUES ('first') RETURNING id, msg;

UPDATE logs_example SET msg = 'updated' WHERE id = 1 RETURNING id, msg;

DELETE FROM logs_example WHERE id = 1 RETURNING id, msg;
