---
title: hexo安装教程
date: 2022-01-07 19:04:08
tags: ["学习","hexo"]
categories: ["hexo"]
---



## 前言：

&ensp;&ensp;&ensp;&ensp;这是我折腾Hexo的记录记录需要用到的知识。

------



1. 本地运行环境配置

   - Node.Js 10+

     1. 安装hexo-cli  $ npm install -g hexo-cli （ -g 全局安装 ）

<!--more-->

   - Windows下安装Git程序

   - [GitHub](www.github.com)创建代码仓库 

     1. 新建的仓库 Repository name 名称要和账号的名称一致 后面加上 github.io
     
     {% asset_img image-20220107192509368.png 新建的仓库image %}
     
     2. 选择 Pblic （公开）








------

## 开始：

2. 在Blog目录下 右键打开 Git Bash Here

3. 输入命令$ hexo init初始化 将自动下载hexo的文件
```
     ├── _config.yml
     ├── package.json
     ├── scaffolds
     ├── source
     |   ├── _drafts
     |   └── _posts
     └── themes
```



4. 输入命令$ npm install 下载相关依赖

5. cd到Blog目录下安装hexo-deployer-git（ 重要！用于发布到Github上 ）

   ```$ npm install hexo-deployer-git --save```

5. 输入命令$ hexo generate （ 简写hexo g ）生成静态文件

6. 输入命令$ hexo server（ 简写hexo s ）本地运行查看效果

7. 配置 _config.yml 文件

   - 在最后的deploy代码处为
   
     \# Deployment
   
     \## Docs: https://hexo.io/docs/one-command-deployment
   
     ```
     deploy:
     	type: git
      	
      	repository: https://github.com/WeYC/WeYC.github.io.git  #代码仓库地址
      	
      	branch: main #分支
     ```
     
      	
   
------

## Git基本使用



- 配置Git

  首先在本地创建`ssh key；`

  ```$ ssh-keygen -t rsa -C "your_email@youremail.com"```

  

- 后面的`your_email@youremail.com`改为你在github上注册的邮箱，之后会要求确认路径和输入密码，我们这使用默认的一路回车就行。成功的话会在`~/`下生成`.ssh`文件夹，进去，打开`id_rsa.pub`，复制里面的`key`。

- 回到github上，进入 Account Settings（账户配置），左边选择SSH Keys，Add SSH Key,title随便填，粘贴在你电脑上生成的key。
  
  
  
- 为了验证是否成功，在git bash下输入：

  ```$ ssh -T git@github.com```



- 如果是第一次的会提示是否continue，输入yes就会看到：You've successfully authenticated, but GitHub does not provide shell access 。这就表示已成功连上github。

- 接下来我们要做的就是把本地仓库传到github上去，在此之前还需要设置username和email，因为github每次commit都会记录他们。

  ``` 
  $ git config --global user.name "your name" 
  $ git config --global user.email "your_email@youremail.com" 
  ```



8. 输入命令$ hexo deploy（简写hexo d）推送到代码仓库



