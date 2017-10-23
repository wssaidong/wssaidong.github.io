---
title: 门铃服务设计
date: 2016-09-14 16:38:10
categories: 设计
tags:
    - mq
    - mqtt
    - 物联网
    - iot
---

## 门铃服务设计

### 无反馈形式

#### 拓扑图
![拓扑](http://i2.buimg.com/567571/3c61ed7ba47b72c5.png)
> 门禁设备发送房号到服务器；
服务器根据房号数据，推送个推到手机和TV；
手机和TV接收到个推信息后，弹出视频窗口；
手机点击一键开门后，服务器发送开门指令到门禁设备；
服务器通过个推发送关闭弹屏指令。

---
> 
缺点
- 关闭弹屏消息通过个推发送，延迟，不可靠
- 关闭逻辑入侵大

---
相关代码入口：
IOpenDoorService.openByDoorBell

### mqtt 广播形式

#### 拓扑图
![](http://i4.piimg.com/567571/7ce9cbbd4d306ef5.png)

> 门禁设备发送房号到服务器；
服务器根据房号数据，推送个推到手机和TV；
**手机根据推送过来的门禁设备号，监听二级topic,/DoorBell/${deviceSn}
手机点击一键开门后，调用Htpp 接口，发送指令到服务器，服务器，把指令推送到
MQ服务，通过订阅，消费者订阅指令后，发送指令到门禁设备** 


---
> mqtt 接入方式
 - [app](https://help.aliyun.com/document_detail/42421.html?spm=5176.doc29546.6.157.XBv9z1)
 - [服务端](https://help.aliyun.com/document_detail/42424.html?spm=5176.doc42421.6.160.m1IveT)

---

> 
优点：
- 指令在公有通道流转
- 指令操作共享，可自行操作业务，减少个推依赖

---

>
 缺点：
- MQ 依赖高
- 订阅消耗高
- 指令发送流转复杂





