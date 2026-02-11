-- Add a column
ALTER TABLE products ADD COLUMN description text;

-- Rename a column
ALTER TABLE products RENAME COLUMN description TO desc_short;

-- Drop a column
ALTER TABLE products DROP COLUMN desc_short;

-- Drop the table (removes data and definition)
-- Uncomment to run: DROP TABLE products;
SELECT tablename FROM pg_tables WHERE tablename = 'products';
