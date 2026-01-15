#!/bin/bash

# 遇到错误立即退出脚本
set -e

echo "🚀 开始部署 yblog..."

# 拉取最新代码
echo "📥 拉取最新代码..."
git pull

# 停止并删除旧容器
echo "🛑 停止旧容器..."
docker stop yblog 2>/dev/null || true
docker rm yblog 2>/dev/null || true

# 删除旧镜像
echo "🗑️  删除旧镜像..."
docker rmi yblog 2>/dev/null || true

# 构建新镜像
echo "🔨 构建新镜像..."
docker build -t yblog .

# 启动新容器
echo "▶️  启动新容器..."
docker run -d \
-p 3000:3000 \
--name yblog yblog

echo "✅ 部署完成！"
echo "🌐 访问地址: http://111.228.0.215/