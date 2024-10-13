import 'element-plus/dist/index.css'
import './css/index.css'
import './css/budget.css'
import './css/Homepage.css'
import locale from 'element-plus/es/locale/lang/zh-cn'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router.js'
import ElementPlus from 'element-plus'

const app = createApp(App)

app.use(router)
app.use(ElementPlus, { locale })
app.mount('#app')
