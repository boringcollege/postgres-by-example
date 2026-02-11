# Postgres by Example: When to Index

Indexes help when you filter, sort, or join on the indexed column(s). They cost space and slow down INSERT/UPDATE/DELETE. Use EXPLAIN to see whether the planner uses an index. On small tables the planner may prefer a sequential scan.

**What you'll learn:**
- When indexes help (WHERE, ORDER BY, JOIN)
- Trade-off: faster reads vs slower writes
- Using EXPLAIN to see the plan

```sql
-- EXPLAIN shows the query plan (no index vs index)
EXPLAIN (FORMAT TEXT) SELECT * FROM fruits WHERE name = 'banana';
```

With an index on `name`, the plan may show an Index Scan; without it, a Seq Scan. For a tiny table the difference may be negligible.

To run:

```bash
$ psql -f source/when-to-index.sql postgres
                        QUERY PLAN
----------------------------------------------------------
 Index Scan using fruits_name_idx on fruits  (cost=0.14..8.16 rows=1 width=14)
   Index Cond: (name = 'banana')
(2 rows)
```

**Tip:** Index columns used in WHERE, JOIN ON, and ORDER BY. Consider partial indexes (WHERE condition) and expression indexes for special cases.

**Try it:** Run EXPLAIN ANALYZE to see actual row counts and timing (the query runs).

Source: [when-to-index.sql](../source/when-to-index.sql)

Next: [BEGIN, COMMIT, ROLLBACK](begin-commit-rollback.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
