## 数据库设计文档

#### *tips 7.8.9表为区块链表，用于记录商品的产地、运输、销售信息，存放在区块链平台*


##

| 序号 | 表名                       | 中文名   | 表概述 |     
|----|--------------------------|-------|-----|
| 1  | web_user_detail          | 用户信息  |     |     
| 2  | web_commodity_detail     | 商品信息  |     |     
| 3  | web_user_coupons         | 优惠劵   |     |     
| 4  | web_user_orders          | 订单    |     |     
| 5  | web_user_message         | 消息    |     |     
| 6  | sys_user_view            | 评论    |     |     
| 7  | sys_blockchain_origin    | 区块链产地 |     |     
| 8  | sys_blockchain_transport | 区块链运输 |     |     
| 9  | sys_blockchain_sell      | 区块链销售 |     |     


### 1.web_user_detail

| 字段名           | 数据类型         | 说明        | 备注        |
|---------------|:-------------|-----------|-----------|
| user_id       | bigint       | 主键        | 自增(第X位注册) |
| nickname      | varchar(32)  | 昵称        |           |
| pwd           | varchar(60)  | 密码        | 用于进行认证    |
| profile_image | varchar(500) | 头像路径      |           |
| age           | varchar(2)   | 年龄        |           |
| love          | varchar(100) | 爱好        |           |
| sex           | varchar(2)   | 性别        | 0:男 1:女   |
| phone         | varchar(11)  | 手机号       |           |
| create_time   | datetime     | 创建时间/注册时间 |           |
| update_time   | datetime     | 上一次的更新时间  |           |
| permission    | int          | 权限状态      | 0正常 1禁用   |
| address       | varchar(255) | 地址        | 多个以,结尾    |


### 2.web_commodity_detail

| 字段名             | 数据类型         | 说明        | 备注      |
|-----------------|--------------|-----------|---------|
| commodity_id    | bigint       | 主键        |         |
| partition_id    | bigint       | 对应分级      |         |
| commodity_price | float        | 价格        | 默认值     |
| commodity_name  | varchar(20)  | 商品名称      |         |
| remark          | varchar(100) | 商品备注      |         |
| profile_image   | varchar(500) | 展示图片路径    |         |
| origin          | varchar(20)  | 产地        |         |
| selling         | 100          | 销售量       |         |
| expiration_flag | int          | 是否临期      | 0正常 1临期 |
| expiration_time | int          | 保质期       |         |
| create_time     | datetime     | 创建时间/注册时间 |         |
| update_time     | datetime     | 上一次的更新时间  |         |
| permission      | int          | 权限状态      | 0正常 1禁用 |


### 3.web_user_coupons

| 字段名             | 数据类型         | 说明        | 备注      |
|-----------------|--------------|-----------|---------|
| coupons_id      | bigint       | 主键        | 自增      |
| coupons_name    | varchar(20)  | 说明        |         |
| expiration_time | int          | 保质期       |         |
| price           | double       | 价格        |         |
| expiration_flag | int          | 是否到期      | 0正常 1过期 |
| reduction_full  | int          | 满减数量      |         |
| reduction_price | int          | 满减价格      |         |
| user_id         | int          | 用户编号      |         |
| create_time     | datetime     | 创建时间/注册时间 |         |
| update_time     | datetime     | 上一次的更新时间  |         |
| permission      | int          | 权限状态      | 0正常 1禁用 |



### 4.web_user_orders

| 字段名          | 数据类型     | 说明        | 备注       |
|--------------|----------|-----------|----------|
| orders_id    | bigint   | 主键        | 自增       |
| user_id      | bigint   | 用户id      |          |
| commodity_id | bigint   | 商品id      |          |
| date         | datetime | 完成时间      |          |
| flag         | int      | 是否完成交易    | 0完成 1未完成 |
| price        | double   | 价格        |          |
| quantity     | double   | 数量        |          |
| create_time  | datetime | 创建时间/注册时间 |          |
| update_time  | datetime | 上一次的更新时间  |          |
| permission   | int      | 权限状态      | 0正常 1禁用  |



### 5.web_user_message

| 字段名          | 数据类型         | 说明        | 备注              |
|--------------|--------------|-----------|-----------------|
| message_id   | bigint       | 主键        | 自增              |
| user_id      | bigint       | 用户id      | 100001代表为系统消息   |
| chat_flag    | int          | 对话者       | 0系统 1客服         |
| chat_name    | varchar(20)  | 客服名       | 备用              |
| chat_context | varchar(100) | 聊天内容      |                 |
| create_time  | datetime     | 创建时间/注册时间 |                 |
| update_time  | datetime     | 上一次的更新时间  |                 |
| permission   | int          | 权限状态      | 0正常 1禁用         |
| title        | varchar(100) | 标题        | 当chat_flag为0时使用 |
| url          | varchar(255) | 网站地址      | 当chat_flag为0时使用 |



### 6.sys_user_view

| 字段名          | 数据类型         | 说明        | 备注        |
|--------------|--------------|-----------|-----------|
| view_id      | bigint       | 主键        | 自增        |
| commodity_id | bigint       | 商品id      |           |
| user_id      | bigint       | 用户id      |           |
| view_context | varchar(100) | 评论内容      |           |
| love_flag    | bigint       | 是否好评      | 0好评 1差评   |
| create_time  | datetime     | 创建时间/注册时间 |           |
| permission   | int          | 权限状态      | 0正常 1禁用   |
| audit_flag   | int          | 是否审核      | 0未审核 1已审核 |

### 7.sys_blockchain_origin

| 字段名                 | 数据类型        | 说明      | 备注                                                                                             |
|---------------------|-------------|---------|------------------------------------------------------------------------------------------------|
| commodity_id        | int         | 商品id !  |                                                                                                |
| commodity_name      | varchar(20) | 商品名称 !  |                                                                                                |
| origin              | varchar(40) | 产地      |                                                                                                |
| origin_x            | int         | 产地的经度坐标 |                                                                                                |
| origin_y            | int         | 产地的纬度坐标 |                                                                                                |
| commodity_partition | varchar(40) | 作物类型    |                                                                                                |
| bagging             | int         | 是否套袋    | 0是,1否                                                                                          |
| grow_time           | int         | 育苗周期    | 单位:天                                                                                           |
| irrigate_time       | int         | 灌溉周期    | 单位:天                                                                                           |
| fertilizer_time     | int         | 施肥周期    | 单位:天                                                                                           |
| weeding_time        | int         | 除草周期    | 单位:天                                                                                           |
| temperature         | int         | 温度(摄氏度) |                                                                                                |
| farming             | varchar(20) | 种植方法    | Organic farming: 有机种植，Greenhouse farming: 温室种植，Hydroponic farming: 水培种植，Vertical farming: 垂直种植 |
| picking_time        | datetime    | 采摘时间    |                                                                                                |
| remark              | varchar(40) | 备注      |                                                                                                |
| supervisor          | varchar(20) | 负责人 !   |                                                                                                |

### 8.sys_blockchain_transport

| 字段名                 | 数据类型        | 说明      | 备注         |
|---------------------|-------------|---------|------------|
| commodity_id        | bigint      | 商品id  ! |
| commodity_name      | varchar(20) | 商品名称  ! |
| commodity_transport | varchar(20) | 运输方式    |            |
| transport_time      | datetime    | 运输时间    |            |
| transport_x         | int         | 运输的经度坐标 |            |
| transport_y         | int         | 运输的纬度坐标 |            |
| remark              | varchar(40) | 备注      |            |
| transport_status    | int         | 运输状态    | 0运输完成 1运途中 |
| supervisor          | varchar(20) | 负责人 !   |

### 9.sys_blockchain_sell
| 字段名            | 数据类型         | 说明       | 备注 |
|----------------|--------------|----------|----|
| commodity_id   | bigint       | 商品id  !  |
| commodity_name | varchar(20)  | 商品名称  !  |
| sell_time      | datetime     | 销售时间     |
| test_result    | int          | 0合格 1不合格 |
| remark         | varchar(40)  | 备注       |
| test_picture   | varchar(255) | 质检图片地址   |
| supervisor     | varchar(20)  | 负责人 !    |
