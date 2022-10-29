#!/bin/bash
# AUTHOR: LiuKun <liukunup@outlook.com>
# DATE:   2022-10-29
# Entrypoint Shell

# 执行`phddns status`来检查是否已经安装花生壳
if ! phddns status; then
  # 安装花生壳
  echo phddns_*.deb | dpkg -i
fi

# 如果任何命令失败,则退出脚本(非零值)
set -e

# 打印当前日期
date

# 设置开机自启动
phddns enable

# 启动服务
phddns start

# 等待3秒
sleep 3s

# 查看状态
phddns status

# 回显帮助文档链接
echo "see https://service.oray.com/question/11630.html"

# 保持容器持续运行
tail -f /dev/null
