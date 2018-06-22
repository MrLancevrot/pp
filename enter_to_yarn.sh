#!/bin/bash

source .env

docker run -it \
    --user="user" \
    --net="host" \
    -v $(pwd)/src/verstka:${YARN_DIR} \
    -w=${YARN_DIR} \
    millennium/yarn
