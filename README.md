# vue-project2 Setup

```sh
npm install

npm run dev

npm run build

npm run lint
```


1. 页面文件放在 `views` 文件下,且命名方式为`文件夹/index.vue`
2. 组件写在`components`目录下,命名统一采用大驼峰格式
3. 不含有响应式 api 的工具函数写在`utils`文件下,命名方式为小驼峰。含有响应式 api 的工具则称之为`hook`函数,写在`hooks`文件夹下,命名方式为`use-xxx/index.ts`,导出函数名为`useXxx`
4. 请求接口统一写在`src/api`目录下,且根据使用场景区分目录


```js
# 1-1. Github raw 链接
https://raw.githubusercontent.com/leegical/Blog_img/main/md_img202305061640828.png
# 1-2. Github 仓库文件链接
https://github.com/leegical/Blog_img/blob/main/md_img202305061640828.png

# 国内请求将访问到
https://jsd.cdn.zzko.cn/gh/leegical/Blog_img/md_img202305061640828.png

# 国外请求将访问到
https://cdn.jsdelivr.net/gh/leegical/Blog_img/md_img202305061640828.png
```


```js
'//DOM Elements
const boxes = document.querySelectorAll(".box"),
  image = document.querySelector(".image");

//Loop through each boxes element
boxes.forEach((box) => {
  //When a draggable element dragged over a box element
  box.addEventListener("dragover", (e) => {
    e.preventDefault(); //Prevent default behaviour
    box.classList.add("hovered");
  });

  //When a draggable element leaves box element
  box.addEventListener("dragleave", () => {
    box.classList.remove("hovered");
  });

  //When a draggable element is dropped on a box elemen
  box.addEventListener("drop", () => {
    box.appendChild(image);
    box.classList.remove("hovered");
  });
});'

```

```css
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
body {
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f6f7fb;
}
.container {
  display: flex;
  gap: 10px;
  flex-wrap: wrap;
  width: 420px;
  justify-content: center;
}
.container .box {
  position: relative;
  height: 160px;
  width: 160px;
  border-radius: 12px;
  border: 2px solid #333;
}
.box .image {
  height: 100%;
  width: 100%;
  border-radius: 10px;
  background-size: cover;
  background-position: center;
  background-image: url("img.jpg");
}
.box.hovered {
  border: 2px dashed #333;
}
```

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Drag & Drop in JavaScript</title>
    <link rel="stylesheet" href="style.css" />
   <script src="script.js" defer></script>
  </head>
  <body>
    <section class="container">
      <div class="box">
        <div class="image" draggable="true"></div>
      </div>
      <div class="box"></div>
      <div class="box"></div>
      <div class="box"></div>
    </section>
  </body>
</html>
```
