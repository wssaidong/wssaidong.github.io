---
title: 安装docker-swarm和portainer
date: 2018-04-16 10:54:38
tags:
    - docker-swarm
    - portainer
---



>- swarm init
>- docker pull portainer/portainer
>- docker volume create portainer_data
>-  docker service create     --name portainer     --publish 9000:9000     --constraint 'node.role == manager'     --mount type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock     portainer/portainer     -H unix:///var/run/docker.sock

