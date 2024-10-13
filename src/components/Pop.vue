<style>
:root {
  --popUpHeight: max(80vh, 600px);
  --popUpWidth: max(80vw, 1200px);
}

.dialog {
  width: var(--popUpWidth);
  height: var(--popUpHeight);
  position: fixed;
  display: flex;
  z-index: 200;
  transform-origin: 0 0;
  transform: scale(0);
  background-color: #e6e6e6;
  justify-content: space-evenly;
  border-radius: 10px;
}

.dialog .left {
  width: 45%;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}

.dialog .right {
  width: 49%;
  align-items: center;
}

.dialog img {
  width: 100%;
}

.left img {
  height: calc(var(--popUpHeight) - 100px);
  object-fit: cover;
  border-radius: 5px;
}

.blowUp {
  animation: animateBlowUp 0.4s linear both;
}

.minifiaction {
  animation: animateMinifiaction 0.9s ease both;
}
@keyframes animateBlowUp {
  0% {
    transform: scale(0);
  }
  100% {
    width: var(--popUpWidth);
    left: calc(50% - var(--popUpWidth) / 2);
    top: calc(50% - var(--popUpHeight) / 2);
    transform: scale(1);
  }
}
@keyframes animateMinifiaction {
  0% {
    width: var(--popUpWidth);
    left: calc(50% - var(--popUpWidth) / 2);
    top: calc(50% - var(--popUpHeight) / 2);
    transform: scale(1);
  }
  100% {
    transform: scale(0);
  }
}
</style>

<template>
  <div
    class="dialog"
    :class="{ blowUp: srcL, minifiaction: !srcL }"
    :style="{ top: top + 'px', left: left + 'px' }"
  >
    <div class="left">
      <img :src="srcL" alt="" />
    </div>
    <div class="right">
      春游优秀作文800字1
      　　听到春游，在眼前自然会出现满天飞舞的薯片、饼干、果汁，以及一大袋一大袋的水果……早上，还要先上两节课，十分扫兴，真搞不懂，上学就上学，春游就春游，上几节课再春游，存心想浇灭我们的热情嘛！不过，我们依然兴致勃勃，兴奋十足。　　沿着蜿蜒崎岖的羊肠小道，踩着一块块大小不一的石头，我们走在前往水碓坑的路上。我和金辰诺有说有笑，从战争武器谈到历史故事，从中途岛战役谈到土木堡之变，谈的是五花八门。当然，我也时不时看一看两边的风景。大片大片泛着的金浪，是香气迷人的油菜花。那边一条象缀满闪光宝石般飘带的是唱着欢歌奔流不停的山涧小溪，还有那路边成群的风铃草随风舞动。咦？是什么的香味那么独特？仔细品味，恍然大悟，原来是泥土的香味，是大自然给予我们的最美好享受！　　到了根据地，我二话不说，把桌布往地上一铺，就一屁股坐了下去。呼——经过长途跋涉之后，终于可以休息了。屁股刚坐下，蛋黄派已经被我一口吞了下去。我在那里跑来跑去，跑到山口，又跑回来，像放飞的鸟儿一般。这时，我忽然有了目标，徐邵吉告诉我，山上很神奇。我充满好奇的冲到山脚，见山路十分崎岖，于是便稳稳地、不紧不慢地向上走着。穿过一小片菜地，我正想继续向上，山风带着一阵异味袭来，我不禁掩鼻而逃。猎奇的心情一下子没了，于是继续开始漫无目的地玩着，我管它？痛快就行。　　也许强烈的阳光“榨干”了我的热情，我静下心来，拿起带来的《三国演义》文言文版，边吃桂圆边看书。大家有的上山游玩，有的下水嬉戏，可我依然端端正正地看书，沉浸在书中，仿佛看见武侯诸葛亮“驱巨兽，大破蛮兵；烧藤甲，七擒孟获。”甚至一只小虫爬上了脚也全然不知。　　难得离开了遍地高楼大厦、车辆喧闹的城市，和大自然来个亲密接触，何尝不是美事一桩？可是终究还是要离开的，又踏上了来时的石头路，和大自然依依惜别了。但愿这样日子能多一些，能趟过清澈见底的小溪，看到一望无边的田野，嗅一嗅浓浓的泥土的芳香，与大自然来个亲密接触！我期待着……
    </div>
  </div>
</template>

<script setup>
const props = defineProps(["srcL", "top", "left", "text"]);
console.log(props.text);
</script>