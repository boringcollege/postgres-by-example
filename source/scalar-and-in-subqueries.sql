-- Scalar subquery: returns one row, one column
SELECT name FROM fruits WHERE id = (SELECT MAX(id) FROM fruits);

-- IN subquery: check membership
SELECT * FROM fruits WHERE id IN (SELECT id FROM fruits WHERE id <= 2);

-- NOT IN (beware of NULL in subquery result)
SELECT * FROM fruits WHERE id NOT IN (SELECT id FROM fruits WHERE id > 4);
