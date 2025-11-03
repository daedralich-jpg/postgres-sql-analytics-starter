
PSQL=docker exec -it pg_db psql -U postgres -d appdb

db-init:
	$(PSQL) -f /work/sql/schema/001_init_schema.sql
	$(PSQL) -f /work/sql/seed/001_seed.sql

psql:
	docker exec -it pg_db psql -U postgres -d appdb

run-example:
	$(PSQL) -f /work/sql/queries/001_example_analytics.sql

dump:
	docker exec -it pg_db pg_dump -U postgres -d appdb -Fc -f /work/data/appdb.dump

restore:
	docker exec -it pg_db pg_restore -U postgres -d appdb /work/data/appdb.dump
