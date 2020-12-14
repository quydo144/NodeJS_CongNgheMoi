const express = require('express')
const cors = require('cors')
require('dotenv').config()
const app = express()
const service_chat = require("./api/service")
const server = require('http').Server(app);
const io = require('socket.io')(server);
const listen_port = 6000

app.use(cors())
app.use(express.json())
app.use(express.urlencoded({ extended: false }));

io.sockets.on('connection', (socket) => {
    console.log('Co Nguoi Ket Noi: ' + socket.id)

    socket.on('DANG_KY_PHONG', (dang_ky) => {
        socket.join(dang_ky.TenPhong)
        socket.Phong = dang_ky.TenPhong
    })

    //Lắng Nghe Người Dùng Nhập Tin Nhắn
    socket.on('CLIENT_TYPING', (data)=>{
        socket.broadcast.to(socket.Phong).emit('SERVER_IS_TYPING', data)
    })

    socket.on('CLIENT_GUI_TIN_NHAN', (data) => {
        let ms = Date.now();
        let date = new Date(ms);
        let year = date.getFullYear();
        let month = ("0" + (date.getMonth() + 1)).slice(-2);
        let day = ("0" + date.getDate()).slice(-2);
        params = {
            id: day + '/' + month + '/' + year,
            time: ms.toString(),
            userSend: data.userSend,
            userReceive: data.userReceive,
            message: data.message,
            fileName: data.fileName,
            type_message: data.type_message
        }
        service_chat.putItemMessage(params, data.tableName, (result)=>{
            if(result){
                socket.broadcast.to(socket.Phong).emit('SERVER_GUI_TIN_NHAN', data)
            }
        })
    })

    socket.on('CLIENT_GUI_TIN_NHAN_NHOM', (data) => {
        let ms = Date.now();
        let date = new Date(ms);
        let year = date.getFullYear();
        let month = ("0" + (date.getMonth() + 1)).slice(-2);
        let day = ("0" + date.getDate()).slice(-2);
        params = {
            id: day + '/' + month + '/' + year,
            time: ms.toString(),
            userSend: data.userSend,
            message: data.message,
            fileName: data.fileName,
            type_message: data.type_message,
            nameUser: data.nameUser
        }
        service_chat.putItemMessage(params, data.tableName, (result)=>{
            if(result){
                socket.broadcast.to(socket.Phong).emit('SERVER_GUI_TIN_NHAN_NHOM', data)
            }
        })
    })

    socket.on('CLIENT_GUI_THONG_BAO_ADD_GROUP', (data) => {
        const id = data.idUser
        service_chat.getListGroup(id, (err, results) => {
            if(results.recordset.length >  0){
                socket.broadcast.to(socket.Phong).emit('SERVER_SEND_THONG_BAO_ADD_GROUP', {
                    success: 1,
                    idUser: id,
                    dataGroup: results.recordset
                })
            }
        })
    })
});

const userRouter = require('./api/router.js')
app.use(userRouter)

server.listen(listen_port, () => {
    console.log("Listening port: " + listen_port)
})