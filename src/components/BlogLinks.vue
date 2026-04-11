<script setup lang="ts">
import { ref, computed } from 'vue'
import { marked } from 'marked'
import type { BlogPost } from '../composables/useContent'

const props = defineProps<{
  posts: BlogPost[]
}>()

const expanded = ref<Record<string, boolean>>({})

function toggle(title: string) {
  expanded.value[title] = !expanded.value[title]
}

function renderMarkdown(body: string): string {
  return marked.parse(body, { async: false }) as string
}
</script>

<template>
  <div class="py-8">
    <h2 class="text-2xl font-bold text-slate-800 mb-6">博客 / 文章</h2>
    <ul class="space-y-4">
      <li v-for="post in posts" :key="post.title" class="border border-slate-200 rounded-lg">
        <div
          class="flex items-baseline gap-4 px-4 py-3 cursor-pointer hover:bg-slate-50"
          @click="toggle(post.title)"
        >
          <span class="text-slate-400 text-xs select-none transition-transform"
            :class="expanded[post.title] ? 'rotate-90' : ''"
          >&#9654;</span>
          <span class="text-sky-600 font-medium">{{ post.title }}</span>
          <span class="text-xs text-slate-400 whitespace-nowrap ml-auto">{{ post.date }}</span>
        </div>
        <div v-if="expanded[post.title]" class="px-4 pb-4">
          <div class="flex gap-2 mb-3">
            <span
              v-for="tag in post.tags" :key="tag"
              class="text-xs px-2 py-0.5 bg-slate-100 text-slate-500 rounded"
            >{{ tag }}</span>
          </div>
          <article
            class="prose prose-slate prose-sm max-w-none"
            v-html="renderMarkdown(post.body)"
          />
        </div>
      </li>
    </ul>
  </div>
</template>
