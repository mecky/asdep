/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
var DbAuth = require('../common/dao/DbAuth');
var DataValidator = require('../common/errorHandling/DataValidator');
var ErrHandler = require('../common/errorHandling/ErrorHandler');
var log = require('../common/errorHandling/Loger');
/**
 * To document:
 * - url + query parameters
 * - data format
 * - return format
 * - http headers
 */
exports.login = function(req, res) {
    var user, pass;
    user = req.body.name;
    pass = req.body.pass;

    log.logInfo(user + " requested authentication.");

    DataValidator.check({
        validationData : {user : user, pass : pass},
        success : function(){
            DbAuth.login({
                res : res,
                data : {
                    user : user,
                    pass : pass
                },
                done : function(result){
                    if (result){
                        res.send({sessionId: "1234", account: {name: user, roles: "admin"}});
                    }else{
                        res.send(400, "Invalid username or password");
                    }
                }
            });
        },
        error: function(msg) {
            ErrHandler.invalidData(res, msg);
        }
    })
};

exports.logout = function(req, res) {
    res.send("ok");
};

exports.createUser = function(req, res) {
    // validate body
    if(req.body.firstName &&
        req.body.lastName &&
        req.body.phone &&
        req.body.password &&
        req.body.email &&
        req.body.username) {
        console.log(req.body);
        res.send("ok");
    } else {
        res.send(400, "Invalid username or password");
    }
};

exports.updateUser = function(req, res) {
    res.send("ok");
};

exports.getSessionInfo = function(req, res) {
    res.send({sessionId: "1234", account: {name: "Petru", roles: "admin"}});
};