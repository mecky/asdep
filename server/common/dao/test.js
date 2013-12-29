/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
var Dao = require('./dao.js');

var databaseAcces = new Dao('general');

var res = {
    send : function(n, s){
        console.log(n + ' -- ' + s);
    }
};
databaseAcces.query(res, 'select COUNT(*) from `user` where `username`=petru and `password`=asda', function(rows){
    console.log(rows)
});




