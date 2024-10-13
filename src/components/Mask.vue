<script setup>
import { useRouter } from 'vue-router'
import closeBtn from './CloseBtn.vue'

const router = useRouter()

const closePopup = () => {
  router.go(-1)
}
</script>

<template>
  <div>
    <div class="mark" @click="closePopup">
      <closeBtn />
    </div>
  </div>
</template>

<style scoped>
.mark {
  position: fixed;
  background-color: rgba(255, 255, 255, 0.95);
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 15;
}
</style>
