/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */

var Dao = require('./Dao');

/**
 *
 * @param param object
 * { data: {
 *     associations: [1,2,3]
 * },
 * done : @callback = function(rows),
 * err : @ErrorHandler object
 * }
 */
exports.getInfo = function(param){
    // TODO do this another way. this is stupid
    var ids = "?"
    for (var i=0; i< param.data.associations.length -1; i++ ) {
        ids += ",?";
    }

    Dao.query({
        database : 'general',
        query : ['SELECT * FROM general.association where idassociation in (' + ids+ ');', param.data.associations ],
        done : function(rows){
            param.done(rows);
        },
        err : param.err
    });
};