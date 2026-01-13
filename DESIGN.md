# YBlog 设计指南

## 🎨 设计风格

本项目采用类似 Claude 官网（anthropic.com）的设计风格，特点包括：

- **方格背景图案**：使用 CSS 渐变实现的精致网格效果
- **大量留白**：提升内容的可读性和视觉层次
- **柔和的紫色主题**：使用紫色系（#7c3aed, #8b5cf6）作为品牌色
- **现代交互**：微妙的悬停效果和过渡动画
- **响应式设计**：适配各种屏幕尺寸

## 🎯 配色方案

### 主题色（Primary Colors）
```css
primary-50:  #f5f3ff  (浅紫背景)
primary-100: #ede9fe  (高亮背景)
primary-600: #7c3aed  (主色)
primary-700: #6d28d9  (深紫)
```

### 中性色（Gray Scale）
```css
gray-50:  #f9fafb  (浅灰背景)
gray-100: #f3f4f6  (分割线)
gray-600: #4b5563  (次要文字)
gray-900: #111827  (主要文字)
```

## 🧩 方格背景样式

### 1. `.bg-grid-pattern` - 经典网格
最接近 Claude 官网的网格效果，40x40px 的方格：
```vue
<section class="bg-grid-pattern">
  <!-- 内容 -->
</section>
```

### 2. `.bg-dot-pattern` - 点状图案
更细腻的点状装饰，24x24px 间距：
```vue
<section class="bg-dot-pattern">
  <!-- 内容 -->
</section>
```

### 3. `.bg-diagonal-pattern` - 对角线网格
45度角的对角线图案：
```vue
<section class="bg-diagonal-pattern">
  <!-- 内容 -->
</section>
```

### 4. `.bg-hero-pattern` - 首页英雄区
渐变背景叠加网格，适合页面顶部：
```vue
<section class="bg-hero-pattern">
  <!-- Hero 内容 -->
</section>
```

### 5. `.bg-gradient-grid` - 渐变网格
紫色渐变背景加网格：
```vue
<section class="bg-gradient-grid">
  <!-- 内容 -->
</section>
```

## 💡 使用建议

### 组件样式

#### 按钮样式
```vue
<!-- 主要按钮（紫色渐变） -->
<NuxtLink to="/blog" class="btn-primary">
  浏览文章
</NuxtLink>

<!-- 次要按钮（白色） -->
<NuxtLink to="/about" class="btn-secondary">
  了解更多
</NuxtLink>
```

#### 卡片样式
```vue
<article class="card">
  <h3>卡片标题</h3>
  <p>卡片内容</p>
</article>
```

### 布局建议

1. **首页 Hero 区**
   - 使用 `.bg-hero-pattern`
   - 大标题 + 副标题
   - 两个主要 CTA 按钮

2. **内容区块**
   - 使用 `.bg-grid-pattern` 或 `.bg-dot-pattern`
   - 添加适当的内边距（py-16 到 py-24）
   - 居中对齐的区块标题

3. **卡片网格**
   - 使用 `grid-cols-1 md:grid-cols-2 lg:grid-cols-3`
   - 卡片间距 `gap-8`
   - 配合 `.card` 样式

4. **交替背景**
   - 白色 → 方格 → 白色 → 方格
   - 创造视觉节奏感

## 🎭 Claude 官网设计元素

### 视觉特征
- ✅ 方格背景图案
- ✅ 大量留白
- ✅ 简洁的几何图标
- ✅ 柔和的动画效果
- ✅ 专业的排版

### 色彩使用
- 背景以白色为主
- 方格使用低透明度（5-15%）
- 强调色使用品牌紫色
- 文字使用深灰色而非纯黑

### 交互效果
- 悬停时的微妙阴影变化
- 平滑的颜色过渡（200-300ms）
- 轻微的位移动画（-translate-y-0.5 到 -1）
- 卡片边框颜色变化

## 🚀 自定义样式

如果需要创建新的背景图案，可以参考以下模板：

```css
/* 自定义网格图案 */
.your-custom-pattern {
  background-image:
    linear-gradient(to right, rgba(124, 58, 237, [透明度]) 1px, transparent 1px),
    linear-gradient(to bottom, rgba(124, 58, 237, [透明度]) 1px, transparent 1px);
  background-size: [大小]px [大小]px;
}
```

## 📱 响应式设计

所有样式都支持响应式：
- Mobile: < 768px
- Tablet: 768px - 1024px
- Desktop: > 1024px

示例：
```vue
<section class="py-12 md:py-16 lg:py-24">
  <!-- 移动端 12，平板 16，桌面 24 的内边距 -->
</section>
```

## 🎓 最佳实践

1. **留白原则**：区块之间至少使用 py-16（64px）
2. **颜色限制**：不要使用超过 3-4 种主要颜色
3. **一致性**：保持圆角、间距、字体大小的统一
4. **可读性**：确保文字对比度至少 4.5:1
5. **性能**：CSS 渐变比图片更高效

---

设计灵感来源：[Claude by Anthropic](https://www.anthropic.com/)
