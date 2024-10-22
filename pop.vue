<script setup>
import { onMounted, reactive, ref } from 'vue'

const props = defineProps(['showPictures'])
const emit = defineEmits(['close'])
const PopUpBoxValue = reactive({})
const imgStyle = reactive({})
const Text = ref('')
const currentImage = ref('')
const PopUpBoxRef = ref(null)
const imgRef = ref(null)
const dialogHeight = 760
const dialogwidth = 1200

const scale = ref(0)
const showPicture = props.showPictures
const rect = showPicture.getBoundingClientRect()

onMounted(() => {
  PopUpBoxValue.left = `${rect.left}px`
  PopUpBoxValue.top = `${rect.top}px`

  currentImage.value = showPicture.src

  imgRef.value.animate(
    {
      height: `${dialogHeight}px`,
      maxWidth: `calc(${dialogwidth}px)`
    },
    {
      duration: 500,
      easing: 'ease',
      fill: 'forwards'
    }
  )
  scale.value = showPicture.offsetHeight / dialogHeight
  PopUpBoxRef.value.animate(
    [
      {
        // 初始状态
        transform: `scale(${scale.value})`
      },
      {
        // 结束状态：设置居中效果
        left: `calc(50% - ${dialogwidth / 2}px)`, // 水平居中
        top: `calc(50% - ${dialogHeight / 2}px)`, // 垂直居中
        width: `${dialogwidth}px`, // 宽度
        height: `${dialogHeight}px`, // 高度
        transform: 'scale(1)', // 缩放到原始大小
      }
    ],
    {
      duration: 500, // 动画持续时间 500ms
      easing: 'ease-in', // 缓动效果
      fill: 'forwards' // 动画结束后保持最终状态
    }
  )
})

const closePopup = () => {

  PopUpBoxRef.value.animate(
    [
      {
        transform: 'scale(1)', // 缩放到原始大小
        textAlign: 'center'
      },
      {
        // 初始状态
        transform: `scale(${scale.value})`,
        top: `${rect.top}px`,
        left: `${rect.left}px`,
        width: `${showPicture.offsetWidth}px`,
        height: `${showPicture.offsetHeight}`
      }
    ],
    {
      duration: 500, // 动画持续时间 500ms
      easing: 'ease', // 缓动效果
      fill: 'forwards' // 动画结束后保持最终状态
    }
  )
  setTimeout(() => {
    emit('close')
  }, 600)
}
</script>

<template>
  <div class="mask" @click="closePopup()">
    <div class="PopUpBox" ref="PopUpBoxRef" :style="PopUpBoxValue">
      <div class="left">
        <img ref="imgRef" :style="imgStyle" :src="currentImage" alt="" />
      </div>
      <div class="right">{{ Text }}</div>
    </div>
  </div>
</template>
