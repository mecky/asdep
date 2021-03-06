/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
var Dao = require('./Dao');


function isTenant(roles){
    if (roles & 1 << 0){
        return true;
    }
    return false;
}

function isAdmin(roles){
    if (roles & 1 << 1){
        return true;
    }
    return false;
}

/**
 * @param object
 * {
 * data : {
 *      idUser : @idUser
 * },
 * done : @callback = function({[idAssociaton : { admin : boolean, tenant : [idapartment, ...]} ...]},
 * err : @ErrorHandler object
 * }
 */

//{[idAssociaton : { admin : boolean, tenant : [idapartment, ...] ...}}
var getUserRights = function(param){
    Dao.query({
        database : 'general',
        query : ["select associationIdAssociation as idAssociation, roles from userHasAssociation where " +
            "userHasAssociation.userIdUser = '?';", [param.data.idUser]],
        done : function(rows){
            var roles = {};
            for (var i in rows){
                var row = rows[i];

                roles[row.idAssociation] = {admin : isAdmin(row.roles), tenant : false};
                //tenant
                if (isTenant(row.roles)){
                    roles[row.idAssociation].tenant = [];
                    Dao.query({
                        idAssociation : row.idAssociation,
                        database : 'association' + row.idAssociation,
                        query : ["select apartmentIdApartment as idApartment from userHasApartment where userIdUser = ?;", [param.data.idUser]],
                        done : function(rows){
                            for (var i in rows){
                                var apartment = rows[i].idApartment;
                                roles[this.idAssociation].tenant.push(apartment);
                            }
                            if (row.idAssociation === this.idAssociation){
                                param.done(roles);
                            };

                        },
                        err : param.err
                    });
                }

            }
        },
        err : param.err
    });
    //
}
exports.getUserRights = getUserRights;

var getUserRoles = function(param){
    Dao.query({
        database : 'general',
        query : ["select BIT_OR(roles) as roles from userHasAssociation where userIdUser = '?';", [param.data.idUser]],
        done : function(rows){
            // TODO: send the roles for all associations, not only for the first
            // role=true if the user has the role on at least one association
            param.done({admin : isAdmin(rows[0].roles), tenant : isTenant(rows[0].roles)});
        },
        err : param.err
    });
}
exports.getUserRoles = getUserRoles;

/**
 *
 * @param param object
 * { data: {
 *     idUser: @userId
 * },
 * done : @callback = function(rows),
 * err : @ErrorHandler object
 * }
 */
exports.getUserAssociations = function(param){
    Dao.query({
        database : 'general',
        query : ["SELECT associationIdAssociation FROM general.userHasAssociation where userIdUser = ?;", [param.data.idUser]],
        done : function(rows){
            var associationsId = []
            for (var row in rows) {
                associationsId.push(rows[row]["associationIdAssociation"]);
            }
            param.done(associationsId);
        },
        err : param.err
    });
}
/**
 * @param object
 * {
 * data : {
 *      user : @username
 *      pass : @password
 * },
 * done : @callback = function(boolean, ["firstName", roles]),
 * err : @ErrorHandler object
 * }
 */
exports.login = function(param){
    Dao.query({
        database : 'general',
        query : ["select idUser, firstName as firstName from `user` " +
            "where `email`= ? and password = MD5(SHA2(?,512))", [param.data.email , param.data.password]],
        done : function(rows){
            if (rows[0]){
                getUserRoles({
                    data : {
                        idUser :  rows[0].idUser
                    },
                    done : function(roles){
                        console.log(roles);
                        param.done(true, rows[0].firstName, roles);
                    },
                    err : param.err

                });
            }else {
                param.done(false);
            }
        },
        err : param.err
    });
};

exports.createAccount = function(param) {
    Dao.query({
        database: 'general',
        query: ["INSERT INTO user SET ?", param.data],
        done: function() {
            param.done();
        },
        // TODO handle error messages more precise
        err: param.err
    })
}
