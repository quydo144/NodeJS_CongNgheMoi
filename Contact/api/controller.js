const {
    sendRequestAddFriend,
    getListFriend,
    deleteRequestFriend,
    acceptRequestFriend,
    getListRequestFriend,
    getTrangThaiFriend
} = require("./service.js");

module.exports = {
    sendRequestAddFriend: (req, res) => {
        const body = req.body
        sendRequestAddFriend(body, (err, results) => {
            if (err) {
                return res.json({
                    success: 0,
                    message: "Có lỗi xảy ra"
                });
            }
            if (results["recordset"] == undefined){
                return res.json({
                    success: 2,
                    message: "Đã được kết bạn"
                });
            }
            if (results != 0) {
                return res.json({
                    success: 1,
                    message: "Gửi yêu cầu thành công"
                });
            } else {
                return res.json({
                    success: 0,
                    message: "Gửi yêu cầu không thành công"
                });
            }
        })
    },

    acceptRequestFriend: (req, res) => {
        const body = req.body
        acceptRequestFriend(body, (err, results) => {
            if (err) {
                return res.status(500).json({
                    success: 0,
                    message: "Lỗi kết nối cơ sở dữ liệu"
                });
            } else {
                return res.json({
                    success: 1,
                    message: "Chập nhận yêu cầu thành công"
                });
            }

        });
    },

    deleteRequestFriend: (req, res) => {
        const body = req.body
        deleteRequestFriend(body, (err, results) => {
            if (err) {
                return res.status(500).json({
                    success: 0,
                    message: "Lỗi kết nối cơ sở dữ liệu"
                });
            } else {
                return res.json({
                    success: 1,
                    message: "Xóa yêu cầu thành công"
                });
            }
        });
    },

    getListFriend: (req, res) => {
        getListFriend(req.body, (err, results) => {
            if (err) {
                return res.status(500).json({
                    success: 0,
                    message: "Lỗi kết nối"
                });
            }
            let temp = JSON.parse(JSON.stringify(results));
            if (temp.rowsAffected[0] == 0) {
                return res.json({
                    success: 0,
                    message: "Không tìm thấy"
                });
            }
            return res.json({
                success: 1,
                message: "Danh sách bạn bè",
                danhsach: temp.recordset
            });
        });
    },

    getListRequestFriend: (req, res) => {
        const data = req.body
        getListRequestFriend(data, (err, results) => {
            if (err) {
                return res.status(500).json({
                    success: 0,
                    message: "Lỗi kết nối"
                });
            }
            let temp = JSON.parse(JSON.stringify(results));
            if (temp.rowsAffected[0] == 0) {
                return res.json({
                    success: 0,
                    message: "Không tìm thấy"
                });
            }
            return res.json({
                success: 1,
                message: "Danh sách lời kết bạn",
                danhsach: temp.recordset
            });
        });
    },

    getTrangThaiFriend: (req, res) => {
        const data = req.body
        getTrangThaiFriend(data, (err, results) => {
            if (err) {
                return res.status(500).json({
                    success: 0,
                    message: "Lỗi kết nối"
                });
            }
            let temp = JSON.parse(JSON.stringify(results));
            if (temp.rowsAffected[0] == 0) {
                return res.json({
                    success: 1,
                    status: -1,
                    message: "Không phải bạn bè"
                });
            }
            let message = ""
            if (temp["recordset"][0]["TrangThai"] == 1) {
                message = "Bạn bè với nhau"
            }
            else {
                message = "Đã gửi lời mời kết bạn"
            }
            return res.json({
                success: 1,
                status: temp["recordset"][0]["TrangThai"],
                action: temp["recordset"][0]["HoatDong"],
                message: message
            });
        });
    }
};
