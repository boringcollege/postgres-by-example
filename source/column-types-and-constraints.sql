-- Table with varied column types
DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id          integer,
  name        text,
  price       numeric(10,2),
  in_stock    boolean DEFAULT true,
  created_at  timestamp with time zone DEFAULT current_timestamp
);

INSERT INTO products (id, name, price) VALUES (1, 'Widget', 19.99);
SELECT * FROM products;
