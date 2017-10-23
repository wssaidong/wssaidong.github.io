---
title: 统一日志收集
date: 2016-08-28 17:29:00
categories: 架构
tags:
    - 日志收集
    - log
    - elk
    
---

搭建统一日志收集系统

## 基础部件
[elastic官网](https://www.elastic.co/)
[logstash](https://www.elastic.co/downloads/logstash) 收集、过滤日志
[ElasticSearch](https://www.elastic.co/downloads/elasticsearch) 全文搜索服务
[kibana](https://www.elastic.co/downloads/kibana) 数据展示

## 解压

> tar -zxvf *.tar

## 启动

### elasticsearch
 - 后台启动
> nohup ./elasticsearch &

### logstash
 - 创建配置
> vi logstash.conf
 
```conf
 input {
 	tcp {
 		port => 5678
 	}
 
 }
 
 filter {
 
 }
 
 output {
 	elasticsearch {
 		hosts => ["localhost:9200"]
 	}
 	stdout { codec => rubydebug }
 }
```

 - 后台启动
> nohup ./logstash -f logstash.conf &

### kibana
 - 后台启动
> setsid ./kibana