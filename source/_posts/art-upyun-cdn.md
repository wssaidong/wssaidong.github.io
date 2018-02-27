---
title: 使用又拍云的cdn加速GitHub Pages
date: 2018-02-27 17:08:27
tags:
    - upyun
    - cdn
    - gitpages
---



在GitHubPages上搭建个人博客后,你会发现Github屏蔽百度爬虫导致在Github Pages上托管的博客、网站都无法被百度索引到。

那么小编想到的是用CDN来加速自己博客，我采用的是[又拍云](https://www.upyun.com/)的CDN。

![](http://ob5tof7al.bkt.clouddn.com/18-2-27/33066863.jpg)

我们需要创建一个CDN 服务

- 服务名称自定义一个唯一的即可
- 加速域名(填写github pages 的自定义域名，并不是github 分配的那个 xxx.github.io)
- 源站地址(填写xxx.github.io github默认分配的域名)

这样 一个CDN 服务就建立成功。

然后我们需要配置自己的域名的DNS

![](http://ob5tof7al.bkt.clouddn.com/18-2-27/61176403.jpg)

这里需要的是把加速域名指向又拍云CDN分配给你的域名

![](http://ob5tof7al.bkt.clouddn.com/18-2-27/44600514.jpg)

最后需要的是配置github pages 的自定义域名

![](http://ob5tof7al.bkt.clouddn.com/18-2-27/58301774.jpg)

等所有配置都生效后，你会发现现在的网站来源改变了。

![](http://ob5tof7al.bkt.clouddn.com/18-2-27/22797715.jpg)