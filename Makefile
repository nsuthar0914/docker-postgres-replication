#
# Makefile for Setting up local read replication
#

help:
	@echo "Usage:"
	@echo "  make run            Run"
	@echo "  make build          Build docker image to be used"

run:
	docker stop dockerpostgresreplication_pg-master_1 || true
	docker rm dockerpostgresreplication_pg-master_1 || true
	docker stop dockerpostgresreplication_pg-slave_1 || true
	docker rm dockerpostgresreplication_pg-slave_1 || true
	docker-compose up

build:
	docker build --file=Dockerfile --tag=replication-cluster .