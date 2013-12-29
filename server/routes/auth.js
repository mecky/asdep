/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */
var Dao = require('../common/dao/dao.js');
/**
 * To document:
 * - url + query parameters
 * - data format
 * - return format
 * - http headers
 */

var databaseAcces = new Dao({database : 'general'});

exports.login = function(req, res) {
    var user = req.body.name;
    var pass = req.body.pass;

    // validate the body
    if (user && pass) {

        var query = 'select COUNT(*) as exist from `user` where `username`=\'' + user + '\' and `password`=\'' + pass + '\'';
        databaseAcces.query(res, query, function(rows){
            if (rows[0].exist !== 0 ){
                console.log('logged');
                res.send({sessionId: "1234", account: {name: user, roles: "admin"}});
            }else {
                console.log('login failed');
                res.send(400, "Invalid username or password");
            }
        });
    }else{
        res.send(400, "Invalid username or password");
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