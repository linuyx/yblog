<template>
  <div class="py-12 md:py-20">
    <div class="container-custom">
      <div class="max-w-4xl mx-auto">
        <!-- Page Header -->
        <div class="text-center mb-12">
          <h1 class="text-4xl md:text-5xl font-bold text-gray-900 mb-4">
            关于我
          </h1>
          <p class="text-lg text-gray-600">
            热爱技术，享受创造
          </p>
        </div>

        <!-- About Content -->
        <div class="bg-white rounded-lg shadow-sm border border-gray-100 p-8 md:p-12 mb-8">
          <div class="prose prose-lg max-w-none">
            <h2 class="text-2xl font-bold text-gray-900 mb-4">你好！</h2>
            <p class="text-gray-700 leading-relaxed mb-6">
              欢迎来到“一只韩非子”的个人博客。我是一名开发者，热爱学习新技术，享受创造的过程。
              这个博客是我记录学习笔记、分享技术见解和思考的地方。
            </p>
            <p class="text-gray-700 leading-relaxed mb-6">
              我相信技术的力量，也相信持续学习的重要性。希望通过这个博客，
              与更多志同道合的朋友交流，共同进步。
            </p>

            <h2 class="text-2xl font-bold text-gray-900 mb-4 mt-8">技术栈</h2>
            <p class="text-gray-700 leading-relaxed mb-4">
              这个博客使用以下技术构建：
            </p>
            <ul class="list-disc list-inside text-gray-700 space-y-2 mb-6">
              <li><strong>Nuxt 3</strong> - Vue 3 全栈框架</li>
              <li><strong>Tailwind CSS</strong> - 实用优先的 CSS 框架</li>
              <li><strong>@nuxt/content</strong> - Git 驱动的头部 CMS</li>
              <li><strong>Markdown</strong> - 内容管理</li>
            </ul>

            <h2 class="text-2xl font-bold text-gray-900 mb-4 mt-8">联系方式</h2>
            <p class="text-gray-700 leading-relaxed">
              如果你对技术有热情，想交流学习，欢迎通过以下方式联系我：
            </p>
            <div class="flex gap-4 mt-4">
              <a
                href="https://github.com"
                target="_blank"
                rel="noopener noreferrer"
                class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50 transition-colors"
              >
                <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
                </svg>
                GitHub
              </a>
              <a
                href="https://twitter.com"
                target="_blank"
                rel="noopener noreferrer"
                class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50 transition-colors"
              >
                <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
                </svg>
                Twitter
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
useHead({
  title: '关于'
})
</script>
