<template>
  <div class="py-12 md:py-20">
    <div class="container-custom">
      <!-- Page Header -->
      <div class="text-center mb-12">
        <h1 class="text-4xl md:text-5xl font-bold text-gray-900 mb-4">
          文章列表
        </h1>
        <p class="text-lg text-gray-600 max-w-2xl mx-auto">
          探索技术、思考与创意的集合
        </p>
      </div>

      <!-- Loading State -->
      <div v-if="pending" class="text-center py-12">
        <div class="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600"></div>
      </div>

      <!-- Posts Grid -->
      <div v-else-if="posts.length > 0">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-8">
          <article
            v-for="post in posts"
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
                <div class="flex items-center gap-2 text-sm text-gray-500 mb-3 flex-wrap">
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
                <p class="text-gray-600 text-sm line-clamp-3">
                  {{ post.description }}
                </p>
              </div>
            </NuxtLink>
          </article>
        </div>

        <!-- Pagination -->
        <div v-if="totalPages > 1" class="flex justify-center items-center gap-2">
          <button
            v-if="currentPage > 1"
            @click="goToPage(currentPage - 1)"
            class="px-4 py-2 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50 transition-colors"
          >
            上一页
          </button>

          <button
            v-for="page in totalPages"
            :key="page"
            @click="goToPage(page)"
            :class="[
              'px-4 py-2 rounded-md transition-colors',
              page === currentPage
                ? 'bg-primary-600 text-white'
                : 'border border-gray-300 text-gray-700 hover:bg-gray-50'
            ]"
          >
            {{ page }}
          </button>

          <button
            v-if="currentPage < totalPages"
            @click="goToPage(currentPage + 1)"
            class="px-4 py-2 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50 transition-colors"
          >
            下一页
          </button>
        </div>
      </div>

      <!-- Empty State -->
      <div v-else class="text-center py-12">
        <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
        </svg>
        <h3 class="mt-2 text-lg font-medium text-gray-900">暂无文章</h3>
        <p class="mt-1 text-gray-500">还没有发布任何文章</p>
      </div>
    </div>
  </div>
</template>

<script setup>
// Pagination state
const currentPage = ref(1)
const postsPerPage = 9

// Fetch all posts
const { data: allPosts } = await useAsyncData('blog-posts', () =>
  queryContent('/blog')
    .sort({ date: -1 })
    .find()
)

// Computed posts for current page
const posts = computed(() => {
  const start = (currentPage.value - 1) * postsPerPage
  const end = start + postsPerPage
  return allPosts.value?.slice(start, end) || []
})

// Total pages
const totalPages = computed(() => {
  return Math.ceil((allPosts.value?.length || 0) / postsPerPage)
})

// Go to page function
const goToPage = (page) => {
  currentPage.value = page
  window.scrollTo({ top: 0, behavior: 'smooth' })
}

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
  title: '文章列表'
})
</script>
