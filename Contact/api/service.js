const { sql } = require("../dbConnect.js");
const mssql = require("../dbConnect.js");
const pool = mssql.pool;
mssql.poolConnection;

module.exports = {
    sendRequestAddFriend: async (data, callBack) => {
        await pool.request()
            .input('MaNguoiDung_Mot', mssql.sql.Int, data.MaNguoiDung_Mot)
            .input('MaNguoiDung_Hai', mssql.sql.Int, data.MaNguoiDung_Hai)
            .query('exec CheckTrungMa @MaNguoiDung_Mot, @MaNguoiDung_Hai',
                (error, results, fields) => {
                    if (error) {
                        callBack(error);
                    }
                    return callBack(null, results);
                }
            );
    },

    acceptRequestFriend: async (data, callBack) => {
        await pool.request()
            .input('MaNguoiDung_Mot', mssql.sql.Int, data.MaNguoiDung_Mot)
            .input('MaNguoiDung_Hai', mssql.sql.Int, data.MaNguoiDung_Hai)
            .query('UPDATE DanhSachBanBe set TrangThai = 1 WHERE ( MaNguoiDung_Mot = @MaNguoiDung_Mot AND MaNguoiDung_Hai = @MaNguoiDung_Hai ) OR ( MaNguoiDung_Mot = @MaNguoiDung_Hai AND MaNguoiDung_Hai = @MaNguoiDung_Mot )',
                (error, results, fields) => {
                    if (error) {
                        callBack(error);
                    }
                    return callBack(null, results);
                }
            );

    },

    deleteRequestFriend: async (data, callBack) => {
        await pool.request()
            .input('MaNguoiDung_Mot', mssql.sql.Int, data.MaNguoiDung_Mot)
            .input('MaNguoiDung_Hai', mssql.sql.Int, data.MaNguoiDung_Hai)
            .query('DELETE FROM DanhSachBanBe WHERE ( MaNguoiDung_Mot = @MaNguoiDung_Mot AND MaNguoiDung_Hai = @MaNguoiDung_Hai ) OR ( MaNguoiDung_Mot = @MaNguoiDung_Hai AND MaNguoiDung_Hai = @MaNguoiDung_Mot )',
                (error, results, fields) => {
                    if (error) {
                        callBack(error);
                    }
                    return callBack(null, results);
                }
            );

    },

    getListFriend: async (data, callBack) => {
        await pool.request()
            .input('MaNguoiDung_Mot', mssql.sql.Int, data.MaNguoiDung_Mot)
            .query('select * from NguoiDung where MaNguoiDung IN (SELECT MaNguoiDung_Mot FROM DanhSachBanBe Where TrangThai = 1 AND MaNguoiDung_Hai = @MaNguoiDung_Mot) Union select * from NguoiDung  where MaNguoiDung IN (SELECT MaNguoiDung_Hai FROM DanhSachBanBe Where TrangThai = 1 AND MaNguoiDung_Mot = @MaNguoiDung_Mot)',
                (error, results, fields) => {
                    if (error) {
                        callBack(error)
                    }
                    return callBack(null, results);
                }
            );
    },

    getListRequestFriend: async (data, callBack) => {
        await pool.request()
            .input('MaNguoiDung_Mot', mssql.sql.Int, data.MaNguoiDung_Mot)
            .query('select * from NguoiDung where MaNguoiDung IN (SELECT MaNguoiDung_Mot FROM DanhSachBanBe Where TrangThai = 0 AND MaNguoiDung_Hai = @MaNguoiDung_Mot AND HoatDong != @MaNguoiDung_Mot) Union select * from NguoiDung  where MaNguoiDung IN (SELECT MaNguoiDung_Hai FROM DanhSachBanBe Where TrangThai = 0 AND MaNguoiDung_Mot = @MaNguoiDung_Mot AND HoatDong != @MaNguoiDung_Mot)',
                (error, results, fields) => {
                    if (error) {
                        callBack(error);
                    }
                    return callBack(null, results);
                }
            );
    },

    getTrangThaiFriend: async (data, callBack) =>{
        await pool.request()
        .input('MaNguoiDung_Mot', mssql.sql.Int, data.MaNguoiDung_Mot)
        .input('MaNguoiDung_Hai', mssql.sql.Int, data.MaNguoiDung_Hai)
            .query('SELECT TrangThai, HoatDong FROM DanhSachBanBe Where ( MaNguoiDung_Mot=@MaNguoiDung_Mot AND MaNguoiDung_Hai=@MaNguoiDung_Hai ) OR ( MaNguoiDung_Mot=@MaNguoiDung_Hai AND MaNguoiDung_Hai=@MaNguoiDung_Mot)',
                (error, results, fields) => {
                    if (error) {
                        callBack(error);
                    }
                    return callBack(null, results);
                }
            );
    }
};