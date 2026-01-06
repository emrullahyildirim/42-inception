DOCKER_COMPOSE_PATH = ./srcs/docker-compose.yml

all: run

run: 
	mkdir -p /home/emyildir/data/wordpress
	mkdir -p /home/emyildir/data/mariadb
	docker compose -f $(DOCKER_COMPOSE_PATH) up -d --build

stop:
	docker compose -f $(DOCKER_COMPOSE_PATH) stop

start:
	docker compose -f $(DOCKER_COMPOSE_PATH) start

status:
	@docker ps --format "table {{.Names}}\t{{.Status}}"

clean:
	docker compose -f $(DOCKER_COMPOSE_PATH) down

fclean:
	docker compose -f $(DOCKER_COMPOSE_PATH) down -v
	sudo rm -rf /home/emyildir/data/wordpress
	sudo rm -rf /home/emyildir/data/mariadb

re: fclean run

.PHONY: all run stop start status clean fclean re