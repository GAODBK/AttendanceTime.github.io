import { createRouter, createWebHistory } from "vue-router";

import home from "./page/dataSource.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: home,
      children: [
        {
          path: "/:page",
          name: "homepage-page",
          component: () => import("./page/dataSource.vue"),
        },
      ],
    },
    {
      path: "/results",
      name: "results",
      component: () => import("./page/YourCart.vue"),
    },
  ],
});

export default router;
