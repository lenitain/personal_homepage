<script setup lang="ts">
import { ref } from 'vue'

const query = ref('')
const emit = defineEmits<{
  search: [query: string]
}>()

function onInput(e: Event) {
  const target = e.target as HTMLInputElement
  query.value = target.value
  emit('search', query.value)
}
</script>

<template>
  <div class="sticky top-0 z-40 w-full backdrop-blur-xl flex-none border-b border-slate-900/10 bg-white/75">
    <div class="max-w-5xl mx-auto">
      <div class="py-4 px-4 lg:px-0 flex items-center justify-between">
        <a href="/" class="text-lg font-bold text-slate-800 hover:text-slate-600">
          <slot name="site-name">My Wiki</slot>
        </a>
        <div class="flex items-center gap-4">
          <input
            type="text"
            :value="query"
            @input="onInput"
            placeholder="search..."
            class="text-xs font-mono w-24 px-2 py-1 border border-slate-300 rounded bg-white/50 focus:outline-none focus:border-slate-500 focus:w-40 transition-all"
          />
          <a
            href="https://github.com/lenitain/personal_homepage"
            target="_blank"
            rel="noopener noreferrer"
            class="text-slate-600 hover:text-slate-900 transition-colors"
            title="GitHub"
          >
            <svg class="w-5 h-5" viewBox="0 0 16 16" fill="currentColor">
              <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"/>
            </svg>
          </a>
          <nav class="hidden sm:flex text-sm font-semibold text-slate-700 gap-6">
            <slot name="nav-links" />
          </nav>
        </div>
      </div>
    </div>
  </div>
</template>
