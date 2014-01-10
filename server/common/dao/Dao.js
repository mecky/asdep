/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
var mysql = require('mysql');
var ErrHandler = require('../errorHandling/ErrorHandler');
var pool  = mysql.createPool({
    host     : '127.0.0.1',
    port     : '3306',
    user     : 'root',
    database : 'general',
    queueLimit : 10
});

/**
 * @param object
 * {
 * res : @expressResVariable,
 * query : [@"query", [@param1, @param2, ...]],
 * done : @callback = function(array)
 * }
 *
 */
exports.query = function(param){
    pool.getConnection(function(err, connection) {
        if (err){
            ErrHandler.databaseError(param.res, 'failed to connect to database: ' + err);
            return;
        }

        connection.changeUser(param.database, function(err) {
            if (err){
                ErrHandler.databaseError(param.res, 'changing database failed: ' + err);
                return;
            }
            connection.query( param.query[0], param.query[1], function(err, rows) {
                if (err){
                    ErrHandler.databaseError(param.res, 'running query failed: ' + err);
                    return;
                }
                connection.release();
                param.done(rows);
            });

        });

    });
};