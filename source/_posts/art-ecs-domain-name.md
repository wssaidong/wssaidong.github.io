---
title: 阿里云域名解析
date: 2017-11-29 14:04:07
tags:
    - ecs
    - dns
---



购买ecs后，一般所有的ecs都会配备一个外网IP，通过IP地址我们可以访问到我们部署到ecs的服务，但是这个一个长的IP地址怎么能记得住呢，这个时候我们就需要一个域名。

通过阿里云-[万网](https://wanwang.aliyun.com/?spm=5176.10695662.765261.238.5741366ikaTqx) 购买自己喜欢的域名，购买ecs一般也会送域名。

购买域名后进入域名的dns 解析配置页面，就可以进行配置。

我们一般会配置什么呢？在我看来，我一般会配置以下几个记录。

![](http://ob5tof7al.bkt.clouddn.com/17-11-29/26191885.jpg)



CNAME  可以将域名指向另外一个域名，所以我把自己的域名解析到我的github博客，这样就有一个属于自己个性话域名的博客了 http://blog.caishaodong.top

想知道怎么搭建一个自己个性的博客 blog 请参考一下博文

个人博客搭建之旅

- http://blog.caishaodong.top/2016/07/21/art-blog/ 
- http://blog.caishaodong.top/2016/07/23/art-blog-2/

A 记录我配置了两个

@ 记录是指域名不需要www就可以访问到一个含有外网地址的主机

www 记录则是需要www前缀的域名访问

