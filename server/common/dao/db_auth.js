/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */

var dao = require('./dao');

exports.login = function(res, user, pass, callback){
    dao.query(res, {
        database : 'general',
        query : ["select COUNT(*) as exist from `user` where `username`= ? and password = ?", [user , pass]],
        done : function(rows){
            if (rows[0].exist !== 0 ){
                callback(true);
            }else {
                callback(false);
            }
        }
    });
};