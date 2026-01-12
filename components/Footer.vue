<template>
  <footer class="bg-gray-50 border-t border-gray-100">
    <div class="container-custom py-12">
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <!-- About -->
        <div>
          <h3 class="text-lg font-semibold text-gray-900 mb-4">YBlog</h3>
          <p class="text-gray-600 text-sm leading-relaxed">
            一个简洁优雅的个人博客，基于 Nuxt 3 和 Tailwind CSS 构建，分享技术与思考。
          </p>
        </div>

        <!-- Quick Links -->
        <div>
          <h3 class="text-lg font-semibold text-gray-900 mb-4">快速链接</h3>
          <ul class="space-y-2">
            <li>
              <NuxtLink to="/" class="text-gray-600 hover:text-gray-900 text-sm transition-colors">
                首页
              </NuxtLink>
            </li>
            <li>
              <NuxtLink to="/blog" class="text-gray-600 hover:text-gray-900 text-sm transition-colors">
                文章
              </NuxtLink>
            </li>
            <li>
              <NuxtLink to="/about" class="text-gray-600 hover:text-gray-900 text-sm transition-colors">
                关于
              </NuxtLink>
            </li>
          </ul>
        </div>

        <!-- Connect -->
        <div>
          <h3 class="text-lg font-semibold text-gray-900 mb-4">联系方式</h3>
          <ul class="space-y-2">
            <li>
              <a href="https://github.com" target="_blank" rel="noopener noreferrer" class="text-gray-600 hover:text-gray-900 text-sm transition-colors">
                GitHub
              </a>
            </li>
            <li>
              <a href="https://twitter.com" target="_blank" rel="noopener noreferrer" class="text-gray-600 hover:text-gray-900 text-sm transition-colors">
                Twitter
              </a>
            </li>
          </ul>
        </div>
      </div>

      <div class="mt-8 pt-8 border-t border-gray-200">
        <p class="text-center text-gray-500 text-sm">
          © {{ new Date().getFullYear() }} YBlog. All rights reserved.
        </p>
      </div>
    </div>
  </footer>
</template>
