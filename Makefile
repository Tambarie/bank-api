postgres:
	docker run --name postgres14 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:latest

createDB:
	docker exec -it postgres14 createdb --username=root --owner=root bank_api
dropDB:
	docker exec -it postgres14 dropdb bank_api

migrateUp:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/bank_api?sslmode=disable" -verbose up

migrateDown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/bank_api?sslmode=disable" -verbose down
.PHONY: postgres createDB dropDB migrateUp migrateDown
