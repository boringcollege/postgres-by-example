# Postgres by Example: Text Types

Common text types are `text` (unlimited length, no need to specify a limit), `varchar(n)` (variable length up to n), and `char(n)` (fixed length, padded with spaces). In practice, `text` is often the best choice.

**What you'll learn:**
- `text` for general strings
- `varchar(n)` and its length limit
- `char(n)` and space padding

```sql
-- text: unlimited length (preferred for strings)
SELECT 'hello'::text AS t;

-- varchar(n): variable length, max n
SELECT 'hi'::varchar(10) AS v;

-- char(n): fixed length, padded with spaces
SELECT 'ab'::char(5) AS c, length('ab'::char(5)) AS len;
```

`length()` returns the number of characters; for `char(5)` the value is stored as `'ab   '` so length is 5.

To run:

```bash
$ psql -f source/text-types.sql postgres
   t
-------
 hello
(1 row)

 v
----
 hi
(1 row)

 c     | len
-------+-----
 ab    |   5
(1 row)
```

**Tip:** Use `text` unless you have a reason to limit length; it avoids arbitrary limits and performs the same as varchar.

**Try it:** Compare `length('x'::text)` and `length('x'::char(3))`.

Source: [text-types.sql](../source/text-types.sql)

Next: [Boolean and Dates](boolean-and-dates.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
