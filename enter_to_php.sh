#!/bin/bash

source .env

docker exec -it \
    --user="user" \
    ${COMPOSE_PROJECT_NAME}_php \
    bash
