<script setup>
import axios from 'axios';
import {onMounted, ref} from "vue";

const sd = ref(1);

const fdghdgfhsd = ref([
  {
    id: 0,
    content: '出或属及然立物区际团干林品号界织声政自青',
    img: 'https://picsum.photos/200/335?random=58'
  },
  {
    id: 1,
    content: '规社需别至打她南气提现身记指今化油百积体',
    img: 'https://picsum.photos/200/349?random=761'
  },
  {
    id: 2,
    content: '许题状世声程管么物社社同圆了而备公所料青',
    img: 'https://picsum.photos/200/442?random=71'
  },
  {
    id: 3,
    content: '然立物区际团干林品号界织声政自青参从运统',
    img: 'https://picsum.photos/200/322?random=312'
  },
  {
    id: 4,
    content: '团干林品号界织声政自青参从运统类半口识高',
    img: 'https://picsum.photos/200/399?random=460'
  },
  {
    id: 5,
    content: '例导向王活中叫社就江工外以气图专律北多建',
    img: 'https://picsum.photos/200/446?random=898'
  },
  {
    id: 6,
    content: '六思断名过增思复许石查再生斯法派带改叫向',
    img: 'https://picsum.photos/200/495?random=460'
  },
  {
    id: 7,
    content: '可定开京出或属及然立物区际团干林品号界织',
    img: 'https://picsum.photos/200/451?random=389'
  },
  {
    id: 8,
    content: '定开京出或属及然立物区际团干林品号界织声',
    img: 'https://picsum.photos/200/374?random=216'
  },
  {
    id: 9,
    content: '提现身记指今化油百积体量但国参根书为影从',
    img: 'https://picsum.photos/200/339?random=426'
  },
  {
    id: 10,
    content: '问任写主速情及极需和始亲点酸七建红放周养',
    img: 'https://picsum.photos/200/400?random=22'
  },
  {
    id: 11,
    content: '参从运统类半口识高多选石空改流通工来万北',
    img: 'https://picsum.photos/200/468?random=373'
  },
  {
    id: 12,
    content: '习七准导离每见里可求产着影却响百产际片院',
    img: 'https://picsum.photos/200/442?random=903'
  },
  {
    id: 13,
    content: '划子要步百图引美须成展党复任场走许就素受',
    img: 'https://picsum.photos/200/416?random=874'
  },
  {
    id: 14,
    content: '上是题快而被己老制米制往例导向王活中叫社',
    img: 'https://picsum.photos/200/421?random=219'
  },
  {
    id: 15,
    content: '开京出或属及然立物区际团干林品号界织声政',
    img: 'https://picsum.photos/200/427?random=909'
  }
]);

const sendData = () => {
  const uniqueIndices = new Set();
  while (uniqueIndices.size < 4) {
    uniqueIndices.add(Math.floor(Math.random() * fdghdgfhsd.value.length));
  }
  return Array.from(uniqueIndices).map((index) => fdghdgfhsd.value[index]);
};

const fetchData = async () => {
  try {
    const response = await axios.get('https://api.github.com/repos/GAODBK/lyg-photo-warehouse/contents');

    response.data
        .filter(a => a.download_url)
        .map(
            a => fdghdgfhsd.value
                .push({
                  "content": a.name,
                  "img": convertUrl(a.download_url)
                })
        )

    console.log(fdghdgfhsd.value.length)
    /*sendData().map(
        a => console.log(a.name)
    )*/
  } catch (error) {
    console.error('获取数据时出错:', error); // 错误处理
  }
};

const convertUrl = inputUrl => {
  if (inputUrl.includes("https://raw.githubusercontent.com/")) {
    // 使用 replace 方法替换 URL 的相关部分
    let outputUrl1 = inputUrl.replace("https://raw.githubusercontent.com/", "https://cdn.jsdelivr.net/gh/");
    return outputUrl1.replace("/main/", "@main/");
  } else {
    // 如果 URL 不符合预期格式，返回原字符串
    return inputUrl;
  }
}
/* 
jsd.cdn.zzko.cn √

cdn.jsdmirror.com √

cdn.jsdelivr.net √
*/

onMounted(() => {
  fetchData(); // 组件加载时调用
});

</script>

<template>
  <div class="box">
    <div class="item" v-for="(item,index) in fdghdgfhsd" :key="index">
      <div class="icons">
        <a href="#" class="fas fa-heart"></a>
        <a href="#" class="fas fa-share"></a>
        <a href="#" class="fas fa-eye"></a>
      </div>
      <img :src="item.img" alt="">
      <span class="title">{{ item.content }}</span>
      {{ index }}
    </div>
  </div>
</template>
<!--
    <section class="product" id="product">

        <h1 class="heading">latest <span>products</span></h1>

        <div class="box-container">

            <div class="box">
                <span class="discount">-33%</span>
                <div class="icons">
                    <a href="#" class="fas fa-heart"></a>
                    <a href="#" class="fas fa-share"></a>
                    <a href="#" class="fas fa-eye"></a>
                </div>
                <img src="images/product-1.png" alt="">
                <h3>organic banana</h3>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <div class="price"> $10.50 <span> $13.20 </span> </div>
                <div class="quantity">
                    <span>quantity : </span>
                    <input type="number" min="1" max="1000" value="1">
                    <span> /kg </span>
                </div>
                <a href="#" class="btn">add to cart</a>
            </div>
        </div>
    </section>
-->
<style scoped>
:root {
  --green: #27ae60;
}

.box {
  padding: 10px;
  column-count: 5;
  column-gap: 20px;
}

.item {
  border: 1px solid #999;
  margin-bottom: 10px;
  break-inside: avoid;
}

.item img {
  margin-top: 6rem;
  width: 100%;
}

@media (max-width: 1980px) {
  .box {
    column-count: 5; /* 适配 1980px 以下 */
  }
}

@media (max-width: 1500px) {
  .box {
    column-count: 4; /* 适配 1980px 以下 */
  }
}

@media (max-width: 1200px) {
  .box {
    column-count: 3; /* 适配 1980px 以下 */
  }
}

@media (max-width: 900px) {
  .box {
    column-count: 2;
  }
}

@media (max-width: 600px) {
  .box {
    column-count: 1; /* 适配 700px 以下 */
  }
}
</style>
