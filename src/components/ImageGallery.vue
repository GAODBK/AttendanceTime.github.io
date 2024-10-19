<script setup>
import { onMounted, ref } from 'vue'
import axios from 'axios'
import Modal from './Modal.vue'

const images = ref([])

const isModalOpen = ref(false)
const currentImageIndex = ref(0)

const fetchData = async () => {
  try {
    const response = await axios.get(
      'https://api.github.com/repos/GAODBK/lyg-photo-warehouse/contents'
    )

    response.data
      .filter((a) => a.download_url)
      .map((a) =>
        images.value.push({
          alt: a.name,
          full: a.download_url,
          thumbnail: a.download_url
        })
      )
  } catch (error) {
    console.error('获取数据时出错:', error) // 错误处理
  }
}

onMounted(() => {
  fetchData() // 组件加载时调用
})

function openModal(index) {
  currentImageIndex.value = index
  isModalOpen.value = true
}

function closeModal() {
  isModalOpen.value = false
}

function prevImage() {
  currentImageIndex.value = (currentImageIndex.value - 1 + images.length) % images.length
}

function nextImage() {
  currentImageIndex.value = (currentImageIndex.value + 1) % images.length
}
</script>

<template>
  <div class="gallery">
    <h1>图片画廊</h1>

    <div class="thumbnails">
      <div
        class="thumbnail"
        v-for="(image, index) in images"
        :key="index"
        @click="openModal(index)"
      >
        <img :src="image.thumbnail" :alt="image.alt" />
      </div>
    </div>

    <Modal v-if="isModalOpen" @close="closeModal">
      <img :src="images[currentImageIndex].full" :alt="images[currentImageIndex].alt" />
      <button @click="prevImage">上一张</button>
      <button @click="nextImage">下一张</button>
    </Modal>
  </div>
</template>

<style scoped>
.gallery {
  text-align: center;
}

.thumbnails {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
}

.thumbnail {
  margin: 10px;
  cursor: pointer;
}

.thumbnail img {
  width: 150px;
  height: 100px;
  object-fit: cover;
  border-radius: 8px;
}

button {
  margin: 10px;
}
</style>
