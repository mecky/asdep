/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
var DbAuth = require('../common/dao/DbAuth');
var DataValidator = require('../common/errorHandling/DataValidator');
var ErrHandler = require('../common/errorHandling/ErrorHandler');
var log = require('../common/errorHandling/Loger');


/**
 * Handle user & password validation for login mechanism.
 *
 * POST: /api/login
 *
 * DATA format: {password: "...", email: "you@example.com"}
 *
 * RESPONSE: { "name": "firstName1", "roles": { "admin": true, "tenant": true }}
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
 * Data format: { email: 'you@example.com', lastName: 'a', firstName: 'b', phone: '0727894989', password: 'password1' }
 */
exports.createUser = function(req, res) {
    var err = new ErrHandler(res);

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
            log.logInfo("First Name: " + firstName + "Last Name: " + lastName + "(" + phoneNumber + ") created an account.");
            res.send(200);
        },
        failure : function() {
            res.send(400, "Email / parola invalide.");
        },
        err : err
    });
};

exports.updateUser = function(req, res) {
    res.send(200);
};

exports.getSessionInfo = function(req, res) {
    res.send({sessionId: "1234", account: {name: "Petru", roles: "admin"}});
};
