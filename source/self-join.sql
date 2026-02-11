-- Self-join: same table used twice with different aliases
DROP TABLE IF EXISTS employees_example;
CREATE TABLE employees_example (id integer PRIMARY KEY, name text, manager_id integer);
INSERT INTO employees_example VALUES (1, 'Alice', NULL), (2, 'Bob', 1), (3, 'Carol', 1);

SELECT e.name AS employee, m.name AS manager
FROM employees_example e
LEFT JOIN employees_example m ON e.manager_id = m.id
ORDER BY e.id;
