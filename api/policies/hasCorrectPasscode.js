module.exports = function(req, res, next) {
    if (req.body.passcode === "mod86#2014") { // This is VERY UGLY. Needs to be changed for production usage.
        req.body.globaladmin = false;
        delete req.body.passcode;
        next();
    } else if (req.body.passcode === "admin_mod86") {
        req.body.globaladmin = true;
        delete req.body.passcode;
        next();
    } else {
        res.forbidden("For the time being you need an access code to create an account.");
    }
};
