#!/bin/bash

set -ex

ROOT=$(readlink -f `dirname $0`)

echo "Building new Docker image:"
docker build -t some-docker-image $ROOT
echo

CONTAINER_ID=`docker run -d \
    -e "EXTERNAL_USER_ID=$EUID" \
    some-docker-image \
    /add-user.sh
`

echo $CONTAINER_ID
echo

[ `docker wait $CONTAINER_ID` -eq 0 ] || fail "ERROR: Something failed inside the Docker container--check the container logs."

echo "Committing Docker container changes:"
IMAGE_ID=`docker commit $CONTAINER_ID`
echo "Built Docker image: $IMAGE_ID"
