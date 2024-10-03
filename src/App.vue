<template>
  <header>

    <div class="header-2">
      <div id="menu-bar" class="fas fa-bars"></div>

      <nav class="navbar">
        <router-link to="/homepage">首页</router-link>
        <router-link to="/results">购买清单</router-link>
      </nav>

      <form action="" class="search-box-container">
        <input
            type="search"
            id="search-box"
            v-model="inputText"
            placeholder="在这里搜索">
        <label for="search-box" class="fas fa-search"></label>
      </form>
    </div>
  </header>

  <router-view/>

</template>

<script setup>
import {provide, ref} from 'vue';

const inputText = ref('')
const shoppingCartItems = ref([
/*
  {
    f_name: "绿芦笋",
    price: 23,
    f_number: 1,
    imgUrl: 'src/images/1green-asparag.jpg',
    desc: ["蔬菜"]
  },
*/

])
provide('inputText', inputText);
provide('shoppingCartItems', shoppingCartItems);

</script>