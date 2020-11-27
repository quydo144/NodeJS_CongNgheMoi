const express = require('express')
const router = express.Router()
const { 
    addNameRoom,
    deleteNameRoom,
    findIDRoomByIdUser
} 
= require('../api/controller')

router.post('/addRoom', addNameRoom)
router.post('/deleteRoom', deleteNameRoom)
router.post('/findIdRoom', findIDRoomByIdUser)

module.exports = router