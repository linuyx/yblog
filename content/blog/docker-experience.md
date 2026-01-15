---
title: 'docker部署案例'
description: '分享docker部署项目、中间件的各种案例'
date: 2026-01-15
category: 'docker'
readTime: 3
cover: 'https://images.unsplash.com/photo-1499750310107-5fef28a66643?w=800&h=400&fit=crop'
---

## Docker安装Nginx

```bash
docker run
-d
--name my-nginx
-p 80:80
# 配置了这个才能在容器中通过host.docker.internal访问宿主机
--add-host=host.docker.internal:host-gateway
-v /home/dev/tool/nginx/nginx.conf:/etc/nginx/nginx.conf:ro
-v /home/dev/tool/nginx/conf.d:/etc/nginx/conf.d:ro
nginx
```

挂载配置文件时，需要宿主机中现有配置文件。
所以可以先启动一个nginx容器，将配置文件cp出来，再把这个临时的nginx删除，重新启动。

**拷贝配置文件命令：**

```bash
docker cp temp-nginx:/etc/nginx/nginx.conf /home/dev/tool/nginx/nginx.conf
docker cp temp-nginx:/etc/nginx/conf.d /home/dev/tool/nginx/conf.d
```

## Docker部署Nuxt项目

Dockerfile文件

```bash
# 使用官方 Node 镜像
FROM node:22.22.0

# 创建工作目录
WORKDIR /app

# 复制项目文件
COPY . .

# 安装依赖 & 构建
RUN npm install -g pnpm
RUN pnpm install && pnpm run build

# 暴露端口
EXPOSE 3000

# 前台启动 Nuxt3
CMD ["node", ".output/server/index.mjs"]
```

步骤：

- git clone <你的仓库地址>
- cd yblog
- docker build -t yblog .
- docker run -d -p 3000:3000 --name yblog yblog

---

*感谢阅读！*
