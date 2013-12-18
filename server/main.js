/*jslint node: true */
'use strict';
var express = require('express'),
    auth = require('./routes/auth'),
    news = require('./routes/news'),
    app = express();

var serverRoot = "/api"

app.use(express.bodyParser());

//// Auth
//app.post(serverRoot + '/auth/login', auth.login);
//app.post(serverRoot + '/auth/logout', auth.logout);
//app.put(serverRoot + '/auth/user', auth.createUser);
//app.post(serverRoot + '/auth/user/:id', auth.updateUser);
//
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


app.use(function (req, res) {
    res.json({'ok': false, 'status': '404'});
});


module.exports = app;