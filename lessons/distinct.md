# Postgres by Example: DISTINCT

`DISTINCT` removes duplicate rows from the result. You can select one column or multiple; only unique combinations are returned.

**What you'll learn:**
- Eliminating duplicates with `DISTINCT`
- How it applies to one or more columns

```sql
-- Get unique values in a column
SELECT DISTINCT name FROM fruits;

-- Distinct pairs (id, name) - here all rows are already unique
SELECT DISTINCT id, name FROM fruits ORDER BY id LIMIT 3;
```

In our `fruits` table each name is unique, so `DISTINCT name` returns the same set as `SELECT name`. With multiple columns, `DISTINCT` applies to the whole row.

To run:

```bash
$ psql -f source/distinct.sql postgres
    name
------------
 apple
 banana
 cherry
 date
 elderberry
(5 rows)
 ...
```

**Tip:** `DISTINCT ON (expr)` (PostgreSQL-specific) keeps one row per distinct value of `expr`; you typically add `ORDER BY expr, ...` to control which row is kept.

**Try it:** Insert another row with an existing name, then run `SELECT DISTINCT name` again.

Source: [distinct.sql](../source/distinct.sql)

Next: [NULLs](nulls.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
