const services = require('../api/service')
const {
    createGroup,
    addItemGroup,
    getListGroup,
    checkTruongNhom,
    getListThanhVien,
    getAllDsThanhVien
} = require('./service')

module.exports = {
    uploadProductsImages(req, res) {
        services.uploadS3(req, res, (error) => {
            if (error) {
                console.log(error)
                res.status(500).json({
                    success: 0,
                    Message: "Lỗi không up được file"
                });
            } else {
                if (req.files === undefined) {
                    res.status(500).json({
                        success: 0,
                        message: "Không có ảnh được chọn"
                    });
                } else {
                    let fileArray = req.files,
                        fileLocation;
                    const images = []
                    for (let i = 0; i < fileArray.length; i++) {
                        fileLocation = fileArray[i].location;
                        images.push(fileLocation)
                    }
                    return res.status(200).json({
                        success: 1,
                        locationArray: images
                    });
                }
            }
        })
    },

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
        (services.findIDRoomByIdUser12(room.id_user_1, room.id_user_2).then(data => {
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
            } else {
                services.findIDRoomByIdUser21(room.id_user_2, room.id_user_1).then(data => {
                    if (data) {
                        res.json({
                            success: 1,
                            message: "Tồn tại mã room",
                            id_room: data.id_room
                        })
                    } else
                        res.json({ success: 0, message: "Không tồn tại room" })
                })
            }
        })
    },

    createTable(req, res, next) {
        const tableName = req.body.id_room

        services.createTable(tableName).then(data => {
            res.json({ success: 1, message: "Tạo table dynamo thành công" })
        }).catch(err => {
            res.json({ success: 0, message: "Đã tồn table dynamo" })
        })
    },

    scanItemMessage(req, res, next) {
        const tableName = req.body.id_room
        const itemLast = req.body.itemLast
        services.scanItemMessage(tableName, itemLast).then(data => {
            res.json(data)
        })
    },

    scanFirstItemMessage(req, res, next) {
        const tableName = req.body.id_room
        services.scanFirstItemMessage(tableName).then(data => {
            res.json(data)
        })
    },

    getAllRoomFor_A_User(req, res) {
        const id_user_1 = req.params.id

        services.getAllRoomFor_A_User(id_user_1).then(data => {
            res.json(data)
        })
    },

    createGroup: (req, res) => {
        let maNhom = Date.now().toString()
        const body = req.body
        body.MaNhom = maNhom
        createGroup(body, (err, results) => {
            if (err) {
                return res.json({
                    success: 0,
                    message: "Có lỗi xảy ra"
                });
            } else {
                if (results.rowsAffected[0] != 0) {
                    return res.json({
                        success: 1,
                        message: "Tạo nhóm thành công",
                        MaNhom: maNhom
                    });
                }
            }
        })
    },

    addItemGroup: (req, res) => {
        const body = req.body
        addItemGroup(body, (err, results) => {
            if (err) {
                return res.json({
                    success: 0,
                    message: "Có lỗi xảy ra"
                })
            } else {
                if (results.rowsAffected[0] != 0) {
                    return res.json({
                        success: 1,
                        message: "Thêm thành viên thành công"
                    });
                }
            }
        })
    },

    getListGroup: (req, res) => {
        const maThanhVien = req.params.id
        getListGroup(maThanhVien, (err, results) => {
            if (err) {
                return res.json({
                    success: 0,
                    message: "Có lỗi xảy ra"
                })
            } else {
                if (results.rowsAffected[0] != 0) {
                    return res.json({
                        success: 1,
                        message: "Danh sách nhóm của thành viên",
                        dataGroup: results.recordset
                    })
                }
                else {
                    return res.json({
                        success: 2,
                        message: "Danh sách nhóm của thành viên trống"
                    })
                }
            }
        })
    },

    checkTruongNhom: (req, res) => {
        const maNhom = req.params.id
        checkTruongNhom(maNhom, (err, results) => {
            if(err){
                return res.json({
                    success: 0,
                    message: "Có lỗi xảy ra"
                })
            }
            else{
                if (results.rowsAffected[0] == 1) {
                    return res.json({
                        success: 1,
                        message: "Danh sách nhóm",
                        dataGroup: results.recordset
                    })
                }
                else {
                    return res.json({
                        success: 2,
                        message: "Không tìm ra nhóm cần tìm"
                    })
                }
            }
        })
    },

    getListThanhVien: (req, res) => {
        const maNhom = req.params.id
        getListThanhVien(maNhom, (err, results) => {
            if(err){
                return res.json({
                    success: 0,
                    message: "Có lỗi xảy ra"
                })
            }
            else{
                if (results.rowsAffected[0] != 0) {
                    return res.json({
                        success: 1,
                        message: "Danh sách thành viên",
                        data: results.recordset
                    })
                }
                else {
                    return res.json({
                        success: 2,
                        message: "Danh sách thành viên trống"
                    })
                }
            }
        })
    },

    getAllDsThanhVien: (req, res) => {
        const maNhom = req.params.id
        getAllDsThanhVien(maNhom, (err, results) => {
            if(err){
                return res.json({
                    success: 0,
                    message: "Có lỗi xảy ra"
                })
            }
            else{
                if (results.rowsAffected[0] != 0) {
                    return res.json({
                        success: 1,
                        message: "Danh sách tất cả thành viên",
                        danhsach: results.recordset
                    })
                }
                else {
                    return res.json({
                        success: 2,
                        message: "Danh sách thành viên trống"
                    })
                }
            }
        })
    }
}