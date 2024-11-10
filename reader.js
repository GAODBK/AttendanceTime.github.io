const loadtxt = () => {
  return new Promise(async resolve => {
    const response = await fetch('./琅琊榜_@𝑻𝑮𝒆𝑩𝒐𝒐𝒌.epub')
    const data = await response.blob()

    const reader = new FileReader()
    reader.readAsText(data, 'GBK')
    reader.onload = e => {
      resolve(e.target.result)
    }
  })
}

loadtxt().then(data => {
  console.log(data)
})
