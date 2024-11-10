<template>
  <div id="Xcontainer">
    <div v-for="(_, index) in data" class="list-item">元素 {{ index }}</div>
  </div>
</template>

<script setup>
import { onMounted } from 'vue'

onMounted(() => {
  containerEl = document.getElementById('Xcontainer')
  const itemList = containerEl.getElementsByClassName('list-item')

  setContainerTop()
  window.onresize = setContainerTop

  setItemStatus(itemList)
  document.onmousedown = mouseDownEvent
})

let containerEl

/**
 * 设置容器位置
 */
const setContainerTop = () => {
  const H = document.documentElement.clientHeight
  containerEl.style.marginTop = H / 2 - 200 + 'px'
}

// 数据
const data = new Array(11)
const dataLength = data.length
const dataDeg = 360 / dataLength

/**
 * 设置元素初始位置
 * @param itemList 元素集合
 */
const setItemStatus = (itemList) => {
  for (let i = 0; i < dataLength; i++) {
    // 每个元素的最终位置
    itemList[i].style.transform = 'rotateY(' + i * dataDeg + 'deg) translateZ(400px)'
    // 旋转延迟
    itemList[i].style.transition = '1s ' + (dataLength - 1 - i) * 0.1 + 's'
  }
}

// 鼠标拖拽动作所需变量
let lastX, lastY, nowX, nowY, minX, minY
// rotateX、rotateY为初始时的旋转角度
let rotateX = -10,
  rotateY = 0

/**
 * 鼠标拖拽事件
 */
function mouseDownEvent(e) {
  // 获取鼠标按下时的坐标位置
  lastX = e.clientX
  lastY = e.clientY
  this.onmousemove = (ev) => {
    // 获取鼠标移动过程中的坐标位置
    nowX = ev.clientX
    nowY = ev.clientY
    // 计算鼠标移动坐标的差值
    minX = nowX - lastX
    minY = nowY - lastY
    // 计算容器旋转的角度，调整系数可以改变拖拽灵敏度
    rotateX -= 0.1 * minY
    rotateY += 0.1 * minX
    // 使整个容器跟随鼠标移动
    containerEl.style.transform =
      'perspective(1000px) rotateX(' + rotateX + 'deg) rotateY(' + rotateY + 'deg)'
    // 将nowX、nowY作为下一次移动的初始位置
    lastX = nowX
    lastY = nowY
  }
  this.onmouseup = function () {
    this.onmousemove = null
    this.onmouseup = null
  }
  // 阻止默认事件
  return false
}
</script>

<style>
body {
  background: #222;
  #container {
    position: relative;
    width: 180px;
    height: 200px;
    margin: auto;
    transform: perspective(1000px) rotateX(-10deg);
    transform-style: preserve-3d;
    .list-item {
      position: absolute;
      width: 180px;
      height: 200px;
      font-size: 26px;
      text-align: center;
      background-color: rgba(226, 229, 255, 0.8);
    }
  }
}
</style>
