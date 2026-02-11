# Postgres by Example: CASE

`CASE` is a conditional expression. Two forms: (1) `CASE WHEN cond THEN result ... ELSE result END` for general conditions; (2) `CASE expr WHEN value THEN result ... END` for equality checks. Use it in SELECT, WHERE, and anywhere an expression is allowed.

**What you'll learn:**
- CASE WHEN ... THEN ... ELSE ... END
- Simple CASE for equality
- Using CASE to derive a column

```sql
-- CASE expression: conditional result
SELECT id, name,
  CASE
    WHEN id <= 2 THEN 'low'
    WHEN id <= 4 THEN 'mid'
    ELSE 'high'
  END AS tier
FROM fruits
ORDER BY id;

-- Simple CASE (equality)
SELECT name, CASE name
  WHEN 'apricot' THEN 'A'
  WHEN 'banana' THEN 'B'
  ELSE '?'
END AS code
FROM fruits
ORDER BY id
LIMIT 3;
```

The first form evaluates conditions in order and returns the result for the first true one. The second compares the expression to each WHEN value.

To run:

```bash
$ psql -f source/case.sql postgres
 id |    name    | tier
----+------------+------
  1 | apricot    | low
  2 | banana     | low
  3 | cherry     | mid
  4 | date       | mid
  5 | elderberry | high
(5 rows)
 ...
```

**Tip:** ELSE is optional; if omitted and no condition matches, the result is NULL.

**Try it:** Use CASE in a WHERE clause (e.g. filter to only 'mid' tier).

Source: [case.sql](../source/case.sql)

Next: [CREATE INDEX](create-index.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
