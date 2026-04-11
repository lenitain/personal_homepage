<script setup lang="ts">
import { useContent } from './composables/useContent'
import NavBar from './components/NavBar.vue'
import Footer from './components/Footer.vue'

const { config, searchQuery } = useContent()

function onSearch(query: string) {
  searchQuery.value = query
}
</script>

<template>
  <div class="min-h-screen bg-slate-300/10">
    <NavBar @search="onSearch">
      <template #site-name>{{ config.site_title }}</template>
    </NavBar>

    <main class="max-w-5xl mx-auto px-4">
      <router-view />
    </main>

    <Footer />
  </div>
</template>
