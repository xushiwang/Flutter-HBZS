# 海滨助手Flutter
<p>
<img alt="GitHub Issues" src="https://img.shields.io/github/issues/xushiwang/Flutter-HBZS">
</p>

## 特别鸣谢


### 功能简介
- 首页
1. 动态信息展示（待优化）
2. 发布动态
3. 校内新闻(已完成)
 
- 课表
> 实现了课表的自定义编辑
1. 我的课表(已完成)
2. 情侣课表(已完成)

- 消息
1. 接受学院通知消息
2. 接受软件系统消息

- 我的
1. 四六级查询(已完成)
2. 成绩查询(已完成)
3. 考试查询(已完成)
4. 补考查询(已完成)
5. 校历查询
6. 各院系联系方式
7. 精选好物
 - 更多(侧拉抽屉)
1. 编辑资料
2. 帐号与安全
3. 通知设置
4. 隐私
5. 清理缓存(已完成)
6. 鼓励一下(已完成)
7. 关于我们(已完成)
8. 反馈与建议(待优化)

### 后台接口与架构
#### 后台接口
请看代码
#### 架构方案1
> 采用官方接口:两台服务器能够在公网提供正常的接口服务,采用虚拟ip进行故障转移的处理,双机器安装keepalived
#### 架构方案2
> 内网自己建设服务器2台,需要具备可以访问内网资源的条件;两台web服务器部署在DMZ区域提供接口服务,需要可以访问公网,并且做nginx负载均衡实现内网机器的高可用,两外安装keepalived进行ip的漂移,实现高可以用.

### 更新日志
- 优化编辑课表  20200307
- 优化隐私设置  20200310
- 添加WebVPN  20200322
- 中期答辩完成 20200412
- 项目Ubuntu迁移Windows完成 20200414
- 完善退出登录 20200414
- 完成系统消息的获取 20200424
- 访客身份、共享全局变量 20200426
- 上传头像功能完成 20200510
