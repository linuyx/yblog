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
