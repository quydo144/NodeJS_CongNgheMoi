const aws = require('aws-sdk');
const { resolve } = require('path');

aws.config.update({
    accessKeyId: process.env.ACCESS_KEY_ID,
    secretAccessKey: process.env.SECRET_ACCESS_KEY,
    region: "ap-southeast-1"
})

const tableName = "ConversationName"
const docClient = new aws.DynamoDB.DocumentClient();

function findIDRoomByIdUser12(id_user_1, id_user_2) {
    return new Promise(function (resolve, reject) {
        docClient.scan({
            TableName: tableName,
            FilterExpression: "#id_user_1=:id_user_1 and #id_user_2=:id_user_2",
            ExpressionAttributeNames: {
                "#id_user_1": "id_user_1",
                "#id_user_2": "id_user_2"
            },
            ExpressionAttributeValues: {
                ":id_user_1": id_user_1,
                ":id_user_2": id_user_2,
            }
        }, function (err, data) {
            if (err){
                reject(err)
            }
            else {
                resolve(data.Items[0])
            }
        });
    });
}

function findIDRoomByIdUser21(id_user_2, id_user_1) {
    return new Promise(function (resolve, reject) {
        docClient.scan({
            TableName: tableName,
            FilterExpression: "#id_user_1=:id_user_1 and #id_user_2=:id_user_2",
            ExpressionAttributeNames: {
                "#id_user_1": "id_user_1",
                "#id_user_2": "id_user_2"
            },
            ExpressionAttributeValues: {
                ":id_user_1": id_user_2,
                ":id_user_2": id_user_1,
            }
        }, function (err, data) {
            if (err){
                reject(err)
            }
            else {
                resolve(data.Items[0])
            }
        });
    });
}

function putNameRoom(Item) {
    return new Promise(function (resolve, reject) {
        docClient.put({
            TableName: tableName,
            Item: Item
        }, function (err, data) {
            if (err)
                reject(err);
            else {
                resolve(true)
            }
        });
    });
}

function deleteRoomByID(id) {
    return new Promise(function (resolve, reject) {
        docClient.delete({
            TableName: tableName,
            Key: {
                "id_room": id
            },
            ReturnValues: "ALL_OLD",
        }, function (err, data) {
            if (err)
                reject(err);
            else {
                const { Attributes } = data;
                resolve(Attributes);
            }
        });
    });
}

module.exports = { findIDRoomByIdUser12, findIDRoomByIdUser21, putNameRoom, deleteRoomByID }
