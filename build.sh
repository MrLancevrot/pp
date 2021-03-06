#!/bin/bash

source .env

if ! [[ -d logs/apache ]]; then
    mkdir -p logs/apache
fi
 
if ! [[ -d logs/mysql ]]; then
    mkdir -p logs/mysql
fi
 
if ! [[ -d logs/php ]]; then
    mkdir -p logs/php
fi
 
if ! [[ -d mysql/database ]]; then
    mkdir mysql/database
fi

docker-compose up -d --build

