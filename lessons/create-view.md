# Postgres by Example: CREATE VIEW

A view is a named query; you use it in SELECT like a table but it doesn't store data—each query against the view runs the underlying SELECT. Use views to simplify complex queries, restrict columns/rows, or present a consistent interface.

**What you'll learn:**
- Creating a view with CREATE VIEW
- Querying a view like a table
- Replacing and dropping views

```sql
-- A view is a saved SELECT (like a virtual table)
CREATE OR REPLACE VIEW fruits_summary AS
  SELECT id, name, length(name) AS name_len
  FROM fruits
  ORDER BY id;

-- Query the view like a table
SELECT * FROM fruits_summary LIMIT 3;

-- Drop the view
DROP VIEW IF EXISTS fruits_summary;
```

CREATE OR REPLACE updates the view definition if it already exists. ORDER BY in the view definition is not guaranteed to apply when you SELECT from the view (in standard SQL); for guaranteed order, add ORDER BY when querying the view.

To run (requires `fruits`):

```bash
$ psql -f source/create-view.sql postgres
CREATE VIEW
 id |  name   | name_len
----+---------+----------
  1 | apricot |       7
  2 | banana  |       6
  3 | cherry  |       6
(3 rows)
DROP VIEW
```

**Tip:** Use materialized views (CREATE MATERIALIZED VIEW) when you want to store the result and refresh it periodically.

**Try it:** Create a view that joins fruits with another table (or a filter) and SELECT from it.

Source: [create-view.sql](../source/create-view.sql)

Next: [Roles and GRANT](roles-and-grant.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
