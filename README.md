# YBlog

一个简洁优雅的个人博客，基于 Nuxt 3 和 Tailwind CSS 构建，参考 Anthropic 官网设计风格。

## 特性

- 🚀 **Nuxt 3** - 基于 Vue 3 的全栈框架
- 🎨 **Tailwind CSS** - 实用优先的 CSS 框架
- 📝 **Markdown** - 使用 Markdown 编写文章
- 🎯 **响应式设计** - 完美适配各种设备
- ⚡ **快速响应** - 服务端渲染，极致性能
- 🌙 **优雅设计** - 参考 Claude 官网风格

## 开始使用

### 安装依赖

```bash
pnpm install
```

### 开发模式

```bash
pnpm dev
```

访问 [http://localhost:3000](http://localhost:3000) 查看效果。

### 构建生产版本

```bash
pnpm build
```

### 预览生产构建

```bash
pnpm preview
```

## 项目结构

```
yblog/
├── assets/           # 静态资源
│   └── css/         # 样式文件
├── components/      # Vue 组件
│   ├── Header.vue  # 头部组件
│   └── Footer.vue  # 底部组件
├── content/         # Markdown 文章
│   └── blog/       # 博客文章
├── layouts/         # 布局组件
│   └── default.vue # 默认布局
├── pages/           # 页面组件
│   ├── index.vue   # 首页
│   ├── blog/       # 文章页面
│   └── about.vue   # 关于页面
├── app.vue          # 主应用组件
├── nuxt.config.ts   # Nuxt 配置
├── tailwind.config.js # Tailwind 配置
└── package.json     # 项目配置
```

## 添加文章

在 `content/blog/` 目录下创建 Markdown 文件：

```markdown
---
title: '文章标题'
description: '文章描述'
date: 2024-01-15
category: '分类'
readTime: 5
cover: 'https://example.com/cover.jpg'
---

# 文章内容

这里是文章内容...
```

## 技术栈

- [Nuxt 3](https://nuxt.com/) - Vue 全栈框架
- [Tailwind CSS](https://tailwindcss.com/) - CSS 框架
- [@nuxt/content](https://content.nuxt.com/) - Git 驱动的 CMS
- [Vue 3](https://vuejs.org/) - 渐进式 JavaScript 框架

## 许可证

MIT
