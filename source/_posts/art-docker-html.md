---
title: 使用docker部署html页面
date: 2018-04-18 11:09:35
tags:
    - docker
    - nginx
    - html
---

使用Dockerfile构建一个可以运行html的容器

Dockerfile 内容

```
FROM nginx:latest
run rm -rf /usr/share/nginx/html
copy /html /usr/share/html
copy cfg /etc/nginx/conf.d
CMD ["nginx", "-g", "daemon off;"]
```

目录结构

```
\
--html
--cfg
Dockerfile
```

/html 为html页面目录

cfg 为nginx配置文件路径

