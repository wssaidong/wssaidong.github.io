---
title:  docker 成长之路
date: 2017-10-17 11:41:29
tags:
---



### Docker 映像命名规范

> NameSpace/Repository:Version

### 构建

> $docker build -t saravasu/techietweak:001 .

### 映像

> $docker images

### 运行容器

> $docker run -d -p 8080:8080 saravasu/techietweak:001

### 查看容器

> docker ps -a

### 进入容器

> $docker exec -it containerId /bin/bash

> $docker stop <containername>

### 删除镜像

> $docker rm imageId

> $docker rmi -f <List Of Image Ids>

> $docker rmi -f $(docker images | tr -s ' ' ' ' | cut -d' ' -f3)

### 查看日志

> docker logs -f --tail 100 <containername>

### Docker service

### 初始化docker swarm
> docker swarm init

### 初始化docker join
> docker swarm join


### 创建network
> docker network create -d overlay --subnet=192.168.66.0/24 [name]

### 创建mysql volumn

> docker volume create mysqlconfig

> docker volume create mysqldata

### 创建mysql
---
docker service create --with-registry-auth --network [name] --name mysql \
 -e MYSQL_ROOT_PASSWORD= \
 -p 3306:3306 \
 --constraint 'node.role == manager' \
 --mount type=volume,source=mysqlconfig,destination=/etc/mysql \
 --mount type=volume,source=mysqldata,destination=/var/lib/mysql \
 --log-opt max-size=100m --log-opt max-file=3  mysql:5.6.36

---

### redis
> docker service create --with-registry-auth --network [name] --name redis redis
