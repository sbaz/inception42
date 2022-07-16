HOMEDIR = /home/pceccoli
DOCKER_COMPOSE_FILE	=	./srcs/docker-compose.yml

all:
	@sudo mkdir -p $(HOMEDIR)/data/wordpress
	@sudo mkdir -p $(HOMEDIR)/data/mariadb
	@sudo echo '127.0.0.1 pceccoli.42.fr' >> /etc/hosts;
	@sudo echo '127.0.0.1 www.pceccoli.42.fr' >> /etc/hosts;
	@echo "docker-compose up..."
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build

re: clean all

stop:
	docker-compose -f $(DOCKER_COMPOSE_FILE) stop

clean: stop
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

ps:
	docker-compose -f $(DOCKER_COMPOSE_FILE) ps

.PHONY : all re stop clean ps