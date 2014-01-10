/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
var Dao = require('./Dao');

/**
 * @param object
 * {
 * res : @expressResVariable,
 * data : {
 *      user : @username
 *      pass : @password
 * },
 * done : @callback = function(boolean)
 * }
 */
exports.login = function(param){
    Dao.query({
        res : param.res,
        database : 'general',
        query : ["select COUNT(*) as exist from `user` where `username`= ? and password = ?", [param.data.user , param.data.pass]],
        done : function(rows){
            if (rows[0].exist !== 0 ){
                param.done(true);
            }else {
                param.done(false);
            }
        }
    });
};