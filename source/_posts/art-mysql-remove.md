---
title: linux 删除mysql
categories: mysql
date: 2016-07-24 22:05:32
tags: 
    - mysql
---

## 移除mysql
- yum remove mysql

## 移除dbbase
- rm -rf /var/lib/mysql

## 移除配置
- rm /etc/my.cnf

## 是否还有mysql软件
rpm -qa|grep mysql
