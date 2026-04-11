<script setup lang="ts">
import { useContent } from '../composables/useContent'
import HeroSection from '../components/HeroSection.vue'
import TechStack from '../components/TechStack.vue'
import ProjectList from '../components/ProjectList.vue'
import BlogLinks from '../components/BlogLinks.vue'
import SocialLinks from '../components/SocialLinks.vue'

const { config, filteredProjects, getSkillsByCategory } = useContent()
const skillsByCategory = getSkillsByCategory()
</script>

<template>
  <HeroSection :name="config.name" :tagline="config.tagline" />
  <TechStack :categories="skillsByCategory" />
  <ProjectList :projects="filteredProjects" />
  <BlogLinks :posts="config.posts" />
  <SocialLinks :socials="config.socials" />
</template>
