# 基础镜像
FROM ubuntu:focal

# 作者信息
LABEL LiuKun="liukunup@outlook.com"

# 花生壳 版本&架构
ARG HSK_VERSION="5.2.0"
ARG HSK_ARCH=${TARGETARCH}

# 时区 (可选)
ARG TIMEZONE=Asia/Shanghai
ENV TZ=${TIMEZONE}

# 更新 & 安装 & 下载
RUN    apt-get update \
    && apt-get install wget net-tools -y \
    && wget "https://down.oray.com/hsk/linux/phddns_${HSK_VERSION}_${HSK_ARCH}.deb" -O phddns_${HSK_VERSION}_${HSK_ARCH}.deb \
    && apt-get clean

# 入口程序
COPY entrypoint.sh /

# 启动程序
ENTRYPOINT ["/entrypoint.sh"]
