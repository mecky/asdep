/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
var db_auth = require('../common/dao/db_auth');
var err = require('../common/error_handling/error_handler');
/**
 * To document:
 * - url + query parameters
 * - data format
 * - return format
 * - http headers
 */
exports.login = function(req, res) {
    var user = req.body.name;
    var pass = req.body.pass;

    //TODO data should be validated!
    if (user && pass) {

        db_auth.login(res, user, pass, function(result){
            if (result){
                res.send({sessionId: "1234", account: {name: user, roles: "admin"}});
            }else{
                res.send(400, "Invalid username or password");
            }
        });
    }else{
        err.invalidData('incorrect auth data received from client');
    }
}

exports.logout = function(req, res) {
    res.send("ok");
}

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
}

exports.updateUser = function(req, res) {
    res.send("ok");
}

exports.getSessionInfo = function(req, res) {
    res.send({sessionId: "1234", account: {name: "Petru", roles: "admin"}});
}