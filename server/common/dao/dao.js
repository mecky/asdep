/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
var mysql = require('mysql');
var errHandler = require('../error_handling/error_handler');
var pool  = mysql.createPool({
    host     : '127.0.0.1',
    port     : '3306',
    user     : 'root',
    database : 'general',
    queueLimit : 10
});


exports.query = function(res, params){
    pool.getConnection(function(err, connection) {
        if (err){
            errHandler.databaseError(res, 'failed to connect to database: ' + err);
            return;
        }

        connection.changeUser(params.database, function(err) {
            if (err){
                errHandler.databaseError(res, 'changing database failed: ' + err);
                return;
            }
            connection.query( params.query[0], params.query[1], function(err, rows) {
                if (err){
                    errHandler.databaseError(res, 'running query failed: ' + err);
                    return;
                }
                connection.release();
                params.done(rows);
            });

        });

    });
};