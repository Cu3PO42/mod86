module.exports = function(req, res, next) {
    req.body.owner = req.user.id;
    if (!req.user.globaladmin) {
        req.body.global = false;
    } else {
        req.body.global = req.body.global || false;
    }
    next();
};