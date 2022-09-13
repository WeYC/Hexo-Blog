---
title: hexo笔记
date: 2022-01-08 23:15:58
tags: ["学习","hexo"]
categories: ["hexo"]
---

##  前言：

​		Hexo的使用笔记

## 基本配置：

​		配置文件_config.yml

## 写作：

- 使用```<!--more-->```截取文章内容使在首页不完全显示。

- 启用资源文件夹，打开后每新建一篇文章都会自动创建对应的文件夹
  ```
   _config.yml
  post_asset_folder: true
  ```

​		相对路径引用的标签插件

```
{% asset_path slug %}
{% asset_img slug [title] %}
{% asset_link slug [title] %}
```

正确的引用图片方式是使用下列的标签插件而不是 markdown ：

```
{% asset_img example.jpg This is an example image %}
```



## Hexo-Themes-Next主题：

   - 配置：

      1. cd 到 Blog目录下的 themes，执行 `git clone https://github.com/iissnan/hexo-theme-next themes/next `下载主题文件

      2. 修改_config.yml里的themes字段 `theme: next`

      3. 验证主题一次输入以下命令：

   ​		`hexo clean`清除已经生成的静态文件

   ​		`hexo g` 编译生成静态文件

   ​		`hexo s`部署到本地服务器，在浏览器输入http://localhost:4000打开页面

   ​		`hexo d`上传到Github


## 美化主题：
   1. 移除底部的强力驱动：

      ​		_config.yml文件`footer`字段把 `powered:  true`改为`false`。 
      
      ​		或
      
      ​		打开`Blog/themes\next\layout\_partials\footer.swig`文件，下拉到底部注释一下代码：

   ```
    <!--
    {%- if theme.footer.powered %}
      <div class="powered-by">
        {%- set next_site = 'https://theme-next.org' %}
        {%- if theme.scheme !== 'Gemini' %}
          {%- set next_site = 'https://' + theme.scheme | lower + '.theme-next.org' %}
        {%- endif %}
        {{- __('footer.powered', next_url('https://hexo.io', 'Hexo', {class: 'theme-link'}) + ' & ' + next_url(next_site, 'NexT.' + theme.scheme, {class: 'theme-link'})) }}
      </div>
    {%- endif %}
    -->
   ```

   2. 添加网站已运行时间：

```javascript
<!-- 网站运行时间的设置 -->
<span id="timeDate">载入天数...</span>
<span id="times">载入时分秒...</span>
<script>
  var now = new Date();
  function createtime() {
      var grt= new Date("01/01/2022 00:00:00");//此处修改你的建站时间或者网站上线时间
      now.setTime(now.getTime()+250);
      days = (now - grt ) / 1000 / 60 / 60 / 24; dnum = Math.floor(days);
      hours = (now - grt ) / 1000 / 60 / 60 - (24 * dnum); hnum = Math.floor(hours);
      if(String(hnum).length ==1 ){hnum = "0" + hnum;} minutes = (now - grt ) / 1000 /60 - (24 * 60 * dnum) - (60 * hnum);
      mnum = Math.floor(minutes); if(String(mnum).length ==1 ){mnum = "0" + mnum;}
      seconds = (now - grt ) / 1000 - (24 * 60 * 60 * dnum) - (60 * 60 * hnum) - (60 * mnum);
      snum = Math.round(seconds); if(String(snum).length ==1 ){snum = "0" + snum;}
      document.getElementById("timeDate").innerHTML = "本站已安全运行 "+dnum+" 天 ";
      document.getElementById("times").innerHTML = hnum + " 小时 " + mnum + " 分 " + snum + " 秒";
  }
  setInterval("createtime()",250);
</script>
```
   3. 修改侧边栏和首页文章透明（已放弃）：

         1. 第一种方式，直接改。

         2. 侧边栏透明 1`themes\next\source\css\_schemes\Pisces\_layout.styl`

          ```stylus
          .header-inner {
            +++opacity: 0.8;
            background: var(--content-bg-color);
            border-radius: $border-radius-inner;
            box-shadow: $box-shadow-inner;
            overflow: hidden;
            padding: 0;
            position: absolute;
            top: 0;
            width: $sidebar-desktop;
          
            +desktop-large() {
              width: $sidebar-desktop;
            }
          
            +tablet-mobile() {
              border-radius: initial;
              position: relative;
              width: auto;
            }
          }
          ```

         3. 侧边栏透 2`themes\next\source\css\_schemes\Pisces\_sidebar.styl`

          ```less
          .sidebar {
            background: var(--body-bg-color);
            box-shadow: none;
            margin-top: 100%;
            position: static;
            width: $sidebar-desktop;
            +++opacity: 0.8;
            +tablet-mobile() {
              display: none;
            }
          }
          ```

          

         4. 文章透明 `themes\next\source\css\_schemes\Gemini\index.styl`

          ```stylus
          // Post blocks.
          .content-wrap {
            +++ opacity: 0.8;
            background: initial;
            box-shadow: initial;
            padding: initial;
          }
          ```

          

         5. 第二种方式，在`themes\next\source\css\_variables\base.styl`添加全局变量。

      ```stylus
      // Colors
      // colors for use across theme.
      // --------------------------------------------------
      $whitesmoke   = #f5f5f5;
      $gainsboro    = #eee;
      $grey-lighter = #ddd;
      $grey-light   = #ccc;
      $grey         = #bbb;
      $grey-dark    = #999;
      $grey-dim     = #666;
      $black-light  = #555;
      $black-dim    = #333;
      $black-deep   = #444;
      $red          = #ff2a2a;
      $blue-bright  = #87daff;
      $blue         = #0684bd;
      $blue-deep    = #262a30;
      $orange       = #fc6423;
      //透明
      +++$opacity = 0.8
      ```

       **注意：**最后按照第一种的方式在.styl文件里把`opacity = 0.8`改为`$opacity = 0.8`

      搜索框存在Bug，归档也闪烁的迹象。

   4. ## 文章添加来必力评论：

         1. 前往 [来必力](https://livere.com/) 官网注册账号
         2. 并按要求填写信息获取livere_uid即可
         
   5. ## 博客副标题改成今日诗词：

         1. 前往 [今日诗词](https://www.jinrishici.com/) 官网获取api

         2. 将获取到的代码放入到`themes\next\layout\_partials\header\brand.swig`如下

            ```
            {%- if subtitle %}
                  <p +++id="jinrishici-sentence" class="site-subtitle" itemprop="description">{{ subtitle }}</p>
                  <!-- <span id="jinrishici-sentence">正在加载今日诗词....</span> -->
                  +++<script src="https://sdk.jinrishici.com/v2/browser/jinrishici.js" charset="utf-8"></script>
                {%- endif %}
            ```

   6. 











































