<script setup lang="ts">
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { marked } from 'marked'
import { useContent } from '../composables/useContent'

const route = useRoute()
const router = useRouter()
const { config } = useContent()

const post = computed(() =>
  config.posts.find(p => p.url === `#${route.params.slug}`)
)

const renderedBody = computed(() => {
  if (!post.value) return ''
  return marked.parse(post.value.body, { async: false }) as string
})
</script>

<template>
  <div v-if="post" class="py-8 max-w-3xl mx-auto">
    <button
      @click="router.back()"
      class="text-sm text-slate-400 hover:text-slate-600 mb-6 flex items-center gap-1"
    >
      <span>&larr;</span> 返回
    </button>

    <h1 class="text-3xl font-bold text-slate-800 mb-2">{{ post.title }}</h1>

    <div class="flex items-center gap-3 mb-8 text-sm text-slate-400">
      <time>{{ post.date }}</time>
      <span v-if="post.tags.length">&middot;</span>
      <div class="flex gap-2">
        <span
          v-for="tag in post.tags" :key="tag"
          class="px-2 py-0.5 bg-slate-100 text-slate-500 rounded text-xs"
        >{{ tag }}</span>
      </div>
    </div>

    <article
      class="prose prose-slate max-w-none"
      v-html="renderedBody"
    />
  </div>

  <div v-else class="py-20 text-center text-slate-400">
    <p class="text-xl mb-4">文章不存在</p>
    <button @click="router.push('/')" class="text-sky-600 hover:underline">返回首页</button>
  </div>
</template>
