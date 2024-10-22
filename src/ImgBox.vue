<script setup>
import { ref, computed } from 'vue'

const props = defineProps(['item'])
</script>

<template>
  <div class="item">
    <div class="icons">
      <a href="#" class="fas fa-heart"></a>
      <a href="#" class="fas fa-share"></a>
      <a href="#" class="fas fa-eye"></a>
    </div>
    <img :src="item.url" alt="" srcset="" /><!-- :src="item.url" -->
    <span class="title">{{ props.item.num }}</span>
  </div>
</template>

<style scoped>
.item {
  border: 1px solid #999;
  margin-bottom: 10px;
  break-inside: avoid;
  overflow: hidden;
  text-align: center;
}

.item img {
  margin-top: 6rem;
  width: 100%;
}

.item .icons {
  position: relative;
  top: -3rem;
}

.item .icons a {
  font-size: 30px;
  color: #2c2c54;
  margin-right: 1rem;
}

.item:hover .icons {
  top: 1rem;
}

.item:hover .icons a:hover {
  color: #27ae60;
}
</style>