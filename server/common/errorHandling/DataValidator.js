/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */

var validator = require('validator');
var dns = require('dns');

var DataValidator = {
    _lengthError : function(filed, min, max){
        return 'Campul ' +  filed +' trebuie sa contina intre ' + min + ' si ' + max + ' caractere';
    },
    _illegalChars : function(field, data){
        return 'Campul ' + field + ' trebuie sa contina doar: ' + data;

    },
    email : function(email){
        if (!validator.isEmail(email, 4, 30)){
            return 'Adresa de email nu este valida'
        }
        return '';
    },
    password : function(password){
        if (!validator.isLength(password, 8, 40)){
            return this._lengthError('parola', 8, 40);
        }
        return '';

    },
    firstName : function(firstName){
        var reg = /[^A-Za-z- ]/;
        if (!validator.isLength(firstName, 3, 20)){
            return this._lengthError('Prenumele', 3, 20);
        }
        if (reg.test(firstName)){
            return this._illegalChars('Prenumele', 'litere');
        }
        return '';
    },
    lastName : function(lastName){
        var reg = /[^A-Za-z- ]/;
        if (!validator.isLength(lastName, 3, 20)){
            return this._lengthError('Numele', 3, 20);
        }
        if (reg.test(lastName)){
            return this._illegalChars('Numele', 'litere');
        }
        return '';
    },
    /**
     * Validate the phone number.
     * @phoneNumber:    - null, 10 digit number or 13 digit number.
     */
    phoneNumber : function(phoneNumber){
        if (phoneNumber) {
            if (!validator.isNumeric(phoneNumber)){
                return this._illegalChars('Numarul de telefon', 'numere');
            }

            if (phoneNumber.length != 10 && phoneNumber != 13){
                return 'Numarul de telefon trebuie sa fie 10 sau 13 cifre (ex: 07XXXXXXXX / 00407XXXXXXXX)'
            }
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
            param.failure('adresa de email nu este valida');
            return;
        }
        param.success();
    });

}

