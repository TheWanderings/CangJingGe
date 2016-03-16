<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**content**

- [定义所有API接口](#%E5%AE%9A%E4%B9%89%E6%89%80%E6%9C%89api%E6%8E%A5%E5%8F%A3)
    - [请求格式定义:](#%E8%AF%B7%E6%B1%82%E6%A0%BC%E5%BC%8F%E5%AE%9A%E4%B9%89)
    - [返回格式定义:](#%E8%BF%94%E5%9B%9E%E6%A0%BC%E5%BC%8F%E5%AE%9A%E4%B9%89)
    - [id: id服务](#id-id%E6%9C%8D%E5%8A%A1)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 定义所有API接口

### 请求格式定义:
* 外网域名定为team-work.com(未注册,只作为规则使用)
* 内网域名定为internal.team-work.org
* url路径前缀为服务名,比如user服务的所有操作均为`/user/*`,但此为nginx分流参数(即服务内url定义不需要加入`/user`前缀)

### 返回格式定义:
* 遵守HTTP标准状态码定义
* 成功返回时(200),直接返回所需数据
* 出现错误时,消息体中附加json格式错误数据,如下

```json
{
    "error": "forbidden",
    "cause": "没有权限操作"
}
```

* 如无特殊说明,返回结果需要遵守上述规则
* 错误数据返回为可选(原因是405或者500等错误是web框架自动处理，不会遵守上述规则)

### [id](./id/): id服务