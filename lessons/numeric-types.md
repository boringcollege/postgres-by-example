# Postgres by Example: Numeric Types

PostgreSQL provides integer types (`smallint`, `integer`, `bigint`), exact decimals (`numeric(p,s)`), and approximate floats (`real`, `double precision`). Use integers for whole numbers, `numeric` for money or exact decimals, and floats when approximation is acceptable.

**What you'll learn:**
- Integer and bigint for whole numbers
- `numeric(precision, scale)` for exact decimals
- real and double precision for floating point

```sql
-- Integer types: smallint, integer, bigint
SELECT 1::integer AS i, 1000000::bigint AS b;

-- Decimal: numeric(precision, scale) for exact math
SELECT 3.14::numeric(4,2) AS n;

-- Float (approximate): real, double precision
SELECT 1.5::real AS r, 2.5::double precision AS d;
```

`::type` is PostgreSQL cast syntax. `numeric(4,2)` means 4 total digits, 2 after the decimal point.

To run:

```bash
$ psql -f source/numeric-types.sql postgres
 i |    b
---+---------
 1 | 1000000
(1 row)

  n
------
 3.14
(1 row)

 r   | d
-----+-----
 1.5 | 2.5
(1 row)
```

**Tip:** Prefer `numeric` for currency; floats can introduce rounding errors.

**Try it:** Create a table with an `integer` and a `numeric(5,2)` column and insert values.

Source: [numeric-types.sql](../source/numeric-types.sql)

Next: [Text Types](text-types.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
