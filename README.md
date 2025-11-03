# 🐘 Postgres SQL Analytics Starter

A **Dockerized PostgreSQL + pgAdmin** setup for practicing SQL analytics, schema design, and data engineering concepts.  
Includes ready-to-run sample data, realistic e-commerce schema, and example analytics queries.

![Postgres SQL Banner](docs/banner.png)

---

## 🚀 Features

- 🐳 **Dockerized PostgreSQL 16 + pgAdmin 8**
- 🧱 **Modular SQL folders** (schema, seed, views, analytics)
- 💾 **Sample e-commerce dataset**
- 📊 **Pre-built analytics queries** (window functions, CTEs, aggregates)
- ⚙️ **Makefile commands** for quick setup
- 🧠 Great base for data engineering, analytics, and SQL portfolio work

---

## 🧩 Project Structure
sql/
schema/ # table definitions
seed/ # sample data
queries/ # analytics examples
views/ # logical SQL views
materialized_views/ # refreshable rollups
functions/ # reusable PL/pgSQL
procedures/ # sample procedural blocks
docs/
model.md # ERD notes
docker-compose.yml
Makefile
README.md

---

## 🧰 Quick Start

1. **Start the containers**
   ```bash
   docker compose up -d
make db-init
make run-example
