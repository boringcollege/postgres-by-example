DROP TABLE IF EXISTS users_example;

-- PRIMARY KEY: unique and not null, one per table (can be composite)
CREATE TABLE users_example (
  id   integer PRIMARY KEY,
  name text UNIQUE NOT NULL
);

INSERT INTO users_example (id, name) VALUES (1, 'alice'), (2, 'bob');
-- Duplicate id or name would fail:
-- INSERT INTO users_example (id, name) VALUES (1, 'carol');
SELECT * FROM users_example;
