---
title: 在 Cent OS 7 上安装 docker-ce
date: 2018-04-16 10:54:38
tags:
    - docker-ce
    - centos7
---



###  安装 yum-utils，它提供了 yum-config-manager，可用来管理yum源

> sudo yum install -y yum-utils

###  添加yum源

> sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

### 更新索引

> sudo yum makecache fast

###  安装 docker-ce

> sudo yum install docker-ce

###  启动 docker

> sudo systemctl start docker

### 验证是否安装成功

> sudo docker info

