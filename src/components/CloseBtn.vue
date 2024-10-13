<template>
    <div class="btn"></div>
  </template>
  
  <script setup lang="ts"></script>
  
  <style scoped>
  * {
    margin: 0;
    padding: 0;
  }
  .btn {
    position: fixed;
    top: 50px;
    left: 50px;
  }
  .btn::before,
  .btn::after {
    content: "";
    position: absolute;
    top: 50%;
    left: 50%;
    width: 30px;
    height: 2px;
    background-color: #000;
    transform-origin: center;
  }
  
  .btn::before {
    transform: translate(-50%, -50%) rotate(45deg);
  }
  
  .btn::after {
    transform: translate(-50%, -50%) rotate(-45deg);
  }
  
  .btn:hover::before,
  .btn:hover::after {
    background-color: #ff0000;
  }
  </style>