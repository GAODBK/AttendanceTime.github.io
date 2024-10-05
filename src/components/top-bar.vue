<script setup>

</script>

<template>

  <header>

    <div class="header-1">

      <a href="#" class="logo"><i class="fas fa-shopping-basket"></i>groco</a>

      <form action="" class="search-box-container">
        <input type="search" id="search-box" placeholder="在这里搜索...">
        <label for="search-box" class="fas fa-search"></label>
      </form>

    </div>

    <div class="header-2">

      <div id="menu-bar" class="fas fa-bars"></div>

      <nav class="navbar">
        <router-link to="/Homepage">首页</router-link>
        <router-link to="/Homepage/category">分类</router-link>
        <router-link to="/Homepage/product">产品</router-link>
        <router-link to="/Homepage/deal">买卖</router-link>
        <router-link to="/Homepage/contact">联系</router-link>
      </nav>

      <div class="icons">
        <router-link to="/Homepage/contact" href="#" class="fas fa-shopping-cart" />
        <router-link to="/Homepage/contact" href="#" class="fas fa-heart" />
        <router-link to="/Homepage/budget" class="fas fa-user-circle" />
      </div>

    </div>

  </header>

  <router-view/>
</template>

<style scoped>

</style>