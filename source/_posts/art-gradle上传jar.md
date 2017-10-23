---
title: gradle构建jar包上传maven私服
date: 2016-08-13 20:46:00
categories: 持续集成
tags:
    - gradle
    - jenkins
    
---

目标
> 在jenkins构建项目的时候把项目接口部分打成jar上传到maven私服。

## gradle配置

### 添加构建jar包的task
``` 
    group = '***'
    version = '1.0.1'
    def artifactId="***"
            ·
            ·
            ·
    task releaseApiJar(type:Jar) {
        classifier = 'api'
        from sourceSets.api.output
    }
```
### 添加上传maven私服的插件
```
    artifacts{
            archives releaseApiJar
    }
    
    dependencies{
        ·
        ·
        ·
        uploadArchives(){
            repositories{
                mavenDeployer{
                    repository(url: "http://path/nexus/content/repositories/releases/"){
                        authentication(userName: "***",password: "***")
                    }
                    pom.version="$project.version"
                    pom.groupId="$project.group"
                    pom.artifactId="$artifactId"
                }
            }
         }
    
    }
```
### 修改jenkins配置
![](http://i2.piimg.com/567571/080478d0b75c2e44.png)

好的！这样jenkins执行发布前就可以自动上传jar包了！
