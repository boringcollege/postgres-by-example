# Postgres by Example: Scalar and IN Subqueries

A subquery is a SELECT inside another query. A scalar subquery returns one row and one column; it can be used where a single value is expected. `IN (subquery)` is true when the row's value is in the subquery's result set; `NOT IN` is the opposite (and can behave unexpectedly when the subquery returns NULL).

**What you'll learn:**
- Using a scalar subquery (e.g. SELECT MAX(id)) in WHERE
- IN and NOT IN with a subquery
- That subqueries are evaluated in context of the outer query

```sql
-- Scalar subquery: returns one row, one column
SELECT name FROM fruits WHERE id = (SELECT MAX(id) FROM fruits);

-- IN subquery: check membership
SELECT * FROM fruits WHERE id IN (SELECT id FROM fruits WHERE id <= 2);

-- NOT IN (beware of NULL in subquery result)
SELECT * FROM fruits WHERE id NOT IN (SELECT id FROM fruits WHERE id > 4);
```

The first returns the name of the fruit with the largest id. The second returns rows whose id is 1 or 2. The third returns rows whose id is not in the set {5} (ids > 4).

To run:

```bash
$ psql -f source/scalar-and-in-subqueries.sql postgres
    name
------------
 elderberry
(1 row)

 id |  name
----+--------
  1 | apricot
  2 | banana
(2 rows)
 ...
```

**Tip:** Prefer EXISTS over IN when the subquery can return many rows or NULLs; it often performs better and avoids NOT IN + NULL pitfalls.

**Try it:** Write a scalar subquery that returns the average id and use it in a WHERE condition.

Source: [scalar-and-in-subqueries.sql](../source/scalar-and-in-subqueries.sql)

Next: [EXISTS and Derived Tables](exists-and-derived-tables.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
