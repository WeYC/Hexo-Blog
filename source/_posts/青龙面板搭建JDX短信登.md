---
title: 青龙面板搭建JDX短信登
date: 2022-03-04 21:58:32
tags: ["学习","折腾","青龙面板"]
categories: "青龙面板"
---

 <!-- more -->

[JDX地址](https://github.com/wangyiidii/jdx)

## 安装说明

本项目已打包成`docker`镜像，拉取配置即可使用

### 1.🐋拉取并运行docker

```shell
docker run -d \
    # 配置文件生成路径
    -v <config dir>:/jdx/config \
    -p <port>:80 \
    --restart=always \
    --name jdx registry.cn-hangzhou.aliyuncs.com/yiidii-hub/jdx:v0.2.1
```

>这里命令自行替换卷和端口映射
>
>例如：
>
>```shell
>docker run -d \
>  -v  /data/jdx/config:/jdx/config \
>  -p 5702:80 \
>  --restart=always \
>  --name jdx registry.cn-hangzhou.aliyuncs.com/yiidii-hub/jdx:v0.2.1
>```

注意：

- 记得放行端口

- 2. 访问

  这时候访问 `http://ip:port/` 就能访问了

  ### 3. 后台登录

  访问 `http://ip:port/admin` 首次登录用户名：`admin`, 密码：`123465`, **千万记得修改密码！！！！！**

  ## 📃 使用说明

  1. QL配置只能删除和新增，不能编辑操作
  2. 所有涉及编辑和删除的操作，左滑即可（就像微信删除最近联系人一样...）

  ## 📌 一对一推送

  脚本参考[ccwav/QLScript2](https://github.com/ccwav/QLScript2) 即可

  **用户的uid扫码即可自动填充到备注上，需要在wPusher配置（wxPusher后台 -> 应用管理 -> 应用信息 -> 事件回调地址）如下：**

  ```
  http://ip:port/api/third/wxPusher/follow/callback
  ```
