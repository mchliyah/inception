THIS_FILE := $(lastword $(MAKEFILE_LIST))

.PHONY: help build up start down destroy stop restart logs logs-api ps login-timescale login-api db-shell

build:
	docker-compose -f src/docker-compose.yml build --no-cache $(c)
up:
	docker-compose -f src/docker-compose.yml up -d $(c)
start:
	docker-compose -f src/docker-compose.yml start $(c)
down:
	docker-compose -f src/docker-compose.yml down $(c)
destroy:
	docker-compose -f src/docker-compose.yml down -v $(c)
stop:
	docker stop $$(docker ps -aq)
restart: stop up
logs:
	docker-compose -f src/docker-compose.yml logs -f $(c)
# logs-api:
# 	docker-compose -f src/docker-compose.yml logs -f api
ps:
	docker-compose -f src/docker-compose.yml ps
clean :
	docker rm -f $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm -f $$(docker volume ls -q);\
	docker network rm -f $$(docker network ls -q);
fclean :
	docker system prune -a --force
	sudo rm -rf ~/data/*/*
