const services = require('../api/service')

module.exports = {

    addNameRoom(req, res, next) {
        const room = req.body;
        services.putNameRoom(room).then(data => {
            if (data)
                res.json({ success: 1, message: "Thêm room thành công" });
        }).catch(err => {
            next(err);
        });
    },

    deleteNameRoom(req, res, next) {
        const room = req.body;
        (   services.findIDRoomByIdUser12(room.id_user_1, room.id_user_2).then(data => {
                if (data) {
                    return services.deleteRoomByID(data.id_room);
                }
            }),
            services.findIDRoomByIdUser21(room.id_user_2, room.id_user_1).then(data => {
                if (data) {
                    return services.deleteRoomByID(data.id_room);
                }   
            })
        ).then(data => {
            res.json({ success: 1, message: "Xóa room thành công" });
        }).catch(err => {
            next(err);
        });
    },

    findIDRoomByIdUser(req, res, next) {
        const room = req.body;
        services.findIDRoomByIdUser12(room.id_user_1, room.id_user_2).then(data => {
            if (data) {
                res.json({ success: 1, message: "Tồn tại mã room", id_room: data.id_room })
            }
            else {
                services.findIDRoomByIdUser21(room.id_user_2, room.id_user_1).then(data => {
                    if (data) {
                        res.json({ success: 1, message: "Tồn tại mã room", id_room: data.id_room })
                    }
                    else
                        res.json({ success: 0, message: "Không tồn tại room" })
                })
            }
        })
    }
}