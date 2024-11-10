<template>
  <div class="calculator">
    <input type="text" v-model="inputValue" readonly class="resulet" />
    <table class="buttons">
      <tbody>
        <tr>
          <td><button @click="clearInput()">C</button></td>
          <td><button @click="appendOperator('÷')">÷</button></td>
          <td><button @click="appendOperator('*')">×</button></td>
          <td><button @click="deleteLastCharacter()">DEL</button></td>
        </tr>
        <tr>
          <td><button @click="appendNumber(7)">7</button></td>
          <td><button @click="appendNumber(8)">8</button></td>
          <td><button @click="appendNumber(9)">9</button></td>
          <td><button @click="appendOperator('-')">-</button></td>
        </tr>
        <tr>
          <td><button @click="appendNumber(4)">4</button></td>
          <td><button @click="appendNumber(5)">5</button></td>
          <td><button @click="appendNumber(6)">6</button></td>
          <td><button @click="appendOperator('+')">+</button></td>
        </tr>
        <tr>
          <td><button @click="appendNumber(1)">1</button></td>
          <td><button @click="appendNumber(2)">2</button></td>
          <td><button @click="appendNumber(3)">3</button></td>
          <td rowspan="2"><button @click="calculate" class="res">=</button></td>
        </tr>
        <tr>
          <td><button @click="appendNumber(0)">0</button></td>
          <td><button @click="appendDecimal()">.</button></td>
          <td><button @click="appendPercent()">%</button></td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup>
import { ref } from 'vue'
const inputValue = ref('')
//数字的输入与校验
const appendNumber = (number) => {
  if (inputValue.value.length == 0) {
    inputValue.value += number
    return
  }
  let last = inputValue.value.charAt(inputValue.value.length - 1)
  if (last != '%') {
    inputValue.value += number
  } else {
    alert('非法输入,请重新输入')
  }
}
// 封装一个方法 将用户输入的内容 转换为一个数组 方便后续校验和计算
const strToArr = (str) => {
  const arr = []
  let newStr = ''
  for (let i = 0; i < str.length; i++) {
    let newVlue = str.charAt(i)
    if (!isNaN(newVlue) || newVlue == '.' || newVlue == '%') {
      newStr += newVlue
      console.log(newStr)
    } else if (newVlue == '+' || newVlue == '-' || newVlue == '*' || newVlue == '/') {
      arr.push(newStr)
      arr.push(newVlue)
      newStr = ''
    }
  }
  if (newStr != '') {
    arr.push(newStr)
  }
  return arr
}
//操作符的输入与校验
const appendOperator = (opt) => {
  if (inputValue.value == '') {
    alert('输入非法，请重新输入')
    return
  }
  let last = inputValue.value.charAt(inputValue.value.length - 1)
  if (!isNaN(last) || last == '%') {
    inputValue.value += opt
  } else {
    alert('输入非法，请重新输入')
  }
}

const clearInput = () => {
  inputValue.value = ''
}

const deleteLastCharacter = () => {
  let str = inputValue.value.substr(0, inputValue.value.length - 1)
  inputValue.value = str
}

// 计算结果
const calculate = () => {
  if (inputValue.value.length == 0) {
    alert('输入为空，请输入后再计算')
    return
  }
  let val = inputValue.value.replaceAll('÷', '/')
  let arr = strToArr(val)
  for (let i = 0; i < arr.length; i++) {
    if (arr[i].includes('%')) {
      arr[i] = parseFloat(arr[i].substr(0, arr[i].length - 1)) / 100
    }
  }
  let str = eval(arr.join(''))
  inputValue.value = `${str}`
}

//小数点的输入与校验
const appendDecimal = () => {
  if (inputValue.value == '') {
    alert('输入非法，请重新输入')
    return
  }
  let arr = strToArr(inputValue.value)
  let last = arr[arr.length - 1]
  if (last.includes('.') || isNaN(last.charAt(last.length - 1))) {
    alert('输入非法。请重新输入')
    return
  }
  inputValue.value += '.'
}
//%的输入与校验
const appendPercent = () => {
  if (inputValue.value == '') {
    alert('输入非法。请重新输入')
    return
  }
  let arr = strToArr(inputValue.value)
  let last = arr[arr.length - 1]
  if (last.includes('%') || isNaN(last.charAt(last.length - 1))) {
    alert('输入非法。请重新输入')
    return
  }
  inputValue.value += '%'
}
</script>

<style scoped>
.calculator {
  width: fit-content;
  padding-bottom: 20px;
  padding-left: 10px;
  padding-right: 10px;
  border: 1px solid #cccccc;
  box-sizing: border-box;
  border-radius: 20px;
  margin: 20px auto;
}
.calculator .buttons button {
  width: 35px;
  height: 35px;
  border-radius: 50%;
  border: none;
  margin: 3px 6px;
}
.calculator .resulet {
  border: none;
  height: 80px;
  margin: 20px auto;
  background-color: snow;
}
.calculator .buttons button.res {
  height: 80px;
  border-top-left-radius: 50% 25%;
  border-top-right-radius: 50% 25%;
  border-bottom-left-radius: 50% 25%;
  border-bottom-right-radius: 50% 25%;
  background: powderblue;
  font-size: 28px;
  font-weight: bolder;
}
button:hover {
  background-color: #cccccc;
  cursor: pointer;
}
</style>
