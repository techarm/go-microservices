FRONT_END_BINARY=frontApp
BROKER_BINARY=brokerApp

## DOCKER_COMPOSE=docker-compose
DOCKER_COMPOSE=docker compose

## up: starts all containers in the background without forcing build
up:
	@echo "Starting Docker images..."
	${DOCKER_COMPOSE} up -d
	@echo "Docker images started!"

## up_build: stops docker-compose (if running), builds all projects and starts docker compose
up_build: build_broker
	@echo "Stopping docker images (if running...)"
	${DOCKER_COMPOSE} down
	@echo "Building (when required) and starting docker images..."
	${DOCKER_COMPOSE} up --build -d
	@echo "Docker images built and started!"

## down: stop docker compose
down:
	@echo "Stopping docker compose..."
	${DOCKER_COMPOSE} down
	@echo "Done!"

## build_broker: builds the broker binary as a linux executable
build_broker:
	@echo "Building broker binary..."
	cd ../broker-service && env GOOS=linux CGO_ENABLED=0 go build -o ${BROKER_BINARY} ./cmd/api
	@echo "Done!"

## build_front: builds the frone end binary
build_front:
	@echo "Building front end binary..."
	cd ../front-end && env CGO_ENABLED=0 go build -o ${FRONT_END_BINARY} ./cmd/web
	@echo "Done!"

## start: starts the front end
start: build_front
	@echo "Starting front end"
	cd ../front-end && ./${FRONT_END_BINARY} &

## stop: stop the front end
stop:
	@echo "Stopping front end..."
	@-pkill -SIGTERM -f "./${FRONT_END_BINARY}"
	@echo "Stopped front end!"