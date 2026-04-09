<script setup lang="ts">
defineProps<{
  name: string
  tagline: string
}>()
</script>

<template>
  <div class="py-12">
    <h1 class="text-4xl font-bold text-slate-900 mb-3">{{ name }}</h1>
    <p class="text-lg text-slate-600">{{ tagline }}</p>
  </div>
</template>
