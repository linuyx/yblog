<template>
  <div>
    <!-- Hero Section -->
    <section class="bg-gradient-to-b from-gray-50 to-white py-20 md:py-32">
      <div class="container-custom">
        <div class="max-w-4xl mx-auto text-center">
          <h1 class="text-4xl md:text-6xl font-bold text-gray-900 mb-6 leading-tight">
            欢迎来到我的博客
          </h1>
          <p class="text-xl md:text-2xl text-gray-600 mb-10 leading-relaxed">
            分享技术、思考与创意
            <br class="hidden md:block" />
            探索无限可能
          </p>
          <div class="flex flex-col sm:flex-row gap-4 justify-center">
            <NuxtLink to="/blog" class="btn-primary">
              浏览文章
            </NuxtLink>
            <NuxtLink to="/about" class="btn-secondary">
              了解更多
            </NuxtLink>
          </div>
        </div>
      </div>
    </section>

    <!-- Featured Posts Section -->
    <section class="py-16 md:py-24">
      <div class="container-custom">
        <div class="text-center mb-12">
          <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
            最新文章
          </h2>
          <p class="text-lg text-gray-600">
            探索最新的思考和见解
          </p>
        </div>

        <div v-if="pending" class="text-center py-12">
          <div class="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600"></div>
        </div>

        <div v-else-if="recentPosts.length > 0" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <article
            v-for="post in recentPosts"
            :key="post._path"
            class="card group cursor-pointer"
          >
            <NuxtLink :to="post._path">
              <div v-if="post.cover" class="mb-4 overflow-hidden rounded-lg">
                <img
                  :src="post.cover"
                  :alt="post.title"
                  class="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-300"
                />
              </div>
              <div class="flex-1">
                <div class="flex items-center gap-2 text-sm text-gray-500 mb-3">
                  <time :datetime="post.date">
                    {{ formatDate(post.date) }}
                  </time>
                  <span v-if="post.category" class="px-2 py-1 bg-primary-100 text-primary-700 rounded text-xs">
                    {{ post.category }}
                  </span>
                </div>
                <h3 class="text-xl font-semibold text-gray-900 mb-2 group-hover:text-primary-600 transition-colors">
                  {{ post.title }}
                </h3>
                <p class="text-gray-600 text-sm line-clamp-2">
                  {{ post.description }}
                </p>
              </div>
            </NuxtLink>
          </article>
        </div>

        <div v-else class="text-center py-12">
          <p class="text-gray-500">暂无文章</p>
        </div>
      </div>
    </section>

    <!-- About Preview Section -->
    <section class="bg-gray-50 py-16 md:py-24">
      <div class="container-custom">
        <div class="max-w-4xl mx-auto">
          <div class="text-center mb-12">
            <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
              关于这个博客
            </h2>
            <p class="text-lg text-gray-600 max-w-2xl mx-auto">
              基于 Nuxt 3 和 Tailwind CSS 构建的现代化个人博客
            </p>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="text-center">
              <div class="w-16 h-16 bg-primary-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <svg class="w-8 h-8 text-primary-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
                </svg>
              </div>
              <h3 class="text-lg font-semibold text-gray-900 mb-2">快速响应</h3>
              <p class="text-gray-600 text-sm">
                基于 Nuxt 3 构建，提供极致的加载速度和用户体验
              </p>
            </div>

            <div class="text-center">
              <div class="w-16 h-16 bg-primary-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <svg class="w-8 h-8 text-primary-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 5a1 1 0 011-1h14a1 1 0 011 1v2a1 1 0 01-1 1H5a1 1 0 01-1-1V5zM4 13a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H5a1 1 0 01-1-1v-6zM16 13a1 1 0 011-1h2a1 1 0 011 1v6a1 1 0 01-1 1h-2a1 1 0 01-1-1v-6z" />
                </svg>
              </div>
              <h3 class="text-lg font-semibold text-gray-900 mb-2">优雅设计</h3>
              <p class="text-gray-600 text-sm">
                参考 Claude 官网设计风格，简洁优雅的视觉体验
              </p>
            </div>

            <div class="text-center">
              <div class="w-16 h-16 bg-primary-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <svg class="w-8 h-8 text-primary-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                </svg>
              </div>
              <h3 class="text-lg font-semibold text-gray-900 mb-2">Markdown</h3>
              <p class="text-gray-600 text-sm">
                使用 Markdown 编写文章，简单高效的内容管理
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
// Fetch recent posts
const { data: recentPosts, pending } = await useAsyncData('home-recent-posts', () =>
  queryContent('/blog')
    .sort({ date: -1 })
    .limit(6)
    .find()
)

// Format date helper
const formatDate = (date) => {
  return new Date(date).toLocaleDateString('zh-CN', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}

// Set page meta
useHead({
  title: '首页'
})
</script>
