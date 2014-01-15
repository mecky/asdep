/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
var DbAuth = require('../common/dao/DbAuth');
var Associations = require('../common/dao/Associations');
var ErrHandler = require('../common/errorHandling/ErrorHandler');

/**
 * Return the list of associations assigned to the userId in the URL.
 *
 * GET: /api/associations/:userId
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
    var id = req.params.userId;
    err = new ErrHandler(res);

    DbAuth.getUserAssociations({
        data: { idUser: id },
        done: function(associations) {
            Associations.getInfo({
                data: { associations: associations },
                done: function(rows) {
                    res.send(rows);
                },
                err: err
            })
        },
        err: err
    })
}