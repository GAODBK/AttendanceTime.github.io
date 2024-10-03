<template>
  <section class="category" id="category">

    <h1 class="heading">按类别<span>选购</span></h1>

    <div class="box-container">

      <div class="box">
        <h3>蔬菜</h3>

        <img src="../images/category-1.png" alt="">
        <router-link
            :to="{ path: '/vegetables', query: { amount: '蔬菜' } }"
            class="btn">
          选购
        </router-link>
      </div>
      <div class="box">
        <h3>饮料</h3>
        <img src="../images/category-2.png" alt="">
        <router-link
            :to="{ path: '/juice', query: { amount: '饮料' } }"
            class="btn">
          选购
        </router-link>
      </div>
      <div class="box">
        <h3>肉食</h3>
        <img src="../images/category-3.png" alt="">
        <router-link
            :to="{ path: '/meat', query: { amount: '肉制品' } }"
            class="btn">
          选购
        </router-link>
      </div>
      <div class="box">
        <h3>水果</h3>
        <img src="../images/category-4.png" alt="">
        <router-link
            :to="{ path: '/fruit', query: { amount: '水果' } }"
            class="btn">
          选购
        </router-link>
      </div>

    </div>
  </section>
</template>