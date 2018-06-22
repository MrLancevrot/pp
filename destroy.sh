#!/bin/bash

source .env

case "$1" in
	-i)
		echo "Удаляются ВСЕ docker-образы..."
		docker rmi -f $(docker images -a -q) ;;
	-c)
		echo "Удаляются ВСЕ запущенные docker-контейнеры..."
		docker rm -f $(docker ps -a -q) ;;
	*) 
		echo "Завершаются docker-контейнеры текущего проекта..."
		docker stop ${COMPOSE_PROJECT_NAME}_apache
		docker stop ${COMPOSE_PROJECT_NAME}_php
		docker stop ${COMPOSE_PROJECT_NAME}_mysql
		docker stop ${COMPOSE_PROJECT_NAME}_yarn

		docker rm ${COMPOSE_PROJECT_NAME}_apache
		docker rm ${COMPOSE_PROJECT_NAME}_php
		docker rm ${COMPOSE_PROJECT_NAME}_mysql
		docker rm ${COMPOSE_PROJECT_NAME}_yarn;;
esac

