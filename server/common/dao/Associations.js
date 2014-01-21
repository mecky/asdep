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
        query : ['SELECT * FROM general.association where idAssociation in (' + ids+ ');', param.data.associations ],
        done : function(rows){
            param.done(rows);
        },
        err : param.err
    });
};

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
exports.getInfo4association = function(param){
    Dao.query({
        database : 'general',
        query : ['SELECT * FROM general.association where idAssociation = ?', param.data.idAssociation ],
        done : function(rows){
            if (rows[0]) {
                param.done(rows[0]);
            } else {
                param.err.invalidData("Nu exista asociatii pentru ID-ul specificat");
            }
        },
        err : param.err
    });
};

exports.update = function(param) {
    Dao.query({
        database : 'general',
        query : ['SELECT * FROM general.association where idAssociation = ?', param.data.idAssociation ],
        done : function(rows){
            // TODO compare db with post content and update modified fields.
            param.done(param.data);
        },
        err : param.err
    });
}