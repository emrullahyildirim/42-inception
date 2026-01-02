DOCKER_COMPOSE_PATH = ./srcs/docker-compose.yml

all: up

up: 
	mkdir -p /home/emyildir/data/wordpress
	mkdir -p /home/emyildir/data/mariadb
	docker compose -f $(DOCKER_COMPOSE_PATH) up -d --build

stop:
	docker compose -f $(DOCKER_COMPOSE_PATH) stop

down:
	docker compose -f $(DOCKER_COMPOSE_PATH) down

clean:
	docker compose -f $(DOCKER_COMPOSE_PATH) down -v
	rm -rf /home/emyildir/data/wordpress
	rm -rf /home/emyildir/data/mariadb

re: clean up
