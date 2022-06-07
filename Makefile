build:
	docker-compose -f srcs/docker-compose.yml up -d --build 

re-build: down up

down: 
	docker-compose -f srcs/docker-compose.yml down -d --build 

restart :
	docker-compose -f srcs/docker-compose.yml restart

.PHONY : build re-build down restart