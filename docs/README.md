# Cola777jz

> Cola777jz-Docsify-Template

本部分只讲述 Docsify 的基本知识，有关项目的部署:
- 使用 GithubPages 部署 TODO
- 使用 GithubPages 部署 (未实名) TODO
- Docker 部署 [使用 Docker 部署本项目](docker_deploy_demo01.md)

## 一、Docsify 概述

[Docsify 一个神奇的文档网站生成器](https://docsify.js.org/#/zh-cn/?id=docsify) docsify 可以快速帮你生成文档网站。不同于 GitBook、Hexo 的地方是它不会生成静态的 `.html` 文件，所有转换工作都是在运行时。如果你想要开始使用它，只需要创建一个 `index.html` 就可以开始编写文档并直接 [部署在 GitHub Pages](https://docsify.js.org/#/zh-cn/deploy)。

### 1.1 Features

- 无需构建，写完文档直接发布
- 容易使用并且轻量 (压缩后 ~21kB)
- 智能的全文搜索
- 提供多套主题
- 丰富的 API
- 支持 Emoji
- 兼容 IE11
- 支持服务端渲染 SSR ([示例](https://github.com/docsifyjs/docsify-ssr-demo))

## 二、Docsify 模板搭建

### 2.1 环境安装

#### Node 环境的安装

参见：NVM 的使用

#### 使用 npm 安装 docsify-cli 工具

推荐全局安装 `docsify-cli` 工具，可以方便地创建及在本地预览生成的文档。

```bash
npm i docsify-cli -g

```

#### 初始化项目

如果想在项目的 `./docs` 目录里写文档，直接通过 `init` 初始化项目。

```bash
docsify init ./docs
```

<img src="https://yong-gan-niu-niu-1311841992.cos.ap-beijing.myqcloud.com/images/image-20231001135849890.png" alt="image-20231001135849890" style="zoom:50%;" />

#### 默认项目结构

<img src="https://yong-gan-niu-niu-1311841992.cos.ap-beijing.myqcloud.com/images/image-20231001135936356.png" alt="image-20231001135936356" style="zoom:50%;" />

初始化成功后，可以看到 `./docs` 目录下创建的几个文件

- `index.html` 入口文件
- `README.md` 会做为主页内容渲染
- `.nojekyll` 用于阻止 GitHub Pages 忽略掉下划线开头的文件

直接编辑 `docs/README.md` 就能更新文档内容，当然也可以 [添加更多页面](https://docsify.js.org/#/zh-cn/more-pages)。



#### 本地预览

通过运行 `docsify serve` 启动一个本地服务器，可以方便地实时预览效果。默认访问地址 [http://localhost:3000](http://localhost:3000/) 。

```bash
docsify serve docs
```

<img src="https://yong-gan-niu-niu-1311841992.cos.ap-beijing.myqcloud.com/images/image-20231001140427196.png" alt="image-20231001140427196" style="zoom:50%;" />

更多命令请参见 [Docsify-cli 官网的介绍 ](https://github.com/docsifyjs/docsify-cli)

### 2.2 模板搭建

通过上面的步骤我们已经初始化了一个 docsify 文档，但很单调接下来让我们开始自定义吧 🔧🔧

#### 2.2.1 Loading 提示

初始化时会显示 `Loading...` 内容，你可以自定义提示信息。

```html
  <!-- index.html -->

  <div id="app">加载中</div>
```

#### 2.2.2 多页文档

如果需要创建多个页面，或者需要多级路由的网站，在 docsify 里也能很容易的实现。例如创建一个 `guide.md` 文件，那么对应的路由就是 `/#/guide`。

假设你的目录结构如下：

```text
.
└── docs
    ├── README.md
    ├── guide.md
    └── zh-cn
        ├── README.md
        └── guide.md
```

那么对应的访问页面将是

```text
docs/README.md        => http://domain.com
docs/guide.md         => http://domain.com/guide
docs/zh-cn/README.md  => http://domain.com/zh-cn/
docs/zh-cn/guide.md   => http://domain.com/zh-cn/guide
```

注意：需要在 `md` 中书写内容 `docsify` 才会识别

<img src="https://yong-gan-niu-niu-1311841992.cos.ap-beijing.myqcloud.com/images/image-20231001142801608.png" alt="image-20231001142801608" style="zoom:50%;" />

#### 2.2.3 定制侧边栏

为了获得侧边栏，您需要创建自己的 _sidebar.md，你也可以自定义加载的文件名。默认情况下侧边栏会通过 Markdown 文件自动生成，效果如当前的文档的侧边栏。

首先配置 `loadSidebar` 选项，具体配置规则见 [配置项#loadSidebar](https://docsify.js.org/#/zh-cn/configuration?id=loadsidebar)。

```html
<!-- index.html -->

<script>
  window.$docsify = {
    loadSidebar: true
  }
</script>
<script src="//cdn.jsdelivr.net/npm/docsify/lib/docsify.min.js"></script>
```

接着创建 `_sidebar.md` 文件，内容如下

```markdown
<!-- docs/_sidebar.md -->

* [首页](zh-cn/)
* [指南](zh-cn/guide)
```

需要在 `./docs` 目录创建 `.nojekyll` 命名的空文件，阻止 GitHub Pages 忽略命名是下划线开头的文件。



#### 2.2.4 嵌套的侧边栏

你可能想要浏览到一个目录时，只显示这个目录自己的侧边栏，这可以通过在每个文件夹中添加一个 `_sidebar.md` 文件来实现。

<img src="https://yong-gan-niu-niu-1311841992.cos.ap-beijing.myqcloud.com/images/image-20231001144955952.png" alt="image-20231001144955952" style="zoom:50%;" />

`_sidebar.md` 的加载逻辑是从每层目录下获取文件，如果当前目录不存在该文件则回退到上一级目录。例如当前路径为 `/zh-cn/more-pages` 则从 `/zh-cn/_sidebar.md` 获取文件，如果不存在则从 `/_sidebar.md` 获取。

当然你也可以配置 `alias` 避免不必要的回退过程。

```html
<script>
  window.$docsify = {
    loadSidebar: true,
    alias: {
      '/.*/_sidebar.md': '/_sidebar.md'
    }
  }
</script>
```

你可以在一个子目录中创建一个 `README.md` 文件来作为路由的默认网页。

<img src="https://yong-gan-niu-niu-1311841992.cos.ap-beijing.myqcloud.com/images/image-20231001145049636.png" alt="image-20231001145049636" style="zoom:50%;" />

#### 2.2.5 用侧边栏中选定的条目名称作为页面标题

一个页面的 `title` 标签是由侧边栏中选中条目的名称所生成的。为了更好的 SEO ，你可以在文件名后面指定页面标题。

```markdown
<!-- docs/_sidebar.md -->
* [Home](/)
* [Guide](guide.md "The greatest guide in the world")
```

#### 2.2.6 显示目录

自定义侧边栏同时也可以开启目录功能。设置 `subMaxLevel` 配置项，具体介绍见 [配置项#subMaxLevel](https://docsify.js.org/#/zh-cn/configuration?id=submaxlevel)。

```html
<!-- index.html -->

<script>
  window.$docsify = {
    loadSidebar: true,
    subMaxLevel: 2
  }
</script>
<script src="//cdn.jsdelivr.net/npm/docsify/lib/docsify.min.js"></sc
```

![image-20231001145925269](https://yong-gan-niu-niu-1311841992.cos.ap-beijing.myqcloud.com/images/image-20231001145925269.png)



当设置了 `subMaxLevel` 时，默认情况下每个标题都会自动添加到目录中。

- 如果你想忽略特定的标题，可以给它添加 `<!-- {docsify-ignore} -->` 。
- 要忽略特定页面上的所有标题，你可以在页面的第一个标题上使用 `<!-- {docsify-ignore-all} -->` 。

在使用时， `<!-- {docsify-ignore} -->` 和 `<!-- {docsify-ignore-all} -->` 都不会在页面上呈现。



#### 2.2.7 自定义导航栏

如果你需要定制导航栏，可以用 HTML 创建一个导航栏。

注意：文档的链接都要以 `#/` 开头。

```html
<!-- index.html -->

<body>
  <nav>
    <a href="#/">EN</a>
    <a href="#/zh-cn/">中文</a>
  </nav>
  <div id="app"></div>
</body>
```

那我们可以通过 Markdown 文件来配置导航。首先配置 `loadNavbar`，默认加载的文件为 `_navbar.md`。具体配置规则见[配置项#loadNavbar](https://docsify.js.org/#/configuration?id=loadnavbar)。

```html
<!-- index.html -->

<script>
  window.$docsify = {
    loadNavbar: true
  }
</script>
<script src="//cdn.jsdelivr.net/npm/docsify/lib/docsify.min.js"></script>
<!-- _navbar.md -->

* [En](/)
* [简体中文](/zh-cn/)
```

你需要在 `./docs` 目录下创建一个 `.nojekyll` 文件，以防止 GitHub Pages 忽略下划线开头的文件。

`_navbar.md` 加载逻辑和 `sidebar` 文件一致，从每层目录下获取。例如当前路由为 `/zh-cn/custom-navbar` 那么是从 `/zh-cn/_navbar.md` 获取导航栏。

如果导航内容过多，可以写成嵌套的列表，会被渲染成下拉列表的形式。

```markdown
<!-- _navbar.md -->

* AboutMe
  * [Github](https://github.com/cola777jz)
  * [Gitee](https://gitee.com/cola777jz)
  * [QQ](email:1203952894@qq.com)
```

如果你使用 [emoji 插件](https://docsify.js.org/#/plugins?id=emoji):

```html
<!-- index.html -->

<script>
  window.$docsify = {
    // ...
  }
</script>
<script src="//cdn.jsdelivr.net/npm/docsify/lib/plugins/emoji.min.js"></script>
```

例如，你可以在自定义导航栏 Markdown 文件中使用旗帜表情：

```markdown
<!-- _navbar.md -->

* AboutMe
  * [Github :us:](https://github.com/cola777jz)
  * [Gitee :cn:](https://gitee.com/cola777jz)
  * [QQ](email:1203952894@qq.com)
```

![image-20231001150946113](https://yong-gan-niu-niu-1311841992.cos.ap-beijing.myqcloud.com/images/image-20231001150946113.png)

#### 2.2.8 封面

通过设置 `coverpage` 参数，可以开启渲染封面的功能。具体用法见 [配置项#coverpage](https://docsify.js.org/#/configuration?id=coverpage)。

封面的生成同样是从 markdown 文件渲染来的。开启渲染封面功能后在文档根目录创建 `_coverpage.md` 文件。渲染效果如本文档。

*index.html*

```html
<!-- index.html -->

<script>
  window.$docsify = {
    coverpage: true
  }
</script>
<script src="//cdn.jsdelivr.net/npm/docsify/lib/docsify.min.js"></script>
<!-- _coverpage.md -->

![logo](_media/icon.svg)

# docsify <small>3.5</small>

> 一个神奇的文档网站生成器。

- 简单、轻便 (压缩后 ~21kB)
- 无需生成 html 文件
- 众多主题

[GitHub](https://github.com/docsifyjs/docsify/)
[Get Started](#docsify)
```

<img src="https://yong-gan-niu-niu-1311841992.cos.ap-beijing.myqcloud.com/images/image-20231001151303394.png" alt="image-20231001151303394" style="zoom:50%;" />

## 三、Docsify 拓展

docsify 官方及社区为我们提供了大量插件，参见 [docsify-plugins](https://docsify.js.org/#/awesome?id=plugins)

有关插件拓展部份参见项目： [cola777jz-docsify-template](https://gitee.com/cola777jz/cola777jz-docsify-template)

