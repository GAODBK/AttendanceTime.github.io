<script setup>
import { computed, inject, ref } from "vue";
import { useRoute } from "vue-router";

const props = defineProps(["mobileDatabase"]);
const route = useRoute();
const inputText = inject("inputText");
const shoppingCartItems = inject("shoppingCartItems");
const showAll = ref(false);

const sendData = () => {
  const uniqueIndices = new Set();
  while (uniqueIndices.size < 4) {
    uniqueIndices.add(Math.floor(Math.random() * props.mobileDatabase.length));
  }
  return Array.from(uniqueIndices).map((index) => props.mobileDatabase[index]);
};

const filterResults = computed(() => {
  if (inputText.value) {
    return props.mobileDatabase.filter((mobile) =>
      mobile.m_name.includes(inputText.value)
    );
  }
  if (showAll.value) {
    return props.mobileDatabase;
  }
  if (route.name === "homepage-page") {
    return props.mobileDatabase.filter((mobile) => mobile.desc === route.path);
  }
  return sendData();
});

const addToCart = (phone) => {
  shoppingCartItems.push(phone)
};
</script>

<template>
  <!-- {{ $route.path }} 和 {{ $route.name }} -->
  <section class="categories">
    <div class="title-container" v-if="$route.name === 'home'">
      <h1 id="title">最新手机</h1>
      <button type="button" @click="showAll = !showAll" id="item-btn">
        查看全部
      </button>
    </div>
    <div class="card">
      <div v-for="(item, index) in filterResults" :key="index">
        <div class="item-container" :id="index">
          <div class="card-item">
            <img :src="item.imgUrl" alt="img" id="card-img" />
            <p id="item-name">{{ item.m_name }}</p>
          </div>
          <i
            class="fa fa-shopping-cart"
            @click="addToCart(item)"
            id="add-to-cart"
          ></i>
          <h3 id="item-price">价格 : $ 190</h3>
        </div>
      </div>
    </div>
  </section>
</template>
