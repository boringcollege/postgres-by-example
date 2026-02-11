# Postgres by Example: Self-Join

A self-join is when you join a table to itself. Use different aliases for each "copy" and link them with a condition (e.g. employee.manager_id = manager.id). Useful for hierarchies, predecessor/successor, or any relationship within the same table.

**What you'll learn:**
- Joining a table to itself with two aliases
- Using LEFT JOIN so rows with no match (e.g. top manager) still appear
- Naming columns for clarity (employee vs manager)

```sql
-- Self-join: same table used twice with different aliases
DROP TABLE IF EXISTS employees_example;
CREATE TABLE employees_example (id integer PRIMARY KEY, name text, manager_id integer);
INSERT INTO employees_example VALUES (1, 'Alice', NULL), (2, 'Bob', 1), (3, 'Carol', 1);

SELECT e.name AS employee, m.name AS manager
FROM employees_example e
LEFT JOIN employees_example m ON e.manager_id = m.id
ORDER BY e.id;
```

`e` is the employee row, `m` is the manager row. Alice has no manager_id so LEFT JOIN gives NULL for manager.

To run:

```bash
$ psql -f source/self-join.sql postgres
CREATE TABLE
INSERT 0 3
 employee | manager
----------+---------
 Alice    |
 Bob      | Alice
 Carol    | Alice
(3 rows)
```

**Tip:** For deeper hierarchies you may need recursive CTEs (WITH RECURSIVE), covered in advanced tutorials.

**Try it:** Add a fourth employee whose manager is Bob and run the query again.

Source: [self-join.sql](../source/self-join.sql)

Next: [UNION, INTERSECT, EXCEPT](union-intersect-except.md)

**Home:** [Postgres by Example](https://github.com/boringcollege/postgres-by-example)
