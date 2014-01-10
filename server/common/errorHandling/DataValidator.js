/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */

var ErrHandler = require('../errorHandling/ErrorHandler');

var validator = require('validator');

var DataValidator = {
    _lengthError : function(filed, min, max){
        return 'campul ' +  filed +' trebuie sa contina intre ' + min + ' si ' + max + ' caractere';
    },
    _illegalChars : function(field, data){
        return 'campul ' + field + ' trebuie sa contina doar:' + data;

    },
    user : function(user){
        if (!validator.isLength(user, 4, 30)){
            return DataValidator._lengthError('utilizator', 4, 30);
        }
        if (!validator.matches(user, /^[a-z0-9_.]+$/i)){
            return this._illegalChars('utilizator', 'litere, cifre, caracterul _ sau .');
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

exports.check = function(param){
    var msg;
    for (var i in param.validationData){
        msg = DataValidator[i](param.validationData[i]);
        if (msg != '') {
            param.error(msg);
            return;
        }
    }
    param.success();
}


