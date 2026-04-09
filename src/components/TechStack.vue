<script setup lang="ts">
import type { Skill } from '../composables/useContent'

defineProps<{
  categories: Map<string, Skill[]>
}>()

function levelDots(level: number): string {
  return '\u25cf'.repeat(level) + '\u25cb'.repeat(5 - level)
}
</script>

<template>
  <div class="py-8">
    <h2 class="text-2xl font-bold text-slate-800 mb-6">技术栈</h2>
    <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
      <div v-for="[category, skills] in categories" :key="category">
        <h3 class="text-sm font-semibold text-slate-500 uppercase tracking-wider mb-3">{{ category }}</h3>
        <ul class="space-y-2">
          <li v-for="skill in skills" :key="skill.name" class="flex items-center justify-between">
            <span class="text-slate-700">{{ skill.name }}</span>
            <span class="text-xs text-slate-400 tracking-widest" :title="`${skill.level}/5`">{{ levelDots(skill.level) }}</span>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
