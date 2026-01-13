<template>
  <div class="py-12 md:py-20">
    <div class="container-custom">
      <div class="max-w-6xl mx-auto">
        <!-- 返回按钮 -->
        <NuxtLink
          to="/blog"
          class="inline-flex items-center text-gray-600 hover:text-gray-900 mb-8 transition-colors"
        >
          <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
          </svg>
          返回文章列表
        </NuxtLink>

        <div class="flex flex-col lg:flex-row gap-8 lg:gap-12">
          <!-- 主内容区 -->
          <div class="flex-1 min-w-0">
            <!-- Loading State -->
            <div v-if="pending" class="text-center py-12">
              <div class="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600"></div>
            </div>

            <!-- Article Content -->
            <article v-else-if="post" class="bg-white rounded-2xl shadow-lg border border-gray-100 overflow-hidden">
              <!-- Cover Image -->
              <div v-if="post.cover" class="w-full h-64 md:h-96 overflow-hidden bg-gradient-to-br from-gray-100 to-gray-200">
                <img
                  :src="post.cover"
                  :alt="post.title"
                  class="w-full h-full object-cover hover:scale-105 transition-transform duration-500"
                />
              </div>

              <!-- Article Header -->
              <div class="p-6 md:p-10">
                <!-- Meta Info -->
                <div class="flex items-center gap-3 text-sm text-gray-500 mb-6 flex-wrap">
                  <time :datetime="post.date" class="flex items-center px-3 py-1.5 bg-gray-100 rounded-lg">
                    <svg class="w-4 h-4 mr-1.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                    </svg>
                    {{ formatDate(post.date) }}
                  </time>
                  <span v-if="post.category" class="px-3 py-1.5 bg-gradient-to-r from-primary-500 to-primary-600 text-white rounded-lg text-xs font-medium shadow-sm">
                    {{ post.category }}
                  </span>
                  <span v-if="post.readTime" class="flex items-center px-3 py-1.5 bg-gray-100 rounded-lg">
                    <svg class="w-4 h-4 mr-1.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                    {{ post.readTime }} 分钟
                  </span>
                </div>

                <!-- Title -->
                <h1 class="text-3xl md:text-4xl lg:text-5xl font-bold text-gray-900 mb-6 leading-tight">
                  {{ post.title }}
                </h1>

                <!-- Description -->
                <p v-if="post.description" class="text-xl text-gray-600 mb-10 leading-relaxed border-l-4 border-primary-500 pl-5 py-2 bg-gradient-to-r from-primary-50 to-transparent">
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

          <!-- 右侧目录导航 -->
          <aside class="hidden lg:block w-64 flex-shrink-0">
            <div v-if="post" class="sticky top-24">
              <div class="bg-white rounded-xl border border-gray-200 p-5 shadow-sm">
                <h3 class="text-sm font-semibold text-gray-900 mb-4 flex items-center">
                  <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 10h16M4 14h16M4 18h16" />
                  </svg>
                  目录
                </h3>

                <nav v-if="toc.length > 0" class="space-y-2">
                  <a
                    v-for="item in toc"
                    :key="item.id"
                    :href="`#${item.id}`"
                    :class="[
                      'block text-sm py-1.5 px-2 rounded-lg transition-all duration-200',
                      'hover:bg-gray-100 hover:text-gray-900',
                      activeHeading === item.id
                        ? 'bg-primary-50 text-primary-700 font-medium border-l-2 border-primary-600'
                        : 'text-gray-600 border-l-2 border-transparent'
                    ]"
                    :style="{ paddingLeft: `${item.level * 0.75 + 0.5}rem` }"
                    @click.prevent="scrollToHeading(item.id)"
                  >
                    {{ item.text }}
                  </a>
                </nav>
                <div v-else class="text-xs text-gray-400 py-4">
                  文章暂无目录
                </div>
              </div>
            </div>
          </aside>
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

// 生成目录 - 更可靠的提取方法
const toc = computed(() => {
  if (!post.value) {
    console.log('No post value')
    return []
  }

  // 调试：输出 post 结构
  console.log('Post structure:', post.value)
  console.log('Post body:', post.value?.body)
  console.log('Post body children:', post.value?.body?.children)

  // 方法1: 从 Nuxt Content 解析的树结构中提取标题
  if (post.value?.body?.children && Array.isArray(post.value.body.children)) {
    const headings = []

    const extractHeadings = (children) => {
      children.forEach(child => {
        if (child.tag === 'h2' || child.tag === 'h3' || child.tag === 'h4') {
          const text = extractText(child)
          const headingLevel = parseInt(child.tag.charAt(1)) - 2 // h2=0, h3=1, h4=2
          const id = child.props?.id || generateId(text)

          headings.push({
            id,
            text,
            level: headingLevel
          })

          console.log('Found heading:', { tag: child.tag, text, id, level: headingLevel })
        }

        // 递归处理子元素
        if (child.children && Array.isArray(child.children)) {
          extractHeadings(child.children)
        }
      })
    }

    extractHeadings(post.value.body.children)
    console.log('Extracted headings:', headings)

    return headings
  }

  console.log('No body children found')
  return []
})

// 从节点中提取文本内容
const extractText = (node) => {
  if (!node) return ''

  if (typeof node === 'string') return node

  if (Array.isArray(node.children)) {
    return node.children.map(extractText).join('')
  }

  if (node.children) {
    return extractText(node.children)
  }

  return node.value || ''
}

// 生成 URL 友好的 ID
const generateId = (text) => {
  return text
    .toLowerCase()
    .replace(/[^\w\u4e00-\u9fa5\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/^-+|-+$/g, '')
}

// 当前激活的标题
const activeHeading = ref('')

// 滚动到指定标题
const scrollToHeading = (id) => {
  const element = document.getElementById(id)
  if (element) {
    const offset = 100 // 顶部偏移量
    const elementPosition = element.getBoundingClientRect().top + window.scrollY
    const offsetPosition = elementPosition - offset

    window.scrollTo({
      top: offsetPosition,
      behavior: 'smooth'
    })

    activeHeading.value = id
  }
}

// 监听滚动，更新激活的标题
onMounted(() => {
  // 等待 DOM 更新后添加 ID 和监听滚动
  nextTick(() => {
    const addIdsToHeadings = () => {
      const prose = document.querySelector('.prose')
      if (!prose) {
        console.log('Prose element not found')
        return
      }

      const headings = prose.querySelectorAll('h2, h3, h4')
      console.log('Found headings:', headings.length)

      headings.forEach((heading, index) => {
        if (!heading.id) {
          // 如果标题没有 ID，生成一个
          const text = heading.textContent || ''
          const id = generateId(text) || `heading-${index}`
          heading.id = id
          console.log('Added ID to heading:', id, text)
        }
      })

      // 初始化当前激活的标题
      if (headings.length > 0) {
        activeHeading.value = headings[0].id
      }
    }

    // 延迟执行确保内容已完全渲染
    const init = () => {
      addIdsToHeadings()
      // 再次尝试以防万一
      setTimeout(addIdsToHeadings, 200)
    }

    init()
  })

  // 监听滚动
  const handleScroll = () => {
    const headings = document.querySelectorAll('.prose h2, .prose h3, .prose h4')
    if (headings.length === 0) return

    const scrollTop = window.scrollY + 150

    // 找到当前可见的标题
    let currentHeading = ''
    for (let i = headings.length - 1; i >= 0; i--) {
      const heading = headings[i]
      if (heading.offsetTop <= scrollTop) {
        currentHeading = heading.id
        break
      }
    }

    if (currentHeading) {
      activeHeading.value = currentHeading
    }
  }

  window.addEventListener('scroll', handleScroll, { passive: true })

  // 初始调用
  setTimeout(handleScroll, 300)

  onUnmounted(() => {
    window.removeEventListener('scroll', handleScroll)
  })
})

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
