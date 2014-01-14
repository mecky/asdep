#!/usr/bin/env node
/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */


var dbAuth = require('./DbAuth');

//dbAuth.getRoluri({
//    data : {
//        idUser : 2
//    }
//});

dbAuth.getUserAssociations({
    data: {
        idUser: 1
    },
    error: function() {
        console.log(arguments);
    }
});
