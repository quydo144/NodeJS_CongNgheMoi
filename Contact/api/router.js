const express = require('express')
const router = express();
const cors = require("cors");
const bodyParser = require('body-parser');
router.use(bodyParser.json())
router.use(express.Router())
router.use(cors())

const {
  sendRequestAddFriend,
  acceptRequestFriend,
  deleteRequestFriend,
  getListFriend,
  getListRequestFriend,
  getTrangThaiFriend
} = require("./controller.js");

router.post("/sendRequestAddFriend", sendRequestAddFriend);
router.post("/acceptrequest", acceptRequestFriend);
router.post("/deleterequest", deleteRequestFriend);
router.post("/getListFriend", getListFriend);
router.post("/getlistrequestfriend", getListRequestFriend);
router.post("/getTrangThaiFriend", getTrangThaiFriend);
module.exports = router;