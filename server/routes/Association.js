/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
var DbAuth = require('../common/dao/DbAuth');
var Associations = require('../common/dao/Associations');
var ErrHandler = require('../common/errorHandling/ErrorHandler');

exports.get = function(req, res) {
    var id = req.params.userId;
    err = new ErrHandler(res);

    DbAuth.getUserAssociations({
        data: {
            idUser: id
        },
        done: function(associations) {
            Associations.getInfo({
                data: {
                    associations: associations
                },
                done: function(rows) {
                    res.send(rows);
                },
                err: err
            })
        },
        err: err
    })
}