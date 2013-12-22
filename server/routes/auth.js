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

    // validate the body
    if (user && pass) {
        console.log(req.body);
        res.send("ok");
    } else {
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