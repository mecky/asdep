/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */

var validator = require('validator');
var dns = require('dns');

var DataValidator = {
    _lengthError : function(filed, min, max){
        return 'campul ' +  filed +' trebuie sa contina intre ' + min + ' si ' + max + ' caractere';
    },
    _illegalChars : function(field, data){
        return 'campul ' + field + ' trebuie sa contina doar:' + data;

    },
    email : function(email){
        if (!validator.isEmail(email, 4, 30)){
            return 'adresa de email nu este valida'
        }
        return '';
    },
    pass : function(pass){
        if (!validator.isLength(pass, 8, 40)){
            return this._lengthError('parola', 8, 40);
        }
        return '';
    }
}

/**
 * @param object
 * {
 * validationData : {@key : @value ...},
 * success : @callback = function()
 * err : @ErrorHandler object
 * }
 */
exports.check = function(param){
    var msg;
    for (var i in param.validationData){
        msg = DataValidator[i](param.validationData[i]);
        if (msg != '') {
            param.err.invalidData(msg);
            return;
        }
    }
    param.success();
}

/**
 * @param object
 * {
 * url : @ErrorHandler object
 * validationData : {@key : @value ...},
 * success : @callback = function()
 * err : @ErrorHandler object
 * }
 */
exports.dnsCheck = function(param){
    dns.resolve4(param.url, function (err) {
        if (err) {
            param.fail('adresa de email nu este valida');
            return;
        }
        param.success();
    });

}

