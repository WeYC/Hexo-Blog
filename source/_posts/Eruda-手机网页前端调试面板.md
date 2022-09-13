---
title: Eruda 手机网页前端调试面板
date: 2022-01-11 02:25:08
tags: "学习"
categories: "学习"
---



# [**Eruda** 手机网页前端调试面板](https://github.com/liriliri/eruda)

{% asset_img screenshot.jpg %}

 <!-- more -->

## 快速上手

通过CDN使用：

```javascript
<script src="//cdn.bootcdn.net/ajax/libs/eruda/2.3.3/eruda.js"></script>
<script>eruda.init();</script>
```

通过 npm 安装：

```shell
npm install eruda --save
```

在页面中加载脚本：

```javascript
<script src="node_modules/eruda/eruda.js"></script>
<script>eruda.init();</script>
```

JS 文件对于移动端来说略重（gzip 后大概 100kb）。建议通过 url 参数来控制是否加载调试器，比如：

```javascript
;(function () {
    var src = '//cdn.jsdelivr.net/npm/eruda';
    if (!/eruda=true/.test(window.location) && localStorage.getItem('active-eruda') != 'true') return;
    document.write('<scr' + 'ipt src="' + src + '"></scr' + 'ipt>');
    document.write('<scr' + 'ipt>eruda.init();</scr' + 'ipt>');
})();
```

初始化时可以传入配置：

- container: 用于插件初始化的 Dom 元素，如果不设置，默认创建 div 作为容器直接置于 html 根结点下面。
- tool：指定要初始化哪些面板，默认加载所有。

```javascript
let el = document.createElement('div');
document.body.appendChild(el);

eruda.init({
    container: el,
    tool: ['console', 'elements'],
    useShadowDom: true
});
```
