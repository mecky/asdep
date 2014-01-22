/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
var DbAuth = require('../common/dao/DbAuth');
var Associations = require('../common/dao/Associations');

/**
 * Return the list of associations for a specific user.
 *
 * GET: /api/associations
 *
 * HTTP headers: none
 *
 * RESPONSE:
 * [{ "idassociation": 1,
 *    "name": "Asociatia De Proprietari Nr. 1",
 *    "cui": "1234567890123",
 *    "county": "Hunedoara",
 *    "city": "Deva",
 *    "number_of_apartments": 123,
 *    "address": "Bld. Decebal, Bl. M, Sc. C, Ap.92"
 * }]
 */
exports.get = function(req, res) {
    // TODO: get this from user rights
    var id = 1;

    DbAuth.getUserAssociations({
        data: { idUser: id },
        done: function(associations) {
            Associations.getInfo({
                data: { associations: associations },
                done: function(rows) {
                    res.send(rows);
                },
                err: res.errHandler
            })
        },
        err: res.errHandler
    })
}

/**
 * Return an association with a specific id
 *
 * GET: /api/associations/:associationId
 *
 * HTTP headers: none
 *
 * RESPONSE:
 * { "idassociation": 1,
 *    "name": "Asociatia De Proprietari Nr. 1",
 *    "cui": "1234567890123",
 *    "county": "Hunedoara",
 *    "city": "Deva",
 *    "number_of_apartments": 123,
 *    "address": "Bld. Decebal, Bl. M, Sc. C, Ap.92"
 * }
 */
exports.getAssociation = function(req, res) {
    // TODO: get this from user rights
    var id = req.params.idAssociation;

    Associations.getInfo4association({
        data: { idAssociation: id },
        done: function(rows) {
            res.send(rows);
        },
        err: res.errHandler
    })
}

exports.update = function(req, res) {
    console.log(req.body);
    Associations.update({
        data: req.body,
        done: function() {
            res.send(200);
        },
        err: res.errHandler
    })
}