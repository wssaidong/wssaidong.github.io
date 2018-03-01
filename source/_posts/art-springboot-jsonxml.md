---
title: springboot的rest接口返回格式
date: 2018-03-01 20:09:49
tags:
    - springboot
---

rest的返回格式可以通过produces属性进行设置

@RequestMapping

> consumes： 指定处理请求的提交内容类型（Content-Type），例如application/json, text/html;
>
> produces:    指定返回的内容类型，仅当request请求头中的(Accept)类型中包含该指定类型才返回；

```
@RequestMapping(value = "/", produces = arrayOf("application/xml", "application/json"))
```

query path以.json结尾就用json格式返回，以.xml结尾就以xml格式返回

测试，在浏览器上输入 [http://localhost:8080/student.xml?id=1](https://link.jianshu.com?t=http://localhost:8080/student.xml?id=1) 返回结果为:

```
<Student>
	<name>aaa</name>
	<age>10</age>
	<id>1</id>
</Student>

```

当输入[http://localhost:8080/student.json?id=1](https://link.jianshu.com?t=http://localhost:8080/student.json?id=1) 时返回如下:

```
{"name":"aaa","age":10,"id":1}
```