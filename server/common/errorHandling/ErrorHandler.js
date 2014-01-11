/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */

var log = require('./Loger');

module.exports = ErrorHandler;

function ErrorHandler(res){
    this._res = res;
};

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
ErrorHandler.prototype.invalidData = function(msg){
    var err = 400;
    log.logError(err, msg);
    this._res.send(err, msg)
};

/*
currently not used, but will be for sure :)
ErrorHandler.prototype.unauthorizedRequest = function(msg){
    this._res.send(400, msg);
};*/

ErrorHandler.prototype.databaseError = function(msg){
    var err = 400;
    log.logWarning(err, msg);
    this._res.send(err, msg)
};
