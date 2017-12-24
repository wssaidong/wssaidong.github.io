---
title: swarm配置
date: 2017-12-06 13:52:04
tags:
    - swarm
    - docker
---

ecs安装好docker服务后，我们需要配置swarm集群。

```
初始化
docker swarm init
docker swarm join
创建network
docker network create -d overlay --subnet=192.168.66.0/24 [name]
```

我们采用docker后，当容器销毁后再创建，我们会发现数据是不存在的，所以我们再这里要用到volumn

```
mysql 创建实例
docker volume create mysqlconfig
docker service create --with-registry-auth --network [name] --name mysql \
 -e MYSQL_ROOT_PASSWORD= \
 -p 3306:3306 \
 --constraint 'node.role == manager' \
 --mount type=volume,source=mysqlconfig,destination=/etc/mysql \
 --mount type=volume,source=mysqldata,destination=/var/lib/mysql \
 --log-opt max-size=100m --log-opt max-file=3  mysql:5.6.36
```

使用swarm后，我们需要安装可视化的界面进行swarm的管理，在这里我采取https://portainer.io/

```
$ docker service create \
--name portainer \
--publish 9000:9000 \
--replicas=1 \
--constraint 'node.role == manager' \
--mount type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock \
portainer/portainer \
-H unix:///var/run/docker.sock

```

![](http://ob5tof7al.bkt.clouddn.com/17-12-6/32112836.jpg)