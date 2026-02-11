# Postgres by Example: CREATE TABLE

Tables hold your data. `CREATE TABLE` defines a new table with a name and a list of columns (name and type). You can add constraints and defaults; this lesson sticks to the basics.

**What you'll learn:**
- Defining a table with `CREATE TABLE`
- Column names and types (`integer`, `text`)
- Using `DROP TABLE IF EXISTS` before create for a clean rerun

```sql
-- Create a simple table for the next lessons
DROP TABLE IF EXISTS fruits;

CREATE TABLE fruits (
  id   integer,
  name text
);

-- Confirm it exists
SELECT tablename FROM pg_tables WHERE schemaname = 'public' AND tablename = 'fruits';
```

`fruits` has two columns: `id` (integer) and `name` (text). `DROP TABLE IF EXISTS` removes the table if it was left over from a previous run, so the script is idempotent.

To run:

```bash
$ psql -f source/create-table.sql postgres
DROP TABLE
CREATE TABLE
 tablename
-----------
 fruits
(1 row)
```

**Tip:** Use meaningful, consistent names. Common types include `integer`, `bigint`, `text`, `varchar(n)`, `boolean`, `date`, `timestamp with time zone`, and `numeric(p,s)`.

**Try it:** Add a third column, e.g. `price numeric(5,2)`, and run the script again (keep the `DROP TABLE IF EXISTS` so it recreates).

Source: [create-table.sql](../source/create-table.sql)

Next: [INSERT](insert.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
