#!/bin/bash

set -e

if [[ -z ${NOBUILD-} ]];then
docker run \
    --rm \
    -v "$PWD":/usr/src/myapp \
    -w /usr/src/myapp \
    golang:1.8 \
    sh -c 'go get -u github.com/constabulary/gb/... && gb build -f github.com/matrix-org/go-neb'
fi

docker build -t ${IMAGE_PREFIX}go-neb:latest .
