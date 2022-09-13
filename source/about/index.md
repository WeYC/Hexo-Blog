---
title: "每日一言"
type: "about"
---

<!-- 在span标签内加入 white-space: pre-wrap 样式，在strings内的语句中加入\n换行符可以实现换行 -->

```html
<div>
  <span id="typed" style="white-space: pre-wrap;line-height: 30px;"></span>
</div>
<script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>
<script type="text/javascript">
  var obj
  function getHttp() {
    var xhr = new XMLHttpRequest();
    url = "http://international.v1.hitokoto.cn/";
    xhr.open("GET", url, false);
    xhr.send(null);
    console.log(JSON.parse(xhr.responseText))
    return JSON.parse(xhr.responseText)
  }
  var options = {
    strings: [],
    typeSpeed: 100, //打印速度,
    backSpeed: 100, //退格速度
    startDelay: 300, //开始之前的延迟300毫秒
    smartBackspace: true
  };
  obj = getHttp()
  if (obj.from_who != null) {
    options.strings.push('\“' + obj.hitokoto  + "\”^2000—— " + obj.from_who)
  } else {
    options.strings.push('\“' + obj.hitokoto  + "\”^2000—— " + obj.from)
  }
  var typed = new Typed('#typed', options);
</script>
```

