<script setup>
import {ref} from 'vue';
import {useRoute} from 'vue-router';

const route = useRoute();
const amount = route.query.amount;

const food = ref([
  {
    f_name: 'organic banana',
    imgUrl: 'src/images/product-1.png'
  },
  {
    f_name: 'organic tomato',
    imgUrl: 'src/images/product-2.png'
  },
  {
    f_name: 'organic orange',
    imgUrl: 'src/images/product-3.png'
  },
  {
    f_name: 'natural mild',
    imgUrl: 'src/images/product-4.png'
  },
  {
    f_name: 'organic grapes',
    imgUrl: 'src/images/product-5.png'
  },
  {
    f_name: 'natural almonds',
    imgUrl: 'src/images/product-6.png'
  },
  {
    f_name: 'organic apple',
    imgUrl: 'src/images/product-7.png'
  },
  {
    f_name: 'natural butter',
    imgUrl: 'src/images/product-8.png'
  },
  {
    f_name: 'organic carrot',
    imgUrl: 'src/images/product-9.png'
  }
])

const sendData = () => {
  const uniqueIndices = new Set();
  while (uniqueIndices.size < 5) {
    uniqueIndices.add(
        Math.floor(
            Math.random() * food.value.length
        )
    );
  }
  return Array.from(uniqueIndices)
      .map(index => food.value[index]);
};
console.log(sendData()[2].imgUrl)
</script>

<template>

  <section class="product" id="product" v-if="amount">
    <h1 class="heading"><span>新品</span>上市</h1>
    <div class="box-container">
      <div class="box">
        <img src="../images/product-4.png" alt="">
        <h3>你没有搜到任何商品</h3>
      </div>
    </div>
  </section>
  <section class="product" id="product">

    <h1 class="heading"><span>新品</span>上市</h1>

    <div class="box-container">

      <div class="box" v-for="(index, item) in sendData()" :key="item">

        <span class="discount">-20%</span>

        <div class="icons">
          <a href="#" class="fas fa-heart"></a>
          <a href="#" class="fas fa-share"></a>
          <a href="#" class="fas fa-eye"></a>
        </div>

        <img :src="index.imgUrl" alt="">

        <h3>{{ index.f_name }}</h3>

        <div class="stars">
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star-half-alt"></i>
        </div>

        <div class="price"> $10.50 <span> $13.20 </span></div>

      </div>
    </div>
  </section>
</template>