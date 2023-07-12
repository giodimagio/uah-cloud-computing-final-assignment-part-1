#!/bin/bash

#################### Commands used for the project ####################

# ------------------ Portainer ------------------ #

## Docker - pull - Pull Portainer latest image
docker pull portainer/portainer-ce:latest

## Docker - images - List and filter portainer images
docker images | egrep 'portainer|REPOSITORY'

## Docker - volume - Create volume named portainer_data
 docker volume create portainer_data

## Docker - volume - List and filter portainer volumes
docker volume ls | egrep 'portainer|VOLUME'

## Docker - run - Run Portainer container named portainer, with restart policy and with 2 volumes attached
docker run -d -p 8000:8000 -p 9443:9443 
    --name portainer 
    --restart=always 
    -v /var/run/docker.sock:/var/run/docker.sock 
    -v portainer_data:/data 
    portainer/portainer-ce:latest

## Docker - ps - List running containers
docker ps -a | egrep 'portainer|CONTAINER'

## Docker - stop - Stop Portainer container
docker container stop portainer

## Docker - container rm - Remove Portainer container
docker container rm portainer

## Docker - volume rm - Remove Portainer volume
docker volume rm portainer_data

## Docker - image rm - Remove Portainer image
docker image rm portainer/portainer-ce:latest
