# Postgres by Example: CREATE INDEX

Indexes speed up lookups and sorts. `CREATE INDEX index_name ON table (column)` builds an index on that column (or expression). The default index type is B-tree. Use `IF NOT EXISTS` to avoid errors when the index already exists.

**What you'll learn:**
- Creating a B-tree index on a column
- Naming indexes and listing them
- That indexes improve query performance at a cost to writes

```sql
-- Create an index on a column (speeds up WHERE, ORDER BY, JOINs on that column)
CREATE INDEX IF NOT EXISTS fruits_name_idx ON fruits (name);

-- List indexes on a table (system catalog)
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'fruits';
```

Queries that filter or order by `name` can use this index. Inserts and updates must maintain the index, so don't over-index.

To run (requires `fruits`):

```bash
$ psql -f source/create-index.sql postgres
CREATE INDEX
 indexname     | indexdef
---------------+-----------------------------------------
 fruits_name_idx | CREATE INDEX fruits_name_idx ON ...
(1 row)
```

**Tip:** Index primary keys and unique columns are created automatically; add indexes for columns you often use in WHERE, JOIN, and ORDER BY.

**Try it:** Create an index on fruits(id) and run EXPLAIN on a simple SELECT from fruits.

Source: [create-index.sql](../source/create-index.sql)

Next: [When to Index](when-to-index.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
