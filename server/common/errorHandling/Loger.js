/**
 * Copyright (C) 2014 creatdenoi.ro, All Rights Reserved
 */

/*
 var logLevels = {
 1 : 'info',
 2 : 'warning',
 3 : 'error'
 }
 */

var logLevel = 1;

exports.logError = function(err, msg){
    console.log("ERROR: "  + err + ' - ' + msg);
};

exports.logWarning = function(err, msg){
    if (logLevel <= 2){
        console.log("WARNING: "  + err + ' - ' + msg);
    }
};

exports.logInfo = function(msg){
    if (logLevel <= 1){
        console.log("INFO: "  + msg);
    }
};