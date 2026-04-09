// @ts-ignore - MoonBit compiled module
import { siteConfig, searchProjects } from '../moonbit/index'

export interface Project {
  title: string
  description: string
  url: string
  tags: string[]
}

export interface Skill {
  name: string
  category: string
  level: number
}

export interface SocialLink {
  platform: string
  url: string
  icon: string
}

export interface BlogPost {
  title: string
  url: string
  date: string
}

export interface SiteConfig {
  name: string
  tagline: string
  avatar: string
  projects: Project[]
  skills: Skill[]
  socials: SocialLink[]
  posts: BlogPost[]
}

export function useContent() {
  const config: SiteConfig = siteConfig()

  function search(query: string): Project[] {
    return searchProjects(config.projects, query)
  }

  function getSkillsByCategory(): Map<string, Skill[]> {
    const map = new Map<string, Skill[]>()
    for (const skill of config.skills) {
      const list = map.get(skill.category) || []
      list.push(skill)
      map.set(skill.category, list)
    }
    return map
  }

  return {
    config,
    search,
    getSkillsByCategory,
  }
}
