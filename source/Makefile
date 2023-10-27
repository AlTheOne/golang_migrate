# local migrateions
db-upgrade:
	sh ./scripts/migrations/up.sh

db-downgrade:
	sh ./scripts/migrations/down.sh

db-drop:
	sh ./scripts/migrations/drop.sh


# docker migrations...
d-db-build:
	docker build . -t gomigrate -f Dockerfile.migrate

d-db-upgrade:
	docker run --env-file .env.local --rm gomigrate sh ./scripts/migrations/up.sh

d-db-downgrade:
	docker run --env-file .env.local --rm gomigrate sh ./scripts/migrations/down.sh

d-db-drop:
	docker run --env-file .env.local --rm gomigrate sh ./scripts/migrations/drop.sh


# docker-compose migrations...
dc-db-upgrade:
	docker-compose run --rm migrations sh ./scripts/migrations/up.sh

dc-db-downgrade:
	echo y | docker-compose run --rm migrations sh ./scripts/migrations/down.sh

dc-db-drop:
	docker-compose run --rm migrations sh ./scripts/migrations/drop.sh
