const aws = require('aws-sdk');
const { resolve } = require('path');

aws.config.update({
    accessKeyId: process.env.ACCESS_KEY_ID,
    secretAccessKey: process.env.SECRET_ACCESS_KEY,
    region: "ap-southeast-1"
})

const tableName = "ConversationName"
const docClient = new aws.DynamoDB.DocumentClient();

function findIDRoomByIdUser(id_1, id_2) {
    return new Promise(function (resolve, reject) {
        docClient.scan({
            TableName: tableName,
            FilterExpression: "#id in (:id_1, :id_2)",
            ExpressionAttributeNames: {
                "#id": "id_1",
                "#id": "id_2"
            },
            ExpressionAttributeValues: {
                ":id_1": id_1,
                ":id_2": id_2,
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

module.exports = { findIDRoomByIdUser, putNameRoom, deleteRoomByID }
