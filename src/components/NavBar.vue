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
          <nav class="hidden sm:flex text-sm font-semibold text-slate-700 gap-6">
            <slot name="nav-links" />
          </nav>
        </div>
      </div>
    </div>
  </div>
</template>
