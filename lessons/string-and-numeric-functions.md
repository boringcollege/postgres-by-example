# Postgres by Example: String and Numeric Functions

PostgreSQL has many built-in functions. For strings: `upper`, `lower`, `length`, `substring`, `trim`, and more. For numbers: `abs`, `round`, `ceil`, `floor`, etc. Use them in SELECT, WHERE, and expressions.

**What you'll learn:**
- Common string functions: upper, lower, length, substring, trim
- Common numeric functions: abs, round, ceil, floor
- Using functions in expressions

```sql
-- String functions
SELECT upper('hello') AS u, lower('HELLO') AS l;
SELECT length('hello') AS len;
SELECT substring('hello' FROM 2 FOR 3) AS sub;
SELECT trim('  hi  ') AS t;

-- Numeric functions
SELECT abs(-5) AS a, round(3.14159, 2) AS r;
SELECT ceil(2.1) AS c, floor(2.9) AS f;
```

`substring(str FROM start FOR n)` is 1-based. `trim` removes leading and trailing spaces.

To run:

```bash
$ psql -f source/string-and-numeric-functions.sql postgres
   u   |   l   | len | sub |  t
-------+-------+-----+-----+----
 HELLO | hello |   5 | ell | hi
(1 row)

 a  |  r   | c | f
----+------+---+---
  5 | 3.14 |  3 |  2
(1 row)
```

**Tip:** See the docs for full lists: string functions and math functions. Use `\df` in psql to list functions.

**Try it:** Use LOWER on a column from fruits and filter with LIKE.

Source: [string-and-numeric-functions.sql](../source/string-and-numeric-functions.sql)

Next: [Date Functions and COALESCE](date-functions-and-coalesce.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
