const express = require("express");
const cors = require("cors");
const app = express();
const service = require("./api/service")
const listen_port = 5000;

const server = require('http').Server(app)
const io = require('socket.io')(server)

app.use(cors());
app.use(express.json());

const userRouter = require("./api/router.js");
app.use(userRouter);

io.on('connection', (socket)=>{
    console.log(socket.id + ": đã kết nối")

    socket.on('DangKyNhanThongBaoDanhBa', (data)=>{
        socket.join(data.SoDienThoai)
        socket.SoDienThoai = data.SoDienThoai
    })

    socket.on('DaGuiLoiMoiKetBan', (data)=>{
        socket.broadcast.to(data.NguoiNhanLoiMoi).emit("ThongBaoLoiMoiKetBanMoi", data)
    })
    
})

server.listen(listen_port, () => {
    console.log("Listening port: " + listen_port);
});