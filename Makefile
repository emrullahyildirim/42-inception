DOCKER_COMPOSE_PATH = srcs/docker-compose.yml

up:	
	docker compose -f $(DOCKER_COMPOSE_PATH) up -d --build

restart:	
	docker compose -f $(DOCKER_COMPOSE_PATH) up -V -d
	
down:	
	docker compose -f $(DOCKER_COMPOSE_PATH) down -v