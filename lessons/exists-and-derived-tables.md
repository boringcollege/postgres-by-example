# Postgres by Example: EXISTS and Derived Tables

`EXISTS (subquery)` is true if the subquery returns at least one row; you often use a correlated subquery (referencing the outer row). A derived table is a subquery in the FROM clause; you give it an alias and then select from it like a table.

**What you'll learn:**
- Using EXISTS with a subquery
- Correlated vs uncorrelated subqueries
- Derived table (subquery in FROM) with an alias

```sql
-- EXISTS: true if subquery returns at least one row
SELECT id, name FROM fruits f
WHERE EXISTS (SELECT 1 FROM orders_example o WHERE o.customer_id = 1)
LIMIT 2;

-- Derived table (subquery in FROM)
SELECT sub.total_spent
FROM (
  SELECT customer_id, SUM(total) AS total_spent
  FROM orders_example
  GROUP BY customer_id
) sub
WHERE sub.customer_id = 1;
```

The first EXISTS checks whether any order has customer_id 1; if so, we return two fruits (the subquery doesn't reference f, so it's uncorrelated here). The second query uses a derived table `sub` that holds per-customer totals, then we filter to customer 1.

To run (requires orders_example):

```bash
$ psql -f source/exists-and-derived-tables.sql postgres
 id |  name
----+--------
  1 | apricot
  2 | banana
(2 rows)

 total_spent
-------------
       80.00
(1 row)
```

**Tip:** EXISTS can short-circuit once one row is found; for "row in set" checks it often beats IN when the set is large.

**Try it:** Write a correlated EXISTS that checks something about the outer row (e.g. only fruits whose id appears in another table).

Source: [exists-and-derived-tables.sql](../source/exists-and-derived-tables.sql)

Next: [String and Numeric Functions](string-and-numeric-functions.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
