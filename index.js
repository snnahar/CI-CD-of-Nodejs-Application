const express = require('express')
const app = express()
const port = 3000


app.get('/', (req, res) => {
  res.send('CICD App V2!')
})

app.get('/status', (req, res) => {
    res.send('ok')
  })


app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${3000}`)
})