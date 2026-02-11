# Postgres by Example: WHERE

`WHERE` restricts which rows are returned. Only rows that satisfy the condition appear in the result. You use comparison operators (`=`, `<>`, `<`, `>`, `<=`, `>=`), `LIKE` for pattern matching, and combine conditions with `AND` and `OR`.

**What you'll learn:**
- Filtering rows with `WHERE`
- Equality and `LIKE` in conditions
- Using a system catalog as the source table

```sql
-- Filter rows with WHERE (using system catalog)
SELECT schemaname, tablename
FROM pg_tables
WHERE schemaname = 'pg_catalog'
ORDER BY tablename
LIMIT 3;

-- Compare: only tables whose name contains 'pg'
SELECT tablename
FROM pg_tables
WHERE tablename LIKE '%pg%'
LIMIT 3;
```

`pg_tables` is a system view listing tables. The first query keeps only rows where `schemaname` equals `'pg_catalog'`. The second uses `LIKE '%pg%'`: `%` matches any sequence of characters, so we get table names containing "pg".

To run:

```bash
$ psql -f source/where.sql postgres
 schemaname  | tablename
-------------+------------
 pg_catalog  | pg_aggregate
 pg_catalog  | pg_am
 pg_catalog  | pg_amop
(3 rows)

 tablename
-----------
 pg_aggregate
 pg_am
 ...
(3 rows)
```

**Tip:** Use `IS NULL` and `IS NOT NULL` to test for nulls; `= NULL` does not work.

**Try it:** Change the condition to `WHERE schemaname = 'public'` and run again. If you have no tables in `public` yet, you'll get zero rows.

Source: [where.sql](../source/where.sql)

Next: [ORDER BY](order-by.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
