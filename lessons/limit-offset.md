# Postgres by Example: LIMIT and OFFSET

`LIMIT n` returns at most n rows. `OFFSET m` skips the first m rows, then you can apply `LIMIT`. Together they are useful for pagination. Order is undefined unless you use `ORDER BY`.

**What you'll learn:**
- Restricting result size with `LIMIT`
- Skipping rows with `OFFSET`
- Using both for a "page" of results

```sql
-- Limit number of rows returned
SELECT * FROM fruits ORDER BY id LIMIT 2;

-- Skip rows with OFFSET, then take LIMIT
SELECT * FROM fruits ORDER BY id LIMIT 2 OFFSET 1;
```

The first query returns the first two rows (by `id`); the second skips one row and returns the next two.

To run (requires `fruits` from create-table and insert):

```bash
$ psql -f source/limit-offset.sql postgres
 id |  name
----+--------
  1 | apple
  2 | banana
(2 rows)

 id |  name
----+--------
  2 | banana
  3 | cherry
(2 rows)
```

**Tip:** For page 3 with 10 per page use `LIMIT 10 OFFSET 20`. Always use `ORDER BY` with LIMIT/OFFSET so pages are consistent.

**Try it:** Change OFFSET to 3 and run again.

Source: [limit-offset.sql](../source/limit-offset.sql)

Next: [DISTINCT](distinct.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
