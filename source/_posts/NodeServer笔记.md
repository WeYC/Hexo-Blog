---
title: NodeServer笔记
date: 2022-09-07 11:35:05
tags: ["学习","node"]
categories: ["node"]
---

## 开发依赖库

> Express	开发框架
>
> Body-Parser	解析post请求
>
> Nodemon	自动更新包
>
> Sequelize	连接数据库
>
> Nodemailer	发送邮件
>
> Express-session	创建session
>
> Json Web Token 生成Token

 <!-- more -->

## 登录验证

> token，session
>
> token，session在后端生成
>
> cookie、sessionsStorage、localStorage保存在浏览器
>
> #### token: 令牌，一个加密的字符串，一般身份验证，前后混合开发可使用session进行身份验证，session需要配合cookie

## Express

> ```javascript
> // 引入包
> const express = require('express')
> // 挂在实例
> const app = express()
> //路由
> app.get('/', function (req, res) {
> res.send('Hello World')
> })
> // 端口
> app.listen(3000)
> ```



## Body-Parser	解析post请求

>```javascript
>var express = require('express')
>var bodyParser = require('body-parser')
>
>var app = express()
>
>//一般只需要下面两个
>
>// parse application/x-www-form-urlencoded
>app.use(bodyParser.urlencoded({ extended: false }))
>
>// parse application/json
>app.use(bodyParser.json())
>
>app.use(function (req, res) {
>res.setHeader('Content-Type', 'text/plain')
>res.write('you posted:\n')
>res.end(JSON.stringify(req.body, null, 2))
>})
>```
>



## Sequelize连接数据库 [中文文档](https://www.sequelize.cn/)

> ``` sh
> # 使用npm
> $ npm i sequelize
> # 驱动包
> $ npm install --save pg pg-hstore # Postgres
> $ npm install --save mysql2
> $ npm install --save mariadb
> $ npm install --save sqlite3
> $ npm install --save tedious # Microsoft SQL Server```
> $ npm install --save sequelize
> ```
>
#### 连接到数据库
>
>``` javascript
>const { Sequelize } = require('sequelize');
>// 方法 3: 分别传递参数 (其它数据库)
>const sequelize = new Sequelize('database', 'username', 'password', {
>host: 'localhost',
>dialect: /* 选择 'mysql' | 'mariadb' | 'postgres' | 'mssql' 其一 */
>});
>
>```
>
#### 测试连接
>```javascript
>try {
>await sequelize.authenticate();
>console.log('Connection has been established successfully.');
>} catch (error) {
>console.error('Unable to connect to the database:', error);
>}
>```

#### 关闭连接

> 默认情况下,Sequelize 将保持连接打开状态,并对所有查询使用相同的连接. 如果你需要关闭连接,请调用 sequelize.close()(这是异步的并返回一个 Promise).
>
> 

#### 模型基础

##### 使用 sequelize.define

> ```javascript
> const { Sequelize, DataTypes } = require('sequelize');
> const sequelize = new Sequelize('sqlite::memory:');
> 
> const User = sequelize.define('User', {
> // 在这里定义模型属性
> firstName: {
>  type: DataTypes.STRING,
>  allowNull: false
> },
> lastName: {
>  type: DataTypes.STRING
>  // allowNull 默认为 true
> }
> }, {
> // 这是其他模型参数
> });
> 
> // `sequelize.define` 会返回模型
> console.log(User === sequelize.models.User); // true
> ```

##### 扩展 Model

> ```javascript
> const { Sequelize, DataTypes, Model } = require('sequelize');
> const sequelize = new Sequelize('sqlite::memory:');
> 
> class User extends Model {}
> 
> User.init({
> // 在这里定义模型属性
> firstName: {
>  type: DataTypes.STRING,
>  allowNull: false
> },
> lastName: {
>  type: DataTypes.STRING
>  // allowNull 默认为 true
> }
> }, {
> // 这是其他模型参数
> sequelize, // 我们需要传递连接实例
> modelName: 'User' // 我们需要选择模型名称
> });
> 
> // 定义的模型是类本身
> console.log(User === sequelize.models.User); // true
> ```

## Nodemailer	发送邮件

> ```javascript
> "use strict";
> const nodemailer = require("nodemailer");
> 
> // async..await is not allowed in global scope, must use a wrapper
> async function main() {
> // Generate test SMTP service account from ethereal.email
> // Only needed if you don't have a real mail account for testing
> let testAccount = await nodemailer.createTestAccount();
> 
> // create reusable transporter object using the default SMTP transport
> let transporter = nodemailer.createTransport({
>  host: "smtp.ethereal.email",
>  port: 587,
>  secure: false, // true for 465, false for other ports
>  auth: {
>    user: testAccount.user, // generated ethereal user
>    pass: testAccount.pass, // generated ethereal password
>  },
> });
> 
> // send mail with defined transport object
> let info = await transporter.sendMail({
>  from: '"Fred Foo 👻" <foo@example.com>', // sender address
>  to: "bar@example.com, baz@example.com", // list of receivers
>  subject: "Hello ✔", // Subject line
>  text: "Hello world?", // plain text body
>  html: "<b>Hello world?</b>", // html body
> });
> 
> console.log("Message sent: %s", info.messageId);
> // Message sent: <b658f8ca-6296-ccf4-8306-87d57a0b4321@example.com>
> 
> // Preview only available when sending through an Ethereal account
> console.log("Preview URL: %s", nodemailer.getTestMessageUrl(info));
> // Preview URL: https://ethereal.email/message/WaQKMgKddxQDoou...
> }
> 
> main().catch(console.error);
> ```

