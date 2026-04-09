<script setup lang="ts">
import type { Project } from '../composables/useContent'

defineProps<{
  projects: Project[]
}>()
</script>

<template>
  <div class="py-8">
    <h2 class="text-2xl font-bold text-slate-800 mb-6">项目</h2>
    <ul class="space-y-4">
      <li v-for="project in projects" :key="project.title">
        <a
          :href="project.url"
          target="_blank"
          rel="noopener noreferrer"
          class="group block p-4 rounded-lg hover:bg-slate-100/50 transition-colors"
        >
          <div class="flex items-baseline gap-3 mb-1">
            <span class="font-semibold text-sky-600 underline decoration-sky-600/30 underline-offset-2 group-hover:decoration-sky-600 transition-colors">
              {{ project.title }}
            </span>
            <span class="text-slate-300">&rarr;</span>
          </div>
          <p class="text-sm text-slate-600 mb-2">{{ project.description }}</p>
          <div class="flex gap-2 flex-wrap">
            <span
              v-for="tag in project.tags"
              :key="tag"
              class="text-xs px-2 py-0.5 rounded-full bg-slate-200/60 text-slate-600"
            >
              {{ tag }}
            </span>
          </div>
        </a>
      </li>
    </ul>
  </div>
</template>
