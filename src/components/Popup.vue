<script setup>
const props = defineProps({
    imagePosition: {
        type: Object,
        required: true
    }
})
const sd = () => {
    console.log("你在点击蒙版")
}
</script>

<template>
    <div class="mark"
        @click="sd" 
        :class="{ imagePosition: imagePosition.rectleft }">
        <!--  style="z-index: 100;" -->

        <p>图片位置 -
            Top: {{ imagePosition.recttop }}px,
            Left: {{ imagePosition.rectleft }}px
        </p>
        <p>图片 URL: {{ imagePosition.imgUrl }}</p>
        <p>缩放比例: {{ imagePosition.scale }}</p>

        <div class="dialog" :style="{
            left: imagePosition.rectleft + 'px',
            top: imagePosition.recttop + 'px',
            // transform: 'scale(' + imagePosition.scale + ')'
        }">

            <div class="box">
                <div class="left">
                    <img :src="imagePosition.imgUrl" alt="">
                </div>
                <div class="right">loading...</div>
            </div>
        </div>
    </div>
</template>

<style>
:root {
    --dialogheight: 760px;
    --dialogwidth: 1000px;
}

.mark {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    z-index: -1;
    opacity: 0;
}

.imagePosition {
    background-color: rgba(255, 255, 255, .95);
    z-index: 100;
    opacity: 1;
}

.mark .dialog {
    position: absolute;
    left: 50%;
    top: 400px;
    transform: translate(-50%, -50%);
    background: #fff;
    height: var(--dialogheight);
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    overflow: hidden;
    transform-origin: 0 0;
    transition: all 0.4s ease 0s;
    border-radius: 10px;
    z-index: -1;
}

.dialog .box {
    display: flex;
    width: var(--dialogwidth);
    height: 100%;
}

.dialog .box .left {
    flex: 5;
    background: black;
    display: flex;
    justify-content: center;
    align-items: center;
}

.dialog .box .left img {
    width: 100%;
    border-radius: 30px;
}

.dialog .box .right {
    width: 300px;
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>