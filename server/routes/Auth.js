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
    var email, pass, err;
    email = req.body.email;
    pass = req.body.pass;
    err = new ErrHandler(res);

    log.logInfo(email + " requested authentication.");

    DataValidator.check({
        validationData : {email : email, pass : pass},
        success : function(){
            DataValidator.dnsCheck({
                url : email.split('@', 2)[1],
                success : function(){
                    DbAuth.login({
                        res : res,
                        data : {
                            email : email,
                            pass : pass
                        },
                        done : function(result, firstName){
                            if (result){
                                res.send({sessionId: "1234", account: {name: firstName, roles: "admin"}});
                            }else{
                                res.send(400, "Email sau parola invalide");
                            }
                        },
                        err : err
                    });
                },
                err : err
            })
        },
        err : err
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