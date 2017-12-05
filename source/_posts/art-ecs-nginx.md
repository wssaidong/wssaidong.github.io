---
title: nginx 配置
date: 2017-12-04 10:03:04
tags:
    - nginx
---



nginx 是服务端必不可少的中间件，使用nginx的反向代理，我们可以做负载均衡，我们也可以使用nginx作为静态资源的容器。

下面我们展示一下比较常见的nginx配置

### 反向代理

```
  location = / {
        rewrite  ^/    http://localhost;

   }

    location ^~ /fcl/ {
        proxy_pass   http://localhost;
        proxy_cookie_path /fcl /;
        proxy_redirect             off;
        #后端的Web服务器可以通过X-Forwarded-For获取用户真实IP
        proxy_set_header           Host $host;
        proxy_set_header           X-Real-IP $remote_addr;
        proxy_set_header           X-Forwarded-For $proxy_add_x_forwarded_for;

    }

```

### 静态资源

```
server {
        listen       80;
        server_name  localhost;
        location / {
            root   html;
            index  index.html index.htm;
        }
        
        location /image/ {
            root   /usr/local/myImage/;
            autoindex on;
        }

    }
```
###  常用命令

```
nginx -s stop
nginx -s start
nginx -s reload
nginx -c nginx.conf
nginx -t
```

