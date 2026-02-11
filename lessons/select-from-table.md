# Postgres by Example: SELECT from a Table

Once a table has rows, you read them with `SELECT`. Use `*` to get all columns or list the columns you want. The result is ordered only if you add `ORDER BY`.

**What you'll learn:**
- `SELECT * FROM table` to get all columns
- Selecting specific columns and controlling their order

```sql
-- Select all columns from the fruits table
SELECT * FROM fruits;

-- Select specific columns
SELECT name, id FROM fruits;
```

Run this after `create-table.sql` and `insert.sql`. `SELECT *` returns every column; listing columns returns only those, in the order you list them.

To run:

```bash
$ psql -f source/select-from-table.sql postgres
 id |    name
----+------------
  1 | apple
  2 | banana
  3 | cherry
  4 | date
  5 | elderberry
(5 rows)

    name    | id
------------+----
 apple      |  1
 banana     |  2
 ...
(5 rows)
```

**Tip:** Prefer listing columns in production (`SELECT id, name`) so schema changes (new columns) don't change your result shape unexpectedly.

**Try it:** Add `WHERE id > 2` to the first query and run again.

Source: [select-from-table.sql](../source/select-from-table.sql)

Next: [LIMIT and OFFSET](limit-offset.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
