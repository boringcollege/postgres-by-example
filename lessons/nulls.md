# Postgres by Example: NULLs

`NULL` means "unknown" or "missing" value. It is not equal to anything, including itself. Use `IS NULL` and `IS NOT NULL` in conditions; `= NULL` never returns true.

**What you'll learn:**
- What NULL represents
- Testing for NULL with `IS NULL` and `IS NOT NULL`
- That `= NULL` does not work

```sql
-- NULL: missing or unknown value
SELECT 1 AS a, NULL AS b;

-- Check for NULL (use IS NULL / IS NOT NULL, not = NULL)
SELECT * FROM (SELECT 1 AS id, NULL AS name) t WHERE name IS NULL;
SELECT * FROM (SELECT 1 AS id, 'x' AS name) t WHERE name IS NOT NULL;
```

The subquery `(SELECT ...) t` gives us a one-row "table" so we can filter. The first filter keeps the row where `name` is NULL; the second keeps the row where `name` is not NULL.

To run:

```bash
$ psql -f source/nulls.sql postgres
 a | b
---+---
 1 |
(1 row)

 id | name
----+------
  1 |
(1 row)

 id | name
----+------
  1 | x
(1 row)
```

**Tip:** Use `COALESCE(col, default)` to replace NULL with a default value in the result.

**Try it:** Run `SELECT 1 = NULL;` and `SELECT 1 IS NOT NULL;` in psql to see the difference.

Source: [nulls.sql](../source/nulls.sql)

Next: [Expressions](expressions.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
