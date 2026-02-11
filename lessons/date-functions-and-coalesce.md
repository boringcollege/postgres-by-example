# Postgres by Example: Date Functions and COALESCE

Date and time functions include `current_date`, `now()`, `date_trunc` (truncate to a precision), `extract` (year, month, etc.), and arithmetic with `interval`. `COALESCE(a, b, ...)` returns the first argument that is not NULL; use it to supply defaults for possibly-NULL columns.

**What you'll learn:**
- date_trunc and extract
- Interval arithmetic (e.g. now() - interval '1 day')
- COALESCE for default values when NULL

```sql
-- Date/time functions
SELECT current_date AS today;
SELECT date_trunc('month', current_timestamp) AS month_start;
SELECT now() - interval '1 day' AS yesterday;
SELECT extract(year FROM current_date) AS year;

-- COALESCE: first non-NULL value
SELECT COALESCE(NULL, NULL, 'default') AS c1;
SELECT COALESCE(NULL, 42) AS c2;
```

`date_trunc('month', ts)` sets the date to the first of the month and drops time. COALESCE is handy in SELECT and in UPDATE (e.g. only set column if not already set).

To run:

```bash
$ psql -f source/date-functions-and-coalesce.sql postgres
    today    |       month_start       | ...
-------------+-------------------------+----
 2024-xx-xx  | 2024-xx-01 00:00:00... | ...
 year
------
 2024
(1 row)

   c1     | c2
----------+----
 default  | 42
(1 row)
```

**Tip:** Use COALESCE(optional_column, default) when displaying so NULLs show as a readable value.

**Try it:** Compute the first day of the current year with date_trunc.

Source: [date-functions-and-coalesce.sql](../source/date-functions-and-coalesce.sql)

Next: [CASE](case.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
