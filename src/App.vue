<template>
  <nav>
    <div class="nav-responsive">
      <div class="nav-search">
        <a href="">
          <i class="fa fa-search" id="find"> </i>
        </a>
        <input
          type="text"
          id="search"
          v-model="inputText"
          placeholder="搜索您的商品、品牌"
        />
      </div>
      <div class="access">
        <a href="#" id="notification"><i class="fa fa-bell"></i></a>
        <router-link to="/results" id="cart">
          <span class="gwc">
            <i class="fa fa-shopping-cart"></i>
            <span class="number">
              {{ shoppingCartItems.length }}
            </span>
          </span>
        </router-link>
        <a href="#" id="account"><i class="fa fa-user-circle-o"></i></a>
      </div>
    </div>
  </nav>

  <main id="main">
    <section id="categories">
      <router-link to="/realme"
        class="brand"
      >
        <img src="./images/Realme.png" alt="img" class="brand-img" />
        <h4 id="brand-name">Realme</h4>
      </router-link>
      <router-link to="/OnePlus"
        class="brand"
      >
        <img src="./images/OnePlus.png" alt="img" class="brand-img" />
        <h4 id="brand-name">OnePlus</h4>
      </router-link>
      <router-link to="/Samsung"
        class="brand"
      >
        <img src="./images/Samsung.png" alt="img" class="brand-img" />
        <h4 id="brand-name">Samsung</h4>
      </router-link>
      <router-link to="/Pixel"
        class="brand"
      >
        <img src="./images/Pixel.png" alt="img" class="brand-img" />
        <h4 id="brand-name">Pixel</h4>
      </router-link>
      <router-link to="/Motorola"
        class="brand"
      >
        <img src="./images/Motorola.jpg" alt="img" class="brand-img" />
        <h4 id="brand-name">Motorola</h4>
      </router-link>
    </section>

    <router-view />
  </main>
</template>
<script setup>
import { provide, ref } from "vue";

const inputText = ref("");
const shoppingCartItems = ref([
])
provide('inputText', inputText);
provide('shoppingCartItems', shoppingCartItems.value);
</script>
