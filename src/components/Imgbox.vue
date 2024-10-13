<template>
    <div class="item">
      <img
        ref="image"
        :src="item.url"
        :alt="item.num"
        :class="{ checkedBox: item.onClick }"
      />
      <h3 class="str1" v-if="item.onClick">&#10003;</h3>
      <h3 class="str2">{{ item.num }}</h3>
      <h3 class="str3" @click.stop="itemClick(item, $event)">
        <img src="../assets/order.png" alt="Order Icon" />
      </h3>
    </div>
  
    <div class="flightBox"></div>
  </template>
  
  <script setup>
  import { ref } from "vue";
  
  const props = defineProps(["item"]);
  const emit = defineEmits(["BGImgInformation"]);
  
  const image = ref(null);
  
  function itemClick(item, e) {
    props.item.onClick = !item.onClick;
  
    if (item.onClick) {
      // const image = e.target.parentNode.parentNode.querySelector("img");
  
      emit("BGImgInformation", image.value);
    }
  }
  </script>
  
  <style scoped>
  * {
    margin: 0;
    padding: 0;
  }
  .item {
    position: relative;
    margin-bottom: 10px;
    overflow: hidden;
  }
  
  .str1 {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 100px;
    color: #000;
  }
  
  .str2 {
    position: absolute;
    bottom: -20px;
    left: 50%;
    transform: translateX(-50%);
    font-size: 18px;
    color: white;
    transition: all 0.3s ease;
  }
  
  .item:hover .str2 {
    bottom: 10px;
    transition: all 0.3s ease;
  }
  
  .str3 {
    position: absolute;
    top: -30px;
    right: -30px;
    transition: all 0.3s ease;
    cursor: pointer;
  }
  
  .item:hover .str3 {
    top: 10px;
    right: 10px;
    transition: all 0.3s ease;
  }
  .str3 img {
    width: 20px;
    height: 20px;
  }
  
  .item img {
    width: 100%;
    height: 100%;
    border-radius: 10px;
  }
  
  .checkedBox {
    filter: blur(5px) brightness(0.7);
    border-radius: 10px;
  }
  </style>