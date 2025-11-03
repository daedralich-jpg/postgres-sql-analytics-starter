
# postgres-sql-analytics-starter

A ready-to-fork **PostgreSQL analytics** starter you can put on GitHub. It includes:

- Dockerized Postgres + pgAdmin
- Clean repo structure for SQL (schema, seed, queries, views, functions, procedures, materialized views)
- Sample e‑commerce schema & seed data
- Example analytics queries (CTEs, window functions, rollups)
- Makefile helpers
- pg_dump/restore examples

---

## Quick start

**Prereqs:** Docker Desktop installed.

```bash
# 1) Start the stack
docker compose up -d

# 2) Load schema + seed data into the running DB
make db-init

# 3) Open pgAdmin at http://localhost:5050  (login: admin@local / admin)
#    Connect to the server 'local' (host: db, user: postgres, password: postgres)

# 4) Run example analytics queries
make run-example
```

Postgres: `localhost:5432` (user: `postgres`, password: `postgres`, db: `appdb`)

---

## Repo layout

```
sql/
  schema/                  # DDL
  seed/                    # sample data
  queries/                 # ad-hoc analytics
  views/                   # logical views
  materialized_views/      # refreshable summaries
  functions/               # SQL/PLpgSQL functions
  procedures/              # stored procedures
data/                      # (ignored) dumps, csvs
docs/                      # notes, diagrams
docker-compose.yml
Makefile
```

---

## Schema overview

**Tables:** `customers`, `products`, `orders`, `order_items`, `payments`  
**Keys:** natural + surrogate where appropriate  
**Notable:** check constraints, generated columns, foreign keys, indexes

See: [`sql/schema/001_init_schema.sql`](sql/schema/001_init_schema.sql)

---

## pgAdmin

- URL: http://localhost:5050  
- Email: `admin@local`  
- Password: `admin`

Once in pgAdmin, create a new server:
- Name: `local`
- Host: `db`
- Port: `5432`
- Username: `postgres`
- Password: `postgres`

---

## Common commands

```bash
# Start / stop
docker compose up -d
docker compose down -v

# Initialize (schema + seed)
make db-init

# Run example analytics query
make run-example

# psql into the container
make psql

# Dump and restore
make dump
make restore
```

---

## Contributing

- Open an issue for features or bugs.
- Use feature branches and PRs.
- Add test queries under `sql/queries/`.

---

## License

MIT
