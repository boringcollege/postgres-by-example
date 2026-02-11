# Postgres by Example: INSERT

`INSERT` adds rows to a table. You specify the table, the columns (optional if you provide values for all columns in order), and the values. One statement can insert one row or multiple rows.

**What you'll learn:**
- Inserting a single row with `INSERT INTO ... VALUES`
- Specifying column names
- Inserting multiple rows in one `INSERT`

```sql
-- Insert rows into fruits (table created in create-table lesson)
INSERT INTO fruits (id, name) VALUES (1, 'apple');
INSERT INTO fruits (id, name) VALUES (2, 'banana');
INSERT INTO fruits (id, name) VALUES (3, 'cherry');

-- Insert multiple rows in one statement
INSERT INTO fruits (id, name) VALUES
  (4, 'date'),
  (5, 'elderberry');
```

Run this only after running `create-table.sql` (or a script that creates `fruits`). The first three statements each add one row; the last adds two rows. Column order in `VALUES` must match the order in the column list.

To run (after create-table):

```bash
$ psql -f source/insert.sql postgres
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 2
```

**Tip:** `INSERT 0 n` means n rows were inserted. To avoid duplicates on reruns, use `DROP TABLE IF EXISTS` and recreate in create-table, or use `ON CONFLICT` (covered later).

**Try it:** Add another row with `(6, 'fig')` and run the file again.

Source: [insert.sql](../source/insert.sql)

Next: [SELECT from a table](select-from-table.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
