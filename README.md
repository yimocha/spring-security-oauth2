# Spring Cloud Security Oauth2.0
Spring 提供的 Spring Security oAuth2 能搭建一套验证授权及资源访问服务，帮助大家在实现企业微服务架构时能够有效的控制多个服务的统一登录、授权及资源保护工作。

这里只是一个简单的案例基础，我自己是参照 [千峰李哥的博客](https://www.funtl.com) 上面的笔记来学习的，通过自己的整理与案例学习，综合出了一个自己风格的项目

[李哥视频教程](https://www.bilibili.com/video/av48590637)

[Spring Cloud Security Oauth2.0项目源码](https://github.com/Tellsea/spring-security-oauth2)

**支持作者的话，点一下Star，顺便Fork**🎉

## 什么是 oAuth

oAuth 协议为用户资源的授权提供了一个安全的、开放而又简易的标准。与以往的授权方式不同之处是 oAuth 的授权不会使第三方触及到用户的帐号信息（如用户名与密码），即第三方无需使用用户的用户名与密码就可以申请获得该用户资源的授权，因此 oAuth 是安全的。

## 什么是 Spring Security

Spring Security 是一个安全框架，前身是 Acegi Security，能够为 Spring 企业应用系统提供声明式的安全访问控制。

Spring Security 基于 Servlet 过滤器、IoC 和 AOP，为 Web 请求和方法调用提供身份确认和授权处理，避免了代码耦合，减少了大量重复代码工作。

## 名词解释

| 名词 | 英文| 说明 |
|:--|:--|:--|
| 第三方应用程序 | Third-party application | 又称之为客户端（client），比如上节中提到的设备（PC、Android、iPhone、TV、Watch），我们会在这些设备中安装我们自己研发的 APP。又比如我们的产品想要使用 QQ、微信等第三方登录。对我们的产品来说，QQ、微信登录是第三方登录系统。我们又需要第三方登录系统的资源（头像、昵称等）。对于 QQ、微信等系统我们又是第三方应用程序 |
| HTTP 服务提供商 | HTTP service |  QQ、微信等都可以称之为“服务提供商” |
| 资源所有者 | Resource Owner |  又称之为用户（user） |
| 用户代理 | User Agent |  比如浏览器，代替用户去访问这些资源 |
| 认证服务器 | Authorization server |  即服务提供商专门用来处理认证的服务器，简单点说就是登录功能（验证用户的账号密码是否正确以及分配相应的权限） |
| 资源服务器 | Resource server |  即服务提供商存放用户生成的资源的服务器。它与认证服务器，可以是同一台服务器，也可以是不同的服务器。简单点说就是资源的访问入口 |

## 交互过程

oAuth 在 "客户端" 与 "服务提供商" 之间，设置了一个授权层（authorization layer）。"客户端" 不能直接登录 "服务提供商"，只能登录授权层，以此将用户与客户端区分开来。

"客户端" 登录授权层所用的令牌（token），与用户的密码不同。用户可以在登录的时候，指定授权层令牌的权限范围和有效期。"客户端" 登录授权层以后，"服务提供商" 根据令牌的权限范围和有效期，向 "客户端" 开放用户储存的资料。

![在这里插入图片描述](https://github.com/Tellsea/spring-security-oauth2/blob/master/doc/images/1.png)

上面的笔记简要，也是来自李哥的 [Spring-Security-oAuth2](https://www.funtl.com/zh/guide/Spring-Security-oAuth2.html)，这里简要的理解一下就可以了，更多的知识通过实战去学习

## 核心依赖

```yml
<dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-starter-oauth2</artifactId>
</dependency>
```

从下图中不难看出，我们不需要像官网上的一样导入`spring-cloud-starter-security`和`spring-security-oauth2-autoconfigure`，直接导入`spring-cloud-starter-oauth2`就够了

![在这里插入图片描述](https://github.com/Tellsea/spring-security-oauth2/blob/master/doc/images/0.png)

## 启动

1. 在`doc/sql`文件夹中有两个数据库，一个是认证服务器的数据库`oauth2_server.sql`，另一个是资源服务器的数据库`oauth2_resource.sql`

3. 修改两个子模块的`application.yml`文件的数据库配置

4. 运行两个项目的启动类即可进行测试，下面是测试案例

## 测试案例

首先通过浏览器访问下面的地址获取授权码
```
http://localhost:8080/oauth/authorize?client_id=client&response_type=code
```
然后登录的账号是：admin ，密码是：123456，这个可以自己修改数据库的

成功之后进入授权类型的选择，选择第一个单选按钮，点击下面的按钮，然后会回调一个地址，比如
```
https://www.baidu.com/?code=8vmUft
```
后面的参数code的值就是授权码：8vmUft

接下来根据授权码申请令牌

![在这里插入图片描述](https://github.com/Tellsea/spring-security-oauth2/blob/master/doc/images/2.png)

从上面的响应结果中可以拿到令牌`access_token`，这个非常重要

携带令牌访问资源服务器，最终得到资源服务器的数据

![在这里插入图片描述](https://github.com/Tellsea/spring-security-oauth2/blob/master/doc/images/3.png)

## 交流学习
![在这里插入图片描述](https://github.com/Tellsea/springboot-learn/blob/master/doc/images/emoticon1.jpg)
![交流学习](https://github.com/Tellsea/springboot-learn/blob/master/doc/images/qq-group.png)
