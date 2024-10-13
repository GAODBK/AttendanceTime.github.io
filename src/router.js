import { createRouter, createWebHistory } from 'vue-router'
import LogInToRegister from './pages/logIn-to-register.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'LogInToRegister',
      component: LogInToRegister
    },

    {
      path: '/Homepage',
      name: 'Homepage',
      component: () => import('./components/top-bar.vue'),
      children: [
        {
          path: '',
          name: 'Introduced',
          component: () => import('./pages/introduced.vue')
        },
        {
          path: '/data',
          name: 'data',
          component: () => import('./components/Data.vue'),

          children: [
            {
              path: '/data/:src',
              name: 'about',
              component: () => import('./components/Mask.vue'),
              props: true
            }
          ]
        },
        {
          path: '/Homepage/budget',
          name: 'budget',
          component: () => import('./pages/budget-page.vue')
        }
      ]
    }
  ]
})

export default router
