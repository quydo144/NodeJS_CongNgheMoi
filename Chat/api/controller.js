const services = require('../api/service')

module.exports = {

    addNameRoom(req, res, next) {
        const room = req.body;
        services.findIDRoomByIdUser(room.id_1, room.id_2).then(data => {
            if (data) {
                res.json({ success: 0, message: "Tồn tại mã room", id_room: data.id_room })
            }
            else
                return services.putNameRoom(room);
        }).then(data => {
            if (data)
                res.json({ success: 1, message: "Thêm room thành công" });
        }).catch(err => {
            next(err);
        });
    },

    deleteNameRoom(req, res, next) {
        const room = req.body;
        services.findIDRoomByIdUser(room.id_1, room.id_2).then(data => {
            if (!data)
                res.json({ success: 0, message: "Không tồn tại ID room" });
            else
                return services.deleteRoomByID(data.id_room);
        }).then(data => {
            res.json({ success: 1, message: "Xóa room thành công" });
        }).catch(err => {
            next(err);
        });
    },

    findIDRoomByIdUser(req, res, next){
        const room = req.body;
        services.findIDRoomByIdUser(room.id_1, room.id_2).then(data =>{
            if(data){
                res.json({ success: 1, message: "Tồn tại mã room", id_room: data.id_room })
            }
            else
                res.json({ success: 0, message: "Không tồn tại room" })
        })
    }
}