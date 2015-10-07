#!/bin/bash

DOCKER_MACHINE_IP=$(docker-machine ip local-docker)

docker run --rm --name vulcand \
-p 80:80 -p 443:443 \
-p 8182:8182 -p 8181:8181 \
mag3llan/m3n-vulcand \
-apiInterface=0.0.0.0 --etcd=http://$DOCKER_MACHINE_IP:2379