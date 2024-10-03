<script setup>
import {provide, ref} from 'vue';

const sharedArray = ref(['item1', 'item2']);

// 提供数组
provide('sharedArray', sharedArray);
</script>

<template>
  {{ sharedArray.length}}
  <section class="home" id="home">

    <div class="image">
      <img src="../images/home-img.png" alt="">
    </div>

    <div class="content">
      <span>fresh and organic</span>
      <h3>your daily need products</h3>
      <router-link to="/homepage" class="btn">开始使用</router-link>
    </div>

  </section>
  <section class="banner-container">

    <div class="banner">
      <img src="../images/banner-1.jpg" alt="">
      <div class="content">
        <h3>特别优惠</h3>
        <p>upto 45% off</p>
        <a href="#" class="btn">check out</a>
      </div>
    </div>

    <div class="banner">
      <img src="../images/banner-2.jpg" alt="">
      <div class="content">
        <h3>限时优惠</h3>
        <p>upto 50% off</p>
        <a href="#" class="btn">check out</a>
      </div>
    </div>

  </section>
</template>