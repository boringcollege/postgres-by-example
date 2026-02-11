# Postgres by Example: SELECT Basics

`SELECT` is how you read data. You can select literal values and expressions without any table, or you can select from a table (or system catalog). Results come back as rows and columns.

**What you'll learn:**
- `SELECT` with literals and expressions
- Using `AS` to name columns
- Selecting from a table with `FROM` (here, a system catalog)

```sql
-- Literals and expressions (no table)
SELECT 1 AS one;
SELECT 2 + 3 AS sum;
SELECT 'hello' AS greeting;

-- From a system table (one row)
SELECT relname FROM pg_class WHERE relname = 'pg_database' LIMIT 1;
```

Each statement returns a result set. `AS one` gives the column a name. The last query reads from the system catalog `pg_class`, which holds metadata about relations (tables, indexes, etc.); we filter and take one row so the example is predictable.

To run:

```bash
$ psql -f source/select-basics.sql postgres
 one
-----
   1
(1 row)

 sum
-----
   5
(1 row)

 greeting
----------
 hello
(1 row)

 relname
---------
 pg_database
(1 row)
```

**Tip:** You can combine columns: `SELECT 1 AS a, 2 AS b, 'x' AS c;` returns one row with three columns.

**Try it:** Change the expression to `10 * 2` and run again. Then try `SELECT relname FROM pg_class LIMIT 3;` to see a few relation names.

Source: [select-basics.sql](../source/select-basics.sql)

Next: [WHERE](where.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
