const mssql = require("../dbConnect.js");
const pool = mssql.pool;
mssql.poolConnection;

module.exports = {
    checkSdt: async (sdt, callBack) => {
        await pool.request()
            .input('SoDienThoai', mssql.sql.VarChar, sdt)
            .query('select * from NguoiDung where SoDienThoai = @SoDienThoai',
                (error, results, fields) => {
                    if (error) {
                        callBack(error);
                    }
                    return callBack(null, results);
                }
            );
    },

    create: async (data, callBack) => {
        await pool.request()
            .input('HoTen', mssql.sql.NVarChar, data.HoTen)
            .input('SoDienThoai', mssql.sql.VarChar, data.SoDienThoai)
            .input('Password', mssql.sql.VarChar, data.Password)
            .query('INSERT INTO NguoiDung(HoTen, SoDienThoai, Password) VALUES (@HoTen, @SoDienThoai, @Password)',
                (error, results, fields) => {
                    if (error) {
                        callBack(error);
                    }
                    return callBack(null, results);
                }
            );
    },

    updateUser: async (data, callBack) => {
        await pool.request()
            .input('MaNguoiDung', mssql.sql.NVarChar, data.MaNguoiDung)
            .input('HoTen', mssql.sql.NVarChar, data.HoTen)
            .input('NgaySinh', mssql.sql.DateTime, data.NgaySinh)
            .input('GioiTinh', mssql.sql.Bit, data.GioiTinh)
            .input('Avartar', mssql.sql.NVarChar, data.Avartar)
            .input('Password', mssql.sql.VarChar, data.Password)
            .query('UPDATE NguoiDung set HoTen = @HoTen, NgaySinh = @NgaySinh, Avartar = @Avartar, GioiTinh = @GioiTinh, Password = @Password WHERE MaNguoiDung = @MaNguoiDung',
                (error, results, fields) => {
                    if (error) {
                        callBack(error);
                    }
                    return callBack(null, results);
                }
            );
    },

    getUserBySdt: async (sdt, callBack) => {
        var value = sdt;
        await pool.request()
            .input('value', mssql.sql.VarChar, value)
            .query("select * from NguoiDung where SoDienThoai = @value",
                (error, results, fields) => {
                    if (error) {
                        callBack(error);
                    }
                    return callBack(null, results.recordset[0]);
                }
            );
    },

    getUserById: async (id, callBack) => {
        var value = id;
        await pool.request()
            .input('value', mssql.sql.Int, value)
            .query("select * from NguoiDung where MaNguoiDung = @value",
                (error, results, fields) => {
                    if (error) {
                        callBack(error);
                    }
                    return callBack(null, results.recordset[0]);
                }
            );
    },

    updatePassword: async (data, callBack) => {
        var sdt = data.SoDienThoai;
        var pass = data.Password;
        await pool.request()
            .input('SoDienThoai', mssql.sql.VarChar, sdt)
            .input('Password', mssql.sql.VarChar, pass)
            .query('UPDATE NguoiDung set Password = @Password WHERE MaNguoiDung = (SELECT MaNguoiDung FROM NguoiDung WHERE SoDienThoai = @SoDienThoai)',
                (error, results, fields) => {
                    if (error) {
                        callBack(error);
                    }
                    return callBack(null, results);
                }
            );
    },

    getListGoiY: (data, callBack) => {
        var array = []
        data.forEach(e => {
            var promise = new Promise((resolve, reject) => {
                pool.request()
                    .input('SoDienThoai', mssql.sql.VarChar, e)
                    .query('select *from NguoiDung where SoDienThoai = @SoDienThoai',
                        (err, results) => {
                            if (err) {
                                reject(err)
                            }
                            else {
                                resolve(results)
                            }
                        })
            })
            array.push(promise)
        });
        Promise.all(array).then(value => {
            const results = []
            value.forEach(e => {
                if(e.rowsAffected[0] == 1){
                    results.push(e.recordset[0])
                }
            });
            return callBack(null, results)
        }).catch(err => {
            return callBack(err)
        })
    }
}