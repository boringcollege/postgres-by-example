DROP TABLE IF EXISTS tasks_example;

CREATE TABLE tasks_example (
  id        integer PRIMARY KEY,
  title     text NOT NULL,
  done      boolean NOT NULL DEFAULT false
);

INSERT INTO tasks_example (id, title) VALUES (1, 'Learn SQL');
INSERT INTO tasks_example (id, title, done) VALUES (2, 'Done task', true);
SELECT * FROM tasks_example;
