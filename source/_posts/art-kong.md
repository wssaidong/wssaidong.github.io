---
title: kong(Gateway)部署docker
date: 2018-03-07 14:13:08
tags:
    - kong
    - docker
---

[kong](https://docs.docker.com/samples/library/kong/#1-link-kong-to-either-a-cassandra-or-postgresql-container) docker 文档

在阿里云的容器服务下安装kong

![](http://ob5tof7al.bkt.clouddn.com/18-3-7/95955707.jpg)

### kong-db 安装

    version: '1.0'
    services:
      kong-database:
        image: postgres:9.4
        environment:
          - POSTGRES_USER=kong
          - POSTGRES_DB=kong
### Prepare kong-db 

```
docker run --rm \
    -e "KONG_DATABASE=postgres" \
    -e "KONG_PG_HOST={IP}" \
    -e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" \
    kong kong migrations up
```

### kong 安装

```
kong:
  	restart: always
  	ports:
		-'xxx:xxx/tcp'
		-'xxx:xxx/tcp'
  	environment:
		-KONG_PG_HOST={IP}
		-KONG_PG_DATABASE=kong
		-KONG_ADMIN_LISTEN='0.0.0.0:xxx'
		-KONG_ADMIN_LISTEN_SSL='0.0.0.0:xxx'	

```

### kong-admin 安装

```
kong-admin:
  restart: always
  ports:
    - 'xxx:xxx/tcp'
  image: 'pantsel/konga:latest'
```



