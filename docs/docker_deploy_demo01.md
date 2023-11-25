# 使用 Docker 部署本项目

## 构建镜像
在项目根目录下已经提供了相关的 `Dockerfile` 我们只需执行：

```bash
docker build . -t cola-docsify-template/1.0.0
```

- `.` 指定 `Dockerfile ` 所处的位置为当前目录
- `-t` 指定生成镜像的标签

>[!ATTENTION]
>标签的命名中不能包含大写字母否则会报错

![image-20231001172520558](https://yong-gan-niu-niu-1311841992.cos.ap-beijing.myqcloud.com/images/image-20231001172520558.png)

## 启动容器

执行：

```bash
docker run -d --name cola-docsify-template-82 -p 82:82 [镜像 id]
```

![image-20231001172550783](https://yong-gan-niu-niu-1311841992.cos.ap-beijing.myqcloud.com/images/image-20231001172550783.png)

## 验证

![image-20231001172635675](https://yong-gan-niu-niu-1311841992.cos.ap-beijing.myqcloud.com/images/image-20231001172635675.png)


## 虚悬镜像的处理
多次构建同一 tag 的镜像后可能会产生 tag 和 name 均为 `<none>` 的镜像即虚悬镜像，我们可以通过：

```bash
docker image prune
```

后输入 y 确定即可清理无用的镜像

![image-20231001172440399](https://yong-gan-niu-niu-1311841992.cos.ap-beijing.myqcloud.com/images/image-20231001172440399.png)
