<script setup>
import axios from 'axios'
import { onMounted, ref } from 'vue'
import imgbox from './ImgBox.vue'
import pop from './pop.vue'

const showPictures = ref(null)

const fdghdgfhsd = ref([])

const sendData = () => {
  const uniqueIndices = new Set()
  while (uniqueIndices.size < 4) {
    uniqueIndices.add(Math.floor(Math.random() * fdghdgfhsd.value.length))
  }
  return Array.from(uniqueIndices).map((index) => fdghdgfhsd.value[index])
}

const fetchData = async () => {
  try {
    const response = await axios.get(
      'https://api.github.com/repos/GAODBK/lyg-photo-warehouse/contents'
    )

    response.data
      .filter((a) => a.download_url)
      .map((a) =>
        fdghdgfhsd.value.push({
          num: a.name,
          url: a.download_url
        })
      )
      // convertUrl()
    console.log(
      `${Math.floor(response.data.reduce((acc, file) => acc + file.size / 1024, 0) / 1024)}MB`
    )
  } catch (error) {
    console.error('获取数据时出错:', error) // 错误处理
  }
}

const convertUrl = (inputUrl) => {
  if (inputUrl.includes('https://raw.githubusercontent.com/')) {
    // 使用 replace 方法替换 URL 的相关部分
    let outputUrl1 = inputUrl.replace(
      'https://raw.githubusercontent.com/',
      'https://cdn.jsdelivr.net/gh/'
    )
    return outputUrl1.replace('/main/', '@main/')
  } else {
    // 如果 URL 不符合预期格式，返回原字符串
    return inputUrl
  }
}
/*
jsd.cdn.zzko.cn √

cdn.jsdmirror.com √

cdn.jsdelivr.net √
*/

onMounted(() => {
  fetchData() // 组件加载时调用
})

const setDialogAnimation = (e) => {
  if (e.target.tagName === 'IMG') {
    showPictures.value = e.target
  }
}

const CloseEvent = () => {
  showPictures.value = null;
}
</script>

<template>
  <div class="columnBox">
    <div v-for="(item, index) in fdghdgfhsd" :key="index">
      <imgbox :item="item" @click="setDialogAnimation($event)" />
    </div>
  </div>

  <pop :showPictures="showPictures" v-if="showPictures" @close="CloseEvent()" />
</template>



<style scoped>
.columnBox {
  padding: 10px;
  column-count: 5;
  column-gap: 20px;
}

@media (max-width: 1980px) {
  .columnBox {
    column-count: 5;
  }
}

@media (max-width: 1500px) {
  .columnBox {
    column-count: 4;
  }
}

@media (max-width: 1200px) {
  .columnBox {
    column-count: 3;
  }
}

@media (max-width: 900px) {
  .columnBox {
    column-count: 2;
  }
}

@media (max-width: 600px) {
  .columnBox {
    column-count: 1;
  }
}
</style>
