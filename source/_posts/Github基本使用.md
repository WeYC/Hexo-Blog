---
title: Github基本使用
date: 2022-01-10 23:24:40
tags: ["学习", "GitHub"]
categories: "GitHub"
---


##  一、与GitHub建立连接

- 配置Git

  首先在本地创建`ssh key；`

  ```sh
  $ ssh-keygen -t rsa -C "your_email@youremail.com"
  ```

  后面的`your_email@youremail.com`改为你在github上注册的邮箱，之后会要求确认路径和输入密码，我们这使用默认的一路回车就行。成功的话会在`~/`下生成`.ssh`文件夹，进去，打开`id_rsa.pub`，复制里面的`key`。

  回到github上，进入 Account Settings（账户配置），左边选择SSH Keys，Add SSH Key,title随便填，粘贴在你电脑上生成的key。

  <!-- more -->

  为了验证是否成功，在git bash下输入：

  ```sh
  $ ssh -T git@github.com
  ```

  如果是第一次的会提示是否continue，输入yes就会看到：You've successfully authenticated, but GitHub does not provide shell access 。这就表示已成功连上github。

  接下来我们要做的就是把本地仓库传到github上去，在此之前还需要设置username和email，因为github每次commit都会记录他们。

  ```sh
  $ git config --global user.name "your name"
  $ git config --global user.email "your_email@youremail.com"
  ```



## 二、上传代码到仓库



- …or create a new repository on the command line
  `git init`
  `git add README.md`
  `git commit -m "first commit"`
  `git branch -M main`
  `git remote add origin 仓库链接地址`
  `git push -u origin main`
  
- …or push an existing repository from the command line
  `git remote add origin 仓库链接地址`
  `git branch -M main`
  `git push -u origin main`

1. `git init` 初始化本地仓库
2. `git add . or git add *` 添加要上传的文件
3. `git commit -m "first commit"` 添加更新说明
4. `git remote add origin 仓库链接地址` 把文件放到暂存区
5. `git branch -M main` 更改分支
6. `git push -u origin main` 上传、
7. 二次上传需要执行 `git add .` and `git commit -m "first commit"` 然后 `git push -u origin main`
7. 如果仓库已有代码发生改变，需要先`git pull` 拉取更新，更新本地文件与仓库一直，再执行7.步骤
