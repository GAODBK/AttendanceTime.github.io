<template>
  <div v-loading="loading" class="parent-box" @scroll="handleScroll">
    <div v-for="value in visibleData" class="list-item">
      {{ `item - ${value}` }}
    </div>

    <!-- /滚动加载（非首次加载）时，在末尾展示 “加载中...” -->
    <div v-show="!loading && getting" class="list-item">加载中...</div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

// #region 模拟后端部分
// 生成10万条数据
const totalData = Array.from({ length: 100000 }, (_, index) => index + 1)

/**
 * 模拟从后端获取数据
 * @param { Number } pageNum 页码
 * @param { Number } pageSize 每页大小
 */
const fetchData = (pageNum = 1, pageSize = 20) => {
  return new Promise((resolve) => {
    // 模拟接口耗时1s
    setTimeout(() => {
      const startIndex = (pageNum - 1) * pageSize
      const endIndex = pageNum * pageSize
      // 数据是否已全部加载完成
      const finish = endIndex >= totalData.length
      resolve({
        data: totalData.slice(startIndex, endIndex),
        finish
      })
    }, 1000)
  })
}
// #endregion

// #region 前端部分
// 容器loading状态
const loading = ref(false)
// 数据是否正在请求
const getting = ref(false)
// 数据是否已全部加载完成
let dataFinish = false
// 记录加载页码
let currentPageNum = 1
// 每次加载20条数据
const pageSize = 20
// 当前展示数据
const visibleData = ref([])

/**
 * 获取新数据
 */
const getData = (first = false) => {
  // 首次加载展示容器loading效果
  loading.value = first
  getting.value = true
  fetchData(currentPageNum, pageSize)
    .then(({ data, finish }) => {
      // 合并数据
      visibleData.value = visibleData.value.concat(data)
      dataFinish = finish
      // 设置下次加载页码
      currentPageNum++
    })
    .finally(() => {
      loading.value = false
      getting.value = false
    })
}
getData(true)

// 滚动至容器底部的最小距离（阈值，px）
const scrollThreshold = 60

/**
 * 滚动事件
 * 注意：可通过防抖/节流优化
 */
const handleScroll = () => {
  if (dataFinish || getting.value) {
    // 数据已全部加载完成 或 数据正在加载时，不重新发送请求
    return
  }
  const parentBox = document.querySelector('.parent-box')
  if (parentBox.scrollHeight - parentBox.scrollTop - parentBox.clientHeight <= scrollThreshold) {
    // 滚动条达到阈值，触发加载新数据
    getData()
  }
}
// #endregion
</script>

<style scoped>
.parent-box {
  position: relative;
  height: 400px;
  width: 300px;
  overflow: auto;
  border: 2px solid rgb(87, 87, 87);
  .list-item {
    border-bottom: 1px solid rgb(223, 223, 223);
  }
}
</style>
