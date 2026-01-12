<template>
  <div class="py-12 md:py-20">
    <div class="container-custom">
      <div class="max-w-4xl mx-auto">
        <!-- Back Button -->
        <NuxtLink
          to="/blog"
          class="inline-flex items-center text-gray-600 hover:text-gray-900 mb-8 transition-colors"
        >
          <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
          </svg>
          返回文章列表
        </NuxtLink>

        <!-- Loading State -->
        <div v-if="pending" class="text-center py-12">
          <div class="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600"></div>
        </div>

        <!-- Article Content -->
        <article v-else-if="post" class="bg-white rounded-lg shadow-sm border border-gray-100 overflow-hidden">
          <!-- Cover Image -->
          <div v-if="post.cover" class="w-full h-64 md:h-96 overflow-hidden">
            <img
              :src="post.cover"
              :alt="post.title"
              class="w-full h-full object-cover"
            />
          </div>

          <!-- Article Header -->
          <div class="p-6 md:p-10">
            <div class="flex items-center gap-3 text-sm text-gray-500 mb-4 flex-wrap">
              <time :datetime="post.date">
                {{ formatDate(post.date) }}
              </time>
              <span v-if="post.category" class="px-3 py-1 bg-primary-100 text-primary-700 rounded-full text-xs font-medium">
                {{ post.category }}
              </span>
              <span v-if="post.readTime" class="flex items-center">
                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                {{ post.readTime }} 分钟阅读
              </span>
            </div>

            <h1 class="text-3xl md:text-4xl lg:text-5xl font-bold text-gray-900 mb-6">
              {{ post.title }}
            </h1>

            <p v-if="post.description" class="text-xl text-gray-600 mb-8 leading-relaxed">
              {{ post.description }}
            </p>

            <!-- Article Body -->
            <div class="prose prose-lg max-w-none">
              <ContentRenderer :value="post" />
            </div>
          </div>
        </article>

        <!-- Not Found -->
        <div v-else class="text-center py-12">
          <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
          </svg>
          <h3 class="mt-2 text-lg font-medium text-gray-900">文章未找到</h3>
          <p class="mt-1 text-gray-500">抱歉，您访问的文章不存在</p>
          <NuxtLink to="/blog" class="btn-primary mt-6">
            返回文章列表
          </NuxtLink>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
const route = useRoute()

// Fetch post
const { data: post, pending } = await useAsyncData(`post-${route.path}`, () =>
  queryContent(route.path).findOne()
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
  title: computed(() => post.value?.title || '文章详情')
})

// Set meta tags
useSeoMeta({
  title: computed(() => post.value?.title || '文章详情'),
  description: computed(() => post.value?.description || ''),
  ogTitle: computed(() => post.value?.title || '文章详情'),
  ogDescription: computed(() => post.value?.description || ''),
  ogImage: computed(() => post.value?.cover || ''),
})
</script>
