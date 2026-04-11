import { createRouter, createWebHashHistory } from 'vue-router'
import HomePage from '../views/HomePage.vue'
import BlogPost from '../views/BlogPost.vue'

const routes = [
  { path: '/', component: HomePage },
  { path: '/blog/:slug', component: BlogPost, name: 'blog-post' },
]

export const router = createRouter({
  history: createWebHashHistory(),
  routes,
  scrollBehavior() {
    return { top: 0 }
  },
})
