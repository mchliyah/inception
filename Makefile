THIS_FILE := $(lastword $(MAKEFILE_LIST))

.PHONY: help build up start down destroy stop restart logs logs-api ps login-timescale login-api db-shell

build:
	docker-compose -f src/docker-compose.yml build $(c)
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
	docker-compose -f src/docker-compose.yml logs --tail=100 -f $(c)
# logs-api:
# 	docker-compose -f src/docker-compose.yml logs --tail=100 -f api
ps:
	docker-compose -f src/docker-compose.yml ps
clean :
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);
fclean : clean
	docker system prune -a --force
	sudo rm -rf data/*
