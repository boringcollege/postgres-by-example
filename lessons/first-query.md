# Postgres by Example: First Query

Your first step is to run a query against PostgreSQL. You don't need any tables—you can evaluate simple expressions. This confirms that the server is running and that you can connect with `psql`.

**What you'll learn:**
- How to run a SQL file with `psql`
- Running a minimal `SELECT` with no table
- Checking PostgreSQL version

```sql
-- Simplest query: no tables, just a literal
SELECT 1;

-- Check your PostgreSQL version
SELECT version();
```

`SELECT 1` returns a single row with one column; the value is the integer 1. `SELECT version()` calls a built-in function and returns your server version string.

To run this file from the repository root:

```bash
$ psql -f source/first-query.sql postgres
 ?column?
----------
        1
(1 row)

                                                    version
------------------------------------------------------------------------------------------------------------------------------
 PostgreSQL 16.x on x86_64-pc-linux-gnu, compiled by gcc ...
(1 row)
```

Your version string will vary. If you see output like above, you're set up correctly.

**Tip:** If you omit the database name, `psql` uses your default (often your OS username). To use the `postgres` database explicitly: `psql -f source/first-query.sql postgres`.

**Try it:** Run `psql -f source/first-query.sql` and confirm you see one row for `SELECT 1` and one for `version()`.

Source: [first-query.sql](../source/first-query.sql)

Next: [psql Basics](psql-basics.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
