# Postgres by Example

[PostgreSQL](https://www.postgresql.org/) is a powerful, open-source relational database. Please read the [official documentation](https://www.postgresql.org/docs/) to learn more.

*Postgres by Example* is a hands-on introduction to PostgreSQL using annotated SQL examples. Check out the [first example](lessons/first-query.md) or browse the full list below.

**Prerequisites:** PostgreSQL installed and the server running. Examples assume you can connect with `psql`; the default database is `postgres` unless noted. Start the server with your system's service manager or `pg_ctl start` as needed.

Unless stated otherwise, examples target current stable PostgreSQL. Use the latest version you can if something isn't working.

## Table of Contents

### Getting Started
* [First Query](lessons/first-query.md)
* [psql Basics](lessons/psql-basics.md)

### Querying
* [SELECT Basics](lessons/select-basics.md)
* [WHERE](lessons/where.md)
* [ORDER BY](lessons/order-by.md)
* [SELECT from a Table](lessons/select-from-table.md)
* [LIMIT and OFFSET](lessons/limit-offset.md)
* [DISTINCT](lessons/distinct.md)
* [NULLs](lessons/nulls.md)
* [Expressions](lessons/expressions.md)

### Data Types
* [Numeric Types](lessons/numeric-types.md)
* [Text Types](lessons/text-types.md)
* [Boolean and Dates](lessons/boolean-and-dates.md)
* [UUID and JSONB](lessons/uuid-jsonb.md)

### DDL
* [CREATE TABLE](lessons/create-table.md)
* [Column Types and Constraints](lessons/column-types-and-constraints.md)
* [ALTER TABLE and DROP](lessons/alter-table-and-drop.md)
* [Primary Keys and Unique](lessons/primary-keys-and-unique.md)
* [NOT NULL and DEFAULT](lessons/not-null-and-default.md)

### DML
* [INSERT](lessons/insert.md)
* [UPDATE](lessons/update.md)
* [DELETE](lessons/delete.md)
* [RETURNING](lessons/returning.md)

### Joins and Sets
* [INNER and LEFT JOIN](lessons/inner-and-left-join.md)
* [RIGHT and FULL JOIN](lessons/right-and-full-join.md)
* [Self-Join](lessons/self-join.md)
* [UNION, INTERSECT, EXCEPT](lessons/union-intersect-except.md)

### Aggregation and Grouping
* [COUNT, SUM, AVG](lessons/count-sum-avg.md)
* [GROUP BY](lessons/group-by.md)
* [HAVING](lessons/having.md)

### Subqueries
* [Scalar and IN Subqueries](lessons/scalar-and-in-subqueries.md)
* [EXISTS and Derived Tables](lessons/exists-and-derived-tables.md)

### Functions and Operators
* [String and Numeric Functions](lessons/string-and-numeric-functions.md)
* [Date Functions and COALESCE](lessons/date-functions-and-coalesce.md)
* [CASE](lessons/case.md)

### Indexes
* [CREATE INDEX](lessons/create-index.md)
* [When to Index](lessons/when-to-index.md)

### Transactions
* [BEGIN, COMMIT, ROLLBACK](lessons/begin-commit-rollback.md)
* [Savepoints](lessons/savepoints.md)

### Views
* [CREATE VIEW](lessons/create-view.md)

### Security
* [Roles and GRANT](lessons/roles-and-grant.md)

### Extras
* [psql Meta-commands](lessons/psql-meta-commands.md)
* [COPY](lessons/copy.md)

---

Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

by [Dariush Abbasi](https://github.com/dariubs) | [source](https://github.com/boringcollege/postgres-by-example)
