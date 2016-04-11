<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**content**

- [用户管理](#用户管理)
    - [注册](#用户注册)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## 用户管理
* domain: `api`
* feature: `user`

#### 用户注册
* URL: `/register`
* Method:   POST
* Description：用户注册。
* Args： 
     
| 参数名称   | 参数类型  |是否必须 | 描述                                    
| ----------|---------- |------| ---------------------------|
| account   | string   |  是 | 用户名称 |
| email   | string   |  是 | email|
| password   | string   |  是 | 密码|
| image   | binary   |  否 | 头像|


* Return： VOID


#### 用户登陆
* URL: `/login`
* Method:   POST
* Description：用户登陆。
* Args： 
     
| 参数名称   | 参数类型  |是否必须 | 描述                                    
| ----------|---------- |------| ---------------------------|
| email   | string   |  是 | email|
| password   | string   |  是 | 密码|

* Return：VOID, headers中加入`token`


#### 用户登出
* URL: `/logout`
* Method:   POST
* Description：用户登出。
* Args： 
     
| 参数名称   | 参数类型  |是否必须 | 描述                                    
| ----------|---------- |------| ---------------------------|
| email   | string   |  是 | email|
| password   | string   |  是 | 密码|

* Return：VOID

#### 提交注册邮箱
* URL: `/send_mail_addr`
* Method:   POST
* 功能描述：用于忘记密码时提交注册邮箱再重新设置密码。
* 请求参数： 
     
| 参数名称   | 参数类型  |是否必须 | 描述                                    
| ----------|---------- |------| ---------------------------|
| email   | string   |  是 | email|


* 返回参数：VOID

#### 修改密码
* URL: `/modify_psw`
* Method:   POST
* 功能描述：修改密码。
* 请求参数： 
     
| 参数名称   | 参数类型  |是否必须 | 描述                                    
| ----------|---------- |------| ---------------------------|
| email   | string   |  是 | email|
| old_password   | string   |  是 | 原来密码|
| new_password   | string   |  是 | 新密码|


* 返回参数：VOID

####  重置密码
* URL: `/reset_psw`
* Method:   POST
* 功能描述：用于忘记密码时重新设置密码。
* 请求参数： 
     
| 参数名称   | 参数类型  |是否必须 | 描述                                    
| ----------|---------- |------| ---------------------------|
| email   | string   |  是 | email|
| new_password   | string   |  是 | 新密码|


* 返回参数：VOID
