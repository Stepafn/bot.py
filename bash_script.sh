#!/bin/bash
set -e

GIT_REPO_URL="https://github.com/Stepafn/bot.py.git"
GIT_REPO_NAME="bot.py"
DOCKER_IMAGE_NAME="tele-bot:1.0"
DOCKER_REGISTRY_USERNAME="stepafn"
DOCKER_REGISTRY_PASSWORD="aA151104!"
DOCKER_REGISTRY_URL="https://hub.docker.com/repository/docker/stepafn/tele-bot1.0/general"

git clone $GIT_REPO_URL

cp config.env $GIT_REPO_NAME/config.env
cd bot.py

docker-compose build

docker login -u $DOCKER_REGISTRY_USERNAME -p $DOCKER_REGISTRY_PASSWORD $DOCKER_REGISTRY_URL

docker tag $DOCKER_IMAGE_NAME $DOCKER_REGISTRY_URL/$DOCKER_IMAGE_NAME

docker push $DOCKER_REGISTRY_URL/$DOCKER_IMAGE_NAME
