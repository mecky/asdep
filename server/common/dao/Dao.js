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

/**
 * @param object
 * {
 * query : [@"query", [@param1, @param2, ...]],
 * done : @callback = function(array)
 * err : @ErrorHandler object
 * }
 *
 */
exports.query = function(param){
    pool.getConnection(function(err, connection) {
        if (err){
            param.err.databaseError('failed to connect to database: ' + err);
            return;
        }
        connection.changeUser({database : param.database}, function(err) {
            if (err){
                param.err.databaseError('changing database failed: ' + err);
                return;
            }
            connection.query( param.query[0], param.query[1], function(err, rows) {
                if (err){
                    param.err.databaseError('running query failed: ' + err);
                    return;
                }
                connection.release();
                param.done(rows);
            });

        });

    });
};