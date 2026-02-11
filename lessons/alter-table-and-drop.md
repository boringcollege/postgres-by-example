# Postgres by Example: ALTER TABLE and DROP

`ALTER TABLE` changes an existing table: add or drop columns, rename columns or the table, add constraints. `DROP TABLE` removes the table and its data. Use with care in production.

**What you'll learn:**
- Adding a column with `ADD COLUMN`
- Renaming and dropping columns
- That `DROP TABLE` removes the table

```sql
-- Add a column
ALTER TABLE products ADD COLUMN description text;

-- Rename a column
ALTER TABLE products RENAME COLUMN description TO desc_short;

-- Drop a column
ALTER TABLE products DROP COLUMN desc_short;

-- Drop the table (removes data and definition)
-- Uncomment to run: DROP TABLE products;
SELECT tablename FROM pg_tables WHERE tablename = 'products';
```

Run after the column-types-and-constraints lesson so `products` exists. We add a column, rename it, then drop it; the table remains. The last query confirms the table still exists.

To run:

```bash
$ psql -f source/alter-table-and-drop.sql postgres
ALTER TABLE
ALTER TABLE
ALTER TABLE
 tablename
------------
 products
(1 row)
```

**Tip:** For large tables, adding a column with a DEFAULT can rewrite the table; in newer PostgreSQL, adding a column without a default or with a constant default is often fast.

**Try it:** Add a column back, then use `ALTER TABLE products RENAME TO items;` and list tables again.

Source: [alter-table-and-drop.sql](../source/alter-table-and-drop.sql)

Next: [Primary Keys and Unique](primary-keys-and-unique.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
