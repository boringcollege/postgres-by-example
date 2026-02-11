# Postgres by Example: UNION, INTERSECT, EXCEPT

Set operations combine two result sets. All require the same number of columns and compatible types. `UNION` returns rows in either result (duplicates removed); `UNION ALL` keeps duplicates. `INTERSECT` returns rows in both; `EXCEPT` returns rows in the first but not the second.

**What you'll learn:**
- UNION and UNION ALL
- INTERSECT for rows in both queries
- EXCEPT for rows in the first minus the second

```sql
-- Set operations: same number and compatible types of columns
SELECT 1 AS n UNION SELECT 2 UNION SELECT 1;
-- UNION ALL keeps duplicates
SELECT 1 AS n UNION ALL SELECT 1;

SELECT id FROM fruits WHERE id <= 2
INTERSECT
SELECT id FROM fruits WHERE id >= 2;

SELECT id FROM fruits WHERE id <= 2
EXCEPT
SELECT id FROM fruits WHERE id >= 2;
```

First UNION yields 1 and 2 (one 1); UNION ALL yields 1 twice. INTERSECT gives id 2; EXCEPT gives id 1.

To run (requires `fruits`):

```bash
$ psql -f source/union-intersect-except.sql postgres
 n
---
 1
 2
(2 rows)

 n
---
 1
 1
(2 rows)

 id
----
  2
(1 row)

 id
----
  1
(1 row)
```

**Tip:** Use UNION ALL when you know there are no duplicates to avoid the cost of deduplication.

**Try it:** Write two SELECTs from fruits with different WHERE and combine with UNION.

Source: [union-intersect-except.sql](../source/union-intersect-except.sql)

Next: [COUNT, SUM, AVG](count-sum-avg.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
