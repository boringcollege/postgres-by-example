# Contributing to Postgres by Example

Thank you for your interest in contributing! This project is a beginner-friendly PostgreSQL tutorial. Here's how you can help.

## How to Contribute

1. **Fork** the repository on GitHub.
2. **Create a branch** for your changes: `git checkout -b my-improvement`
3. **Make your changes** following the guidelines below.
4. **Submit a pull request** with a clear description of what you changed.

## Contribution Guidelines

### Lesson Content

- Keep the tone simple and beginner-friendly.
- Each lesson should include:
  - Context: why/when to use the concept
  - Key points (2-4 bullets)
  - SQL example with brief walkthrough
  - Tip and Try-it section where applicable
- Ensure SQL examples run correctly with current stable PostgreSQL.

### Source Code

- Source files live in `source/`. Each lesson links to its corresponding `.sql` file.
- Use a `-example` suffix for filenames when the topic is a reserved word or common identifier (e.g. `user-table-example.sql`).
- Keep examples minimal and focused on the lesson topic.

### Markdown Format

- Use standard Markdown. Code blocks with `sql` or `bash` language tags.
- Links to other lessons use relative paths: `(next-topic.md)` within `lessons/`, `(../source/script.sql)` for source files.
- The last lesson in each section links to the next; the final lesson links back: `[Table of Contents](../README.md)`.

### Running Examples

- All run commands assume execution from the repository root: `psql -f source/script.sql` (or `psql -f source/script.sql postgres` if you need to specify the database).
- Examples assume a running PostgreSQL server; default database is `postgres` unless stated. You can set `PGDATABASE` or pass the database name to `psql` if you use a different one.
- Verify that examples produce the documented output before submitting.

## Repository Structure

```
egpostgres/
├── README.md          # Table of contents and intro
├── CONTRIBUTING.md    # This file
├── LICENSE            # CC BY 4.0
├── lessons/           # Lesson markdown files
└── source/            # SQL example scripts
```

## License

By contributing, you agree that your contributions will be licensed under the same [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/) license that covers this project.

## Questions?

Open an issue on [GitHub](https://github.com/boringcollege/postgres-by-example) for questions or suggestions.
