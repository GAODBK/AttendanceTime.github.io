<script setup>
import { ref } from "vue";

const cartRef = ref(null);
</script>
<template>
  <div class="cartBox">
    <h2 class="cartIcon" ref="cartRef">
      <img src="../assets/tb.png" alt="" />
      <span class="number">0</span>
    </h2>

    <ul class="L">
      <!-- @click="hideSelectionMenu" -->
      <li class="Link">选择你的菜品吧</li>
      <li class="Link">选择你的菜品吧</li>
      <li class="Link">选择你的菜品吧</li>
      <li class="Link">选择你的菜品吧</li>
      <li class="Link">选择你的菜品吧</li>
      <li class="Link">选择你的菜品吧</li>
      <li class="Link">选择你的菜品吧</li>
      <li class="Link">选择你的菜品吧</li>
      <li class="Link">选择你的菜品吧</li>
      <!-- <li class="Link" v-for="(value, index) in selectedFoodList" :key="index">
        {{ value.food }} / {{ value.price }}
      </li> -->
    </ul>
  </div>
</template>
<style scoped>
.cartIcon {
  position: fixed;
  top: 90px;
  right: 20px;
  cursor: pointer;
  display: inline-block;

  .number {
    position: absolute;
    color: #ffffff;
    right: -10px;
    top: -8px;
    background: red;
    border-radius: 50%;
    width: 20px;
    height: 20px;
    text-align: center;
    font-size: 15px;
  }
}

.L {
  position: fixed;
  top: 160px;
  background-color: white;
  padding: 0;
  margin: 0;
  right: 10px;
  list-style: none;
  transform-origin: 80% 0;
  transform: scale(0);
  transition: all 0.5s ease;
  box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.3);
}

.cartBox:hover .L {
  transform: scale(1);
  transition: all 0.5s ease;
}

.Link {
  padding: 12px 17px;
  color: black;
  text-decoration: none;
  font-size: 18px;
  border-bottom: 0.5px solid rgb(0, 0, 0, 0.2);
  transition: background-color 0.3s;
}
</style>