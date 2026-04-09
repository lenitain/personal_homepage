<script setup lang="ts">
import { ref, computed } from 'vue'
import { useContent } from './composables/useContent'
import NavBar from './components/NavBar.vue'
import HeroSection from './components/HeroSection.vue'
import TechStack from './components/TechStack.vue'
import ProjectList from './components/ProjectList.vue'
import BlogLinks from './components/BlogLinks.vue'
import SocialLinks from './components/SocialLinks.vue'
import Footer from './components/Footer.vue'

const { config, search, getSkillsByCategory } = useContent()

const searchQuery = ref('')
const filteredProjects = computed(() => search(searchQuery.value))
const skillsByCategory = getSkillsByCategory()

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
      <HeroSection :name="config.name" :tagline="config.tagline" />
      <TechStack :categories="skillsByCategory" />
      <ProjectList :projects="filteredProjects" />
      <BlogLinks :posts="config.posts" />
      <SocialLinks :socials="config.socials" />
    </main>

    <Footer />
  </div>
</template>
