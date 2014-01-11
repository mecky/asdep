/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
var Dao = require('./Dao');

/**
 * @param object
 * {
 * data : {
 *      user : @username
 *      pass : @password
 * },
 * done : @callback = function(boolean, ["firstName"]),
 * err : @ErrorHandler object
 * }
 */
exports.login = function(param){
    Dao.query({
        database : 'general',
        query : ["select first_name as firstName from `user` where `email`= ? and password = ?", [param.data.email , param.data.pass]],
        done : function(rows){
            if (rows[0]){
                param.done(true, rows[0].firstName);
            }else {
                param.done(false);
            }
        },
        err : param.err
    });
};