# 花生壳(内网穿透) Docker版本

## 官方信息

花生壳[官网](https://hsk.oray.com/)

花生壳[客户端下载](https://hsk.oray.com/download/)

花生壳[Linux使用教程](https://service.oray.com/question/11630.html)

## 使用方法

1、拉取镜像

``` shell
docker pull liukunup/phddns:latest
```

2、拉起容器

> 注意: 必须修改填写`--mac-address`,相同的Mac地址会导致SN码相同,从而引发启动失败。

``` shell
docker run -d --mac-address=ab:cd:ef:12:34:56 --name=phddns liukunup/phddns:latest
```

3、设置&使用

1. 浏览器输入远程管理地址[b.oray.com](b.oray.com)进入花生壳远程管理页面, 输入重置花生壳时生成的SN码及默认密码admin进入;

2. 首次登录, 请按照提示选择扫码激活或者密码激活, 以完成激活和授权操作。


## 构建镜像

``` shell
# 如未登陆, 需要先登陆DockerHub账号
docker login

# 镜像构建
docker build -t liukunup/phddns:latest .

# 镜像推送
docker push liukunup/phddns:latest

# 查看当前镜像的IMAGE ID
docker images

# 打上新版本标签
docker tag <IMAGE ID> liukunup/phddns:<版本号>

# 镜像推送
docker push liukunup/phddns:<版本号>
```
