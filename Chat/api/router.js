const express = require('express')
const router = express.Router()
const {
    addNameRoom,
    deleteNameRoom,
    findIDRoomByIdUser,
    createTable,
    scanItemMessage,
    scanFirstItemMessage,
    getAllRoomFor_A_User,
    uploadProductsImages,
    createGroup,
    addItemGroup,
    getListGroup
} = require('../api/controller')

router.post('/addRoom', addNameRoom)
router.post('/deleteRoom', deleteNameRoom)
router.post('/findIdRoom', findIDRoomByIdUser)
router.post('/createTable', createTable)
router.post('/scanItemMessage', scanItemMessage)
router.post('/scanFirstItemMessage', scanFirstItemMessage)
router.get('/getAllRoom/id=:id', getAllRoomFor_A_User)
router.post('/upLoadS3', uploadProductsImages)
router.post('/createGroup', createGroup)
router.post('/addItemGroup', addItemGroup)
router.get('/getListGroup=:id', getListGroup)

module.exports = router