build:
	go build -o server main.go
run: build
	./server
watch:
	reflex -s -r '\.go$$' make run
start-db:
	docker compose -f postgres.yaml up -d

stop-db:
	docker compose -f postgres.yaml down