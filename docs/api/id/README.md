<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**content**

- [id服务用于统一管理生成可用ID列表](#id%E6%9C%8D%E5%8A%A1%E7%94%A8%E4%BA%8E%E7%BB%9F%E4%B8%80%E7%AE%A1%E7%90%86%E7%94%9F%E6%88%90%E5%8F%AF%E7%94%A8id%E5%88%97%E8%A1%A8)
    - [数据库主键ID获取](#%E6%95%B0%E6%8D%AE%E5%BA%93%E4%B8%BB%E9%94%AEid%E8%8E%B7%E5%8F%96)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## id服务用于统一管理生成可用ID列表
* domain: `api`
* feature: `id`

#### 数据库主键ID获取
* URL: `/allocate`
* Method:   GET
* 功能描述：根据表名获取一定数量的数据库主键ID。
* 请求参数： 
     
| 参数名称   | 参数类型  |是否必须 | 描述                                    
| ----------|---------- |------| ---------------------------|
| type   | string   |  是 | 数据库表名 |
| count   | int   |  是 | 需要的id数量|


* 返回参数：

* Example:

```json

     [100, 101, 102]

```
