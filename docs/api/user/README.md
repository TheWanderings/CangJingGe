<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**content**

- [用户管理](#docs/api/user/README.md)
    - [注册](#docs/api/user/README.md)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## 用户管理

#### 用户注册
* URL: `/register`
* Method:   POST
* 功能描述：用户注册。
* 请求参数： 
     
| 参数名称   | 参数类型  |是否必须 | 描述                                    
| ----------|---------- |------| ---------------------------|
| account   | string   |  是 | 用户名称 |
| email   | string   |  是 | email|
| password   | string   |  是 | 密码|
| image   | binary   |  否 | 头像|


* 返回参数：

* Example:

```json

     code:200

```

#### 用户登陆
* URL: `/login`
* Method:   POST
* 功能描述：用户登陆。
* 请求参数： 
     
| 参数名称   | 参数类型  |是否必须 | 描述                                    
| ----------|---------- |------| ---------------------------|
| email   | string   |  是 | email|
| password   | string   |  是 | 密码|


* 返回参数：

* Example:

```json

     code:200

```

#### 用户登出
* URL: `/logout`
* Method:   POST
* 功能描述：用户登陆。
* 请求参数： 
     
| 参数名称   | 参数类型  |是否必须 | 描述                                    
| ----------|---------- |------| ---------------------------|
| email   | string   |  是 | email|
| password   | string   |  是 | 密码|


* 返回参数：

* Example:

```json

     code:200

```

#### 忘记密码
* URL: `/miss_psw`
* Method:   POST
* 功能描述：忘记密码。
* 请求参数： 
     
| 参数名称   | 参数类型  |是否必须 | 描述                                    
| ----------|---------- |------| ---------------------------|
| email   | string   |  是 | email|


* 返回参数：

* Example:

```json

     code:200

```

