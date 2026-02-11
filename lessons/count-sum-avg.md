# Postgres by Example: COUNT, SUM, AVG

Aggregate functions compute one value from many rows. `COUNT(*)` counts rows; `COUNT(column)` counts non-NULL values in that column. `SUM` and `AVG` work on numeric columns; `MIN` and `MAX` work on comparable types (numbers, text, dates).

**What you'll learn:**
- COUNT(*), COUNT(column), and the difference
- SUM and AVG for numeric columns
- MIN and MAX

```sql
-- Aggregate functions over a table
SELECT COUNT(*) AS total_rows FROM fruits;
SELECT COUNT(name) AS non_null_names FROM fruits;
SELECT SUM(id) AS sum_id, AVG(id) AS avg_id FROM fruits;

-- MIN, MAX
SELECT MIN(name) AS min_name, MAX(name) AS max_name FROM fruits;
```

COUNT(*) counts every row; COUNT(name) would exclude NULLs if any. SUM/AVG ignore NULL. MIN/MAX on text use collation order.

To run:

```bash
$ psql -f source/count-sum-avg.sql postgres
 total_rows
------------
          5
(1 row)

 sum_id | avg_id
--------+--------
     15 | 3.0000
(1 row)

 min_name | max_name
----------+----------
 apple    | elderberry
(1 row)
```

**Tip:** Use COUNT(*) when you just need the number of rows; use COUNT(column) when you want to exclude NULLs.

**Try it:** Add a numeric column to fruits, insert values, and use SUM and AVG on it.

Source: [count-sum-avg.sql](../source/count-sum-avg.sql)

Next: [GROUP BY](group-by.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
