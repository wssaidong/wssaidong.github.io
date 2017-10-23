---
title: 七牛CDN加速github pages
date: 2016-08-01 22:13:36
tags:
    - qiniu
    - github

---

在国外的github pages真的好慢，而且分分钟被墙。为了加快访问速度，我决定使用[七牛](http://www.qiniu.com/)云存储给网页加速。

## 注册一个七牛云的账号
> 七牛免费提供10G存储空间，可以做[图床](http://caishaodong.17lephone.com/2016/07/31/tuchuang/)又可以加速博客。
## 注册后添加资源
![](http://ob5tof7al.bkt.clouddn.com/16-8-1/55479058.jpg)
## 设置镜像存储
> 镜像存储设置为需要加速的域名，这个域名的内容会被缓存到这个存储空间，做为以后加速使用
![](http://ob5tof7al.bkt.clouddn.com/16-8-1/9259612.jpg)
## 添加CDN域名
> 使用自定义域名，此域名需要自己申请，并备案，填写自己的域名后，并且CNAME到七牛提供的二级域名后，访问自己的自定义域名，便可加速访问到CDN缓存的资源。
![](http://ob5tof7al.bkt.clouddn.com/16-8-1/52278361.jpg)