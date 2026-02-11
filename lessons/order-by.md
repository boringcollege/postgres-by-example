# Postgres by Example: ORDER BY

`ORDER BY` sorts the result set by one or more columns. Default order is ascending (`ASC`); use `DESC` for descending. Without `ORDER BY`, row order is not guaranteed.

**What you'll learn:**
- Sorting with `ORDER BY column`
- `ASC` (default) and `DESC`
- Combining with `WHERE` and `LIMIT`

```sql
-- Sort results with ORDER BY (using system catalog)
SELECT tablename
FROM pg_tables
WHERE schemaname = 'pg_catalog'
ORDER BY tablename
LIMIT 4;

-- Descending order
SELECT tablename
FROM pg_tables
WHERE schemaname = 'pg_catalog'
ORDER BY tablename DESC
LIMIT 4;
```

The first query returns the first four catalog table names in alphabetical order; the second returns the last four (by name) because we sort descending.

To run:

```bash
$ psql -f source/order-by.sql postgres
 tablename
------------
 pg_aggregate
 pg_am
 pg_amop
 pg_amproc
(4 rows)

   tablename
---------------
 pg_trigger
 pg_ts_config
 pg_type
 pg_user_mapping
(4 rows)
```

**Tip:** You can order by multiple columns: `ORDER BY a, b DESC` sorts by `a` ascending, then by `b` descending where `a` is equal.

**Try it:** Add a second column to the SELECT list and order by it (e.g. `ORDER BY schemaname, tablename`).

Source: [order-by.sql](../source/order-by.sql)

Next: [CREATE TABLE](create-table.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
