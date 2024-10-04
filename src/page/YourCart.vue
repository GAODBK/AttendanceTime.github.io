<script setup>
import { computed, inject } from "vue";

const shoppingCartItems = inject("shoppingCartItems");

const filterResults = computed(() => {
  shoppingCartItems.value;
});

const lumpSum = () =>
  shoppingCartItems.reduce((a, b) => a + b.price * b.quantity, 0);
</script>

<template>
  <p id="cart-title">您的 <strong>购物车</strong></p>
  <div
    id="empty-cart"
    :style="{ display: shoppingCartItems.length > 0 ? 'none' : 'block' }"
  >
    <h1>您的购物车是空的...</h1>
  </div>
  <div id="cart-with-items" style="display: block">
    <div class="cart-column">
      <h3>产品</h3>
      <h3>产品名称</h3>
      <h3>价格</h3>
      <h3>数量</h3>
      <h3>操作</h3>
    </div>
    <div id="item-body">
      <div v-for="(item, index) in shoppingCartItems" :key="index">
        <div class="cart-list" :id="index">
          <img id="list-img" :src="item.imgUrl" />
          <h3 class="list-name">{{ item.m_name }}</h3>
          <h3 class="pay">{{ item.price }}</h3>
          <h3 class="quantity">
            {{ item.quantity }}
            <i class="fa fa-plus" @click="item.quantity += 1"> </i>
          </h3>
          <i
            class="fa fa-trash"
            id="remove"
            @click="shoppingCartItems.splice(index, 1)"
          >
          </i>
        </div>
      </div>
      <div id="total" style="display: block">
        <h3 id="total-items">订单总数 : {{ shoppingCartItems.length }}</h3>
        <h2 id="total-amount">总价 : $ {{ lumpSum(shoppingCartItems) }}</h2>
      </div>
    </div>
  </div>
</template>
