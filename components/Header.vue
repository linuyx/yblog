<template>
  <header class="bg-white border-b border-gray-100 sticky top-0 z-50 backdrop-blur-sm bg-white/90">
    <nav class="container-custom">
      <div class="flex justify-between items-center h-16">
        <!-- Logo -->
        <NuxtLink to="/" class="flex items-center space-x-2">
          <span class="text-2xl font-bold text-gray-900">YBlog</span>
        </NuxtLink>

        <!-- Desktop Navigation -->
        <div class="hidden md:flex items-center space-x-8">
          <NuxtLink
            to="/"
            class="text-gray-600 hover:text-gray-900 transition-colors"
            active-class="text-gray-900 font-medium"
          >
            首页
          </NuxtLink>
          <NuxtLink
            to="/blog"
            class="text-gray-600 hover:text-gray-900 transition-colors"
            active-class="text-gray-900 font-medium"
          >
            文章
          </NuxtLink>
          <NuxtLink
            to="/about"
            class="text-gray-600 hover:text-gray-900 transition-colors"
            active-class="text-gray-900 font-medium"
          >
            关于
          </NuxtLink>
        </div>

        <!-- Mobile menu button -->
        <button
          @click="mobileMenuOpen = !mobileMenuOpen"
          class="md:hidden p-2 rounded-md text-gray-600 hover:text-gray-900 hover:bg-gray-100"
        >
          <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path v-if="!mobileMenuOpen" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
            <path v-else stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>

      <!-- Mobile menu -->
      <div v-show="mobileMenuOpen" class="md:hidden pb-4">
        <div class="flex flex-col space-y-3">
          <NuxtLink
            to="/"
            class="text-gray-600 hover:text-gray-900 transition-colors px-3 py-2 rounded-md hover:bg-gray-100"
            active-class="text-gray-900 font-medium bg-gray-100"
            @click="mobileMenuOpen = false"
          >
            首页
          </NuxtLink>
          <NuxtLink
            to="/blog"
            class="text-gray-600 hover:text-gray-900 transition-colors px-3 py-2 rounded-md hover:bg-gray-100"
            active-class="text-gray-900 font-medium bg-gray-100"
            @click="mobileMenuOpen = false"
          >
            文章
          </NuxtLink>
          <NuxtLink
            to="/about"
            class="text-gray-600 hover:text-gray-900 transition-colors px-3 py-2 rounded-md hover:bg-gray-100"
            active-class="text-gray-900 font-medium bg-gray-100"
            @click="mobileMenuOpen = false"
          >
            关于
          </NuxtLink>
        </div>
      </div>
    </nav>
  </header>
</template>

<script setup>
const mobileMenuOpen = ref(false)
</script>
