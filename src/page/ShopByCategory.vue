<template>
  <section class="product" id="product">
    {{ amount }} {{ inputText }}
    {{
      foodData
          .filter(food => food.desc[0] === amount)
          .filter(food => food.f_name.includes(inputText))
          .length
    }} 份
    <div class="box-container">

      <div class="box" v-for="(index, item) in filterResults" :key="index">

        <span class="discount">-33%</span>

        <div class="icons">
          <a href="#" class="fas fa-heart"></a>
          <a href="#" class="fas">{{ item + 1 }}</a>
        </div>

        <img :src="index.imgUrl" alt="">

        <h3>{{ index.f_name }}</h3>

        <div class="price">
          ${{ index.price }}
          <span> $28.88 </span>
        </div>

        <a @click="addToCartToGo(index)"
           class="btn">加入购物车</a>

      </div>
    </div>
  </section>

  <defaultPage v-if="filterResults.length === 0"/>

</template>

<script setup>
import {computed, inject, ref} from 'vue';
import {useRoute} from 'vue-router';
import defaultPage from './Defaultpage.vue'

const inputText = inject('inputText')
const shoppingCartItems = inject('shoppingCartItems')
const props = defineProps(["foodData"])

const filterResults = computed(
    () => {
      if(inputText.value){
        return props.foodData
            .filter(food => food.f_name.includes(inputText.value))
            .sort((a, b) => a["f_name"].localeCompare(b["f_name"]))
      }
      return props.foodData
          .filter(food => food.desc[0] === amount)
    }
);

const route = useRoute();
const amount = route.query.amount;

const addToCartToGo = (food) => {
  // console.log(shoppingCartItems.value.length)
  shoppingCartItems.value.push({
    f_name: food.name,
    price: food.price,
    f_number: 1,
    imgUrl: food.imgUrl,
  })
}

</script>