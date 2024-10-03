import {createRouter, createWebHistory} from "vue-router";

import home from "./page/CategoryPicker.vue";

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: "/",
            name: "home",
            component: home,
        },

        {
            path: '/homepage',
            name: 'homepage',
            component: () => import('./page/CategoryPicker.vue'),
        },
        {
            path: '/:page',
            name: 'homepage-page',
            component: () => import('./page/DataStore.vue'),
        },
        {
            path: "/results",
            name: "results",
            component: () => import("./page/FilteredResults.vue")
        },
    ],
});

export default router;
