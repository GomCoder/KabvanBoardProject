import Vue from 'vue'
import VueRouter from 'vue-router'
import LoginPage from '@/views/LoginPage'

Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    name: 'LoginPage',
    component: LoginPage
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
