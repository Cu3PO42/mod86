module.exports = function(req, res, next) {
    if (req.user.globaladmin || req.user.id == req.params.id) {
        next();
    } else {
        res.forbidden("You need to be an admin to perform this action on other users.");
    }
};