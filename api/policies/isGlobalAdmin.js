module.exports = function(req, res, next) {
    if (req.user.globaladmin) {
        next();
    } else {
        res.forbidden("You must be an admin to do this.");
    }
};