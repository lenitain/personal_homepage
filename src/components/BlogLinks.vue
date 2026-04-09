<script setup lang="ts">
import type { BlogPost } from '../composables/useContent'

defineProps<{
  posts: BlogPost[]
}>()
</script>

<template>
  <div class="py-8">
    <h2 class="text-2xl font-bold text-slate-800 mb-6">博客 / 文章</h2>
    <ul class="space-y-3">
      <li v-for="post in posts" :key="post.title" class="flex items-baseline gap-4">
        <a
          :href="post.url"
          class="text-slate-700 hover:text-sky-600 transition-colors font-medium"
        >
          {{ post.title }}
        </a>
        <span class="text-xs text-slate-400 whitespace-nowrap">{{ post.date }}</span>
      </li>
    </ul>
  </div>
</template>
