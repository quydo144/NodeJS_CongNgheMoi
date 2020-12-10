const express = require("express");
const cors = require("cors");
const app = express();
const service_friend = require("./api/service")
const listen_port = 5000;

const server = require('http').Server(app)
const io = require('socket.io')(server)

app.use(cors());
app.use(express.json());

const userRouter = require("./api/router.js");
app.use(userRouter);

io.on('connection', (socket) => {
    console.log(socket.id + ": đã kết nối")

    socket.on('DangKyNhanThongBaoDanhBa', (data) => {
        socket.join(data.SoDienThoai)
        socket.SoDienThoai = data.SoDienThoai
    })

    socket.on('DaGuiLoiMoiKetBan', (data) => {
        socket.broadcast.to(data.NguoiNhanLoiMoi).emit("ThongBaoLoiMoiKetBanMoi", data)
    })

    socket.on('DaXacNhanLoiMoiKetBan', (data) => {
        let temp = {
            MaNguoiDung_Mot: data.MaNguoiDung_Hai
        }

        service_friend.getListFriend(temp, (err, result) => {
            if (result.recordset.length > 0) {
                socket.broadcast.to(data.SoDienThoai).emit("ThongBaoXacNhanLoiMoiKetBan", {
                    success: true,
                    danhsach: result.recordset
                })
            }
        })
    })

    socket.on('XoaDanhBa', (data) => {

        socket.broadcast.to(data.SoDienThoai_Xoa).emit("ThongBaoXoaDanhBa", {
            success: true,
            SoDienThoai_Update: data.SoDienThoai_Update
        })
    })

    // socket.on('YeuCauCapNhatDanhBa', (data) => {
    //     let temp = {
    //         MaNguoiDung_Mot: data.MaNguoiDung_Mot
    //     }

    //     service_friend.getListFriend(temp, (err, result) => {
    //         if (result.recordset.length > 0) {
    //             socket.broadcast.to(data.SoDienThoai).emit("ThongBaoCapNhatDanhBa", {
    //                 success: true,
    //                 danhsach: result.recordset
    //             })
    //             console.log(result.recordset)
    //         }
    //     })

    // })
})

server.listen(listen_port, () => {
    console.log("Listening port: " + listen_port);
});