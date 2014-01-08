/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */

var log = require('./Loger');

/**
 * Error codes - server errors:
 *  Security errors:
 *    590 - unauthorized request
 *    591 - spam/flood detected
 *    592 - invalid data that should have been validated on the client
 *    593 -
 *  Database errors
 *    580 - database acces failed
 */


/**
 * data contains errors that should have been caught on client side
 */
exports.invalidData = function(res, msg){
    var err = 592;
    log.logWarning(err, msg);
    res.send(err, msg)
};

exports.unauthorizedRequest = function(res, msg){

};

exports.databaseError = function(res, msg){
    var err = 580;
    log.logWarning(err, msg);
    res.send(err, msg)
};
