-- Create a simple table for the next lessons
DROP TABLE IF EXISTS fruits;

CREATE TABLE fruits (
  id   integer,
  name text
);

-- Confirm it exists
SELECT tablename FROM pg_tables WHERE schemaname = 'public' AND tablename = 'fruits';
