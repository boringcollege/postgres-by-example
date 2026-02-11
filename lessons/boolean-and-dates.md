# Postgres by Example: Boolean and Dates

`boolean` holds true, false, or NULL. For dates and time, use `date`, `timestamp` (no time zone), or `timestamptz` (with time zone). `current_date` and `current_timestamp` return the session's current date and time.

**What you'll learn:**
- Boolean values and comparisons
- `date` and `timestamp` literals
- `current_date` and `current_timestamp`

```sql
-- Boolean: true, false, or NULL
SELECT true AS ok, false AS no;
SELECT (1 = 1) AS same, (1 = 2) AS diff;

-- Date and timestamp
SELECT current_date AS today;
SELECT current_timestamp AS now;
SELECT '2024-01-15'::date AS d;
SELECT '2024-01-15 10:30:00'::timestamp AS ts;
```

Date and timestamp literals use the format shown; PostgreSQL accepts many input formats.

To run:

```bash
$ psql -f source/boolean-and-dates.sql postgres
 ok  | no
-----+-----
 t   | f
(1 row)

 same | diff
------+------
 t    | f
(1 row)

    today
------------
 2024-xx-xx
(1 row)
 ...
```

**Tip:** Prefer `timestamptz` for times that should be stored in UTC and displayed in the user's time zone.

**Try it:** Add and subtract days: `SELECT current_date + 7 AS next_week;`

Source: [boolean-and-dates.sql](../source/boolean-and-dates.sql)

Next: [UUID and JSONB](uuid-jsonb.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
