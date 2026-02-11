-- A view is a saved SELECT (like a virtual table)
CREATE OR REPLACE VIEW fruits_summary AS
  SELECT id, name, length(name) AS name_len
  FROM fruits
  ORDER BY id;

-- Query the view like a table
SELECT * FROM fruits_summary LIMIT 3;

-- Drop the view
DROP VIEW IF EXISTS fruits_summary;
