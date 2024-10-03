<script setup>
import {computed, inject} from 'vue';
import defaultPage from './Defaultpage.vue'

const shoppingCartItems = inject('shoppingCartItems');
const filterResults = computed(
    () => shoppingCartItems.value
    // .sort((a, b) => a["f_name"].localeCompare(b["f_name"]))
    // .filter(food => food.desc[0] === amount)
    // .filter(food => food.f_name.includes(inputText.value))
);

const validateNumber = (event) => {
  const value = parseInt(event.target.value, 10);
  if (value < 1) {
    this.item.number = 1;
  } else if (value > 40) {
    this.item.number = 40;
  }
}

const lumpSum = filterResults => filterResults
    .reduce((a, b) => a + b.f_number * b.price, 0);

const deleteAPurchase = index => shoppingCartItems
    .value.splice(index, 1)

</script>

<template>
  <section class="product" id="product">

    <h1 class="heading">
      选购数量：
      {{ shoppingCartItems.length }}
    </h1>

    <div class="box-container">

      <div class="box" v-if="filterResults.length === 0">

        <img src="../images/product-1.png" alt="">
        <h3>你暂未选购任何商品</h3>
        <div class="stars">
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star-half-alt"></i>
        </div>
        <div class="price"><span> $13.20 </span></div>
        <a href="#" class="btn">你暂未选购任何商品</a>
      </div>


      <div
          class="box"
          v-else
          style="flex: 1 1 25rem;"
          v-for="(index, item) in filterResults"
          :key="index">

        <span class="discount">-33%</span>

        <div class="icons">
          <a @click="deleteAPurchase(item)" class="fas fa-trash"></a>
          <a href="#" class="fas fa-share"></a>
          <!--          <a href="#" class="fas">{{ item }}</a>-->
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

        <div class="price">
          ${{ index.price * index.f_number }}
          <span> $28.88 </span>
        </div>

        <div class="quantity">
          <span>数量 :</span>
          <input
              type="number"
              min="1"
              max="40"
              v-model.number="index.f_number"
              @input="validateNumber"
          />
          <span> /kg </span>
        </div>

      </div>

    </div>

    <a href="#"
       v-if="shoppingCartItems.length > 0"
       class="btn">
      去支付 $ {{ lumpSum(filterResults) }} 元
    </a>
  </section>

  <defaultPage/>
</template>