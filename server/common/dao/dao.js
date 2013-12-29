/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
var mysql = require('mysql');
var pool  = mysql.createPool({
    host     : '127.0.0.1',
    port     : '3306',
    user     : 'root',
    database : 'general',
    queueLimit : 10
});



function Dao(options) {
    this.database = options.database;
}



Dao.prototype.query = function(res, query, callback){
    var database = this.database;
    pool.getConnection(function(err, connection) {
        if (err){
            console.log(err);
            res.send(501, "failed to connect to database");
            return;
        }

        console.log('doing query on: ' + database);
        connection.changeUser({'database' : database}, function(err) {
            if (err){
                res.send(501, "failed to change database");
                return;
            }
            connection.query( query, function(err, rows) {
                if (err){
                    res.send(501, "query failed");
                    return;
                }
                connection.release();
                callback(rows);
            });

        });

    });
};
module.exports = Dao;