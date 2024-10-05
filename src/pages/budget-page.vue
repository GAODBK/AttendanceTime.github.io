<script setup>
import {UploadFilled} from '@element-plus/icons-vue'

</script>

<template>
  <div class="wrapper">
    <el-upload
        class="upload-demo"
        drag
        action="https://run.mocky.io/v3/9d059bf9-4660-45f2-925d-ce80ad6c4d15"
        multiple>
      <el-icon class="el-icon--upload">
        <upload-filled/>
      </el-icon>
      <div class="el-upload__text">
        将文件拖放到此处或<em>点击上传</em>
      </div>
      <template #tip>
        <div class="el-upload__tip">
          大小小于 500KB 的 JPG/PNG 文件
        </div>
      </template>
    </el-upload>
    <div class="container">
      <div class="sub-container">
        <div class="total-amount-container">
          <h3>预算</h3>
          <p class="hide error" id="budget-error">
            值不能为空或负数
          </p>
          <input type="number" id="total-amount" placeholder="输入总金额">
          <button class="submit" id="total-amount-button">
            设置预算
          </button>
        </div>

        <div class="user-amount-container">
          <h3>开支</h3>
          <p class="hide error" id="product-title-error">
            值不能为空
          </p>
          <input type="text" class="product-title" id="product-title" placeholder="输入开销名称">
          <input type="number" id="user-amount" placeholder="输入开销金额">
          <button class="submit" id="check-amount">支出金额</button>
        </div>
      </div>

      <div class="output-container flex-space">
        <div>
          <p>总预算</p>
          <span id="amount">
              0
          </span>
        </div>
        <div>
          <p>费用</p>
          <span id="expenditure-value">
              0
          </span>
        </div>
        <div>
          <p>余额</p>
          <span id="balance-amount">
              0
          </span>
        </div>
      </div>
    </div>

    <div class="list">
      <h3>费用清单</h3>
      <div class="list-container" id="list">
        <div class="sublist-content flex-space"><p class="product">富贵花大沙发</p>
          <p class="amount">67856</p>
          <button class="fa-solid fa-pen-to-square edit"></button>
          <button class="fa-solid fa-trash-can delete"></button>
        </div>
      </div>
    </div>
  </div>

</template>

<style scoped>

</style>