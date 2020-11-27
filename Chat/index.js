const express = require('express')
const cors = require('cors')
const path = require('path');
require('dotenv').config()
const app = express()
const listen_port = 6000

app.use(cors())
app.use(express.json())
app.use(express.urlencoded({ extended: false }));

const userRouter = require('./api/router.js')
app.use("", userRouter)

app.listen(listen_port, () => {
    console.log("Listening port: " + listen_port)
})