/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
var DbAuth = require('../common/dao/DbAuth');
var DataValidator = require('../common/errorHandling/DataValidator');
var log = require('../common/errorHandling/Loger');


/**
 * Handle user & password validation for login mechanism.
 *
 * POST: /api/login
 *
 * DATA format: {password: @password, email: @email}
 *
 * RESPONSE: {name: @firstName, roles: { admin: boolean, tenant: boolean }}
 */
exports.login = function(req, res) {
    var email    = req.body.email;
    var password = req.body.password;

    log.logInfo(email + "/" + password + " requested authentication.");

    DataValidator.check({
        validationData : {email : email, password : password},
        success : function(){
            DataValidator.dnsCheck({
                failure : function(msg){
                    res.send(400, msg);
                },
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
                        err : res.errHandler
                    });
                }
            })
        },
        err : res.errHandler
    })
};
/**
 * Handle logout request.
 */
exports.logout = function(req, res) {
    res.send("ok");
};
/**
 * Handle new user creation.
 *
 * PUT: /api/auth/user
 *
 * Data format: { email : @email, lastName : @lastName, firstName: @firstName, phone: @phoneNumber, password: @password }
 */
exports.createUser = function(req, res) {
    var firstName   = req.body.firstName;
    var lastName    = req.body.lastName;
    var phoneNumber = req.body.phone;
    var email       = req.body.email;
    var password    = req.body.password;

    DataValidator.check({
        validationData : {
            firstName   : firstName,
            lastName    : lastName,
            phoneNumber : phoneNumber,
            email       : email,
            password    : password
        },
        success : function() {
            DataValidator.dnsCheck({
                url : email.split('@', 2)[1],
                success : function(){
                    log.logInfo("First Name: " + firstName + "Last Name: " + lastName + "(" + phoneNumber + ") created an account.");
                    res.send(200);
                },
                failure : function(msg){
                    res.send(400, msg);
                }
            });
        },
        err : res.errHandler
    });
};

exports.updateUser = function(req, res) {
    res.send(200);
};

exports.getSessionInfo = function(req, res) {
    res.send({sessionId: "1234", account: {name: "Petru", roles: "admin"}});
};
