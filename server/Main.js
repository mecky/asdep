/*jslint node: true */
'use strict';
var express = require('express'),
    Auth = require('./routes/Auth'),
    //  news = require('./routes/News'),
//    validator = require('./common/dataValidation/Validator');
    app = express();

var serverRoot = "/api";

app.use(express.json());
app.use(express.urlencoded());
//TODO introduce auth manager middleware function
/*
app.use(function(req, res, next){
    console.log("!!middleware function");
    next();
});
*/

// Auth
//public
app.post(serverRoot + '/auth/login', Auth.login);
app.post(serverRoot + '/auth/logout', Auth.logout);


app.put(serverRoot + '/auth/user', Auth.createUser);
app.post(serverRoot + '/auth/user/:id', Auth.updateUser);
app.get(serverRoot + "/auth/:sessionId", Auth.getSessionInfo)
////News
//// get will take into account the user rights and will return the list
//// of news from all the associations he belongs to
//app.get(serverRoot + "/news", news.getAll);
//app.get(serverRoot + "/news/:id", news.getNews);
//// Create, update and delete will be made on a specific association
//app.put(serverRoot + "/association/:asId/news", news.createNews);
//app.post(serverRoot + "/association/:asId/news/:id", news.updateNews);
//app.delete(serverRoot + "/association/:asId/news/:id", news.deleteNews);
//
//// Meters
//app.put(serverRoot + "/association/:asId/meter", meters.createMeter);
//app.delete(serverRoot + "/association/:asId/meter/:id", meters.deleteMeter);
//app.post(serverRoot + "/association/:asId/meter/:id", meters.updateMeter);
//// this will receive a list containing meter id and new index
//app.post(serverRoot + "/association/:asId/meterIndex", meters.updateAllMetersIndex);
//
//app.get(serverRoot + "/meter", meters.getAllMeters);
//app.get(serverRoot + "/association/:id/block/:id/entrance/:id/appartment/:id/meter", meters.getAppartmentMeters);
//app.get(serverRoot + "/association/:id/block/:id/entrance/:id/meter", meters.getEntranceMeters);
//
//// Tickets
//app.get(serverRoot + "/ticket", tickets.getAllTickets);
//app.get(serverRoot + "/ticket/:id", tickets.getTicket);
//app.put(serverRoot + "/association/:id/ticket", tickets.createTicket);
//app.delete(serverRoot + "/association/:id/ticket/:ticketId", tickets.deleteTicket);
//app.post(serverRoot + "/association/:id/ticket/:ticketId", tickets.modifyTicket);


module.exports = app;