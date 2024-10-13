<style scoped>
.container {
  padding: 50px;
  column-count: 4;
  column-gap: 10px;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}


@media (max-width: 1500px) {
  .box {
    column-count: 4;
    padding: 5rem;
  }
}

@media (max-width: 1200px) {
  .box {
    column-count: 3;
    padding: 5rem 10rem;
  }
}

@media (max-width: 900px) {
  .box {
    column-count: 2;
    padding: 5rem 6rem;
  }
}

@media (max-width: 600px) {
  .box {
    column-count: 1;
    padding: 5rem 2rem;
  }
}
</style>

<template>
  <div>
    <div class="container" @click="handleClick">
      <div class="item" v-for="(item, index) in pictures" :key="index">
        <imgbox :item="item" @BGImgInformation="BGImgInformation" @click="text = item.text" />
      </div>
    </div>

    <cartIcon ref="cartRef" />

    <pop :srcL="srcL" :top="top" :left="left" :text="text" />

    <router-view v-slot="{ Component }">
      <transition name="fade" mode="out-in">
        <component :is="Component" />
      </transition>
    </router-view>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

import imgbox from '../components/Imgbox.vue'
import pop from '../components/Pop.vue'
import cartIcon from '../components/cartIcon.vue'

const router = useRouter()
const props = defineProps(['pictures'])

const cartRef = ref(null)

const srcL = ref('')
const top = ref(0)
const left = ref(0)
const text = ref('')

const flightImg = ref('')

const handleClick = (e) => {
  const target = e.target

  if (target.tagName === 'IMG') {
    router.push({
      name: 'about',
      params: { src: e.target.alt }
    })

    srcL.value = target.src
    const rect = target.getBoundingClientRect()
    left.value = rect.left + rect.width / 2 //- 32;
    top.value = rect.top + rect.height / 2 // + 32;
    console.log(left.value, top.value)
  }
}

router.afterEach((to, from) => {
  //Router的afterEach钩子函数来检测是否通过router.go(-1)返回到上一个路由。
  if (from.name === 'about') {
    srcL.value = ''
    // text.value = "";
  }
})

const BGImgInformation = (Information) => {
  flightImg.value = Information.src
}
</script>
