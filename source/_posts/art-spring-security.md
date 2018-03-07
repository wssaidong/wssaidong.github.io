---
title: spring-security自定义登录页
date: 2018-10-12 16:28:41
tags:
    - spring-security
---

### 添加login.ftl

```
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>微服务统一认证</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/signin.css" rel="stylesheet">
  </head>
  <body>
    <div class="container form-margin-top">
      <form class="form-signin" action="/authentication/form" method="post">
        <h2 class="form-signin-heading" align="center">统一认证系统</h2>
        <input type="text" name="username" class="form-control form-margin-top" placeholder="账号" required autofocus>
        <input type="password" name="password" class="form-control" placeholder="密码" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">sign in</button>
      </form>
    </div>
  </body>
</html>

```

### 使用注解的方式进行配置

创建SecurityConfigurerAdapter

```
@Configuration
@EnableWebSecurity
public class SecurityConfigurerAdapter extends WebSecurityConfigurerAdapter {

    @Override
    public void configure(HttpSecurity http) throws Exception {
    	ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry registry =
                http.formLogin()
                        .loginPage("/authentication/require")
                        .loginProcessingUrl("/authentication/form")
                        .and()
                        .authorizeRequests();
        registry.anyRequest().authenticated()
                .and()
                .csrf().disable();
    }
}
```

login-page指定的用户自定义的登录页面

default-target-url登录成功以后默认跳转到的页面

authentication-failure-url登录失败以后跳转到的页面

username-parameter指定登录表单中用户名的input中name，如果这里不配置，则默认为username

password-parameter指定登录表单中密码的input中name，如果这里不配置，则默认为password

logout-success-url成功退出以后跳转到的地址