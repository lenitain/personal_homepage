<script setup lang="ts">
import type { SocialLink } from '../composables/useContent'

defineProps<{
  socials: SocialLink[]
}>()

function iconEmoji(icon: string): string {
  const map: Record<string, string> = {
    github: '\ud83d\udcbb',
    mail: '\ud83d\udce7',
    twitter: '\ud83d\udc26',
    blog: '\ud83d\udcd6',
    linkedin: '\ud83d\udcbc',
  }
  return map[icon] ?? '\ud83d\udd17'
}
</script>

<template>
  <div class="py-8">
    <h2 class="text-2xl font-bold text-slate-800 mb-6">联系方式</h2>
    <div class="flex gap-6 flex-wrap">
      <a
        v-for="social in socials"
        :key="social.platform"
        :href="social.url"
        target="_blank"
        rel="noopener noreferrer"
        class="flex items-center gap-2 text-slate-600 hover:text-sky-600 transition-colors"
      >
        <span>{{ iconEmoji(social.icon) }}</span>
        <span class="text-sm font-medium">{{ social.platform }}</span>
      </a>
    </div>
  </div>
</template>
