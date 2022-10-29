# 花生壳(内网穿透) Docker版本

访问[GitHub](https://github.com/liukunup/phddns)

访问[DockerHub](https://hub.docker.com/r/liukunup/phddns)

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

> 注意: 务必修改`--mac-address`的Mac地址, 相同的Mac地址会导致SN码相同, 从而导致代理相互挤占。

> 生成随机Mac地址的方法: `echo $RANDOM|md5sum|sed 's/../&:/g'|cut -c 1-17` (brew install md5sha1sum)

- Docker CLI 启动方式

``` shell
docker run -d --mac-address=ab:cd:ef:12:34:56 --name=phddns liukunup/phddns:latest
```

- Docker Compose 启动方式

```yaml
version: "3"

services:

  phddns:
    image: liukunup/phddns:latest
    container_name: phddns
    hostname: phddns
    restart: always
    environment:
      - TZ=Asia/Shanghai
      - LANG=en_US.UTF-8
    volumes:
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
    mac_address: 'ab:cd:ef:12:34:56'  # 随机填写（务必修改）
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

# 指定MacAddr/IPv4/IPv6的方法
docker run -d --mac-address=xxx --ip=xxx --ip6=xxx --name=phddns liukunup/phddns:latest
```
