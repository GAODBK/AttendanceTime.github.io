import {createRouter, createWebHistory} from 'vue-router'
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
                    path: '/Homepage/WaterfallChart',
                    name: 'WaterfallChart',
                    component: () => import('./pages/waterfall-chart.vue')
                },
                {
                    path: '/Homepage/budget',
                    name: 'budget',
                    component: () => import('./pages/budget-page.vue')
                },
                {
                    path: '/Homepage/Calculator',
                    name: 'Calculator',
                    component: () => import('./pages/Calculator.vue')
                },
                {
                    path: '/Homepage/DragAndRotate',
                    name: 'DragAndRotate',
                    component: () => import('./pages/DragAndRotate.vue')
                },
                {
                    path: '/Homepage/LazyLoading',
                    name: 'LazyLoading',
                    component: () => import('./pages/LazyLoading.vue')
                },
            ]
        },
    ]
})

export default router
