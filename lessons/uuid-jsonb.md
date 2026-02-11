# Postgres by Example: UUID and JSONB

`uuid` stores 128-bit identifiers; use `gen_random_uuid()` to generate one. `jsonb` stores JSON in a binary form that supports indexing and operators like `->` (get field or element) and `->>` (get as text).

**What you'll learn:**
- Generating a UUID with `gen_random_uuid()`
- Storing and querying JSON with `jsonb`
- Operators `->` and `->>` for JSON fields

```sql
-- UUID: requires extension (often created by default in cloud)
SELECT gen_random_uuid() AS id;

-- JSONB: binary JSON, supports indexing and operators
SELECT '{"name": "Alice", "age": 30}'::jsonb AS j;
SELECT '{"name": "Alice", "age": 30}'::jsonb -> 'name' AS name;
SELECT '["a", "b"]'::jsonb -> 1 AS second;
```

`gen_random_uuid()` is built in PostgreSQL 13+. The `->` operator returns jsonb; use `->>` to get text. Array index is 0-based.

To run:

```bash
$ psql -f source/uuid-jsonb.sql postgres
                  id
--------------------------------------
 xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
(1 row)

            j
---------------------------
 {"age": 30, "name": "Alice"}
(1 row)

  name
--------
 "Alice"
(1 row)

 second
--------
 "b"
(1 row)
```

**Tip:** Use `jsonb` rather than `json` when you need to query or index the content; `json` keeps the exact input text.

**Try it:** Use `->>` instead of `->` for the name and see the type of the result (text, no quotes).

Source: [uuid-jsonb.sql](../source/uuid-jsonb.sql)

Next: [Column Types and Constraints](column-types-and-constraints.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
