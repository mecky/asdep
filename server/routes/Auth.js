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
    var email    = req.body.email;
    var password = req.body.password;
    var err      = new ErrHandler(res);

    log.logInfo(email + "/" + password + " requested authentication.");

    DataValidator.check({
        validationData : {email : email, password : password},
        success : function(){
            DataValidator.dnsCheck({
                url : email.split('@', 2)[1],
                success : function(){
                    DbAuth.login({
                        res : res,
                        data : {
                            email : email,
                            password : password
                        },
                        done : function(result, firstName, roles){
                            if (result){
                                console.log("login successfull");
                                res.send({name: firstName, roles: roles});
                            }else{
                                res.send(400, "Email sau parola invalide");
                            }
                        },
                        err : err
                    });
                },
                failure : function(msg){
                    res.send(400, msg);
                }
            })
        },
        err : err
    })
};

exports.logout = function(req, res) {
    res.send("ok");
};

exports.createUser = function(req, res) {

    var firstName, lastName, phoneNumber, email, password, err;
    err = new ErrHandler(res);

    firstName   = req.body.firstName;
    lastName    = req.body.lastName;
    phoneNumber = req.body.phone;
    email       = req.body.email;
    password    = req.body.password;

    DataValidator.check({
        validationData : {
            firstName   : firstName,
            lastName    : lastName,
            phoneNumber : phoneNumber,
            email       : email,
            password    : password
        },
        success : function() {
            log.logInfo("First Name: " + firstName + "Last Name: " + lastName + "(" + phoneNumber + ") created an account.");
            res.send("OK");
        },
        failure : function() {
            res.send(400, "Invalid email / password.");
        },
        err : err
    });

    res.send(400, "Ceva nu este in regula!");

};

exports.updateUser = function(req, res) {
    res.send("ok");
};

exports.getSessionInfo = function(req, res) {
    res.send({sessionId: "1234", account: {name: "Petru", roles: "admin"}});
};
