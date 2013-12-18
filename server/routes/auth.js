/**
 * To document:
 * - url + query parameters
 * - data format
 * - return format
 * - http headers
 */
exports.login = function(req, res) {
    var user = req.body.user;
    var pass = req.body.pass;

    console.log(req.body);
    res.send("ok");
}