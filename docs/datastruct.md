##用户

| 名称     | 类型        | 是否可选 | 说明               |
|----------|-------------|----------|--------------------|
| uid      | string      | 否       | 用户唯一id         |
| account  | string      | 是       | 用户账号，全局唯一 |
| email    | string      | 否       | 用户email,全局唯一 |
| password | string      | 否       | 加密密码           |
| nick     | string      | 是       | 昵称               |
| image    | string(URL) | 是       | 头像链接           |

##工程
| 名称        | 类型        | 是否可选 | 说明                     |
|-------------|-------------|----------|--------------------------|
| name        | string      | 否       | 工程名称                 |
| pid         | string      | 否       | 工程ID                   |
| owner       | string      | 否       | 归属用户ID(uid)          |
| description | string      | 否       | 工程描述                 |
| staff       | uid list    | 是       | 相关用户列表(负责人列表) |
| image       | string(URL) | 是       | 用户可以为工程设置图片   |

##功能点
| 名称        | 类型     | 是否可选 | 说明                     |
|-------------|----------|----------|--------------------------|
| name        | string   | 否       | 功能点名称               |
| fid         | string   | 否       | 功能点ID                 |
| projectId   | string   | 否       | 归属的工程id             |
| description | string   | 否       | 功能点描述               |
| staff       | uid list | 否       | 相关用户列表(负责人列表) |

##步骤
| 名称        | 类型         | 是否可选 | 说明                       |
|-------------|--------------|----------|----------------------------|
| name        | string       | 否       | 步骤名称                   |
| sid         | string       | 否       | 步骤id                     |
| functionId  | string       | 否       | 归属功能点id               |
| description | string       | 否       | 工程描述                   |
| staff       | uid list     | 是       | 相关用户列表(负责人列表)   |
| time        | long         | 否       | 工期(秒数)                 |
| status      | ENUM         | 否       | 当前状态                   |
| deadline    | time         | 否       | 截止时间                   |
| requirement | sid list     | 是       | 依赖功能点列表             |
| commentList | comment list | 是       | 评论列表，说明工程完成情况 |
