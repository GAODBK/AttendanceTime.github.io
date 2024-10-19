<template>
  <!-- <div
    class="mask"
    @click="resetImageInformation"
    :style="{
      zIndex: showPictures.imgUrl ? 100 : -1
    }"
  >
    <img
      class="PopUpBox"
      :class="{ blowUp: flag, minifiaction: !flag }"
      :src="showPictures.imgUrl"
      :style="{
        left: showPictures.imgLeft + 'px',
        top: showPictures.imgTop + 'px',
        width: showPictures.imgWidth + 'px',
        height: showPictures.imgHeight + 'px'
      }"
    />
  </div> -->

  <div class="mask">
    <div class="PopUpBox">
      <div class="left">
        <img src="../assets/20肥肠血旺-短图.jpg" alt="">
      </div>
      <div class="right">loding...</div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';

const props = defineProps(['showPictures'])
const flag = ref(true)

const resetImageInformation = () => {
  flag.value = !flag.value
}
</script>
