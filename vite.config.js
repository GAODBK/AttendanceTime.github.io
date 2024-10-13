import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    vue(),
  ],
  resolve: {
    alias: {
      // 设置别名， '@' 指向 'src' 目录
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }

    /* 设置别名
  resolve: {
    alias: [
      {
        // 设置别名， '@' 指向 'src' 目录
        find: "@",
        replacement: path.resolve(__dirname, './src')
      },
    ]
  },
  server: {
    open: true,
    port: 3000,
    proxy: {
      "/api": {
        target: "http://127.0.0.1:8081/springboot-vue3-email", //
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, ""),
      },
    },
  },*/
  }
})
